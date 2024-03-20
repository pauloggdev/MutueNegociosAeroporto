-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           5.7.24 - MySQL Community Server (GPL)
-- SO do servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- A despejar estrutura da base de dados para mutue_negocios_aeroporto_cliente
CREATE DATABASE IF NOT EXISTS `mutue_negocios_aeroporto_cliente` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mutue_negocios_aeroporto_cliente`;

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.actualizacao_stocks
CREATE TABLE IF NOT EXISTS `actualizacao_stocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `produto_id` int(10) unsigned NOT NULL,
  `quantidade_antes` int(10) unsigned NOT NULL,
  `quantidade_nova` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `tipo_user_id` int(10) unsigned DEFAULT NULL,
  `centroCustoId` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `armazem_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao` text,
  PRIMARY KEY (`id`),
  KEY `FK_actualizacao_stocks_empresa` (`empresa_id`),
  KEY `FK_actualizacao_stocks_produto` (`produto_id`),
  KEY `FK_actualizacao_stocks_user` (`user_id`),
  KEY `FK_actualizacao_stocks_canal` (`canal_id`),
  KEY `FK_actualizacao_stocks_status` (`status_id`),
  KEY `FK_actualizacao_stocks_armazens` (`armazem_id`),
  KEY `FK_actualizacao_stocks_tipo_users` (`tipo_user_id`),
  CONSTRAINT `FK_actualizacao_stocks_armazens` FOREIGN KEY (`armazem_id`) REFERENCES `armazens` (`id`),
  CONSTRAINT `FK_actualizacao_stocks_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_actualizacao_stocks_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_actualizacao_stocks_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_actualizacao_stocks_tipo_users` FOREIGN KEY (`tipo_user_id`) REFERENCES `tipo_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.actualizacao_stocks: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.armazens
CREATE TABLE IF NOT EXISTS `armazens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diversos` enum('1','2') DEFAULT '2' COMMENT '1=>sim;2=>nao',
  PRIMARY KEY (`id`),
  KEY `FK_armazens_status` (`status_id`),
  KEY `FK_armazens_user` (`user_id`),
  KEY `FK_armazens_empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.armazens: ~0 rows (aproximadamente)
INSERT INTO `armazens` (`id`, `designacao`, `sigla`, `codigo`, `localizacao`, `status_id`, `user_id`, `empresa_id`, `created_at`, `updated_at`, `diversos`) VALUES
	(1, 'LOJA PRINCIPAL', NULL, '206217692', 'Estrada nacional 230, km 42 - Municipio do Icolo e Bengo, Distrito  do Bom Jesus, Luanda-Angola', 1, NULL, 1, '2024-01-23 16:10:54', '2024-01-23 16:10:54', '1');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.bancos
CREATE TABLE IF NOT EXISTS `bancos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `num_conta` varchar(45) NOT NULL,
  `titular` varchar(255) NOT NULL,
  `moeda` char(50) DEFAULT 'AOA',
  `iban` varchar(45) NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `empresa_id` int(10) unsigned NOT NULL,
  `tipo_user_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `centroCustoId` int(10) unsigned DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_bancos_canal` (`canal_id`),
  KEY `FK_bancos_user` (`user_id`),
  KEY `FK_bancos_status` (`status_id`),
  KEY `FK_bancos_empresas` (`empresa_id`),
  KEY `FK_bancos_tipo_users` (`tipo_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.bancos: ~2 rows (aproximadamente)
INSERT INTO `bancos` (`id`, `designacao`, `sigla`, `uuid`, `num_conta`, `titular`, `moeda`, `iban`, `status_id`, `canal_id`, `created_at`, `empresa_id`, `tipo_user_id`, `user_id`, `centroCustoId`, `updated_at`) VALUES
	(1, 'Banco Fomento Angola', 'BFA', '1678532d-e1fb-4619-b62e-1e7ce2fe1edb', '000610002000300', 'AIRPORT TEMPORARY OPERATOR', 'AOA', 'AO06 0066 0000 0683 4061 1016 7', 1, 2, '2024-01-26 12:50:42', 1, 2, 1, NULL, '2024-01-26 12:50:42'),
	(2, 'Banco Fomento Angola', 'BFA', '1678532d-e1fb-4619-b62e-1e7ce2fe1edc', '000610002000300', 'AIRPORT TEMPORARY OPERATOR', 'USD', 'AO06 0066 0000 0683 4061 1210 7', 1, 2, '2024-01-26 12:50:42', 1, 2, 1, NULL, '2024-01-26 12:50:42');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.banner
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(60) NOT NULL,
  `imagens` varchar(300) NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_banner_status_gerais` (`status_id`),
  CONSTRAINT `FK_banner_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.banner: ~2 rows (aproximadamente)
INSERT INTO `banner` (`id`, `nome`, `descricao`, `imagens`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Banner 1', 'Banner 1', 'upload/banner/DAEctpr1MX5xHL3pXWn6jLALFAKICgzlCGwfLkSn.jpg', 1, '2023-11-18 11:26:10', '2023-11-21 10:28:40', NULL),
	(2, 'Banner 2', 'Banner 2', 'upload/banner/ISCc82cSHvxV6oVcjmE2MrwVlljHZk3oF3LuW2wJ.jpg', 1, '2023-11-18 11:28:02', '2023-11-21 10:28:57', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.bonus_cartao_cliente
CREATE TABLE IF NOT EXISTS `bonus_cartao_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bonus` double NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1' COMMENT '1=>Ativo, 2=>Desativo',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.bonus_cartao_cliente: ~2 rows (aproximadamente)
INSERT INTO `bonus_cartao_cliente` (`id`, `bonus`, `user_id`, `empresa_id`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 10, 35, 53, 1, '2023-08-26 11:16:27', '2023-10-27 10:07:10', NULL),
	(4, 1, 638, 148, 1, '2023-11-20 09:12:20', '2023-11-20 09:12:20', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.bonus_cartao_cliente_range
CREATE TABLE IF NOT EXISTS `bonus_cartao_cliente_range` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valorInicial` double DEFAULT '0',
  `valorFinal` double DEFAULT '0',
  `empresa_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `valorBonus` double DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.bonus_cartao_cliente_range: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.cambios
CREATE TABLE IF NOT EXISTS `cambios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` char(50) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.cambios: ~2 rows (aproximadamente)
INSERT INTO `cambios` (`id`, `designacao`, `valor`) VALUES
	(1, 'USD', 832.631),
	(2, 'EURO', 898.24);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.canais_comunicacoes
CREATE TABLE IF NOT EXISTS `canais_comunicacoes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.canais_comunicacoes: ~4 rows (aproximadamente)
INSERT INTO `canais_comunicacoes` (`id`, `designacao`) VALUES
	(1, 'BD'),
	(2, 'Portal Cliente'),
	(3, 'Portal Admin'),
	(4, 'Mobile');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.carateristica_produtos
CREATE TABLE IF NOT EXISTS `carateristica_produtos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `altura` double DEFAULT '0',
  `largura` double DEFAULT '0',
  `cor` varchar(255) DEFAULT NULL,
  `peso` double DEFAULT '0',
  `especura` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.carateristica_produtos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.carrinho_produtos
CREATE TABLE IF NOT EXISTS `carrinho_produtos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantidade` int(10) NOT NULL DEFAULT '0',
  `produto_id` int(10) unsigned DEFAULT NULL,
  `users_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_carrinho_produtos_produtos` (`produto_id`) USING BTREE,
  KEY `FK_carrinho_produtos_users_cliente` (`users_id`) USING BTREE,
  CONSTRAINT `FK_carrinho_produtos_produtos` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_carrinho_produtos_users_cliente` FOREIGN KEY (`users_id`) REFERENCES `users_cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.carrinho_produtos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.cartao_clientes
CREATE TABLE IF NOT EXISTS `cartao_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clienteId` int(11) NOT NULL,
  `numeroCartao` varchar(255) NOT NULL,
  `dataEmissao` date NOT NULL,
  `dataValidade` date NOT NULL,
  `numeracaoSequencia` int(11) NOT NULL,
  `empresaId` int(11) NOT NULL,
  `saldo` double NOT NULL DEFAULT '0',
  `centroCustoId` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.cartao_clientes: ~3 rows (aproximadamente)
INSERT INTO `cartao_clientes` (`id`, `clienteId`, `numeroCartao`, `dataEmissao`, `dataValidade`, `numeracaoSequencia`, `empresaId`, `saldo`, `centroCustoId`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, 34, '5300001', '2023-09-20', '2024-09-30', 1, 53, 1000, NULL, '2023-09-20 13:00:53', '2023-10-13 09:38:57', NULL),
	(4, 207, '5300002', '2023-10-13', '2024-10-13', 2, 53, 2000, NULL, '2023-10-13 10:11:54', '2023-10-13 10:11:54', NULL),
	(5, 204, '5300003', '2023-10-13', '2024-10-26', 2, 53, 2162, NULL, '2023-10-13 10:11:54', '2023-10-24 18:03:19', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.categoriacaracteristicas
CREATE TABLE IF NOT EXISTS `categoriacaracteristicas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.categoriacaracteristicas: ~200 rows (aproximadamente)
INSERT INTO `categoriacaracteristicas` (`id`, `designacao`) VALUES
	(1, 'Memória'),
	(2, 'Cor'),
	(3, 'Batéria'),
	(4, 'Outros detalhes'),
	(5, 'Cartões de memória MAXELL'),
	(6, 'Ram'),
	(7, ' CAPACIDADE DE ARMAZENAMENTO	128GB'),
	(8, 'TIPO DE MEMÓRIA	microSDXC/SDHC 300S'),
	(9, 'COR	CINZA'),
	(10, 'Nome da marca : '),
	(12, 'Cor de exibição '),
	(13, 'Recurso : wi-fi, navegação GPS, tela sensível ao toque, foco automático, IP67 à prova d\'água'),
	(14, 'Sistema de Operação '),
	(15, 'Função : Despertador, rastreador de fitness, rastreador de frequência cardíaca, lembrete de mensagem, mensagem push, rastreador de sono'),
	(16, 'N ° de Modelo'),
	(17, 'Característica '),
	(18, 'Operation System '),
	(19, 'Modelo'),
	(20, 'Características'),
	(21, 'Peso'),
	(23, 'Modelo'),
	(24, 'Modelo'),
	(25, 'Tamanho da tela: '),
	(26, 'Câmera principal: '),
	(27, 'Câmera frontal:'),
	(31, 'Sistema'),
	(32, 'Processador'),
	(33, 'Memória RAM'),
	(34, 'Armazenamento'),
	(36, 'Capacidade da bateria'),
	(38, 'Telefonia'),
	(40, 'Modelo'),
	(41, 'Processador'),
	(42, 'Display'),
	(43, 'Bateria'),
	(45, 'Rede'),
	(46, 'Versão Sistema'),
	(47, 'Recursos principais da câmera Câmera dupla AI: '),
	(48, 'Câmera secundária '),
	(49, 'Sensores '),
	(51, 'Tela'),
	(52, 'Bateria'),
	(53, 'Camera'),
	(54, 'Memória'),
	(55, 'Tela	'),
	(56, 'Bateria'),
	(57, 'Camera	'),
	(61, 'Memória'),
	(62, 'Modelo'),
	(63, 'Modelo'),
	(65, 'Tamanho da tela'),
	(67, 'Tamanho da tela	'),
	(69, 'Painel da tela: IPS LCD'),
	(71, 'Painel da tela'),
	(73, 'Câmera principal'),
	(74, 'Câmera principal'),
	(75, 'Câmera frontal'),
	(76, 'Câmera frontal'),
	(77, 'Sistema'),
	(78, 'Sistema'),
	(79, 'Memória RAM'),
	(80, 'Memória RAM'),
	(83, 'Armazenamento'),
	(84, 'Armazenamento'),
	(85, 'Capacidade da bateria'),
	(86, 'Capacidade da bateria'),
	(87, 'Telefonia'),
	(88, 'Telefonia'),
	(89, 'Tela'),
	(92, 'Camera Traseira'),
	(93, 'Camera Frontal'),
	(94, 'Rede'),
	(95, 'Segurança'),
	(97, 'Bateria'),
	(98, 'Sistema'),
	(99, 'Memoria'),
	(100, 'Tela'),
	(101, 'Camara Traseira'),
	(102, 'Camara Frontal'),
	(103, 'Rede'),
	(104, 'Segurança'),
	(105, 'Bateria'),
	(106, 'Sistema'),
	(107, 'Memoria'),
	(109, 'O kit inclui dois adaptadores SimpleNet'),
	(112, 'Fornece acesso à rede para consoles de jogos, TVs prontas para Web, computadores e muito mais'),
	(114, 'Usa a mais recente tecnologia HomePlug AV para velocidades mais rápidas e segurança aprimorada'),
	(115, 'Ideal para streaming de vídeo com qualidade HD e jogos online'),
	(116, 'Taxas de dados de rede de até 500 Mbps e segurança de dados por meio de criptografia de 128 bits'),
	(117, 'Plug and play — instala em minutos sem drivers'),
	(118, 'Tela'),
	(120, 'Bateria'),
	(121, 'Lanterna'),
	(122, 'Rádio'),
	(123, 'Tela'),
	(124, 'Bateria'),
	(125, 'Lanterna'),
	(126, 'Rádio'),
	(127, 'Tela'),
	(128, 'Bateria'),
	(129, 'Lanterna'),
	(130, 'Radio'),
	(131, 'Tela'),
	(133, 'Bateria'),
	(134, 'Lanterna'),
	(135, 'Radio'),
	(136, 'Tela'),
	(138, 'Bateria'),
	(139, 'Lanterna'),
	(142, 'Radio'),
	(145, 'Tela'),
	(146, 'Bateria'),
	(147, 'Lanterna'),
	(148, 'Radio'),
	(149, 'Tela'),
	(151, 'Bateria'),
	(152, 'Lanterna'),
	(153, 'Radio'),
	(154, 'Camerda Digital'),
	(155, 'Bluetooth'),
	(156, 'Lanterna'),
	(157, 'Radio'),
	(160, 'Camera Digital'),
	(161, 'Bluetooth'),
	(162, 'Lanterna'),
	(163, 'Radio'),
	(165, 'Tela'),
	(166, 'Bateria'),
	(167, 'Dual SIM'),
	(168, 'Rádio'),
	(169, 'Bluetooth'),
	(171, 'MP3 Player'),
	(172, 'Camera Digital'),
	(173, 'MicroSD'),
	(174, 'COR'),
	(175, 'TECNOLOGIA DE IMPRESSÃO'),
	(176, 'USB'),
	(177, 'LIGAÇÃO'),
	(178, 'VGA'),
	(179, 'TIPO DE IMPRESSORA'),
	(180, ' LAN'),
	(181, 'CAPACIDADE DO DISCO'),
	(182, 'SISTEMA OPERATIVO'),
	(183, 'TIPO DE DISCO'),
	(184, 'PROCESSADOR'),
	(185, 'TAMANHO DO ECRÃ'),
	(186, 'WIFI'),
	(189, 'PLACA GRÁFICA'),
	(190, 'USB'),
	(191, 'CAPACIDADE DE MEMÓRIA'),
	(192, 'HDMI'),
	(193, 'BLUETOOTH'),
	(194, 'VELOCIDADE DE PROCESSADOR'),
	(195, 'LAN'),
	(196, 'PORTAS LAN'),
	(197, 'RESOLUÇÃO ECRÂ'),
	(198, 'BATERIAS'),
	(199, 'CAPACIDADE DO DISCO'),
	(200, 'SISTEMA OPERATIVO'),
	(201, 'PROCESSADOR'),
	(202, 'TAMANHO DO ECRÃ'),
	(203, 'WIFI'),
	(204, 'PLACA GRÁFICA'),
	(205, 'Nº USB\'s'),
	(207, 'USB'),
	(208, 'CAPACIDADE DE MEMÓRIA'),
	(209, 'MEMÓRIA RAM'),
	(210, 'HDMI'),
	(211, 'WIRELESS'),
	(212, 'WIRELESS'),
	(213, 'LAN'),
	(214, 'RESOLUÇÃO ECRÂ'),
	(215, 'CAPACIDADE DO DISCO'),
	(216, 'SISTEMA OPERATIVO'),
	(217, 'TIPO DE DISCO'),
	(218, 'PROCESSADOR'),
	(219, 'WIFI'),
	(220, 'PLACA GRÁFICA'),
	(221, 'Nº USB\'s'),
	(222, 'ENTRADA DE CARTÃO'),
	(224, 'Nº HDMI\'s'),
	(225, 'TIPO DE MEMÓRIA'),
	(226, 'CÂMARA FRONTAL'),
	(227, 'MEMÓRIA RAM'),
	(228, 'HDMI'),
	(229, 'BLUETOOTH'),
	(232, 'VELOCIDADE DE PROCESSADOR	'),
	(236, 'WIRELESS'),
	(237, 'MEMÓRIA CACHE'),
	(238, 'POLEGADAS'),
	(244, 'COR'),
	(245, 'RESOLUÇÃO ECRÂ'),
	(246, 'TEMPO DE RESPOSTA'),
	(247, 'PORTA VGA'),
	(248, 'TAMANHO DO ECRÃ'),
	(249, 'Nº HDMI\'s'),
	(250, 'HDMI'),
	(251, 'COR'),
	(252, 'LIGAÇÃO'),
	(253, 'BLUETOOTH');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `categoria_pai` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `canal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_categorias_status` (`status_id`),
  KEY `FK_categorias_user` (`user_id`),
  KEY `FK_categorias_empresa` (`empresa_id`),
  CONSTRAINT `FK_categorias_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_categorias_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_categorias_user` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.categorias: ~0 rows (aproximadamente)
INSERT INTO `categorias` (`id`, `designacao`, `imagem`, `icon`, `uuid`, `status_id`, `categoria_pai`, `user_id`, `empresa_id`, `created_at`, `updated_at`, `deleted_at`, `canal_id`) VALUES
	(1, 'DIVERSO', NULL, NULL, '78d1a432-cd63-46b2-a406-49b26a6ad73c', 1, NULL, NULL, NULL, '2021-09-06 17:17:53', '2023-10-11 14:16:17', NULL, NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.centro_custos
CREATE TABLE IF NOT EXISTS `centro_custos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `status_id` int(11) unsigned NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `nif` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `logotipo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) NOT NULL,
  `pessoa_de_contacto` varchar(255) DEFAULT NULL,
  `file_alvara` varchar(255) DEFAULT NULL,
  `file_nif` varchar(255) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_centro_custos_empresas` (`empresa_id`),
  KEY `FK_centro_custos_status_gerais` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.centro_custos: ~0 rows (aproximadamente)
INSERT INTO `centro_custos` (`id`, `uuid`, `empresa_id`, `status_id`, `endereco`, `nif`, `cidade`, `logotipo`, `email`, `website`, `telefone`, `pessoa_de_contacto`, `file_alvara`, `file_nif`, `nome`, `updated_at`, `created_at`, `deleted_at`) VALUES
	(1, '7bc3cea5-4cc1-4145-89e4-760fc882dd0e', 1, 1, 'Estrada nacional 230, km 42 - Municipio do Icolo e Bengo, Distrito  do Bom Jesus, Luanda-Angola', '5001720538', 'Luanda', 'utilizadores/cliente/Sy25ugUGqoST3TRMFLTF4O9bvJiP6sv5ayOtfari.png', 'info@ato.ao', 'ato.ao', '937036322', '937036322', NULL, NULL, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-02-07 09:32:31', '2024-02-07 09:32:31', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.cidades
CREATE TABLE IF NOT EXISTS `cidades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.cidades: ~18 rows (aproximadamente)
INSERT INTO `cidades` (`id`, `designacao`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Luanda', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(2, 'Zaire', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(3, 'Uige', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(4, 'Cabinda', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(5, 'Bengo', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(6, 'Malanje', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(7, 'Kwanza Norte', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(8, 'Lunda Norte', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(9, 'Lunda Sul', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(10, 'Moxico', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(11, 'Bie', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(12, 'Huambo', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(13, 'Benguela', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(14, 'Kwanza Sul', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(15, 'Cuango Cubango', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(16, 'Huila', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(17, 'Namibe', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL),
	(18, 'Cunene', '2022-02-11 05:03:03', '2022-02-11 05:03:03', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.classes
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK__empresas` (`empresa_id`),
  KEY `FK__status_gerais` (`status_id`),
  KEY `FK__users` (`user_id`),
  KEY `FK__canais_comunicacoes` (`canal_id`),
  CONSTRAINT `FK__canais_comunicacoes` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK__empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK__status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK__users` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.classes: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.classificacao
CREATE TABLE IF NOT EXISTS `classificacao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `num_classificacao` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comentario` longtext,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_classificacao_produtos` (`produto_id`) USING BTREE,
  KEY `FK_classificacao_users_cliente` (`user_id`) USING BTREE,
  CONSTRAINT `FK_classificacao_produtos` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_classificacao_users_cliente` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.classificacao: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `pessoa_contacto` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `numero_contrato` varchar(30) DEFAULT NULL,
  `data_contrato` date DEFAULT NULL,
  `tipo_conta_corrente` enum('Nacional','Estrangeiro') DEFAULT 'Nacional',
  `conta_corrente` varchar(50) DEFAULT NULL,
  `telefone_cliente` varchar(50) DEFAULT NULL,
  `taxa_de_desconto` double DEFAULT '0',
  `limite_de_credito` double DEFAULT '0',
  `endereco` longtext,
  `gestor_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `nif` varchar(45) DEFAULT NULL,
  `operador` varchar(255) DEFAULT NULL,
  `tipo_cliente_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pais_id` int(10) unsigned NOT NULL,
  `diversos` enum('Sim','Não') DEFAULT 'Não',
  `cidade` varchar(255) DEFAULT NULL,
  `centroCustoId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clientes_gestor` (`gestor_id`),
  KEY `FK_clientes_empresa` (`empresa_id`),
  KEY `FK_clientes_canal` (`canal_id`),
  KEY `FK_clientes_status` (`status_id`),
  KEY `FK_clientes_user` (`user_id`),
  KEY `FK_clientes_pais` (`pais_id`),
  KEY `FK_clientes_operador` (`operador`),
  KEY `FK_clientes_tipos_clientes` (`tipo_cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.clientes: ~26 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `nome`, `uuid`, `pessoa_contacto`, `email`, `website`, `numero_contrato`, `data_contrato`, `tipo_conta_corrente`, `conta_corrente`, `telefone_cliente`, `taxa_de_desconto`, `limite_de_credito`, `endereco`, `gestor_id`, `canal_id`, `status_id`, `nif`, `operador`, `tipo_cliente_id`, `user_id`, `created_by`, `empresa_id`, `created_at`, `updated_at`, `pais_id`, `diversos`, `cidade`, `centroCustoId`) VALUES
	(1, 'Consumidor final', '673dc30a-5cb0-4d9d-be19-aeae663f0c05', NULL, NULL, NULL, NULL, NULL, 'Nacional', '31.1.2.1.1', NULL, 0, 0, NULL, NULL, 2, 1, '999999999', NULL, 2, NULL, NULL, 1, '2021-04-16 10:36:11', '2021-04-16 10:36:11', 1, 'Sim', 'Luanda', NULL),
	(2, 'SCHLUMBERGER LOGELCO, INC', 'c184ca0b-c2ff-4a84-8dc1-120b85cae437', 'SCHLUMBERGER LOGELCO, INC', 'airport.lad@tlc-com.ch', NULL, NULL, '2024-02-03', 'Nacional', '31.1.2.1.2', '932338415', 0, 0, 'TLC Lda', NULL, 2, 1, '999999999', 'Airport Temporary Operator', 2, 1, NULL, 1, '2024-02-03 07:23:34', '2024-02-03 07:23:34', 1, 'Não', 'Luanda', 1),
	(3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'c609441e-438e-468d-a3bf-eadb41f556a2', 'Thomas', 'kingsleychima75@gmail.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.3', '+244923437631', 0, 0, 'Rua Santos Nº18, Bairro Cassenda', NULL, 2, 1, '54176617919', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-06 15:06:06', '2024-02-20 10:18:06', 1, 'Não', 'Luanda', 1),
	(264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', '26f1d557-74d5-453e-8884-415c815971ea', 'Ian Pereira', 'ian.pereira@grupoliz.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.4', '923520471', 0, 0, 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', NULL, 2, 1, '5403084690', 'Milton Lucas', 2, 751, NULL, 1, '2024-02-19 10:11:36', '2024-02-22 12:37:59', 1, 'Não', 'Luanda', 1),
	(265, 'DHL Global Forwarding Angola Ltd', '73ca5753-3193-46a0-bc7d-52b273cc9a5f', 'Ana Pinto', 'anacruz.pinto@dhl.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.5', '948625996', 0, 0, 'Avenida 21 de Janeiro  Aeroporto', NULL, 2, 1, '5401071809', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-19 10:30:35', '2024-02-19 10:30:35', 1, 'Não', 'Luanda', 1),
	(266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'fc7e0fcb-de7a-4fed-81dd-d55d53c500f6', 'Dario Manuel', 'dario.manuel@ao.dsv.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.6', '226422041', 0, 0, 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', NULL, 2, 1, '5403005862', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-20 08:59:35', '2024-02-22 12:40:01', 1, 'Não', 'Luanda', 1),
	(267, 'MULTIFLIGHT LDA', 'c397309b-7a26-4843-80cc-1187089aa8b3', 'Silvestre', 'opsmultiflight@gmail.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.7', '+244933535482', 0, 0, 'Av. Revolução de Outubro, Bloco 47 B-3 Andar', NULL, 2, 1, '5417323659', 'Carlos Sampaio', 2, 750, NULL, 1, '2024-02-20 11:03:01', '2024-02-21 12:24:28', 1, 'Não', 'Luanda', 1),
	(268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'f4678f33-4035-4be4-9de7-861778fe89ba', 'Joana Da Costa ', NULL, NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.8', '+244912505071', 0, 0, 'Rua Fernando Pessoa, Nº52', NULL, 2, 1, '5402032955', 'Milton Lucas', 2, 751, NULL, 1, '2024-02-20 14:35:24', '2024-02-20 14:35:24', 1, 'Não', 'Luanda', 1),
	(269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'd0411628-e892-4030-bc28-229377ee0c1b', 'TAAG', NULL, NULL, NULL, NULL, 'Nacional', '31.1.2.1.9', NULL, 0, 0, NULL, NULL, 2, 1, '5410002830', 'Carlos Sampaio', 2, 750, NULL, 1, '2024-02-26 14:33:52', '2024-02-26 14:33:52', 1, 'Não', 'Luanda', 1),
	(270, 'TLC LDA', '7e170ed0-ffd9-4014-ab96-8d59196140cb', 'Débora Sousa', 'dsousa.an@tlc-com.ch', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.10', '+244 926 515 109', 0, 0, 'Avenida 4 de Fevereiro nº33 Luanda, Angola', NULL, 2, 1, ' 5401146655', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-26 16:43:29', '2024-02-26 16:43:29', 1, 'Não', 'Luanda', 1),
	(271, 'SUPERMARITIME TRANSITÁRIOS LDA', '61d4f97a-b1a8-406e-8595-ce290b4c3707', 'Diogo Lussala', 'dlussala@supermaritime.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.11', '+244936759737', 0, 0, 'Rua das Flores Nº10, Ingombota', NULL, 2, 1, '50000338415', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-27 10:14:22', '2024-02-27 10:14:22', 1, 'Não', 'Luanda', 1),
	(272, 'PONTICELLI ANGOIL', '7d8ca958-3a98-44ea-93a9-d09db329d33e', 'Renato Gois', NULL, NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.12', NULL, 0, 0, 'Av. Comandante Kima-Kyenda, Nº311', NULL, 2, 1, '5403090762', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-27 12:24:18', '2024-02-27 12:24:18', 1, 'Não', 'Luanda', 1),
	(273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', '00a6b73e-98b1-409a-bce9-c0cd0f975210', 'Onésimo dos Santos', NULL, NULL, NULL, NULL, 'Nacional', '31.1.2.1.13', NULL, 0, 0, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', NULL, 2, 1, '5410003667', 'Carlos Sampaio', 1, 750, NULL, 1, '2024-02-27 14:45:07', '2024-02-27 14:45:07', 1, 'Não', 'LUANDA', 1),
	(274, 'BANCO NACIONAL DE ANGOLA - BNA', '0da0d527-2f4c-4d67-8a31-699a76d2d38a', 'Sebastião Banganga', NULL, NULL, NULL, NULL, 'Nacional', '31.1.2.1.14', '+244222679200', 0, 0, NULL, NULL, 2, 1, '7401012332', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-27 15:11:09', '2024-02-27 15:11:09', 1, 'Não', 'Luanda', 1),
	(275, 'ANJANI FOOD & BEVERAGES, LDA', 'ccfd9898-2f8f-4fc7-823c-8cbd6d2d7152', 'Sr. Saturnino', 'logistics@anjanifood.com', NULL, NULL, NULL, 'Nacional', '31.1.2.1.15', '+244 937 395 890', 0, 0, 'Estrada Direita da Funda - Kifangondo', NULL, 2, 1, '5419007835', 'Carlos Sampaio', 1, 750, NULL, 1, '2024-03-01 11:44:26', '2024-03-01 11:44:26', 1, 'Não', 'LUANDA', 1),
	(276, 'VITALIS CHUKWULOTA OZOCHI', '218aeb9d-af44-4998-adcf-9200371aa1ed', 'Sr. Edgar', 'mailto:edgarpedro687@gmail.com', NULL, NULL, NULL, 'Nacional', '31.1.2.1.16', '928434868', 0, 0, 'Sambizanga Casa S Zona 10', NULL, 2, 1, '0000032603', 'Carlos Sampaio', 1, 750, NULL, 1, '2024-03-01 12:53:34', '2024-03-01 12:53:34', 1, 'Não', 'Luanda', 1),
	(277, 'COMPANHIA CASTEL DE BEBIDAS DE LUANDA-CCBL, S.A', '6db1bb9e-670b-4077-857b-bec064a81f7b', 'TEU TRANSITARIO ', NULL, NULL, NULL, '2023-12-17', 'Nacional', '31.1.2.1.17', '923967562', 0, 0, 'RUA N´GOLA KILUANGE Nº370', NULL, 2, 1, '5410000757', 'Milton Lucas', 1, 751, NULL, 1, '2024-03-04 09:52:30', '2024-03-04 09:52:30', 1, 'Não', 'LUANDA', 1),
	(278, 'OPS SERVIÇOS DE PRODUÇÃO DE PETRÓLEOS, LTD', 'e7e791e0-e424-4681-82d0-3e1d6ff98671', 'Sebastião Santos', ' Sebastiao.Santos@sbmoffshore.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.18', '+244939452739', 0, 0, 'Rua Comandante Arguelles, nº 103', NULL, 2, 1, '5402068909', 'Milton Lucas', 1, 751, NULL, 1, '2024-03-04 13:01:36', '2024-03-04 13:01:36', 1, 'Não', 'LUANDA', 1),
	(279, 'SIMPORTEX - COMERCIALIZAÇÃO DE EQUIPAMENTOS M.M', '51344979-a6db-4096-98c9-1c95014fe3a8', 'SIMPORTEX', NULL, NULL, NULL, NULL, 'Nacional', '31.1.2.1.19', NULL, 0, 0, 'RUA RAINHA GINGA Nº 24 - INGOMBOTA', NULL, 2, 1, '5410003519', 'Carlos Sampaio', 1, 750, NULL, 1, '2024-03-04 14:45:55', '2024-03-04 14:45:55', 1, 'Não', 'LUANDA', 1),
	(280, 'INDUSTRIAS TOPACK, LDA', 'e11ee4c9-a80b-4854-804a-4e8a452b4755', 'Emanuel DÁbril', NULL, NULL, NULL, NULL, 'Nacional', '31.1.2.1.20', NULL, 0, 0, 'POLO INDUSTRIA DE VIANA VIA EXPRESSA', NULL, 2, 1, '5417251135', 'Milton Lucas', 1, 751, NULL, 1, '2024-03-05 10:54:25', '2024-03-05 10:54:25', 1, 'Não', 'LUANDA', 1),
	(281, 'ASCO ANGOLAN SERVICES COMPANY', '8defd71f-d9d7-4e64-8d03-701a7993eab4', 'OLICARGO LDA', 'nelson.costa@olicargo.com', NULL, NULL, NULL, 'Nacional', '31.1.2.1.21', '+244926671315', 0, 0, 'RUA EMILIO M BINDI N 9/11', NULL, 2, 1, '5417219770', 'Milton Lucas', 1, 751, NULL, 1, '2024-03-05 13:14:44', '2024-03-05 13:14:44', 1, 'Não', 'LUANDA', 1),
	(282, 'BESTFLY, LDA', '525e6809-802c-4ee2-ab01-1dc1ec862efc', 'Julia Ornelas', 'ops@bestfly.aero', 'www.bestfly.aero', NULL, NULL, 'Nacional', '31.1.2.1.22', '+244925928831', 0, 0, 'AV. 21 DE JANEIRO-AEROPORTO 4 DE FEVEREIRO', NULL, 2, 1, '5417077976', 'Milton Lucas', 1, 751, NULL, 1, '2024-03-06 13:08:03', '2024-03-06 13:08:03', 1, 'Não', 'LUANDA', 1),
	(283, 'MANUEL GOMES PACA', 'f28924d4-5cc6-478f-a37a-4aa2f7481263', 'MANUEL GOMES PACA', NULL, NULL, NULL, NULL, 'Nacional', '31.1.2.1.23', NULL, 0, 0, 'CASA S Nº ZONA A CABINDA', NULL, 2, 1, '000107432CA014', 'Carlos Sampaio', 1, 750, NULL, 1, '2024-03-07 12:45:46', '2024-03-07 12:45:46', 1, 'Não', 'CABINDA', 1),
	(284, 'NOCEBO SA', 'e912006a-4502-4a61-9210-0e455de04ff4', 'Arlindo Sampaio', 'angelino@castel-afrique.com', NULL, NULL, NULL, 'Nacional', '31.1.2.1.24', '937 393 718', 0, 0, 'RUA CONEGO MANUEL DAS NEVES NR 403', NULL, 2, 1, '5410777832', 'Carlos Sampaio', 1, 750, NULL, 1, '2024-03-11 11:51:40', '2024-03-11 11:51:40', 1, 'Não', 'LUANDA - ANGOLA', 1),
	(285, 'Kuehne e Nagel (Angola) Transitarios, LDA', 'f251c371-b91c-45c0-9d2f-274c623d9d1d', 'Kuehne-nagel', 'knao.pagamentos@kuehne-nagel.com', NULL, NULL, NULL, 'Nacional', '31.1.2.1.25', '946 901 469', 0, 0, 'Rua Rainha Ginga, Nº 29, Edifício Elisée Trade Center 16º Andar, Distrito Urbano da Ingombota', NULL, 2, 1, '5403088504', 'Carlos Sampaio', 1, 750, NULL, 1, '2024-03-11 15:39:47', '2024-03-11 15:39:47', 1, 'Não', 'LUANDA', 1),
	(286, 'YAPAMA SAÚDE, LDA', '579deb9b-5329-4239-91d0-d500bdbd3751', 'Naftali Miguel', NULL, NULL, NULL, NULL, 'Nacional', '31.1.2.1.26', '+244932102227', 0, 0, 'Belas Business Park, Edifício Cabinda Nº304', NULL, 2, 1, '5417163783', 'Milton Lucas', 1, 751, NULL, 1, '2024-03-12 13:27:18', '2024-03-12 13:27:18', 1, 'Não', 'LUANDA', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.comunas
CREATE TABLE IF NOT EXISTS `comunas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `statusId` int(11) NOT NULL DEFAULT '1',
  `municipioId` int(11) NOT NULL,
  `valor_entrega` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.comunas: ~50 rows (aproximadamente)
INSERT INTO `comunas` (`id`, `designacao`, `statusId`, `municipioId`, `valor_entrega`) VALUES
	(1, 'Vila Verde', 1, 2, 9000),
	(2, 'Barra Do Kwanza', 1, 2, 20000),
	(3, 'Ramiros ', 1, 2, 15000),
	(4, 'Quenguela ', 1, 2, 20000),
	(5, 'Morro Dos Veados', 1, 2, 15000),
	(6, 'Cabolombo', 1, 2, 7000),
	(7, 'Kilamba', 1, 2, 4000),
	(8, 'Muxima ', 1, 3, 20000),
	(9, 'Demba Chio ', 1, 3, 20000),
	(10, 'Quixinge ', 1, 3, 20000),
	(11, 'Mumbondo ', 1, 3, 20000),
	(12, 'Cabo Ledo ', 1, 3, 30000),
	(13, 'Funda', 1, 4, 15000),
	(14, 'Kikolo', 1, 4, 15000),
	(15, 'Cacuaco ', 1, 4, 10000),
	(16, 'Mulenvos De Baixo', 1, 4, 10000),
	(17, 'Sequele', 1, 4, 5000),
	(18, 'Golfe I ', 1, 5, 10000),
	(19, 'Golfe Ii', 1, 5, 8000),
	(20, 'Sapú', 1, 5, 7000),
	(21, 'Palanca', 1, 5, 5000),
	(22, 'Nova Vida ', 1, 5, 10000),
	(23, 'Cazenga Sede', 1, 6, 5000),
	(24, 'Tala Hady', 1, 6, 5000),
	(25, ' Hoji Ya Henda', 1, 6, 9000),
	(26, '11 De Novembro', 1, 6, 7000),
	(27, 'Quima Kieza', 1, 6, 8000),
	(28, 'Kalawenda', 1, 6, 6000),
	(29, 'Calumbo ', 1, 7, 15000),
	(30, 'Vila Flor', 1, 7, 6000),
	(31, 'Zango 1, 2, 3, 4', 1, 7, 5000),
	(32, ' Baia ', 1, 7, 15000),
	(33, 'Quicuxi', 1, 7, 2000),
	(34, 'Estalagem', 1, 7, 4000),
	(35, 'Viana', 1, 7, 5000),
	(36, 'Vila Sede', 1, 7, 2000),
	(37, 'Zango 0', 1, 7, 3000),
	(38, 'Cassoneca ', 1, 8, 25000),
	(39, 'Cabiri', 1, 8, 25000),
	(40, 'Bom Jesus ', 1, 8, 20000),
	(41, 'Caculo ', 1, 8, 25000),
	(42, 'Cahango', 1, 8, 25000),
	(43, 'Quiminha', 1, 8, 25000),
	(44, 'Mussulo', 1, 9, 50000),
	(45, 'Benfica', 1, 9, 10000),
	(46, 'Futungo', 1, 9, 15000),
	(47, 'Lar Do Patriota ', 1, 9, 12000),
	(48, 'Talatona', 1, 9, 15000),
	(49, 'Camama', 1, 9, 4000),
	(50, 'Cidade Universitária', 1, 9, 3000);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.contactos
CREATE TABLE IF NOT EXISTS `contactos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_contacto_id` int(10) unsigned NOT NULL,
  `designacao` varchar(45) NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contactos_empresa` (`empresa_id`),
  KEY `FK_contactos_tipo_contacto` (`tipo_contacto_id`),
  KEY `FK_contactos_canal` (`canal_id`),
  CONSTRAINT `FK_contactos_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_contactos_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_contactos_tipo_contacto` FOREIGN KEY (`tipo_contacto_id`) REFERENCES `tipos_contactos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.contactos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.coupon_desconto
CREATE TABLE IF NOT EXISTS `coupon_desconto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `percentagem` int(11) NOT NULL,
  `used` enum('Y','N') NOT NULL DEFAULT 'N',
  `data_expiracao` datetime NOT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.coupon_desconto: ~3 rows (aproximadamente)
INSERT INTO `coupon_desconto` (`id`, `codigo`, `percentagem`, `used`, `data_expiracao`, `empresa_id`, `created_at`, `updated_at`) VALUES
	(9, 'P29EN2023/1', 50, 'N', '2023-06-17 08:03:00', 53, '2023-06-13 07:06:12', '2023-06-13 07:06:12'),
	(10, '3TZI92023/10', 10, 'N', '2023-06-28 11:22:00', 53, '2023-06-27 11:22:19', '2023-06-27 11:22:19'),
	(11, 'BR0VO2023/11', 30, 'N', '2023-07-22 16:17:00', 53, '2023-07-20 16:17:25', '2023-07-20 16:17:25');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.documento_anulados
CREATE TABLE IF NOT EXISTS `documento_anulados` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `factura_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `recibo_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `tipo_user_id` int(10) unsigned NOT NULL,
  `tipo_documento` int(10) unsigned NOT NULL,
  `descricao` text NOT NULL,
  `hash` varchar(255) NOT NULL,
  `numSequenciaNotaCredito` int(11) unsigned DEFAULT '0',
  `numeracaoNotaCredito` varchar(255) NOT NULL,
  `nome_do_cliente` varchar(255) DEFAULT NULL,
  `telefone_cliente` varchar(255) DEFAULT NULL,
  `nif_cliente` varchar(255) DEFAULT NULL,
  `email_cliente` varchar(255) DEFAULT NULL,
  `endereco_cliente` varchar(255) DEFAULT NULL,
  `conta_corrente_cliente` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_documento_anulados_clientes` (`cliente_id`),
  KEY `FK_documento_anulados_empresas` (`empresa_id`),
  KEY `FK_documento_anulados_facturas` (`factura_id`),
  KEY `FK_documento_anulados_recibos` (`recibo_id`),
  KEY `FK_documento_anulados_tipo_users` (`tipo_user_id`),
  KEY `FK_documento_anulados_tipo_documentos` (`tipo_documento`),
  CONSTRAINT `FK_documento_anulados_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_documento_anulados_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_documento_anulados_facturas` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `FK_documento_anulados_recibos` FOREIGN KEY (`recibo_id`) REFERENCES `recibos` (`id`),
  CONSTRAINT `FK_documento_anulados_tipo_documentos` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_documentos` (`id`),
  CONSTRAINT `FK_documento_anulados_tipo_users` FOREIGN KEY (`tipo_user_id`) REFERENCES `tipo_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.documento_anulados: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.empresas
CREATE TABLE IF NOT EXISTS `empresas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `pessoal_Contacto` varchar(255) DEFAULT NULL,
  `telefone1` varchar(255) DEFAULT NULL,
  `telefone2` varchar(255) DEFAULT NULL,
  `endereco` longtext NOT NULL,
  `pais_id` int(10) unsigned NOT NULL,
  `saldo` double DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `nif` varchar(45) NOT NULL,
  `gestor_cliente_id` int(10) unsigned DEFAULT NULL,
  `tipo_cliente_id` int(10) unsigned DEFAULT NULL,
  `tipo_regime_id` int(10) unsigned DEFAULT NULL,
  `logotipo` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  `referencia` varchar(145) DEFAULT NULL,
  `pessoa_de_contacto` varchar(145) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cidade` varchar(255) DEFAULT NULL,
  `file_alvara` varchar(255) DEFAULT NULL,
  `file_nif` varchar(255) DEFAULT NULL,
  `venda_online` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  UNIQUE KEY `pessoal_Contacto` (`pessoal_Contacto`),
  UNIQUE KEY `referencia` (`referencia`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_empresas_pais` (`pais_id`),
  KEY `FK_empresas_canal` (`canal_id`),
  KEY `FK_empresas_status` (`status_id`),
  KEY `FK_empresas_gestor` (`gestor_cliente_id`),
  KEY `FK_empresas_tipo` (`tipo_cliente_id`),
  KEY `FK_empresas_tipos_regimes` (`tipo_regime_id`),
  CONSTRAINT `FK_empresas_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_empresas_pais` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`),
  CONSTRAINT `FK_empresas_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_empresas_tipos_regimes` FOREIGN KEY (`tipo_regime_id`) REFERENCES `tipos_regimes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.empresas: ~0 rows (aproximadamente)
INSERT INTO `empresas` (`id`, `nome`, `pessoal_Contacto`, `telefone1`, `telefone2`, `endereco`, `pais_id`, `saldo`, `canal_id`, `status_id`, `nif`, `gestor_cliente_id`, `tipo_cliente_id`, `tipo_regime_id`, `logotipo`, `website`, `email`, `referencia`, `pessoa_de_contacto`, `created_at`, `updated_at`, `cidade`, `file_alvara`, `file_nif`, `venda_online`) VALUES
	(1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, NULL, NULL, 'Estrada nacional 230, km 42 - Municipio do Icolo e Bengo, Distrito  do Bom Jesus, Luanda-Angola', 1, 0, 2, 1, '5001720538', 1, 1, 1, 'utilizadores/cliente/JJrSt5wmg5kz8MOFW4WULbFYkQSOQvxE8mB3Nprm.png', 'ato.ao', 'info@ato.ao', '4EEJFPK', NULL, '2024-01-23 16:10:54', '2024-01-23 16:10:54', 'Luanda', NULL, NULL, 'N');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.entradas_stocks
CREATE TABLE IF NOT EXISTS `entradas_stocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_factura_fornecedor` date NOT NULL,
  `fornecedor_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `forma_pagamento_id` int(10) unsigned NOT NULL,
  `tipo_user_id` int(10) unsigned DEFAULT NULL,
  `num_factura_fornecedor` varchar(45) DEFAULT NULL,
  `descricao` text,
  `total_compras` double DEFAULT NULL,
  `totalSemImposto` double DEFAULT '0',
  `total_venda` double DEFAULT NULL,
  `total_iva` double DEFAULT NULL,
  `total_desconto` double DEFAULT NULL,
  `total_retencao` double DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `statusPagamento` int(10) unsigned NOT NULL DEFAULT '2' COMMENT '1=>Pago 2=>Não pago',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `armazem_id` int(10) unsigned NOT NULL,
  `totalLucro` double DEFAULT NULL,
  `operador` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_entradas_stocks_user` (`user_id`),
  KEY `FK_entradas_stocks_canal` (`canal_id`),
  KEY `FK_entradas_stocks_status` (`status_id`),
  KEY `FK_entradas_stocks_fornecedor` (`fornecedor_id`),
  KEY `FK_entradas_stocks_forma_pagamento` (`forma_pagamento_id`),
  KEY `FK_entradas_stocks_tipo_users` (`tipo_user_id`),
  KEY `FK_entradas_stocks_armazens` (`armazem_id`),
  KEY `FK_entradas_stocks_empresas` (`empresa_id`),
  CONSTRAINT `FK_entradas_stocks_armazens` FOREIGN KEY (`armazem_id`) REFERENCES `armazens` (`id`),
  CONSTRAINT `FK_entradas_stocks_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_entradas_stocks_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_entradas_stocks_forma_pagamento` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `formas_pagamentos_geral` (`id`),
  CONSTRAINT `FK_entradas_stocks_fornecedor` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`),
  CONSTRAINT `FK_entradas_stocks_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_entradas_stocks_tipo_users` FOREIGN KEY (`tipo_user_id`) REFERENCES `tipo_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.entradas_stocks: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.entradas_stock_items
CREATE TABLE IF NOT EXISTS `entradas_stock_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entrada_stock_id` int(10) unsigned NOT NULL,
  `produto_id` int(10) unsigned NOT NULL,
  `preco_compra` double NOT NULL,
  `preco_venda` double NOT NULL,
  `descontoValor` double DEFAULT '0',
  `descontoPerc` int(11) NOT NULL DEFAULT '0',
  `quantidade` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lucroUnitario` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_entradas_stock_items_produto` (`produto_id`),
  KEY `FK_entradas_stock` (`entrada_stock_id`),
  CONSTRAINT `FK_entradas_stock` FOREIGN KEY (`entrada_stock_id`) REFERENCES `entradas_stocks` (`id`),
  CONSTRAINT `FK_entradas_stock_items_produto` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.entradas_stock_items: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.especificacao_mercadorias
CREATE TABLE IF NOT EXISTS `especificacao_mercadorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` text NOT NULL,
  `desconto` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.especificacao_mercadorias: ~10 rows (aproximadamente)
INSERT INTO `especificacao_mercadorias` (`id`, `designacao`, `desconto`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Ordinária com isenção', 0, 1, '2024-01-30 13:50:46', '2024-02-13 01:26:18'),
	(2, 'Moedas estrangeiras, quando importadas pelo Estado', 100, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(3, 'Malas diplomáticas, cargas de serviço destinadas às companhias aéreas, quando devidamente identificadas, desde que não exceda os 200 Kgs, por contra-marca fiscal', 100, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(4, 'Urnas contendo cadáveres', 100, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(5, 'Vacinas, produtos químicos hospitalares, destinados a entidades de assistência filantrópicas, reconhecidas como de utilidade pública e sem fins lucrativos', 50, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(6, 'Livros didácticos, revistas e publicações técnicas estrangeiras, equipamentos e acessórios, recebidas por doação directa do exportador, destinadas a entidades educacionais, culturais ou científicas, para aplicação em programas de assistência ao ensino, sem fins lucrativos.', 50, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(7, 'Material médico, equipamento hospitalar e acessórios, remédios, amostras de vírus, vacinas, ou outro tipo de mercadorias, quando destinados PNUD - Programa das Nações Unidas para o Desenvolvimento, para cumprimentos de convénios, acordos e convenções, referenciados pelo Ministério das Relações Exteriores.', 50, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(8, 'Mercadorias e materiais importados destinados a serviços necessários à segurança nacional ou por comprovada exigência do bem comum.', 50, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(9, 'Roupas usadas, livros e material didáctico, de cidadãos nacionais, quando de regresso ao país no cumprimento de missão diplomática ou de formação.', 50, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(10, 'Ordinária sem isenção', 100, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.existencias_stocks
CREATE TABLE IF NOT EXISTS `existencias_stocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int(10) unsigned NOT NULL,
  `armazem_id` int(10) unsigned NOT NULL,
  `tipo_stocagem_id` int(10) unsigned DEFAULT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observacao` text,
  PRIMARY KEY (`id`),
  KEY `FK_existencias_produto` (`produto_id`),
  KEY `FK_existencias_armazem` (`armazem_id`),
  KEY `FK_existencias_canal` (`canal_id`),
  KEY `FK_existencias_user` (`user_id`),
  KEY `FK_existencias_status` (`status_id`),
  KEY `FK_existencias_empresa` (`empresa_id`),
  KEY `FK_existencias_stocks_tipos_stocagens` (`tipo_stocagem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.existencias_stocks: ~30 rows (aproximadamente)
INSERT INTO `existencias_stocks` (`id`, `produto_id`, `armazem_id`, `tipo_stocagem_id`, `quantidade`, `canal_id`, `user_id`, `status_id`, `empresa_id`, `created_at`, `updated_at`, `observacao`) VALUES
	(1, 1, 1, NULL, 0, 2, 1, 1, 1, '2024-02-02 02:35:27', '2024-02-02 02:35:28', NULL),
	(2, 2, 1, NULL, 0, 2, 1, 1, 1, '2024-02-02 02:35:27', '2024-02-02 02:35:28', NULL),
	(3, 3, 1, NULL, 0, 2, 1, 1, 1, '2024-02-02 02:35:27', '2024-02-02 02:35:28', NULL),
	(4, 4, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:18:57', '2024-02-03 09:18:57', NULL),
	(5, 5, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:19:20', '2024-02-03 09:19:20', NULL),
	(6, 6, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:20:19', '2024-02-03 09:20:19', NULL),
	(7, 7, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:20:35', '2024-02-03 09:20:35', NULL),
	(8, 8, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(9, 9, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(10, 10, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(11, 11, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(12, 12, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(13, 13, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(14, 14, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(15, 15, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(16, 16, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(17, 17, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(18, 18, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(19, 19, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(20, 20, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(21, 21, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(22, 22, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(23, 23, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(24, 24, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(25, 25, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(26, 26, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(27, 27, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(28, 28, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(29, 29, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL),
	(30, 30, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.fabricantes
CREATE TABLE IF NOT EXISTS `fabricantes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diversos` enum('Não','Sim') DEFAULT 'Não',
  `tipo_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fabricantes_empresa` (`empresa_id`),
  KEY `FK_fabricantes_canal` (`canal_id`),
  KEY `FK_fabricantes_user` (`user_id`),
  KEY `FK_fabricantes_status` (`status_id`),
  KEY `FK_fabricantes_tipo_users` (`tipo_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.fabricantes: ~0 rows (aproximadamente)
INSERT INTO `fabricantes` (`id`, `designacao`, `empresa_id`, `user_id`, `canal_id`, `status_id`, `created_at`, `updated_at`, `diversos`, `tipo_user_id`) VALUES
	(1, 'DIVERSOS', 1, 1, 2, 1, '2024-01-23 16:10:54', '2024-01-23 16:10:54', 'Sim', 2);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `texto_hash` varchar(345) DEFAULT NULL,
  `codigo_moeda` int(10) unsigned DEFAULT '1',
  `clienteId` int(10) unsigned DEFAULT '1',
  `nome_do_cliente` varchar(145) DEFAULT NULL,
  `nomeProprietario` varchar(255) DEFAULT NULL,
  `telefone_cliente` varchar(145) DEFAULT NULL,
  `nif_cliente` varchar(145) DEFAULT NULL,
  `email_cliente` varchar(145) DEFAULT NULL,
  `endereco_cliente` varchar(255) DEFAULT NULL,
  `tipo_documento` int(11) unsigned NOT NULL,
  `numSequenciaFactura` bigint(20) unsigned DEFAULT NULL,
  `numeracaoFactura` varchar(255) DEFAULT NULL,
  `numeracaoProforma` varchar(50) DEFAULT NULL,
  `hashValor` text,
  `cliente_id` int(10) unsigned DEFAULT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `centroCustoId` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `operador` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `paisOrigemId` int(11) DEFAULT NULL,
  `cartaDePorte` varchar(255) DEFAULT NULL,
  `tipoDeAeronave` varchar(255) DEFAULT NULL,
  `pesoMaximoDescolagem` double DEFAULT '0',
  `dataDeAterragem` date DEFAULT NULL,
  `dataDeDescolagem` date DEFAULT NULL,
  `horaDeAterragem` time DEFAULT NULL,
  `horaDeDescolagem` time DEFAULT NULL,
  `horaEstacionamento` int(11) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `dataEntrada` datetime DEFAULT NULL,
  `dataSaida` datetime DEFAULT NULL,
  `nDias` int(11) DEFAULT NULL,
  `taxaIva` double DEFAULT NULL,
  `cambioDia` double DEFAULT NULL,
  `moeda` varchar(50) DEFAULT NULL,
  `moedaPagamento` varchar(50) DEFAULT NULL,
  `horaExtra` int(11) DEFAULT NULL,
  `contraValor` double DEFAULT '0',
  `valorIliquido` double DEFAULT '0',
  `valorImposto` double DEFAULT '0',
  `total` double DEFAULT '0',
  `codigoBarra` varchar(255) DEFAULT NULL,
  `tipoDocumento` int(11) DEFAULT NULL,
  `formaPagamentoId` int(11) DEFAULT '1',
  `tipoOperacao` int(11) DEFAULT NULL COMMENT '1=>Importação, 2=>Exportação',
  `isencaoIVA` enum('Y','N') DEFAULT 'N',
  `convertido` enum('Y','N') DEFAULT 'N',
  `anulado` enum('Y','N') DEFAULT 'N',
  `taxaRetencao` double DEFAULT '0',
  `valorRetencao` double DEFAULT '0',
  `tipoFatura` int(11) DEFAULT NULL,
  `tipoMercadoria` int(11) DEFAULT NULL,
  `observacao` text,
  PRIMARY KEY (`id`),
  KEY `FK_facturas_clientes` (`cliente_id`),
  KEY `FK_facturas_empresas` (`empresa_id`),
  KEY `FK_facturas_moedas` (`codigo_moeda`),
  KEY `FK_facturas_tipo_documentos` (`tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.facturas: ~173 rows (aproximadamente)
INSERT INTO `facturas` (`id`, `texto_hash`, `codigo_moeda`, `clienteId`, `nome_do_cliente`, `nomeProprietario`, `telefone_cliente`, `nif_cliente`, `email_cliente`, `endereco_cliente`, `tipo_documento`, `numSequenciaFactura`, `numeracaoFactura`, `numeracaoProforma`, `hashValor`, `cliente_id`, `empresa_id`, `centroCustoId`, `user_id`, `operador`, `created_at`, `updated_at`, `paisOrigemId`, `cartaDePorte`, `tipoDeAeronave`, `pesoMaximoDescolagem`, `dataDeAterragem`, `dataDeDescolagem`, `horaDeAterragem`, `horaDeDescolagem`, `horaEstacionamento`, `peso`, `dataEntrada`, `dataSaida`, `nDias`, `taxaIva`, `cambioDia`, `moeda`, `moedaPagamento`, `horaExtra`, `contraValor`, `valorIliquido`, `valorImposto`, `total`, `codigoBarra`, `tipoDocumento`, `formaPagamentoId`, `tipoOperacao`, `isencaoIVA`, `convertido`, `anulado`, `taxaRetencao`, `valorRetencao`, `tipoFatura`, `tipoMercadoria`, `observacao`) VALUES
	(93, '2024-02-19;2024-02-19T12:26:13;FR ATO2023/1;330690.80;', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICE INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 1, 'FR ATO2023/1', NULL, 'hsMflQ+WND19r329LmvPNPvK06+03b/39ldcEv7IJP7reIhyvURL/TrMhA4EeMtgnz3uljufpGteUldGjVYVUZY0XgWTUX5NkIM/+pRuA48CJ9V1c1ya+x1zMHFeLgG1ASBESPbShXWoanISd/bTRgPQ21W08sch5WiqaNFrHyw=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-19 12:26:13', '2024-02-19 12:26:13', NULL, 'CVK-0001-3304', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2500, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 399, 290079.65, 40611.151, 330690.801, '100026593751', 1, 4, 1, 'N', 'N', 'Y', 0, 0, 1, 1, 'Referente a Nota de Preço Nº001'),
	(94, '2024-02-19;2024-02-19T12:36:25;FR ATO2023/2;330690.80;hsMflQ+WND19r329LmvPNPvK06+03b/39ldcEv7IJP7reIhyvURL/TrMhA4EeMtgnz3uljufpGteUldGjVYVUZY0XgWTUX5NkIM/+pRuA48CJ9V1c1ya+x1zMHFeLgG1ASBESPbShXWoanISd/bTRgPQ21W08sch5WiqaNFrHyw=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SHLUMBERGER TECHNICAL SERVICE INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 2, 'FR ATO2023/2', NULL, 'VcMp3rpXBBdGmgZkp6Tmr98FI69FSGCVZHa4Ak3IZQ8OL0c7UUYhxEcQ4ZP4CjPFFteba2XBjxaNJ6OwY2Fa2Oxg8jiVwgWCp5No53dxYClMHLlfFM0ZcrBBFJlaID4UIzqUE5uOn5yVnz+sRxFYIYaDBY1Zcgcjr2a+XX7OXFc=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-19 12:36:25', '2024-02-19 12:36:25', NULL, 'CVK-0001-3293', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2500, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 399, 290079.65, 40611.151, 330690.801, '100026594751', 1, 4, 1, 'N', 'N', 'Y', 0, 0, 1, 1, 'Referente a Nota de Preço Nº 002'),
	(95, '2024-02-19;2024-02-19T12:47:50;FR ATO2023/3;330690.80;VcMp3rpXBBdGmgZkp6Tmr98FI69FSGCVZHa4Ak3IZQ8OL0c7UUYhxEcQ4ZP4CjPFFteba2XBjxaNJ6OwY2Fa2Oxg8jiVwgWCp5No53dxYClMHLlfFM0ZcrBBFJlaID4UIzqUE5uOn5yVnz+sRxFYIYaDBY1Zcgcjr2a+XX7OXFc=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICE INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 3, 'FR ATO2023/3', NULL, 'mVJAH3Y/U52lY7rGCTreCMvIgky77PguwKsuOsPFaIVNYdDOXntc7HYW90pDd/SpQYXS/4/LiMaX1y/JQYddfUjVNaBSAHqZTNmeqVI5DfF22i6MCm9DCw97m42UBz72821+FFzgO7l1MfQhhf5kTgbXL2sO+pdAO7smRcCtp+U=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-19 12:47:50', '2024-02-19 12:47:50', NULL, 'CVK-0001-3326', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2500, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 399, 290079.65, 40611.151, 330690.801, '100026595750', 1, 4, 1, 'N', 'N', 'Y', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 003'),
	(96, '2024-02-19;2024-02-19T12:58:12;FR ATO2023/4;529105.28;mVJAH3Y/U52lY7rGCTreCMvIgky77PguwKsuOsPFaIVNYdDOXntc7HYW90pDd/SpQYXS/4/LiMaX1y/JQYddfUjVNaBSAHqZTNmeqVI5DfF22i6MCm9DCw97m42UBz72821+FFzgO7l1MfQhhf5kTgbXL2sO+pdAO7smRcCtp+U=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICE INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 4, 'FR ATO2023/4', NULL, 'wH86uLcLQveaZ6liY1wQmfCFMIgacjgqQ/a0J+pRGNpMpfd+7xg+VDPTu9pNKSMDqc+CgJ7AWwoOJPFBcqpA4v8XFNvmBFlCugd9CyGZBSFAUzTKqNJToHaDUQLh0Q22ENXofKPZKaxGB1ho/3vPtJVObmIIag2QA6IPWRngGlk=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-19 12:58:12', '2024-02-19 12:58:12', NULL, 'CVK-0001-3184', NULL, 0, NULL, NULL, NULL, NULL, NULL, 4000, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 638.4, 464127.44, 64977.8416, 529105.2816, '100026596750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 004'),
	(97, '2024-02-19;2024-02-19T13:13:04;FR ATO2023/5;926727.90;wH86uLcLQveaZ6liY1wQmfCFMIgacjgqQ/a0J+pRGNpMpfd+7xg+VDPTu9pNKSMDqc+CgJ7AWwoOJPFBcqpA4v8XFNvmBFlCugd9CyGZBSFAUzTKqNJToHaDUQLh0Q22ENXofKPZKaxGB1ho/3vPtJVObmIIag2QA6IPWRngGlk=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICE INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 5, 'FR ATO2023/5', NULL, 'O3Gwoa8+chtGiPRhJX7PdNcMLTJPT2NwXbf/VI9YVZF/dRLIJDbbY1iK5riheXHEiVjnqXxnKWSEBdn/c/K70g5Brl5Ju6X8/kvmrRxrQgXm3rpihm1VSdSGod1X5bDdp72giWrhD4TviIf7x3bChlYU+7SlyWPVhn+JxzgnpTw=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-19 13:13:04', '2024-02-19 13:13:04', NULL, 'CVK-0001-3255', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7006, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 1118.1576, 812919.21116, 113808.6895624, 926727.9007224, '100026597750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 005'),
	(98, '2024-02-21;2024-02-21T12:19:57;FR ATO2023/6;3245792.43;O3Gwoa8+chtGiPRhJX7PdNcMLTJPT2NwXbf/VI9YVZF/dRLIJDbbY1iK5riheXHEiVjnqXxnKWSEBdn/c/K70g5Brl5Ju6X8/kvmrRxrQgXm3rpihm1VSdSGod1X5bDdp72giWrhD4TviIf7x3bChlYU+7SlyWPVhn+JxzgnpTw=', 1, 267, 'MULTIFLIGHT LDA', 'VULKAN AIR', '+244933535482', '5417323659', 'opsmultiflight@gmail.com', 'Avenida Revolução de Outubro, Bloco 47 B - 3 Andar', 1, 6, 'FR ATO2023/6', NULL, 't2src3alVGswPTWbNDyppksxYIOIv2gQfpqjTAanC28EUG7g0TBhcy3B5Hij/F/lKDOvR+0cPvE82gO9OKDD/FOPA+HZFSMlLwa5f6MnTlfFwTOJoCaweIbGsJN5KV2ix0SJP37iY1xsgJqbOhqhGhajuLChgxt4r/Xt8NgCgx0=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-21 12:19:57', '2024-02-21 12:19:57', NULL, NULL, 'ANTONOV12 UR-CAJ', 61, '2023-12-24', '2023-12-28', '18:30:00', '11:57:00', NULL, 1326, NULL, NULL, NULL, 14, 828.799205, 'USD', 'AOA', 1, 3916.2591, 2847186.3409246, 398606.08772944, 3245792.428654, '100026798750', 1, 4, NULL, 'N', 'N', 'Y', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 006'),
	(99, '2024-02-21;2024-02-21T12:37:42;FR ATO2023/7;264552.64;t2src3alVGswPTWbNDyppksxYIOIv2gQfpqjTAanC28EUG7g0TBhcy3B5Hij/F/lKDOvR+0cPvE82gO9OKDD/FOPA+HZFSMlLwa5f6MnTlfFwTOJoCaweIbGsJN5KV2ix0SJP37iY1xsgJqbOhqhGhajuLChgxt4r/Xt8NgCgx0=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 7, 'FR ATO2023/7', NULL, 'wccXw3X0ccfsJF/1YI90gwulsfXUBkqqW1rLtns6v3e6QwtVpHNn6ok2Ev/yIfRelknLofjmoh9VlOjRUq/SMNlbqknnNSdJM+ux2WqdwYrP5EdY+uxowbxLjmATvHV48ti55YtkVlbcMOQWMilHaiTdXpn8RR2UPTArXx3OhG8=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-21 12:37:42', '2024-02-21 12:37:42', NULL, 'CVK-0001-3424', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2000, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 319.2, 232063.72, 32488.9208, 264552.6408, '100026599750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 007'),
	(100, '2024-02-21;2024-02-21T12:43:29;FR ATO2023/8;529105.28;wccXw3X0ccfsJF/1YI90gwulsfXUBkqqW1rLtns6v3e6QwtVpHNn6ok2Ev/yIfRelknLofjmoh9VlOjRUq/SMNlbqknnNSdJM+ux2WqdwYrP5EdY+uxowbxLjmATvHV48ti55YtkVlbcMOQWMilHaiTdXpn8RR2UPTArXx3OhG8=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 8, 'FR ATO2023/8', NULL, 'PrGR2O0UapRsEM76eV85ydPwdCjNc1AEPTNgYw2oQNi5HuxYhL4r141HpmQVMWFN6QzOra3Rnm3XLPFQkOovSi+eQkVRVWmStHpOJmZ7vX25zVKiE2OHd/diPNnypINwNXHCqT8JHqjX+K76jy0Xd51Msj8GOB+7ieIJ8M+Saqg=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-21 12:43:29', '2024-02-21 12:43:29', NULL, 'CVK-0001-3184', NULL, 0, NULL, NULL, NULL, NULL, NULL, 4000, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 638.4, 464127.44, 64977.8416, 529105.2816, '1000265100750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 008'),
	(101, '2024-02-21;2024-02-21T12:46:16;FR ATO2023/9;238097.38;PrGR2O0UapRsEM76eV85ydPwdCjNc1AEPTNgYw2oQNi5HuxYhL4r141HpmQVMWFN6QzOra3Rnm3XLPFQkOovSi+eQkVRVWmStHpOJmZ7vX25zVKiE2OHd/diPNnypINwNXHCqT8JHqjX+K76jy0Xd51Msj8GOB+7ieIJ8M+Saqg=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 9, 'FR ATO2023/9', NULL, 'pQs2850mhxnMcTQGPb1IEX94Oz0YBqSP7G/CVQEg2H1wlhtJmytZ+0+fntg9fxLI2f3wKd0TPVkwS3uxwQxpSHEnQg0aWrOoUsUphLBraB8k8pc0kLWVq7msSC2k7xHMzWQSPDFlwYjWehcHDX0Dr7vFaLoxeXOJ7UdEXp+Z1os=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-21 12:46:16', '2024-02-21 12:46:16', NULL, 'CVK-0001-3446', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1800, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 287.28, 208857.348, 29240.02872, 238097.37672, '1000265101750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 009'),
	(102, '2024-02-21;2024-02-21T12:49:33;FR ATO2023/10;264552.64;pQs2850mhxnMcTQGPb1IEX94Oz0YBqSP7G/CVQEg2H1wlhtJmytZ+0+fntg9fxLI2f3wKd0TPVkwS3uxwQxpSHEnQg0aWrOoUsUphLBraB8k8pc0kLWVq7msSC2k7xHMzWQSPDFlwYjWehcHDX0Dr7vFaLoxeXOJ7UdEXp+Z1os=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 10, 'FR ATO2023/10', NULL, 'iTySCabJNAdPLGcM/E5mA1+6SZH6qIhNsNs4fPXJ8N5NWO51c+lB1Kmx8QDLqvixlN56RZp0PfCMRH+fkWX4p+IT8oCTC3SzmbsR9t1U9TkzumwQBLWILeN0RyjYRxp5YY/u2dXxckR7M9VxPP3+vAmmV0v4b141VVKdVuKyzuw=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-21 12:49:33', '2024-02-21 12:49:33', NULL, 'CVK-0001-3342', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2000, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 319.2, 232063.72, 32488.9208, 264552.6408, '1000265102750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 010'),
	(103, '2024-02-21;2024-02-21T13:01:40;FR ATO2023/11;107276.10;iTySCabJNAdPLGcM/E5mA1+6SZH6qIhNsNs4fPXJ8N5NWO51c+lB1Kmx8QDLqvixlN56RZp0PfCMRH+fkWX4p+IT8oCTC3SzmbsR9t1U9TkzumwQBLWILeN0RyjYRxp5YY/u2dXxckR7M9VxPP3+vAmmV0v4b141VVKdVuKyzuw=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 11, 'FR ATO2023/11', NULL, 'IzkqT5b0bSji7he4lWTQZg45U02txm/zFxKl03b4YgeyWu79CyK7z1sijkUe+DbdwyphrZKs9aOL6M0Lg7L4JO9qcvckwFMjQvwajX8Nk5kh++yeNHFzj+H246gkRPW3lIoGP6WJbGJEaycPDCoMqqw7+pdk0xdjFAmUGOm8BLU=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-21 13:01:40', '2024-02-21 13:01:40', NULL, 'CVK-0001-3495', NULL, 0, NULL, NULL, NULL, NULL, NULL, 811, '2023-12-29 00:00:00', '2023-12-29 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 129.4356, 94101.83846, 13174.2573844, 107276.0958444, '1000265103750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 011'),
	(104, '2024-02-21;2024-02-21T13:42:17;FR ATO2024/1;2201906.77;', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'VULKAN AIR', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 1, 1, 'FR ATO2024/1', NULL, 'l/lamyOH3jMFYVGaZcg0rNUP1vxigCpbov1ILPz980Db811Nr1VAy5Yl8IXoWv5rhRaayYmuWwezzPz2o8BnzHVzspcALmrMCLQwZZ9frHrPpU5Ze3HK6Bji2KEYZAEVttINdtRY8k+drWf8HcZ7V6XFjyU77T3tXgLXEhDbAF4=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-21 13:42:17', '2024-02-21 13:42:17', NULL, NULL, 'ANTONOV12 UR-CEZ', 61, '2023-12-28', '2023-12-29', '16:14:00', '14:48:00', NULL, 15503, NULL, NULL, NULL, 14, 828.79978, 'USD', 'AOA', NULL, 2656.7415, 1931497.1672955, 270409.60342137, 2201906.7707169, '1000268104750', 1, 4, NULL, 'N', 'N', 'Y', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 001/24'),
	(105, '2024-02-22;2024-02-22T12:28:01;FR ATO2024/2;4805561.43;l/lamyOH3jMFYVGaZcg0rNUP1vxigCpbov1ILPz980Db811Nr1VAy5Yl8IXoWv5rhRaayYmuWwezzPz2o8BnzHVzspcALmrMCLQwZZ9frHrPpU5Ze3HK6Bji2KEYZAEVttINdtRY8k+drWf8HcZ7V6XFjyU77T3tXgLXEhDbAF4=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, De Fronte ao Terminal de Carga - Maianga', 1, 2, 'FR ATO2024/2', NULL, 'sZDYr4yXSmDTIY6jEwM4ovRXLn085u8CqJepv9Zm5UgvW8cZaSL9r5nKWy5qK6aw8bAgyjdYjQpRhAAZehZ80dh54A5nmR+N/9T+PIxjQUsO1RkA92VgCb0SlAxFPAqUEZ13WY5MLFQ7AdaliGBTJUI8bWcXO8K8PzmXVnM4pG4=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-22 12:28:01', '2024-02-22 12:28:01', NULL, NULL, 'BOING 747-400F', 397, '2023-12-30', '2023-12-31', '15:30:00', '12:25:00', NULL, NULL, NULL, NULL, NULL, 0, 828.798715, 'USD', 'USD', NULL, 5798.225, 4805561.4292809, 0, 4805561.4292809, '1000264105751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 002/24'),
	(106, '2024-02-23;2024-02-23T14:18:31;FR ATO2024/3;380584.04;sZDYr4yXSmDTIY6jEwM4ovRXLn085u8CqJepv9Zm5UgvW8cZaSL9r5nKWy5qK6aw8bAgyjdYjQpRhAAZehZ80dh54A5nmR+N/9T+PIxjQUsO1RkA92VgCb0SlAxFPAqUEZ13WY5MLFQ7AdaliGBTJUI8bWcXO8K8PzmXVnM4pG4=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 3, 'FR ATO2024/3', NULL, 'wJMdwAah32CfWY93DzhZKnmmApnFoFt3jOAK3ezO3jKUjjFXfq6k3mFfoz/1ankaDWZqVYswO4hcmTL70UGJatvDxYKzK11VUw+jCH+51nM2HVLLznRpERi5Utkh/zNNK0zgexyJX9bk1jzf1zVwjvRNHzQZrQ4Bou/H3qoSTIs=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-23 14:18:31', '2024-02-23 14:18:31', NULL, NULL, 'BOING 747-400F', 397, '2023-12-30', '2023-12-31', '15:30:00', '12:25:00', NULL, 5740, NULL, NULL, NULL, 0, 828.798, 'USD', 'USD', NULL, 459.2, 380584.0416, 0, 380584.0416, '1000264106750', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 003/24'),
	(107, '2024-02-23;2024-02-23T14:25:47;FR ATO2024/4;549834.87;wJMdwAah32CfWY93DzhZKnmmApnFoFt3jOAK3ezO3jKUjjFXfq6k3mFfoz/1ankaDWZqVYswO4hcmTL70UGJatvDxYKzK11VUw+jCH+51nM2HVLLznRpERi5Utkh/zNNK0zgexyJX9bk1jzf1zVwjvRNHzQZrQ4Bou/H3qoSTIs=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 4, 'FR ATO2024/4', NULL, 'JnAeWtBrGa54OZkhYs0A7apHIgPrrHrUiudOYjzbx4H7ca1D7qHA1bTxLIjb+EBsIiaavuOB4P3IwhxaNbt3WU4nfZL1eiU8/hPBVmi74+8S9vWS5mgrHmeByIa7i4aVzSWZ45YvPZYx1YV8/UcCme8YzE2eMwd7f1m5f8HW2BU=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-23 14:25:47', '2024-02-23 14:25:47', NULL, '271-00023984', NULL, 0, NULL, NULL, NULL, NULL, NULL, 549, '2023-12-22 00:00:00', '2024-01-04 00:00:00', 13, 14, 828.799, 'USD', 'AOA', NULL, 663.4116, 482311.29006, 67523.5806084, 549834.8706684, '1000265107750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A NOTA DE PREÇO Nº 004/24'),
	(108, '2024-02-23;2024-02-23T14:41:26;FR ATO2024/5;97957.70;JnAeWtBrGa54OZkhYs0A7apHIgPrrHrUiudOYjzbx4H7ca1D7qHA1bTxLIjb+EBsIiaavuOB4P3IwhxaNbt3WU4nfZL1eiU8/hPBVmi74+8S9vWS5mgrHmeByIa7i4aVzSWZ45YvPZYx1YV8/UcCme8YzE2eMwd7f1m5f8HW2BU=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 5, 'FR ATO2024/5', NULL, 'nWlz5RsnDq2clLS27FPNnuoQ0/KBs/cLDdOqTZvFgypzlk3DW5tfwJOby3k5d9rW30N+tJjNQeCxDWZ7001VyMjJcEk5ljjsSYe8RDsfzaAvggh8oxsLiLotFm1j7xps+yXDlXN0s1+blYjrDfe3H59JkkD3uq+9xYS1GDaSj6s=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-23 14:41:26', '2024-02-23 14:41:26', NULL, '271-00023995', NULL, 0, NULL, NULL, NULL, NULL, NULL, 36, '2023-12-22 00:00:00', '2024-01-30 00:00:00', 39, 14, 828.779, 'USD', 'AOA', NULL, 118.1952, 85927.80672, 12029.8929408, 97957.6996608, '1000265108750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A NOTA DE PREÇO Nº 005/24'),
	(109, '2024-02-23;2024-02-23T14:48:29;FR ATO2024/6;549834.87;nWlz5RsnDq2clLS27FPNnuoQ0/KBs/cLDdOqTZvFgypzlk3DW5tfwJOby3k5d9rW30N+tJjNQeCxDWZ7001VyMjJcEk5ljjsSYe8RDsfzaAvggh8oxsLiLotFm1j7xps+yXDlXN0s1+blYjrDfe3H59JkkD3uq+9xYS1GDaSj6s=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 6, 'FR ATO2024/6', NULL, 'DHPSRDG+C8Dw3VVwIWQiSBz0mgad6sMILEvc/VHFm9/nlM62d54C1QrmDusklTs0HE6hO/rc7pynR8xELnShWg3RXYRbfOwMnvIK0tXXL55GVfdmBiFjknz88nlVLhMfGCJrxU0Ykn5Aj76UYodp15dPCvd2JL/ekerLAo6r/9Q=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-23 14:48:29', '2024-02-23 14:48:29', NULL, '271-00023951', NULL, 0, NULL, NULL, NULL, NULL, NULL, 549, '2023-12-22 00:00:00', '2024-01-04 00:00:00', 13, 14, 828.799, 'USD', 'AOA', NULL, 663.4116, 482311.29006, 67523.5806084, 549834.8706684, '1000265109750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A NOTA DE PREÇO Nº 006/24'),
	(110, '2024-02-26;2024-02-26T12:41:40;FT ATO2024/1;1072713.72;', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 2, 1, 'FT ATO2024/1', NULL, 'PwNrdwOSKqVlk1wXM0BPdSzFpOTmqQ0kVdUGy35Yc8yr0wvHD9qkAJhZBx8Gocwh3khZQYbU/jS3vB8tuN5Z0EYqdTrQfr5UIJHHbtLTCEcvB8nFX3RRqP7VHtdtsMEKC+AgsNNBpHtsWwVFAUPVV56eLLHHr/HZf3RmOdxzKr4=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 12:41:40', '2024-02-26 12:41:40', NULL, '11812312016', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3915, '2023-12-29 00:00:00', '2024-01-04 00:00:00', 6, 14, 828.799, 'USD', 'AOA', NULL, 1294.299, 940976.94465, 131736.772251, 1072713.716901, '10003110751', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº007/24'),
	(111, '2024-02-26;2024-02-26T13:10:17;FT ATO2024/2;1383704.79;PwNrdwOSKqVlk1wXM0BPdSzFpOTmqQ0kVdUGy35Yc8yr0wvHD9qkAJhZBx8Gocwh3khZQYbU/jS3vB8tuN5Z0EYqdTrQfr5UIJHHbtLTCEcvB8nFX3RRqP7VHtdtsMEKC+AgsNNBpHtsWwVFAUPVV56eLLHHr/HZf3RmOdxzKr4=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 2, 2, 'FT ATO2024/2', NULL, 'XHgQmkftlF7iJx1wdLKKsHpIqz/7u1xAUn8/xNXRUF13/WzGqbqgH1ndCv6vfiCxIzL69b5pUh21m4SGRtKRrJQqBn7HG/qXCbuWLTri6R3jM1UvbyMkLw963BtTOVwZM/9i77LHCOGypcF182S2XR2MaS8QQatKeUrZDhoy5VI=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 13:10:17', '2024-02-26 13:10:17', NULL, '11812311994', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5050, '2023-12-29 00:00:00', '2024-01-04 00:00:00', 6, 14, 828.799, 'USD', 'AOA', NULL, 1669.53, 1213776.1355, 169928.65897, 1383704.79447, '10003111751', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 008/24'),
	(112, '2024-02-26;2024-02-26T13:17:21;FT ATO2024/3;1273830.41;XHgQmkftlF7iJx1wdLKKsHpIqz/7u1xAUn8/xNXRUF13/WzGqbqgH1ndCv6vfiCxIzL69b5pUh21m4SGRtKRrJQqBn7HG/qXCbuWLTri6R3jM1UvbyMkLw963BtTOVwZM/9i77LHCOGypcF182S2XR2MaS8QQatKeUrZDhoy5VI=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 2, 3, 'FT ATO2024/3', NULL, 'Ul2a2WELRas10x7vUdgxEHc09Z4mZkEjcF5eemcOQ6rKfE1/CpHBLrm9MP2fnMThrueaRqPKYv8DW9AFKOEVIz5Spmw+cWfOdo48lg0TC6Sv7x1ENh2+1jv49g5+94WFn71wLJ7B+VzPfSzzaEFTtRuaWhAtvrCioWlXKgXimPA=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 13:17:21', '2024-02-26 13:17:21', NULL, '11812312005', NULL, 0, NULL, NULL, NULL, NULL, NULL, 4649, '2023-12-29 00:00:00', '2024-01-04 00:00:00', 6, 14, 828.799, 'USD', 'AOA', NULL, 1536.9594, 1117395.09979, 156435.3139706, 1273830.4137606, '10003112751', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 009/24'),
	(113, '2024-02-26;2024-02-26T14:50:02;FT ATO2024/4;1301351.77;Ul2a2WELRas10x7vUdgxEHc09Z4mZkEjcF5eemcOQ6rKfE1/CpHBLrm9MP2fnMThrueaRqPKYv8DW9AFKOEVIz5Spmw+cWfOdo48lg0TC6Sv7x1ENh2+1jv49g5+94WFn71wLJ7B+VzPfSzzaEFTtRuaWhAtvrCioWlXKgXimPA=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 4, 'FT ATO2024/4', NULL, 'O2zE16yIM9zZ+uB8ykq32awj8QmVoSMFihpuA6qAzFIx8UeNWcw+XFYWdmeXEc9FiWeDw9y0oZAV+przgirBbOELWNpgKxuTbKZx1Jl1m95ZjhmW9hayxWmZC61HRUE9szKAEd0AfkkyNrKPHq06BZ3WK8csVs1xwnrkHntpRDU=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-26 14:50:02', '2024-02-26 14:50:02', NULL, NULL, 'BOING 737-800', 79, '2024-12-30', '2024-12-30', '13:40:00', '15:16:00', NULL, 9955, NULL, NULL, NULL, 14, 828.798, 'USD', 'AOA', NULL, 1570.1676, 1141536.63732, 159815.1292248, 1301351.7665448, '1000269113750', 2, 2, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 011/24'),
	(114, '2024-02-26;2024-02-26T15:10:11;FR ATO2024/7;1148194.87;DHPSRDG+C8Dw3VVwIWQiSBz0mgad6sMILEvc/VHFm9/nlM62d54C1QrmDusklTs0HE6hO/rc7pynR8xELnShWg3RXYRbfOwMnvIK0tXXL55GVfdmBiFjknz88nlVLhMfGCJrxU0Ykn5Aj76UYodp15dPCvd2JL/ekerLAo6r/9Q=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'CELTA', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 1, 7, 'FR ATO2024/7', NULL, 'QOJYKTmEnnlN6HJulOdCLccMw231Goa6nwtC70SPy1Z3lf0fq9kwW9IcojStYbj1inmtczpKOCSY6+e9bNiNJTE4EnW2EecqUtjvDZtaDoim5VcuUHbWaEpiNitf50Orpme+oOYrXpacSgcBeEYWz+7E57F3FPZBZjEg4FUwZZo=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-26 15:10:11', '2024-02-26 15:10:11', NULL, NULL, 'ANTONOV 12', 61, '2023-12-30', '2023-12-30', '09:20:00', '16:20:00', NULL, 8611, NULL, NULL, NULL, 14, 828.80141, 'USD', 'AOA', NULL, 1385.3679, 1007188.4814814, 141006.38740739, 1148194.8688887, '1000268114750', 1, 4, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 012/24'),
	(115, '2024-02-26;2024-02-26T15:41:30;FR ATO2024/8;3406774.18;QOJYKTmEnnlN6HJulOdCLccMw231Goa6nwtC70SPy1Z3lf0fq9kwW9IcojStYbj1inmtczpKOCSY6+e9bNiNJTE4EnW2EecqUtjvDZtaDoim5VcuUHbWaEpiNitf50Orpme+oOYrXpacSgcBeEYWz+7E57F3FPZBZjEg4FUwZZo=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 8, 'FR ATO2024/8', NULL, 'xWOauZTFeKdf5TkU8jto9Xj3MY/Md9eh3YFXKwPMA1GGp1jI10xUJiolm4ortF5yNpjb+GJWhZ61fxH2tr4vMjVi6iN9wg8O+y6pLFemtLOZotSlCaL0wJFDhifDuNv4O2++fajkZXm9/8w18qO/rlZ94/W+khL9eaU/4p42eyE=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 15:41:30', '2024-02-26 15:41:30', NULL, NULL, 'BOING 747-400F', 397, '2024-01-02', '2024-01-02', '17:59:00', '19:44:00', NULL, NULL, NULL, NULL, NULL, 0, 828.737515, 'USD', 'USD', 1, 4110.8, 3406774.176662, 0, 3406774.176662, '1000264115751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 013/24'),
	(116, '2024-02-26;2024-02-26T15:50:08;FR ATO2024/9;763157.20;xWOauZTFeKdf5TkU8jto9Xj3MY/Md9eh3YFXKwPMA1GGp1jI10xUJiolm4ortF5yNpjb+GJWhZ61fxH2tr4vMjVi6iN9wg8O+y6pLFemtLOZotSlCaL0wJFDhifDuNv4O2++fajkZXm9/8w18qO/rlZ94/W+khL9eaU/4p42eyE=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 9, 'FR ATO2024/9', NULL, 'kb/vRR8GmcfcuFndcFZzTra7gI6HS+fFn5p8JSNF4slLa1Hw4f7bGH8TMgbr0qEFTiNNPPHN8qzWMmAKfxMBVYUdWj1GPVZ2koVpX7hRGMWZmj1GIznZ0nvxiEWfGjkTX4Oj6pyEJHSnMdWAOdX2ZSvRm1SrC16/Aaxf4ZWWuCk=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 15:50:08', '2024-02-26 15:50:08', NULL, NULL, 'BOING 747-400F', 397, '2024-01-02', '2024-01-02', '17:59:00', '19:44:00', NULL, 11510, NULL, NULL, NULL, 0, 828.798, 'USD', 'USD', NULL, 920.8, 763157.1984, 0, 763157.1984, '1000264116751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 014/24'),
	(117, '2024-02-26;2024-02-26T16:51:46;FR ATO2024/10;2594264.44;kb/vRR8GmcfcuFndcFZzTra7gI6HS+fFn5p8JSNF4slLa1Hw4f7bGH8TMgbr0qEFTiNNPPHN8qzWMmAKfxMBVYUdWj1GPVZ2koVpX7hRGMWZmj1GIznZ0nvxiEWfGjkTX4Oj6pyEJHSnMdWAOdX2ZSvRm1SrC16/Aaxf4ZWWuCk=', 1, 270, 'TLC LDA', 'SONASURF ANGOLA LDA', '+244 926 515 109', ' 5401146655', 'dsousa.an@tlc-com.ch', 'Avenida 4 de Fevereiro nº33 Luanda, Angola', 1, 10, 'FR ATO2024/10', NULL, 'Q+09lg8SyfxilyNIlZ7eg1RW70s7l/vQPYqH/24m0oWz44A2pY/QGZORZ7fDHYyW3qp9y49gBzwjcVzNJfOzUTCMX/i+7ECsW/qteSpKvxD45iJTMRczRfF6ICGloVJ5/obPH3JKzvf0ehSIBQ42qGfaI7hfmIilSvbVGoeVD9k=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 16:51:46', '2024-02-26 16:51:46', NULL, '574/33977790', NULL, 0, NULL, NULL, NULL, NULL, NULL, 6560, '2023-12-30 00:00:00', '2024-01-09 00:00:00', 10, 14, 846.1, 'USD', 'AOA', NULL, 3066.144, 2275670.56, 318593.8784, 2594264.4384, '1000270117751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 015/24'),
	(118, '2024-02-26;2024-02-26T17:01:55;FT ATO2024/5;791054.18;O2zE16yIM9zZ+uB8ykq32awj8QmVoSMFihpuA6qAzFIx8UeNWcw+XFYWdmeXEc9FiWeDw9y0oZAV+przgirBbOELWNpgKxuTbKZx1Jl1m95ZjhmW9hayxWmZC61HRUE9szKAEd0AfkkyNrKPHq06BZ3WK8csVs1xwnrkHntpRDU=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 5, 'FT ATO2024/5', NULL, 'LG/ZCAepXEf13bCANkBQq5/a733CyS9nzCNc82M3npUobNkLE8B8+HY8i/tgNbrKGl0j7V2wvggCPA7kBX/ENfESeN6rv87xe8VsUynkNUt8hrb75jXNa3K5A+33RgMCrkuzt8eCEm/Lt1TbFOthKsax/cnRDJPRrJf4OmZOmbU=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 17:01:55', '2024-02-26 17:01:55', NULL, NULL, 'BOING 737-800', 78, '2023-12-19', '2023-12-19', '09:18:00', '10:35:00', NULL, 3308, NULL, NULL, NULL, 14, 828.724, 'USD', 'AOA', NULL, 954.5448, 693907.17968, 97147.0051552, 791054.1848352, '1000269118751', 2, 2, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 016/24'),
	(119, '2024-02-26;2024-02-26T17:06:27;FT ATO2024/6;2583859.66;LG/ZCAepXEf13bCANkBQq5/a733CyS9nzCNc82M3npUobNkLE8B8+HY8i/tgNbrKGl0j7V2wvggCPA7kBX/ENfESeN6rv87xe8VsUynkNUt8hrb75jXNa3K5A+33RgMCrkuzt8eCEm/Lt1TbFOthKsax/cnRDJPRrJf4OmZOmbU=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 6, 'FT ATO2024/6', NULL, 'jZ8CxaUlGwiXFTzntu5Jr+GbtnUTDxksAZVinkYDfFUpwGMrdfybgrj59Lk+YKJdV7k+ozJ19+HRNvbITLwQlOoFp3VU2VYVmNSTY67RuOCGIHewmaPuYBnDnP/z/BaDNp8DxvlepZ2uHVgRFJTITIy8PEbF6T6EAmO0oRyKPNE=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 17:06:27', '2024-02-26 17:06:27', NULL, NULL, 'BOING 737-800', 78, '2023-12-19', '2023-12-19', '18:17:00', '19:41:00', NULL, 15245, NULL, NULL, NULL, 14, 828.724, 'USD', 'AOA', 1, 3117.8772, 2266543.56552, 317316.0991728, 2583859.6646928, '1000269119751', 2, 2, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 017/24'),
	(120, '2024-02-26;2024-02-26T17:11:34;FT ATO2024/7;556671.36;jZ8CxaUlGwiXFTzntu5Jr+GbtnUTDxksAZVinkYDfFUpwGMrdfybgrj59Lk+YKJdV7k+ozJ19+HRNvbITLwQlOoFp3VU2VYVmNSTY67RuOCGIHewmaPuYBnDnP/z/BaDNp8DxvlepZ2uHVgRFJTITIy8PEbF6T6EAmO0oRyKPNE=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICE INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 2, 7, 'FT ATO2024/7', NULL, 'XWO/c+/EjTYECdSdJBea1R9lF9s9zr3fF3pIiabyBCtSppLAYQ9WFESyz22gd/XiSXxG03z6vQ0+f/9d71fE5mgImlsYEzdv4L3fQCq37PmoGfXvCoFjuUuSqNxVEuOy2VQ7Kh5BzddsdcKAjfHWXkI8gp+5LQtSM7nwTN/6C9E=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 17:11:34', '2024-02-26 17:11:34', NULL, '000-00117100', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1370.3, '2024-01-08 00:00:00', '2024-01-12 00:00:00', 4, 14, 828.724, 'USD', 'AOA', NULL, 671.72106, 488308.213796, 68363.14993144, 556671.36372744, '1000265120751', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A NOTA DE PREÇO Nº 018/24'),
	(121, '2024-02-26;2024-02-26T17:16:19;FR ATO2024/11;464085.44;Q+09lg8SyfxilyNIlZ7eg1RW70s7l/vQPYqH/24m0oWz44A2pY/QGZORZ7fDHYyW3qp9y49gBzwjcVzNJfOzUTCMX/i+7ECsW/qteSpKvxD45iJTMRczRfF6ICGloVJ5/obPH3JKzvf0ehSIBQ42qGfaI7hfmIilSvbVGoeVD9k=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 11, 'FR ATO2024/11', NULL, 'A0iXwNJ9vANGH2X7Ea32rwJlwTQZWhBPP4r78lWKCVgCg37FJnOBzXiAlUWO5TZUIXvBRLtfq6pTGhOSUaeO2PCwMdVceGJu1fBTD+0sR6F7gGOSddV8J+ivYlEFb6pVyOJ3iblj9RT3VJKPk3sJsQ/D9wqp7XYZjVbPiXqBDsM=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 17:16:19', '2024-02-26 17:16:19', NULL, NULL, 'BOING 747-400F', 395, '2024-01-12', '2024-01-12', '07:33:00', '11:33:00', NULL, 7000, NULL, NULL, NULL, 0, 828.724, 'USD', 'USD', NULL, 560, 464085.44, 0, 464085.44, '1000264121751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 019/24'),
	(122, '2024-02-26;2024-02-26T17:19:15;FR ATO2024/12;2775728.17;A0iXwNJ9vANGH2X7Ea32rwJlwTQZWhBPP4r78lWKCVgCg37FJnOBzXiAlUWO5TZUIXvBRLtfq6pTGhOSUaeO2PCwMdVceGJu1fBTD+0sR6F7gGOSddV8J+ivYlEFb6pVyOJ3iblj9RT3VJKPk3sJsQ/D9wqp7XYZjVbPiXqBDsM=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 12, 'FR ATO2024/12', NULL, 'hS+4wolPqd2F2m4bw78FyHBKiE0ku35UYBKqutpKIq4H17hiQg1UyCB75qxvBJL84XYsIVGMEPOuQTUCgpkqb6Y5Re16jaKGMIEMftAtckxN/wum0LTLCbx650VXPDbOHyUjuuxKgd/w6XijUu5ZYjh85Z9F16t07aF9+HGnN60=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-26 17:19:15', '2024-02-26 17:19:15', NULL, NULL, 'BOING 747-400F', 395, '2024-01-12', '2024-01-12', '07:33:00', '11:33:00', NULL, NULL, NULL, NULL, NULL, 0, 828.724, 'USD', 'USD', NULL, 3349.4, 2775728.1656, 0, 2775728.1656, '1000264122751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 020/24'),
	(123, '2024-02-27;2024-02-27T10:30:49;FR ATO2024/13;2843683.53;hS+4wolPqd2F2m4bw78FyHBKiE0ku35UYBKqutpKIq4H17hiQg1UyCB75qxvBJL84XYsIVGMEPOuQTUCgpkqb6Y5Re16jaKGMIEMftAtckxN/wum0LTLCbx650VXPDbOHyUjuuxKgd/w6XijUu5ZYjh85Z9F16t07aF9+HGnN60=', 1, 271, 'SUPERMARITIME TRANSITÁRIOS LDA', 'ANGOLA LNG LIMITED, SUCURSAL ANGOLA', '+244936759737', '50000338415', 'dlussala@supermaritime.com', 'Rua das Flores Nº10, Ingombota', 1, 13, 'FR ATO2024/13', NULL, 'qk3Ro4RvaWffjfJtkkSvz272tng5Xd44cBK+HG8dZbttkNcpnzmrkDcTUk8lSqeEQGvxQP72yzGxbmHkg8U/GwiY8UsaeHcl3WblQMS3cKHAGdONnnSlyiVwpOne6AdJxmFqHlX+Snsdz//WNZ/5sfjIMfX1XlsGmO8f5s/mdjY=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 10:30:49', '2024-02-27 10:30:49', NULL, '259-01727460', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7000, '2024-01-12 00:00:00', '2024-01-16 00:00:00', 4, 14, 828.724, 'USD', 'AOA', NULL, 3431.4, 2494459.24, 349224.2936, 2843683.5336, '1000271123751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A NOTA DE PREÇO Nº 021/24'),
	(124, '2024-02-27;2024-02-27T10:44:20;FR ATO2024/14;1701845.40;qk3Ro4RvaWffjfJtkkSvz272tng5Xd44cBK+HG8dZbttkNcpnzmrkDcTUk8lSqeEQGvxQP72yzGxbmHkg8U/GwiY8UsaeHcl3WblQMS3cKHAGdONnnSlyiVwpOne6AdJxmFqHlX+Snsdz//WNZ/5sfjIMfX1XlsGmO8f5s/mdjY=', 1, 267, 'MULTIFLIGHT LDA', 'VULKAN AIR', '+244933535482', '5417323659', 'opsmultiflight@gmail.com', 'Av. Revolução de Outubro, Bloco 47 B-3 Andar', 1, 14, 'FR ATO2024/14', NULL, 'Y2TOGoWLyqewowiVy99OOEVfLbGGUQDntIIxOCV1Q0tbWPAZ44mKtQR/xdrfeN3k3WiJP5Hx/ti20SiU63HEHnFzoStB9iRR1vxz1gSvlQkMPHw1R3KVdGS9Vq7PHANFoESx+Q+oWsmxr1NKa3eqJeZ/ilTHBZqSHCPOYOwFk2Y=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-27 10:44:20', '2024-02-27 10:44:20', NULL, NULL, 'ANTONOV-12', 24, '2024-01-08', '2024-01-15', '08:06:00', '13:10:00', NULL, 1370, NULL, NULL, NULL, 14, 828.724, 'USD', 'AOA', NULL, 2053.5732, 1492846.83912, 208998.5574768, 1701845.3965968, '1000267124750', 1, 4, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 022/24'),
	(125, '2024-02-27;2024-02-27T11:32:05;FR ATO2024/15;58196.31;Y2TOGoWLyqewowiVy99OOEVfLbGGUQDntIIxOCV1Q0tbWPAZ44mKtQR/xdrfeN3k3WiJP5Hx/ti20SiU63HEHnFzoStB9iRR1vxz1gSvlQkMPHw1R3KVdGS9Vq7PHANFoESx+Q+oWsmxr1NKa3eqJeZ/ilTHBZqSHCPOYOwFk2Y=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'BAKER HUGHES ANGOLA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 15, 'FR ATO2024/15', NULL, 'RBDriUv1bXhTccjUZ9FWFp7ESxTvO1zczNNgkMdafaxfD0V9vjHsd3/9pgO/WqftQYwbbrzZBdGlSadxYefdemcEPkkO+ErmGZLAsQPBjwGxv3mVfAWM75Z6RezSGM+5MowkdJr356H62rU+jNXFyPgLFrJe4TGKjKamAm0F//0=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 11:32:05', '2024-02-27 11:32:05', NULL, '57433977823', NULL, 0, NULL, NULL, NULL, NULL, NULL, 110, '2024-01-02 00:00:00', '2024-01-17 00:00:00', 15, 14, 828.724, 'USD', 'AOA', NULL, 70.224, 51049.3984, 7146.915776, 58196.314176, '1000266125751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 023/24'),
	(126, '2024-02-27;2024-02-27T11:36:40;FR ATO2024/16;6354357.29;RBDriUv1bXhTccjUZ9FWFp7ESxTvO1zczNNgkMdafaxfD0V9vjHsd3/9pgO/WqftQYwbbrzZBdGlSadxYefdemcEPkkO+ErmGZLAsQPBjwGxv3mVfAWM75Z6RezSGM+5MowkdJr356H62rU+jNXFyPgLFrJe4TGKjKamAm0F//0=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'Baker Hughes Angola LDA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 16, 'FR ATO2024/16', NULL, 'Yjg2MSdVlE6CF+7iK45ELLPi3+vZnwmR9PxwkxmVoQ48DzZg0PnoWzgmOZLDTim31Mia9XqeYWICEgUzidW5QwahLB7SR0V6Ykjrohq8YnLKKSw3ChaoB65R9xmPJD+//91KhFth3mWlKA1toVmSLfrRw6ES28bTm2RSzWNUBUk=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-27 11:36:40', '2024-02-27 11:36:40', NULL, '57433977731', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11400, '2024-01-02 00:00:00', '2024-01-18 00:00:00', 16, 14, 828.724, 'USD', 'AOA', NULL, 7667.64, 5573997.624, 780359.66736, 6354357.29136, '1000266126750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 024/24'),
	(127, '2024-02-27;2024-02-27T11:43:42;FR ATO2024/17;2707901.26;Yjg2MSdVlE6CF+7iK45ELLPi3+vZnwmR9PxwkxmVoQ48DzZg0PnoWzgmOZLDTim31Mia9XqeYWICEgUzidW5QwahLB7SR0V6Ykjrohq8YnLKKSw3ChaoB65R9xmPJD+//91KhFth3mWlKA1toVmSLfrRw6ES28bTm2RSzWNUBUk=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 17, 'FR ATO2024/17', NULL, 'FUcWPM/3mLqSYQJRw5Do3LX+2Ul3uxVU12zG0AHQTwy5W8xvUI1/JPzKt6d0aJanx4pAZ6Ti3ZKNOD38Rv3qhxXZeUti3OaKjOTNd8Za1YmTAFG/2yEWuCWRZ5kV4ceg8EE4UCLysG06OogZE+VmrK+JGQ1I9yr06vYFo27FrAs=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 11:43:42', '2024-02-27 11:43:42', NULL, NULL, 'BOING 747-400F', 397, '2024-01-17', '2024-01-17', '08:00:00', '11:07:00', NULL, NULL, NULL, NULL, NULL, 0, 828.776, 'USD', 'USD', NULL, 3267.35, 2707901.2636, 0, 2707901.2636, '1000264127751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 025/24'),
	(128, '2024-02-27;2024-02-27T11:44:41;FR ATO2024/18;1062225.62;FUcWPM/3mLqSYQJRw5Do3LX+2Ul3uxVU12zG0AHQTwy5W8xvUI1/JPzKt6d0aJanx4pAZ6Ti3ZKNOD38Rv3qhxXZeUti3OaKjOTNd8Za1YmTAFG/2yEWuCWRZ5kV4ceg8EE4UCLysG06OogZE+VmrK+JGQ1I9yr06vYFo27FrAs=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 18, 'FR ATO2024/18', NULL, 'dL+B4inbXrtIqQrB2x8TkAfA0jSH49+2LC7op+P7bsCRDdWaq5q529yPZDhbzahJSzJ+TF43QsEd9bl12V3BCTphepEHKdxMXsMJY0JBrK6TcNNSGix8cyfxpmmGDVCQCP2j8s8TOYGr6Dkcao63OM5Hry/6mP4NpDMJCuPy/KI=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-27 11:44:41', '2024-02-27 11:44:41', NULL, NULL, 'BOING 747-400F', 397, '2024-01-17', '2024-01-17', '08:00:00', '11:07:00', NULL, 16021, NULL, NULL, NULL, 0, 828.776, 'USD', 'USD', NULL, 1281.68, 1062225.62368, 0, 1062225.62368, '1000264128750', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 026/24'),
	(129, '2024-02-27;2024-02-27T12:38:18;FR ATO2024/19;75282.03;dL+B4inbXrtIqQrB2x8TkAfA0jSH49+2LC7op+P7bsCRDdWaq5q529yPZDhbzahJSzJ+TF43QsEd9bl12V3BCTphepEHKdxMXsMJY0JBrK6TcNNSGix8cyfxpmmGDVCQCP2j8s8TOYGr6Dkcao63OM5Hry/6mP4NpDMJCuPy/KI=', 1, 272, 'PONTICELLI ANGOIL', 'PONTICELLI ANGOIL', NULL, '5403090762', NULL, 'Av. Comandante Kima-Kyenda, Nº311', 1, 19, 'FR ATO2024/19', NULL, 'sbIt3uwnZeSyLp+OeEUKcaH5g2BTivY4fuNjdknuq4R/J+AmfjqbujoD+V7K/cDTl0ij5CJLej6sP8HVa1/8EQqSdg2yjDIZdy3MTFaf3udhF8mAWRtrOzh76BjpgZcf+1lEVSlkVM87ycjvgiZ3yLmSqnM2kYoa+3u6+fejifQ=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 12:38:18', '2024-02-27 12:38:18', NULL, '242CDG22038004', NULL, 0, NULL, NULL, NULL, NULL, NULL, 249, '2024-01-17 00:00:00', '2024-01-24 00:00:00', 7, 14, 828.776, 'USD', 'AOA', NULL, 90.8352, 66036.87168, 9245.1620352, 75282.0337152, '1000272129751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 027/24'),
	(130, '2024-02-27;2024-02-27T14:48:19;FR ATO2024/20;441658.38;sbIt3uwnZeSyLp+OeEUKcaH5g2BTivY4fuNjdknuq4R/J+AmfjqbujoD+V7K/cDTl0ij5CJLej6sP8HVa1/8EQqSdg2yjDIZdy3MTFaf3udhF8mAWRtrOzh76BjpgZcf+1lEVSlkVM87ycjvgiZ3yLmSqnM2kYoa+3u6+fejifQ=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY ANGOLA ', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 20, 'FR ATO2024/20', NULL, 'ASF2Kcyg+r4HP3THG1FmPjDAnkTRP0ONXWzxoeiFZ+b0sIbiho9D1g0an2bHQqLEoW7Lvl0hKsHrvp+Tha+cTHqObczuME5dLWSG/GzNYLJZj142X+CuQGMaoyR3Mihj7HJ+Xh+SYfKT3D53YRmyL7V9i+efq1U57il34ni1wiA=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-27 14:48:19', '2024-02-27 14:48:19', NULL, 'LHR-0063 9673', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3339, '2024-01-17 00:00:00', '2024-01-18 00:00:00', 1, 14, 828.776, 'USD', 'AOA', NULL, 532.9044, 387419.62896, 54238.7480544, 441658.3770144, '1000273130750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 028/24'),
	(131, '2024-02-27;2024-02-27T14:49:49;FR ATO2024/21;27021.41;ASF2Kcyg+r4HP3THG1FmPjDAnkTRP0ONXWzxoeiFZ+b0sIbiho9D1g0an2bHQqLEoW7Lvl0hKsHrvp+Tha+cTHqObczuME5dLWSG/GzNYLJZj142X+CuQGMaoyR3Mihj7HJ+Xh+SYfKT3D53YRmyL7V9i+efq1U57il34ni1wiA=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'BAKER HUGHES ANGOLA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 21, 'FR ATO2024/21', NULL, 'n6cdo/t+fRCN546HmLR3HmkyQ3roQeBaYWKC2yY6G0tk9jteAKOPmZEbiRfPGczcq70c4U/o9sGd4AMJM69UjsashO8Q4gEGnc3G5PmBgXPPvx3fYPTIvIcuVfl3tAQ4GE5A/iM/PYI7uPjDSmsJXJQUKXS+XHzKauo5O5ujtpo=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 14:49:49', '2024-02-27 14:49:49', NULL, '57433977823', NULL, 0, NULL, NULL, NULL, NULL, NULL, 110, '2024-01-18 00:00:00', '2024-01-23 00:00:00', 5, 14, 828.776, 'USD', 'AOA', NULL, 32.604, 23702.9936, 3318.419104, 27021.412704, '1000266131751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 029/24'),
	(132, '2024-02-27;2024-02-27T14:53:32;FR ATO2024/22;2477277.77;n6cdo/t+fRCN546HmLR3HmkyQ3roQeBaYWKC2yY6G0tk9jteAKOPmZEbiRfPGczcq70c4U/o9sGd4AMJM69UjsashO8Q4gEGnc3G5PmBgXPPvx3fYPTIvIcuVfl3tAQ4GE5A/iM/PYI7uPjDSmsJXJQUKXS+XHzKauo5O5ujtpo=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'BAKER HUGHES ANGOLA LDA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 22, 'FR ATO2024/22', NULL, 'hG71QnKxXJANg4J7DZhKc9fxNZ1hKTmBLIDFYRa8FQfDQveG0xWZaxsnCmUs8upnGr4uMClsLJRqb0gAhOpAK5qFWdwvU/XwfjfhafMx44RdwqnlPrUahkK+OQtFOW2qVgJxLb+FEiMMD6Xf5GJuMdrwZuh2gnD3ZaC5zuFus9A=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-27 14:53:32', '2024-02-27 14:53:32', NULL, '57 433 977 731', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11400, '2024-01-19 00:00:00', '2024-01-23 00:00:00', 4, 14, 828.776, 'USD', 'AOA', NULL, 2989.08, 2173050.672, 304227.09408, 2477277.76608, '1000266132750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 30'),
	(133, '2024-02-27;2024-02-27T14:56:44;FR ATO2024/23;2707901.26;hG71QnKxXJANg4J7DZhKc9fxNZ1hKTmBLIDFYRa8FQfDQveG0xWZaxsnCmUs8upnGr4uMClsLJRqb0gAhOpAK5qFWdwvU/XwfjfhafMx44RdwqnlPrUahkK+OQtFOW2qVgJxLb+FEiMMD6Xf5GJuMdrwZuh2gnD3ZaC5zuFus9A=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 23, 'FR ATO2024/23', NULL, 'XbWeb35RnzhygY1mw2+VPw10vUtyGCeeFvcvTFTaVXuAnHCjngv1O2zssW6ITsBu7HBhuhEya3ASPA7ZlYDLkYaAFy9wInyiIxG1yKn3gde7lzCfArgmuehdzUFGZj9KmeyMI6ZPOgEJgvFevt4MVW9WWNNYsY/bRtycChyMGDk=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 14:56:44', '2024-02-27 14:56:44', NULL, NULL, 'BOING 747-400F', 397, '2024-01-19', '2024-01-19', '07:15:00', '09:35:00', NULL, NULL, NULL, NULL, NULL, 0, 828.776, 'USD', 'USD', NULL, 3267.35, 2707901.2636, 0, 2707901.2636, '1000264133751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 031/24'),
	(134, '2024-02-27;2024-02-27T15:01:54;FR ATO2024/24;346229.46;XbWeb35RnzhygY1mw2+VPw10vUtyGCeeFvcvTFTaVXuAnHCjngv1O2zssW6ITsBu7HBhuhEya3ASPA7ZlYDLkYaAFy9wInyiIxG1yKn3gde7lzCfArgmuehdzUFGZj9KmeyMI6ZPOgEJgvFevt4MVW9WWNNYsY/bRtycChyMGDk=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 24, 'FR ATO2024/24', NULL, 'q0aQHAYYbTWz9+5pDZlsmStag9jIcC0ONw1dcSjBspk4mXHvlwpbrHQfTEk3pBE8tidmJkHSTnQnYJ0NHdwia8+RVxbvuWuZ0YdemFE5xvYGkU+VpBCbvi0wuyLK92g7Ma1fCOr67zYij9VSaEqJVhZROKJ2+f03k/kIRM4bxYI=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 15:01:54', '2024-02-27 15:01:54', NULL, NULL, 'BOING 747-400F', 397, '2024-01-19', '2024-01-19', '07:15:00', '09:35:00', NULL, 5222, NULL, NULL, NULL, 0, 828.776, 'USD', 'USD', NULL, 417.76, 346229.46176, 0, 346229.46176, '1000264134751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 032/24'),
	(135, '2024-02-27;2024-02-27T15:17:11;FR ATO2024/25;7303434.35;q0aQHAYYbTWz9+5pDZlsmStag9jIcC0ONw1dcSjBspk4mXHvlwpbrHQfTEk3pBE8tidmJkHSTnQnYJ0NHdwia8+RVxbvuWuZ0YdemFE5xvYGkU+VpBCbvi0wuyLK92g7Ma1fCOr67zYij9VSaEqJVhZROKJ2+f03k/kIRM4bxYI=', 1, 274, 'BANCO NACIONAL DE ANGOLA - BNA', 'BNA', '+244222679200', '7401012332', NULL, NULL, 1, 25, 'FR ATO2024/25', NULL, 'muXqte+wc2YoPv78mhbdT33lybxwEOo/KBlufaT7uJjypDWAbHj3525L7H/7nIZmaOFu8/Qg52t0UVEmv5cOPl75L2uhu9FZSYUigL3WrnNUTLcCkC2A3GlHU9ptc1l7eprwqzO7Pj+kzHxCEm36qA5AiMfTRt4SPTe/7OJQ1Jc=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 15:17:11', '2024-02-27 15:17:11', NULL, '574-33978151', NULL, 0, NULL, NULL, NULL, NULL, NULL, 55215, '2024-01-24 00:00:00', '2024-01-24 00:00:00', 1, 14, 828.776, 'USD', 'AOA', NULL, 8812.314, 6406521.3576, 896912.990064, 7303434.347664, '1000274135751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 033/24'),
	(136, '2024-02-27;2024-02-27T15:20:22;FR ATO2024/26;3036411.49;muXqte+wc2YoPv78mhbdT33lybxwEOo/KBlufaT7uJjypDWAbHj3525L7H/7nIZmaOFu8/Qg52t0UVEmv5cOPl75L2uhu9FZSYUigL3WrnNUTLcCkC2A3GlHU9ptc1l7eprwqzO7Pj+kzHxCEm36qA5AiMfTRt4SPTe/7OJQ1Jc=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 26, 'FR ATO2024/26', NULL, 'VlkU2w/OU6wSh5+WpUpmflHjC4xKqtF/CugCHlOzgNx2kWqhLSO13cLFLfrSAezp1lP8P1qZYv2xwZcVFF4hhvJ5C6FfD8DWcej+6lfNG3HRXbp9t19s+vnnW49RAr+mGzRU3zRBcPHw8gjwdhC3VrgOaU2/r2wsWChqNEdiiV8=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-27 15:20:22', '2024-02-27 15:20:22', NULL, NULL, 'BOING 747-400F', 397, '2024-01-23', '2024-01-23', '13:23:00', '17:40:00', NULL, NULL, NULL, NULL, NULL, 0, 828.776, 'USD', 'USD', NULL, 3663.73, 3036411.49448, 0, 3036411.49448, '1000264136750', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 34'),
	(137, '2024-02-27;2024-02-27T15:30:29;FR ATO2024/27;1944640.01;VlkU2w/OU6wSh5+WpUpmflHjC4xKqtF/CugCHlOzgNx2kWqhLSO13cLFLfrSAezp1lP8P1qZYv2xwZcVFF4hhvJ5C6FfD8DWcej+6lfNG3HRXbp9t19s+vnnW49RAr+mGzRU3zRBcPHw8gjwdhC3VrgOaU2/r2wsWChqNEdiiV8=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 27, 'FR ATO2024/27', NULL, 'WpEfTf0P1qU8U2iBWAv7PriBwV83CpriSYCIIoQrQRcIXrWgUCzn3hTLYXDxqLHc8Jvic3LqLBbJY/dMeMEKz27TTITdDibV0Jeo1JvKdkxQzzhw/Cz+r0/RISviN0Y163xUUWoCjzlijo1pbl91yLVz/Nlfi1ufY70f5H4nv+g=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 15:30:29', '2024-02-27 15:30:29', NULL, NULL, 'BOING 747-400F', 397, '2024-01-23', '2024-01-23', '13:23:00', '17:40:00', NULL, 29330, NULL, NULL, NULL, 0, 828.776, 'USD', 'USD', NULL, 2346.4, 1944640.0064, 0, 1944640.0064, '1000264137751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 035/24'),
	(138, '2024-02-27;2024-02-27T16:03:29;FR ATO2024/28;448416.73;WpEfTf0P1qU8U2iBWAv7PriBwV83CpriSYCIIoQrQRcIXrWgUCzn3hTLYXDxqLHc8Jvic3LqLBbJY/dMeMEKz27TTITdDibV0Jeo1JvKdkxQzzhw/Cz+r0/RISviN0Y163xUUWoCjzlijo1pbl91yLVz/Nlfi1ufY70f5H4nv+g=', 1, 270, 'TLC LDA', 'TLC', '+244 926 515 109', ' 5401146655', 'dsousa.an@tlc-com.ch', 'Avenida 4 de Fevereiro nº33 Luanda, Angola', 1, 28, 'FR ATO2024/28', NULL, 'npt+0aQ5cgiBkw29mTWagknV4GwXX9SX8IUAKLmaSnOLTspeaNrmwIstMIS6JaWZPdsCiZY2udFFZMI1c1oCpJqux2m23Asg75MePEVt5BRalMHK3m5MVJgLGqgSFCWYfaTA1xwSdaGjHnDo8nWbkXiJjMqCIG44ZxBCQIKX354=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 16:03:29', '2024-02-27 16:03:29', NULL, '00000117515', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3390, '2024-01-24 00:00:00', '2024-01-24 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 541.044, 393348.0054, 55068.720756, 448416.726156, '1000270138751', 1, 4, 2, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 036/24'),
	(139, '2024-02-27;2024-02-27T16:10:41;FR ATO2024/29;108466.58;npt+0aQ5cgiBkw29mTWagknV4GwXX9SX8IUAKLmaSnOLTspeaNrmwIstMIS6JaWZPdsCiZY2udFFZMI1c1oCpJqux2m23Asg75MePEVt5BRalMHK3m5MVJgLGqgSFCWYfaTA1xwSdaGjHnDo8nWbkXiJjMqCIG44ZxBCQIKX354=', 1, 270, 'TLC LDA', 'TLC', '+244 926 515 109', ' 5401146655', 'dsousa.an@tlc-com.ch', 'Avenida 4 de Fevereiro nº33 Luanda, Angola', 1, 29, 'FR ATO2024/29', NULL, 'dXfqJagYTgU8z3+f9d08uvYj05Qcj1qeR0swJI08LvnC1g0d+h9e7tgKsI1WDgDKMiGpHf3OXAKDZplRKySo4pLV/DHFh6AXUp2rp/HcesiNT00QXBr34kt2ruEvVtTS5Gr/jvfADGo1gzoON/4bZje8vrDQNzIfjN0zqv7Uxb8=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 16:10:41', '2024-02-27 16:10:41', NULL, '00000117541', NULL, 0, NULL, NULL, NULL, NULL, NULL, 820, '2024-01-24 00:00:00', '2024-01-24 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 130.872, 95146.1252, 13320.457528, 108466.582728, '1000270139751', 1, 4, 2, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 037/24'),
	(140, '2024-02-27;2024-02-27T16:15:30;FR ATO2024/30;35714.61;dXfqJagYTgU8z3+f9d08uvYj05Qcj1qeR0swJI08LvnC1g0d+h9e7tgKsI1WDgDKMiGpHf3OXAKDZplRKySo4pLV/DHFh6AXUp2rp/HcesiNT00QXBr34kt2ruEvVtTS5Gr/jvfADGo1gzoON/4bZje8vrDQNzIfjN0zqv7Uxb8=', 1, 270, 'TLC LDA', 'TLC', '+244 926 515 109', ' 5401146655', 'dsousa.an@tlc-com.ch', 'Avenida 4 de Fevereiro nº33 Luanda, Angola', 1, 30, 'FR ATO2024/30', NULL, 'Vfiw7DQ2oSDcf7lVR5vKR1sBVnT3wjgvPCrGhtafiDa2MO/Tow1iig2W/x+gFYc1nfy4SjDyJVFV580lW3zpz5pyGppwhzoVLxDrMI/anyNntZsD+LTQoDEndYCv5Why8Pbcx+7rOAy/CS+X/VXc1L7Knw6Yly/UIl9zpf7vdjU=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-27 16:15:30', '2024-02-27 16:15:30', NULL, '00000117552', NULL, 0, NULL, NULL, NULL, NULL, NULL, 270, '2024-01-24 00:00:00', '2024-01-24 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 43.092, 31328.6022, 4386.004308, 35714.606508, '1000270140751', 1, 4, 2, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 038/24'),
	(141, '2024-02-28;2024-02-28T11:53:58;FR ATO2024/31;574072.75;Vfiw7DQ2oSDcf7lVR5vKR1sBVnT3wjgvPCrGhtafiDa2MO/Tow1iig2W/x+gFYc1nfy4SjDyJVFV580lW3zpz5pyGppwhzoVLxDrMI/anyNntZsD+LTQoDEndYCv5Why8Pbcx+7rOAy/CS+X/VXc1L7Knw6Yly/UIl9zpf7vdjU=', 1, 267, 'MULTIFLIGHT LDA', ' MULTIFLIGHT LDA', '+244933535482', '5417323659', 'opsmultiflight@gmail.com', 'Av. Revolução de Outubro, Bloco 47 B-3 Andar', 1, 31, 'FR ATO2024/31', NULL, 'dfKD9xBAz8rYUbrl3ie3AnggwlmdrZ0eydQaU1qljpNbWJuPVbVNecIes+uND6K6cYaiiy1jyhP/o6W2yDwuHJvQZJbi71rVKYkxicOxnt+tr3pTNMIxPySa9jCk1mkF0yf8HJ1b4cjcS+mPiKPuMf0IYRDwcyokkY1gBe5tqJM=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 11:53:58', '2024-02-28 11:53:58', NULL, NULL, 'ANTONOV AN-26', 23, '2024-01-23', '2024-01-24', '16:38:00', '16:22:00', NULL, 3390, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 692.6754, 503572.58536, 70500.1619504, 574072.7473104, '1000267141751', 1, 4, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 039/24'),
	(142, '2024-02-28;2024-02-28T11:59:21;FT ATO2024/8;2707901.26;XWO/c+/EjTYECdSdJBea1R9lF9s9zr3fF3pIiabyBCtSppLAYQ9WFESyz22gd/XiSXxG03z6vQ0+f/9d71fE5mgImlsYEzdv4L3fQCq37PmoGfXvCoFjuUuSqNxVEuOy2VQ7Kh5BzddsdcKAjfHWXkI8gp+5LQtSM7nwTN/6C9E=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 8, 'FT ATO2024/8', NULL, 'b3JW9Dj7YZNj7iiH8VojtyJJbZqirbewtmBKITP7vKsEJXhl1UWv0B692jSkhOljeUaTKUS8WA/+MeJ1zPWUJxh6vMHn0mTuzxXmIcjx6ru6yOIyaAqZQL+nVZsQjEbCzZq80WWWDGtPpEJMh9aTeRreBC1BfXT54km8/Vr7q8I=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-28 11:59:21', '2024-02-28 11:59:21', NULL, NULL, 'BOING 747-400F', 397, '2024-01-25', '2024-01-25', '07:38:00', '10:04:00', NULL, 54193.5, NULL, NULL, NULL, 0, 828.776, 'USD', 'AOA', NULL, 3267.35, 2707901.2636, 0, 2707901.2636, '1000264142750', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 040/24'),
	(143, '2024-02-28;2024-02-28T12:02:22;FT ATO2024/9;584286.09;b3JW9Dj7YZNj7iiH8VojtyJJbZqirbewtmBKITP7vKsEJXhl1UWv0B692jSkhOljeUaTKUS8WA/+MeJ1zPWUJxh6vMHn0mTuzxXmIcjx6ru6yOIyaAqZQL+nVZsQjEbCzZq80WWWDGtPpEJMh9aTeRreBC1BfXT54km8/Vr7q8I=', 1, 267, 'MULTIFLIGHT LDA', 'VULKAN AIR', '+244933535482', '5417323659', 'opsmultiflight@gmail.com', 'Av. Revolução de Outubro, Bloco 47 B-3 Andar', 2, 9, 'FT ATO2024/9', NULL, 'ZnvYdYlaDUsnkWon8IB0cx3vjBqn53gi8ksRD2szmef6+3G+DQSIwOqcUMciehF08mtcHyj4uqrN4dp8rchwT0j0Vxt/EMZMJfGV6cHZgvMo+N655Mi0OnH4VJ5zLi7OK22hWbeRg5z3NF6OOxdo59HcJNwT2u48P1ojxlGaYgA=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 12:02:22', '2024-02-28 12:02:22', NULL, NULL, 'ANTONOV AN-26', 24, '2024-01-23', '2024-01-25', '15:11:00', '11:04:00', NULL, 1095.5, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 704.9988, 512531.65392, 71754.4315488, 584286.0854688, '1000267143751', 2, 2, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 041/24'),
	(144, '2024-02-28;2024-02-28T13:25:35;FT ATO2024/10;3593245.82;ZnvYdYlaDUsnkWon8IB0cx3vjBqn53gi8ksRD2szmef6+3G+DQSIwOqcUMciehF08mtcHyj4uqrN4dp8rchwT0j0Vxt/EMZMJfGV6cHZgvMo+N655Mi0OnH4VJ5zLi7OK22hWbeRg5z3NF6OOxdo59HcJNwT2u48P1ojxlGaYgA=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 10, 'FT ATO2024/10', NULL, 'uT2YWb9jjBpmzwYhLbUc2KuT1gorPhm4o2oSsihLeNgciuJYNR8yC8cw/21o8FJBkmWz5TnkW6QvM+IbFC1abGF+SdnUollBWWcAy48dyW9/Vn8YYcwTCacu69j0kPkY9TmuaJYU5ojWDeXivBwxWLZrJwvgN5IJQPJDUOo/EHY=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-28 13:25:35', '2024-02-28 13:25:35', NULL, NULL, 'BOING 747-400F', 395, '2024-01-25', '2024-01-25', '06:38:00', '09:04:00', NULL, 54193.5, NULL, NULL, NULL, 0, 828.799998, 'USD', 'AOA', NULL, 4335.48, 3593245.815329, 0, 3593245.815329, '1000264144750', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 042/24'),
	(145, '2024-02-28;2024-02-28T13:40:51;FR ATO2024/32;2664349.08;dfKD9xBAz8rYUbrl3ie3AnggwlmdrZ0eydQaU1qljpNbWJuPVbVNecIes+uND6K6cYaiiy1jyhP/o6W2yDwuHJvQZJbi71rVKYkxicOxnt+tr3pTNMIxPySa9jCk1mkF0yf8HJ1b4cjcS+mPiKPuMf0IYRDwcyokkY1gBe5tqJM=', 1, 270, 'TLC LDA', 'TLC', '+244 926 515 109', ' 5401146655', 'dsousa.an@tlc-com.ch', 'Avenida 4 de Fevereiro nº33 Luanda, Angola', 1, 32, 'FR ATO2024/32', NULL, 'lhBcx7SnyrFhT7mQkPgmHxLE3jvWWXHVoWLLVV6yi8+Wn3e0hKkFWQvCprGh2tuK8APtI16pQTx6HxFduEP08j6stjDvKeq/o9/l0CXKpeONE67DkVw4BUDIrk/84iDsBypY8cWbcJsiunaROnbPjNBPBoAo0ypup5dyXQgSbwk=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-28 13:40:51', '2024-02-28 13:40:51', NULL, '259/0173 1494', NULL, 0, NULL, NULL, NULL, NULL, NULL, 6000, '2024-01-17 00:00:00', '2024-01-29 00:00:00', 12, 14, 828.776, 'USD', 'AOA', NULL, 3214.8, 2337148.32, 327200.7648, 2664349.0848, '1000270145750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 043/24'),
	(146, '2024-02-28;2024-02-28T13:47:00;FR ATO2024/33;2961.96;lhBcx7SnyrFhT7mQkPgmHxLE3jvWWXHVoWLLVV6yi8+Wn3e0hKkFWQvCprGh2tuK8APtI16pQTx6HxFduEP08j6stjDvKeq/o9/l0CXKpeONE67DkVw4BUDIrk/84iDsBypY8cWbcJsiunaROnbPjNBPBoAo0ypup5dyXQgSbwk=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'TOTAL E&P ANGOLA, SA', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 33, 'FR ATO2024/33', NULL, 'uXkzM/D2l6Xf1d3odNa8kqr/9tCRfm/0T20UMTm6xwPpn29QaX+jyBJKEQVG6Go79nzmXuXzWQDK8OHF3c5JvojbfKZuItl1BLHFttMg5z0Xn1lYYVmY9kso8nUc3hN2C1hYzUSAWhdlKSrY7rgZMaYaRD183j8Tfi7qNkxWwCA=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 13:47:00', '2024-02-28 13:47:00', NULL, 'C088990', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5.5, '2024-01-24 00:00:00', '2024-01-30 00:00:00', 6, 14, 828.776, 'USD', 'AOA', NULL, 3.5739, 2598.21276, 363.7497864, 2961.9625464, '1000265146751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A NOTA DE PREÇO Nº 044/24'),
	(147, '2024-02-28;2024-02-28T13:48:58;FR ATO2024/34;2170858.73;uXkzM/D2l6Xf1d3odNa8kqr/9tCRfm/0T20UMTm6xwPpn29QaX+jyBJKEQVG6Go79nzmXuXzWQDK8OHF3c5JvojbfKZuItl1BLHFttMg5z0Xn1lYYVmY9kso8nUc3hN2C1hYzUSAWhdlKSrY7rgZMaYaRD183j8Tfi7qNkxWwCA=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'BAKER HUGHES ANGOLA  LDA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 34, 'FR ATO2024/34', NULL, 'PTUyjTfQYcuAsjuw8cZSNUDw3SwIt7sm23EnXrEoPhpxcsEqZs+EKf7C+qYS0wH7xd3jWdWfBsK4eKcDTePZ3+y3ovcFAZmcM833mfQz79aO5HhfFf12cyf/duhQl+FCjOokIK0hsP73orh7BbXwzNTwgnHhO2OpGUfyaAdVcj8=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-28 13:48:58', '2024-02-28 13:48:58', NULL, '574-33995570', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5222, '2024-01-19 00:00:00', '2024-01-30 00:00:00', 11, 14, 828.776, 'USD', 'AOA', NULL, 2619.3552, 1904262.03968, 266596.6855552, 2170858.7252352, '1000266147750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA PREÇO Nº 045/24'),
	(148, '2024-02-28;2024-02-28T14:06:01;FR ATO2024/35;777610.46;PTUyjTfQYcuAsjuw8cZSNUDw3SwIt7sm23EnXrEoPhpxcsEqZs+EKf7C+qYS0wH7xd3jWdWfBsK4eKcDTePZ3+y3ovcFAZmcM833mfQz79aO5HhfFf12cyf/duhQl+FCjOokIK0hsP73orh7BbXwzNTwgnHhO2OpGUfyaAdVcj8=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'ESSO EXPLORATION ANGOLA (BLOCK 15)', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 35, 'FR ATO2024/35', NULL, 'JZtRcVXV9DoWVblUMzzWatpbnTEYzINWennoFQxSVuVi3faPgj286pUA3G/632R5ZZNvy4A9UOoNlG3w0GJVzE2vTja3tCQhY0UUtgixh72ZEj936evDIqbfn5iGIdO/WVRgpQiI0hEUCVl/kS2jeCxDFVsM9pl61R2amFgBAHE=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 14:06:01', '2024-02-28 14:06:01', NULL, 'EDC0740785', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1553, '2024-01-17 00:00:00', '2024-01-31 00:00:00', 14, 14, 828.724, 'USD', 'AOA', NULL, 938.3226, 682114.43716, 95496.0212024, 777610.4583624, '1000266148751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 046/24'),
	(149, '2024-02-28;2024-02-28T14:06:52;FR ATO2024/36;9698892.03;JZtRcVXV9DoWVblUMzzWatpbnTEYzINWennoFQxSVuVi3faPgj286pUA3G/632R5ZZNvy4A9UOoNlG3w0GJVzE2vTja3tCQhY0UUtgixh72ZEj936evDIqbfn5iGIdO/WVRgpQiI0hEUCVl/kS2jeCxDFVsM9pl61R2amFgBAHE=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'BAKER HUGHES ANGOLA LDA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 36, 'FR ATO2024/36', NULL, 'C6QL4O9BOcFqe0h+GElbmOQOmd0fLfyYoO9TpFZMaSm7Y4v2WJ3NkLw05XhAorpVkWRUvFwg7i5H8Gjv3a9BgUi6hNc47vMd9F8NblNtA45cJhSYKM8ZCx0WVpL+N29nfHGqQzd/ufW1P1tJ8H9CiJkw+wwfVJ0A3WudM0KoXjY=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-28 14:06:52', '2024-02-28 14:06:52', NULL, '574-33999254', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29330, '2024-01-23 00:00:00', '2024-01-31 00:00:00', 8, 14, 828.776, 'USD', 'AOA', NULL, 11702.67, 8507800.028, 1191092.00392, 9698892.03192, '1000266149750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 047/24'),
	(151, '2024-02-28;2024-02-28T15:09:56;FT ATO2024/11;1376696.39;uT2YWb9jjBpmzwYhLbUc2KuT1gorPhm4o2oSsihLeNgciuJYNR8yC8cw/21o8FJBkmWz5TnkW6QvM+IbFC1abGF+SdnUollBWWcAy48dyW9/Vn8YYcwTCacu69j0kPkY9TmuaJYU5ojWDeXivBwxWLZrJwvgN5IJQPJDUOo/EHY=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 11, 'FT ATO2024/11', NULL, 'aMZKAzVA7DU3zMHEAod8yWBG17/9GNqTWScwSTlEyBdWr8mggFi9CcivMH1SWGP1TipNNsoxCO6hkn8zwU/Tdo4fBYKIlRLXGQLZQnyi+oq3vYnjUGEbrQ3p378p1kFYsANywrHfVYcYlDfoEQRLHM5vmlRpywjJYoVVFb67kL0=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-28 15:09:56', '2024-02-28 15:09:56', NULL, NULL, 'BOING 747-400F', 397, '2024-01-26', '2024-01-28', '06:13:00', '17:04:00', NULL, 20764, NULL, NULL, NULL, 0, 828.776, 'USD', 'AOA', NULL, 1661.12, 1376696.38912, 0, 1376696.38912, '1000264151750', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 049/24'),
	(152, '2024-02-28;2024-02-28T15:47:41;FT ATO2024/12;12502085.96;aMZKAzVA7DU3zMHEAod8yWBG17/9GNqTWScwSTlEyBdWr8mggFi9CcivMH1SWGP1TipNNsoxCO6hkn8zwU/Tdo4fBYKIlRLXGQLZQnyi+oq3vYnjUGEbrQ3p378p1kFYsANywrHfVYcYlDfoEQRLHM5vmlRpywjJYoVVFb67kL0=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'GRUPO LIZ', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 12, 'FT ATO2024/12', NULL, 'v6mwHEm1eoWgQ4OvX2Xuon41jzPkI7unhvymKfR+stmtvKJd4MuVWVUuh6XbIV0TqoQK+k8334Qio9HAzzHSnLQMPq3YOBvwbaC6hdnX96IdNBXznN9ExTq/kvQnYGVtKIiMW30BnhJCR6JfAUbzP65nnDJpZ5jvXXCkQlVvwCo=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 15:47:41', '2024-02-28 15:47:41', NULL, '...', NULL, 0, NULL, NULL, NULL, NULL, NULL, 60340, '2024-01-26 00:00:00', '2024-01-28 00:00:00', 2, 0, 828.776, 'USD', 'AOA', NULL, 15085, 12502085.96, 0, 12502085.96, '1000264152751', 2, 2, 1, 'Y', 'N', 'N', 0, 0, 1, 6, 'REFERENTE A NOTA DE PREÇO Nº050/24'),
	(153, '2024-02-28;2024-02-28T15:54:40;FT ATO2024/13;5863457.60;v6mwHEm1eoWgQ4OvX2Xuon41jzPkI7unhvymKfR+stmtvKJd4MuVWVUuh6XbIV0TqoQK+k8334Qio9HAzzHSnLQMPq3YOBvwbaC6hdnX96IdNBXznN9ExTq/kvQnYGVtKIiMW30BnhJCR6JfAUbzP65nnDJpZ5jvXXCkQlVvwCo=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'BAKER HUGHES ANGOLA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 2, 13, 'FT ATO2024/13', NULL, 'q0JMdEuADcLKnXeNnBk9B4rZFUWnnBuw7uwy5zzKdNtAK6svorbci2vjUNkD5xgzT3jafR5VEpj8mTcuwt5SRuzGc3b7UShscgmRhj35W4fE0XUSj+TuE+2Sg1S/NQsQEbQwKwcA2lQHADaDoozc7jxmQWTQarKFKndRCjGs2LQ=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 15:54:40', '2024-02-28 15:54:40', NULL, '57434004972', NULL, 0, NULL, NULL, NULL, NULL, NULL, 31030, '2024-01-30 00:00:00', '2024-02-02 00:00:00', 3, 14, 828.776, 'USD', 'AOA', NULL, 7074.84, 5143383.856, 720073.73984, 5863457.59584, '1000266153751', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº051/24'),
	(154, '2024-02-28;2024-02-28T16:03:59;FR ATO2024/37;203699.88;C6QL4O9BOcFqe0h+GElbmOQOmd0fLfyYoO9TpFZMaSm7Y4v2WJ3NkLw05XhAorpVkWRUvFwg7i5H8Gjv3a9BgUi6hNc47vMd9F8NblNtA45cJhSYKM8ZCx0WVpL+N29nfHGqQzd/ufW1P1tJ8H9CiJkw+wwfVJ0A3WudM0KoXjY=', 1, 270, 'TLC LDA', 'SCHLUMBERGER LOGELCO, INC', '+244 926 515 109', ' 5401146655', 'dsousa.an@tlc-com.ch', 'Avenida 4 de Fevereiro nº33 Luanda, Angola', 1, 37, 'FR ATO2024/37', NULL, 'WUCc+FQiELLSED75dDArzHLmoYYwm88Y9hpvDLqJZOdr3fru8DXXrdE4rnZw3boxvPZ/lpYxB2MFT9gJwf+pepnGm6eqxdgx6J7XFLoEAFbzlNVzHZxvd8Hw6hs3eeDFZzuWycqpy7JEVloY7T2I7WcOb61eNbZay2eT+JfV2XY=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 16:03:59', '2024-02-28 16:03:59', NULL, 'CVK-0001-3304', NULL, 0, NULL, NULL, NULL, NULL, NULL, 220, '2024-01-03 00:00:00', '2024-02-01 00:00:00', 29, 14, 828.776, 'USD', 'AOA', NULL, 245.784, 178684.1056, 25015.774784, 203699.880384, '1000270154751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 052/24'),
	(155, '2024-02-28;2024-02-28T16:08:49;FR ATO2024/38;2707901.26;WUCc+FQiELLSED75dDArzHLmoYYwm88Y9hpvDLqJZOdr3fru8DXXrdE4rnZw3boxvPZ/lpYxB2MFT9gJwf+pepnGm6eqxdgx6J7XFLoEAFbzlNVzHZxvd8Hw6hs3eeDFZzuWycqpy7JEVloY7T2I7WcOb61eNbZay2eT+JfV2XY=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 38, 'FR ATO2024/38', NULL, 'JOIJp2UxaiCugsX2nJG52YPpTYfsMAJvE8s0LyoFSRPdzl6m3fqMbrkxXEp26fiioHN0q3zKf3zhkI0KO8rhOCacJTa+caA3b81W8GigdnnD6abrz3YuU9fGd3bbuUVmJi+nYMYrKyIsT6A4M5RoaxEDQA45lzKd+rYsYJfi9AM=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 16:08:49', '2024-02-28 16:08:49', NULL, NULL, 'BOING 747-400F', 397, '2024-01-30', '2024-01-30', '11:02:00', '13:46:00', NULL, NULL, NULL, NULL, NULL, 0, 828.776, 'USD', 'AOA', NULL, 3267.35, 2707901.2636, 0, 2707901.2636, '1000264155751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 053/24'),
	(157, '2024-02-28;2024-02-28T16:30:06;FR ATO2024/39;2057353.54;JOIJp2UxaiCugsX2nJG52YPpTYfsMAJvE8s0LyoFSRPdzl6m3fqMbrkxXEp26fiioHN0q3zKf3zhkI0KO8rhOCacJTa+caA3b81W8GigdnnD6abrz3YuU9fGd3bbuUVmJi+nYMYrKyIsT6A4M5RoaxEDQA45lzKd+rYsYJfi9AM=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 39, 'FR ATO2024/39', NULL, 'B7yQr9Bzokb9+QtSAFa/WLNVfLbTpcHIQWsndxwLC/80qvA22AVxWkNlDBVukVPCx5daOqN06WlMfsdB0v5VZYAog3S+aY1KOyiGVadHhv7RC7xHE5u6OKwmYiE/xrxPZOQJB8g/cQq0K0VnfZsGuJrIj+Y7S4/hXogWoc7cqno=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 16:30:06', '2024-02-28 16:30:06', NULL, NULL, 'BOING 747-400F/ASTRA 11839', 397, '2024-01-30', '2024-01-30', '11:02:00', '13:46:00', NULL, 31030, NULL, NULL, NULL, 0, 828.776, 'USD', 'USD', NULL, 2482.4, 2057353.5424, 0, 2057353.5424, '1000264157751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 054/24'),
	(158, '2024-02-28;2024-02-28T16:33:29;FT ATO2024/14;2261172.60;q0JMdEuADcLKnXeNnBk9B4rZFUWnnBuw7uwy5zzKdNtAK6svorbci2vjUNkD5xgzT3jafR5VEpj8mTcuwt5SRuzGc3b7UShscgmRhj35W4fE0XUSj+TuE+2Sg1S/NQsQEbQwKwcA2lQHADaDoozc7jxmQWTQarKFKndRCjGs2LQ=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 14, 'FT ATO2024/14', NULL, 'MHkSe8+CVjWlgGtru1lUv67xork7h9VNHgY8lTiEvcCfyT+qKaJ53y4uyar4jmoWSbAmZ1ozNjvj3cl18hyzrCSbw5tMRn90mGsnu1F6QGOg/H2QkIuH6IhXyhs6HK0H9mDXTBpUkYj6RsasK/kEb8nslAZNeKO/2zqtqTbKZzU=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-28 16:33:29', '2024-02-28 16:33:29', NULL, NULL, 'BOING 737-800', 77, '2024-01-30', '2024-01-30', '11:40:00', '13:57:00', NULL, 22620, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 2728.3278, 1983484.73752, 277687.8632528, 2261172.6007728, '1000269158751', 2, 2, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 055/24'),
	(159, '2024-02-29;2024-02-29T12:08:48;FR ATO2024/40;880746.89;B7yQr9Bzokb9+QtSAFa/WLNVfLbTpcHIQWsndxwLC/80qvA22AVxWkNlDBVukVPCx5daOqN06WlMfsdB0v5VZYAog3S+aY1KOyiGVadHhv7RC7xHE5u6OKwmYiE/xrxPZOQJB8g/cQq0K0VnfZsGuJrIj+Y7S4/hXogWoc7cqno=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'ESSO EXPLORATION (BLOCK 15) PANALPINA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 40, 'FR ATO2024/40', NULL, 'fZB7dm4gVtexW0FFYfC+aMckrsdEa5gmJlixMve6cBb2DWvlkFYN4Q8IRSCf7U58unTbFkr9PP9Jl9a7TBtPfbCBFUpHEzgkO/cKabvnePuhOIqQNNarWtZPP3R14dTkSXBqnf1/27F+kRSQVr3aEmYurF4VJgO3PAQ9c892I2A=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-29 12:08:48', '2024-02-29 12:08:48', NULL, '242AMS22057291', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1580, '2024-01-17 00:00:00', '2024-02-02 00:00:00', 16, 14, 828.776, 'USD', 'AOA', NULL, 1062.708, 772584.9872, 108161.898208, 880746.885408, '1000266159750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 056/24'),
	(160, '2024-02-29;2024-02-29T12:16:06;PP ATO2024/1;2612173.88;', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 1, 'FP ATO2024/1', NULL, 'OF2aJtwXFj00EqCLLQVZL/cvqoif6jVPIrGwIIl0dPWtw+7fryhcnZ3p090KuseJHW+pr+cxVhAQUaS9T52XS/TMZOfgNOZPwgj/oRyBKVNbwHOaB//TpKSSEkFJ1j0XlAvuHv0PAXt6Dm586TmmLw026g25rmP+NiUfInP9bQ4=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-29 12:16:06', '2024-02-29 12:16:06', NULL, NULL, 'BOING 737-800', 79, '2024-01-31', '2024-01-31', '15:16:00', '17:17:00', NULL, 22350, NULL, NULL, NULL, 14, 828.799, 'USD', 'AOA', NULL, 3151.758, 2291380.5953, 320793.283342, 2612173.878642, '1000269160750', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 057/24'),
	(161, '2024-02-29;2024-02-29T12:20:34;FT ATO2024/15;2612173.88;MHkSe8+CVjWlgGtru1lUv67xork7h9VNHgY8lTiEvcCfyT+qKaJ53y4uyar4jmoWSbAmZ1ozNjvj3cl18hyzrCSbw5tMRn90mGsnu1F6QGOg/H2QkIuH6IhXyhs6HK0H9mDXTBpUkYj6RsasK/kEb8nslAZNeKO/2zqtqTbKZzU=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 15, 'FT ATO2024/15', NULL, 'LoMeNDUlec+M4VzB17PtoCrEaynwY9yJKYU1Tq66NNcnd+nprlIiANFAjZvCa6D8rod1f1zLnah/+ac/KQ32C1YPFU1uEZ9Hi3Jp6/inBdFRmnGPyixaoSKTcwVM6re4za+bTmRh6ieeQvGXtEMmIEkPPtWEb2OwbqvT7GcfsZQ=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-29 12:20:34', '2024-02-29 12:20:34', NULL, NULL, 'BOING 737-800', 79, '2024-01-31', '2024-01-31', '15:16:00', '17:17:00', NULL, 22350, NULL, NULL, NULL, 14, 828.799, 'USD', 'AOA', NULL, 3151.758, 2291380.5953, 320793.283342, 2612173.878642, '1000269161750', 2, 2, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 057/24'),
	(162, '2024-02-29;2024-02-29T12:25:39;FR ATO2024/41;8752.12;fZB7dm4gVtexW0FFYfC+aMckrsdEa5gmJlixMve6cBb2DWvlkFYN4Q8IRSCf7U58unTbFkr9PP9Jl9a7TBtPfbCBFUpHEzgkO/cKabvnePuhOIqQNNarWtZPP3R14dTkSXBqnf1/27F+kRSQVr3aEmYurF4VJgO3PAQ9c892I2A=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY ANGOLA', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 41, 'FR ATO2024/41', NULL, 'EH2OA5prP3IVu1DZMf1w61/qlaPu1u1M+1M25siKEE6zhhNq7+nGyGfbFLxlEgLDDwDqXqo4mhvgMXIuat661ktsgRwaSOJiEBPtpHzcGFx5FX1nwkT5KWpzDXKpqZAxnrlIJEJLrc/m/uuVaDpbI26bYhz5DkT9ey2DqLOSHIA=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-29 12:25:39', '2024-02-29 12:25:39', NULL, 'MIL20729877', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24, '2024-01-26 00:00:00', '2024-02-06 00:00:00', 11, 0, 828.799, 'USD', 'AOA', NULL, 10.56, 8752.11744, 0, 8752.11744, '1000273162750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 058/24'),
	(163, '2024-02-29;2024-02-29T12:52:27;FR ATO2024/42;2315664.41;EH2OA5prP3IVu1DZMf1w61/qlaPu1u1M+1M25siKEE6zhhNq7+nGyGfbFLxlEgLDDwDqXqo4mhvgMXIuat661ktsgRwaSOJiEBPtpHzcGFx5FX1nwkT5KWpzDXKpqZAxnrlIJEJLrc/m/uuVaDpbI26bYhz5DkT9ey2DqLOSHIA=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 42, 'FR ATO2024/42', NULL, 'G3Pdk+KzzyHVZgEJejkxboiu3Kh4UmrBAemTvY6HzYWqmG2ziuAj7E20xjhsj53wT6uy91HNsqi+FeCcGbPCy7Fj15kiKHk62w9rS/0Z9vgFR5rtLX54toKR5NjMW8KuTy0l3e16qyukAdHsfjwxTV1Uei0GNoDA+i3VQho9UZk=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-29 12:52:27', '2024-02-29 12:52:27', NULL, 'MIL20729878', NULL, 0, NULL, NULL, NULL, NULL, NULL, 6350, '2024-01-26 00:00:00', '2024-02-06 00:00:00', 11, 0, 828.799, 'USD', 'AOA', NULL, 2794, 2315664.406, 0, 2315664.406, '1000273163750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 059/24'),
	(164, '2024-02-29;2024-02-29T12:56:47;FR ATO2024/43;1281091.19;G3Pdk+KzzyHVZgEJejkxboiu3Kh4UmrBAemTvY6HzYWqmG2ziuAj7E20xjhsj53wT6uy91HNsqi+FeCcGbPCy7Fj15kiKHk62w9rS/0Z9vgFR5rtLX54toKR5NjMW8KuTy0l3e16qyukAdHsfjwxTV1Uei0GNoDA+i3VQho9UZk=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY ', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 43, 'FR ATO2024/43', NULL, 'eGVNfJRfMOooc7bCCREDGIqHMF7ci3cA+LCCtLtQefLW0B7Q09gVRPq53ne2aNXlS0UPvc3tkEPN0gZuAS9KWM8amGEP7wwQId990gBjtgZgYuiySPGt2uKFyne05n+d8MghG3JPBgsBChmIruFUztIcZc1CnKAEgTO7AOCts8U=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-29 12:56:47', '2024-02-29 12:56:47', NULL, 'MIL20729879', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3513, '2024-01-26 00:00:00', '2024-02-06 00:00:00', 11, 0, 828.799, 'USD', 'AOA', NULL, 1545.72, 1281091.19028, 0, 1281091.19028, '1000273164750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 060/24'),
	(165, '2024-02-29;2024-02-29T12:59:28;FR ATO2024/44;51783.36;eGVNfJRfMOooc7bCCREDGIqHMF7ci3cA+LCCtLtQefLW0B7Q09gVRPq53ne2aNXlS0UPvc3tkEPN0gZuAS9KWM8amGEP7wwQId990gBjtgZgYuiySPGt2uKFyne05n+d8MghG3JPBgsBChmIruFUztIcZc1CnKAEgTO7AOCts8U=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 44, 'FR ATO2024/44', NULL, 'krYux3pMHyBGonPUaASxKxXK+9EUDhVfhntSgxSvky36b+c53jYN/Q0ovbLSlixafRSNgk7uXLbQINqesmKd48NaLLFpbIzIoxPjSDsvJTBCnThkS3gcYUBM+ezOc791ZG+J5HVFcYDvJqX1MHFaW7+2VnKQDb+CW1IB0ws7yYI=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-29 12:59:28', '2024-02-29 12:59:28', NULL, 'MIL20729881', NULL, 0, NULL, NULL, NULL, NULL, NULL, 142, '2024-01-26 00:00:00', '2024-02-06 00:00:00', 11, 0, 828.799, 'USD', 'AOA', NULL, 62.48, 51783.36152, 0, 51783.36152, '1000273165750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 061/24'),
	(166, '2024-02-29;2024-02-29T13:02:29;FR ATO2024/45;379258.42;krYux3pMHyBGonPUaASxKxXK+9EUDhVfhntSgxSvky36b+c53jYN/Q0ovbLSlixafRSNgk7uXLbQINqesmKd48NaLLFpbIzIoxPjSDsvJTBCnThkS3gcYUBM+ezOc791ZG+J5HVFcYDvJqX1MHFaW7+2VnKQDb+CW1IB0ws7yYI=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 45, 'FR ATO2024/45', NULL, 'To+yN63AbWlHeJgktVrAB3hLtmsqS5iJ8Os2CnCD9K7590b7RDcMdQllYBbD2OLej3SjHa3E34ho1TkIqxmqH7MSeIMzvDyW4pqAIVlPapG57wOfAuFxfiV/gCSsD1C/3Ih3oLU+pXcvgkVk4osVe8znQPZIg6fo7IebhdvJF6s=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-02-29 13:02:29', '2024-02-29 13:02:29', NULL, 'MIL20729882', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1040, '2024-01-26 00:00:00', '2024-02-06 00:00:00', 11, 0, 828.799, 'USD', 'AOA', NULL, 457.6, 379258.4224, 0, 379258.4224, '1000273166750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 062/24'),
	(167, '2024-02-29;2024-02-29T15:38:57;PP ATO2024/2;2938471.38;OF2aJtwXFj00EqCLLQVZL/cvqoif6jVPIrGwIIl0dPWtw+7fryhcnZ3p090KuseJHW+pr+cxVhAQUaS9T52XS/TMZOfgNOZPwgj/oRyBKVNbwHOaB//TpKSSEkFJ1j0XlAvuHv0PAXt6Dm586TmmLw026g25rmP+NiUfInP9bQ4=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'DSV AIR SERVICE S.A.', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 3, 2, 'FP ATO2024/2', NULL, 'vkG7EgVUm37aNCiu2Ws18iPe5WXOXwbm93aOX448t61zvftSud0Ge80I656sVF4x6CKXVz6MCZsMTIwELqFJVGhZg0dBFeEWMdp/O0C8cDRyZJfvbdyDs8nqwuJ4SLkqqBxBrNA8r5qTcLbx9cPq+08EFDqrwdBudJgXSTyKqbg=', NULL, 1, 1, 751, 'Milton Lucas', '2024-02-29 15:38:57', '2024-02-29 15:38:57', NULL, '11811508280', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10728, '2024-02-24 00:00:00', '2024-03-01 00:00:00', 6, 14, 828.514, 'USD', 'AOA', NULL, 3546.6768, 2577606.47568, 360864.9065952, 2938471.3822752, '1000266167751', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº118-11508280'),
	(168, '2024-03-01;2024-03-01T10:22:06;FR ATO2024/46;137116.51;To+yN63AbWlHeJgktVrAB3hLtmsqS5iJ8Os2CnCD9K7590b7RDcMdQllYBbD2OLej3SjHa3E34ho1TkIqxmqH7MSeIMzvDyW4pqAIVlPapG57wOfAuFxfiV/gCSsD1C/3Ih3oLU+pXcvgkVk4osVe8znQPZIg6fo7IebhdvJF6s=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 46, 'FR ATO2024/46', NULL, 'lWSIjx/M3ZPXGvVF4U6phU0YyQVZ6DKSUNOFQbu0m8/ROI4koTODrVIzq2kCIGFG5fgmrWzNzZuYBpwnP+2pLOE7AtlljFGtcHTbuXZ2zRtaD4bpCFeNHssdHpsMUghjvwPfM44OBPdXDFEsCXC1JqZ93gIiIoxwUp2PXl32fHU=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 10:22:06', '2024-03-01 10:22:06', NULL, 'MIL20729883', NULL, 0, NULL, NULL, NULL, NULL, NULL, 376, '2024-01-26 00:00:00', '2024-02-06 00:00:00', 11, 0, 828.799, 'USD', 'AOA', NULL, 165.44, 137116.50656, 0, 137116.50656, '1000273168750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 063/24'),
	(169, '2024-03-01;2024-03-01T10:25:47;FR ATO2024/47;6928.76;lWSIjx/M3ZPXGvVF4U6phU0YyQVZ6DKSUNOFQbu0m8/ROI4koTODrVIzq2kCIGFG5fgmrWzNzZuYBpwnP+2pLOE7AtlljFGtcHTbuXZ2zRtaD4bpCFeNHssdHpsMUghjvwPfM44OBPdXDFEsCXC1JqZ93gIiIoxwUp2PXl32fHU=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 47, 'FR ATO2024/47', NULL, 'EIYXSC4q5Q1PFcdscx9pWPhfMviYNRAVVWMlApBg9q+5yuFApWg8GOttUt8d5gS4gahkWEcW52bvU1wlK6VL7kNvwJ81/F4br9KVQGjbLE78sDqrRL9Uk4wpQB6X7ogg1FlXEdM/MwT34SZrwaYRowRsF7TrlAeHxkxWVrXjrHk=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 10:25:47', '2024-03-01 10:25:47', NULL, 'MIL20729884', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19, '2024-01-26 00:00:00', '2024-02-06 00:00:00', 11, 0, 828.799, 'USD', 'AOA', NULL, 8.36, 6928.75964, 0, 6928.75964, '1000273169750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 064/24'),
	(170, '2024-03-01;2024-03-01T10:28:43;FR ATO2024/48;10210.80;EIYXSC4q5Q1PFcdscx9pWPhfMviYNRAVVWMlApBg9q+5yuFApWg8GOttUt8d5gS4gahkWEcW52bvU1wlK6VL7kNvwJ81/F4br9KVQGjbLE78sDqrRL9Uk4wpQB6X7ogg1FlXEdM/MwT34SZrwaYRowRsF7TrlAeHxkxWVrXjrHk=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 48, 'FR ATO2024/48', NULL, 'aAtMo0s7dEklKg7y/EoF5SBv1dQa3hQPclJHKePe3cz/Bjllm/QYjVUc74ptYGWsWv6CkGpTGfd6ZxhqW4w/H0hnDK2Iqph5YgRGp/m40rd+XdqSJ/DOqETStOS7Xk5aU4iPAFPHWpajxO61skqtr38ZuFbLmgX5jb7IXBYeRLg=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 10:28:43', '2024-03-01 10:28:43', NULL, 'MIL20729885', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28, '2024-01-26 00:00:00', '2024-02-06 00:00:00', 11, 0, 828.799, 'USD', 'AOA', NULL, 12.32, 10210.80368, 0, 10210.80368, '1000273170750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 065/24'),
	(171, '2024-03-01;2024-03-01T10:33:12;FR ATO2024/49;298566.55;aAtMo0s7dEklKg7y/EoF5SBv1dQa3hQPclJHKePe3cz/Bjllm/QYjVUc74ptYGWsWv6CkGpTGfd6ZxhqW4w/H0hnDK2Iqph5YgRGp/m40rd+XdqSJ/DOqETStOS7Xk5aU4iPAFPHWpajxO61skqtr38ZuFbLmgX5jb7IXBYeRLg=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'ESSO EXPLORATION PANALPINA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 49, 'FR ATO2024/49', NULL, 'CBz+Qobpx+alG64AEzbLO6J+mRJl5Ej/bCMZIclyJUDyGoIJeE5Rgaj66AechuHv/G9oe0+rBpbprQy0ZlN7ZJ0TeqsHvxRB7gN4Ssp9i8oOTTvFm0QS+/gXtZD7oyI0vdWfCNPWO+ltxCfi7P6Uk5cGXOIw7e+23N5GXgIdgX4=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 10:33:12', '2024-03-01 10:33:12', NULL, '242AMS22057291', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1580, '2024-02-03 00:00:00', '2024-02-06 00:00:00', 3, 14, 828.799, 'USD', 'AOA', NULL, 360.24, 261900.484, 36666.06776, 298566.55176, '1000266171750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA PREÇO Nº 066/24'),
	(172, '2024-03-01;2024-03-01T10:39:15;FT ATO2024/16;4871736.88;LoMeNDUlec+M4VzB17PtoCrEaynwY9yJKYU1Tq66NNcnd+nprlIiANFAjZvCa6D8rod1f1zLnah/+ac/KQ32C1YPFU1uEZ9Hi3Jp6/inBdFRmnGPyixaoSKTcwVM6re4za+bTmRh6ieeQvGXtEMmIEkPPtWEb2OwbqvT7GcfsZQ=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 2, 16, 'FT ATO2024/16', NULL, 'ivJG6+4ZnmWuVxiCvEckMdgMoHuDGfSRlnRmmgjc6mvpbdzLw4QTvMwbK4XffjWUzTqG2X5m0dxuC2ql4tzRnVwKCgg/iNB80NoAkgSnU5/Ob7hOgavUeJyeo0fQ/f5nJrpNZFEMxy5VXAplPnkvd3xFwB5ftMzpChXrb8kvb9o=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 10:39:15', '2024-03-01 10:39:15', NULL, '118-1231 2204', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17780, '2024-01-31 00:00:00', '2024-02-06 00:00:00', 6, 14, 828.799, 'USD', 'AOA', NULL, 5878.068, 4273453.4038, 598283.476532, 4871736.880332, '10003172750', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 067/24'),
	(173, '2024-03-01;2024-03-01T10:45:16;FR ATO2024/50;34013.91;CBz+Qobpx+alG64AEzbLO6J+mRJl5Ej/bCMZIclyJUDyGoIJeE5Rgaj66AechuHv/G9oe0+rBpbprQy0ZlN7ZJ0TeqsHvxRB7gN4Ssp9i8oOTTvFm0QS+/gXtZD7oyI0vdWfCNPWO+ltxCfi7P6Uk5cGXOIw7e+23N5GXgIdgX4=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 50, 'FR ATO2024/50', NULL, 'rURsYf7//uUsFIZ37ACeTr+ba5ph4HBOsegJjmkkRdu6/qYiE8JnL/gW+wzoeKHQ7QgekV6QWO4gKxQLTCgihGQZ6B/ODfZ3znDaT/c8wMtxl7jVSF8C/mMvHxLjMKoEwXgdUqa/mRQCnKyIzNHNBDEAQUewxxr4kbEvZH5nb+Q=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 10:45:16', '2024-03-01 10:45:16', NULL, '000 0011 7574', NULL, 0, NULL, NULL, NULL, NULL, NULL, 100, '2024-02-06 00:00:00', '2024-02-09 00:00:00', 3, 14, 828.799, 'USD', 'AOA', NULL, 41.04, 29836.764, 4177.14696, 34013.91096, '1000265173750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A NOTA DE PREÇO Nº 068/24'),
	(174, '2024-03-01;2024-03-01T10:50:50;FT ATO2024/17;1650411.65;ivJG6+4ZnmWuVxiCvEckMdgMoHuDGfSRlnRmmgjc6mvpbdzLw4QTvMwbK4XffjWUzTqG2X5m0dxuC2ql4tzRnVwKCgg/iNB80NoAkgSnU5/Ob7hOgavUeJyeo0fQ/f5nJrpNZFEMxy5VXAplPnkvd3xFwB5ftMzpChXrb8kvb9o=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 17, 'FT ATO2024/17', NULL, 'd8GKcm7qEbMVYBZe5Wij9kcbFJk4rfo8txvrOPdYXHak2oS4zSYVftonQEI8KdCl1E4tGRryCEj3st0OVtUUEmwf9aLaZedppnI+3rX8p8M96O3AWthQI29Z9IizxL00LevG2/IiBER38R8wyRwobZyrqUf4xCMW3xo8Ib8DlZ0=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 10:50:50', '2024-03-01 10:50:50', NULL, NULL, 'BOING 737-800', 79, '2024-02-06', '2024-02-06', '13:16:00', '14:59:00', NULL, 14573, NULL, NULL, NULL, 14, 828.799, 'USD', 'AOA', NULL, 1991.3292, 1447729.51722, 202682.1324108, 1650411.6496308, '1000269174750', 2, 2, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 069/24'),
	(175, '2024-03-01;2024-03-01T11:01:25;FR ATO2024/51;1915354.49;rURsYf7//uUsFIZ37ACeTr+ba5ph4HBOsegJjmkkRdu6/qYiE8JnL/gW+wzoeKHQ7QgekV6QWO4gKxQLTCgihGQZ6B/ODfZ3znDaT/c8wMtxl7jVSF8C/mMvHxLjMKoEwXgdUqa/mRQCnKyIzNHNBDEAQUewxxr4kbEvZH5nb+Q=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY EXPLORATION LDA', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 51, 'FR ATO2024/51', NULL, 'L1SR22TSnyaqJZLhLqQo6NyOdnE/XByeZXGJc7UMGIqk90U9bi0xnWmFT8XWNeMveXA1o11MKhVjEzSY+DsFCRW8i0yKGGjStPNWvzk7JWhUxqZ2T0QipLiIiC5bzqc2BibIaE9hvYTFvcnwQLItwawdSmp1cRvqdXNgIQfX6TE=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 11:01:25', '2024-03-01 11:01:25', NULL, '259OSL01733723', NULL, 0, NULL, NULL, NULL, NULL, NULL, 4622, '2024-01-26 00:00:00', '2024-02-08 00:00:00', 13, 0, 828.799, 'USD', 'AOA', NULL, 2311, 1915354.489, 0, 1915354.489, '1000273175750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 070/24'),
	(176, '2024-03-01;2024-03-01T11:06:12;FR ATO2024/52;1904165.70;L1SR22TSnyaqJZLhLqQo6NyOdnE/XByeZXGJc7UMGIqk90U9bi0xnWmFT8XWNeMveXA1o11MKhVjEzSY+DsFCRW8i0yKGGjStPNWvzk7JWhUxqZ2T0QipLiIiC5bzqc2BibIaE9hvYTFvcnwQLItwawdSmp1cRvqdXNgIQfX6TE=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY EXPLORATION LDA', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 52, 'FR ATO2024/52', NULL, 'dDaYx5lHLQxiFX6fQV/XlNn4yDeNnrRnose8LPIGYvhlx0X2uk583I0vOZbowXxxD5COSIPODre2e0Sh4nDw/8/DahXFKQeqn4aQQz0pz/Owm/csDK3IXMP+6dYXlYA84SRVti6HUjmC5kpGG+NnwWJ/fVAqc6/QHpDsjz4yX7g=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 11:06:12', '2024-03-01 11:06:12', NULL, 'MIL20729876', NULL, 0, NULL, NULL, NULL, NULL, NULL, 4595, '2024-01-26 00:00:00', '2024-02-08 00:00:00', 13, 0, 828.799, 'USD', 'AOA', NULL, 2297.5, 1904165.7025, 0, 1904165.7025, '1000273176750', 1, 4, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 071/24'),
	(177, '2024-03-01;2024-03-01T11:09:12;FT ATO2024/18;2002096.59;d8GKcm7qEbMVYBZe5Wij9kcbFJk4rfo8txvrOPdYXHak2oS4zSYVftonQEI8KdCl1E4tGRryCEj3st0OVtUUEmwf9aLaZedppnI+3rX8p8M96O3AWthQI29Z9IizxL00LevG2/IiBER38R8wyRwobZyrqUf4xCMW3xo8Ib8DlZ0=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 2, 18, 'FT ATO2024/18', NULL, 'Ih7FJ6BetVLLYXNkZDlo0zLEZ4zxfj4TwqoxPLVumeJL5mX63wBKqMBwRtW+tfUDyFcO1dpyu9HN2IPE1rwiBS8Z6L90mJXNqVxTsPl0EINQpamH2HqN18QQ6n02N+t3kG7faKXXvg8hFNoO1FcQejtq3Pm1awDbaPt45L4huU0=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 11:09:12', '2024-03-01 11:09:12', NULL, '118-1231 2171', NULL, 0, NULL, NULL, NULL, NULL, NULL, 8150, '2024-01-31 00:00:00', '2024-02-05 00:00:00', 5, 14, 828.799, 'USD', 'AOA', NULL, 2415.66, 1756225.081, 245871.51134, 2002096.59234, '10003177750', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 072/24'),
	(178, '2024-03-01;2024-03-01T11:15:26;FR ATO2024/53;253781.57;dDaYx5lHLQxiFX6fQV/XlNn4yDeNnrRnose8LPIGYvhlx0X2uk583I0vOZbowXxxD5COSIPODre2e0Sh4nDw/8/DahXFKQeqn4aQQz0pz/Owm/csDK3IXMP+6dYXlYA84SRVti6HUjmC5kpGG+NnwWJ/fVAqc6/QHpDsjz4yX7g=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'ESSO EXPLORATION PANALPINA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 53, 'FR ATO2024/53', NULL, 'spUTLZMr54dUtN+J7mIDVwuHUp53aTrR5oWejOX71aP+ejH2vjbSPAoLfo5PBTJb1k8tMNnRePlFnSKh+rvQCFILbZYRjOzlghtW/6luesQR/3JJ6dvWtCIoNzEHaYAxooVwiu3VmNfR545o2DifXKMsMab47/am3PdnjwlDFLw=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 11:15:26', '2024-03-01 11:15:26', NULL, '242AMS22057291', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1580, '2024-02-07 00:00:00', '2024-02-09 00:00:00', 2, 14, 828.799, 'USD', 'AOA', NULL, 306.204, 222615.4114, 31166.157596, 253781.568996, '1000266178750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 073/24'),
	(179, '2024-03-01;2024-03-01T11:29:12;FR ATO2024/54;2492734.31;spUTLZMr54dUtN+J7mIDVwuHUp53aTrR5oWejOX71aP+ejH2vjbSPAoLfo5PBTJb1k8tMNnRePlFnSKh+rvQCFILbZYRjOzlghtW/6luesQR/3JJ6dvWtCIoNzEHaYAxooVwiu3VmNfR545o2DifXKMsMab47/am3PdnjwlDFLw=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 54, 'FR ATO2024/54', NULL, 'O7mhMsjwouhWAGdNQHNVlC7YAVNFI7raIyR1bdxFoAAYTsqoTposuWILFn1S+CKMZlq0N8YcaB/uM2V/3FWcmj287Q45vwmr+0kC3WnEA43tBHnKcNSYzbaGt4EuFyvFCdRQCYICQu/MqAmUTzvVfbz0+LHQqthOcSJ4veYxBDY=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 11:29:12', '2024-03-01 11:29:12', NULL, '259/0173 1516', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3300, '2024-01-17 00:00:00', '2024-02-09 00:00:00', 23, 14, 828.261, 'USD', 'AOA', NULL, 3009.6, 2186609.04, 306125.2656, 2492734.3056, '1000265179750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 074/24'),
	(180, '2024-03-01;2024-03-01T11:33:16;FR ATO2024/55;922310.07;O7mhMsjwouhWAGdNQHNVlC7YAVNFI7raIyR1bdxFoAAYTsqoTposuWILFn1S+CKMZlq0N8YcaB/uM2V/3FWcmj287Q45vwmr+0kC3WnEA43tBHnKcNSYzbaGt4EuFyvFCdRQCYICQu/MqAmUTzvVfbz0+LHQqthOcSJ4veYxBDY=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 1, 55, 'FR ATO2024/55', NULL, 'DszwOqeuJidknPsJyWSMW1CsIZpnoh7aXbXmHqjEPRw6WpweiTqWZ9Z/HSwvvMu6LuhafQrEM/gCB9HprZePn5Dz3SLST4B1GfyDb3EguAfGjvVFsd4CgNyUcqVYiizjFshlxHGXpk/QKGf9QUq8q2oiqBeiv4eRd3OgwZAvk6Y=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 11:33:16', '2024-03-01 11:33:16', NULL, '118-1231 2263', NULL, 0, NULL, NULL, NULL, NULL, NULL, 6975, '2024-02-20 00:00:00', '2024-02-21 00:00:00', 1, 14, 828.514, 'USD', 'AOA', NULL, 1113.21, 809043.921, 113266.14894, 922310.06994, '10003180750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 075/24'),
	(181, '2024-03-01;2024-03-01T11:39:03;FR ATO2024/56;356362.10;DszwOqeuJidknPsJyWSMW1CsIZpnoh7aXbXmHqjEPRw6WpweiTqWZ9Z/HSwvvMu6LuhafQrEM/gCB9HprZePn5Dz3SLST4B1GfyDb3EguAfGjvVFsd4CgNyUcqVYiizjFshlxHGXpk/QKGf9QUq8q2oiqBeiv4eRd3OgwZAvk6Y=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 1, 56, 'FR ATO2024/56', NULL, 'DESpKEMoaBGFTczs2ZqTHepXv2aEtiiy2yUWXYwUi0o/goNZZYihRHkRQU2IlrhLf3pBZBMxJOqqQLtm4K/wtrKVLXC3GDrJl9i/rHa1SkpuLwVDtdg0Jeok1ByZfjdtEPuZQmTVlg+uUVC1QI+ZigMdoYtXYw+WphUhZV9cK1I=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 11:39:03', '2024-03-01 11:39:03', NULL, '118-1240 1056', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2695, '2024-02-20 00:00:00', '2024-02-21 00:00:00', 1, 14, 828.514, 'USD', 'AOA', NULL, 430.122, 312598.3322, 43763.766508, 356362.098708, '10003181750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 076/24'),
	(182, '2024-03-01;2024-03-01T11:55:23;FR ATO2024/57;523256.30;DESpKEMoaBGFTczs2ZqTHepXv2aEtiiy2yUWXYwUi0o/goNZZYihRHkRQU2IlrhLf3pBZBMxJOqqQLtm4K/wtrKVLXC3GDrJl9i/rHa1SkpuLwVDtdg0Jeok1ByZfjdtEPuZQmTVlg+uUVC1QI+ZigMdoYtXYw+WphUhZV9cK1I=', 1, 275, 'ANJANI FOOD & BEVERAGES, LDA', 'ANJANI FOOD AND BEVERAGES LDA', '+244 937 395 890', '5419007835', 'logistics@anjanifood.com', 'Estrada Direita da Funda - Kifangondo', 1, 57, 'FR ATO2024/57', NULL, 'dV4nU36/Hp4aS9Hg/v+LsUxDwD6t9IBMPVAtPzelNBsSv0qVDy8vV6grlM6XFIh9XheozT1nZbAdhWJgq0umMIXUZaRyu0eglA8o/bd21Sm6LzQ34cQ4bo1/4RePqz2Oh410yAIXfY71getmUgg8m20uRitpKe6/nzWJPoF5vCc=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 11:55:23', '2024-03-01 11:55:23', NULL, '118-1233 1303', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1108, '2024-02-24 00:00:00', '2024-02-29 00:00:00', 5, 14, 828.514, 'USD', 'AOA', NULL, 631.56, 458996.756, 64259.54584, 523256.30184, '1000275182750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A NOTA DE PREÇO Nº 103/24'),
	(183, '2024-03-01;2024-03-01T11:57:58;PP ATO2024/3;1168675.00;vkG7EgVUm37aNCiu2Ws18iPe5WXOXwbm93aOX448t61zvftSud0Ge80I656sVF4x6CKXVz6MCZsMTIwELqFJVGhZg0dBFeEWMdp/O0C8cDRyZJfvbdyDs8nqwuJ4SLkqqBxBrNA8r5qTcLbx9cPq+08EFDqrwdBudJgXSTyKqbg=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 3, 'FP ATO2024/3', NULL, 'Z+1qAM5WryObLBRvi/ltUdSrNq+OsYRxqUdkR3Sfz9c9P0lt9l7MrcBnfT98MXdhLKG8WlFeJBSq5lOwMXwAtNENblocMltVfPXFdNER4CT3u9YinijbItOn3Md7MUOGeoXvVUECxCYUzZDnezsFbdlEYNXXx0dkktBxchN14Kg=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-01 11:57:58', '2024-03-01 11:57:58', NULL, NULL, 'BOING 737-800F', 79, '2024-02-29', '2024-02-29', '12:19:00', '14:03:00', NULL, 8205, NULL, NULL, NULL, 14, 828.514, 'USD', 'AOA', NULL, 1410.5676, 1025153.51276, 143521.4917864, 1168675.0045464, '1000269183751', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE AO VOO DT5146 DO DIA 29/02/2024'),
	(184, '2024-03-01;2024-03-01T12:57:30;PP ATO2024/4;372890.95;Z+1qAM5WryObLBRvi/ltUdSrNq+OsYRxqUdkR3Sfz9c9P0lt9l7MrcBnfT98MXdhLKG8WlFeJBSq5lOwMXwAtNENblocMltVfPXFdNER4CT3u9YinijbItOn3Md7MUOGeoXvVUECxCYUzZDnezsFbdlEYNXXx0dkktBxchN14Kg=', 1, 276, 'VITALIS CHUKWULOTA OZOCHI', 'OZOCHI VITALIS', '928434868', '0000032603', 'mailto:edgarpedro687@gmail.com', 'Sambizanga Casa S Zona 10', 3, 4, 'FP ATO2024/4', NULL, 'mruQS4k+ezzQO7rdJbFKnpHCqcyTFHjKVLyGswhtud9/HeBja1rSZo8bTAnvfI1BV++fACAix3zNH6ZkDJ+fzFQdogaYzC8XovGmd0CDPRx69p+rTH62UXzn1aijcU2fSQung3BkW+NlZrv0v+hsleerA4F3J4G47SVnsS7Qtao=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 12:57:30', '2024-03-01 12:57:30', NULL, '118-1240 1045', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2820, '2024-02-29 00:00:00', '2024-03-01 00:00:00', 1, 14, 828.514, 'USD', 'AOA', NULL, 450.072, 327097.3272, 45793.625808, 372890.953008, '1000276184750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-1240 1045'),
	(185, '2024-03-01;2024-03-01T14:14:36;PP ATO2024/5;739170.36;mruQS4k+ezzQO7rdJbFKnpHCqcyTFHjKVLyGswhtud9/HeBja1rSZo8bTAnvfI1BV++fACAix3zNH6ZkDJ+fzFQdogaYzC8XovGmd0CDPRx69p+rTH62UXzn1aijcU2fSQung3BkW+NlZrv0v+hsleerA4F3J4G47SVnsS7Qtao=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'DSV AIR SERVICES', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 3, 5, 'FP ATO2024/5', NULL, 'PTuL/pRUGFaJlHK+EY/LLIOeVLmatEBN9WL4IQKMBXDfesotZK0OqaNNvkSPUqrrVyYdf0NJ9DY4T6cPcv4LH6Z0qAV/GzNKwTr4hxaYXr3eudYs95Wx9Gxp7pea5Ca8FoF32T839mFdMo+k0jd9TSDnUSi4X9n48O1c5ZcykFY=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-01 14:14:36', '2024-03-01 14:14:36', NULL, '574-33935112', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5590, '2024-03-01 00:00:00', '2024-03-02 00:00:00', 1, 14, 828.514, 'USD', 'AOA', NULL, 892.164, 648395.0564, 90775.307896, 739170.364296, '1000266185751', 3, NULL, 2, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 574-33935112'),
	(186, '2024-03-01;2024-03-01T14:20:38;PP ATO2024/6;712063.04;PTuL/pRUGFaJlHK+EY/LLIOeVLmatEBN9WL4IQKMBXDfesotZK0OqaNNvkSPUqrrVyYdf0NJ9DY4T6cPcv4LH6Z0qAV/GzNKwTr4hxaYXr3eudYs95Wx9Gxp7pea5Ca8FoF32T839mFdMo+k0jd9TSDnUSi4X9n48O1c5ZcykFY=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 3, 6, 'FP ATO2024/6', NULL, 'cGxV/45OQG1XX3A+kchoyWzInK41xcJAc+NWURdZ5Z9HV0nhIfmlesaqXrB2xnPBW5MUxy3x3VSrd/v7WY0eZ1nlt6TJqBv9GjVAQ/HYCp9HZ+xjuqYAid8f4T9Ya9ph5EISrHVD8Pv5FbAhfFTjCsrkHaYkq2cfZsUAa1XS7ms=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 14:20:38', '2024-03-01 14:20:38', NULL, '118-1240 1060', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5385, '2024-02-29 00:00:00', '2024-03-01 00:00:00', 1, 14, 828.514, 'USD', 'AOA', NULL, 859.446, 624616.7046, 87446.338644, 712063.043244, '10003186750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-1240 1060'),
	(187, '2024-03-01;2024-03-01T14:47:00;FR ATO2024/58;712063.04;dV4nU36/Hp4aS9Hg/v+LsUxDwD6t9IBMPVAtPzelNBsSv0qVDy8vV6grlM6XFIh9XheozT1nZbAdhWJgq0umMIXUZaRyu0eglA8o/bd21Sm6LzQ34cQ4bo1/4RePqz2Oh410yAIXfY71getmUgg8m20uRitpKe6/nzWJPoF5vCc=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 1, 58, 'FR ATO2024/58', 'FP ATO2024/6', 'AQCUfsAHoc7yzDKXXG9bOvcFwt+weoGoXMTQKjM5wtCYwebcokz0Ke7WaUlVtno2lb6a+mQ8qE/TZUK4jO2rA7h/P4HENYLEPfCpUsfjVu/YId0csCQAY3hpfJzHoCVWJQKEiXL/a1FW16qqeIw8lXBlSQmcoeICPDncP2Ngj/M=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 14:47:00', '2024-03-01 14:47:00', NULL, '118-1240 1060', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5385, '2024-02-29 00:00:00', '2024-03-01 00:00:00', 1, 14, 828.514, 'USD', NULL, NULL, 859.446, 624616.7046, 87446.338644, 712063.043244, '10003187750', 1, 1, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-1240 1060'),
	(188, '2024-03-01;2024-03-01T14:56:52;FR ATO2024/59;372890.95;AQCUfsAHoc7yzDKXXG9bOvcFwt+weoGoXMTQKjM5wtCYwebcokz0Ke7WaUlVtno2lb6a+mQ8qE/TZUK4jO2rA7h/P4HENYLEPfCpUsfjVu/YId0csCQAY3hpfJzHoCVWJQKEiXL/a1FW16qqeIw8lXBlSQmcoeICPDncP2Ngj/M=', 1, 276, 'VITALIS CHUKWULOTA OZOCHI', 'OZOCHI VITALIS', '928434868', '0000032603', 'mailto:edgarpedro687@gmail.com', 'Sambizanga Casa S Zona 10', 1, 59, 'FR ATO2024/59', 'FP ATO2024/4', 'nBisUMDYri5VQw5X8dJ21J5LGVktrejZwBEabZwnXHRzmyEZlR3W1XugYJy9ksiqyoI6i8C/NVfMyndaWvmGcqTVZpQ1PLMr27Ljn7UD23iHOKTUWjg7cYig9A6FnG5r8/ExvyzzS9ToM42TO2GwEpFOaA2g32y4+LbS3G5nNsQ=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-01 14:56:52', '2024-03-01 14:56:52', NULL, '118-1240 1045', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2820, '2024-02-29 00:00:00', '2024-03-01 00:00:00', 1, 14, 828.514, 'USD', NULL, NULL, 450.072, 327097.3272, 45793.625808, 372890.953008, '1000276188750', 1, 1, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-1240 1045'),
	(189, '2024-03-04;2024-03-04T09:54:01;FR ATO2024/60;2938471.38;nBisUMDYri5VQw5X8dJ21J5LGVktrejZwBEabZwnXHRzmyEZlR3W1XugYJy9ksiqyoI6i8C/NVfMyndaWvmGcqTVZpQ1PLMr27Ljn7UD23iHOKTUWjg7cYig9A6FnG5r8/ExvyzzS9ToM42TO2GwEpFOaA2g32y4+LbS3G5nNsQ=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'DSV AIR SERVICE S.A.', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 60, 'FR ATO2024/60', 'FP ATO2024/2', 'rJI3QzsdbIwQiNUkdf0vvaF/2BiWIpBCN0j98L+w+jXq6LawbEiddSSHfbVBoy7jgzl/+cdnbO8OSprUFyM9W+x9mw6oe+y9j7czqsfx5iLHV3+04xpebzv7Kd7bPqDzaqCveUKPFmGc3WGufpfLRsvXipDdiVuD3z2in3Zfp1c=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 09:54:01', '2024-03-04 09:54:01', NULL, '11811508280', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10728, '2024-02-24 00:00:00', '2024-03-01 00:00:00', 6, 14, 828.514, 'USD', NULL, NULL, 3546.6768, 2577606.47568, 360864.9065952, 2938471.3822752, '1000266189750', 1, 1, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº118-11508280'),
	(190, '2024-03-04;2024-03-04T10:02:18;PP ATO2024/7;149111.04;cGxV/45OQG1XX3A+kchoyWzInK41xcJAc+NWURdZ5Z9HV0nhIfmlesaqXrB2xnPBW5MUxy3x3VSrd/v7WY0eZ1nlt6TJqBv9GjVAQ/HYCp9HZ+xjuqYAid8f4T9Ya9ph5EISrHVD8Pv5FbAhfFTjCsrkHaYkq2cfZsUAa1XS7ms=', 1, 277, 'COMPANHIA CASTEL DE BEBIDAS DE LUANDA-CCBL, S.A', 'COMPANHIA CASTEL DE BEBIDAS DE LUANDA', '923967562', '5410000757', NULL, 'RUA N´GOLA KILUANGE Nº370', 3, 7, 'FP ATO2024/7', NULL, 'YY/nIGctCTg7g0217RmVmE9uzgld9tqUZPJdrJZG8gpb/pzGnWP0EcIeBQeKHMU7Iu+uVH6aUx0yAL+PkPjaueZ0TVMBoc3P3RY6SXeYTfi4ijFeMuAP+0erRqMKoAEb69u29vF3b/RVrPXerOWCr3GOyidVa7NMogHpQ0XQrNk=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 10:02:18', '2024-03-04 10:02:18', NULL, '11812330080', NULL, 0, NULL, NULL, NULL, NULL, NULL, 202.4, '2024-02-24 00:00:00', '2024-03-04 00:00:00', 9, 14, 828.514, 'USD', 'AOA', NULL, 179.97408, 130799.162208, 18311.88270912, 149111.04491712, '1000277190751', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-12330080 '),
	(191, '2024-03-04;2024-03-04T10:47:06;PP ATO2024/8;67720.32;YY/nIGctCTg7g0217RmVmE9uzgld9tqUZPJdrJZG8gpb/pzGnWP0EcIeBQeKHMU7Iu+uVH6aUx0yAL+PkPjaueZ0TVMBoc3P3RY6SXeYTfi4ijFeMuAP+0erRqMKoAEb69u29vF3b/RVrPXerOWCr3GOyidVa7NMogHpQ0XQrNk=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 8, 'FP ATO2024/8', NULL, 'eRps6+97QdcDtOKoj+rbZMHwR1byps3kHoLJgU92HZvVCHb41xv+Om6v1xWHRj63OuSh8A9mZvTDE/+BWZ2HZ7rs2UqQInIqumdYE3EgNEXqxPWuRe/E62XnNpBhp4F11TpBVIEpQ8GGSp/wPsPRAKRMY3/eFImen41oLgwlBOk=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 10:47:06', '2024-03-04 10:47:06', NULL, '57433994030', NULL, 0, NULL, NULL, NULL, NULL, NULL, 112.03, '2024-02-24 00:00:00', '2024-03-01 00:00:00', 6, 14, 828.514, 'USD', 'AOA', NULL, 81.737088, 59403.7909888, 8316.530738432, 67720.321727232, '1000269191751', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 6, 'REFERENTE A AWB Nº 57433994030'),
	(192, '2024-03-04;2024-03-04T10:48:06;FR ATO2024/61;149111.04;rJI3QzsdbIwQiNUkdf0vvaF/2BiWIpBCN0j98L+w+jXq6LawbEiddSSHfbVBoy7jgzl/+cdnbO8OSprUFyM9W+x9mw6oe+y9j7czqsfx5iLHV3+04xpebzv7Kd7bPqDzaqCveUKPFmGc3WGufpfLRsvXipDdiVuD3z2in3Zfp1c=', 1, 277, 'COMPANHIA CASTEL DE BEBIDAS DE LUANDA-CCBL, S.A', 'COMPANHIA CASTEL DE BEBIDAS DE LUANDA', '923967562', '5410000757', NULL, 'RUA N´GOLA KILUANGE Nº370', 1, 61, 'FR ATO2024/61', 'FP ATO2024/7', 'e11Lo61uZIWzjO3vKjqbfgTAU0yayWLC60F348wpLT+UTrBGFyKBgwnfgr1LfjNdwJwtYswaYKAoTdent0qHgTWehZRMF3juNiMgGEP1QxJOu+Y1Uk2IMZYjTx/2XQ0VssOLPjY6LXojWs4VtcwZ3YFqsf7hRRqeL2fMHqaRzO4=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 10:48:06', '2024-03-04 10:48:06', NULL, '11812330080', NULL, 0, NULL, NULL, NULL, NULL, NULL, 202.4, '2024-02-24 00:00:00', '2024-03-04 00:00:00', 9, 14, 828.514, 'USD', NULL, NULL, 179.97408, 130799.162208, 18311.88270912, 149111.04491712, '1000277192750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-12330080 '),
	(193, '2024-03-04;2024-03-04T10:51:53;PP ATO2024/9;35060.06;eRps6+97QdcDtOKoj+rbZMHwR1byps3kHoLJgU92HZvVCHb41xv+Om6v1xWHRj63OuSh8A9mZvTDE/+BWZ2HZ7rs2UqQInIqumdYE3EgNEXqxPWuRe/E62XnNpBhp4F11TpBVIEpQ8GGSp/wPsPRAKRMY3/eFImen41oLgwlBOk=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 9, 'FP ATO2024/9', NULL, 'gDof6iPHFs4wzbAAm1S579eVAhprvPRpz+WVgYLZx1+Q4loMocmoR6ZD9SiKjFMN49Kb/5cZmNIpiuOpPPmytvBt1QJTOHA1eWJSNJ/dQqVkF5V7zlMl51fYdgyRfGslF9AF6+pgTZor4n0JuydGSTukewA9LfFOkypLpHP2f68=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 10:51:53', '2024-03-04 10:51:53', NULL, '57433993982', NULL, 0, NULL, NULL, NULL, NULL, NULL, 58, '2024-02-24 00:00:00', '2024-03-01 00:00:00', 6, 14, 828.514, 'USD', 'AOA', NULL, 42.3168, 30754.43968, 4305.6215552, 35060.0612352, '1000269193751', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 6, 'REFERENTE A AWB Nº 57433993982'),
	(194, '2024-03-04;2024-03-04T11:55:06;FR ATO2024/62;2870114.87;e11Lo61uZIWzjO3vKjqbfgTAU0yayWLC60F348wpLT+UTrBGFyKBgwnfgr1LfjNdwJwtYswaYKAoTdent0qHgTWehZRMF3juNiMgGEP1QxJOu+Y1Uk2IMZYjTx/2XQ0VssOLPjY6LXojWs4VtcwZ3YFqsf7hRRqeL2fMHqaRzO4=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 62, 'FR ATO2024/62', NULL, 'xoSRc69cExOGSGLg6fFzo38Oe0oJzFPVX8aI+/OTiM2iSKZLbbtn5zCMQrqBRNI0WEAvce1ur1R6cASd3aVyKUK7K2PTUFNhSuh6UShMok7MMQVEXlHyK6hk5NfGr6vONutjVQvNIWWG0l6jIfD9c/6/RqwnWsphVyn+v9/v6eM=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 11:55:06', '2024-03-04 11:55:06', NULL, NULL, 'BOING 747-400F', 397, '2024-02-12', '2024-02-12', '16:44:00', '19:06:00', NULL, NULL, NULL, NULL, NULL, 0, 828.261, 'USD', 'USD', NULL, 3465.23, 2870114.86503, 0, 2870114.86503, '1000264194751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 078/24'),
	(195, '2024-03-04;2024-03-04T11:59:32;FR ATO2024/63;1211911.50;xoSRc69cExOGSGLg6fFzo38Oe0oJzFPVX8aI+/OTiM2iSKZLbbtn5zCMQrqBRNI0WEAvce1ur1R6cASd3aVyKUK7K2PTUFNhSuh6UShMok7MMQVEXlHyK6hk5NfGr6vONutjVQvNIWWG0l6jIfD9c/6/RqwnWsphVyn+v9/v6eM=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 1, 63, 'FR ATO2024/63', NULL, 'ojjecCwjckllEfiAclM9mW5H3uRTukqxO6ZYoQmg+69DKG8Yk1NWGvoG3zyYN3AUHlGwNKHxtgtBbYxyq8wGiJmqZWCO/HrjAqOOJ2vJ7ZhQMiY+Flxbf3THust/ESOYcZ8juvGKK/ZYdD2knHuqtc27pty8OPDD48xVTO1OpaA=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 11:59:32', '2024-03-04 11:59:32', NULL, NULL, 'BOING 747-400F/ASTRA 11849', 397, '2024-02-12', '2024-02-12', '16:44:00', '19:06:00', NULL, 18290, NULL, NULL, NULL, 0, 828.261, 'USD', 'USD', NULL, 1463.2, 1211911.4952, 0, 1211911.4952, '1000264195751', 1, 4, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 079/24'),
	(196, '2024-03-04;2024-03-04T12:05:35;FR ATO2024/64;4691108.79;ojjecCwjckllEfiAclM9mW5H3uRTukqxO6ZYoQmg+69DKG8Yk1NWGvoG3zyYN3AUHlGwNKHxtgtBbYxyq8wGiJmqZWCO/HrjAqOOJ2vJ7ZhQMiY+Flxbf3THust/ESOYcZ8juvGKK/ZYdD2knHuqtc27pty8OPDD48xVTO1OpaA=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 1, 64, 'FR ATO2024/64', NULL, 'P1TiqX8zUz5/njHZUzI7oF7iYrfYENqGSUAB8j+WIFgGEf5JSPMie+ClO651tOybULnhYphXRaOh8qMspiXhLn98j8o5T9P7ORarGe28bAPem/c8/HWzM5sIuat7/MMNqNd3xsCoEPZ77lITnrC+PLrKtIx+OL1zqLsQKmAK2RQ=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 12:05:35', '2024-03-04 12:05:35', NULL, '11812312241', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14195, '2024-02-06 00:00:00', '2024-02-14 00:00:00', 8, 14, 828.261, 'USD', 'AOA', NULL, 5663.805, 4115007.71325, 576101.079855, 4691108.793105, '10003196751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 080/24'),
	(197, '2024-03-04;2024-03-04T12:21:29;FR ATO2024/65;1184063.09;P1TiqX8zUz5/njHZUzI7oF7iYrfYENqGSUAB8j+WIFgGEf5JSPMie+ClO651tOybULnhYphXRaOh8qMspiXhLn98j8o5T9P7ORarGe28bAPem/c8/HWzM5sIuat7/MMNqNd3xsCoEPZ77lITnrC+PLrKtIx+OL1zqLsQKmAK2RQ=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICE INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 65, 'FR ATO2024/65', NULL, 'Zv8E6VdUajjFN395iBdkLYKxISrJDcC2oSzGyDLJvnOZDd35k1ofHKXc2wUciMbt7BN17HJFP+8CbHblGMG1keoLDCm+vAqMLfb9InJnER9SO0SwGkbOEtzCvv8lKqqyScSgeECgAqxORFli0uBsiE//OZyLyU09uVy3lNzbXWo=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 12:21:29', '2024-03-04 12:21:29', NULL, '259/01731516', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3300, '2024-02-10 00:00:00', '2024-02-19 00:00:00', 9, 14, 828.271, 'USD', 'AOA', NULL, 1429.56, 1038651.834, 145411.25676, 1184063.09076, '1000265197751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 081/24'),
	(198, '2024-03-04;2024-03-04T13:13:21;FR ATO2024/66;1413191.51;Zv8E6VdUajjFN395iBdkLYKxISrJDcC2oSzGyDLJvnOZDd35k1ofHKXc2wUciMbt7BN17HJFP+8CbHblGMG1keoLDCm+vAqMLfb9InJnER9SO0SwGkbOEtzCvv8lKqqyScSgeECgAqxORFli0uBsiE//OZyLyU09uVy3lNzbXWo=', 1, 278, 'OPS SERVIÇOS DE PRODUÇÃO DE PETRÓLEOS, LTD', 'OPS SERVIÇOS DE PRODUÇÃO DE PETRÓLEOS', '+244939452739', '5402068909', ' Sebastiao.Santos@sbmoffshore.com', 'Rua Comandante Arguelles, nº 103', 1, 66, 'FR ATO2024/66', NULL, 'u98B4mugv97MS93J8cjiMeiSwaigdbNxTxY/RrG+olo80lmRLttmawucguAg+drNjw0TG1jnmNxfqncn1PRysW8UPziMFEFzso+hRs/2OY+m+5CmOthweYiya6kDxHaQR3CWfgIxB6OhyM7HW0whWGIc7jVAnc2JE4APo+a7M0I=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 13:13:21', '2024-03-04 13:13:21', NULL, '574-34018294', NULL, 0, NULL, NULL, NULL, NULL, NULL, 8804, '2024-02-18 00:00:00', '2024-02-20 00:00:00', 2, 14, 828.261, 'USD', 'AOA', NULL, 1706.2152, 1239641.67348, 173549.8342872, 1413191.5077672, '1000278198751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 082/24'),
	(199, '2024-03-04;2024-03-04T13:17:24;FR ATO2024/67;264531.99;u98B4mugv97MS93J8cjiMeiSwaigdbNxTxY/RrG+olo80lmRLttmawucguAg+drNjw0TG1jnmNxfqncn1PRysW8UPziMFEFzso+hRs/2OY+m+5CmOthweYiya6kDxHaQR3CWfgIxB6OhyM7HW0whWGIc7jVAnc2JE4APo+a7M0I=', 1, 278, 'OPS SERVIÇOS DE PRODUÇÃO DE PETRÓLEOS, LTD', 'OPS SERVIÇOS DE PRODUÇÃO DE PETRÓLEOS', '+244939452739', '5402068909', ' Sebastiao.Santos@sbmoffshore.com', 'Rua Comandante Arguelles, nº 103', 1, 67, 'FR ATO2024/67', NULL, 'incHJ8y0b8UHQ39j7G//7+JP6ikHXChiOVidvn0AZCqj2ARGEbcgQbL7hJ8Bosgf4ZsISS2Hbw5XQFAOhYXjW+EK+fovjS5FFJQ8Qh7C/RLZe1y+cN+kTTv7Y+C/tmQ9c02HmM218ll0y/X5Au5olsrdJ8QZiAQwbli+QI09F6I=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 13:17:24', '2024-03-04 13:17:24', NULL, '574-34018305', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1648, '2024-02-18 00:00:00', '2024-02-20 00:00:00', 2, 14, 828.261, 'USD', 'AOA', NULL, 319.3824, 232045.60176, 32486.3842464, 264531.9860064, '1000278199751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 083/24'),
	(200, '2024-03-04;2024-03-04T13:23:36;FR ATO2024/68;1125916.91;incHJ8y0b8UHQ39j7G//7+JP6ikHXChiOVidvn0AZCqj2ARGEbcgQbL7hJ8Bosgf4ZsISS2Hbw5XQFAOhYXjW+EK+fovjS5FFJQ8Qh7C/RLZe1y+cN+kTTv7Y+C/tmQ9c02HmM218ll0y/X5Au5olsrdJ8QZiAQwbli+QI09F6I=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICE INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 68, 'FR ATO2024/68', NULL, 'oEtyRxg10qp9n8dbly7tYBgHNSi+fuGKqRM5o9ooSZLnMaPwK+5gm67U0VMOkwImDzPMTirmxYjHyFBVsY0eDFYmO2pU+jtdbhk+dJQA6d0+UO4j3raOZM7zhNgvoTmZEKJZqqUaMxphfAazHXnhXCTP1/PCbFnGNYJ6mjakt10=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 13:23:36', '2024-03-04 13:23:36', NULL, '27100024172', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2908.34, '2024-02-09 00:00:00', '2024-02-19 00:00:00', 10, 14, 828.271, 'USD', 'AOA', NULL, 1359.358116, 987646.4088574, 138270.49724004, 1125916.9060974, '1000265200751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 084/24'),
	(201, '2024-03-04;2024-03-04T13:27:53;FR ATO2024/69;1076358.99;oEtyRxg10qp9n8dbly7tYBgHNSi+fuGKqRM5o9ooSZLnMaPwK+5gm67U0VMOkwImDzPMTirmxYjHyFBVsY0eDFYmO2pU+jtdbhk+dJQA6d0+UO4j3raOZM7zhNgvoTmZEKJZqqUaMxphfAazHXnhXCTP1/PCbFnGNYJ6mjakt10=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'BAKER HUGHES EHO LTD', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 69, 'FR ATO2024/69', NULL, 'gRQ33KEBH8G7HlgvdcDcC2m2SlTUKROuTvLda7S2qRjlykdIXuiJhvPgpOUnG6szCFbvL1idxY8S0u2gT2RJU3EX1R1EoQPMHfCdpD9uKfzSKmKZ2q6Cp/SrhN21SAlem+fzVQZ4/5gG1cgJLKjGSM9pacRcyGmNgC/hqcdhBPA=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 13:27:53', '2024-03-04 13:27:53', NULL, '574-34014433', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2590, '2024-02-12 00:00:00', '2024-02-23 00:00:00', 11, 14, 828.514, 'USD', 'AOA', NULL, 1299.144, 944174.5544, 132184.437616, 1076358.992016, '1000265201751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 085/24'),
	(202, '2024-03-04;2024-03-04T13:32:34;FR ATO2024/70;1625116.95;gRQ33KEBH8G7HlgvdcDcC2m2SlTUKROuTvLda7S2qRjlykdIXuiJhvPgpOUnG6szCFbvL1idxY8S0u2gT2RJU3EX1R1EoQPMHfCdpD9uKfzSKmKZ2q6Cp/SrhN21SAlem+fzVQZ4/5gG1cgJLKjGSM9pacRcyGmNgC/hqcdhBPA=', 1, 276, 'VITALIS CHUKWULOTA OZOCHI', 'VITALIS CHUKWULOTA OZOCHI', '928434868', '0000032603', 'mailto:edgarpedro687@gmail.com', 'Sambizanga Casa S Zona 10', 1, 70, 'FR ATO2024/70', NULL, 'lKwJDgBw+Eh49O5lIb9UHOMlPRxR6Y0rhx1UJJkB96YCuEI9sG/aOgnPoLm2ahTsymmRGjxU05lupKrBBzQRO1Lgv5yH6lrJYIEli0U8Nsew174Sbexr3sZwpM0Km3ypYEMKwkVgKhPMz38cql/LC7WzjRiusqzlltvoPfg0n84=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 13:32:34', '2024-03-04 13:32:34', NULL, '118-12312274', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12290, '2024-02-20 00:00:00', '2024-02-21 00:00:00', 1, 14, 828.514, 'USD', 'AOA', NULL, 1961.484, 1425541.1884, 199575.766376, 1625116.954776, '1000276202751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 086/24'),
	(203, '2024-03-04;2024-03-04T13:41:24;FT ATO2024/19;2624815.20;Ih7FJ6BetVLLYXNkZDlo0zLEZ4zxfj4TwqoxPLVumeJL5mX63wBKqMBwRtW+tfUDyFcO1dpyu9HN2IPE1rwiBS8Z6L90mJXNqVxTsPl0EINQpamH2HqN18QQ6n02N+t3kG7faKXXvg8hFNoO1FcQejtq3Pm1awDbaPt45L4huU0=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 19, 'FT ATO2024/19', NULL, 'dQAlVTjwjSK3ZWy0p3eeRGupNs7SIZgxbHkqlED/dEt8os8DqwITK1i5473OsbLovbLiBRkaIY/OFMw9NuY+7RATElj1Tq8v/XmBpxLA/AaX6j9xL7mduCisyX258gkw6AXEMQ0Wk81FjHW/Zwp5/wvcDMSN1Vs5PRm3aCvSo/U=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 13:41:24', '2024-03-04 13:41:24', NULL, NULL, 'BOING 747-400F', 397, '2024-02-18', '2024-02-18', '08:14:00', '10:20:00', NULL, NULL, NULL, NULL, NULL, 0, 828.514, 'USD', 'AOA', NULL, 3168.1, 2624815.2034, 0, 2624815.2034, '1000264203751', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 087/24'),
	(204, '2024-03-04;2024-03-04T13:48:18;FT ATO2024/20;692770.27;dQAlVTjwjSK3ZWy0p3eeRGupNs7SIZgxbHkqlED/dEt8os8DqwITK1i5473OsbLovbLiBRkaIY/OFMw9NuY+7RATElj1Tq8v/XmBpxLA/AaX6j9xL7mduCisyX258gkw6AXEMQ0Wk81FjHW/Zwp5/wvcDMSN1Vs5PRm3aCvSo/U=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 20, 'FT ATO2024/20', NULL, 'S4hH1cfm9JcQIA9rJSKq2aUJ72zrSzytNFrrlWd+2o7IVC7aIj4coq0q/WtEDJdpxZlXz83QFOPFyip2fuw4Xczdsp72ju7IA7OfXVAADCxfZjCl7sQuM4Ml1qyUjKz/R5IrG+r5ZCH7ZGUf/F2/xX10s60JMsSbGhZaz/iR/6Q=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 13:48:18', '2024-03-04 13:48:18', NULL, NULL, 'BOING 747-400F/ASTRA 11860', 397, '2024-02-18', '2024-02-18', '08:14:00', '10:20:00', NULL, 10452, NULL, NULL, NULL, 0, 828.514, 'USD', 'AOA', NULL, 836.16, 692770.26624, 0, 692770.26624, '1000264204751', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 088/24'),
	(205, '2024-03-04;2024-03-04T13:53:24;FR ATO2024/71;2146083.24;lKwJDgBw+Eh49O5lIb9UHOMlPRxR6Y0rhx1UJJkB96YCuEI9sG/aOgnPoLm2ahTsymmRGjxU05lupKrBBzQRO1Lgv5yH6lrJYIEli0U8Nsew174Sbexr3sZwpM0Km3ypYEMKwkVgKhPMz38cql/LC7WzjRiusqzlltvoPfg0n84=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY ANGOLA', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 71, 'FR ATO2024/71', NULL, 'KHdBba1JX7Pzf3bbCKlOwhuXjoyhcMLfmcfWlamNDVC911KE71eM0/fgAGQcQ0ynrCt+fnO1qBusxpwVO/60KsBFZXnB6VJ2+ILPirotwmr/3QbYAt86gU5E/RV1Uy7DSp+Vjq0N5kiFxBbjYSGpIbYUcD2tspj45ONvMD2/jC0=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 13:53:24', '2024-03-04 13:53:24', NULL, '57434030264/ LAD-00000011', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3364, '2024-02-02 00:00:00', '2024-02-24 00:00:00', 22, 0, 828.514, 'USD', 'AOA', NULL, 2590.28, 2146083.24392, 0, 2146083.24392, '1000273205751', 1, 4, 2, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 089/24'),
	(206, '2024-03-04;2024-03-04T14:08:24;FR ATO2024/72;4586902.06;KHdBba1JX7Pzf3bbCKlOwhuXjoyhcMLfmcfWlamNDVC911KE71eM0/fgAGQcQ0ynrCt+fnO1qBusxpwVO/60KsBFZXnB6VJ2+ILPirotwmr/3QbYAt86gU5E/RV1Uy7DSp+Vjq0N5kiFxBbjYSGpIbYUcD2tspj45ONvMD2/jC0=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY ANGOLA', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 72, 'FR ATO2024/72', NULL, 'GWKPX0qsrO8lzwisege/4W9uCfu8FkChQ+HbEcv56jKORJUyD/Zfg2eODDoo6SQmqMXgM1gEKRWPnPzU5//yPFyEgV6bB5oOCHY4QUd7pOgJs2FCdU9zu96MbOXgbJp1+bu2WGY8g+YMOHesyrkp9KPnbihu+9JEwxykcS8JvO8=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 14:08:24', '2024-03-04 14:08:24', NULL, '57434030264/LAD-00000015', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7190, '2024-02-02 00:00:00', '2024-02-24 00:00:00', 22, 0, 828.514, 'USD', 'AOA', NULL, 5536.3, 4586902.0582, 0, 4586902.0582, '1000273206751', 1, 4, 2, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 090/24'),
	(207, '2024-03-04;2024-03-04T14:53:12;PP ATO2024/10;1184174.35;gDof6iPHFs4wzbAAm1S579eVAhprvPRpz+WVgYLZx1+Q4loMocmoR6ZD9SiKjFMN49Kb/5cZmNIpiuOpPPmytvBt1QJTOHA1eWJSNJ/dQqVkF5V7zlMl51fYdgyRfGslF9AF6+pgTZor4n0JuydGSTukewA9LfFOkypLpHP2f68=', 1, 279, 'SIMPORTEX - COMERCIALIZAÇÃO DE EQUIPAMENTOS M.M', 'SIMPORTEX - CEMERCIALIZAÇÃO DE EQUIPAMENTOS M.M', NULL, '5410003519', NULL, 'RUA RAINHA GINGA Nº 24 - INGOMBOTA', 3, 10, 'FP ATO2024/10', NULL, 'pBGjBZyNe1Pbk7yY0eQ741ghQ1nxHaeqTvbPd/761cmUR4azSA3fVdriOj8JzSJKtriDD5+O3VurxFRkkfs2Z1JXXTt5JGbln9inYj5mP44+0ZD2/wPYGyCQdNdZB92VFxXfiFIw6vDO+VdN2C+3KgprTghTtuvHufFDO3WlYak=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-04 14:53:12', '2024-03-04 14:53:12', NULL, '11812331093', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7375, '2024-03-02 00:00:00', '2024-03-04 00:00:00', 2, 14, 828.514, 'USD', 'AOA', NULL, 1429.275, 1038749.4275, 145424.91985, 1184174.34735, '1000279207750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 11812331093'),
	(208, '2024-03-04;2024-03-04T15:10:34;FR ATO2024/73;5817518.76;GWKPX0qsrO8lzwisege/4W9uCfu8FkChQ+HbEcv56jKORJUyD/Zfg2eODDoo6SQmqMXgM1gEKRWPnPzU5//yPFyEgV6bB5oOCHY4QUd7pOgJs2FCdU9zu96MbOXgbJp1+bu2WGY8g+YMOHesyrkp9KPnbihu+9JEwxykcS8JvO8=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY ANGOLA', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 1, 73, 'FR ATO2024/73', NULL, 'puKn8JFxRZdT2eUJSzBKJUALuDKdqHbQD2qL+/7DEbpCboA+48R2/GPRcvwgIGOvLqdxSAer7eSswAI9/Tr+4imJUv0odXiFITwfs/rf0U6odL/pGUI+11pNhv5cQqxWIcmLz+u79Jh5DCfmYeGL9GhXqaHVCjPi8FH703xvCGo=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 15:10:34', '2024-03-04 15:10:34', NULL, '57434030242/LAD-00000018', NULL, 0, NULL, NULL, NULL, NULL, NULL, 9119, '2024-02-02 00:00:00', '2024-02-24 00:00:00', 22, 0, 828.514, 'USD', 'AOA', NULL, 7021.63, 5817518.75782, 0, 5817518.75782, '1000273208751', 1, 4, 2, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 091/24'),
	(209, '2024-03-04;2024-03-04T15:48:38;FR ATO2024/74;1184174.35;puKn8JFxRZdT2eUJSzBKJUALuDKdqHbQD2qL+/7DEbpCboA+48R2/GPRcvwgIGOvLqdxSAer7eSswAI9/Tr+4imJUv0odXiFITwfs/rf0U6odL/pGUI+11pNhv5cQqxWIcmLz+u79Jh5DCfmYeGL9GhXqaHVCjPi8FH703xvCGo=', 1, 279, 'SIMPORTEX - COMERCIALIZAÇÃO DE EQUIPAMENTOS M.M', 'SIMPORTEX - CEMERCIALIZAÇÃO DE EQUIPAMENTOS M.M', NULL, '5410003519', NULL, 'RUA RAINHA GINGA Nº 24 - INGOMBOTA', 1, 74, 'FR ATO2024/74', 'FP ATO2024/10', 'P6I4QHZuB5a/V6OEvU3k5btvmgfYqxwVgS9mDbkVdUOl8TJ/DyZe+RJCQLLgSiNoDWnzh7979VIVLjkny2wVIasB0fwFlPw0eI0e+COovpwz1Gv60gz2Qt3Zf0wssgg/ziB5dKV8UbefRypgkdnZT9EoMV5/yqdOfnnyfF5iNj4=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-04 15:48:38', '2024-03-04 15:48:38', NULL, '11812331093', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7375, '2024-03-02 00:00:00', '2024-03-04 00:00:00', 2, 14, 828.514, 'USD', NULL, NULL, 1429.275, 1038749.4275, 145424.91985, 1184174.34735, '1000279209750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 11812331093'),
	(210, '2024-03-04;2024-03-04T15:49:11;FT ATO2024/21;2208009.36;S4hH1cfm9JcQIA9rJSKq2aUJ72zrSzytNFrrlWd+2o7IVC7aIj4coq0q/WtEDJdpxZlXz83QFOPFyip2fuw4Xczdsp72ju7IA7OfXVAADCxfZjCl7sQuM4Ml1qyUjKz/R5IrG+r5ZCH7ZGUf/F2/xX10s60JMsSbGhZaz/iR/6Q=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 21, 'FT ATO2024/21', NULL, 'bU2x/Iwn/P0kp5Vb9GZ5/KUAzsjUjyAf7N91Yh4Y9PTrKqBZpJFsIJz70SoO6XYH9yn3zPdb0I0eyWdalZpCydtsH7YbVMSo40C0xTnrXondnlbf3KPuU5k32CJrBn3PQCfhN7SycMtfO6Ists90m1QB/ZReLw+myL+RBcy95zk=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 15:49:11', '2024-03-04 15:49:11', NULL, NULL, 'BOING 737-800', 79, '2024-02-20', '2024-02-20', '13:33:00', '14:52:00', NULL, 21960, NULL, NULL, NULL, 14, 828.514, 'USD', 'AOA', NULL, 2665.0236, 1936850.31836, 271159.0445704, 2208009.3629304, '1000269210751', 2, 2, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 092/24'),
	(211, '2024-03-04;2024-03-04T15:58:19;FR ATO2024/75;489254.09;P6I4QHZuB5a/V6OEvU3k5btvmgfYqxwVgS9mDbkVdUOl8TJ/DyZe+RJCQLLgSiNoDWnzh7979VIVLjkny2wVIasB0fwFlPw0eI0e+COovpwz1Gv60gz2Qt3Zf0wssgg/ziB5dKV8UbefRypgkdnZT9EoMV5/yqdOfnnyfF5iNj4=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'BAKER HUGHES EHO LTD', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 75, 'FR ATO2024/75', NULL, 'Vw4BUPEG+e0+4VP3G9qNqqAuFZvFaQWkI4jBOOxG71hIBilqWjnfsoPmKPWBueXNcvg/WenxpdUqgNZYA2cbl7tJJ9JUtjazerNpMSmhWXKqhUCCzNh9BJvAj6GqgyKhXbae0PFhQnlnCKNf0F7KupENZooVmI7wCy0NfhJ3SQk=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-04 15:58:19', '2024-03-04 15:58:19', NULL, '574-34014433', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2590, '2024-02-24 00:00:00', '2024-02-27 00:00:00', 3, 14, 828.514, 'USD', 'AOA', NULL, 590.52, 429170.252, 60083.83528, 489254.08728, '1000265211751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 093/24'),
	(212, '2024-03-05;2024-03-05T10:58:16;PP ATO2024/11;710511.47;pBGjBZyNe1Pbk7yY0eQ741ghQ1nxHaeqTvbPd/761cmUR4azSA3fVdriOj8JzSJKtriDD5+O3VurxFRkkfs2Z1JXXTt5JGbln9inYj5mP44+0ZD2/wPYGyCQdNdZB92VFxXfiFIw6vDO+VdN2C+3KgprTghTtuvHufFDO3WlYak=', 1, 280, 'INDUSTRIAS TOPACK, LDA', 'INDUSTRIAS TOPACK', NULL, '5417251135', NULL, 'POLO INDUSTRIA DE VIANA VIA EXPRESSA', 3, 11, 'FP ATO2024/11', NULL, 'aV/xVsR9Z7ILTFDKuJTV5agZfHPczjSUL9jd62HFJzRNa7q3MUvjAQ+E7jnJAyx7ywgoFDdjvqyCl7qYj62nzhHURrEMeO5Qu9IG35Gxz5COjlev9BGqDT1gwL99d7yPCiZft23jF7cc4GKwfhJPsuITcT5rQXB/znKlqhFadZM=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 10:58:16', '2024-03-05 10:58:16', NULL, '118/12285103', NULL, 0, NULL, NULL, NULL, NULL, NULL, 885, '2024-02-24 00:00:00', '2024-03-05 00:00:00', 10, 14, 828.522, 'USD', 'AOA', NULL, 857.565, 623255.6745, 87255.79443, 710511.46893, '1000280212751', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118/12285103'),
	(213, '2024-03-05;2024-03-05T11:47:43;FR ATO2024/76;342477.86;Vw4BUPEG+e0+4VP3G9qNqqAuFZvFaQWkI4jBOOxG71hIBilqWjnfsoPmKPWBueXNcvg/WenxpdUqgNZYA2cbl7tJJ9JUtjazerNpMSmhWXKqhUCCzNh9BJvAj6GqgyKhXbae0PFhQnlnCKNf0F7KupENZooVmI7wCy0NfhJ3SQk=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'BAKER HUGHES EHO LTD', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 76, 'FR ATO2024/76', NULL, 'm5pqcYEiMfPCTiykaksnNhaORRDS3DG0ioicgcK6vgmh2vEr74w3vOzmJG9Hk5m25zkmcQZ5KkzRaD3/WIhqaIBfOgMyLHgbkgiYFvC0vcOhUrYn0Z1/yMLW5okUJeySfh5g694CY0vSGWwQsh2SKwNxE5zBfoRNabunMlFaDtc=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 11:47:43', '2024-03-05 11:47:43', NULL, '574-34014433', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2590, '2024-02-28 00:00:00', '2024-02-29 00:00:00', 1, 14, 828.514, 'USD', 'AOA', NULL, 413.364, 300419.1764, 42058.684696, 342477.861096, '1000265213751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 095/24'),
	(214, '2024-03-05;2024-03-05T11:54:34;FR ATO2024/77;9638683.32;m5pqcYEiMfPCTiykaksnNhaORRDS3DG0ioicgcK6vgmh2vEr74w3vOzmJG9Hk5m25zkmcQZ5KkzRaD3/WIhqaIBfOgMyLHgbkgiYFvC0vcOhUrYn0Z1/yMLW5okUJeySfh5g694CY0vSGWwQsh2SKwNxE5zBfoRNabunMlFaDtc=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'SCHLUMBERGER TECHNICAL SERVICES INC', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 77, 'FR ATO2024/77', NULL, 'HziHw4J9oI/yu4cwdRAe3u55t53MqIYJxqSI5W4xbkrQcZUH/qtqgg7YR/2KY7mp5kNbucEdfvf9IeBr9Et4CoPOno6rPLnA5QlcKM9Cp58meWPtHGHZ8mrAqYeRU2eliSvpCz630KnaUDeJgLAiizw9/LUDvfmE9UpBAf7ufWo=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 11:54:34', '2024-03-05 11:54:34', NULL, '574-34014444', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15700, '2024-02-12 00:00:00', '2024-03-01 00:00:00', 18, 14, 828.514, 'USD', 'AOA', NULL, 11633.7, 8454985.37, 1183697.9518, 9638683.3218, '1000265214751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 096/24'),
	(215, '2024-03-05;2024-03-05T12:12:03;FR ATO2024/78;14522.05;HziHw4J9oI/yu4cwdRAe3u55t53MqIYJxqSI5W4xbkrQcZUH/qtqgg7YR/2KY7mp5kNbucEdfvf9IeBr9Et4CoPOno6rPLnA5QlcKM9Cp58meWPtHGHZ8mrAqYeRU2eliSvpCz630KnaUDeJgLAiizw9/LUDvfmE9UpBAf7ufWo=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'BAKER HUGHES ANGOLA LDA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 78, 'FR ATO2024/78', NULL, 'hFY7Ih9hqy7jKIWra3bjl9lgTjlpOIby7kcAY2Bs2slGMJNsHUErUhPhx6QVRCLV5TRMto6nSM94YfRQ4uuAFM3jHHx7DlKSfA8m0Sp3cBR09Q6xGU77zW9J1srI8VlDZd2P/caiscMdGawH5s/P+KhFaLaZRyTqYKxSqRjRzbM=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 12:12:03', '2024-03-05 12:12:03', NULL, '118SVG12331314', NULL, 0, NULL, NULL, NULL, NULL, NULL, 53, '2024-02-24 00:00:00', '2024-03-01 00:00:00', 6, 14, 828.799, 'USD', 'AOA', NULL, 17.5218, 12738.64063, 1783.4096882, 14522.0503182, '1000266215751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 097/24'),
	(216, '2024-03-05;2024-03-05T12:23:33;FR ATO2024/79;4685416.23;hFY7Ih9hqy7jKIWra3bjl9lgTjlpOIby7kcAY2Bs2slGMJNsHUErUhPhx6QVRCLV5TRMto6nSM94YfRQ4uuAFM3jHHx7DlKSfA8m0Sp3cBR09Q6xGU77zW9J1srI8VlDZd2P/caiscMdGawH5s/P+KhFaLaZRyTqYKxSqRjRzbM=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'DSV PANALPINA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 79, 'FR ATO2024/79', NULL, 'VvD29L5neK6BirKqyzJNj+wd29MrGMi4vFPdTYr0YYyhgQhNWAGMrswCCROOGY59QVMApcWYxMp5CnU+QgLV4yDDsTzwYWXRWEFQ2aBN7YvT2BfKqWoNszeYHKLRrnk1NakY0GQwk8lsKhvl/pepUuGEovy5wu8ASxX87Z3y9HI=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 12:23:33', '2024-03-05 12:23:33', NULL, '118/12285324', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17100, '2024-02-24 00:00:00', '2024-03-01 00:00:00', 6, 14, 828.799, 'USD', 'AOA', NULL, 5653.26, 4110014.241, 575401.99374, 4685416.23474, '1000266216751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A NOTA DE PREÇO Nº 098/24'),
	(217, '2024-03-05;2024-03-05T13:02:05;PP ATO2024/12;379742.29;aV/xVsR9Z7ILTFDKuJTV5agZfHPczjSUL9jd62HFJzRNa7q3MUvjAQ+E7jnJAyx7ywgoFDdjvqyCl7qYj62nzhHURrEMeO5Qu9IG35Gxz5COjlev9BGqDT1gwL99d7yPCiZft23jF7cc4GKwfhJPsuITcT5rQXB/znKlqhFadZM=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 12, 'FP ATO2024/12', NULL, 'nv9EpzmFEkgctvbLqbHw+JsqmGEZJpHEz/7n5csBsm3jmdw+pWHB8kxDP8LUx6hFblqcu6blbdeBXiRFlTIX4dQrPECL2RfV3q0Na6TKm70Gbmqwdm3JwwOuvxTvu9bzCpiQyK1VVBzFEUi6GbV9Ks3M9LuZYz9U5+VpyGF0dcY=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 13:02:05', '2024-03-05 13:02:05', NULL, '118-11723095', NULL, 0, NULL, NULL, NULL, NULL, NULL, 473, '2024-02-24 00:00:00', '2024-03-05 00:00:00', 10, 14, 828.522, 'USD', 'AOA', NULL, 458.337, 333107.2701, 46635.017814, 379742.287914, '1000269217751', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-11723095'),
	(218, '2024-03-05;2024-03-05T13:02:28;PP ATO2024/13;1257244.02;nv9EpzmFEkgctvbLqbHw+JsqmGEZJpHEz/7n5csBsm3jmdw+pWHB8kxDP8LUx6hFblqcu6blbdeBXiRFlTIX4dQrPECL2RfV3q0Na6TKm70Gbmqwdm3JwwOuvxTvu9bzCpiQyK1VVBzFEUi6GbV9Ks3M9LuZYz9U5+VpyGF0dcY=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 13, 'FP ATO2024/13', NULL, 'p5Vyk2ok1NLLeROJQjPOcTjjnWQJbc7P3RI4KWR5acKfx2Bvt4evqdAb9ePwKtd0FHbJEDOQk0bxRInQ8DizfXfoMVQm+/0amiPYLPq4RFTz7XY6fRQVngSNTj0iSNenCpfAwWogQZfR71u8a83nPvY3YgT98tOQAhKfdyYxayk=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-05 13:02:28', '2024-03-05 13:02:28', NULL, '118-11723073', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1566, '2024-02-24 00:00:00', '2024-03-05 00:00:00', 10, 14, 828.522, 'USD', 'AOA', NULL, 1517.454, 1102845.6342, 154398.388788, 1257244.022988, '1000269218750', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A WB Nº 118-11723073'),
	(219, '2024-03-05;2024-03-05T13:19:46;PP ATO2024/14;41823.13;p5Vyk2ok1NLLeROJQjPOcTjjnWQJbc7P3RI4KWR5acKfx2Bvt4evqdAb9ePwKtd0FHbJEDOQk0bxRInQ8DizfXfoMVQm+/0amiPYLPq4RFTz7XY6fRQVngSNTj0iSNenCpfAwWogQZfR71u8a83nPvY3YgT98tOQAhKfdyYxayk=', 1, 281, 'ASCO ANGOLAN SERVICES COMPANY', 'ASCO ANGOLAN SERVICES COMPANY', '+244926671315', '5417219770', 'nelson.costa@olicargo.com', 'RUA EMILIO M BINDI N 9/11', 3, 14, 'FP ATO2024/14', NULL, 'wn3zv2TUOsHatp4x/rP5SMByc5h3VkG0DGA5lo4OJLlK0rFkduPGh9oEJ55nR6MSQ0EtNtcMpQUKthP/om7nfZM8eBOdslTh62gzpL7Mxo+B6MRz4k9wxZirJOKr/YWofU/qFwUtJliVka+aylgekYmi0NhUMUqtreK2K+VuhfY=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 13:19:46', '2024-03-05 13:19:46', NULL, ' 11811723191', NULL, 0, NULL, NULL, NULL, NULL, NULL, 123, '2024-03-02 00:00:00', '2024-03-05 00:00:00', 3, 14, 828.522, 'USD', 'AOA', NULL, 50.4792, 36686.95416, 5136.1735824, 41823.1277424, '1000281219751', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº  11811723191'),
	(220, '2024-03-05;2024-03-05T13:21:48;PP ATO2024/15;237262.19;wn3zv2TUOsHatp4x/rP5SMByc5h3VkG0DGA5lo4OJLlK0rFkduPGh9oEJ55nR6MSQ0EtNtcMpQUKthP/om7nfZM8eBOdslTh62gzpL7Mxo+B6MRz4k9wxZirJOKr/YWofU/qFwUtJliVka+aylgekYmi0NhUMUqtreK2K+VuhfY=', 1, 272, 'PONTICELLI ANGOIL', 'PONTICELLI ANGOIL', NULL, '5403090762', NULL, 'Av. Comandante Kima-Kyenda, Nº311', 3, 15, 'FP ATO2024/15', NULL, 'mn8PVN/305WKyLkQE0AUxBYszp1FVZouy1PLoMbIH/oDlBw8M8GshHMwoJ2bXLVGqzGqwEbbv5Vemz+aS19hegkfXk13D+TaxHUUtxvkZtdqG/Xv/pDLNlGcNcZxFmZQraPtJif2UUGnZE1km/QAyVw4dqlc/PyjrV6NG4Mzlf4=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-05 13:21:48', '2024-03-05 13:21:48', NULL, '11811720310', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1256, '2024-03-02 00:00:00', '2024-03-05 00:00:00', 3, 14, 828.522, 'USD', 'AOA', NULL, 286.368, 208124.7264, 29137.461696, 237262.188096, '1000272220750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 11811720310'),
	(221, '2024-03-05;2024-03-05T13:53:59;FR ATO2024/80;379742.29;VvD29L5neK6BirKqyzJNj+wd29MrGMi4vFPdTYr0YYyhgQhNWAGMrswCCROOGY59QVMApcWYxMp5CnU+QgLV4yDDsTzwYWXRWEFQ2aBN7YvT2BfKqWoNszeYHKLRrnk1NakY0GQwk8lsKhvl/pepUuGEovy5wu8ASxX87Z3y9HI=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 1, 80, 'FR ATO2024/80', 'FP ATO2024/12', 'jKLhn/bSd6uEMJAD0gLYVO2z3YFBrVn3iO044mYIYVagXC/T0ndolotbrm3PvtTgXBAf4tGMK5WuGGIHrPxNHqLZPdxyLKvhsCptT8joWc8U3AA703mfWqoxJDUd2tPNSqsAV1m7r2wGvQudRonD335LIWPfIPpQE1Y+1X4M+1w=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 13:53:59', '2024-03-05 13:53:59', NULL, '118-11723095', NULL, 0, NULL, NULL, NULL, NULL, NULL, 473, '2024-02-24 00:00:00', '2024-03-05 00:00:00', 10, 14, 828.522, 'USD', NULL, NULL, 458.337, 333107.2701, 46635.017814, 379742.287914, '1000269221751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-11723095'),
	(222, '2024-03-05;2024-03-05T14:04:54;PP ATO2024/16;1464319.51;mn8PVN/305WKyLkQE0AUxBYszp1FVZouy1PLoMbIH/oDlBw8M8GshHMwoJ2bXLVGqzGqwEbbv5Vemz+aS19hegkfXk13D+TaxHUUtxvkZtdqG/Xv/pDLNlGcNcZxFmZQraPtJif2UUGnZE1km/QAyVw4dqlc/PyjrV6NG4Mzlf4=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 16, 'FP ATO2024/16', NULL, 'tY1TB3s2MRfIJZJQCyZavCyJxxwf98UJzeV1Xs9m/oQJ9sogLW9xwucNFz/mK3A0IArIeBNnp1MlSwRuox2OR1MryNiuUfCIghWGRP3WdZqAt8Q6W+RzU6/TCYdlHl2aKqHWCYFvjHYgk4QGPXG9hwSEDU/Rs2q5Im11my1tQP8=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-05 14:04:54', '2024-03-05 14:04:54', NULL, '118-11723073', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1566, '2024-02-24 00:00:00', '2024-03-07 00:00:00', 12, 14, 828.522, 'USD', 'AOA', NULL, 1767.3876, 1284490.79748, 179828.7116472, 1464319.5091272, '1000269222750', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-11723073'),
	(223, '2024-03-05;2024-03-05T14:10:00;FR ATO2024/81;710511.47;jKLhn/bSd6uEMJAD0gLYVO2z3YFBrVn3iO044mYIYVagXC/T0ndolotbrm3PvtTgXBAf4tGMK5WuGGIHrPxNHqLZPdxyLKvhsCptT8joWc8U3AA703mfWqoxJDUd2tPNSqsAV1m7r2wGvQudRonD335LIWPfIPpQE1Y+1X4M+1w=', 1, 280, 'INDUSTRIAS TOPACK, LDA', 'INDUSTRIAS TOPACK', NULL, '5417251135', NULL, 'POLO INDUSTRIA DE VIANA VIA EXPRESSA', 1, 81, 'FR ATO2024/81', 'FP ATO2024/11', 'uAkBQ95RznmVTt9CpqsVjOqjiT729blLs889G53w8BgyAeCXMC+UtKw/fwDyvyTOqPILF2HRIiqMkJaGEVSIfjtsnHr/19k4q+d2NZIcygCOgevm7KirjTcUhn6DWkGMGyuKlFUzSUJk8di2bhqroKS/FosvFqKLO0SR0mALbNs=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 14:10:00', '2024-03-05 14:10:00', NULL, '118/12285103', NULL, 0, NULL, NULL, NULL, NULL, NULL, 885, '2024-02-24 00:00:00', '2024-03-05 00:00:00', 10, 14, 828.522, 'USD', NULL, NULL, 857.565, 623255.6745, 87255.79443, 710511.46893, '1000280223751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118/12285103'),
	(224, '2024-03-05;2024-03-05T14:23:11;FR ATO2024/82;41823.13;uAkBQ95RznmVTt9CpqsVjOqjiT729blLs889G53w8BgyAeCXMC+UtKw/fwDyvyTOqPILF2HRIiqMkJaGEVSIfjtsnHr/19k4q+d2NZIcygCOgevm7KirjTcUhn6DWkGMGyuKlFUzSUJk8di2bhqroKS/FosvFqKLO0SR0mALbNs=', 1, 281, 'ASCO ANGOLAN SERVICES COMPANY', 'ASCO ANGOLAN SERVICES COMPANY', '+244926671315', '5417219770', 'nelson.costa@olicargo.com', 'RUA EMILIO M BINDI N 9/11', 1, 82, 'FR ATO2024/82', 'FP ATO2024/14', 'pjAO7zUcKqbDax+ut8JFCJ6dL0t5SNC49aoSDvqJxTBfN7vByZUYo9devcQ+AsZR4KqOdH/aEIyvBsB19/NNzcVKim05BsA/QME5nmADkkvoo+UXyWZ/5kqVLXB4A1aoU6k9FIdjhh+mYOozcxp11GLSSfGsaesazTkfr6VvIwE=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 14:23:11', '2024-03-05 14:23:11', NULL, ' 11811723191', NULL, 0, NULL, NULL, NULL, NULL, NULL, 123, '2024-03-02 00:00:00', '2024-03-05 00:00:00', 3, 14, 828.522, 'USD', NULL, NULL, 50.4792, 36686.95416, 5136.1735824, 41823.1277424, '1000281224751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº  11811723191'),
	(225, '2024-03-05;2024-03-05T14:24:11;FR ATO2024/83;237262.19;pjAO7zUcKqbDax+ut8JFCJ6dL0t5SNC49aoSDvqJxTBfN7vByZUYo9devcQ+AsZR4KqOdH/aEIyvBsB19/NNzcVKim05BsA/QME5nmADkkvoo+UXyWZ/5kqVLXB4A1aoU6k9FIdjhh+mYOozcxp11GLSSfGsaesazTkfr6VvIwE=', 1, 272, 'PONTICELLI ANGOIL', 'PONTICELLI ANGOIL', NULL, '5403090762', NULL, 'Av. Comandante Kima-Kyenda, Nº311', 1, 83, 'FR ATO2024/83', 'FP ATO2024/15', 'EmoXg6eC79+/8+fI5PTveiFRUfYPDBdXaun7fPR9RcAzyDMhbjyRgZ/2BTdklzXIR/jB2o2fqDqyBxlChFjip4592xt/AVnb7cJkiHeNyJ1L1Q7/WtZJXZisyHLePD7XafT2HrEoU4jmoqO8liDnKIndEXXvCzTnLgFHlhQ/V70=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-05 14:24:11', '2024-03-05 14:24:11', NULL, '11811720310', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1256, '2024-03-02 00:00:00', '2024-03-05 00:00:00', 3, 14, 828.522, 'USD', NULL, NULL, 286.368, 208124.7264, 29137.461696, 237262.188096, '1000272225750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 11811720310'),
	(226, '2024-03-05;2024-03-05T14:34:51;FR ATO2024/84;739170.36;EmoXg6eC79+/8+fI5PTveiFRUfYPDBdXaun7fPR9RcAzyDMhbjyRgZ/2BTdklzXIR/jB2o2fqDqyBxlChFjip4592xt/AVnb7cJkiHeNyJ1L1Q7/WtZJXZisyHLePD7XafT2HrEoU4jmoqO8liDnKIndEXXvCzTnLgFHlhQ/V70=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'DSV AIR SERVICES', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 84, 'FR ATO2024/84', 'FP ATO2024/5', 'BEv5ayT2VSHVtfqpI2TJXYH6q6vn3BPGL/rfmvJaHedhmFY7F5it2B2y+e5vcfMy1O2HM0XhKkR+foUDXecOkPo9V+tMM50vw9OR8WC68HVr9k6/YEWH4GOH618deq5iSkd1HvkCeY84r4Fs6H+zRTRhvOhQKEnc9T7/CV06VhU=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-05 14:34:51', '2024-03-05 14:34:51', NULL, '574-33935112', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5590, '2024-03-01 00:00:00', '2024-03-02 00:00:00', 1, 14, 828.514, 'USD', NULL, NULL, 892.164, 648395.0564, 90775.307896, 739170.364296, '1000266226750', 1, 4, 2, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 574-33935112'),
	(227, '2024-03-06;2024-03-06T10:52:25;PP ATO2024/17;697401.60;tY1TB3s2MRfIJZJQCyZavCyJxxwf98UJzeV1Xs9m/oQJ9sogLW9xwucNFz/mK3A0IArIeBNnp1MlSwRuox2OR1MryNiuUfCIghWGRP3WdZqAt8Q6W+RzU6/TCYdlHl2aKqHWCYFvjHYgk4QGPXG9hwSEDU/Rs2q5Im11my1tQP8=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'ESSO EXPLORATION ANGOLA (BLOCK 15) LTD', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 3, 17, 'FP ATO2024/17', NULL, 'KBWNPGEzSpBpiqaqFCJ/w/yqQxXZxTDgH+4ootjv2RCS4pP6yutDH4C/Uz1jDAriOfiDkMiB2PahgJdMgSDyC4XwdRaws6BsZdYuwPHenlyMcJn0wHVQIlLPTMgWRpslxR5tsKuDsp1e9/eF2u7x+K+HjW1zVtQ/kHx0jpoOx+4=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-06 10:52:25', '2024-03-06 10:52:25', NULL, '118-12121970', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1571, '2024-02-24 00:00:00', '2024-03-07 00:00:00', 12, 14, 828.522, 'USD', 'AOA', NULL, 841.7418, 611755.78914, 85645.8104796, 697401.5996196, '1000266227750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 118-12121970'),
	(228, '2024-03-06;2024-03-06T11:21:12;FT ATO2024/22;51683.37;bU2x/Iwn/P0kp5Vb9GZ5/KUAzsjUjyAf7N91Yh4Y9PTrKqBZpJFsIJz70SoO6XYH9yn3zPdb0I0eyWdalZpCydtsH7YbVMSo40C0xTnrXondnlbf3KPuU5k32CJrBn3PQCfhN7SycMtfO6Ists90m1QB/ZReLw+myL+RBcy95zk=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 22, 'FT ATO2024/22', NULL, 'QzMIX4JhTAJgR6+eOWAjoR5PVQOgpxjxktEHspjGUJrfR9Dcy1RGUucAC/u+DFTX/Opk/OYPPkmDEY8xS2lYF0tKmkmb36CV3VcCZUSEw2PzPrT2cQXemGNCHqXT/IELnA8I2dej0PVC32gUIzTBQepVnp9N5fhN+03g2OO3diQ=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-06 11:21:12', '2024-03-06 11:21:12', NULL, '57434020254', NULL, 0, NULL, NULL, NULL, NULL, NULL, 114, '2024-02-24 00:00:00', '2024-02-28 00:00:00', 4, 14, 828.514, 'USD', 'AOA', NULL, 62.3808, 45336.28608, 6347.0800512, 51683.3661312, '1000269228751', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 6, 'REFERENTE A NOTA DE PREÇO Nº 100/24'),
	(229, '2024-03-06;2024-03-06T11:27:54;FT ATO2024/23;3173.54;QzMIX4JhTAJgR6+eOWAjoR5PVQOgpxjxktEHspjGUJrfR9Dcy1RGUucAC/u+DFTX/Opk/OYPPkmDEY8xS2lYF0tKmkmb36CV3VcCZUSEw2PzPrT2cQXemGNCHqXT/IELnA8I2dej0PVC32gUIzTBQepVnp9N5fhN+03g2OO3diQ=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 23, 'FT ATO2024/23', NULL, 'ptyGxzwfVo69JZBhXHMbqjeFbHo7kD2tboWckR79qUs708XN9ERk5OxU953eWXEFilhaUsMMCoEQea1Bq9gXwASwWvMQn0FHm3MWfUkbFq8XADuHRWBI7oY9S46B4/4usVFmPmZtjGmJ27qFHVjP5LpoOvJt2QxqhEu1ttCWPYs=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-06 11:27:54', '2024-03-06 11:27:54', NULL, '57433993794', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, '2024-02-24 00:00:00', '2024-02-28 00:00:00', 4, 14, 828.514, 'USD', 'AOA', NULL, 3.8304, 2783.80704, 389.7329856, 3173.5400256, '1000269229751', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 6, 'REFERENTE A NOTA DE PREÇO Nº 101/24'),
	(230, '2024-03-06;2024-03-06T11:32:07;FT ATO2024/24;8160.53;ptyGxzwfVo69JZBhXHMbqjeFbHo7kD2tboWckR79qUs708XN9ERk5OxU953eWXEFilhaUsMMCoEQea1Bq9gXwASwWvMQn0FHm3MWfUkbFq8XADuHRWBI7oY9S46B4/4usVFmPmZtjGmJ27qFHVjP5LpoOvJt2QxqhEu1ttCWPYs=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 2, 24, 'FT ATO2024/24', NULL, 'onnybySYsKOYpd8sLMsfggKyYTa/pjdi1efoIneJfmV5rAnNuJXOUVx6bOVr/PAfKLx8qDEy+M6SJDpLT0Wd5C1i5q+prlr2ES+0WKwL55s9d123Rjo/hiiP7VIAq9o4Z95gprNoEuUs7WZtb65TsqBUk3Jzzcov+XuEZF6CFcc=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-06 11:32:07', '2024-03-06 11:32:07', NULL, '11812331292', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18, '2024-02-24 00:00:00', '2024-02-28 00:00:00', 4, 14, 828.514, 'USD', 'AOA', NULL, 9.8496, 7158.36096, 1002.1705344, 8160.5314944, '1000269230751', 2, 2, 1, 'N', 'N', 'N', 0, 0, 1, 6, 'REFERENTE A NOTA DE PREÇO Nº 102/24'),
	(231, '2024-03-06;2024-03-06T11:46:31;PP ATO2024/18;2797135.51;KBWNPGEzSpBpiqaqFCJ/w/yqQxXZxTDgH+4ootjv2RCS4pP6yutDH4C/Uz1jDAriOfiDkMiB2PahgJdMgSDyC4XwdRaws6BsZdYuwPHenlyMcJn0wHVQIlLPTMgWRpslxR5tsKuDsp1e9/eF2u7x+K+HjW1zVtQ/kHx0jpoOx+4=', 1, 277, 'COMPANHIA CASTEL DE BEBIDAS DE LUANDA-CCBL, S.A', 'COMPANHIA CASTEL DE BEBIDAS DE LUANDA', '923967562', '5410000757', NULL, 'RUA N´GOLA KILUANGE Nº370', 3, 18, 'FP ATO2024/18', NULL, 'inU6C01vNGYSBVPLSPfvaI2NpXMuens31aT1QlFRb+1stUpoUY73Yf4wy0wxaiMvctZJgGy0Jw3B2niBrOdfcBKhPPmLwV9PjqX1MZTNoC6ZFgQpNS7OaeHIQuWQbI05/UvMgzbm7uGKiLh20hQizd/9Kywx4T33yztEWBgMRW0=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-06 11:46:31', '2024-03-06 11:46:31', NULL, '118-1196 2230', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10212, '2024-02-09 00:00:00', '2024-02-11 00:00:00', 2, 14, 828.514, 'USD', 'AOA', NULL, 3376.0872, 2453627.64072, 343507.8697008, 2797135.5104208, '1000277231751', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-1196 2230; ENTRADA DIA 09/02 SAIDA DIA 11/02'),
	(233, '2024-03-06;2024-03-06T14:31:08;FT ATO2024/26;3636177.93;sxzr5Y1HBxfoPeB3XV9oNqjJ93n39Yq8zN1M+y4Zr5yjr0HBlcX4rsKKRC9+YQyekIhjZ2nRqkF+OEU0/B0A+B9KbMiy3P6W56WuOuE2CBYzT83m3obhfxmUT2qldw+9hx5xuKj4EFzrjJVzlfGlMA8BvBa9TO6hdvKFQ4evZdA=', 1, 267, 'MULTIFLIGHT LDA', 'VULKAN AIR', '+244933535482', '5417323659', 'opsmultiflight@gmail.com', 'Av. Revolução de Outubro, Bloco 47 B-3 Andar', 2, 26, 'FT ATO2024/26', NULL, 'spZZQXWYVmxhI2UDKjbMUzSnnGfQL8EcYeJ2euCM75306rBXtesQD8SFYZND1Rx95ELXnjQmfVJvXmqYK0hW5Hw0bb0PQWlT/QUrjpSuhytqudf44ptjKFeH4h87MpD7NyZGUQcGSun+CKmB67HwpUxhBtoq3G8sPDHCx1N4kaM=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-06 14:31:08', '2024-03-06 14:31:08', NULL, NULL, 'ANTONOV AN-26', 24, '2024-02-06', '2024-02-23', '11:09:00', '14:30:00', NULL, 88, NULL, NULL, NULL, 14, 828.514, 'USD', 'AOA', NULL, 4388.7948, 3189629.76748, 446548.1674472, 3636177.9349272, '1000267233750', 2, 2, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 094/24, VOO DO DIA 23/02/2024'),
	(234, '2024-03-06;2024-03-06T15:30:23;FR ATO2024/85;9920.72;BEv5ayT2VSHVtfqpI2TJXYH6q6vn3BPGL/rfmvJaHedhmFY7F5it2B2y+e5vcfMy1O2HM0XhKkR+foUDXecOkPo9V+tMM50vw9OR8WC68HVr9k6/YEWH4GOH618deq5iSkd1HvkCeY84r4Fs6H+zRTRhvOhQKEnc9T7/CV06VhU=', 1, 282, 'BESTFLY, LDA', 'BESTFLY LDA', '+244925928831', '5417077976', 'ops@bestfly.aero', 'AV. 21 DE JANEIRO-AEROPORTO 4 DE FEVEREIRO', 1, 85, 'FR ATO2024/85', NULL, 'iqqFUvlbHxnq7oDl1WIMPHj9PL25tpQbU6LLUwTEhsn7mrtf9Cstn7hLKjyrh+3T2TRnahOBirrMsx0ggPGbeDmTuzK/XfWXpEIql9Ctc0gbD8Lq/UjWEmr4uNjPpVT5FftHYX4WK3u1L4M26xfwbafhU1ejD7MIUHrG+8Ni/w4=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-06 15:30:23', '2024-03-06 15:30:23', NULL, '118/VIE/1213-1011', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, '2024-02-24 00:00:00', '2024-02-29 00:00:00', 5, 14, 828.799, 'USD', 'AOA', NULL, 11.97, 8702.3895, 1218.33453, 9920.72403, '1000282234751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A NOTA DE PREÇO Nº 099/24'),
	(235, '2024-03-07;2024-03-07T08:58:32;FR ATO2024/86;697401.60;iqqFUvlbHxnq7oDl1WIMPHj9PL25tpQbU6LLUwTEhsn7mrtf9Cstn7hLKjyrh+3T2TRnahOBirrMsx0ggPGbeDmTuzK/XfWXpEIql9Ctc0gbD8Lq/UjWEmr4uNjPpVT5FftHYX4WK3u1L4M26xfwbafhU1ejD7MIUHrG+8Ni/w4=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'ESSO EXPLORATION ANGOLA (BLOCK 15) LTD', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 1, 86, 'FR ATO2024/86', 'FP ATO2024/17', 'HI9a+P40f67cgJSF83+nh3DB1YduMhuLG5NrD4EAf49BOnriBeGnLMiBRYJv1T+KOACw1o/b+Q8s+eGJM0C+x0zWknBfsoScEH/0YOCuQCwlrrccQPq1JmdLNUNdphLmgKldOOKDAwWdgH6KtP8QLVT4u7QZ7cfx5NzzxqS9r7Y=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-07 08:58:32', '2024-03-07 08:58:32', NULL, '118-12121970', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1571, '2024-02-24 00:00:00', '2024-03-07 00:00:00', 12, 14, 828.522, 'USD', NULL, NULL, 841.7418, 611755.78914, 85645.8104796, 697401.5996196, '1000266235750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 118-12121970'),
	(236, '2024-03-07;2024-03-07T09:32:04;PP ATO2024/19;80442.90;inU6C01vNGYSBVPLSPfvaI2NpXMuens31aT1QlFRb+1stUpoUY73Yf4wy0wxaiMvctZJgGy0Jw3B2niBrOdfcBKhPPmLwV9PjqX1MZTNoC6ZFgQpNS7OaeHIQuWQbI05/UvMgzbm7uGKiLh20hQizd/9Kywx4T33yztEWBgMRW0=', 1, 282, 'BESTFLY, LDA', 'BESTFLY LIMITADA', '+244925928831', '5417077976', 'ops@bestfly.aero', 'AV. 21 DE JANEIRO-AEROPORTO 4 DE FEVEREIRO', 3, 19, 'FP ATO2024/19', NULL, 'VMKhqw4tsIvCBcua0qlb1HQL7cmd7N8yAwUziq2H/UEbYIs4Zful4m2e3IHJ2fuFQMRsLdi3tLnbqdIpEnVTLROAmlc7PHvA7hyqFL/LU/qSYC7JjvH8aVSGSUsoEtpSwhxKWNxukOTbwXDrMX4yrJeXLxdxNn47VHsyKBfQKiw=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-07 09:32:04', '2024-03-07 09:32:04', NULL, '118-12132816', NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, '2024-02-24 00:00:00', '2024-03-07 00:00:00', 12, 14, 828.799, 'USD', 'AOA', NULL, 97.0596, 70563.94686, 9878.9525604, 80442.8994204, '1000282236750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-12132816'),
	(237, '2024-03-07;2024-03-07T10:18:04;FT ATO2024/27;2954669.32;spZZQXWYVmxhI2UDKjbMUzSnnGfQL8EcYeJ2euCM75306rBXtesQD8SFYZND1Rx95ELXnjQmfVJvXmqYK0hW5Hw0bb0PQWlT/QUrjpSuhytqudf44ptjKFeH4h87MpD7NyZGUQcGSun+CKmB67HwpUxhBtoq3G8sPDHCx1N4kaM=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 27, 'FT ATO2024/27', NULL, 'DjRxpgLPgTaSDJT5F4fl6NtqtlZiDVQPtMqgIvSh1lSoG5D3dCDsyaSm4823UJ2gQuBQ3V9svQd8/rzBJ24Xz8Y3aa7hTASywWmJp1jnJrQGPEqVO2hAZmtkwVIuHk2dylA7ZosWN9NnuVg7kDPfLJUtc83UYi3O0vlkN3sfhv4=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-07 10:18:04', '2024-03-07 10:18:04', NULL, NULL, 'BOING 747-400F', 397, '2024-01-26', '2024-01-28', '06:13:00', '17:04:00', NULL, NULL, NULL, NULL, NULL, 0, 828.776, 'USD', 'AOA', NULL, 3565.1, 2954669.3176, 0, 2954669.3176, '1000264237750', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE A NOTA DE PREÇO Nº 048/24'),
	(238, '2024-03-07;2024-03-07T10:23:48;FR ATO2024/87;80442.90;HI9a+P40f67cgJSF83+nh3DB1YduMhuLG5NrD4EAf49BOnriBeGnLMiBRYJv1T+KOACw1o/b+Q8s+eGJM0C+x0zWknBfsoScEH/0YOCuQCwlrrccQPq1JmdLNUNdphLmgKldOOKDAwWdgH6KtP8QLVT4u7QZ7cfx5NzzxqS9r7Y=', 1, 282, 'BESTFLY, LDA', 'BESTFLY LIMITADA', '+244925928831', '5417077976', 'ops@bestfly.aero', 'AV. 21 DE JANEIRO-AEROPORTO 4 DE FEVEREIRO', 1, 87, 'FR ATO2024/87', 'FP ATO2024/19', 'Zb6sXuw3nwbWIXFCyCno5hzqB2bEm2pfATOXBJ5U5sD60pePRVmMbWyIOjzrSCVF2mC9iVBuRRzZqCbrQwtlIgvWnSMOFTB5OM6XyWKGDrCFfu3HG12DJ+6WT/Xak9KTJCEO3mMhWlc7VZFoRhsf/f0UELxQExt7FNaLFVcT4aU=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-07 10:23:48', '2024-03-07 10:23:48', NULL, '118-12132816', NULL, 0, NULL, NULL, NULL, NULL, NULL, 86, '2024-02-24 00:00:00', '2024-03-07 00:00:00', 12, 14, 828.799, 'USD', NULL, NULL, 97.0596, 70563.94686, 9878.9525604, 80442.8994204, '1000282238750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-12132816'),
	(239, '2024-03-07;2024-03-07T10:42:41;FR ATO2024/88;2797135.51;Zb6sXuw3nwbWIXFCyCno5hzqB2bEm2pfATOXBJ5U5sD60pePRVmMbWyIOjzrSCVF2mC9iVBuRRzZqCbrQwtlIgvWnSMOFTB5OM6XyWKGDrCFfu3HG12DJ+6WT/Xak9KTJCEO3mMhWlc7VZFoRhsf/f0UELxQExt7FNaLFVcT4aU=', 1, 277, 'COMPANHIA CASTEL DE BEBIDAS DE LUANDA-CCBL, S.A', 'COMPANHIA CASTEL DE BEBIDAS DE LUANDA', '923967562', '5410000757', NULL, 'RUA N´GOLA KILUANGE Nº370', 1, 88, 'FR ATO2024/88', 'FP ATO2024/18', 'lrnKAoi8lXs89Qx5e/vlISyrs9m2K/wQhj499QBdfSd6S4Yod4YhY9S3DinerM9NYFKRfdQbwtWspS88r2CyQxfJvXX3xw1cHkIgvmtf66SqVLNQJe6z/AvNJ8qBJZRmHg2kG/dsizFeLr+0zuc0EeJSd8E8hhwXrzJzEAmX3Kc=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-07 10:42:41', '2024-03-07 10:42:41', NULL, '118-1196 2230', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10212, '2024-02-09 00:00:00', '2024-02-11 00:00:00', 2, 14, 828.514, 'USD', NULL, NULL, 3376.0872, 2453627.64072, 343507.8697008, 2797135.5104208, '1000277239750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-1196 2230; ENTRADA DIA 09/02 SAIDA DIA 11/02'),
	(240, '2024-03-07;2024-03-07T12:50:22;PP ATO2024/20;21831.58;VMKhqw4tsIvCBcua0qlb1HQL7cmd7N8yAwUziq2H/UEbYIs4Zful4m2e3IHJ2fuFQMRsLdi3tLnbqdIpEnVTLROAmlc7PHvA7hyqFL/LU/qSYC7JjvH8aVSGSUsoEtpSwhxKWNxukOTbwXDrMX4yrJeXLxdxNn47VHsyKBfQKiw=', 1, 283, 'MANUEL GOMES PACA', 'MANUEL GOMES PACA', NULL, '000107432CA014', NULL, 'CASA S Nº ZONA A CABINDA', 3, 20, 'FP ATO2024/20', NULL, 'apkaP9QdmCawylVQwLzmyuWSsmxAyQz6M2g4sjFwLCD5aDonKMq83tMJKMXAdbvx0T0+tSERzlNuZw09Gkhe9kRrobZm6RY2tgfpJoYk4TOly7ote6b1Nn5oV3VAAQYX2emkwBSnKN/oYC3uf+Na/vd4EJPA8Uo46xfRvNlPhyw=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-07 12:50:22', '2024-03-07 12:50:22', NULL, '574-33945321', NULL, 0, NULL, NULL, NULL, NULL, NULL, 46, '2024-03-02 00:00:00', '2024-03-07 00:00:00', 5, 14, 832.631, 'USD', 'AOA', NULL, 26.22, 19150.513, 2681.07182, 21831.58482, '1000283240750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 574-33945321'),
	(241, '2024-03-07;2024-03-07T15:26:26;FR ATO2024/89;21831.58;lrnKAoi8lXs89Qx5e/vlISyrs9m2K/wQhj499QBdfSd6S4Yod4YhY9S3DinerM9NYFKRfdQbwtWspS88r2CyQxfJvXX3xw1cHkIgvmtf66SqVLNQJe6z/AvNJ8qBJZRmHg2kG/dsizFeLr+0zuc0EeJSd8E8hhwXrzJzEAmX3Kc=', 1, 283, 'MANUEL GOMES PACA', 'MANUEL GOMES PACA', NULL, '000107432CA014', NULL, 'CASA S Nº ZONA A CABINDA', 1, 89, 'FR ATO2024/89', 'FP ATO2024/20', 'A0ulaaQjGqe0p+ZbVuhCYNeJaxRACFaWeAHMcwcrH8T1aABMNvUxCdnWUq/I7P2sD2JZzn7QERppiHu2YHJ014HtSmPuGXA6xLSjbJgDbH16v2BLa4J6M75rTvvzsYO1w0omgkj/yQrsi82E3IA8BFyXrWMI+QHzymIHSfvThR0=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-07 15:26:26', '2024-03-07 15:26:26', NULL, '574-33945321', NULL, 0, NULL, NULL, NULL, NULL, NULL, 46, '2024-03-02 00:00:00', '2024-03-07 00:00:00', 5, 14, 832.631, 'USD', NULL, NULL, 26.22, 19150.513, 2681.07182, 21831.58482, '1000283241751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 574-33945321'),
	(242, '2024-03-11;2024-03-11T10:53:27;PP ATO2024/21;226811.18;apkaP9QdmCawylVQwLzmyuWSsmxAyQz6M2g4sjFwLCD5aDonKMq83tMJKMXAdbvx0T0+tSERzlNuZw09Gkhe9kRrobZm6RY2tgfpJoYk4TOly7ote6b1Nn5oV3VAAQYX2emkwBSnKN/oYC3uf+Na/vd4EJPA8Uo46xfRvNlPhyw=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 21, 'FP ATO2024/21', NULL, 'GHbWcFemwZjMH0i5lI+gIoSvOtMFUAmTWxYQLjafrOvrhxCuUeBwv0lbGrg9w+4BnAeg4xOJK3e4AUh8jRCcKKKmPKeg4Qg7ERU/2YWVVo9cBsVXCGNaAMx3mhACRosN0zHJQF9AHUWWVlH0vz0kbYr5z7CBu+H9dbns3H6M3pw=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 10:53:27', '2024-03-11 10:53:27', NULL, '118-11723084', NULL, 0, NULL, NULL, NULL, NULL, NULL, 405, '2024-02-24 00:00:00', '2024-03-11 00:00:00', 16, 14, 832.631, 'USD', 'AOA', NULL, 272.403, 198957.17745, 27854.004843, 226811.182293, '1000269242750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 118-11723084'),
	(243, '2024-03-11;2024-03-11T10:57:28;PP ATO2024/22;1887786.63;GHbWcFemwZjMH0i5lI+gIoSvOtMFUAmTWxYQLjafrOvrhxCuUeBwv0lbGrg9w+4BnAeg4xOJK3e4AUh8jRCcKKKmPKeg4Qg7ERU/2YWVVo9cBsVXCGNaAMx3mhACRosN0zHJQF9AHUWWVlH0vz0kbYr5z7CBu+H9dbns3H6M3pw=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 22, 'FP ATO2024/22', NULL, 'yFmfntmvMImKgLoF2vz/XF5oMcxEZrlGqVCIioCjc3sntZ1vUzh1nMEJ58aiuubMxMdfJoG34kHVo4XUyOti8xgx6kIM43QL4MZlaf8jx+5PcrwKfYm8+/DmgNC4b/JLPGsKlCO4H1+xPakDzqPxiuF+fqyuhrOQlIDUnlZleb8=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 10:57:28', '2024-03-11 10:57:28', NULL, '118-11723073', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1566, '2024-02-24 00:00:00', '2024-03-11 00:00:00', 16, 14, 832.631, 'USD', 'AOA', NULL, 2267.2548, 1655953.18542, 231833.4459588, 1887786.6313788, '1000269243750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-11723073'),
	(244, '2024-03-11;2024-03-11T11:00:57;FT ATO2024/28;10515280.25;DjRxpgLPgTaSDJT5F4fl6NtqtlZiDVQPtMqgIvSh1lSoG5D3dCDsyaSm4823UJ2gQuBQ3V9svQd8/rzBJ24Xz8Y3aa7hTASywWmJp1jnJrQGPEqVO2hAZmtkwVIuHk2dylA7ZosWN9NnuVg7kDPfLJUtc83UYi3O0vlkN3sfhv4=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 28, 'FT ATO2024/28', NULL, 'AXi21W8/Iyi3HuJyjtEBmTlo8RA4V842r6tIL61ICmFjMdfByg4LSCMnK2YVyqNZp6tLNUKi+PozY8Eb+ADHTftqnDJ0ov76SirMzV8pu+eJ6VI5nlKoBaBTa9QdFLYoyq52Ted8MeDV9y+QQF2WPb07bhRNzKWUxzvNVFPFlYE=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-11 11:00:57', '2024-03-11 11:00:57', NULL, NULL, 'BOING 747-400', 397, '2024-02-24', '2024-02-25', '06:23:00', '12:05:00', NULL, 68636, NULL, NULL, NULL, 0, 832.631, 'USD', 'AOA', NULL, 12628.98, 10515280.24638, 0, 10515280.24638, '1000264244751', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE AO VOO DO DIA 25/02/2024'),
	(245, '2024-03-06;2024-03-06T12:17:02;FT ATO2024/25;2968412.78;onnybySYsKOYpd8sLMsfggKyYTa/pjdi1efoIneJfmV5rAnNuJXOUVx6bOVr/PAfKLx8qDEy+M6SJDpLT0Wd5C1i5q+prlr2ES+0WKwL55s9d123Rjo/hiiP7VIAq9o4Z95gprNoEuUs7WZtb65TsqBUk3Jzzcov+XuEZF6CFcc=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 25, 'FT ATO2024/25', NULL, 'sxzr5Y1HBxfoPeB3XV9oNqjJ93n39Yq8zN1M+y4Zr5yjr0HBlcX4rsKKRC9+YQyekIhjZ2nRqkF+OEU0/B0A+B9KbMiy3P6W56WuOuE2CBYzT83m3obhfxmUT2qldw+9hx5xuKj4EFzrjJVzlfGlMA8BvBa9TO6hdvKFQ4evZdA=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-06 12:17:02', '2024-03-06 12:17:02', NULL, NULL, 'BOING 747-400', 397, '2024-03-02', '2024-03-02', '07:50:00', '13:59:00', NULL, 0, NULL, NULL, NULL, 0, 832.631, 'USD', 'AOA', NULL, 3565.1, 2968412.7781, 0, 2968412.7781, '10002642451', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE AO VOO DO DIA 02/03/2024'),
	(246, '2024-03-11;2024-03-11T11:31:23;PP ATO2024/23;738064.18;yFmfntmvMImKgLoF2vz/XF5oMcxEZrlGqVCIioCjc3sntZ1vUzh1nMEJ58aiuubMxMdfJoG34kHVo4XUyOti8xgx6kIM43QL4MZlaf8jx+5PcrwKfYm8+/DmgNC4b/JLPGsKlCO4H1+xPakDzqPxiuF+fqyuhrOQlIDUnlZleb8=', 1, 266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'BAKER HUGHES ANGOLA LDA', '226422041', '5403005862', 'dario.manuel@ao.dsv.com', 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', 3, 23, 'FP ATO2024/23', NULL, 'I6Mcc4zziiqdfyqLnC1CizQ1Ff2FyDMcb+jNhhcZuZO6se7k8ICD2Sg0Y921ExTZnXklF/evYPZQz15fNPoxaEnTfzxgMpFC58znNzgTBe+LohiSGanQ7gLEXPeKdUJFI24EEt1HvYTuJYfW7qh+aPw2YzuHhPyv01DvfSsuSjk=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 11:31:23', '2024-03-11 11:31:23', NULL, '118-11962182', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1896.5, '2024-03-02 00:00:00', '2024-03-12 00:00:00', 10, 14, 832.631, 'USD', 'AOA', NULL, 886.4241, 647424.723515, 90639.4612921, 738064.1848071, '1000266246750', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 118-11962182'),
	(247, '2024-03-11;2024-03-11T11:57:35;PP ATO2024/24;1516137.12;I6Mcc4zziiqdfyqLnC1CizQ1Ff2FyDMcb+jNhhcZuZO6se7k8ICD2Sg0Y921ExTZnXklF/evYPZQz15fNPoxaEnTfzxgMpFC58znNzgTBe+LohiSGanQ7gLEXPeKdUJFI24EEt1HvYTuJYfW7qh+aPw2YzuHhPyv01DvfSsuSjk=', 1, 284, 'NOCEBO SA', 'NOCEBO SA', '937 393 718', '5410777832', 'angelino@castel-afrique.com', 'RUA CONEGO MANUEL DAS NEVES NR 403', 3, 24, 'FP ATO2024/24', NULL, 'bc+y4mhSHPbUOXQHn3gpQTpNTEIe6b3WmN/rb+qn6B3CyEV7cLPxBdYoCO8Ahv++P06HicpRp/MFHOyNwGMgBqA7/DUpCcW5MFzum79kWiQy+boJVQ2GKKFhEdP0DrDnxe1WaIR3hFntKdyZuf7/zTnN22e4LIVLv6iLki6ZbRE=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 11:57:35', '2024-03-11 11:57:35', NULL, '118-11723390', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1192, '2024-02-24 00:00:00', '2024-03-12 00:00:00', 17, 14, 832.631, 'USD', 'AOA', NULL, 1820.8992, 1329944.84368, 186192.2781152, 1516137.1217952, '1000284247750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-11723390'),
	(248, '2024-03-11;2024-03-11T12:23:16;FT ATO2024/29;4233096.00;AXi21W8/Iyi3HuJyjtEBmTlo8RA4V842r6tIL61ICmFjMdfByg4LSCMnK2YVyqNZp6tLNUKi+PozY8Eb+ADHTftqnDJ0ov76SirMzV8pu+eJ6VI5nlKoBaBTa9QdFLYoyq52Ted8MeDV9y+QQF2WPb07bhRNzKWUxzvNVFPFlYE=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 29, 'FT ATO2024/29', NULL, 'EPUn1GX8/GsKWJnc3EV3sHcmDV28ZUh2hadZncQ0BPXaTaIvwBqqOHUv9JNXGzyq/eOCi5Z08wJ3dNnhq1nkGEU+pSEUFvgh2RaPA2NcUECawiV2qc4MyUegI9V2my3/n1AA1cTQXU+cT2NLNqlvBPZ/9psUav86MNQB9dzeTbk=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-11 12:23:16', '2024-03-11 12:23:16', NULL, NULL, 'BOING 747-400', 397, '2024-03-02', '2024-03-02', '07:50:00', '13:59:00', NULL, 63550, NULL, NULL, NULL, 0, 832.631, 'USD', 'AOA', NULL, 5084, 4233096.004, 0, 4233096.004, '1000264248751', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE AO VOO DO DIA 02/03/2024'),
	(249, '2024-03-11;2024-03-11T13:57:16;FR ATO2024/90;226811.18;A0ulaaQjGqe0p+ZbVuhCYNeJaxRACFaWeAHMcwcrH8T1aABMNvUxCdnWUq/I7P2sD2JZzn7QERppiHu2YHJ014HtSmPuGXA6xLSjbJgDbH16v2BLa4J6M75rTvvzsYO1w0omgkj/yQrsi82E3IA8BFyXrWMI+QHzymIHSfvThR0=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 1, 90, 'FR ATO2024/90', 'FP ATO2024/21', 'UdxfGhKYL/Cn8PXE6H28kQlEwXTA72BaZ6yf7sP0ZEHEMPQkD/j9RwquyjRCmyCUU11tMiT65O0nKbgZAIIPcNdSuX07iYt8wnxjr1V7ur2gMlEJO7l/Cmmye+3CrzP80UTYurrlhJSANnWiK65bJYz1UMj0qwZrC64qoUYJh4s=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 13:57:16', '2024-03-11 13:57:16', NULL, '118-11723084', NULL, 0, NULL, NULL, NULL, NULL, NULL, 405, '2024-02-24 00:00:00', '2024-03-11 00:00:00', 16, 14, 832.631, 'USD', NULL, NULL, 272.403, 198957.17745, 27854.004843, 226811.182293, '1000269249750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 118-11723084'),
	(250, '2024-03-11;2024-03-11T13:58:45;FR ATO2024/91;1887786.63;UdxfGhKYL/Cn8PXE6H28kQlEwXTA72BaZ6yf7sP0ZEHEMPQkD/j9RwquyjRCmyCUU11tMiT65O0nKbgZAIIPcNdSuX07iYt8wnxjr1V7ur2gMlEJO7l/Cmmye+3CrzP80UTYurrlhJSANnWiK65bJYz1UMj0qwZrC64qoUYJh4s=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 1, 91, 'FR ATO2024/91', 'FP ATO2024/22', 'tW/APlOPgmSNZ3Yxu1rraxspytVFXT++OWMbhAPhGe0FaUpjz/CFtPVRjR4y1q9fUERjYFPsfPxnh5FW3vFd4BVF3TJzd1CqPaZISW96P+hOWlrfq4cLSQZKXfCCK3+v1WQMUJrlSlhAFbBK4a/7AFpab2rDAEXQC6m88YUhoTQ=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 13:58:45', '2024-03-11 13:58:45', NULL, '118-11723073', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1566, '2024-02-24 00:00:00', '2024-03-11 00:00:00', 16, 14, 832.631, 'USD', NULL, NULL, 2267.2548, 1655953.18542, 231833.4459588, 1887786.6313788, '1000269250750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-11723073'),
	(251, '2024-03-11;2024-03-11T14:02:38;PP ATO2024/25;302984.43;bc+y4mhSHPbUOXQHn3gpQTpNTEIe6b3WmN/rb+qn6B3CyEV7cLPxBdYoCO8Ahv++P06HicpRp/MFHOyNwGMgBqA7/DUpCcW5MFzum79kWiQy+boJVQ2GKKFhEdP0DrDnxe1WaIR3hFntKdyZuf7/zTnN22e4LIVLv6iLki6ZbRE=', 1, 276, 'VITALIS CHUKWULOTA OZOCHI', 'OZOCHI VITALIS', '928434868', '0000032603', 'mailto:edgarpedro687@gmail.com', 'Sambizanga Casa S Zona 10', 3, 25, 'FP ATO2024/25', NULL, 'II6h0+0XfDizaph5FEOILqGFTWnyzvbm645mj9CSi/a3URypWxh7p4qAAHr9F4IcC2/p+mBG28PVT7qgR5czPSHyl7eBKlFpIq+HnZg4+gaLPracinsAFLsVoQxunI1jcrAhiZVKyCDCPSEz4duA3z5SvlRB7wQNHuDSYTTlnaU=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 14:02:38', '2024-03-11 14:02:38', NULL, '118-12401174', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2280, '2024-03-10 00:00:00', '2024-03-11 00:00:00', 1, 14, 832.631, 'USD', 'AOA', NULL, 363.888, 265775.8152, 37208.614128, 302984.429328, '1000276251750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-12401174'),
	(252, '2024-03-11;2024-03-11T14:24:36;FR ATO2024/92;302984.43;tW/APlOPgmSNZ3Yxu1rraxspytVFXT++OWMbhAPhGe0FaUpjz/CFtPVRjR4y1q9fUERjYFPsfPxnh5FW3vFd4BVF3TJzd1CqPaZISW96P+hOWlrfq4cLSQZKXfCCK3+v1WQMUJrlSlhAFbBK4a/7AFpab2rDAEXQC6m88YUhoTQ=', 1, 276, 'VITALIS CHUKWULOTA OZOCHI', 'OZOCHI VITALIS', '928434868', '0000032603', 'mailto:edgarpedro687@gmail.com', 'Sambizanga Casa S Zona 10', 1, 92, 'FR ATO2024/92', 'FP ATO2024/25', 'iXFfp9KqorJ/LAdb/8mMu1zDLPHhI4pR8YmWxFlsEL0LhC6HCqlC3QiZ3lMJ23lV9aXBwGnweWWqVATegZjWgiDsqkLPnBy8M6iPKQUN2W/TBBs4ZDxdZ+HmphSSGcVearL1eTV+pwuD7AFwouWwGD4Jb0EkCaZPUzS/oiEGFOA=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 14:24:36', '2024-03-11 14:24:36', NULL, '118-12401174', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2280, '2024-03-10 00:00:00', '2024-03-11 00:00:00', 1, 14, 832.631, 'USD', NULL, NULL, 363.888, 265775.8152, 37208.614128, 302984.429328, '1000276252750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-12401174'),
	(255, '2024-03-11;2024-03-11T16:13:46;PP ATO2024/26;53819.60;II6h0+0XfDizaph5FEOILqGFTWnyzvbm645mj9CSi/a3URypWxh7p4qAAHr9F4IcC2/p+mBG28PVT7qgR5czPSHyl7eBKlFpIq+HnZg4+gaLPracinsAFLsVoQxunI1jcrAhiZVKyCDCPSEz4duA3z5SvlRB7wQNHuDSYTTlnaU=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 26, 'FP ATO2024/26', NULL, 'JiHB1Txo0mpzxw/H7Sya9ZhS9thsNYP6qhOegxGoa+goMMXNX0RRdlWsDDFJ+VkpjdLQd/4dA+ZvZTKtJGUmNtzgBAki+it2tJ7jLGu9OeWVSt0KbwuudIK2gPUWu57dqBs5IsvL4j0KZNerXnPW0/0VvNhIVYXPiFrrrRwLPMg=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 16:13:46', '2024-03-11 16:13:46', NULL, '118-11723084', NULL, 0, NULL, NULL, NULL, NULL, NULL, 405, '2024-03-11 00:00:00', '2024-03-12 00:00:00', 1, 14, 832.631, 'USD', 'AOA', NULL, 64.638, 47210.1777, 6609.424878, 53819.602578, '1000269255750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-11723084'),
	(256, '2024-03-11;2024-03-11T16:17:11;PP ATO2024/27;327018.16;JiHB1Txo0mpzxw/H7Sya9ZhS9thsNYP6qhOegxGoa+goMMXNX0RRdlWsDDFJ+VkpjdLQd/4dA+ZvZTKtJGUmNtzgBAki+it2tJ7jLGu9OeWVSt0KbwuudIK2gPUWu57dqBs5IsvL4j0KZNerXnPW0/0VvNhIVYXPiFrrrRwLPMg=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 3, 27, 'FP ATO2024/27', NULL, 'kRsBIcmpaNfxYluMgxuuaoO2N3jbUahAvgkSGwoNX4JesVim6nV3DdeRSHvhzcRKNo+jVlCM/c9vmX9BKI3sg2wAM/Ib+hIGKYnqe/PVydxmr5tFDS6MI4/n79kH1DSI/V4fCsz/pFr3b+LuyHsNaVexGKTyphLT7HXPz5wv8Ao=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-11 16:17:11', '2024-03-11 16:17:11', NULL, '118-11723073', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1566, '2024-03-11 00:00:00', '2024-03-12 00:00:00', 1, 14, 832.631, 'USD', 'AOA', NULL, 392.7528, 286858.03212, 40160.1244968, 327018.1566168, '1000269256750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB 118-11723073'),
	(257, '2024-03-11;2024-03-11T16:23:04;PP ATO2024/28;142807.04;kRsBIcmpaNfxYluMgxuuaoO2N3jbUahAvgkSGwoNX4JesVim6nV3DdeRSHvhzcRKNo+jVlCM/c9vmX9BKI3sg2wAM/Ib+hIGKYnqe/PVydxmr5tFDS6MI4/n79kH1DSI/V4fCsz/pFr3b+LuyHsNaVexGKTyphLT7HXPz5wv8Ao=', 1, 285, 'Kuehne e Nagel (Angola) Transitarios, LDA', 'TECHNIP FMC ANGOLA LDA', '946 901 469', '5403088504', 'knao.pagamentos@kuehne-nagel.com', 'Rua Rainha Ginga, Nº 29, Edifício Elisée Trade Center 16º Andar, Distrito Urbano da Ingombota', 3, 28, 'FP ATO2024/28', NULL, 'BYDDuijevKhlycR+S3pxTRtYt7n+6C23hB+gXJ4pXMhqexSxTzafAioo0+SnYLBwxvzue3unAtv1OJi0RyvzuvBhgC9vkrnrc0flaOi7tX+FM8WIEhXcSvc75mqvmY+sRvuqyG5/Aw+dTCBVHluaMhnxNBl97KPlv2u/zCL5PnI=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-11 16:23:04', '2024-03-11 16:23:04', NULL, '118-11509116', NULL, 0, NULL, NULL, NULL, NULL, NULL, 177, '2024-03-02 00:00:00', '2024-03-12 00:00:00', 10, 14, 832.631, 'USD', 'AOA', NULL, 171.513, 125269.33395, 17537.706753, 142807.040703, '1000285257751', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-11509116'),
	(258, '2024-03-11;2024-03-11T16:29:47;PP ATO2024/29;45789.38;BYDDuijevKhlycR+S3pxTRtYt7n+6C23hB+gXJ4pXMhqexSxTzafAioo0+SnYLBwxvzue3unAtv1OJi0RyvzuvBhgC9vkrnrc0flaOi7tX+FM8WIEhXcSvc75mqvmY+sRvuqyG5/Aw+dTCBVHluaMhnxNBl97KPlv2u/zCL5PnI=', 1, 285, 'Kuehne e Nagel (Angola) Transitarios, LDA', 'BAKER PETROLITE ANGOLA LIMITED', '946 901 469', '5403088504', 'knao.pagamentos@kuehne-nagel.com', 'Rua Rainha Ginga, Nº 29, Edifício Elisée Trade Center 16º Andar, Distrito Urbano da Ingombota', 3, 29, 'FP ATO2024/29', NULL, 'G7tBehprYRWW0T4/9P2yDJYlMqdS1/KbLfBvLDVYEdyETjaoT8g6Z0usgmbGJjx0SDWnCFa/Gs8+PWFe7T/FHt2lc4gYeED8QSAss2quWQ5nCcfyYOb+l4xZfbRpxEKfPwKrh++FMOX7uQ+xl4pGFxMpKa/wAWUAInlnmcGF7io=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-11 16:29:47', '2024-03-11 16:29:47', NULL, '118-11962171', NULL, 0, NULL, NULL, NULL, NULL, NULL, 36, '2024-02-24 00:00:00', '2024-03-12 00:00:00', 17, 14, 832.631, 'USD', 'AOA', NULL, 54.9936, 40166.11944, 5623.2567216, 45789.3761616, '1000285258751', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-11962171'),
	(259, '2024-03-12;2024-03-12T10:19:20;FT ATO2024/30;2720496.90;EPUn1GX8/GsKWJnc3EV3sHcmDV28ZUh2hadZncQ0BPXaTaIvwBqqOHUv9JNXGzyq/eOCi5Z08wJ3dNnhq1nkGEU+pSEUFvgh2RaPA2NcUECawiV2qc4MyUegI9V2my3/n1AA1cTQXU+cT2NLNqlvBPZ/9psUav86MNQB9dzeTbk=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 30, 'FT ATO2024/30', NULL, 'Z6TPQ6jKykiewdyE60nIubwyGSww7gE13RGwnDVUJE+ujAQ5ptnMHuyOQj9U1Hz44mOm1foracZPukJdsyXHNGlbAz9p3rg/Ebu/fiY/wqC/CiPtQUy/Q68Fj3ymfN3f6o2HlEpFPlta1Xj2NmiGl0/orjxyHwnO8KOkbwV/EOE=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-12 10:19:20', '2024-03-12 10:19:20', NULL, NULL, 'BOING 747-400F', 397, '2024-03-10', '2024-03-10', '14:32:00', '17:46:00', NULL, 0, NULL, NULL, NULL, 0, 832.631, 'USD', 'AOA', NULL, 3267.35, 2720496.89785, 0, 2720496.89785, '1000264259751', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE AO VOO DO DIA 10/03/2024'),
	(260, '2024-03-12;2024-03-12T10:23:37;FT ATO2024/31;3273370.21;Z6TPQ6jKykiewdyE60nIubwyGSww7gE13RGwnDVUJE+ujAQ5ptnMHuyOQj9U1Hz44mOm1foracZPukJdsyXHNGlbAz9p3rg/Ebu/fiY/wqC/CiPtQUy/Q68Fj3ymfN3f6o2HlEpFPlta1Xj2NmiGl0/orjxyHwnO8KOkbwV/EOE=', 1, 264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', 'AIR ATLANTA ICELANDIC', '923520471', '5403084690', 'ian.pereira@grupoliz.com', 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', 2, 31, 'FT ATO2024/31', NULL, 'iMXNfUjiRAFjh9f/d5STdB2nqFGd4dJu2jCfLwcAxdUAXb9P3/HTb7PAnkTurp420RO3e2y9Rh20Rmj0ADx/xQT5vEPAa/4XKP6lYJ8GF59IP7Dux9UCU7qqbgrDY1XPm8iZqhIGDCDj/V4jD5tZ6+jlNZaMPDIGUlUfNNUINiw=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-12 10:23:37', '2024-03-12 10:23:37', NULL, NULL, 'BOEING 747-400F', 397, '2024-03-10', '2024-03-10', '14:32:00', '17:46:00', NULL, 49141.97, NULL, NULL, NULL, 0, 832.631, 'USD', 'AOA', NULL, 3931.3576, 3273370.2098456, 0, 3273370.2098456, '1000264260751', 2, 2, NULL, 'Y', 'N', 'N', 0, 0, 2, NULL, 'REFERENTE AO VOO DO DIA 10/03/2024'),
	(261, '2024-03-12;2024-03-12T10:50:47;PP ATO2024/30;1183923.05;G7tBehprYRWW0T4/9P2yDJYlMqdS1/KbLfBvLDVYEdyETjaoT8g6Z0usgmbGJjx0SDWnCFa/Gs8+PWFe7T/FHt2lc4gYeED8QSAss2quWQ5nCcfyYOb+l4xZfbRpxEKfPwKrh++FMOX7uQ+xl4pGFxMpKa/wAWUAInlnmcGF7io=', 1, 270, 'TLC LDA', 'SEADRIL ANGOLA LDA', '+244 926 515 109', ' 5401146655', 'dsousa.an@tlc-com.ch', 'Avenida 4 de Fevereiro nº33 Luanda, Angola', 3, 30, 'FP ATO2024/30', NULL, 'C6myzhg5vpgjn936h1agaE0DdJw/8ZcdAtZIb2u/ZvNE7Ys0r1YVYCDqxUph61Vteesz58yVslInIuUfU9xEkXFREsp4UvI/tJwmv11Zc86mPkuQstmQpHonAW217RQfIGK6QOfHulvMjAK5jTPCXh7tB47v5ktbCXIm2giGCBQ=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-12 10:50:47', '2024-03-12 10:50:47', NULL, '574-34001634', NULL, 0, NULL, NULL, NULL, NULL, NULL, 884.6, '2024-02-24 00:00:00', '2024-03-13 00:00:00', 18, 14, 832.631, 'USD', 'AOA', NULL, 1421.90604, 1038528.989466, 145394.05852524, 1183923.0479912, '1000270261750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 574-34001634'),
	(262, '2024-03-12;2024-03-12T11:17:29;FR ATO2024/93;53819.60;iXFfp9KqorJ/LAdb/8mMu1zDLPHhI4pR8YmWxFlsEL0LhC6HCqlC3QiZ3lMJ23lV9aXBwGnweWWqVATegZjWgiDsqkLPnBy8M6iPKQUN2W/TBBs4ZDxdZ+HmphSSGcVearL1eTV+pwuD7AFwouWwGD4Jb0EkCaZPUzS/oiEGFOA=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 1, 93, 'FR ATO2024/93', 'FP ATO2024/26', 'QCSaaxdegMFoiqUwdejfzUkD7imFRglpXoxy++K9UkVChkR2yCMDk1ysPJj7TpqOg/nGMDXweLxdfBGb7lig2vXiDOuHf2jKkSDzePtJZoqJV8F6rIFmv/bOp1JjZdzl6/T/9GCREdjaE/+iSpCyEYTxfuk/dJfrk+/RQ+/69zw=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-12 11:17:29', '2024-03-12 11:17:29', NULL, '118-11723084', NULL, 0, NULL, NULL, NULL, NULL, NULL, 405, '2024-03-11 00:00:00', '2024-03-12 00:00:00', 1, 14, 832.631, 'USD', NULL, NULL, 64.638, 47210.1777, 6609.424878, 53819.602578, '1000269262750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-11723084'),
	(263, '2024-03-12;2024-03-12T11:19:21;FR ATO2024/94;327018.16;QCSaaxdegMFoiqUwdejfzUkD7imFRglpXoxy++K9UkVChkR2yCMDk1ysPJj7TpqOg/nGMDXweLxdfBGb7lig2vXiDOuHf2jKkSDzePtJZoqJV8F6rIFmv/bOp1JjZdzl6/T/9GCREdjaE/+iSpCyEYTxfuk/dJfrk+/RQ+/69zw=', 1, 269, 'TAAG - LINHAS AEREAS DE ANGOLA', 'TAAG', NULL, '5410002830', NULL, NULL, 1, 94, 'FR ATO2024/94', 'FP ATO2024/27', 'RltgOWOSG9/GXmQ9ulhMVv/SccKtBMDuLLqS1KGC80Z6uegGkT2GXZ9MLP5QppBUBHv3SGV21D+QN9l4YoQHgAHw7zoT8zCDIvFbAX9byrMCnEaUHhZNqVxjLsBWiUPiwBfowh7d0n5E5xdWiYUSDXYLcuy4Q0DlbyFIVrxcWnw=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-12 11:19:21', '2024-03-12 11:19:21', NULL, '118-11723073', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1566, '2024-03-11 00:00:00', '2024-03-12 00:00:00', 1, 14, 832.631, 'USD', NULL, NULL, 392.7528, 286858.03212, 40160.1244968, 327018.1566168, '1000269263750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB 118-11723073'),
	(264, '2024-03-12;2024-03-12T12:52:15;PP ATO2024/31;2255867.15;C6myzhg5vpgjn936h1agaE0DdJw/8ZcdAtZIb2u/ZvNE7Ys0r1YVYCDqxUph61Vteesz58yVslInIuUfU9xEkXFREsp4UvI/tJwmv11Zc86mPkuQstmQpHonAW217RQfIGK6QOfHulvMjAK5jTPCXh7tB47v5ktbCXIm2giGCBQ=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 3, 31, 'FP ATO2024/31', NULL, 'PsbzM7+CrfPgzCg6XK4qd27CcydFJztY0zL9lK9RIhxMCat+NCeKtxrVJq2M5FGueMj4DfyTCl2tIX3aSCYWfK49LR2g2XW+FwLvtxRik90hue9cgcdQjp849gP0LHun8JSTvs/P/86fSed4grYvJiknur7tUBXhtgDC3xL76Qo=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-12 12:52:15', '2024-03-12 12:52:15', NULL, '118-12401093', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13980, '2024-03-10 00:00:00', '2024-03-12 00:00:00', 2, 14, 832.631, 'USD', 'AOA', NULL, 2709.324, 1978830.8346, 277036.316844, 2255867.151444, '10003264751', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 118-1240 1093'),
	(265, '2024-03-12;2024-03-12T14:30:35;FR ATO2024/95;2255867.15;RltgOWOSG9/GXmQ9ulhMVv/SccKtBMDuLLqS1KGC80Z6uegGkT2GXZ9MLP5QppBUBHv3SGV21D+QN9l4YoQHgAHw7zoT8zCDIvFbAX9byrMCnEaUHhZNqVxjLsBWiUPiwBfowh7d0n5E5xdWiYUSDXYLcuy4Q0DlbyFIVrxcWnw=', 1, 3, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', 'NTF', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', 1, 95, 'FR ATO2024/95', 'FP ATO2024/31', 'TrufWIqAnAVNNAoACA5zBKz/JUgkeXoZNfBqj79zedqZ5dGSyPJDhad7SxEAWzsUj1uuAsQWNiAZKIZc3rEVkAs4+DzGFaWaqZWl6LmYe04zLNgXtzgdzDWs/mKJ3LPkT7kye2XzC1VMu5LvbRY+0PZ2gmVlkFTF2uTCWMDeXaw=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-12 14:30:35', '2024-03-12 14:30:35', NULL, '118-12401093', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13980, '2024-03-10 00:00:00', '2024-03-12 00:00:00', 2, 14, 832.631, 'USD', NULL, NULL, 2709.324, 1978830.8346, 277036.316844, 2255867.151444, '10003265750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 118-1240 1093'),
	(266, '2024-03-12;2024-03-12T15:50:15;PP ATO2024/32;100804.97;PsbzM7+CrfPgzCg6XK4qd27CcydFJztY0zL9lK9RIhxMCat+NCeKtxrVJq2M5FGueMj4DfyTCl2tIX3aSCYWfK49LR2g2XW+FwLvtxRik90hue9cgcdQjp849gP0LHun8JSTvs/P/86fSed4grYvJiknur7tUBXhtgDC3xL76Qo=', 1, 286, 'YAPAMA SAÚDE, LDA', 'YAPAMA SAUDE LDA', '+244932102227', '5417163783', NULL, 'Belas Business Park, Edifício Cabinda Nº304', 3, 32, 'FP ATO2024/32', NULL, 'a7P4tK9mWf3ydbQbugl65M2PSwvEkpc1MXXgvTU9R/mnUsDRi3fHKD87ZecGemk9ovexbevpKz1AgK7qomSniQSAc0xIuPUROGo/oq1fR5wbdscIfWqHIWa5otLhPIoSr2f16YiQ/7OmsDm+sWwT6V4xD0S5gPixzZ9CWnod9/o=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-12 15:50:15', '2024-03-12 15:50:15', NULL, '118-12352830', NULL, 0, NULL, NULL, NULL, NULL, NULL, 531, '2024-03-10 00:00:00', '2024-03-13 00:00:00', 3, 14, 832.631, 'USD', 'AOA', NULL, 121.068, 88425.4122, 12379.557708, 100804.969908, '1000286266750', 3, NULL, 1, 'N', 'Y', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-12352830'),
	(267, '2024-03-12;2024-03-12T16:10:41;FR ATO2024/96;1183923.05;TrufWIqAnAVNNAoACA5zBKz/JUgkeXoZNfBqj79zedqZ5dGSyPJDhad7SxEAWzsUj1uuAsQWNiAZKIZc3rEVkAs4+DzGFaWaqZWl6LmYe04zLNgXtzgdzDWs/mKJ3LPkT7kye2XzC1VMu5LvbRY+0PZ2gmVlkFTF2uTCWMDeXaw=', 1, 270, 'TLC LDA', 'SEADRIL ANGOLA LDA', '+244 926 515 109', ' 5401146655', 'dsousa.an@tlc-com.ch', 'Avenida 4 de Fevereiro nº33 Luanda, Angola', 1, 96, 'FR ATO2024/96', 'FP ATO2024/30', 'PvV60bfDHvsxTlY4KkFZ8ONupAkTGKQrzyEK4nD5Da+W61/yunDFj9/h5hdUvAYp9N7jMJ/etKaA+BEj+BUMjDpefkuU4ne7OMe/1It65WoWttiOlBizjBXlKe1lbf56p00/RYNHTu4S+pbhst4M1TSlGnDAHKvX8hYuQ14cVhI=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-12 16:10:41', '2024-03-12 16:10:41', NULL, '574-34001634', NULL, 0, NULL, NULL, NULL, NULL, NULL, 884.6, '2024-02-24 00:00:00', '2024-03-13 00:00:00', 18, 14, 832.631, 'USD', NULL, NULL, 1421.90604, 1038528.989466, 145394.05852524, 1183923.0479912, '1000270267750', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 574-34001634'),
	(268, '2024-03-12;2024-03-12T17:09:15;PP ATO2024/33;248918.03;a7P4tK9mWf3ydbQbugl65M2PSwvEkpc1MXXgvTU9R/mnUsDRi3fHKD87ZecGemk9ovexbevpKz1AgK7qomSniQSAc0xIuPUROGo/oq1fR5wbdscIfWqHIWa5otLhPIoSr2f16YiQ/7OmsDm+sWwT6V4xD0S5gPixzZ9CWnod9/o=', 1, 284, 'NOCEBO SA', 'NOCEBO SA', '937 393 718', '5410777832', 'angelino@castel-afrique.com', 'RUA CONEGO MANUEL DAS NEVES NR 403', 3, 33, 'FP ATO2024/33', NULL, 'I9JK9elykzEwW22a4nK3d1M418uI7EKqp0SCmj2wnG1+mxmguCmMkQglRXd8aIl/OhslKhyMOVmVNFGNLwL4wWNCiPe2X0MKzgcDCp7J3Hu31y/Yis6a24Y1th0VzNDP+OBJGmn7aunt4jdJACCfiSEx9dvL4MN7g+Z3pkNFa4Y=', NULL, 1, 1, 751, 'Milton Lucas', '2024-03-12 17:09:15', '2024-03-12 17:09:15', NULL, '118-11723390', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1192, '2024-03-13 00:00:00', '2024-03-14 00:00:00', 1, 14, 832.631, 'USD', 'AOA', NULL, 298.9536, 218349.15344, 30568.8814816, 248918.0349216, '1000284268751', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº118-11723390'),
	(269, '2024-03-13;2024-03-13T10:08:04;FR ATO2024/97;100804.97;PvV60bfDHvsxTlY4KkFZ8ONupAkTGKQrzyEK4nD5Da+W61/yunDFj9/h5hdUvAYp9N7jMJ/etKaA+BEj+BUMjDpefkuU4ne7OMe/1It65WoWttiOlBizjBXlKe1lbf56p00/RYNHTu4S+pbhst4M1TSlGnDAHKvX8hYuQ14cVhI=', 1, 286, 'YAPAMA SAÚDE, LDA', 'YAPAMA SAUDE LDA', '+244932102227', '5417163783', NULL, 'Belas Business Park, Edifício Cabinda Nº304', 1, 97, 'FR ATO2024/97', 'FP ATO2024/32', 'OjbNrBbW/T2DdoZHr8WGOlkGnplhUFw8DLoHZbMtERqQzxh6dlxc5aFMbgP5AuFOYEsSO4SMrP+6FYcRhlUsqcdnF+f1aoxz7wFZ0GBcXZkB4V3VKsMwF0mSNhYBcolUEqm4DcGBT8dNDwTI+fvz7iIljNizUyld5mLS3KhAv88=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-13 10:08:04', '2024-03-13 10:08:04', NULL, '118-12352830', NULL, 0, NULL, NULL, NULL, NULL, NULL, 531, '2024-03-10 00:00:00', '2024-03-13 00:00:00', 3, 14, 832.631, 'USD', NULL, NULL, 121.068, 88425.4122, 12379.557708, 100804.969908, '1000286269751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB 118-12352830'),
	(270, '2024-03-13;2024-03-13T10:28:42;FR ATO2024/98;1516137.12;OjbNrBbW/T2DdoZHr8WGOlkGnplhUFw8DLoHZbMtERqQzxh6dlxc5aFMbgP5AuFOYEsSO4SMrP+6FYcRhlUsqcdnF+f1aoxz7wFZ0GBcXZkB4V3VKsMwF0mSNhYBcolUEqm4DcGBT8dNDwTI+fvz7iIljNizUyld5mLS3KhAv88=', 1, 284, 'NOCEBO SA', 'NOCEBO SA', '937 393 718', '5410777832', 'angelino@castel-afrique.com', 'RUA CONEGO MANUEL DAS NEVES NR 403', 1, 98, 'FR ATO2024/98', 'FP ATO2024/24', 'T2NI20vL76lu6Bxt7fxYFEJIYrJYd96fTN1biMHCcdyOV97xmGFsaDrOpKIW8XZeKU/Ez6kkT4tg5da/JQM1RZXRk7npjFI5ejBhI5Qy+6pKqE+x2+6eSc+ihpRZFQ2z8oaPC51qmCsagxgD36SGbdiwBzAUiDqpOVEoO+62pOs=', NULL, 1, 1, 750, 'Carlos Sampaio', '2024-03-13 10:28:42', '2024-03-13 10:28:42', NULL, '118-11723390', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1192, '2024-02-24 00:00:00', '2024-03-12 00:00:00', 17, 14, 832.631, 'USD', NULL, NULL, 1820.8992, 1329944.84368, 186192.2781152, 1516137.1217952, '1000284270751', 1, 4, 1, 'N', 'N', 'N', 0, 0, 1, 3, 'REFERENTE A AWB Nº 118-11723390'),
	(271, '2024-03-15;2024-03-15T09:49:30;PP ATO2024/34;190505.97;I9JK9elykzEwW22a4nK3d1M418uI7EKqp0SCmj2wnG1+mxmguCmMkQglRXd8aIl/OhslKhyMOVmVNFGNLwL4wWNCiPe2X0MKzgcDCp7J3Hu31y/Yis6a24Y1th0VzNDP+OBJGmn7aunt4jdJACCfiSEx9dvL4MN7g+Z3pkNFa4Y=', 1, 273, 'AZULE ENERGY ANGOLA(BLOCK 18), B.V. - SUCURSAL DE ANGOLA', 'AZULE ENERGY ANGOLA', NULL, '5410003667', NULL, 'AV 4 DE FEVEREIRO TORRES ATLANTICO N 197', 3, 34, 'FP ATO2024/34', NULL, 'lGkmRdaw3voLVtAUcaijAGy1Mt15VtNUofHwJdC6zitVNoGPpv6TLfmllvoOJdeDeGTITv/JgLhehpUQwBgZgxXg5LrAY6bvXvVGevk6bXK5K3+Yr2tPctFerjPCombQx5vOM5zwvOvNp5LZ/fszFlk+fRxDE2hIOOSRo10UchQ=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-15 09:49:30', '2024-03-15 09:49:30', NULL, '118-11509433', NULL, 0, NULL, NULL, NULL, NULL, NULL, 880, '2024-03-10 00:00:00', '2024-03-15 00:00:00', 5, 0, 832.631, 'USD', 'AOA', NULL, 228.8, 190505.9728, 0, 190505.9728, '10002732711', 3, NULL, 1, 'Y', 'N', 'N', 0, 0, 1, 1, 'REFERENTE A AWB Nº 118-11509433');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.facturas_original
CREATE TABLE IF NOT EXISTS `facturas_original` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total_preco_factura` double NOT NULL,
  `valor_a_pagar` double DEFAULT NULL,
  `valor_entregue` double DEFAULT NULL,
  `troco` double DEFAULT NULL,
  `valor_extenso` varchar(345) DEFAULT NULL,
  `codigo_moeda` int(10) unsigned DEFAULT NULL,
  `desconto` double DEFAULT NULL,
  `total_iva` double DEFAULT NULL,
  `total_incidencia` double DEFAULT NULL,
  `tipo_user_id` int(10) unsigned DEFAULT NULL,
  `multa` double DEFAULT NULL,
  `statusFactura` enum('1','2') DEFAULT '1' COMMENT '1=>divida;2=>pago',
  `anulado` int(11) DEFAULT '1' COMMENT '1=>nao anulado. 2=>anulado',
  `nome_do_cliente` varchar(145) DEFAULT NULL,
  `telefone_cliente` varchar(145) DEFAULT NULL,
  `nif_cliente` varchar(145) DEFAULT NULL,
  `email_cliente` varchar(145) DEFAULT NULL,
  `endereco_cliente` varchar(145) DEFAULT NULL,
  `conta_corrente_cliente` varchar(45) DEFAULT NULL,
  `numeroItems` int(10) unsigned NOT NULL,
  `tipo_documento` int(10) unsigned NOT NULL,
  `tipoFolha` enum('A4','A5','TICKET') DEFAULT NULL,
  `retencao` double DEFAULT NULL,
  `nextFactura` varchar(45) DEFAULT NULL,
  `faturaReference` varchar(45) DEFAULT NULL,
  `numSequenciaFactura` int(10) unsigned DEFAULT '0',
  `numeracaoFactura` varchar(255) DEFAULT NULL,
  `observacaoFacturaAluno` text NOT NULL,
  `hashValor` text,
  `retificado` enum('Sim','Não') DEFAULT 'Não',
  `formas_pagamento_id` int(10) unsigned DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `numeracaoProforma` varchar(255) NOT NULL,
  `convertidoFactura` enum('1','2') NOT NULL COMMENT '1- se for proforma status não convertido, 2- se proforma status convertido',
  `observacao` text,
  `armazen_id` int(10) unsigned DEFAULT NULL,
  `cliente_id` int(10) unsigned DEFAULT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_vencimento` date DEFAULT NULL,
  `operador` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_facturas_canal` (`canal_id`),
  KEY `FK_facturas_empresa` (`empresa_id`),
  KEY `FK_facturas_status` (`status_id`),
  KEY `FK_facturas_user` (`user_id`),
  KEY `FK_facturas_clientes` (`cliente_id`),
  KEY `FK_facturas_formas_pagamentos` (`formas_pagamento_id`),
  KEY `FK_facturas_armazens` (`armazen_id`),
  KEY `FK_facturas_moedas` (`codigo_moeda`),
  KEY `FK_facturas_tipo_documentos` (`tipo_documento`),
  KEY `tipoUsers` (`tipo_user_id`),
  CONSTRAINT `facturas_original_ibfk_1` FOREIGN KEY (`armazen_id`) REFERENCES `armazens` (`id`),
  CONSTRAINT `facturas_original_ibfk_2` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `facturas_original_ibfk_3` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `facturas_original_ibfk_4` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `facturas_original_ibfk_5` FOREIGN KEY (`formas_pagamento_id`) REFERENCES `formas_pagamentos_geral` (`id`),
  CONSTRAINT `facturas_original_ibfk_6` FOREIGN KEY (`codigo_moeda`) REFERENCES `moedas` (`id`),
  CONSTRAINT `facturas_original_ibfk_7` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `facturas_original_ibfk_9` FOREIGN KEY (`tipo_user_id`) REFERENCES `tipo_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.facturas_original: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.factura_items
CREATE TABLE IF NOT EXISTS `factura_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produtoId` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT '1',
  `nomeProduto` varchar(255) NOT NULL,
  `taxa` double DEFAULT '0',
  `taxaLuminosa` double DEFAULT '0',
  `taxaAduaneiro` double DEFAULT '0',
  `taxaEstacionamento` double DEFAULT '0',
  `taxaIva` double DEFAULT '0',
  `valorIva` double DEFAULT '0',
  `nDias` int(11) DEFAULT '1',
  `peso` double DEFAULT NULL,
  `horaExtra` double DEFAULT NULL,
  `taxaAbertoAeroporto` double DEFAULT NULL,
  `horaFechoAeroporto` double DEFAULT NULL,
  `horaEstacionamento` double DEFAULT NULL,
  `sujeitoDespachoId` int(11) DEFAULT NULL,
  `tipoMercadoriaId` int(11) DEFAULT '1',
  `especificacaoMercadoriaId` int(11) DEFAULT '1',
  `horaAberturaAeroporto` int(11) DEFAULT '1',
  `desconto` double DEFAULT '0',
  `valorImposto` char(2) DEFAULT NULL,
  `total` double DEFAULT '0',
  `totalIva` double DEFAULT '0',
  `factura_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_factura_items_factura` (`factura_id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.factura_items: ~483 rows (aproximadamente)
INSERT INTO `factura_items` (`id`, `produtoId`, `quantidade`, `nomeProduto`, `taxa`, `taxaLuminosa`, `taxaAduaneiro`, `taxaEstacionamento`, `taxaIva`, `valorIva`, `nDias`, `peso`, `horaExtra`, `taxaAbertoAeroporto`, `horaFechoAeroporto`, `horaEstacionamento`, `sujeitoDespachoId`, `tipoMercadoriaId`, `especificacaoMercadoriaId`, `horaAberturaAeroporto`, `desconto`, `valorImposto`, `total`, `totalIva`, `factura_id`) VALUES
	(119, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 23206.372, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 165759.8, 188966.172, 93),
	(120, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 8702.3895, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 62159.925, 70862.3145, 93),
	(121, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 8702.3895, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 62159.925, 70862.3145, 93),
	(122, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 23206.372, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 165759.8, 188966.172, 94),
	(123, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 8702.3895, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 62159.925, 70862.3145, 94),
	(124, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 8702.3895, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 62159.925, 70862.3145, 94),
	(125, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 23206.372, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 165759.8, 188966.172, 95),
	(126, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 8702.3895, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 62159.925, 70862.3145, 95),
	(127, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 8702.3895, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 62159.925, 70862.3145, 95),
	(128, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 37130.1952, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 265215.68, 302345.8752, 96),
	(129, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 13923.8232, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 99455.88, 113379.7032, 96),
	(130, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 13923.8232, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 99455.88, 113379.7032, 96),
	(131, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 65033.5368928, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 464525.26352, 529558.8004128, 97),
	(132, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 24387.5763348, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 174196.97382, 198584.5501548, 97),
	(133, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 24387.5763348, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 174196.97382, 198584.5501548, 97),
	(134, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 14, 227378.98989374, 1, 1326, 1, 546.94, 19, 89, NULL, 1, 1, 7, 0, 'T', 1624135.6420981, 1851514.6319919, 98),
	(135, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 51341.790111976, 1, 1326, 1, 546.94, 19, 89, NULL, 1, 1, 7, 0, 'T', 366727.0722284, 418068.86234038, 98),
	(136, 6, 1, 'Luminosa 1x', 0.25, 197.88, 0, 0, 14, 22960.390135956, 1, 1326, 1, 546.94, 19, 89, NULL, 1, 1, 7, 0, 'T', 164002.7866854, 186963.17682136, 98),
	(137, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 12308.662753296, 1, 1326, 1, 546.94, 19, 89, 1, 1, 1, 7, 0, 'T', 87919.0196664, 100227.6824197, 98),
	(138, 11, 1, 'Reabertura Comercial', 0.25, 197.88, 0, 0, 14, 84616.254834475, 1, 1326, 1, 546.94, 19, 89, NULL, 1, 1, 7, 0, 'T', 604401.82024625, 689018.07508073, 98),
	(139, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 18565.0976, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 132607.84, 151172.9376, 99),
	(140, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 6961.9116, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 49727.94, 56689.8516, 99),
	(141, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 6961.9116, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 49727.94, 56689.8516, 99),
	(142, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 37130.1952, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 265215.68, 302345.8752, 100),
	(143, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 13923.8232, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 99455.88, 113379.7032, 100),
	(144, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 13923.8232, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 99455.88, 113379.7032, 100),
	(145, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 16708.58784, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 119347.056, 136055.64384, 101),
	(146, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 6265.72044, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 44755.146, 51020.86644, 101),
	(147, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 6265.72044, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 44755.146, 51020.86644, 101),
	(148, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 18565.0976, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 132607.84, 151172.9376, 102),
	(149, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 6961.9116, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 49727.94, 56689.8516, 102),
	(150, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 6961.9116, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 49727.94, 56689.8516, 102),
	(151, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 7528.1470768, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 53772.47912, 61300.6261968, 103),
	(152, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 2823.0551538, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 20164.67967, 22987.7348238, 103),
	(153, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 2823.0551538, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 20164.67967, 22987.7348238, 103),
	(154, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 14, 52199.88214385, 1, 15503, 0, 546.94, 19, 23, NULL, 1, 1, 7, 0, 'T', 372856.3010275, 425056.18317135, 104),
	(155, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 51341.825731616, 1, 15503, 0, 546.94, 19, 23, NULL, 1, 1, 7, 0, 'T', 366727.3266544, 418069.15238602, 104),
	(156, 6, 1, 'Luminosa 1x', 0.25, 197.88, 0, 0, 14, 22960.406065296, 1, 15503, 0, 546.94, 19, 23, NULL, 1, 1, 7, 0, 'T', 164002.9004664, 186963.3065317, 104),
	(157, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 143907.48948061, 1, 15503, 0, 546.94, 19, 23, 1, 1, 1, 7, 0, 'T', 1027910.6391472, 1171818.1286278, 104),
	(158, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 21, NULL, 1, 1, 7, 0, 'T', 2179844.2202894, 2179844.2202894, 105),
	(159, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 21, NULL, 1, 1, 7, 0, 'T', 2625717.2089915, 2625717.2089915, 105),
	(160, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 5740, 0, 546.94, 19, 21, 1, 1, 1, 7, 0, 'T', 380584.0416, 380584.0416, 106),
	(161, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 5096.1192912, 13, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 36400.85208, 41496.9713712, 107),
	(162, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 57968.3569374, 13, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 414059.69241, 472028.0493474, 107),
	(163, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 4459.1043798, 13, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 31850.74557, 36309.8499498, 107),
	(164, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 334.1636928, 39, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 2386.88352, 2721.0472128, 108),
	(165, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 11403.3360168, 39, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 81452.40012, 92855.7361368, 108),
	(166, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 292.3932312, 39, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 2088.52308, 2380.9163112, 108),
	(167, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 5096.1192912, 13, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 36400.85208, 41496.9713712, 109),
	(168, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 57968.3569374, 13, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 414059.69241, 472028.0493474, 109),
	(169, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 4459.1043798, 13, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 31850.74557, 36309.8499498, 109),
	(170, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 36341.178552, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 259579.8468, 295921.025352, 110),
	(171, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 81767.651742, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 584054.6553, 665822.307042, 110),
	(172, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 13627.941957, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 97342.44255, 110970.384507, 110),
	(173, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 46876.87144, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 334834.796, 381711.66744, 111),
	(174, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 105472.96074, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 753378.291, 858851.25174, 111),
	(175, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 17578.82679, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 125563.0485, 143141.87529, 111),
	(176, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 43154.5693712, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 308246.92408, 351401.4934512, 112),
	(177, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 97097.7810852, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 693555.57918, 790653.3602652, 112),
	(178, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 16182.9635142, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 115592.59653, 131775.5600442, 112),
	(179, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 67407.4674168, 1, 9955, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 481481.91012, 548889.3775368, 113),
	(180, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 92407.661808, 1, 9955, 0, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 660054.7272, 752462.389008, 113),
	(181, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 14, 9732.200556925, 1, 8611, 0, 546.94, 19, 7, NULL, 1, 1, 7, 0, 'T', 69515.71826375, 79247.918820675, 114),
	(182, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 51341.926705552, 1, 8611, 0, 546.94, 19, 7, NULL, 1, 1, 7, 0, 'T', 366728.0478968, 418069.97460235, 114),
	(183, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 79932.260144912, 1, 8611, 0, 546.94, 19, 7, 1, 1, 1, 7, 0, 'T', 570944.7153208, 650876.97546571, 114),
	(184, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 1, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 2625523.3212715, 2625523.3212715, 115),
	(185, 9, 1, 'Luminosa 2x', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 1, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 327981.1589364, 327981.1589364, 115),
	(186, 8, 1, 'Abertura do Aeroporto - Prolongamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 1, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 453269.6964541, 453269.6964541, 115),
	(187, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 11510, 0, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 763157.1984, 763157.1984, 116),
	(188, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 62164.6592, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 444033.28, 506197.9392, 117),
	(189, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 233117.472, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1665124.8, 1898242.272, 117),
	(190, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 23311.7472, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 166512.48, 189824.2272, 117),
	(191, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 66443.1124448, 1, 3308, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 474593.66032, 541036.7727648, 118),
	(192, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 30703.8927104, 1, 3308, 0, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 219313.51936, 250017.4120704, 118),
	(193, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 66443.1124448, 1, 15245, 1, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 474593.66032, 541036.7727648, 119),
	(194, 9, 1, 'Luminosa 2x', 0.25, 197.88, 0, 0, 14, 45916.6134336, 1, 15245, 1, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 327975.81024, 373892.4236736, 119),
	(195, 8, 1, 'Abertura do Aeroporto - Prolongamento', 0.25, 197.88, 0, 0, 14, 63456.7226384, 1, 15245, 1, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 453262.30456, 516719.0271984, 119),
	(196, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 141499.650656, 1, 15245, 1, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 1010711.7904, 1152211.441056, 119),
	(197, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 12718.72556864, 4, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 90848.039776, 103566.76534464, 120),
	(198, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 44515.53949024, 4, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 317968.139216, 362483.67870624, 120),
	(199, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 11128.88487256, 4, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 79492.034804, 90620.91967656, 120),
	(200, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 7000, 0, 546.94, 19, 4, 1, 1, 1, 7, 0, 'T', 464085.44, 464085.44, 121),
	(201, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 4, NULL, 1, 1, 7, 0, 'T', 163672.99, 163672.99, 122),
	(202, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 4, NULL, 1, 1, 7, 0, 'T', 2612055.1756, 2612055.1756, 122),
	(203, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 64971.9616, 4, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 464085.44, 529057.4016, 123),
	(204, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 227401.8656, 4, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1624299.04, 1851700.9056, 123),
	(205, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 56850.4664, 4, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 406074.76, 462925.2264, 123),
	(206, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 14, 177164.61672, 1, 1370, 0, 546.94, 19, 173, NULL, 1, 1, 7, 0, 'T', 1265461.548, 1442626.16472, 124),
	(207, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 19117.9997008, 1, 1370, 0, 546.94, 19, 173, NULL, 1, 1, 7, 0, 'T', 136557.14072, 155675.1404208, 124),
	(208, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 12715.941056, 1, 1370, 0, 546.94, 19, 173, 1, 1, 1, 7, 0, 'T', 90828.1504, 103544.091456, 124),
	(209, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 1020.987968, 15, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 7292.7712, 8313.759168, 125),
	(210, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 5743.05732, 15, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 41021.838, 46764.89532, 125),
	(211, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 382.870488, 15, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 2734.7892, 3117.659688, 125),
	(212, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 105811.48032, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 755796.288, 861607.76832, 126),
	(213, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 634868.88192, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 4534777.728, 5169646.60992, 126),
	(214, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 39679.30512, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 283423.608, 323102.91312, 126),
	(215, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 82256.018, 82256.018, 127),
	(216, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 2625645.2456, 2625645.2456, 127),
	(217, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 16021, 0, 546.94, 19, 3, 1, 1, 1, 7, 0, 'T', 1062225.62368, 1062225.62368, 128),
	(218, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 2311.2905088, 7, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 16509.21792, 18820.5084288, 129),
	(219, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 6067.1375856, 7, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 43336.69704, 49403.8346256, 129),
	(220, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 866.7339408, 7, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 6190.95672, 7057.6906608, 129),
	(221, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 30993.5703168, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 221382.64512, 252376.2154368, 130),
	(222, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 11622.5888688, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 83018.49192, 94641.0807888, 130),
	(223, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 11622.5888688, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 83018.49192, 94641.0807888, 130),
	(224, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 1021.052032, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 7293.2288, 8314.280832, 131),
	(225, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 1914.47256, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 13674.804, 15589.27656, 131),
	(226, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 382.894512, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 2734.9608, 3117.855312, 131),
	(227, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 105818.11968, 4, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 755843.712, 861661.83168, 132),
	(228, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 158727.17952, 4, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1133765.568, 1292492.74752, 132),
	(229, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 39681.79488, 4, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 283441.392, 323123.18688, 132),
	(230, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 82256.018, 82256.018, 133),
	(231, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 2625645.2456, 2625645.2456, 133),
	(232, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 5222, 0, 546.94, 19, 3, 1, 1, 1, 7, 0, 'T', 346229.46176, 346229.46176, 134),
	(233, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 512521.708608, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 3660869.3472, 4173391.055808, 135),
	(234, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 192195.640728, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1372826.0052, 1565021.645928, 135),
	(235, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 192195.640728, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1372826.0052, 1565021.645928, 135),
	(236, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 5, NULL, 1, 1, 7, 0, 'T', 246768.054, 246768.054, 136),
	(237, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 5, NULL, 1, 1, 7, 0, 'T', 2625645.2456, 2625645.2456, 136),
	(238, 6, 1, 'Luminosa 1x', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 5, NULL, 1, 1, 7, 0, 'T', 163998.19488, 163998.19488, 136),
	(239, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 29330, 0, 546.94, 19, 5, 1, 1, 1, 7, 0, 'T', 1944640.0064, 1944640.0064, 137),
	(240, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 31467.840432, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 224770.2888, 256238.129232, 138),
	(241, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 11800.440162, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 84288.8583, 96089.298462, 138),
	(242, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 11800.440162, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 84288.8583, 96089.298462, 138),
	(243, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 7611.690016, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 54369.2144, 61980.904416, 139),
	(244, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 2854.383756, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 20388.4554, 23242.839156, 139),
	(245, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 2854.383756, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 20388.4554, 23242.839156, 139),
	(246, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 2506.288176, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 17902.0584, 20408.346576, 140),
	(247, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 939.858066, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 6713.2719, 7653.129966, 140),
	(248, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 939.858066, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 6713.2719, 7653.129966, 140),
	(252, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, 54193.5, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 82256.018, 82256.018, 142),
	(253, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, 54193.5, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 2625645.2456, 2625645.2456, 142),
	(254, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 14, 42466.48224, 1, 1095.5, 0, 546.94, 19, 44, NULL, 1, 1, 7, 0, 'T', 303332.016, 345798.49824, 143),
	(255, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 19119.1992992, 1, 1095.5, 0, 546.94, 19, 44, NULL, 1, 1, 7, 0, 'T', 136565.70928, 155684.9085792, 143),
	(256, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 10168.7500096, 1, 1095.5, 0, 546.94, 19, 44, 1, 1, 1, 7, 0, 'T', 72633.92864, 82802.6786496, 143),
	(257, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 54193.5, 0, 546.94, 19, 3, 1, 1, 1, 7, 0, 'T', 3593245.815329, 3593245.815329, 144),
	(258, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 55693.7472, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 397812.48, 453506.2272, 145),
	(259, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 250621.8624, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1790156.16, 2040778.0224, 145),
	(260, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 20885.1552, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 149179.68, 170064.8352, 145),
	(261, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 51.0526016, 6, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 364.66144, 415.7140416, 146),
	(262, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 268.0261584, 6, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1914.47256, 2182.4987184, 146),
	(263, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 44.6710264, 6, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 319.07876, 363.7497864, 146),
	(264, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 48472.1246464, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 346229.46176, 394701.5864064, 147),
	(265, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 199947.5141664, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1428196.52976, 1628144.0439264, 147),
	(266, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 18177.0467424, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 129836.04816, 148013.0949024, 147),
	(267, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14414.4937664, 14, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 102960.66976, 117375.1635264, 148),
	(268, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 75676.0922736, 14, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 540543.51624, 616219.6085136, 148),
	(269, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 5405.4351624, 14, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 38610.25116, 44015.6863224, 148),
	(270, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 272249.600896, 8, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1944640.0064, 2216889.607296, 149),
	(271, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 816748.802688, 8, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 5833920.0192, 6650668.821888, 149),
	(272, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 102093.600336, 8, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 729240.0024, 831333.602736, 149),
	(273, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 14, 20682.10508, 1, 3390, 0, 546.94, 19, 24, NULL, 1, 1, 7, 0, 'T', 147729.322, 168411.42708, 141),
	(274, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 18351.0897024, 1, 3390, 0, 546.94, 19, 24, NULL, 1, 1, 7, 0, 'T', 131079.21216, 149430.3018624, 141),
	(275, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 31466.967168, 1, 3390, 0, 546.94, 19, 24, 1, 1, 1, 7, 0, 'T', 224764.0512, 256231.018368, 141),
	(276, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 20764, 0, 546.94, 19, 59, 1, 1, 1, 7, 0, 'T', 1376696.38912, 1376696.38912, 151),
	(277, 1, 1, 'Carga', 0.07, 0, 0, 0, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 1, 0, 'T', 3500584.0688, 3500584.0688, 152),
	(278, 2, 1, 'Armazenagem', 0.05, 0, 0, 0, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, 1, 4, 1, 1, 0, 'T', 5000834.384, 5000834.384, 152),
	(279, 3, 1, 'Manuseamento', 0.08, 0, 0, 0, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 4000667.5072, 4000667.5072, 152),
	(280, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 288029.495936, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 2057353.5424, 2345383.038336, 153),
	(281, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 324033.182928, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 2314522.7352, 2638555.918128, 153),
	(282, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 108011.060976, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 771507.5784, 879518.639376, 153),
	(283, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 2042.104064, 29, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 14586.4576, 16628.561664, 154),
	(284, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 22207.881696, 29, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 158627.7264, 180835.608096, 154),
	(285, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 765.789024, 29, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 5469.9216, 6235.710624, 154),
	(286, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 82256.018, 82256.018, 155),
	(287, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 2625645.2456, 2625645.2456, 155),
	(289, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 31030, 0, 546.94, 19, 3, 1, 1, 1, 7, 0, 'T', 2057353.5424, 2057353.5424, 157),
	(290, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 14, 2233.55132, 1, 22620, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 15953.938, 18187.48932, 158),
	(291, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 65488.8849888, 1, 22620, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 467777.74992, 533266.6349088, 158),
	(292, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 209965.426944, 1, 22620, 0, 546.94, 19, 3, 1, 1, 1, 7, 0, 'T', 1499753.0496, 1709718.476544, 158),
	(293, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14666.020096, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 104757.2864, 119423.306496, 159),
	(294, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 87996.120576, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 628543.7184, 716539.838976, 159),
	(295, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 5499.757536, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 39283.9824, 44783.739936, 159),
	(296, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 67407.5487484, 1, 22350, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 481482.49106, 548890.0398084, 160),
	(297, 9, 1, 'Luminosa 2x', 0.25, 197.88, 0, 0, 14, 45920.7689136, 1, 22350, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 328005.49224, 373926.2611536, 160),
	(298, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 207464.96568, 1, 22350, 0, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 1481892.612, 1689357.57768, 160),
	(299, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 67407.5487484, 1, 22350, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 481482.49106, 548890.0398084, 161),
	(300, 9, 1, 'Luminosa 2x', 0.25, 197.88, 0, 0, 14, 45920.7689136, 1, 22350, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 328005.49224, 373926.2611536, 161),
	(301, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 207464.96568, 1, 22350, 0, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 1481892.612, 1689357.57768, 161),
	(302, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1591.29408, 1591.29408, 162),
	(303, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 6564.08808, 6564.08808, 162),
	(304, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 596.73528, 596.73528, 162),
	(305, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 421029.892, 421029.892, 163),
	(306, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1736748.3045, 1736748.3045, 163),
	(307, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 157886.2095, 157886.2095, 163),
	(308, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 232925.67096, 232925.67096, 164),
	(309, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 960818.39271, 960818.39271, 164),
	(310, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 87347.12661, 87347.12661, 164),
	(311, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 9415.15664, 9415.15664, 165),
	(312, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 38837.52114, 38837.52114, 165),
	(313, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 3530.68374, 3530.68374, 165),
	(314, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 68956.0768, 68956.0768, 166),
	(315, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 284443.8168, 284443.8168, 166),
	(316, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 25858.5288, 25858.5288, 166),
	(317, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 99548.9397504, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 711063.85536, 810612.7951104, 167),
	(318, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 223985.1144384, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1599893.67456, 1823878.7889984, 167),
	(319, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 37330.8524064, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 266648.94576, 303979.7981664, 167),
	(320, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 24930.27392, 24930.27392, 168),
	(321, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 102837.37992, 102837.37992, 168),
	(322, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 9348.85272, 9348.85272, 168),
	(323, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1259.77448, 1259.77448, 169),
	(324, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 5196.56973, 5196.56973, 169),
	(325, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 472.41543, 472.41543, 169),
	(326, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1856.50976, 1856.50976, 170),
	(327, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 7658.10276, 7658.10276, 170),
	(328, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 696.19116, 696.19116, 170),
	(329, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14666.427104, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 104760.1936, 119426.620704, 171),
	(330, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 16499.730492, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 117855.2178, 134354.948292, 171),
	(331, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 5499.910164, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 39285.0726, 44784.982764, 171),
	(332, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 165043.717664, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1178883.6976, 1343927.415264, 172),
	(333, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 371348.364744, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 2652488.3196, 3023836.684344, 172),
	(334, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 61891.394124, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 442081.3866, 503972.780724, 172),
	(335, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 928.25488, 3, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 6630.392, 7558.64688, 173),
	(336, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 2436.66906, 3, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 17404.779, 19841.44806, 173),
	(337, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 812.22302, 3, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 5801.593, 6613.81602, 173),
	(338, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 67407.5487484, 1, 14573, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 481482.49106, 548890.0398084, 174),
	(339, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 135274.5836624, 1, 14573, 0, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 966247.02616, 1101521.6098224, 174),
	(340, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 13, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 306456.71824, 306456.71824, 175),
	(341, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 13, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1493976.50142, 1493976.50142, 175),
	(342, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 13, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 114921.26934, 114921.26934, 175),
	(343, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 13, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 304666.5124, 304666.5124, 176),
	(344, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 13, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1485249.24795, 1485249.24795, 176),
	(345, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 13, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 114249.94215, 114249.94215, 176),
	(346, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 75652.77272, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 540376.948, 616029.72072, 177),
	(347, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 141848.94885, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1013206.7775, 1155055.72635, 177),
	(348, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 28369.78977, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 202641.3555, 231011.14527, 177),
	(349, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14666.427104, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 104760.1936, 119426.620704, 178),
	(350, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 10999.820328, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 78570.1452, 89569.965528, 178),
	(351, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 5499.910164, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 39285.0726, 44784.982764, 178),
	(352, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 30612.52656, 23, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 218660.904, 249273.43056, 179),
	(353, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 264033.04158, 23, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1885950.297, 2149983.33858, 179),
	(354, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 11479.69746, 23, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 81997.839, 93477.53646, 179),
	(355, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 64723.51368, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 462310.812, 527034.32568, 180),
	(356, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 24271.31763, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 173366.5545, 197637.87213, 180),
	(357, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 24271.31763, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 173366.5545, 197637.87213, 180),
	(358, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 25007.866576, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 178627.6184, 203635.484976, 181),
	(359, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 9377.949966, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 66985.3569, 76363.306866, 181),
	(360, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 9377.949966, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 66985.3569, 76363.306866, 181),
	(361, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 10281.5273344, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 73439.48096, 83721.0082944, 182),
	(362, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 44981.682088, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 321297.7292, 366279.411288, 182),
	(363, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 8996.3364176, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 64259.54584, 73255.8822576, 182),
	(364, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 67384.3692424, 1, 8205, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 481316.92316, 548701.2924024, 183),
	(365, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 76137.122544, 1, 8205, 0, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 543836.5896, 619973.712144, 183),
	(366, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 26167.786176, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 186912.7584, 213080.544576, 184),
	(367, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 9812.919816, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 70092.2844, 79905.204216, 184),
	(368, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 9812.919816, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 70092.2844, 79905.204216, 184),
	(369, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 51871.604512, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 370511.4608, 422383.065312, 185),
	(370, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 19451.851692, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 138941.7978, 158393.649492, 185),
	(371, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 19451.851692, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 138941.7978, 158393.649492, 185),
	(372, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 49969.336368, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 356923.8312, 406893.167568, 186),
	(373, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 18738.501138, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 133846.4367, 152584.937838, 186),
	(374, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 18738.501138, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 133846.4367, 152584.937838, 186),
	(375, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 49969.336368, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 356923.8312, 406893.167568, 187),
	(376, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 18738.501138, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 133846.4367, 152584.937838, 187),
	(377, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 18738.501138, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 133846.4367, 152584.937838, 187),
	(378, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 26167.786176, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 186912.7584, 213080.544576, 188),
	(379, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 9812.919816, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 70092.2844, 79905.204216, 188),
	(380, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 9812.919816, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 70092.2844, 79905.204216, 188),
	(381, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 99548.9397504, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 711063.85536, 810612.7951104, 189),
	(382, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 223985.1144384, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1599893.67456, 1823878.7889984, 189),
	(383, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 37330.8524064, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 266648.94576, 303979.7981664, 189),
	(384, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 1878.14181632, 9, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 13415.298688, 15293.44050432, 190),
	(385, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 14790.36680352, 9, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 105645.477168, 120435.84397152, 190),
	(386, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 1643.37408928, 9, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 11738.386352, 13381.76044128, 190),
	(387, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 1039.566342304, 6, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 7425.4738736, 8465.040215904, 191),
	(388, 2, 1, 'Armazenagem', 0.08, 0, 0, 0, 14, 6237.398053824, 6, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 44552.8432416, 50790.241295424, 191),
	(389, 3, 1, 'Manuseamento', 0.08, 0, 0, 0, 14, 1039.566342304, 6, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 7425.4738736, 8465.040215904, 191),
	(390, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 1878.14181632, 9, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 13415.298688, 15293.44050432, 192),
	(391, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 14790.36680352, 9, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 105645.477168, 120435.84397152, 192),
	(392, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 1643.37408928, 9, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 11738.386352, 13381.76044128, 192),
	(393, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 538.2026944, 6, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 3844.30496, 4382.5076544, 193),
	(394, 2, 1, 'Armazenagem', 0.08, 0, 0, 0, 14, 3229.2161664, 6, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 23065.82976, 26295.0459264, 193),
	(395, 3, 1, 'Manuseamento', 0.08, 0, 0, 0, 14, 538.2026944, 6, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 3844.30496, 4382.5076544, 193),
	(396, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 82204.90425, 82204.90425, 194),
	(397, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 2624013.6741, 2624013.6741, 194),
	(398, 6, 1, 'Luminosa 1x', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 163896.28668, 163896.28668, 194),
	(399, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 18290, 0, 546.94, 19, 3, 1, 1, 1, 7, 0, 'T', 1211911.4952, 1211911.4952, 195),
	(400, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 131680.246824, 8, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 940573.1916, 1072253.438424, 196),
	(401, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 395040.740472, 8, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 2821719.5748, 3216760.315272, 196),
	(402, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 49380.092559, 8, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 352714.94685, 402095.039409, 196),
	(403, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 30612.89616, 9, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 218663.544, 249276.44016, 197),
	(404, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 103318.52454, 9, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 737989.461, 841307.98554, 197),
	(405, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 11479.83606, 9, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 81998.829, 93478.66506, 197),
	(406, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 81670.5102528, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 583360.78752, 665031.2977728, 198),
	(407, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 61252.8826896, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 437520.59064, 498773.4733296, 198),
	(408, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 30626.4413448, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 218760.29532, 249386.7366648, 198),
	(409, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 15287.7102336, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 109197.93024, 124485.6404736, 199),
	(410, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 11465.7826752, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 81898.44768, 93364.2303552, 199),
	(411, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 5732.8913376, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 40949.22384, 46682.1151776, 199),
	(412, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 26979.609217568, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 192711.4944112, 219691.10362877, 200),
	(413, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 101173.53456588, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 722668.104042, 823841.63860788, 200),
	(414, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 10117.353456588, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 72266.8104042, 82384.163860788, 200),
	(415, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 24033.534112, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 171668.1008, 195701.634912, 201),
	(416, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 99138.328212, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 708130.9158, 807269.244012, 201),
	(417, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 9012.575292, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 64375.5378, 73388.113092, 201),
	(418, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 114043.295072, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 814594.9648, 928638.259872, 202),
	(419, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 42766.235652, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 305473.1118, 348239.347452, 202),
	(420, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 42766.235652, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 305473.1118, 348239.347452, 202),
	(421, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 2624815.2034, 2624815.2034, 203),
	(422, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 10452, 0, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 692770.26624, 692770.26624, 204),
	(423, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 222969.68768, 222969.68768, 205),
	(424, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1839499.92336, 1839499.92336, 205),
	(425, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 83613.63288, 83613.63288, 205),
	(426, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 476561.2528, 476561.2528, 206),
	(427, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 3931630.3356, 3931630.3356, 206),
	(428, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 178710.4698, 178710.4698, 206),
	(429, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 68435.2564, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 488823.26, 557258.5164, 207),
	(430, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 51326.4423, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 366617.445, 417943.8873, 207),
	(431, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 25663.22115, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 183308.7225, 208971.94365, 207),
	(432, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 604417.53328, 604417.53328, 208),
	(433, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 4986444.64956, 4986444.64956, 208),
	(434, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 226656.57498, 226656.57498, 208),
	(435, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 68435.2564, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 488823.26, 557258.5164, 209),
	(436, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 51326.4423, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 366617.445, 417943.8873, 209),
	(437, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 25663.22115, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 183308.7225, 208971.94365, 209),
	(438, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 67384.3692424, 1, 21960, 0, 546.94, 19, 2, NULL, 1, 1, 7, 0, 'T', 481316.92316, 548701.2924024, 210),
	(439, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 203774.675328, 1, 21960, 0, 546.94, 19, 2, 1, 1, 1, 7, 0, 'T', 1455533.3952, 1659308.070528, 210),
	(440, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 24033.534112, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 171668.1008, 195701.634912, 211),
	(441, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 27037.725876, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 193126.6134, 220164.339276, 211),
	(442, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 9012.575292, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 64375.5378, 73388.113092, 211),
	(443, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 8212.310064, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 58659.3576, 66871.667664, 212),
	(444, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 71857.71306, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 513269.379, 585127.09206, 212),
	(445, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 7185.771306, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 51326.9379, 58512.709206, 212),
	(446, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 24033.534112, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 171668.1008, 195701.634912, 213),
	(447, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 9012.575292, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 64375.5378, 73388.113092, 213),
	(448, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 9012.575292, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 64375.5378, 73388.113092, 213),
	(449, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 145685.90176, 18, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1040613.584, 1186299.48576, 214),
	(450, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 983379.83688, 18, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 7024141.692, 8007521.52888, 214),
	(451, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 54632.21316, 18, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 390230.094, 444862.30716, 214),
	(452, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 491.9750864, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 3514.10776, 4006.0828464, 215),
	(453, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 1106.9439444, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 7906.74246, 9013.6864044, 215),
	(454, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 184.4906574, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1317.79041, 1502.2810674, 215),
	(455, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 158731.58448, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1133797.032, 1292528.61648, 216),
	(456, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 357146.06508, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 2551043.322, 2908189.38708, 216),
	(457, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 59524.34418, 6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 425173.887, 484698.23118, 216),
	(458, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 4389.1781472, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 31351.27248, 35740.4506272, 217),
	(459, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 38405.308788, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 274323.6342, 312728.942988, 217),
	(460, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 3840.5308788, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 27432.36342, 31272.8942988, 217),
	(461, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14531.6130624, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 103797.23616, 118328.8492224, 218),
	(462, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 127151.614296, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 908225.8164, 1035377.430696, 218),
	(463, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 12715.1614296, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 90822.58164, 103537.7430696, 218),
	(464, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 1141.3719072, 3, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 8152.65648, 9294.0283872, 219),
	(465, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 2996.1012564, 3, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 21400.72326, 24396.8245164, 219),
	(466, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 998.7004188, 3, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 7133.57442, 8132.2748388, 219),
	(467, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 11654.9846784, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 83249.89056, 94904.8752384, 220),
	(468, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 13111.8577632, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 93656.12688, 106767.9846432, 220),
	(469, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 4370.6192544, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 31218.70896, 35589.3282144, 220),
	(470, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 4389.1781472, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 31351.27248, 35740.4506272, 221),
	(471, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 38405.308788, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 274323.6342, 312728.942988, 221),
	(472, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 3840.5308788, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 27432.36342, 31272.8942988, 221),
	(473, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14531.6130624, 12, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 103797.23616, 118328.8492224, 222),
	(474, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 152581.9371552, 12, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1089870.97968, 1242452.9168352, 222),
	(475, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 12715.1614296, 12, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 90822.58164, 103537.7430696, 222),
	(476, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 8212.310064, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 58659.3576, 66871.667664, 223),
	(477, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 71857.71306, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 513269.379, 585127.09206, 223),
	(478, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 7185.771306, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 51326.9379, 58512.709206, 223),
	(479, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 1141.3719072, 3, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 8152.65648, 9294.0283872, 224),
	(480, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 2996.1012564, 3, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 21400.72326, 24396.8245164, 224),
	(481, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 998.7004188, 3, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 7133.57442, 8132.2748388, 224),
	(482, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 11654.9846784, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 83249.89056, 94904.8752384, 225),
	(483, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 13111.8577632, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 93656.12688, 106767.9846432, 225),
	(484, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 4370.6192544, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 31218.70896, 35589.3282144, 225),
	(485, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 51871.604512, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 370511.4608, 422383.065312, 226),
	(486, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 19451.851692, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 138941.7978, 158393.649492, 226),
	(487, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 19451.851692, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 138941.7978, 158393.649492, 226),
	(488, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14578.0102944, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 104128.64496, 118706.6552544, 227),
	(489, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 65601.0463248, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 468578.90232, 534179.9486448, 227),
	(490, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 5466.7538604, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 39048.24186, 44514.9957204, 227),
	(491, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 1057.8466752, 4, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 7556.04768, 8613.8943552, 228),
	(492, 2, 1, 'Armazenagem', 0.08, 0, 0, 0, 14, 4231.3867008, 4, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 30224.19072, 34455.5774208, 228),
	(493, 3, 1, 'Manuseamento', 0.08, 0, 0, 0, 14, 1057.8466752, 4, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 7556.04768, 8613.8943552, 228),
	(494, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 64.9554976, 4, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 463.96784, 528.9233376, 229),
	(495, 2, 1, 'Armazenagem', 0.08, 0, 0, 0, 14, 259.8219904, 4, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 1855.87136, 2115.6933504, 229),
	(496, 3, 1, 'Manuseamento', 0.08, 0, 0, 0, 14, 64.9554976, 4, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 463.96784, 528.9233376, 229),
	(497, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 167.0284224, 4, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 1193.06016, 1360.0885824, 230),
	(498, 2, 1, 'Armazenagem', 0.08, 0, 0, 0, 14, 668.1136896, 4, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 4772.24064, 5440.3543296, 230),
	(499, 3, 1, 'Manuseamento', 0.08, 0, 0, 0, 14, 167.0284224, 4, NULL, NULL, NULL, NULL, NULL, 1, 6, 1, 1, 0, 'T', 1193.06016, 1360.0885824, 230),
	(500, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 94760.7916416, 2, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 676862.79744, 771623.5890816, 231),
	(501, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 165831.3853728, 2, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1184509.89552, 1350341.2808928, 231),
	(502, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 82915.6926864, 2, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 592254.94776, 675170.6404464, 231),
	(505, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 14, 426618.42888, 1, 88, 0, 546.94, 19, 412, NULL, 1, 1, 7, 0, 'T', 3047274.492, 3473892.92088, 233),
	(506, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 19113.1551688, 1, 88, 0, 546.94, 19, 412, NULL, 1, 1, 7, 0, 'T', 136522.53692, 155635.6920888, 233),
	(507, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 816.5833984, 1, 88, 0, 546.94, 19, 412, 1, 1, 1, 7, 0, 'T', 5832.73856, 6649.3219584, 233),
	(508, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 194.9335248, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1392.38232, 1587.3158448, 234),
	(509, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 852.834171, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 6091.67265, 6944.506821, 234),
	(510, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 170.5668342, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1218.33453, 1388.9013642, 234),
	(511, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14578.0102944, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 104128.64496, 118706.6552544, 235),
	(512, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 65601.0463248, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 468578.90232, 534179.9486448, 235),
	(513, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 5466.7538604, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 39048.24186, 44514.9957204, 235),
	(514, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 798.2991968, 12, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 5702.13712, 6500.4363168, 236),
	(515, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 8382.1415664, 12, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 59872.43976, 68254.5813264, 236),
	(516, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 698.5117972, 12, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 4989.36998, 5687.8817772, 236),
	(517, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 59, NULL, 1, 1, 7, 0, 'T', 329024.072, 329024.072, 237),
	(518, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 59, NULL, 1, 1, 7, 0, 'T', 2625645.2456, 2625645.2456, 237),
	(519, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 798.2991968, 12, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 5702.13712, 6500.4363168, 238),
	(520, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 8382.1415664, 12, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 59872.43976, 68254.5813264, 238),
	(521, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 698.5117972, 12, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 4989.36998, 5687.8817772, 238),
	(522, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 94760.7916416, 2, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 676862.79744, 771623.5890816, 239),
	(523, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 165831.3853728, 2, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1184509.89552, 1350341.2808928, 239),
	(524, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 82915.6926864, 2, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 592254.94776, 675170.6404464, 239),
	(525, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 428.9714912, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 3064.08208, 3493.0535712, 240),
	(526, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 1876.750274, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 13405.3591, 15282.109374, 240),
	(527, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 375.3500548, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 2681.07182, 3056.4218748, 240),
	(528, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 428.9714912, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 3064.08208, 3493.0535712, 241),
	(529, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 1876.750274, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 13405.3591, 15282.109374, 241),
	(530, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 375.3500548, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 2681.07182, 3056.4218748, 241),
	(531, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 3776.814216, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 26977.2444, 30754.058616, 242),
	(532, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 22660.885296, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 161863.4664, 184524.351696, 242),
	(533, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 1416.305331, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 10116.46665, 11532.771981, 242),
	(534, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14603.6816352, 16, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 104312.01168, 118915.6933152, 243),
	(535, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 204451.5428928, 16, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1460368.16352, 1664819.7064128, 243),
	(536, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 12778.2214308, 16, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 91273.01022, 104051.2316508, 243),
	(537, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 30, NULL, 1, 1, 7, 0, 'T', 2637858.2711, 2637858.2711, 244),
	(538, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 30, NULL, 1, 1, 7, 0, 'T', 3305545.07, 3305545.07, 244),
	(539, 12, 1, 'Carga Importação', 0.25, 197.88, 0.08, 0, 0, 0, 1, 37350, 0, 546.94, 19, 30, 1, 1, 1, 7, 0, 'T', 2487901.428, 2487901.428, 244),
	(540, 13, 1, 'Carga Exportação/Transito', 0.25, 197.88, 0.08, 0, 0, 0, 1, 31286, 0, 546.94, 19, 30, 1, 1, 1, 7, 0, 'T', 2083975.47728, 2083975.47728, 244),
	(541, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 6, NULL, 1, 1, 7, 0, 'T', 330554.507, 330554.507, 245),
	(542, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 6, NULL, 1, 1, 7, 0, 'T', 2637858.2711, 2637858.2711, 245),
	(543, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 17685.7485448, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 126326.77532, 144012.5238648, 246),
	(544, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 66321.557043, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 473725.40745, 540046.964493, 246),
	(545, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 6632.1557043, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 47372.540745, 54004.6964493, 246),
	(546, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 11115.9569024, 17, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 79399.69216, 90515.6490624, 247),
	(547, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 165349.8589232, 17, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1181070.42088, 1346420.2798032, 247),
	(548, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 9726.4622896, 17, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 69474.73064, 79201.1929296, 247),
	(549, 13, 1, 'Carga Exportação/Transito', 0.25, 197.88, 0.08, 0, 0, 0, 1, 5590, 0, 546.94, 19, 6, 1, 1, 1, 7, 0, 'T', 372352.5832, 372352.5832, 248),
	(550, 12, 1, 'Carga Importação', 0.25, 197.88, 0.08, 0, 0, 0, 1, 57960, 0, 546.94, 19, 6, 1, 1, 1, 7, 0, 'T', 3860743.4208, 3860743.4208, 248),
	(551, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 3776.814216, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 26977.2444, 30754.058616, 249),
	(552, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 22660.885296, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 161863.4664, 184524.351696, 249),
	(553, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 1416.305331, 16, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 10116.46665, 11532.771981, 249),
	(554, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14603.6816352, 16, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 104312.01168, 118915.6933152, 250),
	(555, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 204451.5428928, 16, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1460368.16352, 1664819.7064128, 250),
	(556, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 12778.2214308, 16, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 91273.01022, 104051.2316508, 250),
	(557, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 21262.065216, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 151871.8944, 173133.959616, 251),
	(558, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 7973.274456, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 56951.9604, 64925.234856, 251),
	(559, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 7973.274456, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 56951.9604, 64925.234856, 251),
	(560, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 21262.065216, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 151871.8944, 173133.959616, 252),
	(561, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 7973.274456, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 56951.9604, 64925.234856, 252),
	(562, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 7973.274456, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 56951.9604, 64925.234856, 252),
	(565, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 3776.814216, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 26977.2444, 30754.058616, 255),
	(566, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 1416.305331, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 10116.46665, 11532.771981, 255),
	(567, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 1416.305331, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 10116.46665, 11532.771981, 255),
	(568, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14603.6816352, 1, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 104312.01168, 118915.6933152, 256),
	(569, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 12778.2214308, 1, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 91273.01022, 104051.2316508, 256),
	(570, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 12778.2214308, 1, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 91273.01022, 104051.2316508, 256),
	(571, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 1650.6076944, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 11790.05496, 13440.6626544, 257),
	(572, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 14442.817326, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 103162.9809, 117605.798226, 257),
	(573, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 1444.2817326, 10, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 10316.29809, 11760.5798226, 257),
	(574, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 335.7168192, 17, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 2397.97728, 2733.6940992, 258),
	(575, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 4993.7876856, 17, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 35669.91204, 40663.6997256, 258),
	(576, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 293.7522168, 17, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 2098.23012, 2391.9823368, 258),
	(577, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 2637858.2711, 2637858.2711, 259),
	(578, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 0, 0, 1, NULL, 0, 546.94, 19, 3, NULL, 1, 1, 7, 0, 'T', 82638.62675, 82638.62675, 259),
	(579, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 0, 0, 1, 49141.97, 0, 546.94, 19, 3, 1, 1, 1, 7, 0, 'T', 3273370.2098456, 3273370.2098456, 260),
	(580, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 8249.30828512, 18, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 58923.630608, 67172.93889312, 261),
	(581, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 129926.60549064, 18, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 928047.182076, 1057973.7875666, 261),
	(582, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 7218.14474948, 18, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 51558.176782, 58776.32153148, 261),
	(583, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 3776.814216, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 26977.2444, 30754.058616, 262),
	(584, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 1416.305331, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 10116.46665, 11532.771981, 262),
	(585, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 1416.305331, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 10116.46665, 11532.771981, 262),
	(586, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 14603.6816352, 1, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 104312.01168, 118915.6933152, 263),
	(587, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 12778.2214308, 1, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 91273.01022, 104051.2316508, 263),
	(588, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 12778.2214308, 1, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 91273.01022, 104051.2316508, 263),
	(589, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 130370.031456, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 931214.5104, 1061584.541856, 264),
	(590, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 97777.523592, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 698410.8828, 796188.406392, 264),
	(591, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 48888.761796, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 349205.4414, 398094.203196, 264),
	(592, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 130370.031456, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 931214.5104, 1061584.541856, 265),
	(593, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 97777.523592, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 698410.8828, 796188.406392, 265),
	(594, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 48888.761796, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 349205.4414, 398094.203196, 265),
	(595, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 4951.8230832, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 35370.16488, 40321.9879632, 266),
	(596, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 5570.8009686, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 39791.43549, 45362.2364586, 266),
	(597, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 1856.9336562, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 13263.81183, 15120.7454862, 266),
	(598, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 8249.30828512, 18, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 58923.630608, 67172.93889312, 267),
	(599, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 129926.60549064, 18, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 928047.182076, 1057973.7875666, 267),
	(600, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 7218.14474948, 18, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 51558.176782, 58776.32153148, 267),
	(601, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 11115.9569024, 1, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 79399.69216, 90515.6490624, 268),
	(602, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 9726.4622896, 1, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 69474.73064, 79201.1929296, 268),
	(603, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 9726.4622896, 1, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 69474.73064, 79201.1929296, 268),
	(604, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 4951.8230832, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 35370.16488, 40321.9879632, 269),
	(605, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 14, 5570.8009686, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 39791.43549, 45362.2364586, 269),
	(606, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 14, 1856.9336562, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 13263.81183, 15120.7454862, 269),
	(607, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 11115.9569024, 17, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 79399.69216, 90515.6490624, 270),
	(608, 2, 1, 'Armazenagem', 0.07, 0, 0, 0, 14, 165349.8589232, 17, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 1181070.42088, 1346420.2798032, 270),
	(609, 3, 1, 'Manuseamento', 0.07, 0, 0, 0, 14, 9726.4622896, 17, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 0, 'T', 69474.73064, 79201.1929296, 270),
	(610, 1, 1, 'Carga', 0.08, 0, 0, 0, 0, 0, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 58617.2224, 58617.2224, 271),
	(611, 2, 1, 'Armazenagem', 0.03, 0, 0, 0, 0, 0, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 109907.292, 109907.292, 271),
	(612, 3, 1, 'Manuseamento', 0.03, 0, 0, 0, 0, 0, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 21981.4584, 21981.4584, 271);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.factura_items_original
CREATE TABLE IF NOT EXISTS `factura_items_original` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao_produto` varchar(250) DEFAULT '0',
  `preco_compra_produto` double DEFAULT '0',
  `preco_venda_produto` double NOT NULL DEFAULT '0',
  `quantidade_produto` int(10) unsigned NOT NULL,
  `desconto_produto` double DEFAULT '0',
  `incidencia_produto` double NOT NULL,
  `retencao_produto` double NOT NULL DEFAULT '0',
  `taxa` double DEFAULT '0',
  `iva_produto` double NOT NULL DEFAULT '0',
  `total_preco_produto` double NOT NULL DEFAULT '0',
  `produto_id` int(10) unsigned NOT NULL,
  `factura_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_factura_items_factura` (`factura_id`),
  KEY `FK_factura_items_produtos` (`produto_id`),
  CONSTRAINT `factura_items_original_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `facturas_original` (`id`),
  CONSTRAINT `factura_items_original_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.factura_items_original: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.failed_jobs: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.firebase_notification
CREATE TABLE IF NOT EXISTS `firebase_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `type` char(10) NOT NULL,
  `object` text NOT NULL,
  `route` varchar(50) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `statuId` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.firebase_notification: ~0 rows (aproximadamente)
INSERT INTO `firebase_notification` (`id`, `title`, `body`, `type`, `object`, `route`, `userId`, `statuId`, `created_at`, `updated_at`) VALUES
	(1, 'sfdsds', 'dsdsd', 'dsdsd', 'dsdsds', 'dsdsds', 729, 1, '2024-01-25 16:02:28', '2024-01-29 13:50:10');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.formas_pagamentos
CREATE TABLE IF NOT EXISTS `formas_pagamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_pagamento_id` int(10) NOT NULL,
  `designacao` varchar(45) NOT NULL,
  `descricao_tipo_pagamento` varchar(45) NOT NULL,
  `sigla_tipo_pagamento` varchar(45) NOT NULL,
  `codigo_contabilidade` varchar(45) DEFAULT NULL,
  `conta_corrente` varchar(45) DEFAULT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `diversos` enum('1','2') DEFAULT '2' COMMENT '1=>sim; 2=>nao',
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_credito` int(10) unsigned DEFAULT '1' COMMENT '1=>pagCredito; 2=>Não Credito',
  PRIMARY KEY (`id`),
  KEY `FK_formas_pagamentos_user` (`user_id`),
  KEY `FK_formas_pagamentos_canal` (`canal_id`),
  KEY `FK_formas_pagamentos_status` (`status_id`),
  KEY `FK_formas_pagamentos_empresas` (`empresa_id`),
  KEY `FK_formas_pagamentos_tipo_pagamento` (`tipo_pagamento_id`),
  CONSTRAINT `FK_formas_pagamentos_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_formas_pagamentos_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_formas_pagamentos_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_formas_pagamentos_tipo_pagamento` FOREIGN KEY (`tipo_pagamento_id`) REFERENCES `tipo_pagamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.formas_pagamentos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.formas_pagamentos_geral
CREATE TABLE IF NOT EXISTS `formas_pagamentos_geral` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `sigla_tipo_pagamento` varchar(250) DEFAULT NULL,
  `tipo_credito` enum('1','2') DEFAULT '2' COMMENT '1=>pagCredito; 2=>Não Credito',
  `status_id` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_formas_pagamentos_geral_status_gerais` (`status_id`),
  CONSTRAINT `FK_formas_pagamentos_geral_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.formas_pagamentos_geral: ~6 rows (aproximadamente)
INSERT INTO `formas_pagamentos_geral` (`id`, `descricao`, `sigla_tipo_pagamento`, `tipo_credito`, `status_id`) VALUES
	(1, 'NUMERÁRIO', 'NU', '2', 1),
	(2, 'VENDA CRÉDITO', 'CC', '1', 1),
	(3, 'MULTICAIXA', 'NU', '2', 1),
	(4, 'TRANSFERENCIA', 'NU', '2', 1),
	(5, 'DEPÓSITO', 'NU', '2', 1),
	(6, 'DUPLO', 'OU', '2', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.fornecedores
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `telefone_empresa` varchar(45) DEFAULT NULL,
  `email_empresa` varchar(145) DEFAULT NULL,
  `nif` varchar(45) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `pessoal_contacto` varchar(145) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone_contacto` varchar(45) DEFAULT NULL,
  `email_contacto` varchar(145) DEFAULT NULL,
  `conta_corrente` varchar(145) DEFAULT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `data_contracto` date DEFAULT NULL,
  `pais_nacionalidade_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_user_id` int(10) unsigned NOT NULL,
  `diversos` enum('1','2') DEFAULT '2' COMMENT '1=>diverso;2=>não',
  `centroCustoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fornecedores_empresa` (`empresa_id`),
  KEY `FK_fornecedores_canal` (`canal_id`),
  KEY `FK_fornecedores_status` (`status_id`),
  KEY `FK_fornecedores_user` (`user_id`),
  KEY `FK_fornecedores_pais` (`pais_nacionalidade_id`),
  KEY `FK_fornecedores_tipo_users` (`tipo_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.fornecedores: ~0 rows (aproximadamente)
INSERT INTO `fornecedores` (`id`, `nome`, `telefone_empresa`, `email_empresa`, `nif`, `website`, `pessoal_contacto`, `endereco`, `telefone_contacto`, `email_contacto`, `conta_corrente`, `empresa_id`, `canal_id`, `status_id`, `user_id`, `data_contracto`, `pais_nacionalidade_id`, `created_at`, `updated_at`, `tipo_user_id`, `diversos`, `centroCustoId`) VALUES
	(1, 'DIVERSOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '31.1.2.1.1', 1, 2, 1, 1, NULL, 1, '2024-01-23 16:10:54', '2024-01-23 16:10:54', 2, '1', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.gestor_clientes
CREATE TABLE IF NOT EXISTS `gestor_clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(145) NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_gestor_clientes_empresa` (`empresa_id`),
  KEY `FK_gestor_clientes_canal` (`canal_id`),
  KEY `FK_gestor_clientes_user` (`user_id`),
  KEY `FK_gestor_clientes_status` (`status_id`),
  CONSTRAINT `FK_gestor_clientes_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_gestor_clientes_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_gestor_clientes_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_gestor_clientes_user` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.gestor_clientes: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.historico_extrato_cartao_cliente
CREATE TABLE IF NOT EXISTS `historico_extrato_cartao_cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clienteId` int(10) unsigned NOT NULL DEFAULT '0',
  `bonus` double NOT NULL DEFAULT '0',
  `saldo_anterior` double NOT NULL DEFAULT '0',
  `saldo_atual` double NOT NULL DEFAULT '0',
  `valorBonus` double DEFAULT '0',
  `valorDescontarCartao` double DEFAULT '0',
  `userId` int(11) NOT NULL,
  `documetoReferente` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.historico_extrato_cartao_cliente: ~6 rows (aproximadamente)
INSERT INTO `historico_extrato_cartao_cliente` (`id`, `clienteId`, `bonus`, `saldo_anterior`, `saldo_atual`, `valorBonus`, `valorDescontarCartao`, `userId`, `documetoReferente`, `created_at`, `updated_at`) VALUES
	(4, 166, 1, 0, 30, 30, 0, 638, 'FR MUT2023/2', '2023-10-10 17:26:21', '2023-10-10 17:26:21'),
	(5, 166, 1, 30, 90, 60, 0, 638, 'FR MUT2023/3', '2023-10-10 17:27:25', '2023-10-10 17:27:25'),
	(6, 34, 2, 0, 4, 4, 0, 35, 'FR RR2023/83(200,00)', '2023-10-13 09:38:57', '2023-10-13 09:38:57'),
	(7, 166, 1, 90, 136.17, 46.17, 0, 638, 'FR MUT2023/5(4.617,00)', '2023-10-13 13:53:19', '2023-10-13 13:53:19'),
	(8, 166, 1, 136, 150, 34, 20, 638, 'FR MUT2023/10(3.420,00)', '2023-10-20 17:01:42', '2023-10-20 17:01:42'),
	(9, 204, 2, 2000, 2162, 162, 0, 35, 'FR RR2023/92(8.100,00)', '2023-10-24 18:03:19', '2023-10-24 18:03:19');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.historico_pagamentos_vendas_online
CREATE TABLE IF NOT EXISTS `historico_pagamentos_vendas_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pagamento_id` int(10) NOT NULL,
  `status_pagamento_id` int(10) NOT NULL,
  `descricao` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.historico_pagamentos_vendas_online: ~6 rows (aproximadamente)
INSERT INTO `historico_pagamentos_vendas_online` (`id`, `pagamento_id`, `status_pagamento_id`, `descricao`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 37, 1, 'Pagamento válido pelo operador Mutue Soluções Tecnológicas Inteligentes Lda', 638, '2023-11-24 16:39:49', '2023-11-24 16:39:49'),
	(2, 37, 5, 'O operador Manuel Bumba confirmou a entrega do pagamento N.º 00001', 734, '2023-11-24 16:41:46', '2023-11-24 16:41:46'),
	(3, 37, 5, 'O operador Manuel Bumba confirmou a entrega do pagamento N.º 00001', 734, '2023-11-24 16:41:55', '2023-11-24 16:41:55'),
	(4, 1, 1, 'Pagamento válido pelo operador Fernando Gilberto', 642, '2023-12-08 11:33:33', '2023-12-08 11:33:33'),
	(5, 2, 1, 'Pagamento válido pelo operador Fernando Gilberto', 642, '2024-01-11 16:41:23', '2024-01-11 16:41:23'),
	(6, 2, 1, 'Pagamento válido pelo operador Mutue Soluções Tecnológicas Inteligentes Lda', 638, '2024-01-24 16:19:00', '2024-01-24 16:19:00');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.idiomas
CREATE TABLE IF NOT EXISTS `idiomas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.idiomas: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `org_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.images: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.intervalo_pmd
CREATE TABLE IF NOT EXISTS `intervalo_pmd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toneladas_min` double NOT NULL DEFAULT '0',
  `toneladas_max` double NOT NULL DEFAULT '0',
  `taxa` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.intervalo_pmd: ~5 rows (aproximadamente)
INSERT INTO `intervalo_pmd` (`id`, `toneladas_min`, `toneladas_max`, `taxa`) VALUES
	(1, 0, 10, 7.21),
	(2, 10, 25, 6.62),
	(3, 25, 75, 7.53),
	(4, 75, 150, 8.26),
	(5, 150, 1e113, 8.1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.inventarios
CREATE TABLE IF NOT EXISTS `inventarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `inventario_tipo_id` int(10) unsigned DEFAULT NULL,
  `data_inventario` date NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `numSequenciaInventario` int(10) unsigned DEFAULT NULL,
  `tipo_user_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `armazem_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numeracao` varchar(50) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `observacao` text,
  `centroCustoId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inventarios_empresas_empresa` (`empresa_id`),
  KEY `FK_inventarios_empresas_tipo` (`inventario_tipo_id`),
  KEY `FK_inventarios_empresas_user` (`user_id`),
  KEY `FK_inventarios_empresas_canal` (`canal_id`),
  KEY `FK_inventarios_empresas_status` (`status_id`),
  KEY `FK_inventarios_empresas_armazem` (`armazem_id`),
  KEY `FK_inventarios_tipo_users` (`tipo_user_id`),
  CONSTRAINT `FK_inventarios_empresas_armazem` FOREIGN KEY (`armazem_id`) REFERENCES `armazens` (`id`),
  CONSTRAINT `FK_inventarios_empresas_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_inventarios_empresas_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_inventarios_empresas_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_inventarios_empresas_tipo` FOREIGN KEY (`inventario_tipo_id`) REFERENCES `tipo_inventarios` (`id`),
  CONSTRAINT `FK_inventarios_tipo_users` FOREIGN KEY (`tipo_user_id`) REFERENCES `tipo_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.inventarios: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.inventario_itens
CREATE TABLE IF NOT EXISTS `inventario_itens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inventario_id` int(10) unsigned NOT NULL,
  `produto_id` int(10) unsigned NOT NULL,
  `existenciaAnterior` int(10) unsigned NOT NULL,
  `existenciaActual` int(10) unsigned NOT NULL,
  `diferenca` double NOT NULL,
  `precoVenda` double DEFAULT NULL,
  `PrecoCompra` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizou` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inventario_itens_inventario` (`inventario_id`),
  KEY `FK_inventario_itens_produto` (`produto_id`),
  CONSTRAINT `FK_inventario_itens_inventario` FOREIGN KEY (`inventario_id`) REFERENCES `inventarios` (`id`),
  CONSTRAINT `FK_inventario_itens_produto` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.inventario_itens: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.jobs: ~3 rows (aproximadamente)
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
	(583, 'default', '{"uuid":"c88d1320-6113-4c92-8a4b-6927e7d5df3d","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1710343782, 1710343782),
	(584, 'default', '{"uuid":"614632f0-14df-4d26-af98-75cde7c44128","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1710343973, 1710343973),
	(585, 'default', '{"uuid":"0ac8bc92-10c6-49db-80e7-0118a66ca6c5","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1710422041, 1710422041),
	(586, 'default', '{"uuid":"18db37ed-241b-4798-b23a-71fca2d6ac3e","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1710492134, 1710492134),
	(587, 'default', '{"uuid":"55669411-d645-4dff-8e30-facb9bdfaab0","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1710752379, 1710752379);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.json
CREATE TABLE IF NOT EXISTS `json` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` longtext,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.json: ~0 rows (aproximadamente)
INSERT INTO `json` (`id`, `texto`) VALUES
	(2, '{"id":2,"uuid":"e6aee384-6564-4789-b58b-be427b0d73ab","codigo":"00002","bancoId":6,"empresaId":null,"dataPagamentoBanco":"2024-01-11 00:00:00","totalPagamento":8266.25,"totalDesconto":0,"totalIva":1157.275,"comprovativoBancario":"comprovativosVendasOnline\\/TlpevWPFeVtf1lA9mjtuJD7JqakqkwnHQHGWpRUk.pdf","formaPagamentoId":4,"userId":741,"nomeUser":"Ramos Soft","statusPagamentoId":2,"enderecoEntrega":null,"nomeUserEntrega":"Ramos Soft","apelidoUserEntrega":"Ramos Soft","pontoReferenciaEntrega":null,"telefoneUserEntrega":"923292970","provinciaIdEntrega":1,"comunaId":null,"taxaEntrega":0,"tipoEntregaId":2,"operadorId":638,"emailEntrega":"info@ramossoft.com","numeroCartaoCliente":null,"observacaoEntrega":null,"motivoRejeicao":null,"created_at":"2024-01-11T13:03:18.000000Z","estimativaEntrega":"2024-01-13 14:03:18","updated_at":"2024-01-24T16:19:00.000000Z","deleted_at":null,"pagamento_vendas_online_items":[{"id":3,"uuid":"e19c8d13-7e9a-402d-a7e6-98c45ff4c7c3","produtoId":1510,"precoVendaProduto":3372.5,"nomeProduto":"CABO ALIMENT. PC 1.8 MT MANHT","quantidade":1,"pagamentoVendasOnlineId":2,"taxaIvaValor":472.15,"subtotal":3372.5,"taxaIva":14},{"id":4,"uuid":"067bd8a2-b788-43dc-99e2-6d7f455d53f6","produtoId":1047,"precoVendaProduto":4893.75,"nomeProduto":"BLOCO TOM.TRIPLA 1.5 MT C\\/INT BRANCA","quantidade":1,"pagamentoVendasOnlineId":2,"taxaIvaValor":685.125,"subtotal":4893.75,"taxaIva":14}],"user":{"id":741,"name":"Ramos Soft","uuid":"88b32a7d-114e-4ce4-9cae-7813bc40de94","username":"Ramos Soft","created_at":"2023-12-06T23:44:12.000000Z","updated_at":"2023-12-06T23:44:12.000000Z","tipo_user_id":4,"status_id":1,"statusUserAdicional":1,"status_senha_id":1,"telefone":"923292970","email":"info@ramossoft.com","email_verified_at":null,"canal_id":4,"empresa_id":null,"foto":"utilizadores\\/cliente\\/avatarEmpresa.png","guard":"empresa","token_notification_firebase":null,"all_permissions":[],"can":{"gerir utilizadores":true,"gerir permiss\\u00f5es":true,"gerir licen\\u00e7as":true,"consultar licen\\u00e7as":true,"gerir fornecedores":true,"gerir empresas":true,"gerir funcionario":true,"gerir fabricantes":true,"gerir armazens":true,"gerir bancos":true,"gerir marcas":true,"gerir categoria":true,"gerir clientes":true,"gerir produtos":true,"gerir nota credito":true,"gerir nota debito":true,"gerir rectificar documento":true,"gerir anular documento":true,"gerir actualizar estoque":true,"gerir transferir produto":true,"gerir entrada produto":true,"gerir pagamento fornecedor":true,"gerir taxas":true,"gerir motivos isencao":true,"gerir vendas":true,"gerir inventario":true,"visualizar minhas licen\\u00e7as":true,"visualizar facturas licencas":true,"visualizar recibo pagamento factura":true,"gerir funcao":true,"gerir movimento diario":true,"gerir recibos":true,"visualizar produtos mais vendidos":true,"visualizar existencia estoque produto":true,"converter proforma":true,"gerar saft":true,"gerir empresa":true,"editar modelo documento":true,"definir parametros":true,"visualizar relatorio por centro custo":true,"gerir centro de custo":true,"visualizar relatorios":true,"imprimir_fecho_caixa":true,"gerir permissao":true,"Sem acesso a dashboard":true},"permissions":[],"roles":[]},"statu":{"id":2,"designacao":"Pendente"},"banco":{"id":6,"designacao":"BANCO DE FOMENTO ANGOLA","sigla":"BFA","uuid":"404f6f31-f11b-42c3-812b-7f1e05168ccb","num_conta":"273036373 30 001","titular":"","iban":"AO06 0006.0000.7303.6373.3014.3","status_id":1,"canal_id":2,"created_at":"2021-04-16T11:42:08.000000Z","empresa_id":148,"tipo_user_id":2,"user_id":641,"centroCustoId":null,"updated_at":"2022-10-20T12:41:50.000000Z"}}');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.log_acessos
CREATE TABLE IF NOT EXISTS `log_acessos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `maquina` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rota_acessado` longtext COLLATE utf8_unicode_ci,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outra_informacao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=373723 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.log_acessos: ~45 rows (aproximadamente)
INSERT INTO `log_acessos` (`id`, `descricao`, `ip`, `maquina`, `browser`, `rota_acessado`, `user_name`, `outra_informacao`, `created_at`, `updated_at`, `user_id`) VALUES
	(373668, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 19 minutos e 45 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:19:45', '2024-03-13 09:19:45', 1),
	(373669, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 24 minutos e 45 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:24:45', '2024-03-13 09:24:45', 1),
	(373670, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 26 minutos e 08 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:26:08', '2024-03-13 09:26:08', 1),
	(373671, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 26 minutos e 18 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:26:18', '2024-03-13 09:26:18', 1),
	(373672, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 30 minutos e 20 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:30:20', '2024-03-13 09:30:20', 1),
	(373673, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 30 minutos e 26 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:30:26', '2024-03-13 09:30:26', 1),
	(373674, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 30 minutos e 39 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:30:39', '2024-03-13 09:30:39', 1),
	(373675, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 32 minutos e 10 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:32:10', '2024-03-13 09:32:10', 1),
	(373676, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 32 minutos e 21 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:32:21', '2024-03-13 09:32:21', 1),
	(373677, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 33 minutos e 54 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:33:54', '2024-03-13 09:33:54', 1),
	(373678, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 34 minutos e 12 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:34:12', '2024-03-13 09:34:12', 1),
	(373679, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 34 minutos e 40 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:34:40', '2024-03-13 09:34:40', 1),
	(373680, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 34 minutos e 44 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:34:44', '2024-03-13 09:34:44', 1),
	(373681, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 34 minutos e 57 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:34:57', '2024-03-13 09:34:57', 1),
	(373682, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 35 minutos e 10 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:35:10', '2024-03-13 09:35:10', 1),
	(373683, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 35 minutos e 37 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:35:37', '2024-03-13 09:35:37', 1),
	(373684, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 35 minutos e 46 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:35:46', '2024-03-13 09:35:46', 1),
	(373685, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 35 minutos e 52 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:35:52', '2024-03-13 09:35:52', 1),
	(373686, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 37 minutos e 56 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:37:56', '2024-03-13 09:37:56', 1),
	(373687, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 46 minutos e 06 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:46:06', '2024-03-13 09:46:06', 1),
	(373688, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 46 minutos e 17 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:46:17', '2024-03-13 09:46:17', 1),
	(373689, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 48 minutos e 15 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:48:15', '2024-03-13 09:48:15', 1),
	(373690, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 49 minutos e 43 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:49:43', '2024-03-13 09:49:43', 1),
	(373691, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 50 minutos e 43 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:50:43', '2024-03-13 09:50:43', 1),
	(373692, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 51 minutos e 16 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:51:16', '2024-03-13 09:51:16', 1),
	(373693, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 10 horas 53 minutos e 40 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 09:53:40', '2024-03-13 09:53:40', 1),
	(373694, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 00 minutos e 53 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:00:53', '2024-03-13 10:00:53', 1),
	(373695, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 02 minutos e 34 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/recibo/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:02:34', '2024-03-13 10:02:34', 1),
	(373696, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 03 minutos e 31 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/recibo/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:03:31', '2024-03-13 10:03:31', 1),
	(373697, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 04 minutos e 12 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:04:12', '2024-03-13 10:04:12', 1),
	(373698, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 07 minutos e 05 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/fatura/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:07:05', '2024-03-13 10:07:05', 1),
	(373699, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 07 minutos e 21 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/fatura/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:07:21', '2024-03-13 10:07:21', 1),
	(373700, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 07 minutos e 56 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:07:56', '2024-03-13 10:07:56', 1),
	(373701, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 13 minutos e 51 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:13:51', '2024-03-13 10:13:51', 1),
	(373702, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 49 minutos e 06 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:49:06', '2024-03-13 10:49:06', 1),
	(373703, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 50 minutos e 16 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:50:16', '2024-03-13 10:50:16', 1),
	(373704, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 56 minutos e 49 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:56:49', '2024-03-13 10:56:49', 1),
	(373705, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 11 horas 59 minutos e 59 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 10:59:59', '2024-03-13 10:59:59', 1),
	(373706, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 12 horas 00 minutos e 18 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 11:00:18', '2024-03-13 11:00:18', 1),
	(373707, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 01 horas 21 minutos e 10 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 12:21:10', '2024-03-13 12:21:10', 1),
	(373708, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 01 horas 21 minutos e 26 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 12:21:26', '2024-03-13 12:21:26', 1),
	(373709, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 01 horas 28 minutos e 05 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 12:28:05', '2024-03-13 12:28:05', 1),
	(373710, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 01 horas 28 minutos e 43 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 12:28:43', '2024-03-13 12:28:43', 1),
	(373711, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 01 horas 28 minutos e 58 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 12:28:58', '2024-03-13 12:28:58', 1),
	(373712, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 01 horas 29 minutos e 15 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 12:29:15', '2024-03-13 12:29:15', 1),
	(373713, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 01 horas 30 minutos e 58 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 12:30:58', '2024-03-13 12:30:58', 1),
	(373714, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 01 horas 32 minutos e 57 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/gerarSaft', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 12:32:57', '2024-03-13 12:32:57', 1),
	(373715, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 04 horas 33 minutos e 54 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/fatura/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 15:33:54', '2024-03-13 15:33:54', 1),
	(373716, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 05 horas 16 minutos e 57 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/fatura/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 16:16:57', '2024-03-13 16:16:57', 1),
	(373717, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 05 horas 26 minutos e 30 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/recibo/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 16:26:30', '2024-03-13 16:26:30', 1),
	(373718, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 05 horas 54 minutos e 24 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/fatura/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 16:54:24', '2024-03-13 16:54:24', 1),
	(373719, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 05 horas 57 minutos e 34 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/recibo/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 16:57:34', '2024-03-13 16:57:34', 1),
	(373720, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 06 horas 00 minutos e 03 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/recibo/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 17:00:03', '2024-03-13 17:00:03', 1),
	(373721, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 06 horas 09 minutos e 06 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/fatura/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 17:09:06', '2024-03-13 17:09:06', 1),
	(373722, 'No dia 13 de mar?o de 2024 o Senhor(a) Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto fez um acesso ao sistema mutue aeroporto as 06 horas 10 minutos e 00 segundos', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/empresa/anulacao/fatura/novo', 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', NULL, '2024-03-13 17:10:00', '2024-03-13 17:10:00', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.marcas
CREATE TABLE IF NOT EXISTS `marcas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) DEFAULT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_marcas_empresas` (`empresa_id`),
  KEY `FK_marcas_canais_comunicacoes` (`canal_id`),
  KEY `FK_marcas_status_gerais` (`status_id`),
  KEY `FK_marcas_users` (`user_id`),
  CONSTRAINT `FK_marcas_canais_comunicacoes` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_marcas_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_marcas_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_marcas_users` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.marcas: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.migrations: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.modelo_documento_ativo
CREATE TABLE IF NOT EXISTS `modelo_documento_ativo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modelo_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_modelo_documento_ativo_modelo_facturas` (`modelo_id`),
  KEY `FK_modelo_documento_ativo_empresas` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.modelo_documento_ativo: ~0 rows (aproximadamente)
INSERT INTO `modelo_documento_ativo` (`id`, `modelo_id`, `empresa_id`) VALUES
	(1, 2, 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.modelo_facturas
CREATE TABLE IF NOT EXISTS `modelo_facturas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `nome_jasper` varchar(255) NOT NULL,
  `name_pdf` varchar(255) NOT NULL,
  `formato` enum('A4','A5','TICKET') NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `obs` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_modelo_facturas_user` (`user_id`),
  KEY `FK_modelo_facturas_canal` (`canal_id`),
  KEY `FK_modelo_facturas_status` (`status_id`),
  CONSTRAINT `FK_modelo_facturas_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_modelo_facturas_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_modelo_facturas_user` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.modelo_facturas: ~5 rows (aproximadamente)
INSERT INTO `modelo_facturas` (`id`, `designacao`, `nome_jasper`, `name_pdf`, `formato`, `user_id`, `canal_id`, `status_id`, `created_at`, `updated_at`, `obs`) VALUES
	(1, 'Default', 'FacturaDefaultA4', 'upload/documentos/empresa/modelosFacturas/a4/defaultPDF.pdf', 'A4', NULL, 2, 1, '2021-09-01 10:11:36', '2021-09-01 10:11:40', NULL),
	(2, 'Winmarket', 'Winmarket', 'upload/documentos/empresa/modelosFacturas/a4/winmarketPDF.pdf', 'A4', NULL, 2, 1, '2021-09-01 10:11:36', '2021-09-01 10:11:40', NULL),
	(3, 'Tabelado', 'FacturasTabeladas', 'upload/documentos/empresa/modelosFacturas/a4/facturaTabeladasPDF.pdf', 'A4', NULL, 2, 1, '2021-09-01 10:11:36', '2021-09-01 10:11:40', NULL),
	(4, 'Moduseasy', 'Moduseasy', 'upload/documentos/empresa/modelosFacturas/a4/ModuseasyPDF.pdf', 'A4', NULL, 2, 1, '2021-09-01 10:11:36', '2021-09-01 10:11:40', NULL),
	(5, 'Modelo aluno', 'Modelo aluno', 'upload/documentos/empresa/modelosFacturas/a4/ModuseasyPDF.pdf', 'A4', NULL, 2, 1, '2021-09-01 10:11:36', '2021-09-01 10:11:40', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.model_has_permissions: ~47 rows (aproximadamente)
INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\empresa\\User', 1),
	(14, 'App\\Models\\empresa\\User', 1),
	(12, 'App\\Models\\empresa\\User', 747),
	(4, 'App\\Models\\empresa\\User', 749),
	(4, 'App\\Models\\empresa\\User', 750),
	(5, 'App\\Models\\empresa\\User', 750),
	(8, 'App\\Models\\empresa\\User', 750),
	(9, 'App\\Models\\empresa\\User', 750),
	(10, 'App\\Models\\empresa\\User', 750),
	(11, 'App\\Models\\empresa\\User', 750),
	(14, 'App\\Models\\empresa\\User', 750),
	(16, 'App\\Models\\empresa\\User', 750),
	(17, 'App\\Models\\empresa\\User', 750),
	(20, 'App\\Models\\empresa\\User', 750),
	(4, 'App\\Models\\empresa\\User', 751),
	(5, 'App\\Models\\empresa\\User', 751),
	(8, 'App\\Models\\empresa\\User', 751),
	(9, 'App\\Models\\empresa\\User', 751),
	(10, 'App\\Models\\empresa\\User', 751),
	(11, 'App\\Models\\empresa\\User', 751),
	(14, 'App\\Models\\empresa\\User', 751),
	(15, 'App\\Models\\empresa\\User', 751),
	(16, 'App\\Models\\empresa\\User', 751),
	(17, 'App\\Models\\empresa\\User', 751),
	(18, 'App\\Models\\empresa\\User', 751),
	(19, 'App\\Models\\empresa\\User', 751),
	(20, 'App\\Models\\empresa\\User', 751),
	(1, 'App\\Models\\empresa\\User', 753),
	(2, 'App\\Models\\empresa\\User', 753),
	(3, 'App\\Models\\empresa\\User', 753),
	(4, 'App\\Models\\empresa\\User', 753),
	(5, 'App\\Models\\empresa\\User', 753),
	(6, 'App\\Models\\empresa\\User', 753),
	(7, 'App\\Models\\empresa\\User', 753),
	(8, 'App\\Models\\empresa\\User', 753),
	(9, 'App\\Models\\empresa\\User', 753),
	(10, 'App\\Models\\empresa\\User', 753),
	(11, 'App\\Models\\empresa\\User', 753),
	(12, 'App\\Models\\empresa\\User', 753),
	(14, 'App\\Models\\empresa\\User', 753),
	(15, 'App\\Models\\empresa\\User', 753),
	(16, 'App\\Models\\empresa\\User', 753),
	(17, 'App\\Models\\empresa\\User', 753),
	(18, 'App\\Models\\empresa\\User', 753),
	(19, 'App\\Models\\empresa\\User', 753),
	(20, 'App\\Models\\empresa\\User', 753),
	(21, 'App\\Models\\empresa\\User', 753);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.model_has_roles: ~0 rows (aproximadamente)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\empresa\\User', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.moedas
CREATE TABLE IF NOT EXISTS `moedas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `cambio` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.moedas: ~3 rows (aproximadamente)
INSERT INTO `moedas` (`id`, `designacao`, `codigo`, `cambio`) VALUES
	(1, 'AOA', 'AOA', 1),
	(2, 'USD', 'USD', 1),
	(3, 'EURO', 'EURO', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.motivo
CREATE TABLE IF NOT EXISTS `motivo` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigoMotivo` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `codigoStatus` int(10) unsigned NOT NULL DEFAULT '0',
  `canal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_motivo_canais_comunicacoes` (`canal_id`),
  KEY `FK_motivo_users` (`user_id`),
  KEY `FK_motivo_status_gerais` (`status_id`),
  CONSTRAINT `FK_motivo_canais_comunicacoes` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_motivo_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.motivo: ~39 rows (aproximadamente)
INSERT INTO `motivo` (`codigo`, `codigoMotivo`, `descricao`, `codigoStatus`, `canal_id`, `user_id`, `status_id`, `created_at`, `updated_at`, `empresa_id`) VALUES
	(7, 'M04', 'IVA – Regime de Exclusão', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(8, 'M02', 'Transmissão de bens e serviço não sujeita', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(9, 'M00', 'IVA - Regime Simplificado', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(10, 'M10', 'Isento nos termos da alínea a) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(11, 'M11', 'Isento nos termos da alínea b) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(12, 'M12', 'Isento nos termos da alínea c) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(13, 'M13', 'Isento nos termos da alínea d) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(14, 'M14', 'Isento nos termos da alínea e) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(15, 'M15', 'Isento nos termos da alínea f) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(16, 'M16', 'Isento nos termos da alínea g) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(17, 'M17', 'Isento nos termos da alínea h) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(18, 'M18', 'Isento nos termos da alínea i) do nº1 artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(19, 'M19', 'Isento nos termos da alínea j) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(20, 'M20', '0 Isento nos termos da alínea k) do nº1 do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(21, 'M21', 'Isento nos termos da alínea l) do nº1 do artigo 12.º do CIVA\r\n', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(22, 'M22', 'Isento nos termos da alínea m) do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(23, 'M23', 'Isento nos termos da alínea n) do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(24, 'M24', 'Isento nos termos da alínea 0) do artigo 12.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(25, 'M80', 'Isento nos termos da alínea a) do nº1 do artigo 14.º ', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(26, 'M81', 'Isento nos termos da alínea b) do nº1 do artigo 14.º ', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(27, 'M82', 'Isento nos termos da alínea c) do nº1 do artigo 14.º ', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(28, 'M83', 'Isento nos termos da alínea d) do nº1 do artigo 14.º ', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(29, 'M84', 'Isento nos termos da alínea e) do nº1 do artigo 14.º ', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(30, 'M85', 'Isento nos termos da alínea a) do nº2 do artigo 14.º', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(31, 'M86', 'Isento nos termos da alínea b) do nº2 do artigo 14.º', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(32, 'M30', 'Isento nos termos da alínea a) do artigo 15.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(33, 'M31', 'Isento nos termos da alínea b) do artigo 15.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(34, 'M32', 'Isento nos termos da alínea c) do artigo 15.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(35, 'M33', 'Isento nos termos da alínea d) do artigo 15.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(36, 'M34', 'Isento nos termos da alínea e) do artigo 15.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(37, 'M35', 'Isento nos termos da alínea f) do artigo 15.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(38, 'M36', 'Isento nos termos da alínea g) do artigo 15.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(39, 'M37', 'Isento nos termos da alínea h) do artigo 15.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(40, 'M38', 'Isento nos termos da alínea i) do artigo 15.º do CIVA', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(41, 'M90', 'Isento nos termos da alínea a) do nº1 do artigo 16.º', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(42, 'M91', 'Isento nos termos da alínea b) do nº1 do artigo 16.º', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(43, 'M92', 'Isento nos termos da alínea c) do nº1 do artigo 16.º', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(44, 'M93', 'Isento nos termos da alínea d) do nº1 do artigo 16.º', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(45, 'M94', 'Isento nos termos da alínea e) do nº1 do artigo 16.º', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.municipios_
CREATE TABLE IF NOT EXISTS `municipios_` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) DEFAULT NULL,
  `cidade_id` bigint(20) unsigned NOT NULL DEFAULT '4',
  `status_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_municipios__provincia_id` (`cidade_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.municipios_: ~9 rows (aproximadamente)
INSERT INTO `municipios_` (`id`, `designacao`, `cidade_id`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Luanda', 1, 1, '2023-09-01 11:11:35', '2023-09-28 09:40:19', NULL),
	(2, 'Belas', 1, 1, '2023-09-01 17:34:16', '2023-09-28 10:19:29', NULL),
	(3, 'Quissama', 1, 1, '2023-09-05 15:37:21', '2023-11-25 08:23:31', NULL),
	(4, 'Cacuaco', 1, 1, '2023-09-05 15:37:21', '2023-11-25 08:23:39', NULL),
	(5, 'Kilamba Kiaxi', 1, 1, '2023-09-05 15:37:21', '2023-11-25 08:23:48', NULL),
	(6, 'Cazenga', 1, 1, '2023-09-05 15:37:21', '2023-11-25 08:23:55', NULL),
	(7, 'Viana', 1, 1, '2023-09-05 15:37:21', '2023-11-25 08:24:10', NULL),
	(8, 'Ícolo e Bengo', 1, 1, '2023-11-25 08:24:25', '2023-11-25 08:24:51', NULL),
	(9, 'Talatona', 1, 1, '2023-11-25 08:24:45', '2023-11-25 08:24:55', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.notas_creditos
CREATE TABLE IF NOT EXISTS `notas_creditos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `facturaId` int(11) DEFAULT NULL,
  `reciboId` int(11) DEFAULT NULL,
  `numDoc` varchar(200) NOT NULL,
  `hash` text NOT NULL,
  `hashTexto` text NOT NULL,
  `numSequencia` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `empresaId` int(11) NOT NULL,
  `descricao` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `notas_creditos_facturas_id_fk2` (`facturaId`) USING BTREE,
  KEY `notas_creditos_facturas_id_fk` (`numDoc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.notas_creditos: ~6 rows (aproximadamente)
INSERT INTO `notas_creditos` (`id`, `uuid`, `facturaId`, `reciboId`, `numDoc`, `hash`, `hashTexto`, `numSequencia`, `userId`, `empresaId`, `descricao`, `created_at`, `updated_at`) VALUES
	(3, '75b16350-44b8-4e6a-bbe0-135a18e81522', 93, NULL, 'NC ATO2024/1', 'kl0gjH+2AcKTuoKo44XVrwUfYpmrZQmn2z9TfAcKs+pWjalyQhVB5IOpI7UQqBey8hv3fBbcwdmQwdycRnBnxRopFE5kGAhL972XB+vuS6BzznJYRxkiaHhXxqOlRz6QDtQnuatw5R5/fDx75cbnjdqN/ac3AXMVz02HHr30JF0=', '2024-03-13;2024-03-13T16:33:54;NC ATO2024/1;330690.80;', 1, 1, 1, NULL, '2024-03-13 15:33:54', '2024-03-13 15:33:54'),
	(4, '33f6ea25-185c-4f36-855a-b4340755dfce', 98, NULL, 'NC ATO2024/2', 'Gq04YIsAjFOIvY3YKKWYV3VcEQH4XHCoD3egfegj9p+zvOc8xg4ss0DD4SNDzDjUR6HLW+0COh/z+HUiGw1CARifbP8sAv3+S6zYqEnlqq3G8/ccfRMUxQe38ovaZg3jcXOJlsksbFSEhR7brPj/mQxyASieZXW9jVfEM2MTmHw=', '2024-03-13;2024-03-13T17:16:57;NC ATO2024/2;3245792.43;kl0gjH+2AcKTuoKo44XVrwUfYpmrZQmn2z9TfAcKs+pWjalyQhVB5IOpI7UQqBey8hv3fBbcwdmQwdycRnBnxRopFE5kGAhL972XB+vuS6BzznJYRxkiaHhXxqOlRz6QDtQnuatw5R5/fDx75cbnjdqN/ac3AXMVz02HHr30JF0=', 2, 1, 1, 'TESTE', '2024-03-13 16:16:57', '2024-03-13 16:16:57'),
	(5, '33490792-0746-44ec-96d0-61d248ae2ee8', NULL, 1, 'NC ATO2024/3', 'CQy8L/FBAjYnUBHEyNJfqmL+eVDrStJBcbjW2ASTCpB5I1wa007LaDfB2pVk8vQ1veDF6JQ9io7zQWUKeM9GQ/nYG11+YTwIwUTZ65T/3g2u4MI92xPKKZiBUk2a9vBF011+gT4DWCfDcIZa3LJT9UCZdbtleB00YcCdh7AsrBs=', '2024-03-13;2024-03-13T17:26:30;NC ATO2024/3;1072713.72;Gq04YIsAjFOIvY3YKKWYV3VcEQH4XHCoD3egfegj9p+zvOc8xg4ss0DD4SNDzDjUR6HLW+0COh/z+HUiGw1CARifbP8sAv3+S6zYqEnlqq3G8/ccfRMUxQe38ovaZg3jcXOJlsksbFSEhR7brPj/mQxyASieZXW9jVfEM2MTmHw=', 3, 1, 1, 'testefdafdafd', '2024-03-13 16:26:30', '2024-03-13 16:26:30'),
	(6, '0373b6d7-f9f7-4e2e-89ed-53ef664c2db2', 94, NULL, 'NC ATO2024/4', 'Z6bOrQdKAmPuI/8itZk4f6dUMPZiupdz99hF74E2KgNfK3OkuZ4kLeZs5duhxWO/DCjntgowphSDAGzxDLd3i8bf45Jos45VQzlNUtWyvLHVCS2zmHoJaSkNgz/lq173hXWt39rwCBqxZZ5/Rx5Mu4uK0uTmXxxG0cHBQHtJDU0=', '2024-03-13;2024-03-13T17:54:24;NC ATO2024/4;330690.80;CQy8L/FBAjYnUBHEyNJfqmL+eVDrStJBcbjW2ASTCpB5I1wa007LaDfB2pVk8vQ1veDF6JQ9io7zQWUKeM9GQ/nYG11+YTwIwUTZ65T/3g2u4MI92xPKKZiBUk2a9vBF011+gT4DWCfDcIZa3LJT9UCZdbtleB00YcCdh7AsrBs=', 4, 1, 1, NULL, '2024-03-13 16:54:24', '2024-03-13 16:54:24'),
	(7, '2231e469-8f72-468a-906f-83837161a89c', NULL, 2, 'NC ATO2024/5', 's2UDG9jvR739S8nUNbTMOCpZxY2nB8cd9lmUCOXOKubdZh1sfzhKV8KKP79EB7Kmd1T79vPhd3X8Q8WfOaQdYS9FY/wwTiALnk91eCuF1anoEPNOcOQkTiMLIZynd+dnfXRbbSsMf7oXhbiHRneaAIQWHQO8iWTKvohTnJmqasU=', '2024-03-13;2024-03-13T17:57:34;NC ATO2024/5;1383704.79;Z6bOrQdKAmPuI/8itZk4f6dUMPZiupdz99hF74E2KgNfK3OkuZ4kLeZs5duhxWO/DCjntgowphSDAGzxDLd3i8bf45Jos45VQzlNUtWyvLHVCS2zmHoJaSkNgz/lq173hXWt39rwCBqxZZ5/Rx5Mu4uK0uTmXxxG0cHBQHtJDU0=', 5, 1, 1, NULL, '2024-03-13 16:57:34', '2024-03-13 16:57:34'),
	(8, '96d35a28-2480-49ed-8c60-6d63745a28a1', 95, NULL, 'NC ATO2024/6', 'qYMpvyLOqagCbCyT3rwYDwaM4gpy6X6//SmIu2ucH22iPXVuHN/nRPbPXM4eqa9OxKAH2FpFkQZu38ScvLZAG9QIPUcHlEk3+iKvoMnZ9r1/mfBP9uuWp58KX7CYM6poIXx/X9uwXI7bYxu3Yk15+9heaKZGRa4yqg9eEiai/1s=', '2024-03-13;2024-03-13T18:09:06;NC ATO2024/6;330690.80;s2UDG9jvR739S8nUNbTMOCpZxY2nB8cd9lmUCOXOKubdZh1sfzhKV8KKP79EB7Kmd1T79vPhd3X8Q8WfOaQdYS9FY/wwTiALnk91eCuF1anoEPNOcOQkTiMLIZynd+dnfXRbbSsMf7oXhbiHRneaAIQWHQO8iWTKvohTnJmqasU=', 6, 1, 1, NULL, '2024-03-13 17:09:06', '2024-03-13 17:09:06'),
	(9, '830bb961-3d49-4766-9197-e9573aed4b9c', 104, NULL, 'NC ATO2024/7', 'gf1BuRNMOAN8m7NTTuuXpy2fe5VkYmpx6XykJVwyRL0DkGrVDefsaDMBM1bM+Xv2F/hqe/w8K5ARpKdw5TEzl8b98B+Z9JxgzE10YtxbmWzO8f7Tf44NJO2zRle1dqPAgUq11qxN6nziu4BqJD8O5mvT4uIin0XKb0ESUJ9tbP8=', '2024-03-13;2024-03-13T18:10:00;NC ATO2024/7;2201906.77;qYMpvyLOqagCbCyT3rwYDwaM4gpy6X6//SmIu2ucH22iPXVuHN/nRPbPXM4eqa9OxKAH2FpFkQZu38ScvLZAG9QIPUcHlEk3+iKvoMnZ9r1/mfBP9uuWp58KX7CYM6poIXx/X9uwXI7bYxu3Yk15+9heaKZGRa4yqg9eEiai/1s=', 7, 1, 1, NULL, '2024-03-13 17:10:00', '2024-03-13 17:10:00');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.notas_debito_clientes
CREATE TABLE IF NOT EXISTS `notas_debito_clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `cliente_id` int(10) unsigned NOT NULL,
  `numeracaoNotaDebito` varchar(255) NOT NULL,
  `valor_debito` double NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `numSequenciaNotaDebito` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `valor_extenso` varchar(345) DEFAULT NULL,
  `tipo_user_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hash` varchar(355) DEFAULT NULL,
  `nome_do_cliente` varchar(255) DEFAULT NULL,
  `telefone_cliente` varchar(255) DEFAULT NULL,
  `nif_cliente` varchar(255) DEFAULT NULL,
  `email_cliente` varchar(255) DEFAULT NULL,
  `endereco_cliente` varchar(255) DEFAULT NULL,
  `conta_corrente_cliente` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notas_debito_clientes_empresas` (`empresa_id`),
  KEY `FK_notas_debito_clientes_clientes` (`cliente_id`),
  KEY `FK_notas_debito_clientes_tipo_users` (`tipo_user_id`),
  CONSTRAINT `FK_notas_debito_clientes_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_notas_debito_clientes_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_notas_debito_clientes_tipo_users` FOREIGN KEY (`tipo_user_id`) REFERENCES `tipo_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.notas_debito_clientes: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.notas_entregas
CREATE TABLE IF NOT EXISTS `notas_entregas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numeracao_documento` varchar(100) NOT NULL,
  `operador_nome` varchar(255) NOT NULL,
  `operador_id` int(11) NOT NULL,
  `factura_id` bigint(20) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.notas_entregas: ~3 rows (aproximadamente)
INSERT INTO `notas_entregas` (`id`, `numeracao_documento`, `operador_nome`, `operador_id`, `factura_id`, `empresa_id`, `created_at`, `updated_at`) VALUES
	(8, 'FR RR2023/69', 'Mutue Negócio Teste Mobile', 35, 32792, 53, '2023-10-16 15:36:09', '2023-10-16 15:36:09'),
	(9, 'FR RR2023/78', 'Mutue Negócio Teste Mobile', 35, 32875, 53, '2023-10-24 18:02:19', '2023-10-24 18:02:19'),
	(10, 'FR RR2023/79', 'Mutue Negócio Teste Mobile', 35, 32970, 53, '2023-10-25 14:21:32', '2023-10-25 14:21:32');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.nota_credito_items
CREATE TABLE IF NOT EXISTS `nota_credito_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao_produto` varchar(250) DEFAULT '0',
  `preco_compra_produto` double DEFAULT '0',
  `preco_venda_produto` double NOT NULL DEFAULT '0',
  `quantidade_produto` int(10) unsigned NOT NULL,
  `desconto_produto` double DEFAULT '0',
  `incidencia_produto` double NOT NULL,
  `retencao_produto` double NOT NULL DEFAULT '0',
  `iva_produto` double NOT NULL DEFAULT '0',
  `total_preco_produto` double NOT NULL DEFAULT '0',
  `produto_id` int(10) unsigned NOT NULL,
  `factura_id` int(10) unsigned NOT NULL,
  `codigoNotaCredito` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_factura_items_factura` (`factura_id`),
  KEY `FK_factura_items_produtos` (`produto_id`),
  KEY `FK_nota_credito_items_notas_credito` (`codigoNotaCredito`),
  CONSTRAINT `FK_nota_credito_items_notas_credito` FOREIGN KEY (`codigoNotaCredito`) REFERENCES `notas_credito` (`id`),
  CONSTRAINT `nota_credito_items_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `nota_credito_items_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.nota_credito_items: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `canal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.notifications: ~4 rows (aproximadamente)
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`, `empresa_id`, `canal_id`) VALUES
	('5cd6174c-1833-4718-b863-ba0c9326052d', 'App\\Notifications\\AtivacaoLicenca', 'App\\Models\\empresa\\Empresa_Cliente', 109, '{"notificacao":{"id":69,"licenca_id":2,"empresa_id":94,"pagamento_id":20,"data_inicio":"2021-10-27T09:29:53.000000Z","data_fim":"2021-11-27T09:29:53.000000Z","data_activacao":"2021-10-27T09:29:53.390872Z","user_id":1,"canal_id":2,"status_licenca_id":1,"created_at":"2021-10-27 10:23:52","updated_at":"2021-10-27 10:29:53","data_rejeicao":null,"observacao":"activo a licen\\u00e7a Mensal no dia 2021-10-27 10:29:53","data_notificaticao":null,"notificacaoFimLicenca":null,"licenca":{"id":2,"tipo_licenca_id":2,"designacao":"Mensal","status_licenca_id":1,"created_at":"2021-01-31 12:38:02","updated_at":"2021-01-31 15:49:18","canal_id":3,"user_id":1,"descricao":"Plano Mensal","valor":10000,"tipo_taxa_id":1,"limite_usuario":5,"tipo_licenca":{"id":2,"designacao":"Mensal"}},"empresa":{"id":94,"nome":"Jacinto Vicuya","pessoal_Contacto":"923041279","endereco":"Bairro Miru Viana","empresa_id":null,"pais_id":1,"saldo":0,"nif":"005196135kS044","gestor_cliente_id":1,"tipo_cliente_id":2,"tipo_regime_id":3,"logotipo":"utilizadores\\/cliente\\/avatarEmpresa.png","website":null,"email":"gabrieljacinto@gmail.com","referencia":"MMT21J7","pessoa_de_contacto":null,"status_id":1,"canal_id":3,"user_id":null,"created_at":"2021-08-19 16:18:26","updated_at":"2021-08-19 16:18:26","cidade":"Luanda","file_alvara":null,"file_nif":null}},"empresa":"F\\u00c1BRICA DE SOFTWARES  LDA","mensagem":"Foi activo uma nova licen\\u00e7a Mensal em sua conta ","descricao":"A empresa F\\u00c1BRICA DE SOFTWARES  LDA activou uma licen\\u00e7a Mensal em sua conta, sendo assim a contagem da sua licen\\u00e7a inicia no dia 27-10-2021 at\\u00e9 o  dia 27-11-2021"}', NULL, '2021-10-27 10:29:54', '2021-10-27 10:29:54', NULL, NULL),
	('91234d38-0996-4c8c-b64c-6a4fdeef8595', 'App\\Notifications\\AtivacaoLicenca', 'App\\Models\\empresa\\Empresa_Cliente', 53, '{"notificacao":{"id":56,"licenca_id":2,"empresa_id":38,"pagamento_id":19,"data_inicio":"2021-10-21T15:29:00.000000Z","data_fim":"2021-11-21T15:29:00.000000Z","data_activacao":"2021-09-23T15:29:00.546031Z","user_id":1,"canal_id":2,"status_licenca_id":1,"created_at":"2021-09-23 16:24:44","updated_at":"2021-09-23 16:29:00","data_rejeicao":null,"observacao":"activo a licen\\u00e7a Mensal no dia 2021-09-23 16:29:00","data_notificaticao":null,"notificacaoFimLicenca":null,"licenca":{"id":2,"tipo_licenca_id":2,"designacao":"Mensal","status_licenca_id":1,"created_at":"2021-01-31 12:38:02","updated_at":"2021-01-31 15:49:18","canal_id":3,"user_id":1,"descricao":"Plano Mensal","valor":10000,"tipo_taxa_id":1,"limite_usuario":5,"tipo_licenca":{"id":2,"designacao":"Mensal"}},"empresa":{"id":38,"nome":"Mutue Neg\\u00f3cio Teste Mobile","pessoal_Contacto":"999999999","endereco":"Luanda","empresa_id":null,"pais_id":1,"saldo":0,"nif":"999999999","gestor_cliente_id":1,"tipo_cliente_id":2,"tipo_regime_id":2,"logotipo":"utilizadores\\/cliente\\/O5sB8nzuIxoaiFAAsiyyMrSUCmc9ovDVCrFVRwVO.png","website":null,"email":"mutuemobile@gmail.com","referencia":"5VA9C58","pessoa_de_contacto":null,"status_id":1,"canal_id":3,"user_id":null,"created_at":"2021-04-16 10:36:11","updated_at":"2021-04-26 14:03:13","cidade":"Luanda","file_alvara":"documentos\\/empresa\\/documentos\\/C7quc6x6QB3pdcWhQZuh7rgKHA3UOnAiCzYufyaO.pdf","file_nif":"documentos\\/empresa\\/documentos\\/2McsxTfjst7do5jcAEZZwdtcQg0UR229SJvW5Rg6.pdf"}},"empresa":"F\\u00c1BRICA DE SOFTWARES  LDA","mensagem":"Foi activo uma nova licen\\u00e7a Mensal em sua conta ","descricao":"A empresa F\\u00c1BRICA DE SOFTWARES  LDA activou uma licen\\u00e7a Mensal em sua conta, sendo assim a contagem da sua licen\\u00e7a inicia no dia 21-10-2021 at\\u00e9 o  dia 21-11-2021"}', '2023-02-20 21:40:23', '2021-09-23 16:29:03', '2023-02-20 21:40:23', NULL, NULL),
	('b14647d0-5e48-4e3c-a0b0-a85440782250', 'App\\Notifications\\AtivacaoLicenca', 'App\\Models\\empresa\\Empresa_Cliente', 53, '{"notificacao":{"id":88,"licenca_id":3,"empresa_id":38,"pagamento_id":22,"data_inicio":"2022-06-01T10:50:06.000000Z","data_fim":"2023-06-01T10:50:06.000000Z","data_activacao":"2022-06-01T10:50:06.470413Z","user_id":1,"canal_id":2,"status_licenca_id":1,"created_at":"2022-06-01 10:44:06","updated_at":"2022-06-01 11:50:06","data_rejeicao":null,"observacao":"activo a licen\\u00e7a Anual no dia 2022-06-01 11:50:06","data_notificaticao":null,"notificacaoFimLicenca":null,"licenca":{"id":3,"tipo_licenca_id":3,"designacao":"Anual","status_licenca_id":1,"created_at":"2021-01-31 12:38:41","updated_at":"2021-04-28 15:23:10","canal_id":3,"user_id":1,"descricao":"Plano Anual","valor":50000,"tipo_taxa_id":1,"limite_usuario":50,"tipo_licenca":{"id":3,"designacao":"Anual"}},"empresa":{"id":38,"nome":"Mutue Neg\\u00f3cio Teste Mobile","pessoal_Contacto":"999999999","endereco":"Luanda","empresa_id":null,"pais_id":1,"saldo":0,"nif":"999999999","gestor_cliente_id":1,"tipo_cliente_id":2,"tipo_regime_id":2,"logotipo":"utilizadores\\/cliente\\/O5sB8nzuIxoaiFAAsiyyMrSUCmc9ovDVCrFVRwVO.png","website":null,"email":"mutuemobile@gmail.com","referencia":"5VA9C58","pessoa_de_contacto":null,"status_id":1,"canal_id":3,"user_id":null,"created_at":"2021-04-16 10:36:11","updated_at":"2021-04-26 14:03:13","cidade":"Luanda","file_alvara":"documentos\\/empresa\\/documentos\\/C7quc6x6QB3pdcWhQZuh7rgKHA3UOnAiCzYufyaO.pdf","file_nif":"documentos\\/empresa\\/documentos\\/2McsxTfjst7do5jcAEZZwdtcQg0UR229SJvW5Rg6.pdf","licenca":"ativo"}},"empresa":"MUTUE SOLU\\u00c7\\u00d5ES TECNOL\\u00d3GICAS INTELIGENTES LDA","mensagem":"Foi activo uma nova licen\\u00e7a Anual em sua conta ","descricao":"A empresa MUTUE SOLU\\u00c7\\u00d5ES TECNOL\\u00d3GICAS INTELIGENTES LDA activou uma licen\\u00e7a Anual em sua conta, sendo assim a contagem da sua licen\\u00e7a inicia no dia 01-06-2022 at\\u00e9 o  dia 01-06-2023"}', '2023-02-15 10:11:13', '2022-06-01 11:50:08', '2023-02-15 10:11:13', NULL, NULL),
	('fc58fc52-bf4c-4b56-bcec-d77ee3adbc3e', 'App\\Notifications\\AtivacaoLicenca', 'App\\Models\\empresa\\Empresa_Cliente', 117, '{"notificacao":{"id":78,"licenca_id":3,"empresa_id":102,"pagamento_id":21,"data_inicio":"2022-01-03T09:09:50.000000Z","data_fim":"2023-01-03T09:09:50.000000Z","data_activacao":"2022-01-03T09:09:50.651663Z","user_id":1,"canal_id":2,"status_licenca_id":1,"created_at":"2022-01-03 10:07:38","updated_at":"2022-01-03 10:09:50","data_rejeicao":null,"observacao":"activo a licen\\u00e7a Anual no dia 2022-01-03 10:09:50","data_notificaticao":null,"notificacaoFimLicenca":null,"licenca":{"id":3,"tipo_licenca_id":3,"designacao":"Anual","status_licenca_id":1,"created_at":"2021-01-31 12:38:41","updated_at":"2021-04-28 15:23:10","canal_id":3,"user_id":1,"descricao":"Plano Anual","valor":50000,"tipo_taxa_id":1,"limite_usuario":50,"tipo_licenca":{"id":3,"designacao":"Anual"}},"empresa":{"id":102,"nome":"Domingos Ngola","pessoal_Contacto":"923963451","endereco":"Luanda","empresa_id":null,"pais_id":1,"saldo":0,"nif":"005406294KN041","gestor_cliente_id":1,"tipo_cliente_id":2,"tipo_regime_id":3,"logotipo":"utilizadores\\/cliente\\/avatarEmpresa.png","website":null,"email":"domingosgoncalves619@gmail.com","referencia":"RU1N11N","pessoa_de_contacto":null,"status_id":1,"canal_id":3,"user_id":null,"created_at":"2021-09-13 11:03:56","updated_at":"2021-09-13 11:03:56","cidade":"Luanda","file_alvara":null,"file_nif":null}},"empresa":"F\\u00c1BRICA DE SOFTWARES  LDA","mensagem":"Foi activo uma nova licen\\u00e7a Anual em sua conta ","descricao":"A empresa F\\u00c1BRICA DE SOFTWARES  LDA activou uma licen\\u00e7a Anual em sua conta, sendo assim a contagem da sua licen\\u00e7a inicia no dia 03-01-2022 at\\u00e9 o  dia 03-01-2023"}', NULL, '2022-01-03 10:09:50', '2022-01-03 10:09:50', NULL, NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.observacao_factura
CREATE TABLE IF NOT EXISTS `observacao_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observacao` text,
  `empresa_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_observacao_factura_empresas` (`empresa_id`),
  CONSTRAINT `FK_observacao_factura_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.observacao_factura: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.orderbyprodutos
CREATE TABLE IF NOT EXISTS `orderbyprodutos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  `designacao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.orderbyprodutos: ~4 rows (aproximadamente)
INSERT INTO `orderbyprodutos` (`id`, `valor`, `designacao`) VALUES
	(1, 'min', 'Menor preço'),
	(2, 'max', 'Maior preço'),
	(3, 'asc', 'Nome de Produto: A a Z'),
	(4, 'desc', 'Nome de Produto: Z a A');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.pagamentos
CREATE TABLE IF NOT EXISTS `pagamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `factura_id` int(10) unsigned NOT NULL,
  `valor` double NOT NULL,
  `data_envio` datetime NOT NULL,
  `data_validacao` datetime NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pagamentos_factura` (`factura_id`),
  KEY `FK_pagamentos_canal` (`canal_id`),
  KEY `FK_pagamentos_user` (`user_id`),
  KEY `FK_pagamentos_status` (`status_id`),
  CONSTRAINT `FK_pagamentos_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_pagamentos_factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `FK_pagamentos_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_pagamentos_user` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.pagamentos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.pagamentos_vendas_online
CREATE TABLE IF NOT EXISTS `pagamentos_vendas_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `codigo` varchar(255) NOT NULL,
  `bancoId` int(11) DEFAULT NULL,
  `empresaId` int(11) DEFAULT NULL,
  `dataPagamentoBanco` datetime DEFAULT NULL,
  `totalPagamento` double DEFAULT '0',
  `totalDesconto` double DEFAULT '0',
  `totalIva` double DEFAULT '0',
  `comprovativoBancario` varchar(255) DEFAULT NULL,
  `formaPagamentoId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `nomeUser` varchar(255) NOT NULL,
  `statusPagamentoId` int(11) NOT NULL DEFAULT '2' COMMENT '1-Validado, 2-Pendente, 3- Rejeitado',
  `enderecoEntrega` varchar(255) DEFAULT NULL,
  `nomeUserEntrega` varchar(255) NOT NULL,
  `apelidoUserEntrega` varchar(255) DEFAULT NULL,
  `pontoReferenciaEntrega` varchar(255) DEFAULT NULL,
  `telefoneUserEntrega` varchar(255) NOT NULL,
  `provinciaIdEntrega` bigint(20) unsigned DEFAULT '1',
  `comunaId` bigint(20) unsigned DEFAULT NULL,
  `taxaEntrega` double DEFAULT '0',
  `tipoEntregaId` int(11) DEFAULT '1',
  `operadorId` int(11) DEFAULT NULL,
  `emailEntrega` varchar(255) DEFAULT NULL,
  `numeroCartaoCliente` varchar(255) DEFAULT NULL,
  `observacaoEntrega` text,
  `motivoRejeicao` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estimativaEntrega` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_pagamentos_vendas_online_municipioEntrega_id` (`comunaId`),
  KEY `FK_pagamentos_vendas_online_provincias` (`provinciaIdEntrega`),
  CONSTRAINT `FK_pagamentos_vendas_online_municipioEntrega_id` FOREIGN KEY (`comunaId`) REFERENCES `municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pagamentos_vendas_online_provincias` FOREIGN KEY (`provinciaIdEntrega`) REFERENCES `cidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.pagamentos_vendas_online: ~2 rows (aproximadamente)
INSERT INTO `pagamentos_vendas_online` (`id`, `uuid`, `codigo`, `bancoId`, `empresaId`, `dataPagamentoBanco`, `totalPagamento`, `totalDesconto`, `totalIva`, `comprovativoBancario`, `formaPagamentoId`, `userId`, `nomeUser`, `statusPagamentoId`, `enderecoEntrega`, `nomeUserEntrega`, `apelidoUserEntrega`, `pontoReferenciaEntrega`, `telefoneUserEntrega`, `provinciaIdEntrega`, `comunaId`, `taxaEntrega`, `tipoEntregaId`, `operadorId`, `emailEntrega`, `numeroCartaoCliente`, `observacaoEntrega`, `motivoRejeicao`, `created_at`, `estimativaEntrega`, `updated_at`, `deleted_at`) VALUES
	(1, 'c15fa1ad-67f2-47f0-b24c-bae3f48a0274', '00001', 6, NULL, '2023-12-06 00:00:00', 7985, 0, 1117.9, 'comprovativosVendasOnline/Q8r570nojzwpsT1orJShyopyW9GaQke6HXQQTdhr.pdf', 4, 741, 'Ramos Soft', 2, NULL, 'Ramos Soft', 'Ramos Soft', NULL, '923292970', 1, NULL, 0, 2, 642, 'info@ramossoft.com', NULL, NULL, NULL, '2023-12-06 23:51:35', '2023-12-08 23:51:35', '2023-12-08 11:33:29', NULL),
	(2, 'e6aee384-6564-4789-b58b-be427b0d73ab', '00002', 6, NULL, '2024-01-11 00:00:00', 8266.25, 0, 1157.275, 'comprovativosVendasOnline/TlpevWPFeVtf1lA9mjtuJD7JqakqkwnHQHGWpRUk.pdf', 4, 741, 'Ramos Soft', 2, NULL, 'Ramos Soft', 'Ramos Soft', NULL, '923292970', 1, NULL, 0, 2, 638, 'info@ramossoft.com', NULL, NULL, NULL, '2024-01-11 13:03:18', '2024-01-13 13:03:18', '2024-01-24 16:19:00', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.pagamentos_vendas_online_itens
CREATE TABLE IF NOT EXISTS `pagamentos_vendas_online_itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `produtoId` int(11) NOT NULL,
  `precoVendaProduto` double NOT NULL DEFAULT '0',
  `nomeProduto` varchar(255) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT '1',
  `pagamentoVendasOnlineId` int(11) NOT NULL,
  `taxaIvaValor` double NOT NULL DEFAULT '0',
  `subtotal` double NOT NULL DEFAULT '0',
  `taxaIva` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_pagamentos_vendas_online_itens_pagamentos_vendas_online` (`pagamentoVendasOnlineId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.pagamentos_vendas_online_itens: ~4 rows (aproximadamente)
INSERT INTO `pagamentos_vendas_online_itens` (`id`, `uuid`, `produtoId`, `precoVendaProduto`, `nomeProduto`, `quantidade`, `pagamentoVendasOnlineId`, `taxaIvaValor`, `subtotal`, `taxaIva`) VALUES
	(1, '4866ecdb-87b2-4597-8b1f-c58016fdf2d5', 1051, 4610, 'BLOCO TOM.TRIPLA1.5 MT C/INT PRETA', 1, 1, 645.4, 4610, 14),
	(2, 'ad8082de-83a1-4556-a85a-05d7de87bffb', 1153, 3375, 'PEN DRIVE 32GB KINGSTON', 1, 1, 472.5, 3375, 14),
	(3, 'e19c8d13-7e9a-402d-a7e6-98c45ff4c7c3', 1510, 3372.5, 'CABO ALIMENT. PC 1.8 MT MANHT', 1, 2, 472.15, 3372.5, 14),
	(4, '067bd8a2-b788-43dc-99e2-6d7f455d53f6', 1047, 4893.75, 'BLOCO TOM.TRIPLA 1.5 MT C/INT BRANCA', 1, 2, 685.125, 4893.75, 14);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.pagamento_fornecedor
CREATE TABLE IF NOT EXISTS `pagamento_fornecedor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entrada_produto_id` int(10) unsigned NOT NULL,
  `dataPagamento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor` double NOT NULL,
  `formaPagamentoId` int(10) unsigned NOT NULL,
  `conta_fornecedor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fornecedor_id` int(11) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tipo_user_id` int(11) DEFAULT NULL,
  `nFactura` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `nextPagamento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pagamento_fornecedor_entradas_stocks` (`entrada_produto_id`),
  KEY `FK_pagamento_fornecedor_status_gerais` (`status_id`),
  KEY `FK_pagamento_fornecedor_fornecedores` (`fornecedor_id`),
  KEY `FK_pagamento_fornecedor_empresas` (`empresa_id`),
  KEY `FK_pagamento_fornecedor_formas_pagamentos_geral` (`formaPagamentoId`),
  CONSTRAINT `FK_pagamento_fornecedor_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_pagamento_fornecedor_entradas_stocks` FOREIGN KEY (`entrada_produto_id`) REFERENCES `entradas_stocks` (`id`),
  CONSTRAINT `FK_pagamento_fornecedor_formas_pagamentos_geral` FOREIGN KEY (`formaPagamentoId`) REFERENCES `formas_pagamentos_geral` (`id`),
  CONSTRAINT `FK_pagamento_fornecedor_fornecedores` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`),
  CONSTRAINT `FK_pagamento_fornecedor_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.pagamento_fornecedor: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.paises
CREATE TABLE IF NOT EXISTS `paises` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `indicativo` varchar(45) DEFAULT NULL,
  `moeda_id` int(10) unsigned DEFAULT NULL,
  `idioma_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.paises: ~207 rows (aproximadamente)
INSERT INTO `paises` (`id`, `designacao`, `sigla`, `indicativo`, `moeda_id`, `idioma_id`, `code`) VALUES
	(1, 'Angola', 'ANG', '+244', 1, 1, 'AO'),
	(2, 'Argélia', NULL, NULL, NULL, NULL, 'DZ'),
	(3, 'Brasil', NULL, NULL, NULL, NULL, 'BR'),
	(4, 'Alemanha', NULL, NULL, NULL, NULL, 'GM '),
	(5, 'Dinamarques', NULL, NULL, NULL, NULL, 'DK'),
	(6, 'França', NULL, NULL, NULL, NULL, 'FR '),
	(7, 'Canadá', NULL, NULL, NULL, NULL, 'CA'),
	(8, 'Itália', NULL, NULL, NULL, NULL, 'IT '),
	(10, 'Bélgica', NULL, NULL, NULL, NULL, 'BE '),
	(11, 'África do Sul', NULL, NULL, NULL, NULL, 'ZA'),
	(12, 'Espanha', NULL, NULL, NULL, NULL, 'SP '),
	(13, 'Venezuela', NULL, NULL, NULL, NULL, 'VE '),
	(16, 'Irlanda', NULL, NULL, NULL, NULL, 'EI '),
	(17, 'Moçambique', NULL, NULL, NULL, NULL, 'MZ '),
	(18, 'Áustria', NULL, NULL, NULL, NULL, 'AT'),
	(19, 'Costa Rica', NULL, NULL, NULL, NULL, 'CS '),
	(21, 'Marrocos', NULL, NULL, NULL, NULL, 'MA '),
	(22, 'Afeganistão', NULL, NULL, NULL, NULL, 'AF'),
	(23, 'Albania', NULL, NULL, NULL, NULL, 'AL'),
	(24, 'Andorra', NULL, NULL, NULL, NULL, 'AN'),
	(25, 'Angola', NULL, NULL, NULL, NULL, 'AO'),
	(26, 'Anguila', NULL, NULL, NULL, NULL, 'AV'),
	(27, 'Antárctica', NULL, NULL, NULL, NULL, 'AY'),
	(28, 'Antígua e Barbuda', NULL, NULL, NULL, NULL, 'AG'),
	(31, 'Argentina', NULL, NULL, NULL, NULL, 'AR'),
	(32, 'Arménia', NULL, NULL, NULL, NULL, 'AM'),
	(33, 'Aruba', NULL, NULL, NULL, NULL, 'AW'),
	(34, 'Austrália', NULL, NULL, NULL, NULL, 'AU'),
	(35, 'Azerbaijão', NULL, NULL, NULL, NULL, 'AZ'),
	(36, 'Bahamas', NULL, NULL, NULL, NULL, 'BS'),
	(37, 'Bangladesh', NULL, NULL, NULL, NULL, 'BD'),
	(38, 'Barbados', NULL, NULL, NULL, NULL, 'BB'),
	(40, 'Belize', NULL, NULL, NULL, NULL, 'BH '),
	(41, 'Benin', NULL, NULL, NULL, NULL, 'BN '),
	(42, 'Bermuda', NULL, NULL, NULL, NULL, 'BM'),
	(43, 'Bielorrússia', NULL, NULL, NULL, NULL, 'BO '),
	(44, 'Bolívia', NULL, NULL, NULL, NULL, 'BO'),
	(45, 'Bósnia e Herzegovina', NULL, NULL, NULL, NULL, 'BA'),
	(46, 'Botswana', NULL, NULL, NULL, NULL, 'BW'),
	(47, 'Brunei Darussalam', NULL, NULL, NULL, NULL, 'BX '),
	(48, 'Bulgária', NULL, NULL, NULL, NULL, 'BU '),
	(49, 'Burkina Faso', NULL, NULL, NULL, NULL, 'BF'),
	(50, 'Burundi', NULL, NULL, NULL, NULL, 'BI'),
	(51, 'Butão', NULL, NULL, NULL, NULL, 'BT '),
	(52, 'Cabo Verde', NULL, NULL, NULL, NULL, 'CV'),
	(53, 'Camarões', NULL, NULL, NULL, NULL, 'CM'),
	(54, 'Camboja', NULL, NULL, NULL, NULL, 'KH'),
	(56, 'Cazaquistão', NULL, NULL, NULL, NULL, 'KV'),
	(57, 'Centro-Africana (República)', NULL, NULL, NULL, NULL, 'CT '),
	(58, 'Chade', NULL, NULL, NULL, NULL, 'CD '),
	(59, 'Chile', NULL, NULL, NULL, NULL, 'CL '),
	(60, 'China', NULL, NULL, NULL, NULL, 'CH '),
	(61, 'Chipre', NULL, NULL, NULL, NULL, 'CY '),
	(63, 'Colômbia', NULL, NULL, NULL, NULL, 'CO '),
	(64, 'Comores', NULL, NULL, NULL, NULL, 'CN '),
	(65, 'Congo', NULL, NULL, NULL, NULL, 'CF '),
	(66, 'Congo (República Democrática do)', NULL, NULL, NULL, NULL, 'CG '),
	(69, 'Costa do Marfim', NULL, NULL, NULL, NULL, 'CI '),
	(70, 'Croácia', NULL, NULL, NULL, NULL, 'HR '),
	(71, 'Cuba', NULL, NULL, NULL, NULL, 'CU '),
	(72, 'Dinamarca', NULL, NULL, NULL, NULL, 'DA '),
	(73, 'Domínica', NULL, NULL, NULL, NULL, 'DO '),
	(74, 'Egipto', NULL, NULL, NULL, NULL, 'EG'),
	(75, 'El Salvador', NULL, NULL, NULL, NULL, 'SV'),
	(77, 'Equador', NULL, NULL, NULL, NULL, 'EC '),
	(78, 'Eritreia', NULL, NULL, NULL, NULL, 'ER'),
	(80, 'Eslovénia', NULL, NULL, NULL, NULL, 'SI '),
	(81, 'Estados Unidos', NULL, NULL, NULL, NULL, 'US '),
	(82, 'Estónia', NULL, NULL, NULL, NULL, 'EN '),
	(83, 'Etiópia', NULL, NULL, NULL, NULL, 'ET '),
	(84, 'Filipinas', NULL, NULL, NULL, NULL, 'RP '),
	(85, 'Finlândia', NULL, NULL, NULL, NULL, 'FI '),
	(86, 'Gabão', NULL, NULL, NULL, NULL, 'GB '),
	(87, 'Gâmbia', NULL, NULL, NULL, NULL, 'GA '),
	(88, 'Gana', NULL, NULL, NULL, NULL, 'GH '),
	(89, 'Geórgia', NULL, NULL, NULL, NULL, 'GG '),
	(90, 'Georgia do Sul e Ilhas Sandwich', NULL, NULL, NULL, NULL, 'SX '),
	(91, 'Gibraltar', NULL, NULL, NULL, NULL, 'GI '),
	(92, 'Granada', NULL, NULL, NULL, NULL, 'GJ '),
	(93, 'Grécia', NULL, NULL, NULL, NULL, 'GR '),
	(94, 'Gronelândia', NULL, NULL, NULL, NULL, 'GL '),
	(95, 'Guadalupe', NULL, NULL, NULL, NULL, 'GP '),
	(96, 'Guam', NULL, NULL, NULL, NULL, 'GQ '),
	(97, 'Guatemala', NULL, NULL, NULL, NULL, 'GT '),
	(98, 'Guiana', NULL, NULL, NULL, NULL, 'GY '),
	(99, 'Guiana Francesa', NULL, NULL, NULL, NULL, 'GF '),
	(100, 'Guiné', NULL, NULL, NULL, NULL, 'GV '),
	(101, 'Guiné Equatorial', NULL, NULL, NULL, NULL, 'EK '),
	(102, 'Guiné-Bissau', NULL, NULL, NULL, NULL, 'GW '),
	(103, 'Haiti', NULL, NULL, NULL, NULL, 'HA'),
	(104, 'Honduras', NULL, NULL, NULL, NULL, 'HO '),
	(105, 'Hong Kong', NULL, NULL, NULL, NULL, 'HK '),
	(106, 'Hungria', NULL, NULL, NULL, NULL, 'HU '),
	(107, 'Iémen', NULL, NULL, NULL, NULL, 'YM '),
	(112, 'Ilhas Cook', NULL, NULL, NULL, NULL, 'CW '),
	(113, 'Ilhas Falkland (Malvinas)', NULL, NULL, NULL, NULL, 'FK '),
	(117, 'Ilhas Marianas do Norte', NULL, NULL, NULL, NULL, 'CQ '),
	(118, 'Ilhas Marshall', NULL, NULL, NULL, NULL, 'RM'),
	(124, 'Índia', NULL, NULL, NULL, NULL, 'IN '),
	(125, 'Indonésia', NULL, NULL, NULL, NULL, 'ID '),
	(126, 'Irão (República Islâmica)', NULL, NULL, NULL, NULL, 'IR '),
	(127, 'Iraque', NULL, NULL, NULL, NULL, 'IZ '),
	(128, 'Islândia', NULL, NULL, NULL, NULL, 'IC '),
	(129, 'Israel', NULL, NULL, NULL, NULL, 'IS '),
	(130, 'Jamaica', NULL, NULL, NULL, NULL, 'JM '),
	(131, 'Japão', NULL, NULL, NULL, NULL, 'JP '),
	(133, 'Jordânia', NULL, NULL, NULL, NULL, 'JO '),
	(136, 'Kiribati', NULL, NULL, NULL, NULL, 'KR '),
	(137, 'Kuwait', NULL, NULL, NULL, NULL, 'KU '),
	(139, 'Lesoto', NULL, NULL, NULL, NULL, 'LT '),
	(140, 'Letónia', NULL, NULL, NULL, NULL, 'LG '),
	(141, 'Líbano', NULL, NULL, NULL, NULL, 'LE '),
	(142, 'Libéria', NULL, NULL, NULL, NULL, 'LI '),
	(143, 'Líbia (Jamahiriya Árabe da)', NULL, NULL, NULL, NULL, 'LY '),
	(144, 'Liechtenstein', NULL, NULL, NULL, NULL, 'LS '),
	(145, 'Lituânia', NULL, NULL, NULL, NULL, 'LH '),
	(146, 'Luxemburgo', NULL, NULL, NULL, NULL, 'LU '),
	(147, 'Macau', NULL, NULL, NULL, NULL, 'MC '),
	(148, 'Macedónia (antiga república jugoslava da)', NULL, NULL, NULL, NULL, 'MK '),
	(150, 'Malásia', NULL, NULL, NULL, NULL, 'MY '),
	(151, 'Malawi', NULL, NULL, NULL, NULL, 'MI '),
	(152, 'Maldivas', NULL, NULL, NULL, NULL, 'MV '),
	(153, 'Mali', NULL, NULL, NULL, NULL, 'ML '),
	(154, 'Malta', NULL, NULL, NULL, NULL, 'MT '),
	(155, 'Martinica', NULL, NULL, NULL, NULL, 'MB '),
	(157, 'Mauritânia', NULL, NULL, NULL, NULL, 'MR '),
	(158, 'Mayotte', NULL, NULL, NULL, NULL, 'MF '),
	(159, 'México', NULL, NULL, NULL, NULL, 'MX '),
	(160, 'Micronésia (Estados Federados da)', NULL, NULL, NULL, NULL, 'FM '),
	(162, 'Mónaco', NULL, NULL, NULL, NULL, 'MN '),
	(163, 'Mongólia', NULL, NULL, NULL, NULL, 'MG '),
	(165, 'Myanmar', NULL, NULL, NULL, NULL, 'BM '),
	(166, 'Namíbia', NULL, NULL, NULL, NULL, 'WA '),
	(167, 'Nauru', NULL, NULL, NULL, NULL, 'NR '),
	(168, 'Nepal', NULL, NULL, NULL, NULL, 'NP '),
	(169, 'Nicarágua', NULL, NULL, NULL, NULL, 'NU '),
	(170, 'Niger', NULL, NULL, NULL, NULL, 'NG '),
	(171, 'Nigéria', NULL, NULL, NULL, NULL, 'NI '),
	(172, 'Niue', NULL, NULL, NULL, NULL, 'NE '),
	(173, 'Noruega', NULL, NULL, NULL, NULL, 'NO '),
	(174, 'Nova Caledónia', NULL, NULL, NULL, NULL, 'NC '),
	(175, 'Nova Zelândia', NULL, NULL, NULL, NULL, 'NZ '),
	(176, 'Omã', NULL, NULL, NULL, NULL, 'MU '),
	(177, 'Países Baixos', NULL, NULL, NULL, NULL, 'NL '),
	(178, 'Palau', NULL, NULL, NULL, NULL, 'PS '),
	(179, 'Panamá', NULL, NULL, NULL, NULL, 'PM '),
	(181, 'Paquistão', NULL, NULL, NULL, NULL, 'PK '),
	(182, 'Paraguai', NULL, NULL, NULL, NULL, 'PA '),
	(183, 'Peru', NULL, NULL, NULL, NULL, 'PE '),
	(184, 'Pitcairn', NULL, NULL, NULL, NULL, 'PC '),
	(185, 'Polinésia Francesa', NULL, NULL, NULL, NULL, 'FP '),
	(186, 'Polónia', NULL, NULL, NULL, NULL, 'PL '),
	(187, 'Porto Rico', NULL, NULL, NULL, NULL, 'RQ '),
	(188, 'Portugal', NULL, NULL, NULL, NULL, 'PT '),
	(190, 'Reino Unido', NULL, NULL, NULL, NULL, 'UK '),
	(191, 'República Checa', NULL, NULL, NULL, NULL, 'EZ '),
	(192, 'República Dominicana', NULL, NULL, NULL, NULL, 'DR '),
	(193, 'Reunião', NULL, NULL, NULL, NULL, 'RE '),
	(194, 'Roménia', NULL, NULL, NULL, NULL, 'RO '),
	(195, 'Ruanda', NULL, NULL, NULL, NULL, 'RW '),
	(196, 'Rússia (Federação da)', NULL, NULL, NULL, NULL, 'RS '),
	(197, 'Samoa', NULL, NULL, NULL, NULL, 'WS '),
	(198, 'Samoa Americana', NULL, NULL, NULL, NULL, 'AQ '),
	(199, 'Santa Helena', NULL, NULL, NULL, NULL, 'SH '),
	(200, 'Santa Lúcia', NULL, NULL, NULL, NULL, 'ST '),
	(202, 'São Cristóvão e Nevis', NULL, NULL, NULL, NULL, 'KN'),
	(203, 'São Marino', NULL, NULL, NULL, NULL, 'SM'),
	(204, 'São Pedro e Miquelon', NULL, NULL, NULL, NULL, 'PM'),
	(205, 'São Tomé e Príncipe', NULL, NULL, NULL, NULL, 'TP '),
	(206, 'São Vicente e Granadinas', NULL, NULL, NULL, NULL, 'VC'),
	(208, 'Senegal', NULL, NULL, NULL, NULL, 'SG '),
	(209, 'Serra Leoa', NULL, NULL, NULL, NULL, 'SL'),
	(210, 'Seychelles', NULL, NULL, NULL, NULL, 'SE '),
	(211, 'Singapura', NULL, NULL, NULL, NULL, 'SN '),
	(212, 'Síria (República Árabe da)', NULL, NULL, NULL, NULL, 'SY '),
	(213, 'Somália', NULL, NULL, NULL, NULL, 'SO '),
	(214, 'Sri Lanka', NULL, NULL, NULL, NULL, 'CE '),
	(215, 'Suazilândia', NULL, NULL, NULL, NULL, 'SZ'),
	(216, 'Sudão', NULL, NULL, NULL, NULL, 'SU '),
	(217, 'Suécia', NULL, NULL, NULL, NULL, 'SW '),
	(218, 'Suiça', NULL, NULL, NULL, NULL, 'SR'),
	(219, 'Suriname', NULL, NULL, NULL, NULL, 'NS '),
	(220, 'Svålbard e a Ilha de Jan Mayen', NULL, NULL, NULL, NULL, 'SJ'),
	(221, 'Tailândia', NULL, NULL, NULL, NULL, 'TH'),
	(222, 'Taiwan (Província da China)', NULL, NULL, NULL, NULL, 'TW'),
	(223, 'Tajiquistão', NULL, NULL, NULL, NULL, 'TJ'),
	(224, 'Tanzânia, República Unida da', NULL, NULL, NULL, NULL, 'TZ '),
	(228, 'Timor Leste', NULL, NULL, NULL, NULL, 'TT '),
	(229, 'Togo', NULL, NULL, NULL, NULL, 'TO '),
	(230, 'Tokelau', NULL, NULL, NULL, NULL, 'TL'),
	(231, 'Tonga', NULL, NULL, NULL, NULL, 'TN '),
	(232, 'Trindade e Tobago', NULL, NULL, NULL, NULL, 'TT'),
	(233, 'Tunísia', NULL, NULL, NULL, NULL, 'TN'),
	(234, 'Turcos e Caicos (Ilhas)', NULL, NULL, NULL, NULL, 'TC'),
	(235, 'Turquemenistão', NULL, NULL, NULL, NULL, 'TX '),
	(236, 'Turquia', NULL, NULL, NULL, NULL, 'TR '),
	(237, 'Tuvalu', NULL, NULL, NULL, NULL, 'TV '),
	(238, 'Ucrânia', NULL, NULL, NULL, NULL, 'UP'),
	(239, 'Uganda', NULL, NULL, NULL, NULL, 'UG '),
	(240, 'Uruguai', NULL, NULL, NULL, NULL, 'UY '),
	(241, 'Usbequistão', NULL, NULL, NULL, NULL, 'UZ'),
	(242, 'Vanuatu', NULL, NULL, NULL, NULL, 'NH '),
	(243, 'Vietname', NULL, NULL, NULL, NULL, 'VM '),
	(244, 'Wallis e Futuna (Ilha)', NULL, NULL, NULL, NULL, 'WF '),
	(245, 'Zaire, ver Congo (República Democrática do)', NULL, NULL, NULL, NULL, 'CG '),
	(246, 'Zâmbia', NULL, NULL, NULL, NULL, 'ZM'),
	(247, 'Zimbabwe', NULL, NULL, NULL, NULL, 'ZW');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.parametros
CREATE TABLE IF NOT EXISTS `parametros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `valorSelects` varchar(45) DEFAULT NULL,
  `vida` int(10) unsigned DEFAULT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_parametros_empresas` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.parametros: ~17 rows (aproximadamente)
INSERT INTO `parametros` (`id`, `designacao`, `valor`, `valorSelects`, `vida`, `empresa_id`, `label`, `type`) VALUES
	(1, 'IMPRESSÃO A4', 'A4', 'A4,ticket,A5', 1, 1, 'tipoImpreensao', 'select'),
	(2, 'Nº Dias Vencimento Factura', NULL, NULL, 15, 1, 'n_dias_vencimento_factura', 'number'),
	(3, 'Nº Dias Vencimento Factura Proforma', NULL, NULL, 15, 1, 'n_dias_vencimento_factura_proforma', 'number'),
	(4, 'Multa factura', '10', NULL, 0, 1, 'multa_factura', 'number'),
	(5, 'Nº VIA DE IMPRESSÃO', '1', NULL, 1, 1, 'n_vias_de_impressao', 'number'),
	(6, 'Ano de faturação', '2024', NULL, NULL, 1, 'ano_de_faturacao', 'number'),
	(7, 'Valor do IVA aplicado', '14', NULL, NULL, 1, 'valor_iva_aplicado', 'number'),
	(8, 'Tarifa de estacionamento', '0.25', NULL, NULL, 1, 'tarifa_estacionamento', 'number'),
	(9, 'MOEDA ESTRANGEIRA USADA', 'USD', 'USD,EURO', NULL, 1, 'moeda_estrageira_usada', 'select'),
	(76, 'TARIFA DO LUMINOSO', '197.88', NULL, NULL, 1, 'tarifa_luminosa', 'number'),
	(77, 'TARIFA DE ABERTURA DO AEROPORTO', '546.94', NULL, NULL, 1, 'tarifa_abertura_aeroporto', 'number'),
	(78, 'HORA DE ABERTURA DO AEROPORTO', '07:00', NULL, NULL, 1, 'hora_abertura_aeroporto', 'time'),
	(79, 'HORA DO FECHO DO AEROPORTO', '19:00', NULL, NULL, 1, 'hora_fecho_aeroporto', 'time'),
	(80, 'Valor da retenção na fonte', '6.5', NULL, NULL, 1, 'valor_retencao_fonte', 'number'),
	(81, 'Nº SERIE DO DOCUMENTO', 'ATO', NULL, NULL, 1, 'numero_serie_documento', 'text'),
	(82, 'Tarifa de reabertura Comercial', '729.25', NULL, NULL, 1, 'tarifa_reabertura_comercial', 'number'),
	(83, 'Considerar 1h depois de 14min', 'SIM', 'SIM,NAO', NULL, 1, 'considerar1hdepois14min', 'select');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.parametro_impressao
CREATE TABLE IF NOT EXISTS `parametro_impressao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` enum('A4','A5','TICKET') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A4',
  `designacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vida` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empresa_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipoFolha` int(11) DEFAULT NULL COMMENT '1-A4;2-A5;3-TICKET',
  PRIMARY KEY (`id`),
  KEY `FK_parametro_impressao_empresas` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.parametro_impressao: ~7 rows (aproximadamente)
INSERT INTO `parametro_impressao` (`id`, `valor`, `designacao`, `vida`, `empresa_id`, `created_at`, `updated_at`, `tipoFolha`) VALUES
	(1, 'A4', 'IMPRESSÃO A4', 'A4', NULL, '2021-04-11 10:56:22', '2021-04-11 10:56:22', 1),
	(4, 'A4', 'IMPRESSÃO A4', 'A4', 47, '2021-04-12 01:21:18', '2021-04-12 01:21:18', 1),
	(5, 'TICKET', 'IMPRESSÃO TICKET', 'TICKET', 50, '2021-04-12 13:33:27', '2021-04-12 13:33:27', 3),
	(6, 'A4', 'IMPRESSÃO A4', 'A4', 53, '2021-04-29 14:32:47', '2021-05-24 12:05:17', 1),
	(7, 'A4', 'IMPRESSÃO A4', 'A4', 58, '2021-05-28 09:09:19', '2021-06-01 16:02:46', 1),
	(8, 'A4', 'IMPRESSÃO A4', 'A4', 156, '2022-08-26 10:41:27', '2022-08-26 10:41:27', 1),
	(9, 'TICKET', 'IMPRESSÃO TICKET', 'TICKET', 158, '2022-09-01 12:20:06', '2022-09-01 12:20:06', 3);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.password_resets: ~15 rows (aproximadamente)
INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
	(5, 'tatianacabral2804@gmail.com', '$2y$10$Ov6kKZlE9w7doYp9j0bpKeg0ETZKKbxzCDH0rna5pNDQt7//8jE2W', '2021-08-19 11:29:05'),
	(6, 'usdera7@gmail.com', '$2y$10$VxTdAYyBiWYUUH4PwJDiqOMhHKXY5ZLiPwW9ChJSCQv3B3twHB9.u', '2022-01-13 15:31:02'),
	(7, 'ludala06@gmail.com', '$2y$10$B9YaIBH59U1R9p4dkhsyNu4VHCbtDV.rExBQ49Rv4LMBKjHtnp3wG', '2022-05-20 11:56:05'),
	(10, 'organizacoesvini@gmail.com', '$2y$10$h95bp2H7W8bvXULFPtFnM.xTDUudDmBNjm8OZraKcMYKK/zN2mNKC', '2022-07-28 19:09:51'),
	(28, 'isacelestino.silva22@gmail.com', '$2y$10$vM6/9JZYXJY/l1KKzF.k6.7bwCwQ/lCjkccCNXEe01CDy6Im.FgOm', '2023-03-31 23:43:44'),
	(33, 'infoeatecnologia@gmail.com', '$2y$10$.B00ydosJFmhjrwv1H5sqerQYskotDZNj195dTR0z3KbXIH5fwikC', '2023-07-19 15:55:05'),
	(35, 'isabel.celestino@ramossoft.com', '$2y$10$vE2gSaWVqLbsoG/haTGxh.bMpPDb.Y.oBx.2C2HsAjEJyOFB9agU6', '2023-07-24 18:44:37'),
	(37, 'isabelcelestino31@gmail.com', '$2y$10$uqdRm5z6FfthPU0JPOfUR.6O/QwphDqNMAsVZX0S2XadDwkZ83Tyy', '2023-07-24 18:49:20'),
	(40, 'carlos21comercial@gmail.com', '$2y$10$.slBFQ7TAn7wa/3MTxtu6eNlFrdH5zcd6sWEY1g27nYAzmG95rVwC', '2023-09-15 18:17:06'),
	(58, 'electronimi666@gmail.com', '$2y$10$ch6wzMzSUUMt6ymCdGdFd.EImT5pExAkmgYK1wmEhvIxwvdTqzJJm', '2023-10-03 20:57:39'),
	(60, 'panpanflora873@gmail.com', '$2y$10$fkuNdP8gyg342RSTJk4jgOr.9.0g8x97WO1GIb9xfJUqOm2z593kK', '2023-10-20 12:59:06'),
	(65, 'tuleany2018@gmail.com', '$2y$10$9JeChR56uVyBGEuC4lUATeZC4SId2vu7hJPO/z1zdAE6ro06XqxuW', '2023-10-26 18:01:02'),
	(66, 'paulojoao@unesc.net', '$2y$10$UEqLFgmozwEW0YqFHFXY6uB5itCfIlwntffLxc/3kxcgYJIttdvwe', '2023-10-26 18:31:57'),
	(69, 'eustaquiocandinba@gmail.com', '$2y$10$iecCQXrrYOAEBWE1t2krRe1B/5WSLwP3GJHUEr3rzDe6mloCWN2ba', '2023-11-12 12:41:16'),
	(70, 'pauloggjoao@gmail.com', '$2y$10$M3EosyKqDoQGKWE4eLBfaeiiL/Ew0/BEFLFVSwZ3Ce/0cvaqKt1xe', '2023-11-20 11:55:15');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.perfils
CREATE TABLE IF NOT EXISTS `perfils` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `status_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `empresa_id` int(11) DEFAULT NULL,
  `uuid` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.perfils: ~19 rows (aproximadamente)
INSERT INTO `perfils` (`id`, `designacao`, `status_id`, `created_at`, `updated_at`, `empresa_id`, `uuid`) VALUES
	(1, 'Super Administrador', 1, '2023-01-07 13:57:30', '2023-01-07 13:57:31', NULL, '57723dce-88b3-4a23-85e9-83d0fade77eb'),
	(12, 'Operador', 1, '2023-01-13 10:56:29', '2023-01-13 10:56:29', 53, 'd32e91c2-e502-464d-a786-11290f0edbd5'),
	(13, 'Caixa', 1, '2023-06-26 21:20:16', '2023-06-26 21:20:16', 163, 'dedb337f-268e-44f0-84c7-3420c1e1663f'),
	(14, 'Caixa', 1, '2023-07-20 09:04:57', '2023-07-20 09:04:57', 53, '0c3c5ea7-c89c-48de-9d24-a1fe02154141'),
	(15, 'Master Admin', 1, '2023-07-20 14:49:06', '2023-07-20 14:49:06', 53, 'fb10db49-4e5f-4780-8ce0-d488574f0df8'),
	(16, 'Assistente Comercial', 1, '2023-08-31 19:34:15', '2023-08-31 19:34:15', 148, '0d9d2e25-d767-449f-9487-2ca077642fd2'),
	(17, 'Gerente Loja', 1, '2023-08-31 19:34:26', '2023-08-31 19:34:26', 148, '30f8ef00-1ee7-4938-8c61-0315d032512a'),
	(18, 'Operador de Caixa Loja', 1, '2023-08-31 19:35:43', '2023-08-31 19:35:43', 148, '741aaa7e-1222-4dc4-8677-b4126d77b2ca'),
	(19, 'Técnico de Stock Loja', 1, '2023-08-31 19:36:03', '2023-08-31 19:36:03', 148, '89bcac44-7135-489c-be8c-044f4051537c'),
	(20, 'Técnico de Entregas Loja', 1, '2023-08-31 19:36:17', '2023-08-31 19:36:17', 148, '8853c9b1-b928-4955-9aa8-70206706cc46'),
	(21, 'Operador', 1, '2023-09-22 00:10:10', '2023-09-22 00:10:10', 162, '849b4187-27e1-4085-a1ba-56b53eadcb73'),
	(22, 'CAIXA', 1, '2023-09-25 17:04:13', '2023-09-25 17:45:20', 167, '44744488-00f4-4545-8893-6bd2cf4e4e53'),
	(23, 'OPERADOR', 1, '2023-09-25 17:44:16', '2023-09-25 17:44:16', 167, '2dc7f78e-1bbb-4635-8588-b1b8c3cffd1c'),
	(24, 'OPerador', 1, '2023-10-10 11:25:34', '2023-10-10 11:25:34', 172, '3a9c9eed-1d12-4e0d-9efc-ece2e5a35bd0'),
	(25, 'GESTOR', 1, '2023-11-22 17:34:09', '2023-12-19 10:47:56', 175, 'c3e17ddb-c69d-40cc-9fad-55b01f77a0a6'),
	(26, 'FILIAR', 1, '2023-12-01 13:31:36', '2023-12-19 10:49:39', 175, 'fa61c332-0502-44d9-bc4e-3f1053cb9541'),
	(27, 'Tesouraria', 1, '2023-12-07 13:55:22', '2023-12-07 13:55:22', 148, 'd1309536-4374-49a2-96cf-bc88da8096d6'),
	(28, 'VENDEDOR', 1, '2024-01-07 18:52:04', '2024-01-07 18:52:04', 178, 'fc5524a1-50e0-4ab8-a451-af72027660f7'),
	(29, 'Operador', 1, '2024-02-15 09:38:15', '2024-02-15 09:38:15', 1, '30786c69-8b98-4b44-be62-269fe4451d17');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.perguntas_frequentes
CREATE TABLE IF NOT EXISTS `perguntas_frequentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` mediumtext NOT NULL,
  `resposta` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.perguntas_frequentes: ~8 rows (aproximadamente)
INSERT INTO `perguntas_frequentes` (`id`, `pergunta`, `resposta`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(8, 'Qual é o prazo de entrega ? ', ' O prazo de entrega é de 24/48h após a confirmação do pagamento.', '2023-11-06 22:04:36', '2023-12-07 08:09:31', NULL),
	(9, 'Como entro em contato com o serviço de atendimento ao cliente?', 'Pode entrar em contato connosco através do chat disponível no site, por e-mail em loja@mutue.net ou pelo telefone (244) 934 660 003\',', '2023-11-24 11:38:39', '2023-12-07 08:11:06', NULL),
	(18, 'Quais são os métodos de pagamentos aceites?', 'Aceitamos Transferência Bancária / Depósito / Pagamento por Multicaixa', '2023-11-25 07:10:36', '2023-12-07 08:10:05', NULL),
	(19, 'Posso escolher a hora de entrega ?', 'Não é possível escolher o momento/hora concreto da entrega ao realizar a encomenda.', '2023-11-25 07:11:43', '2023-11-25 07:11:43', NULL),
	(20, 'Os preços podem ser modificados depois de fazer as encomendas ?', 'Os preços mostrados no momento da sua encomenda, serão os preços vigentes para si. As\nmodificações de preços posteriores não afetarão o seu pedido', '2023-11-25 07:12:38', '2023-11-25 07:12:38', NULL),
	(21, 'Posso comprar Online e levantar na Loja?', 'Pode sim comprar Online e levantar no nosso ponto de levantamento Loja MUTUE em VIANA,\nRUA GINGA SHOPPING, JUNTO A CASA DOS FRESCOS.', '2023-11-25 07:13:41', '2023-11-25 07:13:41', NULL),
	(22, 'Posso receber notificações sobre as novidade da MUTUE ?', 'Pode sim, para tal basta subscrever-se a nossa newsletter em: https://loja.mutue.net/#/', '2023-11-25 07:14:30', '2023-11-25 07:14:30', NULL),
	(23, 'Esqueci-me da minha palavra passe, e agora ?', 'Se deseja aceder à sua conta e se esqueceu da sua palavra-chave, basta clicar em «Recuperar\npalavra-chave». Introduza o endereço de e-mail com o qual criou a sua conta na loja online em https://loja.mutue.net/#/. na janela que se abre. Enviar-lhe-emos um e-mail onde deve de colocar a\nsua nova palavra passe e confirmar a mesma.', '2023-11-25 07:16:23', '2023-11-25 07:16:23', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_permissions_status_gerais` (`status_id`),
  CONSTRAINT `FK_permissions_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.permissions: ~23 rows (aproximadamente)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `label`, `status_id`) VALUES
	(1, 'gerir utilizadores', 'empresa', '2020-05-04 16:07:01', '2020-05-04 16:07:02', 'Gerir utilizadores', 1),
	(2, 'gerir permissões', 'empresa', '2020-05-18 01:08:13', '2020-05-18 01:08:15', 'Gerir permissões', 1),
	(3, 'gerir empresas', 'empresa', '2020-05-18 01:14:35', '2020-05-18 01:14:36', 'Gerir empresas', 1),
	(4, 'gerir bancos', 'empresa', '2021-06-07 10:49:51', '2021-06-07 10:49:55', 'Gerir bancos', 1),
	(5, 'gerir clientes', 'empresa', '2021-06-07 10:49:51', '2021-06-07 10:49:55', 'Gerir clientes', 1),
	(6, 'gerir produtos', 'empresa', '2021-06-07 10:49:51', '2021-06-07 10:49:55', 'Gerir produtos', 1),
	(7, 'gerir anular documento', 'empresa', '2021-06-07 10:49:51', '2021-06-07 10:49:55', 'Gerir anular documento', 1),
	(8, 'gerir recibos', 'empresa', '2021-06-07 10:49:51', '2021-06-07 10:49:55', 'gerir recibos', 1),
	(9, 'converter proforma', 'empresa', '2021-06-07 10:49:51', '2021-06-07 10:49:55', 'converter proforma', 1),
	(10, 'definir parametros', 'empresa', '2021-06-07 10:49:51', '2021-06-07 10:49:55', 'definir parametros', 1),
	(11, 'visualizar relatorios', 'empresa', '2021-06-07 10:49:51', '2021-06-07 10:49:55', 'visualizar relatorios', 1),
	(12, 'imprimir_fecho_caixa', 'empresa', '2021-06-07 10:49:51', '2021-06-07 10:49:55', 'imprimir_fecho_caixa', 1),
	(13, 'Sem acesso a dashboard', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'Sem_acesso_a_dashboard', 1),
	(14, 'gerir cambio', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'gerir_cambio', 1),
	(15, 'gerir mercadorias', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'gerir_mercadorias', 1),
	(16, 'emitir fatura carga', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'emitir_fatura_carga', 1),
	(17, 'emitir fatura aeronautico', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'emitir_fatura_aeronautico', 1),
	(18, 'emitir fecho de caixa', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'imprimir_fecho_caixa', 1),
	(19, 'emitir extrato do cliente', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'emitir_extrato_cliente', 1),
	(20, 'imprimir mapa faturacao', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'imprimir_mapa_faturacao', 1),
	(21, 'anulacao documentos', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'anulacao_documentos', 1),
	(22, 'emitir fatura outros servicos', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'emitir_fatura_outros_servicos', 1),
	(23, 'visualizar logs de acesso', 'empresa', '2023-09-29 08:07:11', '2023-09-29 08:07:12', 'visualizar_logs_de_acesso', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1595 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.personal_access_tokens: ~20 rows (aproximadamente)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
	(836, 'App\\Models\\empresa\\User', 668, 'mobile', '7622444f3fcf2ef81b3e19b16dbcc5bfb609f5efc1673836835fe97d79c28ebc', '["*"]', '2023-07-11 15:30:10', '2023-07-11 15:28:10', '2023-07-11 15:30:10'),
	(1036, 'App\\Models\\empresa\\User', 557, 'mobile', '13a8583f9054731941c763e2e7a2f7539e8e5028f2f99bf47d4b59087fb324a6', '["*"]', '2023-08-23 02:01:58', '2023-08-23 02:01:56', '2023-08-23 02:01:58'),
	(1045, 'App\\Models\\empresa\\User', 649, 'mobile', '0144f838e129a113b5b45cb1415a0409a14a7973257738cffeb724dcf5e6dd76', '["*"]', '2023-08-23 10:11:24', '2023-08-23 10:11:24', '2023-08-23 10:11:24'),
	(1137, 'App\\Models\\empresa\\User', 690, 'mobile', 'bb38a671c76b69f57b4270984d8492a3ff0745763472dce9dca4fe48584c907d', '["*"]', '2023-09-20 16:01:38', '2023-09-20 16:01:37', '2023-09-20 16:01:38'),
	(1147, 'App\\Models\\empresa\\User', 673, 'mobile', '3a75139a94cd26e7ba970ff5afef74aea8a5ccd0ffbe08d4cbc0f561df4ff4d9', '["*"]', '2023-09-22 13:03:57', '2023-09-22 13:00:09', '2023-09-22 13:03:57'),
	(1150, 'App\\Models\\empresa\\User', 693, 'mobile', '7c9c6259f8169c6fe966e199c5e5a3c0e53f4d2d12ad8eb3ed689e1f9162eee5', '["*"]', '2023-10-07 09:45:31', '2023-10-07 09:45:30', '2023-10-07 09:45:31'),
	(1256, 'App\\Models\\empresa\\User', 713, 'mobile', 'c90da4fea13687223d501d296cb1ce42bbf598ec95406bb7495cb179ae8d820b', '["*"]', NULL, '2023-10-24 16:46:22', '2023-10-24 16:46:22'),
	(1257, 'App\\Models\\empresa\\User', 714, 'mobile', '363ee8ac50ce7c933c258b1c54eedb3d73a6e936a8ec3774be562852a7bbed8a', '["*"]', NULL, '2023-10-24 16:55:14', '2023-10-24 16:55:14'),
	(1260, 'App\\Models\\empresa\\User', 715, 'mobile', '6f7550dd4318db90dd6fb8385ab1fd1fdee0ae3674f97d25a86b187e78458239', '["*"]', '2023-10-24 17:19:53', '2023-10-24 17:19:52', '2023-10-24 17:19:53'),
	(1268, 'App\\Models\\empresa\\User', 718, 'mobile', '00cb8804d09bdac6aa4b4ced5487c43c15760f48d283109b351cff9e3bcbf954', '["*"]', '2023-10-24 17:59:10', '2023-10-24 17:38:03', '2023-10-24 17:59:10'),
	(1328, 'App\\Models\\empresa\\User', 689, 'mobile', 'fa6ee3c3192a10be49159812351e2ded1ed77545635e6f8432261b984b8d9d5e', '["*"]', '2023-10-27 11:03:52', '2023-10-27 11:02:11', '2023-10-27 11:03:52'),
	(1397, 'App\\Models\\empresa\\User', 728, 'mobile', 'a8692a5966d8f066b709298755cc4411416ce9065122df3e1e6029c633acf014', '["*"]', '2023-11-14 09:26:05', '2023-11-14 09:24:52', '2023-11-14 09:26:05'),
	(1438, 'App\\Models\\empresa\\User', 734, 'mobile', '8aa32381a6c7be97f6586875a5cf5bc4926dd334431318326204cf58ed70afd4', '["*"]', '2023-12-11 15:56:46', '2023-11-24 16:00:32', '2023-12-11 15:56:46'),
	(1481, 'App\\Models\\empresa\\User', 741, 'mobile', 'eb2b1881faaf692810c000fe61a68d74f2a1b15e1be9ac5aee3d80c678c7099f', '["*"]', '2024-01-11 13:03:34', '2023-12-06 23:44:13', '2024-01-11 13:03:34'),
	(1518, 'App\\Models\\empresa\\User', 731, 'mobile', '061cc4784b0d997032462acca1cf68218aa7510f2e120653531929ef8a0f70ff', '["*"]', '2023-12-15 16:49:28', '2023-12-15 13:35:22', '2023-12-15 16:49:28'),
	(1519, 'App\\Models\\empresa\\User', 743, 'mobile', '159024a296de0e8b0c36b7b6d508d7dfdb4f951adda0db96997d9a68b01649b9', '["*"]', '2023-12-15 23:11:29', '2023-12-15 23:00:53', '2023-12-15 23:11:29'),
	(1539, 'App\\Models\\empresa\\User', 35, 'mobile', '7fd9c5940eddce0fdf1e22c3e45a02f49453e7b716525177d1d1a309e1fc46ad', '["*"]', '2024-01-02 11:17:34', '2024-01-02 11:17:23', '2024-01-02 11:17:34'),
	(1569, 'App\\Models\\empresa\\User', 708, 'mobile', 'f295e4c19ebda7e37e9fec83044ae27300e24c2ff266238a677078cd4aa89e69', '["*"]', '2024-01-22 17:01:51', '2024-01-22 17:01:49', '2024-01-22 17:01:51'),
	(1570, 'App\\Models\\empresa\\User', 704, 'mobile', '59be38aabbaf0fb5579c14d00c5451daf2e58a4a0b9da86bafa03e8e8f99ce98', '["*"]', '2024-01-23 16:08:57', '2024-01-23 15:02:24', '2024-01-23 16:08:57'),
	(1594, 'App\\Models\\empresa\\User', 729, 'mobile', '6beebdf19951e2af4cf5e65a33f2a725ab85ef8e4fd88ee688a2e7207402a116', '["*"]', NULL, '2024-01-29 13:50:10', '2024-01-29 13:50:10');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.precos
CREATE TABLE IF NOT EXISTS `precos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produto_is` int(10) unsigned NOT NULL,
  `preco` double NOT NULL,
  `descricao` varchar(145) DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_precos_user` (`user_id`),
  KEY `FK_precos_status` (`status_id`),
  KEY `FK_precos_canal` (`canal_id`),
  CONSTRAINT `FK_precos_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_precos_produto` FOREIGN KEY (`id`) REFERENCES `produtos_` (`id`),
  CONSTRAINT `FK_precos_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_precos_user` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.precos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `preco_venda` double NOT NULL,
  `pvp` double DEFAULT '0',
  `preco_compra` double DEFAULT NULL,
  `classificacao` int(11) DEFAULT NULL,
  `marca_id` int(10) unsigned DEFAULT NULL,
  `categoria_id` int(10) unsigned DEFAULT NULL,
  `orderCategoria1` int(10) unsigned DEFAULT NULL,
  `orderCategoria2` int(10) unsigned DEFAULT NULL,
  `orderCategoria3` int(10) unsigned DEFAULT NULL,
  `centroCustoId` int(10) unsigned DEFAULT NULL,
  `tipoServicoId` int(10) unsigned DEFAULT NULL COMMENT '1 =>Carga, 2=>Aeroportuario, 3=>Outros Serviços, 4=>Serviços comerciais',
  `classe_id` int(10) unsigned DEFAULT NULL,
  `unidade_medida_id` int(10) unsigned DEFAULT NULL,
  `fabricante_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT NULL,
  `codigo_taxa` int(10) unsigned DEFAULT '1',
  `motivo_isencao_id` int(10) unsigned DEFAULT NULL,
  `quantidade_minima` int(10) unsigned DEFAULT '0',
  `quantidade_critica` int(10) unsigned DEFAULT '0',
  `imagem_produto` varchar(255) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `codigo_barra` varchar(45) DEFAULT NULL,
  `data_expiracao` date DEFAULT NULL,
  `descricao` varchar(345) DEFAULT NULL,
  `stocavel` enum('Sim','Não') DEFAULT NULL,
  `venda_online` enum('Y','N') DEFAULT 'N',
  `cartaGarantia` enum('Y','N') DEFAULT 'N',
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tempoGarantiaProduto` int(11) DEFAULT NULL COMMENT '7=>7 dias,6=>meses,1=>1 ano',
  `tipoGarantia` enum('dias','mes','meses','ano','anos') DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_produtos_empresa` (`empresa_id`) USING BTREE,
  KEY `FK_produtos_status` (`status_id`) USING BTREE,
  KEY `FK_produtos_canal` (`canal_id`) USING BTREE,
  KEY `FK_produtos_user` (`user_id`) USING BTREE,
  KEY `FK_fabricante_id` (`fabricante_id`) USING BTREE,
  KEY `FK_produtos_motivo` (`motivo_isencao_id`) USING BTREE,
  KEY `FK_produtos_marcas` (`marca_id`) USING BTREE,
  KEY `FK_produtos_unidade_medidas` (`unidade_medida_id`) USING BTREE,
  KEY `FK_produtos_categorias` (`categoria_id`) USING BTREE,
  KEY `FK_produtos_classes` (`classe_id`) USING BTREE,
  KEY `FK_produtos_tipoTaxa` (`codigo_taxa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.produtos: ~30 rows (aproximadamente)
INSERT INTO `produtos` (`id`, `designacao`, `uuid`, `preco_venda`, `pvp`, `preco_compra`, `classificacao`, `marca_id`, `categoria_id`, `orderCategoria1`, `orderCategoria2`, `orderCategoria3`, `centroCustoId`, `tipoServicoId`, `classe_id`, `unidade_medida_id`, `fabricante_id`, `user_id`, `canal_id`, `status_id`, `codigo_taxa`, `motivo_isencao_id`, `quantidade_minima`, `quantidade_critica`, `imagem_produto`, `referencia`, `codigo_barra`, `data_expiracao`, `descricao`, `stocavel`, `venda_online`, `cartaGarantia`, `empresa_id`, `created_at`, `updated_at`, `tempoGarantiaProduto`, `tipoGarantia`) VALUES
	(1, 'Carga', 'd7a06a73-6c40-4cdb-9984-34f2b8810a25', 0, 0, 0, NULL, NULL, 2, NULL, NULL, NULL, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'P3KFW8', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-01 09:59:26', '2024-02-01 11:02:15', NULL, NULL),
	(2, 'Armazenagem', '04926be2-1158-46af-aaf3-8c865590dfcb', 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'XRY51O', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-01 11:01:47', '2024-02-01 11:01:47', NULL, NULL),
	(3, 'Manuseamento', '1122824c-857e-4769-8394-88134fb41306', 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '88HAOG', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-01 11:02:03', '2024-02-01 16:58:44', NULL, NULL),
	(4, 'Estacionamento', 'f10a0720-a591-42d2-b00d-b0436e037125', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'P05U2H', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:18:57', '2024-02-03 09:18:57', NULL, NULL),
	(5, 'Aterragem', '5b6d8950-45c9-4e3b-a3b6-2accd8d3862a', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'NX0WYB', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:19:20', '2024-02-03 09:19:20', NULL, NULL),
	(6, 'Luminosa 1x', 'afcc4a1e-a6eb-4bd6-b9bc-c7d0d40005e8', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'TH4304', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:20:19', '2024-02-03 09:20:19', NULL, NULL),
	(7, 'Carga', '561675ea-b5d9-4c93-9cfe-f7fb08038be5', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'P4O028', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:20:35', '2024-02-03 09:20:35', NULL, NULL),
	(8, 'Abertura do Aeroporto - Prolongamento', '918a30ed-ba39-4c19-a530-f944e07fa2b7', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(9, 'Luminosa 2x', '918a30ed-ba39-4c19-a530-f944e07fa2b5', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(10, 'Abertura do Aeroporto - Anticipação', '918a30ed-ba39-4c19-a530-f944e07fa2b6', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(11, 'Reabertura Comercial', '918a30ed-ba39-4c19-a530-f944e07fa2b0', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(12, 'Carga Importação', '918a30ed-ba39-4c19-a530-f944e07fa2b001', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(13, 'Carga Exportação/Transito', '918a30ed-ba39-4c19-a530-f944e07fa2b002', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(14, 'Assistência administrativa', '918a30ed-ba39-4c19-a530-f944e07fa2b003', 0.02, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(15, 'Assistência de operação em pista', '918a30ed-ba39-4c19-a530-f944e07fa2b004', 0.12, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(16, 'Assitência de limpeza e serviço do avião', '918a30ed-ba39-4c19-a530-f944e07fa2b005', 0.03, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(17, 'Assistência de manutenção em linha', '918a30ed-ba39-4c19-a530-f944e07fa2b006', 0.03, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(18, 'Assistência de gestão aérea e dos tripulantes', '918a30ed-ba39-4c19-a530-f944e07fa2b007', 0.03, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(19, 'Assistência de transporte em terra', '918a30ed-ba39-4c19-a530-f944e07fa2b008', 0.07, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(20, 'Aprovisionamento (catering) de aeronaves', '918a30ed-ba39-4c19-a530-f944e07fa2b009', 0.4, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(21, 'Assistência a combustível e óleo', '918a30ed-ba39-4c19-a530-f944e07fa2b010', 0.51, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(22, 'Passes de viaturas - empresa aérea doméstico', '918a30ed-ba39-4c19-a530-f944e07fa2b011', 1656, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(23, 'Passes de viaturas - empresa aérea internacional', '918a30ed-ba39-4c19-a530-f944e07fa2b012', 2070, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(24, 'Passes de viaturas - prestadores de serviços', '918a30ed-ba39-4c19-a530-f944e07fa2b013', 5796, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(25, 'Passes de pessoas - empresa aérea doméstica', '918a30ed-ba39-4c19-a530-f944e07fa2b014', 80.5, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(26, 'Passes de pessoas - empresa aérea internacional ', '918a30ed-ba39-4c19-a530-f944e07fa2b015', 115, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(27, 'Passes de pessoas - prestadores de serviço', '918a30ed-ba39-4c19-a530-f944e07fa2b016', 575, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(28, 'Estacionamento Camiões Dentro do TCA', '918a30ed-ba39-4c19-a530-f944e07fa2b017', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 4, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(29, 'Estacionamento Camiões Fora do TCA', '918a30ed-ba39-4c19-a530-f944e07fa2b018', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 4, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(30, 'Estacionamento de Veículos', '918a30ed-ba39-4c19-a530-f944e07fa2b019', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 4, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.produtos_destaque
CREATE TABLE IF NOT EXISTS `produtos_destaque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) DEFAULT NULL,
  `descricao` text,
  `designacao` varchar(255) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.produtos_destaque: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.produtos_favoritos
CREATE TABLE IF NOT EXISTS `produtos_favoritos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `produto_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_produtos_favoritos_users_cliente` (`user_id`) USING BTREE,
  KEY `FK_produtos_favoritos_produtos` (`produto_id`) USING BTREE,
  CONSTRAINT `FK_produtos_favoritos_produtos` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_produtos_favoritos_users_cliente` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.produtos_favoritos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.produtos_lojas
CREATE TABLE IF NOT EXISTS `produtos_lojas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int(10) unsigned NOT NULL,
  `armazem_id` int(10) unsigned DEFAULT NULL,
  `preco_compra` int(10) unsigned DEFAULT NULL,
  `quantidade_critica` int(10) unsigned DEFAULT NULL,
  `preco_venda` int(10) unsigned DEFAULT NULL,
  `quantidade_minima` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_produtos_lojas_produtos` (`produto_id`),
  KEY `FK_produtos_lojas_armazens` (`armazem_id`),
  KEY `FK_produtos_lojas_canais_comunicacoes` (`canal_id`),
  KEY `FK_produtos_lojas_users` (`user_id`),
  KEY `FK_produtos_lojas_status_gerais` (`status_id`),
  KEY `FK_produtos_lojas_empresas` (`empresa_id`),
  CONSTRAINT `FK_produtos_lojas_armazens` FOREIGN KEY (`armazem_id`) REFERENCES `armazens` (`id`),
  CONSTRAINT `FK_produtos_lojas_canais_comunicacoes` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_produtos_lojas_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_produtos_lojas_produtos` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`),
  CONSTRAINT `FK_produtos_lojas_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_produtos_lojas_users` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.produtos_lojas: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.produto_imagens
CREATE TABLE IF NOT EXISTS `produto_imagens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `produto_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_produto_imagens_produtos` (`produto_id`),
  CONSTRAINT `FK_produto_imagens_produtos` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.produto_imagens: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.recibos
CREATE TABLE IF NOT EXISTS `recibos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresaId` int(10) unsigned NOT NULL,
  `numeracaoRecibo` varchar(255) DEFAULT NULL,
  `clienteId` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalEntregue` double DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `facturaId` int(10) unsigned DEFAULT NULL,
  `totalFatura` double unsigned DEFAULT '0',
  `totalImposto` double unsigned DEFAULT '0',
  `totalDebitar` double unsigned DEFAULT '0',
  `formaPagamentoId` int(10) unsigned NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `numSequenciaRecibo` int(11) NOT NULL,
  `nomeCliente` varchar(255) DEFAULT NULL,
  `telefoneCliente` varchar(255) DEFAULT NULL,
  `nifCliente` varchar(255) DEFAULT NULL,
  `emailCliente` varchar(255) DEFAULT NULL,
  `enderecoCliente` varchar(255) DEFAULT NULL,
  `dataOperacao` date DEFAULT NULL,
  `numeroOperacaoBancaria` varchar(255) DEFAULT NULL,
  `comprovativoBancario` varchar(255) DEFAULT NULL,
  `anulado` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `FK_recibos_empresas` (`empresaId`) USING BTREE,
  KEY `cliente_id` (`clienteId`) USING BTREE,
  KEY `FK_recibos_formas_pagamentos` (`formaPagamentoId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.recibos: ~2 rows (aproximadamente)
INSERT INTO `recibos` (`id`, `empresaId`, `numeracaoRecibo`, `clienteId`, `created_at`, `updated_at`, `totalEntregue`, `userId`, `facturaId`, `totalFatura`, `totalImposto`, `totalDebitar`, `formaPagamentoId`, `observacao`, `numSequenciaRecibo`, `nomeCliente`, `telefoneCliente`, `nifCliente`, `emailCliente`, `enderecoCliente`, `dataOperacao`, `numeroOperacaoBancaria`, `comprovativoBancario`, `anulado`) VALUES
	(1, 1, 'RC ATO2024/1', 3, '2024-03-13 10:02:34', '2024-03-13 10:02:34', 1072713.716901, 1, 110, 1072713.716901, 131736.772251, 0, 1, NULL, 1, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', '2024-03-13', NULL, NULL, 'Y'),
	(2, 1, 'RC ATO2024/2', 3, '2024-03-13 10:03:31', '2024-03-13 10:03:31', 1383704.79447, 1, 111, 1383704.79447, 169928.65897, 0, 1, NULL, 2, 'NGONGO THOMAS & FILHOS COMERCIO GERAL LTD', '+244923437631', '54176617919', 'kingsleychima75@gmail.com', 'Rua Santos Nº18, Bairro Cassenda', NULL, NULL, NULL, 'N');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.recibos_items
CREATE TABLE IF NOT EXISTS `recibos_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recibo_id` int(10) unsigned NOT NULL,
  `factura_id` int(10) unsigned NOT NULL,
  `valor_entregue` double NOT NULL,
  `retencao` double DEFAULT NULL,
  `borderoux` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao` varchar(255) NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `anulado` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `recibo_id` (`recibo_id`),
  KEY `factura` (`factura_id`),
  KEY `empresa` (`empresa_id`),
  CONSTRAINT `empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `recibo_id` FOREIGN KEY (`recibo_id`) REFERENCES `recibos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.recibos_items: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_roles_empresas` (`empresa_id`),
  CONSTRAINT `FK_roles_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.roles: ~3 rows (aproximadamente)
INSERT INTO `roles` (`id`, `label`, `name`, `guard_name`, `created_at`, `updated_at`, `empresa_id`) VALUES
	(1, 'Super Admin', 'Super-Admin', 'empresa', '2020-05-18 00:05:05', '2020-05-18 00:05:06', NULL),
	(2, 'Admin', 'Admin', 'empresa', '2020-05-18 00:05:41', '2020-05-18 00:05:42', NULL),
	(3, 'Funcionario', 'Funcionario', 'empresa', '2020-06-09 20:22:21', '2020-06-09 20:22:23', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.role_has_permissions: ~0 rows (aproximadamente)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(13, 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.sequencias_documentos
CREATE TABLE IF NOT EXISTS `sequencias_documentos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sequencia` int(11) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `tipo_documento` int(10) unsigned DEFAULT NULL,
  `tipoDocumentoNome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `serie_documento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_sequencias_documentos_tipodocumentosequencias` (`tipo_documento`),
  CONSTRAINT `FK_sequencias_documentos_tipodocumentosequencias` FOREIGN KEY (`tipo_documento`) REFERENCES `tipodocumentosequencias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.sequencias_documentos: ~13 rows (aproximadamente)
INSERT INTO `sequencias_documentos` (`id`, `sequencia`, `empresa_id`, `tipo_documento`, `tipoDocumentoNome`, `serie_documento`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 1, 'FATURA RECIBO', 'AGT', '2023-07-21 01:00:46', '2023-07-21 01:00:46'),
	(2, 1, NULL, 2, 'FATURA', 'AGT', '2023-07-21 01:00:46', '2023-07-21 01:00:46'),
	(3, 1, NULL, 3, 'FATURA PROFORMA', 'AGT', '2023-07-21 01:00:46', '2023-07-21 01:00:46'),
	(4, 1, NULL, 4, 'NOTA CREDITO/RETIFICAÇÃO', 'AGT', '2023-07-21 01:00:46', '2023-07-21 01:00:46'),
	(5, 1, NULL, 5, 'NOTA CREDITO/ANULAÇÃO FATURA', 'AGT', '2023-07-21 01:00:46', '2023-07-21 01:00:46'),
	(6, 1, NULL, 7, 'NOTA CREDITO/ANULAÇÃO RECIBO', 'AGT', '2023-07-21 01:00:46', '2023-07-21 01:00:46'),
	(7, 1, NULL, 6, 'RECIBOS', 'AGT', '2023-07-21 01:00:46', '2023-07-21 01:00:46'),
	(33, 10, 53, 6, 'RECIBOS', 'RR', '2023-07-25 14:18:06', '2023-07-25 14:18:06'),
	(34, 20, 53, 6, 'RECIBOS', 'RR', '2023-07-25 14:39:30', '2023-07-25 14:39:30'),
	(35, 100, 53, 2, 'FATURA', 'RR', '2023-07-25 14:41:17', '2023-07-25 14:41:17'),
	(36, 100, 53, 2, 'FATURA', 'RR', '2023-07-25 16:18:07', '2023-07-25 16:18:07'),
	(37, 1200, 53, 2, 'FATURA', 'RR', '2023-07-25 16:18:19', '2023-07-25 16:18:19'),
	(38, 50, 53, 1, 'FATURA RECIBO', 'RR', '2023-07-26 19:31:29', '2023-07-26 19:31:29');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.series_documento
CREATE TABLE IF NOT EXISTS `series_documento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_serie_empresas` (`empresa_id`),
  CONSTRAINT `FK_serie_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.series_documento: ~0 rows (aproximadamente)
INSERT INTO `series_documento` (`id`, `serie`, `empresa_id`) VALUES
	(1, 'ATO', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.statuspagamentovendaonline
CREATE TABLE IF NOT EXISTS `statuspagamentovendaonline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.statuspagamentovendaonline: ~6 rows (aproximadamente)
INSERT INTO `statuspagamentovendaonline` (`id`, `designacao`) VALUES
	(1, 'Validado'),
	(2, 'Pendente'),
	(3, 'Rejeitado'),
	(4, 'Enviado'),
	(5, 'Entregue'),
	(6, 'Devolvido');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.status_factura
CREATE TABLE IF NOT EXISTS `status_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.status_factura: ~3 rows (aproximadamente)
INSERT INTO `status_factura` (`id`, `designacao`) VALUES
	(1, 'Activo'),
	(2, 'Proforma'),
	(3, 'Venda Crédito');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.status_gerais
CREATE TABLE IF NOT EXISTS `status_gerais` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.status_gerais: ~2 rows (aproximadamente)
INSERT INTO `status_gerais` (`id`, `designacao`) VALUES
	(1, 'Activo'),
	(2, 'Inativo');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.status_senha
CREATE TABLE IF NOT EXISTS `status_senha` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.status_senha: ~2 rows (aproximadamente)
INSERT INTO `status_senha` (`id`, `designacao`) VALUES
	(1, 'Vulnerável'),
	(2, 'Segura');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.subscricao_emails
CREATE TABLE IF NOT EXISTS `subscricao_emails` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `estado_recebimento` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.subscricao_emails: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.taxa_carga_aduaneira
CREATE TABLE IF NOT EXISTS `taxa_carga_aduaneira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` char(10) NOT NULL,
  `descricao` text NOT NULL,
  `taxa` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.taxa_carga_aduaneira: ~2 rows (aproximadamente)
INSERT INTO `taxa_carga_aduaneira` (`id`, `designacao`, `descricao`, `taxa`) VALUES
	(1, 'Sim', 'Carga sujeita a despacho aduaneiro embarcada ou desembarcada', 0.08),
	(2, 'Não', 'Carga não sujeita a despacho aduaneiro, apenas ao embarque', 0.07);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipodocumentosequencias
CREATE TABLE IF NOT EXISTS `tipodocumentosequencias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipodocumentosequencias: ~7 rows (aproximadamente)
INSERT INTO `tipodocumentosequencias` (`id`, `designacao`) VALUES
	(1, 'FACTURA RECIBO'),
	(2, 'FATURA'),
	(3, 'FATURA PROFORMA'),
	(4, 'NOTA CREDITO/RETIFICACÃO'),
	(5, 'NOTA CREDITO/ANULAÇÃO FATURA'),
	(6, 'RECIBOS'),
	(7, 'NOTA CREDITO/ANULAÇÃO RECIBO');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipos_clientes
CREATE TABLE IF NOT EXISTS `tipos_clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_clientes: ~2 rows (aproximadamente)
INSERT INTO `tipos_clientes` (`id`, `designacao`) VALUES
	(1, 'Entidade levanta'),
	(2, 'Entidade Assist. da Aeronave');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipos_contactos
CREATE TABLE IF NOT EXISTS `tipos_contactos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_contactos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipos_entregas
CREATE TABLE IF NOT EXISTS `tipos_entregas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(50) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1' COMMENT '1=>Ativo, 2=>Desativo',
  `icon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_entregas: ~2 rows (aproximadamente)
INSERT INTO `tipos_entregas` (`id`, `designacao`, `status_id`, `icon`) VALUES
	(1, 'Receber o produto em Casa', 1, 'mdi-home'),
	(2, 'Receber o produto na Loja', 1, 'mdi-store');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipos_mercadoria
CREATE TABLE IF NOT EXISTS `tipos_mercadoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` text NOT NULL,
  `taxa` double DEFAULT NULL,
  `statuId` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_mercadoria: ~6 rows (aproximadamente)
INSERT INTO `tipos_mercadoria` (`id`, `designacao`, `taxa`, `statuId`, `created_at`, `updated_at`) VALUES
	(1, 'Carga Geral', 0.03, 1, '2024-01-30 13:50:46', '2024-02-13 01:24:43'),
	(2, 'Carga Valiosa', 0.07, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(3, 'Carga Especial', 0.07, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(4, 'Carga Refrigerada', 0.05, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(5, 'Carga Viva', 0.04, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(6, 'Carga Trânsito', 0.08, 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipos_nota_credito
CREATE TABLE IF NOT EXISTS `tipos_nota_credito` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_nota_credito: ~3 rows (aproximadamente)
INSERT INTO `tipos_nota_credito` (`id`, `designacao`) VALUES
	(1, 'CREDITO'),
	(2, 'ANULAÇÃO'),
	(3, 'RETIFICAÇÃO');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipos_regimes
CREATE TABLE IF NOT EXISTS `tipos_regimes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Designacao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_regimes: ~3 rows (aproximadamente)
INSERT INTO `tipos_regimes` (`id`, `Designacao`) VALUES
	(1, 'Regime Geral'),
	(2, 'Regime Simplificado'),
	(3, ' Regime de Exclusão');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipos_servicos
CREATE TABLE IF NOT EXISTS `tipos_servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `statuId` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_servicos: ~4 rows (aproximadamente)
INSERT INTO `tipos_servicos` (`id`, `designacao`, `statuId`, `created_at`, `updated_at`) VALUES
	(1, 'Carga', 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(2, 'Aeronáutico', 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(3, 'Outros Serviços', 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(4, 'Serviços Comerciais', 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipos_stocagens
CREATE TABLE IF NOT EXISTS `tipos_stocagens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(145) NOT NULL,
  `obs` varchar(345) DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_tipos_stocagens_status` (`status_id`),
  KEY `FK_tipos_stocagens_canal` (`canal_id`),
  KEY `FK_tipos_stocagens_user` (`user_id`),
  KEY `FK_tipos_stocagens_empresa` (`empresa_id`),
  CONSTRAINT `FK_tipos_stocagens_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_tipos_stocagens_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_tipos_stocagens_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_tipos_stocagens_user` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_stocagens: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipos_stocagens_empresas
CREATE TABLE IF NOT EXISTS `tipos_stocagens_empresas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_stocagem_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `cana_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `obs` varchar(145) DEFAULT NULL COMMENT 'FIFO, LIFO, PMP',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_tipos_stocagens_empresas_empresa` (`empresa_id`),
  KEY `FK_tipos_stocagens_empresas_user` (`user_id`),
  KEY `FK_tipos_stocagens_empresas_canal` (`cana_id`),
  KEY `FK_tipos_stocagens_empresas_status` (`status_id`),
  KEY `FK_tipos_stocagens_empresas_tipo` (`tipo_stocagem_id`),
  CONSTRAINT `FK_tipos_stocagens_empresas_canal` FOREIGN KEY (`cana_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_tipos_stocagens_empresas_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_tipos_stocagens_empresas_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_tipos_stocagens_empresas_tipo` FOREIGN KEY (`tipo_stocagem_id`) REFERENCES `tipos_stocagens` (`id`),
  CONSTRAINT `FK_tipos_stocagens_empresas_user` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_stocagens_empresas: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipotaxa
CREATE TABLE IF NOT EXISTS `tipotaxa` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxa` int(11) NOT NULL,
  `codigostatus` int(10) unsigned NOT NULL,
  `codigoMotivo` int(10) unsigned NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `empresa_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_tipotaxa_2` (`codigostatus`),
  KEY `FK_tipotaxa_motivo` (`codigoMotivo`),
  KEY `FK_tipotaxa_empresas` (`empresa_id`),
  CONSTRAINT `FK_tipotaxa_2` FOREIGN KEY (`codigostatus`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_tipotaxa_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_tipotaxa_motivo` FOREIGN KEY (`codigoMotivo`) REFERENCES `motivo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipotaxa: ~3 rows (aproximadamente)
INSERT INTO `tipotaxa` (`codigo`, `taxa`, `codigostatus`, `codigoMotivo`, `descricao`, `created_at`, `updated_at`, `empresa_id`) VALUES
	(1, 0, 1, 12, 'ISENTO(0,00%)', '2020-12-09 16:07:33', '2020-12-09 16:07:33', NULL),
	(2, 14, 1, 9, 'IVA(14,00%)', '2020-12-09 16:07:33', '2020-12-09 16:07:33', NULL),
	(14, 7, 1, 7, 'IVA(7,00%)', '2020-12-10 00:29:27', '2020-12-10 00:29:27', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipo_documentos
CREATE TABLE IF NOT EXISTS `tipo_documentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `sigla` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipo_documentos: ~6 rows (aproximadamente)
INSERT INTO `tipo_documentos` (`id`, `designacao`, `sigla`) VALUES
	(1, 'FACTURA/RECIBO', 'FR'),
	(2, 'FACTURA', 'FT'),
	(3, 'FACTURA - PROFORMA', 'FP'),
	(4, 'NOTA DE DEBITO', 'ND'),
	(5, 'NOTA DE CREDITO', 'NC'),
	(6, 'RECIBO', 'RC');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipo_documentos_empresas
CREATE TABLE IF NOT EXISTS `tipo_documentos_empresas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_documento_id` int(10) unsigned NOT NULL,
  `next_number` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `obs` varchar(145) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_tipo_documentos_empresas_tipo` (`tipo_documento_id`),
  KEY `FK_tipo_documentos_empresas_empresa` (`empresa_id`),
  KEY `FK_tipo_documentos_empresas_status` (`status_id`),
  KEY `FK_tipo_documentos_empresas_canal` (`canal_id`),
  KEY `FK_tipo_documentos_empresas_user` (`user_id`),
  CONSTRAINT `FK_tipo_documentos_empresas_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_tipo_documentos_empresas_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_tipo_documentos_empresas_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_tipo_documentos_empresas_tipo` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documentos` (`id`),
  CONSTRAINT `FK_tipo_documentos_empresas_user` FOREIGN KEY (`user_id`) REFERENCES `users_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipo_documentos_empresas: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipo_inventarios
CREATE TABLE IF NOT EXISTS `tipo_inventarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipo_inventarios: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipo_pagamento
CREATE TABLE IF NOT EXISTS `tipo_pagamento` (
  `designacao` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `sigla` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipo_pagamento: ~6 rows (aproximadamente)
INSERT INTO `tipo_pagamento` (`designacao`, `id`, `sigla`) VALUES
	('Cartão de Crédito', 1, 'CC'),
	('Cartão de Débito', 2, 'CD'),
	('Numerário', 3, 'NU'),
	('Outros meios aqui não citados', 4, 'OU'),
	('Transferencia bancaria ou meio autorizados', 5, 'TR'),
	('Cheque bancario', 6, 'CH');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.tipo_users
CREATE TABLE IF NOT EXISTS `tipo_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipo_users: ~4 rows (aproximadamente)
INSERT INTO `tipo_users` (`id`, `designacao`) VALUES
	(1, 'Admin'),
	(2, 'Empresa'),
	(3, 'Funcionário'),
	(4, 'Cliente');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.transferencias_produtos
CREATE TABLE IF NOT EXISTS `transferencias_produtos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `canal_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `numeracao_transferencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numSequenciaTransferencia` int(11) NOT NULL,
  `tipo_user_id` int(11) unsigned NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_transferencias_produtos_canais_comunicacoes` (`canal_id`),
  KEY `FK_transferencias_produtos_tipo_users` (`tipo_user_id`),
  KEY `FK_transferencias_produtos_empresas` (`empresa_id`),
  CONSTRAINT `FK_transferencias_produtos_canais_comunicacoes` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_transferencias_produtos_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_transferencias_produtos_tipo_users` FOREIGN KEY (`tipo_user_id`) REFERENCES `tipo_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.transferencias_produtos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.transferencias_produto_items
CREATE TABLE IF NOT EXISTS `transferencias_produto_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int(10) unsigned NOT NULL,
  `transferencia_produto_id` int(10) unsigned NOT NULL,
  `armazem_origem_id` int(10) unsigned NOT NULL,
  `armazem_destino_id` int(10) unsigned NOT NULL,
  `quantidade_transferida` double NOT NULL,
  `armazem_origem` varchar(300) DEFAULT NULL,
  `produto_designacao` varchar(300) DEFAULT NULL,
  `armazem_destino` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_transferencias_produtos_2` (`produto_id`),
  KEY `FK_transferencias_produto_items_transferencias_produtos` (`transferencia_produto_id`),
  KEY `FK_transferencias_produto_items_armazens` (`armazem_origem_id`),
  KEY `FK_transferencias_produto_items_armazens_2` (`armazem_destino_id`),
  CONSTRAINT `FK_transferencias_produto_items_armazens` FOREIGN KEY (`armazem_origem_id`) REFERENCES `armazens` (`id`),
  CONSTRAINT `FK_transferencias_produto_items_armazens_2` FOREIGN KEY (`armazem_destino_id`) REFERENCES `armazens` (`id`),
  CONSTRAINT `FK_transferencias_produto_items_produtos` FOREIGN KEY (`produto_id`) REFERENCES `produtos_` (`id`),
  CONSTRAINT `FK_transferencias_produto_items_transferencias_produtos` FOREIGN KEY (`transferencia_produto_id`) REFERENCES `transferencias_produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.transferencias_produto_items: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.unidade_medidas
CREATE TABLE IF NOT EXISTS `unidade_medidas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diversos` enum('1','2') DEFAULT '2' COMMENT '1=>sim; 2=>nao',
  PRIMARY KEY (`id`),
  KEY `FK_unidade_empresa` (`empresa_id`),
  KEY `FK_unidade_user` (`user_id`),
  KEY `FK_unidade_canal` (`canal_id`),
  KEY `FK_unidade_status` (`status_id`),
  CONSTRAINT `FK_unidade_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_unidade_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_unidade_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.unidade_medidas: ~0 rows (aproximadamente)
INSERT INTO `unidade_medidas` (`id`, `designacao`, `empresa_id`, `user_id`, `canal_id`, `status_id`, `created_at`, `updated_at`, `diversos`) VALUES
	(1, 'un', 1, NULL, 2, 1, '2024-01-29 12:51:31', '2024-01-29 12:51:32', '2');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.users_centro_custo
CREATE TABLE IF NOT EXISTS `users_centro_custo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `centro_custo_id` int(10) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.users_centro_custo: ~7 rows (aproximadamente)
INSERT INTO `users_centro_custo` (`id`, `user_id`, `centro_custo_id`, `status`) VALUES
	(1, 1, 1, 'Y'),
	(73, 747, 1, 'Y'),
	(74, 749, 1, 'Y'),
	(75, 750, 1, 'Y'),
	(76, 751, 1, 'Y'),
	(77, 752, 1, 'Y'),
	(78, 753, 1, 'Y');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.users_cliente
CREATE TABLE IF NOT EXISTS `users_cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_user_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `statusUserAdicional` int(10) unsigned DEFAULT '1',
  `status_senha_id` int(10) unsigned NOT NULL DEFAULT '1',
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `guard` varchar(50) DEFAULT 'empresa' COMMENT 'guard usado nas permissões no serviço AuthServiceProvider',
  `token_notification_firebase` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_canal` (`canal_id`),
  KEY `FK_users_tipo` (`tipo_user_id`),
  KEY `FK_users_status` (`status_id`),
  KEY `FK_users_empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.users_cliente: ~4 rows (aproximadamente)
INSERT INTO `users_cliente` (`id`, `name`, `uuid`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `tipo_user_id`, `status_id`, `statusUserAdicional`, `status_senha_id`, `telefone`, `email`, `email_verified_at`, `canal_id`, `empresa_id`, `foto`, `guard`, `token_notification_firebase`) VALUES
	(1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '6a0d01a6-a1e0-4bad-933f-d400be070dc8', 'República de Angola Aeroporto Internacional Dr. António Agostino Neto Operador Temporário Aeroportuário ATO - AIAAN', '$2y$10$u/3Tz.i8Ildc0wO4uFZSOecJVCfc3i/YPoaCrIoRKw2cz6GrjfTUW', '7QexQAcxkVb9C0QcGOHD7SCTsk2truCfpVHfLUYmP0uXhrb6f0f9xmxyeqOx', '2024-01-23 16:10:54', '2024-03-13 09:19:04', 2, 1, 1, 2, '937036322', 'info@ato.ao', NULL, 3, 1, 'utilizadores/cliente//bvznhCYlAzFsDGmsfLxwBbnnfFyserJcK1YN5oIY.png', 'empresa', NULL),
	(750, 'Carlos Sampaio', 'ea7711d6-450b-4e91-b858-2df6eb8530e4', 'CSampaio', '$2y$10$eHc1HVG4bNdtFqHJtMeXV.5KkGk9s.cVqcyc6O/HjKEe0nTMrmv0C', NULL, '2024-02-16 09:54:03', '2024-02-16 10:03:08', 2, 1, 1, 2, '922605848', 'carlos.sampaio@ato.co.ao', NULL, 2, 1, 'utilizadores/cliente/avatarEmpresa.png', 'empresa', NULL),
	(751, 'Milton Lucas', '2a7c4518-0909-4073-871b-9e23cd8396e4', 'MLucas', '$2y$10$mkcuY4kg9F8UCz3N.Y50yu/5N/a7Ad/9lAaJzmdgUfILLbIY1yL2e', NULL, '2024-02-16 09:55:07', '2024-02-16 10:05:55', 2, 1, 1, 2, '921689230', 'milton.lucas@ato.co.ao', NULL, 2, 1, 'utilizadores/cliente/avatarEmpresa.png', 'empresa', NULL),
	(752, 'Tatiana', 'a4b96cfd-d128-416e-9604-dd24e74ba79b', 'Mouzinho', '$2y$10$JIkRsCEubh7s414WEDrZ9OahDedhTxXk54pbf.ADaRQBposrEWSwO', NULL, '2024-02-16 12:09:04', '2024-02-16 12:12:38', 2, 1, 1, 2, '924264160', 'tatiana.mouzinho@ato.co.ao', NULL, 2, 1, 'utilizadores/cliente/avatarEmpresa.png', 'empresa', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.users_cliente_validacao
CREATE TABLE IF NOT EXISTS `users_cliente_validacao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_id` int(10) unsigned NOT NULL,
  `statusUserAdicional` int(10) unsigned DEFAULT '1',
  `status_senha_id` int(10) unsigned NOT NULL DEFAULT '1',
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `used` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `FK_users_status` (`status_id`),
  KEY `FK_users_empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=786 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.users_cliente_validacao: ~8 rows (aproximadamente)
INSERT INTO `users_cliente_validacao` (`id`, `name`, `uuid`, `username`, `password`, `codigo`, `created_at`, `updated_at`, `status_id`, `statusUserAdicional`, `status_senha_id`, `telefone`, `email`, `empresa_id`, `foto`, `used`) VALUES
	(778, 'Emanuel Lima', '7801430b-8d2b-45c6-b09d-2354a04d8aa9', 'Emanuel Lima', '$2y$10$xGUEE5OvybkSQ1i7puQP9eJAQ84kUC9W2ZznkJh6RhsB9i9du6QSG', 'EWTJCY', '2023-11-14 16:24:03', '2023-11-14 16:24:03', 1, 1, 2, '943117628', 'emanuellima.lnb@gmail.com', NULL, 'utilizadores/cliente/avatarEmpresa.png', 'Y'),
	(779, 'zua@gmail.com', '07cff175-da72-46d4-8cb7-35b6ad8e96d1', 'zua@gmail.com', '$2y$10$sFdH6qGZMnkAL8VX5XQSVOlrblLdA2RlpjjbiJuRLaYg0dl/8mzC6', 'JQ3XJM', '2023-11-16 13:09:58', '2023-11-16 13:09:58', 1, 1, 2, '923112233', 'conzuadas@gmail.com', NULL, 'utilizadores/cliente/avatarEmpresa.png', 'N'),
	(780, 'zuadas', '23c2ef59-5040-48ce-bcac-c5a54ced1600', 'zuadas', '$2y$10$cIScCeqX.6j/06ENutlWXOYf9QzI8trb6CsqPqwxZL78sznx2cyRS', 'PL5L9J', '2023-11-16 13:13:44', '2023-11-16 13:13:44', 1, 1, 2, '923112233', 'conzuadas@gmail.com', NULL, 'utilizadores/cliente/avatarEmpresa.png', 'N'),
	(781, 'zuadas', '283ca599-d502-41a7-a869-aa34d8ff2052', 'zuadas', '$2y$10$KKbziJ91SKlhxnXwUfNGX.iF.FLvAtLYSaM27oB.fCZCMrFfospYK', '8YBW4A', '2023-11-21 14:16:59', '2023-11-21 14:16:59', 1, 1, 2, '952955191', 'conzuadas@gmail.com', NULL, 'utilizadores/cliente/avatarEmpresa.png', 'N'),
	(782, 'zuadas', '1fa5ca8b-71b4-4ce4-9a93-17cb8554a423', 'zuadas', '$2y$10$XcV3g1HFy.bSWYXMs/BnLe.x9dJrwZJu9nWDmTORsbCDfuiBIbjGe', 'Q6L3MG', '2023-11-21 14:20:38', '2023-11-21 14:20:38', 1, 1, 2, '952955191', 'conzuadas@gmail.com', NULL, 'utilizadores/cliente/avatarEmpresa.png', 'N'),
	(783, 'Manuel Bumba', 'ef2db255-35d6-496d-95c3-fd3adc325648', 'Manuel Bumba', '$2y$10$r/h287tEhK8py0NJ.a7Z3uu/E4pUmfhJvFl.Hy3d8EdEXILDUnA6i', 'JTER6M', '2023-11-24 14:52:39', '2023-11-24 14:52:39', 1, 1, 2, '925674702', 'bumbauan@gmail.com', NULL, 'utilizadores/cliente/avatarEmpresa.png', 'Y'),
	(784, 'Ramos Soft', '88b32a7d-114e-4ce4-9cae-7813bc40de94', 'Ramos Soft', '$2y$10$pmKv35XwnS1Pt6TsFvR1BOa6RJhnGLZ/xhvABTvukRqMPCIGNI5FC', 'N0C793', '2023-12-06 22:39:48', '2023-12-06 22:39:48', 1, 1, 2, '923292970', 'info@ramossoft.com', NULL, 'utilizadores/cliente/avatarEmpresa.png', 'Y'),
	(785, 'Elizeu', 'f837c16d-7842-4169-a751-a2f4dc62e5f7', 'Elizeu', '$2y$10$oDxQ0LqHJA1L8oodGmUzDudvBdrQsf/uh5QZDXoPM55Vq5OQ2fN9.', 'U6L4U6', '2024-01-18 12:37:04', '2024-01-18 12:37:04', 1, 1, 2, '928789740', 'eliseucosta4693@gmail.com', NULL, 'utilizadores/cliente/avatarEmpresa.png', 'N');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.user_perfil
CREATE TABLE IF NOT EXISTS `user_perfil` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `perfil_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_profile_plan_id_foreign` (`user_id`),
  KEY `plan_profile_profile_id_foreign` (`perfil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=821 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.user_perfil: ~7 rows (aproximadamente)
INSERT INTO `user_perfil` (`id`, `user_id`, `perfil_id`) VALUES
	(814, 749, 29),
	(815, 750, 29),
	(816, 751, 29),
	(817, 752, 1),
	(818, 753, 29),
	(819, 1, 1),
	(820, 1, 29);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.validacao_user_recuperar_senha
CREATE TABLE IF NOT EXISTS `validacao_user_recuperar_senha` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `used` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.validacao_user_recuperar_senha: ~36 rows (aproximadamente)
INSERT INTO `validacao_user_recuperar_senha` (`id`, `userId`, `codigo`, `used`) VALUES
	(1, 704, '48PL4I', 'N'),
	(2, 704, 'EV337Y', 'N'),
	(3, 704, 'KJ2GON', 'N'),
	(4, 704, 'X06VCI', 'N'),
	(5, 704, 'I5W7ZO', 'N'),
	(6, 704, '6XCA95', 'N'),
	(7, 704, 'SKQ1Q7', 'N'),
	(8, 704, 'KSNW4H', 'N'),
	(9, 729, '2YE4II', 'N'),
	(10, 729, 'IKYPLO', 'N'),
	(11, 729, 'WEK788', 'N'),
	(12, 729, '1H4ENZ', 'N'),
	(13, 729, 'KNR0LQ', 'N'),
	(14, 729, 'POR8VI', 'N'),
	(15, 704, 'KCT6DZ', 'N'),
	(16, 729, 'Y81TXN', 'Y'),
	(17, 704, '2GI6SW', 'N'),
	(18, 729, 'KY6P7D', 'Y'),
	(19, 729, '92X9X4', 'N'),
	(20, 729, 'GDBXBM', 'N'),
	(21, 729, 'SRJ2OX', 'N'),
	(22, 729, 'Q9SBIA', 'N'),
	(23, 704, 'OAJ5IW', 'N'),
	(24, 704, '3KO0A0', 'N'),
	(25, 704, 'GQR0HM', 'N'),
	(26, 704, 'ZEK7YA', 'N'),
	(27, 704, '987M6C', 'N'),
	(28, 704, '55C77Z', 'N'),
	(29, 704, 'WKSNZU', 'N'),
	(30, 704, '884DJR', 'N'),
	(31, 718, '1D171P', 'Y'),
	(32, 718, '3W2FCD', 'Y'),
	(33, 718, 'ZICNDB', 'Y'),
	(34, 708, '5Q8L3S', 'Y'),
	(35, 708, 'WRXRHQ', 'Y'),
	(36, 708, '30JAN5', 'Y');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.valorcaracteristicas
CREATE TABLE IF NOT EXISTS `valorcaracteristicas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoria_caracteristica_id` int(11) NOT NULL,
  `designacao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.valorcaracteristicas: ~190 rows (aproximadamente)
INSERT INTO `valorcaracteristicas` (`id`, `categoria_caracteristica_id`, `designacao`) VALUES
	(1, 1, '16gb'),
	(2, 2, 'Preta'),
	(3, 3, '100 %'),
	(4, 4, 'É um facto estabelecido de que um leitor é distraído pelo conteúdo legível de uma página quando analisa a sua mancha gráfica. Logo, o uso de Lorem Ipsum leva a uma distribuição mais ou menos normal de letras, ao contrári'),
	(5, 5, 'MICRO SD 128GB CL10'),
	(6, 6, '12gb'),
	(7, 6, '16gb'),
	(8, 9, 'CAPACIDADE DO DISCO	1 TB'),
	(9, 10, 'T900 pro max'),
	(10, 12, 'Preto'),
	(11, 14, 'ANDROID, IOS'),
	(12, 16, ' T800 ultra'),
	(13, 17, '3G, Wi-fi, Bluetooth, Resistente à água'),
	(14, 18, 'Android, Ios'),
	(15, 19, 'it2160'),
	(16, 20, 'Lanterna, Camera, bateria 1000mAh, Facebook'),
	(17, 23, 'Nokia 2175'),
	(18, 24, 'ITEL S18, 64GB ROM + 4(2+2)GB RAM, F-8MP'),
	(19, 25, '6,6 polegadas'),
	(20, 26, '8.0MP'),
	(21, 27, ' 8.0 MP'),
	(22, 31, 'Android 12'),
	(23, 32, 'Octa-Core, UNISOC SC9863A (23nm)'),
	(24, 33, '2GB + 2GB'),
	(25, 34, '64 GB'),
	(26, 36, '5000 mAh'),
	(27, 36, 'txt'),
	(28, 38, 'Dual SIM (nano SIM)'),
	(30, 40, 'Infinix Smart 7 HD (Green Apple, 64 GB)  (4 GB RAM)'),
	(31, 41, 'Octa-core 1.6GHZ'),
	(32, 42, '6.6" HD+ Sunlight Display'),
	(33, 43, '500mAh 10W'),
	(34, 45, '4G/ 3G/2G'),
	(35, 46, 'Android 12'),
	(36, 47, '8 MP + lente AI, recursos de câmera: retrato, HDR, AI 3D Beauty, recursos de vídeo: gravação de vídeo HD'),
	(37, 48, 'Câmera frontal de 5MP'),
	(38, 49, 'Sensor de impressão digital, sensor de luz ambiente, sensor de proximidade, giroscópio (por software), bússola eletrônica'),
	(39, 51, '6.3" Scren'),
	(40, 52, '4000mAh'),
	(41, 54, '32ROM + 2RAM'),
	(42, 53, '5MP Dual camera'),
	(43, 55, '6.3" Scren'),
	(44, 56, '4000mAh'),
	(45, 57, '5MP Dual camera'),
	(46, 61, '	32ROM + 2RAM'),
	(47, 62, 'SUNMAX MODEL 6 PRO MAXI 3G, ROM 16GB, RAM 2GB, T8MP, F5MP'),
	(48, 63, 'SUNMAX MODEL 6 PRO MAXI 3G, ROM 16GB, RAM 2GB, T8MP, F5MP'),
	(49, 65, '6,5 polegadas'),
	(50, 67, '6,5 polegadas'),
	(51, 69, 'IPS LCD'),
	(52, 71, 'IPS LCD'),
	(53, 73, '8.0MP'),
	(54, 74, '8.0MP'),
	(55, 75, '5.0MP'),
	(56, 76, '5.0MP'),
	(57, 77, 'Android 11'),
	(58, 78, 'Android 11'),
	(59, 79, '2 GB'),
	(60, 83, '16 GB'),
	(61, 80, '2GB'),
	(62, 84, '16 GB'),
	(63, 85, '4200 mAh'),
	(64, 86, '4200 mAh'),
	(65, 87, 'Dual SIM (nano SIM)'),
	(66, 88, 'Dual SIM (nano SIM)'),
	(67, 89, '6.7" HD plus IPS com 20:9 2.5D Curvo '),
	(68, 92, '13MP'),
	(69, 93, '5MP'),
	(70, 94, '4G/ 3G/ 2G'),
	(71, 95, 'Senha Digital Face ID'),
	(72, 97, '4200mAh'),
	(73, 98, 'Android 11'),
	(74, 99, 'Rom 32GB + Ram 3GB'),
	(75, 100, '6.7" HD plus IPS com 20:9 2.5D Curvo'),
	(76, 101, '13MP'),
	(77, 102, '5MP'),
	(78, 103, '4G/ 3G/ 2G'),
	(79, 104, 'Senha Digital Face ID'),
	(80, 105, '4200mAh'),
	(81, 106, 'Android 11'),
	(82, 107, 'Rom 32GB + Ram 3GB'),
	(84, 118, '1.77"'),
	(85, 120, '5C'),
	(86, 121, 'On'),
	(87, 122, 'FM'),
	(88, 123, '1.77"'),
	(89, 124, '5C'),
	(90, 125, 'On'),
	(91, 126, 'FM'),
	(92, 127, '1.77"'),
	(93, 128, '5C'),
	(94, 129, 'On'),
	(95, 130, 'FM'),
	(96, 131, '1.77"'),
	(97, 133, '5C'),
	(98, 134, 'On'),
	(99, 135, 'FM'),
	(100, 136, '1.77"'),
	(101, 138, '5C'),
	(102, 139, 'On'),
	(103, 142, 'FM'),
	(104, 145, '1.77'),
	(105, 146, '5C'),
	(106, 147, 'On'),
	(107, 148, 'FM'),
	(108, 149, '1.77"'),
	(109, 151, '5C'),
	(110, 152, 'On'),
	(111, 153, 'FM'),
	(112, 154, 'On'),
	(113, 155, 'versão 2.0'),
	(114, 156, 'On'),
	(115, 157, 'FM'),
	(116, 160, 'On'),
	(117, 161, 'Versão  2.0'),
	(118, 162, 'On'),
	(119, 163, 'On'),
	(120, 165, '1.77"'),
	(121, 166, '800mAh'),
	(122, 167, 'On'),
	(123, 168, 'On'),
	(124, 169, 'On'),
	(125, 171, 'On'),
	(126, 168, 'FM'),
	(127, 172, 'On'),
	(128, 173, 'Cartão  de Memória'),
	(129, 174, 'PRETO'),
	(130, 175, 'Térmica'),
	(131, 176, 'Sim'),
	(132, 177, 'Rj-45, Rj-11'),
	(133, 178, 'Sim'),
	(134, 179, 'TERMICA'),
	(135, 194, '2.8GHZ'),
	(136, 191, '4GB'),
	(137, 189, 'INTEGRADA INTEL HD'),
	(138, 185, '15.6"'),
	(139, 184, 'INTEL CELERON'),
	(140, 183, 'SSD'),
	(141, 182, 'WINDOWS 10 HOME 64 bit'),
	(142, 181, '256GB'),
	(143, 180, 'SIM'),
	(144, 186, 'SIM'),
	(145, 190, 'SIM'),
	(146, 192, 'SIM'),
	(147, 193, 'SIM'),
	(148, 195, 'NÃO'),
	(149, 196, 'NÃO'),
	(150, 197, '11.6”, HD (1366 x 768), TN'),
	(151, 198, '47Wh'),
	(152, 199, '64GB'),
	(153, 200, 'WINDOWS 10 PROFISSIONAL 64 bit'),
	(154, 201, 'AMD 3015e'),
	(155, 202, '11.6"'),
	(156, 203, 'SIM'),
	(157, 204, 'AMD Radeon RX Vega 3'),
	(158, 205, 'Type-A'),
	(159, 207, '3.0'),
	(160, 208, '4GB'),
	(161, 209, '4GB'),
	(162, 210, 'SIM'),
	(163, 213, 'SIM'),
	(164, 214, '1366X768'),
	(165, 215, '128GB'),
	(166, 216, 'WINDOWS 10 PROFISSIONAL 64 bit'),
	(167, 217, 'SSD'),
	(168, 218, 'INTEL CELERON N4020'),
	(169, 219, 'SIM'),
	(170, 220, 'INTEL UHD 600'),
	(171, 221, '3'),
	(172, 222, 'SIM'),
	(173, 224, '1'),
	(174, 225, 'DDR4'),
	(175, 226, 'HD'),
	(176, 227, '4GB'),
	(177, 228, 'SIM'),
	(178, 229, 'SIM'),
	(179, 232, '2.8GHZ'),
	(180, 236, '802.11 G/N'),
	(181, 237, '4 MB'),
	(182, 238, '11.6\'\''),
	(183, 244, 'PRETO'),
	(184, 245, 'FULL HD'),
	(185, 246, '5MS'),
	(186, 247, 'SIM'),
	(187, 248, '21.5"'),
	(188, 249, '1'),
	(189, 250, 'SIM'),
	(190, 252, 'AUDIO JACK 3,5MM'),
	(191, 251, 'PRETO'),
	(192, 253, 'SIM');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.valorcaracteristicas_produtos
CREATE TABLE IF NOT EXISTS `valorcaracteristicas_produtos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `valor_caracteristica_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.valorcaracteristicas_produtos: ~201 rows (aproximadamente)
INSERT INTO `valorcaracteristicas_produtos` (`id`, `produto_id`, `valor_caracteristica_id`) VALUES
	(1, 646, 1),
	(2, 646, 2),
	(3, 646, 3),
	(4, 645, 4),
	(5, 764, 5),
	(6, 118, 6),
	(7, 774, 7),
	(8, 774, 8),
	(9, 802, 9),
	(10, 684, 10),
	(12, 684, 12),
	(13, 684, 13),
	(14, 684, 14),
	(15, 684, 15),
	(16, 710, 16),
	(17, 710, 17),
	(18, 710, 18),
	(19, 675, 19),
	(20, 675, 20),
	(21, 1205, 21),
	(22, 664, 22),
	(23, 668, 23),
	(24, 669, 24),
	(25, 669, 25),
	(26, 669, 26),
	(27, 669, 27),
	(31, 669, 31),
	(32, 669, 32),
	(33, 669, 33),
	(34, 669, 34),
	(36, 669, 36),
	(38, 669, 38),
	(40, 670, 40),
	(41, 670, 41),
	(42, 670, 42),
	(43, 670, 43),
	(45, 670, 45),
	(46, 670, 46),
	(47, 670, 47),
	(48, 670, 48),
	(49, 670, 49),
	(51, 1099, 51),
	(52, 1099, 52),
	(53, 1099, 53),
	(54, 1099, 54),
	(55, 1098, 55),
	(56, 1098, 56),
	(57, 1098, 57),
	(61, 1098, 61),
	(62, 742, 62),
	(63, 1114, 63),
	(65, 742, 65),
	(67, 1114, 67),
	(69, 742, 69),
	(71, 1114, 71),
	(73, 742, 73),
	(74, 1114, 74),
	(75, 742, 75),
	(76, 1114, 76),
	(77, 742, 77),
	(78, 1114, 78),
	(79, 742, 79),
	(80, 1114, 80),
	(83, 742, 83),
	(84, 1114, 84),
	(85, 742, 85),
	(86, 1114, 86),
	(87, 742, 87),
	(88, 1114, 88),
	(89, 1089, 89),
	(92, 1089, 92),
	(93, 1089, 93),
	(94, 1089, 94),
	(95, 1089, 95),
	(97, 1089, 97),
	(98, 1089, 98),
	(99, 1089, 99),
	(100, 1090, 100),
	(101, 1090, 101),
	(102, 1090, 102),
	(103, 1090, 103),
	(104, 1090, 104),
	(105, 1090, 105),
	(106, 1090, 106),
	(107, 1090, 107),
	(109, 1173, 109),
	(112, 1173, 112),
	(114, 1173, 114),
	(115, 1173, 115),
	(116, 1173, 116),
	(117, 1173, 117),
	(118, 1101, 118),
	(120, 1101, 120),
	(121, 1101, 121),
	(122, 1101, 122),
	(123, 668, 123),
	(124, 668, 124),
	(125, 668, 125),
	(126, 668, 126),
	(127, 1144, 127),
	(128, 1144, 128),
	(129, 1144, 129),
	(130, 1144, 130),
	(131, 1145, 131),
	(133, 1145, 133),
	(134, 1145, 134),
	(135, 1145, 135),
	(136, 1146, 136),
	(138, 1146, 138),
	(139, 1146, 139),
	(142, 1146, 142),
	(145, 1147, 145),
	(146, 1147, 146),
	(147, 1147, 147),
	(148, 1147, 148),
	(149, 1148, 149),
	(151, 1148, 151),
	(152, 1148, 152),
	(153, 1148, 153),
	(154, 1139, 154),
	(155, 1139, 155),
	(156, 1139, 156),
	(157, 1139, 157),
	(160, 1134, 160),
	(161, 1134, 161),
	(162, 1134, 162),
	(163, 1134, 163),
	(165, 1104, 165),
	(166, 1104, 166),
	(167, 1104, 167),
	(168, 1104, 168),
	(169, 1104, 169),
	(171, 1104, 171),
	(172, 1104, 172),
	(173, 1104, 173),
	(174, 1231, 174),
	(175, 1231, 175),
	(176, 1231, 176),
	(177, 1231, 177),
	(178, 1231, 178),
	(179, 1231, 179),
	(180, 1232, 180),
	(181, 1232, 181),
	(182, 1232, 182),
	(183, 1232, 183),
	(184, 1232, 184),
	(185, 1232, 185),
	(186, 1232, 186),
	(189, 1232, 189),
	(190, 1232, 190),
	(191, 1232, 191),
	(192, 1232, 192),
	(193, 1232, 193),
	(194, 1232, 194),
	(195, 1234, 195),
	(196, 1234, 196),
	(197, 1234, 197),
	(198, 1234, 198),
	(199, 1234, 199),
	(200, 1234, 200),
	(201, 1234, 201),
	(202, 1234, 202),
	(203, 1234, 203),
	(204, 1234, 204),
	(205, 1234, 205),
	(207, 1234, 207),
	(208, 1234, 208),
	(209, 1234, 209),
	(210, 1234, 210),
	(211, 1234, 211),
	(212, 1234, 212),
	(213, 1235, 213),
	(214, 1235, 214),
	(215, 1235, 215),
	(216, 1235, 216),
	(217, 1235, 217),
	(218, 1235, 218),
	(219, 1235, 219),
	(220, 1235, 220),
	(221, 1235, 221),
	(222, 1235, 222),
	(224, 1235, 224),
	(225, 1235, 225),
	(226, 1235, 226),
	(227, 1235, 227),
	(228, 1235, 228),
	(229, 1235, 229),
	(232, 1235, 232),
	(236, 1235, 236),
	(237, 1235, 237),
	(238, 1235, 238),
	(244, 1236, 244),
	(245, 1236, 245),
	(246, 1236, 246),
	(247, 1236, 247),
	(248, 1236, 248),
	(249, 1236, 249),
	(250, 1236, 250),
	(251, 1348, 251),
	(252, 1348, 252),
	(253, 1348, 253);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
