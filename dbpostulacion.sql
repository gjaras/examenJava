CREATE DATABASE postulacion;
USE postulacion;

CREATE TABLE `comuna` (
  `comuna_id` int(11) NOT NULL,
  `comuna_nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `educacion` (
  `educacion_id` int(11) NOT NULL,
  `educacion_tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `educacion` (`educacion_id`, `educacion_tipo`) VALUES
(0, 'Profesional'),
(1, 'Tecnico'),
(2, 'Media'),
(3, 'Basica'),
(4, 'No Posee');

CREATE TABLE `estadocivil` (
  `estadocivil_id` int(11) NOT NULL,
  `estadocivil_tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `estadocivil` (`estadocivil_id`, `estadocivil_tipo`) VALUES
(0, 'Soltero'),
(1, 'Casado'),
(2, 'Viudo'),
(3, 'Divorciado');

CREATE TABLE `postulante` (
  `postulante_rut` varchar(12) NOT NULL,
  `postulante_dv`  char(1) NOT NULL,
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
  `educacion_educacion_id` int(11) NOT NULL,
  `estadocivil_estadocivil_id` int(11) NOT NULL,
  `comuna_comuna_id` int(11) NOT NULL,
  `renta_renta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_nombre` varchar(25) NOT NULL,
  `usuario_pass` varchar(25) NOT NULL,
  `usuario_roladm` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `renta` (
  `renta_id` int(11) NOT NULL,
  `renta_tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `renta` (`renta_id`, `renta_tipo`) VALUES
(0, 'Fija'),
(1, 'Variable'),
(2, 'Boleta de Honorarios');

ALTER TABLE `comuna`
  ADD PRIMARY KEY (`comuna_id`);

ALTER TABLE `educacion`
  ADD PRIMARY KEY (`educacion_id`);

ALTER TABLE `estadocivil`
  ADD PRIMARY KEY (`estadocivil_id`);

ALTER TABLE `postulante`
  ADD PRIMARY KEY (`postulante_rut`);

ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`);

ALTER TABLE `renta`
  ADD PRIMARY KEY (`renta_id`);

ALTER TABLE `postulante`
  ADD CONSTRAINT `postulante_comuna_fk` FOREIGN KEY (`comuna_comuna_id`) REFERENCES `comuna` (`comuna_id`),
  ADD CONSTRAINT `postulante_educacion_fk` FOREIGN KEY (`educacion_educacion_id`) REFERENCES `educacion` (`educacion_id`),
  ADD CONSTRAINT `postulante_estadocivil_fk` FOREIGN KEY (`estadocivil_estadocivil_id`) REFERENCES `estadocivil` (`estadocivil_id`),
  ADD CONSTRAINT `postulante_renta_fk` FOREIGN KEY (`renta_renta_id`) REFERENCES `renta` (`renta_id`);