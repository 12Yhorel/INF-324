-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-05-2024 a las 22:55:07
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdyhorel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_bancarias`
--

CREATE TABLE `cuentas_bancarias` (
  `id` int(11) NOT NULL,
  `id_tipo_cuenta` int(11) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `id_persona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas_bancarias`
--

INSERT INTO `cuentas_bancarias` (`id`, `id_tipo_cuenta`, `saldo`, `id_persona`) VALUES
(1, 1, 1500.00, 1),
(2, 2, 3000.00, 2),
(3, 1, 2000.00, 3),
(4, 2, 5000.00, 4),
(5, 3, 10000.00, 5),
(6, 1, 2500.00, 6),
(7, 2, 4000.00, 7),
(8, 3, 8000.00, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `apellido`) VALUES
(1, 'Juan', 'Pérez'),
(2, 'María', 'González'),
(3, 'Pedro', 'López'),
(4, 'Ana', 'Martínez'),
(5, 'Luis', 'Rodríguez'),
(6, 'Laura', 'Sánchez'),
(7, 'Carlos', 'Díaz'),
(8, 'Sofía', 'Fernández');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_cuentas`
--

CREATE TABLE `tipos_cuentas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_cuentas`
--

INSERT INTO `tipos_cuentas` (`id`, `nombre`) VALUES
(1, 'Cuenta Corriente'),
(2, 'Cuenta de Ahorros'),
(3, 'Cuenta Premium');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id` int(11) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `tipo_transaccion` varchar(50) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`id`, `id_cuenta`, `tipo_transaccion`, `monto`, `fecha`) VALUES
(1, 1, 'Depósito', 500.00, '2024-05-01 14:25:44'),
(2, 2, 'Retiro', 200.00, '2024-05-01 14:25:44'),
(3, 3, 'Depósito', 1000.00, '2024-05-01 14:25:44'),
(4, 4, 'Transferencia', 300.00, '2024-05-01 14:25:44'),
(5, 5, 'Depósito', 1500.00, '2024-05-01 14:25:44'),
(6, 6, 'Retiro', 100.00, '2024-05-01 14:25:44'),
(7, 7, 'Transferencia', 500.00, '2024-05-01 14:25:44'),
(8, 8, 'Depósito', 2000.00, '2024-05-01 14:25:44');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_cuenta` (`id_tipo_cuenta`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_cuentas`
--
ALTER TABLE `tipos_cuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cuenta` (`id_cuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipos_cuentas`
--
ALTER TABLE `tipos_cuentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  ADD CONSTRAINT `cuentas_bancarias_ibfk_1` FOREIGN KEY (`id_tipo_cuenta`) REFERENCES `tipos_cuentas` (`id`),
  ADD CONSTRAINT `cuentas_bancarias_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas_bancarias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
