<?php
// Paso 1: Conectar a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$database = "bdyhorel";

$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Paso 2: Mostrar información de personas
$sql_personas = "SELECT id, nombre, apellido, estado FROM personas";
$result_personas = $conn->query($sql_personas);

if ($result_personas->num_rows > 0) {
    echo "<h2>Lista de Personas del banco</h2>";
    echo "<ul>";
    while($row = $result_personas->fetch_assoc()) {
        echo "<li>".$row["nombre"]." ".$row["apellido"]." - Estado: ".$row["estado"];
        echo "<form method='post' action='".htmlspecialchars($_SERVER["PHP_SELF"])."'>";
        echo "<input type='hidden' name='persona_id' value='".$row["id"]."'>";
        echo "<input type='submit' name='alta_persona' value='Alta'>";
        echo "<input type='submit' name='baja_persona' value='Baja'>";
        echo "<input type='submit' name='cambio_persona' value='Cambio'>";
        echo "<input type='submit' name='eliminar_persona' value='Eliminar'>";
        echo "</form>";
        echo "</li>";
    }
    echo "</ul>";
} else {
    echo "No hay personas en la base de datos.";
}

// Paso 3: Procesar acciones (Alta, Baja, Cambio, Eliminar) para personas
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_POST["alta_persona"])) {
        // Lógica para realizar la acción de Alta para persona
        $persona_id = $_POST["persona_id"];
        $sql_alta_persona = "UPDATE personas SET estado = 'activo' WHERE id = $persona_id";
        if ($conn->query($sql_alta_persona) === TRUE) {
            echo "Se realizó la acción de Alta para la persona con ID: $persona_id";
        } else {
            echo "Error al realizar la acción de Alta para la persona: " . $conn->error;
        }
    } elseif(isset($_POST["baja_persona"])) {
        // Lógica para realizar la acción de Baja para persona
        $persona_id = $_POST["persona_id"];
        $sql_baja_persona = "UPDATE personas SET estado = 'inactivo' WHERE id = $persona_id";
        if ($conn->query($sql_baja_persona) === TRUE) {
            echo "Se realizó la acción de Baja para la persona con ID: $persona_id";
        } else {
            echo "Error al realizar la acción de Baja para la persona: " . $conn->error;
        }
    } elseif(isset($_POST["cambio_persona"])) {
        // Lógica para realizar la acción de Cambio para persona
        $persona_id = $_POST["persona_id"];
        // Agregar aquí la lógica para el cambio de estado de la persona si es necesario
    } elseif(isset($_POST["eliminar_persona"])) {
        // Lógica para realizar la acción de Eliminar para persona
        $persona_id = $_POST["persona_id"];
        $sql_eliminar_persona = "DELETE FROM personas WHERE id = $persona_id";
        if ($conn->query($sql_eliminar_persona) === TRUE) {
            echo "Se eliminó la persona con ID: $persona_id";
        } else {
            echo "Error al eliminar la persona: " . $conn->error;
        }
    }
}


// Paso 4: Mostrar información de cuentas bancarias
$sql_cuentas = "SELECT c.id, tc.nombre AS tipo_cuenta, c.saldo, c.id AS numero_cuenta, CONCAT(p.nombre, ' ', p.apellido) AS titular, c.estado
                FROM cuentas_bancarias c
                INNER JOIN tipos_cuentas tc ON c.id_tipo_cuenta = tc.id
                INNER JOIN personas p ON c.id_persona = p.id";
$result_cuentas = $conn->query($sql_cuentas);

if ($result_cuentas->num_rows > 0) {
    echo "<h2>Lista de Cuentas Bancarias</h2>";
    echo "<table border='1'>";
    echo "<tr>
            <th>Tipo de Cuenta</th>
            <th>Saldo</th>
            <th>Número de Cuenta</th>
            <th>Titular</th>
            <th>Estado</th>
            <th>Acciones</th>
          </tr>";
    while($row = $result_cuentas->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row["tipo_cuenta"]."</td>";
        echo "<td>".$row["saldo"]."</td>";
        echo "<td>".$row["numero_cuenta"]."</td>";
        echo "<td>".$row["titular"]."</td>";
        echo "<td>".$row["estado"]."</td>";
        echo "<td>";
        echo "<form method='post' action='".htmlspecialchars($_SERVER["PHP_SELF"])."'>";
        echo "<input type='hidden' name='cuenta_id' value='".$row["id"]."'>";
        echo "<input type='submit' name='alta_cuenta' value='Alta'>";
        echo "<input type='submit' name='baja_cuenta' value='Baja'>";
        echo "<input type='submit' name='cambio_cuenta' value='Cambio'>";
        echo "<input type='submit' name='eliminar_cuenta' value='Eliminar'>";
        echo "</form>";
        echo "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "No hay cuentas bancarias en la base de datos.";
}

// Paso 5: Procesar acciones (Alta, Baja, Cambio, Eliminar) para cuentas bancarias
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_POST["alta_cuenta"])) {
        // Lógica para realizar la acción de Alta para cuenta bancaria
        $cuenta_id = $_POST["cuenta_id"];
        $sql_alta_cuenta = "UPDATE cuentas_bancarias SET estado = 'activo' WHERE id = $cuenta_id";
        if ($conn->query($sql_alta_cuenta) === TRUE) {
            echo "Se realizó la acción de Alta para la cuenta con ID: $cuenta_id";
        } else {
            echo "Error al realizar la acción de Alta para la cuenta: " . $conn->error;
        }
    } elseif(isset($_POST["baja_cuenta"])) {
        // Lógica para realizar la acción de Baja para cuenta bancaria
        $cuenta_id = $_POST["cuenta_id"];
        $sql_baja_cuenta = "UPDATE cuentas_bancarias SET estado = 'inactivo' WHERE id = $cuenta_id";
        if ($conn->query($sql_baja_cuenta) === TRUE) {
            echo "Se realizó la acción de Baja para la cuenta con ID: $cuenta_id";
        } else {
            echo "Error al realizar la acción de Baja para la cuenta: " . $conn->error;
        }
    } elseif(isset($_POST["cambio_cuenta"])) {
        $cuenta_id = $_POST["cuenta_id"];
        // Mostrar un cuadro de diálogo para solicitar los nuevos datos
        echo "<script>";
        echo "var nuevoSaldo = prompt('Ingrese el nuevo saldo para la cuenta con ID $cuenta_id:');";
        echo "if (nuevoSaldo !== null) {";
        echo "  document.getElementById('nuevo_saldo_$cuenta_id').value = nuevoSaldo;";
        echo "  document.getElementById('form_cambio_$cuenta_id').submit();"; // Enviar el formulario automáticamente
        echo "}";
        echo "</script>";
        
    } elseif(isset($_POST["eliminar_cuenta"])) {
        // Lógica para realizar la acción de Eliminar para cuenta bancaria
        $cuenta_id = $_POST["cuenta_id"];
        $sql_eliminar_cuenta = "DELETE FROM cuentas_bancarias WHERE id = $cuenta_id";
        if ($conn->query($sql_eliminar_cuenta) === TRUE) {
            echo "Se eliminó la cuenta con ID: $cuenta_id";
        } else {
            echo "Error al eliminar la cuenta: " . $conn->error;
        }
    }
}


$conn->close();
?>
