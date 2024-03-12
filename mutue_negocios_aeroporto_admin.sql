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


-- A despejar estrutura da base de dados para mutue_negocios_aeroporto_admin
CREATE DATABASE IF NOT EXISTS `mutue_negocios_aeroporto_admin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mutue_negocios_aeroporto_admin`;

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.activacao_licencas
CREATE TABLE IF NOT EXISTS `activacao_licencas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `licenca_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `pagamento_id` int(10) unsigned DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `data_activacao` date DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `operador` varchar(255) DEFAULT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_licenca_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_rejeicao` timestamp NULL DEFAULT NULL,
  `observacao` text,
  `data_notificaticao` date DEFAULT NULL,
  `notificacaoFimLicenca` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_activacao_licencas` (`licenca_id`),
  KEY `FK_activacao_empresa` (`empresa_id`),
  KEY `FK_activacao_user` (`user_id`),
  KEY `FK_activacao_canal` (`canal_id`),
  KEY `FK_activacao_licencas_status_licencas` (`status_licenca_id`),
  KEY `FK_activacao_licencas_pagamentos` (`pagamento_id`),
  CONSTRAINT `FK_activacao_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_activacao_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_activacao_licencas` FOREIGN KEY (`licenca_id`) REFERENCES `licencas` (`id`),
  CONSTRAINT `FK_activacao_licencas_pagamentos` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamentos` (`id`),
  CONSTRAINT `FK_activacao_licencas_status_licencas` FOREIGN KEY (`status_licenca_id`) REFERENCES `status_licencas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.activacao_licencas: ~40 rows (aproximadamente)
