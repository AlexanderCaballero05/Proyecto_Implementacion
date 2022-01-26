-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2022 a las 04:29:25
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_proyecto_prosecar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `CODIGO_AREA` varchar(10) NOT NULL,
  `NOMBRE_AREA` varchar(20) NOT NULL,
  `ENCARGADO_AREA` varchar(30) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `CODIGO_CORRELATIVO` int(5) NOT NULL,
  `CODIGO_MATRICULA` int(5) DEFAULT NULL,
  `CALIFICACION` decimal(5,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo_electronico`
--

CREATE TABLE `correo_electronico` (
  `CORREO_PERSONA` varchar(20) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `CODIGO_CORRELATIVO` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `DIRECCION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivo_electronico`
--

CREATE TABLE `dispositivo_electronico` (
  `CODIGO_DISPOSITIVO` int(5) NOT NULL,
  `NOMBRE_DISPOSITIVO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivo_estudiante`
--

CREATE TABLE `dispositivo_estudiante` (
  `CODIGO_DISP_ESTU` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_DISPOSITIVO` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `CODIGO_ESTADO` int(5) NOT NULL,
  `NOMBRE` varchar(15) NOT NULL,
  `DESCRIPCION` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `CODIGO_ESTUDIANTE` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `GRADO_ACTUAL` varchar(15) DEFAULT NULL,
  `CODIGO_MODALIDAD` int(5) DEFAULT NULL,
  `PASATIEMPO` varchar(20) DEFAULT NULL,
  `DISTRACTORES_ESCOLARES` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente_medico`
--

CREATE TABLE `expediente_medico` (
  `CODIGO_EXPE_MEDICO` int(5) NOT NULL,
  `CODIGO_CITA` int(5) DEFAULT NULL,
  `DIAGNOSTICO_INGRESO` longtext DEFAULT NULL,
  `OBSERVACIONES` longtext DEFAULT NULL,
  `DIAGNOSTICO_EGRESO` longtext DEFAULT NULL,
  `ANTECEDENTES_MEDICOS` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente_psicologico`
--

CREATE TABLE `expediente_psicologico` (
  `CODIGO_EXPE_PSICO` int(5) NOT NULL,
  `CODIGO_CITA` int(5) NOT NULL,
  `DIAGNOSTICO_INGRESO` varchar(300) NOT NULL,
  `DIAGNOSTICO_EGRESO` varchar(300) DEFAULT NULL,
  `ANTECEDENTES` varchar(400) NOT NULL,
  `OBSERVACIONES` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familiar`
--

CREATE TABLE `familiar` (
  `CODIGO_FAMILIAR` int(11) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_PARENTESCO` int(5) DEFAULT NULL,
  `ESTADO_CIVIL` varchar(15) DEFAULT NULL,
  `NIVEL_EDUCATIVO` varchar(20) DEFAULT NULL,
  `INGRESOS` decimal(15,0) DEFAULT NULL,
  `NOMBRE_IGLESIA` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_cita`
--

CREATE TABLE `inscripcion_cita` (
  `CODIGO_CITA` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) NOT NULL,
  `CODIGO_AREA` varchar(10) DEFAULT NULL,
  `FECHA_CITA` date NOT NULL,
  `HORARIO` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `CODIGO_JORNADA` int(5) NOT NULL,
  `NOMBRE` varchar(15) NOT NULL,
  `DESCRIPCION` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada_estudiante`
--

CREATE TABLE `jornada_estudiante` (
  `CODIGO_JORNADA_ESTU` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_JORNADA` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula_academica`
--

CREATE TABLE `matricula_academica` (
  `CODIGO_MATRICULA` int(5) NOT NULL,
  `CODIGO_TUTORIA` varchar(10) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `SECCION` int(5) DEFAULT NULL,
  `HORA` time NOT NULL,
  `FECHA_MATRICULA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `CODIGO_MEDICAMENTO` varchar(10) NOT NULL,
  `NOMBRE_MEDICAMENTO` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos_estudiante`
--

CREATE TABLE `medicamentos_estudiante` (
  `CODIGO_MEDICAMENTOS_ESTUDIANTES` int(5) NOT NULL,
  `CODIGO_EXPE_MEDICO` int(5) DEFAULT NULL,
  `CODIGO_MEDICAMENTO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `CODIGO_PARENTESCO` int(5) NOT NULL,
  `NOMBRE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `CODIGO_PERSONA` int(5) NOT NULL,
  `PRIMER_NOMBRE` varchar(20) NOT NULL,
  `SEGUNDO_NOMBRE` varchar(20) DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(20) NOT NULL,
  `SEGUNDO_APELLIDO` varchar(20) DEFAULT NULL,
  `DNI` varchar(15) NOT NULL,
  `SEXO` varchar(10) DEFAULT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `LUGAR_NACIMIENTO` varchar(30) DEFAULT NULL,
  `FECHA_INSCRIPCION` date NOT NULL,
  `FECHA_BAJA` date NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `CODIGO_TIPO_ROL` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_estudiante`
--

CREATE TABLE `proveedor_estudiante` (
  `CODIGO_PROVEEDOR_ESTUDIANTE` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_PROVEEDOR` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_ingreso`
--

CREATE TABLE `proveedor_ingreso` (
  `CODIGO_PROVEEDOR` int(5) NOT NULL,
  `NOMBRE_DE_PROVEEDOR` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba_estudiante`
--

CREATE TABLE `prueba_estudiante` (
  `CODIGO_PRUEBA_ESTUDI` int(5) NOT NULL,
  `CODIGO_EXPE_PSICO` int(5) DEFAULT NULL,
  `CODIGO_PRUEBA` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba_psicometrica`
--

CREATE TABLE `prueba_psicometrica` (
  `CODIGO_PRUEBA` int(5) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `DESCRIPCION` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_participacion_area`
--

CREATE TABLE `roles_participacion_area` (
  `CODIGO_TIPO_ROL` int(11) NOT NULL,
  `TIPO_USUARIO` varchar(20) NOT NULL,
  `FECHA_REGISTRO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sacramento`
--

CREATE TABLE `sacramento` (
  `CODIGO_SACRAMENTO` int(5) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sacramento_persona`
--

CREATE TABLE `sacramento_persona` (
  `CODIGO_CORRELATIVO` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_SACRAMENTO` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_internet`
--

CREATE TABLE `servicios_internet` (
  `CODIGO_INTERNET` int(5) NOT NULL,
  `TIPO_INTERNET` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_internet_estudiante`
--

CREATE TABLE `servicios_internet_estudiante` (
  `CODIGO_SER_INT_ESTUDIANTE` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_INTERNET` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_basico`
--

CREATE TABLE `servicio_basico` (
  `CODIGO_SERVICIO` int(5) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_basico_estudiantes`
--

CREATE TABLE `servicio_basico_estudiantes` (
  `CODIGO_SER_ESTU` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_SERVICIO` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `CODIGO_CORRELATIVO` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `NUMERO_TELEFONO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_virtualidad`
--

CREATE TABLE `tipo_virtualidad` (
  `CODIGO_MODALIDAD` int(5) NOT NULL,
  `NOMBRE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutoria`
--

CREATE TABLE `tutoria` (
  `CODIGO_TUTORIA` varchar(10) NOT NULL,
  `CODIGO_AREA` varchar(10) DEFAULT NULL,
  `NOMBRE_TUTORIA` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `CODIGO_CORRELATIVO` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CONTRASEÑA` varchar(15) NOT NULL,
  `NOMBRE_USUARIO` varchar(15) NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`CODIGO_AREA`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`CODIGO_CORRELATIVO`),
  ADD KEY `FK_COD_MATRCU` (`CODIGO_MATRICULA`);

--
-- Indices de la tabla `correo_electronico`
--
ALTER TABLE `correo_electronico`
  ADD PRIMARY KEY (`CORREO_PERSONA`),
  ADD KEY `FK_CORREO` (`CODIGO_PERSONA`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`CODIGO_CORRELATIVO`),
  ADD KEY `FK_COD_DIRECCIONES` (`CODIGO_PERSONA`);

--
-- Indices de la tabla `dispositivo_electronico`
--
ALTER TABLE `dispositivo_electronico`
  ADD PRIMARY KEY (`CODIGO_DISPOSITIVO`);

--
-- Indices de la tabla `dispositivo_estudiante`
--
ALTER TABLE `dispositivo_estudiante`
  ADD PRIMARY KEY (`CODIGO_DISP_ESTU`),
  ADD KEY `FK_COD_ESTU` (`CODIGO_ESTUDIANTE`),
  ADD KEY `FK_COD_DISPO` (`CODIGO_DISPOSITIVO`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`CODIGO_ESTADO`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`CODIGO_ESTUDIANTE`),
  ADD KEY `FK_COD_ESTUDIANTE` (`CODIGO_PERSONA`),
  ADD KEY `FK_CODMO_MODALIDAD` (`CODIGO_MODALIDAD`);

--
-- Indices de la tabla `expediente_medico`
--
ALTER TABLE `expediente_medico`
  ADD PRIMARY KEY (`CODIGO_EXPE_MEDICO`),
  ADD KEY `FK_COD_CITA` (`CODIGO_CITA`);

--
-- Indices de la tabla `expediente_psicologico`
--
ALTER TABLE `expediente_psicologico`
  ADD PRIMARY KEY (`CODIGO_EXPE_PSICO`),
  ADD KEY `FK_COD_CITA_INSC` (`CODIGO_CITA`);

--
-- Indices de la tabla `familiar`
--
ALTER TABLE `familiar`
  ADD PRIMARY KEY (`CODIGO_FAMILIAR`),
  ADD KEY `FK_CODP_PERSON` (`CODIGO_PERSONA`),
  ADD KEY `FK_CEST_ESTU` (`CODIGO_ESTUDIANTE`),
  ADD KEY `FK_CPAREN_PARE` (`CODIGO_PARENTESCO`);

--
-- Indices de la tabla `inscripcion_cita`
--
ALTER TABLE `inscripcion_cita`
  ADD PRIMARY KEY (`CODIGO_CITA`,`CODIGO_PERSONA`,`CODIGO_ESTUDIANTE`),
  ADD UNIQUE KEY `UNIQUE_CODE` (`CODIGO_CITA`),
  ADD KEY `FKEY_PERS_` (`CODIGO_PERSONA`),
  ADD KEY `FK_COESTUD_INCRI` (`CODIGO_ESTUDIANTE`),
  ADD KEY `FKEY_COAREA_INCRIP` (`CODIGO_AREA`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`CODIGO_JORNADA`);

--
-- Indices de la tabla `jornada_estudiante`
--
ALTER TABLE `jornada_estudiante`
  ADD PRIMARY KEY (`CODIGO_JORNADA_ESTU`),
  ADD KEY `FK_CODIGO_JORNADA` (`CODIGO_JORNADA`),
  ADD KEY `FK_CODIGO_ESTUDIANTE` (`CODIGO_ESTUDIANTE`);

--
-- Indices de la tabla `matricula_academica`
--
ALTER TABLE `matricula_academica`
  ADD PRIMARY KEY (`CODIGO_MATRICULA`,`CODIGO_TUTORIA`,`CODIGO_ESTUDIANTE`,`CODIGO_PERSONA`),
  ADD UNIQUE KEY `UNK_COD` (`CODIGO_MATRICULA`),
  ADD KEY `FK_CODIGO_TUTOR` (`CODIGO_TUTORIA`),
  ADD KEY `FK_CODIGO_ESTU` (`CODIGO_ESTUDIANTE`),
  ADD KEY `FK_CODIGO_PERS` (`CODIGO_PERSONA`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`CODIGO_MEDICAMENTO`);

--
-- Indices de la tabla `medicamentos_estudiante`
--
ALTER TABLE `medicamentos_estudiante`
  ADD PRIMARY KEY (`CODIGO_MEDICAMENTOS_ESTUDIANTES`),
  ADD KEY `FK_CODIGO_MEDICO` (`CODIGO_MEDICAMENTO`),
  ADD KEY `FK_COD_EXPE_MEDICO` (`CODIGO_EXPE_MEDICO`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`CODIGO_PARENTESCO`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`CODIGO_PERSONA`),
  ADD KEY `FK_COD_EST_ESTAD` (`CODIGO_ESTADO`),
  ADD KEY `FK_COD_ROL_ROLES` (`CODIGO_TIPO_ROL`);

--
-- Indices de la tabla `proveedor_estudiante`
--
ALTER TABLE `proveedor_estudiante`
  ADD PRIMARY KEY (`CODIGO_PROVEEDOR_ESTUDIANTE`),
  ADD KEY `FK_PROVEE_ES` (`CODIGO_ESTUDIANTE`),
  ADD KEY `FK_PROVEE_PROVEE` (`CODIGO_PROVEEDOR`);

--
-- Indices de la tabla `proveedor_ingreso`
--
ALTER TABLE `proveedor_ingreso`
  ADD PRIMARY KEY (`CODIGO_PROVEEDOR`);

--
-- Indices de la tabla `prueba_estudiante`
--
ALTER TABLE `prueba_estudiante`
  ADD PRIMARY KEY (`CODIGO_PRUEBA_ESTUDI`),
  ADD KEY `FK_COD_PRUPSI_PSICO` (`CODIGO_PRUEBA`),
  ADD KEY `FK_COD_EXPEDIENTE` (`CODIGO_EXPE_PSICO`);

--
-- Indices de la tabla `prueba_psicometrica`
--
ALTER TABLE `prueba_psicometrica`
  ADD PRIMARY KEY (`CODIGO_PRUEBA`);

--
-- Indices de la tabla `roles_participacion_area`
--
ALTER TABLE `roles_participacion_area`
  ADD PRIMARY KEY (`CODIGO_TIPO_ROL`);

--
-- Indices de la tabla `sacramento`
--
ALTER TABLE `sacramento`
  ADD PRIMARY KEY (`CODIGO_SACRAMENTO`);

--
-- Indices de la tabla `sacramento_persona`
--
ALTER TABLE `sacramento_persona`
  ADD PRIMARY KEY (`CODIGO_CORRELATIVO`),
  ADD KEY `FK_CP_SACRAMENTO` (`CODIGO_PERSONA`),
  ADD KEY `FK_CS_SACRAMENTO` (`CODIGO_SACRAMENTO`);

--
-- Indices de la tabla `servicios_internet`
--
ALTER TABLE `servicios_internet`
  ADD PRIMARY KEY (`CODIGO_INTERNET`);

--
-- Indices de la tabla `servicios_internet_estudiante`
--
ALTER TABLE `servicios_internet_estudiante`
  ADD PRIMARY KEY (`CODIGO_SER_INT_ESTUDIANTE`),
  ADD KEY `FK_CODIGO_ESTUDI` (`CODIGO_ESTUDIANTE`),
  ADD KEY `FK_CODIGO_INTERNET` (`CODIGO_INTERNET`);

--
-- Indices de la tabla `servicio_basico`
--
ALTER TABLE `servicio_basico`
  ADD PRIMARY KEY (`CODIGO_SERVICIO`);

--
-- Indices de la tabla `servicio_basico_estudiantes`
--
ALTER TABLE `servicio_basico_estudiantes`
  ADD PRIMARY KEY (`CODIGO_SER_ESTU`),
  ADD KEY `FK_CODIG_ESTU` (`CODIGO_ESTUDIANTE`),
  ADD KEY `FK_COD_SER` (`CODIGO_SERVICIO`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`CODIGO_CORRELATIVO`),
  ADD KEY `FK_TEL_PER` (`CODIGO_PERSONA`);

--
-- Indices de la tabla `tipo_virtualidad`
--
ALTER TABLE `tipo_virtualidad`
  ADD PRIMARY KEY (`CODIGO_MODALIDAD`);

--
-- Indices de la tabla `tutoria`
--
ALTER TABLE `tutoria`
  ADD PRIMARY KEY (`CODIGO_TUTORIA`),
  ADD KEY `FK_COD_AREA` (`CODIGO_AREA`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CODIGO_CORRELATIVO`),
  ADD KEY `FK_CODP_PERSONA` (`CODIGO_PERSONA`),
  ADD KEY `FK_CODI_ROL` (`CODIGO_TIPO_ROL`),
  ADD KEY `FK_CODI_ESTADO` (`CODIGO_ESTADO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `CODIGO_CORRELATIVO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `CODIGO_CORRELATIVO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dispositivo_electronico`
--
ALTER TABLE `dispositivo_electronico`
  MODIFY `CODIGO_DISPOSITIVO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dispositivo_estudiante`
--
ALTER TABLE `dispositivo_estudiante`
  MODIFY `CODIGO_DISP_ESTU` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `CODIGO_ESTADO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `CODIGO_ESTUDIANTE` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expediente_medico`
--
ALTER TABLE `expediente_medico`
  MODIFY `CODIGO_EXPE_MEDICO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expediente_psicologico`
--
ALTER TABLE `expediente_psicologico`
  MODIFY `CODIGO_EXPE_PSICO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `familiar`
--
ALTER TABLE `familiar`
  MODIFY `CODIGO_FAMILIAR` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jornada`
--
ALTER TABLE `jornada`
  MODIFY `CODIGO_JORNADA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jornada_estudiante`
--
ALTER TABLE `jornada_estudiante`
  MODIFY `CODIGO_JORNADA_ESTU` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamentos_estudiante`
--
ALTER TABLE `medicamentos_estudiante`
  MODIFY `CODIGO_MEDICAMENTOS_ESTUDIANTES` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `CODIGO_PARENTESCO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `CODIGO_PERSONA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor_estudiante`
--
ALTER TABLE `proveedor_estudiante`
  MODIFY `CODIGO_PROVEEDOR_ESTUDIANTE` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor_ingreso`
--
ALTER TABLE `proveedor_ingreso`
  MODIFY `CODIGO_PROVEEDOR` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prueba_estudiante`
--
ALTER TABLE `prueba_estudiante`
  MODIFY `CODIGO_PRUEBA_ESTUDI` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prueba_psicometrica`
--
ALTER TABLE `prueba_psicometrica`
  MODIFY `CODIGO_PRUEBA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles_participacion_area`
--
ALTER TABLE `roles_participacion_area`
  MODIFY `CODIGO_TIPO_ROL` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sacramento`
--
ALTER TABLE `sacramento`
  MODIFY `CODIGO_SACRAMENTO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sacramento_persona`
--
ALTER TABLE `sacramento_persona`
  MODIFY `CODIGO_CORRELATIVO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio_basico`
--
ALTER TABLE `servicio_basico`
  MODIFY `CODIGO_SERVICIO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio_basico_estudiantes`
--
ALTER TABLE `servicio_basico_estudiantes`
  MODIFY `CODIGO_SER_ESTU` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `CODIGO_CORRELATIVO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_virtualidad`
--
ALTER TABLE `tipo_virtualidad`
  MODIFY `CODIGO_MODALIDAD` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `CODIGO_CORRELATIVO` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `FK_COD_MATRCU` FOREIGN KEY (`CODIGO_MATRICULA`) REFERENCES `matricula_academica` (`CODIGO_MATRICULA`);

--
-- Filtros para la tabla `correo_electronico`
--
ALTER TABLE `correo_electronico`
  ADD CONSTRAINT `FK_CORREO` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `persona` (`CODIGO_PERSONA`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `FK_COD_DIRECCIONES` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `persona` (`CODIGO_PERSONA`);

--
-- Filtros para la tabla `dispositivo_estudiante`
--
ALTER TABLE `dispositivo_estudiante`
  ADD CONSTRAINT `FK_COD_DISPO` FOREIGN KEY (`CODIGO_DISPOSITIVO`) REFERENCES `dispositivo_electronico` (`CODIGO_DISPOSITIVO`),
  ADD CONSTRAINT `FK_COD_ESTU` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `estudiante` (`CODIGO_ESTUDIANTE`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `FK_CODMO_MODALIDAD` FOREIGN KEY (`CODIGO_MODALIDAD`) REFERENCES `tipo_virtualidad` (`CODIGO_MODALIDAD`),
  ADD CONSTRAINT `FK_COD_ESTUDIANTE` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `persona` (`CODIGO_PERSONA`);

--
-- Filtros para la tabla `expediente_medico`
--
ALTER TABLE `expediente_medico`
  ADD CONSTRAINT `FK_COD_CITA` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `inscripcion_cita` (`CODIGO_CITA`);

--
-- Filtros para la tabla `expediente_psicologico`
--
ALTER TABLE `expediente_psicologico`
  ADD CONSTRAINT `FK_COD_CITA_INSC` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `inscripcion_cita` (`CODIGO_CITA`);

--
-- Filtros para la tabla `familiar`
--
ALTER TABLE `familiar`
  ADD CONSTRAINT `FK_CEST_ESTU` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `estudiante` (`CODIGO_ESTUDIANTE`),
  ADD CONSTRAINT `FK_CODP_PERSON` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `persona` (`CODIGO_PERSONA`),
  ADD CONSTRAINT `FK_CPAREN_PARE` FOREIGN KEY (`CODIGO_PARENTESCO`) REFERENCES `parentesco` (`CODIGO_PARENTESCO`);

--
-- Filtros para la tabla `inscripcion_cita`
--
ALTER TABLE `inscripcion_cita`
  ADD CONSTRAINT `FKEY_COAREA_INCRIP` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `area` (`CODIGO_AREA`),
  ADD CONSTRAINT `FKEY_PERS_` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `persona` (`CODIGO_PERSONA`),
  ADD CONSTRAINT `FK_COESTUD_INCRI` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `estudiante` (`CODIGO_ESTUDIANTE`);

--
-- Filtros para la tabla `jornada_estudiante`
--
ALTER TABLE `jornada_estudiante`
  ADD CONSTRAINT `FK_CODIGO_ESTUDIANTE` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `estudiante` (`CODIGO_ESTUDIANTE`),
  ADD CONSTRAINT `FK_CODIGO_JORNADA` FOREIGN KEY (`CODIGO_JORNADA`) REFERENCES `jornada` (`CODIGO_JORNADA`);

--
-- Filtros para la tabla `matricula_academica`
--
ALTER TABLE `matricula_academica`
  ADD CONSTRAINT `FK_CODIGO_ESTU` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `estudiante` (`CODIGO_ESTUDIANTE`),
  ADD CONSTRAINT `FK_CODIGO_PERS` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `persona` (`CODIGO_PERSONA`),
  ADD CONSTRAINT `FK_CODIGO_TUTOR` FOREIGN KEY (`CODIGO_TUTORIA`) REFERENCES `tutoria` (`CODIGO_TUTORIA`);

--
-- Filtros para la tabla `medicamentos_estudiante`
--
ALTER TABLE `medicamentos_estudiante`
  ADD CONSTRAINT `FK_CODIGO_MEDICO` FOREIGN KEY (`CODIGO_MEDICAMENTO`) REFERENCES `medicamento` (`CODIGO_MEDICAMENTO`),
  ADD CONSTRAINT `FK_COD_EXPE_MEDICO` FOREIGN KEY (`CODIGO_EXPE_MEDICO`) REFERENCES `expediente_medico` (`CODIGO_EXPE_MEDICO`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_COD_EST_ESTAD` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `estado` (`CODIGO_ESTADO`),
  ADD CONSTRAINT `FK_COD_ROL_ROLES` FOREIGN KEY (`CODIGO_TIPO_ROL`) REFERENCES `roles_participacion_area` (`CODIGO_TIPO_ROL`);

--
-- Filtros para la tabla `proveedor_estudiante`
--
ALTER TABLE `proveedor_estudiante`
  ADD CONSTRAINT `FK_PROVEE_ES` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `estudiante` (`CODIGO_ESTUDIANTE`),
  ADD CONSTRAINT `FK_PROVEE_PROVEE` FOREIGN KEY (`CODIGO_PROVEEDOR`) REFERENCES `proveedor_ingreso` (`CODIGO_PROVEEDOR`);

--
-- Filtros para la tabla `prueba_estudiante`
--
ALTER TABLE `prueba_estudiante`
  ADD CONSTRAINT `FK_COD_EXPEDIENTE` FOREIGN KEY (`CODIGO_EXPE_PSICO`) REFERENCES `expediente_psicologico` (`CODIGO_EXPE_PSICO`),
  ADD CONSTRAINT `FK_COD_PRUPSI_PSICO` FOREIGN KEY (`CODIGO_PRUEBA`) REFERENCES `prueba_psicometrica` (`CODIGO_PRUEBA`);

--
-- Filtros para la tabla `sacramento_persona`
--
ALTER TABLE `sacramento_persona`
  ADD CONSTRAINT `FK_CP_SACRAMENTO` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `persona` (`CODIGO_PERSONA`),
  ADD CONSTRAINT `FK_CS_SACRAMENTO` FOREIGN KEY (`CODIGO_SACRAMENTO`) REFERENCES `sacramento` (`CODIGO_SACRAMENTO`);

--
-- Filtros para la tabla `servicios_internet_estudiante`
--
ALTER TABLE `servicios_internet_estudiante`
  ADD CONSTRAINT `FK_CODIGO_ESTUDI` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `estudiante` (`CODIGO_ESTUDIANTE`),
  ADD CONSTRAINT `FK_CODIGO_INTERNET` FOREIGN KEY (`CODIGO_INTERNET`) REFERENCES `servicios_internet` (`CODIGO_INTERNET`);

--
-- Filtros para la tabla `servicio_basico_estudiantes`
--
ALTER TABLE `servicio_basico_estudiantes`
  ADD CONSTRAINT `FK_CODIG_ESTU` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `estudiante` (`CODIGO_ESTUDIANTE`),
  ADD CONSTRAINT `FK_COD_SER` FOREIGN KEY (`CODIGO_SERVICIO`) REFERENCES `servicio_basico` (`CODIGO_SERVICIO`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `FK_TEL_PER` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `persona` (`CODIGO_PERSONA`);

--
-- Filtros para la tabla `tutoria`
--
ALTER TABLE `tutoria`
  ADD CONSTRAINT `FK_COD_AREA` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `area` (`CODIGO_AREA`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_CODI_ESTADO` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `estado` (`CODIGO_ESTADO`),
  ADD CONSTRAINT `FK_CODI_ROL` FOREIGN KEY (`CODIGO_TIPO_ROL`) REFERENCES `roles_participacion_area` (`CODIGO_TIPO_ROL`),
  ADD CONSTRAINT `FK_CODP_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `persona` (`CODIGO_PERSONA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
