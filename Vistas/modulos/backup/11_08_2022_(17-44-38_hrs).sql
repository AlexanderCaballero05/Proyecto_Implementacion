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

INSERT INTO tbl_alergias VALUES("1","ALERGIA AL AGUA","EXTRAÃ‘O PADECIMIENTO","DANIEL","2022-07-27","","","2");
INSERT INTO tbl_alergias VALUES("2","ALERGIA CUTÃNEAS","REACCIÃ“N ALERGICA QUE CAUSA UNA INFLAMACIÃ“N CUTÃNEA QUE PROVOCA UNA ERUPCIÃ“N ABULTADA","PAULA","2022-07-27","","","2");



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
INSERT INTO tbl_area VALUES("3","PSICOLOGICA","AREA DE PSICOLOGIA","ADMIN","2022-03-17","2022-04-22","ARNOLDIÃ‘O");
INSERT INTO tbl_area VALUES("4","ESPIRITUAL","AREA ESPIRITUAL","ARNOLDIÃ‘O","2022-04-22","0000-00-00","");



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
) ENGINE=InnoDB AUTO_INCREMENT=1432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_bitacora_sistema VALUES("1","0","54","2022-07-25","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("2","1","1","2022-07-25","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("3","1","54","2022-07-25","AUTENTICACIÃ“N FALLIDA","EL USUARIO INTENTO INICIAR SESIÃ“N CON LA CUENTA INACTIVA");
INSERT INTO tbl_bitacora_sistema VALUES("4","1","54","2022-07-25","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("5","1","13","2022-07-25","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("6","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("7","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("8","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("9","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("10","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("11","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("12","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("13","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("14","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("15","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("16","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("17","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("18","1","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO RUT COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("19","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("20","2","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("21","1","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO LUZ COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("22","1","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO JOSE COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("23","2","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("24","1","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO GABRIELA COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("25","1","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO ALEXANDER COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("26","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("27","2","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("28","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("29","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("30","4","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("31","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("32","4","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("33","6","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("34","6","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("35","6","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("36","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("37","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("38","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("39","2","14","2022-07-26","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("40","2","14","2022-07-26","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("41","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("42","4","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("43","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("44","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("45","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("46","3","54","2022-07-26","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("47","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("48","5","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("49","6","19","2022-07-26","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("50","3","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("51","5","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("52","3","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("53","5","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("54","3","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("55","6","19","2022-07-26","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("56","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("57","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("58","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("59","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("60","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("61","6","19","2022-07-26","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("62","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("63","1","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO CESAR COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("64","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("65","6","12","2022-07-26","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("66","7","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("67","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("68","7","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("69","7","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("70","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("71","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("72","3","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO JUAN COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("73","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("74","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("75","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("76","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("77","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("78","7","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO DAVID COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("79","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("80","6","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO IKER COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("81","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("82","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("83","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("84","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("85","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("86","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("87","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("88","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("89","4","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO DANIEL COMO UN MEDICO");
INSERT INTO tbl_bitacora_sistema VALUES("90","2","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO RAQUEL COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("91","4","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("92","2","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("93","11","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("94","5","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO YAMILETH COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("95","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("96","12","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("97","11","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("98","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("99","12","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("100","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("101","2","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("102","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("103","6","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("104","7","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("105","3","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO MARGARITA COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("106","1","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO RAMON COMO UN MEDICO");
INSERT INTO tbl_bitacora_sistema VALUES("107","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("108","15","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("109","5","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO FRANCISCO COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("110","15","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("111","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("112","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("113","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("114","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("115","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("116","2","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO JOSUE COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("117","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("118","2","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("119","17","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("120","17","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("121","2","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("122","5","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO LAURA COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("123","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("124","5","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("125","13","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("126","3","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO MAJO COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("127","1","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO PAULA COMO UN MEDICO");
INSERT INTO tbl_bitacora_sistema VALUES("128","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("129","13","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("130","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("131","20","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("132","2","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO MARIO COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("133","20","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("134","13","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("135","2","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("136","13","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("137","3","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("138","21","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("139","6","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO CRIS COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("140","21","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("141","16","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("142","8","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("143","2","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("144","16","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("145","8","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("146","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("147","16","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("148","6","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("149","16","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("150","14","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("151","10","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("152","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("153","10","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("154","7","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO ANDREA COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("155","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("156","14","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("157","18","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("158","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("159","18","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("160","2","14","2022-07-26","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("161","18","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("162","19","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("163","22","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("164","18","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("165","5","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("166","19","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("167","22","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("168","3","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("169","22","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("170","22","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("171","6","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("172","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("173","7","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("174","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("175","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("176","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("177","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("178","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("179","7","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("180","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("181","6","14","2022-07-26","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("182","6","14","2022-07-26","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("183","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("184","23","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("185","23","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("186","2","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO KATY COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("187","2","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("188","24","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("189","9","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("190","6","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("191","24","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("192","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("193","2","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("194","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("195","5","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO DESIRETH COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("196","5","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("197","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("198","3","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO NAOMI COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("199","25","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("200","3","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("201","25","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("202","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("203","1","13","2022-07-26","INSERCIÃ“N","SE REGISTRO AL USUARIO ERICK COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("204","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("205","25","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("206","25","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("207","26","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("208","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("209","5","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("210","27","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("211","26","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("212","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("213","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("214","27","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("215","2","22","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("216","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("217","2","21","2022-07-26","INGRESO AL MANTENIMIENTO ÃREAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("218","3","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("219","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("220","2","46","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA SECCIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("221","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("222","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("223","2","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("224","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("225","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("226","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("227","9","1","2022-07-26","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("228","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("229","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("230","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("231","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("232","5","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("233","3","21","2022-07-26","INGRESO AL MANTENIMIENTO ÃREAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("234","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("235","7","54","2022-07-26","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("236","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("237","3","22","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("238","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("239","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("240","7","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("241","6","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("242","3","22","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("243","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("244","5","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("245","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("246","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("247","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("248","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("249","6","22","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("250","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("251","3","22","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("252","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("253","6","22","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("254","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("255","3","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("256","6","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("257","3","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("258","7","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("259","5","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("260","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("261","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("262","7","22","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("263","7","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("264","6","46","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA SECCIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("265","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("266","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("267","6","46","2022-07-26","INSERCIÃ“N","SE REGISTRO UNA SECCIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("268","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("269","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("270","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("271","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("272","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("273","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("274","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("275","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("276","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("277","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("278","2","22","2022-07-26","MODIFICACIÃ“N","SE MODIFICO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("279","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("280","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("281","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("282","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("283","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("284","2","46","2022-07-26","MODIFICACIÃ“N","SE MODIFICO UNA SECCIÃ“N");
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
INSERT INTO tbl_bitacora_sistema VALUES("304","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("305","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("306","2","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("307","27","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("308","27","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("309","27","48","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("310","27","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("311","27","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("312","27","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("313","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("314","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("315","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("316","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("317","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("318","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("319","5","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 4 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("320","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("321","7","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 4 AL ESTUDIANTE 4");
INSERT INTO tbl_bitacora_sistema VALUES("322","3","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 6 AL ESTUDIANTE 7");
INSERT INTO tbl_bitacora_sistema VALUES("323","2","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("324","2","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 2 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("325","5","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("326","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("327","5","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 2 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("328","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("329","7","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 4 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("330","7","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("331","2","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 4 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("332","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("333","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("334","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("335","7","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("336","2","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 1 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("337","7","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 3 AL ESTUDIANTE 4");
INSERT INTO tbl_bitacora_sistema VALUES("338","1","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 6 AL ESTUDIANTE 8");
INSERT INTO tbl_bitacora_sistema VALUES("339","2","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("340","2","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 3 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("341","6","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 6 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("342","1","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("343","6","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("344","6","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 2 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("345","1","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 2 AL ESTUDIANTE 8");
INSERT INTO tbl_bitacora_sistema VALUES("346","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("347","6","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 4 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("348","7","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("349","7","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 2 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("350","3","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("351","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("352","3","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 3 AL ESTUDIANTE 7");
INSERT INTO tbl_bitacora_sistema VALUES("353","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("354","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("355","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("356","6","23","2022-07-26","ELIMINACIÃ“N","SE ELIMINÃ“ LA TUTORÃA 2 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("357","5","23","2022-07-26","ELIMINACIÃ“N","SE ELIMINÃ“ LA TUTORÃA 4 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("358","6","23","2022-07-26","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("359","5","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 1 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("360","6","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 2 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("361","5","23","2022-07-26","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 4 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("362","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("363","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("364","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("365","5","14","2022-07-26","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("366","5","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("367","2","0","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("368","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("369","1","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("370","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("371","2","0","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("372","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("373","2","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("374","1","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("375","5","0","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("376","7","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("377","7","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("378","7","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("379","7","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("380","5","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("381","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("382","6","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("383","5","0","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("384","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("385","2","0","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("386","6","32","2022-07-26","MODIFICACIÃ“N","SE MODIFICÃ“ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("387","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("388","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("389","6","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("390","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("391","20","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("392","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("393","6","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("394","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("395","11","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("396","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("397","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("398","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("399","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("400","5","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("401","20","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("402","21","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("403","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("404","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("405","2","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("406","7","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("407","1","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("408","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("409","12","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("410","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("411","15","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("412","1","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("413","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("414","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("415","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("416","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("417","20","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("418","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("419","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("420","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("421","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("422","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("423","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("424","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("425","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("426","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("427","12","31","2022-07-26","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÃ“GICO A LA PERSONA CON CODIGO31");
INSERT INTO tbl_bitacora_sistema VALUES("428","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("429","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("430","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("431","15","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("432","7","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("433","11","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÃ“ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÃ“DIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("434","11","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("435","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("436","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("437","7","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("438","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("439","12","31","2022-07-26","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÃ“GICA ");
INSERT INTO tbl_bitacora_sistema VALUES("440","12","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("441","11","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("442","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("443","12","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("444","7","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("445","7","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("446","15","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("447","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("448","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("449","12","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("450","2","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("451","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("452","21","31","2022-07-26","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÃ“GICO A LA PERSONA CON CODIGO29");
INSERT INTO tbl_bitacora_sistema VALUES("453","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("454","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("455","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("456","15","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("457","2","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("458","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("459","12","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("460","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("461","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("462","21","31","2022-07-26","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÃ“GICA ");
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
INSERT INTO tbl_bitacora_sistema VALUES("474","20","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÃ“ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÃ“DIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("475","20","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("476","21","31","2022-07-26","REGISTRAR","SE REGISTRO UN PLAN TERAPÃ‰UTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("477","21","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("478","11","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("479","6","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("480","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("481","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("482","20","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("483","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("484","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("485","21","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("486","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("487","21","34","2022-07-26","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("488","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicolÃ³gico");
INSERT INTO tbl_bitacora_sistema VALUES("489","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("490","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("491","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("492","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("493","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("494","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("495","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicolÃ³gico");
INSERT INTO tbl_bitacora_sistema VALUES("496","21","47","2022-07-26","Editar","Se edito un sintoma neurÃ³tico");
INSERT INTO tbl_bitacora_sistema VALUES("497","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicolÃ³gico");
INSERT INTO tbl_bitacora_sistema VALUES("498","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicolÃ³gico");
INSERT INTO tbl_bitacora_sistema VALUES("499","21","47","2022-07-26","Editar","Se edito un sintoma neurÃ³tico");
INSERT INTO tbl_bitacora_sistema VALUES("500","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicolÃ³gico");
INSERT INTO tbl_bitacora_sistema VALUES("501","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicolÃ³gico");
INSERT INTO tbl_bitacora_sistema VALUES("502","12","31","2022-07-26","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÃ“GICA ");
INSERT INTO tbl_bitacora_sistema VALUES("503","12","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("504","21","34","2022-07-26","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("505","21","62","2022-07-26","MODIFICACIÃ“N","SE MODIFICÃ“ UN EXPEDIENTE PSICOLÃ“GICO ÃšNICO");
INSERT INTO tbl_bitacora_sistema VALUES("506","21","34","2022-07-26","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("507","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("508","21","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("509","5","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("510","5","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("511","21","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("512","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("513","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("514","6","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("515","11","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("516","12","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("517","21","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("518","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("519","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("520","21","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("521","21","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("522","2","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("523","2","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("524","12","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("525","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("526","12","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("527","21","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("528","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("529","21","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("530","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("531","12","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("532","11","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("533","6","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("534","20","40","2022-07-26","MODIFICACIÃ“N","SE MODIFICÃ“ UNA APARIENCIA FISICA");
INSERT INTO tbl_bitacora_sistema VALUES("535","20","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("536","12","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("537","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("538","6","32","2022-07-26","MODIFICACIÃ“N","SE MODIFICÃ“ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("539","6","32","2022-07-26","MODIFICACIÃ“N","SE MODIFICÃ“ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("540","1","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("541","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("542","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("543","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("544","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("545","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("546","6","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("547","6","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("548","13","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("549","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("550","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("551","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("552","20","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("553","3","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("554","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("555","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("556","13","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("557","3","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("558","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("559","3","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("560","13","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("561","3","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("562","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("563","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("564","8","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("565","3","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("566","20","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("567","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("568","20","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("569","3","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("570","3","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("571","3","32","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("572","3","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("573","20","54","2022-07-26","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("574","20","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("575","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("576","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("577","8","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("578","10","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("579","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("580","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("581","10","51","2022-07-26","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("582","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("583","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("584","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("585","10","51","2022-07-26","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("586","21","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("587","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("588","10","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("589","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("590","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("591","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("592","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("593","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("594","10","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("595","1","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("596","1","0","2022-07-26","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("597","10","48","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("598","20","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÃ“ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÃ“DIGO 30");
INSERT INTO tbl_bitacora_sistema VALUES("599","20","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("600","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("601","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("602","10","51","2022-07-26","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("603","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("604","10","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("605","20","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 30");
INSERT INTO tbl_bitacora_sistema VALUES("606","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("607","10","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("608","5","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("609","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("610","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("611","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("612","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("613","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("614","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("615","20","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("616","16","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("617","3","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("618","16","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("619","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("620","16","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("621","1","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("622","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("623","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("624","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("625","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("626","11","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("627","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("628","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("629","6","54","2022-07-26","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("630","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("631","6","5","2022-07-26","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("632","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("633","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("634","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("635","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("636","11","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÃ“ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÃ“DIGO 27");
INSERT INTO tbl_bitacora_sistema VALUES("637","11","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("638","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("639","11","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 27");
INSERT INTO tbl_bitacora_sistema VALUES("640","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("641","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("642","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("643","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("644","11","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("645","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("646","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("647","11","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("648","11","54","2022-07-26","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("649","0","54","2022-07-26","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("650","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("651","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("652","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("653","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("654","1","54","2022-07-27","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("655","1","32","2022-07-27","MODIFICACIÃ“N","SE MODIFICÃ“ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("656","1","32","2022-07-27","MODIFICACIÃ“N","SE MODIFICÃ“ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("657","1","32","2022-07-27","MODIFICACIÃ“N","SE MODIFICÃ“ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("658","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("659","7","54","2022-07-27","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("660","7","2","2022-07-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("661","7","5","2022-07-27","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("662","7","6","2022-07-27","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("663","7","3","2022-07-27","Ingreso a la pantalla de mantenimiento parÃ¡metros","Aqui se visualiza los registros existentes de la tabla parÃ¡metros");
INSERT INTO tbl_bitacora_sistema VALUES("664","7","1","2022-07-27","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("665","7","54","2022-07-27","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("666","23","54","2022-07-27","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("667","23","51","2022-07-27","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("668","23","51","2022-07-27","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("669","23","51","2022-07-27","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("670","23","51","2022-07-27","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("671","23","54","2022-07-27","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("672","1","54","2022-07-28","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("673","1","54","2022-07-28","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("674","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("675","1","14","2022-07-28","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("676","1","23","2022-07-28","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("677","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("678","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("679","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("680","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("681","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("682","1","54","2022-07-28","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("683","6","54","2022-07-28","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("684","6","54","2022-07-28","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("685","6","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("686","6","1","2022-07-28","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("687","6","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("688","1","54","2022-07-28","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("689","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("690","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("691","1","23","2022-07-28","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 6 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("692","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("693","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("694","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("695","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("696","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("697","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("698","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("699","1","32","2022-07-28","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("700","1","54","2022-07-28","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("701","11","54","2022-07-28","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("702","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("703","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("704","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("705","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("706","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("707","11","23","2022-07-28","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("708","11","30","2022-07-28","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("709","11","20","2022-07-28","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("710","11","20","2022-07-28","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("711","11","20","2022-07-28","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("712","11","2","2022-07-28","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("713","11","2","2022-07-28","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("714","11","2","2022-07-28","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("715","11","54","2022-07-28","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("716","1","54","2022-07-28","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("717","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("718","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("719","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("720","1","22","2022-07-28","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("721","1","21","2022-07-28","INGRESO AL MANTENIMIENTO ÃREAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("722","1","46","2022-07-28","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("723","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("724","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("725","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("726","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("727","1","54","2022-07-28","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("728","1","54","2022-07-28","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("729","1","23","2022-07-28","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("730","1","23","2022-07-28","ELIMINACIÃ“N","SE ELIMINÃ“ LA TUTORÃA  AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("731","1","23","2022-07-28","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("732","1","23","2022-07-28","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 3 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("733","1","54","2022-07-28","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("734","1","54","2022-07-28","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("735","6","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("736","6","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("737","6","32","2022-07-29","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("738","6","2","2022-07-29","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("739","6","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("740","1","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("741","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("742","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("743","1","13","2022-07-29","INSERCIÃ“N","SE REGISTRO AL USUARIO ANYH COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("744","1","32","2022-07-29","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("745","1","32","2022-07-29","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("746","1","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("747","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("748","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("749","1","13","2022-07-29","INSERCIÃ“N","SE REGISTRO AL USUARIO ISEL COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("750","1","54","2022-07-29","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("751","29","1","2022-07-29","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("752","29","1","2022-07-29","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("753","29","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITO RECUPERAR LA CONTRASEÃ‘A POR CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("754","29","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITÃ“ RECUPERAR LA CONTRASEÃ‘A POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("755","29","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITÃ“ RECUPERAR LA CONTRASEÃ‘A POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("756","1","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("757","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("758","1","54","2022-07-29","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("759","29","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITÃ“ RECUPERAR LA CONTRASEÃ‘A POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("760","1","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("761","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("762","1","54","2022-07-29","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("763","5","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITO RECUPERAR LA CONTRASEÃ‘A POR CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("764","5","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITÃ“ RECUPERAR LA CONTRASEÃ‘A POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("765","29","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITÃ“ RECUPERAR LA CONTRASEÃ‘A POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("766","1","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("767","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("768","2","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITÃ“ RECUPERAR LA CONTRASEÃ‘A POR PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("769","2","54","2022-07-29","MODIFICACIÃ“N DE CONTRASEÃ‘A","EL USUARIO MODIFICÃ“ LA CONTRASEÃ‘A POR EL METODO DE PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("770","1","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("771","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("772","1","54","2022-07-29","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("773","29","54","2022-07-29","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("774","29","54","2022-07-29","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("775","29","54","2022-07-29","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("776","29","54","2022-07-29","AUTENTICACIÃ“N FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÃ“N FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("777","1","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("778","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("779","1","54","2022-07-29","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("780","5","54","2022-07-29","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("781","5","54","2022-07-29","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("782","2","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("783","1","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("784","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("785","6","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("786","1","14","2022-07-29","MODIFICACIÃ“N","SE MODIFICO UNA CONTRASEÃ‘A");
INSERT INTO tbl_bitacora_sistema VALUES("787","1","54","2022-07-29","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("788","2","54","2022-07-29","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("789","5","54","2022-07-29","MODIFICACIÃ“N DE CONTRASEÃ‘A","EL USUARIO MODIFICÃ“ LA CONTRASEÃ‘A POR EL METODO DE CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("790","5","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("791","6","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("792","5","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("793","5","13","2022-07-29","INSERCIÃ“N","SE REGISTRO AL USUARIO ARMANDO COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("794","5","54","2022-07-29","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("795","30","1","2022-07-29","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("796","30","1","2022-07-29","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("797","30","54","2022-07-29","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("798","30","54","2022-07-29","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("799","30","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITÃ“ RECUPERAR LA CONTRASEÃ‘A POR PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("800","30","54","2022-07-29","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITO RECUPERAR LA CONTRASEÃ‘A POR CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("801","6","13","2022-07-30","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("802","1","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("803","1","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("804","17","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("805","17","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("806","17","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("807","1","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("808","1","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("809","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("810","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("811","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("812","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("813","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("814","11","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("815","1","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("816","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("817","1","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("818","1","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("819","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("820","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("821","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("822","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("823","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("824","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("825","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("826","11","30","2022-07-30","REGISTAR EXPEDIENTE","SE REGISTRÃ“ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÃ“DIGO 25");
INSERT INTO tbl_bitacora_sistema VALUES("827","11","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("828","11","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 25");
INSERT INTO tbl_bitacora_sistema VALUES("829","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("830","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("831","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("832","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("833","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("834","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("835","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("836","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("837","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("838","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("839","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("840","11","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("841","11","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("842","1","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("843","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("844","1","0","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("845","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("846","1","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("847","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("848","1","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("849","1","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("850","20","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("851","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("852","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("853","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("854","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("855","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("856","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("857","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("858","20","30","2022-07-30","REGISTAR EXPEDIENTE","SE REGISTRÃ“ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÃ“DIGO 9");
INSERT INTO tbl_bitacora_sistema VALUES("859","20","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("860","20","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 9");
INSERT INTO tbl_bitacora_sistema VALUES("861","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("862","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("863","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("864","20","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("865","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("866","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("867","20","30","2022-07-30","REGISTAR EXPEDIENTE","SE REGISTRÃ“ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÃ“DIGO 24");
INSERT INTO tbl_bitacora_sistema VALUES("868","20","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("869","20","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 24");
INSERT INTO tbl_bitacora_sistema VALUES("870","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("871","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("872","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("873","20","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("874","20","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("875","20","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("876","20","32","2022-07-30","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("877","20","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("878","1","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("879","1","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("880","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("881","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("882","11","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("883","28","1","2022-07-30","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("884","28","1","2022-07-30","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("885","28","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("886","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("887","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("888","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("889","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("890","28","54","2022-07-30","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("891","28","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("892","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("893","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("894","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("895","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("896","11","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("897","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("898","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("899","11","54","2022-07-30","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("900","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("901","11","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("902","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("903","11","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("904","1","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("905","1","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("906","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("907","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("908","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("909","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("910","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("911","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("912","11","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("913","11","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("914","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("915","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("916","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("917","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("918","11","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("919","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("920","11","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("921","11","54","2022-07-30","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("922","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("923","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("924","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("925","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("926","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("927","11","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("928","11","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("929","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("930","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("931","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("932","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("933","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("934","11","54","2022-07-30","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("935","6","13","2022-07-30","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("936","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("937","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("938","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("939","1","54","2022-07-31","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("940","6","32","2022-07-31","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("941","1","54","2022-07-31","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
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
INSERT INTO tbl_bitacora_sistema VALUES("952","6","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("953","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("954","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("955","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("956","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("957","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("958","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("959","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("960","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("961","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("962","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("963","3","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("964","3","1","2022-08-02","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("965","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("966","3","14","2022-08-02","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("967","3","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("968","3","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("969","3","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("970","3","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("971","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("972","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("973","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("974","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("975","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("976","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("977","1","22","2022-08-02","INSERCIÃ“N","SE REGISTRO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("978","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("979","1","22","2022-08-02","INSERCIÃ“N","SE REGISTRO UNA TUTORÃA");
INSERT INTO tbl_bitacora_sistema VALUES("980","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("981","7","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("982","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("983","7","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("984","3","13","2022-08-02","INSERCIÃ“N","SE REGISTRO AL USUARIO LUISMI COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("985","3","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("986","31","1","2022-08-02","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("987","31","1","2022-08-02","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("988","1","13","2022-08-02","INSERCIÃ“N","SE REGISTRO AL USUARIO VALERIA COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("989","31","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("990","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("991","31","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("992","32","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("993","3","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("994","3","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÃAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("995","32","1","2022-08-02","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("996","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("997","32","1","2022-08-02","Cambio de contraseÃ±a","Usuario nuevo, hizo el cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("998","32","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("999","32","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1000","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1001","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1002","7","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1003","7","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1004","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1005","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1006","2","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1007","2","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1008","2","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1009","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1010","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1011","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1012","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1013","7","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1014","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1015","1","32","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1016","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1017","3","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1018","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1019","30","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1020","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1021","30","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1022","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1023","30","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1024","3","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1025","1","32","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1026","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1027","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1028","30","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÃ“N FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1029","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1030","3","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1031","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1032","11","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1033","0","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1034","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1035","21","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1036","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1037","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1038","1","14","2022-08-02","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1039","21","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1040","3","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1041","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1042","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1043","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1044","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1045","3","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1046","30","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÃ“N FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1047","3","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1048","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1049","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("1050","3","0","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1051","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1052","3","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1053","1","32","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1054","21","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1055","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1056","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1057","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1058","15","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1059","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1060","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1061","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1062","15","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1063","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1064","21","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÃ“GICO A LA PERSONA CON CODIGO30");
INSERT INTO tbl_bitacora_sistema VALUES("1065","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1066","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1067","1","32","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1068","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1069","15","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1070","21","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÃ“GICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1071","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1072","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1073","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1074","15","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1075","21","31","2022-08-02","REGISTRAR","SE REGISTRO UN PLAN TERAPÃ‰UTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("1076","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1077","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1078","15","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 30");
INSERT INTO tbl_bitacora_sistema VALUES("1079","11","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1080","21","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1081","3","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1082","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1083","15","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1084","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1085","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1086","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1087","7","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1088","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1089","11","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1090","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1091","3","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1092","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1093","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1094","15","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1095","3","0","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1096","3","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1097","15","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("1098","21","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1099","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1100","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1101","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1102","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1103","15","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1104","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1105","21","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÃ“GICO A LA PERSONA CON CODIGO24");
INSERT INTO tbl_bitacora_sistema VALUES("1106","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1107","2","0","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1108","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1109","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1110","15","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1111","2","0","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1112","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1113","21","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÃ“GICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1114","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1115","2","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1116","17","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1117","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1118","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1119","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1120","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1121","21","31","2022-08-02","REGISTRAR","SE REGISTRO UN PLAN TERAPÃ‰UTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("1122","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1123","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÃ“GICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1124","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1125","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1126","17","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1127","2","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1128","2","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1129","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1130","2","0","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1131","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1132","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1133","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1134","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1135","2","0","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1136","15","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1137","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1138","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1139","2","0","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1140","2","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1141","17","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1142","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1143","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1144","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1145","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1146","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÃ“GICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1147","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1148","10","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1149","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1150","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1151","17","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÃ“GICO A LA PERSONA CON CODIGO27");
INSERT INTO tbl_bitacora_sistema VALUES("1152","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1153","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÃ“GICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1154","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1155","15","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1156","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1157","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1158","21","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1159","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1160","17","31","2022-08-02","REGISTRAR","SE REGISTRO UN PLAN TERAPÃ‰UTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("1161","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1162","21","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1163","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1164","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1165","21","34","2022-08-02","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1166","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1167","17","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÃ“GICO A LA PERSONA CON CODIGO9");
INSERT INTO tbl_bitacora_sistema VALUES("1168","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1169","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÃ“GICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1170","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1171","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1172","3","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1173","10","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1174","0","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1175","0","54","2022-08-02","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1176","17","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1177","6","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1178","2","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1179","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1180","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1181","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1182","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1183","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1184","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1185","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1186","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1187","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1188","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1189","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1190","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1191","1","32","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1192","1","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1193","11","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1194","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1195","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1196","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1197","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1198","11","30","2022-08-02","REGISTAR EXPEDIENTE","SE REGISTRÃ“ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÃ“DIGO 29");
INSERT INTO tbl_bitacora_sistema VALUES("1199","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1200","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 29");
INSERT INTO tbl_bitacora_sistema VALUES("1201","2","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1202","2","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1203","11","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1204","11","35","2022-08-02","INSERCIÃ“N","SEREGISTRÃ“ UN MEDICAMENTO");
INSERT INTO tbl_bitacora_sistema VALUES("1205","11","32","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1206","11","35","2022-08-02","ELIMINACIÃ“N","SE ELIMINÃ“ UN MEDICAMENTO ");
INSERT INTO tbl_bitacora_sistema VALUES("1207","11","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1208","2","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1209","2","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1210","11","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1211","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1212","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1213","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1214","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("1215","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1216","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1217","1","54","2022-08-02","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1218","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1219","1","32","2022-08-02","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1220","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1221","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1222","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1223","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÃ“ UNA CONSULTA MEDICA AL PACIENTE CON CÃ“DIGO 9");
INSERT INTO tbl_bitacora_sistema VALUES("1224","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1225","11","54","2022-08-02","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1226","0","54","2022-08-04","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1227","6","54","2022-08-04","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1228","6","2","2022-08-04","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1229","6","23","2022-08-04","ELIMINACIÃ“N","SE ELIMINÃ“ LA TUTORÃA 6 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("1230","6","23","2022-08-04","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 6 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("1231","6","23","2022-08-04","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("1232","6","23","2022-08-04","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("1233","6","23","2022-08-04","INSERCIÃ“N","SE MATRICULÃ“ LA TUTORÃA 3 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("1234","6","23","2022-08-04","INGRESO A MATRÃCULA","AGREGA UNA MATRÃCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("1235","6","20","2022-08-05","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1236","6","32","2022-08-05","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("1237","6","32","2022-08-05","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1238","6","14","2022-08-05","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1239","6","14","2022-08-05","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1240","6","54","2022-08-05","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1241","6","54","2022-08-05","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
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
INSERT INTO tbl_bitacora_sistema VALUES("1255","6","54","2022-08-08","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1256","0","54","2022-08-08","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1257","6","54","2022-08-08","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1258","5","54","2022-08-08","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1259","1","54","2022-08-10","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1260","1","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1261","1","54","2022-08-10","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1262","6","54","2022-08-10","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1263","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1264","6","3","2022-08-10","Ingreso a la pantalla de mantenimiento parÃ¡metros","Aqui se visualiza los registros existentes de la tabla parÃ¡metros");
INSERT INTO tbl_bitacora_sistema VALUES("1265","6","3","2022-08-10","Editar parÃ¡metro","Se editÃ³ el registro de un parÃ¡metro ya existente");
INSERT INTO tbl_bitacora_sistema VALUES("1266","6","3","2022-08-10","Ingreso a la pantalla de mantenimiento parÃ¡metros","Aqui se visualiza los registros existentes de la tabla parÃ¡metros");
INSERT INTO tbl_bitacora_sistema VALUES("1267","6","3","2022-08-10","Ingreso a la pantalla de mantenimiento parÃ¡metros","Aqui se visualiza los registros existentes de la tabla parÃ¡metros");
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
INSERT INTO tbl_bitacora_sistema VALUES("1282","6","17","2022-08-10","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÃ“MICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1283","6","2","2022-08-10","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1284","6","48","2022-08-10","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1285","6","48","2022-08-10","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1286","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1287","6","12","2022-08-10","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseÃ±a");
INSERT INTO tbl_bitacora_sistema VALUES("1288","6","19","2022-08-10","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("1289","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1290","6","54","2022-08-10","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1291","6","54","2022-08-10","SOLICITAR RECUPERACIÃ“N DE CONTRASEÃ‘A","EL USUARIO SOLICITÃ“ RECUPERAR LA CONTRASEÃ‘A POR PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("1292","6","54","2022-08-10","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1293","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1294","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1295","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1296","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1297","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1298","6","26","2022-08-10","INSERTAR","SE REGISTRO EL PARENTESCO DEL CODIGO 1 DE ESTUDIANTE CON EL CODIGÃ“ 3 DE FAMILIAR ");
INSERT INTO tbl_bitacora_sistema VALUES("1299","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1300","6","26","2022-08-10","INSERTAR","SE REGISTRO EL PARENTESCO DEL CODIGO 1 DE ESTUDIANTE CON EL CODIGÃ“ 4 DE FAMILIAR ");
INSERT INTO tbl_bitacora_sistema VALUES("1301","6","48","2022-08-10","INSERCIÃ“N","SE REGISTRÃ“ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1302","6","2","2022-08-10","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1303","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1304","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1305","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1306","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1307","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1308","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1309","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1310","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1311","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1312","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1313","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1314","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1315","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1316","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1317","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1318","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1319","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1320","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1321","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1322","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1323","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1324","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1325","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1326","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1327","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1328","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1329","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1330","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1331","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1332","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1333","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1334","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1335","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1336","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1337","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1338","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1339","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1340","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1341","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1342","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1343","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1344","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1345","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1346","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1347","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1348","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1349","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1350","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1351","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1352","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1353","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1354","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1355","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1356","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1357","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1358","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1359","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1360","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1361","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1362","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1363","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1364","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1365","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1366","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1367","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1368","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1369","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1370","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1371","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1372","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1373","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1374","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1375","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1376","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1377","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1378","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1379","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1380","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1381","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1382","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1383","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1384","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1385","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1386","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1387","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1388","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1389","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1390","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1391","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1392","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1393","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1394","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1395","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1396","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1397","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1398","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1399","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1400","6","54","2022-08-11","CERRAR SESIÃ“N","USUARIO CERRÃ“ SESIÃ“N");
INSERT INTO tbl_bitacora_sistema VALUES("1401","3","54","2022-08-11","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1402","3","54","2022-08-11","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1403","3","54","2022-08-11","AUTENTICACIÃ“N FALLIDA","INTENTÃ“ DE INICIO DE SESIÃ“N FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1404","3","54","2022-08-11","AUTENTICACIÃ“N FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÃ“N FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1405","6","54","2022-08-11","AUTENTICACIÃ“N CORRECTA","USUARIO INICIO SESIÃ“N CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1406","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1407","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1408","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1409","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1410","6","14","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN USUARIO");
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
INSERT INTO tbl_bitacora_sistema VALUES("1425","6","17","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÃ“MICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1426","6","17","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÃ“MICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1427","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1428","6","6","2022-08-11","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1429","6","5","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1430","6","5","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1431","6","5","2022-08-11","MODIFICACIÃ“N","SE MODIFICO UN PERMISO A UN ROL");



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
INSERT INTO tbl_consulta_medica VALUES("2","2","4","inflamaciÃ³n, dolor y ardor","grave","toda la cara"," piel muy irritada","","2022-07-27","","");
INSERT INTO tbl_consulta_medica VALUES("3","3","18","le duele la cabeza en situaciones de estrÃ©s","migraÃ±a a causa de estrÃ©s","al tomarse el medicamento se siente mejor"," todo bien","","2022-07-27","","");
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
INSERT INTO tbl_contenido_socioeconomico VALUES("6","2","AMBOS");
INSERT INTO tbl_contenido_socioeconomico VALUES("7","3","PADRE");
INSERT INTO tbl_contenido_socioeconomico VALUES("8","3","MADRE");
INSERT INTO tbl_contenido_socioeconomico VALUES("9","3","ABUELA");
INSERT INTO tbl_contenido_socioeconomico VALUES("10","3","REMESAS");
INSERT INTO tbl_contenido_socioeconomico VALUES("11","4","ENERGÃA ELÃ‰CTRICA");
INSERT INTO tbl_contenido_socioeconomico VALUES("12","4","AGUA POTABLE");
INSERT INTO tbl_contenido_socioeconomico VALUES("13","4","ALCANTARILLADO");
INSERT INTO tbl_contenido_socioeconomico VALUES("14","2","NINGUNO");



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
INSERT INTO tbl_especialidad VALUES("4","PEDIATRIA","2","ATENCIÃ“N A MENORES DE EDAD","","0000-00-00","","");
INSERT INTO tbl_especialidad VALUES("5","PSICOLOGIA COGNITIVA CONDUCTUAL","3","ÃREA PSICOLOGÃA","","0000-00-00","","");



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
INSERT INTO tbl_estudiante VALUES("2","10","TERCERO","NO","90","MatemÃ¡ticas","Ver televisiÃ³n","Redes sociales","Estudiar en la Unah");
INSERT INTO tbl_estudiante VALUES("3","24","NOVENO","NO","90","InglÃ©s","Ver televisiÃ³n","Redes sociales","Estudiar medicina");
INSERT INTO tbl_estudiante VALUES("4","25","QUINTO","NO","96","Matematica","television","celular","doctora");
INSERT INTO tbl_estudiante VALUES("5","27","SEPTIMO","NO","98","ninguna","leer hacer calculos matematicos","youtube","ser astronauta");
INSERT INTO tbl_estudiante VALUES("6","29","OCTAVO","NO","80","EspaÃ±ol","Dibujar","Videos Juegos","Estudiar IngenierÃ­a AgrÃ³nomo ");
INSERT INTO tbl_estudiante VALUES("7","30","ONCEAVO","NO","90","InglÃ©s","Decorar y dibujar","Instagram","Ser Doctora");
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

INSERT INTO tbl_expediente_espiritual VALUES("1","10","2","Santa Tereza de Jesus","Ninguno","Hace 1 aÃ±o","Participar en las actividades","2022-07-26");
INSERT INTO tbl_expediente_espiritual VALUES("2","9","2","alemania","ninguna","1 aÃ±o ","dios ","2022-07-30");



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
INSERT INTO tbl_expediente_medico VALUES("3","30","2","9","acetaminofÃ©n","migraÃ±a","2022-07-26");
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
INSERT INTO tbl_expediente_psicologico_unico VALUES("3","30","2","DEPRESIÃ“N","ANSIEDAD","NINGUNO","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("4","24","2","IRA","NINGUNO","NINGUNO","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("5","27","2","NO TIENE NINGUNO","NO TIENE,PERO PUEDE PADECER ALGUNSO","SE ENCUENTRA EN BUENA SALUD","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("6","9","2","NO PRESENTA NINGUNO","TENDECIAS EQUIZOFRENICAS DESDE PEQUEÃ‘O","SOLO PRESENTA ALERGIAS","2022-08-02");



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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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

INSERT INTO tbl_matricula_academica VALUES("2","3","4","13","2022-07-27","Falta de atenciÃ³n remitirlo al psicÃ³logo","2022-07-26","CESAR","2022-07-27","","");
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_objetos VALUES("1","MANTENIMIENTO DE ESTADOS","SISTEMA DE ADMINISTRACION. ","Administrador","2022-02-09","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("2","MANTENIMIENTO DE ROLES","OBJETO DONDE SE REGISTRAN PERSONAS   ","Administrador","2022-02-06","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("3","MANTENIMIENTO DE PARAMETROS"," OBJETO MANTENIMIENTO PARAMETROS","Administrador","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("4","MANTENIMIENTO DE PREGUNTAS","OBJETO MANTENIMIENTO PREGUNTAS  ","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("5","MANTENIMIENTO DE PERMISOS","OBJETO MANTENIMIENTO PERMISOS  ","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("6","MANTENIMIENTO DE OBJETOS","OBJETO MANTENIMIENTO OBJETOS","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("7","BITACORA DEL SISTEMA","OBJETO CONSULTA BITACORA ","ADMIN","2022-03-04","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("10","RESPALDO Y RESTAURACION","OBJETO MANTENIMIENTO BACKUP  ","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("20","GESTION CARGA ACADEMICA Y ESPIRITUAL","OBJETO MANTENIMIENTO CARGA ACADÃ‰MICA Y ESPIRITUAL","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("23","MATRICULA ACADEMICA Y ESPIRITUAL","GESTION DE LA MATRICULA ACADEMICA Y ESPIRITUAL","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("25","GESTION USUARIOS","GESTION DE LOS DATOS DE LOS USUARIOS","","0000-00-00","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("26","GESTION DE ESTUDIANTES","OBJETO DE GESTION DE LOS ESTUDIANTES","ADMIN","2022-03-10","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("27","SEGURIDAD","GESTION DE SEGURIDAD","ADMIN","2022-03-10","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("30","AREA MEDICA","OBJETO DE GESTION DE LAS CITAS MEDICAS","ADMIN","2022-03-10","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("31","AREA PSICOLOGIA","OBJETO DEL AREA PSICOLOGICA","ADMIN","2022-03-18","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("32","GESTION DE CITAS","OBJETO QUE GESTIONA LAS CITAS","","2022-03-27","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("38","AREA ACADEMICA","GESTIÃ“N DEL MÃ“DULO DEL TUTOR ACADEMICO","","2022-04-21","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("49","GESTION DE PRECLINICA POR ENFERMEROS","OBJETO PARA VER PRECLINICA POR LOS ENFERMEROS","","2022-04-24","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("50","GESTION DE PRECLINICA POR MEDICOS","OBJETO PARA VER PRECLINICA POR PARTE DE LOS MEDICOS","","2022-04-24","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("51","AREA DE ESTUDIANTES","VER LO ASIGNADO A EL ESTUDIANTE.","ADMIN","2022-05-03","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("52","AREA ESPIRITUAL","GESTION DEL AREA ESPIRITUAL POR EL CATEQUISTA","ALBERT","2022-05-06","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("54","ACCESO AL SISTEMA","OBJETO QUE DESCRIBE EL ACCESO AL SISTEMA","HOLA","2022-06-18","0000-00-00","");



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
INSERT INTO tbl_parametros_usuarios VALUES("18","6","1","1","","0000-00-00","","");
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
INSERT INTO tbl_parametros_usuarios VALUES("110","29","1","3","","0000-00-00","2022-08-11","");
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_permisos VALUES("1","1","1","SI","SI","SI","SI","Administrador","2022-03-02","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("6","1","2","SI","SI","SI","SI","ADMIN","2022-03-04","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("8","1","5","SI","SI","SI","SI","ADMIN","2022-03-05","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("10","1","10","SI","SI","SI","SI","ADMIN","2022-03-05","$1","2022-08-12");
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
INSERT INTO tbl_permisos VALUES("97","9","3","SI","SI","SI","SI","","2022-06-05","","0000-00-00");



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
INSERT INTO tbl_persona VALUES("3","LUZ","MARÃA","MONTOYA","MEDINA","0801200108492","F","2001-05-04","TEGUCIGALPA","MI CASA","2022-07-26","","1","ADMIN","0000-00-00","","");
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
INSERT INTO tbl_persona VALUES("21","MARIA","JOSÃ‰","MONTALVAN","IRIAS","0803199909637","F","1999-03-09","TEGUCIGALPA","COL.  LAS VEGAS","2022-07-26","","2","LUZ","0000-00-00","","");
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

INSERT INTO tbl_plan_terapeutico VALUES("1","2","HACER EJERCICIO, EJERCITARSE ","ANDA A PASO LIGERO DE 15 A 30 MINUTOS","LA COMPAÃ‘IA DE UN AMIGO","EJERCICIOS DE RESPIRACION QUE PUEDE AYUDAR A REENCOTRARSE MEJOR CON LA DEPRESION","EN CUANTO A LA PRACTICA DE ESTAS TECNICAS ESTA MEJORANDO ");
INSERT INTO tbl_plan_terapeutico VALUES("2","4","ESCRIBIR EN UN DIARIO LO QUE SIENTE","DE RELAJACIÃ“N","DIARIO PERSONAL, LAPIZ","ESCRIBIR AL MENOS MEDIA PÃGINA TODOS LOS DÃAS POR  2 SEMANAS","LO AVERIGUAREMOS :U");
INSERT INTO tbl_plan_terapeutico VALUES("3","5","HORIGAMI,  PRACTICAR DEPORTE","DE RELAJACIÃ“N ","PAPEL, BALÃ“N PARA PRACTICAR ALGÃšN DEPORTE","HACER HORIGAMI AL MENOS 3 VECES EN LA SEMANA","NINGUNO POR EL MOMENTO");
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

INSERT INTO tbl_preguntas VALUES("1","2","Â¿CUAL ES TU COMIDA FAVORITA?"," ADMIN","2022-07-16","","");
INSERT INTO tbl_preguntas VALUES("2","2","Â¿NOMBRE DE TU CARICATURA FAVORITA DE LA INFANCIA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("3","2","Â¿NOMBRE DE TU PELICULA FAVORITA DE LA INFANCIA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("4","2","Â¿PARIENTE QUE MAS ADMIRA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("5","2","Â¿NOMBRE DE TU MASCOTA FAVORITA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("6","2","Â¿UN JUGADOR DE FUTBOL FAVORITO?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("7","2","Â¿COLOR DE ROPA FAVORITO?"," ADMIN","2022-07-18","","");



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
INSERT INTO tbl_roles VALUES("4","PSICOLOGO","Ãrea de psicologÃ­a","","0000-00-00","2022-04-07","ADMIN");
INSERT INTO tbl_roles VALUES("5","MEDICO","area medica","","2022-03-09","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("6","CATEQUISTA","Ãrea espiritual","","2022-03-09","2022-05-05","ALBERT");
INSERT INTO tbl_roles VALUES("7","ENFERMERO","Area Medica","","2022-04-23","0000-00-00","");
INSERT INTO tbl_roles VALUES("8","ESTUDIANTE","El usuario solo permitirÃ¡ ver las citas y tutorÃ­as que tiene este.  ","ADMIN","2022-05-03","0000-00-00","");
INSERT INTO tbl_roles VALUES("9","SUPER USUARIO","Este tipo de rol, solo sera asignado al usuario admin que es el Ãºnico que tendrÃ¡ cero limitaciones.","ADMIN","2022-05-03","0000-00-00","");



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
INSERT INTO tbl_sacramento VALUES("4","NINGUNO","No tiene ningÃºn sacramento.");



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
INSERT INTO tbl_seccion VALUES("2","SECCION B","Es una secciÃ³n");
INSERT INTO tbl_seccion VALUES("3","SECCION  C","Es una secciÃ³n");



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

INSERT INTO tbl_tutoria VALUES("1","1","ESPAÃ‘OL","RUT","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("2","4","COMUNIÃ“N","LUZ","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("3","4","CONFIRMA","LUZ","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("4","1","MATEMATICAS","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("5","4","PERSEVERANCIA","LUZ","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("6","1","INGLES","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("7","1","CIENCIAS","CESAR","2022-07-27","2022-07-27","RUT");
INSERT INTO tbl_tutoria VALUES("8","1","BIOLOGÃA ","ADMIN","2022-08-03","","");
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
  `IMAGEN` longblob NOT NULL,
  PRIMARY KEY (`CODIGO_USUARIO`),
  KEY `FK_CODPER_USU` (`CODIGO_PERSONA`),
  KEY `FK_CODROL_USU` (`CODIGO_TIPO_ROL`),
  KEY `FK_CODES_USU` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_usuario VALUES("1","1","ADMIN","2","9","$2a$07$usesomesillystringforeDLU0KLdU3tCNprit2LU2PhciUHQJFsG","2022-09-24","","2022-07-26","","","‰PNG\n\n\0\0\0IHDR\0\0@\0\0@\0\0\0Í¥ª\0\0\0IDATx^ìý€dgyå?•Cçœãôôäœs’4\n£,$„Û8,ö‚Ã®×`³6¶?¼8cc²\0!	ei¤ÑŒ&çé	=sÎ]Õ•óÿ÷ÜšØŸþöoŒB´º§»Â­·î=ïÎ9Èüm~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æW`~æWà-¾—Îý¡éÒ¹Ï›næ¡W~Óøùµ—ÁøÞyý-§Úúó‡÷[ùîöþ¬ßÎÙ¦/Y3\\™æÙ©iK–;nõM6;ìæ kùòå¦x<.ÝÖ¥K—&\\…Å¾7^|±zíšuÑ¬¬¬à•+Wr96S*ôåáÎÎÂ¶¶fkpì.ž?^ûí‰©ñLgbÖèÿŸ§O]ÈÛwËs’Sd’„€´$ÄbOˆÍá9&Ó-‰ŸõûœþwÇ\n¼¹#¿;Þîü»ü®ÀÐøŸe¶]¿êÞ½k«ÙbJºÅ”tH*î’X(;»#¡°-ó»§‡Û›SáüD\"K&“–D<eI¥Rº±Úøží÷“&“)öÙÍf³É$–0ÿ¶ñ•à9}‡ÕÆ÷)iÔLIsDRV“¤,~~ŽšÍÖ°ÅbñÛ¬¯Ãáð:¶€ÝnØl–PÒnóFÝÎðõîÞÔœ/­[°(R_óåØô=Îßo~æð]~\\<ó«®U5ù»=³¿»=;\nf–•æH2Z=ÐßSà››kRv›äÛ­’i1‹]L	{*‘´\0xæT<å””ÉÆ2‚n&¾,&€ÎÂ—þÛêvgê9fJƒú»%F]uýOÒïŸCç!)3wåá)~§À÷ûý1¬	\'“ñ_~I%|÷&,±Ù‚²¬ì±©±éH,5][Û(¹åƒCã^_8jŸ­ª_êqe‡®\\ï‹O{\"ÑšËã+}*ô.ÿÈçßþ­À|\nü.=|áÇÍ#M5c—m™‰´Þ™™™Yhžš\"›e|™N€.Ë97çÊw8€’h²šâ\0œ$9gøM2%±”;aq×ø\"I‡¦¿¾LñX2M$ÌZæ‘~¿‰ï¦d‚¯dRø¿€@Z’ï¦”ÛUØY’f31ŸÅ’²YL|-À*/ærUˆ	þm A\\‹Ämü`2§¢³×œufÕØM¦˜)vÍEH&f#±@Ô7rgåø÷PNÊ2“\nÏÄ=ÔiqgLŠ-sR$Çg2=¬iõüí]ºóà»äƒ?öú‡r¾ ³¡¾>Ëawf¥R–‚Ðtÿ.oç‰;Ês,uDjöX,aOÄÍ‹Ùa1‰U(éIqQ…Äc)	Eø\nFùŠI8•h„ïÉL¹Ö–`Ü-‘H„ß‡¿éÏ±X°KŠ×ëèR’$Á5¾œi 	R§#ScG!n@P,Ö”XA_0NL|æ‹Èu:¬âÎ°KF†‹ï|9ìâ²ÍIm©OrÝaIjlÉXN‰Ä¢±H2ËÈÉÏxf£`0j²[£9ùy!‡Û5MÄ\'l6ÛŒ;«¼=’,nšò&Ç}¾ §naã\\iÍ§H½çoï–˜Àwè\'íŸþœet¨«8\n•æäUö/œ›çdšMŽüxL\n!oå’šÌ\ns<h‹v±¨\0`f	„’ð¥ŒŸ[[%µK ”9_Bþ8?Ç%NJ0á”a¯]\"dÁŠgÔ`S #å5VÖjµßÓY/ßùýØ\0Àx0ä;A©0_æÿ\"Wæ;©¶Ä\"a1[’b·šÅf3‹ƒ<Ü®_ ¢Ãä—²\\ŸT”:$Óm§Ë\"Å%y’W”)Y9VÉÍwHF&ÑªÅæHEÆ’ÁÐl|Î7NI<jud{}>W¯ÉžÛG}qbÁ¢ÆVWIi›ØC’ÉùÑùèðz}Ü|[ó\0øú€§\'¿`»véh±Û/¯*Ê]ðL.õÏÌTdç/0\'©¸#ÛåÈ·“XÚƒ„37ÙæÂ1ñøB253\'OXf=Q™žÊÔTXæˆ…¦§cOº$uÕÙ$ÓÈÐJDg–(åÀÜÒD_6ÔˆãŒÕÔHŒ´Vk{šæ¾¹Â&ÚnÞÌFÔf1kùPO#B…BÀ3ED@d~ŽFüWû%‰4p¦`õß)î‘™±N)*pDÆøSPrrì’m—#*YYIYØP\"¹Ù)))rIn®Y2Ü|e˜ù[²2‘é©‰\0‡\nE‚wfÆt$IZ­î¼‚¶á‰™žEË×¶£–Ù’Úÿ1_;|]+ó\0øù0Oœúoæ‚ÌxqÄ7Y’Ÿg«šlÛ”aov˜b5¶T<7æg8Ìn—Ã’m\n,Ú%è3ËôdPæEòâ¿LG³‰î‚â‹ŸèÎJ€&	EMRQ»Xr±Zn\0‹HÏÄÏ&-[\"],®\0OG}€ÝÍèîG`÷/AïÍe§Ý¡·€–¾¥¿Sö3~¦ñaüì\"ÕUpTÀKßM_°ÕT\0¶Ø³…ô]ÂA¯æ&‰$Ã’ŠÎÒ¬ž‡5(©ð´äš¤,Ê³IiQ¶T–åJyq¿JcµG2]‰&¢buÙÄÄ£¦Ô\\NañÜ„Ç?‘S\\ÕŽ;Ž#ÎækwwŸ;×Þ´çæ;Íïëg¾	ò6ü Ÿ|îW{öìÈ›i/žè<³Ø)¶µaÏlu\"é®s‹­Ô™rå…ÁL{F¶Åî²‘ÝÜlRº:Æ¥›¯‘!Ÿô%e&b•9çf‰Ú³ÛòˆôHaÍVqæfIfyŽ˜l.™æ±ðX%š½Dx	ÀOã3­é‰)*6e±h§ý[¢>+_PWŒšž¦´0Þø®_(Ó-`ê<“Õx¼‰ç¢8zÆ\'BÂkü7šH§Ôf‹F„€#õA}-”ãpI ˜!.uÄ$Qh†CÜ¤¼’ åÅIêl#NUPœ{d¨kB¤=(.û¤d8¼’i“uËæ¤¾Ú,•ERßX!VG’d<?•påG‘bÏØle4™ZKÉ³-1[þ’Éßõ÷üIÅêš:w­Ë³ë®¿š}žBó‡|cæSà·Ñ©àíüãb“xVE‚“;½ÞÑ†H`¢ÚòT¹­ö§«Ôfs•šâ©|ÇÔ¬˜z‡}26•“çšeŠ´v|2$þ ‚R¶Øì¹b±d÷%µ­”\05¾D*ÂÅÏé@Mc0“ \0ã1¸È4~-f;58›ÑÜ†|<Þ$®,‡ø£!~¶J8¼¬´Žó$I÷$‰M‹d2Æó€–47büä÷Ñu>«ƒz^¶XÙáùlÎ\0Ï¯Í“\0M\'5¾\\¢:‘HÊ+&è€™²iLÀšY2ùÊ Ò&áI‹•¦®ÕCíš!\0œŠgH\"jƒÍÃQq¬NŽÁb‰PV¤a’\0LãžeNìÉ>±›gÄÎ{/ B¬©Î—E‹J¤±¡@ÊKh´8ý<~.h5±$g‚‰¤\'–JÂÝIECKV{õêû¾>2ko«køüØÛèTš?Ôy\0|{œN~7SN,‡\'wIÌ»!•òÕ\'“Á<S\"žY[Ú ¾é¨G¥o(!ý£&éKÉ\0—ã„×$¾8)oÜ!‘$`d‚ÏlÎ\"€rÝ^Ú\06)Î©“Iøù{DâDK1ÒAØ,\0µ4g¶Qï#ô+mL€*€‰Am¦’0¢B2Gq˜]’íÊ¸B¨¹]vj†stf‰mDÒVÀÉ¨–’ ya.”`ÀøN”~€ÓÏsÛù+¿÷›Ò I0hµGÂ˜DèÞDcT\n£™bI¹Å8›ÍA19Ç$eó’ó6^?‹F›4·ž÷§AC7š¡™HÓÊñ*¯›x–’À8ÇÁß ZÌ!É¤v˜——‚ì¨ädøeÃêR)ÊIu¹‰´Y$7+Dcg.•Jú\"á”Íã±_žòÙ.-X°æb,žÑ››S?”QöQÐxþövXùð-ú)¥RÿXÔzùØªàìÐ\nK2¼Þ–Œ,±šLE6³¥\0’ˆËè²Æ2¥¿+*c£)éêöJÏ@HF&,2pŠº^8áâž+Ü€‹~e~.Êhv\";\"½§Í3i\'Œ$_&+ÑD;\"?¶€PkÓt5EÇVÏnKa@\"T£HlFÝÐÍk¸ ¡¼^@\'(……Ù¤¨3<7÷MB“!24;¸OVÏç\04I¦Cf¢>Ÿdd9CŽ\0F\0n’÷æó&hT\08$Ä\0“Ñ/á8â\0g*šÁýœà&¼žyä\0Ò,Ñze<Ÿ(/Ïâù‰HcD‡tƒ­Ö8A.ÇŸà=åNŽ? sÀ¼?à`§|€¤‡wí·Ý+¥ÄÝk3da}®ÔTfÐPqHv–5auÅBIG0829ÌÎ)˜ôãyUM5µkŽŒŒÇZ«WþÞ|Tø½¾nÖ<\0¾…> ±ñ§L=ÝÇK-2¹¢¶Âµ®«óüvS<Ðè´Ú‹3l9ÙVK–D6™PÇóÊä”IÞ8<Hj›ÃÑV4à*ŠØòÉòH‰¥4BÓú]@CÀa7ì\0¡‹FF.º¢PD »Ìq_RPµ9ÒZÍÃÑ”8lÔƒ(‘”¦£ú8íÌ†ba±:ÔÁCîër8\0Ô¤ø½3DQ.Y±b¡Ô/¨àØ¼ÒÕ×--í]üLå.§ÄHÁ>KJaž]—äJI9Ýæ˜ŸÎo<Ä½q™÷ÈÜœG¼¾1€/øfÂLr!°„÷7Kr<JôJfªs&)o-\\Ár™¡›­5F«ð³hzÈk\'9N\nÆ¨µK­tÔ:Ë¦TÈ’4 ÌŠÛ f¡sl’²b—TUH55ÃâÂ¸¬\\Á1G$3ÇžòL†áÎdæ—ö$’Y§r*oØÙ6ÒãŸ©Xvï¼~ù-t­Ý<”ù&È[àC™éýggÿ•²”çì’”ïÊî¤yn½wÒV#1_Ñ‚úÆ¬ Ï\"ÓdjÃƒ1éëJ{Û¬ôtxˆöHS€µ=“#<Ì\0ì´^¿ÎIêKA\n4}T\"2*\n\0Ž¨ÏFôgìh´Fãañ­Eã^qº©±ÁÑºžÍ‘mPUl¤»&î¯ U\"3$ÀM¤÷Påç)a) ë—ªê2Ù»o<òÞ…2Ixäëz2(×[\0­Z©ùY$7Ó&6.’÷<²SV¯Íç±ÊEL(úZW¯LJ[[‹\\8TÚÛÛÅïót›%‡×´ÉìÌ¸¸2ãR˜ŸÁ{±ÓÍ@å‰‘ú%¡õ;+-\"ŽÝfçÉR!Ö.1 n¡A‚ü×¢sìÅx /Ó`1%[@ç—UIŒÊŒoJÆ½Ò1’ÜÎ(ÔŸgGd mNªJE–¯.r–8¶™Ü`ÜS2áíoôÍõïÊt…}æ3ã×¿r¥dÙÇçSã·Àõöã‡0€?ÇäÔéÏd7ä¥j“¾ã[’þ®åÉ@ÞŠ,‹¿Áét:LŽÂì\\i¹’!€¯åúœt´…exÈFm,‡´…†%WìYÅD>..j¸zÔ¶â	.h@J“AK\"F„CªiK¢¦0»\\æÚi%åå¾ðœD´qJ$(Ü§¾¶Z/©¤qâ÷‡åø‰€Qäh³•×!2T0ÕF‰•tWÓd%¤¤Ps¨\"8 ÎfIUM®lÛ¹æ†Hy¹Èâ¥URTHí1\"Ê‰“¨Ó8OŒuKVF£,_žÏ÷ÀGSúfjRVV$»÷í’Ó\'ËäÐ¡Cröt³ŒRc$R´Ðávº¢²dIµlÜ¶T\nŠr¤»wHÎœn•¾ê˜4l²2rsºN<1GêO‡ˆ#6YÜÚ=\'|À˜v•U©¢_J¯aýL\0`ŠÎw\00´Ð²åŠ%æñ!ñÆ#â‹Éè‘éà¤exäò•YY´<Wj¹$¿4\'£´0#Ãâ0å÷÷ªŠDl·XdöDjäo_wU·8ŠÆL®ÍäÝó·Ÿ÷\nÌàÏáH¥^ÉŒš—47½°Í?=y»U‚–d ×žZ˜kçªxœÒÕ•¾|¥’²KFÇü»„+´uC½ääW‰=;Kúç\0@ŽŒ)W®Dd©b\'Ê‰“Ê	 c²PüÇdÅIä¥]ÒØÌŒ,ºÁDG\\ü¥erç»ä¾ûwH/5E¼2òë#244#^Oˆ‹”“ˆ1ŽŽ‚.\0õ<ðPµ†Â­Þ4•¶ÚbRPh—õ\"“ÓB´„¤®8KJËò8vRiƒE§ô¤ržq\0‡&¿Ñ¯“ç›‰ö.Ó•Í0+dË–UÔàDöîn”BžCéˆ·Iæf4f‹ÓhIÉÒå5òÀC·IMÈÅË«Ä7gïl?©¸Rfb4u‚<y€cB²shñÚZ³†g%Dý/MóQÒ.€˜£>Ö¥¤†fÍP™8ˆ:\0a’š#’Ý±™fÉÌô˜\\ëž”sW\'¥v¡M.qÊªõRYgË‡G3‰@q(ª›Þa—âë9õ‡SãOŸKé°©pëM\"äÏáLœÉy\0ü/<R‰k™¸ºXÂÍË-þÖÛÍþþeQK¤ÂlqäÙMÔÙâÅ27‘ë­yípÞz¤rÉrR\\B(k¹ä–ðt7Bñ$@InZÌÙP= ´\0’Ì0Ý—ø]›+L\nbpdŽf‘©±CÃ2tˆ­4%¼Þ ÑÜ¸Üµ,T4ää¹-ª¢KŸnB¤ÇºDi,¨ƒÕæ ÒŠ\0Ô•ûG“ÁJÄ©`£Ç‰ÿJ¾TÒE]¼¸V*.¶ËøT@#‘ÔT•ñÅ{Ëlž½ñÆ1yâÏ±¹¤¤´BŽm”÷?öÙ¸®\\V.-“Ö•ËåÊ…>	S$ë–é¹qqÐ ©Ð¥á•*Ë€\"Àœ¤ñçŒˆ7Dš¬ œ-D±ümrdN†Çf6Ê¼YŒlŒ3çƒãˆA;´~/‡ˆ¤PxTî§ž5Jý}$~êˆ™Îb(‘~™e¼iP.\\ákZªkcò¾÷mFb8˜™ŠG2g&‡Jbá_æÄÊª°ï¸ÉYñbÇ+_î_¸bû¨©b­çoÿÅ+0€ÿžŠwƒ£•2yl÷Ìà™<Óí‰Q*Šy9¹9Kd|\"AÊ6)?üa§´´ú¹0í4Ð“T!\\êsðî¨ñ¥àâS÷2SÿÊ)Â„\0à‰ÓÁLrñiÄâr9¡®äiÚ\nøD¾ËëdÓ†}Ò¸¨^êkjÅétËKÏ¿\"þå¯KvF‰ää ú7ô·tnÁƒoì&Küä\'“/üñßJÓÕf)àµ]ÔÞ¦çfˆª\0È\"\0{vŽÈÈ.yä¯Þé\0|\\nÝµJnÝ·Ó\0Ñ‚|·tôtJCýBÙwËvyò‡¯‹gvHòIWmvVa|ýn¡a¼\05Jœ÷P oŠèË,gÏ]•¶Î6ù³/þ¾¬ZR!·Ý¶Y†zò·MOKn^©ºEÜ³—æHš\\Mæ.Õ5å21ù*˜ZÉËË–sGÉjÒñâ²~}ƒT”‰ô´‹|æ³\"]ƒ£2œã5±:$eŸ$*Î,K% r&Z6¢\\ÂVEN7ë‹©µCˆÖyy„³‹ˆÏ*‡N2¡­¥”Ú¡G®·MHg×°´µž•%‹ì²i]1ßó]…¥W44WÐÖq¨Þç‹ï)«\\u:°¾’ŠŸ¼&©œq“mù|³ä¿àš¼ùó\0ø3^ìT¢©D¦N­™é?ßÜlÏ:{*P—cu˜ˆÄB<yúÐ(Í§ô÷GàñÙez¶îœRWÊ%i/\"ÉË$Âƒ´lC§‹Á\nHe\0|f¸uaêvÚÐpsa:³3(å(ž)›™”œlÑP¶<üðÃ²qÓ2Y·ºìÍºšFJ]‹’2ÖÈ¨/ bòG0+7ƒÑEê¬¬¿tDU_%²zu£4·uz¡§¤¨¤@|¡Zaº®zGf¨>„ÈÏé´JÏ“AsCñÂ)Òà)©\0órÌRWW.=}Ó†|Îå†?pY½T%ÂýµÁ‘:ZYLeh¢Œ.™¦Oÿ¬\0Q½‘\nÑ©</)‹×IQQ–¶Šª2±Ž2 *¼¾YoH\nkeÝÚF©†äœNé}U§©lØ \"¶É’…ÆzŒŒŒñYô“Fø|ü\0cÏESH×„]Á	·Q£Êp˜NPÝÂˆ|J5R»‰šcœh%œ!sý¤ã!™¦^ØÎæV_c—ÚêGeYyYC£+kh¸­|°g`­sââ™âò•ÇSá£Íb«1Yæk„?ãkSŸ~\0F‹œJ\\qŠ¿wI í\0|{‚Þ‘F«É\\ètä™¢hrzf¥³/./NÊ„Ï)³s(\'D{V:¹®|\"=jM—Cpõ¬¨3lt,#DsfŠ{YytyiÌ\0vR1M×œ¹Ô×ˆÂàCßHHc}ƒÜqÇ.yô½Ûžô›ôÎAŽÐé5ÉÀ`\0Î‹¿’£¹€¹¸µ+ëD¡˜æƒØì5èë×.–ËÍíòÆÉ+˜’‚’Z.Ô%3@$\03%NësÑ•R´#¶5^óÜ™³Xie×îý€OŽlÛ¶:Ì˜ÏA¡0Ðß:i†hª\0RËLf«£õË,ÒL›ŒHk{7õÀMRÊ{)-/¡Fa…´sÓæMRVŠF™ÇFy–I²²‰‚•Úƒ*d|bDÖmh”½·n$%Í7¢Z½y<^ÞŸªL¦TVÕÉC÷<\"û÷mŠ|ûÛÏÈÅ‹ÙlØA£áXD€)VôÐVT,Ê%Œ+™ÜÏPý®iYcKäkRIÖ±\"±D2%âqËð]d@¼£Ý…Æ/Ë—Zdåê©¯gææF3ÁþªYOïÂ@´gwi´¿É]±æéTêä“i½ÿùÛÏræðg°º)ÿ«2y~óÌÐ•†®lÌÎ°ÖdgåÛ’øæ$åÚÕ	¹|qLÚzaüE–J8E´‡ÜÁævAeQÃ\\W\0”0Å({6Äe4²š.bn`ðÜBx~záÚYºjêgc#ã¤¢¤^Ùxä™ˆxªdï®òØû¶	Šôö‹?~BNž:+ãã>ÉÌ*ÖV\\“â¦±\0wóÒ=\"›ìÌ#rìëkW.KÝûÞ\'k×TÊmÃÛ¤¹½WZ;FÄ™•/™yEÔA-\"R54ˆáT¹\\äUÔôÆóœ ýÄ\0_º;Ûeíút˜h†Hgï‘&MŒÒÊLmOF|•a([Ò]mÅ» 9æèä$‡Ú’“)îl‡²IÕM²víJ°aH,Èõœ¬Sn® ×B^\0€Ê¦MKH}q‹¾ýéqát3Íã¨{.]&K—ý’>WþÞi™•‚â\"Ù¾ý#Zìé®Î^c\\tŸõùR=ýµVdaä~vL!œÈD…Ù%‹áõÐùŒÉèì˜Ì\'dt†:/miÑ˜<p€t»ÈIÊ]XM¤\nF†¯TY\'‡—T.;œŠ~ïÅ¡Þ‰¾ªE¿F+iþö³Xy\0üO\\ÕTêòï’™ËöLõnõÍŒ6VV–EIë†GEš¯ÏÊù‹³F“cj:“èBpNÑ^r1›NûA²¦Ñ\\:ÒIÔkì\0ßEv´´Ð0²2 ‡°z\"òÛ»oº5rìØrþÌyñLH~A6ZÖ…²rÕ2£±@\0#/<*ßÿÁ¥«wÐpÓèˆubŠÇT\\i)ZÜÏ&‚,+-0\0¥¯»M¾ô¬ìÙµ[*è0ì¿uµ\\¸Ü.C¯¡F%P:ˆÂ”J“¤öSyEÈüü|\0°‡^®Ë¥]æ¨LLL€˜ÃkTT–’þv¸\0 ÚSÑÈÑÙ(ÍmÔÎ[³\0@(7tqùôš´UBŒÎvÒ$-‘†FZ¿ÜFGG$¯ \0\0Té\\’¥Ï½­]Û [¶-llÄ©ÚïµP[\0‡Ç\0,Õ\'¤¸\"KŠ¨Â—¶î\0@°–uVÉo}æ\0’:xŒ‡ä©§žÅDbÔØ„,ÚM×’õA·\"µ“Fxr¸ªJ¼g¥\'ùUª§Z¾ŒRþž%D±‰<Gx³î¢Pß€¬Yî”µ«j¤¬¬Àî°‡ÊB¡ÙüáÞÓU–±«[§çÂ‡Î}ÿÑ†e[šóeÞ’ë?ñzÕ§šÀÿ„=úò³¬\\TYŸ;·Í;Þy÷poóêü,wyQe…sl\"&=íÏ5~WýÒ3äÀH´VluâÈ*£†¤ž	\0Ç…I¨º‰QFéáäÔ\0\0”l?‹óœ²bY”\nÜç÷>ý\0a®­Œ˜Á§kjj’XÍ+¤vi4÷yãD/©ëqŠýC’‘_FíŒ®.…· é¥…‚¾šØ¨/º‰´r2³H	Óµ¿\0ðÒÅÓräµ—äŽHna–lX¿J.µöH{?Ñ˜ßK‡UÑÊ\n%›$?¯€Ž,a”RH¨£}î}žT}Zª,0VÌ’+—ÈÙ‹×et•†	®¬´i*=À	PõÍ¨^èÏò:þžC£¤“S:¸ÜobvÐÆ­Û°œÈ	…Á^gW»,4/–¼ìl¸†ÐrRlY.¹ûÞ[dÅª:ž‹š%dæbÖ\\i8SS z—UdËúÍ¥\02³¦Ñ—®‘™¹~ø|²ÿÀ)©HŸ K§«åÐn‰ö„ŒŽ»:Y;ÌÉ™ÒqêN©1ª+@ÇÐšš‰H½³6þN4hvåÊü=Eó„cÇìræB\\úº¼Ò|¥OÖ®ŽÊÊ•…¬Q¾#™œª÷ûºó-±X]~¡ic^Æì÷cÑ¯ž?sy|xÇÆßo”ü\'\\·ó\0øŸ°ˆ©Ð‹yçŽ}g¯vê¶éÑ±ÀÄB‡9ša\'}Ãvê©§®ÈðxŽteÉØ\\5EÿZ1çb@à*–õ¼xt*írÂÕ6Êí‚™@ÆÖ¤‘“ËeôeÙ¢j©«,”Ý;×Ëõ«çåâÙSøÚÐXµºZ--‘«Í~ÒMŸTÕçK‘^%oœ:$ãbu!Y°¾\n#5‹p:x;ÖñÌ	¾¨uáÇeXàÞÊêåK\0¶ˆLOI\0¸tqƒ¬Y½BÆfÏÊÁC§.ÍáE™cÏ£3ª §·` *Ë–.ºA»&eäw*][·n™¼väå€±Óúu¸u€jÂ‚¤²ISJÀS†0éo~a±ÔÖ×	‡eÜ¯¨“ˆ9)›·­¥A!24<ŽZ¤Mòˆ>µËmãE´›ÝØ¸@öìÝŠÚ¬¾62Q¯/aÓ!4Ÿ0ºÞE•NiX…çmjí–SM/¥KÃÒ•²eçRñAÍÑÝM)ÁæÄ¤Ïl.´œÌQY¾fÓœ PïSÉ!Ñ+M+u¬Q~¥šP\nnd˜pÑdÖÆíx7IT&±Èq¦êd„NôÄð e‡€õ…YF®*täzü³¹©PÎh·¹ÜÊ9šÎxêÄ©¿îÜ¾õWoèeþNâwñSÌG€ÿ—~*ÙE›s¼F¦Nî´DÞ›g/‹†#åYU’$2jjž’ïÿ0.-NRÝB	ÃåKeÖ\0T¯rdŽ&C˜Ô3Ã,¾ÄAHAfE:J-)¤õ©ÙH”sà®íÔô6KmÜ3Ž7%+ä»ßÿ¼úú%¹ãÞµðåœRS[ltHÍ–‘ÖñªÊà¾ÌÄÀ(@ë‹P3yâEúa#5Í¤ž‚Æâ2Ä²ÈÚ(êGQAèãvï¹‹´± écE­±J‹ZeåòFÞ[‹øûGOŽi\\1J¼&rÒýuSKS°óÑÀ9r¾	 Ñ\"ñº5uBÙRªH;]Ö0MœÔKÚKJ\nµmÖÃ’&$g¹n)‡™­Ý[F“ÀáÃc\0Mï‚†j\\ÕÍzd®‡qŸLÊåèty-UùÒõîî3Ð«—Ð¼Gf\'‰Ä4TòèL§;äSPx¦\0û,ê®‹ë¤¡Âå\0Æ7r;üÝ*%$½E/¬¨ßùÌoI[K«\\8×&Ý]Ó<À4Ó¢1¥µUµ‹´ºÄI4Ç†,‘¡Ò~âh™DƒÙœR&Ý£­¼^\0?-ûö”Ê†e4uð<œ›.™™éÍB×RX^ÐX¸xYÆã4Ih’ý_ž¾ó»±ó\0øq*¤ÇsÄshGhöÊƒWÎ?³³¸¨ :\'£ÊjI-—¼røX¯\\¡Þ79·‚Ä‹T)³Œ¦A9ÊŠ|¿‹²|åV¬åø€§µ>aå4RÛY´­ƒÌ·HÈ®ËåÖÛî%…ÛKm.ÝåÔùr{Lž=Ô5p‡|óé¹õžµÔÕDzðAyö™\'‰D¦PPPk\"rQé›™úýØr‰bŠéFR\0SMofJ&‚cReo`š.\'­òi3Y±ÂÈ#÷ÛWžÎÿ<sª›UªÀ¸\0¼\\IÔÒ#qRJ³½T²èÏE&àfÈŽ=k3ûËÓò§_üøƒ4ph\\^oßºEJjê¤£–Ý[åàSÓRž]/¹HÍôP»¯Ÿ“,+ ‚ºÅdÎ˜>Dx¹}Ïƒ²vQ¥qŸÓ\'šåÒé&Ùµe353DüîØÉÒÑ5&{q‰Ñ[böÖ­«åþûï4€íO½$/zMþêo¾L«‚ôžîO3Vú¶B‡<xß{¤ˆ7F‰UN½~AFz=²aÝv¹uëíÆëU°©èqØB)©‡»˜…¯ ®Ñ†³Í{ßû^Ù±¯\0ÞvJ…rý/ÿFÚ‡údÙ²5Ô3åÒ©Œ¨ƒ—Éû§Ä .Ùž¢>©À¨N:ôGÌ~Ö+‰/¢Ö=úÅr¥gJÆ§ä©ç¯Ê§>¹Ÿ.$eùA7\\ÍÆhàjötgß†âšgS©ÿóÏ§/„;·nøÕÓùÛÿÍ\nÌàÿ‡UK%zá¢tT%FNÜ25zþ~ïLçÊ5Ë•MOÅäjÓ˜\\o—¦ëviëÉ”É`	‰<±eeŠ—.ààÀ¨‘b®ß¼\\n¿e—4_BéA{6J|Úç“¤¸ew®‚¸\\.[·,”5k«µrEÑ?,­Crü‘ÆåiÈÒ^¤q\0\n–6‘†:¨!¥V.Ü5òÚ¡—dp¨âób#\nk¨_À1ÊÒ±<B•²E©Õ¤*yÃjTDSNjŒ………’Oô¦@ÛÖŠ2µ¾þ.£[ZU]+·Ý¹SJ\0¯;nÛ-“te/6uA6Î\'¥Ä5š&J.¤ãÂR\\hxü4ÝÒI¸‚Y%õDBX’v÷eh<ÆÅŒ5=÷[±´°‡ëGN©:–ó?lV<˜dæÚD—{÷Ûoß#4vÔóÜ©&ÈÝ¼¯†ƒÞ£Ç:86…6XÍ^Ó€¨$æÕ(F`šózAtÔÔS¡q3Rhh5jÏUC·¼´Y£Ï‰‘¸Œa£oË€¸\\jÊ«ipð>¨áV•Ù$›î2¶dÐŒfH…s¡ÔTËª5ËçÃhºw dŠRR—RB¨‘ì\\j¸¼~x\ni1¡ ˆ7Óå6,ø=lzjÂŒ;ù/Æü±ñ2…à€¦rå{OuÊâÆ”¬\\°&ÃT–o)³Z‚Ó\'«\'ššjòÊnû›3­_¾´yÉ¯Mý8•çïzcæð?x*ôuþCÞÜðÓS‘áÛ3];ÞáNè¿¿TZaý=1,M×Â\\Œ¹ˆ—SðÎã/ MâB¦Û©à·nÝjyÿ{œÊåç¦¤¹ã‚8²K`k˜‘å=í–ÇÙ(éh“Có9¤`½@ýþ>yãè	9qºŸ‹Ní¤Ê$ ½úÚ))~ßV¬™ÐËÞz‹œ>sLš.\\”÷Ü‡ñ¸E4OšàÝõJØ7ðA&%VÐÞ{6Òm;6S.p—•HO_‹ ñ Ó¹3Ç+*†“K@êÌ)\"5[Bó¡\\NŸ[ GŽ7AÛñÈ4)(Cƒ¥¬²–”R­ó©¹uôI{ç ÿ^ÂÅõÜ,iè0\n‰^Y»¤‘ßc`°uŸŒö‘ŠÂÝã1µ—Ê­wÞC´j§›]DÄé”»îZa“‚ê³/^•—%sIÍÂFãw7ŽLTHCÆk—–åKI1HÍíèá£¬Ç%Ùºc\'æ«iÀì%euRoÝ°j©xú~×[›¥»»ÛØ¶ïÚNsDB‰\\»vE*K×“ó²t¡ÃÁ\0›D¡¬Z¹Œ¦P‘‘r··Ÿ‡>ã4¾V¼ÿ~jŸUÒ×•?üƒ?ÇM&FÇœÂµ Riü~ÄñC´gbêÊÿÌÆ)ÕsS† vèAbÕë\'ZH‰cäsec¸„Ï2wFžÝëµäO¯ª,éþH¦yºòLËoÞ¼ôÏûþƒ§óüÝæð?~L~qù@ß«·ÌF§nË°š–YSÉr‡5@‰|ïû­ÒÙ$BC_:›Ã®MÏEMÇV\0PQ¿ÁíXUzaíÞµrr9`¡Dã>ˆÉL0£³	ð€`‹–/§{ËEÊß››CqÈ¦-+ÑÐVâ¦²Z*ª\0¡ËþAq	iM›/|Eöß¶ž´¹ÕÆøêAZ¾|™Æ‹K÷,ÑµRSQ¯rnPÜÐP’ÔêÔÌ4Ž{²r¯ý®›¢á:ž±0cSÓr¥µ^_žø‚§†åü•k²aû¸†\"›·ï3—»¥‹…âc-™õ[wÐ¥”Çã§½QR{:ž˜±:ínqG©1Rû™˜ÃME®²,\\¾™5jk–ÎwY³¾RVò¥ ¦‘•~×¯a/iî-òòËe`Ê#»¶o£q±ÄxÌqÏÀè4ëc˜IHsW¥Î†AìéÓçd\0ÎÝ/~d‰¤úûÁî)‡8¾}ýÊ€(š®Ù$ˆ·s÷nÒçÆë^ºÒ,Wè¬ïÚ¶žN;ÝvHÕ.…9Dé1FM?_sóU:ð‘;wî$bE>ÃÍDGÞ©õ>u×&ÎÃœB[óã(CØX—\0›˜¦Æ*cT_B¦ÂM1ªÓ¶š88ëàŽÉ©K³h¨Ò? r®•êŠÕöK\"…çvJ†­Îé¬¯¼Úú;Oš3—´.¯ú þüí?°óàOX¤Tì,jÿîµ‘‘#Ÿ4‡›7Ó³­vÙ*2Ã~§öÆMùå…—¨ÛùirDk …TPw«–r¨HBm£’hS1HÌP3Âbv¤ŽÉííòÑ¹l¢;$¶X1ºß”¡¯mi‡{÷Æj™–Ã¯=#ç/‘÷Žß\'ŸúµÒ,.Ì½(\"f¤_ºX.‹–¶Véæ¯©§––+²g÷>ù‡¯üœ9yB|àYºÐ‘À\néïÃÕ…ÚW20\02ãƒ´K] Ã“€°\n3tµØÅM#«8c‡=‡æŠ#ðb¨Òð”\\íŒÈÚ¥Y´\"Gn;p´}å9C­aÅºkê!jR•Igÿ˜¸rËdŠ6jf&¹*¾‚Þ€OÎRÌ{–‰l\0Ã`o;Ö^9viÀH)õÕéÍŽ§)1Ê¼vm/˜&\"2$~DŽV­“B:ÍZÏ;7q`Âo(3‚jaEH¦©ÿ(}’ç_8H$\nðCV^ˆOp†ã›•ÅÊr¢cà:i\\oi¡y”-7o6œt´†zôØ1	Aá1Ø±)é<bu³©¯«\0íêi\0½³Ó|>[áMî0~O…@žyú0„ënø†8ïêù ¤jÊlè:Ju\n1HÞ  êØOµêGe’‚2cTpUúQ<’\'#ÓÝ23;uh5O®ì\0¤W¬tdXcÇ3Ì¡É|SÜšá4gPj-ûþðôsÍ÷ÌO®›ÀÿÀ\nü;wIEÛñl¿º\nðûU¯·e[–=YïD›0Y-\"‡^’³ç1ç´.#…+’¼5³¹€“<ð£ƒ©)ãð<˜$éj¡F%:Ã¢°3P:‹îl«ÌBý„÷ò¡WäÊÕKŒ­ôÈøXõÆuè£4Êdí:œP®ÈØØ«t>!=S¿Ò«íÜÅ+‹‹eÕ²L#Õ{íÐA9K¼÷–;p1Ù¶i¶ùSrìôyê_câÇ…Å‚-îÞmk¤–Ñ••E]­Î\0¡ÒJá$Ž‚P:RXf…p)½	øûÏ½\"Ý#ëIã‚4dz„Ê–1M®sxX¾÷ìKrô,Æ4búa~G!2±·W²pcÒ(]Wåj¤åD§«Äm!ãù¶nÈÂš¾š©›Äa/C‰Cûäã³¤–sH×²éödqœCXséÅcÀ?zñt\"lö‰²ª ¨»zs÷ˆœnj–qÂ»Êêè—‹¨rx˜îo0ˆm	Q¹ÃøÝµæëD¦“²l5Ô—;Œ4ùÜ…9é¢,m€V£æ2\0 «–•BZ¹J`Åý^yéyéèh…,^Aº~—¬_Øs;|ø²ü¦ÔðhtœÅx®F‰‚“ßø8Óùº{I/¥/4Æ¨ý–<TYb|éH\"æ¹²:ÂC+ÖcaM½£¸’>¡+Lã\'NF±Ôºß›$æ&îE¯å&]³O_lþ?—×-ÿuª“ó·Ÿ´óà¿±:©h—[f.¬NL]øXWûÙÙÙÖZ»µT†ûm¤;¹x‰¦ÇÕNÆR)«[mhvã\\ìB>BUv°jk‰´BP]ôdv@gp¨WÍ¢Æyè¡[%‡Îá¹öˆx ¥ø!OÎLAåÀ`\0«)€QZÙ(}\\°§Ï¶Ê’eeÔµMín¹zí:n)ÍF#£¨¤‚î1œ^je9ÝÇêªY¿i³G‚öìóÏËcÞ-½Eî½çNX\n¥­S¿ÏàßaZðÞÃcÜ2GÄ¥µ8õ;èeŒ&¬=¿Rfé¬ªåU˜¯Y€ç•“å\\KQ	T’IŸ8\n tÓ8ˆ§¥IÞðô7ÔÁ(LœD~96”Dío\nýî´ÊÖ ÅèÀõjŒ:ž	é:ef`Ý}&„õ”U»³|ÏÈ¦ƒšC\nMš>C´|gšQ\09õE+tgQ	f\\šºúeÉH½aÏøÜeéÁîÊ¨.X±JP#2ü88¯ÑÃaªõ¿öŒ%²‰¾¦Ò\n\"á;GêÌ}ëàìDx>sdQ>h\\RåwàUGOœºì!6R~¸í¶[³ihXU?WùŒ&äï’Ô·oß‚ivº¿?$¯:\"o9Ë4¼B=`UÜ\0@c\"²ŽEµ¡=mÇåÛ­ o-ÄÚ‘(pÚ‡bÆÄq\n·\\©«Î£á“í´š#þ©–¬ˆ¥{5·òÙ-ÿã…õK?ß7ÿþ\nÌà¿Z›Tìj®¬Ÿý…Áþ‹;l)GÛV-_¶œ?;(Ï¼<$}ƒãÎZ/è4\"t§ÚB/Þz6ò§$¾î†;ŠáH‚[‹šÑÁ›&©•J\nìîÚ/5K–ÊÙOÿ­‘\né¬‹—N`ã¢ôbeDˆž&&pÛIÍvÑ¶ÈÒ¥n¢=jzmW¹(S¸ ÊÒÝ:¡šºêº q‰<ÿâ+42Žy¬Ã	¥œ(ÄŒl+©‘ÍÆì<\"(êZÊÆÐ‹Û¬z×N¿xz¸ø/7KKÿsƒéKªÃ	µ<+./V»êo¸ÒP³ -™¹\0<dmÒ9+Òµ8D_i¢È7¥i›BTS<¤s µ/è>¬E’®0š/”0¸Ü`X`¡&		Ñ¨™ñ*LÐUN™¸]SçŒD ä”Ð˜!\"DáÓµ:à„ç’Áœ¶q¹Ùù2‰éÁáW$³€î;™Þ8sq >ÈÚhmë	X/‘Ú$¹­JNåU‡Ðýõ$‰þ(Ðq^°d™±†CXtô0Â3.SssÔ@Õ¢‹‘Ÿˆ‰kêjè§éA­m×=:Ê¹à”eÆkéÆëíÒåNéëë3¤{¿ò«“º…¹”éÒ\0œMF°œ9\"Ü‰¹Ã6ùí_ÿüV¥s¤ÇF!Py˜4@tf ÍV›ÁQÉ˜Jµ„B—˜ÁMê¿“sfù‡n’ýûJåÎ=µR^·\'U’˜ÍÈ0Y2±ë2]øüÁ±HN×­MƒÝùÛ¿Zy\0ü±Iß(M½tÏäpÓC!ÏØ2—ÃZ^UµO^{­Cž{åæÐÂ+ÅœS&^†ÍùpEfÂY^XˆfB×=‡ÓŠÈÇñRi*xø½1yíÕ7èb\nZ‘gH³Ô±åßøäÏ\\–¯~õŸQ3\\–úúF©¬-‡è“Y4£EH:zúÇ1H=Žóñn8\"wß}\0‰Ü\\¾Úðb6ºx9ÍC²jí2Ù»¥\\Vo\\\'»H¿öµoÈ?ðµ£{ŸìÛ»Qp‘2ìéo^	zAª{ô!x‹Ï¼tH.¶tŒp‘%àî9P® M‹’†e\\J5IÑZu(¹êÉ\0}±µ–å™“l”&Q\"“(„fí~Ûyßî“ íS	H§å ‘â#å@JÒ\0ÒA øõ(*¥ˆ~­4Âj³Brdr–5%tF¬#všô§Æ¾ã>3<§œÅ¢ê›O?GÊY*!šCÕ<Š§—ºúäÐ…•Ì,¶Ëåž^ÙÿÀÃj±h4QŽœ8#Ý#pùvËºU”8øÝSÏ–±i/´ãR\"åli¢k|ëŽ²lÕ\nÉF•RXHjJÄüâ‹/Pïì“|ðä¶ÛoO—hØ|ã›ßÆ8¡]þðþ\'Í+ì±ø}GÿŒ;qœ±š…²&ŽÒ‰Ö¯Ï‘/ýåå7ã¿C‰j“z>ÇY¢Æ(*¢‚¢jx£4Ðìj€«]2>9ö	èB1ÉqçI&‘ïØpDžx¾_Fú¯Ë£÷6Ê\nÔ/>kþìPëê`pÊ•[½\"×°?Ã!\\›G¿ÿ÷\nÌà5IÅcŽwâ‘á“ï‰ø\'–‘Öek—÷©6SŠ!’/Iˆ£’t]™°É„õ{Y•*8òpâ4ÛtðÐ\\:R!‹1§Ã¤v¸Õ@t‚ztl\nE…nÜƒu²åŽ}¤ÑÑ‡åÕƒ‡ihÊTÇM¦¤U”ê†9ÔûÝ4ši„l.Ä|\\U5ªŠä»Úcùä\n\0¶~s9VPPJ/“‚òZÔ\"(&1---Å	&‹ã¥AõEÓ(í¬Ž`T0:Åq#ÜOa&ƒŠ2ùÈ‘d:œoŸ-ÃŸ„RD»!@,ô ¯˜•œG¥zXôìt9áºM‘ÞÒ²ÆªË‰‡|Ax‡f6¥E\0Q;ë¨Þ€)Uc\'ÿul¹ÚP©õ<¸i44®~ÓÔÐ€nZ Óœû¦tŠQ¨ºS£)Q[g\"¹AéF=Å°¤L€zjdD¶lv£”‰çæ6²nË®tŠŒòã\n’¸¾1Ü¶¡ÖL qËÈ-2¢EŸs™î Ü.^ì !ÕBó¦‚tz)ö÷iâÅË¬%ï9;ŸÉq„„Æs{äûO}Wž|òiRg·Üqå>yäá\"£³‘ÆöIÏQ]_Ã\0¦RêÊW¨kÍ8Y¡“zê$¬5ƒÐ¹Î¸ySGv†h(5÷ÌPW\\Fž-®÷r.6Ë½ûŠeÇ–Eü~ÒÙ=Õ±0a¾zmõÂŒAïgŸ™±µlªûü¼„îÇpð]€Î¶¹3B«dä…GFFšnø‡–r’ÚÆgR#òÉ“/ös—PL‡Úâª‚÷@\0|Q+6™:ÍIb½ŽxÙ­½üÌEK´¢5.‡‹*´a9lì\'f:Êî}ˆP,\\(¨\'èRÔ“Q}â·Ã7+”o}÷	¹ÌE‰ù<Á*0ð½¼Ú»:åu\\_/ÛÍÐn8ûvbtp’è(HÃ$,g›®ÊÚëëdÃòLY±qµ4®Z/ÏÓ´˜‹µÐ˜0jjèiG¸¯ÖMêFSÆ)Â›H=™xp&fö*WÐLGÒ§–.Š>üßŠ]—O€Oåa	ªBjq8¬0\\(‹”ošf‹Ö0]Ôçq›ÒÌˆBªN@V˜Ó]HJè`¹˜QÁ¨G‹N«3òO’xÚ&€ž†‰ävDüVµÒI\0Í„a§¯Ž,:ôÉLšh!}U~n4Fê¨`jh«“’SÙ@Ë@):ØÉƒ‘\0áøÅf™Ä{+ néìÇµN–¢§6,­LÝ£Ù£›A1	S€¿=zÓ€Tm	4±ê?N9cDÐißAe,áe‘á‘)ê„+à#Bvæqaê˜“Ó3ÔPÙd8–³çšX—…D¾;åùƒ¯I>¶[î¾]Êq²ÎcpÔ+Dó¾À\0 G§žÐR\'	ýüÈ1-3uLðr¢8ÏÀo—\\WŸ£YN\\l‘àÌ(&¯Ndtyl®õîþ±ëK3rR¨½…qõ‰ƒ§?~rÿ–¯Ì+Gn€à»\0cþË›}ÓCŸ˜Ž®Åý6G¾Å3ç“ØV9ÒË¿^¼1üúÜ˜€f2s»ù¤ÙCãƒV)·ÜOª¯î°DøÛH!êFžéYj^†i@$b¯gÈ ŒF)¶ÛIw¼rüÈs²cçíÔìrÿÅ\\ä÷Háë9r­µ‡“¬¥¢ÙÅ…P¹Ôt…4ª^î»³û¤2ƒsö\'ŽQoS3N«LÓñ@¼º\0,âB]°|”^ç¸¨§!=æ\"!Ò‚ª¢57µÀòAÈ-*©IODãRePZ2þ–ÂJÊ†§žš_\\À©|«® Ž«QºÈYxã€Vˆôß†‰ªƒèË(Úip¸UÚp…™ªT\\^&í#½De)£SšEô‡ÁmÙ­Ñy¨arE½3˜™I‡SÚDÒm@¡FˆÁ	ÔÁO:Ì‰b¥è¿¹»1êS`ëzî¯M¥ÒöZFÄÈ{rRx‹iy‚û¸™7éÉà‰súF%\nOA‰	ÇëˆôÓ~íØihM(Q²ŠŒef¤ž`Å›a À¿|m”.ñÉƒ»¹ïÖ}RœŸÖŸ<{QNŸo¢vˆŸ›¥J¢8ån§‘“\'eØ„¸Ñ\'ä™çÉá×/JkË5¹óŽ}Q*G•\"Pžî‡!`ço\'å*µD¥îXh¬Y‘ÖYí˜$z¯Ñ+Cá©iÿIQB¬¸™“N¹ÒÝ!žïuËøl±ì¿£LÊ\nŽ¹ñzïèeæ\n÷¢Ê†ø„÷Û\'‹sÞ¯€wýí]€©Ô«ÿÕ/83;“Xf5WX††™Cqi†ÚPT®µ“†1w—¹f†¥PKÄLDDX-©é¥E‡ñ=AÑ=G“k—ÊºÍðÃˆ’Îž½&gÆÛ =8I#¤ìÚ4ú\'Œ¯ÊÊJHÆrðÅ¿—	þ}ÏƒwCb.‘»î\\hÈSÏBú}ú uÆi¢.ÈÄ\\ŒSÐKŽŸ<E\nW-å\\,ûè:¾z¢Ž˜ŽšL‘ÆzäðñÓF‘_»ªW‰n8K\'q6Nâ²âJéL`.€ÄN$ˆòžŒ¦5O\\¨vÒZ.4Irv3¤V@ÎÅñÉIÒ2\0Pgêâ /…\0‰JàÔôÏ:‡¢H)/«zAÅ¼/¯ÑÖ=@ä<)	¢’Æ•+å®}PLhŽ=rBÆ{ ¾páª“´Öþ¬Ôú4’3**viyQì¤ÌäÀê¶¬®ÕZ&„¢½£¦há}èŒc3¿K\0º:@£À¤áaOwÔ×	jÅâJ³¨u”\'xK8T;‰˜PäÐ=žüö÷yn·ô³Pk$z%íOÄLp4Ù¬Ù‚—‘Ò¾ðÊ«èö;o‘[7à×ŠMÖéóçe|Úµ	y ÝÛ§¯Â\\)E¥tjQ¹d]j¥3\'k?(6€)«…çÅóÎçÃrø‘\"~ÿ]R[’+gêšä•OKÐ£q_.õßRœ„pŸ¡4á‹\0ô˜ä!·óŒ3>j“¢¬ÞV¡tÎ¶ÉK\'Pè„†åý\\D.‘´g&Çª(âš,¾I¿Å:ëíøæ¥ºÆ¾ë#Áw-\0vtýŸïPónŸglSF–«ÊaGà?`eöì ¼zlëªBŠÌËe.™G§’Èß¼$u3Ö­`á°æã)\0ùÖËï¸R7Ö3½ì>vó%2ƒÁJ‘jÛ%(RŸœìBÒÏ™ ¸®5©-[*QhÔ¢õËåó§C†ÜÇ¼‹Ùº¦ŠÆÉ=†ÉæÏ¥Yfèü8T===Pp¤twµ¬YšƒraMŒ‹Fñ=H”sŒîgß\\7¢›AR1:¤·:\n“Z@¨~˜“€!¤ï ‰9ƒ‹ô9¬üÀÍ˜¨Á§rÞ\\€ˆŸƒúbŽ6m–Q[B,<5E:—àØX@VÖ/˜‚U|]Y­\\Á\0À7ãá¢Ã­à¹Ú~M\n±Õß‹Ì\n&Àµ]o•À áä*‰ñÓì1£˜ÐÖ\0+˜>2Ç­úu§	¤A0S¦‘vPüôß\nŠ”4	mjfŽWÏªõYµÃá=“ðèéÁîŠªqºëj¹•\0\0]üÞ]DmV&®w¶t¼qÍÉ¡&hŠ!ã¤“E$7I„¯O§‘èõv?†M¤·rÿC‘ö‹Œ£y~ýÈaé@ab`]4^<tòŸ:\'>Ló…eßû^(Hƒ2>zŠÍÁÎùPj˜Vøië’?ÿó/³i.“þÂ½²°*[î¼e³¬]y mºÔƒÒhÊØ,r\n*v¯s‹uØ}úÓúP˜˜‘8Rå$à¥>Y»sªCÆ^¿Îz\\“½;ò˜»\\bÅ<U3#Ã»c>“É–°µ\\ù‹KW}zîÝ¾+°ðïq<Þ4æº·ÚUÜaFG_G\\ŽóË‰Svx&1{7å¬…ã…Qã Ë*3\' •4ÃÙÙÉ—FjßdIyÑgfhåFÊRà2ËŽí›éøUËSOœ•Î¶I£	bç$õŽrÂ÷ÀgÛ ÅÔÌ¸çnñÐ„¨)/¦^H—O=ä\05KŠé8>Já=Øy,ï±w\'0š@bÐtõŠ¬^SmX¸7@²=w•h\n;™0NÒ3hŒghœ‰´,¸83\nI?p}‹m•¦ŽêSSþ‘Å¯hØZëÆd³(@šàâ2qß…õÕÜÐ\'ü¹ïŽ=Æ¸ç_~‰(—ÑEÐqÂs¸cêPèÆ~ª°JR3³Òv†ô’hQ/Ôj8|·íÜ.·oÝdl áÑa©Æ†+jË,Œë\n\0\'	¥F#Î^W&§ÆCË±ÒM6º Î:ÂR¿k˜âs‰j=’³8Ø%x)63é¡Y	Ø.fœà+‚€¤j‹•$h£AcM¹4h&\nXD]fˆßfˆVf|R>km~¸H0u\"Þ*†ÅWã¿¨c\"¬í®]»eíò’´CJ•søŒˆ‚srËù¬Ílzø&¡M={Myp…0OÖod¬À•QÐDÅljY¬CœŽ¯Ÿ¨°g²t?(·î\\!‹«VK6Çž¿ X~ã“–ÃGšä¹ÏÐœ2¸…V¨?VÆ“ÚâÔ;¡VeÑ©V}4ûÑ¥ª|¨±b”¡ÑöÓ/œ—˜ŸŠr²Šñ£yÖÌ”gAp¶®Ül¡#·þ[½ß{½®ø½lŸïÎÛ»\n\0Oý¬­´Ð¹ÐZgOÜátoÉÉ]çh»6./¼Ñ#GNz¡R4JAÕüûrq/áä*Ê&PÏ>R_.R+6ÑCR-ê‰]¹ØžS×™aÇïëÁ	$G­õdQC™¬^ÌÛ«#¸Œ0Æõc@NÿÀ’&ŸÕäÊÇ~é}214\'•Ù-£²ñ,u²2G ÎþÞo`éDýîè¡ã†‚aÿ¾+×ûP\\ôK^Yµ\\lëB]ÑÁù‰˜FÆô\0)@\0;ˆ„’qfU`¥N$JhV–.¦¨	j}É¸GŠàÖT×K	n.)ÒÞ	¬®&‰RCD5YDBDÔãXuŒÊ¡|‹Îe­lÙ°Ev¬[+/>ý¼f‡eõ£õ²´¸L¶,_fD‰1²_k»\"wìÜ*·l)“ë×q•ÑùÛ–H/f	Ú Y½fM\n¢2m\0$ÂŒò¤Ã‡t€»6B”£`¥íý&U¥\0j×X£“Ê;Ôû©/!ïÏì¦{Íçc!\nÞ²y£ôbQ5ÈD‰fÃ4Bt#±k×ôš¥¾g%òË¤‹¯²^t\nú4J1N7¤ƒ¯Ÿl2 ëªäøùëpQ¨Ž9M¥îf.Ë¨ÌŒÌtîCtø§Å £xõeYµj!ŠŒWë¤¾¡QFF#-*Âçb#².¥`[”Wkx-.€Ÿ¨Ï´œH•õ™r_áy1Ï¿*W[Ø¨?§²r¢nçž\"}‚Ú„Ô(¥žîÙ€¨	÷ï7Ît@TŸ’ûï^,õóÍ¡Pkµ)ÖŸY•‘ìî=ž8sñÏNl^÷Ûˆß}·w\0¦R/Ù$Ð½vàâëŸ˜ØX˜™[—•»Üu¼Ù,/\n#›Â„ÔFžÖDeÑJâZ\']ÑH\\XEE%n¡©0©\":™¦ÝPŸ¸*Ûw/!òãÚÒéD¿ÿ;wSË¾õ­ï“û9aIƒÇ§åèÑë²ìƒÛº|À¯íèÓ¯“Ó×Ûe‚òÖ½ûä£ïY(ðÿíNÙ»n¥|õkË•.“t†åóûŠLQ[L‘«/T/û9ìšD@Î~¥ªgÊsˆHSÓÐõ$dWpäV¬Z.e(,n‡#ˆ\nÌˆ^¿óø)ùÒÁ¯\0hãt*sÅìŽ§¡m<&3äÛßê’Õ˜ˆ®_±Lc²ë÷ÈôÂNyò‰§åùïW¸÷>+Ù°ÿšaS˜”/éS#*£x¶r)Þyëî1®²YD¹ÿó>@‡¼€F©ò³³-ÿËwGBFú¾³„€6n X¡æÌ1:‰j3«	ª‚z“´Å N J‘ŽÖ‹–à½&I‹íeyr×²Ò°d6ô9ù,5Þ323Iy€hÏuJf~9uVm™ÐÄÑô’4R#Ï1¢¸bh@³¸d÷àidN$ˆèÂB¸æåŽ¼†‰iï”|ú“¿,e¨rþñïÿQÎw1LŠáÃjÍ?=Ô.Í—eeÃfY\\¯¬+RÃ	#²wfPKÆ++0>$›¶-O~ü1©â\\™MÈë‡Ï±INËÜcÈƒï_)!‹ª@údµ°ÎpkcÍO°Êt?6==«-àðŒX©	C”·-bx{¾¼vi’¨Srï½²gß*[Ê|²¤õÂ“-¸5/·´$Ö|âON/ßþÙÙw¾+\0p¢ãkvËéÕ‰@ß¯¸%¼³</·FÙ}^ùÆ†¤¥ÏNg0‡ÚM1Ú]¬á©IY¨ë$6µ?RI[ÊÁ8é›Ý™Àó?2%—Ûz¤¨ªVè#`’$²A€«—a€ ÞÈrän}9tä$r7¯˜|&™f¸6Yh€›bnî÷^>!ÏŸ@½Æ–©FäÐiã8>ñÐrÃ˜³¸$Á=E’ãeš#Ÿ×dæ‡Æ6ý‚û¦ÆªÊž#ÓÔQÇ4fq1gÃÉƒdë™¤ÓÜ(ï»ÿilXŒû$äÙN¹|ðu‰õµÈô–Ô—É­ëWHÎ§?EÁyåE8žƒÂU°ÏøùÐ{’‡î¸—È(N½ôˆœÂ6«I]ƒŽžyêqùÁß4†•á“MDZS#\nWþ^PIÒf6YÊÄÅoÁ\\Ô¡).÷Y»©7œ2©¨.‘\'ð<“äúŒaðŒ5h5è}-D†z±»Ù˜²˜±á÷~sS:Œ²ÐMê6 é1à—¤Ipê…Å3²£úm²vËjYóÈ}rßþ­>º&íx4vODe—•ñá¾tã™çÕtÒ¦õ@xÓYñ9d%Û¡$ÅðnT•Ì·ž|ž´—!è8w»ð\\·n•T±·l_\n¤Ó…Á´æã†Æ†…}ç{#2ÖyÈN¤!6;%éa»@|ðNÊÙF“åÕ#çéÃNkÄ0Ô½õÖm”1”BÕD“*ˆóN®„½6Òq:ÕØ¥Ñ)Ïãã\\õ‘^CšvCuJ1#¯6AUä¸¥…ó3ãÄ„Ñ[±Ê$êjíÁÉ®õnsþ³ÇÊ¾’Š^|Ád_§jÈwÍí€X‡›f»O.èê¾ò^Æm.È+,P÷ºÚ6(ç®µâ4æ$©å\"/$-Ê7vSÙÝQ©1‘¦¸‰®pò4mh(\'M)Ã‚½›zá \'D‡¾5µ	vòæk—eõŠmÆŠ¡á†6Nl—üâ‡?Äs%ä¥W3Àˆaè¤e¨»d1úÞ¾¯\\¾ÐDºŒ#Iu£Á;ëì’oýà:«nÉãõ;ÛÚ¥´t’¨/|,`Áµû©NÍ¤~1ý½š›Rê”Œ’\\x{³˜Ü¶wìÞºSÕæ`zùâ”}têây±’Ny¹(ó‰X†ÊÔJvà=B*‡‘\0íæ¼|§œ<Ö\"§p^¾óŽû¥¼4KŽ½‚â9ùõ_ÿ%<ðÊäÑÞÈ_;“˜}Àï†îü€u®ƒèXPBÏ—öq”ÚšÖN5²vÑS68¥ýåæÛq´±Ë{î#¥K`%vµòãYˆS…¨;ÉgÕ‚µT%‰á5¯”@}M—µf¨5O¾Í\"‡kmÁA›ˆØ•“oo=«rÙ²±\\®v1Œ~tV.\\¹n~÷¢z	á]8Åø µ.ÍF×ŸY×¤Ž\0&^,Î<Ímðþ:$+ YÑ`l‚J–¾ý¾Û™#ÅP¶…rÅ¬Üy×Ý¤¶ºçoW®ôÐp™1F¦TÃŒ’œ<³ìÝ¿÷ïÆ:œç³9qü*CÔ‡d‚úÞÓO½HÍ°…÷â%Jžd®ò6Y¾d=îÙrðÕ3Ô„§‘Ê€¤ô\0ëƒà£¬KÃ®¬4‹Ô‹Ð‚º†ÌYåÁ2:k\"Ð›ÅkÏšõM-òø¼H¬¥C €ûî¹½£ðŸå²ê«Ž‡‡î·[ã·:¬¹5¡p¾­…Ùoœž•Ó—}ÔVQp^À‰â¢‹ª\"üt·O%bI@ÍïÏ‚-{\\²å+á¾±³ËRioo•òÊ,9s®ƒF	u$¢ÀÜ$N1WÙý7¡±ÊóeOž¼Š þ6ÁpÛúû0\"µzza7Î$3²´(Gr)+¢éAq;‹ÜŠkˆŸTn¥þÿæŸ¤7¨Í•„állCœT1e^+Çé‡§g#Ì\'tç”H!Í‡†š*Y¹x±ìD‚[½œ;•ƒÏãpBãà²æ5©s‘âMŒ{‘o)%åÈÇ19å}©¬Í&×Z¬ò•¿ýg|õ˜â@Hòé§ž7š#tJÿá«g™v\nú4àù©^×H§®©ñçÆ­ëŒáD%º¹PÛ0†Wµ´a¥à \0hHô\0’\nú.>ö šÙ-òÇôç«Ç° W=¥¶˜ ‘§\0u‹q@éù‘<D9€Ô•EcD\"(b4?sú¢1:s†á¡G÷¡§Æ°ÁÁW©¬_TŠIÂÞ‹_Zºð9¼Îô¾	âk¥ËP_äà‚pMD˜.ìÿÕ;Ñ Áìï4š§_¹$ï{x­!UüÈGïsï=.ÌqQ`ÃL.0l]Õ0êîâ‡hƒ¹ÿÞØêo2îÃèayîùc€\'˜éÖÖá(=(çhœÝI2‹µò±þ¢1krkzÃxú™7p…A·=“d£*bqsHtn‰‰Óh ±Ø@±Ó¨™âó$\nÍ¦IB9gÉ‚J6QSi$2¼¦¯ûÐ‡R©Ç½ãSÁîÒ¢´ôwúí€³#—V´lù€-»%7\'§1Íµ·´Eð»Ú‰Ji›dŠfb@	¥á½Nìr °RóK,nF‘y}cRˆÃó–M‹åÀ¥F:S]³]-c$ÝGñ„dŽnP&GØåÏBõØÀ‰YBm©üÓ?üµqáì½m?F–ùòÉ_þÆ©ÓÒÕ7 \'Ð†î[y/X—,]¶JN¶É8Üº8nÍQjv\"Á™ C\0(„eâ¦éÌ+ÅZ\nž3*”µ<7é1œŽÁ[.·`1_Qœg¡.B^uÇN¼ä¸øþèO~ ß£™@Æ°pÁ\"¼ð0ý„\0…ƒ6‰ëÉé“—°žÂÆ~fÐÈ½÷Ý…ýÖJ\0ü¤Ï¿Ê€¤80\'ehÌc4ÞûÞ÷ aóHk× c\0†Œy3Ð|ÔmfÉ’%ðäöËñ§žD7K²ŽŽx1&¢êÖ\\UÍàsà·ú±ÑI¼ÿØ@hØäÀ#,).1\\oJágç—–Ëž]ù\n45Õ•7¡àÈw¾ÎØ J3G!T5ØF.m išM+ÅØÉ,˜9„ƒ¤WÙ¬\"O’Ä{¶Imm	îÔé(¼¡Ø-ã>:Ã8»ÌNäS\n1C·0tWÈÛl01HÚnÌ\nµK!½uf–TÉ˜Ï/Ï¼zL¼tïº},B-R\n\n4jÄ3pPä%ÍD…s:AŽÚl&FjÛÿ_|DJù\0)ËŸ;*‡ßh2Ê#†_ ²•òK9Æ-W±Þe€ŸnªÈ{ìƒ»Œ¨úÉ\'ã9¸:ØÐ\\”V\07f\'«ñj öc^‘`ªÛžCcd´ž9uÖO†2*ï¸TÖæ9­ù¶êÙ‰‹{\n†“ÉWÕSÍ_8Ý¸üwßñdéw,\0¦B³¤µéåÇæÆÛd—Ô\'’E¶®ž0Š	9vÖ‹6”ÆNjr5¢Ýå-œl*ß²£Ð%–Ð”“Ín(˜¤¦3ePÔÍ˜ÍŸ‹¼R>õ©Ç°Žo\'E|]NžðÑñí†¶òš¬Âµ·¶¶:Z1àr”ô#,úà½Ø+Yäýx¯|û»OB¯¸DÃ\0¤v´€H%¿ä*£\"g O¨Ej\n¸ƒFMOÉ¾V\"õ`‚“¨6õBÔ‰v+y“Ta‰´›ùlæàzHgm¤„Q\"«§ÏÒÄX–Ÿñ>ª	­\0½¢¼\\ñR‹¤kMý*DT:‹”ïò•.ŠnêVKeÓæ|G^uÚ%û$å\\{¨›eÃIÜ¹ÁA·ç`õ{¤©²\"\'ËAíâñ!_ƒŠºŒng’¹W®áP”%×‡dí†•²×¹Ê°˜\nÉ“?|Î¨Y&	ÙÊJ«dïž[¥ÄB®\\ž¡ÞŠÖ™ÅVé †t^8•IÖÃíÅP‰èZÝpT6¢•¾zé–NÚéESòºz¤‰xüDÒ¯¼ðº\\nºÎ¬Lù_·œR,©0F½Ü%ÝÍM’ÁZ- þ9æEfÈÜÛ;8ùy‚9¯Ï3ÇI3­™øÒˆ Vê¥±å;ô†t²QÔóÜDôn7Œi¿Þ\"×r{ÃýiLYø=òÈÉü¦ÿ^;Ò\"ç›:ÉÐAãú¢h_ÌËFŒM×æõòÑ@*i¸f±)]An–5+VÈ‡~aklß7BßòJ¦v‚}ÝŒDªVÂa•\"y ÅÎgè\"ôMesþ3Û™ÀÁÃC|®%¸Ž[,¡š‰Þûó\n=9Œë{í·/î¼õÏÞÑ‘à;\0[›~¿48ÙzoqfìgÄµ 3YÛ>}ü4Ê/Eñ¬£Ög¯€ñ_D!:Ãàè™9Qô„ÑáÞ	.ª]`5j¢äpP\nøg\0¸Ãpïâ²oß$F˜\n°zeìô·ì]$€ÝòÅUòúÁe ·ƒZË\0ðv¹çžòWý·8‡<Oc ’Tpì¤ãJ<$§Ž¥éA×ŽÔ.\n¿.OÆ©ØBG ÁIœ$-÷“†Z^‹ÖºH‡2bCZµ¤¶FÊ¨‹•åäÈÚ5ÔhÔ\\ÀíØ®sqé–ŽsÁyùU†0Ý\"öÝ&Å\0Xûõ6.D,¼xÞ$FÉ›ÎÎ¡kc§éã¦cQUYmÔ¦4˜ºåÖ½ÒMš×Ç…==9Gôw…×ÚL¤8#_Ï¥9P «£ˆ´9NÍZŸ5W::gÈ°ëšd:x½ý2<¦uÕ|\0³\n3Šø¸š,ZRM½LM`§ùûˆ”M–HgÇˆEõ’€YZU uµ(°¿ÜÔ¨ŒáÀí7jt)õòÒ´×\0?ÒU•Ñ1RÚ`ÔA§W71;Í Ä ^$ƒÔ†‚Ð|flÒtîü¾ÝXwY˜µ|†‘›ã²nûdyrâÒ©)«”\0Y³Sð,Óµ»£EY72ò€êœ‰4MØnMM9s‘æX‡ÐýJòyhì¡É•Ò‘Ÿ†¾U1ÏäŽÛn“­0Ðå(R&yá•3¬1*$xú˜DŠ‰{|ß¶y‹ÜBŠLSÙˆnŸüÁyêé¯a¿UL4Ë,˜*Ùç&ii”çž;G9Qj\nå‹I%;Ú	‡“¤yV¾%Þ•ª÷Æ>Ç2uþÚ)Ö§—FÉ©¯*vGü½uþx§%åŒû2ì…ªÁ‚ã{{ÇàåŸËí=·ÏÓ×ûPq®¹1Ë‘gí5ÝxäBS›£\"Øtå2‹7BŠEÊ¦…tõ¬Ó½:¥˜!’º9qüLË\"äç0Ét¹R²dñ\0õK×ååË\n`~·!‰{åådhh€´ç´¹ØD½~òŒ|÷O\0\\…XbÕÈ-;°#Û¤âpœÁH-¸höáJ&íÒY°‰0ã§4Á“‹ÎÎ´4¥3ë…ä†»°n¡Ü²m‡\\½.4Ç½Doý=rò8sD6®—;hz$ˆÊô¢öbÂ0ùz‚6d=zÔ¢Õ°Þê Ø®fjŸ>çènFf‚†¹g6bR;JyDMiÕE€”¯£·ps’…Ò8zê8u>n<öH}® 5³œ?\0{ÓSEy:ÖœžµÄpöL3é;içâE22ÞJSbÜw`=&¬^ùú×¾%Wš/Æ£#€a¯”’b.‡Gwçw#û¢!ô\\–?vRF¡\")3P%€ú?¥öRƒ!­p¨Ÿ†±(6ÆÇÇdŠÈÕÉç©MUå”S”]XW@-vˆh.! ©ÃŠÊÉ-o»e-R5Oaüµ¸2YZ55»‹24:$~Ì(ODã.øŽµb²±yzáNFÓ)¢Ç©á~Î64åBÝIéô½LC¥Ö3õ6NFqñJ\'Ív6%ó‡(©ë|çL:ä¿òkI]iÚþëü…99røkxi\">‡e…ò‰OüŠTWr>0´ÞþòU¸¼G3å”~Á¯Ä‹ÑFgLmÉ\"d1<­Êr° ¯´”ˆ×_EÚ}Iª\nRu zMÀL—Ijt‡Ý»ÞþYÏ²E2ôN…Àw\0Œü“³À:·z8bÄ7[˜Š»íaj§NuË«‡˜¬å_Dƒ`%.ÇÙDV”à€‰ÎÁ@¦Qè.ZŽ†àÖATVY^CÍhb4ÐHÚuåJ«<ñÄì²bgTXé4†i3Œ»®*WÞûÈ{WpŽát2·a¡ÜóÀƒð\'åh#\0ÇYø;²¸Öahz_99(óÿ,GÐ&,Ì-ÂBI‘%„:\"›Ñ­ÚQŒ¸\0–…©­	XÐLq|îU¹xâÄf€‡|Õb¾ój«|±ýÔ± Z\0^E·A%á\"½zéªt´¶Vú6\"Çiš*v\"­Ž\0(e•…Pò‘Ú]‘ÎÎGyÚÉV ×&=\0)7‘QM}™L`@º”´}\'ZØëp¾òµÆQ\"»Z›ÿM¹ÜF75€ÌØÄ0Àí„ó—ÇÉ~Üm:€óiÙ¾·Ê0j()Ía[!Ýõ	Êy8_¯5R¿3Øø“^ö\\“¿û‡×ˆÂÏ2{c›1šò\n5½Ò’Fà³Ü]¦1_XÔ¸œc#Õ¤ƒÍœ/‘§ÆE	”–ò¶ˆš7°žZx½·™z#/Î¦UÍqëxÍÛl3ÜvfØ¼ê±#›™—AÌg\'éÞVTUÂËÛe4X¾ÿýWÑ‹C[òkG\'pø|Ú	Ö&úB†`ã÷gã  7Ê&ÒÚ·í”_üØÉ\"Cg žüÝ7žZx?ù†±ëõX³i–ÆÙjùÐ‡î\nÀOSîCGšå;_û\\9Í0‡ó®€uñ£MUSÃ¸\0\'‘Ÿg†;ïÕiC%]\'tbG¿Ý=’±?D­W;ÙNêŒ¦Ô2(Sj¾€l`Æ@‰ÔÖ¸|É¡ÚIOÇ]¥Uå½‡/~üàÞu_©úÎ»½c\0p`âæ„gxÑðlçcpBÖåe¢±Êƒ¯uáÜËÎ(#¨ä„ ½D~$tv-Dy³scP@\\xzpR8y¦õ™Ý»·37)ZÍ\"ŸÖÖkD‘—Ðâv1¼`#:¡ÎÃF>zäüù6ˆ°EFôµ¨±ÊøÒ‘\n§µqWÊéæ.œ`&Ã‚žÑE4\"òOÏ9\"½¬\\NbˆØòc^j\\M.T7µ@¡¤¦½T ZÛ‹Aw§kpˆÂ{Šô8ª}„†C’ADŒ1\"Md/ÑÀ¨dÈyäçqR¼9¨!……(˜­«·›6ï¯­½™‹ÅfØ»k$ø§zT^~íeY½vVðuDg×Ië«\0+\\·)\nùê€D@ñ\"yñ¥Iê”^Ù±{æ ûŒ®òùód4iÙclêêì‡úa¡žgŒˆ¤S|ñÒYÙµg%dß.lfSrˆ¢KVãÆ……ré\"–VÙŽ7“ãuøÜ9ùlöò9ôMEPÃK¯(n š ÒŒJ!Þzaš+q¤}ªzQ+-åsÚÕÇPaƒhÕÄîuõúuÙ¾§W×Ku>U’è‰DóDâ¸ß¸I¡Ñ”óV iÓ{l¢6hAjv±sÚ‹…Ù#†Ý•	×h:i}½9>3Ý„xÃ­‹BŸ!õ¸uC\'4Rß®Þ\\BÜ[<È‰’#Ôé2slÔs—Ëö4Ñˆ<)ÀÃ†HÒJ¹Á…*	Í4ª²Ò%xBn4([¨E^2\'5É,$šj)#ƒPÉ N¤K*M‹òJ’uñµZxyP»´›ÎW`Ç\'mLÆó%,®ÂÌ,»eº>2×÷ˆ%‘í;ßýg7,øíwœ—à;\0\\‰º®Žž‡‚“}{+\nrËc¸wvøäùW!‡6J(U+q[é	TD¯œGH­˜7t)ÉäV“ã€gµI}äAY·žÔè,æqÁm$BÚˆyèRùú·¾)]]#D”§‹<öðz©¨©dÛ\0‹CÒÕÓ\'÷Ýw`C§. ÎG(JÌ²±–9g(’ËsJÞ%xb4Fº‡‘LiWÑ½‰Ô-BGÑŒŠ=\\²þGP<ÄˆÅ)Þ›`og\"³CtµÐÉbhªQ•á~B‡S“hneM\0À^+…Ái=Öð–ªHš‰Õ\\ófäcw0mLzû:hÊä\"·È·¾ý©k¨Á±WzþÉ¾NéàY@ShŒHeÝjÄúfÔ0cM|]èfé²nÀ2~ŸÑµ´û¤´¢\0`°Y2ÌçúœÌM eU‰žÎð#í›´Ò=ŸÀì¦¶_BuÑÖ$–YíÒ	ÝH©\'ênc0Ô2C¯L°MDä2FYŽMvóüŒ\'¡¶Ô:˜\'\0¬NBSŸC™AHNáëg.”BtÚÙ[h°`ÔZ¸{üFfçÒ€­›–ÞæP«ÄI‹aBä8eðâ¬ ÊeÀ¨Ü²q¸òŠiRc>K‰\n2êsã`UÂ§£/ÍlNvÞ[/Ð©æ:ìÓæäÅ^¦s«<=ž0N‘rÌR(ï}dŸìß]b\0í,M—b4Ì+W/–»ï¹à«ÜL”Q6É¾;kãìFŠwþ\"£PÇÆ!««™ÌsJD9K Éà¤Î«ç—HÙŽfÏâÄÚŒÔ_âÄrÖSê°IKw‘%ê¡«¬Ú”¥¦¬hjbh•ÅZpf\n	\n}©wZøŽ\0À¡ž/”Nõ5ïx&îÈ²eÖ™SùðôÆåÅ—û9áòIu«˜	ÁIµDÒº¹NlK&ud£“~Ì0úÜ¸k£|òï•fóêíòUlÞé\0C“(£dsï[»¤ï?ù‘K3\'vz­T•ºIsï“Q.î§žy`é”‡ßó^Ym†+\'#µÀµ«™ƒ»N†æÎ!Ÿ›c0\"ˆ‚’ZŽ\03Ó–ÔÄF;’G,\0W+¬0\'°	ÉˆI‹îÄs™D„P4¬¤ÉÊE¨‰\0à§*I;«ÍRÒaýR/ÌÏ2R>ìQ@|Ã•–ËŽ…€8Õm¦±á¢-ù.u¯ýûˆ¸ ØP¸?á]Ü9ìùëå®;öS\'ë‘ÍØìPËô0±N¹lúµdQ5Ç0\"ûÒµûá¢y¤¾–ZI‰ƒ‹´^ŠKq/Ø¦fV“Vw2»cÖ v(?-LtU…SLi!ƒäõ…\0t)N,õLqÓ®#úÀ£Æ£¹|Ø\"<Í)Tl\"Ôet¾×oÜ‹oâ ^\'‰‚ âqŸïC¹œ~>£0óµáPtƒXIägKÃ¢yødÉòJ$w1êaDÕ¤ÈúÚza$¨YÚÙä\\ÔÐf G9‡QâXs0Y`=Çûûe-c:·n-•_9‘_exý8›VH?S>/\'N!4ÑºÁ\0P7N ð¢Þ œB“…ÈsŽ	xqdsUe%ÈÔ6Ëm€ŸV0ûHå0áoùª†%Ì^-Ûw¬6ä‘tÔBQúgòÆÉË¹v²¹ùfë#Ñ<ÐŸ³Iº]IÆi¢\0ÁORÉþQx“Ê*Ð‹’åð3³çJ¹Â?”&æœX\\lRðÕ]<ð”»3\"í¡±S©§§M¦ÞQõÀ·=\0tÿAA`¬õžgò}ÙV×:W–þžZ[f0œQôY+qçB‰Yòh0hHy·5bòï9vü,˜ù[6­“¼ÿQTkDžøÁ	yá…çAþæ½~àÃŒ¹»;öì–K-mœÄƒP,&äÿùëòKŸø þ|V¹Ð»ÆÄ´×Ÿ»–”½Ã·ËÖÝ[ÙQ©½’\n×/%ÍBgÈ™¨1s„×GF´\0óPPÙ‰[•€_ˆHÂ;9ÃÅ‡«0á‡…«Y½ùTëÉÓ:¡ªW)t«”Ú[¥í\\“£ã¨tãÁ	#Jô“gþEfÖL/»Åè–ž9‹©\'C„~ðäsrèõ#¤õ‹I}i¨çb¡_h8<òž‡R¸vÈDAuuD!Da\"ÁÑUÆKij¨N­¿B€¤‹¢uˆXuHæ\"æ‹”qÕ†}èÔö^­¶’HöRA33…=’ç,|ˆÞ	¸†ƒÝ5ð‹±«\nÍârC5:‡)(àé&4\\¿\"V˜@er÷½XÅ“®¾ÂH+ã\nlé€\\6žˆÚÊçmal„r6Æ$ŸCkÁÂj©ÅâEÉËnRÕ2¦ôÅ\0@•¬)¿:Dý°¢¬œq£Œ´¤öÙZ¤¿g0®¤É…Ö™ñ%l E:Ôl(ƒ^BÓkˆnhŠñ\0¡;²ªÛ6Q~Œˆ\n`¨£Ûx=;µ¹Yš&6‚ºº\n8¦; Ú×à×Ñ›„;x]ô÷¥{ÿ¸Ø?œ‹’§Ì˜dg¦!Ì¼å[OO.7·Â½ŒHÔ·+A}sˆ/æ¤ø+—5BÓšâs§I9…U# %”»0NHp.dvzë‚\nñQnjï£¤Así’…-NG°2æ¹5>ua°»í/,Xü»¬Ð;ãö¶ÀñØwmÉ¾;#¡¡G]©ø²,G¶{b4ÄHÈ~¹t	îS¤Aœ¹Kñ„Ã ’:™š™:¨Í˜¹øllŸ&º†3œä›¶l–è#²q=ÚÀã»ß9*÷ÔÅ®Q™¶‚nÓ¦JÃ9“Î^ˆ:\\×M{!÷~òÃ÷I}M¶|ì¿*ÿø•¯2Ÿ£]®s±bYß°|„æ¨´sÖúˆüb€ªa¿DýÍLsCA.C›—QŠÚÈ§4N‰NQ¦\"7­á˜¨å$ˆc¤¹Ä{†ìLÓF55n`¢‚ž‚_•†*-òó°lâŒO`ñ®áIHÀG¨Aº+È\\\\Ri\\œj+ÕDT«@1ÃèÅááA¹çÀP@²å÷~÷¿Só,”Ý»v2†±ÒˆÀ4Ê4k4§~TQT)Ð+lïÂtG1yUéŸâ´ßBÊÉñ³d¼_¶ˆ¹j_Ol%.Ò|í°›xê­òÃ\0:3Ê<õ&/K›66€g@s{éíí•Ó.±ôÊÿéŸÒ÷ð\'y¹n˜èM)\'æ€dR{ÓÚ\"E0Ö\nb0iåÐ¨Ÿ´5Kžzê;²ŠôrãzR÷ªbéjï’¯ýãWíñ0Dá)\0aÙâ•RQ^\'×®vÉã?#Ï¾cLú[µb½l\\±X|+?”ñ\n’(\0[\nY=ÁZÑ>O¢šQtkèÊ¡µÎgÇ¥&Ÿ3‹ÊŒõwÞµM>pÿ#òìÜžúÁ«ròè%™KAT‘Ú3g†¿uöÏÒG6Ù<ŽºdBÐOpŒ±%…$õá˜³ìß¼Iv0ó¹Œº¯ŽZxãH;¨8Œ+Õ,(I÷\\ËÉ\\í\\q^:pÇf_>-6ïë-`\\dHêKC®¶fÍ\'ûÏ>æÆúý\'wný£´ûm~{[`wWse±·ï>—xWšlö\\õÕ»xvN.œ¥ø^—mƒPÖ?¼aÛ<QŒŠä’dÁ;@˜óG&Ee?2v>\'©cË@$Ž3I¿\\»~E.«4F VÖTÈ0¾|JŸ	Ç 7€æ‘û¶®Ài›{¿Ì~õg^ƒèû‚”àÌåh•ˆæ¬Z·£ya#:(Í)4’8‘@œG‡b ì&íÊ\0P\"4@ÔÜXSvcXµ~ š£ê¿u~¬ºRkDgÌÁÐù™êƒÎÍàõBª¢àÂwQ¼ÊÎ#Ê@\'ˆ.­<3:YMmËIå4¢2OBi?QRàYfüjj4NãæÔ“/ÿÕÿ#«–¯àâ»MeHŠ‹#`³¥Î)Aê“\n<êÐ¢$^U•hš›ÇÈ€	Râ„n@:˜èCi.Æ{ôÍê>M*¯‘ˆE»ñ/þ¨‘bp´Á¥ù}D¿üMg›,nXF*š£r±Üsæ¤·ºWíÐêçhF.&Nñ‹(ŠÏÜ´áGXVš/%\0¹Îc~AkŒ¥Ö,£-qƒY¿r	|Ë¨t0ð]«	%È¯7w\08§IQ-¡b€:kç9W­döÊº[™ÇµpŒFÈîÎ8[ä0Å‰9„›u.¯_ˆÝVÂ˜ñ215m|6)ºïºAiz#úÊdçËÌNI~aºù‚Zž\'ò;yìuB+ïs;ÒËí²ˆ&”ÞÎž?)O?÷<Zrj™1§Ø±ì²ØÐkcYÉûª.sÉúÕU”4VIMaÞt~/zo!0èä¼\'}76<FœZ%ïÄQÈ1Çgï”\0£ò2ÑÛSõ¤Í¸\\_Øi\"Þ²C…_~<0·6öN%3ó[fS=óLõo{’ôÛ\0{¦¿Réº|—ß;µÒe·çG£YøáTùHaœ0û«ipÔ2Ã–Tá‡wêÂ3ëÂÓÕfÅ@»`7úÏƒ¯a§Û?Mä=mâÂ·È÷žLi`6\nØØ¹ªhD¢ñ5Ë\'>ö0iñc8ÐWþî/d¬¯[Žf,%õµÅ³èš.”-»Åyêü¸	vïˆòÔ ^LaÚ¨„•$¨ÞwðÅ¤wa€ÏHenjä©WH’/‹F rƒÒK8TZ§;UAXà.Þ$\0†(ºM\0arF»2¡ƒÄ¹°C¼fX›$J¬¦X€w_YEŒ	£­“’¤B³þuðy¦ÚQÐ‰kµL8»ýÖMòÏÿô¬|îsŸ3dhùt6§\'ýÔÓŠ”6‡Z\\”9%ÊSÓ­%Hß5ŠÓ’‚º2[\0nkÂpÖ¦F§„Š:wDPN#A}NÞ¼ÌNQ@,£F6†Å¶Ó×_úøÇä÷ÿ×¯Ë{Ii•Æ©7)±Ë’IW†j&ÈBgßÊ{Ë#rßGIb±¦¾D{;6ªMµ¶î>)Ëcâž|ëWÕ2©Íµé2ÈGIÿß8zJ¾þï~SRY]3 \"WšÎÓ…où›HË1¦}Ò8:²\0¥4nœ+<==ùÚw˜`¼õ\n§l>_.=º	‡‰ð§‰ôgÂ”k.\\GŸ[,ÃÝcrèèi¨<ŒDDa(ÑPÊÌyŒ›Ö«ÇG©Y—´œ^š/ê[¸m##nß×Îu…S/À<<…lp9ÔôÂ¡9£^¬sQø€(pÈØü¨ÃwufYg<\'Ë!{ÏÊ³/ŸgòY´²Šîu$Ë™Š¯´¥¦nË‘Ž©hªµÇnZb´\nß®··%\0¶žÿdm¼íðÃÎðìÝ³¾P]Å‚õÒ~% O¾Ò--­œøî•ÐÊ¨ÃÌJ6rÑ”â¢?¥4¸Ù-“ýÖ!ßYE4/få…—^7øj¡Ö·¸Qä¾{ÖK55¬Ï}þ÷J¾QºçNã¤Ò[Òµú½:‰Kdç²?“Ç¿ýM{_“¿û‹?“ßÿüçˆ˜×Á¼ˆW™Òå,É‘Yê^ªíUË÷<K\0õõG5íœ+èâ‚uªJ@ëvÆPgzæ…žZ\\ø)¥%^zÓi< ¤ÖüÚ94n7\0Ô	@Æ35¬¤˜J›Q‡\'¹Fe7Ÿ*Hy©KÙ¨oEun¯¾Ž8´g0F¸¸HˆM©3\"­ã¾TðôüÔÀ\"W«Â\\„z\nQìgÙQ…Ý˜‹ü£ËÁ©Îo{ú÷Iàvã²É¦\0o¼\'E0#É3,¸Ám3ÖC=B\\´(HÏKÊ¡™dMJ\'îHtñ-¤©BX©\0ag}g\0MKó‰ùYÁ^)(QÜq2ñ¥×ÎôæKåî½¥Ægé™ŠaK‰¸E¯Õ±šDi‹1ªÕù»Ú5Î®uJ_gŽ¬[Vƒîz.v·ñ~ÍÜ¡¾|1÷	³q°®<ÞÁ‚ç\0ê¥D…ÌE2n.\"Þÿõè2¹cºpü[:˜QÂzÓôñ³!YË@\nÈKç\'äÐéÇ%E»€È7£Ñ¡fùØý÷Ó^itÅ/5_‘sð>uÔhuÕgRîý…ÛeýšåÔ°ŒÚ¡×\'G‚lJèÂ?½ýð©ƒòä|;eŒl\n!Œ+8÷K¡F™%â™%Êæ|ËdãQzP˜Ä¬ÜF)—¹`£|ãÅ Üªá5ò¥Ð>\\îîº/Öù·uö…·ÿOýGŸöÛï§·\0G¾”;;tùîx`üa.®ºŒ²å9-ayã”ÖD Þbýmfw„› n‡‹a©¾Z6]¿²ª£ §)ÜkMS¶$QXæ)ˆ»GO0Ñ’»îÚ‡qg¾¬[S&_ùû¿7Ò ‡Ç©/Ò5ÍÆ­eÛöUBçÎ“ÇyÏ·2ªéR§¤˜éûêYt½¤KÖQëSÕ‡F†S\0Š“ú1=À8“p¹ç[äôÚ1\\R4¢S ø{ìM€H?D½’õfx\0(ø©\'žF€iß\0#Z4œQnü;ý³þ]’B8dØ0)l„ô0HD«£ÏLÔì q\0°éÑ’š\\§_KÎÁÅ•Ž%3(¶ÿØñÜ<Î;^}ÿ×M£pã õ]Þø»»¦çbÞ¸±àjk­õLÒÏ$Ñ´ò“¼žRh’*ÕàæÇFu¹º˜ôxÕ2†Zü\0÷,\"H¥ÂHóNÞrýªìÙ\\Š…?‘Ÿ«U4EÖèZ;£Neõ…CL‘ƒXLŸ€Èwœ¼J|gÝÌ¾lDµÙ4‡tÀ}zÖˆ •°ÚrdÕóŠ·£‡_ªödÜc%ÝñßüØ£rè‹òì‹oPcHÙ‚%ÒÍ<f;ô+±8&	ÙØ’¥˜ÁÅcÁ’yÏ£÷çBû@·¼ôâ‹t±Írà¶»eÍªmÔ&Êž­U³1[žQjÉüg„t×Ñ‚õŽØùeL¤©æLÑI‡“‰Aj\\GPÆ°yëg¥ç¹™ÍC7  ó†8%ÀD¸t-Igß&*s2òíÖoÂï’îTää¸É±ûíy{Û +\'k‘g ¶#‰Tº\\ùñd®*åèq¼Ö|Å\0aMõ?3¬ÒÙeµnf¶*ù•<¶ Å.\nÃURˆíˆRG”œ;… \n?¿ç^~Ðd>ƒõ²~ƒlIŸ8‘‰|¾õÝï3ãU#…Ý|r§A˜¾ïžÔzŠå@ý^iéIðøÃrúj›ôsb[=ååYÉ»:¬‡´\'E„ƒö`P€ic¹h4Òí†ÍÝ›wIso\0Þïúï4 qÓOæªQ Tíjz¦FøÞü·‚:xœœ`€‡^ÌfÀC‰²6\0ÇÂßÌ¬OŠ†Š¡4Ñ>\n÷ÓT3®ziMJ¤©í¿{3{\0<úÓßkG‡Hñfƒçßy’<fIæb˜\0Ø0`õRWÓÎ¦‹ÉI½P*Ù\05„¤3tWû™Ê‡Çã2ÞÂ^Œp9Éçb4õ³ÖÃR\0UN´F‚ôdÙŠùÜ~“¦©%Ÿß©\'ª`c	[€ë¨ózo§6äÉ0ßü¬PñÉŠÆB&þí‡>e•_9*C}}bÇ\nÍÎÁùiN¹UtŒŒP*±É}÷?(%PnÔ\\¼©©V\0jÑV¹õ–{hÀPÇÔª\nóBÑyöù—yÂ…EòÈc0Lhi8Ë÷pênéè¤ÜQ€ÑÄnHî›dxhT^a²Ý%ø¡eUK\09µË´Uª£JÕTRË-”Tu21=$MÌ2))ÑƒPTšãÆL©–¾Íy›ü/ró\0ø_ÿ©Ô‘;¿#Ž.3%í%)Xïg/ãõvÞƒ\"ÀÍ…°€h§”h†B<ûàÙåÒán2I£Â!k×/’­tÈÖ¡‡-Ã­X›£ö±¤yrBÎœxCÚ:¯0–ÒŠ’cjetJEzIO¼h[G\'G±ÊE€N);wï‚dL‡•y³*yëÄ< ÊEWXTŠ¯Ÿ¢/B-*NcÀ4 CÄ5‘^&ùªnêVÿ#kxàðFÝÏøY_A†‰ƒêïH#@‹¿éïoD€I—è×Ìn£îh¡cj‚\"’P\"5Q‘úÅ©A0iäÓÌ™µ^§fM•Ld4\'~Æý¤¿ÿ‹¿ýëPWß ®ÝOxr}+\0\\€ÚÒc‡èhŽS\',ÕG¤õjcåÔ9(äËIêÄ:£WÇ\\vôj* Ë¸Öt£‰huùÅdÔƒŒgñÂC;<:CâFSŠ»ÀŠdÍÜe”˜ð¤Ë<&ÈŒSK¥Ë‘v¯Œµ©Þ/Œòe&	RL>{+&÷Ý¿ˆMþþo¿ÊØUìØHêçÈJGÉNT×¬zAŸR;yŸ«×íÄÆl5ø\n¸~7–…ƒ‹¥ŸŽ¸Nª»ÚÒJ7y	¼Æƒz½{V^>ü´¨¬X±JîÃ^ëFaSCƒ…Õ×®šw;’O•L*y>Ls$‰4ÔFô«\0¨ˆD*Œ	´ô}”w*‰ªóÄäŽeÏÌkófz×§\"\'&LŽí˜®½ýno›0•j²\'FÏo™ì¾³ºÞ†ÔÌŒ©[gSß¨ã\"n fA±—^Ïš8´ç\0á¿ÕüVÊcï{Dvmcì!Ÿ•&]J‰‚S*ª«dçŽGåÔæÅrøµW í¶„×å/¾ø\\™R¿ @îºç~ŠÜ.9{á*mh°üýãÏÉ±–~©«¡sø:Þ€9zˆR6ìœD)¢ È¢µfá\"È&7Ê¤èb¦&×¡¼ÿÆMSÕŸt»Y4\">ßÒà—n~¤£>ž~ñi\'YÃÂ4@ÞO;¿Ú€é$Ê¨P\nã6Ã $‡™ºÑ_6f¬fìþXƒé¢i3B£A,—ÒBåO¹ýD€ü\0àOyþW%6«ÿÞöÝ[Äq½[¦ñ6Ô[§øq„dÕu»Q{è¤¼1$…¨:†¤²âvÉÙt=B\0ÿÐÐˆœ?Ç˜Q>K³ívˆÝ%F ë=¾úê!d€Ðö2ùo¡¡¶Ë…3—á†“¢Rn¡é´«ª-[ð»ÒÜƒÿÞ¤oC(cdËö[eÓ†u2ñˆWžAžSP$U9Å\0>ÅF)	üÓ×¾GGÞ-ûö4H5A3_ñ¡!îjóþÂ<XÂÈËetjo•ÒÊrÇ=iïGº†E¾ùý§èŽ#ÙG”:ðÔô8­1®a?s`Æ1u8tº“Z©ÎÉ&R&ê§†©Ã–¢d.š!„¸–œ0’·Õ¥üÌ¥Q¢Éli\\À5dõTö÷]¼§lAj*•ºøŠÉ´îm\'•{Û\0 $§«&GZx¦Ç–gZœN¯×éxV®µY™Q„/\'µ`×qs‘Ûqmq@˜â$±þ®^³D}ßCp£´è‘²t;;\'¯cƒ<Xi45¶¯”Z%/=ûC´¬çå/ÿæ¯°+?@ÚAÔ¸®Šûiæ¾$\'päèÅ¾)E§óÖMMc€õ3ív¢F0ÓaŽpò™˜\'œ©àˆ±»F9Áµ!bÆå…ÞàHåé§€Ý¿Æ€sÃßüµ~7Ò]?¸t³#ý¥‘ 1Vò0*P¦‚‘ŒáÚ¬÷c;$bN¤‚t³dñ‚æÓPLgpÐ”ÚþC)%¬<NÓ;#µå\"UJÇOºý›5À¹qÆífÑòßúÛ¿óša*=È¥#\"¹è·nC‹ä«p\n+¨²qIŽ+‰[›K\\Ð³Dñ=ƒ`Ò9Nw™<R7ÂÆŽêhËÎÎnêf]D9:kÃa¤±:%³×å³¸]kn6Rå¸	n¡>Šš^¹Â|3ê Ò90†Áƒ½m‘Ž&–#Pˆ&¨¹Ub‡æeŠÝá×^•5ë¶ÊoþÊÝ†d@kñ«/,.7(•ÚýV4½2ùáKG×™){·“Ù©4ê‘GŽ3Ï…&³=6­ù6ßLÙwë.Y½e4§t%õé—Þ sPªpÿñy=rùú5‰~ÒKäA¹ÿŽµð«Ù•-_”¡‰\0­Ÿu)ï›É‚ðª†X©TQ\"ÜL7€L]ØO²ycQÉ×WÏ]šë™íZçÏ¸Ëž_ÚËË^ùiâ[íïo\0LÅ/æÊÔÉý!oÿ†ý”DàtuúäÕ×Gé\'Ô‰9§ž¨ËA-zIu˜:÷ ×¸u•5x÷l—íÛªõíp‹¼ðÌó¸0¯B«’-¬•[×Ë¶5•R+ÉCLA[„(ýOþä‹èMI±èÚÝvt€Å¹ïáû¹À¨¼vT¹Å°YàuqÒjDääÂSGim>¨W;kµÌÎ%Å§»×l“ã654°0ŸV©*f­–ß¸ýëÈï_×\0õnF“Ü0JLéŒ6ý]O%~7€N¿Ñž–ê~\0o‚£>.\n8(¥E›\')¢&%±5Ã½·ï]›®%¯¦’q5ãÂT\nÞ~Zú›ÆµŸ’Ãþÿ€úÐõ3u-F©)­&?¡TLhRË,mìp¼D¹ÚáeœRœÜ Z}C¸0FÐ#·B‚ž„ß©Ï¥ŽÍùŒ«Ô ™~‹ç\0«k†›M=6òÅ¥E<R^RÒ38®óääÖ}û÷ C¯!JìcîL‡QC¦¶rõ*²÷ágØKýí¨²ù.k,’Ë—’ÒfAÝš/“øt.qz6´C*.–æîn±¾zœrKß´uö@ÛéA£‘JJ:_üÒ—äï½OVoXÁ±¥3šWŽc¸qÒ Ü\'Iÿ­”¼<¶µ£CÙ¹i…ÔÐaX:Óþî‘^=…4²µT§ÂCE}UŒèiÎ\0™ŒË\\\0]¦%K7ô	R|\"ctÖVS¸\"0Ûº5irô÷~y¢¦î×ÞV*‘·<\0¦‚×øÚÖapz m°ZòÑÌf²‹OSû›[Õ6>¨<Ü^pa+/ ¤¼?oˆ™¶D,j©ÞoKiLooyÑrôÈ	dTL×¢kŒ“¢0ûµé|³Œ?p@î¹k5F“n¹eÏÃê¥W_ÃËï)1C¯Øˆ.@+|÷Ã{Å‰ú;ìÐœ†‘¨UO\\.È(‘ Êom:D©®^ÖC®É/‘~ÎÐsÔ–†é\0;è>;”¢Á1Ú¿qû×àw³`D€Z\"S`3À-	õÀ7¾~7\"@£¢÷¹Q4¾sÓÂFwÚ„@žJïÃJÍ3	TÀ6ÐÁhp?E†´+uúµt.ïõq.›»úí)¿\0‹ZzXx k˜Ý²SÓüãŸyîE¢C¤hvT&P‚|HùÆ1`¨,-¡žWihµ™Ã„aEžT-aõ…–’¹Ç ‹Ñd¡·AÄ¶>\\-ÑYDúÑ\0÷õ£g¤»Â$)u˜T»¾±†æã @÷SŽIwÕ³I½ëqÞQiMeóaŠÅ7;%oÂ}šÆÓÇ?ü~9sñª|í;ß#Ý,zø¤“H\n;yuo¥¦|­½¥Ù5ÙlLZšòÜ&è-eÍêe²6ýœúpµ:Æ°®Lj9QgiüäbÎZ…a¦:D™MÇ(AÏ™ ‘Þ‡>´ËÐ.öÁõÄqU©NÇÂt<›³—è4ÉFžŸÃ\n¡¶ž~êç!Ù°ªM¦˜ç&zÀFÚ±U_yùÕÏ¼|Çmª8ü¶¸ýäüå­ðìsÃ—_}_Ûõ“«aº»|È“OŸ”z¥°|×\'ÊÓ<%‡êð¤R/£\nœIh/*Ê…Ð[CñXoÝ]Ø³iÃœßÐê ¯¡û¶ÝqHþòËß’¯|å°`g¤F÷=ø°Ü}ÿÃrúÃÿøüçå8–A1¨÷›G§’Á—RÓRI¾Aj%ADõjÊÙ™’Mk—ËÅ3ÇH)³9Ñ7a¤š²­%»~\nŒ ÿFðÇÁïÍþè›Ýµ>­÷©h•3_›&E]~N°I.ö$ßõç¿O©“^!ú¥÷ÓæßÍtªÝÔùü*ã×Y\\,jã_GSGoªÜðÎÍOFW”h@ÉÊÙ)ðü´[š×øÿõÓž_SK%\\3êŠŸtœ!S¹²v•[>ûÉò{¿ý)Ù½mƒT1V´š÷5…V‚MJ›\'ª^¡eÔÿªÊsåÎ;o…uÿRþ!ç\'€Ž™ÃÇoûZ¹ûî[È2ü4Íà#BöÔÏErÃÕ†…‹Œn±þ®‚TW¥oƒÔd62‚\\èFúYëä6å*©60Ai¡ÆôïüöùÂÿþƒªuõôaÃØ e‡NÆÈj’¤Á&ÌI6Ú\0‘™àõr€‹V­–ÊZŒLym\\Ôä•WOàOÙe|FÓÌPÓôô´Ô-¨—ßþÌgä—ùÁœr†\nÅás¹ã­²qžÉD€¡QZ2¢~Êûö5óágJM2íÓrÝç¬¸ÅåŸ¿þ2›xÖesd®!0Ñ·=ÏL;½¾Mnoé0ëb*ùÑ™]•å¶–é°˜ŽŽÄe‡øâPXàû¥ˆÂ,*çá„ŽS¿Jâºë`„eÎ»š’zØEQÁuk$[IŠ,`\'¾ÙŒÆ\'uC\'ŠŠH¹ÚQ<tø´aúØ#«×†ÆeR^]+=Ãã†©¥­ô2W÷Ô…sà\'¥Êèˆâi2©)ÕVTÉî-kdÏÎ9ÁøH½ˆtt…¾~!é¶ƒˆ+‚Ã‹Î·ý©4óf§×HwoõÓèNÑóõ%M{IÿþfÊ«QŸÖoFŠé¿ßhŽð£¦1”ø~Õxý5.ª@*VlØ¥¤\"4àÀ .ßÌfèO)*?áò_uþ«jDVÁÊ€cš5a–Và9^¯²zy…ötHQvÜ9>·®M€ æ\0tzu³ÂúîÍ:l#‚ÖÏF;ÝªEÖ›FÅz¡ýã”„®Š]Jµ^£3cp(õóÕßÑ@5j¤ºAµRš+vuaáo¤©)Ö|\n#3(ãäñ1T7T1’TnÌ\0V…0Ì+4Û…eÔ“UÑ£O£äBzòÚÔ 6g\\ïÝ¿—ós¹±YëÖæë­\\#Èä’XeÀ	,bæÉ*yôÁ{eÝâô„ºÖnäî6CÂ¸uÏæN®	|Lª»~½×p‹IrÌ6†Ý0Õj×Mð{¡’)®+\'é}w§%F·™¹E¨}öÚñö¤÷ß7ç¼‡þô[ÿö–@‰—·¸Ëa\n7d¢PèéñËé³ê¡‡E;t—¤™–“X;’%Ÿr•š,HrÕêhÀ vön\n51ø`˜|`SÇE^YY‹{0®LHÓ4&¾,4+\\hcq.bžE?Âú³4=°°jÀ˜sI¹¬À¹{ì„ë3r‰1ˆaÒ„YÒGy†qq¨å®…™õÔ÷ïÝ&÷Ü¾XŠ#GÊt¡G…XkƒŸXÝL&Ë$-\0œT¦íO¹¥;¼iŸB7€Pë…7\nxšß¤»ÜLyµh¤¾\nþ?–]bž+HMsi|~aÔƒHEâoú¢7äuo¢ßèHsp}ŽŸvð?Ë¿k‰ƒôÖP©ÐM×™NŽ)FäB\0•fç‘šz&ú0T-•;¶ ÀØ²NÎžb.òÑ£\08ÀÏ}|¨ °2.ÝU¤ §úeíèkX§ÀAãÒ5²>ê~š)úÞ5êÄ<5 JžKüã÷¡°á…hÉ»9š¾,0t#	QOÐUÊOÇÀ¦.Ù¼y4’¤,\'Î#m²©ŽcÉïÃÔÕ©ª(JL$¢põ”·è„Œ_Q\\!wà=©â´ýzâÔi:Øgà³ŽHU-3>˜=¢æ¶{wm¼d÷p¾iVžÿáSÒÑ‚q‘@ã=Ç²uS!µÉBHÓ¤ù^cSÉFßÆ™\'½ó©vƒXJF:ÜÞKÆ`!K:v|˜Ñ¬ŒXœcwÛƒÕvKø.“5Ð–J;e2müÉ©Ÿå¹ñ|î·l\nœòŸÅÏ¼c÷ìtß\n«Å’“\ncGÔ’KMŸÍ–˜Ç_¸Rar4;‚v7\'°)&¥€×˜%ñ}Óùª÷cˆŽÎÀÐÛ¢Etzwî$Í#uÖZ”\nqÑÏAU±)ï]¯»·“ƒ7Œ”†ìÓÓzŠâtâ`ìOC<Q$¶\"ô7s2èpq+¯›‡‹ÊÊÅ5²mÝÆh¦åhN:ÐE°`Õ8™­Q¯!±c`SúÅO úÖzÛ›[Mƒn_ú»ÖäR¤¹úÝ\0;MyµN§iðÿ‹ßß¸¿>Vï˜ÕM&‰ªU\"ÊÓHƒ›{s€š¦´@®_Æéýó=…´‹®]KÇX}¤‹´/`ÅèÁŽk’ÌŸ¢ÆteØÂ—2V3äâíí[¯A}\'Ðñ°É/†SAÔŽIï_#x]­x(Å¥ºªÎP‚(6ª­U-Í5®Ÿä¼`ÎÇðËŸ„G¸·Ú¯059u\nƒÓI†¼˜uÔ\'×¬X*W.^Âöê\\»½¸Ïn3zÀŒjeõÂ*yèö½4_qÊa÷¦Çüjæ‹èù‚E‡MmÚ†3Oeº‰søh/&½¯ÎÛ5h„oÙ³Sî¿óvùÕ_Hƒnhòƒç:äË÷UyéÈi¹†SQ¥ ç_xVÚZ0=`ð½gzDòqÜ¶àÄã`Ô‹A„RÉb1Î‰0Ÿ½É‚L“q)£YãyròÌ,¾™Ì5X¿”¥(ó¬LLvèdºæô¿½%#ÀTjÈy}ãìø…G¬6¶ÊÈ ]Ú[l(2nYª$‘Y@«àH65eä!“ÛìÌøhXP…î³¹Ï„ôvw¢©–ão…\0Ý(hÙå–ý8<OôÊÔ¡S42ôÆj>1G:KÚ€f4$bãùæ8´ðâ@EØ›LÝv©óineÅA&ÓBÚhfqº1Z¨A÷»¼®TŠ³LÒÙ:,ÇŽ6¢‰ÙL.žÆecÑFrtÃLÒ\'RCï«@s£©ño/FôuãëæÏÑY£B®Pýn€”Ñ ¸Ñ¤¸Y/4~ã>7€Ó Çà¦Ý]ˆ®Ô±Ô·¯‡Îää8ãÑ;™+Û–e•»vn¼Q§äyÞ¼y´ñ—ŸoœbCRÔ9‹ê·ßtå¢4_¤ÐÃèÑ+Ršë”xÝÍ‰œ>u‰ðˆŒò^}è‹Ÿ|Â‹>xYA54˜l–#¨<ú‰ˆ³pl~AV,_‰\nd1Ø3¸.7Ñ-í2Œš¨	·¶4C‚_/åÒ¦†;äÜÉ7 §4‚övejˆ(Òq½Iš/_’é¡!c|Z‰­]±ãÕrè•SÌu9+ú¼¬Û²‚TÔ#KW¯”µ‘ÞÁ]|R²W*’]Pj¸…9i¢›cœ“z~^hfíííøVuÌ;ï¼SÀ–UÐÇWA~øÌ9ã>CÃ˜ÿº‹0G€ÛÇùýµ¯}MÚšÎ@È.†	QÍHƒÝD’WQ•œbz÷5“³«HÐè¼)@ÝÔq#ÒIO±b™*•Ë-Œ¨	3ÛÚ¦Ý[1>Ö²«Ìš×”JyÖdÚü–ž-ü–@öíÂYÿõcÓWV–d¸3Æýr­)Ñ”ZE”Ú_N•D¨»„Ha œP³üø0£ì–‹-Áî!êåtSò…/|ç•tC\'8z´I¦á§¼ï±ÅMGì;/ËôƒXdŠnŸžØ,‘á \'ºÉ²<ãç<£8<‹?n¸(D„°˜WOµ\'s!šÐz:sÕ¤8ƒL{‘‘¾6ì³Ð “Wõõõ0w$W“xÙè”ãdz“wù4ER§_½µ¿›c˜n\0¡¦žz¥ëïTû{Cù¡W¿!O»!Þ\0Á]¼™þêk”‘?\"4Þ$úLD«¥¸‘Lp¬pÿvl|³‰a\0µ*«b¸ÒfK?®ßý¯ßîUŠ¬VfÚ©g4©ð{{Ú1”NÜ•S·¥ÎšQ³4Ëš/ž4f…(@9Q…\\e|ióDT/|íJ4˜i£d¢®8m(+ìD<¹¸­tuõH³}Ã*9a}•/!UÜ»sµÔÐ\\Â w˜È/À\"¯­å$«® Næ0ØœÃCƒÒ|­I²Ø<è\n¯YµÀÉ”ÏüÆ“Ïýñäèãœƒ·P<°kÝg»LôEdÃ’øHNI×G‚¦)É€4mÇRk’!VG“%˜ô\0ø_]ì[vï÷<x€¦Oú³8}aVN¹€ÃÌIé£nmÕét¶ÒÐ‡<a©ÇnFµÄëV­{ßs¥\0¢Z”MWÚŒÕù9†f\\Kq¥Ç•%Û«>(‡¦ÎJÎç)¹Þî¡Nž\'%1§?0RçñöïÍ«XužCP~à[öö–ÀxªË:8½Ñl_Vš^ÞÝ9%Mx3Žwž­ž°ˆ% 3~*õNv&½Ëà~mßº÷r\"2å©©–TÇ Ò9ƒväC’‰íÑý÷®dw´Ê=î“aR¹Öž\"J\nÍBöG>ç’•kË‚†j#¾›ŒSÓÂP,ÔQ#BýF5?†’£±Ü±~…l]½œ2N¾\\¸3ö‘(4qÛ£ÞO0’0„Wž«\\Z/õónÒæ¿¦ˆµe)Žý{Å’›µ·›Í´Ý•P:²Kiaúftx£ùa<æÆÏiÐ¼Ñô¸™ÊÞø»Þ/J	!m§´¬ˆz`1u¥L©@“=u)zTÝôÓ]\\}’4*à§&…úõÓ$+?ãS_;ï7ÜÿY_ÁÙ¥D<ŒÔæcÔÂÔB«·jMsqƒÙ¾i-u‘áÍ§NÑ~f£,[ÉPúò\\5ê{Z–ÈQ<Á<ßLZ¦Ë“&J%F\næÃ7<™)S‚ç^²<~ßË˜7+525#(\"Æm÷ÎFpb|”T›ôÅ¥ïõäÚK‰LR,@ƒÞK]y@¢³“âfÞo‘åî=€loVžh’Ë}eL¥/œ×tÍßøÖã¸Â˜dá¢Å²fÇ^L:(CSþÁ¡mT¾ùoSÎAº	}Åæ t„‰„6ÑÙ­ÆŒáãw­ÍË«dÅš¥ÔÃI•)xf&ðzTW ´ÕÀÃ2·ªI„šåf$Â9Ä,•Èèô%,ùÛü…N¾’ãÅssƒk²&Ú7¤Â§MÎuÍ[óö–@‰¶Ô%ý·JØSkŠ;­þHžtäú`R&\"ä9x›Å\0M-ÌjEÄÀ˜LhN\'\'bu©¬ÄÖ|1fÏ¾ôò1æYt€@Îuâì°DLm3›—‘]~ç“»e€¡é|«\\=wâtlX³RîÜ;õ$Roê6mH€úÆ‘!sÊ×¡=8º$é6:©9nÃMøÞ½›dÍ¢t3D]´sZ_Z*µ|Í‡\0§êT½-ÜÏâ|ìRþ‚¦¿7ji7ñäÇ97Ó]Cå¡ó4¹Á~¶³\'ŒPÐp€ÖŽ*µá‘Pwã;÷0ÀOHo|ç¾6•èÁ÷É§Î³qéz\"^¤ÖSÃ¬ÓRÄëØ½ÛeßÎ-ÆE£Ç?Jvõù4ÛVœ1ÇkÜÒ÷H;ÔÜÌíBŠ¬‹õc$ðtNï³®¨­g-Â³pÆ×ÍçM¿_–m|öQf~ÐH5©þyÛ6¯0ô³7Ÿ)ˆÄLé<Ê<Ù´v=\0˜n<á;klºYê­±¡@6î«ÃÜêëó‘8·´ØŒu~²ÆcÙ\0ur\\€ŒÁM·x9œ»Lem<P§?~¤Õl.9õ%€f£aÀjó{ÿ\0­åN¨V‹áìý’üýWþ’¹¿\'±á¯”}ô—deC¬d)¶­+¶•a”r½Óh«‘ÈN&c`}åÆµ²ã–»dÿÎU4\n²cyúùSòòK/P{d´¶e¸EdÀuœU\"º¸«W-’{oÛ&û×\n‡f|ZWZFä»Ì»¹z½‡RRŽ¬\\±éß|*™£ÃÔ:35Aíhëç®úveYÄ¿9áC7Ü—Dê\'R[Çd:wÂì÷OÕõ]º=³ÐÑÖrí‰Ö¥+~KrßR\0˜J½˜#Ñ+·xÚîˆúüU¥ñ@³Ë‹ç!ž¦ªÅ^QG·£P¨.YP^2!9Ûhx´1\\§Lî<ðˆ¸¯Øø0Ÿzöœ¼|ðIIDåsR\0§ªªv•Ñèø½?ú3î{—|â#·\'êº«nYBqp‰Q3¹™ØÍòó¥–iùÞÇè<cZP‰,‰N1zÙ|6×Pãù³[‹‰–È¼Ò\'¶1¥#u7VªA†vzùY´\\dWéF©nŠÉJc1+ÀèfCDO,ó(ÍPuè…o¤³ÜÓPzp_~¶ÐEÄàÚH«’Ô}ðÊâ|·áè\0Ô<U‚scpÂ29^=¢CpbÚâÅÌ€–òÀæÕò©_þ „ ûº üüÁW˜¤w¨ù¾ÕÒ6Ð+ß?xIîÚÆ p:æS©&d`‘ˆ‡ÈÊÄô¤€º’i°2ÌÀÒAá\"Ñúý¦`Fn\0ÞM9q§›à—~>u¨1ñX7eÓ©Pg{É$6¿Oi)¼§xÀ\01]sÄ®Æ®V:ôµ°¨J’güŠq,V“ãq¿³&7ZÚˆð^4\"T@ÖtZ£Ú<Dô°¨6kGXÇv†ÐNj	\0[IãH5¢Óß(EÅŠª&IÛØyY&1>{3ŸN†4f˜\"8nÕiü–,š/^ëìåQù“¿øß”`2å÷ý®ÏMòü³’¿ùË¿&MÎ24¼»Šsf§üíw¾/>FæQ³Œ2z °b‘\\éž”F¬òw¢jŸfÙÿú¯ÉÑ×_å\\Œ“¢f¢uÎbª÷™f8’eòÈƒ·Ë=÷ì¸î`ê>ðCÎñ/ýå—!÷xÿG˜Mr?›üÌÁ´7ÈbÛ¬µ&I&¢†½¼ó¸”¥u«e%Ëó/ô‘A4Êîlð=Åþ™–m}}ýíöìåj”ð–tŒyK`WÓ3«óýdJ¸Áé„´êuËÑSC8®dI,~õ‹\'¿	²¨™!×`ŸLbtPY]${÷î ÃJ‹—«­-ÆìÞsß¾.¹¤~¸}K+—É‡?úaìˆÊäåWÐ½º`˜|â—~©nùÆ.˜vAK_Ê=Ãé™•¯~ó‡Ò6Œ‰S\\Ôó<ŒJŒÒlÙ¾r“|ü½wrYÑKàæMùsuŠ_è¼Ž:ëùý8C¿Gp™›õð ¹†¡Iž{F7XÓŽÀ(õqaß¨ñéÐ#­õî.ÍéjD“uKÒ¸ `k¦]™‚å$¶Qà/ÃÃ.’àô†£f¬¦gfOÂ”¬Æáæ\0ƒ‘nAMp!gOâ~sê‚ì~ôý†ŒÐ¦ƒ´Ù\nBðÔ‚\0BKÏŸ…gið©Ÿ*J™Yk£¦éMsÓn‚m• ñ3QçÏÀ7ûÅoê‡u¥õMÞ|Ž4L¾yc]|4»<ÐFsË©t\"j\"îñîô´!¡T§›Ð™¯…oÜt™þúÿàçcíš²vm-t}ÉôOOC},•ç‡Z›B?‘¢Jþ´ƒnXCQdcR›xª¤!TÁôèm\n9!“kÏ\\Ë¹™¤ºùÅØ\\tø“T@ß³ƒïf™Ã8XºÉLJLÐ„ò…d<k¨?¶ï¼U~ñ¿!/<ýŒü¯Ïýoù¿óYèXÌÑ:Ý²ERÄH†!,`ÍrÒŒ˜Â(Lºó*Ý)š^&ã]¹tžs>Á&©*@”|›6®’[wí’m[p8\"×Ûë\'0ýèh•C‡)F1ÙmLC5¸‡°%6#ìýÔØÙ(´>\n—V=Ñí‘Ya¢.æŽjT6>Æ˜Æeq}’DÌ¤·\"×e¹=3\'q!2vè°£ô–¯Òó/?÷ÿÂ½e\0°ùú»ÆûO­DÆÊ+‹²c1»\\oÅ‡¬©Âs•¸aò3Ã°SW‹&“Žy$Ñ`åÊ•L; (ˆŒÛÝ6[«Ø2\"Ã\"cÉ’%ÔtÐ´¦6õD‡‡¤»@&ÿ,@ôX.KàTb=®v˜:¿¡.`ûÐ„\\ïŸW~…k@Gb\'Ûe•²Û*Ù´})QF\"}ýÝbYèM_gÎ›æ‚º¹È(³Iÿàsƒ©óÀÌ¥ÐlÑùjT÷c·›]^ÃÐ@ËnÆ´7¢Dmp€xÃÜ€ï	B‰9ê ¦|f˜\0Ð6r2”‰¹™QÃ\04uA¼ÍÁúÈC³Æ/+jÈ{÷È&àÉƒ‹Þÿé?eŒg³,].w}g\nš¢«IBIQ±zqJ9!xÓ”$JŠã”Uƒ¿Ghi·4}ÓèO#<ý~ôŒ”5¸*p¨ÍSúM¼	…o¦þ?úÝþ¦R7¥‘«F\'*e‹%ü¤ºj¯Ôl»ˆ„Õ·OÇê-ŒnhÀ™IüÒ+ö$\0¿}ûNY³f•,YZ…u<GRaðèÍÔÞàbf€ÞÐâ\nz\n3ŽØŠ3ŠÎ/ÁhCý¹rÒd!¨-šV’7»y¬CAˆ[ß²¶‡ôÝhºh“ÅA&àâ>ú·°o<>‹(MÎŸ¿$ç°µzøá=d÷Èï}æ¿Ë×œÛ~Y¾²Nãg\"¹€Lbã\n#ñÔyÆZ“œ™™‘Ã‡³×Acb½\\j¨;%çH9Äü-Œ5ÝËÙ°T	533¡\'sÆ¸b”0¢F×çãý¤,¬a#å>W.‡z¡N¨IZY¨¹šÔà—÷h…×R5Ÿ·>ihÊ$×®õKcm\\Ö¯·b–A÷¸.;ÃºÓž‘ºÆSâöÖº½e\0pÙÒÚÊŽ¹æñ)w©É”CÓ!H*\0)3BêÆ<S;E[¤L-ÊÛÙ=“1ñ¾ŠÓUµ‘™IûêF\0±paìÞ½A»“÷º¬\\¥³p·+?B ~üØD.Œ4dfm[ÿ¸táÆR2•£¥»¾ÎKðñ•KÁ:—^®¦þ²º±J!}XvuLÊP÷5æÙVA?¨ãDN/§;º\0Ðææ«²’‰pYøÇ©cï]È)\")¥¾¨>UÁüÇoFýOAÏèòþÈ¼ÔPu/\0¡Ónžµ¶\'2J˜à0§˜á\nŽ° b·b‘Èà±£RÇqæšû¶o“…Õ&ºÓ	ùÞøÄãRK§»µ·O¶¬Ø@s&ÊCôC66MáäÂõûq¹>‚N8OÖ¯C:X\\MTHôé8i\0ßj~iºLºg¾áúœ?7åkÞüYñP£ß›Õº›íïuÇU ¯ÌÄ#d.CÛ«ª‹	uÌ ‡ªáåI˜ŒÚ¨Ú\'Bãüùs|^a©®Ü«•NlüÇùcOÏ€œ<yšé~ëdß-;eñ’B#;äÜ¹KÒÕÝn—«zUŠ¦´Ú	všPKËUf…ôÍÕ«×’V¢þáÝ´±A*ýDåf:ÄI»¿kWCÇáoÃã>9sæŒ±¡èÑ’’Ù²e=Þƒéâµ«lò=HÉd’¶ANÎÐoØ²CJéöæÃEü§o›.p/\n‘ýDôH7<SršQ¡:9#v%\'¼©·‚°zûéú†)ûøÚ²A‰ÐÛ‰ü„þ–Ú½ýIè7¯ÊÑcG¤§³Ã(‘Ü²ç6ùø\'?!K¦#è§žj“—_9ÌLæ	ž[•6”ÐÛ¬nc@”N—ÓØÇQ9´™tÔ-¶<h6Ct»‡eAm¥4–ÁÂ,§u&˜µXÚMšLkÞRQà[\0;‡¿äöÏ®\'¹hpâò‰º¥hZÚ;=ìêËàÏa+OÂ ¡°õj×S(:î-eÓÕËbÂs‡lÝRBýJä#Ô÷öC$ý»ø{¹å¶ý²}K­qI=rFÎžfn/Þ|%Ìœ-«Y.sìÐªßõÃ…³s±é‰ì òÈ\0hu–°/â„òRÊ’M«eqe®Ì´KÓ¹ãû$ëž{d9öäúÉzý)x`mrk¥«W&ZOÓ¢º¦M:¥ÍEgÑN-1HÈH\\”–r½Ý¥ÁÏpr1h-JXNâsÚãO#¬<,µNJf˜éÂÜç\"u1mÎ¥ò+HàIžÛF÷èû“ý{ö`È+}ùÒ~;¥£¨æî³®f\'t z©[ºÊ ñz‰0ŒQ›<_.&¢)B«‚²\n$¤7²g×næ¯bc ®Dvmôp4X½yZóC:âS$ÿÑïoƒiE:0¼‘Òß\noî7ŸçÆw-Wª\"Mß·ÎkVù±þÌGeü{\nFVuÖâÌÉn:ž×ºnf3ä¿oÝ¶K.8š¤Ÿ\"£¸ÿè4<å;¶¶·™ÀÇ±©×ç\nÃ5÷t}DnçQP¬•|èn¨:ºäÄÉ‹DðýDkdÝút„44á“ïà¸|ô3TÊMc»»€îs\\ºÚ)/<fØ`i6b2u°Y1p|ýR¹|¹ƒéo/Ê\0Ö\\ŒÝÌ§6·výF´êO W‹iÂ*\'F×ÈIø‰NŒ;î+­•«×áÒü€Ò2=Ä¬_\0Û–M\nÊ¢¨±­•óW•*eUÕÌ^(wÞ±O6QÞÖ×+Fm6C)»(×¯\\•ŽVfÖÐáUƒà_üðGeÙðûáó]ò$Íf\\geæsÜz¢9iúg@¨umµ~ÓÚ†åœŸMÐÊ}2²Ê˜l8ehšùÉx™eœg“£=Kœ!ÛÞ°½¯ŸÃÀ®á­s{K\0 oª½&ôìˆÍzäÙr1ˆp‚zdÚCjãÀ9ÆE­Þs,²ƒ\nµŽôÓZ`n>þtR¯Àßji¾$W®^ ÑpÜ~ÇVØüÜ+Ìò›¿þË†Y¦î|§ÎÂx?ŽCÆ$éŒwúþ:o5\0MÅŒÉ‚+›]L}ûˆ\0uN†¦-ZR°(AÍ±aÍ2©££×‡­ÐpüAš&øbÙ˜-èóÏúRòúë¯3@›ˆ`fœzUÉ;µb‘eZGC:IOìÔ…¼Œj¤‰mÜnbÆMß>MyÓ Çn«Ñ €§ÑŸÑÉ5è/i\0#ù³\0‚¹8Õdñdè:ARøeêdÏÆ-òk¿´Cz[P|í|ñxo— ñ„äÎ@ð\\@mbXîûà‡äƒ{†ŸH¥hÒè°%;”zÛå’SãÓÈ²fåËÔÓ:®÷CB{-Â§•Œôÿ¢ñSºB¦·t4gRËí7£>\"lÅÒà¨ÒEµÕG¶FÌ¸ÿ1ýÇ¬Úå·Q*Ð¹Å~( :\"S× §§‡òHM9ŒÛ3@k[7Àr™#ˆQ»ª6†`}úÓ¿!ßâ9øÒkFÇtbŒY¿Là›DTPÈç8ä—[o¿CÖ¬]É„•D£¤Í/áDd×áçœº=e‚ŸqKAëíÄ>M;¹å_eöóÀð´,_µ†AZ‹ðì46‰‹ÍíRí©’¦–N)¦q·™º›—ºïY\"ÓkøšœYËMª°|ò“Ÿ2ÎáëL¦³½U@gQÐSð[½e#ã&yæ‰\'¥µ³K·µaIŸCÃà¡x˜`²c^áPÓ]ÎÀS«´$ ÄZ\"¿ßúÄZ£þ¬ç¦ºÄ‚qê×d¢w‚Zž“\"ê=ûï„6Æû_Ár¿×ÈóÏ<kØy©ÎZ­ÏtÓŽ‘¶Äi¥+MHçkLnWÃÎË8×f˜ÆHƒí-î*¸”D^Y±X ¨sûfÊ¢É¾=æœäÉöÎ¯L/ZøñŸ/yôÇð÷ç€=CŸÍMwíõz¦6fáª˜HfKsT›®‘ÒYÊÑù2Ò‘‹&¡6á´ò4\n±egÃ¯ÛÌhJ•î47_€´zÍdþío{¸.Ë¶­›dÉ²ÅÒPO‰7Ü?Å.	5ê%nÚ[jå¤:â0àª´X«¦öL^“âtD‘WÙa‰f‚”bUŒü(“æ‚9`2HÓÅ©#ÔCtFˆØic’‹6›“ÊéôÂå£6¥Ê¦qžõúH»²³M-–kñÝ\0\n£¶wCÝqC³›à½Þ´°JgéaG†å•ñ¥öôXkq\"æ&eŠN`!õ¤{àÞOÊ´qeŽ<þO\'å(ÃÛO8aÌ\'©kX€.¶·†›©Ë7(¶çÔ¥Õ?ù¼1§¢±x>@Â…ÓÍšå…rø™«\\x2Àóû;Ïn\"#6.6«2gß„»›ä…¸4Þ¬û¥SaêGÆI7R¸N\'l3|×:¨þ^AOÿvó{Ú¦]ÓGm\n)ÐêE™§Ãê¹MM¥]}:ºI½6câP-ôh`8¡¢¨¡²ƒ¨ÕJ¡¾o`HZ©wµv\\ç9Ã|~ù»¿ù\n3B¦dß¾=²Íì†eœwc~zRÎ2ØJùŽ.lååaJà§†‘­¾3µÑÒZqµ»ÅHß¾¾HJªë1êðÊ”)%Ëóónd—Û·1ùÓipJ\n‚®~å”¦P%1Ôh‹Ïmøë€Æà°,[½šÍÑ	\'3K>ø¾ûˆâ!3Ÿ>ÍÆ6ïo€ÑË$Húë2êpŒ0eBœ!}ÔQCk€?¢òVÇˆÐ5Å?qtJNÂèj•	†Ý«ëtUY™¬\\ºD{ÿ£Ô´ÓuÏC‡‰üžzZº{ºŒÆ“‰ôù©ÃW5Ó6ÓÚÖO*‹3kÙƒƒR›U·›¢ÎÒ¹.,Æ#”hÆ\\–{ï]ÂHØñLkŽµ*¯>¥dUk-Ðócôsýñç€æøÌÂ¸t;#!+q¤õN¹éJy¥w0&…X|Çã%†ˆ\\»›VM	•jÀW	Ý)­óÝu{>õ›-òÚÁWHS3Ñ¾™Ôù*ª‘.Nè­’ùÀDŠj~i—ºGvs]Ÿþá³réò5\"6è1Ì8˜ÓÖ\':S»š@Rî¥QèÆ/8ÑR!.¹N„ösÜíŽrbo“ÈÌBi&Å}ýØ)j{ÔÁø+Ë3¥œySŒ[<wöŒ£ÖèP»,nZ¤ŸáÄ›£næ°sU*_Ouµé$øMo?E8S5vÐ8Ý\0áßFç—WÑ†°b‰ñ\'\\FˆVs¹`ôÂR×é‡éàýÚG÷ÉìÈŸ|îëòò³Ïózv(@UF”4Gš–Åý>ø±Ë{>´H.‚_{â4ÝÀ£\\8D†H©4-²Pkúìo~ZªGäp’æ,¦—&“˜È²&Ù‡µ	”®õi[ô\0B1:¿ÿºÌ1ýX$Eä’€Ö’¢™•@Þõ¼7@´ëeTêÂ¢ŸAÈ ¶¸áæÑ­†Ðt©™‹v?]ÎÅh½¸ˆÇÊ	/g÷8e÷¨=¼ç@¼¬Gÿî·i\0œ£¡%+W“êµBD~¯Çmò‡ô9äoÅDï[h ô¸e`EðR	™Æ%ðd¬£i£GyOQAe!ð\0¼²Œ:d@ÿNä”ˆè^ßÀîÁ[/«réÔC’ò+\nøsÔûq©±ar Sô«ø=%^ºÅl˜ø¯Aº_‚;GïÇÊ‡™`³‡›”ÌÁÎžT4‡ÇªµYW7\0~Iþþrp÷©“gŸ~B:®]’ÒÂ\\6ç|ôËŒþ\\ÆxÐ»‘Ë-Hƒ_+NÏ¯|‰ú\" ÇÀu”VÓGµÑ¡ç°›»Cm±\0nj.ÆÔ¼Á„*cÜ<gŒE™cSÌ‚K$rœ\'íí^ÖzVØc²Åü¥™%;mÅÇ»F¿3×PöØÒ†Ÿ#þ\\0•zÅœ~vå˜w¼Ái­ÎO²ƒœ9Ý!“¨ÀV…æ1Ÿfc¹tŽ©‚kÝÍlQ‹û•ÔiòµOƒ#‹oæyœÞ‚~óY9sö8¦	 Âœe÷<)î¹[î:°—®”È®-jhú)Ü^.Èë˜ ¾ÐƒÁ*”ŠÒ\n(3Ù8Þb ]P:·è3æäÖû’éVÀ8Â	ÎÉÀ9“Q,ÇÙýˆ†ô¥ñHý0]kÉ-°q²“žùŒÁÜzüîïþ•ÌÎ†ä×>ýiFm~Ï¨3êIn¦ëª€¦`gR#¥¼Ü44à÷VR~õI§ÛÁ–mD¦A:ºê|â¦3ëf—žìê–ºò*ùÍÏ~Fvo*‘g¾wV¾þ•2F€VãK8I‡o\0BuÃBùßùm¹÷¡%‚£ºüÞ—NÊ©ÖkÈÃ.HáÂ²h9Ä—› XÌÈ?|éO#myÏ­¿ÅÔ2RbŽÄ~´×ìðª¢ˆê,Þ­Î‘PR·ªRÝ4t‚Ô$}HÃ:¯#à!\n+Âd ÊûŸ&ZÕáBé‹N)=Ó£ã¬Î\\DÚÈQØÏäïv´çø,”z¡ èÓÄØfÔ€f‡ŽJã5uÃ¦ø§_ü’|æw~Uví¡\0õôë&È‹/ 42Ê†¹WæzÙwÛÿ”þð‚|ãëß–£èÁ-];òr\"–kòúEùÀ> ïÿà^º§8éæÈk-Ì0LL0J¼ÎÎ¶Ûµ«›‡	ƒ¾–ÎäÕŸÕUZ^Ð¦nþM³\0ÍfÙ\08Ã ªÎ¡ÑsIoµÑTHCoÆK¤	¸é<µQ{ø‘¥õü5Y“¡¨ Ÿ&ÔZyî™WÅÎ|k7¥ˆ0pŠM)dISlTé¦6~èð1yö…çhÐ•J#‰ážN	Âé»eçvùÐûßùtš×>zºC¾úÕ¯# Ô\n,—c¨(-@½T–â“S(ë6,#s`-_’¯þÓ7ë9ÁyŽ,•óOÏI¼§ÒH‚ƒÌÌj8ªÔæ‘^¹:L¦V#“¾®\\4Ñ—•.®wZ“o^àÏ\0¹T2#sSë²í65ö³…°Á#E33Ðœ)^ZP¦÷D­K/2lç™ä5Gíì‹Ã&Ä¾•nŸ½%ÃÈ÷ÖÊ–Í¿.§Ní•cG3$ýªœ¿p–ÔÔC³bÙ·3«D*©ÞuÇzˆ¨åR½dL¸Lz‚?\\¬¸^h€	3%¶V#ª\\Ž3G»#¨zÓ~…>1åù9êÉªÑ†>TÊ§ÕÎššeª¨Ú()GJ;Î­åFçZ»†E:LlnÌò5Ô òÚYUšK´«Gkõ®¤æ¨dà|4“ …ºÃÂ»nß#Ÿý­ósä‹ÿë›òÊÏEqØóÔGs ³<ø‘ÉG~ù½¢³²ÿái:|8‡L%…A“†];¹ÐBr–5-¤ûøè½Í^yòñ‹FK[;î±8µ;æ\\h(£t5 Ð”|l6RC¥‚I¤c>>›¬Ú—¡\"X²¨ž†Šçù¤ÑLÇyí(§í¶QÊÅ£—FS¾|È{{†Ðm÷“bE¡±Ô€h¤Æišù¿ˆ´.ìÌ0Áuƒ²„Ó/½øÀâ©ÑPýÿÈ{ÀHÏë:ûÅ`½÷ºØÞ;—\\–eï¤*%K¶dÉr‘,+¶ãÄršØ).qlÇ-V±©.Q¢(Rìe+Éí}[Ð{ï`€þçÜof¹¤–ŒþH ~çe0ó}ï{ß{Ï=ç\\·%KÌE®!—ò´›’Gd¸€·Ý¾…ƒs‹ûÞw_v_ÿÚw068‹	ìãñý96óGu¿ñ/>Ëüç08ðÝýtðÁ¶¶n½^ Þ)ìÂò\\cËe^ã¯.Ç^ášêYÙ‹iÀ<üKñFSÐÌJ{¢Ÿ›€©LNò æ­i¡µöž†™Q\"E‹|¼4ÙÔ$¼u|Šo\0½Ìñ¼]&UÓ7ÃtÖÂd]‚sRtçÅU+7¿B0î‚pÿ :oÖv:™ý×oƒ}/ï5ZVÿß{Üò¼1fn»ãV$¢KQ¥Ô³îqÇ.ÊCžÀ§ÇÏÊ•hÞa@D‘ÎÑlKE%$¯Àyþ¦Z3>2˜…Ìç³ŠÉ,‡#‘#Ó’”Ñ¹ÑòÉž¦;ý)å<Ýÿ\'ˆÑ?Ó\08??™;6Ð_‘–™75•÷àƒÅèl¹®)t˜¢øæ‘-ÍÁwK% eehC…Üð@·{ùÅÜ©ãû±o¯q»n¡ÕÛ*³/¿óöµÈ‰\ná$-‡àù\"˜Ï÷ÿð÷hw3ðƒŒ¼Çš$wÝRæÊ—•¹fZý]ƒ=¶éÒÉ¸È+\\ÒŽ<õßs÷N·~)¼©‹3®œÍ¡ã™…†i„)¬Ç×’ ¾…‹6ÍôÉâéŠ«øÂs¯™m“ìù¡SY\\a™€VŸ`å$ÝÅì«ÊŸ€fû,j‡4gòsÒ	l8CãÉ&#þ·¿ñ›î»6‚9÷ûü_ÜK/>O€¥3F9€GÝÒMÜg~ë_º[î­q¯ŸŠ»Gÿî{î4B~rOø[IŒÀI„0=.×gš9¿ö+Ÿt[°ôzù™SîÏþà\\YáRcþÏÃÊVæ§z|>ÉMäZä•0\"\'n™hNc;–IæÚ5îÜÍ=YfKÒiR¶¬Øó¦lì6l„ )5‡,¨”BIÂ+%Ã×þŒ.£±¼\0ßÿLE3?ï#ÏŠ3ÏkÀ™9>¦÷Ýîê™î§ŒLwKcÆ(g‡Õtb}h”ä‘ãç­´û¥OÞŠeU…ûö·#:nXæm-î·þÅoºOæWÜÇ>±³ÒU@,»m|ªïÆ¥ØÚkxMFobhÍMˆB’Ï¤¹PÆ	2Ø×NG–ÆMâeÏÀÂ”ü8ÁB}g‡Îiˆ\\º¹%Ð|R .ëÀìëˆºòú4W\05úÈH¦\n}?o4êS.èM	RÊYJÙTü‘râ!úÈÈH³°›íƒHâ6¬Xâ~ø^wË6heüMÑTÃ¤ «™yãÍ»Œ+{uÀK^mÆ¥ÉãŽ¹cØwMŒ÷òÜ2FE©“’@“’×¬Ï1þ6+æy7ì^AÃ¼|y¦Û²=Ëeøf§†Ö×ÕÕŽ?×’•ywÿgûø™ÀžöÖê©‘±ÂòÜ¼ÈèP\0G›kj¥ìY¨`-¢ëÆñÇ£p`` A‚‘’”Y9¤þSbÔ³ š¡7ÈÆ{\0kNÍ7îÜÎÀò·vµ>îv÷?p·{ÚÇO>>xÑ}õÑG¡§œvï}ß#îºÕØkM\"zï1Ö6`·O¸Má$ùü­¥%™nÜ0r»¢ôTJMÏ\nýüyh”ŠÂ¥š\0õ¨­‚@$lA/÷áTíP\'$¨ß„¹jmU•£KèÐ=x²^ª‚_RuÅ½ÅÃýT\"*ˆ0‡8]nn3ã·Ñ¿ëëjÝ­?|ô}Ý³Oœq_øÒ?¸ž¾·ºæâÊÓïç>ù	÷¹ÏÄƒ÷÷ÇÿkŸ{\\7ÚßæN(+q°È$[9\0æá_Çµ»÷N‚ß“Ü7ý2c*ñ9Ø¨fLÂÕÌ<°]êãþv75«¦\n\n&Ë-]^åvÝ½Í]ó2WT	~øÂI²‘«§Ýl7#Á¥ä˜£l\nsé°§Ô[)½dI&¦»o¶kÚ	á·\0Gc¯+¬Îñ[2@^Ç0Äè<Íªe€x{×9÷èWEO7µâ=¨$úÉR\nÉ¸røZ]wx›Ý¸7^vß}ü;^¬ªü¬{àþe¸ßãüGJ¼ç­¤‹ó¾Çˆ”ÿãÏþ;Yü§98¯sÜw¿;uú(ðJƒ‘Ê8D ¶·¹ËTYH5še±……Ô²ÚÍ”·%|‰oç©B˜£Ëu$àåñê%šÈÞ[úÃ@w\\¶µå\"evÈlûS¨v†p³9vð€ËIÙáqµ™„ƒCÇÞÛ=æúpZÐM=Mêº²qIÓh&ÅÈ\nƒ|Øw‚à0¶ø\"ž®$«»õÖÛp¡)°ÃZkXJš‡ïÛö¦¤¯w£ lkéàw1n¥äWvÝÙÖÍ¡;Á>þ@öÇs‡Ií5ÖAú%òPÖ>+‚ŒÐ)Ä¬Ø¿P„wg¾æ$÷•ÀJMi¾p¶~d2åîpÎÜYþÔÿà±ãÿ-ÜxþÔ†¢ùg?áS4.FÁ?`ªSö:iL¹ ©!ÿ*‘pÕè\0çkœü³€ÑÊ.RqÂd¡÷Cç8qì øqÊàMd»³Öqx2óàf¤P[¡!u/b!Ô\0à¯ÿç_º\'ž_ëúp¹=Í”­(%Iåà¸Î5§4Ý-«Èu‡_þ¾ÌÐ¼ ô¸[¥Ò,å®g^0ö}&Ã„v¿ü\"]ès|ÿ6[èbäwu¶Z	üê~tÄøÃÝï#`3yéf2ÀbºªØj‰¨f¤fu6Túª¬QÎ2êòâÇ”J™ipµ¶–ÐqÖX¦¶aE±ûÒß½à~ðÝ\'(÷Fpt.t­LFË¦fûÄg>íúðv÷Ú©Q÷uhûqA8‰€þã,àµ%ô1u\'sðQŽ[Ê3o÷óÏºË{_$;Þ@Ð‡‚…-·Êõ…„1ÏåÌ:‘Cð4Ï\"û(.W\'}Ò9q+¦	W\n–´a‰£VX™2ÈÊ“=é!ÿ¹w/ô‹µ¬xv~’2“Ñ´9×p¾!ñ‰àwE7ìÉ}¸xÏŒÂÁãZö´·ƒCôÚô³¾Aš`jímøC.s5utu ¿dÙU˜lôÎÛn†.ƒÜrï^ªûä\'a¬uüÇéÎž9?oµ?úOàzº?î>ó¹G¸F9¨JvŠÝ®¯w§OœÄ¨÷¨ëëj´@b­®ÄËoÉ’R¸vÙ0Î@?ê2Hd.àúÕu®Çš$~­¹ô³Ù:p¸ËþºÊRèG”õøXöqˆ~çòE7ý§0»B9UÀ ëì„ßÜC·»Ýå„À))g¡l)«ŽÌ„(£M‘Bø`>PúÎ2ª	¨týUÁ°ì&Ù^@ˆŒ	ˆa¦ÚéZ€Tššq¬î\"ëÃË’÷/Ô4\n_V´¦B¼ƒaø±TY`àª˜æ¥û–E–­c˜(TâyPtJ ðŒ¸ÍÌFtŸ27V0Öß¹.-­zéÉÿ£ký†ahîÏêñ3Ë\0—××œé?³2äKËÆŒóòò508f)ÈÞàæ)ëˆÎ\"é/âV±øØƒõP@CyØY9d‚HÓRå°A%gŽÀ»8L‡XìPk¬ô,+Ë‡m¥äFW]SO ¤Arì„™ea¥Á-WƒKÃB”V×»-ËJ]ÿ…ÃÌ^XpÛêW¹»vnp¹‚X°Z*ËÏ†ç´”ŒìŠ¡8iÔV… Â#×•®Å*©Ð	*!K‹ÉºˆÆ-æ”Õk:`ÙPù…Ž+Ã2óo¯‹çæyöqº²@Ó‘Hq1:ÜƒRûõ_û%(ÅîÉoïvßüÆ7 ?ãŒM½×Æ<ˆïÙå>÷»¿í\nªÒÜ÷_hpžU¶U‡Ò Ÿî]X§ 0˜Ž=<¼QŽ{\\‰<B3öJýÝqÄòïq>ÄóÍðê¢ÔIÊ¼ãl$ùÆ)uRxÏúPæ:ü–A\'øÕj™ÉÌŽE‹Šó‡ÆgãÓläÒ3ËFW¼O`jŽ|žkÏ8¾t§ÎìsßùÎã††èüöC‘œmÕJRÂkdºÎ`T\n…æe¨§\\‰‘h~¡ŸRnˆn†µqè˜zä:¬ðÕ”á}eB€	úö;®cÜ#8[n\0Ëµ6îU{ø¡ÍÈÿþÚýÍ_Ñ}2pT_}ô+Cüü/|ÈÝvË.žkî¥sQaˆð®iqœQ\n\nŠÜfdkªŒ·nX…æ6“Îy·Q¢ò²}ûV8˜¬ßåKÈÜX«ÍxÇ²ô<·î^]I5ŽÛ¬«AÌ[Ë¨D€®¬.\" Ï»ŠÚz÷ÄÓ/»=8µäÒ™K	žê5WP„Lƒ@9)@z=--C†74t¹Zh;˜—£`B.9u‡Nœ#ésÝxTvA‘Ñðt•ö>Ö`]çÑQî×UÕjÐýÏÊ\"€*Äº>w(…ç’éÅŒJ`®åUI£>dþýÅŽ¹·šFLei‰o65XZ^˜^U‘[\'ŠÄÏ4\0ê0x×½¦f¤§îl9»ïwâ-ww6ö¸Çžìw»ÃñK½‘Q•kpü`~%ZJ˜)vy…ÏÝÃ\0—›w^OêNÖ˜ƒÿ7›YÖäœj\0>båSdÙÔ-	ÝçÙœÙ84µÄ2~†yþ¹ãî«?|ÙF?D­™*IãÜü›·®q{`—[_v%~€±nÆdf\'®S®+ðî¸É²WRÌRóC¸VfB‡/})ñÍ$O”CÛ TþÕ_þ}Ý´Ña[IIAS€ \";~éÊ\0-Ñ_ô,mE¥OsÇ)/W2/âßO†Q±÷îþê‹®k¤‘!¦ypÞû‘¸óGsÃ¼äÿüW_w/¼º×•3¢o\\.Ô”¬¸Æ¤`e.÷Ñ|Â¸DõÂÉ#~£w4¸ßø¹‡Ü§>x£’ ž;Jw™ÙºnÂÒh\'ò«ÏÞ&81H¢“-B´‚@óIS®§´»ÖÕØµHŠ<tÍlÈ×Ð¹dv®\\ši¨,ad¢+MÃSOºd+áÞ.\0.ÈB9×{Žûœžµ@)%‡ï.¸€ííÍî®»îa|¤ÇUäÒÂázÈ”ÍŒõ@r§ãÃÙ9/§œ2•€àÜŸý÷/QÂ¿löóâ˜÷»_úÔÇÜg~ý—i²àŠÂóÉèGc15x+N½IX_q%Óà®v0;F˜¾Ÿn¶4ÞµÃk\n_á½òêËâûÉ™eèb¥ÁÌ\n?/W\n(Of‰Á¸{ì‰“îïÿêQ·ÐKŽÎøYã×}˜¬<dä€NÃ,UDÂÁÁNÊQ2Ìº2·¼¢„Sn\ne€¦{,“M„Hÿ2wÈƒm F[&ðKYQ	ëµÔF(\0R1TTd‘!Î¸}»ºoå)›‰<)yï}š ·\0›#ƒ¼67èªÓÚÝhÛãî®ÜÇ~a–\\ºÓSY…+žôç-ÿ£ÊÿZ¥ðÏìñ3É\0Çz.TÌùc·Oô¶.-F2ÔË	ÔÚ3Ki¦›–Oê4jJ4ó›¦Û”Žèz\\k·ne‡‚›\\DWe%\nyZ8Þ›y#»Ð×9m`Œh*8aqs­IæzPì9x¹ÈjÛµ1Ú‹1œo-%Ì¦aØLæÙ‚Ô¤ZQ\0lpH~l¥Õ\")¨¹ÉX`N]`^“$Qé”å”#%‚é‹sX¨\"=j¡”Gcó_ÓØ\"8tÈDÁOApÎ‚¿J)al>vY€ìVØÑî}ÐÝ»«Þ}ñ=ãþöÏÿºA&*:¹¸ãü\"›òSŸ}Ð>7éþäïþ§k û)€ó8T0ß.@–L£\\…—BUCpŠAø–½Q´‡Ruí7\n°þØ{Ý”,ÛÖÉàµåÇ%®-/VúòÚ8Àž|~ºßá”Bóâ“îX$u…JÙ€ù(áÃt$ebpiø²•£ÂmÃŒL³±š”maHn·Ý¾MìiÌBhŠÐ²åy†»™£’å£À­ÝRb%›|(9¶K¦rœÏÿø€Tt%£3C”#Èá˜ïÜ×Af—áyÏ{Ü0ÙŠ†\'ep/R\"^àÓsÌpÃ\nQÃLMó§Ýršiz\0íBaqîOÿôî7s=ï!l¥4[¸Ø}ï[3QnØýæo}õø$¶%=´\'è®‡àÑe%‚]	£PÓ¤…Ô÷PÏ(û×ûÈ#xgó‘<œYf´+C„GÎÏßÄSÆ¤ƒpeHæÄÐr¼ñÆõÌYïö<~Ð‚®ôÛ!.HbŒ28>ç²ã	ëª–P51M±»Å]>sÒlÐÒÍÛ{Ío„g	±*1­«,³¦P	qT’þž®¿$ƒ\nøºöuå!7Ú_ç¾[Á¼)	¼©ÀH~àñõÔU¨Ž²]ÿXÄµ0{ÁÔI›Ñ.¤e¤Ž×§¤nº57ó^å‘?“Ç»\0&¿œ3zaÏF[O?PìTÇRÖ¸=ˆÂ:¹ÕYõ\\]›OÑ… öëÂæ¦€ÓådæáNByœØ\0×¹!ì™‹ãîüå&%*æ¤\nÈÿ¼bl’E€•‘ðŽqœ>DQ$k(zèàI—WQïÆÐffÁî÷ÍŽSêŒaµÅÝ·c¥‰×«òg€,ûtÞ”	ÑT²ŽASæøQÒ¢TV¬.dL tÂ’d>ÕºI°}_È8Ÿ<€gZ1}5K6\0*J’/ –])²©Ù¸d¯,æ â:Ä\"9÷uÃsûÃ¿s;6§¹ßùrO?ý4`âüÝæÎËî¿þåw÷¾o›ûá‹ð¹¾õ-7Di[\0aFmL¦•ü(;õ«¼NÅcO[5P=ÆfM-Êv­”[©(aR¯!é{íÀYSÌ˜ýX\"ð‘ª.ìOedm¢<@a2C+ÝÕÏ61°Â¦N2Y®—äuê–‹ [B·»÷S/]v¯¼t\0üˆò³IçÇ¡	bøÃßû§üO¡c\n`>ŸKO/r:_;†×ÕÖy2µF%ÐU¦é$£Œé9bÈø o‹®”C !\0§°Ñ³¸§Q:³™¼WùýéÎ™µ“)M¼sÎ¤ëÎÉ#ý¯ÿí×Ü—¿TíýòWm¶K6vòûž=ˆ¶?âþÃú·d5Ãä‰\nS”Àò}´#\0šÏ4¯\'-Œ,0HÝŸÜhÙÜOYbÉC_\0:›2‡ˆÉ®±®â0†aîWc`fõF³ìŠÆ½ûƒßÿ÷ñÍî˜t°F„ÉáI—™’éüì¡±¶WT_„4€4¡ïœË\"›½[¬”çnJRÇ¼mWz£C›M®í£šNÚlr5\"yàBÒ÷0}µs”½a½ à™Ÿß\'à«(¼Hú>îsïDÐ,¹Ã5ôs?xiÄýzõz2òÙÔ©î#Ë+ŠƒºŒè‹:~&Ñ?ú®@R¢âì´è¶øÂp©³¿­û©ñ<š,q©æÕ1ÔÙN`\0bg&ÜÙÓ\'Ý¾ð¿,áhR[Û0¢4èæ@mmd(:Ð‹ím¤Ø<öîé9ÅOÙ¬ˆ¸§u¼‚)fP§ÎÄÆáƒA³°(AY¤ašy”¹+ªYùº2t×¤\0Y`Á)v\0väøë­P8ÿÍLž+¥²JÕtôË¢Óh7ÉíêrÃ<3´1™Pnˆ[GTžo,€6Eà˜!¥±!‚ÔŠq2:ª\"×ºÔ|Éxú»[ç>ý‰¿ “Ý`‹}ðL–`KW;ƒaL?ÜsÉ=½o·ë&›žçï‹2IcÂ\'K¥¼W8†º®	œ‘×à)éŽ	”ª™á¥X‰4IM¨¤ÂÃ_dv€ˆ‚JéIÃtH%\n\\?sžöþ-uŠ,Ë‚–åÞ\' Æ)y°Ž#CÜ½7?^D\"¥1l*-§œ×2ïžac—W/ƒTA¬ðàU7@¹ÛÆXÒd`•õEî_ý«GDR¥]Î^ú+Ö¸ýû^ä-Ð¥šu¥ytFeßdd#²<DÊ–’#BiÐÙ¶®HÅX6½Ô#úÈ½†á}ã+¹ÖK”‰Y®ál‹ûÜgþµû›úô¾gh² ëHo?–‚=ÌU)¡±¤œ \'_Îi&W÷@¬œ\\®~¬šÉƒŒ_5í0Ý8ïQNÎÒ¦C$O¨‹pÄrý¥²ÖŸv­çµÀßÎs¥W!\"T]y©¤Ìž#˜¥…Lƒ¯°¼Âí¸…AP\\X­“sëÎòw%@îz.5#(8‚Ög4PÖP}í¸ŽfŒLg™B÷ÒsîÙ—ŽAQðw•¥¦j}ð$fôm›„5Eò2‰>¾\0žÎ^ìí£ÙXA²ã‹eÍ¶­~m÷!™¹ž7]„wñï~\0ŒW ¨ÈZ ú¤,d°¡{¹(t±æ O2äÜÑü˜[ò4¯2¨œrÅ’à´»\'~ðmnÊ3î†íÛÜ·Þá¶o½×ŸÛ~]•[³éçÜÊý«Ü“Ï=ãŸ8KÚÝ_	âm&dc‚‹lñeJ0ÍêÃ>‰µŽ^ÆÎ¸BP^–SúnÝºÕ†)ëPæ¶Vóh^‹˜Q^ê•9C€N‹{PX¤†rŒñ_S[ÄFò¬Q	ÂÃ}˜V‚7çÕÓy>„íÑy#kJìc#Ø<c¥æÄªAI­1¾6¦ä‡[–‹Üì·?ÿoÀ\\œûÛ?}Ö½Ž˜>o«l­š9ïÿ…¸ëo«sO¼ˆ†šÏÈ¾)È«BdËsz÷a j«f²ªH­WçS÷F©ú~cBœýÈ•ü#Ñu•µ±eòøÓ3yAÓ2;ù,?kZfÏ~_å²‚!ì=„EÌ]\0{›%³ÀqI»Üe kŒÒü˜a÷Ë Ö‘Gwâ…Ó\'\\¨0ì¶®®r«Då¹Ž\\ºäöbÞY@WôÁüû;à¹mã8v…&GwuÍªUt~K¢W—FéM{€™Ï—àçõ»í›wxîÖ\\»¬¨ZÚÚø·÷žjnÙIðŽ‹{àáÛÌtá™\'^à0nÀ¨cƒvÀýý?|Å¾·uëRSúôqo6ˆ8ª8Âßœä$j§;=‘®¬Œ¡ó”ÃzLLÐ<ƒËyºátšR¸›.Rxn¶®«fƒ‡PÏA¥É··SÒ¹4ª½^ÙùwvÆÀÆkQ1qèåg\0\"™ ™v!Þ–Kp.úák{Xg8ù|T\'à@—[;q­™vEëÂî2XçpO§ëi¾H‡Øçî¼ñ:xÈ£iò7~Ítò×ß|²Ôz—Q tjfï1ä„Úg9¬Ö•KkÇJ-A%jê)=gŸé“LGT;ôC©ijërUŒÈäZN,Ü¸ëîù¹…O‡ý)[„T½ëw5\0¶\\úû´¡K\'×Ìù}¡À\\<²ò\0E:‰¡O@ªœã„“%¼¦’ëì¼4wç][¡kÄÜþýO¹çO¸=û_€½~ÿ£î~þ“nÛu[ª!@ßº5È·÷ày÷Âî×Ý‘Ó8–°áØø˜w.P¦rRÏ0PfÐ7…§£”\nY0¨‹KŠèÔyÚÍn:“½-Íî9,‹*ÉÝqÛí®H%!™Õ¡gèZžtÝh7ýˆñE>½ù¦ëÜMÌ¢hîèvO=ù<ÝÔ¨1¦mÝ„$iüFl’Àà4e.ÄQ+/·)Fâ`|~ˆ®\n,1(qºsµ€Õ×!÷ûô/orÿæ·¾éžþþÐ†V3ËµÃé,~eÇCYã¾ô­ÓnÏá×Ý¹æ.p¾<—h=Kö6qÙÖÄê².c’j“X©½ ¥ÏªY<£oÀ’Ö¡·¯tŽìß¼B=æƒ$>Ê”X¶63XÿP#$ñû&ýå¡9óÜÔQ6ÈºfÇŒ-P×RÿMÈ)B]TÉ~kZÓ åpï@¿›~áw¹­Ú]ÏÐž…è¤;EÿþŠó&ÜVzFÃ‡äX‚Ï];®*ç/»³tÃ«Ð4oX¿0ñÚºwu´2ºòu³‹ª«[Ã–g‘ý˜Èp 	›ðÉ\"@ÿ-›·¹›VºËú€B@ç~0\"4Ì=lëúŸpñ†\\-–S_ýêwm´hnNï=/ˆ7oÝš:š2î©§ž†¶ÒMVIS!õeÁ×éËP\\Î_<g8‡€¾s\'Óë¶-³WÜp©¡Nm÷Ÿ‡¿wßÛI­@\"c)ìÖÎ@ïu7Þô\0B€ÕîôQŒººÉ¸¨~8$ƒ”0ã32o üÕl\0þ?ðsÍî¡ãgÝ8Áú‡x¶Sa¤RµL1¸Ì4ƒ1³wîÚìJê—¹ZF‚–VÕ»|è0æus­ž{¶Í}ý[Ïº“gÚÑÊ—Q­xY´0@‚v¿“Pˆ‘Y8/Ý÷ Òœf4mYEÀ\'ãœËu7në™2äg’¾«pnf$£­«±&ÇE‹séz÷úX0“ðBí ge´È–¯ÙœäPØÝßÿÀœ°)îÁ‡®‡s÷Œ9¿\\Âjè8âôvÎ(·ìº6ûõðÈ2ÐÃ®tõõõ,²N^ÀéŽ®Èšx¡É\'+ˆ³˜FÀé²8s	~yèQgh½]ºÔë¦‹2Ý‘}/»Ëpû4~0B`I¥ƒ*±c êNbiÔÖ’/Kf­§ù¹Øë°qÎ:GÙÐ	ñt­[—m/eÂY¨/3¤lhÂ45O!@ðó™ãpœÉqœÎœ¾1ÜœÅùª€Úp\'Jï»o—ûâßw»_y,3ÍcÃLRNþk»\\ãž;0â¾ñƒg‚Ã¢‡Ú‘‰gße½p,ãpcS‹4±BÏlömÁªÜõ$xÊ=çée‘ÎãçHªgÙžJ¢ùÊ‚ê&ÙGèùùQQ!®äb:ýÉ‚âÂt1îk*Yµ$pŠ”ÞO†í€ÁÍƒÙâÊh#‹–,u›Vc„1‰2èôëîu\\’/6œâÚ0—Bn;t\"S3³Á8cüTÂu3ÎòÕ}û1¹8kž†Å?O¿²»ý{÷Õ£Û©jæiD”%ó{8Ê»ÃÇÏd»\\ýòe\0q(˜K=íJk—¹V´Ê»15­,EfyÓV2î˜ê~Ë¨2Fó”1ž,,¬v»nÝ‰ËtN,Ã¼çÀÇÝáSg Ÿ÷˜Ìîz`ýÍÖ®!wŒæRìª˜¸Š]Ð‘xmüM7î¹ø½vscÔ6jýîÙîO<çì;‚¬ä0¼„ œëÊ*jà¥Ž€áúÜ’5ný›!ELt¸¦þ.2k ºëHðsdàç›q;?ß†‹Ð ´°_ ¢‘Ñn÷ã0¯»y³«¨/q¿þ»Ÿ\'¦‘•zŒå¯|í¬ûá“Ïº†3-@d´Ë8¤D]ã>²MH B¿î¯÷[ó‹å\\3M\"ç¡<W?S“Âá¾¾¡ìœgÿ\0s³S+F;g–°™sæ±koaÞoÏæ< Êzcøä„‘\"Í,NáôBÊLïL©¯ËÇdñ£œ¨#HÉŽ“^ÆoŸ;Ùô<äåWžu÷Ü{»i~+ÈäJn[K§n-3-¢î‰^s{q™b[øÁh\"˜Ì -«¬c¹ipÁ”ªÑbÜUò£ó-)¯±“;ŽüNåÐ%N°8j5,Ô;î¹r²Ç k`›ÒÔÞë´Ù²žtë]€Õ°[zÌN|ÍZ‚¥È#pV»†2X_¨7Á™xß(ÆÈ*D¡¸iÒ¶µè:÷ßÿøOÑÈïñóý`¿þùÏ»þâzÈÍîËßú6rµÔ	\"ƒuC/!ø)É¦Ê:‰\0–lŸê{‰àe©FÂ‚Ë›Ôã•,^ÀLüžà$&,¬<iš‚)Òòm\0JzÍ0±š:Ñ¯UpSÆ¨ìÓ‚°²B%!–Í¬|7•ÌS]Ï,6JŸ»)2r?\n‡¥” %dL]Ð7ÒøYl]áT ‚\0¶8AYŒ‘yärõ×4üé$ÆÝh¥é\\æp½²F‹î¤YšqÜÁA6”¡.· Ü°0ûí¬¥~ Êº•î£¿ø!3\\ýâ—¿,C¹†=ÕYJæÛ¶1in\'M:U\"Á}ï½Á³?øwÿ	.`%ÕÈ%÷o=†\\â®¿‘À3?…–1–øSæ`LÐÑÛÏÚáýbU¦C´“Æ×ð„\\T\nâuN6Ýî…ç_v­8W;yÆ|ÇéäF2	ôr|&pý…`}òÀ#¬É‚ëÜ—ÿñ›˜ñnäýõt¹Ð^J«\n(Ë×9z!®+Úë&PËÕ<@“)ÃCöBS´˜²p¼ÎÌMƒï™â°Ü:|úœ{õX£»~Ë—Òì÷²~õëGàE>E–‰¦ãÓíškIC_ÏÕÈËþ¼v=\0kpš¬3“FcÊ|&.Ù}®¥cŒ¡X#DC½+‹B%µÑès—ÓÒîÒÛ|WïZ¸°pÀ<P,”¥ø‚‘á±Ò¬blÊHºrsdGóœ~RÄQ*ôX¾÷ýÇ±ñ®‡ ÊìŽœ<%9®ôþ]”»\\EÍ*\\t/@Ê<JIqÉýã[ÜÑCÝ7ßJf¸ÓŒîiS÷\nw¨á6=ÃÜ•|lœ+²ÉÂVÁ«[ŽÀ»áìaØúg—»‚ëo€t¼Ê;r’›ÀÍ­Q\0fÄà%TúDQgŒ™Ù¶æ|#Ž#}CLÆª ;@yÐ¶ñ˜ÎaÞ›*R+xÄòšÅt!÷=KÖ¦gýJ×à!Ç…úïÿê%kÈg0Æ‚úÅOÿŠûÈ/Ýáöšp_þæ×hx  ËŽišÎŠ&“‰Œç)Ž”\0ò?ôàö+‘ÍNi›d¦dN¸Ü•€—ø1/Fz]¡~Vë‡d¼©lÑ‚€„g‰Ü<ÐÖËÔ­Ÿ\'HÚô DP´!Ã\"Pëç´WÙälös]a?“Þæé‘½¶¾ú¦šG1ê¬%ÈÇÝ½Ûvº%´>\'†ÇÝÉãØá˜FýªœÉAS_[¥¥üt\n=y×sÊ@}%›¥8Zoßv˜ìÚñÓ”¬l~\'Ñ”.\"e#”VÚ˜K=Ò8C4ZN5\\t!Õo¥Þ¼¾·oßeós\\¾f¹û$jœç¾ÿ\n†¥pÛpQ~ÊÈù7BUò7Óu‘™•¸:4)TºÂïÉPÅ­¨®\'˜kg)PªÇNñºf‘®ò) c>…kÑnkàñÒÍ}»Œ93ÛP¸Ïœ°ÛšÇ€WºÐ}ÓE3‰¹‹mm‘d¡IwUã<k£\"üÁ>HCDÄýº&x¹Pƒ½r-#ˆ²QÍr¿ ®TƒúÙà^Œ&ö`ª0AB‚V«{2úQ\"²¼\0½òW+Êk~™šÉªö26úã|ŸC>˜’Ç,’0È1†@Uð:À5}þÂ‚tÆ·\"½ýß\0é×f.ÄGW *˜¦Ú?´€í½¬§¸âŠhŒ9 Àa2|28Emà6Íß:Ãée¶ÇJ¦Þ¿G‹~ŽsïÿÀüðèpûv?‡ùî¿Ï=çÎÂe[³á„{Ï#Ÿde\0BO˜äÈú÷\n”f)”Ù…,‚5Ëêlç»¾6)<\0ñÏ*É ç]%Ý®ý–5È.^·5Âž1Ž¤î–:~îŒ3Ç‘—-@	)+«1Ñý±“°ì÷Kh ¤ÆN€s‰³åŒEâ#ÐÏ³SádØäÔ×c^°cC±{úGÜßüåŸº›·sb¶»·Þì>û;¸ómóî¿ýùŸQR(ÈZ§À2Í½š “F¹¢a5S4æ	*ó²á„¶AK:ù¬¦‡7ØQsu)»µ­f£Þv)=´~ùÌ÷y…ºü[O®]Ô3ìP^5E<â¶=Lª¦ZXP™€Ê ¯J’÷ÔHg,öù[ŸxÄæg¡ZOâÞAùàÒúàuŒC€wxìõ½ðÜº*ÈÄ|¤`éÔ}®Ù¡jYà‰·aåûóÇNµ`©vØ:®<eÕtÉ«‹·Ò[ Ão¡Ó`%Öî].Ò®4¨SBáµôÒÈÔ²€J¤§]&,±ÃÕÉw)%O:é¸ßÅß¼Ý=ÿÔ~·fõóS˜]Ñ¯ZÿÛpéÂh·wÉ~²F©+¤£Hë$´É0uØYNŒ“_dîÊûµ+qp¡áÖØÔ…SnB”¬:¯Å)Ýq]©;°ê“f!4‹°¤š@ù¡Ê©²ºÒu“®õÁ£œ h*Ïmu%ŒÂS¦–Ú-ŸMœa4¤Iãdõ²ï1¸‰aÚµ«6Ü´cs]K]/þõ·ð	<@F¥Y³„%\0Ä±>!  jïÞÛÿÚY™ø‡ 2@™5þò²áPpå™%{¹Bñ$gGó|3£ÜÜðÓü69î»ûx×2@&p—_¾pb+´ˆ¢ ?G´¸]HË©IS1øo²FOÅ„ F×VTQB$¬N#`i:×q„ã§Oý´KqÚ½1‡Üöi6ÇuùòBì—>Jêÿ\0¤ãCîy:…Ï‚£<·ç˜+¨\\åFçÓÌÁ8‡Á4#Âµ§‰8Û§l·qÙMY¥¦’•°µPûûQ;°å>#E‰Ê7ÝËÜ¨jë6‹5 “NYBeâÝtá²u½t0ŠpœNW.ªÁÜQà rµÖÌZiag(•B¬jÅã‹çÜ¿ü—ÿÒýÊ/mpÿå÷à¾ùµ¯2ñ:º„çèpopô\'Ÿ·‰¹ÿô§b™[&®È`\'nZîÀ¢ê(Æá]‡—–q˜b\n\'³Ÿ è6¯g«‡×Á%{%‡8l4#™G:tFs( HkÐÔØ„,àÁFå6\" Ýb![„g6”=§&…ic5…Ýz’>?eyú½0>7 ±\"Ëb”â\0x7¥ÝÇð¹»s%á~>ˆ~šYÛÚÒíjÑJ?xw•ú\"pqÁUe¨3O·ÒÐÈþôÎt«\nKÿã¥ÛËÒ»Rse–ôÎÇkÖëR	<¦ÑÓUªI\n‰äYðÓ¼óˆÂÆÛ5ò¬Ìl0,}H#­äUÒ²wêÄaÓÏÏÜÌð ßwŸúØ_›Áimµïã˜Mâ¿ü·Ï™:Àõ7¦€¿<‡¡¹öAÖ‚¤€p¡­ù ×\'}¹sUü›ò\\Úfâ¯*øéÀUBÿñßM5ê¾ò“Ý®µù2ÅY®±í{i†Aëb„\nÝŠµ\n½”_š‚\n$¿Å qtÍã.¯’æ&Ñƒ…€âäÆÛvº_üÈÝŽ†»ô¼Œ¿ü«¿q{_?Á¾LGNXh	„á‘º¾:úÌ\n‹÷î³SÓ«l-&&*€‹f4ÎÞ±;·°žÏ÷Ê¾óî×>u¾¼7sf¬¯6}f´œ*±%%å†Ä•ö®÷b?Þ•\0¸°p”ƒè`uFš¯(>š6:†p½o´Üz¾Äõòv3 ^YÙŸÒj]È\0)´,¡dÁ„s&ÃÆ¦v|ÕÐAj’ÛáS+q@)Ãø Æa–ÂÔ²lL/ïp¶ßBªÝå^xå ;ÑÀ8ÊË-nŠ@qât‡Ù€ÒüîØ²ÎÕÀ¯Æ·ŽN(bÞ“°}JÁý ÈÈ59Ö’lôÛpýy‡Å„ÊæQô¨Å4/òU!g œkÁ×NÊ‡T¸P)PtÂ«$õqêŠç•\nÖ™ŽRgG“Û¾s›ÛuÓ\\bbîü™Ó,š°ùë——¹OýÆgP|@?ØÍØCNÕi6y¯!ÈßKÃ’Kœ…¶D7WÊA™)Í²W X´°d¥*å5¦­êZšSÍè7ˆ% SžÓ”fMdá…”0Êe.Ÿõ}eVéÕŒ\\-ëó%W \nzºÎ3÷xŸiføêÙŒø¹¤g•ylP~$_Ç)8³û™js#}ÂöJL¸bãO#¬†›¤¿ H’ÅIJç&ÆÂmG)2?Î$º\'?Âº½CÍÎ0e_‹üôÊb@2cÕ\\’o0:¯SÆ±rJ2ò¦é6ëž¦W–c?ÕŽñlÐ†¬Ã™ç!/â°ÆAèøÑ×\\UÞ­î>ö!æŽÌCSÚÇD¾\\°é‹îë_Áýò¯ÜA£GÊË4amü¾¶ˆäC8÷ôtç2Â`•½¶Þž.Sæ!·ëßœÁèoËÝ~²äØÑÞ‘eËÖ…r)›mÄZP¦+ò,¯IMµÍ<ÓrþÙc‚Žz6˜f|t7é7œO%ï#9Ü1Ru-Ý¼Û-#ø)ë;wýŒRØ÷:§Qœ»!:•GœÒCS\0½{mæbìêÜK|ÏAÕ|ÒA\"ÓT)TíÅæQ¾@yâÎÃÒ‹¨!,ŸîiY:žg×÷ý]{¼+p¦«)cÁµ¯ò/h€¡wÐöÀ©GO º=8õè^¥%»q<Æ¨‹FÈ+™\\3£,/µuºý‡_%#dðõ¦Unó¦ÕXa-ÃÔ‡aJØù˜:BšîýŸßw\'šX43üdjƒàCAÑ8{Ôp¢“8a[ÔÉ©†^²~%ªü(›Àt©>Æ†g ^„ `Wº*Jc˜@34‚ô ÖErð¨ÂGnŠns\'“âúÚ†	‚§ÉNs¬|\\ \0.(‹¤´”U•Xò2ÁqOµ¨yä=˜PúÜ_ü×o2~ò¥P®kcSüÒç>ƒÚ Ú}÷é×Ý·ÿ.çB·bÅ\nhÕtqÆWÎŒTíú	”öp@›3’L]„Ù%°8¯$fÑRö¤\0ˆk®«üò#øæÂoS¶…|¥‡&Df.ÍÊ÷8%“ø™ó˜ƒb\"=+“õP®åÛ‰×¡À— O!æ>È`xßhPÃ8N„¢.W“ðà?6¶ ëNáð(Ç|³˜Mí¢h¦Û>Kp¯ÞcÃw‚Ö•pÍ!øÖ‘	åê˜ù,ßq9ÊveH•ùv¶Â“ÃŒ”UN2ŽãP¯ÊÎ0{zÁÚjÁë*±Ä\'ËÅð¼K—f¸¿#Õt·	—èiOòcÔPû¯g”;8Ë™©¡ì÷ù¹÷>¸½íwæÜAºûÈ¾À¿ùÕoãR¾g!öXÌXAÑÑÚ8êV/Ç¦~IX$–üÃývÕ.µ0~´‡ùÔå(dª¼€ˆ_ŠT^n:¯i–²vŽjE|Ns¤§ÎdWÐ1F*ª¹$!´ÄHTÐAw»KMš}“Š­V\'®6kQ{d1˜`=ßˆéÏHÃ¦×­[Rn\\S=ŽsßüûŒ¥¸ÀÚšb\0–HÌ¢†éCõm‚¯µeŒgáÂž“¹hPó*@êðe½Ï›\"„Œš’W/®?ÐÁ1Æ•\"ÁÌ£_îo+_Ø6{ž—ð_\0lm¾˜–šrqåÜìXÁ<ò)À±Qˆº¾R.\'T÷ð\"/\0zgG·5«äf>6_ªfUPî…`ÈGZ s\"·šq/í;æŽÐA«ª.µÎï@ïº%‡[:vð£†“eSzÈ²h=oj\0<ãÄëÜøÅ4hÍLÛŠ1Ð&ÇsO>É\"h$ÛŠcwtÚuµv¸­°—c.°–¹GŽ¾î¾þ¥¯XÃa¾ÖõÛ¯£³UãfI-ŽvŸbžÃn„Œ Çp2-+}À«æ¡÷(Ó•…P/>|ýðû!w¯@½pñý³^†ÖRú~îwîrÿøÝ³Ø÷ïE\'ŒPRæ}Ì9	’½MB&Öðr{hái}Z2Æ’Lðú¤°áêº¢ÞÁì}æ!!É¯l›ý5ˆƒKè!ÜèÈñcîNÉ’ÔÓš\"xÅ$k£œÇY˜O÷EÏ”Ì’Ï¯#Å¥%¿7‡ôl^ÚfaÔ©lþIw|Ï¬»€O`é’[Ìixd¤‹yË”–}dÎ\0÷ýpêV3æ²âñŽA#”Œ`zÕ™¸W—¼ªò¿sœå`œ£”§Ä•Šbž7xÉ4tç.1hÚÊ‡štµO<>m#.×¯[ñ7Lã‚ûê—1à\"¶2<iùòåøöc#_b–V/3/#HPmg°ÖÒúZ·~³I‡ÿì¿þfËlpù®[¶AÃ9ãæÐ½vCÏzô‹_qÿù¿}ÖUƒ	¿„râk_þ²ûÐ‡ÞOæ–O£,N\\#s;þÉ,§ÆÇ¦™E²Égq\0Æ dû-Ü®˜;üÚ^w	ÏÁ[™Ý›ÎÁôv¿9±Èè461+Ù»LXE)ê!@Ø·—Æ2JBâ`Á¹œ°u”ñÍY=®+0Ê×ÆÊCèÛ‡H;4Wööº\nL\\Ÿ{êÕ_µ¬j0hQ@@¬7Ó\"ÓèyUiìBo´µCoM™O¤ðÎþ+L€TŽAp.øæÆñt70‚$©ÞÒm@DSCñ°+Í­Æ2	¦Yâ™Þ•OïJ©?wbr¼2Õ?—Ÿ‚­EQRä°©˜7zÅèÒ¤4”+F¨ÕÅ–©#Ùå“@^uª¤-“$ü.\0øW]ÁMâtÆ-·	~U]ØÁ>q¹,©û ~ì™PsÐÉU š ë€	~”Cç‘@z µ•ýýVÈ¶«—ÕšmÒ ô˜¥Ø	I+:A™4H§7me½Û¸»¥®K”0­6à¼žS~ËÚ®º”Œ*ZïæÆbn¨ãeåè÷¬æÿ²x‚\0ƒø4vš$JFT[Såùà{qt™q_þÂ?ØÜŒhi8rü\n–ìÂb¾I|¬ª%°¢Ò‚À÷ÝîÝPùšÛÄ5²1fZè5)”Z\04u0:up=ïA3aP™Â{§;oÃ2Á-ÛÖºêë6»b]üéúéH·ã8ÓA{&ø‚Ÿìè¼xmú“°vïhy-ž0žÏ¥JxðÓ•eUº\nÄðAl¥º!à†~A‚i™ÌZìó——g»I ¡nîI/™ %á6¦¤mÚ°	svÑoïyå0÷†±¨díY4F†™)B‡Ñ&©`,\'n9½¬ÀÕººª›«Fîÿ¬Éî}	ÝÓÒA‚®¬¨n»i¥»nóZñwtv³FR)Zí®Û²É•fciµ~‹X‰:5*òr-óSÖaüªŒsÇõ0Ž¿ân¹åv÷K¿ôsî?þÇ?fúà‚Ë#~áé1}ŠÒ3šY¯ÚÇAÚm¥Âm[¿œ’Þ)3ŒƒPJj¸·ëW-‡îppô&±rË„ŸA†®4:6€ä³ÏÍQ½LÐäH¥YWŠZ¥pÒxîršQÓp,§±qÚ-eM¦R©Ü¸i›[%^åR2/%Y˜€êÂ¡6q>Xƒ,®Œ¯¸Ç~ð´Ì$¥êüª›Q±NÍñÙ #ux52P•õ:$]Mœª&ô{æÅhm˜é/ë$Nòãƒ›3O)¬yöMÍ½n~3¬ýùÌLfÇ½+Qïª?²èpaîbp¶ùå’Þ…P†÷Ò¾©yùÃÌþÅñeNˆ+ŠNRé~u!ü4Z29\"Q>tÞˆCm.l¿Á:æ°ö™‘!_oÅjÈ8eL¬Êd#ˆ×)ÇÁ3.ít4™ïå#F¤YÄ ˆuõ58*ouËÂÛ]L|3p©’räHÌ¡¨î¼íÊ¼æhý‹¥ï¹àú±ˆÇÛª@vä>s8@Ú]¿¤Òò ¥ÕlÆ¹îÈþS`KXé½hÆ0e¾ÍVõð—Y°TÊùŸûÐ‡(Íýî«_xÜ9|ÐU£Ó,¢°3×›n/t¿ö¯¥Ôoq%¨@ðóh|VûÞ70=8‹>>•%\\º~ÂN“T);pJ¬ÃÓI®à§Îp’×ÇIÎ7ƒ©m(^=]l3åànfz°¡ŠÑ*÷¢cM#À„ý¸¹pÿD¼žF¢U6HF4nY€‰êT\"ñ75\"\\àÅ–3ÜŽßVfCÔÓWÎßÑ¹„FàÒB¹YÅ¬aÏ­«ê]—ið:?:0¬%ÎÒ±£{»§¿õø›¼E®¥ä#Øy]5›QõPªçPæ¦ÌßHà\\mærxÖ0¡Êšr·”nq2ÈqÊHdcüî@\'Ë€6ñC”ªA¤å¬ÖôXY›Ùú.7«™&<¿´žÎ3¿œå>óéŸsßøöÖðX¶¬€!ã›m|e³{\\þ(UÂïü«ßr?÷ínóš8df¸¡À³[gÆ¨mÈ#Ò?Ãå¬ª$hqÖ0–49ZYy!Î4=àÈÞf<Ã\0ã=K=øÔDüƒ?ú&g %-\0+Ë&ÇK¼Ì-«V`í¶„5ïÁêkê2]cW…[ž:¦Ì\\.K¬ïºØŒ=?M\n?^19Õ@(aì¿$FÈäÔlj ~T/ÊÌGˆQ`Ê c	$«*=I¤šCZ{s0ä}déaHÝàŠã4ØZ[{ÙC™Ü«Qquw?TûÊ+¿sx×®?y×<=\0RC¦OMŒÕÌÅ¢Ù‚Ì4YD×Ès	PQÌ2sÔ»xÊR’\'H2\0’bSÆ¨\n\'ŠG€;)‘»JHz«´ôUº±‰ 3¤S>HO0\nåE³¦ÀhÄŽÀÛŠs§FÈâTXgâ‚‘¸ªÂr*‡x~­ÊÑcŽMïç†­^—Ü£÷í¯DÕxås=Ã’˜:û¦k\n­PbtU9¨¥08üñä~¢ 3O@˜ƒ\\-»¨lF¥¹»ð8Ü#ñPw2Q¤ÈÑdÝÆîÎ{ïq/ï`¸öi—~ÈöüëûïálÅ Ù¢üµ×«•èÀA]M>TæÚµµñŒZÈo|Nåõä‘-\0)Q5èf”#WŽÓ(Y:éB]{‚E6 Bd„=ãÌGŒ ó Ù(Vw[ý­?æ‰àÌ0×£†Bn¤Ì-­oM?5>–cRË@¨ÙüaË&DMáRÖ”z<YVñùb;“Ö.1#l°È—åâH	ç #ÍMÆcÌc¦ŽW³\"Syp`Ì)ã×ˆÏnæÇ””c¶@?Ff¥¹ÈõK\nM)ã~¨‹^LÉŸµÚ“F&*zu¡«•²àÞ	fPsÂ^ÿ£¡\07½í¶íà¸žö½°F94÷î9d˜=/ïÁ†~Û´þ!à¦ú9´éRÈŒ+X[ÐXü¬•’j”«_ËuÉÌXÂßNáuÑ˜2„UÞ«`KU5jú1EÅÌUæ,ç¢Ú´ió†oq›W(ÛæÚFÞ—ë¾zú\0˜d¥\'“k‚Ð?\"³aªÍüç#8A>ŒsPbÖqÜÕSÏ×BIE‡ò’	[×¬=Íº™WK”¾VØÒÐ( \'1£oyl¸ ”#=Tkþ8²šÃã÷GÉesñ-ÿ{`OÃô¾öc×Åã}9>œž\'&ÓÉdHþ1=(†Ý?.³O{ˆs–ü?O–¥?¥î,Ú³²â‚rœé¤WÖ!—‘Åk£#1.O?N\'aZ~¨þ:^Ó—5µmüIC•4À§\"µJàR?îeC»Lhe›Å†5¥:¾Yè*\'&E€I%Óó`J»±¼¶9~9ÊÒp}÷Ütæ¢’D¥¤TcÅ†OŠ\'ôÚÈ¸H÷É¬² _W±±œ{é™]óå&s)£ûX»f™Û|s®»ïC€Ê¿>þâuIZYe4ÃÒòò3Üeœ©Èý4ŠŒ{¥é`ú?á5ôÔQÔBTðõþm ‚£x~\\ÅÎ6Áƒ!•d\"¸ÿ‹*fŒ1š2¦×PDI—¢Aå9ý–™ìº Örý¦àxÅ¥ÖFQÀûÒT	1¤Ž@·±¦È­Ã\\QõM\0>ŒÛˆ†ôdñœÐµ¯ä¦8IWYž—„‹\0ƒ’ƒLçìÉFfctš¾º@#*gê°¦Ài5ûX¦¶\"^÷ƒ5’…5Cr^¶r©¤tT­ßÑÖîŽ9‚D‘¯/]Å<Þ*ÊLIµß°œÓ˜‡8ŸÔ$bôÒÇ‚¯kÚEbWUG9÷BÓšõfIß‡uüRø¤÷c¦»oï^žûÏ`0ùënÓºõîÎ»k<ïH~?ÊÈÕ,hSs\"LüåÐ€ <6N€˜g]©÷ÚOƒ&ŸÌ?&ŸE’qIGÈ\0…mæÍ»æ¶~Öø*¯·\0<³ŽÈXUÁbå}¼þZ¿û>NÛüÎnÆ\"p)_}’QÖRSkðî2lrË™/Ñ_/&Æ„²I5/¦	ÓõÖ¿áó:ÔYo&Ž´X?£`G¶ª}lëï‰$­±¼vS‘µË”7ÊÚ‡Ñ“âòq	ù#õ5…ÅªÖ+\0&‚Â¢º\n½^œ¿U²*T‘Ý¿´  3Ó—ZÌ¬Þn&L-+ÀªgWdð$äªã<f†WÒèC”Òn°C²<šº *uÓÄó--%ƒÎ\"=ÿTuŠØ©››0§Ù4÷0ß›dŠU·œ7cjÈÕ—æº-ŒÖrW‡0†«‚ŸxÃ™”#ÊHuaBl2‰+Øš6§¯‰Ó§Çæ,lÚfÏ¢á&ó¨`³Ka\0Ñß½ÿç>è2ëÉ ›¾Qp*è@ô”gÊ¯2ÅY÷‡ÿîa÷µ¿Ýïv?±Ïm\\³Å9rØÝó‡Ýûùz÷©ÏÁÐýÈ¡fu†ƒù®îdˆÓZÝY6Ü¹ô)Ü³ÁåæF0oèDŸL\'›ìXåÐ©†<æf°Ì–cÍ|*¶X’óqLÇFÉøf8HÆc3¸\'ƒMîlëi—WLW}sÑ¬]K™²Ž¸…	¦¡alšëpk²&ÜmÕ÷ðÚ·.“†ÍÔeç¾èÂÓŒÈ$¸/p(ÔòG»šÜê‚ {Y•šŒ0Ñ\\%@&÷z~’“Jûiƒ$\\¬é‰æ|ÄÀèp2Žß¸ñkÇšÜ©½d~hH±óŸ U$»¤µÄûP‡÷èAs–\"2ÐèO1&3ªø)š#Å¹¥ø\"sÄ±¥åxâ‹OÉYÐ€è$É‡&ù)è)øÅHg0ËÕ´à@#\'D$SF¿´n™„*‰Kp-gòÆ•îÓ”ÆýXò#wd„æ?}éq&zEÎÈÈ”¿^NÂk§Eâäç0¤ŠE¦çÊ&ÍŸå°Óü’œÌa©ó¥”â\'ÉŸF†þûû~÷Çø!÷«ßÉ¼š)·²ºÿ¾‡ÃËª}ãî|á1÷ø+\'Ý£Oìw—Juê\\;\\ÕnWœVìJ#¹ût{”µf|PöË÷bZÆ·öžôÙ¬Û4 ‘0‡w\0Î¤¬¯tÝ¥#‘J¥±¼Y~lžý·F¦ÒñOgYËÜWn`ö¢›Vb(\\ÃÜ`0í¢Û`bÌ¤uœ\\™.\\Xx\"Yp-NPºêYµ^ÙÇŽÛ½ÒçFK|Áôé)Nì	†û\0UÌê„!07£½Xê`§‹G1ðŠ‡‚ Ç@’ó¬ÁìÖ(Ñi“ø9û•ajÕž×r²s*1|œüL]WR\n•á•´öKó	ü‡.qv†®´–·ô¹¸(HW¶dyœ„\n{S=Èb	c§9¸¢çÈÉ%b´7œ\'µL$cËl8mœâ#t…‹0œ`–k®ÁÓXª {ÿ{ïÃèiÕ‹{)sŠ!xŸq+¯¿±ý-nÏ‘t°RÙš9e\nÜ¶t\n‹æ°9*wõŒ7üPÞ‡Ñ=ßáú.ô»É~,Žâs	¹ËDŠ¢!\"³‚Ÿ,ûÕ÷›Ÿ¡Hålh28å{#-îzDþwÜöQW‚;Jæ°°§THéý#¸Ô°TÊª™2G×=ŽM“J£Ê\\Ø+™PÝø®1$[d\"T…lZênX’ïîZ_îÖ0BRfTc8ÙÀ‹™+¯CúaÞb:÷,Yÿ˜`&ÄÙLQÕ ÑXà3Z0‚hÃ¯O;ðÜ)ÞËŒ2L²s›â>qÃEÁ°ÍæD=‡QFÍ‹!:ç©ì [§!Ciãàò	7ãyŽ?¨™1å8©L¦‰¢%Æëš¦áWN!?a­ øB×Âë²‹ÀÏìf*,(%Z«òtRÏ{ã-7ÑÁe:`ç¬ç½Þïî~\0Ó\nywaQZˆBhž`0Ç:›%s²¾LW«Î)k.\"6}Â/ÄÛ²•–²ø\nÐ°§°Ž –_°\nk¸ÕnÓÚ•drü›ƒCØÜ¼®Nð‘›h€eâŽc4´¦„BÒïž°Ž®”!\"Ø/ÈŽš÷¤²Vx{½iä\'mG^›o8–W˜[–çmDÛ/Êüôsº‚Ú…¨¼­1È„	wŽû®Iyh˜aLpC¡È¼o¤’¹õ8_ÔÖ\\ôèÇXÔ\0hÎ½ÕPÈŸ~`G#ÐÄf÷qÍYÄÒg»”?òH*ÞñBH¯j]ÍÄ=ðx Þýà{25Sý)Þn%ó’å+Œ”*ö¡ØœÿÞÏó¡YÉß·Š‘É:Ä®CÇL¬¯éOYÖ£ ˆ œdXŽ¾Oug±kú²un\0G˜Â¢\\fÝö»›o¹JÃ\nÜ±cG)}—¸Ëí§Üç>ð¯Üª5%îþüŸLÛéÛ¥#è¤áÜ<DVsCÔÂ=”«áyWÂß5›*]aIsüÕCd²ž}\nFúSÑ$Ô|“Nàže¥Ï .“ý‹ßþÈ½*PÑÔ“Y0ž±õJ‡#l~F b‘T[§Œ,€¡ñ¼L šÛœMZŒY^\nÙm˜i}Ã`t#ŒP§z%¥àu˜Wä$®ë×ÐG=+GŠ>;Ü&¸~\n`éà¦Àl ’]4ß7ßF®\'2hwèÈQ¸‘ç-Ã\0ÔOBã0ø%Ê¡’P%½¾æ—\nG®Ð5ÙÚMæœ[¿q9”!Ì0M( l”ý½eÉÜ°¼iI*’*DÓ÷òpVµ£˜*B:Ùta<fÕh |I‡±çr\"ˆ ]z”KdOq‚ªâå2h2BW:~ô/0kE}Â€ôg_xÞ-Yõ!1À%ÜOœ^t „DïÒ`éÄõRóJëHz\\aƒz¨’L´þTªë°Ïä@¡wJ¥š¿wÑíµ”FÑMµ“xvqXÓÑ¥>æj“‘]ÓxI—€1­©ýCüª‰DÊ .ºšr)ŠJì%ïüx “¥¥gÃÿ$ýÓt]•ì$¾Ô‰IÅðh†·±”žŽ–œÞØîÛ¢iØGã#üãýµŸì§7\0¦Ì£c#U”\'áCÃ\0çƒHxb³hVÉ¸f¸h{É>Ç»(ÞGò¿çÊ;¾CÃäÞ’0ëßžÍ“6©ÕÈ“L¥´Ÿ²E®žûrÛ´ëº|†_ZìªÈÐV,[iæšúõ‘‰8Ö[Øˆp´V¯ÃóM)?›’ö<vF}Ló‘h>l¹æ½f>hÙ¨ª+`úºáIJÂlìÑçèt¿m×ÍšHé¾÷Ø·M<Ã×ëV¬w·Þ~‹k¸0\nÇð¤›%øÁÞR‘9±¿íTóÑ9ÀFzå\0À9C³1×\\QZïV0ó¡|IÛzC”1gxÝ“.×tÊ,ùÎRß‹$E+ËÐG9YÏÃ?ä[ÏºWáši´·ïq\0\0\0IDAT¨h%aÀ÷<5}¯ŽX„.m&A²¸ â,ApN’Z ¥V~¤¥#M³PUŒóþ•µìÙ×à–0§wu–M\\#3Æ$ŸÁl ¯oÔ&J‰\n´f-úi:¡º/§à_¶2ï9=HW>«£€ƒ‡ÀþÊŒFÅ2_ø<C	x6cÄH¸R±ÉñgÁ\'ˆžGÇ0wƒÍOŠPàÖC3YäL&˜ÅÐÂö±Ç¸iz.ÍV®¥+¬@§G”(Ôc~{’<.Å6+L… zÖ Ž(\'Ne„äL†]±­ÎÈb|ê­L{ê©Cî…g÷ zgTèIJ¾Õ®~å¸žQÌAÛ1<m3·—t2ÍZîaY¸®Á¼@­ã×1…(¯¤s»lé•f\\+_©ix:xk™t¸vUxÚ°û>^”3Ñ—­íîáš\"!ï‹7Lƒ»I…4Œ‘¯ÜÌóË«¸Æ¢2‘ý	£ST5ˆøªý˜Lîø–í³klJx^ÉåaÀWýŒGºOÐ²ôËpz? @«‰tcåKq¼	æEü9‘Â`	“ãÿ¯€± ›?›÷Ÿ6‹Ê]€²àü<ÖPh€ãœÞ^óÐ‹`–8+xéºn6.ÒûºÐ®ýë®W}?ñom|I§=\'Û¨#ÌñRÜëXj½Ž…V6h÷±¤¬ÄÜ.V./¦dÇÒ¨îìf2‰½~&VíPâÌsîàki¼ŒR‚OR6HQN\0Ôkõp$W$P¼ro†Æ²béJ6à E¿í¶UîÕç0p8ïÊ t2Èü—?÷iGCÐýÉ¿Žwià‡Q•`]³AJµTpOÆ_›t,S€á¾Sð*ÝÎM›]-<²l‚ñø$AWC—ØTìõPÙ4‹ÜKAX²©µ«Wš¥‹a9½}ðÂÀ¸ÊÌF¶ë§$’?¡´°\nt³¤c™s¦iõ‘j‘›Ä—t^VF*%S6XÚÿîW\\ßÅl×uæU·‚seÞN†LüpyŽÙÌg.1¨!ýèÙ×;²ÝÝ°s=K£{ZäÛÕ+63¿å\"~øyzêæK\'œÆ–RŸ\0kÉO0}– ¨¦S*§FˆCàô©ó6Ì;“Žlà$CÝòYT?\nvúÚ(´I(M½`c¥u8– 3¦A\"˜¤•‰u»wïÇe¦Ñ­ARî§¿A²ë¾„â£	n_\0\\3ƒ2XØ^0RW”Ix9»«‡Ü¡Ã§É6!G£º8xT€\'fÝø§>³J“ëÏ:²±ûï½Ó:Ág.4âVÞgp;VôUµKÍU¬‘Ñ\n»÷îßx™ƒœŽ2¼‹™Ú9ù5dÏy–Tm.:y–{I1<.ä•+ÂZžàoã?Øb&Æ1®EœÓ*JÆ§}–TY÷ªÌ-¹»Þi/&&¹uÜXGØz\"oCkš°¾5Ÿº›û³Œ_HcŒc0Šä$;ao¿çZßYÜpa:03MÛ—ÜEƒ\\§	²Î‰X³BÜ: lSD\\}ê\\Éßò.¯\\øÄI“@!ÞôS	\'ö+ULtQO„…:uÚ;\']\'7ýo9™¼\0eB)!z‹ÝN%lhÿþýöºf¸9²²À	˜.¥!ðµ\nNÐr(*§NrÇ°I¯[µÞ†Æ<óÂ‹Ð-(—8Uóè6£±Š?NaèùÞ‡`óSqÿðÉ§¬„Î’ÆÆ¹ýî]b2j÷á,¸€sð°„-¥\0¾h.íØ6ùd*ÇÄ“LÁR|‚Ò%HY~½ªû7!½J#‹MÀí„òq”¿çcö†ú[1”¦Í´¡N©ðÖê×£´´Ð¨s3ã`Q£æ¥.lTø”²#þÉ¤ù#Ì.@—]x›	ãÉ.‚ÃÑ§ñµ	:œ§{Üx{šËKœfs…!Ê©/Ë°ó`zó”­+À¬Dâ>yò$zí&Œ*JÝÑÓÙÐãî†›èÖnpñgÿàúØ itJ§ÙðLT¤,gt%ƒ¤Ž8Íû‘Q…pdÏôA¤õ¸û¨Òùv6ùi2´ë¶­!‹Í&²,r†µ\'Ó\n­! ¢ËLûpÖ¡ä1¸\0y7üÉgž\'º\'O»a”7+Ön:à:ñ^Nž»ìÚ teä2G¦²Èyž§íÃs›·W»ÕÖ¸³È\"\'¸®ÇOœÂ&­“k0sÐÛïº5ÂÌÞi‡áÊRÐ±mÄùÚ°WE®ú³—±ªoÃ7PÖUk—-\'Ëtíxô½ðòa2xè?Ø	3Î€™·¤è`šÊ×aC³Gøpœæ†8¬­ÌýÈãÐ÷PT*QYƒ¿3ÁáSÓGG¨Æ¼óvÁ\'‘&Šiï§,ø)ä¿-ƒ´*O°——ÆÀu;q©áúÇGÃ³ÑÂþhvå3û\'|ÏÎ?Yt›üÅ€³“™³s3\0¾ÀpäD15ÉB…™Êé<5c‘k=®\\¬Ä7ßZæêË×úÚ›Ÿ+òƒ\0sÉ»Tºµà&’ ?Ié³yÛ]nû¦2ÜqqÚýÁÜ9Ê/ÍéEÓ+ëö²RDø,ÈˆÊž|„®IÏÀ0†˜EpõBc	Î¦Û·ã$/Y2(×NÝI8sµ5+°KšDÅp”ï¥Ù	øP;\0M¢\0[ðþQ÷Þ~ÈÉÓàÿëiž‹’íAcFQ%—O˜€SY‘Æ	è•ÖÌÐÔža:™4fY\\òžJ@óa96	y8Lª&ý±RYˆ6ÌHØ(XP>äàÉÉQ2Bš8ðLóÆgÈªDYHŸÊ ³nÔ‚‹ð2u–çr·g„‘øhã„d­$ì•\0àƒâ’‹‚![§Í«–º‘öKŒtóÓF&mšâ½­€¤|ßƒ7˜JÄ¸^3ªÎÞW^³Ì­Û´ƒnéŒ;xè¸5Ÿ2Á\'ÈFxÏ7`±„ ØƒZ¤³R¹²:½o‚¯ù:p0èo”B»¶}ËZË»ad1Ù/ã}&Á{²F9³ÐÎqY¤øÙ`·¢ê(vtc¹%œM÷[®à9ù%¶ÁáÚs`µÁ±ÏÅ)z\'VöÕÈéú˜×ü¥è72üs­nýÚ÷º›vÝäÚ¨ÆÀ [Ð¯ïÝwÈ=ðÐ-TÜ®Ûo¶¿3NWüìÙ³î¶†ª™ÂÚ¥4½GŽAú¹a¹8ÐÍ_ƒ:æžÛ7ã4éžÀ¥ùNÎ( šZ{¸ah3¹°\n\\˜s²_~„j`Ð\0bD\nºÈp>\'˜p·ÐHÓ y£GIÃë‰ÞnßyûóÍUÛÕÉGrêZ‰0­Ÿô¸ÞgÃ\0ÕDB\"ÂµÇ™œŒ’”Xê|ØÞ/2\'RÅüE},f!z„Ý8\\´°0›nR†%ÏDéÎÅàÑÎ×M¿/Y_)s“xà5Þö•9qá¯Ð¾õ†YWRG‹*ƒ=ÁäºKÊMv¢V¿gs$2¨›å•î=ï}Ð}þ÷~—“\\]S *Çäçú˜ÒÝÓk_¯,£Ìk‰ôÂl®åá*t«÷Üs—»î†ë°ÈÏ·Ní§HE -Tã×F’æ¿þšëSRWXÓàxÿÃæNòÊÞ¶Ñ4¨ZqB”\'ã€Î¬ÔŽŽSÎO›5>Ê[T½¤qVä}jB×(<B‘¾Ã09ŸèÄµI¸Ÿ8Yñap,Á)tâ¥ÿÍ§,Á¬ˆÀ(,K]Gý®®_N¥¬³âòƒn2ÂõSé¨Ÿ!6(#æëjèv)äêíd=àœ,w5NÔù·šM§M¬ÆñøA\n®%í;È¦úy¿™ÙLRãPyì»?D—ÛcÝ]Ý«Êß u#Æ7Ü¸‰n53¢åZ ÓŒÞ«5DXosÀ+sâu ã’dk4KËÔÏèèÉE7Q• LPM€$%F™ëÃ¿×Ý}Ï}nó–í($\niº\0GhgZ @6ÖM€b%ÿÌåÞ‰0jœÈ>Î5gÃ–õHËÈ¼ø?Í–Æ<Î›¼Õ2#ü	ÀŸi\0ñf]¯ÄåÞûpûÅOx´rèoòF¸ßc`¼jÐ(ÈçÈø£3‰jW·±<8n<ŠÅUó‹Ó€|Â¼oQÃT‡NŽaËZŽp€FŠQT ³$6Z#ŒËçU\nÉÂ`(XïEY…{Ÿ³Ê-é<~Õ¾fÕU§0®\"l£{Æ,›ñéÈØàhöè Ô»ðX´\0H\nœ)`zZFIIA‡5g[áÁ¡¿ä»ÀuÍH^ì«ß«1³sÒÍ÷š$úwró&?{zWa†¼~æ­ßO% ¨„›Á¯Ot•2fvdÂ¯š +£Ë©	[Ëê«m¸‹ÐUeAø[\n‰•-’³úšòÔ×*+«!^{ÃÐ#ª:²ê\"æÂe[½<—l‰`S8Âœ=î€çÜŸüéqŸþÕO™MÖ³Ï>ëŠ++éÐuºnÙI\'7Í}í±gÉŒ„a	…¿‚¨ìÅÚÔZþbøˆ”¨ÇÊIÊ8Yl±‘CàNÃàni\0ýˆ£®ï »2£y6y+Jé¨ ¦¯i±u‡¨	!9­€©iøÛ<×hŽ@¢¿£ŒH4BcBÁÞè¬\n¾ší1.{˜&ƒJ>]Ï	ºœ¹t˜+à`üÊ/|Ø}ì[L· ¿\'ÉZ‚ï¬`WQ^i×Z%±\\wò‹Šm8w;åqnN!*üisÇŽž\"cY ¹To†Ñ±!›»Q‰dlœ©÷13%:§‘Ò½ìs¬0KIç9DüÀ™`ºŒ*xâ‰§ø»5`œU”›ŒÛ,«´ŒVkF÷NB¾ÞsºnymiØ5çá\0TŠê\"ƒCNX«¬s›ù»\nH³`s`oz‰‡žWë²ŸK>ôÕ—›GÜê5>4Ã[iH ðà^íÙýYéy,Ü0´ÕD~7|WVoÂ «K‚níŠ\"ûïPƒ¾®CZË`–5RS]çêpÐ–Ešþ4ëð1áÀQz˜ß5\'â´†b©S•úÈÖ0r²J?å½š!ªñÇ‡­Ò×Tˆ5¡¦š mhYµ†”yû/ùïä[SÃÌn½ÆÉ›>D»I4Ü’Á4©Q÷öuÙ‚zi$pK(ŸZš//#Û×-·%zß‹/\0úç™æÒÑf¦s*Çì¬ðaX’c±äD3IdsWNwx¿ÉÓåšÝá„ñÊ¯‹Cheô`ˆ.fX]DS²…üé4ž‘²²­Å3Ÿ.§P*gMý•g#ll}]8©„ÜZÆÙôR\nØY6©.á¢y=bdCS£p´<Õt“,0 3è8ûm“Í@«¸éV°¿f¼»ºŒƒ“‚TH%õ´èd*fÂ\\áQé¿Å°’Å2Pþ›@¯C@Ù¨—ééñÆ­M6™’ƒËõ>e›eÎôÆóRóï«¬Õä·T¹óšDÇI%cd¹ÐY¢Ê&ØT‡ŽÃÎ21ÙYÙÙJt¦êS£•±£YÃàfã¯yû×æãöpøM‘Éˆ\\’Åõ›ägúz{í-fÓÁ¢¾µ©¦¾	û—›§qSŒ²¦²‚,‹ 76ÑKçaVù’92LWêmLý¼½#o>6™>÷0ï¢‡SÏ\'î8Á[\n³RAa1³OeÇ¼9	Ë+EJÙ£01Óqó^à¶	€ü‘AW^›®6±,FÁ\n•©m˜Òr‚²Wc‚W­F[]\0!m-\\î0“èèI™ª=¸oSÊ¢ïè¡ë¥ì\\ÿV†k9¯g‚ƒ­—t}â£éâ½Þ6æ—ôRh½r½hFP€í/å¶o¬	½ÇäG*?*Wo“ªiÕè/%^ÒUÙœ~ÿ9½Q_½G“{<™I&Ÿ_Ì	ªÂ±Iñ6QQgE²ý9™,·ÌÅ‹MWÞáÿ	Éçª_~§ÿik·w4® Cš¡¬crø4›TšÂ¼Ù¤+¥þÑL÷ê,{¯õ·œÝòÊ=óþCÉn°ˆÐ\0ùÅ°©ÄNI„^é«Š03Í\'C‹ÖïRÌ¢r„4ÛmøG6Bt…; C“Éeh•G@ðŸÓk„À*ÞŸþ¢LRcˆþ3!ñ¦ë0ÔëbSÊ_/Ÿn®ºþÌùáÔ†òòKÆî×fS¶qÏ×»‡#©¢“¨ÒŒZô Q°‚6&A»KÈÞ_ñœ6Ô\0°h¦W¯\0(!:¿bÖ÷‰k‘T.¾—]/ÜÒµšy‚—=«üQ	xåÔ§ôUÙ›J¢×d\'û(©ñ€wð£l°¦õkW»5Kë1ˆ€MC‹ÄÇ‚[Y>ò4²ì Ü½k•I)­lšÃ!)ø™åÚÉƒ{im:Õ%t0£“¿„£¾|`¯“P%ä¾nÝ\n\\cÆÇú\0ü[\\1Ê‹åË¹°È­¦¸—z¯×>E	*iâ<\'‚Iº È7R7œoäåqÑÏ2˜H™›nk’¤R_!¨FCPEôzUžÊq<‹ìZ/Réë2ågÝÙ·®>(F§½Š‚hÓqZ¦ó:…ÏÉ÷vâ:³vÝ*{~e§/A€okM¬¾ÖÇÚ“aF&kÍ‚ªPÄÔVÑ×²	¼Ùp´¢,Ö1(0Þ÷n½ \0}ˆÆLWO &Ü[ƒNbA]9Oô4`AizyFÏÔÅaÉàuå¿ßˆÞ{yË¿“ÏŸüÞÛaˆP¥¸=E›`ý8.JcÃcÞöŽÜÁÆœþ‹ÿX´({îü‰ÀÙs\'jè,¦K%1ø=YÀ<‹ÑÌAuSÅL\\ÄdÛüÇ9e~‹xëÛP\0Å‚<‰`Ùdè<›­axyG8Áp}R\'þmçÏ^°åeP„Ki’[Ì~6µ¨.íÍƒ™@QžËF­â½Ðé<ÛIC¾.-Xí/Å|Uë¡‹®å0ª†<ôµímS±ç%*É;xè5#óNƒmÛ¾‘:´,üû°èWy(³•4ÒÊAÚ[©Rº$?’†ŽöD`Iò¶t-ÕåUñà^%ie0¶ˆ…»\nYâõ(XØŒ«`A¿¯RÉ>ÀÓRÁä§¹->œuÐ–0ŒiÜu2¼}Où-[·áåGð#øä’9qHÂÒÛM¦Lƒ§?DÙZµ·Úµ©ÁySª‹I²è¦ÆIxq½®—k[ˆý×::’eÈ…¹ÁFÂ¾¤Ü˜$Û–ŠaÕÊe–1(k°¯•f<på³F£¤ÜÑ+þ§Œ4T+v´3òÌEÞg˜ãZà…€ü%é«äÓõÑg]¯A2ZÁJ$µ²:;FÑyqøÑ™\'[mn·u»’.zï·¯³•fì€3ð©*¡S­XZƒ¦ŸI&Õ]¸(	¤ƒv´ÜªMl£Yqâøeª²ÿæa®O£+]†K‘G½™°÷v¨Ï=\nêšŒXÅÎp!¨S½óø^já:³žÃp4¥Ö™%s”LÏ<2Ôð>kËåÍÉ†’ú’hLìQý·yú$ÊVO™•‚Wºä^M†§7íáÄÏ½50&ÿ}õ×Õ\\J¶3»†š3«!Ísñ\0Ý¹Ã=	£ÐÅ‚‹ÖÞ¶}sv_ÛPêìÈÙ€J…±1Íšà\nË‘…¦æºÀ÷kE`k¹\'.üÕÁî­ÕëD©Žó²šd«ÞÛë^	=?‹<ld -Æ°£ˆ¹adïœ\'Ø½üü3Ìò=n¥¥MƒÂ²gÏxz )‘Z‡ŠƒKpïªUn×®]F›9vì˜{ñ¹’(¨Ï13Î!%`ÃåËîæøvÀ¶ídÂkœ÷]]v‡{ú‡¯»uV6Þ}÷½Ø!Yj¼^ÃuÖ†ùkŠN’õ=‘£‚+ÙŸ®Š§´óÓV†2û?¦;K‹½ëjvEQŸJäDMòÆÉÎo&\\£ÓÇ3‰K7§2PY€‚£´¯d—¢\0ÍK	Bv:‰ÝØËYL!Ô›Bã/¾d‡G€\'Z—Ühw`÷‹ÐƒN£ÞHc³3À¬irô&%~š-Ì…ø.]\\)D†(‡oØ±ÓÕbÀw¡¡Û9qÜ\\µ	žÊ¦Ä5,Á/O÷F¤ue€SL?›@ÆµvÝRWú\nó-4ö’šÒ¦“ñ¾…ÓN{úd¥FÐ“	ê%hâŠ îgêë€3W:äº^ÊURRNNyžb\0ø^æÒœÆìbîç\0ø›oÞeàrº>wìu×ÓrÑÊR°Káƒ.ç:\\:W\0‘¾Á=ùøwÜC¾F\0ø7ëqmóR¶×QíÜýp=ëï„kkº-i™YR9ÊèKXjÖ©ìî¢ƒ¬cÇŽL¿ýŒ~§±±Ùµb[V¹Ì-_QÞ|Nç¨uøCA0@Öó¥­ùB$”ÈØ´¿’MF¥RéPÎ¤€QÚA¨8DTUàÙ]y-­DC÷J`¼V¨¥–üºíË«žãêpfB9²ô ˆI²ö0¸wv¬ùpFF¨¬0	,j\\´\0ÈI”5>6’!Çž†ì¨Ž¡ºj)ÍÔÑÔÆTûAþq‰Íùÿæ¾)S4–åÕ¡Ô\n€”²´Ïç$]ŠYÁÄþ«ês]?~ÓŽ-ÌX=h’¹ã®ƒ¼qÝ©´¥Ð*øýz²:ëFµ\0ëA%…µÑZ¦X Ãœ^“P2jÝÒµ®º²Ìµ¶ÃÝ³)”»J:s]!.—\0Ê¶kïÞ=†/jIå3ynåêîYœBFàë¥g”Ú¢SÀ`-“Ì¹™1 –’92$VŸ ‡[ù“tVÆê:jÁ›	 åŒ´Öú¾-@;R,ÅADgÉääÔk®‰dSÁÔ°A±q9 ÌuGxšX	¼¦˜´ÒdM…dr×mÛêÏž6‡áâÂ|‚_­9jë/©m’Áf¯DnÕ‡ÔLw[ÖZLàò{AÊ³~ˆÁÒí•l^Ý	×Å°ðËçÎs`1Â ·Œò(,pÅò%f™?Ìa4Ë5—ÉE7ŽÉµ»ÀVkÈÆÌC0\0Ž¤«@æY´ëCx&w’ž?wgï•dd2û¤{Îæ—ï °»\0ïM®2º×rùQ°Sæ™…§ /,H@Ò¶YŒªÙyóõÛ<gùÛ1v¶[ÁZX…V»(ÇçÖcœ«£¾_@yï­!Ã]ŽÊäôÉ&sµ>øúaÞç‡k\\ÎuÛ¼i..yàÎžv˜¡`5šÀ8™j ¾\'îé\0Ã––h×¬ßÈúÉgPÓAJIÌb£RúÐà!k7[z9¹$á“·n2©@¸©ºVÿhJb‰WÂkíUS„¼Ã&¶mž(\\ô|Ö`oNPRÒOM3§Œ1îðÀóE~,Z\0$¨dF§ÇQQÁa#‹’SGìC}m.+Õä,ñ¾A]Ôk•ÍÞ	ä×\\p“Í­7Wšßœè\n#Á®Öa9ˆ#®ç?ïÝï].Šd-ÉŸeBÂWÖ³P‡™b#ÌÑ]ôxZ\n»9+VAoÁÑÙ¨ifÜ¦tì¡¤ij¾l^tî{î¦ûHI|ø\"†Å›þ5•LPã3Ó²…èö(Øé™õYïJüe{Îg]·Dh J_Ëú¼ §®ž}6VÛ±­P^n	ŠL’gï>1?DÙÁŽ„Ôdxx¶áÿ‘ß+­©q×ke2ª409ÆaÈ¶\'.×=½k×-îž;î0Ï¾\0Ùö(Ê„44¿ åHÚ–V¾—†È(È4¾ˆ%Ü£2š	ÊÈ3dÇlx®…a³(Î(ç‹Mg-xã.D3 ÑUÕßD\0¬´à$	”öÅÂˆA\'RÌÊÌ£“ÜÏ\0õ³nÝ†¥À…”§Mfs/ñVe[\"¥¨”ê>m¿n£«g4¦EÆSJ\'ÜÕ3@S«À`wÜ´…®ÿR#‹Ë«Qò¹lÍ¹á±iãJ“Ô5ƒ?–æ14+àv\0{¼¶ï$å1Fî»™Ù±mó&wÛ-73ÔÝÛ×mZA]J°v ˜ëµèQR\'”ÏEk™+RÇzáŽÒ¥\'¿pç°þ×á0I50Íû(¸%iÉü·²@B™$±wËþY×IÐ“®yëÄkž½svòvßµ’ûªoäõÆ±ÿRÀŒ€yNBƒ‘\\tÌ4°0›ŽeÎÇ›rÞòã‹òÏE	€­¾ù¾\'òÃ¾¹,]àYÆñMÍ±Á	Ò—ª©Î“>~²\0h5°}Hœ~¥1`7Í³eŸBA.aö÷•À¢‚ÝÈFœ”ß°0ÄØÂÊùÞ(ÍšÍÇÈÂX‚ó¤Aæ0*)Ë¢œ3Y¬lúdº?ÈæKÁÊI#ŽË°]\'ç°E“ÒÂñW{Ü@Ï ÎÔ”;Íîúëw˜¿`¬~ñÎÔŒ˜“+ã£âàk}‘{Å”ùY‡;Ñ2÷Z,ü¯g¦‡ÁDgã )+ŒÇª“›a?f^IÔÓ‰Ô¢¬À²äDv©gUÆ¤®²°™Är“B\"ÌJ—\0K4k3É ð	µîvLKÆ¡º6SaRšL¸€!Ñ%&OÄé¾äY^õ³AN¡J&èÉ°U‹ÛÄ@û“îÜéËXÏs4GV÷5>	G.ÃU×äpm0»íFšˆVWçó—:<c—ºÁŒÛ¤ïK¡cj®$2Îó\0*ï=BÙ=ÜÝéš™8#!‹ýh>A+ÀýžoÃÀ@þix.£œŠ‚[çpjªc98(‡jšY5fÔ õƒ¢#ƒ3/ìñ^ø?Ù·¡ZœHc=H2in×¸IE³YàÇ?ù0ÓÚÈ„PþHí’)Ök6yrùz(àéž%¸EàEæó;\n—ðK|îåýîØá£.·¤ŽëN·Y0¿&¨É»›WáÜçäÎ“µ•ŸçõÉØ5¤«	×Š:ZW8*	ø)5=lÿÇUjRÊÁ[„kî(%p¹Ë+@t°0•žZ O›Åüdñçí^_<–m[œ+’öÈhª;ÛÂ†ÍZ‚§2lþ)óºˆøøžìDÚÆÕL€ò&ÑId0?Â3JüL’\"SN+ÙxM(/K””	¦¦h¯…®o4i9À¬iÀƒDÆ|êÔP&(©dðdS˜€¤§±±õ{šS¢_Õsã&‘ëõú‘Ìy]NÉUÕýÚ—¿‹W-€y?ƒÒ‹ÜÖ-ô	€Üw¿-¸NfV””dð·0;Ut!ÍÒûÚ³(½T\'Z¸0ÙŸ²¹T/àÊ=Jö!¢·äNãt7#àua²luƒµ¡µ©¤…Ö‡º„æ2ø[ÖOê^\0íä$F¨à=äø<\'Pˆ|Ã,ÒtÅ_‚BœÍ—†£o(œw%/ep™÷àÚÄ´¹Øx?3õT#¨Ròò	<:ø9ÄJo³ðþ‡úcþéuNSþÍåÔ0Åï÷Œ^r·ß³Þ–Í¢zxsV^/c.»{‡!V¹gŽ’å¹ë·-Ç‰™aá]|=‡ßÅk’&WªFª’åa…•Çð4’»}¯p5+Í#1\nð®A2o9ÞhL¨Jç0ïA2À¸z}â¢¸vz/R\n‰à¬à§G˜NÆ_ÔZ`b\0ÄuÙŽy”Måë¦ã&óÕïî¼©)_¼=¼Y\0»ŸÛë\ne©µ9:Òó œ,p=Ž¤­SªßIi€ šF°ÎÂôTkPO„ŸF®ÝY¦fT®àº8¥ƒ–Xü45aJêÉÝtí	æ\"Vƒ*Sñ$ib(r¸¥òY†^r©¾Ö#2£JÃà’Ä$Bcx÷×ìÂøœäòªJ1|Öv³÷ßj<MãÒSŽº¦µ9Hs	jÊŽžÎpWÇùÚ½Ï~xÑqÀEÉ\0I\0R&‹q&ÄØÜÌB&Z>,ÀQê±Ètò(pèa­÷Äçk^ùÄ“I¹ýüÕGÒñóFL×·3á†ÍÂ¯ºpöŒÆë]M•º‚Ì¤BpÎ¹‘¾ÍŒÛºu+$YõEÞ5ç0v!ãJ#¼Á<…ž_ \0§N]²ÛcÐ5\"˜$Ôc%UUìÕÎL `&I¯;}ì\"€5–P×{e”rYæäš[	V¨“ïø±aÌ37¹m-h€“HI˜\"ÇW2»åVªŒì}i•%ß¹—ÑÉZŸ¬N”´úûêäYw/QÆèkI*D²˜´óœ{­eÌ‡–+Gö²ZO9\"\"ó¬Ta\"\\À,dYít¬ÏHvSFNŸ?äjàgà_µªˆ@ì©zhlÈìaIáí·ßnYµ6 þî8$à(x˜yÕ^µ|<ÀQ:ñÍ4É	Q~nŽ!>ÐlÖc>PU]„ÊF„m.(Š\"iÖÁï0@ú¨N¹h*µð…õõ`lÀnM¼šâ£0ì9eûÍ\'°rt~a9äj\\¯•õ(I¶ƒ÷Í«Oì±†(Ùë€5ªV¯_eY n	²[¬§^² 0÷ó:qæYVnnBØí±¡;Ýùógˆ^JÙ_UQçjJ}®Ž©r#ÃçÌe:š<‚ÊY…‰öä=óîà‘Ó¬É\nž7ßåSÚâF‰Ô­™ÁE]Ï}4Û³]ÁšõîðIÜra9g´ ¯ç\03y î¦wd{›“À„eF¡‘ÜªÆ¸VG½å\"¼bò ï¹ôßVZkÅØ:L,À·òrõÎø¾öýWéC\nX¥0ëé(M«(îGHHó\nó…åe¾Ùðrï„YÄÇâ@IDSRdvT¡d|b¢ë„QV’h±ë€‰«,ûqóåw¼‰ü¦‚Ú»å>áV¤}ÇOC@èuiwÝfYÈ× 4À\"py†ná övð™k«—OÈ,1ºº¶ydl…µ¶0_cØ’º¼Âe¦áOE2Š°\\u9wms¬¿ã\'ÏB}ic”ftš·óº5l6FS¤˜ÊÞ$—øûÔèîúøÏ£ÁúB3³RÉnã§$Ž3P‰‹˜Xho”úö•Vö«=¡ÓÖË˜“×VAÖŒlg¿qá®•A{X¬‡Ú_yËâW#eV~‚têRÀ)…™‰ÞÂHÇ„ûŒ¾&×M!ÖÚZdp?A‚ý>,¬NºS|hÞÇ;wÁ¡ƒ8MFsøÈ)”2™`&2î8ž—Sê.^j3£€(÷¡¸ƒ’ìm†¦YMírÞ`Øº›œZ*§£(`M-P]LÁÓ,.·ç¨©^æºðUÂq&+[™´aY‚lß}ü÷…—uyŒn™»|¾›÷Ïi—ÐK+˜éZØÚd7Óî…ì|Ø¢õNÝòU¡áºzÇè*7 0yÉc!A7†±êy÷ž‡q¥¹nÏþ£˜äýŒƒç•£>¹MªÏÕ|àzt¼ë¡ÿ\\6ggáÏèNg•¬à5z„ö³4jDyH`ý†MÈÛnô¸§¯£)W\0ŒE#Œ•Àâë\\§;ŽÂ°‰à%)8Èä~Ü‡·n¼5 öÀ}ôû?áÏÍr?ÕŸUN$…HªÞ\nJŠð E~,N\0ŒÇýX.…X¬–Žir=ø²)ÌP3Ùb7ëO½£èÊÄúÄ2ýa°x^`rñ©dI-¶Õð8e@úÞ{>ÔÄLØöövw”˜ƒgÝkX])\0J~%™TD£	y:Î¾ÀìŽInÔÊUkÈ JÝ«¯ŸrY€EXÀgdÜ‹/î6\'•ÉQæä1‘‹+|ú\\·/hÈŒ°—å+WØQ¸gß^—½zƒËÁU¦AÛý£MvHˆ§4U¥¹”qWÉ8(7ló%÷²Ý$\\”zÐµžù™kT2WÂ«5Ÿo(F¼æ‰R#•Áqç,B³3ÔÐRRæ8Ïû¹íŽ]®ç¢ŒT5nq²Æ‹ºÄ5mAe³zõj³®ÒýèhäºžáZL0¸gYðrŒº]?î5\'ó÷ôõs ÛLÚÌ²áëí¸áÆ›V\0]à©Xnxi:NÆ3dNŠîQ¬ê58—û´rÅ:wò*	Hµ\nt…$ðàäšS“¢µµ•\0}ÖÝqëõ®ÏÉ,ÄCœÌs6A™Ê<fÝ4‘áè”R3}^4An÷þW]UÝR{ò/l¸ØD“Ý1ðN#†cÈòn\0ë-Æƒò•_qY;SÓ×»å«h‘Ocw=©‰lXƒ­Ú´„ƒtÈhT¯¾vªô ¨7QoÎ[M­¬ßV2Ð<²Ýµnìú¯¾ö8¼L¯I\"Í/9‡¹6«Ì”ÜqA/ÐŠ¸f8±€ŸÐE\'×“7KfñZ¢)rE\"™˜¦ù¤=2>:˜sÝù¾ñ¥Ä€H‹÷X”\0¸05á‹NO†¦áß	üVx–Z×\\ 9å´.½ÌB7äÚXÃû–½ð©çñžKivòõwüüÍÕ”QAfìßû\"[vý(ôŠ-Ü¯¿n°{ÌµâžÛÙ‹¶•ò3‚êÁ°ž5‰õuöâÇ&ÍC»zëwS¥2XzŽü\"´—n&©%>v²!Š‘UææÙï7\\¸,²½mìº+Õµµ¤úà~Ì¦xeï>wï‡>‚°m0¡ƒh:£d5r2ÑB¾òn®>\'ì¿¥\0yã0¹:L.b„ZïÄÚqÞ$ƒ_2kô2@ïy’ß¿úÚ«Ûä5§¨#av–®­\"³š#Øjïº¡Ö]Ê˜\'^s“3Ð NefBõ‘}<FÉOÚM÷T&žÕègï¹ïVL@±”:Ú„ê£ƒÌù(@ÐË·Î¯2ÁªªbÊêÏ·Óm—n7Ÿ×CöÃ *iŒ¥·NÉž‹Ñ§ye¨<hP@ËÑ\\iñO…Û	ÓS@P¦#-ïè`Ÿ»ÑZŠ5A¦0gë·¾¯Î…GWæ(N& <¥iÝž<:¿r©W\0”é¬è=·Þq»»ù†5®¥3FúuÖPëÅO×›PØUÝyïM&ÓPöžNF0Ÿ©¸ ‰‰èU)d·ÍmŒ‡$=Ã¥»ŸÚ9€4”6{uª¹êoê%5dÇ6lZÏXÍíÈÑ˜IŒd‘™[f	¹^ŠQ©’ÓÜÞ~7%×Ö¦zÝ_ãØ5Xì‡!~B€§Ê\0‡8ø˜¦‡¾!²^¤²8¦˜”UIAµðž9:Á)pà 2Ù›8?£¨ðÀäuñ­¶™ÜŸµ¡a‘Å_‚q!’ªÃ‡\"0ê1aà‚KÜ_¿b¥ÝâlæO„14˜Ð8Dúë)IWÏ5œwÎÃ/cãÌ¥„EVÌ¢L£+ ß•)B#šUÙS-_¶šR9×x[¯¼°W-[CMd²áREÊŠR†QóãL´Ë5Œq¯=IÊêëëÝ%´6F„.kœë“BGA_{x K¢M—t²“HÝ#­^)ÂtË\0¯â\"¼µ6‡No^è†¯T¡¬EFVõiDmñµ±fáDJ­¢%—ÙÁAê ËØ`ŠMê;Í¦†–¬ª§	2‚Bò‘&Jm£&S~A…ûîÉ—È‚š¡D µ£ÄÖhNÏA$Õ}›‰f994\'Ðþª!S ;*´½²ú’ll66aÏe1õ­*LÔJ^eÇR³$º>2‚Õð¬\0i\\\'..§ð	¬­Ê6¾¥2[ïPJâá«\"ƒ«äOÔË”ï]ïW«LëGÙ’	êQYŽì™]/öYš¿2N°žgfb§Ó¤r¾~x¢Ý®Ž¦\\ë¤ë+yvbY5åWÇ–:2ÊJJù‹Xk¡l–	‡.…^ÝÙ¢ìÁ‹K«)·y‹œEAþ~H¯™5*þ¨Œ}Õ<`Î°¹Äºy‡\0’Ì\0\0ßÍ‡™èÊO’€?	Ü1E•äg­e¤gúÓós‚…•U?Yvôc¼™E	€,6ŽÃ)*WtúÎÙãÌžµé]ü[¥‰Æ[z<@-ÒŸ¤NÜ4“ù\\ûz)ÎÊÌE!¦M SQ-d6ººhêØI@>ÁijM­¦×“€åBXÎ!+Ñ+”c‰¾ŸÁ¢UY\"åŽÜRæIq”Ù–”0›£¤Ú#ºE§^².›þN\' »&eàDA:UTJ—¥AÚKÝ‰®!wîÌiž®\"ØP®À—	¨²\\\nwKõ7ñ’M‘î—’xo`€ÞõLâz×ZÉ`øðGÊÈ7ü]³ÊDIÇr™gœ“9åºòu1ï¤™¦C!³E´˜£¼Ç,è&å™1‡Ôë,ÁRÀ¶—Kh‘ R4~GsëënÇ*þØYÈÅSXqÛXR=Oƒ¡¾öÃlˆDC†Óå3@JÃƒä˜faA35¨Š›íFÉ$‚˜Åê!layªîL#Ì:AÎ–·à Š½{^ukõq¡!-\\ÞrXø¨R¬˜¤…jj­\" ð{+3e³FÐÖCW<KÔT?2`Î8‡N»º¸Záit|ÃðZÚ[ÜêU¥¬âD³‰)ýcì´áøæbž!ƒƒÑÑóø1™¿›é+Ò>ÍÖÕ,ïƒ+F°v’‰þDw•ŒÐ3¦z;¢‡·o®®,LJ(ß¥pV§;ûD®5*ƒ­ý†½;ödÚ™[ô&È¢Ð`ægüŒ’h\'±»6V£½?©O\"\\‹Ä|­û¿ûÚÛ%ëÂ°´hå¬€ ’\'+e²NÒÎ$×Ö´4awòpÓ© Ú@KK‹™pÊíEÏ¯lFÿÖÃŒ\\ùHU‡Ê­¼÷F–%˜Šš¢Ç°QXÈÊ¸äX,‹RˆL`\nCRIñF{QT¹zð.¹Õ„ùHœ—Y^I¼Ë$˜¸(É`fûªMüv€öXŸ7Ç×§ÇYðš v˜¨Â9Zø#Jö«‰bÒÃæ šQþ;J”S¹NH@¦3>M\0‡R²,ËJxùFÁEÛF•êÄÑ5f£ž;Ã¼ßÆNþ]^ÊS<\n’mæâDÑÏ5)¦Á 9.%Hï*€%Væf3*²¨H%¯Ô™æ^£{ª{x(e|žãGµ2N A\"L¦5‰öôì™ó”^X•ƒ!I\\5AíT#,Mc$cÓ¸ÌÄì\"+7e¦Î¶F¡JN™$Ìë}NÒÈ²®\'ºïi´ûzÎÍCŽÇ!\'\nÎ¾jè=&ÆÏë¹§pm6CZþ­u*yŸ`ÍZÑ´<œ¯Ì4CYµ½G]C©Ut-ô|ïœ\\$¡£dÆ¿ø%obÉ&6ŠŒ~!ª‹·)øJ¼UÞ7L>ÔÔÔ´èà¢Àht2„3EXÍ†TøF#”42dœ¥±ˆÊ4ÛÁ8Z‰æÕÝÇd&“téxÓE{Ë?¬[§å›xïÛ)Ú„7E¬¢L®.âøMxÃªå’ÁÁ®ßNRÒmÜÏOxKÐüjèC,´Z¢.hvsÊm,á˜Ê@°N™‰Ê=FTò)¹‡È_®é’æfh {žk¤+zï}÷Aj¶ÃŒ+BÅf#fŸ—špÿö_ßæ~óÓ¿ÌãäKpŒ#û£_ÓçÌÀ@‘S…L³9t­„e‰Â#K.‡&O•ë*èkcê¿HË¦Rp–\\L-i+Õ€þ­G23iƒìÀtMå6R]YUÞ‡y·nÙÇ2×šÊ5Šév†!8kÕšˆ…@ª ‘ìÅh“Õ«ôÓcˆæÇcßy‚\0„©§IÓ°ÜÇT!6;^ØBæÍÔZî£*Ï›0Ý<ü­ÈWo©š23Ñ]\n= †ˆæ®ˆ×ŸŸ¦iB¦„9€Œ$ô¾³ÈÜEäÖpvÑ.0¹žßCP%ÀÒÐ¡&‚þ–©/„ô\'ÁsíàBÇ,›,£2Ü…†Ðs·´ÐíÎ ÖÚ5ÑkÕÀ!]ïhkòºô|tu´`®Ñef8¬¹ukVšVÆ ÁR¨ÔÖp8“Pj6y.‡L.¦“È¹wM	Ôˆ]Â/ýã‹V%x•«LnÌ;P“ë,¾Iê=Ç¼<aŒàøô>­A–	&p‹«1ãkùq&—wúÞÕ?sõó‰#†ê5Åþqo¡=	¬¨¨\npýå%¥	]Vòµÿô?/J	Üpî¬ß7Ñ	Îà.ŒÝ‰`Ý(6½q4-þªLã\'ÅßÈ\"í®\'t­šWêiÛZ§ð¦ë2=e%Cä-1þI\\XÖ1¿µŸf„üý$F/)J·Ó¼ÀY€R&»uáN’“…ÄÚd5\\I¤ÚàxÍ1£·áÜ	Ëø±ºª´ÅÞÞ9n¥¡lŒ–ÐìÂAn(–‰ð5Ý[ >üÛšà¬µ¹ë·®ÇVjœ¯õ»\'º¢¼»àGNB\'Éã9˜+,B\"!:Î5Ôæ›Wù(†­–2Ç¿QeþoÊßA£CAN6*?åÉ§  aJ#dõ2˜Õ£™’½¯cæe€$ð~pTa>Eþ}–I7a@Ê¸I,Qj«k¬yÑÞ>e<ý=è„áüicq\0(ð¤É¢4ICœÆÉuõÐ,hkþÐWÆ(K(HÆ€ç^”CHæ¯9>Á4;JÜ‘‘ƒ0¼_6P‘á²9õÅ¯½®áRFù÷1 ˆŒD?*\"°Æ,è0ÖÈïB£j8×È”69¶à„\\m=sÃ¥R›=\"}p]u9Ä^ñõËyâL›˜£”¥x•”¾2ÛÍ¡”©ùÒ2QÇVAˆW¤j¥¥™f\\CµHdµÕ‡áNÅHPEs†Â‘#nïþ&…óÇÉ\n!ñÞ~Z¥ÕÿÁÚúñÅSi°“ªC˜‚Ç–AP„Aï¢Ä§«_ßOý46H	DO1=/ÅO–e‚t™wzy7JLtO‹h#ü«õãÿdÈÖe~ÆÚ’3‚ÏR:p%œÞÏ²÷Ë_ø[256,ü%5»¬ú{wÑ`DvVFuþÌq¸WkÜ­·ÞêªÊùÝó§Üã}ƒ“ëñAŸR¦Ñ³jmrO>õ¸ÉÛúû&È4P#±Ä ¨Ü‹\0¢ëjt´O@9ÇæérŸøÕß`¸Î÷òK{\\Ã±W‘¯IÝÁtSÃ¸“9ÏÁ&\nÈ˜@6bdIf,IŠììÙ­ÉÓ:™9¿—ëG!osU*Ô1wd6]˜ÌfŽ…šIvËš¥Ä;ôÚën¸ñ$35ÂnåÊ•f\"û½Ç¿çz\0ûU6‹?ØßÓêÖrp¬ +Z—n–Ó…s—ÜÁG\\C}òó*¨<Q´ÀÕ+/Ës[63¨Š°\\|4GÅkpC,±†*ä`,k©OTU6%~ 0Â#GOÓHh\"L	GUƒ(Yì¨æ×0$)fÉ¼Î1T|[†Aó=fàíI/¤¢¿«‘™Au’i2ôj®Ê³Él7Òä8wâ0Î5MÈä¸W”ÓõµÛ¶3MPnmŒºÇ¾ý5h0¹üÞ [³r2ÉtÏÒ§3s·¦±±ÎäA¨[ÛŽTïÐ«ûhŽÁÀâÄ1¦Õ¡pÙ8±ø!HvT†Å?S›.º^#j(;’ÁÎbàUÝ[û÷UñÇßAïÚOz‚LÑºl ?U!,…TL%<,j\0\\²â†…¹ÞÇ}ÃÓá…(à`CÛimY êüD¶á±ô2ÌÁoÉ{®uH†ÈH­Le6ek!ó7J—–¹•K*¬d¹nóz>û]Óå‹ø°¸-¸Àì¼n³éTÉ=póÈÂ~©Ì´³”£™`aÅÈs6¬c1÷r*÷›}¾¦—Õ2ëCr,)èm[¬`a5ŸOmFÕ¡Ò;Ú4N~YÐçsšo`*ÚõkÑ(S¾¥âWxºLFÊ4êÆ*â\'—“9èÈ,Ô¥0c1ÎÁ¡Qˆ–âÌ¢º>Iz~+æZ+øj˜áêÀ©Ÿ½fÿë\'`ZØŸæ¾e¡ï-“«È¡±3|J¦è•À¶Šq‘«Ýjôºˆ]xŸ~²ì4Äÿ˜¨HD3ÉÀ9`é’2ßdr@ôa_ÕËT²2Ÿ4îQ:Ô59æÌàôÁnsK–VÐÑðšÞzÂ¸,ˆyFž¾A¦³d|µ62S£4íCæèñ$O>n£-ß`S$2@äg¥ñ%^ƒ,óWÈÄ\"§\0s,å9´ä­\'ìS‡W†Ã+ßÆG™›LR^QåÒH‡zÛù[qL\"(6jÝºÕXòË¼Ž×;áNž>‚§!N2¸\nmâ~— Sãeè9€M2&W¡a²_A½ÊåaYÄZ+¤»>]Ke¼àšk6“ðåSï…{ŠweU¥Ì¼ìš¼¿»ÜŸ$Rj÷[<°ìO±N0†Zé3»W€í\"?~ê ÔhiÌÎ›,!„§œ²@;%8µ7¬®¡ü\0¹ïÐ½ýñÞ»Þ¿ñH`‚v®°¡8ÙoÝ¶ÖÕ ˜ÏÆÆ7/¡.Ü¸ªÞÕ2ijÇfx€øº™ÊÁÛl·Ü°Ý…nažD¶Ç@Õ ›i¸Œyà[)\0Ùxø~ÊA2è.9dÙHÁV•ç¹;ocfEE-›’»Å©øŠ¾1a@c\'e\\¹t	’²ŒmœèÛŒè´Œ™é÷Þâ¶â¬Â>·n(¤kxÎýö¿ÿ#7H	@R()–ìâ­Ö.’w_²q‘¸\0WÌ,ßæâ½5|{;Š7º„:‘e„0Js„qþüRîß*÷àÎU®Š€¨ë¦ßP¹üþ÷=`Mœqjýl û!æ¢áÚçÐ°˜ppg>‡Ai~öÉ\0.Ð“dÉq ˆlºíº¶M@—Ùì©OQFú:é<ÌJëg›)uiÅS\0ÌÏ+ÅžlÔ\'F`ÆF]VJvbíI—hôP…Ïm*ÃƒšZº©&ÒÌçtpp¨¶Î$¶[RW°7ý”Âètó Ê×AZW§6B¦WøÈ{(Û¸>Há²1ºN¯rYm!%ï‡êL¿‚Ü.Ó\\ms-ù,2È€ðB0êÁ~Á°¸>ËëJ¹7pˆ\0ÀRlhƒ?™–p9üNV]‘;\0…F4¤öþ±i…‘«K`;-®ºû?¾*äÇÛo?ÍŸRùË½U’Ä½Ñí!]÷öåÎ¢ô(®~‹\0S©)*ãÜ\\Iá¼dEÕ›ÀÕ+±ŸÂ5}ÓY‘èbš+4‹aim¶+!–)Ð«*#‹@–Ã\"Ãæ\n	G4¹,0=D¢×-C„å½Ä(çB²)W´Ss¤ˆï%-¸8¤¬T²Ž%”ØáI\0’J(ˆ­`ž&]‡¦Eªç, ¨™\"1t«ìšj6~Ï\'ž™ÚB®\n¬±‚ç;ÎøÅ)ê£ ÁÃ#ôËEÀk›è<^]_1>½ŠàlÙT¢dNÓo\\ú]k>Ó{~xaæhô`äpä¥ç]ã*É²–ÂYûÅ‡v4Y2«›õwsð0ÔF“)sJ+g »åltÄ¡n´buŒq—cƒãÜHÉrÜêu¹nÝr#þ6µ4 Cl4ìTß3`~ÝÙž½gò™\\ÈÄåwÕÄQ[G¶Ï!70À5½E‹^íe!¥ã 66wºukÁÑOÑ³BÒh$À5ê ñûé4_2¨ü¼ÀÜHîwui…«DŸåý(\'–\"\"~I–ü=3Rýeü-H\n8XOšÍ¬UÃ¨4VA]Q…j%UÚµånD|ÇÄÍ’›Ì selKA\0ÿçü°©ÌÊîå8”eêýØ$BÍ&]äÇ¢@À?C¿:J‚«LV™8}½F;1™ýýdïÐh?b†ªÐà-Þaº«Zº’š{Ë~cAÓå`¡iVêå±2œ,„ouÄ/iŒÍ¤]ÀÉî#ˆ	j\n¨3Æ‰¿ažnÐæÝê9øoVïî\'Â–fÅUX`x´Ü!ÒK*I¯lãùåœ	fáç]`9Or‹”) 9ž×&æÙ®wÍdP#?”¹8ÇM²eFV?‚þ8Wóê øv?ŸD\'Dò±é%?ÓðõPI«Æˆà Í\0IÊ¾ô¥/»õËjÝm»v\"ñË¢\0Ma`û4Øß(Í!è1üÍ¡ÏŽNãÊ‚)Dr®¶–v:ÊÕÐ âÞÁÂõYµr9¹¥\\[¸}dae¥yÖÍþ¦æÄlbx‘i¤‘ÕeV˜ÂY›²Iø‚}ý”£˜ÛnZíž~\"à%3Z(-s„Læƒ\\FŠ&£ÔU+ê¬Ó<=éiÖ´ã6³8`¤â2±€$Höô½ØåGÂ2;Õy¼.9é|,te¡SŒ	˜¥‚Ö¢û„½Šá¥A:öAÄ	rÉÛŒÐ-!Øš+3£FÁ“sñÔŒ9Ykü¨¼\n}TSØ\nMÑÄ‹§dR&£N‘?#Qv*™`XYŸÈüìóÿ®N†ìgÅ,æÏûSzài×=%\n@FÍ(€w‘?õsa¡‘WOãøµáÿ3ñ>d)Ÿ4‹tÙ´qu\nÃè÷Â„Úç«¥wÄ½Qâšã±¾’¤Ã]¹<‰›`¾¿Ñ5Ô£L³’œMx–(\"¬J`?Aû]“ÁÄERF L‰i‘Ãm‹q3ò]åü<Y™›GÚžBÛ—É&³€gt‚³ÁôÄ²‡¦\0½ÆIEÕÐ püYÌY§TzÂ~^³o}¢ickÎ¢Þ^¸•Ê!prœ¦—šK´!9|%‡©µ$iò<TFb¼=¾¥áèúµ}oMU&£Ÿã2éç“Xš—N&Éã}Ö}PþœMÉ7ƒëÊ\0½‡»n»Õ}ö£Ì:þè‡ÁS±÷Â&þëßÆýý×¾ãŽ7àÍïà“×OF&Ã³>XÉdÈšÛ1‡øÂ;™Aô—l¡Ë {!…2Ö§-µÌ¸:»Zm@•Þ«Ì,‡‹:ÂÒ\"C±2úHTzk†õA- Ã£\\•/ß<eí0/ƒ.cfG’öáÊ“o¼ëtž^XÛ™ª¦õ!þœÉõÓjÒi4\0—Ie¶F8Ló7G†-`…‘Ÿù!%k„2DýlY_þ`i\"øBôà[6\"øé00û\na\\«8X4÷…ÌžS9M³…!Ð§rðe¢ZJ%ù‘*F4h E9e¬‡|+Kqˆ)­,vE0dårå½	V2°÷>½Ï^®‘|$¿-‘Vžuì­>ø¬¬ÿêZê/•ÐÞ´•aS÷I“ç5™Ø¿jpªQgS=ÅäïyNDÉÙ$<ÞS\\£É‹oAÝ~*0ö„ŸÁi¾Ô&CÑ¢>!dUŒdBKkdKâ„Í;ÚúóÈÐuì[nìŒxzðº 4h´£J:áJ&é²¿\\m>Fá‘D\0\\BX²kÊ•®ª7z’áO÷ÔBOãÉ;m¥ž<Çn”Mb’¨¼hmfP¼ªšÊcóÇÙÐ’“qõÒôó¼a°À|üÖôœƒÐ*2(çÆ¢qD.šrC0[:aþ‹Ñ!æ!8@·NƒÅ+ËXüÙåži*2úÉ,¥(‡1I‹´Z	\0ÉFIDÏ¡#Þ´i-Ù)÷ZvMì›îèÐ#Æy‘ÿðµ¯º&i²±œ…‘Âœ[À5‚œ\\¡ÉhÉ\nú»;ôTìzÛ™ÙmE%8nVVÁÊ9)áÒÉBÊH¸ˆ¿¢}høz”Àš–.82[¿{AAÎ\"\"ØŽË#3;[ÐP_úàVÕ»ÛVe»üÈûÝÑFJŽžtç›/¹÷Zw3Æ$´T0ªõ+–»Ï}úîÌÑ.WÊÐðÚ² ò®nL\'.Pâ3ÈŠÞ3,ý’ÛˆÍÔömX‡±C%…“ÂB’5\\O6•Nw*ù¡Já)ˆr¸ÚNÑ\\Ê Ì^`çê@\'SQiz³¹mÛ62µoP.b•ïQ6ÿÚt”ÔSü¾¦ÿM1Ž@VUbÂè¶[·}îbsƒÛ¼u¸ÓøŸjäLQÑhª\\/óa.qßÖqßäC–ˆ¿ÛÔ5Ê7îjêƒðÖ˜vpnài!•ðtÒ°E4îé<ÝB€ì\0ØÅØNhŠ˜/\0yÄñ1™g°v: \nÅxÍéd«ù™~wÿ]ëÝÊµëÝW¿ùŠkyæõ+Úe›ÈJN”Å•¢2Cs=3½¯¾¦kh‡¾øùÊÀø¬$Á›ÁãÍØ‘°‘³yU7.T+!°Útî…ÖÇ<\\^÷]<B#8¿¨=Š¦qÖæ<²ÙJ—Á&Ÿ-[æ~j†Í8Øz	Fl¼¿IŒmñWÌñ3Û¢î\\ ‹¶zºçò°ˆŸz\0ÜýêC…©Ýå\\©P!‹%Î×¢öû5bKxŒ²Nzºàºa¶M½Ç›„û|£Š™1*PJÆ\0*}2ˆ9ti\n³\\÷pŸ‡°Øéç-$vºŸ{á¼h¿LÃIƒ²£;÷7ßB	rŽ]vÇŽu=]Œ%äw‹\n\nÝ.²œ5K±S\"ø;×>Ô=µj.ÁXï …Ia\'Ðº¾øò«æP’Ï©¿š™·Þt#Ù›í6{Í²‡–æQ9\"÷œ²™Øévš\nn £ÁUÕT3s7Ë0´3ˆôŸÝ½Ï± † …†i\"(ãµŠó2ÈiÀï8‹h·t\\ƒ¬Å	Ô0nñ@ì-sÐèÑ2[ð<9^a´H$D\")˜›ŸBãKö“$Oá„3‚’¡ §N0.ŽÜq†á)Í6à²¿Ë«! gÜB @×Öl}éd*1šÍcîÓŸùs·œQ—ÛÖnpçOÍá–³Ÿ¬mÄª¤sŒ#Ê™ô¶ió2ž±[¤^uÙÃ4ŽD.ž#°ëP“[ŽHÜ\\ƒùl¹ÚÏq˜auE\'¹¨˜®=ÙC\'òÂ\0cFëëÖ¹%K–ðz/{Ø!9™9hS€3d\'&‚þ8ø›f_ºØÌ”»µ¸ü¡Þé5ó†Y°dZšŒç§ì”K\\Kt-úú\'\\VQ†ÃÊ^g’¾£d¢D êj°eÖSwwÔ}ïÏÒ¬ày k0ù}÷ÜËkc^éotŽ\'2ï¥|†òˆÛP§›Z(%óö¹#øU>÷âs6øÞDànºƒ[)¡û]T/ÓcEšáC¢¬U%d]nè½Ý`Ÿ¯®œ,ûÓ×UxR¹žžáÍu§3Oåº”*’Y§áðàšG)ÕS|Ð´Ïàù&5Ø³Ü«TáÇz.þgŽR0Êû·Rê/ýAG\\û	àŸè\\ó<ÏÁfw±É…øXjeâŸÈÉ=šÎ¦‰e‰Q‹VFzïa7Ê^Ô	Vº®%k\'û77Âz%ö?v¿àÊ)SÐ„«\\ºbº€’838Æá5E¸nÜÕÎ)–²Ûšà&Íàýw\"lÆ•±°%O:râ4U)ÁëÜ>Étw·3£,‡¿ÓÞÑ‰	ÂXøy”}CîÅ—^ÆEÉïÝ¸k—dóqæì9û]‘ªå&3:ÜëÎ;çV‘%f3<ü†¡[6¯õ\\]4ßBA„ç×@î™6¿ñŽ‘Í¸iŽ]&;â3Çß¾Ÿ°Ãå–2¿„;—®pcÐ}ŽØ˜ˆËIìÈ%¦êM}i!j2,Üµ˜},|}7ÿ;]Í3±ÿó4¬Ê¤m!Rnga-oEÉÝ (¸é>IâUÈ†Ó$4Ë(ädÃ}êaã „¾£-;×¸<Ùà:áÆùÀìV/¯r72¹¬Œëƒ‚N14½¢ðƒwÜMc¢Ä½üìË–I‡È>3Éd5l¾­ã’•Œ%%e–y¶´^2û´B¦ìÉÖ?Ðf<ÙáÈkÖfÔ@\'­%–IqY1ãëD*‚.²î|cÖÁ!ïÅxŠÚ\"wdùŠ’ä§|•‘ÌRRÒYO£ÜL™°Vz¬¬™5GùN•¢ÒTF²-É%G†9PÁ3o¿ïn·©qxÊ(›õpÃ;qÑ¦BàÌõõC|½‘ƒs	M”°q÷º™`§!R®$hEžxRD°4°ÔºÄJ…p>’Î¼˜c6{º•Ì.A²Ã*­l#pW3ãø²ñé\'_9ðßŽUfe¯vTâó[µä^ùQÒI²¤fEÐ½›ôž`L #ø?d	ƒO•Ršõ$^c\\ÄÌY‡*ˆë<¥êŒCCæÊ>Çñ½œà#BÂH`7/FëD\02JeZ\\hr0v‘?õ?°eýM¬¾ÓícÓS£.ƒô>¨Ó“¿$œAr«$ÿO2£•%†;xÚv’ñO‰ë•ñå\'ÏÆñ<aù\\JÛ¤s,šm”™£~Gq4±@½šÀ#`Ë“!êP[îº}eð ûÎw3ùÖ‘ãÈzÌã=ïyï|ç;œæÝà0Œæ2ibt‰\\78±Dú‰3òˆ“¤ïãÿ+-Írû÷t/¿øŒmÉàŽ>A‰Uh²*Šš(Ÿgš€tE™- 6R:Ã}ÔÝÕó`äÙ!V3w?ü>üçÒÜ7Ûç* ZGrKÍae¢üêR855P¦—L´ŒAV/óTÍÙAeŽøkrN–O×Å‚ŸËŒ@¯iœY•~–É¦³É÷ÕÐ‘!it’2‰E<Í}òû™nGwÒOv£ësùb#“áêÝKO?ár‘¸åp6¯]áºõï%?´Þ]Ä_ñ£ú°»ž)lÍîÔÉÓ(z	– GÜó2»ðXÁ’ÂeB)2•÷SSñd ¡’I˜“%ÞÀv-ÆrJ<O¶«L±~õÙ®£·{Ì-]VälØnŒlWÞ]Œõ¢ªÔ¼	„¦ý&KR†ñ×§ÍñcFÚB&Zµ©.®4üö¾Sšñâ5Éä@øínàƒ\'N_t—ðð›¢õ‚ùÀ0sù1ˆ„n9zVk}øÃæïøÜ“O<gkwšLG%µ$`šäR¦O•Ø;0ìRÁ2³¦¤Õ;èîg]®^¿ÚÁ`w÷Þ×m S\neb??gvr–XxYÛ[[2ð]+†$3Cëô>ÞxèÕ{¶`Ö3ç{dÎ³póœV/©â½,¸&àŽ¾!<Ð¡\"éœÌ¤õ×}SAÔ!eîß<Ùc„Îvˆë3œ†öÄ×E‡ÐÿKuÃëE¾Pˆ<>\0“dñGÿÔ`JÊLx¿;Ž=Ô$ÈØêäxo† Šö:${‘Q¥g¿h¾mvÔ{7T·!Lé(™Óò³¹>ò\0eSÅé¸zàa¶ßî`äˆDi:¡aã˜ê%Ë¬±PTšOÉäuØ.`E¿@fS\\ZæJ(9¼»Á˜ùú\\VÁ´1J.³À…y‹†*±qÀì²Éó)Ã™ÙcZÜYš)“lŒÚj¬Ï)³—¯,ëF©F`ÕF9¡LqŠ.YVèÖ¯_xßMP#s!úis¶0%¬¨„¿[_†	î+¹QÜœ‚«¦&‹¼æd«4Np¸ûÆ]nM}êf˜wS»B\n‹|¸îò„Œ.\"›Vuii Ëñ©ÓçÜ¶­›!&_€\0ÜJ9ŒØŽ®olv’\09hþ|fƒBE2¸ t˜!:Ò1Düs(:~þýàK‡xØµœ?á^g\nTeIJFPo¡TîhsO~ï‡í9mXQšÜLyÒù-.¬\"xsäk÷Ø$ì¥ÑÕ¢µ^€K©3”Ã‚:ôúüÚ0dÅ#ÙÙ…nÓ†­.€5|ãå}ÀR\\¨	€d`Â¥md[ëÌz×bŽ\02O¥&ÊaÄBÉÝë^ýÙg¡[³®–Lp3Ïw9#óY(Ñ48]FÒV§aŸ6+ˆ‚ ·råjó<Ïé)®‰‚²2ƒ§i’ŸŸÏœÏ—Eô°¤ÞZÿÍ3˜ÝšŸçµY5AÞÓA$•ë”71Ÿ&^ye¯÷ÙìÇaÈ`$nåÐ¨§ÝN>,ËK|\\+ð]ý5AÁ¡ø|u&¨mh¡U†‰FXË e=tïí”ðÈý¸Çö_týC“¦˜	DäÑH³‡Î·Ö‹h>½=t¼IÈ‡¡|åe‘éÓì!“Ö;3Ã¯ò5žT÷6\06IM‹§¥§-:‰ñ§\0íÏúH¼“Êát@)²ëU)æuŽ¼V÷‚ðox…ýš¾W¹™ˆz\"2,3 ›Ë‡N*ÜCd»˜Á›[Ti‹ùÍ`•G8\'Ï6á7ú+zõuQäN\"k«Tn„žC€µŸŸMKÇv	ì«šYÊ8ÄÆ?ÍÜÙ!ÊÁyºšÒ+ª¹‚ç—í\'=¯ ºÊJiÌÀžIM‰öuº-ð>UF«\";“®^Ã¥Jwá\"`¾Zk2ãd“IV¦k¡»_Êsž˜8íf\0ø@Ö7`Éžž™cÜ5ñÓ®ÇBk×‡N0O÷\"U#½h2ŠMê*s‚²Ãµ—é§®‹xÚ‰3çž½‡Üj¦”•-ÅÜµ’Í‹ün²ü¼0p-·d]NmZ#+!*£JÉ P•2ãråŠlw®mÒÝý’©š)}çÀ&+(Ÿ¾ë~Ü¶›Ü~pÒçž~¹!#.!*iÂˆ.¢÷Ø	ìøÄ°kÂfL­¼¬ÎüÓ±Àz˜Dç;M@`d¢ºÀq(6ÖQW¦K /Ì/ã5Rfaƒ%§˜5k0h¨§™Âs7·LáÂÜjÖúaP`àw<×VˆÀz6â,$fŸ“Ž˜£Ùþ~&«ª1ÓÝ·°Ÿ²zøDúb¬«ÀQÃ4·´uß+—°Y@m@%CúEšŠÓ(ã‹ÚÐÂUõÐSÐ’Ù¨ŠÎš¦‰€Ü·êõ©Äž/›IšF<µ¾4#>ƒ&Hk•bWxìÂ·®ýÿ]Øódò¡ý”TT%ÿÛûž‡\'Êj,•2–˜²—ýÂ!´bI‰[]çÀ\"+Ü+k—cw	Gì´Ð¬=Ö|…ÍAP÷›¬ ßÑÖŠ!ñs\0Ï`æËü,N0$?z^&FƒM*4ñè,UðÏO\nçÝ‘P	H³¡Tõ©SG@[«‰Þ¨½OÑO4Š9Ñ½2Ð›,¥ç<›QlÙ¶™aÖ[qgÉ³›Õß?âNœ8Áœó®¡ù™è4j‚$2@ïÊõmZï2¦9_Vã¤•­g¥@,Ÿ;=tµs¡¾haË¾\nªV\"€`_NÆ#–ºŠÑú¾6’Ö¶N5*x½ÝŒ^TÂdÁƒ× ý·l¥ä¦\"Q‘]õ\'ÕØÑð‚²^£ÁÁ´aôZô×4¬z;ö8t”|xuküSŠï`>Ï¢;öÚ!$eÍîìéFFG\0§B”¼ÞüÍFŸæD.–AŸF\0›d“ž=ÛèþìOÿÎm…/·iÓ*3éLgøÓÜ|&˜Z‡ë47‹N°)£tiJx%à>d!$™¦jðAM)$K­Y±Æ2”¹–…	eÞ·ýŽ;C™Øß=”Åu¤ØfÄ1@{Šævøðñkü…@YRšK¶“GIŒ	i|9”‰``6J©©k·¥:Þ9A 8ž·¶fMò˜ûâ—_p¯2—ãƒ­$Þ$ê’YDpä\n£ƒ&•²mœñk”•‘•O†®Ì˜æëðRãe·cÇz»Õ5ËŒ÷ÙÔt™€*…„h²zUµRÊÃÆÆdÆpv2n%Ýºvz(cL>ò(UÊa‘6ÈQ”ŸC–¥=ÎY«Èmt&s>Ýs{žJ®5£¼·\0_×¡6Fvk£Ä“¿ë»:¼ú¿¯.•õß\\!V„1Ö®¼Rï?tÈÊh\0…‹83E‡Ÿ`Trþð‡?ð â.ÊÁ0Iw^táÖtÎxßÃ÷¸{î.g½s­ÎœÂ‚Ü^Lqñ%cÀJŠd\'.h€,xfa|z<ehtèŸi\0œœóÅD†K²2Õ”Ì)P[+cÆø .•¬‹øžU¯^ñjÎ´ðÂÔ3úô¯ý¢[»®”Å»!vó–æ°ioa~Âî³¿óû‰àçýµ+Ø†ef,tô!ûR3$:Ïfó\"¯+¹ý1½Ì3Žô\\wçÀÔMí§Ù\0Änžk*%uRÏÓÏ™¯‘¼ñDƒIAp”¥:¸Á\0Ë.%Èò³âsŠÕ/‡qÔ¦È\0%çÕiß}EX\'½/Y¹AçŒåx¿ËG6›/G›ô”¾ÍçNºÝO¶U~N$[fÐÎB¦ÑÉóS—Q]ÞyžT>yã¸›ó³p0\"²6Ÿ 3;\'“˜Áà¢;…qÀÿŠÓPˆ¸»ïºž9×Qæƒ3õR–pÍÈJ48<9VDè¬ô9HÐýÌ7&;›¤9ƒ[N[Žeü,ì±¯|Ý;{Ùµ7÷P¦•™B£ï¾t¬ëU>F2Ú1Ës(eŠÆÄAxòÄyf‰¦ÄŽC#á~—d’ù¸ßûüçLf ´ŠP)€ÉëOÝœ»HjkVÐ„htõ—ÇxÑ#Dwõs3­ôMå=„8&°ÁJÊá4.@Î*©Ð6†(µ#¼Q”BÜïž¾67øJ;x(Å=úO_rpþ¹ÇŸI¢”l»”²k´`„PµãSšâ&*Û—k¶IŒÆ8‹ø¤tßõµ ¯IÍ(äê¹r€YÈì¨ž­ÁDÝ!ûH5å1åý«¿¥2S÷5…*\">Oèƒcxu‡÷-ñëšÿ¼/´¬Ïv„÷‘@ ¼ä@_Ä$Ô€Ê&F%â#=©ôá ß¶6„²OË34zlâã<\'ã‡…8ý}d|åÚžF<Ê0Ù¶ŸJGXµTRÒ?‡¸’*9˜aÔIˆÿÍE/=õ§üxõµ×94ÒBZ òR«GØ/áù8ek&‘Æõ)ËR§q\njK^n6î—ÝüÿÖmÃ¤`x¸‡‹3ãyßCoK1ð²³3çÇÝ/ó4Ïº<‚Ì¶5÷ÿ?Øf!©ÊM-µVOP²)[P–7H6£Ì­±‘Î†î8g°kœ“I7Ÿ\n‡&Iåk ú»*ùà{Ò´B?ÉeÓj”Ð¡,* @ôõºKø»`4§O79S>pâjQég•Éä¼š/Ún¸pÊŠ…O­X¾„.2|7ÞË0@ïÊ‡0mïÖL`è2‡^CZå\"¤ZË+Ë]*’¨óÇºY²¡LNB!Þv!N;•UÚ‰âÂ{–Ë\\ˆu­UŠéú¨<“Ákà§0kX²ÒZJÐIÞÓYh6×bq„ŒˆÌCý)Ø{aÕ~Èïý«ïþåo~Þý‡Ïÿw†Nå0¿\\\0¬0`Ò(stO<æ`I …-…2ä´;ÝaŒ,AT]•€ž™,Ýj2±,È¿ùùÅ`~tßÉðÏž¹þÖÆáÂbPº2G¹&û˜dt¢8‚Â³0FPRKEqñ|‹¨ž˜Åk—Ù©ÌOCÀÀ:è”}Í²F”TÖbl¡àç§Ù&uŒŒG×)ŒOY–æùó­ôMèj¯<¹K÷2EñpM®Ö‡†šB¬Ö{\\¹¼Îø‡Êe‹&åÛß«FC|¡áœ5Ÿät=19LÙ^…ÃË ˜f÷¢˜µ¹Þuwv9‹#\'3Y8£§Nr*]6\\Çdhd‚GÖ6ìLy‹f²“bªáÃgÖâ ê³öÊ.à¤šÍCR¢RANX¦Læ–-\'ý!ù	ù\\ª{£œÐO}ÿY;Èº»Îýú¯ýó®sñÙì²XNÆ2Aô¹gŸÀlç´µ«Wð(}å°Ãþ\\P£D4Ã˜!‘ë`ÂG`žæ	¢çt¸˜EÁ\0‘MggåÎDÍŸs@F:\"s’p\\2¤D˜GI¥Ù•;nÈGÚììÞ4n½y»éwlu?xêI‚Çyse. |àÜ{Ù…Î7h]¶ñÎÞÅÆËš“F*?4$û$®ËýnºJlfÂ­Yµ\n¸Zwüõ2×È³¯>:i|¬9JeX7EHÇÛZ\'Ý‹Ï=Og®	Ô°û6OuøÙmÜ²ÙÕŒÚXØ¯¼ðœ;{*Å{‰r-Ll)÷2æö9ƒv¶×}ä‘ûÝïüöoxtNÏbLVåF³›þÔ‰£n’¦ÀË/î±ROó‡×Â%<EþÞ—_@J–wî¨[ºt¹«««¯­wd‡s\0‘çèÒÜý*ç9®#ÆáCÀÒŒ©¹$˜Ap‚‡©Ø‰.^¾Íf»ß¸bP‹XÐãcÃÖ1U‰¯M dV6C93EÙë× m¦È´£½ÌUéél7æ~SÃEÎy®ˆ™&øÎÒ¥%G8ƒkŽ&ƒ8ŒŠbFz¶ËJyÈ©Ëìý§ZŒð‚å\'¸D¦¨uxêçæâ(n$3$âÌˆ4Nfy	ŒqÙ²6šdÃ¶aÓ!%G€b¦>’\\Ñ«+ô×ß`œê5xm¶ìROK»€NÛ:Äº‚)R\"ðYÊ „Û‰{h†\\guÿ|ôŠåÙw`ß#õŠš¥¦ÇË/=²†û¶?ÉFpžqO|ÿûœÚZZÝ·Ýð.º¢d•«†Ðdêr˜ÓFš‰ô2ÃÔ@èŒìyÙ‚f;î9ñÙ)ìÜ€ÕÙ®S&$|ª”âì’\n¢!à©ªRà–lrAÆoy\\Ý$I6BÌ«D•‚ÕÀÞMVŸ†Ÿ¢¸—\"Ÿ/È›5IAC÷—Æ×‘Ã4²²Ý]÷îpwÜÄ¨‚±_t_þÒW8¸.óz<Ê[®ºKzYˆFM².§¢¼AURúÈ X8ê\n[­ƒ›ÃqvÞÇ_äÇ¢Àš%õã‘ÀB«œž;àóx… \0¤(ø‘tHÑ•æ¦i^+cðèá¶B¦´ë–µî+_‡›6.˜öoãÅ³îÕ}¸ß’É¨l95¤Ù÷`—«â4*…cÖÑ;dåAÒÝV‹Yÿ=M†\'²p”ôîb_33ÆüØr·#Ôb²;Q7^{í5w_·4q1DèµœÜé_€”|îä#*ûü»iÈÄÆ†ÜºÕK]=VYãÖxÅîJDh#›áýÕV•!òï7›û.gVm4¬åðÓ(eE«hmpgNÁBˆé`xÊ³ëæu«Ý²jœ„!¸žÇ=Z¯]Ì«—Õa³Tg@xë¥¤Ã\nÈ},xðº)…<ocšé,×ÀºžÂiÄ´Á@	ì2é|5ÐÃ¦R\"J†6Ï)¬†•g¯OÏ!0N4dYÊ®\'Á®4œÈÑeÀ\"Hsdœ,x²¤! a=1î_€®òSHN@hŸ”?z+[Ý\\½>a¾F’‚Üìô¡‰?@&:)“qF}R \'8ièµVø³È¬±\'°ªI<KV70Ðež€ó”šV•÷„ÉåÀ${¢jHÚf3j€Kdéo‡‡ÒXÞÄvU*£Hà<›zJQ eMšØÀ5FV­*‡úzÜ`~ž[Ça¶cë&[{8GË1D\'ÌÏä3ñíýïâQ’vµvâ›ˆ>º²“‰r£éìÜ±Å½üònwñ,kÌrU]5…6R¡k²Y7¡ô\"nœàÕ\\Qz$\n„:g®þxK@±±ŠÌÒÀ2¹Uv½Äí“ôS{4ƒï¯ÔC¦ÀÇŽƒ¸Í$ÀÌ|wÏíËÜC÷cæ>NÃë›§­`vïÝwg@	b­ˆØ®êÌ—\"\'s­[!ÈÐ‹kÌ‰à’ ÈÍ±v\'ñŸÔXÔÇ¢ÀœŠJÚ´-ƒà³`N¡0ÖM²J÷ù5¹ŠÑw\0Ö:al“±¨èbž<yÒÝ\\]s;¯¿ÎíÙóœ;|ðUÀd$ˆÞ¹7Sd=\0é)ð4\'CØ[:÷C€´žOêO»©™ºš¥A¾\0h¾Š1‚–—¹”iº›lª%Õ¤ñD?wÝºž]žQdß®)]Ë QØ¾œ­tŸü…‚‡)KðÈ­×\\UœoeoAîdl¤õüyñå–Ã?+ SÈ&(ìÜÉ tJÉ	N>nñ:å8Ùtw\\·ÉÝzÛMtUÉz¡·(¸W0^²\"¿ë¨ñ$°©êkë0-1üD ™t-³Dn¿u\'6ûl¾~®+Ò5Äæý*H%‰×^¶rí5”TÌ¨$Y˜Ï7Õ‹‚N5A}ùÒ4œ/5m@¤tPé\0«¨(pwÜ~=c Ÿ0Le]>„Ì\\o¸yXÙWV”º‡¼›ëAÖìé=5÷Á\0&eŸz\'ÊJÙ`^ÛÏð ñý”áy~8j-¡úaˆ”tä\nhzMÆW4>#Uôª9:¢Sãý(d‚Xô¯%¯\'`åXð^ŒÍ›0t8±‘¤J¶0TÅRÏœ_ø]G=·*ªVÐ«<^¹¼ÞÊÙl°:Æ^ÛúPÆ$òj@ª†Yì·Ìü#L@È„ê´É`¶}ä±~zá›Î™$ˆw AFŽf¼¼Æª†qµö£“¯ëÙÂ°ö$ƒÖÛ¾Î‘De´PÔÀ¹kß««*Z\0¾ ˜JZ*Y›ÃíTöª&,r­‡ÇµMT˜Š{Ti¶ot‹‰×g?cˆl7HæWí«¸óZ¾ç¶’744¸o|íëd‡?ïn¿}	A°Þç¯RaÝOòÞ»+íÏŸjž¦ÆÛ’ûaÕ™Ÿr½hjïd’dIü®2/œ\085+È\"?%\0bZ—:ÕÕU@™¥»Á\"#‹àfÉ>Èë9m°ðù®HÃýðžÄ#{þÙõî¾\nÜ\'?ñ.\\. ßvfOœ<¾žÓðe€Ïm…ióÍ»8ZTð3èq?ÒýTÊÁyNte½=]<×6·iD[™Lñ7‰ÅöÝz.@ô&<Û’óÙmæCbÍ”\0\0V•x£3½/•™*A°ˆ.\\9Ó¼ÜUÖñÓ‚ñì¶XÌlÜõµxáa`™”­IÃþèSX—53s™‹G¬Öƒþ‡ý¾Àï¥¸!/ãcšR+Æâ—O¡^òð0¬1 ukWá`\\å|5×ê\'ª\n|×½á8AË\0¯Œ{|›…46A‰GPÖë–{v$Ü”,®³2‹,èk¤ç8D4šËÈÆJ÷ð{ï´¬®]_;åg¿Ud¦’\0Yã>@ÙŸÁ7\"û.óLñ^ÐU@ä+	½ôÚù]WÙÅ©Mà‰W$pîIÒãRZó%H¦ÖL‹0¥3•cV>‹Å\\*of°:¾3P€ŒŽ\'#Þ„àÞ{I˜_Œ :Ã)j¹Ž@b;˜ý–š,ÒÀ¢Ð¡´ÍgàË4]{¨\nÔòã¼ õŒ:jäÅ>B`h:è”õõeºbæxÔ“ÕU`náÞ)ð)ä3TFYlq!Ò¾ÈJ‚¶xŠ–ˆÙõ’4<H\0ÞQoA\0ú°µÂzÊ„ÎÅ06v ÛªK¦òÒWü}ï¸H\\_;ûÕdÜ¿j-ˆ=k¬e€ú<‡GÇQ9,	Ë°tÍfÆ÷ ŠÄ2î’x±üLEEÞ‹îÑüGªƒGÜÃ¯¡rƒo[H†àÒí½ð£(ªö€Ý·ÈCÄ®Ô%%,!AcTiPmD”ŽczÁ!>Ë¨¹§üó€­M¾ñæË©é¤nZ{it2åÔ‘ê×\0¯[ê—®Ó2oi=a•7µ¸gŸ}“Í2KÃ¡!ý0[$.àj2²Ï~ú×ÜÆukMvvÃ7Ú\\Yum_|ñ5€è»I?<¹g$m$FÈ½e‰59ºu‡J$N\"œ_Y%yŽÒB|Def*¯fø~Ì³ã¡#ëaM‰J@«¬Bi\0Ÿwd?õgÀúŠ4¢¡ð·€’ÜfÈNI*lU«ÜÑïÏQBÅ¥p …º¢&üô4°›y\"¨c‹AïE¿c˜ýuž”!¨1MQ×É{×C€\nŸHÂÊŒÄÛ#«Ì“xxºÏDyÄnS&$!¾æÉ^Æ	vâ{	œÖ! ÌW<7]—Þ[WO3!	£[››‘Jæ:8FYäÖö¶‹fO?q€î› ú¯÷bu˜²>ewÞ›ËˆÊV)‰#&MÒMàa…rimFØÖ<§‰Þã$eÀ…‹G¹¦óF ŽsDw±@Ã¦Öddbÿ¿þxVöW˜J*uml‚]Â@ÁPk*‡¬¯’¶£í5¥¿Êß|èBZ?\"Aë°¥¡&úJˆk0CjØÜÔKG´ÝÖ]kUX¨ vOÀÕvâdÏÉð‚^ò³^£X1î…Vš<+uû•”§À$¬Å!æZ\nz˜%Ôy¡aÜ!^·XžôÔó`|ë#É”H~ÝìÑÌeÈ£Ž%Vß*öÕk¹•!R?ù¦#n¤¿ÙG¶·Q<É¡F ž¢yG\"sxÃìW1#‡J†ÊêøñG4º}¯¼JskL°Â‚`ö‚z‚ªRÁErp Z‡²gz(4†ÿyb€¼9xL³Yé)sâÿ…Ù\" “wâxzàÀc•aú8¦ð¥/¤»>ò\0§¹ßÕ×¤36†=vêµ%|¼ÿÊ½lo¦ÑÐà^;ðªq±Âhfçt”f%6¹‘°µ§ö¢ÿ 4¹ŠÌQª…5£ƒ´[@¬ù¶qêû(\'2åRšxÈßO‹.¨¹°|ÍÇ*ÓMÒ€w±âC¢<¨šç{!LÊYébûkÕrBN£Q·UÝ.›RÈË,5L‡r†›ÍkH¦á\"]Ëº_FBzd0‰Œ\"ÑþÛŒA‰P0>1YnÝJ¸Õkk,k§JÍ&Qn„áu@Êo\'8&JL[ôªØ¤ÏN–¢€hdœk¢2‹ëÑˆK2™\0ó±$‚\nÓ…R‚.3ÕÉ4]t§Ç\0úuEìÎÉ¸IléÓ!MŒt»±ÖFûÞ¨©\'èÖÃ‘³`§ÀgÈ¯úì5\"#ÞF#h]1q%¨$«Ô¾>¶B!³’+‹L0ÒÁjU¦\nó“ÃËtt\0õÒµ	h(n†u™†¾V´•+¯2,‘Dé§×!%NŠêYšZ—AR.¸U“f„`ž‹êH‡Á|œì¬J÷@ñBÜ=½fÊókd¡ñU0-F­àgO|7™TpmÓ8	3ÜÀ)PÒÖêaÆ’ìñsucXœfÌHì`š|YMbøÅŸÿ9÷!¿ÏÀD9“l<$•M{{%ýN¬é«IÐVëZ+iL`€ž¹®ê{-ýºúž–¬!¡³\"ótysÝ]wßf^	ôã›\"«Aã~Æ=zÜ·Ö£öÐ0³múp´	Ò ÒükÍgV4ÎëÂÂ˜%‚Ÿ4yO^E1f*…³òþù¹Áè:”VNMtæ7ÍÌµScY!,2ƒS.ŒÉºm,¶9y¨ÉcÍ“I\'8›ÅÝÙÝèþár²œwwÞ}£»þXäK#¸’èbrÁˆMÊ\n?ŽÑåóîå}ÇÜl°‚L«pì•&Å(7#R›V:™Å\nóˆ¹}o­-õš*Ó˜ŽÎÅåÐ¹Ôîˆq³­,×)ª5ce®gÍ«$pï-=&L•Öñü.¶plÕƒmµÐùay*ûSzèOEÁ`3Jd‹5b¯-\'ÌˆM“¦Ùßyšß-bÃˆ®#ê‡F>ªƒ£v6,OÄk6{6×jÙ²5¸ä,KHÜ¼mâIe1–j„ádfK†#Ú¦×²¶î»€gÏô5… _VœcÎ(1¤_©Ó9J©­yÅ34Ä‘SwZ´)`?«ýìÂ9ÙiÉ&\nj:£úY¥ü•Ìª($[vŽh¹ýÁD&&šE¢–ñ§®£^×.ÖÞuÖOÈÀ„E*›ž&ÛW™ÌO¦0LEA\0)†Ã§lu‹û>4´Ãð;\'x!‚¥)°†š%W£bé€È–ÙÊ ôçßµ5K6¢¯bºÔ\'¤T\0¢ÒH#í\'òêþˆ -Ò¯î“\\Æ\'¡é¿Ë+ë-#UÀkke`×Nö\\ä®C+œx†€¥ë“MG>¹›\nB÷99æÕÏúéA‹®÷(ÃeÕ®î‡¨¬¾¤(â>úá÷º§þÚÇ¹ç2n%«’®MÙ¬|õl\\‚Ù_iOh$Á/&ep1•¡6üp¨kez/‘P¦;Ÿ‚`	£êÊ2Ý7o€ž¶É(bÉÃE×”¾SóÈq¯¾ºŸái²pá}$@ôé(@Üï<!ã¨n2ÀãQ„è„Ó2È ³h\\â\"ŠgO²*[µ#‰¸½hŸ®^?Õ?²0÷•ÍM¿ù§±¡3·”äÖ!»šuû…&×»ÕÍ¥ovýã®„Ži|3K& á¢Ïb˜Oçòîœf=Ðâ_¹r	_SnAsAµIV¬Óµ\0GÐÅî~í¼»Ô>äH¹Ì¢rä5inŒ9/ìƒo“à*òÝ¯ýÂÝí›¸‹¤ Ïÿà)77.çà~·zó——nó†z{ÿ`¾Fò}î¹çh6Ôºûî½RÙÛŒÇ¶Ñt¸ì>üÁ[ÝþÃ/¸§~ø¸»÷½w¹Ú%54CÖƒ‡›–5GMøŽ‚™H±ÉAãÞVf˜0~ý‘+þæj‹ôŠ4ðªbæÊHxVÒ_¼tÆ}áKÍZŸq¯¿úŠû›¿û+L`Þ¬#€Ø\nX™d7ƒýCØwÚÝxLÜ</È.P~EL«:k¸ªøpz¨’/_¸£?o’¬Z’¶Œ48ƒÈ¿Ê¡gÈ n¤ÈÜ¹ð&ÓÄ+“ËÿÖl‹{ŠF†¼h|¤2¢ÝÈ?.E„k<,Q-!øOò×ðhd©”…ŽwÀ¬ÏZfEºÂ\"dŒKêÝ7¿÷]7.L×Ï`+Ý‹,hC“À\"B=Å‘ƒGé÷ò!&èðV0Ûø³Ÿýœûð#Ÿ\0?Ø¿Ÿ€¸Ì­\\½ÑŒ*Òh‚¨afÈÓ8f·ÂA½†Â¾}Í;j~ôýy™X½úW¯šo£ßÒkZÂ,áÓ°ú‘‘ýíßþO²êL¾ƒ÷#Ð«îOÿòQwäµÓ0VC‡ÊwÍÌ”ÆË²˜u=‰AFˆÓYs¥EÙQ³\' ª@&!$$1‚X|5ŸÌ\0%kŒë3&?ü^„@8/5->åî»i‹û­_þˆc¶˜¥r»aø!œX´/ØJ¥½Û†î™g_tßÅ,·¥¯ÍÔ©%ðA=Îf*†L þÉV—8í>õÉLwóMèˆc=³é™û™×ÿnÑºß=ôSJ×x²Åi‚ð‡ffRfêV­>ÿêqÆ‡\\äß´æU¯Ï\'·NÝ0¡œ0W$ÃÐ™Zœ,1Âf‘³Æ	ÆÎÌŽ™ø|Ð½ñ}QgJ ÇÚÍîù½ÝKûÈQ™?Î¨ÄÀõ0$ÕFæ¬®^Yå6`ÈyÞãC\'G’ö¼êêV®r¥uê:÷Ê+G\\<·‹mÝ.€}œTìÜñÔîØÉVÌU÷°9²²ŠÜg?ó¸Ê\'ØEÙø8Ó­ŒQ*F\"žš²0ï4M7órIÚÃ0±|É{õN#.µÔFpäÔÏdd†8nt÷Òm<|t¯ýzfÂŒR¸–ÂìF94R9 „Á˜­ÓæÂ™xZoÎÔªT•èC¨¬°âl†!feÄ:úÌ¹$UL³eG&ÚäÍ;nqÙeUnßk¯º¨¯£Úc\\&™LµFj\n»šQ{ïÃù5\nž&sV+Íìt9Þò9ùU}}N@—:û¢ç™ ¾Û,.ÓÖz‚»§4|–70ŠÎ8öƒïý€ûsp´9ÜÈ’	Ü~„|šoqLkg¡	š%õ™¤»0*½6Š›aº÷yßúÍO¸C‡á÷3¾r‚Æ¿?©!Wà°’«E(g½žéµWOâ»ÖO$Ëñ$>›–É\09Ž8:³QëÖn…=p“Y†é!öj¬»ê«‹]ÓYJa:ñ>²Õ´ÊX€æX:]·&Î€\'«.® ÅYÍÎ²\'çÌ¬D.Íž[“eË	@5àbÊÊâl·sûF:ÔàÔ=“nïKO»Ëí(¦frÑ¶W²¿c\n¸ít±WÕC3+§sþ1öyž™‡±ùê¢ 1	/T:fñMiÑ¹0•@VµUˆN?k’Ÿé¸v(’¢Õ²øE€/ïÞ»}[î$¤Vz\n)AÉÈ\"œš³`ê8J!ä4› =K8.¿œvy¸‰¬À]c5mªkJ\0KG™ñú*\n‹2÷È‡„0Ì©HL€Ï/Ns7ï¬Å^¼Gân×zò,‘Çhæ—ÉEVs’¾\"éÙs94›Xô/‚X¬’é[O>ë:pa9Çl^’Ý{÷Y\0Pl¤`évYr„9azÕÒ•$†áÃ-Å˜ ­uÐý§ßÿï€äƒ¼/©\"6aL24YØûTW_	€0mÓñdýle×hÏ%¾ûÎPîÁÈõà.Å¢è÷þíoB™©sO?óÚÉŠÉød¨ª¹êÈ¦Ð$&BÂç3ÌÓÊ4YõË¯Í¤i#ÿBé8	”Q’(:Qa|4 ÄEëž\0´¦$Íœw2Ê‚ægÜ\0ÇeŒN·õÐ9w•P€¦S3Ù`(8Yæu/À¿&€ÂÔS~^ÓÈüƒ\'eïÔÃæ~ô³_4á§d,êpçÒ&¨‰Æ/c¼ ºÇ4%_&ª™t“‰_”ÓMŽA5è“Å7¤¤éí&pP~„ÇíE²‹mÑ¬  \0¹.CÃÅp\"Ëí¼áÆZ¸ÏÿÞ¿wÝL{·ƒƒ×2)>HƒâS	2o¯Ý°ï\0q{ÿÉ,1Ù¨ò²C)‰d%—KôŸÿË˜Y„p¶ÞnÀl+î-C»ˆ†òjÌ†³È»6ÿB™H˜,û-LÀ’9ë:z†¸”Ì”·z}žÍ˜ghšœÉ!žž}_óXÒ3ó\\ŽJZ©/íÞïþéÑ¯ƒùâØÅØ\0]xã\\Ë\n\"n/.1Ëë«¡Gíp7Þ´Â}ðýï!9ÓÚÍºÐÐ¦á¥Â[…ä®M&r·F!ßÕp°p²¸¸¶=#ù¢ãº[‹\0#YS¯¿v8Z\nÈu(¨×2¾tmk!„†ÈÎHµÅSRi#…‡*7^ç>üsïu›7y²tÝ¼k‹5/üNéußúÖ·`Ç\0ËÜçÿý¯2C“€µkÝ	dPr®µ_äÆË²JàáYL¿}Cdql®jÜ¶;™q›á:À#^?~Òµµµ™ût%ƒ»URš²€à`þs¼9wH¾¥Ÿ!y°ù¼uK–“æãS2`Í‚ù95.„i±ééÚÊÍóuId	6T‹KŸõ½D¨ÀÅ®þ,òZ_·#œŸï…“Ð‰ühÊÐÔ$MJ[ùjØPeU†gmRš¯,†le†ç¬då”…ESÅ$ª\na–Â;\'80Äã›#+ìOÅànQBÏÃoœƒË)E·†Œ»:¼\0£\\ó³¾NÕd)ð:‡ºS±òR\"¿;KGVó<¢˜.€cú)G\'Pvhº€·€AîŸHHÈd\04lK\"z*ùÔM Ä¯+Ã›qpbÀ9uÎ“©eå¸uë7ÑÈwgNº×wïáP%ØË†Båó08±îs”¨,ãQÀ~e+EÌv\\’¼)ªñðt–…à]ÊA;ÆëuåÃƒ5®uŸRH®q_¯ü|b]xfYo<¼Š:ÎÚà€`íc>Á0ª<|!uxÊÉZ‹œÛ2iŽe‚QöuƒÇ¦Œ\0?xö‘r!~bVš¦ÊRˆÔëO/¶2]9`‹6.@ÖÖ!N:éµA-jÂh%Så“%s™pLZF„çŒñB„‰c*{Š	Òd‡#Hú6ç²/*MËÍ7çn?ÆTC€9¢AÏË¦ñD\0L±™AÁi¬Áú8!½¨ðæ›îìí…Kƒt\'p…‰dPÎ3ö1äo:W+Æ	Šç_A:ÎéVän¿ãfœ_¼¤¨±·\0Ú¬œ:C/„ìÝ»—ý°àç°ïÁî¾Áíº{6Hë\\öKûÝ˜@\'#èÜhµÖÈºÈ\0¦)2á¸ùÕâÇª±kßÇ¬[5=6o^îêê—Z	üÊË{,(óãLoÓMW)Ë€ë\"F<Ê\0mÏ-{,(k2Ê(|á¥	œ¦c–ì|^Éò¬üM”ÁÖHðÞ¶|»âP‹4y)d.3`yš‹›+_ZÙÌX—,]áŠ)Ï›±ª/(®pµõ«m®ÇÑc§ÌˆvÍ–ídÓd,tZ5û7Fö<Gv^VNYë_%pÙoÏ™jžY—M@#ó‰ÊyªÕÞkï© ²Â=p½Û}|Ð}ã[ñ·èª“=¦áÛaÑÏðÞ£db¹>/ü»Ÿµ‡^cCvÞ&Låõ*341‡‰MjSf\"lLµ„\0]ZXNöQæÈ&e‡NÄ{árÿQ¡hæI.sŒK1Õ›©YîNGŽ2|>JÕ:$¥%YîÒ‹ï·ne}ÝºõA:¹Hgãk˜S\nA°ˆ\0šjGM¥L(]A(LÊ^Bþl2QfïpŸ®YÜ{?Ÿ$…¿5‹ôh@s4«]ÿ`Ù3{&c2=~´¡§UR°uÛF šQwôpƒ ‹Ç¬ÔGR‹ãEˆûŒ¦ÌÉy&J77ƒëUˆ”TÍ”1Éuí!YkvfóxCÌ€¦ÈàæiæË~Qöís·ÜqŸë?¿ÜØÁØª8¤¥qL>|\\¯)F	33¥Ydæ\n€ª0”T5è‰-£„y~Ö—ŽLƒ´–‡érKŸÂîg>uhj¡ûâÛã\no:*~²,ZxúÜÙÔ¶ënè~&‘ERpY…x»ÍPN„s-íŸÂŠÈ¥yíÿBt©Ë–C›àñØ÷»¯~í‹d~~Jßº÷ÜYØ‚u\'À¢¢4@btXÕhP¼UC©ü8-ãt²KÙ´hæ…8TrƒÑ‚7LŒ›?Ç)§Ðc¤iÕ»ÜÂE\n|teÉˆÔ%ÎÉ1ò²åhüŒn¤Ü”ug¤–_U™ßG{Mä$8‘:¸\"ŽÊ5®Í›à¶y-Ze\n½BÎÕmKü÷T3Y{Ÿ“kñ~ÛUßç9‡SdÔI“hrˆ’Ž®2Ãßc”£¢Üä`>¹bõ:¬¬f˜‘»Ö-_µÚ:à½”Â1ºå×Ý°Óå %lj‹–ÇóÙK¿Ü²ãf·z†›ìCœ9OãˆæÇþ<3MðEôœ	lÞ/bWR6Q·­Þ]³&WF¥ÃŒÂô‘]Fø{óÜ¯(ø]?ç\07e”Ãb[,u€ßîaúÜÄõÒæP:Wã’j‚MÝÒUîÖnp¹Ü¿£Ç°Î:vÇJ>:Ú3(EÈ-sQ<‡]!¯kó¦ídµ®¸B–þR\"l¿þFŒhbñrÒP“ˆFÅXÁ›,UÙ\"µÌx­\'3–©…wëÞ|ß’ÿ6kxïÆ_ó³\0=<Ó{xÑPnÖ†ßGCb¼µ2We÷bèÇ5½ •&ÆŽíÕpFoåÀžr¯õ\"c”‰)™ûÌKGk>OOMyZ±l…/:{æspÚ\\Ö²t©d–1•U‰®½äª‚r¦éä¶ Õ™yÍ²]TIÎýÊ¯Ü57ã®þ>Lz[ÁeYCdá%˜/YRM‚Â˜	žNø£Hç>hpÒf‚y‡Ï/†ÂÜÀ\"’ö$Ù~FVáhAqUËÌ\\ÙÃâ?-\0^lj‹gdO2Ìe<Ê\"·ùY81‘°äSÔå•;T¿ð!0	ñ†	©r=sö8àó>N‰¸[¿q…ëÝ±ÕUU5ö1€ÝQ!NÎkh`è!ÅÂ›AÆœ14©*ádágƒ¡¬–=QI45MóŠõx=Hj/æ<qÃÖŸ,ŒfÈ²éŒÉEZ*YØëçÌŽ³SJ§íÖ§/ËNæ\0¯‚Ÿ>ôs8â˜‘€•À–é)ø%2@•ÁV6]Ý ùÑþŽŠˆfnäæ±!öà…uŠ+£ÉFÑçï©Vagå€¿ˆDFÖ3ÿlZê-z£T1\"ƒ‹€;ÊI,Ó2u¿IÚ)³±y‡HS‰t„™ è^ÉÄï\\‹3¦2Ì TYžç¹}MîÐéÎGI/¯£ãŒÑ¥txŽR‘ÃFð\0t¿Zùšì’ã¯µÜERNÌÖ†ïÏüÃ\0Ù]qäG.u¸u}4ÄÊyW“Ð &i2E¹áóÁt‡™bQîÏ”1¬ól\\…3|®¡8%%-ªÁ0œ­Æ%ÔÁ)e‘Ê`•âz¶\\’ÚA,0s5žû£ïà1\\#ƒ{7c€	.)kcèERU(êÔË”AÝy.·f\\iØ,\\CÞûÚJ÷ÊKX¦ah+wŸlÊ÷bŒf©\\ê´[¿y£û•O}\njO®{áùSÌž9ëaš)fÄ+P×U¼@]aÅ_)yèøâsÏ¿B–íCîv³CžŽ™H&ïµk“ËaŸææ&L‚ZXTÊ>MG1âÜÅ¦³<¿2A¯­œÃ—¢.úÕkEM%ø‘œÒ¾œš))ïýç¾ÿÿ±ppï¯Ž–„Ó†)£¦dÉ¢Ùñÿ°÷pv^ç¹ï;ÌÌ˜Y²À Ëì˜cµ¦)·§mÚ{Î)ã)„NÓ€;‰c¶e”e‹™iÃÌŒ{fÏÌý?ëÛ[–·MÓÇvïÎo2ÖÀž½¿o­w½ð@ö)‡å%\'Ñˆ¢(¹úûè°¨XcÎ&F6“…ydld@’Ô~à-ÐlòlaÊ‚%K­°Ìc;vÒÜ®NzxJ·…	œpSØ€˜³äãä¤t¢?ÅŒ„V1Ó]¼AÔhdÃ•Z=O``Y&:Ü —:“ìJ‰±1T4Ô½&ËPÆ.<c\"_áDWAAœ‚µ£t¹%þÎÝñïd=ïÞûkÂPáC”CŸeô.ŠZ?²xÒì}—ÁêÄ>O¯@¼ee±ïöQâgæ&;@³‚P&e€Ý@F†˜û2v`/Q#Iô;kî|Ë\"%¬Ã3šébRâ–Ù™É¶úº¬‹ ±ÁËZöÆ)ÇëðMIbRîŸˆÎóF0øð‘jâïJ«IÐÔT©û“Ÿc4¨}’\0àØ$Êê\\vòÎ”U¼®×Âã9Üî¼åJ1°¦4ìã³ÜFkÝM•A×Ê{eƒüÝqaåxŠÄTYœJ*Â©ôèÔ ÚIôrPÈT>%ê…MqDñ‹`#«wÃ`ÞÅO»Þý“Á¾áO¬àZ™tÁG~Úþ‰~7“JøFÙHkjÛKF˜–A?›r8…á|Á¦þ¥3³œŠMC]-ë”-]>Û¶ÜLŠßÙ¶ ;L’e+Û¡µÎ&AJäžZŽÖ±÷Pðî&»/A¦-™JGCµ=÷ÜØ\'4Úõ[6Ùê•ùrÍÙ9 /b~É™Eg¹+â(£|<|‚ácÄ_±u‚ÜÏ)öê è”¤	Ú5²Csh|dzd8¥—t÷}züÜ2@½þ™³´wô4#9?ì›‰ME/,+#Ê*1Ÿ‰BèAe¤ÔK&IÏÕGêèè²Ã‡ÏÙýåó0ú$¼ÓLw2lÚ´Á?‰“ŠBsÓóÝâu¢‘lè·ÀB½±í52$SÜ¤lúH\'Ãhð‡3É®m0ëJz<ÃöüÖívýÆ5”LGœV4Ö”«5¶ `|\n…™Lp}möæî3.Ë\\½f%²Þuˆv¶ë¯[à&oZ,ºÑ*/œÊÿ“çG8ràbd8ÚŸËþß–À\n×º¿eæ¸¯ÿæßY	<§®›|HôôÚ¤~JÌœœ<—É>\\s˜üŒg;s‰‚f1ù.++c02l¯¿ú\n:mØÞo@ï—9ßmøºªi»€TW9“åK8äõãþU®® 3ÑY‹&Sö®X¾Èõtÿé¯ÿ\'Æ=7[^F´ƒ™³{×[‹™QPŒi:\nØ6’¿–\0¾ó>V\0sTÙ¥,­JñL×C€îw~S¯ÓcYëû>\'_Ìï:Q…Ik†¿\\¾|µ~nûK¥¬M@&?5Á Ô.0Ü:UÅD8¬Ì*Ž´ª‘5«®b*Ÿ¯’ÃÏÒÈ/pAøÕí‡¸×ó¬8ƒ\". ª	 º¶ò¾UG–²•³ª	iì½Îï§Û¿ASX]‚@	|ù`ÔšP›EšŽL¹é³I²LªJID”ž¹pÆŠù{t3aP#àÈ¯\0‘Ðaóæ•Ø—¿|;Žu]8÷=O¶çy?V.ï’=øÈ}\03m×ÿøçù1-‡¾ªOMŸ>;m a¹×Æe3ŠÉñ¾}ûìà¡½–——\nÌµ°—’±>-¤›dýÚ—òÛA¥üÈ±³öèž¥òÈf­sÐbÂ…×ŒÆFÓd–~œ#£ÀÐæ0Àµ06>’’Ÿ]YSßÁñýþ<~®°£{¨?#*¾õ“á°ðéŒxJ²ôôÐöœ\0”o±0z(½bÁÔ²€Ý)¼vW­™Gó7Ä¼÷f—ÝéQ	Ìe7˜=‰b®\\q’A\0y)U^Û¶ÇB¡k#+‘Îš|ãà³¦Ø„*Ù‚àY!ðeZ=2›žØéÓUÖ\\Weƒ”ëÖ®Bœ´ÌÎo°­/¾LIWÏM£¹Í&8¸w—óBÈeâ,B¼„=Ùl‹«{8ò¾R+}VßQ‘YÞ‰ê\n°+ƒœ[ë\0xyò3Üp•Pô¨‡$*%Œhpcp”y»Ž÷\\__OÖç•Œ’0Z½j›vÆs7Õ7ÙßþÅß‚1ëeˆ4ßIƒÉ•«£¹ÖŽ8nÿúOÕLÍ)óÙkÏ³™s2»JµM5¶ã•gœŽàüOR!²+rI.<ÙøÍ MËìÄ® âÚ\'Úú§.‚®Apî¸` ûi>ûyÿ‘˜¶ƒ®€ñCõ0Ùg£)!`Õ ËeÆP)°wÄÙ^°¤¸ØEÒã,Bž¬xÞ\"«×ù£ç¶ZsbÜKI±w\"á$J`Èä\nznP4Â·+¯?æÌ·\\+#øšÆ„%(\nán½‚º&Æu`nhØ!µiåXŸ`€0Œ,ýÀ`7=çn(f‘ˆø	lç¬®º†Jf\n•¢h*•FÛ¹³Ö6n*A²*ŸïŸ´¯£øL˜Ú24³í,RVLö=ia7bFìÚê°O9 ½Sübç_¬6•àeÈ¨!ö/ßx”>0z¨â¿K\'QÂ§VÖ4ÓfÈ Ø±o8¸hÌð\\L€5Æ’ô\'›ƒ3\"œµB<Àd¬?· ìlDÜœÞŸa7üL¿òs€ô\\†§Â#9°éÃSNŠÌ`aÆÅ`)8Ú@—ôžòBT¡©©Düp[Èäv9È[®‚çZâ¤ðO­±\'~øcÛºu+|Ê-ÜŽXd¾NXwõXŽÓ°0ÂéÇI…XKRžš\"È$„,OÁA6‰eKfYoK-Rîu¶bþLä{–Y^V™TŸäe¡ØK°ãç4ñK GÃ™™2:âÆÂ¢É½ Jç½½ÈòÜgeº¬úo-$¿÷Êò+ý?èþGwU˜=ÚýÎ7Y‹S2Nâà*Œcqo\\¿Ö•N\nH±°3r³2èáAÁ@çTÂI¦v–±XSôù@Z<ÉÿÍV#pv08=Å¹óæÛÊE°vøÞ’²|‹\'Ã`X «Íµx2úÞ¶hfº…³¬™ýAY#R’_îý»ƒB×CAN mxý§þ[ÁQßÿÏ}–ÀY¤Ø¾S(ëŒpø´±ñ†Ç[ÈBáÛ2Õ\naM´È‹—aÙdÐf-_kY…p¸ùs%óX®ù/˜GNO-.v-µD„›ó^ö¿3tÛÏ:°TjžÁà†¸uå‰Šº‚Üg•\'J«Q´H²ÚD…Èuu÷:nn|Ô< f™nÐ¥É~b‚ÌV¯!Ž°ÍÌ¦Ù×]s³«¬¾úíí(RCµsTÍð?õárK–µ¹D×£Ô÷#y&ÝÂ)–áY)á8y¯°d®å1 ú1lDõrã€WÅ@),F4¸Ö‡/V\n³°œÝXâªê¯®\\6¹8@úP†pÚë‰ŽMj\nØÌxçýyü\\`FfÞØÔ@C\'Ë o|2ÁxXNv\"Úm`–h.Á‘Ê¯S°—%ÏˆW^~ó”NÞ¨»«™›¢þËiýW¾	ó—^Ë™xsaXà\'ÎcTþŒ¡†ôcØõâcjSétw}\0¬z,_žméáÙôÿVXaÙ‹_Ÿ?#æîîdÒ’–D•ª-	¨Kž™i}û5G˜$›ˆEÄ=‚› ðùòÉÈxÞ±I‚YCpê÷_Ù@*Eû“¢Ç—Ö&·Wðˆ°†DóŠéyí‚QúEÉ€Nõ—W,,¤ÔË3FøämèUiñ*é™…ðD9Îä†òH82ýÃ\\<aÁÕ•áý¡=ÂÏKÊ _\n;|.e\"YL‰s¶ŽA¦ØljÃ:=@=C&/Û	ÀÀ×]PüÐOû™W=N/0„{	€YBÃ²Ód£×\"ò {”•¸®4í¨0aSì=UÁ…YdËçDÛu7.t¯?˜£ŽÁÑ5HŒQo“íJ÷Ž)ï^]Iw»¬¤ì”µÆ\0xåºpÁßÕÚÌÒû<!W6)ÜD>ÂÀx©·\'ëÎ©iŸ¥q¨é£ˆ¶‡”¡£B«?¨^:pKë˜°²¹”™¹|œ@š¦´åìœÝèÂùðéQa	¬aV·È\0eK±ùšõa1QF}¨¶ºi»XÃi$©ÉÏ˜ÛŠýÁp¨8—¶åÖ–N‚2^zñ¡ $¦\';GHoí™§“GHóá·Â(NŽ¨mh_†ûóBëäç>8ÕUó»Ýqñ‰ýSÃ}¾Èˆ©ØDss­¶&([Dm•¾ÂÊõ*,ì«.5»¾ÕÍß«ÿ”ÈæJ2µÜ,-YoÃj­¸†+§ìñçß°­;Z=‹P¡Ë)d¾ÞÓ•­íd4\'Ÿ°«p@Ë(AVÉ#ƒü]<ˆâD•.¨ÀÒ?ÄÁcˆ)feý-éñ¹.w]*ÐÁŠ%xA/våÑ»?ñïà;ù‰ßþ)¿ ð²hnžŽž2‰–ª¼TÐDÙŸ^…äæb¸&£\0zC‰ðÊbs`uz©ŠEìq§s(Uia14Št‚<\'pžQ®‘€á0)ø$Jˆ9Žrz’È«¼Wå÷0™óÄÌ,<K0ÛuÍ>^P0#Öóó<—! ?åÛ¾ücjÀÒ_äˆ~œ†=ˆI4ÊëÖAÐLÿRŠ@´`¬p{uMƒí?tÔn¾æj{äcs-‹‹C‚ãîmC\'à\nTcÌœübÜ<©Ñ·ûu?ù*ß}ŸÚ÷œA ´»L¡;,¤ž,±©=û§¾¤.y_ÎÆºu=G©ã åî‹ž‘óÊe~ºêqDjW×ŸÖÁ­û®¯Ÿ&Áú‡2|Ÿ3Í’J—i*Ë¯) Ø#÷o´¹Å8npå…ë­ª²;×³øóœvåôÁ°«³Ÿ œ„xÉf[¿n>u	ðëÖÐÔC¶ˆ•›LÏBuä—Ü×8æï`\0Q‹r3E#ÃC3²êB¢ú~Ú«÷ÿÅÏý\\3@½ÀÉ©n2n¬Ç&ü#±iød #ŠÞ¡Ÿ:33Ÿ¬m’©ã08.Ø\0X%¸D„CóŽôë¿þ‡Pj–#Lðö\"#Ã§Ï‡@\'JKm&ãmFA¨ýÚ·X4ðÇ¹ø]}rZ:œ›Bäy`Òl+«««m>Ü_üSl)8kƒK½Y²øáNFžVÞßô1 A\nIÎpÎ3†¯ÉÉjZFîqåÐ\nºâßî¿Yš—#¥×GºâW<Ç®¦å.U–içµÐZäšú\0¾º—ÆŸÑF¬EP,«?‚@9îJ$ƒ«!Ž³žá¿¢¶ºD\nxÍ\"úk2¯ýEÐ’ã™Š¥†¡,ä$hv¡êAjƒrµš;§`.49Óô0J,GÝ•Xâå‡6#×\" þìv›;¾þ+žØÀ4°$AO¯#ŠÉ±@èšì*FÃBò³^ôw…™l®±ïÔL¾3í®•é|¤Ã5¾è³ §p”jQ4¥°Ç:÷JU…	M¢C¾ó?¿ÞÑÛ¼ƒ\n¾ÿàºy;c1B‰²àçUÞ\nët9X\\³E§;¯É)`\0uº<Åš“Z³husˆ;ˆ³!Ñ¾£³­Gœ‡Œ¸Èb|¨dV-S\"Â?\"rŸC¤ºÇŠ€å\'c±0‚Êa>6‹èïmqú~ûöÂðþ´õR…EÓÛ_´Xb¿¶ê†wh†\0¥n¯ÃÙòŽ8Sè\\]\0äÎHÉíÏš1óPïdòÀe5üg÷ç\0¤ì¦¶¯™DÖ(%žc6™fyDX;Mkz,²í~5V™›KÊh\0ù,L_V®\\d»}¥2%61U:ß±5˜\\[ºx$÷tûî×þš=¶rãõ¶âª™öà¬@ð3¯ì€¼>èx¨ãLÒ™žEÑïˆht½}@ZqZ-¬e)MOÒó‰ì«8¬iÙ€TjSˆèûzHì $à_êhn.Ã	f{ÁÏ®sÅ×u²õ•?«ßG·ÏõS–ñ¼—M9ˆˆ“4Ò>gP#[‚¢^¿˜\0Ñ(’%ÒÐ‡~\\6ŒÊ$ô;ú“RÓûq`c½Yþ;\n†€¤J|\0Š¡¸Ñ±d~\nÂÆ…Sþ€‘æ`©EUÃ(Ø¨@s†¤ðÐÉöÊß@™<œ4•ÛÉÿÙuë~ÞÉÓêº„Cd´,1[ÖÐ0@[t¼ùüB¨ÿG\0ÈGñÂàNËú´•× ÑI\0t™®ŒÈ5Ùåg\\¤NC€ðä³¼27(\\àÝtOêß{+×ñSß·à}¾rMÆ SH×K\"¸ÂÇêïÍ‹‚$\nŸD¸¿bÃÄp¹!›2GÞû˜î5a|±¼þa¿?;ªÑš™½¨÷\\D%HÕƒ_JÖÀ®5¤*BÙ³Ä‚£ùþ÷¿ûm;µ¯„öP¡Í(Î±¹³‘:£/¿x´O>®fÏuÜmÇAî«e2	xl\"HŒ&MdÞ“ÖPMå(èyÝ(0%ZA‰`b}TX˜&f¨ßÐÝÔÜ®ù¾=~î0»ü¯[ÆÛþp×t|ëšÉÑi v“)™é~K!K`ÂØˆgÞ$j0R.‰¤ÌïQª¸E3òíÆ›7¹à‡Â’=÷Ì‹öÝG¿…U‹ÝxÓu.kQ/°tÁ<û—o~ß¶î?jö÷_±Y³ã™t®°Ã§ÏƒWët+qP…r—¶x0•ŠšF+<_lmp‹“Ã-\'Uˆô©µek0[oáf 1WX˜c~ŽS-Õðd:é\ná¿úÈr$ãäé\\Y«ÕeU`ö¹Ü‚}¢à)Eùã2Œ+ÿ}ÅSþÄ×¯ø9\\\\*@S\\Aœ\"J“€àzˆ„}Ï_JòòìPòŽÒ#‹cÓ@­†‡«Ó%\'k.}9ýšàÃ4‹ÚT•-c6Ž6ÍÈÎr¥ó$CIcµ’é]d²ºlåzGÔ²­D€¡™¬`2Œ O6!.*×Ô»Dp¯Ë3Þ~8­ºŸñ¡ç	…Ý¡„RN|.¢Ó	@ÙÇä: û0^½UzûHIÇQÐ”9©zÖ±¦fðÕ}M!“=ÙO\"PªÔÍ$·Ùa]Ñ¬{éF÷_JpÝ¿ƒŸ½òù½¿îý¼+¾;HLp²¼ LQ3Š“8‡þ?\"Ï‘0Ýc%{¬³A _’“Ïn7Ä`:(ù3q”Êó ©pÀzz§pUÌÍ›gÇ+ê­¦FKF±u› {tø?MyÉ|éï°<å˜®M{ôµ—GŠ±ÅXÉ.^²\0hU©•f!GFÀc^w½&çÞëVû%%9&k€çãoèý)É×°	\\cZb(ØEzõP£¾ÄÉ˜„th+©5èˆ[ó¾=~îPï¤¢3þìttæþÐÎ¢Ðé‹)¥%¡¶¤0nS«TRÿ†ëîSFˆÂEÏhƒuÕÚœ%¿y<ñÄãöÜS¯²HQ¤àÆž;Óa‡ŽVÛŠÕ+mÁµ›-rûNL¬OÛË»wby‹­[JŠEÅ7…%âŸ‹¶iþT(æÜ•­ƒÖðãW-“žXNì¤-;Óî½}­kìŸæ¹÷î?`§+ÎÙÍÃõ>\'Ç€WY{ëk_û¶¥CúÌÃ%(×äM[˜*Ÿ“hwwõÑAè’t\'µ†€ÞÞF	>·è¯–xS¾·¡ï\nÿÞRÐ‰-3\"X5ò˜m©\0Ú4(^¦}ûÑWmï¾]¯§T¼xñR»ã6ôyÎ]§›Õž]o‚¹üØ¹…Î+¥µ{ÌžæY‡tôDŸÚŸýÜ§¢åÑ\'_vŽe¥ø&¿z¦Æ^¨²7ÜjÇaüè•=ž/l\nÏÓ~ Ô·ƒ¦DžãW@4@¹’dýO¶~ºõ¯04\\%D~½d>!L³tQAh 4`X‡Á(=aõ\n5ÕíÆ‹#¯Ý°­{ZíéÃ6…[àõˆpÜ[„^ô×‚RÒe~ò$&%ç:ô`Ï´¹2¤P8ãÍ–.ƒê\0Î3x^þÈxC¡û¬wëþ-Ð·ƒlM8Gw)¼ êDeaxãÄÀXÑPilÓ(ï3‰Iµâåá“U¶KÅê*<x_ÝnÕ¶lÞÍ()é‘×ñÄ¥Z{}×^xØ”Ócv¾ŠÞ\\ÎJDTÉÌ8,Ä¦™4…×h\\ªÚà%Ç$ðì,’Ér(-6p|ÛuØßd/î*fW]7Ÿ¾|¢-³ØÖ,RSÉë3Jfm„0ü_K²k‘Ùdˆñ@gŽà½5`%I¡Lå“aõ›?6»³Ï[?ÞÜ=¹|áÿú¯öD~ºÅø©÷%\0Œ\'ôG†\'Ÿ›œîèñw¸Æ9fv\"ŒiLe»ãu\'sßÑÞÝß\n@9ß¨ÅýmÅg7¸Cžl#Rn$ëÍâœœ¬°#§ÎÛ³Û³Ð¬¹¾¢™žQÆî¾€Á4Ã(Ó²x¦¹óV.°öÇa, å]3‚EÓç3”Ùínb­ÜUpK<ßhí*äÓ³Ô6–Ô””-Ôks%	}“,wÕó(	H#ð7òÌz¼E~Y-ÄÛÞÿGL‘ÀI ÃJÀx\\}	šª @Á…ŒuÌ®½þf7)¶±Žëw©yÄ*Î!$[uÉR	ðŒ_¬Àx©¶ÞÚAœ— :]LŸôÔ™ÓLÙ»¡·ÕY¬‰£g«-(Eá|ðt–ÛkÇ«mìdUÕ4ÇCä‘ù—…PJ*/Æ)»á³Èð|ÓJßÞ‘þôëW¡\"`£È5ÂI-–æï8>-,Ê9a%¥(|äˆð¢ÀyJÓ)‰#àq‡Æ¹ûì†9ê^ðëêuÊ©N–@B$û%ŠdA7šÖŠ3šÇ.ÓÙxºGðð\n¾‡`¶ìêëWdðòÌ&À¼³~RÉ¡Ç>ðíDÝŒÝ ¨S?TÒZR×“g¡³‘¡ãXy®É©hõ0UâÒ{Im\nü8Ÿ9ij›iñ¤Z,§†®Që‘*;‹›VÏÆN±\\yqOðÜ>>²KÍ,›ëdÂ.^l„54FV—ÍŒ*U%í\'e¢Ï¿°\\i˜íË8k;)ËKG%¼×.€Ê˜‚w=jPø4FöÓ¨±Ã\n\09e9‰ˆ $kŒ‡ÅFöDMÇœœ¢;ùþ>Þ—\0¸aÙ—Fªÿ¬¾¼­e|h`i:ÂŒœÈQa\0:\"…äw÷K†IEþÌÙ*à\nù¶lÅZkEFë©{4›}ñò…¶–>*hx&€#p˜&“¬ê\\‹=3²•uˆšG¯¼†Y`ÒG“Í¡Jˆ€õ[4¦TÔogÎ*²Ñö0rù«/Y\'Ð	5Ï¥, °ú“ø¢t…Úò·ÙÊËË)×%«þŽf» 21Ñ`¡<Ñd—ñÔ–žH•¼,þíÈßqÏß½‰Þµ™®lÁ°zdwVŒ‚MTc;X„Äœ…í[ŠUdƒL5›š[®¡dÁ=’„t\'„¸–¢^Dñz€¡É†õ×`T_æt÷îß‡]A»ÅÑJô}*ÞÉóÂ¤•¤Ûvœ´Z¦ªÝHl‰N¥QK\nx\\)·xežWø:ûKï?ï¿¶/smÏü·kÇñµ+nŠ—À+k-†r.}JÚ¼N$A¦\'ªÔÊÐPàß\\S‚U×2Ž’2†ûªP,œ^ØÜSÇ” $&õí»÷îCëŸ`áÿÎ’?ìòèÊÌ_A\\×p‚CZ\"dõk5Ì“$~Rcbµ6·\0)k#ëpn‡¾”·õ Ö ¨„1ëQ¦UCüé°zýènJ‰IïÛµ ¨¼Â˜€ËEqD?ÐkW.³[o½Ñõ‡ÿù+Ob‚~µi\"kÈ4Y0Óãx~Gr]]¼-vöðyË!;•ÃÛ\0˜ÚðÈ&¾ºn2!mTxË>ä¯€Y(+AášHð%å¤uÆg•ó…§}4 nF~NYSèpÓ¥ÎÎÆ¨¸Ä‚¢hÝ>k MvÎðòàŽ©¦9À¹ÏQ{èžM¨àÎÀfrÚw$d,Î¢2~$±<ÿã×¬¥n\0|[>ƒŽTëníuOÚ€âë:ƒø¡ÜT±8D¿aŠÖ¼y;Š%	,¤öÞVNô•—	àÇM…ÆLYËR‹¾>l\neíl€¾ê•iQMÐ0“é™ðˆeGÓDW“YrE¡\nìøÀç÷Þÿæ¹÷áÁÃõ±Æhì#0@h€S[ÀíNãq²õcÔ¿ƒ¼BÆ\n; CÌå=Ì=ÇmŽ#G¡ë†!/@ÄJxõ™\npõRÏFò`{¶:2Èø|…”Šz442(â~µb®ir<¢	˜$Ð@t×Ä‘íß‘á	p¤‰£Q.0¾³+øo^‰÷ü†ª«¦ß\0Ýóò!ÃpeåNMš‡@LÊÜòÀ@å¤Yõ±Í=ï›ÖÄöcéYº \"D™lu30èjb½Aq¯É²AH*‚€è‡_,@ö˜±_ýAÑIz]Æ^yð)*{0…Ø×ßîY@Àd–U\"j½HHD=à…ôÁÍ^@k¨ÂZ›Y›`ayIÂ8ÏÆ¡-~fjS»]¨^F C--!œ/ëãC#TÖÎìysì¦-×ØÒrz»$¸iÈÑÅEÀZðSÑ€‘\'c¡|ÑÊ±ðöœ ›.ÖÑ&TÕ<m„PèçKTXpè\'èÉ#€™Ž&gJ31~ë‰n\0mÝ’–ö¥÷EðÊ…ô_;~ÿ3ku2¡72<åbˆíÓS#‰éYál®(;u´—þ7,:ÁâCÉœÂi¢÷„\"æÙdßytŸ­_³ÖæA€3häiÄ¹h‡öž¶¡>?rÜôêh|õ!B0ÍbŽFÄO§wt-÷Ê|HœW¢†Ø‘£\'mfv´³n”ä‚yèÔ)àòôËœ~‹¢Â‰%EÉÀþ÷ö-VÏ¥!M*Zs==Ü;’¦ŸÑæP™Ž°[ï\0/c¿®„‰³ƒÀ\0ÅýâýÂ` 	þ.«<‰ÍÜG+½Å˜8©Ô†£-\0JdÙÄ9Ñ¹ïÍ•ã0a.pSþí³U2É}L}Ù¤áöÙD4³•Õu!‚àãº)cLe’*¸ê·¿÷˜S\\A(Ðõ	IéãWLœH	 ˜•¶¸¬Ìézy2OúŸgÍÈüÑ‹^ÿ™•tùg9¥w?‚ÏÌ0ÝôÖk(¸V\\ @\n¾T—‘mB#ï+ÓŸ­u\0 7eæÊÙ3QÊf8ÀG$Ï8zWQd5b@¤U¾+øDqŸG‘æše½÷›xWFe–H“Z³÷þ¯¤î¿£‡³¤O81)ˆ˜w-uÇ¹îñM#/\\2ÇÐ±w•ç+à£C-tf•ç¹¡Iý…†çX7ìgZ*EÜ?•ƒÑH‚–ÖC\"•ÏºUËmñ|4ù½ýú3v©â¥,÷Ÿ–ÀûŸWVN ±ªŠƒŽa\"Þ}8´§´Þ•ùs\"\n%€t8¦G!Pç&ÇÛIRú­ G~%²_íUõÑ?ä9>9èëú™Áñ—Þ·\0ØÒ401W•—Þ86ÜZ–²`q†½v~.`ç°I¦ÀRŠEò*,kH„&!uØ_ÿí×íÐúÓ¶fÙFgW¨®o¤ËN_8ˆTþÂL˜%‚YZ/×°—)ò”\\×PÆˆ§«á»ž2a„F¶¦fZh²æŸhç/T[nâLté\0½²ñƒKpÔ)çŒerÎi²4‚¦¹ŸÒ®Ç´J§ðe*ïàà“1áZFjßFinKjù	«ºˆ¤L~g	|EÿOù%˜³ËØ°`Yx9ëS&ìzCï¸á(BãJ#7õ‡œ™7™‰<!’“É-úE1ô~ARñ*q”ÕŠþ©/‹FAH‚þ-ÔŠ°sòÓ•’‡2B}]%v¬“Òg#:ù¤$â}vaÕ©ÌÙ< &NxÖc‡ÈwyÊñhµƒWÕëõyÁ/à=U`áù/<‚Ïìž\"©	–Ürì¸Ç)xÈ]nˆC²†¡QÂ“¼_ù@W·´[Sï9(ÛÌ¡÷Á Dåñ§‚³X 3R™¯D˜JyÍÈPÉO¦#!Q/€½×ûÐ×Aðrð{»Üõ`ðñî, ‡pA„¤Ü‰è¹’S,#öŠ¬UŒ›,Î·­ü“ƒ½†AZÃ’÷Rvßn£Ÿ×¡=A	;„(†|»d3ª~gFZª-\"T-sèD§m{åE÷wÕ¦˜yNY‰ÝÏÚOàøÒbmüüáQµ¯Pa¢Ç•ì<`°Âpm-Q]Ãh°¹<]LŒqg,‚›„j´qŽ²Ö©Ø´sãþH2•÷ÿñ¾ÀÒ÷Ov×}³6)§øLCEÍ<äXÖìy–žLzO66…z­ú!N)–ò)\"ŒÔŠ…ÙÓQc»v±‹g€*pâê6ŒùQh\"bÃ	Ç e‚ò6G6E3\n¬l^9RGH¯s‚?úƒÑl¥·]jÚÉ{³š€ˆ5X;ì\0´Á)oðæÙ%Å%.mx•XË×ùÂ2îë Ó#;…$yC#Dú¾nxÃrÌBtÄù*èøU/sÊjˆdwo¯èù¹´ä\nÄe(L%á1:Þ™¾k°ÓQB¦Ø%à%¹\0X‰¥¨¤¸Äh¥oŸTà~I§»<Zã	bÚÊöüò‹`¡z`×Š„›Ê9­r”–&@´çþpATwÿ¦¶2à1ÀjŠKJ­nœ@/>®´÷”å©,„9â—R…°yŠÀ^\næ^‡Ê>W1º;{¬·û‚ÿÉõF¢çåÃeGl/øoaU’+Ð†JïNˆ4\"µðŒÝò»¥·7Íu síÁÔ=,+<ž×Ï×jðŠÉË›‰õB¶cu1ÕTDw£CPýè#ö+ƒÓ	=¼G\0¼|\0\0—ôfõµÀ|–4x!”á—Á*HN˜5RâviÍòˆá†%	xÇ%v¥­‚¥JN·rxIZ}Â•Hæ¿[b  L\"\"ù²Hû&T‡­Ø9ôèdš”ÀõÈHGß’ß©f-‰+38ñ‚‰-œ[b×l(ÂÈZdù/[~Q^9è¶²5Æôï%u¦µ5-_vVÙ^„ðÒ<ÅYF*âƒ=cÓIQCcaÍæþþ{Mÿ“+â?ÿãï[\0ÔKKLÉïÛ7~vÇz”;²R³²à¬Ž[;}–Ñ©>î–8‰2’–ÿLSÂp}[‡(dvðMa¼¨Cx¬¤8z\\96\0.O™™LjŠðq]°l®m¼n#x%žÕÇÚ|õÍt\\j&pŒ4Þ\'Î\'7ÇÏß‚N\"YZbjš[Š|Ë6éCzrzˆÇÏôqŠ €1<šIÏmèÁyÀÚiö»¿÷[l”\'7/L–6Ÿófõ yoß™++}õ=ñ·+¡àÏ½ûçƒÏØk\nf²#¢ZŸ9SCŒ‹îß¢¸5Ö5\"•Eé+,%¶¢ü±8 ž’ù§1úC*çôt@²èËDÁùì¤±ÞŠâN‚ë=	â£©`=Ðj¦ÄRJ)(ˆ±;ï¼Û¾¹u¸@®•äg¨«ÕlÓTFMy.‹N/øiK)¸ëŸbÙxoL’ë?kþçâM ƒð¶§°÷lW\n‘ªU!€¯2A•ÓygÚÍ€j˜‰Ÿí#h²¯‰ýÔ	;FòïNL‘þ¹|¼Vè‡ÉŒ]ÒlRò\'‰BxÕëGÿTà}÷¾òßïúžð~ºTç/´cëIžõ¢`í½Ã-˜—¨žºˆH0V	¬Àçüùº~teh­!NZèÊhÇ@VÄ‘M\nB$Þ³øºn½zß\n£:$Çö>îy*¿D„!Õ[ÎË	±ßÿ;ìÀ±V{ò©ívøX-jãòƒ–æ§Üò¨8€!¡ÀÏP~Ží6îØ±qBý“ÃˆåÖFGôýT×ïçðCïk\0ŒHºipzø{­	I™íãS\"íE­¤ÜIbÄÖ/I‘dúX­Ò·Óh8\n¬6Œbc\0V¤!Œ¾É$4ºÑaÊ]ÔHRã2ìÚëÖØ5[®µÅK‘Ý÷ úÐÉ·íJ~7ÉõÀÜ4,lÚ(¥esRBŠU×5Ûƒw_Þ-ÜÎTÙÖ§³Áîf2ÉT;vø€mãuûâ¯þšm¾ö:û?ó;‚ÀãÌÂ2ì\nûë¿þ[ûâ¾îpYiø,DRfJ€AÃy.D\n¤«É£2JM£µ@E7rJÙâ\",‘D@÷²eÞ”TÁBR^zV#Ù0™Å{•­!\nî hmm±¿ûûã¶gï[H ­¥¼“¸¬ßž~òDœÛ	èçë¬¸0ßö<‡ºï«„Ã§\nsäÐaƒÎØ7\\4Ø‚eïûUtOp²_´üâ¼qKç2=ôÛC‡œ&\\dFŽ6ÁðÉEz6AœÃÙ¢<hßŽn^¡ª¡„SW	nt×–øÙšêzwŸ$ÞW5ívÎg®óú\n½ÊGuJ°Á§éY¦Ò`nç}÷R<ÉÄCeûö]öë¿ñ²¢d;w:…é(ýiÇf\"«{ÄÉà“Êµà2V¡d.î£¼ÖC\".\"éPïÙ¹­ñoW)ðÐP#))…ß\':”u”IK±ZZ­Y™ÂÇ€Á“¬ý¿þ«Ú>ìöÝhèœZ	ìe°¢í?ƒzú~wXEQ®oÛö:`þ:»þÖ; ­…Ø¶=‡íÀñót$GÀëÖA`O´t€î~z9ÃôÂÇFÒØê³ò¼dÖÃFúðù8Ã÷9ðî´‡\0GÊK}në./Ùí÷Ül«—åÚòeÛÿ}ô°}ã_ñÜ¦\'˜\0”­»¥C 4öV˜uq\'FõØº5ðùáíè8ÃûJŒHÊ>;–ö¾©¿¼{¥ý×VßÏ²nc³êóJTt·6l„È››kÙ©E“&û{(Q1J¡$‘\'e2	ñi,‚· F8­§ùNFV¬•ÏA	–‹ ã(Ä¢ãmåÑçªÆÀž²‹d+§Ï×X}ÎZøÇF\'f{˜CÏ5‰$…i-¾ª¶Ìi6æ=cÎ$ðn”pc¼†5«Vº˜¤aÃwÜCM¼î)kÆ-!.†Ê›Uí‚¿³µ˜œ¼?ÃeœdWÊ6SQR™HM8e#“ÊPú%Ž7 ¼œc@îÈS’VpËvÓTùAh¨­I}EWºò†%Ê)y~-äHZ\0ý>1Û™ÌMÛ5Wo°øÇb\nmye™Xg–80³ÜêÀqðº8À|Œs¢h\n&÷¾93¯67c`Ýfi%\0g \nq½¿4ËÅ	ûbe¥!FÇäym>Õµ²U$Ð¨ÿçxÒž·h «õ”uvcM‚ßŸ‡³zäO]ùY_P¹,ÛÐD²ýpƒvÜºù&ë¥/)ÿX¸’O=µ•ž)<pú¤:€Ctí´F™\"†kòQZJ´Ô/x‰Ä\\[PzÞ{tAÐ¥Šl9 8:â@ÙkÈ=oð©¼¬ÕÛs4žW°—)ØŽëÍ9ˆGpSC7ý3C˜w©{nY>„Ü£I¢èÿ‰5âãú’‰Ç%gÑÖ¡v\'ŽX‚2oJféü©,i½Æ£d>E_»i¹ƒÐÚÊŠ7Óã3ª›Ïò÷F¨|z@ä»¿wâx=fdoÐ\n¹h³ZžÝýà\nkëq –Š /ƒ¥8ä€Nùé—ÆFÂ´á <-Ÿo’‘)úü]±q©µ¾°TNÍ_Ìã}€ƒ#ýÑ±9gÇÃ›‡‡{g–ÇX)mª†­k´ƒé+¼ÀP$§$dÀ)w½Sªe£å‰š–ió–ÚºõmÑRš®¼m-˜Ÿ®hGáù¤¼{ê<‚§H³G±\0Ô¨Ž«ÉIïÆRú²ú!¤S—&šàW-™awÞq7«Èƒ4ÏääÍ÷\')ÅÓ õl¾z¥¡Ùë[Ï: glL‰u‹Z\n·®Ôb7¨Ï¥ \\C’BQô%TÉÆ¡^I¤Ÿ(ua	ýœÐìHöŠ#ê‘ñû¢ŽTúá¬F«¹œ@ß‰ (SR.ÏÃ 9ÉfìŒ«¬£±œìi2¸~;‹ùû-·.±?þ°ó‰f ”™6‘?·\nŒWVV\n¯#\0Ï\\sÂ)¤Àè»òøØÍ›ù[#x7qÝ ¬#µ”H_L×yÑ\\þ›‹Nœ‹Š1“ \'—/	vr3¤$†NWÌ)\"¸à¢ßÛØ<7áCâ§­!ß½ITã¾è¿½Ý†{»ÞtÅ¶³Ñô õjÔäµ%PÓ\"6Ênºý6[<;×¶¿rÌºZz)u“\0ˆ‹o­S–4òèi‰¹¡àÇä³ŠPÞá€ïcX‘(œÈÿZ÷PRþÞT5†8µ\0|¦Ç<4†	?«ƒ7«Ò²ûÖF$ƒ%áÿTò*+Õ`)×DÑ–æ^T.Q—»K¼dá<ü}‚i÷µ™áÖ­ž™PÕˆ•´kèÿu3ñ—‰A2”{4©õ%œm€‚ol<‡aRšvÔãºxjd–mÙ¼­’¹LÜo)¦›½ðÒöÖ®C¤Ñ®å¡•ÞÜ½®ú<kšUÖƒÄäºbÂáe÷7ÐfDä8Õ%/ˆD%õ¤æ”U5ôŒ¶/XñÐ{§ïïCL|ß`bÖÓC_‰ÉlˆŸ\n)Ëàº–äã¹šŠ×(wkb´:U2Pbô%8ý´ðÒó3ìæ¯³›oZdLá]¿CW­Ž€T	·÷ÙÈ1Ô¤`;ŒÐœBõ#5«MNX,dô-mº1²ˆœ-^+Ï¯lDeð‘gË/@ø”>–eºÉšn¸z)ÃŒCƒ`•“ÇšíµWßDi¹“ €Ù{t†8û\'¿¸(²=§Îìp“”õh©±¹†GàÈÒâïËÙÎ)¶pòFëµè—©b®“ï…xhWòlˆaº–ÔÄÏi®ìNÓ0àS¨óªüazë·šÚöÃ<ð¹Á¾üG·{o„§£Š!¥P?“öÌR÷ü\n?¹é\nâ÷ËEUƒ;•…êaë#˜]#èm©å©`2gZ\"*íÃÕp—Dý¸¦Hú7(œòZdûË—‰pø‹®ÓÏž‚\\PqG¯õrZù®†Û»¦Ã.äµá§<ŠŸÌÝ×o±»o\\nŽ4Ú¿ý}é&[É­ÆšY­S5‰á‘¾ =D>ÑÜ“9µa‘)Š›¨‰Ý(B/óÓÿrv	º¶ü¾¤yƒ §þ¨¶üzhÇ¤¥fS]@$ÈÅnËÜH•… $:SDˆ  ÔV·Úw¿óç:ûüçÖ¢I…‚¾£·âÔ*)ríÝ³Z /­ð\"0ÅrV®>RKŽN7¬çÈ ýá^è”Ø}ÊÐ«	=¿—^Ú¤ƒóuXÁ¢µÈßïftòÐA{e}_­Ö¬ØhK—¬wèÄñ\n«­ªu‰K4\'¹!š –€\nÌØ@‹¥äù`–à—\"„‰¸øœŽÄâ¹ÏÏ_DHýÅ=Þ÷\0è6]xzÃDhjýøDGWDhF~æ$âœdb€ËºÑ\n‹$kR™7Æé—Óº£ì8<í‹‹¼F4¬5;ˆ÷Ù—w!o¥µ‹â7æ1ñ™E´gJ&+ÌIÀ˜Â·‹Ä‚Œ \n§Ó+VCB.bˆ<ž«¸d§(ýæä/vL€AÄ~EÂ«I‘„;íñÇž´Ã‡Î¢ˆÁe‘Ngíq¯UÅ\'ùOVHeKÿ ª$,ð¤”X›;™u\'$ÃúšÎz¸4IyT:FMÕ/êc#^ºPo•ç9YÓi	\0¿aX$ƒõ˜´Ñ„“iv{kŸŠjÔBMë¦GºpÁ\\ÌægÂÞPéËä­³>+™\nQ¥µŸ†|@°‹%ëC,`|Ø•ÌšŽÑ(gúé4<På~$§²	¹‡©d™<OˆëPúIà4$Ä0ÂÏ¨×*>¿¦\'JQ®äx#ðÀ¢wAñŠ ùŸÙ>/¹†é· ËÂÝÃË:?ùöp„PÎtã]v=¸·‡o¿ÁúÇìu*-)?[zÐ˜o¹÷@oÏÉÂó7Ã¸Ñc»pÊ<eà>IR8*Ÿ5Åe²Æ)	Érø1˜SkB¿ç}¨ÿçA±„—SàŠàÀv	oâÔø¡d—¡ôv\'Åì!°B±$jméþ*{‹‹MµÊ‹MöÔ_Di†-_‘å¸ß}#S”¢°ˆÕ„U°Ãº643(Ä%/šà¦Ã_êÎ“îúˆ¡¡žfÐéc(¡Ÿá[UÈÌcÝíØ}Ù*ÑQQ‘éî²VTÔE6X½l¹Ýuï#®¥RY5j;Þ8\ný´ß’Óf2%W²Á ’µÄ-Ú†(c¿¤€a/aÖ’Ð26<Ý“xãû*~ðîåõ	€!i]a‘YÇ†G+VŒEµgä¤GØìiv©Îg=­@“2¶tnaüÿ›¬©¹ÏÎÀÎ¨8»€É«\0ÀL&±Þkhè²@¿¾	Ê<†,/U²ööðµizyôx­Ü×MüAÑPë‘ilÞX\0Ôô«ªéí{(‹£\'\"œ²IÉ_<	Íîéçìà#dRÓV„úm‹JÎhA%o‘{ÁOPývŒ•JJQ¶¹é»õ¶ëé[h¸åÂÌ‰R§ÿþ7,Dõzžzò-{öéWiN#ï2A˜?Ja?\\›EÌ$Ny ^\nòKy^ù·Û£ßý>ëN»ëž%`“ó?ïÁó¡‘»‡b”XY)J\'”Ðì¥e\0þŸX6Q+I|ÜÆG)†8»éFûËÇ_bVŽàEKÆK~â„ÓªcŠè”Ÿ%®„ÞÆ»ì—ûvÊöï\\ˆã[ïÈê‚Ù` ì½+\0gÍWRçi)¤ŸùÅ‡DTÁgßýÊ×ì,´¾B„FÇÈà½&q˜L‡q‘¤ÇG ¤sì˜K¡”w!hÛ5·^´Y³J¸¿WÛÍ·l¶¢bO‘ÙÇELk@ÁËe€‚á%ØŠª>+€|ëÛsìÙg^ Ý1Êáï@ûS“êŠâì†õé<¯ºˆçÞkÕû¦·§ßž{úE¦®kíºæQ!0”™‚\nÇuVñ}OÊ“§ÏbÓ*3{úÇ>°º:œœS\"°žŸ<“l]Ó[	\"0pdŸŒ!ZÐÞ9Ì°¨ÃN†e5L\">%Ï²ÉÆxJïãìÉ6«¾ˆÅÅt	<`)=©8EIœ\n;ivY4žÞd\'°5¤¤\'­öbmiÌ/öñ	€aa+&ÿâ\\èhaËp×¹i\\Ðò²,Ë=ÛƒL××š†@­^]éh°YºkçQhyþÙ§(×Û¬9h“Í-´’’Ý;å0xÂÕO‘5IÑYåˆôúÂè¿KwŠÓá‘l‚ß˜ÃI6u(ßï$òÇ ™Ø©“çì@nŠÅMá‘qœÌOÆ8p¤~øƒ\'˜|!À€½’ÆÛÛ/Ç	n¼J#-n©2”™Až\'*nÀæ/Î²•k‹ÑIó[Âuõ•„<ŽCVvNºš*›µÈ=¨Ô=•]ÀO¯½z™m¾q1“Ü:{×²þ^¨-ÍODÇŠŽeªÍÉN$ÇÿU}BMšÇÕ¯\"¢<yÆùkò¶öªwº×7ò|’\0ûÆ„\'\0‡¹ââ¸p‚<ZniK–,v¢°‘¼O•NÚ7ØûY84•c·Ý°ÆŽ4ÙÉºž³Ùù‹È},B-÷„ü± ø©ëƒ)ö3³@ZøÿU\0|÷óþý/Àqà|û×·Úþüÿ¯:°Ÿê;ð-#´+&Ùì~ #edTB¸ÜÍÊå½‚°~Éa¶bM±m¼vŽeåAcªÛÒV‹$|«k{(3Þ_7ìÒóº~1XÃ‰(@Å×Ù–ë7££Ø†é×A7™¢5ã§ï­9R2øK1xbÅEfMŒ¡a6JKf˜NÃ–W_zEƒåþªÍšÏÀ	/ŠØešíÙ}€É6m%ÜÃ9Ì4ìQ‹BkJH²ô¢sj½	/©à&¨Œ†cq”ñ‰¨k“±†‚çœ¦Äjºú{u_}ýˆõ5,³½;/‚‹„[PÄ’G ”E¯5”,6’™–\0^—,•Ê«chp|ngz^ÉÎ–®ð_ûãÊû	€zÍÝ£õ	‘)•ãc²ÒCcrr!G§“î‡u Ð2GSŽ2O%•l-2K•=öD•½pÚ6­_bÉ†\'-Ö5DéÆÏ…S»Frši\n©/–´hŒÅ4.7|EÂÔ÷“_0%fAUºx§ÐèM¶Á¶	|$P\n>zÚ)á1ej‹ŽÚ‰\n{ùÅ­””>[8g¥\0“!¯u‰ŒÊ· \08¼b¶šÙ‰Ëyø1Ì$ÀGEòZÀ[-_:Çòó®r¿¯©¶&¿N–RY&s¤®DbñU×àÉ›e+V`m‰`Ã©¾Kp¿7”E<õ †´´ËL„ðN©:fï7‡¶4;b3wZÙœ\"®Í¸í9x”ëvŽ jóf-µeK–3I§ÁN†0Æ&Ùsè„íØù†_µfAoŒ¶×˜ìaïÁƒv–vAù¬¹¶âêuöû¿ºÙžÞÑn/¼üv‹­\0Ò™tó<2IwÂzl¼@NLÍ”k¾]kpˆ‹Wznx?üSôÆ]õ|e¿Oõr#PÏìþU»rÛsÈó/!vrNçO5ÙÓßþ¶Í_ºÂa§:±ÚÌNÇÖ³›€NUJ¥0ÁV3×æÐ”×ZÊâmÞ¢\"h™¼ÚAî/63³™À/àç	0x\"»ÒÙM}ÉÚ	°º¿NAh\"‘úw$Ý‹.°‹”ÞmÍ]ü÷Ì>‘Á†\0ÐâÇÅIÏQP.Q4!¢l(hXwÇ(~G‘=c(½Î*›j-57Ïú|¡våžöÐ${aZð‚Ÿ”pÂbÑ$jqÈÉm‚=\"AA…¤<£B\\d-#W*³·Æ(Ç•ÆQk·Ðr:yè”5cH¼«Ñ†F†X…b†$ö¨Îþ$ÀÓ±Üÿ¨~@Ïx—d\07â€ŸêÎË™}1­põîô¢»(Ò±_X\0OÉéô÷Ì(*¿¶®­iÎ«%KcÙla(QI¢=NòæCÃqâj†”>®×VÙ0d5!d@Å’K•³êó\\îÕ_“ˆ¥úo>ø¼êùI‰Bë]é½h\\1¡IlÎúŠúŠü}\n\0ÂÑQYv±kÐ«Û­tî\"X$N\nÓJ‘†ºóŽ;ìÉ\'ž²SÇß@è‘²™!‹1\0·¡Øu‘Q’ð`£,´.däÜõõü;8•Ï´µ‡S0Â~÷wÇ~í×>Có\\ø1õ‹ÈQùý(¦‰¨Uçç#RpÒ~é³¿b-@x¤,FÆœ× ÓÁ~N}1Z4%”ùPsûyÊ#†$ø~v\0Š÷AWóM[á¬e¶éÆ-àÌCí»ßšžÍE+*)âúŒÛ[Ç+3¶O—]ccöÊKÏ£©#·±p²Y\"¯TƒâÈ¾Ã‘Ç:GÆ9n…Ð¥ÔgâJÚêÙYVy:ÃÚù½qm\"&Ô‚†„[œÔäÉaÞ´©¼¬+˜ºP,¢”,º/\\ôÞ!½ÔœxgàA9é&´Þ/&ÌÊ4ß€ÒA0[ø?þ[ð“izvª?58r‚{úÓÿã÷ìñG¿GöÂÀIã‹mçd²ƒ­®-5!9JUHüÙÐ0 &¼¿?úŸ¿oÿ0ƒðÊ(ŸSf_ÿÊÿ±B\0ÃbYøÁôÅÓ“BôÂ8ÔŒ9_xõUûâŸìXe£C((k¦ìæ:Um/¨G}¥u£8êeÑÝú°Õ:ëëU_»-Ã[mÅÚõVÃäúÍý,\"—Dð¡£ìÞïï{Ê]#rCñÞÔŸfòïTèÔo§¿©û2® (¶ß÷IìWïQ3jèºuãåÃ“7ø=n_Ÿõ€ÜL]T,ýô.î7 éðh„OC:šÍ¶is™eäõZßhót\\ZFOUsÏîúþ–÷Õüèß\n³¿°\0¸¢èW†_üÃ3Ñ)9uKe¡SQ¥3âlîœpX¨›!óÄ…ž\nŠsÜÍaw…=ÅMa:JŽ¤ž€Ç‚ö@\'î&{0Œ@óÝN=\n”\\ÃBÔ8wyïûâëŽ»ÈœÆ®kêb±SjöêŒ\"ØÝvÛmvãæë<Ø¯ž›Eþ’F×´Oã¢þ&n¥ô>èV²Êàz”ìHwéÒ%î~h3FSnc®¤ìTþ©)Ù.”Íœ±õÿ&v°iYª“MÓ°–ÉŒðƒê)	(ÛÛ0 Ó!þŽ‹mðÑ€ŽaÑn2x.JÇee±VY7ê†BesæÛ¦M›\\Oè	pn°löì±†ºj«jìtRa@<&(³¡>³žÇ€]tJÙÝeêùÕÕ0DW¾)ü1.‰vú\0oJK\n“\\<q£}¿ËÉAR$6PÔÄ+·•q°¯ê*ÖËe³@åo/e/^ÒÐÈô=eÒ^4ôá8öîAY\']@]s‰¯Âk=pä¨•Üp=ò¹‡ìÆÛogÚyŸÑÐÙ$4,N8‡¬‚‡î³ÔvTjŠæ¨ƒV½eÅ˜q(ñ½ÅK–…4\\¯Eƒ&à\"<¯2{}}ý·h9&@ådx¡A‹²I%|çú½žõY4ÆqIýkà‚‡^GwO+ø×t‹Asæ¼¯Åº!±Æšmmê¶±	ÁÉÔÕûU,“\'­áÀ9¢cÀeÆæëÃ5A4PùyÝ·îŸÝMr÷Šû-¸\n!ô+5´	c]Š;2…åÅX½ÍŸJ„§Nœðñ¡¨ääš‰‰ìCõíã¿ðìÏ-‹+2¾_ÏÎ*jów7Uø&¢‘‡çÆƒ¿(ÃgàôÙzëèoO•KÃTL‹S\"WÎ¨q°eºyÞt7O›C7F7J‰‹Ê}I_öâßwˆçQkR\0dçïNé;îÄ.b2]=§8€M”Æä¼`ÀIœ•á¸\0ˆR*{ŒÅO:|žwImm—ãÜ–Ï\"ë‘IT¦snò;gå<%¥ð+tqE‚“Ð—/[IFÍFWÕj³-…ÞFS™„°\\êï…»ÍN_¦´ˆ_ˆÌž¯«výÃ¬NgeU1§ÏÁæE•–Ðà9Ž=À0©Î®›·ÿÞ,wmrà¹¶€ØD0++‡R{œW¼–Ð¨– Š©h²Þ›3[–Œ)N\\5Ý(-Éê·ƒŒfª^^Zlgë[æ\\d\"p×hd~núöÒ!åÝ³À×‚™_0À¹{\0È¿æHÄo¯LoéÜ&Ü¿LªsÚ„ÓbI§‘ù‘Ûìú©•†kÏ>õ”#›¿³ü,&FÙ¡¼E’9`baiôc/9ýH K“D>²¹	2WaSãKKÓtö¢b˜HHÌwŒ‘‰5[E‡Í›=ÛQ\nü€Ü¨®•ÞâˆÍ™»ÐnøØfZ1LQ«QEáP™‰íª,jÀü3Œëqˆ€’¶9ïÇ/T4º`%Ì•ßçÎXió„r(j-fçl tv2ÁÕäWï!œŸ»Š®çùv »¼gÞc£Ï o¸<á=b¶Ht7ð¶Œ½A¶›ˆ’S´ØNHgÙt\'=ìå6£”Ã2š)óÔdOLtæ¡¨´âÆÅ‹~ûJˆã/üü¿ü€Ý¸£Eæ˜êX17)~Ê\nKâ¹‘-¶A•C \"”SÌ¦0«™ÐPDŽæ[ÂP	Ä¬ÏÞ&rX/ÎyåT0ð	}üºûZ Ó^r¿ÇJrX\\Ac¤Æàe@%ø¸T{äÎ…”;`¥à8>yi s®_³~ýr˜Ù‹¯¿À8^ÙZ›IÓø¸«7Þzƒ¾ÍàÈ«-&ø`ß¸½ôæ«®OW2çW’)¤Ò†¸a»ž@t ÁâÓñêÅxæ<¸Ä×_{cø%–œ³ÎìNžo` AÉOØ»DâW_µ\nŸ^¸»•-öæŽ·È #É,6rˆdA•ê±·>MPË²´ûîvSóIXÂæåd»E-ŒcßoÝ*ðŠe™dùvøàÄa[¹>ž/^\"‡ÀÂysÝf=}¶	¬Ùñ°d´¸£Dýt¤ÿçÏà}Š=zÆ	7ÆÁ,¿ˆ+õD.xé/ë^Â•‹bÿF»bÁ{æÝã·ÿ­§ô‚ŸíŸ¿Ø£¼¹AÃ(˜i)@8Ÿcô<à6aÚœ„îwàÄI\' «¬zN°Œ“c€÷hâ*N¬¨ŒÃôM†QßÑu;«ÌÖ,]ˆq«LX6?Cxú¤GNÐ›kÁ—#ßRèÃJ˜T¢<FLív‚Á”?,Á6l˜eg«Zmçž7Ý¡6³…L2‡5Tå 1µøÂg?ç&´ü]‡¶9ÑÓÂ²ûè[ÇXus%ƒˆ¶~Ó»©p©Aö°ù‚`?DÅFË„wýQÄÓØð®œ».Að>œ¾\"ÿŠJèšêÛ*…=ìdàÐÒ×•M;qÌÆÜïË–”á*/ãèF†[a{7„`<2•Ñ2î;21Þ÷óm?Ý_ø…À%3~cb í+\'\"\"ÚNÐ´/ŒÉÈ+Š´Ùóã¬¶©—YÅÞªÁd	a+ÏŠpš¬‰Æ°…r·]Fàq-/?¼~·‹€éÌTL ¢Ë«Û…OâÙâLocýãV…à`8åÕ+Z9 xüCö¥\\lµÅQK@ü#Z×om”~‘r¹#Uræ7ôøÚû™¼É[U¬d²7ÐøÈÏge„Öp„}HÀq„u\na^ÝÎêõ1ÉUK+\n†F+Þé°@SaÍÛ\0ÙCCqIR‘ÞIÚ<R¹d’ÆýLa/:¡ÏÈèNè@r}}+Ý‚[ Í™ºGâ’7æ¿äÆT¶öÐg%kÁû¿¯ÿA\\5Ž‘.¶ð³ÎçA~³!ð<‡¡cR¶yˆ62+¦ÆaËù³fc‹±¦ÖNtö@:H\nÌz1ê²óº½òWAèmÃ¨ÀÏ¼{íºr6ðÇÞýÙ|;\0:ØWêéCCõü\"øÙh€ÍêyÉmq˜Ï(¶¡ÞN‚äK†HáôÀ&Û¡‡ëGÚBp×4œû¥©¿OÅˆn\\}õÕ¶yãUvrÿ^‡>˜àæ+¥	†ÕQ+ºkN…YËV÷„äžŒ\"}TºÿSà1;èË›:›ÞMx\\x¾~„Úy>ï \0»`Ýƒ €Ó·£ÛLÀÂSvÕ‰ZNµÛ~|¯»Hå’\'¡Ói²Ooâí}(9Œdp@(]yÉÝ%A÷Ç/³h¼Ÿ\nf…‚ñ„QÚ;ì;°ÖZìßpƒådØŠå™ô¢±£˜è›ŒOJîÈœ¹ð5Kšs<$üÓ¿å—w/+ýû=Þþ{ýØÏïkÕÕCm½!»|þ°†!Ém„õ!Um3Ê˜F]â¢F\"Ão?,P¥pðO¼zõQ=evzCWì\'¿¸ÑÁçf:Ñôó®¥Í%í>ŠéYER–Ræœ¯©µ§_zËHê\\Fn.œ\\\"™¡SÔeS$e$Ñð¥ÌPµ§Å+í@‚`,uKzœN¾MpŒ\'H¦€¨—B”2ºhªÔ	œ€!|Na)X:6_‹E¡#šŒ*L`¦ŸqN!ÓÀlþ>æ\0Ÿž#T½tÊ7ž?‘¿«÷‡TS6·<?†u»$î3ÍôÔ5{ÐLI‚jÖ\'ðóîÜÐãÿœƒ/NbªR?{Dïo”Í­>O.~\n€ê&q]&ÈŒˆÔ7^SÆÇzZBú85 G|æÆÜº\'Ú(iì›3¸IßñY?ëî£÷;W~öè\'ÍÈ@œì•s7c]è3Î†SpR,NqÛDúZ›8èðÖ€ÓÜÒØà¦£\nRòî¡ä& ŽÒËlDè‚ÀÈ!œ\\9yví–Ívç½×Ø’¹@f¬:F–«\\IŠ%0$‹b\0&™}.ª³*å{ÂáK:LxÉ0}-=[ ýtî=ú|åk‚ÅRVf u¦K¡RS2xît‚0¯…·.y·ÌBŒœX³gaó½Å-$CW(RYàeÜã;äù½ýÜWf^ÆÈò‚×VkçÊ,1ð}õ^÷‡÷Uª4Ó¾n˜.¤ÔBA;d3©&ûžÂÑÇAO+o—…å“|p¿ÐP—aÉº?>¹ûO÷3UÛ5:Z[0ákÉÌ+Î`\"œŠàf3M4•Ã=R/ŒI™øÎN§¼ðr^I›\\Î;tóœ»~ìíB)˜z=B}ÏCÃËýKC(\"c8½žNÎpz{‡Á1Ç&gç`§Èd(@\'Òáý¾BKÉ@F^ï`9}‚À¶Òè€Ñ°¬tÇ»E}ŸM2\nÖ.‰r8Õy³ÆÑ4þx\0,ZhÄúIl˜v&À1q˜!E‚ïãyÏWƒá‹ƒùRÃdv¿äôà&·Ç©Óg-îªú\\Ì§‰Žª›Ö	‹p=.\\l%3f:ƒ&…Lî2Óò™ŠÒìc£&ù@E& YÏT‰ãP¿²$®4«YÁ1<$7P´ü8Ÿd?™@0X€_IáçK¦Õê.VØ†ÒE¸}€¥Ã˜ëçGsÎ&L±\ntX`Èáe…º;SÀk¼Ò5ÅzwoŸÍÊXÜìš·³}½o—ºu û.ïY¯ÿ§×§ÐÙ9óæ£Ú2…âOäRÉ†g—ÚÝ·n`MQb¤4µíSÖÇCŽrBèšVU_dz~ÞÂÓ“è÷f96³víHëg¹þ°ÃI\"“Íëþù¥>þö;£u¡·»)W9š}Ì“œÕå”{ECåÅV--–Ó`Ã=°n’rÜÒD}…ôHØG¡T<–s\0k{;]	Üå¢#Ýu¦²ÖµB‘û%Ë”Ú¶›õ¹õ¯ÃB‡—¸Ž„;|ÞNÐ]P\\R7(	œ-ÁÿM/›÷~?”Iù8L¬ZH$ý¨>ç¤ŽÛüy‰€þeÛ	¢À?Ú?9r¾µ¾¯)wöõñË#þÂ .Ã¢U7Òp:óê¥s}+»Z2åS;g~,Ÿ~úÉ©Ê&L4Þ¥äì5„½“Û¼·9\\c;p3]Ê.#¤À.ÂË¸Ü`U¦Hð	sÞ!ÌaŠßK‚\"­¸	_Ç3¶kÖ6û<J’ë‡æuú\\ýÉ0ç«‘Ã	^[SbF½cJô¬Ž$ð&“Hëy?fî2ÝncPÁ8²?™Z¦-]4ÏšP«éœtAHª»íôyy)xyÄÑêe”À3†‚Ñ˜•¢Ë=ïò–SN6‹”caðÞ!¿\'p×­^ïðdjTKãm&hüìŒBž«Ïöî:O NÃ´3;OMÒ«jÐ8¬d²ÜA¿j˜Ÿk²Ã‡#,/¿À•Ý’»ïïcJº¿>ÕþÝBøX}®P&¢§²‚Âbïï¢C1€|<¦7‚q½i‚ \\ív˜÷õ+3w­‰·¯§!cò+‰—Ëg7úP„Ã=M…%€ª ¨^sN¦ìäåpT%þŠ&\"¥îêe‹ì†k7Úªñ¼_o¨€À³[ZÂpªz×Aµh³þÐgõNYd$mKuÿUÉ°%SºJ¦µ‘kH«£¥¡ÖA‰.q ôg»,\\øÎFø›øÍô!ªÛÒPG6=lWmšåœÜ”$w6vóü!¬ ²SÑrì%ÐöŒA›¨Gß±Ý]ƒªKˆTDÀD\nOD$Ú#`gÁdº®L!ÃÖ¸Á§S2Œ«½ëé%Á‡7ù½â˜	œ/Á»kO\\.ƒƒ‡¿èºŠÂµ¼ƒ\'Jd€	J%?½O<Î‹èÿÅÄ3ÐfC·¤æ,{i8¤àÊû}¯{å5ù…†äééíùÃíoý^Måö‡Ø)cÃ©vò„ß¾öõ*–ìUl’¥6ŽJ\\ R°/bÔ‘ö^2÷@ø.õ•øPà#\0	èb¥>¾üºË5=”“k<BARjRÇ•%\"Ö—âíbŸ˜‡Jî”häiÚT_²E‘}üî»(«bìØ‘#vìØ1ëlosŽ]ë®ZkWoÜd9™Qö{øgøÓ¢1çä¯&(GQ¹é&[½f¥=ÿü+¶¼_n^˜ÂIgl´páB»þúëÌb÷îvæ²ÿ”–Y™¶nÝ[½z9bÀ^ýu;MpT7»¼Ì6oÞB€›…{×	ˆòÙqíÑ”TÂ,öÐK,.œi·ßy]·i¥³XÜñV…=ÏdÁâ\"ÛtõjW>€ïã¶oÏ.‚Õ”}zÍ\n|ìc#S‰´çƒWÕÔYVvžã/7b=ú¹O}¿á…v|àëoí¢¿¥¾e<\"¹Ü«0{æ…×,9»€’=à-YÞ/ÓdÂ@ú¹Ö“ôã¦ÐmÔËÑ[š1Â°©r¦g\'…ËB”mˆ1CI;%–t(^þ¶djƒˆŒXa‘k[\"¯škÙÉdv”Ì|òf>p¿ÍnÕÛ>ûà/|@;r§yÎ>Jüd†7÷>ð }æ3Ë‘Ãº€ÖÞ!{kÇklìT»	ÈŒD^+	n1dÉóg”Ú-7Üàîû+¯¾?ý 3&—†e;\"³™ßyç]èZ¶Ù³Ï>Ï‰Rœl_SIS}á‹¿ë CÇŽv×^°©ìÌ[¹d‰ƒ*I\'ð™gžyQ‚wyËV¬´[Xgß£ÁöBw;yZ^ 8,Rþjü#	|e€Œ€LHgDAX­÷ùíŒ:Xòº øtV‰…~Çk+èÞðß*%Ù¸¦À~2±SÈñ÷VXvb=x/ÔÀÍ‰ìËjÿÈØ@}JÖÌ7Çmæ_Í\\ñ7¤¨¬Ç\"ô.Ib{\\Rážô”Âu}])!ÓƒNÎ§´8¹ª60mµ4§)¢´!t!÷ÔTBþºÁ•BºyÞiÌ\'uY¢»º¹ÜUõ§twÝzÐfT %XÑÀjL€YÊcXg–@fñ¼µØòß4Åò)ýÒÈ¢m…Í,B˜…6fnn¶e\0á×ì»îr g	hŠØÙÞ¤W¡•RFm¦‘®Io*Ðá»z	<ÊæÃ‹Ö„ÙÆ—ÛÒùådPÞè•\0^N%x¥æ Y~ÍU¶|Á,W:É|=±ÒTÜ»®Þ´š]¬=÷ÂËv”i¤Èôm½Xœâ¿\'ìÂé*[»n½­_;×n»ýÿ±‹UV>óxÞÇP_‰ë›I;-5HF%ã€ÍžUêZw×\\½ÖV¬\\Œ°ƒÔA`éÐl/ óÌÊˆD*}6½S /‚^Ð¯JÎ¢t&ª<ž6À‚­\\CRè€º§¹V~á1ìæ$£8˜	íc’ò\'@hxÁëÒfÔDwœLlœAB!ågKk£u‘YV>Ù0ÕPzŽ#àk*/9¼ß,B?ó‰OpÍ­Pûúß=aÏüè1ËCn>Ž`¥\0©àwõ5›í3Ÿû¼å¥Ûž×Ûlû‹/ZÅy¦ï¨í¬Ú´Æn^¿–à6m-óJ‘Ér™þ\\X>r\\µj‰å§Yª®epY•ÐåÐÀ2ú¹î²xÄ*V)°IÒ,/G¼s(o±Ëm6£’ÛŠ`fâÍQ€âòøx¤ÝÏxÕê%THI±¨Gi&Ê˜JZ²UuMÖÖ‰¾¶IZáÊr]•L­½aÓ•™]°ñ´(õ²9oÏK`oäíLï÷Ý“zYd ;T†=E7ïâ07Õw7Â¹Óì2è˜Ú;ãÝ‰iY—âRr_‰-Rúú{|`2@w]§·XÏÁ_«:·ë¡¾Üôôùöã§*mÏ	;w‘M=Æofêô¹¦)8áå˜å€›š&¸àå}VÖ§,Ðe}\nŒWdÚmÊ\0]é%Ý>ÍAX˜ŽIâ 5íëf«…jo6;ÄUKæbÓy«­š9×«\'$E°R\"©_W¶Ô\0e\n”‚¯iÉ×¥¬¤^“4ß	n. öe`YÈbRÂÊAIr‘(Tši’)àpŒ@b‡[´Š‘<Ÿ¼ž_ý.¹½éqêd—íÝsÀžüñs”^­?\'¤~1Zf„¾aËMdómÙ*²‚ŸžOƒXí„ôß£4·Ån‘þŸú[£äsì’m>dcª	±þ-%}Qº›\n¨úçžv\nó©}‡0çÆ¸{\0ÅÒúd€yÉÈŠ•‰¢Wê^îzå¬6 ¾¦ì\\ÿÍýq‡¯DåºÔmR“Søz› ×»áY|ôf–-_f÷qÝrC?köÌwÚk/¿ä€Îi/&pÔkÇÛ%¯ã?ô	ûøýw0e5ûþcÏÙžø‘¥g$;LdÙŒ<û/}Öî¹s•»Ï£Ð/cÅBR9ðâ‡¸K½E×ÃaÜ à}Sÿ7Š€þòC—CýD7¸çCŸ\'€+IP6†lNI¯&æî¹ ø!ÝD›í\\]Ÿýé·Ÿ·zŒ«5¼‘\"O$#{©	9N0ÁR\\vµy¼,ÎkùÙÞa€†Qîç‚?¯kÍÚS~à¦ÇWœôß\n€“\\ã¸ð&<-;¥âdÛ|Mm†HJæ¯¾á÷-jî¾óC¼Ç(ÔÅÉh±Ôy/¦§4.í?‘2Ý½zUŽµ´×Y-XµÑi¬-CÉ~8 .T°)¥äÊ Ü©ä-Æ`—õ²gl`…OB×Bä¯‰Sâ¦…\nuôp´üÄêpàÚÀs…“­DÂÆÀ;øåjePFÊf›‘í-VÙHLBþŽA‚C;AÜBVå©X‹î5Ñ‡KMA2J¾ÉpÒ^5¸õ\ntw~D\\e&Ž\n,¬cNu‚Œ°3<FÉ§ˆœÂüy\"OLâ¬ÒèìEbx8”¿C_uQ:œÔ[9‘ËÑJ<F;á,ý§fkjj³£hºµö~åå4»íÎ-LÜèg–Y.vÚœŽ%ÀûAe6%ÕóÑl\"Š\0TCô%{$m=Äfˆ7í^#‘pŠ×«fã’LÊÍL8Ôsð>mÛw²j F2*Š&Ò†H–^“€à) îr$œHTT›/0Ôpòö:°Dèç—\n	PrìóÝÚÚZh	EgÛÆ»î°ÕË—Ûm7BÓ;oöÝ¯ï²íÛÞ°&´äõÂ¹9m¸¼…¢Ï¸fÝF{ø‘OÚú«Ë)åí«ßø†ki$RÖJÙ»ˆì~ÝÚ\0Ág¹\0¤À/©\'Wl2ÍgÈåã$ˆbNV+iœ“N+‚k6ª ÂïÈrÒr>tøi}„† O©ÊÃuE½¡]8;1ZtÈ¸\n]¥¦Ÿ’YY¹‚á¹ê*ûþ³Û­­\\\" dÒn^+Ï/_f­9ÑÝqùÂ¾gô	öú\\Æ¼›	î«\00˜ºû¡¿Rt– ã…N6P¡„ã­{ÔÑ¨KÍLª]´â_[NŸiý@?]T\0	Y29=µ¯\"9mîÝ-U¥½=M3ŠÙÀ¥xçT90è˜/•àZß9»qÒB6Ÿðz‚i¼Ã\0ró=À¬7vÿÖÆ	J·T+ð¹Ø§(â•N5Z˜|ÖbKÅH«£¹Àñ$\"íæë7¢èelSÂÚ¯3ØÒßQ€å{b\0$ ¶FæÄÁeh¡’Û÷X}.`*ˆ\nN¢Ov­r”s>…ß?½B¯$-ÿ²ayðêû©)80XAt¸,N7ß<‹ì¥”	t2RçG]É2€YðÆ9õõCöwùU›=g|%ôË„a¼A@&Á¯«¯ã$É‡ñÅ&Ö#–l#‚7 ×¦kªL%F÷½x2se5½Jo@J3,·‹“…ØàÚ·½¹×*k­éâ9K(˜éeuè™…kë]ÇDžk¥ë©²Ðe?ÒLT	LßN­…ÆF0t|+cþìr»jí:˜Ë­\0fh$ûî7Ùî;ñô8å¬b¹ðƒ\0ŒÃh¥Ó{}ð¡ûéµ­P;Îþþ«¯Ø~ü$â”Ö…%Îë¥Šè¹bé<[±z5j/Éžu¨î‹(È ñz•q¹‰1Ð/øy¼Z±c”MÊ\'W­‘àGkDÏ#|§±1t˜êè:P¢a¼ïaT‘¢\03äá€ðƒù©ó(ðl;pÐöÒïŽŸÍs{¬œP°˜s»Á„Öa—µyŸßà‚ûÅeïÇ.£Ü=¹bbüî!•§±Hk†ù8v´))ÐXó~ƒ2Ü-i Ãš³³¾¡—‰Î÷ñ\n€î2§ÁJ®ˆ‰Jhj*íŒ,ns˜Öõ!5ÑÂ aºMxTØ-ñ*Ý]~Gd\n(*¸Ó,Àqe›þ©@ç\ngÝp¦Éâóî<gƒLŠ/,eÐ{ÆÀÈEŒEµ·žðÁÃÇðÅÈ°’Ü¹L¿Øãì{=·¿CäÊexòhàËšS§\n0¶!ˆíÕg­3•»ú]ÉJ6Èe]nKð=â»C6ªÒËý)‰»e‡É\nÃø-xâ“6˜ÔŸUžÒzŽaŸù¥›0ºÚI$>|Ã£\n¦”µ]NÕ!?\0ü¢Òf•±g@ëše3Ë¢ êé9“AÁìªi¹u½¶H½q½VQ¤\0p<ÔŸ“ï/ãbýSˆýêŸ‚\n±4‚ùuæ[&åæA„:_yë ­ÍeÏÁY<“N/S¼ÌÆŸ@qÚš<oÕcˆ”’;†inùœ™e¶víZÄ_ó\\à­8Ûiß~î-dãOØÉ»,‘>e.ÆQS”ðêÁf~ðìÁO\\Ëáed¥uö£§ž¶ÀŠ¤Y\\œÇaÅ´ÿR5¯!öÎ<[@»@°¡à}äâ†r?£¹81üŽ”±uÿõÑOß2‚þ\'µî‹Vï’¯Ó\nuÙ¼î‹ÚÞCY¡Ô¢e\0,Š¾I\"œ`@;I¾C»@ÏéÚ8|¾Ôæ·—ß<s¥ÒÆ (j‚A2 u.)6Él9¬¤2e!2qr×ò\'AŒûN »{Û#ø+,Ðà×ƒAÑTš´“€$ÇNØÜò$ÖSéØ~„+CCNMFìÂÐçüøÀÀèÙÓm;þ¶\nÆAkRBÌàÀ`cZô e¸UÕ‰iÁ¯VzwaÜtŸ!&¨õ®²‹w.“Ó¿<œ$}Þ™ùé[ŠŽžn ë‹°YC…ó°ðêW¹š…0uëcŠõNÕ°‰AhkMöÖ[;-Žæï¦µóÒ^Ú€½\"™€	ãÉÏË‘=†Æ¬ƒ×[àVð—™xW1c5hÀU¡QÆ TP“ÄÙå³ÈÖ(ñy‰-m@*y™SˆnÎFùÈ$Ô«;-¯g°Ë2ÀðåQÇ:åæ&ülÛ`c¨ï7Ê¿×­Ýh…ù‘¶`~Œåå^CYœ‡²vŽÎ¬ Àãý[ÓÊT³Ùêkš)O0íL à¿Bóþ“Ÿ¼:2Hô,CÑSt¦™Rs€‰ªšùs˜rêRó>k‘ëªd‘“i«W1ŒºG°ª®®ÃO¸—\0\0[]h!+–Y3Jßû	¾~‡×ô +\nzlWU8D	,RýwÑ]\náYXtf3O¥ýð]×9\0.IÝWa»wîq¯L¥îýµ7ßÌû«µ*èn9é™öù_úe»÷Þ[Üarð@«ýèåWì­ýûlhJ\"9¹Ü/\"œ ©¨òÄ\"jZ2w“l:¨÷zñö-µp…£mÕÒ•\"^¥PßÒÆP	Ådp¢±¤h\nŠp]‹B\'ÐÏÔºŒex2Ùš=o6Ã4½óp“H”U;^õÚ3àUOsØÑ]!wXžÔ£DëRìØwÞÚ€ó¤”ÐBAx€õªµ:­F°«j<Ñ‡Ë­„+Ø•¬÷\nŠÁXu9+L|ßëge©YXœjkVâÇ]k¨brx´4%#ïÐ/¤‘þµ.Ûöñ€ºRgj;Ûr³žMK›‘ÒÓ~jYiyBêÂò;š=d•¤6aLUKÙ¼2Õ&åqã*OÌÓ¹± ´(DB—y˜Ì™ÝòUi«ú–ÿT-•_¨v¥²Ô£uvjH\n$!×Z[	dôÃò0\'¢q^WÕa{á¹)m€âTœ9ìœ\0ÐÙ9•a1è¦eCµèAvhÛ[»íÀ¾ý@XÖÂ.¡Ii½¨J>qÛÎí®V–6_nn®ƒô¬^5“àÕÝSÏ¿# Ýâa‹d\0ô,9«!p¾þÖ^;UqÌî½ÿ^ðxÈSiÒÛÛAÖsébµ+uã6ˆÍ°„Í-%’†9(Ÿ[þ°=ôjÄÿò’×»Š¢Ð\"[ˆ¦—Ù?Ô_µé§ÙK/¿ª¿1ÕvíæklFùT_r\n„ò€%ôæ’0(è#øÅbó öEôýVîF˜ôÉcØu:Ð»÷‘mWm¼–\0*?ýoŠþUÀÊÛÝ?7,‰ÏÙéÉð•8\0Ê)¡Ë±Ìã ñþ¦²å\'¾}ÄÎâçràà>0‘ˆ2P†ÊZ5•,J\0æ7_yÕfÏg¿÷{¿‡¤Ù¦®ðªOúì…^²ý€Ük¡–‘ÉÏ‰F@ ‰^óQDN“À‚JÈ¢ÝÊ—K$µ®¹–ZrP;÷µ‹L†‹ó²˜Š¯uZwß°åuì9pÈ:QjŽ%]L`0só-·ñÜùvæ|µ=÷òÎ^RÖ•YÈí÷Û[VüÐÀçãÍG¬¾¶† cù%ÅŽ2Ù€Æ#vú§ƒ¬ç~ÄMë[ûáf—€/6ŠÍäÈ`-ÕA¸ÂõÁµ›F©[‡§K6ƒA0 „äBíÖ½hnÕrh¹\\Vm W#‘õÀ.HšÀ?Å 2jâœ•dÅ#®QûhÀ¾n¸çB]ø™ue;zû§û>°‘/ðÂ>pó§ÿfb¬õõW£²&j»^ùÊŸtmHë‹¼u-t8´÷ì=†‘K,a¥õPrùHù#Èà\"£Dz‡5I­JÖ¾` ªxÃ!3\nÜ\"š4mŠ2ƒ`wÇ×Ø¼y…öÃ?ƒ*–~d(QÑ)€~‘³b\"Í‘\n¡wÄAÓ\\®n”eYELä|v¥è®§^Ò’aw<üt~·Óµ–gn;ñ‡=î@°9edQù”4´¹øçªzlÇÁó–]4©­[\078¯Ý3—,¯t¦meƒ<x\0…4óã6Žˆ~OµÌ÷ž|É™@•–•À.F©ð1ßÒF<†æ9Ôe–,fpµíÝ»ßNnŽSÆ„ðë+o¼B Íµ{ï¾Û|‘~ûŸ{‹91d—.]²m`÷ïÙKq”@å<*ÆÇ Y­³êÊ{öÉN=xÙ²evã7¡ý-/Þ`(ÚMù°Ý²åa¯\'¨Ä×OŸnp€Ýõk¯\"° ÙDó«µ³µ›s–†aö¬d€(gÅŽPf—ŸKxQ& ^ñ¯1>sStIúµ\0H>²Ò^\0wyüøqk®Eu¹Óo)ˆÃÆüž@À Èa?A7ó´ô,û­ßú-»îú¥®ºcW«ýý7vÙñc§‘‰ÇKSñTÃ[úrÑ–M‹#†MÞbN6Y_üÜ\'àK÷Ø‘Û`·<dÕxb<ýô“®ÌŽÃ/c†õ3JG£†áÊþ‡‘Ë±Ûïþß˜½±}‡9\0÷Àí;Ž²³¹×ç°›¶»vØ	¼°®Xm¯½ö&€÷“®ÄOã ‹äÐ¿VCµ7vìæÀ³ØdüzÉ{ÉC\0?kØ\nÍ(žLstp€©1}P¯h°«àƒ\\0S§$‚M3\0ìd4ÿüÏþ„ƒí’}÷ÑÇXçšÄ§”&ªs¿B§{	là!±‘\0‹C%¤V*B!©|~¼Z‹¬‹8Øjy„û±g9cëç4ØÇÖ[^j¿U7u÷\\lH>þÔ-_Í]kUŸÜò¢ë\n}È\0¨³e`zô@Ã¼…×½ÖY¿£Ü7ZWXšk‹Ê#ìÜ±6ì¬¶˜ÙN<R€Ï	×“ÀUÔs‘b†(:ªfÃ4SSY=>mñfnž.`Þº‹öñ{ÖÙç>ý½üÚ.Aû+[¤·3ˆ2°tÃ†ÓÇ™–)9C‡0†a*Õ“‚Ç0l`6ÁÍw“íßõ–U\\ªuª1©€†Á2ô#åqA=8CmPùBÔ˜JÈVõé³çè@¶ÅâYðkÖot31)&	Öb>Kd9%’”Iò“E\'k••`ø^#¼\0l\'&™¬f¶e¤Ú¬‹l@´’fŒH2Â	G†“@:nO<·r,ŒÛ[ºf>ý³›è	ž·o’EVTYFZÔªDlSƒØÞ)»w°7^;d]LÆW®›O As”l25uUö—\"ÁÞZ¿®Œò¯ŒM­ÞæÛzõê‡é/w¥*É‹Ó^ìéâ’Â1‚GÜ´Ôÿ²ƒ`Õí@×-mí\0Ÿ•“%\0&ÎHàý²îé@8£­•û‹¸âªõ«lÍ†ÕpÊÑÚ#ï;Xg;÷°Sg+€¿ŒÐß#Ï&ØÅÔ)õá$hB\nÈÀžæãñqûí[ìá{W¨°Ièn$ë¿äÖQa‚´!º˜ CœÄ4>0ïåyÿÈ„Í^\\†B÷WžÃ§ià‰oÍ¢‚b›» Ä•ßgÀGÖÃ\n©…Ýe&\nÛ}ÒN“!–Ô›yN!úhatSEtÂ›ëÁ¨kÔk[Y™àQýÐ%ã´>Y›S°o|¨‡Â|‰T–Æš@½ùþÝjóÁ›çP_mµ@@—NÃUJ.\0z€fµ-\0UE©u$‚ÚBÒ¤T{\'œ–žQŽévK‰é³kÒÀ+âá64ÝÕ;Þ¾÷ÐÐöºš±³Ÿ¼fïBðô?\n¾Ø\0è’˜5mÓÓÏíõ7º…EPXÇtÅª$;w¼×P›æ<½À|z0ð‘}yÓ8²AG —/+÷@Sà6ÉNÓéèÉøÌôÂ%xNàˆíšé¤«)cÎ²{º­ÊA5z1ŠÃ÷5’î(LŽpðtÂsI÷ÎÇÏÈAë0YEùÌÕdznq@A*.)\0êqegƒ‡Ã,|)ëÂ¦äéêl‰‰N¡VçeÇñ+™`|±+ÒÓãìÇ?zŽ¾\njØŒuõ®d¼|ÙÎ³à¦Ö`$UïdÌuÔÂ„0>JÏ.‡Éy©ƒ´¤gå³‘Â¬].Œ€‰‘•[äšðR«ß}ð“}&Êæ\0®-›‡Ô×Õ‹ìÖ;ïµšªz{ìÑàÖJé×iMÔcdÛ±àÓRà:ç–QÚ=IIMpkt¶“®¥ËÎ¦A–?;ÓÁQ6)XÂTLf¥£´}Ä¤‰HáÊ1Þ€Ì¼%J ýE)ÖèßòY#Ð‹¢aCê×c¤—>NA÷**j¬¼|¶Ýõðvíõ›lÞB‰Hxú‰õv^zíuÊÒè%6#½˜ŒÍhïô\0»“À:D†!¯Y çòye¨oÀTœÃ&[¦Hs1ø™…$Xùü2Ô·ûlû›;9ÐWaàðQ‘¼¶¬¼Wrrn\0VÎ´z ?mŸªþ¢†Rú~*ýÈJÚ&*[—Ë{…¿¡5R=2‚€¥—):î‡ý\\w\\»û® _C…¢\"Æ“Š&XÈ3	J>¤º°4Eî‹õ´ÔeØb ÜzÛÍó>,ÏÇzÑ¸E‚ªé%ì Þ¾ V’\n[)Iû•]ÒÿMDÓoz¼¹«ZD|V^’lKW°Îbñžn©¨;uòDßîÞîñÖÿ(ð|P¾ÿ€î\"MD¶ŒLÅž©i)II)Ê@´óê«gròÕÛ¾,<q›#T=â~n¼šéBhÉœHæHªiú¨Çœ	7´6mÎiÊ/åTÒ\\Û·¿Ú®»nx¯TøiÖD uîÂ¥ÄÎXdÓO8þkþn^¶!”: T®pD™6xºÏmÝÎw\"hÎ§8OŒh2ŒT6P™\\M}<‹Š´5-~M*§±ŸŒgB<>FÉšJ*1Ñü[†é‚¬äå˜ub|U™€ºI¬.1<7‡Ÿ³D*¨ƒI†éì‡105	¨ÉÀsfñ‘llbD=S_Rú¾~ú(Ù\nÃˆæf;gy‚Æ£DYï»s	ªÑd;¥%¶éº?’g¸=ÝgÇé™U¢“XQQü¤ÙÂpÞ‹#+TïT‚£:WØ¡Î4œ×D°«©n\0@=Ìë‰ÂÐ»šÝ›n*‰Ý\"(‹3\"@8J–óÌðŒëuxÅÒ‹s,2O}?•ñž³ÑñK¦¤þü¯|Š\0ìAŽÀ6Û¶Ý•¶ˆÈ‘cG­¶¾ÑYuJD¶š`2%oDF@âŠ÷B›vq>ôÃÒ’B®s?`é6¼Af[é,ÏY-\nc,“ÎI²Ë%Þô½o)*$¬\nÒlH|z«1Ê(Qj™¤bPPèLåÕ—àý„ÄõZ˜Û9×6MÍ…åKef‘.?r,ÜzxŸH,»Œ¾MÑÊ¦.\'¯%HÑ¸t²A½8oJ&õ!Ö‰T©ÕëžU^NoÔµç9ÇLÊ­ ¡^=ÿÉ“È·‘)K¨AY Fåô@Ø:µ$-\'‹Ý@]{ÇÂº!ŠòØ7Qò¡Zhªm¸j&ä„éÉ–©¡šž‰Ú½Gú^mk«þ ·Ÿæu|ààÁ½ÇÛr’s_êË-êOoI)Ÿ•fË—G &yÎ:§ÏàÂàšF1võËu‹rÃe Ü¦Rî¤ÚÓñä$£…LPÂÜÔ€w?xü)ÈëmíÆ5¶`Þ,«¸p†`ÕJ)Ç	·r5\'x­]·\n;†ÒWÊ¾$`ú¼rŠþ\\eÛ¶]‡±÷,B½ÈJl²Û@ºÀÝd€ô\"¨}´Ø„!‹áDmÆ S;(G¥’òpÌgØÎ`@‹Öïú9”$B·ª‹©™š\0×|’cžc™Hõƒ«ä”\np}KÔ¼\\¶!B„ *ô­ôs>…1ÇkÑkØÍC\\5’ï²ùB‰&úKÝ}f;ß<G€çš,d\"šl7ä_cŸÊº†MÄÄode¶GöîveqW\'\n)‹ötNc<	øÌ$¼Âtèpdñ92LŸvœ×ËÐ¸	ŸX×…×óK¡Àš<L¼p%§NÖF/Wôââb¦èàËÊÀé!T@{j÷A2$†T§°œä£±±ÅõãÐuœ­À ‘(‰Ì7š`táÂ%F•7w®Í@°£+Ò\n8ô>ñÉ0øŽ·sgÉáG\'÷ÁV¸¦ýôå±¬²T°”ç2BO@eVÁlT6 îQ®ág÷»bü@×îE†éÜ(aÝPUH÷oúü³ÈŒòÁ ïTNëÐ^Àk·¶}€÷ÔC( sFôû4¤ Î š‰j´Ï|¨ZÏä=m¹v“µãÝ{þÄa’Ã~{ä‡@)ôÙ®v”*¥—S\"Žk:ÁzÒš“³gM !Šª)\'ÐÞ@7=ôp?FïãrLÔÀøèµÅs2lÕJÔÄ»Î´Zãs£ož©è?84è§Žÿð<>ðpÍ5<1ÔùÃc¯î}í{V•fôu´¬ÈËŠ_¼0Ú6µ¦Ù+‡ê•(#•0´Ò’{\0É\"îè¸¦aÚîº¡Zyl6Ýh€%§/#¢ãÇO!0Ðëšô…Ù(µÌ¶G3Õmc¢›`»÷ä»~ÍJÀ²ƒœd7ÉBÖk@\n²E£¤I²\n¦OSÄPd¡¼]uúó¡¬ Õèì¬T¸œÞô2/sëKçÈºÒèçøÁa¤šú¥4ÖÆÒ¦ˆF’ˆÙ‘2A8pO½Å%ŠT:¯7Nˆg6“+X*©lìNëïž²¬$l?[<‘`¢YÏÉßL@p@`ƒÇœfîÂy7€Ð‡çsáGáÂ§Pøxw¸atÕc5ëþ¯±™szäÍwòXŸýäUpnUÒSv¶+ÃèbXJMPz¨\nƒ˜49¬‡M2ÍÇPða¡±6PRÜ.RY‰`@))inð“„½(eË––;®¬Úê\\ /`çÏw2°9hn>uí>a£M—Bí)oe¤âAG!p:Â=4H&å‹×­¶ûPÈ.(ÌÃö€€Ù|é2UžââD~×o5µç9\\®f£‡aqÐÉk`²ŒN¤^LRÀ úeºÅCpH’äÙÄ0ê>ŽÑºˆ!8\n®CM¢ú}AJ†ùÞ8å~ƒ¡ ô8á‰i9Ly»í$¶\nOnÝFÐh>Âõeñ*KM%n>+ÈÃ8ezZ×‹ÎF0#×^}¡ÉI|å‘)oÞ¼ÙÐÿ|4Á\0½—1Z	¬‹q6Iàüi\0ì‚Ý{\nÝJô!t¿JaEjC8„ÇÛ8´j,#®›àeæDÀy·³µ£§Bwì:ØñJKËPý‡\'ôy¯ô\0õ\"ã3è.›‘}&:vãÁ!__îäôpQFÆ„]¿¹·&«dÊÕ×p%àèh&¦¢ŸMrãB0Æ\nBŸµ½]F¨RÙÇÆI¤™Þ†këÖì*è×^»ž,J¸¸s–N¶5{F.O”3Šc§Äøüè;IÂ(”þ#í6\0J½¤…mÈÅK²«šÒå|K	Íhü€ZÄ2¥TnpâD•Í¡É^D M !(«Ëì¼\\2¬ûº­œS<;3ïÝ1UÐTS CUÃHðÚÌ&³l˜ªÊz2*`.¼ÇÖ†»H-ùñ¹XyôvØùÓÇÉÙÑ{lŒrm)˜³´ŒtkÄ®©¶’€>“,7/Ê¥â¢\\WRvv4C™;d¹j5¼}dóÌ°U«°s6ÅžÝ*A³ÖnE“/þòÝ†|¢e‡³r“l	ÃÐn¥Hzu¢z\0q	­Ò2ä=!ßÎÀƒsÁsÝ3}è Ðge¶Ê–öì®cÂ`ã%i ª\\ïUß—ÄIþŒ|—M²‘å;2Hv`Jƒå=N/vŒC&Ž rãí7\0¿Ó\"za2·¶¦A«>v1Ž¶‘ƒã”ÏçÏ·2Ås\\ÇDäìã‚§Àu±²Ë†Èæã¨;»Z›íìÅÞ˜IÄ-j.EYCÍ%«Á4¾‰ªÁÞ De€„‹¬±ö‚u éxöd®;äÚÃJçÄš‡UiK‹ßz†Q\n’U&¯ùÈYDZÉ¦{{Ñ}f.‹QDœ’‹‚žŽr\'÷Åû$ø‡¢N“a³ÊŠ8\0‘ÕBð5ZÑÃ=€L[ƒíG‚M½åŒÌ<²kÙ®ÊïX*G*u9Xœ4Œk6é`1Êþ$A¦Þ,Ö @ÏB§;èa·Ñ÷³kóùŠÅ…Æ¾©ó¯ín}òôÙÖ“0c>ðSßwèE\0Ô‹®oèjèŽ}©¬´,¿µé\\lZÜ@FwÎ,¼À’wÒÄž.¦o;‘:¢ZQ(NoIèÃ±s“,N8›¬m„…7º]eÕYÛCc;/7Õ>yõC@?JÛìuåL&jË©\0ÛÛYøôèC‘Êrš†Aà\0\0„#IDATË~’²\"Œ´.#=…[‘Ì]`Åœ\0¡©ö\"\'·DF¬aM¿ÿhf\0e)¡NŸ>éLÌk‘™@qdÙò¥.HìÂãã~¾Ê‚zº;mÿ¾q«Ê2‰çGÚƒñç\0Ápæâ©£6Lé¼¥âb@ÑgYäÇîµºKgÙDý®G´®o\nÕ‡vEY=¦çoEÔÔÕ!îÚkÙW¯·µË­·£¼âAz}{Ý´õ\"¯·ßÂqNŠù†2È$ÚíÔ©}¼î$Œè‚:­Áz& §ŽWÀBp¤†RÌp\';\'œÜ÷³ma&Æi¹‡%’1¥’M[‚f4Ç	òrB$RöÑ˜”ŠŠ£ë¡ãðgrE£¾WÏ,†h›H¿M*+*áÛ¤¿ÈDXÚy“JºŸC°wä\0\'ÑÑ80|½è^ÅÅ…³isŒ[i‡÷6Ûk¯¿@ÆÚÌk	µÛ¶:^²àHóf¨~Ë^{ñy;°ëMZ!\0¾CåÐÐ­Å—åé§žõœÛÔcðÅØwþåëöË¿üKˆ«æÛiX3\'¹vÀhêÅ%®|Ó:[:7ÙÎIÀÄèœíy‹öYv|ñâÅôÁùÁ,:àØTy†\\ÂxÃú$¦Æ“ðü´!&dÕG¨!tòúê›\"6òADõXSd‹Ê	LNzÿ‰‡–Ùç?ÿUÝ“nJ,6LÃx‡+¡5\\ÕN‡’Ë[Ý‡-¡>:Á€Ë,ÚÀØè~®u\'Ãº^<KÒlÑÂt(Ã¶ý@uûÁÓÑ¯Ÿ©h=þxþ·2ÓM\0¤qí›¿äÆ#!	§¾Ýž”9xo =ü¡Ö0ý:n-àÔBð\'Õ/\\$zNè€þÅ´„Så\"gXÂWUC.zÃCÀ &a4Ì·cðc_xîEEŠm\\·Ö)=ûÛ/Ø­Ø%~ëëƒ0	’]Uudr2 eÊ`5Ôjâ÷ld˜ÆIÛNƒ}ÛŽýlŒl›ƒ}[¦ÖÓc0P•74š‰æ#Ÿú$j7Ï“mö<Óìæ›¶PÂ,\\&röšôªO4V€(RÉ‰0@\0ë{r¦S¹E¯žf2ÍüüÌD~&Ñ†{—9º[ªÙ%€•—T‹~üŠ=tïm`w¤®³Â¬$»÷ž›™—Y2›jœWÕ³58—¥0~ð®[ìª«Ö¹’}éÂd×w¹,°ÃŸµ+ç;}Âô¬h >”¶0&PíVÿN×\"!	ÝìP®’b‰v©êP–t	¸>Ôö×÷ðOÃ3¦‘§”¸®:gnÅGN¡Ò|r@JÉ½“„_¢lØ˜0†NL_úÀæ	OHïopO¦»Q<O?=¿J¸«–­µë7,#cH±Ýæ•¥ÚŒ|¼ ù&igäÚ¬BTL˜<õ Çx1ÁŒÊQ^³f:wøt´GX)™²‚b‡‘èo9©Ø ™•œgwÝ²ÙöQ*7p?ÒP¨Y»äz[¡½–ÞÝ·]oe…Y£ºhJV6`.fR§kÛé37 §(60Ã!q‰©¼p eö©Yå\"Ö„rh„ó1‡Ša‰è#»÷Ø¼™ùvâH«]ýÚWþÑþâ/ž·W¶n¥:‡aH‡¥¬²IyÊp€Œ3¦aíÄDÐók€%ØÖùäx7Ã:†1”úÓÍT	vÛÍ+:MNž©8ÖSÛ5Y±ïpóŽþ~É\\®ð¡{ü{l˜ä›™Ù•ó»¿ù¿ºûÚÈOe¤öÍ™Â›âäi\0d²žÃšÎÍ#Z†¡Ø»	‚b²ìálù£Ê•4pQ;xžFM\0^hÜ¿ÅñUì{ô÷ÚFtõî¼ëv{þ…­à\0cíÕm{0_`wÜõˆ}ï‡dÛ÷[ÙòÕ˜Oƒ¯óÈðn›²OE›ÆõMƒyi\\µz‘ÝríUx¤’‘DJ¡ ¬LÅL5IdÊ§!I\"AJ7¥«ïYzD‚˜¤FŽŽy:x)ø‹èû}ŒxS<u‘>L•FÉ£C.fŠšªçÃ·2>Ásw®Pý¼{n‚©$Àb Â‹{->_À+–Í\'‰šÀc\0ëLå¸^‡²±4zž~‰&£s¸Æñd¬âíŠ…‘¬æû«!ÖÅ`fz’é8-ƒÝ;ÏÛw¾õc2Üàñ7q9ˆÒš€Ì•>ëß¢È‰—­Ö­c&èsðßzf|oÉ*ã€([”?G4P%Ý\nÑÓâxßMMa‚ØýÞnwÝM\0¤—(Áˆqšú•P_S:‰cÜ/¼Pú‘:t\\ÖI@tŸš)ªºÕöPÐšŠDÓñ»ãâ½á–Jù˜ÒoŒy­Ã0xÝõ»ý°Z (F#ÒšƒÍzš:–·ì±—·š®\"\0OÁø›zš2dÒõVÏ`’šJßîƒëñ%ÙoÿÊ/ÙKÏ>í„Ä±ÖUYµbµûÓ?ýsû_ÿ2MX@<çK vìÚÏóÉƒ8™¶o†çÔ«Ÿ$ûôãÀ¨á‡îxøä0ƒVKŒ„{ï«@Í\'Ôî¼mŽ•—EL×5íD0¢öï¾?ø›\'Nwž“´ì‡3\0~h2Àà&‰ÝØ:«¼àÅÂÜ……‹gEÆ¥[wáÊ3-Ê—hu•v²í?Þh\nx;hnjêe«åëS€œé×ióHH¡ÎèžÝû^Í·_ûµyö×ñ	{â‰¹HÃŸ¶ãÈHÍ,a?øá­ îâ…«lÓú«87ßN>NÐê¥L`ŽÆ†—üJ¬˜#”*¬ŒFo‚é_MM•Çf!ÇÅAØgz©Å\nfÖÁTR‰\n!ñ‰dJ:‰DùÈ@%”=ôý8©ì<©ˆ¨µ©à§‡öF\nÙI“=õ¥¡\0¬çÐÀ%† à¦É*ÙœDó:ôó¡|èëz3‘–ð(Mq	|Fx¸MO¿IA!‘žexøšÀÃGŸµ—ÁE›=ZrL*Ç€y¦™>l\"ñ× ëHIFÀ‚ì[Y}Ï‹À4¤‹•ÆÏ±Ùõ›\ntü—4_ˆ.OãIæô/Ö–£™íZ×:Š€56Éý&‚k¨â<B4¾ö’%³lÍÚ”ÎÞÅ„Â£A6\0:xÆÝ¡2Å¨÷ê¦æž®ƒ»¢âé1H¡ìMã}ˆB)†«”ÀâˆÈ$^k@‡B†üG½‘û½1²}ÉGs}<ô¼úPQ»õÍÛò¬¸Pc 	üpBQyÂ¦<í‘P>äÓ2ŠªD‡ñ$×U]œUàï¸>Ï^}zEécŽƒþñÜ‚‡Î²¯þó×lóu¹n@µcg3×½žáˆ	Ì—4LÁNFío>«#´AD$Ó{ÌÉB§Úh+a×ßc+ÏeR^ˆžcËP÷HxóÁSÃ¯W×öÕüô6>”ÙŸîÏÛ+ýò²þàÿGuMKõsÛëžméJ96ÐíŽÚR^…e*fá\\PÇâŠ@Ò­b9AÈËŽaj$‡ PD?gÂþñ¾Šbðw…7»ëc+8E×1@8Šâp¡Ýyëdrêïrð—W-àïà·€ú$áLâ¦ÈŒ¢Hë¤õ§;„>‘(z©HÑ7ÀTøÁÓ/ØW¾ù#{ãp—õ³®¥á\'Ç5 ^nŒÃXÁL®Á)²<nýneÀG¤<#T…&ŽztÁúEÏNPªx¦¸lRð½É!>FIuzèêûá…xv¾têFÁ\nêûí=.D1S™\'BÕ «@Æ£\'y€ÈWïGWAp˜É§zv~6§ /ñ …ã£È~c<÷ßë“¦~ž±lhA>Æ7l[Ã0>+§¸ô\0ü.p [ßk†i©áÙŠìÝg¾\'ƒªËŸåCK3ÍgµÜµ‘Çxâ¼*ãROošÖÀ`;\0öÛtÍ*»ñæM˜Ôäø3Ãˆ¼òô>ÉÞu(HˆV“X\'%Æ{@ÏpÈýÜ°Ïœ=Z^\"‚¹’¿­LP¢±:àtàÅJ–àç‡…1¾s¨Œú”#ô7û0ÀÒ}ÖEâR³Ù+;í;Ö¾±ç˜Õ¶ô |\0üÜ©c\\P^‡©­Æýáy\"${ÆA.ŒŸõôä$ /×ðYGdþò•Ù°v=ºç£LiØuWçÚ¡ƒöÕ¯¼êÖ÷Y˜0\n~!û!ht“,´I®1%’;etxEÑ/&nhüù©UÚæMeøËQú7NÔ6··Ÿª\n}åùm]vtŽv»7ü!~|è2@]k¿Òº¢éô3oÄþè—oLœ5Û37ÝMW!-OŠ´õõ\n&Œ­–^°ØMCHï\0UŸ\n‘/\\Ä4éê*&AëWŸÛ\nì„m¹n¿3jµ˜Ï<ËýßüMšóÃöo>J³¿ÏÖ_•¬åÌ‰¦iB\'²éz™Lú}	d;žŠŒÒ<™FgfÐœ\'pô·78ô)6‹oüz»zM–%±öd¾£bœxéN#w\"é¥òœ‘ õl‚§“”º‚•Jge.+$‚J_0¸Ã©yA ¾k9z™¢JeÛ(>‰÷ˆIre[ÑÍ{öÀÏð<\n²šVê«*ï‚“)‹5¨QN›ÚÁfô?ùtðßÓ±\0¡]q§¯âËÁ¦–#œž«¥p=MþáÜèr¬–{×®¾å\'‚¥®ôõ\\—=I†êá+Ñü-B:‘ûÉaä#¨É\'¹hF&Š×síáOß8È\0pž‚˜c²èýè!ße=ôìà”a‘xòe—ÛU&À•FÓ¯Ð¤ïIbL¢¯è’-c·äÞ·w\0¦K\'`¨÷®ë…ž¤¡Ž\0Ý‡ŠÚ)ÄŽÛ“VâÏ°“È$8Àà5Ã™ŠË)÷i  KEõáÅJÆ=A‰ÜÏ­ø’Å	Vsa›ƒÓö©‡²O<x—}íßó§Îuö™O¿Å4º×ÐUöfeÂELÂíµ*Ì•IJ]JtHE8!©Q×&à0OÖÛÒ±˜G•‹²ƒ§*zOUŸxi{ó³míÃ\0’>ÜÁOwëC\0õÂ»»û»+Î7W^³²jt /	î”ÒÒ$[í‹³KõS6tYÁ‰^²¸¬«¬ÆèrŠ*\0J:­£µ(2Ø³ðy‹X\\-¶³¢p:×>šÛÇ˜ÐE#3õÉÏüÃV{åÅçPFù”••äÚ1€·9Y%xø¦ÚqL0ØŽMd+Z»a\n¨Mí9Ë³Ò,«¸ÌúÚñn=BÐíã{5Mò¹¶]×îRph§¤Äãcœ~”l4Óñ\\’IR‡Q,¨¨¨cØÒmk/Uå¢6Ä®joïtÏ«2L0•$9½ñþ«ê[Ý÷ÔãR’Âq‡Þ·ÂI[»^O«3@’\'‰J]]§`©vö\\û½R†9š¬ê¡¿ÛØ:dgÏU:¢½¤±²³%)£^4†Žì¥‚¡Iô°l8ÑÊØº:„CŒM¦7@Ã_6z÷®·§[ã‚)þöŽžßÛ:‰úy%Žqˆ¨#ëSæ75ía¯ºv¹}ê—ïE Ó:ÝÓvñå¹¬L…9ÌI÷¬4gh\'#u° N”(‰âøêõÄbRÞ‰ÒËùJlmis¤ÃÒÉåMÆ r«ÃÃ]²7Éð§ñõl<JÂäÛË×u´ï¡Ÿ—:*!Ôªë\'l7½ŽØ)¦ÊÑˆY„\"hêTÉyÏ>ÒKõOUfKÌ ”²^^ÆÂ–Ï@Iˆº{ »ãñ‡	}|û›N–ÿáû°Wð°þÖ?ü£Îžg/¿ôCéDÆò^2,/k?AP=Já1£‰æ>*(P‚‰0 hõ\'üð|ÑõËËŠ²î[‡œ—VNeßðxhÍž£C56ÖLLxÒîv}ˆÚ\0¨k~©¶ýÜWž¹ô•?xpfüüÔ‘µþ‰êè\\&{×ßXEÇo\'Ï\0§óXäÐàTÿ0µ0N8˜	&p\'ßÑ„´Œ&¾ù€“J(#ÁTÐüN²#G÷Û‘ƒGœ¤Ò&&¢GOµ\'~tŒ@<ˆ.[}ÇL;ó\\\0©N#ÚIjQ6ú>¾(z\nblºŒëï@÷µ–©ÉÖ\0Á>î®Í¶1I	˜Ø»ÏÎC3ÓºJ€Ë&Ùûï¿ßéö’^¼xÞŽ=æ‚Ü4êâ’D…ÖqâœS’éîÆ˜† \'LßÊ•+mÅâr;ÇtQÚ…06Ök“¶àªU«Ð7¤ïEFq‚ÔyÔ`ÔCŠ\'˜Å\0=¦É8SßÓv\0‰§‚j ãläU¶_@ïm?‘xÍL,œkëÈlõ¨«éZT¤æ ÝŠ$T12ÓÂþMclK€Ž\0<ÅÔIvNú*8.	@—\náuÔÔwsÿ\ntØ]k’àFV¼ÈOÙ–e9ùˆŸæ§X,žn˜6¹–J€±]»v9¡øÐš‚&\0´¾jíj+-LÄ¯ä¨8tØMã#•—¹÷¸%³Kl;^&{öìbÊÜƒÚ\n}<Ú›¯¹ÖV/YˆuCæNœøŽ:¨ÒzrÙùø4óÈ°ú™’¼üÚv¸å~p ÄàTOcoyäø92³>„)”¾H\0h\n©˜&¼n@¦a™†$pÏÃµJ Ðß´åZ÷ýf¦ô¢îØÑ±û%ûü/¼_£ýß¯}ÝJçÍ³ÏáW‘2«A/ò’CLrÈÈ’a€@¬`<“9Mƒ58]Ï1~rÒó;XÍ0½ïÛ¼¦Ôæ—g0¸99ÔÔÚÜ]ßtîôù®ãƒƒê”º%ò¡~Z§ê\0ÈBö>YøŸã£ÿùKwfEÅÄ4.JÍI¿j}9&ç}€Y±”œJåUÉ–@i‚‚å›“Ý=	ô|ø9ylÄ£2J3¨©­ÉRðìÝ|Ãí¶ic,†-öò+§ìoþþ/í—>ÿ9ûô§î·/ýÆÿ`ˆÌ e•ÕËXNAŠíÜ	˜Z\0TŽnyÄN“ý¨¯’5£Ó”L€cÄPS_0ù\"DÏVÓ˜ßzÝz—aºTO¶0‚¸i¯“\n\"§ð ^“ý,â§{:H/n.\0Ý2eiõdT‡àñÖ7·’¡•ºée„wÌ\náž9_iÉêùãéÇ)”\'GaI?åpº=ýãg¹Ng$\'¿Ø’Ñ0ÔÊn\"»Sðví4½£EOÄ|ÑŠï¤Y–ÍuðÐ^ÛztóÒ²†;ixt„rv÷ïÛîO´Dz‹Ú-ü²`âûÊ¬GSHe:·t—é{^.èUÄ¤‰ª¥‡\nõo0\"õ—‘±N†M\\k·\\<‰×m\\4\'áÜFûÖcßFðwÜõ¨%ø©W	Ø¸¦EtÏ¨ÍšMùÇSî9«„,yâ®±Ñ(¹ÀsŽ¹<¨Äöì?B¯u\0p¹3„ª¼tÁÎ µXXZN¶F€{eŽë;“ÌËø¸P×aU¥ã™ÃÜˆ¥ì‰±s—ê¨$:8h23›…’‚8¸2|âÞIá;R•\nÍfaJCÈ\0…$ÈÉH²kX×2´ü[£vñì1ûVw“ýñïüºóCþÄ#Ÿ±‡?ñKö¿+q<aØÕþÅW©h:‰IŽƒ¥MÜ„Œ3»ˆƒ=9,Œp‰u¯1”¡Gd£-¼}Ãå$çm9×è‡[¾ÕÞ.ÉËÿ?\0z+ò÷\0<¸sï¥ô]&¸-ÿ×¢ÒF®Šˆlˆ[<;Â¾ø©Rûö7w€dñÆ.°à1½L€›ûÑŒÃb39-ÁÑŠ’1!—ï¬ä©Â#­^¬³¿üÛ¯âi[h¿ñ[÷Ø½-²×?aßyô9ôà^´/ÿÁ—mï>¤åéŠiñÙE·Ùç?q¯ýÑ¡]6wÃµŽÐ^qê¢õhÕÔŽˆÏuÀè®~\'°„USÉÊmû‰ZhO-N’ªÛËýÒ½¶tv<™g½ûö¿Ø%V³d¸žÛú’Ë>ÒQ‰\'«ée2;£»»Çš~EàÕ~õ3Ñ5ûÊW¾Å&è\0Ï³ãäy–~ä‘G(SÃñÞK@;K×ÀÆ­òwó %.Ø2åT9¥MÜÔÔdÏ=ó”¶ùd5dkÈ2<Í­Œñ¢-_¹Ì¾øù›(ýÑ(|üi¬/k­º1…`Skç«ÏYVi¾^-¨®L„;XN3k]]L)s‡G©WJPÒ ÁAOhÄ9Ó(6µøªŠ#”*ÏGÈX”**ØM¹ÝÙ{ÁŠgeƒu+%k[fó&²CíÍ]µWŒ½\0ujeì}÷Þ¨;ÓŽ®Ãîu¸¿ÉÞaÀôq­¿‘ro-ê@ã¼—Ç\\{QØ®6²¡™‹í‘‡nu-ˆïüë”Ëc¨ÿTbNcƒÃ$…¬Yòh>Ö–ÄÔZ©éâyž}Ëòf”»Ixc}7êÝ­N)(1§˜ÀBÅ€J€|<$Ï&ÖO8%®Tˆ&¸‘~&Ù2ï#ˆ}ú[[{žò¹«µÊòÉÈÿç—-Á×ÇÈ·\'_|k\0ÊñDbˆGó+oR•tº¬Þ|}díHŒM¸>øoŠë8îG¤MÇÒô\\‹öµÚÝ63¯ÚîþXm|»öuLM4¼°¯ÿé·ötÿ¸©±	®\0¤âÃŸý}è3À@ØîGŸ}ÿ¡ÊýÙ1ùðf3#C—ÄÒ<[¶0Ûj×§°YèBÞ—òJR)°À²do’&1E`’@d$Nýðy­NLÕØ¯|éOq[ìúbuuŽpI²ï,ÀOþîo£¯ö’Ýs÷­\0‡£-ßéâåB¯ªµŽýÇmþÃŸ¤OÖë6Ä¤¤Zˆ,2[g§26)³I$Òíh\\°Ù)‹.µtY~)FßœÖóbP/—FÖ·Ýî²¦³d{š†ð:Åyn†Â\'Pu:ÊÕ\nbdçhZÈjhd£y¥r/3Cž!”â‰é¼ˆ ;I6k&”5Ò¬4²ß\nü/¦™ôbê­·ßá„Fp‘S–Mª5£4èš$ï¤‡´þâáÆŽÃe¦·8¾”¢‚&ƒ\n#ÓPP¥½i­lzuTªëð‘Çˆ:•\n|¯ÐëÑ¤ÚOI¨,DMGèöS\nÆ£aW>«Ìrjjj€«ŒÛzÊë˜²D^{<-È8²(†R‘Ic\0ÕØÜN\"@v>¢éÜo`CúL‹AÊ9M¨nGr¥”ôˆ£÷W_âT‚ª/ÕpÝr8œ\0œóœÎnqº„Dóuø+XÐ³(—`Õ„\"È¡¬Uï(1³ˆ\0}Åhš¬³>n$¼Ná8•ñyß(I«‘I)H}9\":˜èF€,Häz\'3L	Ÿ²ëV\"œaöØwþÅ–@kü£ßÿÎéReµËÈšY¯#!°Ž-ãch\0“*ð‘Êv5àÐ€LW¯OÃœÉ€D.Ü¹q8ï!L{K²°O@bn)QL´Î‘žCg&÷oßÕö\\këè(Á/8ÇùH”¿•\0¨÷1Ý×74ôÆÎÊW3RdÚâ¸È’Œ°Ù)i±a7Ü´i*Ì£{hT#á=EÆ7ŸEo]\0‚Ã †kJ*+Š	n8øe#Ã0ýÇïçÔ®oªt é&–ãlšªšj»çžûìw~÷ûÂçÏØ›o¼a·ìz$•ŠìùW¶ÛýŸú¬õ­ÙàÊ£$ü/ÔtžÐ¥‚_äõ)àñðwå¡;D¨Ç7èÊÓ \nItÀ#˜47ÖóúølZÃÃè»w0ð¿ØÒÑMFã‘ƒƒÔÔ™Û íIÏMs‰Š*õ}Ÿ‡• Š‰Î7¯ SðD8C–ŽÚÀ™˜ßtó¨j#ØY2¸N£6ª½TA#´RyA+¥¶œ€ˆAí„à0Àeú¦gB›«Nr áŸß»piŒKÔ·p\nÙúv¨×9Ú˜l.ÝkdS‹¶¨`0¼–÷¯ÀEô™bx»˜aÀ‚¥lÅUó¬`F^1uô1O;áà®”–N4AN\"ª±|=\nÆG8;_¯#†éy8X¹!JØ~¨w¡:Œ`Õè{\nž’Ù€^Y^1ƒ¡‡®³z”\n€9(¸v4ÖÐæ˜°eó2€ÌÐ‹¦|ž°) ºKZ„‡Ž\"G\'Á™W8CK©÷&±Qõ¤}LÑ5§h™HÝyÜ7„ÞÞˆ-b@6wf‘=Fðà½wÒ7Èüân7{èûÄéþ…çãgÉ2‘úÂ¯¦ÝÀ~Tqcé5Æ‘OpeÍ©é²Ì¾4ž¤ÿ?0†FÑ±ÕTgƒ¨±%ËÓlýÆNá„¿¹»£ãðÙÑC¯¾Ñÿãö¶ÑA?í&ÞšzÁ0|¸?}¨{€ïºôÓ(vþøÅŠÇ£ÃEEÌ»Ã?Þ6¯ngßp¼µ÷±\0NöXïpµMöK:kô/Ê-¨@~²)n­$±|WCøº$öÃÙ„å8¿ù˜&§¤EÛœ´9€JÛ­žžÒü#õµö«¿ò{ò™\']6ægKv9b¦³‰ÃÛß|ôþŽZð3.]5)¡Ð¿“—¬ü!Â¤·D	4Áá:Lþ ý¨!(KêÅ„“p¤çi¸’iµ`’ÌÓq×yÖ0ÔlTN	£À¥:M¦è8‚ý¨sÆ?ØëL.…=ÈL€qBljà0I†Èx{\\F¤çD2G%Ù.¦®‹0\nvúâZª¡08×Ûä´wõÀÍíæ/ÎtÁB›‚#!4+ªx¬Ÿ\0\"»Gà*òÞ˜XXC\010”IÑ›\'fß ïJ<Õ4ÿ§¢4ö±¹ó‘´‚Îü	!¹õuQž9¨‹\nâg0-Õ@JP$Ýc=”%l-ob‰­ªÔö¼éøpEå)—‰|’©€[­Ö€«­$ 1P‚¡­J;¨\n7¤©«ß^;a¯½¹ÃŽ9Ïõ`ªŒ¼½$Ç¤«\'ÏSù²È¹ÍÁ{øˆdýIÂ>ŠE6š½d¤Åyöà}÷ %g?$ãëBPõÉ=ï´tOû»ßü6†YèXnù˜s+åõè}ª·Ã¤[¢>†±d·7T ›‚GTÐ•K¼C,„ýÐ~Ø2â;	æÑ¶ru¦?+?t¸w´£ç\\¿bÛþ‘§+«áù*óÓÇGføŒ3ýÃÅ]tñ>¦êêÚ:~´õÜcÇÎO¼ÖÚ5^52Þ…Í 6ç*|.â0Ïî>Í®‡?ËŠžfš¦i°ðW:•U©\në\n| \"2‘MÜá¼o-^iøÇ`O>õöwÿð·lÀ9¨!ŸrfÜ÷Ý}—ÕÕVƒ¿z‹Ò‘Là0•Ø§¾Ÿ\0#ûD¦l×§`Lò‘ÀM¡lÔ³)Ä”%E0)>r•êg˜â]D!Æf¨¦èø•øRê¿1ˆ.ŒòÚõµôÜ|§\'šZ°|\"CÓ†¤E>ÀÂóyú@G3?žš„‡÷;DD8Ä’ÄÒC6•Ë®¡ÏÿIôTß>4I•<S›œ×œ5Ää™!Æ}è ¡Wàa¢L-òXd’ˆmJkÎÏÔOPÀoe}SøTžAÔïé±døÍm=MxB×¢BGæWfi9q”ÛÝ.P»°ÅÏû8||ªTÕû\\G‡Y.ƒa«ÆHóq©®Ðöòvv^+ú¸½ßííQ™îÃ0e*ôsBOêû}h0Ê.R\'‡®~õð¶þQg\\ôô‹Ûà€À÷„àNo-‚L722ž \nöPS_õCxÃ\' \"ˆ£ççC.Lƒ³q&!\'6# põU)HýwØ,<_ÇØ©–’_f[ïïf6{ö\\{ö™í±ïý6ƒ¹O»°ÄQýh\\#`\0¼,XÃT2«·CÇiO‰Ø9rújÑvÃõé<Gèhç@{ï‰K]ç_Ü=øÃC\'Ž‹yí–ÚG.ø×éå…ý!ÿ\0µ&«jš[ŸÞñxZÊüøèØöè%ñùsf\'P^ u	Oƒñúy~èjJÝ(¢8Å¥è,Ê˜ŸSÒ“fW˜’‡¬oÇN¼3 AÝá}õÚR,&?Çf·¯þãÿq²C×^}5Éo[_Ýf»ß¢$¾}žÝ~Ãpƒ/8µ^Ñ½DøFª*d2‰%DÈz†JøÙê	Æ%\"¿Î˜ ÄÄØI°â½GÎ S˜²»LIÂâÁ+Ò“ªA”]ä¦R]†\'˜š¤ŽMÒAPVS]›ÿÂÙ3È2uÑ—°!JÂšªó\\%ÙE¼ËhzÉGÑ©“2Í4¯8œQe¹ÍÅõ%¼ Ä`}-°’|úe¼ŽD2·*`<ƒ#Ëœ%å\0V™`)d»Æ£XO<ƒ‹h`7YMËP(‡D£Çð`($ôKx9A1äË¦(MÖÂÔ—ðÇ÷•ÍQª HŠs¸Ëëo¼Æ6l¼ŠÌªá*0€ÈIòèéÆÔÍÅ®aÃ(ró1ÈMÕ²|°MÒaõ¹aFGKØ¹ÎßcîrÊ9YLW+/\0Î¾`CË\n¬ v?†±œJP]=¼¯Ë.›:ÈÐéC6Ðs¥ÜÌeb®”è<âï(eWN¿ÃDö•‰üL$™ï˜†¦é%Ëu\"Z¡:à\nG>GMÁÇ$@vÈÏM·[®_ë¦ã;·¿N²Òn¼~‹=tßƒ.<uâ´ÝrÃmvõ¦…”ífû1ÅÞÂNeêA 6„ ?%…nZêJLbpKœYÄÔ •oë»“Ãé¢­]	ƒ$ÖfÏŠåúuŸ­j«Üqbðå]‡»õöA;ø}¤†ÁX÷‘*yS.²\0&+.6Õ}÷…°ïüæCEÙÙ¡¨\"M¦Ì)C\n~4ÉbÃ€¡T´X;ð„ˆè~!š ¤’ÒLÙŸz62™fÍš½ˆÒë´]‚¾õ7ÇOÂ~îÕ ðZ~6è}váÿúŸb7Üt³ýÎo~ÉÉ7	Wvüp§mÚ8j&C˜jËdh’†¶Ût?Sè8&‚/Ló·F™èŠÁCÿQ~ÇSÊ„¦7ÖM/ï52\nMkgc©²¹@î;\\ºâ­sScg;Í¼oíwÐŒ~ôêJ±Uœ	p¹¬K*ìð¾º2ôûšQ¦Áü;?þ×”=ûâ«n¨ÑÛ…¿òWÍõ¶dÑ¨€³ìW¶:1>†ø»öìtxÈ¨2Ï(.pžÅO?ù*Ö´5Ô^²r,ÜÒé×9Û€ ÄI¨‚¢ô3™¤gÚZ×kÀ~bÈ#†R÷;FY&—P¦é8F Î“@?/“ru+ÎµxO E¯½í}ÉFú¥]¼_¸¹à1—¯Xb¥è+îm¨¶m/>MFêäðc™\\ÏAê>†±)øÊŠÓªØ<–nñlÚ ôôªÎ¤éóîÜF`EÚŒ„§¼Y|Ú\'%d`˜i¼»B½ÙN(mR¤îczûì[ÕöâŽ“Ö¤¦®p8%sQ&×¶jãzròQ×ÌyöºÀçqPœ¤=©±Ÿ6Ç’¹ed½!ÖR„fK(ëì†åqƒoŽ}Ug¿ýö÷È$o¶ûk úÍ§\0pÑ^@Ù›^0×O%3<@[„¡H04\\K\"õíé* ‘JKŠ°Â¼»ó¦RzüôºÛ;+ë.î?;²mçážÝ’zp™_pðáLò$é\'^þG)\0êÍ]ÎlLž?ß\\³uWâcaa)a…ÙþÅ9iË—ÞPfõœ·¶‹¸¯¡Ü,…¿8êó†Åƒ÷‚ÒÆI:	çéÔÑó–ŠêÆ‚Õ›é\0ùè²×_ÝŒâ-ZwâdF9%çÇ¿ÿ8½•ûõ/ý*\'ë¿Ø×þñïðgøkä°r)eZÅ,Æ{b‰Sõ8qòð68—üHÊË^&!“E&T7³y\0•I¨a^<w	YÓaÌzÙ|r¼KÆ¨½…KSÒ-kR¡E•á¦Ö!þ(‹{È©´ÌBâª$;Ìâ®E\"½¡Êª/œu411 AlŸS’É€¨ÇQ¬7™–ÆÒçòñ>jñÄ(ÍËàzÌB(Tz‚½N¡y	(ÉDøÄÖÌBz©„ Ò„\'ïA‚;¾šº/˜c…i`åÎub_yÜñN#ð¸íjiôÍÆ#UŒcÊàú”ôb	ò«\nÃç§Íä£ä›#=.qŠb+Ÿ[b9yévÛíag˜ýà‰väÈ[ÈãÃ‰™\0¦²—@žc[®á@š7“¿K\0o­så:×UÕ¬<&Àñz/ç0´¯&kïwa&W//qÑ*®ÅI†(§ïq%e€º‘JFÉgã5öÃ\'Ÿ±ýG0\\’1¤?(ÍÅ&ûæ£?$ø¡¶Í +Œ•ßåõ4“Þp&õS:`%² Ì©x®Â×˜˜LPiexVJœÝrÝF—Üõ: ü8	´ØÝ;¸>{þÅÆ²a¯=þ½Çœ¨iIQ©ýú¯ýŽ5àÍ’U:ÇSŠÑ_Œ!ÈaOÊš‡£J&\"kµ´®º€€IC_-‡P-X”­]•ÆAž5ÙÕYÓw©º¯q÷±Ñ7ß<ØýFs›œŠVƒ>®€µøwô£óÖT½é˜Õ>‹LJŠ‹ž;\'¿ôswÎýÕôØÞMÙ	¹‚6œÁ_öñgÏØ¡ª|<ÒR®Qº…&áôÄ8‚‰¦Ã>¼è¾E •\'°(ÍTµ´ôT³ÀæQV3ž=*}¦[n¹Éî¾ï^pxMöè~€\no®¿Xe³!§ÿéŸ}D³/þêïâ2håƒK$ß /#5yFÄ1n–Tÿ8}G]#UPoK|])Š(P*Xˆî6§8Ë~ó‘[­öš÷íêõcÆ”ä(ijÜ«÷7Ðƒ©}-qK“(KÝTU€p¦¬ÍmŽªŒÓG¦§ºL™ôwÑCEÄ†BbDˆôOpÖ×«)\'ÓÒ`ÐÐ#ŒCS~\'Ãd¨Ý½Îû#•rË…§ð{ì[OZO;ðŽ˜À·\"àƒŠ‹‰rrÿò93PµN§ÜÍÆ>’ÿæÍ]ê†4!ö‘!Ê‰OƒI‡Ð#yúûºVº†}¨TK1Z^\"Å¤Rj³ªG)Ñ\'´J¹/\\f:Œd 3ŽYBàhÛØ×O%–ø:™¥ªû\0OáµŒÊ©s\0ÓQ|nh¢Ü†ÃK»Aì)Ií[ì ž¡ŸWÐ§PÇ=§­@ûÁÏ`f\0ë±fâ˜B÷Àÿêß|Ù²`/½ü’½¼õEKÏH…‘”kóÁ_Þwßu`NÿU^¼ˆxÁA»+…<î%>(HüK¡Frb‚UiBÊ=U¢)öGèT€fÚ,f0D\nó·¡d}Œ€ìvœž_©]½±l¬§ëRÿÅêöÚã#^xâµ†W[ZAâ{oYŸ¯ìý}t\"Äïä£–^™º~`ÿðÄé3uß		ý—ûn˜9–µ!,r° ¨<Ôîýø\"{•æ6ÌˆðOO#\0Q2Qfhz;†ùo©™¦!FƒJ!àèéLh’bù\'_„dŽÖ§ööíÇñ Ý»âI[¹f¥ýŸ¿ùKûìç¾€br5¼ÊLdûÍhU¡6s³íÚ³™û\nVƒ -óŸ€[— ¡ôÎDwŠ$ã\n‡ˆï¦£ I¡¨\\m”W*Ÿþ\nÀöÊ…e¶jùr›QJ#Yú`3¿ld²Î‚›œ„ø&ß¡×¾÷Tefå‘Uz_N O…©8ÍtÁN’â— —ä¨}ÊZØÈÑ²\\¤Ú:,–-šë&ÔnB¬Á&2†ß%Ûve¶ .\'¼“-Oô!Ë7œóÏ“ˆÖ¡¸¸))Q¶xÑLÛ°i•ÍžŸgÀ E^p0!âE\0_\'3o\'‚Ÿ´ü|@™â(©õ~ÑÇ°P˜’8È\"(Ï‹„‡p‹šËP(”ÀŸ†w$Ùªó*âûý8›Í\0Ö#ÈºýÁ‘g=gÀùš!Zgíèé@n0G¢O¦árÁ¢Ô/Œäê\0§¤—Ôabð/–N£dz;Ákr!r`ÊŒòµiä{®Z¾ÈÖ­`Ît«•z¤ˆŠoº‰õñ1Äÿþï¾ën¿ðù/ÁÊ˜_]VdÂ?xý>% Z’ƒáBIà4œáR¨à5b•[I;:–‰ý ö	CT;ÍˆÐ2X2tÚçïhl«ßzüõ]Gº·ü”ñ)ð3?]\no<þ}|T ö–tno†=UW‹Â7\"¢gEŒ‡öÄ¤%÷§/\\6ÃnìÃFqKÂàpyéãÈžripÉž§¦ÍOÜ#¯TßŽˆø¾p<<|öÿøœ­[»Ôn½µÈzx©mÚ´¹õVW]ãíßüÆ×ìOþìOíç_´Wá—þöoÜhK)A¿ñÕè¼Š5ƒaC?0ˆëÈ)+S#)8Á’\'D$Ö›q¦5²dº‰P¦°ŠÝ°vn¢áæB5üà9då¸ƒå[Ú˜ÄqCGÕ¥Ã*¿¤èÐ+\\ÏŒP.K¾¯DÆÂ~¤‘\\–)]¥r£Ï©À9ŠÔO¡HÊ#ÒÉÉŽ“Ÿ& i0*ÓecAìœ2B¡dJ»xú\\!¨5S¦ËSžÜÖÈ°;{êÉe±JÖ–EÙ«ìÉN©|\'àD1‰ÕMÕæ<Éõ:„äšŒ´#eEÊ×%»¥©¯ÃÜ¿X¨mÞïÉ¦’@¡àË¿õÑGðP™-_M`ò2>MÛ+Æ¬‘Iî+ôU›»ðAQ¥«oF—©ý4…™‰qY\0âù\'e·¸ƒ’­ž`„®k:ÉA6>AfNf™Šâí‰‹§É²Sf<ÌÁ`ö×ÿð4“ÞíÆ;o³|Ðñåß[ˆˆÄ=w_Æ³CÝ½wÊ^m‡íÛ{ÐMÓ#óÜeåƒ×=E	IUF;gz²‡á×g¸Ž{ROæ7½³¨è‰qsÿ™K=u{ŽŒ¿ðú¾žm5¼9/øé³`0ø}äú~WÆòb\0Ôû®ñËApddÔú|CË‹oEýà6\nãÙ‘ãkÓ\"ºÖ£9ÝƒîY.aàÇªÀ¶±¡\"³-_…±IÙÒÁá™¦éÍ‰©ª!ÉRÎAöÊ+o‘ùm·ï?Žiû²…–‚Dzc#Þ¹çO3™ebHæóÕüS{Ã¿~ë»®¾rÕL»nó&u*í÷>ûÙ ½	vìÄ©3d;”sô´™TÆi@!ù)aÇH•Ôà\"»ˆ–ò3›\"9o›¡Å÷Ÿ²#Pï\n1ä™?w–­[µ#Ÿ\"ƒäáT„=È\nƒmâ	‹Û\\2—SV¤Ä4pQÊ7ùÐJã.ØýŽ$¡0=,·5Je6=BÈt‚x*•aúc/H%TŒü%òaFäæðZñÿ Â(x) °Q3È®X`sqãKÎ\"\0ë…ò„ý”þ©)1lr€ß””¢ÀÉçÙAOøˆ€=2‡YêÖÉ\0¤]æ+9)¿ùG4Áo°µ22	+/éœQ2€´Ãýñ{zNÑrkê;íäù*;ŽÊM-ÆVj[:³XTžÊñ\0Œ§	¶²½”O‡¼GF(«•%k¨£Œ}Š÷4N› IŸ³ŸÞi÷Ýq»Ë‡¡¦Ñ£\\±8Ë!z™GíŽ[o±/|áÖþÏÿü/™˜7Ùµ8º=ÿüÀÜvá|µ ,[`ŠÎ¡Ì\"yo­LrÒu‰fmÆs@E†!nêÃø½³PûˆÏŽ$óK>“è	êiomÝ|`ûË;{ßhlãvßGòreàþ÷G=\0:ÐA`}ûG&v¨ªˆŽ-ÿNdlJÄ˜ohé‚ÜÞä¥sX8!Ù¨ý¶Ù±SÖž$2?Ù¬NO6§«ðóÒùsÊy*õœçeS›\\^¼Ø€¡Ð>ÊÔqJúG8“É«á‹ø~|ÊÜ}ŒdÐ¶¾ðð‘EÎ\0½¶!¤>vóBgËX}á4¹Å¹“a¨#Á	*è	Ô,¿0lyÇ—Õ°ÄÇf˜¤TÕß›\"#«í³º¨› 5W\0äÆë¯¦üF(¶ Óh/¹¾ …3]W!Q¦ÕÚÂ‘`E¹ÊóD)Ðð>eäÝÆMý¾d|.\"`¨è’‚B§Õ¬éPöIÅÄ“¬ÒsK4´õ›~§ˆG=¸~\"î²ë“dk\nfsf.´e+gÙ}Ü¶’,_fÖãžSM.?3+ä›Ô2Tv†¤SSÏXú–$•Î\\]LíZ½¯!žŸ€™@ë‚m~þŽ‚œND©p Ã­‘jYÄëäë­Ó(ôÔ2¡¯¶êš_›5ÝÁ‡¶‹Ô„¨`o8ï_`9„%„—ä0TTÿíTcDùOÑ¯ŒÝI5þœÝ¸ù*ûøÝ¥vä@/™šˆZ[ŸÓ*ÏÇjô>+BÈá±ï=jß{ìq:Ïâï¾øÂKT!ÏÈ“99IÈ>Ó3r)á¥nÜF6¦ºØÜ›±kÈÉè*…s™«$~ÈJ—äØ†…ô¡S)$F»/UwÖž¬˜\040ôbCSß·wg~ªÛ{½ÿà{f|1ñ„‰½êNM…äühÓÊˆ¸ü˜ªYI1±±RØ0Ù`¦ÚmâÔ u¶ ¼ÁŽc\"*]²v‘°r.½”4;Y@e’À´…qn:YP˜‚a4ýš”h¸¯­Î’ñéçžv¶—ŸþìçmÕêµö\"\n\'q²DÏ?ý»í¦…v÷­(ùZ	¬á€M0&ë E¶AêÃfEöÎTQBbMHÙ£Ži(b²ë`W›o §Ýz[¬@q¡îûàóâ]0Ì!æfg ºPˆÙy‰eÀbPÐ¨mé·sgN»fñ¢…ü¬Ì£ä¸6Bfú¦HOqÆÌr \'+ázS§ßSŠ9wšÉr%n¢ƒé,ž“ï`7›>JÇW^~“¿ŸšöE;uqˆ.8ª¨Ð„ÒJÃ\"<apÒ¹MdëÆé£î\"sÃn€’5»ÉL´ÀqÅ£y?&Phó1¤Šƒ%³fõR+ÍMtðÄÑ\n”m.Ðšèß—eóçÏÇÆ ð2«Dy-ŽzjJ&§¥£ü’hÛÉœ;˜~3¯z„ƒgš{™W°¶fi;Â¨S–h†3©—Ñ–<d{êõ)<Ò—#+ÔáÇ×ÂÁ5Óˆ½éúkí{V9ýŸù‘ÕÙg™ÀkZ›ªíÁû?»¨Ã¶‚=}\na\nÚ\"ë7lbTÂëéd\nü*1l0Kå4R?Z`}¨i@Zrj\'\0§\'s83qîoBÍ¹’Ã³\nŒ_*eÉôj&C\"|Ý5ýÍGNvíßy¸ïÅó•]Áà€ºŒê|¤ËÞÿnð24&psÃÚÚzýûöMîÌË¸e©¿4!º#6Œ^ÓÜ26føtöìð™«3‡—*‹y:Œ>èyyþJ¾È)?¤R“²˜\"ÁÞßA9É¤.—Ó¼„EWF9ìîùø]öÜs/Ø“O>a+V­E™å!É*ûÑ~\06®Î¶>³Íxèz¤÷ot@×&´—¯Ú€ÀA€S:\0$K4š`Iš%J”›8Ò¿\"q™ZÓ+]‘ˆÇ-›!‘¦zÈòPÝªê‘êbc¦§$b%ZŒf\0®i9Ê\"-àÏÓG¬C ÏJfÍ7\'hè’Ñî%Øš¿ÓØu‘Ó`4KÀFÖÛ+ÛwÃ+\"+{6Ž:Á#»€©:ùÃ¾=‡Ü`©…i°¦ë¤ƒÓ€ÍcDÄÆ¦{RìdËm¸ç]j\"{>9Ÿ¯G‚m{‹Iëq·±SÀè«®6h»SÐË>IFÇ€àÝ!ÿ\\¦ª÷Ü}àå^{}çAMˆÂš´Új–ˆO{{–¯Å?j•5µnb«rSH;Uß\\™ÑÙèÐˆDØ$˜ñadðÇÃáê\nï©Þf½eÃ~ˆÉ3BAœnÙØˆŒŠr²m!rj>¢rp¼¯»ú*7•ÿÁ÷öØ¥ó\'íêÛ·Øu×\\COnÖ\0­vßÞPJ÷?ù“?áÚ&ºèƒÖ.ë\'Ç^€Y2LÖÙGÛ“÷J€CPÊæÒðSeàF6šh“›’]N5Z^ú ,’x»ÿÞYH°¡@Ò:Ð;Úq¡fâÀž£}Ï^¬îCZeo°ôÕ“ü·Éü‚Að£Zßß•ÁOIM°Ï=ÑÙ9zðXÏKÛWå•\\Sn7R\'áw›°ti“ßNÜvÈå¬9óèIË\0áÃ‰O?ˆ(¾p(e¨¦u‘Èå\0K™´ƒ{\0‚>„Ìz}KXÐs¬Y¨ë7ßa[_{Åþú¯ÿÁ–¬\\n¿ÿ‡¿osæÎ´¿úÓ?ãõ¨Ãw­Zw/SÂàë×®°o™cÿûOûÉŠÉÆ hPþiè0AsM4•Ááô¦¤q¨l0¡×p‰@«¦ÖÇh:-g†Ó—£³QþUýVßrÈ‰r*f!\"Ó4¤pB¥@¸Põ½~{ëØ%›5-]ºÔM¤>Œ	}—%çZx³F2¼ÿõÇ¿ç AÛßØIéØ‰Þe=™Ð®ƒûÀ¢1˜¢’¯¦¦²ðTtô<6œY³Š­6Hr’ú\0î¹ AUfØþÃ?ýÞ2—@Çž*x»¯Æ`(Ä>«Æƒ·\nÑŠÊKUv±¥—’ÿFÔ²çÚÁ}ç Œí¶ÇÏ3-Ç¹ÜÓPÔ:¡Rš’Ew#	‘L×0*.Ë±q\")·5`ê‡oë‡ù‘ž•Ãû±	YHj\"Nö¨áøÀÂÖMò^¸ÿS\\Ÿpœ+—ÎAvëhÕvlß6ì6sl6ÓùÓ\'zìûßþ¦»Þ_úâ,fç®íö7ùöû_þ#»åf‚8\nÙ/¼Úî\0Ô;qoÛöú[30Í\"´EQöFø\'€óŒÉòz]ƒPõ¦9üÂCŠ„£Qm±XyÊ3¤lªtFèXKGË@MMWsecÔÞç·÷<}¡²{¦È•Á/Ø÷ûH‚ÿ½28Ðþ*åõ÷¯ÄJ!^2ÊpÑË–ü¦‚GŠÒ×¤ÅŽgG1áëlñ£—7bßúî!ò•ØtÜ‹Ì\\l=þ$«íA.Ÿì+3“ò˜	[l¸TóÌƒ¤iÇ&’vÙQH[?Ô³)ù“Ç2õcÎÂÙˆ&,°_ù4Ræ[ß ³9êp\\½ˆ‹VÖ4¢Êq­}ùÿyÈMmÿþŸ^\'ö:J()NÕD€Xesæ-%¢L,ÑŠ šRý”Ž~™çÈAŽ×`šZßxJJ*ÉqL¹£‘ë ÃMä÷4TeÒ=oáÒVRRâ2\"A7V¡˜½y]¢U~ç‡\' Ý¨Èä[SK;“Pûòg×;C§_:ì´ç.˜eùŒ ;;PAe»êd~Ã›mÿö£Ç¶:ªpð”S°q~åw¾`n[eýxe%ý6&¤ÍL´—,ÁFôV¬‰Ä?±Å•Q&Ú©Nˆ\"8ÑgÙànÞ³<çõUPb§RÝ^ºx¾ëÑÄz@:€—ªj\\_1‚ ,s¢h05¹;ZdºBC%!¸7WoÍ5¤ÔÂiö¬\0ŸJæ*©ªn¼fbi5Ä\"Š dÃb÷l¾îjû“ÿÍ—åðWù¯¶ãÍ×¯´N0†Åùv&ó%¼ÿ}{÷ÚS€«O!jŸÎr”PÊÕSþdÖ*.Óð†Yƒ²í”‚¾Sr¼“xƒB~9P\n 2ñíàþ…aî4rxÍ!”·»|yøZçÒGŒô_¸ØÐÖ;œzúõ]-;O\\=TU×5ÅS%¯Î9}(ÁÎÿmJßÿ. Þg0C4Æ­m>;\'àã6úFG»çæ¬¨Us§×$Ç¦äfMXeO(Ð–ýGFl÷ñ3è£ZlÞ*+Í§tD¤€Qšeà<ç4Œ/a1:úsš¦*°ø€¶DR¯eå¦YŒmþ–®†-\0__±J¼D¼ïãö[¿õÛH×¿e=þ2ëd4gíÇ?ÚoŸûÌZ»æª•všòí4l…YdG÷#¬!K<øÚVË]º‰¦¿Œ–ð£ewL‚×‰§\'‰4Ó ª2‚GD„%²Ñå×¶‘FšOú}xZ;ª§\n+¦¾T0Ø³A2¦ãˆ¥j²96ÔÎ¬Ž‹3)í2­•÷?A°SZ8œäüâLOûŽBié<2Kp“É€˜—\"ø9Qˆ©T…5¡•	°wéŠ¬(Y¡Ã…GŽÙúëçØÃŸYe•TÈ>²®QI¿yÌ`$µdÁvˆ9 Ø}Ë†+›˜šÇ!\0OÚÀÈ>²…Uj>*}ÅÙÝ¹ï˜ƒ/‰-Þm&@tÉùøÇ\0ý¹1¥”%†©îø°»Î…Äƒî¥–‡¨#u´Aå#˜åg‰-ÕÏDb×­X„rÄNël1t¶[¶\\ãÔùÓÎ[f’ÀY	@þ–o‚Z¸ÚZ(ÃŸxì	ðŸ5Hóƒ¹í.®W$ë¡‡ç‚uÃ:\nKrDL¯oxÏŠÉ`%ãQ•™Ô\0‰R[<aÑ(C(¯ã(ƒ\'j™üVSmDcd_FÆž\0Ìf©´ŽîîáØsÛöö>uàDom}s¿Ö‰nzåñßjâû^iÜG½¾çw—ÂÁ\0è²ÃžžÁ‰ý‡ë\'§Ç¿?1™2·pbIz¬?;*yÚ6\"œÀjíàé‹HaÄM\0É\nÇüF³á	€ÒFi\'A%ºÜ\"=9o^V©\0Ìü°à\"ùÐË¶\\wmº:`²gƒIõbO?õšm%fb¾ôÈ#Ÿ´n¼Áþîï¾bÛßÚi¯L½d+Ù8sf§Ø·ßl­Æ8\0v7ßp­ÛÔ=lú!WÉ`{)g7…t§/Ü\"ÁèˆH !‘òÍe´*Ó›D„[K`‘ägÇ[õ´$Ñ$ÜZ;A]K§æÂó^„G|§¼\\<òÄ¤5Âú:ó,nª˜!×Ú‘Ôê%ØwR†ñ~S(3[“óÍ‡úSÌÅëóìúæ{œ‚qG&Kð|õÊ™5\0å)qa™’‡ÓàF0¡Ø­@7E êé´~¦²â#Ÿ…\\ÝÐ\n]¬Û*ëëíL]‹%¦AÝÓTZˆj^õ¸,+hSHµfhUZá×i	›pMBéõ…‘Uª†„›nyŸ†\\.:à\'ð\'†’Èš}Ø,øGúmfI}ìJí5Kìk_û¦í‡c¼h^¹Ý°!ÏŸýÅŸý9ŒF[¾d¹}ñW~ï˜Açè³6Ûâ¥«íw~ûË6³Ì“0Ó´÷`¯½òêP$+œøCQTþ\'ZOIñLÀiqÈn˜V^¯=ži}ð›P0•¾³¸îµYYy òÙ¶xYüTDôÐpcKgû¹ÊÐs»ïÀ±æ¾Î®A‚Ÿ|ÿíû~WÂÿ%°Þ¯Þg°V˜‚-ø,‡#SRâ¢—,ÎÎ¸~cÆËg…­ÏÏˆ(ñ+Œ¥\"‹joín¶{QÊíÔ›3cž5÷B)ƒ;Bß˜0ûð}¡piÛ1¬`ÍQ–ÆÅ…ÛbJÞë× $3‡ÁS]ýe^Õc?DÖèCÏJ·/ýÚo`XTŽÑE{z”²¸-[¶`»ÙoOþøi§o÷‡ôe¤êclçïþùQk…%!×(l#ô¢¤t¾%”H$uM“a+Œ 2åïµ£^³Ò±Nºdg1Ð©mj§”Ö{\0vC‰¨É¦²h/Ùª“ÔrPõ$ÁŠÀ%ÍÄ±.Ë&\0`vTÓÐNFoWmZIð™&:a>äff.„{¼Æê«ÛíÐ¡Cø—\\4E»æÖ-ƒ«Þ1ðS@„bÐÆB-\'öCï³ûÆa\"n-ÓÙp˜1’Á÷¡{—	¸qŠ:sÀ8ý75®\'üŠº2ÜnS¡aúbÊÊ•EIefY1êÒI˜M¼-iðÓ‚ZrxfMÃØmjºïŒ+± D|î’ùLpGíÂÑ}ø¿dÙüÞor˜å“qš}â_b8n7n¹Á\n‹òÁ„ns-‡ûî»ºÙ\\ .°ƒ°O¨Ä~`6ž!»ýN[´ ™×Î$sÅÙV0£•vüÄ!Ú\nL¨98¥Â-åè)‚¸H¨nà‚|Àw”õÉOšy9ß±(e„±Õ‹ãlÝ†YV8#Á£®áÆöŽ–µ#‡÷î}áàñ6,š…ötO¥oðCÿþHJ\\½W¦÷o}í¿K\0ÔûW\0Aõßõï(l£ÊgfD]·!÷†•£¯O‹ž™›ž–aM>Û»“Òs#ý(6RÔk›œoc¡9Î×7úMAÊ¬)é\0j(Á×FÁ‚I@3Œ AƒÊõØ4Òoë‡Î–]€[¼ÛZ8Ÿaœî6l°;p›[{Õ|€°;Ø,CvìØ1˜\0»(Ûbí¡‡²Ï|æ~ì&Íþò«íåm»(U›(5áºM£dLBcp„(‚€M°êo…7iŸxø6ûø½+Éôj¡yìà.[ù4½ÔpBcC¢rïœÃdœ4	.QJÐš–¦:K%35o*·5.é€ˆ¿¼ïÉI 3è\"—Ì²¾öaK/rÐe®Ò¬ê¢w‡Ä8ÀeÒáX(n²êœæzˆn(`Ý€˜8üaJüxþ’Ø×%“Ú•„œÅA2?(aúi)+DÐ«£ï9EÖ$_×Yž/wÝv“­_Gpíl\n8ÊN·o<¾0B¡Îe.ÐsJÍNJHMøÐxJÚfçÏñë¿úËöÙG–ƒ4û‡øŽýøÉgZÙ¦@î×m¾ÆæÍ™ëÔpžüÑ“øŽœ·Q`9¡¼¦â¢àSxNÌêéYFG¦YW“¨†dÜ~ú¸.S%„_Àæ1îô1°±:é)àCý]^øp!}V˜Úiw\\n+‘±/.Ëìè½ÔØÞxäìÐö7÷uì®ªë‘ý“/Ø÷ÓPð#Muû‚á—X×!X;è(ªq‚1øß¡ÃCc!gÏ¶„ôöŽ¾ÖØœÓpãµ7OøG¥DÕç¥£rÇ-å6+?­¶cvèÔ›Ð·º2‡ù¡Îk=AQ.„‹e3¥&ç°Á	˜L#G˜kŠçÉ™Ø¦¥æ’ÕLZÙŒ9vÇÇîqÓÖ«þÕ_ýŒŽ9öéÏ|ÊQÇJ\nóÀ´Í¶¨„ü¿ípd÷}ßÿÛ+v±X´C?´;\\áy<òXŽ”HK\"Ë´Ù‰e;ö(ñLÆ“2g<“Ø–=ŽcOâqä;qŠ“±lKq”¨Ó²ÙÅÎ«¸†+\0õe-Ø^óù=Ü;=>.®ˆ¤uÔ=j €ÝÅî»ßý•oùdj”œêçþéÏªŸý©CT¤KØ\\‰ô.Éýiƒ‰T2\0–¸¯ˆô­Æë RH‘LP]\0›¯‚à¶\0‹ä\\À(<6Dû\'Y´ÛIÚÙ³cˆ9cN›ßÍ¡JH“KlsSQ‘…éaKèZ<š«1EM¤Ñ×Ú¼*Ú;Ä{f $¸-	K·³@hâe£Àa›lò±A¥j®Ö—X\'Xàp¶¸^PÁg¯ÊS2)Î+ƒ\"\"äÃÍ;yoC?3Ê-j~9Å+ÃWdgbµ/Ü*U`È·“÷)ºû‡ìêsµRbY9Z:5úˆöŸ´Á¢PÑÚa9ŠD+#ãÅ(ýð>¡žúØ½Œ	”fMõÌWÿ/÷Í¦žøÇµRÉFC†/üùÔ‰ãÜ†SýÜ?ùy*qÛÚ¼šžšEË;Ã¬Cže7œHþ^ªi¿_Zï\"³\\ª\\\n¶*Ô\'äfIÕsð·ôñ³n9¹Ìyå©Ïªcauø`§úä#Ø†yqâNO¥/ÌfæŽœ/ÿÍß|{õKÓk<•`c§åÕé.ºÌíŽ?ù“ßi\0(Ù¸1¡^!Ú©hl33qÛÆFib1VzôP÷c{Üv•wôµ–›î»ÏÏ&0ˆl+¯Ž’qád.˜¥Ú°Wi…ëâ\"[E™ºÈ“•ÄêVHâ4ÍöNfvÔ¡nÚÊßü÷ŸeÖ‡â‚…€80ÿúg?©Í†ÞxuUý>†«{°ÿ\\²}{ŸfþÔ¯µYçOŸP¿ý›qõéüó`U\"2mœÄ)ÒÆzÄ4=Y‰êÏ¯©ä¾¡L šÛ†T¯{/ùÃ§AáõŒvðvüÌI7c¨n£ÊjÈ¼¸ÊHÅápæe35‡û÷‚úóªHGP=õÄ\'Ôy*fLEcky–Ð6‡P_p?ø³hI\"ír2l¢Š •Ml•Š/M¥Gí£lPcd{-fžU8la–J’ƒ+áàÁð&Á8‹GŸÇÚ4wefw/ñá‘>uÿÈýPM¢d.wcCI}ù™Qœ°5‘Å\nÛc\'½{|)…á)ZïÂ>Mq#å‹²2ËÏ2sQqˆ!‚¶–Œ™ãB}’gX~Øäìøûe1¶}®á\"™ Ó\'°Ó: þÁOþ#µgï0!M+ØV}‡ð-,é>÷±)B8¿‹9§pÚ_x!­ž}827¤™Ú_1Ïl¶’U9tå5ÍÄ”T8[DA˜.Ožtsly\'5µÒžýÀ“Ã¼3XõzR••d\"}q>3óÖÙüóýrâÍKÓ‰\"ºw3ø5¾wßo«JðN@ýÌÄèkÀwµ\"ÜäCP®­¥mo´ÍÌÅ_|èàà‰Ýþéõõ‹‡¶ÕÛî}°]ÝÓ©â0£©V°œboØ´ófÀ-!äðì¨ð*€‘8O‹å»Zƒ¸£”Øæ’	Uƒ3÷Ëÿæ·´@¥]»vòbÚEå‚ÁèÌ$ñ‹ä3ÏúëgžaYò¿ÕÜC>ó3?£>÷»¿¦.]Š©¿áÅô¿þëj™Y™´Q*¥Š˜Hí•Ø|–ª;©®ìpÔ\"¸~¨V{0råŠ`~)&*‚t˜;Ei-eæ˜æ~Ù \"ËÏeÞÖÉŽ‡]”™Vuî|—ß8Ä\"à_þ³§Uaõi*\\¥žýöœúÂW¾©€\\˜a«›fƒYYÒ¾¨xÖáõ—•d>2šeþ\0ü6¨tÜ\"ëãÄ} Ì(›ò(`.gÔÒÉœù×[ãç\0ê\nû$²7–9MT‡û÷Þ¥~á3;µ”¬?–	ˆrˆyí~3R8·ëã:d!\\³7A“+[o¥FYJíîS§ê‰¡ëf¸	~”+U¼ƒ*¸„½˜´Ü)$‹/~•ŒÍA_Ú£~ú\'>áy¯zöÅ×Õ¿fsÿúëorö556¶›j¹†vwA]ž‚<Ï2¶WgN_P§!r/Æ˜ÃŠí#ï~Òd{àÊêLjNŸ¯Y5áGé‘üjþ&yìƒü.èÚ\\ÄkpçÔ¡ƒ!õ÷~h\0Ë0G}=1›;y1µ²²n¿ôÚxñ¯¼µ¶0=“4.;Œó>³·ßGyi‚w\0êôë €Ú|´Èxž\\¿ÍQ„õÿÉ§žì(;|K{ÜÉ®\0.¿ú+SÏ¿¸ ¾þÌDKÒ~ú©vvQ!öÂd†Ä<®.4‚EN§è™_•JTˆäb„Ë¯ÇÓØÆW¯`»_\0 ÄãÄÇ|ÐGÛœ¤M‹Dš´xÈKTj¿ø¿È°½W=†’à‘Ãª\'wäìÅ$b¯áD}Çã-s#L¾H3N3%ôÊbê03%s£Çÿ”ê‚·²JJ^4Ò‡åúY(7Sš}}	`É\\ÍÐDJ´Ó£Û{Ôýw7)¨\n|¶üº—5zÌÎáA…{;ß¢åó“}X‚Ý¯þ’œŠQafvU?“€éARâ>û«?©)Và«¯~cRýÞý7ÕLv22aèTCÐF:»›Õg~âGÕS´k#)ÕI\nU¿ûŸ*ê+ßú¶67°Ì!¢L,hÔÔ…	‚ïwj6e²ð÷çþÎ¨Z\'¶CA[¨ªÏ·_}IýäS\0üd”€–!¨þ‹€¿»j~Þ Ðø	¦ø›ÉDrAj X¶ýÁC¨\';¬îÙG89ª“o± úíßúÍP8Š­lµ…v3=5¯Îœúï\\_Ì\"pš!R¡&&ðöT¥\\¤5§Bã¹@*#“í¾,®EbçÃÈ@ÎÄ#fn¥Õà}\\íÞcS?ú÷÷ó™7WL%W–3ñD}åôåÐsßziå¹3ñR2%\njm¬«KÛÌßïK[û­ª»›ùþ€ÚýÕ6XŸê¼@½4àµ¯¯§loŸ¼lÃìà/?ùñÖŠ+â:ØìÈuÕóG÷ìï@Éñ°zû8Ù!ßžÇUæ}VšY×nˆÑÌš¨$òŒc¤­-SÝÙ dx©`äÅQL]Ñ¬¤$”I>‚8|¼(¤j\nP±ý‹Ï}ITPá¾¯m%[Wrh?®þóÿ5Õ¢bòGyL=õäh>GŽaóxL]F{ÛÛ?€d‹×/ð(Að®.tq%‘u¸ª]Ì\"@ÄUÅ+}9\0#v©Â{ãµ¯‰ùå:)ˆÈy¿²Èi\"}HæõB¡…¬¢ðwDÕpw‹ºˆƒŠ›ÛV¿JåÓmÆ^òá„‚ÂÎƒÏTÅ²ð×Î¥³…Nh²œ‘Mêp¡ÉŒB¬îiõ#÷KQÑ’iL…\'Ù)1h0â7(Ö_B!ìjÑâ7ióÄ’ä°°hHRý9©èB¿“Ü;Q“œä\"Pånªí—%4‘ø\'êœ«‹ò€Zc;ž‚bÁõc?òCÌ_i±¹SS^üÉù<œÃµ9á¯}ö·ÔÞ»{Ø<kãC–dJ½ƒød!ŸÃMfu%¥EhBò?Þ\01Óìí7[m÷/Á›]\0Ù†œx°e«”—i…çpÛN¨±ÃQõøGºQ¡ú©Æê+‰µµ\\Á¶vá²müKß\\xîÜ…5”xZx‘xúâC>Ë÷¿¯míoè¶ºÌ€úYH!\0\'ïŠAÏü}ø‚¶WßšËÐ–ýùÃKá…‘¾êGîÍGÃ©€T<.ï6Ú:HÏÇÐ·N%É—Gy0Ì‹ ™³.¶”9m@{*V)¼h$hÝÉ€]Z.Í$THBtpÀ–ŠLt«5*:»¦-îh2Ù=jrJ\"\'cê÷~çU÷Àv÷Ð’ÝíÔ zôá‡Õ†÷WQ€”¬€\"ÅÎ°Ÿ ŸV¶•ò`T¤%4çØRj!åòêa>”ê¡¥@ÚKK.í\"¯O,g/k‘\0b–e„¼“pzHeêA*½~uêt?|Å+¸Kg	ÂÎ€kÔÂbÉÅåEzPÉ¢;m\0”ùÌCÈÉ†»ÛU? &À*€\"^Òª@#Ý…^ø4ŸêfÎ0÷=ÆzvzFmhÚàîgC>\\Ç||A‹háBii¦¬* ÕÍlôCŠÎª(¸}`‰Ûkª‰!`\nQvwš\'žü8¦cõgf­îãHÛN“«ò ;…Ö›¬ÞQÎª]£³ˆ5–TL\0.Y‚qXØ8b—åÑRþâ$¤=0ñcäFŒN–:4änl×ªl³ó¸c{êËTüYxš¼&Ã´ú~52êQéùÊåùøR¾žzéxá›/¿µ25qqåü5ðÓ«?£»‹~×AÈ;\0õVx+¼Z¼ÑþæàlÍ‘LÖüâƒ‡:æz¶5}ºZ]­–Ö›<¾.õÑŽ@ƒpÐ’Î¨7ÞÂåwAªÁNB»»˜÷´ÑÞ µ¥Ú *Kc·zµsžO#$Tyáòx79h‡~é—>°\"]c>&Q2§’©Ä@Š5ÖÈð>M*ö2Æ/½üIqjdçN8gûHëÑ6™b/÷£CÃä³èPc‰3	ooU‚\'ÐGu…¶R¤|y´¹M8uîÙ¹C«üD•Ù1256ÍÌ,ý”|ÂÅÐd9 †ŸbŸ…“½ºgÏ°:zd‚5ÕZŽm4·æB:ù2Òn;â’„4Ús;³F‰\nm¦-ß®;*M+ ‚ŽØŽŸ•«îÁàU‚ƒNŸ¹ç1¡…€{1,ä³EªÀêŽmÊ	 ‰ïá@{‹!GÄÆ:»%ÒÊÜônMÂÖÂ¦ùàþÝÌåþâíÇâeïÞ}Ì/#¸þ¬3«Ë³dÈðøqo&TêmB§D‘söÔi–(KšOªæÁá»U5Ês/Qÿï+ÏR-F4iTy%–ÙŒÐ…äÍãZZ|™÷	ÅFë;dÃ¥Íû®úR™nÃ÷Ã·/Ï¬’[ÁÊŠ¨„¨-÷DÔØ(cxzSÕÙØb~jvuõÊjó‰¯¼´úW\'ÆcÅTJèôZ…g\\x4?ké±Þ©\0(Ç¡·ÂúÑ¼cöwõ9jÂkG(>€Ó“q@ª:=ÒŸ>|Ÿï©®6ù;övo0êîñ0k‹2\'ª¯|õMO—Õrj™y T7@èEE\0U…ì*êÉwÀÇFpºdíÊ‹ÊÁ÷¤#µÓ¢JÜeW€q‡0³Ú…—èE;ò	R©³EÉÄxJå•W_×zÎ.ã$WÀsddD[XÈ#—°1ÙL°@‰¢éÕ(¿O¨:â{ØI‹¸½—ªU\08¤á¤àŠTI¡Vfq›F©à7ö[ij’Ð\0ÝcÃ@‘š¶ržV.—f´ÝbŠªeó8’\0Œ‹vPªÜ„qi¹Û ­€ÒjÒÁ2]@vWS}pëzZmêž»v©oÿ¸¼6Ie}„-©8Ì^¾Ì×û5Ï¾0¥ãáû÷iY»áæ(ò¼aÕED€ÄA\"3¾Æ†wQm\n\"tö\00;FÔ›\'fµðy¡àH¸Ô«¯¼¢…Am, ûmo×’ØvíêÖÎLòVVQ`\0ìUBÎ3Å„ö¦$3½*nÌR	Ši¤¼I¬,Œ´t©ü(—kR2‹Îƒ³vÁ‡ôä$3¦¼µÏÎ.ˆuUTí ª–V“sÙ\\¢¶¾´îZ8s©åäËo¦^?q*Æ¯—þ@?së«o{uWÿ;Îàà:ß»~t\' ‚Æ…ˆ‘®ÿ[ÆwžpÅ®,®Ck(]™üÙ=wµØ{$™iõ;Û[ÛžžÎfÕÞ|—š¸”ÆÖjI_ºE^„7CHLŽ6ÍüSlš|´žOHÈD¼h¤U®Õ0ãäÕ)*/LYSëæ,ß/ê‡‰‰Y3ýâ½r[4/º\"‘ÐM(d/†I’À6Ðß¯–ìÄ$tüø­M”l^)R|³\nT“\"›Æ‰¥ù›„ìÈpIŒ™´ml«‚€š^Ê$’Kj•Ioÿn5ÐëÁ‰ä~æie‚§h¯ùZaí¡I$úVXÄ^ôÒe¸‚y¾–Ç&!îÛú4JA‰¹@ŠÝ’h­á÷¹pYÞ3Ö§E‘N/ ÿ“^“I¡‡¾ññq@ëòÃÚuïÝ³MíØ¾Yê;Ÿëò3iW%»9½FÂ’ä1÷s&¯¾}‘C7‡ŽÌü-8{±\nïÚƒ\'c†Ö‰	kþf‚\n˜óafÛí¦j3¶4ÃrCdˆÌïä¤á„V¨\0eù”çË!ù.Ú»©$ÁIªðÅÉ‡F™ÜãòêiÕ‚o9ä‡îÔÕ)¢º{¸Ž#AˆÞFjv>y%ži9ñÍ—ã/N\\ˆ—®,%‹Ð´ôe‡þÙÈñÓ·½w„¥ý­€]£ËÞé\0(gr#&¼„fÚ€Œ«+\"bÏcÒ¹qnzºåâÇG~xïöú=W¼§R›óÜOÂ‹³½\nJo^™ÄWo2/ïü¹œ½ 6ZWé˜R$H%Q£o’ÈË\nåDˆ’-O«\'-±©˜›½\0¤X<	ddô.Z®\"mk\nmð†&½ƒ;ŒZw`Z5Ñ;˜ÙIpOG{X{§U@gNŸ×ŒEEb¦…ø±Ž_„™Ýð‘‘<;ÀOM³:ÇüO‚»…4,›ØKÉ	‘C¹ŒƒË\"‹:j‡ÎŽ>uèÐ&\0IT“šm»Dq\n\0Ê•Až$‰j6÷’t—ßÝ¬¥·W2™a½ÅWÕ€í8¡<þ„jô2»¤½fÎyrbQ;3­i|Ûèy/ žI@ÌÎd·L€\n\0`‚yÙfÅ™$älmmáu$gÐÌŽ¨Ç¿O[\\ÈýåA~‹û´Î™´ÊÏWbL×0aiÁbJøzò† ®³½•iáOb`093Ž£öXpÅ/ÐCÅ\'%i{E‚(Þv!•_}ì²aÖ$vZ®	î(@høú´ãª»‡¿$y[†?m•ýˆ}îä„íåçÞžŸ¸¸RÊ‰Îñ;F:èÁÏZxÜ\"\"Z\0¸y`ævX?FcE¸åÑâÎk[˜OÂö/ÖSå¯$·.îê·Œú‹½ë¹m-½ÞèW#;<jôLJ½ydŽes²eœ0 Ñk±o¢§CÊVÅº„ˆü\'<²M¯?ÚdI¦‰/l¯„71[]ÆýWëS©ZØºÖ¹nÎŸ¼`‹T\"’áe#Ë‚YC{^›ZK*–V>W/À)$i,ž„CÈ×Áåšù«—EP‚a…Œ5x,r[>ñ”ç?é³æÓjúG´kE@ÉÓííŠPIÂA´±XtÌâV[*ˆSß;Æ_š\'ŸÌ(E\'ÝÆ†à¦¹+yº“xÿ9y† ¢Œjîå—pÝ¾mZæÉ²1òD©91ZX§„®âçW¡œ+3ÃôBJÃ<rô¸ZÄŸðè±³D‘ÎS©­hnÐ?ñéO©ƒÞ§µÅR>8Äâ÷nlÈ„×ŠCL#Ò%Ú\\•ãôàpz¤ºÈjè’×q‘€/ýÌXùušD°ÈT‰¼©Ú¥ÜÌå\0Qì  æo@´i=	n\0~ÌL9°\'¦~ì“cøÖT[w ”)®PÚäñ¯ZÞ(µ\\üó¯¯<37—,]œ‚dºyÔú¬Ïlj _ëÎ.Õå@ÐÀï\0 üëzÕ àA£*P?îz*™¯¿úÚ<Ù‰#ÝÝ¡“#CÍ®´þÀ@Gñ®{¢{[8þØ#ê#»Õéãëêõ·Rê•cçT<ÓÍü \nFT ²J*åê;.ÊvŒÉ¶@á•H[AT†¬ýW“™ Y#Õµ±¦…•»[Ó	¶ÃÛ`‡*\"›Ul¦.O!g>¯ó‘.$kÞ<&DÅÕ>¢.»zPt®,BÕ³¯Ob´9¦ægÕˆ?¬EUÊ«N¤eN÷ˆzöÙoAø>£:t¯6K“Vôg~üõgú‡ª»	U\0&Ugj™@%W¼\\C,Z2Hø†wìR‡îÙ·	¨\\wv­¨ÎÎ0\'ŒôªÏéëê_Œi[^h~êã}\0-ökj5Fdà~eëÞ©þë_|Sýñ»•ŸêKšãy¢~ùßþ;\0ž ø¦A*irSj}\'´¨ùXYM\\\\U÷!•ã¯Ùé¯¨\'ïR_üâ×T)%•ú•‹å¡£3énæ=	¢2•œÆ	Ì\\¼sØàèÙ òÔyƒñRõ:sŒ-ŠXG0„A®å\'Ë6¶Í!Öã¶êóß3Ì6gQá”p‚²¥Äôö!6á³¨ˆ’/\'ã©zó…cçJgO+Ÿœ<_^]ÉÊ†W_tl5ëÓç€º±5ó³\0ðNà;5n†Í7 ƒŸ~#¿§].¾šak˜Q33I¼ôÖŸÝ·»íÕGïkýD¥–ÚS¯¬ö6»ëÎ}»jdp\'@ã$œÜ«Îã”2ÍŒm…Y[ÝÛ‰­ÇßN$còâƒ”+1–˜8\\lN=¸´ðB”Ê¯\"å3*±y—\n±Ê†¹ŽŒíj>ly T_vxn˜_[jt–ýƒŸx\\ýþ=ÏÂªÆ±ûfUõ„™¡u@Ã@ÖwõV–«ZKYaY#Ð<\0Qf‰Rx\n¨­§ë8Ð8Õ• j8µ{\'œÀQÚéXÚ=!;Hõ*¿›+€ÙZ´¦½ë51¥\'ð›EF-Zë¸¸B.ˆäsÐŠðï»À–úÂ…µç®äúwíhSÞ»k¨–)Whqó´¢«lÛ+jGŸÔ»Ú¬¶á&3ÉXœUÚ\03âª	ªCZ^P‡oYZÈF;ÄN\0Ó…Æ²œqð!ùFÒîçXÛùÂ	ªËý¯chQ×¸?œ+£ˆÕUhARí¡ÂñÐ.Kå]\'cÈNT¦Û™Q©E¾„hYS;‡š´íîÐ€‹-:çêÉú:î…Dmaürå­7OÏ=;±^‚ã\\FÇ«/1t\04rûÌº^£«‹ùMú»z1Ü)W²*Àwþ¥ ô¶j‹ßU!¦’9ÅGÚjm1–ùÚýû\"—vö8vzúûÚý­á.ðñ¬kíÖöóEüàÒ´w	6˜›âýVCIr3#DÙQ¡Ë-^’šÑf‘^²Æ6Ãa¨MT2{’jBjÐ†nÌ×$(‰Md«¥ØÄ9u``—6ÛÂ+üÔ~nì©€ÅÝw‹ºkÿvõè}¨Þ~À	…P]f–Wà>yèÜ§6üýš¹í`ø?±e/¢¨¸8y³†oÃ“{DÛæŽaûõàÃ@i¢:‚ÖCk˜ƒÌ,î8˜>x¾+êî»únUxIŽðŽíÝêé\'?¦…‰Ì#B\0¹´Îâ¨ßß¡\0‘jòÂ¸š øÚ´õ\"¾€;áç	(Gèõ÷PGßˆi¶]Nè(v2]Jüî…¹5´Ï‹jýÞA(1\0Ë’`Û}ÊÂµem]%X·—!6Ö\0m»‡ÏHûl\"Õc¹TE©QeNXã±È<¯Ì|“.YÕáº|â Ãß=s5¿Ï1ÉãEMŸolÄéšÈ0sØN&¾.4Bõ\\)ž®¬_œsN¼x4ýÒë\'‰Ù…t9#9Ÿß!/°[_£Â£Ñ¼Ï¿[Dn\0ß}`f4 >/ÔOo9Œ\0hüYu)–vn`£¼¸˜9»s¤íüþ±–Žæ]ÑàÒè½î¡mÝvO3šÛÑ‘Au`R©Óçðž»¸Œm{‚­pÚÄ1$Ì‹Œ²¸ˆP7ê¼ Ù*:J„tsŠ†ÐhäCsw—nH\0ZeªÁ+„½üìój¸+€ËL7;ª©½Cê7~eH¹T$4èKª±¡m¸Îj§\".rãGê$výe–MÐNÜT8Q x@(ÖØ“y]òû	s’Ž»ÉCyè`Äí°:ôÐ!m	’‡ô,÷3™‰«jITs“eÑ-¼pÿ$l%›úØc÷ÑïÇ?C~KÉïp“‡¶^àH‡§Ï`Ä°]#^ÏL]V6¢%¿Y¤½½ƒšåT\0ë±_î ¸Ö¬ñæ±#½M<S¹A¾¥Z‰\0ˆôª%FIäsÒ×åCfy¢`¡\'@€Â:ô¼.3[;¿ymCersªÎcs•â*êÍbUENL¤¬}`Hõl³à-Û\\ååÄ<Ásé®ü…ûÙo¼\\~þ­K••5	6ÐÀÎHo1óüt\0´–·t[]ÜÀÆ\'clyßÕânÖ=×\'Æë`hEýšÅÙsrjµ63»æ<>ºÜÓž?tOtÜí/>µ½³2j²5FÝ}pïÆvziSjf6OVÈ[„˜†æ·\0RmcÛp3Ù¦ìP7BÓÈN^zå§ñné\'ÅT!ÇBÁC¦ìFÙ¥):	]ªïWïaû	\"Q‡î÷¨{!³?¹öŸ€Vxê¥¿}N?Ž­j*#/nÅQ(7²ÄÐÆÁèÚÜ«ÊŒLR×NŽŸ\"^óq\"˜/â\'m²XÃÊâeíšT€Þ0ž~”uwíèÆ \0­4—jŽü^ùìre?9h>¯.dU[ÕCÇ]££!\\¿×±Îmˆ7àÙ³gÐM?ªµÒrŸ‘þEUâºTf>6,ÎTÄc/±žÂTT¡ˆG%d.KŽ¯Ÿ;Çl´ÊÆ]sõæl%dJHêv–!²Øð¢ ¿ìÈY.¤Õi6¾K¼[ÄU“=­¶3d½{G³:¸3ª†z½j°Ï‡#Ìl5Ã™±^ËL¯¦b——Šçæ—k“GOf—NOä*´»~F\0Ôé-Ö²ã}?¹\0¯˜zµ\'—2‚â&¥ÿß3ƒ¦~]yýË‡vhõ+±d2m–çJ*Ýÿ?½/üÑ/·=ˆut¶\'£=Mþ¶»:	©=»«¸Q#Y;ŸÄfc‚%ÚÒ.Uõ¿ëÁ@æNZk¼é.¢e’h¿:_—yGQ´tÖØ:Ï«¿ú*Ij´‡Î,  ÄhPžµ¥†þßÊJ	ßºEuv|Z9rL-ã(.ÅUZiÜ—(q•âÒ$þ£Ô$KËq­Ê\nÁQÐ8yê<»ÔC÷n£ÅÅ±™\nlx…f\"ž‡!¶7b5õðC«^$p€9lßOsÝy,ïklCâPMJÐdÄc/€»Ë“8HÒ~S•íÛIK9¨N[Õ&\'\'	8O²MnÖÂß#j/Ç¯¼6ÉìR(D6$tMÌ%ãdJýŸ/}M…_“(·Á6Î¼vWIVsãLÍ/àñ	ÝEd~’Áá„²C#Ì×¤ÅAå)ÀE,•9»s$ù°¾jQ{	hBãR‚|T”™©lëEGxy5çšùúÙ—JUVãhOrBHÒ€Ï€fŽŸ¾ñµ–ï#ðé7eàÕÜòšNÃw\0x[|F@Ru./\'j_øò†ã…WÃÏïÞuÜ³Û¿k×Žì¾îdoG´Òé°»íisFTäX×¾sn2jeyZÅs1²5¶¡b€þ¢Íþ\0?ÌªRÊLPk…1(%XÛØÆìÐ®&âj15¯Žž/@¸=«?4¥ŠE?Of]KÈ¾bWÖéYU3“+ÈÂ\nÜ>ÕÊ“-žEsÕ ƒàB£é$â€î6Ñh»J¢~ìØ”•·Õ÷>­‘µÅ¨ÀÎ}Dm§©YÊ\0‹˜“üp\0µFUø€œêää‚ú‹¿ø2™ÂGá6³¬XÓ\0tòøÐp?šj[÷~¸w´ÁlŽ}äq<\0ÿRµ´µ«9lóg˜î¦úž4Žøä;SB¸+bò rY\'j‰2»SÏ¾€±•è2sÚ:ÔŒÊ¨ðÄijô\"”˜:wXœ±y‹¡+FùQÄ³š›-pD´ÙÁ4‹8“dƒj3ˆpS•eJ¢É&ó±lz)Y½r¢ôæ…¹ääøÙT5Ï²·Ò€Oª;}Ñ!_Ë‡r@P×ôê²6kÞwã×î/aàH»@£¹ ±ÝÕAÐÜÁÑx™kß‡æàœ_\\«­ÄÓÎ©¹È™ûW£wï©=ÒÝ¾1ÚÌwDü«Í‘P›o?Ë‰ýwuQùÕ¹si\"(cêâ,ibHììøŠ´¾Æ¸¢ ®!¼ åƒ	Àñ?ù²ÀÒIÆ„ðÖ¦°÷_X¾BÖïkÌ´Òš­»˜\"0 bÈO­Sñ È(wÜ«ÙßÛ°šO¨1AðÏ2X«Ú4nž~\n\'/Ö-UZÒÉsÓêh÷þ|O³\0\0ùËŠÏC8·:¡ènÌä÷ŒŒìcF(dáE‡Øæ’ñ{y‰n,ÈíÄÞ^¼—–\nT†iç,IØ2£N#:àê?üá—Y–`6wEMNÇñ(‹²QÅ%;E{jãúllI¢#ö™JRø‰HôSä6**êÀ	2ÓÃs™;q!Ê‰.ØÁÏk|vÞî…·g‡ÃW*Åhû×8QmlW{†I†ÛÝCEš–à«z\"{%?5Ï¬åŠ‰lÍ½º€OßËo¥O9‘*/¯Ðç–eÏ}­ÕÕPÿl?ð¬ÏúÌàwsÏZëR7<\0oxD×.Ð¨ÅÕÁÑ<4ƒãµøjE¨W‹rþ’_Q»4¹&jo¿4Ø~eïhp`l{hˆ‚«/ä_C·Òä\"ÏñÁÃ=îÃu©+KU5~ªÈd•Ãe¾Æ€”ðv§]®³U‹X,£¸p %+fb|°D±KÀ6:Z8‡v´¨2±ÙHHCÂU¢¬³S1\nqZ¼ñÛ	§YV¬Í§)&£·©ç_™P%ng°?¨ÎÁ³Žl]à—ZG\'Ì|²Ä\"ã\"…Ÿÿ_/ª_üçÕ€O\0#ì¦¨ÈRLÔ§~ô\"£2ägHlÑúž\'Ê±\nÈ‘	Œ&`/“‘nÅð!§^yã¼Ý§:p´–jÒqß]C›¹‚”m§ú«/~[}íK/cï¿ª)@Ä\'îQ­-*Q¬§âhá¤µÛ{úÚ&6ÜvìZ:\\YE™8à[VÊDt\"SóÐÂÆW.0jH!{C§{°™¶š5&>\")‹¥ìÜyÛz2[*ºý©Õ|uíÈÅäÅÅðÛ§.$Ê8•——såªôàïluõ\nÐzº}•|zeh‘›oþuzK—¼)¥Ã-ÝâqaM\'ÚüÞð!Ôd=€½Ñg¹¬|_®«ÿ[¿¾î=@7jw†C^GwwÄq`WÄ¾s»{ÏÈ€k—Ï—iw¹\n¡HØqÚ‚îfßÚT‡Š-¯«…¥Ú;Â•æRhfÙv®Ó†úQJ0+´	(bœ¨”*\0bqSNç#ñ(=²¨eÒ¯°F…Ì	Ñ¦z’íD‰­3œWM²D~²ÅÇï\0€tÿ»\"$l\'fŸ2“,‘ V¯dÔý£ê3?ý4Öø¤Òáõ·‚Wá×žy•d½“*Ú1ŒÍÿƒ¤©‰íTï¼´z¢ž{çò@üQ/(>}EÜlRÌ¥RÜÉÜ2„ƒJ*g9„KM±©m,Y²œeFY2\0ñ y§53Z<@7½¸Ðw\n¡ë</|¾š¸\"áOyÉi![Yñl¦›x6WÔÁ½PW˜)ð†ÐÉ	y¹ŒÊ²–ËWò¶t=×GÚ_ÎÛßžX;õÊñ…òâ2ÑE´ºà¬`>7¼FM¯±56ŽUîŒWÖßñ£´\0ð»?p79›`&\0f=äŒÀh¼¬<õïëà¨¢Çíttu69öîlvìvví²ííî®õ5¹j‘N{sS[ ´;}¶|‘<]TSóöçQA°PÇNÌcC@ÛD>e†ÌEÒ˜ª­l\'qMTTsÂª–9˜,S$O¤ÿ®*q“l;ÜØRÉìOÕ5\0ÄA°L¯XÏcú*éw(%ü8\"¸žÌ½l\\3#yÝ,Mêøzá3²Ä¨Ò¾HÇV ÔàF=0Ô‡FY°Å¸AS‡¢’FŸŒƒºÛ,öüÑH„™œèq%,H4Ä=`JP€Óg§êô7íâv‰èÄfF€­VØà¶$[© Úf™‡JŸ®å~PÉÖ˜á	X:hÕÐW¼•uþhX|A9ŒFÌBÈùœª—à«öN‡Ú>ØÂx\0¶·Z-”Ó¥dš¿ln#W´­ÏÆœÞ8Y;sâÜj%¶ºQÆ*Mæ{z›+U›^é™g~Æö×¨é5nxõ®Ášõ}÷¯Ñ^ÓÀÑ/p•u·93Uu†:\0êQœÆ\nÐøóFàg¬í¤µ9Ú¢^ÇÐö°sÏ®c¸³pïÎ¨c¤/âm‡ïÀUÅçty$0¡Çw°¸]Ä¶+¾.›ä¬š¥]f–¶–(.œh\0¾À(íl®s8‘q1›³	I®[zM}m\"^‰ñ•|ÁZBŽÄÁÅè”Ögñç£­öµ@ÉaÙÀ68ÀÆ¸T’ô»8ÀˆÙ¾x ëÓÔ$¥:¿—MIŸËdæ\0ZÕ5ÉŸ¤Ù94+¬ç4	ziœa¢BHZ%üIXe0@¸‰™æÌ\\pmSaJ?{•Ê³(±šTü¼.\\¶¿\"c+•³lo1†…ã´ƒh©ƒžœ¶ÈˆDêTx­,ZZ±Ïòa¥U¯E#vÀÕ^-ÏR9\\ÓÒ,k‰lÞ½´´n¿81µ±qääre~1UÁ—ÐØª\nðé h>#ÁÙ8÷Ó«?½í5Ÿ~7|ù½·X\0øÞÎO¿¶±4Vo:€5ª\nÀh¬]_o¯$y!Žh³×Ù×Ûâ¸{ŒòöÀ¨ÏYîjá°·9àuûJr·¶tºìu—Ç+G6Su®¯fìlycXy­$êêü\\Ee+A6—âRÐ±ý¬Õð)%g×€7È¬M,Â{©RÅÉåÄ!ÆŽµµžæ4S¬zT–…C™ÖÙÎ&Õ]¦\\\\`”\0Š/^•9\\ÊS±ì(”i=Y2x‰†,1ssâ¦â`	S€_\'.ÙÎN¢·–+Ò„D~W´$´°¦(>Ö°©/$Ãj!I5ºÁ–Ò5Õ Ün&¿UEüÍ8·´¢?îÂ6¿+¦-¯¨ÑÝ!´ÑY=u·Ï^*—²•äÆz*8âzæÊrai9áº8«¯^˜Þ¨²¤©Â-¬Pí	Pé³=èôªOAó¬Ï¸Ô0/?ôÛ2êßŸg§u+[ž€€ïß“ÃÜ_›ç™ª@sÕ§ƒ£yØ¨5nØ\"»\\Ng´%èØÞÓìì	:º;½žöf[oÀSnom¶w„Éðx±Lõ’Iê°;\\öªÍ[d{êÜ²m#ï´­%rjýò*´—µDàÀ•c¹L±\n Úl‚›y(a8€â% ‚m0®,|Næ±¢\n¶p>ì»$	ŽëÀ™+âH@\'›*IQdP™*§¤æmæp4‡„pÌ\"…6W\00‹ÅW	°”VäummQ-áŽú@•%·‹LV,÷pëšËŠýQi2w¢•$a¹¦#§z ¦ø:ÚâÆ›¸‚f¬[ƒžJ‹ß[uú«õ¬+[É×ò%L`©äªd˜ç3Ë…+ñ„mvq¥¶2»­^šÉT—Ò_ìk[\\c…§˜Í”c¬š\0¨ž~=½ò{ÿž‘Ö-Ýð,\0¼áÝòô–x«%‰€Æ\nÐø=½4`#€|Ç¬P›’ÙÔäµ·µøÝÛ|öþn£#¢B]mj 5Tß	8\"A¯Ó‡	€·	__—‰—+%4ˆÖ8N¢[<YR©T$ä[\\˜ZRkil  —ldÜ*õÓ>S…Õ Ž Ï·»+¤®`—%4Å<1µ‘Á­ÚÍdUuD\0KZS;IC“|ÍšR5âkh+³Ì`^(\0èo\nhž|ÔrøbEÀúxm}™ö˜Ær_ís§S·æQV¾ úboŒ­6DÄa/Õ³;ìÜ´ÈX°­õx‹ÌøjT\\GL\nð±‘H¾î,½r93¿ðÌfs®ÕøZ}a1†¶c.[[Ì OËT²Bò®¾”Ð‰ËzëknoÍ•¡\0åçÆÛÒiQ·üd³®ðÞNÀÀ÷v~[][¯ÍÍÀÖhhlmŠõJÐŠúR«>Ù$ÛÙœ:‚—½­Õãèlc«Üá±·Eœ«ÖÔÑ\\ékfºÛÂv’0ƒŸ?äòùš\\§Œq;+u–xí¥QhVqØ:£R[Šeí‰$Æ\0382„‘ÚMÍ,S!J¤€dB°Íîæl´Â„‰•¾[(Ð\"œA‚?µ`“§ÎB7~‡¢ö(×á!\nƒÇ|ph=pþÀIM%ØJ†‡è›ƒ¸`·´:k=C•=Y{sÀSkûm>GÕFë]Ï=7ÐO!²%|¤Z)”ó…|¡Œ@ØQ­ÑèÛjWÒ¾ØÑËÍ§ŽŸKU¯,ejTÕù¼®UyF¥†yÁaœñé”½µÕ+@s¬ƒŸYMôÁ<­[½î	X\0øÁ>AÌ@hn‹`¨¡¾I6Ï?7Ÿ±-6Þ¾þoµÏ=BÀ’¶Y5†­~ûè ËôÙìAþÝQG/™G¡Z1ííl‚Az[wOw—cç• ¦bP¥Efe¡Ò)*+äqh.U¶Ç(s?š[ÂÈ¡¯tt`ýŸJcEÐ7¤cF“šÄM2MÊ´¹’©!ù~\0ÐÉì¯Ê¼O¼ae¶\0ü<,8ªˆ\'$A.i¦°bão‡Šãðd1P\\ôÇ˜~¹\\¾*œFìJÅØZ…¡Úl©\\ÆT´–HÕj©tU,d5ÕªñD±–Nçá`JŠÑµŠÌ\\å°Qå×ÈÀ@\'.›+A#øY³¾öµwS·nàMÓ{¾uî q±Ñ¨Ý5o·j‰o€G¤Ówì~¿[ûh\n\n ºmpíÃƒûð@ˆb¥;â¯´Ùê©à@Wsp#±äŽ„1±‡íRÄ`\"¢M.±IjKnÑâÂ¾\"™·òY¨4E²F¤n\n°fišÃfÊÁ²DœV$OÚa™ŠO ÈÖlz½Ìûb¨Uü´½€€Q(62;Ì m»|…•D6—/;ÓÌ*óél=³²^YKd«•š?;=_­Ï-lÔ–VŠõD¢PE†Ç¯Z¶F>×gnfðkTý‰ÌæÍ®y™a¬\0õÛ2Îu’ü{~RY7ðÞOÀÀ÷~†·ræEÉ;ZVéòæÖØÜ\n¿~×–Xª=Ó‡±4þÛØ¦k H;j­\nùìÍa¯½=ê¶EÃ{WgÈîví½Ý¡6ºÍ¶æ&{Äc/6£(ñE#Qg>—qù};´Þa…’.·ÛeÛH§íäˆ8CM‘Z!_¬ndC©;k,ol^XÕå*Á šÕÝV!¥\"c›½â$9›ÏÖ<`YÒÔ6²ø¦€„ÙRüLe‹ØBÌž¸0©¯®çk™\\m-Ÿ¯ÖKåz=C÷U°3S˜µÛF2¶¸ÆÊÏHs1KØô%F£‡Qd4Ö¸•çŒuÙð,\0ü\0÷:7Ýdê­*Bóåf@Ð²f¼V^­4ßˆò3§Ón÷yi•n›ßï±G#>{yšC>[s³ÝÙ×ÝÒŽk—ac«yBMAg6›v‹<ßp·µµ“ä°]žY(ærå|[4j³9]•T*%|kŒ”m3>©ÐÊÕzY‚ñ(0‹…Rµ@X»“Ír1™Ê²”€›’)Õ×¥ú%€oa1Å×\\ÌD³UÙVàw3UßVã¬Ï”f\"³ÅéûÞ¼Ö¬àmxîú]ÚjY²U{l¤ÌÁÐÌ#l44¶Þ7B#0AÑ¸á–Ë\0~>{°ÉmóAüózØÂô8éhí67\\@þa±ñÐÛ!\'Ç–Ðç	1;z©ú¤m®¤ám¦â¡2+|–Ä8ÚçºÇ£§­_ý7Ëáz‰z>/ñN×|K…­Ì)tPjxÀÍ¸ñÕgzzµhl§­ßmüÂ3¾\0?wóûþ.6BcåfÞ\n7j‡ÍáwQd®¶ÄïXŠ\\­ütÀÓAÒ\\Ïüoã}×˜-öÍlcÀøo¾–Å†—™dð	èÉø´ð¦wÖGúW>7²#3V€\\wäçæ™_£å†‘Èl&7+@½íÕÔ¾Vµ÷!yÉZ-ðíõ‡z˜ÀéFÜ@3-¦!aú&g‚fðÓ*½«÷ÅÔúóÇø}9Ñ­¾6ŸöV@a¬žŒ ØÈ‘§àmõ=c…fÜèšÏh^Ðègúu™âÞ^Ï(ëÞX-ð‡ð9`€ÌšF’9s+|£ñ*?#^¯ò3‚ž\0åzŠëU{r½Fàg¬üÌ–cF4·¾F%‡qng¤­7¿æE‰\\ßx>„O1ë.ëOTë$nï¸ÞœÐhÀp=ðÓÐ¼u¾^;ÜüÌÕ`#à»•\nP?yc%¸ÐÒXy™)-€ÏÈí3ozÍÕž™øÜh“kµ¸·÷kæ¦ïÕßôQ}Ï/Ø¨ý4VpÆ6y«%ˆñû·²¾^%h|#ÕïãVáV‡¸Uõ×¨Å4S[`#ŽŸqQÑHÏk®òÌ‹½\nýž?¬;ðþ€€ïßYþ]Ý’yîf¬ÊÌ¤g3éúz?¿ÞfX~§~[æVx«Šo«êðf@Ð¸Ý5ÿ{+·mã|OÅF3¿Fª#`šA÷ïêïjýžïÁ	X\0ø=8ô÷ñW^ÍTó¼ï»¥Å4šÞ¨í½™ç™yÙaºFUŸ™Ó§ÛTæ‰ñ¶-êÊûøäü0ÜÔÍ<1?Ãº››W3éÕaCr3n´ñÝjögþ¾ycÝhóknÍ§Íþ À_£9 ¹¥5®õºOÀÀïÏ?ºyóºX™—×ûZÀëmƒÍ3@ýt·zžÝˆâ²Uå·ïÏøýFm´yÖøýù×·ÕMŸ€€7}Tú6EsÅx½ªn+> ù:7ªúôƒlTmÅó»ÞLp«­±üð>ôOÛöX\0øÁžïí~ëæ¿ÿõ*Ç­ÀÒøý[?3H™	Ð[UˆúõœEQ¹ÝŸu·Ñý³\0ð6úcÜ†wÅøü¸Ñ¿·úùVË<ÿ3W†Fp¼Þ¿oÃc³îÒ‡å,\0ü°ü¥nßûù~>‡¬êíöý;[÷Ì:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:ë¬°NÀ:èþ?£øþ±è÷<\0\0\0\0IEND®B`‚");
INSERT INTO tbl_usuario VALUES("2","2","RUT","2","1","$2a$07$usesomesillystringforeCFgULGhtYgEopegGdjbjYiHOQCeHz.S","","ADMIN","2022-07-26","2022-08-11","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("3","3","LUZ","2","1","$2a$07$usesomesillystringforeFz7dK1VZWNMEJiH0HNOXYw/HL.5hY4.","","ADMIN","2022-07-26","2022-08-11","ALEXANDER","ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0\n$)..3),8-484,/1=55%BJ=4?.451?+??<4?14?7651441?111111414411144?14144144?111441141ÿÀ\0\0á\0á\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0L\0\n\0\0\0!1\"Aa2BQq‘#R¡±br‚’ÁÑ$Sƒ3Cs“¢Ò4ctu²´Ãáâð%DTÿÄ\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\'\0\0\0\0\0\0\0\0!1QAaq\"ÑR±ÿÚ\0\0\0?\0ìÔ¥(¥(¥(¥(¥(¥(¥yšiJP)JP)JP)JP)JP)JP)JP)JP)JP)JP)JP)JP)JP)JP`™Ê©!YÈè«·sy>f¢žòéT³[Æàú¸îwM·Ë*>Yûêr¾h#´ÍZ9Ô´m¸£m‘\n²K}†SÌIUÝoCÝ¼-è×ˆ½ÉÓÕ|tIÛ_#Ìg‘ƒCâMîmî[^F»ž-Û’Eÿ\0&ö—ñ4ºV(ä²Ð)JP)JP)JP)JP)JP)JP)JP)JP)JP)JùfÅÕxMiÜßªøÕ[Zã(¡î³®öõPwäo‚Žf‚Þ÷\n<kVMIˆªÔuŽq@°FÞ¬—O±¾!OÌŠ\'\\?9ïgóKtHSærjfÑÔ®’ë¨<EG\\ql+ÖH×âëýj>´öÖ[Ÿö×IøŠÛ‹†l“Õ¶¶_òQ¿:Îå[¦Ž?µæ;x?j³ÄœCipªVxãžßo:0ßü|Añv=¸ÿ\0Qmþå?¥xú5±ë³”ŸÒ³¹â®p§ÒÊ›etI“ºýåT|{Iä}Õt¶âaÉ•¿z¹·ðÔ1.ã†>ÎÞEô˜•v£ÆOR»ùÔÐt–$S¢«#ErÈüÆF\09\'Ë\\£[N*QÆ¶ÒáOs88eÕCÛ^] eÜáVeòÎpGÎ²%Î£¯wQ¯W¶}¯üü‰¤Z$Ó§^ÕIãÜì,REõ£‘LR/îœ´Úê\nþ5LoÒ¾w\nÓº½T!{Í#çlh7;ã©òÞp(7©Z—ë!uHÞ=»ã‘\n:ç¡÷ÈóŽU¿@¥)@¥)@¥)@¥yšöJV	æ\n3AìÓê¯ÄL.Y¹·ungv÷*Ždü*?ˆ5÷2,/m<ž¢{(¾29ðñð¯@X›¶‘½&é—œ¯ê¦z¢/E¾¢ÖˆlFÑ«k{vwHÏ§ÀÞª­u\"ùža—3ð©­/A··ÿ\0GWoZCß™üÙ3R”®v¼Êâ¥3JT7E+âYUY•Ú,ª¿E\\q5’5Í²Ÿö£ùSLK×µÙ?«slßæªþu\'Â8Ê:8ûHÊËøSR¢âttuŽ¬®§Õe=EhéÚ´êaŠ?Ö7üÏ:”¥hðR½¯+$iê:\\3®ÙcI6ôcë§š°æ@Íeuiß…žöÙ}xÝ¿¼Æ¿¨}°=ÇŸÆ¬vwk!/XehX\0\"*¹¯q´¦ÒÈ£\\ÿ\0®¹,;5ñ$ô\'Ü+¥fQhoØq˜—b[ŽÚgöNåKuÎÉâ1Ï—R~umÓlÂK%|v’ž¯Žœ¼\0ð®ršvê¯m2<ëÞ›|ÊÞšÄä“Ï‘É8#áV­ˆÑNæ_u‰Úà+ÚÔŽõOõGhÛ¥j-êŸÎ²ƒA’•æiA†iÂõ¨=Kˆãˆîˆ>Ñe_Î¢ø›RréEVk†eF=åG6r<@‰¾,´¼S·—Ú–o­v÷ã<€ò6´U±k¤KLã¶OÚÚÛ~xÅNéüK€tpÞÐeoÊ¾+Ój\nÖ…çÛÈw4HìÉèd_Þ\\Žçá\\V¤¿R3š«q>´À*D;I¤m‘\'Úsï>\0u\'Ü**òÎêf‰Ú/°v­ÂüFüRôþ:Ž)æ’âƒ8ú¨Ó¸½Š{Yä1=|€«‹DÇ„éÑôMmÔ’{IäïO)õ¼½Àt¥k™¿ÒÜ~Í´¿|¨¿­vú\\>£ï¸ÿ\0ã\\¦–•îN•È§úZ˜ú–ð\'ÅÙÿ\0¨Ë¯¤Ëæä¦¿b>÷Ì“N9C·HáT³TUÜÌ}UQÔšåÜGô‰$ØX+wŽÁ.ÝÒÈß¨<>5CÔxŽêpVYåtoY7mFø]KèG‡“²’õ€gghaÏ°«Ì<Îq÷WJÒ#ÚfÊv¥ÁÚÃ£M<sÈ n`ó+º·uR+õŸê©mi<òähy%_¼+òt–f>Óó9«câ¶mo6ÝÉûHÅ?*Õ¥4:\'ý&O	r=&?/Ÿ¸×ZÓµæ$‰Äˆýü¸ùWæ³ð§Mbd«,rzÑ»2¨o´1ÐÔZ»ôØ—èÐÖuh­¡y¦`ˆ¾¯Úvð\n<MsAô¶ÿ\0ÿ\04ï›þZªq_I|èÎ«Æ¥U±\\ž¬sãQŸ»y7õN3¸’âfµí-Vè¢´i†y¡ºu#—º¡5MîVž+ˆRna¤VPçÏÏã]SèG‡ÐÅ-ë¨wí0ç±TÄ{‰-øV×Ó†²Ú+]™k–í7ø\"ÆÃ§™?…uˆˆd¸]nÙêsEÎ9$ÇºÇ.•£JÖ:‡ô‡2á\';ÁÂ‰t¯í˜øWLŠÆgÍÊìuVNÊ%eÚyúÄœü…~t®×ô{­ÿ\0øäR’Îð´‰µ#ÝÝ+’p#Sy˜ˆ…´™G4¹“?õ‘Féò?{¥ë2Ç7ap_nèÝ7vs(êW<Á²<ék¬;ª8·Ÿcª°pñ3m>õ5‹‹cŽ²ŽëÚÉ¨Þ×®‡Þ¬Er­ç~[5…»Ó‡¾¼ªÇ¥W^IÓ_OõÆnñŽÞÝõw³–ùí_•NIœ6ÜgÙÏy~ú®ß¸¶ÔW;!ºE·w>ª:’Ñ“î{¼U–¹^?’«éªÁ2G¸\\ËÚ³\"\"„‰QŽASËÇ¯…gXodK×wÔ’.ÅÛ÷”‘ÿ\0nj6¦E@¥UÒX¥\\ú½×ÎÝšÝ5\nD&°ªÏÚ–î«;+ÂÍäãûñQ\\aÂ^£:…ŽåW¹(öñÑ[Þ<êÓ$jÁ•‚°nªWr·ÝZVV‘eGnÅ½HÏ{³or·\\y•Q:&Y¾Žµ\03Ù#y	SwãQ·<#|žµµÇî®ÿ\0Ë5ú$Uw%<_™&Ó¦O^)“öâuüÅj_©™Aê°=”më$mñEoå[Üü3‹òø®Ýô)Ä1vdåRe•¥ˆ]¢¶2¼‚:Už]Õ½k{fÿ\0)?¥QøèÐ3l˜DÞ·dÄªîýVðøUEâM:Ò\\(úUð~‹ôýµ ¯ãŠüÁV}nM²¹ôæŒsÚï$±rès’*±W¶¥nØésLqRÊQ64ªOIÑ§¸b°FÒ•õ¶áBüIåVýèÆâL5Ã-²x¯\'—®©¡èÑZÄ#…vY›Öwoy>56¼CbJú:¹yû9vÁ*³È;ý}•÷ŸÊ®ñ}Ø„ÚDò>ß_´Ú~8ªÓ{©¤G	‰Ù»ÇðÈ}j7AÒ6{—ðHb‘Ù¾ü`|I®Syoo‡µ¸ôYä²¸gki¤[ÎqMÝÒGìu¥ô¹ÅvW6ðÅ­Ì«\'iÚ\"±®#\'ÄûªCSàÇ¿/=Ë5¬ÝÕ†5Û\"ÇèÞI$œtéU{¯¢‹NÉ`xnÝþuÒ¶2aÎ©WØ~‹/	ï=²hÍüªgNú\'PsqpÅ|V$Ûÿ\0Ïå[Ê¿&¥ÌìlÞY8ÔÉ#œ*ŠýÂÚ@µ´Šë]ÎG´ÍÍBðP±†´	\'k*³3\'lÊ‚äž}1V)µ‹tyàOŒ‰ýj-mølC5…¯g¦wmÝÞø¹oçQQ8~ÂÙ{Ò\\JŒê=ˆÑÃ3p$÷×’ñ&ó¶Ö)._üGVŠÝ|Ëg÷A­þÐß{Í3v“É·{íÚª£¢(ð¦µ“:}ú÷R¬þˆ=Ô®ÜS´v¿£¤èèê®Ž»JŸj©Ö²ÜÙ}\\Š÷–«êHë¨WÜàúà{Ç?#]5—5©sb¯ÔRcdN•krÞ^I4l}¤-²Eø©Á$5‚ÿ\0„ åãÊú¬è¬Wæ*8pDCÕF_Õ\"¯ÈŽÚ¹%d™e™y²­DÞñUŒ@–¸ƒ»ì†ÞßpÍf‚ û4cöw·Ìæ´xƒƒcx]6½Ýª½Öð\"³¶rLi÷k4QÊ¡Õ$]É½v¶ÓÐ‘ážµ±P3¬‚P±Ý[mWAÝYSÙP{àA?Q1¦±\\Ü*#;¨½ ÷šçº¯vb•%ŽÙ=u‰ÕfÜp{ä{½ÀŽµ~¿\nï~î—o³¹Pã>úüû,ÅÝÝºÈìíûÇ5FQy»Þ¨A4jÐH$OÚfuý yƒñ©üëmpñ°xÙãqí#5jÓþï#äâ;‘úë±þcúQÖý4Ç¯.¾W5«.úÑDÿ\0Ñ¿•S´ï¤ˆÝÕ…vm£²Û6æør5g]v?i.cÿ\0ik*þ O0òÚ³YÔ¶I€ˆ SþÉ?¥m$`rWáÝ¨ïíûoQ~*ËùŠ ¶ð™ö7;|€¦å)<S5èÏ¨—R~Å´»~d^›Û‡ä–ýˆûw«òUÉ?1X%(+¢8^û¬í0]‹ðÝñ­ŠÉ\nf¼¯k`yQšåÎ²Cõ×‘1ë*{o÷_+6§©,!sßwî¤c×vþ@xŸ\nøÐ´†iò÷¥“nï²Š:\"\0?µu®ÓiÓãMádØ ¢6ÕñUj‘‹…âS‘¯Á¬q&+%wB.ßIEðZßH€¬´ R” R” W˜¯i@¬SDb²Ò‚‹ÄÜ0$+\"†xûÑNžºyyx5oÄ#EÄ{fy’!:.èe\\ó$uCó®”ñ‚*‘Æ6›¥œ,²ÿ\0ùSjÄ¶\'Moþ‹sÿ\0g—ÿ\0¯ÏÑôúTYbu¹4l»¿U“ÿ\0zãº_	Jå÷²Ä‘»ÆÞÓ³!ÁÀ®/¡ÒO™…n•ÐcàÈ¬ó±û[•V½ï¡Tì§ìÉµ—æ9Š>„Å¾ÿ\0GGn·ªÓO¹‘ŠóHú\0>=~ú»\nƒá[ `HlšÖ4GOµŽAÔøƒS•’øùwÎvð­z¢…‡tg›t¯hæW•í|;ªŒ±Uh²¯çX>ëÊ„¾âË8¹4ñ»ÿ\0‡vÒ|—5xšêní­« ÿ\0ë1¯Ä(æ\n¨¤Ë7k¸PÌÅT/V-µWâjn#íe¢zIõLÿ\0þ´xåë{gÈ|Åbƒ…¥œ†»–KŸk²ÿ\0Gl¿xš¸iÚ2FUê¨]ªµuÇò™·ÂEÐã,ŒÓJþ»¿ä£ B­°BVE@+îº¤¥)@¥)@¥)@¥)@¥)@¥)@¨}n×zf¦+«‘AÏ¸Zè¨{i;²Ú³,yÿ\0[{Ž=øè|Å5M5ÒGšgÞš!ë3tí>8ê<p*Gˆ´b²FÍÑ¶èäÏ¼âˆ¨Û^%DwhÖ²ÿ\0ˆ{Ö²þËø|¸Ú³±äšNáuÁÃ7fþ)/Õ7Èâ¼mF!ÖXÿ\0[ðkƒ9ŠAáê:×È·…;Û õ¶¢~5tu¶×˜U£I¤’\'·GBŒß[*2G°‚Úp[ÀýÕbžé-`/4±;Îïë;p$ô¢õ~3¶„Fô™¢DÛ—÷› ®m¯ê—,^VUDÝ²!‰ýO™¬ˆÚ-‡.]Þ*Û¹ã›æ¸yâƒ)·l!á‘Õ®îX#Ÿ*²iºž£p¡ŒÖÑîUm©m»n|ËTåŒ˜ÑÑ¼³¿ôkŸiZÜñ*`DÊª½ÖÊø{ë¤M~)ÓdÉ¾1½/GC¼w¯nWwøkKø.ò?£ØØî™î.Om3°o»8¬ü)Å©;vn­ª»¶ò²ûÔø×@„‚3WgÖô·F¥ZÓxJ€	h<•V§-ôÄ_\n‘¥jÖ0<+%)@¥)@¥)@¥)@¥)@¥)@¥)@¥)@¥)Aã¢¯tdpÀª°ozÔÍ((w<lrDH‡õ;Ÿ–*‡Æ\\>°vDØÒm|»²ô8ÎOBq]®òéPs®aÅœM	g„)œú®ˆªÊ¾LO/º²b4ïÓòçZòü(»\0\\.Ñð¬l¬A»Ë·Æ½Þ7òVîéa·îÅf®/ØáŠæ§šñù„êqd¢×Ñ»¶z?£‡:¶Ý»sŒUv$nYÂí_Ëšøœuð¡N“Ú©VkÛPQ÷¿ê®9øçÝì=A\\;†5¸ 9`êY»ò-ó>ïÂ»ª$‘£#++.àCnV®µôü¯_{dË6šé;JùVÍ}U<%)J)J)J)J)JFkzª[@óI¼ª]±¡’Gg`ªª‰,IÕkè‘ÿ\0Þgþr*pq»-Ë:]Û5¬bi!¸·xgd\'ÕO23Ë—Ž+gEâhîeh„W–Ò,}®Ë«f·f]ÛI\\õÁ#çZ\\kÃâî/«m·VýäÚÛK£Zò`<|T\n‰âNÙõ‹h sn×Zs¤³¦;HbYw6ÌŒdí\0æƒ¡Ò¹¥¥”×BÂmF;Û,óO<–÷,ŒÊÁƒw#€=+BÎÞÓ­¯îîu(ý*VíÖ+©öI¾W\0÷@åÓ–ƒ­USYâ§†[„ŽÒ{¥³d¹’9!bVRÝ‚yyTDÚª]Ci%Î¤þ’’IioéS„‡`Ë¶ðrsŒ€ÄãßX8XÜAÄ\"A²Ùç\'ëŠ@‹<Ï‰ÖpñÆë²\"ºç®3ó¬W·aZåº¤)Ö›=òA4‰iq³ÊÅ‘¥ØHrŽ\0Ç\"kcŒ4+[u(·7žsÙ®Ÿ—w2*¹u\\øŒyîåÊƒñS`…¾±½w^‘©þf©	ýæÞfºp’I»G©K<±³½ú—6èø>±Îäp>ëTKûV†iás¹­äxËz»ÔsS‚*,ûßIË†7—¶µíY8gLÓæ‚tÔ/î&uYnVRN0X²w÷VèËgvÐ#3FÐ¬É½²Ê²í\'Ç9|jfüT®L½¸®‘Y¯’*sFÐ¡¸°Ôe¯§Xï•6ÊÛYvî\\¯˜Wul\\p”{tXU¥Ž÷RúË‰7±XãX÷>è{À1[Çny~³Z^Ôµ}+J¸©~ÖZÖER~¢Fçÿ\0VÇÇà|jÛ\'ÙÈ÷ñG¨ÛO\n)KÉ†ÞgåÐžG™À8éUýBµ]=¯µÙ‘¦’íà,½åvCÐ‚IdsÌà[ÓÃÔýC|SY®§ìëzV WJŠä0ÄæÒßM»ßo¨#eLÉ5Æœ¨˜¦yŒ®@êµMÇÃÈd¸ŽÝõ‹k«eÜ—“M3Û\\?»¼Hqœ0<qVøŽ‰JæZl}f··^›ròÊQm,çhc¶Tr‡\02î=ÒI$žx-Á—ÿ\0ÞomRK™à·[yQ®’T¸œ¸hIpà œòcÌÐ]éT+»f»—PyMä±ØÜz,V×ndÄq³HÄ2ä’ç \0D-Ô«wŸi=ôIxŒò‹¸åk=S¼Æ&qÞÜ2:°R2(:¥+šA¦A#ÝGcq©Á{f¯‰å¸–HnIVÈrC€ÀƒÈ`ÔA¥Ú^ÚÏx×SH¶w\"K¹d@ònˆ¸rŒÂƒ´R©<;¦öZ•ÊG-ÔÛÙB³,×2Ü¸‘‹n\'*g—Û«µ”¥ªüy‘g»Dwz|±F\n—Q³\0N\0ýÕŸWâ»{yZ\'ëÊâif«nÃ1Pq­ò¨÷úC±\n_uËBon¶—nÍÓ¶àóåñ …:»¶£q}mÚÏgµœWQú<¨Ò¡iKº\0–L«`u‡Zø½Ö;]NÞöÕ\'º‚ÊÍÒíVÞU“cÈAØFâ9d)©ïÓë\\íTÔÂ†1­…Çh¨sß Žœ?#[Sq¥š¤.®ó›•fŠ(a’k†\nHl  ƒœ`ŒPUìµ+XÞíìZêöîûrÇja‘RÝ™ÝÛq*6®é’Äã]Õn—ûÚÀ,íykp;XÖÚàác‘Ù˜¸#ú×OÒ8¦Þy;%Á;)qÌÛHÊ:•0qãƒÊ¤uMF;xžYb=go>@\09’N03AÌõ~&¶mcN»\'¢ÚÁ4sÊmî#i@€åsÌ‘Zú?X¤ÚëJîÑ_Ì¦%H¥Ý2elrå×Ç¯ôƒ­úBÂw‘ÃÛwžÖ[xß‘Û‚F‡_*¬C9+sÎS×Âóløàr©›iô:^’™k6µâ°³kúí”zu½•“Épž“óÊêû•D›Ù˜•bØä@kkÑ\\ß[ÏjÝ¯£ÃV(è;Dœ¸à=ÃçUÞÕG\"]_aBŒ$Ýö1×>U’ttÛÚEqîê¡’5 HëYÊeí§AÓÖÑ¼±+ý×ióËÔ—·ö»\"U–Áâ8Ù†î»G\\·U<öŠ£˜ÚæK™‘dŠ¤v‹´w’fP®I$äã™$ùV²Àò!d‚æhýS$PJëó¶º¾-cD#µuÙËØÇ\"Hð ~5¿·“&ÃxŒ7ÜÏÂÙeÄöCO±®nlä²ì»k{dnÖáãhÉ3œàçEñî©msso5¼­+5»E2lt…mËœ‚K0#Ê«1¡\n\nÇ3ýšºBì¬Ý6	ò¯d;«¤º.æIãu_~Î+6ötÝ&*d‹ÎXÜ{…ƒƒ5¨í.§m–×ïÇk:îS•È\0ž…‡ïV][ŠµhoaÝ-µŠ¤1¨›ã(ÁÊ©Ÿ|ã8ÎÁUÙÂohnR?ñZÞDŸCœcò…ˆ#š@ÏÙ£$.èïÏ¸¤g‘ååH—Lý?K“%²NHÔÿ\0ÕöãˆôÎÖâäßj&UÜ–	-ÔJÉ@ÛŽž\'&¢t}bÒ]7Ðo^[]“´ÑJŠÒr3œ70YÜ9ŽuXµÖXD7LŽùŠ;yHùän\0wpr9û«æ6<ÑÃ£¦7£¡GVólËçô½&<×µfÚŸ²Ç.·emya%„ Ãf®—3öIt¬¡3Œ2r@É5?qÄ:p’âçÓu+“*îŠÁ%ºc|tP6ã˜ñ85]á.KÇ»WyãðFËÙ:®æmýrÙ_Œ:¤fXç‹´Q±äãY9díb0}ü«7+ÿ\0äœSmL}ågàÝjÖ;mž•u¥Ý	·ÎÁd¹·Ÿ$žJÁ€$ Ù_]@¹ô›Ë‹´YÛÑa¶äF‰®Y]Ùœ)ÁÀÜ\0$­\\ŸJ·ú»‹ºžå@–ëiª³Ì³>ÒŽ^|•t]Œíá¶·Y¥–êE¶I%šyf]¹eÜÄ\\Õ‡>}ÓUŸšµ¥æµÃNõVÖëPiæ¾°–êa,ñ‰\'µxð¸— ®Ò½áÐŒËs«I-Å•Õ´S^Á¦G*ÝÜv-—+ UnÉHˆÛ¸ËÀd×ÓÝ½ýÅë$ú¥„6–vï\0ÖŒìÆbd*Ë’DÁò5%Âüa‘ZÅ?¤AtöÈÌ÷6ïoî±‚åXŒðçZä‡³Õ¬ã–î[&»¾¼¼ÝÙZv2(…ÝË°$¨Ø6IcË«ïèúTÝ[#zM´ketÒìu‡Ò“».Ò@ÏznYÍM;µæU/¦‹½ýâ+‰-ùu!€æ<ÅTd¿XâÆüÉ§v]«M:WŸÑß\nò„ÎŒò=(.ü»à–äŽö¡u5×ùyÙü‡ï«5Rí¸æÉQbT»Ð*EkèS‚€wYPíÀëRzOÁ<½ˆÁ>ÒÂ›y-äeJ†8ò4R”é›Ýl’Úe†ß•ÕQR2¼\'`WûÊ71Žé½äk£jÚ]Ç¤‹›I!Žc\0·š;„w†dWfSÝ ‚7Ä5Aë/©ÜÂöó]XvrÉ¬Ék*¼l…HTïcQ×Ÿ3A½¬k’E«ivÈb»Ž~Ü”Ë¶ÄbŠ†?3PóÇ¨k²ÂövvË\"´×Û¼Ò§Ô‡m 2€æ\'9æz’¼ákùn­®ÞâÃÒ,•–KY»Wx/œ÷¹`ŠÉk jq=Ì©q§É%ôî\"’Ú_FR¨YpÛ²@#•;ÛÔkMåçô€š·÷Ç‹Ñ‹+oFb¾\0ƒƒày˜×P>£¤£ŒÆ¦öàê´Ñ¢åâ@‘ÈøgÂ£o¸Rš	-¥¸Óä‚}«#-¤‘K\näeÁ‰çVHô„MŽÐOo šÚuPÝ›€G1â$â?Ÿˆïe—R·ôqªGýâ9m÷-¯  šDPXŽöåUoÝŠÁ6¡-Ž¦IgµvF™û>Ð–tv ù–U^~@U®ûNÔåFŽ{‹aq¶gµ†U¹‘<Tb#9#$g•Pmø²[7–#o%’J{$Â19}„vîÏ\\óÎ+qãµçVÍq£‹XÒçh¤‘æ³›¶ì¡iž6ÊÊ8Øg³XxÇtún ö÷‘^Â…Þh¦‰H0A(¥v•+Œ€êOR[ˆ.Úì^@¸EØ˜P±øÅ·=SÏ9çšÚÖ8²îâ\'½¦ÿ\0Mèñ²¼Þü’O/g(zg¡Íãû^té®!}.‹«kf‘vÇakdØ™Bë9cŒc¨ÛÏßT.7DMZù@	¹ n]ÕïB…Þkkôîÿ\0b.lÕãÚ¢~ÁšfŽNqÏáŠ‹Öõyo%Yf[pëŒUÕYrX“’Nri6‡~“¥ÉL±kG…¿BÔ$·áû™á\nÒÃq+#Þ©™UYñä¬Æ¤u(Væ^–áWµ›sJ…6†oFí6|¢ò>úˆÐxƒÑ4IZƒÒRñ¶Dìk„S•Îq‚j·®qÅÔ±K#¬R[w­ÄU…²	ndä£¯,r¤iæì_.KqüºgöÔfþöÝî\'¹FÓ×NwXF/¼CxòïuAðþ¤lô)%‰VF‚òt…dÎÕÝs±Y¼y¨~/Ù\næÎ7uØncÞ2ØÏÝŠ„UlÚÄ4-nÒv…™\\ÏžÐ?\\ã¨÷Spªôfcqãö¸fX4o Ø—wW²Ks\"G¹Ušá”ò9ä\0P3ï¬?HCtzEÃ([™íÈ›»†aÙ£sEÃu@è\\Isf h^)qŠufEcŒ• ƒÏ#¥jk:ì÷3	.	TÙ@V(Á9 IÉÀæO€¤ËÑƒ¤É‹=m>#k‡ÑNDÚ‰qöø_99W—ó_píÔ—Hëq¶.çgÞY.Ë2ÕWIÖî-LÆÝ¡V¹DÙÔ³&ÝØ+‚\0=ã×=f×øªöò%ÚMèvÀ¬4€™$Ÿk—ˆ¤JzÎ›%³Zñëöèö77ÝXÃswo­íÓ­,Ÿ³u}g,ØÆÓƒÝhp¨Xõ^$Â‹è­³Ãš;2OÎ¶mcÕå\nLš\\/®$[YI1ƒ±²Ø\0øíû«ìhš¡šy»]-æíäQopÈ• –?XÙø\n§Ë—ÇêÍw<Ây´½:â$…\\*£›†Tl’IÁ#‘¨MNò[Þ–K€’N·1,-Ùv{Ÿ¶E\ný¶R|FjÃú3{	_CžÚ1ýgbï42<ƒÑÃ\"`àg´\'=/xnúíV;»›xá¾ž‡¤²J¾£±b@\0á°:‘AõauqÝ¤7–ÂW…›Ð-¬Ýc*÷‹–$\0T€yŒb£8CdWÜJB‘Ëìö}YŒtæIùÔËiú³&ãLGÕ‘,¥g›Ëe» øíû«Qô-Q¤¹“¶ÒÕï!Ž	@·¸*¨ÀÚwuúÆëåA£Þ_I5õËK§Z¢ÙÚ5ÅÇ¢Ë+@¦#*¢‚Ã;V@I<‰Ç*”¾¾Cg£Ü4þQ·þøñz9ec\"3à8>­o/ÜÀsg-«	 ·Žâ+¨]’FŠ0‚U*Aª¨ är­}ÃúœÐÉo-Æžð\\m2ÚI°Œ‚R0r\'î•ñ¶”t¥(¥(¥(1IáƒP÷?{ÿ\0J¯(Ø´Ç¥hð¬b?áýìGü\"¬”¢»–ùVÿ\0E£ûÿ\0§è´b?áe¥åÿ\0ÙS<l[wcÿ\0·±7|ñYÿ\0Ecûÿ\0«-(È½£Ô«_¢±ýˆÿ\0„SôV?±ðŠ²Rî[å[ýìGü\"Ÿ¢±ýˆÿ\0„U–”;–ùV¿Ecûÿ\0¬öü9•;#îþ¨©êQœíòÃG*ÏJQ%)J)J)J)J)J)J)J)J)JQiJQ¥yJP)JQiJQ¥yJP{JRJRJRJRJRƒÿÙ");
INSERT INTO tbl_usuario VALUES("4","4","JOSE","2","1","$2a$07$usesomesillystringforePP9wVrG7ur0QdkQ9rpSzfE/DlP4e8u.","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("5","5","GABRIELA","2","1","$2a$07$usesomesillystringforek7hUNAdfzELkC2Xk6YPva7JCsoP6rh.","","ADMIN","2022-07-26","2022-07-29","ADMIN","");
INSERT INTO tbl_usuario VALUES("6","6","ALEXANDER","2","1","$2a$07$usesomesillystringforeP7mXKbfh9ebyT3M.rcGnqD3gYHLx/pu","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("7","7","CESAR","2","1","$2a$07$usesomesillystringforelk7hEP5l/8xGhqhzzpBD065n5bEXx2S","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("8","8","JUAN","2","2","$2a$07$usesomesillystringfore24KuaN0qO9IVZ9tIXt3l5Gy/G5o.KWm","","LUZ","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("9","9","DAVID","2","8","$2a$07$usesomesillystringforeK2F0CA.OyIc/hzje/abe5/.lBawI8Ca","","CESAR","2022-07-27","","","");
INSERT INTO tbl_usuario VALUES("10","10","IKER","2","8","$2a$07$usesomesillystringforecHYBqgWfna9zyvdLydQv0EYK49B5C82","","ALEXANDER","2022-07-27","2022-07-26","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("11","11","DANIEL","2","5","$2a$07$usesomesillystringforePH8CXTpBjgw/NZeLeXQ6eBg2yFS9OE.","","JOSE","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("12","12","RAQUEL","2","4","$2a$07$usesomesillystringforeUBzOoe/fyqEveRzs1qiMcRg0TjegQPu","","RUT","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("13","13","YAMILETH","2","6","$2a$07$usesomesillystringfore/K7kHH0AKBo3XrR19eUxnbbahup7owe","","GABRIELA","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("14","16","MARGARITA","2","2","$2a$07$usesomesillystringforeVxRNnRV8j0V/Qv7SN5pK5Zs/4jXqeqa","","LUZ","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("15","17","RAMON","2","5","$2a$07$usesomesillystringforeFUN5v3JgHk8ENz9lcf.hrCfeYRowdmi","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("16","18","FRANCISCO","2","6","$2a$07$usesomesillystringfore.OFApK0lnq2pWTrZBEzPs25tOi/peQO","","GABRIELA","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("17","19","JOSUE","2","4","$2a$07$usesomesillystringforeto0mvDpaV0DK4cFtWyWxnWiZ4qt7Z4.","","RUT","2022-07-26","2022-07-26","RUT","");
INSERT INTO tbl_usuario VALUES("18","20","LAURA","2","6","$2a$07$usesomesillystringforeOe47YYBALHNylsq90yhjERGpHl.p9kG","","GABRIELA","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("19","21","MAJO","2","2","$2a$07$usesomesillystringforeVTuDZ.MUZx5QQxqolAMBpd2VqKlfrRa","","LUZ","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("20","22","PAULA","2","5","$2a$07$usesomesillystringforeUvuV8h0neq0uPPmQLgOJsjz2TeSbXeC","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("21","23","MARIO","2","4","$2a$07$usesomesillystringforeC1qiwiZxWnmXgS0TeTaf41.2zC9eoJa","","RUT","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("22","24","CRIS","2","8","$2a$07$usesomesillystringforemrCfnY4uA0DxWUm8xBIP17QxqXX.scS","","ALEXANDER","2022-07-27","","","");
INSERT INTO tbl_usuario VALUES("23","25","ANDREA","2","8","$2a$07$usesomesillystringforehRJWC.CF6mpqr2p1llRk3PxU/cZ65DS","","CESAR","2022-07-27","","","");
INSERT INTO tbl_usuario VALUES("24","27","KATY","2","8","$2a$07$usesomesillystringforeHgs1s2uw38U9bfe/nzsY9NxbYN5tPiC","","RUT","2022-07-27","2022-07-28","ADMIN","");
INSERT INTO tbl_usuario VALUES("25","29","DESIRETH","2","8","$2a$07$usesomesillystringforeBNDqae843YwiG.YpUXHq9I4KSLbDAQ6","","GABRIELA","2022-07-27","2022-07-26","GABRIELA","");
INSERT INTO tbl_usuario VALUES("26","30","NAOMI","2","8","$2a$07$usesomesillystringfore6EINqszN38WG50TBh9xqXuz82S4gTBK","","LUZ","2022-07-27","","","");
INSERT INTO tbl_usuario VALUES("27","31","ERICK","1","8","$2a$07$usesomesillystringforeP5wUikw4pkTxWim7XoEvmNeS8uKtbjS","","ADMIN","2022-07-27","2022-08-05","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("28","32","ANYH","2","6","$2a$07$usesomesillystringforef3K3SHJ3KU57GQVdI9QQ7CPsELwicyS","","ADMIN","2022-07-29","","","");
INSERT INTO tbl_usuario VALUES("29","33","ISEL","2","4","$2a$07$usesomesillystringforeQcFYFzyEb3JVU3JYKOfs3gUabsUlQWe","","ADMIN","2022-07-29","2022-08-11","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("30","34","ARMANDO","2","4","$2a$07$usesomesillystringforeIWLQb30CQ.VUYtobQCyzQFYDZlzPjV6","","GABRIELA","2022-07-29","2022-08-11","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("31","35","LUISMI","2","2","$2a$07$usesomesillystringforeo.Za9sjz40Tnh798TxidWyZRTQ.mtoC","","LUZ","2022-08-02","","","");
INSERT INTO tbl_usuario VALUES("32","36","VALERIA","2","2","$2a$07$usesomesillystringforeXAQheGJF7USzYzdQgtA7gv6RllsR2Va","","ADMIN","2022-08-02","","","");



SET FOREIGN_KEY_CHECKS=1;