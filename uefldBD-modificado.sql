-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2020 a las 19:33:59
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_S  ET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `uefld`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avances`
--

CREATE TABLE `avances` (
  `idAvance` int(11) NOT NULL,
  `Titulo` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT 'Esperando Revisión',
  `NotaTotal` float DEFAULT 0,
  `Fecha` date NOT NULL,
  `idEstudiante` varchar(10) DEFAULT NULL,
  `nombreArchivo` varchar(255) NOT NULL,
  `directorio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `avances`
--

INSERT INTO `avances` (`idAvance`, `Titulo`, `Descripcion`, `Estado`, `NotaTotal`, `Fecha`, `idEstudiante`, `nombreArchivo`, `directorio`) VALUES
(1379, 'Avance monográfico de la semana 1', 'Investigacion de objetivos', 'Revisado', 10, '2020-06-16', '2016-0295', 'Practica04_Ramiro_Vivanco.pdf', 'C:/xampp/htdocs/UEFLD-Avances/assets/Archivos'),
(1380, 'Avance monográfico de la semana 2', 'Definicion de metodología', 'Revisado', 8, '2020-06-16', '2016-0295', 'Relational_1.pdf', 'C:/xampp/htdocs/UEFLD-Avances/assets/Archivos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `idCalificacion` int(11) NOT NULL,
  `idEstudianteC` varchar(10) NOT NULL,
  `Calificacion` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`idCalificacion`, `idEstudianteC`, `Calificacion`) VALUES
(1, '2014-0020', 0),
(2, '2017-0001', 0),
(3, '2016-0732', 0),
(4, '2016-0733', 0),
(5, '2015-0139', 0),
(6, '2014-0307', 0),
(7, '2014-0061', 0),
(8, '2013-0218', 0),
(9, '2016-0151', 0),
(10, '2016-0295', 9),
(11, '2014-0041', 0),
(12, '2014-0258', 0),
(13, '2015-0143', 0),
(14, '2017-0019', 0),
(15, '2014-0064', 0),
(16, '2018-0357', 0),
(17, '2014-0119', 0),
(18, '2014-0131', 0),
(19, '2014-0344', 0),
(20, '2013-0132', 0),
(21, '2017-0034', 0),
(22, '2014-0347', 0),
(23, '2014-0059', 0),
(24, '2014-0142', 0),
(25, '2016-0198', 0),
(26, '2014-0079', 0),
(27, '2014-0099', 0),
(28, '2014-0328', 0),
(29, '2015-0178', 0),
(30, '2014-0109', 0),
(31, '2019-0232', 0),
(32, '2014-0043', 0),
(33, '2016-0251', 0),
(34, '2014-0168', 0),
(35, '2016-0736', 0),
(36, '2014-0089', 0),
(37, '2014-0193', 0),
(38, '2016-0739', 0),
(39, '2014-0256', 0),
(40, '2016-0743', 0),
(41, '2016-0193', 0),
(42, '2014-0027', 0),
(43, '2014-0002', 0),
(44, '2014-0124', 0),
(45, '2016-0744', 0),
(46, '2014-0010', 0),
(47, '2014-0071', 0),
(48, '2014-0084', 0),
(49, '2014-0103', 0),
(50, '2015-0183', 0),
(51, '2014-0325', 0),
(52, '2014-0030', 0),
(53, '2014-0287', 0),
(54, '2014-0310', 0),
(55, '2015-0154', 0),
(56, '2013-0274', 0),
(57, '2016-0197', 0),
(58, '2017-0304', 0),
(59, '2014-0085', 0),
(60, '2017-0072', 0),
(61, '2014-0200', 0),
(62, '2014-0212', 0),
(63, '2014-0042', 0),
(64, '2017-0311', 0),
(65, '2014-0136', 0),
(66, '2014-0333', 0),
(67, '2013-0222', 0),
(68, '2016-0750', 0),
(69, '2016-0166', 0),
(70, '2014-0175', 0),
(71, '2019-0360', 0),
(72, '2014-0146', 0),
(73, '2014-0080', 0),
(74, '2014-0049', 0),
(75, '2016-0169', 0),
(76, '2014-0063', 0),
(77, '2013-0130', 0),
(78, '2017-0091', 0),
(79, '2014-0008', 0),
(80, '2012-0573', 0),
(81, '2014-0113', 0),
(82, '2013-0276', 0),
(83, '2018-0396', 0),
(84, '2014-0039', 0),
(85, '2013-0211', 0),
(86, '2015-0176', 0),
(87, '2014-0149', 0),
(88, '2014-0118', 0),
(89, '2014-0066', 0),
(90, '2014-0073', 0),
(91, '2013-0092', 0),
(92, '2014-0181', 0),
(93, '2013-0278', 0),
(94, '2016-0203', 0),
(95, '2014-0219', 0),
(96, '2014-0009', 0),
(97, '2014-0138', 0),
(98, '2014-0129', 0),
(99, '2016-0758', 0),
(100, '2013-0031', 0),
(101, '2017-0419', 0),
(102, '2016-0146', 0),
(103, '2016-0759', 0),
(104, '2018-0443', 0),
(105, '2013-0032', 0),
(106, '2014-0006', 0),
(107, '2016-0760', 0),
(108, '2014-0158', 0),
(109, '2014-0070', 0),
(110, '2014-0053', 0),
(111, '2017-0352', 0),
(112, '2014-0017', 0),
(113, '2016-0762', 0),
(114, '2016-0278', 0),
(115, '2014-0032', 0),
(116, '2013-0028', 0),
(117, '2014-0019', 0),
(118, '2013-0228', 0),
(119, '2014-0231', 0),
(120, '2014-0086', 0),
(121, '2014-0358', 0),
(122, '2016-0763', 0),
(123, '2014-0176', 0),
(124, '2015-0181', 0),
(125, '2014-0067', 0),
(126, '2014-0102', 0),
(127, '2014-0050', 0),
(128, '2014-0174', 0),
(129, '2014-0352', 0),
(130, '2016-0256', 0),
(131, '2014-0106', 0),
(132, '2014-0238', 0),
(133, '2016-0205', 0),
(134, '2013-0005', 0),
(135, '2018-0330', 0),
(136, '2015-0261', 0),
(137, '2014-0335', 0),
(138, '2016-0764', 0),
(139, '2014-0036', 0),
(140, '2015-0236', 0),
(141, '2015-0258', 0),
(142, '2014-0029', 0),
(143, '2017-0145', 0),
(144, '2017-0147', 0),
(145, '2014-0122', 0),
(146, '2014-0130', 0),
(147, '2014-0255', 0),
(148, '2014-0057', 0),
(149, '2014-0037', 0),
(150, '2013-0088', 0),
(151, '2014-0148', 0),
(152, '2013-0279', 0),
(153, '2019-0289', 0),
(154, '2014-0237', 0),
(155, '2014-0058', 0),
(156, '2014-0222', 0),
(157, '2014-0268', 0),
(158, '2018-0358', 0),
(159, '2014-0111', 0),
(160, '2014-0214', 0),
(161, '2015-0149', 0),
(162, '2014-0269', 0),
(163, '2016-0216', 0),
(164, '2014-0144', 0),
(165, '2014-0012', 0),
(166, '2018-0298', 0),
(167, '2014-0256', 0),
(168, '2013-0021', 0),
(169, '2014-0094', 0),
(170, '2014-0115', 0),
(171, '2014-0221', 0),
(172, '2014-0048', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterios`
--

CREATE TABLE `criterios` (
  `idCriterio` int(11) NOT NULL,
  `Criterio` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Porcentaje` decimal(10,0) DEFAULT NULL,
  `idDocente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `criterios`
--

INSERT INTO `criterios` (`idCriterio`, `Criterio`, `Descripcion`, `Porcentaje`, `idDocente`) VALUES
(11, 'Formato', 'El trabajo debe contar con el formato instutcional establecido', '85', '2020-0001'),
(12, 'Firma del representante', 'La firma debe ser clara', '15', '2020-0001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `Cod_docente` varchar(10) NOT NULL,
  `PNombreD` varchar(45) DEFAULT NULL,
  `SNombreD` varchar(45) DEFAULT NULL,
  `ApellidoPD` varchar(45) DEFAULT NULL,
  `ApellidoMD` varchar(45) DEFAULT NULL,
  `idUsuarioD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`Cod_docente`, `PNombreD`, `SNombreD`, `ApellidoPD`, `ApellidoMD`, `idUsuarioD`) VALUES
('2020-0001', 'Jorge', NULL, 'Sarmiento', 'Zumba', 173),
('2020-0002', 'Yaritza', NULL, 'Marin', NULL, 174);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `CodEst` varchar(10) NOT NULL,
  `ApellidoPE` varchar(45) DEFAULT NULL,
  `ApellidoME` varchar(45) DEFAULT NULL,
  `PNombreE` varchar(45) DEFAULT NULL,
  `SNombreE` varchar(45) DEFAULT NULL,
  `Curso` varchar(3) DEFAULT NULL,
  `Paralelo` char(1) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`CodEst`, `ApellidoPE`, `ApellidoME`, `PNombreE`, `SNombreE`, `Curso`, `Paralelo`, `idUsuario`) VALUES
