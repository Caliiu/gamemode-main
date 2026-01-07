-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/01/2026 às 15:58
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
-- Banco de dados: `pnrp`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividadesuspeita`
--

CREATE TABLE `atividadesuspeita` (
  `ID` int(11) NOT NULL,
  `Conta` int(11) NOT NULL DEFAULT -1,
  `Título` varchar(128) NOT NULL DEFAULT '',
  `Texto` varchar(1024) NOT NULL DEFAULT '',
  `Data` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banimentos`
--

CREATE TABLE `banimentos` (
  `Nome` varchar(24) NOT NULL,
  `IP` varchar(16) NOT NULL,
  `Admin` varchar(24) NOT NULL,
  `AdminID` int(11) NOT NULL,
  `Tempo` int(11) DEFAULT NULL,
  `Data` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bombas`
--

CREATE TABLE `bombas` (
  `ID` int(11) NOT NULL,
  `Empresa` int(11) NOT NULL DEFAULT -1,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Rot` float NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `casas`
--

CREATE TABLE `casas` (
  `ID` int(11) NOT NULL,
  `Dono` int(11) NOT NULL DEFAULT 0,
  `Preço` int(11) NOT NULL DEFAULT 0,
  `PreçoAluguel` int(11) NOT NULL DEFAULT 0,
  `Rádio` varchar(255) NOT NULL DEFAULT '',
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `InsidePosX` float NOT NULL DEFAULT 0,
  `InsidePosY` float NOT NULL DEFAULT 0,
  `InsidePosZ` float NOT NULL DEFAULT 0,
  `InsideAngle` float NOT NULL DEFAULT 0,
  `InsideInterior` int(11) NOT NULL DEFAULT 0,
  `GaragePosX` float NOT NULL DEFAULT 0,
  `GaragePosY` float NOT NULL DEFAULT 0,
  `GaragePosZ` float NOT NULL DEFAULT 0,
  `Dinheiro` int(11) NOT NULL DEFAULT 0,
  `Trancada` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `closedbeta`
--

CREATE TABLE `closedbeta` (
  `Nome` varchar(24) NOT NULL,
  `Admin` varchar(24) NOT NULL,
  `Data` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas`
--

CREATE TABLE `contas` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(24) NOT NULL,
  `Senha` varchar(64) NOT NULL,
  `IP` varchar(16) NOT NULL,
  `Serial` varchar(40) NOT NULL,
  `Mobile` tinyint(4) NOT NULL DEFAULT 0,
  `Cidade` varchar(64) NOT NULL DEFAULT '',
  `Estado` varchar(64) NOT NULL DEFAULT '',
  `País` varchar(64) NOT NULL DEFAULT '',
  `VPN` tinyint(4) NOT NULL DEFAULT 0,
  `Admin` int(11) NOT NULL DEFAULT 0,
  `AdminHide` int(11) NOT NULL DEFAULT 0,
  `AdminViewChats` int(11) NOT NULL DEFAULT 0,
  `AdminAvaliations` int(11) NOT NULL DEFAULT 0,
  `AdminStars` int(11) NOT NULL DEFAULT 0,
  `AdminTeams` int(11) NOT NULL DEFAULT 0,
  `Premium` int(11) NOT NULL DEFAULT 0,
  `PremiumExpires` int(11) NOT NULL DEFAULT 0,
  `Registro` datetime NOT NULL DEFAULT current_timestamp(),
  `Login` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contas`
--

INSERT INTO `contas` (`ID`, `Nome`, `Senha`, `IP`, `Serial`, `Mobile`, `Cidade`, `Estado`, `País`, `VPN`, `Admin`, `AdminHide`, `AdminViewChats`, `AdminAvaliations`, `AdminStars`, `AdminTeams`, `Premium`, `PremiumExpires`, `Registro`, `Login`) VALUES
(1, 'Caliiu', 'b49e0a517dec48e340a3914899a9c8ab', '127.0.0.1', 'D4990AC484E99EAD8C4804F88DDD9CE9EC4D8DFF', 0, '', '', '', 0, 6, 0, 0, 0, 0, 0, 0, 0, '2026-01-03 23:52:36', '2026-01-06 19:51:42');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresaitens`
--

CREATE TABLE `empresaitens` (
  `Tipo` int(11) NOT NULL,
  `Item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `empresaitens`
--

INSERT INTO `empresaitens` (`Tipo`, `Item`) VALUES
(0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresapreços`
--

CREATE TABLE `empresapreços` (
  `Empresa` int(11) NOT NULL,
  `Item` int(11) NOT NULL,
  `Preço` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresas`
--

CREATE TABLE `empresas` (
  `ID` int(11) NOT NULL,
  `Dono` int(11) NOT NULL DEFAULT 0,
  `Nome` varchar(32) NOT NULL DEFAULT 'N/A',
  `Mensagem` varchar(128) NOT NULL DEFAULT '',
  `Rádio` varchar(255) NOT NULL DEFAULT '',
  `TaxaEntrada` int(11) NOT NULL DEFAULT 0,
  `Preço` int(11) NOT NULL DEFAULT 0,
  `Tipo` int(11) NOT NULL DEFAULT 0,
  `Cofre` int(11) NOT NULL DEFAULT 0,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `InsidePosX` float NOT NULL DEFAULT 0,
  `InsidePosY` float NOT NULL DEFAULT 0,
  `InsidePosZ` float NOT NULL DEFAULT 0,
  `InsideAngle` float NOT NULL DEFAULT 0,
  `InsideInterior` int(11) NOT NULL DEFAULT 0,
  `Aberta` int(11) NOT NULL DEFAULT 0,
  `Trancada` int(11) NOT NULL DEFAULT 0,
  `Produtos` int(11) NOT NULL DEFAULT 0,
  `LimiteProdutos` int(11) NOT NULL DEFAULT 0,
  `PedidoQuantidade` int(11) NOT NULL DEFAULT 0,
  `PedidoCarga` int(11) NOT NULL DEFAULT 0,
  `PedidoPreço` int(11) NOT NULL DEFAULT 0,
  `PreçoCombustível` int(11) NOT NULL DEFAULT 0,
  `Combustível` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `empresas`
--

INSERT INTO `empresas` (`ID`, `Dono`, `Nome`, `Mensagem`, `Rádio`, `TaxaEntrada`, `Preço`, `Tipo`, `Cofre`, `PosX`, `PosY`, `PosZ`, `World`, `Interior`, `InsidePosX`, `InsidePosY`, `InsidePosZ`, `InsideAngle`, `InsideInterior`, `Aberta`, `Trancada`, `Produtos`, `LimiteProdutos`, `PedidoQuantidade`, `PedidoCarga`, `PedidoPreço`, `PreçoCombustível`, `Combustível`) VALUES
(1, 0, '24/7', '', '', 0, 350000, 0, 0, 1833.78, -1842.61, 13.5781, 0, 0, 6.07669, -31.7622, 1003.55, 3.10879, 10, 0, 0, 100, 500, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `entradas`
--

CREATE TABLE `entradas` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(32) NOT NULL,
  `Ícone` int(11) NOT NULL DEFAULT 1239,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `InsidePosX` float NOT NULL DEFAULT 0,
  `InsidePosY` float NOT NULL DEFAULT 0,
  `InsidePosZ` float NOT NULL DEFAULT 0,
  `InsidePosA` float NOT NULL DEFAULT 0,
  `InsideWorld` int(11) NOT NULL DEFAULT 0,
  `InsideInterior` int(11) NOT NULL DEFAULT 0,
  `Criado` datetime NOT NULL DEFAULT current_timestamp(),
  `Criador` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `entradas`
--

INSERT INTO `entradas` (`ID`, `Nome`, `Ícone`, `PosX`, `PosY`, `PosZ`, `Interior`, `World`, `InsidePosX`, `InsidePosY`, `InsidePosZ`, `InsidePosA`, `InsideWorld`, `InsideInterior`, `Criado`, `Criador`) VALUES
(1, 'ROTA', 1239, 1282.55, -1341.69, 13.6295, 0, 0, 1268.64, -996.992, 6645.73, 145.845, 10000, 1, '2026-01-04 00:20:16', 'Caliiu'),
(2, '1º Departamento Policial', 1239, 1555.5, -1675.42, 16.1953, 0, 0, 350.829, 1834.47, 2241.58, 92.4091, 10001, 1, '2026-01-04 12:32:59', 'Caliiu'),
(3, 'Sala São Paulo', 1239, 1482.62, -1772.31, 18.7958, 0, 0, -1052.77, -1304.67, 3116.52, 277.348, 10002, 1, '2026-01-04 12:33:32', 'Caliiu'),
(4, 'Agencia de Empregos', 1239, 1411.51, -1699.6, 13.5395, 0, 0, 617.611, -26.0773, 1000.99, 2.38318, 10003, 2, '2026-01-04 12:33:54', 'Caliiu'),
(5, 'Policia Militar de São Paulo', 1239, 874.889, -1197.35, 16.9846, 0, 0, 0, 0, 0, 0, 10004, 0, '2026-01-04 12:34:34', 'Caliiu'),
(6, 'Policia Federal', 1239, 605.008, -1643.34, 16.4507, 0, 0, 1402.98, -27.9924, 1000.92, 359.348, 10005, 6, '2026-01-04 12:35:17', 'Caliiu'),
(7, 'Prefeitura de São Paulo', 1239, 1780.8, -1805.13, 13.5234, 0, 0, -501.035, 286.104, 2001.09, 1.03136, 10006, 1, '2026-01-06 12:52:31', 'Caliiu'),
(8, 'Centro de Treinamento Tático', 1239, 860.973, -1245.38, 14.7659, 0, 0, 0, 0, 0, 0, 10007, 0, '2026-01-06 12:54:46', 'Caliiu'),
(9, 'Grupamento de Bombeiros', 1239, 1754.39, -1460.98, 13.5469, 0, 0, 0, 0, 0, 0, 10008, 0, '2026-01-06 17:53:24', 'Caliiu');

-- --------------------------------------------------------

--
-- Estrutura para tabela `facçãoarmário`
--

CREATE TABLE `facçãoarmário` (
  `ID` int(11) NOT NULL,
  `Facção` int(11) NOT NULL DEFAULT 0,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Angle` float NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `Item1` int(11) DEFAULT 0,
  `Amount1` int(11) DEFAULT 0,
  `Item2` int(11) DEFAULT 0,
  `Amount2` int(11) DEFAULT 0,
  `Item3` int(11) DEFAULT 0,
  `Amount3` int(11) DEFAULT 0,
  `Item4` int(11) DEFAULT 0,
  `Amount4` int(11) DEFAULT 0,
  `Item5` int(11) DEFAULT 0,
  `Amount5` int(11) DEFAULT 0,
  `Item6` int(11) DEFAULT 0,
  `Amount6` int(11) DEFAULT 0,
  `Item7` int(11) DEFAULT 0,
  `Amount7` int(11) DEFAULT 0,
  `Item8` int(11) DEFAULT 0,
  `Amount8` int(11) DEFAULT 0,
  `Item9` int(11) DEFAULT 0,
  `Amount9` int(11) DEFAULT 0,
  `Item10` int(11) DEFAULT 0,
  `Amount10` int(11) DEFAULT 0,
  `Item11` int(11) DEFAULT 0,
  `Amount11` int(11) DEFAULT 0,
  `Item12` int(11) DEFAULT 0,
  `Amount12` int(11) DEFAULT 0,
  `Item13` int(11) DEFAULT 0,
  `Amount13` int(11) DEFAULT 0,
  `Item14` int(11) DEFAULT 0,
  `Amount14` int(11) DEFAULT 0,
  `Item15` int(11) DEFAULT 0,
  `Amount15` int(11) DEFAULT 0,
  `Item16` int(11) DEFAULT 0,
  `Amount16` int(11) DEFAULT 0,
  `Item17` int(11) DEFAULT 0,
  `Amount17` int(11) DEFAULT 0,
  `Item18` int(11) DEFAULT 0,
  `Amount18` int(11) DEFAULT 0,
  `Item19` int(11) DEFAULT 0,
  `Amount19` int(11) DEFAULT 0,
  `Item20` int(11) DEFAULT 0,
  `Amount20` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `facçãoarmário`
--

INSERT INTO `facçãoarmário` (`ID`, `Facção`, `PosX`, `PosY`, `PosZ`, `Angle`, `World`, `Interior`, `Item1`, `Amount1`, `Item2`, `Amount2`, `Item3`, `Amount3`, `Item4`, `Amount4`, `Item5`, `Amount5`, `Item6`, `Amount6`, `Item7`, `Amount7`, `Item8`, `Amount8`, `Item9`, `Amount9`, `Item10`, `Amount10`, `Item11`, `Amount11`, `Item12`, `Amount12`, `Item13`, `Amount13`, `Item14`, `Amount14`, `Item15`, `Amount15`, `Item16`, `Amount16`, `Item17`, `Amount17`, `Item18`, `Amount18`, `Item19`, `Amount19`, `Item20`, `Amount20`) VALUES
(1, 4, 1295.64, -1007.29, 6645.73, 0, 10000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `facçãoarsenal`
--

CREATE TABLE `facçãoarsenal` (
  `ID` int(11) NOT NULL,
  `Facção` int(11) NOT NULL DEFAULT 0,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Angle` float NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `facçãoarsenal`
--

INSERT INTO `facçãoarsenal` (`ID`, `Facção`, `PosX`, `PosY`, `PosZ`, `Angle`, `World`, `Interior`) VALUES
(1, 4, 0, 0, 0, 0, 0, 0),
(2, 4, 0, 0, 0, 0, 0, 0),
(4, 4, 0, 0, 0, 0, 0, 0),
(6, 4, 0, 0, 0, 0, 0, 0),
(7, 4, 1299.89, -1007.43, 6645.73, 0, 10000, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `facçãospawn`
--

CREATE TABLE `facçãospawn` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(32) NOT NULL DEFAULT 'N/A',
  `Facção` int(11) NOT NULL DEFAULT 0,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Angle` float NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `facções`
--

CREATE TABLE `facções` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(32) NOT NULL DEFAULT 'N/A',
  `Abreviação` varchar(12) NOT NULL DEFAULT 'N/A',
  `CargoPadrão` varchar(32) NOT NULL DEFAULT 'Membro',
  `Cor` int(11) NOT NULL DEFAULT -1,
  `Tipo` int(11) NOT NULL DEFAULT 0,
  `Cofre` int(11) NOT NULL DEFAULT 0,
  `MOTD` varchar(128) NOT NULL DEFAULT '',
  `BloquearChat` int(11) NOT NULL DEFAULT 0,
  `Tier` int(11) NOT NULL DEFAULT -1,
  `TierAtivo` tinyint(4) NOT NULL DEFAULT 0,
  `Abastecimento` int(11) NOT NULL DEFAULT 0,
  `Saldo` int(11) NOT NULL DEFAULT 0,
  `Casa` int(11) NOT NULL DEFAULT 0,
  `Pontos` int(11) NOT NULL DEFAULT 0,
  `Skin1` int(11) NOT NULL DEFAULT 0,
  `Skin2` int(11) NOT NULL DEFAULT 0,
  `Skin3` int(11) NOT NULL DEFAULT 0,
  `Skin4` int(11) NOT NULL DEFAULT 0,
  `Skin5` int(11) NOT NULL DEFAULT 0,
  `Skin6` int(11) NOT NULL DEFAULT 0,
  `Skin7` int(11) NOT NULL DEFAULT 0,
  `Skin8` int(11) NOT NULL DEFAULT 0,
  `Weapon1` int(11) NOT NULL DEFAULT 0,
  `Ammo1` int(11) NOT NULL DEFAULT 0,
  `Weapon2` int(11) NOT NULL DEFAULT 0,
  `Ammo2` int(11) NOT NULL DEFAULT 0,
  `Weapon3` int(11) NOT NULL DEFAULT 0,
  `Ammo3` int(11) NOT NULL DEFAULT 0,
  `Weapon4` int(11) NOT NULL DEFAULT 0,
  `Ammo4` int(11) NOT NULL DEFAULT 0,
  `Weapon5` int(11) NOT NULL DEFAULT 0,
  `Ammo5` int(11) NOT NULL DEFAULT 0,
  `Weapon6` int(11) NOT NULL DEFAULT 0,
  `Ammo6` int(11) NOT NULL DEFAULT 0,
  `Weapon7` int(11) NOT NULL DEFAULT 0,
  `Ammo7` int(11) NOT NULL DEFAULT 0,
  `Weapon8` int(11) NOT NULL DEFAULT 0,
  `Ammo8` int(11) NOT NULL DEFAULT 0,
  `Weapon9` int(11) NOT NULL DEFAULT 0,
  `Ammo9` int(11) NOT NULL DEFAULT 0,
  `Weapon10` int(11) NOT NULL DEFAULT 0,
  `Ammo10` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `facções`
--

INSERT INTO `facções` (`ID`, `Nome`, `Abreviação`, `CargoPadrão`, `Cor`, `Tipo`, `Cofre`, `MOTD`, `BloquearChat`, `Tier`, `TierAtivo`, `Abastecimento`, `Saldo`, `Casa`, `Pontos`, `Skin1`, `Skin2`, `Skin3`, `Skin4`, `Skin5`, `Skin6`, `Skin7`, `Skin8`, `Weapon1`, `Ammo1`, `Weapon2`, `Ammo2`, `Weapon3`, `Ammo3`, `Weapon4`, `Ammo4`, `Weapon5`, `Ammo5`, `Weapon6`, `Ammo6`, `Weapon7`, `Ammo7`, `Weapon8`, `Ammo8`, `Weapon9`, `Ammo9`, `Weapon10`, `Ammo10`) VALUES
(1, 'Governo Federal', 'N/A', 'Membro', -1, 0, 0, '', 0, -1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Governo Estadual', 'N/A', 'Membro', -1, 0, 0, '', 0, -1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Prefeitura Municipal', 'N/A', 'Membro', -1, 0, 0, '', 0, -1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'ROTA', 'N/A', 'Membro', -1, 1, 0, '', 0, -1, 0, 0, 0, -1, 0, 266, 0, 0, 0, 0, 0, 0, 0, 24, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Policia Militar de São Paulo', 'N/A', 'Membro', -1, 0, 0, '', 0, -1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `garagens`
--

CREATE TABLE `garagens` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL DEFAULT -1,
  `Type` int(11) NOT NULL DEFAULT 0,
  `Icone` int(11) DEFAULT NULL,
  `PosX` float DEFAULT NULL,
  `PosY` float DEFAULT NULL,
  `PosZ` float DEFAULT NULL,
  `Interior` int(11) DEFAULT NULL,
  `World` int(11) DEFAULT NULL,
  `SpawnPosX` float DEFAULT NULL,
  `SpawnPosY` float DEFAULT NULL,
  `SpawnPosZ` float DEFAULT NULL,
  `SpawnPosA` float DEFAULT NULL,
  `TaxPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `indústriaestoque`
--

CREATE TABLE `indústriaestoque` (
  `ID` int(11) NOT NULL,
  `Indústria` int(11) NOT NULL DEFAULT 0,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Estoque` int(11) NOT NULL DEFAULT 0,
  `TamanhoEstoque` int(11) NOT NULL DEFAULT 0,
  `Consumo` int(11) NOT NULL DEFAULT 0,
  `Produto` int(11) NOT NULL DEFAULT 0,
  `Preço` int(11) NOT NULL DEFAULT 0,
  `Venda` int(11) NOT NULL DEFAULT 0,
  `Criado` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `indústrias`
--

CREATE TABLE `indústrias` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(32) NOT NULL,
  `Tipo` int(11) NOT NULL DEFAULT 0,
  `Fechado` int(11) NOT NULL DEFAULT 0,
  `Criado` datetime NOT NULL DEFAULT current_timestamp(),
  `Criador` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `interações`
--

CREATE TABLE `interações` (
  `ID` int(11) NOT NULL,
  `Tipo` int(11) NOT NULL DEFAULT 0,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Criado` datetime NOT NULL DEFAULT current_timestamp(),
  `Criador` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `interações`
--

INSERT INTO `interações` (`ID`, `Tipo`, `PosX`, `PosY`, `PosZ`, `Interior`, `World`, `Criado`, `Criador`) VALUES
(1, 1, 617.825, -3.83549, 1000.99, 2, 10003, '2026-01-05 12:56:38', 'Caliiu'),
(2, 0, -501.228, 294.356, 2001.09, 1, 10006, '2026-01-06 12:56:26', 'Caliiu');

-- --------------------------------------------------------

--
-- Estrutura para tabela `interior`
--

CREATE TABLE `interior` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(32) NOT NULL,
  `Categoria` varchar(32) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `Interior` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `interiorcategoria`
--

CREATE TABLE `interiorcategoria` (
  `Nome` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `interiores`
--

CREATE TABLE `interiores` (
  `Nome` varchar(32) NOT NULL,
  `Categoria` varchar(32) NOT NULL,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `inventário`
--

CREATE TABLE `inventário` (
  `ID` int(11) NOT NULL,
  `Personagem` int(11) NOT NULL,
  `Item` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL DEFAULT 1,
  `Drogas` varchar(128) NOT NULL DEFAULT '0',
  `DrogaQuantidade` varchar(128) NOT NULL DEFAULT '0',
  `Cigarros` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE `itens` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(64) NOT NULL DEFAULT 'N/A',
  `Modelo` int(11) NOT NULL DEFAULT 0,
  `Categoria` int(11) NOT NULL DEFAULT 0,
  `Sub-categoria` int(11) NOT NULL DEFAULT 0,
  `ItemPesado` int(1) NOT NULL DEFAULT 0,
  `OffsetAttach` varchar(128) NOT NULL DEFAULT '0.0',
  `DrogaTipo` int(11) NOT NULL DEFAULT 0,
  `DrogaDosagem` float NOT NULL DEFAULT 0,
  `DrogaEfeitos` int(11) NOT NULL DEFAULT 0,
  `DrogaTempoEfeito` int(11) NOT NULL DEFAULT 0,
  `DrogaClima` int(11) NOT NULL DEFAULT 0,
  `DrogaHora` int(11) NOT NULL DEFAULT 0,
  `DrogaSkin` int(11) NOT NULL DEFAULT 0,
  `DrogaCorVeículo` int(11) NOT NULL DEFAULT 0,
  `DrogaPontosVicio` int(11) NOT NULL DEFAULT 0,
  `DrogaLegal` tinyint(4) NOT NULL DEFAULT 0,
  `CaseCapacidade` int(11) NOT NULL DEFAULT 0,
  `CaseCompatível` int(11) NOT NULL DEFAULT 0,
  `CaseCigarros` int(11) NOT NULL DEFAULT 0,
  `SementeRequerida` int(11) NOT NULL DEFAULT 0,
  `SementeDrogaGerada` int(11) NOT NULL DEFAULT 0,
  `SementeQuantidadeGerada` int(11) NOT NULL DEFAULT 0,
  `SementeIngredienteGerado` int(11) NOT NULL DEFAULT 0,
  `SementeIngredientePorcento` int(11) NOT NULL DEFAULT 0,
  `SementeTempoCrescimento` int(11) NOT NULL DEFAULT 0,
  `SementeTempoAmadurecimento` int(11) NOT NULL DEFAULT 0,
  `SementeTempoMorte` int(11) NOT NULL DEFAULT 0,
  `RemédioDrogas` varchar(128) NOT NULL DEFAULT '0',
  `FardoItem` int(11) NOT NULL DEFAULT 0,
  `FardoMaxItem` int(11) NOT NULL DEFAULT 0,
  `BebidaTeorAlcoólico` int(11) NOT NULL DEFAULT 0,
  `BebidaSaciez` int(11) NOT NULL DEFAULT 0,
  `BebidaItemGerado` int(11) NOT NULL DEFAULT 0,
  `ComidaSaciez` int(11) NOT NULL DEFAULT 0,
  `ComidaItemGerado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens`
--

INSERT INTO `itens` (`ID`, `Nome`, `Modelo`, `Categoria`, `Sub-categoria`, `ItemPesado`, `OffsetAttach`, `DrogaTipo`, `DrogaDosagem`, `DrogaEfeitos`, `DrogaTempoEfeito`, `DrogaClima`, `DrogaHora`, `DrogaSkin`, `DrogaCorVeículo`, `DrogaPontosVicio`, `DrogaLegal`, `CaseCapacidade`, `CaseCompatível`, `CaseCigarros`, `SementeRequerida`, `SementeDrogaGerada`, `SementeQuantidadeGerada`, `SementeIngredienteGerado`, `SementeIngredientePorcento`, `SementeTempoCrescimento`, `SementeTempoAmadurecimento`, `SementeTempoMorte`, `RemédioDrogas`, `FardoItem`, `FardoMaxItem`, `BebidaTeorAlcoólico`, `BebidaSaciez`, `BebidaItemGerado`, `ComidaSaciez`, `ComidaItemGerado`) VALUES
(1, 'Celular', 330, 1, 0, 0, '0.000|0.000|0.000|0.000|0.000|0.000|0.000|0.000|0.000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0|0|0|0|0', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs`
--

CREATE TABLE `logs` (
  `Data` datetime NOT NULL DEFAULT current_timestamp(),
  `Tipo` varchar(32) NOT NULL,
  `Texto` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `logs`
--

INSERT INTO `logs` (`Data`, `Tipo`, `Texto`) VALUES
('2026-01-04 00:20:16', '[Property Team] Entradas', 'Caliiu criou a entrada \"ROTA\"'),
('2026-01-04 00:20:52', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 1'),
('2026-01-04 00:20:55', 'Admin CMD', '[IRCOORD] Caliiu foi para a posição 1299.4, -1013.7, 6646.1'),
('2026-01-04 00:21:42', '[Faction Team] Facções criadas', 'Caliiu criou a facção \"Governo Federal\"'),
('2026-01-04 00:21:46', '[Faction Team] Facções criadas', 'Caliiu criou a facção \"Governo Estadual\"'),
('2026-01-04 00:21:52', '[Faction Team] Facções criadas', 'Caliiu criou a facção \"Prefeitura Municipal\"'),
('2026-01-04 00:21:57', '[Faction Team] Facções criadas', 'Caliiu criou a facção \"ROTA\"'),
('2026-01-04 00:22:22', '[Faction Team] Líderes setados', 'Caliiu deu a liderança da facção \"ROTA\" para Caliiu Walker (1) [4]'),
('2026-01-04 00:27:43', '[Faction Team] Facções editadas', 'Caliiu alterou a Skin Slot 1 da facção N/A para ID 266 [4]'),
('2026-01-04 00:30:26', '[Faction Team] Facções editadas', 'Caliiu alterou a Arma Slot 1 da facção N/A para Desert Eagle (50) [4]'),
('2026-01-04 00:40:26', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 284'),
('2026-01-04 00:40:31', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 267'),
('2026-01-04 01:00:00', 'Tick OSUH', '1767499200'),
('2026-01-04 12:13:05', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 287'),
('2026-01-04 12:13:08', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 286'),
('2026-01-04 12:13:10', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 291'),
('2026-01-04 12:13:12', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 174'),
('2026-01-04 12:13:14', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 214'),
('2026-01-04 12:13:19', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 266'),
('2026-01-04 12:13:23', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 284'),
('2026-01-04 12:13:58', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 228'),
('2026-01-04 12:14:02', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 1'),
('2026-01-04 12:14:05', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 2'),
('2026-01-04 12:14:06', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 4'),
('2026-01-04 12:14:07', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 20'),
('2026-01-04 12:14:08', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 22'),
('2026-01-04 12:14:09', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 24'),
('2026-01-04 12:14:11', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 25'),
('2026-01-04 12:14:12', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 26'),
('2026-01-04 12:14:14', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 29'),
('2026-01-04 12:14:15', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 31'),
('2026-01-04 12:14:17', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 271'),
('2026-01-04 12:14:18', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 272'),
('2026-01-04 12:14:19', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 274'),
('2026-01-04 12:14:20', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 275'),
('2026-01-04 12:14:21', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 276'),
('2026-01-04 12:14:22', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 279'),
('2026-01-04 12:14:24', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 22'),
('2026-01-04 12:14:24', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 25'),
('2026-01-04 12:14:26', 'Admin CMD', '[SETSKIN] Caliiu usou no personagem Caliiu Walker (Caliiu) - Skin: 22'),
('2026-01-04 12:28:50', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 10'),
('2026-01-04 12:28:52', 'Admin CMD', '[IRCOORD] Caliiu foi para a posição 6.0, -28.8, 1003.5'),
('2026-01-04 12:30:00', 'Gerenciamento', 'Caliiu criou o item Celular'),
('2026-01-04 12:30:22', 'Gerenciamento', 'Caliiu alterou o modelo do item Celular para 330'),
('2026-01-04 12:30:24', 'Gerenciamento', 'Caliiu alterou a categoria do item Celular para Geral'),
('2026-01-04 12:32:59', '[Property Team] Entradas', 'Caliiu criou a entrada \"1º Departamento Policial\"'),
('2026-01-04 12:33:32', '[Property Team] Entradas', 'Caliiu criou a entrada \"Sala São Paulo\"'),
('2026-01-04 12:33:54', '[Property Team] Entradas', 'Caliiu criou a entrada \"Agencia de Empregos\"'),
('2026-01-04 12:34:34', '[Property Team] Entradas', 'Caliiu criou a entrada \"Policia Militar de São Paulo\"'),
('2026-01-04 12:35:18', '[Property Team] Entradas', 'Caliiu criou a entrada \"Policia Federal\"'),
('2026-01-04 13:00:00', 'Tick OSUH', '1767542400'),
('2026-01-04 14:00:00', 'Tick OSUH', '1767546000'),
('2026-01-04 15:00:00', 'Tick OSUH', '1767549600'),
('2026-01-04 16:00:01', 'Tick OSUH', '1767553201'),
('2026-01-04 17:00:01', 'Tick OSUH', '1767556801'),
('2026-01-04 18:00:01', 'Tick OSUH', '1767560401'),
('2026-01-05 00:00:00', 'Tick OSUH', '1767582000'),
('2026-01-05 12:36:07', 'Admin CMD', '[SETFOME] Caliiu usou no personagem Caliiu Walker (Caliiu) - Fome: 100'),
('2026-01-05 12:36:15', 'Admin CMD', '[SETSEDE] Caliiu usou no personagem Caliiu Walker (Caliiu) - Sede: 100'),
('2026-01-05 12:51:55', 'Admin CMD', '[SETFOME] Caliiu usou no personagem Caliiu Walker (Caliiu) - Fome: 1410065407'),
('2026-01-05 12:52:06', 'Admin CMD', '[REFILL] Caliiu usou no personagem Caliiu Walker (Caliiu)'),
('2026-01-05 12:53:33', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 1'),
('2026-01-05 12:53:35', 'Admin CMD', '[IRCOORD] Caliiu foi para a posição 327.4, 1822.6, 2242.4'),
('2026-01-05 12:55:52', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 1'),
('2026-01-05 12:55:54', 'Admin CMD', '[IRCOORD] Caliiu foi para a posição 612.5, -24.3, 1001.4'),
('2026-01-05 12:56:07', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 2'),
('2026-01-05 12:56:38', '[Property Team] Interações', 'Caliiu criou uma interação de Agência de Empregos'),
('2026-01-05 12:57:20', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 1'),
('2026-01-05 12:57:23', 'Admin CMD', '[IRCOORD] Caliiu foi para a posição -885.0, -1393.5, 3112.1'),
('2026-01-05 12:58:50', '[Faction Team] Facções editadas', 'Caliiu ajustou o tipo da facção \"N/A\" para Governo [1]'),
('2026-01-05 12:59:33', '[Faction Team] Facções editadas', 'Caliiu ajustou o tipo da facção \"N/A\" para Governo [2]'),
('2026-01-05 12:59:35', '[Faction Team] Facções editadas', 'Caliiu ajustou o tipo da facção \"N/A\" para Governo [3]'),
('2026-01-05 12:59:44', '[Faction Team] Facções editadas', 'Caliiu ajustou o tipo da facção \"N/A\" para Policial [4]'),
('2026-01-05 13:00:00', 'Tick OSUH', '1767628800'),
('2026-01-06 12:52:31', '[Property Team] Entradas', 'Caliiu criou a entrada \"Prefeitura\"'),
('2026-01-06 12:54:46', '[Property Team] Entradas', 'Caliiu criou a entrada \"CTT\"'),
('2026-01-06 12:55:01', '[Property Team] Entradas', 'Caliiu ajustou o nome da entrada \"CTT\" para \"Centro de Treinamento Tático\" [8]'),
('2026-01-06 12:55:40', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 1'),
('2026-01-06 12:55:42', 'Admin CMD', '[IRCOORD] Caliiu foi para a posição -511.7, 299.9, 2000.0'),
('2026-01-06 12:56:12', '[Property Team] Entradas', 'Caliiu ajustou o nome da entrada \"Prefeitura\" para \"Prefeitura de São Paulo\" [7]'),
('2026-01-06 12:56:26', '[Property Team] Interações', 'Caliiu criou uma interação de Prefeitura'),
('2026-01-06 12:57:57', '[Faction Team] Facções criadas', 'Caliiu criou a facção \"Policia Militar de São Paulo\"'),
('2026-01-06 13:00:00', 'Tick OSUH', '1767715200'),
('2026-01-06 17:40:36', 'Admin CMD', '[SETMUNDO] Caliiu usou no personagem Caliiu Walker (Caliiu) - Mundo: 1'),
('2026-01-06 17:40:40', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 1'),
('2026-01-06 17:40:59', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 0'),
('2026-01-06 17:41:03', 'Admin CMD', '[SETMUNDO] Caliiu usou no personagem Caliiu Walker (Caliiu) - Mundo: 0'),
('2026-01-06 17:41:09', 'Admin CMD', '[SETMUNDO] Caliiu usou no personagem Caliiu Walker (Caliiu) - Mundo: 1'),
('2026-01-06 17:41:11', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 1'),
('2026-01-06 17:41:14', 'Admin CMD', '[IRCOORD] Caliiu foi para a posição 1412.8, -14.5, 1000.3'),
('2026-01-06 17:43:52', 'Admin CMD', '[SETMUNDO] Caliiu usou no personagem Caliiu Walker (Caliiu) - Mundo: 1'),
('2026-01-06 17:43:57', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 6'),
('2026-01-06 17:44:09', 'Admin CMD', '[IRCOORD] Caliiu foi para a posição 1403.4, -7.6, 1004.7'),
('2026-01-06 17:47:31', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 66'),
('2026-01-06 17:47:32', 'Admin CMD', '[SETINTERIOR] Caliiu usou no personagem Caliiu Walker (Caliiu) - Interior: 6'),
('2026-01-06 17:47:42', 'Admin CMD', '[IRCOORD] Caliiu foi para a posição 1404.4, -2.3, 1010.4'),
('2026-01-06 17:53:24', '[Property Team] Entradas', 'Caliiu criou a entrada \"Grupamento de Bombeiros\"'),
('2026-01-06 18:00:00', 'Tick OSUH', '1767733200'),
('2026-01-06 20:00:00', 'Tick OSUH', '1767740400'),
('2026-01-06 21:00:00', 'Tick OSUH', '1767744000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mobílias`
--

CREATE TABLE `mobílias` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(64) NOT NULL DEFAULT '',
  `Modelo` int(11) NOT NULL DEFAULT 0,
  `Texturas` varchar(64) NOT NULL DEFAULT '',
  `Cores` varchar(64) NOT NULL DEFAULT '',
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `RotX` float NOT NULL DEFAULT 0,
  `RotY` float NOT NULL DEFAULT 0,
  `RotZ` float NOT NULL DEFAULT 0,
  `PortaTrancada` tinyint(4) NOT NULL DEFAULT 0,
  `PortaAberta` tinyint(4) NOT NULL DEFAULT 0,
  `PortaPosX` float NOT NULL DEFAULT 0,
  `PortaPosY` float NOT NULL DEFAULT 0,
  `PortaPosZ` float NOT NULL DEFAULT 0,
  `PortaRotX` float NOT NULL DEFAULT 0,
  `PortaRotY` float NOT NULL DEFAULT 0,
  `PortaRotZ` float NOT NULL DEFAULT 0,
  `Preço` int(11) NOT NULL DEFAULT 0,
  `Tipo` int(11) NOT NULL DEFAULT 0,
  `Propriedade` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personagens`
--

CREATE TABLE `personagens` (
  `ID` int(11) NOT NULL,
  `Conta` int(11) NOT NULL,
  `Nome` varchar(24) NOT NULL,
  `Skin` int(11) NOT NULL DEFAULT 264,
  `Dinheiro` int(11) NOT NULL DEFAULT 350,
  `DinheiroBanco` int(11) NOT NULL DEFAULT 1150,
  `Nível` int(11) NOT NULL DEFAULT 1,
  `Experiência` int(11) NOT NULL DEFAULT 0,
  `Sede` float NOT NULL DEFAULT 100,
  `Fome` float NOT NULL DEFAULT 100,
  `Sono` float NOT NULL DEFAULT 100,
  `SpawnPoint` int(11) NOT NULL DEFAULT 0,
  `SpawnId` int(11) NOT NULL DEFAULT -1,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Angle` float NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Emprego` int(11) NOT NULL DEFAULT -1,
  `EmpregoHoras` varchar(32) DEFAULT NULL,
  `Paycheck` int(11) NOT NULL DEFAULT 0,
  `Facção` int(11) NOT NULL DEFAULT -1,
  `FacçãoMod` int(11) NOT NULL DEFAULT 0,
  `FacçãoRank` varchar(32) NOT NULL DEFAULT 'Membro',
  `Altura` int(11) NOT NULL,
  `Peso` int(11) NOT NULL,
  `Olhos` varchar(16) NOT NULL,
  `Etnia` varchar(22) NOT NULL,
  `CidadeNatal` varchar(32) NOT NULL,
  `DataNascimento` varchar(10) NOT NULL,
  `Gênero` char(1) NOT NULL DEFAULT 'M',
  `RádioOn` char(1) NOT NULL DEFAULT '0',
  `RádioCanais` varchar(128) NOT NULL DEFAULT '0',
  `Acesso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `personagens`
--

INSERT INTO `personagens` (`ID`, `Conta`, `Nome`, `Skin`, `Dinheiro`, `DinheiroBanco`, `Nível`, `Experiência`, `Sede`, `Fome`, `Sono`, `SpawnPoint`, `SpawnId`, `PosX`, `PosY`, `PosZ`, `Angle`, `Interior`, `World`, `Emprego`, `EmpregoHoras`, `Paycheck`, `Facção`, `FacçãoMod`, `FacçãoRank`, `Altura`, `Peso`, `Olhos`, `Etnia`, `CidadeNatal`, `DataNascimento`, `Gênero`, `RádioOn`, `RádioCanais`, `Acesso`) VALUES
(1, 1, 'Caliiu_Walker', 22, 350, 8150, 2, 1, 19.9988, 24.6836, 28.9217, 0, -1, 1479.15, -1726.37, 13.3316, 183.373, 0, 0, -1, '0|0|0|0', 1233, 4, 6, 'Líder', 180, 70, 'Castanho', 'Branco', 'São Paulo', '06/06/2003', 'M', '0', '0|0|0|0|0', '2026-01-06 21:09:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ruas`
--

CREATE TABLE `ruas` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(32) NOT NULL,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `variáveis`
--

CREATE TABLE `variáveis` (
  `Nome` varchar(64) NOT NULL,
  `Int` int(11) DEFAULT NULL,
  `String` varchar(256) DEFAULT NULL,
  `Float` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `veículos`
--

CREATE TABLE `veículos` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(32) NOT NULL DEFAULT 'N/A',
  `Placa` varchar(16) NOT NULL DEFAULT 'N/A',
  `Dono` int(11) NOT NULL DEFAULT -1,
  `Tipo` int(11) NOT NULL DEFAULT 0,
  `Modelo` int(11) NOT NULL DEFAULT 0,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Angle` float NOT NULL DEFAULT 0,
  `World` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `Cor1` int(11) NOT NULL DEFAULT 0,
  `Cor2` int(11) NOT NULL DEFAULT 0,
  `Paintjob` int(11) NOT NULL DEFAULT 0,
  `Vida` float NOT NULL DEFAULT 1000,
  `Quilômetros` float NOT NULL DEFAULT 0,
  `VidaMotor` float NOT NULL DEFAULT 100,
  `VidaBateria` float NOT NULL DEFAULT 100,
  `Combustível` float NOT NULL DEFAULT 100,
  `DamageDoors` int(11) NOT NULL DEFAULT 0,
  `DamagePanels` int(11) NOT NULL DEFAULT 0,
  `DamageLights` int(11) NOT NULL DEFAULT 0,
  `DamageTires` int(11) NOT NULL DEFAULT 0,
  `Seguro` int(11) NOT NULL DEFAULT 0,
  `Alarme` int(11) NOT NULL DEFAULT 0,
  `Imobilizador` int(11) NOT NULL DEFAULT 0,
  `Trava` int(11) NOT NULL DEFAULT 0,
  `Localizador` int(11) NOT NULL DEFAULT 0,
  `Modificações` varchar(64) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veículos`
--

INSERT INTO `veículos` (`ID`, `Nome`, `Placa`, `Dono`, `Tipo`, `Modelo`, `PosX`, `PosY`, `PosZ`, `Angle`, `World`, `Interior`, `Cor1`, `Cor2`, `Paintjob`, `Vida`, `Quilômetros`, `VidaMotor`, `VidaBateria`, `Combustível`, `DamageDoors`, `DamagePanels`, `DamageLights`, `DamageTires`, `Seguro`, `Alarme`, `Imobilizador`, `Trava`, `Localizador`, `Modificações`) VALUES
(1, 'Huntley', '', -1, 2, 579, 1279.85, -1355.04, 13.4832, 271.612, 0, 0, 0, 0, 0, 1150, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2, 'Huntley', '', -1, 2, 579, 1279.95, -1362.45, 13.485, 265.586, 0, 0, 0, 0, 0, 1150, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(3, 'Huntley', '', -1, 2, 579, 1279.45, -1369.23, 13.4828, 264.87, 0, 0, 0, 0, 0, 1150, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4, 'Huntley', '', -1, 2, 579, 1279.64, -1375.66, 13.4818, 269.853, 0, 0, 0, 0, 0, 1150, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(5, 'Police Car (LSPD)', '', -1, 2, 596, 837.244, -1193.28, 17.0308, 89.099, 0, 0, 1, 1, 0, 1110, 0, 100, 100, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6, 'Police Car (LSPD)', '', -1, 2, 596, 837.23, -1189.43, 17.032, 89.9119, 0, 0, 1, 1, 0, 1110, 0, 100, 100, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(7, 'Police Car (LSPD)', '', -1, 2, 596, 837.232, -1185.65, 17.0326, 87.496, 0, 0, 1, 1, 0, 1110, 0, 100, 100, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8, 'Police Car (LSPD)', '', -1, 2, 596, 818.916, -1193.4, 16.9846, 7.29847, 0, 0, 1, 1, 0, 1110, 0, 100, 100, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(9, 'FBI Rancher', '', -1, 2, 490, 836.59, -1177.68, 16.8618, 87.3254, 0, 0, 1, 1, 0, 1430, 0, 100, 100, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(10, 'FBI Rancher', '', -1, 2, 490, 836.669, -1174.12, 16.8627, 89.0939, 0, 0, 1, 1, 0, 1430, 0, 100, 100, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(11, 'FBI Rancher', '', -1, 2, 490, 836.646, -1170.47, 16.8542, 90.0127, 0, 0, 1, 1, 0, 1430, 0, 100, 100, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(14, 'HPV1000', '', -1, 2, 523, 829.429, -1161.45, 16.5551, 180.65, 0, 0, 1, 1, 0, 1000, 0, 50, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(15, 'HPV1000', '', -1, 2, 523, 827.42, -1161.5, 16.5533, 182.865, 0, 0, 1, 1, 0, 1000, 0, 50, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(16, 'HPV1000', '', -1, 2, 523, 825.305, -1161.58, 16.5502, 181.525, 0, 0, 1, 1, 0, 1000, 0, 50, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(17, 'HPV1000', '', -1, 2, 523, 823.153, -1161.58, 16.5543, 181.581, 0, 0, 1, 1, 0, 1000, 0, 50, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(18, 'Premier', '', -1, 2, 426, 596.897, -1660.12, 16.2955, 354.606, 0, 0, 0, 0, 0, 930, 0, 100, 100, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(19, 'Premier', '', -1, 2, 426, 588.243, -1659.06, 16.5423, 354.442, 0, 0, 0, 0, 0, 930, 0, 100, 100, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(20, 'Premier', '', -1, 2, 426, 592.563, -1659.57, 16.4207, 354.084, 0, 0, 0, 0, 0, 930, 0, 100, 100, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(21, 'FBI Truck', '', -1, 2, 528, 606.815, -1661.1, 16.3016, 353.859, 0, 0, 0, 0, 0, 1000, 0, 100, 100, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(22, 'FBI Truck', '', -1, 2, 528, 611.119, -1661.56, 16.255, 355.412, 0, 0, 0, 0, 0, 1000, 0, 100, 100, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atividadesuspeita`
--
ALTER TABLE `atividadesuspeita`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Conta` (`Conta`);

--
-- Índices de tabela `banimentos`
--
ALTER TABLE `banimentos`
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices de tabela `bombas`
--
ALTER TABLE `bombas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Empresa` (`Empresa`);

--
-- Índices de tabela `casas`
--
ALTER TABLE `casas`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `closedbeta`
--
ALTER TABLE `closedbeta`
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices de tabela `contas`
--
ALTER TABLE `contas`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices de tabela `empresaitens`
--
ALTER TABLE `empresaitens`
  ADD UNIQUE KEY `Tipo` (`Tipo`,`Item`),
  ADD KEY `Item` (`Item`);

--
-- Índices de tabela `empresapreços`
--
ALTER TABLE `empresapreços`
  ADD UNIQUE KEY `Empresa` (`Empresa`,`Item`),
  ADD KEY `Item` (`Item`);

--
-- Índices de tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `facçãoarmário`
--
ALTER TABLE `facçãoarmário`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `facçãoarsenal`
--
ALTER TABLE `facçãoarsenal`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `facçãospawn`
--
ALTER TABLE `facçãospawn`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `facções`
--
ALTER TABLE `facções`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `garagens`
--
ALTER TABLE `garagens`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `indústriaestoque`
--
ALTER TABLE `indústriaestoque`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `indústrias`
--
ALTER TABLE `indústrias`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `interações`
--
ALTER TABLE `interações`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `interior`
--
ALTER TABLE `interior`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Nome` (`Nome`,`Categoria`),
  ADD KEY `Categoria` (`Categoria`);

--
-- Índices de tabela `interiorcategoria`
--
ALTER TABLE `interiorcategoria`
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices de tabela `interiores`
--
ALTER TABLE `interiores`
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices de tabela `inventário`
--
ALTER TABLE `inventário`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Personagem` (`Personagem`,`Item`),
  ADD KEY `Item` (`Item`);

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices de tabela `mobílias`
--
ALTER TABLE `mobílias`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `personagens`
--
ALTER TABLE `personagens`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices de tabela `ruas`
--
ALTER TABLE `ruas`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `variáveis`
--
ALTER TABLE `variáveis`
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices de tabela `veículos`
--
ALTER TABLE `veículos`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atividadesuspeita`
--
ALTER TABLE `atividadesuspeita`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bombas`
--
ALTER TABLE `bombas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `casas`
--
ALTER TABLE `casas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contas`
--
ALTER TABLE `contas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `entradas`
--
ALTER TABLE `entradas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `facçãoarmário`
--
ALTER TABLE `facçãoarmário`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `facçãoarsenal`
--
ALTER TABLE `facçãoarsenal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `facçãospawn`
--
ALTER TABLE `facçãospawn`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `facções`
--
ALTER TABLE `facções`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `garagens`
--
ALTER TABLE `garagens`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `indústriaestoque`
--
ALTER TABLE `indústriaestoque`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `indústrias`
--
ALTER TABLE `indústrias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `interações`
--
ALTER TABLE `interações`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `interior`
--
ALTER TABLE `interior`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `inventário`
--
ALTER TABLE `inventário`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `mobílias`
--
ALTER TABLE `mobílias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personagens`
--
ALTER TABLE `personagens`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ruas`
--
ALTER TABLE `ruas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `veículos`
--
ALTER TABLE `veículos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atividadesuspeita`
--
ALTER TABLE `atividadesuspeita`
  ADD CONSTRAINT `atividadesuspeita_ibfk_1` FOREIGN KEY (`Conta`) REFERENCES `contas` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `bombas`
--
ALTER TABLE `bombas`
  ADD CONSTRAINT `bombas_ibfk_1` FOREIGN KEY (`Empresa`) REFERENCES `empresas` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `empresaitens`
--
ALTER TABLE `empresaitens`
  ADD CONSTRAINT `empresaitens_ibfk_1` FOREIGN KEY (`Item`) REFERENCES `itens` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `empresapreços`
--
ALTER TABLE `empresapreços`
  ADD CONSTRAINT `empresapreços_ibfk_1` FOREIGN KEY (`Item`) REFERENCES `itens` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `empresapreços_ibfk_2` FOREIGN KEY (`Empresa`) REFERENCES `empresas` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `interior`
--
ALTER TABLE `interior`
  ADD CONSTRAINT `interior_ibfk_1` FOREIGN KEY (`Categoria`) REFERENCES `interiorcategoria` (`Nome`) ON DELETE CASCADE;

--
-- Restrições para tabelas `inventário`
--
ALTER TABLE `inventário`
  ADD CONSTRAINT `inventário_ibfk_1` FOREIGN KEY (`Personagem`) REFERENCES `personagens` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventário_ibfk_2` FOREIGN KEY (`Item`) REFERENCES `itens` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
