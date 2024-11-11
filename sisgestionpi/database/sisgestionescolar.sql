-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-07-2024 a las 00:07:59
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sisgestionescolar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativos`
--

DROP TABLE IF EXISTS `administrativos`;
CREATE TABLE IF NOT EXISTS `administrativos` (
  `id_administrativo` int NOT NULL AUTO_INCREMENT,
  `persona_id` int NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_administrativo`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones`
--

DROP TABLE IF EXISTS `asignaciones`;
CREATE TABLE IF NOT EXISTS `asignaciones` (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `docente_id` int NOT NULL,
  `nivel_id` int NOT NULL,
  `grado_id` int NOT NULL,
  `materia_id` int NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_asignacion`),
  KEY `docente_id` (`docente_id`),
  KEY `nivel_id` (`nivel_id`),
  KEY `materia_id` (`materia_id`),
  KEY `grado_id` (`grado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `asignaciones`
--

INSERT INTO `asignaciones` (`id_asignacion`, `docente_id`, `nivel_id`, `grado_id`, `materia_id`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 1, 3, 9, 5, '2024-01-23 10:44:32', NULL, '1'),
(3, 1, 3, 10, 5, '2024-01-23 11:04:16', '2024-01-23 15:40:40', '1'),
(7, 2, 3, 9, 4, '2024-01-23 15:09:35', NULL, '1'),
(8, 2, 3, 10, 4, '2024-01-23 15:40:55', NULL, '1'),
(9, 1, 3, 11, 5, '2024-01-23 16:51:06', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE IF NOT EXISTS `calificaciones` (
  `id_calificacion` int NOT NULL AUTO_INCREMENT,
  `docente_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `materia_id` int NOT NULL,
  `nota1` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nota2` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nota3` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_calificacion`),
  KEY `docente_id` (`docente_id`),
  KEY `materia_id` (`materia_id`),
  KEY `estudiante_id` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id_calificacion`, `docente_id`, `estudiante_id`, `materia_id`, `nota1`, `nota2`, `nota3`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 1, 3, 5, '80', '100', '53', '2024-01-25 00:18:18', '2024-01-25 00:20:46', '1'),
