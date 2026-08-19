-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/08/2026 às 04:37
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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

--
-- Despejando dados para a tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `codcli`, `codquarto`) VALUES
(1, '2026-07-30', NULL, '08:30:18', NULL, 162.30, 1, 32),
(2, '2026-07-22', NULL, '22:34:18', NULL, 60.00, 2, 25),
(3, '2026-08-03', NULL, '11:15:25', NULL, 146.90, 3, 17),
(4, '2026-07-31', NULL, '17:09:55', NULL, 43.70, 4, 30),
(5, '2026-07-17', NULL, '19:47:12', NULL, 56.00, 5, 21);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`, `status`) VALUES
(17, '22', '2 Andar', 'Família - 2 camas', 1),
(18, '23', '2 Andar', 'Casal - 1 cama', 0),
(19, '24', '2 Andar', 'Suíte - 2 camas', 0),
(20, '25', '2 Andar', 'Família - 4 camas', 0),
(21, '26', '2 Andar', 'Casal - 2 camas', 1),
(22, '32', '3 Andar', 'Família - 2 camas', 0),
(23, '33', '3 Andar', 'Solteiro - 1 cama', 0),
(24, '34', '3 Andar', 'Suíte - 2 camas', 0),
(25, '35', '3 Andar', 'Família - 3 camas', 1),
(26, '36', '3 Andar', 'Casal - 2 camas', 0),
(27, '41', '4 Andar', 'Família - 2 camas', 0),
(28, '42', '4 Andar', 'Solteiro - 1 cama', 0),
(29, '43', '4 Andar', 'Casal - 2 camas', 0),
(30, '44', '4 Andar', 'Família - 4 camas', 1),
(31, '45', '4 Andar', 'Suíte - 3 camas', 0),
(32, '46', '4 Andar', 'Solteiro - 1 cama', 1);

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
(8, 'Academia', 0, 10.90, 'Lazer'),
(9, 'Massagem', 0, 25.00, 'Lazer'),
(10, 'Vodka', 0, 35.00, 'Bebidas'),
(11, 'Vinho Branco', 0, 56.70, 'Bebidas'),
(12, 'Sauna', 0, 15.80, 'Lazer');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicoshospedagem`
--

CREATE TABLE `servicoshospedagem` (
  `idhospedagem` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL,
  `dataservico` date DEFAULT NULL,
  `horaservico` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicoshospedagem`
--

INSERT INTO `servicoshospedagem` (`idhospedagem`, `idservico`, `dataservico`, `horaservico`) VALUES
(1, 2, '2026-08-03', '21:02:12'),
(1, 11, '2026-08-03', '14:30:12'),
(1, 12, '2026-08-07', '14:03:08'),
(1, 8, '2026-07-08', '09:04:46'),
(2, 9, '2026-07-14', '12:33:46'),
(2, 5, '2026-07-24', '15:29:09'),
(2, 4, '2026-07-25', '20:16:09'),
(2, 6, '2026-08-03', '13:10:43'),
(3, 7, '2026-08-04', '19:10:43'),
(3, 2, '2026-08-10', '20:30:21'),
(3, 9, '2026-08-06', '10:33:01'),
(3, 10, '2026-08-07', '15:45:01'),
(4, 8, '2026-08-02', '14:25:54'),
(4, 1, '2026-08-03', '21:56:54'),
(4, 12, '2026-08-03', '16:07:23'),
(4, 5, '2026-08-06', '11:31:39'),
(5, 7, '2026-07-23', '15:56:00'),
(5, 9, '2026-07-25', '09:17:00'),
(5, 6, '2026-07-29', '17:39:08'),
(5, 4, '2026-07-29', '19:46:22');

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
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
