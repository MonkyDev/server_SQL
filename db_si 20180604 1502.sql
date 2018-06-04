-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.32-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_si
--

CREATE DATABASE IF NOT EXISTS db_si;
USE db_si;

--
-- Definition of table `actividad_planeacion_academicas`
--

DROP TABLE IF EXISTS `actividad_planeacion_academicas`;
CREATE TABLE `actividad_planeacion_academicas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estapa_organi` varchar(255) NOT NULL,
  `metodo_didactico` varchar(255) NOT NULL,
  `elementos_evaluar` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actividad_planeacion_academicas`
--

/*!40000 ALTER TABLE `actividad_planeacion_academicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_planeacion_academicas` ENABLE KEYS */;


--
-- Definition of table `administrativos`
--

DROP TABLE IF EXISTS `administrativos`;
CREATE TABLE `administrativos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `administrativos`
--

/*!40000 ALTER TABLE `administrativos` DISABLE KEYS */;
INSERT INTO `administrativos` (`id`,`nombre`,`cargo`,`telefono`,`correo`,`edo`,`created_at`,`updated_at`) VALUES 
 (1,'shady','Secretaria',NULL,NULL,1,'2018-04-30 13:05:02','2018-04-30 13:05:42'),
 (2,'riky','Promotor deportivo',NULL,NULL,1,'2018-05-12 19:06:42','2018-05-22 16:37:17');
/*!40000 ALTER TABLE `administrativos` ENABLE KEYS */;


--
-- Definition of table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE `alumnos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `matricula` varchar(10) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `a_pat` varchar(255) NOT NULL,
  `a_mat` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `celular` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tipo_ingreso` varchar(255) NOT NULL,
  `inscripcion` varchar(255) NOT NULL,
  `fk_ciclo` int(10) unsigned DEFAULT NULL,
  `fk_grupo` int(10) unsigned DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula` (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alumnos`
--

