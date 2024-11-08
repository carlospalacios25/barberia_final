-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2023 a las 15:54:16
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `barber_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cli_id` int(11) NOT NULL,
  `cli_documento` int(11) NOT NULL,
  `cli_apellido` varchar(255) DEFAULT NULL,
  `cli_direccion` varchar(255) DEFAULT NULL,
  `cli_nombre` varchar(255) DEFAULT NULL,
  `cli_telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cli_id`, `cli_documento`, `cli_apellido`, `cli_direccion`, `cli_nombre`, `cli_telefono`) VALUES
(1, 1000120253, 'carlos', 'car', 'sadsa', 'dasd'),
(2, 33435, 'palacios', 'calle 76 d 8D44', 'Claudio', '31351244'),
(3, 1000120253, 'Palacios', 'kra 78 d 5 sur', 'Carlos Hernan', '38252451');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `com_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `prov_id` int(11) NOT NULL,
  `comp_precio_total` float NOT NULL,
  `comp_fecha_com` varchar(255) DEFAULT NULL,
  `comp_cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`com_id`, `pro_id`, `prov_id`, `comp_precio_total`, `comp_fecha_com`, `comp_cantidad`) VALUES
(1, 4, 3, 58000, '19/08/2023', 3),
(2, 6, 3, 58000, '28/08/2023', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortes`
--

CREATE TABLE `cortes` (
  `id_corte` int(11) NOT NULL,
  `cor_nombre` varchar(255) DEFAULT NULL,
  `cor_precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cortes`
--

INSERT INTO `cortes` (`id_corte`, `cor_nombre`, `cor_precio`) VALUES
(1, 'Carte numero 7', 12000),
(2, 'Hogo', 50000),
(20, 'OK', 880);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `emp_id` int(11) NOT NULL,
  `emp_documento` int(11) NOT NULL,
  `tip_empleado` int(11) NOT NULL,
  `emp_nombre` varchar(255) DEFAULT NULL,
  `emp_apellido` varchar(255) DEFAULT NULL,
  `emp_telefono` varchar(255) DEFAULT NULL,
  `emp_direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`emp_id`, `emp_documento`, `tip_empleado`, `emp_nombre`, `emp_apellido`, `emp_telefono`, `emp_direccion`) VALUES
(1, 33435229, 1, 'Camilo', 'vargas', '34552141', 'kra 76 d'),
(2, 33435230, 1, 'caliche', 'palacios', '36565', '565dfsdf'),
(3, 33435231, 1, 'Caliche', 'Placios', '6245644', 'kra 765 d # 62 i ss 2u'),
(4, 1000120253, 3, 'Oscar', 'perez', '3046654771', 'kra76 -f54 -9sur'),
(5, 55222, 2, 'ol', 's', 's65', 'a6565sa'),
(6, 6565, 3, 'Andres', 'Prieto', '6352244', 'kra76 d#ds');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `fac_id` int(11) NOT NULL,
  `ser_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `fac_cantidad` int(11) NOT NULL,
  `fac_precio_total` float NOT NULL,
  `fac_descuento` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`fac_id`, `ser_id`, `pro_id`, `fac_cantidad`, `fac_precio_total`, `fac_descuento`) VALUES
(1, 2, 4, 1, 120000, 0),
(2, 2, 5, 1, 28000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `pro_id` int(11) NOT NULL,
  `tip_pro_id` int(11) NOT NULL,
  `pro_nombre` varchar(255) DEFAULT NULL,
  `pro_codigo` varchar(255) DEFAULT NULL,
  `pro_descripcion` varchar(255) DEFAULT NULL,
  `pro_precio` float NOT NULL,
  `pro_existencia` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`pro_id`, `tip_pro_id`, `pro_nombre`, `pro_codigo`, `pro_descripcion`, `pro_precio`, `pro_existencia`) VALUES
(4, 1, 'Fila', 'ds56s', 'ok', 25000, 1),
(5, 1, 'ok', 'ok', 'ok', 2500, 2),
(6, 1, 'ok1', 'ok2', 'ok2', 233, 9),
(7, 1, 'ok1', 'ok2', 'ok2', 9000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `prov_id` int(11) NOT NULL,
  `prov_documento` varchar(255) DEFAULT NULL,
  `prov_nombre` varchar(255) DEFAULT NULL,
  `prov_apellido` varchar(255) DEFAULT NULL,
  `prov_telefono` varchar(255) DEFAULT NULL,
  `prov_direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`prov_id`, `prov_documento`, `prov_nombre`, `prov_apellido`, `prov_telefono`, `prov_direccion`) VALUES
