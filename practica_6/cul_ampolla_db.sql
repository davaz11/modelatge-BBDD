-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2020 a las 16:53:45
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_ampolla_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `id_address` int(11) NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `number` varchar(5) DEFAULT NULL,
  `flat` varchar(5) DEFAULT NULL,
  `door` varchar(5) DEFAULT NULL,
  `postal_code` varchar(5) DEFAULT NULL,
  `id_country` int(11) NOT NULL,
  `id_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`id_address`, `street`, `number`, `flat`, `door`, `postal_code`, `id_country`, `id_city`) VALUES
(1, 'Calle Tarragona', '35', '2', '1ª', '08123', 1, 1),
(3, 'Calle Florida', '33', '4', '4', '2', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(11) NOT NULL,
  `brand_name` varchar(45) NOT NULL,
  `id_provider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_brand`, `brand_name`, `id_provider`) VALUES
(1, 'Dolce Gabana', 1),
(2, 'Desigual', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `id_city` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id_city`, `name`) VALUES
(1, 'Barcelona'),
(2, 'Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(320) NOT NULL,
  `register_date` date NOT NULL,
  `id_address` int(11) NOT NULL,
  `id_client_adviser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `name`, `email`, `register_date`, `id_address`, `id_client_adviser`) VALUES
(1, 'Rodolfo Valentino', 'kkk@gmail.com', '2020-11-11', 1, NULL),
(2, 'Andres Calamaro', 'kkrtk@gmail.com', '2020-10-10', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id_color` int(11) NOT NULL,
  `color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_color`, `color`) VALUES
(1, 'Rojo'),
(2, 'Azul'),
(3, 'Verde'),
(4, 'Amarillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE `country` (
  `id_country` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`id_country`, `name`) VALUES
(1, 'España'),
(2, 'Francia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id_employee`, `name`) VALUES
(1, 'Carmen Maura'),
(2, 'Carmen Maura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frametype`
--

CREATE TABLE `frametype` (
  `id_frame_type` int(11) NOT NULL,
  `frame_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `frametype`
--

INSERT INTO `frametype` (`id_frame_type`, `frame_type`) VALUES
(1, 'montura de pasta'),
(2, 'montura metalica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int(11) NOT NULL,
  `calibration_right` float NOT NULL,
  `calibtration_left` float NOT NULL,
  `price` float NOT NULL,
  `id_frame_type` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_color_right` int(11) NOT NULL,
  `id_color_left` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `calibration_right`, `calibtration_left`, `price`, `id_frame_type`, `id_brand`, `id_color_right`, `id_color_left`) VALUES
(2, 1, 2, 200, 1, 1, 1, 1),
(5, 3, 2, 300, 2, 2, 3, 3),
(6, 1, 1, 250, 1, 2, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `id_provider` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `nif` varchar(9) NOT NULL,
  `id_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`id_provider`, `name`, `telephone`, `fax`, `nif`, `id_address`) VALUES
(1, 'MultiOpticas', '4444444444', '44444', '3456787', 1),
(3, 'Aflelou', '34567', '332', '234', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale`
--

CREATE TABLE `sale` (
  `id_sale` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `sale_date` date NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sale`
--

INSERT INTO `sale` (`id_sale`, `total_price`, `sale_date`, `id_client`, `id_employee`) VALUES
(1, 300, '2020-10-13', 1, 1),
(2, 350, '2020-10-12', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saledetail`
--

CREATE TABLE `saledetail` (
  `id_sale` int(11) NOT NULL,
  `id_glasses` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `saledetail`
--

INSERT INTO `saledetail` (`id_sale`, `id_glasses`, `amount`) VALUES
(1, 2, 1),
(1, 5, 1),
(2, 6, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `fk_Address_Country_idx` (`id_country`),
  ADD KEY `fk_Address_City1_idx` (`id_city`);

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD KEY `fk_Brand_Provider1_idx` (`id_provider`);

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `fk_Client_Address1_idx` (`id_address`),
  ADD KEY `fk_Client_Client1_idx` (`id_client_adviser`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id_color`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id_country`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indices de la tabla `frametype`
--
ALTER TABLE `frametype`
  ADD PRIMARY KEY (`id_frame_type`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `fk_Glasses_FrameType1_idx` (`id_frame_type`),
  ADD KEY `fk_Glasses_Brand1_idx` (`id_brand`),
  ADD KEY `fk_Glasses_Colors1_idx` (`id_color_right`),
  ADD KEY `fk_Glasses_Colors2_idx` (`id_color_left`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id_provider`),
  ADD KEY `fk_Provider_Address1_idx` (`id_address`);

--
-- Indices de la tabla `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id_sale`),
  ADD KEY `fk_Sale_Client1_idx` (`id_client`),
  ADD KEY `fk_Sale_Employee1_idx` (`id_employee`);

--
-- Indices de la tabla `saledetail`
--
ALTER TABLE `saledetail`
  ADD PRIMARY KEY (`id_sale`,`id_glasses`),
  ADD KEY `fk_SaleDetail_Glasses1_idx` (`id_glasses`),
  ADD KEY `fk_SaleDetail_Sale1_idx` (`id_sale`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `frametype`
--
ALTER TABLE `frametype`
  MODIFY `id_frame_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id_glasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `provider`
--
ALTER TABLE `provider`
  MODIFY `id_provider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sale`
--
ALTER TABLE `sale`
  MODIFY `id_sale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_Address_City1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Address_Country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `fk_Brand_Provider1` FOREIGN KEY (`id_provider`) REFERENCES `provider` (`id_provider`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_Client_Address1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Client_Client1` FOREIGN KEY (`id_client_adviser`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Glasses_Colors1` FOREIGN KEY (`id_color_right`) REFERENCES `color` (`id_color`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Glasses_Colors2` FOREIGN KEY (`id_color_left`) REFERENCES `color` (`id_color`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Glasses_FrameType1` FOREIGN KEY (`id_frame_type`) REFERENCES `frametype` (`id_frame_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `provider`
--
ALTER TABLE `provider`
  ADD CONSTRAINT `fk_Provider_Address1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `fk_Sale_Client1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Sale_Employee1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `saledetail`
--
ALTER TABLE `saledetail`
  ADD CONSTRAINT `fk_SaleDetail_Glasses1` FOREIGN KEY (`id_glasses`) REFERENCES `glasses` (`id_glasses`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SaleDetail_Sale1` FOREIGN KEY (`id_sale`) REFERENCES `sale` (`id_sale`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
