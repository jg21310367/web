-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-02-2023 a las 07:42:51
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `patessiere`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `reg_cliente` (IN `vnombre` VARCHAR(255), IN `vapellido` VARCHAR(255), IN `vdomicilio` VARCHAR(255), IN `vtelefono` VARCHAR(10), IN `vcorreo` VARCHAR(255), IN `vpassword` VARCHAR(8))  NO SQL
    COMMENT 'Procedimiento para crear cliente'
BEGIN
DECLARE idUsuario int;
INSERT INTO usuarios(Correo, Password, Status, Admin)
VALUES(vcorreo, vpassword, 1, 0);
SET idUsuario := LAST_INSERT_ID();
INSERT INTO clientes(Nombre, Apellido, Domicilio, Telefono, Usuario_ID)
VALUES(vnombre, vapellido, vdomicilio, vtelefono, idUsuario);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Cliente_ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `Domicilio` varchar(255) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Usuario_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Cliente_ID`, `Nombre`, `Apellido`, `Domicilio`, `Telefono`, `Usuario_ID`) VALUES
(1, 'Juan', 'Perez', 'Insurgentes #205 Int 9', '3312457889', 2),
(2, 'Jimenna', 'Garcia', 'Insurgentes #205 int 9', '3345466789', 3),
(3, 'Erika', 'Felix', 'Av. patria #205 int 9', '3345466789', 4),
(4, 'Eduardo', 'madrid', 'Av. zoquipan #205 int 9', '3345466789', 5),
(5, 'pedro', 'perez', 'Av. patria #3995 int e1', '3332659887', 6),
(6, '', '', '', '', 7),
(7, '', '', '', '', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coberturas`
--

