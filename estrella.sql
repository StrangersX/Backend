-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2021 a las 16:54:02
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estrella`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detecta`
--

CREATE TABLE `detecta` (
  `idTipo` int(11) NOT NULL,
  `detectaTipo` text COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detecta`
--

INSERT INTO `detecta` (`idTipo`, `detectaTipo`) VALUES
(1, 'naves_Enemigas'),
(2, 'averías_en_los_sensores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nave`
--

CREATE TABLE `nave` (
  `idNav` int(1) NOT NULL COMMENT 'identificador nave',
  `tipNave` text COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'tipo de nave'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tipos de nave';

--
-- Volcado de datos para la tabla `nave`
--

INSERT INTO `nave` (`idNav`, `tipNave`) VALUES
(1, 'Starfighter'),
(2, 'Bomber'),
(3, 'Scout vessel'),
(4, 'Gunship');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensor1`
--

CREATE TABLE `sensor1` (
  `id` bigint(20) NOT NULL COMMENT 'hace referencia al numero asignado automaticamente por orden de ingreso',
  `valorSensor` int(4) DEFAULT NULL COMMENT 'Hace referencia al valor indicado por el sistema y el cual es medible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempo`
--

CREATE TABLE `tiempo` (
  `idTime` bigint(20) NOT NULL COMMENT 'hace referencia al numero de tiempo almacenado automaticamente por el sistema',
  `time` timestamp NULL DEFAULT NULL COMMENT 'hace referencia al numero generado por el sistema al ocurrir un evento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detecta`
--
ALTER TABLE `detecta`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `nave`
--
ALTER TABLE `nave`
  ADD PRIMARY KEY (`idNav`);

--
-- Indices de la tabla `sensor1`
--
ALTER TABLE `sensor1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiempo`
--
ALTER TABLE `tiempo`
  ADD PRIMARY KEY (`idTime`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detecta`
--
ALTER TABLE `detecta`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `nave`
--
ALTER TABLE `nave`
  MODIFY `idNav` int(1) NOT NULL AUTO_INCREMENT COMMENT 'identificador nave', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sensor1`
--
ALTER TABLE `sensor1`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'hace referencia al numero asignado automaticamente por orden de ingreso';

--
-- AUTO_INCREMENT de la tabla `tiempo`
--
ALTER TABLE `tiempo`
  MODIFY `idTime` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'hace referencia al numero de tiempo almacenado automaticamente por el sistema';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
