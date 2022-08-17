-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-08-2022 a las 18:30:55
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.0.21
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

CREATE TABLE `balizamiento` (
  `nif` varchar(8) NOT NULL,
  `num_internacional` varchar(12) DEFAULT NULL,
  `tipo` varchar(250) DEFAULT NULL,
  `telecontrol` varchar(200) DEFAULT NULL,
  `apariencia` varchar(50) DEFAULT NULL,
  `periodo` decimal(5, 2) DEFAULT NULL,
  `caracteristica` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de balizas';

CREATE TABLE `cochecito` (
  `usuario` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `horaE` varchar(5) DEFAULT NULL,
  `horaS` varchar(5) DEFAULT NULL,
  `motivo` varchar(100) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de uso del vehiculo';

CREATE TABLE `documentos` (
  `id_archivo` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de documentos';

CREATE TABLE `eliminados` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(10) NOT NULL,
  `item` varchar(50) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'Tabla de elementos de inventario eliminados';

CREATE TABLE `inventario` (
  `id` mediumint(9) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `item` varchar(50) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de inventario';

CREATE TABLE `lampara` (
  `nif` varchar(8) NOT NULL,
  `altura` int(11) DEFAULT NULL,
  `elevacion` int(11) DEFAULT NULL,
  `alcanceNom` float(10, 2) DEFAULT NULL,
  `linterna` varchar(200) DEFAULT NULL,
  `candelasCalc` float(12, 2) DEFAULT NULL,
  `alcanceLum` float(10, 2) DEFAULT NULL,
  `candelasInst` float(12, 2) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de detalles lampara';

CREATE TABLE `localizacion` (
  `nif` varchar(8) NOT NULL,
  `puerto` varchar(50) DEFAULT NULL,
  `num_local` decimal(5, 0) DEFAULT NULL,
  `localizacion` varchar(70) DEFAULT NULL,
  `latitud` varchar(15) DEFAULT NULL,
  `longitud` varchar(15) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de localizacion del balizamiento';

CREATE TABLE `logs` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(50) NOT NULL,
  `accion` varchar(100) DEFAULT NULL,
  `observacion` varchar(150) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de logs';

CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int(10) UNSIGNED NOT NULL,
  `nif` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `mantenimiento` varchar(250) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de mantenimiento del balizamiento';

CREATE TABLE `observaciones` (
  `id_observacion` int(10) UNSIGNED NOT NULL,
  `nif` varchar(8) NOT NULL,
  `observaciones` varchar(250) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de observaciones del balizamiento';

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf16 COLLATE = utf16_spanish2_ci;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `privilegio` varchar(20) DEFAULT NULL,
  `pictureURL` varchar(100) CHARACTER SET utf16 COLLATE utf16_spanish2_ci DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de usuarios';

--
ALTER TABLE
  `balizamiento`
ADD
  PRIMARY KEY (`nif`);

ALTER TABLE
  `cochecito`
ADD
  PRIMARY KEY (`usuario`, `fecha`);

ALTER TABLE
  `inventario`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `lampara`
ADD
  PRIMARY KEY (`nif`);

ALTER TABLE
  `localizacion`
ADD
  PRIMARY KEY (`nif`);

ALTER TABLE
  `mantenimiento`
ADD
  PRIMARY KEY (`id_mantenimiento`),
ADD
  KEY `mantenimiento_FK` (`nif`),
MODIFY
  `id_mantenimiento` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 595;

ALTER TABLE
  `observaciones`
ADD
  PRIMARY KEY (`id_observacion`),
ADD
  KEY `observaciones_FK` (`nif`),
MODIFY
  `id_observacion` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 100;

ALTER TABLE
  `sessions`
ADD
  PRIMARY KEY (`session_id`);

ALTER TABLE
  `usuarios`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `usuarios`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 1;

COMMIT;