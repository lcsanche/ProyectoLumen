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
  `telefono` varchar(15) NOT NULL,
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
(3, 'Pycca', '9 de octubre', '0902145644001', 983266774),
(4, 'Trudeo', '67 Pearson Junction', '8067412359', '2881672205'),
(5, 'Realpoint', '4 Novick Lane', '3456988168', '3467623662'),
(6, 'Bluezoom', '282 Bluestem Plaza', '4930245419', '1280515589'),
(7, 'Livepath', '0419 Michigan Circle', '4768603718', '0459661299'),
(8, 'Tambee', '23342 Nancy Avenue', '0781563135', '7660518704'),
(9, 'Flashset', '51 Parkside Place', '3371340449', '3907503953'),
(10, 'Ooba', '45 Sundown Place', '1617852538', '2380773521');

INSERT INTO `usuario` (`id`, `nombre`, `usuario`, `contrasena`, `cliente_id`, `estado`) VALUES
(1, 'Miguel Fernandez', 'mfernan', '123', 1, 'activo'),
(2, 'Antonio Parrales', 'aparra', '123', 2, 'activo'),
(3, 'Andrea Yepez', 'ayepez', '123', 3, 'activo'),
(4, 'Jorge Delgado', 'jdelga', '123', 1, 'activo'),
(5, 'Luis Santiesteban', 'lsanti', '123', 2, 'activo'),
(6, 'Elianora Jordeson', 'ejordeson5', 'YrSp0TR', 6, 'activo'),
(7, 'Selig Heaford', 'sheaford6', 'bRMbn5t0', 7, 'activo'),
(8, 'Siusan Hardwicke', 'shardwicke7', '0OaglL', 8, 'activo'),
(9, 'Carine Bownas', 'cbownas8', 'R3mKXozX', 9, 'activo'),
(10, 'Karoline Scanes', 'kscanes9', 'D3Z5bs9UqeC3', 10, 'activo');

INSERT INTO `menus` (`id`, `fecha`, `estado`) VALUES
(1, '2022-06-27', 'Caducado'),
(2, '2022-07-04', 'Caducado'),
(3, '2022-07-11', 'Activo'),
(4, '2022-07-18', 'Pendiente'),
(5, '2022-07-25', 'Pendiente'),
(6, '2022-02-19', 'Caducado'),
(7, '2022-04-18', 'Caducado'),
(8, '2022-04-23', 'Caducado'),
(9, '2022-03-25', 'Caducado'),
(10, '2021-10-12', 'Caducado');

INSERT INTO `tipo_platos` (`id`, `nombre`) VALUES
(1, 'Sopa'),
(2, 'Segundo'),
(3, 'Dieta');

INSERT INTO `platos` (`plato_id`, `tipo_plato`, `nombre`, `descripcion`) VALUES
(1, 1, 'Sopa de pollo', 'Sopa de pollo con legumbres'),
(2, 2, 'Arroz con puré y carne', 'Arroz con puré y carne frita con ensalada'),
(3, 1, 'Sopa de lentejas', 'Sopa de lentejas y queso con trocitos de verde'),
(4, 3, 'Pollo y vegetales', 'Pollo a la plancha con vegetales'),
(5, 2, 'Arroz con pollo', 'Arroz con pollo y ensalada de remolacha'),
(6, 2, 'Llapingachos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(7, 2, 'Ceviche', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(8, 1, 'Sopa de Camaron', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(9, 2, 'Guatita', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(10, 3, 'Tilapia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');

INSERT INTO `menu_platos` (`menu_id`, `plato_id`, `dia`, `precio`) VALUES
(1, 1, 1, 1.50),
(2, 2, 1, 2.50),
(3, 3, 1, 1.50),
(4, 4, 1, 3.00),
(5, 5, 2, 2.50),
(6, 6, 2, 2.50),
(7, 7, 2, 2.50),
(8, 8, 3, 1.50),
(9, 9, 3, 2.50),
(10, 10, 3, 3.00);

INSERT INTO `pedido_cabs` (`id`, `menu_id`, `cliente_id`, `fecha_pedido`) VALUES
(1, 3, 1, '2022-07-11'),
(2, 3, 2, '2022-07-11'),
(3, 3, 3, '2022-07-11'),
(4, 2, 1, '2022-07-04'),
(5, 2, 2, '2022-07-04'),
(6, 6, 6, '2022-05-23'),
(7, 7, 7, '2021-12-26'),
(8, 8, 8, '2022-06-14'),
(9, 9, 9, '2021-07-25'),
(10, 10, 10, '2021-10-16');

INSERT INTO `pedido_det` (`pedido_cab`, `menu_plato_id`, `cantidad`) VALUES
(1, 1, 100),
(2, 2, 150),
(3, 3, 200),
(4, 4, 250),
(5, 5, 300),
(6, 6, 270),
(7, 7, 569),
(8, 8, 295),
(9, 9, 227),
(10, 10, 390);
