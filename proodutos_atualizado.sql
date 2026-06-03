-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: proodutos
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Enlatados'),(2,'Laticínios'),(3,'Açougue'),(4,'Limpeza');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `produto` varchar(200) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `data` date NOT NULL,
  `ativo` bit(1) NOT NULL,
  `idcat` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idproduto`),
  KEY `idcat` (`idcat`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Picanha Peça',49.99,50,'2026-05-13','',3,'Sem gordura','Friboi'),(2,'Ervilha',4.50,65,'2026-05-13','',1,'Fresca','Quero'),(3,'Leite Integral',6.99,40,'2026-06-02','',2,'Caixa 1L','Italac'),(4,'Queijo Mussarela',34.90,20,'2026-06-02','',2,'Fatiado','Sadia'),(5,'Presunto',29.90,25,'2026-06-02','',2,'Fatiado','Perdigão'),(6,'Milho Verde',5.20,60,'2026-06-02','',1,'Lata 200g','Quero'),(7,'Atum',12.50,35,'2026-06-02','',1,'Lata','Gomes da Costa'),(8,'Detergente',2.99,80,'2026-06-02','',4,'Neutro','Ypê'),(9,'Água Sanitária',4.99,50,'2026-06-02','',4,'1L','Qboa'),(10,'Alcatra',42.90,30,'2026-06-02','',3,'Peça','Friboi'),(11,'Patinho Moído',38.50,25,'2026-06-02','',3,'500g','Friboi'),(12,'Creme de Leite',3.99,70,'2026-06-02','',2,'Caixa 200g','Nestlé');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prooduto`
--

DROP TABLE IF EXISTS `prooduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prooduto` (
  `idprooduto` int(11) NOT NULL AUTO_INCREMENT,
  `prooduto` varchar(200) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `datacadastro` date NOT NULL,
  `ativo` bit(1) NOT NULL,
  `idcat` int(11) DEFAULT NULL,
  PRIMARY KEY (`idprooduto`),
  KEY `idcat` (`idcat`),
  CONSTRAINT `prooduto_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prooduto`
--

LOCK TABLES `prooduto` WRITE;
/*!40000 ALTER TABLE `prooduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `prooduto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-03  1:00:42