(2, 1, 1, 5, '100', '80', '51', '2024-01-25 00:18:18', '2024-01-25 00:20:46', '1'),
(3, 1, 2, 5, '90', '90', '52', '2024-01-25 00:18:18', '2024-01-25 00:20:46', '1'),
(4, 1, 4, 5, '10', '100', '100', '2024-01-25 00:18:48', '2024-01-25 00:21:25', '1'),
(5, 2, 2, 4, '100', '100', '100', '2024-01-26 02:22:14', NULL, '1'),
(6, 2, 1, 4, '100', '90', '80', '2024-01-26 02:22:14', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_instituciones`
--

DROP TABLE IF EXISTS `configuracion_instituciones`;
CREATE TABLE IF NOT EXISTS `configuracion_instituciones` (
  `id_config_institucion` int NOT NULL AUTO_INCREMENT,
  `nombre_institucion` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `celular` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_config_institucion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion_instituciones`
--

INSERT INTO `configuracion_instituciones` (`id_config_institucion`, `nombre_institucion`, `logo`, `direccion`, `telefono`, `celular`, `correo`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 'Hilari Web School', '2024-01-19-14-28-34ilustracion-edificio-escuela_138676-2399.jpg', 'Zona Los Olivos Calle Max Toledo Av. 6 nro 100', '2228837', '59175657007', 'info@hilariweb.com', '2023-12-28 20:29:10', '2024-01-19 14:28:34', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

DROP TABLE IF EXISTS `docentes`;
CREATE TABLE IF NOT EXISTS `docentes` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `persona_id` int NOT NULL,
  `especialidad` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `antiguedad` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id_docente`, `persona_id`, `especialidad`, `antiguedad`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 6, 'CIENCIAS SOCIALES', '5', '2024-01-16 10:19:28', '2024-01-26 01:30:40', '1'),
(2, 7, 'COMUNICACIÓN Y LENGUAJES', '5', '2024-01-16 11:18:29', '2024-01-26 02:21:12', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `persona_id` int NOT NULL,
  `nivel_id` int NOT NULL,
  `grado_id` int NOT NULL,
  `rude` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `persona_id` (`persona_id`),
  KEY `nivel_id` (`nivel_id`),
  KEY `grado_id` (`grado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id_estudiante`, `persona_id`, `nivel_id`, `grado_id`, `rude`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 8, 3, 9, '443343434344', '2024-01-18 08:44:24', '2024-01-23 15:31:52', '1'),
(2, 9, 3, 9, '4343421111', '2024-01-23 15:18:28', NULL, '1'),
(3, 10, 3, 9, '545334', '2024-01-23 15:20:20', '2024-01-23 19:23:10', '1'),
(4, 11, 3, 10, '44532322', '2024-01-23 15:31:39', '2024-01-23 19:40:15', '1'),
(5, 12, 3, 11, '66453434', '2024-01-25 11:29:36', NULL, '1'),
(6, 13, 3, 11, '323211', '2024-01-25 11:31:18', NULL, '1'),
(7, 18, 3, 12, '40006', '2024-01-30 20:49:33', '2024-01-30 21:17:37', '1'),
(8, 17, 3, 9, '40003', '2024-01-30 20:49:33', NULL, '1'),
(9, 16, 3, 9, '40004', '2024-01-30 20:49:33', NULL, '1'),
(10, 15, 3, 9, '40005', '2024-01-30 20:49:33', NULL, '1'),
(11, 20, 3, 9, '40007', '2024-01-30 20:49:33', NULL, '1'),
(12, 19, 3, 9, '40008', '2024-01-30 20:49:33', NULL, '1'),
(13, 21, 3, 9, '40009', '2024-01-30 20:49:33', NULL, '1'),
(14, 22, 3, 9, '40011', '2024-01-30 20:49:33', NULL, '1'),
(15, 26, 3, 9, '40010', '2024-01-30 20:49:33', NULL, '1'),
(16, 23, 3, 9, '40012', '2024-01-30 20:49:33', NULL, '1'),
(17, 24, 3, 9, '40014', '2024-01-30 20:49:33', NULL, '1'),
(18, 25, 3, 9, '40013', '2024-01-30 20:49:33', NULL, '1'),
(19, 27, 3, 9, '40015', '2024-01-30 20:49:33', NULL, '1'),
(20, 28, 3, 9, '40016', '2024-01-30 20:49:33', NULL, '1'),
(21, 30, 3, 9, '40020', '2024-01-30 20:49:33', NULL, '1'),
(22, 29, 3, 9, '40017', '2024-01-30 20:49:33', NULL, '1'),
(23, 31, 3, 9, '40019', '2024-01-30 20:49:33', NULL, '1'),
(24, 32, 3, 9, '40018', '2024-02-05 20:49:33', NULL, '1'),
(25, 33, 3, 9, '40021', '2024-02-05 20:49:33', NULL, '1'),
(26, 34, 3, 9, '40022', '2024-01-30 20:49:33', NULL, '1'),
(27, 36, 3, 9, '40024', '2024-01-30 20:49:33', NULL, '1'),
(28, 37, 3, 9, '40023', '2024-01-30 20:49:33', NULL, '1'),
(29, 35, 3, 9, '40025', '2024-01-30 20:49:33', NULL, '1'),
(30, 38, 3, 9, '40026', '2024-01-30 20:49:33', NULL, '1'),
(31, 39, 3, 9, '40027', '2024-01-30 20:49:33', NULL, '1'),
(32, 40, 3, 9, '40028', '2024-01-30 20:49:33', NULL, '1'),
(33, 41, 3, 9, '40029', '2024-01-30 20:49:33', NULL, '1'),
(34, 42, 3, 9, '40031', '2024-01-30 20:49:33', NULL, '1'),
(35, 43, 3, 9, '40032', '2024-01-30 20:49:33', NULL, '1'),
(36, 44, 3, 9, '40030', '2024-01-30 20:49:33', NULL, '1'),
(37, 45, 3, 9, '40033', '2024-01-30 20:49:33', NULL, '1'),
(38, 46, 3, 9, '40034', '2024-01-30 20:49:33', NULL, '1'),
(39, 47, 3, 9, '40035', '2024-01-30 20:49:33', NULL, '1'),
(40, 48, 3, 9, '40036', '2024-01-30 20:49:33', NULL, '1'),
(41, 49, 3, 9, '40037', '2024-01-30 20:49:33', NULL, '1'),
(42, 50, 3, 9, '40038', '2024-01-30 20:49:33', NULL, '1'),
(43, 51, 3, 9, '40039', '2024-01-30 20:49:33', NULL, '1'),
(44, 52, 3, 9, '40040', '2024-01-30 20:49:33', NULL, '1'),
(45, 53, 3, 9, '40041', '2024-01-30 20:49:33', NULL, '1'),
(46, 54, 3, 9, '40042', '2024-01-30 20:49:33', NULL, '1'),
(47, 55, 3, 9, '40043', '2024-01-30 20:49:33', NULL, '1'),
(48, 56, 3, 9, '40044', '2024-01-30 20:49:33', NULL, '1'),
(49, 57, 3, 9, '40045', '2024-01-30 20:49:33', NULL, '1'),
(50, 58, 3, 9, '40046', '2024-01-30 20:49:33', NULL, '1'),
(51, 59, 3, 9, '40047', '2024-01-30 20:49:33', NULL, '1'),
(52, 60, 3, 9, '40048', '2024-01-30 20:49:33', NULL, '1'),
(53, 61, 3, 9, '40050', '2024-01-30 20:49:33', NULL, '1'),
(54, 62, 2, 5, '40049', '2024-01-30 20:49:33', '2024-01-31 15:12:30', '1'),
(55, 63, 2, 5, '40051', '2024-01-30 20:49:33', '2024-01-31 15:12:12', '1'),
(56, 64, 1, 1, '40052', '2024-01-30 20:49:33', '2024-01-31 15:04:14', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestiones`
--

DROP TABLE IF EXISTS `gestiones`;
CREATE TABLE IF NOT EXISTS `gestiones` (
  `id_gestion` int NOT NULL AUTO_INCREMENT,
  `gestion` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_gestion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `gestiones`
--

INSERT INTO `gestiones` (`id_gestion`, `gestion`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 'GESTIÓN 2024', '2023-12-28 20:29:10', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

DROP TABLE IF EXISTS `grados`;
CREATE TABLE IF NOT EXISTS `grados` (
  `id_grado` int NOT NULL AUTO_INCREMENT,
  `nivel_id` int NOT NULL,
  `curso` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `paralelo` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_grado`),
  KEY `nivel_id` (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`id_grado`, `nivel_id`, `curso`, `paralelo`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 1, 'INICIAL - 1', 'A', '2023-12-28 20:29:10', '2024-01-29 17:53:42', '1'),
(2, 1, 'INICIAL - 2', 'A', '2024-01-17 08:26:34', NULL, '1'),
(4, 2, 'PRIMARIA - 2', 'A', '2024-01-17 08:26:45', '2024-01-22 21:29:46', '1'),
(5, 2, 'PRIMARIA - 3', 'A', '2024-01-22 21:29:23', '2024-01-22 21:29:52', '1'),
(6, 2, 'PRIMARIA - 4', 'A', '2024-01-22 21:29:28', '2024-01-22 21:29:57', '1'),
(7, 2, 'PRIMARIA - 5', 'A', '2024-01-22 21:29:33', '2024-01-22 21:30:03', '1'),
(8, 2, 'PRIMARIA - 6', 'A', '2024-01-22 21:29:38', '2024-01-22 21:30:08', '1'),
(9, 3, 'SECUNDARIA - 1', 'A', '2024-01-22 21:30:14', NULL, '1'),
(10, 3, 'SECUNDARIA - 2', 'A', '2024-01-22 21:30:20', NULL, '1'),
(11, 3, 'SECUNDARIA - 3', 'A', '2024-01-22 21:30:27', '2024-01-22 21:30:35', '1'),
(12, 3, 'SECUNDARIA - 4', 'A', '2024-01-22 21:30:42', NULL, '1'),
(13, 3, 'SECUNDARIA - 5', 'A', '2024-01-22 21:30:49', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardexs`
--

DROP TABLE IF EXISTS `kardexs`;
CREATE TABLE IF NOT EXISTS `kardexs` (
  `id_kardex` int NOT NULL AUTO_INCREMENT,
  `docente_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `materia_id` int NOT NULL,
  `fecha` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `observacion` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nota` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_kardex`),
  KEY `docente_id` (`docente_id`),
  KEY `materia_id` (`materia_id`),
  KEY `estudiante_id` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `kardexs`
--

INSERT INTO `kardexs` (`id_kardex`, `docente_id`, `estudiante_id`, `materia_id`, `fecha`, `observacion`, `nota`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(6, 1, 2, 5, '2024-01-08', 'ASISTENCIA', 'No asistio a clases.', '2024-01-26 02:05:33', NULL, '1'),
(7, 1, 1, 5, '2024-01-19', 'RENDIMIENTO ACADÉMICO', 'No presentó práctica nro 3', '2024-01-26 02:05:52', NULL, '1'),
(8, 1, 2, 5, '2024-01-19', 'RENDIMIENTO ACADÉMICO', 'No presentó la práctica nro 3', '2024-01-26 02:13:25', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

DROP TABLE IF EXISTS `materias`;
CREATE TABLE IF NOT EXISTS `materias` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `nombre_materia`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(3, 'FÍSICA', '2024-01-22 21:20:56', NULL, '1'),
(4, 'COMUNICACIÓN Y LENGUAJES', '2024-01-22 21:21:08', NULL, '1'),
(5, 'CIENCIAS SOCIALES', '2024-01-22 21:21:18', NULL, '1'),
(6, 'EDUCACIÓN FÍSICA Y DEPORTES', '2024-01-22 21:21:33', NULL, '1'),
(7, 'EDUCACIÓN MUSICAL', '2024-01-22 21:21:47', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

DROP TABLE IF EXISTS `niveles`;
CREATE TABLE IF NOT EXISTS `niveles` (
  `id_nivel` int NOT NULL AUTO_INCREMENT,
  `gestion_id` int NOT NULL,
  `nivel` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `turno` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_nivel`),
  KEY `gestion_id` (`gestion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id_nivel`, `gestion_id`, `nivel`, `turno`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 1, 'INICIAL', 'MAÑANA', '2023-12-28 20:29:10', NULL, '1'),
(2, 1, 'PRIMARIA', 'MAÑANA', '2024-01-17 08:24:10', NULL, '1'),
(3, 1, 'SECUNDARIA', 'MAÑANA', '2024-01-17 08:24:14', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE IF NOT EXISTS `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `estudiante_id` int NOT NULL,
  `mes_pagado` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `monto_pagado` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_pagado` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `estudiante_id` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `estudiante_id`, `mes_pagado`, `monto_pagado`, `fecha_pagado`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(6, 1, 'ENERO', '500', '2024-01-22', '2024-01-22 15:11:30', NULL, '1'),
(8, 56, 'ENERO', '500', '2024-05-30', '2024-05-30 20:10:49', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `nombre_url` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `url` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `nombre_url`, `url`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 'Configuraciones - Institución', '/admin/configuraciones/institucion/index.php', '2024-01-29 07:59:34', '2024-01-29 15:04:54', '1'),
(2, 'Configuraciones - Institución - Create', '/admin/configuraciones/institucion/create.php', '2024-01-29 08:00:04', '2024-01-29 15:05:02', '1'),
(3, 'Niveles', '/admin/niveles/index.php', '2024-01-29 08:01:21', '2024-01-29 15:06:12', '1'),
(4, 'Niveles - Create', '/admin/niveles/create.php', '2024-01-29 08:01:39', '2024-01-29 15:06:20', '1'),
(5, 'Grados', '/admin/grados/index.php', '2024-01-29 08:01:57', '2024-01-29 15:05:36', '1'),
(6, 'Grados - Create', '/admin/grados/create.php', '2024-01-29 08:02:16', '2024-01-29 15:05:46', '1'),
(7, 'Materias', '/admin/materias/index.php', '2024-01-29 08:09:17', '2024-01-29 15:05:58', '1'),
(8, 'Materias - Create', '/admin/materias/create.php', '2024-01-29 08:09:32', '2024-01-29 15:06:04', '1'),
(9, 'Roles', '/admin/roles/index.php', '2024-01-29 08:09:51', '2024-01-29 15:06:52', '1'),
(10, 'Roles - Create', '/admin/roles/create.php', '2024-01-29 08:10:03', '2024-01-29 15:06:58', '1'),
(11, 'Permisos', '/admin/roles/permisos.php', '2024-01-29 08:10:15', '2024-01-29 15:06:34', '1'),
(12, 'Permisos - create', '/admin/roles/create_permisos.php', '2024-01-29 08:10:55', '2024-01-29 15:06:42', '1'),
(13, 'Usuarios', '/admin/usuarios/index.php', '2024-01-29 08:11:21', '2024-01-29 15:07:04', '1'),
(15, 'Administrativos', '/admin/administrativos/index.php', '2024-01-29 08:12:13', '2024-01-29 15:04:33', '1'),
(16, 'Administrativos - Create', '/admin/administrativos/create.php', '2024-01-29 08:12:44', '2024-01-29 15:04:38', '1'),
(17, 'Docentes', '/admin/docentes/index.php', '2024-01-29 08:13:24', '2024-01-29 15:05:11', '1'),
(18, 'Docentes - Create', '/admin/docentes/create.php', '2024-01-29 08:14:13', '2024-01-29 15:05:17', '1'),
(19, 'Asignación de materias', '/admin/docentes/asignacion.php', '2024-01-29 08:14:34', '2024-01-29 15:04:43', '1'),
(20, 'Kardex del estudiante', '/admin/kardex/index.php', '2024-01-29 08:15:12', '2024-01-29 15:05:52', '1'),
(21, 'Calificaciones', '/admin/calificaciones/index.php', '2024-01-29 08:15:29', '2024-01-29 15:04:49', '1'),
(22, 'Estudiantes - Inscripción', '/admin/inscripciones/create.php', '2024-01-29 08:16:09', '2024-01-29 15:05:30', '1'),
(23, 'Estudiantes', '/admin/estudiantes/index.php', '2024-01-29 08:16:37', '2024-01-29 15:05:24', '1'),
(25, 'Usuarios - Create', '/admin/usuarios/create.php', '2024-01-29 08:51:17', '2024-01-29 15:07:11', '1'),
(26, 'Pagos', '/admin/pagos/index.php', '2024-01-29 08:51:36', '2024-01-29 15:06:27', '1'),
(27, 'Principal', '/admin/index.php', '2024-01-29 16:26:13', '2024-01-29 16:26:59', '1'),
(28, 'Configuración', '/admin/configuraciones/index.php', '2024-01-29 17:38:04', NULL, '1'),
(29, 'Configuraciones - Institución - Show', '/admin/configuraciones/institucion/show.php', '2024-01-29 17:39:53', NULL, '1'),
(30, 'Configuraciones - Institución - Update', '/admin/configuraciones/institucion/edit.php', '2024-01-29 17:41:18', NULL, '1'),
(31, 'Configuración - Gestión Educativa', '/admin/configuraciones/gestion/index.php', '2024-01-29 17:42:46', NULL, '1'),
(32, 'Configuración - Gestión Educativa - Create', '/admin/configuraciones/gestion/create.php', '2024-01-29 17:43:58', NULL, '1'),
(33, 'Configuración - Gestión Educativa - Show', '/admin/configuraciones/gestion/show.php', '2024-01-29 17:45:04', NULL, '1'),
(34, 'Configuración - Gestión Educativa - Update', '/admin/configuraciones/gestion/edit.php', '2024-01-29 17:46:17', NULL, '1'),
(35, 'Niveles - Show', '/admin/niveles/show.php', '2024-01-29 17:47:34', NULL, '1'),
(36, 'Niveles - Update', '/admin/niveles/edit.php', '2024-01-29 17:48:54', NULL, '1'),
(37, 'Grados - Show', '/admin/grados/show.php', '2024-01-29 17:50:19', NULL, '1'),
(38, 'Grados - Update', '/admin/grados/edit.php', '2024-01-29 17:52:02', NULL, '1'),
(39, 'Materias - Show', '/admin/materias/show.php', '2024-01-29 18:05:44', NULL, '1'),
(40, 'Materias - Update', '/admin/materias/edit.php', '2024-01-29 18:06:58', NULL, '1'),
(41, 'Roles - Show', '/admin/roles/show.php', '2024-01-29 18:08:43', NULL, '1'),
(42, 'Roles - Update', '/admin/roles/edit.php', '2024-01-29 18:09:32', NULL, '1'),
(43, 'Permisos - Update', '/admin/roles/edit_permiso.php', '2024-01-29 18:11:15', NULL, '1'),
(44, 'Usuarios - Show', '/admin/usuarios/show.php', '2024-01-29 18:13:01', NULL, '1'),
(45, 'Usuarios - Update', '/admin/usuarios/edit.php', '2024-01-29 18:13:53', NULL, '1'),
(46, 'Administrativos - Show', '/admin/administrativos/show.php', '2024-01-29 18:20:25', NULL, '1'),
(47, 'Administrativos - Update', '/admin/administrativos/edit.php', '2024-01-29 18:21:43', NULL, '1'),
(48, 'Docentes - Show', '/admin/docentes/show.php', '2024-01-29 18:32:57', NULL, '1'),
(49, 'Docentes - Update', '/admin/docentes/edit.php', '2024-01-29 18:34:27', NULL, '1'),
(50, 'Estudiantes - Inscripción - Principal', '/admin/inscripciones/index.php', '2024-01-29 18:36:48', NULL, '1'),
(51, 'Estudiantes - Show', '/admin/estudiantes/show.php', '2024-01-29 18:38:41', NULL, '1'),
(52, 'Estudiantes - Update', '/admin/estudiantes/edit.php', '2024-01-29 18:40:10', NULL, '1'),
(53, 'Pagos - Create', '/admin/pagos/create.php', '2024-01-29 18:41:57', NULL, '1'),
(54, 'Estudiantes - Inscripción - Importar', '/admin/inscripciones/importar/index.php', '2024-01-30 20:06:01', NULL, '1'),
(55, 'Calificaciones - Create', '/admin/calificaciones/create.php', '2024-01-30 20:53:00', NULL, '1'),
(56, 'Kardex - reporte del estudiante', '/admin/kardex/reporte_estudiante.php', '2024-07-22 16:41:12', NULL, '1'),
(57, 'Calificaciones - Reporte del estudiante', '/admin/calificaciones/reporte_estudiante.php', '2024-07-22 16:43:22', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `nombres` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ci` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_nacimiento` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `profesion` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `usuario_id`, `nombres`, `apellidos`, `ci`, `fecha_nacimiento`, `profesion`, `direccion`, `celular`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 1, 'Freddy Eddy', 'Hilari Michua', '12345678', '10/10/1990', 'LICENCIADO EN EDUCACIÓN', 'Zona Los Pinos Av. Las Rosas Nro 100', '75657007', '2023-12-28 20:29:10', NULL, '1'),
(4, 4, '1', '2', '333333333', '2024-01-15', '5555555555', 'Av. del Maestro S/N 7777777777777', '44444444', '2024-01-15 17:45:20', '2024-01-15 20:35:21', '1'),
(5, 5, 'BENJAMIN', 'HILARI', '222222222', '2024-01-11', 'LICENCIADO EN CIENCIAS DE LA EDUCACIÓN', 'Av. del Maestro S/N', '75657007', '2024-01-15 17:47:25', NULL, '1'),
(6, 7, 'BRIGIDA', 'MENDOZA', '888888888', '2024-01-16', 'LICENCIADO EN CIENCIAS DE LA EDUCACIÓN', 'Av. del Maestro S/N', '77777777', '2024-01-16 10:19:28', '2024-01-26 01:30:40', '1'),
(7, 8, 'Christina', 'Halvorson', '43437766', '1991-06-13', 'LICENCIADO EN CIENCIAS DE LA EDUCACIÓN', 'Av. del Maestro S/N', '7666655', '2024-01-16 11:18:29', '2024-01-26 02:21:12', '1'),
(8, 9, 'BENJAMIN', 'MAMANI QUISPE', '4738837700', '2024-01-18', 'ESTUDIANTE', 'Av. del Maestro S/N', '77366377', '2024-01-18 08:44:24', '2024-01-23 15:31:52', '1'),
(9, 10, 'Gordon', 'Klein', '75670921', '2010-06-17', 'ESTUDIANTE', '89196 Bartell GlensMcLaughlinhaven, HI 79783', '756709213', '2024-01-23 15:18:28', NULL, '1'),
(10, 11, 'Alden', 'Kuvalis', '77734922', '2016-11-09', 'ESTUDIANTE', '674 Laurianne Roads Apt. 729West Melany, NH 29431-4199', '777349222', '2024-01-23 15:20:20', '2024-01-23 19:23:10', '1'),
(11, 12, 'Heath', 'Klocko', '74812144', '2015-07-18', 'ESTUDIANTE', '4336 Burdette ViewElmiraberg, OR 41297-2057', '748121443', '2024-01-23 15:31:39', '2024-01-23 19:40:15', '1'),
(12, 13, 'Caterina', 'Dicki', '778913051', '2018-06-25', 'ESTUDIANTE', '7154 Brice OverpassLake Mariliestad, KY 75278', '778913054', '2024-01-25 11:29:36', NULL, '1'),
(13, 14, ' Rigoberto', 'Grant', '71535742', '2009-07-16', 'ESTUDIANTE', '57871 Halvorson ForkPort Dimitri, PA 59071', '715357421', '2024-01-25 11:31:18', NULL, '1'),
(14, 15, 'Rodrigo', 'Hamill', '77148105', '1988-07-13', 'LICENCIADO EN CIENCIAS DE LA EDUCACIÓN', 'Av. del Maestro S/N', '771481054', '2024-01-29 15:57:38', NULL, '1'),
(15, 16, 'Scarlett Balistreri', 'Scarlett Balistreri', '70255849', '40348', 'ESTUDIANTE', 'Av. Sin nombre ', '70255849', '2024-01-30 20:49:33', NULL, '1'),
(16, 18, 'Ms. Lola', 'Lola Abshire', '79339647', '40347', 'ESTUDIANTE', 'Av. Sin nombre ', '79339647', '2024-01-30 20:49:33', NULL, '1'),
(17, 17, 'Miss Jessika', 'Prohaska IV', '70845355', '40346', 'ESTUDIANTE', 'Av. Sin nombre ', '70845355', '2024-01-30 20:49:33', NULL, '1'),
(18, 20, 'Prof. Sterling', 'Sporer Sr.', '75938291', '2024-01-30', 'ESTUDIANTE', 'Av. Sin nombre ', '75938291', '2024-01-30 20:49:33', '2024-01-30 21:17:37', '1'),
(19, 19, 'Lafayette Mayer', 'Lafayette Mayer', '77204234', '40351', 'ESTUDIANTE', 'Av. Sin nombre ', '77204234', '2024-01-30 20:49:33', NULL, '1'),
(20, 21, 'Prof. Kennith', 'Keebler Jr.', '78043543', '40350', 'ESTUDIANTE', 'Av. Sin nombre ', '78043543', '2024-01-30 20:49:33', NULL, '1'),
(21, 22, 'Rodrigo Hamill', 'Rodrigo Hamill', '78114948', '40352', 'ESTUDIANTE', 'Av. Sin nombre ', '78114948', '2024-01-30 20:49:33', NULL, '1'),
(22, 23, 'Ms. Winnifred', 'Winnifred Blick', '74796098', '40354', 'ESTUDIANTE', 'Av. Sin nombre ', '74796098', '2024-01-30 20:49:33', NULL, '1'),
(23, 24, 'Camille Gibson', 'Gibson V', '75639368', '40355', 'ESTUDIANTE', 'Av. Sin nombre ', '75639368', '2024-01-30 20:49:33', NULL, '1'),
(24, 25, 'Miss Mara', 'Mara Brekke', '71352552', '40357', 'ESTUDIANTE', 'Av. Sin nombre ', '71352552', '2024-01-30 20:49:33', NULL, '1'),
(25, 26, 'Dr. Gustave', 'Gustave Bradtke', '70352456', '40356', 'ESTUDIANTE', 'Av. Sin nombre ', '70352456', '2024-01-30 20:49:33', NULL, '1'),
(26, 27, 'Ms. Kasandra', 'Rodriguez Jr.', '74405989', '40353', 'ESTUDIANTE', 'Av. Sin nombre ', '74405989', '2024-01-30 20:49:33', NULL, '1'),
(27, 28, 'Cale Franecki', 'Cale Franecki', '74568049', '40358', 'ESTUDIANTE', 'Av. Sin nombre ', '74568049', '2024-01-30 20:49:33', NULL, '1'),
(28, 29, 'Ignacio Rowe', 'Ignacio Rowe', '73073789', '40359', 'ESTUDIANTE', 'Av. Sin nombre ', '73073789', '2024-01-30 20:49:33', NULL, '1'),
(29, 30, 'Marty Armstrong', 'Marty Armstrong', '77009454', '40360', 'ESTUDIANTE', 'Av. Sin nombre ', '77009454', '2024-01-30 20:49:33', NULL, '1'),
(30, 31, 'Anika Hoeger', 'Anika Hoeger', '76399702', '40363', 'ESTUDIANTE', 'Av. Sin nombre ', '76399702', '2024-01-30 20:49:33', NULL, '1'),
(31, 32, 'Aubrey Pouros', 'Aubrey Pouros', '77958036', '40362', 'ESTUDIANTE', 'Av. Sin nombre ', '77958036', '2024-01-30 20:49:33', NULL, '1'),
(32, 33, 'Fern Jast', 'Fern Jast', '75209919', '40361', 'ESTUDIANTE', 'Av. Sin nombre ', '75209919', '2024-01-30 20:49:33', NULL, '1'),
(33, 34, 'Graciela Lemke', 'Graciela Lemke', '70410159', '40364', 'ESTUDIANTE', 'Av. Sin nombre ', '70410159', '2024-01-30 20:49:33', NULL, '1'),
(34, 35, 'Nicholas Heathcote', 'Heathcote DDS', '72037011', '40365', 'ESTUDIANTE', 'Av. Sin nombre ', '72037011', '2024-01-30 20:49:33', NULL, '1'),
(35, 37, 'Veronica Lemke', 'Veronica Lemke', '79200273', '40368', 'ESTUDIANTE', 'Av. Sin nombre ', '79200273', '2024-01-30 20:49:33', NULL, '1'),
(36, 36, 'Mr. Aiden', 'Aiden Gislason', '78991231', '40367', 'ESTUDIANTE', 'Av. Sin nombre ', '78991231', '2024-01-30 20:49:33', NULL, '1'),
(37, 38, 'Joseph Rutherford', 'Joseph Rutherford', '75090003', '40366', 'ESTUDIANTE', 'Av. Sin nombre ', '75090003', '2024-01-30 20:49:33', NULL, '1'),
(38, 39, 'Avery Tillman', 'Avery Tillman', '71219243', '40369', 'ESTUDIANTE', 'Av. Sin nombre ', '71219243', '2024-01-30 20:49:33', NULL, '1'),
(39, 40, 'Freeman Marvin', 'Freeman Marvin', '77939061', '40370', 'ESTUDIANTE', 'Av. Sin nombre ', '77939061', '2024-01-30 20:49:33', NULL, '1'),
(40, 41, 'Oscar Dooley', 'Oscar Dooley', '73000132', '40371', 'ESTUDIANTE', 'Av. Sin nombre ', '73000132', '2024-01-30 20:49:33', NULL, '1'),
(41, 43, 'Alexanne Dibbert', 'Alexanne Dibbert', '71327893', '40372', 'ESTUDIANTE', 'Av. Sin nombre ', '71327893', '2024-01-30 20:49:33', NULL, '1'),
(42, 42, 'Alberta Toy', 'Toy MD', '73817643', '40374', 'ESTUDIANTE', 'Av. Sin nombre ', '73817643', '2024-01-30 20:49:33', NULL, '1'),
(43, 44, 'Amely Stroman', 'Stroman V', '76787327', '40375', 'ESTUDIANTE', 'Av. Sin nombre ', '76787327', '2024-01-30 20:49:33', NULL, '1'),
(44, 45, 'Micaela Marvin', 'Micaela Marvin', '73824343', '40373', 'ESTUDIANTE', 'Av. Sin nombre ', '73824343', '2024-01-30 20:49:33', NULL, '1'),
(45, 46, 'Buford Kunze', 'Buford Kunze', '78756643', '40376', 'ESTUDIANTE', 'Av. Sin nombre ', '78756643', '2024-01-30 20:49:33', NULL, '1'),
(46, 47, 'Ms. Hettie', 'Hettie Beatty', '71325441', '40377', 'ESTUDIANTE', 'Av. Sin nombre ', '71325441', '2024-01-30 20:49:33', NULL, '1'),
(47, 48, 'Toy Kub', 'Toy Kub', '75189007', '40378', 'ESTUDIANTE', 'Av. Sin nombre ', '75189007', '2024-01-30 20:49:33', NULL, '1'),
(48, 49, 'Miss Emilia', 'Emilia Mohr', '74729079', '40379', 'ESTUDIANTE', 'Av. Sin nombre ', '74729079', '2024-01-30 20:49:33', NULL, '1'),
(49, 50, 'Mrs. Dandre', 'Purdy III', '75831570', '40380', 'ESTUDIANTE', 'Av. Sin nombre ', '75831570', '2024-01-30 20:49:33', NULL, '1'),
(50, 51, 'William Auer', 'William Auer', '73114906', '40381', 'ESTUDIANTE', 'Av. Sin nombre ', '73114906', '2024-01-30 20:49:33', NULL, '1'),
(51, 52, 'Lucio Franecki', 'Lucio Franecki', '78604695', '40382', 'ESTUDIANTE', 'Av. Sin nombre ', '78604695', '2024-01-30 20:49:33', NULL, '1'),
(52, 53, 'Alia Green', 'Green Jr.', '79398021', '40383', 'ESTUDIANTE', 'Av. Sin nombre ', '79398021', '2024-01-30 20:49:33', NULL, '1'),
(53, 54, 'Britney Wehner', 'Britney Wehner', '70317977', '40384', 'ESTUDIANTE', 'Av. Sin nombre ', '70317977', '2024-01-30 20:49:33', NULL, '1'),
(54, 55, 'Miss Loyce', 'PhD', '74216038', '40385', 'ESTUDIANTE', 'Av. Sin nombre ', '74216038', '2024-01-30 20:49:33', NULL, '1'),
(55, 56, 'Minnie Smitham', 'Minnie Smitham', '71078454', '40386', 'ESTUDIANTE', 'Av. Sin nombre ', '71078454', '2024-01-30 20:49:33', NULL, '1'),
(56, 57, 'Prof. Emile', 'Emile Aufderhar', '77154292', '40387', 'ESTUDIANTE', 'Av. Sin nombre ', '77154292', '2024-01-30 20:49:33', NULL, '1'),
(57, 58, 'Jana Auer', 'Jana Auer', '74309259', '40388', 'ESTUDIANTE', 'Av. Sin nombre ', '74309259', '2024-01-30 20:49:33', NULL, '1'),
(58, 59, 'Jayme Bashirian', 'Jayme Bashirian', '74204837', '40389', 'ESTUDIANTE', 'Av. Sin nombre ', '74204837', '2024-01-30 20:49:33', NULL, '1'),
(59, 60, 'Roberta Schulist', 'Roberta Schulist', '78082424', '40390', 'ESTUDIANTE', 'Av. Sin nombre ', '78082424', '2024-01-30 20:49:33', NULL, '1'),
(60, 61, 'Dr. Ransom', 'Yundt I', '72539522', '40391', 'ESTUDIANTE', 'Av. Sin nombre ', '72539522', '2024-01-30 20:49:33', NULL, '1'),
(61, 62, 'Abe Rutherford', 'Rutherford DDS', '79943252', '40393', 'ESTUDIANTE', 'Av. Sin nombre ', '79943252', '2024-01-30 20:49:33', NULL, '1'),
(62, 63, 'Newton Wunsch', 'Newton Wunsch', '74285882', '2024-01-31', 'ESTUDIANTE', 'Av. Sin nombre ', '74285882', '2024-01-30 20:49:33', '2024-01-31 15:12:30', '1'),
(63, 64, 'Dallin Kuvalis', 'Dallin Kuvalis', '74156827', '2024-01-19', 'ESTUDIANTE', 'Av. Sin nombre ', '74156827', '2024-01-30 20:49:33', '2024-01-31 15:12:12', '1'),
(64, 65, 'Garfield DuBuque', 'DuBuque', '79404562', '2015-06-30', 'ESTUDIANTE', 'Av. Sin nombre ', '79404562', '2024-01-30 20:49:33', '2024-01-31 15:04:14', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ppffs`
--

DROP TABLE IF EXISTS `ppffs`;
CREATE TABLE IF NOT EXISTS `ppffs` (
  `id_ppff` int NOT NULL AUTO_INCREMENT,
  `estudiante_id` int NOT NULL,
  `nombres_apellidos_ppff` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ci_ppf` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `celular_ppff` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ocupacion_ppff` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ref_nombre` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ref_parentezco` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ref_celular` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_ppff`),
  KEY `estudiante_id` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ppffs`
--

INSERT INTO `ppffs` (`id_ppff`, `estudiante_id`, `nombres_apellidos_ppff`, `ci_ppf`, `celular_ppff`, `ocupacion_ppff`, `ref_nombre`, `ref_parentezco`, `ref_celular`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 1, 'MAMANI MAMANI MARIO', '3886647873', '7736663', 'CHOFER', 'MAMANI MAMANI MARIA', 'TIA', '77366663', '2024-01-18 08:44:24', '2024-01-23 15:31:52', '1'),
(2, 2, 'Renner Griffin', '74772213', '747722132', 'POLICIA', 'Esta Watsica', 'TIA', '79947047', '2024-01-23 15:18:28', NULL, '1'),
(3, 3, 'Turner Malika', '79453177', '794531772', 'ABOGADA', 'Trycia Reilly', 'TIA', '75110234', '2024-01-23 15:20:20', '2024-01-23 19:23:10', '1'),
(4, 4, 'Hailey Gorczany', '70954930', '709549303', 'INGENIERO', 'Carissa Dibbert', 'TIA', '70252028', '2024-01-23 15:31:39', '2024-01-23 19:40:15', '1'),
(5, 5, 'Mary Fisher', '73760969', '7376096912', 'POLICIA', 'Elaina Kutch', 'TIA', '77666386', '2024-01-25 11:29:36', NULL, '1'),
(6, 6, 'Octavia Buckridge', '75595597', '755955972', 'ABOGADA', 'Eve Watsica', 'TIO', '70682284', '2024-01-25 11:31:18', NULL, '1'),
(7, 7, 'Jerrell Hintz', '7748840', '73664539', 'EMPLEADO', 'NINGUNO', '-', '43434', '2024-01-30 20:49:33', '2024-01-30 21:17:37', '1'),
(8, 9, 'Rahul Doyle', '7748838', '73664537', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(9, 11, 'Luciano Sauer Jr.', '7748841', '73664540', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(10, 8, 'Eliane Barrows', '7748837', '73664536', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(11, 12, 'Maeve Hilpert', '7748842', '73664541', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(12, 10, 'Aisha Bechtelar DVM', '7748839', '73664538', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(13, 13, 'Mr. Zakary Purdy II', '7748843', '73664542', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(14, 14, 'Delpha Kuhic', '7748845', '73664544', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(15, 16, 'Cleveland Bosco', '7748846', '73664545', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(16, 17, 'Dennis Ziemann', '7748848', '73664547', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(17, 15, 'Deion Terry', '7748844', '73664543', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(18, 18, 'Benny McGlynn', '7748847', '73664546', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(19, 19, 'Dr. Samson Lakin Sr.', '7748849', '73664548', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(20, 20, 'Prof. Clifford Dibbert', '7748850', '73664549', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(21, 21, 'Yasmeen Gerhold', '7748854', '73664553', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(22, 22, 'Consuelo Oberbrunner', '7748851', '73664550', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(23, 24, 'Felicity Moen V', '7748852', '73664551', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(24, 23, 'Wilson Quigley', '7748853', '73664552', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(25, 25, 'Lenny Kris II', '7748855', '73664554', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(26, 26, 'Donnie Mertz', '7748856', '73664555', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(27, 29, 'Dr. Brandyn O\'Kon', '7748859', '73664558', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(28, 28, 'Amari Lowe II', '7748857', '73664556', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(29, 27, 'Carter Feest', '7748858', '73664557', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(30, 30, 'Uriah McCullough', '7748860', '73664559', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(31, 31, 'Zaria Kertzmann', '7748861', '73664560', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(32, 32, 'Dr. Marco Wolff III', '7748862', '73664561', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(33, 34, 'Prof. Rico Huel I', '7748865', '73664564', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(34, 33, 'Nasir Lynch', '7748863', '73664562', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(35, 35, 'Prof. Isaiah Douglas DDS', '7748866', '73664565', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(36, 36, 'Felicita Legros', '7748864', '73664563', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(37, 37, 'Dennis Ziemann', '7748867', '73664566', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(38, 38, 'Dr. Samson Lakin Sr.', '7748868', '73664567', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(39, 40, 'Consuelo Oberbrunner', '7748870', '73664569', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(40, 41, 'Felicity Moen V', '7748871', '73664570', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(41, 39, 'Prof. Clifford Dibbert', '7748869', '73664568', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(42, 42, 'Wilson Quigley', '7748872', '73664571', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(43, 43, 'Yasmeen Gerhold', '7748873', '73664572', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(44, 44, 'Lenny Kris II', '7748874', '73664573', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(45, 45, 'Dennis Ziemann', '7748875', '73664574', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(46, 46, 'Dr. Samson Lakin Sr.', '7748876', '73664575', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(47, 47, 'Dennis Ziemann', '7748877', '73664576', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(48, 48, 'Dr. Samson Lakin Sr.', '7748878', '73664577', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(49, 49, 'Dennis Ziemann', '7748879', '73664578', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(50, 50, 'Dr. Samson Lakin Sr.', '7748880', '73664579', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(51, 51, 'Prof. Clifford Dibbert', '7748881', '73664580', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(52, 52, 'Consuelo Oberbrunner', '7748882', '73664581', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(53, 53, 'Wilson Quigley', '7748884', '73664583', 'EMPLEADO', 'NINGUNO', '-', '-', '2024-01-30 20:49:33', NULL, '1'),
(54, 54, 'Felicity Moen V', '7748883', '73664582', 'EMPLEADO', 'NINGUNO', '-', '0', '2024-01-30 20:49:33', '2024-01-31 15:12:30', '1'),
(55, 55, 'Yasmeen Gerhold', '7748885', '73664584', 'EMPLEADO', 'NINGUNO', '-', '0', '2024-01-30 20:49:33', '2024-01-31 15:12:12', '1'),
(56, 56, 'Lenny Kris II', '7748886', '73664585', 'EMPLEADO', 'NINGUNO', '-', '0', '2024-01-30 20:49:33', '2024-01-31 15:04:14', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 'ADMINISTRADOR', '2024-01-03 16:20:20', NULL, '1'),
(2, 'DIRECTOR ACADÉMICO', '2024-01-03 16:20:20', NULL, '1'),
(3, 'DIRECTOR ADMINISTRATIVO', '2024-01-03 16:20:20', NULL, '1'),
(4, 'CONTADOR', '2024-01-03 16:20:20', NULL, '1'),
(5, 'SECRETARIA', '2024-01-03 16:20:20', NULL, '1'),
(6, 'DOCENTE', '2024-01-03 16:20:20', NULL, '1'),
(7, 'ESTUDIANTE', '2024-01-17 08:15:10', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_permisos`
--

DROP TABLE IF EXISTS `roles_permisos`;
CREATE TABLE IF NOT EXISTS `roles_permisos` (
  `id_rol_permiso` int NOT NULL AUTO_INCREMENT,
  `rol_id` int NOT NULL,
  `permiso_id` int NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_rol_permiso`),
  KEY `rol_id` (`rol_id`),
  KEY `permiso_id` (`permiso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `roles_permisos`
--

INSERT INTO `roles_permisos` (`id_rol_permiso`, `rol_id`, `permiso_id`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(2, 1, 16, '2024-01-29 12:55:37', NULL, '1'),
(3, 1, 19, '2024-01-29 12:55:40', NULL, '1'),
(5, 1, 1, '2024-01-29 12:55:45', NULL, '1'),
(6, 1, 2, '2024-01-29 12:55:49', NULL, '1'),
(7, 1, 17, '2024-01-29 12:55:52', NULL, '1'),
(8, 1, 18, '2024-01-29 12:55:56', NULL, '1'),
(9, 1, 23, '2024-01-29 12:55:59', NULL, '1'),
(10, 1, 22, '2024-01-29 12:56:02', NULL, '1'),
(11, 1, 5, '2024-01-29 12:56:04', NULL, '1'),
(12, 1, 6, '2024-01-29 12:56:07', NULL, '1'),
(13, 1, 20, '2024-01-29 12:56:11', NULL, '1'),
(14, 1, 7, '2024-01-29 12:56:15', NULL, '1'),
(15, 1, 8, '2024-01-29 12:56:18', NULL, '1'),
(16, 1, 3, '2024-01-29 12:56:21', NULL, '1'),
(17, 1, 4, '2024-01-29 12:56:24', NULL, '1'),
(18, 1, 26, '2024-01-29 12:56:27', NULL, '1'),
(19, 1, 11, '2024-01-29 12:56:30', NULL, '1'),
(20, 1, 12, '2024-01-29 12:56:34', NULL, '1'),
(21, 2, 15, '2024-01-29 12:56:49', NULL, '1'),
(22, 2, 16, '2024-01-29 12:56:52', NULL, '1'),
(23, 2, 19, '2024-01-29 12:56:56', NULL, '1'),
(24, 2, 1, '2024-01-29 12:57:05', NULL, '1'),
(25, 2, 2, '2024-01-29 12:57:08', NULL, '1'),
(26, 2, 17, '2024-01-29 12:57:12', NULL, '1'),
(27, 2, 18, '2024-01-29 12:57:15', NULL, '1'),
(28, 2, 23, '2024-01-29 12:57:18', NULL, '1'),
(29, 2, 22, '2024-01-29 12:57:22', NULL, '1'),
(30, 2, 5, '2024-01-29 12:57:25', NULL, '1'),
(31, 2, 6, '2024-01-29 12:57:29', NULL, '1'),
(32, 2, 7, '2024-01-29 12:57:45', NULL, '1'),
(33, 2, 8, '2024-01-29 12:57:48', NULL, '1'),
(34, 2, 3, '2024-01-29 12:57:50', NULL, '1'),
(35, 2, 4, '2024-01-29 12:57:53', NULL, '1'),
(36, 1, 9, '2024-01-29 12:58:26', NULL, '1'),
(37, 1, 10, '2024-01-29 12:58:30', NULL, '1'),
(38, 1, 13, '2024-01-29 12:58:32', NULL, '1'),
(39, 1, 25, '2024-01-29 12:58:35', NULL, '1'),
(40, 3, 15, '2024-01-29 12:58:55', NULL, '1'),
(41, 3, 16, '2024-01-29 12:58:58', NULL, '1'),
(42, 3, 1, '2024-01-29 12:59:07', NULL, '1'),
(43, 3, 2, '2024-01-29 12:59:09', NULL, '1'),
(44, 3, 23, '2024-01-29 12:59:18', NULL, '1'),
(45, 3, 22, '2024-01-29 12:59:20', NULL, '1'),
(46, 3, 26, '2024-01-29 12:59:30', NULL, '1'),
(47, 4, 23, '2024-01-29 12:59:42', NULL, '1'),
(48, 4, 22, '2024-01-29 12:59:45', NULL, '1'),
(49, 4, 26, '2024-01-29 12:59:49', NULL, '1'),
(50, 5, 15, '2024-01-29 12:59:59', NULL, '1'),
(51, 5, 16, '2024-01-29 13:00:05', NULL, '1'),
(52, 5, 17, '2024-01-29 13:00:08', NULL, '1'),
(53, 5, 18, '2024-01-29 13:00:10', NULL, '1'),
(54, 5, 23, '2024-01-29 13:00:16', NULL, '1'),
(55, 5, 19, '2024-01-29 13:00:32', NULL, '1'),
(58, 7, 20, '2024-01-29 13:01:02', NULL, '1'),
(60, 6, 21, '2024-01-29 13:02:56', NULL, '1'),
(61, 6, 20, '2024-01-29 15:52:08', NULL, '1'),
(62, 1, 27, '2024-01-29 16:26:26', NULL, '1'),
(63, 2, 27, '2024-01-29 16:26:34', NULL, '1'),
(64, 3, 27, '2024-01-29 16:26:42', NULL, '1'),
(65, 4, 27, '2024-01-29 16:27:15', NULL, '1'),
(66, 5, 27, '2024-01-29 16:27:21', NULL, '1'),
(67, 6, 27, '2024-01-29 16:27:29', NULL, '1'),
(68, 7, 27, '2024-01-29 16:27:37', NULL, '1'),
(69, 1, 28, '2024-01-29 17:38:15', NULL, '1'),
(70, 2, 28, '2024-01-29 17:38:36', NULL, '1'),
(71, 3, 28, '2024-01-29 17:38:43', NULL, '1'),
(72, 1, 29, '2024-01-29 17:40:07', NULL, '1'),
(73, 2, 29, '2024-01-29 17:40:17', NULL, '1'),
(74, 3, 29, '2024-01-29 17:40:26', NULL, '1'),
(75, 1, 30, '2024-01-29 17:41:29', NULL, '1'),
(76, 2, 30, '2024-01-29 17:41:35', NULL, '1'),
(77, 3, 30, '2024-01-29 17:41:41', NULL, '1'),
(78, 1, 31, '2024-01-29 17:43:01', NULL, '1'),
(79, 2, 31, '2024-01-29 17:43:07', NULL, '1'),
(80, 3, 31, '2024-01-29 17:43:12', NULL, '1'),
(81, 1, 32, '2024-01-29 17:44:09', NULL, '1'),
(82, 2, 32, '2024-01-29 17:44:14', NULL, '1'),
(83, 3, 32, '2024-01-29 17:44:20', NULL, '1'),
(84, 1, 33, '2024-01-29 17:45:16', NULL, '1'),
(85, 2, 33, '2024-01-29 17:45:24', NULL, '1'),
(86, 3, 33, '2024-01-29 17:45:30', NULL, '1'),
(87, 1, 34, '2024-01-29 17:46:24', NULL, '1'),
(88, 2, 34, '2024-01-29 17:46:34', NULL, '1'),
(89, 3, 34, '2024-01-29 17:46:42', NULL, '1'),
(90, 1, 35, '2024-01-29 17:47:51', NULL, '1'),
(91, 2, 35, '2024-01-29 17:48:05', NULL, '1'),
(92, 1, 36, '2024-01-29 17:49:05', NULL, '1'),
(93, 2, 36, '2024-01-29 17:49:14', NULL, '1'),
(94, 1, 37, '2024-01-29 17:50:34', NULL, '1'),
(95, 2, 37, '2024-01-29 17:50:46', NULL, '1'),
(96, 1, 38, '2024-01-29 17:52:11', NULL, '1'),
(97, 2, 38, '2024-01-29 17:52:19', NULL, '1'),
(98, 1, 39, '2024-01-29 18:05:59', NULL, '1'),
(99, 2, 39, '2024-01-29 18:06:14', NULL, '1'),
(100, 1, 40, '2024-01-29 18:07:10', NULL, '1'),
(101, 2, 40, '2024-01-29 18:07:29', NULL, '1'),
(102, 1, 41, '2024-01-29 18:08:55', NULL, '1'),
(103, 1, 42, '2024-01-29 18:09:47', NULL, '1'),
(104, 1, 43, '2024-01-29 18:11:26', NULL, '1'),
(105, 1, 44, '2024-01-29 18:13:10', NULL, '1'),
(106, 1, 45, '2024-01-29 18:14:00', NULL, '1'),
(107, 1, 46, '2024-01-29 18:20:33', NULL, '1'),
(108, 2, 46, '2024-01-29 18:20:40', NULL, '1'),
(109, 3, 46, '2024-01-29 18:20:51', NULL, '1'),
(110, 5, 46, '2024-01-29 18:21:10', NULL, '1'),
(111, 1, 47, '2024-01-29 18:21:50', NULL, '1'),
(112, 2, 47, '2024-01-29 18:21:55', NULL, '1'),
(113, 3, 47, '2024-01-29 18:22:01', NULL, '1'),
(114, 5, 47, '2024-01-29 18:22:07', NULL, '1'),
(115, 1, 48, '2024-01-29 18:33:06', NULL, '1'),
(116, 2, 48, '2024-01-29 18:33:23', NULL, '1'),
(117, 5, 48, '2024-01-29 18:33:43', NULL, '1'),
(118, 1, 49, '2024-01-29 18:34:34', NULL, '1'),
(119, 2, 49, '2024-01-29 18:34:40', NULL, '1'),
(120, 5, 47, '2024-01-29 18:34:49', NULL, '1'),
(121, 1, 50, '2024-01-29 18:36:59', NULL, '1'),
(122, 2, 50, '2024-01-29 18:37:11', NULL, '1'),
(123, 3, 50, '2024-01-29 18:37:21', NULL, '1'),
(124, 4, 50, '2024-01-29 18:37:30', NULL, '1'),
(125, 1, 51, '2024-01-29 18:38:51', NULL, '1'),
(126, 2, 51, '2024-01-29 18:39:04', NULL, '1'),
(127, 3, 51, '2024-01-29 18:39:13', NULL, '1'),
(128, 4, 51, '2024-01-29 18:39:21', NULL, '1'),
(129, 5, 51, '2024-01-29 18:39:31', NULL, '1'),
(130, 1, 52, '2024-01-29 18:40:20', NULL, '1'),
(131, 2, 52, '2024-01-29 18:40:27', NULL, '1'),
(132, 3, 52, '2024-01-29 18:40:35', NULL, '1'),
(133, 4, 53, '2024-01-29 18:42:30', NULL, '1'),
(134, 3, 53, '2024-01-29 18:42:50', NULL, '1'),
(135, 1, 53, '2024-01-29 18:43:30', NULL, '1'),
(136, 1, 54, '2024-01-30 20:06:15', NULL, '1'),
(137, 2, 54, '2024-01-30 20:06:29', NULL, '1'),
(138, 5, 54, '2024-01-30 20:06:43', NULL, '1'),
(139, 6, 55, '2024-01-30 20:53:11', NULL, '1'),
(140, 1, 15, '2024-02-05 15:20:49', NULL, '1'),
(141, 1, 21, '2024-02-05 15:31:47', NULL, '1'),
(142, 7, 21, '2024-07-22 16:39:47', NULL, '1'),
(143, 7, 56, '2024-07-22 16:41:31', NULL, '1'),
(144, 7, 57, '2024-07-22 16:44:00', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `rol_id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `fyh_creacion` datetime DEFAULT NULL,
  `fyh_actualizacion` datetime DEFAULT NULL,
  `estado` varchar(11) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `rol_id` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `rol_id`, `email`, `password`, `fyh_creacion`, `fyh_actualizacion`, `estado`) VALUES
(1, 1, 'admin@admin.com', '$2y$10$0tYmdHU9uGCIxY1f90W1EuIm54NQ8axowkxL1WzLbqO2LdNa8m3l2', '2023-12-28 20:29:10', NULL, '1'),
(4, 4, '666666@gmail.com', '$2y$10$cpCmXD9sDww23bAp7p95j.9Z4seilhP/55/0KVlofOeiQ98yhpxp.', '2024-01-15 17:45:20', '2024-01-15 20:35:21', '1'),
(5, 3, 'brigida@gmail.com', '$2y$10$J2AaQCjT9IoLFpboU85mPOX9kbshT99GGyDVQtYhn996MN/VYeezK', '2024-01-15 17:47:25', NULL, '1'),
(7, 6, 'brigidamendoza@gmail.com', '$2y$10$cBPz3N.vh13KI5tnIQal0.dLm0OyvSWTIoPcpF0dUr8QmZNDBOD/q', '2024-01-16 10:19:28', '2024-01-26 01:30:40', '1'),
(8, 6, 'jtillman@example.com', '$2y$10$AqKBZ9iv3D9qOA3Vv7GjMOijlv1bmUP9MVFWg54Ofgc4BsaU0xJAS', '2024-01-16 11:18:29', '2024-01-26 02:21:12', '1'),
(9, 7, 'benjamin222@gamil.com', '$2y$10$iyGFV/XTEDB/NgIxIlDKDuTgV52PysnrjeSpztbUYtTvMBzlZFI9G', '2024-01-18 08:44:24', '2024-01-23 15:31:52', '1'),
(10, 7, 'willms.drew@example.org', '$2y$10$fgf7m.T8h/76HQIdk3z7/eH/B5dYuZrWUaVyAyYga6EGCQzNYo.fi', '2024-01-23 15:18:28', NULL, '1'),
(11, 7, 'schultz.thomas@example.org', '$2y$10$/gkWCCdiV63m8o7ERog40.LZct9p2.Jw7rjT67mXzvwHg9S3e2YgC', '2024-01-23 15:20:20', '2024-01-23 19:23:10', '1'),
(12, 7, 'marquise.rogahn@example.net', '$2y$10$vVDAaRkU8KSCyQbucLAKH.Th.0B01kNn6BO448nSP3O2RJ0SQs.HG', '2024-01-23 15:31:39', '2024-01-23 19:40:15', '1'),
(13, 7, 'jason.marvin@example.com', '$2y$10$icPwbdaXPyxAgLCyZyw8RORyBkYxTOKfvPsDLB94RlBEtjyq9MCX.', '2024-01-25 11:29:36', NULL, '1'),
(14, 7, 'bret.dickens@example.net', '$2y$10$xCcPlihQGlflSWq4Uahr0ewXCFEkxwuxjlZWspI5B0ctj0CiBWyKu', '2024-01-25 11:31:18', NULL, '1'),
(15, 2, 'bergstrom.lavern@example.net', '$2y$10$AS7kGk4X0dToJr1udtqWmOvbDrVoIDPKskq209m2Zguf6YaGTxDc2', '2024-01-29 15:57:38', NULL, '1'),
(16, 7, 'brent28@example.net', '$2y$10$DUWdcxZ73PQKtR./xGaAYuBexATt6CkVQvZmZttjE9KHJKEY23pPO', '2024-01-30 20:49:33', NULL, '1'),
(17, 7, 'xlockman@example.com', '$2y$10$myunwxSMI/BD4KQ3XeqFnOT6/XoCrHFDYFIyW8mU5LVHLGqtSXC8u', '2024-01-30 20:49:33', NULL, '1'),
(18, 7, 'otis.hills@example.com', '$2y$10$8JHih3vOVKHKlS6lrI5bbuWpoYlGqAHWP5IbIPD9LBthYBEGG6g6u', '2024-01-30 20:49:33', NULL, '1'),
(19, 7, 'rsatterfield@example.org', '$2y$10$08CeTYRNUgYmgr6rNX3QreF8NBUYKYlBQO/C/7DFfY17LTb2CWomK', '2024-01-30 20:49:33', NULL, '1'),
(20, 7, 'jace86@example.org', '$2y$10$.CAxZ6y5vWufYiht741bV.aL8nAPd0LagjyNACuzmVCoqKhJsMSVK', '2024-01-30 20:49:33', '2024-01-30 21:17:37', '1'),
(21, 7, 'morris.rosenbaum@example.org', '$2y$10$nCuP5OjEuSYIubGhlg6iMeN3Jtsm9EkhWI6wUB9GZdxN8jBGyKjou', '2024-01-30 20:49:33', NULL, '1'),
(22, 7, 'fwilkinson@example.net', '$2y$10$ALpV4CoPcG8hJKOPc6D/DuL1/ChwjWws0el47BGtWJhaZ.ZFiVOFK', '2024-01-30 20:49:33', NULL, '1'),
(23, 7, 'kiehn.shawn@example.net', '$2y$10$Dji6nIDdHoh9u7WuLybO9eQ38gw0zKMVvqE2ddoXdaF6s6hT7aO0C', '2024-01-30 20:49:33', NULL, '1'),
(24, 7, 'valentin32@example.com', '$2y$10$m5fT5U/nv9HlF9WUEKgnCOZ90/EwCbPYUkb.SiJgklr3v3UNU6NNS', '2024-01-30 20:49:33', NULL, '1'),
(25, 7, 'ankunding.shane@example.org', '$2y$10$D8D60SZ9eJe3I4/mHoAP6eZ60q3Qfovl0eu7Qa6i9TjHfYir2zkYS', '2024-01-30 20:49:33', NULL, '1'),
(26, 7, 'josiane84@example.net', '$2y$10$RV2KIIdYJ/o9YmPMfG7TgO7ixGuHzrUZBOu/VQlZXo2oTjRQCAha.', '2024-01-30 20:49:33', NULL, '1'),
(27, 7, 'alessandra.gottlieb@example.org', '$2y$10$t7Mt93oRb3g0Ydhb79aTSe72n.avCIl7fBdNO8Q5AX9eQTHcaR6Cm', '2024-01-30 20:49:33', NULL, '1'),
(28, 7, 'mhand@example.org', '$2y$10$72urW22Aqg4H3d031BDzo.VqWVlZxdSyqm5SSLYHTpgCogShnDtLO', '2024-01-30 20:49:33', NULL, '1'),
(29, 7, 'wintheiser.flo@example.net', '$2y$10$gFayevrljbTPDFfjUoXp7uy4IB5ptWUrgmdIeZJ6qiHJpDqv8oRFO', '2024-01-30 20:49:33', NULL, '1'),
(30, 7, 'daija.koch@example.com', '$2y$10$1Js85pX0cZiteNzjxsZqdO.hIbfyJgL8wa4Dzgp.FS62lC9idfOF.', '2024-01-30 20:49:33', NULL, '1'),
(31, 7, 'wlubowitz@example.com', '$2y$10$EMnCudfd05xUE6YOnGIGdOJxPvvZ516uB1zUasyEepspD9RjJBRy2', '2024-01-30 20:49:33', NULL, '1'),
(32, 7, 'grady.carmella@example.com', '$2y$10$fz3Wa1yxhhOqyoT9kHGAj.APhCu.hdWBSgMKqt3hlXhNPU0WqdWmy', '2024-01-30 20:49:33', NULL, '1'),
(33, 7, 'clement44@example.org', '$2y$10$x2CXCJtG3WcwbwANrbr5V.EpdjPEq0ky0Z92fBVM3mOff6W02ciei', '2024-01-30 20:49:33', NULL, '1'),
(34, 7, 'albina79@example.com', '$2y$10$kMTtLuklEkFAl6fbG7sLae3QTG4xD2.TSoIOFMYvPvDO6jE4oRApe', '2024-01-30 20:49:33', NULL, '1'),
(35, 7, 'sigrid35@example.net', '$2y$10$mQbDlBCmho2wU6KbVDac8uSGVMibv2eSf1M4Tmi5zdoT3g.aeO/yG', '2024-01-30 20:49:33', NULL, '1'),
(36, 7, 'mozelle.reinger@example.com', '$2y$10$NVawvKAm9KVoLTnokPcfnuDHkVKYDPHWIu0L8PkOWFeKz3XbJ9qay', '2024-01-30 20:49:33', NULL, '1'),
(37, 7, 'beryl95@example.net', '$2y$10$hBaq3WLk5FR2H0Go3D4/beT/iq9tRjovh8MmboWVqKlTZ.HQJ3x9y', '2024-01-30 20:49:33', NULL, '1'),
(38, 7, 'sheldon51@example.com', '$2y$10$Waw5ue27da41BBnwE.2v4uimC/DfUyHUoRBamjGOCISBx9/UjXf8.', '2024-01-30 20:49:33', NULL, '1'),
(39, 7, 'vgoyette@example.org', '$2y$10$x6edJWtQAN/0uU1.frxtGOuh68HGU5u69Ae4gKFhrTAMErzD9Xzrq', '2024-01-30 20:49:33', NULL, '1'),
(40, 7, 'alison63@example.net', '$2y$10$mCIBtM7Oidox9ravKM8L1.XQH4NjqoTgGiVWKA942f9AhPlE8AD.m', '2024-01-30 20:49:33', NULL, '1'),
(41, 7, 'alf78@example.org', '$2y$10$xJivxeO6yI6nBAt1UJFikuW89MbvhnnLfM4F1ovSJzFSSY.JdASaK', '2024-01-30 20:49:33', NULL, '1'),
(42, 7, 'dorn@example.org', '$2y$10$LH19i5/fDbRTk3JRYkbOGegreZbkuKKmvyVRft5uNK6TQL60It5Gu', '2024-01-30 20:49:33', NULL, '1'),
(43, 7, 'rosina33@example.org', '$2y$10$eqZxKO7BLt1j2CNzNWPru.J5p2BOvKvvPhb22uQbZDqgjWBSeiCuC', '2024-01-30 20:49:33', NULL, '1'),
(44, 7, 'dicki.alvah@example.org', '$2y$10$/mLNPgSxw8gEqbVRF17hy.vsJEe.JAL4Yc7Gp1drJNBVZ4WLDZoP.', '2024-01-30 20:49:33', NULL, '1'),
(45, 7, 'sandrine.hyatt@example.net', '$2y$10$Lsezv9RU1viQfYEaYy1tyen/iBiuorDGojsBO3r/xen7O8a.Xnr46', '2024-01-30 20:49:33', NULL, '1'),
(46, 7, 'kerluke.jaunita@example.org', '$2y$10$eAzL9JdWb3vIRCLFpdBtseV0Ua.K8ETuNAaul9K/dPUQY3.AYbo0G', '2024-01-30 20:49:33', NULL, '1'),
(47, 7, 'napoleon.kris@example.com', '$2y$10$aYe.BEMSJSvc6PH54Y5ohe0vShzJdesMgyo5ZGgaTXbc.I6kS2epy', '2024-01-30 20:49:33', NULL, '1'),
(48, 7, 'terrill.bednar@example.net', '$2y$10$oCLTCZTyvxOCUmssmchlheQKPxyLd6HgZc/wzSdvFSK0HIvv/v0GC', '2024-01-30 20:49:33', NULL, '1'),
(49, 7, 'mercedes65@example.org', '$2y$10$r/gOkt4Yy4hvYtaoW41lTOYrv4WD6IJeR37KfuZI69o2iUQJEYEJC', '2024-01-30 20:49:33', NULL, '1'),
(50, 7, 'lubowitz.adrianna@example.com', '$2y$10$xMj29ik.Y3VfdVn47YdEXepm.0dv7zw6SzkYWxcCH7BZPL7f6TfV2', '2024-01-30 20:49:33', NULL, '1'),
(51, 7, 'monica.bauch@example.org', '$2y$10$HPzRzipr0TIP3MNdfWLFmOkDhp.4tUoSF1nAwpq3J.qJC9XPmK9eG', '2024-01-30 20:49:33', NULL, '1'),
(52, 7, 'pquigley@example.net', '$2y$10$bztgIbUXvndEAwsiKqCaMe/Olj8QvRAKmS5H4jHQQo3tmApkAyZLW', '2024-01-30 20:49:33', NULL, '1'),
(53, 7, 'william.runolfsson@example.org', '$2y$10$0BXRg.HDUICySMb89JnjO.SjgDi6w/Qu6gb.1VzjGwifYZKyBGEIa', '2024-01-30 20:49:33', NULL, '1'),
(54, 7, 'lind.keshawn@example.net', '$2y$10$Bakm3L50xRFRaUPH1XruAOTZq.tIcpZXG/BrupL/MppxnY7/MoOwm', '2024-01-30 20:49:33', NULL, '1'),
(55, 7, 'ernser.jesus@example.net', '$2y$10$UDF2yvrrLStJYabM8Qtk9.SGS.CRpnbvDlv.sTIsoTR6IHRW6hzii', '2024-01-30 20:49:33', NULL, '1'),
(56, 7, 'wcollier@example.org', '$2y$10$7i73flZTI0TJNyGQSUMUmOkv39j2PCzE5RORMYpFeLRYE21tGTE2y', '2024-01-30 20:49:33', NULL, '1'),
(57, 7, 'murphy.mateo@example.com', '$2y$10$t0AGHijyIgnzNPYSb61XX.JqJqtzFS2p7ghI4zbrzOOwvjNaDaKoO', '2024-01-30 20:49:33', NULL, '1'),
(58, 7, 'elvera.schaden@example.org', '$2y$10$J91hGZOIB.kak/sq1eeCue607mcHfRhvgCPpcw3plM.SssADFP8Rq', '2024-01-30 20:49:33', NULL, '1'),
(59, 7, 'hand.jordi@example.net', '$2y$10$P5PU4hPZs4hmrD8N9OBT.OQd16CVFqyUXz4zfQM/38k6PdKQMU0BC', '2024-01-30 20:49:33', NULL, '1'),
(60, 7, 'lang.efren@example.org', '$2y$10$YS4mRmfgp2PinZlr9b3V0eGDODep/1JYNKODSYAceBvgbXZ3GdLbK', '2024-01-30 20:49:33', NULL, '1'),
(61, 7, 'nina15@example.org', '$2y$10$DVXmdeKy/vK0LXd.MIn8w.9iddPEXKEaQCIBnqRAXxI1ZyB9j7nuO', '2024-01-30 20:49:33', NULL, '1'),
(62, 7, 'vada.spencer@example.org', '$2y$10$8wctogGc7IUiXly9nd7nWeMTQEayDIPDX509fS6Gc6oXuY8zluA4.', '2024-01-30 20:49:33', NULL, '1'),
(63, 7, 'king.janis@example.com', '$2y$10$SyqEJzHRKXxo7bUPQfRKH.bu0QxmsGIzUJ0DLSL7AEsiDaYqBWH8i', '2024-01-30 20:49:33', '2024-01-31 15:12:30', '1'),
(64, 7, 'erich.franecki@example.com', '$2y$10$KlS8uoplOx2Yb1ZozNYi5ODFftOqExaeRm6bgdxI8j7Qrtjk88OVS', '2024-01-30 20:49:33', '2024-01-31 15:12:12', '1'),
(65, 7, 'kunze.anais@example.com', '$2y$10$LyJ0kOaFUZIuVkCgCtSHYuUswlWHMf/zyW/9Y.Db0B.hvWQyDtp6K', '2024-01-30 20:49:33', '2024-01-31 15:04:14', '1');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD CONSTRAINT `administrativos_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id_docente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`id_nivel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_3` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id_materia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_4` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`id_grado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id_docente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id_materia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `calificaciones_ibfk_3` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id_estudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_ibfk_2` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`id_nivel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_ibfk_3` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`id_grado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `grados`
--
ALTER TABLE `grados`
  ADD CONSTRAINT `grados_ibfk_1` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`id_nivel`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `kardexs`
--
ALTER TABLE `kardexs`
  ADD CONSTRAINT `kardexs_ibfk_1` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id_docente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `kardexs_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id_materia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `kardexs_ibfk_3` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id_estudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD CONSTRAINT `niveles_ibfk_1` FOREIGN KEY (`gestion_id`) REFERENCES `gestiones` (`id_gestion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id_estudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ppffs`
--
ALTER TABLE `ppffs`
  ADD CONSTRAINT `ppffs_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id_estudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  ADD CONSTRAINT `roles_permisos_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id_rol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_permisos_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id_permiso`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id_rol`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
