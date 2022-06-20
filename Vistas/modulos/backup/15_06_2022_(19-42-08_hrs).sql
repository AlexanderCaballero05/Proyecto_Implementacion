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
  PRIMARY KEY (`CODIGO_ALERGIAS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_alergias VALUES("1","ALERGIA AL AGUA","ALERGIA EXTRAÑA","EMILIO","2022-04-19","","0000-00-00");
INSERT INTO tbl_alergias VALUES("2","ALERGIA AL POLVO","REACCION ALERGICA AL POLVO","EMILIO","2022-04-19","","0000-00-00");
INSERT INTO tbl_alergias VALUES("3","NINGUNA","NO HAY, NO EXISTE","EMILIO","2022-04-19","","0000-00-00");



DROP TABLE IF EXISTS tbl_apariencia_fisica;

CREATE TABLE `tbl_apariencia_fisica` (
  `CODIGO_APARIENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_APARIENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_apariencia_fisica VALUES("1","EDEMA HINCHAZON");
INSERT INTO tbl_apariencia_fisica VALUES("2","ICTERICIA");
INSERT INTO tbl_apariencia_fisica VALUES("3","PALIDEZ");



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
INSERT INTO tbl_area VALUES("6","ODONTOLOGICA","ODONTOLOGIA GENERAL ","","2022-04-26","","");



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
  KEY `FK_COD_OBJ_BIT` (`CODIGO_OBJETO`),
  CONSTRAINT `FK_COD_OBJ_BIT` FOREIGN KEY (`CODIGO_OBJETO`) REFERENCES `tbl_objetos` (`CODIGO_OBJETO`),
  CONSTRAINT `FK_COD_USU_BIT` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_bitacora_sistema VALUES("1","1","1","2022-06-05","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("2","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("3","1","13","2022-06-05","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("4","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("5","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("6","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("7","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("8","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("9","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("10","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("11","1","1","2022-06-05","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("12","2","1","2022-06-05","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("13","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("14","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("15","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("16","2","1","2022-06-05","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("17","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("18","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("19","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("20","2","20","2022-06-05","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("21","2","20","2022-06-05","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("22","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("23","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("24","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("25","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("26","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("27","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("28","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("29","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("30","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("31","2","13","2022-06-05","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("32","2","1","2022-06-05","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("33","2","1","2022-06-05","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("34","2","1","2022-06-05","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("35","2","1","2022-06-05","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("36","2","1","2022-06-05","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("37","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("38","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("39","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("40","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("41","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("42","1","40","2022-06-11","Modificacion","Se edito una especialidad ");
INSERT INTO tbl_bitacora_sistema VALUES("43","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("44","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("45","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("46","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("47","1","19","2022-06-11","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("48","1","12","2022-06-11","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("49","1","1","2022-06-14","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("51","1","48","2022-06-14","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("52","1","32","2022-06-14","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("53","1","25","2022-06-14","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("54","1","14","2022-06-14","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("55","1","25","2022-06-14","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("56","1","14","2022-06-14","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("57","1","13","2022-06-14","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("58","1","13","2022-06-14","INSERCIÓN","SE REGISTRO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("59","1","25","2022-06-14","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("60","1","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("62","1","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("63","1","47","2022-06-14","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("64","1","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("65","1","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("66","1","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("67","1","48","2022-06-14","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("68","1","25","2022-06-14","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("69","1","13","2022-06-14","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("70","1","13","2022-06-14","INSERCIÓN","SE REGISTRO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("71","1","25","2022-06-14","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("72","1","48","2022-06-14","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("73","1","32","2022-06-14","INGRESO AL MATENIMIENTO CITAS HOY ","MANTENIMIENTO A LAS CITAS DEL DIA DE HOY");
INSERT INTO tbl_bitacora_sistema VALUES("74","1","32","2022-06-14","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("76","1","32","2022-06-14","INGRESO AL MATENIMIENTO CITAS HOY ","MANTENIMIENTO A LAS CITAS DEL DIA DE HOY");
INSERT INTO tbl_bitacora_sistema VALUES("77","1","32","2022-06-14","INGRESO AL MATENIMIENTO CITAS HOY ","MANTENIMIENTO A LAS CITAS DEL DIA DE HOY");
INSERT INTO tbl_bitacora_sistema VALUES("78","1","48","2022-06-14","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("79","1","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("81","10","1","2022-06-14","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("82","10","1","2022-06-14","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("84","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("85","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("86","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("87","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("88","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("89","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("90","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("91","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("92","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("93","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("94","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("95","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("96","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("97","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("98","10","32","2022-06-14","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");



DROP TABLE IF EXISTS tbl_carga_academica;

CREATE TABLE `tbl_carga_academica` (
  `CODIGO_CARGA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_TUTORIA` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_MODALIDAD` int(5) DEFAULT NULL,
  `CODIGO_SECCION` int(5) DEFAULT NULL,
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
  CONSTRAINT `FK_CODSEC_CARG` FOREIGN KEY (`CODIGO_SECCION`) REFERENCES `tbl_seccion` (`CODIGO_SECCION`),
  CONSTRAINT `PK_COD_MOD` FOREIGN KEY (`CODIGO_MODALIDAD`) REFERENCES `tbl_modalidad` (`CODIGO_MODALIDA`),
  CONSTRAINT `PK_COD_PE` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `PK_COD_TUTO` FOREIGN KEY (`CODIGO_TUTORIA`) REFERENCES `tbl_tutoria` (`CODIGO_TUTORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_consulta_espiritual;

CREATE TABLE `tbl_consulta_espiritual` (
  `CODIGO_CONSULTA_ESPIRITUAL` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(10) DEFAULT NULL,
  `MOTIVO_CONSULTA` longtext DEFAULT NULL,
  `OBSERVACIONES` longtext DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONSULTA_ESPIRITUAL`),
  KEY `COD_CITA_ESPI_FK` (`CODIGO_CITA`),
  CONSTRAINT `COD_CITA_ESPI_FK` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




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
  KEY `FK_COD_CIT` (`CODIGO_CITA`),
  CONSTRAINT `FK_COD_CIT` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`),
  CONSTRAINT `FK_COD_PREC` FOREIGN KEY (`CODIGO_PRECLINICA`) REFERENCES `tbl_preclinica` (`CODIGO_PRECLINICA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_contenido_socioeconomico;

CREATE TABLE `tbl_contenido_socioeconomico` (
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_TIPOSOCIO` int(5) NOT NULL,
  `NOMBRE_TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_TIPOSOCIO` (`CODIGO_TIPOSOCIO`),
  CONSTRAINT `FK_COD_TIPOSOCIO` FOREIGN KEY (`CODIGO_TIPOSOCIO`) REFERENCES `tbl_tipo_socioeconomico` (`CODIGO_TIPOSOCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_contenido_socioeconomico VALUES("1","1","COMPUTADORA");
INSERT INTO tbl_contenido_socioeconomico VALUES("2","1","CELULAR");
INSERT INTO tbl_contenido_socioeconomico VALUES("3","1","TABLET");
INSERT INTO tbl_contenido_socioeconomico VALUES("4","2","INTERNET RESIDENCIAL");
INSERT INTO tbl_contenido_socioeconomico VALUES("5","2","DATOS MOVILES");
INSERT INTO tbl_contenido_socioeconomico VALUES("6","2","AMBOS");
INSERT INTO tbl_contenido_socioeconomico VALUES("7","3","PADRE");
INSERT INTO tbl_contenido_socioeconomico VALUES("8","3","MADRE");
INSERT INTO tbl_contenido_socioeconomico VALUES("9","3","AMBOS");
INSERT INTO tbl_contenido_socioeconomico VALUES("10","3","REMESAS");
INSERT INTO tbl_contenido_socioeconomico VALUES("11","4","ENERGÍA ELÉCTRICA");
INSERT INTO tbl_contenido_socioeconomico VALUES("12","4","AGUA POTABLE");
INSERT INTO tbl_contenido_socioeconomico VALUES("13","4","ALCANTARILLADO");
INSERT INTO tbl_contenido_socioeconomico VALUES("14","2","NINGUNO");



DROP TABLE IF EXISTS tbl_correo_electronico;

CREATE TABLE `tbl_correo_electronico` (
  `CORREO_PERSONA` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  PRIMARY KEY (`CORREO_PERSONA`),
  KEY `FK_CORREO` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_CORREO` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_correo_electronico VALUES("proyecto_prosecar@hotmail.com","1");
INSERT INTO tbl_correo_electronico VALUES("arnold95caballero@gmail.com","2");
INSERT INTO tbl_correo_electronico VALUES("martahabla@unah.hn","11");
INSERT INTO tbl_correo_electronico VALUES("roberta@unah.hn","12");



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
  KEY `TBL_ESP_FK` (`CODIGO_AREA`),
  CONSTRAINT `TBL_ESP_FK` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `tbl_area` (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_especialidad VALUES("1","MEDICINA GENERAL ","2","ATIENDE DE TODO ","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("2","TERAPIA GENERAL","3","ATIENDE DE TODO TIPO DE LOCOS","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("3","CATEQUESIS JUVENIL","4","CHARLAS CON JOVENES","","0000-00-00","","");
INSERT INTO tbl_especialidad VALUES("6","","2","SSD","","0000-00-00","","");



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
  `GRADO_ACTUAL` int(5) DEFAULT NULL,
  `REPITENTE` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `INDICE_ACADEMICO` int(5) DEFAULT NULL,
  `MATE_BAJO_RENDI` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `PASATIEMPOS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DISTRACTORES_ESCOLARES` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `METAS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_EST` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_COD_EST` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_estudiante_socioeconomico;

CREATE TABLE `tbl_estudiante_socioeconomico` (
  `CODIGO_ESTUDIANTE_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) NOT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE_SOCIOECONOMICO`),
  KEY `FK_CONTSOCIO` (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_CON_ES` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `FK_COD_CON_ES` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `FK_CONTSOCIO` FOREIGN KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`) REFERENCES `tbl_contenido_socioeconomico` (`CODIGO_CONTENIDO_SOCIOECONOMICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_examenes_medicos;

CREATE TABLE `tbl_examenes_medicos` (
  `CODIGO_EXAMEN_MEDICO` int(11) NOT NULL AUTO_INCREMENT,
  `EXAMEN_MEDICO` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_MEDICO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_examenes_medicos VALUES("1","HEMOGRAMA","EXAMEN DE SANGRE","","0000-00-00","0000-00-00","");
INSERT INTO tbl_examenes_medicos VALUES("2","URALISIS","","EMILIO","2022-04-20","0000-00-00","");
INSERT INTO tbl_examenes_medicos VALUES("3","PRUEBA PCR","","EMILIO","2022-04-20","0000-00-00","");



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
  KEY `COD_EST_EXPE` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EST_EXPE` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EXP_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_COD_TIPO_SANGRE` FOREIGN KEY (`CODIGO_TIPO_SANGRE`) REFERENCES `tbl_tipo_sangre` (`CODIGO_TIPO_SANGRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
  KEY `FK_CODIGO_CITA_CONSULTA` (`CODIGO_CITA`),
  CONSTRAINT `FK_CODIGO_CITA_CONSULTA` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
  KEY `COD_ESTA_EXPE` (`CODIGO_ESTADO`) USING BTREE,
  CONSTRAINT `COD_ESTA_EXPEUN` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EXPSI_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_familiar;

CREATE TABLE `tbl_familiar` (
  `CODIGO_FAMILIAR` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `ESTADO_CIVIL` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `NIVEL_EDUCATIVO` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `INGRESOS_DE_FAMILIAR` int(6) DEFAULT NULL,
  `NOMBRE_IGLESIA` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FAMILIAR`),
  KEY `FAM_PK` (`CODIGO_PERSONA`),
  CONSTRAINT `FAM_PK` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_familiares_estudiante;

CREATE TABLE `tbl_familiares_estudiante` (
  `CODIGO_FAMILIAR_ESTUDIANTE` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_FAMILIAR` int(5) DEFAULT NULL,
  `CODIGO_PARENTESCO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FAMILIAR_ESTUDIANTE`),
  KEY `COD_ESTU_PARE` (`CODIGO_ESTUDIANTE`),
  KEY `COD_FAM_PARE` (`CODIGO_FAMILIAR`),
  KEY `COD_PARA_PARE` (`CODIGO_PARENTESCO`),
  CONSTRAINT `COD_ESTU_PARE` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `COD_FAM_PARE` FOREIGN KEY (`CODIGO_FAMILIAR`) REFERENCES `tbl_familiar` (`CODIGO_FAMILIAR`),
  CONSTRAINT `COD_PARA_PARE` FOREIGN KEY (`CODIGO_PARENTESCO`) REFERENCES `tbl_parentesco` (`CODIGO_PARENTESCO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




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
  KEY `COD_AREA_FK` (`AREA_CITA`),
  CONSTRAINT `COD_AREA_FK` FOREIGN KEY (`AREA_CITA`) REFERENCES `tbl_area` (`CODIGO_AREA`),
  CONSTRAINT `COD_ESTA_FK` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODIGO_ESPECIALISTA` FOREIGN KEY (`CODIGO_ESPECIALISTA`) REFERENCES `tbl_persona_especialidad` (`CODIGO_PERSONA_ESPECIALIDAD`),
  CONSTRAINT `FK_CODIGO_PERSONAS` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_inscripcion_cita VALUES("3","12","1","11","3","2022-06-14","13:00:00","2022-06-15","0000-00-00","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_matricula_academica VALUES("1","1","1","13","2022-05-25","  muy bien","2022-05-25","ROBERTO","2022-05-25","","");
INSERT INTO tbl_matricula_academica VALUES("2","2","1","13","2022-05-25","muy bien  ","2022-05-25","ROBERTO","2022-05-25","","");



DROP TABLE IF EXISTS tbl_medicamento;

CREATE TABLE `tbl_medicamento` (
  `CODIGO_MEDICAMENTO` varchar(10) NOT NULL,
  `NOMBRE_MEDICAMENTO` varchar(50) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MEDICAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_medicamento VALUES("A1","TOSAN","PARA LA TOS","EMILIO","2022-04-20","","0000-00-00");
INSERT INTO tbl_medicamento VALUES("A2","VITAMINA D","VITAMINAS","EMILIO","2022-04-20","","0000-00-00");
INSERT INTO tbl_medicamento VALUES("A4","VITAMINA C","VITAMINAS","EMILIO","2022-04-20","","0000-00-00");



DROP TABLE IF EXISTS tbl_modalidad;

CREATE TABLE `tbl_modalidad` (
  `CODIGO_MODALIDA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MODALIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_modalidad VALUES("1","PRESENCIAL","Clases en la parroquia");
INSERT INTO tbl_modalidad VALUES("2","VIRTUAL","No tiene que ir ");



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
  KEY `FK_COD_USU_HISCON` (`CODIGO_USUARIO`),
  CONSTRAINT `FK_COD_USU_HISCON` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_ms_hist_contrasena VALUES("1","10","$2a$07$usesomesillystringforepCRNlzAkcyyd4Bfx0fASQhKxxibp2PG","10","0000-00-00","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_objetos VALUES("1","ESTADO","SISTEMA DE ADMINISTRACION. ","Administrador","2022-02-09","2022-05-03","ADMIN");
INSERT INTO tbl_objetos VALUES("2","ROLES","OBJETO DONDE SE REGISTRAN PERSONAS   ","Administrador","2022-02-06","2022-05-03","ADMIN");
INSERT INTO tbl_objetos VALUES("3","PARAMETROS"," OBJETO MANTENIMIENTO PARAMETROS","Administrador","2022-03-04","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("4","PREGUNTAS","OBJETO MANTENIMIENTO PREGUNTAS  ","ADMIN","2022-03-04","2022-05-03","ADMIN");
INSERT INTO tbl_objetos VALUES("5","PERMISOS","OBJETO MANTENIMIENTO PERMISOS  ","ADMIN","2022-03-04","2022-05-03","ADMIN");
INSERT INTO tbl_objetos VALUES("6","OBJETOS","OBJETO MANTENIMIENTO OBJETOS","ADMIN","2022-03-04","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("7","BITACORA","OBJETO CONSULTA BITACORA","ADMIN","2022-03-04","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("8","PREGUNTAS_USUARIOS","OBJETO CONSULTA PREGUNTAS USUARIOS.","ADMIN","2022-03-04","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("9","PARAMETROS_USUARIOS","OBJETO MANTENIMIENTO PARAMETROS USUARIOS  ","","0000-00-00","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("10","BACKUP ","OBJETO MANTENIMIENTO BACKUP  ","ADMIN","2022-03-04","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("11","RESTAURACION","Objeto mantenimiento restauracion","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("12","TIPO_PERSONAS","Mantenimiento de la tabla tipo de personas.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("13","REGISTRAR_PERSONAS","Objeto registra una persona.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("14","EDITAR_USARIOS","Objeto mantenimiento usuarios.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("15","EDITAR_PERSONAS","Objeto mantenimiento personas.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("16","ESTUDIANTES","Objeto mantenimiento estudiantes.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("17","TIPO_SOCIOECONOMICO","Objeto mantenimiento tipo socioeconomico.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("18","CONTENIDO_SOCIOECONOMICO","Objeto mantenimiento contenido socioeconomico.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("19","MODALIDAD","Objeto mantenimiento modalidad","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("20","CARGA_ACADEMICA","Objeto mantenimiento carga académica.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("21","AREA","Objeto mantenimiento de área.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("22","TUTORIA","Objeto mantenimiento de tutoria.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("23","MATRICULA","Objeto mantenimiento matricula.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("24","CALIFICACIONES","Objeto mantenimiento calificaciones","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("25","GESTION_PERSONAS","Gestion complete de personas.","","0000-00-00","0000-00-00","");
INSERT INTO tbl_objetos VALUES("26","GESTION_ESTUDIANTES","OBJETO DE GESTION DE LOS ESTUDIANTES","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("27","GESTION_SEGURIDAD","GESTION DE SEGURIDAD","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("28","GESTION_CARGA_ACADEMICA","OBJETO DE GESTION DE LA CARGA ACADEMICA","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("29","GESTION_MATRICULA","OBJETO DE GESTION DE LAS MATRICULAS DE LOS ALUMNOS","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("30","GESTION_AREA_MEDICA","OBJETO DE GESTION DE LAS CITAS MEDICAS","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("31","GESTION_AREA_PSICOLOGIA","OBJETO DEL AREA PSICOLOGICA","ADMIN","2022-03-18","0000-00-00","");
INSERT INTO tbl_objetos VALUES("32","GESTION_DE_CITAS","DED","","2022-03-27","0000-00-00","");
INSERT INTO tbl_objetos VALUES("33","GESTIONFAMILIARES","PERMISOS PARA INSERTAR DATOS SOCIECONOMICOS FAMILIARES","","2022-03-31","0000-00-00","");
INSERT INTO tbl_objetos VALUES("34","RECETAMEDICA","CRUD Y PROCESO","","2022-04-07","0000-00-00","");
INSERT INTO tbl_objetos VALUES("35","MEDICAMENTOS","PERMISO MEDICAMENTOS","","2022-04-07","0000-00-00","");
INSERT INTO tbl_objetos VALUES("36","TRANSTORNOS","PERMISO PARA EL MANTENIMIENTO","","2022-04-07","0000-00-00","");
INSERT INTO tbl_objetos VALUES("37","TIPOSANGRE","MANTENIMIENTO TIPO SANGRE","","2022-04-08","0000-00-00","");
INSERT INTO tbl_objetos VALUES("38","GESTION_TUTOR ACADEMICO","AREA DEL TUTOR ACADEMICO  ","","2022-04-21","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("39","ALERGIAS","OBJETO MANTENIMIENTO ALEGIAS","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("40","APARIENCIA FISICA","OBJETO MANTENIMIENTO APARIENCIA","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("41","ESPECIALIDADES","OBJETO MANTENIMIENTO ESPECIALIDADES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("42","EXAMENES MEDICOS","OBJETO MANTENIMIENTO EXAMENES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("43","FAMILIARES","OBETO MANTENIMIENTO FAMILIARES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("44","PARENTESCO","OBJETO MANTENIMIENTO PARANTESCO","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("45","SACRAMENTO","OBJETO MANTENIMIENTO SACRAMENTOS","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("46","SECCION ","OBJETO MANTENIMIENTO SECCIONES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("47","SINTOMAS NEUROTICOS","OBJETO MANTENIMIENTO SINTOMAS NEUROTICOS","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("48","CITAS GENERALES","OBJETO CITAS GENERALES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("49","GESTION PRECLINICA","OBJETO DE GESTION PRECLINICA","","2022-04-24","0000-00-00","");
INSERT INTO tbl_objetos VALUES("50","PRECLINICA","OBJETO PARA VER PRECLINICA POR PARTE DE LOS MEDICOS","","2022-04-24","0000-00-00","");
INSERT INTO tbl_objetos VALUES("51","GESTION DE ESTUDIANTE","VER LO ASIGNADO A EL ESTUDIANTE.","ADMIN","2022-05-03","","");
INSERT INTO tbl_objetos VALUES("52","GESTION TUTOR ESPIRITUAL","AREA DEL TUTOR ESPIRITUAL","ALBERT","2022-05-06","","");
INSERT INTO tbl_objetos VALUES("53","CALIFICACIONES ESPIRITUALES","OBJETO QUE PERMITE CALIFICAR LAS TUTORIAS ESPIRITUALES","ADMIN","2022-05-20","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros VALUES("1","NUM_INTEN_VALIDOS","3","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("2","NUM_MAX_PREGUNTAS","1","Administrador","2022-02-07","2022-04-26","");
INSERT INTO tbl_parametros VALUES("3","NUM_MAX_CONTRASENAS","8","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("4","NUM_MAX_CARACTER","15","Administrador","2022-02-07","2022-04-07","ADMIN");
INSERT INTO tbl_parametros VALUES("5","ADMIN_SERVIDOR_CORREO","smtp.gmail.com","","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("6","ADMIN_CPASSWORD","Prosecar123*","Administrador","2022-02-23","0000-00-00","");
INSERT INTO tbl_parametros VALUES("7","ADMIN_CUSUARIO","prosecarinstancia@gmail.com","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("8","ADMIN_CPUERTO","587","ADMIN","2022-03-07","0000-00-00","");
INSERT INTO tbl_parametros VALUES("10","NOMBRE_EMPRESA","PROYECTO SEMILLERO CARMELITANO PROSECAR\n","ADMIN","2022-03-22","0000-00-00","");
INSERT INTO tbl_parametros VALUES("11","FECHAINICIAL","Y-m-d","ADMIN","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("12","HORA_INICIO_ATENCIONCITA","09:00","ADMIN","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("13","HORA_FINAL_ATENCIONCITA","18:00","ADMIN","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("14","HORA_INICIO_CARGAACADEMICA","09:00","ADMIN","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("15","HORA_FINAL_CARGAACADEMICA","18:00","ADMIN","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("16","NUM_MIN_CARACTER","5","Administrador","2022-05-26","","");
INSERT INTO tbl_parametros VALUES("17","MAX_USUARIO","15","Administrador","2022-05-26","","");
INSERT INTO tbl_parametros VALUES("18","MIN_USUARIO","3","Administrador","2022-05-26","","");
INSERT INTO tbl_parametros VALUES("19","NUM_INTENTOS_PREGUNTAS","2","Administrador","2022-05-31","","");
INSERT INTO tbl_parametros VALUES("20","MIN_RESPUESTA_PREGUNTAS","4","","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("21","MAX_RESPUESTA_PREGUNTAS","50","","0000-00-00","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros_usuarios VALUES("1","1","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("2","2","1","2","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("3","2","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("4","2","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("29","10","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("30","10","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("31","10","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("32","10","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("33","11","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("34","11","2","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("35","11","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("36","11","19","0","","0000-00-00","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_permisos VALUES("1","1","1","SI","SI","SI","SI","Administrador","2022-03-02","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("3","2","24","SI","SI","SI","SI","Administrador","2022-03-02","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("4","4","1","NO","NO","NO","NO","","0000-00-00","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("5","3","1","SI","SI","SI","SI","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("6","1","2","SI","SI","SI","SI","ADMIN","2022-03-04","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("7","1","19","SI","SI","SI","SI","ADMIN","2022-03-04","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("8","1","5","SI","SI","SI","SI","ADMIN","2022-03-05","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("9","1","8","SI","NO","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("10","1","10","SI","SI","SI","SI","ADMIN","2022-03-05","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("11","1","12","SI","SI","SI","SI","ADMIN","2022-03-05","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("12","1","15","SI","SI","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("13","1","3","SI","SI","SI","SI","ADMIN","2022-03-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("14","1","4","SI","SI","SI","SI","ADMIN","2022-03-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("15","2","38","SI","SI","SI","SI","ADMIN","2022-03-08","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("17","1","25","SI","SI","SI","SI","","0000-00-00","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("18","1","26","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("19","1","27","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("20","2","28","NO","NO","NO","NO","ADMIN","2022-03-10","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("21","2","29","NO","NO","NO","NO","ADMIN","2022-03-10","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("22","1","9","SI","SI","SI","SI","ADMIN","2022-03-10","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("23","1","7","SI","SI","SI","SI","ADMIN","2022-03-12","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("24","5","30","SI","SI","SI","SI","ADMIN","2022-03-14","","0000-00-00");
INSERT INTO tbl_permisos VALUES("25","4","31","SI","SI","SI","SI","ADMIN","2022-03-18","","0000-00-00");
INSERT INTO tbl_permisos VALUES("26","1","32","SI","SI","SI","SI","","2022-03-27","","0000-00-00");
INSERT INTO tbl_permisos VALUES("27","1","22","SI","SI","SI","SI","","2022-04-03","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("29","5","34","SI","SI","SI","SI","ADMIN","2022-04-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("31","5","35","SI","SI","SI","SI","ADMIN","2022-04-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("32","1","28","SI","SI","SI","SI","LUISILLO","2022-04-07","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("33","1","29","SI","SI","SI","SI","LUISILLO","2022-04-07","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("34","5","36","SI","SI","SI","SI","LUISILLO","2022-04-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("35","5","37","SI","SI","SI","SI","ADMIN","2022-04-08","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("36","5","32","NO","NO","NO","NO","","2022-04-14","ADMIN","2022-04-14");
INSERT INTO tbl_permisos VALUES("37","1","33","SI","SI","SI","SI","","2022-04-14","ARNOLDIÑO","2022-04-20");
INSERT INTO tbl_permisos VALUES("38","1","21","SI","SI","SI","SI","","2022-04-23","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("39","5","39","SI","SI","SI","SI","","2022-04-23","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("40","5","40","SI","SI","SI","SI","","2022-04-23","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("41","1","20","SI","SI","SI","SI","","2022-04-23","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("42","1","48","SI","SI","SI","SI","","2022-04-23","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("43","1","23","SI","SI","SI","SI","","2022-04-24","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("44","1","16","SI","SI","SI","SI","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("45","1","43","SI","SI","SI","SI","","2022-04-24","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("46","1","6","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("47","1","45","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("48","1","18","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("49","1","17","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("50","1","46","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("51","1","41","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("52","5","42","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("53","7","49","SI","SI","SI","SI","","2022-04-24","","0000-00-00");
INSERT INTO tbl_permisos VALUES("54","5","50","SI","SI","SI","SI","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("55","1","14","SI","NO","SI","SI","","2022-04-26","","0000-00-00");
INSERT INTO tbl_permisos VALUES("56","9","27","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("57","9","5","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("58","9","20","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("59","9","28","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("60","9","13","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("61","9","15","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("62","9","25","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("63","9","26","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("64","9","29","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("65","9","23","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("66","9","6","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("67","9","30","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("68","9","32","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("69","9","31","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("70","9","33","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("71","9","10","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("72","9","7","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("73","9","38","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("74","9","52","SI","SI","SI","SI","","2022-05-06","","0000-00-00");
INSERT INTO tbl_permisos VALUES("75","6","52","SI","SI","SI","SI","","2022-05-06","","0000-00-00");
INSERT INTO tbl_permisos VALUES("76","9","9","SI","SI","SI","SI","","2022-05-21","","0000-00-00");
INSERT INTO tbl_permisos VALUES("77","9","14","SI","SI","SI","SI","","2022-05-21","","0000-00-00");
INSERT INTO tbl_permisos VALUES("78","9","46","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("79","9","45","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("80","6","53","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("81","8","16","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("82","8","51","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("83","1","44","SI","SI","SI","SI","","2022-06-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("84","9","12","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("85","9","41","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("86","9","16","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("87","9","43","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("88","9","17","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("89","9","18","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("90","9","44","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("91","9","48","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("92","9","22","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("93","9","19","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("94","9","2","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("95","9","4","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("96","9","1","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("97","9","3","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("98","9","21","SI","SI","SI","SI","","2022-06-05","","0000-00-00");



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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona VALUES("1","ADMIN","ADMIN","ADMIN","ADMIN","0801200017878","M","2010-12-01","TEGUCIGALPA","COL TEGUCIGALPA","2022-05-25","","3","","2022-05-25","","");
INSERT INTO tbl_persona VALUES("2","ROBERTO","PEDRO","GARCIA","FUENTES","080119801487497","M","1995-08-05","TEGUCIGALPA","LA LAGUNA","2022-05-25","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("11","MARTA","FLORINDA","INEZTROSA","SOASA","0321212121212","F","1978-06-02","POR AHI","POR AHI","2022-06-14","","6","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("12","ROBERTA","ANDREA","PERALTA","VALLE","0812321212454","F","2000-06-03","POR AHI","POR AHI ","2022-06-14","","4","ADMIN","0000-00-00","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona_especialidad VALUES("1","11","2","ADMIN","2022-06-14","","");



DROP TABLE IF EXISTS tbl_personas_alergias;

CREATE TABLE `tbl_personas_alergias` (
  `CODIGO_PERSONA_ALERGIAS` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ALERGIAS` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_ALERGIAS`),
  KEY `cod_expe_fk` (`CODIGO_EXPEDIENTE_PERSONA`),
  KEY `cod_aler_fk` (`CODIGO_ALERGIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_personas_apariencia;

CREATE TABLE `tbl_personas_apariencia` (
  `CODIGO_PERSONAS_APARIENCIA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_APARIENCIA` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_APARIENCIA`),
  KEY `CODI_PER_APARI` (`CODIGO_APARIENCIA`),
  KEY `CODI_PER_EXPE_APA` (`CODIGO_EXPEDIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_personas_sintomas;

CREATE TABLE `tbl_personas_sintomas` (
  `CODIGO_PERSONA_SINTOMA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_SINTOMA_NEUROTICO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_SINTOMA`),
  KEY `COD_EXP_PPSICO` (`CODIGO_EXPEDIENTE`),
  KEY `COD_SINT_PP` (`CODIGO_SINTOMA_NEUROTICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_personas_transtornos;

CREATE TABLE `tbl_personas_transtornos` (
  `CODIGO_PERSONAS_TRANSTORNOS` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_TRANSTORNO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_TRANSTORNOS`),
  KEY `CODI_PER_EXPE` (`CODIGO_EXPEDIENTE`),
  KEY `CODI_PER_TRANST` (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_preguntas;

CREATE TABLE `tbl_preguntas` (
  `CODIGO_PREGUNTAS` int(11) NOT NULL AUTO_INCREMENT,
  `PREGUNTA` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PREGUNTAS`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preguntas VALUES("1","¿Cual es tu comida favorita?","Administrador","2022-02-06","ADMIN","2022-04-12");
INSERT INTO tbl_preguntas VALUES("2","¿Nombre de tu caricatura favorita de la infancia?","Administrador","2022-02-06","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("3","¿Nombre de tu pelicula favorita de la infancia?","Administrador","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("4","¿Pariente que mas admira?","Administrador","2022-02-02","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("5","¿Nombre de mascota favorito?","Administrador","2022-02-01","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("6","¿Un jugador de futbol favorito? "," ","2022-04-26","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preguntas_usuarios VALUES("1","1","2","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("2","1","10","POLLO","","","","");



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




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
INSERT INTO tbl_roles VALUES("8","ESTUDIANTE","El usuario solo permitirá ver las citas y tutorías que tiene este.  ","ADMIN","2022-05-03","","");
INSERT INTO tbl_roles VALUES("9","SUPER USUARIO","Este tipo de rol, solo sera asignado al usuario admin que es el único que tendrá cero limitaciones.","ADMIN","2022-05-03","","");



DROP TABLE IF EXISTS tbl_sacramento;

CREATE TABLE `tbl_sacramento` (
  `CODIGO_SACRAMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sacramento VALUES("1","BAUTISMO","PRIMER SACRAMENTO\n");
INSERT INTO tbl_sacramento VALUES("2","PRIMERA COMUNION","SEGUNDO SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("3","CONFIRMA","TERCER SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("4","NINGUNO","No tiene ningún sacramento.");



DROP TABLE IF EXISTS tbl_sacramento_persona;

CREATE TABLE `tbl_sacramento_persona` (
  `CODIGO_CORRELATIVO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_SACRAMENTO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CORRELATIVO`),
  KEY `FK_CP_SACRAMENTO` (`CODIGO_PERSONA`),
  KEY `FK_CS_SACRAMENTO` (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_seccion;

CREATE TABLE `tbl_seccion` (
  `CODIGO_SECCION` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SECCION`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_seccion VALUES("1","SECCION A","primer ingreso");



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
) ENGINE=InnoDB AUTO_INCREMENT=98743939 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_telefono VALUES("32978788","2");
INSERT INTO tbl_telefono VALUES("89023232","11");
INSERT INTO tbl_telefono VALUES("89565656","12");



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
  PRIMARY KEY (`CODIGO_TIPO_SANGRE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tipo_sangre VALUES("1","TIPOA","ADMIN","2022-03-31","0000-00-00","");
INSERT INTO tbl_tipo_sangre VALUES("2","TIPOB","ADMIN","2022-03-31","0000-00-00","");
INSERT INTO tbl_tipo_sangre VALUES("3","TIPOC"," LUISMIGUEL","2022-04-07","2022-04-07","LUISMIGUEL");



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

INSERT INTO tbl_tipo_socioeconomico VALUES("1","DISPOSITIVO ELECTRONICO","Dispositivos de los ","ADMIN","2022-04-07","0000-00-00","");
INSERT INTO tbl_tipo_socioeconomico VALUES("2","SERVICIOS DE INTERNET","","","2022-04-07","0000-00-00","");
INSERT INTO tbl_tipo_socioeconomico VALUES("3","PROVEEDOR DE INGRESO","","","2022-04-07","0000-00-00","");
INSERT INTO tbl_tipo_socioeconomico VALUES("4","SERVICIOS BASICOS","","","2022-04-07","0000-00-00","");



DROP TABLE IF EXISTS tbl_transtornos_corporales;

CREATE TABLE `tbl_transtornos_corporales` (
  `CODIGO_TRANSTORNO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_transtornos_corporales VALUES("1","SISTEMA RESPIRATORIO");
INSERT INTO tbl_transtornos_corporales VALUES("2","SISTEMA DIGESTIVO");
INSERT INTO tbl_transtornos_corporales VALUES("3","NINGUNO");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tutoria VALUES("1","1","MATEMATICAS","ROBERTO","2022-05-25","","");
INSERT INTO tbl_tutoria VALUES("2","4","CONFIRMACION","ROBERTO","2022-05-25","","");



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
  `IMAGEN` longblob NOT NULL,
  PRIMARY KEY (`CODIGO_USUARIO`),
  KEY `FK_CODPER_USU` (`CODIGO_PERSONA`),
  KEY `FK_CODROL_USU` (`CODIGO_TIPO_ROL`),
  KEY `FK_CODES_USU` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_usuario VALUES("1","1","ADMIN","2","9","$2a$07$usesomesillystringforeDLU0KLdU3tCNprit2LU2PhciUHQJFsG","2022-07-24","","2022-05-25","","","�PNG\n\n\0\0\0IHDR\0\0\0\0\0\0\0\0\0æ$�\0\0\0sBIT��O�\0\0\0	pHYs\0\0�\0\0�~sE\0\0\0tEXtSoftware\0www.inkscape.org��<\0\0\0PLTE���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#��\0\0\0�tRNS\0	\n !\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~���������������������������������������������������������������������������������������������������������������������������������5\0\0�IDAT��	��u�?���;�Ƙ1��ܦ��#�ܝ*�JXm-�/�H[J���t�-m%҅�F�v�Z�~��9Bl�\"�5c3cf��H9���������\0�RJ)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)�SҮ����C����4u�g�M�:i�;o����!��骴?���k_{����>�bÁ�����/>7|�=���C��W�ʻ�;s.#��y�ا��$1�6cc6-��qư;�@�W��c�Wf��+�?ֶ\n�Pպ�i��nϼ?u�%���>l��6��R�e�4� ]ppƠ��@�)�����E9K��2���z��zou(g���� ����u(�Ը��G(Α��_�vUZT@�\n=T�F)}�S��}S�lQ�ל< oN��P+��4Ɖ�z���N˱Y4L�ؖP�H����M�d�h]3�8�u|�5PQH���[? *2-?̥�~�*l�΋��;�����&zʦ�BU������U�\nE����I��7�*I�AzVpF+��4���YS��\\>����ˡ\n��� K����Η6���F��4���~��R%��T�3*��c��7�\"�I1��T:�/\nmױ�Z�����Y�M��Y�+9,�r^IDi�o���C�t�r�S�_��\'��<����R��Tg�|J��T���R�=T�sJ��ө\n5�&���7��}}��1�<��A�b��JCU�1	�曨B��9��?�UHN��s�,�\n٢:�ߦS�!���2c��4�<��r��-����\0U�O�O��!0_�4��MK��n���Ɔ0�]YTQɺ�y�*j���P	3�,03F����+��@�����a�3�,�q#����N�Q���س0G�*�M��!*,����\n0B審l�ue�ƷT6��ī��m����vP�hGDk���V{C���lv�ĺ.��v��A��ǩp�=D�5����B����}�i�E嘬��I:��қ@�K�S9j��䢝T�yĨ���q[kA�*�\\��\nDH^M�����T.��\\�J嚩>��e*����rU��]�����E��P��Hc���*���	��_E%���pE�gT\"|7��b\\Ѓf�����}���+��/�f��]�M3�?�ϕ�T��9�\\re����L�W�a)�h�#����&�Ji����Gh�m)p����kQ��W��0��p��4���A��<0�(M�2ԕ���f�2�H�vo�9��1�e��]�B��� �y���fH�\0Q���a�aC\"�F#��K�߷�F����SZ�BM�R@<\\�C��7�Ș́|9��ve�Q�U7�7��x���n#)�ֻ}����J76k�l��m���l���U�=-8*	�J�h{*�N�P��7�v7n�h��F})ڄ$8 iE�ۤ�`�:�!��Q�ci�I�\n\n6�\nSe[{<G�2z�Q=2(�s�E�\\��>K]O�r���k^8��<����=B��	��w(�#�\\�,\n��.�O����j��PGn�kn9B���u�P��E��Q��T�~ʴ�*\\Uu9eڟ+M�L+��䕔i,Ԟ2���UZC���2��(Һ���:��-VJ��W�U�S���H�c�hSQc%:V֘L���1j}G�&���h[]Rw\n��|�(P�e�L\n�̇��C���!L� �QK�E���8�R�]	��0\n4�q|�)�0D�^6��6%~Ky��!:Q��K �%��#D�5�)�\0�:P�ֈ��3b�<�6�g.�Ky� r�)Α:��������h}(�͈�Wg��Cq�B�:R�#u \\�#�#\"�[EqzC��g���Jq��\0s(NWD��oJ�Q��Ai��G��S��0Bo��a�m�4�|0�o���C�:R�v0D;���ZDi���)�\"��9�	6�1�)Ms�g\n���L�4S�z��D*�z����C8FP�Q0�(J3a��Ia2��(U2)Lf�n�\n��4��؝�H\"�x���E��4#a�����j�	ևq�)���5��͢4��?S�[`�[(͟���f��m�0G��(M�?��=B�5��L��3)��ASJ���i���Ka�i0TZ�¼�%�0K`�%�HJғ�<\nc=Jiz�$K)L��U\'Ha���(�W0�W����:���4��X��&K�4;|(�Քf����\\�⌤4O�hOQ��(�7�i\0�5�4��(ZJ��[GiڠhoS�a0�0J�6�������Li�Š(m)M~\"��Oiڢ(�S��0�jJ�>�8@iF�x�)́\0\nמ�t��S��(�{�.�W�⼇�m�4;�;)�v�!����i���8���)�\0f>�ihFq�	9�&7\0�R��\\�#��O�Hq:�B�)�,x�,�3�Bqނ\'�Eq��i��1x�c�\'��Oyn�\'�Ny��|�)�������yb�S�`<<!>Hq���\\�)�.x�.���z��,�G,�<O�\\�(�x��3��Gy��#�R�}8G}\n�џ����@���(�}8�8\nt<�.\n4g�@�n�G�F�6�,)��<�%J�/:Q�f��f��~1�5�G4�D��/(QmxDmJ�~�ˢD���dJ����)\0�P�T�х��3r)Q�1�e�32)�P��7Jt�q��gl�H1����	?)W@���#(RA9�ւ2U�GT�L-pZo�TQ�2��ioR�4xD}��&N��25�G\\N�>�i)ӕ��֔� N�J���#:Q��8��z�\0�j���Q���S�n8i��C����(ԧ��O)�{8i.�Z	���B��I�(�Nx�n\n�	?��P��xBL>����I�.�\'\\B�j��b�O�H���;�5�0�b���k<<a<�z�8��/x¿(�8\0�)V:<!�b���rU�Ԡ\\�l�\\m�7R�-\02(������+P�Y���,�j,���Q�jhH��x)YC\\K����dע%�\0ƛHɺ�7%��}G�zcE��ՠh�0��=���h�1��-��>�h��1Eֆ���hce{F�������%��e���)[�L�e�_R��0�S�/���-���Q��XK�5a,��n-6Q�G`�(�&|O��	cM�t�c7�+�C%dQ��8D���P=(�!�x�`���(NP�`c�WA�wA��!���\"���_%eR�d�\0c`�\'h�L�rk�8��4�A�	F�8�h���A��,�	�c�0�iC#l�!=	fYB#|��4�`�6�a5V�{�a�74�2,�!�A���X���ca���4�B|JS�1�)��I4š�0D�}4�d��1>�!�Bc��s4G�#���9v\'�\0ɻh���A����� ��N4I[�מ&���$[�A��4I+4�QF@��i���E���hmi���Y����(� �fy���Y�|C��h���,�L�a�\'C�r�i���F�,@��4�\0�8c!� �\0h�A��~\0i4O�+�i�A�W@�oa*l��.Ïv�@{�B��Y4Q~��&Z�A|i�C8i<�4;r����धi��!�4�L�ԝ�zB��F�V4T���W������X�A�^�4U��Ec���۞����oh���p�K4W��L�����E�wi��8�u�lc=�&v\nM6����v7�KR�h�q�-4ۑ��[i��qZ��.�E�]���N�p�p��� w܏�,���^	��0��[�3ޤ�~�j��曌3���C�^-��u�	�.�#��\'\\����\'����e������G��6k����x�^[	6�:>H�x�hM���36��A��_���C�s_\0v�u-��β����O,,�m=%ˏ��F���`X�L���1����A���HYX$�����Wp����=���_8L�sl���9Q�_��1zR�c\n=*}\\[?\"�������8Wzמ��>��o�w�ƹZP�����c����2a�_��^zگq���+gV���Q�=�\\���z7	�D1�z�\\r������T�yS���ޙ���Y��d��{�Q���=G/=���j�5�vS��8�pJt�ݛcq��Y���o��9፧�֮yjr�E�n�����c�w��lFoEM��n�\n6��Bqr��9�MѦ������T�p��y�eIߊ(L�|�|爹q�1J�[�OA�3�\"�,\nu�\\ ��矸P?J��Nk�����Q��G�0Cq�ZA���_\"J�8�}YE)�}a��\\�B,���E(�eP���\'��=c��B���c]������9JR�����(̥tײ{� t1��Q��x��w���vj]4�*���\n��MU��躣eQ�?�-�O�#|�)�C�72�i(\\K��`jcD��C�E�*>@W�@�|;邼���s���_�g2螼J(�h:.wL*��:�.Z�\n����1��s�-�z��a#]��;\"Wmd��(�8LG-n	+�>�I}&Q�;.�n��\"M��6v�U�O�a��5��S�t�*��t̾�P��A:iIsX���tړ(Z��tƱa���e�O�!����*���Q5Q�O舿Ղj��E䌽V�<������K�6�����Ћ�`��_�9��8��h��7��>�o���>�\0�z��C�\'�Xi���a���e�M�ߧ3��x��VǞ�~I=�j��;���N��+{�6��+8���oh��O_�%O���P�Wi���I���%�oGt�K��BIR��ɚ�p��這�J��=w�N��1m�%�E[G���M|���d���5qpV�C����#�����o�ħ���O�����F��d�m��?��mU��󧙛�X��-�G=��W~���R�v9����r��:7k�����Yrl[�t�\';]�uL�M��PTΡ�v��D��Z�6����N@��մG3�d-��&Txʎ��#4�i�Ie���\'�ֻ!ZE�<�f��j���޴Jz���XC���P�K�56�AE*i!-�����%�T��\\�Zi>B��斃���Z�6�a���8�(=�U���.�ڄ���}�����Qz�e����������>�Vx�I�d4AY�����x��F�(��&�Q{�p�e�������c��ꃲT� ������e���Z�����rP��h�A$��d�U����\\ND����5��Pf)#6����pe_e�j?0BYU����Pviz���H�ldxއ��o���n��2P6z������2�B��7���SQ����e�J��~��\n��Pv�������g����l�>��QZ���4��_�-�r�Ԇ�y\n�	�0�+��Ś\0�#�3����,Y~3(g�Yː�����\n唦�ӰB�v�ds<�c�3D�����$m��S�(C�X�#o���2$�`���,N�)����d\n��2�8C9�C�6����E�O�r��k�hg,�0�E�6,Q\'X�%�6����Ze6��C9��w�,v=�[�y�,V/Xn<�!�~��,��*�ga��rC�C,��a�߱��r��,� �b./����X�U�\"�8�w4	�%SX��F��`�o�[ڰ��.��<�Pn��c���`���c�{ư0k�Fw��@���k�j�v�{�2x�q�W�\n��P����l.�]�Ο��Mw�|y�`�_�gwC���q�g(0�?ɯ媙<ׂ8 vO[�!<��8��a��,��n�َ6�C:��P�ȳǼΓ.�r��b��/��>(�}ğ���Au�_B�m �X�Gu�(�������a��ܖ�)��i�/��r�n�2ΫS�ukx��Rj.��T)����B�V��ym�J��d?�ҫ\'�B�b�-��*�R�C)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)��RJ)����?����\'���\0\0\0\0IEND�B`�");
INSERT INTO tbl_usuario VALUES("2","2","ROBERTO","2","1","$2a$07$usesomesillystringforeTrXNY25jXESxXCy48KS0JeCpVqZqPwe","","ADMIN","2022-05-25","2022-06-05","ADMIN","�PNG\n\n\0\0\0IHDR\0\0�\0\0\0\0\0~���\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0t\0\0t�fx\0\0��IDATx^�`GӆG�̌����@!M�4M*�)3~e���WfƔ�)Ml���c��,��]�lI�dٖt�<O{��I���ݾ;��3���|#Ya$��g��b�a�a$Aʣ\0�k_|M��o�0�4Mfv�]u(�^e�a�a��1V���2�0�����F��5P��$�.h�a�a<�Fl!����0���\03�0��	�p���a�a�M�a`�a��2�`���a��`N��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT��a�aT@c�*5*�L b4���J��&�(-�aƛ�\0�9G��JEY۔���ڷ�j���D\'u�S.x�\"��)G\\���(�^�.���%��V�|%wNq�ݩ���ʋ�Sy�A*+8L��R��k(88T�lxL�F&PlJWJ�<�b����=I�ᵔ}p�|/ ��J�6��C\"d��k�(��\n*��Be��HWSN���������9I�������kT��� ί#£SH���5���}T��ڪ2�Sei��NPU�	qT#��T�J�Hщ����u�9��VSq�*/:FU�o�цESd\\;���7[J��Ք�k��\"��M�� J��i������\nq��A-�MR���:�y�*ϡ��=T!��Z��ͧј�a���L1�mN:�bS=�3����}��P΁�ʑ�B�zO���~ԥ��h��w:��]G#:߶Ծ�T�;�҆F)Ǜ�AWC���,�</���s��sU���MP���w���.��a�v%;Vw`4��؎�td�/b��]Z�~۠<kt�謣��KL���g������s)O��#B#�g̐�����9�V�i��[�\n��q���m���m�E�y���?�����Kl7����A|��Q�)��9o�)Z���F�ˁt��ߋ��t�뿡<d�:j�>���L��~�����Q�5��g��8C����`Ia�_��[9�Rz���y�%���\\�hC�5F�V��>��8�O� 7a�dXFk�Kv��Ftԉm�S���R���5���{����K%�{����9����\0a�rĚ��X�b���^	X��y��gM�;\0�������4j�\'�3�SU�+,�Oi�����_�m:]�̠AS^�i�>B{W~���u��4X�Φ�ϛ�S�J�}ħ��Ӯ��y�<p�����+��ة���J|������gQ��������_hD���b��9�V~w�]�m~\'F�p#7�[���%�_J5�E�׀\'`���Ң��k��!��7��?�y��,�	׀��e����oHx�E%)-ׁյ���Rؚ��˳�i�m�h�����H)�G(Ϙ��z�e�R�~�d;,*Q>6>�aa����0ھ�%E|�_p`�״q�cJ���g��q��^k�V}\"�O�JUi.iC倶9`pkL-��\"���)G��p+���)\n�I�LN�&��Tj��+a��$������k`9�R����;܆M��	�oxL�%��;hΛgH���,��b�6�y�U�0k&�0��\\���|�`�ܔ;����I�z:Myh�� ayƦtW�q���[�yA��Z�.��>��/�wZp|�<�e�e���AHV�p3����1�N˜kǶ���5N��UV�>c�q�Ρv��]�\'����N�_Lo�����M�*1��X��1�n6�:cvA�!�~��9�\n�mP�4$42�j*�_t\"耍Bx-�N�,,�����|~e�G�]���9���j*��E\'�-��k>�o�\n���]QtL9��la���i��tʅo+-��ӟ��8*t��%2�-Eĵ����������oi�(<2�*J�H)�8܄g߱P�¹5W����7ށPj���&~_�����B����������LC&?�ٮ�ґs�&��6���6]Ϡ�nc�R|���)>�Q>WQtTzL\"�2�9J�����3_��l�>�\0�?�&�y�Ϋ�.H�Ġ�1�s��`��}JH�\'����HXӏ��_�tߚ�A�+����/Q�S���1������J\\�WZ���e����7��s<�~��J�i-���X�T|��zS�gQBۓq�+G�		��\n(��&u&���������(�z�DG�/|Y>b�B�u޳�]���o �@@�3�wd��g��y�-�7&�$J�<Ry�!@�ڌK�C�Q�t`�tb�T�o��<+��t�R�pnMu���w������Q\n�R��*>�Bp��A��q�O�Y �I����62��F�\"!a��C,6�~�v/{�m����-�KEq&�\n˵8G���o�E�/��Ҏ(½�KZ ����#��2� ���㛕��U��LY������Ӕ����w��J�5�Ž���M�8?��p$��V|�Y|ۜt�t��)/��qv.�@�-`?��O/������A*,2�\0�6\'���H�F9?��}>�����A�n��S�H#�X���UYrB\n0,�������V�#�{� ��qo�3#�i��wd�<���ܵy4>��H���S,�S�3�~���d˾5�����WZ��3��}�M��F*��E;�.ŲFy?�����֩-�,�0aɛ?���cRű$yAXhG��/>����\na�V�8��	�����Z{`���(��*刉���f/��.J��M����E������\'��3:���.�3��g��p�ѹ�3�.����YB�(GM��sp�M�(F�W������uܶ�1���n���w]�]e�V��R҉�Rj�\n�H�.�?@z��X����$˜�X��XT�_Q�F�$8$��N]��ĲtF�õ\0�R��V��/f��f}{�ͳ��\0�Y/VZ����$�<�v�e�^/������p\'�2��rݤ-���~o|��ϧ�#��n��k��ѵ�z!��wΡ-Ḇv��v~+ J�}��J�\\����$��\nȄ;�J�i��=[�y����چ?��]����,\nz�y�S��������[���V=}��G�� �\\#D)DX���c��g���:�yL����Lq��V�`#`k��w�&�c��-�|�C{`���\'��L��l~xԾ���7����SZ�����n���g�R�Y������`&���.h?7������:8��;��|[��� ��������#�m��.��,�(�Y�b���`y����[�{�ECo���2D�N~p��\nŧ����m�����k�>@����x�\na]n�17�!^kv�g��\'��Olshя��C�� �۔7˹[�{�y֍6YD����zB|�9���e͎E�I�}�M�i�C������D�2v��g�Ҕ����d��c��{1�/8I�}r�!B|/�B�����Ϸf�ey�=���%o1)���n+�\0��B�ŴX���/ٻ��+.^3qmz�\0 G��8����ъ�:��*�7�ea!������5rY[{�J�>Fi�=�~!|�5a�Ff�J�4�N��;�B5�F�^��2�i�oƔ��!�Y�%>����@=N��&ݿ�N��m:�(.����`�Pw�����	�;\n����7PR�!u���A<�Nc�R�`=��ݽ�=�g�����\03g?N�V��q�6L	D��~�w�����=� �i]�\0�)��`4�����Pau`�-DK,��0��N{�7S\\%���`�������߉�Һ�zʵ4��4�9T��e69�\nWgs��`����CyNL�4j�g��z1ǜ�D�4�q��#��4�b����t���:0�`��vM2D��\0捇_��t�z��f횧�L`Z�\n��5�3�u�D���b�\n����6*��b ��C�^�����7EٳO��k�����OA��̽�h��Α��^�I��D�uAb�@��7gT#i/�Ȗ�#��̶���qi璷�nTb:���E����\0�g��1߽g�Tc�ı��(-!����\0�?��~���@ZNw���ƿL�y,3D�b�ygo�\\�y{���s���%pQ�)�őx���v�1\'�&��q�(�͹�|�1�dZ,�~\n���j��0�����D�{�y�r�u�$����X&c�2����d�AX��n�ǥy�ƀ���~����(h�3F��?o��\"K�%�;��z��	\"�mA�8�����_�=ǘ=5+��Z��\\��a9�����c�`�D�2�J����(q��`�1�`?X�E/7�����}��SG\\:S��l*�<���[r|�_�ayI�X<JW��d�����[�(òe���.CwƵե4������i���)��5����rd����0��>-R�Z�&��\'�a9\01/�ӆY�\\��aW�5������5�ד#��<�����Sб;����g��v�tͤt��Y����8.�������#:��jZ��j1���ޯ�}��b�\n͝j��n�����Y�_˪B�F\\��	��	c��\0�콋h��db�&�48�J*8�I��<ڳ�Z��}�����nH^Q��Z�Ҩ���f��\"���݂��?��v�)��`-yUi��gb��]G����,�A��8��\'��V���E%��c��>,�~\n��2��\\��\"6!&{V|��졑�\n�\\Ζ�c/p\n�dZ*:�Cs��?����W���V:�����c2#�Z��1���v���0��e�.���j9�wy��=�	Ա%W�Ǣ���ƿo M�E���\'T�B%�y�_\\&� ](J$��y�M�>������#\n�w���+3��w�öB(��B9bd]kL�-�����DB[pM�^��z���j���:����y�eb����	lX�������Q]f����?QZ� �Euy���7�Ǧ�V9�QIh��O��1Z������=����\"?�L˿�����)�,����m��z��s۔��<�����f�r�sԖ.s��fɠs���o,�#Ν�yz�x~����@�$X�x�UP�X��e�B6���?F}��/�1?���G�9m�uޮ�e���z�=�v���I�.��4�57���L1����}���7���,O^���P�c�M��5���Ƶt�Z�洆f0\n��D1:�8�	Z�%,d�2�.�Q�+kY�;�\"牫+�eɷ�Kߕʑ��[	gd|{j+:�A���՘�3>��n��w7�2�u�����ș��D��W�q\'HT�TN9�M{�?uQⰂ̟1�V-N3�_-�x:�~�����鯗�P���ʳ�q��)@�Q]�K�i=�:Z>�-�#|����\08[px���_�1�������~|�~uK�Q��W�s�v�Ζ��P`��k���YVk��5��l1@{N\\0��=\'fz�v���Z���\',�~��`�����n�CZ��m��O�b���}�h���Y���x2\'��r�i42��+��V���+>��v��M���Ѷ`�@��%�}�+td˯6l����R�Q7+�z�\"\n�������vd^婎�Y��C���R�q�ϗB�e��u��Yq�;�����R;`�qX2�����\0��..��Q>��`@��k���wa�y;�f��f\0K5���iD�w�~�z~,q����5?�A??�Y�}�J��4��F}��2���4f�l�C�󨇝k�i�\0�)�m�\"Z�y-�a3oH\n+W�x�霫�rꂶ,g��3�F8�j���/��ck��A�,J�a�nN�\02$�~�{��΃᳘�;��[�1+k7��=���8|FG� �\'\\�C�{�&ݳJZcȨ�s�Hb���2Qtb\'�����`m��X�}�,:,�w컥�-kq�|p�FYo�r��APs��6�5�����������d��+�8g��r�>���0s�E�����bP���k���i��]�δX��g)�e�R�9`.��Y�+�X�R�],��]i �Ԙ�fQ߳�N�.�.lGu\0�O!Pf�%9�1� !�Y�PYT����R``�9˟mId|��{WaxSV\n����eR������6YB�~R�a���ᖆ��%�w�m|N{�bm�-��x+�h����%H)���\"1@�\\��-�ѡ�Ka�q\0iO�}1���X�i�4t�+2p���\\�}ǚ���Σ��`#^`ԌO�fZ\\�OA>�=�����;9\\V��Ӌ�Œ��Q��i�2�\"-iL��n�5,�I����s�Ͽ=��j�شGw(-�1������3��	��E�I���H�Z��u�� a8�s����k~j��ǚ�^q>���B�� �7X=�CB#�RFƶ�����_[��d�1{ �8���nȟ��|�u�%�5YzyZ�P��˿����P֢�EkK䵾k�;T����i��o_���jk���G3�3����R�E��~��(E���~�����cY��Ut|G}�BX�(vsSA=�s�^�x.S\0��2�H��MM{l�ӟo�l	,zT-��xn*�䑾���oe4�+֗�ӷ	��z��:m!��X,S��c����F�ԏ���ݮ&`����3O�;@�}$5����ˤ���`Q��a%\'u&�|n(��mt]E-̿b����3���v=1+��Q�-�!�oDt�t17xE&ݳ�]����m3�^�&DI>tV�q��Y��Q?�ߔT��]���na��ŷ��h��HW���R߳p����k~���9N��0��F�oR�!�#Ee��f�V���N�g�%��^FP����s�_O�&?o]�H|W�g藍��TZ�1�-~�;��]���ܑ?���8yG˅��s������@�=��p=�Ze5�A��]K��I��f��G�*�ͨ���B��n�l�C\\�_���7��MN�8���;��9�x0�`?��\\Vc�DJ��zFg��S���n0�\'Ϻ�/Jl7@y�c�x���e����rn�Q߱�gL�bO\nK���0W�O��+�і։�h<�B���c]���`��lZ�o_H=N�]�:x{  �1��-���ǲ0�%�$=M���Q@��r���ҋ���%/uJzH�v��6��?[ ���ֱ\\:N~�~0d�G�]y�z�:߀�O�:U�؎,1���n^�h��cX������������n���Xn\'��2�u��8��e��4�B��5�������.����V�\">�\0s��\'<nw���:�s�IIJ�+G�����L�o$�ss�՘2|A��iv�w�y�%�)+�X��3�1�`?żƑkधi�C[�mM��}��_S��nsj�6������ ���B	�3����\"m��F��eXJ�{LI*��V>\"��ݠ��=\"����U|�6��,iN�w�i�ŦkN��N���K�^��9��e�5���`�q��oɌcv{���F��VfZ,�~\n� ;�}��R>�A2?�X�gkoz��$���y��=h��Z�`�܈���|��!��Ⱥ���WGP�Rࡥ`�����2/�x��C��;�$��u����͞\0S�bfr���-s��b�	��A�=��{����O���8���Y��Ц�h:iؕ4����˄K�yp��rz���V���0��όs6�ҏ�>���*���M������br?�GP���҅άؤ���Y�AY�Z3������~!����*q�O�IWeK��o��?���{��Î_��]s�~�\\���p[1� c��{I3p~=2�9�ľE2�\'桑��Ȱ�z���S����Gg^�+���ww�?4��iȴWd�G�4\n}8s�\'�-VZ�`m�=�`����5��yJ~\'��U;������L��짘܁-��m.�\\�:\'*�5�9�^�)�rۂ�������Xnb^nd�25[�8Ƚ�{ٻVy���Q.�B�#{ Uk���[�=KK��AK?�T��Im�#0���o��5����60؜o��v4Hp��*(U�����Jh����Uӿ�\'�G5��wWx|�̅��`�\'#ݕ��9�D�)]士`*�:�aJui��9�(Gc������ǜ>nL��O��e�,`󣠱B�`�e��N��}-~��5�����M��m�����źXGs��@���^�Т�6�JV�Ö��C�_3���땡�q��.[����/x��|q�L�i��0k�\'����]�kښ��C���$��������X�:��5ʶ���F^:S��a�NQn����ΔE@\\�i��Od%!��\\\"1s�#�����w�F���C����}��)8�o�d� �:?t���n,�n�XT���L��${�p\"?�ߟ/t8���}��J˽���@i��c�u�4�{,��j:�s�\\/��s��\\߬��ZU{��k���\\-\"�3Q���D�ٶ���A���J��&��y�5?�D�����ٯ����N�����L�X��#Q	�G\"�\\�X�]*�D,G)+8(-_��i(e�c����K>�U�,�ڳ��|v�Ҳ�@�5D.v�Rv�������s�R������{�v.r�j�{�y@��Ј8��	_�cR�`��򏮓��^�g,͂G�^����x�J�׉3��{�G}j;`I�������2����ء�k���PJ˚�C講f��i=�\0�)\naeI�r�O	0�.,&{�Y�+���=�+-�@x|xn�13j�g��g�Ҳ�H�Ӽ�&��#C(0�\n�\"��e_^.��҂�P��!DfP�����ap�-щ�i���(4<N9bb��I����l�W�D�Et�(1X�k]�:��2~!`U���)\'	���iYf�$�=\'=C�GY[�����VZ����\'��9���	��8�,���*��kB�v��1�q���k�zi��؇Ӯ�F\\�㔖c0����sTDD���j�½���S�뀽MmM�C�m\nH�����(���ꑣx��}��G\0�ѭ�0�a&���̮R��m^���n�<6�bR�9��kF�^/��@|AbF� �E��؊/@�[�(�a�P�I3�o��ϓ�!,�2*�s���uQ�w�a1�3��^�\07�v�n	��|!��3H�����LVN�`�c����-w��q����NiY��f��W�k��-���O����ri):�t\\v�a6��Ò���a�w\0X�jr���}ǿ���[�r�W�t�,h�e���5f��C����I?�+7��(�?��4xʋ�mXB�o��0��˰+��>+x#Z\n�{��WiYc������Ȗ_��گ��	D�6eM���n���G�i\0�ƹH� �U��h� �����������1��H�}g`}.�[�\nh�c��&Pd\"ً䆩\\��gKMoأ���߶Ra�oN�㟰\0�)脂����y��n#�7Y�<��`>p��ˎ��뢌�T:c������a��>p��W�2�aY\\-��m��\n�m���PIhǿ����oȶ-(�>��5߶�r�!:�\n���u7�zO�����?n��A@1AMZdJsQ�H`���g���w7e|B2������N&ݷ�:��� �1,���<c>^��z��~��w�}�W3��}�O��E��,yGM�\0�`����5em8^?�bnٌɛ���;M9����������$-Kб`N�Ss���x��݀D	<�!\nM$�ն/���/+�q5� _3\"pw,~�r�/U�6̍\"\0�]�s���ש0�� `�/,pW��I���t�H(ѡ��^�֘#�:q��d�;�0Û\0a\"��θ�8,��?�}�,�`J娡ȸ��:�N�$ۇ6� ٻ�9�������u��_���h|������к�N�໘x�jii#�K�l�{�Wŋ]���n޷�s����kN��m?��\0�9�:���@��ͮ+��ϼ�7aᠤ��)8�I�]̓a^y�c��H�oμ4���_�l!���Eu�O�����g��A*/:&�īJs�<-�A&=��	��7$,�\nѷ$��G��%TU\"�^iU�U���s�eX[].D�z��>����#iϚ����?����f{`��������6I7c�M��rP���������	sר���\\<�0�5���!����Y2��.~#�t�X��ޗ�%[���r�����t{c\0\0˾����`�9���%�YDl��}?�tW�u��{�k�F���EF�s�zw��n�\0����$��(��׀�\0��2�j�dY{P����ֆ˴���}n��k�<����v�Φv�\'��0�,��0���0�0*��0�0*��0�4�)`NnBN��<�x%�F>��Nܠ��jy���⒕f���u���]����P�hzRyP�&���i~4߷�ʣ�v�4+�� �mD�y���}l��=.��?��̸����ۺ�ɍ�op��L)7���E炔���d��@TqO���+ʧ����(ʽ�>q?�D:�ށ�iub�Mܬf��]��\0;�r���Yv<|[1>�U9P����~v������������aQ�u�FS����cܰ�ؚGȞğ��b,;\"��51߿�����o���2,e�{�h���֡�(�-G��a�z�V..nO��=�]�m�����o`�q����\"w����@`[�x/[�%aTL��Id|ܴ!�G�4�D�[5��a��!B�ԼY�-i��X���i���3�	nV�)���&��qoa�ՙx�˴_�[�\0ׁ{Y|^}m�>w�l	:��U�c<�t/+��D�`0��}���-�Up�1E��N�-��,�Ԙ�u~/7M���G�ҋ?�?��!�#f-ۣ�	pʽ%���b���ok`K�!�/7O�-�\0�����fŅjQP�gi�l:0�a�3ܿBx!8��50V�4����r6���Ji0���q�E*n^��ܴ���b!n�`Ь�����k�}pNp/+�L�`��U:��Ũ���$.N_uU9��!�y9`�uᅸ������\"v�\0+�W���{�Q�U��sD�����Н���Q�*.%j	,�.`�P5$t�8)���{�+8ߡB\\p��U|���ǝ^�+�[����8����5�j��g��������B+�;\n#�/�:��x�X�c���/�*�Ν��\'�%$ϯ��T��/�{XL����Qb@%�iUxo茎��Zak�=�s���f��h�`p�N�����b�{���V��}W��`k��ԝG�z�G�)��<�E���6�*���/��w���Q]G�.�f��=	�#䔄��yn�7��\"ė��V��W�9�q\\x�̸Bݵ&��<e�0��`2RsW�Ju\n��������	�FUd?\'�_��|�7�.i12�E�4D��8P�i&����Qs��|�����sGaB�i��ˊi!u���\n�\n��0�!���#F��<��.估��`�1�G�٫�8�7}\"�y�V�2CG�.+�C�\"���o��F��^��B��9X�ŗ�$r��E���߂���_�q|�*�.31Zo-\"�y:Ί�xX�l	�9x���<;�~0LSD8�G�d`��h^\"\03a5i	s�_��;l�2��\'W.�\0v˚G��X��\"�2�b<�]1�=`�|��2��H�4�4YkeZ�����#ŗ;=�G@�.[®#����4�S�@��1���\n��K�s����o�1`�3����\"��n[93�ܹ�zw�NW]~9��z�J�\nfvN�8G�̴��A�0���u�,�L=��������+�ĉ�Q�q\"	��a܄�O�%�gs��b���=\"�������ְ��q#�����!o^93~��b��EX�3�1n$0L1p	��������e��<�2-���/A>n^_��a�,�֞�R.dO\0�^h2R���Ђo^��A���x$=l�̸���Bp��Y����eY=��$���AW�g��~�P[IdPy-%����L6��2e�C``�B9�U+W�o��B����[�n����F���ƍ��H��&�}{����)..N9���p���ץ�j��>F���S��j*�cj��^����&\0���ѣ����ʑ��g��Kg�PZ*R[%:��eS�_���<X�]\"0�.��ڮht�,���n���~v���JKedLC��Y|���F�7��}�f�.h�y�x�;o�E������苯����t��II��|�@vE˩#ܿ<�n6l�D`�Բ�ն�Po�ٶ];�ة���<K�����y�_��I���2^ �X����x�˩&��@ FEˁg�c�C�+n&�	����eZ�����]1^�u�j�J�\'�}�uŴ\"�\07@ֹâ��IƋ���i��+��dZ#>��Ed�NP�zi=�����\0t�1��@��=M�J�L����z(jӫ���H+�Oݷ�{ű��i]��1��3����˒u9��.�˒��*��r�È{B�g�[����>�����x��0\n������+FEZ��%\\en�����_�\"}�)U)R�-7d��~����*e����F��C��H�e�X�,��:�1�3��t�E�_�����^J?\'�sA;��\\�l���0.U�1<��1dО�$(d���O�����jI �m[�{���������6uʾW;jf��#�������z���&��s`���z԰ad��ޣ\'}T��y��̤�O�ܜ�U~�?�u1�b�mx�p���@X�r`�:m6O�z������u��X�p�骄e.:!Xx-t���zz��7�՗_���j����K�����G3D;S���!����<��\\�r�)�uYQS4,���[��77����m���V��\n�7ׅR�o��*�.61J�y����/���{���u��\'���eۯ��� p�dC��G.a��\0��x��;�{�>��e�x��oP{�)�C�F��Y�2�#=D?���lC|�y�y��d:o�Tڶu�r��9s�G�J�O�\0�;q��B�Lwa�x~0oo��S`��l\n<zflA��OX�NƳ�^w����O?ɶV��O���.��B�6Q�����3�T�]8}:-_�\\i�	�z���R)Oo�������9�Gm�\\�?-�`���bX6�����]F˖.�BM~�1�5J��###�ͷߦK.�T�+**���o�?~�]��pS�����L�A�0���AU��WbS�E<]U��oбa�����ͥ�o��V�\\)�I��������g�aW|�DEEѓ��/]6c���KKK��_~�Y��_�kY�8�iꭙ��{i�s�f�J.�Ua��4��Os��P~I9]}�մs�y$!!�>��K�۷�l��3��}��gr���s���^H��>m,�b0�+�F��U�M���\01���9``�j\'��W�#\0��g��@\'Nd�6���VQJj�l7��?���{��Et����mwܡ�|D��B7�7ć��=��@�zY��j�I46��G����83+KX��Rnn�lw�ԉ~��gJJJ�mK���i�%t��i�4����ŭ��o��}w�-۰�/�1����Ӳ���Jf�D�����S�`J$@]�,�@cK&���]�X�7m�B��x�V0h�\0z��7(�M���Pصs\'���+�t�bi-[�&-M&���($��s��:������離J��f�y��/���h_qC��4�w��kzY����F���]�T�W�\\E7�rU*�8��a��;oP�9�32���?�M��5���٫}��w�11o�\\�?�,�g�G�������=D#=L*���ڑ�-Ѓ�X�\0��U9B^`����C��^s�Mu�R�����XY�`��5t���*-���t���ki�С2-�7_}E��ͫ�����A�̟O����7l�+g̨��_-�0�2�!ri��~[[����[�\0��I���}�L��ΛOw�}?����H��Ǐ�7_Y&۰e��s��ѣr��{�o��BC�ף�c�0���?.��:�oɞ={h�ĉ҅��ѳ\'���o�Zu`�c��Z���g���KE*w����-q���\'|���t��w��q��=�Lz�����w��X\'�#G��s���2ڷ�g�TZDo��F��k	�F�9{6���NH�{�.�:iʶ��J��v����Z���ae�đ\0s��p���{����S���С���b��o��Аz�駜Nu�у�N�.�KJJh���rߖ��t�߳�~:����x���P+\0J���ph�Һk�),��8��w���jk�TUQK��TV\\�`+/����j���%�x-~��o<������o�#�p�6;��@�c-pF�4S��N���Q��\"��3y�Dھm�r�Pk ۚ�~t��<l�m����/Dt�L:�+��̧�r�zL��ى��5���61��.Vlq�Fl�mc]��[><����i��%��3?|����fپ��+�ч����V;�	t��q�ѽ��篦\'B��%~�=:DcG���=�]�r���9l�tQ��UU�e��,�~�����/۪���Y���h-ˏ�v���[<@XX�z����ȣ�_��/^��>xr������ڷ5�*�jd��~Ec�l�ט6#U	!�<T@����?l��_[Bo?<�>��<����ח�h��#�zf|D&_{�ʹx�R������G��:J����D\\��wt�1���lDJ/�7O�U\"�m!�\0�5�/:]jj(k�b26����X�m��5��M\'�ϯ���,�Y_m�=�3� ��*�M��)�:�ܼ�ڻ9K�f�������K��߶	�;G��Q����펻hٲ�:�����{�e��$��A3X���G�J���2�����o�VoD��\0,���Z����晇)w�Z�	ƗaV(�-�������.�9?����vm{PpED�Rlb$%�DQ\\�mc�M�xj�O���x4��GPhX��0_��YL����f��O�] �gAv�踕1����n��va�.�mU�����Q#d�Ÿ9A>\\�Ͽ�\"]u�5rZ������=:�lo��~@��S�N�]A��L�{p����mZ�0�V���v�=*�cgh�4L��ZJ�@�{���	��$/��2��zhg�tE�j�2��)�I}�茩}����N6��9`��4�<:z��l\'&&�߳~���D������\'��<l�X�ϲ��s�Xڄd����[�ƫ��	��>(��r��u�j	8���`�u/<NǗ,��4b\06��E�1��9`����Ч¢ܾƹ�FF�ѩ���k9��{|]��X�t��=���l��c{6eR��\"�eM�6H\\��\'^1��{l]/~�u���i7�B���Vuc��v�>a!���*]͸���=��:�m�>�̝m%�n�CY�n��6zI�Yp_y�%�����E�.ht\\�|o��U�kI_��#�N�`�%��ꖕ���i���wQ��3�\'�ѐ�]���A2��s��m���J�9��²��w�J/L�?{]~��=t쑢��!����ɣ�Oϣ��I�5�>p�T)����o��s^gw���	�=e�Tz�wd������B� z��\'�X��(ڷ�t���C~���H���2�J�K+i���h����\\[���	��y7�+�M}�u��Ta�\n���KH7�+�6�h���1w��0���t��g���=(5�:)��C^>{��|k�~6�y@����^x�i���{�&�y�|]��u��\"|�ĉ�=�\0��_�<���@������-AHT4����_��0��~��鶵��v]�{N��W�݅�i3H�;Q\"�{�z�+�]@8?{a!ޕ��O\\R���t�]���7��B�В8�=�~xg��g5!_$99�Ο>��bc�#�Dt�,7x�;n�:�f�%�N�y�K�Q��z^q#��X.p�.�B�`��;+����uJW?4�.�u��^vDz�D����ls�|�߶RQn9i]�*�wK�B|��)�]C��������R��}\ns���nª1��W׿�������~����o��U�	S�>���*����v����1��t�ºlX��/H:����]9�2�Qk׆����ta�\')G]K�.��4��?��`0K�*��ET�ǖ��,]��F�6���<�2��䱽��Ӡ�#�o�Р�O���sϕ�o���2x0M�<��T�_�5XE+��` fY�W��ڨh�h[A�s����s�?�h����IQ�at�-#蔱ݚ�.���<;vO��YR༴ک�zѨ���VCJ�*iѯ�(:.�&\\6ȥ�.{`~:�C͸�tqvOam�����{c�\\�̨�֭�(\'\'�\n\n�����C�m��5�2��Ν;���D9�x�`�)��h������j�줲o~��?�����ܫ��+��[���{�ʿ����Wj0�!`��Y��V��Ki�Ӷs\"M�����9 )Ƭ�����}�:���|��c4��aB�G97d˚��*o���<�ٟY��0n#G뀳N����y��Ѭ��n<@�aa)�d!�k �j���t������B�l�ρ9�/�����<���O�{��>+��ٹd��&MX(�DS����nXN	!q��(��̇S!�c�ӄQb��IJ�W�Og�֚�%\\�߷@e{n�.}�h�5C��g�� ��iE��jK������\n����Q��%���[˨����;yd\'s�I ��\0�f���!J�9�\'�0ѼP�!\0�P\\B%o}D5��+G�	��vIBp���r2�Q�y)��)�y�X�}���R���%2J�ցƜ���a3��������-A���k���� n 0�^lR$u�.oD�Xg:j$�HlM!�M�^�>0���\0�j,g��/h����~\'���o�u\\��Q�t����}k��h\"�(8-AiYc�Ց>��_~��3��~�oPUQC�=�P.�����v2��]8����I?yDG9��l��A�,,��k�R^f���Ar�\\��	�����J�;QJ�w�J�0J�Ԏ�����A����6ʲ�\'��HgNo�������,���F������.�\0e0]X�K��ɮ�	_�\n��J����/]�$W����E�PQ%�	�䷟6�Ɵ`V⟟���;��#&�H������g��E�m����(�C<�%,f��]�7�s�p���!5�K��|wm8Fv��b	H�Bm�#ot����Ӟ�YR��]��)�����l:.�GM���	�=mR�F��9VL?���j�MiO�҇��E��4>$�UUմs�.�\\�F��ŗ^!�\'�3�����.��&Wt# W�M�_/.��׏����S��2yu��]i��=��Y\\,�x���-���).�Օ�Am�\\��h\n�HaC�1X׶�h%<��t물�O`V���6(-H�x�#c����@J�5��Jv���s�<�ۍ�-ܩWwa���3xd_�̲�tD|r�L���#���b��1�R(Dn�o�$D�ٗ�����<�$A�M�{���;[.a�i|D�͹�srs�#��˯�FӦOWZ*P[�Q���\0M�C�5ʾ��\n������v��i�zf�(�M�bx#tGs)���(b��ʳ~�p��-?\0k^���Ei�s���<w\n�󰳺эO��s����{V���IW����/�O�|�ʩ����rYlY��7�~�,\n�j���Б���.�1�U���z��`�up����qLYY���)��a�ʞZ8��q~���f�V*��_�O��0��5�:1���}�7	U�PX����:5k�����B��֙F��!��@�f}��*�u����M�٥�VX����~����d�`���FᆡB��6�l^q����T���O����>��X�Xw{��3�g�g��4�K�g��E��� \"M�k�ZJL�x���g9��酗^R��@m����_x��7XF~H�����,�T<��(*�i�D��d@�9eE_u���.h�@���/�[7�	���i��g��ͺe�!Z��v�Tc੝e4�%�4��X�.H]��[����i�!Z�Z���һM�v��!ط5��~���ޅF��C9�>*J���Ε��v�)Y�6|P��3�>x�m�/�7j�.]�d`�k{O�w5m(����M�a��B��R��qJ�O`�z,�h)�`�Ծn_�\"���q�e�����8RX\'��:�^x2u�߶AV+3~~��=f�9�x��\")��/@����`��e␽�3�=�g��1�<4d����A{K|Ap�4e��~-�p��c.�˖����F\'��$�k��v�>e��|1��:�0,�[=���2��u\'��f�\n�����?�d������+ ����	�Z�7,�/����@q����Z��vJ���y��0���ʶ��[��0_��B��ew��k3�`�ƑSc��)��	�\'���z��������,}��7t�b�o��?GKjU3�%4)���w����=	�_��r�q�`D>���Wi�@��mU���U{i$:2\"�.F[����UȌY6�}�����yk<�ooX�1�j���?wӹSϓmL1�����z�p�\'4e��w������wߧ�~�S�/Dx��si��麫��ݻ�4o.�nѹ����t�9����Fy���hۥQDP��Z���ZDN+L`�����=�ȥ����0G��SX��N��S��������3�4��֠7��Lf��S#ZzϦLzfW��@��%���Գk�z���h��˯���̙G����?\n!��6���/�_z�v��%��B��ǋ-�I&���zJf�j)�i�NG�v�x�N9�n��F�C�r�E�%F��:PlH�@�R�34Z-EL8Si1��ox�6k�e����]�f���s��De%�k��=���G�{��jm��lA%%sZH���� �l��{HW��ʶ�,�KFG�Z�\"��Ks�Χ�.��Νr���;t��!�<�*%%Y�g�%˶�;V�YKW]{�^\":�~}��C�G?|��������B_��O����c\n>��S���k���e������lX�k�͝K��y\'��O���m����_�!��Qlp��H��x[�R)(�~���~+�[WY��mg#f�\0�6�#B臷��XBP�9E$���G�NX��@���_oTZ�&�\nC���� ��.��4��ѵ\\� ��������!�W_w#�<�L�펻h��i���{��������i��ԯ�e�6�q�52_3�ޭ-[<�~��{��ګi���>#��t�L�LO/>���p=���r}/X�v-]9c��V�,`��V�&!�w�sEEE�Y�87���K���~(��E�.�+��&�_�P�sPX[��y`�����^�/�8r6c]�%(��	��8\\X*���3�e*JK0_{��������K� �z����+���Y|Ԥ^V��!�9�B��Qn	\"�\n��rpg����У���1f<M�8��/_�<c�c������ӒE��_~���+ϴ�}���U�ܠ��n��:������F2�	�q��`�\"j۶�<�s����D���m���^��f��� \\a�fG���}V\n�ɓ�_U�q`?�����(z�`�Q�o����X�=�$8=����o◉8v�?F�|[oM\"j��\'�S���������z9��Z(�`�Z���ﯔE����O���sEY���<�{�йW�V0�y�7dp���I���@�̥�PZ&�t��K�s���!ܔ�����h���a���&5�.��<3��ۧO�y^w$����iΉ�>�4<���R�%$\\�ƦN����t�EQvv6���?�D�06��q�����K�|�ʹbK0h8���i�y���K͞�x1a��q5���(���hG��C���Q�r��D]4��.����N��]rl��5�n��|-�+d*�I,.�y�Ж��������S&�sҕC(�c}�Mtօ�\n�:\\H����>�S�T)� [6{��T��6�.�u�_s�H˹bw��N��H�R�@��/YJ��� �v�Xz��i��u⛘�@�Ǎ���}��-Y@w�y;�ܯ_���	+V��_��������|�;v��h`�㑇r��bcc�I��?��+Wҝw�M�N>�����O�K�ja-�;�L����i����=5_s�gWX�y�Ȱp�*�@������n�b�e�IF�R�NXG������:��6/?D߼���ɥ\nE�&�Q���|��eբra�&DH���(<*T���!~k�GO�K.$K~��ھ���S<嚡Ҋ%2����ͣL!��rP eg�B�U�s�3�;�Բ�N�K��&-��n��~��:�\n��:�3��?Z��_z���i�Yg6����g�})1���g3��G�/��cǍ�Q��*����C۶��[{������;��?�����KS�O�D�QU�����&�}���^$,f��ļ���+����v����6>ɡʖG�ۂ�gM��o0��/]П�P�9_X����*���U2�$��/��TY�3!���_����������S�e��	qNo/k\n�ռE{��\")z�M�M�-�������J�Lau�-D���\\Lfز��.�)\\tA��z���護ߥRa�Z�����t��7��_&���j��}ƙ��xf&u�܉��3K9��@�]��.��\"�����o��f��*-����G��\'}T�[0�@M�g�{���t�r�t9(��i����\0˓��)���isN&�2��$\nu��&��((޺����������_����=6���^K���2*�PM��Hd)�s�{�d��!,]�)��.\"�i,ݼ�4w�ن��Hi�<���w���4zz_����+��n��������}\'ѝ;w>}��O�u�v9oi	D`��)4m�d�ի\'E�7��F!�~�ȟ�|�Dz��g\\�A����M#O9E�;�ޟ9S;�1d��D��O?���7+G��Թ3�v�it�5׈�E�w��b�Ӡ ��%�@���7�����Ym:_m�\"�]�{涣���\"����`�Q�_!�皁����9nq%\"�$,B�t����m���x%���3J�mc)UX��M�H���C�-`�Z�㓆�\n��^/0�Y�Tǎ\0c��9�����`$K0Gy�4���4n���sϨ�%�{��4ŔIs���T	�(�~aۀeL�z�ң��ۗ~���Z��jH87;�o���Es�̡��Өb�{�С4q�$w�ٔ��$F������9�\'�e�{�ݴV��޺E�Q�,`Md%������{8�{`.������1�Ջ$ �Y����m�D�{JGY�a䄞23נ3�P�n��?�XйWj���v��m�����c4��Oi���t�eW�g�Y\'��ػ�ԅn��zZ�j)���=����nߖr��e�(=�)Uf���@85o�ޑ)����#�?� �]�����i���Y!���U�����S���n����X)��<�_�v	����񣩫^�v���h)�ɻC|����r����.���?�ӟ����疀eT?��^&��ߍHns�D{$�F{l�qs���Һuh�h��	����б����1�;i�9�|�B�g�t�=w��N�Fmm}��9��%�����Ϳ�v��/��7b�H���/i���2��]FF]�A��9s�������y�\n��`��H���k.�`wI�O��q�պ2�~\'��K��S|���ϧ�k�R��m�}�����v��\"�C<�f���E�%�	܂�B�v9�J`����C��t�1�.��*���X�PF�N_�)�Z���x�%Jn,����$`ƍO/��K�УO<A	���>��+u��0i*}��b��ƥ6F�1�8B4c�]i�G.[:��嘈sΤ�˦)�zjt�ƀ^o��*�׸��dd��ws���fI��̹W��}���z\n�r�t�_��}���v�G��\':I.9r~�wo-���*�N7pUE��qK����}�϶���m�;F��-^��v��)��\n˶D)B����S߾}侷h��f�]�< �_�%:wR���V��{u�&�\nK��+�)xb�)�q�����2=<,�*�Ԝf�>b�0q�&҄��5�s`���C�����QEU-UV�\nA�:�)���uzlF)|��uC��#��XSKF9����<%%��B��d�5��im�X!~����c4��]D�ki��4�W�r��p��8�����Z�Et���(����@ۂ%G�7eҤ��P7������r�י\0��;�������h�1V�f������f�#61��}�,��]rsr�G���+GL��١cG:UX�_t͛���z�=�\\s9�W�ZM۷�BJ��\'����O�޽�z6�u֊�]#�7y��-]J+�/�ˏ�:�����SO���M�i�Y�###h���ǟ���7mظ��˭#�����;o��^\"��f�=(��㹥TXRM\'\n�(��Jl�V�RyeU	��q�� ���/,v��:\"��5�-��sp���Y7k��U�B���ķ)t�ere��DYq�B��	��ay���z���c�Vs�k�,+�E�S����5���O=��,��\\P���[�U�^~�u9�z�Z���z���i������?q?c��y�&1t(�|���g��DK�,������h���*J����7�>��Z�l�%�6#���\n�����z����Ӽ6O����ӟ���~�D�-�I�6���s�`V1�U��m�m�%��ù�� �-���(����ޠ�F/�;����U��O�~8���=��-9WX�g_:��c��V�6j���*�HX�?���A��ƈ�W/���C1Bt���郏>��W�W�~KÔ5�-%�{�_�r�>��9K�?���w\'A�3��A�.���5����鶛o�\'{L9�|\"##��[o��s��%�Σ�],�_z���K����]\'��� ���%�U\\*��LlE%t�bC��[q1�x<EBt(MҎ�Z��k�����RV&2s靧Q���IR�\\\\�v,W�E�JKYG�dA,��1W�19�q�i��=����s|v݋�:�7�|�I.h,y���+h��-�ݾ}=��cԧOo����ʊ\nY��>SY=d� ���O��������	�vA�Z��n��:Y	��E�\\BW_s����v~��������wa>���ߦs&NT~�c,]Л֯v��Y��B�E�5	����ʹ�`�Ҳ.��`#��hģ��j(T\\v���F(ڡb�=l���<�i�fy��Vc���^m�3��c���]�����G���\0#<xZX��w�9��h�?�!A�krԈ_j�mC�5E!�=��\n�;�5x�{ =#2a���E��jP�^mv�;*���u�/�`i*M�bHUY+F�Ȓ��lx�袸�XT[2�4���O�~#:*-����g_гϙ2Nu�z}��g���-\'���ko���LQ訿�\"��xM��ЉxZ�\'!E�C��<@7�x�]������޻�S�vNJv���[n�����%vRz6���˩W;�r��}��%T]Soq#�qr� j+��P\"a�G�(]UE���qmI���b��Ջ�|^�F��kM�L�y���8��1{Π����;�X��xL�G�9`�5��n�Z���@�!��oQn9�������4��Ͳ4��dR,�;���\n��a�WWzN|���\0������HG���_�_�֦���k�34�����\n�~}�Apܮ���-C���n�١HN�:���2�;zŊr�9ޛ��QsйE;��?�稕��Q�54���:\'i�M������,�X>�Sq���ʨ����K*�����ʫ�J��Jӆ:���j��h�	�7�ݪ��0���I����9~\'��r����u�a��Ņ�\n�/d�@�l�v��AZe�@�s���7J�RP��G�����:�+��J>:u��,_�L�s�tszY40�u��Tꨰ��Nُ����[���~�[���S%��6m�F6q/�7)XֈGd�C�Y,5���(�E�S�آb\"(*.�b�(6!�⒢)>9�Rc)�M%��Sr�Jm�Hm�\'Sz�\nf��}�v+��5��(�5��e�+��������u��|DO��TScQ���cr�Gr\0�����Vth>T0`�2�P���R��3;���s2�t����\n�	5���r���ÔPa]$����-61�S�L\"��$�aK�[Z�c�)r�n�h� ��귶S屔����/�E�Bp#��)<\"�BŦ¬����چu��F��Zi�W�VQYI��QQn	�@J!d��ʟ��Xv�5�R�-�ϔz!�{3Y��N���r��/QlQ�1����bc]KM��\n�?����¢�,�3GE7��iA�4��K��ZF��=NI�����%CI)�UY綎�p<\0����5\n�2$T�a�`%?��	+�l�dڤ�k�~1���Sα|�=^ �B��[��P$F��k\n��BL��J����L\nlIa��O�V\\Ne��%^^ZIB������j��>�E�!\nO&cu�������X-Z���k���E���oRp���A��� �@B��~6��FU��]lzkWsph>E�;�����K��L��\"���m�V>`Ui\"�H���<9��_�1dp2S���*M\'?����԰>����Հ�W�ւ ����������.c�E~uX�5%�%�����x����=�T��?T��*�x���IRbe�S��M����F�K������h9�k��[b4�&�P\\r�t[ǋ߅�g���|0����y�6I⵱81d,�#���pR�\0����w����},��r(��`ل�שm2j��������ҡ�%-���cʎ� �Y�8�F�VG�֒��$܆�\n��^_���E�\n�L���D�&�M���9a4�\'�66[4�$�Mq��h!�h5��E.獱	1��.s-+��\"�b}��k@3����b17%t���ԋ�`��|���_X��ve��\n~�f�EXX�� 3b9���3/������H���=��9��ْF����c,?!ALx�G#*Rt���V5��Y���p���J(�pn�v�ly�}Լ��%L���qe�7Ӵ��}M[�	�eɹZ9�+~���	s�X�����#>�Xi��&�G�	�8~)�p� х��|�&By��,F�~\0��4��\"�xn����t�Nq�^�d�=�e�.�U��BU部��H��+)�H�^O�_�Ne�/���Qئ�ʫI�d!�_D/W��;�Z��XC�,z\\��h;!ѐy3\'����r��iӑ�F\'�ȭZG5յ2j[����뇱D��Bd+J+MAU�Rxl!FP���FX��)���K{�/(pRp�[ i�Oﭐ7�?���-��/�`�H���\"�����6��߽�t�d��l�H=z�F�hܞy����o��>\'�\n�\\M��n��U{(t��L*�:��c?-	���Z����Bc�	m\"����|�-�d�;�a4�6�>\"ZY�k	�0��ld�ra�6��&�ܹw}�Ñ=*�ߴaӲ�R���e�v�Q�gDZ=�m��������Å��6��K�����\n(SE*V�>1�߽v}y,��9�G:q<��lIj(8��`?��J�eo=�iK�4����S��y�l��ui#7��5�\n�\'$Y�r.7W�J��89�e\n�J�U�A30�d,M|7�\0��V�-�\"�r�jqto���Gi�\';�9��������k��/��\n�j��������m��U�7P�NO�u�FaɆ	AM���D��M�l�|fl�z�����\\�_F5�E]kZ�[VEeE�Tb�F���J�>��/�ϗk��|yI��S����Qd�	1X)�rK������p�p�n[��(2]�j�WY=��}\'����K�Z;nH��V\\�Ʈ̷8���ʏ�B��=Y��=��j�I�S#*�KB5=:��^;��=-�NiWCzt�gt���4p_;�\\��4�l�_�tl`��(��򳊤0g̡�C92�˜�ʊ�R2�7�����\n0����ܠN�����zZb����V�o�1E:#�s��_`��F|o��L�=����|B�cK�g��!��(�X�S�84HCU�P�	���n���(��mj)=FO}�s��)V�����������\"���@-7��+��Z}��@?m2�_�4��vh�~#�9l��ǌ�-�H�Ŷ+�H��t��HY�F�+3�0f	i�J���SJ���K���K���.�а)Ұ�]�C�`#��tB�ŀ%�j�4�~+�`���u��x�������o�WԳ3��9B��}�8�?�y^��m�������K�g�x?��U��\n���-�N�\'Cy6�6 \"BM]e��zS[UI����\n	\n���0�	��oE��﫢���PdZ���FP^9щ�C�&�~�H[���=bZ�]F��]lیR�!̟�6�L!����e&�~u��^�o������zz�O=������YO�ǧ�ӫ�Bh�p�ng$�:M�sbhoU<ek�<2���ɤMN���%%Rh|��ESxt�jSP�)����:��H�ܟ4�5Ȱ��\0#�\\�f��M�R�\n����:��_Z\0>�?�nTZ��`%z��z-�U��A%\"MXegV�у�rJ�X],�:Sp\"\\� 2�$@���������ʣi��2T�.s/QM��N��;S�P�\\���2!�F�!�~��{���!�+����_��\\=;�H�-����sK���Q���X�rO<��J���tܘ@�Uv��*q.Ĺb��_0��ˑ*�7����ؒ�\n�r�^�Q�]&H0.�/D���k�i�Qi�XegiTmy1�VSY��r2������ �3p�b��W�I	5y<��[$��=N����2+iGV�<QH��mwv!��.��ޜb:�[L�J�HA)-(��E�t��BX��WVI��T\\YM%�5T^]K5:���	�5�n�)�(�3l:qj`� ��h!ц�D	���5F����t߯zzTX�����B��h�-{S-~�i��7�����>}n��2s�^4�̮J˽@��h���^��X���.x�jӼ�o�Co��ܿ�֛�]۶r��EE��˯���C�YcΔ�Θ;w>mظI��u��jQ^��W�3Ͻ ;��={��_&������Ң-�6�w�~+��L�F�{���-��矗4�w��O(G]��h��C��^���ӏ?��{L�\0w�w�YT;�GUu5���+r�S�Nt�-��}�~�3���w?жm�)22�6�_-+���;�b��*���D��:���RǮQ�ҏ��x�v/�_���eH����Q�:S�)	�trl�߅>I�C��M\'E���T�4uՅ�:j�@� ޛ�\\u	�>�ip=*�0J����`�����O�<H���;����r_�ϙۦ�t�10O>�W*M�A�������^��o3Wӡ]	��/@���WZ����f��c��#�K�~�4��޽�,1�[��[o�+�=ng)�Q�r6�}�HK�sS~622R�*��x. �[^<�t�ED]{����~�C�F�v�	)�����KgQ�N�u<)5��F���I=�פ�����,�dma:=���acT�*�tςi�xh��ʣ؄@k�ɑ\"nz��0@����Q���C�)L��P�&�1�B�QtJ�!D���P��cV��w�GuV����&ڴ����-62]����fс3y�n]O7���fWơb��칈�߷+�ɴ�=7�g����:�f����0�nmM�KՏ�.h�cX���ePCQ�@��\"(1\\g�4l)NU�ZFĲ ;��j�W�����j���$������(������8U��up)�D�� ]��ՔU\\N�J��|{V�:�M;2�����O�����+d^cK���m��v�)2����W��o/ku�d�v��gխ��*�����رcT]�j@��jkke���0jFo!F��!ʾ����4�Zõ���n Z��f��g1���s���;��y�Z�	�!�I�	����QD���S����T�g����A1�6�q*�H��=&��mǏQ�_>����5{E�\n����F�����N���1�G�K���@�z�,�S��o2�z�몥�Q\n�0��h��M���L4���t\nm�4�c��B�Q��+��.h�9�;W���#&>\\Z�N�B�&�	N͆�hݢ}TY��f�\'���3w�$��$B��\07���?����P�]�3���܏O\n�����z.��@��e\nNܞu��}��P����H�B�̣�����C\\kCn�H#dK�\0o�A#6\"�C)�4�8�3☆*��V�4T-����v~��J�T.~��^Q+D١�	q�����߅%lzD�T�B.�[�m�цPX\\ӭ���h�=Hv5�XKaV\\d?�����_`Kt\\�ށ2NJ�Զq��*Fdsan9ݟG��b�����atÓ���U<.�b �q�Jjp��Y�baW��m�͐��aAtR��D�Q�9ҋBg���9���\'I_[K��Ati�d�H|�9҄���ɟ�,�QqA-�$ES�wPiIU�*	0gl\n�2f���L�\"]\\e-D\\��Z!�doC&�(�1PY�Q3�G���V�c�B�!�b˗ZBBL8���\n5�?��(#�\0��O�]`?]�R�(�M,�G���O#ԟ8\\H�-�\n���0��q`�P��W\n/4�`봡���@��\n�j5ԵO����\"����[QMEB���s)����0#VL	�ݑ��[dȝG�;������R��4PHd4��q���kٔ_Y�\0�\'^�G���Ք��T���m�66��bK<�\\Oy�����B=�ϫ���x�H�b�b]!�v{��P�����F�Z�X�%�,����.����4���I4��.ԹW9��:,��G5���;�������T~l��D���z��Ñnt(��B�l��/ߔ�M\n��ymMs�)?}J5��$��%��{K��\n���>��-~��\0*��9�����+DZ��֋�Z���*u*N�-�^G*K�H��qL�E�	X~����e��\n���TJ�?��(\'��8߼��r��/�g˶K�6�c`;JlCQ1a���Z��_ �A?��e7ʺ��?��\n6ϓ���GSxd���o<�6.���K�����ݢ�itriBC)�Ϩj�]d(�/����0�)�F%P�H�7�o�[}���--Q�25�۲���}�i3�w��\nb���#z[l�Rգ�Z��y�S�%*�z����%�����b�p:U�X��4�@�bw�\0��@�zκ�d�|�P�޿-%��PDT���U_ƿ@`�?�/�X(��j.򢡢�`�ERM�q�ǚY�ә����e���y0���zV`�UA�$w�`J���@�5յTSUKU�5T����T\\PF��%��Ht�Heʥ��9�},��\n�0����Je��ʲJ��\"��).1�Rc)9=A�F�`�\nF�`�Ni�HIi��k��Bq��g���-��k� ���ҷ� v��ֱT��lfռ=�j�n��8�g\'��+l�ތx��UF9�_��Ҳ\n���&c�����*\n����j�(+�K:��K!!�ETUPHA5��ѝ�ҺP�QO�a-J�U��r�PK�S[BÅ�*�`�P[������P\\e�I�Z���>�f�q���	vA�p�|��\"1J�pG�������*-��?@\'�c0�:g�\\��IzGeR�Ȇ+5 �X{��E�^}���@xD��S�6=�!�(��0Y��[��E��:A5��7��Y���\"�pc�\0�(�3�	�ҭϜ��|���#��i����eGv�*���c�w��h�46i\'i�w�L�3�7?ʃ�9��bG֪\'�\0O|��\\�l���N�(�����9`�$)5�Μ�]i1�����W��/�怤r\"����n��1A�r,\",�\"õu[��b�9�C��{��\"|��`:^ݸ�\n������*��V#��T��y^d�3YĦs��,YDA�9j�/���g��뙘F	`X|��*2t����Q����&���\'��n6�-�f\0�gG M�z\nk�U�.Ӻ�>���f��{d6u��.c	~>�h�t?7���a�h�l��ڦ}S��Q1�R�]m���TTi�^��o�O�������W�^^\\�^��7�T�U[�L�@ҍ\0%-6�pk�\0�f�\'�s`�B���zNЖ���#N��\"����\0@�s���.ں�Jl�U]Y^M�eUTQZI�%�T�_&-���5�F	��\",��Fǆ�ɧ�SZ��-d�&�5����uGP��He�T*���ܴa�Ll���*UU먺I28�@�GB�il�N�p�چ7^G�XwNQari��C���J��Y�	v�Pu���bc�K���3��.h䣵� �^��7�PI��J-�����4�3����AX�I����~Ҿ<)4�t�-���G�QNԖ������(���2�ZR����G�8fz4�S�;[�[�+R�%	A�p*/���凝�>��Eƫ���6�2Ǵ%��<��wr�r�Fa��`t��NRZ@�F�ź�`\\�U#����Ez�wo��շX|�⊹_��Fў�6��]J�%��[YQ-]��U����\\�AVؔt���H��Hp)��W�n�&4cI���M��H�e�gl��M�V&ܐ[X�\\��T�5#�fl���\0#���<\'�J��ь	�Rd�a\\B��V�\n��r\\\'x\n����V��ΰ�T�Mgб�NH-�R8-E3<��b\"���HW���ι��g8.h��e)4��ӗo�����\n-L�n���18\nڷ��JG��[f�Շ����4%tr��`���j5��ƣl���2��Ұ\0�l���*�fĻ���B��6��~�Q4�3��#0���n>c5���������|`�^�\0t=�#�zڒ��5���YA���G����&\'��(�=؅��Q �°n\0�@X���`�� ��	�칠g�~���RF.�V��]�B��9�Ҿ��su�2bM�_�!��jw�Q���Oм퇨��{B\\��E�Q���+���n2o�_��c�{�[�����u�xx?x_�����_�_%D�i�`d�ib%��h�������1����S�&�Ar��hӑ:ZPB��S�zm����5=�[JM���������5�����]-��Τ��h��c�Ze �����*G����t�~���C��t������iVâj�Y� !�Q���Ҋ��cF��c\n�SJR���Qrr%��S���.A& �j�,�V7�G���TQf]L��J7?u���A<.��0|�R|�?7�m�^�C?o8,�{�\'�Ȯ�I��(d�N*\n�ʠ`��V�	�Z�Ҙ�k�V��-fiC\"C�N�A4Ä8��-�iQ�!\\��pq\\n��QOa�{��WShm-��Il�Z��������>�CHF[J8E@�������H��۲���{h��J�u�����|`����!�\"��1sy��jr=�F�ۧ�}O����)a���4�Rb)$��5�e����e�4����($%���o\"Yd0�j���Nݓ���G�>m�=��\0��D|Ayu�g�\n�^\'�.��:$SHj�ERPD�/W(�+����X�_FeTYT.�\n�*[I��VQMy5�Vֈ�V|�:�e���u�]|Ou�T��<��4�Y�2O�xt�[�(���]��Z�\nv�cc)<R���\n[���|�Ȃ=�^t��ʒ��{t�.��Y:�^������d;��@Š�(�*�}�Ȉ���8�#CY%��j�6I��Fd��3��:�:�Q�������۴������	/ĺ���ɶ�&<�:��i�Y�ɰ��mֈ���|��J*.�E�z8cjxZ�声\0{�V(������r*��!=d�7hSsP��)����Z�Ȓ%�M��Ԕ=�����ʪI�.�\"}y�h�G��W��T��C��n�#�[<���@�������6>Viy`#�\\yf9�_m�;}+ѓ y����@�J�4���{�t����/X���2��hN!�J�����I�9B���(-�#��L��Q�(�o����Z��G!ڰ��zE���/*���R��Pmv1�dwl��}�^\n��^iy`��|��z�m.�k/m\\��j�\\��>�R��)G|`�u��;[����׫vQqE5E���C{z�\n�^@}����Ģo�{ݜ���X���,�P�/6�@�$��1`�cT\\$EF�+Ϙ0�x���O�%�M�6w�@���(-�AX����#��k*�xO���?ė��\\|���T��A���<��XQZZC\'��Q��$󳋨(��J��Y^Z!����Ԋ�O/-WT)\n���b�)!5N�N�B�S�M�d�NJ����\'���EC4����V*�9^�TdB����y����C Y��۶Ԟ�U�g��,��l��+lXv���ힹ_a�����N=Rh��(*�z�Ӱ�Y��BS�}k}�|���̕#���6V�K]*7+����+�}�/W\\R�l7���uz҉�T��+6t��\\7���$��(Y��\n�X��LĜ>����DiyvA�/&_��0-�{@i�>��\"c�h6TK��a����(1��01�����(�M�T~�Oa���0zi�������a�)#�;���i�.��VnTZ��\nS3��Ĳ�H.e�3Gi��~�?|���0,�n��#��КE�L8�DHX0>�=u�FqQ҅�Q��`��[].���ܡ?�ɪB��i��O��郻�}O�-�q�L.oX��6=�-O��1�k^���`�(�/^c�8��㽗fU_^MG����2G^{Jiy�v��`�z�-VY�[n8x�F��B7>4����Lm�#(6:H�U��e܏��A�N_3:!`5�|��K����Cp�%C�L�l��b�6\"*��c#��7>9���Qrz���M�J������1M�Nm�(-_o�/�h����Q�^������髐{��ط�_����a�;�duH�<w�L3��֍	l�t;\"&�[茍�3#\0���J٪ep�����T�P-�!�����\"���8.7Xˊ�\\m��kA�Y���E�~CY��-��]�z!.2��:|��j*���E\\�^?��ur��Ǐ�-M�]�Uh�UF��,���3�H��e�}O�����J�!p9g�^$1���\n�w��������2C�%�<D!mӔ�at3��\\E��أ0��֮���\\|�Ƚ��9W#s��CjuF������Z����m�VreY��6���q������:\\�rVw�������32:����G��`m/�ׇ�m_��`$�3!.,�q\'F\'\"��Xۋ�_Ua8&!J.�������94<T�Ʊ��\n�z_�i��d2��<�=��fTZ2�^k��ֽ����J���/���\"�q�g�4�q���>�ӕ���iq�4�e���� F\0����B=}��m>�#��:�Sߌ��iP�����P.9N������mu\\�a;�i�$��\\��;M�-v�?\0�aM��#߈~�:F�͝7P�\0/,�b�H���g���+72�Չ��#>w��y�W�) \n�$;&���[@�ʊ+����*J+e��9�����jk�@*s��X��d�����&�HlX��_���F|��ַV��\"�`����C_���i��B�L��}u�Pv�5T���_�����&���	ф������f���E͉\"eφf�փg]�X�����DK���vڳ��~�Νї��n�����)�.h�����f�j.;�u���IqA�8�-�j�,�=M�FO�c��G��eQ�PQc��/\n@���\nF�<4�6�����-7f�´�	�JA�E���a���-ek�Q骽J�vA7�gn0��}<��7ﮣ��JK}�M�I}�4q�A�&!ƣ?��\0/�p�����_ؖ���7g��C\'d{h�4ꗑ*�=MPm����TTH��ux�����:)-�l4����s7��\\TI�o����х�A�tK����\\�L3����\n�W�ŷ���a����\"+�7ЕUɵ��(�D!m���w��W5n`9):z�.��������Z����H!�N�/����E����V�X�`\"o��9g�\"WBA��2t����ݔ����w�½��\\n�Z*���0�2�h	}��z���iC��:Diy������t_y�vkf��Zڟ[M߭6e����#�x� �FWK=������ؗ�\"(&Zk��Q����\nNJ ��B��H�&��\"\"H#��F�%�s�^�pA�\"C0�����	0:���Px� �\nAX��6$�n}�t1��8�9bq�y/�m�h�,�с�ԁ\'Y���J4k�>�)����(:�䓼��>Hc�3b�H+�k���Gd�2w��Ǎ��5� �J��`�]��5/��ټ�!7����*���b��R,CBL≟�u�� �f�LyK|U�q�\"J��2�\0�e�X����a��L�����/�����\'���U���T����-ɴX�Y����)�����G�[�;�\0��gu�0����!��{�50�ay/7�����#DG�_\"�w�Fd���/0�h\'����l9JC@\0��c�|�~�A9G/:+��K����[+Z�B��b�&�n���0_G^E��Ba8@/]|8`����9���:����A��� W�s��\0@p�ed|{�W�V�y�R`�H����Zx���b���G�Q�s-�b���0��(J���E0��=ߢ�W\"�q1A p=�[�-�ғ�-\0��FF\\0��F������Zj�qnD��:&��B�f�SH1V��&Xe�0���I��������3��r���Ǜ��B���>�+�^i��0߄\0.l�Ν��>�DVմ���A�SE��*k�T��#ژ\'���pL/^d ��Z��׍����ࢍ�R�ʾ����\0������S��������{��StcUi��r��d$ta���\0�:�������\"9�O�fc���f�\'�Mj�9�͊����V��!�_E��Z��-���Q�� Y������זV-�\0A���С=�u���*j���������56q��Φ�Q9\\wˉBB�):6�\"�B)\"R+~FC�bx��#axb�#�Զ1#.$G����,����>\'��1�]��b�2�^Ų%�l�w]��}Y���q�h����ʳbk�V/��໑+����}��[�%dV��G�+M{�3f�N�<7��Ei�G�x^s,�,�W|���Wٗ��!�f�ôj,nR�kq��@&����\"�QB�-�S���&�\nІ��\'u;���0�0*`1da�a�[�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\np&,�q����*w��=�Ts(�j���PZI��%ŝ����F�q���Da]R)�w�vL����\'��j�1��w�j�擮�����s*�5bD*>O8iSb)�C2�wO����gdƽ�\03�ת�ǩ���T�t����&�b�@1��H!���l��,���{���T�7K9�D4�v�ML�\'w���(�	�aZ0���:*�i�?O9�>B2���k��01-��{\n��t�t��o�j�1堛�?~�J�a,G�+�i,�L�\'��T��Zҗx�JS�\'P�\'/��B�=Dͱ|�z�a�g�=W^-(2LZ�m�9�4�R��a|`��R)���������/ �8n�\0J���ϫ�~4��~YC��j��Ѷ���[�1�+z� �0.�̴>F*�u5���j�A����(�4�H���R��S����/��P�e�R��� .�a\\��iUk�t��ߩd�f�zhB����yr)b��Gn���`1w9������s��,�L���7Б�?v`RK�P�\'.��3�(\\ˣ���� ������H���|�0����G���`}\n��������X�pY��K�_Ps$�]�^�:i�a��>F#�}���W�Qm��F��r����f�W�8�z�	:z��/�`�v�9�C�o�iJX�0�CX����x�F*�~���M`����.�!���{����PZ��M�����;�,��afCY��.��!��l�}K���>�Q+�v�-߭�����	h�=����*�5��x�u�v��,:rק~gQf�1����W`f����r�Jkc[\0���_��nN��@���u��=t9Ŕ����0�%��	H\0t��WI_Z��?�N8�q2Õ�J�u��%8&�:{�x���c	[�L@�4��,��X��ٺ�Y|����g+-�a̰\03	r<3�C�❤/�?:�x`&�ڕ)��2����U�0>\n0p��٫�1>��(w���0`f����9��d�.�Ti1����J�*��XQ}0G�c��	(*�Q�_��P���00P \0��]*wW��af��,�~�ej��+{ð\03���w֚E�Q��d�}MH�r�Ki(�Ԟ;a\0�E*է�D���00P���/�	�N3o��G�S������@y�;$^r*�{�RJx:��j���K|��1è0P���/\0�781ZiE��P�<�&,������º�Rh�$��2N=�0fX���B��48(T����I1�M�UZ�%�}�,�P�FC�S�*�a|`&���\\�\"�vw�Fi	�~��+�5���WO����G%��C�=�aX����W:���ݕ�z�&�|0���ÔF=��H�-�b�N�Q��af���8eO]��7`��@�ɞuC��lk�E�Sh�d�����W`f��N)ʞz`�782LiY ����픆g�\'�f/��GX�Te�a`&��8����΂��z6*z�c����u�{3�a|`&�m�H�du�C�╽�D��d�<ɝ��\'Px��J��PQM5���0����k�$$�G�C1���ш�U���nf��zmrs�@W��l��\nZՠ2T�I김�\"B(���S�+�\03G��nʞ:D�i��(�s��g\"rpe�qb��G��~���y�Rn��O���5�d�*_�W9`\"f��ʞ�I�q��q�_\n�0�0p`8(<Tiy�6�»[��˫�x��e��<�%H��v�\n���㸩C��j\"B�\"���:��H��5��L�m`��N说�,�L�A�W������5a��m+���}\'HWP�1�ՆuKWZ�	�H� !�f���)n�\0�eM�#��_�.�A��җTR嶣�Q�\0��B�!�dt8�0��\03I�����mºZk��#�\\<{�r�D�}�=Ǆڙ/�;��\0�s&\\4Bi	�F��`�� *_�[�31����%4Jh�Ϥ	e_��& A�)C���왨ڛ%˖픏f\"�7�\\*r`ge��Ў��Umi)�&�>�Ti�A�M \"��ID��ދ�1�-,�L`�!J�}��ݞ(�`�.�X>�f�G3a]ڈ��y@�km	���i�k����e3�;�+{&��� �E\"d�\n�	WZFX��{`�!,�L�QJ�y\\�B�NBl8�D>�+�\\�VŜ�[i5��!m���M�zt���ϖx٩�}��?�*{&������9����,Ⱦe�,�a,�L@;�?�zi���B��ES�W\"�����H�3�p�pi��Þ�ٌ6.��)�l[�|�HnQ{��*7VZ���^�3�D��j\'_U_��akX���\'큩^��$E���.[n�T&�PD&�	�LA���[�Q�(S�Y���u�f��\"!H��۞&㕫�\"���Fc�*��b�\0����n�O�U\'����_R��}JK��P�/o������������-�8�f\n�X����ߔz�9J�H_TN��{�2^��*�����H���p���P]��g���w;b�)V�a���\03����?�e��+GL���\\� ��/�P��J���n��[׋9�}S_�._�iU�!�?Q�Gϯ����B�_\"CU�lے��t����>�f`��!c�Ni�S��:��$Lf��G��J�Q�`ktTj��)���V.��y[�/(�n�\\#�0�o��0�Fh\\����\n��x��%IA���.Qi��9���g�x�)��l�.�hƶ��­ʞ}j�P��|��0�ڰ�i��k)V�c�E͡\\��x���z�5�O\\@�g�SZDY���J�+�),��_�G�Uq�����W\'��\0�F��l�7�y��k{@�cF��ˠ܆x_�W��J�i��gX��VK��L:|�GD6�=M�9)��iJ���)\0wt�?�H�#>p��dԙ�<��3(��1rߒ�e�(��o����|u�\'/��=EC9�0�K��i��x}��n��H�w�[�HX�\0�,�S��4�/(B�\0���?�Wix�����+z�/�4`�U����_�ʫ\"�/(3iP���A�Z�ʲ��Mʞ	������v�9�����,���t��^}a��wX��VOX�4j��r.�[���M�35Dp�F�����-]b��:���-VZ&j���(io����BE\'�a��0��N)���&�U��& ��KZ�P�9,�Z;ˆ�~[#�KPz�L�^\0�o�7��zE%�	DX�F��0\'��JA�s��	#-��m��P��g\"�����9��=�M1�Ȣ����&��9_�i1,�cA�Im����RpB�r�3`T�\\��]�ƔXÂ�M����@t^M�+�(G<��<0�bN�|�i-�\03����+=����5B����*L/_�_i��F�?y!Ŏ�N�0L�`f;@�;�u�G���%\"���Ϸʘ�AA��ʕ=����0��a\0w�\'���U��-UZ�Tlt�~���j�ܥp�0��a� �>��3�F*�u�Ұ�r�� �*���=�;\\1��`f�F��d(������h�Z��lL��W�0��af��:޸���h$а�Pd�����%Hޠ�3(f4\'�`O��0.KX�	[��u��xK�$���-�������#�x`�iu�:�Xίh�a�֯G*�g���=d��\'.��H������!�4��\"���\\9�2����zQ͑\\�}o��Z@�T5�9_��.,��L��gӑ;>&Cy�r��@���O]Dѧ�T�0�-��0�D��D%7�	{�e�_�Q`�i�����M~\'�H����N��0*��0-$�{:u��V��o	2��CS)�nB����x`�qX�w���0�l�yp*Ŏ�+�Q�b7���C7�O���:�F�n�KWR�Г�è	[��Fd�wo�9aD;��j�b]��a�`f7ޣ-u��&9����~��P��B�yҗa|`��\0Ș����(8>J9�Aa!��)3��r�a_��a<Dx�4�x�\n\n�\nW�x���;�bǝ�aƗ� ,��0U{O�af�x�i��+W�����$l3��	�F�w%G`��L��U�Ƨaf/���N3o����g@�Uڃ�8���,��%�D	naO%�I6�J�c9���<�0^�z�	:|�dtg���2^����uU0���0^: Y���䚒l\\����`f��:>�Q�o	�j��\'�`��aTB�0�u4sN�v�d�9��l0�?��0*�-�2^����#��s���Q�����a��b�jO&��C\"���I6����\\X�a�����ޖ:��x`V]��p�0~0����Q�o��h�����S)j8�lp���;,��C�n��l�1K&ٸo2V`�\0�����u����1uzi��{�2��]y�a�@�-`��A�{���o^#��Q�0ng�a\n��Ƈ�啐6)Vܩ��a`�a�QvA3�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0�\n�\03�0��1���a�a��Nodf�aoSYk ����0�0�0B��[�3ɮf��CF�6��(6���x��1��̏��\nV�MS��Q�a�i�?-xki@-�8\0\0\0\0IEND�B`�");
INSERT INTO tbl_usuario VALUES("10","11","MARTAA","2","4","$2a$07$usesomesillystringforepCRNlzAkcyyd4Bfx0fASQhKxxibp2PG","","ADMIN","2022-06-14","","","");
INSERT INTO tbl_usuario VALUES("11","12","ROBERTA","1","8","$2a$07$usesomesillystringforeukT9pn6N5sQ5ObfxLP0kReQ1pPthft6","","ADMIN","2022-06-14","","","");



SET FOREIGN_KEY_CHECKS=1;