/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` (`id`,`matricula`,`nombres`,`a_pat`,`a_mat`,`sexo`,`celular`,`foto`,`tipo_ingreso`,`inscripcion`,`fk_ciclo`,`fk_grupo`,`edo`,`created_at`,`updated_at`) VALUES 
 (6,'4001203452','samuel','ruiz','de la cruz','H','123','assets/images/photos/alumnos/4001203452.png','Regular','08/2017',5,6,1,'2018-05-27 19:11:10','2018-05-27 20:09:03'),
 (7,'4002342132','aurora','portugal','hernandez','M','123','assets/images/photos/alumnos/4002342132.jpeg','Regular','05/2017',6,7,1,'2018-05-27 19:12:27','2018-05-27 19:30:08'),
 (8,'4001258956','Ramon','Valdez','Fuentes','H','231','assets/images/photos/alumnos/4001258956.png','Regular','05/2017',6,7,1,'2018-05-30 12:01:05','2018-06-03 10:16:33'),
 (9,'4006754464','laura','portales','romero','M','123','assets/images/photos/alumnos/4006754464.jpg','Regular','08/2017',5,6,1,'2018-06-03 10:39:38','2018-06-03 10:39:38');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;


--
-- Definition of table `bibliografias`
--

DROP TABLE IF EXISTS `bibliografias`;
CREATE TABLE `bibliografias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(15) NOT NULL DEFAULT 'LIBRO',
  `titulo` varchar(50) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `editorial` varchar(255) NOT NULL,
  `año` varchar(255) NOT NULL,
  `clave_materia` varchar(50) DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bibliografias`
--

/*!40000 ALTER TABLE `bibliografias` DISABLE KEYS */;
/*!40000 ALTER TABLE `bibliografias` ENABLE KEYS */;


--
-- Definition of table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE `calificaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` int(11) NOT NULL,
  `fk_ciclo` int(10) unsigned DEFAULT NULL,
  `fk_alumno` int(10) unsigned DEFAULT NULL,
  `fk_materia` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calificaciones_unikeys` (`fk_ciclo`,`fk_alumno`,`fk_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calificaciones`
--

/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` (`id`,`valor`,`fk_ciclo`,`fk_alumno`,`fk_materia`,`created_at`,`updated_at`) VALUES 
 (1,7,7,6,1,'2018-05-27 20:04:05','2018-05-27 20:04:05'),
 (2,8,7,6,2,'2018-05-27 20:04:05','2018-05-27 20:04:05'),
 (3,9,7,6,3,'2018-05-27 20:04:05','2018-05-27 20:04:05'),
 (4,9,7,6,4,'2018-05-27 20:04:05','2018-05-27 20:04:05'),
 (5,10,7,6,5,'2018-05-27 20:04:05','2018-05-27 20:04:05'),
 (6,9,7,6,6,'2018-05-27 20:04:05','2018-05-27 20:04:05'),
 (7,7,8,7,57,'2018-05-27 21:38:07','2018-05-27 21:38:07'),
 (8,8,8,7,58,'2018-05-27 21:38:08','2018-05-27 21:38:08'),
 (9,7,8,7,59,'2018-05-27 21:38:08','2018-05-27 21:38:08'),
 (10,8,8,7,60,'2018-05-27 21:38:08','2018-05-27 21:38:08'),
 (11,7,8,7,61,'2018-05-27 21:38:08','2018-05-27 21:38:08'),
 (12,8,8,7,62,'2018-05-27 21:38:08','2018-05-27 21:38:08');
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;


--
-- Definition of table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
CREATE TABLE `carreras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clave` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `mision` varchar(255) NOT NULL,
  `vision` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `perfil_egre` varchar(255) NOT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carreras`
--

/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` (`id`,`clave`,`nombre`,`mision`,`vision`,`telefono`,`correo`,`perfil_egre`,`edo`,`created_at`,`updated_at`) VALUES 
 (1,'IT','INGENIERIA EN TELECOMUNICACIONES','X','X','123','x','INGENIERO EN TELECOMUNICACIONES',1,'2018-04-30 13:06:39','2018-05-10 11:57:48'),
 (2,'IMC','NIGENIERIA EN COMERCIO ELECTRONICO','X','X','123','x','INGENIERO EN E-COMERCE',1,'2018-05-01 10:28:11','2018-05-12 20:41:56'),
 (3,'ISC','INGENIERIA EN SISTEMAS COMPUTACIONALES','X','X','123','X','INGENIERO EN SISTEMAS',1,'2018-05-03 17:40:42','2018-05-12 20:41:56');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;


--
-- Definition of table `ciclos_escolares`
--

DROP TABLE IF EXISTS `ciclos_escolares`;
CREATE TABLE `ciclos_escolares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mes_inicio` varchar(2) NOT NULL,
  `mes_fin` varchar(2) NOT NULL,
  `anio` varchar(4) NOT NULL,
  `fecha_curso` varchar(25) NOT NULL,
  `fk_planesc` varchar(5) NOT NULL,
  `sem_program` int(11) NOT NULL,
  `sem_efec` int(11) NOT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ciclos_escolares`
--

/*!40000 ALTER TABLE `ciclos_escolares` DISABLE KEYS */;
INSERT INTO `ciclos_escolares` (`id`,`mes_inicio`,`mes_fin`,`anio`,`fecha_curso`,`fk_planesc`,`sem_program`,`sem_efec`,`edo`,`created_at`,`updated_at`) VALUES 
 (5,'01','06','2018','22-01/12-06','SEM',0,0,1,'2018-04-30 13:00:05','2018-04-30 13:00:05'),
 (6,'01','04','2018','08-01/30-04','CUA',0,0,1,'2018-04-30 13:00:57','2018-04-30 13:00:57'),
 (7,'08','12','2017','15-08/15-12','SEM',0,0,1,'2018-04-30 19:28:42','2018-05-01 19:31:34'),
 (8,'09','12','2017','15-08/22-12','CUA',0,0,1,'2018-05-27 21:29:48','2018-05-27 21:29:48');
/*!40000 ALTER TABLE `ciclos_escolares` ENABLE KEYS */;


--
-- Definition of table `clases`
--

DROP TABLE IF EXISTS `clases`;
CREATE TABLE `clases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `fk_cicloesc` int(11) DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clases`
--

/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;


--
-- Definition of table `conceptos`
--

DROP TABLE IF EXISTS `conceptos`;
CREATE TABLE `conceptos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_administrativo` int(10) unsigned NOT NULL DEFAULT '0',
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `conceptos`
--

/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;
INSERT INTO `conceptos` (`id`,`fk_administrativo`,`descripcion`,`created_at`,`updated_at`) VALUES 
 (3,1,'inscripcion','2018-05-27 21:58:33','2018-05-27 21:58:33'),
 (4,1,'reinscripci&oacute;n','2018-06-03 10:04:42','2018-06-03 10:04:42'),
 (5,1,'colegiatura 1','2018-06-03 10:05:01','2018-06-03 10:05:01'),
 (6,1,'colegiatura 2','2018-06-03 10:05:13','2018-06-03 10:05:13'),
 (7,1,'colegiatura 3','2018-06-03 10:05:32','2018-06-03 10:05:32'),
 (8,1,'colegiatura 4','2018-06-03 10:05:42','2018-06-03 10:05:42'),
 (9,1,'colegiatura 5','2018-06-03 10:05:52','2018-06-03 10:05:52'),
 (10,1,'colegiatura 6','2018-06-03 10:06:01','2018-06-03 10:06:01'),
 (11,1,'seguro escolar','2018-06-03 10:06:13','2018-06-03 10:06:13');
/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;


--
-- Definition of table `datos_institucionales`
--

DROP TABLE IF EXISTS `datos_institucionales`;
CREATE TABLE `datos_institucionales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mision` varchar(255) NOT NULL,
  `vision` varchar(255) NOT NULL,
  `filosofia` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `campus` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `datos_institucionales`
--

/*!40000 ALTER TABLE `datos_institucionales` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_institucionales` ENABLE KEYS */;


--
-- Definition of table `desglose_horarios`
--

DROP TABLE IF EXISTS `desglose_horarios`;
CREATE TABLE `desglose_horarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_horario` int(10) unsigned NOT NULL,
  `dia` int(10) unsigned NOT NULL,
  `inicio` time NOT NULL,
  `fin` time NOT NULL,
  `hrs_totales` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `desglose_horarios`
--

/*!40000 ALTER TABLE `desglose_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `desglose_horarios` ENABLE KEYS */;


--
-- Definition of table `desglose_planeaciones`
--

DROP TABLE IF EXISTS `desglose_planeaciones`;
CREATE TABLE `desglose_planeaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `semana` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horas` int(11) NOT NULL,
  `fk_tema` int(10) unsigned NOT NULL,
  `aprendisaje_esperado` varchar(255) DEFAULT NULL,
  `actividad_aprendisaje` varchar(255) DEFAULT NULL,
  `evidencias_aprendido` varchar(255) DEFAULT NULL,
  `fk_planaca` int(11) DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `desglose_planeaciones`
--

/*!40000 ALTER TABLE `desglose_planeaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `desglose_planeaciones` ENABLE KEYS */;


--
-- Definition of table `dias_de_asuetos`
--

DROP TABLE IF EXISTS `dias_de_asuetos`;
CREATE TABLE `dias_de_asuetos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fk_cicloesc` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dias_de_asuetos`
--

/*!40000 ALTER TABLE `dias_de_asuetos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dias_de_asuetos` ENABLE KEYS */;


--
-- Definition of table `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
CREATE TABLE `disciplinas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `horario` varchar(255) NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `entrenador` varchar(255) NOT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `disciplinas`
--

/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
INSERT INTO `disciplinas` (`id`,`descripcion`,`horario`,`lugar`,`entrenador`,`edo`,`created_at`,`updated_at`) VALUES 
 (1,'voleibol','4 pm','cancha del deportivo','joe martin velazquez feria',1,'2018-05-27 19:32:15','2018-05-27 19:32:15'),
 (2,'tenis','4 pm','cancha del polideportivo','raul torres mendoza',1,'2018-05-27 19:33:16','2018-05-27 19:33:16');
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;


--
-- Definition of table `docente_postgrado`
--

DROP TABLE IF EXISTS `docente_postgrado`;
CREATE TABLE `docente_postgrado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_docente` int(11) NOT NULL,
  `fk_postgrado` int(11) NOT NULL,
  `lugar` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `docente_postgrado`
--

/*!40000 ALTER TABLE `docente_postgrado` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente_postgrado` ENABLE KEYS */;


--
-- Definition of table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
CREATE TABLE `docentes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `administrativo` int(10) NOT NULL DEFAULT '0',
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `docentes`
--

/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;


--
-- Definition of table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_carrera` varchar(5) NOT NULL,
  `fk_planesc` varchar(5) NOT NULL,
  `turno` varchar(5) DEFAULT NULL,
  `grado` varchar(255) NOT NULL,
  `letra` varchar(5) NOT NULL,
  `salon` int(11) DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grupos`
--

/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` (`id`,`fk_carrera`,`fk_planesc`,`turno`,`grado`,`letra`,`salon`,`edo`,`created_at`,`updated_at`) VALUES 
 (6,'ISC','SEM','MAT','2','a',345,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (7,'ISC','CUA','MAT','3','a',321,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;


--
-- Definition of table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_plantilla` int(10) unsigned NOT NULL,
  `clave_materia` varchar(50) NOT NULL,
  `fk_grupo` int(10) DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `horarios`
--

/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;


--
-- Definition of table `materias`
--

DROP TABLE IF EXISTS `materias`;
CREATE TABLE `materias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clave` varchar(255) DEFAULT NULL,
  `seriacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `objetivo_gnral` varchar(255) NOT NULL,
  `hrs_docente` int(11) NOT NULL,
  `hrs_independientes` int(11) NOT NULL,
  `creditos` int(11) NOT NULL,
  `instalaciones` varchar(255) NOT NULL,
  `grado` int(11) NOT NULL,
  `fk_plan` int(10) unsigned DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materias`
--

/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` (`id`,`clave`,`seriacion`,`nombre`,`objetivo_gnral`,`hrs_docente`,`hrs_independientes`,`creditos`,`instalaciones`,`grado`,`fk_plan`,`edo`,`created_at`,`updated_at`) VALUES 
 (1,'','','TALLER DE LECTURA Y REDACCION','x',0,0,0,'x',1,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (2,'','','NOCIONES DE DERECHO','x',0,0,0,'x',1,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (3,'','','CONTABILIDAD','x',0,0,0,'x',1,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (4,'','','MATEMATICAS BASICAS','x',0,0,0,'x',1,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (5,'','','INFORMATICA BASICA','x',0,0,0,'x',1,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (6,'','','ALGORITMOS COMPUTACIONALES','x',0,0,0,'x',1,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (7,'','','INGENIERIA ECONOMICA','x',0,0,0,'x',2,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (8,'','','ADMINISTRACION','x',0,0,0,'x',2,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (9,'','','MATEMATICAS II (CALCULO DIFERENCIAL E INTEGRAL)','x',0,0,0,'x',2,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (10,'','','PROGRAMACION ESTRUCTURADA','x',0,0,0,'x',2,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (11,'','','PARADIGMAS Y LENGUAJES DE PROGRAMACION','x',0,0,0,'x',2,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (12,'','','PROGRAMACION DE SISTEMAS','x',0,0,0,'x',2,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (13,'','','METODOLOGIA DE LA INVESTIGACION','x',0,0,0,'x',3,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (14,'','','ESTADISTICA APLICADA','x',0,0,0,'x',3,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (15,'','','MATEMATICAS DISCRETAS','x',0,0,0,'x',3,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (16,'','','PROGRAMACION ORIENTADA A OBJETOS','x',0,0,0,'x',3,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (17,'','','ELECTRONICA BASICA','x',0,0,0,'x',3,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (18,'','','ESTRUCTURA DE DATOS I','x',0,0,0,'x',3,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (19,'','','MERCADOTECNIA','x',0,0,0,'x',4,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (20,'','','INVESTIGACION DE OPERACIONES I','x',0,0,0,'x',4,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (21,'','','PROGRAMAS DE INTERFACES','x',0,0,0,'x',4,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (22,'','','ESTRUCTURA DE DATOS II','x',0,0,0,'x',4,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (23,'','','LENGUAJE ENSAMBLADOR','x',0,0,0,'x',4,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (24,'','','TEORIA DE AUTOMATAS','x',0,0,0,'x',4,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (25,'','','ETICA','x',0,0,0,'x',5,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (26,'','','INVESTIGACION DE OPERACIONES II','x',0,0,0,'x',5,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (27,'','','SIMULACION','x',0,0,0,'x',5,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (28,'','','TEORIA DE SISTEMAS OPERATIVOS','x',0,0,0,'x',5,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (29,'','','DISEÑO DE BASE DE DATOS','x',0,0,0,'x',5,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (30,'','','COMPILADORES','x',0,0,0,'x',5,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (31,'','','ARQUITECTURA DE COMPUTADORAS I','x',0,0,0,'x',5,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (32,'','','DESARROLLO DE EMPRENDEDORES','x',0,0,0,'x',6,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (33,'','','SISTEMAS OPERATIVOS MODERNOS','x',0,0,0,'x',6,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (34,'','','ANALISIS DE SISTEMAS DE INFORMACION','x',0,0,0,'x',6,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (35,'','','DESARROLLO DE BASE DE DATOS','x',0,0,0,'x',6,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (36,'','','ARQUITECTURA DE COMPUTADORAS II','x',0,0,0,'x',6,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (37,'','','REDES COMPUTACIONALES I','x',0,0,0,'x',6,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (38,'','','CREACION DE EMPRESAS','x',0,0,0,'x',7,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (39,'','','BASE DE DATOS DISTRIBUIDAS','x',0,0,0,'x',7,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (40,'','','DISEÑO DE SISTEMAS DE INFORMACION','x',0,0,0,'x',7,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (41,'','','INTELIGENCIA ARTIFICIAL','x',0,0,0,'x',7,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (42,'','','DISE&Ntilde;O DE PAGINA WEB','x',0,0,0,'x',7,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (43,'','','REDES COMPUTACIONALES II','x',0,0,0,'x',7,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (44,'','','AUDITORIA INFORMATICA','x',0,0,0,'x',7,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (45,'','','SEMINARIO DE TESIS','x',0,0,0,'x',8,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (46,'','','LIDERAZGO','x',0,0,0,'x',8,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (47,'','','INGENIERIA DE SOFTWARE','x',0,0,0,'x',8,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (48,'','','TECNOLOGIA DE INFORMACION Y COMUNICACION','x',0,0,0,'x',8,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (49,'','','ROBOTICA','x',0,0,0,'x',8,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (50,'','','ADMINISTRACION DE PROYECTOS INFORMATICOS','x',0,0,0,'x',8,1,1,'0000-00-00 00:00:00','2018-05-27 19:02:27'),
 (51,'','','TALLER DE LECTURA Y REDACCION','x',0,0,0,'x',1,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (52,'','','NOCIONES DE DERECHO','x',0,0,0,'x',1,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (53,'','','CONTABILIDAD','x',0,0,0,'x',1,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (54,'','','MATEMATICAS BASICAS','x',0,0,0,'x',1,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (55,'','','INFORMATICA BASICA','x',0,0,0,'x',1,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (56,'','','ALGORITMOS COMPUTACIONALES','x',0,0,0,'x',1,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (57,'','','INGENIERIA ECONOMICA','x',0,0,0,'x',2,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (58,'','','ADMINISTRACION','x',0,0,0,'x',2,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (59,'','','MATEMATICAS II (CALCULO DIFERENCIAL E INTEGRAL)','x',0,0,0,'x',2,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (60,'','','PROGRAMACION ESTRUCTURADA','x',0,0,0,'x',2,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (61,'','','PARADIGMAS Y LENGUAJES DE PROGRAMACION','x',0,0,0,'x',2,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (62,'','','PROGRAMACION DE SISTEMAS','x',0,0,0,'x',2,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (63,'','','METODOLOGIA DE LA INVESTIGACION','x',0,0,0,'x',3,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (64,'','','ESTADISTICA APLICADA','x',0,0,0,'x',3,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (65,'','','MATEMATICAS DISCRETAS','x',0,0,0,'x',3,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (66,'','','PROGRAMACION ORIENTADA A OBJETOS','x',0,0,0,'x',3,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (67,'','','ELECTRONICA BASICA','x',0,0,0,'x',3,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (68,'','','ESTRUCTURA DE DATOS I','x',0,0,0,'x',3,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (69,'','','MERCADOTECNIA','x',0,0,0,'x',4,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (70,'','','INVESTIGACION DE OPERACIONES I','x',0,0,0,'x',4,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (71,'','','PROGRAMAS DE INTERFACES','x',0,0,0,'x',4,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (72,'','','ESTRUCTURA DE DATOS II','x',0,0,0,'x',4,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (73,'','','LENGUAJE ENSAMBLADOR','x',0,0,0,'x',4,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (74,'','','TEORIA DE AUTOMATAS','x',0,0,0,'x',4,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (75,'','','ETICA','x',0,0,0,'x',5,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (76,'','','INVESTIGACION DE OPERACIONES II','x',0,0,0,'x',5,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (77,'','','SIMULACION','x',0,0,0,'x',5,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (78,'','','TEORIA DE SISTEMAS OPERATIVOS','x',0,0,0,'x',5,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (79,'','','DISEÑO DE BASE DE DATOS','x',0,0,0,'x',5,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (80,'','','COMPILADORES','x',0,0,0,'x',5,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (81,'','','ARQUITECTURA DE COMPUTADORAS I','x',0,0,0,'x',5,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (82,'','','DESARROLLO DE EMPRENDEDORES','x',0,0,0,'x',6,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (83,'','','SISTEMAS OPERATIVOS MODERNOS','x',0,0,0,'x',6,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (84,'','','ANALISIS DE SISTEMAS DE INFORMACION','x',0,0,0,'x',6,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (85,'','','DESARROLLO DE BASE DE DATOS','x',0,0,0,'x',6,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (86,'','','ARQUITECTURA DE COMPUTADORAS II','x',0,0,0,'x',6,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (87,'','','REDES COMPUTACIONALES I','x',0,0,0,'x',6,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (88,'','','CREACION DE EMPRESAS','x',0,0,0,'x',7,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (89,'','','BASE DE DATOS DISTRIBUIDAS','x',0,0,0,'x',7,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (90,'','','DISEÑO DE SISTEMAS DE INFORMACION','x',0,0,0,'x',7,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (91,'','','INTELIGENCIA ARTIFICIAL','x',0,0,0,'x',7,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (92,'','','DISE&Ntilde;O DE PAGINA WEB','x',0,0,0,'x',7,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (93,'','','REDES COMPUTACIONALES II','x',0,0,0,'x',7,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (94,'','','AUDITORIA INFORMATICA','x',0,0,0,'x',7,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (95,'','','SEMINARIO DE TESIS','x',0,0,0,'x',8,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (96,'','','LIDERAZGO','x',0,0,0,'x',8,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (97,'','','INGENIERIA DE SOFTWARE','x',0,0,0,'x',8,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (98,'','','TECNOLOGIA DE INFORMACION Y COMUNICACION','x',0,0,0,'x',8,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (99,'','','ROBOTICA','x',0,0,0,'x',8,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40'),
 (100,'','','ADMINISTRACION DE PROYECTOS INFORMATICOS','x',0,0,0,'x',8,5,1,'0000-00-00 00:00:00','2018-05-13 18:25:40');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;


--
-- Definition of table `observaciones`
--

DROP TABLE IF EXISTS `observaciones`;
CREATE TABLE `observaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `observ_institu` varchar(255) NOT NULL,
  `fk_administrativo` int(10) unsigned DEFAULT NULL,
  `fk_docente` int(10) unsigned DEFAULT NULL,
  `observ_visit` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `observaciones`
--

/*!40000 ALTER TABLE `observaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `observaciones` ENABLE KEYS */;


--
-- Definition of table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folio` varchar(255) NOT NULL,
  `monto` double(9,2) NOT NULL,
  `beca` tinyint(4) NOT NULL,
  `fk_alumno` int(10) unsigned DEFAULT NULL,
  `fk_concepto` int(10) unsigned DEFAULT NULL,
  `fk_ciclo` int(10) unsigned DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pagos`
--

/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` (`id`,`folio`,`monto`,`beca`,`fk_alumno`,`fk_concepto`,`fk_ciclo`,`edo`,`created_at`,`updated_at`) VALUES 
 (1,'e 12341342',1800.00,1,7,3,6,1,'2018-06-03 10:07:00','2018-06-03 10:07:00'),
 (2,'e 12321321',150.00,1,7,11,6,1,'2018-06-03 10:07:38','2018-06-03 10:07:38'),
 (3,'e 23123312',1800.00,1,8,3,6,1,'2018-06-03 10:13:24','2018-06-03 10:13:24'),
 (4,'e 12312312',150.00,1,8,11,6,1,'2018-06-03 10:14:23','2018-06-03 10:14:23'),
 (5,'e 23423423',1800.00,1,6,3,5,1,'2018-06-03 10:37:44','2018-06-03 10:37:44'),
 (6,'e 34234234',1800.00,1,9,3,5,1,'2018-06-03 10:40:31','2018-06-03 10:40:31');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;


--
-- Definition of table `parciales`
--

DROP TABLE IF EXISTS `parciales`;
CREATE TABLE `parciales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clave_materia` varchar(50) NOT NULL,
  `fk_cicloesc` int(11) NOT NULL,
  `p1` date NOT NULL,
  `p2` date NOT NULL,
  `pf` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parciales`
--

/*!40000 ALTER TABLE `parciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `parciales` ENABLE KEYS */;


--
-- Definition of table `participaciones`
--

DROP TABLE IF EXISTS `participaciones`;
CREATE TABLE `participaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `anio` int(11) NOT NULL,
  `fk_alumno` int(10) unsigned DEFAULT NULL,
  `fk_disciplina` int(10) unsigned DEFAULT NULL,
  `fk_ciclo` int(10) unsigned DEFAULT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `participaciones_unikeys` (`fk_alumno`,`fk_disciplina`,`fk_ciclo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `participaciones`
--

/*!40000 ALTER TABLE `participaciones` DISABLE KEYS */;
INSERT INTO `participaciones` (`id`,`anio`,`fk_alumno`,`fk_disciplina`,`fk_ciclo`,`edo`,`created_at`,`updated_at`) VALUES 
 (1,2018,6,1,5,1,'2018-05-27 19:33:47','2018-05-27 19:33:47'),
 (2,2018,7,1,6,1,'2018-05-27 21:14:15','2018-05-27 21:14:15'),
 (3,2018,8,1,5,1,'2018-05-30 12:01:40','2018-05-30 12:01:40');
/*!40000 ALTER TABLE `participaciones` ENABLE KEYS */;


--
-- Definition of table `plan_estudios`
--

DROP TABLE IF EXISTS `plan_estudios`;
CREATE TABLE `plan_estudios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clave_carrera` varchar(50) DEFAULT NULL,
  `vigencia_plan` varchar(255) NOT NULL,
  `revoe` varchar(255) NOT NULL,
  `fk_planesc` varchar(5) NOT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plan_estudios`
--

/*!40000 ALTER TABLE `plan_estudios` DISABLE KEYS */;
INSERT INTO `plan_estudios` (`id`,`clave_carrera`,`vigencia_plan`,`revoe`,`fk_planesc`,`edo`,`created_at`,`updated_at`) VALUES 
 (1,'ISC','2018','PSU001','SEM',1,'2018-04-30 13:11:26','2018-05-23 19:12:55'),
 (3,'IT','2018','PSU002','SEM',1,'2018-05-01 10:30:23','2018-05-23 19:12:56'),
 (4,'IMC','2018','PSU003','SEM',1,'2018-05-12 18:20:37','2018-05-23 19:12:56'),
 (5,'ISC','2018','PSU004','CUA',1,'2018-05-27 18:49:35','2018-05-27 18:52:15');
/*!40000 ALTER TABLE `plan_estudios` ENABLE KEYS */;


--
-- Definition of table `planeacion_academicas`
--

DROP TABLE IF EXISTS `planeacion_academicas`;
CREATE TABLE `planeacion_academicas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clave_materia` varchar(255) NOT NULL,
  `fk_docente` int(10) unsigned NOT NULL,
  `fk_planesc` varchar(50) NOT NULL,
  `linea_investigacion` varchar(255) NOT NULL,
  `vinculos_asignatura` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `planeacion_academicas`
--

/*!40000 ALTER TABLE `planeacion_academicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `planeacion_academicas` ENABLE KEYS */;


--
-- Definition of table `planes_escolares`
--

DROP TABLE IF EXISTS `planes_escolares`;
CREATE TABLE `planes_escolares` (
  `id` varchar(15) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `edo` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planes_escolares`
--

/*!40000 ALTER TABLE `planes_escolares` DISABLE KEYS */;
INSERT INTO `planes_escolares` (`id`,`descripcion`,`edo`,`created_at`,`updated_at`) VALUES 
 ('CORP','CORPORATIVO',1,'2018-05-10 11:58:54','2018-05-10 11:58:54'),
 ('CUA','CUATRIMESTRAL',1,'2018-04-30 12:58:24','2018-04-30 12:58:24'),
 ('SEM','SEMESTRAL',1,'2018-05-03 19:33:28','2018-05-03 19:33:28');
/*!40000 ALTER TABLE `planes_escolares` ENABLE KEYS */;


--
-- Definition of table `plantilla_docentes`
--

DROP TABLE IF EXISTS `plantilla_docentes`;
CREATE TABLE `plantilla_docentes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_administrativo` int(10) unsigned DEFAULT NULL,
  `fk_docente` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plantilla_docentes`
--

/*!40000 ALTER TABLE `plantilla_docentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantilla_docentes` ENABLE KEYS */;


--
-- Definition of table `postgrados`
--

DROP TABLE IF EXISTS `postgrados`;
CREATE TABLE `postgrados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '0',
  `tipo` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postgrados`
--

/*!40000 ALTER TABLE `postgrados` DISABLE KEYS */;
/*!40000 ALTER TABLE `postgrados` ENABLE KEYS */;


--
-- Definition of table `secciones`
--

DROP TABLE IF EXISTS `secciones`;
CREATE TABLE `secciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_carrera` int(10) NOT NULL,
  `fk_administrativo` int(10) NOT NULL,
  `edo` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `secciones`
--

/*!40000 ALTER TABLE `secciones` DISABLE KEYS */;
INSERT INTO `secciones` (`id`,`fk_carrera`,`fk_administrativo`,`edo`,`created_at`,`updated_at`) VALUES 
 (1,3,1,1,'2018-06-02 20:10:27','2018-06-02 20:10:27');
/*!40000 ALTER TABLE `secciones` ENABLE KEYS */;


--
-- Definition of table `temas`
--

DROP TABLE IF EXISTS `temas`;
CREATE TABLE `temas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unidad` varchar(255) NOT NULL,
  `nom_tema` varchar(255) NOT NULL,
  `clave_materia` varchar(50) DEFAULT NULL,
  `antecede` varchar(50) DEFAULT NULL,
  `no_unidad` varchar(255) NOT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `temas`
--

/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_cuenta` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `edo` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`fk_cuenta`,`type`,`name`,`password`,`email`,`edo`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (1,2,'A','ADMIN6823','$2y$15$OgsV3ehdQ4gfdBb.yge.mul4LcmodEyKBuiZ6Xpdrs4hMDkmlf3li','example@usr1.com',9,'$2y$15$We.nBQLJbtV441Qn2CWkfuMwgmUfksP02B.84b6HiWhjLcK5oIPdO','2018-04-30 12:35:28','2018-05-13 18:55:17'),
 (2,1,'A','ADMIN1234','$2y$15$C01b3cugOvF4hrX82oyWXuxmht/RowAemarRXgK1ztao4MEmk9vfG','example@usr2.com',8,'$2y$15$f8KNyGRtJVGrbTy025RkYeRuFz.OEeELDA9RGxCDUbAGk96SfV.AW','2018-05-12 19:52:26','2018-05-23 17:59:04'),
 (3,2,'S','ROOT777','$2y$15$c1sx63k.QLupw4F7Hs95Cu0M9YTuyrNN1CYXRhjy8EKd9zDgPKcty','example@usr1.com',1,'$2y$15$u/xne/z45Bva6T/snT8WvePyi5H.AA7qYqNO3Xp050NqYid8j9eie','2018-05-23 17:59:23','2018-05-23 18:17:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
