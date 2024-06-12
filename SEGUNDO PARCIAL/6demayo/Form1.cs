using MySqlConnector;
using System.Data;
using System.Drawing;

namespace ImageTextureAnalyzer
{
    public partial class Form1 : Form
    {
        private int avgRed, avgGreen, avgBlue;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter = "Image Files (*.jpg)|*.jpg";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                Bitmap bitmap = new Bitmap(openFileDialog1.FileName);
                pictureBox1.Image = bitmap;
            }
        }

        private void pictureBox1_MouseClick(object sender, MouseEventArgs e)
        {
            if (pictureBox1.Image == null) return;

            Bitmap bitmap = new Bitmap(pictureBox1.Image);
            Color pixelColor = bitmap.GetPixel(e.X, e.Y);

            int sumRed = 0, sumGreen = 0, sumBlue = 0;

            for (int x = e.X; x < e.X + 10 && x < bitmap.Width; x++)
            {
                for (int y = e.Y; y < e.Y + 10 && y < bitmap.Height; y++)
                {
                    pixelColor = bitmap.GetPixel(x, y);
                    sumRed += pixelColor.R;
                    sumGreen += pixelColor.G;
                    sumBlue += pixelColor.B;
                }
            }

            avgRed = sumRed / 100;
            avgGreen = sumGreen / 100;
            avgBlue = sumBlue / 100;

            textBox1.Text = avgRed.ToString();
            textBox2.Text = avgGreen.ToString();
            textBox3.Text = avgBlue.ToString();

            string hexColor = ColorTranslator.ToHtml(Color.FromArgb(avgRed, avgGreen, avgBlue)).Substring(1);
            textBox5.Text = hexColor;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (pictureBox1.Image == null) return;

            Bitmap bitmap = new Bitmap(pictureBox1.Image);
            MySqlConnection connection = OpenDatabaseConnection();

            if (connection != null && connection.State == ConnectionState.Open)
            {
                try
                {
                    string query = "SELECT * FROM textura";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        bool isModified = false;
                        string changes = string.Empty;

                        while (reader.Read())
                        {
                            var origen = new { R = reader.GetInt32("cR_origen"), G = reader.GetInt32("cG_origen"), B = reader.GetInt32("cB_origen") };
                            var destino = Color.FromArgb(reader.GetInt32("cR_destino"), reader.GetInt32("cG_destino"), reader.GetInt32("cB_destino"));

                            for (int i = 0; i < bitmap.Width; i++)
                            {
                                for (int j = 0; j < bitmap.Height; j++)
                                {
                                    Color color = bitmap.GetPixel(i, j);
                                    if (Math.Abs(color.R - origen.R) <= 30 && Math.Abs(color.G - origen.G) <= 30 && Math.abs(color.B - origen.B) <= 30)
                                    {
                                        bitmap.SetPixel(i, j, destino);
                                        isModified = true;
                                    }
                                }
                            }

                            if (isModified)
                            {
                                changes += $"{reader.GetString("descripcion_origen")} -> {reader.GetString("descripcion_destino")}\n";
                            }
                        }

                        MessageBox.Show(isModified ? $"Se han realizado cambios en la imagen:\n{changes}" : "No hay coincidencias en la base de datos");
                    }

                    connection.Close();
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show($"Error al ejecutar la consulta: {ex.Message}");
                }
            }

            pictureBox1.Image = bitmap;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (pictureBox1.Image == null) return;

            Bitmap bitmap = new Bitmap(pictureBox1.Image);
            MySqlConnection connection = OpenDatabaseConnection();

            if (connection != null && connection.State == ConnectionState.Open)
            {
                try
                {
                    string query = "SELECT * FROM textura";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        bool isModified = false;
                        string changes = string.Empty;

                        while (reader.Read())
                        {
                            var origen = new { R = reader.GetInt32("cR_origen"), G = reader.GetInt32("cG_origen"), B = reader.GetInt32("cB_origen") };
                            var destino = Color.FromArgb(reader.GetInt32("cR_destino"), reader.GetInt32("cG_destino"), reader.GetInt32("cB_destino"));

                            for (int i = 0; i < bitmap.Width - 10; i += 10)
                            {
                                for (int j = 0; j < bitmap.Height - 10; j += 10)
                                {
                                    int sumR = 0, sumG = 0, sumB = 0;

                                    for (int x = i; x < i + 10; x++)
                                    {
                                        for (int y = j; y < j + 10; y++)
                                        {
                                            Color color = bitmap.GetPixel(x, y);
                                            sumR += color.R;
                                            sumG += color.G;
                                            sumB += color.B;
                                        }
                                    }

                                    int avgR = sumR / 100;
                                    int avgG = sumG / 100;
                                    int avgB = sumB / 100;

                                    if (Math.Abs(avgR - origen.R) <= 20 && Math.Abs(avgG - origen.G) <= 20 && Math.Abs(avgB - origen.B) <= 20)
                                    {
                                        for (int x = i; x < i + 10; x++)
                                        {
                                            for (int y = j; y < j + 10; y++)
                                            {
                                                bitmap.SetPixel(x, y, destino);
                                            }
                                        }

                                        isModified = true;
                                    }
                                }
                            }

                            if (isModified)
                            {
                                changes += $"{reader.GetString("descripcion_origen")} -> {reader.GetString("descripcion_destino")}\n";
                            }
                        }

                        MessageBox.Show(isModified ? $"Se han realizado cambios en la imagen en texturas 10x10 px:\n{changes}" : "No hay coincidencias en la base de datos");
                    }

                    connection.Close();
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show($"Error al ejecutar la consulta: {ex.Message}");
                }
            }

            pictureBox1.Image = bitmap;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            MySqlConnection connection = OpenDatabaseConnection();

            if (connection != null && connection.State == ConnectionState.Open)
            {
                try
                {
                    MessageBox.Show("Conexión establecida con éxito.");
                    string query = "SELECT * FROM textura";

                    MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    dataGridView1.DataSource = dataTable;
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show($"Error al conectar a la base de datos: {ex.Message}");
                }
                finally
                {
                    connection.Close();
                }
            }
            else
            {
                MessageBox.Show("No se pudo abrir la conexión a la base de datos.");
            }
        }

        private MySqlConnection OpenDatabaseConnection()
        {
            string connectionString = "server=localhost;user=root;password=;database=colores";
            MySqlConnection connection = new MySqlConnection(connectionString);

            try
            {
                connection.Open();
            }
            catch (MySqlException ex)
            {
                MessageBox.Show($"Error al conectar a la base de datos: {ex.Message}");
                return null;
            }

            return connection;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Implementación vacía según los comentarios proporcionados
        }

        private void label4_Click(object sender, EventArgs e)
        {
            // Implementación vacía según los comentarios proporcionados
        }
    }
}
