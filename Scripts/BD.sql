-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2022 a las 03:33:18
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `xyz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `direccion`, `ruc`, `telefono`) VALUES
(1, 'Viamatica', 'Edificio San Francisco 300', '0978454714001', 955555555),
(2, 'Banco Guayaquil', '9 de octubre', '0987542525001', 992969119),
(3, 'Pycca', '9 de octubre', '0902145644001', 983266774);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `menu` (`id`, `fecha`, `estado`) VALUES
(1, '2022-06-27', 'Caducado'),
(2, '2022-07-04', 'Caducado'),
(3, '2022-07-11', 'Activo'),
(4, '2022-07-18', 'Pendiente'),
(5, '2022-07-25', 'Pendiente');
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_plato`
--

CREATE TABLE `menu_plato` (
  `menu_id` int(11) NOT NULL,
  `plato_id` int(11) NOT NULL,
  `dia` int(2) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `menu_plato` (`menu_id`, `plato_id`, `dia`, `precio`) VALUES
(1, 1, '01', '1.50'),
(2, 2, '01', '2.50'),
(3, 3, '01', '1.50'),
(4, 4, '01', '3.00'),
(5, 5, '01', '1.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_cab`
--

CREATE TABLE `pedido_cab` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pedido_cab` (`id`, `menu_id`, `cliente_id`, `fecha_pedido`) VALUES
(1, 3, 1, '2022-07-11'),
(2, 3, 2, '2022-07-11'),
(3, 3, 3, '2022-07-11'),
(4, 2, 1, '2022-07-04'),
(5, 2, 2, '2022-07-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_det`
--

CREATE TABLE `pedido_det` (
  `pedido_cab` int(11) NOT NULL,
  `menu_plato_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pedido_det` (`pedido_cab`, `menu_plato_id`, `cantidad`) VALUES
(1, 1, '100'),
(2, 2, '150'),
(3, 3, '200'),
(4, 4, '250'),
(5, 5, '300');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `plato_id` int(11) NOT NULL,
  `tipo_plato` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`plato_id`, `tipo_plato`, `nombre`, `descripcion`) VALUES
(1, 1, 'Sopa de pollo', 'Sopa de pollo con legumbres'),
(2, 2, 'Arroz con puré y carne', 'Arroz con puré y carne frita con ensalada'),
(3, 1, 'Sopa de lentejas', 'Sopa de lentejas y queso con trocitos de verde'),
(4, 3, 'Pollo y vegetales', 'Pollo a la plancha con vegetales'),
(4, 2, 'Arroz con pollo', 'Arroz con pollo y ensalada de remolacha');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_plato`
--

CREATE TABLE `tipo_plato` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_plato`
--

INSERT INTO `tipo_plato` (`id`, `nombre`) VALUES
(1, 'Sopa'),
(2, 'Segundo'),
(3, 'Dieta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `contrasena` varchar(60) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `usuario` (`id`, `nombre`, `usuario`, `contraseña`, `cliente_id`, `estado`) VALUES
(1, 'Miguel Fernandez', 'mfernan', '123', '1', 'activo'),
(2, 'Antonio Parrales', 'aparra', '123', '2', 'activo'),
(3, 'Andrea Yepez', 'ayepez', '123', '3', 'activo'),
(4, 'Jorge Delgado', 'jdelga', '123', '1', 'activo'),
(5, 'Luis Santiesteban', 'lsanti', '123', '2', 'activo'),

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu_plato`
--
ALTER TABLE `menu_plato`
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `plato_id` (`plato_id`);

--
-- Indices de la tabla `pedido_cab`
--
ALTER TABLE `pedido_cab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indices de la tabla `pedido_det`
--
ALTER TABLE `pedido_det`
  ADD KEY `pedido_cab` (`pedido_cab`),
  ADD KEY `menu_plato_id` (`menu_plato_id`);

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`plato_id`),
  ADD KEY `tipo_plato` (`tipo_plato`);

--
-- Indices de la tabla `tipo_plato`
--
ALTER TABLE `tipo_plato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_cab`
--
ALTER TABLE `pedido_cab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plato`
--
ALTER TABLE `plato`
  MODIFY `plato_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_plato`
--
ALTER TABLE `tipo_plato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `menu_plato`
--
ALTER TABLE `menu_plato`
  ADD CONSTRAINT `menu_plato_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `menu_plato_ibfk_2` FOREIGN KEY (`plato_id`) REFERENCES `plato` (`plato_id`);

--
-- Filtros para la tabla `pedido_cab`
--
ALTER TABLE `pedido_cab`
  ADD CONSTRAINT `pedido_cab_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `pedido_cab_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

--
-- Filtros para la tabla `pedido_det`
--
ALTER TABLE `pedido_det`
  ADD CONSTRAINT `pedido_det_ibfk_1` FOREIGN KEY (`pedido_cab`) REFERENCES `pedido_cab` (`id`),
  ADD CONSTRAINT `pedido_det_ibfk_2` FOREIGN KEY (`menu_plato_id`) REFERENCES `menu_plato` (`plato_id`);

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `plato_ibfk_1` FOREIGN KEY (`tipo_plato`) REFERENCES `tipo_plato` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;