CREATE TABLE `coberturas` (
  `Cobertura_ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `coberturas`
--

INSERT INTO `coberturas` (`Cobertura_ID`, `Nombre`) VALUES
(1, 'Butter Cream'),
(2, 'Chantilly');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_orden`
--

CREATE TABLE `detalles_orden` (
  `DetOrden_ID` int(11) NOT NULL,
  `Pastel_ID` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Orden_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalles_orden`
--

INSERT INTO `detalles_orden` (`DetOrden_ID`, `Pastel_ID`, `Cantidad`, `Precio`, `Orden_ID`) VALUES
(1, 4, 1, '399.90', 2),
(2, 9, 1, '455.30', 2),
(3, 4, 1, '399.90', 3),
(4, 9, 1, '455.30', 3),
(5, 4, 1, '399.90', 4),
(6, 9, 1, '455.30', 4),
(7, 9, 1, '455.30', 4),
(8, 4, 1, '399.90', 5),
(9, 9, 1, '455.30', 5),
(10, 9, 1, '455.30', 5),
(11, 10, 1, '455.30', 5),
(12, 4, 1, '399.90', 6),
(13, 9, 1, '455.30', 6),
(14, 9, 1, '455.30', 6),
(15, 10, 1, '455.30', 6),
(16, 6, 1, '500.99', 6),
(17, 4, 1, '399.90', 7),
(18, 9, 1, '455.30', 7),
(19, 9, 1, '455.30', 7),
(20, 10, 1, '455.30', 7),
(21, 6, 1, '500.99', 7),
(22, 11, 1, '400.22', 7),
(23, 6, 1, '500.99', 8),
(24, 6, 1, '500.99', 9),
(25, 11, 1, '400.22', 10),
(26, 11, 1, '400.22', 11),
(27, 11, 1, '400.22', 12),
(28, 11, 1, '400.22', 13),
(29, 11, 1, '400.22', 14),
(30, 11, 1, '400.22', 15),
(31, 11, 1, '400.22', 16),
(32, 11, 1, '400.22', 17),
(33, 4, 1, '399.90', 18),
(34, 9, 1, '455.30', 18),
(35, 9, 1, '455.30', 19),
(36, 9, 1, '455.30', 20),
(37, 9, 1, '455.30', 21),
(38, 9, 1, '455.30', 22),
(39, 9, 1, '455.30', 23),
(40, 9, 1, '455.30', 24),
(41, 9, 1, '455.30', 25),
(42, 9, 1, '455.30', 26),
(43, 9, 1, '455.30', 27),
(44, 10, 1, '455.30', 27),
(45, 11, 1, '400.22', 28),
(46, 1, 1, '350.00', 28),
(47, 1, 1, '350.00', 29),
(48, 7, 1, '455.30', 29);

--
-- Disparadores `detalles_orden`
--
DELIMITER $$
CREATE TRIGGER `actualizarTotalPago` AFTER INSERT ON `detalles_orden` FOR EACH ROW BEGIN
SET @total_ant := (SELECT TOTAL_PAGAR FROM ordenes WHERE Orden_ID = NEW.ORDEN_ID);


SET @add = NEW.Precio;

set @total = @total_ant + @add;

UPDATE ordenes SET total_pagar = @total WHERE Orden_ID = NEW.Orden_ID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `Orden_ID` int(11) NOT NULL,
  `Usuario_ID` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Total_pagar` decimal(10,2) NOT NULL,
  `Completada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`Orden_ID`, `Usuario_ID`, `Fecha`, `Total_pagar`, `Completada`) VALUES
(1, 2, '2023-02-13', '0.00', 0),
(2, 2, '2023-02-13', '855.20', 0),
(3, 2, '2023-02-13', '855.20', 0),
(4, 2, '2023-02-13', '1310.50', 0),
(5, 2, '2023-02-13', '1765.80', 0),
(6, 2, '2023-02-13', '2266.79', 0),
(7, 2, '2023-02-13', '2667.01', 0),
(8, 2, '2023-02-13', '500.99', 0),
(9, 2, '2023-02-13', '500.99', 0),
(10, 2, '2023-02-13', '400.22', 0),
(11, 2, '2023-02-13', '400.22', 0),
(12, 2, '2023-02-13', '400.22', 0),
(13, 2, '2023-02-13', '400.22', 0),
(14, 2, '2023-02-13', '400.22', 0),
(15, 2, '2023-02-13', '400.22', 0),
(16, 2, '2023-02-13', '400.22', 0),
(17, 2, '2023-02-13', '400.22', 0),
(18, 2, '2023-02-13', '855.20', 0),
(19, 2, '2023-02-13', '455.30', 0),
(20, 2, '2023-02-13', '455.30', 0),
(21, 2, '2023-02-13', '455.30', 0),
(22, 2, '2023-02-13', '455.30', 0),
(23, 2, '2023-02-13', '455.30', 0),
(24, 2, '2023-02-13', '455.30', 0),
(25, 2, '2023-02-13', '455.30', 0),
(26, 2, '2023-02-13', '455.30', 0),
(27, 2, '2023-02-13', '910.60', 0),
(28, 2, '2023-02-13', '750.22', 0),
(29, 2, '2023-02-13', '805.30', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasteles`
--

CREATE TABLE `pasteles` (
  `Pastel_ID` int(11) NOT NULL,
  `Sabor_ID` int(11) NOT NULL,
  `Tamanio_ID` int(11) NOT NULL,
  `Relleno_ID` int(11) NOT NULL,
  `Cobertura_ID` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Imagen` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pasteles`
--

INSERT INTO `pasteles` (`Pastel_ID`, `Sabor_ID`, `Tamanio_ID`, `Relleno_ID`, `Cobertura_ID`, `Precio`, `Imagen`) VALUES
(1, 1, 3, 4, 1, '350.00', 'https://www.recetasnestle.com.mx/sites/default/files/srh_recipes/e2c65542d1e62d8935dfa2026ceb2baa.jpg'),
(4, 3, 1, 3, 2, '399.90', 'https://t1.uc.ltmcdn.com/es/posts/5/3/7/como_hacer_un_pastel_de_zanahoria_25735_orig.jpg'),
(5, 4, 2, 1, 2, '355.90', 'https://t1.uc.ltmcdn.com/es/posts/5/3/7/como_hacer_un_pastel_de_zanahoria_25735_orig.jpg'),
(6, 2, 3, 3, 1, '500.99', 'https://t1.uc.ltmcdn.com/es/posts/5/3/7/como_hacer_un_pastel_de_zanahoria_25735_orig.jpg'),
(7, 5, 3, 5, 1, '455.30', 'https://static.onecms.io/wp-content/uploads/sites/21/2017/02/24/3a23ae4b-48b7-44eb-96a7-0e8e755683b6-2000.jpg'),
(8, 5, 3, 5, 1, '455.30', 'https://static.onecms.io/wp-content/uploads/sites/21/2017/02/24/3a23ae4b-48b7-44eb-96a7-0e8e755683b6-2000.jpg'),
(9, 5, 2, 5, 2, '455.30', 'https://static.onecms.io/wp-content/uploads/sites/21/2017/02/24/3a23ae4b-48b7-44eb-96a7-0e8e755683b6-2000.jpg'),
(10, 5, 2, 3, 2, '455.30', 'https://thesweetmolcajete.com/wp-content/uploads/2020/06/WPRM-Receta-de-Pastel-de-Tres-Leches.jpg'),
(11, 2, 2, 4, 1, '400.22', 'https://cdn7.kiwilimon.com/recetaimagen/36187/960x640/44504.jpg.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rellenos`
--

CREATE TABLE `rellenos` (
  `Relleno_ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rellenos`
--

INSERT INTO `rellenos` (`Relleno_ID`, `Nombre`) VALUES
(1, 'Crema de nuez'),
(2, 'Mermelada de Fresa'),
(3, 'Cajeta'),
(4, 'Crema de coco'),
(5, 'Chocolate');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sabores`
--

CREATE TABLE `sabores` (
  `Sabor_ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sabores`
--

INSERT INTO `sabores` (`Sabor_ID`, `Nombre`) VALUES
(1, 'Chocolate'),
(2, 'Vainilla'),
(3, 'Red velvet'),
(4, 'Zanahoria'),
(5, 'Tres leches');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tamanios`
--

CREATE TABLE `tamanios` (
  `Tamanio_ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tamanios`
--

INSERT INTO `tamanios` (`Tamanio_ID`, `Nombre`) VALUES
(1, 'Chico'),
(2, 'Mediano'),
(3, 'Grande');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Usuario_ID` int(11) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Usuario_ID`, `Correo`, `Password`, `Status`, `Admin`) VALUES
(1, 'admin@live.com', '12345678', 1, 1),
(2, 'jimenna_garcia@live.com', '17100123', 1, 0),
(3, 'A21310367@CETI.MX', '21310367', 1, 0),
(4, 'A17300095@CETI.MX', '17300095', 1, 0),
(5, 'a21310367@live.CETI.MX', '21310367', 1, 0),
(6, 'pedro@gmail.com', '12345678', 1, 0),
(7, '', '', 1, 0),
(8, '', '', 1, 0);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_cliente` (
`Usuario` int(11)
,`Correo` varchar(255)
,`Nombre` varchar(255)
,`Apellido` varchar(255)
,`Domicilio` varchar(255)
,`Telefono` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_ordclie`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_ordclie` (
`Orden_ID` int(11)
,`Usuario_ID` int(11)
,`DetOrden_ID` int(11)
,`Fecha` date
,`Completada` tinyint(1)
,`Nombre` varchar(255)
,`Apellido` varchar(255)
,`Telefono` varchar(10)
,`Domicilio` varchar(255)
,`Tamanio` varchar(255)
,`Sabor` varchar(255)
,`Relleno` varchar(255)
,`Cobertura` varchar(255)
,`Cantidad` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_ordenes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_ordenes` (
`Orden_ID` int(11)
,`Tamanio` varchar(255)
,`Sabor` varchar(255)
,`Relleno` varchar(255)
,`Cobertura` varchar(255)
,`Cantidad` int(11)
,`Precio` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_pasteles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_pasteles` (
`Pastel_ID` int(11)
,`Imagen` varchar(1000)
,`Precio` decimal(10,2)
,`Sabor` varchar(255)
,`Tamanio` varchar(255)
,`Relleno` varchar(255)
,`Cobertura` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_cliente`
--
DROP TABLE IF EXISTS `ver_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_cliente`  AS  select `usuarios`.`Usuario_ID` AS `Usuario`,`usuarios`.`Correo` AS `Correo`,`clientes`.`Nombre` AS `Nombre`,`clientes`.`Apellido` AS `Apellido`,`clientes`.`Domicilio` AS `Domicilio`,`clientes`.`Telefono` AS `Telefono` from (`usuarios` join `clientes` on(`usuarios`.`Usuario_ID` = `clientes`.`Usuario_ID`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_ordclie`
--
DROP TABLE IF EXISTS `ver_ordclie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_ordclie`  AS  select `ordenes`.`Orden_ID` AS `Orden_ID`,`usuarios`.`Usuario_ID` AS `Usuario_ID`,`detalles_orden`.`DetOrden_ID` AS `DetOrden_ID`,`ordenes`.`Fecha` AS `Fecha`,`ordenes`.`Completada` AS `Completada`,`clientes`.`Nombre` AS `Nombre`,`clientes`.`Apellido` AS `Apellido`,`clientes`.`Telefono` AS `Telefono`,`clientes`.`Domicilio` AS `Domicilio`,`ver_pasteles`.`Tamanio` AS `Tamanio`,`ver_pasteles`.`Sabor` AS `Sabor`,`ver_pasteles`.`Relleno` AS `Relleno`,`ver_pasteles`.`Cobertura` AS `Cobertura`,`detalles_orden`.`Cantidad` AS `Cantidad` from ((((`detalles_orden` join `ordenes` on(`detalles_orden`.`Orden_ID` = `ordenes`.`Orden_ID`)) join `ver_pasteles` on(`detalles_orden`.`Pastel_ID` = `ver_pasteles`.`Pastel_ID`)) join `usuarios` on(`ordenes`.`Usuario_ID` = `usuarios`.`Usuario_ID`)) join `clientes` on(`clientes`.`Cliente_ID` = `usuarios`.`Usuario_ID`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_ordenes`
--
DROP TABLE IF EXISTS `ver_ordenes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_ordenes`  AS  select `ordenes`.`Orden_ID` AS `Orden_ID`,`ver_pasteles`.`Tamanio` AS `Tamanio`,`ver_pasteles`.`Sabor` AS `Sabor`,`ver_pasteles`.`Relleno` AS `Relleno`,`ver_pasteles`.`Cobertura` AS `Cobertura`,`detalles_orden`.`Cantidad` AS `Cantidad`,`detalles_orden`.`Precio` AS `Precio` from ((`detalles_orden` join `ver_pasteles` on(`detalles_orden`.`Pastel_ID` = `ver_pasteles`.`Pastel_ID`)) join `ordenes` on(`ordenes`.`Orden_ID` = `detalles_orden`.`Orden_ID`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_pasteles`
--
DROP TABLE IF EXISTS `ver_pasteles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_pasteles`  AS  select `pasteles`.`Pastel_ID` AS `Pastel_ID`,`pasteles`.`Imagen` AS `Imagen`,`pasteles`.`Precio` AS `Precio`,`sabores`.`Nombre` AS `Sabor`,`tamanios`.`Nombre` AS `Tamanio`,`rellenos`.`Nombre` AS `Relleno`,`coberturas`.`Nombre` AS `Cobertura` from ((((`pasteles` join `sabores` on(`pasteles`.`Sabor_ID` = `sabores`.`Sabor_ID`)) join `tamanios` on(`pasteles`.`Tamanio_ID` = `tamanios`.`Tamanio_ID`)) join `rellenos` on(`pasteles`.`Relleno_ID` = `rellenos`.`Relleno_ID`)) join `coberturas` on(`pasteles`.`Cobertura_ID` = `coberturas`.`Cobertura_ID`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Cliente_ID`),
  ADD KEY `Usuario_ID` (`Usuario_ID`);

--
-- Indices de la tabla `coberturas`
--
ALTER TABLE `coberturas`
  ADD PRIMARY KEY (`Cobertura_ID`);

--
-- Indices de la tabla `detalles_orden`
--
ALTER TABLE `detalles_orden`
  ADD PRIMARY KEY (`DetOrden_ID`),
  ADD KEY `Pastel_ID` (`Pastel_ID`),
  ADD KEY `Orden_ID` (`Orden_ID`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`Orden_ID`),
  ADD KEY `Usuario_ID` (`Usuario_ID`);

--
-- Indices de la tabla `pasteles`
--
ALTER TABLE `pasteles`
  ADD PRIMARY KEY (`Pastel_ID`),
  ADD KEY `Sabor_ID` (`Sabor_ID`),
  ADD KEY `Tamanio_ID` (`Tamanio_ID`),
  ADD KEY `Relleno_ID` (`Relleno_ID`),
  ADD KEY `Cobertura_ID` (`Cobertura_ID`);

--
-- Indices de la tabla `rellenos`
--
ALTER TABLE `rellenos`
  ADD PRIMARY KEY (`Relleno_ID`);

--
-- Indices de la tabla `sabores`
--
ALTER TABLE `sabores`
  ADD PRIMARY KEY (`Sabor_ID`);

--
-- Indices de la tabla `tamanios`
--
ALTER TABLE `tamanios`
  ADD PRIMARY KEY (`Tamanio_ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Usuario_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Cliente_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `coberturas`
--
ALTER TABLE `coberturas`
  MODIFY `Cobertura_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalles_orden`
--
ALTER TABLE `detalles_orden`
  MODIFY `DetOrden_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `Orden_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `pasteles`
--
ALTER TABLE `pasteles`
  MODIFY `Pastel_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `rellenos`
--
ALTER TABLE `rellenos`
  MODIFY `Relleno_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sabores`
--
ALTER TABLE `sabores`
  MODIFY `Sabor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tamanios`
--
ALTER TABLE `tamanios`
  MODIFY `Tamanio_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Usuario_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `usuarios` (`Usuario_ID`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalles_orden`
--
ALTER TABLE `detalles_orden`
  ADD CONSTRAINT `detalles_orden_ibfk_1` FOREIGN KEY (`Pastel_ID`) REFERENCES `pasteles` (`Pastel_ID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalles_orden_ibfk_2` FOREIGN KEY (`Orden_ID`) REFERENCES `ordenes` (`Orden_ID`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `usuarios` (`Usuario_ID`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pasteles`
--
ALTER TABLE `pasteles`
  ADD CONSTRAINT `pasteles_ibfk_1` FOREIGN KEY (`Relleno_ID`) REFERENCES `rellenos` (`Relleno_ID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `pasteles_ibfk_2` FOREIGN KEY (`Sabor_ID`) REFERENCES `sabores` (`Sabor_ID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `pasteles_ibfk_3` FOREIGN KEY (`Cobertura_ID`) REFERENCES `coberturas` (`Cobertura_ID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `pasteles_ibfk_4` FOREIGN KEY (`Tamanio_ID`) REFERENCES `tamanios` (`Tamanio_ID`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
