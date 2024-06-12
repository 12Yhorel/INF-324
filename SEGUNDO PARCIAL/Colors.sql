-- Backup SQL generado por phpMyAdmin
-- Version: 5.2.1
-- Sitio: https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Fecha y Hora de generación: 12-06-2024 13:10:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Configuración de caracteres
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Base de Datos: colores
--

-- -----------------------------
-- Estructura de la tabla 'textura'
-- -----------------------------
CREATE TABLE `textura` (
  `id` INT(11) NOT NULL,
  `descripcion_origen` VARCHAR(255) NOT NULL,
  `cR_origen` INT(11) NOT NULL,
  `cG_origen` INT(11) NOT NULL,
  `cB_origen` INT(11) NOT NULL,
  `hex_origen` VARCHAR(7) NOT NULL,
  `descripcion_destino` VARCHAR(255) NOT NULL,
  `cR_destino` INT(11) NOT NULL,
  `cG_destino` INT(11) NOT NULL,
  `cB_destino` INT(11) NOT NULL,
  `hex_destino` VARCHAR(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- -----------------------------
-- Volcado de datos en la tabla 'textura'
-- -----------------------------
INSERT INTO `textura` (`id`, `descripcion_origen`, `cR_origen`, `cG_origen`, `cB_origen`, `hex_origen`, `descripcion_destino`, `cR_destino`, `cG_destino`, `cB_destino`, `hex_destino`) VALUES
(1, 'Ceniza', 150, 150, 150, '#969696', 'Ceniza Claro', 200, 200, 200, '#C8C8C8'),
(2, 'Violeta', 138, 43, 226, '#8A2BE2', 'Violeta Claro', 147, 112, 219, '#9370DB'),
(3, 'Marrón', 139, 69, 19, '#8B4513', 'Marrón Claro', 210, 105, 30, '#D2691E'),
(4, 'Coral', 255, 127, 80, '#FF7F50', 'Coral Claro', 255, 160, 122, '#FFA07A'),
(5, 'Teal', 0, 128, 128, '#008080', 'Teal Claro', 32, 178, 170, '#20B2AA'),
(6, 'Magenta', 255, 0, 255, '#FF00FF', 'Magenta Claro', 255, 105, 180, '#FF69B4'),
(7, 'Champaña', 250, 235, 215, '#FAEBD7', 'Champaña Claro', 255, 239, 213, '#FFEFD5'),
(8, 'Aguacate', 86, 130, 3, '#568203', 'Aguacate Claro', 128, 170, 48, '#80AA30'),
(9, 'Bronce', 205, 127, 50, '#CD7F32', 'Bronce Claro', 218, 165, 32, '#DAA520'),
(10, 'Verde Musgo', 173, 223, 173, '#ADDFAD', 'Verde Musgo Claro', 197, 225, 197, '#C5E1C5'),
(11, 'Azul Marino', 0, 0, 128, '#000080', 'Azul Marino Claro', 100, 149, 237, '#6495ED'),
(12, 'Durazno', 255, 218, 185, '#FFDAB9', 'Durazno Claro', 255, 228, 196, '#FFE4C4'),
(13, 'Zafiro', 15, 82, 186, '#0F52BA', 'Zafiro Claro', 70, 130, 180, '#4682B4'),
(14, 'Esmeralda', 80, 200, 120, '#50C878', 'Esmeralda Claro', 144, 238, 144, '#90EE90'),
(15, 'Salmón', 250, 128, 114, '#FA8072', 'Salmón Claro', 255, 160, 122, '#FFA07A'),
(16, 'Rojo Indio', 205, 92, 92, '#CD5C5C', 'Rojo Indio Claro', 240, 128, 128, '#F08080'),
(17, 'Azul Oscuro', 0, 0, 139, '#00008B', 'Azul Oscuro Claro', 0, 0, 205, '#0000CD'),
(18, 'Oro', 255, 215, 0, '#FFD700', 'Oro Claro', 255, 223, 0, '#FFDF00'),
(19, 'Rosado', 255, 192, 203, '#FFC0CB', 'Rosado Claro', 255, 182, 193, '#FFB6C1'),
(20, 'Verde Bosque', 34, 139, 34, '#228B22', 'Verde Bosque Claro', 46, 139, 87, '#2E8B57'),
(21, 'Mandarina', 255, 117, 24, '#FF7518', 'Mandarina Claro', 255, 140, 0, '#FF8C00'),
(22, 'Carbón', 54, 69, 79, '#36454F', 'Gris Medio', 128, 128, 128, '#808080'),
(23, 'Calabaza', 255, 117, 24, '#FF7518', 'Rojo Anaranjado', 255, 69, 0, '#FF4500'),
(24, 'Chocolate', 210, 105, 30, '#D2691E', 'Verde Oliva', 85, 107, 47, '#556B2F');

-- -----------------------------
-- Indices de la tabla 'textura'
-- -----------------------------
ALTER TABLE `textura`
  ADD PRIMARY KEY (`id`);

-- -----------------------------
-- AUTO_INCREMENT para la tabla 'textura'
-- -----------------------------
ALTER TABLE `textura`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

-- Restaurar configuración de caracteres
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