('2012-0573', 'LIMA', 'ARMIJOS', 'LUIS', 'FABIAN', '3ro', 'F', 80),
('2013-0005', 'RAMIREZ', 'CASANOVA', 'WILMER', 'ALEJANDRO', '3ro', 'E', 134),
('2013-0021', 'VEGA', 'CHOCHO', 'EDISON', 'VICENTE', '3ro', 'E', 168),
('2013-0028', 'PACHECO', 'GUAMO', 'NIXON', 'ALEXANDER', '3ro', 'D', 116),
('2013-0031', 'MORALES', 'ALVERCA', 'ANTHONY', 'CARLOS', '3ro', 'E', 100),
('2013-0032', 'MURQUINCHO', 'ANGAMARCA', 'DEMETRIO', 'MIJAIL', '3ro', 'E', 105),
('2013-0088', 'SACA', 'AGUILAR', 'DAVID', 'MARCELO', '3ro', 'F', 150),
('2013-0092', 'MENDEZ', 'PALADINES', 'OSCAR', 'LEONEL', '3ro', 'D', 91),
('2013-0130', 'LALANGUI', 'QUINDE', 'EDWIN', 'FELIPE', '3ro', 'D', 77),
('2013-0132', 'CASTILLO', 'JAPON', 'ERICK', 'SANTIAGO', '3ro', 'A', 20),
('2013-0211', 'LOZANO', 'MENDOZA', 'RICARDO', 'DANIEL', '3ro', 'D', 85),
('2013-0218', 'ARMIJOS', 'SUAREZ', 'EDISON', 'DAVID', '3ro', 'B', 8),
('2013-0222', 'HERRERA', 'SANCHEZ', 'JHONATAN', 'JOSUE', '3ro', 'F', 67),
('2013-0228', 'PASACA', 'CORREA', 'JOSUE', 'MICAEL', '3ro', 'E', 118),
('2013-0274', 'GONZALEZ', 'MINGA', 'DAVID', 'ISMAEL', '3ro', 'F', 56),
('2013-0276', 'LOZANO', 'VEINTIMILLA', 'MIGUEL', 'ANGEL', '3ro', 'F', 82),
('2013-0278', 'MERINO', 'ROMERO', 'ALEJANDRO', 'ANTONIO', '3ro', 'E', 93),
('2013-0279', 'SINCHIRE', 'PUCHAICELA', 'DIEGO', 'ANIBAL', '3ro', 'F', 152),
('2014-0002', 'DELGADO', 'RELICA', 'LUIS', 'FERNANDO', '3ro', 'A', 43),
('2014-0006', 'MURQUINCHO', 'GUILCAPI', 'BRYAN', 'DAVID', '3ro', 'E', 106),
('2014-0008', 'LIVISACA', 'TORRES', 'ROYER', 'ARON', '3ro', 'A', 79),
('2014-0009', 'MONTAÑO', 'GNZALES', 'YERSON', 'ANTONIO', '3ro', 'B', 96),
('2014-0010', 'DIAZ', 'JIMENEZ', 'MATHIAS', 'ANDRES', '3ro', 'C', 46),
('2014-0012', 'VALLEJO', 'OCAMPO', 'ERICK', 'SEBASTIAN', '3ro', 'A', 165),
('2014-0017', 'ORELLANA', 'QUEZADA', 'JHANDRY', 'SEBASTIAN', '3ro', 'D', 112),
('2014-0019', 'PALADINES', 'GOYA', 'DANIEL', 'ARMANDO', '3ro', 'A', 117),
('2014-0020', 'ABRIGO', 'SUING', 'SANTIAGO', 'JOSUE', '3ro', 'E', 1),
('2014-0027', 'CORREA', 'QUITO', 'JHANCEL', 'WLADIMIR', '3ro', 'D', 42),
('2014-0029', 'RODRIGUEZ', 'OJEDA', 'JORGE', 'DAVID', '3ro', 'B', 142),
('2014-0030', 'GONZALES', 'SALINAS', 'JHON', 'CARLOS', '3ro', 'A', 52),
('2014-0032', 'ORTEGA', 'CORONEL', 'ROBERTH', 'ALEXANDER', '3ro', 'A', 115),
('2014-0036', 'RIOS', 'SILVA', 'MARIO', 'DAVID', '3ro', 'A', 139),
('2014-0037', 'SALTOS', 'CABRERA', 'JHON', 'ANDRES', '3ro', 'B', 149),
('2014-0039', 'LOJAN', 'VALLADARES', 'CRISTIAN', 'GERMAN', '3ro', 'A', 84),
('2014-0041', 'BECERRA', 'OCHOA', 'DAVID', 'ANDRES', '3ro', 'D', 11),
('2014-0042', 'GUAMAN', 'PAQUI', 'JHONNY', 'NAIM', '3ro', 'B', 63),
('2014-0043', 'CORDOVA', 'GALVEZ', 'WILSON', 'JAVIER', '3ro', 'B', 32),
('2014-0048', 'ZEVALLOS', 'ABARCA', 'JHON', 'SEBASTIAN', '3ro', 'B', 172),
('2014-0049', 'JUMBO', 'TORRES', 'JUAN', 'PABLO', '3ro', 'B', 74),
('2014-0050', 'PULLAGUARI', 'UCHUARI', 'VICTOR', 'DAMIAN', '3ro', 'A', 127),
('2014-0053', 'ORDOÑEZ', 'CALVA', 'JOSE', 'DAVID', '3ro', 'C', 110),
('2014-0057', 'RUEDA', 'ORTIZ', 'JOSE', 'LUIS', '3ro', 'B', 148),
('2014-0058', 'SARMIENTO', 'CHAMBA', 'ALEZ', 'JEANPIERRE', '3ro', 'B', 155),
('2014-0059', 'CEDEÑO', 'CUEVA', 'JOSE', 'JULIAN', '3ro', 'B', 23),
('2014-0061', 'ARMIJOS', 'SARMIENTO', 'JOSE', 'PAUL', '3ro', 'B', 7),
('2014-0063', 'LABANDA', 'TTENE', 'CLAUDIO', 'RENE', '3ro', 'D', 76),
('2014-0064', 'CABRERA', 'CHOCHO', 'JORDAN', 'DAVID', '3ro', 'D', 15),
('2014-0066', 'MAZA', 'GONZALEZ', 'IVAN', 'ALEXIS', '3ro', 'D', 89),
('2014-0067', 'PUCHAICELA', 'GUTIERREZ', 'DAVID', 'SAINTIAGO', '3ro', 'D', 125),
('2014-0070', 'ORDOÑEZ', 'MOROCHO', 'EDISON', 'MEDARDO', '3ro', 'B', 109),
('2014-0071', 'ENCALADA', 'SOTO', 'WILLIAM', 'DANIEL', '3ro', 'C', 47),
('2014-0073', 'MEDINA', 'SAMIENTO', 'CARLOS', 'ADRIAN', '3ro', 'E', 90),
('2014-0079', 'CHAMBA', 'GUACHIZACA', 'LEONARDO', 'ENRIQUE', '3ro', 'B', 26),
('2014-0080', 'JUMBO', 'LEIVA', 'CHRINTIAN', 'ALEXANDER', '3ro', 'B', 73),
('2014-0084', 'ENCARNACION', 'ERIQUE', 'KEVIN', 'PAUL', '3ro', 'E', 48),
('2014-0085', 'GRANDA', 'CORDOVA', 'JOHNSON', 'AARON', '3ro', 'B', 59),
('2014-0086', 'PEÑA', 'CARTUCHE', 'BYRON', 'ANDRES', '3ro', 'A', 120),
('2014-0089', 'CAMPAÑA', 'GAONA', 'JORGE', 'ENRIQUE', '3ro', 'F', 36),
('2014-0094', 'VELEZ', 'AGUILAR', 'JOSUE', 'MATEO', '3ro', 'D', 169),
('2014-0099', 'CHICAIZA', 'RODRIGUEZ', 'LANDER', 'ANDRES', '3ro', 'D', 27),
('2014-0102', 'PUGLLA', 'CASTILLO', 'YORLY', 'HERNAN', '3ro', 'C', 126),
('2014-0103', 'ESCUDERO', 'MEDINA', 'JOSEL', 'DANIEL', '3ro', 'B', 49),
('2014-0106', 'QUITUIZACA', 'ORDOÑEZ', 'JUAN', 'SEVASTIAN', '3ro', 'D', 131),
('2014-0109', 'CONTENTO', 'PUGA', 'ANTHONY', 'XAVIER', '3ro', 'B', 30),
('2014-0111', 'TORRES', 'TORRES', 'DANIEL', 'ALEJANDRO', '3ro', 'A', 159),
('2014-0113', 'LIMA', 'YUPANQUI', 'JOEL', 'ALEXANDER', '3ro', 'F', 81),
('2014-0115', 'YANGARI', 'YANZA', 'KEVIN', 'MARTIN', '3ro', 'E', 170),
('2014-0118', 'MAZA', 'PISARRO', 'JOSE', 'LUIS', '3ro', 'B', 88),
('2014-0119', 'CALVA', 'CANGO', 'KEVIN', 'ANDRES', '3ro', 'C', 17),
('2014-0122', 'ROJAS', 'CORDOVA', 'GUSTAVO', 'ANDRES', '3ro', 'F', 145),
('2014-0124', 'DIAZ', 'GUAJALA', 'BRYAN', 'ALEXANDER', '3ro', 'A', 44),
('2014-0129', 'MONTAÑO', 'ARMIJOS', 'PABLO', 'DAVID', '3ro', 'D', 98),
('2014-0130', 'ROMA', 'GUAYANAY', 'JOHN', 'JAIRO', '3ro', 'F', 146),
('2014-0131', 'CARPIO', 'VALLADARES', 'ISAC', 'JOEL', '3ro', 'C', 18),
('2014-0136', 'GUAYANAY', 'CHINCHAY', 'LUIS', 'FRANCISCO', '3ro', 'C', 65),
('2014-0138', 'MONTAÑO', 'NAULA', 'WILSON', 'ALFREDO', '3ro', 'C', 97),
('2014-0142', 'CELI', 'VIVANCO', 'DARIO', 'ALEXANDER', '3ro', 'C', 24),
('2014-0144', 'VALAREZO', 'VEINTIMILLA', 'MAX', 'GABRIEL', '3ro', 'E', 164),
('2014-0146', 'JUMBO', 'JIMENEZ', 'RUBEN', 'ANTONIO', '3ro', 'A', 72),
('2014-0148', 'SILVA', 'ROMERO', 'BRYAN', 'ANTONIO', '3ro', 'F', 151),
('2014-0149', 'MARIZACA', 'ORELLANA', 'DIEGO', 'MICHAEL', '3ro', 'D', 87),
('2014-0158', 'OCHOA', 'OCHOA', 'SANTIAGO', 'MIGUEL', '3ro', 'C', 108),
('2014-0168', 'CAMACHO', 'MALLA', 'ANDERSON', 'JOSUE', '3ro', 'F', 34),
('2014-0174', 'QUEZADA', 'FEIJO', 'CARLOS', 'DAVID', '3ro', 'C', 128),
('2014-0175', 'INGA', 'TORRES', 'ISMAEL', 'ALEJANDRO', '3ro', 'C', 70),
('2014-0176', 'PINTA', 'SARANGO', 'JASON', 'DAVID', '3ro', 'F', 123),
('2014-0181', 'MENDOZA', 'GUERRERO', 'SANTIAGO', 'ALEJANDRO', '3ro', 'D', 92),
('2014-0193', 'CARREÑO', 'POMA', 'JUNIOR', 'ALEXANDER', '3ro', 'F', 37),
('2014-0200', 'GUACHIZACA', 'GUAMAN', 'BRYAN', 'RICARDO', '3ro', 'C', 61),
('2014-0212', 'GUACHON', 'LANCHE', 'ANDRES', 'DAVID', '3ro', 'A', 62),
('2014-0214', 'TORRES', 'LALANGUI', 'CHRISTIAN', 'MAURICIO', '3ro', 'B', 160),
('2014-0219', 'MONTALVAN', 'BRAVO', 'LAURO', 'DANIEL', '3ro', 'A', 95),
('2014-0221', 'YANZA', 'GONZALES', 'RICARDO', 'SEBASTIAN', '3ro', 'A', 171),
('2014-0222', 'SOTO', 'RODRIGUEZ', 'ANGELO', 'VINICIO', '3ro', 'D', 156),
('2014-0231', 'PAZA', 'VALLE', 'BORIS', 'JEANCARLO', '3ro', 'C', 119),
('2014-0237', 'SANMARTIN', 'PUCHAICELA', 'EDISSON', 'DAVID', '3ro', 'E', 154),
('2014-0238', 'QUIZHPE', 'MONTAÑO', 'JOEL', 'ALEJANDRO', '3ro', 'C', 132),
('2014-0255', 'ROJAS', 'HIDALGO', 'JUAN', 'DAVID', '3ro', 'C', 147),
('2014-0256', 'CASTILLO', 'DUCHI', 'ANTHONY', 'MIGUEL', '3ro', 'F', 39),
('2014-0257', 'VASQUEZ', 'ALVAREZ', 'JOSTYN', 'ANDRES', '3ro', 'C', 167),
('2014-0258', 'BRAVO', 'TAMBO', 'CAMILO', 'EDUARDO', '3ro', 'B', 12),
('2014-0268', 'TADAY', 'BARROS', 'DIEGO', 'ARMANDO', '3ro', 'C', 157),
('2014-0269', 'TUCTO', 'YANZA', 'DAVID', 'ALEJANDRO', '3ro', 'A', 162),
('2014-0287', 'GONZALEZ', 'CABRERA', 'MIGUEL', 'ANGEL', '3ro', 'D', 53),
('2014-0307', 'AMAY', 'JUMBO', 'ANNDY', 'JONATHAN', '3ro', 'E', 6),
('2014-0310', 'GONZALEZ', 'ERRAIZ', 'DIEGO', 'HERNAN', '3ro', 'D', 54),
('2014-0325', 'GALLEGOS', 'VEINTIMILLA', 'BENJHAMIN', 'ALESSANDRO', '3ro', 'C', 51),
('2014-0328', 'CHIMBO', 'GRANDA', 'JACKSON', 'ALEXANDER', '3ro', 'C', 28),
('2014-0333', 'GUTIERRES', 'QUEZADA', 'PABLO', 'JOSE', '3ro', 'A', 66),
('2014-0335', 'RAMOS', 'ROMAN', 'SANTIAGO', 'DAVID', '3ro', 'C', 137),
('2014-0344', 'CARRION', 'VEGA', 'RICARDO', 'FABIAN', '3ro', 'A', 19),
('2014-0347', 'CASTILLO', 'JAPON', 'ALEX', 'DAVID', '3ro', 'C', 22),
('2014-0352', 'QUICHIMBO', 'BALCAZAR', 'ALCI', 'DANIEL', '3ro', 'B', 129),
('2014-0358', 'PIJUANA', 'ERIQUE', 'JUAN', 'DIEGO', '3ro', 'D', 121),
('2015-0139', 'ALVAREZ', 'LLIVIZACA', 'EDWIN', 'ALEXANDER', '3ro', 'C', 5),
('2015-0143', 'BRAVO', 'VASQUEZ', 'ISRAEL', 'ANDRES', '3ro', 'D', 13),
('2015-0149', 'TRIANA', 'GUAMAN', 'JHONDER', 'MATEO', '3ro', 'D', 161),
('2015-0154', 'GONZALEZ', 'CASTRO', 'IVAN', 'PATRICIO', '3ro', 'F', 55),
('2015-0176', 'MACAS', 'GONZALEZ', 'PABLO', 'GONZALO', '3ro', 'D', 86),
('2015-0178', 'CHUQUIMARCA', 'CRUZ', 'DYLAN', 'PAUL', '3ro', 'B', 29),
('2015-0181', 'PONCE', 'BENITEZ', 'DAVID', 'ANDRES', '3ro', 'B', 124),
('2015-0183', 'FLORES', 'HURTADO', 'DAVID', 'ALEJANDRO', '3ro', 'C', 50),
('2015-0236', 'RIVERA', 'AGUILAR', 'KEVIN', 'ANDERSON', '3ro', 'B', 140),
('2015-0258', 'RIVERA', 'JIMENEZ', 'DARIO', 'JAVIER', '3ro', 'D', 141),
('2015-0261', 'RAMOS', 'VEINTIMILLA', 'CRISTHIAN', 'JHONSON', '3ro', 'B', 136),
('2016-0146', 'MOROCHO', 'SARANGO', 'DANIEL', 'ISRRAEL', '3ro', 'E', 102),
('2016-0151', 'ASTUDILLO', 'SANCHEZ', 'NAHIM', 'ALEJANDRO', '3ro', 'A', 9),
('2016-0166', 'HIDALGO', 'ROJAS', 'ALEZ', 'ISMAEL', '3ro', 'D', 69),
('2016-0169', 'LABANDA', 'PACCHA', 'JOSE', 'ALBERTO', '3ro', 'D', 75),
('2016-0193', 'CRUZ', 'CHUNCHO', 'PAUL', 'ANDRES', '3ro', 'F', 41),
('2016-0197', 'GONZALEZ', 'SAMANIEGO', 'COSME', 'ALEJANDRO', '3ro', 'F', 57),
('2016-0198', 'CHALAN', 'VILLA', 'SANTIAGO', 'BLADIMIR', '3ro', 'D', 25),
('2016-0203', 'MINGA', 'JIMENEZ', 'LUIS', 'ALFREDO', '3ro', 'A', 94),
('2016-0205', 'QUIZHPE', 'BENITEZ', 'JHON', 'ANDRES', '3ro', 'D', 133),
('2016-0216', 'UYAGUARI', 'GUACHISACA', 'DANNY', 'SANTIAGO', '3ro', 'F', 163),
('2016-0251', 'CORREA', 'GRANDA', 'DAVID', 'FABIAN', '3ro', 'D', 33),
('2016-0256', 'QUINAUCHO', 'JUMBO', 'KEVIN', 'ALEXANDER', '3ro', 'E', 130),
('2016-0278', 'ORTEGA', 'CUEVA', 'KLEVER', 'GEOVANNY', '3ro', 'F', 114),
('2016-0295', 'AYORA', 'MERINO', 'STEVEN', 'EDUARDO', '3ro', 'E', 10),
('2016-0732', 'ALBITO', 'CAJAMARCA', 'JOHATHAN', 'CRISTIAN', '3ro', 'A', 3),
('2016-0733', 'ALVARADO', 'ARIAS', 'JOEL', 'FRANCISCO', '3ro', 'A', 4),
('2016-0736', 'CAMAÑO', 'ESPARZA', 'MARCO', 'ANDRES', '3ro', 'F', 35),
('2016-0739', 'CARRION', 'ROMAN', 'CARLOS', 'DAVID', '3ro', 'F', 38),
('2016-0743', 'CORDOVA', 'MALDONADO', 'YANFRY', 'AUGUSTO', '3ro', 'F', 40),
('2016-0744', 'DIAZ', 'PALADINES', 'CARLOS', 'DAVID', '3ro', 'A', 45),
('2016-0750', 'HIDALGO', 'ENCALADA', 'ENZO', 'FABIAN', '3ro', 'D', 68),
('2016-0758', 'MONTAÑO', 'GUAMAN', 'JONATHAN', 'RICARDO', '3ro', 'E', 99),
('2016-0759', 'MOROCHO', 'CHISAGUANO', 'JONATHAN', 'EFRAIN', '3ro', 'F', 103),
('2016-0760', 'OCHOA', 'LIMA', 'CRISTIAN', 'JOHEL', '3ro', 'B', 107),
('2016-0762', 'ORTEGA', 'BENITEZ', 'ANTHONY', 'ISMAEL', '3ro', 'A', 113),
('2016-0763', 'PINTA', 'AÑAZCO', 'JUAN', 'ANDRES', '3ro', 'B', 122),
('2016-0764', 'REYES', 'CASTRO', 'PAUL', 'ANDRES', '3ro', 'D', 138),
('2017-0001', 'ACARO', 'CURIPOMA', 'ANDY', 'ALEXANDER', '3ro', 'C', 2),
('2017-0019', 'BRICEÑO', 'GAONA', 'FRANCO', 'ALEXIS', '3ro', 'B', 14),
('2017-0034', 'CASTILLO', 'TORRES', 'JANDRY', 'MAURICIO', '3ro', 'A', 21),
('2017-0072', 'GRANDA', 'NARVAEZ', 'JORGE', 'JHOEL', '3ro', 'C', 60),
('2017-0091', 'LAPO', 'TENE', 'JOSELITO', 'ANDRES', '3ro', 'B', 78),
('2017-0145', 'RODRIGUEZ', 'VERA', 'DANIEL', 'ALEXANDER', '3ro', 'C', 143),
('2017-0147', 'RODRIGUEZ', 'VERA', 'DAVID', 'ALEJANDRO', '3ro', 'C', 144),
('2017-0304', 'GORDILLO', 'ESPINOSA', 'LUIS', 'ANDRES', '3ro', 'C', 58),
('2017-0311', 'GUAMAN', 'GUTIERREZ', 'LUIS', 'ALBERTO', '3ro', 'C', 64),
('2017-0352', 'ORDOÑEZ', 'PADILLA', 'ANDRES', 'DAVID', '3ro', 'D', 111),
('2017-0419', 'MOROCHO', 'CUEVA', 'RODIN', 'ERICK', '3ro', 'B', 101),
('2018-0298', 'VALVERDE', 'RIOFRIO', 'JANDRY', 'GEOVANNY', '3ro', 'C', 166),
('2018-0330', 'RAMON', 'ORTEGA', 'LEONARDO', 'DAVID', '3ro', 'B', 135),
('2018-0357', 'CALDERON', 'RIOFRIO', 'ANTHONY', 'FRANCYS', '3ro', 'C', 16),
('2018-0358', 'TORRES', 'CASTILLO', 'LUIS', 'FERNANDO', '3ro', 'A', 158),
('2018-0396', 'LOJAN', 'GRANDA', 'ANDRESON', 'ESTEVEN', '3ro', 'A', 83),
('2018-0443', 'MUÑOZ', 'CASTRO', 'MATEO', 'DECARLO', '3ro', 'A', 104),
('2019-0232', 'CORDOVA', 'VERA', 'BRIAN', 'MARCELO', '3ro', 'A', 31),
('2019-0289', 'SANCHEZ', 'LAÑON', 'EDWIN', 'MAURICIO', '3ro', 'B', 153),
('2019-0360', 'JARAMILLO', 'AGUILAR', 'VICTOR', 'ANDRES', '3ro', 'A', 71);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaestudiantes`
--

CREATE TABLE `listaestudiantes` (
  `idListaEstudiantes` int(11) NOT NULL,
  `fkEstudiantes` varchar(10) NOT NULL,
  `fkDocente` varchar(10) NOT NULL,
  `fkProyectoe` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `listaestudiantes`
--

INSERT INTO `listaestudiantes` (`idListaEstudiantes`, `fkEstudiantes`, `fkDocente`, `fkProyectoe`) VALUES
(1, '2014-0020', '2020-0001', 8),
(2, '2017-0001', '2020-0002', 2),
(3, '2016-0732', '2020-0001', 3),
(4, '2016-0733', '2020-0001', 4),
(5, '2015-0139', '2020-0002', 5),
(6, '2014-0307', '2020-0001', 6),
(7, '2014-0061', '2020-0002', 7),
(8, '2013-0218', '2020-0002', 9),
(9, '2016-0151', '2020-0001', 10),
(10, '2016-0295', '2020-0001', 2),
(11, '2014-0041', '2020-0001', 11),
(12, '2014-0258', '2020-0002', 12),
(13, '2015-0143', '2020-0001', 13),
(14, '2017-0019', '2020-0002', 14),
(15, '2014-0064', '2020-0001', 15),
(16, '2018-0357', '2020-0002', 16),
(17, '2014-0119', '2020-0002', 17),
(18, '2014-0131', '2020-0002', 18),
(19, '2014-0344', '2020-0001', 19),
(20, '2013-0132', '2020-0001', 20),
(21, '2017-0034', '2020-0001', 21),
(22, '2014-0347', '2020-0002', 22),
(23, '2014-0059', '2020-0002', 23),
(24, '2014-0142', '2020-0002', 24),
(25, '2016-0198', '2020-0001', 25),
(26, '2014-0079', '2020-0002', 26),
(27, '2014-0099', '2020-0001', 27),
(28, '2014-0328', '2020-0002', 28),
(29, '2015-0178', '2020-0002', 29),
(30, '2014-0109', '2020-0002', 30),
(31, '2019-0232', '2020-0001', 31),
(32, '2014-0043', '2020-0002', 32),
(33, '2016-0251', '2020-0001', 33),
(34, '2014-0168', '2020-0001', 34),
(35, '2016-0736', '2020-0001', 35),
(36, '2014-0089', '2020-0001', 36),
(37, '2014-0193', '2020-0001', 37),
(38, '2016-0739', '2020-0001', 38),
(39, '2014-0256', '2020-0001', 39),
(40, '2016-0743', '2020-0001', 40),
(41, '2016-0193', '2020-0001', 41),
(42, '2014-0027', '2020-0001', 42),
(43, '2014-0002', '2020-0001', 43),
(44, '2014-0124', '2020-0001', 44),
(45, '2016-0744', '2020-0001', 45),
(46, '2014-0010', '2020-0002', 46),
(47, '2014-0071', '2020-0002', 47),
(48, '2014-0084', '2020-0001', 48),
(49, '2014-0103', '2020-0002', 49),
(50, '2015-0183', '2020-0002', 50),
(51, '2014-0325', '2020-0002', 51),
(52, '2014-0030', '2020-0001', 52),
(53, '2014-0287', '2020-0001', 53),
(54, '2014-0310', '2020-0001', 54),
(55, '2015-0154', '2020-0001', 55),
(56, '2013-0274', '2020-0001', 56),
(57, '2016-0197', '2020-0001', 57),
(58, '2017-0304', '2020-0002', 58),
(59, '2014-0085', '2020-0002', 59),
(60, '2017-0072', '2020-0002', 60),
(61, '2014-0200', '2020-0002', 61),
(62, '2014-0212', '2020-0001', 62),
(63, '2014-0042', '2020-0002', 3),
(64, '2017-0311', '2020-0002', 4),
(65, '2014-0136', '2020-0002', 5),
(66, '2014-0333', '2020-0001', 6),
(67, '2013-0222', '2020-0001', 7),
(68, '2016-0750', '2020-0001', 8),
(69, '2016-0166', '2020-0001', 9),
(70, '2014-0175', '2020-0002', 10),
(71, '2019-0360', '2020-0001', 11),
(72, '2014-0146', '2020-0001', 12),
(73, '2014-0080', '2020-0002', 13),
(74, '2014-0049', '2020-0002', 14),
(75, '2016-0169', '2020-0001', 15),
(76, '2014-0063', '2020-0001', 16),
(77, '2013-0130', '2020-0001', 17),
(78, '2017-0091', '2020-0002', 18),
(79, '2014-0008', '2020-0001', 19),
(80, '2012-0573', '2020-0001', 20),
(81, '2014-0113', '2020-0001', 21),
(82, '2013-0276', '2020-0001', 22),
(83, '2018-0396', '2020-0001', 23),
(84, '2014-0039', '2020-0001', 24),
(85, '2013-0211', '2020-0001', 25),
(86, '2015-0176', '2020-0001', 26),
(87, '2014-0149', '2020-0001', 27),
(88, '2014-0118', '2020-0002', 28),
(89, '2014-0066', '2020-0001', 29),
(90, '2014-0073', '2020-0001', 30),
(91, '2013-0092', '2020-0001', 31),
(92, '2014-0181', '2020-0001', 32),
(93, '2013-0278', '2020-0001', 33),
(94, '2016-0203', '2020-0001', 34),
(95, '2014-0219', '2020-0001', 35),
(96, '2014-0009', '2020-0002', 36),
(97, '2014-0138', '2020-0002', 37),
(98, '2014-0129', '2020-0001', 38),
(99, '2016-0758', '2020-0001', 39),
(100, '2013-0031', '2020-0001', 40),
(101, '2017-0419', '2020-0002', 41),
(102, '2016-0146', '2020-0001', 42),
(103, '2016-0759', '2020-0001', 43),
(104, '2018-0443', '2020-0001', 44),
(105, '2013-0032', '2020-0001', 45),
(106, '2014-0006', '2020-0001', 46),
(107, '2016-0760', '2020-0002', 47),
(108, '2014-0158', '2020-0002', 48),
(109, '2014-0070', '2020-0002', 49),
(110, '2014-0053', '2020-0002', 50),
(111, '2017-0352', '2020-0001', 51),
(112, '2014-0017', '2020-0001', 52),
(113, '2016-0762', '2020-0001', 53),
(114, '2016-0278', '2020-0001', 54),
(115, '2014-0032', '2020-0001', 55),
(116, '2013-0028', '2020-0001', 56),
(117, '2014-0019', '2020-0001', 57),
(118, '2013-0228', '2020-0001', 58),
(119, '2014-0231', '2020-0002', 59),
(120, '2014-0086', '2020-0001', 60),
(121, '2014-0358', '2020-0001', 61),
(122, '2016-0763', '2020-0002', 62),
(123, '2014-0176', '2020-0001', 3),
(124, '2015-0181', '2020-0002', 4),
(125, '2014-0067', '2020-0001', 5),
(126, '2014-0102', '2020-0002', 6),
(127, '2014-0050', '2020-0001', 7),
(128, '2014-0174', '2020-0002', 8),
(129, '2014-0352', '2020-0002', 9),
(130, '2016-0256', '2020-0001', 10),
(131, '2014-0106', '2020-0001', 11),
(132, '2014-0238', '2020-0002', 12),
(133, '2016-0205', '2020-0001', 13),
(134, '2013-0005', '2020-0001', 14),
(135, '2018-0330', '2020-0002', 15),
(136, '2015-0261', '2020-0002', 16),
(137, '2014-0335', '2020-0002', 17),
(138, '2016-0764', '2020-0001', 18),
(139, '2014-0036', '2020-0001', 19),
(140, '2015-0236', '2020-0002', 20),
(141, '2015-0258', '2020-0001', 21),
(142, '2014-0029', '2020-0002', 22),
(143, '2017-0145', '2020-0002', 23),
(144, '2017-0147', '2020-0002', 24),
(145, '2014-0122', '2020-0001', 25),
(146, '2014-0130', '2020-0001', 26),
(147, '2014-0255', '2020-0002', 27),
(148, '2014-0057', '2020-0002', 28),
(149, '2014-0037', '2020-0002', 29),
(150, '2013-0088', '2020-0001', 30),
(151, '2014-0148', '2020-0001', 31),
(152, '2013-0279', '2020-0001', 32),
(153, '2019-0289', '2020-0002', 33),
(154, '2014-0237', '2020-0001', 34),
(155, '2014-0058', '2020-0002', 35),
(156, '2014-0222', '2020-0001', 36),
(157, '2014-0268', '2020-0002', 37),
(158, '2018-0358', '2020-0001', 38),
(159, '2014-0111', '2020-0001', 39),
(160, '2014-0214', '2020-0002', 40),
(161, '2015-0149', '2020-0001', 41),
(162, '2014-0269', '2020-0001', 42),
(163, '2016-0216', '2020-0001', 43),
(164, '2014-0144', '2020-0001', 44),
(165, '2014-0012', '2020-0001', 45),
(166, '2018-0298', '2020-0002', 46),
(167, '2014-0256', '2020-0002', 47),
(168, '2013-0021', '2020-0001', 48),
(169, '2014-0094', '2020-0001', 49),
(170, '2014-0115', '2020-0001', 50),
(171, '2014-0221', '2020-0001', 51),
(172, '2014-0048', '2020-0002', 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `idNotas` int(11) NOT NULL,
  `idAvanceFKN` int(11) NOT NULL,
  `Criterio` varchar(255) DEFAULT NULL,
  `notaPorcentaje` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`idNotas`, `idAvanceFKN`, `Criterio`, `notaPorcentaje`) VALUES
(29, 1379, 'Formato', 8.5),
(30, 1379, 'Firma del representante', 1.5),
(31, 1380, 'Formato', 7),
(32, 1380, 'Formato', 1.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observaciones`
--

