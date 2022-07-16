SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `xyz`
--

-- --------------------------------------------------------
--
-- Estructura de Tabla: cliente
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `cliente` (`id`, `nombre`, `direccion`, `ruc`, `telefono`) VALUES
(1, 'Viamatica', 'Edificio San Francisco 300', '0978454714001', 955555555),
(2, 'Banco Guayaquil', '9 de octubre', '0987542525001', 992969119),
(3, 'Pycca', '9 de octubre', '0902145644001', 983266774);

-- --------------------------------------------------------
--
-- Estructura de Tabla: menus
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `menus` (`id`, `fecha`, `estado`) VALUES
(1, '2022-06-27', 'Caducado'),
(2, '2022-07-04', 'Caducado'),
(3, '2022-07-11', 'Activo'),
(4, '2022-07-18', 'Pendiente'),
(5, '2022-07-25', 'Pendiente');

-- --------------------------------------------------------
--
-- -- Estructura de Tabla: menu_platos
--

CREATE TABLE IF NOT EXISTS `menu_platos` (
  `menu_id` int(11) NOT NULL,
  `plato_id` int(11) NOT NULL,
  `dia` int(2) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `menu_platos` (`menu_id`, `plato_id`, `dia`, `precio`) VALUES
(1, 1, 1, 1.50),
(2, 2, 1, 2.50),
(3, 3, 1, 1.50),
(4, 4, 1, 3.00),
(5, 5, 1, 1.50);

-- --------------------------------------------------------
--
-- -- Estructura de Tabla: pedido_cab
--

CREATE TABLE IF NOT EXISTS `pedido_cabs` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pedido_cabs` (`id`, `menu_id`, `cliente_id`, `fecha_pedido`) VALUES
(1, 3, 1, '2022-07-11'),
(2, 3, 2, '2022-07-11'),
(3, 3, 3, '2022-07-11'),
(4, 2, 1, '2022-07-04'),
(5, 2, 2, '2022-07-04');

-- --------------------------------------------------------
--
-- -- Estructura de Tabla: pedido_det
--

CREATE TABLE IF NOT EXISTS `pedido_det` (
  `pedido_cab` int(11) NOT NULL,
  `menu_plato_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pedido_det` (`pedido_cab`, `menu_plato_id`, `cantidad`) VALUES
(1, 1, 100),
(2, 2, 150),
(3, 3, 200),
(4, 4, 250),
(5, 5, 300);

-- --------------------------------------------------------
--
-- -- Estructura de Tabla: plato
--

CREATE TABLE IF NOT EXISTS `plato` (
  `plato_id` int(11) NOT NULL,
  `tipo_plato` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `plato` (`plato_id`, `tipo_plato`, `nombre`, `descripcion`) VALUES
(1, 1, 'Sopa de pollo', 'Sopa de pollo con legumbres'),
(2, 2, 'Arroz con puré y carne', 'Arroz con puré y carne frita con ensalada'),
(3, 1, 'Sopa de lentejas', 'Sopa de lentejas y queso con trocitos de verde'),
(4, 3, 'Pollo y vegetales', 'Pollo a la plancha con vegetales'),
(5, 2, 'Arroz con pollo', 'Arroz con pollo y ensalada de remolacha');

-- --------------------------------------------------------
--
-- -- Estructura de Tabla: tipo_plato
--

CREATE TABLE IF NOT EXISTS `tipo_plato` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tipo_plato` (`id`, `nombre`) VALUES
(1, 'Sopa'),
(2, 'Segundo'),
(3, 'Dieta');

-- --------------------------------------------------------
--
-- -- Estructura de Tabla: usuario
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `contrasena` varchar(60) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `usuario` (`id`, `nombre`, `usuario`, `contrasena`, `cliente_id`, `estado`) VALUES
(1, 'Miguel Fernandez', 'mfernan', '123', 1, 'activo'),
(2, 'Antonio Parrales', 'aparra', '123', 2, 'activo'),
(3, 'Andrea Yepez', 'ayepez', '123', 3, 'activo'),
(4, 'Jorge Delgado', 'jdelga', '123', 1, 'activo'),
(5, 'Luis Santiesteban', 'lsanti', '123', 2, 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu_platos`
--
ALTER TABLE `menu_platos`
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `plato_id` (`plato_id`);

--
-- Indices de la tabla `pedido_cabs`
--
ALTER TABLE `pedido_cabs`
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
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_cabs`
--
ALTER TABLE `pedido_cabs`
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
-- Filtros para la tabla `menu_platos`
--
ALTER TABLE `menu_platos`
  ADD CONSTRAINT `menu_plato_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `menu_plato_ibfk_2` FOREIGN KEY (`plato_id`) REFERENCES `plato` (`plato_id`);

--
-- Filtros para la tabla `pedido_cabs`
--
ALTER TABLE `pedido_cabs`
  ADD CONSTRAINT `pedido_cab_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `pedido_cab_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Filtros para la tabla `pedido_det`
--
ALTER TABLE `pedido_det`
  ADD CONSTRAINT `pedido_det_ibfk_1` FOREIGN KEY (`pedido_cab`) REFERENCES `pedido_cabs` (`id`),
  ADD CONSTRAINT `pedido_det_ibfk_2` FOREIGN KEY (`menu_plato_id`) REFERENCES `menu_platos` (`plato_id`);

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