INSERT INTO `activacao_licencas` (`id`, `licenca_id`, `empresa_id`, `pagamento_id`, `data_inicio`, `data_fim`, `data_activacao`, `user_id`, `operador`, `canal_id`, `status_licenca_id`, `created_at`, `updated_at`, `data_rejeicao`, `observacao`, `data_notificaticao`, `notificacaoFimLicenca`) VALUES
	(1, 4, 33, 32, '2021-04-11', NULL, NULL, 1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2021-04-11 16:18:36', '2021-05-11 08:03:46', NULL, 'Ativação da licença grátis', '2021-04-21', '2021-05-11'),
	(2, 1, 35, NULL, '2021-12-09', '2021-12-31', '2021-12-09', 1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2021-04-11 16:18:36', '2021-07-29 14:28:31', NULL, 'Ativação da licença grátis', '2021-04-11', '2021-07-29'),
	(41, 4, 99, NULL, '2021-08-28', NULL, '2021-08-28', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2021-08-28 12:34:27', '2021-08-28 12:34:27', NULL, 'Ativação da licença grátis', '2021-08-28', NULL),
	(91, 4, 140, NULL, '2022-07-05', NULL, '2022-07-05', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2022-07-05 10:58:39', '2022-07-05 10:58:39', NULL, 'Ativação da licença definitiva', '2022-07-05', NULL),
	(92, 3, 141, NULL, '2023-01-11', '2024-01-11', '2023-01-11', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2022-07-27 15:31:05', '2023-01-10 11:56:46', NULL, 'Ativação da licença definitiva', '2022-07-27', '2023-01-10'),
	(94, 4, 143, NULL, '2022-08-09', NULL, '2022-08-09', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2022-08-09 10:54:48', '2022-08-09 10:54:48', NULL, 'Ativação da licença definitiva', '2022-08-09', NULL),
	(95, 1, 144, NULL, '2023-03-13', '2023-04-13', '2023-03-13', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-03-13 13:37:51', '2023-04-14 22:09:43', NULL, 'Ativação da licença definitiva', '2023-03-14', '2023-04-14'),
	(96, 4, 38, NULL, '2023-06-13', '2024-09-20', '2023-06-13', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-03-13 13:37:51', '2023-09-03 13:55:58', NULL, 'Ativação da licença definitiva', '2023-09-03', '2023-04-14'),
	(104, 1, 146, NULL, '2023-05-29', '2023-06-29', '2023-05-29', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-05-29 13:27:15', '2023-07-04 11:38:47', NULL, 'Ativação da licença definitiva', '2023-05-29', '2023-07-04'),
	(105, 1, 147, NULL, '2023-06-02', '2023-07-03', '2023-06-02', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-06-02 11:06:42', '2023-07-11 13:19:42', NULL, 'Ativação da licença definitiva', '2023-06-02', '2023-07-11'),
	(106, 1, 148, NULL, '2023-06-26', '2023-07-27', '2023-06-26', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-06-26 13:14:41', '2023-09-27 15:36:16', NULL, 'Ativação da licença definitiva', '2023-07-07', '2023-09-27'),
	(107, 1, 149, NULL, '2023-07-06', '2023-08-06', '2023-07-06', NULL, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-07-06 17:14:22', '2023-11-10 09:09:47', NULL, 'Ativação da licença definitiva', '2023-07-17', '2023-11-10'),
	(108, 2, 147, 30, '2023-07-11', '2023-08-11', '2023-07-11', 1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-07-11 13:21:50', '2023-08-26 18:35:42', NULL, 'ativo a licença mensal no dia 2023-07-11 14:30:26', NULL, '2023-08-26'),
	(109, 2, 144, 31, '2023-07-19', '2023-08-19', '2023-07-19', 1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-07-19 15:37:37', '2023-07-20 09:22:29', NULL, 'ativo a licença mensal no dia 2023-07-19 16:38:49', '2023-07-20', NULL),
	(112, 4, 133, NULL, '2023-08-21', NULL, '2023-08-09', 1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-08-21 16:59:01', '2023-08-10 14:32:57', NULL, NULL, '2023-08-21', NULL),
	(113, 1, 150, NULL, '2023-09-04', '2023-10-05', '2023-09-04', NULL, NULL, 2, 1, '2023-09-04 11:32:10', '2023-09-04 11:32:10', NULL, 'Ativação da licença definitiva', '2023-09-04', NULL),
	(115, 2, 147, 34, '2023-10-17', '2023-10-22', '2023-09-21', 88, 'Zenilda Fila', 2, 1, '2023-09-21 09:13:31', '2023-09-22 00:00:02', NULL, NULL, '2023-09-22', NULL),
	(116, 1, 152, NULL, '2023-09-22', '2023-10-23', '2023-09-22', NULL, NULL, 2, 1, '2023-09-22 16:25:14', '2023-10-23 13:52:33', NULL, 'Ativação da licença definitiva', '2023-10-03', '2023-10-23'),
	(117, 1, 153, NULL, '2023-09-25', '2023-10-26', '2023-09-25', NULL, NULL, 2, 1, '2023-09-25 08:18:26', '2023-09-25 08:18:26', NULL, 'Ativação da licença definitiva', '2023-09-25', NULL),
	(118, 2, 152, 35, '2023-09-27', '2023-10-28', '2023-09-27', 92, 'Osvaldo Duzentos', 2, 1, '2023-09-27 14:03:49', '2023-10-31 15:19:40', NULL, NULL, '2023-10-18', '2023-10-31'),
	(119, 4, 38, 36, '2023-10-29', NULL, '2023-09-27', 1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-09-27 14:53:56', '2023-10-18 08:38:14', NULL, NULL, '2023-10-18', NULL),
	(120, 1, 154, NULL, '2023-10-07', '2023-11-07', '2023-10-07', NULL, NULL, 2, 1, '2023-10-07 21:41:50', '2023-10-07 21:41:50', NULL, 'Ativação da licença definitiva', '2023-10-07', NULL),
	(121, 1, 155, NULL, '2023-10-09', '2023-11-09', '2023-10-09', NULL, NULL, 2, 1, '2023-10-09 15:52:21', '2023-10-09 15:52:21', NULL, 'Ativação da licença definitiva', '2023-10-09', NULL),
	(122, 1, 156, NULL, '2023-10-10', '2023-11-10', '2023-10-10', NULL, NULL, 2, 1, '2023-10-10 07:45:45', '2023-10-10 07:45:45', NULL, 'Ativação da licença definitiva', '2023-10-10', NULL),
	(123, 1, 157, NULL, '2023-10-10', '2023-11-10', '2023-10-10', NULL, NULL, 2, 1, '2023-10-10 08:31:33', '2023-10-11 13:03:50', NULL, 'Ativação da licença definitiva', '2023-10-11', NULL),
	(124, 3, 157, 37, '2023-11-11', '2024-11-10', '2023-10-10', 1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2023-10-10 08:55:25', '2023-10-10 09:56:35', NULL, 'ativo a licença anual no dia 2023-10-10 09:56:35', NULL, NULL),
	(125, 1, 158, NULL, '2023-10-12', '2023-11-12', '2023-10-12', NULL, NULL, 2, 1, '2023-10-12 22:32:29', '2023-10-13 00:01:07', NULL, 'Ativação da licença definitiva', '2023-10-13', NULL),
	(126, 2, 152, 38, '2023-11-13', '2023-12-01', '2023-10-31', 88, 'Zenilda Fila', 2, 1, '2023-10-31 18:19:42', '2023-12-01 12:31:48', NULL, NULL, '2023-11-21', '2023-12-01'),
	(127, 3, 149, 39, '2023-12-02', '2024-11-14', '2023-11-15', 88, 'Zenilda Fila', 2, 1, '2023-11-15 16:50:43', '2023-11-15 16:50:43', NULL, NULL, NULL, NULL),
	(128, 1, 159, NULL, '2023-11-18', '2023-12-19', '2023-11-18', NULL, NULL, 2, 1, '2023-11-18 11:10:54', '2023-12-20 11:02:41', NULL, 'Ativação da licença definitiva', '2023-11-29', '2023-12-20'),
	(129, 2, 159, 40, '2023-12-20', '2024-06-22', '2023-11-18', 88, 'Zenilda Fila', 2, 1, '2023-11-18 12:19:21', '2023-11-18 12:19:21', NULL, NULL, NULL, NULL),
	(132, 1, 160, NULL, '2023-11-22', '2023-12-23', '2023-11-22', NULL, NULL, 2, 1, '2023-11-22 12:51:39', '2023-12-23 14:19:38', NULL, 'Ativação da licença definitiva', '2023-12-13', '2023-12-23'),
	(133, 2, 160, 43, '2023-12-24', '2024-01-24', '2023-11-23', 91, 'Fernanda', 2, 1, '2023-11-22 13:13:13', '2023-12-25 07:43:09', NULL, 'ativo a licença mensal no dia 2023-11-23 15:58:09', '2023-12-25', NULL),
	(134, 1, 161, NULL, '2023-11-23', '2023-12-24', '2023-11-23', NULL, NULL, 2, 1, '2023-11-23 19:03:42', '2023-11-23 19:03:42', NULL, 'Ativação da licença definitiva', '2023-11-23', NULL),
	(135, 2, 152, 44, '2023-12-01', '2024-01-01', '2023-12-01', 88, 'Zenilda Fila', 2, 1, '2023-12-01 12:48:38', '2024-01-01 15:22:48', NULL, 'ativo a licença mensal no dia 2023-12-01 14:06:36', NULL, '2024-01-01'),
	(136, 2, 152, 45, NULL, NULL, NULL, 88, 'Zenilda Fila', 2, 2, '2023-12-01 13:09:46', '2023-12-01 14:41:01', '2023-12-01 14:41:01', 'Este comprovativo já foi usado na licença anterior ', NULL, NULL),
	(137, 1, 162, NULL, '2023-12-15', '2024-01-15', '2023-12-15', NULL, NULL, 2, 1, '2023-12-15 21:58:14', '2023-12-15 21:58:14', NULL, 'Ativação da licença definitiva', '2023-12-15', NULL),
	(138, 1, 163, NULL, '2023-12-19', '2024-01-19', '2023-12-19', NULL, NULL, 2, 1, '2023-12-19 16:16:15', '2024-01-09 13:14:07', NULL, 'Ativação da licença definitiva', '2024-01-09', NULL),
	(139, 2, 152, 46, '2024-01-02', '2024-02-02', '2024-01-02', 1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 2, 1, '2024-01-01 18:28:29', '2024-01-02 13:20:53', NULL, 'ativo a licença mensal no dia 2024-01-02 13:20:53', NULL, NULL),
	(140, 4, 167, NULL, '2024-01-23', NULL, '2024-01-23', NULL, NULL, 2, 1, '2024-01-23 16:10:54', '2024-01-24 10:14:52', NULL, 'Ativação da licença definitiva', '2024-01-24', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.anuncios
CREATE TABLE IF NOT EXISTS `anuncios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_inicio` datetime NOT NULL,
  `data_final` datetime NOT NULL,
  `descricao` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `titulo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.anuncios: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.armazems
CREATE TABLE IF NOT EXISTS `armazems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_sistema_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_armazems_estado_sistemas` (`estado_sistema_id`),
  CONSTRAINT `FK_armazems_estado_sistemas` FOREIGN KEY (`estado_sistema_id`) REFERENCES `estado_sistemas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.armazems: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.bancos
CREATE TABLE IF NOT EXISTS `bancos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(145) NOT NULL,
  `titular` varchar(255) DEFAULT NULL,
  `sigla` varchar(20) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bancos_status_gerais` (`status_id`),
  KEY `FK_bancos_canais_comunicacoes` (`canal_id`),
  KEY `FK_bancos_users` (`user_id`),
  CONSTRAINT `FK_bancos_canais_comunicacoes` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_bancos_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_bancos_users` FOREIGN KEY (`user_id`) REFERENCES `users_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.bancos: ~3 rows (aproximadamente)
INSERT INTO `bancos` (`id`, `designacao`, `titular`, `sigla`, `uuid`, `status_id`, `canal_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'BANCO ECONÓMICO', 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 'BE', '60b8333b-832f-406b-a791-8d30cfb5e159', 2, 3, 1, '2020-05-29 07:07:38', '2023-07-12 09:36:55', NULL),
	(2, 'BANCO ANGOLANO DE INVESTIMENTOS', 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 'BAI', '9789be23-475c-4d22-aa16-9246fef1471c', 2, 3, 1, '2023-07-12 09:42:50', '2023-07-12 09:42:50', NULL),
	(6, 'BANCO DE FOMENTO ANGOLA', 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 'BFA', '1be612e3-11d3-484e-aa24-fcea3df85d9b', 1, 3, 1, '2023-07-12 09:42:50', '2023-07-12 09:42:50', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.black_list
CREATE TABLE IF NOT EXISTS `black_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.black_list: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.canais_comunicacoes
CREATE TABLE IF NOT EXISTS `canais_comunicacoes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.canais_comunicacoes: ~4 rows (aproximadamente)
INSERT INTO `canais_comunicacoes` (`id`, `designacao`) VALUES
	(1, 'BD'),
	(2, 'Portal Cliente'),
	(3, 'Portal Admin'),
	(4, 'Mobile');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.comprovativos_facturas
CREATE TABLE IF NOT EXISTS `comprovativos_facturas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `factura_id` int(11) NOT NULL,
  `comprovativo_pgt_recibos` varchar(255) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1' COMMENT '1=>Pendente, 1=>aceite, 3=>rejeitado',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `numero_operacao_bancaria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comprovativos_facturas_facturas_users_adicionais` (`factura_id`),
  KEY `FK_comprovativos_facturas_users_admin` (`user_id`),
  CONSTRAINT `FK_comprovativos_facturas_facturas_users_adicionais` FOREIGN KEY (`factura_id`) REFERENCES `facturas_users_adicionais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comprovativos_facturas_users_admin` FOREIGN KEY (`user_id`) REFERENCES `users_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.comprovativos_facturas: ~5 rows (aproximadamente)
INSERT INTO `comprovativos_facturas` (`id`, `factura_id`, `comprovativo_pgt_recibos`, `status_id`, `user_id`, `numero_operacao_bancaria`) VALUES
	(25, 11, 'documentos/admin/comprovativos/TfjDC8HFOUfVjA8V9hg1vyDB9UX6jnxtN03fGKJX.jpg', 2, 1, '500400300'),
	(26, 20, 'documentos/admin/comprovativos/PpSGuAs9MWwa455WVEM4yqHV6Z5vN4qCLRmEVwS8.png', 2, 1, '11411988'),
	(27, 22, 'documentos/admin/comprovativos/SFqrap4S649w3Y269C3vVZtlMEnsXlXK6IoieIwq.png', 2, 1, '11411988'),
	(28, 23, 'documentos/admin/comprovativos/pX7B9TFhTSADM281N61oYRupnZMUDOTiHJ9ht1KA.pdf', 2, 1, '6786467'),
	(29, 24, 'documentos/admin/comprovativos/52rNEvuscQIvYNAIs9QpfYhp6rRPJu3rSnLdvaqQ.pdf', 2, 1, 'mutue123');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.contactos
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

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.contactos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.coordenadas_bancarias
CREATE TABLE IF NOT EXISTS `coordenadas_bancarias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_conta` varchar(45) NOT NULL,
  `iban` varchar(45) DEFAULT NULL,
  `banco_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_coordenadas_bancarias_bancos` (`banco_id`),
  KEY `FK_coordenadas_bancarias_canais_comunicacoes` (`canal_id`),
  KEY `FK_coordenadas_bancarias_status_gerais` (`status_id`),
  KEY `FK_coordenadas_bancarias_users` (`user_id`),
  CONSTRAINT `FK_coordenadas_bancarias_canais_comunicacoes` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_coordenadas_bancarias_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_coordenadas_bancarias_users` FOREIGN KEY (`user_id`) REFERENCES `users_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.coordenadas_bancarias: ~3 rows (aproximadamente)
INSERT INTO `coordenadas_bancarias` (`id`, `num_conta`, `iban`, `banco_id`, `canal_id`, `status_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(9, '273036373 30 001', 'AO06 0006.0000.7303.6373.3014.3', 6, 3, 1, 1, '2023-07-12 09:42:50', '2023-07-12 09:42:50'),
	(10, '03179526626', 'AO06 0045.0951.0317.9526.6262.8', 1, 3, 2, 1, '2023-07-12 09:42:50', '2023-07-12 09:42:50'),
	(11, '226474907 10 001', 'AO06 0040.0000.2647.4907.1015.0', 2, 3, 2, 1, '2023-07-12 09:42:50', '2023-07-12 09:42:50');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.empresas
CREATE TABLE IF NOT EXISTS `empresas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `pessoal_Contacto` varchar(145) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `pais_id` int(10) unsigned NOT NULL,
  `saldo` double DEFAULT NULL,
  `nif` varchar(45) NOT NULL,
  `gestor_cliente_id` int(10) unsigned DEFAULT NULL,
  `tipo_cliente_id` int(10) unsigned NOT NULL,
  `tipo_regime_id` int(10) unsigned DEFAULT NULL,
  `logotipo` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  `referencia` varchar(145) DEFAULT NULL,
  `pessoa_de_contacto` varchar(145) DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cidade` varchar(255) DEFAULT NULL,
  `file_alvara` varchar(255) DEFAULT NULL,
  `file_nif` varchar(255) DEFAULT NULL,
  `licenca` varchar(255) DEFAULT NULL,
  `venda_online` enum('Y','N') DEFAULT 'N',
  `ultimo_acesso` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_empresas_pais` (`pais_id`),
  KEY `FK_empresas_canal` (`canal_id`),
  KEY `FK_empresas_status` (`status_id`),
  KEY `FK_empresas_tipo` (`tipo_cliente_id`),
  KEY `FK_empresas_users` (`user_id`),
  KEY `FK_empresas_gestor_clientes` (`gestor_cliente_id`),
  KEY `FK_empresas_tipos_regimes` (`tipo_regime_id`),
  CONSTRAINT `FK_empresas_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_empresas_gestor_clientes` FOREIGN KEY (`gestor_cliente_id`) REFERENCES `gestor_clientes` (`id`),
  CONSTRAINT `FK_empresas_pais` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`),
  CONSTRAINT `FK_empresas_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_empresas_tipo` FOREIGN KEY (`tipo_cliente_id`) REFERENCES `tipos_clientes` (`id`),
  CONSTRAINT `FK_empresas_tipos_regimes` FOREIGN KEY (`tipo_regime_id`) REFERENCES `tipos_regimes` (`id`),
  CONSTRAINT `FK_empresas_users` FOREIGN KEY (`user_id`) REFERENCES `users_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.empresas: ~30 rows (aproximadamente)
INSERT INTO `empresas` (`id`, `nome`, `pessoal_Contacto`, `endereco`, `empresa_id`, `pais_id`, `saldo`, `nif`, `gestor_cliente_id`, `tipo_cliente_id`, `tipo_regime_id`, `logotipo`, `website`, `email`, `referencia`, `pessoa_de_contacto`, `status_id`, `canal_id`, `user_id`, `created_at`, `updated_at`, `cidade`, `file_alvara`, `file_nif`, `licenca`, `venda_online`, `ultimo_acesso`) VALUES
	(1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', '922969192', 'RUA NOSSA SENHORA DA MUXIMA, Nº 10-8º ANDAR', NULL, 1, 0, '5000977381', 1, 2, 3, 'admin/UMA.jpg', 'mutue.net', 'geral@mutue.net', '78500', NULL, 1, 3, 1, '2020-11-15 20:41:28', '2022-06-13 13:43:28', 'Luanda', NULL, NULL, NULL, 'N', NULL),
	(33, 'KIMA KIETU - ARTES, GRÁFICA, EDITORA, MARKETING E PUBLICIDADE, LIMITADA', '928377540', 'Luanda', NULL, 1, 0, '5000977160', 1, 2, 1, 'utilizadores/cliente/0R9xuQ4tPhndpK8pVmuFqvg65qvE8caisdjBJBRh.png', NULL, 'geral@kimakietu.ao', '7B43VY9', NULL, 1, 3, NULL, '2021-04-09 15:13:55', '2024-01-23 16:19:13', 'Luanda', NULL, NULL, 'ativo', 'N', '2024-01-23 16:19:13'),
	(35, 'Photos da Graça', '943212624', 'Luanda', NULL, 1, 0, '005444699LA040', 1, 2, 3, 'utilizadores/cliente/Bsblm4QjxHICjwBb8OhRtYev2FF5QyGhImIwrRkC.jpg', 'http://www.mutue.ao', 'studiophosdagraca@gmail.com', 'K26L08S', NULL, 1, 3, NULL, '2021-04-09 15:55:13', '2021-04-09 15:55:13', 'Luanda', NULL, NULL, 'expirada', 'N', NULL),
	(38, 'Mutue Negócio Teste Mobile', '999999999', 'Osvaldo Roberto Maier, 442', NULL, 1, 0, '999999999', 1, 2, 1, 'utilizadores/cliente/Fi88eTGe5ozEucSaeqxF67hbVCFUXUr0RMHSs7ei.png', NULL, 'mutuemobile@gmail.com', '5VA9C58', NULL, 1, 3, NULL, '2021-04-16 10:36:11', '2024-01-23 17:05:15', 'Luanda', 'documentos/empresa/documentos/dmemIbIos8Xq4aflzuSVwxuBbAk8vzuWPej2EzMm.jpg', 'documentos/empresa/documentos/2McsxTfjst7do5jcAEZZwdtcQg0UR229SJvW5Rg6.pdf', 'ativo', 'Y', '2024-01-23 17:05:15'),
	(99, 'MODUS EASY SERVICE, LDA', '923410344', 'Bairro Alvalade, Rua Damião Góis, n.74 - Luanda-Angola', NULL, 1, 0, '5417056669', 1, 2, 2, 'utilizadores/cliente/YDD7hf3gH0IRsR4xofIjhYh4MvQ6I88XfP1menlN.jpg', NULL, 'moduseasyserv@hotmail.com', 'L16E6E9', NULL, 1, 3, NULL, '2021-08-28 12:34:27', '2021-08-28 12:34:27', 'Luanda', 'documentos/empresa/documentos/gpIWbOGEVJPMIIohDMw5kcLiigyFmpoWIGb4k0aP.pdf', 'documentos/empresa/documentos/c2Uvwmh5aGZQ1eoM7resuohamlWImW0BySGxyqUQ.pdf', 'ativo', 'N', NULL),
	(127, 'UMA', '923292971', 'RUA NOSSA SENHORA DA MUXIMA, Nº 10-8º ANDAR-LUANDA-ANGOLA', NULL, 1, 0, '5401150861', 1, 2, 1, 'utilizadores/cliente/68UcmDwXMw3LYYcArRkrBtW011vnCh5yvGlzSlow.png', NULL, 'ana.figueroa@uma.co.ao', '9UH0K80', NULL, 1, 3, NULL, '2022-01-17 09:55:51', '2022-01-17 09:55:51', 'Luanda', NULL, NULL, 'ativo', 'N', NULL),
	(133, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA.', '922969192', 'Rua Nossa senhora da Muxima, nº 10 - 8º andar', NULL, 1, 0, '5000977381', 1, 2, 1, 'utilizadores/cliente/yAqtfKCslU97IwuR5K9Jh8QBjiz9XPIPGS2i7rwQ.jpg', 'mutue.net', 'geral@mutue.net', 'LA207OG', NULL, 1, 3, NULL, '2022-05-17 13:42:31', '2024-01-26 09:06:06', 'Luanda', NULL, NULL, 'ativo', 'Y', '2024-01-26 10:06:06'),
	(140, 'KIMA KIETU - ARTES, GRÁFICAS, EDITORA, MARKETING E PUBLICIDADE LIMITADA', '943212620', 'Projecto Nova Vida casa n 380', NULL, 1, 0, '5000977160', 1, 2, 3, 'utilizadores/cliente/3RN0EcgdzYVNz94Ssk6s9PaVPLqIrxgTfBdtmEmy.jpg', NULL, 'photos.dagraca@kimakietu.ao', 'WMJB6TW', NULL, 1, 3, NULL, '2022-07-05 10:58:38', '2022-07-05 10:58:38', 'Luanda', NULL, NULL, 'ativo', 'N', NULL),
	(141, 'MUSOLE - AGRICULTURA E COMÉRCIO, LDA', '934983838', 'AVENIDA COMANDANTE VALÓDIA, EX COMBATENTES', NULL, 1, 0, '5000977241', 1, 2, 1, 'utilizadores/cliente/02Syxq3KMCuLu80Dy65TzEMWHbsdS2Yet88XG4TT.png', NULL, 'geral@musole.ao', 'W2VG598', NULL, 1, 3, NULL, '2022-07-27 15:31:05', '2024-01-10 14:38:47', 'Luanda', NULL, NULL, 'ativo', 'N', '2024-01-10 14:38:47'),
	(143, 'Boutique da Missão', '934983900', 'Rua Nossa Senhora da Muxima, Kinaxixi, Luanda - Angola', NULL, 1, 0, '5401150865', 1, 2, 1, 'utilizadores/cliente/PEhAqNKUq6WjUWEnxQ4dpfUQ1OkEJPEpXBkumzlO.png', NULL, 'kuzuata@kimakietu.ao', '6DD2HZM', NULL, 1, 3, NULL, '2022-08-09 10:54:48', '2024-01-23 16:46:36', 'Luanda', NULL, NULL, 'ativo', 'N', '2024-01-23 16:46:36'),
	(144, 'E.A TECNOLOGIAS', '921000038', 'Lar da Patriota ', NULL, 1, 0, '000912421LA034', 1, 1, 1, 'utilizadores/cliente/fpB1mcDxHhsVG41AbAtfzpEceXMdsiWs2Is5gfjo.png', 'www.ea-tecnologias.com', 'infoeatecnologia@gmail.com', 'X7W3HIA', NULL, 1, 3, NULL, '2023-03-13 13:37:51', '2023-07-20 09:22:29', 'Luanda', 'documentos/empresa/documentos/i5DvP3ajpNe2SpYpKFwlHr4GByFtxO8Jb7C37bdv.pdf', 'documentos/empresa/documentos/pwj2sJqoDtKF4NVVzz9PFbcP85JIpddENDATACio.pdf', 'ativo', 'N', '2023-07-20 09:22:29'),
	(145, 'NOVO TESTE DE FUNCIONALIDADE', '939425128', 'LUBANGO, CASA VERDE', NULL, 1, 0, '001123089BA030', 1, 1, 1, 'utilizadores/cliente/3gkIC8QZkStExtHAfmqXmm28jTNovMkN1esQvNz9.png', NULL, 'isacelestino.silva22@gmail.com', '5RAJZ9V', NULL, 1, 3, NULL, '2023-03-31 22:35:22', '2023-03-31 22:35:22', 'LUBANGO', 'documentos/empresa/documentos/DKSi5hrNCl9nycWRD7e6o78GbM5PlN0qYRnf3nUr.pdf', 'documentos/empresa/documentos/y3I6Sk5I6KNrzkYXrYrgCQpHfUrqfPsQiYLY7i7A.pdf', 'ativo', 'N', NULL),
	(146, 'NOGOP  A. VISUAL', '923418059', 'Bairro Cassenda - Rua 23/ zona 6 - Casa n. 30 - Maianga', NULL, 1, 0, '002032056LA033', 1, 2, 1, 'utilizadores/cliente/lTbdtHRPhu5yYPFNvDIhGrkDbdfIko2z3N6wH2qR.png', NULL, 'nogopestudio2011@hotmail.com', 'INFB78D', NULL, 1, 3, NULL, '2023-05-29 13:27:14', '2023-08-17 09:21:50', 'Luanda', NULL, NULL, 'expirada', 'N', '2023-08-17 09:21:50'),
	(147, 'FANCHA - COMÉRCIO GERAL & PRESTAÇÃO DE SERVIÇOS (SU), LDA', '927040403', 'Benfica', NULL, 1, 0, '5001366408', 1, 1, 1, 'utilizadores/cliente/ybgfZqka9nX2JOdv3Djp55qnmZNJaGWVOwywNU51.jpg', NULL, 'fanchacomercio@gmail.com', '25DVZX2', NULL, 1, 3, NULL, '2023-06-02 11:06:42', '2023-10-16 07:00:16', 'Luanda', NULL, 'documentos/empresa/documentos/6DiIzgiuEs1zFf7S5dH3iDqMezpztPpSpLj3GupT.pdf', 'ativo', 'N', '2023-10-16 07:00:16'),
	(148, 'Carlos Nunes', '923969494', 'Luanda', NULL, 1, 0, '001893797UE038', 1, 1, 3, 'utilizadores/cliente/avatarEmpresa.png', NULL, 'carlos21comercial@gmail.com', 'NXNB3S9', NULL, 1, 3, NULL, '2023-06-26 13:14:41', '2023-12-04 14:28:27', 'Luanda', NULL, NULL, 'expirada', 'N', '2023-12-04 14:28:27'),
	(149, 'JOESCA - COMÉRCIO E PRESTAÇÃO DE SERVIÇOS, LDA', '924744585', 'CAZENGA, TRAVESSA MAYA LOUREIRO 3.', NULL, 1, 0, '5000740225', 1, 2, 3, 'utilizadores/cliente/RpMjtajtBXBnalAMjsUbadEW9jBzHP2AS42ei8rO.jpg', NULL, 'carvalhojose185@gmail.com', '6ADDUKG', NULL, 1, 3, NULL, '2023-07-06 17:14:22', '2024-01-22 15:14:13', 'LUANDA', 'documentos/empresa/documentos/ncnZ0lBnLl9VzY5H40YtAIn0LCfmZlvsMJwjAvNx.pdf', 'documentos/empresa/documentos/XE8QUfpyLRfMTvVfN75p5hE8baV99Ndct4Q4cFya.pdf', 'ativo', 'N', '2024-01-22 15:14:13'),
	(150, 'Eust-veste Comércio E Prestação De Serviços', '944925500', 'Viana', NULL, 1, 0, '5001149849', 1, 1, 2, 'utilizadores/cliente/1AS8ykdioW27eE9nChVGvenXfN2TEPTNf70Hr4GW.jpg', NULL, 'eustaquiocandinba@gmail.com', 'YXOMO9W', NULL, 1, 3, NULL, '2023-09-04 11:32:10', '2023-10-03 12:23:20', 'Luanda', NULL, NULL, 'ativo', 'N', '2023-10-03 12:23:20'),
	(152, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', '938294568', 'Estrada de Catete', NULL, 1, 0, '5001599917', 1, 2, 3, 'utilizadores/cliente/mkzAuHdwLmukbk6s0fYcLZj07tnrNgahZcbSLBzy.jpg', NULL, 'panpanflora873@gmail.com', 'ICN3UI1', NULL, 1, 3, NULL, '2023-09-22 16:25:14', '2024-01-18 15:46:17', 'Luanda', NULL, 'documentos/empresa/documentos/LinqNxPT6Jy9OiDpfuEE4dVj99a6CS7RnDRh0hbr.pdf', 'ativo', 'N', '2024-01-18 15:46:17'),
	(153, 'Electronimi', '923423206', 'Cacuaco, Sequele T1', NULL, 1, 0, '5001522922', 1, 2, 2, 'utilizadores/cliente/avatarEmpresa.png', 'www.electronimi.com', 'electronimi666@gmail.com', '912G5O2', NULL, 1, 3, NULL, '2023-09-25 08:18:26', '2023-10-03 21:05:05', 'Luanda', NULL, NULL, 'ativo', 'N', '2023-10-03 21:05:05'),
	(154, 'Nzolo', '999999998', 'Sul Angola', NULL, 1, 0, '345689120', 1, 1, 1, 'utilizadores/cliente/7PE9bte1IZbnZBzedvbzGCYzHG0qaXde0ZpMQeJd', 'nzolo.co.ao', 'uma@mailna.co', '96V48QZ', NULL, 1, 3, NULL, '2023-10-07 21:41:50', '2023-10-07 23:42:20', 'Luanda', 'documentos/empresa/documentos/WKNz6bWGi8OW1oV9vGfgw1wVxcMprM8Z4v8p3Fux.pdf', 'documentos/empresa/documentos/3zwPsP3OnL0RY9i1laOCSJXwF4TrPxHR01UETP0k.pdf', 'ativo', 'N', '2023-10-07 23:42:20'),
	(155, 'Lotus detail', '965882277', 'rua Hermenegildo Capelo n177/179', NULL, 188, 0, '271783060', 1, 1, 1, 'utilizadores/cliente/avatarEmpresa.png', NULL, 'rute141993@gmail.com', '149U144', NULL, 1, 3, NULL, '2023-10-09 15:52:20', '2023-10-09 15:52:20', 'Setúbal', NULL, NULL, NULL, 'N', NULL),
	(156, 'ZUN', '923298581', 'luanda', NULL, 1, 0, '500002588882', 1, 2, 1, 'utilizadores/cliente/avatarEmpresa.png', NULL, 'mauro3francisco@gmail.com', 'INBXA32', NULL, 1, 3, NULL, '2023-10-10 07:45:45', '2023-10-10 08:50:51', 'Luanda', NULL, NULL, 'ativo', 'N', '2023-10-10 08:50:51'),
	(157, 'MAPWELA EMPRENDIMENTOS, LIMITADA', '927282881', 'BENFICA ZONA VERDE II, RUA G/1º TRAVESSA, Nº S/N.', NULL, 1, 0, '5000988600', 1, 1, 1, 'utilizadores/cliente/7DnIYeS8s11VZ7G2ZEnzQ3DQ3r0ZWh1eGdb6yfMC.jpg', NULL, 'mapwela.geral@gmail.com', '8KX3S2I', NULL, 1, 3, NULL, '2023-10-10 08:31:33', '2023-10-17 10:39:46', 'LUANDA', 'documentos/empresa/documentos/CgFJ6XbJiTLnXONGrk8eGi974slDFFD4lsIhDVU8.pdf', NULL, 'ativo', 'N', '2023-10-17 10:39:46'),
	(158, 'CLINET ARTES GRAFICAS', '931923522', 'Martires do Capolo II', NULL, 1, 0, '5484022783', 1, 2, 3, 'utilizadores/cliente/p670DVktvFimEeQ1wci3szM4h0wybnYFBeflCyT4.jpg', NULL, 'novconta900@gmail.com', '7A5E765', NULL, 1, 3, NULL, '2023-10-12 22:32:29', '2023-10-13 01:40:56', 'Luanda', NULL, NULL, 'ativo', 'N', '2023-10-13 01:40:56'),
	(159, 'OFICINA AUTO MXN', '923498707', 'Rua direita do BFA, bairro kifica-talatona', NULL, 1, 0, '5001699962', 1, 1, 3, 'utilizadores/cliente/T2OHbUUpqcb5AjzSIXWaqXqeZHQD4QJ9mIHdanVU.jpg', NULL, 'fboficina2019@gmail.com', '6AKUKV7', NULL, 1, 3, NULL, '2023-11-18 11:10:54', '2024-01-23 15:06:46', 'Luanda', 'documentos/empresa/documentos/44AG4J4rMxvxM4jVGIll0gWy3U2j6tsMAv74ipDz.pdf', 'documentos/empresa/documentos/ByFqOihy661nZTjp1TJZSgrWwXIDcCjzN5vkU9oK.pdf', 'ativo', 'N', '2024-01-23 15:06:46'),
	(160, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', '949943449', 'AVENIDA MURTALA MOHAMED - BAIRRO ILHA DO CABO, N 6 MUNICIPIO LUANDA', NULL, 1, 0, '5000620092', 1, 2, 3, 'utilizadores/cliente/fCw2t5Uj6ApAuF1o7fWpSsrq6nGHi5PtYloVw3Lb.jpg', NULL, 'geral.mvbb@gmail.com', 'P6TANQA', NULL, 1, 3, NULL, '2023-11-22 12:51:39', '2024-01-18 19:38:24', 'LUANDA', NULL, NULL, 'ativo', 'N', '2024-01-18 19:38:24'),
	(161, 'RAJAK - Comércio Geral, LDA', '924415938', 'Cacuaco, Estrada Nacional', NULL, 1, 0, '5601019282', 1, 4, 2, 'utilizadores/cliente/nV13ouXhpMTNB4sIkXKQXVobrlvEDsrHtaZtXVc4.png', NULL, 'seguranrajak18@gmail.com', '1NT0HXD', NULL, 1, 3, NULL, '2023-11-23 19:03:42', '2023-12-18 08:28:33', 'Luanda', 'documentos/empresa/documentos/3ysWRzejK3K3g8IKeJjZrDjC80HCMEBy7wncqjPy.pdf', 'documentos/empresa/documentos/DnSBVBxUIfVl3G2C10sI3Nnw2yaPU9e6KFIy2lUs.pdf', 'ativo', 'N', '2023-12-18 08:28:33'),
	(162, 'ANGOLA vidro', '931656134', 'Via Expresso, Viana Bairro Kikuxi', NULL, 1, 0, '5405158186', 1, 2, 1, 'utilizadores/cliente/avatarEmpresa.png', NULL, 'angovidro345@gmail.com', '4RTC20E', NULL, 1, 3, NULL, '2023-12-15 21:58:14', '2023-12-15 21:58:14', 'Luanda', NULL, NULL, NULL, 'N', NULL),
	(163, 'RICWAN Comércio Geral e Prestação de Serviços, LDA', '930668932', 'Bairro Nelito Soares, Rua da Cela Edifício N°51A, Distrito Urbano do Rangel, Município de Luanda', NULL, 1, 0, '5001377604', 1, 6, 3, 'utilizadores/cliente/2DYdC4VcRU64cYUe68LAPl102NWlfxY8FwS2mLzo.jpg', NULL, 'ricwansolucoes@gmail.com', 'S1R5QO8', NULL, 1, 3, NULL, '2023-12-19 16:16:15', '2024-01-11 12:01:04', 'Luanda', NULL, NULL, 'ativo', 'N', '2024-01-11 12:01:04'),
	(167, 'Operador Temporário Aeroportuário do Aeroporto Dr. António Agostinho Neto', '937036322', 'Estrada nacional 230, km 42 - Municipio do Icolo e Bengo, Distrito  do Bom Jesus, Luanda-Angola', NULL, 1, 0, '5001720538', 1, 1, 1, 'utilizadores/cliente/lXLysP0gRqaSb6RtjDsvvrn2DP1VJfyZvina9Sxo.png', 'ato.ao', 'info@ato.ao', '4EEJFPK', NULL, 1, 3, NULL, '2024-01-23 16:10:54', '2024-02-27 13:12:18', 'Luanda', NULL, NULL, 'ativo', 'N', '2024-02-27 14:12:18');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total_preco_factura` double DEFAULT NULL,
  `valor_entregue` double DEFAULT NULL,
  `total_sem_imposto` double DEFAULT NULL,
  `valor_a_pagar` double DEFAULT NULL,
  `precoLicenca` double DEFAULT NULL,
  `troco` double DEFAULT NULL,
  `valor_extenso` varchar(345) DEFAULT NULL,
  `codigo_moeda` int(10) unsigned DEFAULT NULL,
  `desconto` double DEFAULT NULL,
  `total_iva` double DEFAULT NULL,
  `multa` double DEFAULT NULL,
  `nome_do_cliente` varchar(145) DEFAULT NULL,
  `telefone_cliente` varchar(145) DEFAULT NULL,
  `nif_cliente` varchar(145) DEFAULT NULL,
  `statusFactura` enum('1','2') DEFAULT '1' COMMENT '1=>divida; 2=>Pago',
  `email_cliente` varchar(145) DEFAULT NULL,
  `endereco_cliente` varchar(145) DEFAULT NULL,
  `numeroItems` int(10) unsigned DEFAULT NULL,
  `licenca_id` int(10) unsigned DEFAULT NULL,
  `tipo_documento` enum('FACTURA','FACTURA PROFORMA','FACTURA RECIBO') DEFAULT 'FACTURA',
  `venda_online` enum('Y','N') DEFAULT 'N',
  `observacao` text,
  `retencao` double DEFAULT NULL,
  `nextFactura` varchar(45) DEFAULT NULL,
  `faturaReference` varchar(45) DEFAULT NULL,
  `numSequenciaFactura` int(10) unsigned DEFAULT '0',
  `numeracaoFactura` varchar(255) DEFAULT NULL,
  `tipoFolha` enum('A4','A5','TICKET') DEFAULT NULL,
  `hashValor` text,
  `formas_pagamento_id` int(10) unsigned DEFAULT NULL,
  `retificado` enum('Sim','Nao') DEFAULT 'Nao',
  `descricao` varchar(255) DEFAULT NULL,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  `canal_id` int(10) unsigned DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_vencimento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_facturas_canal` (`canal_id`),
  KEY `FK_facturas_empresa` (`empresa_id`),
  KEY `FK_facturas_status` (`status_id`),
  KEY `FK_facturas_user` (`user_id`),
  KEY `FK_facturas_formas_pagamentos` (`formas_pagamento_id`),
  KEY `FK_facturas_moedas` (`codigo_moeda`),
  KEY `FK_facturas_licencas` (`licenca_id`),
  CONSTRAINT `FK_facturas_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_facturas_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_facturas_formas_pagamentos` FOREIGN KEY (`formas_pagamento_id`) REFERENCES `formas_pagamentos` (`id`),
  CONSTRAINT `FK_facturas_licencas` FOREIGN KEY (`licenca_id`) REFERENCES `licencas` (`id`),
  CONSTRAINT `FK_facturas_moedas` FOREIGN KEY (`codigo_moeda`) REFERENCES `moedas` (`id`),
  CONSTRAINT `FK_facturas_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.facturas: ~53 rows (aproximadamente)
INSERT INTO `facturas` (`id`, `total_preco_factura`, `valor_entregue`, `total_sem_imposto`, `valor_a_pagar`, `precoLicenca`, `troco`, `valor_extenso`, `codigo_moeda`, `desconto`, `total_iva`, `multa`, `nome_do_cliente`, `telefone_cliente`, `nif_cliente`, `statusFactura`, `email_cliente`, `endereco_cliente`, `numeroItems`, `licenca_id`, `tipo_documento`, `venda_online`, `observacao`, `retencao`, `nextFactura`, `faturaReference`, `numSequenciaFactura`, `numeracaoFactura`, `tipoFolha`, `hashValor`, `formas_pagamento_id`, `retificado`, `descricao`, `empresa_id`, `canal_id`, `status_id`, `user_id`, `created_at`, `updated_at`, `data_vencimento`) VALUES
	(21, 10000, 0, 8600, 10000, NULL, 0, 'dez mil', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '2', 'mutuemobile@gmail.com', 'Luanda', 1, NULL, 'FACTURA', 'N', NULL, 0, NULL, '831708130', 3, 'FT FAB2021/3', 'A4', 'axSU8v8py45ft3rhJtdo36uK4mK5JrA/xfL2iupGsNk6fO2fKFshLpDuLX2HRbcXrOVGDNMWLiNxNnsQuUiItBssaFE2FrEuoXvT6LGS1p2teMiDVlTq5OxeDEwDHMkQDyhdMK1nWfSXN22qafMF5X1JexEsocE7Ojvj69u8C/g=', NULL, 'Nao', 'LICEN?A MENSAL', 38, 2, 1, 35, '2021-09-23 12:36:18', '2021-09-23 16:24:44', '2021-10-08'),
	(22, 100000, 0, 86000, 100000, NULL, 0, 'cem mil', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '2', 'mutuemobile@gmail.com', 'Luanda', 1, NULL, 'FACTURA', 'N', NULL, 0, NULL, '146075198', 4, 'FT FAB2021/4', 'A4', 'SDhgkdhIv3lC1vVEyCahlk7B3avX2MO2zv9Xq+6bdpbJ71UnG98GiNGZ6eNByz2qSj3EVaQzwqh6cWjnNzd+URDMbApbyOSkUwfbv+1ZiTQ4dzxa+BW/9FlioyVhhPgb5Ij9lsO8uSVTKiKH/zx5u0XTFbjGxVC54JRSCJDY0ag=', NULL, 'Nao', 'LICEN?A DEFINITIVO', 38, 2, 1, 35, '2021-09-23 13:03:42', '2021-09-23 16:23:05', '2021-10-08'),
	(25, 100000, 0, 86000, 100000, NULL, 0, 'cem mil', 1, 0, 0, 0, 'Francisco Cassinda', '924645400', '000193021BA018', '1', 'francisco.cassinda21@gmail.com', 'Viana, Bairro Ngola Mbandi', 1, NULL, 'FACTURA', 'N', NULL, 0, NULL, '801465879', 1, 'FT FAB2021/1', 'A4', 'WZu/irp70pXzIbPT4WwujYLmydHLTJ+T9DZnQYeeWzb7pjkumN8Y3I0Dlr9RyDwu26/ZvNx8Ifo5pGNVNW4YRH2uZNgyZArIRg5ggkI+EahJqlXtc6Va42mBXafuk8gkHJTtG3WsJf5/pjVNON9wvrsJZY7cgtutGyp85w6SD20=', NULL, 'Nao', 'LICEN?A DEFINITIVO', 104, 2, 1, 607, '2021-10-28 13:56:40', '2021-10-28 13:56:40', '2021-11-12'),
	(26, 10000, 0, 8600, 10000, NULL, 0, 'dez mil', 1, 0, 0, 0, 'Avelino Capoco', '929661181', '004937632ME041', '1', 'usdera7@gmail.com', 'Luanda', 1, NULL, 'FACTURA', 'N', NULL, 0, NULL, '120297518', 1, 'FT FAB2021/1', 'A4', 'IWUCOo49ccbjKVIs/6e3VsXKPBN7BSR5RkLE0trCzpCcH67FGLb6w1qFFeJUo8zhBOYTcBTfCZ5C1Q5CwVIaLCUBhs79udkw4px8v3bjW2mMex59AepaqA1Wm7conMGWeTCCbxFqtQKwE0G2j6aCAyKirIXQT57KC5AQZ1aBMcg=', NULL, 'Nao', 'LICEN?A MENSAL', 52, 2, 1, 554, '2021-11-19 10:38:04', '2021-11-19 10:38:04', '2021-12-04'),
	(52, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'E.A TECNOLOGIAS', '921000038', '000912421LA034', '1', 'infoeatecnologia@gmail.com', 'Lar da Patriota', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '977138503', 13, 'FT MUT2023/13', 'A4', 'hmw0eT/XZTa3HXw8cQQC2xWWZ0WizpSbhYSpuLtqT4UU6tjvgg5E5sOg96n6LSq86vjTHPVhjV6x6OwDeV+45t3kYTUgwfrsTLyRh9L+VEm52jGwq1NlVnEG/91wQc8+Wgm1CHlmw/1wehUYRENhWV3a+zQpQFf96fQuyyMzHEY=', NULL, 'Nao', 'LICENÇA MENSAL', 144, 2, 1, 661, '2023-04-14 22:11:52', '2023-04-14 22:11:52', '2023-04-29'),
	(55, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luanda', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '570119229', 14, 'FT MUT2023/14', 'A4', 'uNDKJlL4oXTdI25rIv2F+7XdSmiyMHboE8VPUyBnGGcUxpEEvRXuVXCM1pboLadgDR2hP7N7Qnu6PhEg+rgcc3lQ+SAUMOIRVY5ycKBCgE5i3SJCadUXIQjJWP55AswHfWUlTwNYUKW7cTesLfC8pCCr1CP1WjxKX7S+/HRyE90=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-05-10 12:43:19', '2023-05-10 12:49:16', '2023-05-25'),
	(59, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'FANCHA - COMÉRCIO GERAL & PRESTAÇÃO DE SERVIÇOS (SU), LDA', '927040403', '5001366408', '2', 'fanchacomercio@gmail.com', 'Benfica', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '674319073', 15, 'FT MUT2023/15', 'A4', 'XQisr0WKNokX+631scThtZudag/GhCi/WFVdOp4ZSYmLfnG8eWxw6CfxRcBgDeU4YPvzrCgLV5Xw6Fl8cnl0eLcTkKt9QyCA/aCA/U9GYNIGtgKUSM8Cro3r3s4RqevKI6OuxJAoQiHGP5p/Ic35vtrLcfFSdYeETqQpXZyj/Nw=', NULL, 'Nao', 'LICENÇA MENSAL', 147, 2, 1, 668, '2023-07-11 13:33:42', '2023-07-11 14:30:26', '2023-07-26'),
	(60, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luanda', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '258498390', 16, 'FT MUT2023/16', 'A4', 'vG6gKhhk4wRksOvbpJmg/br32ZMibJSnz0B5bica6wf/nhVrtwvkT6IhKfWkaE9U9ugEnv4Awnh33jMtXbVUzkrtXzs9FxpDUzwU5B/sMN32ZKSJkblvHFqG9Lc6mcfkyD5kKauul1cyqaSbOwYoOmyPwfLkSGJtqL4c24mpd1w=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-07-12 09:43:15', '2023-07-12 09:43:15', '2023-07-27'),
	(61, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luanda', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '759831291', 17, 'FT MUT2023/17', 'A4', 'ZbAUno3MwrYp3mGjFeOHIKAhfUnl5SbplsJ2uzEt2coOxG5HQ3qMvvwi2rCM/tvrXVjQwtBTGCni4Mwwpuk5TaejQ26esiPtn7bI0B1QmxBxSK5aChLC2ZecyTEPskqNJJmiZ6cWGBgojuLvJSSFXhBbqOXwV0UfijbnEjprQBQ=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-07-12 10:38:46', '2023-07-12 10:38:46', '2023-07-27'),
	(62, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'E.A TECNOLOGIAS', '921000038', '000912421LA034', '1', 'infoeatecnologia@gmail.com', 'Lar da Patriota', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '293815232', 18, 'FT MUT2023/18', 'A4', 'INSF06HzJlUdUb59PssHAHEUBiiyT5IyfogKu3aubhVvpswm8pT0lHUfWYRXlNuMiEEriCZynRblYWzhtcDOQOog7M0XBBYQlPyUzHbT9GmlTpJkuc++3uSw4PB+KKs0Yc4LSDOoCQ/9JDmlKoGjas0Kbq/LH/quFz3xh3++7LY=', NULL, 'Nao', 'LICENÇA MENSAL', 144, 2, 1, 661, '2023-07-19 16:00:46', '2023-07-19 16:00:46', '2023-08-03'),
	(63, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luanda', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '034109175', 19, 'FT MUT2023/19', 'A4', 'yKkleqkdV6DtphZSq05MJtpSO2E+ytrxhTbrGk1PaQg0uELT0njA/Mpku8gbDBmKY8vQq0+aZ1YkF/V2NS8FNgDfvkGIXutBLWx5GZqiiniE3wAhOByO0vDvLk50WCrncDAL5mv7pWMyp8U3aQNCW4bEW9G2akiJ5zzHB1hJmj4=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-07-19 16:10:29', '2023-07-19 16:10:29', '2023-08-03'),
	(64, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'E.A TECNOLOGIAS', '921000038', '000912421LA034', '2', 'infoeatecnologia@gmail.com', 'Lar da Patriota', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '833411926', 20, 'FT MUT2023/20', 'A4', 'Mu8xqpZe89aBylu1m5M8nDhsIpP5PYC7gzGB8zim7RovYZt3qguH9ZOSk9d81whMm26mg9EUeqdEw/5mHOZzamfsjQGaXMtlzBkokakk2IRKiZ15vVVRV/I56ZFuPsfB5lyCeKOYvwItElHDCMBx0VtT4V8D1LZ2QzhhmGyJaGk=', NULL, 'Nao', 'LICENÇA MENSAL', 144, 2, 1, 661, '2023-07-19 16:35:41', '2023-07-19 16:38:49', '2023-08-03'),
	(65, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '120085644', 21, 'FT MUT2023/21', 'A4', 'TJ0Xl3raQEPkWrQsdDN5+iABbFEie9PW7J9d94rhC42GpDHIM+HCSUVQoV1d+9WI15XKCQzE03w6nawTOrtoIEX+1s+YZ1b3y4sSLnqpCFj9SNKEfkgz+4f332BMKouFpvkVQpgRYPfqetOlLKpX2WMloRIFOg2haclrQHK0Xo8=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-07-26 17:40:02', '2023-07-26 17:40:02', '2023-08-10'),
	(66, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 3, 'FACTURA', 'N', NULL, 0, NULL, '934023064', 22, 'FT MUT2023/22', 'A4', 'iErz2m+b/qgN8VnBhSjg1rPctPy/t96A0Pdwcl/fEwkI8YJ6uoxo5Dq/U+SyX4yZLI83REa8wQ0OUzvoorqUwYytQD1usBqsMk8qJn6CUxINvNyRbEZzcEy2LTIIvPB7l14jkV70SxR2aepr0FMwEzPDaLDAkkDId69PNfygc9k=', NULL, 'Nao', 'LICENÇA ANUAL', 38, 2, 1, 35, '2023-07-26 17:43:59', '2023-07-26 17:43:59', '2023-08-10'),
	(67, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '019765294', 23, 'FT MUT2023/23', 'A4', 'sJcbDazzdEFsdABSrWJChF0fzDH3x6S3qOxAYfg4hgJFrxQ7bVQ6WoPBOvHMbhh1XOUIjyoCT3l4JvZj440xzzXzB7L7WRN6Xpn4SwZH7V/dTw8W5aZmR4eFn00yHSR6xGBv36GHXPuEUxfyCuuqCOsTsOoaT68RYiCIiHmhGYo=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-07-26 17:44:19', '2023-07-26 17:44:19', '2023-08-10'),
	(68, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 3, 'FACTURA', 'N', NULL, 0, NULL, '724600529', 24, 'FT MUT2023/24', 'A4', 'AGsh451XlOHdbNThmtbnzQDyo5jJd0N4TE4L8MQ2DwfqxjSvSOkMZIzjg0R4+LwsYpQpf0rBOd7BA9V3LomSWeuWkOU3O2EyQ8pfDd37vZuOKZ3iZ8IzMnRO9RrILFczfZdnIi/eJOSBPXwbvhj0NPtSPHvn2uZTxIsAuEQpS88=', NULL, 'Nao', 'LICENÇA ANUAL', 38, 2, 1, 35, '2023-07-26 17:44:35', '2023-07-26 17:44:35', '2023-08-10'),
	(69, 216600, 0, 30324, 216600, 216600, 0, 'duzentos e dezesseis mil e seiscentos', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 4, 'FACTURA', 'N', NULL, 0, NULL, '091182467', 25, 'FT MUT2023/25', 'A4', 'p6eq45Gh7gGCWapFUC+8ovGKRCYRnVL6MxE6PahzoDvsTC5NdfECpb9/uOSPV2oeGxHR1dDDgMcKERNIQGfyrrNiZvWpk/UOo5i3e3JkhvI4ApaH6ff+XwwDNeuUcJw9kyDmis3RUVTijtH57geLpeXg/O13LgvXP29Wkna38wI=', NULL, 'Nao', 'LICENÇA DEFINITIVO', 38, 2, 1, 35, '2023-07-26 17:44:47', '2023-07-26 17:44:47', '2023-08-10'),
	(70, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '049416017', 26, 'FT MUT2023/26', 'A4', 'qCCy8gpMGGBBfEjC+/orJJc7quHAY8yZ/dVRc2pBoZic8Yn1poE8yWlVxO4U92Yp9TXtNXe97NzKixk4cFxCqm2uSPaXjEM98CCosbptU+NemAcVRBg4S8KtKcCyPeovG1rgablIxhIm416z/nDoPNvdB4bGS308y6y/AwwmeZk=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-07-26 19:24:34', '2023-07-26 19:24:34', '2023-08-10'),
	(71, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 0, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 3, 'FACTURA', 'N', NULL, 0, NULL, '817932405', 27, 'FT MUT2023/27', 'A4', 'nUW5CG5UY+VOrnnTSDtnVUjBBoIekhZbi34IBVArrMkN0RlZq+85ctwLtNrbK8qZ0JbymCMmZEjljVkfCe9JqGGsBdtdA4vhSW9iLYqf1yJ735oJAzv6UCLWUY4mcRG8xqAlXoTaSMQOfEr5hk+oMFqRkM4j6OJ+rWTW3Rl52Mk=', NULL, 'Nao', 'LICENÇA ANUAL', 38, 2, 1, 35, '2023-07-26 19:24:50', '2023-07-26 19:24:50', '2023-08-10'),
	(72, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '868532203', 28, 'FT MUT2023/28', 'A4', 'ppS3bu6cBrZWldnIjDCMx0Vct8D7xtci7ytl05DAzMF/mkwCkhajCxNMFBgnk3z4XdRH+H6pE4+dzQyKBp6QbX9Q5eZb5dYIAdDpfQJziXtUqmBqzy+zkZJKVRAphXF6iDhrEGfaDoBE8l6q/4dLxmAOD7dXRl+8Czp9VI299jo=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-07-26 19:31:47', '2023-07-26 19:31:47', '2023-08-10'),
	(73, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 15162, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 3, 'FACTURA', 'N', NULL, 0, NULL, '846287016', 29, 'FT MUT2023/29', 'A4', 'q6Z4f4dZyE4I97Fqo7tmDJxaBn2fFz9RONikyL6nmzuBKo5twCwuOHzWMGsnJS33jW03VGVKKEly8UExYhjALZNMAo4aguKP6t0UMsXek3tjXKGWrSnSxPrKhpkt1S8z9HJTTSZiIGyXtVkOatsyOuV0Gz3ShKKmm97pG5YJK8s=', NULL, 'Nao', 'LICENÇA ANUAL', 38, 2, 1, 35, '2023-07-28 16:56:13', '2023-07-28 16:56:13', '2023-08-12'),
	(74, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '443911350', 30, 'FT MUT2023/30', 'A4', 'SnyaAecmP5jVF9xfu7b26R6T14auvNzNB8oL3BD8eb9T6Qh5vQrdlvcLUbsQ/OYanwOtqdl+ZBvBWaJGUaI+0d876bJ0STh0MtJL3mWNV+ps701nlwEi1ydk/xroKN5r9fH/Gi9w/siIrUac8CjvvdovG3EeGxdZz42ULM9wWJk=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-09 14:24:42', '2023-08-09 14:24:42', '2023-08-24'),
	(75, 216600, 0, 186276, 216600, 9025, 0, 'duzentos e dezesseis mil e seiscentos', 1, 0, 30324, 0, 'KIMA KIETU - ARTES, GRÁFICA, EDITORA, MARKETING E PUBLICIDADE, LIMITADA', '928377540', '5000977160', '1', 'geral@kimakietu.ao	', 'Luanda', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '443911350', 30, 'FT MUT2023/30', 'A4', 'SnyaAecmP5jVF9xfu7b26R6T14auvNzNB8oL3BD8eb9T6Qh5vQrdlvcLUbsQ/OYanwOtqdl+ZBvBWaJGUaI+0d876bJ0STh0MtJL3mWNV+ps701nlwEi1ydk/xroKN5r9fH/Gi9w/siIrUac8CjvvdovG3EeGxdZz42ULM9wWJk=', NULL, 'Nao', 'LICENÇA DEFINITIVA', 33, 2, 1, 35, '2023-08-09 14:24:42', '2023-08-09 14:24:42', '2023-08-24'),
	(76, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, '203319046', '203319046', 20, 'FT MUT2023/20', 'A4', 'mrKcOIjZlJaO5aZjHMHGhd7bC0ztp1pOnVR2Ms/RnDqTSL/+4xig1FDxrIxpOpcxF7O/t4lZyKImWPfDJBunbu0nwI4ByZmfkBgiHptcqSVLlXcXf99oJYAzj+VVD+7r1xeSYWsTFZQcyvjOOYHbPxAvc9b1UaQiW5Rht3lc2mI=', 4, 'Nao', 'Licença Mensal', 38, 2, 1, 1, '2023-08-09 16:59:01', '2023-08-09 16:59:01', NULL),
	(77, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '569303972', 21, 'FT MUT2023/21', 'A4', 'BnIycVJ6ezd0ttqrw1aIbU86X+ill2ou3SQNbG8dt/N385JHOH7scigkgSXMndQgT2mr5lJxKcjnvuJqQsXMlXsAHWN4Uos5CKDzXfgAUEYzmk9G2K3B+sFx1AE1XMH+OZNJZg9H5Ho4TBfnvWKQjwVHp1ZwHlVsZcIjCksgkGw=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-17 09:54:24', '2023-08-17 09:54:24', '2023-09-01'),
	(78, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '549061542', 22, 'FT MUT2023/22', 'A4', 'BaRgREIRLpzZXLKYJFBNFQYF3cMo+IeqtpU4QN2WxFJa1Tl3NcCrw9u945NYnUFgemsK9jaA1/aIDH19jvI7v2MGjm5p3t0ezYH4eVQ0Ma3rPdmoukFG6WovhEVxKqxsjntxq8wqMUkx+8iAm/hFkP3FX5EZwinFx12+sMvUwfg=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-17 09:57:30', '2023-08-17 09:57:30', '2023-09-01'),
	(79, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '260852152', 23, 'FT MUT2023/23', 'A4', 'OWMQIFMZdl7M+C+NQQAK7U1lrcvWxy7PcnYOrnvao9MIKyQVfndlzAyu31jXgOZIr1hZhmyxgQRMjzWAiU2BRxF0uZtGJ9QqkvVnDbQBfjFgP2pp6w4mfs6uMivD2MiukxG2e2OhRnL4wQKvj/I4mKBextfSlgvwYPjaAaVaf+I=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-17 10:06:09', '2023-08-17 10:06:09', '2023-09-01'),
	(80, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 15162, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 3, 'FACTURA', 'N', NULL, 0, NULL, '728151023', 24, 'FT MUT2023/24', 'A4', 'Neuyl1xGRFkt5kUlyyr7owEIJQkd97P8MJNvNvOIzNsYP70O2vOfrZMQdz+m6X9VTcHcoyt4ROzYwLk7qRiZg77CPAyRi6buh/oWOvdW9IFoKLF7K3d0T5k7Dk2SkUo69EnfA7ksbZJz29VxGTgMQYyhDKi/+evFJXumdqBBemM=', NULL, 'Nao', 'LICENÇA ANUAL', 38, 2, 1, 35, '2023-08-17 10:06:30', '2023-08-17 10:06:30', '2023-09-01'),
	(81, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 15162, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 3, 'FACTURA', 'N', NULL, 0, NULL, '214668278', 25, 'FT MUT2023/25', 'A4', 'xtQmdwjx++D1xGwDLjqIHNfICd1Q26kOSiVLQBTWLHo7oS3//X9T2EWmfyO4rsyIWKHvOVHW+bPUZJ+gFiqkAWXgslKTBokxRoiObX52tBOx5LgOocXFvVvKi1JcuXTwpoA76jbhDuXeHEmqpalw6s1GbRx8al4/AyNLZlTDCRM=', NULL, 'Nao', 'LICENÇA ANUAL', 38, 2, 1, 35, '2023-08-17 10:07:30', '2023-08-17 10:07:30', '2023-09-01'),
	(82, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '362453987', 26, 'FT MUT2023/26', 'A4', 'DafWgzQjQD6BhTPdQWhltmWK+Oalem1GslIiSPn1jeHyBkrjwYRLVG7D5mW4fE75X7EQlXsarzY32qnyv8vyPKjOEB44CJqOPBtMBNjJ9eZ/dwr1iU7UaDPTeCfgCcnaflOoPzWU16KOOWDDbpFcXIYQe71VB146huO5r4zhCHI=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-17 10:11:28', '2023-08-17 10:11:28', '2023-09-01'),
	(83, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '714493862', 27, 'FT MUT2023/27', 'A4', 'N8arTU07vWjDySVlC6TW2GtE3GIUgwEE17S9EN6U8LBG/7vWxBOQCsDPybz/w/uQ9DSQyH2WyfKqUSMfr7XQwlfEJkPME41zkC+xEpanui4zHIGdN2jJBC6vpLe3Efgf8rAC+ju1YGvYY7DGcH0WFGHNjndXBUFfiRhkCtOxHJs=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-17 10:13:21', '2023-08-17 10:13:21', '2023-09-01'),
	(84, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '834272396', 28, 'FT MUT2023/28', 'A4', 'Y7W7h8R0jquehWoh/S1//jI0geRruAPvYTU5EJhuHY1kbcrSWWfbZuMJKIi+hpo+cv+527f83oZ/fW7JAFJXOoDJV9zuzElFyyvjtDtQ/JvHlW2q8bM+WbZIYRc5ubVPdgHhCtdb/8L0t3T1w7D3C1cbKCtgLS5U4Dw0OfJ8Zwc=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-17 10:15:46', '2023-08-17 10:15:46', '2023-09-01'),
	(85, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '529415303', 29, 'FT MUT2023/29', 'A4', 'GkGbSIfXR+jc7DcE5roYEtZihd5WcOsyQTglA6VblQao+LqJdO6gWfj6Ag8mrue3nM+1epATtdsqIe36BjiGfbTN3UCmBef07U2GyFbMd2PxfresS7rVvQgTpHbRiQRHHuGeP0Ph2tRLU80Fix4r5SauDxMAOrN5OQa8t+B4xws=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-17 10:17:24', '2023-08-17 10:17:24', '2023-09-01'),
	(86, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '202134708', 30, 'FT MUT2023/30', 'A4', 'J6oSeumhdPE25llTFqEFVcIDrrHhNIEbHsSUg1dz7XPfb9IXxDIYnUAtSpoGspOA56oVRql4J/mdh6Eadg+gBJsvmIFnneEJ6dnqfuIFtCQA7KRrR72K68xV2FyitV6bCFyweDg4Nyjm9KGB5v4l8taStCa12qpVrUMy5mOgWZY=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-17 10:21:35', '2023-08-17 10:21:35', '2023-09-01'),
	(87, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '902032750', 31, 'FT MUT2023/31', 'A4', 'vpzs6Y3Alwi2KHd2LoEU+XAvgnlrsT0ed7dc2H/2YuosrOsZ/Ip2jAN/QBaiDHRpPwPLo3vxZGoCW6UJs0r+ttokHsVElOFBaM4e1uPQOnucqHrU+U0NgFHQ9Z4RfzWSSA8V4Z7VvuA+BM1tMCfm926TLQLMj9snRXsIehCjSz4=', NULL, 'Nao', 'LICENÇA MENSAL', 38, 2, 1, 35, '2023-08-26 11:24:46', '2023-08-26 11:24:46', '2023-09-10'),
	(88, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'FANCHA - COMÉRCIO GERAL & PRESTAÇÃO DE SERVIÇOS (SU), LDA', '927040403', '5001366408', '1', 'fanchacomercio@gmail.com', 'Benfica', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '112733209', 32, 'FT MUT2023/32', 'A4', 'hN+ksCBjSL2YrDRgih3xL0Zj1PMdMN5LRn8nN9q6RwxJhBIXWow2qhdUcUssKAu6rkup0olVdnLRi2oNns04JbIzBsQoSaXG5y6vHrcxHI9znFtDNo0jtxlSeJllOuRA9rYl1rQDqw2WBxhSVYXzr85um2U3rXH+n9OwqYMzzQU=', NULL, 'Nao', 'LICENÇA MENSAL', 147, 2, 1, 668, '2023-09-21 08:02:50', '2023-09-21 08:02:50', '2023-10-06'),
	(89, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'FANCHA - COMÉRCIO GERAL & PRESTAÇÃO DE SERVIÇOS (SU), LDA', '927040403', '5001366408', '1', 'fanchacomercio@gmail.com', 'Benfica', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '458897329', 33, 'FT MUT2023/33', 'A4', 'afKWxQ49QHukaWqcODkEuzTAyXlzdS7YuWmIR938kV1Af33v86pa9SmnyfXjoZCdhArpatTWY7id7/Emblx5YAkCZAOJc4trFQiXL5XTUx6uoyWW2Ei4cwUxYL2Jj2BOgmv1mWFmGu3HnBYL260Z4LVeITBzHbAAtlTJqXMIx5o=', NULL, 'Nao', 'LICENÇA MENSAL', 147, 2, 1, 668, '2023-09-21 08:58:16', '2023-09-21 08:58:16', '2023-10-06'),
	(90, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'FANCHA - COMÉRCIO GERAL & PRESTAÇÃO DE SERVIÇOS (SU), LDA', '927040403', '5001366408', '1', 'fanchacomercio@gmail.com', 'Benfica', 1, 2, 'FACTURA', 'N', NULL, 0, '846432108', '846432108', 34, 'FT MUT2023/34', 'A4', 'Hx6z/01u03E6/oGHC+mECiHzyO2RqO3Nc9LkeSEbqd7gFcvZIgdjR+BRsG+XpCTGba6BiOHlrueWq/tLAQNmPQAiWzOOz/y2n41ltsAhkehutRO7p/QEkEISUaBcY7FiMWIs2DJS3zdgiw1cxiH+eR7ugGmWUpMDSbLxEzyooHg=', 4, 'Nao', 'Licença Mensal', 147, 2, 1, 88, '2023-09-21 09:13:31', '2023-09-21 09:13:31', NULL),
	(91, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', '938294568', '5001599917', '1', 'panpanflora873@gmail.com', 'Estrada de Catete', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '485291214', 35, 'FT MUT2023/35', 'A4', 'x//z/e7s+Mb6TaMK8LsAyFXcXnA1spZLnP0eu463bNWplUgbT08z8Xjd6TW4WmFMMqQrN0qfQUYWv6/S/dAkRCcQep+Z5IwUBYFC3PeVhLbCjWqNiW2E6gPLPedWhowFFnLVrtE/XIHJd5E7aFDk3rR2BLqWGeq6AkVGnVjyFQU=', NULL, 'Nao', 'LICENÇA MENSAL', 152, 2, 1, 693, '2023-09-27 10:49:22', '2023-09-27 10:49:22', '2023-10-12'),
	(92, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', '938294568', '5001599917', '1', 'panpanflora873@gmail.com', 'Estrada de Catete', 1, 2, 'FACTURA', 'N', NULL, 0, '179541622', '179541622', 36, 'FT MUT2023/36', 'A4', 'ggpYZSWiUp95QczxShGAtQbQKTSxHEDKYN0EL3rco924hBl+IwPZPd3xqfIvef0f4YJpibObqRqVQn/0vD91dypWol++ANPjDK4OO+P2J9hXMoBjz9d9/HSIwn7ZInfpEdAPezAMqe3U7PYYUcqf21XatKc6jv7zWcfIM0PEuXI=', 4, 'Nao', 'Licença Mensal', 152, 2, 1, 92, '2023-09-27 14:03:49', '2023-09-27 14:03:49', NULL),
	(93, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'Mutue Negócio Teste Mobile', '999999999', '999999999', '1', 'mutuemobile@gmail.com', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 2, 'FACTURA', 'N', NULL, 0, '391102995', '391102995', 37, 'FT MUT2023/37', 'A4', 'aF0x1tNKfOIBI8hOdHpispR7a4MMUYDE9ROEt/BB+Bxq7IhAAgJPC0ModPsmnUXmEbkYtbwaqqb9dolAGbjL9bFWZKdZKDndI7bFarb3OTSegCtbH0/Zjw92WqXfbsKRjP8YmF5qunSsa+1cFlXRePKvpHx4YW91i7crBMUJtk0=', 3, 'Nao', 'Licença Mensal', 38, 2, 1, 1, '2023-09-27 14:53:55', '2023-09-27 14:53:55', NULL),
	(94, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 15162, 0, 'ZUN', '923298581', '500002588882', '1', 'mauro3francisco@gmail.com', 'luanda', 1, 3, 'FACTURA', 'N', NULL, 0, NULL, '104412509', 38, 'FT MUT2023/38', 'A4', 'KBWpcWFo34KVQyfufuaHiGpRnKEZWzTjFZmoLzkfyp8Ho6rzhuprw3PeY6tFTk8Y8LkFpe/jPrTJD0JnNXMHMnBG+9c68Di0+/dw3g4bez/YZYRkFZn0LPaR7S3tCgypShrzBUQHH1diiA7TCfLObXGLlhtH+ke57XkRS3xorJE=', NULL, 'Nao', 'LICENÇA ANUAL', 156, 2, 1, 702, '2023-10-10 08:47:47', '2023-10-10 08:47:47', '2023-10-25'),
	(95, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 15162, 0, 'ZUN', '923298581', '500002588882', '1', 'mauro3francisco@gmail.com', 'luanda', 1, 3, 'FACTURA', 'N', NULL, 0, NULL, '922879301', 39, 'FT MUT2023/39', 'A4', 'Dv7gu7Vg5N717U5c1EK9GDnIF/TEW8pNVMW3LYmfsmTgQwS5VqUjl5btA9IX7JSpkAooaSKS2cCiV+SmK+NZ2RrYpCcuiSVjlmfd5XrWjXHfb9A+z5NllH1N9Xt5atpInSJEqE+ZzmOAmD/mWySIuXaa8e9179Whl3s4E9qn1FY=', NULL, 'Nao', 'LICENÇA ANUAL', 156, 2, 1, 702, '2023-10-10 08:51:29', '2023-10-10 08:51:29', '2023-10-25'),
	(96, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 15162, 0, 'MAPWELA EMPRENDIMENTOS, LIMITADA', '923066004', '5000988600', '2', 'mapwela.geral@gmail.com', 'Benfica Zona Verde,', 1, 3, 'FACTURA', 'N', NULL, 0, NULL, '439861206', 40, 'FT MUT2023/40', 'A4', 'p49XzggS+mjmMBE3db9bRsa5lyXCnSS5/ex5he1ptOnaFzbB1n01HNYjidKJH3D33iSn9iwxf55SptX+ukMxiHNTZm6b5DaavtjTBnIUiABvNjI/mb0ME2y+gRQMiIltUjNC5RuuKgpTuH133cWYDLP3OUElln8Rfs2Roz/ZRSQ=', NULL, 'Nao', 'LICENÇA ANUAL', 157, 2, 1, 703, '2023-10-10 09:35:17', '2023-10-10 09:56:35', '2023-10-25'),
	(97, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', '938294568', '5001599917', '1', 'panpanflora873@gmail.com', 'Estrada de Catete', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '395067794', 41, 'FT MUT2023/41', 'A4', 'rmsEazhMxPY9sHxwBVagmVh8MCZu29mG3ZaNwAErO/uI07A0S94a1qCL2WzWTga0YUpJSMzTTsYa7F6nIPnfC/gVP7ziPHVw5fyyRAFokN0mHgh9KYNyEsGo3p3K6UNKTO60UdZpx0/vdrCRh+ULylXmTsluVmUjuH7tXx0Z0K0=', NULL, 'Nao', 'LICENÇA MENSAL', 152, 2, 1, 693, '2023-10-31 16:21:54', '2023-10-31 16:21:54', '2023-11-15'),
	(98, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', '938294568', '5001599917', '1', 'panpanflora873@gmail.com', 'Estrada de Catete', 1, 2, 'FACTURA', 'N', NULL, 0, '459175722', '459175722', 42, 'FT MUT2023/42', 'A4', 'MCzsQ5oDqHNy9GHmfTFBrjnUG40GiMOzBkSa46Eor3nprUaaYI6BWHRvdNrAXQaSw+RDoDANU2aimK9oPyUJ80egn2X27301rRmeulwt43Tki/1GtfzO8DYRKMtCuj9sKfh8+m6Z28grYopv36Sd1hNYG9QZy/P9Kuf91LN2Qxk=', 4, 'Nao', 'Licença Mensal', 152, 2, 1, 88, '2023-10-31 18:19:42', '2023-10-31 18:19:42', NULL),
	(99, 108300, 0, 93138, 108300, 108300, 0, 'cento e oito mil e trezentos', 1, 0, 15162, 0, 'JOESCA - COMÉRCIO E PRESTAÇÃO DE SERVIÇOS, LDA', '924744585', '5000740225', '1', 'carvalhojose185@gmail.com', 'CAZENGA, TRAVESSA MAYA LOUREIRO 3.', 1, 3, 'FACTURA', 'N', NULL, 0, '401522078', '401522078', 43, 'FT MUT2023/43', 'A4', 'j1cGrGC/O+V1XfiZ2mPpSkZH0/JYjuz+g9QyJDVJ93NX+mV7JjI/sQJfqzgE0uXP+EHZCYRlPeieqadyjQAWC9r8b3vZWmsQbwgmDT8rMpEjA6bKBss1nfFsIS8QN3fXXcjs18+Cu3dnigVm5nMKudzeP7P8oQiexhR6xbpDdmo=', 4, 'Nao', 'Licença Anual', 149, 2, 1, 88, '2023-11-15 16:50:43', '2023-11-15 16:50:43', NULL),
	(100, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'OFICINA AUTO MXN', '923498707', '5001699962', '1', 'fboficina2019@gmail.com', 'Rua direita do BFA, bairro kifica-talatona', 1, 2, 'FACTURA', 'N', NULL, 0, '264105832', '264105832', 44, 'FT MUT2023/44', 'A4', 'aIhePFSydD/8wMLpye0NhTpd6Z8pkBpG0PHNzSQJHo8UF2oO7/15hw9gGKE8CIyivN/pVJQLTGspwGBV7Slv3zmEHkd322CH5H9kseQBceJiA6vpTiC3hYIW8xqGalU+KFlKmeT9PVMvGNNRKDQm9QqyWozYpQnt3b+b/gCk55w=', 3, 'Nao', 'Licença Mensal', 159, 2, 1, 88, '2023-11-18 12:19:21', '2023-11-18 12:19:21', NULL),
	(101, 54150, 0, 9025, 54150, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 7581, 0, 'OFICINA AUTO MXN', '923498707', '5001699962', '1', 'fboficina2019@gmail.com', 'Rua direita do BFA, bairro kifica-talatona', 1, 2, 'FACTURA', 'N', NULL, 0, '038379236', '038379236', 45, 'FT MUT2023/45', 'A4', 'lqAryoSesV5sGqxVmEBeYc75z3UbYPB/fU+bvLNr1tpCjvGqwLSmMOPCbpiih5beYV4loJJ/fr1Up5S4qMxBzoakkbkG1p9blvtlTxaETLYanuYwPLtXU0R4cl+GdR76Rx9CSbzwnFrmpnxZ5vtH/DMA25stN8Rewa/SKa4nmNs=', 3, 'Nao', 'Licença Mensal', 159, 2, 1, 88, '2023-11-18 12:20:41', '2023-11-18 12:20:41', NULL),
	(105, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', '924328285', '5000620092', '2', 'geral.mvbb@gmail.com', 'AVENIDA MURTALA MOHAMED - BAIRRO ILHA DO CABO, N 6 MUNICIPIO LUANDA', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '013942361', 46, 'FT MUT2023/46', 'A4', 'ZUHvHuUqRgfST7I3chTFYGsQV7QYRE/YajS5O17oeHXhtOF9T4eIwZ5nBtwKS1xtVHTu/EgGA53OkBfQgZHC0invMnS7UbqIHe/fMefek4X0yI4LJgCYqa91giNyT58DUt1I8rAbKZ88B7sftYgOJXRck1HzU8zo4iS3km6i+Ws=', NULL, 'Nao', 'LICENÇA MENSAL', 160, 2, 1, 731, '2023-11-22 13:59:51', '2023-11-23 15:58:09', '2023-12-07'),
	(106, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', '938294568', '5001599917', '2', 'panpanflora873@gmail.com', 'Estrada de Catete', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '659733416', 47, 'FT MUT2023/47', 'A4', 'qtezXb6GAmCLmnDzss4Y8YDquRc4Hb1pqiJ54kvbKl2u/PR0xaUz6c509BUzs46EAmsuWNYMIiZ0JXMrsBnsdCvxAaqsFT/cALMLu0M08jRqH99KRUthv2d+O4y8fWMcYMtX8eEQQPPfrL7rSyPNeZwXq9ew2fO1WzI6ungdzvY=', NULL, 'Nao', 'LICENÇA MENSAL', 152, 2, 1, 693, '2023-12-01 13:06:02', '2023-12-01 14:06:36', '2023-12-16'),
	(107, 9025, 0, 7761.5, 9025, 9025, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'RAJAK - Comércio Geral, LDA', '924415938', '5601019282', '1', 'seguranrajak18@gmail.com', 'Cacuaco, Estrada Nacional', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '033519844', 48, 'FT MUT2023/48', 'A4', 'atL/AzM6fMIurj7Op1jY4Vx3O9D3sNJltdStgFQ2vD6d5TEIR1NDuBhOlsWVoVv4rJd+1x5ZKerkVzPr1NYk+Rj9HOrNwu+P6+FwVEuzMnsafcy8vsiEBR4wz+hIlI/g+mwwyHVgb4qQTmb/LR0VdLiQdfaa2FDONwJ+hFBY16Q=', NULL, 'Nao', 'LICENÇA MENSAL', 161, 2, 1, 733, '2023-12-18 08:29:10', '2023-12-18 08:29:10', '2024-01-02'),
	(108, 9025, 0, 7761.5, 9025, NULL, 0, 'nove mil e vinte e cinco', 1, 0, 1263.5, 0, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', '938294568', '5001599917', '2', 'panpanflora873@gmail.com', 'Estrada de Catete', 1, 2, 'FACTURA', 'N', NULL, 0, NULL, '061211548', 1, 'FT MUT2024/1', 'A4', 'urxztY/DnRhNy3L/OyNx6LvH5BnkCNN7SGPMAoKj3FwXPBll0LZPf9L3EAYX2QIvE0rBz0NJW8Q4RlAJw0JLTTap45kRPj38zDrl7beywn6L8A9Ajf/EgnMpG/LHZNe/E1mrv1ETKizOoU/n9wanNCO/YG0J64QabxA1krDzwbU=', NULL, 'Nao', 'LICENÇA MENSAL', 152, 2, 1, 693, '2024-01-01 15:27:00', '2024-01-02 13:20:53', '2024-01-16');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.facturas_users_adicionais
CREATE TABLE IF NOT EXISTS `facturas_users_adicionais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_preco_factura` double NOT NULL DEFAULT '0',
  `troco` double NOT NULL DEFAULT '0',
  `valor_entregue` double NOT NULL DEFAULT '0',
  `valor_a_pagar` double NOT NULL DEFAULT '0',
  `desconto` int(11) NOT NULL DEFAULT '0',
  `retencao` int(11) NOT NULL DEFAULT '0',
  `total_iva` int(11) NOT NULL DEFAULT '0',
  `nome_do_cliente` varchar(255) NOT NULL,
  `valor_extenso` varchar(255) NOT NULL,
  `telefone_cliente` varchar(255) NOT NULL,
  `endereco_cliente` varchar(255) NOT NULL,
  `nif_cliente` varchar(255) NOT NULL,
  `observacao` text,
  `email_cliente` varchar(255) NOT NULL,
  `statusFactura` int(11) NOT NULL DEFAULT '1' COMMENT '1=>divida; 2=>Pago',
  `numeracaoFactura` varchar(50) NOT NULL,
  `hashValor` varchar(250) NOT NULL,
  `text_hash` varchar(250) NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `canal_id` int(11) NOT NULL DEFAULT '2',
  `licenca_id` int(11) NOT NULL,
  `valor_licenca` int(11) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `operador` varchar(250) NOT NULL,
  `user_id_adicionado` int(11) NOT NULL,
  `nome_utilizador_adicionado` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_vencimento` date NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_facturas_users_adicionais_empresas` (`empresa_id`),
  CONSTRAINT `FK_facturas_users_adicionais_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.facturas_users_adicionais: ~20 rows (aproximadamente)
INSERT INTO `facturas_users_adicionais` (`id`, `total_preco_factura`, `troco`, `valor_entregue`, `valor_a_pagar`, `desconto`, `retencao`, `total_iva`, `nome_do_cliente`, `valor_extenso`, `telefone_cliente`, `endereco_cliente`, `nif_cliente`, `observacao`, `email_cliente`, `statusFactura`, `numeracaoFactura`, `hashValor`, `text_hash`, `empresa_id`, `canal_id`, `licenca_id`, `valor_licenca`, `status_id`, `user_id`, `operador`, `user_id_adicionado`, `nome_utilizador_adicionado`, `created_at`, `data_vencimento`, `updated_at`) VALUES
	(3, 43320, 0, 0, 43320, 0, 0, 0, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA.', 'quarenta e três mil e trezentos e vinte', '922969192', 'Rua Nossa senhora da Muxima, nº 10 - 8º andar', '5000977381', NULL, 'geral@mutue.net', 1, 'FT MUT2023/1', 'S+G0vbNpb6akSpWmZ7vIGcyU1ZoQL0Qh5oVFx8cT4TnD5bFyd+TadLI+olqJ/91Up93athBEuQpf/bcZbGqWW4JuaVzQ79rvLCxqpU61hKmOohYbTM3rANFKfhT38zk4lyGi7GTolfN7dC4/r3fpML+MWo4oP47tW+hhbd9R7vQ=', '2023-07-08;2023-07-08T10:30:45;FT MUT2023/1;43320.00;WZSAaWmls2Cpjh4c5GSg1FabIKbOwrFfsuxTpvFJod9pax7aDkzQeGtWovLA1WhMT4WcJnP3Mp+D19qLkvTnG0Z2nUV4Hc1XxmsXGzWYL+LFTCc+CyxXV/Kr6dRDsmpOGgSfTs2AkSt0Ow5yOfvrqfj0FTdbxjqv76cCc4fjgq0=', 133, 2, 4, 216600, 1, 638, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 680, 'BAPTISTA SILVESTRE EYALA ARTUR', '2023-07-08 10:30:45', '2023-07-23', '2023-07-08 10:30:45'),
	(5, 43320, 0, 0, 43320, 0, 0, 0, 'Mutue Negócio Teste Mobile', 'quarenta e três mil e trezentos e vinte', '999999999', 'Luanda', '999999999', NULL, 'mutuemobile@gmail.com', 1, 'FT MUT2023/1', 'WoavzxxZ3ATxMQW6uyZSUGMnOL3+okjZPJHwlilOwphqCSS+gcR8uNv7YBnWYUDaYG9eAx+ntJ6tYX4nQ+fIgD46f9kBXhEGTFX661dz+j484RZ+8XYf4QTOY/SnDQodV8697S57e6hEY2gdjJNZVKMPlV52QnAhQsN4If1Ip40=', '2023-07-20;2023-07-20T14:47:26;FT MUT2023/1;43320.00;X0R6ViS66CuOuSU4fksug/vqc1pskERdiDiL9zZGAi5KSMMhJEgn8wKVzy3GKmffbi74mb8fB0+ZoVmQAHtnm/CK+jqVaLJTbMtjzIthLYipqInBF16MqHuPpIb+X/U/ZNXz1qnL+XrR3SFfPBWUT2nN70LawJhr3jT9UWOlGDU=', 38, 2, 4, 216600, 1, 35, 'Mutue Negócio Teste Mobile', 683, 'BERNARDO GOMES', '2023-07-20 14:47:26', '2023-08-04', '2023-07-20 14:47:26'),
	(6, 43320, 0, 0, 43320, 0, 0, 0, 'Mutue Negócio Teste Mobile', 'quarenta e três mil e trezentos e vinte', '999999999', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '999999999', NULL, 'mutuemobile@gmail.com', 1, 'FT MUT2023/1', 'ItASLSnu07y0lnAM4kBAw2XEiiPn+l4MBldcg/8Q8Leo4OO7oMt3qgmBiiB/KVJX32xL5dgvlO80JBsvZgpWZ+FjNeiIX6fdrNx9UoZebGw5vG/rOLE7ZUmfQJT8idWUOEp1EYEbND/8YSfMmbpDOYWQMqqSt7dcnTx+pwK8sws=', '2023-07-27;2023-07-27T12:38:01;FT MUT2023/1;43320.00;WoavzxxZ3ATxMQW6uyZSUGMnOL3+okjZPJHwlilOwphqCSS+gcR8uNv7YBnWYUDaYG9eAx+ntJ6tYX4nQ+fIgD46f9kBXhEGTFX661dz+j484RZ+8XYf4QTOY/SnDQodV8697S57e6hEY2gdjJNZVKMPlV52QnAhQsN4If1Ip40=', 38, 2, 4, 216600, 1, 35, 'Mutue Negócio Teste Mobile', 684, 'BAPTISTATESTE', '2023-07-27 12:38:01', '2023-08-11', '2023-07-27 12:38:01'),
	(7, 43320, 0, 0, 43320, 0, 0, 0, 'Mutue Negócio Teste Mobile', 'quarenta e três mil e trezentos e vinte', '999999999', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '999999999', NULL, 'mutuemobile@gmail.com', 1, 'FT MUT2023/1', 'XKuNJ05w22aRpah3j4Nx29TASMqjcG4P1gpYE81WOUlTO+gT5Anftshu7Ew3Nxf+Xeq6iL5BLNVTpuDAy9Sy4GOvWJ5Hc+O9q/KfAehf3R2VDuPt4PbqroKSFMlZ7EwMglvMRYvcYScfgP/TykGQMOfE0FLkA5cY+Z4BUzCfWvs=', '2023-07-27;2023-07-27T14:45:16;FT MUT2023/1;43320.00;ItASLSnu07y0lnAM4kBAw2XEiiPn+l4MBldcg/8Q8Leo4OO7oMt3qgmBiiB/KVJX32xL5dgvlO80JBsvZgpWZ+FjNeiIX6fdrNx9UoZebGw5vG/rOLE7ZUmfQJT8idWUOEp1EYEbND/8YSfMmbpDOYWQMqqSt7dcnTx+pwK8sws=', 38, 2, 4, 216600, 1, 35, 'Mutue Negócio Teste Mobile', 685, 'BAPTISTA', '2023-07-27 14:45:16', '2023-08-11', '2023-07-27 14:45:16'),
	(8, 43320, 0, 0, 43320, 0, 0, 0, 'Mutue Negócio Teste Mobile', 'quarenta e três mil e trezentos e vinte', '999999999', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '999999999', NULL, 'mutuemobile@gmail.com', 1, 'FT MUT2023/1', 'UUFRjRVGGZOs4I2Cm3FFFx78rhOmzJQr9kLnlSnl+aT3dB0yN2qpX/PYQzZEvMQppB73f2Zsgj0vjH6/vYRFgIvr7wK7T1j44zNZ2DKGFVXCAlQm7RTHCnRYsrOShwWrRk4J/H7m6kf3jWeIuiSaWJgG7yjwBLhTwuWQxyHkbaY=', '2023-07-27;2023-07-27T15:51:17;FT MUT2023/1;43320.00;XKuNJ05w22aRpah3j4Nx29TASMqjcG4P1gpYE81WOUlTO+gT5Anftshu7Ew3Nxf+Xeq6iL5BLNVTpuDAy9Sy4GOvWJ5Hc+O9q/KfAehf3R2VDuPt4PbqroKSFMlZ7EwMglvMRYvcYScfgP/TykGQMOfE0FLkA5cY+Z4BUzCfWvs=', 38, 2, 4, 216600, 1, 35, 'Mutue Negócio Teste Mobile', 686, 'BAPTISTA SILVESTRE EYALA ARTUR11', '2023-07-27 15:51:17', '2023-08-11', '2023-07-27 15:51:17'),
	(9, 43320, 0, 0, 43320, 0, 0, 0, 'Mutue Negócio Teste Mobile', 'quarenta e três mil e trezentos e vinte', '999999999', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '999999999', NULL, 'mutuemobile@gmail.com', 1, 'FT MUT2023/1', 'ZSBuyncycokwwRnaeS356/ud/GpNRKcSMJHvk6uNzjSXUtZJhyT6DRinxnwlsPaLKiKwj0MbpdjcEysEDEwxBsPyb2P0FUMzF1tmewTCweDF0iiKclDAduIV4jg2FLLWyYn6khfZ6xEvDbEDuU8tDAFn0qm/I3AHLNslFNHUJQU=', '2023-07-27;2023-07-27T16:42:37;FT MUT2023/1;43320.00;UUFRjRVGGZOs4I2Cm3FFFx78rhOmzJQr9kLnlSnl+aT3dB0yN2qpX/PYQzZEvMQppB73f2Zsgj0vjH6/vYRFgIvr7wK7T1j44zNZ2DKGFVXCAlQm7RTHCnRYsrOShwWrRk4J/H7m6kf3jWeIuiSaWJgG7yjwBLhTwuWQxyHkbaY=', 38, 2, 4, 216600, 1, 35, 'Mutue Negócio Teste Mobile', 687, 'BAPTISTA SILVESTRE EYALA ARTUR', '2023-07-27 16:42:37', '2023-08-11', '2023-07-27 16:42:37'),
	(10, 43320, 0, 0, 43320, 0, 0, 0, 'Mutue Negócio Teste Mobile', 'quarenta e três mil e trezentos e vinte', '999999999', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '999999999', NULL, 'mutuemobile@gmail.com', 1, 'FT MUT2023/1', 'Dx3PEhiBO5i9WeEevjuXH7xhrsljvQea1L+WWga24GP7kFER/Ni9KBlhFzTFa50s6nf5m1iSfU6aleJrNjhs2pyJGa00BcUvPRzwoFpdXd5/KvQNZXFpqre5BCO/YlAYesF4NL55qxpJRLznMbPsb42tj3L2yGwc8e96kspgcjM=', '2023-07-28;2023-07-28T16:32:38;FT MUT2023/1;43320.00;ZSBuyncycokwwRnaeS356/ud/GpNRKcSMJHvk6uNzjSXUtZJhyT6DRinxnwlsPaLKiKwj0MbpdjcEysEDEwxBsPyb2P0FUMzF1tmewTCweDF0iiKclDAduIV4jg2FLLWyYn6khfZ6xEvDbEDuU8tDAFn0qm/I3AHLNslFNHUJQU=', 38, 2, 4, 216600, 1, 35, 'Mutue Negócio Teste Mobile', 688, 'BATI', '2023-07-28 16:32:38', '2023-08-12', '2023-07-28 16:32:38'),
	(11, 43320, 0, 0, 43320, 0, 0, 0, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA.', 'quarenta e três mil e trezentos e vinte', '922969192', 'Rua Nossa senhora da Muxima, nº 10 - 8º andar', '5000977381', NULL, 'geral@mutue.net', 1, 'FT MUT2023/1', 'J5RHXr9/eja6EBqFywmjiu9NxLlQYkHlNbvvgkKV0w07PX18l9sweofToOGdtPk9J0N9Okt+tnAu/5M4vYXqTVOrNPEzQ+yWl07Xs4jQ+ZS+3nMQjKMQqLIwx7P0ZuLYbATJmUokoWqg/6quBebDQlc4vEL3Qds+ktk2rB1cj0E=', '2023-08-31;2023-08-31T19:42:21;FT MUT2023/1;43320.00;S+G0vbNpb6akSpWmZ7vIGcyU1ZoQL0Qh5oVFx8cT4TnD5bFyd+TadLI+olqJ/91Up93athBEuQpf/bcZbGqWW4JuaVzQ79rvLCxqpU61hKmOohYbTM3rANFKfhT38zk4lyGi7GTolfN7dC4/r3fpML+MWo4oP47tW+hhbd9R7vQ=', 133, 2, 4, 216600, 1, 673, 'Osvaldo Ramos', 689, 'TULEANY BAPTISTA VIEIRA', '2023-08-31 19:42:21', '2023-09-15', '2023-08-31 19:42:21'),
	(12, 0, 0, 0, 0, 0, 0, 0, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', 'zero', '938294568', 'Estrada de Catete', '5001599917', NULL, 'panpanflora873@gmail.com', 1, 'FT MUT2023/1', 'Op6p7GS2mt9Vfs1XLsXIN8YKQk5nS2Nl+Xq0SerDY6ntlo/nhtQA7U1M3ogNCzCiuN7U5Iq9fvR+nwYobz1ACaEF6n6q9Vvrvwt1SyT5otH4jMPI7wXNBavAJFiW9VJOfzPQqNYExGv+/K5Tp3Csa3Z0slKNtyWJK3Jqea/CNiw=', '2023-09-25;2023-09-25T17:32:26;FT MUT2023/1;0.00;', 152, 2, 1, 0, 1, 693, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', 696, 'JORGE DEIA ', '2023-09-25 17:32:26', '2023-10-10', '2023-09-25 17:32:26'),
	(13, 0, 0, 0, 0, 0, 0, 0, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', 'zero', '938294568', 'Estrada de Catete', '5001599917', NULL, 'panpanflora873@gmail.com', 1, 'FT MUT2023/1', 'logZH5PB/dpewrCdF33KtcjVSfVwGAmDOSGlqFw2eqOooPOn9cPWAa+j5nfYo77UJIHKyly3aj3RBQi1Te24ntTTUncnhJ8Mlh1Pffbxaa67v/SdxhHbm+8ZIZNauTd9Ls2RYtp25/DiKE874oSmNMHhtQZbumURggPMw/PiJ4o=', '2023-09-25;2023-09-25T22:01:56;FT MUT2023/1;0.00;Op6p7GS2mt9Vfs1XLsXIN8YKQk5nS2Nl+Xq0SerDY6ntlo/nhtQA7U1M3ogNCzCiuN7U5Iq9fvR+nwYobz1ACaEF6n6q9Vvrvwt1SyT5otH4jMPI7wXNBavAJFiW9VJOfzPQqNYExGv+/K5Tp3Csa3Z0slKNtyWJK3Jqea/CNiw=', 152, 2, 1, 0, 1, 693, 'FLOVAL NOSSA - COMÉRCIO E SERVIÇOS(SU), LDA', 697, 'MARIA ALBERTO', '2023-09-25 22:01:56', '2023-10-10', '2023-09-25 22:01:56'),
	(15, 43320, 0, 0, 43320, 0, 0, 0, 'Mutue Negócio Teste Mobile', 'quarenta e três mil e trezentos e vinte', '999999999', 'Luandaaaaaaaa546456aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '999999999', NULL, 'mutuemobile@gmail.com', 1, 'FT MUT2023/1', 'b8TMzp94byF8h9ECbAoeliZlgxNNxSvUF3nUHzu+YcBjcuAx36y8kVvAcY9+NfJcXg48Qd3Cq8bRfQCb9MSz5PDQgTVHHkxaeF+XAXVbsOptFocplxtqyAFfGULBe2pbXiSYFdbzRt/u5mNVf68f32lTfMq5XDNdZ5ElQOFS8n8=', '2023-09-29;2023-09-29T15:23:56;FT MUT2023/1;43320.00;haRuzHDW3sR9jGIvHaz6F48asoOZzVH4RSpjS1O48gU0MiQck5/ngH3jHWqyoQ7f93rfa5vq9XQDcARMsXaORe6CTpJ8nuhUHF3UlGaoYX0WR7Kf71b4ivbMsSiEl5N797+TKAXkCAjqq7AnXStioyml3mHIrq4nk9zjr37mLHg=', 38, 2, 4, 216600, 1, 35, 'Mutue Negócio Teste Mobile', 699, 'SILVESTRE TESTE', '2023-09-29 15:23:56', '2023-10-14', '2023-09-29 15:23:56'),
	(16, 43320, 0, 0, 43320, 0, 0, 0, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA.', 'quarenta e três mil trezentos e vinte', '922969192', 'Rua Nossa senhora da Muxima, nº 10 - 8º andar', '5000977381', NULL, 'geral@mutue.net', 1, 'FT MUT2023/1', 'bJM1u86mEhJ+zmPs5z7FL2OphzI3mc3/LzeZnmV+nSsMLW5oZoAqt+wlO0Xy/mVyRuJ+F/+lwMLzL35i9LpvUhzQDg2lTfQ6wSOP631RxGyQ17jnRtrWp/2JCE7IVzfhQVWTf+fXYZGdOGBbiWhnrwgAPU4eUzsJev+h0wgyxVo=', '2023-11-08;2023-11-08T12:00:17;FT MUT2023/1;43320.00;J5RHXr9/eja6EBqFywmjiu9NxLlQYkHlNbvvgkKV0w07PX18l9sweofToOGdtPk9J0N9Okt+tnAu/5M4vYXqTVOrNPEzQ+yWl07Xs4jQ+ZS+3nMQjKMQqLIwx7P0ZuLYbATJmUokoWqg/6quBebDQlc4vEL3Qds+ktk2rB1cj0E=', 133, 2, 4, 216600, 1, 638, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 724, 'JOÃO LOURENÇO', '2023-11-08 12:00:17', '2023-11-23', '2023-11-08 12:00:17'),
	(17, 43320, 0, 0, 43320, 0, 0, 0, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA.', 'quarenta e três mil trezentos e vinte', '922969192', 'Rua Nossa senhora da Muxima, nº 10 - 8º andar', '5000977381', NULL, 'geral@mutue.net', 1, 'FT MUT2023/1', 'hQwZsEnKCSvnm6WbjXc75tJWm115YwiJ1JsoX7RIJN7YBuvE9v2YERNzDAJTw9vzXO8CcRfe0uyXUSbtiEjD8fbXxXH09AiWYPBl5zV/N7AqeOGn7VCAiMzJuNxRNagaWqsSYJRvmzjg2jGw8PnoacHu/cF/sLzDKCMtM4YYm5s=', '2023-11-08;2023-11-08T12:01:07;FT MUT2023/1;43320.00;bJM1u86mEhJ+zmPs5z7FL2OphzI3mc3/LzeZnmV+nSsMLW5oZoAqt+wlO0Xy/mVyRuJ+F/+lwMLzL35i9LpvUhzQDg2lTfQ6wSOP631RxGyQ17jnRtrWp/2JCE7IVzfhQVWTf+fXYZGdOGBbiWhnrwgAPU4eUzsJev+h0wgyxVo=', 133, 2, 4, 216600, 1, 638, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 725, 'EMERSON', '2023-11-08 12:01:07', '2023-11-23', '2023-11-08 12:01:07'),
	(18, 1805, 0, 0, 1805, 0, 0, 0, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 'mil oitocentos e cinco', '949943449', 'AVENIDA MURTALA MOHAMED - BAIRRO ILHA DO CABO, N 6 MUNICIPIO LUANDA', '5000620092', NULL, 'geral.mvbb@gmail.com', 1, 'FT MUT2023/1', 'pd0WsxauJ71jVlUsRrXNt3PGD9WDJOB6Mmb3/1Ygx0tjndCpaqgNtKtdp3AufFfb7zdbb8wsZwxOb6HL2gxmjthcklujmQDg3Oq/zvizk9jxmbDgFBrUV+Ga+uo5ftvgywE7+Eb0vjSwnenrGtDfVGMcHQypIpsdQpId8pYvu1g=', '2023-11-30;2023-11-30T20:28:53;FT MUT2023/1;1805.00;', 160, 2, 2, 9025, 1, 731, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 735, 'PAULA MILENA DO NASCIMENTO DIOGO ', '2023-11-30 20:28:53', '2023-12-15', '2023-11-30 20:28:53'),
	(19, 1805, 0, 0, 1805, 0, 0, 0, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 'mil oitocentos e cinco', '949943449', 'AVENIDA MURTALA MOHAMED - BAIRRO ILHA DO CABO, N 6 MUNICIPIO LUANDA', '5000620092', NULL, 'geral.mvbb@gmail.com', 1, 'FT MUT2023/1', 't9VoLaMQKHOFGh54cCmISEPmVdWyOW9199eJ9hU1xJUH8CsAC+6g0wKeLilR8I3b1MKxWqQ0QIXG22VYYvNAjSuQect54dJw9BvV31rv/YxWbALw0UX2QfQMJtaC4SWXTklls8CWh9/ZeMdLnaXwoTFPJURMIogx3nl1h1jX4m4=', '2023-12-01;2023-12-01T13:35:43;FT MUT2023/1;1805.00;pd0WsxauJ71jVlUsRrXNt3PGD9WDJOB6Mmb3/1Ygx0tjndCpaqgNtKtdp3AufFfb7zdbb8wsZwxOb6HL2gxmjthcklujmQDg3Oq/zvizk9jxmbDgFBrUV+Ga+uo5ftvgywE7+Eb0vjSwnenrGtDfVGMcHQypIpsdQpId8pYvu1g=', 160, 2, 2, 9025, 1, 731, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 736, 'MVBB KITANDINHA', '2023-12-01 13:35:43', '2023-12-16', '2023-12-01 13:35:43'),
	(20, 1805, 0, 0, 1805, 0, 0, 0, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 'mil oitocentos e cinco', '949943449', 'AVENIDA MURTALA MOHAMED - BAIRRO ILHA DO CABO, N 6 MUNICIPIO LUANDA', '5000620092', NULL, 'geral.mvbb@gmail.com', 1, 'FT MUT2023/1', 'eePJqWI/AkYhQ270Mwt/LUqJ4fwewJQ7o4vUTCOKES7Ui2HOX0E8MuBgoareNVqk3zhnu2ovo4d4pOof0jgqhBcXA/KC91QAbT1PH+bqg/xkXGAyp3sjlnGiwdmxSjqcNDKV04A9Y1RyX4divfAwv7SaPF7ciwsdDdcm1Peu6JI=', '2023-12-01;2023-12-01T13:41:02;FT MUT2023/1;1805.00;t9VoLaMQKHOFGh54cCmISEPmVdWyOW9199eJ9hU1xJUH8CsAC+6g0wKeLilR8I3b1MKxWqQ0QIXG22VYYvNAjSuQect54dJw9BvV31rv/YxWbALw0UX2QfQMJtaC4SWXTklls8CWh9/ZeMdLnaXwoTFPJURMIogx3nl1h1jX4m4=', 160, 2, 2, 9025, 1, 731, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 737, 'MVBB MULTIKIOSK', '2023-12-01 13:41:02', '2023-12-16', '2023-12-01 13:41:02'),
	(21, 43320, 0, 0, 43320, 0, 0, 0, 'Mutue Negócio Teste Mobile', 'quarenta e três mil trezentos e vinte', '999999999', 'Osvaldo Roberto Maier, 442', '999999999', NULL, 'mutuemobile@gmail.com', 1, 'FT MUT2023/1', 'Zaw4L1/xxZWKSP0o6Zs9bAzsqzFhW5vV9+0rZyulE8kai5DjOtUpycUJlFxyxyoOnt6JjpdaWSBjjWAegJdAJn235Lqhj016So/qq5SNn8HLD4Bb2xBbxTHM31z0xznUoOlk/nKAR8C8Tbzl/d/7FLwy7NvA1MxnHoUj7YK1TvU=', '2023-12-01;2023-12-01T15:49:29;FT MUT2023/1;43320.00;b8TMzp94byF8h9ECbAoeliZlgxNNxSvUF3nUHzu+YcBjcuAx36y8kVvAcY9+NfJcXg48Qd3Cq8bRfQCb9MSz5PDQgTVHHkxaeF+XAXVbsOptFocplxtqyAFfGULBe2pbXiSYFdbzRt/u5mNVf68f32lTfMq5XDNdZ5ElQOFS8n8=', 38, 2, 4, 216600, 1, 35, 'Mutue Negócio Teste Mobile', 738, 'MOBILE', '2023-12-01 15:49:29', '2023-12-16', '2023-12-01 15:49:29'),
	(22, 1805, 0, 0, 1805, 0, 0, 0, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 'mil oitocentos e cinco', '949943449', 'AVENIDA MURTALA MOHAMED - BAIRRO ILHA DO CABO, N 6 MUNICIPIO LUANDA', '5000620092', NULL, 'geral.mvbb@gmail.com', 1, 'FT MUT2023/1', 'lwsMDqbnYRJ4zJC1OicTq5gvnhABD5dfNUZPuotzvhrxjEIwzPKxN2uDSnK6PVbgMVlJK6PAswAUiKOQrC8oO57tV2z341Z0ES5a2JtcqlcVoIJR/6Uys2Anleb4ycI5BRB5LkJXl04COVSx+aDkkaJ6nm0PynE5xNlPpVpFefA=', '2023-12-04;2023-12-04T12:19:57;FT MUT2023/1;1805.00;eePJqWI/AkYhQ270Mwt/LUqJ4fwewJQ7o4vUTCOKES7Ui2HOX0E8MuBgoareNVqk3zhnu2ovo4d4pOof0jgqhBcXA/KC91QAbT1PH+bqg/xkXGAyp3sjlnGiwdmxSjqcNDKV04A9Y1RyX4divfAwv7SaPF7ciwsdDdcm1Peu6JI=', 160, 2, 2, 9025, 1, 731, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 739, 'MVBB KITANDINHA1', '2023-12-04 12:19:57', '2023-12-19', '2023-12-04 12:19:57'),
	(23, 1805, 0, 0, 1805, 0, 0, 0, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 'mil oitocentos e cinco', '949943449', 'AVENIDA MURTALA MOHAMED - BAIRRO ILHA DO CABO, N 6 MUNICIPIO LUANDA', '5000620092', NULL, 'geral.mvbb@gmail.com', 1, 'FT MUT2023/1', 'W1sFdJp6d7lrm3qEk4M0JCuSVrF7ypdkX1YuWJUZvp/I0JjjJTJrdq57eIWf/h40uZxSKKUXHQJZfLXYRSyQI872lYboQdj9MJ6tHzfXHY2+GhF0qjcd3KQuF5m0smgWnLqinPYBATmS8wEhEYU9JHkU+D8p9kqjLIS4EtQQI3A=', '2023-12-04;2023-12-04T12:37:01;FT MUT2023/1;1805.00;lwsMDqbnYRJ4zJC1OicTq5gvnhABD5dfNUZPuotzvhrxjEIwzPKxN2uDSnK6PVbgMVlJK6PAswAUiKOQrC8oO57tV2z341Z0ES5a2JtcqlcVoIJR/6Uys2Anleb4ycI5BRB5LkJXl04COVSx+aDkkaJ6nm0PynE5xNlPpVpFefA=', 160, 2, 2, 9025, 1, 731, 'M.V.B.B.- COMERCIO A RETALHO E PRESTAÇAO DE SERVIÇOS (SU),LDA', 740, 'LOJA CONSTRUÇÃO ', '2023-12-04 12:37:01', '2023-12-19', '2023-12-04 12:37:01'),
	(24, 43320, 0, 0, 43320, 0, 0, 0, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA.', 'quarenta e três mil trezentos e vinte', '922969192', 'Rua Nossa senhora da Muxima, nº 10 - 8º andar', '5000977381', NULL, 'geral@mutue.net', 1, 'FT MUT2023/1', 'o7IQJ4f5Sugpptzph+y5vu19ez4IH3IiUBlbWruAunzx61LFTNXH7wVRsVLBu4u+5CiOoqf7qJ9afcgVFTKW9VRqpByepUQ3kzXklYFU76PPmKA6VDV/NI641Q7Qn/sQfrbbvPS5zI3Gi/YpnpvzISUQh7+SqB5LOV6VwsjIazc=', '2023-12-07;2023-12-07T13:56:39;FT MUT2023/1;43320.00;hQwZsEnKCSvnm6WbjXc75tJWm115YwiJ1JsoX7RIJN7YBuvE9v2YERNzDAJTw9vzXO8CcRfe0uyXUSbtiEjD8fbXxXH09AiWYPBl5zV/N7AqeOGn7VCAiMzJuNxRNagaWqsSYJRvmzjg2jGw8PnoacHu/cF/sLzDKCMtM4YYm5s=', 133, 2, 4, 216600, 1, 638, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 742, 'ALEX CHIPUIA', '2023-12-07 13:56:39', '2023-12-22', '2023-12-07 13:56:39');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.factura_items
CREATE TABLE IF NOT EXISTS `factura_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao_produto` varchar(250) DEFAULT '0',
  `preco_produto` double NOT NULL DEFAULT '0',
  `quantidade_produto` int(10) unsigned NOT NULL,
  `total_preco_produto` double NOT NULL DEFAULT '0',
  `licenca_id` int(10) unsigned NOT NULL,
  `factura_id` int(10) unsigned NOT NULL,
  `desconto_produto` double DEFAULT '0',
  `retencao_produto` double DEFAULT '0',
  `incidencia_produto` double DEFAULT NULL,
  `iva_produto` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_factura_items_factura` (`factura_id`),
  KEY `FK_factura_items_licencas` (`licenca_id`),
  CONSTRAINT `FK_factura_items_factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `FK_factura_items_licencas` FOREIGN KEY (`licenca_id`) REFERENCES `licencas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.factura_items: ~51 rows (aproximadamente)
INSERT INTO `factura_items` (`id`, `descricao_produto`, `preco_produto`, `quantidade_produto`, `total_preco_produto`, `licenca_id`, `factura_id`, `desconto_produto`, `retencao_produto`, `incidencia_produto`, `iva_produto`) VALUES
	(15, 'LICEN?A DEFINITIVO', 100000, 1, 100000, 4, 25, 0, 0, 0, 0),
	(16, 'LICEN?A MENSAL', 10000, 1, 10000, 2, 26, 0, 0, 0, 0),
	(42, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 52, 0, 0, 9025, 0),
	(45, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 55, 0, 0, 9025, 0),
	(49, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 59, 0, 0, 9025, 0),
	(50, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 60, 0, 0, 9025, 0),
	(51, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 61, 0, 0, 9025, 0),
	(52, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 62, 0, 0, 9025, 0),
	(53, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 63, 0, 0, 9025, 0),
	(54, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 64, 0, 0, 9025, 0),
	(55, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 65, 0, 0, 9025, 0),
	(56, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 66, 0, 0, 108300, 0),
	(57, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 67, 0, 0, 9025, 0),
	(58, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 68, 0, 0, 108300, 0),
	(59, 'LICENÇA DEFINITIVO', 216600, 1, 216600, 4, 69, 0, 0, 216600, 0),
	(60, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 70, 0, 0, 9025, 0),
	(61, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 71, 0, 0, 108300, 0),
	(62, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 72, 0, 0, 9025, 0),
	(63, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 73, 0, 0, 108300, 0),
	(64, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 74, 0, 0, 9025, 0),
	(65, 'LICENÇA DEFINITIVA', 216600, 1, 216600, 4, 75, 0, 0, 216600, 0),
	(66, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 76, 0, 0, 9025, 1263.5),
	(67, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 77, 0, 0, 9025, 1263.5),
	(68, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 78, 0, 0, 9025, 1263.5),
	(69, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 79, 0, 0, 9025, 1263.5),
	(70, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 80, 0, 0, 108300, 15162),
	(71, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 81, 0, 0, 108300, 15162),
	(72, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 82, 0, 0, 9025, 1263.5),
	(73, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 83, 0, 0, 9025, 1263.5),
	(74, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 84, 0, 0, 9025, 1263.5),
	(75, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 85, 0, 0, 9025, 1263.5),
	(76, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 86, 0, 0, 9025, 1263.5),
	(77, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 87, 0, 0, 9025, 1263.5),
	(78, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 88, 0, 0, 9025, 1263.5),
	(79, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 89, 0, 0, 9025, 1263.5),
	(80, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 90, 0, 0, 9025, 1263.5),
	(81, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 91, 0, 0, 9025, 1263.5),
	(82, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 92, 0, 0, 9025, 1263.5),
	(83, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 93, 0, 0, 9025, 1263.5),
	(84, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 94, 0, 0, 108300, 15162),
	(85, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 95, 0, 0, 108300, 15162),
	(86, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 96, 0, 0, 108300, 15162),
	(87, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 97, 0, 0, 9025, 1263.5),
	(88, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 98, 0, 0, 9025, 1263.5),
	(89, 'LICENÇA ANUAL', 108300, 1, 108300, 3, 99, 0, 0, 108300, 15162),
	(90, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 100, 0, 0, 9025, 1263.5),
	(91, 'LICENÇA MENSAL', 9025, 6, 9025, 2, 101, 0, 0, 9025, 1263.5),
	(95, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 105, 0, 0, 9025, 1263.5),
	(96, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 106, 0, 0, 9025, 1263.5),
	(97, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 107, 0, 0, 9025, 1263.5),
	(98, 'LICENÇA MENSAL', 9025, 1, 9025, 2, 108, 0, 0, 9025, 1263.5);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.failed_jobs: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.formas_pagamentos
CREATE TABLE IF NOT EXISTS `formas_pagamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.formas_pagamentos: ~4 rows (aproximadamente)
INSERT INTO `formas_pagamentos` (`id`, `descricao`) VALUES
	(1, 'TPA'),
	(2, 'DEPÓSITO'),
	(3, 'TRANSFERÊNCIA'),
	(4, 'MULTICAIXA');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.gestor_clientes
CREATE TABLE IF NOT EXISTS `gestor_clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(145) NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_gestor_clientes_status_gerais` (`status_id`),
  KEY `FK_gestor_clientes_canais_comunicacoes` (`canal_id`),
  KEY `FK_gestor_clientes_users` (`user_id`),
  CONSTRAINT `FK_gestor_clientes_canais_comunicacoes` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_gestor_clientes_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_gestor_clientes_users` FOREIGN KEY (`user_id`) REFERENCES `users_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.gestor_clientes: ~0 rows (aproximadamente)
INSERT INTO `gestor_clientes` (`id`, `nome`, `status_id`, `canal_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'RAMOSSOFT TECNOLOGIAS LDA', 1, 3, 1, '2020-05-17 16:50:14', '2020-05-17 16:50:15');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.idiomas
CREATE TABLE IF NOT EXISTS `idiomas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.idiomas: ~2 rows (aproximadamente)
INSERT INTO `idiomas` (`id`, `designacao`) VALUES
	(1, 'Portugues'),
	(2, 'Inglês');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.jobs
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.jobs: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.licencas
CREATE TABLE IF NOT EXISTS `licencas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_licenca_id` int(10) unsigned NOT NULL,
  `designacao` varchar(345) NOT NULL,
  `uuid` varchar(345) DEFAULT NULL,
  `status_licenca_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `canal_id` int(10) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `descricao` text,
  `valor` double NOT NULL,
  `tipo_taxa_id` int(11) unsigned NOT NULL,
  `limite_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_licencas_tipo` (`tipo_licenca_id`),
  KEY `FK_licencas_status` (`status_licenca_id`),
  KEY `FK_licencas_canal` (`canal_id`),
  KEY `FK_licencas_users` (`user_id`),
  KEY `FK_licencas_tipotaxa` (`tipo_taxa_id`),
  CONSTRAINT `FK_licencas_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_licencas_status_gerais` FOREIGN KEY (`status_licenca_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_licencas_tipo` FOREIGN KEY (`tipo_licenca_id`) REFERENCES `tipos_licencas` (`id`),
  CONSTRAINT `FK_licencas_tipotaxa` FOREIGN KEY (`tipo_taxa_id`) REFERENCES `tipotaxa` (`codigo`),
  CONSTRAINT `FK_licencas_users` FOREIGN KEY (`user_id`) REFERENCES `users_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.licencas: ~4 rows (aproximadamente)
INSERT INTO `licencas` (`id`, `tipo_licenca_id`, `designacao`, `uuid`, `status_licenca_id`, `created_at`, `updated_at`, `canal_id`, `user_id`, `descricao`, `valor`, `tipo_taxa_id`, `limite_usuario`) VALUES
	(1, 1, 'Grátis', NULL, 1, '2021-01-31 12:37:11', '2021-01-31 15:52:37', 3, 1, 'Plano Grátis', 0, 2, 2),
	(2, 2, 'Mensal', NULL, 1, '2021-01-31 12:38:02', '2021-01-31 15:49:18', 3, 1, 'Plano Mensal', 9025, 2, 2),
	(3, 3, 'Anual', NULL, 1, '2021-01-31 12:38:41', '2021-04-28 15:23:10', 3, 1, 'Plano Anual', 108300, 2, 2),
	(4, 4, 'Definitivo', NULL, 1, '2021-01-31 13:16:17', '2021-01-31 15:50:11', 3, 1, 'Plano Definitivo', 216600, 2, 2);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.licenca_empresa
CREATE TABLE IF NOT EXISTS `licenca_empresa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `licenca_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `valor` double unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_licenca_empresa_licencas` (`licenca_id`),
  KEY `FK_licenca_empresa_empresas` (`empresa_id`),
  CONSTRAINT `FK_licenca_empresa_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_licenca_empresa_licencas` FOREIGN KEY (`licenca_id`) REFERENCES `licencas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.licenca_empresa: ~45 rows (aproximadamente)
INSERT INTO `licenca_empresa` (`id`, `licenca_id`, `empresa_id`, `valor`) VALUES
	(5, 1, 38, 0),
	(6, 2, 38, 100000),
	(7, 3, 38, 500000),
	(8, 4, 38, 1000000),
	(9, 1, 1, 0),
	(10, 2, 1, 10000),
	(11, 3, 1, 50000),
	(12, 4, 1, 100000),
	(13, 1, 33, 0),
	(14, 2, 33, 10000),
	(15, 3, 33, 50000),
	(16, 4, 33, 100000),
	(17, 1, 35, 0),
	(18, 2, 35, 10000),
	(19, 3, 35, 50000),
	(20, 4, 35, 100000),
	(153, 1, 99, 0),
	(154, 2, 99, 10000),
	(155, 3, 99, 50000),
	(156, 4, 99, 100000),
	(193, 1, 109, 0),
	(241, 1, 122, 0),
	(242, 2, 122, 10000),
	(243, 3, 122, 50000),
	(244, 4, 122, 100000),
	(245, 1, 127, 0),
	(246, 2, 127, 10000),
	(247, 3, 127, 50000),
	(248, 4, 127, 100000),
	(289, 1, 133, 0),
	(290, 2, 133, 10000),
	(291, 3, 133, 50000),
	(292, 4, 133, 100000),
	(302, 1, 140, 0),
	(303, 2, 140, 10000),
	(304, 3, 140, 50000),
	(305, 4, 140, 100000),
	(306, 1, 141, 0),
	(307, 2, 141, 10000),
	(308, 3, 141, 50000),
	(309, 4, 141, 100000),
	(314, 1, 143, 0),
	(315, 2, 143, 10000),
	(316, 3, 143, 50000),
	(317, 4, 143, 100000);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.logsupdatepassword
CREATE TABLE IF NOT EXISTS `logsupdatepassword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.logsupdatepassword: ~2 rows (aproximadamente)
INSERT INTO `logsupdatepassword` (`id`, `empresa_id`, `users_id`, `created_at`, `updated_at`, `password`) VALUES
	(2, 38, 1, '2024-01-05 10:48:58', '2024-01-05 10:48:58', 'mutue123'),
	(3, 133, 1, '2023-08-21 14:15:46', '2023-08-21 14:15:46', 'mutue123');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.logs_acessos
CREATE TABLE IF NOT EXISTS `logs_acessos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) DEFAULT NULL,
  `maquina` varchar(45) DEFAULT NULL,
  `browser` text,
  `user_id` bigint(20) unsigned NOT NULL,
  `descricao` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `canal_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.logs_acessos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.maquinas
CREATE TABLE IF NOT EXISTS `maquinas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_sistema_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_maquinas_estado_sistemas` (`estado_sistema_id`),
  CONSTRAINT `FK_maquinas_estado_sistemas` FOREIGN KEY (`estado_sistema_id`) REFERENCES `estado_sistemas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.maquinas: ~3 rows (aproximadamente)
INSERT INTO `maquinas` (`id`, `designacao`, `estado_sistema_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'M-01', 7, '2021-01-27 12:15:55', '2021-01-27 12:17:45', NULL),
	(2, 'M-02', 7, '2021-01-27 12:16:21', '2021-01-27 12:16:21', NULL),
	(5, 'M-03', 7, '2021-01-29 06:43:52', '2021-01-29 06:43:52', NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.materia_especies
CREATE TABLE IF NOT EXISTS `materia_especies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.materia_especies: ~17 rows (aproximadamente)
INSERT INTO `materia_especies` (`id`, `tipo`, `cor`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Pau-Rosa', 'Rosa', '2021-01-28 16:43:56', NULL, NULL),
	(7, 'Tolas Branca', 'Branca', '2021-01-28 16:44:30', NULL, NULL),
	(8, 'Chinfuta', NULL, '2021-01-28 16:45:45', NULL, NULL),
	(9, 'Lifuma', NULL, '2021-01-28 16:46:06', NULL, NULL),
	(10, 'Kali', NULL, '2021-01-28 16:46:23', NULL, NULL),
	(11, 'Kâmbala', NULL, '2021-01-28 16:46:38', NULL, NULL),
	(12, 'Ndola', NULL, '2021-01-28 16:46:53', NULL, NULL),
	(13, 'Livuite', NULL, '2021-01-28 16:47:08', NULL, NULL),
	(14, 'Pau-Preto', 'Preta', '2021-01-28 16:47:24', NULL, NULL),
	(15, 'Kungulo', NULL, '2021-01-28 16:47:44', NULL, NULL),
	(16, 'Limba', NULL, '2021-01-28 16:48:00', NULL, NULL),
	(17, 'Vuku', NULL, '2021-01-28 16:48:55', NULL, NULL),
	(18, 'Wamba', NULL, '2021-01-28 16:49:11', NULL, NULL),
	(19, 'Banzala', NULL, '2021-01-28 16:49:33', NULL, NULL),
	(20, 'Takula', NULL, '2021-01-28 16:49:53', NULL, NULL),
	(21, 'Numbi', NULL, '2021-01-28 16:50:34', NULL, NULL),
	(22, 'Padouk', NULL, '2021-02-01 08:22:44', NULL, NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.migrations: ~3 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_100000_create_password_resets_table', 1),
	(2, '2019_08_19_000000_create_failed_jobs_table', 1),
	(3, '2020_05_19_211825_create_permission_tables', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.model_has_permissions: ~38 rows (aproximadamente)
INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\admin\\User', 1),
	(2, 'App\\Models\\admin\\User', 1),
	(3, 'App\\Models\\admin\\User', 1),
	(4, 'App\\Models\\admin\\User', 1),
	(6, 'App\\Models\\admin\\User', 1),
	(4, 'App\\Models\\admin\\User', 26),
	(7, 'App\\Models\\admin\\User', 26),
	(3, 'App\\Models\\empresa\\User', 88),
	(6, 'App\\Models\\empresa\\User', 88),
	(7, 'App\\Models\\empresa\\User', 88),
	(10, 'App\\Models\\empresa\\User', 88),
	(3, 'App\\Models\\empresa\\User', 91),
	(6, 'App\\Models\\empresa\\User', 91),
	(7, 'App\\Models\\empresa\\User', 91),
	(10, 'App\\Models\\empresa\\User', 91),
	(11, 'App\\Models\\empresa\\User', 91),
	(1, 'App\\Models\\empresa\\User', 92),
	(2, 'App\\Models\\empresa\\User', 92),
	(3, 'App\\Models\\empresa\\User', 92),
	(4, 'App\\Models\\empresa\\User', 92),
	(6, 'App\\Models\\empresa\\User', 92),
	(7, 'App\\Models\\empresa\\User', 92),
	(8, 'App\\Models\\empresa\\User', 92),
	(9, 'App\\Models\\empresa\\User', 92),
	(10, 'App\\Models\\empresa\\User', 92),
	(11, 'App\\Models\\empresa\\User', 92),
	(3, 'App\\Models\\empresa\\User', 93),
	(6, 'App\\Models\\empresa\\User', 93),
	(7, 'App\\Models\\empresa\\User', 93),
	(10, 'App\\Models\\empresa\\User', 93),
	(3, 'App\\Models\\empresa\\User', 94),
	(6, 'App\\Models\\empresa\\User', 94),
	(7, 'App\\Models\\empresa\\User', 94),
	(10, 'App\\Models\\empresa\\User', 94),
	(3, 'App\\Models\\empresa\\User', 95),
	(6, 'App\\Models\\empresa\\User', 95),
	(7, 'App\\Models\\empresa\\User', 95),
	(10, 'App\\Models\\empresa\\User', 95);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.model_has_roles: ~230 rows (aproximadamente)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\admin\\User', 1),
	(2, 'App\\Models\\admin\\User', 1),
	(3, 'App\\Models\\admin\\User', 1),
	(3, 'App\\Models\\admin\\User', 26),
	(2, 'App\\Models\\admin\\User', 31),
	(3, 'App\\Models\\admin\\User', 38),
	(2, 'App\\Models\\admin\\User', 39),
	(3, 'App\\Models\\admin\\User', 40),
	(3, 'App\\Models\\admin\\User', 41),
	(3, 'App\\Models\\admin\\User', 42),
	(3, 'App\\Models\\admin\\User', 43),
	(3, 'App\\Models\\admin\\User', 44),
	(3, 'App\\Models\\admin\\User', 45),
	(3, 'App\\Models\\admin\\User', 46),
	(3, 'App\\Models\\admin\\User', 47),
	(3, 'App\\Models\\admin\\User', 48),
	(3, 'App\\Models\\admin\\User', 49),
	(3, 'App\\Models\\admin\\User', 50),
	(3, 'App\\Models\\admin\\User', 51),
	(3, 'App\\Models\\admin\\User', 52),
	(3, 'App\\Models\\admin\\User', 53),
	(3, 'App\\Models\\admin\\User', 54),
	(3, 'App\\Models\\admin\\User', 55),
	(3, 'App\\Models\\admin\\User', 56),
	(3, 'App\\Models\\admin\\User', 57),
	(3, 'App\\Models\\admin\\User', 58),
	(3, 'App\\Models\\admin\\User', 59),
	(3, 'App\\Models\\admin\\User', 60),
	(3, 'App\\Models\\admin\\User', 61),
	(3, 'App\\Models\\admin\\User', 62),
	(3, 'App\\Models\\admin\\User', 63),
	(3, 'App\\Models\\admin\\User', 64),
	(3, 'App\\Models\\admin\\User', 68),
	(3, 'App\\Models\\admin\\User', 70),
	(3, 'App\\Models\\admin\\User', 72),
	(3, 'App\\Models\\admin\\User', 74),
	(3, 'App\\Models\\admin\\User', 75),
	(3, 'App\\Models\\admin\\User', 76),
	(3, 'App\\Models\\admin\\User', 78),
	(3, 'App\\Models\\admin\\User', 79),
	(3, 'App\\Models\\admin\\User', 80),
	(3, 'App\\Models\\admin\\User', 82),
	(3, 'App\\Models\\admin\\User', 83),
	(3, 'App\\Models\\admin\\User', 87),
	(3, 'App\\Models\\admin\\User', 90),
	(3, 'App\\Models\\admin\\User', 92),
	(3, 'App\\Models\\admin\\User', 95),
	(3, 'App\\Models\\admin\\User', 96),
	(3, 'App\\Models\\admin\\User', 97),
	(3, 'App\\Models\\admin\\User', 99),
	(3, 'App\\Models\\admin\\User', 101),
	(3, 'App\\Models\\admin\\User', 102),
	(3, 'App\\Models\\admin\\User', 103),
	(3, 'App\\Models\\admin\\User', 104),
	(3, 'App\\Models\\admin\\User', 106),
	(3, 'App\\Models\\admin\\User', 107),
	(3, 'App\\Models\\admin\\User', 108),
	(3, 'App\\Models\\admin\\User', 111),
	(3, 'App\\Models\\admin\\User', 112),
	(3, 'App\\Models\\admin\\User', 113),
	(3, 'App\\Models\\admin\\User', 114),
	(3, 'App\\Models\\admin\\User', 115),
	(3, 'App\\Models\\admin\\User', 151),
	(3, 'App\\Models\\admin\\User', 153),
	(3, 'App\\Models\\admin\\User', 156),
	(3, 'App\\Models\\admin\\User', 160),
	(3, 'App\\Models\\admin\\User', 167),
	(3, 'App\\Models\\admin\\User', 168),
	(3, 'App\\Models\\admin\\User', 170),
	(3, 'App\\Models\\admin\\User', 172),
	(3, 'App\\Models\\admin\\User', 174),
	(3, 'App\\Models\\admin\\User', 178),
	(3, 'App\\Models\\admin\\User', 179),
	(3, 'App\\Models\\admin\\User', 180),
	(3, 'App\\Models\\admin\\User', 181),
	(3, 'App\\Models\\admin\\User', 182),
	(3, 'App\\Models\\admin\\User', 186),
	(3, 'App\\Models\\admin\\User', 187),
	(3, 'App\\Models\\admin\\User', 188),
	(3, 'App\\Models\\admin\\User', 191),
	(3, 'App\\Models\\admin\\User', 195),
	(3, 'App\\Models\\admin\\User', 198),
	(3, 'App\\Models\\admin\\User', 199),
	(3, 'App\\Models\\admin\\User', 200),
	(3, 'App\\Models\\admin\\User', 203),
	(3, 'App\\Models\\admin\\User', 207),
	(3, 'App\\Models\\admin\\User', 213),
	(3, 'App\\Models\\admin\\User', 214),
	(3, 'App\\Models\\admin\\User', 215),
	(3, 'App\\Models\\admin\\User', 218),
	(3, 'App\\Models\\admin\\User', 222),
	(3, 'App\\Models\\admin\\User', 224),
	(3, 'App\\Models\\admin\\User', 228),
	(3, 'App\\Models\\admin\\User', 232),
	(3, 'App\\Models\\admin\\User', 233),
	(3, 'App\\Models\\admin\\User', 234),
	(3, 'App\\Models\\admin\\User', 235),
	(3, 'App\\Models\\admin\\User', 236),
	(3, 'App\\Models\\admin\\User', 237),
	(3, 'App\\Models\\admin\\User', 238),
	(3, 'App\\Models\\admin\\User', 239),
	(3, 'App\\Models\\admin\\User', 240),
	(3, 'App\\Models\\admin\\User', 242),
	(3, 'App\\Models\\admin\\User', 243),
	(3, 'App\\Models\\admin\\User', 244),
	(3, 'App\\Models\\admin\\User', 245),
	(3, 'App\\Models\\admin\\User', 246),
	(3, 'App\\Models\\admin\\User', 249),
	(3, 'App\\Models\\admin\\User', 250),
	(3, 'App\\Models\\admin\\User', 251),
	(3, 'App\\Models\\admin\\User', 252),
	(3, 'App\\Models\\admin\\User', 253),
	(3, 'App\\Models\\admin\\User', 254),
	(3, 'App\\Models\\admin\\User', 255),
	(3, 'App\\Models\\admin\\User', 256),
	(3, 'App\\Models\\admin\\User', 257),
	(3, 'App\\Models\\admin\\User', 258),
	(3, 'App\\Models\\admin\\User', 259),
	(3, 'App\\Models\\admin\\User', 260),
	(3, 'App\\Models\\admin\\User', 261),
	(3, 'App\\Models\\admin\\User', 263),
	(3, 'App\\Models\\admin\\User', 264),
	(3, 'App\\Models\\admin\\User', 265),
	(3, 'App\\Models\\admin\\User', 266),
	(3, 'App\\Models\\admin\\User', 267),
	(3, 'App\\Models\\admin\\User', 268),
	(3, 'App\\Models\\admin\\User', 269),
	(3, 'App\\Models\\admin\\User', 271),
	(3, 'App\\Models\\admin\\User', 275),
	(3, 'App\\Models\\admin\\User', 276),
	(3, 'App\\Models\\admin\\User', 277),
	(3, 'App\\Models\\admin\\User', 278),
	(3, 'App\\Models\\admin\\User', 279),
	(3, 'App\\Models\\admin\\User', 280),
	(3, 'App\\Models\\admin\\User', 281),
	(3, 'App\\Models\\admin\\User', 282),
	(3, 'App\\Models\\admin\\User', 283),
	(3, 'App\\Models\\admin\\User', 284),
	(3, 'App\\Models\\admin\\User', 285),
	(3, 'App\\Models\\admin\\User', 286),
	(3, 'App\\Models\\admin\\User', 288),
	(3, 'App\\Models\\admin\\User', 289),
	(3, 'App\\Models\\admin\\User', 290),
	(3, 'App\\Models\\admin\\User', 291),
	(3, 'App\\Models\\admin\\User', 292),
	(3, 'App\\Models\\admin\\User', 293),
	(3, 'App\\Models\\admin\\User', 294),
	(3, 'App\\Models\\admin\\User', 295),
	(3, 'App\\Models\\admin\\User', 296),
	(3, 'App\\Models\\admin\\User', 297),
	(3, 'App\\Models\\admin\\User', 298),
	(3, 'App\\Models\\admin\\User', 299),
	(3, 'App\\Models\\admin\\User', 307),
	(3, 'App\\Models\\admin\\User', 308),
	(3, 'App\\Models\\admin\\User', 309),
	(3, 'App\\Models\\admin\\User', 310),
	(3, 'App\\Models\\admin\\User', 311),
	(3, 'App\\Models\\admin\\User', 312),
	(3, 'App\\Models\\admin\\User', 313),
	(3, 'App\\Models\\admin\\User', 314),
	(3, 'App\\Models\\admin\\User', 315),
	(3, 'App\\Models\\admin\\User', 316),
	(3, 'App\\Models\\admin\\User', 317),
	(3, 'App\\Models\\admin\\User', 318),
	(3, 'App\\Models\\admin\\User', 319),
	(3, 'App\\Models\\admin\\User', 320),
	(3, 'App\\Models\\admin\\User', 321),
	(3, 'App\\Models\\admin\\User', 322),
	(3, 'App\\Models\\admin\\User', 323),
	(3, 'App\\Models\\admin\\User', 324),
	(3, 'App\\Models\\admin\\User', 325),
	(3, 'App\\Models\\admin\\User', 326),
	(3, 'App\\Models\\admin\\User', 327),
	(3, 'App\\Models\\admin\\User', 328),
	(3, 'App\\Models\\admin\\User', 329),
	(3, 'App\\Models\\admin\\User', 330),
	(3, 'App\\Models\\admin\\User', 331),
	(3, 'App\\Models\\admin\\User', 332),
	(3, 'App\\Models\\admin\\User', 333),
	(3, 'App\\Models\\admin\\User', 334),
	(3, 'App\\Models\\admin\\User', 335),
	(3, 'App\\Models\\admin\\User', 336),
	(3, 'App\\Models\\admin\\User', 337),
	(3, 'App\\Models\\admin\\User', 338),
	(3, 'App\\Models\\admin\\User', 339),
	(3, 'App\\Models\\admin\\User', 340),
	(3, 'App\\Models\\admin\\User', 341),
	(3, 'App\\Models\\admin\\User', 342),
	(3, 'App\\Models\\admin\\User', 343),
	(3, 'App\\Models\\admin\\User', 344),
	(3, 'App\\Models\\admin\\User', 345),
	(3, 'App\\Models\\admin\\User', 346),
	(3, 'App\\Models\\admin\\User', 347),
	(3, 'App\\Models\\admin\\User', 348),
	(3, 'App\\Models\\admin\\User', 349),
	(3, 'App\\Models\\admin\\User', 350),
	(3, 'App\\Models\\admin\\User', 351),
	(3, 'App\\Models\\admin\\User', 352),
	(3, 'App\\Models\\admin\\User', 353),
	(3, 'App\\Models\\admin\\User', 354),
	(3, 'App\\Models\\admin\\User', 355),
	(3, 'App\\Models\\admin\\User', 356),
	(3, 'App\\Models\\admin\\User', 357),
	(3, 'App\\Models\\admin\\User', 358),
	(3, 'App\\Models\\admin\\User', 359),
	(3, 'App\\Models\\admin\\User', 360),
	(3, 'App\\Models\\admin\\User', 361),
	(3, 'App\\Models\\admin\\User', 362),
	(3, 'App\\Models\\admin\\User', 363),
	(3, 'App\\Models\\admin\\User', 364),
	(3, 'App\\Models\\admin\\User', 365),
	(3, 'App\\Models\\admin\\User', 366),
	(3, 'App\\Models\\admin\\User', 369),
	(3, 'App\\Models\\admin\\User', 371),
	(3, 'App\\Models\\admin\\User', 372),
	(3, 'App\\Models\\admin\\User', 373),
	(3, 'App\\Models\\admin\\User', 374),
	(3, 'App\\Models\\admin\\User', 375),
	(3, 'App\\Models\\admin\\User', 376),
	(3, 'App\\Models\\admin\\User', 377),
	(3, 'App\\Models\\admin\\User', 378),
	(3, 'App\\Models\\admin\\User', 379),
	(3, 'App\\Models\\admin\\User', 380),
	(3, 'App\\Models\\admin\\User', 381),
	(3, 'App\\Models\\admin\\User', 382),
	(3, 'App\\Models\\admin\\User', 383),
	(3, 'App\\Models\\admin\\User', 384),
	(3, 'App\\Models\\admin\\User', 385),
	(3, 'App\\Models\\admin\\User', 386),
	(3, 'App\\Models\\admin\\User', 387);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.moedas
CREATE TABLE IF NOT EXISTS `moedas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `cambio` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.moedas: ~0 rows (aproximadamente)
INSERT INTO `moedas` (`id`, `designacao`, `codigo`, `cambio`) VALUES
	(1, 'AKZ', 'AOA', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.motivo
CREATE TABLE IF NOT EXISTS `motivo` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigoMotivo` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `codigoStatus` int(10) unsigned NOT NULL DEFAULT '0',
  `canal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.motivo: ~39 rows (aproximadamente)
INSERT INTO `motivo` (`codigo`, `codigoMotivo`, `descricao`, `codigoStatus`, `canal_id`, `user_id`, `status_id`, `created_at`, `updated_at`, `empresa_id`) VALUES
	(7, 'M04', 'IVA – Regime de não sujeição', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(8, 'M02', 'Transmissão de bens e serviço não sujeita', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
	(9, 'M00', 'Regime Transitório', 1, 1, 1, 1, '2020-04-23 20:56:46', '2020-04-23 20:56:46', NULL),
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

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.notificacoes_sistema
CREATE TABLE IF NOT EXISTS `notificacoes_sistema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `empresa_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notificacoes_empresa` (`empresa_id`),
  KEY `FK_notificacoes_canal` (`canal_id`),
  CONSTRAINT `FK_notificacoes_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_notificacoes_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.notificacoes_sistema: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.notifications
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

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.notifications: ~4 rows (aproximadamente)
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`, `empresa_id`, `canal_id`) VALUES
	('1890bdea-7d21-468b-812a-aaaf1b7e1115', 'App\\Notifications\\CadastroEmpresaNotificacao', 'App\\Models\\admin\\Empresa', 126, '{"notificacao":{"id":141,"nome":"Pontes Perfumes","pessoal_Contacto":"933604248","telefone1":null,"telefone2":null,"endereco":"Camama","pais_id":1,"saldo":0,"canal_id":3,"status_id":1,"nif":"006424499LA0","gestor_cliente_id":1,"tipo_cliente_id":2,"tipo_regime_id":1,"logotipo":"utilizadores\\/cliente\\/avatarEmpresa.png","website":"p-perfumes.co.ao","email":"pontes787@hotmail.com","referencia":"ORF1TPG","pessoa_de_contacto":null,"created_at":"2022-01-08 12:04:06","updated_at":"2022-01-08 12:04:06","cidade":"Luanda","file_alvara":null,"file_nif":null},"empresa":"Pontes Perfumes","mensagem":"A empresa Pontes Perfumes foi cadastrado na aplica\\u00e7\\u00e3o","descricao":"A empresa Pontes Perfumes fez o seu cadastro na aplica\\u00e7\\u00e3o Mutue Neg\\u00f3cios. O cadastro foi efectuado no dia 08-01-2022"}', NULL, '2022-01-08 13:04:08', '2022-01-08 13:04:08', NULL, NULL),
	('5c75f068-3916-442a-b287-501c32adf787', 'App\\Notifications\\CadastroEmpresaNotificacao', 'App\\Models\\admin\\Empresa', 125, '{"notificacao":{"id":140,"nome":"JAH - Food & Drink","pessoal_Contacto":"947659174","telefone1":null,"telefone2":null,"endereco":"M\\u00e1rtires, Rua 16","pais_id":1,"saldo":0,"canal_id":3,"status_id":1,"nif":"5000568490","gestor_cliente_id":1,"tipo_cliente_id":3,"tipo_regime_id":2,"logotipo":"utilizadores\\/cliente\\/avatarEmpresa.png","website":null,"email":"jahfooddrinks@gmail.com","referencia":"B635C8G","pessoa_de_contacto":null,"created_at":"2022-01-07 12:55:59","updated_at":"2022-01-07 12:55:59","cidade":"Luanda","file_alvara":null,"file_nif":null},"empresa":"JAH - Food & Drink","mensagem":"A empresa JAH - Food & Drink foi cadastrado na aplica\\u00e7\\u00e3o","descricao":"A empresa JAH - Food & Drink fez o seu cadastro na aplica\\u00e7\\u00e3o Mutue Neg\\u00f3cios. O cadastro foi efectuado no dia 07-01-2022"}', NULL, '2022-01-07 13:56:01', '2022-01-07 13:56:01', NULL, NULL),
	('bdfb1cc9-bed6-4055-b184-1bd199024896', 'App\\Notifications\\CadastroEmpresaNotificacao', 'App\\Models\\admin\\Empresa', 100, '{"notificacao":{"id":115,"nome":"Bluexpress Lda","pessoal_Contacto":"945102900","endereco":"Vila Alice","pais_id":1,"saldo":0,"canal_id":3,"status_id":1,"nif":"5480015281","gestor_cliente_id":1,"tipo_cliente_id":3,"tipo_regime_id":1,"logotipo":"utilizadores\\/cliente\\/avatarEmpresa.png","website":null,"email":"bluexpress.geral@gmail.com","referencia":"X77D027","pessoa_de_contacto":null,"created_at":"2021-08-29 23:11:35","updated_at":"2021-08-29 23:11:35","cidade":"Luanda","file_alvara":null,"file_nif":null},"empresa":"Bluexpress Lda","mensagem":"A empresa Bluexpress Lda foi cadastrado na aplica\\u00e7\\u00e3o","descricao":"A empresa Bluexpress Lda fez o seu cadastro na aplica\\u00e7\\u00e3o Mutue Neg\\u00f3cios. O cadastro foi efectuado no dia 29-08-2021"}', NULL, '2021-08-30 00:11:38', '2021-08-30 00:11:38', NULL, NULL),
	('d50d35d4-c994-4fbb-b33a-ca09becc88a8', 'App\\Notifications\\CadastroEmpresaNotificacao', 'App\\Models\\admin\\Empresa', 122, '{"notificacao":{"id":137,"nome":"nicentech","pessoal_Contacto":"923722209","telefone1":null,"telefone2":null,"endereco":"prenda rua da 8 Esquadra","pais_id":1,"saldo":0,"canal_id":3,"status_id":1,"nif":"5417522627","gestor_cliente_id":1,"tipo_cliente_id":3,"tipo_regime_id":1,"logotipo":"utilizadores\\/cliente\\/avatarEmpresa.png","website":null,"email":"nicentech@gmail.com","referencia":"1Y92SRB","pessoa_de_contacto":null,"created_at":"2021-12-07 09:24:18","updated_at":"2021-12-07 09:24:18","cidade":"Luanda","file_alvara":null,"file_nif":null},"empresa":"nicentech","mensagem":"A empresa nicentech foi cadastrado na aplica\\u00e7\\u00e3o","descricao":"A empresa nicentech fez o seu cadastro na aplica\\u00e7\\u00e3o Mutue Neg\\u00f3cios. O cadastro foi efectuado no dia 07-12-2021"}', NULL, '2021-12-07 10:24:20', '2021-12-07 10:24:20', NULL, NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.pagamentos
CREATE TABLE IF NOT EXISTS `pagamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor_depositado` double NOT NULL DEFAULT '0',
  `quantidade` int(10) NOT NULL DEFAULT '0',
  `totalPago` double NOT NULL DEFAULT '0',
  `data_pago_banco` date NOT NULL,
  `numero_operacao_bancaria` varchar(50) NOT NULL,
  `numeracao_recibo` varchar(50) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `texto_hash` varchar(255) DEFAULT NULL,
  `valor_extenso` varchar(255) DEFAULT NULL,
  `numSequenciaRecibo` int(10) DEFAULT NULL,
  `forma_pagamento_id` int(10) unsigned NOT NULL,
  `conta_movimentada_id` int(10) unsigned NOT NULL,
  `referenciaFactura` varchar(50) NOT NULL,
  `comprovativo_bancario` varchar(145) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `factura_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `canal_id` int(10) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_validacao` date DEFAULT NULL,
  `data_rejeitacao` date DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao` varchar(250) DEFAULT NULL,
  `nFactura` varchar(100) DEFAULT NULL,
  `status` enum('PENDENTE','VÁLIDO') DEFAULT 'PENDENTE',
  PRIMARY KEY (`id`),
  KEY `FK_pagamentos_formas_pagamentos` (`forma_pagamento_id`),
  KEY `FK_pagamentos_bancos` (`conta_movimentada_id`),
  KEY `FK_pagamentos_facturas` (`factura_id`),
  KEY `FK_pagamentos_empresas` (`empresa_id`),
  KEY `FK_pagamentos_canais_comunicacoes` (`canal_id`),
  KEY `FK_pagamentos_users` (`user_id`),
  KEY `FK_pagamentos_status_gerais` (`status_id`),
  KEY `numero_operacao_bancaria` (`numero_operacao_bancaria`),
  KEY `referenciaFactura` (`referenciaFactura`),
  CONSTRAINT `FK_pagamentos_canais_comunicacoes` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_pagamentos_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_pagamentos_facturas` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `FK_pagamentos_formas_pagamentos` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `formas_pagamentos` (`id`),
  CONSTRAINT `FK_pagamentos_status_gerais` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.pagamentos: ~16 rows (aproximadamente)
INSERT INTO `pagamentos` (`id`, `valor_depositado`, `quantidade`, `totalPago`, `data_pago_banco`, `numero_operacao_bancaria`, `numeracao_recibo`, `hash`, `texto_hash`, `valor_extenso`, `numSequenciaRecibo`, `forma_pagamento_id`, `conta_movimentada_id`, `referenciaFactura`, `comprovativo_bancario`, `observacao`, `factura_id`, `empresa_id`, `canal_id`, `user_id`, `status_id`, `created_at`, `data_validacao`, `data_rejeitacao`, `updated_at`, `descricao`, `nFactura`, `status`) VALUES
	(26, 9025, 1, 9025, '2023-05-10', '0004000200030000', 'RG MUT2023/1', 'BPnu4SBrN3F4UCLkrGcz7FPRbjOssmRgH0PPiJugDIciWyNGOQ1vnFLsqWggx2hCtI62kbzg+IU5+P66HyHl5zmDRsU0oMAdG6YCKp/0xCLNJjHpAhAF7EyeHOgPTg0MovbX2+QslkBx7p1OXRKzBEW/sK6rsyohHPXWuemDF1g=', '2023-05-10;2023-05-10T12:43:48;RG MUT2023/1;9025.00;', 'nove mil e vinte e cinco', 1, 2, 1, '570119229', 'admin/licenca/L4IOVkpWfMaMHmC2trxW7IxJADtwURWi88A2oNQS.jpg', NULL, 55, 38, 2, 35, 2, '2023-05-10 11:43:48', '2023-07-14', NULL, '2023-05-10 12:45:57', 'Liquidação da factura FT MUT2023/14', 'FT MUT2023/14', 'PENDENTE'),
	(30, 9025, 1, 9025, '2023-07-11', '4479421701', 'RG FAN2023/1', 'wZUo56nCCzjQ6ITlsAlX7Pj8/NbMTr0vRxDVADKqdWWo4ec45e6K1CQca4nQSg98jHC8bZ9Pu158cEJKPTewDqb0QLAncLSr7vPu7o1oty9701Xm4tLLInRoE+3OqwSd2Idopr8dk+FUg26BIR1vh6TuNxfM2nPJroD4roY4pPI=', '2023-07-11;2023-07-11T14:21:50;RG FAN2023/1;9025.00;', 'nove mil e vinte e cinco', 1, 3, 1, '674319073', 'admin/licenca/FMnqM7Jbk642EMEurRmv6Sa6S6SSRiOwB6LDwkDr.pdf', 'PAGAMENTO DA LICENCA MENSAL (JULHO)', 59, 147, 2, 668, 1, '2023-07-11 13:21:50', '2023-07-11', NULL, '2023-07-11 14:30:26', 'Liquidação da factura FT MUT2023/15', 'FT MUT2023/15', 'VÁLIDO'),
	(31, 9025, 1, 9025, '2023-07-19', '6176797', 'RG EA-2023/1', 'orMddrrNozlvak4/LyE08dYnbjgLVPM1mm9/+6fbUlW+T/SRSTkc9S7clCO1L1qJdOuU8SvrKGarm/jLYKObqpBtJUidcPDQEVlSqv8HrA3rNe6bnF29EwYcgIJ8KdOcZn+CuRS8MRUAdRartQ5GSB1/Y0PVVT3bA9XoUPfyMe0=', '2023-07-19;2023-07-19T16:37:37;RG EA-2023/1;9025.00;', 'nove mil e vinte e cinco', 1, 3, 3, '833411926', 'admin/licenca/11w32tS9wsE0SJeZI5tiM3Sq7wQFXYuubY4bDU4n.jpg', NULL, 64, 144, 2, 661, 1, '2023-07-19 15:37:37', '2023-07-19', NULL, '2023-07-19 16:38:49', 'Liquidação da factura FT MUT2023/20', 'FT MUT2023/20', 'VÁLIDO'),
	(32, 216600, 1, 216600, '2023-07-19', '6176797', 'RG EA-2023/1', 'orMddrrNozlvak4/LyE08dYnbjgLVPM1mm9/+6fbUlW+T/SRSTkc9S7clCO1L1qJdOuU8SvrKGarm/jLYKObqpBtJUidcPDQEVlSqv8HrA3rNe6bnF29EwYcgIJ8KdOcZn+CuRS8MRUAdRartQ5GSB1/Y0PVVT3bA9XoUPfyMe0=', '2023-07-19;2023-07-19T16:37:37;RG EA-2023/1;9025.00;', 'duzentos e dezesseis mil e seiscentos', 1, 3, 3, '833411926', 'admin/licenca/11w32tS9wsE0SJeZI5tiM3Sq7wQFXYuubY4bDU4n.jpg', NULL, 75, 33, 2, 661, 2, '2023-07-19 15:37:37', '2023-07-19', NULL, '2023-07-19 16:38:49', 'Liquidação da factura FT MUT2023/20', 'FT MUT2023/20', 'VÁLIDO'),
	(33, 9025, 1, 9025, '2023-08-09', '0001200030004000', 'RC MUT2023/2', 'VeauEtSaQrp10SPRtK05BVyF3buKntrWfwvxm8Z5KoqCSnaHjjLK8qIjuuLPNGCiL/HcE+yDWUXw0lCHLTqRFEqP5weKUkZJj4IvHV1dEIsgqRuqvbPaBABoRLPhaHqBK273OVgVTemz9dHzET+PU6ZUXrF54nT98B23bzY2o1M=', '2023-08-09;2023-08-09T16:59:01;RC MUT2023/2;9025.00;BPnu4SBrN3F4UCLkrGcz7FPRbjOssmRgH0PPiJugDIciWyNGOQ1vnFLsqWggx2hCtI62kbzg+IU5+P66HyHl5zmDRsU0oMAdG6YCKp/0xCLNJjHpAhAF7EyeHOgPTg0MovbX2+QslkBx7p1OXRKzBEW/sK6rsyohHPXWuemDF1g=', 'nove mil e vinte e cinco', 2, 4, 3, '', 'admin/licenca/8tPmuroznEFUCLpT21xjxymZD8U2XC7Dfdrbn6d8.png', 'Liquidação da fatura FT MUT2023/20', 76, 38, 2, 1, 2, '2023-08-09 16:59:01', '2023-08-09', NULL, '2023-08-09 16:59:01', 'Liquidação da fatura FT MUT2023/20', 'FT MUT2023/20', 'VÁLIDO'),
	(34, 9025, 1, 9025, '2023-09-21', '4992993255', 'RC MUT2023/3', 'CraEOV9pWJyqFzFw1C/p8PM+U8nKVkZlMy/Gw0gV8rocbWGBsUdDCULm8VOm+wRY5bxz6knRYQxn/DP2+VH90hFMgllgkKSHXdmrq/p6MqrTTmlvUWGOix3FQCT93DbzAbKrQyhuVYqTM2WLZD4Xv+QwdUrB1DdjJ4ZyeoFLRfc=', '2023-09-21;2023-09-21T09:13:31;RC MUT2023/3;9025.00;VeauEtSaQrp10SPRtK05BVyF3buKntrWfwvxm8Z5KoqCSnaHjjLK8qIjuuLPNGCiL/HcE+yDWUXw0lCHLTqRFEqP5weKUkZJj4IvHV1dEIsgqRuqvbPaBABoRLPhaHqBK273OVgVTemz9dHzET+PU6ZUXrF54nT98B23bzY2o1M=', 'nove mil e vinte e cinco', 3, 4, 3, '', 'admin/licenca/5lyHWAO2JT9bwIGfFVspYA6f6WSRMcNIcfz9on9Z.pdf', 'Liquidação da fatura FT MUT2023/34', 90, 147, 2, 88, 1, '2023-09-21 09:13:31', '2023-09-21', NULL, '2023-09-21 09:13:31', 'Liquidação da fatura FT MUT2023/34', 'FT MUT2023/34', 'VÁLIDO'),
	(35, 9025, 1, 9025, '2023-09-27', '6616429', 'RC MUT2023/4', 'Gk5eYQD+r0yBTkrC3jMju4ctt1b2pGM2Xm+7rCwGN27O6rcSh8D1wBHKBVcSoT33A1Sh+qRJU7sY1FvS4PUUi5TXAhYtNUXCP+1Zf7z8lJErem02vmEwBMD+EqYhII1eJgb55CMZBLQrNifvWxxsEhbaicKWuYCaOgchsb8J9Rs=', '2023-09-27;2023-09-27T14:03:49;RC MUT2023/4;9025.00;CraEOV9pWJyqFzFw1C/p8PM+U8nKVkZlMy/Gw0gV8rocbWGBsUdDCULm8VOm+wRY5bxz6knRYQxn/DP2+VH90hFMgllgkKSHXdmrq/p6MqrTTmlvUWGOix3FQCT93DbzAbKrQyhuVYqTM2WLZD4Xv+QwdUrB1DdjJ4ZyeoFLRfc=', 'nove mil e vinte e cinco', 4, 4, 3, '', 'admin/licenca/lgYmGM40qpvA86YPbHKUimt9JDazkDzoi4qygZ5R.jpg', 'Liquidação da fatura FT MUT2023/36', 92, 152, 2, 92, 1, '2023-09-27 14:03:49', '2023-09-27', NULL, '2023-09-27 14:03:49', 'Liquidação da fatura FT MUT2023/36', 'FT MUT2023/36', 'VÁLIDO'),
	(36, 9025, 1, 9025, '2023-09-27', '654512', 'RC MUT2023/5', 'RcCxxjj6lPLLgyXHFjULqolXf0x4XWei9odPCCu+K5vtKEaSEfmYU//mD0Ut1g7/3KnHL+NobVHtkC17PvL3AxrYfpMhP+2Euev1Y3qvW0R+jFDnDRPEt7AvuqV2nAX7aQxZR1fLv0I2cqdaGTQ682LF29KzIbTYhWnaDduxJgQ=', '2023-09-27;2023-09-27T14:53:56;RC MUT2023/5;9025.00;Gk5eYQD+r0yBTkrC3jMju4ctt1b2pGM2Xm+7rCwGN27O6rcSh8D1wBHKBVcSoT33A1Sh+qRJU7sY1FvS4PUUi5TXAhYtNUXCP+1Zf7z8lJErem02vmEwBMD+EqYhII1eJgb55CMZBLQrNifvWxxsEhbaicKWuYCaOgchsb8J9Rs=', 'nove mil e vinte e cinco', 5, 3, 3, '', 'admin/licenca/FbFHqdWAJ91yJh7RNSMXdpDb84AWX5Sf2LGcCq5X.png', 'Liquidação da fatura FT MUT2023/37', 93, 38, 2, 1, 2, '2023-09-27 14:53:56', '2023-09-27', NULL, '2023-09-27 14:53:56', 'Liquidação da fatura FT MUT2023/37', 'FT MUT2023/37', 'VÁLIDO'),
	(37, 108300, 1, 108300, '2023-10-10', '439861206', 'RG MAP2023/1', 'hbWxvdAaiUq3eIRLckVQ9zbXeCiIjZv6Q7aL22c8mF5tTOG97wFgnqrvN7LJR9xyN5XIKyvGNNcqZmJ9UTW63uofZrKXEB9EClDhasExKXa0UhskQbL8ptC9sCkppI6C6zMHgzOLooggUZXiEGvnA2XTtron5ao+cqcvYtaOYZQ=', '2023-10-10;2023-10-10T09:55:25;RG MAP2023/1;108300.00;', 'cento e oito mil e trezentos', 1, 2, 3, '439861206', 'admin/licenca/cgLSyhJXUab8tHNH3XSpO3TU4E6r93yNZzfsQav7.jpg', NULL, 96, 157, 2, 703, 2, '2023-10-10 08:55:25', '2023-11-11', NULL, '2023-10-10 09:56:35', 'Liquidação da factura FT MUT2023/40', 'FT MUT2023/40', 'VÁLIDO'),
	(38, 9025, 1, 9025, '2023-10-31', '10930222', 'RC MUT2023/6', 'HNUWnGOAF4qiFzZVGvosUAYdR3q4epkCL9at3cFRKrN752wH6rOHjKqsFIsSjdfhJDSfipc+VnannexBcmw0dr2DvAYK2LAwALVN442ZGOyT9D2ZEZOAIOn5X3H7QeM1ibf1CU/KwTJzP0JHlJWsFKIyVr8KJ6Xsch+wih89Vi8=', '2023-10-31;2023-10-31T18:19:42;RC MUT2023/6;9025.00;RcCxxjj6lPLLgyXHFjULqolXf0x4XWei9odPCCu+K5vtKEaSEfmYU//mD0Ut1g7/3KnHL+NobVHtkC17PvL3AxrYfpMhP+2Euev1Y3qvW0R+jFDnDRPEt7AvuqV2nAX7aQxZR1fLv0I2cqdaGTQ682LF29KzIbTYhWnaDduxJgQ=', 'nove mil e vinte e cinco', 6, 4, 3, '', 'admin/licenca/DD4Iouwye17rQLhBb2QuLd0QkwVW2Bl2FOUHsw1f.jpg', 'Liquidação da fatura FT MUT2023/42', 98, 152, 2, 88, 1, '2023-10-31 18:19:42', '2023-10-31', NULL, '2023-10-31 18:19:42', 'Liquidação da fatura FT MUT2023/42', 'FT MUT2023/42', 'VÁLIDO'),
	(39, 108300, 1, 108300, '2023-11-15', '8234163', 'RC MUT2023/7', 'UDPGIRHn+F2KTUtWLY8eGRBQNAS4tKlrhWa6GCHALT4AKJOzMor1/vO5gRZyi1YQTy3gWLUMJ+sGknkexFVy6iD1yWKgvPKyHlAhiG5VVEUd7UKe94/ty8Zr4uj8Q2tso0IXKtfwlQeeqyJvvGEMMgzmdfZEs0XGKs3OYt9kCRU=', '2023-11-15;2023-11-15T16:50:43;RC MUT2023/7;108300.00;HNUWnGOAF4qiFzZVGvosUAYdR3q4epkCL9at3cFRKrN752wH6rOHjKqsFIsSjdfhJDSfipc+VnannexBcmw0dr2DvAYK2LAwALVN442ZGOyT9D2ZEZOAIOn5X3H7QeM1ibf1CU/KwTJzP0JHlJWsFKIyVr8KJ6Xsch+wih89Vi8=', 'cento e oito mil e trezentos', 7, 4, 3, '', 'admin/licenca/pi0TnRkp4VEvrgybhizvV6mI074cbCBqVBPvPHBa.jpg', 'Liquidação da fatura FT MUT2023/43', 99, 149, 2, 88, 1, '2023-11-15 16:50:43', '2023-11-15', NULL, '2023-11-15 16:50:43', 'Liquidação da fatura FT MUT2023/43', 'FT MUT2023/43', 'VÁLIDO'),
	(40, 54150, 6, 54150, '2023-11-18', '3115891', 'RC MUT2023/8', 'BFFFC5jI5yY6FkA+avmfz50s7KXnXRQC8DIJGJt/nTZkuliSFYYajCeX6mH0PJHsJSZD+CALglcl3KpsOWRyJE56Fl9aLfKnal74H1E0AE3kLjmJ8qS5aPbp1htyKlEWGY9WPmlURuqhkLVwAutrhpMhRSzVl7s6nfjrpzk2TEI=', '2023-11-18;2023-11-18T12:19:21;RC MUT2023/8;9025.00;UDPGIRHn+F2KTUtWLY8eGRBQNAS4tKlrhWa6GCHALT4AKJOzMor1/vO5gRZyi1YQTy3gWLUMJ+sGknkexFVy6iD1yWKgvPKyHlAhiG5VVEUd7UKe94/ty8Zr4uj8Q2tso0IXKtfwlQeeqyJvvGEMMgzmdfZEs0XGKs3OYt9kCRU=', 'Cinquenta e quatro mil, cento e cinquenta', 8, 3, 3, '', 'admin/licenca/F6ZkunHRvv5vO954h0zChU8xr4jfJK02Y22XAVJs.jpg', 'Liquidação da fatura FT MUT2023/44', 101, 159, 2, 88, 1, '2023-11-18 12:19:21', '2023-11-18', NULL, '2023-11-18 12:19:21', 'Liquidação da fatura FT MUT2023/44', 'FT MUT2023/44', 'VÁLIDO'),
	(43, 9025, 1, 9025, '2023-11-22', '6081654', 'RG MVB2023/1', 'tp4hp14locqRl95oNECDf/YsHMEwYBCGZA31wzkGofiQ0anmr4CmROuA8BohUkiiJFm/LBm8OW4vwz/iFEQE2xsA6FkUb5868AMUEgM0cbX0BUcnGoGnvakn2i9aI8DxaV/6hPSeo5PE9hoI2J56FnBz0+BmgrWbwfv0rBXQnDU=', '2023-11-22;2023-11-22T14:13:13;RG MVB2023/1;9025.00;', 'nove mil e vinte e cinco', 1, 3, 3, '013942361', 'admin/licenca/S0EBP9w9qCrxmeFQoLWa8DHkw2qRSPQIJeJQFAkM.pdf', NULL, 105, 160, 2, 731, 1, '2023-11-22 13:13:13', '2023-12-24', NULL, '2023-11-23 15:58:09', 'Liquidação da factura FT MUT2023/46', 'FT MUT2023/46', 'VÁLIDO'),
	(44, 9025, 1, 9025, '2023-12-01', '8587203', 'RG FLO2023/1', 'uY+KIahwQyiXDOJlhESlFEUFpmVqgzZ0xh4YofHsjBxm8LfmACCFy4P6AQvRUPsfuAtqLrZ2ht7Kf1OIOoVYcgsz+kDgBi7jURd6bwlaZArDIo+6S+M/Kbd7YH1OFsFZmvwRV89vNXm0cybGTSlNJDtJD8D0H3ng2NyMqFzwbjQ=', '2023-12-01;2023-12-01T13:48:38;RG FLO2023/1;9025.00;', 'nove mil e vinte e cinco', 1, 3, 6, '659733416', 'admin/licenca/ykvBDwCNZ5BCaCAUIW7HLVfsJxB2SCS8vcFv2S5Q.pdf', 'Att. Carlos Nunes \n923969494. \nBoa tarde', 106, 152, 2, 693, 1, '2023-12-01 12:48:38', '2023-12-01', NULL, '2023-12-01 14:06:36', 'Liquidação da factura FT MUT2023/47', 'FT MUT2023/47', 'VÁLIDO'),
	(45, 9025, 1, 9025, '2023-12-01', '8587203', 'RG FLO2023/2', 'ph8AyhwNQXb5zQxb76LMajl0Kb8yNF37d/WkOA81SQeOAJi+EjVrmhXqSLj/1iqGsysjgT/Bd+vc53tur2l6PRsBYkBHntxZcZGLJiIb3UpUIi68TrKZOL33bA4i0+a1g8lNkiT1f/HNFKrrxKOhQS85pxJkEN/rNbZ+tUQuEDU=', '2023-12-01;2023-12-01T14:09:46;RG FLO2023/2;9025.00;uY+KIahwQyiXDOJlhESlFEUFpmVqgzZ0xh4YofHsjBxm8LfmACCFy4P6AQvRUPsfuAtqLrZ2ht7Kf1OIOoVYcgsz+kDgBi7jURd6bwlaZArDIo+6S+M/Kbd7YH1OFsFZmvwRV89vNXm0cybGTSlNJDtJD8D0H3ng2NyMqFzwbjQ=', 'nove mil e vinte e cinco', 2, 3, 6, '459175722', 'admin/licenca/J3K9AzjrsKjbFdLprfHNPKZeM5EQb21ZMRmsUMTY.pdf', 'Saudações cordiais.envio em anexo os dados para a validação da lincença. Att. Carlos Nunes. 923969494', 98, 152, 2, 693, 2, '2023-12-01 13:09:46', NULL, NULL, '2023-12-01 13:09:46', 'Liquidação da factura FT MUT2023/42', 'FT MUT2023/42', 'PENDENTE'),
	(46, 9025, 1, 9025, '2024-01-01', '6360292', 'RG FLO2024/1', 'g/5QeGnYFHBG8RORky/ediRZuMroc9cFuyh7QxqZKXc44jrWRcMmmJ/CwsfZ9mZ7QEOaCWsozdYziOsvTerfG521dp+20+AV0rMW8XzLROtsSBu3wNeyS6iYSS3xdSY4TK3rUTvOAZkqway721igBOUKE7WGSwDZjheRGAvI7i0=', '2024-01-01;2024-01-01T19:28:29;RG FLO2024/1;9025.00;', 'nove mil e vinte e cinco', 1, 3, 6, '061211548', 'admin/licenca/TAJweDzoXcKi79LzAVAW3K4L807IKtKdCpCZvxWY.pdf', 'Att.923969494 Carlos ', 108, 152, 2, 693, 1, '2024-01-01 18:28:29', '2024-01-02', NULL, '2024-01-02 13:20:53', 'Liquidação da factura FT MUT2024/1', 'FT MUT2024/1', 'VÁLIDO');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.paises
CREATE TABLE IF NOT EXISTS `paises` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `indicativo` varchar(45) DEFAULT NULL,
  `moeda_id` int(10) unsigned DEFAULT NULL,
  `idioma_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.paises: ~245 rows (aproximadamente)
INSERT INTO `paises` (`id`, `designacao`, `sigla`, `indicativo`, `moeda_id`, `idioma_id`) VALUES
	(1, 'Angola', 'ANG', '+244', 1, 1),
	(2, 'Argélia', NULL, NULL, NULL, NULL),
	(3, 'Brasil', NULL, NULL, NULL, NULL),
	(4, 'Alemanha', NULL, NULL, NULL, NULL),
	(5, 'Dinamarques', NULL, NULL, NULL, NULL),
	(6, 'França', NULL, NULL, NULL, NULL),
	(7, 'Canadá', NULL, NULL, NULL, NULL),
	(8, 'Itália', NULL, NULL, NULL, NULL),
	(9, 'Holanda', NULL, NULL, NULL, NULL),
	(10, 'Bélgica', NULL, NULL, NULL, NULL),
	(11, 'África do Sul', NULL, NULL, NULL, NULL),
	(12, 'Espanha', NULL, NULL, NULL, NULL),
	(13, 'Venezuela', NULL, NULL, NULL, NULL),
	(15, 'Grã-Bretanha', NULL, NULL, NULL, NULL),
	(16, 'Irlanda', NULL, NULL, NULL, NULL),
	(17, 'Moçambique', NULL, NULL, NULL, NULL),
	(18, 'Áustria', NULL, NULL, NULL, NULL),
	(19, 'Costa Rica', NULL, NULL, NULL, NULL),
	(21, 'Marrocos', NULL, NULL, NULL, NULL),
	(22, 'Afeganistão', NULL, NULL, NULL, NULL),
	(23, 'Albania', NULL, NULL, NULL, NULL),
	(24, 'Andorra', NULL, NULL, NULL, NULL),
	(25, 'Angola', NULL, NULL, NULL, NULL),
	(26, 'Anguila', NULL, NULL, NULL, NULL),
	(27, 'Antárctica', NULL, NULL, NULL, NULL),
	(28, 'Antígua e Barbuda', NULL, NULL, NULL, NULL),
	(29, 'Antilhas holandesas', NULL, NULL, NULL, NULL),
	(30, 'Arábia Saudita', NULL, NULL, NULL, NULL),
	(31, 'Argentina', NULL, NULL, NULL, NULL),
	(32, 'Arménia', NULL, NULL, NULL, NULL),
	(33, 'Aruba', NULL, NULL, NULL, NULL),
	(34, 'Austrália', NULL, NULL, NULL, NULL),
	(35, 'Azerbaijão', NULL, NULL, NULL, NULL),
	(36, 'Bahamas', NULL, NULL, NULL, NULL),
	(37, 'Bangladesh', NULL, NULL, NULL, NULL),
	(38, 'Barbados', NULL, NULL, NULL, NULL),
	(39, 'Barém', NULL, NULL, NULL, NULL),
	(40, 'Belize', NULL, NULL, NULL, NULL),
	(41, 'Benin', NULL, NULL, NULL, NULL),
	(42, 'Bermuda', NULL, NULL, NULL, NULL),
	(43, 'Bielorrússia', NULL, NULL, NULL, NULL),
	(44, 'Bolívia', NULL, NULL, NULL, NULL),
	(45, 'Bósnia e Herzegovina', NULL, NULL, NULL, NULL),
	(46, 'Botswana', NULL, NULL, NULL, NULL),
	(47, 'Brunei Darussalam', NULL, NULL, NULL, NULL),
	(48, 'Bulgária', NULL, NULL, NULL, NULL),
	(49, 'Burkina Faso', NULL, NULL, NULL, NULL),
	(50, 'Burundi', NULL, NULL, NULL, NULL),
	(51, 'Butão', NULL, NULL, NULL, NULL),
	(52, 'Cabo Verde', NULL, NULL, NULL, NULL),
	(53, 'Camarões', NULL, NULL, NULL, NULL),
	(54, 'Camboja', NULL, NULL, NULL, NULL),
	(55, 'Catar', NULL, NULL, NULL, NULL),
	(56, 'Cazaquistão', NULL, NULL, NULL, NULL),
	(57, 'Centro-Africana (República)', NULL, NULL, NULL, NULL),
	(58, 'Chade', NULL, NULL, NULL, NULL),
	(59, 'Chile', NULL, NULL, NULL, NULL),
	(60, 'China', NULL, NULL, NULL, NULL),
	(61, 'Chipre', NULL, NULL, NULL, NULL),
	(62, 'Cidade do Vaticano ver Santa Sé', NULL, NULL, NULL, NULL),
	(63, 'Colômbia', NULL, NULL, NULL, NULL),
	(64, 'Comores', NULL, NULL, NULL, NULL),
	(65, 'Congo', NULL, NULL, NULL, NULL),
	(66, 'Congo (República Democrática do)', NULL, NULL, NULL, NULL),
	(67, 'Coreia (República da) ', NULL, NULL, NULL, NULL),
	(68, 'Coreia (República Popular Democrática da) ', NULL, NULL, NULL, NULL),
	(69, 'Costa do Marfim', NULL, NULL, NULL, NULL),
	(70, 'Croácia', NULL, NULL, NULL, NULL),
	(71, 'Cuba', NULL, NULL, NULL, NULL),
	(72, 'Dinamarca', NULL, NULL, NULL, NULL),
	(73, 'Domínica', NULL, NULL, NULL, NULL),
	(74, 'Egipto', NULL, NULL, NULL, NULL),
	(75, 'El Salvador', NULL, NULL, NULL, NULL),
	(76, 'Emiratos Árabes Unidos', NULL, NULL, NULL, NULL),
	(77, 'Equador', NULL, NULL, NULL, NULL),
	(78, 'Eritreia', NULL, NULL, NULL, NULL),
	(79, 'Eslovaca (República)', NULL, NULL, NULL, NULL),
	(80, 'Eslovénia', NULL, NULL, NULL, NULL),
	(81, 'Estados Unidos', NULL, NULL, NULL, NULL),
	(82, 'Estónia', NULL, NULL, NULL, NULL),
	(83, 'Etiópia', NULL, NULL, NULL, NULL),
	(84, 'Filipinas', NULL, NULL, NULL, NULL),
	(85, 'Finlândia', NULL, NULL, NULL, NULL),
	(86, 'Gabão', NULL, NULL, NULL, NULL),
	(87, 'Gâmbia', NULL, NULL, NULL, NULL),
	(88, 'Gana', NULL, NULL, NULL, NULL),
	(89, 'Geórgia', NULL, NULL, NULL, NULL),
	(90, 'Georgia do Sul e Ilhas Sandwich', NULL, NULL, NULL, NULL),
	(91, 'Gibraltar', NULL, NULL, NULL, NULL),
	(92, 'Granada', NULL, NULL, NULL, NULL),
	(93, 'Grécia', NULL, NULL, NULL, NULL),
	(94, 'Gronelândia', NULL, NULL, NULL, NULL),
	(95, 'Guadalupe', NULL, NULL, NULL, NULL),
	(96, 'Guam', NULL, NULL, NULL, NULL),
	(97, 'Guatemala', NULL, NULL, NULL, NULL),
	(98, 'Guiana', NULL, NULL, NULL, NULL),
	(99, 'Guiana Francesa', NULL, NULL, NULL, NULL),
	(100, 'Guiné', NULL, NULL, NULL, NULL),
	(101, 'Guiné Equatorial', NULL, NULL, NULL, NULL),
	(102, 'Guiné-Bissau', NULL, NULL, NULL, NULL),
	(103, 'Haiti', NULL, NULL, NULL, NULL),
	(104, 'Honduras', NULL, NULL, NULL, NULL),
	(105, 'Hong Kong', NULL, NULL, NULL, NULL),
	(106, 'Hungria', NULL, NULL, NULL, NULL),
	(107, 'Iémen', NULL, NULL, NULL, NULL),
	(108, 'Ilhas Bouvet', NULL, NULL, NULL, NULL),
	(109, 'Ilhas Caimão', NULL, NULL, NULL, NULL),
	(110, 'Ilhas Christmas', NULL, NULL, NULL, NULL),
	(111, 'Ilhas Cocos (Keeling)', NULL, NULL, NULL, NULL),
	(112, 'Ilhas Cook', NULL, NULL, NULL, NULL),
	(113, 'Ilhas Falkland (Malvinas)', NULL, NULL, NULL, NULL),
	(114, 'Ilhas Faroé', NULL, NULL, NULL, NULL),
	(115, 'Ilhas Fiji', NULL, NULL, NULL, NULL),
	(116, 'Ilhas Heard e Ilhas McDonald', NULL, NULL, NULL, NULL),
	(117, 'Ilhas Marianas do Norte', NULL, NULL, NULL, NULL),
	(118, 'Ilhas Marshall', NULL, NULL, NULL, NULL),
	(119, 'Ilhas menores distantes dos Estados Unidos', NULL, NULL, NULL, NULL),
	(120, 'Ilhas Norfolk', NULL, NULL, NULL, NULL),
	(121, 'Ilhas Salomão', NULL, NULL, NULL, NULL),
	(122, 'Ilhas Virgens (britânicas)', NULL, NULL, NULL, NULL),
	(123, 'Ilhas Virgens (Estados Unidos)', NULL, NULL, NULL, NULL),
	(124, 'Índia', NULL, NULL, NULL, NULL),
	(125, 'Indonésia', NULL, NULL, NULL, NULL),
	(126, 'Irão (República Islâmica)', NULL, NULL, NULL, NULL),
	(127, 'Iraque', NULL, NULL, NULL, NULL),
	(128, 'Islândia', NULL, NULL, NULL, NULL),
	(129, 'Israel', NULL, NULL, NULL, NULL),
	(130, 'Jamaica', NULL, NULL, NULL, NULL),
	(131, 'Japão', NULL, NULL, NULL, NULL),
	(132, 'Jibuti', NULL, NULL, NULL, NULL),
	(133, 'Jordânia', NULL, NULL, NULL, NULL),
	(134, 'Jugoslávia', NULL, NULL, NULL, NULL),
	(135, 'Kenya', NULL, NULL, NULL, NULL),
	(136, 'Kiribati', NULL, NULL, NULL, NULL),
	(137, 'Kuwait', NULL, NULL, NULL, NULL),
	(138, 'Laos (República Popular Democrática do)', NULL, NULL, NULL, NULL),
	(139, 'Lesoto', NULL, NULL, NULL, NULL),
	(140, 'Letónia', NULL, NULL, NULL, NULL),
	(141, 'Líbano', NULL, NULL, NULL, NULL),
	(142, 'Libéria', NULL, NULL, NULL, NULL),
	(143, 'Líbia (Jamahiriya Árabe da)', NULL, NULL, NULL, NULL),
	(144, 'Liechtenstein', NULL, NULL, NULL, NULL),
	(145, 'Lituânia', NULL, NULL, NULL, NULL),
	(146, 'Luxemburgo', NULL, NULL, NULL, NULL),
	(147, 'Macau', NULL, NULL, NULL, NULL),
	(148, 'Macedónia (antiga república jugoslava da)', NULL, NULL, NULL, NULL),
	(149, 'Madagáscar', NULL, NULL, NULL, NULL),
	(150, 'Malásia', NULL, NULL, NULL, NULL),
	(151, 'Malawi', NULL, NULL, NULL, NULL),
	(152, 'Maldivas', NULL, NULL, NULL, NULL),
	(153, 'Mali', NULL, NULL, NULL, NULL),
	(154, 'Malta', NULL, NULL, NULL, NULL),
	(155, 'Martinica', NULL, NULL, NULL, NULL),
	(156, 'Maurícias', NULL, NULL, NULL, NULL),
	(157, 'Mauritânia', NULL, NULL, NULL, NULL),
	(158, 'Mayotte', NULL, NULL, NULL, NULL),
	(159, 'México', NULL, NULL, NULL, NULL),
	(160, 'Micronésia (Estados Federados da)', NULL, NULL, NULL, NULL),
	(161, 'Moldova (República de)', NULL, NULL, NULL, NULL),
	(162, 'Mónaco', NULL, NULL, NULL, NULL),
	(163, 'Mongólia', NULL, NULL, NULL, NULL),
	(164, 'Monserrate', NULL, NULL, NULL, NULL),
	(165, 'Myanmar', NULL, NULL, NULL, NULL),
	(166, 'Namíbia', NULL, NULL, NULL, NULL),
	(167, 'Nauru', NULL, NULL, NULL, NULL),
	(168, 'Nepal', NULL, NULL, NULL, NULL),
	(169, 'Nicarágua', NULL, NULL, NULL, NULL),
	(170, 'Niger', NULL, NULL, NULL, NULL),
	(171, 'Nigéria', NULL, NULL, NULL, NULL),
	(172, 'Niue', NULL, NULL, NULL, NULL),
	(173, 'Noruega', NULL, NULL, NULL, NULL),
	(174, 'Nova Caledónia', NULL, NULL, NULL, NULL),
	(175, 'Nova Zelândia', NULL, NULL, NULL, NULL),
	(176, 'Omã', NULL, NULL, NULL, NULL),
	(177, 'Países Baixos', NULL, NULL, NULL, NULL),
	(178, 'Palau', NULL, NULL, NULL, NULL),
	(179, 'Panamá', NULL, NULL, NULL, NULL),
	(180, 'Papuásia-Nova Guiné', NULL, NULL, NULL, NULL),
	(181, 'Paquistão', NULL, NULL, NULL, NULL),
	(182, 'Paraguai', NULL, NULL, NULL, NULL),
	(183, 'Peru', NULL, NULL, NULL, NULL),
	(184, 'Pitcairn', NULL, NULL, NULL, NULL),
	(185, 'Polinésia Francesa', NULL, NULL, NULL, NULL),
	(186, 'Polónia', NULL, NULL, NULL, NULL),
	(187, 'Porto Rico', NULL, NULL, NULL, NULL),
	(188, 'Portugal', NULL, NULL, NULL, NULL),
	(189, 'Quirguizistão', NULL, NULL, NULL, NULL),
	(190, 'Reino Unido', NULL, NULL, NULL, NULL),
	(191, 'República Checa', NULL, NULL, NULL, NULL),
	(192, 'República Dominicana', NULL, NULL, NULL, NULL),
	(193, 'Reunião', NULL, NULL, NULL, NULL),
	(194, 'Roménia', NULL, NULL, NULL, NULL),
	(195, 'Ruanda', NULL, NULL, NULL, NULL),
	(196, 'Rússia (Federação da)', NULL, NULL, NULL, NULL),
	(197, 'Samoa', NULL, NULL, NULL, NULL),
	(198, 'Samoa Americana', NULL, NULL, NULL, NULL),
	(199, 'Santa Helena', NULL, NULL, NULL, NULL),
	(200, 'Santa Lúcia', NULL, NULL, NULL, NULL),
	(201, 'Santa Sé (Cidade Estado do Vaticano)*', NULL, NULL, NULL, NULL),
	(202, 'São Cristóvão e Nevis', NULL, NULL, NULL, NULL),
	(203, 'São Marino', NULL, NULL, NULL, NULL),
	(204, 'São Pedro e Miquelon', NULL, NULL, NULL, NULL),
	(205, 'São Tomé e Príncipe', NULL, NULL, NULL, NULL),
	(206, 'São Vicente e Granadinas', NULL, NULL, NULL, NULL),
	(207, 'Sara Ocidental', NULL, NULL, NULL, NULL),
	(208, 'Senegal', NULL, NULL, NULL, NULL),
	(209, 'Serra Leoa', NULL, NULL, NULL, NULL),
	(210, 'Seychelles', NULL, NULL, NULL, NULL),
	(211, 'Singapura', NULL, NULL, NULL, NULL),
	(212, 'Síria (República Árabe da)', NULL, NULL, NULL, NULL),
	(213, 'Somália', NULL, NULL, NULL, NULL),
	(214, 'Sri Lanka', NULL, NULL, NULL, NULL),
	(215, 'Suazilândia', NULL, NULL, NULL, NULL),
	(216, 'Sudão', NULL, NULL, NULL, NULL),
	(217, 'Suécia', NULL, NULL, NULL, NULL),
	(218, 'Suiça', NULL, NULL, NULL, NULL),
	(219, 'Suriname', NULL, NULL, NULL, NULL),
	(220, 'Svålbard e a Ilha de Jan Mayen', NULL, NULL, NULL, NULL),
	(221, 'Tailândia', NULL, NULL, NULL, NULL),
	(222, 'Taiwan (Província da China)', NULL, NULL, NULL, NULL),
	(223, 'Tajiquistão', NULL, NULL, NULL, NULL),
	(224, 'Tanzânia, República Unida da', NULL, NULL, NULL, NULL),
	(225, 'Território Britânico do Oceano Índico', NULL, NULL, NULL, NULL),
	(226, 'Território Palestiniano Ocupado', NULL, NULL, NULL, NULL),
	(227, 'Territórios Franceses do Sul', NULL, NULL, NULL, NULL),
	(228, 'Timor Leste', NULL, NULL, NULL, NULL),
	(229, 'Togo', NULL, NULL, NULL, NULL),
	(230, 'Tokelau', NULL, NULL, NULL, NULL),
	(231, 'Tonga', NULL, NULL, NULL, NULL),
	(232, 'Trindade e Tobago', NULL, NULL, NULL, NULL),
	(233, 'Tunísia', NULL, NULL, NULL, NULL),
	(234, 'Turcos e Caicos (Ilhas)', NULL, NULL, NULL, NULL),
	(235, 'Turquemenistão', NULL, NULL, NULL, NULL),
	(236, 'Turquia', NULL, NULL, NULL, NULL),
	(237, 'Tuvalu', NULL, NULL, NULL, NULL),
	(238, 'Ucrânia', NULL, NULL, NULL, NULL),
	(239, 'Uganda', NULL, NULL, NULL, NULL),
	(240, 'Uruguai', NULL, NULL, NULL, NULL),
	(241, 'Usbequistão', NULL, NULL, NULL, NULL),
	(242, 'Vanuatu', NULL, NULL, NULL, NULL),
	(243, 'Vietname', NULL, NULL, NULL, NULL),
	(244, 'Wallis e Futuna (Ilha)', NULL, NULL, NULL, NULL),
	(245, 'Zaire, ver Congo (República Democrática do)', NULL, NULL, NULL, NULL),
	(246, 'Zâmbia', NULL, NULL, NULL, NULL),
	(247, 'Zimbabwe', NULL, NULL, NULL, NULL);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.parametros
CREATE TABLE IF NOT EXISTS `parametros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `vida` int(10) unsigned DEFAULT NULL,
  `createde_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `canal_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_parametros_canal` (`canal_id`),
  CONSTRAINT `FK_parametros_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.parametros: ~22 rows (aproximadamente)
INSERT INTO `parametros` (`id`, `designacao`, `valor`, `vida`, `createde_at`, `updated_at`, `canal_id`) VALUES
	(1, 'N.º de Dias Gratis', '30', NULL, '2020-04-22 16:18:57', '2020-04-22 16:18:57', 1),
	(2, 'N.º de Dias Aviso', '10', NULL, '2020-04-22 16:18:57', '2020-04-22 16:18:57', 1),
	(8, 'IPC', '0.05', 0, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(9, 'cambio', '190', 0, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(10, 'N.º Mes Paragem Vendas de Produto', NULL, 9, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(11, 'N.º Mes Alerta Vendas de Produto', NULL, 5, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(12, 'Nº Minimo de Alerta Existencia dos Produtos', NULL, 21, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(13, 'Valor Desconto', '100', 100, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(14, 'Retencao na fonte', '6.5', 7, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(15, 'hora', '22:00:00', 22, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(16, 'TipoImpreensao', 'A4', 1, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(17, 'NotaEntrega', 'SIM', 1, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(18, 'CartaRecompesa', 'SIM', 1, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(19, 'LayoutVenda', 'Classico', 1, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 1),
	(20, 'Nº Dias Vencimento Factura', NULL, 15, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 3),
	(21, 'IVA', NULL, 1, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 3),
	(22, 'Deposito de valor', NULL, 1, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 3),
	(23, 'Nº Dias Vencimento Factura Proforma', NULL, 15, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 3),
	(24, 'Sigla da empresa', 'AGT', 0, '2020-07-09 15:05:56', '2020-07-09 15:05:56', 3),
	(25, 'Licença Premium', 'Mensal', 31, '2020-07-16 15:38:01', '2020-07-16 15:38:01', 3),
	(26, 'Licença Platina', 'Anual', 365, '2020-07-16 15:40:57', '2020-07-16 15:40:57', 3),
	(27, 'Licença Definitiva', 'Definitiva', NULL, '2020-07-16 15:48:18', '2020-07-16 15:48:18', 3);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.password_resets: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.perfils
CREATE TABLE IF NOT EXISTS `perfils` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(255) NOT NULL,
  `status_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uuid` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.perfils: ~3 rows (aproximadamente)
INSERT INTO `perfils` (`id`, `designacao`, `status_id`, `user_id`, `created_at`, `updated_at`, `uuid`) VALUES
	(1, 'Super Administrador ', 1, 1, '2023-01-07 13:57:30', '2023-11-18 03:51:57', '57723dce-88b3-4a23-85e9-83d0fade77eb'),
	(2, 'Suporte Linha 1', 1, 1, '2023-01-13 10:56:29', '2023-01-13 10:56:29', 'd32e91c2-e502-464d-a786-11290f0edbd5'),
	(26, 'Apoio MUTUE', 1, 1, '2023-11-22 14:58:35', '2023-11-22 15:06:27', '58b2a821-ca74-41bc-80a1-7691c5853611');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.periodo_testes
CREATE TABLE IF NOT EXISTS `periodo_testes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `periodo` date NOT NULL,
  `dias_restante` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_periodo_teste_empresas` (`empresa_id`),
  CONSTRAINT `FK_periodo_teste_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.periodo_testes: ~4 rows (aproximadamente)
INSERT INTO `periodo_testes` (`id`, `periodo`, `dias_restante`, `empresa_id`) VALUES
	(16, '2020-08-16', 30, 25),
	(19, '2020-09-04', 30, 27),
	(20, '2020-09-06', 5, 21),
	(21, '2020-12-06', 30, 28);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empresa_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.permissions: ~10 rows (aproximadamente)
INSERT INTO `permissions` (`id`, `name`, `status_id`, `guard_name`, `created_at`, `updated_at`, `label`, `empresa_id`) VALUES
	(1, 'gerir utilizadores', 1, 'admin', '2020-05-04 16:07:01', '2020-05-04 16:07:02', 'Gerir utilizadores', 1),
	(2, 'Gerir permissoes', 1, 'admin', '2020-05-18 01:08:13', '2020-05-18 01:08:15', 'Gerir permissoes', 1),
	(3, 'Gerir pagamento de licenças dos clientes', 1, 'admin', '2020-05-18 01:09:05', '2020-05-18 01:09:06', 'Gerir ativação de licenças', 1),
	(4, 'gerir bancos', 1, 'admin', '2020-05-18 01:09:05', '2020-05-18 01:09:06', 'Gerir bancos', 1),
	(6, 'Gerir pedidos ativacao de licenca', 1, 'admin', '2020-05-18 01:09:05', '2020-05-18 01:09:06', 'Gerir pedidos ativacao de licenca', 1),
	(7, 'Resetar a senha dos clientes', 1, 'admin', '2020-05-18 01:09:05', '2020-05-18 01:09:06', 'Resetar a senha dos clientes', 1),
	(8, 'Atualizar dados da empresa', 1, 'admin', '2020-05-18 01:09:05', '2020-05-18 01:09:06', 'Atualizar dados da empresa', 1),
	(9, 'Efetuar backup do banco de dados', 1, 'admin', '2020-05-18 01:09:05', '2020-05-18 01:09:06', 'Efetuar backup do banco de dados', 1),
	(10, 'Gerir activação de utilizador dos clientes', 1, 'admin', '2020-05-18 01:09:05', '2020-05-18 01:09:06', 'Gerir activação de utilizador dos clientes', 1),
	(11, 'Gerir clientes', 1, 'admin', '2023-11-20 12:10:43', '2023-11-20 12:10:44', 'Gerir clientes', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.personal_access_tokens
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.personal_access_tokens: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.producaos
CREATE TABLE IF NOT EXISTS `producaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `materia_prima_id` int(10) unsigned DEFAULT NULL,
  `num_toro_producao` int(11) NOT NULL,
  `nitems` int(10) DEFAULT NULL,
  `nproducao` int(10) NOT NULL,
  `disperdicio` double(8,2) DEFAULT NULL,
  `data` date NOT NULL,
  `responsavel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_sistema_id` int(10) unsigned DEFAULT NULL,
  `maquina_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producaos_estado_sistema_id_foreign` (`estado_sistema_id`),
  KEY `producaos_maquina_id_foreign` (`maquina_id`),
  KEY `FK_producaos_materia_primas` (`materia_prima_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.producaos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.producao_items
CREATE TABLE IF NOT EXISTS `producao_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int(10) unsigned DEFAULT NULL,
  `na` double(8,2) NOT NULL,
  `nb` double(8,2) NOT NULL,
  `nc` double(8,2) NOT NULL,
  `nd` double(8,2) NOT NULL,
  `medio` double(8,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `comprimento` double(8,2) NOT NULL,
  `volume` double(8,2) NOT NULL,
  `producao_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `armazem_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producao_items_producao_id_foreign` (`producao_id`),
  KEY `FK_producao_items_armazems` (`armazem_id`),
  KEY `FK_producao_items_produtos` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.producao_items: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.roles: ~3 rows (aproximadamente)
INSERT INTO `roles` (`id`, `label`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', 'Super-Admin', 'web', '2020-05-18 00:05:05', '2020-05-18 00:05:06'),
	(2, 'Admin', 'Admin', 'web', '2020-05-18 00:05:41', '2020-05-18 00:05:42'),
	(3, 'Funcionario', 'Funcionario', 'web', '2020-06-09 20:22:21', '2020-06-09 20:22:23');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.role_has_permissions: ~15 rows (aproximadamente)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(3, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(10, 2);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.status_gerais
CREATE TABLE IF NOT EXISTS `status_gerais` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.status_gerais: ~2 rows (aproximadamente)
INSERT INTO `status_gerais` (`id`, `designacao`) VALUES
	(1, 'Activo'),
	(2, 'Inativo');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.status_licencas
CREATE TABLE IF NOT EXISTS `status_licencas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.status_licencas: ~3 rows (aproximadamente)
INSERT INTO `status_licencas` (`id`, `designacao`) VALUES
	(1, 'Activo'),
	(2, 'Rejeitado'),
	(3, 'Pendente');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.status_senha
CREATE TABLE IF NOT EXISTS `status_senha` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.status_senha: ~2 rows (aproximadamente)
INSERT INTO `status_senha` (`id`, `designacao`) VALUES
	(1, 'Vulnerável'),
	(2, 'Segura');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.tb_preinscricao
CREATE TABLE IF NOT EXISTS `tb_preinscricao` (
  `id` int(10) NOT NULL,
  `Nome_Completo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_identificacao` int(10) DEFAULT NULL,
  `Bilhete_Identidade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  `Codigo_pais_habilitacao_anterior` int(10) DEFAULT NULL,
  `Contactos_Telefonicos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nome_Pessoa_Contacto_Telefone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Curso_Candidatura` int(10) DEFAULT NULL,
  `Morada_Completa` varchar(455) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Codigo_Habilitacao_Anterior` int(10) DEFAULT NULL,
  `Codigo_Profissao` int(10) DEFAULT NULL,
  `necessidade_especial_id` int(10) DEFAULT NULL,
  `polo_id` int(10) DEFAULT NULL,
  `Codigo_Turno` int(10) DEFAULT NULL,
  `anoLectivo` int(10) DEFAULT NULL,
  `canal` int(10) DEFAULT NULL,
  `codigo_tipo_candidatura` int(10) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `data_preescrincao` datetime DEFAULT NULL,
  `data_ultima_actualizacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.tb_preinscricao: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.tipos_clientes
CREATE TABLE IF NOT EXISTS `tipos_clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.tipos_clientes: ~6 rows (aproximadamente)
INSERT INTO `tipos_clientes` (`id`, `designacao`) VALUES
	(1, 'Singular'),
	(2, 'Instituição Privada'),
	(3, 'Instituição Publica'),
	(4, 'Sociedade Anónima'),
	(5, 'ONG'),
	(6, 'Diversos');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.tipos_contactos
CREATE TABLE IF NOT EXISTS `tipos_contactos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.tipos_contactos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.tipos_licencas
CREATE TABLE IF NOT EXISTS `tipos_licencas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.tipos_licencas: ~5 rows (aproximadamente)
INSERT INTO `tipos_licencas` (`id`, `designacao`) VALUES
	(1, 'Grátis'),
	(2, 'Mensal'),
	(3, 'Anual'),
	(4, 'Definitivo'),
	(5, 'Semestral');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.tipos_regimes
CREATE TABLE IF NOT EXISTS `tipos_regimes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Designacao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.tipos_regimes: ~3 rows (aproximadamente)
INSERT INTO `tipos_regimes` (`id`, `Designacao`) VALUES
	(1, 'Regime Geral'),
	(2, 'Regime Simplificado'),
	(3, ' Regime de Exclusão');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.tipotaxa
CREATE TABLE IF NOT EXISTS `tipotaxa` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxa` int(11) NOT NULL,
  `codigostatus` int(10) unsigned NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `codigoMotivo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `empresa_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_tipotaxa_2` (`codigostatus`),
  KEY `FK_tipotaxa_empresas` (`empresa_id`),
  CONSTRAINT `FK_tipotaxa_2` FOREIGN KEY (`codigostatus`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_tipotaxa_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.tipotaxa: ~3 rows (aproximadamente)
INSERT INTO `tipotaxa` (`codigo`, `taxa`, `codigostatus`, `descricao`, `codigoMotivo`, `created_at`, `updated_at`, `empresa_id`) VALUES
	(1, 0, 1, 'IVA(0,00%)', 12, '2020-09-28 13:10:30', '2020-09-28 13:10:30', 1),
	(2, 14, 1, 'IVA(14,00%)', 9, '2020-09-28 13:10:30', '2020-09-28 13:10:30', 1),
	(19, 2, 1, 'IVA(2,00%)', 8, '2020-12-09 23:13:48', '2020-12-09 23:41:22', 1);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.tipo_users
CREATE TABLE IF NOT EXISTS `tipo_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.tipo_users: ~3 rows (aproximadamente)
INSERT INTO `tipo_users` (`id`, `designacao`) VALUES
	(1, 'Admin'),
	(2, 'Empresa'),
	(3, 'Cliente');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.users_admin
CREATE TABLE IF NOT EXISTS `users_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `canal_id` int(10) unsigned DEFAULT NULL,
  `tipo_user_id` int(10) unsigned DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT NULL,
  `status_senha_id` int(10) unsigned DEFAULT '1',
  `username` varchar(450) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto` varchar(145) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guard` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'web' COMMENT 'guard usado para verficar as permissões no serviço AuthServiceProvider',
  `notificarAtivacaoLicenca` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefone` (`telefone`),
  KEY `FK_users_canal` (`canal_id`),
  KEY `Fk_tipo_user_id` (`tipo_user_id`),
  KEY `Fk_status_id` (`status_id`),
  KEY `FK_users_status_senha` (`status_senha_id`),
  CONSTRAINT `FK_users_canal` FOREIGN KEY (`canal_id`) REFERENCES `canais_comunicacoes` (`id`),
  CONSTRAINT `FK_users_status` FOREIGN KEY (`status_id`) REFERENCES `status_gerais` (`id`),
  CONSTRAINT `FK_users_status_senha` FOREIGN KEY (`status_senha_id`) REFERENCES `status_senha` (`id`),
  CONSTRAINT `FK_users_tipo` FOREIGN KEY (`tipo_user_id`) REFERENCES `tipo_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.users_admin: ~10 rows (aproximadamente)
INSERT INTO `users_admin` (`id`, `name`, `uuid`, `telefone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `canal_id`, `tipo_user_id`, `status_id`, `status_senha_id`, `username`, `foto`, `guard`, `notificarAtivacaoLicenca`) VALUES
	(1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', NULL, '922969192', 'geral@mutue.net', '2020-05-08 13:24:57', '$2y$10$baLh/tZe8kXQJ9/Q/WXtueFTOBSq/h6TR6yxMUI7bQmAKbOA2w206', 'iSQUT6TSCBXB9saGXK7u56gqqIUjHfU8S172XSpeTKAPJw5upGUrlDDGYD0t', '2020-05-08 13:25:31', '2023-07-10 09:35:43', NULL, 3, 1, 1, 1, 'MUTUE SOLUÇÕES TECNOLÓGICAS INTELIGENTES LDA', 'admin/UMA.jpg', 'web', 'N'),
	(87, 'Domingos Gaspar', NULL, '926237716', 'domingos.gaspar@mutue.net', '2023-04-24 12:10:27', '$2y$10$baLh/tZe8kXQJ9/Q/WXtueFTOBSq/h6TR6yxMUI7bQmAKbOA2w206', NULL, '2023-04-24 13:10:27', '2023-11-22 14:57:15', NULL, 3, 1, 2, 1, 'Domingos Gaspar', 'utilizadores/cliente/avatarEmpresa.png', 'web', 'N'),
	(88, 'Zenilda Fila', NULL, '915108899', 'zenilda.fila@mutue.net', '2023-04-24 17:11:03', '$2y$10$Ev7u/fS4lZ9.16Z/VHbx/uFYm7ySvsRlVRbmEZwiXOW1qo1XinX..', NULL, '2023-04-24 18:11:03', '2023-11-22 14:58:44', NULL, 3, 1, 1, 1, 'Zenilda Fila', 'utilizadores/cliente/avatarEmpresa.png', 'web', 'Y'),
	(89, 'Osvaldo Ramos', NULL, '928277927', 'info.ramossoft@gmail.com', '2023-04-24 17:12:26', '$2y$10$baLh/tZe8kXQJ9/Q/WXtueFTOBSq/h6TR6yxMUI7bQmAKbOA2w206', NULL, '2023-04-24 18:12:26', '2023-11-22 14:58:58', NULL, 3, 1, 1, 1, 'Osvaldo Ramos', 'utilizadores/cliente/avatarEmpresa.png', 'web', 'Y'),
	(90, 'Gilberto', NULL, '999999999', 'socrates.gilberto@mutue.net', '2023-04-24 17:13:22', '$2y$10$baLh/tZe8kXQJ9/Q/WXtueFTOBSq/h6TR6yxMUI7bQmAKbOA2w206', NULL, '2023-04-24 18:13:22', '2023-11-22 14:59:06', NULL, 3, 1, 1, 1, 'Gilberto', 'utilizadores/cliente/avatarEmpresa.png', 'web', 'Y'),
	(91, 'Fernanda', NULL, '925445556', 'luzia.coma@mutue.net', '2023-04-24 17:14:58', '$2y$10$lFZKfSvr8qjZZEZMqZMeUOEr8hKdaPC1IumsRZ3Et5ltulCz85HSi', NULL, '2023-04-24 18:14:58', '2023-11-22 14:59:14', NULL, 3, 1, 2, 1, 'Luzia', 'utilizadores/cliente/avatarEmpresa.png', 'web', 'N'),
	(92, 'Osvaldo Duzentos', NULL, '925522789', 'osvaldo.duzentos@mutue.net', '2023-04-24 17:16:26', '$2y$10$usd2RN2ZmWQDKHt1fOxkLeQQfrspOEp.CJAGjHcbq8EZp238n8v06', NULL, '2023-04-24 18:16:26', '2023-11-22 14:59:22', NULL, 3, 1, 1, 1, 'Osvaldo Duzentos', 'utilizadores/cliente/avatarEmpresa.png', 'web', 'N'),
	(93, 'João Lourenço', NULL, '936037664', 'joaolourenco@gmail.com', '2023-11-17 19:15:49', '$2y$10$8s7lxTRySQrgjkQNZIjZJOpA6iOy0VOBfijkPlEDPTwbd.TXLtjGK', NULL, '2023-11-17 20:15:49', '2023-11-22 14:59:49', NULL, 3, 1, 1, 1, 'João Lourenço', 'utilizadores/cliente/avatarEmpresa.png', 'web', 'N'),
	(94, 'Emerson', NULL, '927326170', 'emersontixeira@gmail.com', '2023-11-17 19:18:34', '$2y$10$M9f5T4FvOkPhmoaPec0CKeuClg3Y/bWtbKFAhH5Nje2y.l6eprFTq', NULL, '2023-11-17 20:18:34', '2023-11-22 14:59:39', NULL, 3, 1, 1, 1, 'Emerson', 'utilizadores/cliente/avatarEmpresa.png', 'web', 'N'),
	(95, 'Mauro', NULL, '923298581', 'maurofrancisco@gmail.com', '2023-11-17 19:19:33', '$2y$10$hiAIOT/4pAvhElG6.7GP.eMfwoghAo7Dd/W4psjBDbsyfITvwAi82', NULL, '2023-11-17 20:19:33', '2023-11-22 14:59:31', NULL, 3, 1, 1, 1, 'Mauro', 'utilizadores/cliente/avatarEmpresa.png', 'web', 'N');

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.user_perfil
CREATE TABLE IF NOT EXISTS `user_perfil` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `perfil_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_profile_plan_id_foreign` (`user_id`),
  KEY `plan_profile_profile_id_foreign` (`perfil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=783 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.user_perfil: ~10 rows (aproximadamente)
INSERT INTO `user_perfil` (`id`, `user_id`, `perfil_id`) VALUES
	(1, 1, 1),
	(774, 87, 1),
	(775, 88, 26),
	(776, 89, 1),
	(777, 90, 26),
	(778, 91, 26),
	(779, 92, 26),
	(780, 95, 2),
	(781, 94, 2),
	(782, 93, 2);

-- A despejar estrutura para tabela mutue_negocios_aeroporto_admin.validacao_empresa
CREATE TABLE IF NOT EXISTS `validacao_empresa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `pais_id` int(10) unsigned NOT NULL,
  `expirado_em` datetime DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `nif` varchar(45) NOT NULL,
  `tipo_cliente_id` int(10) unsigned NOT NULL,
  `tipo_regime_id` int(10) unsigned DEFAULT NULL,
  `gestor_cliente_id` int(10) unsigned DEFAULT NULL,
  `canal_comunicacao_id` int(10) unsigned DEFAULT NULL,
  `logotipo` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  `pessoal_Contacto` varchar(145) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `file_alvara` varchar(255) DEFAULT NULL,
  `file_nif` varchar(255) DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT '0' COMMENT '0=>Não usado, 1=>usado',
  PRIMARY KEY (`id`),
  KEY `FK_empresas_pais` (`pais_id`),
  KEY `FK_empresas_tipo` (`tipo_cliente_id`),
  KEY `FK_empresas_tipos_regimes` (`tipo_regime_id`),
  KEY `FK_validacao_empresa_gestor_clientes` (`gestor_cliente_id`),
  KEY `FK_validacao_empresa_canais_comunicacoes` (`canal_comunicacao_id`),
  CONSTRAINT `FK_validacao_empresa_canais_comunicacoes` FOREIGN KEY (`canal_comunicacao_id`) REFERENCES `canais_comunicacoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_validacao_empresa_gestor_clientes` FOREIGN KEY (`gestor_cliente_id`) REFERENCES `gestor_clientes` (`id`),
  CONSTRAINT `FK_validacao_empresa_paises` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`),
  CONSTRAINT `FK_validacao_empresa_tipos_clientes` FOREIGN KEY (`tipo_cliente_id`) REFERENCES `tipos_clientes` (`id`),
  CONSTRAINT `FK_validacao_empresa_tipos_regimes` FOREIGN KEY (`tipo_regime_id`) REFERENCES `tipos_regimes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- A despejar dados para tabela mutue_negocios_aeroporto_admin.validacao_empresa: ~2 rows (aproximadamente)
INSERT INTO `validacao_empresa` (`id`, `nome`, `endereco`, `pais_id`, `expirado_em`, `token`, `nif`, `tipo_cliente_id`, `tipo_regime_id`, `gestor_cliente_id`, `canal_comunicacao_id`, `logotipo`, `website`, `remember_token`, `email`, `pessoal_Contacto`, `cidade`, `file_alvara`, `file_nif`, `used`) VALUES
	(3, 'República de Angola Aeroporto Internacional Dr. António Agostino Neto Operador Temporário Aeroportuário ATO - AIAAN', 'Estrada nacional 230, km 42 - Municipio do Icolo e Bengo, Distrito  do Bom Jesus, Luanda-Angola', 1, '2024-01-25 16:57:00', '852dd3bfc143c8220133a6df17df93dd', '5001720538', 1, 1, NULL, 2, 'utilizadores/cliente/avatarEmpresa.png', 'ato.ao', 'L3wDqq13RoshU1VEFbc7qzk7SdTxtSIGTGR93z4F', 'info@ato.ao', '937036111', 'Luanda', NULL, NULL, 0),
	(4, 'República de Angola Aeroporto Internacional Dr. António Agostino Neto Operador Temporário Aeroportuário ATO - AIAAN', 'Estrada nacional 230, km 42 - Municipio do Icolo e Bengo, Distrito  do Bom Jesus, Luanda-Angola', 1, '2024-01-25 17:10:00', '49aa1328f0076636438e2f579fee2b6b', '5001720538', 1, 1, NULL, 2, 'utilizadores/cliente/avatarEmpresa.png', 'ato.ao', '6R4VS6A2D7vygUKn90UKjg986k35EL9d94JezSGY', 'info@ato.ao', '937036322', 'Luanda', NULL, NULL, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
