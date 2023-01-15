CREATE DATABASE  IF NOT EXISTS `mecanica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mecanica`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mecanica
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `id_carro` int NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` date NOT NULL,
  `montadora` varchar(50) NOT NULL,
  `valor_carro` float NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_carro`),
  UNIQUE KEY `id_carro` (`id_carro`),
  UNIQUE KEY `montadora` (`montadora`),
  KEY `fk_id_cliente` (`id_cliente`),
  CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nome_cliente` varchar(125) NOT NULL,
  `endereco` varchar(70) NOT NULL,
  `email` varchar(80) NOT NULL,
  `telefone` char(12) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente` (`id_cliente`),
  UNIQUE KEY `nome_cliente` (`nome_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_solicita_os`
--

DROP TABLE IF EXISTS `cliente_solicita_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_solicita_os` (
  `id_ordemServico` int NOT NULL,
  `id_cliente` int NOT NULL,
  KEY `fk_id_ordem_servico_solicitada` (`id_ordemServico`),
  KEY `fk_id_cliente_solicitante` (`id_cliente`),
  CONSTRAINT `fk_id_cliente_solicitante` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_id_ordem_servico_solicitada` FOREIGN KEY (`id_ordemServico`) REFERENCES `ordem_de_servico` (`id_OS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_solicita_os`
--

LOCK TABLES `cliente_solicita_os` WRITE;
/*!40000 ALTER TABLE `cliente_solicita_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_solicita_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL,
  `localidade` varchar(80) NOT NULL,
  `disponibilidade` int NOT NULL,
  PRIMARY KEY (`idEstoque`),
  UNIQUE KEY `idEstoque` (`idEstoque`),
  UNIQUE KEY `localidade` (`localidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_contem_pecas`
--

DROP TABLE IF EXISTS `estoque_contem_pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque_contem_pecas` (
  `id_estoque` int NOT NULL,
  `id_peca` int NOT NULL,
  KEY `fk_id_do_estoque` (`id_estoque`),
  KEY `fk_id_da_peca` (`id_peca`),
  CONSTRAINT `fk_id_da_peca` FOREIGN KEY (`id_peca`) REFERENCES `pecas` (`id_peca`),
  CONSTRAINT `fk_id_do_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`idEstoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_contem_pecas`
--

LOCK TABLES `estoque_contem_pecas` WRITE;
/*!40000 ALTER TABLE `estoque_contem_pecas` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque_contem_pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `id_mecanico` int NOT NULL,
  `nome_mecanico` varchar(125) NOT NULL,
  `especialidade` varchar(70) NOT NULL,
  PRIMARY KEY (`id_mecanico`),
  UNIQUE KEY `id_mecanico` (`id_mecanico`),
  UNIQUE KEY `nome_mecanico` (`nome_mecanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico_analisa_carro`
--

DROP TABLE IF EXISTS `mecanico_analisa_carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico_analisa_carro` (
  `id_mecanico` int NOT NULL,
  `idcarro` int NOT NULL,
  `carro_id_cliente` int NOT NULL,
  KEY `fk_id_mecanico_analista` (`id_mecanico`),
  KEY `fk_id_carro_analisado` (`idcarro`),
  KEY `fk_id_carro_id_cliente` (`carro_id_cliente`),
  CONSTRAINT `fk_id_carro_analisado` FOREIGN KEY (`idcarro`) REFERENCES `carro` (`id_carro`),
  CONSTRAINT `fk_id_carro_id_cliente` FOREIGN KEY (`carro_id_cliente`) REFERENCES `carro` (`id_cliente`),
  CONSTRAINT `fk_id_mecanico_analista` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico_analisa_carro`
--

LOCK TABLES `mecanico_analisa_carro` WRITE;
/*!40000 ALTER TABLE `mecanico_analisa_carro` DISABLE KEYS */;
/*!40000 ALTER TABLE `mecanico_analisa_carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico_executa_os`
--

DROP TABLE IF EXISTS `mecanico_executa_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico_executa_os` (
  `id_ordemOS` int NOT NULL,
  `id_mecanico` int NOT NULL,
  KEY `fk_id_mecanico_que_executa` (`id_mecanico`),
  KEY `fk_id_ordem_executada` (`id_ordemOS`),
  CONSTRAINT `fk_id_mecanico_que_executa` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`),
  CONSTRAINT `fk_id_ordem_executada` FOREIGN KEY (`id_ordemOS`) REFERENCES `ordem_de_servico` (`id_OS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico_executa_os`
--

LOCK TABLES `mecanico_executa_os` WRITE;
/*!40000 ALTER TABLE `mecanico_executa_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `mecanico_executa_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico_preenche_os`
--

DROP TABLE IF EXISTS `mecanico_preenche_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico_preenche_os` (
  `id_mecanico` int NOT NULL,
  `id_ordem` int NOT NULL,
  KEY `fk_id_mecanico_que_preenche` (`id_mecanico`),
  KEY `fk_id_ordem_preenchida` (`id_ordem`),
  CONSTRAINT `fk_id_mecanico_que_preenche` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`),
  CONSTRAINT `fk_id_ordem_preenchida` FOREIGN KEY (`id_ordem`) REFERENCES `ordem_de_servico` (`id_OS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico_preenche_os`
--

LOCK TABLES `mecanico_preenche_os` WRITE;
/*!40000 ALTER TABLE `mecanico_preenche_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `mecanico_preenche_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_de_servico`
--

DROP TABLE IF EXISTS `ordem_de_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_de_servico` (
  `id_OS` int NOT NULL,
  `data_emissao` date NOT NULL,
  `valor_pecas` float NOT NULL,
  `status_os` enum('Concluido','Em execucao','Em análise') DEFAULT NULL,
  `data_conclusao` date NOT NULL,
  `valor_mao_obra` float NOT NULL,
  `valor_total` float NOT NULL,
  `descricao` varchar(500) NOT NULL,
  PRIMARY KEY (`id_OS`),
  UNIQUE KEY `id_OS` (`id_OS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_de_servico`
--

LOCK TABLES `ordem_de_servico` WRITE;
/*!40000 ALTER TABLE `ordem_de_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_de_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_tem_lista_de_servicos`
--

DROP TABLE IF EXISTS `os_tem_lista_de_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os_tem_lista_de_servicos` (
  `id_ordem_servico` int NOT NULL,
  `id_servico` int NOT NULL,
  KEY `fk_id_ordem_de_servico_servicos` (`id_ordem_servico`),
  KEY `fk_id_servico_solicitado` (`id_servico`),
  CONSTRAINT `fk_id_ordem_de_servico_servicos` FOREIGN KEY (`id_ordem_servico`) REFERENCES `ordem_de_servico` (`id_OS`),
  CONSTRAINT `fk_id_servico_solicitado` FOREIGN KEY (`id_servico`) REFERENCES `servico_prestado` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_tem_lista_de_servicos`
--

LOCK TABLES `os_tem_lista_de_servicos` WRITE;
/*!40000 ALTER TABLE `os_tem_lista_de_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_tem_lista_de_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `id_peca` int NOT NULL,
  `nome_peca` varchar(70) NOT NULL,
  `marca` varchar(60) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`id_peca`),
  UNIQUE KEY `id_peca` (`id_peca`),
  UNIQUE KEY `nome_peca` (`nome_peca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico_prestado`
--

DROP TABLE IF EXISTS `servico_prestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico_prestado` (
  `idServico` int NOT NULL,
  `Nome` varchar(80) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`idServico`),
  UNIQUE KEY `idServico` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico_prestado`
--

LOCK TABLES `servico_prestado` WRITE;
/*!40000 ALTER TABLE `servico_prestado` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico_prestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos_mecanico`
--

DROP TABLE IF EXISTS `servicos_mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos_mecanico` (
  `id_servico` int NOT NULL,
  `id_mecanico` int NOT NULL,
  KEY `fk_id_servico_prestado` (`id_servico`),
  KEY `fk_id_mecanico_prestador` (`id_mecanico`),
  CONSTRAINT `fk_id_mecanico_prestador` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`),
  CONSTRAINT `fk_id_servico_prestado` FOREIGN KEY (`id_servico`) REFERENCES `servico_prestado` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos_mecanico`
--

LOCK TABLES `servicos_mecanico` WRITE;
/*!40000 ALTER TABLE `servicos_mecanico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicos_mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mecanica'
--

--
-- Dumping routines for database 'mecanica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-15  8:25:37
