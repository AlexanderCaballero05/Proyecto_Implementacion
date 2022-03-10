-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2022 at 12:12 AM
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_evaluar_usuario` (IN `USUARIO` VARCHAR(30))  BEGIN
START TRANSACTION;
SELECT u.CODIGO_TIPO_ROL
FROM tbl_usuario u
WHERE u.NOMBRE_USUARIO LIKE USUARIO;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_existen_permisos_asignados` (IN `ROL` INT, IN `OBJETO` INT)  BEGIN
SELECT * FROM tbl_permisos p 
WHERE p.CODIGO_TIPO_ROL = ROL
AND P.CODIGO_OBJETO = OBJETO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_menus_sistemas` (IN `USUARIO` VARCHAR(30))  BEGIN
START TRANSACTION;
SELECT CODIGO_TIPO_ROL FROM tbl_usuario u WHERE u.NOMBRE_USUARIO = USUARIO;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_modificar_usuarios` (IN `CPERSONA` INT, IN `PNOMBRE` VARCHAR(15), IN `PAPELLIDO` VARCHAR(15), IN `PCORREO` VARCHAR(50), IN `PUSUARIO` VARCHAR(15), IN `UESTADO` INT(5), IN `UROL` INT(5), IN `USERREGIS` VARCHAR(15))  BEGIN
START TRANSACTION;
UPDATE tbl_persona p SET
p.PRIMER_NOMBRE = PNOMBRE,
p.PRIMER_APELLIDO = PAPELLIDO
WHERE p.CODIGO_PERSONA = CPERSONA;
UPDATE tbl_correo_electronico c SET
c.correo_persona = PCORREO
WHERE c.CODIGO_PERSONA = CPERSONA;
UPDATE tbl_usuario u SET
u.NOMBRE_USUARIO = PUSUARIO,
u.CODIGO_ESTADO = UESTADO,
u.CODIGO_TIPO_ROL = UROL,
U.FECHA_MODIFICACION = now(),
u.MODIFICADO_POR = USERREGIS
WHERE u.CODIGO_PERSONA = CPERSONA;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_mostrar_permisos` ()  BEGIN
IF NOT EXISTS (SELECT * FROM tbl_roles t WHERE t.NOMBRE = NOMBRE) THEN
SET @m='DATOS NO ENCONTRADOS';
SELECT @m;
ELSE 
SELECT p.CODIGO_PERMISO,
       r.CODIGO_TIPO_ROL,
        o.CODIGO_OBJETO ,
        r.NOMBRE AS ROL,
        o.NOMBRE,
        p.INSERTAR,
        p.ELIMINAR,
        p.MOSTRAR,
        p.ACTUALIZAR,
        p.CREADO_POR,
        p.FECHA_CREACION,
        p.MODIFICADO_POR,
        p.FECHA_MODIFICACION
FROM tbl_roles r, tbl_permisos p, tbl_objetos o
WHERE p.CODIGO_TIPO_ROL = r.CODIGO_TIPO_ROL
AND p.CODIGO_OBJETO = o.CODIGO_OBJETO
ORDER BY P.CODIGO_PERMISO;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_mostrar_roles_activos` ()  BEGIN
START TRANSACTION;
SELECT r.CODIGO_TIPO_ROL ,
       r.NOMBRE
FROM tbl_roles r; 
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_obtener_cod_usuario` (IN `NOMBRE` VARCHAR(50), IN `PASS` VARBINARY(128))  SELECT u.CODIGO_USUARIO
FROM tbl_usuario u
WHERE u.NOMBRE_USUARIO = NOMBRE AND u.CONTRASENA = PASS$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_permiso_actualizar` (IN `ROL` INT, IN `OBJETO` INT)  BEGIN
START TRANSACTION;
IF NOT EXISTS (SELECT * FROM tbl_usuario u WHERE u.CODIGO_TIPO_ROL = ROL) THEN
SET @m='EL TIPO DE ROL NO EXISTE';
SELECT @m;
ELSEIF NOT EXISTS (SELECT * FROM tbl_objetos ob WHERE ob.CODIGO_OBJETO = OBJETO) THEN
SET @m='El objeto no existe';
SELECT @m;
ELSE
SELECT p.ACTUALIZAR
FROM tbl_permisos p
WHERE p.CODIGO_TIPO_ROL = ROL
AND P.CODIGO_OBJETO = OBJETO;
END IF;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_permiso_eliminar` (IN `ROL` INT, IN `OBJETO` INT)  BEGIN
START TRANSACTION;
IF NOT EXISTS (SELECT * FROM tbl_usuario u WHERE u.CODIGO_TIPO_ROL = ROL) THEN
SET @m='EL TIPO DE ROL NO EXISTE';
SELECT @m;
ELSEIF NOT EXISTS (SELECT * FROM tbl_objetos ob WHERE ob.CODIGO_OBJETO = OBJETO) THEN
SET @m='El objeto no existe';
SELECT @m;
ELSE
SELECT p.ELIMINAR
FROM tbl_permisos p
WHERE p.CODIGO_TIPO_ROL = ROL
AND P.CODIGO_OBJETO = OBJETO;
END IF;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_permiso_insertar` (IN `ROL` INT, IN `OBJETO` INT)  BEGIN
START TRANSACTION;
IF NOT EXISTS (SELECT * FROM tbl_usuario u WHERE u.CODIGO_TIPO_ROL = ROL) THEN
SET @m='EL TIPO DE ROL NO EXISTE';
SELECT @m;
ELSEIF NOT EXISTS (SELECT * FROM tbl_objetos ob WHERE ob.CODIGO_OBJETO = OBJETO) THEN
SET @m='El objeto no existe';
SELECT @m;
ELSE
SELECT p.INSERTAR
FROM tbl_permisos p
WHERE p.CODIGO_TIPO_ROL = ROL
AND P.CODIGO_OBJETO = OBJETO;
END IF;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_reset_contrasena` (IN `CPERSONA` INT, IN `PASS` VARCHAR(30))  BEGIN
START TRANSACTION;
UPDATE tbl_usuario u SET
u.CONTRASENA = PASS,
u.FECHA_MODIFICACION = now()
WHERE u.CODIGO_PERSONA = CPERSONA;
COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_area`
--

