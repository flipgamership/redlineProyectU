-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2021 a las 22:57:44
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectredline`
--
CREATE DATABASE IF NOT EXISTS `proyectredline` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyectredline`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumibles`
--

DROP TABLE IF EXISTS `consumibles`;
CREATE TABLE `consumibles` (
  `id` int(11) NOT NULL,
  `id_consumibles` varchar(100) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cantidad_min` int(11) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  `precio_unidad` int(11) NOT NULL,
  `tipo_unidad` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `consumibles`
--

INSERT INTO `consumibles` (`id`, `id_consumibles`, `nombre`, `cantidad`, `cantidad_min`, `precio_compra`, `precio_unidad`, `tipo_unidad`) VALUES
(1, 'GUL73', 'ENGANCHES ADECIBOS', 4000, 1000, 400000, 100, 'U'),
(2, 'GUL72', 'UNFTS', 300, 222, 30000, 100, 'P'),
(3, 'GUL71', 'rj45', 598, 598, 49834, 83, 'U'),
(4, 'GUL70', 'cable utp', 6000, 1, 200000, 33, 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuadrillas`
--

DROP TABLE IF EXISTS `cuadrillas`;
CREATE TABLE `cuadrillas` (
  `id` int(11) NOT NULL,
  `miembro` varchar(500) NOT NULL,
  `correo` varchar(500) NOT NULL,
  `cc` varchar(50) NOT NULL,
  `celular` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuadrillas`
--

INSERT INTO `cuadrillas` (`id`, `miembro`, `correo`, `cc`, `celular`) VALUES
(1, 'Alejandro duque', 'alejodc412@gmail.com', '1216727457', '3022835914'),
(2, 'Juan Sebastian Tafur Obando', 'justo2103@gmail.com', '1036965340', '3196534409'),
(3, 'Juan Pablo Castaño Díaz', 'jcastanodiaz1@gmail.com', '1144075543', '3164215281'),
(4, 'VICTOR MANUEL FLOREZ O', 'drummy8@gmail.com', '1054548015', '3217762749'),
(5, 'sebastian hernandez botero', 'shb.2196@gmail.com', '1035918988', '3008373001'),
(6, 'Juan felipe correa rios', 'thefelipegamer7@gmail.com', '1001724660', '3003044512'),
(999999999, 'Bodega', 'redline@redline.com', '0000000000', '0000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

DROP TABLE IF EXISTS `dispositivos`;
CREATE TABLE `dispositivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `tipo_dispositivo` varchar(500) NOT NULL,
  `estado` varchar(500) NOT NULL,
  `mac` varchar(500) NOT NULL,
  `cereal` varchar(500) NOT NULL,
  `fecha` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dispositivos`
--

INSERT INTO `dispositivos` (`id`, `nombre`, `tipo_dispositivo`, `estado`, `mac`, `cereal`, `fecha`) VALUES
(1, 'router tplink', 'ROUTER', 'N', '61286918227', '81682686272', '2021-11-19'),
(2, 'ont zte', 'ONT', 'N', '1002836526612231', '299265618816566661', '2021-11-18'),
(4, 'antena', 'ANTENA', 'N', '1527517277157517', '1296719327197', '2021-11-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos_vendidos`
--

DROP TABLE IF EXISTS `dispositivos_vendidos`;
CREATE TABLE `dispositivos_vendidos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `tipo_dispositivo` varchar(500) NOT NULL,
  `fecha` varchar(500) NOT NULL,
  `mac` varchar(500) NOT NULL,
  `cereal` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dispositivos_vendidos`
--

INSERT INTO `dispositivos_vendidos` (`id`, `nombre`, `tipo_dispositivo`, `fecha`, `mac`, `cereal`) VALUES
(1, 'router board x8 port', 'ROUTERBOARD', '2021-11-22', '124612642213331', '6273676726188162');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_seguridad`
--

DROP TABLE IF EXISTS `equipo_seguridad`;
CREATE TABLE `equipo_seguridad` (
  `id` varchar(500) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `img` varchar(500) NOT NULL,
  `estado` varchar(500) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `fecha` varchar(500) NOT NULL,
  `id_tecnico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

DROP TABLE IF EXISTS `herramienta`;
CREATE TABLE `herramienta` (
  `codigo_herramienta` varchar(500) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `img` varchar(1000) NOT NULL,
  `estado` varchar(500) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `fecha` varchar(500) NOT NULL,
  `id_tecnico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`codigo_herramienta`, `nombre`, `img`, `estado`, `descripcion`, `fecha`, `id_tecnico`) VALUES
('HRL04', 'pueba bot', 'f001a4f7-e453-4853-a538-4dd068f08f3f.jpg', 'B', '', '2021-11-12', 999999999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_inventario_consumibles`
--

DROP TABLE IF EXISTS `logs_inventario_consumibles`;
CREATE TABLE `logs_inventario_consumibles` (
  `id` int(11) NOT NULL,
  `id_consumibles` varchar(500) NOT NULL,
  `objeto` varchar(500) NOT NULL,
  `fecha` varchar(500) NOT NULL,
  `cantidad_anterior` int(11) NOT NULL,
  `cantidad_actual` int(11) NOT NULL,
  `cantidad_nueva_ingresada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `logs_inventario_consumibles`
--

INSERT INTO `logs_inventario_consumibles` (`id`, `id_consumibles`, `objeto`, `fecha`, `cantidad_anterior`, `cantidad_actual`, `cantidad_nueva_ingresada`) VALUES
(6, 'GUL70', 'cable utp ', '2021-03-22', 10000, 12000, 2000),
(7, 'GUL72', 'UNFTS ', '2021-10-01', 160000, 210000, 5000),
(8, 'GUL71', 'rj45 ', '2021-09-01', 2000, 7000, 5000),
(9, 'GUL70', 'cable utp ', '2021-10-14', 12000, 14000, 2000),
(10, 'GUL71', 'rj45 ', '2021-10-14', 7000, 7009, 9),
(11, 'GUL73', 'ENGANCHES ADECIBOS', '2021-05-11', 2000, 2000, 2000),
(12, 'GUL73', 'ENGANCHES ADECIBOS ', '2021-10-15', 2000, 4000, 2000),
(13, 'GUL72', 'UNFTS ', '2021-10-15', 200, 3200, 3000),
(14, 'gul03', 'sunchadora amarilla', '2021-10-29', 75, 75, 75),
(15, 'GUL70', 'cable utp ', '2021-11-02', 0, 6000, 6000),
(16, 'GUL71', 'rj45 ', '2021-11-02', 0, 600, 600),
(17, 'GUL72', 'UNFTS ', '2021-11-02', 0, 300, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_inventario_consumibles_2`
--

DROP TABLE IF EXISTS `logs_inventario_consumibles_2`;
CREATE TABLE `logs_inventario_consumibles_2` (
  `id` int(11) NOT NULL,
  `id_consumibles` varchar(500) NOT NULL,
  `objeto` varchar(500) NOT NULL,
  `fecha` varchar(500) NOT NULL,
  `cantidad_anterior` int(11) NOT NULL,
  `cantidad_actual` int(11) NOT NULL,
  `cantidad_retirada` int(11) NOT NULL,
  `precio_total_antes` int(11) NOT NULL,
  `precio_total_despues` int(11) NOT NULL,
  `precio_gasto` int(11) NOT NULL,
  `quien_retiro` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `logs_inventario_consumibles_2`
--

INSERT INTO `logs_inventario_consumibles_2` (`id`, `id_consumibles`, `objeto`, `fecha`, `cantidad_anterior`, `cantidad_actual`, `cantidad_retirada`, `precio_total_antes`, `precio_total_despues`, `precio_gasto`, `quien_retiro`) VALUES
(1, 'GUL71', 'rj45 ', '2021-10-15', 8000, 7000, 1000, 500000, 437000, 63000, 'juan felipe correa'),
(2, 'GUL70', 'cable utp ', '2021-10-15', 14000, 10000, 4000, 400000, 284000, 116000, 'juan felipe correa'),
(3, 'GUL70', 'cable utp ', '2021-10-26', 1, 0, 1, 1, 0, 1, 'juan felipe correa'),
(4, 'GUL72', 'UNFTS ', '2021-11-02', 3200, 3180, 20, 1120000, 1113000, 7000, 'juan felipe correa'),
(5, 'GUL72', 'UNFTS ', '2021-11-02', 3180, 0, 3180, 1113000, 0, 1113000, 'juan felipe correa'),
(6, 'GUL71', 'rj45 ', '2021-11-02', 600, 599, 1, 50000, 49917, 83, 'juan felipe correa'),
(7, 'GUL71', 'rj45 ', '2021-11-02', 599, 598, 1, 49917, 49834, 83, 'juan felipe correa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_inventario_equipo_seguridad`
--

DROP TABLE IF EXISTS `logs_inventario_equipo_seguridad`;
CREATE TABLE `logs_inventario_equipo_seguridad` (
  `id` int(11) NOT NULL,
  `id_equipo_seguridad` varchar(500) NOT NULL,
  `equipo_seguridad` varchar(500) NOT NULL,
  `descripción_reportada` varchar(2000) NOT NULL,
  `fecha` varchar(500) NOT NULL,
  `tecnico` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `logs_inventario_equipo_seguridad`
--

INSERT INTO `logs_inventario_equipo_seguridad` (`id`, `id_equipo_seguridad`, `equipo_seguridad`, `descripción_reportada`, `fecha`, `tecnico`) VALUES
(1, 'EQ01', 'ARNES', 'nueva', '2021-11-04', '1'),
(2, 'EQ01', 'ARNES GRANDE ', 'nueva', '2021-11-04', '1'),
(3, 'EQ01', 'ARNES GRANDE ', 'nueva', '2021-11-04', '6'),
(4, 'EQ01', 'ARNES GRANDE ', 'en muy buen estado', '2021-11-05', '1'),
(5, 'EQ01', 'ARNES GRANDE ', 'en buen estado algo desgastada', '2021-11-05', '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_inventario_herramientas`
--

DROP TABLE IF EXISTS `logs_inventario_herramientas`;
CREATE TABLE `logs_inventario_herramientas` (
  `id` int(11) NOT NULL,
  `id_herramienta` varchar(500) NOT NULL,
  `herramienta` varchar(500) NOT NULL,
  `descripción_reportada` varchar(2000) NOT NULL,
  `fecha` varchar(500) NOT NULL,
  `tecnico` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `logs_inventario_herramientas`
--

INSERT INTO `logs_inventario_herramientas` (`id`, `id_herramienta`, `herramienta`, `descripción_reportada`, `fecha`, `tecnico`) VALUES
(8, 'HRL04', 'GANCHO DOBLADOR ELECTRICO PARA HACERO', 'en buen estado algo desgastada', '2021-10-26', '1000000000'),
(9, 'EQ01', 'ARNES GRANDE ', 'en muy buen estado', '2021-11-05', '6'),
(10, 'EQ01', 'ARNES GRANDE ', 'en buen estado algo desgastada', '2021-11-05', '6'),
(11, 'HRL04', 'pueba bot', '', '2021-11-12', '6'),
(12, 'HRL04', 'pueba bot', '', '2021-11-12', '1'),
(13, 'HRL04', 'pueba bot', '', '2021-11-12', '1'),
(14, 'HRL04', 'pueba bot', '', '2021-11-12', '2'),
(15, 'HRL04', 'pueba bot', '', '2021-11-12', '2'),
(16, 'HRL04', 'pueba bot', '', '2021-11-12', '3'),
(17, 'HRL04', 'pueba bot', '', '2021-11-12', '3'),
(18, 'HRL04', 'pueba bot', '', '2021-11-12', '4'),
(19, 'HRL04', 'pueba bot', '', '2021-11-12', '4'),
(20, 'HRL04', 'pueba bot', '', '2021-11-12', '5'),
(21, 'HRL04', 'pueba bot', '', '2021-11-12', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_oficina`
--

DROP TABLE IF EXISTS `personal_oficina`;
CREATE TABLE `personal_oficina` (
  `id` int(11) NOT NULL,
  `miembro` varchar(500) NOT NULL,
  `correo` varchar(500) NOT NULL,
  `cc` varchar(50) NOT NULL,
  `celular` varchar(50) NOT NULL,
  `actividad_dentro_de_la_empresa` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal_oficina`
--

INSERT INTO `personal_oficina` (`id`, `miembro`, `correo`, `cc`, `celular`, `actividad_dentro_de_la_empresa`) VALUES
(1, 'Laura Quirós Cano', 'quiroscanolaura@gmail.com', '1042456999', '3008645381', 'quiroscanolaura@gmail.com'),
(2, 'Maria Alejandra Vasquez ossa', 'cartera.redline@gmail.com', '1035916276', '3137380529', 'Cartera'),
(3, 'Leidy Johana Alzate Velasquez', 'secretariaredline@gmail.com', '1035911642', '3207354611', 'Auxiliar administrativa y servicio al cliente'),
(4, 'Claudia Patricia Navarro Castillo', 'patiii0429@gmail.com', '1095922695', '3114720894', 'Aux administrativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telemercadeoclientes`
--

DROP TABLE IF EXISTS `telemercadeoclientes`;
CREATE TABLE `telemercadeoclientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `cedula` varchar(500) NOT NULL,
  `telefono` varchar(500) NOT NULL,
  `plan` varchar(500) NOT NULL,
  `estado` varchar(500) NOT NULL,
  `estado_contrato` varchar(500) NOT NULL,
  `estadoLLamada` varchar(500) NOT NULL,
  `tipificacion` varchar(500) NOT NULL,
  `observaciones` varchar(2000) NOT NULL,
  `ip` varchar(500) NOT NULL,
  `direccion` varchar(500) NOT NULL,
  `coordenadas` varchar(500) NOT NULL,
  `router` varchar(500) NOT NULL,
  `mac` varchar(100) NOT NULL,
  `seguimiento` varchar(500) NOT NULL,
  `sectorial` varchar(100) NOT NULL,
  `observaciones_seguimiento` varchar(2000) NOT NULL,
  `fecha_instalación` varchar(200) NOT NULL,
  `precio_plan` int(11) NOT NULL,
  `pendiente_pago` varchar(100) NOT NULL,
  `ultima_factura` varchar(50) NOT NULL,
  `estado_factura` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `telemercadeoclientes`
--

INSERT INTO `telemercadeoclientes` (`id`, `nombre`, `cedula`, `telefono`, `plan`, `estado`, `estado_contrato`, `estadoLLamada`, `tipificacion`, `observaciones`, `ip`, `direccion`, `coordenadas`, `router`, `mac`, `seguimiento`, `sectorial`, `observaciones_seguimiento`, `fecha_instalación`, `precio_plan`, `pendiente_pago`, `ultima_factura`, `estado_factura`) VALUES
(1, 'Eliana Cristina Rios Jimenez', '1035913239', '3144288996', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.66', 'Vereda la Clara', '6.2651544,-75.4265094', 'ROUTER FIBRA FTTH 01/05', '60:7E:CD:34:D2:22', '', '', '', '20/09/2021', 80000, '1Pago, $29400.00', '#11992 - 01/10/2021', 'Pendiente de Pago'),
(2, 'Nohemy Estela Botero Gallego', '43210630', '3104355509', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.67', 'Vereda Monta¤ez hacia arriba de la sede acci¢n comunal', '6.2984908,-75.4387012', 'ROUTER FIBRA FTTH 01/05', '60:7E:CD:34:64:F4', '', '', '', '20/09/2021', 70000, '1Pago, $25700.00', '#11991 - 01/10/2021', 'Pendiente de Pago'),
(3, 'Fabio Hernan Serna Mayorga', '71680883', '3014251325', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.65', 'Vereda Monta¤ez, Finca los Geranios', '6.296215534210205,-75.44007110595703', 'ROUTER FIBRA FTTH 01/05 + IVA', '60:7E:CD:34:D1:EE', '', '', '', '20/09/2021', 80000, '1Pago, $34900.00', '#11989 - 01/10/2021', 'Pendiente de Pago'),
(4, 'Adriana Maria Gomez Lezcano', '39443007', '3014601530', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.59', 'Cra 52 Nø 44 34 Int 301, Barrio San Francisco', '6.276361,-75.4408966', 'ROUTER FIBRA FTTH 01/05', '60:7E:CD:34:65:AA', '', '', '', '15/09/2021', 80000, '', '', 'Pagadas'),
(5, 'Juan Pablo Ponce Franco', '98668633', '3127310205', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.32.55', 'Vereda la Enea', '', 'PCQ Facturacion 01/05 Yolombal', 'B8:69:F4:5F:51:1F', '', 'GUYO5', '', '15/09/2021', 135000, '2Pagos, $272000.00', '#11988 - 01/10/2021', 'Pendiente de Pago'),
(6, 'GRUPO NETHEXA SAS', '900347152', '3007042027', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.58', 'Vereda La Clara', '6.265140533447266,-75.4334487915039', 'ROUTER FIBRA FTTH 15/20 + IVA', '60:7E:CD:34:C1:FC', '', '', '', '15/09/2021', 90000, '', '', 'Pagadas'),
(7, 'Licinia Isabel Gutierrez Herrera', '32315781', '3004410067', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.57', 'Vereda La clara parte baja', '6.261617,-75.4341048', 'ROUTER FIBRA FTTH 15/20 + IVA', '60:7E:CD:34:65:B7', '', '', '', '14/09/2021', 80000, '', '', 'Pagadas'),
(8, 'Carlos Gustavo Rengifo Arias', '71766669', '3218524112', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.55', 'Vereda la Clara, Finca No 2 (La Sierra)', '6.2618498,-75.4339303', 'ROUTER FIBRA FTTH 15/20', '60:7E:CD:34:E6:B3', '', '', '', '14/09/2021', 80000, '', '', 'Pagadas'),
(9, 'Jose Alejandro Rua Espinoza', '70756042', '3205772944, 3136570300', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.56', 'Vereda Monta¤ez parte alta', '6.2961999,-75.4353647', 'ROUTER FIBRA FTTH 01/05', '60:7E:CD:34:95:59', '', '', '', '13/09/2021', 70000, '1Pago, $42000.00', '#11685 - 01/10/2021', 'Pendiente de Pago'),
(10, 'Anderson Felipe Ballesteros Taborda', '1056784115', '3214651464, 3206673925', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.54', 'Vereda El Aguacate', '6.2918972,-75.4358142', 'ROUTER FIBRA FTTH 01/05', '60:7E:CD:34:8A:AF', '', '', '', '11/09/2021', 70000, '1Pago, $46700.00', '#11682 - 01/10/2021', 'Pendiente de Pago'),
(11, 'Jose Esneider Pati¤o Rojas', '70754464', '3218025793', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.52', 'Cll 49 Nø 46 96 Arriba de Las Acacias', '6.2818779945373535,-75.43799591064453', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '10/09/2021', 80000, '', '', 'Pagadas'),
(12, 'Luisa Fernanda S nchez Ceballos', '1035911383', '3007926769', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.53', 'Barrio San Francisco', '6.2788936,-75.441765', 'ROUTER FIBRA FTTH 15/20', '10:D0:AB:27:7B:BD', '', '', '', '10/09/2021', 80000, '', '', 'Pagadas'),
(13, 'Diego Felipe Ramirez Vegara', '1104706331', '3225227765', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.12.25', 'Vereda San Jose K.m 0.400', '6.2504271,-75.4317952', 'PCQ Facturacion 15/20 Organo', '6C:3B:6D:03:A7:47', '', 'GUGU', '', '10/09/2021', 70000, '1Pago, $11700.00', '#11684 - 15/09/2021', 'Pendiente de Pago'),
(14, 'Sandra Milena Gallego Ruiz', '43211685', '3117230316', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.51', 'San Antonio parte Alta sector morro seco, finca San Judas Tadeo', '6.2755538,-75.4360586', 'ROUTER FIBRA FTTH 15/20', '9C:6F:52:D6:4B:8A', '', '', '', '9/09/2021', 70000, '1Pago, $14000.00', '#11669 - 15/09/2021', 'Pendiente de Pago'),
(15, 'Maria Elena Herrera Rua', '42751712', '3107909378, 3137111205', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.49', 'Vereda Monta¤ez parte ALta', '6.2970393,-75.4363341', 'ROUTER FIBRA FTTH 15/20', '9C:6F:52:BD:54:87', '', '', '', '9/09/2021', 100000, '1Pago, $20000.00', '#11667 - 15/09/2021', 'Pendiente de Pago'),
(16, 'Ivan Dario Zapata Osorio', '71587535', '3195022172', 'PLAN 06 MEGAS PCQ IVAN DARIO ZAPATA', '', 'Activo', '', '', '', '172.30.25.222', 'Vereda La Clara', '6.270795,-75.418772', 'PCQ Facturacion 01/05 Chorrera', '74:4D:28:4E:04:35', '', 'GUCHO', '', '9/09/2021', 20000, '', '', 'Pagadas'),
(17, 'Manuela Valentina Alvarez Zapata', '1001416305', '3126006374', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.50', 'Vereda Monta¤ez parte Alta', '6.2963686,-75.4357809', 'ROUTER FIBRA FTTH 01/05', '9C:6F:52:7E:9C:D1', '', '', '', '8/09/2021', 70000, '1Pago, $53700.00', '#11666 - 01/10/2021', 'Pagadas'),
(18, 'Maria Cristina Jaramillo Cardona', '1035913406', '3116281143', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.48', 'CR 52 CL 47 82 interior 401', '6.2778746,-75.4425944', 'ROUTER FIBRA FTTH 01/05', '9C:6F:52:39:31:A7', '', '', '', '7/09/2021', 70000, '', '', 'Pagadas'),
(19, 'Julian David Gomez Ardila', '1037634837', '3043283779, 3007468634', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.47', 'Vereda El Aguacate', '6.2922186,-75.4355506', 'ROUTER FIBRA FTTH 01/05', '9C:6F:52:7C:61:A8', '', '', '', '7/09/2021', 70000, '1Pago, $56000.00', '#11659 - 01/10/2021', 'Pagadas'),
(20, 'Laura Marcela Marin Ramirez', '1017217712', '3147108419', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.46', 'Vereda Monta¤ez, Finca 98', '6.29440, -75.43532', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:25:4E', '', '', '', '6/09/2021', 80000, '1Pago, $66700.00', '#11658 - 01/10/2021', 'Pagadas'),
(21, 'Gerardo Jose Soto Olivares', '26036846', '3245273903, 3006839115', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.45', 'CLL 51 Nø51 78 (Apto 201)', '6.28028, -75.44418', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:33:EE', '', '', '', '6/09/2021', 100000, '', '', 'Pagadas'),
(22, 'Duvan Ferney Gaviria Saenz', '98595996', '3218525897', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.43', 'Vereda la Clara, Finca Vergel', '6.264594,-75.4296789', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:26:04', '', '', '', '3/09/2021', 80000, '1Pago, $74700.00', '#11655 - 01/10/2021', 'Pagadas'),
(23, 'Aide Ruiz Isaza', '1001445959', '3106409660', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.44', 'Vereda Monta¤ez, parte Alta', '6.2968421,-75.4358784', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:3E:64', '', '', '', '3/09/2021', 70000, '1Pago, $65400.00', '#11656 - 01/10/2021', 'Pagadas'),
(24, 'Sonia Soto Duque', '42757923', '3002111622', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.41', 'Vereda Monta¤ez, Caba¤a la Bohemia', '6.295154,-75.4349541', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:22:42', '', '', '', '1/09/2021', 80000, '', '', 'Pagadas'),
(25, 'AGS DISTRIBUCIONES SAS', '9 0 1 3 5 3 9 9 0', '3122530539, 3016550770', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.42', 'Calle 38 # 49-11 Barrio san Antonio', '6.27268, -75.43689', 'ROUTER FIBRA FTTH 15/20 + IVA', '84:3E:92:F9:36:E0', '', '', '', '1/09/2021', 70000, '', '', 'Pagadas'),
(26, 'Edison de Jesus Duque Bolivar', '71052097', '3024485736', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.31.33', 'Vereda Yolombal por el reversadero de las escaleras de yolombal.', '6.326909,-75.392729', 'PCQ Facturacion 15/20 Yolombal', '68:D7:9A:BC:9F:C5', '', 'GUYO4', '', '1/09/2021', 80000, '1Pago, $37400.00', '#11633 - 15/09/2021', 'Pendiente de Pago'),
(27, 'Arturo de Jesus Ospina Sanchez', '70754351', '3226355491', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.40', 'Cra 48 A Nø 45 43 Apt 402 Barrio San Francisco', '6.278045654296875,-75.4398422241211', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:37:EA', '', '', '', '31/08/2021', 80000, '', '', 'Pagadas'),
(28, 'Fabian Fuentes Campuzano', '1047504030', '3106012198', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.39', 'Cra 52-D # 35-26 Barrio San Francisco', '6.268784999847412,-75.43690490722656', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:38:32', '', '', '', '31/08/2021', 80000, '', '', 'Pagadas'),
(29, 'Maria Nelly Gomez Nore¤a', '21785410', '3216368907', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.38', 'Cra 50 Nø 51 07 Restaurante Viejo Balcon. Parque Principal', '6.28037,-75.44267', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:33:D4', '', '', '', '30/08/2021', 80000, '1Pago, $80000.00', '#11313 - 01/11/2021', 'Pendiente de Pago'),
(30, 'TRUCHAS BELMIRA SAS SAS', '800192049', '3148643661', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.111', 'Vereda Yolombal', '6.3172273,-75.4015903', 'PCQ Facturacion 01/05 +IVA Yolombal', '68:D7:9A:BC:A4:C4', '', 'GUYO1', '', '30/08/2021', 80000, '1Pago, $95200.00', '#11310 - 01/11/2021', 'Pagadas'),
(31, 'karina Jenneiffier Restrepo', '43454740', '3016818799', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.150', 'Vereda Yolombal, por la capilla', '6.321122,-75.398244', 'PCQ Facturacion 15/20 Yolombal', '68:D7:9A:BC:A0:3F', '', 'GUYO1', '', '30/08/2021', 80000, '', '', 'Pagadas'),
(32, 'Jose Santiago Ortiz Henao', '70751323', '3117893061, 3127455717', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.36', 'Vereda La Clara parte Alta, por Volteadero micros', '6.266754150390625,-75.4121322631836', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:36:C6', '', '', '', '27/08/2021', 70000, '', '', 'Pagadas'),
(33, 'PARTES INDUMOTRIZ S.A.S', '901155582', '3116281143', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.35', 'CR 52 CL 47 84', '6.2778829,-75.4426007', 'ROUTER FIBRA FTTH 01/05 + IVA', '84:3E:92:F9:37:07', '', '', '', '27/08/2021', 80000, '', '', 'Pagadas'),
(34, 'Rosalba Gonzalez Sanchez', '23894027', '3136446583, 3013854527', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.33.173', 'Vereda Canoas', '6.2225368,-75.4406303', 'PCQ Facturacion 15/20 Chorrera', '74:4D:28:42:CD:7B', '', 'GUCHO2', '', '27/08/2021', 70000, '', '', 'Pagadas'),
(35, 'Juan Pablo Franco Moreno', '1128418919', '3165396999', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.7.154', 'Vereda Canoas - sector la Mosquita', '6.226536,-75.446562', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:61:58:67', '', 'GUMO', '', '27/08/2021', 135000, '1Pago, $82800.00', '#11288 - 15/09/2021', 'Pendiente de Pago'),
(36, 'Ana Lucia Castro Jaramillo', '21785957', '3114251730', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.33', 'Carrera 48 # 40 A -84 Centro Plaza', '6.2758609,-75.4378154', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:39:29', '', '', '', '26/08/2021', 70000, '', '', 'Pagadas'),
(37, 'Jorge Humberto Posada Marin', '71640241', '3104332402', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.32', 'Vereda La Clara, parcelaci¢n los cisnes Lote 27A', '', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:37:D7', '', '', '', '26/08/2021', 90000, '', '', 'Pagadas'),
(38, 'John Jairo Bedoya Ospina', '3349994', '3126288288, 3116350440', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.12.88', 'Vereda Hojas Anchas', '6.234662,-75.416588', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FF:F2:05', '', 'GUGU', '', '26/08/2021', 135000, '', '', 'Pagadas'),
(39, 'CORPORACIàN DE ESTUDIANTES, TCNICOS, TECNOLOGOS Y PROFESI', '901299499', '3163517878, 3218751526', 'Plan 20 Megas', '', 'Gratis', '', '', '', '172.30.18.154', 'Vereda La Brizuela (Junta de acci¢n comunal)', '6.277989,-75.458150', 'PCQ Facturacion 01/05 +IVA Organo', 'B8:69:F4:94:27:CB', '', 'SAGUSE', '', '25/08/2021', 200000, '', '', 'Pagadas'),
(40, 'Carlos Eduardo Gutierrez Aguirre', '98557194', '3024560348', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.27', 'Calle 35 # 52B- 41 Barrio San Antonio cerca a la tienda los Cisnes', '6.268511772155762,-75.43648529052734', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:24:F3', '', '', '', '25/08/2021', 80000, '', '', 'Pagadas'),
(41, 'Adriana Lucia Montoya Hurtado', '43270492', '3016189898', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.30', 'Cra 48 # 48-41 apto 301 torres de Alfaguara torre 1 Guarne', '', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:38:18', '', '', '', '25/08/2021', 80000, '', '', 'Pagadas'),
(42, 'Yorleny Rodriguez Melendrez', '39286300', '3117257791', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.28', 'carrera 47A #50A-13 Maria Auxiliadora parte baja', '6.2815169,-75.4410433', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:37:BD', '', '', '', '24/08/2021', 70000, '', '', 'Pagadas'),
(43, 'Jose Ignacio Zapata Zapata', '70756557', '3145063370', '10 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.29', 'Cra 52 B Nø 33 521 Barrio San Antonio', '', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:37:6F', '', '', '', '24/08/2021', 60000, '', '', 'Pagadas'),
(44, 'Maria Fernanda Monsalve ¥ustes', '1035911004', '3002961325', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.26', 'Vereda el Aguacate', '6.2890202,-75.4363706', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:33:E1', '', '', '', '23/08/2021', 70000, '', '', 'Pagadas'),
(45, 'DE LA CRUZ CENTRO EMPRESARIAL Y DE NEGOCIOS SAS', '901389069', '3044341168', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.7.77', 'Vereda La Mosquita', '6.215299129486084,-75.43279266357422', 'PCQ Facturacion 01/05 +IVA Organo', 'B8:69:F4:FF:95:3F', '', 'GUMO', '', '23/08/2021', 55000, '', '', 'Pagadas'),
(46, 'Jose Guillermo Valencia Arcila', '71694303', '3006205091', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.25', 'Vereda La Clara, parcelaci¢n los cisnes, finca Nø5', '', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:1E:8D', '', '', '', '21/08/2021', 80000, '', '', 'Pagadas'),
(47, 'Bibiana Cristina Olaya Marin', '32354623', '3007902567', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.33.22', 'Vereda La Porquera Via San Vicente', '6.236102,-75.377305', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:61:55:97', '', 'GUCHO2', '', '20/08/2021', 110000, '', '', 'Pagadas'),
(48, 'Leydy Johanna Valencia Lopez', '1035913002', '3212600613', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.23', 'Vereda El Aguacate finca/ tienda mi chula', '6.291688503750307,-75.43647408485413', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:35:8E', '', '', '', '19/08/2021', 80000, '1Pago, $69700.00', '#11254 - 15/09/2021', 'Pagadas'),
(49, 'Sandra Milena Mu¤oz', '43873807', '3185172111', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.22', 'Vereda La Clara', '6.2641184,-75.4304001', 'ROUTER FIBRA FTTH 15/20 + IVA', '84:3E:92:F9:13:54', '', '', '', '19/08/2021', 100000, '1Pago, $103700.00', '#11253 - 15/09/2021', 'Pagadas'),
(50, 'Zonia Patricia Carmona Marin', '43793941', '3234027932', '10 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.21', 'Vereda El Aguacate', '6.292047023773193,-75.43579864501953', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:26:11', '', '', '', '18/08/2021', 60000, '', '', 'Pagadas'),
(51, 'INGEDEM SAS', '900971775', '3195314075', '150 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.19', 'Cra 53 N 33 190 Aut. Med-Bog', '6.2675078,-75.4374798', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:31:A5', '', '', '', '17/08/2021', 140000, '', '', 'Pagadas'),
(52, 'Yuliana Serrano Velasquez', '43212318', '3196369230', '10 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.28', 'Vereda Toldas', '6.279043,-75.441229', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '13/08/2021', 60000, '', '', 'Pagadas'),
(53, 'Mario Alberto Moscoso Valencia', '71789256', '3218785993', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.67', 'Vereda Yolombal', '6.3184099,-75.3974939', 'PCQ Facturacion 01/05 Yolombal', '78:8A:20:6A:AB:4D', '', 'GUYO1', '', '13/08/2021', 80000, '', '', 'Pagadas'),
(54, 'Juan Pablo Gutierrez Zapata', '1017127547', '3218365368', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.18', 'Vereda El Aguacate', '6.2927107,-75.4336772', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:33:93', '', '', '', '13/08/2021', 70000, '', '', 'Pagadas'),
(55, 'Jennifer Naranjo Gaviria', '1040730874', '3124245174', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.17', 'Cra 51 37 29 Barrio San Antonio', '6.2722812,-75.4371804', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:37:62', '', '', '', '13/08/2021', 80000, '', '', 'Pagadas'),
(56, 'Ana Maria Quintero Garces', '32244829', '3122060863', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.16', 'Vereda El Aguacate', '6.2916621,-75.4369545', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:37:96', '', '', '', '12/08/2021', 70000, '', '', 'Pagadas'),
(57, 'Luz Stella Velez Mesa', '42999153', '3117691131', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.15', 'Vereda El Aguacate', '6.292602062225342,-75.43626403808594', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:37:3B', '', '', '', '12/08/2021', 70000, '', '', 'Pagadas'),
(58, 'Maria Fernanda Rendon Hurtado', '1128451932', '3046080885', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.17.75', 'Vereda El Capiro\nFinca N 24', '6.07149076461792,-75.43160247802734', 'PCQ Facturacion 01/05 +IVA Organo', '48:8F:5A:ED:BF:CB', '', 'GUSU', '', '11/08/2021', 135000, '', '', 'Pagadas'),
(59, 'Maria Gilma Marin Garcia', '43424268', '3136014653', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.14', 'Vereda El Aguacate', '6.292047023773193,-75.43579864501953', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:38:25', '', '', '', '11/08/2021', 70000, '', '', 'Pagadas'),
(60, 'Juan David Zapata Herrera', '1000441038', '3145228972', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.11', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:38:80', '', '', '', '10/08/2021', 70000, '', '', 'Pagadas'),
(61, 'David Augusto Sanchez Florez', '1035919503', '3136091049', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.12', 'Sector la Caba¤a, Taller la 53, Aut. Med-Bog', '6.2889083,-75.4486388', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:33:C7', '', '', '', '10/08/2021', 90000, '1Pago, $90000.00', '#11740 - 15/09/2021', 'Pendiente de Pago'),
(62, 'Juan Camilo Gregory Correa', '70558713', '3105453213', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.10', 'Vereda Monta¤ez, Finca 55 A', '6.2977948,-75.4393902', 'ROUTER FIBRA FTTH 01/05 + IVA', '84:3E:92:F9:25:B6', '', '', '', '9/08/2021', 70000, '', '', 'Pagadas'),
(63, 'Luz Marina Manrique Naranjo', '22104395', '3192434089, 3147398531', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.81', 'Vereda El Aguacate', '6.2854949,-75.4385983', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '6/08/2021', 70000, '', '', 'Pagadas'),
(64, 'Eduardo Leon Gallego Cardona', '70752110', '3104945207', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.82', 'Carrera 52 # 47-134 (202), Barrio San Francisco', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '6/08/2021', 90000, '', '', 'Pagadas'),
(65, 'Diego Alexander Gallego Gallego', '70757195', '3207056783', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.80', 'Vereda Monta¤ez. Finca 56', '6.2980874,-75.4394103', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '6/08/2021', 70000, '1Pago, $70000.00', '#11745 - 15/09/2021', 'Pendiente de Pago'),
(66, 'Cindy Liceth Salazar Monroy', '1037578527', '3108939449, 3197849496', '300 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.79', 'Vereda La Mulona', '6.2938805,-75.4380955', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '5/08/2021', 200000, '', '', 'Pagadas'),
(67, 'NEGOCIOS Y CONSTRUCCIONES ORIENTE SAS', '900950411-4', '3108236148', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.78', 'Cll 51 Nø46 C 37, Barrio La Candelaria', '6.2932961,-75.4378485', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '5/08/2021', 70000, '', '', 'Pagadas'),
(68, 'Mariana Londo¤o Llano', '1007109956', '3016572347', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.77', 'Cra 50 # 48B Barrio San Francisco', '6.2784938,-75.4414694', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '5/08/2021', 100000, '', '', 'Pagadas'),
(69, 'Kevin Cosner Mendoza Zurita', '1003306936', '3142881678', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.85', 'Cra 48 49A 048 (201) Barrio La Candelaria', '6.2809333,-75.4409839', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '4/08/2021', 80000, '1Pago, $72300.00', '#11665 - 01/10/2021', 'Pagadas'),
(70, 'Tatiana Marcela Hoyos Arboleda', '21526514', '3137231926', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.76', 'Vereda El Aguacate', '6.2934254,-75.4348506', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '3/08/2021', 70000, '', '', 'Pagadas'),
(71, 'Argiro Duque Ochoa', '70754974', '3117326222', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.72', 'Vereda La Clara. Finca # 523', '6.2667467,-75.4138267', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '2/08/2021', 70000, '', '', 'Pagadas'),
(72, 'Luis Felipe Camargo Orozco', '71732727', '3165286666', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.70', 'Vereda La Clarita. Casa 239', '6.2660337,-75.4191178', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '2/08/2021', 80000, '', '', 'Pagadas'),
(73, 'Silvia Amanda Vanegas Cardona', '43048145', '3147587110', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.75', 'Vereda El Aguacate, al lado invernadero de c nnabis', '6.2916125,-75.4349344', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '2/08/2021', 70000, '', '', 'Pagadas'),
(74, 'Oscar Dario Giraldo Casta¤o', '15351096', '3137618626', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.74', 'Cra 48 # 44 32 interior 101, Centro Plaza', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '2/08/2021', 100000, '1Pago, $96800.00', '#11664 - 01/10/2021', 'Pagadas'),
(75, 'Julio Cesar Vasquez Palacio', '70052564', '3128802273', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.66', 'Condominio Monta¤ez, Vereda Monta¤ez', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '31/07/2021', 70000, '', '', 'Pagadas'),
(76, 'Gustavo Adolfo Mejia Restrepo', '98499411', '3117831637', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.59', 'Vereda Monta¤ez. Casa 41', '6.2976694,-75.4407082', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '30/07/2021', 80000, '1Pago, $80000.00', '#11753 - 15/09/2021', 'Pendiente de Pago'),
(77, 'Angela Maria Cardona Cardona', '51928046', '3116004698', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.27.78', 'Vereda La Mosquita Sector El Carmin', '6.206200,-75.431159', 'PCQ Facturacion 01/05 Chorrera', 'CC:2D:E0:F9:F7:21', '', 'GUCHOCA', '', '29/07/2021', 80000, '', '', 'Pagadas'),
(78, 'Gustavo Adolfo Sierra Velez', '71609042', '3173034839', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.57', 'Vereda Monta¤ez. AL lado del tigre', '6.2918976,-75.437851', 'ROUTER FIBRA FTTH 01/05', '94:02:6B:40:29:B0', '', '', '', '28/07/2021', 100000, '', '', 'Pagadas'),
(79, 'Myriam Cecilia Salgado Arce', '41602987', '3006083809', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.55', 'Vereda la Mulona', '6.2941459,-75.4386289', 'ROUTER FIBRA FTTH 01/05', '94:02:6B:40:2A:10', '', '', '', '27/07/2021', 80000, '', '', 'Pagadas'),
(81, 'Jose Hader Berrio Arriaga', '1017130572', '3137153738', 'Plan 10 Megas', '', 'Cancelado', '', '', '', '172.30.27.24', 'Vereda La Mosquita Cerca Al Restaurante La Cabalgata', '6.206336,-75.434782', 'PCQ Facturacion 15/20 Chorrera', 'CC:2D:E0:CF:EB:D9', '', 'GUCHOCA', '', '27/07/2021', 135000, '', '', 'Pagadas'),
(82, 'Miguel Antonio Rios Rios', '70751672', '3146826856', '10 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.53', 'Cll 50 #71-72, \"Muebles y Variedades\" Al frente de la defensa civil, Guarne', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '24/07/2021', 60000, '1Pago, $44000.00', '#11662 - 15/09/2021', 'Pendiente de Pago'),
(83, 'Luisa Fernanda Ospina Zuluaga', '39457153', '3108361880', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.12.77', 'Vereda La Mosquita Parte Alta', '6.216353,-75.453743', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:DB:11', '', 'GUGU', '', '24/07/2021', 55000, '', '', 'Pagadas'),
(84, 'Olga Catalina Salas Atencia', '1047428469', '3052891045', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.31', 'Vereda Hojas Anchas', '6.235518,-75.437321', 'Facturacion 15/20 Chorrera', '48:8F:5A:CC:2F:5B', '', 'GUCHO2', '', '23/07/2021', 80000, '1Pago, $61400.00', '#11661 - 15/09/2021', 'Pendiente de Pago'),
(85, 'Dora Maria Benjumea Gutierrez', '42898342', '3163619906', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.52', 'Vereda la Mulona finca 88', '', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '23/07/2021', 90000, '', '', 'Pagadas'),
(86, 'Andrea Carolina Echeverry Parra', '52623814', '3138517145', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.73', 'Vereda la Mulona Finca 93A', '', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '23/07/2021', 100000, '', '', 'Pagadas'),
(87, 'Rosalba de Jesus Rodriguez Atehortua', '43423211', '3105473586', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.40', 'Vereda el Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '94:02:6B:40:28:90', '', '', '', '22/07/2021', 70000, '', '', 'Pagadas'),
(88, 'Diana Lorena Henao Zapata', '1035913989', '3137722655', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.39', 'Vereda el Aguacate', '6.2851646,-75.4388306', 'ROUTER FIBRA FTTH 15/20', '94:02:6B:40:29:88', '', '', '', '22/07/2021', 80000, '', '', 'Pagadas'),
(89, 'Juan Fernando Mejia Zu¤iga', '76326343', '3193034087', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.38', 'Vereda El Aguacate Finca Villa Paula', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '21/07/2021', 90000, '', '', 'Pagadas'),
(90, 'Oscar Alberto Gonzalez Ramirez', '71620851', '3244155610', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.36', 'Vereda La Clara', '6.266547679901123,-75.41378784179688', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '21/07/2021', 90000, '', '', 'Pagadas'),
(91, 'CONSTRUCTORA A.P S.A.S', '901482137', '3137404346, 3217053888', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.17.19', 'KM 36 AUT MEDELLIN BOGOTA Vereda La Laja', '6.187351,-75.379737', 'PCQ Facturacion 15/20 +IVA Organo', '48:8F:5A:CC:0A:7F', '', 'GUSU', '', '21/07/2021', 135000, '1Pago, $134000.00', '#11660 - 15/09/2021', 'Pendiente de Pago'),
(92, 'Roberto de Jesus Gomez Duque', '8309504', '3103471346', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.37', 'Vereda Monta¤ez, condominio Monta¤ez. Lote Nø8', '', 'ROUTER FIBRA FTTH 15/20', '90:9A:4A:8B:42:3C', '', '', '', '20/07/2021', 90000, '', '', 'Pagadas'),
(93, 'Stiven Bravo Gomez', '1152202663', '3014971458', 'Plan 15 Megas', '', 'Activo', '', '', '', '172.30.33.78', 'Vereda La Clarita', '6.2593808,-75.4264191', 'PCQ Facturacion 01/05 Chorrera', '48:8F:5A:CC:2D:63', '', 'GUCHO2', '', '20/07/2021', 150000, '', '', 'Pagadas'),
(94, 'Diego Fernando Ramirez Amador', '71578310', '3015706050', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.32', 'CL 47 Cr 50 17 (Interior 301)', '6.277773857116699,-75.44131469726562', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:34:BE', '', '', '', '17/07/2021', 70000, '', '', 'Pagadas'),
(95, 'Santiago Restrepo Castro', '1128418286', '3005910896', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.31.22', 'Vereda La Enea', '6.3294138,-75.4084576', 'PCQ Facturacion 15/20 Yolombal', '48:8F:5A:CC:2E:CF', '', 'GUYO4', '', '17/07/2021', 110000, '', '', 'Pagadas'),
(96, 'Luz Dary Gomez sanchez', '1035910068', '3148886855', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.136', 'Cll 41A #48-96, Barrio Centro Plaza', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '16/07/2021', 70000, '', '', 'Pagadas'),
(97, 'Juan Carlos Suarez Henao', '1128405680', '3007760365', '200 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.135', 'Vereda Monta¤ez, Condominio Monta¤ez Lote 3', '6.2933809,-75.4407593', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '16/07/2021', 150000, '', '', 'Pagadas'),
(98, 'Daniel Botero Garcia', '1128390566', '3155738983', 'Plan dinamico 3 - 10 Megas', '', 'Activo', '', '', '', '172.30.31.21', 'Vereda Yolombal', '6.317700,-75.393531', 'PCQ Facturacion 01/05 +IVA Yolombal', 'F4:92:BF:E8:F0:B5', '', 'GUYO4', '', '16/07/2021', 85000, '', '', 'Pagadas'),
(99, 'ADCOSY S.A.S', '900097586', '3013715485', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.31.26', 'Vereda Yolombal Sector las Cruces', '6ø19\'26.0\"N 75ø23\'20.8\"W', 'PCQ Facturacion 01/05 +IVA Yolombal', 'F4:92:BF:E6:E2:FE', '', 'GUYO4', '', '16/07/2021', 70000, '', '', 'Pagadas'),
(100, 'Carolina Andrea Rodriguez Guerra', '43210967', '3219020260', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.134', 'Vereda El Aguacate. Finca Mi Rancho', '6.2861707,-75.4375498', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '15/07/2021', 80000, '', '', 'Pagadas'),
(101, 'Ruben Dario Marin Gallego', '70095487', '3105979541', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.133', 'Vereda La Mulona. 86A Al frente de la 86', '6.2926667,-75.4382098', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '15/07/2021', 80000, '', '', 'Pagadas'),
(102, 'Juan Fernando Nicolas Ortega Gonz lez', '70553712', '3126500088', '50 MEGAS FIBRA OPTICA', '', 'Cancelado', '', '', '', '192.168.102.132', 'Vereda La Clara Finca 512', '6.264382839202881,-75.4145736694336', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '15/07/2021', 80000, '1Pago, $80000.00', '#10968 - 15/08/2021', 'Pendiente de Pago'),
(103, 'Juan Camilo Villegas Marin', '98764003', '3135532587', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.28.155', 'Vereda El Palmar', '6.268518,-75.408998', 'PCQ Facturacion 01/05 Organo', '48:8F:5A:CC:09:13', '', 'GUSE2', '', '15/07/2021', 135000, '', '', 'Pagadas'),
(104, 'Oscar Fabian Wilches Machado', '79800453', '3194028390', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.131', 'Cr 50 Cl 45 37 (Interior 402)', '6.2770943,-75.4409269', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '15/07/2021', 80000, '', '', 'Pagadas'),
(105, 'Carlos Ignacio Naranjo de los Rios', '70755246', '3216296525', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.129', 'Vereda Monta¤ez, Condominio Monta¤ez', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '14/07/2021', 70000, '', '', 'Pagadas'),
(106, 'Falconery Cano Ramirez', '43574816', '3216062934', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.31.46', 'Vereda Yolombal, sector los naranjos', '6.320420,-75.406764', 'PCQ Facturacion 01/05 Yolombal', 'E0:63:DA:9E:21:BF', '', 'GUYO4', '', '14/07/2021', 135000, '', '', 'Pagadas'),
(107, 'Luz Dary Zuluaga Gomez', '43475291', '3106561215', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.31.44', 'Vereda Yolombal', '6.3219931,-75.3879283', 'PCQ Facturacion 15/20 Yolombal', 'F4:92:BF:E9:EC:28', '', 'GUYO4', '', '14/07/2021', 70000, '', '', 'Pagadas'),
(108, 'Juan Carlos Morales Guerra', '80013068', '3016868154', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.121', 'Vereda La Mulona. Finca 93D', '6.2911509,-75.4404427', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '13/07/2021', 70000, '', '', 'Pagadas'),
(109, 'Alvaro Leon Cardona Saldarriaga', '8396234', '3024537234, 3113909749', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.119', 'Vereda La Mulona', '6.292269229888916 -75.4375', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '13/07/2021', 70000, '', '', 'Pagadas'),
(110, 'Israel Mu¤oz Junco', '1032380034', '3134187799, 3004470305', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.17', 'Batall¢n JDC CASA FISCALES Nø07', '6.209617637244799, -75.3920691528065', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:DA:BF', '', 'GUSU', '', '13/07/2021', 80000, '', '', 'Pagadas'),
(111, 'Dora Luz Salazar Sanchez', '1035913426', '3128329469', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.103', 'Vereda La Mulona. Finca del tigre Nø 86', '6.2913695,-75.4373307', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '10/07/2021', 80000, '', '', 'Pagadas'),
(112, 'Jose Alexander Londo¤o Velasquez', '70754880', '3103784801', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.128', 'Vereda Monta¤ez', '6.2956612,-75.4347934', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '10/07/2021', 70000, '', '', 'Pagadas'),
(113, 'Luz Dary Villegas Usma', '22135960', '3105005035', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.41', 'Vereda Guapante Abajo', '6.300028,-75.405801', 'PCQ Facturacion 01/05 Organo', '48:8F:5A:CC:2E:CB', '', 'GUSE2', '', '10/07/2021', 80000, '', '', 'Pagadas'),
(114, 'Luis Fernando Carmona Marin', '70753410', '3148647981', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.126', 'Vereda El Aguacate', '6.291915,-75.436305', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '8/07/2021', 70000, '', '', 'Pagadas'),
(115, 'Olga Regina Grisales Osorio', '51925529', '18135739493', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.3.97', 'Vereda La Clara, Finca Erazul 206', '6.262187,-75.421068', 'PCQ Facturacion 15/20 +IVA Organo', '48:8F:5A:6F:BB:BF', '', 'GUSA', '', '8/07/2021', 55000, '1Pago, $65450.00', '#11693 - 15/09/2021', 'Pendiente de Pago'),
(116, 'Juan Camilo Zapata Londo¤o', '15439334', '3126868598', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.127', 'Calle 38 #52c 25, Barrio San Antonio', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '8/07/2021', 80000, '', '', 'Pagadas'),
(117, 'Luis Carlos Correa Toro', '71795980', '3148961915', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.70', 'Vereda La Clara. Finca 245 A', '6.2618181781434075,-75.4245114326477', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '7/07/2021', 90000, '', '', 'Pagadas'),
(118, 'Jhonatan Andres Restrepo', '1010109736', '3122992245', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.45', 'Cra 53 CL 38 204 Interior 204,Barrio San Antonio', '6.276912122079517,-75.44193506240845', 'PCQ Facturacion 01/05 Organo', '64:D1:54:BC:1E:56', '', 'SAGUSE', '', '7/07/2021', 80000, '', '', 'Pagadas'),
(119, 'Vanessa Melaine Guresso Garcia', '1037633301', '3007820547', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.34', 'Vereda La Clara', '6.264786720275879,-75.41859436035156', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '6/07/2021', 100000, '', '', 'Pagadas'),
(120, 'Belcy Tatiana Sepulveda Gelvez', '1090387045', '3183891750', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.46', 'Vereda Monta¤ez. Finca Santa Marta', '6.294246196746826,-75.43608856201172', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '6/07/2021', 80000, '', '', 'Pagadas'),
(121, 'Juliana Orozco Narvaez', '1017143939', '3105918307, 3182228097', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.17.100', 'Vereda Cabeceras', '6.104504585266113,-75.42537689208984', 'Facturaci¢n 01/05 + Iva Organo', 'B8:69:F4:FF:F2:16', '', 'GUSU', '', '2/07/2021', 135000, '', '', 'Pagadas'),
(122, 'Juanita Alvarez Gomez', '39451677', '3207780235', '150 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.11', 'Cra 48 Cl 43 28 (201) Plaza de mercado local 201', '6.2763142585754395,-75.43968200683594', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '30/06/2021', 140000, '', '', 'Pagadas'),
(123, 'Hector Dario Jaramillo Espinosa', '1007241260', '3117748463', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.22.99', 'Batall¢n JDC', '6.208827,-75.390656', 'PCQ Facturacion 01/05 Organo', 'F4:92:BF:E8:EE:2D', '', 'JDC', '', '30/06/2021', 135000, '', '', 'Pagadas'),
(124, 'Elkin Adolfo Correa Hurtado', '71740495', '3103569333', 'Plan 20 Megas', '', 'Cancelado', '', '', '', '172.30.27.27', 'Vereda Cabeceras', '6.0792985,-75.4321915', 'PCQ Facturacion 01/05 + Iva Chorrera', '', '', '', '', '30/06/2021', 200000, '', '', 'Pendiente de Pago'),
(125, 'Jesus Maria Rendon Echeverri', '8239380', '3205345288', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.3.20', 'Vereda La Clara', '6.263043,-75.427881', 'PCQ Facturacion 01/05 Organo', '74:4D:28:42:23:9F', '', 'GUSA', '', '30/06/2021', 65000, '', '', 'Pagadas'),
(126, 'Luisa Fernanda Gallego Grisales', '1001416373', '3234223026, 3214734576', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.219', 'Carrera 48 N 48B-14 apto 302 Barrio Mar¡a Auxiliadora', '6.279745578765869,-75.4410171508789', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '29/06/2021', 70000, '', '', 'Pagadas'),
(127, 'Elida Yaneth Casta¤o Mu¤oz', '21792575', '3216080381', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.218', 'Vereda El Aguacate', '6.292736530303955,-75.43460845947266', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '29/06/2021', 70000, '', '', 'Pagadas'),
(128, 'Miguel Angel Cantillo Mandon', '12495605', '3106939096', 'PLAN 10 MEGAS PCQ MIGUEL CANTILLO', '', 'Gratis', '', '', '', '172.30.17.99', 'Vereda San Luis', '', 'PCQ Facturacion 01/05 Organo', 'F4:92:BF:E8:F0:B3', '', '', '', '28/06/2021', 67500, '', '', 'Pendiente de Pago'),
(129, 'Alejandro Gallego Rivera', '1001415671', '3106360050', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.125', 'Carrera 48 # 45-43, Barrio Centro Plaza', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '28/06/2021', 70000, '', '', 'Pagadas'),
(130, 'Gladis Amparo Gallego Cardona', '43423380', '3203497886', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.216', 'Cra 52 Nø 47 130 (201) Diagonal puntadas digitales. Barrio San Francisco', '6.278090953826904,-75.4422836303711', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '27/06/2021', 80000, '', '', 'Pagadas'),
(131, 'Ricardo Alberto Vargas Vargas', '1036935250', '3216727645', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.215', 'Cra 47 Nø 44 36, interior 301. Centro Plaza', '6.277674674987793,-75.43851470947266', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '27/06/2021', 70000, '', '', 'Pagadas'),
(132, 'Liliana Maria Monsalve Osorno', '43210494', '3145068938', '50 MEGAS FIBRA OPTICA', '', 'Suspendido', '', '', '', '192.168.102.214', 'Cra 48 Nø 48 41 interior 9704. Edificio Alfaguara', '6.279397964477539,-75.43986511230469', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/06/2021', 80000, '1Pago, $80000.00', '#11514 - 01/09/2021', 'Pendiente de Pago'),
(133, 'Kenny Bedoya Villa', '1152434913', '3004529668', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.124', 'Barrio San Francisco', '6.279669761657715,-75.44147491455078', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '25/06/2021', 70000, '1Pago, $70000.00', '#11941 - 15/09/2021', 'Pendiente de Pago'),
(134, 'Jhon Fredy de Jesus Herrera Ortiz', '70753422', '3207476135', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.200', 'CL 42 48 A 13, Barrio Centro Plaza', '6.27595853805542,-75.43892669677734', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '25/06/2021', 70000, '', '', 'Pagadas'),
(135, 'Marino de Jesus Casta¤o Villegas', '7511576', '3015152248', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.24.30', 'Vereda La Hondita', '', 'PCQ Facturacion 01/05 +IVA Organo', 'F4:92:BF:E8:FB:7D', '', 'COELPORVENIR', '', '25/06/2021', 110000, '', '', 'Pagadas'),
(136, 'Jose Alejandro Gonzalez Ruiz', '98626583', '3003671098', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.26.154', 'Vereda El Salado. Finca Nø 80', '6.228395,-75.448939', 'PCQ Facturacion 15/20 San Bernardo', '48:8F:5A:BC:70:15', '', 'GUAVI', '', '25/06/2021', 70000, '1Pago, $46700.00', '#11937 - 15/09/2021', 'Pendiente de Pago'),
(137, 'Jose Daniel Restrepo Raigosa', '71260305', '3205799099', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.12.42', 'Vereda San Jose', '6.2207869,-75.448519', 'PCQ Facturacion 01/05 Organo', '74:4D:28:4E:04:60', '', 'GUGU', '', '24/06/2021', 135000, '', '', 'Pagadas'),
(138, 'Luis Hernan Mantilla Pinilla', '91180916', '3108321326', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.22.52', 'Batall¢n JDC Apartamento R22 N 01', '', 'PCQ Facturacion 01/05 Organo', '74:83:C2:5A:9D:72', '', 'JDC', '', '24/06/2021', 80000, '', '', 'Pagadas'),
(139, 'Anibal Fernando Ortega Piedrahita', '1036941283', '3105941438', 'Plan 8 Megas', '', 'Cancelado', '', '', '', '172.30.2.15', 'Vereda Abreo, Rionegro', '6.173095,-75.398941', 'PCQ Facturacion 01/05 Organo', '64:D1:54:21:3B:9B', '', 'GURI', '', '22/06/2021', 110000, '', '', 'Pagadas'),
(140, 'Andres Felipe Mazo Osorio', '1036946634', '3226817090', 'Plan 8 Megas', '', 'Cancelado', '', '', '', '172.30.28.27', 'Vereda Mejia - Al Frente De Transmetanos', '6.300085,-75.431662', 'PCQ Facturacion 01/05 Organo', '', '', 'GUSE2', '', '22/06/2021', 110000, '', '', 'Pagadas'),
(141, 'Salome Gallego Ochoa', '1035922580', '3013070374', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.221', 'Centro Plaza parte ALta', '6.276404857635498,-75.43768310546875', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '21/06/2021', 70000, '', '', 'Pagadas'),
(142, 'COLOMBIAN FLOWER COL S.A.S.', '901243599', '3127232008', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.61', 'Vereda La Mosquita', '6.205992,-75.434400', 'PCQ Facturacion 01/05 + Iva Chorrera', 'E4:8D:8C:60:F5:8B', '', 'GUCHO2', '', '21/06/2021', 80000, '', '', 'Pagadas'),
(143, 'Juan Pablo Franco Velasquez', '1040730425', '3128863106', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.117', 'Vereda El Aguacate', '6.292687,-75.4348671', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '19/06/2021', 70000, '1Pago, $70000.00', '#11783 - 15/09/2021', 'Pendiente de Pago'),
(144, 'Wilton Jose Bedoya Giraldo', '15513846', '3157520288', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.31.27', 'Vereda La Enea', '6.330217,-75.400933', 'PCQ Facturacion 01/05 Yolombal', 'F4:92:BF:EA:05:1A', '', 'GUYO4', '', '19/06/2021', 80000, '', '', 'Pagadas'),
(145, 'Dora Cristina Salgado Ca¤averal', '43504659', '3172683387', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.27.23', 'Vereda Chaparral', '6.230303,-75.408950', 'PCQ Facturacion 01/05 Chorrera', '48:8F:5A:BC:89:AD', '', 'GUCHOCA', '', '18/06/2021', 80000, '', '', 'Pagadas'),
(146, 'Pavel Andrei Espitia Jim‚nez', '1022360167', '3213857953', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.31.25', 'Vereda Yolombal, sector La Choza de los Henao.', '6.313458,-75.409998', 'PCQ Facturacion 15/20 Yolombal', 'F4:92:BF:EA:03:1B', '', 'GUYO4', '', '18/06/2021', 135000, '1Pago, $135000.00', '#11845 - 15/09/2021', 'Pendiente de Pago'),
(147, 'Diego Napoleon Forero Vasquez', '10002059', '3223041689', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.31.20', 'Vereda Yolombal', '', 'PCQ Facturacion 01/05 Yolombal', 'F4:92:BF:E6:E2:2A', '', 'GUYO4', '', '18/06/2021', 135000, '', '', 'Pagadas'),
(148, 'Irania Nazareth Irigoyen Parrado', '1234992810', '3017174389', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.228', 'Vereda La Clara', '6.268400192260742,-75.42134857177734', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '17/06/2021', 100000, '1Pago, $106000.00', '#11785 - 15/09/2021', 'Pendiente de Pago'),
(149, 'Andres Felipe Ramirez Orozco', '15446606', '3148768272, 3136126620', 'Plan 4 Megas', '', 'Cancelado', '', '', '', '172.30.17.24', 'Vereda Santa Barbara, Rionegro', '6.213996,-75.370768', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5A:C9:BF', '', 'GUSU', '', '17/06/2021', 65000, '', '', 'Pendiente de Pago'),
(150, 'Jorge Edwin Herrera Osorio', '15444586', '3043818782', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.37', 'Carrera 50 # 48-63 Barrio San Francisco', '6.278738498687744,-75.44161987304688', 'ROUTER FIBRA FTTH 01/05', '84:3E:92:F9:38:3F', '', '', '', '17/06/2021', 100000, '', '', 'Pagadas'),
(151, 'Jorge Leonardo Medina Grajales', '1036626902', '3104981388', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.231', 'Cr 52D # 35-10 Mini mercado los cisnes. San Antonio Parte baja, Guarne', '6.268630027770996,-75.43700408935547', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '16/06/2021', 80000, '', '', 'Pagadas'),
(152, 'Hans Peter Bergmann', '396521', '3183388384', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.76', 'Vereda La Clara', '6.265420,-75.416513', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FC:3D:61', '', 'GUSA', '', '16/06/2021', 80000, '1Pago, $80000.00', '#11700 - 15/09/2021', 'Pendiente de Pago'),
(153, 'Adriana Maria Isaza Estrada', '43793676', '3193826618', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.28.154', 'Vereda Guapante Arriba', '6.295996,-75.422819', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:AC:AE:8B', '', 'GUSE2', '', '15/06/2021', 55000, '1Pago, $55000.00', '#11718 - 15/09/2021', 'Pendiente de Pago'),
(154, 'David Gallego Cardona', '1035915082', '3043505197', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.240', 'CL 41 a # 48 a - 06 interior 203', '6.2757619,-75.4384147', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '15/06/2021', 70000, '', '', 'Pagadas'),
(155, 'Paulina Zapata Idarraga', '1020486569', '3128561425', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.238', 'Carrera 47 # 41 a 55, Barrio Centro Plaza parte ALta', '6.276880741119385,-75.43780517578125', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '15/06/2021', 70000, '', '', 'Pagadas'),
(156, 'Erica Hincapie Pe¤a', '43635568', '3014276307', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.236', 'Vereda la Clara', '6.2721157,-75.4232791', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '15/06/2021', 80000, '', '', 'Pagadas'),
(157, 'Jorge Alberto Gallego Alzate', '1017163786', '3203257240', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.18.65', 'Vereda La Honda', '6.248907,-75.464304', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:AB:FE:2E', '', 'SAGUSE', '', '12/06/2021', 65000, '', '', 'Pagadas'),
(158, 'Juan Felipe Suaza Marin', '1036937734', '3128990739', '15 MEGAS Guillermo Helias Suaza trujillo', '', 'Activo', '', '', '', '172.30.17.97', 'Vereda San Luis, Via San Vicente Ferrer', '6.2309584,-75.3508679', 'PCQ Facturacion 01/05 Organo', '', '', 'GUSU', '', '11/06/2021', 75000, '', '', 'Pagadas'),
(159, 'Guillermo Elias Suaza Trujillo', '15435147', '3192167010', '15 MEGAS Guillermo Helias Suaza trujillo', '', 'Activo', '', '', '', '172.30.17.96', 'Vereda San Luis, Via San Vicente', '6.2309584,-75.3508679', 'PCQ Facturacion 01/05 Organo', '', '', 'GUSU', '', '11/06/2021', 75000, '', '', 'Pagadas'),
(160, 'Luis Carlos Arbelaez Giraldo', '70044839', '3017545545', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.33.37', 'Vereda Yolombal, N£mero B-25', '6.2789985,-75.4273253', 'PCQ Facturacion 01/05 Chorrera', '', '', 'GUCHO2', '', '10/06/2021', 55000, '', '', 'Pagadas'),
(161, 'Sandra Lucia Grisales Rodriguez', '39444165', '3106395395', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.230', 'Cl 46 50 027 (201) Barrio San Francisco', '6.2771276,-75.4411202', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '9/06/2021', 70000, '', '', 'Pagadas'),
(162, 'Yarime Andrea Aristizabal Aristizabal', '1053776625', '3012985842', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.231', 'Cra 48A #46-25 apto 501 edificio balcones San Francisco.', '6.2782783,-75.4399366', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '9/06/2021', 80000, '', '', 'Pagadas'),
(163, 'Yinais Rangel Morales', '1085171598', '3135596279', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.26.20', 'Sector la Caba¤a, Guarne', '6.2850646,-75.4498481', 'PCQ Facturacion 15/20 San Bernardo', 'B8:69:F4:61:58:4F', '', 'GUAVI', '', '8/06/2021', 80000, '1Pago, $80000.00', '#11690 - 15/09/2021', 'Pendiente de Pago'),
(164, 'Carlos Ernan Cardenas Navas', '80491500', '3134393880, 3504331546', 'Plan 4 Megas Volante', '', 'Cancelado', '', '', '', '172.30.11.25', 'Vereda La Clara', '6.2594815787243805,-75.41916847229004', 'PCQ Facturacion 15/20 Organo', 'E0:63:DA:9E:1F:9A', '', 'GUSA2', '', '8/06/2021', 60000, '', '', 'Pendiente de Pago'),
(165, 'Bertha Amparo Zuluaga Aristizabal', '43422257', '3128139196', '10 MEGAS FIBRA OPTICA', '', 'Gratis', '', '', '', '192.168.103.235', 'Vereda La Clara', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '8/06/2021', 60000, '', '', 'Pagadas'),
(166, 'Maria Luz Mary Quintero Zuluaga', '39213478', '3208393200', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.234', 'Vereda La Clara', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '8/06/2021', 70000, '', '', 'Pagadas'),
(167, 'Marta Ligia Rendon Lopez', '43423247', '3218825382', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.15', 'Vereda la Clara', '6.2709431648254395,-75.42706298828125', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '8/06/2021', 70000, '', '', 'Pagadas'),
(168, 'Jorge Alberto Atehortua Marin', '71664515', '3148880271', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.248', 'Vereda Monta¤ez', '6.29439,-75.43642', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '5/06/2021', 70000, '', '', 'Pagadas');
INSERT INTO `telemercadeoclientes` (`id`, `nombre`, `cedula`, `telefono`, `plan`, `estado`, `estado_contrato`, `estadoLLamada`, `tipificacion`, `observaciones`, `ip`, `direccion`, `coordenadas`, `router`, `mac`, `seguimiento`, `sectorial`, `observaciones_seguimiento`, `fecha_instalación`, `precio_plan`, `pendiente_pago`, `ultima_factura`, `estado_factura`) VALUES
(169, 'Viviana Velasquez Sierra', '43874397', '3004987067', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.27.16', 'Vereda La playa, sector los arados', '6.206193,-75.376015', 'PCQ Facturacion 15/20 Chorrera', '48:8F:5A:CE:4C:29', '', 'GUCHOCA', '', '4/06/2021', 135000, '1Pago, $135000.00', '#11843 - 15/09/2021', 'Pendiente de Pago'),
(170, 'Gloria Yaneth Arango Gallego', '43794114', '3145356489', '30 MEGAS FIBRA OPTICA', '', 'Gratis', '', '', '', '192.168.103.247', 'Cra 47 Nø41 B 81. Centro plaza parte alta', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '3/06/2021', 70000, '', '', 'Pagadas'),
(171, 'Camilo Cesar Granada', '9955055', '3006190044', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.8.15', 'Vereda Monte Oscuro', '6.286525,-75.424747', 'PCQ Facturacion 15/20 San Bernardo', '48:8F:5A:BC:7E:45', '', 'GUTO', '', '2/06/2021', 135000, '', '', 'Pagadas'),
(172, 'Josefina Tamayo Jimenez', '43681759', '3107553076', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.2.37', 'Vereda Chaparral, sector la virgen', '6.237859,-75.397996', 'PCQ Facturacion 01/05 Organo', '48:8F:5A:CE:4B:95', '', 'GURI', '', '2/06/2021', 110000, '', '', 'Pagadas'),
(173, 'John Fredy Perez Rodriguez', '98661814', '3147713704', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.14', 'Vereda La Honda Finca 5 El Tesoro', '6.225275,-75.453062', 'PCQ Facturacion 01/05 Organo', '48:8F:5A:CE:49:07', '', 'GUGU', '', '1/06/2021', 80000, '', '', 'Pagadas'),
(174, 'Fredy Alberto Saldarriaga Jimenez', '70756170', '3137241975', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.58', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '1/06/2021', 70000, '', '', 'Pagadas'),
(175, 'William Ferney Jaramillo Urrego', '1055831406', '3128929987', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.13', 'Vereda El Aguacate', '6.2928182,-75.434903', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '1/06/2021', 70000, '', '', 'Pagadas'),
(176, 'Luis Javier Zapata Franco', '4351599', '3128079445', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.250', 'Cll 49 Nø 48 97 interior 202', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '1/06/2021', 80000, '', '', 'Pagadas'),
(177, 'Maria Cruz Elba Uribe Tavera', '43422255', '3008003586', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.245', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '1/06/2021', 70000, '', '', 'Pagadas'),
(178, 'Maria Yolanda Suarez Rangel', '32666737', '3008500051', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.9.30', 'Vereda Yolombal Al Lado De La Iglesia', '6.3371531,-75.399691', 'PCQ Facturacion 01/05 Yolombal', 'F4:92:BF:E6:DF:A8', '', 'GUYO1', '', '1/06/2021', 135000, '', '', 'Pagadas'),
(179, 'Jhon Hiver Ortega Puentes', '83092644', '3202147002', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.22.221', 'Batallon Juan del Corral', 'batallon juan del corral', 'PCQ Facturacion 01/05 Organo', '74:83:C2:EC:67:A9', '', 'JDC', '', '1/06/2021', 80000, '', '', 'Pagadas'),
(180, 'Alejandro Ceballos Cardona', '1126251534', '3106727838', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.28.254', 'Vereda Guapante', '6.277349,-75.408602', 'PCQ Facturacion 01/05 Organo', '48:8F:5A:BC:7B:03', '', 'GUSE2', '', '31/05/2021', 110000, '', '', 'Pagadas'),
(181, 'Jose Antonio Duque Giraldo', '73092313', '3008400606', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.24', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '31/05/2021', 80000, '', '', 'Pagadas'),
(182, 'Sebastian Murillo Vanegas', '1041328460', '3016577567', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.253', '49 # 49 - 07 Mar¡a Auxiliadora. Segundo piso (Al lado de las bicicletas)', '6.2795951435292015,-75.4411518573761', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '31/05/2021', 70000, '', '', 'Pagadas'),
(183, 'Blanca Ligia Rios Garcia', '43424897', '3217407993, 3127607744', '50 MEGAS FIBRA OPTICA', '', 'Cancelado', '', '', '', '192.168.103.239', 'Vereda El Aguacate', '6.2933078,-75.4344623', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '31/05/2021', 80000, '', '', 'Pendiente de Pago'),
(184, 'Fabian Alberto Carmona Carmona', '70755163', '3217480384', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.115', 'Vereda El Aguacate', '6.29435920715332,-75.43417358398438', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '29/05/2021', 80000, '', '', 'Pagadas'),
(185, 'Lina Marcela Agudelo Rios', '1001415803', '3135694724', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.12.41', 'Vereda La Mosquita, por el alto del Gordo', '6.221510,-75.427294', 'PCQ Facturacion 15/20 Organo', '64:D1:54:BC:2C:97', '', 'GUGU', '', '29/05/2021', 65000, '', '', 'Pagadas'),
(186, 'Jaqueline Ramirez Giraldo', '43511753', '13213318314', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.243', 'Vereda La Clara. Sector la Trina', '6.2712554,-75.4192014', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '29/05/2021', 70000, '', '', 'Pagadas'),
(188, 'Hugo de Jesus Velasquez Gomez', '70750293', '3146969386, 3196711451', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.110', 'Vereda Monta¤ez', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '28/05/2021', 70000, '1Pago, $70000.00', '#11786 - 15/09/2021', 'Pendiente de Pago'),
(189, 'Edilia del Socorro Garcia De Gallego', '21783994', '3123405711', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.113', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '28/05/2021', 70000, '1Pago, $70000.00', '#11789 - 15/09/2021', 'Pendiente de Pago'),
(190, 'Deisy Yurany Zuleta Gallego', '1035915019', '3116919242', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.112', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '28/05/2021', 70000, '', '', 'Pagadas'),
(191, 'Yessica Viviana Chavarria Lopera', '1042772227', '3122249272, 3226703458', '10 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.111', 'Vereda Monta¤ez', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '28/05/2021', 60000, '', '', 'Pagadas'),
(192, 'Alejandro Jose Perez Salgado', '10931933', '3206332487', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.114', 'Vereda Monta¤ez', '6.2870819,-75.436163', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '28/05/2021', 70000, '', '', 'Pagadas'),
(193, 'Migdonia Maria Diez Villegas', '42891158', '3235816655', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.31.37', 'Vereda La Enea, Finca El Portal, detr s de la cancha de la Enea', '6.333654,-75.401293', 'PCQ Facturacion 15/20 Yolombal', '', '', 'GUYO4', '', '28/05/2021', 135000, '', '', 'Pagadas'),
(194, 'Hernan Dario Ruiz Gutierrez', '1035919794', '3103682311', 'Plan 6 Megas', '', 'Activo', '', '', '', '192.168.208.2', 'Torres de san Bernardo, Apto 604 torre 1', '', 'PCQ Facturacion 01/05 San Bernardo', '', '', 'GUTO', '', '28/05/2021', 80000, '', '', 'Pagadas'),
(195, 'Jorge Mario Lopez Rojo', '71693042', '3174738397', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.105', 'Vereda Monta¤ez', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '27/05/2021', 80000, '', '', 'Pagadas'),
(196, 'Gloria Elena Mu¤oz Gallego', '43411914', '3226819921', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.109', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '27/05/2021', 70000, '', '', 'Pagadas'),
(197, 'Jhon Fredy Perez Martinez', '71751805', '3024158036', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.108', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '27/05/2021', 90000, '1Pago, $90000.00', '#11796 - 15/09/2021', 'Pendiente de Pago'),
(198, 'Larry Alexis Isaza Marin', '1035914188', '3154451556', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.106', 'Vereda Monta¤ez', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '27/05/2021', 70000, '1Pago, $70000.00', '#11798 - 15/09/2021', 'Pendiente de Pago'),
(199, 'Andres Felipe Pelaez Caro', '1152211386', '3002834991', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.104', 'Vereda Monta¤ez', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '27/05/2021', 100000, '', '', 'Pagadas'),
(200, 'Miguel Antonio Rubio Perez', '80128868', '3206977313', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.61', 'Batallon Juan Del Corrral', '', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:6A:3C:4B', '', 'GUSU', '', '27/05/2021', 80000, '', '', 'Pagadas'),
(201, 'Oscar Ignacio Tabares Ocampo', '75083757', '3108251682', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.102', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/05/2021', 80000, '', '', 'Pagadas'),
(202, 'Jhonny Alberto Gomez Rios', '1038409820', '3197828587', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.98', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/05/2021', 70000, '', '', 'Pagadas'),
(203, 'Piedad del Socorro Rios Garcia', '43424079', '3147339687', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.101', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/05/2021', 80000, '', '', 'Pagadas'),
(204, 'Juan Pablo Casta¤o Alvarez', '98637349', '3127285294', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.96', 'Vereda Monta¤ez', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/05/2021', 70000, '', '', 'Pagadas'),
(205, 'Maria Isabel Rios Garcia', '43422767', '3014445067', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.100', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '26/05/2021', 80000, '1Pago, $80000.00', '#11800 - 15/09/2021', 'Pendiente de Pago'),
(206, 'Diana Marcela Pulgarin Monsalve', '1033646870', '3136300487', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.99', 'Vereda El aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/05/2021', 70000, '', '', 'Pagadas'),
(207, 'Wasilin Rafael Santos Uparela', '1037674799', '3127306910', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.97', 'Vereda El Aguacate, Primer piso Marisol, en toda la Y', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '26/05/2021', 70000, '1Pago, $70000.00', '#11802 - 15/09/2021', 'Pendiente de Pago'),
(208, 'Duvan Henao Saldarriaga', '1000660324', '3502844304', '200 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.95', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/05/2021', 150000, '', '', 'Pagadas'),
(209, 'Paula Cristina Carmona Carmona', '1035913951', '3128594242', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.94', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/05/2021', 80000, '1Pago, $360000.00', '#11644 - 04/09/2021', 'Pagadas'),
(210, 'Brandon Stiven Jaramillo Garcia', '1001415658', '3233759052', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.17', 'Vereda la Clara', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:D1:E3:95', '', 'GUSA', '', '26/05/2021', 80000, '', '', 'Pagadas'),
(211, 'Oscar Dario Hernandez Cardona', '70756149', '3209810860', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.93', 'Vereda El Aguacate. Finca Villa Margarita', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '25/05/2021', 70000, '', '', 'Pagadas'),
(212, 'Gloria Amparo Gallego castro', '43210514', '3504446104', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.26', 'Vereda Yolombal', '6.311564,-75.411731', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:DB:55', '', 'GUSE2', '', '25/05/2021', 65000, '1Pago, $65000.00', '#11746 - 15/09/2021', 'Pendiente de Pago'),
(213, 'Luz Adriana Jaramillo Lopez', '1035914196', '3146692734', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.92', 'Vereda El aguacate', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '25/05/2021', 70000, '', '', 'Pagadas'),
(214, 'Marisol Gallego Garcia', '1035914018', '3105459382', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.91', 'Vereda El Aguacate', '6.2931056,-75.4347876', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '24/05/2021', 70000, '', '', 'Pagadas'),
(215, 'Maria Emilse Ayala Garcia', '43210274', '3225346953', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.90', 'Vereda El Aguacate', '6.292575,-75.4346641', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '24/05/2021', 70000, '', '', 'Pagadas'),
(216, 'Gloria Amparo Gomez Gomez', '43404561', '3113525672', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.89', 'Vereda el Aguacate, sector cancha', '6.2921753,-75.4353333', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '24/05/2021', 90000, '1Pago, $83900.00', '#11813 - 15/09/2021', 'Pendiente de Pago'),
(217, 'Oscar de Jesus Pati¤o Rios', '70755172', '3226422398', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.88', 'Vereda El Aguacate', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '24/05/2021', 70000, '', '', 'Pagadas'),
(218, 'Andres Felipe Pati¤o Ossa', '1035919634', '3103974748', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.87', 'Vereda El Aguacate', '6.2924546,-75.4355269', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '24/05/2021', 70000, '1Pago, $70000.00', '#11820 - 15/09/2021', 'Pendiente de Pago'),
(219, 'Nataly Pamela Zapata Velasquez', '1037630659', '3044582030, 3207886982', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.27.57', 'Vereda La Mosquita', '6.206871,-75.431890', 'PCQ Facturacion 15/20 Chorrera', '48:8F:5A:CC:2F:87', '', 'GUCHOCA', '', '22/05/2021', 110000, '', '', 'Pagadas'),
(220, 'Carmencita Pati¤o Rios', '43210614', '3202209798', '10 MEGAS FIBRA OPTICA', '', 'Gratis', '', '', '', '192.168.102.84', 'Vereda El Aguacate, al lado de la cancha', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '22/05/2021', 60000, '', '', 'Pagadas'),
(221, 'Gloria Irene Pati¤o Rios', '43423925', '3013131919', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.85', 'Vereda El Aguacate', '6.2921776,-75.4351223', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '22/05/2021', 90000, '', '', 'Pagadas'),
(222, 'Ermed Abad Ochoa Ochoa', '1035913882', '3138631774', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.9.77', 'Vereda Yolombal', '6.3289792,-75.3965603', 'PCQ Facturacion 15/20 Yolombal', 'F4:92:BF:E6:DF:D8', '', 'GUYO1', '', '21/05/2021', 55000, '1Pago, $44400.00', '#11698 - 15/09/2021', 'Pendiente de Pago'),
(223, 'Fabio de Jesus Duque Escobar', '70752660', '3206729677, 3232896581', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.32.19', 'Vereda La Enea', '6.3302164,-75.4104566', 'PCQ Facturacion 15/20 Yolombal', '48:8F:5A:CC:2F:A1', '', 'GUYO5', '', '21/05/2021', 80000, '1Pago, $80000.00', '#11837 - 15/09/2021', 'Pendiente de Pago'),
(224, 'Leidy Yohana Lopera Gallego', '1035911694', '3155826605', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.83', 'Vereda El Aguacate', '6.2921412,-75.4354064', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '21/05/2021', 80000, '', '', 'Pagadas'),
(225, 'Sonia Trinidad Marin Alzate', '43424185', '3234836304', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.82', 'Calle 41A Nø48 151 interior 213', '6.2751779,-75.4369333', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '20/05/2021', 80000, '1Pago, $80000.00', '#11825 - 15/09/2021', 'Pendiente de Pago'),
(226, 'Albeny Catalino Carrasquero Sanchez', '19946952', '3002988879', '50 MEGAS FIBRA OPTICA', '', 'Cancelado', '', '', '', '192.168.102.81', 'Cl 42 cr 48- 68 interior 101. Barrio Centro Plaza', '6.277125335582191,-75.438791513443', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '20/05/2021', 80000, '', '', 'Pagadas'),
(227, 'Jose Joaquin Garc¡a Londo¤o', '3516636', '3186579783, 3217515996', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.33.66', 'Vereda La Clara parte Alta', '6.271634,-75.416647', 'PCQ Facturacion 01/05 Chorrera', '48:8F:5A:CC:2D:93', '', 'GUCHO2', '', '20/05/2021', 65000, '', '', 'Pagadas'),
(228, 'Juan Carlos Pabon µlvarez', '71388525', '3167715319', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.32.67', 'Vereda La clara', '6.3276293,-75.4147275', 'PCQ Facturacion 15/20 Yolombal', 'CC:2D:E0:CF:EC:49', '', 'GUYO5', '', '19/05/2021', 70000, '', '', 'Pagadas'),
(229, 'Melissa Zea Leal', '1152456594', '3104463061', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.32.56', 'Vereda La Enea', '6.331805,-75.4090183', 'PCQ Facturacion 01/05 Yolombal', 'B8:69:F4:AC:6D:50', '', 'GUYO5', '', '19/05/2021', 110000, '', '', 'Pagadas'),
(230, 'Julian Alberto Lopez Ochoa', '1035914606', '3145605621', '30 MEGAS FIBRA OPTICA', '', 'Cancelado', '', '', '', '192.168.102.80', 'Cll 41 Cra 48 105 interior 101, Barrio Centro Plaza', '6.275282,-75.4383867', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '18/05/2021', 70000, '', '', 'Pendiente de Pago'),
(231, 'Pilar Restrepo Ochoa', '1152455526', '3053351860', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.79', 'Vereda La clara. Parcelaci¢n los cisnes. Lote 13', '', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '15/05/2021', 70000, '', '', 'Pagadas'),
(232, 'Stefany Castrillon Zapata', '1039454748', '3196178790', 'Plan 6 Megas', '', 'Activo', '', '', '', '192.168.21.5', 'Vereda El Salado', '', 'PCQ Facturacion 15/20 Organo', '', '', '', '', '15/05/2021', 80000, '1Pago, $80000.00', '#11712 - 15/09/2021', 'Pendiente de Pago'),
(233, 'Juan Diego Isaza Grisales', '71646368', '3003889092, 3128983756', 'Plan 10 Megas', '', 'Suspendido', '', '', '', '172.30.3.77', 'Vereda la Clara. Finca 118', '6.254801,-75.426552', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:97:C1:11', '', 'GUSA', '', '14/05/2021', 135000, '', '', 'Pagadas'),
(234, 'Elkin Andres Iral Hernandez', '1010065980', '3116044208', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.26.56', 'Vereda El Salado por la entrada de Piedras Blancas', '6.288378,-75.460049', 'PCQ Facturacion 01/05 San Bernardo', '64:D1:54:BD:83:A7', '', 'GUAVI', '', '14/05/2021', 70000, '', '', 'Pagadas'),
(235, 'Jose Orlando Ochoa Ceballos', '1035912388', '3192053554', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.25', 'Vereda Yolombal', '6.283179,-75.403788', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:B7:68:D5', '', 'GUSE2', '', '12/05/2021', 65000, '', '', 'Pagadas'),
(236, 'Anderson Steve Barrera Arias', '1220469730', '3218303768', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.25.89', 'Vereda San Jose. Entrada de la torre bajando por los rieles, la derecha, luego en la Y a la izquierda, en la ultima finca.', '6.242198,-75.440178', 'PCQ Facturacion 01/05 Chorrera', '48:8F:5A:CB:F4:11', '', 'GUCHO', '', '12/05/2021', 55000, '', '', 'Pagadas'),
(237, 'Catalina Lopez Cortes', '1017123301', '3003132146', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.4.41', 'Vereda La Clara', '6.262460,-75.428405', 'PCQ Facturacion 15/20 Organo', '48:8F:5A:CB:F7:AF', '', 'GUCA', '', '11/05/2021', 65000, '1Pago, $65000.00', '#11752 - 15/09/2021', 'Pendiente de Pago'),
(238, 'Marisol Puerta R¡os', '42899822', '3113491057', '30 MEGAS FIBRA OPTICA', '', 'Cancelado', '', '', '', '192.168.102.77', 'Cra 51 A Cl 46 55 interior 401', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '8/05/2021', 70000, '1Pago, $70000.00', '#10973 - 15/08/2021', 'Pendiente de Pago'),
(239, 'Trinidad del socorro Casta¤o Marin', '21783915', '3218907217', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.76', 'Cra 51 A Cl 46 43 interior 201', '6.277414798736572,-75.4417724609375', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '8/05/2021', 70000, '', '', 'Pagadas'),
(240, 'Johana Catalina Rodriguez Mu¤oz', '43264736', '3504630628', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.26.22', 'Vereda Batea Seca. Finca 27', '', 'PCQ Facturacion 15/20 San Bernardo', '48:8F:5A:CB:F6:FB', '', 'GUAVI', '', '8/05/2021', 80000, '', '', 'Pagadas'),
(241, 'Esteban Andres Ramirez Rios', '1017196539', '3176583946', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.25.42', 'Vereda Alto de la Molina. Lote 76', '6.320224,-75.448660', 'PCQ Facturacion 01/05 Chorrera', '', '', 'GUCHO', '', '8/05/2021', 55000, '', '', 'Pagadas'),
(242, 'Caterine Florez Cardona', '1036952487', '3197212938', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.28.53', 'Vereda Guapante', '6.289011,-75.407461', 'PCQ Facturacion 15/20 Organo', '', '', 'GUSE2', '', '8/05/2021', 70000, '', '', 'Pagadas'),
(243, 'Julio Cesar Restrepo Moreno', '70751375', '3015203374', '50 MEGAS FIBRA OPTICA', '', 'Cancelado', '', '', '', '192.168.101.27', 'Cra 50 Nø40 28, Centro Plaza', '6.2747684,-75.4388674', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '7/05/2021', 80000, '', '', 'Pagadas'),
(244, 'Luz Helena Acevedo Saldarriaga', '32336179', '3216384767', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.54', 'Vereda La Clara', '6.266292,-75.419429', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '4/05/2021', 70000, '', '', 'Pagadas'),
(245, 'Luis Angel Tabares Escalante', '98672813', '3105940498', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.7.15', 'Vereda La Mosquita. Entrando Vivero Rosarte', '6.220062,-75.447015', 'PCQ Facturacion 15/20 Organo', '48:8F:5A:BC:7B:A3', '', 'GUMO', '', '3/05/2021', 110000, '1Pago, $110000.00', '#11735 - 15/09/2021', 'Pendiente de Pago'),
(246, 'Mary Luz Hincapie Sanchez', '43210522', '3147473250', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.128', 'Vereda La Mosquita. Sector vivero rosarte', '6.218765,-75.4472484', 'PCQ Facturacion 01/05 Chorrera', '', '', 'GUCHO2', '', '3/05/2021', 80000, '', '', 'Pagadas'),
(248, 'Gustavo de Jesus Zapata Castro', '70323150', '3136491977', 'Plan dinamico 3 - 10 Megas', '', 'Activo', '', '', '', '172.30.32.65', 'Vereda La Enea', '6.330897,-75.416823', 'PCQ Facturacion 01/05 Yolombal', '', '', 'GUYO5', '', '30/04/2021', 85000, '', '', 'Pagadas'),
(249, 'Mateo Henao Zapata', '1035921939', '3117598678', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.74', 'Cra 47 #42-49, Guarne', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '29/04/2021', 80000, '', '', 'Pagadas'),
(250, 'Debora del Socoro Rigol Torres', '43000826', '3136853563', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.73', 'Parcelaci¢n Los Cisnes lote 23, Vereda La Clara', '6.2666379,-75.4284873', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '29/04/2021', 80000, '', '', 'Pagadas'),
(251, 'Oscar Alberto Arango Aguirre', '71776551', '3185714574', 'Plan 15 Megas', '', 'Activo', '', '', '', '172.30.25.95', 'Vereda La Playa Finca N.30', '6.205291,-75.375979', 'PCQ Facturacion 15/20 + Iva Chorrera', '48:8F:5A:BC:85:79', '', 'GUCHO', '', '29/04/2021', 150000, '', '', 'Pagadas'),
(252, 'Cooperativa de Transportadores de Guarne', '900015725', '3207007449, 0345517075', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.24', 'CR 50 42 100, plaza de Mercado LC 8', '', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '28/04/2021', 100000, '', '', 'Pagadas'),
(253, 'Josefa Antonia Gallo Cardona', '22200230', '3106390132', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.26.30', 'Vereda Alto de la virgen, Villa Angel', '', 'PCQ Facturacion 15/20 +IVA San Bernardo', '74:4D:28:42:94:0D', '', 'GUAVI', '', '27/04/2021', 80000, '', '', 'Pagadas'),
(254, 'Ana Cristina Vargas Acevedo', '1035914805', '3215651644', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.60', 'Cll 43 N 51 25. Detr s del Hotel San Antonio, Guarne', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/04/2021', 70000, '', '', 'Pagadas'),
(255, 'Jorge Ivan Posada Montoya', '70753794', '3004464606', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.22', 'Cll 50 Nø51 16 2do Piso, parque principal Guarne', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/04/2021', 70000, '', '', 'Pagadas'),
(256, 'Jorge Andres Gonzalez', '71755365', '3205034424', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.71', 'Vereda La Clara', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '26/04/2021', 70000, '', '', 'Pagadas'),
(257, 'Consuelo Leonor Quiroz Perez', '39151445', '3006740492', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.18.38', 'Guarne Antioquia / Inder local 104', '6.278697,-75.446268', 'PCQ Facturacion 15/20 Organo', '64:D1:54:21:3B:9C', '', 'SAGUSE', '', '24/04/2021', 135000, '', '', 'Pagadas'),
(258, 'Juanita Angel Bouhot', '1037638654', '3194148273', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.62', 'Vereda La Clara. Finca El Cadillal', '6.263173,-75.426280', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '23/04/2021', 80000, '', '', 'Pagadas'),
(259, 'Jherly Raquel Pineda Salazar', '1086279509', '3205289960', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.88', 'Vereda Yolombal, Diagonal a Finca N 64 a la 67', '6.318556,-75.400658', 'PCQ Facturacion 15/20 Yolombal', 'F4:92:BF:E0:FB:67', '', 'GUYO1', '', '22/04/2021', 80000, '', '', 'Pagadas'),
(260, 'Su Inmueble Oriente Consultores SAS', '901462043', '3016155376', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.26', 'Cra 50 N 42 100 Local 299', '', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '22/04/2021', 70000, '', '', 'Pagadas'),
(261, 'Fernando Antonio Payares Perez', '77190343', '3117743406', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.31.88', 'Vereda Yolombal', '6.318518,-75.402635', 'PCQ Facturacion 01/05 Yolombal', 'B4:FB:E4:36:3C:A5', '', 'GUYO4', '', '20/04/2021', 110000, '', '', 'Pagadas'),
(262, 'Yury Esmeralda Garcia Jaramillo', '1036624003', '3206134514', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.31.30', 'Vereda Yolombal', '6.322468,-75.392965', 'PCQ Facturacion 01/05 Yolombal', 'F4:92:BF:EA:03:AE', '', 'GUYO4', '', '20/04/2021', 55000, '', '', 'Pagadas'),
(263, 'Gildardo Antonio Gaviria Londo¤o', '70754279', '3206551820', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.25', 'Vereda La Clara. Finca La Nubia', '6.2713936,-75.4267178', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '17/04/2021', 80000, '', '', 'Pagadas'),
(264, 'Roman Horacio Hoyos Villegas', '92539010', '3226014557', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.33.77', 'Vereda La Clara', '6.270931,-75.418351', 'PCQ Facturacion 01/05 Organo', 'E4:8D:8C:FF:A1:19', '', 'GUCHO2', '', '16/04/2021', 65000, '', '', 'Pagadas'),
(265, 'Edison Augusto Robledo Vargas', '70753145', '3014080661', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.18.14', 'Vereda La Brizuela parte baja', '6.272995,-75.447299', 'PCQ Facturacion 15/20 Yolombal', 'E4:8D:8C:B4:9D:07', '', 'SAGUSE', '', '16/04/2021', 80000, '', '', 'Pagadas'),
(266, 'Julio Alberto Arias Agudelo', '70752949', '3146894904', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.135', 'Vereda San Jose, Puerta Roja', '6.235108,-75.446365', 'PCQ Facturacion 15/20 Organo', '4C:5E:0C:A7:E7:9D', '', 'GUMO', '', '16/04/2021', 80000, '1Pago, $80000.00', '#11739 - 15/09/2021', 'Pendiente de Pago'),
(267, 'Maria de Los Dolores Cano de Ceballos', '21470200', '3127147181', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.25.71', 'Vereda La Clara', '6.270927,-75.417037', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:0A:E7:96', '', 'GUCHO', '', '16/04/2021', 135000, '1Pago, $135000.00', '#11749 - 15/09/2021', 'Pendiente de Pago'),
(268, 'Mateo Cardona Gaviria', '1001416000', '3016107683, 3125860814', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.68', 'Vereda La Clara', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '15/04/2021', 80000, '', '', 'Pagadas'),
(269, 'Lina Marcela Ocampo Bustamante', '1035911448', '3225577437', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.67', 'Vereda La Clara', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '15/04/2021', 70000, '', '', 'Pagadas'),
(270, 'Carlos Andres Londo¤o Amaya', '1035911890', '3003510395', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.66', 'Plaza de mercado local 289. 2do Piso', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '14/04/2021', 70000, '1Pago, $70000.00', '#11725 - 15/09/2021', 'Pendiente de Pago'),
(271, 'Maria Patricia Lopez Franco', '42881089', '3127330464', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.65', 'Vereda La Clara, Parcelaci¢n los cisnes. Finca El lago de los cisnes', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '13/04/2021', 80000, '', '', 'Pagadas'),
(272, 'Juan Pablo Londo¤o Gallego', '1035916687', '3226623409', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.63', 'Vereda La clara', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '13/04/2021', 80000, '', '', 'Pagadas'),
(273, 'Diana Caterine Vasquez Amaya', '43977500', '3104189199', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.12.95', 'Vereda San Jose', '6.235715,-75.451147', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:90:AC:F1', '', 'GUGU', '', '13/04/2021', 135000, '', '', 'Pagadas'),
(274, 'Luis Fernando Castro Molina', '8308954', '3014198808', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.35', 'Vereda La clara, casa 216', '6.262545,-75.418585', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '13/04/2021', 70000, '', '', 'Pagadas'),
(275, 'Luzmila Yaneth Ochoa Ochoa', '43210311', '3224233203, 3227486057', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.15.127', 'Vereda Yolombal', '6.320953,-75.396848', 'PCQ Facturacion 15/20 Organo', '68:D7:9A:92:DB:26', '', 'GUYO3', '', '12/04/2021', 70000, '', '', 'Pagadas'),
(276, 'Bryan Stiven Londo¤o Aristizabal', '1017249156', '3143638760', '120 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.60', 'Carrera 45 # 49-31 interior 302, ( cerca de Jaiverde )', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '10/04/2021', 120000, '', '', 'Pagadas'),
(277, 'Oscar Dario Osorio Londo¤o', '98564478', '3502268430', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.6.22', 'Vereda La Clara', '6.262933,-75427451', 'PCQ Facturacion 01/05 Organo', '74:D4:28:4E:06:A7', '', 'GUSI', '', '8/04/2021', 80000, '', '', 'Pagadas'),
(280, 'Henry Jaramillo Sanchez', '15436934', '3225226364', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.17.35', 'Vereda Mampuesto, Rionegro', '6.215399,-75.381460', 'PCQ Facturacion 01/05 Organo', '74:4D:28:4E:04:D7', '', 'GUSU', '', '8/04/2021', 65000, '', '', 'Pagadas'),
(281, 'Jonathan David Silva Marin', '1035918187', '3023618185', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.55', 'Calle 47 # 50 07. 2do piso, Barrio san Francisco', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '8/04/2021', 70000, '1Pago, $70000.00', '#11723 - 15/09/2021', 'Pendiente de Pago'),
(282, 'Esteban Bedoya Houfer Bedoya-Miguel Bedoya', '1152452615', '3148928928', 'Plan 6 Megas', '', 'Gratis', '', '', '', '172.30.4.15', 'Vereda la Clara, Finca El Sendero', '6.274525,-75.421143', 'PCQ Facturacion 01/05 Organo', 'E4:8D:8C:60:F5:9D', '', 'GUCA', '', '8/04/2021', 80000, '', '', 'Pagadas'),
(283, 'Kapok Trade S.A.S', '900891190', '3155072938', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.15.22', 'Vereda Yolombal', '6.328248,-75.400670', 'PCQ Facturacion 15/20 +IVA Yolombal', '68:D7:9A:92:EF:73', '', 'GUYO3', '', '7/04/2021', 80000, '', '', 'Pagadas'),
(284, 'Gloria Cecilia Bernal Hernandez', '43030739', '3105224946', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.9.23', 'Vereda Yolombal, al frente del colegio Ezequiel sierra', '6.316023,-75.395690', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:F0:B8:38', '', 'GUYO1', '', '7/04/2021', 70000, '', '', 'Pagadas'),
(285, 'Norley de Jesus Gallo Acevedo', '71706667', '3012437563', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.13', 'Cra 49 49-53', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '6/04/2021', 70000, '1Pago, $70000.00', '#11737 - 15/09/2021', 'Pendiente de Pago'),
(286, 'Sindy Yuliana Atehortua Durango', '1035911361', '3137378560', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.4.90', 'Vereda La Clara, Acueducto de Aguas Residuales (sector puente real via la clara)', '6.267551,-75.434964', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:B7:56:57', '', 'GUCA', '', '6/04/2021', 70000, '', '', 'Pagadas'),
(287, 'Andres Quintero Gomez', '8163876', '3167428418', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.53', 'Vereda La clara, Finca La Cuquita', '', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '5/04/2021', 90000, '', '', 'Pagadas'),
(288, 'Carlos Alberto Hincapie Franco', '71788734', '3128347612', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.147', 'Vereda San Jose, Condominio Terrasanta Casa11', '6.246137,-75.447604', 'PCQ Facturacion 15/20 Organo', '64:D1:54:74:D9:35', '', 'GUMO', '', '5/04/2021', 80000, '', '', 'Pagadas'),
(289, 'HOTEL EL OCASO COLOMBIA SAS', '901448138', '3506323096, 3225378897', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.90', 'CL 29 Nø27 29 P 3', '6.171598,-75.3344109', 'PCQ Facturacion 01/05 +IVA Organo', '', '', 'GUSU', '', '5/04/2021', 80000, '', '', 'Pagadas'),
(290, 'Blanca Yaneth Araque Rios', '43212347', '3122404859', '10 MEGAS FIBRA OPTICA', '', 'Gratis', '', '', '', '192.168.102.52', 'Vereda La Clara, al lado de la profesora', '6.268188,-75.420704', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '2/04/2021', 60000, '', '', 'Pagadas'),
(291, 'Duvan Estiven Fernandez Medina', '1234639749', '3219199975', 'Plan 8 Megas', '', 'Activo', '', '', '', '192.168.36.254', 'Batall¢n JDC. Casona Oficina Inteligencia', '', 'PCQ Facturacion 01/05 Organo', '', '', 'JDC', '', '1/04/2021', 110000, '', '', 'Pagadas'),
(292, 'Yeison Alexander Alzate Velasquez', '1036943192', '3007790378', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.51', 'Cll 47 Cra 50 31 (Interior 202) Barrio San Francisco', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '31/03/2021', 70000, '', '', 'Pagadas'),
(293, 'John Jairo Montoya Jaramillo', '15511405', '3014321830', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.123', 'Vereda Guapante arriba', '6.264210,-75.405956', 'PCQ Facturacion 15/20 Organo', '4C:5E:0C:A7:F3:7B', '', 'GUSE2', '', '30/03/2021', 80000, '1Pago, $80000.00', '#11766 - 15/09/2021', 'Pendiente de Pago'),
(294, 'German Alonso Zapata Carmona', '70327730', '3164776004', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.3.67', 'Vereda La clarita, Finca Nø208 El Conde', '6.260717,-75.420073', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:AC:B5:BB', '', 'GUSA', '', '26/03/2021', 70000, '', '', 'Pagadas'),
(295, 'Diego Armando Romero Uribe', '1095803517', '3045330412', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.2.30', 'Batallon JDC, Oficina del 4 Log¡stica', '6.209521,-75.390544', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FF:7D:CB', '', 'GURI', '', '26/03/2021', 80000, '', '', 'Pagadas'),
(296, 'Teresa de Jesus Ruiz Castrillon', '22228879', '3116659411', 'Plan 3 Megas', '', 'Gratis', '', '', '', '172.30.32.17', 'Vereda La Enea, JAC LA ENEA', '', 'PCQ Facturacion 15/20 Yolombal', 'B8:69:F4:5F:9F:55', '', 'GUYO5', '', '25/03/2021', 55000, '', '', 'Pagadas'),
(297, 'Leon Jairo Marin Palacio', '3410422', '3128584415', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.97', 'Vereda La Caba¤a, Guarne', '6.285291,-75.450813', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:96:A4:95', '', 'SAGUSE', '', '25/03/2021', 80000, '', '', 'Pagadas'),
(298, 'Laura Medina Correa', '1040741177', '3042908449', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.50', 'Parcelaci¢n los Cisnes, Finca el Anhelo Nø21', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '25/03/2021', 80000, '', '', 'Pagadas'),
(299, 'Dayana Morales Montoya', '1036646328', '3202634408', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.2.60', 'Batallon JDC', '', 'PCQ Facturacion 01/05 Organo', '64:D1:54:AE:37:6B', '', 'GURI', '', '24/03/2021', 80000, '', '', 'Pagadas'),
(300, 'David Gustavo Salazar Rodriguez', '80083866', '3165030721', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.6.21', 'Vereda La clara', '6.263337,-75.426913', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:9B:8B:DA', '', 'GUSI', '', '20/03/2021', 135000, '', '', 'Pagadas'),
(301, 'Sandra Milena Rozo Lizcano', '1102361041', '3135576526', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.18', 'Batall¢n JDC, Casa Fiscal Apartamentos 102 Piso 1', '6.207428,-75.391400', 'PCQ Facturacion 01/05 Organo', '64:D1:54:AE:35:F3', '', 'GUSU', '', '19/03/2021', 80000, '', '', 'Pagadas'),
(302, 'Jose Daniel Arias Serna', '1035918204', '3146191486', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.49', 'Cra 50 N41 a 30 Apto 502', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '19/03/2021', 80000, '', '', 'Pagadas'),
(303, 'Giovanny Cardona Giraldo', '3396284', '3148140762', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.33.32', 'Reserva la Clara, Lote 19 Vereda La Clara', '6.259241,-75.420008', 'PCQ Facturacion 15/20 + Iva Chorrera', 'B8:69:F4:5F:B0:E7', '', 'GUCHO2', '', '19/03/2021', 70000, '', '', 'Pagadas'),
(304, 'Luz Elena Orozco Sierra', '32419960', '3113728546', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.48', 'Parcelacion Los Cisnes, Finca 15. Vereda La Clara', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '19/03/2021', 70000, '1Pago, $70000.00', '#11828 - 15/09/2021', 'Pendiente de Pago'),
(305, 'Valeria Roldan Pineda', '1035919244', '3137925902', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.8.76', 'San Antonio Parte Alta / Mirador de San Nicolas', '6.278975,-75.438529', 'PCQ Facturacion 01/05 San Bernardo', '64:D1:54:BC:12:A6', '', 'GUTO', '', '19/03/2021', 80000, '', '', 'Pagadas'),
(306, 'David Alejandro Alzate Serna', '1116269263', '3155827511', 'Plan 3 Megas', '', 'Cancelado', '', '', '', '172.30.30.250', 'Calle 6 N 22 D 21', '', 'PCQ Facturacion 15/20 Chorrera', '', '', '', '', '18/03/2021', 55000, '', '', 'Pagadas'),
(307, 'Soraida Duque Cifuentes', '1036839433', '3137769273', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.33.29', 'Vereda Canoas', '', 'PCQ Facturacion 15/20 Chorrera', '64:D1:54:BC:2E:F2', '', 'GUCHO2', '', '18/03/2021', 70000, '', '', 'Pagadas'),
(308, 'Diego Alejandro Tamayo Velez', '71741910', '3105398325', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.19', 'Cra 52 N 49 01', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '18/03/2021', 70000, '1Pago, $70000.00', '#11706 - 15/09/2021', 'Pendiente de Pago'),
(309, 'Jhon Alberto Herrera Osorio', '15447956', '3122027266', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.21', 'Cra 51 N 43 15', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '17/03/2021', 90000, '1Pago, $90000.00', '#11701 - 15/09/2021', 'Pendiente de Pago'),
(310, 'Victor Manuel Henao Rios', '1035917444', '3148878469', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.47', 'Cra 51 N 45 41', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '17/03/2021', 80000, '', '', 'Pagadas'),
(311, 'Gustavo Marin', '8290266', '3234953323', 'Plan 8 Megas', '', 'Cancelado', '', '', '', '172.30.18.222', 'Vereda La Pastorcita', '6ø15ï44.0\"N 75ø20ï57.3\"W', 'PCQ Facturacion 01/05 Organo', '74:4D:28:44:19:21', '', 'SAGUSE', '', '16/03/2021', 110000, '', '', 'Pendiente de Pago'),
(312, 'Luis Camilo Sanchez Pe¤a', '1001969870', '3505666715, 3024253160', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.25.80', 'Vereda Chaparral', '6.257493,-75.375083', 'PCQ Facturacion 15/20 Chorrera', 'CC:2D:E0:AC:AD:79', '', 'GUCHO', '', '15/03/2021', 80000, '', '', 'Pagadas'),
(313, 'Jaime Andres Barco Sanchez', '71361836', '3016008557, 3157823182', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.43', 'Parcelaci¢n, finca Los Lagos', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '15/03/2021', 70000, '1Pago, $70000.00', '#11708 - 15/09/2021', 'Pendiente de Pago'),
(314, 'Gloria Ines Lopez Ruiz', '32348936', '3002122707', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.41', 'Parcelaci¢n Los Cisnes Vereda la Clara', '', 'ROUTER FIBRA FTTH 15/20 + IVA', '', '', '', '', '13/03/2021', 80000, '', '', 'Pagadas'),
(315, 'Martha Lilian Gutierrez Velasquez', '43437084', '3126015931', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.31.45', 'Vereda Yolombal Detras de Camilo Ochoa', '6.327111,-75.398954', 'PCQ Facturacion 15/20 Yolombal', 'B4:FB:E4:32:31:E7', '', 'GUYO4', '', '13/03/2021', 110000, '', '', 'Pagadas'),
(316, 'Edison de Jesus Gallego Casta¤o', '15431772', '3046719218, 3112034553', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.44', 'Cra 51 N 43 32 Apto 201', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '13/03/2021', 80000, '', '', 'Pagadas'),
(317, 'Elizabeth Jaramillo Rios', '43211692', '3014192286', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.42', 'Cra 52 N 43 28', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '13/03/2021', 90000, '1Pago, $90000.00', '#11724 - 15/09/2021', 'Pendiente de Pago'),
(318, 'Roberto de Jesus Sanchez Montoya', '8308549', '3016008557', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.40', 'Parcelacion Los Cisnes, Finca los Lagos', '', 'ROUTER FIBRA FTTH 15/20 + IVA', '', '', '', '', '13/03/2021', 70000, '', '', 'Pagadas'),
(321, 'Matilde Eugenia Diaz Galindo', '43755062', '3148846404', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.32.18', 'Vereda La Enea. Finca 16', 'B8:69:F4:5F:50:7B', 'PCQ Facturacion 01/05 Yolombal', '', '', 'GUYO5', '', '10/03/2021', 80000, '', '', 'Pagadas'),
(322, 'Jose Aldemar Castrillon Zapata', '70757045', '3176243449', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.32.22', 'Vereda El Palmar Parte Alta', '6.336248,-75.422689', 'PCQ Facturacion 15/20 Yolombal', 'B8:69:F4:B7:74:83', '', 'GUYO5', '', '10/03/2021', 70000, '', '', 'Pagadas'),
(323, 'Hector Fredy Gomez Sanchez', '70549127', '3136873535', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.32.20', 'Vereda la Enea Frente a la Escuela', '6.334009,-75.404328', 'PCQ Facturacion 15/20 Yolombal', '', '', 'GUYO5', '', '9/03/2021', 80000, '', '', 'Pagadas'),
(324, 'Carlos Andres Henao Londo¤o', '1022032703', '3108977411', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.38', 'Vereda La clara, Parcelaci¢n los cisnes. Finca Sorrento', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '9/03/2021', 80000, '', '', 'Pagadas'),
(325, 'Juan Guillermo Gallego Gallego', '15443866', '3016189898', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.37', 'Calle 52 N 46 A 195', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '6/03/2021', 80000, '', '', 'Pagadas'),
(326, 'Lisset Lorena Marin Tamayo', '1044100383', '3016838676', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.31.56', 'Vereda Yolombal', '6.320747,-75.398933', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:9F:1E:DD', '', 'GUYO4', '', '6/03/2021', 70000, '1Pago, $70000.00', '#11736 - 15/09/2021', 'Pendiente de Pago'),
(327, 'Juan Camilo Duran Zapata', '70757047', '3105416298', '30 MEGAS FIBRA OPTICA', '', 'Suspendido', '', '', '', '192.168.101.17', 'Cra 51 N 44 04', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '6/03/2021', 70000, '1Pago, $70000.00', '#11595 - 01/09/2021', 'Pendiente de Pago'),
(328, 'Wilmar Adolfo Salazar Ochoa', '1035910237', '3148493981', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.21', 'Vereda Yolombal por los rieles', '6.317141,-75.397037', 'PCQ Facturacion 01/05 Yolombal', '', '', 'GUYO1', '', '4/03/2021', 80000, '', '', 'Pagadas'),
(329, 'Wilman Arturo Gomez Mu¤oz', '98641400', '3217220707', 'Plan dinamico 3 - 10 Megas', '', 'Activo', '', '', '', '172.30.15.15', 'Vereda Yolombal', '6.324784,-75.402110', 'PCQ Facturacion 15/20 Yolombal', 'B4:FB:E4:33:2B:1E', '', 'GUYO3', '', '4/03/2021', 85000, '1Pago, $85000.00', '#11742 - 15/09/2021', 'Pendiente de Pago'),
(330, 'Samuel Mauricio Garcia Ospina', '1001415179', '3126128233', 'Plan 5 Megas', '', 'Suspendido', '', '', '', '172.30.33.39', 'Vereda La Mosca', '6.223143,-75.422861', 'PCQ Facturacion 01/05 Chorrera', '', '', 'GUCHO2', '', '4/03/2021', 70000, '1Pago, $70000.00', '#11303 - 01/09/2021', 'Pendiente de Pago'),
(331, 'Laura Victoria Jaramillo Cardona', '1035912950', '3113609875', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.18.30', 'San Antonio parte alta', '6.276451,-75.434850', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:66:D9:41', '', 'SAGUSE', '', '3/03/2021', 70000, '', '', 'Pagadas'),
(332, 'Juan Carlos Restrepo Marin', '8401442', '3007763124', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.30', 'Vereda la Clara. Parcelaci¢n Los cisnes. Finca 01', '', 'ROUTER FIBRA FTTH 01/05 + IVA', '', '', '', '', '2/03/2021', 70000, '', '', 'Pagadas'),
(333, 'Daniela Rivera Rivera', '1035921599', '3145976612', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.32', 'Calle 45 N 49 26\nBarrio San Francisco', '', 'ROUTER FIBRA FTTH 15/20', '5C:3A:3D:78:36:EB', '', '', '', '2/03/2021', 70000, '', '', 'Pagadas'),
(334, 'Luis Alberto Quiceno Villegas', '71673955', '3183621778', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.29', 'Parcelacion los Cisnes, Vereda la Clara', '', 'ROUTER FIBRA FTTH 15/20 + IVA', '5C:3A:3D:33:2E:24', '', '', '', '2/03/2021', 70000, '', '', 'Pagadas'),
(335, 'Parcelacion Ecovilla 2', '901434444', '3217596803', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.50', 'Vereda La Mosquita Km5 471 VTE Guarne', '6.212335,-75.439581', 'PCQ Facturacion 01/05 +IVA Organo', 'CC:2D:E0:F4:E5:61', '', 'GUMO', '', '1/03/2021', 80000, '', '', 'Pagadas'),
(336, 'Albeiro de Jesus Isaza Bedoya', '70755621', '3508446603', 'Plan 4 Megas Volante', '', 'Activo', '', '', '', '172.30.28.18', 'Vereda Guapante', '6.283802,-75.401904', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:61:58:55', '', 'GUSE2', '', '1/03/2021', 60000, '', '', 'Pagadas'),
(337, 'Jose Yamid Gonzalez Quintero', '98677228', '3137140244', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.24', 'Vereda Guapante', '6.300038,-75.406775', 'PCQ Facturacion 15/20 Organo', 'C4:AD:34:F5:8C:F9', '', 'GUSE2', '', '1/03/2021', 65000, '', '', 'Pagadas'),
(338, 'Claudia Alejandra Vargas Quiroz', '39450945', '3007071252', '120 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.25', 'Calle 45 N 49 16 San Francisco', '', 'ROUTER FIBRA FTTH 15/20', '5C:3A:3D:78:36:F3', '', '', '', '27/02/2021', 120000, '', '', 'Pagadas'),
(339, 'John Jairo Orozco Aguirre', '70098601', '3113639772', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.26', 'Parcelacion los Cisnes, Vereda la Clara', '', 'ROUTER FIBRA FTTH 01/05', '5C:3A:3D:33:2C:EC', '', '', '', '27/02/2021', 90000, '', '', 'Pagadas'),
(340, 'Carlos Daniel Posada Duque', '70550204', '3006530935', 'Plan dinamico 3 - 10 Megas', '', 'Activo', '', '', '', '172.30.18.234', 'Vereda La Pascuita', '6.270038,-75.445054', 'PCQ Facturacion 15/20 +IVA Organo', 'B8:69:F4:D1:F5:BD', '', 'SAGUSE', '', '27/02/2021', 85000, '1Pago, $101150.00', '#11734 - 15/09/2021', 'Pendiente de Pago'),
(341, 'Luis Maria Perez Duran', '1019008688', '3044860007', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.25', 'Vereda San Jose', '6.248571,-75.451305', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:08:7F:D5', '', 'SAGUSE', '', '24/02/2021', 80000, '', '', 'Pagadas'),
(342, 'Jose Cristobal Fonseca Barbosa', '79748301', '3013077404', 'PLAN 10 MEGAS PCQ CORONEL FONSECA', '', 'Cancelado', '', '', '', '172.30.6.12', 'Rionegro', '6.266674,-75.437422', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FF:88:A7', '', 'GUSI', '', '23/02/2021', 90000, '', '', 'Pagadas'),
(343, 'Yosahana Lopez Jaramillo', '22502861', '3108202400', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.25', 'Vereda Mampuesto', '6.208275,-75.407306', 'PCQ Facturacion 01/05 Organo', '74:4D:28:42:CB:BD', '', 'GUSU', '', '22/02/2021', 80000, '1Pago, $80000.00', '#11400 - 01/09/2021', 'Pagadas'),
(344, 'Gloria Patricia Giraldo Alvarez', '1036924800', '3506330519', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.18.22', 'Guarne Via Medellin Bogota', '6.273377,-75.439522', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:6A:35:31', '', 'SAGUSE', '', '22/02/2021', 55000, '1Pago, $55000.00', '#11780 - 15/09/2021', 'Pendiente de Pago'),
(345, 'Andres David Risue¤o Valencia', '1061737630', '3232904590', '30 MEGAS FIBRA OPTICA', '', 'Cancelado', '', '', '', '192.168.102.24', 'CRA 51 N 46 12', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '20/02/2021', 70000, '', '', 'Pendiente de Pago'),
(346, 'Jhon Alejandro Leon Osorio', '98766317', '3205853986', '10 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.22', 'Calle 46 N 50 11', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '19/02/2021', 60000, '', '', 'Pagadas'),
(347, 'Marlon Andres Perez Orrego', '1035918337', '3016241165', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.23', 'Calle 46 N§ 50 04', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '19/02/2021', 70000, '1Pago, $70000.00', '#11296 - 01/09/2021', 'Pendiente de Pago'),
(348, 'July Adelaida Posada Duque', '1038404065', '3113373399', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.15', 'calle 45 N§ 49 24, Barrio San Francisco', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '19/02/2021', 70000, '', '', 'Pagadas'),
(349, 'Juan Pablo Gonzalez Bernal', '71755544', '3195557866', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.21', 'Vereda La Clara', '6.260130,-75.415376', 'PCQ Facturacion 15/20 Chorrera', 'B8:69:F4:40:8F:DC', '', 'GUCHO2', '', '19/02/2021', 80000, '1Pago, $80000.00', '#11961 - 15/09/2021', 'Pendiente de Pago'),
(350, 'Jose Angel Gonzalez Torres', '8236421', '3012968609', '30 MEGAS FIBRA OPTICA', '', 'Suspendido', '', '', '', '192.168.102.20', 'Vereda La Clara', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '18/02/2021', 70000, '1Pago, $70000.00', '#10601 - 01/08/2021', 'Pendiente de Pago');
INSERT INTO `telemercadeoclientes` (`id`, `nombre`, `cedula`, `telefono`, `plan`, `estado`, `estado_contrato`, `estadoLLamada`, `tipificacion`, `observaciones`, `ip`, `direccion`, `coordenadas`, `router`, `mac`, `seguimiento`, `sectorial`, `observaciones_seguimiento`, `fecha_instalación`, `precio_plan`, `pendiente_pago`, `ultima_factura`, `estado_factura`) VALUES
(351, 'Edison Rolando Gonzalez Ocampo', '70905275', '3218429896', 'Plan 5 Megas', '', 'Suspendido', '', '', '', '172.30.12.23', 'Vereda Toldas', '6.250167,-75.447055', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:9F:57', '', 'GUGU', '', '18/02/2021', 70000, '', '', 'Pagadas'),
(352, 'Miriam Janeth Gomez Suarez', '1039095106', '3116548997, 3137830920', 'Plan 8 Megas', '', 'Suspendido', '', '', '', '172.30.7.53', 'Vereda San Jos‚', '6.250167,-75.447055', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:B7:74:B1', '', 'GUMO', '', '18/02/2021', 110000, '1Pago, $110000.00', '#10370 - 15/07/2021', 'Pendiente de Pago'),
(353, 'Claudia Yaneth Valencia Lopez', '39454886', '3147993577', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.33.53', 'Vereda la Mosquita', '6.219293,-75.426166', 'PCQ Facturacion 15/20 Chorrera', 'CC:2D:E0:66:D6:E9', '', 'GUCHO2', '', '18/02/2021', 65000, '', '', 'Pagadas'),
(354, 'Leonardo Fabio Montoya Sanchez', '70756005', '3137459224', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.10', 'Calle 45 # 50-13, Barrio San Francisco', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '18/02/2021', 70000, '', '', 'Pagadas'),
(355, 'Deisy Salazar Hoyos', '44004509', '3147856373', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.26.19', 'Vereda El Salado, al lado de la finca 114', '6.2837489,-75.4594967', 'PCQ Facturacion 01/05 San Bernardo', '48:8F:5A:6F:AE:11', '', 'GUAVI', '', '17/02/2021', 135000, '', '', 'Pagadas'),
(356, 'Juan Federico Avenda¤o Yarce', '70063956', '3117167860', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.12', 'Vereda la Brizuela, finca 12', '6.263014,-75.461106', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:B9:89:13', '', 'SAGUSE', '', '17/02/2021', 80000, '', '', 'Pagadas'),
(357, 'Jorge Andres Bedoya Escobar', '1037588778', '3144344757', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.14', 'Cra 51 NA 44 32, Cabecera Municipal', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '17/02/2021', 90000, '', '', 'Pagadas'),
(358, 'Wilmar Arley Hincapie Saenz', '15445672', '3218571597', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.33.222', 'Vereda La Mosquita', '6.210641,-75.443362', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:5F:9F:63', '', 'GUCHO2', '', '16/02/2021', 65000, '', '', 'Pagadas'),
(359, 'Miguel Dario Ossa Ossa', '70757266', '3136127386', '50 MEGAS FIBRA OPTICA', '', 'Suspendido', '', '', '', '192.168.102.18', 'Vereda la Clara', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '16/02/2021', 80000, '1Pago, $80000.00', '#11079 - 15/08/2021', 'Pendiente de Pago'),
(360, 'Erika Alejandra Garcia Cardona', '1035915772', '3104092014, 3106452447', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.19', 'Vereda la Clara', '6.2686189,-75.4226548', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '16/02/2021', 70000, '1Pago, $70000.00', '#11830 - 15/09/2021', 'Pagadas'),
(361, 'Alejandra Maria Alzate Grisales', '1035912413', '3012651900', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.36', 'Vereda La Mosquita Alto Gordo', '6.219281,-75.426254', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:06:35:55', '', 'GUGU', '', '16/02/2021', 80000, '', '', 'Pagadas'),
(362, 'Catalina Maria Alvarez Zapata', '43569102', '3013751321', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.31', 'Vereda La Clara 14-111', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '16/02/2021', 70000, '', '', 'Pagadas'),
(363, 'Natalia Regina Mesa Herrera', '43548620', '3015283238', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.12', 'Vereda la Clara sector los Garcia', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '16/02/2021', 70000, '1Pago, $70000.00', '#11959 - 15/09/2021', 'Pendiente de Pago'),
(364, 'Stevens Alfonso Berdugo Alvarez', '1037582699', '3148422798', 'Plan 15 Megas', '', 'Activo', '', '', '', '172.30.33.56', 'Vereda La Clara\nCerca donde voltean las busetas (V¡a hacia El Organo)', '6.269250392913818,-75.41439056396484', 'PCQ Facturacion 01/05 Chorrera', 'CC:2D:E0:66:D7:55', '', 'GUCHO2', '', '15/02/2021', 150000, '', '', 'Pagadas'),
(365, 'Eduardo Duque Becerra', '8294875', '3104624554', '30 MEGAS FIBRA OPTICA', '', 'Gratis', '', '', '', '192.168.102.10', 'Vereda La Clara finca El Pomar del Duque', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '13/02/2021', 70000, '', '', 'Pagadas'),
(366, 'Quimberly Gutierrez Casta¤o', '39449235', '3137520387', 'Plan 4 Megas', '', 'Suspendido', '', '', '', '172.30.2.25', 'Vereda Chaparral (La virgen)', '6.2358117,-75.4004817', 'PCQ Facturacion 01/05 Organo', 'C4:AD:34:94:34:DD', '', 'GURI', '', '11/02/2021', 65000, '1Pago, $65000.00', '#11617 - 01/09/2021', 'Pendiente de Pago'),
(367, 'Mabel Constanza Ledesma Bermudez', '1075269446', '3167526717', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.17.238', 'Batallon Juan Del Corral / Bloque 6', '6.206757,-75.391639', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:DA:D5', '', 'GUSU', '', '10/02/2021', 70000, '', '', 'Pagadas'),
(368, 'Yeison Ortega Rodriguez', '1075653731', '3116314492', 'Plan 5 Megas', '', 'Suspendido', '', '', '', '172.30.17.230', 'Batallon Juan del Corral / Casa De Suboficiales Bloque 6', '6.206757,-75.391639', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:57:DA:D5', '', 'GUSU', '', '10/02/2021', 70000, '1Pago, $70000.00', '#11629 - 01/09/2021', 'Pendiente de Pago'),
(369, 'Jessica Tatiana Quintero Gallego', '1035911527', '3136576110', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.173', 'Vereda La Clara Al Frente De La 519', '6.26708,-75.414668', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '6/02/2021', 80000, '', '', 'Pagadas'),
(370, 'Gloria Patricia Pulgarin Ossa', '43794236', '3127795793', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.26.55', 'Vereda Salado Parte Alta', '6.287950,-75.467136', 'PCQ Facturacion 15/20 San Bernardo', '48:8F:5A:6F:C5:2D', '', 'GUAVI', '', '6/02/2021', 80000, '', '', 'Pagadas'),
(371, 'Inversiones Tracto Express Ltda', '813008405', '3152523203', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.31.4.25', 'Mall Los Comuneros Local 2', '', 'PCQ Facturacion 01/05 + Iva Chorrera', '74:DA:88:19:1A:B4', '', '', '', '5/02/2021', 70000, '', '', 'Pagadas'),
(372, 'Asociacion de Usuarios Del Acueducto Veredal San Jose', '800239626', '3003589509', 'PLAN 8 MEGAS ACUEDUCTO SAN JOSE', '', 'Activo', '', '', '', '172.30.7.60', 'Vereda San Jose / Acuedudcto San Jose', '6.241732,-75.452507', 'PCQ Facturacion 01/05 +IVA Organo', 'B8:69:F4:FF:F2:27', '', 'GUMO', '', '3/02/2021', 92436, '', '', 'Pagadas'),
(373, 'Juan Camilo Machado Cardona', '71794478', '3114034622', 'Plan 10 Megas Julio', '', 'Activo', '', '', '', '192.168.102.14', 'Vereda La Clara\nFinca Alejandro Duque casa #2', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '3/02/2021', 80000, '', '', 'Pagadas'),
(374, 'Doralba David Zapata', '52970291', '3118887963', 'Plan 3 Megas', '', 'Cancelado', '', '', '', '172.30.17.22', 'Vereda Los Pinos / Finca 98', '6.209390,-75.345721', 'PCQ Facturacion 01/05 +IVA Organo', 'B8:69:F4:FF:88:8B', '', 'GUSU', '', '2/02/2021', 55000, '', '', 'Pagadas'),
(375, 'Dahiana Carolina Florez Isaza', '1035917752', '3126252425', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.28.77', 'Vereda Guapante Arriba\nPor la Trinidad', '6.276450,-75.406019', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:DB:31', '', 'GUSE2', '', '1/02/2021', 55000, '', '', 'Pagadas'),
(376, 'German David Isaza Ochoa', '1088249781', '3012203938', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.123', 'Vereda Yolombal Cerca de la Iglesia', '6.318937,-75.399163', 'PCQ Facturacion 01/05 Yolombal', 'E0:63:DA:9E:0F:60', '', 'GUYO1', '', '1/02/2021', 80000, '', '', 'Pagadas'),
(377, 'Francisco Javier Hincapie Herrera', '1036960657', '3127559543', 'Plan 6 Megas', '', 'Gratis', '', '', '', '172.30.23.78', 'Vereda La Mosquita / Acueducto', '6.207374,-75.449152', 'PCQ Facturacion 15/20 Chorrera', 'E0:63:DA:9E:11:3E', '', 'GUSEMO Ubiquiti', '', '29/01/2021', 80000, '', '', 'Pagadas'),
(378, 'Juliana Moreno Botero', '43985432', '3045652555', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.13', 'Vereda La Mosquita, Finca La Chiqui', '6.258126,-75.436033', 'PCQ Facturacion 15/20 Chorrera', 'CC:2D:E0:AC:B2:8F', '', 'GUCHO2', '', '28/01/2021', 80000, '', '', 'Pagadas'),
(379, 'Jesus Alberto Duque Gomez', '70065466', '3154236222', 'Plan 8 Megas Condominio El Porvenir', '', 'Activo', '', '', '', '172.30.24.19', 'Condominio Ecologico El Porvenir, casa 18', '6.265812,-75.448609', 'PCQ Facturacion 01/05 Organo', 'E0:63:DA:46:16:96', '', 'COELPORVENIR', '', '28/01/2021', 90000, '', '', 'Pagadas'),
(380, 'Julian Andres Herrera Herrera', '1035922620', '3145974253', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.60', 'Vereda Guapante Arriba, cerca al cruce con Guapante Abajo', '6.300495,-75.418316', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:DB:41', '', 'GUSE2', '', '27/01/2021', 80000, '', '', 'Pagadas'),
(381, 'Miguel Angel Cruz Velandia', '74381425', '3212913695', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.22.51', 'Batallon Juan de Corral Bloque3 casa 4. Cerca a casino de suboficiales', '6.182773,-75.367440', 'PCQ Facturacion 01/05 Organo', '74:83:C2:5A:9D:73', '', 'JDC', '', '25/01/2021', 80000, '', '', 'Pagadas'),
(382, 'Luz Patricia Calle Rave', '21409603', '3006521933', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.12.21', 'Vereda Hoja Anchas Finca 276', '6.242034,-75.426351', 'PCQ Facturacion 15/20 Organo', '64:D1:54:BC:1E:60', '', 'GUGU', '', '22/01/2021', 135000, '', '', 'Pagadas'),
(383, 'Laura Maria Montoya Velez', '43876314', '3165776087', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.31.17', 'Vereda Yolombal', '6.315961,-75.408017', 'PCQ Facturacion 01/05 Yolombal', 'F4:92:BF:3A:AF:82', '', 'GUYO4', '', '22/01/2021', 135000, '', '', 'Pagadas'),
(384, 'Yuli Paulina Escobar Diaz', '1035911213', '3502827788', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.9.140', 'Vereda Yolombal, primera casa despues del sector', '6.319339, -75.400847', 'PCQ Facturacion 15/20 Yolombal', 'F4:92:BF:3A:8C:CD', '', 'GUYO1', '', '21/01/2021', 55000, '1Pago, $55000.00', '#11754 - 15/09/2021', 'Pendiente de Pago'),
(385, 'Ana Maria Restrepo Ospina', '43874085', '43874085', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.15.234', 'Vereda La Enea', '6.331216,-75.397912', 'PCQ Facturacion 15/20 Yolombal', 'F4:92:BF:E0:BA:AD', '', 'GUYO3', '', '16/01/2021', 135000, '', '', 'Pagadas'),
(386, 'Edison Javier Alcaraz Arango', '1128058857', '3122702575', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.32.123', 'Vereda La Enea Finca Maria Ema', '6.3322795,-75.4035461', 'PCQ Facturacion 15/20 Yolombal', 'B8:69:F4:FF:F2:2B', '', 'GUYO5', '', '16/01/2021', 80000, '', '', 'Pagadas'),
(387, 'Gisela Maria Quintero Gaviria', '1028009393', '3156974834', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.12.40', 'Vereda Hojas Anchas\nCerca a la pista de motocross', '6.240351,-75.433172', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FF:88:AB', '', 'GUGU', '', '13/01/2021', 135000, '', '', 'Pagadas'),
(388, 'Jorge Andres Arango Gallego', '71772677', '3005641982', 'Plan 6 Megas', '', 'Suspendido', '', '', '', '172.30.3.105', 'Vereda La Clara Finca La Fortunata', '6.261496,-75.423223', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FF:88:91', '', 'GUSA', '', '8/01/2021', 80000, '1Pago, $80000.00', '#11408 - 01/09/2021', 'Pendiente de Pago'),
(389, 'Diego Rene Sanchez Nu¤ez', '79645611', '3023566602', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.2.40', 'Casa Fiscal N 2', '', 'PCQ Facturacion 01/05 Organo', '64:D1:54:BD:76:F3', '', 'GURI', '', '8/01/2021', 80000, '', '', 'Pagadas'),
(390, 'Camilo Andres Isaza Herrera', '70756691', '3192231478', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.17', 'Vereda Guapante Alta, Cerca a la Capilla La Trinidad', '6.272144,-75.405989', 'PCQ Facturacion 15/20 Organo', '', '', 'GUSE2', '', '7/01/2021', 65000, '', '', 'Pagadas'),
(391, 'Maisoun Galia Yagoub', '475551', '3114178318', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.23.26', 'Vereda La Mosquita Parte Alta / Despues Del Spa Alma', '6.206334,-75.445504', 'PCQ Facturacion 01/05 Chorrera', '18:E8:29:8D:D3:75', '', 'GUSEMO Ubiquiti', '', '6/01/2021', 110000, '', '', 'Pagadas'),
(392, 'Juan Camilo Sanchez Gil', '15444327', '3007759422', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.25.70', 'Finca La Amelia 189 (tarabita)\nVereda La Mosquita', '', 'PCQ Facturacion 01/05 Chorrera', 'CC:2D:E0:CF:EB:01', '', 'GUCHO', '', '29/12/2020', 55000, '', '', 'Pagadas'),
(393, 'Oscar Julian Villa Lampion', '71369871', '3017874970', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.26.40', 'Vereda Alto de la Virgen', '6.3321018,-75.4538107', 'PCQ Facturacion 01/05 San Bernardo', 'B8:69:F4:5F:9F:45', '', 'GUAVI', '', '26/12/2020', 80000, '', '', 'Pagadas'),
(394, 'Natalia Giraldo Casas', '39450790', '3222132327', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.27.20', 'Vereda Cabeceras / Por La Tienda Los Sauces', '6.103184,-75.419111', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:FF:F2:01', '', 'GUCHOCA', '', '23/12/2020', 55000, '', '', 'Pagadas'),
(395, 'Ingenieria y Construcciones SAS', '811025261', '3148417543, 0344488663', 'Plan 10 Megas', '', 'Cancelado', '', '', '', '172.30.25.110', 'Vereda San Jose, Lote Buenos Aires, V¡a el Aeropuerto', '6.236501,-75.441191', 'PCQ Facturacion 01/05 + Iva Chorrera', '', '', 'GUCHO', '', '22/12/2020', 135000, '', '', 'Pagadas'),
(396, 'Jorge Armando Mu¤oz Maya', '98714789', '3113565470', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.59', 'Vereda Yolombal / Finca Villa Daniela', '6.326930,-75.393127', 'PCQ Facturacion 01/05 Yolombal', 'E0:63:DA:F0:63:F7', '', 'GUYO2', '', '18/12/2020', 80000, '', '', 'Pagadas'),
(397, 'Santiago Mu¤oz Llano', '1038408562', '3102775163', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.8.18', 'Barrio San Vicente / Via La Mulona', '6.28.59800,-75,4426870', 'PCQ Facturacion 15/20 San Bernardo', 'B8:69:F4:FF:7F:49', '', 'GUTO', '', '16/12/2020', 80000, '', '', 'Pagadas'),
(398, 'Wilson Mendoza Sanchez', '80543195', '3102069761', 'Plan 5 Megas', '', 'Cancelado', '', '', '', '172.30.2.21', 'Batallon Juan de Corral Casa A-01\nVereda Mampuesto', '6.212268,-75.392872', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:CF:EB:D4', '', 'GURI', '', '10/12/2020', 70000, '', '', 'Pendiente de Pago'),
(399, 'Ruben Dario Mazorra Londo¤o', '4934910', '3104223318', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.16', 'Vereda La Clarita / Finca 543 / En el volteadero de las busetas', '6.268499,-75.413344', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:FF:F2:25', '', 'GUCHO2', '', '5/12/2020', 80000, '', '', 'Pagadas'),
(400, 'Juan Esteban Jaramillo Iba¤ez', '1128270988', '3017830407', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.237', 'Vereda San Jose / La Puerta Roja', '6.234029,-75.445859', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:CF:EC:37', '', 'GUGU', '', '5/12/2020', 80000, '1Pago, $80000.00', '#11955 - 15/09/2021', 'Pendiente de Pago'),
(402, 'Conjunto de Vivienda Multifamiliar Sendai PH', '901323164', '3122976917', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.27.30', 'Calle 37 53-241\nVillas del Rio', '6.1399939,-75.3781442', 'PCQ Facturacion 01/05 + Iva Chorrera', 'B8:69:F4:5F:DA:D7', '', 'GUCHOCA', '', '1/12/2020', 135000, '', '', 'Pagadas'),
(403, 'Horacio De Jesus Manyoma Duque', '1036395888', '3195270317', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.28.13', 'Vereda Guapante Arriba, Sector La Pinera', '6.276001,-75.395462', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:23:05:EB', '', 'GUSE2', '', '27/11/2020', 55000, '1Pago, $55000.00', '#11781 - 15/09/2021', 'Pendiente de Pago'),
(404, 'Erika Maria Manyoma TIENDA', '43212096', '3194428408', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.28.11', 'Guapante Arriba Tienda Manyoma', '6.2832289,-75.4387093', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:CF:EB:D5', '', 'GUSE2', '', '26/11/2020', 55000, '1Pago, $55000.00', '#11784 - 15/09/2021', 'Pendiente de Pago'),
(405, 'Julian Ochoa Rivera', '1035916944', '3167650850', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.28.47', 'Vereda Guapante, cerca escuela La Trinidad', '6.274078,-75.406439', 'PCQ Facturacion 01/05 Organo', 'C4:AD:34:F5:8D:2B', '', 'GUSE2', '', '26/11/2020', 135000, '', '', 'Pagadas'),
(406, 'Beatriz Eugenia Agudelo Ospina', '52175809', '3165222339', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.25.33', 'Vereda La Clara, Finca El Vergel', '6.271141,-75.417386', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:FF:F1:F9', '', 'GUCHO', '', '25/11/2020', 135000, '', '', 'Pagadas'),
(407, 'Oscar Alonso Cadavid Gomez', '70329602', '3126250587', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.62', 'Vereda La Clara', '6.270383, -75.426729', 'ROUTER FIBRA FTTH 01/05', 'B8:69:F4:5F:DB:2F', '', '', '', '25/11/2020', 80000, '', '', 'Pagadas'),
(408, 'Gabriel Jaime Isaza Salazar', '1035910701', '3135148744', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.16', 'Vereda Yolombal / Finca La Milena / Subiendo Para El Colegio', '', 'PCQ Facturacion 01/05 Yolombal', 'B4:FB:E4:32:29:2D', '', 'GUYO2', '', '24/11/2020', 80000, '', '', 'Pagadas'),
(409, 'Luz Marina Taborda Diaz', '25059129', '3105940486', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.32.16', 'Vereda La Enea, Escuela Eladio Escobar', '6.3175441,-75.4277391', 'PCQ Facturacion 01/05 Yolombal', 'C4:AD:34:F5:92:C1', '', 'GUYO5', '', '24/11/2020', 80000, '', '', 'Pagadas'),
(410, 'Jhon Fernando Luna Celi', '1100892981', '3154014509', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.16', 'Vereda La Clara / Finca La Clarita', '6.275571,-75.417590', 'PCQ Facturacion 01/05 Organo', 'C4:AD:34:F5:89:BF', '', 'SAGUSE', '', '24/11/2020', 80000, '', '', 'Pagadas'),
(411, 'Jhon Jairo Villa Mejia', '8062703', '3124582609', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.27.19', 'Vereda La Playa / Los Naranjos / Finca 34', '6.216237,-75.380763', 'PCQ Facturacion 01/05 Chorrera', 'CC:2D:E0:CF:EB:DD', '', 'GUCHOCA', '', '23/11/2020', 70000, '', '', 'Pagadas'),
(412, 'Kannabyte S.A.S', '901208914', '3002496661', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.32.15', 'Vereda La Enea, sector El Salado', '6.339622,-75.4101168', 'PCQ Facturacion 01/05 +IVA Yolombal', 'C4:AD:34:F5:93:33', '', 'GUYO5', '', '23/11/2020', 135000, '', '', 'Pagadas'),
(413, 'Paula Cristina Perez Gonzalez', '43615057', '3203337822', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.28.21', 'Vereda Yolombal / Finca El Remanzo / Por la subida de Erika Manyoma', '6.270542,-75.407160', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:DA:E9', '', 'GUSE2', '', '18/11/2020', 135000, '', '', 'Pagadas'),
(414, 'Adriana Maria Pati¤o', '43564509', '3104489132', 'Plan 10 Megas', '', 'Cancelado', '', '', '', '172.30.12.45', 'Vereda Hojas Anchas', '6.240527,-75.426358', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:CF:EB:99', '', 'GUGU', '', '17/11/2020', 135000, '', '', 'Pagadas'),
(415, 'Carlos Vasquez Eraso', '19374439', '3163130730', 'Plan 20 Megas', '', 'Activo', '', '', '', '172.30.27.50', 'Vereda La Porquera San Vicente Ferrer', '6.244456,-75.348696', 'PCQ Facturacion 15/20 Chorrera', 'B8:69:F4:5F:9F:49', '', 'GUCHOCA', '', '14/11/2020', 200000, '1Pago, $200000.00', '#11950 - 15/09/2021', 'Pendiente de Pago'),
(416, 'Angela Maria Tamayo Jaramillo', '29671843', '3006781316', 'Plan dinamico 3 - 10 Megas', '', 'Activo', '', '', '', '172.30.7.19', 'Vereda la Mosquita / Finca San Silvestre 214 B', '6.220634,-75.424297', 'PCQ Facturacion 01/05 Organo', '', '', 'GUMO', '', '13/11/2020', 85000, '', '', 'Pagadas'),
(417, 'Henrry Nelson Arbelaez Duque', '70908573', '3015683792', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.17.37', 'Vereda La Esperanza\nPor El Semaforo Del Cordobez', '6.163626,-75.328434', 'PCQ Facturacion 15/20 Organo', '74:4D:28:CD:3A:AE', '', 'GUSU', '', '13/11/2020', 70000, '', '', 'Pagadas'),
(418, 'Luis Alfonso Granada Arenas', '4384567', '3207726974', 'Plan 3 Megas', '', 'Cancelado', '', '', '', '172.30.31.16', 'Vereda Yolombal / Sector Bautista / Finca El Picacho', '6.328247,-75.390398', 'PCQ Facturacion 01/05 Yolombal', '74:AC:B9:86:45:7F', '', 'GUYO4', '', '9/11/2020', 55000, '', '', 'Pendiente de Pago'),
(419, 'Rafael Andres Perez Villegas', '71761183', '3146623326', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.7.57', 'Vereda San Ignacio\nSector las Brisas finca La Caba¤a', '6.207185,-75.481636', 'PCQ Facturacion 15/20 Organo', 'C4:AD:34:4E:07:5C', '', 'GUMO', '', '7/11/2020', 135000, '', '', 'Pagadas'),
(420, 'Jose Arbey Sanchez Betancur', '70754935', '3024229591', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.7.64', 'La Mosquita\nRieles despues de Rosarte', '6.269235,-75.419113', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:AC:6C:86', '', 'GUMO', '', '4/11/2020', 55000, '1Pago, $55000.00', '#11787 - 15/09/2021', 'Pendiente de Pago'),
(421, 'Ana Lucia Mejia Naranjo', '43221210', '3104348841', 'Plan dinamico 5 - 20 Megas', '', 'Activo', '', '', '', '172.30.25.155', 'Vereda San Jose, v¡a la Mosquita\nEntrada por puertas rojas', '6.269235,-75.419113', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:5F:DB:61', '', 'GUCHO', '', '31/10/2020', 112000, '', '', 'Pagadas'),
(422, 'Sandra Milena Qui¤ones Vanegas', '1110507229', '3123802180', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.16.77', 'Vereda Guapante / El Pinal', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:DB:49', '', 'GUSE', '', '31/10/2020', 55000, '', '', 'Pagadas'),
(423, 'Deysi Rivera Acevedo', '1035921211', '3106037865', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.31.15', 'Vereda Yolombal / Detras de Camilo Ochoa', '6.326110,-75.398206', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:F0:CE:3D', '', 'GUYO4', '', '30/10/2020', 55000, '', '', 'Pagadas'),
(424, 'Jaime Alberto Alzate Ospina', '70754901', '3192147105', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.11.47', 'Vereda La Mosquita', '', 'PCQ Facturacion 15/20 Organo', '', '', 'GUSA2', '', '29/10/2020', 80000, '', '', 'Pagadas'),
(425, 'Juan Carlos Monsalve Agudelo', '98527135', '3128333861', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.25', 'Vereda Yolombal', '6.323461,-75.401677', 'PCQ Facturacion 01/05 Yolombal', '', '', 'GUYO2', '', '29/10/2020', 80000, '', '', 'Pagadas'),
(426, 'Zulay Johana Tabares Romero', '1152703342', '3116178887', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.21.15', 'Vereda Yolombal / Sector los Naranjos Finca 108', '6.321814,-75.405662', 'PCQ Facturacion 01/05 Yolombal', 'E0:63:DA:9F:11:5B', '', 'GUYO2', '', '29/10/2020', 135000, '', '', 'Pagadas'),
(427, 'Maria Soledad Ochoa Rivera', '43422586', '3122314711', 'Plan 4 Megas Volante', '', 'Activo', '', '', '', '172.30.9.49', 'Vereda Yolombal Casa 150 Antes de la Finca el Lago', '', 'PCQ Facturacion 01/05 Yolombal', '18:E8:29:86:55:11', '', 'GUYO1', '', '27/10/2020', 60000, '', '', 'Pagadas'),
(428, 'Egidio Valderrama Trujillo', '70631233', '3127785076', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.25.49', 'Vereda La Clara\nParte Baja, pen£ltima casa', '', 'PCQ Facturacion 01/05 Chorrera', 'C4:AD:34:94:32:0B', '', 'GUCHO', '', '26/10/2020', 80000, '', '', 'Pagadas'),
(429, 'Ruben Dario Chavarria Areiza', '3378733', '3128883878', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.8.53', 'Vereda Monta¤ez / Finca 92', '6.296342,-75.435361', 'PCQ Facturacion 01/05 San Bernardo', 'B8:69:F4:5F:53:45', '', 'GUTO', '', '26/10/2020', 55000, '2Pagos, $110000.00', '#11363 - 01/09/2021', 'Pagadas'),
(430, 'Juan David Correa Mantilla', '86044585', '', 'Plan 10 Megas', '', 'Gratis', '', '', '', '172.30.7.13', '', '', 'PCQ Facturacion 15/20 Organo', '', '', 'GUMO', '', '26/10/2020', 135000, '', '', 'Pagadas'),
(431, 'Laura Vanessa Moreno Gallo', '1036938123', '3015828831', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.2.57', 'Vereda El Carmin / Finca 305', '6.195577,-75.403216', 'PCQ Facturacion 01/05 Organo', 'C4:AD:34:94:34:8B', '', 'GURI', '', '21/10/2020', 110000, '', '', 'Pagadas'),
(432, 'Elena Puentes Moreno', '26558753', '3108455696', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.22.22', 'Batallon Juan Del Corral / Seccion 3a Comando', '', 'PCQ Facturacion 01/05 Organo', 'E0:63:DA:9C:F5:C0', '', 'JDC', '', '21/10/2020', 80000, '', '', 'Pagadas'),
(433, 'Diego Alexander Gomez Chavarria', '71292446', '3192342712', 'Plan 8 Megas', '', 'Cancelado', '', '', '', '172.30.18.21', 'Barrio San Vicente Cra 53 Nø 56 76', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FF:95:3E', '', 'SAGUSE', '', '21/10/2020', 110000, '', '', 'Pagadas'),
(434, 'Aura Lilia Ceballos Ochoa', '43794142', '3194418844', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.22', 'Vereda Guapante- Abajo - El pinal', '', 'PCQ Facturacion 15/20 Organo', '', '', 'GUSE2', '', '20/10/2020', 65000, '', '', 'Pagadas'),
(435, 'Gustavo Adolfo Satamaria Gallego', '3568505', '3003823686', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.26.41', 'Vereda Monta¤ez Parte Alta. Finca 92D', '6.3013925,-75.4349169', 'PCQ Facturacion 01/05 San Bernardo', '', '', 'GUAVI', '', '20/10/2020', 80000, '', '', 'Pagadas'),
(436, 'David Campuzano Echeverry', '15428946', '3006191799', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.17.15', 'Vereda Guamito\nAl lado de la Escuela de Guamito', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:61:55:D1', '', 'GUSU', '', '19/10/2020', 55000, '', '', 'Pagadas'),
(437, 'Carlos Andres Castrillon Ceballos', '1001415603', '3195536193', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.12', 'Vereda Guapante', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:61:55:8D', '', 'GUSE2', '', '19/10/2020', 65000, '', '', 'Pagadas'),
(438, 'Maria Patricia Diaz Abad', '42871497', '3168743138', 'Plan 6 Megas Maria Patricia Diaz', '', 'Activo', '', '', '', '172.30.33.23', 'Vereda La Clara\nHacienda El Pomar Del Duque\npor favor para el cobro de cartera llamar a Carolina Castrill¢n', '6.268617,-75.419601', 'PCQ Facturacion 15/20 + Iva Chorrera', 'B8:69:F4:FC:3F:37', '', 'GUCHO2', '', '19/10/2020', 42016, '', '', 'Pagadas'),
(439, 'J. Humberto Gomez Y CIA. LTDA Asesores en Seguros', '800027694', '3206864440', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.25.31', 'Vereda La Clara Finca # 3 San Sebastian de Oriente', '6.261615,-75.4344332', 'PCQ Facturacion 01/05 + Iva Chorrera', 'CC:2D:E0:CF:EB:DF', '', 'GUCHO', '', '17/10/2020', 80000, '', '', 'Pagadas'),
(440, 'Andres Felipe Suarez Gomez', '1031131398', '3005687785', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.20', 'Carrera 53 34-160\nSobre autopista antes de las escalas de San Antonio', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '17/10/2020', 80000, '', '', 'Pagadas'),
(441, 'Industrias Vega Natipan S.A.S', '900916161', '3136016746', 'Plan 20 Megas', '', 'Activo', '', '', '', '172.30.18.77', 'Autopista Med-Bgta Km 20+700', '', 'PCQ Facturacion 15/20 +IVA Organo', 'B8:69:F4:5F:DA:EF', '', 'SAGUSE', '', '16/10/2020', 200000, '1Pago, $238000.00', '#11932 - 15/09/2021', 'Pendiente de Pago'),
(442, 'Ruth Estela Bouhot Arroyave', '32315465', '3155783847', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.3.100', 'Vereda La Clara', '6.2532300, -75.4339260', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FC:3D:1B', '', 'GUSA', '', '16/10/2020', 70000, '', '', 'Pagadas'),
(443, 'Maria Eucaris Hernandez De Cano', '42868621', '3106709040', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.27', 'Vereda San Jose / Puerta Roja', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:AC:6B:54', '', 'GUMO', '', '15/10/2020', 80000, '1Pago, $80000.00', '#11788 - 15/09/2021', 'Pendiente de Pago'),
(444, 'Santiago Andres Moreno Bonilla', '1040734620', '3192305200', 'Plan 30 Megas Simetricos Santiago Moreno', '', 'Cancelado', '', '', '', '172.30.27.21', 'Vereda La laja\nFinca # 50 por Frilog', '6.225607,-75.423118', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:61:58:66', '', 'GUCHOCA', '', '14/10/2020', 165000, '', '', 'Pagadas'),
(445, 'Alejandro Palacio Gomez', '1020489979', '3175278623', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.6.45', 'Vereda La Clara', '6.263183,-75.428322', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:CF:EB:C9', '', 'GUSI', '', '14/10/2020', 70000, '', '', 'Pagadas'),
(446, 'Jimmy Abril Ramirez', '80083226', '3185579785', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.2.200', 'BJC Casa fiscales oficiales casa 8', '', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:CF:EB:CD', '', 'GURI', '', '13/10/2020', 55000, '', '', 'Pagadas'),
(447, 'Haimer Johan Zamudio Garcia', '80108621', '3128225048', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.22.44', 'Batallon JDC Casa fiscales', '', 'PCQ Facturacion 01/05 Organo', '74:AC:B9:8E:ED:83', '', 'JDC', '', '13/10/2020', 80000, '', '', 'Pagadas'),
(448, 'Luz Estrella Ramirez Osorio', '39456226', '3212535396', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.17.20', 'Vereda Santa Barbara', '6.2141480, -75.3705280', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FC:3F:DB', '', 'GUSU', '', '13/10/2020', 55000, '', '', 'Pagadas'),
(449, 'Willian Jose Escobar Diaz', '1035915899', '3222918652', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.34', 'Vereda Yolombal Tienda Diagonal a la Iglesia', '6.319374,-75.399718', 'PCQ Facturacion 15/20 Yolombal', '74:AC:B9:0C:AF:88', '', 'GUYO1', '', '10/10/2020', 80000, '1Pago, $80000.00', '#11761 - 15/09/2021', 'Pendiente de Pago'),
(450, 'Maria Cecilia Del Socorro Alvarez Restrepo', '32440274', '3108263211', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.26.24', 'Vereda El Sango al Frente de los Arrayanes', '', 'PCQ Facturacion 01/05 San Bernardo', 'B8:69:F4:61:58:51', '', 'GUAVI', '', '10/10/2020', 80000, '', '', 'Pagadas'),
(451, 'Jairo Andres Londo¤o Jaramillo', '98633124', '3133338951', 'Plan 20 Megas', '', 'Activo', '', '', '', '172.30.33.24', 'Vereda La Mosquita', '6.216888,-75.428009', 'PCQ Facturacion 01/05 + Iva Chorrera', 'B8:69:F4:FF:88:87', '', 'GUCHO2', '', '10/10/2020', 200000, '', '', 'Pagadas'),
(452, 'Imer Andrey Sepulveda Rios', '1035916917', '3024586290', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.26', 'Vereda La Clara', '6.255498,-75.417171', 'PCQ Facturacion 15/20 Organo', 'B4:FB:E4:36:3E:7D', '', 'GUMO', '', '9/10/2020', 80000, '', '', 'Pagadas'),
(453, 'Adriana Marcela Miranda Barrera', '63350282', '3134421462', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.8.180', 'Vereda La Clarita', '', 'PCQ Facturacion 01/05 +IVA San Bernardo', 'B8:69:F4:FF:88:AD', '', 'GUTO', '', '9/10/2020', 135000, '', '', 'Pagadas'),
(454, 'Hugo De Jesus Montoya Garcia', '15446294', '3003911352', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.17.30', 'Vereda Guamito / Sector 3', '6.227229,-75.382524', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FF:88:B3', '', 'GUSU', '', '8/10/2020', 135000, '', '', 'Pagadas'),
(455, 'Diego Fernando Jerez Castellanos', '1098633502', '3113452280, 3003895769', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.31', 'Vereda La Clarita / Casa 517b', '6.267885,-75.414829', 'ROUTER FIBRA FTTH 15/20', '84:3E:92:F9:37:CA', '', '', '', '8/10/2020', 100000, '', '', 'Pagadas'),
(456, 'Johan Hernando Garcia Florez', '1035915239', '3205422573', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.33.20', 'Vereda La Clara', '', 'PCQ Facturacion 01/05 Chorrera', '', '', 'GUCHO2', '', '8/10/2020', 55000, '', '', 'Pagadas'),
(457, 'Mauricio Moreno Maldonado', '80048544', '3006185334', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.7.33', 'Vereda La Honda / 2 km Arriba De La Truchera', '6.235614,-75.462086', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FF:88:89', '', 'GUMO', '', '8/10/2020', 135000, '', '', 'Pagadas'),
(458, 'Nataly Aguirre Berrio', '43222098', '3137472984', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.7.22', 'Vereda San Jose', '6.235538,-75.424094', 'PCQ Facturacion 01/05 Organo', 'C4:AD:34:4E:08:5E', '', 'GUMO', '', '7/10/2020', 135000, '', '', 'Pagadas'),
(459, 'Carolina Valderrama Rondon', '1035912132', '3008871445', '10 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.57', 'Vereda La Clara/Finca La Carolina', '6.271142,-75.427809', 'ROUTER FIBRA FTTH 15/20', 'C4:AD:34:94:35:57', '', '', '', '7/10/2020', 60000, '', '', 'Pagadas'),
(460, 'Esteban Osma Alzate', '1114488288', '3233832400', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.33.19', 'Vereda La Clara Casa 44\nPor La Fabrica Manoplas', '6.246052,-75.420221', 'PCQ Facturacion 01/05 Chorrera', 'C4:AD:34:94:35:53', '', 'GUCHO2', '', '7/10/2020', 55000, '', '', 'Pagadas'),
(461, 'Jhon Fredy Puerta Monsalve', '71369279', '3156402626, 3104325708', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.2.123', 'Batallon Juan del Corral', '6.212891,-75.394291', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:9F:53', '', 'GURI', '', '7/10/2020', 65000, '', '', 'Pagadas'),
(462, 'William De Jesus Casta¤eda Zapata', '70753570', '3127126322', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.8.20', 'Finca Casa Vieja', '6.282573,-75.436997', 'PCQ Facturacion 15/20 San Bernardo', 'B8:69:F4:5F:9F:4D', '', 'GUTO', '', '6/10/2020', 70000, '1Pago, $70000.00', '#11691 - 15/09/2021', 'Pendiente de Pago'),
(463, 'Claudia Arango Chavarriaga', '43158824', '3164466141', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.7.21', 'Vereda Hojas Anchas Finca 226\nEl palmar', '6.234883,-75.423729', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:9F:69', '', 'GUMO', '', '6/10/2020', 55000, '', '', 'Pagadas'),
(464, 'Silvia Rodriguez Prada', '43266497', '3005107130', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.30.21', 'Vereda La Mosquita Finca 63', '6.231187,-75.429921', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:D1:FB:C1', '', 'GUSEMO CAMBIUM', '', '6/10/2020', 110000, '', '', 'Pagadas'),
(465, 'Jonathan Rick Velasquez Palacio', '8359810', '3172441701', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.21.14', 'Vereda Yolombal', '', 'PCQ Facturacion 01/05 Yolombal', '', '', 'GUYO2', '', '3/10/2020', 110000, '', '', 'Pagadas'),
(466, 'Luis Gabriel Doncel Araujo', '15879174', '3115328890', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.2.11', 'Batallon Juan Del Corral', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:F9:B8:1D', '', 'GURI', '', '2/10/2020', 135000, '', '', 'Pagadas'),
(467, 'Leidy Tatiana Agudelo Hincapie', '1036932691', '3234541324', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.11.222', 'Vereda La Mosquita - Alto Gordo', '', 'PCQ Facturacion 15/20 Organo', '62:25:98:77:54:22', '', 'GUSA2', '', '30/09/2020', 65000, '', '', 'Pagadas'),
(468, 'Julian Alberto Henao Hincapie', '1036945756', '3217555914', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.36', 'Vereda La Mosquita', '6.214264,-75.444197', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:5F:9F:41', '', 'GUCHO2', '', '29/09/2020', 80000, '', '', 'Pagadas'),
(469, 'Griselda de Jesus Gonzalez Gutierrez', '24789901', '3212541508, 3186964853', 'Plan 20 Megas', '', 'Cancelado', '', '', '', '172.30.30.11', 'Vereda El Carmin Finca 220', '6.1710402,-75.4554444', 'PCQ Facturacion 15/20 Chorrera', '00:04:56:51:02:EF', '', 'GUSEMO CAMBIUM', '', '28/09/2020', 200000, '', '', 'Pagadas'),
(470, 'Octavio De Jesus Posada Jerez', '8064907', '3104274757', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.22.237', 'Batallon Juan Del Corral / CRM', '', 'PCQ Facturacion 01/05 Organo', '74:AC:B9:0C:B0:35', '', 'JDC', '', '26/09/2020', 80000, '', '', 'Pagadas'),
(471, 'Edgar Alonso Jimenez Jaramillo', '78077948', '3203056581', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.22.17', 'Batallon Juan Del Corral', '', 'PCQ Facturacion 01/05 Organo', 'E0:63:DA:9E:21:BC', '', 'JDC', '', '25/09/2020', 80000, '', '', 'Pendiente de Pago'),
(472, 'Diana Mabel Jimenez Burgos', '59310072', '3168237349', 'Plan 5 Megas', '', 'Activo', '', '', '', '10.130.22.18', 'Batallon Juan Del Corral\nCasas Fiscales Nø 6', '', 'PCQ Facturacion 01/05 Organo', '', '', 'JDC', '', '24/09/2020', 70000, '', '', 'Pagadas'),
(473, 'Sandra Maria Arango Correa', '43503471', '3127570019', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.64', 'Vereda Monta¤ez / Finca La Esperanza Frente a La 90', '6.293594,-75.436092', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '17/09/2020', 70000, '', '', 'Pagadas'),
(474, 'Ruben Hernando Tamayo Zuluaga', '15317191', '3108373813', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.14', 'Vereda La Clara / Finca 503C Finca Si Lleva Come', '6.261622,-75.417227', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:6A:9C:9F', '', 'GUSA', '', '17/09/2020', 80000, '', '', 'Pagadas'),
(476, 'Laura Velasquez Mesa', '1036603142', '3012794198', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.36', 'Vereda Garrido via a toldas', '6.245232,-75.446446', 'PCQ Facturacion 15/20 Organo', 'C4:AD:34:94:34:79', '', 'GUMO', '', '16/09/2020', 80000, '', '', 'Pagadas'),
(477, 'Rodwy Peralta Madariaga', '1022334887', '3226387325', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.22.14', 'Vereda La Playa / Batallon Juan Del Corral', '6.269235,-75.419113', 'PCQ Facturacion 01/05 Organo', '74:AC:B9:86:2A:12', '', 'JDC', '', '16/09/2020', 80000, '', '', 'Pagadas'),
(478, 'Claudia Marcela del Socorro Giraldo Escobar', '43614852', '3006149373', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.120', 'Vereda La Clara', '6.268707275390625,-75.41944885253', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '15/09/2020', 80000, '', '', 'Pagadas'),
(480, 'Sara Maria Aguilar Sierra', '1020409629', '3006608619', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.31.35', 'Vereda Yolombal / Finca 71', '6.318869,-75.400338', 'PCQ Facturacion 15/20 Yolombal', '7A:AC:B9:B6:25:0E', '', 'GUYO4', '', '11/09/2020', 110000, '', '', 'Pagadas'),
(481, 'Cristalagro SAS', '901238635', '3008567945', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.65.16', 'Finca La Ilusi¢n Vereda La Chapa - Carmen del Viboral', '', 'PCQ Facturacion 01/05 + Iva Chorrera', 'B8:69:F4:60:EE:7F', '', '', '', '8/09/2020', 80000, '', '', 'Pagadas'),
(482, 'Leidy Lorena Cardona Bedoya', '1058842974', '3127350331', 'Plan 4 Megas Descuento', '', 'Activo', '', '', '', '172.30.15.18', 'Vereda La Enea\n\nDespu‚s de la entrada del se¤or Epifanio', '', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:F0:2D:05', '', 'GUYO3', '', '4/09/2020', 55000, '', '', 'Pagadas'),
(483, 'Hernan Dario Lopez Arcila', '15518175', '3508976291', 'Plan dinamico 3 - 10 Megas', '', 'Activo', '', '', '', '172.30.9.55', 'Vereda Yolombal / Finca 68', '6.318984,-75.401071', 'PCQ Facturacion 01/05 Yolombal', '', '', 'GUYO1', '', '4/09/2020', 85000, '', '', 'Pagadas'),
(484, 'Luz Marina Ochoa Escobar', '43210739', '3232335579', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.7.16', 'Barrio San Antonio sin nomenclatura', '6.275318,-75.434997', 'PCQ Facturacion 01/05 Organo', '74:4D:28:42:97:61', '', 'GUMO', '', '2/09/2020', 55000, '', '', 'Pagadas'),
(485, 'Daniela Sanchez Giraldo', '1017214413', '3146836564', 'Plan 10 Megas Parcelacion Las Camelias', '', 'Activo', '', '', '', '172.30.29.36', 'Vereda La Mosquita / Parcelaci¢n Las Camelia', '6.214571,-75.442266', 'PCQ Facturacion 15/20 Chorrera', 'E0:63:DA:9E:1F:F7', '', 'GUSEMO2', '', '29/08/2020', 90000, '', '', 'Pagadas'),
(486, 'Alberto Uribe Duque', '8281440', '3137803148', 'Plan 8 Megas Parcelacion Las Camelias', '', 'Activo', '', '', '', '172.30.29.35', 'Vereda La Mosquita / Parcelacion Las Camelias Casa 5', '6215142,-75.441602', 'PCQ Facturacion 15/20 Chorrera', 'E0:63:DA:9C:F4:66', '', 'GUSEMO2', '', '29/08/2020', 80000, '', '', 'Pagadas'),
(487, 'Sebastian Castrillon Ospina', '1026131094', '3006740003', '50 MEGAS FIBRA OPTICA', '', 'Suspendido', '', '', '', '192.168.102.69', 'Parcelacion Los Cisnes', '6.266789436340332,-75.42667388916016', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '29/08/2020', 80000, '', '', 'Pagadas'),
(488, 'Juan Ricardo Montoya Rua', '71656091', '3136116866', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.252', 'Vereda Aguacate / Finca El Mirador', '6.291006,-75.433719', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '28/08/2020', 80000, '1Pago, $80000.00', '#11831 - 15/09/2021', 'Pendiente de Pago'),
(489, 'Margarita Maria Ochoa Arroyave', '43492887', '3128431265', 'Plan 20 Megas Condominio El Porvenir', '', 'Activo', '', '', '', '172.30.24.18', 'Vereda la Hondita Condominio El Porvenir casa 17', '6.265926,-75.449056', 'PCQ Facturacion 01/05 +IVA Organo', 'E0:63:DA:F0:C0:0D', '', 'COELPORVENIR', '', '26/08/2020', 150000, '', '', 'Pagadas'),
(490, 'Alvaro Arturo Cardona Lopez', '70288476', '3128185165', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.14', 'Cr 53 N 33-622', '', 'PCQ Facturacion 01/05 Organo', '', '', 'GUMO', '', '21/08/2020', 80000, '', '', 'Pagadas'),
(491, 'Juan Fernando Isaza Rivera', '70755890', '3117866002', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.58', 'Vereda Yolombal', '', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:9C:F5:70', '', 'GUYO2', '', '21/08/2020', 80000, '', '', 'Pagadas'),
(492, 'Raquel Gonzalez Naranjo', '1037571368', '3006673670', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.23.32', 'Vereda La Mosquita', '6.2188304,-75.43902', 'PCQ Facturacion 01/05 Chorrera', 'E0:63:DA:9C:F5:45', '', 'GUSEMO Ubiquiti', '', '14/08/2020', 135000, '', '', 'Pagadas'),
(493, 'Shelley Alexandra Casey', '579567', '3148047635', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.12.11', 'Vereda San Jose', '6.2322440,-75.4494480', 'PCQ Facturacion 01/05 Organo', '64:D1:54:AE:19:CF', '', 'GUGU', '', '13/08/2020', 135000, '', '', 'Pagadas'),
(494, 'Jonathan David Zapata Rojas', '1045745518', '3218476448', 'Plan 6 Megas', '', 'Activo', '', '', '', '192.168.222.5', 'Batallon Juan del Corral\nApto 06\nCasino Oficiales', '', 'PCQ Facturacion 01/05 Organo', 'B0:95:75:F9:D3:C6', '', 'JDC', '', '13/08/2020', 80000, '', '', 'Pagadas'),
(495, 'Rubid Del Consuelo Casta¤o Marin', '21784769', '3103841552', 'Plan 3 Megas Descuento', '', 'Activo', '', '', '', '172.30.6.108', 'Cra 52 D N 33-05 Barrio San Antonio\nFrente a la cancha sintetica', '', 'PCQ Facturacion 01/05 Organo', '74:4D:28:42:24:95', '', 'GUSI', '', '6/08/2020', 50000, '', '', 'Pagadas'),
(496, 'RoldanAgro - Tienda Equina y Mascotas SAS', '900709731', '3187865217, 3155581897', 'Plan 8 Megas', '', 'Gratis', '', '', '', '172.30.26.13', 'CR 50 42 100 LC 24', '6.3326667,-75.4523017', 'PCQ Facturacion 15/20 San Bernardo', '74:4D:28:41:03:9B', '', 'GUAVI', '', '5/08/2020', 110000, '', '', 'Pagadas'),
(497, 'Olga Lucia Berrio Salazar', '43746138', '311808982', 'Plan 5 Megas', '', 'Cancelado', '', '', '', '172.30.23.31', 'Vereda la Mosquita\nParcelacion Ecovilla / casa 6', '', 'PCQ Facturacion 01/05 + Iva Chorrera', 'E0:63:DA:9F:1B:E2', '', 'GUSEMO Ubiquiti', '', '4/08/2020', 70000, '', '', 'Pagadas'),
(498, 'Andrea Osorio Pemberthy', '1017126487', '3138707535', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.27.49', 'Vereda la Mosquita', '', 'PCQ Facturacion 01/05 Chorrera', '74:4D:28:42:2D:78', '', 'GUCHOCA', '', '3/08/2020', 80000, '', '', 'Pagadas'),
(499, 'Maria Alejandra Zuleta Betancur', '1017212021', '3012270494', 'Plan 10 Megas', '', 'Activo', '', '', '', '10.130.236.8', 'Edificio Ventus Apto 2207', '', 'PCQ Facturacion 15/20 Organo', 'B0:95:75:F9:C8:CA', '', 'EDIFICIO VENTUS', '', '25/07/2020', 135000, '', '', 'Pagadas'),
(500, 'Parcelacion Las Camelias', '900089313', '3006013222', 'Plan 8 Megas Parcelacion Las Camelias', '', 'Activo', '', '', '', '172.30.33.59', 'Vereda La Mosquita\nVia Aeropuerto', '', 'PCQ Facturacion 01/05 + Iva Chorrera', 'B4:FB:E4:DE:BE:DE', '', 'GUCHO2', '', '24/07/2020', 80000, '', '', 'Pagadas'),
(501, 'Jhon Fredy Giraldo Montoya', '94395502', '3205818861', 'Plan 10 Megas', '', 'Activo', '', '', '', '192.168.101.11', 'Carrera 50 N 44-46\nBarrio San Francisco', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '18/07/2020', 135000, '', '', 'Pagadas'),
(502, 'Ferney Sanchez Rendon', '15447450', '3015318392', 'Plan 8 Megas Descuento', '', 'Activo', '', '', '', '172.30.17.71', 'Vereda Galicia Parte alta', '6ø11\'40.6\'\'N 75ø21\'31.9\'\'W', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FF:E7:68', '', 'GUSU', '', '18/07/2020', 40000, '', '', 'Pagadas'),
(503, 'Jesus Antonio Gonzalez Florez', '70781687', '3206879540', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.7.71', 'Cll 43 N 51 - 25\nCentro Plaza', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:D1:FB:33', '', 'GUMO', '', '18/07/2020', 55000, '1Pago, $55000.00', '#11791 - 15/09/2021', 'Pendiente de Pago'),
(504, 'Luis Felipe Ossa Nore¤a', '1152440407', '3104494459, 3113702600', 'Plan 15 Megas Parcelacion Las Camelias', '', 'Activo', '', '', '', '172.30.23.34', 'Vereda La Mosquita\nParcelacion Las Camelias', 'Parcelaci¢n Las Camelias, Guarne, Antioquia', 'PCQ Facturacion 15/20 Chorrera', 'E0:63:DA:9C:F2:86', '', 'GUSEMO Ubiquiti', '', '18/07/2020', 120000, '1Pago, $120000.00', '#11738 - 15/09/2021', 'Pendiente de Pago'),
(505, 'Jhon Helmer Perdomo Uribe', '5832831', '3146072647', 'Plan 10 Megas', '', 'Suspendido', '', '', '', '172.30.7.11', 'El carm¡n Finca # 35 - pagos Sr Juan 3148128152', '', 'PCQ Facturacion 01/05 Organo', '64:D1:54:9C:84:69', '', 'GUMO', '', '17/07/2020', 135000, '1Pago, $135000.00', '#11433 - 01/09/2021', 'Pendiente de Pago'),
(506, 'Juan Camilo Cadavid Lopez', '3414177', '3155393929', 'Plan 10 Megas Parcelacion Las Camelias', '', 'Activo', '', '', '', '172.30.33.67', 'Parcelacion Las Camelias Finca N9\nVereda La Mosquita', 'Parcelaci¢n Las Camelias, Guarne, Antioquia', 'PCQ Facturacion 15/20 Chorrera', 'B8:69:F4:61:58:5D', '', 'GUCHO2', '', '17/07/2020', 90000, '', '', 'Pagadas'),
(507, 'Alexander Gerardo Bonilla Lopez', '93406197', '3212339907', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.22.13', 'Batallon Juan del Corral Bloque 1 Apto 101', '', 'PCQ Facturacion 15/20 Organo', 'E0:63:DA:9E:14:23', '', 'JDC', '', '15/07/2020', 80000, '1Pago, $80000.00', '#11792 - 15/09/2021', 'Pendiente de Pago'),
(508, 'Transportes Alto Nivel SAS', '811040105', '0344443839, 3105047709', 'Plan 20 Megas', '', 'Cancelado', '', '', '', '172.30.16.99', 'Autopista Med-Bog km 24\nBonanza', '', 'PCQ Facturacion 15/20 +IVA Organo', '', '', 'GUSE', '', '13/07/2020', 200000, '', '', 'Pagadas'),
(509, 'Jhon Harvey Lozano Campo', '1110460455', '3192873727', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.60', 'Vereda Yolombal', '', 'PCQ Facturacion 15/20 Yolombal', 'D8:47:32:B5:F2:14', '', 'GUYO2', '', '13/07/2020', 80000, '', '', 'Pagadas'),
(510, 'Carlos Martin Ardila Medina', '91231876', '3136469058', 'Plan 8 Megas Parcelacion Las Camelias', '', 'Activo', '', '', '', '172.30.33.99', 'Parcelacion Las Camelias\nVereda La Mosquita', '', 'PCQ Facturacion 15/20 + Iva Chorrera', '64:D1:54:AE:1A:3D', '', 'GUCHO2', '', '11/07/2020', 80000, '', '', 'Pagadas'),
(511, 'Liliana Maria Sanchez Arce', '43049928', '3104088910', 'Plan 20 Megas Condominio El Porvenir', '', 'Activo', '', '', '', '172.30.24.17', 'Parcelacion El Porvenir casa 10', '', 'PCQ Facturacion 15/20 Organo', 'E0:63:DA:F0:B6:0D', '', 'COELPORVENIR', '', '10/07/2020', 150000, '1Pago, $150000.00', '#11794 - 15/09/2021', 'Pendiente de Pago'),
(512, 'Julian David Jimenez Agudelo', '1037626707', '3218585460', 'Plan 10 Megas Condominio El Porvenir', '', 'Activo', '', '', '', '172.30.24.16', 'Condominio El Porvenir casa 23', '', 'PCQ Facturacion 01/05 Organo', 'E0:63:DA:F0:CC:C9', '', 'COELPORVENIR', '', '10/07/2020', 110000, '', '', 'Pagadas'),
(513, 'Silvia Ana Hoyos Herrera', '42788754', '3207886478', 'Plan 8 Megas Parcelacion Las Camelias', '', 'Activo', '', '', '', '172.30.29.23', 'Parcelacion las camelias', 'Parcelaci¢n Las Camelias, Guarne, Antioquia', 'PCQ Facturacion 15/20 Chorrera', 'E0:63:DA:F0:C3:19', '', 'GUSEMO2', '', '10/07/2020', 80000, '', '', 'Pagadas'),
(514, 'Jaime Alonso Cata¤o Caro', '79335981', '3156260603', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.12.12', 'Vereda La Mosquita Finca Maria N§ 58', '6.2262288,-75.4334161', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FF:E5:83', '', 'GUGU', '', '9/07/2020', 135000, '1Pago, $135000.00', '#11931 - 15/09/2021', 'Pendiente de Pago'),
(515, 'Luz Marleny Botero Salazar', '43029233', '3117194698', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.12.22', 'Vereda la Mosquita Alto Gordo casa tierra blanca', '6.216739,-75.427905', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FC:3D:03', '', 'GUGU', '', '9/07/2020', 135000, '', '', 'Pagadas'),
(516, 'Krancheskow Andreievish Rojas Florez', '15429964', '3116446217', 'Plan 15 Megas Descuento Krancheskow', '', 'Activo', '', '', '', '172.30.23.201', 'Vereda La Mosquita', '', 'PCQ Facturacion 15/20 Chorrera', 'E0:63:DA:9E:12:84', '', 'GUSEMO Ubiquiti', '', '9/07/2020', 115000, '1Pago, $115000.00', '#11743 - 15/09/2021', 'Pendiente de Pago'),
(517, 'Ana Isabel Oviedo Carrascal', '43266226', '3002094680', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.29.21', 'Vereda La Mosquita', '6.218861,-75.429722', 'PCQ Facturacion 15/20 Chorrera', 'E0:63:DA:F0:C3:0A', '', 'GUSEMO2', '', '9/07/2020', 135000, '', '', 'Pagadas'),
(518, 'Diana Paola Isaza Isaza', '43211848', '3148143039', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.12', 'Vereda Yolombal', '', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:42:FE:81', '', 'GUYO1', '', '7/07/2020', 80000, '1Pago, $80000.00', '#11767 - 15/09/2021', 'Pendiente de Pago'),
(519, 'Fray Kevin Carmona Rios', '1001478365', '3127440735', 'Plan 4 Megas Volante', '', 'Activo', '', '', '', '192.168.102.107', 'Vereda El Aguacate', '6.292049,-75.435833', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '7/07/2020', 60000, '', '', 'Pagadas'),
(520, 'Nora Helena Gil', '42756577', '3226596451', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.33.70', 'Vereda La Mosquita parte baja finca la Amelia 189', '6.233771,-75.441574', 'PCQ Facturacion 15/20 Chorrera', 'CC:2D:E0:CF:EB:D1', '', 'GUCHO2', '', '5/07/2020', 55000, '', '', 'Pagadas');
INSERT INTO `telemercadeoclientes` (`id`, `nombre`, `cedula`, `telefono`, `plan`, `estado`, `estado_contrato`, `estadoLLamada`, `tipificacion`, `observaciones`, `ip`, `direccion`, `coordenadas`, `router`, `mac`, `seguimiento`, `sectorial`, `observaciones_seguimiento`, `fecha_instalación`, `precio_plan`, `pendiente_pago`, `ultima_factura`, `estado_factura`) VALUES
(521, 'Aranelcy Quintero Mejia', '39450535', '3136188291', 'Plan 4 Megas Descuento', '', 'Activo', '', '', '', '172.30.17.12', 'Vereda Los Pinos finca 100', '6.2097295,-75.3453112', 'PCQ Facturacion 01/05 Organo', 'CC:D2:E0:1F:10:FB', '', 'GUSU', '', '4/07/2020', 55000, '', '', 'Pagadas'),
(522, 'Juliana Gonzalez Lopez', '1036622822', '3205640197', 'Plan 20 Megas Condominio El Porvenir', '', 'Activo', '', '', '', '172.30.24.21', 'Vereda La Honda Condominio el porvenir casa 21', '6.265607,-75.448035', 'PCQ Facturacion 15/20 Organo', 'E0:63:DA:9E:0A:EA', '', 'COELPORVENIR', '', '4/07/2020', 150000, '', '', 'Pagadas'),
(523, 'Katherine Sanin Gomez', '43742409', '3218312401', 'Plan 6 Megas Condominio El Porvenir', '', 'Activo', '', '', '', '172.30.24.14', 'Condominio El Porvenir', '', 'PCQ Facturacion 01/05 Organo', 'E0:63:DA:F0:2D:DD', '', 'COELPORVENIR', '', '4/07/2020', 70000, '', '', 'Pagadas'),
(524, 'Janeth Echeverri Echeverri', '39456768', '3128936997', 'Plan 5 Megas Condominio el porvenir', '', 'Activo', '', '', '', '172.30.24.13', 'Condominio El Porvenir', '', 'PCQ Facturacion 15/20 Organo', 'E0:63:DA:F0:C0:87', '', 'COELPORVENIR', '', '4/07/2020', 60000, '', '', 'Pagadas'),
(525, 'Mary Sol Cano Mejia', '42764948', '3015215210', 'Plan 8 Megas Condominio El Porvenir', '', 'Activo', '', '', '', '172.30.24.12', 'Condominio El Porvenir', '', 'PCQ Facturacion 01/05 Organo', 'E0:63:DA:9E:1B:2C', '', 'COELPORVENIR', '', '3/07/2020', 90000, '', '', 'Pagadas'),
(526, 'Ronny Alejandro Amaya Gomez', '15443091', '3216368907', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.24.11', 'Condominio El Porvenir casa 2\nVereda La Hondita', '', 'PCQ Facturacion 15/20 Organo', 'E0:63:DA:9E:1C:61', '', 'COELPORVENIR', '', '3/07/2020', 110000, '', '', 'Pagadas'),
(527, 'Juan David Gallego Garcia', '1035914506', '3058946410', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.12', 'Guarne Urbano la Virgen via al Aguacate', '', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:FF:E7:63', '', 'GUCHO2', '', '2/07/2020', 80000, '', '', 'Pagadas'),
(528, 'Maria Elizabeth Rojas Rios', '1035912332', '3116579768', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.23.19', 'Vereda La Mosquita 79 b', '6.216774940490723,-75.43614959716797', 'PCQ Facturacion 01/05 Chorrera', 'E0:63:DA:F0:C3:FA', '', 'GUSEMO Ubiquiti', '', '1/07/2020', 80000, '', '', 'Pagadas'),
(529, 'Juan Pablo Cata¤o Mu¤oz', '1036944993', '3226784615', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.23.18', 'Vereda Mampuesto / Finca la ilusi¢n', '6.205031871795654,-75.42095184326172', 'PCQ Facturacion 01/05 Chorrera', 'E0:63:DA:F0:CC:71', '', 'GUSEMO Ubiquiti', '', '30/06/2020', 70000, '', '', 'Pagadas'),
(530, 'Susana Campuzano Pelaez', '1036965507', '3117911742', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.17.11', 'Vereda Mampuesto', '6.204918384552002,-75.42118835449219', 'PCQ Facturacion 01/05 Organo', '64:D1:54:BC:14:2C', '', 'GUSU', '', '30/06/2020', 110000, '', '', 'Pagadas'),
(531, 'Claudia Patricia Callejas Restrepo', '43525869', '3104283415', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.12', 'Vereda el trigal guarne santa elena', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FF:7F:9F', '', 'GUMO', '', '28/06/2020', 80000, '1Pago, $80000.00', '#11797 - 15/09/2021', 'Pendiente de Pago'),
(532, 'Yerson Ochoa Ochoa', '1035922522', '3134713926, 3234216660', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.21.11', 'Vereda Yolombal Finca La Primavera', '', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:9E:14:40', '', 'GUYO2', '', '27/06/2020', 70000, '', '', 'Pagadas'),
(533, 'Julio Enrique Ochoa Ochoa', '70756310', '3106217397', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.9.11', 'Vereda Yolombal', '6.3246416,-75.3955443', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:9E:00:BC', '', 'GUYO1', '', '26/06/2020', 55000, '', '', 'Pagadas'),
(534, 'Edwin Oswaldo Robledo Vargas', '98545208', '3113529733', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.16', 'Vereda Yolombal Finca la Bujana 200 mtros antes chuza los henao', '6.3019336,-75.4157662', 'PCQ Facturacion 15/20 Organo', '64:D1:54:BC:14:E6', '', 'GUSE2', '', '26/06/2020', 80000, '', '', 'Pagadas'),
(535, 'Monica Maria Ramirez Grajales', '43212018', '3226006047', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.12.66', 'Vereda San Jose', '6.245882511138916,-75.4460678100586', 'PCQ Facturacion 15/20 Organo', '64:D1:54:BC:2C:98', '', 'GUGU', '', '25/06/2020', 80000, '', '', 'Pendiente de Pago'),
(536, 'German Dario Saldarriaga Perez', '15349384', '3116425036', 'Plan 15 Megas Parcelacion Las Camelias', '', 'Activo', '', '', '', '172.30.29.17', 'Parcelacion Las Camelias Casa 10', 'Parcelaci¢n Las Camelias, Guarne, Antioquia', 'PCQ Facturacion 15/20 + Iva Chorrera', 'E0:63:DA:9C:EB:32', '', 'GUSEMO2', '', '25/06/2020', 120000, '', '', 'Pagadas'),
(537, 'Luz Marina Riascos Castro', '1086724221', '3124163736', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.29.16', 'Vereda La Mosquita', '', 'PCQ Facturacion 01/05 Chorrera', 'E0:63:DA:9E:17:D9', '', 'GUSEMO2', '', '24/06/2020', 65000, '', '', 'Pagadas'),
(538, 'Paula Andrea Fernandez Pastor', '43978788', '3508778338', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.23.14', 'Vereda la Mosquita Finca David', '6.2069549560546875,-75.44090270996094', 'PCQ Facturacion 15/20 Chorrera', 'E0:63:DA:F0:2F:02', '', 'GUSEMO Ubiquiti', '', '24/06/2020', 80000, '', '', 'Pagadas'),
(539, 'Edwin Yesid Forero Acosta', '14254175', '3138745075, 3207013250', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.22.12', 'Batallon Juan del Corral', '', 'PCQ Facturacion 01/05 Organo', 'E0:63:DA:9E:05:C4', '', 'JDC', '', '23/06/2020', 80000, '', '', 'Pagadas'),
(540, 'Oscar Eduardo Cavadia Granados', '1128475347', '3207013250', 'Plan 6 Megas', '', 'Suspendido', '', '', '', '172.30.22.11', 'Vereda La Playa', '6.2114606,-75.3920681', 'PCQ Facturacion 01/05 Organo', 'E0:63:DA:9E:17:F7', '', 'JDC', '', '23/06/2020', 80000, '1Pago, $80000.00', '#11588 - 01/09/2021', 'Pendiente de Pago'),
(541, 'Edwin Alonso Uribe Hurtado', '71272859', '3102169020', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.29.11', 'Vereda Mosquita Finca 68 Las Mariposas', '', 'PCQ Facturacion 01/05 Chorrera', 'E0:63:DA:9E:24:03', '', 'GUSEMO2', '', '20/06/2020', 70000, '', '', 'Pagadas'),
(542, 'Adriana Maria Ossa Guiral', '43271784', '3013701430', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.18.11', 'Vereda Batea Seca Finca 20A', '6.2990844,-75.4733183', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FF:7F:AB', '', 'SAGUSE', '', '19/06/2020', 70000, '1Pago, $70000.00', '#11799 - 15/09/2021', 'Pendiente de Pago'),
(543, 'Betty Cecilia Duque Perez', '1128423410', '3136228513', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.27.70', 'Vereda el Guamito', '6.231621,-75.386504', 'PCQ Facturacion 15/20 Chorrera', '64:D1:54:BC:12:A7', '', 'GUCHOCA', '', '18/06/2020', 80000, '1Pago, $80000.00', '#11747 - 15/09/2021', 'Pendiente de Pago'),
(544, 'Jorge Ivan Herrera Morales', '15524892', '3218004810', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.9', 'Vereda Chaparral', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FF:7D:BD', '', 'GUSU', '', '18/06/2020', 80000, '', '', 'Pagadas'),
(548, 'Wilberto Juan Berdugo Lechuga', '8704825', '3017398419', 'Plan 6 Megas', '', 'Suspendido', '', '', '', '172.30.7.244', 'La Clara Finca El Encanto\nVereda la Clara', '6.249411,-75.4357473', 'PCQ Facturacion 15/20 Organo', '64:D1:54:BC:14:98', '', 'GUMO', '', '10/06/2020', 80000, '1Pago, $80000.00', '#11068 - 15/08/2021', 'Pendiente de Pago'),
(549, 'Yudy Natali Isaza Mejia', '1010111133', '3157248865', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.9.243', 'Vereda Yolombal', '6.3185019,-75.4021682', 'PCQ Facturacion 01/05 Yolombal', '18:E8:29:32:F7:95', '', 'GUYO1', '', '10/06/2020', 65000, '', '', 'Pagadas'),
(550, 'Nora Patricia Gomez Guisao', '43279076', '3013800579', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.27.18', 'Vereda Gaviria Marinilla', '6.158295,-75.293123', 'PCQ Facturacion 15/20 Chorrera', 'C4:AD:34:52:1D:B5', '', 'GUCHOCA', '', '8/06/2020', 80000, '1Pago, $80000.00', '#11750 - 15/09/2021', 'Pendiente de Pago'),
(551, 'Carlos Mario Garcia Ospina', '1017161872', '3193272960', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.45', 'Parcelaci¢n los cisnes Finca el talamo N§ 24', '', 'ROUTER FIBRA FTTH 01/05', '', '', 'GUSI', '', '5/06/2020', 100000, '', '', 'Pagadas'),
(552, 'Ana Maria Rojas Giraldo', '1151957631', '3167596815', 'Plan 6 Megas', '', 'Activo', '', '', '', '192.168.222.3', 'Juan del corral casino oficiales habitaci¢n 11', '', 'PCQ Facturacion 01/05 Chorrera', 'CC:32:E5:30:EC:C8', '', '', '', '4/06/2020', 80000, '', '', 'Pagadas'),
(553, 'Wyranery Moreno Escobar', '40729527', '3148648119', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.20.233', 'Los Cerezos Torre 1 Apto 902', '', 'PCQ Facturacion 01/05 +IVA Organo', '6C:3B:6B:03:A7:47', '', 'RIGRA', '', '2/06/2020', 55000, '', '', 'Pagadas'),
(554, 'Frilog Colombia SAS', '900757104', '3125226595', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.135', 'Vereda La Laja', '', 'PCQ Facturacion 01/05 +IVA Organo', 'CC:2D:E0:86:59:0B', '', 'GUSU', '', '1/06/2020', 80000, '', '', 'Pagadas'),
(555, 'Astor Rothschild St.Moritz', '19248828', '3042908810', 'Plan 3 Megas', '', 'Suspendido', '', '', '', '172.30.3.238', 'Vereda La Clarita', '', 'PCQ Facturacion 01/05 Organo', '74:4D:28:4E:04:3C', '', 'GUSA', '', '1/06/2020', 55000, '1Pago, $55000.00', '#10850 - 01/08/2021', 'Pendiente de Pago'),
(556, 'Jesus Antonio Ortiz Rios', '1038405954', '3104631801', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.25.13', 'Vereda La Clara Volteadero de las micros', '6.2693417,-75.4143298', 'PCQ Facturacion 01/05 Chorrera', '64:D1:54:BC:14:E4', '', 'GUCHO', '', '30/05/2020', 80000, '', '', 'Pagadas'),
(557, 'Juan Climaco Hoyos Salazar', '70750195', '3174026051', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.28.57', 'Vereda Guapante', '', 'PCQ Facturacion 01/05 Organo', '74:4D:28:C4:BF:36', '', 'GUSE2', '', '29/05/2020', 110000, '', '', 'Pagadas'),
(558, 'Alirio Diaz Rincon', '3358882', '3148431421', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.7.31', 'Vereda la clara', '6.265017,-75.426168', 'PCQ Facturacion 01/05 Organo', '74:4D:28:4E:04:34', '', 'GUMO', '', '27/05/2020', 55000, '', '', 'Pagadas'),
(559, 'Maria Eugenia Echavarria', '43759934', '3148512442', 'Plan 6 Megas', '', 'Activo', '', '', '', '10.130.236.7', 'Calle 40 E # 49-21. Apto 908\nEdificio Ventus', '6.1476927,-75.3701331', 'PCQ Facturacion 15/20 Organo', '6C:3B:6B:99:70:EF', '', 'EDIFICIO VENTUS', '', '22/05/2020', 80000, '', '', 'Pagadas'),
(560, 'Leidy Johana Garzon Gallego', '1036937138', '3116214518', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.12.231', 'Vereda Manpuesto', '6.206405162811279,-75.4145736694336', 'PCQ Facturacion 15/20 Organo', '74:4D:28:4E:04:50', '', 'GUGU', '', '21/05/2020', 70000, '', '', 'Pagadas'),
(561, 'Oscar Hernan Isaza Cardona', '70754028', '3226427235', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.212', 'Vereda Guapante', '6.2768551,-75.4060622', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FF:E5:7D', '', 'GUSE2', '', '19/05/2020', 65000, '', '', 'Pagadas'),
(562, 'Carlos Arturo Quiceno', '70221420', '3017908477', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.211', 'Vereda La Honda', '6.229079,-75.4007837', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:50:C9', '', 'SAGUSE', '', '15/05/2020', 80000, '1Pago, $80000.00', '#11901 - 15/09/2021', 'Pendiente de Pago'),
(563, 'Pascual JanCarlos Castrillon Tejada', '70752823', '3205172596', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.15.207', 'La Enea\nVereda Yolombal', '', 'PCQ Facturacion 15/20 Yolombal', '74:83:C2:EC:63:D2', '', 'GUYO3', '', '14/05/2020', 65000, '', '', 'Pagadas'),
(564, 'Luis Carlos Isaza Ochoa', '70751451', '3117743595, 3223603271', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.9.208', 'Vereda Yolombal', '6.319801,-75.397819', 'PCQ Facturacion 15/20 Yolombal', '74:83:C2:EC:65:3F', '', 'GUYO1', '', '13/05/2020', 65000, '', '', 'Pagadas'),
(565, 'Willdiman Mira Hernandez', '98695287', '3002496661', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.31.34', 'Vereda Yolombal', '6.3249158,-75.406259 Buscar en Google Maps', 'PCQ Facturacion 01/05 Yolombal', '74:83:C2:EC:69:23', '', 'GUYO4', '', '12/05/2020', 70000, '', '', 'Pagadas'),
(566, 'Matthew Ortega Gomez', '1128449082', '3135029005', '200 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.31', 'Vereda La Clara Finca N 512\n3126500088', '6.264205455780029,-75.41456604003906 Buscar en Google Maps', 'ROUTER FIBRA FTTH 15/20', 'F8:75:88:20:87:DF', '', '', '', '12/05/2020', 150000, '', '', 'Pagadas'),
(567, 'Elmer Hernan Cardona Yepes', '70757305', '3153839249', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.16.124', 'Vereda Guapante Arriba por la Escalera', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:0A:E3:37', '', 'GUSE', '', '11/05/2020', 80000, '', '', 'Pagadas'),
(568, 'Wilder Hedmar Bastidas Lopera', '98644860', '3113623315', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.163', 'Vereda Yolombal', '6.32349967956543,-75.40167999267578', 'PCQ Facturacion 15/20 Yolombal', '74:83:C2:EC:67:0D', '', 'GUYO2', '', '11/05/2020', 80000, '', '', 'Pagadas'),
(569, 'Maria Camila Escobar Diaz', '1007291048', '3226739992', 'Plan 6 Megas', '', 'Gratis', '', '', '', '172.30.9.162', 'Vereda Yolombal sector guyo1', '6.268518,-75.418829', 'PCQ Facturacion 01/05 Yolombal', '74:83:C2:EC:62:49', '', 'GUYO1', '', '9/05/2020', 80000, '', '', 'Pagadas'),
(570, 'Marlenny Cardona Gallego', '43210900', '3195046812', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.161', 'Vereda Guapante', '6.269235,-75.419113', 'PCQ Facturacion 01/05 Organo', '74:4D:28:4E:06:01', '', 'GUSE2', '', '8/05/2020', 80000, '', '', 'Pagadas'),
(571, 'Astrid Gallego Ortiz', '1035916303', '3233240962', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.5.14', 'Vereda La Clarita Finca 455', '', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:2C:6D:8F', '', 'GUCA2', '', '6/05/2020', 55000, '', '', 'Pagadas'),
(572, 'Gerardo De La Cruz Jaramillo Jaramillo', '71586506', '3004090588', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.18.157', 'Sector La Caba¤a', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:0A:E2:F7', '', 'SAGUSE', '', '6/05/2020', 135000, '', '', 'Pagadas'),
(573, 'Beatriz Eugenia Lopera Duque', '51762966', '3122891841', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.28.177', 'Vereda San Antonio', '6.256526,-75.361329', 'PCQ Facturacion 01/05 Organo', '', '', 'GUSE2', '', '4/05/2020', 55000, '', '', 'Pagadas'),
(574, 'Jose Uriel Gallego Perez', '17124967', '3128857675', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.153', 'Vereda pueblito via la Hondita', '6.254672,-75.464557', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:70:A0:F9', '', 'GUMO', '', '30/04/2020', 80000, '1Pago, $80000.00', '#11801 - 15/09/2021', 'Pendiente de Pago'),
(575, 'Gladis Maria Ochoa Isaza', '43424205', '3116494045', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.31.151', 'Vereda Yolombal', '6.263173,-75.426280', 'PCQ Facturacion 15/20 Yolombal', '74:83:C2:5A:9D:85', '', 'GUYO4', '', '28/04/2020', 110000, '', '', 'Pagadas'),
(576, 'Joaquin Andres Cardona Escobar', '1035921089', '3205761259', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.150', 'Vereda Guapante', '', 'PCQ Facturacion 01/05 Organo', '64:D1:54:BC:29:3A', '', 'GUSA', '', '28/04/2020', 80000, '', '', 'Pagadas'),
(577, 'Elkin Dario Herrera Florez', '70753488', '3117380848', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.16.148', 'Vereda Guapante', '6.274758,-75.436363', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FF:91:F1', '', 'GUSE', '', '27/04/2020', 65000, '', '', 'Pagadas'),
(578, 'Paula Cristina Idarraga Lopez', '1036959017', '3108114323', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.9.127', 'vereda Yolombal', '6.317868,-75.397386', 'PCQ Facturacion 15/20 Yolombal', '68:D7:9A:92:DA:EA', '', 'GUYO1', '', '27/04/2020', 135000, '1Pago, $126000.00', '#11983 - 15/10/2021', 'Pendiente de Pago'),
(579, 'Yefer Estiven Ochoa Osorio', '1035921270', '3116454868', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.146', 'Vereda Yolombal', '6.269235,-75.419113', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:46:3C:D2', '', 'GUYO2', '', '24/04/2020', 80000, '', '', 'Pagadas'),
(580, 'Brian de Jesus Berrio Perez', '1037544061', '3205550893', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.101', 'Vereda Yolombal', '6.268518,-75.422106', 'PCQ Facturacion 15/20 Yolombal', '68:D7:9A:92:DB:22', '', 'GUYO1', '', '23/04/2020', 80000, '1Pago, $80000.00', '#11769 - 15/09/2021', 'Pendiente de Pago'),
(581, 'Gabriel Jaime Restrepo Mejia', '8299993', '3113274581', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.15.21', 'Vereda Yolombal', '6.324885,-75.406252', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:46:16:CC', '', 'GUYO3', '', '23/04/2020', 80000, '', '', 'Pagadas'),
(582, 'Ana Cecilia Roldan Palacio', '42875143', '3014089463', 'Plan 10 Megas Julio', '', 'Activo', '', '', '', '172.30.33.35', 'Parcelacion Camelias', 'Parcelaci¢n Las Camelias, Guarne, Antioquia', 'PCQ Facturacion 01/05 + Iva Chorrera', 'CC:2D:E0:CF:EB:97', '', 'GUCHO2', '', '23/04/2020', 80000, '', '', 'Pagadas'),
(583, 'Diana Patricia Zapata Londo¤o', '43656684', '3006794259', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.15.135', 'Vereda Yolombal', '', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:46:3D:33', '', 'GUYO3', '', '17/04/2020', 135000, '', '', 'Pagadas'),
(584, 'Yadira Martinez Girardo', '43157444', '3012700905', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.8.137', 'Vereda Monta¤es', '6.252134,-75.425382', 'PCQ Facturacion 15/20 San Bernardo', '74:4D:28:42:D1:9F', '', 'GUTO', '', '13/04/2020', 80000, '1Pago, $80000.00', '#11699 - 15/09/2021', 'Pendiente de Pago'),
(585, 'Luis Evelio Zuluaga Arias', '71576573', '3118775216', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.209', 'Vereda Batea Seca', '6.295341,-75.474014', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:69:A4:45', '', 'SAGUSE', '', '13/04/2020', 80000, '1Pago, $80000.00', '#11973 - 15/09/2021', 'Pendiente de Pago'),
(586, 'Gloria Cielo Isaza Jaramillo', '1035915044', '3145464042', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.15.133', 'Vereda Yolombal', '6.268518,-75.422106', 'PCQ Facturacion 01/05 Yolombal', '18:E8:29:8C:CF:51', '', 'GUYO3', '', '9/04/2020', 80000, '', '', 'Pagadas'),
(587, 'Angela Maria Gallego Ochoa', '43423783', '3192180398, 3114173501', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.12.43', 'CRA 50 Nø 53 43, Barrio Santo Tomas, Guarne.', '6.270720,-75.437994', 'PCQ Facturacion 01/05 Organo', '74:4D:28:42:2B:BD', '', 'GUGU', '', '9/04/2020', 55000, '1Pago, $55000.00', '#11474 - 01/09/2021', 'Pendiente de Pago'),
(588, 'Albeiro Henao Zuluaga', '80274454', '3104226515', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.110', 'Vereda La Clara Finca Montecarlo', '6.265170097351074,-75.43587493896484', 'PCQ Facturacion 01/05 +IVA Organo', 'E4:8D:8C:B4:9C:A5', '', 'GUSA', '', '4/04/2020', 80000, '', '', 'Pagadas'),
(589, 'Santiago Alonso Ocampo Duque', '70567040', '3216488584', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.61', 'Vereda La Clara - Casa Amarilla', '6.270564,-75.427911', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '31/03/2020', 80000, '', '', 'Pagadas'),
(590, 'Johnny Alejandro Jaramillo Herrera', '1037625721', '3128700642', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.4.131', 'Vereda La Claria Finca 479', '', 'PCQ Facturacion 15/20 Organo', '74:4D:28:42:94:7F', '', 'GUCA', '', '24/03/2020', 80000, '1Pago, $80000.00', '#11862 - 15/09/2021', 'Pendiente de Pago'),
(591, 'Alvaro Enrique Alvarez Sierra', '1102816630', '3173806437', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.56', 'Vereda La Clara', '', 'ROUTER FIBRA FTTH 15/20', '74:4D:28:43:FC:6E', '', '', '', '24/03/2020', 80000, '', '', 'Pagadas'),
(592, 'Gloria Stella Orozco Salazar', '43798222', '3127014133', 'Plan 3 Megas', '', 'Activo', '', '', '', '192.168.102.13', 'Vereda La Clarita', '6.268532,-75.421564', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '20/03/2020', 55000, '1Pago, $55000.00', '#11968 - 15/09/2021', 'Pendiente de Pago'),
(593, 'Luis Fernando Rios Sanchez', '3227119', '3117762419', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.11.129', 'Vereda la Clara parte baja', '', 'PCQ Facturacion 15/20 Organo', 'E0:63:DA:42:FD:AC', '', 'GUSA2', '', '20/03/2020', 55000, '1Pago, $55000.00', '#11851 - 15/09/2021', 'Pendiente de Pago'),
(594, 'Lina Maria Cadavid Velez', '32257807', '3013704384', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.145', 'Vereda Yolombal', '6.326605319976807,-75.40087890625', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:9D:F5:C0', '', 'GUYO2', '', '20/03/2020', 80000, '1Pago, $80000.00', '#11770 - 15/09/2021', 'Pendiente de Pago'),
(595, 'Antonio William Arango Hurtado', '4507764', '3046581409', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.101.71', 'Vereda La Clarita', '6.266397,-75.414515', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '20/03/2020', 70000, '', '', 'Pagadas'),
(596, 'Maria Cristina Escudero Ossa', '39453346', '3128859508', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.18.123', 'Vereda San Isidro Finca 50', '6.28221,-75.46116', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FF:95:3B', '', 'SAGUSE', '', '19/03/2020', 70000, '1Pago, $70000.00', '#11910 - 15/09/2021', 'Pendiente de Pago'),
(597, 'Mario Alberto Quijano Abril', '13720639', '3014056429', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.27.17', 'Vereda Berracal\nFinca 110 - El Cielo\n\nEstrato4', '6.218502,-75.403378', 'PCQ Facturacion 15/20 + Iva Chorrera', 'CC:2D:E0:70:A4:15', '', 'GUCHOCA', '', '19/03/2020', 110000, '', '', 'Pagadas'),
(598, 'Mario German Cruz Angel', '89007633', '3137461256', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.118', 'Vereda La Clarita', '6.242304,-75.428659', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '19/03/2020', 80000, '1Pago, $80000.00', '#11833 - 15/09/2021', 'Pendiente de Pago'),
(599, 'Jorge Leon Zapata Vahos', '70756487', '3002818154', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.25.116', 'Vereda Sector Monte Oscuro', '6.278349,-75.579392', 'PCQ Facturacion 01/05 Chorrera', 'CC:2D:E0:70:A6:6B', '', 'GUCHO', '', '18/03/2020', 80000, '', '', 'Pagadas'),
(600, 'Edinson Horacio Restrepo Velasquez', '79930144', '3217618923', 'Plan dinamico 3 - 6 Megas', '', 'Activo', '', '', '', '172.30.18.115', 'Vereda La Clarita', '', 'PCQ Facturacion 15/20 Organo', '74:4D:28:42:27:EF', '', 'SAGUSE', '', '18/03/2020', 65000, '', '', 'Pagadas'),
(601, 'Jaime Alberto Sanchez Charry', '71685152', '3108235107', 'Plan dinamico 3 - 10 Megas', '', 'Activo', '', '', '', '172.30.18.113', 'Vereda Honda via el Pueblito', '6.254104,-75.462233', 'PCQ Facturacion 15/20 Organo', '64:D1:54:BC:2E:F0', '', 'SAGUSE', '', '17/03/2020', 85000, '', '', 'Pagadas'),
(602, 'Herwing Villabona Rueda', '13845313', '3005725591', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.2.28', 'Vereda La Clara', '6.269235,-75.419113', 'PCQ Facturacion 15/20 Organo', '74:4D:28:42:2D:9B', '', 'GURI', '', '17/03/2020', 80000, '1Pago, $80000.00', '#11855 - 15/09/2021', 'Pendiente de Pago'),
(603, 'Felipe Ramirez Sanchez', '1152462303', '3128913828', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.7.17', 'La Mosquita', '6.265242,-75.422106', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:B0:E6', '', 'GUMO', '', '16/03/2020', 135000, '', '', 'Pagadas'),
(604, 'Juan Jose Escobar Lopez', '8033268', '3206823980', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.108', 'Parcelacion Sierra de las Macarenas', '6.265242,-75.422106', 'PCQ Facturacion 01/05 +IVA Organo', 'B8:69:F4:AC:6D:34', '', 'GUSU', '', '16/03/2020', 80000, '', '', 'Pagadas'),
(605, 'Diana Gaviria Monsalve', '1036608024', '3017830401', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.120', 'Vereda Yolombal', '6.265242,-75.422106', 'PCQ Facturacion 15/20 Yolombal', '24:A4:3C:FA:8D:A0', '', 'GUYO2', '', '13/03/2020', 80000, '', '', 'Pagadas'),
(606, 'Jose Aldemar Zapata Rua', '70750732', '3205532904', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.26.21', 'Vereda El Salado', '6.265242,-75.422106', 'PCQ Facturacion 01/05 San Bernardo', 'B8:69:F4:D1:E2:FB', '', 'GUAVI', '', '13/03/2020', 65000, '', '', 'Pagadas'),
(607, 'Deyanira Ceballos Ochoa', '43211133', '3192843285', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.16.97', 'Vereda Guapante', '6.288179,-75.435213', 'PCQ Facturacion 15/20 Organo', '74:4D:28:41:07:8F', '', 'GUSE', '', '9/03/2020', 65000, '', '', 'Pagadas'),
(608, 'Ruben Antonio Herrera Castro', '15433516', '3128550310', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.16.98', 'Vereda Guapante', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:B7:74:B3', '', 'GUSE', '', '9/03/2020', 80000, '', '', 'Pagadas'),
(611, 'Diana Carolina Lopez Mariaca', '1037591802', '3103473654, 3233276128', 'Plan 20 Megas', '', 'Activo', '', '', '', '172.30.31.19', 'Vereda La Brizuela', '6.288179,-75.435213', 'PCQ Facturacion 15/20 Yolombal', 'FC:EC:DA:CC:2F:47', '', 'GUYO4', '', '7/03/2020', 200000, '1Pago, $200000.00', '#11772 - 15/09/2021', 'Pendiente de Pago'),
(612, 'Hernan Dario Herrera Rivera', '70756335', '3214265702', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.92', 'Vereda Guapante', '6.288179,-75.435213', 'PCQ Facturacion 15/20 Organo', '64:D1:54:9C:25:8A', '', 'GUSE2', '', '5/03/2020', 80000, '', '', 'Pagadas'),
(613, 'Alejandra Katherine Hincapie Agudelo', '1001723926', '3205669481', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.23.33', 'vereda la mosquita\nestrato 1', '6.210754,-75.450300', 'PCQ Facturacion 01/05 Chorrera', 'E0:63:DA:F0:34:A8', '', 'GUSEMO Ubiquiti', '', '4/03/2020', 70000, '', '', 'Pagadas'),
(614, 'Diana Marcela Londo¤o Ossa', '1035911028', '3146055217', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.12.89', 'Vereda Guapante Arriba Cerca a la Capilla', '6.272573,-75.405970', 'PCQ Facturacion 01/05 Organo', '', '', 'GUSE2', '', '4/03/2020', 55000, '', '', 'Pagadas'),
(615, 'Juan Esteban Duque Herrera', '1193474921', '3012831314', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.25.34', 'vereda guamito 3008912710', '6.234651,-75.389443', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:B9:8C:F5', '', 'GUCHO', '', '2/03/2020', 80000, '', '', 'Pagadas'),
(616, 'Lucia stella Tamayo Acevedo', '42762799', '3136454111', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.3.86', 'Casa Amor', '6.295996,-75.422819', 'PCQ Facturacion 01/05 Organo', '74:4D:28:42:11:1D', '', 'GUSA', '', '29/02/2020', 80000, '', '', 'Pagadas'),
(617, 'Maria Lucelly Arbelaez Carvajal', '21873975', '3146965508', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.14.85', 'Rionegro, Km2 v¡a La Ceja, Parcelaci¢n La Pradera Casa 52.', '', 'PCQ Facturacion 01/05 +IVA Organo', '74:4D:28:C4:BF:56', '', 'SERI', '', '28/02/2020', 80000, '', '', 'Pagadas'),
(618, 'Jaime Alberto Garcia Gomez', '8013042', '3117531566', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.5.84', 'Vereda La Clara parte alta', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:90:AE:DF', '', 'GUCA2', '', '28/02/2020', 80000, '', '', 'Pagadas'),
(619, 'Alejandro Castro Buitrago', '1035917513', '3022901974', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.78', 'Vereda La Clara HARVEST', '6.2718897,-75.4235741', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '28/02/2020', 80000, '', '', 'Pagadas'),
(620, 'Sergio Mario Ospina Cardona', '15930568', '3147745714', 'Plan 4 Megas', '', 'Suspendido', '', '', '', '172.30.5.82', 'Vereda la Clara donde voltea la micro', '6.295996,-75.422819', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:57:B1', '', 'GUCA2', '', '27/02/2020', 65000, '1Pago, $65000.00', '#11071 - 15/08/2021', 'Pendiente de Pago'),
(621, 'Gisela Maria Ochoa Lopez', '43210206', '3206649747', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.21.134', 'Guarne El Pueblo', '6.328211,-75.391667', 'PCQ Facturacion 15/20 Yolombal', '18:E8:29:D0:0C:5C', '', 'GUYO2', '', '27/02/2020', 55000, '', '', 'Pagadas'),
(622, 'Jhon Snaifre Pineda Contreras', '20982350', '3117776083', 'Plan 3 Megas', '', 'Cancelado', '', '', '', '172.30.18.60', 'Guarne', '6.273351,-75.439639', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:6A:35:32', '', 'SAGUSE', '', '25/02/2020', 55000, '', '', 'Pendiente de Pago'),
(623, 'Margarita Lopez Vega', '32410252', '3107272146', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.19.139', 'Carrera 62A #48-95\nUrbanizaci¢n Piamonte', '6.153808,-75.382188', 'PCQ Facturacion 15/20 +IVA Organo', '74:4D:28:42:C4:6B', '', 'RIALE', '', '21/02/2020', 135000, '', '', 'Pagadas'),
(624, 'Humberto Alirio Herrera Herrera', '70753706', '3116247218', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.30', 'Vereda Guapante', '6.276071,-75.402931', 'PCQ Facturacion 15/20 Organo', '74:4D:28:42:D1:F7', '', 'GUSE2', '', '20/02/2020', 65000, '', '', 'Pagadas'),
(625, 'Felipe Ignacio Erazo Angel', '3438665', '3004082466', 'Plan 10 Megas', '', 'Cancelado', '', '', '', '172.30.18.41', 'Piedras Blancas en toda la principal de la autopista Medellin Bogota\nEstrato 3', '6.286752,-75.451063', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:86:55:FB', '', 'SAGUSE', '', '17/02/2020', 135000, '', '', 'Pendiente de Pago'),
(626, 'Luz Aleida Marin Ochoa', '43211336', '3116343706', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.68', 'vereda yolombal', '6.257869,-75.428659', 'PCQ Facturacion 15/20 Yolombal', 'FC:EC:DA:CC:2F:7F', '', 'GUYO2', '', '16/02/2020', 80000, '', '', 'Pagadas'),
(627, 'Rocio Rios Gil', '43793727', '3117996103', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.6.64', 'Vereda Vega de la Clara', '6.263916,-75.428101', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:94:EB:7B', '', 'GUSI', '', '12/02/2020', 65000, '', '', 'Pagadas'),
(628, 'Laura Milena Alzate Betancour', '1037588356', '3127858158', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '172.30.4.59', 'Vereda la Clara, Guarne', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '12/02/2020', 70000, '', '', 'Pagadas'),
(629, 'Inversiones Pizarro Laverde SAS', '900707198', '3148300247', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.20.199', 'Cra 39 A 62 30 Estacion De Servicio\n\nCiclo 123', '', 'PCQ Facturacion 15/20 +IVA Organo', '74:4D:28:42:97:B9', '', 'RIGRA', '', '11/02/2020', 80000, '', '', 'Pagadas'),
(630, 'Rodrigo Andres Rios Cuellar', '80092205', '3196845176', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.116', 'Vereda La Clara', '6.264422,-75.43849', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '6/02/2020', 100000, '', '', 'Pagadas'),
(631, 'Stella De Jesus Montoya Montoya', '32398810', '3104343072', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.6.54', 'vereda la clara 507a', '6.257869,-75.432755', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:36:6D:AB', '', 'GUSI', '', '3/02/2020', 55000, '', '', 'Pagadas'),
(632, 'Claudia Andrea Atehortua Casas', '32562841', '3225175305', 'Plan 5 Megas', '', 'Activo', '', '', '', '192.168.102.28', 'vereda la clara parcelacion los cisne', '6.257869,-75.432755', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '3/02/2020', 70000, '', '', 'Pagadas'),
(633, 'Pilar Patricia Calderon Gomez', '43906971', '3216101311', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.12.56', 'Vereda El Establo unidad El Roble - Santa Elena.', '', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:96:AB:99', '', 'GUGU', '', '1/02/2020', 55000, '', '', 'Pagadas'),
(634, 'Yuledy Salazar Saldarriaga', '35921587', '3136875507, 3127735679', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.15', 'Vereda Guapante', '6.253773,-75.431936', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:B9:72:CD', '', 'GUSE2', '', '31/01/2020', 65000, '', '', 'Pagadas'),
(635, 'Sandra Milena Jaramillo Barrietos', '1017191985', '3024235659', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.53', 'Vereda Guamito Finca Montecarlo', '6.235186,-75.382072', 'PCQ Facturacion 01/05 +IVA Organo', 'C4:AD:34:94:35:5B', '', 'GUSU', '', '30/01/2020', 80000, '', '', 'Pagadas'),
(636, 'Nini Yohana Martinez Cardona', '43211597', '3192462944', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.52', 'Vereda guapante abajo', '6.287099,-75.405325', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:6A:35:8F', '', 'GUSE2', '', '30/01/2020', 80000, '', '', 'Pagadas'),
(637, 'Sergio Andres Cossio Dederle', '71333971', '3113175344', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.51', 'Vereda Yolombal', '6.251315,-75.425382', 'PCQ Facturacion 15/20 Yolombal', '74:83:C2:5A:9C:E8', '', 'GUYO2', '', '25/01/2020', 80000, '', '', 'Pagadas'),
(638, 'Angela Chaverra Quintero', '43919242', '3104279036', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.11.50', 'vereda hoja anchas', '6.251315,-75.425382', 'PCQ Facturacion 01/05 Organo', '74:83:C2:5A:9C:AA', '', 'GUSA2', '', '24/01/2020', 55000, '', '', 'Pagadas'),
(639, 'Luz Elvira Vasquez Monsalve', '43811105', '3192718811, 3207198593', '300 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.59', 'Vereda La Clara', '6.270371,-75.425467', 'ROUTER FIBRA FTTH 15/20', 'B8:69:F4:0A:E7:95', '', '', '', '20/01/2020', 200000, '', '', 'Pagadas'),
(640, 'Santiago de Jesus Araque Rios', '1035911641', '3045925718', 'Plan 3 Megas', '', 'Activo', '', '', '', '192.168.102.122', 'Vereda La Clara', '6.2663750,-75.4256396', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '18/01/2020', 55000, '', '', 'Pagadas'),
(642, 'Sergio Quintero Botero', '71788894', '3147922048', 'Plan dinamico 3 - 6 Megas', '', 'Activo', '', '', '', '172.30.16.201', 'Vereda La Clarita', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:4F:DB', '', 'GUSE', '', '15/01/2020', 65000, '', '', 'Pagadas'),
(643, 'Luis Fernando Velez Sierra', '98571257', '3207255993', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.6.58', 'vereda la clara\nsector vegas de la clara', '6.2631333,-75.4282348', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:50:75', '', 'GUSI', '', '14/01/2020', 55000, '', '', 'Pagadas'),
(644, 'Laura Gomez Uribe', '1037608384', '3022816058, 3138827248', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.4.124', 'Vereda San Jose condominio Terrasanta', '6.245940,-75.446398', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:0A:E4:F9', '', 'GUCA', '', '13/01/2020', 135000, '', '', 'Pagadas'),
(645, 'Jeison Andres Buitrago Bedoya', '98712482', '3168271810', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.21.253', 'Vereda Yolombal', '6.260326,-75.432755', 'PCQ Facturacion 01/05 Yolombal', '74:83:C2:5A:9E:17', '', 'GUYO2', '', '11/01/2020', 135000, '', '', 'Pagadas'),
(646, 'Roberto Ramos Herrera', '70081745', '3218777430', 'Plan 3 Megas', '', 'Suspendido', '', '', '', '172.30.12.38', 'Vereda toldas, sector la guitarra', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:B7:6C:29', '', 'GUGU', '', '10/01/2020', 55000, '2Pagos, $120000.00', '#9624 - 15/06/2021', 'Pendiente de Pago'),
(647, 'William Bladimir Londo¤o Cardona', '70755516', '3016045859', 'Plan 4 Megas Descuento', '', 'Activo', '', '', '', '172.30.3.37', 'Vereda Bellavista, cerca a la Parcelaci¢n la Pinera', '6.250852,-75.414530', 'PCQ Facturacion 15/20 Organo', '74:4D:28:42:34:C5', '', 'GUSA', '', '9/01/2020', 55000, '', '', 'Pagadas'),
(648, 'Luis Alejandro Montes Riveros', '8064308', '3013969216, 3506685517', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.18.39', 'Vereda El Palmar', '6.308188,-75.42003', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:B7:6B:E5', '', 'SAGUSE', '', '9/01/2020', 65000, '', '', 'Pagadas'),
(649, 'Luis Horacio Mejia Restrepo', '71663697', '3177161462, 3146796724', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.18.40', 'Vereda El Palmar', '6.308188, -75.424003', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:53:23', '', 'SAGUSE', '', '9/01/2020', 55000, '', '', 'Pagadas'),
(650, 'Luz Edilma Grisales Ortiz', '39454026', '3127609084', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.27.22', 'Vereda La Mosquita - cerca de la finca la cabalgata', '', 'PCQ Facturacion 01/05 Chorrera', 'E4:8D:8C:B5:09:33', '', 'GUCHOCA', '', '5/01/2020', 65000, '', '', 'Pagadas'),
(651, 'Diana Marcela Gutierrez Bolivar', '32209568', '3122119835, 3007825175', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.61', 'Vereda La Clara parte baja finca 11', '6.260028,-75.431896', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '31/12/2019', 80000, '', '', 'Pagadas'),
(652, 'Dalia Lorena Caicedo Ibarguen', '66731346', '3104961663', 'Plan 3 Megas', '', 'Suspendido', '', '', '', '172.30.16.33', 'escuela vereda guapante\nsede juan maria gallego', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:D1:FE:E9', '', 'GUSE', '', '30/12/2019', 55000, '', '', 'Pendiente de Pago'),
(653, 'Olga Lucia Gutierrez Zapata', '43657480', '3197865266', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.25.28', 'Vereda La Clara parte baja', '6.2561545,-75.4313142', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:5F:DB:3D', '', 'GUCHO', '', '30/12/2019', 70000, '', '', 'Pagadas'),
(654, 'Milton Andres Chica', '1037578903', '3208337074', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.12.30', 'Vereda batea seca', '6.299983,-75.461061', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:B7:70:AD', '', 'GUGU', '', '28/12/2019', 55000, '', '', 'Pagadas'),
(655, 'Jorge Eduardo Barrera Vargas', '74750864', '3105082361', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.31', 'Vereda La Clara parte baja Finca N 4', '', 'PCQ Facturacion 15/20 Organo', '12:34:56:78:91:23', '', 'GUSA', '', '28/12/2019', 80000, '1Pago, $80000.00', '#11806 - 15/09/2021', 'Pendiente de Pago'),
(656, 'Marcela Rios Achagua', '1036634631', '3195904073', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.31', 'Vereda piedras blancas sector la cuchilla', '6.279094,-75.484215', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:4E:83:60', '', 'SAGUSE', '', '26/12/2019', 80000, '', '', 'Pagadas'),
(657, 'Ferney Cortes Valencia', '71716761', '3188068430', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.21.24', 'Vereda Yolombal', '', 'PCQ Facturacion 01/05 Yolombal', '74:83:C2:5A:A1:00', '', 'GUYO2', '', '21/12/2019', 55000, '', '', 'Pagadas'),
(658, 'Luis Mariano Urrego Giraldo', '8303478', '3136724252', '30 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.39', 'Vereda La Clara - Parcelaci¢n Los Cisnes', '', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '19/12/2019', 70000, '', '', 'Pagadas'),
(659, 'Fabian Andres Giraldo Gomez', '71387785', '3002607813, 3003573777', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.23', 'Via Yolombal 500mtrs del acopio', '6.303249,-75.425871', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:F4:8C:63', '', 'GUSE2', '', '18/12/2019', 80000, '', '', 'Pagadas'),
(660, 'Dora Luz Isaza Florez', '43424352', '3152698995', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.89', 'Vereda Yolombal', '', 'PCQ Facturacion 01/05 Yolombal', '18:E8:29:D0:0A:9C', '', 'GUYO1', '', '9/12/2019', 80000, '', '', 'Pagadas'),
(661, 'Manuel Alejandro Isaza Isaza', '1035918464', '3114067736', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.21.103', 'Yolombal finca el naranjo', '6.318045,-75.397962', 'PCQ Facturacion 01/05 Yolombal', 'B4:FB:E4:33:2A:C7', '', 'GUYO2', '', '6/12/2019', 70000, '', '', 'Pagadas'),
(662, 'Mary Luz Salazar Giraldo', '43677441', '3194630083', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.31', 'Mall Puerto bulevar\nApto 303', '6.1253268,-75.4232187', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:D1:FA:BB', '', 'GUGU', '', '5/12/2019', 80000, '', '', 'Pagadas'),
(663, 'Rosalba de Jesus Ortiz Ortiz', '21785715', '3206492750', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.13', 'Vereda La Mosquita', '6.2060058,-75.4307367', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:D1:FA:C1', '', 'GUGU', '', '5/12/2019', 80000, '', '', 'Pagadas'),
(664, 'Juan David Valencia Quintero', '16074015', '3007928995', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.21.177', 'Vereda Yolombal', '6.260326,-75.432755', 'PCQ Facturacion 15/20 Yolombal', 'B4:FB:E4:32:28:12', '', 'GUYO2', '', '5/12/2019', 55000, '1Pago, $55000.00', '#11775 - 15/09/2021', 'Pendiente de Pago'),
(665, 'Deisy Yurany Isaza Alzate', '1035917944', '3216199829', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.15.248', 'Vereda Yolombal', '', 'PCQ Facturacion 01/05 Yolombal', '18:E8:29:86:43:E8', '', 'GUYO3', '', '3/12/2019', 55000, '', '', 'Pagadas'),
(666, 'Sergio Cano Ochoa', '1001415071', '3015497121, 3186233989', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.8.9', 'Guarne', '', 'PCQ Facturacion 01/05 San Bernardo', 'B8:69:F4:B7:6C:27', '', 'GUTO', '', '2/12/2019', 55000, '', '', 'Pagadas'),
(667, 'Angela Maria Londo¤o Garcia', '43627517', '3128500638', 'Plan 20 Megas', '', 'Activo', '', '', '', '172.30.2.213', 'Vereda Toldas', '6.225232,-75.408000', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:FF:F2:23', '', 'GURI', '', '1/12/2019', 200000, '', '', 'Pagadas'),
(668, 'Andres Mauricio Blandon Estrada', '1112775067', '3163482627', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.25.97', 'Vereda La Mosquita', '', 'PCQ Facturacion 15/20 Chorrera', '00:04:56:51:33:D9', '', 'GUCHO', '', '27/11/2019', 80000, '', '', 'Pagadas'),
(669, 'Sandra Milena Hincapie Carmona', '66780937', '3164503604', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.2.27', 'Vereda Bellavista', '6.232053,-75.407506', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:50:7D', '', 'GURI', '', '21/11/2019', 80000, '1Pago, $80000.00', '#11807 - 15/09/2021', 'Pendiente de Pago'),
(670, 'Jairo Perdomo Claros', '12263689', '3105335470', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.28.49', 'Guarne', '6.316687,-75.429038', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:66:D5:DF', '', 'GUSE2', '', '19/11/2019', 135000, '1Pago, $135000.00', '#11808 - 15/09/2021', 'Pendiente de Pago'),
(671, 'John Jairo Gomez Urrea', '70073949', '3155072566', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.15', 'Vereda San Jose, Parcelacion Terra Santa', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:B7:69:07', '', 'GUGU', '', '18/11/2019', 80000, '', '', 'Pagadas'),
(672, 'Luz Irene Bouhot Arroyave', '32315464', '3217010635', '120 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.60', 'Vereda la Clara', '6.2632193,-75.4266031', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '18/11/2019', 120000, '', '', 'Pagadas'),
(673, 'Diana Milena Ochoa Castrillon', '1035913524', '3107086873', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.16.168', 'Vereda La Mej¡a.', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:97:BF:4F', '', 'GUSE', '', '14/11/2019', 65000, '', '', 'Pagadas'),
(674, 'Saira Vanessa Restrepo Valencia', '1039453163', '3183964777', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.12.20', 'Vereda La Mosquita', '6.204645,-75.440392', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:DA:EB', '', 'GUGU', '', '8/11/2019', 70000, '', '', 'Pagadas'),
(675, 'Teresa Evelia Mejia de Smith', '32399275', '3216391755', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.18.196', 'Vereda La Pastorcita', '6.310180,-75.470117', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:96:A0:81', '', 'SAGUSE', '', '7/11/2019', 55000, '', '', 'Pagadas'),
(676, 'Wendy Vanessa Isaza Mejia', '1035918708', '3503609837', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.9.99', 'Yolombal', '6.3184483,-75.39745', 'PCQ Facturacion 15/20 Yolombal', '18:E8:29:D0:0A:6F', '', 'GUYO1', '', '1/11/2019', 55000, '', '', 'Pagadas'),
(677, 'Reinaldo de Jesus Zapata Florez', '70751138', '3196500529', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.16.121', 'Vereda Guapante abajo', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:B7:54:B7', '', 'GUSE', '', '25/10/2019', 55000, '', '', 'Pagadas'),
(678, 'Yomaira Andrea Ochoa', '32108144', '3017847240', '90 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.86', 'Finca Miel', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '25/10/2019', 100000, '', '', 'Pagadas'),
(679, 'Adriana Milena Jimenez Lopez', '43986261', '3103985111', 'Plan Mall', '', 'Activo', '', '', '', '172.31.4.5', 'Mall Los Comuneros', '', 'PCQ Facturacion 15/20 Chorrera', '98:DA:C4:94:A9:44', '', '', '', '24/10/2019', 65000, '', '', 'Pagadas'),
(680, 'Esteban Vallejo Bocanumen', '71781338', '3006701354, 3003798741', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.12.104', 'Parcelacion Los Cisnes', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:B9:73:87', '', 'GUGU', '', '24/10/2019', 135000, '1Pago, $135000.00', '#11809 - 15/09/2021', 'Pendiente de Pago'),
(681, 'Jose David Gaviria Soto', '71712237', '3148495897', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.3.19', 'Vereda la clara\nLos mangeros', '6.263764,-75.425324', 'PCQ Facturacion 15/20 Organo', 'C4:AD:34:4E:07:5A', '', 'GUSA', '', '22/10/2019', 55000, '', '', 'Pagadas'),
(682, 'MaryLuz Isaza Isaza', '1035915247', '3137639582', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.15.102', 'yolombal', '', 'PCQ Facturacion 15/20 Yolombal', '18:E8:29:D0:12:5A', '', 'GUYO3', '', '16/10/2019', 80000, '1Pago, $80000.00', '#11924 - 15/09/2021', 'Pendiente de Pago'),
(683, 'Jhon Wilfer Quintero Mejia', '1036927408', '3145612854', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.17.29', 'Vereda Los Pinos', '6.209460,-75.345680', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:96:A8:3B', '', 'GUSU', '', '9/10/2019', 55000, '', '', 'Pagadas'),
(684, 'Gloria Patricia Arias Henao', '43464139', '3127083183', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.3.160', 'Vereda la clara, V¡a los Mangueros', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:B9:75:A1', '', 'GUSA', '', '4/10/2019', 55000, '1Pago, $55000.00', '#11707 - 15/09/2021', 'Pendiente de Pago'),
(685, 'Santiago Molina Saldarriaga', '3347276', '3225558475', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.177', 'Vereda Yolombal Finca 70', 'undefined', 'PCQ Facturacion 15/20 Yolombal', '18:E8:29:32:D4:D2', '', 'GUYO1', '', '3/10/2019', 80000, '', '', 'Pagadas'),
(686, 'Luis Guillermo Valencia Villa', '8312365', '3116292020', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.4.130', 'Vereda la clarita finca 144', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:B7:56:91', '', 'GUCA', '', '2/10/2019', 80000, '1Pago, $80000.00', '#11810 - 15/09/2021', 'Pendiente de Pago'),
(687, 'Felipe Tamayo Zapata', '1020422825', '3104974595', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.58', 'Vereda Yolombal GUYO', '', 'PCQ Facturacion 15/20 Yolombal', '18:E8:29:32:F3:66', '', 'GUYO1', '', '30/09/2019', 80000, '', '', 'Pagadas'),
(688, 'Juan David Casta¤eda Casta¤o', '1039470352', '3014457297', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.2.50', 'Chaparral via Bellavista', '', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:FA:18:AB', '', 'GURI', '', '27/09/2019', 110000, '', '', 'Pagadas'),
(689, 'Certioriente SAS', '900533888', '0345575188, 3008765560', 'Plan CERTIORIENTE', '', 'Activo', '', '', '', '192.168.101.12', 'Carrera 51 42A 31', '', 'ROUTER FIBRA FTTH 15/20 + IVA', '', '', '', '', '25/09/2019', 250000, '', '', 'Pagadas'),
(690, 'Luis Camilo Barreto Hernandez', '98669632', '3166081806', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.2.140', 'CL 37 # 53 - 241 T 1 APT 201\nURB. VILLAS DEL RIO', '', 'PCQ Facturacion 15/20 Organo', '64:D1:54:52:CA:0B', '', 'GURI', '', '25/09/2019', 135000, '', '', 'Pagadas'),
(691, 'Mauricio Rivera Cardona', '70755110', '3185452519', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.16.163', 'Guapante Arriba', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5F:3A:BB', '', 'GUSE', '', '24/09/2019', 65000, '1Pago, $65000.00', '#11812 - 15/09/2021', 'Pendiente de Pago'),
(692, 'Nella Del Socorro Florez Ochoa', '43210849', '3217691235', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.16.162', 'Guapante Arriba', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:D1:E2:69', '', 'GUSE', '', '12/09/2019', 55000, '', '', 'Pagadas'),
(693, 'Poliuretanos Bogota SAS', '901327071', '3006701354, 3022282186', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.18.161', 'KM 21 Aut Medellin Bogota, Centro Empresarial Puerta de Oriente BG 48.', '', 'PCQ Facturacion 15/20 +IVA Organo', 'B8:69:F4:B7:54:1D', '', 'SAGUSE', '', '11/09/2019', 135000, '', '', 'Pagadas'),
(694, 'Andres Gonzalo Santa Ospina', '1035910350', '3122530539', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.18.35', 'San Antonio parte alta', '', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:86:5F:4B', '', 'SAGUSE', '', '11/09/2019', 70000, '1Pago, $70000.00', '#11814 - 15/09/2021', 'Pendiente de Pago'),
(695, 'Carnes Y Porcinos SAS', '900812273', '3217791468', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.12.131', 'CR 29 A 8 SUR 51 AP 205', '', 'PCQ Facturacion 15/20 +IVA Organo', 'CC:DE:06:A3:3F:54', '', 'GUGU', '', '10/09/2019', 55000, '1Pago, $65450.00', '#11897 - 15/09/2021', 'Pendiente de Pago'),
(696, 'Alba Lucia Loaiza Carvajal', '42870200', '3147451468, 3182345766', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.9.235', 'Finca N§ 72 Tierra Labrantia - Vereda Yolombal', '', 'PCQ Facturacion 15/20 Yolombal', 'B4:FB:E4:AE:99:0D', '', 'GUYO1', '', '31/08/2019', 55000, '1Pago, $55000.00', '#11965 - 15/09/2021', 'Pendiente de Pago'),
(697, 'Maria Isabel Isaza Jimenez', '1007238074', '3226952086, 3128719353', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.88', 'Vereda Yolombal', '', 'PCQ Facturacion 15/20 Yolombal', '18:E8:29:32:CD:65', '', 'GUYO2', '', '29/08/2019', 80000, '', '', 'Pagadas'),
(698, 'Juan Bautista Florez Atehortua', '70753406', '3197893383', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.82', 'Guapante Arriba', '6.278185,-75.405921', 'PCQ Facturacion 15/20 Organo', '4C:4E:0C:A7:E7:6F', '', 'GUSE2', '', '28/08/2019', 80000, '', '', 'Pagadas');
INSERT INTO `telemercadeoclientes` (`id`, `nombre`, `cedula`, `telefono`, `plan`, `estado`, `estado_contrato`, `estadoLLamada`, `tipificacion`, `observaciones`, `ip`, `direccion`, `coordenadas`, `router`, `mac`, `seguimiento`, `sectorial`, `observaciones_seguimiento`, `fecha_instalación`, `precio_plan`, `pendiente_pago`, `ultima_factura`, `estado_factura`) VALUES
(699, 'Juan Guillermo Henao Martinez', '71754239', '3142767622', 'Plan 15 Megas', '', 'Activo', '', '', '', '172.30.26.26', 'Vereda Canoas entrando por Aromas', '6.231523,-75.449110', 'PCQ Facturacion 15/20 San Bernardo', 'CC:2D:E0:F4:8C:2D', '', 'GUAVI', '', '23/08/2019', 150000, '1Pago, $150000.00', '#11716 - 15/09/2021', 'Pendiente de Pago'),
(700, 'Alejandra Maria Sanchez Orrego', '39450458', '3126420812, 3185488543', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.18.78', 'La brizuela casa 12', '6.281000,-75.450472', 'PCQ Facturacion 15/20 Organo', '7A:6D:04:68:51:29', '', 'SAGUSE', '', '20/08/2019', 65000, '1Pago, $65000.00', '#11900 - 15/09/2021', 'Pendiente de Pago'),
(701, 'Juliana Andrea Serna V squez', '1042707168', '3145895180, 3108273451', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.3.228', 'Vereda la clarita, Familia los marin.', '', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:19:A4:B4', '', 'GUSA', '', '20/08/2019', 55000, '', '', 'Pagadas'),
(702, 'Yully Carolina Jaramillo lopez', '1035921253', '3103805567', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.4.68', 'Vereda la clarita', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:90:AC:97', '', 'GUCA', '', '16/08/2019', 70000, '1Pago, $70000.00', '#11817 - 15/09/2021', 'Pendiente de Pago'),
(703, 'Hector Alejandro Ramirez Osorio', '1036955258', '3003148642', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.17.13', 'Vereda Santa Barbara', '', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:93:FE:53', '', 'GUSU', '', '15/08/2019', 55000, '', '', 'Pagadas'),
(704, 'Jaime Andres Roldan Burgos', '79785034', '3104375299', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.14.33', 'Vereda La Clara', '6.162421,-75.464459', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:F9:B7:FF', '', 'SERI', '', '15/08/2019', 80000, '', '', 'Pagadas'),
(705, 'Condominio Terrasanta Propiedad Horizontal', '901292133', '3176494468', 'Plan 3 Megas Descuento', '', 'Activo', '', '', '', '172.30.12.124', 'Vereda San Jos‚', '', 'PCQ Facturacion 15/20 +IVA Organo', 'CC:2D:E0:6A:9D:AD', '', 'GUGU', '', '14/08/2019', 50000, '', '', 'Pagadas'),
(706, 'Maria Dolores Jaramillo Gutierrez', '24725853', '3108233412', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.19', 'Yolombal Finca Los Naranjos', '6.33011,-75.401876', 'PCQ Facturacion 15/20 Yolombal', 'B4:FB:E4:DF:B9:6D', '', 'GUYO1', '', '13/08/2019', 80000, '1Pago, $80000.00', '#11777 - 15/09/2021', 'Pendiente de Pago'),
(707, 'David Alejandro Montealegre Echeverri', '1117555016', '3135017031', 'Plan Alejandro Llanerito', '', 'Activo', '', '', '', '172.31.4.15', 'Mall Los Comuneros', '6.252236,-75.425969', 'PCQ Facturacion 15/20 Chorrera', '98:DA:C4:07:4F:FC', '', '', '', '13/08/2019', 90000, '1Pago, $90000.00', '#11760 - 15/09/2021', 'Pendiente de Pago'),
(709, 'Angel Daniel Marin Chirinos', '19576431', '3136120283', 'Plan 5 Megas', '', 'Cancelado', '', '', '', '172.30.8.138', 'Cll 56A 51-76 Barrio San Vicente', '', 'PCQ Facturacion 15/20 San Bernardo', '64:D1:54:74:D9:34', '', 'GUTO', '', '9/08/2019', 70000, '', '', 'Pendiente de Pago'),
(710, 'Maria Cielo Estrada Sanchez', '43488330', '3217569964', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.30.17', 'Vereda La Mosquita Fonda La Cabalgata', '', 'PCQ Facturacion 15/20 Chorrera', '', '', 'GUSEMO CAMBIUM', '', '1/08/2019', 135000, '1Pago, $135000.00', '#11728 - 15/09/2021', 'Pendiente de Pago'),
(711, 'Maria Esther Quintero', '43794094', '3193726815', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.18.79', 'Vereda La Pastorcita', '', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:E1:92:E5', '', 'SAGUSE', '', '31/07/2019', 55000, '', '', 'Pagadas'),
(712, 'Leidy Marcela Acevedo Cata¤o', '1042090108', '3043965281', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.30.18', 'Vereda la mosquita\nAl lado de fonda la cabalgata de cielo\nJuan David Arango\n3003089967', '6.198551,-75.432647', 'PCQ Facturacion 15/20 Chorrera', '00:04:56:51:02:EC', '', 'GUSEMO CAMBIUM', '', '31/07/2019', 55000, '1Pago, $55000.00', '#11978 - 15/09/2021', 'Pendiente de Pago'),
(713, 'Laura Montoya Osorio', '1037586931', '3105458826, 3013759193', 'Plan 10 Megas', '', 'Suspendido', '', '', '', '172.30.3.78', 'Vereda la clarita', '6.254060,-75.421850', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:AC:DE:ED', '', 'GUSA', '', '31/07/2019', 135000, '1Pago, $135000.00', '#11096 - 15/08/2021', 'Pendiente de Pago'),
(714, 'Fabian Humberto Zapata Yepes', '70756319', '3147321375', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.9.237', 'Vereda Yolombal\nenviar por wpp', '', 'PCQ Facturacion 15/20 Yolombal', '18:E0:29:32:C8:00', '', 'GUYO1', '', '30/07/2019', 135000, '', '', 'Pagadas'),
(715, 'Tatiana Andrea Berrio Zapata', '1035911029', '3015574001', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.66', 'Vereda Colorado.', '6.2510803,-75.4006052', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:DB:C7:71', '', 'GUSU', '', '18/07/2019', 80000, '1Pago, $80000.00', '#11818 - 15/09/2021', 'Pendiente de Pago'),
(716, 'Dayron Duque Agudelo', '1007292077', '3105000925', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.29.210', 'Vereda la mosquita', '6.218758, -75.438094', 'PCQ Facturacion 15/20 Chorrera', '4C:5E:0C:1A:52:01', '', 'GUSEMO2', '', '16/07/2019', 55000, '', '', 'Pagadas'),
(717, 'Jhan Carlos Florez Bedoya', '1001415563', '3196616836', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.16.67', 'Vereda Guapante Abajo', '6.288526,-75.404292', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:97:68:FD', '', 'GUSE', '', '16/07/2019', 55000, '', '', 'Pagadas'),
(718, 'Zahira Katherine Ortiz Bohorquez', '1037576759', '3116097694', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.13', 'Autopista med-bog, Sector la caba¤a, Naty-pan.', '6.286267,-75.450011', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:93:CC:0D', '', 'SAGUSE', '', '15/07/2019', 80000, '', '', 'Pagadas'),
(719, 'Jeiner Alejandro Gallego Hincapie', '1035922539', '3017251854, 3003432607', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.3.98', 'Vereda canoas\n\n3003432607\n305 2425835', '6.228345,-75.446085', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:08:84:C7', '', 'GUSA', '', '12/07/2019', 55000, '1Pago, $55000.00', '#11821 - 15/09/2021', 'Pendiente de Pago'),
(720, 'Mario Restrepo Cifuentes', '8352643', '3122172552', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.21.101', 'Vereda Yolombal', '', 'PCQ Facturacion 15/20 Yolombal', 'B4:FB:E4:6E:25:EB', '', 'GUYO2', '', '11/07/2019', 55000, '', '', 'Pagadas'),
(721, 'Maritza Norbey Henao Hincapie', '43211552', '3127096247', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.211', 'Vereda La Mosquita.', '6.216655,-75.444810', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:1F:16:3B', '', 'GUSA', '', '10/07/2019', 80000, '', '', 'Pagadas'),
(722, 'John Alejandro Herrera Suarez', '1013558172', '3193201064', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.7.35', 'Vereda La Clarita', '6.2588110,-75.4252272', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:AC:CD:3C', '', 'GUMO', '', '6/07/2019', 65000, '', '', 'Pagadas'),
(723, 'Gonzalo de Jesus Vasquez Zapata', '8406364', '3007749121', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.6.95', 'Vereda La Honda, Finca Monte Claro', '6.229646,-75.456192', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:08:85:2B', '', 'GUSI', '', '2/07/2019', 80000, '', '', 'Pagadas'),
(724, 'Alvaro Diego Arismendy Valencia', '71726644', '3122860866', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.240', 'Vereda Yolombal - Casa 136', '', 'PCQ Facturacion 15/20 Yolombal', 'B4:FB:E4:6E:15:20', '', 'GUYO1', '', '26/06/2019', 80000, '', '', 'Pagadas'),
(725, 'Gloria Elena Agudelo Ayala', '39457245', '3206608356', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.23.203', 'Vereda La Mosquita\n\nENVIAR FACTURA POR WPP', '6.210492,-75.449876', 'PCQ Facturacion 15/20 Chorrera', 'E0:63:DA:42:FD:F5', '', 'GUSEMO Ubiquiti', '', '26/06/2019', 55000, '', '', 'Pagadas'),
(726, 'Asociacion de Usuarios del Acueducto Veredal La Clara', '811010552', '3148626008', 'Plan 3 Megas', '', 'Activo', '', '', '', '192.168.102.21', 'Vereda La Clara', '', 'ROUTER FIBRA FTTH 15/20 + IVA', 'B8:69:F4:40:8F:DE', '', '', '', '25/06/2019', 55000, '', '', 'Pagadas'),
(729, 'Claudia Maria Bouhot Arroyave', '42890573', '3107706136', '120 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.104.63', 'Vereda La Clara - Entre pinos', '6.263187,-75.426381', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '15/06/2019', 120000, '', '', 'Pagadas'),
(730, 'Ricardo Ortegon Rocha', '7434439', '3186601731', 'Ricardo Ortegon', '', 'Activo', '', '', '', '172.30.33.30', 'Vereda La Clara - Parcelaci¢n La Pinera.', '6.252139,-75.413291', 'PCQ Facturacion 15/20 Chorrera', 'CC:2D:E0:99:31:E0', '', 'GUCHO2', '', '13/06/2019', 80000, '', '', 'Pagadas'),
(731, 'Maria Luisa Castrillon Salazar', '43512215', '3012084453', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.10.48', 'Vereda Bellavista', '', 'PCQ Facturacion 15/20 Organo', '78:8A:20:6A:D6:0B', '', 'GUBE', '', '12/06/2019', 80000, '1Pago, $80000.00', '#11846 - 15/09/2021', 'Pendiente de Pago'),
(732, 'Ivan Dario Garcia Mu¤oz', '71184458', '3148320155', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.10.43', 'Vereda Bellavista. Finca 43', '6.242464065551758,-75.40940856933594', 'PCQ Facturacion 15/20 Organo', '', '', 'GUBE', '', '6/06/2019', 80000, '1Pago, $80000.00', '#11916 - 15/09/2021', 'Pendiente de Pago'),
(733, 'Angelica Maria Repizo Moreno', '1136884806', '3186574349', 'Diego Arias', '', 'Activo', '', '', '', '172.30.7.46', 'Vereda San Jose - Condominio Terrasanta (casa 6)\n\nDiego Arias 321 8303768', '6.2468642, -75.4472328', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:B9:8C:AB', '', 'GUMO', '', '1/06/2019', 80000, '', '', 'Pagadas'),
(734, 'Gloria Emilse Florez Yepes', '43210281', '3113705882', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.28.14', 'Vereda Guapante Abajo', '6.291136,-75.400950', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:F9:F7:35', '', 'GUSE2', '', '1/06/2019', 65000, '', '', 'Pagadas'),
(735, 'Melquicedec Hincapie Yepes', '71706787', '3024320331', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.7.34', 'Barrio San Antonio - sector Labriegos', '6.270746,-75.432064', 'PCQ Facturacion 15/20 Organo', 'E4:8D:8C:FD:F8:3A', '', 'GUMO', '', '31/05/2019', 70000, '1Pago, $70000.00', '#11826 - 15/09/2021', 'Pendiente de Pago'),
(736, 'Juan David Lopera Gomez', '98588117', '3002664364, 3216654020', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.15.41', 'Vereda Yolombal Finca 129 Palma Real, casa 129\nDespues de la Iglesia', '6.3260048,-75.4013858', 'PCQ Facturacion 15/20 Yolombal', 'F4:92:BF:3A:A0:37', '', 'GUYO3', '', '30/05/2019', 80000, '', '', 'Pagadas'),
(737, 'Jhon Estiben Ochoa Ochoa', '1035921879', '3226507676', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.17', 'Vereda Yolombal', '6.318281,-75.395816', 'PCQ Facturacion 15/20 Yolombal', '78:8A:20:6A:D8:67', '', 'GUYO2', '', '28/05/2019', 80000, '', '', 'Pagadas'),
(738, 'Yuliana Quintero Henao', '1036950601', '3204862921', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.17.39', 'Vereda Los Pinos', '', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:F9:F7:89', '', 'GUSU', '', '25/05/2019', 55000, '', '', 'Pagadas'),
(739, 'Erney Alexander Henao Casta¤o', '70756428', '3104097434', '120 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.75', 'Calle 41a n48 - 151 interior 117\nSan Antonio, plaza centro', '6.27504,-75.437652', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '24/05/2019', 120000, '1Pago, $120000.00', '#11835 - 15/09/2021', 'Pendiente de Pago'),
(740, 'Sebastian Ochoa Ochoa', '1035921292', '3225946541', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.37', 'Vereda Yolombal', '6.324119,-75.402345', 'PCQ Facturacion 15/20 Yolombal', '78:8A:20:6A:D8:8D', '', 'GUYO2', '', '23/05/2019', 80000, '', '', 'Pagadas'),
(741, 'Adolfo Alonso Sierra Gonzalez', '8273996', '3113661745', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.233', 'Vereda La Laja - Autopista Med - Bog km 35.4', '6.187117,-75.383836', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:99:31:F6', '', 'GURI', '', '21/05/2019', 80000, '', '', 'Pagadas'),
(742, 'Ivan Alexander Estrada Montoya', '71210994', '3015680965', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.26.27', 'Finca 22-A Vereda Batea Seca', '6.300103,-75.473418', 'PCQ Facturacion 15/20 San Bernardo', 'B8:69:F4:97:C0:53', '', 'GUAVI', '', '18/05/2019', 70000, '', '', 'Pagadas'),
(743, 'Dora Luz Montoya Restrepo', '43036317', '3105039382', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.6.34', 'Vereda La Mosquita', '6.204638,-75.44383', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:40:90:C0', '', 'GUSI', '', '18/05/2019', 55000, '', '', 'Pagadas'),
(744, 'Emerson Ochoa Ochoa', '1000392828', '3127024313', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.21.33', 'Vereda Yolombal', '6.323262,-75.397096', 'PCQ Facturacion 15/20 Yolombal', 'B4:FB:E4:6A:C8:D7', '', 'GUYO2', '', '17/05/2019', 80000, '', '', 'Pagadas'),
(745, 'William Antonio Lopez Carvajal', '71982187', '3043929886', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.33.101', '52cb #35a10 Barrio San Antonio', '6.270795,-75.418772', 'PCQ Facturacion 15/20 Chorrera', '', '', 'GUCHO2', '', '16/05/2019', 55000, '', '', 'Pagadas'),
(746, 'Mario Duque Balaguera', '71718068', '3164319292', 'Plan 10 Megas', '', 'Cancelado', '', '', '', '172.30.4.31', 'Vereda La Clara - Vegas de la clara', '6.2632319, -75.4281716', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:94:27:CC', '', 'GUCA', '', '16/05/2019', 135000, '', '', 'Pagadas'),
(747, 'Luz Marina Idarraga Montoya', '43492994', '3218762538', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.3.28', 'Vereda La Clara', '6.2658778, -75.4209649', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:5A:C9:BC', '', 'GUSA', '', '10/05/2019', 80000, '', '', 'Pagadas'),
(748, 'Damaris Ochoa Osorio', '1035920493', '3103753536', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.9.139', 'Vereda Yolombal', '6.32507,-75.405142', 'PCQ Facturacion 15/20 Yolombal', '18:E8:29:84:E6:5A', '', 'GUYO1', '', '6/05/2019', 80000, '', '', 'Pagadas'),
(749, 'Beatriz Eugenia Otalvaro Garcia', '39449211', '3147370377', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.27', 'Vereda cuchillas de san jose', '6.1863561,-75.3952435', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:DB:C6:F7', '', 'GUSU', '', '3/05/2019', 80000, '1Pago, $80000.00', '#11980 - 15/09/2021', 'Pendiente de Pago'),
(750, 'Alexandra Maria Martinez Yarce', '43568856', '3126131408', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.70', 'Carrera 53 #46A - 74 - Estacion de gasolina Texaco\nAutopista Med-Bog km 22 Guarne\n3126131408', '6.277061,-75.443688', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:40:30:7A', '', 'GUMO', '', '2/05/2019', 80000, '', '', 'Pagadas'),
(751, 'Inversiones Arias Serna SAS', '900585137', '3206894706', 'Plan 10 Megas', '', 'Activo', '', '', '', '172.30.33.17', 'Sobre Autopista Med-Bog km 27 - Vereda la Clarita', '', 'PCQ Facturacion 01/05 + Iva Chorrera', '64:D1:54:9C:83:E1', '', 'GUCHO2', '', '1/05/2019', 135000, '', '', 'Pagadas'),
(752, 'Natalia Andrea Salazar', '43837410', '7863991231', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.56', 'Vereda Piedras Blancas - Km 4 Finca Villa Isabel', '6.269235,-75.419113', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:54:A5:13', '', 'SAGUSE', '', '24/04/2019', 80000, '', '', 'Pagadas'),
(753, 'Marleny Del Socorro Ocampo Jimenez', '42986956', '3153531400', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.16.22', 'Vereda Guapante Arriba - Finca Bosque Vista', '6.269235,-75.419113', 'PCQ Facturacion 15/20 Organo', 'B8:69:F4:54:A5:2B', '', 'GUSE', '', '22/04/2019', 55000, '', '', 'Pagadas'),
(754, 'Mili Johana Loaiza Herrera', '43920514', '3128449311', 'Plan 3 Megas', '', 'Gratis', '', '', '', '172.30.16.52', 'Vereda Yolombal', '6.269235,-75.419113', 'PCQ Facturacion 15/20 Yolombal', 'E0:63:DA:46:41:86', '', 'GUYO3', '', '17/04/2019', 55000, '', '', 'Pagadas'),
(755, 'Yaqueline Salazar Florez', '1001478377', '3113754923', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.16.19', 'Vereda Guapante abajo - finca el salado, casa 25', '6.2961488,-75.4081003', 'PCQ Facturacion 15/20 Organo', '64:D1:54:B2:53:AB', '', 'GUSE', '', '17/04/2019', 55000, '', '', 'Pagadas'),
(756, 'Gloria Rita Agudelo Zapata', '32438066', '3013538215', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.172', 'Vereda La Clarita - Casa 517A', '6.266372,-75.416834', 'ROUTER FIBRA FTTH 15/20', '', '', '', '', '13/04/2019', 80000, '', '', 'Pagadas'),
(757, 'Andres Camilo Zuluaga Ospina', '1035910779', '3113845428', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.133', 'Vereda la clara', '6.2636852,-75.4166381', 'PCQ Facturacion 15/20 Organo', '64:D1:54:7C:C6:35', '', 'GUCHO2', '', '11/04/2019', 80000, '2Pagos, $140000.00', '#11969 - 15/09/2021', 'Pendiente de Pago'),
(758, 'Maria Cenely Rojas Ospina', '39446823', '3115891224', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.12.183', 'Vereda La Mosquita', '', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:06:37:1D', '', 'GUGU', '', '8/04/2019', 55000, '', '', 'Pagadas'),
(759, 'Diego Alberto Loaiza Ramirez', '1060267117', '3116115308', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.2.54', 'Vereda Bellavista\nRieles principales casa 05', '6.244035,-75.414198', 'PCQ Facturacion 15/20 Organo', '64:D1:54:7C:C9:73', '', 'GURI', '', '5/04/2019', 80000, '', '', 'Pagadas'),
(760, 'Hernan Dario Pineda Yepes', '71583136', '3113708188', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.17.112', 'Vereda El Colorado', '6.248360, -75.403154', 'PCQ Facturacion 15/20 Organo', '4C:5E:0C:A7:F0:3F', '', 'GUSU', '', '4/04/2019', 80000, '', '', 'Pagadas'),
(761, 'Carmen Cecilia Munera de Fernandez', '32424564', '3174374943', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.11.61', 'Vereda La Clarita casa 202', '6.258915,-75.422138', 'PCQ Facturacion 15/20 Organo', 'B4:FB:E4:32:31:7A', '', 'GUSA2', '', '30/03/2019', 80000, '', '', 'Pagadas'),
(762, 'Jessica Juliana Ciro Gomez', '1035918946', '3146272098', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.16.62', 'Vereda Guapante Arriba', '6.298967, -75.411299', 'PCQ Facturacion 15/20 Organo', 'B4:FB:E4:32:28:37', '', '', '', '30/03/2019', 80000, '', '', 'Pagadas'),
(763, 'Compregas SAS', '900679447', '3113382996', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.7.189', 'CL 57 SUR 48 25\n\nPersona encargada de realiza pagos: Wilmer Duran', '6.246374,-75.423045', 'PCQ Facturacion 01/05 +IVA Organo', 'CC:2D:E0:AC:AE:39', '', 'GUMO', '', '27/03/2019', 55000, '', '', 'Pagadas'),
(764, 'Maribel Montoya Salazar', '1035918580', '3147859370', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.16.127', 'Guapante Abajo los Salazar', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:08:85:27', '', 'GUSE', '', '27/03/2019', 80000, '', '', 'Pagadas'),
(765, 'Huber Bladimir Corva Torres', '1216714696', '3045661275', 'Plan Huber Bladimir', '', 'Cancelado', '', '', '', '172.30.17.83', 'Vereda Yolombal', '', 'PCQ Facturacion 01/05 Organo', '', '', 'GUSU', '', '26/03/2019', 80000, '', '', 'Pendiente de Pago'),
(766, 'Alejandra Alvarez Alzate', '1001415503', '3196635847', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.8.234', 'Vereda Toldas', '', 'PCQ Facturacion 01/05 San Bernardo', 'CC:2D:E0:08:7F:E7', '', 'GUTO', '', '16/03/2019', 55000, '', '', 'Pagadas'),
(767, 'Javier Andres Herrera Carvajal', '1112619197', '3185766399', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.103.249', 'Vereda Monta¤ez', '6.2947145,-75.4480031', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '16/03/2019', 80000, '', '', 'Pagadas'),
(768, 'Gustavo Augusto Artunduaga Cabrera', '17691138', '3218617962', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.31.7.1', 'Mall los Comuneros Local 15', '', 'PCQ Facturacion 01/05 Chorrera', '0C:80:63:0D:D3:B2', '', '', '', '15/03/2019', 110000, '', '', 'Pagadas'),
(769, 'Samuel Antonio Londo¤o', '15431653', '3105969801', 'Plan 3 Megas', '', 'Cancelado', '', '', '', '172.30.11.242', 'Vereda La Clara', '', 'PCQ Facturacion 01/05 Organo', 'B4:FB:E4:32:2A:ED', '', 'GUSA2', '', '9/03/2019', 55000, '', '', 'Pagadas'),
(770, 'Diana Marcela Lopez Ocampo', '1035910695', '3225271025', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.25.38', 'Vereda La Clara', '6.271513,-75.414977', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:1F:11:29', '', 'GUCHO', '', '8/03/2019', 70000, '', '', 'Pagadas'),
(771, 'Martha Gladis Londo¤o Tavera', '22117353', '3122724688', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.231', 'Vereda El Sango', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:11:37:BB', '', 'SAGUSE', '', '8/03/2019', 80000, '', '', 'Pagadas'),
(772, 'Leydi Viviana Molina Ospina', '67037166', '3192048961', 'Plan 4 Megas Volante', '', 'Activo', '', '', '', '172.30.16.233', 'Vereda Guapante arriba', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:11:37:B3', '', 'GUSE', '', '8/03/2019', 60000, '', '', 'Pagadas'),
(773, 'Frankin Rodrigo Zapata Tobon', '1036959109', '3128198834', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.247', 'Vereda Piedras Blancas', '6.25933,-75.420512', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:5F:5A:73', '', 'SAGUSE', '', '2/03/2019', 80000, '', '', 'Pagadas'),
(774, 'Andrea Jaramillo Duarte', '43837139', '3003464029', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.226', 'Vereda Piedras Blancas.', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:08:7F:85', '', 'SAGUSE', '', '2/03/2019', 80000, '', '', 'Pagadas'),
(776, 'Oswaldo Alonso Copeland Osorio', '71615473', '3104347742', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.221', 'Vereda La Clara - casa 145 Copeland Bonsai', '6.26052,-75.427907', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:86:5C:D5', '', 'GUSA', '', '23/02/2019', 80000, '', '', 'Pagadas'),
(777, 'Hector Alonso Arroyave', '8239432', '3108502676', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.220', 'Vereda Toldas', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:AC:B2:05', '', 'GUGU', '', '21/02/2019', 80000, '', '', 'Pagadas'),
(778, 'Luz Amanda Gonzalez Vasquez', '42969387', '3136572948', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.3.223', 'Vereda La Clara - Reserva la clarita casa 40', '6.255328,-75.424572', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:96:F9:33', '', 'GUSA', '', '17/02/2019', 80000, '', '', 'Pagadas'),
(779, 'Isabel Cristina Agudelo', '1036937801', '3206941254, 3012733300', 'Plan 4 Megas', '', 'Activo', '', '', '', '172.30.23.77', 'Vereda La Mosquita parte alta', '6.211588,-75.450118', 'PCQ Facturacion 01/05 Chorrera', 'E0:63:DA:9E:12:5D', '', 'GUSEMO Ubiquiti', '', '8/02/2019', 65000, '', '', 'Pagadas'),
(780, 'Fabiola Del Socorro Jimenez de Uribe', '21542957', '3137678976', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.6.213', 'Vereda Canoas - finca los pinos', '6.229897,-75.451474', 'PCQ Facturacion 01/05 Organo', '4C:5E:0C:1A:51:E9', '', 'GUSI', '', '8/02/2019', 80000, '1Pago, $80000.00', '#11259 - 24/08/2021', 'Pagadas'),
(781, 'Alejandro Henao Quiroz', '16670556', '3137686567', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.8.33', 'Vereda La Charanga Finca El Lago', '6.283550,-75.434438', 'PCQ Facturacion 01/05 San Bernardo', 'CC:2D:E0:7B:8A:83', '', 'GUTO', '', '3/02/2019', 80000, '', '', 'Pagadas'),
(782, 'Faber Duque Zapata', '1038410266', '3126713922', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.28.206', 'Vereda Guapante arriba - La sabaneta', '6.278076, -75.394576', 'PCQ Facturacion 01/05 Organo', '64:D1:54:4E:19:78', '', 'GUSE2', '', '31/01/2019', 55000, '', '', 'Pagadas'),
(783, 'Sergio Alexander Osorno Ossa', '70755846', '3205668849', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.143', 'Sobre Autopista Med-Bog Bomba Los Cedros', '', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:9B:85:10', '', 'GUSA', '', '22/01/2019', 80000, '', '', 'Pagadas'),
(784, 'Adiela de Jesus Ospina Henao', '42984984', '3003134665', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.203', 'Vereda san Ignacio - casa 49 sector el Establo', '', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:FF:88:A3', '', 'GUGU', '', '12/01/2019', 80000, '', '', 'Pagadas'),
(785, 'Juan David Atehortua Atehortua', '70753829', '3192434307', 'Plan 8 Fidelidad', '', 'Activo', '', '', '', '172.30.16.237', 'Vereda Guapante Abajo', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:66:D5:C9', '', 'GUSE', '', '9/01/2019', 80000, '', '', 'Pagadas'),
(786, 'Gloria Stella Balvin Perez', '42690767', '3128677518, 3214874210', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.16.199', 'Vereda Guapante abajo', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:AC:B1:67', '', 'GUSE', '', '9/01/2019', 55000, '', '', 'Pagadas'),
(787, 'Juan Sebastian Urrego Casta¤o', '1119886518', '3186833549', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '172.30.18.133', 'Vereda El Salado - Finca 50', '', 'PCQ Facturacion 01/05 Organo', '', '', 'SAGUSE', '', '9/01/2019', 80000, '', '', 'Pagadas'),
(788, 'Jorge Alberto Mora Zapata', '71310047', '3013239999', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.25.40', 'San Antonio Parte alta', '6.276654,-75.437197', 'PCQ Facturacion 01/05 Chorrera', '64:D1:54:4E:19:79', '', 'GUCHO', '', '5/01/2019', 80000, '', '', 'Pagadas'),
(789, 'Gilma De Jesus Cano Ruiz', '43422210', '3117125489', 'Plan 3 Megas', '', 'Activo', '', '', '', '192.168.102.33', 'Vereda la clara - Parcelacion los cisnes', '', 'ROUTER FIBRA FTTH 01/05', '5C:3A:3D:35:54:3C', '', '', '', '4/01/2019', 55000, '', '', 'Pagadas'),
(790, 'Alejandro Duque Castrillon', '1216727457', '3022835914', '50 MEGAS FIBRA OPTICA', '', 'Gratis', '', '', '', '192.168.102.171', 'carrera 77e n53-13', '6.270542,-75.419198', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '31/12/2018', 80000, '', '', 'Pendiente de Pago'),
(791, 'Isabel Cristina Franco Lopez', '1128404220', '3104104997', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.194', 'Vereda San Jos‚ - Parcelaci¢n Terra santa', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:66:D5:C7', '', 'GUGU', '', '29/12/2018', 80000, '', '', 'Pagadas'),
(792, 'Gabriel Angel Zapata Florez', '70751617', '3184729264', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.28.20', 'Guapante Abajo', '6.2885870, -75.3990020', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:AC:AD:FB', '', 'GUSE2', '', '20/12/2018', 110000, '', '', 'Pagadas'),
(793, 'Rodolfo Florez Rojas', '98581166', '3175753384', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.27', 'Barrio San Antonio - Parcelaci¢n Los Cisnes casa (14)\nv¡a a Vereda La Clara', '6.264882,-75.431225', 'ROUTER FIBRA FTTH 01/05', '5C:3A:3D:33:2E:2C', '', '', '', '14/12/2018', 90000, '', '', 'Pagadas'),
(794, 'Claudia Yaneth Herrera Rivera', '43211491', '3136926251', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.28.187', 'Vereda Guapante Abajo', '6.294683,-75.408220', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:66:D5:E1', '', 'GUSE2', '', '13/12/2018', 80000, '', '', 'Pagadas'),
(795, 'Luz Estella Sierra Uribe', '21403355', '3012427459', 'Plan 4 Megas', '', 'Cancelado', '', '', '', '172.30.3.16', 'Vereda La Clara - Reserva la clara casa 32', '6.257848,-75.422471', 'PCQ Facturacion 01/05 Organo', 'B8:69:F4:B7:6F:6D', '', 'GUSA', '', '7/12/2018', 65000, '', '', 'Pagadas'),
(796, 'Carlos Andres Hurtado Rivera', '70750952', '3013969308', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.100', 'carrera 52A #52-44 - El Guamo', '6.280805,-75.444765', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:08:7F:23', '', 'GUMO', '', '29/11/2018', 80000, '', '', 'Pagadas'),
(797, 'Ana Catalina Lopera Idarraga', '43875978', '3004869499', 'Plan 8 Megas', '', 'Activo', '', '', '', '172.30.33.45', 'Vereda La mosquita', '6.212841,-75.451246', 'PCQ Facturacion 01/05 Chorrera', '64:D1:54:B2:34:35', '', 'GUCHO2', '', '13/11/2018', 110000, '', '', 'Pagadas'),
(798, 'Edwin Granada Salazar', '98666997', '3104551713', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.182', 'Sobre Autopista Med-Bog km 26', '', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:96:AB:A7', '', 'GUMO', '', '7/10/2018', 80000, '', '', 'Pagadas'),
(799, 'Luis Albeiro Zapata Herrera', '70754881', '3116297933', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.16.20', 'Vereda Guapante Abajo', '6.275936,-75.401361', 'PCQ Facturacion 01/05 Organo', 'CC:2D:E0:AC:B5:B7', '', 'GUSE', '', '18/09/2018', 80000, '', '', 'Pagadas'),
(800, 'Mauricio Florez Alzate', '70755093', '3194109435, 3192801141', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.16.175', 'Vereda Guapante abajo', '6.269235,-75.419113', 'PCQ Facturacion 01/05 Organo', '64:D1:54:21:3B:CB', '', 'GUSE', '', '15/09/2018', 80000, '', '', 'Pagadas'),
(803, 'Jorge Andres Viana Rivera', '70756773', '3103996495', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.16.150', 'Vereda Guapante', '', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:10:9C:55', '', 'GUSE', '', '23/08/2018', 80000, '', '', 'Pagadas'),
(804, 'Gabriel Ivan Garcia Gonzalez', '70129700', '3218127134', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.35', 'Vereda La Clara - Finca los cisnes', '6.281384,-75.450077', 'ROUTER FIBRA FTTH 01/05', '', '', 'GUSI', '', '23/08/2018', 80000, '', '', 'Pagadas'),
(805, 'Sergio Alfonso Vasquez Monsalve', '71734073', '3006175801', '70 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.36', 'Vereda La Clara', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '23/08/2018', 90000, '', '', 'Pagadas'),
(806, 'Junta de Accion Comunal Vereda La Clarita', '811032371', '3004432353', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.11.246', 'Vereda La Clarita - Capilla Centro Educativo\ncentro.cultural.laclarita@gmail.com\nllamar a sergio aguilar', '6.256045,-75.424051', 'PCQ Facturacion 01/05 +IVA Organo', 'B4:FB:E4:36:3E:18', '', 'GUSA2', '', '22/08/2018', 55000, '', '', 'Pagadas'),
(807, 'Juan Diego Agudelo Alzate', '1036966785', '3506451975', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.17.14', 'Vereda Mosquita', '6.2381597, -75.4390986', 'PCQ Facturacion 15/20 Organo', 'CC:2D:E0:6A:9D:03', '', 'GUSU', '', '18/08/2018', 55000, '1Pago, $55000.00', '#11867 - 15/09/2021', 'Pendiente de Pago'),
(808, 'Maria Elena Escobar Rodriguez', '39303805', '3234769423, 3006167540', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.72', 'Vereda La Clara - Finca El Recreo', '', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '10/08/2018', 80000, '', '', 'Pagadas'),
(809, 'Yoni Humberto Cardona Bedoya', '1035910673', '3176426520', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.30.16.113', 'Vereda Guapante', '6.276083,-75.406528', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:D0:6E:E8', '', 'GUSE', '', '8/08/2018', 55000, '', '', 'Pagadas'),
(812, 'Richard Eduardo Zapata Valencia', '98695033', '3122690613', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.18.125', 'Vereda La Hondita ,Finca el Reino Secreto, sector Bombeo EPM', '', 'PCQ Facturacion 01/05 Organo', '64:D1:54:AE:78:73', '', 'SAGUSE', '', '7/08/2018', 80000, '', '', 'Pagadas'),
(813, 'Mauricio Zapata Molina', '98567332', '3017307807', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.142', 'Vereda La Clara', '6.263803,-75.432366', 'PCQ Facturacion 01/05 Organo', '4C:5E:0C:A7:E7:9B', '', 'GUSA', '', '7/08/2018', 80000, '', '', 'Pagadas'),
(814, 'Maria Eugenia Valderrama Rendon', '43793796', '3147547258', '10 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.58', 'Vereda La Clara', '6.271163,-75.427386', 'ROUTER FIBRA FTTH 01/05', 'CC:2D:E0:1F:11:1A', '', '', '', '7/08/2018', 60000, '', '', 'Pagadas'),
(815, 'Luis Fernando Diaz Osorio', '70568141', '3104438088', 'Plan 6 Megas Fidelidad', '', 'Cancelado', '', '', '', '172.30.17.129', 'Vereda Toldas', '', 'PCQ Facturacion 01/05 Organo', '64:D1:54:AE:19:B5', '', 'GUSU', '', '7/08/2018', 55000, '', '', 'Pagadas'),
(816, 'Julio Alberto Suarez Orjuela', '19373393', '3103048450', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.134', 'Vereda Alto Gordo', '', 'PCQ Facturacion 01/05 Organo', '6C:3B:6B:9B:85:1A', '', 'GUMO', '', '7/08/2018', 80000, '', '', 'Pagadas'),
(817, 'Julian Nicanor Cardenas Henao', '15422850', '3137506695, 3006205893', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.33.25', 'Vereda Bellavista', '6.244007,-75.414191', 'PCQ Facturacion 01/05 Chorrera', 'B8:69:F4:5F:50:7B', '', 'GUCHO2', '', '7/08/2018', 80000, '', '', 'Pagadas'),
(818, 'Ximena Sierra Garcia', '43210413', '3206892106', 'Plan 5 Megas', '', 'Activo', '', '', '', '172.30.3.136', 'Barrio San Antonio parte alta', '6.274942,-75.436042', 'PCQ Facturacion 01/05 Organo', '64:D1:54:83:5F:9B', '', 'GUSA', '', '7/08/2018', 70000, '', '', 'Pagadas'),
(819, 'Blanca Bonilla Gutierrez', '43187187', '3148751721', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.7.40', 'Barrio San Antonio Parte Alta', '6.277107,-75.435277', 'PCQ Facturacion 01/05 Organo', '64:D1:54:83:5D:F3', '', 'GUMO', '', '7/08/2018', 80000, '', '', 'Pagadas'),
(820, 'Jairo De Jesus Lopez Trujillo', '70101948', '3006184675', '50 MEGAS FIBRA OPTICA', '', 'Activo', '', '', '', '192.168.102.64', 'Vereda La Clarita', '6.272472,-75.424833', 'ROUTER FIBRA FTTH 01/05', 'E4:8D:8C:B4:9D:08', '', '', '', '7/08/2018', 80000, '', '', 'Pagadas'),
(821, 'Jaime Alonso Serna Garcia', '3396359', '3226467712', 'Plan 3 Megas', '', 'Activo', '', '', '', '172.31.4.252', 'Mall los Comuneros LC 20', '6.251867,-75.425774', 'PCQ Facturacion 01/05 Chorrera', '70:4F:57:51:21:BB', '', '', '', '7/08/2018', 55000, '', '', 'Pagadas'),
(822, 'CasaYa Prefabricados S.A.S', '901111202', '3142767622', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.192', 'Sobre Autopista Med-Bog - Vereda La Clara', '6.246441,-75.423106', 'PCQ Facturacion 01/05 +IVA Organo', '64:D1:54:21:3B:8F', '', 'GUSA', '', '7/08/2018', 80000, '', '', 'Pagadas'),
(823, 'Carlos Humberto Zapata Osorio', '8399970', '3006108857', 'Plan 6 Megas', '', 'Activo', '', '', '', '192.168.102.16', 'Vereda La Clara', '6.269263,-75.419760', 'ROUTER FIBRA FTTH 01/05', '', '', '', '', '7/08/2018', 80000, '', '', 'Pagadas'),
(824, 'Carlos Alberto Munera Mojica', '98544719', '3217713841', 'Plan 6 Megas', '', 'Cancelado', '', '', '', '192.168.71.135', 'Guarne', '6.239667,-75.450194', 'PCQ Facturacion 01/05 Chorrera', '64:D1:54:AE:19:C8', '', '', '', '7/08/2018', 80000, '', '', 'Pendiente de Pago'),
(825, 'Aura Nely Zuleta', '43424106', '3135386059', 'Plan 3 Megas', '', 'Cancelado', '', '', '', '172.30.3.164', 'Vereda La Clara', '6.270434, -75.422290', 'PCQ Facturacion 01/05 Organo', '74:4D:28:42:23:9E', '', 'GUSA', '', '1/08/2018', 55000, '', '', 'Pendiente de Pago'),
(826, 'Luz Stella Ortiz Uribe', '42867217', '3122516210', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.3.167', 'Vereda Hojas Anchas - Parcelacion las Quinelas (3)', '6.238102, -75.439096', 'PCQ Facturacion 01/05 Organo', '64:D1:54:B2:53:AC', '', 'GUSA', '', '28/07/2018', 80000, '', '', 'Pagadas'),
(827, 'Angela Maria Ortiz Uribe', '32491053', '3117339345', 'Plan 6 Megas', '', 'Activo', '', '', '', '172.30.12.166', 'Vereda Hojas Anchas - Parcelacion las quinelas (casa 1)', '6.238847, -75.438892', 'PCQ Facturacion 01/05 Organo', '64:D1:54:B2:53:C3', '', 'GUGU', '', '28/07/2018', 80000, '', '', 'Pagadas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telemercadoreportediario`
--

DROP TABLE IF EXISTS `telemercadoreportediario`;
CREATE TABLE `telemercadoreportediario` (
  `id` int(11) NOT NULL,
  `fecha` varchar(500) NOT NULL,
  `llamadas` int(11) NOT NULL,
  `contestadas` int(11) NOT NULL,
  `noContestadas` int(11) NOT NULL,
  `buzon` int(11) NOT NULL,
  `soporte` int(11) NOT NULL,
  `interesados` int(11) NOT NULL,
  `observaciones` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `telemercadoreportediario`
--

INSERT INTO `telemercadoreportediario` (`id`, `fecha`, `llamadas`, `contestadas`, `noContestadas`, `buzon`, `soporte`, `interesados`, `observaciones`) VALUES
(2, '2021-09-14', 40, 20, 20, 12, 3, 3, 'No hay ningún comentario'),
(3, '2021-09-15', 70, 50, 20, 10, 3, 10, 'No hay ningún comentario'),
(4, '2021-09-15', 125, 75, 45, 35, 18, 95, 'No hay ningún comentario'),
(6, '2021-09-16', 42, 22, 20, 10, 7, 6, 'No hay ningún comentario'),
(7, '2021-09-17', 123, 90, 33, 23, 18, 50, 'No hay ningún comentario'),
(8, '2021-09-18', 30, 10, 30, 12, 13, 23, 'No hay ningún comentario'),
(9, '2021-09-19', 40, 30, 10, 10, 13, 12, 'No hay ningún comentario'),
(10, '2021-09-20', 23, 10, 13, 13, 3, 10, 'No hay ningún comentario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `user` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `cargo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `user`, `password`, `email`, `cargo`) VALUES
(2, 'juan felipe correa', 'dev', '$2a$08$DcBFeycAlRnmNsB65zjMWOlgkj4szgbCDU54O2UjMSlZAJ45ZRCja', 'thefelipegamer7@gmail.com', 'admin'),
(28, 'redline', 'redline', '$2a$08$4s81nOuXSSybbhnySlz3N.2r/jqcJShJ8AJ1ug8YMWwFBRuz.Nczi', 'redline@redline.com', 'servicioCliente'),
(31, 'tecnico', 'tec', '$2a$08$9LlfRGEHetgjNCYTUbZ46.UbuZK27RV7Qj/pq89PzxIoIlmtc7M1S', 'redline@redline.com', 'tecnico'),
(32, 'sunchadora amarilla', 'dev2', '$2a$08$/SiknxUlAU2Y2DFVUIU05eTwz2zcGKnoVKtm3LNeRriXKpYtS6gU2', 'thefelipegamer7@gmail.com', 'servicioCliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consumibles`
--
ALTER TABLE `consumibles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_consumibles` (`id_consumibles`);

--
-- Indices de la tabla `cuadrillas`
--
ALTER TABLE `cuadrillas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dispositivos_vendidos`
--
ALTER TABLE `dispositivos_vendidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipo_seguridad`
--
ALTER TABLE `equipo_seguridad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id cuadrilla` (`id_tecnico`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`codigo_herramienta`),
  ADD KEY `id_cuadrilla` (`id_tecnico`);

--
-- Indices de la tabla `logs_inventario_consumibles`
--
ALTER TABLE `logs_inventario_consumibles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs_inventario_consumibles_2`
--
ALTER TABLE `logs_inventario_consumibles_2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs_inventario_equipo_seguridad`
--
ALTER TABLE `logs_inventario_equipo_seguridad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs_inventario_herramientas`
--
ALTER TABLE `logs_inventario_herramientas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_oficina`
--
ALTER TABLE `personal_oficina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `telemercadeoclientes`
--
ALTER TABLE `telemercadeoclientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `telemercadoreportediario`
--
ALTER TABLE `telemercadoreportediario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consumibles`
--
ALTER TABLE `consumibles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `cuadrillas`
--
ALTER TABLE `cuadrillas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000001;

--
-- AUTO_INCREMENT de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `dispositivos_vendidos`
--
ALTER TABLE `dispositivos_vendidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `logs_inventario_consumibles`
--
ALTER TABLE `logs_inventario_consumibles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `logs_inventario_consumibles_2`
--
ALTER TABLE `logs_inventario_consumibles_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `logs_inventario_equipo_seguridad`
--
ALTER TABLE `logs_inventario_equipo_seguridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `logs_inventario_herramientas`
--
ALTER TABLE `logs_inventario_herramientas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `telemercadeoclientes`
--
ALTER TABLE `telemercadeoclientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=828;

--
-- AUTO_INCREMENT de la tabla `telemercadoreportediario`
--
ALTER TABLE `telemercadoreportediario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;