(1, '1000120253', 'Carlos', 'tocarruncho', '3046654771', 'KRA 76 D# 62 I 22 SUR'),
(2, '33435229', 'carlos', 'tocarruncho', '30466571', 'kra76 d582'),
(3, '66254', 'Maquinas', '', '313456', 'kra76 d582');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `res_id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `res_cambio` varchar(255) DEFAULT NULL,
  `res_novedad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`res_id`, `id_producto`, `emp_id`, `res_cambio`, `res_novedad`) VALUES
(2, 4, 2, 'kjhgfds', 'ijhgfds'),
(4, 6, 6, 'ninguno', 'Sele asigana maquina'),
(5, 6, 2, 'NA', 'Ingresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `ser_id` int(11) NOT NULL,
  `cli_id` int(11) DEFAULT NULL,
  `cort_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `ser_inicio_hora` varchar(255) DEFAULT NULL,
  `ser_final_hora` varchar(255) DEFAULT NULL,
  `ser_observacion` varchar(255) DEFAULT NULL,
  `ser_cancela` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`ser_id`, `cli_id`, `cort_id`, `emp_id`, `ser_inicio_hora`, `ser_final_hora`, `ser_observacion`, `ser_cancela`) VALUES
(1, 1, 1, 1, '11:01', '12:06', 'ninguna', 1),
(2, 3, 2, 6, '8:50', '9:10', 'Ninguna', 1),
(3, 2, 2, 2, '8:50', '', 'Ninguna', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `tip_em_id` int(11) NOT NULL,
  `tip_emp_nombre` varchar(255) DEFAULT NULL,
  `tip_emp_observacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_empleado`
--

INSERT INTO `tipo_empleado` (`tip_em_id`, `tip_emp_nombre`, `tip_emp_observacion`) VALUES
(1, 'Barbero', 'Solo cortes'),
(2, 'Barbero I', 'Ninguna'),
(3, 'Barbero II', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `tip_id` int(11) NOT NULL,
  `tip_nombre` varchar(255) DEFAULT NULL,
  `tip_observacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`tip_id`, `tip_nombre`, `tip_observacion`) VALUES
(1, 'Cuchilla', 'ninguna'),
(2, 'Maquinas', NULL),
(3, 'Cuchilla', 'Ninguna'),
(4, 'otros', 'ninguna'),
(5, 'Maquina', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(10) NOT NULL,
  `nombre_apellido` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `usua` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre_apellido`, `correo`, `usua`, `clave`) VALUES
(1, 'Carlos Hernan Tocarruncho palacios', 'carlos.tocarruncho2001@gmail.com', 'caes', '1000120253'),
(8, 'ok3', 'ok3', 'ok', 'ok3'),
(9, 'ok4', 'ok4', 'ok4', 'ok4'),
(10, 'OK1', 'ok@', 'hayaly', 'Mascarga');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `id_producto` (`pro_id`),
  ADD KEY `doc_proveedor` (`prov_id`);

--
-- Indices de la tabla `cortes`
--
ALTER TABLE `cortes`
  ADD PRIMARY KEY (`id_corte`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `tip_empleado` (`tip_empleado`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`fac_id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `ser_id` (`ser_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `tip_pro_id` (`tip_pro_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`prov_id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ser_id`),
  ADD KEY `cort_id` (`cort_id`),
  ADD KEY `emp_id` (`emp_id`) USING BTREE,
  ADD KEY `cli_id` (`cli_id`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`tip_em_id`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`tip_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cortes`
--
ALTER TABLE `cortes`
  MODIFY `id_corte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `fac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  MODIFY `tip_em_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `tip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `producto` (`pro_id`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`prov_id`) REFERENCES `proveedor` (`prov_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `tip_empleado` FOREIGN KEY (`tip_empleado`) REFERENCES `tipo_empleado` (`tip_em_id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ser_id`) REFERENCES `servicio` (`ser_id`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `producto` (`pro_id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tip_pro_id`) REFERENCES `tipo_producto` (`tip_id`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`pro_id`),
  ADD CONSTRAINT `registro_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `empleado` (`emp_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `cort_id` FOREIGN KEY (`cort_id`) REFERENCES `cortes` (`id_corte`),
  ADD CONSTRAINT `servicio_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `empleado` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servicio_ibfk_3` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