CREATE TABLE `observaciones` (
  `idObservacion` int(11) NOT NULL,
  `observacion` varchar(255) DEFAULT 'Ninguna',
  `idAvanceFKO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `observaciones`
--

INSERT INTO `observaciones` (`idObservacion`, `observacion`, `idAvanceFKO`) VALUES
(20, '', 1379),
(21, 'Exelente', 1379),
(22, 'Describir mejor la metodología', 1380),
(23, '', 1380);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `id_proyecto` int(11) NOT NULL,
  `Proyecto` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id_proyecto`, `Proyecto`, `Descripcion`) VALUES
(1, 'Monografía', 'Monografía'),
(2, 'Avances Monograficos', 'Plataforama para el registro de avances monográficos'),
(3, 'Aplicación de ondas ultrasónicas', 'Aplicación de ondas ultrasónicas como medio de control del ataque de termitas subterráneas Reticulermes Hesperus Bank sp. (Isoptera: Rhino Termitodae) en Madera de Pinus radiata. FONDECYT 1040726.'),
(4, 'Murga y Comparsa', 'Murga y Comparsa la Catarsis'),
(5, 'Efecto de las intervenciones', 'Efecto de las intervenciones silvícolas sobre el desarrollo, relaciones hídricas y eficiencia en la conversión de energía radiante en vástagos de Nothofagus Macrocarpa, ubicados en la zona del Cerro El Roble. FONDECYT 1061100.'),
(6, '“El cosmo literario”', 'Libro “El cosmo literario”'),
(7, 'Developing a curriculum', '“Developing a curriculum for Introduction to integrative socioenvironmental research (ISER) in graduate programs in Latin America (LA)”'),
(8, 'Fotalecimiento de la Murga', 'Fotalecimiento de la Murga'),
(9, 'Promoción de la ciencia', '“Promoción de la ciencia  en escuelas públicas de Colombia  a través del uso de la Robótica”'),
(10, 'Huellas digitales', 'Huellas digitales'),
(11, 'Population spillover', 'Population spillover and the effect of plantation clearcutting on adjacent native forests.'),
(12, 'Implementación de una propuesta', '“Implementación de una propuesta de modelo de integración curricular de las TIC en Colombia”'),
(13, 'Desarrollo de un modelo', '“Desarrollo de un modelo  de acompañamiento para  el fortalecimiento pedagógico de profesores de programas de licenciatura en Matemáticas y lenguas de la región caribe colombiana”'),
(14, 'Disturbance mediated water and n', 'Disturbance mediated water and nutrient stresses regulate carbon assimilation and allocation in schlerophyll ecosystems in Central Chile: a process-based approach. FONDECYT 1090283.'),
(15, 'RE-CREA-TE', 'RE-CREA-TE'),
(16, 'Estrategias para el fortalecimiento', '“Estrategias para el fortalecimiento de las TIC en las escuelas en Colombia”'),
(17, 'Mi plaza es la de todos', 'Mi plaza es la de todos'),
(18, 'Arte, historia y una ciudad', 'Arte, historia y una ciudad que lo cuenta'),
(19, 'Ciclo de Cine Rural', 'Ciclo de Cine Rural Otoño- Invierno 2011'),
(20, 'ExpresArte', 'ExpresArte'),
(21, 'Taller de Murga y teatro', 'Taller de Murga y teatro barrial'),
(22, 'Por un espacio de la diversidad', 'Por un espacio de la diversidad cultural'),
(23, 'Jóvenes +eCiudadanos Globales.', '“Jóvenes +eCiudadanos Globales. Promoción de una ciudadanía global a través de las TIC, en estudiantes de secundaria de la región Caribe de Colombia¨'),
(24, 'Effect of the use of mixtures of TICS', 'Effect of the use of mixtures of lignocelluloses on the production of second generation bioethanol. FONDECYT 11110368'),
(25, 'Plant and soil methane fluxes', 'Plant and soil methane fluxes as influenced by water, temperature and radiative stresses across a disturbance gradient in schlerophyll ecosystems in Central Chile.'),
(26, 'Habilidades cognitivas', '“Habilidades cognitivas y socioemocionales de los estudiantes en procesos de articulación entre la Media Vocacional y la Formación Técnica en el Departamento del Atlántico Ámbito geográfico'),
(27, 'Factores ambientales', '“Factores asociados al nivel de uso de las TIC como herramienta de enseñanza y aprendizaje en las instituciones educativas oficiales de Colombia  y Brasil. Caso Barranquilla y Florianópolis”'),
(28, 'Andar con voz', 'andar con voz'),
(29, 'Economic preferences', 'Economic preferences for non-market environmental services un the Campana National Park using choice experiments. FONDECYT 11100407'),
(30, 'Nuevos escenarios de aprendizaje', '“Nuevos escenarios de aprendizaje'),
(31, 'Estudio fitogeográfico en paisajes', 'Estudio fitogeográfico en paisajes y ecosistemas naturales de Chile mediterráneo afectados por fuegos, para propuesta de restauración ecológica. cartografía fitoecológica. FONDECYT 1095048.'),
(32, 'La plaza Tiene Vida', 'La plaza Tiene Vida'),
(33, 'Above- and below-ground response', 'Above- and below-ground responses of Nothofagus betuloides advance regeneration as affected by the microenvironment, soil conditions, size and competition. FONDECYT 11100093'),
(34, 'Ojo a la calidad  de la Educación', '“Ojo a la calidad  de la Educación de Barranquilla”'),
(35, 'El corredor fluvial del Mapocho', 'El corredor fluvial del Mapocho siglo XXI: hacia un conjunto de variables para la definición y el manejo de un polígono de intervención multifacética e integral entre las comunas de Quinta Normal y el Monte. FONDECYT 1090199.'),
(36, 'Por un Rincón sano y saludable', 'Por un Rincón sano y saludable'),
(37, 'Clear-cut size and the conservation', 'Clear-cut size and the conservation of animal biodiversity in pine plantations. FONDECYT 1080463.'),
(38, 'Ministerio de Educación Nacional', 'Ministerio de Educación Nacional con sede en Bogotá, Colombia'),
(39, 'Taller de serigrafía', 'Taller de serigrafía'),
(40, 'Banda–Escuela de Música de Zenó', 'Banda–Escuela de Música de Zenón Pereyra'),
(41, 'Informática para todos', 'Informática para todos'),
(42, 'Caracterización de las actividades', '“Caracterización de las actividades emprendidas por el Estado, el sector educativo, empresarial y la sociedad civil para  apoyar y/o fortalecer los procesos de orientación socio-ocupacional en el Departamento del Atlántico (Colombia)”'),
(43, 'Quality and fluxes of soil', 'Quality and fluxes of soil organic carbon as affected by anthropogenic perturbations of sclerophyll vegetation of Central Chile. FONDECYT 1090283'),
(44, 'Ciclo de cine en Monigotes', 'Ciclo de cine en Monigotes'),
(45, 'Estrategias de Movilización', '“Estrategias de Movilización de la Demanda de la Educación Superior”'),
(46, 'Trabajo Joven', 'Trabajo Joven'),
(47, 'Building tools to measure', '“Building tools to measure the use  os ICTs in the classroom”'),
(48, 'La e-competencia', '“La e-competencia en los escenarios de enseñanza en adultos en condición  de reintegración en Colombia. Caso de Barranquilla”'),
(49, 'Cine en espacios abiertos', 'Cine en espacios abiertos'),
(50, 'Bioconstruyendo Villa Ana', 'Bioconstruyendo Villa Ana'),
(51, 'Desarrollo Programa de I+D+i', '“Desarrollo Programa de I+D+i en energías renovables para el departamento de la Guajira”'),
(52, 'Identificación y caracterizaciónes', 'Identificación y caracterización de las necesidades de Capital Humano actuales y con visión prospectiva, para el sector agropecuario del Departamento del Atlántico'),
(53, 'Autoproducción de contenidos', '“Autoproducción de contenidos y recurso audiovisuales  digitales bajo modelos de bajo coste en el contexto educativo”'),
(54, 'Construcción de indicadores', '“Construcción de indicadores en materia educativa en Colombia”'),
(55, 'Los pequeños floricultores', 'Los pequeños floricultores'),
(56, 'Diseño  de un espacio virtual', '“Diseño  de un espacio virtual con recursos tecnológicos para  el desarrollo de competencias TIC”'),
(57, 'SANCOMP 2011', 'SANCOMP 2011'),
(58, 'Situación Psico-Social y Pedag', '“Situación Psico-Social y Pedagógica en los Colegios de Educación Formal de Adultos y Jóvenes en Proceso de Reintegración con la ACR en el Distrito Barranquilla”'),
(59, 'La Murga', 'Para que te quedes con la Murga'),
(60, 'Manejo del suelo', 'Manejo del suelo y secuestro de carbono. Efectos sobre la capacidad productiva del suelo en ambientes mediterráneos.  FONDECYT 1050565.'),
(61, 'Análisis de los determinantes', '“Análisis de los determinantes de la percepción ciudadana sobre la educación en Colombia, a partir de la Encuesta elaborada por ECT en 2010”'),
(62, 'Medición del impacto ambiental', '“Medición del impacto  de las actividades orientadas al fomento  de las TIC en el sector educativo en la Región Caribe  Colombiana. Caso Barranquilla y Cartagena”');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `Usuario` varchar(45) NOT NULL,
  `Pass` varchar(45) NOT NULL,
  `Rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuarios`, `Usuario`, `Pass`, `Rol`) VALUES
