-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 09:41 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion`
--

-- --------------------------------------------------------

--
-- Table structure for table `aprendiz`
--

CREATE TABLE `aprendiz` (
  `id_aprendiz` int(11) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `condicion` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `area_responsable` varchar(45) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `usuarios_idusuario` int(11) DEFAULT NULL,
  `detalle_desercion_id_desercion` int(11) DEFAULT NULL,
  `detalle_desercion_encabezado_desercion_id_encaDeser` int(11) DEFAULT NULL,
  `categorias_idcategorias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `idcategorias` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `condicion` varchar(2) DEFAULT NULL,
  `usuarios_idusuario` int(11) DEFAULT NULL,
  `id_permiso` int(11) DEFAULT NULL,
  `instructor_idinstructor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_desercion`
--

CREATE TABLE `detalle_desercion` (
  `id_desercion` int(11) NOT NULL,
  `evaluaciones` decimal(10,0) DEFAULT NULL,
  `foros` decimal(10,0) DEFAULT NULL,
  `wikis` decimal(10,0) DEFAULT NULL,
  `blogs` decimal(10,0) DEFAULT NULL,
  `evidencias` decimal(10,0) DEFAULT NULL,
  `id_aprendiz` int(11) DEFAULT NULL,
  `detalle_desercioncol` varchar(45) DEFAULT NULL,
  `encabezado_desercion_id_encaDeser` int(11) DEFAULT NULL,
  `detalle_desercioncol1` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `encabezado_desercion`
--

CREATE TABLE `encabezado_desercion` (
  `id_encaDeser` int(11) NOT NULL,
  `regional` varchar(45) DEFAULT NULL,
  `centro` varchar(45) DEFAULT NULL,
  `fecha_cali` date DEFAULT NULL COMMENT 'Fecha en que se califica el juicio en sofiaplus\n',
  `nota` decimal(10,0) DEFAULT NULL,
  `area_responsable` varchar(45) DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `id_instructor` int(11) DEFAULT NULL,
  `id_deserciones` int(11) DEFAULT NULL,
  `id_programa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `idinstructor` int(11) NOT NULL,
  `fecxha_contrata` date DEFAULT NULL,
  `area_responsable` varchar(45) DEFAULT NULL,
  `modalidad` varchar(45) DEFAULT NULL,
  `actividad_desa` varchar(45) DEFAULT NULL,
  `fecha_e` date DEFAULT NULL,
  `fecha_CE` date DEFAULT NULL,
  `fase_cierre` date DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `condicion` varchar(45) DEFAULT NULL,
  `id_categorias` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `categorias_idcategorias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `programa_formacion`
--

CREATE TABLE `programa_formacion` (
  `idprograma_formacion` int(11) NOT NULL,
  `ficha` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `modalidad` varchar(45) DEFAULT NULL,
  `fase` varchar(45) DEFAULT NULL,
  `competencia` varchar(45) DEFAULT NULL,
  `resultado` varchar(45) DEFAULT NULL,
  `encabezado_desercion_id_encaDeser` int(11) DEFAULT NULL,
  `id_instructor` int(11) DEFAULT NULL,
  `instructor_idinstructor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `tipo` varchar(2) DEFAULT NULL,
  `documento` decimal(10,0) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `condicion` decimal(10,0) DEFAULT NULL,
  `id_usuario_permiso` int(11) DEFAULT NULL,
  `id_permiso` int(11) DEFAULT NULL,
  `Id_Aprendiz` int(11) DEFAULT NULL,
  `Id_Instructor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `id_usuario_permiso` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_permiso` int(11) DEFAULT NULL,
  `usuarios_idusuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`id_aprendiz`,`categorias_idcategorias`),
  ADD KEY `fk_aprendiz_detalle_desercion1_idx` (`detalle_desercion_id_desercion`,`detalle_desercion_encabezado_desercion_id_encaDeser`),
  ADD KEY `fk_aprendiz_categorias1_idx` (`categorias_idcategorias`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategorias`,`instructor_idinstructor`),
  ADD KEY `fk_categorias_instructor1_idx` (`instructor_idinstructor`);

--
-- Indexes for table `detalle_desercion`
--
ALTER TABLE `detalle_desercion`
  ADD PRIMARY KEY (`id_desercion`),
  ADD KEY `fk_detalle_desercion_encabezado_desercion1_idx` (`encabezado_desercion_id_encaDeser`);

--
-- Indexes for table `encabezado_desercion`
--
ALTER TABLE `encabezado_desercion`
  ADD PRIMARY KEY (`id_encaDeser`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`idinstructor`);

--
-- Indexes for table `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`,`categorias_idcategorias`),
  ADD KEY `fk_permiso_categorias1_idx` (`categorias_idcategorias`);

--
-- Indexes for table `programa_formacion`
--
ALTER TABLE `programa_formacion`
  ADD PRIMARY KEY (`idprograma_formacion`,`instructor_idinstructor`),
  ADD KEY `fk_programa_formacion_encabezado_desercion1_idx` (`encabezado_desercion_id_encaDeser`),
  ADD KEY `fk_programa_formacion_instructor1_idx` (`instructor_idinstructor`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indexes for table `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`id_usuario_permiso`),
  ADD KEY `fk_usuario_permiso_usuarios1_idx` (`usuarios_idusuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aprendiz`
--
ALTER TABLE `aprendiz`
  MODIFY `id_aprendiz` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategorias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalle_desercion`
--
ALTER TABLE `detalle_desercion`
  MODIFY `id_desercion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `encabezado_desercion`
--
ALTER TABLE `encabezado_desercion`
  MODIFY `id_encaDeser` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `idinstructor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programa_formacion`
--
ALTER TABLE `programa_formacion`
  MODIFY `idprograma_formacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `id_usuario_permiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD CONSTRAINT `fk_aprendiz_categorias1` FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aprendiz_detalle_desercion1` FOREIGN KEY (`detalle_desercion_id_desercion`) REFERENCES `detalle_desercion` (`id_desercion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categorias_instructor1` FOREIGN KEY (`instructor_idinstructor`) REFERENCES `instructor` (`idinstructor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detalle_desercion`
--
ALTER TABLE `detalle_desercion`
  ADD CONSTRAINT `fk_detalle_desercion_encabezado_desercion1` FOREIGN KEY (`encabezado_desercion_id_encaDeser`) REFERENCES `encabezado_desercion` (`id_encaDeser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `permiso`
--
ALTER TABLE `permiso`
  ADD CONSTRAINT `fk_permiso_categorias1` FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `programa_formacion`
--
ALTER TABLE `programa_formacion`
  ADD CONSTRAINT `fk_programa_formacion_encabezado_desercion1` FOREIGN KEY (`encabezado_desercion_id_encaDeser`) REFERENCES `encabezado_desercion` (`id_encaDeser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_programa_formacion_instructor1` FOREIGN KEY (`instructor_idinstructor`) REFERENCES `instructor` (`idinstructor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_permiso_has_usuarios_permiso1` FOREIGN KEY (`id_usuario_permiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_permiso_usuarios1` FOREIGN KEY (`usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
