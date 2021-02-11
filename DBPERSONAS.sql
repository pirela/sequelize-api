-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-02-2021 a las 13:51:17
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wwjoye_test`
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
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  `identificacion` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `idPais` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `createdUsu` varchar(255) NOT NULL,
  `updatedUsu` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `identificacion`, `nombre`, `apellido`, `email`, `genero`, `clave`, `idPais`, `img`, `createdUsu`, `updatedUsu`, `createdAt`, `updatedAt`) VALUES
('1', '20862642', 'José', 'Pirelas', 'jjpirela93@gmail.com', 'Femenino', '123', '1', 'https://randomuser.me/api/portraits/men/1.jpg', '', '', '2021-01-14 06:55:29', '2021-02-11 16:21:08'),
('2', '2', 'Vanessa', 'Riera', 'vanessa@gmail.com', 'Femenino', '123', '2', 'https://randomuser.me/api/portraits/women/2.jpg', '', '', '2021-01-14 06:56:52', '2021-02-10 19:12:21'),
('478d91c7-36ba-4579-800e-d0354af4d06f', '000999888', 'Ricardo', 'Perez', 'ricardo@gmail.com', 'Masculino', '', '', 'https://randomuser.me/api/portraits/men/50.jpg', '', '', '2021-02-10 17:20:10', '2021-02-10 19:07:53'),
('54c13645-f7ac-41d0-a766-d02b945a0df9', '19403', 'ana', 'urdaneta', 'ana@gmail.com', 'Femenino', '', '', 'https://randomuser.me/api/portraits/women/96.jpg', '', '', '2021-02-10 20:01:41', '2021-02-10 20:01:41'),
('55cbdf40-a165-488c-8b00-d5e693e39d40', '582920', 'javier', 'salas', 'salas@gmail.com', 'Masculino', '', '', 'https://randomuser.me/api/portraits/men/78.jpg', '', '', '2021-02-10 20:02:03', '2021-02-10 20:02:03'),
('64633bd6-ac51-4ce1-a748-170c26017a71', '8273', 'Norka', 'Labarca', 'norka@gmail.com', 'Femenino', '', '', 'https://randomuser.me/api/portraits/women/98.jpg', '', '', '2021-02-10 19:09:22', '2021-02-10 19:09:22'),
('f5b6b8f1-7819-49c5-8d8c-ab1bb0a23b02', '870', 'linda', 'labarca', 'linda@gmail.com', 'Femenino', '', '', 'https://randomuser.me/api/portraits/women/46.jpg', '', '', '2021-02-10 20:01:18', '2021-02-10 20:01:18');

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
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
