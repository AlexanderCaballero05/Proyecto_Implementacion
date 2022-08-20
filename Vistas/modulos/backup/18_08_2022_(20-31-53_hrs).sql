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

INSERT INTO tbl_alergias VALUES("1","ALERGIA AL AGUA","EXTRAÑO PADECIMIENTO","DANIEL","2022-07-27","","0000-00-00","2");
INSERT INTO tbl_alergias VALUES("2","ALERGIA CUTÁNEAS","REACCIÓN ALERGICA QUE CAUSA UNA INFLAMACIÓN CUTÁNEA QUE PROVOCA UNA ERUPCIÓN ABULTADA","PAULA","2022-07-27","","0000-00-00","2");



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
  `NOMBRE` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_AREA`),
  KEY `ESTADO_FK` (`CODIGO_ESTADO`),
  CONSTRAINT `ESTADO_FK` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_area VALUES("1","ACADEMICA","AREA DE CLASES ","2","ADMIN","2022-08-12","0000-00-00","");
INSERT INTO tbl_area VALUES("2","MEDICA","AREA DE MEDICINA ","2","ADMIN","2022-08-12","0000-00-00","");
INSERT INTO tbl_area VALUES("3","PSICOLOGICA","AREA DE PSICOLOGIA","2","ADMIN","2022-08-12","2022-08-18","ADMIN");
INSERT INTO tbl_area VALUES("4","ESPIRITUAL","AREA ESPIRITUAL ","2","ADMIN","2022-08-12","2022-08-15","ADMIN");



DROP TABLE IF EXISTS tbl_bitacora_sistema;

CREATE TABLE `tbl_bitacora_sistema` (
  `CODIGO_BITACORA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) NOT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `CAMPO` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'CAMPO REGISTRO',
  `FECHA` date DEFAULT NULL,
  `ACCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `VAL_ANTERIOR` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `VAL_ACTUAL` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'VALOR ACTUAL',
  `ID_REGISTRO` int(11) NOT NULL COMMENT 'ID DEL REGISTRO MODIFICADO',
  PRIMARY KEY (`CODIGO_BITACORA`),
  KEY `FK_COD_USU_BIT` (`CODIGO_USUARIO`),
  KEY `FK_COD_OBJ_BIT` (`CODIGO_OBJETO`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_bitacora_sistema VALUES("1","1","25","TIPO_ROL","2022-08-16","MODIFICACIÓN","ADMINISTRADOR","TUTOR","32");
INSERT INTO tbl_bitacora_sistema VALUES("2","1","20","CARGA","2022-08-16","INSERCIÓN","","2","1");
INSERT INTO tbl_bitacora_sistema VALUES("3","1","20","CARGA","2022-08-16","INSERCIÓN","","5","15");
INSERT INTO tbl_bitacora_sistema VALUES("4","6","6","VALOR","2022-08-16","MODIFICACIÓN","11","5","0");
INSERT INTO tbl_bitacora_sistema VALUES("5","6","3","VALOR","2022-08-16","MODIFICACIÓN","11","6","11");
INSERT INTO tbl_bitacora_sistema VALUES("6","6","3","VALOR","2022-08-16","MODIFICACIÓN","","5","11");
INSERT INTO tbl_bitacora_sistema VALUES("7","6","3","VALOR","2022-08-16","MODIFICACIÓN","5","6","11");
INSERT INTO tbl_bitacora_sistema VALUES("8","6","3","VALOR","2022-08-16","MODIFICACIÓN","pruebaprosecar@outlook.com","Prosecar@gmail.com","7");
INSERT INTO tbl_bitacora_sistema VALUES("9","6","20","CARGA","2022-08-16","INSERCIÓN","","PERSEVERANCIA","16");
INSERT INTO tbl_bitacora_sistema VALUES("10","6","3","VALOR","2022-08-16","MODIFICACIÓN","Prosecar@gmail.com","ProsecarProyecto@gmail.com","7");
INSERT INTO tbl_bitacora_sistema VALUES("11","6","25","TIPO_ROL","2022-08-16","MODIFICACIÓN","ADMINISTRADOR","SUPER USUARIO","6");
INSERT INTO tbl_bitacora_sistema VALUES("12","6","25","TIPO_ROL","2022-08-16","MODIFICACIÓN","PSICOLOGO","PSICOLOGO","29");
INSERT INTO tbl_bitacora_sistema VALUES("13","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","MEDICO","MEDICO","11");
INSERT INTO tbl_bitacora_sistema VALUES("14","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","PSICOLOGO","PSICOLOGO","29");
INSERT INTO tbl_bitacora_sistema VALUES("15","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","MEDICO","MEDICO","11");
INSERT INTO tbl_bitacora_sistema VALUES("16","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","CATEQUISTA","CATEQUISTA","13");
INSERT INTO tbl_bitacora_sistema VALUES("17","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","CATEQUISTA","CATEQUISTA","13");
INSERT INTO tbl_bitacora_sistema VALUES("18","6","23","ESTUDIANTE","2022-08-17","INSERCIÓN","","5","26");
INSERT INTO tbl_bitacora_sistema VALUES("19","6","26","ESTADO","2022-08-17","MODIFICACIÓN","NUEVO","INACTIVO","31");
INSERT INTO tbl_bitacora_sistema VALUES("20","6","32","ENCARGADO","2022-08-17","MODIFICACIÓN","PAULA MARADIAGA","PAULA MARADIAGA","12");
INSERT INTO tbl_bitacora_sistema VALUES("21","6","32","ENCARGADO","2022-08-17","MODIFICACIÓN","DANIEL MARTINEZ","PAULA MARADIAGA","54");
INSERT INTO tbl_bitacora_sistema VALUES("22","6","32","ENCARGADO","2022-08-17","MODIFICACIÓN","DANIEL MARTINEZ","DANIEL MARTINEZ","56");
INSERT INTO tbl_bitacora_sistema VALUES("23","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","PSICOLOGO","PSICOLOGO","29");
INSERT INTO tbl_bitacora_sistema VALUES("24","6","32","ENCARGADO","2022-08-17","MODIFICACIÓN","MARIO POW","ISEL FLORES","15");
INSERT INTO tbl_bitacora_sistema VALUES("25","6","32","ENCARGADO","2022-08-17","MODIFICACIÓN","MARIO POW","MARIO POW","16");
INSERT INTO tbl_bitacora_sistema VALUES("26","6","32","ENCARGADO","2022-08-17","MODIFICACIÓN","ANY HERNANDEZ","YAMILETH AGUILERA","67");
INSERT INTO tbl_bitacora_sistema VALUES("27","6","25","USUARIO","2022-08-17","INSERCIÓN","","ALEXANDER","33");
INSERT INTO tbl_bitacora_sistema VALUES("28","6","32","ENCARGADO","2022-08-17","MODIFICACIÓN","YAMILETH AGUILERA","FRANCISCO FLORES","66");
INSERT INTO tbl_bitacora_sistema VALUES("29","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","SUPER USUARIO","ADMINISTRADOR","6");
INSERT INTO tbl_bitacora_sistema VALUES("30","6","3","VALOR","2022-08-17","MODIFICACIÓN","Prosecar123*","*Iamhappy.2020*","6");
INSERT INTO tbl_bitacora_sistema VALUES("31","6","3","VALOR","2022-08-17","MODIFICACIÓN","ProsecarProyecto@gmail.com","aacaballero@unah.hn","7");
INSERT INTO tbl_bitacora_sistema VALUES("32","6","3","VALOR","2022-08-17","MODIFICACIÓN","INACTIVO","ACTIVO","22");
INSERT INTO tbl_bitacora_sistema VALUES("33","6","3","VALOR","2022-08-17","MODIFICACIÓN","smtp-mail.outlook.com","smtp.office365.com","5");
INSERT INTO tbl_bitacora_sistema VALUES("34","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","ESTUDIANTE","ESTUDIANTE","33");
INSERT INTO tbl_bitacora_sistema VALUES("35","6","3","VALOR","2022-08-17","MODIFICACIÓN","587","587","8");
INSERT INTO tbl_bitacora_sistema VALUES("36","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","ESTUDIANTE","ESTUDIANTE","33");
INSERT INTO tbl_bitacora_sistema VALUES("37","6","3","VALOR","2022-08-17","MODIFICACIÓN","*Iamhappy.2020*","*Iamhappy.2020*","6");
INSERT INTO tbl_bitacora_sistema VALUES("38","6","3","VALOR","2022-08-17","MODIFICACIÓN","*Iamhappy.2020*","564654564564","6");
INSERT INTO tbl_bitacora_sistema VALUES("39","6","25","TIPO_ROL","2022-08-17","MODIFICACIÓN","ESTUDIANTE","ESTUDIANTE","33");
INSERT INTO tbl_bitacora_sistema VALUES("40","1","3","VALOR","2022-08-18","MODIFICACIÓN","01-01-2011","2011-01-01","23");
INSERT INTO tbl_bitacora_sistema VALUES("41","1","26","ESTADO","2022-08-18","MODIFICACIÓN","ACTIVO","ACTIVO","38");
INSERT INTO tbl_bitacora_sistema VALUES("42","1","26","ESTADO","2022-08-18","MODIFICACIÓN","ACTIVO","INACTIVO","38");
INSERT INTO tbl_bitacora_sistema VALUES("43","1","32","ENCARGADO","2022-08-18","MODIFICACIÓN","MARIO POW","MARIO POW","48");
INSERT INTO tbl_bitacora_sistema VALUES("44","1","32","ENCARGADO","2022-08-18","MODIFICACIÓN","PAULA MARADIAGA","PAULA MARADIAGA","59");
INSERT INTO tbl_bitacora_sistema VALUES("45","1","32","ENCARGADO","2022-08-18","MODIFICACIÓN","DANIEL MARTINEZ","DANIEL MARTINEZ","2");
INSERT INTO tbl_bitacora_sistema VALUES("46","1","32","ENCARGADO","2022-08-18","MODIFICACIÓN","ISEL FLORES","ISEL FLORES","15");
INSERT INTO tbl_bitacora_sistema VALUES("47","1","32","ENCARGADO","2022-08-18","MODIFICACIÓN","DANIEL MARTINEZ","DANIEL MARTINEZ","57");
INSERT INTO tbl_bitacora_sistema VALUES("48","1","32","ENCARGADO","2022-08-18","MODIFICACIÓN","PAULA MARADIAGA","PAULA MARADIAGA","12");
INSERT INTO tbl_bitacora_sistema VALUES("49","1","32","ENCARGADO","2022-08-18","MODIFICACIÓN","FRANCISCO FLORES","FRANCISCO FLORES","66");
INSERT INTO tbl_bitacora_sistema VALUES("50","1","32","ENCARGADO","2022-08-18","MODIFICACIÓN","DANIEL MARTINEZ","DANIEL MARTINEZ","60");
INSERT INTO tbl_bitacora_sistema VALUES("51","1","32","ENCARGADO","2022-08-18","MODIFICACIÓN","MARIO POW","MARIO POW","48");
INSERT INTO tbl_bitacora_sistema VALUES("52","1","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","ADMINISTRADOR","TUTOR","6");
INSERT INTO tbl_bitacora_sistema VALUES("53","1","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","ESTUDIANTE","ESTUDIANTE","33");
INSERT INTO tbl_bitacora_sistema VALUES("54","1","26","ESTADO","2022-08-18","MODIFICACIÓN","ACTIVO","INACTIVO","38");
INSERT INTO tbl_bitacora_sistema VALUES("55","1","3","VALOR","2022-08-18","MODIFICACIÓN","2011-01-01","2012-01-01","23");
INSERT INTO tbl_bitacora_sistema VALUES("56","1","25","CORREO ELECTRONICO","2022-08-18","MODIFICACIÓN","CESARROVELO@GMAIL.COM","CesarRovelo@gmail.com","7");
INSERT INTO tbl_bitacora_sistema VALUES("57","1","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","PSICOLOGO","PSICOLOGO","29");
INSERT INTO tbl_bitacora_sistema VALUES("58","1","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","PSICOLOGO","PSICOLOGO","29");
INSERT INTO tbl_bitacora_sistema VALUES("59","1","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","ESTUDIANTE","ESTUDIANTE","27");
INSERT INTO tbl_bitacora_sistema VALUES("60","1","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","ADMINISTRADOR","ADMINISTRADOR","3");
INSERT INTO tbl_bitacora_sistema VALUES("61","20","32","ENCARGADO","2022-08-18","MODIFICACIÓN","PAULA SOFIA MARADIAGA GARCIA","ADMIN ADMIN","77");
INSERT INTO tbl_bitacora_sistema VALUES("62","1","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","TUTOR","SUPER USUARIO","6");
INSERT INTO tbl_bitacora_sistema VALUES("63","6","3","VALOR","2022-08-18","MODIFICACIÓN","2012-01-01","2010-01-01","23");
INSERT INTO tbl_bitacora_sistema VALUES("64","6","23","ESTUDIANTE","2022-08-18","INSERCIÓN","","8","27");
INSERT INTO tbl_bitacora_sistema VALUES("65","6","23","TUTORIA_ACADEMICA","2022-08-18","ELIMINAR","","","27");
INSERT INTO tbl_bitacora_sistema VALUES("66","6","20","ENCARGADO","2022-08-18","MODIFICACIÓN","MARIA MONTALVAN","JUAN PEREZ","4");
INSERT INTO tbl_bitacora_sistema VALUES("67","6","32","ENCARGADO","2022-08-18","MODIFICACIÓN","DANIEL MARTINEZ","PAULA MARADIAGA","74");
INSERT INTO tbl_bitacora_sistema VALUES("68","6","23","ESTUDIANTE","2022-08-18","INSERCIÓN","","3","28");
INSERT INTO tbl_bitacora_sistema VALUES("69","6","23","ESTUDIANTE","2022-08-18","INSERCIÓN","","3","29");
INSERT INTO tbl_bitacora_sistema VALUES("70","6","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","PSICOLOGO","PSICOLOGO","29");
INSERT INTO tbl_bitacora_sistema VALUES("71","6","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","PSICOLOGO","PSICOLOGO","29");
INSERT INTO tbl_bitacora_sistema VALUES("72","6","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","SUPER USUARIO","ADMINISTRADOR","6");
INSERT INTO tbl_bitacora_sistema VALUES("73","6","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","ADMINISTRADOR","ADMINISTRADOR","6");
INSERT INTO tbl_bitacora_sistema VALUES("74","6","3","VALOR","2022-08-18","MODIFICACIÓN","564654564564","jfpsfjpdsfjpdsf","6");
INSERT INTO tbl_bitacora_sistema VALUES("75","6","3","VALOR","2022-08-18","MODIFICACIÓN","2010-01-01","2012-01-01","23");
INSERT INTO tbl_bitacora_sistema VALUES("76","6","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","ESTUDIANTE","SUPER USUARIO","33");
INSERT INTO tbl_bitacora_sistema VALUES("77","6","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","ADMINISTRADOR","SUPER USUARIO","6");
INSERT INTO tbl_bitacora_sistema VALUES("78","6","25","TIPO_ROL","2022-08-18","MODIFICACIÓN","PSICOLOGO","TUTOR","30");



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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_carga_academica VALUES("1","2","18","1","1","2","13:30:00","14:00:00","2022-08-02","2022-08-27","2022","2","GABRIELA","2022-07-27","2022-08-03","ALEXANDER");
INSERT INTO tbl_carga_academica VALUES("2","6","16","1","1","2","13:30:00","14:00:00","2022-08-04","2022-08-31","2022","1","ADMIN","2022-07-27","2022-08-03","RUT");
INSERT INTO tbl_carga_academica VALUES("3","4","8","1","1","2","14:00:00","15:07:00","2022-07-30","2022-11-26","2022","1","CESAR","2022-07-27","0000-00-00","");
INSERT INTO tbl_carga_academica VALUES("4","6","8","1","3","2","13:00:00","14:00:00","2022-07-26","2022-08-26","2022","2","ALEXANDER","2022-07-27","2022-08-19","ALEXANDER");
INSERT INTO tbl_carga_academica VALUES("5","3","18","1","3","2","11:00:00","12:00:00","2022-07-27","2022-08-28","2022","4","RUT","2022-07-27","0000-00-00","");
INSERT INTO tbl_carga_academica VALUES("6","1","16","1","2","2","10:00:00","11:00:00","2022-07-26","2022-08-31","2022","2","ALEXANDER","2022-07-27","0000-00-00","");
INSERT INTO tbl_carga_academica VALUES("7","5","32","1","1","2","14:00:00","15:00:00","2022-08-02","2022-09-29","2022","4","LUZ","2022-08-03","0000-00-00","");
INSERT INTO tbl_carga_academica VALUES("8","3","13","1","2","2","11:00:00","11:00:00","2022-08-06","2022-08-17","2022","3","CESAR","2022-08-03","0000-00-00","");
INSERT INTO tbl_carga_academica VALUES("9","3","20","1","1","2","14:00:00","15:00:00","2022-08-16","2022-08-30","2022","2","ADMIN","2022-08-16","0000-00-00","");
INSERT INTO tbl_carga_academica VALUES("16","5","18","1","3","2","16:00:00","17:00:00","2022-08-16","2022-08-24","2022","2","ALEXANDER","2022-08-17","2022-08-17","ALEXANDER");



DROP TABLE IF EXISTS tbl_consulta_espiritual;

CREATE TABLE `tbl_consulta_espiritual` (
  `CODIGO_CONSULTA_ESPIRITUAL` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(10) DEFAULT NULL,
  `MOTIVO_CONSULTA` longtext DEFAULT NULL,
  `OBSERVACIONES` longtext DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONSULTA_ESPIRITUAL`),
  KEY `COD_CITA_ESPI_FK` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_consulta_espiritual VALUES("1","17","Consejo espiritual","Ninguna","2022-07-26");