(1, 'sjabrigo', '3dcc6e1e0e39565b44a662efcc042571', 1),
(2, 'aaacaro', '492f3aed752a4ddffe8a118094528e08', 1),
(3, 'jcalbito', '3b2b051720736b4c04367d29ca96b40f', 1),
(4, 'jfalvarado', '6f09ebb742ccf54858401538c8e91f94', 1),
(5, 'eaalvarez', '13d77b13108b7ebbb49447ac0dcfaf5c', 1),
(6, 'ajamay', 'b43fcb4feca8b0452dcce63364dc59d3', 1),
(7, 'jparmijos', '966b44ede34f346212dfec82a1c93dc9', 1),
(8, 'edarmijos', '8526478a050893c58cbb7642e7c39c17', 1),
(9, 'naastudillo', 'd7de7f5e6726881f8452fd46508f119a', 1),
(10, 'seayora', 'bfdbed684fdc028f2341950eea1036c1', 1),
(11, 'dabecerra', 'ad444cc85e1219cfb5074596f8901ece', 1),
(12, 'cebravo', 'fe3d81837af94d89cfb403287967201b', 1),
(13, 'iabravo', 'fe1b1ee4608afccbb33c8051d73f42bf', 1),
(14, 'fabriceño', '8fe611124e1e5ec8b60a157d19f31cd9', 1),
(15, 'jdcabrera', '9888cd5f41b6862067daf48d9ffb01c0', 1),
(16, 'afcalderon', 'e2687f8c93c14f2615bcb0ecea4e6233', 1),
(17, 'kacalva', '63fca7036d00183ef8fe7caadb7111d4', 1),
(18, 'ijcarpio', '313a3b8b3a43bd28bf91b82a019861a0', 1),
(19, 'rfcarrion', 'c6bbf7338acdb52f0e07ca138269e797', 1),
(20, 'escastillo', '6f62a958c8e627d8a5bb83a1419766a2', 1),
(21, 'jmcastillo', '31eae51f215f355811e75a8da2aae09f', 1),
(22, 'adcastillo', '24f5a8c3951984c7299fbcf0498e1c61', 1),
(23, 'jjcedeño', '407cb28c9e1451c5da1ff8aad1e938c9', 1),
(24, 'daceli', 'dcaf66142398b3a9b7f17550277fd8f6', 1),
(25, 'sbchalan', '1323a73e1a2c3cb5a8152729ce62a316', 1),
(26, 'lechamba', 'b352df12fef0cdcfebf27688d70d24a2', 1),
(27, 'lachicaiza', 'b051b194b6f2d3b1ec04ae3888bd5322', 1),
(28, 'jachimbo', 'b579708cbcf7cb4e8edd2b652737f876', 1),
(29, 'dpchuquimarca', '7171d0189130f16a537b77bfbb6996d5', 1),
(30, 'axcontento', '4e4d1660a395fc6b9bf24f6620d5fd97', 1),
(31, 'bmcordova', 'c5d10b82449564683c5a8a33f91c874f', 1),
(32, 'wjcordova', '9c7c6e75fa277f8a89122f0720a4ba86', 1),
(33, 'dfcorrea', 'f617ba76c5df154f6361a7e9f530f242', 1),
(34, 'aj	camacho', 'ad136ae40adaf469c984b151d4e9749f', 1),
(35, 'ma	camaño', 'aed7c1516340a4bace18eca99d94dddd', 1),
(36, 'je	campaña', '9ecdeb6a95f2e000030946e7043f6dfb', 1),
(37, 'ja	carreño', '5cc72bf13bbb56daa57ffcbb4abed649', 1),
(38, 'cd	carrion', 'cda98bae639306b2f482fbe58f100179', 1),
(39, 'am	castillo', '1d9b0859dbf7a4ad25e3e27096460d9b', 1),
(40, 'ya	cordova', 'c214cf4a6c10649688d43cb872c1d40a', 1),
(41, 'pa	cruz', '5297333c9ee49ef9defddea87b3b870f', 1),
(42, 'jwcorrea', '20ec283f6bfd2fbafbe6e7abbb6a2982', 1),
(43, 'lfdelgado', 'fb2e39a484d16581428a19131001d11e', 1),
(44, 'badiaz', 'd6224b6d502d074047882bb93ad2f19f', 1),
(45, 'cddiaz', '91d2f570e1bfdc5f0f3c46aec50a2236', 1),
(46, 'madiaz', '266fa61b66906b63feba9385c6e1d452', 1),
(47, 'wdencalada', '8fc2bc287e238d0e32c42b5e39bb3a0a', 1),
(48, 'kpencarnacion', 'b504adba5ca2f8b33bd7a5f5a48c73bc', 1),
(49, 'jdescudero', '4b3bf4f79180a7272c18df339586cb24', 1),
(50, 'daflores', 'cabe98eae7a88c3f5f6fafc5adb7fcb7', 1),
(51, 'bagallegos', '6cc9222be7a1dc12a0f2bf95e4b99d45', 1),
(52, 'jcgonzales', 'dad2b951007a7f9a0acf63fb16ed82c6', 1),
(53, 'magonzalez', '756ecd8885a32b6c88c4f1edb6f4af02', 1),
(54, 'dhgonzalez', '5f8c3b94c6d39aa3adb5da3988234c95', 1),
(55, 'ip	gonzalez', '95e37d50b7eb0e90a297761847f96b30', 1),
(56, 'di	gonzalez', '24955c835ee6d120421172c3c6742711', 1),
(57, 'ca	gonzalez', 'c943c7b76bb83f015b8a35020c63d483', 1),
(58, 'lagordillo', '51d00d618da2536b30aef4f43b84583d', 1),
(59, 'jagranda', 'f6dd7066da40a78e56517b2f2278d14e', 1),
(60, 'jjgranda', '22f755f638c59f6282a91d747520835b', 1),
(61, 'brguachizaca', '7bd8d950a875e3d19ccb26089c6ab31b', 1),
(62, 'adguachon', '8a77f8cdd1ecb491a91f17d6f565118c', 1),
(63, 'jnguaman', '16987f0f944450a0e5cda3160e8c43cb', 1),
(64, 'laguaman', 'f6d8de75327a58533d5e28f73b3d741b', 1),
(65, 'lfguayanay', '4cca3f5835cc65b91ad7ff373a09144b', 1),
(66, 'pjgutierres', 'd84bf015ef97407c162e0976fb9f64f6', 1),
(67, 'jj	herrera', '5cbe6f26415f539233962e2c3ccd9347', 1),
(68, 'efhidalgo', 'a7164f65ea986105eb0faf8ba8d1f939', 1),
(69, 'aihidalgo', '5a335db4bb6088b9f05655c683040ef8', 1),
(70, 'iainga', 'dc94b1f65dde89a53385c6b70fc82f2e', 1),
(71, 'vajaramillo', 'c0ad94a5d1c847bc6a318d4a0a5ff5be', 1),
(72, 'rajumbo', '3d7d64c20a7b42c53f29874c8bc3b51a', 1),
(73, 'cajumbo', 'a3653eafb0c3e8f5699191f4fbee528e', 1),
(74, 'jpjumbo', 'f5bbefa9a0410952f962020e4caa861e', 1),
(75, 'jalabanda', 'e3966cf15336d48a4e49bfdef4219511', 1),
(76, 'crlabanda', '6c3825542150e57bc584b58c4434970a', 1),
(77, 'eflalangui', '39e000b30055feed774935a0ec988317', 1),
(78, 'jalapo', '86fc2d925fc9e12a5768a05c457f0fb0', 1),
(79, 'ralivisaca', 'ca39701cd11ba69b6e0a68e2f3813f92', 1),
(80, 'lf	lima', 'd2fe85748ffea27d124756ded1d9f378', 1),
(81, 'ja	lima', '208e32f5ce7e6a6fc735ff56a675cebb', 1),
(82, 'ma	lozano', 'eca1cac1ac3118c2ed4a7b88b01aa013', 1),
(83, 'aelojan', 'b57c4943dfa3a1930b5382857ff4de28', 1),
(84, 'cglojan', '67d4814ff9493e67308467ee743d063d', 1),
(85, 'rdlozano', '667c22b4db866dab30187eef10ead486', 1),
(86, 'pgmacas', '2cc331916e222d43ba9ea59a89a9d3c9', 1),
(87, 'dmmarizaca', 'db59dc98f8aab65727838b4b9ee7b756', 1),
(88, 'jlmaza', '5ddfce85e9f60822e1e6d0df2b8baec7', 1),
(89, 'iamaza', '311a5dbbe4a03ec2b8a72de0505efe96', 1),
(90, 'camedina', '20fb7122eec486d3b77a01f7b945c1e9', 1),
(91, 'olmendez', 'a15f53cf8c71d9b76a2ab7045a026a14', 1),
(92, 'samendoza', 'ff3d83591b19bb16076694b13b11af7c', 1),
(93, 'aamerino', '1d7ce8ef9b7b07a91e872ccb72cd3a50', 1),
(94, 'laminga', 'ad3a4a76c7515b8388d7764b8f21415d', 1),
(95, 'ldmontalvan', 'e3562e594b8d013898094cdc233dd7f0', 1),
(96, 'yamontaño', '4b809f0f00aebd52299e3e9d691c6c79', 1),
(97, 'wamontaño', 'cccdf1cf5ff5972276d0a759c39a32ac', 1),
(98, 'pdmontaño', '6bea82094b234a58a5e4d499049eb2ef', 1),
(99, 'jrmontaño', '09dbbcc70cfae15c51eff0def7678cf4', 1),
(100, 'acmorales', '6da261ccffddda5982d970ff7318e378', 1),
(101, 'remorocho', '30316ab5f6bab92ea685cce76c0ccc9c', 1),
(102, 'dimorocho', '9f98c3203835c0ecab0742375021697d', 1),
(103, 'je	morocho', '4e426de0f98696ab94a9c904fb7ceaf7', 1),
(104, 'mdmuñoz', 'fa42421e7ee9251638ec57ca674a0a9c', 1),
(105, 'dmmurquincho', 'ebed5faa5f6e8c445cec50e3d7ddc708', 1),
(106, 'bdmurquincho', '9cd97388dc485e5e0426404331a37047', 1),
(107, 'cjochoa', 'abd458ee6b249c42f0d3c792cae26c51', 1),
(108, 'smochoa', '4a9ada71f1443ed660108872f275e799', 1),
(109, 'emordoñez', '27c9f57fc16b2a10684d2f164f82be30', 1),
(110, 'jdordoñez', '3a1415aa727ddd2a70b9dfd8aa464323', 1),
(111, 'adordoñez', '7b13227e77cf9ae8558532d7c7f46b52', 1),
(112, 'jsorellana', 'e1012d5659f8f115c11633eae3d6f081', 1),
(113, 'aiortega', '4224f5c384284558ba8c19cca702b36e', 1),
(114, 'kg	ortega', '877f08e6362c42980d5710b2f7e5d2bb', 1),
(115, 'raortega', '25a725095c70a29995d657b6c475135a', 1),
(116, 'napacheco', '43417de2a5f504edcaecba024fa69055', 1),
(117, 'dapaladines', '93d73b90f4f47db1811b420726396c34', 1),
(118, 'jmpasaca', 'd7a4309d781bcad96279d8c5f8d38c91', 1),
(119, 'bjpaza', '6d56b954d477dc8fb1584dbbbdb27d57', 1),
(120, 'bapeña', '71804e842e5103ac8ad111107a02f71d', 1),
(121, 'jdpijuana', '090b9e4758f61e98711dcfdc376b96e5', 1),
(122, 'japinta', '3299c144931be8989571fcd6b9224cd6', 1),
(123, 'jd	pinta', '523b1a8945ba4d1bcc7fa81161c50c1b', 1),
(124, 'daponce', '4da13a2f0e082ff37b4f86f8874f1384', 1),
(125, 'dspuchaicela', '03af9ea822eaa168440a5d5253d0e438', 1),
(126, 'yhpuglla', 'cfa780a4cd9e615e231177f57901b6d3', 1),
(127, 'vdpullaguari', 'bbf1e5383a52e6015830647566908fc0', 1),
(128, 'cdquezada', '0b656baa64ed9b3b6b65b3c3c0fc8ef1', 1),
(129, 'adquichimbo', '3bba176a615684de19077c9de0c9d9d0', 1),
(130, 'kaquinaucho', '011e259e58501e90e68f2a59b595401e', 1),
(131, 'jsquituizaca', '6890ff5a84865a53ef67fdbd510de7e1', 1),
(132, 'jaquizhpe', 'd3666acc9d2ab71409bfe8db5a1821e9', 1),
(133, 'jaquizhpe', 'c0458fec0aaaed63bcd863eca3f59813', 1),
(134, 'waramirez', 'fab4f882b08e640f652bcee7766c3dfd', 1),
(135, 'ldramon', '1a72411cc187812e149d27172c58f273', 1),
(136, 'cjramos', 'dce164aad27fd6c848b55056d18855ac', 1),
(137, 'sdramos', 'b1ede52dc861bde5a488f44c1ea5522e', 1),
(138, 'pareyes', '371ba78c589d162c73c8627b21470fcf', 1),
(139, 'mdrios', '1ff85f7451b38779ac442821f00bb9b7', 1),
(140, 'karivera', '066ea8ebdb23c2dca30f3708b199439c', 1),
(141, 'djrivera', '0f919afb49da3cd4e84407ba12553b6c', 1),
(142, 'jdrodriguez', '8f6e7435eb29d5cfe59afc7c7cc10906', 1),
(143, 'darodriguez', '543c7b7465e3d16186307493194b9ca9', 1),
(144, 'darodriguez', 'd1789d41fe795b64e5fd949f05774105', 1),
(145, 'ga	rojas', '8b1ece9eac3d7962a34ccb84dc42e136', 1),
(146, 'jj	roma', '8b9a94337d4b15960b8ed1caea3c052e', 1),
(147, 'jdrojas', '5c387a7e992760d27299401882f0c3f4', 1),
(148, 'jlrueda', 'f88105b5d83922ee9bde55a1304b357c', 1),
(149, 'jasaltos', '0d2ef8b61ecb127cb2e307ee4a1e5079', 1),
(150, 'dm	saca', '303666e0e4a78cac85a9c3709b951380', 1),
(151, 'ba	silva', '245bf8a07aebe69bed05cdcc9f49ac8b', 1),
(152, 'da	sinchire', '3924838b9fb30b968d6f0a20ae2ecd5f', 1),
(153, 'emsanchez', '22be6cf8ac35ec00f6cdad060c1cf2d6', 1),
(154, 'edsanmartin', '94488cfb7df370a0c8604ca322f4a5ef', 1),
(155, 'ajsarmiento', 'c074fdd9009bf1a73a22ff4ff8d99367', 1),
(156, 'avsoto', '65613f4c31c21232cefe8fea7e68a45a', 1),
(157, 'dataday', '309a89835441841e47078e1a1c842f00', 1),
(158, 'lftorres', 'cbfaf0f42d535f2dec65700384414c62', 1),
(159, 'datorres', 'c587ecd20aa433a495fb03bddea81e7d', 1),
(160, 'cmtorres', 'd87529263e6a830999dbc71c1aef6cbb', 1),
(161, 'jmtriana', '75a3628c6a9b59e0a7a0d3678a335c12', 1),
(162, 'datucto', '82de8a28e76652076ae82ead2112c690', 1),
(163, 'dsuyaguari', 'c0251cd8133fdaa39d1898f4d16d789e', 1),
(164, 'mgvalarezo', '4dd6e35d480946a18a8a1b87d3edb371', 1),
(165, 'esvallejo', '3a8875eb35b487b2fa40a25de7d69656', 1),
(166, 'jgvalverde', '957386c2f205b40cd3724839cf3e5a68', 1),
(167, 'javasquez', 'da6f2c83d8aad16858303c8f3279c2c7', 1),
(168, 'evvega', '22802aa23d0fb27544c2a20afe86b870', 1),
(169, 'jmvelez', '1a0a39e10f9f1a43ede779aa4ca5fe78', 1),
(170, 'kmyangari', 'a1eaa97fbd96429f943e528eeef974ef', 1),
(171, 'rsyanza', 'fcd0484a9bee9d096e5f42fcd86923e9', 1),
(172, 'jszevallos', 'b04e01dee3aede3293b3f340500748b4', 1),
(173, 'jszumba', '7fd6d64ed41f91eadc792066c2cbc53b', 2),
(174, 'ysmarin', '3659ec992d6725fee6b35abd68154af2', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avances`
--
ALTER TABLE `avances`
  ADD PRIMARY KEY (`idAvance`),
  ADD KEY `fk_estudiante_av` (`idEstudiante`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`idCalificacion`),
  ADD KEY `fk_estudiante_c` (`idEstudianteC`);

--
-- Indices de la tabla `criterios`
--
ALTER TABLE `criterios`
  ADD PRIMARY KEY (`idCriterio`),
  ADD KEY `fk_docente_cr` (`idDocente`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`Cod_docente`),
  ADD KEY `fk_docente_usr` (`idUsuarioD`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`CodEst`),
  ADD KEY `fk_estudiante_usr` (`idUsuario`);

--
-- Indices de la tabla `listaestudiantes`
--
ALTER TABLE `listaestudiantes`
  ADD PRIMARY KEY (`idListaEstudiantes`),
  ADD KEY `fk_estudiante_list` (`fkEstudiantes`),
  ADD KEY `fk_docente_list` (`fkDocente`),
  ADD KEY `fk_proyecto` (`fkProyectoe`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`idNotas`),
  ADD KEY `fkAvanceN` (`idAvanceFKN`);

--
-- Indices de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD PRIMARY KEY (`idObservacion`),
  ADD KEY `FkAvance` (`idAvanceFKO`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id_proyecto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avances`
--
ALTER TABLE `avances`
  MODIFY `idAvance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1381;

--
-- AUTO_INCREMENT de la tabla `criterios`
--
ALTER TABLE `criterios`
  MODIFY `idCriterio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `listaestudiantes`
--
ALTER TABLE `listaestudiantes`
  MODIFY `idListaEstudiantes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `idNotas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  MODIFY `idObservacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `fk_estudiante_c` FOREIGN KEY (`idEstudianteC`) REFERENCES `estudiantes` (`CodEst`);

--
-- Filtros para la tabla `criterios`
--
ALTER TABLE `criterios`
  ADD CONSTRAINT `fk_docente_cr` FOREIGN KEY (`idDocente`) REFERENCES `docente` (`Cod_docente`);

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `fk_docente_usr` FOREIGN KEY (`idUsuarioD`) REFERENCES `usuarios` (`idUsuarios`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `usuario_fk_es` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuarios`);

--
-- Filtros para la tabla `listaestudiantes`
--
ALTER TABLE `listaestudiantes`
  ADD CONSTRAINT `fk_docente_list` FOREIGN KEY (`fkDocente`) REFERENCES `docente` (`Cod_docente`),
  ADD CONSTRAINT `fk_estudiante_list` FOREIGN KEY (`fkEstudiantes`) REFERENCES `estudiantes` (`CodEst`),
  ADD CONSTRAINT `fk_proyecto` FOREIGN KEY (`fkProyectoe`) REFERENCES `proyecto` (`id_proyecto`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fkAvanceN` FOREIGN KEY (`idAvanceFKN`) REFERENCES `avances` (`idAvance`);

--
-- Filtros para la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD CONSTRAINT `FkAvance` FOREIGN KEY (`idAvanceFKO`) REFERENCES `avances` (`idAvance`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