CREATE TABLE `tbl_area` (
  `CODIGO_AREA` int(5) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(150) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(2, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(3, 1, 1, '2022-03-02 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(4, 1, 1, '2022-03-02 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(5, 1, 1, '2022-03-02 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(6, 1, 1, '2022-03-02 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(7, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(8, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(9, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(10, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(11, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(12, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(13, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(14, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(15, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(16, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(17, 1, 1, '2022-03-02 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(18, 1, 1, '2022-03-02 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(19, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(20, 1, 1, '2022-03-03 00:00:00', 'Modificacion', 'Se edito un rol '),
(21, 1, 1, '2022-03-03 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(22, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(23, 1, 1, '2022-03-03 00:00:00', 'Modificacion', 'Se edito un rol '),
(24, 1, 1, '2022-03-03 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(25, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(26, 1, 1, '2022-03-03 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(27, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(28, 1, 1, '2022-03-03 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(29, 2, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(30, 2, 1, '2022-03-03 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(31, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(32, 1, 1, '2022-03-03 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(33, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(34, 1, 1, '2022-03-03 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(35, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(36, 1, 1, '2022-03-03 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(37, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(38, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(39, 1, 1, '2022-03-03 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(40, 1, 1, '2022-03-03 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(41, 1, 1, '2022-03-04 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(42, 1, 1, '2022-03-04 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(43, 1, 1, '2022-03-04 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(44, 1, 1, '2022-03-04 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(45, 1, 1, '2022-03-04 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(46, 2, 1, '2022-03-04 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(47, 2, 1, '2022-03-04 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(48, 1, 1, '2022-03-04 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(49, 1, 1, '2022-03-05 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(50, 1, 1, '2022-03-05 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(51, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(52, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(53, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la bitacora universal', 'Consultar la informacion de la bitacora'),
(54, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(55, 1, 1, '2022-03-05 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(56, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(57, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(58, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(59, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(60, 1, 5, '2022-03-05 00:00:00', 'Ingreso a mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(61, 1, 5, '2022-03-05 00:00:00', 'Ingreso a mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(62, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(63, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(64, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(65, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(66, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(67, 1, 5, '2022-03-05 00:00:00', 'Se insertaron permisos al rol', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(68, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(69, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(70, 1, 5, '2022-03-05 00:00:00', 'Se insertaron permisos al rol', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(71, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(72, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(73, 1, 5, '2022-03-05 00:00:00', 'Se insertaron permisos al rol', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(74, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(75, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(76, 1, 5, '2022-03-05 00:00:00', 'Se modificaron permisos a un rol', 'Se modifico permisos a un tipo de rol'),
(77, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(78, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(79, 1, 5, '2022-03-05 00:00:00', 'Se modificaron permisos a un rol', 'Se modifico permisos a un tipo de rol'),
(80, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(81, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(82, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(83, 1, 5, '2022-03-05 00:00:00', 'Se modificaron permisos a un rol', 'Se modifico permisos a un tipo de rol'),
(84, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(85, 1, 5, '2022-03-05 00:00:00', 'Ingreso al mantenimiento permisos', 'Aqui se visualiza los registros de los permisos de los roles de usuario'),
(86, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(87, 1, 1, '2022-03-05 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(88, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(89, 1, 1, '2022-03-05 00:00:00', 'Ingreso a la tabla de registro de usuarios', 'Aqui se pueden crear un usuario'),
(90, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(91, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(92, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se elimino un estado '),
(93, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(94, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(95, 1, 1, '2022-03-06 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(96, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(97, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un rol '),
(98, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(99, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(100, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(101, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(102, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(103, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(104, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(105, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se elimino un estado '),
(106, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(107, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(108, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(109, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se elimino un estado '),
(110, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se elimino un estado '),
(111, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se elimino un estado '),
(112, 1, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se elimino un estado '),
(113, 1, 1, '2022-03-06 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(114, 1, 1, '2022-03-06 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(115, 1, 14, '2022-03-06 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(116, 0, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(117, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(118, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(119, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(120, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(121, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(122, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(123, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(124, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(125, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(126, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(127, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(128, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(129, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(130, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(131, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(132, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(133, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(134, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(135, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(136, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(137, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(138, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(139, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(140, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(141, 1, 13, '2022-03-06 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(142, 1, 13, '2022-03-06 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(143, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(144, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(145, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(146, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(147, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(148, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(149, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(150, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(151, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(152, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(153, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(154, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(155, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(156, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(157, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(158, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(159, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(160, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(161, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(162, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(163, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(164, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(165, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(166, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(167, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(168, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(169, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(170, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(171, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(172, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(173, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(174, 1, 1, '2022-03-06 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(175, 1, 1, '2022-03-06 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(176, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(177, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(178, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(179, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(180, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(181, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(182, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(183, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(184, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(185, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(186, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(187, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(188, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(189, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(190, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(191, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(192, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(193, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(194, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(195, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(196, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(197, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(198, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(199, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(200, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(201, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(202, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(203, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(204, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(205, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(206, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(207, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(208, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(209, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(210, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(211, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(212, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(213, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(214, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(215, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(216, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(217, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(218, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(219, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(220, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(221, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(222, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(223, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(224, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(225, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(226, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(227, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(228, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(229, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(230, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(231, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(232, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(233, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(234, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(235, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(236, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(237, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(238, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(239, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(240, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(241, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(242, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(243, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(244, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(245, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(246, 1, 13, '2022-03-06 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(247, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(248, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(249, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(250, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(251, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(252, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(253, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(254, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(255, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(256, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(257, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(258, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(259, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(260, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(261, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(262, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(263, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(264, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(265, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(266, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(267, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(268, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(269, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(270, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(271, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(272, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(273, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(274, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(275, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(276, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(277, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(278, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(279, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(280, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(281, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(282, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(283, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(284, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(285, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(286, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(287, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(288, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(289, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(290, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(291, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(292, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(293, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(294, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(295, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(296, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(297, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(298, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(299, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(300, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(301, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(302, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(303, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(304, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(305, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(306, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(307, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(308, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(309, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(310, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(311, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(312, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(313, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(314, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(315, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(316, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(317, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(318, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(319, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(320, 0, 1, '2022-03-06 00:00:00', 'Modificacion', 'Se edito un estado '),
(321, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(322, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(323, 1, 13, '2022-03-06 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(324, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(325, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(326, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(327, 1, 20, '2022-03-06 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(328, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(329, 1, 22, '2022-03-07 00:00:00', 'Ingreso a la tabla de Tutorias', 'Usuario se autentifico '),
(330, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(331, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(332, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(333, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(334, 1, 3, '2022-03-07 00:00:00', 'Editar parámetro', 'Se editó el registro de un parámetro ya existente'),
(335, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(336, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(337, 1, 3, '2022-03-07 00:00:00', 'Editar parámetro', 'Se editó el registro de un parámetro ya existente'),
(338, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(339, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(340, 1, 3, '2022-03-07 00:00:00', 'No eliminar parámetro', 'Intento de invalido de eliminar parametro'),
(341, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(342, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(343, 1, 3, '2022-03-07 00:00:00', 'Editar parámetro', 'Se editó el registro de un parámetro ya existente'),
(344, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(345, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(346, 1, 3, '2022-03-07 00:00:00', 'Eliminar parámetro', 'Se eliminó un registro de parámetro'),
(347, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(348, 1, 3, '2022-03-07 00:00:00', 'Insertar parámetro', 'Agregó/insertó un nuevo parámetro'),
(349, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(350, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(351, 1, 14, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(352, 1, 14, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(353, 1, 22, '2022-03-07 00:00:00', 'Ingreso a la tabla de Tutorias', 'Usuario se autentifico '),
(354, 1, 2, '2022-03-07 00:00:00', 'Ingreso a la tabla de roles', 'Usuario se autentifico '),
(355, 1, 3, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento parámetros', 'Aqui se visualiza los registros existentes de la tabla parámetros'),
(356, 1, 1, '2022-03-07 00:00:00', 'Ingreso a la bitacora universal', 'Consultar la informacion de la bitacora'),
(357, 1, 1, '2022-03-07 00:00:00', 'Ingreso a la bitacora universal', 'Consultar la informacion de la bitacora'),
(358, 1, 1, '2022-03-07 00:00:00', 'Ingreso a la bitacora universal', 'Consultar la informacion de la bitacora'),
(359, 1, 1, '2022-03-07 00:00:00', 'Ingreso a la bitacora universal', 'Consultar la informacion de la bitacora'),
(360, 1, 1, '2022-03-07 00:00:00', 'Ingreso a la bitacora universal', 'Consultar la informacion de la bitacora'),
(361, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(362, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(363, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(364, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(365, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(366, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(367, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(368, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(369, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(370, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(371, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(372, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(373, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(374, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(375, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(376, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(377, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(378, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(379, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(380, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(381, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(382, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(383, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(384, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(385, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(386, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(387, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(388, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(389, 1, 22, '2022-03-07 00:00:00', 'Ingreso a la tabla de Tutorias', 'Usuario se autentifico '),
(390, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(391, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(392, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(393, 1, 13, '2022-03-07 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(394, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(395, 1, 13, '2022-03-07 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(396, 1, 13, '2022-03-07 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(397, 1, 13, '2022-03-07 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(398, 1, 22, '2022-03-07 00:00:00', 'Ingreso a la tabla de Tutorias', 'Usuario se autentifico '),
(399, 1, 22, '2022-03-07 00:00:00', 'Ingreso a la tabla de Tutorias', 'Usuario se autentifico '),
(400, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(401, 1, 1, '2022-03-07 00:00:00', 'salio al modulo de administrador', 'Usuario se salio del sistema'),
(402, 1, 1, '2022-03-07 00:00:00', 'Ingreso al modulo de administrador', 'Usuario se autentifico'),
(403, 1, 12, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(404, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(405, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(406, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(407, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(408, 1, 4, '2022-03-07 00:00:00', 'Se agrego una nueva pregunta', 'Preguntas realizadas al usuario para cambio de contraseña'),
(409, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(410, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(411, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(412, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(413, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(414, 1, 4, '2022-03-07 00:00:00', 'Editar Pregunta', 'Se edito una pregunta '),
(415, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(416, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(417, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(418, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(419, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(420, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(421, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(422, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(423, 1, 12, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(424, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(425, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(426, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(427, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(428, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(429, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(430, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(431, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(432, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(433, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(434, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(435, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(436, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(437, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(438, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(439, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(440, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(441, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(442, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(443, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(444, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(445, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(446, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(447, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(448, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(449, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(450, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(451, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(452, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(453, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(454, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(455, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(456, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(457, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(458, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(459, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(460, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(461, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(462, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(463, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(464, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(465, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(466, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico ');
INSERT INTO `tbl_bitacora_sistema` (`CODIGO_BITACORA`, `CODIGO_USUARIO`, `CODIGO_OBJETO`, `FECHA`, `ACCION`, `DESCRIPCION`) VALUES
(467, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(468, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(469, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(470, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(471, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(472, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(473, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(474, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(475, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(476, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(477, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(478, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(479, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(480, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(481, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(482, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(483, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(484, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(485, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(486, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(487, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(488, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(489, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(490, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(491, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(492, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(493, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(494, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(495, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(496, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(497, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(498, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(499, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(500, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(501, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(502, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(503, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(504, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(505, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(506, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(507, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(508, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(509, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(510, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(511, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(512, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(513, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(514, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(515, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(516, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(517, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(518, 1, 12, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(519, 1, 13, '2022-03-07 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(520, 1, 14, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(521, 1, 14, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(522, 1, 1, '2022-03-07 00:00:00', 'Ingreso a la bitacora universal', 'Consultar la informacion de la bitacora'),
(523, 1, 1, '2022-03-07 00:00:00', 'Ingreso a la bitacora universal', 'Consultar la informacion de la bitacora'),
(524, 1, 1, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(525, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(526, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(527, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(528, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(529, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(530, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(531, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(532, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(533, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(534, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(535, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(536, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(537, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(538, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(539, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(540, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(541, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(542, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(543, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(544, 1, 14, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(545, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(546, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(547, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(548, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(549, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(550, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(551, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(552, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(553, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(554, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(555, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(556, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(557, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(558, 1, 4, '2022-03-07 00:00:00', 'Ingreso a mantenimiento preguntas', 'Pregunta realizadas al usuario para cambio de contraseña'),
(559, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(560, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(561, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(562, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(563, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(564, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(565, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(566, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(567, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(568, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(569, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(570, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(571, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(572, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(573, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(574, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(575, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(576, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(577, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(578, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(579, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(580, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(581, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(582, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(583, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(584, 1, 20, '2022-03-07 00:00:00', 'Ingreso al proceso de Carga Academica', 'Usuario se autentifico '),
(585, 1, 13, '2022-03-07 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(586, 1, 13, '2022-03-07 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(587, 1, 13, '2022-03-07 00:00:00', 'Ingreso a la tabla de registro de personas', 'Usuario se autentifico'),
(588, 1, 14, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(589, 1, 14, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios'),
(590, 1, 14, '2022-03-07 00:00:00', 'Ingreso a la pantalla de mantenimiento usuarios', 'Ver los registros de los usuarios');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_calificaciones`
--

CREATE TABLE `tbl_calificaciones` (
  `CODIGO_CALIFICACIONES` int(5) NOT NULL,
  `CODIGO_MATRICULA` int(5) DEFAULT NULL,
  `CALIFICACION` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carga_academica`
--

CREATE TABLE `tbl_carga_academica` (
  `CODIGO_CARGA` int(5) NOT NULL,
  `CODIGO_TUTORIA` int(5) DEFAULT NULL,
  `CODIGO_PERSONA_TUTOR` int(5) DEFAULT NULL,
  `CODIGO_MODALIDAD` int(5) DEFAULT NULL,
  `SECCION` varchar(10) DEFAULT NULL,
  `HORA` time DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FINAL` date DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contenido_socioeconomico`
--

CREATE TABLE `tbl_contenido_socioeconomico` (
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(5) NOT NULL,
  `CODIGO_TIPOSOCIO` int(5) NOT NULL,
  `NOMBRE_TIPO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_contenido_socioeconomico`
--

INSERT INTO `tbl_contenido_socioeconomico` (`CODIGO_CONTENIDO_SOCIOECONOMICO`, `CODIGO_TIPOSOCIO`, `NOMBRE_TIPO`) VALUES
(1, 1, 'Computadora');

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
('gdiaza@unah.hn', 36),
('aacaballero@unah.hn', 37),
('aacaballero@una.hn', 38),
('ld@gmail.com', 39),
('arnoldpballero@gmail.com', 40),
('aaca090lero@unah.hn', 41);

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
(1, 'ACTIVO', 'Este usuario esta ACTIVO'),
(2, 'NUEVO', 'este usuario esta nuevo'),
(3, 'BLOQUEADO', 'este ususario esta bloqueado'),
(4, 'PENDIENTE', 'Esta en espera de usuario validar'),
(5, 'INDEFINIDO', 'Este usuario esta indefinido'),
(6, 'PRUEBAA', 'ESTE ES UN USUARIO DE PRUEBA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estudiante`
--

CREATE TABLE `tbl_estudiante` (
  `CODIGO_ESTUDIANTE` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `GRADO_ACTUAL` int(5) DEFAULT NULL,
  `PASATIEMPOS` varchar(100) DEFAULT NULL,
  `DISTRACTORES_ESCOLARES` varchar(100) DEFAULT NULL,
  `METAS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_estudiante`
--

INSERT INTO `tbl_estudiante` (`CODIGO_ESTUDIANTE`, `CODIGO_PERSONA`, `GRADO_ACTUAL`, `PASATIEMPOS`, `DISTRACTORES_ESCOLARES`, `METAS`) VALUES
(13, 42, 1, 'FUTBOL', 'TELEVISION', 'GRADRUARSE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estudiante_socioeconomico`
--

CREATE TABLE `tbl_estudiante_socioeconomico` (
  `CODIGO_ESTUDIANTE_SOCIOECONOMICO` int(5) NOT NULL,
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_estudiante_socioeconomico`
--

INSERT INTO `tbl_estudiante_socioeconomico` (`CODIGO_ESTUDIANTE_SOCIOECONOMICO`, `CODIGO_CONTENIDO_SOCIOECONOMICO`, `CODIGO_ESTUDIANTE`) VALUES
(5, 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matricula_academica`
--

CREATE TABLE `tbl_matricula_academica` (
  `CODIGO_MATRICULA` int(5) NOT NULL,
  `CODIGO_CARGA` int(5) DEFAULT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `FECHA_MATRICULA` date NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modalidad`
--

CREATE TABLE `tbl_modalidad` (
  `CODIGO_MODALIDA` int(5) NOT NULL,
  `TIPO` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(4, 41, 'Rosas123**', 41, NULL, NULL, NULL),
(5, 43, 'Caballero*1', 43, NULL, NULL, NULL),
(6, 43, 'Prueba123*', 43, NULL, NULL, NULL),
(7, 43, 'Pedro123*', 43, NULL, NULL, NULL),
(8, 43, 'Pedro12*', 43, NULL, NULL, NULL),
(9, 43, 'Pedro12*1', 43, NULL, NULL, NULL),
(10, 47, 'Pruebe12**', 47, NULL, NULL, NULL),
(11, 43, 'Cab16*', 43, NULL, NULL, NULL),
(12, 43, 'Caballe%*1', 43, NULL, NULL, NULL),
(13, 43, 'Caball4*(', 43, NULL, NULL, NULL),
(14, 43, 'Caballer90%^', 43, NULL, NULL, NULL),
(15, 43, 'Caballer90%9', 43, NULL, NULL, NULL),
(16, 43, 'Cball6(*', 43, NULL, NULL, NULL),
(17, 43, 'Cball6(*7', 43, NULL, NULL, NULL),
(18, 43, 'Cball6(*78', 43, NULL, NULL, NULL),
(19, 41, 'A1238a*', 41, NULL, NULL, NULL),
(20, 43, 'Inform123*', 43, NULL, NULL, NULL);

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
(1, 'ESTADO', 'Sistema de administracion', 'Administrador', '2022-02-09', NULL, NULL),
(2, 'ROLES', 'objeto donde se registran personas ', 'Administrador', '2022-02-06', NULL, NULL),
(3, 'PARAMETROS', '', 'Administrador', '2022-03-04', NULL, NULL),
(4, 'PREGUNTAS', 'Objeto mantenimiento Preguntas', 'ADMIN', '2022-03-04', NULL, NULL),
(5, 'PERMISOS', 'Objeto mantenimiento Permisos', 'ADMIN', '2022-03-04', NULL, NULL),
(6, 'OBJETOS', 'Objeto mantenimiento objetos', 'ADMIN', '2022-03-04', NULL, NULL),
(7, 'BITACORA', 'Objeto consulta bitacora', 'ADMIN', '2022-03-04', NULL, NULL),
(8, 'PREGUNTAS_USUARIOS', 'Objeto consulta preguntas usuarios', 'ADMIN', '2022-03-04', NULL, NULL),
(9, 'PARAMETROS_USUARIOS', 'Objeto mantenimiento parametros usuarios', '', '0000-00-00', NULL, NULL),
(10, 'BACKUP ', 'Objeto mantenimiento backup', 'ADMIN', '2022-03-04', NULL, NULL),
(11, 'RESTAURACION', 'Objeto mantenimiento restauracion', 'ADMIN', '2022-03-04', NULL, NULL),
(12, 'TIPO_PERSONAS', 'Mantenimiento de la tabla tipo de personas.', 'ADMIN', '2022-03-04', NULL, NULL),
(13, 'REGISTRAR_PERSONAS', 'Objeto registra una persona.', 'ADMIN', '2022-03-04', NULL, NULL),
(14, 'EDITAR_USARIOS', 'Objeto mantenimiento usuarios.', 'ADMIN', '2022-03-04', NULL, NULL),
(15, 'EDITAR_PERSONAS', 'Objeto mantenimiento personas.', 'ADMIN', '2022-03-04', NULL, NULL),
(16, 'ESTUDIANTES', 'Objeto mantenimiento estudiantes.', 'ADMIN', '2022-03-04', NULL, NULL),
(17, 'TIPO_SOCIOECONOMICO', 'Objeto mantenimiento tipo socioeconomico.', 'ADMIN', '2022-03-04', NULL, NULL),
(18, 'CONTENIDO_SOCIOECONOMICO', 'Objeto mantenimiento contenido socioeconomico.', 'ADMIN', '2022-03-04', NULL, NULL),
(19, 'MODALIDAD', 'Objeto mantenimiento modalidad', 'ADMIN', '2022-03-04', NULL, NULL),
(20, 'CARGA_ACADEMICA', 'Objeto mantenimiento carga académica.', 'ADMIN', '2022-03-04', NULL, NULL),
(21, 'AREA', 'Objeto mantenimiento de área.', 'ADMIN', '2022-03-04', NULL, NULL),
(22, 'TUTORIA', 'Objeto mantenimiento de tutoria.', 'ADMIN', '2022-03-04', NULL, NULL),
(23, 'MATRICULA', 'Objeto mantenimiento matricula.', 'ADMIN', '2022-03-04', NULL, NULL),
(24, 'CALIFICACIONES', 'Objeto mantenimiento calificaciones', 'ADMIN', '2022-03-04', NULL, NULL);

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
(1, 'NUM_INTEN_VALIDOS', '2', 'Administrador', '2022-02-07', 'Administrador', '2022-02-07'),
(2, 'NUM_MAX_PREGUNTAS', '2', 'Administrador', '2022-02-07', 'Administrador', '2022-02-07'),
(3, 'NUM_MAX_CONTRASENAS', '5', 'Administrador', '2022-02-07', 'Administrador', '2022-02-07'),
(4, 'NUM_MAX_CARACTER', '30', 'Administrador', '2022-02-07', 'Administrador', '2022-02-07'),
(5, 'ADMIN_SERVIDOR_CORREO', 'smtp-mail.outlook.com', 'Administrador', '2022-02-23', 'ADMIN', '2022-03-07'),
(7, 'ADMIN_CPASSWORD', 'Prosecar2021*', 'Administrador', '2022-02-23', NULL, NULL),
(8, 'ADMIN_CUSUARIO', 'proyecto_prosecar@hotmail.com', '', '0000-00-00', NULL, NULL),
(9, 'ADMIN_CPUERTO', '587', 'ADMIN', '2022-03-07', NULL, NULL);

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
(7, 41, 1, 0, NULL, NULL, NULL, NULL),
(8, 41, 2, 0, NULL, NULL, NULL, NULL),
(9, 41, 3, 0, NULL, NULL, NULL, NULL),
(10, 42, 1, 0, NULL, NULL, NULL, NULL),
(11, 42, 2, 0, NULL, NULL, NULL, NULL),
(12, 42, 3, 0, NULL, NULL, NULL, NULL),
(13, 43, 1, 2, NULL, NULL, NULL, NULL),
(14, 43, 2, 2, NULL, NULL, NULL, NULL),
(15, 43, 3, 0, NULL, NULL, NULL, NULL),
(16, 44, 1, 0, NULL, NULL, NULL, NULL),
(17, 44, 2, 0, NULL, NULL, NULL, NULL),
(18, 44, 3, 0, NULL, NULL, NULL, NULL),
(19, 45, 1, 0, NULL, NULL, NULL, NULL),
(20, 45, 2, 0, NULL, NULL, NULL, NULL),
(21, 45, 3, 0, NULL, NULL, NULL, NULL),
(22, 46, 1, 0, NULL, NULL, NULL, NULL),
(23, 46, 2, 0, NULL, NULL, NULL, NULL),
(24, 46, 3, 0, NULL, NULL, NULL, NULL),
(25, 47, 1, 0, NULL, NULL, NULL, NULL),
(26, 47, 2, 2, NULL, NULL, NULL, NULL),
(27, 47, 3, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permisos`
--

CREATE TABLE `tbl_permisos` (
  `CODIGO_PERMISO` int(10) NOT NULL,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `INSERTAR` varchar(5) DEFAULT NULL,
  `ELIMINAR` varchar(5) DEFAULT NULL,
  `ACTUALIZAR` varchar(5) DEFAULT NULL,
  `MOSTRAR` varchar(5) DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_permisos`
--

INSERT INTO `tbl_permisos` (`CODIGO_PERMISO`, `CODIGO_TIPO_ROL`, `CODIGO_OBJETO`, `INSERTAR`, `ELIMINAR`, `ACTUALIZAR`, `MOSTRAR`, `CREADO_POR`, `FECHA_CREACION`, `MODIFICADO_POR`, `FECHA_MODIFICACION`) VALUES
(1, 1, 1, 'OFF', 'ON', 'OFF', 'ON', 'Administrador', '2022-03-02', 'ADMIN', '2022-03-06'),
(3, 2, 1, 'OFF', 'OFF', 'OFF', 'ON', 'Administrador', '2022-03-02', 'PEDROLUIS', '2022-03-04'),
(4, 4, 1, 'ON', 'ON', 'ON', 'ON', NULL, NULL, NULL, NULL),
(5, 3, 1, 'ON', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-04', '', '0000-00-00'),
(6, 1, 2, 'OFF', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-04', 'ADMIN', '2022-03-04'),
(7, 2, 2, 'ON', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-04', '', '0000-00-00'),
(8, 1, 5, 'ON', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-05', '', '0000-00-00'),
(9, 1, 8, 'ON', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-05', '', '0000-00-00'),
(10, 1, 10, 'ON', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-05', '', '0000-00-00'),
(11, 1, 12, 'ON', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-05', '', '0000-00-00'),
(12, 1, 15, 'ON', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-05', '', '0000-00-00'),
(13, 1, 3, 'ON', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-07', '', '0000-00-00'),
(14, 1, 4, 'ON', 'ON', 'ON', 'ON', 'ADMIN', '2022-03-07', 'ADMIN', '2022-03-07');

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
(34, 'ALEXANDER', 'RAUL', 'GIMARAE', 'SARMINETO', '0801199087873', '2009-12-30', 'Tokio', '2022-02-25', NULL, 2, 'NO DEFINIDO', '2022-02-25', NULL, '0000-00-00', '2'),
(35, 'ROSA', 'MARIA', 'YANES', 'PADILLA', '8080802813912', '2009-12-30', 'Tokio', '2022-02-25', NULL, 2, 'NO DEFINIDO', '2022-02-25', NULL, '0000-00-00', '1'),
(36, 'ROMARIO', 'PABLO', 'PAGUADA', 'ROGELIO', '0889-1998-909', '2010-12-29', 'TEGUCIGALPA', '2022-02-25', NULL, 3, 'NO DEFINIDO', '2022-02-25', NULL, '2022-02-25', 'm'),
(37, 'PRUEBA', 'INFORMATICA', 'PRUEBA', 'INFORMATICA', '0000000000000', '2009-12-30', 'La Esperanza', '2022-02-25', NULL, 1, 'NO DEFINIDO', '2022-02-25', NULL, '0000-00-00', '2'),
(38, 'PRUEBA', 'PRUEBA', 'PRUEBA', 'PRUEBA', '0801-1098-908', '2010-12-28', 'TEGUCIGALPA', '2022-02-25', NULL, 3, 'NO DEFINIDO', '2022-02-25', NULL, '2022-02-25', 'f'),
(39, 'JUAN', 'ARNOLD', 'GARCIA', 'VALOR', '0801-1998-878', '2010-12-14', 'TEGUCIGALPA', '2022-02-28', NULL, 3, 'NO DEFINIDO', '2022-02-28', NULL, '2022-02-28', 'm'),
(40, 'ROMARIO', 'ARNOLD', 'GARCIA', 'VALOR', '0801-1008-909', '2010-12-28', 'TEGUCIGALPA', '2022-02-28', NULL, 3, 'NO DEFINIDO', '2022-02-28', NULL, '2022-02-28', 'm'),
(41, 'PRUEBA', 'ARNOLD ALEXANDER', 'GARCIA', 'VALOR', '2312723188778', '2010-12-30', 'TEGUCIGALPA', '2022-02-28', NULL, 3, 'NO DEFINIDO', '2022-02-28', NULL, '2022-02-28', 'f'),
(42, 'CARLOS', 'ENMANUEL', 'AMADOR', 'SARMIENTO', '0801199801644', '2022-03-02', 'TEGUCIGALPA', '2022-03-05', NULL, 4, 'ADMIN', '2022-03-05', NULL, '0000-00-00', 'M');

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
(5, '¿Nombre de mascota favorito?', 'Administrador', '2022-02-01', NULL, NULL),
(6, '¿Soy yo tu padre, HIJO?', ' ADMIN', '2022-03-07', 'ADMIN', '2022-03-07');

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
(10, 3, 41, 'LA ROSA', NULL, NULL, NULL, NULL),
(21, 1, 47, 'POLLO', NULL, NULL, NULL, NULL),
(27, 1, 43, 'BALEADA', NULL, NULL, NULL, NULL),
(28, 2, 43, 'BOD ESPONJA', NULL, NULL, NULL, NULL);

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
(1, 'ADMINISTRADOR', 'Todos los permisos', 'Administrador', '2022-02-11', NULL, NULL),
(2, 'Tutor', 'Usuario con permisos al modulo de escuela', 'Administrador', '2022-02-11', NULL, NULL),
(3, 'Indefinido', 'Rol no definido para el usuario', NULL, NULL, NULL, NULL),
(4, 'ODONTOLOGO', 'Cualquier', NULL, NULL, NULL, '2022-03-02');

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
(123428, 40, NULL),
(1234274, 39, NULL),
(23286328, 34, '23286328'),
(32131231, 35, '32131231'),
(98432987, 41, NULL),
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
(3, 'no definido'),
(4, 'ESTUDIANTE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_socioeconomico`
--

CREATE TABLE `tbl_tipo_socioeconomico` (
  `CODIGO_TIPOSOCIO` int(5) NOT NULL,
  `TIPO` varchar(50) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_tipo_socioeconomico`
--

INSERT INTO `tbl_tipo_socioeconomico` (`CODIGO_TIPOSOCIO`, `TIPO`, `DESCRIPCION`) VALUES
(1, 'Dispositivo Electronico', 'Dispositivos de los ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tutoria`
--

CREATE TABLE `tbl_tutoria` (
  `CODIGO_TUTORIA` int(5) NOT NULL,
  `CODIGO_AREA` int(5) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(40, 34, NULL, 'ALEXANDER', 1, 2, '$2y$10$E1b07xJE.u2HazAJBG9KcO.1C.15MP9ZrL62FgmjEkeSBp48Xcwuq', NULL, 0, 0, '0000-00-00', '', '2022-02-25', 'ADMIN', '2022-03-07'),
(41, 35, NULL, 'ROSAS', 5, 2, '((%Z(]-*', NULL, 0, 0, '0000-00-00', '', '2022-02-25', '41', NULL),
(42, 36, NULL, 'RAFALEE', 5, 3, '$z&[!a[?', NULL, 0, 0, '2022-04-26', NULL, '2022-02-25', NULL, NULL),
(43, 37, NULL, 'INFORMATICA', 4, 1, 'Inform123*', NULL, 0, 0, '0000-00-00', '', '2022-02-25', '43', NULL),
(44, 38, NULL, 'PRUEBAS', 6, 3, 'Pruebas1*', NULL, 0, 0, '2022-04-26', NULL, '2022-02-25', NULL, NULL),
(45, 39, NULL, 'LUISFONSI', 6, 3, 'Luis12*', NULL, 0, 0, '2022-04-29', NULL, '2022-02-28', NULL, NULL),
(46, 40, NULL, 'PRUEBE', 6, 3, 'Prueb12*', NULL, 0, 0, '2022-04-29', NULL, '2022-02-28', NULL, NULL),
(47, 41, NULL, 'PRUEBES', 2, 3, 'Pruebe12**', NULL, 0, 0, '2022-04-29', NULL, '2022-02-28', NULL, NULL);

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
-- Indexes for table `tbl_area`
--
ALTER TABLE `tbl_area`
  ADD PRIMARY KEY (`CODIGO_AREA`);

--
-- Indexes for table `tbl_bitacora_sistema`
--
ALTER TABLE `tbl_bitacora_sistema`
  ADD PRIMARY KEY (`CODIGO_BITACORA`);

--
-- Indexes for table `tbl_calificaciones`
--
ALTER TABLE `tbl_calificaciones`
  ADD PRIMARY KEY (`CODIGO_CALIFICACIONES`),
  ADD KEY `FK_COD_MATRCU` (`CODIGO_MATRICULA`);

--
-- Indexes for table `tbl_carga_academica`
--
ALTER TABLE `tbl_carga_academica`
  ADD PRIMARY KEY (`CODIGO_CARGA`),
  ADD KEY `PK_COD_PE` (`CODIGO_PERSONA_TUTOR`),
  ADD KEY `PK_COD_MOD` (`CODIGO_MODALIDAD`),
  ADD KEY `PK_COD_TUTO` (`CODIGO_TUTORIA`);

--
-- Indexes for table `tbl_contenido_socioeconomico`
--
ALTER TABLE `tbl_contenido_socioeconomico`
  ADD PRIMARY KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  ADD KEY `FK_COD_TIPOSOCIO` (`CODIGO_TIPOSOCIO`);

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
-- Indexes for table `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  ADD PRIMARY KEY (`CODIGO_ESTUDIANTE`),
  ADD KEY `FK_COD_EST` (`CODIGO_PERSONA`);

--
-- Indexes for table `tbl_estudiante_socioeconomico`
--
ALTER TABLE `tbl_estudiante_socioeconomico`
  ADD PRIMARY KEY (`CODIGO_ESTUDIANTE_SOCIOECONOMICO`),
  ADD KEY `FK_CONTSOCIO` (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  ADD KEY `FK_COD_ES` (`CODIGO_ESTUDIANTE`);

--
-- Indexes for table `tbl_matricula_academica`
--
ALTER TABLE `tbl_matricula_academica`
  ADD PRIMARY KEY (`CODIGO_MATRICULA`),
  ADD KEY `FK_COD_ESTU` (`CODIGO_ESTUDIANTE`),
  ADD KEY `FK_COD_CARGA` (`CODIGO_CARGA`);

--
-- Indexes for table `tbl_modalidad`
--
ALTER TABLE `tbl_modalidad`
  ADD PRIMARY KEY (`CODIGO_MODALIDA`);

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
-- Indexes for table `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  ADD PRIMARY KEY (`CODIGO_PERMISO`),
  ADD KEY `FK_CO_OBJECT` (`CODIGO_OBJETO`),
  ADD KEY `FK_CO_TROL` (`CODIGO_TIPO_ROL`);

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
-- Indexes for table `tbl_tipo_socioeconomico`
--
ALTER TABLE `tbl_tipo_socioeconomico`
  ADD PRIMARY KEY (`CODIGO_TIPOSOCIO`);

--
-- Indexes for table `tbl_tutoria`
--
ALTER TABLE `tbl_tutoria`
  ADD PRIMARY KEY (`CODIGO_TUTORIA`),
  ADD KEY `FK_CODATREA_TUTO` (`CODIGO_AREA`);

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
-- AUTO_INCREMENT for table `tbl_area`
--
ALTER TABLE `tbl_area`
  MODIFY `CODIGO_AREA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bitacora_sistema`
--
ALTER TABLE `tbl_bitacora_sistema`
  MODIFY `CODIGO_BITACORA` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=591;

--
-- AUTO_INCREMENT for table `tbl_calificaciones`
--
ALTER TABLE `tbl_calificaciones`
  MODIFY `CODIGO_CALIFICACIONES` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_carga_academica`
--
ALTER TABLE `tbl_carga_academica`
  MODIFY `CODIGO_CARGA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_contenido_socioeconomico`
--
ALTER TABLE `tbl_contenido_socioeconomico`
  MODIFY `CODIGO_CONTENIDO_SOCIOECONOMICO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_direccion`
--
ALTER TABLE `tbl_direccion`
  MODIFY `CODIGO_DIRECCION` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_estado`
--
ALTER TABLE `tbl_estado`
  MODIFY `CODIGO_ESTADO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  MODIFY `CODIGO_ESTUDIANTE` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_estudiante_socioeconomico`
--
ALTER TABLE `tbl_estudiante_socioeconomico`
  MODIFY `CODIGO_ESTUDIANTE_SOCIOECONOMICO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_matricula_academica`
--
ALTER TABLE `tbl_matricula_academica`
  MODIFY `CODIGO_MATRICULA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_modalidad`
--
ALTER TABLE `tbl_modalidad`
  MODIFY `CODIGO_MODALIDA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ms_hist_contraseña`
--
ALTER TABLE `tbl_ms_hist_contraseña`
  MODIFY `CODIGO_HIST_CONTRASEÑA` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  MODIFY `CODIGO_OBJETO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  MODIFY `CODIGO_PARAMETRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_parametros_usuarios`
--
ALTER TABLE `tbl_parametros_usuarios`
  MODIFY `CODIGO_PARAM_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  MODIFY `CODIGO_PERMISO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_persona`
--
ALTER TABLE `tbl_persona`
  MODIFY `CODIGO_PERSONA` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_preguntas`
--
ALTER TABLE `tbl_preguntas`
  MODIFY `CODIGO_PREGUNTAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_preguntas_usuarios`
--
ALTER TABLE `tbl_preguntas_usuarios`
  MODIFY `CODIGO_PREGUNTA_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `CODIGO_TIPO_ROL` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_telefono`
--
ALTER TABLE `tbl_telefono`
  MODIFY `CODIGO_TELEFONO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `tbl_tipo_persona`
--
ALTER TABLE `tbl_tipo_persona`
  MODIFY `CODIGO_TIPO_PERSONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_tipo_socioeconomico`
--
ALTER TABLE `tbl_tipo_socioeconomico`
  MODIFY `CODIGO_TIPOSOCIO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_tutoria`
--
ALTER TABLE `tbl_tutoria`
  MODIFY `CODIGO_TUTORIA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `CODIGO_USUARIO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_calificaciones`
--
ALTER TABLE `tbl_calificaciones`
  ADD CONSTRAINT `FK_COD_MATRCU` FOREIGN KEY (`CODIGO_MATRICULA`) REFERENCES `tbl_matricula_academica` (`CODIGO_MATRICULA`);

--
-- Constraints for table `tbl_carga_academica`
--
ALTER TABLE `tbl_carga_academica`
  ADD CONSTRAINT `PK_COD_MOD` FOREIGN KEY (`CODIGO_MODALIDAD`) REFERENCES `tbl_modalidad` (`CODIGO_MODALIDA`),
  ADD CONSTRAINT `PK_COD_PE` FOREIGN KEY (`CODIGO_PERSONA_TUTOR`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  ADD CONSTRAINT `PK_COD_TUTO` FOREIGN KEY (`CODIGO_TUTORIA`) REFERENCES `tbl_tutoria` (`CODIGO_TUTORIA`);

--
-- Constraints for table `tbl_contenido_socioeconomico`
--
ALTER TABLE `tbl_contenido_socioeconomico`
  ADD CONSTRAINT `FK_COD_TIPOSOCIO` FOREIGN KEY (`CODIGO_TIPOSOCIO`) REFERENCES `tbl_tipo_socioeconomico` (`CODIGO_TIPOSOCIO`);

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
-- Constraints for table `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  ADD CONSTRAINT `FK_COD_EST` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`);

--
-- Constraints for table `tbl_estudiante_socioeconomico`
--
ALTER TABLE `tbl_estudiante_socioeconomico`
  ADD CONSTRAINT `FK_COD_ES` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`),
  ADD CONSTRAINT `FK_CONTSOCIO` FOREIGN KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`) REFERENCES `tbl_contenido_socioeconomico` (`CODIGO_CONTENIDO_SOCIOECONOMICO`);

--
-- Constraints for table `tbl_matricula_academica`
--
ALTER TABLE `tbl_matricula_academica`
  ADD CONSTRAINT `FK_COD_CARGA` FOREIGN KEY (`CODIGO_CARGA`) REFERENCES `tbl_carga_academica` (`CODIGO_CARGA`),
  ADD CONSTRAINT `FK_COD_ESTU` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`);

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
-- Constraints for table `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  ADD CONSTRAINT `FK_CO_OBJECT` FOREIGN KEY (`CODIGO_OBJETO`) REFERENCES `tbl_objetos` (`CODIGO_OBJETO`),
  ADD CONSTRAINT `FK_CO_TROL` FOREIGN KEY (`CODIGO_TIPO_ROL`) REFERENCES `tbl_roles` (`CODIGO_TIPO_ROL`);

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
-- Constraints for table `tbl_tutoria`
--
ALTER TABLE `tbl_tutoria`
  ADD CONSTRAINT `FK_CODATREA_TUTO` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `tbl_area` (`CODIGO_AREA`);

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