INSERT INTO tbl_consulta_espiritual VALUES("3","64","bienei","bneibei","2022-08-15");
INSERT INTO tbl_consulta_espiritual VALUES("4","72","ORIENTACION ESPIRITUAL","NINGUNA","2022-08-17");



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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_consulta_medica VALUES("1","1","11","Fiebre alta","Tiene baja las plaquetas","Ninguna"," Ninguna","","2022-07-27","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("2","2","4","inflamación, dolor y ardor","grave","toda la cara"," piel muy irritada","","2022-07-27","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("3","3","18","le duele la cabeza en situaciones de estrés","migraña a causa de estrés","al tomarse el medicamento se siente mejor"," todo bien","","2022-07-27","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("4","4","3","ninguno","ninguno","ninguno"," ninguno","","2022-07-27","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("5","5","20","fiebre,vomito dolor de cabeza etc","se ve muy mal","no se tiene aun"," mandar a hacer examenes y recetar","","2022-07-29","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("6","6","26","fiebre dolor de cuepero","NO SE TIENE uno aun","ninguno"," nada aun","","2022-07-30","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("7","7","34","no tiene","no tiene ","no tiene "," no tiene","","2022-07-30","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("8","8","35","no tienen","no tiene","no tiene "," no tiene","","2022-07-30","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("9","9","22","nkjnjknkjnk","jnknjnknknj","jknkjnkjn"," nmknm,n,mnm,","","2022-07-30","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("10","10","23","jkjkhk","jnkjnkjnhjkhhkjhjhkjhkh","jnkjnkjnjknkjhkjhkjkkjhk"," jnkkkjhhkkjhkhkjhkj","","2022-07-30","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("11","11","40","DIARREA","AGUDO","LEVE"," NINGUNO","","2022-08-03","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("12","12","42","FIEBRE ALTA","POSIBLE INFECCION ORINARIA","EN TRATAMIENTO"," NINGUNO","","2022-08-03","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("13","13","43","MAREOS ","PRESION ALTA","NINGUNA"," PRESENTA  PRESION ALTA ","","2022-08-03","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("14","14","50","DOLOR DE CABEZA","POSIBLE FIEBRE","LEVE"," NINGUNO","","2022-08-03","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("15","15","51","DOLOR DE CABEZA,NAUESAS","RECETAR MEDICAMENTOS Y EXAMNE","SE ESPERAN BUENOS RESULTADOS"," NINGUNA","","2022-08-03","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("16","16","52","DOLOR DE CUERPO","POSIBLE COVID","LEVE","  NINGUNO","","2022-08-03","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("17","17","58","FIEBRE","INFECCION EN LA GARGANTA","BIEN"," BIEN","","2022-08-16","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("18","18","70","FIEBRE ALTA","POSIBLE DENGUE","EXCELENTE"," BIENDD","","2022-08-18","0000-00-00","");
INSERT INTO tbl_consulta_medica VALUES("19","19","60","BIEN BEIEN","NEIRII","NERIERINI"," IRNEIERIENRIE","","2022-08-19","0000-00-00","");



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
INSERT INTO tbl_correo_electronico VALUES("CesarRovelo@gmail.com","7");
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
INSERT INTO tbl_correo_electronico VALUES("Valeroa@gmail.com","36");
INSERT INTO tbl_correo_electronico VALUES("francisco12@gmail.com","38");



DROP TABLE IF EXISTS tbl_especialidad;

CREATE TABLE `tbl_especialidad` (
  `CODIGO_ESPECIALIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `CODIGO_AREA` int(5) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `CODIGO_ESTADO` int(5) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESPECIALIDAD`),
  KEY `ESTADO_FK_CODIGO` (`CODIGO_ESTADO`),
  KEY `AREA_FK` (`CODIGO_AREA`),
  CONSTRAINT `AREA_FK` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `tbl_area` (`CODIGO_AREA`),
  CONSTRAINT `ESTADO_FK_CODIGO` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_especialidad VALUES("1","MEDICINA GENERAL","2","ATIENDE ENFERMEDADES GENERICAS","2","ADMIN","2022-08-12","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("2","TERAPIA GENERAL","3","ENSEÑA LAS TERAPIAS GENERICAS","2","ADMIN","2022-08-12","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("3","CATEQUESIS JUVENIL","4","BRINDA CHARLAS SOBRE DIOS","2","ADMIN","2022-08-12","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("4","PEDIATRIA","2","BRINDA ATENCIÓN A MENORES DE EDAD","2","ADMIN","2022-08-12","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("5","PSICOLOGIA COGNITIVA CONDUCTUAL","3","BRINDA CONSULTA A LOS PERSONAS CON TRASTORNOS","2","ADMIN","2022-08-12","0000-00-00","");



DROP TABLE IF EXISTS tbl_estado;

CREATE TABLE `tbl_estado` (
  `CODIGO_ESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estado VALUES("1","NUEVO","CAMPOS ACTIVOS");
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estudiante VALUES("1","9","QUINTO","NO","85","matematica","videojuegos","youtube","ingeniero");
INSERT INTO tbl_estudiante VALUES("2","10","TERCERO","NO","90","Matemáticas","Ver televisión","Redes sociales","Estudiar en la Unah");
INSERT INTO tbl_estudiante VALUES("3","24","NOVENO","NO","90","Inglés","Ver televisión","Redes sociales","Estudiar medicina");
INSERT INTO tbl_estudiante VALUES("4","25","QUINTO","NO","96","Matematica","television","celular","doctora");
INSERT INTO tbl_estudiante VALUES("5","27","SEPTIMO","NO","98","ninguna","leer hacer calculos matematicos","youtube","ser astronauta");
INSERT INTO tbl_estudiante VALUES("6","29","OCTAVO","NO","80","Español","Dibujar","Videos Juegos","Estudiar Ingeniería Agrónomo ");
INSERT INTO tbl_estudiante VALUES("7","30","ONCEAVO","NO","90","Inglés","Decorar y dibujar","Instagram","Ser Doctora");
INSERT INTO tbl_estudiante VALUES("8","31","OCTAVO","NO","80","matematicas","jugar futbol","redes sociales","ir a la universidad");
INSERT INTO tbl_estudiante VALUES("9","38","SEGUNDO","NO","100","Español","Ver television","Redes Sociales","Estudiar en la UNAH");



DROP TABLE IF EXISTS tbl_estudiante_socioeconomico;

CREATE TABLE `tbl_estudiante_socioeconomico` (
  `CODIGO_ESTUDIANTE_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(15) NOT NULL,
  `CODIGO_ESTUDIANTE` int(15) NOT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE_SOCIOECONOMICO`),
  KEY `FK_CONTSOCIO` (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_CON_ES` (`CODIGO_ESTUDIANTE`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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
INSERT INTO tbl_estudiante_socioeconomico VALUES("61","1","9");
INSERT INTO tbl_estudiante_socioeconomico VALUES("62","4","9");
INSERT INTO tbl_estudiante_socioeconomico VALUES("63","7","9");
INSERT INTO tbl_estudiante_socioeconomico VALUES("64","8","9");
INSERT INTO tbl_estudiante_socioeconomico VALUES("65","11","9");
INSERT INTO tbl_estudiante_socioeconomico VALUES("66","12","9");
INSERT INTO tbl_estudiante_socioeconomico VALUES("67","13","9");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_examenes_medicos VALUES("1","HEMOGRAMA","","DANIEL","2022-07-27","0000-00-00","","2");
INSERT INTO tbl_examenes_medicos VALUES("2","ELECTROGRAMA","","DANIEL","2022-07-30","0000-00-00","","2");
INSERT INTO tbl_examenes_medicos VALUES("4","PRUEBA","bien","DANIEL","2022-08-16","0000-00-00","","2");



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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO tbl_examenes_pacientes VALUES("15","17","1","BIEN","EN LA MAÑANA");
INSERT INTO tbl_examenes_pacientes VALUES("16","18","1","Ninguna","Ninguna");
INSERT INTO tbl_examenes_pacientes VALUES("17","19","2","DSFDSFDSFDS","RFEWFSDEF");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_expediente_espiritual VALUES("1","10","2","Santa Tereza de Jesus","Ninguno","Hace 1 año","Participar en las actividades","2022-07-26");
INSERT INTO tbl_expediente_espiritual VALUES("2","9","2","alemania","ninguna","1 año ","dios ","2022-07-30");
INSERT INTO tbl_expediente_espiritual VALUES("3","38","2","sagrado Corazon","Ninguno","1 año","Participar","2022-08-17");



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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_medico VALUES("1","10","2","9","Ninguno","Asma leve","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("2","31","2","8","ninguno por el momento","alergias unicamente","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("3","30","2","9","acetaminofén","migraña","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("4","27","2","8","ninguno","nou tiene","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("5","25","2","8","ninguno por los momentos","no tiene","2022-07-30");
INSERT INTO tbl_expediente_medico VALUES("6","9","2","8","no tiene","no tiene","2022-07-30");
INSERT INTO tbl_expediente_medico VALUES("7","24","2","9","NO TIENEn","no tiene","2022-07-30");
INSERT INTO tbl_expediente_medico VALUES("8","29","2","8","NINGUNO","DEPRESION LEVE","2022-08-02");
INSERT INTO tbl_expediente_medico VALUES("9","38","2","8","NINGUNO","NINGUNO","2022-08-17");



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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_psicologico_consulta VALUES("1","10","ESCUCHA VOCES,NO PUEDE DORMIR POR LA NOCHES","NINGUNO","SE ESPERA EN RESULTADOS","ES UN CASO DELICADO","","2022-07-27","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("2","9","SE PRESENTA TRISTEZA EN LA MAYOR PARTE DEL TIEMPO","POR LOS SINTOMAS ENCONTRADO LA PERSONA SUFRE DEPRESION","HA MEJORADO AL HACER EJERCICIOS FISICOS","NINGUNA","","2022-07-27","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("3","13","NO TIENE SITNOMAS EL DIA DE HOY","ESTA MEDIO MAL HUMOR","TODAVIA NO SE TIENE","NO SE LE VA CREAR PLAN,SOLO HACER CHARLAS ","","2022-07-27","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("4","41","NERVIOSISMO, DOLORES DE CABEZA INTENSOS","ANSIEDAD SOCIAL","ANSIEDAD","LE CUESTA COMUNICARSE","","2022-08-03","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("5","44","POCA PACIENCIA Y TOLERANCIA","SINTOMAS DE ABANDONO","IRA","SE COMPORTA DEMASIADO INFANTIL","","2022-08-03","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("6","45","NO TIENE ","NO SE TIENE AUN","SE ESPERA QUE BUENO","NINGUNA","","2022-08-03","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("7","46","NO TIENE ","NO TIENE","NO TIENE","NO TIENE","","2022-08-03","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("8","47","NO PUEDE DORMIR EN LA NOCHE,VE SOMBRAS","SE VE TEMEROSA,MIEDOSA","SE ESPERAN BUENOS RESULTADOS","RECETAR PLAN","","2022-08-03","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("9","49","ESCULLAS VOCES,LE CUESTA DORMIR POR LAS NOCHES","ES UN CASO DELICADO,SE DEBE TRATAR CON DISCRECION","NO SE TIENE AUN ","NINGUNA","","2022-08-03","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("10","71","ANSIEDAD","BIEN BIEN","BIEN BIEN","BIEN BIEN","","2022-08-18","","0000-00-00");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("11","75","ANSIEDAD","NINGUNO","NINGUNO","NINGUNO","","2022-08-19","","0000-00-00");



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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_psicologico_unico VALUES("1","31","2","SUS FAMILIARES TUVIERON PROBLEMAS DE EQUIZOFRENIA NIVEL 4","SOSPECHAS DE EQUIZOFRENIA","SALUDABLE","2022-07-26");
INSERT INTO tbl_expediente_psicologico_unico VALUES("2","29","2","VIVE CON SUS PADRES  Y SE OBSERVA UNA EXCELENTE RELACION ","TIENE APTITUD POSITIVA ","NINGUNOS ","2022-07-26");
INSERT INTO tbl_expediente_psicologico_unico VALUES("3","30","2","DEPRESIÓN","ANSIEDAD","NINGUNO","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("4","24","2","IRA","NINGUNO","NINGUNO","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("5","27","2","NO TIENE NINGUNO","NO TIENE,PERO PUEDE PADECER ALGUNSO","SE ENCUENTRA EN BUENA SALUD","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("6","9","2","NO PRESENTA NINGUNO","TENDECIAS EQUIZOFRENICAS DESDE PEQUEÑO","SOLO PRESENTA ALERGIAS","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("7","38","2","NINGUNO","NINGUNO","NINGUNO","2022-08-17");



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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_familiares_estudiante VALUES("1","2","1","1");
INSERT INTO tbl_familiares_estudiante VALUES("2","1","2","2");
INSERT INTO tbl_familiares_estudiante VALUES("3","4","3","2");
INSERT INTO tbl_familiares_estudiante VALUES("4","2","4","2");
INSERT INTO tbl_familiares_estudiante VALUES("5","1","3","2");
INSERT INTO tbl_familiares_estudiante VALUES("6","1","4","8");
INSERT INTO tbl_familiares_estudiante VALUES("7","9","1","7");
INSERT INTO tbl_familiares_estudiante VALUES("8","9","4","8");
INSERT INTO tbl_familiares_estudiante VALUES("9","3","1","1");
INSERT INTO tbl_familiares_estudiante VALUES("10","3","4","2");



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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_inscripcion_cita VALUES("1","27","6","7","3","2022-07-27","10:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("2","27","1","5","3","2022-08-19","12:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("3","27","1","13","2","2022-07-26","09:30:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("4","31","8","13","2","2022-07-26","09:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("5","29","6","7","3","2022-08-15","09:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("6","9","1","7","2","2022-07-27","12:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("7","25","4","7","2","2022-07-27","14:30:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("8","10","1","7","2","2022-07-26","09:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("9","29","9","13","3","2022-07-26","13:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("10","31","2","13","3","2022-07-26","17:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("11","10","1","13","2","2022-07-26","12:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("12","31","8","5","2","2022-08-18","14:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("13","31","2","13","3","2022-07-26","15:30:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("14","25","4","7","2","2022-08-24","18:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("15","29","11","5","3","2022-08-20","14:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("16","29","9","5","3","2022-08-19","14:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("17","10","3","13","4","2022-07-26","11:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("18","30","8","13","2","2022-07-26","15:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("19","10","2","7","3","2022-08-17","15:00:00","2022-07-27","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("20","31","1","13","2","2022-07-28","15:00:00","2022-07-29","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("21","9","10","11","4","2022-07-30","12:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("22","10","1","13","2","2022-07-30","09:00:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("23","31","1","13","2","2022-07-30","09:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("24","30","1","7","2","2022-07-30","10:00:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("25","27","1","7","2","2022-07-30","10:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("26","25","1","13","2","2022-07-30","18:00:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("27","25","1","7","2","2022-07-30","11:00:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("28","10","1","7","2","2022-07-30","11:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("29","31","1","7","2","2022-07-30","12:00:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("30","30","1","7","2","2022-07-30","12:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("31","27","1","7","2","2022-07-30","13:00:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("32","25","1","7","2","2022-07-30","13:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("33","24","9","7","3","2022-07-30","17:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("34","9","8","13","2","2022-07-30","17:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("35","24","8","13","2","2022-07-30","18:00:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("36","9","1","7","2","2022-07-30","14:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("37","24","1","7","2","2022-07-30","16:00:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("38","9","1","7","2","2022-07-30","16:30:00","2022-07-30","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("39","31","4","5","2","2022-08-20","14:00:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("40","31","1","13","2","2022-08-02","09:30:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("41","30","9","13","3","2022-08-02","14:00:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("42","30","4","13","2","2022-08-02","13:00:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("43","31","4","13","2","2022-08-02","15:00:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("44","24","9","13","3","2022-08-02","10:00:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("45","31","6","13","3","2022-08-02","09:00:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("46","30","6","13","3","2022-08-02","09:30:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("47","27","6","13","3","2022-08-02","10:00:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("48","25","9","5","3","2022-08-18","10:30:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("49","9","6","13","3","2022-08-02","10:30:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("50","29","1","13","2","2022-08-02","14:00:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("51","10","1","13","2","2022-08-02","17:00:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("52","9","1","13","2","2022-08-02","15:30:00","2022-08-03","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("54","10","8","5","2","2022-08-19","15:00:00","2022-08-12","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("55","31","9","5","3","2022-08-22","14:00:00","2022-08-12","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("56","10","8","5","2","2022-08-19","10:00:00","2022-08-12","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("57","10","1","5","2","2022-08-22","09:00:00","2022-08-12","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("58","27","1","13","2","2022-08-15","11:00:00","2022-08-12","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("59","25","8","5","2","2022-08-18","09:00:00","2022-08-12","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("60","24","1","13","2","2022-08-18","13:00:00","2022-08-12","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("61","31","11","5","3","2022-08-20","11:00:00","2022-08-13","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("62","27","11","5","3","2022-08-18","11:00:00","2022-08-13","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("63","10","3","5","4","2022-08-19","09:00:00","2022-08-13","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("64","9","3","13","4","2022-08-15","14:00:00","2022-08-13","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("65","9","11","5","3","2022-08-29","16:00:00","2022-08-13","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("66","10","5","5","4","2022-08-18","15:00:00","2022-08-15","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("67","10","3","5","4","2022-08-18","09:00:00","2022-08-15","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("68","31","11","5","3","2022-08-28","15:00:00","2022-08-17","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("69","9","11","5","3","2022-08-31","16:00:00","2022-08-17","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("70","38","8","13","2","2022-08-17","16:00:00","2022-08-17","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("71","38","6","13","3","2022-08-17","17:00:00","2022-08-18","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("72","38","5","13","4","2022-08-17","09:00:00","2022-08-18","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("73","38","5","5","4","2022-08-19","11:00:00","2022-08-18","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("74","30","8","5","2","2022-08-18","16:00:00","2022-08-19","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("75","24","6","13","3","2022-08-18","10:00:00","2022-08-19","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("76","24","11","5","3","2022-08-18","15:00:00","2022-08-19","0000-00-00","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("77","10","1","5","2","2022-08-18","11:00:00","2022-08-19","0000-00-00","0000-00-00","");



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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_matricula_academica VALUES("2","3","4","13","2022-07-27","Falta de atención remitirlo al psicólogo","2022-07-26","CESAR","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("3","2","7","9","2022-07-27","","0000-00-00","LUZ","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("4","1","5","13","2022-07-27","  Debe ir a misa todos los domingos","2022-07-26","RUT","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("5","1","6","9","2022-07-27","","0000-00-00","GABRIELA","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("6","3","1","13","2022-07-27","Practicar en las operaciones de sumar","2022-07-26","CESAR","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("7","3","5","9","2022-07-27","","0000-00-00","RUT","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("8","6","5","9","2022-07-27","","0000-00-00","RUT","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("9","5","4","9","2022-07-27","","0000-00-00","CESAR","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("10","2","8","9","2022-07-27","","0000-00-00","ADMIN","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("12","2","2","9","2022-07-27","","0000-00-00","ALEXANDER","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("14","1","8","9","2022-07-27","","0000-00-00","ADMIN","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("15","3","2","9","2022-07-27","","0000-00-00","ALEXANDER","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("16","1","1","9","2022-07-27","","0000-00-00","CESAR","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("17","5","7","9","2022-07-27","","0000-00-00","LUZ","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("18","6","1","9","2022-07-27","","0000-00-00","GABRIELA","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("19","1","2","9","2022-07-27","","0000-00-00","ALEXANDER","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("20","3","6","9","2022-07-27","","0000-00-00","GABRIELA","2022-07-27","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("22","5","5","9","2022-07-29","","0000-00-00","ADMIN","2022-07-29","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("23","2","1","9","2022-08-05","","0000-00-00","ALEXANDER","2022-08-05","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("24","8","1","9","2022-08-05","","0000-00-00","ALEXANDER","2022-08-05","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("25","6","2","9","2022-08-16","","0000-00-00","ADMIN","2022-08-16","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("26","4","5","9","2022-08-17","","0000-00-00","ALEXANDER","2022-08-17","0000-00-00","");
INSERT INTO tbl_matricula_academica VALUES("28","4","3","9","2022-08-19","","","ALEXANDER","2022-08-19","","");
INSERT INTO tbl_matricula_academica VALUES("29","1","3","9","2022-08-19","","","ALEXANDER","2022-08-19","","");



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

INSERT INTO tbl_medicamento VALUES("0102","ACETAMINAFEN","PARA LA INFECCION","DANIEL","2022-07-27","","0000-00-00","2");
INSERT INTO tbl_medicamento VALUES("01025","IBUPROFENO","PARA LA INFECCION","DANIEL","2022-08-16","","0000-00-00","2");
INSERT INTO tbl_medicamento VALUES("WJ785","ALERGIN","PARA LA ALERGIA","DANIEL","2022-07-27","","0000-00-00","2");



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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_ms_hist_contrasena VALUES("1","2","$2a$07$usesomesillystringfore37tskQ0TgAuqkXPeNH3AVSZts/Lxk.i","2","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("2","4","$2a$07$usesomesillystringforePP9wVrG7ur0QdkQ9rpSzfE/DlP4e8u.","4","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("3","6","$2a$07$usesomesillystringforeP7mXKbfh9ebyT3M.rcGnqD3gYHLx/pu","6","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("4","5","$2a$07$usesomesillystringfore55fKevwQuQAFVH9Lewld91JpLY1ghPG","5","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("5","3","$2a$07$usesomesillystringforeFz7dK1VZWNMEJiH0HNOXYw/HL.5hY4.","3","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("6","7","$2a$07$usesomesillystringforelk7hEP5l/8xGhqhzzpBD065n5bEXx2S","7","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("7","11","$2a$07$usesomesillystringforePH8CXTpBjgw/NZeLeXQ6eBg2yFS9OE.","11","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("8","12","$2a$07$usesomesillystringforeUBzOoe/fyqEveRzs1qiMcRg0TjegQPu","12","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("9","15","$2a$07$usesomesillystringforeFUN5v3JgHk8ENz9lcf.hrCfeYRowdmi","15","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("10","17","$2a$07$usesomesillystringforeto0mvDpaV0DK4cFtWyWxnWiZ4qt7Z4.","17","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("11","13","$2a$07$usesomesillystringfore/K7kHH0AKBo3XrR19eUxnbbahup7owe","13","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("12","20","$2a$07$usesomesillystringforeUvuV8h0neq0uPPmQLgOJsjz2TeSbXeC","20","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("13","21","$2a$07$usesomesillystringforeC1qiwiZxWnmXgS0TeTaf41.2zC9eoJa","21","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("14","16","$2a$07$usesomesillystringfore.OFApK0lnq2pWTrZBEzPs25tOi/peQO","16","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("15","8","$2a$07$usesomesillystringfore24KuaN0qO9IVZ9tIXt3l5Gy/G5o.KWm","8","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("16","10","$2a$07$usesomesillystringforecHYBqgWfna9zyvdLydQv0EYK49B5C82","10","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("17","14","$2a$07$usesomesillystringforeVxRNnRV8j0V/Qv7SN5pK5Zs/4jXqeqa","14","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("18","18","$2a$07$usesomesillystringforeOe47YYBALHNylsq90yhjERGpHl.p9kG","18","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("19","19","$2a$07$usesomesillystringforeVTuDZ.MUZx5QQxqolAMBpd2VqKlfrRa","19","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("20","22","$2a$07$usesomesillystringforemrCfnY4uA0DxWUm8xBIP17QxqXX.scS","22","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("21","23","$2a$07$usesomesillystringforehRJWC.CF6mpqr2p1llRk3PxU/cZ65DS","23","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("22","24","$2a$07$usesomesillystringforeHgs1s2uw38U9bfe/nzsY9NxbYN5tPiC","24","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("23","25","$2a$07$usesomesillystringforeBNDqae843YwiG.YpUXHq9I4KSLbDAQ6","25","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("24","26","$2a$07$usesomesillystringfore6EINqszN38WG50TBh9xqXuz82S4gTBK","26","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("25","27","$2a$07$usesomesillystringforeP5wUikw4pkTxWim7XoEvmNeS8uKtbjS","27","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("26","9","$2a$07$usesomesillystringforeK2F0CA.OyIc/hzje/abe5/.lBawI8Ca","9","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("27","29","$2a$07$usesomesillystringforeblZb1GTXAapsXwHWRL.b5euZYiVxqqi","29","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("28","2","$2a$07$usesomesillystringforeCFgULGhtYgEopegGdjbjYiHOQCeHz.S","2","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("29","5","$2a$07$usesomesillystringforek7hUNAdfzELkC2Xk6YPva7JCsoP6rh.","5","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("30","30","$2a$07$usesomesillystringforexaT521Gc5.mSUIJJ0vSh13z7PZH50h2","30","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("31","28","$2a$07$usesomesillystringforef3K3SHJ3KU57GQVdI9QQ7CPsELwicyS","28","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("32","31","$2a$07$usesomesillystringforeo.Za9sjz40Tnh798TxidWyZRTQ.mtoC","31","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("33","32","$2a$07$usesomesillystringforeXAQheGJF7USzYzdQgtA7gv6RllsR2Va","32","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("34","29","$2a$07$usesomesillystringforebrDq7a11hNalS8A/Qc005lZHvD30Wd6","29","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("35","20","$2a$07$usesomesillystringfore2/XnZku.0I5OQxVI56ZyHa5TRoxuZlG","20","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("36","20","$2a$07$usesomesillystringforewunHdCVOHtEdLYWmZ6OuNwTzags6toq","20","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("37","16","$2a$07$usesomesillystringforeYvwVwFdn.wYcLp8bkDtYnY0bKhlJa1O","16","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("38","33","$2a$07$usesomesillystringfore1Lka/UUu/Tc0yO9RQex8mxLVI.5yqkK","33","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("39","33","$2a$07$usesomesillystringforedWaDfnapn9Q356ONwBpq19KvvzhhVwS","33","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("40","33","$2a$07$usesomesillystringforebLW4WEIQC6RIrWG9KG4IjHUse.LljEe","33","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("41","33","$2a$07$usesomesillystringforesTdoLXO3A5.gZs.7Baw3GBzDMV1pA36","33","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("42","20","$2a$07$usesomesillystringforebpEps4WbpHVJcXpWLLEajLXEyJhmmju","20","0000-00-00","0000-00-00","");
INSERT INTO tbl_ms_hist_contrasena VALUES("43","29","$2a$07$usesomesillystringforeZ3x51R2rN0SEQgrkhB/SgtI9y1OSCcK","29","0000-00-00","","");



DROP TABLE IF EXISTS tbl_objetos;

CREATE TABLE `tbl_objetos` (
  `CODIGO_OBJETO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(40) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_OBJETO`),
  KEY `FK_COD_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_COD_ESTADO` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_objetos VALUES("1","ESTADOS","SISTEMA DE ADMINISTRACION. ","2","Administrador","2022-02-09","ADMIN","2022-08-13");
INSERT INTO tbl_objetos VALUES("2","ROLES","OBJETO DONDE SE REGISTRAN PERSONAS   ","2","Administrador","2022-02-06","ADMIN","2022-08-13");
INSERT INTO tbl_objetos VALUES("3","PARAMETROS","PARÁMETROS DEL SISTEMA","2","Administrador","2022-03-04","ADMIN","2022-08-13");
INSERT INTO tbl_objetos VALUES("4","PREGUNTAS","OBJETO MANTENIMIENTO PREGUNTAS  DE SEGURIDAD","2","ADMIN","2022-03-04","ADMIN","2022-08-13");
INSERT INTO tbl_objetos VALUES("5","PERMISOS","OBJETO MANTENIMIENTO PERMISOS  ","2","ADMIN","2022-03-04","ADMIN","2022-08-13");
INSERT INTO tbl_objetos VALUES("6","OBJETOS","OBJETO MANTENIMIENTO OBJETOS DEL SISTEMA","2","ADMIN","2022-03-04","ADMIN","2022-08-13");
INSERT INTO tbl_objetos VALUES("7","BITACORA DEL SISTEMA","OBJETO CONSULTA BITACORA ","2","ADMIN","2022-03-04","ADMIN","2022-06-20");
INSERT INTO tbl_objetos VALUES("10","RESPALDO Y RESTAURACION","OBJETO MANTENIMIENTO BACKUP  ","2","ADMIN","2022-03-04","ADMIN","2022-07-08");
INSERT INTO tbl_objetos VALUES("20","GESTION CARGA ACADEMICA Y ESPIRITUAL","OBJETO MANTENIMIENTO CARGA ACADÉMICA Y ESPIRITUAL","2","ADMIN","2022-03-04","ADMIN","2022-07-08");
INSERT INTO tbl_objetos VALUES("23","MATRICULA ACADEMICA Y ESPIRITUAL","GESTION DE LA MATRICULA ACADEMICA Y ESPIRITUAL","2","ADMIN","2022-03-04","ADMIN","2022-07-08");
INSERT INTO tbl_objetos VALUES("25","GESTION DE PERSONAS","GESTION DE LOS DATOS DE LOS USUARIOS","2","","0000-00-00","ADMIN","2022-08-13");
INSERT INTO tbl_objetos VALUES("26","GESTION DE ESTUDIANTES","OBJETO DE GESTION DE LOS ESTUDIANTES","2","ADMIN","2022-03-10","ADMIN","2022-07-07");
INSERT INTO tbl_objetos VALUES("27","SEGURIDAD","GESTION DE SEGURIDAD","2","ADMIN","2022-03-10","ADMIN","2022-07-07");
INSERT INTO tbl_objetos VALUES("30","AREA MEDICA","OBJETO DE GESTION DE LAS CITAS MEDICAS","2","ADMIN","2022-03-10","ADMIN","2022-07-07");
INSERT INTO tbl_objetos VALUES("31","AREA PSICOLOGIA","OBJETO DEL AREA PSICOLOGICA","2","ADMIN","2022-03-18","ADMIN","2022-07-07");
INSERT INTO tbl_objetos VALUES("32","GESTION DE CITAS","OBJETO QUE GESTIONA LAS CITAS","2","","2022-03-27","ADMIN","2022-07-07");
INSERT INTO tbl_objetos VALUES("38","AREA DEL TUTOR","GESTIÓN DEL MÓDULO DEL TUTOR ACADEMICO","2","","2022-04-21","ADMIN","2022-08-12");
INSERT INTO tbl_objetos VALUES("49","AREA DE ENFERMERIA","OBJETO PARA GESTIONAR LA PRECLÍNICA","2","","2022-04-24","ADMIN","2022-08-13");
INSERT INTO tbl_objetos VALUES("50","PRECLINICA POR MEDICOS","OBJETO PARA VER PRECLINICA POR PARTE DE LOS MEDICOS","2","","2022-04-24","ADMIN","2022-08-12");
INSERT INTO tbl_objetos VALUES("51","AREA DE ESTUDIANTES","VER LO ASIGNADO A EL ESTUDIANTE.","2","ADMIN","2022-05-03","ADMIN","2022-07-08");
INSERT INTO tbl_objetos VALUES("52","AREA ESPIRITUAL","GESTION DEL AREA ESPIRITUAL POR EL CATEQUISTA","2","ALBERT","2022-05-06","ADMIN","2022-07-08");
INSERT INTO tbl_objetos VALUES("54","ACCESO AL SISTEMA","OBJETO QUE DESCRIBE EL ACCESO AL SISTEMA","2","HOLA","2022-06-18","","0000-00-00");
INSERT INTO tbl_objetos VALUES("55","USUARIOS","OBJETO GESTIÓN DE USUARIOS","2","ADMIN","2022-08-13","","0000-00-00");



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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros VALUES("1","NUM_INTEN_VALIDOS","3","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("2","NUM_MAX_PREGUNTAS","2","Administrador","2022-02-07","2022-08-11","ALEXANDER");
INSERT INTO tbl_parametros VALUES("3","NUM_MAX_CONTRASENAS","8","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("4","NUM_MAX_CARACTER","15","Administrador","2022-02-07","2022-04-07","ADMIN");
INSERT INTO tbl_parametros VALUES("5","ADMIN_SERVIDOR_CORREO","smtp.office365.com","","0000-00-00","2022-08-18","ALEXANDER");
INSERT INTO tbl_parametros VALUES("6","ADMIN_CPASSWORD","jfpsfjpdsfjpdsf","","0000-00-00","2022-08-19","ALEXANDER");
INSERT INTO tbl_parametros VALUES("7","ADMIN_CUSUARIO","aacaballero@unah.hn","","0000-00-00","2022-08-18","ALEXANDER");
INSERT INTO tbl_parametros VALUES("8","ADMIN_CPUERTO","587","ADMIN","2022-03-07","2022-08-18","ALEXANDER");
INSERT INTO tbl_parametros VALUES("10","NOMBRE_EMPRESA","PROYECTO SEMILLERO CARMELITANO PROSECAR\n","ADMIN","2022-03-22","0000-00-00","");
INSERT INTO tbl_parametros VALUES("11","MAX_MESES_DE_TUTURIA","6","ADMIN","0000-00-00","2022-08-17","ALEXANDER");
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
INSERT INTO tbl_parametros VALUES("22","RECUPERACION_CORREO","ACTIVO","ALEXANDER","2022-08-13","2022-08-18","ALEXANDER");
INSERT INTO tbl_parametros VALUES("23","FECHA_NACIMIENTO","2012-01-01","ADMIN","2022-08-18","2022-08-19","ALEXANDER");



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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros_usuarios VALUES("1","1","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("2","2","1","0","","0000-00-00","2022-08-11","");
INSERT INTO tbl_parametros_usuarios VALUES("3","2","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("4","2","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("5","2","19","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("6","3","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("7","3","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("8","3","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("9","3","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("10","4","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("11","4","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("12","4","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("13","4","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("14","5","1","3","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("15","5","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("16","5","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("17","5","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("18","6","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("19","6","2","2","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("20","6","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("21","6","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("22","7","1","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("23","7","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("24","7","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("25","7","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("26","8","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("27","8","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("28","8","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("29","8","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("30","9","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("31","9","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("32","9","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("33","9","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("34","10","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("35","10","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("36","10","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("37","10","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("38","11","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("39","11","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("40","11","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("41","11","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("42","12","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("43","12","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("44","12","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("45","12","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("46","13","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("47","13","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("48","13","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("49","13","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("50","14","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("51","14","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("52","14","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("53","14","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("54","15","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("55","15","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("56","15","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("57","15","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("58","16","1","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("59","16","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("60","16","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("61","16","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("62","17","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("63","17","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("64","17","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("65","17","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("66","18","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("67","18","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("68","18","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("69","18","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("70","19","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("71","19","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("72","19","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("73","19","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("74","20","1","3","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("75","20","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("76","20","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("77","20","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("78","21","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("79","21","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("80","21","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("81","21","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("82","22","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("83","22","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("84","22","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("85","22","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("86","23","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("87","23","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("88","23","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("89","23","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("90","24","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("91","24","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("92","24","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("93","24","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("94","25","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("95","25","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("96","25","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("97","25","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("98","26","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("99","26","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("100","26","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("101","26","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("102","27","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("103","27","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("104","27","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("105","27","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("106","28","1","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("107","28","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("108","28","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("109","28","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("110","29","1","2","","0000-00-00","2022-08-11","");
INSERT INTO tbl_parametros_usuarios VALUES("111","29","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("112","29","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("113","29","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("114","30","1","2","","0000-00-00","2022-08-11","");
INSERT INTO tbl_parametros_usuarios VALUES("115","30","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("116","30","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("117","30","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("118","31","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("119","31","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("120","31","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("121","31","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("122","32","1","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("123","32","2","1","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("124","32","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("125","32","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("126","33","1","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("127","33","2","2","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("128","33","3","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("129","33","19","0","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros_usuarios VALUES("130","29","1","2","","0000-00-00","","");



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
INSERT INTO tbl_permisos VALUES("17","1","25","SI","SI","SI","SI","","0000-00-00","$9","2022-08-16");
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
INSERT INTO tbl_permisos VALUES("103","9","55","SI","SI","SI","SI","","2022-08-13","$9","2022-08-15");



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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona VALUES("1","ADMIN","ADMIN","ADMIN","ADMIN","","M","2000-05-20","TEGUCIGALPA","","2022-07-26","0000-00-00","3","","2022-07-26","","0000-00-00");
INSERT INTO tbl_persona VALUES("2","DIANA","RUT","GARCIA","AMADOR","0801200012391","F","2000-06-16","FRANCISCO MORAZAN","EN UNA CASITA :3","2022-07-26","0000-00-00","1","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("3","LUZ","MARÍA","MONTOYA","MEDINA","0801200108492","F","2001-05-04","TEGUCIGALPA","MI CASA","2022-07-26","0000-00-00","1","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("4","JOSE","LUIS","MORALES","DIAZ","0810199365874","M","1993-08-23","TEGUCIGALPA","COLONIA ALEMAN","2022-07-26","0000-00-00","1","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("5","GABRIELA","GISSELA","DIAZ","AGUILERA","0601197000182","F","1970-11-17","CHOLUTECA","BARRIO LAS COLINAS CHOLUTECA ","2022-07-26","0000-00-00","1","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("6","ARNOLD","ALEXANDER","CABALLERO","","1411199600015","M","1990-07-05","OCOTEPEQUE","LA LAGUNA","2022-07-26","0000-00-00","3","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("7","CESAR","FERNANDO","ROVELO","VELASQUEZ","0801199902485","M","1999-02-02","TEGUS","COLONIA LA ESPERANZA","2022-07-26","0000-00-00","1","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("8","JUAN","ALBERTO","PEREZ","CRUZ","1202199601236","M","1996-03-06","LA PAZ","COL. KENEDY","2022-07-26","0000-00-00","2","LUZ","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("9","DAVID","ALEJANDRO","OCHOA","MARQUEZ","0943928932402","M","2011-05-26","TEGUCIGALPA","PRADOS UNIVERSITARIO","2022-07-27","0000-00-00","4","","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("10","IKER","JOSUE","URQUIA","YANES","0801200902454","M","2009-05-01","TEGUCIGALPA","LA LAGUNA","2022-07-27","0000-00-00","4","","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("11","DANIEL","FERDINAND","MARTINEZ","MORADEL","9565566556556","M","1998-05-08","TEGUCIGALPA","COLONIA LAS COLINAS","2022-07-26","0000-00-00","5","JOSE","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("12","LIDIA","RAQUEL","AMADOR","BORJAS","0812331232123","F","1974-06-18","CHOLUTECA","LOMAS DLE GUIJARRO","2022-07-26","0000-00-00","6","RUT","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("13","YAMILETH","KARLA","AGUILERA","DIAZ","0612199500162","F","1995-11-21","PESPIRE","PESPIRE","2022-07-26","0000-00-00","8","GABRIELA","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("14","JOSUE","EMMANUEL","URQUIA","YANES","0801199015454","M","1990-02-05","TEGUCIGALPA","LA LAGUNA","2022-07-26","0000-00-00","7","ALEXANDER","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("15","SENDY","KARINA","MARQUEZ","VELASQUEZ","9891283901823","F","1979-06-13","TEGUCIGALPA","PRADOS UNIVERSITARIO","2022-07-26","0000-00-00","7","CESAR","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("16","ELENA","MARGARITA","MARTINEZ","CASTILLO","0801199032657","F","1990-07-13","TEGUCIGALPA","COL. 15 DE SEPTIEMBRE","2022-07-26","0000-00-00","2","LUZ","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("17","RAMON","JOEL","SOTO","DIAZ","4365445546543","M","1995-04-05","TEGUCIGALPA","COLONIA LAS BRISAS","2022-07-26","0000-00-00","5","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("18","FRANCISCO","","FLORES","","0602199001728","M","1990-07-30","CHOLUTECA","CHOLUTECA","2022-07-26","0000-00-00","8","GABRIELA","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("19","JOSUE","SAMUEL","AGUILAR","ZAPATO","0814700023212","M","1978-05-18","FRANCICOS MORAZA","LAS CASITAS","2022-07-26","0000-00-00","6","RUT","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("20","LAURA","","ESPINAL","","0611198501230","F","1985-10-06","VALLE","VALLE","2022-07-26","0000-00-00","8","GABRIELA","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("21","MARIA","JOSÉ","MONTALVAN","IRIAS","0803199909637","F","1999-03-09","TEGUCIGALPA","COL.  LAS VEGAS","2022-07-26","0000-00-00","2","LUZ","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("22","PAULA","SOFIA","MARADIAGA","GARCIA","0812456859874","F","1993-04-05","SAN PEDRO SULA","COLONIA VIDELLA MORALES","2022-07-26","0000-00-00","5","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("23","MARIO","ALEX","POW","RIVERA","0640148787848","M","1990-08-16","FRANCISCO MORAZAN","MIRAFLORES","2022-07-26","0000-00-00","6","RUT","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("24","CRISTOPHER","JOSUE","URQUIA","YANES","0801200898987","M","2008-02-24","TEGUCIGALPA","COL LA LAGUNA","2022-07-27","0000-00-00","4","","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("25","ANDREA","LUCIA","MACHADO","VELASQUEZ","6657567567567","F","2011-10-04","TEGUCIGALPA","ALDEA DE SUYAPA","2022-07-27","0000-00-00","4","","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("26","KAREN","LIZTHE","MACHADO","VELASQUEZ","6950695096059","F","1984-08-24","TEGUCIGALPA","ALDEA DE SUYAPA","2022-07-26","0000-00-00","7","CESAR","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("27","KATY","DANELA","ZAPATA","MORALES","0801201012339","F","2010-05-15","FRANCISCO MORAZAN","EL PEDREGAL","2022-07-27","0000-00-00","4","","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("28","NOLVIA","MELLISA","GONZALES","","0501989256456","M","1989-05-25","TEGUCIGALPA","COL CERRO GRANDE","2022-07-26","0000-00-00","7","ALEXANDER","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("29","DESIRETH","KENDRA","GALEAS","BACA","0607201000121","F","2010-01-21","MARCOVIA","CHOLUTECA","2022-07-27","0000-00-00","4","","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("30","ESTEFANY","NAOMI","VARELA","MAYORGA","0801200563961","F","2005-01-29","TEGUCIGALPA","LAS CASITAS","2022-07-27","0000-00-00","4","","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("31","ERICK","","VACA","SOTO","0140545447488","M","1998-04-05","SAN PEDRO SULA","COLONIA EL HOGAR","2022-07-27","0000-00-00","4","","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("32","ANY","MELISSA","HERNANDEZ","FUENTES","1702199600058","F","1996-03-13","ALIANZA VALLE","ALBORAYA PUEBLO VALENCIA ","2022-07-29","0000-00-00","8","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("33","ISEL","DARIELA","FLORES","PADILLA","","F","1996-06-02","CHOLUTECA","","2022-07-29","0000-00-00","6","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("34","ARMANDO","JOSE","PERALTA","AGULAR","0608199000125","M","1990-10-20","TEGUCIGALPA","TEGUSCIGALPA","2022-07-29","0000-00-00","2","GABRIELA","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("35","LUISIN","MIGUEL","CRUZ","MENDEZ","0801199012645","M","1990-07-11","TEGUCIGALPA","COL. SAN MIGUEL","2022-08-02","0000-00-00","2","LUZ","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("36","VALERIA","SOFIA","PADILLA","ZEELAYA","0802199000168","F","1990-05-05","ALUBAREN","FRANCISCO MORAZAN ","2022-08-02","0000-00-00","2","ADMIN","0000-00-00","","0000-00-00");
INSERT INTO tbl_persona VALUES("37","RAMIRO","","BRUSCHI","","0515484897498","M","2008-01-07","TEGUCIGALPA","FDSKLNKLJSDHNJFH DSFJHDSFHDSUFYHDSUFYEWURWUIYFSEID","2022-08-17","0000-00-00","3","","2022-08-17","","0000-00-00");
INSERT INTO tbl_persona VALUES("38","ASTRID","ELIZABETH","URQUIA","DIAZ","0801200898565","F","2009-03-04","TEGUCIGALP","LA LAGUNA","2022-08-17","0000-00-00","3","","0000-00-00","","0000-00-00");



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

INSERT INTO tbl_persona_especialidad VALUES("1","11","1","JOSE","2022-07-26","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("2","12","5","RUT","2022-07-26","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("3","13","3","GABRIELA","2022-07-26","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("4","17","4","ADMIN","2022-07-26","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("5","18","3","GABRIELA","2022-07-26","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("6","19","2","RUT","2022-07-26","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("7","20","3","GABRIELA","2022-07-26","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("8","22","1","ADMIN","2022-07-26","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("9","23","2","RUT","2022-07-26","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("10","32","3","ADMIN","2022-07-29","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("11","33","2","ADMIN","2022-07-29","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("12","34","2","GABRIELA","2022-07-29","0000-00-00","");



DROP TABLE IF EXISTS tbl_personas_alergias;

CREATE TABLE `tbl_personas_alergias` (
  `CODIGO_PERSONA_ALERGIAS` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ALERGIAS` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_ALERGIAS`),
  KEY `cod_expe_fk` (`CODIGO_EXPEDIENTE_PERSONA`),
  KEY `cod_aler_fk` (`CODIGO_ALERGIAS`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_alergias VALUES("1","2","2");
INSERT INTO tbl_personas_alergias VALUES("2","1","1");
INSERT INTO tbl_personas_alergias VALUES("3","4","1");
INSERT INTO tbl_personas_alergias VALUES("4","5","1");
INSERT INTO tbl_personas_alergias VALUES("5","6","1");
INSERT INTO tbl_personas_alergias VALUES("6","7","1");
INSERT INTO tbl_personas_alergias VALUES("7","8","1");
INSERT INTO tbl_personas_alergias VALUES("8","9","1");



DROP TABLE IF EXISTS tbl_personas_apariencia;

CREATE TABLE `tbl_personas_apariencia` (
  `CODIGO_PERSONAS_APARIENCIA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_APARIENCIA` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_APARIENCIA`),
  KEY `CODI_PER_APARI` (`CODIGO_APARIENCIA`),
  KEY `CODI_PER_EXPE_APA` (`CODIGO_EXPEDIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_apariencia VALUES("1","1","4");
INSERT INTO tbl_personas_apariencia VALUES("2","2","4");
INSERT INTO tbl_personas_apariencia VALUES("3","3","6");
INSERT INTO tbl_personas_apariencia VALUES("4","4","5");
INSERT INTO tbl_personas_apariencia VALUES("5","5","6");
INSERT INTO tbl_personas_apariencia VALUES("6","6","6");
INSERT INTO tbl_personas_apariencia VALUES("7","7","4");
INSERT INTO tbl_personas_apariencia VALUES("8","8","4");
INSERT INTO tbl_personas_apariencia VALUES("9","9","4");



DROP TABLE IF EXISTS tbl_personas_sintomas;

CREATE TABLE `tbl_personas_sintomas` (
  `CODIGO_PERSONA_SINTOMA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_SINTOMA_NEUROTICO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_SINTOMA`),
  KEY `COD_EXP_PPSICO` (`CODIGO_EXPEDIENTE`),
  KEY `COD_SINT_PP` (`CODIGO_SINTOMA_NEUROTICO`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_sintomas VALUES("1","1","1");
INSERT INTO tbl_personas_sintomas VALUES("2","2","3");
INSERT INTO tbl_personas_sintomas VALUES("3","3","1");
INSERT INTO tbl_personas_sintomas VALUES("4","4","1");
INSERT INTO tbl_personas_sintomas VALUES("5","5","1");
INSERT INTO tbl_personas_sintomas VALUES("6","6","1");
INSERT INTO tbl_personas_sintomas VALUES("7","6","2");
INSERT INTO tbl_personas_sintomas VALUES("8","7","1");
INSERT INTO tbl_personas_sintomas VALUES("9","7","2");



DROP TABLE IF EXISTS tbl_personas_transtornos;

CREATE TABLE `tbl_personas_transtornos` (
  `CODIGO_PERSONAS_TRANSTORNOS` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_TRANSTORNO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_TRANSTORNOS`),
  KEY `CODI_PER_EXPE` (`CODIGO_EXPEDIENTE`),
  KEY `CODI_PER_TRANST` (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_transtornos VALUES("1","1","4");
INSERT INTO tbl_personas_transtornos VALUES("2","2","5");
INSERT INTO tbl_personas_transtornos VALUES("3","3","4");
INSERT INTO tbl_personas_transtornos VALUES("4","4","4");
INSERT INTO tbl_personas_transtornos VALUES("5","4","5");
INSERT INTO tbl_personas_transtornos VALUES("6","5","4");
INSERT INTO tbl_personas_transtornos VALUES("7","6","5");
INSERT INTO tbl_personas_transtornos VALUES("8","7","4");
INSERT INTO tbl_personas_transtornos VALUES("9","8","4");
INSERT INTO tbl_personas_transtornos VALUES("10","9","4");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_plan_terapeutico VALUES("1","2","HACER EJERCICIO, EJERCITARSE ","ANDA A PASO LIGERO DE 15 A 30 MINUTOS","LA COMPAÑIA DE UN AMIGO","EJERCICIOS DE RESPIRACION QUE PUEDE AYUDAR A REENCOTRARSE MEJOR CON LA DEPRESION","EN CUANTO A LA PRACTICA DE ESTAS TECNICAS ESTA MEJORANDO ");
INSERT INTO tbl_plan_terapeutico VALUES("2","4","ESCRIBIR EN UN DIARIO LO QUE SIENTE","DE RELAJACIÓN","DIARIO PERSONAL, LAPIZ","ESCRIBIR AL MENOS MEDIA PÁGINA TODOS LOS DÍAS POR  2 SEMANAS","LO AVERIGUAREMOS :U");
INSERT INTO tbl_plan_terapeutico VALUES("3","5","HORIGAMI,  PRACTICAR DEPORTE","DE RELAJACIÓN ","PAPEL, BALÓN PARA PRACTICAR ALGÚN DEPORTE","HACER HORIGAMI AL MENOS 3 VECES EN LA SEMANA","NINGUNO POR EL MOMENTO");
INSERT INTO tbl_plan_terapeutico VALUES("4","8","VER PELICULAS DE TERROR","NINGUNA ","UN TELEVISOR ","ESCRIBIR EN UN DIARIO ANTES DE DORIR","SE ESPERA REDUCIR LAS PESADILLAS");
INSERT INTO tbl_plan_terapeutico VALUES("5","10","NINGUNA","NINGUNA","NINGUNA","NINGUNA","NINGUNA");
INSERT INTO tbl_plan_terapeutico VALUES("6","11","NINGUNO","NINGUNO","NINGUNO","NINGUNO","NINGUNO");



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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preclinica VALUES("1","11","100","18.5","1.20","35","70","70/80","12","No tiene","","2022-07-27","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("2","4","138","19","1.85","38","85","70/85","12","Moderado","","2022-07-27","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("3","18","115","20.5","1.50","37","80","70/10","13","No tiene","","2022-07-27","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("4","3","130.5","18.5","1.82","35","70","70/80","21","No tiene","","2022-07-27","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("5","20","130.5","12.5","18.5","35.5","70","70/80","12","No tiene","","2022-07-29","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("6","26","130.5","18.5","1.81","37.5","70","70/80","12","No tiene","","2022-07-30","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("7","34","130.5","15.5","1.92","37.4","70","70/80","12","No tiene","","2022-07-30","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("8","35","140.5","18.8","1.96","13.6","30","70/80","12","No tiene","","2022-07-30","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("9","22","130.5","183.","1.95","36","15","70/80","70","No tiene","","2022-07-30","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("10","23","45545","262","5545","623","263","262","23","No tiene","","2022-07-30","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("11","40","134","19","1.87","37.2","80","70/80","11","No tiene","","2022-08-03","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("12","42","135","18.2","1.66","37","70","70/80","12","No tiene","","2022-08-03","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("13","43","130","18","1.68","37.1","70","70/80","12","No tiene","","2022-08-03","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("14","50","138","18.5","1.83","38","70","60/80","45","No tiene","","2022-08-03","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("15","51","130.5","18.6","1.85","37.5","70","70/80","12","No tiene","","2022-08-03","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("16","52","135","15.5","1.85","65","48","70/80","13","No tiene","","2022-08-03","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("17","58","150","18.5","1.82","36.2","70","70/120","13","Grave","","2022-08-16","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("18","70","120","18.5","1.20","36.5","70","170/180","12","Moderado","","2022-08-18","0000-00-00","");
INSERT INTO tbl_preclinica VALUES("19","60","135","18.5","1.50","37.5","70","120/180","12","No tiene","","2022-08-19","0000-00-00","");



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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preguntas VALUES("1","2","¿CUAL ES TU COMIDA FAVORITA?"," ADMIN","2022-07-16","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("2","2","¿NOMBRE DE TU CARICATURA FAVORITA DE LA INFANCIA?"," ADMIN","2022-07-18","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("3","2","¿NOMBRE DE TU PELICULA FAVORITA DE LA INFANCIA?"," ADMIN","2022-07-18","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("4","2","¿PARIENTE QUE MAS ADMIRA?"," ADMIN","2022-07-18","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("5","2","¿NOMBRE DE TU MASCOTA FAVORITA?"," ADMIN","2022-07-18","ADMIN","2022-08-14");
INSERT INTO tbl_preguntas VALUES("6","2","¿UN JUGADOR DE FUTBOL FAVORITO?"," ADMIN","2022-07-18","ADMIN","2022-08-14");
INSERT INTO tbl_preguntas VALUES("7","2","¿COLOR DE ROPA FAVORITO?"," ADMIN","2022-07-18","ADMIN","2022-08-14");
INSERT INTO tbl_preguntas VALUES("20","3","QUIEN TE LLAMA"," ADMIN","2022-08-12","ADMIN","2022-08-14");



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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preguntas_usuarios VALUES("1","7","2","NEGRO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("2","1","4","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("4","5","5","MANOLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("5","1","3","POLLO ","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("6","1","7","PIZZA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("7","1","11","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("8","2","12","NO TIENE","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("9","1","15","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("10","4","17","MI NOVIA UWU","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("11","1","13","CARNE ASADA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("12","1","20","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("13","7","21","NEGRO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("14","1","16","CAMARONES","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("15","4","8","MI PADRE","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("16","5","14","PELUSA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("17","1","10","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("18","1","18","ARROZ CON VISTED","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("19","7","19","NEGRO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("20","1","22","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("21","1","23","PIZZA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("22","1","24","TACOS MEXICANOS","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("23","1","9","PIZZA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("24","4","25","PAPA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("25","4","26","MIS PRIMAS","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("26","1","27","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("27","1","29","CHULETA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("28","1","30","CHULETA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("29","1","28","ARROZ","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("30","7","31","NEGRO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("31","4","32","A MI MAMA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("32","2","6","BOB ESPONJA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("34","1","33","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("36","4","33","ABUELA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("37","1","6","POLLO","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO tbl_receta_medica VALUES("16","17","01025","TOMAR UNA CADA 12 HORAS","BIENN","2022-08-15","ADMIN","2022-08-15","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("17","17","0102","PARA LA INFECCION","NINGUNA","2022-08-15","ADMIN","2022-08-15","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("19","18","0102","NINGUNA","NINGUNA","2022-08-17","ADMIN","2022-08-17","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("20","19","0102","NINGUNA","NINGUNA","2022-08-18","ADMIN","2022-08-18","","0000-00-00");



DROP TABLE IF EXISTS tbl_roles;

CREATE TABLE `tbl_roles` (
  `CODIGO_TIPO_ROL` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `EST_ROL` int(11) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_ROL`),
  KEY `FK_ESTADO_ROL` (`EST_ROL`),
  CONSTRAINT `FK_ESTADO_ROL` FOREIGN KEY (`EST_ROL`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_roles VALUES("1","ADMINISTRADOR","Todos los permisos","2","Administrador","2022-02-11","2022-08-14","ADMIN");
INSERT INTO tbl_roles VALUES("2","TUTOR","Usuario con permisos al modulo de escuela","2","Administrador","2022-02-11","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("3","INDEFINIDO","Rol no definido para el usuario","2","","0000-00-00","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("4","PSICOLOGO","Área de psicología","2","","0000-00-00","2022-04-07","ADMIN");
INSERT INTO tbl_roles VALUES("5","MEDICO","area medica","2","","2022-03-09","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("6","CATEQUISTA","Área espiritual","2","","2022-03-09","2022-05-05","ALBERT");
INSERT INTO tbl_roles VALUES("7","ENFERMERO","Area Medica","2","","2022-04-23","0000-00-00","");
INSERT INTO tbl_roles VALUES("8","ESTUDIANTE","El usuario solo permitirá ver las citas y tutorías que tiene este.  ","2","ADMIN","2022-05-03","2022-08-15","ADMIN");
INSERT INTO tbl_roles VALUES("9","SUPER USUARIO","Este rol tiene todos los permisos","2","ADMIN","2022-05-03","2022-08-15","ADMIN");
INSERT INTO tbl_roles VALUES("12","BACKUP","restaurar","2","ALEXANDER","2022-08-19","","");



DROP TABLE IF EXISTS tbl_sacramento;

CREATE TABLE `tbl_sacramento` (
  `CODIGO_SACRAMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTADO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SACRAMENTO`),
  KEY `Codigo_estado_sacrameento` (`CODIGO_ESTADO`),
  CONSTRAINT `Codigo_estado_sacrameento` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_sacramento VALUES("1","2","BAUTISMO","PRIMER SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("2","2","COMUNION ","SEGUNDO SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("3","3","CONFIRMA","TERCER SACRAMENTO");



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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO tbl_sacramento_estudiante VALUES("13","8","2");
INSERT INTO tbl_sacramento_estudiante VALUES("14","9","1");
INSERT INTO tbl_sacramento_estudiante VALUES("15","9","2");



DROP TABLE IF EXISTS tbl_seccion;

CREATE TABLE `tbl_seccion` (
  `CODIGO_SECCION` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTADO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SECCION`),
  KEY `CO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `CO_ESTADO` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_seccion VALUES("1","2","SECCION A","seccion");
INSERT INTO tbl_seccion VALUES("2","2","SECCION B","seccion");
INSERT INTO tbl_seccion VALUES("3","3","SECCION C","seccion");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sintomas_neuroticos VALUES("1","PESADILLAS");
INSERT INTO tbl_sintomas_neuroticos VALUES("2","CONVULSIONES");
INSERT INTO tbl_sintomas_neuroticos VALUES("3","NINGUNO");
INSERT INTO tbl_sintomas_neuroticos VALUES("4","ANSIEDAD");



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
INSERT INTO tbl_telefono VALUES("98125444","38");



DROP TABLE IF EXISTS tbl_tipo_persona;

CREATE TABLE `tbl_tipo_persona` (
  `CODIGO_TIPO_PERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_PERSONA`),
  KEY `FK_COD_EST_TPERSONA` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_COD_EST_TPERSONA` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tipo_persona VALUES("1","ADMINISTRADOR","2");
INSERT INTO tbl_tipo_persona VALUES("2","TUTOR","2");
INSERT INTO tbl_tipo_persona VALUES("3","NODEFINIDO","2");
INSERT INTO tbl_tipo_persona VALUES("4","ESTUDIANTE","2");
INSERT INTO tbl_tipo_persona VALUES("5","MEDICO","2");
INSERT INTO tbl_tipo_persona VALUES("6","PSICOLOGO","2");
INSERT INTO tbl_tipo_persona VALUES("7","FAMILIAR","2");
INSERT INTO tbl_tipo_persona VALUES("8","CATEQUISTA","2");
INSERT INTO tbl_tipo_persona VALUES("9","ENFERMERO","2");
INSERT INTO tbl_tipo_persona VALUES("10","ODONTOLOGO","3");



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
  `NOMBRE` varchar(100) NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `CREADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TUTORIA`),
  KEY `FK_CODATREA_TUTO` (`CODIGO_AREA`),
  KEY `FK_CODEST_TUTO` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODATREA_TUTO` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `tbl_area` (`CODIGO_AREA`),
  CONSTRAINT `FK_CODEST_TUTO` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tutoria VALUES("1","1","ESPAÑOL","3","RUT","2022-07-27","2022-08-18","ADMIN");
INSERT INTO tbl_tutoria VALUES("2","4","COMUNIÓN","2","LUZ","2022-07-27","0000-00-00","");
INSERT INTO tbl_tutoria VALUES("3","4","CONFIRMA","2","LUZ","2022-07-27","0000-00-00","");
INSERT INTO tbl_tutoria VALUES("4","1","MATEMATICAS","2","ALEXANDER","2022-07-27","0000-00-00","");
INSERT INTO tbl_tutoria VALUES("5","4","PERSEVERANCIA","2","LUZ","2022-07-27","0000-00-00","");
INSERT INTO tbl_tutoria VALUES("6","1","INGLES","2","ALEXANDER","2022-07-27","0000-00-00","");
INSERT INTO tbl_tutoria VALUES("7","1","CIENCIAS","2","CESAR","2022-07-27","2022-07-27","RUT");
INSERT INTO tbl_tutoria VALUES("8","1","BIOLOGÍA ","2","ADMIN","2022-08-03","0000-00-00","");
INSERT INTO tbl_tutoria VALUES("9","1","CIENCIAS AMBIENTALES ","2","ADMIN","2022-08-03","0000-00-00","");



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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_usuario VALUES("1","1","ADMIN","2","9","$2a$07$usesomesillystringforeDLU0KLdU3tCNprit2LU2PhciUHQJFsG","2022-09-24","","2022-07-26","0000-00-00","");
INSERT INTO tbl_usuario VALUES("2","2","RUT","2","1","$2a$07$usesomesillystringforeCFgULGhtYgEopegGdjbjYiHOQCeHz.S","0000-00-00","ADMIN","2022-07-26","2022-08-14","ADMIN");
INSERT INTO tbl_usuario VALUES("3","3","LUZ","2","1","$2a$07$usesomesillystringforeFz7dK1VZWNMEJiH0HNOXYw/HL.5hY4.","0000-00-00","ADMIN","2022-07-26","2022-08-18","ADMIN");
INSERT INTO tbl_usuario VALUES("4","4","JOSE","2","1","$2a$07$usesomesillystringforePP9wVrG7ur0QdkQ9rpSzfE/DlP4e8u.","0000-00-00","ADMIN","2022-07-26","2022-08-14","ADMIN");
INSERT INTO tbl_usuario VALUES("5","5","GABRIELA","2","1","$2a$07$usesomesillystringforek7hUNAdfzELkC2Xk6YPva7JCsoP6rh.","0000-00-00","ADMIN","2022-07-26","2022-07-29","ADMIN");
INSERT INTO tbl_usuario VALUES("6","6","ALEXANDER","2","9","$2a$07$usesomesillystringforeP7mXKbfh9ebyT3M.rcGnqD3gYHLx/pu","0000-00-00","ADMIN","2022-07-26","2022-08-18","ALEXANDER");
INSERT INTO tbl_usuario VALUES("7","7","CESAR","2","1","$2a$07$usesomesillystringforelk7hEP5l/8xGhqhzzpBD065n5bEXx2S","0000-00-00","ADMIN","2022-07-26","0000-00-00","");
INSERT INTO tbl_usuario VALUES("8","8","JUAN","2","2","$2a$07$usesomesillystringfore24KuaN0qO9IVZ9tIXt3l5Gy/G5o.KWm","0000-00-00","LUZ","2022-07-26","0000-00-00","");
INSERT INTO tbl_usuario VALUES("9","9","DAVID","2","8","$2a$07$usesomesillystringforeK2F0CA.OyIc/hzje/abe5/.lBawI8Ca","0000-00-00","CESAR","2022-07-27","2022-08-13","ADMIN");
INSERT INTO tbl_usuario VALUES("10","10","IKER","2","8","$2a$07$usesomesillystringforecHYBqgWfna9zyvdLydQv0EYK49B5C82","0000-00-00","ALEXANDER","2022-07-27","2022-07-26","ALEXANDER");
INSERT INTO tbl_usuario VALUES("11","11","DANIEL","2","5","$2a$07$usesomesillystringforePH8CXTpBjgw/NZeLeXQ6eBg2yFS9OE.","0000-00-00","JOSE","2022-07-26","2022-08-17","ALEXANDER");
INSERT INTO tbl_usuario VALUES("12","12","RAQUEL","2","4","$2a$07$usesomesillystringforeUBzOoe/fyqEveRzs1qiMcRg0TjegQPu","0000-00-00","RUT","2022-07-26","0000-00-00","");
INSERT INTO tbl_usuario VALUES("13","13","YAMILETH","2","6","$2a$07$usesomesillystringfore/K7kHH0AKBo3XrR19eUxnbbahup7owe","0000-00-00","GABRIELA","2022-07-26","2022-08-17","ALEXANDER");
INSERT INTO tbl_usuario VALUES("14","16","MARGARITA","2","2","$2a$07$usesomesillystringforeVxRNnRV8j0V/Qv7SN5pK5Zs/4jXqeqa","0000-00-00","LUZ","2022-07-26","0000-00-00","");
INSERT INTO tbl_usuario VALUES("15","17","RAMON","2","5","$2a$07$usesomesillystringforeFUN5v3JgHk8ENz9lcf.hrCfeYRowdmi","0000-00-00","ADMIN","2022-07-26","0000-00-00","");
INSERT INTO tbl_usuario VALUES("16","18","FRANCISCO","2","6","$2a$07$usesomesillystringforeYvwVwFdn.wYcLp8bkDtYnY0bKhlJa1O","0000-00-00","GABRIELA","2022-07-26","2022-08-17","ALEXANDER");
INSERT INTO tbl_usuario VALUES("17","19","JOSUE","2","4","$2a$07$usesomesillystringforeto0mvDpaV0DK4cFtWyWxnWiZ4qt7Z4.","0000-00-00","RUT","2022-07-26","2022-07-26","RUT");
INSERT INTO tbl_usuario VALUES("18","20","LAURA","2","6","$2a$07$usesomesillystringforeOe47YYBALHNylsq90yhjERGpHl.p9kG","0000-00-00","GABRIELA","2022-07-26","0000-00-00","");
INSERT INTO tbl_usuario VALUES("19","21","MAJO","2","2","$2a$07$usesomesillystringforeVTuDZ.MUZx5QQxqolAMBpd2VqKlfrRa","0000-00-00","LUZ","2022-07-26","0000-00-00","");
INSERT INTO tbl_usuario VALUES("20","22","PAULA","2","5","$2a$07$usesomesillystringforebpEps4WbpHVJcXpWLLEajLXEyJhmmju","0000-00-00","ADMIN","2022-07-26","2022-08-18","ADMIN");
INSERT INTO tbl_usuario VALUES("21","23","MARIO","2","4","$2a$07$usesomesillystringforeC1qiwiZxWnmXgS0TeTaf41.2zC9eoJa","0000-00-00","RUT","2022-07-26","0000-00-00","");
INSERT INTO tbl_usuario VALUES("22","24","CRIS","2","8","$2a$07$usesomesillystringforemrCfnY4uA0DxWUm8xBIP17QxqXX.scS","0000-00-00","ALEXANDER","2022-07-27","0000-00-00","");
INSERT INTO tbl_usuario VALUES("23","25","ANDREA","2","8","$2a$07$usesomesillystringforehRJWC.CF6mpqr2p1llRk3PxU/cZ65DS","0000-00-00","CESAR","2022-07-27","0000-00-00","");
INSERT INTO tbl_usuario VALUES("24","27","KATY","2","8","$2a$07$usesomesillystringforeHgs1s2uw38U9bfe/nzsY9NxbYN5tPiC","0000-00-00","RUT","2022-07-27","2022-07-28","ADMIN");
INSERT INTO tbl_usuario VALUES("25","29","DESIRETH","2","8","$2a$07$usesomesillystringforeBNDqae843YwiG.YpUXHq9I4KSLbDAQ6","0000-00-00","GABRIELA","2022-07-27","2022-07-26","GABRIELA");
INSERT INTO tbl_usuario VALUES("26","30","NAOMI","2","8","$2a$07$usesomesillystringfore6EINqszN38WG50TBh9xqXuz82S4gTBK","0000-00-00","LUZ","2022-07-27","0000-00-00","");
INSERT INTO tbl_usuario VALUES("27","31","ERICK","2","8","$2a$07$usesomesillystringforeP5wUikw4pkTxWim7XoEvmNeS8uKtbjS","0000-00-00","ADMIN","2022-07-27","2022-08-18","ADMIN");
INSERT INTO tbl_usuario VALUES("28","32","ANYH","2","6","$2a$07$usesomesillystringforef3K3SHJ3KU57GQVdI9QQ7CPsELwicyS","0000-00-00","ADMIN","2022-07-29","0000-00-00","");
INSERT INTO tbl_usuario VALUES("29","33","ISEL","2","4","$2a$07$usesomesillystringforeZ3x51R2rN0SEQgrkhB/SgtI9y1OSCcK","0000-00-00","ADMIN","2022-07-29","2022-08-18","ALEXANDER");
INSERT INTO tbl_usuario VALUES("30","34","ARMANDO","2","2","$2a$07$usesomesillystringforeIWLQb30CQ.VUYtobQCyzQFYDZlzPjV6","0000-00-00","GABRIELA","2022-07-29","2022-08-18","ALEXANDER");
INSERT INTO tbl_usuario VALUES("31","35","LUISMI","2","2","$2a$07$usesomesillystringforeo.Za9sjz40Tnh798TxidWyZRTQ.mtoC","0000-00-00","LUZ","2022-08-02","2022-08-16","ADMIN");
INSERT INTO tbl_usuario VALUES("32","36","VALERIA","2","2","$2a$07$usesomesillystringforeXAQheGJF7USzYzdQgtA7gv6RllsR2Va","0000-00-00","ADMIN","2022-08-02","2022-08-16","ADMIN");
INSERT INTO tbl_usuario VALUES("33","38","ASTRID","3","9","$2a$07$usesomesillystringforesTdoLXO3A5.gZs.7Baw3GBzDMV1pA36","0000-00-00","ALEXANDER","2022-08-17","2022-08-18","ALEXANDER");



SET FOREIGN_KEY_CHECKS=1;