-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2018 at 11:58 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpostulacion`
--

-- --------------------------------------------------------

--
-- Table structure for table `comuna`
--

CREATE TABLE `comuna` (
  `comuna_id` int(11) NOT NULL,
  `comuna_nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comuna`
--

INSERT INTO `comuna` (`comuna_id`, `comuna_nombre`) VALUES
(0, 'Comuna de Santiago'),
(1, 'Comuna de Cerrillos'),
(2, 'Comuna de Cerro Navia'),
(3, 'Comuna de Conchalí'),
(4, 'Comuna de El Bosque'),
(5, 'Comuna de Estación Centra'),
(6, 'Comuna de Huechuraba'),
(7, 'Comuna de Independencia'),
(8, 'Comuna de La Cisterna'),
(9, 'Comuna de La Florida'),
(10, 'Comuna de La Granja'),
(11, 'Comuna de La Pintana'),
(12, 'Comuna de La Reina'),
(13, 'Comuna de Las Condes'),
(14, 'Comuna de Lo Barnechea'),
(15, 'Comuna de Lo Espejo'),
(16, 'Comuna de Lo Prado'),
(17, 'Comuna de Macul'),
(18, 'Comuna de Maipú'),
(19, 'Comuna de Ñuñoa'),
(20, 'Comuna de Pedro Aguirre C'),
(21, 'Comuna de Peñalolén'),
(22, 'Comuna de Providencia'),
(23, 'Comuna de Pudahuel'),
(24, 'Comuna de Quilicura'),
(25, 'Comuna de Quinta Normal'),
(26, 'Comuna de Recoleta'),
(27, 'Comuna de Renca'),
(28, 'Comuna de San Joaquín'),
(29, 'Comuna de San Miguel'),
(30, 'Comuna de San Ramón'),
(31, 'Comuna de Vitacura');

-- --------------------------------------------------------

--
-- Table structure for table `educacione`
--

CREATE TABLE `educacione` (
  `educacione_id` int(11) NOT NULL,
  `educacione_tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educacione`
--

INSERT INTO `educacione` (`educacione_id`, `educacione_tipo`) VALUES
(0, 'Profesional'),
(1, 'Tecnico'),
(2, 'Media'),
(3, 'Basica'),
(4, 'No Posee');

-- --------------------------------------------------------

--
-- Table structure for table `estadocivil`
--

CREATE TABLE `estadocivil` (
  `estadocivil_id` int(11) NOT NULL,
  `estadocivil_tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadocivil`
--

INSERT INTO `estadocivil` (`estadocivil_id`, `estadocivil_tipo`) VALUES
(0, 'Soltero'),
(1, 'Casado'),
(2, 'Viudo'),
(3, 'Divorciado');

-- --------------------------------------------------------

--
-- Table structure for table `postulante`
--

CREATE TABLE `postulante` (
  `postulante_rut` varchar(12) NOT NULL,
  `postulante_nombre` varchar(25) DEFAULT NULL,
  `postulante_apepa` varchar(25) NOT NULL,
  `postulante_apema` varchar(25) NOT NULL,
  `postulante_fecnac` date NOT NULL,
  `postulante_sexo` char(1) NOT NULL,
  `postulante_hijos` int(11) NOT NULL,
  `postulante_telefono` int(11) NOT NULL,
  `postulante_email` varchar(30) NOT NULL,
  `postulante_direccion` varchar(50) NOT NULL,
  `postulante_sueldo` int(11) NOT NULL,
  `postulante_enfermedad` char(1) NOT NULL,
  `educacione_educacione_id` int(11) NOT NULL,
  `estadocivil_estadocivil_id` int(11) NOT NULL,
  `comuna_comuna_id` int(11) NOT NULL,
  `venta_venta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_nombre` varchar(25) NOT NULL,
  `usuario_pass` varchar(25) NOT NULL,
  `usuario_roladm` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `venta_id` int(11) NOT NULL,
  `venta_tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venta`
--

INSERT INTO `venta` (`venta_id`, `venta_tipo`) VALUES
(0, 'Fija'),
(1, 'Variable'),
(2, 'Boleta de Honorarios');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`comuna_id`);

--
-- Indexes for table `educacione`
--
ALTER TABLE `educacione`
  ADD PRIMARY KEY (`educacione_id`);

--
-- Indexes for table `estadocivil`
--
ALTER TABLE `estadocivil`
  ADD PRIMARY KEY (`estadocivil_id`);

--
-- Indexes for table `postulante`
--
ALTER TABLE `postulante`
  ADD PRIMARY KEY (`postulante_rut`),
  ADD KEY `postulante_comuna_fk` (`comuna_comuna_id`),
  ADD KEY `postulante_educacione_fk` (`educacione_educacione_id`),
  ADD KEY `postulante_estadocivil_fk` (`estadocivil_estadocivil_id`),
  ADD KEY `postulante_venta_fk` (`venta_venta_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venta_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `postulante`
--
ALTER TABLE `postulante`
  ADD CONSTRAINT `postulante_comuna_fk` FOREIGN KEY (`comuna_comuna_id`) REFERENCES `comuna` (`comuna_id`),
  ADD CONSTRAINT `postulante_educacione_fk` FOREIGN KEY (`educacione_educacione_id`) REFERENCES `educacione` (`educacione_id`),
  ADD CONSTRAINT `postulante_estadocivil_fk` FOREIGN KEY (`estadocivil_estadocivil_id`) REFERENCES `estadocivil` (`estadocivil_id`),
  ADD CONSTRAINT `postulante_venta_fk` FOREIGN KEY (`venta_venta_id`) REFERENCES `venta` (`venta_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
