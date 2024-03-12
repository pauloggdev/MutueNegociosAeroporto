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
	(1, 'USD', 828.776),
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
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.clientes: ~8 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `nome`, `uuid`, `pessoa_contacto`, `email`, `website`, `numero_contrato`, `data_contrato`, `tipo_conta_corrente`, `conta_corrente`, `telefone_cliente`, `taxa_de_desconto`, `limite_de_credito`, `endereco`, `gestor_id`, `canal_id`, `status_id`, `nif`, `operador`, `tipo_cliente_id`, `user_id`, `created_by`, `empresa_id`, `created_at`, `updated_at`, `pais_id`, `diversos`, `cidade`, `centroCustoId`) VALUES
	(1, 'Consumidor final', '673dc30a-5cb0-4d9d-be19-aeae663f0c05', NULL, NULL, NULL, NULL, NULL, 'Nacional', '31.1.2.1.1', NULL, 0, 0, NULL, NULL, 2, 1, '999999999', NULL, 2, NULL, NULL, 1, '2021-04-16 10:36:11', '2021-04-16 10:36:11', 1, 'Sim', 'Luanda', NULL),
	(2, 'SCHLUMBERGER LOGELCO, INC', 'c184ca0b-c2ff-4a84-8dc1-120b85cae437', 'SCHLUMBERGER LOGELCO, INC', 'airport.lad@tlc-com.ch', NULL, NULL, '2024-02-03', 'Nacional', '31.1.2.1.2', '932338415', 0, 0, 'TLC Lda', NULL, 2, 1, '999999999', 'Airport Temporary Operator', 2, 1, NULL, 1, '2024-02-03 07:23:34', '2024-02-03 07:23:34', 1, 'Não', 'Luanda', 1),
	(3, 'NGONGO THOMAS &  FILHOS COMERCIO GERAL LTD', 'c609441e-438e-468d-a3bf-eadb41f556a2', 'Thomas', 'kingsleychima75@gmail.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.3', '+244923437631', 0, 0, 'Rua Santos Nº18, Bairro Cassenda', NULL, 2, 1, '54176617919', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-06 15:06:06', '2024-02-20 10:18:06', 1, 'Não', 'Luanda', 1),
	(264, 'GRUPO LIZ - COMERCIO E SERVIÇOS, LIMITADA', '26f1d557-74d5-453e-8884-415c815971ea', 'Ian Pereira', 'ian.pereira@grupoliz.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.4', '923520471', 0, 0, 'Bairro Cassenda - Rua 02, Casa nº 12, Maianga', NULL, 2, 1, '5403084690', 'Milton Lucas', 2, 751, NULL, 1, '2024-02-19 10:11:36', '2024-02-22 12:37:59', 1, 'Não', 'Luanda', 1),
	(265, 'DHL Global Forwarding Angola Ltd', '73ca5753-3193-46a0-bc7d-52b273cc9a5f', 'Ana Pinto', 'anacruz.pinto@dhl.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.5', '948625996', 0, 0, 'Avenida 21 de Janeiro  Aeroporto', NULL, 2, 1, '5401071809', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-19 10:30:35', '2024-02-19 10:30:35', 1, 'Não', 'Luanda', 1),
	(266, 'Panalpina Transportes Mundiais Navegação e Transitos SA', 'fc7e0fcb-de7a-4fed-81dd-d55d53c500f6', 'Dario Manuel', 'dario.manuel@ao.dsv.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.6', '226422041', 0, 0, 'Rua Kima Kienda 106, Estr. da Boavista – Luanda', NULL, 2, 1, '5403005862', 'Milton Lucas', 1, 751, NULL, 1, '2024-02-20 08:59:35', '2024-02-22 12:40:01', 1, 'Não', 'Luanda', 1),
	(267, 'MULTIFLIGHT LDA', 'c397309b-7a26-4843-80cc-1187089aa8b3', 'Silvestre', 'opsmultiflight@gmail.com', NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.7', '+244933535482', 0, 0, 'Av. Revolução de Outubro, Bloco 47 B-3 Andar', NULL, 2, 1, '5417323659', 'Carlos Sampaio', 2, 750, NULL, 1, '2024-02-20 11:03:01', '2024-02-21 12:24:28', 1, 'Não', 'Luanda', 1),
	(268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'f4678f33-4035-4be4-9de7-861778fe89ba', 'Joana Da Costa ', NULL, NULL, NULL, '2023-12-19', 'Nacional', '31.1.2.1.8', '+244912505071', 0, 0, 'Rua Fernando Pessoa, Nº52', NULL, 2, 1, '5402032955', 'Milton Lucas', 2, 751, NULL, 1, '2024-02-20 14:35:24', '2024-02-20 14:35:24', 1, 'Não', 'Luanda', 1);

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
	(1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '937036322', '937036322', NULL, 'Estrada nacional 230, km 42 - Municipio do Icolo e Bengo, Distrito  do Bom Jesus, Luanda-Angola', 1, 0, 2, 1, '5001720538', 1, 1, 1, 'utilizadores/cliente/lXLysP0gRqaSb6RtjDsvvrn2DP1VJfyZvina9Sxo.png', 'ato.ao', 'info@ato.ao', '4EEJFPK', NULL, '2024-01-23 16:10:54', '2024-01-23 16:10:54', 'Luanda', NULL, NULL, 'N');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.existencias_stocks: ~27 rows (aproximadamente)
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
	(27, 27, 1, NULL, 0, 2, 1, 1, 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.facturas: ~13 rows (aproximadamente)
INSERT INTO `facturas` (`id`, `texto_hash`, `codigo_moeda`, `clienteId`, `nome_do_cliente`, `nomeProprietario`, `telefone_cliente`, `nif_cliente`, `email_cliente`, `endereco_cliente`, `tipo_documento`, `numSequenciaFactura`, `numeracaoFactura`, `numeracaoProforma`, `hashValor`, `cliente_id`, `empresa_id`, `centroCustoId`, `user_id`, `operador`, `created_at`, `updated_at`, `paisOrigemId`, `cartaDePorte`, `tipoDeAeronave`, `pesoMaximoDescolagem`, `dataDeAterragem`, `dataDeDescolagem`, `horaDeAterragem`, `horaDeDescolagem`, `horaEstacionamento`, `peso`, `dataEntrada`, `dataSaida`, `nDias`, `taxaIva`, `cambioDia`, `moeda`, `moedaPagamento`, `horaExtra`, `contraValor`, `valorIliquido`, `valorImposto`, `total`, `codigoBarra`, `tipoDocumento`, `formaPagamentoId`, `tipoOperacao`, `isencaoIVA`, `convertido`, `anulado`, `taxaRetencao`, `valorRetencao`, `tipoFatura`, `tipoMercadoria`, `observacao`) VALUES
	(114, '2024-03-01;2024-03-01T09:29:37;FP ATO2024/1;151172.94;', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'TESTE', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 1, 'FP ATO2024/1', NULL, 'duGwzsMmBa1mhDZ8x3z+4fIMAolC3iu2b71cGl5ePd9ymXPwdRJZGrVvDWMthpKf85EFQsHsMbRBWZAubvXKUqT4ZqDqKcGkgROm8hiJJMl7Ym3env5Vgcm5qj+FBQ0dnLITjmp0p0R0iby4BURNnEBgra8qD7KiWbH3QtgFwyk=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-01 09:29:37', '2024-03-01 09:29:37', NULL, 'AAAAAA', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2000, '2024-03-01 00:00:00', '2024-03-02 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 182.4, 132607.84, 18565.0976, 151172.9376, '10002681141', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 1, NULL),
	(115, '2024-03-01;2024-03-01T09:30:36;FR ATO2024/1;755.86;', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'FDAFAFA', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 1, 1, 'FR ATO2024/1', NULL, 'cr4G54hFCFpv6oAvtF0RXhEly/YKrtjUMLo7iWlLRHzQKhj/hzIhsf3ACDhMlCmbBB7mbJiG9d3AHGdK/zWVLa7TDpY6XD3yxgJ7GSgV3mupQiCPv1cszkWDyB+o55hd5wpzr4Js1Q2lyFCbKp3caPf0MurbEDCBR2fuHJNdgKc=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-01 09:30:36', '2024-03-01 09:30:36', NULL, 'AAAAA', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, '2024-02-29 00:00:00', '2024-03-03 00:00:00', 3, 14, 828.799, 'USD', 'AOA', NULL, 0.912, 663.0392, 92.825488, 755.864688, '10002681151', 1, 1, 1, 'N', 'N', 'N', 0, 0, 1, 1, NULL),
	(116, '2024-03-01;2024-03-01T14:45:51;FR ATO2024/2;1511.73;cr4G54hFCFpv6oAvtF0RXhEly/YKrtjUMLo7iWlLRHzQKhj/hzIhsf3ACDhMlCmbBB7mbJiG9d3AHGdK/zWVLa7TDpY6XD3yxgJ7GSgV3mupQiCPv1cszkWDyB+o55hd5wpzr4Js1Q2lyFCbKp3caPf0MurbEDCBR2fuHJNdgKc=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'TESTE', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 2, 'FR ATO2024/2', NULL, 'Xf0NylC+/INmpTAdEMmH/nVbNYcRuM8xRrBmD6WmER6rVVB/QL1LZFmBUS01zxbcFL2shgoVIc/gyu/qclSBlDcJuabv+Y0POoK3d4XsM5ZHtxoeoQ7xcU/UZOHbSsMRrpsXkl2c3mHkOQ7LjLo5mFUF8zenc8J/dGAidMqIrBk=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-01 14:45:51', '2024-03-01 14:45:51', NULL, 'AAAAAA', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20, '2024-03-01 00:00:00', '2024-03-02 00:00:00', 1, 14, 828.799, 'USD', 'AOA', NULL, 1.824, 1326.0784, 185.650976, 1511.729376, '10002651161', 1, 1, 1, 'N', 'N', 'N', 0, 0, 1, 1, NULL),
	(117, '2024-03-01;2024-03-01T15:28:03;FR ATO2024/3;1511.73;Xf0NylC+/INmpTAdEMmH/nVbNYcRuM8xRrBmD6WmER6rVVB/QL1LZFmBUS01zxbcFL2shgoVIc/gyu/qclSBlDcJuabv+Y0POoK3d4XsM5ZHtxoeoQ7xcU/UZOHbSsMRrpsXkl2c3mHkOQ7LjLo5mFUF8zenc8J/dGAidMqIrBk=', 1, 265, 'DHL Global Forwarding Angola Ltd', 'fdafafaa', '948625996', '5401071809', 'anacruz.pinto@dhl.com', 'Avenida 21 de Janeiro  Aeroporto', 1, 3, 'FR ATO2024/3', NULL, 'cosddGrsGQJO5MWxmZvuq0mr7NQ1Gr85bPfnGQ57P55zfgwcQ10NpzwxY4Q/mgksxFm+aWW97V1XTY42jmDflLA5Mp4GjG15W/WzofYyOm3hJlBSJOnZ/j+JZ+xlzM46n/VdXF8ynLrNGagQGv4yZI/eu4NmGWUdgUOafW8vY5s=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-01 15:28:03', '2024-03-01 15:28:03', NULL, NULL, 'AAAAAA', 200, '2024-03-01', '2024-03-03', '15:10:00', '16:10:00', NULL, 20, NULL, NULL, NULL, 14, 828.799, 'USD', 'AOA', NULL, 1.824, 1326.0784, 185.650976, 1511.729376, '10002651171', 1, 1, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(118, '2024-03-01;2024-03-01T15:52:50;FP ATO2024/2;8011107.48;duGwzsMmBa1mhDZ8x3z+4fIMAolC3iu2b71cGl5ePd9ymXPwdRJZGrVvDWMthpKf85EFQsHsMbRBWZAubvXKUqT4ZqDqKcGkgROm8hiJJMl7Ym3env5Vgcm5qj+FBQ0dnLITjmp0p0R0iby4BURNnEBgra8qD7KiWbH3QtgFwyk=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'FDSGDSGFSAG', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 2, 'FP ATO2024/2', NULL, 'q7/HsOIBrJ31T2nQItGG4CEJDki6abPRf9EkEHTgNChmtEbK6lucQ0bpetQIELpma8KxCuxdJ1QL+uVE0GTISZAZCxANZ9iIE+wVWohXrBnPP2k8eFZAY1VApas5HrHNTBv/yuiyG6EVV+ZkbO8vIHQWObEXmPl3HRVzqitmo2A=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-01 15:52:50', '2024-03-01 15:52:50', NULL, NULL, 'AAAAAA', 2000, '2024-03-01', '2024-03-03', '15:00:00', '16:00:00', NULL, 37350, NULL, NULL, NULL, 14, 828.799, 'USD', 'AOA', NULL, 9665.9232, 7027287.26512, 983820.2171168, 8011107.4822368, '10002681181', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(119, '2024-03-01;2024-03-01T15:54:29;FP ATO2024/3;5187952.87;q7/HsOIBrJ31T2nQItGG4CEJDki6abPRf9EkEHTgNChmtEbK6lucQ0bpetQIELpma8KxCuxdJ1QL+uVE0GTISZAZCxANZ9iIE+wVWohXrBnPP2k8eFZAY1VApas5HrHNTBv/yuiyG6EVV+ZkbO8vIHQWObEXmPl3HRVzqitmo2A=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'DAFDAFAFDAFA', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 3, 'FP ATO2024/3', NULL, 'QyHolVUVjb54FSjJEqVIKy3gbDB8W2uyXhoWol/7nSysHGIC4f9sfs+Hc4l7K/kHweRNzTWKM7uiohutpgoK3xFhBs0cccgcuu+K9vu22q5sOW3Zd24pxBnZ3AwlC5CUoyAVDvnFbxc4xJnGEvN7fKa29ZB0R1xUfAbGBoYFq44=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-01 15:54:29', '2024-03-01 15:54:29', NULL, NULL, 'AAAAAA', 2000, '2024-03-01', '2024-03-03', '15:00:00', '16:00:00', NULL, 31286, NULL, NULL, NULL, 14, 828.799, 'USD', 'AOA', NULL, 6259.6032, 4550835.85312, 637117.0194368, 5187952.8725568, '10002681191', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(120, '2024-03-01;2024-03-01T15:55:33;FP ATO2024/4;5187952.87;QyHolVUVjb54FSjJEqVIKy3gbDB8W2uyXhoWol/7nSysHGIC4f9sfs+Hc4l7K/kHweRNzTWKM7uiohutpgoK3xFhBs0cccgcuu+K9vu22q5sOW3Zd24pxBnZ3AwlC5CUoyAVDvnFbxc4xJnGEvN7fKa29ZB0R1xUfAbGBoYFq44=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'FDAFAFAF', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 4, 'FP ATO2024/4', NULL, 'hCUkDewIFYa4E2JKkP7ahBog61kzjW9O+uBsi/iJSQaV6/fL7D/+gmegVK2BC69y0+D+iP+kETyTd7V1Riu2ze4ZwMvuE/8NuFjyv7I+rJRe+Uzbk17OU4W3JWNmcCfGLf8Cm1Yj3OisnPpUlzDzKECTjWtGWAuOTOWkhVuvEBM=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-01 15:55:33', '2024-03-01 15:55:33', NULL, NULL, 'DFAFAFAF', 20, '2024-03-01', '2024-03-03', '15:00:00', '16:00:00', NULL, 68636, NULL, NULL, NULL, 14, 828.799, 'USD', 'AOA', NULL, 6259.6032, 4550835.85312, 637117.0194368, 5187952.8725568, '10002681201', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(121, '2024-03-07;2024-03-07T09:31:40;FP ATO2024/5;3368323.02;hCUkDewIFYa4E2JKkP7ahBog61kzjW9O+uBsi/iJSQaV6/fL7D/+gmegVK2BC69y0+D+iP+kETyTd7V1Riu2ze4ZwMvuE/8NuFjyv7I+rJRe+Uzbk17OU4W3JWNmcCfGLf8Cm1Yj3OisnPpUlzDzKECTjWtGWAuOTOWkhVuvEBM=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'aaaaaaaa', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 5, 'FP ATO2024/5', NULL, 'fdVWpbsFnvv0DOG3Nr5U+nnN0FM/gY/ddyLfKS+VVIH+JFsh0lHEc12Bt3P4N/h7DQm54U50f+iF6extyBVzKmLrhEWj5tPUBnLSmbOywWhKm3PAuGIK5/EeoJGm696VUwqHf1D82IL6nihvwTFRfW0ilpeaatS4kwbm4QncaWQ=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 09:31:40', '2024-03-07 09:31:40', NULL, NULL, 'AAAAAAAAAA', 397, '2024-01-26', '2024-01-28', '06:13:00', '17:04:00', NULL, 0, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 4064.214, 2954669.3176, 413653.704464, 3368323.022064, '10002681211', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, 'fdafaf'),
	(122, '2024-03-07;2024-03-07T12:43:20;FP ATO2024/6;1133.77;fdVWpbsFnvv0DOG3Nr5U+nnN0FM/gY/ddyLfKS+VVIH+JFsh0lHEc12Bt3P4N/h7DQm54U50f+iF6extyBVzKmLrhEWj5tPUBnLSmbOywWhKm3PAuGIK5/EeoJGm696VUwqHf1D82IL6nihvwTFRfW0ilpeaatS4kwbm4QncaWQ=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'TESTE', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 6, 'FP ATO2024/6', NULL, 'bmt+z7tLyuDKUPX5AKCCc4JDu+JAj/zFqyJqa7Be4WPvq7vwSewO2VvgWpFCDYRpZoljeKytWbtecURPhpAIQteZhblW1NwFevOqX62MvDFi9T1PkB5tfokkI3lzAjACoL/J+QU6dWSRNTSVoVAHlul8mBwLbigS7NRcBjXzT3w=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 12:43:20', '2024-03-07 12:43:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 1.368, 994.5312, 139.234368, 1133.765568, '10002681221', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(124, '2024-03-07;2024-03-07T12:48:03;FP ATO2024/7;1133.77;bmt+z7tLyuDKUPX5AKCCc4JDu+JAj/zFqyJqa7Be4WPvq7vwSewO2VvgWpFCDYRpZoljeKytWbtecURPhpAIQteZhblW1NwFevOqX62MvDFi9T1PkB5tfokkI3lzAjACoL/J+QU6dWSRNTSVoVAHlul8mBwLbigS7NRcBjXzT3w=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'TESTE', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 7, 'FP ATO2024/7', NULL, 'xFyaTXttyG7DZTm2Kf2GfoqRCXBQa4odpKq/t7mLwvDVyDO6xQGC0syXUdU/VoXAoiuS6WBSfk0aXSnS8qK/8M4dJXa9YNoUlUoODlOQxps0mIHak22P6wjRyDD7WQA+MnGB7hr+iEDe3YQW1HfOOyS6haaE4ZrDwID1GOwTIeM=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 12:48:03', '2024-03-07 12:48:03', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 1.368, 994.5312, 139.234368, 1133.765568, '10002681241', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(125, '2024-03-07;2024-03-07T12:51:44;FP ATO2024/8;226753.11;xFyaTXttyG7DZTm2Kf2GfoqRCXBQa4odpKq/t7mLwvDVyDO6xQGC0syXUdU/VoXAoiuS6WBSfk0aXSnS8qK/8M4dJXa9YNoUlUoODlOQxps0mIHak22P6wjRyDD7WQA+MnGB7hr+iEDe3YQW1HfOOyS6haaE4ZrDwID1GOwTIeM=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'TRTTWTW', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 8, 'FP ATO2024/8', NULL, 'a0Ie02fdbegnduhw7OxNN3lzmsmv4fgJif2pmN5ptijCHgTSOS+isGvCUxP2dvgCdsbko1Uod1JPbaoV7WBSJEWhgD73dNLGvQbxFjQHj9qDatD1kKptflHeTsvXp0NepYcDDIx+cA71VWb1NaP+xvBcRLj90qUye5/Q3Y37nQc=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 12:51:44', '2024-03-07 12:51:44', NULL, 'AAAAA', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3000, '2024-03-05 00:00:00', '2024-03-08 00:00:00', 3, 14, 828.776, 'USD', 'AOA', NULL, 273.6, 198906.24, 27846.8736, 226753.1136, '10002681251', 3, NULL, 1, 'N', 'N', 'N', 0, 0, 1, 1, NULL),
	(126, '2024-03-07;2024-03-07T12:52:46;FP ATO2024/9;15116.87;a0Ie02fdbegnduhw7OxNN3lzmsmv4fgJif2pmN5ptijCHgTSOS+isGvCUxP2dvgCdsbko1Uod1JPbaoV7WBSJEWhgD73dNLGvQbxFjQHj9qDatD1kKptflHeTsvXp0NepYcDDIx+cA71VWb1NaP+xvBcRLj90qUye5/Q3Y37nQc=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'FDSFSGSGS', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 9, 'FP ATO2024/9', NULL, 'Kj0iGmrR5un+M9K1eotDdotAhtO1afO7pM+Bjw8/f+DU2M0+ubKaV4wEiUu2GD9JkWJBXuhniKuCTmXgigZYtS6lrydBzu7bK3Jmu2y7d1T2kFOhTaLbWwytLapoVP9npoFVCdQG8U9p034jSJ8/Mk10K+TXb7OdoidlIdjrHyk=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 12:52:46', '2024-03-07 12:52:46', NULL, NULL, 'AAAAAAA', 200, '2024-03-04', '2024-03-08', '15:00:00', '16:00:00', NULL, 200, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', 0, 18.24, 13260.416, 1856.45824, 15116.87424, '10002681261', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(127, '2024-03-07;2024-03-07T13:05:32;FP ATO2024/10;529.09;Kj0iGmrR5un+M9K1eotDdotAhtO1afO7pM+Bjw8/f+DU2M0+ubKaV4wEiUu2GD9JkWJBXuhniKuCTmXgigZYtS6lrydBzu7bK3Jmu2y7d1T2kFOhTaLbWwytLapoVP9npoFVCdQG8U9p034jSJ8/Mk10K+TXb7OdoidlIdjrHyk=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'TESTE', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 10, 'FP ATO2024/10', NULL, 'W5+Qg980lEZKaAgdLPje7CAtnGyrAgsZyZieBVMK5D8Psa++/62BDNwpMxums6OGLzcafQTzmN3/KHV+vw9OHtcHCaCJDZPeyxlM6qvGGkYvqbx+hWeh8ZjDg0GRkpUYrdsV6j+rDVro41IgS5d4ECwMRmuIch+1Ohk1VsrqFxo=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 13:05:32', '2024-03-07 13:05:32', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 0.6384, 464.11456, 64.9760384, 529.0905984, '10002681271', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 3, NULL, NULL),
	(128, '2024-03-07;2024-03-07T15:30:30;FP ATO2024/11;3779.22;W5+Qg980lEZKaAgdLPje7CAtnGyrAgsZyZieBVMK5D8Psa++/62BDNwpMxums6OGLzcafQTzmN3/KHV+vw9OHtcHCaCJDZPeyxlM6qvGGkYvqbx+hWeh8ZjDg0GRkpUYrdsV6j+rDVro41IgS5d4ECwMRmuIch+1Ohk1VsrqFxo=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'FDFAAFDAFADFA', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 11, 'FP ATO2024/11', NULL, 'MiOy2b+3zZLeOJNISv0SLwpDAp++5meK8qZbHMlfL2Zg6OJuHkPtTH+kdgkUFgPhzs66U5jTGmMrHLbeYNAw2SX3maOExhpIzm6hvHM14BHh8jGOV/Wko8mmMdubU+RGzWY5pUz5n67OatFI808g+gEKOEj29Jb5IbgD/mIfzJA=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 15:30:30', '2024-03-07 15:30:30', NULL, NULL, 'AAAAA', 50, '2024-03-04', '2024-03-09', '15:00:00', '16:00:00', NULL, 50, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 4.56, 3315.104, 464.11456, 3779.21856, '10002681281', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(129, '2024-03-07;2024-03-07T15:31:16;FP ATO2024/12;381474.32;MiOy2b+3zZLeOJNISv0SLwpDAp++5meK8qZbHMlfL2Zg6OJuHkPtTH+kdgkUFgPhzs66U5jTGmMrHLbeYNAw2SX3maOExhpIzm6hvHM14BHh8jGOV/Wko8mmMdubU+RGzWY5pUz5n67OatFI808g+gEKOEj29Jb5IbgD/mIfzJA=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'GFSGSGSG', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 12, 'FP ATO2024/12', NULL, 'aNpbM/t7SaVPZxfd06bNyQpnJFn/MIp1a8bQPelMAlmj9Y6HRD3nLHnOIZecmr6AGyIlnccVJb1c7h2t5c/xXGrAM0VlD1PnX5OQL30EdhNaOiAPQNfCOlJ0J2eYBDNEg9xPVYCDxuVdJM/KFDmUQr18U3/ZP7M/ZyRGjvFuNcg=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 15:31:16', '2024-03-07 15:31:16', NULL, NULL, 'FGSGS', 20, '2024-03-04', '2024-03-10', '15:00:00', '16:00:00', NULL, 100, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', 5, 460.2864, 334626.59776, 46847.7236864, 381474.3214464, '10002681291', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(130, '2024-03-07;2024-03-07T15:35:14;FP ATO2024/13;385253.54;aNpbM/t7SaVPZxfd06bNyQpnJFn/MIp1a8bQPelMAlmj9Y6HRD3nLHnOIZecmr6AGyIlnccVJb1c7h2t5c/xXGrAM0VlD1PnX5OQL30EdhNaOiAPQNfCOlJ0J2eYBDNEg9xPVYCDxuVdJM/KFDmUQr18U3/ZP7M/ZyRGjvFuNcg=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'dsdsds', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 13, 'FP ATO2024/13', NULL, 'E1JIELFFbkvTXbsarbjXMF1i7HnboSkpIdJmUdVkGEtVf9oeh13TcW/3bWpa6uG5xfK2bn7/4d8a2gpH3UCddVLDZriHGhH2HpcUHBO1k1VKIA3mQ2uYfTobbHRVZOP+qSPUoVEMsiYQC9n5SLppOIId7CyaWE6Dhh32QvmqwA4=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 15:35:14', '2024-03-07 15:35:14', NULL, NULL, 'aaaa', 200, '2024-03-04', '2024-03-09', '15:00:00', '16:00:00', NULL, NULL, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 464.8464, 337941.70176, 47311.8382464, 385253.5400064, '10002681301', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(131, '2024-03-07;2024-03-07T15:39:58;FP ATO2024/14;2595094.90;E1JIELFFbkvTXbsarbjXMF1i7HnboSkpIdJmUdVkGEtVf9oeh13TcW/3bWpa6uG5xfK2bn7/4d8a2gpH3UCddVLDZriHGhH2HpcUHBO1k1VKIA3mQ2uYfTobbHRVZOP+qSPUoVEMsiYQC9n5SLppOIId7CyaWE6Dhh32QvmqwA4=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'fsgsGFSGSGS', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 14, 'FP ATO2024/14', NULL, 'aFvbtuu7EbkpYIRDW+On+MoUZt6OdScLm13rdt4S/bK5R/Y/iHpROUj6dTqfkf61+qkSPjzu48oq0/ozroVzWVnJPkyfUxjBGq6c1o0KPNA7rzjKzkocsa0Lowll+MGlcW0nuV2xygFu7A3+MDhAGY3KARAs/qIJVW1Rz7Vpbu0=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 15:39:58', '2024-03-07 15:39:58', NULL, NULL, 'aaaaa', 20, '2024-03-04', '2024-03-08', '15:00:00', '16:00:00', NULL, 100, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', 5, 3131.238, 2276399.0392, 318695.865488, 2595094.904688, '10002681311', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(132, '2024-03-07;2024-03-07T15:41:04;FP ATO2024/15;378450.95;aFvbtuu7EbkpYIRDW+On+MoUZt6OdScLm13rdt4S/bK5R/Y/iHpROUj6dTqfkf61+qkSPjzu48oq0/ozroVzWVnJPkyfUxjBGq6c1o0KPNA7rzjKzkocsa0Lowll+MGlcW0nuV2xygFu7A3+MDhAGY3KARAs/qIJVW1Rz7Vpbu0=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'GFSGFSGFS', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 15, 'FP ATO2024/15', NULL, 'gu/ZTW8EKSSDmG6L4HWOrIWpvjxLgM/+m+L4DU5pE4YoFdQdR2L3D+wIdU+dVuRH5940Ukcr+eNqLSLOMloyZAj0Qeif4Bf6HQaAe6GZr44DcIWpCozcM4d/XTRR7OW/MQprGeMocqpSLs7vIGmQ5Z0ei/RVkHKazwj4uQEq3Jk=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 15:41:04', '2024-03-07 15:41:04', NULL, NULL, 'FGSGS', 20, '2024-03-11', '2024-03-09', '15:00:00', '16:00:00', NULL, 40, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', 10, 456.6384, 331974.51456, 46476.4320384, 378450.9465984, '10002681321', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(133, '2024-03-07;2024-03-07T15:42:09;FP ATO2024/16;1511.69;gu/ZTW8EKSSDmG6L4HWOrIWpvjxLgM/+m+L4DU5pE4YoFdQdR2L3D+wIdU+dVuRH5940Ukcr+eNqLSLOMloyZAj0Qeif4Bf6HQaAe6GZr44DcIWpCozcM4d/XTRR7OW/MQprGeMocqpSLs7vIGmQ5Z0ei/RVkHKazwj4uQEq3Jk=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'FDAFDAFDA', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 16, 'FP ATO2024/16', NULL, 'AIfgTHNyTwzQoeHdXZfb1jqh6DXnUZoOWp8+jHgvrLI43uyD1UF/IxsMdsB7uAwnAF/WL5gVlF5E7+LmWXfr2LcrC7/CqyvGAPT2+9JUaP6WAwEaqhxHRv29DSImOVlP4LjHgjczGT35+noI9avEjuo0q7NizKK0uJKapW8QCTU=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 15:42:09', '2024-03-07 15:42:09', NULL, NULL, 'AAAA', 200, '2024-03-04', '2024-03-10', '12:00:00', '14:00:00', NULL, 20, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 1.824, 1326.0416, 185.645824, 1511.687424, '10002681331', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(134, '2024-03-07;2024-03-07T15:42:24;FP ATO2024/17;1511.69;AIfgTHNyTwzQoeHdXZfb1jqh6DXnUZoOWp8+jHgvrLI43uyD1UF/IxsMdsB7uAwnAF/WL5gVlF5E7+LmWXfr2LcrC7/CqyvGAPT2+9JUaP6WAwEaqhxHRv29DSImOVlP4LjHgjczGT35+noI9avEjuo0q7NizKK0uJKapW8QCTU=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'FDAFDAFDA', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 17, 'FP ATO2024/17', NULL, 'DlhyvgOapuRUgZn/UxdL/plStdREvLo7Jg9o74vViLTDoYby8VpnxjCvXs0AkfimJFdJxHltmJycRnKyTIhk4SWXYDGcId1ppTqpoTaRcDWlWnlmZZg3nYqlRCef2K1bbc6rQWTVw6p1XrCOJz79qve00G/Ias+dosQ8Qa2zDTw=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 15:42:24', '2024-03-07 15:42:24', NULL, NULL, 'AAAA', 200, '2024-03-04', '2024-03-10', '12:00:00', '14:00:00', NULL, 20, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', NULL, 1.824, 1326.0416, 185.645824, 1511.687424, '10002681341', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL),
	(135, '2024-03-07;2024-03-07T15:43:34;FP ATO2024/18;377317.18;DlhyvgOapuRUgZn/UxdL/plStdREvLo7Jg9o74vViLTDoYby8VpnxjCvXs0AkfimJFdJxHltmJycRnKyTIhk4SWXYDGcId1ppTqpoTaRcDWlWnlmZZg3nYqlRCef2K1bbc6rQWTVw6p1XrCOJz79qve00G/Ias+dosQ8Qa2zDTw=', 1, 268, 'CELTA SERVIÇOS & COMÉRCIO, LDA', 'FDAFAFA', '+244912505071', '5402032955', NULL, 'Rua Fernando Pessoa, Nº52', 3, 18, 'FP ATO2024/18', NULL, 'EJqaCXYivt4sKS9+WMpJE1vZIH9eO14CMZpPVYU/R4/vzpY23EU3nsf3cQIwDJivaL4hd0QhViMBd0/bufsv2n+u9IwM19IbTd0M6zHXToGDbTp7XOd9QufQgdTej3fZRg9i+77opNEo9YJr/466GsnjkRYF254HS0EPBx+Vgo4=', NULL, 1, 1, 1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '2024-03-07 15:43:34', '2024-03-07 15:43:34', NULL, NULL, 'DFAAF', 2000, '2024-03-04', '2024-03-10', '15:00:00', '16:00:00', NULL, 25, NULL, NULL, NULL, 14, 828.776, 'USD', 'AOA', 5, 455.2704, 330979.98336, 46337.1976704, 377317.1810304, '10002681351', 3, NULL, NULL, 'N', 'N', 'N', 0, 0, 2, NULL, NULL);

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
  `tipoMercadoriaId` int(11) DEFAULT NULL,
  `especificacaoMercadoriaId` int(11) DEFAULT NULL,
  `horaAberturaAeroporto` int(11) DEFAULT NULL,
  `desconto` double DEFAULT '0',
  `valorImposto` char(2) DEFAULT NULL,
  `total` double DEFAULT '0',
  `totalIva` double DEFAULT '0',
  `factura_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_factura_items_factura` (`factura_id`),
  CONSTRAINT `FK_factura_items_facturas` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.factura_items: ~17 rows (aproximadamente)
INSERT INTO `factura_items` (`id`, `produtoId`, `quantidade`, `nomeProduto`, `taxa`, `taxaLuminosa`, `taxaAduaneiro`, `taxaEstacionamento`, `taxaIva`, `valorIva`, `nDias`, `peso`, `horaExtra`, `taxaAbertoAeroporto`, `horaFechoAeroporto`, `horaEstacionamento`, `sujeitoDespachoId`, `tipoMercadoriaId`, `especificacaoMercadoriaId`, `horaAberturaAeroporto`, `desconto`, `valorImposto`, `total`, `totalIva`, `factura_id`) VALUES
	(174, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 18565.0976, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 132607.84, 151172.9376, 114),
	(175, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 92.825488, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 663.0392, 755.864688, 115),
	(176, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 185.650976, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 'T', 1326.0784, 1511.729376, 116),
	(177, 13, 1, 'Carga Exportação', 0.25, 197.88, 0.08, 0, 14, 185.650976, 1, 20, 0, 546.94, 19, 49, 1, 1, 1, 7, 0, 'T', 1326.0784, 1511.729376, 117),
	(178, 12, 1, 'Carga Importação', 0.25, 197.88, 0.08, 0, 14, 346703.19768, 1, 37350, 0, 546.94, 19, 49, 1, 1, 1, 7, 0, 'T', 2476451.412, 2823154.60968, 118),
	(179, 13, 1, 'Carga Exportação', 0.25, 197.88, 0.08, 0, 14, 290413.8217568, 1, 37350, 0, 546.94, 19, 49, 1, 1, 1, 7, 0, 'T', 2074384.44112, 2364798.2628768, 118),
	(180, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 346703.19768, 1, 37350, 0, 546.94, 19, 49, 1, 1, 1, 7, 0, 'T', 2476451.412, 2823154.60968, 118),
	(181, 12, 1, 'Carga Importação', 0.25, 197.88, 0.08, 0, 14, 346703.19768, 1, 31286, 0, 546.94, 19, 49, 1, 1, 1, 7, 0, 'T', 2476451.412, 2823154.60968, 119),
	(182, 13, 1, 'Carga Exportação', 0.25, 197.88, 0.08, 0, 14, 290413.8217568, 1, 31286, 0, 546.94, 19, 49, 1, 1, 1, 7, 0, 'T', 2074384.44112, 2364798.2628768, 119),
	(183, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 637117.0194368, 1, 68636, 0, 546.94, 19, 49, 1, 1, 1, 7, 0, 'T', 4550835.85312, 5187952.8725568, 120),
	(184, 4, 1, 'Estacionamento', 0.25, 197.88, 0, 0, 14, 46063.37008, 1, 0, 0, 546.94, 19, 59, NULL, 1, 1, 7, 0, 'T', 329024.072, 375087.44208, 121),
	(185, 5, 1, 'Aterragem', 0.25, 197.88, 0, 0, 14, 367590.334384, 1, 0, 0, 546.94, 19, 59, NULL, 1, 1, 7, 0, 'T', 2625645.2456, 2993235.579984, 121),
	(187, 15, 10, 'Assistência de operação em pista', 0.12, 0, 0, 0, 14, 139.234368, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, 994.5312, 1133.765568, 124),
	(188, 1, 1, 'Carga', 0.08, 0, 0, 0, 14, 27846.8736, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 0, 'T', 198906.24, 226753.1136, 125),
	(189, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 1856.45824, 1, 200, 0, 546.94, 19, 97, 1, NULL, NULL, 7, 0, 'T', 13260.416, 15116.87424, 126),
	(190, 14, 10, 'Assistência administrativa', 0.02, 0, 0, 0, 14, 23.205728, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 165.7552, 188.960928, 127),
	(191, 16, 12, 'Assitência de limpeza e serviço do avião', 0.03, 0, 0, 0, 14, 41.7703104, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 298.35936, 340.1296704, 127),
	(192, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 464.11456, 1, 50, 0, 546.94, 19, 121, 1, NULL, NULL, 7, 0, 'T', 3315.104, 3779.21856, 128),
	(193, 12, 1, 'Carga Importação', 0.25, 197.88, 0.08, 0, 14, 464.11456, 1, 50, 5, 546.94, 19, 145, 1, NULL, NULL, 7, 0, 'T', 3315.104, 3779.21856, 129),
	(194, 13, 1, 'Carga Exportação/Transito', 0.25, 197.88, 0.08, 0, 14, 464.11456, 1, 50, 5, 546.94, 19, 145, 1, NULL, NULL, 7, 0, 'T', 3315.104, 3779.21856, 129),
	(195, 9, 1, 'Luminosa 2x', 0.25, 197.88, 0, 0, 14, 45919.4945664, 1, 50, 5, 546.94, 19, 145, NULL, NULL, NULL, 7, 0, 'T', 327996.38976, 373915.8843264, 129),
	(196, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 464.11456, 1, NULL, 0, 546.94, 19, 121, 1, NULL, NULL, 7, 0, 'T', 3315.104, 3779.21856, 130),
	(197, 12, 1, 'Carga Importação', 0.25, 197.88, 0.08, 0, 14, 464.11456, 1, NULL, 0, 546.94, 19, 121, 1, NULL, NULL, 7, 0, 'T', 3315.104, 3779.21856, 130),
	(198, 13, 1, 'Carga Exportação/Transito', 0.25, 197.88, 0.08, 0, 14, 464.11456, 1, NULL, 0, 546.94, 19, 121, 1, NULL, NULL, 7, 0, 'T', 3315.104, 3779.21856, 130),
	(199, 9, 1, 'Luminosa 2x', 0.25, 197.88, 0, 0, 14, 45919.4945664, 1, NULL, 0, 546.94, 19, 121, NULL, NULL, NULL, 7, 0, 'T', 327996.38976, 373915.8843264, 130),
	(200, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 464.11456, 1, 50, 5, 546.94, 19, 97, 1, NULL, NULL, 7, 0, 'T', 3315.104, 3779.21856, 131),
	(201, 8, 1, 'Abertura do Aeroporto - Prolongamento', 0.25, 197.88, 0, 0, 14, 317303.521808, 1, NULL, 5, 546.94, 19, 97, NULL, NULL, NULL, 7, 0, 'T', 2266453.7272, 2583757.249008, 131),
	(202, 12, 1, 'Carga Importação', 0.25, 197.88, 0.08, 0, 14, 464.11456, 1, 50, 5, 546.94, 19, 97, 1, NULL, NULL, 7, 0, 'T', 3315.104, 3779.21856, 131),
	(203, 13, 1, 'Carga Exportação/Transito', 0.25, 197.88, 0.08, 0, 14, 464.11456, 1, 50, 5, 546.94, 19, 97, 1, NULL, NULL, 7, 0, 'T', 3315.104, 3779.21856, 131),
	(204, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 185.645824, 1, 10, 10, 546.94, 19, 47, 1, NULL, NULL, 7, 0, 'T', 1326.0416, 1511.687424, 132),
	(205, 12, 1, 'Carga Importação', 0.25, 197.88, 0.08, 0, 14, 278.468736, 1, 10, 10, 546.94, 19, 47, 1, NULL, NULL, 7, 0, 'T', 1989.0624, 2267.531136, 132),
	(206, 13, 1, 'Carga Exportação/Transito', 0.25, 197.88, 0.08, 0, 14, 92.822912, 1, 10, 10, 546.94, 19, 47, 1, NULL, NULL, 7, 0, 'T', 663.0208, 755.843712, 132),
	(207, 9, 1, 'Luminosa 2x', 0.25, 197.88, 0, 0, 14, 45919.4945664, 1, NULL, 10, 546.94, 19, 47, NULL, NULL, NULL, 7, 0, 'T', 327996.38976, 373915.8843264, 132),
	(208, 7, 1, 'Carga', 0.25, 197.88, 0.08, 0, 14, 185.645824, 1, 20, 5, 546.94, 19, 145, 1, NULL, NULL, 7, 0, 'T', 1326.0416, 1511.687424, 135),
	(209, 12, 1, 'Carga Importação', 0.25, 197.88, 0.08, 0, 14, 92.822912, 1, 10, 5, 546.94, 19, 145, 1, NULL, NULL, 7, 0, 'T', 663.0208, 755.843712, 135),
	(210, 13, 1, 'Carga Exportação/Transito', 0.25, 197.88, 0.08, 0, 14, 139.234368, 1, 15, 5, 546.94, 19, 145, 1, NULL, NULL, 7, 0, 'T', 994.5312, 1133.765568, 135),
	(211, 9, 1, 'Luminosa 2x', 0.25, 197.88, 0, 0, 14, 45919.4945664, 1, NULL, 5, 546.94, 19, 145, NULL, NULL, NULL, 7, 0, 'T', 327996.38976, 373915.8843264, 135);

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
) ENGINE=InnoDB AUTO_INCREMENT=6499 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.jobs: ~8 rows (aproximadamente)
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
	(6486, 'default', '{"uuid":"1e1a301e-31ae-4c40-86de-9339f213ff3c","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1708701455, 1708701455),
	(6487, 'default', '{"uuid":"821607c5-cf18-4443-ab9f-8eb3aa9fc3df","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1708954848, 1708954848),
	(6488, 'default', '{"uuid":"c7e218ae-26d1-4bad-9695-b1d21735a44d","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1708960152, 1708960152),
	(6489, 'default', '{"uuid":"1aee2472-03d3-4ce5-8bb0-87c1f3db760a","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1708965178, 1708965178),
	(6490, 'default', '{"uuid":"c813ac59-fda2-47ff-8c8d-570b5a91f5ef","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1709031303, 1709031303),
	(6491, 'default', '{"uuid":"27a1ddf0-324b-4cc6-892a-b64b4142be2b","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1709108495, 1709108495),
	(6492, 'default', '{"uuid":"c08ae532-a1a8-4e58-b281-1bb2c377c138","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1709132536, 1709132536),
	(6493, 'default', '{"uuid":"0332f7d8-ea7e-49d3-be0a-ab7914754e14","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1709280901, 1709280901),
	(6494, 'default', '{"uuid":"234d7e1e-7bf7-4f26-9d56-8b284ed362a8","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1709365039, 1709365039),
	(6495, 'default', '{"uuid":"3ac32908-3262-4247-a655-0d6cec4db9fa","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1709654844, 1709654844),
	(6496, 'default', '{"uuid":"42cd4a4f-c677-408d-b99e-f27c3a6ff2cd","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1709711511, 1709711511),
	(6497, 'default', '{"uuid":"906cdd07-3f7a-4cfc-9e9c-e6126bcfef7d","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1709799366, 1709799366),
	(6498, 'default', '{"uuid":"b56dc183-c3d2-4c7d-b266-3dc6366ec385","displayName":"App\\\\Events\\\\EnvioPagamentoVendaOnline","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":10:{s:5:\\"event\\";O:36:\\"App\\\\Events\\\\EnvioPagamentoVendaOnline\\":2:{s:8:\\"somedata\\";s:9:\\"some data\\";s:6:\\"socket\\";N;}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1709827346, 1709827346);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_cliente.json
CREATE TABLE IF NOT EXISTS `json` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` longtext,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.json: ~0 rows (aproximadamente)
INSERT INTO `json` (`id`, `texto`) VALUES
	(2, '{"id":2,"uuid":"e6aee384-6564-4789-b58b-be427b0d73ab","codigo":"00002","bancoId":6,"empresaId":null,"dataPagamentoBanco":"2024-01-11 00:00:00","totalPagamento":8266.25,"totalDesconto":0,"totalIva":1157.275,"comprovativoBancario":"comprovativosVendasOnline\\/TlpevWPFeVtf1lA9mjtuJD7JqakqkwnHQHGWpRUk.pdf","formaPagamentoId":4,"userId":741,"nomeUser":"Ramos Soft","statusPagamentoId":2,"enderecoEntrega":null,"nomeUserEntrega":"Ramos Soft","apelidoUserEntrega":"Ramos Soft","pontoReferenciaEntrega":null,"telefoneUserEntrega":"923292970","provinciaIdEntrega":1,"comunaId":null,"taxaEntrega":0,"tipoEntregaId":2,"operadorId":638,"emailEntrega":"info@ramossoft.com","numeroCartaoCliente":null,"observacaoEntrega":null,"motivoRejeicao":null,"created_at":"2024-01-11T13:03:18.000000Z","estimativaEntrega":"2024-01-13 14:03:18","updated_at":"2024-01-24T16:19:00.000000Z","deleted_at":null,"pagamento_vendas_online_items":[{"id":3,"uuid":"e19c8d13-7e9a-402d-a7e6-98c45ff4c7c3","produtoId":1510,"precoVendaProduto":3372.5,"nomeProduto":"CABO ALIMENT. PC 1.8 MT MANHT","quantidade":1,"pagamentoVendasOnlineId":2,"taxaIvaValor":472.15,"subtotal":3372.5,"taxaIva":14},{"id":4,"uuid":"067bd8a2-b788-43dc-99e2-6d7f455d53f6","produtoId":1047,"precoVendaProduto":4893.75,"nomeProduto":"BLOCO TOM.TRIPLA 1.5 MT C\\/INT BRANCA","quantidade":1,"pagamentoVendasOnlineId":2,"taxaIvaValor":685.125,"subtotal":4893.75,"taxaIva":14}],"user":{"id":741,"name":"Ramos Soft","uuid":"88b32a7d-114e-4ce4-9cae-7813bc40de94","username":"Ramos Soft","created_at":"2023-12-06T23:44:12.000000Z","updated_at":"2023-12-06T23:44:12.000000Z","tipo_user_id":4,"status_id":1,"statusUserAdicional":1,"status_senha_id":1,"telefone":"923292970","email":"info@ramossoft.com","email_verified_at":null,"canal_id":4,"empresa_id":null,"foto":"utilizadores\\/cliente\\/avatarEmpresa.png","guard":"empresa","token_notification_firebase":null,"all_permissions":[],"can":{"gerir utilizadores":true,"gerir permiss\\u00f5es":true,"gerir licen\\u00e7as":true,"consultar licen\\u00e7as":true,"gerir fornecedores":true,"gerir empresas":true,"gerir funcionario":true,"gerir fabricantes":true,"gerir armazens":true,"gerir bancos":true,"gerir marcas":true,"gerir categoria":true,"gerir clientes":true,"gerir produtos":true,"gerir nota credito":true,"gerir nota debito":true,"gerir rectificar documento":true,"gerir anular documento":true,"gerir actualizar estoque":true,"gerir transferir produto":true,"gerir entrada produto":true,"gerir pagamento fornecedor":true,"gerir taxas":true,"gerir motivos isencao":true,"gerir vendas":true,"gerir inventario":true,"visualizar minhas licen\\u00e7as":true,"visualizar facturas licencas":true,"visualizar recibo pagamento factura":true,"gerir funcao":true,"gerir movimento diario":true,"gerir recibos":true,"visualizar produtos mais vendidos":true,"visualizar existencia estoque produto":true,"converter proforma":true,"gerar saft":true,"gerir empresa":true,"editar modelo documento":true,"definir parametros":true,"visualizar relatorio por centro custo":true,"gerir centro de custo":true,"visualizar relatorios":true,"imprimir_fecho_caixa":true,"gerir permissao":true,"Sem acesso a dashboard":true},"permissions":[],"roles":[]},"statu":{"id":2,"designacao":"Pendente"},"banco":{"id":6,"designacao":"BANCO DE FOMENTO ANGOLA","sigla":"BFA","uuid":"404f6f31-f11b-42c3-812b-7f1e05168ccb","num_conta":"273036373 30 001","titular":"","iban":"AO06 0006.0000.7303.6373.3014.3","status_id":1,"canal_id":2,"created_at":"2021-04-16T11:42:08.000000Z","empresa_id":148,"tipo_user_id":2,"user_id":641,"centroCustoId":null,"updated_at":"2022-10-20T12:41:50.000000Z"}}');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.notas_creditos: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.permissions: ~22 rows (aproximadamente)
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
	(22, 'emitir fatura outros servicos', 'empresa', '2024-03-06 07:59:34', '2024-03-06 07:59:35', 'emitir_fatura_outros_servicos', 1);

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
  `tipoServicoId` int(10) unsigned DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.produtos: ~27 rows (aproximadamente)
INSERT INTO `produtos` (`id`, `designacao`, `uuid`, `preco_venda`, `pvp`, `preco_compra`, `classificacao`, `marca_id`, `categoria_id`, `orderCategoria1`, `orderCategoria2`, `orderCategoria3`, `centroCustoId`, `tipoServicoId`, `classe_id`, `unidade_medida_id`, `fabricante_id`, `user_id`, `canal_id`, `status_id`, `codigo_taxa`, `motivo_isencao_id`, `quantidade_minima`, `quantidade_critica`, `imagem_produto`, `referencia`, `codigo_barra`, `data_expiracao`, `descricao`, `stocavel`, `venda_online`, `cartaGarantia`, `empresa_id`, `created_at`, `updated_at`, `tempoGarantiaProduto`, `tipoGarantia`) VALUES
	(1, 'Carga', 'd7a06a73-6c40-4cdb-9984-34f2b8810a25', 0, 0, 0, NULL, NULL, 2, NULL, NULL, NULL, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'P3KFW8', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-01 09:59:26', '2024-02-01 11:02:15', NULL, NULL),
	(2, 'Armazenagem', '04926be2-1158-46af-aaf3-8c865590dfcb', 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'XRY51O', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-01 11:01:47', '2024-02-01 11:01:47', NULL, NULL),
	(3, 'Manuseamento', '1122824c-857e-4769-8394-88134fb41306', 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '88HAOG', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-01 11:02:03', '2024-02-01 16:58:44', NULL, NULL),
	(4, 'Estacionamento', 'f10a0720-a591-42d2-b00d-b0436e037125', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'P05U2H', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:18:57', '2024-02-03 09:18:57', NULL, NULL),
	(5, 'Aterragem', '5b6d8950-45c9-4e3b-a3b6-2accd8d3862a', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'NX0WYB', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:19:20', '2024-02-03 09:19:20', NULL, NULL),
	(6, 'Luminosa 1x', 'afcc4a1e-a6eb-4bd6-b9bc-c7d0d40005e8', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'TH4304', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:20:19', '2024-02-03 09:20:19', NULL, NULL),
	(7, 'Carga', '561675ea-b5d9-4c93-9cfe-f7fb08038be5', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', 'P4O028', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:20:35', '2024-02-03 09:20:35', NULL, NULL),
	(8, 'Abertura do Aeroporto - Prolongamento', '918a30ed-ba39-4c19-a530-f944e07fa2b7', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G7', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(9, 'Luminosa 2x', '918a30ed-ba39-4c19-a530-f944e07fa2b5', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G8', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(10, 'Abertura do Aeroporto - Anticipação', '918a30ed-ba39-4c19-a530-f944e07fa2b6', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G9', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(11, 'Reabertura Comercial', '918a30ed-ba39-4c19-a530-f944e07fa2b0', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G10', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(12, 'Carga Importação', '918a30ed-ba39-4c19-a530-f944e07fa2b1', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G11', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(13, 'Carga Exportação/Transito', '918a30ed-ba39-4c19-a530-f944e07fa2b2', 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 2, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G12', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(14, 'Assistência administrativa', '918a30ed-ba39-4c19-a530-f944e07fa2001', 0.02, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G13', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(15, 'Assistência de operação em pista', '918a30ed-ba39-4c19-a530-f944e07fa2002', 0.12, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G14', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(16, 'Assitência de limpeza e serviço do avião', '918a30ed-ba39-4c19-a530-f944e07fa2003', 0.03, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G15', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(17, 'Assistência de manutenção em linha', '918a30ed-ba39-4c19-a530-f944e07fa2004', 0.03, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G16', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(18, 'Assistência de gestão aérea e dos tripulantes', '918a30ed-ba39-4c19-a530-f944e07fa2005', 0.03, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G17', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(19, 'Assistência de transporte em terra', '918a30ed-ba39-4c19-a530-f944e07fa2006', 0.07, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G18', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(20, 'Aprovisionamento (catering) de aeronaves', '918a30ed-ba39-4c19-a530-f944e07fa2007', 0.4, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G19', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(21, 'Assistência a combustível e óleo', '918a30ed-ba39-4c19-a530-f944e07fa2008', 0.51, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G20', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(22, 'Passes de viaturas - empresa aérea doméstico', '918a30ed-ba39-4c19-a530-f944e07fa2009', 1656, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G21', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(23, 'Passes de viaturas - empresa aérea internacional', '918a30ed-ba39-4c19-a530-f944e07fa20010', 2070, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G22', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(24, 'Passes de viaturas - prestadores de serviços', '918a30ed-ba39-4c19-a530-f944e07fa20011', 5796, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G23', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(25, 'Passes de pessoas - empresa aérea doméstica', '918a30ed-ba39-4c19-a530-f944e07fa20012', 80.5, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G24', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(26, 'Passes de pessoas - empresa aérea internacional', '918a30ed-ba39-4c19-a530-f944e07fa20013', 115, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G25', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL),
	(27, 'Passes de pessoas - prestadores de serviço', '918a30ed-ba39-4c19-a530-f944e07fa20014', 575, 0, 0, NULL, NULL, 1, 2, NULL, NULL, 1, 3, NULL, 1, 1, 1, 2, 1, 2, 8, 0, 0, 'upload/produtos/default.png', '04W8G26', NULL, NULL, NULL, 'Não', 'N', 'N', 1, '2024-02-03 09:21:09', '2024-02-03 09:21:09', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.recibos: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.tipos_servicos: ~2 rows (aproximadamente)
INSERT INTO `tipos_servicos` (`id`, `designacao`, `statuId`, `created_at`, `updated_at`) VALUES
	(1, 'Carga', 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47'),
	(2, 'Aeronáutico', 1, '2024-01-30 13:50:46', '2024-01-30 13:50:47');

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
	(1, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '6a0d01a6-a1e0-4bad-933f-d400be070dc8', 'República de Angola Aeroporto Internacional Dr. António Agostino Neto Operador Temporário Aeroportuário ATO - AIAAN', '$2y$10$u/3Tz.i8Ildc0wO4uFZSOecJVCfc3i/YPoaCrIoRKw2cz6GrjfTUW', 'FJvRUwnWBCeCAuAPvhLJxVZ2XSkkiZT8PDlDr7uywxLcR9evpD5hbZSoJ6po', '2024-01-23 16:10:54', '2024-02-26 15:14:35', 2, 1, 1, 2, '937036322', 'info@ato.ao', NULL, 3, 1, 'utilizadores/cliente//luE2LLwx55QtajfOkz2D1w7meoXw2mV25D7a9zDI.png', 'empresa', NULL),
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
) ENGINE=InnoDB AUTO_INCREMENT=823 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_cliente.user_perfil: ~7 rows (aproximadamente)
INSERT INTO `user_perfil` (`id`, `user_id`, `perfil_id`) VALUES
	(814, 749, 29),
	(815, 750, 29),
	(816, 751, 29),
	(817, 752, 1),
	(818, 753, 29),
	(821, 1, 1),
	(822, 1, 29);

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
