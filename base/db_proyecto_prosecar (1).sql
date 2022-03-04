-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2022 at 05:29 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_proyecto_prosecar`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_editar_usuarios` (IN `ID` INT(5), IN `ROL` INT(5), IN `ESTADO` INT(5), IN `USUARIO` VARCHAR(15), IN `PASS` INT(255))  UPDATE tbl_usuario U SET
U.NOMBRE_USUARIO = USUARIO,
U.CODIGO_ESTADO = ESTADO,
U.CODIGO_TIPO_ROL = ROL,
U.CONTRASENA = PASS
WHERE U.CODIGO_USUARIO = ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_obtener_cod_usuario` (IN `NOMBRE` VARCHAR(50), IN `PASS` VARBINARY(128))  SELECT u.CODIGO_USUARIO
FROM tbl_usuario u
WHERE u.NOMBRE_USUARIO = NOMBRE AND u.CONTRASENA = PASS$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bitacora_sistema`
--

CREATE TABLE `tbl_bitacora_sistema` (
  `CODIGO_BITACORA` int(5) NOT NULL,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  `ACCION` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_bitacora_sistema`
--

INSERT INTO `tbl_bitacora_sistema` (`CODIGO_BITACORA`, `CODIGO_USUARIO`, `CODIGO_OBJETO`, `FECHA`, `ACCION`, `DESCRIPCION`) VALUES
(1, 1, 1, '2022-02-25 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(2, 2, 1, '2022-02-25 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(3, 2, 1, '2022-02-25 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(4, 1, 1, '2022-02-25 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(5, 1, 1, '2022-02-25 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(6, 1, 1, '2022-02-25 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(7, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(8, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(9, 1, 1, '2022-02-25 00:00:00', 'Ingreso', 'Se registro un Usuario '),
(10, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(11, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(12, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(13, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la bitacora universal', 'Consultar la informacion de la bitacora'),
(14, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(15, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(16, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(17, 1, 1, '2022-02-25 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(18, 41, 1, '2022-02-25 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(19, 41, 1, '2022-02-25 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(20, 41, 1, '2022-02-25 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(21, 41, 1, '2022-02-25 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(22, 1, 1, '2022-02-25 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(23, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(24, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(25, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(26, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(27, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(28, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(29, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(30, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(31, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(32, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(33, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(34, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(35, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(36, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(37, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(38, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(39, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(40, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(41, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(42, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(43, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(44, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(45, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios'),
(46, 1, 1, '2022-02-25 00:00:00', 'Ingreso a la tabla usuarios registrados', 'Ver los registros de los usuarios');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_correo_electronico`
--

CREATE TABLE `tbl_correo_electronico` (
  `correo_persona` varchar(50) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_correo_electronico`
--

INSERT INTO `tbl_correo_electronico` (`correo_persona`, `CODIGO_PERSONA`) VALUES
('proyecto_prosecar@hotmail.com', 1),
('AlexanderSarmiento@gmail.com', 34),
('proyecto_prosecar@hotmail.com	\r\n', 35),
('aacaballero@unah.hn', 36);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_direccion`
--

CREATE TABLE `tbl_direccion` (
  `CODIGO_DIRECCION` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estado`
--

CREATE TABLE `tbl_estado` (
  `CODIGO_ESTADO` int(5) NOT NULL,
  `NOMBRE` varchar(15) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_estado`
--

INSERT INTO `tbl_estado` (`CODIGO_ESTADO`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'NUEVO', 'este es un nuevo usuario'),
(2, 'ACTIVO', 'este usuario esta activo'),
(3, 'INACTIVO', 'este usuario esta Inactivo'),
(4, 'BLOQUEADO', 'este usuario esta bloqueado'),
(5, 'PENDIENTE', 'Esta en espera de validar el usuario'),
(6, 'INDEFINIDO', 'usó el auto registro');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ms_hist_contraseña`
--

CREATE TABLE `tbl_ms_hist_contraseña` (
  `CODIGO_HIST_CONTRASEÑA` int(5) NOT NULL,
  `CODIGO_USUARIO` int(5) NOT NULL,
  `CONTRASEÑA` varchar(30) NOT NULL,
  `CREADO_POR_USUARIO` int(5) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` int(5) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ms_hist_contraseña`
--

INSERT INTO `tbl_ms_hist_contraseña` (`CODIGO_HIST_CONTRASEÑA`, `CODIGO_USUARIO`, `CONTRASEÑA`, `CREADO_POR_USUARIO`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`) VALUES
(1, 2, 'Pedro12*', 2, NULL, NULL, NULL),
(2, 2, 'Pedro123*', 2, NULL, NULL, NULL),
(3, 41, 'Rosas12*', 41, NULL, NULL, NULL),
(4, 41, 'Rosas123**', 41, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_objetos`
--

CREATE TABLE `tbl_objetos` (
  `CODIGO_OBJETO` int(11) NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_objetos`
--

INSERT INTO `tbl_objetos` (`CODIGO_OBJETO`, `NOMBRE`, `DESCRIPCION`, `CREADO_POR_USUARIO`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`) VALUES
(1, 'Administracion', 'Sistema de administracion', 'Administrador', '2022-02-09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parametros`
--

CREATE TABLE `tbl_parametros` (
  `CODIGO_PARAMETRO` int(11) NOT NULL,
  `PARAMETRO` varchar(50) DEFAULT NULL,
  `VALOR` varchar(100) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_parametros`
--

INSERT INTO `tbl_parametros` (`CODIGO_PARAMETRO`, `PARAMETRO`, `VALOR`, `CREADO_POR_USUARIO`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`) VALUES
(1, 'NUM_INTEN_VALIDOS', '3', 'Administrador', '2022-02-07', 'Administrador', '2022-02-07'),
(2, 'NUM_MAX_PREGUNTAS', '3', 'Administrador', '2022-02-07', 'Administrador', '2022-02-07'),
(3, 'NUM_MAX_CONTRASENAS', '5', 'Administrador', '2022-02-07', 'Administrador', '2022-02-07'),
(4, 'NUM_MAX_CARACTER', '30', 'Administrador', '2022-02-07', 'Administrador', '2022-02-07'),
(5, 'ADMIN_SERVIDOR_CORREO', 'smtp-mail.outlook.com', 'Administrador', '2022-02-23', NULL, NULL),
(6, 'ADMIN_CPUERTO', '587', 'Administrador', '2022-02-23', NULL, NULL),
(7, 'ADMIN_CPASSWORD', 'Prosecar2021*', 'Administrador', '2022-02-23', NULL, NULL),
(8, 'ADMIN_CUSUARIO', 'proyecto_prosecar@hotmail.com', '', '0000-00-00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parametros_usuarios`
--

CREATE TABLE `tbl_parametros_usuarios` (
  `CODIGO_PARAM_USUARIO` int(11) NOT NULL,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `CODIGO_PARAMETRO` int(5) DEFAULT NULL,
  `PAR_VALOR` int(5) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_parametros_usuarios`
--

INSERT INTO `tbl_parametros_usuarios` (`CODIGO_PARAM_USUARIO`, `CODIGO_USUARIO`, `CODIGO_PARAMETRO`, `PAR_VALOR`, `CREADO_POR_USUARIO`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`) VALUES
(1, 2, 2, 3, NULL, NULL, NULL, NULL),
(2, 2, 1, 0, NULL, NULL, NULL, NULL),
(3, 1, 1, 0, 'Administrador', '2022-02-01', NULL, NULL),
(4, 40, 1, 0, NULL, NULL, NULL, NULL),
(5, 40, 2, 0, NULL, NULL, NULL, NULL),
(6, 40, 3, 0, NULL, NULL, NULL, NULL),
(7, 41, 1, 3, NULL, NULL, NULL, NULL),
(8, 41, 2, 0, NULL, NULL, NULL, NULL),
(9, 41, 3, 0, NULL, NULL, NULL, NULL),
(10, 42, 1, 0, NULL, NULL, NULL, NULL),
(11, 42, 2, 0, NULL, NULL, NULL, NULL),
(12, 42, 3, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_persona`
--

CREATE TABLE `tbl_persona` (
  `CODIGO_PERSONA` int(5) NOT NULL,
  `PRIMER_NOMBRE` varchar(20) NOT NULL,
  `SEGUNDO_NOMBRE` varchar(20) DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(20) DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(20) DEFAULT NULL,
  `DNI` varchar(15) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `LUGAR_NACIMIENTO` varchar(30) DEFAULT NULL,
  `FECHA_INSCRIPCION` date DEFAULT NULL,
  `FECHA_BAJA` date DEFAULT NULL,
  `CODIGO_TIPO_PERSONA` int(5) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  `SEXO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_persona`
--

INSERT INTO `tbl_persona` (`CODIGO_PERSONA`, `PRIMER_NOMBRE`, `SEGUNDO_NOMBRE`, `PRIMER_APELLIDO`, `SEGUNDO_APELLIDO`, `DNI`, `FECHA_NACIMIENTO`, `LUGAR_NACIMIENTO`, `FECHA_INSCRIPCION`, `FECHA_BAJA`, `CODIGO_TIPO_PERSONA`, `CREADO_POR_USUARIO`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`, `SEXO`) VALUES
(1, 'Admin', 'Admin', 'Admin', 'Admin', NULL, NULL, NULL, '2022-02-11', NULL, 1, NULL, '0000-00-00', NULL, '0000-00-00', NULL),
(2, 'Pedro', 'Luis', 'Amador', NULL, '0801-1990-00015', '2022-02-14', 'Tegucigalpa', '2022-02-11', NULL, 2, 'Administrador', '2022-02-11', NULL, '0000-00-00', NULL),
(34, 'ALEXANDER', 'RAUL', 'GIMARAES', 'SARMINETO', '0801199087873', '2009-12-30', 'Tokio', '2022-02-25', NULL, 2, 'NO DEFINIDO', '2022-02-25', NULL, '0000-00-00', '2'),
(35, 'ROSA', 'MARIA', 'YANES', 'PADILLA', '8080802813912', '2009-12-30', 'Tokio', '2022-02-25', NULL, 2, 'NO DEFINIDO', '2022-02-25', NULL, '0000-00-00', '1'),
(36, 'ROMARIO', 'PABLO', 'PAGUADA', 'ROGELIO', '0889-1998-909', '2010-12-29', 'TEGUCIGALPA', '2022-02-25', NULL, 3, 'NO DEFINIDO', '2022-02-25', NULL, '2022-02-25', 'm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_preguntas`
--

CREATE TABLE `tbl_preguntas` (
  `CODIGO_PREGUNTAS` int(11) NOT NULL,
  `PREGUNTA` varchar(60) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_preguntas`
--

INSERT INTO `tbl_preguntas` (`CODIGO_PREGUNTAS`, `PREGUNTA`, `CREADO_POR_USUARIO`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`) VALUES
(1, '¿Cual el tu comida favorita?', 'Administrador', '2022-02-06', NULL, NULL),
(2, '¿Nombre de tu caricatura favorita de la infancia?', 'Administrador', '2022-02-06', NULL, NULL),
(3, '¿Nombre de tu pelicula favorita de la infancia?', 'Administrador', '0000-00-00', NULL, NULL),
(4, '¿Pariente que mas admira?', 'Administrador', '2022-02-02', NULL, NULL),
(5, '¿Nombre de mascota favorito?', 'Administrador', '2022-02-01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_preguntas_usuarios`
--

CREATE TABLE `tbl_preguntas_usuarios` (
  `CODIGO_PREGUNTA_USUARIO` int(11) NOT NULL,
  `CODIGO_PREGUNTAS` int(5) DEFAULT NULL,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `RESPUESTA` varchar(60) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_preguntas_usuarios`
--

INSERT INTO `tbl_preguntas_usuarios` (`CODIGO_PREGUNTA_USUARIO`, `CODIGO_PREGUNTAS`, `CODIGO_USUARIO`, `RESPUESTA`, `CREADO_POR_USUARIO`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`) VALUES
(1, 1, 2, 'BALEADA', 'Administrador', NULL, NULL, NULL),
(3, 2, 2, 'KLDSLKJDASK', NULL, NULL, NULL, NULL),
(6, 3, 2, 'MONJA', NULL, NULL, NULL, NULL),
(7, 4, 2, 'JKJKGKJG', NULL, NULL, NULL, NULL),
(8, 1, 41, 'PESACAO', NULL, NULL, NULL, NULL),
(9, 2, 41, 'LOS PICAPIEDRAS', NULL, NULL, NULL, NULL),
(10, 3, 41, 'LA ROSA', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `CODIGO_TIPO_ROL` int(5) NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`CODIGO_TIPO_ROL`, `NOMBRE`, `DESCRIPCION`, `CREADO_POR_USUARIO`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`) VALUES
(1, 'Administrador', 'tiene todos los permisos del sistema', 'Administrador', '2022-02-11', NULL, NULL),
(2, 'Tutor', 'Usuario con permisos al modulo de escuela', 'Administrador', '2022-02-11', NULL, NULL),
(3, 'Indefinido', 'Rol no definido para el usuario', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles_objetos`
--

CREATE TABLE `tbl_roles_objetos` (
  `CODIGO_ROL` int(5) DEFAULT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `PERMISO_INSERCION` varchar(10) DEFAULT NULL,
  `FECHA_CREACION` varchar(10) DEFAULT NULL,
  `CREADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `PERMISO_CONSULTAR` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sexo`
--

CREATE TABLE `tbl_sexo` (
  `CODIGO_SEXO` char(1) COLLATE utf8mb4_bin NOT NULL,
  `SEXO` varchar(10) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `tbl_sexo`
--

INSERT INTO `tbl_sexo` (`CODIGO_SEXO`, `SEXO`) VALUES
('F', 'Femenino'),
('M', 'Masculino');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_telefono`
--

CREATE TABLE `tbl_telefono` (
  `CODIGO_TELEFONO` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `NUMERO_TELEFONO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_telefono`
--

INSERT INTO `tbl_telefono` (`CODIGO_TELEFONO`, `CODIGO_PERSONA`, `NUMERO_TELEFONO`) VALUES
(23286328, 34, '23286328'),
(32131231, 35, '32131231'),
(2147483647, 36, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_persona`
--

CREATE TABLE `tbl_tipo_persona` (
  `CODIGO_TIPO_PERSONA` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_tipo_persona`
--

INSERT INTO `tbl_tipo_persona` (`CODIGO_TIPO_PERSONA`, `NOMBRE`) VALUES
(1, 'Administrador'),
(2, 'Tutor'),
(3, 'no definido');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `CODIGO_USUARIO` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `USUARIO` varchar(15) DEFAULT NULL,
  `NOMBRE_USUARIO` varchar(15) NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CONTRASENA` varchar(255) NOT NULL,
  `FECHA_ULTIMA_CONEXION` date DEFAULT NULL,
  `PREGUNTAS_CONTESTADAS` int(5) NOT NULL,
  `PRIMER_INGRESO` int(5) NOT NULL,
  `FECHA_VENCIMIENTO` date DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`CODIGO_USUARIO`, `CODIGO_PERSONA`, `USUARIO`, `NOMBRE_USUARIO`, `CODIGO_ESTADO`, `CODIGO_TIPO_ROL`, `CONTRASENA`, `FECHA_ULTIMA_CONEXION`, `PREGUNTAS_CONTESTADAS`, `PRIMER_INGRESO`, `FECHA_VENCIMIENTO`, `CREADO_POR`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`) VALUES
(1, 1, 'Admin', 'ADMIN', 2, 1, '12345', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Tutor', 'PEDROLUIS', 2, 2, 'Pedro123*', '2022-02-11', 3, 0, '2022-02-28', NULL, NULL, '2', NULL),
(40, 34, NULL, 'ALEXANDER', 1, 1, '$2y$10$E1b07xJE.u2HazAJBG9KcO.1C.15MP9ZrL62FgmjEkeSBp48Xcwuq', NULL, 0, 0, '0000-00-00', '', '2022-02-25', NULL, NULL),
(41, 35, NULL, 'ROSAS', 5, 2, '.=(@*/Aa', NULL, 0, 0, '0000-00-00', '', '2022-02-25', '41', NULL),
(42, 36, NULL, 'RAFALEE', 6, 3, 'Rafa123*9', NULL, 0, 0, '2022-04-26', NULL, '2022-02-25', NULL, NULL);

--
-- Triggers `tbl_usuario`
--
DELIMITER $$
CREATE TRIGGER `TRIGGER_ASIGNAR_PARAMETROS` AFTER INSERT ON `tbl_usuario` FOR EACH ROW BEGIN
IF(NEW.Codigo_usuario=1) THEN
INSERT INTO tbl_parametros_usuarios(Codigo_usuario, Codigo_parametro,Par_valor)
values(NEW.Codigo_usuario,1,0);

ELSE
INSERT INTO tbl_parametros_usuarios(Codigo_usuario, Codigo_parametro,Par_valor)
values(NEW.Codigo_usuario,1,0); INSERT INTO tbl_parametros_usuarios(Codigo_usuario, Codigo_parametro,Par_valor) values(NEW.Codigo_usuario,2,0); 
INSERT INTO tbl_parametros_usuarios(Codigo_usuario, Codigo_parametro,Par_valor) values(NEW.Codigo_usuario,3,0);
END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bitacora_sistema`
--
ALTER TABLE `tbl_bitacora_sistema`
  ADD PRIMARY KEY (`CODIGO_BITACORA`);

--
-- Indexes for table `tbl_correo_electronico`
--
ALTER TABLE `tbl_correo_electronico`
  ADD PRIMARY KEY (`correo_persona`),
  ADD KEY `FK_CORREO` (`CODIGO_PERSONA`);

--
-- Indexes for table `tbl_direccion`
--
ALTER TABLE `tbl_direccion`
  ADD PRIMARY KEY (`CODIGO_DIRECCION`),
  ADD KEY `FK_COD_DIRECCIONES` (`CODIGO_PERSONA`);

--
-- Indexes for table `tbl_estado`
--
ALTER TABLE `tbl_estado`
  ADD PRIMARY KEY (`CODIGO_ESTADO`);

--
-- Indexes for table `tbl_ms_hist_contraseña`
--
ALTER TABLE `tbl_ms_hist_contraseña`
  ADD PRIMARY KEY (`CODIGO_HIST_CONTRASEÑA`),
  ADD KEY `FK_COD_USU_HISCON` (`CODIGO_USUARIO`);

--
-- Indexes for table `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  ADD PRIMARY KEY (`CODIGO_OBJETO`);

--
-- Indexes for table `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  ADD PRIMARY KEY (`CODIGO_PARAMETRO`);

--
-- Indexes for table `tbl_parametros_usuarios`
--
ALTER TABLE `tbl_parametros_usuarios`
  ADD PRIMARY KEY (`CODIGO_PARAM_USUARIO`),
  ADD KEY `FK_CODPAR_USU` (`CODIGO_USUARIO`),
  ADD KEY `FK_CODPAR_PAR` (`CODIGO_PARAMETRO`);

--
-- Indexes for table `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD PRIMARY KEY (`CODIGO_PERSONA`),
  ADD KEY `FK_COD_TIP_PERSONA` (`CODIGO_TIPO_PERSONA`);

--
-- Indexes for table `tbl_preguntas`
--
ALTER TABLE `tbl_preguntas`
  ADD PRIMARY KEY (`CODIGO_PREGUNTAS`);

--
-- Indexes for table `tbl_preguntas_usuarios`
--
ALTER TABLE `tbl_preguntas_usuarios`
  ADD PRIMARY KEY (`CODIGO_PREGUNTA_USUARIO`),
  ADD KEY `FK_CODPRE_PREU` (`CODIGO_PREGUNTAS`),
  ADD KEY `FK_CODU_PREU` (`CODIGO_USUARIO`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`CODIGO_TIPO_ROL`);

--
-- Indexes for table `tbl_sexo`
--
ALTER TABLE `tbl_sexo`
  ADD PRIMARY KEY (`CODIGO_SEXO`);

--
-- Indexes for table `tbl_telefono`
--
ALTER TABLE `tbl_telefono`
  ADD PRIMARY KEY (`CODIGO_TELEFONO`),
  ADD KEY `FK_TEL_PER` (`CODIGO_PERSONA`);

--
-- Indexes for table `tbl_tipo_persona`
--
ALTER TABLE `tbl_tipo_persona`
  ADD PRIMARY KEY (`CODIGO_TIPO_PERSONA`);

--
-- Indexes for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`CODIGO_USUARIO`),
  ADD KEY `FK_CODPER_USU` (`CODIGO_PERSONA`),
  ADD KEY `FK_CODROL_USU` (`CODIGO_TIPO_ROL`),
  ADD KEY `FK_CODES_USU` (`CODIGO_ESTADO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bitacora_sistema`
--
ALTER TABLE `tbl_bitacora_sistema`
  MODIFY `CODIGO_BITACORA` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_direccion`
--
ALTER TABLE `tbl_direccion`
  MODIFY `CODIGO_DIRECCION` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_estado`
--
ALTER TABLE `tbl_estado`
  MODIFY `CODIGO_ESTADO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_ms_hist_contraseña`
--
ALTER TABLE `tbl_ms_hist_contraseña`
  MODIFY `CODIGO_HIST_CONTRASEÑA` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  MODIFY `CODIGO_OBJETO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  MODIFY `CODIGO_PARAMETRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_parametros_usuarios`
--
ALTER TABLE `tbl_parametros_usuarios`
  MODIFY `CODIGO_PARAM_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_persona`
--
ALTER TABLE `tbl_persona`
  MODIFY `CODIGO_PERSONA` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_preguntas`
--
ALTER TABLE `tbl_preguntas`
  MODIFY `CODIGO_PREGUNTAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_preguntas_usuarios`
--
ALTER TABLE `tbl_preguntas_usuarios`
  MODIFY `CODIGO_PREGUNTA_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `CODIGO_TIPO_ROL` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_telefono`
--
ALTER TABLE `tbl_telefono`
  MODIFY `CODIGO_TELEFONO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `tbl_tipo_persona`
--
ALTER TABLE `tbl_tipo_persona`
  MODIFY `CODIGO_TIPO_PERSONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `CODIGO_USUARIO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_correo_electronico`
--
ALTER TABLE `tbl_correo_electronico`
  ADD CONSTRAINT `FK_CORREO` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`);

--
-- Constraints for table `tbl_direccion`
--
ALTER TABLE `tbl_direccion`
  ADD CONSTRAINT `FK_COD_DIRECCIONES` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`);

--
-- Constraints for table `tbl_ms_hist_contraseña`
--
ALTER TABLE `tbl_ms_hist_contraseña`
  ADD CONSTRAINT `FK_COD_USU_HISCON` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`);

--
-- Constraints for table `tbl_parametros_usuarios`
--
ALTER TABLE `tbl_parametros_usuarios`
  ADD CONSTRAINT `FK_CODPAR_PAR` FOREIGN KEY (`CODIGO_PARAMETRO`) REFERENCES `tbl_parametros` (`CODIGO_PARAMETRO`),
  ADD CONSTRAINT `FK_CODPAR_USU` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`);

--
-- Constraints for table `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD CONSTRAINT `FK_COD_TIP_PERSONA` FOREIGN KEY (`CODIGO_TIPO_PERSONA`) REFERENCES `tbl_tipo_persona` (`CODIGO_TIPO_PERSONA`);

--
-- Constraints for table `tbl_preguntas_usuarios`
--
ALTER TABLE `tbl_preguntas_usuarios`
  ADD CONSTRAINT `FK_CODPRE_PREU` FOREIGN KEY (`CODIGO_PREGUNTAS`) REFERENCES `tbl_preguntas` (`CODIGO_PREGUNTAS`),
  ADD CONSTRAINT `FK_CODU_PREU` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`);

--
-- Constraints for table `tbl_telefono`
--
ALTER TABLE `tbl_telefono`
  ADD CONSTRAINT `FK_TEL_PER` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`);

--
-- Constraints for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `FK_CODES_USU` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  ADD CONSTRAINT `FK_CODPER_USU` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  ADD CONSTRAINT `FK_CODROL_USU` FOREIGN KEY (`CODIGO_TIPO_ROL`) REFERENCES `tbl_roles` (`CODIGO_TIPO_ROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
