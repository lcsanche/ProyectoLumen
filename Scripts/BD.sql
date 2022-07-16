drop schema xyz;
create schema xyz;
use xyz;

-- --------------------------------------------------------------------------
--                        Creando las Tablas
-- --------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `contrasena` varchar(60) NOT NULL,
  `cliente_id` int NOT NULL,
  `estado` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
  );

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tipo_platos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `platos` (
  `plato_id` int NOT NULL AUTO_INCREMENT,
  `tipo_plato` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`plato_id`),
  CONSTRAINT `plato_ibfk_1` FOREIGN KEY (`tipo_plato`) REFERENCES `tipo_platos` (`id`)
);

CREATE TABLE IF NOT EXISTS `menu_platos` (
  `menu_id` int NOT NULL,
  `plato_id` int NOT NULL,
  `dia` int NOT NULL,
  `precio` double NOT NULL,
  CONSTRAINT `menu_plato_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `menu_plato_ibfk_2` FOREIGN KEY (`plato_id`) REFERENCES `platos` (`plato_id`)
);

CREATE TABLE IF NOT EXISTS `pedido_cabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `fecha_pedido` date NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `pedido_cab_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `pedido_cab_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
);

CREATE TABLE IF NOT EXISTS `pedido_det` (
  `pedido_cab` int NOT NULL,
  `menu_plato_id` int NOT NULL,
  `cantidad` int NOT NULL,
  CONSTRAINT `pedido_det_ibfk_1` FOREIGN KEY (`pedido_cab`) REFERENCES `pedido_cabs` (`id`),
  CONSTRAINT `pedido_det_ibfk_2` FOREIGN KEY (`menu_plato_id`) REFERENCES `menu_platos` (`plato_id`)
);

-- --------------------------------------------------------------------------
--                        Agregando datos a las Tablas
-- --------------------------------------------------------------------------

INSERT INTO `cliente` (`id`, `nombre`, `direccion`, `ruc`, `telefono`) VALUES
(1, 'Viamatica', 'Edificio San Francisco 300', '0978454714001', 955555555),
(2, 'Banco Guayaquil', '9 de octubre', '0987542525001', 992969119),
(3, 'Pycca', '9 de octubre', '0902145644001', 983266774);

INSERT INTO `usuario` (`id`, `nombre`, `usuario`, `contrasena`, `cliente_id`, `estado`) VALUES
(1, 'Miguel Fernandez', 'mfernan', '123', 1, 'activo'),
(2, 'Antonio Parrales', 'aparra', '123', 2, 'activo'),
(3, 'Andrea Yepez', 'ayepez', '123', 3, 'activo'),
(4, 'Jorge Delgado', 'jdelga', '123', 1, 'activo'),
(5, 'Luis Santiesteban', 'lsanti', '123', 2, 'activo');

INSERT INTO `menus` (`id`, `fecha`, `estado`) VALUES
(1, '2022-06-27', 'Caducado'),
(2, '2022-07-04', 'Caducado'),
(3, '2022-07-11', 'Activo'),
(4, '2022-07-18', 'Pendiente'),
(5, '2022-07-25', 'Pendiente');

INSERT INTO `tipo_platos` (`id`, `nombre`) VALUES
(1, 'Sopa'),
(2, 'Segundo'),
(3, 'Dieta');

INSERT INTO `platos` (`plato_id`, `tipo_plato`, `nombre`, `descripcion`) VALUES
(1, 1, 'Sopa de pollo', 'Sopa de pollo con legumbres'),
(2, 2, 'Arroz con puré y carne', 'Arroz con puré y carne frita con ensalada'),
(3, 1, 'Sopa de lentejas', 'Sopa de lentejas y queso con trocitos de verde'),
(4, 3, 'Pollo y vegetales', 'Pollo a la plancha con vegetales'),
(5, 2, 'Arroz con pollo', 'Arroz con pollo y ensalada de remolacha');

INSERT INTO `menu_platos` (`menu_id`, `plato_id`, `dia`, `precio`) VALUES
(1, 1, 1, 1.50),
(2, 2, 1, 2.50),
(3, 3, 1, 1.50),
(4, 4, 1, 3.00),
(5, 5, 1, 1.50);

INSERT INTO `pedido_cabs` (`id`, `menu_id`, `cliente_id`, `fecha_pedido`) VALUES
(1, 3, 1, '2022-07-11'),
(2, 3, 2, '2022-07-11'),
(3, 3, 3, '2022-07-11'),
(4, 2, 1, '2022-07-04'),
(5, 2, 2, '2022-07-04');

INSERT INTO `pedido_det` (`pedido_cab`, `menu_plato_id`, `cantidad`) VALUES
(1, 1, 100),
(2, 2, 150),
(3, 3, 200),
(4, 4, 250),
(5, 5, 300);