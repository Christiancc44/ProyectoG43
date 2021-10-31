-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sig
CREATE DATABASE IF NOT EXISTS `sig` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sig`;

-- Volcando estructura para tabla sig.agregarafiliado
CREATE TABLE IF NOT EXISTS `agregarafiliado` (
  `ID` char(5) NOT NULL,
  `nombres_afiliado` varchar(50) NOT NULL,
  `apellidos_afiliado` varchar(50) NOT NULL,
  `año_nacimiento_afiliado` date NOT NULL,
  `telefono_afiliado` varchar(50) NOT NULL DEFAULT '0',
  `direccion_afiliado` varchar(50) NOT NULL,
  `AñoMatricula_afiliado` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sig.agregarafiliado: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `agregarafiliado` DISABLE KEYS */;
INSERT INTO `agregarafiliado` (`ID`, `nombres_afiliado`, `apellidos_afiliado`, `año_nacimiento_afiliado`, `telefono_afiliado`, `direccion_afiliado`, `AñoMatricula_afiliado`) VALUES
	('1', 'Sofia', 'Aldana', '1998-07-08', '3205899630', 'Cr 16 N 20-12', '2020-02-15');
/*!40000 ALTER TABLE `agregarafiliado` ENABLE KEYS */;

-- Volcando estructura para tabla sig.entrenador
CREATE TABLE IF NOT EXISTS `entrenador` (
  `ID` int(11) NOT NULL,
  `nombres_entrenado` varchar(50) NOT NULL DEFAULT '',
  `apellidos_entrenador` varchar(50) NOT NULL,
  `especialidad_entrenador` varchar(50) NOT NULL,
  `añoNacimiento_entrenador` date NOT NULL,
  `telefono_entrenador` varchar(20) NOT NULL DEFAULT '',
  `barrio_entrenador` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sig.entrenador: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` (`ID`, `nombres_entrenado`, `apellidos_entrenador`, `especialidad_entrenador`, `añoNacimiento_entrenador`, `telefono_entrenador`, `barrio_entrenador`) VALUES
	(1, 'Juan Andres', 'Garcia', 'Crossfit', '1990-04-22', '3214588996', 'San Juan');
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;

-- Volcando estructura para tabla sig.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `Id_usuario` int(11) NOT NULL,
  `Contraseña_us` varchar(50) DEFAULT '',
  `Estado_Us` int(11) NOT NULL,
  `Nombre_Us` varchar(50) DEFAULT '',
  `Rol_Us` varchar(50) DEFAULT '',
  PRIMARY KEY (`Id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sig.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`Id_usuario`, `Contraseña_us`, `Estado_Us`, `Nombre_Us`, `Rol_Us`) VALUES
	(1, 'ad12345', 0, 'admin', 'administrador'),
	(2, 'rec12345', 0, 'recep', 'recepcionista');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
