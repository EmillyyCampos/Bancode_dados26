-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/07/2026 às 22:53
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(1, 'Eloisa Mendes', 'eloisamendes@email.com', '155.666.789-90'),
(2, 'Julia Aparecida', 'julia@email.com', '280.123.789.78'),
(3, 'Jessica Oliveira', 'jessicaoli@email.com', '678.334.816-23'),
(4, 'Luiz Gonzaga', 'luizgonzaga@email.com', '590.432.889-56'),
(5, 'Gabriel Picon', 'gabrielpicon@email.com', '256.112.764-74');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) DEFAULT NULL,
  `codcli` int(11) DEFAULT NULL,
  `codquarto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`) VALUES
(17, '22', '2 Andar', 'Família - 2 camas'),
(18, '23', '2 Andar', 'Casal - 1 cama'),
(19, '24', '2 Andar', 'Suíte - 2 camas'),
(20, '25', '2 Andar', 'Família - 4 camas'),
(21, '26', '2 Andar', 'Casal - 2 camas'),
(22, '32', '3 Andar', 'Família - 2 camas'),
(23, '33', '3 Andar', 'Solteiro - 1 cama'),
(24, '34', '3 Andar', 'Suíte - 2 camas'),
(25, '35', '3 Andar', 'Família - 3 camas'),
(26, '36', '3 Andar', 'Casal - 2 camas'),
(27, '41', '4 Andar', 'Família - 2 camas'),
(28, '42', '4 Andar', 'Solteiro - 1 cama'),
(29, '43', '4 Andar', 'Casal - 2 camas'),
(30, '44', '4 Andar', 'Família - 4 camas'),
(31, '45', '4 Andar', 'Suíte - 3 camas'),
(32, '46', '4 Andar', 'Solteiro - 1 cama');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `qtde`, `valor`, `tipo`) VALUES
(1, 'Coca Cola lata', 0, 5.00, 'Bebidas'),
(2, 'Jantar romântico', 0, 78.90, 'Lazer'),
(3, 'Cerveja Skol lata', 0, 8.00, 'Bebidas'),
(4, 'Chocolate Bauducco', 0, 17.00, 'Doces'),
(5, 'Energético', 0, 12.00, 'Bebidas'),
(6, 'Amendoim', 0, 6.00, 'Petiscos'),
(7, 'Cerveja Itaipava', 0, 8.00, 'Bebidas'),
(8, 'Bala fini', 0, 5.50, 'Doces'),
(9, 'Massagem', 0, 25.00, 'Lazer'),
(10, 'Vodka', 0, 35.00, 'Bebidas'),
(11, 'Vinho Branco', 0, 56.70, 'Bebidas'),
(12, 'Sauna', 0, 12.50, 'Lazer');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicoshospedagem`
--

CREATE TABLE `servicoshospedagem` (
  `idhospedagem` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL,
  `dataservico` date DEFAULT NULL,
  `horaservico` time DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codquarto` (`codquarto`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `andar` (`andar`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `tipo` (`tipo`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices de tabela `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD KEY `idhospedagem` (`idhospedagem`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcli`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquarto`) REFERENCES `quarto` (`codquarto`);

--
-- Restrições para tabelas `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD CONSTRAINT `servicoshospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicoshospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
