-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jun-2026 às 22:54
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `proodutos`
--
CREATE DATABASE IF NOT EXISTS `proodutos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proodutos`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`) VALUES
(1, 'Enlatados'),
(2, 'Laticínios'),
(3, 'Açougue'),
(4, 'Limpeza');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL,
  `produto` varchar(200) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `data` date NOT NULL,
  `ativo` bit(1) NOT NULL,
  `idcat` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idproduto`, `produto`, `preco`, `qtde`, `data`, `ativo`, `idcat`, `observacao`, `marca`) VALUES
(1, 'Picanha Peça', '49.99', 50, '2026-05-13', b'1', 3, 'Sem gordura', 'Friboi'),
(2, 'Ervilha', '4.50', 65, '2026-05-13', b'1', 1, 'Fresca', 'Quero'),
(3, 'Leite Integral', '6.99', 40, '2026-06-02', b'1', 2, 'Caixa 1L', 'Italac'),
(4, 'Queijo Mussarela', '34.90', 20, '2026-06-02', b'1', 2, 'Fatiado', 'Sadia'),
(5, 'Presunto', '29.90', 25, '2026-06-02', b'1', 2, 'Fatiado', 'Perdigão'),
(6, 'Milho Verde', '5.20', 60, '2026-06-02', b'1', 1, 'Lata 200g', 'Quero'),
(8, 'Detergente', '2.99', 80, '2026-06-02', b'1', 4, 'Neutro', 'Ypê'),
(9, 'Água Sanitária', '4.99', 50, '2026-06-02', b'1', 4, '1L', 'Qboa'),
(10, 'Alcatra', '42.90', 30, '2026-06-02', b'1', 3, 'Peça', 'Friboi'),
(11, 'Patinho Moído', '38.50', 25, '2026-06-02', b'1', 3, '500g', 'Friboi'),
(12, 'Creme de Leite', '3.99', 70, '2026-06-02', b'1', 2, 'Caixa 200g', 'Nestlé');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcat` (`idcat`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
