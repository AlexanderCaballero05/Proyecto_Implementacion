SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS db_proyecto_prosecar;

USE db_proyecto_prosecar;

DROP TABLE IF EXISTS tbl_alergias;

CREATE TABLE `tbl_alergias` (
  `CODIGO_ALERGIAS` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_ALERGIAS`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_alergias_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_alergias VALUES("1","ALERGIA AL AGUA","EXTRAÑO PADECIMIENTO","DANIEL","2022-07-27","","","2");
INSERT INTO tbl_alergias VALUES("2","ALERGIA CUTÁNEAS","REACCIÓN ALERGICA QUE CAUSA UNA INFLAMACIÓN CUTÁNEA QUE PROVOCA UNA ERUPCIÓN ABULTADA","PAULA","2022-07-27","","","2");



DROP TABLE IF EXISTS tbl_apariencia_fisica;

CREATE TABLE `tbl_apariencia_fisica` (
  `CODIGO_APARIENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_APARIENCIA`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_apariencia_fisica_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_apariencia_fisica VALUES("4","HEMATOMA","2");
INSERT INTO tbl_apariencia_fisica VALUES("5","ICTERICIA","2");
INSERT INTO tbl_apariencia_fisica VALUES("6","OTROS","2");



DROP TABLE IF EXISTS tbl_area;

CREATE TABLE `tbl_area` (
  `CODIGO_AREA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_area VALUES("1","ACADEMICA","AREA DE CLASES","ADMIN","2022-03-17","2022-04-07","ADMIN");
INSERT INTO tbl_area VALUES("2","MEDICA","AREA DE MEDICINA","ADMIN","2022-03-17","2022-04-07","ADMIN");
INSERT INTO tbl_area VALUES("3","PSICOLOGICA","AREA DE PSICOLOGIA","ADMIN","2022-03-17","2022-04-22","ARNOLDIÑO");
INSERT INTO tbl_area VALUES("4","ESPIRITUAL","AREA ESPIRITUAL","ARNOLDIÑO","2022-04-22","0000-00-00","");



DROP TABLE IF EXISTS tbl_bitacora_sistema;

CREATE TABLE `tbl_bitacora_sistema` (
  `CODIGO_BITACORA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) NOT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ACCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_BITACORA`),
  KEY `FK_COD_USU_BIT` (`CODIGO_USUARIO`),
  KEY `FK_COD_OBJ_BIT` (`CODIGO_OBJETO`)
) ENGINE=InnoDB AUTO_INCREMENT=1659 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_bitacora_sistema VALUES("1","0","54","2022-07-25","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("2","1","1","2022-07-25","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("3","1","54","2022-07-25","AUTENTICACIÓN FALLIDA","EL USUARIO INTENTO INICIAR SESIÓN CON LA CUENTA INACTIVA");
INSERT INTO tbl_bitacora_sistema VALUES("4","1","54","2022-07-25","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("5","1","13","2022-07-25","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("6","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("7","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("8","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("9","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("10","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("11","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("12","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("13","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("14","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("15","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("16","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("17","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("18","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO RUT COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("19","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("20","2","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("21","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO LUZ COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("22","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO JOSE COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("23","2","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("24","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO GABRIELA COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("25","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO ALEXANDER COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("26","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("27","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("28","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("29","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("30","4","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("31","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("32","4","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("33","6","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("34","6","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("35","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("36","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("37","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("38","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("39","2","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("40","2","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("41","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("42","4","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("43","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("44","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("45","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("46","3","54","2022-07-26","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("47","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("48","5","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("49","6","19","2022-07-26","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("50","3","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("51","5","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("52","3","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("53","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("54","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("55","6","19","2022-07-26","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("56","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("57","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("58","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("59","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("60","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("61","6","19","2022-07-26","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("62","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("63","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO CESAR COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("64","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("65","6","12","2022-07-26","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("66","7","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("67","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("68","7","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("69","7","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("70","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("71","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("72","3","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO JUAN COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("73","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("74","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("75","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("76","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("77","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("78","7","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO DAVID COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("79","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("80","6","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO IKER COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("81","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("82","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("83","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("84","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("85","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("86","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("87","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("88","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("89","4","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO DANIEL COMO UN MEDICO");
INSERT INTO tbl_bitacora_sistema VALUES("90","2","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO RAQUEL COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("91","4","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("92","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("93","11","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("94","5","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO YAMILETH COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("95","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("96","12","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("97","11","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("98","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("99","12","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("100","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("101","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("102","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("103","6","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("104","7","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("105","3","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO MARGARITA COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("106","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO RAMON COMO UN MEDICO");
INSERT INTO tbl_bitacora_sistema VALUES("107","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("108","15","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("109","5","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO FRANCISCO COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("110","15","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("111","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("112","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("113","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("114","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("115","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("116","2","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO JOSUE COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("117","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("118","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("119","17","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("120","17","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("121","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("122","5","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO LAURA COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("123","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("124","5","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("125","13","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("126","3","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO MAJO COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("127","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO PAULA COMO UN MEDICO");
INSERT INTO tbl_bitacora_sistema VALUES("128","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("129","13","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("130","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("131","20","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("132","2","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO MARIO COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("133","20","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("134","13","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("135","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("136","13","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("137","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("138","21","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("139","6","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO CRIS COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("140","21","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("141","16","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("142","8","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("143","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("144","16","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("145","8","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("146","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("147","16","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("148","6","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("149","16","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("150","14","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("151","10","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("152","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("153","10","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("154","7","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO ANDREA COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("155","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("156","14","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("157","18","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("158","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("159","18","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("160","2","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("161","18","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("162","19","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("163","22","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("164","18","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("165","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("166","19","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("167","22","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("168","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("169","22","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("170","22","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("171","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("172","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("173","7","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("174","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("175","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("176","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("177","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("178","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("179","7","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("180","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("181","6","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("182","6","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("183","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("184","23","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("185","23","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("186","2","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO KATY COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("187","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("188","24","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("189","9","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("190","6","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("191","24","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("192","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("193","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("194","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("195","5","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO DESIRETH COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("196","5","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("197","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("198","3","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO NAOMI COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("199","25","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("200","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("201","25","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("202","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("203","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO ERICK COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("204","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("205","25","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("206","25","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("207","26","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("208","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("209","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("210","27","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("211","26","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("212","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("213","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("214","27","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("215","2","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("216","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("217","2","21","2022-07-26","INGRESO AL MANTENIMIENTO ÁREAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("218","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("219","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("220","2","46","2022-07-26","INSERCIÓN","SE REGISTRO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("221","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("222","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("223","2","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("224","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("225","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("226","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("227","9","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("228","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("229","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("230","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("231","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("232","5","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("233","3","21","2022-07-26","INGRESO AL MANTENIMIENTO ÁREAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("234","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("235","7","54","2022-07-26","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("236","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("237","3","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("238","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("239","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("240","7","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("241","6","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("242","3","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("243","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("244","5","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("245","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("246","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("247","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("248","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("249","6","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("250","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("251","3","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("252","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("253","6","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("254","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("255","3","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("256","6","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("257","3","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("258","7","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("259","5","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("260","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("261","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("262","7","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("263","7","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("264","6","46","2022-07-26","INSERCIÓN","SE REGISTRO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("265","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("266","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("267","6","46","2022-07-26","INSERCIÓN","SE REGISTRO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("268","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("269","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("270","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("271","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("272","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("273","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("274","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("275","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("276","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("277","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("278","2","22","2022-07-26","MODIFICACIÓN","SE MODIFICO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("279","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("280","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("281","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("282","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("283","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("284","2","46","2022-07-26","MODIFICACIÓN","SE MODIFICO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("285","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("286","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("287","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("288","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("289","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("290","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("291","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("292","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("293","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("294","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("295","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("296","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("297","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("298","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("299","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("300","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("301","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("302","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("303","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("304","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("305","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("306","2","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("307","27","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("308","27","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("309","27","48","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("310","27","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("311","27","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("312","27","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("313","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("314","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("315","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("316","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("317","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("318","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("319","5","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("320","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("321","7","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 4");
INSERT INTO tbl_bitacora_sistema VALUES("322","3","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 7");
INSERT INTO tbl_bitacora_sistema VALUES("323","2","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("324","2","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("325","5","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("326","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("327","5","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("328","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("329","7","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("330","7","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("331","2","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("332","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("333","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("334","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("335","7","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("336","2","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 1 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("337","7","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 4");
INSERT INTO tbl_bitacora_sistema VALUES("338","1","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 8");
INSERT INTO tbl_bitacora_sistema VALUES("339","2","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("340","2","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("341","6","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("342","1","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("343","6","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("344","6","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("345","1","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 8");
INSERT INTO tbl_bitacora_sistema VALUES("346","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("347","6","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("348","7","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("349","7","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("350","3","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("351","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("352","3","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 7");
INSERT INTO tbl_bitacora_sistema VALUES("353","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("354","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("355","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("356","6","23","2022-07-26","ELIMINACIÓN","SE ELIMINÓ LA TUTORÍA 2 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("357","5","23","2022-07-26","ELIMINACIÓN","SE ELIMINÓ LA TUTORÍA 4 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("358","6","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("359","5","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 1 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("360","6","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("361","5","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("362","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("363","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("364","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("365","5","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("366","5","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("367","2","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("368","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("369","1","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("370","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("371","2","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("372","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("373","2","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("374","1","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("375","5","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("376","7","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("377","7","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("378","7","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("379","7","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("380","5","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("381","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("382","6","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("383","5","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("384","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("385","2","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("386","6","32","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("387","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("388","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("389","6","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("390","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("391","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("392","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("393","6","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("394","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("395","11","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("396","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("397","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("398","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("399","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("400","5","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("401","20","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("402","21","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("403","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("404","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("405","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("406","7","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("407","1","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("408","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("409","12","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("410","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("411","15","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("412","1","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("413","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("414","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("415","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("416","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("417","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("418","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("419","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("420","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("421","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("422","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("423","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("424","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("425","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("426","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("427","12","31","2022-07-26","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO31");
INSERT INTO tbl_bitacora_sistema VALUES("428","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("429","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("430","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("431","15","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("432","7","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("433","11","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("434","11","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("435","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("436","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("437","7","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("438","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("439","12","31","2022-07-26","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("440","12","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("441","11","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("442","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("443","12","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("444","7","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("445","7","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("446","15","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("447","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("448","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("449","12","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("450","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("451","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("452","21","31","2022-07-26","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO29");
INSERT INTO tbl_bitacora_sistema VALUES("453","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("454","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("455","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("456","15","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("457","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("458","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("459","12","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("460","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("461","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("462","21","31","2022-07-26","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("463","21","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("464","11","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("465","11","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("466","11","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("467","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("468","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("469","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("470","11","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("471","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("472","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("473","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("474","20","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("475","20","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("476","21","31","2022-07-26","REGISTRAR","SE REGISTRO UN PLAN TERAPÉUTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("477","21","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("478","11","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("479","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("480","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("481","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("482","20","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("483","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("484","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("485","21","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("486","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("487","21","34","2022-07-26","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("488","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("489","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("490","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("491","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("492","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("493","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("494","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("495","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("496","21","47","2022-07-26","Editar","Se edito un sintoma neurótico");
INSERT INTO tbl_bitacora_sistema VALUES("497","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("498","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("499","21","47","2022-07-26","Editar","Se edito un sintoma neurótico");
INSERT INTO tbl_bitacora_sistema VALUES("500","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("501","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("502","12","31","2022-07-26","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("503","12","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("504","21","34","2022-07-26","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("505","21","62","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UN EXPEDIENTE PSICOLÓGICO ÚNICO");
INSERT INTO tbl_bitacora_sistema VALUES("506","21","34","2022-07-26","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("507","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("508","21","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("509","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("510","5","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("511","21","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("512","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("513","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("514","6","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("515","11","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("516","12","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("517","21","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("518","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("519","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("520","21","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("521","21","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("522","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("523","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("524","12","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("525","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("526","12","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("527","21","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("528","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("529","21","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("530","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("531","12","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("532","11","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("533","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("534","20","40","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UNA APARIENCIA FISICA");
INSERT INTO tbl_bitacora_sistema VALUES("535","20","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("536","12","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("537","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("538","6","32","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("539","6","32","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("540","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("541","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("542","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("543","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("544","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("545","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("546","6","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("547","6","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("548","13","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("549","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("550","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("551","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("552","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("553","3","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("554","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("555","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("556","13","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("557","3","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("558","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("559","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("560","13","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("561","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("562","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("563","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("564","8","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("565","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("566","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("567","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("568","20","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("569","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("570","3","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("571","3","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("572","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("573","20","54","2022-07-26","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("574","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("575","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("576","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("577","8","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("578","10","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("579","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("580","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("581","10","51","2022-07-26","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("582","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("583","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("584","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("585","10","51","2022-07-26","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("586","21","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("587","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("588","10","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("589","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("590","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("591","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("592","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("593","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("594","10","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("595","1","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("596","1","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("597","10","48","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("598","20","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 30");
INSERT INTO tbl_bitacora_sistema VALUES("599","20","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("600","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("601","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("602","10","51","2022-07-26","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("603","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("604","10","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("605","20","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 30");
INSERT INTO tbl_bitacora_sistema VALUES("606","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("607","10","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("608","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("609","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("610","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("611","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("612","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("613","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("614","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("615","20","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("616","16","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("617","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("618","16","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("619","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("620","16","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("621","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("622","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("623","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("624","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("625","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("626","11","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("627","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("628","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("629","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("630","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("631","6","5","2022-07-26","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("632","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("633","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("634","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("635","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("636","11","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 27");
INSERT INTO tbl_bitacora_sistema VALUES("637","11","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("638","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("639","11","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 27");
INSERT INTO tbl_bitacora_sistema VALUES("640","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("641","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("642","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("643","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("644","11","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("645","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("646","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("647","11","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("648","11","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("649","0","54","2022-07-26","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("650","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("651","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("652","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("653","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("654","1","54","2022-07-27","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("655","1","32","2022-07-27","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("656","1","32","2022-07-27","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("657","1","32","2022-07-27","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("658","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("659","7","54","2022-07-27","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("660","7","2","2022-07-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("661","7","5","2022-07-27","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("662","7","6","2022-07-27","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("663","7","3","2022-07-27","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("664","7","1","2022-07-27","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("665","7","54","2022-07-27","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("666","23","54","2022-07-27","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("667","23","51","2022-07-27","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("668","23","51","2022-07-27","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("669","23","51","2022-07-27","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("670","23","51","2022-07-27","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("671","23","54","2022-07-27","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("672","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("673","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("674","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("675","1","14","2022-07-28","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("676","1","23","2022-07-28","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("677","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("678","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("679","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("680","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("681","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("682","1","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("683","6","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("684","6","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("685","6","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("686","6","1","2022-07-28","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("687","6","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("688","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("689","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("690","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("691","1","23","2022-07-28","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("692","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("693","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("694","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("695","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("696","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("697","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("698","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("699","1","32","2022-07-28","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("700","1","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("701","11","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("702","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("703","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("704","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("705","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("706","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("707","11","23","2022-07-28","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("708","11","30","2022-07-28","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("709","11","20","2022-07-28","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("710","11","20","2022-07-28","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("711","11","20","2022-07-28","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("712","11","2","2022-07-28","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("713","11","2","2022-07-28","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("714","11","2","2022-07-28","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("715","11","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("716","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("717","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("718","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("719","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("720","1","22","2022-07-28","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("721","1","21","2022-07-28","INGRESO AL MANTENIMIENTO ÁREAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("722","1","46","2022-07-28","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("723","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("724","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("725","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("726","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("727","1","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("728","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("729","1","23","2022-07-28","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("730","1","23","2022-07-28","ELIMINACIÓN","SE ELIMINÓ LA TUTORÍA  AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("731","1","23","2022-07-28","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("732","1","23","2022-07-28","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("733","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("734","1","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("735","6","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("736","6","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("737","6","32","2022-07-29","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("738","6","2","2022-07-29","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("739","6","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("740","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("741","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("742","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("743","1","13","2022-07-29","INSERCIÓN","SE REGISTRO AL USUARIO ANYH COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("744","1","32","2022-07-29","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("745","1","32","2022-07-29","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("746","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("747","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("748","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("749","1","13","2022-07-29","INSERCIÓN","SE REGISTRO AL USUARIO ISEL COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("750","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("751","29","1","2022-07-29","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("752","29","1","2022-07-29","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("753","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITO RECUPERAR LA CONTRASEÑA POR CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("754","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("755","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("756","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("757","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("758","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("759","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("760","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("761","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("762","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("763","5","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITO RECUPERAR LA CONTRASEÑA POR CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("764","5","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("765","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("766","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("767","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("768","2","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("769","2","54","2022-07-29","MODIFICACIÓN DE CONTRASEÑA","EL USUARIO MODIFICÓ LA CONTRASEÑA POR EL METODO DE PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("770","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("771","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("772","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("773","29","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("774","29","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("775","29","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("776","29","54","2022-07-29","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("777","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("778","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("779","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("780","5","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("781","5","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("782","2","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("783","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("784","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("785","6","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("786","1","14","2022-07-29","MODIFICACIÓN","SE MODIFICO UNA CONTRASEÑA");
INSERT INTO tbl_bitacora_sistema VALUES("787","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("788","2","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("789","5","54","2022-07-29","MODIFICACIÓN DE CONTRASEÑA","EL USUARIO MODIFICÓ LA CONTRASEÑA POR EL METODO DE CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("790","5","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("791","6","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("792","5","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("793","5","13","2022-07-29","INSERCIÓN","SE REGISTRO AL USUARIO ARMANDO COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("794","5","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("795","30","1","2022-07-29","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("796","30","1","2022-07-29","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("797","30","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("798","30","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("799","30","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("800","30","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITO RECUPERAR LA CONTRASEÑA POR CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("801","6","13","2022-07-30","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("802","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("803","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("804","17","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("805","17","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("806","17","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("807","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("808","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("809","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("810","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("811","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("812","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("813","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("814","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("815","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("816","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("817","1","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("818","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("819","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("820","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("821","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("822","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("823","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("824","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("825","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("826","11","30","2022-07-30","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 25");
INSERT INTO tbl_bitacora_sistema VALUES("827","11","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("828","11","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 25");
INSERT INTO tbl_bitacora_sistema VALUES("829","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("830","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("831","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("832","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("833","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("834","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("835","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("836","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("837","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("838","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("839","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("840","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("841","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("842","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("843","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("844","1","0","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("845","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("846","1","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("847","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("848","1","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("849","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("850","20","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("851","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("852","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("853","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("854","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("855","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("856","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("857","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("858","20","30","2022-07-30","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 9");
INSERT INTO tbl_bitacora_sistema VALUES("859","20","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("860","20","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 9");
INSERT INTO tbl_bitacora_sistema VALUES("861","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("862","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("863","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("864","20","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("865","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("866","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("867","20","30","2022-07-30","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 24");
INSERT INTO tbl_bitacora_sistema VALUES("868","20","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("869","20","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 24");
INSERT INTO tbl_bitacora_sistema VALUES("870","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("871","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("872","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("873","20","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("874","20","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("875","20","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("876","20","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("877","20","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("878","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("879","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("880","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("881","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("882","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("883","28","1","2022-07-30","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("884","28","1","2022-07-30","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("885","28","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("886","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("887","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("888","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("889","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("890","28","54","2022-07-30","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("891","28","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("892","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("893","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("894","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("895","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("896","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("897","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("898","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("899","11","54","2022-07-30","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("900","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("901","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("902","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("903","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("904","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("905","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("906","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("907","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("908","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("909","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("910","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("911","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("912","11","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("913","11","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("914","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("915","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("916","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("917","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("918","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("919","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("920","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("921","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("922","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("923","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("924","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("925","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("926","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("927","11","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("928","11","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("929","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("930","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("931","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("932","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("933","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("934","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("935","6","13","2022-07-30","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("936","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("937","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("938","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("939","1","54","2022-07-31","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("940","6","32","2022-07-31","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("941","1","54","2022-07-31","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("942","1","32","2022-07-31","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("943","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("944","1","32","2022-08-01","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("945","1","32","2022-08-01","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("946","1","34","2022-08-01","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("947","6","32","2022-08-01","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("948","6","13","2022-08-01","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("949","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("950","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("951","6","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("952","6","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("953","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("954","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("955","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("956","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("957","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("958","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("959","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("960","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("961","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("962","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("963","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("964","3","1","2022-08-02","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("965","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("966","3","14","2022-08-02","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("967","3","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("968","3","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("969","3","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("970","3","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("971","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("972","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("973","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("974","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("975","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("976","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("977","1","22","2022-08-02","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("978","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("979","1","22","2022-08-02","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("980","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("981","7","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("982","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("983","7","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("984","3","13","2022-08-02","INSERCIÓN","SE REGISTRO AL USUARIO LUISMI COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("985","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("986","31","1","2022-08-02","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("987","31","1","2022-08-02","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("988","1","13","2022-08-02","INSERCIÓN","SE REGISTRO AL USUARIO VALERIA COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("989","31","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("990","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("991","31","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("992","32","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("993","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("994","3","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("995","32","1","2022-08-02","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("996","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("997","32","1","2022-08-02","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("998","32","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("999","32","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1000","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1001","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1002","7","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1003","7","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1004","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1005","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1006","2","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1007","2","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1008","2","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1009","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1010","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1011","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1012","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1013","7","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1014","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1015","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1016","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1017","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1018","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1019","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1020","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1021","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1022","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1023","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1024","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1025","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1026","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1027","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1028","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1029","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1030","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1031","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1032","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1033","0","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1034","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1035","21","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1036","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1037","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1038","1","14","2022-08-02","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1039","21","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1040","3","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1041","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1042","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1043","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1044","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1045","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1046","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1047","3","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1048","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1049","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("1050","3","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1051","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1052","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1053","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1054","21","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1055","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1056","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1057","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1058","15","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1059","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1060","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1061","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1062","15","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1063","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1064","21","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO30");
INSERT INTO tbl_bitacora_sistema VALUES("1065","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1066","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1067","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1068","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1069","15","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1070","21","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1071","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1072","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1073","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1074","15","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1075","21","31","2022-08-02","REGISTRAR","SE REGISTRO UN PLAN TERAPÉUTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("1076","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1077","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1078","15","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 30");
INSERT INTO tbl_bitacora_sistema VALUES("1079","11","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1080","21","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1081","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1082","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1083","15","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1084","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1085","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1086","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1087","7","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1088","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1089","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1090","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1091","3","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1092","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1093","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1094","15","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1095","3","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1096","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1097","15","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("1098","21","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1099","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1100","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1101","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1102","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1103","15","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1104","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1105","21","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO24");
INSERT INTO tbl_bitacora_sistema VALUES("1106","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1107","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1108","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1109","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1110","15","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1111","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1112","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1113","21","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1114","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1115","2","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1116","17","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1117","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1118","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1119","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1120","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1121","21","31","2022-08-02","REGISTRAR","SE REGISTRO UN PLAN TERAPÉUTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("1122","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1123","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1124","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1125","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1126","17","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1127","2","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1128","2","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1129","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1130","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1131","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1132","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1133","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1134","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1135","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1136","15","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1137","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1138","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1139","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1140","2","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1141","17","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1142","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1143","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1144","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1145","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1146","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1147","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1148","10","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1149","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1150","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1151","17","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO27");
INSERT INTO tbl_bitacora_sistema VALUES("1152","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1153","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1154","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1155","15","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1156","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1157","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1158","21","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1159","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1160","17","31","2022-08-02","REGISTRAR","SE REGISTRO UN PLAN TERAPÉUTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("1161","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1162","21","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1163","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1164","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1165","21","34","2022-08-02","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1166","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1167","17","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO9");
INSERT INTO tbl_bitacora_sistema VALUES("1168","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1169","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1170","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1171","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1172","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1173","10","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1174","0","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1175","0","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1176","17","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1177","6","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1178","2","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1179","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1180","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1181","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1182","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1183","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1184","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1185","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1186","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1187","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1188","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1189","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1190","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1191","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1192","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1193","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1194","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1195","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1196","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1197","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1198","11","30","2022-08-02","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 29");
INSERT INTO tbl_bitacora_sistema VALUES("1199","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1200","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 29");
INSERT INTO tbl_bitacora_sistema VALUES("1201","2","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1202","2","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1203","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1204","11","35","2022-08-02","INSERCIÓN","SEREGISTRÓ UN MEDICAMENTO");
INSERT INTO tbl_bitacora_sistema VALUES("1205","11","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1206","11","35","2022-08-02","ELIMINACIÓN","SE ELIMINÓ UN MEDICAMENTO ");
INSERT INTO tbl_bitacora_sistema VALUES("1207","11","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1208","2","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1209","2","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1210","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1211","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1212","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1213","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1214","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("1215","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1216","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1217","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1218","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1219","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1220","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1221","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1222","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1223","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 9");
INSERT INTO tbl_bitacora_sistema VALUES("1224","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1225","11","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1226","0","54","2022-08-04","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1227","6","54","2022-08-04","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1228","6","2","2022-08-04","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1229","6","23","2022-08-04","ELIMINACIÓN","SE ELIMINÓ LA TUTORÍA 6 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("1230","6","23","2022-08-04","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("1231","6","23","2022-08-04","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("1232","6","23","2022-08-04","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("1233","6","23","2022-08-04","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("1234","6","23","2022-08-04","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("1235","6","20","2022-08-05","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1236","6","32","2022-08-05","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("1237","6","32","2022-08-05","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1238","6","14","2022-08-05","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1239","6","14","2022-08-05","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1240","6","54","2022-08-05","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1241","6","54","2022-08-05","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1242","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1243","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1244","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1245","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1246","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1247","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1248","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1249","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1250","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1251","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1252","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1253","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1254","6","13","2022-08-08","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1255","6","54","2022-08-08","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1256","0","54","2022-08-08","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1257","6","54","2022-08-08","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1258","5","54","2022-08-08","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1259","1","54","2022-08-10","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1260","1","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1261","1","54","2022-08-10","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1262","6","54","2022-08-10","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1263","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1264","6","3","2022-08-10","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1265","6","3","2022-08-10","Editar parámetro","Se editó el registro de un parámetro ya existente");
INSERT INTO tbl_bitacora_sistema VALUES("1266","6","3","2022-08-10","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1267","6","3","2022-08-10","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1268","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1269","6","1","2022-08-10","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("1270","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1271","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1272","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1273","6","1","2022-08-10","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("1274","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1275","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1276","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1277","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1278","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1279","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1280","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1281","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1282","6","17","2022-08-10","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1283","6","2","2022-08-10","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1284","6","48","2022-08-10","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1285","6","48","2022-08-10","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1286","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1287","6","12","2022-08-10","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("1288","6","19","2022-08-10","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("1289","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1290","6","54","2022-08-10","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1291","6","54","2022-08-10","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("1292","6","54","2022-08-10","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1293","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1294","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1295","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1296","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1297","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1298","6","26","2022-08-10","INSERTAR","SE REGISTRO EL PARENTESCO DEL CODIGO 1 DE ESTUDIANTE CON EL CODIGÓ 3 DE FAMILIAR ");
INSERT INTO tbl_bitacora_sistema VALUES("1299","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1300","6","26","2022-08-10","INSERTAR","SE REGISTRO EL PARENTESCO DEL CODIGO 1 DE ESTUDIANTE CON EL CODIGÓ 4 DE FAMILIAR ");
INSERT INTO tbl_bitacora_sistema VALUES("1301","6","48","2022-08-10","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1302","6","2","2022-08-10","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1303","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1304","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1305","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1306","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1307","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1308","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1309","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1310","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1311","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1312","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1313","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1314","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1315","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1316","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1317","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1318","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1319","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1320","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1321","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1322","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1323","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1324","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1325","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1326","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1327","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1328","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1329","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1330","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1331","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1332","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1333","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1334","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1335","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1336","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1337","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1338","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1339","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1340","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1341","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1342","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1343","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1344","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1345","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1346","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1347","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1348","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1349","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1350","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1351","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1352","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1353","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1354","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1355","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1356","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1357","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1358","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1359","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1360","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1361","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1362","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1363","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1364","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1365","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1366","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1367","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1368","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1369","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1370","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1371","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1372","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1373","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1374","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1375","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1376","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1377","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1378","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1379","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1380","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1381","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1382","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1383","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1384","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1385","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1386","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1387","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1388","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1389","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1390","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1391","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1392","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1393","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1394","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1395","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1396","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1397","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1398","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1399","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1400","6","54","2022-08-11","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1401","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1402","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1403","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1404","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1405","6","54","2022-08-11","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1406","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1407","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1408","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1409","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1410","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1411","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1412","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1413","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1414","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1415","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1416","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1417","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1418","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1419","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1420","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1421","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1422","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1423","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1424","6","44","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO PARENTESCO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1425","6","17","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1426","6","17","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1427","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1428","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1429","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1430","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1431","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1432","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1433","6","54","2022-08-11","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1434","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1435","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1436","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1437","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1438","6","54","2022-08-11","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1439","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1440","6","54","2022-08-11","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1441","3","54","2022-08-11","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1442","3","54","2022-08-11","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1443","6","54","2022-08-11","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1444","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1445","6","18","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1446","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1447","6","54","2022-08-11","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1448","1","54","2022-08-11","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1449","1","12","2022-08-11","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("1450","1","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1451","1","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1452","1","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1453","1","18","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1454","1","47","2022-08-11","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("1455","1","32","2022-08-11","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1456","1","5","2022-08-11","INSERCIÓN","SE REGISTRO UN PERMISO SOBRE UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1457","1","6","2022-08-11","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1458","1","6","2022-08-11","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1459","1","6","2022-08-11","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1460","1","6","2022-08-11","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1461","1","6","2022-08-11","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1462","1","6","2022-08-11","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1463","1","6","2022-08-11","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1464","1","6","2022-08-11","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1465","1","6","2022-08-11","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1466","1","32","2022-08-11","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1467","1","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1468","1","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1469","1","13","2022-08-12","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1470","1","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1471","11","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1472","11","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1473","11","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1474","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1475","11","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1476","11","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1477","11","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1478","6","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1479","6","14","2022-08-12","MODIFICACIÓN","SE MODIFICO UNA CONTRASEÑA");
INSERT INTO tbl_bitacora_sistema VALUES("1480","6","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1481","29","54","2022-08-12","MODIFICACIÓN DE CONTRASEÑA","EL USUARIO MODIFICÓ LA CONTRASEÑA POR EL METODO DE CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("1482","29","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1483","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1484","29","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1485","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1486","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1487","29","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1488","11","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1489","11","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1490","6","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1491","6","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1492","11","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1493","11","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1494","11","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1495","11","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1496","11","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1497","11","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1498","11","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1499","11","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1500","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1501","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1502","11","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1503","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1504","11","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1505","6","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1506","11","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1507","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1508","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1509","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1510","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1511","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1512","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1513","6","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1514","11","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1515","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1516","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1517","11","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1518","11","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1519","6","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1520","6","13","2022-08-12","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1521","29","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1522","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1523","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1524","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1525","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1526","29","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1527","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1528","29","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1529","29","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1530","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1531","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1532","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1533","29","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1534","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1535","29","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1536","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1537","29","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1538","13","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1539","13","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1540","13","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1541","13","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1542","13","32","2022-08-12","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1543","13","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1544","11","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1545","11","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1546","29","54","2022-08-12","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1547","6","14","2022-08-12","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1548","29","54","2022-08-12","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1549","6","14","2022-08-12","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1550","29","54","2022-08-12","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1551","6","14","2022-08-12","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1552","29","54","2022-08-12","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1553","29","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1554","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1555","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1556","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1557","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1558","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1559","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1560","29","32","2022-08-12","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1561","29","32","2022-08-12","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1562","29","54","2022-08-12","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1563","13","54","2022-08-12","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1564","6","54","2022-08-13","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1565","6","13","2022-08-13","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1566","6","54","2022-08-13","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1567","6","54","2022-08-13","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1568","6","54","2022-08-13","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1569","6","54","2022-08-13","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1570","6","54","2022-08-13","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1571","1","54","2022-08-13","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1572","1","13","2022-08-13","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1573","1","14","2022-08-13","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1574","13","54","2022-08-13","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1575","6","54","2022-08-13","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1576","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1577","6","6","2022-08-13","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1578","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1579","6","6","2022-08-13","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1580","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1581","6","6","2022-08-13","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1582","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1583","6","6","2022-08-13","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1584","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1585","6","6","2022-08-13","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1586","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1587","6","6","2022-08-13","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1588","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1589","6","6","2022-08-13","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1590","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1591","6","6","2022-08-13","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1592","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1593","6","6","2022-08-13","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("1594","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1595","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1596","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1597","1","5","2022-08-13","INSERCIÓN","SE REGISTRO UN PERMISO SOBRE UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1598","6","32","2022-08-13","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1599","6","12","2022-08-13","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("1600","1","54","2022-08-13","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1601","6","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1602","6","3","2022-08-13","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1603","6","3","2022-08-13","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1604","6","3","2022-08-13","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1605","6","3","2022-08-13","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1606","6","3","2022-08-13","Insertar parámetro","Agregó/insertó un nuevo parámetro");
INSERT INTO tbl_bitacora_sistema VALUES("1607","6","3","2022-08-13","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1608","6","3","2022-08-13","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1609","6","3","2022-08-13","Editar parámetro","Se editó el registro de un parámetro ya existente");
INSERT INTO tbl_bitacora_sistema VALUES("1610","6","3","2022-08-13","Editar parámetro","Se editó el registro de un parámetro ya existente");
INSERT INTO tbl_bitacora_sistema VALUES("1611","6","54","2022-08-13","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1612","11","54","2022-08-13","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1613","29","54","2022-08-13","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1614","29","32","2022-08-13","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1615","29","34","2022-08-13","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1616","29","32","2022-08-13","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1617","29","32","2022-08-13","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1618","29","32","2022-08-13","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1619","29","32","2022-08-13","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1620","29","32","2022-08-13","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1621","29","32","2022-08-13","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1622","29","32","2022-08-13","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1623","29","32","2022-08-13","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1624","11","54","2022-08-13","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1625","1","54","2022-08-13","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1626","1","1","2022-08-13","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1627","29","54","2022-08-13","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1628","1","3","2022-08-13","Editar parámetro","Se editó el registro de un parámetro ya existente");
INSERT INTO tbl_bitacora_sistema VALUES("1629","11","54","2022-08-13","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1630","1","13","2022-08-13","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1631","1","13","2022-08-13","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1632","1","18","2022-08-13","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1633","1","18","2022-08-13","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1634","1","14","2022-08-13","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1635","1","14","2022-08-13","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1636","1","14","2022-08-13","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1637","1","14","2022-08-13","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1638","1","48","2022-08-13","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1639","1","51","2022-08-13","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("1640","1","51","2022-08-13","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("1641","1","2","2022-08-13","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1642","1","12","2022-08-13","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("1643","1","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1644","1","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1645","1","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1646","1","5","2022-08-13","INSERCIÓN","SE REGISTRO UN PERMISO SOBRE UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1647","1","5","2022-08-13","INSERCIÓN","SE REGISTRO UN PERMISO SOBRE UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1648","1","5","2022-08-13","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1649","1","5","2022-08-13","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1650","1","5","2022-08-13","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1651","1","5","2022-08-13","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1652","1","5","2022-08-13","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1653","1","5","2022-08-13","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1654","1","5","2022-08-13","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1655","1","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1656","1","6","2022-08-13","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1657","1","5","2022-08-13","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1658","1","5","2022-08-13","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");



DROP TABLE IF EXISTS tbl_carga_academica;

CREATE TABLE `tbl_carga_academica` (
  `CODIGO_CARGA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_TUTORIA` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_MODALIDAD` int(5) DEFAULT NULL,
  `CODIGO_SECCION` int(5) DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  `HORA` time DEFAULT NULL,
  `HORA_FINAL` time NOT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FINAL` date DEFAULT NULL,
  `ANIO` int(11) NOT NULL,
  `PERIODO` int(11) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CARGA`),
  KEY `PK_COD_PE` (`CODIGO_PERSONA`),
  KEY `PK_COD_MOD` (`CODIGO_MODALIDAD`),
  KEY `PK_COD_TUTO` (`CODIGO_TUTORIA`),
  KEY `FK_CODSEC_CARG` (`CODIGO_SECCION`),
  KEY `FK_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODSEC_CARG` FOREIGN KEY (`CODIGO_SECCION`) REFERENCES `tbl_seccion` (`CODIGO_SECCION`),
  CONSTRAINT `FK_ESTADO` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_COD_MOD` FOREIGN KEY (`CODIGO_MODALIDAD`) REFERENCES `tbl_modalidad` (`CODIGO_MODALIDA`),
  CONSTRAINT `PK_COD_PE` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `PK_COD_TUTO` FOREIGN KEY (`CODIGO_TUTORIA`) REFERENCES `tbl_tutoria` (`CODIGO_TUTORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_carga_academica VALUES("1","2","18","1","1","2","13:30:00","14:00:00","2022-08-02","2022-08-27","2022","2","GABRIELA","2022-07-27","2022-08-03","ALEXANDER");
INSERT INTO tbl_carga_academica VALUES("2","6","16","1","1","2","13:30:00","14:00:00","2022-08-04","2022-08-31","2022","1","ADMIN","2022-07-27","2022-08-03","RUT");
INSERT INTO tbl_carga_academica VALUES("3","4","8","1","1","2","14:00:00","15:07:00","2022-07-30","2022-11-26","2022","1","CESAR","2022-07-27","","");
INSERT INTO tbl_carga_academica VALUES("4","6","21","1","3","2","12:00:00","13:00:00","2022-07-26","2022-08-26","2022","2","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_carga_academica VALUES("5","3","18","1","3","2","11:00:00","12:00:00","2022-07-27","2022-08-28","2022","4","RUT","2022-07-27","","");
INSERT INTO tbl_carga_academica VALUES("6","1","16","1","2","2","10:00:00","11:00:00","2022-07-26","2022-08-31","2022","2","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_carga_academica VALUES("7","5","32","1","1","2","14:00:00","15:00:00","2022-08-02","2022-09-29","2022","4","LUZ","2022-08-03","","");
INSERT INTO tbl_carga_academica VALUES("8","3","13","1","2","2","11:00:00","11:00:00","2022-08-06","2022-09-03","2022","3","CESAR","2022-08-03","","");



DROP TABLE IF EXISTS tbl_consulta_espiritual;

CREATE TABLE `tbl_consulta_espiritual` (
  `CODIGO_CONSULTA_ESPIRITUAL` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(10) DEFAULT NULL,
  `MOTIVO_CONSULTA` longtext DEFAULT NULL,
  `OBSERVACIONES` longtext DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONSULTA_ESPIRITUAL`),
  KEY `COD_CITA_ESPI_FK` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_consulta_espiritual VALUES("1","17","Consejo espiritual","Ninguna","2022-07-26");



DROP TABLE IF EXISTS tbl_consulta_medica;

CREATE TABLE `tbl_consulta_medica` (
  `CODIGO_CONSULTA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PRECLINICA` int(5) NOT NULL,
  `CODIGO_CITA` int(5) NOT NULL,
  `SINTOMAS` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `DIAGNOSTICO_INGRESO` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `EVOLUCION` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `DIAGNOSTICO_EGRESO` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONSULTA`),
  KEY `FK_COD_PREC` (`CODIGO_PRECLINICA`),
  KEY `FK_COD_CIT` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_consulta_medica VALUES("1","1","11","Fiebre alta","Tiene baja las plaquetas","Ninguna"," Ninguna","","2022-07-27","","");
INSERT INTO tbl_consulta_medica VALUES("2","2","4","inflamación, dolor y ardor","grave","toda la cara"," piel muy irritada","","2022-07-27","","");
INSERT INTO tbl_consulta_medica VALUES("3","3","18","le duele la cabeza en situaciones de estrés","migraña a causa de estrés","al tomarse el medicamento se siente mejor"," todo bien","","2022-07-27","","");
INSERT INTO tbl_consulta_medica VALUES("4","4","3","ninguno","ninguno","ninguno"," ninguno","","2022-07-27","","");
INSERT INTO tbl_consulta_medica VALUES("5","5","20","fiebre,vomito dolor de cabeza etc","se ve muy mal","no se tiene aun"," mandar a hacer examenes y recetar","","2022-07-29","","");
INSERT INTO tbl_consulta_medica VALUES("6","6","26","fiebre dolor de cuepero","NO SE TIENE uno aun","ninguno"," nada aun","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("7","7","34","no tiene","no tiene ","no tiene "," no tiene","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("8","8","35","no tienen","no tiene","no tiene "," no tiene","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("9","9","22","nkjnjknkjnk","jnknjnknknj","jknkjnkjn"," nmknm,n,mnm,","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("10","10","23","jkjkhk","jnkjnkjnhjkhhkjhjhkjhkh","jnkjnkjnjknkjhkjhkjkkjhk"," jnkkkjhhkkjhkhkjhkj","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("11","11","40","DIARREA","AGUDO","LEVE"," NINGUNO","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("12","12","42","FIEBRE ALTA","POSIBLE INFECCION ORINARIA","EN TRATAMIENTO"," NINGUNO","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("13","13","43","MAREOS ","PRESION ALTA","NINGUNA"," PRESENTA  PRESION ALTA ","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("14","14","50","DOLOR DE CABEZA","POSIBLE FIEBRE","LEVE"," NINGUNO","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("15","15","51","DOLOR DE CABEZA,NAUESAS","RECETAR MEDICAMENTOS Y EXAMNE","SE ESPERAN BUENOS RESULTADOS"," NINGUNA","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("16","16","52","DOLOR DE CUERPO","POSIBLE COVID","LEVE","  NINGUNO","","2022-08-03","","");



DROP TABLE IF EXISTS tbl_contenido_socioeconomico;

CREATE TABLE `tbl_contenido_socioeconomico` (
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_TIPOSOCIO` int(5) NOT NULL,
  `NOMBRE_TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_TIPOSOCIO` (`CODIGO_TIPOSOCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_contenido_socioeconomico VALUES("1","1","COMPUTADORA");
INSERT INTO tbl_contenido_socioeconomico VALUES("2","1","CELULAR");
INSERT INTO tbl_contenido_socioeconomico VALUES("3","1","TABLET");
INSERT INTO tbl_contenido_socioeconomico VALUES("4","2","INTERNET RESIDENCIAL");
INSERT INTO tbl_contenido_socioeconomico VALUES("5","2","DATOS MOVILES");
INSERT INTO tbl_contenido_socioeconomico VALUES("6","2","SATELITAL");
INSERT INTO tbl_contenido_socioeconomico VALUES("7","3","PADRE");
INSERT INTO tbl_contenido_socioeconomico VALUES("8","3","MADRE");
INSERT INTO tbl_contenido_socioeconomico VALUES("9","3","ABUELA");
INSERT INTO tbl_contenido_socioeconomico VALUES("10","3","REMESAS");
INSERT INTO tbl_contenido_socioeconomico VALUES("11","4","ENERGÍA ELÉCTRICA");
INSERT INTO tbl_contenido_socioeconomico VALUES("12","4","AGUA POTABLE");
INSERT INTO tbl_contenido_socioeconomico VALUES("13","4","ALCANTARILLADO");
INSERT INTO tbl_contenido_socioeconomico VALUES("14","2","NO TIENE INTERNET");



DROP TABLE IF EXISTS tbl_correo_electronico;

CREATE TABLE `tbl_correo_electronico` (
  `CORREO_PERSONA` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  PRIMARY KEY (`CORREO_PERSONA`),
  KEY `FK_CORREO` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_correo_electronico VALUES("compartirhospital@gamil.com","1");
INSERT INTO tbl_correo_electronico VALUES("dianaamador130@gmail.com","2");
INSERT INTO tbl_correo_electronico VALUES("montoyaluz0405@gmail.com","3");
INSERT INTO tbl_correo_electronico VALUES("jose@gmail.com","4");
INSERT INTO tbl_correo_electronico VALUES("gabriela17@gmail.com","5");
INSERT INTO tbl_correo_electronico VALUES("aacaballero@unah.hn","6");
INSERT INTO tbl_correo_electronico VALUES("cesar.rovelo@unah.hn","7");
INSERT INTO tbl_correo_electronico VALUES("juan@gmail.com","8");
INSERT INTO tbl_correo_electronico VALUES("davidochoa@gmail.com","9");
INSERT INTO tbl_correo_electronico VALUES("ikerCasillas@gmail.com","10");
INSERT INTO tbl_correo_electronico VALUES("daniel@gmail.com","11");
INSERT INTO tbl_correo_electronico VALUES("lidia@gmail.com","12");
INSERT INTO tbl_correo_electronico VALUES("gisseladiaz1998@gmail.com","13");
INSERT INTO tbl_correo_electronico VALUES("Josue@gmail.com","14");
INSERT INTO tbl_correo_electronico VALUES("sendykarina@gmail.com","15");
INSERT INTO tbl_correo_electronico VALUES("margarita@gmail.com","16");
INSERT INTO tbl_correo_electronico VALUES("ramon@gmail.com","17");
INSERT INTO tbl_correo_electronico VALUES("francisco@gmail.com","18");
INSERT INTO tbl_correo_electronico VALUES("josue@unah.hn","19");
INSERT INTO tbl_correo_electronico VALUES("laura@gmail.com","20");
INSERT INTO tbl_correo_electronico VALUES("majo@gmail.com","21");
INSERT INTO tbl_correo_electronico VALUES("paula@gmail.com","22");
INSERT INTO tbl_correo_electronico VALUES("mario@gmail.com","23");
INSERT INTO tbl_correo_electronico VALUES("Cris25@gmail.com","24");
INSERT INTO tbl_correo_electronico VALUES("andrea@gmail.com","25");
INSERT INTO tbl_correo_electronico VALUES("karen@gmail.com","26");
INSERT INTO tbl_correo_electronico VALUES("katy@gmail.com","27");
INSERT INTO tbl_correo_electronico VALUES("Nolvia@gmail.com","28");
INSERT INTO tbl_correo_electronico VALUES("desireth@gmail.com","29");
INSERT INTO tbl_correo_electronico VALUES("naomi@gmail.com","30");
INSERT INTO tbl_correo_electronico VALUES("erick@gmail.com","31");
INSERT INTO tbl_correo_electronico VALUES("hmeli90@yahoo.es","32");
INSERT INTO tbl_correo_electronico VALUES("iselflores@gmail.com","33");
INSERT INTO tbl_correo_electronico VALUES("gisseladiaz@gmail.com","34");
INSERT INTO tbl_correo_electronico VALUES("luismi@gmail.com","35");
INSERT INTO tbl_correo_electronico VALUES("valeria@gmail.com","36");



DROP TABLE IF EXISTS tbl_especialidad;

CREATE TABLE `tbl_especialidad` (
  `CODIGO_ESPECIALIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_AREA` int(5) DEFAULT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESPECIALIDAD`),
  KEY `TBL_ESP_FK` (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_especialidad VALUES("1","MEDICINA GENERAL ","2","ATIENDE DE TODO ","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("2","TERAPIA GENERAL","3","ATIENDE DE TODO TIPO DE LOCOS","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("3","CATEQUESIS JUVENIL","4","CHARLAS CON JOVENES","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("4","PEDIATRIA","2","ATENCIÓN A MENORES DE EDAD","","0000-00-00","","");
INSERT INTO tbl_especialidad VALUES("5","PSICOLOGIA COGNITIVA CONDUCTUAL","3","ÁREA PSICOLOGÍA","","0000-00-00","","");



DROP TABLE IF EXISTS tbl_estado;

CREATE TABLE `tbl_estado` (
  `CODIGO_ESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estado VALUES("1","NUEVO","Este usuario esta ACTIVO");
INSERT INTO tbl_estado VALUES("2","ACTIVO","este usuario esta nuevo");
INSERT INTO tbl_estado VALUES("3","INACTIVO","este ususario esta inactivo");
INSERT INTO tbl_estado VALUES("4","BLOQUEADO","Esta usuario esta en estado de bloqueo");
INSERT INTO tbl_estado VALUES("5","PENDIENTE","Este usuario esta pendiente de cambiar la contrase");
INSERT INTO tbl_estado VALUES("6","INDEFINIDO","Este usuario esta deshabiltado ");
INSERT INTO tbl_estado VALUES("7","CANCELADA","ESTE ESTADO HACE REFERENCIA A LA CITAS");
INSERT INTO tbl_estado VALUES("8","REALIZADO","ESTADO QUE HACE REFERENCIA A LA REALIZACION");
INSERT INTO tbl_estado VALUES("9","PROCESO","UNA FUNCION EN PROCESO");
INSERT INTO tbl_estado VALUES("10","PROCESOPRECLINICA","PARA PRECESO DE PRECLICA");
INSERT INTO tbl_estado VALUES("11","PROCESOCONSULTA","ESTADO QUE INDICA UNA CITA EN EL PROCESO DE CONSUL");
INSERT INTO tbl_estado VALUES("12","REPORTECONSULTA","CODIGO QUE PERMITE VER EL REPORTE DE CONSULTA");
INSERT INTO tbl_estado VALUES("13","FINALIZADO","CODIGO QUE DESCRIBE  LA FINALIZACION DE UN PROCESO");
INSERT INTO tbl_estado VALUES("14","PLAN_TERAPEUTICO","Estado que espicifica que se hace un plan de terap");
INSERT INTO tbl_estado VALUES("15","PROCESOENCONSULTA","Esta en consulta justo en ese momento");
INSERT INTO tbl_estado VALUES("16","REPORTEPLANTERAPIA","ESTADO PARA EL AREA PSICOLOGICA");
INSERT INTO tbl_estado VALUES("17","EXCELENTE","ESTADO QUE SERA USADO EN MATRICULA");
INSERT INTO tbl_estado VALUES("18","MUY BUENO","ESTADO QUE SERA USADO EN MATRICULA");
INSERT INTO tbl_estado VALUES("19","BUENO","ESTADO QUE SERA USADO EN MATRICULA");



DROP TABLE IF EXISTS tbl_estudiante;

CREATE TABLE `tbl_estudiante` (
  `CODIGO_ESTUDIANTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `GRADO_ACTUAL` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `REPITENTE` varchar(2) COLLATE utf8mb4_bin NOT NULL,
  `INDICE_ACADEMICO` int(3) DEFAULT NULL,
  `MATE_BAJO_RENDI` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `PASATIEMPOS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DISTRACTORES_ESCOLARES` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `METAS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_EST` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estudiante VALUES("1","9","QUINTO","NO","85","matematica","videojuegos","youtube","ingeniero");
INSERT INTO tbl_estudiante VALUES("2","10","TERCERO","NO","90","Matemáticas","Ver televisión","Redes sociales","Estudiar en la Unah");
INSERT INTO tbl_estudiante VALUES("3","24","NOVENO","NO","90","Inglés","Ver televisión","Redes sociales","Estudiar medicina");
INSERT INTO tbl_estudiante VALUES("4","25","QUINTO","NO","96","Matematica","television","celular","doctora");
INSERT INTO tbl_estudiante VALUES("5","27","SEPTIMO","NO","98","ninguna","leer hacer calculos matematicos","youtube","ser astronauta");
INSERT INTO tbl_estudiante VALUES("6","29","OCTAVO","NO","80","Español","Dibujar","Videos Juegos","Estudiar Ingeniería Agrónomo ");
INSERT INTO tbl_estudiante VALUES("7","30","ONCEAVO","NO","90","Inglés","Decorar y dibujar","Instagram","Ser Doctora");
INSERT INTO tbl_estudiante VALUES("8","31","OCTAVO","NO","80","matematicas","jugar futbol","redes sociales","ir a la universidad");



DROP TABLE IF EXISTS tbl_estudiante_socioeconomico;

CREATE TABLE `tbl_estudiante_socioeconomico` (
  `CODIGO_ESTUDIANTE_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(15) NOT NULL,
  `CODIGO_ESTUDIANTE` int(15) NOT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE_SOCIOECONOMICO`),
  KEY `FK_CONTSOCIO` (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_CON_ES` (`CODIGO_ESTUDIANTE`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estudiante_socioeconomico VALUES("1","1","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("2","2","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("3","3","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("4","5","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("5","7","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("6","11","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("7","12","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("8","13","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("9","1","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("10","2","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("11","4","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("12","5","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("13","7","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("14","8","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("15","11","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("16","12","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("17","13","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("18","1","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("19","2","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("20","4","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("21","7","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("22","11","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("23","12","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("24","13","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("25","1","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("26","2","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("27","6","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("28","8","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("29","9","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("30","11","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("31","12","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("32","13","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("33","1","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("34","2","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("35","3","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("36","4","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("37","7","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("38","11","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("39","12","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("40","13","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("41","1","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("42","4","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("43","7","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("44","8","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("45","11","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("46","12","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("47","13","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("48","1","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("49","2","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("50","4","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("51","7","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("52","8","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("53","11","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("54","12","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("55","1","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("56","6","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("57","7","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("58","11","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("59","12","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("60","13","8");



DROP TABLE IF EXISTS tbl_examenes_medicos;

CREATE TABLE `tbl_examenes_medicos` (
  `CODIGO_EXAMEN_MEDICO` int(11) NOT NULL AUTO_INCREMENT,
  `EXAMEN_MEDICO` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_MEDICO`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_examenes_medicos_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_examenes_medicos VALUES("1","HEMOGRAMA","","DANIEL","2022-07-27","","","2");
INSERT INTO tbl_examenes_medicos VALUES("2","ELECTROGRAMA","","DANIEL","2022-07-30","","","2");



DROP TABLE IF EXISTS tbl_examenes_pacientes;

CREATE TABLE `tbl_examenes_pacientes` (
  `CODIGO_EXAMEN_PACIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONSULTA` int(5) DEFAULT NULL,
  `CODIGO_EXAMEN_MEDICO` int(5) DEFAULT NULL,
  `OBSERVACIONES` varchar(400) NOT NULL,
  `INDICACIONES` varchar(400) NOT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_PACIENTE`),
  KEY `FK_COD_CONSULTA` (`CODIGO_CONSULTA`),
  KEY `FK_COD_EXAMEN_MEDICO` (`CODIGO_EXAMEN_MEDICO`),
  CONSTRAINT `FK_COD_CONSULTA` FOREIGN KEY (`CODIGO_CONSULTA`) REFERENCES `tbl_consulta_medica` (`CODIGO_CONSULTA`),
  CONSTRAINT `FK_COD_EXAMEN_MEDICO` FOREIGN KEY (`CODIGO_EXAMEN_MEDICO`) REFERENCES `tbl_examenes_medicos` (`CODIGO_EXAMEN_MEDICO`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_examenes_pacientes VALUES("1","1","1","NINGUNA","EN AYUNAS");
INSERT INTO tbl_examenes_pacientes VALUES("2","2","1","HACERLO EN AYUNAS, SOLO SE PUEDE TOMAR AGUA","PARA VER NIVEL DE GLOBULOS ROJOS Y BLANCOS");
INSERT INTO tbl_examenes_pacientes VALUES("3","3","1","TRAER LOS EXAMENES","REALIZARLO EN LA CLINICA DE AQUI");
INSERT INTO tbl_examenes_pacientes VALUES("4","4","1","IR TEMPRANO","ES PARA VER COMO EST");
INSERT INTO tbl_examenes_pacientes VALUES("5","5","1","PARA CHEQUER","HACERLO EN AYUNAS");
INSERT INTO tbl_examenes_pacientes VALUES("6","6","2","IR DESAYUNADO","PARA REVISION DEL CORAZON");
INSERT INTO tbl_examenes_pacientes VALUES("7","7","2","IR EN AYUNAS","PARA CHEQUEO DEL CORAZON");
INSERT INTO tbl_examenes_pacientes VALUES("8","8","2","NO TIRNE","PARA CHEQUEO DEL CUEPRO");
INSERT INTO tbl_examenes_pacientes VALUES("9","10","2","\n\nDFJNDFNKNK+6\n`\n\nNJN\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\\55454454544=CDMFM\n\n232323389212\nJM\n\nKNNJNJJNJ\nJNJJJ\n\n M\n\n\n\n N\n\n\n\n\n\n\n\n\n\n\nNDM\nD\n MN M M MFMNDMFNBMBDMFDM\n\n\nN\n54654MNDMNFMNMNMN\nNM NM DN MN NNMN323232\nNMMNMMNNM233\nNBNMFMNDBM\n\n14\n\n\n\n\n\n\n546546451\\]]DF\n\nNSBDMNBMNK NKNS KDNKNNKSJDNFK KJNDKJNKJD\n63232\nDSFMNMNS,MDNSMN 313\nD NFSN \nK KFDNKJND NKDKD\nK","12 CICLO  ACRIVIDAD 6\n\n");
INSERT INTO tbl_examenes_pacientes VALUES("10","11","2","HACERLO EN AYUNAS","SANGRE COMPLETO");
INSERT INTO tbl_examenes_pacientes VALUES("11","12","1","NINGUNA","REALIZARLO EN AYUNA ");
INSERT INTO tbl_examenes_pacientes VALUES("12","14","1","EN AYUNAS","SANGRE COMPLETO");
INSERT INTO tbl_examenes_pacientes VALUES("13","14","2","NINGUNA","PARA CHEQUEO");
INSERT INTO tbl_examenes_pacientes VALUES("14","16","1","NINGUNO","SANGRE");



DROP TABLE IF EXISTS tbl_expediente_espiritual;

CREATE TABLE `tbl_expediente_espiritual` (
  `CODIGO_EXPEDIENTE` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(10) DEFAULT NULL,
  `CODIGO_ESTADO` int(10) DEFAULT NULL,
  `NOMBRE_IGLESIA` varchar(50) DEFAULT NULL,
  `GRUPO_IGLESIA` varchar(50) DEFAULT NULL,
  `TIEMPO_ASISTIR_IGLESIA` varchar(50) DEFAULT NULL,
  `MOTIVACION_IGLESIA` longtext DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE`),
  KEY `COD_EXP_ESPIRITUAL_PERSONA` (`CODIGO_PERSONA`),
  KEY `COD_EST_EXP_ESPIRITUAL` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EST_EXP_ESPIRITUAL` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EXP_ESPIRITUAL_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_expediente_espiritual VALUES("1","10","2","Santa Tereza de Jesus","Ninguno","Hace 1 año","Participar en las actividades","2022-07-26");
INSERT INTO tbl_expediente_espiritual VALUES("2","9","2","alemania","ninguna","1 año ","dios ","2022-07-30");



DROP TABLE IF EXISTS tbl_expediente_medico;

CREATE TABLE `tbl_expediente_medico` (
  `CODIGO_EXPEDIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_ESTADO` int(5) DEFAULT NULL,
  `CODIGO_TIPO_SANGRE` int(5) DEFAULT NULL,
  `TRATAMIENTOS` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `ENFERMEDADES` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE`),
  KEY `COD_EXP_PERSONA` (`CODIGO_PERSONA`),
  KEY `FK_COD_TIPO_SANGRE` (`CODIGO_TIPO_SANGRE`),
  KEY `COD_EST_EXPE` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_medico VALUES("1","10","2","9","Ninguno","Asma leve","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("2","31","2","8","ninguno por el momento","alergias unicamente","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("3","30","2","9","acetaminofén","migraña","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("4","27","2","8","ninguno","nou tiene","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("5","25","2","8","ninguno por los momentos","no tiene","2022-07-30");
INSERT INTO tbl_expediente_medico VALUES("6","9","2","8","no tiene","no tiene","2022-07-30");
INSERT INTO tbl_expediente_medico VALUES("7","24","2","9","NO TIENEn","no tiene","2022-07-30");
INSERT INTO tbl_expediente_medico VALUES("8","29","2","8","NINGUNO","DEPRESION LEVE","2022-08-02");



DROP TABLE IF EXISTS tbl_expediente_psicologico_consulta;

CREATE TABLE `tbl_expediente_psicologico_consulta` (
  `CODIGO_EXPEDIENTE_PSICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(5) DEFAULT NULL,
  `SINTOMAS` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `DIAGNOSTICO_INGRESO` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `DIAGNOSTICO_EGRESO` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `OBSEVARCIONES` varchar(600) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE_PSICO`),
  KEY `FK_CODIGO_CITA_CONSULTA` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_psicologico_consulta VALUES("1","10","ESCUCHA VOCES,NO PUEDE DORMIR POR LA NOCHES","NINGUNO","SE ESPERA EN RESULTADOS","ES UN CASO DELICADO","","2022-07-27","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("2","9","SE PRESENTA TRISTEZA EN LA MAYOR PARTE DEL TIEMPO","POR LOS SINTOMAS ENCONTRADO LA PERSONA SUFRE DEPRESION","HA MEJORADO AL HACER EJERCICIOS FISICOS","NINGUNA","","2022-07-27","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("3","13","NO TIENE SITNOMAS EL DIA DE HOY","ESTA MEDIO MAL HUMOR","TODAVIA NO SE TIENE","NO SE LE VA CREAR PLAN,SOLO HACER CHARLAS ","","2022-07-27","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("4","41","NERVIOSISMO, DOLORES DE CABEZA INTENSOS","ANSIEDAD SOCIAL","ANSIEDAD","LE CUESTA COMUNICARSE","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("5","44","POCA PACIENCIA Y TOLERANCIA","SINTOMAS DE ABANDONO","IRA","SE COMPORTA DEMASIADO INFANTIL","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("6","45","NO TIENE ","NO SE TIENE AUN","SE ESPERA QUE BUENO","NINGUNA","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("7","46","NO TIENE ","NO TIENE","NO TIENE","NO TIENE","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("8","47","NO PUEDE DORMIR EN LA NOCHE,VE SOMBRAS","SE VE TEMEROSA,MIEDOSA","SE ESPERAN BUENOS RESULTADOS","RECETAR PLAN","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("9","49","ESCULLAS VOCES,LE CUESTA DORMIR POR LAS NOCHES","ES UN CASO DELICADO,SE DEBE TRATAR CON DISCRECION","NO SE TIENE AUN ","NINGUNA","","2022-08-03","","");



DROP TABLE IF EXISTS tbl_expediente_psicologico_unico;

CREATE TABLE `tbl_expediente_psicologico_unico` (
  `CODIGO_EXPEDIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ESTADO` int(5) DEFAULT NULL,
  `ANTECEDENTES_FAMILIARES` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `ANTECEDENTES_PERSONALES` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `ANTECEDENTES_CLINICOS` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE`),
  KEY `COD_EXP_PERSONA` (`CODIGO_PERSONA`) USING BTREE,
  KEY `COD_ESTA_EXPE` (`CODIGO_ESTADO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_psicologico_unico VALUES("1","31","2","SUS FAMILIARES TUVIERON PROBLEMAS DE EQUIZOFRENIA NIVEL 4","SOSPECHAS DE EQUIZOFRENIA","SALUDABLE","2022-07-26");
INSERT INTO tbl_expediente_psicologico_unico VALUES("2","29","2","VIVE CON SUS PADRES  Y SE OBSERVA UNA EXCELENTE RELACION ","TIENE APTITUD POSITIVA ","NINGUNOS ","2022-07-26");
INSERT INTO tbl_expediente_psicologico_unico VALUES("3","30","2","DEPRESIÓN","ANSIEDAD","NINGUNO","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("4","24","2","IRA","NINGUNO","NINGUNO","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("5","27","2","NO TIENE NINGUNO","NO TIENE,PERO PUEDE PADECER ALGUNSO","SE ENCUENTRA EN BUENA SALUD","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("6","9","2","NO PRESENTA NINGUNO","TENDECIAS EQUIZOFRENICAS DESDE PEQUEÑO","SOLO PRESENTA ALERGIAS","2022-08-02");



DROP TABLE IF EXISTS tbl_familiar;

CREATE TABLE `tbl_familiar` (
  `CODIGO_FAMILIAR` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `ESTADO_CIVIL` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `NIVEL_EDUCATIVO` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `INGRESOS_DE_FAMILIAR` int(6) DEFAULT NULL,
  `NOMBRE_IGLESIA` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FAMILIAR`),
  KEY `FAM_PK` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_familiar VALUES("1","14","CASADO","SECUNDARIA","15000","NINGUNA");
INSERT INTO tbl_familiar VALUES("2","15","CASADA","UNIVERSITARIO","80000","BASILICA DE SUYAPA");
INSERT INTO tbl_familiar VALUES("3","26","SOLTERA","SECUNDARIA","6000","BASILICA DE SUYAPA");
INSERT INTO tbl_familiar VALUES("4","28","CASADA","SECUNDARIA","5000","NINGUNA");



DROP TABLE IF EXISTS tbl_familiares_estudiante;

CREATE TABLE `tbl_familiares_estudiante` (
  `CODIGO_FAMILIAR_ESTUDIANTE` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_FAMILIAR` int(5) DEFAULT NULL,
  `CODIGO_PARENTESCO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FAMILIAR_ESTUDIANTE`),
  KEY `COD_ESTU_PARE` (`CODIGO_ESTUDIANTE`),
  KEY `COD_FAM_PARE` (`CODIGO_FAMILIAR`),
  KEY `COD_PARA_PARE` (`CODIGO_PARENTESCO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_familiares_estudiante VALUES("1","2","1","1");
INSERT INTO tbl_familiares_estudiante VALUES("2","1","2","2");
INSERT INTO tbl_familiares_estudiante VALUES("3","4","3","2");
INSERT INTO tbl_familiares_estudiante VALUES("4","2","4","2");
INSERT INTO tbl_familiares_estudiante VALUES("5","1","3","2");
INSERT INTO tbl_familiares_estudiante VALUES("6","1","4","8");



DROP TABLE IF EXISTS tbl_inscripcion_cita;

CREATE TABLE `tbl_inscripcion_cita` (
  `CODIGO_CITA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ESPECIALISTA` int(5) DEFAULT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `AREA_CITA` int(5) NOT NULL,
  `FECHA_CITA` date DEFAULT NULL,
  `HORARIO` time DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CITA`),
  KEY `FK_CODIGO_PERSONAS` (`CODIGO_PERSONA`),
  KEY `FK_CODIGO_ESPECIALISTA` (`CODIGO_ESPECIALISTA`),
  KEY `COD_ESTA_FK` (`CODIGO_ESTADO`),
  KEY `COD_AREA_FK` (`AREA_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_inscripcion_cita VALUES("1","27","6","5","3","2022-07-27","10:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("2","27","6","5","3","2022-07-26","10:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("3","27","1","13","2","2022-07-26","09:30:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("4","31","8","13","2","2022-07-26","09:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("5","29","6","5","3","2022-07-26","09:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("6","9","1","7","2","2022-07-27","12:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("7","25","4","7","2","2022-07-27","14:30:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("8","10","1","7","2","2022-07-26","09:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("9","29","9","13","3","2022-07-26","13:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("10","31","2","13","3","2022-07-26","17:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("11","10","1","13","2","2022-07-26","12:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("12","31","8","0","2","2022-07-26","14:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("13","31","2","13","3","2022-07-26","15:30:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("14","25","4","5","2","2022-07-26","18:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("15","29","9","0","3","2022-07-26","14:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("16","29","9","9","3","2022-07-26","14:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("17","10","3","13","4","2022-07-26","11:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("18","30","8","13","2","2022-07-26","15:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("19","10","6","5","3","2022-08-10","15:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("20","31","1","13","2","2022-07-28","15:00:00","2022-07-29","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("21","9","10","11","4","2022-07-30","12:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("22","10","1","13","2","2022-07-30","09:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("23","31","1","13","2","2022-07-30","09:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("24","30","1","9","2","2022-07-30","10:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("25","27","1","9","2","2022-07-30","10:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("26","25","1","13","2","2022-07-30","18:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("27","25","1","9","2","2022-07-30","11:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("28","10","1","9","2","2022-07-30","11:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("29","31","1","9","2","2022-07-30","12:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("30","30","1","9","2","2022-07-30","12:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("31","27","1","9","2","2022-07-30","13:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("32","25","1","9","2","2022-07-30","13:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("33","24","9","9","3","2022-07-30","17:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("34","9","8","13","2","2022-07-30","17:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("35","24","8","13","2","2022-07-30","18:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("36","9","1","9","2","2022-07-30","14:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("37","24","1","9","2","2022-07-30","16:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("38","9","1","9","2","2022-07-30","16:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("39","31","4","5","2","2022-08-20","14:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("40","31","1","13","2","2022-08-02","09:30:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("41","30","9","13","3","2022-08-02","14:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("42","30","4","13","2","2022-08-02","13:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("43","31","4","13","2","2022-08-02","15:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("44","24","9","13","3","2022-08-02","10:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("45","31","6","13","3","2022-08-02","09:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("46","30","6","13","3","2022-08-02","09:30:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("47","27","6","13","3","2022-08-02","10:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("48","25","9","9","3","2022-08-02","10:30:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("49","9","6","13","3","2022-08-02","10:30:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("50","29","1","13","2","2022-08-02","14:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("51","10","1","13","2","2022-08-02","17:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("52","9","1","13","2","2022-08-02","15:30:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("53","10","0","0","2","0000-00-00","00:00:00","2022-08-12","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("54","10","1","5","2","2022-08-12","15:00:00","2022-08-12","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("55","31","11","5","3","2022-08-12","14:00:00","2022-08-12","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("56","10","1","5","2","2022-08-12","10:00:00","2022-08-12","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("57","10","1","5","2","2022-08-14","13:00:00","2022-08-12","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("58","27","1","5","2","2022-08-12","16:00:00","2022-08-12","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("59","25","1","5","2","2022-08-13","10:00:00","2022-08-12","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("60","24","1","5","2","2022-08-12","13:00:00","2022-08-12","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("61","31","11","5","3","2022-08-12","10:00:00","2022-08-13","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("62","27","11","5","3","2022-08-16","12:00:00","2022-08-13","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("63","10","3","9","4","2022-08-12","09:00:00","2022-08-13","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("64","9","3","5","4","2022-08-31","13:00:00","2022-08-13","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("65","9","11","9","3","2022-08-13","16:00:00","2022-08-13","0000-00-00","","");



DROP TABLE IF EXISTS tbl_matricula_academica;

CREATE TABLE `tbl_matricula_academica` (
  `CODIGO_MATRICULA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CARGA` int(5) DEFAULT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `OBSERVACION` int(5) DEFAULT NULL,
  `FECHA_MATRICULA` date DEFAULT NULL,
  `OBSERVACION_MATRICULA` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_FINALMATRICULA` date DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MATRICULA`),
  KEY `FK_COD_ESTU` (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_CARGA_MATR` (`CODIGO_CARGA`),
  KEY `FK_COD_ESTA_MATR` (`OBSERVACION`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_matricula_academica VALUES("2","3","4","13","2022-07-27","Falta de atención remitirlo al psicólogo","2022-07-26","CESAR","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("3","2","7","9","2022-07-27","","","LUZ","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("4","1","5","13","2022-07-27","  Debe ir a misa todos los domingos","2022-07-26","RUT","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("5","1","6","9","2022-07-27","","","GABRIELA","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("6","3","1","13","2022-07-27","Practicar en las operaciones de sumar","2022-07-26","CESAR","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("7","3","5","9","2022-07-27","","","RUT","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("8","6","5","9","2022-07-27","","","RUT","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("9","5","4","9","2022-07-27","","","CESAR","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("10","2","8","9","2022-07-27","","","ADMIN","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("12","2","2","9","2022-07-27","","","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("14","1","8","9","2022-07-27","","","ADMIN","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("15","3","2","9","2022-07-27","","","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("16","1","1","9","2022-07-27","","","CESAR","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("17","5","7","9","2022-07-27","","","LUZ","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("18","6","1","9","2022-07-27","","","GABRIELA","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("19","1","2","9","2022-07-27","","","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("20","3","6","9","2022-07-27","","","GABRIELA","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("22","5","5","9","2022-07-29","","","ADMIN","2022-07-29","","");
INSERT INTO tbl_matricula_academica VALUES("23","2","1","9","2022-08-05","","","ALEXANDER","2022-08-05","","");
INSERT INTO tbl_matricula_academica VALUES("24","8","1","9","2022-08-05","","","ALEXANDER","2022-08-05","","");



DROP TABLE IF EXISTS tbl_medicamento;

CREATE TABLE `tbl_medicamento` (
  `CODIGO_MEDICAMENTO` varchar(10) NOT NULL,
  `NOMBRE_MEDICAMENTO` varchar(50) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_MEDICAMENTO`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_medicamento_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_medicamento VALUES("0102","ACETAMINAFEN","PARA LA INFECCION","DANIEL","2022-07-27","","","2");
INSERT INTO tbl_medicamento VALUES("WJ785","ALERGIN","PARA LA ALERGIA","DANIEL","2022-07-27","","","2");



DROP TABLE IF EXISTS tbl_modalidad;

CREATE TABLE `tbl_modalidad` (
  `CODIGO_MODALIDA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MODALIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_modalidad VALUES("1","PRESENCIAL","tienen que ir");



DROP TABLE IF EXISTS tbl_ms_hist_contrasena;

CREATE TABLE `tbl_ms_hist_contrasena` (
  `CODIGO_HIST_CONTRASENA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) NOT NULL,
  `CONTRASENA` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_HIST_CONTRASENA`),
  KEY `FK_COD_USU_HISCON` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_ms_hist_contrasena VALUES("1","2","$2a$07$usesomesillystringfore37tskQ0TgAuqkXPeNH3AVSZts/Lxk.i","2","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("2","4","$2a$07$usesomesillystringforePP9wVrG7ur0QdkQ9rpSzfE/DlP4e8u.","4","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("3","6","$2a$07$usesomesillystringforeP7mXKbfh9ebyT3M.rcGnqD3gYHLx/pu","6","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("4","5","$2a$07$usesomesillystringfore55fKevwQuQAFVH9Lewld91JpLY1ghPG","5","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("5","3","$2a$07$usesomesillystringforeFz7dK1VZWNMEJiH0HNOXYw/HL.5hY4.","3","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("6","7","$2a$07$usesomesillystringforelk7hEP5l/8xGhqhzzpBD065n5bEXx2S","7","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("7","11","$2a$07$usesomesillystringforePH8CXTpBjgw/NZeLeXQ6eBg2yFS9OE.","11","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("8","12","$2a$07$usesomesillystringforeUBzOoe/fyqEveRzs1qiMcRg0TjegQPu","12","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("9","15","$2a$07$usesomesillystringforeFUN5v3JgHk8ENz9lcf.hrCfeYRowdmi","15","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("10","17","$2a$07$usesomesillystringforeto0mvDpaV0DK4cFtWyWxnWiZ4qt7Z4.","17","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("11","13","$2a$07$usesomesillystringfore/K7kHH0AKBo3XrR19eUxnbbahup7owe","13","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("12","20","$2a$07$usesomesillystringforeUvuV8h0neq0uPPmQLgOJsjz2TeSbXeC","20","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("13","21","$2a$07$usesomesillystringforeC1qiwiZxWnmXgS0TeTaf41.2zC9eoJa","21","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("14","16","$2a$07$usesomesillystringfore.OFApK0lnq2pWTrZBEzPs25tOi/peQO","16","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("15","8","$2a$07$usesomesillystringfore24KuaN0qO9IVZ9tIXt3l5Gy/G5o.KWm","8","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("16","10","$2a$07$usesomesillystringforecHYBqgWfna9zyvdLydQv0EYK49B5C82","10","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("17","14","$2a$07$usesomesillystringforeVxRNnRV8j0V/Qv7SN5pK5Zs/4jXqeqa","14","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("18","18","$2a$07$usesomesillystringforeOe47YYBALHNylsq90yhjERGpHl.p9kG","18","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("19","19","$2a$07$usesomesillystringforeVTuDZ.MUZx5QQxqolAMBpd2VqKlfrRa","19","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("20","22","$2a$07$usesomesillystringforemrCfnY4uA0DxWUm8xBIP17QxqXX.scS","22","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("21","23","$2a$07$usesomesillystringforehRJWC.CF6mpqr2p1llRk3PxU/cZ65DS","23","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("22","24","$2a$07$usesomesillystringforeHgs1s2uw38U9bfe/nzsY9NxbYN5tPiC","24","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("23","25","$2a$07$usesomesillystringforeBNDqae843YwiG.YpUXHq9I4KSLbDAQ6","25","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("24","26","$2a$07$usesomesillystringfore6EINqszN38WG50TBh9xqXuz82S4gTBK","26","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("25","27","$2a$07$usesomesillystringforeP5wUikw4pkTxWim7XoEvmNeS8uKtbjS","27","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("26","9","$2a$07$usesomesillystringforeK2F0CA.OyIc/hzje/abe5/.lBawI8Ca","9","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("27","29","$2a$07$usesomesillystringforeblZb1GTXAapsXwHWRL.b5euZYiVxqqi","29","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("28","2","$2a$07$usesomesillystringforeCFgULGhtYgEopegGdjbjYiHOQCeHz.S","2","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("29","5","$2a$07$usesomesillystringforek7hUNAdfzELkC2Xk6YPva7JCsoP6rh.","5","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("30","30","$2a$07$usesomesillystringforexaT521Gc5.mSUIJJ0vSh13z7PZH50h2","30","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("31","28","$2a$07$usesomesillystringforef3K3SHJ3KU57GQVdI9QQ7CPsELwicyS","28","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("32","31","$2a$07$usesomesillystringforeo.Za9sjz40Tnh798TxidWyZRTQ.mtoC","31","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("33","32","$2a$07$usesomesillystringforeXAQheGJF7USzYzdQgtA7gv6RllsR2Va","32","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("34","29","$2a$07$usesomesillystringforebrDq7a11hNalS8A/Qc005lZHvD30Wd6","29","0000-00-00","","");



DROP TABLE IF EXISTS tbl_objetos;

CREATE TABLE `tbl_objetos` (
  `CODIGO_OBJETO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_OBJETO`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_objetos VALUES("1","ESTADOS","SISTEMA DE ADMINISTRACION. ","Administrador","2022-02-09","2022-08-13","ADMIN");
INSERT INTO tbl_objetos VALUES("2","ROLES","OBJETO DONDE SE REGISTRAN PERSONAS   ","Administrador","2022-02-06","2022-08-13","ADMIN");
INSERT INTO tbl_objetos VALUES("3","PARAMETROS","PARÁMETROS DEL SISTEMA","Administrador","2022-03-04","2022-08-13","ADMIN");
INSERT INTO tbl_objetos VALUES("4","PREGUNTAS","OBJETO MANTENIMIENTO PREGUNTAS  DE SEGURIDAD","ADMIN","2022-03-04","2022-08-13","ADMIN");
INSERT INTO tbl_objetos VALUES("5","PERMISOS","OBJETO MANTENIMIENTO PERMISOS  ","ADMIN","2022-03-04","2022-08-13","ADMIN");
INSERT INTO tbl_objetos VALUES("6","OBJETOS","OBJETO MANTENIMIENTO OBJETOS DEL SISTEMA","ADMIN","2022-03-04","2022-08-13","ADMIN");
INSERT INTO tbl_objetos VALUES("7","BITACORA DEL SISTEMA","OBJETO CONSULTA BITACORA ","ADMIN","2022-03-04","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("10","RESPALDO Y RESTAURACION","OBJETO MANTENIMIENTO BACKUP  ","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("20","GESTION CARGA ACADEMICA Y ESPIRITUAL","OBJETO MANTENIMIENTO CARGA ACADÉMICA Y ESPIRITUAL","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("23","MATRICULA ACADEMICA Y ESPIRITUAL","GESTION DE LA MATRICULA ACADEMICA Y ESPIRITUAL","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("25","GESTION DE PERSONAS","GESTION DE LOS DATOS DE LOS USUARIOS","","0000-00-00","2022-08-13","ADMIN");
INSERT INTO tbl_objetos VALUES("26","GESTION DE ESTUDIANTES","OBJETO DE GESTION DE LOS ESTUDIANTES","ADMIN","2022-03-10","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("27","SEGURIDAD","GESTION DE SEGURIDAD","ADMIN","2022-03-10","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("30","AREA MEDICA","OBJETO DE GESTION DE LAS CITAS MEDICAS","ADMIN","2022-03-10","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("31","AREA PSICOLOGIA","OBJETO DEL AREA PSICOLOGICA","ADMIN","2022-03-18","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("32","GESTION DE CITAS","OBJETO QUE GESTIONA LAS CITAS","","2022-03-27","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("38","AREA DEL TUTOR","GESTIÓN DEL MÓDULO DEL TUTOR ACADEMICO","","2022-04-21","2022-08-12","ADMIN");
INSERT INTO tbl_objetos VALUES("49","AREA DE ENFERMERIA","OBJETO PARA GESTIONAR LA PRECLÍNICA","","2022-04-24","2022-08-13","ADMIN");
INSERT INTO tbl_objetos VALUES("50","PRECLINICA POR MEDICOS","OBJETO PARA VER PRECLINICA POR PARTE DE LOS MEDICOS","","2022-04-24","2022-08-12","ADMIN");
INSERT INTO tbl_objetos VALUES("51","AREA DE ESTUDIANTES","VER LO ASIGNADO A EL ESTUDIANTE.","ADMIN","2022-05-03","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("52","AREA ESPIRITUAL","GESTION DEL AREA ESPIRITUAL POR EL CATEQUISTA","ALBERT","2022-05-06","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("54","ACCESO AL SISTEMA","OBJETO QUE DESCRIBE EL ACCESO AL SISTEMA","HOLA","2022-06-18","0000-00-00","");
INSERT INTO tbl_objetos VALUES("55","USUARIOS","OBJETO GESTIÓN DE USUARIOS","ADMIN","2022-08-13","","");



DROP TABLE IF EXISTS tbl_parametros;

CREATE TABLE `tbl_parametros` (
  `CODIGO_PARAMETRO` int(11) NOT NULL AUTO_INCREMENT,
  `PARAMETRO` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `VALOR` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PARAMETRO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros VALUES("1","NUM_INTEN_VALIDOS","3","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("2","NUM_MAX_PREGUNTAS","2","Administrador","2022-02-07","2022-08-11","ALEXANDER");
INSERT INTO tbl_parametros VALUES("3","NUM_MAX_CONTRASENAS","8","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("4","NUM_MAX_CARACTER","15","Administrador","2022-02-07","2022-04-07","ADMIN");
INSERT INTO tbl_parametros VALUES("5","ADMIN_SERVIDOR_CORREO","smtp-mail.outlook.com","","0000-00-00","2022-07-06","LUIS");
INSERT INTO tbl_parametros VALUES("6","ADMIN_CPASSWORD","Prosecar123*","","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("7","ADMIN_CUSUARIO","pruebaprosecar@outlook.com","","0000-00-00","2022-07-06","LUIS");
INSERT INTO tbl_parametros VALUES("8","ADMIN_CPUERTO","587","ADMIN","2022-03-07","0000-00-00","");
INSERT INTO tbl_parametros VALUES("10","NOMBRE_EMPRESA","PROYECTO SEMILLERO CARMELITANO PROSECAR\n","ADMIN","2022-03-22","0000-00-00","");
INSERT INTO tbl_parametros VALUES("11","MAX_MESES_DE_TUTURIA","6","ADMIN","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("12","HORA_INICIO_ATENCIONCITA","09:00","ADMIN","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("13","HORA_FINAL_ATENCIONCITA","18:00","ADMIN","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("14","HORA_INICIO_CARGAACADEMICA","09:00","ADMIN","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("15","HORA_FINAL_CARGAACADEMICA","18:00","ADMIN","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("16","NUM_MIN_CARACTER","5","Administrador","2022-05-26","0000-00-00","");
INSERT INTO tbl_parametros VALUES("17","MAX_USUARIO","15","Administrador","2022-05-26","0000-00-00","");
INSERT INTO tbl_parametros VALUES("18","MIN_USUARIO","3","Administrador","2022-05-26","0000-00-00","");
INSERT INTO tbl_parametros VALUES("19","NUM_INTENTOS_PREGUNTAS","2","Administrador","2022-05-31","0000-00-00","");
INSERT INTO tbl_parametros VALUES("20","MIN_RESPUESTA_PREGUNTAS","4","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("21","MAX_RESPUESTA_PREGUNTAS","50","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("22","RECUPERACION_CORREO","INACTIVO","ALEXANDER","2022-08-13","2022-08-13","ADMIN");



DROP TABLE IF EXISTS tbl_parametros_usuarios;

CREATE TABLE `tbl_parametros_usuarios` (
  `CODIGO_PARAM_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `CODIGO_PARAMETRO` int(5) DEFAULT NULL,
  `PAR_VALOR` int(5) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PARAM_USUARIO`),
  KEY `FK_CODPAR_USU` (`CODIGO_USUARIO`),
  KEY `FK_CODPAR_PAR` (`CODIGO_PARAMETRO`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros_usuarios VALUES("1","1","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("2","2","1","0","","0000-00-00","2022-08-11","");
INSERT INTO tbl_parametros_usuarios VALUES("3","2","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("4","2","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("5","2","19","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("6","3","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("7","3","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("8","3","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("9","3","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("10","4","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("11","4","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("12","4","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("13","4","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("14","5","1","3","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("15","5","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("16","5","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("17","5","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("18","6","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("19","6","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("20","6","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("21","6","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("22","7","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("23","7","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("24","7","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("25","7","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("26","8","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("27","8","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("28","8","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("29","8","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("30","9","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("31","9","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("32","9","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("33","9","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("34","10","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("35","10","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("36","10","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("37","10","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("38","11","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("39","11","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("40","11","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("41","11","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("42","12","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("43","12","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("44","12","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("45","12","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("46","13","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("47","13","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("48","13","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("49","13","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("50","14","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("51","14","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("52","14","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("53","14","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("54","15","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("55","15","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("56","15","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("57","15","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("58","16","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("59","16","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("60","16","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("61","16","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("62","17","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("63","17","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("64","17","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("65","17","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("66","18","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("67","18","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("68","18","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("69","18","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("70","19","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("71","19","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("72","19","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("73","19","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("74","20","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("75","20","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("76","20","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("77","20","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("78","21","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("79","21","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("80","21","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("81","21","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("82","22","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("83","22","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("84","22","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("85","22","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("86","23","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("87","23","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("88","23","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("89","23","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("90","24","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("91","24","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("92","24","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("93","24","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("94","25","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("95","25","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("96","25","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("97","25","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("98","26","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("99","26","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("100","26","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("101","26","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("102","27","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("103","27","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("104","27","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("105","27","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("106","28","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("107","28","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("108","28","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("109","28","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("110","29","1","1","","0000-00-00","2022-08-11","");
INSERT INTO tbl_parametros_usuarios VALUES("111","29","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("112","29","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("113","29","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("114","30","1","2","","0000-00-00","2022-08-11","");
INSERT INTO tbl_parametros_usuarios VALUES("115","30","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("116","30","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("117","30","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("118","31","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("119","31","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("120","31","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("121","31","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("122","32","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("123","32","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("124","32","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("125","32","19","0","","0000-00-00","","");



DROP TABLE IF EXISTS tbl_parentesco;

CREATE TABLE `tbl_parentesco` (
  `CODIGO_PARENTESCO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PARENTESCO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_parentesco VALUES("1","PADRE");
INSERT INTO tbl_parentesco VALUES("2","MADRE");
INSERT INTO tbl_parentesco VALUES("3","HERMANA");
INSERT INTO tbl_parentesco VALUES("4","HERMANO");
INSERT INTO tbl_parentesco VALUES("5","ABUELA");
INSERT INTO tbl_parentesco VALUES("6","ABUELO");
INSERT INTO tbl_parentesco VALUES("7","TIO");
INSERT INTO tbl_parentesco VALUES("8","TIA");



DROP TABLE IF EXISTS tbl_permisos;

CREATE TABLE `tbl_permisos` (
  `CODIGO_PERMISO` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `INSERTAR` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `ELIMINAR` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `ACTUALIZAR` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `MOSTRAR` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERMISO`),
  KEY `FK_CO_OBJECT` (`CODIGO_OBJETO`),
  KEY `FK_CO_TROL` (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_permisos VALUES("1","1","1","SI","SI","SI","SI","Administrador","2022-03-02","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("6","1","2","SI","SI","SI","SI","ADMIN","2022-03-04","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("8","1","5","SI","SI","SI","SI","ADMIN","2022-03-05","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("10","1","10","SI","SI","SI","SI","ADMIN","2022-03-05","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("13","1","3","SI","SI","SI","SI","ADMIN","2022-03-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("14","1","4","SI","SI","SI","SI","ADMIN","2022-03-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("15","2","38","SI","SI","SI","SI","ADMIN","2022-03-08","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("17","1","25","SI","SI","SI","SI","","0000-00-00","$1","2022-07-13");
INSERT INTO tbl_permisos VALUES("18","1","26","SI","SI","SI","SI","ADMIN","2022-03-10","$1","2022-07-13");
INSERT INTO tbl_permisos VALUES("19","1","27","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("23","1","7","SI","SI","SI","SI","ADMIN","2022-03-12","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("24","5","30","SI","SI","SI","SI","ADMIN","2022-03-14","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("25","4","31","SI","SI","SI","SI","ADMIN","2022-03-18","","0000-00-00");
INSERT INTO tbl_permisos VALUES("26","1","32","SI","SI","SI","SI","","2022-03-27","$1","2022-07-13");
INSERT INTO tbl_permisos VALUES("36","5","32","NO","NO","NO","NO","","2022-04-14","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("41","1","20","SI","SI","SI","SI","","2022-04-23","$1","2022-07-13");
INSERT INTO tbl_permisos VALUES("43","1","23","SI","SI","SI","SI","","2022-04-24","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("46","1","6","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("53","7","49","SI","SI","SI","SI","","2022-04-24","","0000-00-00");
INSERT INTO tbl_permisos VALUES("54","5","50","SI","SI","SI","SI","","2022-04-24","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("56","9","27","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("57","9","5","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("58","9","20","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("62","9","25","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("63","9","26","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("65","9","23","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("66","9","6","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("67","9","30","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("68","9","32","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("69","9","31","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("71","9","10","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("72","9","7","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("73","9","38","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("74","9","52","SI","SI","SI","SI","","2022-05-06","","0000-00-00");
INSERT INTO tbl_permisos VALUES("75","6","52","SI","SI","SI","SI","","2022-05-06","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("82","8","51","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("94","9","2","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("95","9","4","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("96","9","1","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("97","9","3","SI","SI","SI","SI","","2022-06-05","$9","2022-08-13");
INSERT INTO tbl_permisos VALUES("100","9","49","SI","SI","SI","SI","","2022-08-12","","0000-00-00");
INSERT INTO tbl_permisos VALUES("101","9","51","SI","SI","SI","SI","","2022-08-13","","0000-00-00");
INSERT INTO tbl_permisos VALUES("102","1","55","SI","SI","SI","SI","","2022-08-13","","0000-00-00");
INSERT INTO tbl_permisos VALUES("103","9","55","SI","SI","SI","SI","","2022-08-13","$9","2022-08-13");



DROP TABLE IF EXISTS tbl_persona;

CREATE TABLE `tbl_persona` (
  `CODIGO_PERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `PRIMER_NOMBRE` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `SEGUNDO_NOMBRE` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `DNI` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `SEXO` char(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `LUGAR_NACIMIENTO` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `DIRECCION` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `FECHA_INSCRIPCION` date DEFAULT NULL,
  `FECHA_BAJA` date DEFAULT NULL,
  `CODIGO_TIPO_PERSONA` int(5) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA`),
  KEY `FK_COD_TIP_PERSONA` (`CODIGO_TIPO_PERSONA`),
  KEY `FK_SEX_PERSONA` (`SEXO`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona VALUES("1","ADMIN","ADMIN","ADMIN","ADMIN","","M","2000-05-20","TEGUCIGALPA","","2022-07-26","","3","","2022-07-26","","");
INSERT INTO tbl_persona VALUES("2","DIANAA","RUT","GARCIA","AMADOR","0801200012391","F","2000-06-16","FRANCISCO MORAZAN","EN UNA CASITA :3","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("3","LUZ","MARÍA","MONTOYA","MEDINA","0801200108492","F","2001-05-04","TEGUCIGALPA","MI CASA","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("4","JOSE","LUIS","MORALES","DIAZ","0810199365874","M","1993-08-23","TEGUCIGALPA","COLONIA ALEMAN","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("5","GABRIELA","GISSELA","DIAZ","AGUILERA","0601197000182","F","1970-11-17","CHOLUTECA","BARRIO LAS COLINAS CHOLUTECA ","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("6","ARNOLD","ALEXANDER","CABALLERO","","1411199600015","M","1990-07-05","OCOTEPEQUE","LA LAGUNA","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("7","CESAR","FERNANDO","ROVELO","VELASQUEZ","0801199902485","M","1999-02-02","TEGUS","UN LUGAR ","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("8","JUAN","ALBERTO","PEREZ","CRUZ","1202199601236","M","1996-03-06","LA PAZ","COL. KENEDY","2022-07-26","","2","LUZ","0000-00-00","","");
INSERT INTO tbl_persona VALUES("9","DAVID","ALEJANDRO","OCHOA","MARQUEZ","0943928932402","M","2011-05-26","TEGUCIGALPA","PRADOS UNIVERSITARIO","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("10","IKER","JOSUE","URQUIA","YANES","0801200902454","M","2009-05-01","TEGUCIGALPA","LA LAGUNA","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("11","DANIEL","FERDINAND","MARTINEZ","MORADEL","9565566556556","M","1998-05-08","TEGUCIGALPA","COLONIA LAS COLINAS","2022-07-26","","5","JOSE","0000-00-00","","");
INSERT INTO tbl_persona VALUES("12","LIDIA","RAQUEL","AMADOR","BORJAS","0812331232123","F","1974-06-18","CHOLUTECA","LOMAS DLE GUIJARRO","2022-07-26","","6","RUT","0000-00-00","","");
INSERT INTO tbl_persona VALUES("13","YAMILETH","KARLA","AGUILERA","DIAZ","0612199500162","F","1995-11-21","PESPIRE","PESPIRE","2022-07-26","","8","GABRIELA","0000-00-00","","");
INSERT INTO tbl_persona VALUES("14","JOSUE","EMMANUEL","URQUIA","YANES","0801199015454","M","1990-02-05","TEGUCIGALPA","LA LAGUNA","2022-07-26","","7","ALEXANDER","0000-00-00","","");
INSERT INTO tbl_persona VALUES("15","SENDY","KARINA","MARQUEZ","VELASQUEZ","9891283901823","F","1979-06-13","TEGUCIGALPA","PRADOS UNIVERSITARIO","2022-07-26","","7","CESAR","0000-00-00","","");
INSERT INTO tbl_persona VALUES("16","ELENA","MARGARITA","MARTINEZ","CASTILLO","0801199032657","F","1990-07-13","TEGUCIGALPA","COL. 15 DE SEPTIEMBRE","2022-07-26","","2","LUZ","0000-00-00","","");
INSERT INTO tbl_persona VALUES("17","RAMON","JOEL","SOTO","DIAZ","4365445546543","M","1995-04-05","TEGUCIGALPA","COLONIA LAS BRISAS","2022-07-26","","5","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("18","FRANCISCO","","FLORES","","0602199001728","M","1990-07-30","CHOLUTECA","CHOLUTECA","2022-07-26","","8","GABRIELA","0000-00-00","","");
INSERT INTO tbl_persona VALUES("19","JOSUE","SAMUEL","AGUILAR","ZAPATO","0814700023212","M","1978-05-18","FRANCICOS MORAZA","LAS CASITAS","2022-07-26","","6","RUT","0000-00-00","","");
INSERT INTO tbl_persona VALUES("20","LAURA","","ESPINAL","","0611198501230","F","1985-10-06","VALLE","VALLE","2022-07-26","","8","GABRIELA","0000-00-00","","");
INSERT INTO tbl_persona VALUES("21","MARIA","JOSÉ","MONTALVAN","IRIAS","0803199909637","F","1999-03-09","TEGUCIGALPA","COL.  LAS VEGAS","2022-07-26","","2","LUZ","0000-00-00","","");
INSERT INTO tbl_persona VALUES("22","PAULA","SOFIA","MARADIAGA","GARCIA","0812456859874","F","1993-04-05","SAN PEDRO SULA","COLONIA VIDELLA MORALES","2022-07-26","","5","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("23","MARIO","ALEX","POW","RIVERA","0640148787848","M","1990-08-16","FRANCISCO MORAZAN","MIRAFLORES","2022-07-26","","6","RUT","0000-00-00","","");
INSERT INTO tbl_persona VALUES("24","CRISTOPHER","JOSUE","URQUIA","YANES","0801200898987","M","2008-02-24","TEGUCIGALPA","COL LA LAGUNA","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("25","ANDREA","LUCIA","MACHADO","VELASQUEZ","6657567567567","F","2011-10-04","TEGUCIGALPA","ALDEA DE SUYAPA","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("26","KAREN","LIZTHE","MACHADO","VELASQUEZ","6950695096059","F","1984-08-24","TEGUCIGALPA","ALDEA DE SUYAPA","2022-07-26","","7","CESAR","0000-00-00","","");
INSERT INTO tbl_persona VALUES("27","KATY","DANELA","ZAPATA","MORALES","0801201012339","F","2010-05-15","FRANCISCO MORAZAN","EL PEDREGAL","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("28","NOLVIA","MELLISA","GONZALES","","0501989256456","M","1989-05-25","TEGUCIGALPA","COL CERRO GRANDE","2022-07-26","","7","ALEXANDER","0000-00-00","","");
INSERT INTO tbl_persona VALUES("29","DESIRETH","KENDRA","GALEAS","BACA","0607201000121","F","2010-01-21","MARCOVIA","CHOLUTECA","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("30","ESTEFANY","NAOMI","VARELA","MAYORGA","0801200563961","F","2005-01-29","TEGUCIGALPA","LAS CASITAS","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("31","ERICK","","VACA","SOTO","0140545447488","M","1998-04-05","SAN PEDRO SULA","COLONIA EL HOGAR","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("32","ANY","MELISSA","HERNANDEZ","FUENTES","1702199600058","F","1996-03-13","ALIANZA VALLE","ALBORAYA PUEBLO VALENCIA ","2022-07-29","","8","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("33","ISEL","DARIELA","FLORES","FLORES","0611199600333","F","1996-06-02","CHOLUTECA","CHOLUTECA","2022-07-29","","6","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("34","ARMANDO","JOSE","PERALTA","AGULAR","0608199000125","M","1990-10-20","TEGUCIGALPA","TEGUSCIGALPA","2022-07-29","","6","GABRIELA","0000-00-00","","");
INSERT INTO tbl_persona VALUES("35","LUIS","MIGUEL","CRUZ","MENDEZ","0801199012645","M","1990-07-11","TEGUCIGALPA","COL. SAN MIGUEL","2022-08-02","","2","LUZ","0000-00-00","","");
INSERT INTO tbl_persona VALUES("36","VALERIA","SOFIA","PADILLA","ZEELAYA","0802199000168","F","1990-05-05","ALUBAREN","FRANCISCO MORAZAN ","2022-08-02","","2","ADMIN","0000-00-00","","");



DROP TABLE IF EXISTS tbl_persona_especialidad;

CREATE TABLE `tbl_persona_especialidad` (
  `CODIGO_PERSONA_ESPECIALIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_ESPECIALIDAD` int(5) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_ESPECIALIDAD`),
  KEY `FK_COD_ESP_PERSONA` (`CODIGO_PERSONA`),
  KEY `FK_COD_ESPECIALIDAD` (`CODIGO_ESPECIALIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona_especialidad VALUES("1","11","1","JOSE","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("2","12","5","RUT","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("3","13","3","GABRIELA","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("4","17","4","ADMIN","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("5","18","3","GABRIELA","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("6","19","2","RUT","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("7","20","3","GABRIELA","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("8","22","1","ADMIN","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("9","23","2","RUT","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("10","32","3","ADMIN","2022-07-29","","");
INSERT INTO tbl_persona_especialidad VALUES("11","33","2","ADMIN","2022-07-29","","");
INSERT INTO tbl_persona_especialidad VALUES("12","34","2","GABRIELA","2022-07-29","","");



DROP TABLE IF EXISTS tbl_personas_alergias;

CREATE TABLE `tbl_personas_alergias` (
  `CODIGO_PERSONA_ALERGIAS` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ALERGIAS` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_ALERGIAS`),
  KEY `cod_expe_fk` (`CODIGO_EXPEDIENTE_PERSONA`),
  KEY `cod_aler_fk` (`CODIGO_ALERGIAS`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_alergias VALUES("1","2","2");
INSERT INTO tbl_personas_alergias VALUES("2","1","1");
INSERT INTO tbl_personas_alergias VALUES("3","4","1");
INSERT INTO tbl_personas_alergias VALUES("4","5","1");
INSERT INTO tbl_personas_alergias VALUES("5","6","1");
INSERT INTO tbl_personas_alergias VALUES("6","7","1");
INSERT INTO tbl_personas_alergias VALUES("7","8","1");



DROP TABLE IF EXISTS tbl_personas_apariencia;

CREATE TABLE `tbl_personas_apariencia` (
  `CODIGO_PERSONAS_APARIENCIA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_APARIENCIA` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_APARIENCIA`),
  KEY `CODI_PER_APARI` (`CODIGO_APARIENCIA`),
  KEY `CODI_PER_EXPE_APA` (`CODIGO_EXPEDIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_apariencia VALUES("1","1","4");
INSERT INTO tbl_personas_apariencia VALUES("2","2","4");
INSERT INTO tbl_personas_apariencia VALUES("3","3","6");
INSERT INTO tbl_personas_apariencia VALUES("4","4","5");
INSERT INTO tbl_personas_apariencia VALUES("5","5","6");
INSERT INTO tbl_personas_apariencia VALUES("6","6","6");
INSERT INTO tbl_personas_apariencia VALUES("7","7","4");
INSERT INTO tbl_personas_apariencia VALUES("8","8","4");



DROP TABLE IF EXISTS tbl_personas_sintomas;

CREATE TABLE `tbl_personas_sintomas` (
  `CODIGO_PERSONA_SINTOMA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_SINTOMA_NEUROTICO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_SINTOMA`),
  KEY `COD_EXP_PPSICO` (`CODIGO_EXPEDIENTE`),
  KEY `COD_SINT_PP` (`CODIGO_SINTOMA_NEUROTICO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_sintomas VALUES("1","1","1");
INSERT INTO tbl_personas_sintomas VALUES("2","2","3");
INSERT INTO tbl_personas_sintomas VALUES("3","3","1");
INSERT INTO tbl_personas_sintomas VALUES("4","4","1");
INSERT INTO tbl_personas_sintomas VALUES("5","5","1");
INSERT INTO tbl_personas_sintomas VALUES("6","6","1");
INSERT INTO tbl_personas_sintomas VALUES("7","6","2");



DROP TABLE IF EXISTS tbl_personas_transtornos;

CREATE TABLE `tbl_personas_transtornos` (
  `CODIGO_PERSONAS_TRANSTORNOS` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_TRANSTORNO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_TRANSTORNOS`),
  KEY `CODI_PER_EXPE` (`CODIGO_EXPEDIENTE`),
  KEY `CODI_PER_TRANST` (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_transtornos VALUES("1","1","4");
INSERT INTO tbl_personas_transtornos VALUES("2","2","5");
INSERT INTO tbl_personas_transtornos VALUES("3","3","4");
INSERT INTO tbl_personas_transtornos VALUES("4","4","4");
INSERT INTO tbl_personas_transtornos VALUES("5","4","5");
INSERT INTO tbl_personas_transtornos VALUES("6","5","4");
INSERT INTO tbl_personas_transtornos VALUES("7","6","5");
INSERT INTO tbl_personas_transtornos VALUES("8","7","4");
INSERT INTO tbl_personas_transtornos VALUES("9","8","4");



DROP TABLE IF EXISTS tbl_plan_terapeutico;

CREATE TABLE `tbl_plan_terapeutico` (
  `CODIGO_PLAN` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONSULTA` int(5) DEFAULT NULL,
  `ACTIVIDAD` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `TECNICA` varchar(600) COLLATE utf8mb4_bin NOT NULL,
  `MATERIALES` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `TAREAS` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `RESULTADOS` varchar(600) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_PLAN`),
  KEY `COD_CONSUL_PSICO_FK` (`CODIGO_CONSULTA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_plan_terapeutico VALUES("1","2","HACER EJERCICIO, EJERCITARSE ","ANDA A PASO LIGERO DE 15 A 30 MINUTOS","LA COMPAÑIA DE UN AMIGO","EJERCICIOS DE RESPIRACION QUE PUEDE AYUDAR A REENCOTRARSE MEJOR CON LA DEPRESION","EN CUANTO A LA PRACTICA DE ESTAS TECNICAS ESTA MEJORANDO ");
INSERT INTO tbl_plan_terapeutico VALUES("2","4","ESCRIBIR EN UN DIARIO LO QUE SIENTE","DE RELAJACIÓN","DIARIO PERSONAL, LAPIZ","ESCRIBIR AL MENOS MEDIA PÁGINA TODOS LOS DÍAS POR  2 SEMANAS","LO AVERIGUAREMOS :U");
INSERT INTO tbl_plan_terapeutico VALUES("3","5","HORIGAMI,  PRACTICAR DEPORTE","DE RELAJACIÓN ","PAPEL, BALÓN PARA PRACTICAR ALGÚN DEPORTE","HACER HORIGAMI AL MENOS 3 VECES EN LA SEMANA","NINGUNO POR EL MOMENTO");
INSERT INTO tbl_plan_terapeutico VALUES("4","8","VER PELICULAS DE TERROR","NINGUNA ","UN TELEVISOR ","ESCRIBIR EN UN DIARIO ANTES DE DORIR","SE ESPERA REDUCIR LAS PESADILLAS");



DROP TABLE IF EXISTS tbl_preclinica;

CREATE TABLE `tbl_preclinica` (
  `CODIGO_PRECLINICA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(5) NOT NULL,
  `PESO` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `MASA_CORPORAL` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `ESTATURA` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `TEMPERATURA` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `PULSO` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `FRECUENCIA_CARDIACA` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `FRECUENCIA_RESPIRATORIA` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESNUTRICION` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PRECLINICA`),
  KEY `FK_CODIGO_CITA_PREC` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preclinica VALUES("1","11","100","18.5","1.20","35","70","70/80","12","No tiene","","2022-07-27","","");
INSERT INTO tbl_preclinica VALUES("2","4","138","19","1.85","38","85","70/85","12","Moderado","","2022-07-27","","");
INSERT INTO tbl_preclinica VALUES("3","18","115","20.5","1.50","37","80","70/10","13","No tiene","","2022-07-27","","");
INSERT INTO tbl_preclinica VALUES("4","3","130.5","18.5","1.82","35","70","70/80","21","No tiene","","2022-07-27","","");
INSERT INTO tbl_preclinica VALUES("5","20","130.5","12.5","18.5","35.5","70","70/80","12","No tiene","","2022-07-29","","");
INSERT INTO tbl_preclinica VALUES("6","26","130.5","18.5","1.81","37.5","70","70/80","12","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("7","34","130.5","15.5","1.92","37.4","70","70/80","12","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("8","35","140.5","18.8","1.96","13.6","30","70/80","12","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("9","22","130.5","183.","1.95","36","15","70/80","70","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("10","23","45545","262","5545","623","263","262","23","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("11","40","134","19","1.87","37.2","80","70/80","11","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("12","42","135","18.2","1.66","37","70","70/80","12","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("13","43","130","18","1.68","37.1","70","70/80","12","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("14","50","138","18.5","1.83","38","70","60/80","45","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("15","51","130.5","18.6","1.85","37.5","70","70/80","12","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("16","52","135","15.5","1.85","65","48","70/80","13","No tiene","","2022-08-03","","");



DROP TABLE IF EXISTS tbl_preguntas;

CREATE TABLE `tbl_preguntas` (
  `CODIGO_PREGUNTAS` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTADO` int(5) DEFAULT NULL,
  `PREGUNTA` varchar(60) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PREGUNTAS`),
  KEY `FK_CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODIGO_ESTADO` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preguntas VALUES("1","2","¿CUAL ES TU COMIDA FAVORITA?"," ADMIN","2022-07-16","","");
INSERT INTO tbl_preguntas VALUES("2","2","¿NOMBRE DE TU CARICATURA FAVORITA DE LA INFANCIA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("3","2","¿NOMBRE DE TU PELICULA FAVORITA DE LA INFANCIA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("4","2","¿PARIENTE QUE MAS ADMIRA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("5","2","¿NOMBRE DE TU MASCOTA FAVORITA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("6","2","¿UN JUGADOR DE FUTBOL FAVORITO?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("7","2","¿COLOR DE ROPA FAVORITO?"," ADMIN","2022-07-18","","");



DROP TABLE IF EXISTS tbl_preguntas_usuarios;

CREATE TABLE `tbl_preguntas_usuarios` (
  `CODIGO_PREGUNTA_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PREGUNTAS` int(5) DEFAULT NULL,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `RESPUESTA` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PREGUNTA_USUARIO`),
  KEY `FK_CODPRE_PREU` (`CODIGO_PREGUNTAS`),
  KEY `FK_CODU_PREU` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preguntas_usuarios VALUES("1","7","2","NEGRO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("2","1","4","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("4","5","5","MANOLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("5","1","3","POLLO ","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("6","1","7","PIZZA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("7","1","11","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("8","2","12","NO TIENE","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("9","1","15","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("10","4","17","MI NOVIA UWU","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("11","1","13","CARNE ASADA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("12","1","20","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("13","7","21","NEGRO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("14","1","16","CAMARONES","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("15","4","8","MI PADRE","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("16","5","14","PELUSA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("17","1","10","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("18","1","18","ARROZ CON VISTED","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("19","7","19","NEGRO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("20","1","22","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("21","1","23","PIZZA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("22","1","24","TACOS MEXICANOS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("23","1","9","PIZZA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("24","4","25","PAPA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("25","4","26","MIS PRIMAS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("26","1","27","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("27","1","29","CHULETA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("28","1","30","CHULETA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("29","1","28","ARROZ","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("30","7","31","NEGRO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("31","4","32","A MI MAMA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("32","2","6","BOB ESPONJA","","","","");



DROP TABLE IF EXISTS tbl_receta_medica;

CREATE TABLE `tbl_receta_medica` (
  `CODIGO_RECETA_MEDICA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONSULTA` int(11) DEFAULT NULL,
  `CODIGO_MEDICAMENTO` varchar(10) DEFAULT NULL,
  `INDICACIONES_RECETA` varchar(500) DEFAULT NULL,
  `OBSERVACIONES` varchar(500) DEFAULT NULL,
  `FECHA_RECETA` date DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  PRIMARY KEY (`CODIGO_RECETA_MEDICA`),
  KEY `FK_CODIGO_CONSULTA_MEDICA` (`CODIGO_CONSULTA`),
  KEY `FK_CODIGO_MEDICAMENTO` (`CODIGO_MEDICAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_receta_medica VALUES("1","1","0102","TOMAR DOS DIARIAS\n","NINGUNA","2022-07-26","ADMIN","2022-07-26","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("2","2","0102","TOMAR 1 CADA 8 HORAS","NINGUNA","2022-07-26","ADMIN","2022-07-26","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("3","4","0102","ES PARA LA TOS","O OTRA COSA","2022-07-26","ADMIN","2022-07-26","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("4","5","WJ785","TOMAR CADA 5 HORAS","NO COMER ANTES","2022-07-28","ADMIN","2022-07-28","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("5","6","WJ785","PARA LAS ALERGIAS","NINGUNA","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("6","7","WJ785","PARA LA ALERGIA","TOMAR CADA 4 HORAS","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("7","8","WJ785","PARA LA ALERGIA","NINGUNA","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("8","9","0102","MNMNMNMN,M","M,N,NM","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("9","10","0102","BNBNB","NNBNB","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("10","11","0102","TOMAR CAD 2HR","NINGUNA","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("11","12","0102","TOMAR CADA 8 HORAS ","SI SE PRESENTA MUY SEGUIDO LA FIEBRE TOMAR CADA  CUATROS HORAS","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("12","13","WJ785","TOMAR UNA AL DIA","NINGUNA","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("13","14","0102","CADA 8 HORAS","NINGUNA","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("14","15","0102","M,M,M,","M,M,M","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("15","16","0102","CADA 8H","NINGUNO","2022-08-02","ADMIN","2022-08-02","","0000-00-00");



DROP TABLE IF EXISTS tbl_roles;

CREATE TABLE `tbl_roles` (
  `CODIGO_TIPO_ROL` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_roles VALUES("1","ADMINISTRADOR","Todos los permisos","Administrador","2022-02-11","2022-04-07","ADMIN");
INSERT INTO tbl_roles VALUES("2","TUTOR","Usuario con permisos al modulo de escuela","Administrador","2022-02-11","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("3","INDEFINIDO","Rol no definido para el usuario","","0000-00-00","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("4","PSICOLOGO","Área de psicología","","0000-00-00","2022-04-07","ADMIN");
INSERT INTO tbl_roles VALUES("5","MEDICO","area medica","","2022-03-09","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("6","CATEQUISTA","Área espiritual","","2022-03-09","2022-05-05","ALBERT");
INSERT INTO tbl_roles VALUES("7","ENFERMERO","Area Medica","","2022-04-23","0000-00-00","");
INSERT INTO tbl_roles VALUES("8","ESTUDIANTE","El usuario solo permitirá ver las citas y tutorías que tiene este.  ","ADMIN","2022-05-03","0000-00-00","");
INSERT INTO tbl_roles VALUES("9","SUPER USUARIO","Este tipo de rol, solo sera asignado al usuario admin que es el único que tendrá cero limitaciones.","ADMIN","2022-05-03","0000-00-00","");



DROP TABLE IF EXISTS tbl_sacramento;

CREATE TABLE `tbl_sacramento` (
  `CODIGO_SACRAMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sacramento VALUES("1","BAUTISMO","PRIMER SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("2","PRIMERA COMUNION","SEGUNDO SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("3","CONFIRMA","TERCER SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("4","NINGUNO","No tiene ningún sacramento.");



DROP TABLE IF EXISTS tbl_sacramento_estudiante;

CREATE TABLE `tbl_sacramento_estudiante` (
  `CODIGO_CORRELATIVO` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTUDIANTE` int(10) DEFAULT NULL,
  `CODIGO_SACRAMENTO` int(10) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CORRELATIVO`),
  KEY `COD_EST_SACRA_FK` (`CODIGO_ESTUDIANTE`),
  KEY `COD_SACR_FK` (`CODIGO_SACRAMENTO`),
  CONSTRAINT `COD_EST_SACRA_FK` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `COD_SACR_FK` FOREIGN KEY (`CODIGO_SACRAMENTO`) REFERENCES `tbl_sacramento` (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_sacramento_estudiante VALUES("1","1","1");
INSERT INTO tbl_sacramento_estudiante VALUES("2","2","1");
INSERT INTO tbl_sacramento_estudiante VALUES("3","3","1");
INSERT INTO tbl_sacramento_estudiante VALUES("4","4","1");
INSERT INTO tbl_sacramento_estudiante VALUES("5","4","2");
INSERT INTO tbl_sacramento_estudiante VALUES("6","5","1");
INSERT INTO tbl_sacramento_estudiante VALUES("7","5","2");
INSERT INTO tbl_sacramento_estudiante VALUES("8","6","1");
INSERT INTO tbl_sacramento_estudiante VALUES("9","6","2");
INSERT INTO tbl_sacramento_estudiante VALUES("10","7","1");
INSERT INTO tbl_sacramento_estudiante VALUES("11","7","2");
INSERT INTO tbl_sacramento_estudiante VALUES("12","7","3");
INSERT INTO tbl_sacramento_estudiante VALUES("13","8","4");



DROP TABLE IF EXISTS tbl_seccion;

CREATE TABLE `tbl_seccion` (
  `CODIGO_SECCION` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SECCION`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_seccion VALUES("1","SECCION A","Es una seccion");
INSERT INTO tbl_seccion VALUES("2","SECCION B","Es una sección");
INSERT INTO tbl_seccion VALUES("3","SECCION  C","Es una sección");



DROP TABLE IF EXISTS tbl_sexo;

CREATE TABLE `tbl_sexo` (
  `CODIGO_SEXO` char(1) COLLATE utf8mb4_bin NOT NULL,
  `SEXO` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_SEXO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sexo VALUES("F","FEMENINO");
INSERT INTO tbl_sexo VALUES("M","MASCULINO");



DROP TABLE IF EXISTS tbl_sintomas_neuroticos;

CREATE TABLE `tbl_sintomas_neuroticos` (
  `CODIGO_SINTOMA_NEUROTICO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SINTOMA_NEUROTICO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sintomas_neuroticos VALUES("1","PESADILLAS");
INSERT INTO tbl_sintomas_neuroticos VALUES("2","CONVULSIONES");
INSERT INTO tbl_sintomas_neuroticos VALUES("3","NINGUNO");



DROP TABLE IF EXISTS tbl_telefono;

CREATE TABLE `tbl_telefono` (
  `NUMERO_TELEFONO` int(8) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  PRIMARY KEY (`NUMERO_TELEFONO`),
  KEY `Numero_perso` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_telefono VALUES("94894940","1");
INSERT INTO tbl_telefono VALUES("96265645","2");
INSERT INTO tbl_telefono VALUES("99999999","3");
INSERT INTO tbl_telefono VALUES("98456587","4");
INSERT INTO tbl_telefono VALUES("99841502","5");
INSERT INTO tbl_telefono VALUES("32995232","6");
INSERT INTO tbl_telefono VALUES("82478593","7");
INSERT INTO tbl_telefono VALUES("96333333","8");
INSERT INTO tbl_telefono VALUES("32423423","9");
INSERT INTO tbl_telefono VALUES("87842545","10");
INSERT INTO tbl_telefono VALUES("89865464","11");
INSERT INTO tbl_telefono VALUES("97361678","12");
INSERT INTO tbl_telefono VALUES("87753245","13");
INSERT INTO tbl_telefono VALUES("98945984","14");
INSERT INTO tbl_telefono VALUES("34234234","15");
INSERT INTO tbl_telefono VALUES("39693333","16");
INSERT INTO tbl_telefono VALUES("34543534","17");
INSERT INTO tbl_telefono VALUES("98031038","18");
INSERT INTO tbl_telefono VALUES("89124000","19");
INSERT INTO tbl_telefono VALUES("32502114","20");
INSERT INTO tbl_telefono VALUES("98522222","21");
INSERT INTO tbl_telefono VALUES("34324655","22");
INSERT INTO tbl_telefono VALUES("89100017","23");
INSERT INTO tbl_telefono VALUES("96954654","24");
INSERT INTO tbl_telefono VALUES("92394923","25");
INSERT INTO tbl_telefono VALUES("98878789","26");
INSERT INTO tbl_telefono VALUES("88885644","27");
INSERT INTO tbl_telefono VALUES("98987165","28");
INSERT INTO tbl_telefono VALUES("33211251","29");
INSERT INTO tbl_telefono VALUES("32569999","30");
INSERT INTO tbl_telefono VALUES("98343243","31");
INSERT INTO tbl_telefono VALUES("89727401","32");
INSERT INTO tbl_telefono VALUES("96125487","33");
INSERT INTO tbl_telefono VALUES("99804562","34");
INSERT INTO tbl_telefono VALUES("99001111","35");
INSERT INTO tbl_telefono VALUES("89902525","36");



DROP TABLE IF EXISTS tbl_tipo_persona;

CREATE TABLE `tbl_tipo_persona` (
  `CODIGO_TIPO_PERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tipo_persona VALUES("1","ADMINISTRADOR");
INSERT INTO tbl_tipo_persona VALUES("2","TUTOR");
INSERT INTO tbl_tipo_persona VALUES("3","NODEFINIDO");
INSERT INTO tbl_tipo_persona VALUES("4","ESTUDIANTE");
INSERT INTO tbl_tipo_persona VALUES("5","MEDICO");
INSERT INTO tbl_tipo_persona VALUES("6","PSICOLOGO");
INSERT INTO tbl_tipo_persona VALUES("7","FAMILIAR");
INSERT INTO tbl_tipo_persona VALUES("8","CATEQUISTA");
INSERT INTO tbl_tipo_persona VALUES("9","ENFERMERO");



DROP TABLE IF EXISTS tbl_tipo_sangre;

CREATE TABLE `tbl_tipo_sangre` (
  `CODIGO_TIPO_SANGRE` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_SANGRE`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_tipo_sangre_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tipo_sangre VALUES("8","TIPO D"," DANIEL","2022-07-17","2022-07-17","DANIEL","2");
INSERT INTO tbl_tipo_sangre VALUES("9","TIPO A"," DANIEL","2022-07-17","2022-07-17","DANIEL","2");
INSERT INTO tbl_tipo_sangre VALUES("10","TIPO B"," DANIEL","2022-07-17","2022-07-17","DANIEL","2");



DROP TABLE IF EXISTS tbl_tipo_socioeconomico;

CREATE TABLE `tbl_tipo_socioeconomico` (
  `CODIGO_TIPOSOCIO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPOSOCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tipo_socioeconomico VALUES("1","DISPOSITIVO ELECTRONICO","DISPOSITIVOS","ADMIN","2022-04-07","2022-06-21","ADMIN");
INSERT INTO tbl_tipo_socioeconomico VALUES("2","SERVICIOS DE INTERNET","SERVICIOS","","2022-04-07","2022-06-21","ADMIN");
INSERT INTO tbl_tipo_socioeconomico VALUES("3","PROVEEDOR DE INGRESO","PROVEEDOR","","2022-04-07","2022-06-21","ADMIN");
INSERT INTO tbl_tipo_socioeconomico VALUES("4","SERVICIOS BASICOS","SERVICIOS","","2022-04-07","2022-06-21","ADMIN");



DROP TABLE IF EXISTS tbl_transtornos_corporales;

CREATE TABLE `tbl_transtornos_corporales` (
  `CODIGO_TRANSTORNO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_TRANSTORNO`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_transtornos_corporales_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_transtornos_corporales VALUES("4","TRASTORNO COMPULSIVO","2");
INSERT INTO tbl_transtornos_corporales VALUES("5","DISMORFICO CORPORAL","2");



DROP TABLE IF EXISTS tbl_tutoria;

CREATE TABLE `tbl_tutoria` (
  `CODIGO_TUTORIA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_AREA` int(5) NOT NULL,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TUTORIA`),
  KEY `FK_CODATREA_TUTO` (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tutoria VALUES("1","1","ESPAÑOL","RUT","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("2","4","COMUNIÓN","LUZ","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("3","4","CONFIRMA","LUZ","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("4","1","MATEMATICAS","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("5","4","PERSEVERANCIA","LUZ","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("6","1","INGLES","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("7","1","CIENCIAS","CESAR","2022-07-27","2022-07-27","RUT");
INSERT INTO tbl_tutoria VALUES("8","1","BIOLOGÍA ","ADMIN","2022-08-03","","");
INSERT INTO tbl_tutoria VALUES("9","1","CIENCIAS AMBIENTALES ","ADMIN","2022-08-03","","");



DROP TABLE IF EXISTS tbl_usuario;

CREATE TABLE `tbl_usuario` (
  `CODIGO_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `NOMBRE_USUARIO` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CONTRASENA` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FECHA_VENCIMIENTO` date DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_USUARIO`),
  KEY `FK_CODPER_USU` (`CODIGO_PERSONA`),
  KEY `FK_CODROL_USU` (`CODIGO_TIPO_ROL`),
  KEY `FK_CODES_USU` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_usuario VALUES("1","1","ADMIN","2","9","$2a$07$usesomesillystringforeDLU0KLdU3tCNprit2LU2PhciUHQJFsG","2022-09-24","","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("2","2","RUT","2","1","$2a$07$usesomesillystringforeCFgULGhtYgEopegGdjbjYiHOQCeHz.S","","ADMIN","2022-07-26","2022-08-11","ALEXANDER");
INSERT INTO tbl_usuario VALUES("3","3","LUZ","2","1","$2a$07$usesomesillystringforeFz7dK1VZWNMEJiH0HNOXYw/HL.5hY4.","","ADMIN","2022-07-26","2022-08-11","ALEXANDER");
INSERT INTO tbl_usuario VALUES("4","4","JOSE","2","1","$2a$07$usesomesillystringforePP9wVrG7ur0QdkQ9rpSzfE/DlP4e8u.","","ADMIN","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("5","5","GABRIELA","2","1","$2a$07$usesomesillystringforek7hUNAdfzELkC2Xk6YPva7JCsoP6rh.","","ADMIN","2022-07-26","2022-07-29","ADMIN");
INSERT INTO tbl_usuario VALUES("6","6","ALEXANDER","2","1","$2a$07$usesomesillystringforeP7mXKbfh9ebyT3M.rcGnqD3gYHLx/pu","","ADMIN","2022-07-26","2022-08-13","ADMIN");
INSERT INTO tbl_usuario VALUES("7","7","CESAR","2","1","$2a$07$usesomesillystringforelk7hEP5l/8xGhqhzzpBD065n5bEXx2S","","ADMIN","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("8","8","JUAN","2","2","$2a$07$usesomesillystringfore24KuaN0qO9IVZ9tIXt3l5Gy/G5o.KWm","","LUZ","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("9","9","DAVID","2","8","$2a$07$usesomesillystringforeK2F0CA.OyIc/hzje/abe5/.lBawI8Ca","","CESAR","2022-07-27","2022-08-13","ADMIN");
INSERT INTO tbl_usuario VALUES("10","10","IKER","2","8","$2a$07$usesomesillystringforecHYBqgWfna9zyvdLydQv0EYK49B5C82","","ALEXANDER","2022-07-27","2022-07-26","ALEXANDER");
INSERT INTO tbl_usuario VALUES("11","11","DANIEL","2","5","$2a$07$usesomesillystringforePH8CXTpBjgw/NZeLeXQ6eBg2yFS9OE.","","JOSE","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("12","12","RAQUEL","2","4","$2a$07$usesomesillystringforeUBzOoe/fyqEveRzs1qiMcRg0TjegQPu","","RUT","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("13","13","YAMILETH","2","6","$2a$07$usesomesillystringfore/K7kHH0AKBo3XrR19eUxnbbahup7owe","","GABRIELA","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("14","16","MARGARITA","2","2","$2a$07$usesomesillystringforeVxRNnRV8j0V/Qv7SN5pK5Zs/4jXqeqa","","LUZ","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("15","17","RAMON","2","5","$2a$07$usesomesillystringforeFUN5v3JgHk8ENz9lcf.hrCfeYRowdmi","","ADMIN","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("16","18","FRANCISCO","2","6","$2a$07$usesomesillystringfore.OFApK0lnq2pWTrZBEzPs25tOi/peQO","","GABRIELA","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("17","19","JOSUE","2","4","$2a$07$usesomesillystringforeto0mvDpaV0DK4cFtWyWxnWiZ4qt7Z4.","","RUT","2022-07-26","2022-07-26","RUT");
INSERT INTO tbl_usuario VALUES("18","20","LAURA","2","6","$2a$07$usesomesillystringforeOe47YYBALHNylsq90yhjERGpHl.p9kG","","GABRIELA","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("19","21","MAJO","2","2","$2a$07$usesomesillystringforeVTuDZ.MUZx5QQxqolAMBpd2VqKlfrRa","","LUZ","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("20","22","PAULA","2","5","$2a$07$usesomesillystringforeUvuV8h0neq0uPPmQLgOJsjz2TeSbXeC","","ADMIN","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("21","23","MARIO","2","4","$2a$07$usesomesillystringforeC1qiwiZxWnmXgS0TeTaf41.2zC9eoJa","","RUT","2022-07-26","","");
INSERT INTO tbl_usuario VALUES("22","24","CRIS","2","8","$2a$07$usesomesillystringforemrCfnY4uA0DxWUm8xBIP17QxqXX.scS","","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_usuario VALUES("23","25","ANDREA","2","8","$2a$07$usesomesillystringforehRJWC.CF6mpqr2p1llRk3PxU/cZ65DS","","CESAR","2022-07-27","","");
INSERT INTO tbl_usuario VALUES("24","27","KATY","2","8","$2a$07$usesomesillystringforeHgs1s2uw38U9bfe/nzsY9NxbYN5tPiC","","RUT","2022-07-27","2022-07-28","ADMIN");
INSERT INTO tbl_usuario VALUES("25","29","DESIRETH","2","8","$2a$07$usesomesillystringforeBNDqae843YwiG.YpUXHq9I4KSLbDAQ6","","GABRIELA","2022-07-27","2022-07-26","GABRIELA");
INSERT INTO tbl_usuario VALUES("26","30","NAOMI","2","8","$2a$07$usesomesillystringfore6EINqszN38WG50TBh9xqXuz82S4gTBK","","LUZ","2022-07-27","","");
INSERT INTO tbl_usuario VALUES("27","31","ERICK","1","8","$2a$07$usesomesillystringforeP5wUikw4pkTxWim7XoEvmNeS8uKtbjS","","ADMIN","2022-07-27","2022-08-13","ADMIN");
INSERT INTO tbl_usuario VALUES("28","32","ANYH","2","6","$2a$07$usesomesillystringforef3K3SHJ3KU57GQVdI9QQ7CPsELwicyS","","ADMIN","2022-07-29","","");
INSERT INTO tbl_usuario VALUES("29","33","ISEL","2","4","$2a$07$usesomesillystringforebrDq7a11hNalS8A/Qc005lZHvD30Wd6","","ADMIN","2022-07-29","2022-08-12","ALEXANDER");
INSERT INTO tbl_usuario VALUES("30","34","ARMANDO","2","4","$2a$07$usesomesillystringforeIWLQb30CQ.VUYtobQCyzQFYDZlzPjV6","","GABRIELA","2022-07-29","2022-08-11","ALEXANDER");
INSERT INTO tbl_usuario VALUES("31","35","LUISMI","2","2","$2a$07$usesomesillystringforeo.Za9sjz40Tnh798TxidWyZRTQ.mtoC","","LUZ","2022-08-02","","");
INSERT INTO tbl_usuario VALUES("32","36","VALERIA","2","2","$2a$07$usesomesillystringforeXAQheGJF7USzYzdQgtA7gv6RllsR2Va","","ADMIN","2022-08-02","","");



SET FOREIGN_KEY_CHECKS=1;