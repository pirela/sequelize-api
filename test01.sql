-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-01-2021 a las 08:56:14
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test01`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `createdUsu` varchar(255) NOT NULL,
  `updatedUsu` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre`, `createdUsu`, `updatedUsu`, `createdAt`, `updatedAt`) VALUES
('1', 'Venezuela', '', '', '2021-01-14 06:57:07', '2021-01-14 06:57:07'),
('2', 'Mexico', '', '', '2021-01-14 06:57:07', '2021-01-14 06:57:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `idPais` varchar(255) NOT NULL,
  `createdUsu` varchar(255) NOT NULL,
  `updatedUsu` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `email`, `clave`, `idPais`, `createdUsu`, `updatedUsu`, `createdAt`, `updatedAt`) VALUES
('1', 'Jose', 'Pirela', 'jjpirela93@gmail.com', '123', '1', '', '', '2021-01-14 06:55:29', '2021-01-14 07:41:36'),
('2', 'Vanessa', 'Riera', 'vanessa@gmail.com', '123', '2', '', '', '2021-01-14 06:56:52', '2021-01-14 06:57:13'),
('3', 'Carlos', 'Boscan', 'carlos@gmail.com', '123', '1', '', '', '2021-01-14 06:56:52', '2021-01-14 07:41:28'),
('4', 'Andrea', 'Labarca', 'andrea@gmail.com', '123', '2', '', '', '2021-01-14 06:56:52', '2021-01-14 06:57:15'),
('5', 'Jesus', 'Fuenmayor', 'jesus@gmail.com', '123', '1', '', '', '2021-01-14 06:56:52', '2021-01-14 06:56:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `id` varchar(255) NOT NULL,
  `idPersona` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `createdUsu` varchar(255) NOT NULL,
  `updatedUsu` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`id`, `idPersona`, `telefono`, `createdUsu`, `updatedUsu`, `createdAt`, `updatedAt`) VALUES
('1', '1', '123', '', '', '2021-01-14 07:39:46', '2021-01-14 07:39:46'),
('10', '3', '1231111', '', '', '2021-01-14 07:40:54', '2021-01-14 07:40:54'),
('11', '5', '010101', '', '', '2021-01-14 07:40:54', '2021-01-14 07:40:54'),
('2', '1', '321', '', '', '2021-01-14 07:39:46', '2021-01-14 07:39:46'),
('3', '1', '1234', '', '', '2021-01-14 07:40:54', '2021-01-14 07:40:54'),
('4', '1', '12355', '', '', '2021-01-14 07:40:54', '2021-01-14 07:40:54'),
('5', '2', '12366', '', '', '2021-01-14 07:40:54', '2021-01-14 07:40:54'),
('6', '3', '12377', '', '', '2021-01-14 07:40:54', '2021-01-14 07:40:54'),
('7', '4', '12388', '', '', '2021-01-14 07:40:54', '2021-01-14 07:40:54'),
('8', '4', '123999', '', '', '2021-01-14 07:40:54', '2021-01-14 07:40:54'),
('9', '2', '1231010', '', '', '2021-01-14 07:40:54', '2021-01-14 07:40:54');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
