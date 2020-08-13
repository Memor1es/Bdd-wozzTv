-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 13 août 2020 à 01:40
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fxserver`
--

-- --------------------------------------------------------

--
-- Structure de la table `advanced_report`
--

CREATE TABLE `advanced_report` (
  `name` varchar(50) DEFAULT NULL,
  `args` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `advanced_report`
--

INSERT INTO `advanced_report` (`name`, `args`) VALUES
('B a j à', 'slt'),
('B a j à', 'bjr');

-- --------------------------------------------------------

--
-- Structure de la table `ballas`
--

CREATE TABLE `ballas` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ballas`
--

INSERT INTO `ballas` (`identifier`, `rank`) VALUES
('steam:110000104b6b873', 'Recrue'),
('steam:110000113f1c845', 'Recrue'),
('steam:11000011ac33eea', 'Recrue'),
('steam:11000013226b3d5', 'Recrue'),
('steam:110000135760edf', 'Recrue'),
('steam:1100001364344d6', 'Recrue'),
('steam:110000136c0c4ec', 'Recrue'),
('steam:11000014133e199', 'Recrue');

-- --------------------------------------------------------

--
-- Structure de la table `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `camorra`
--

CREATE TABLE `camorra` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `clothes_outfits`
--

CREATE TABLE `clothes_outfits` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `category` varchar(50) NOT NULL DEFAULT '0',
  `skin_model` varchar(50) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT 0,
  `arm` int(11) NOT NULL DEFAULT 0,
  `arm_txt` int(11) NOT NULL DEFAULT 0,
  `tshirt` int(11) NOT NULL DEFAULT 0,
  `tshirt_txt` int(11) NOT NULL DEFAULT 0,
  `jacket` int(11) NOT NULL DEFAULT 0,
  `jacket_txt` int(11) NOT NULL DEFAULT 0,
  `pant` int(11) NOT NULL DEFAULT 0,
  `pant_txt` int(11) NOT NULL DEFAULT 0,
  `shoe` int(11) NOT NULL DEFAULT 0,
  `shoe_txt` int(11) NOT NULL DEFAULT 0,
  `glasses` int(11) NOT NULL DEFAULT 0,
  `glasses_txt` int(11) NOT NULL DEFAULT 0,
  `hat` int(11) NOT NULL DEFAULT 0,
  `hat_txt` int(11) NOT NULL DEFAULT 0,
  `mask` int(11) NOT NULL DEFAULT 0,
  `mask_txt` int(11) NOT NULL DEFAULT 0,
  `shield` int(11) NOT NULL DEFAULT 0,
  `shield_txt` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clothes_outfits`
--

INSERT INTO `clothes_outfits` (`id`, `name`, `category`, `skin_model`, `price`, `arm`, `arm_txt`, `tshirt`, `tshirt_txt`, `jacket`, `jacket_txt`, `pant`, `pant_txt`, `shoe`, `shoe_txt`, `glasses`, `glasses_txt`, `hat`, `hat_txt`, `mask`, `mask_txt`, `shield`, `shield_txt`) VALUES
(186, 'Dessous Coeur Rose', '0', 'mp_f_freemode_01', 750, 4, 0, 3, 0, 111, 5, 63, 5, 41, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(185, 'Dessous Noir Rose', '0', 'mp_f_freemode_01', 750, 4, 0, 3, 0, 111, 6, 62, 6, 42, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(184, 'Dessous N-Leopard', '0', 'mp_f_freemode_01', 750, 4, 0, 3, 0, 111, 4, 63, 4, 41, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(183, 'Perroquet', '0', 'mp_f_freemode_01', 1500, 4, 0, 2, 0, 33, 4, 25, 12, 3, 13, 0, 0, 0, 0, 0, 0, 0, 0),
(182, 'Short leopard', '0', 'mp_f_freemode_01', 1500, 5, 0, 4, 14, 35, 9, 25, 4, 21, 9, 0, 0, 0, 0, 0, 0, 0, 0),
(181, 'Mauvais gout', '0', 'mp_f_freemode_01', 500, 5, 0, 28, 7, 31, 2, 27, 12, 22, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(180, 'Pull Noir', '0', 'mp_f_freemode_01', 1500, 3, 0, 14, 0, 43, 0, 30, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(179, 'Jupe à pois', '0', 'mp_f_freemode_01', 1500, 1, 0, 0, 7, 1, 0, 8, 12, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(178, 'Papillon Gris', '0', 'mp_f_freemode_01', 1500, 4, 0, 2, 0, 4, 14, 8, 11, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(177, 'Jean Blouz cuir', '0', 'mp_f_freemode_01', 1500, 5, 0, 0, 10, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(176, 'Corset Rose', '0', 'mp_f_freemode_01', 1500, 4, 0, 2, 0, 13, 7, 0, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(175, 'Jupe Indien', '0', 'mp_f_freemode_01', 1500, 5, 0, 4, 13, 1, 5, 8, 8, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(174, 'Veste Carreaux Rose', '0', 'mp_f_freemode_01', 1500, 5, 0, 23, 1, 24, 6, 8, 0, 19, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(173, 'Tailleur Beige Noir', '0', 'mp_f_freemode_01', 1500, 6, 0, 23, 1, 25, 10, 23, 10, 19, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(172, 'Jean TS Rose', '0', 'mp_f_freemode_01', 1500, 2, 0, 2, 0, 2, 7, 0, 8, 6, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(171, 'Pant Carreaux', '0', 'mp_f_freemode_01', 1500, 0, 0, 2, 0, 27, 4, 23, 4, 19, 8, 0, 0, 0, 0, 0, 0, 0, 0),
(170, 'Indiana', '0', 'mp_f_freemode_01', 1500, 0, 0, 24, 2, 28, 4, 11, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(169, 'Veste cuir Noir', '0', 'mp_f_freemode_01', 1500, 64, 0, 5, 7, 8, 2, 11, 1, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(168, 'Carreaux Vert', '0', 'mp_f_freemode_01', 1500, 9, 0, 3, 0, 9, 13, 1, 10, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0),
(167, 'Noir Bleu', '0', 'mp_f_freemode_01', 1500, 2, 0, 3, 0, 2, 2, 11, 4, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(166, 'Pant Beige', '0', 'mp_f_freemode_01', 1500, 4, 0, 3, 0, 4, 14, 3, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(165, 'Slim Noir', '0', 'mp_f_freemode_01', 1500, 7, 0, 13, 0, 10, 15, 27, 0, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(164, 'employée', '0', 'mp_f_freemode_01', 2500, 14, 0, 2, 0, 124, 0, 65, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(163, 'Joke-r2', '0', 'mp_m_freemode_01', 2500, 75, 0, 27, 3, 24, 2, 22, 2, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(162, 'Claquette Chemise', '0', 'mp_m_freemode_01', 2500, 1, 0, 15, 0, 12, 5, 48, 2, 16, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(161, 'Cuir Pant', '0', 'mp_m_freemode_01', 2500, 20, 2, 15, 0, 61, 3, 24, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(160, 'Mariage', '0', 'mp_f_freemode_01', 2500, 4, 0, 3, 0, 116, 0, 19, 5, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(159, 'Jupapaillettes', '12', 'mp_f_freemode_01', 1500, 6, 0, 23, 0, 7, 1, 9, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(158, 'Jean Cuir', '0', 'mp_m_freemode_01', 2500, 6, 0, 0, 2, 163, 0, 1, 14, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(157, 'Veste Rouge', '0', 'mp_m_freemode_01', 2500, 6, 0, 0, 2, 4, 2, 10, 0, 12, 9, 0, 0, 0, 0, 0, 0, 0, 0),
(156, 'Jean Gris', '0', 'mp_m_freemode_01', 2500, 6, 0, 0, 2, 156, 2, 43, 1, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(155, 'Tailleur C-Rose', '0', 'mp_f_freemode_01', 2500, 4, 0, 3, 0, 173, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(154, 'Bike noir', '0', 'mp_m_freemode_01', 2500, 21, 0, 0, 2, 179, 0, 76, 7, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(153, 'Mr Pink', '0', 'mp_m_freemode_01', 1500, 1, 0, 15, 0, 200, 8, 16, 9, 32, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(152, 'Rayure', '0', 'mp_f_freemode_01', 2000, 15, 0, 3, 0, 32, 2, 78, 3, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(151, 'Banale', '0', 'mp_m_freemode_01', 1500, 1, 0, 15, 0, 12, 3, 25, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(150, 'Cuir noir', '0', 'mp_f_freemode_01', 1000, 4, 0, 3, 0, 173, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(149, 'Laitière', '0', 'mp_m_freemode_01', 1500, 11, 0, 15, 0, 13, 0, 24, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(148, 'Cargo bleu', '0', 'mp_f_freemode_01', 1500, 4, 0, 3, 0, 16, 4, 45, 2, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0),
(147, 'Plage NB', '0', 'mp_f_freemode_01', 1000, 11, 0, 3, 0, 208, 5, 16, 4, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(146, 'Plage Rose', '0', 'mp_f_freemode_01', 1000, 11, 0, 3, 0, 208, 13, 16, 2, 16, 8, 0, 0, 0, 0, 0, 0, 0, 0),
(145, 'Street 2', '0', 'mp_m_freemode_01', 2000, 14, 0, 8, 0, 191, 25, 62, 2, 43, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(144, 'Motard S-manche', '0', 'mp_m_freemode_01', 2000, 0, 0, 85, 16, 175, 3, 76, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(143, 'Joke-r', '0', 'mp_m_freemode_01', 2000, 14, 0, 26, 2, 58, 0, 22, 2, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(142, 'Hipster', '0', 'mp_m_freemode_01', 2000, 11, 0, 0, 2, 191, 8, 26, 0, 31, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(141, 'City NB', '0', 'mp_f_freemode_01', 2000, 1, 0, 0, 13, 64, 1, 4, 3, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(140, 'Cross Jaune', '0', 'mp_m_freemode_01', 2500, 110, 3, 15, 0, 148, 5, 67, 5, 47, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(124, 'Biker rose', '0', 'mp_f_freemode_01', 1500, 5, 0, 16, 3, 8, 2, 44, 0, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0),
(125, 'Mini short', '0', 'mp_f_freemode_01', 1500, 12, 0, 2, 0, 26, 3, 25, 6, 44, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(132, 'Red Black', '0', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 146, 2, 9, 7, 32, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(126, 'Badass', '0', 'mp_f_freemode_01', 1500, 32, 0, 60, 1, 154, 1, 75, 1, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(127, 'Tailleur Pant', '0', 'mp_f_freemode_01', 1500, 3, 0, 40, 2, 57, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(129, 'Décontracté marron', '0', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 16, 1, 8, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(128, 'Salopette', '0', 'mp_f_freemode_01', 1500, 4, 0, 2, 0, 0, 5, 93, 2, 33, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(130, 'Carreaux Bleu', '0', 'mp_m_freemode_01', 1500, 11, 0, 6, 0, 120, 4, 27, 5, 40, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(131, 'Casual Bleu', '0', 'mp_m_freemode_01', 1500, 1, 0, 15, 0, 12, 11, 63, 0, 22, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(133, 'Cross Violet', '0', 'mp_f_freemode_01', 2500, 127, 10, 3, 0, 145, 10, 69, 10, 48, 10, 0, 0, 0, 0, 0, 0, 0, 0),
(134, 'Cross Rouge', '0', 'mp_f_freemode_01', 2500, 127, 1, 3, 0, 145, 1, 69, 1, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(135, 'Cross Bleu', '0', 'mp_f_freemode_01', 2500, 127, 7, 3, 0, 145, 7, 69, 7, 48, 7, 0, 0, 0, 0, 0, 0, 0, 0),
(136, 'Cross Jaune', '0', 'mp_f_freemode_01', 2500, 127, 3, 3, 0, 145, 5, 69, 5, 48, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(137, 'Cross Violet', '0', 'mp_m_freemode_01', 2500, 110, 10, 15, 0, 148, 10, 67, 10, 47, 10, 0, 0, 0, 0, 0, 0, 0, 0),
(138, 'Cross Rouge', '0', 'mp_m_freemode_01', 2500, 110, 1, 15, 0, 148, 1, 67, 1, 47, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(139, 'Cross Bleu', '0', 'mp_m_freemode_01', 2500, 110, 7, 15, 0, 148, 7, 67, 7, 47, 7, 0, 0, 0, 0, 0, 0, 0, 0),
(123, 'Chic noir', '0', 'mp_m_freemode_01', 1500, 11, 0, 7, 0, 11, 1, 13, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(122, 'Jean\'s 3', '0', 'mp_m_freemode_01', 1500, 14, 0, 76, 0, 172, 1, 75, 0, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(121, 'Jean\'s 2', '0', 'mp_m_freemode_01', 1500, 14, 0, 76, 0, 172, 3, 75, 7, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(120, 'Biker 2', '0', 'mp_m_freemode_01', 1500, 14, 0, 14, 0, 174, 0, 72, 3, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(119, 'Rue 3', '0', 'mp_f_freemode_01', 1500, 12, 0, 2, 0, 207, 4, 45, 1, 33, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(118, 'Classic 2', '0', 'mp_f_freemode_01', 1810, 4, 0, 2, 0, 32, 1, 0, 0, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(117, 'Jean 2', '0', 'mp_f_freemode_01', 2050, 14, 0, 80, 1, 174, 1, 73, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(116, 'Jean 1', '0', 'mp_f_freemode_01', 2050, 14, 0, 30, 3, 166, 1, 11, 1, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(115, 'Rebelle', '0', 'mp_f_freemode_01', 2250, 15, 0, 80, 3, 154, 0, 73, 4, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(114, 'Topless 2', '0', 'mp_f_freemode_01', 750, 15, 0, 2, 0, 82, 0, 62, 2, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(113, 'Topless 1', '0', 'mp_f_freemode_01', 750, 15, 0, 2, 0, 82, 0, 62, 11, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(112, 'Malibu', '0', 'mp_f_freemode_01', 3720, 11, 0, 14, 0, 11, 10, 17, 4, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(111, 'Maillot Léopard', '0', 'mp_f_freemode_01', 1550, 15, 0, 15, 0, 18, 3, 17, 3, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(110, 'Maillot Noir', '0', 'mp_f_freemode_01', 1000, 15, 0, 15, 0, 18, 1, 17, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(109, 'Comptable', '0', 'mp_m_freemode_01', 3400, 4, 0, 22, 4, 25, 9, 22, 8, 20, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(108, 'Old Class', '0', 'mp_m_freemode_01', 4000, 4, 0, 32, 0, 32, 6, 25, 1, 21, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(107, 'Élégant', '0', 'mp_m_freemode_01', 4261, 4, 0, 25, 8, 23, 2, 48, 1, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(106, 'Full Jean', '0', 'mp_m_freemode_01', 1500, 4, 0, 90, 0, 169, 0, 0, 1, 55, 7, 0, 0, 0, 0, 0, 0, 0, 0),
(105, 'Biker Style', '0', 'mp_m_freemode_01', 1850, 15, 0, 15, 0, 176, 0, 71, 0, 56, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(104, 'Racaille', '0', 'mp_m_freemode_01', 1000, 0, 0, 15, 0, 128, 0, 55, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(103, 'Pas trop chaud', '0', 'mp_m_freemode_01', 2000, 4, 0, 71, 5, 140, 9, 23, 8, 20, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(102, 'Costar Noir', '0', 'mp_m_freemode_01', 3000, 1, 0, 34, 1, 31, 0, 10, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(101, 'Costar Blanc', '0', 'mp_m_freemode_01', 3000, 1, 0, 34, 4, 31, 7, 20, 0, 15, 9, 0, 0, 0, 0, 0, 0, 0, 0),
(100, 'Costar Gris', '0', 'mp_m_freemode_01', 3000, 4, 0, 32, 0, 31, 1, 25, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99, 'Décontracté 2', '0', 'mp_m_freemode_01', 2200, 1, 0, 63, 0, 4, 0, 25, 1, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(98, 'Simple', '0', 'mp_f_freemode_01', 1500, 2, 0, 15, 0, 2, 2, 25, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97, 'Robe Fleur', '0', 'mp_f_freemode_01', 1500, 4, 0, 34, 0, 37, 5, 17, 8, 13, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(96, 'Hentai', '0', 'mp_f_freemode_01', 1500, 4, 0, 34, 0, 33, 6, 27, 11, 8, 13, 0, 0, 0, 0, 0, 0, 0, 0),
(95, 'Comando', '0', 'mp_f_freemode_01', 1500, 11, 0, 3, 0, 117, 1, 30, 4, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(94, 'Robe', '0', 'mp_f_freemode_01', 1500, 15, 0, 15, 0, 112, 0, 14, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(93, 'Peignoir', '0', 'mp_f_freemode_01', 1500, 0, 0, 15, 0, 105, 0, 57, 0, 16, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(89, 'Ville 2', '0', 'mp_f_freemode_01', 1500, 12, 0, 14, 0, 12, 8, 23, 0, 42, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(88, 'Noir et Blanc', '0', 'mp_f_freemode_01', 1500, 4, 0, 15, 0, 13, 14, 24, 7, 19, 9, 0, 0, 0, 0, 0, 0, 0, 0),
(87, 'Soirée', '0', 'mp_f_freemode_01', 1500, 4, 0, 15, 0, 13, 6, 9, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(86, 'Ecoissaise', '0', 'mp_f_freemode_01', 1500, 4, 0, 15, 0, 13, 5, 12, 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(85, 'Classic', '0', 'mp_f_freemode_01', 1500, 1, 0, 27, 2, 35, 5, 23, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(92, 'fan de country', '0', 'mp_m_freemode_01', 1500, 11, 0, 15, 0, 95, 2, 4, 1, 37, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(91, 'Pyjama', '0', 'mp_m_freemode_01', 3400, 14, 0, 15, 0, 145, 0, 65, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(90, 'Riche', '0', 'mp_m_freemode_01', 3400, 4, 0, 72, 5, 108, 4, 45, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(84, 'Homme d affaire', '0', 'mp_m_freemode_01', 2300, 4, 0, 72, 1, 31, 1, 25, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(83, 'Décontracté', '0', 'mp_m_freemode_01', 1500, 11, 0, 15, 0, 105, 0, 23, 12, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(82, 'Discret', '0', 'mp_m_freemode_01', 1500, 14, 0, 18, 0, 68, 2, 8, 0, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(81, 'Parrain noir', '0', 'mp_m_freemode_01', 3000, 14, 0, 69, 0, 20, 2, 20, 2, 20, 7, 0, 0, 0, 0, 0, 0, 0, 0),
(80, 'Parrain blanc', '0', 'mp_m_freemode_01', 3000, 14, 0, 69, 0, 20, 0, 20, 0, 20, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(79, 'Militaire', '0', 'mp_m_freemode_01', 2000, 0, 0, 15, 0, 97, 1, 31, 4, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78, 'Lambda 2', '0', 'mp_m_freemode_01', 1500, 14, 0, 47, 0, 7, 7, 15, 1, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(77, 'Lambda', '0', 'mp_m_freemode_01', 1500, 8, 0, 15, 0, 38, 3, 27, 8, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(76, 'Vieu jeu', '0', 'mp_m_freemode_01', 1200, 19, 1, 38, 0, 156, 1, 25, 0, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(75, 'Columbo', '0', 'mp_m_freemode_01', 2100, 11, 0, 10, 0, 77, 1, 25, 6, 21, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(74, 'Djeunes', '0', 'mp_m_freemode_01', 1500, 14, 0, 47, 1, 74, 4, 37, 2, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(73, 'Sport', '0', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 150, 3, 64, 10, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0),
(72, 'Stylisé', '0', 'mp_m_freemode_01', 1500, 1, 0, 24, 0, 69, 5, 4, 4, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(71, 'Simple', '0', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 1, 4, 9, 1, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(70, 'Ville', '0', 'mp_m_freemode_01', 1500, 1, 0, 0, 2, 62, 0, 4, 1, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0),
(69, 'Asiatique', '0', 'mp_m_freemode_01', 2000, 14, 0, 15, 0, 107, 4, 37, 2, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(68, 'Secrétaire', '0', 'mp_f_freemode_01', 1500, 6, 0, 22, 0, 66, 3, 9, 6, 20, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(67, 'Discrète', '0', 'mp_f_freemode_01', 1500, 5, 0, 23, 9, 64, 1, 27, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(66, 'Chic', '0', 'mp_f_freemode_01', 2000, 5, 0, 20, 1, 65, 3, 43, 2, 22, 10, 0, 0, 0, 0, 0, 0, 0, 0),
(65, 'Croft', '0', 'mp_f_freemode_01', 5000, 63, 0, 5, 0, 16, 2, 25, 6, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(64, 'Fan de country', '0', 'mp_f_freemode_01', 1500, 0, 0, 15, 0, 9, 13, 0, 12, 38, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(63, 'Randonnée', '0', 'mp_f_freemode_01', 1500, 14, 0, 10, 0, 73, 2, 14, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(62, 'Ecolière', '0', 'mp_f_freemode_01', 1500, 0, 0, 10, 0, 27, 0, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(61, 'Tenue de nuit', '0', 'mp_f_freemode_01', 750, 2, 0, 6, 0, 38, 3, 62, 2, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60, 'La rue 2', '0', 'mp_f_freemode_01', 1500, 3, 0, 2, 0, 3, 4, 4, 1, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(59, 'La rue 1', '0', 'mp_f_freemode_01', 1500, 4, 0, 2, 0, 118, 0, 45, 2, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(58, 'Working Girl 2', '0', 'mp_f_freemode_01', 2000, 7, 0, 64, 0, 57, 0, 6, 0, 42, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(57, 'Ville - Moderne', '0', 'mp_f_freemode_01', 1500, 5, 0, 16, 0, 64, 3, 4, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(56, 'Casual', '0', 'mp_f_freemode_01', 1500, 9, 0, 7, 0, 9, 9, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(55, 'TenueNoir', '0', 'mp_f_freemode_01', 1825, 5, 0, 2, 0, 79, 0, 3, 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 'NewStyle', '0', 'mp_f_freemode_01', 2650, 6, 0, 66, 3, 70, 1, 54, 2, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 'Classy', '0', 'mp_f_freemode_01', 1750, 6, 0, 59, 1, 66, 0, 6, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 'TenueNoir', '0', 'mp_m_freemode_01', 1825, 1, 0, 44, 0, 64, 0, 4, 0, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 'NewStyle', '0', 'mp_m_freemode_01', 2650, 6, 0, 15, 0, 50, 0, 1, 1, 12, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 'Classy', '0', 'mp_m_freemode_01', 1750, 6, 0, 32, 2, 27, 0, 24, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, 'Biker', '0', 'mp_m_freemode_01', 2500, 1, 0, 1, 0, 151, 1, 1, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 'Ville - bad boy', '0', 'mp_m_freemode_01', 1500, 1, 0, 0, 7, 62, 0, 0, 1, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 'Détente au soleil', '0', 'mp_m_freemode_01', 1000, 15, 0, 15, 0, 15, 0, 54, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 'Chic noir et gris', '0', 'mp_m_freemode_01', 1500, 11, 0, 7, 0, 11, 0, 25, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 'Pull à capuche', '0', 'mp_m_freemode_01', 1500, 4, 0, 15, 0, 96, 0, 43, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 'Veste en cuir - Jean', '0', 'mp_m_freemode_01', 2000, 1, 0, 1, 4, 122, 8, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 'Short - Pull blanc', '0', 'mp_m_freemode_01', 1500, 1, 0, 15, 0, 134, 2, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 'Short - Pull rouge', '0', 'mp_m_freemode_01', 1500, 1, 0, 15, 0, 134, 1, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 'BlingBling', 'skincreator', 'mp_f_freemode_01', 2500, 6, 0, 1, 0, 65, 8, 26, 0, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 'BaBaCool', 'skincreator', 'mp_f_freemode_01', 1500, 0, 0, 15, 0, 123, 3, 66, 2, 1, 14, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 'Casual', 'skincreator', 'mp_f_freemode_01', 1500, 14, 0, 15, 0, 14, 10, 0, 1, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 'Short - Pull noir', '0', 'mp_m_freemode_01', 1500, 1, 0, 15, 0, 134, 0, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 'BarMaid', 'skincreator', 'mp_f_freemode_01', 2000, 0, 0, 24, 4, 28, 9, 23, 7, 19, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 'Motarde', 'skincreator', 'mp_f_freemode_01', 1500, 23, 0, 15, 0, 110, 7, 43, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 'Working Girl', 'skincreator', 'mp_f_freemode_01', 2000, 5, 0, 64, 0, 93, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 'Plage', 'skincreator', 'mp_f_freemode_01', 750, 15, 0, 2, 0, 15, 10, 10, 2, 5, 13, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 'Fatal', 'skincreator', 'mp_f_freemode_01', 1500, 15, 0, 2, 0, 26, 2, 27, 4, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 'Jean\'s 1', 'skincreator', 'mp_f_freemode_01', 1500, 9, 0, 0, 0, 9, 2, 8, 2, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 'Sous vetement', 'skincreator', 'mp_m_freemode_01', 500, 15, 0, 15, 0, 15, 7, 21, 0, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 'BlingBling', 'skincreator', 'mp_m_freemode_01', 2500, 14, 0, 15, 0, 70, 7, 20, 2, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 'BaBaCool', 'skincreator', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 121, 3, 62, 1, 3, 15, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 'Casual Liberty', 'skincreator', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 131, 0, 48, 1, 40, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 'Casual Chic', 'skincreator', 'mp_m_freemode_01', 2000, 4, 0, 32, 2, 142, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 'Short - Tshirt', '0', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 131, 0, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 'Barman', 'skincreator', 'mp_m_freemode_01', 2000, 11, 0, 7, 0, 40, 1, 20, 0, 15, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 'Motard', 'skincreator', 'mp_m_freemode_01', 1500, 4, 0, 27, 2, 37, 1, 24, 0, 26, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 'Plage', 'skincreator', 'mp_m_freemode_01', 750, 5, 0, 15, 1, 17, 2, 14, 12, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'Loveur', 'skincreator', 'mp_m_freemode_01', 2000, 4, 0, 21, 1, 4, 2, 20, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'Street', 'skincreator', 'mp_m_freemode_01', 1500, 4, 0, 15, 0, 14, 13, 9, 7, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 'Diablesse', 'skincreator', 'mp_f_freemode_01', 1500, 15, 0, 15, 0, 4, 13, 2, 2, 11, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 'Sportive', 'skincreator', 'mp_f_freemode_01', 1500, 1, 0, 22, 2, 10, 0, 14, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 'Jeune', 'skincreator', 'mp_f_freemode_01', 1500, 1, 0, 0, 9, 1, 11, 8, 7, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 'Normale', 'skincreator', 'mp_f_freemode_01', 1500, 4, 0, 14, 0, 0, 11, 1, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 'Garçon manqué', 'skincreator', 'mp_f_freemode_01', 1500, 3, 0, 14, 0, 3, 1, 1, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 'Gangsta', 'skincreator', 'mp_f_freemode_01', 1500, 4, 0, 15, 0, 5, 0, 3, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Sportif', 'skincreator', 'mp_m_freemode_01', 1500, 6, 0, 0, 3, 3, 15, 3, 15, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Le Quartier', 'skincreator', 'mp_m_freemode_01', 1500, 6, 0, 5, 2, 7, 0, 7, 12, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Ordinaire', 'skincreator', 'mp_m_freemode_01', 1500, 6, 0, 5, 0, 3, 0, 2, 11, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 'Bronzage', 'skincreator', 'mp_m_freemode_01', 1500, 5, 0, 15, 0, 5, 7, 16, 11, 16, 9, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Mauvais Goût', 'skincreator', 'mp_m_freemode_01', 1500, 5, 0, 15, 0, 5, 0, 12, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Négligé', 'skincreator', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 22, 1, 5, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(187, 'Dessous Rose Merron', '0', 'mp_f_freemode_01', 750, 4, 0, 3, 0, 111, 0, 62, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(188, 'Dessous Coeur Rouge', '0', 'mp_f_freemode_01', 750, 4, 0, 3, 0, 111, 7, 63, 7, 41, 7, 0, 0, 0, 0, 0, 0, 0, 0),
(189, 'Dessous Bleu', '0', 'mp_f_freemode_01', 750, 4, 0, 3, 0, 111, 3, 62, 3, 42, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(190, 'Pant beige TS blanc', '0', 'mp_f_freemode_01', 1500, 11, 0, 3, 0, 117, 0, 64, 0, 44, 7, 0, 0, 0, 0, 0, 0, 0, 0),
(191, 'Pull Gris', '0', 'mp_f_freemode_01', 1500, 1, 0, 3, 0, 79, 1, 0, 0, 43, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(192, 'TS Noir Milli Beige ', '0', 'mp_f_freemode_01', 2500, 70, 0, 3, 0, 73, 1, 49, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(193, 'Calecon Coeur Rose', '0', 'mp_m_freemode_01', 750, 15, 0, 15, 0, 15, 0, 61, 5, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(194, 'Tarzan', '0', 'mp_m_freemode_01', 750, 15, 0, 15, 0, 15, 0, 61, 3, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(195, 'Costume Carreaux', '0', 'mp_m_freemode_01', 2500, 4, 0, 21, 4, 119, 2, 60, 2, 40, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(196, 'Gilet Costume Carreaux', '0', 'mp_m_freemode_01', 2500, 4, 0, 22, 4, 120, 9, 60, 9, 40, 9, 0, 0, 0, 0, 0, 0, 0, 0),
(197, 'Jogging Rouge', '0', 'mp_m_freemode_01', 1500, 6, 0, 15, 0, 113, 0, 55, 1, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(198, 'Jogging Gris', '0', 'mp_m_freemode_01', 1500, 6, 0, 15, 0, 113, 1, 55, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(199, 'Costume Basket', '0', 'mp_m_freemode_01', 2500, 4, 0, 31, 0, 32, 1, 25, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200, 'Costume Noir', '0', 'mp_m_freemode_01', 2500, 4, 0, 10, 0, 28, 0, 25, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(201, 'Veste rouge et noir', '0', 'mp_m_freemode_01', 1500, 4, 0, 23, 0, 122, 5, 43, 1, 42, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(202, 'Chaud mais pas trop', '0', 'mp_m_freemode_01', 1500, 4, 0, 23, 1, 122, 12, 15, 3, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(203, 'Gilet bleu carreaux', '0', 'mp_m_freemode_01', 2500, 4, 0, 22, 4, 120, 11, 60, 11, 40, 11, 0, 0, 0, 0, 0, 0, 0, 0),
(204, 'Veste verte', '0', 'mp_m_freemode_01', 2500, 4, 0, 10, 2, 23, 0, 23, 8, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0),
(205, 'Gilet Marron', '0', 'mp_m_freemode_01', 2500, 11, 0, 6, 12, 25, 9, 23, 8, 21, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(206, 'Chemise Carreaux Gris', '0', 'mp_m_freemode_01', 1500, 4, 0, 15, 0, 14, 11, 1, 15, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0),
(207, 'Tee-S Bleu', '0', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 0, 8, 7, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0),
(208, 'Cuir Marron', '0', 'mp_m_freemode_01', 2000, 1, 0, 2, 11, 6, 6, 8, 0, 14, 8, 0, 0, 0, 0, 0, 0, 0, 0),
(209, 'Costume Marron', '0', 'mp_m_freemode_01', 2500, 12, 0, 32, 14, 31, 6, 25, 6, 10, 12, 0, 0, 0, 0, 0, 0, 0, 0),
(210, 'Short Pull Gris', '0', 'mp_m_freemode_01', 1500, 6, 0, 15, 0, 78, 4, 12, 5, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(211, 'Basketteur', '0', 'mp_m_freemode_01', 1500, 4, 0, 15, 0, 87, 2, 42, 1, 32, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(212, 'Manteaux Long Gris', '0', 'mp_m_freemode_01', 2500, 33, 0, 10, 0, 77, 0, 37, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(213, 'Tee-S Gold', '0', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 71, 0, 37, 1, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(214, 'Bling leopard', '0', 'mp_m_freemode_01', 2500, 4, 0, 10, 2, 70, 1, 26, 9, 28, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(215, 'Blouson fourrure blanc ', '0', 'mp_m_freemode_01', 2500, 6, 0, 5, 0, 70, 4, 26, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(216, 'Ville - Bad Boy 2', '0', 'mp_m_freemode_01', 2000, 4, 0, 23, 2, 62, 0, 0, 4, 22, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(217, 'Urban Classic', '0', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 80, 0, 43, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(218, 'Agent Sécu', '0', 'mp_m_freemode_01', 2500, 4, 0, 10, 0, 59, 2, 37, 2, 11, 12, 0, 0, 0, 0, 0, 0, 0, 0),
(219, 'Sweet Bleu', '0', 'mp_m_freemode_01', 1500, 1, 0, 1, 0, 7, 4, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(220, 'Polo', '0', 'mp_m_freemode_01', 1500, 0, 0, 15, 0, 9, 2, 1, 1, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(221, 'Slim Chemise', '0', 'mp_m_freemode_01', 1500, 1, 0, 15, 0, 12, 1, 4, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0),
(222, 'CJ', '0', 'mp_m_freemode_01', 1500, 5, 0, 15, 0, 5, 0, 7, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(223, 'Commercial', '0', 'mp_m_freemode_01', 2500, 4, 0, 10, 15, 4, 0, 10, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(224, 'Concessionaire', '0', 'mp_m_freemode_01', 2000, 1, 0, 60, 0, 59, 1, 37, 1, 21, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(225, 'Lambda 3', '0', 'mp_m_freemode_01', 1500, 11, 0, 6, 11, 25, 0, 22, 7, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(226, 'Lambda 4', '0', 'mp_m_freemode_01', 1500, 4, 0, 15, 0, 14, 3, 8, 3, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0),
(227, '80\'S', '0', 'mp_m_freemode_01', 1500, 14, 0, 23, 0, 74, 6, 26, 6, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(228, 'Valkyrie', '0', 'mp_m_freemode_01', 1500, 14, 0, 65, 3, 74, 5, 7, 4, 22, 11, 0, 0, 0, 0, 0, 0, 0, 0),
(229, 'Collégien', '0', 'mp_m_freemode_01', 1500, 4, 0, 23, 0, 88, 0, 43, 1, 32, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(230, 'Jogging Bleu', '0', 'mp_m_freemode_01', 1500, 6, 0, 15, 0, 113, 3, 55, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(231, 'Chic Marron Rouge', '0', 'mp_m_freemode_01', 2500, 11, 0, 6, 12, 25, 9, 23, 8, 21, 3, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `clothes_props`
--

CREATE TABLE `clothes_props` (
  `id` int(11) NOT NULL,
  `model` varchar(50) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT 500,
  `category` varchar(50) DEFAULT '0',
  `item_id` int(11) DEFAULT 0,
  `item_txt_allowed` varchar(255) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clothes_props`
--

INSERT INTO `clothes_props` (`id`, `model`, `price`, `category`, `item_id`, `item_txt_allowed`) VALUES
(1, 'mp_m_freemode_01', 500, 'hat', 2, '0'),
(2, 'mp_m_freemode_01', 500, 'hat', 4, '0'),
(3, 'mp_m_freemode_01', 500, 'hat', 5, '0'),
(4, 'mp_m_freemode_01', 500, 'hat', 6, '0'),
(5, 'mp_m_freemode_01', 500, 'hat', 7, '0'),
(6, 'mp_m_freemode_01', 500, 'hat', 12, '0'),
(7, 'mp_m_freemode_01', 500, 'hat', 13, '0'),
(8, 'mp_m_freemode_01', 500, 'hat', 14, '0'),
(9, 'mp_m_freemode_01', 500, 'hat', 15, '0'),
(10, 'mp_m_freemode_01', 500, 'hat', 16, '0'),
(11, 'mp_m_freemode_01', 500, 'hat', 17, '0'),
(12, 'mp_m_freemode_01', 500, 'hat', 18, '0'),
(13, 'mp_m_freemode_01', 500, 'hat', 19, '0'),
(14, 'mp_m_freemode_01', 500, 'hat', 20, '0'),
(15, 'mp_m_freemode_01', 500, 'hat', 21, '0'),
(16, 'mp_m_freemode_01', 500, 'hat', 25, '0'),
(17, 'mp_m_freemode_01', 500, 'hat', 26, '0'),
(18, 'mp_m_freemode_01', 500, 'hat', 27, '0'),
(19, 'mp_m_freemode_01', 500, 'hat', 28, '0'),
(20, 'mp_m_freemode_01', 500, 'hat', 29, '0'),
(21, 'mp_m_freemode_01', 500, 'hat', 30, '0'),
(22, 'mp_m_freemode_01', 500, 'hat', 31, '0'),
(23, 'mp_m_freemode_01', 500, 'hat', 44, '0'),
(24, 'mp_m_freemode_01', 500, 'hat', 45, '0'),
(25, 'mp_m_freemode_01', 500, 'hat', 48, '0'),
(26, 'mp_m_freemode_01', 500, 'hat', 49, '0'),
(27, 'mp_m_freemode_01', 500, 'hat', 50, '0'),
(28, 'mp_m_freemode_01', 500, 'hat', 51, '0'),
(29, 'mp_m_freemode_01', 500, 'hat', 52, '0'),
(30, 'mp_m_freemode_01', 500, 'hat', 53, '0'),
(31, 'mp_m_freemode_01', 500, 'hat', 54, '0'),
(32, 'mp_m_freemode_01', 500, 'hat', 55, '0'),
(33, 'mp_m_freemode_01', 500, 'hat', 56, '0'),
(34, 'mp_m_freemode_01', 500, 'hat', 58, '0'),
(35, 'mp_m_freemode_01', 500, 'hat', 60, '0'),
(36, 'mp_m_freemode_01', 500, 'hat', 61, '0'),
(37, 'mp_m_freemode_01', 500, 'hat', 62, '0'),
(38, 'mp_m_freemode_01', 500, 'hat', 63, '0'),
(39, 'mp_m_freemode_01', 500, 'hat', 64, '0'),
(40, 'mp_m_freemode_01', 500, 'hat', 65, '0'),
(41, 'mp_m_freemode_01', 500, 'hat', 66, '0'),
(42, 'mp_m_freemode_01', 500, 'hat', 67, '0'),
(43, 'mp_m_freemode_01', 500, 'hat', 68, '0'),
(44, 'mp_m_freemode_01', 500, 'hat', 69, '0'),
(45, 'mp_m_freemode_01', 500, 'hat', 70, '0'),
(46, 'mp_m_freemode_01', 500, 'hat', 71, '0'),
(47, 'mp_m_freemode_01', 500, 'hat', 72, '0'),
(48, 'mp_m_freemode_01', 500, 'hat', 73, '0'),
(49, 'mp_m_freemode_01', 500, 'hat', 74, '0'),
(50, 'mp_m_freemode_01', 500, 'hat', 75, '0'),
(51, 'mp_m_freemode_01', 500, 'hat', 76, '0'),
(52, 'mp_m_freemode_01', 500, 'hat', 77, '0'),
(53, 'mp_m_freemode_01', 500, 'hat', 78, '0'),
(54, 'mp_m_freemode_01', 500, 'hat', 79, '0'),
(55, 'mp_m_freemode_01', 500, 'hat', 80, '0'),
(56, 'mp_m_freemode_01', 500, 'hat', 81, '0'),
(57, 'mp_m_freemode_01', 500, 'hat', 82, '0'),
(58, 'mp_f_freemode_01', 500, 'hat', 4, '0'),
(59, 'mp_f_freemode_01', 500, 'hat', 5, '0'),
(60, 'mp_f_freemode_01', 500, 'hat', 6, '0'),
(61, 'mp_f_freemode_01', 500, 'hat', 7, '0'),
(62, 'mp_f_freemode_01', 500, 'hat', 9, '0'),
(63, 'mp_f_freemode_01', 500, 'hat', 12, '0'),
(64, 'mp_f_freemode_01', 500, 'hat', 13, '0'),
(65, 'mp_f_freemode_01', 500, 'hat', 14, '0'),
(66, 'mp_f_freemode_01', 500, 'hat', 15, '0'),
(67, 'mp_f_freemode_01', 500, 'hat', 16, '0'),
(68, 'mp_f_freemode_01', 500, 'hat', 17, '0'),
(69, 'mp_f_freemode_01', 500, 'hat', 18, '0'),
(70, 'mp_f_freemode_01', 500, 'hat', 19, '0'),
(71, 'mp_f_freemode_01', 500, 'hat', 20, '0'),
(72, 'mp_f_freemode_01', 500, 'hat', 21, '0'),
(73, 'mp_f_freemode_01', 500, 'hat', 22, '0'),
(74, 'mp_f_freemode_01', 500, 'hat', 26, '0'),
(75, 'mp_f_freemode_01', 500, 'hat', 27, '0'),
(76, 'mp_f_freemode_01', 500, 'hat', 28, '0'),
(77, 'mp_f_freemode_01', 500, 'hat', 29, '0'),
(78, 'mp_f_freemode_01', 500, 'hat', 43, '0'),
(79, 'mp_f_freemode_01', 500, 'hat', 44, '0'),
(80, 'mp_f_freemode_01', 500, 'hat', 47, '0'),
(81, 'mp_f_freemode_01', 500, 'hat', 48, '0'),
(82, 'mp_f_freemode_01', 500, 'hat', 49, '0'),
(83, 'mp_f_freemode_01', 500, 'hat', 50, '0'),
(84, 'mp_f_freemode_01', 500, 'hat', 51, '0'),
(85, 'mp_f_freemode_01', 500, 'hat', 52, '0'),
(86, 'mp_f_freemode_01', 500, 'hat', 53, '0'),
(87, 'mp_f_freemode_01', 500, 'hat', 54, '0'),
(88, 'mp_f_freemode_01', 500, 'hat', 55, '0'),
(89, 'mp_f_freemode_01', 500, 'hat', 56, '0'),
(90, 'mp_f_freemode_01', 500, 'hat', 57, '0'),
(91, 'mp_f_freemode_01', 500, 'hat', 58, '0'),
(92, 'mp_f_freemode_01', 500, 'hat', 81, '0'),
(93, 'mp_f_freemode_01', 500, 'glasses', 1, '0'),
(94, 'mp_f_freemode_01', 500, 'glasses', 2, '0'),
(95, 'mp_f_freemode_01', 500, 'glasses', 3, '0'),
(96, 'mp_f_freemode_01', 500, 'glasses', 4, '0'),
(97, 'mp_f_freemode_01', 500, 'glasses', 6, '0'),
(98, 'mp_f_freemode_01', 500, 'glasses', 7, '0'),
(99, 'mp_f_freemode_01', 500, 'glasses', 8, '0'),
(100, 'mp_f_freemode_01', 500, 'glasses', 9, '0'),
(101, 'mp_f_freemode_01', 500, 'glasses', 10, '0'),
(102, 'mp_f_freemode_01', 500, 'glasses', 11, '0'),
(103, 'mp_f_freemode_01', 500, 'glasses', 14, '0'),
(104, 'mp_f_freemode_01', 500, 'glasses', 16, '0'),
(105, 'mp_f_freemode_01', 500, 'glasses', 17, '0'),
(106, 'mp_f_freemode_01', 500, 'glasses', 18, '0'),
(107, 'mp_f_freemode_01', 500, 'glasses', 19, '0'),
(108, 'mp_f_freemode_01', 500, 'glasses', 20, '0'),
(109, 'mp_f_freemode_01', 500, 'glasses', 21, '0'),
(110, 'mp_m_freemode_01', 500, 'glasses', 3, '0'),
(111, 'mp_m_freemode_01', 500, 'glasses', 4, '0'),
(112, 'mp_m_freemode_01', 500, 'glasses', 5, '0'),
(113, 'mp_m_freemode_01', 500, 'glasses', 7, '0'),
(114, 'mp_m_freemode_01', 500, 'glasses', 8, '0'),
(115, 'mp_m_freemode_01', 500, 'glasses', 9, '0'),
(116, 'mp_m_freemode_01', 500, 'glasses', 10, '0'),
(117, 'mp_m_freemode_01', 500, 'glasses', 12, '0'),
(118, 'mp_m_freemode_01', 500, 'glasses', 13, '0'),
(119, 'mp_m_freemode_01', 500, 'glasses', 15, '0'),
(120, 'mp_m_freemode_01', 500, 'glasses', 16, '0'),
(121, 'mp_m_freemode_01', 500, 'glasses', 17, '0'),
(122, 'mp_m_freemode_01', 500, 'glasses', 18, '0'),
(123, 'mp_m_freemode_01', 500, 'glasses', 19, '0'),
(124, 'mp_m_freemode_01', 500, 'glasses', 20, '0'),
(125, 'mp_m_freemode_01', 500, 'glasses', 24, '0'),
(126, 'mp_m_freemode_01', 500, 'glasses', 25, '0'),
(127, 'mp_m_freemode_01', 500, 'hat', 82, '0'),
(128, 'mp_m_freemode_01', 500, 'hat', 83, '0'),
(129, 'mp_m_freemode_01', 500, 'hat', 84, '0'),
(130, 'mp_m_freemode_01', 500, 'hat', 85, '0'),
(131, 'mp_m_freemode_01', 500, 'hat', 86, '0'),
(132, 'mp_m_freemode_01', 500, 'hat', 87, '0'),
(133, 'mp_m_freemode_01', 500, 'hat', 88, '0'),
(134, 'mp_m_freemode_01', 500, 'hat', 89, '0'),
(135, 'mp_m_freemode_01', 500, 'hat', 90, '0'),
(136, 'mp_m_freemode_01', 500, 'hat', 91, '0'),
(137, 'mp_m_freemode_01', 500, 'hat', 92, '0'),
(138, 'mp_m_freemode_01', 500, 'hat', 93, '0'),
(139, 'mp_m_freemode_01', 500, 'hat', 94, '0'),
(140, 'mp_m_freemode_01', 500, 'hat', 95, '0'),
(141, 'mp_m_freemode_01', 500, 'hat', 96, '0'),
(142, 'mp_m_freemode_01', 500, 'hat', 97, '0'),
(143, 'mp_m_freemode_01', 500, 'hat', 98, '0'),
(144, 'mp_m_freemode_01', 500, 'hat', 99, '0'),
(145, 'mp_m_freemode_01', 500, 'hat', 100, '0'),
(146, 'mp_m_freemode_01', 500, 'hat', 101, '0'),
(147, 'mp_m_freemode_01', 500, 'hat', 102, '0'),
(148, 'mp_m_freemode_01', 500, 'hat', 103, '0'),
(149, 'mp_m_freemode_01', 500, 'hat', 104, '0'),
(150, 'mp_m_freemode_01', 500, 'hat', 105, '0'),
(151, 'mp_m_freemode_01', 500, 'hat', 106, '0'),
(152, 'mp_m_freemode_01', 500, 'hat', 107, '0'),
(153, 'mp_m_freemode_01', 500, 'hat', 108, '0'),
(154, 'mp_m_freemode_01', 500, 'hat', 109, '0'),
(155, 'mp_m_freemode_01', 500, 'hat', 110, '0'),
(156, 'mp_f_freemode_01', 500, 'hat', 81, '0'),
(157, 'mp_f_freemode_01', 500, 'hat', 82, '0'),
(158, 'mp_f_freemode_01', 500, 'hat', 83, '0'),
(159, 'mp_f_freemode_01', 500, 'hat', 84, '0'),
(160, 'mp_f_freemode_01', 500, 'hat', 85, '0'),
(161, 'mp_f_freemode_01', 500, 'hat', 86, '0'),
(162, 'mp_f_freemode_01', 500, 'hat', 87, '0'),
(163, 'mp_f_freemode_01', 500, 'hat', 88, '0'),
(164, 'mp_f_freemode_01', 500, 'hat', 89, '0'),
(165, 'mp_f_freemode_01', 500, 'hat', 90, '0'),
(166, 'mp_f_freemode_01', 500, 'hat', 91, '0'),
(167, 'mp_f_freemode_01', 500, 'hat', 92, '0'),
(168, 'mp_f_freemode_01', 500, 'hat', 93, '0'),
(169, 'mp_f_freemode_01', 500, 'hat', 94, '0'),
(170, 'mp_f_freemode_01', 500, 'hat', 95, '0'),
(171, 'mp_f_freemode_01', 500, 'hat', 96, '0'),
(172, 'mp_f_freemode_01', 500, 'hat', 97, '0'),
(173, 'mp_f_freemode_01', 500, 'hat', 98, '0'),
(174, 'mp_f_freemode_01', 500, 'hat', 99, '0'),
(175, 'mp_f_freemode_01', 500, 'hat', 100, '0'),
(176, 'mp_f_freemode_01', 500, 'hat', 101, '0'),
(177, 'mp_f_freemode_01', 500, 'hat', 102, '0'),
(178, 'mp_f_freemode_01', 500, 'hat', 103, '0'),
(179, 'mp_f_freemode_01', 500, 'hat', 104, '0'),
(180, 'mp_f_freemode_01', 500, 'hat', 105, '0'),
(181, 'mp_f_freemode_01', 500, 'hat', 106, '0'),
(182, 'mp_f_freemode_01', 500, 'hat', 107, '0'),
(183, 'mp_f_freemode_01', 500, 'hat', 108, '0'),
(184, 'mp_f_freemode_01', 500, 'hat', 109, '0'),
(185, 'mp_f_freemode_01', 500, 'glasses', 26, '0'),
(186, 'mp_f_freemode_01', 500, 'glasses', 27, '0');

-- --------------------------------------------------------

--
-- Structure de la table `clothes_users_outfits`
--

CREATE TABLE `clothes_users_outfits` (
  `identifier` varchar(50) NOT NULL DEFAULT '0',
  `current` int(11) NOT NULL DEFAULT 0,
  `outfit_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clothes_users_outfits`
--

INSERT INTO `clothes_users_outfits` (`identifier`, `current`, `outfit_id`) VALUES
('steam:11000013c6d0ffc', 1, 11),
('steam:11000011cd5a9d8', 1, 15),
('steam:11000014230adc0', 1, 17),
('steam:110000137ac7075', 1, 5),
('steam:11000013cbaae1f', 1, 2),
('steam:11000010aac08fe', 1, 13),
('steam:11000010b47879f', 1, 1),
('steam:1100001045198f1', 1, 9),
('steam:11000013d8b543c', 1, 2),
('steam:11000013f866245', 1, 17),
('steam:110000131ff48a7', 1, 15),
('steam:1100001167961a1', 1, 2),
('steam:11000013e9b3c10', 1, 11),
('steam:1100001379249d3', 1, 13),
('steam:110000115c12f6f', 1, 13),
('steam:11000011a773d2c', 1, 17),
('steam:11000013978037e', 1, 24),
('steam:110000139cd39f0', 1, 5),
('steam:11000013f4549ba', 1, 11),
('steam:110000131d17b17', 1, 16),
('steam:1100001186cdb42', 1, 14),
('steam:11000013c690a33', 1, 7),
('steam:11000010a51093f', 1, 2),
('steam:110000141fb5870', 1, 17),
('steam:11000011a249bac', 1, 13),
('steam:110000136c0c4ec', 1, 13),
('steam:11000013f3d457b', 1, 10),
('steam:110000113f639ab', 1, 13),
('steam:110000132d72d2e', 1, 2),
('steam:11000010a87d9bb', 1, 8),
('steam:110000116f5f441', 1, 13),
('steam:11000011ac33eea', 1, 13),
('steam:110000106853e63', 1, 11),
('steam:11000013f42ff6a', 1, 14),
('steam:110000113f1c845', 1, 17),
('steam:1100001132881a8', 1, 13),
('steam:11000011738a10a', 1, 13),
('steam:110000105f0e48f', 1, 13),
('steam:110000116a11626', 1, 15),
('steam:11000014217bfca', 1, 15),
('steam:11000013464b767', 1, 13),
('steam:110000136dbcfea', 1, 2),
('steam:1100001420219b2', 1, 13),
('steam:11000013bef6a30', 1, 13),
('steam:11000013fc419f2', 1, 13),
('steam:110000114d95b71', 1, 13),
('steam:11000013f2dca15', 1, 2),
('steam:11000014133e199', 1, 15),
('steam:11000013f5ed0f8', 1, 2),
('steam:11000011923f20b', 1, 17),
('steam:11000013edea77a', 1, 17),
('steam:11000011a1a1fe7', 1, 13),
('steam:11000011bcfbf5b', 1, 11),
('steam:11000013226b3d5', 1, 11),
('steam:11000013c35674e', 1, 11),
('steam:110000135760edf', 1, 2),
('steam:11000013d3ee7d0', 1, 14),
('steam:1100001177d11b3', 1, 15),
('steam:1100001118220b9', 1, 2),
('steam:11000011565324d', 1, 13),
('steam:110000141f3cff4', 1, 14),
('steam:110000141227fb1', 1, 9),
('steam:1100001364344d6', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `clothes_users_props`
--

CREATE TABLE `clothes_users_props` (
  `identifier` varchar(50) NOT NULL DEFAULT '0',
  `category` varchar(50) DEFAULT NULL,
  `current` int(11) DEFAULT 0,
  `prop_id` int(11) DEFAULT 0,
  `prop_txt` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `coordinates`
--

CREATE TABLE `coordinates` (
  `id` int(11) UNSIGNED NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `coordinates`
--

INSERT INTO `coordinates` (`id`, `x`, `y`, `z`) VALUES
(1, 94.9258, 3756.912, 39.77077),
(2, 0, 0, 0),
(3, 1983.955, 5176.729, 47.63908),
(4, 608.6334, -459.4331, 24.74493),
(5, 0, 0, -38.18),
(6, 1500.948, -2123.516, 76.02202),
(7, 1545.252, 2226.291, 77.54782),
(8, 0, 0, 0),
(9, 2709.6, 4316.566, 46.08146),
(10, -1146.555, 4940.999, 222.2687),
(11, 0, 0, 0),
(12, -172.0335, 6393.347, 31.49363),
(13, 0, 0, 0),
(14, 0, 0, 0),
(15, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `families`
--

CREATE TABLE `families` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `garduna`
--

CREATE TABLE `garduna` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `garduna`
--

INSERT INTO `garduna` (`identifier`, `rank`) VALUES
('steam:11000013e2304cc', 'Recrue'),
('steam:110000114d95b71', 'Recrue'),
('steam:1100001186cdb42', 'Recrue');

-- --------------------------------------------------------

--
-- Structure de la table `goto`
--

CREATE TABLE `goto` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `isIllegal` tinyint(1) NOT NULL DEFAULT 0,
  `canUse` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`id`, `libelle`, `isIllegal`, `canUse`) VALUES
(1, 'Minerai', 0, 0),
(2, 'Metal', 0, 0),
(3, 'Or', 0, 0),
(4, 'Joint', 1, 0),
(5, 'Farine', 0, 0),
(6, 'Eau', 0, 0),
(7, 'Feuille de Coca', 1, 0),
(8, 'Joint', 1, 0),
(9, 'Lingot', 0, 0),
(10, 'Blé', 0, 0),
(11, 'Méthamphétamine', 1, 0),
(12, 'Méthamphétamine', 1, 0),
(13, 'Ecstasy', 1, 0),
(14, 'Ecstasy', 1, 0),
(15, 'Pierre précieuse', 1, 0),
(16, 'Bijoux', 1, 0),
(17, 'Organe Sale', 1, 0),
(18, 'Organe Stérilisé', 1, 0),
(19, 'Bois Brut', 0, 0),
(20, 'Planche', 0, 0),
(21, 'poisson', 0, 0),
(22, 'Filet de Poisson', 0, 0),
(23, 'Viande fraiche', 0, 0),
(24, 'Orge', 0, 0),
(25, 'Bière', 0, 0),
(26, 'Raisin', 0, 0),
(27, 'Bouteille de vin', 0, 0),
(28, 'Cocaine', 1, 0),
(29, 'Documents secrets', 1, 0),
(30, 'Sandwich', 0, 0),
(31, 'faux papiers', 1, 0),
(32, 'Opium', 1, 0),
(33, 'Heroine', 1, 0),
(34, 'Poudre et Metal', 1, 0),
(35, 'Munitions', 1, 0),
(36, 'Joint', 1, 0),
(37, 'Heroine', 1, 0),
(38, 'Argent', 0, 0),
(41, 'Frite', 0, 0),
(42, 'Soda', 0, 0),
(44, 'Vodka', 0, 0),
(47, 'Kit de réparation', 0, 0),
(50, 'Cafe', 0, 0),
(51, 'Burger', 0, 0),
(52, 'Champagne', 0, 0),
(53, 'Coca', 0, 0),
(54, 'Fanta', 0, 0),
(55, 'Tacos', 0, 0),
(56, 'Redbull', 0, 0),
(57, 'Nuggets', 0, 0),
(58, 'Donuts', 0, 0),
(60, 'Zip-tie', 0, 0),
(66, 'Sac tete', 0, 0),
(67, 'Compteur taxi', 0, 0),
(70, 'Silencieux', 0, 0),
(71, 'Chargeur', 0, 0),
(72, 'Recycleur', 0, 0),
(99, 'GPS', 0, 0),
(100, '', 0, 0),
(101, 'Ressources militaire', 0, 0),
(102, 'Ressources militaire', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `jail`
--

CREATE TABLE `jail` (
  `identifier` varchar(100) NOT NULL,
  `isjailed` tinyint(1) DEFAULT NULL,
  `J_Time` datetime NOT NULL,
  `J_Cell` varchar(20) NOT NULL,
  `Jailer` varchar(100) NOT NULL,
  `Jailer_ID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT 500
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_name`, `salary`) VALUES
(1, 'Chomeur', 0),
(2, 'Cadet', 170),
(6, 'Fermier', 700),
(7, 'Bucheron', 700),
(8, 'Gang', 1),
(9, 'Mineur', 700),
(10, 'Pecheur', 70),
(11, 'Docker', 700),
(12, 'Brasseur', 700),
(13, 'Vigneron', 700),
(14, 'Livreur', 700),
(15, 'Ambulancier', 170),
(16, 'Mecano', 140),
(17, 'Taxi', 70),
(18, 'Joaillier', 70),
(19, 'Bar', 150),
(21, 'Agent', 220),
(22, 'Sergent', 270),
(23, 'Sergent-chef', 320),
(24, 'Lieutenant', 370),
(25, 'Capitaine', 420),
(37, 'Commandant', 470),
(38, 'Avocat', 180),
(39, 'Juge', 200),
(40, 'Enqueteur', 200),
(41, 'Gouverneur', 220),
(42, 'Gouverneur-adjoint', 210),
(43, 'Procureur', 200),
(98, 'Burgershot', 140),
(99, 'Brinks', 100),
(100, 'Evenementiel', 150),
(101, 'Journaliste', 150),
(102, 'Patron-burgershot', 170),
(103, 'Patron-mecano', 170),
(104, 'Patron-evenementiel', 180),
(105, 'Patron-journaliste', 180),
(106, 'Patron-bar', 180),
(107, 'Patron-brinks', 130);

-- --------------------------------------------------------

--
-- Structure de la table `licences`
--

CREATE TABLE `licences` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `licences`
--

INSERT INTO `licences` (`id`, `name`, `price`) VALUES
(1, 'De conduire', 200);

-- --------------------------------------------------------

--
-- Structure de la table `outfits`
--

CREATE TABLE `outfits` (
  `identifier` varchar(30) NOT NULL,
  `skin` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` int(11) NOT NULL DEFAULT 0,
  `face_text` int(11) NOT NULL DEFAULT 0,
  `hair` int(11) NOT NULL DEFAULT 0,
  `hair_text` int(11) NOT NULL DEFAULT 0,
  `pants` int(11) NOT NULL DEFAULT 0,
  `pants_text` int(11) NOT NULL DEFAULT 0,
  `shoes` int(11) NOT NULL DEFAULT 0,
  `shoes_text` int(11) NOT NULL DEFAULT 10,
  `torso` int(11) NOT NULL DEFAULT 0,
  `torso_text` int(11) NOT NULL DEFAULT 0,
  `shirt` int(11) NOT NULL DEFAULT 0,
  `shirt_text` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `phone_app_chat`
--

INSERT INTO `phone_app_chat` (`id`, `channel`, `message`, `time`) VALUES
(28, 'ballas', '.', '2020-03-31 19:34:57'),
(29, 'ballas', '.', '2020-03-31 19:35:04'),
(30, 'ballas', 'Blackmarket', '2020-03-31 19:35:09'),
(31, 'vagos', '.', '2020-03-31 19:39:02'),
(32, 'vagos', '.', '2020-03-31 19:39:34'),
(33, 'ballas', 'vous vendez des sacs pour avoir plus de place sur nous?', '2020-03-31 19:40:02'),
(34, 'ballas', 'no sac tête uniquement', '2020-03-31 19:40:26'),
(35, 'ballas', 'okey man', '2020-03-31 19:40:52'),
(36, 'ballas', 'Actuellement nous avon, zeep-tee, Sac tête, silencieux, chargeur', '2020-03-31 19:42:03'),
(37, 'ballas', 'd\'accord on vous recontacte', '2020-03-31 19:42:53'),
(38, 'ballasxgoto', 'slt', '2020-03-31 20:35:04'),
(39, 'ballasxgoto', 'wsh', '2020-03-31 20:35:05'),
(40, 'vagos', 'Bonsoir messieurs les jaunes, nous vous attendons devant votre quartier afin de discuter affaires', '2020-03-31 21:41:00'),
(41, 'vagos', 'On arrive', '2020-03-31 21:41:25'),
(42, 'ballas', 'Bonsoir messieur nous vous attendons dans votre gang afin de parler affaire', '2020-03-31 21:52:53'),
(43, 'ballas', 'okay les mans', '2020-03-31 21:53:16'),
(44, 'ballasxgoto', 'wsh vous etes la ?', '2020-04-01 15:09:05'),
(45, 'ballasxgoto', 'hola les hermanos como estas vous etes la ?', '2020-04-01 15:09:36'),
(46, 'ballasxgoto', 'discord.gg/yK6tZrB', '2020-04-01 17:26:25'),
(47, 'ballasxgoto', 'hola', '2020-04-01 17:26:52'),
(48, 'ballasxgoto', 'vous etes la ?', '2020-04-01 19:13:38'),
(49, 'ballasxgoto', 'uééé', '2020-04-01 19:13:54'),
(50, 'ballasxgoto', 'vous etes la ?*', '2020-04-01 20:29:23'),
(51, 'ballasxgoto', '?', '2020-04-01 20:29:34'),
(52, 'ballasxgoto', 'ces les Loco street j\'ai voler le telephone au ballas', '2020-04-01 20:30:02'),
(53, 'ballasxgoto', 'MDRRRRRR', '2020-04-01 20:30:53'),
(54, 'ballasxgoto', 't\'es un bon toi j\'t\'aime bien', '2020-04-01 20:30:59'),
(55, 'ballasxgoto', 'j\'sais pas t\'es qui', '2020-04-01 20:31:04'),
(56, 'ballasxgoto', 'mais on te recontactera', '2020-04-01 20:31:07'),
(57, 'ballasxgoto', 'quand hermanos ?', '2020-04-01 20:38:50'),
(58, 'ballasxgoto', 'je suis pas ton hermano', '2020-04-01 20:39:09'),
(59, 'ballasxgoto', 'on décidera de quand, où et à quelle heure', '2020-04-01 20:39:19'),
(60, 'ballasxgoto', 'ok hermanoi$', '2020-04-01 20:40:23'),
(61, 'vagos', 'Holà los vagos, nous avons quelque informations pour vous, nous vous attendons devant votre parking.', '2020-04-01 20:43:19'),
(62, 'vagos', 'Nous vous atendons les vagos ......', '2020-04-01 20:46:27'),
(63, 'vagos', 'On est là', '2020-04-01 20:50:02'),
(64, 'ballasxgoto', 'on pourrais ce rencontrer ce soir ou pas les hermanos ?', '2020-04-01 21:11:30'),
(65, 'ballasxgoto', 'alors ?', '2020-04-01 21:34:05'),
(66, 'weedclicos', 'a', '2020-04-02 16:48:38'),
(67, 'weedclicos', 'y\'a les flics sur les points h24', '2020-04-02 17:20:37'),
(68, 'ballasxgoto', 'wsh du monde ?', '2020-04-02 17:37:11'),
(69, 'weedclicos', 'check ta radiod', '2020-04-02 17:41:48'),
(70, 'weedclicos', 'stp c ou le blanchiment?', '2020-04-02 18:00:46'),
(71, 'weedclicos', 'je te vend le point 5k', '2020-04-02 18:02:02'),
(72, 'weedclicos', 'vzy', '2020-04-02 18:02:14'),
(73, 'weedclicos', 'regarde l\'annonce viens fight club et des que on ce vois tu me donne 5k', '2020-04-02 18:03:07'),
(74, 'weedclicos', 'vien pc jrv dans 2 mins', '2020-04-02 18:05:37'),
(75, 'weedclicos', 'sa te vas?', '2020-04-02 18:05:40'),
(76, 'weedclicos', 'ok', '2020-04-02 18:06:04'),
(77, 'weedclicos', 'mon jefe veux pas je le vend pas', '2020-04-02 18:06:36'),
(78, 'weedclicos', 'gros force pas stp', '2020-04-02 18:06:52');

-- --------------------------------------------------------

--
-- Structure de la table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `phone_calls`
--

INSERT INTO `phone_calls` (`id`, `owner`, `num`, `incoming`, `time`, `accepts`) VALUES
(122, '749-0723', '728-1902', 1, '2020-03-31 14:25:45', 1),
(123, '728-1902', '749-0723', 0, '2020-03-31 14:25:45', 1),
(124, '749-0723', '728-1902', 1, '2020-03-31 14:26:10', 1),
(125, '728-1902', '749-0723', 0, '2020-03-31 14:26:10', 1),
(126, '271-5929', '904-1680', 1, '2020-03-31 14:39:08', 0),
(127, '904-1680', '271-5929', 0, '2020-03-31 14:39:08', 0),
(128, '271-5929', '426-9400', 1, '2020-03-31 14:40:10', 0),
(129, '426-9400', '271-5929', 0, '2020-03-31 14:40:10', 0),
(130, '271-5929', '426-9400', 1, '2020-03-31 14:40:25', 1),
(131, '426-9400', '271-5929', 0, '2020-03-31 14:40:25', 1),
(132, '271-5929', '426-9400', 1, '2020-03-31 14:40:49', 1),
(133, '426-9400', '271-5929', 0, '2020-03-31 14:40:49', 1),
(134, '970-0308', '271-5929', 1, '2020-03-31 15:08:48', 0),
(135, '271-5929', '970-0308', 0, '2020-03-31 15:08:48', 0),
(136, '714-4890', '728-1902', 1, '2020-03-31 15:44:00', 1),
(137, '728-1902', '714-4890', 0, '2020-03-31 15:44:00', 1),
(138, '714-4890', '728-1902', 1, '2020-03-31 15:44:10', 1),
(139, '728-1902', '714-4890', 0, '2020-03-31 15:44:10', 1),
(140, '714-4890', '728-1902', 1, '2020-03-31 15:44:27', 0),
(141, '728-1902', '714-4890', 0, '2020-03-31 15:44:27', 0),
(142, '714-4890', '728-1902', 1, '2020-03-31 15:44:32', 1),
(143, '728-1902', '714-4890', 0, '2020-03-31 15:44:32', 1),
(144, '714-4890', '728-1902', 1, '2020-03-31 16:06:34', 1),
(145, '728-1902', '714-4890', 0, '2020-03-31 16:06:34', 1),
(146, '455-5262', '714-4890', 1, '2020-03-31 18:58:01', 1),
(147, '714-4890', '455-5262', 0, '2020-03-31 18:58:01', 1),
(148, '714-4890', '455-5262', 1, '2020-03-31 18:58:27', 0),
(149, '455-5262', '714-4890', 0, '2020-03-31 18:58:27', 0),
(150, '455-5262', '714-4890', 1, '2020-03-31 18:58:39', 1),
(151, '714-4890', '455-5262', 0, '2020-03-31 18:58:39', 1),
(152, '247-2377', '631-3854', 1, '2020-03-31 20:09:59', 0),
(153, '247-2377', '992-0471', 1, '2020-03-31 20:10:18', 1),
(154, '992-0471', '247-2377', 0, '2020-03-31 20:10:18', 1),
(155, '247-2377', '992-0471', 1, '2020-03-31 20:10:19', 1),
(156, '992-0471', '247-2377', 0, '2020-03-31 20:10:19', 1),
(157, '259-4698', '722-7740', 1, '2020-03-31 20:13:16', 1),
(158, '722-7740', '259-4698', 0, '2020-03-31 20:13:16', 1),
(159, '259-4698', '722-7740', 1, '2020-03-31 20:20:53', 1),
(160, '722-7740', '259-4698', 0, '2020-03-31 20:20:53', 1),
(161, '722-7740', '259-4698', 1, '2020-03-31 20:22:23', 1),
(162, '259-4698', '722-7740', 0, '2020-03-31 20:22:23', 1),
(163, '247-2377', '344-2299', 1, '2020-03-31 20:40:01', 1),
(164, '344-2299', '247-2377', 0, '2020-03-31 20:40:01', 1),
(165, '259-4698', '722-7740', 1, '2020-03-31 20:50:52', 1),
(166, '722-7740', '259-4698', 0, '2020-03-31 20:50:52', 1),
(167, '259-4698', '722-7740', 1, '2020-03-31 20:52:24', 1),
(168, '722-7740', '259-4698', 0, '2020-03-31 20:52:24', 1),
(169, '344-2299', '941-8083', 1, '2020-03-31 20:53:23', 1),
(170, '941-8083', '344-2299', 0, '2020-03-31 20:53:23', 1),
(171, '259-4698', '722-7740', 1, '2020-03-31 20:56:35', 1),
(172, '722-7740', '259-4698', 0, '2020-03-31 20:56:35', 1),
(173, '344-2299', '941-8083', 1, '2020-03-31 21:00:01', 1),
(174, '941-8083', '344-2299', 0, '2020-03-31 21:00:01', 1),
(175, '344-2299', '941-8083', 1, '2020-03-31 21:00:48', 1),
(176, '941-8083', '344-2299', 0, '2020-03-31 21:00:48', 1),
(177, '904-1680', '970-0308', 1, '2020-03-31 22:10:44', 1),
(178, '970-0308', '904-1680', 0, '2020-03-31 22:10:44', 1),
(179, '279-5516', '291-3888', 1, '2020-04-01 13:51:34', 1),
(180, '291-3888', '279-5516', 0, '2020-04-01 13:51:34', 1),
(181, '250-5902', '113-6817', 1, '2020-04-01 13:57:43', 0),
(182, '113-6817', '250-5902', 0, '2020-04-01 13:57:43', 0),
(183, '250-5902', '113-6817', 1, '2020-04-01 14:02:36', 0),
(184, '113-6817', '250-5902', 0, '2020-04-01 14:02:36', 0),
(185, '250-5902', '187-3452', 1, '2020-04-01 14:02:45', 0),
(186, '187-3452', '250-5902', 0, '2020-04-01 14:02:45', 0),
(187, '250-5902', '113-6817', 1, '2020-04-01 14:03:07', 1),
(188, '113-6817', '250-5902', 0, '2020-04-01 14:03:07', 1),
(189, '113-6817', '250-5902', 1, '2020-04-01 14:26:03', 0),
(190, '250-5902', '113-6817', 0, '2020-04-01 14:26:03', 0),
(191, '187-3452', '250-5902', 1, '2020-04-01 14:26:06', 0),
(192, '250-5902', '187-3452', 0, '2020-04-01 14:26:06', 0),
(193, '187-3452', '250-5902', 1, '2020-04-01 14:42:20', 1),
(194, '250-5902', '187-3452', 0, '2020-04-01 14:42:20', 1),
(195, '187-3452', '250-5902', 1, '2020-04-01 14:46:01', 0),
(196, '250-5902', '187-3452', 0, '2020-04-01 14:46:01', 0),
(197, '250-5902', '557-9798', 1, '2020-04-01 15:17:53', 1),
(198, '557-9798', '250-5902', 0, '2020-04-01 15:17:53', 1),
(199, '247-2377', '344-2299', 1, '2020-04-01 16:32:19', 1),
(200, '344-2299', '247-2377', 0, '2020-04-01 16:32:19', 1),
(201, '749-0723', '455-5262', 1, '2020-04-01 17:12:57', 1),
(202, '455-5262', '749-0723', 0, '2020-04-01 17:12:57', 1),
(203, '247-2377', '344-2299', 1, '2020-04-01 17:17:15', 1),
(204, '344-2299', '247-2377', 0, '2020-04-01 17:17:15', 1),
(205, '250-5902', '2', 1, '2020-04-01 17:28:00', 0),
(206, '187-3452', 'mathiasfdp', 1, '2020-04-01 17:36:23', 0),
(207, '250-5902', 'ambulance', 1, '2020-04-01 17:42:09', 0),
(208, '557-9798', 'ambulance', 1, '2020-04-01 18:23:26', 0),
(209, '171-8699', 'ambulance', 1, '2020-04-01 19:46:23', 0),
(210, '187-3452', '250-5902', 1, '2020-04-01 21:48:12', 0),
(211, '250-5902', '187-3452', 0, '2020-04-01 21:48:12', 0),
(212, '722-7740', 'police', 1, '2020-04-02 15:52:45', 0),
(213, '262-8995', '458-3849', 1, '2020-04-02 16:40:23', 1),
(214, '458-3849', '262-8995', 0, '2020-04-02 16:40:23', 1),
(215, '262-8995', '458-3849', 1, '2020-04-02 16:40:39', 1),
(216, '458-3849', '262-8995', 0, '2020-04-02 16:40:39', 1),
(217, '262-8995', '458-3849', 1, '2020-04-02 16:40:40', 1),
(218, '458-3849', '262-8995', 0, '2020-04-02 16:40:40', 1),
(219, '262-8995', '458-3849', 1, '2020-04-02 16:48:12', 1),
(220, '458-3849', '262-8995', 0, '2020-04-02 16:48:12', 1),
(221, '262-8995', '458-3849', 1, '2020-04-02 17:08:47', 1),
(222, '458-3849', '262-8995', 0, '2020-04-02 17:08:47', 1),
(223, '948-4278', 'police', 1, '2020-04-02 17:28:17', 0),
(224, '997-6488', '458-3849', 1, '2020-04-02 17:30:33', 1),
(225, '458-3849', '997-6488', 0, '2020-04-02 17:30:33', 1),
(226, '259-4698', '722-7740', 1, '2020-04-02 17:50:03', 0),
(227, '722-7740', '259-4698', 0, '2020-04-02 17:50:03', 0),
(228, '997-6488', 'ambulance', 1, '2020-04-02 17:58:46', 0),
(229, '997-6488', '262-8995', 1, '2020-04-02 18:00:26', 0),
(230, '262-8995', '997-6488', 0, '2020-04-02 18:00:26', 0),
(231, '259-4698', '722-7740', 1, '2020-04-02 18:06:38', 1),
(232, '722-7740', '259-4698', 0, '2020-04-02 18:06:38', 1),
(233, '247-2377', '970-0308', 1, '2020-04-02 18:34:31', 0),
(234, '970-0308', '247-2377', 0, '2020-04-02 18:34:31', 0),
(235, '722-7740', '259-4698', 1, '2020-04-02 18:37:52', 1),
(236, '259-4698', '722-7740', 0, '2020-04-02 18:37:52', 1),
(237, '259-4698', '722-7740', 1, '2020-04-02 18:40:21', 0),
(238, '722-7740', '259-4698', 0, '2020-04-02 18:40:21', 0),
(239, '458-3849', '997-6488', 1, '2020-04-02 19:55:18', 0),
(240, '997-6488', '458-3849', 0, '2020-04-02 19:55:18', 0),
(241, '749-0723', '672-6046', 1, '2020-04-02 21:18:30', 1),
(242, '672-6046', '749-0723', 0, '2020-04-02 21:18:30', 1),
(243, '458-3849', '997-6488', 1, '2020-04-02 22:39:00', 0),
(244, '997-6488', '458-3849', 0, '2020-04-02 22:39:00', 0),
(245, '317-3667', '543-5479', 1, '2020-04-03 02:53:42', 0),
(246, '543-5479', '317-3667', 0, '2020-04-03 02:53:42', 0),
(247, '672-6046', '749-0723', 1, '2020-04-03 03:04:37', 1),
(248, '749-0723', '672-6046', 0, '2020-04-03 03:04:37', 1),
(249, '749-0723', '672-6046', 1, '2020-04-03 03:05:00', 0),
(250, '672-6046', '749-0723', 0, '2020-04-03 03:05:00', 0),
(251, '426-9400', '7259980', 1, '2020-04-03 12:49:24', 0),
(252, '458-3849', '997-6488', 1, '2020-04-03 15:23:42', 0),
(253, '997-6488', '458-3849', 0, '2020-04-03 15:23:42', 0),
(254, '458-3849', '997-6488', 1, '2020-04-03 15:25:23', 1),
(255, '997-6488', '458-3849', 0, '2020-04-03 15:25:23', 1),
(256, '997-6488', '458-3849', 1, '2020-04-03 15:33:02', 1),
(257, '458-3849', '997-6488', 0, '2020-04-03 15:33:02', 1),
(258, '458-3849', '997-6488', 1, '2020-04-03 15:33:14', 1),
(259, '997-6488', '458-3849', 0, '2020-04-03 15:33:14', 1),
(260, '997-6488', '458-3849', 1, '2020-04-03 15:36:29', 1),
(261, '458-3849', '997-6488', 0, '2020-04-03 15:36:29', 1),
(262, '310-3410', 'police', 1, '2020-04-04 14:45:35', 0),
(263, '631-3824', '543-5479', 1, '2020-04-04 15:21:48', 0),
(264, '543-5479', '631-3824', 0, '2020-04-04 15:21:48', 0),
(265, '631-3824', '543-5479', 1, '2020-04-04 17:19:09', 0),
(266, '543-5479', '631-3824', 0, '2020-04-04 17:19:09', 0),
(267, '997-6488', '458-3849', 1, '2020-04-04 17:24:35', 1),
(268, '458-3849', '997-6488', 0, '2020-04-04 17:24:35', 1),
(269, '458-3849', '522-7430', 1, '2020-04-07 23:04:36', 0),
(270, '522-7430', '458-3849', 0, '2020-04-07 23:04:36', 0),
(272, '763-3419', '359-8094', 1, '2020-04-27 21:40:41', 1),
(273, '359-8094', '763-3419', 0, '2020-04-27 21:40:41', 1),
(274, '359-8094', '763-3419', 1, '2020-04-27 21:41:26', 0),
(275, '763-3419', '359-8094', 0, '2020-04-27 21:41:26', 0),
(276, '729-7288', 'a', 1, '2020-06-01 17:00:43', 0),
(277, '173-0050', 'ntm', 1, '2020-06-02 15:24:12', 0),
(278, '511-8077', '938-4023', 1, '2020-06-02 15:42:13', 1),
(279, '938-4023', '511-8077', 0, '2020-06-02 15:42:13', 1),
(280, '511-8077', '938-4023', 1, '2020-06-02 15:42:14', 1),
(281, '938-4023', '511-8077', 0, '2020-06-02 15:42:14', 1),
(282, '511-8077', '938-4023', 1, '2020-06-02 15:53:34', 1),
(283, '938-4023', '511-8077', 0, '2020-06-02 15:53:34', 1),
(284, '511-8077', '938-4023', 1, '2020-06-02 17:05:08', 1),
(285, '938-4023', '511-8077', 0, '2020-06-02 17:05:08', 1),
(286, '938-4023', '511-8077', 1, '2020-06-02 17:06:26', 0),
(287, '511-8077', '938-4023', 0, '2020-06-02 17:06:26', 0),
(288, '404-0586', '173-0050', 1, '2020-06-02 17:35:01', 0),
(289, '173-0050', '404-0586', 0, '2020-06-02 17:35:01', 0),
(290, '404-0586', 'ambulance', 1, '2020-06-02 18:52:42', 0),
(291, '924-8776', 'police', 1, '2020-06-02 19:48:12', 0),
(292, '782-3679', 'Denis', 1, '2020-06-02 20:51:31', 0),
(293, '782-3679', 'Denis', 1, '2020-06-02 20:51:52', 0),
(294, '782-3679', 'Police', 1, '2020-06-02 20:52:37', 0),
(295, '404-0586', '173-0050', 1, '2020-06-02 21:27:38', 0),
(296, '173-0050', '404-0586', 0, '2020-06-02 21:27:38', 0),
(297, '518-6651', 'ambulance', 1, '2020-06-02 22:24:28', 0),
(298, '518-6651', 'police', 1, '2020-06-02 22:25:18', 0),
(299, '518-6651', 'ambulance', 1, '2020-06-02 22:25:41', 0),
(300, '404-0586', '943-5237', 1, '2020-06-02 22:48:53', 0),
(301, '943-5237', '404-0586', 0, '2020-06-02 22:48:53', 0),
(302, '943-5237', '404-0586', 1, '2020-06-02 22:49:03', 1),
(303, '404-0586', '943-5237', 0, '2020-06-02 22:49:03', 1),
(304, '943-5237', '404-0586', 1, '2020-06-02 23:28:02', 1),
(305, '404-0586', '943-5237', 0, '2020-06-02 23:28:02', 1),
(306, '943-5237', '404-0586', 1, '2020-06-02 23:46:07', 0),
(307, '404-0586', '943-5237', 0, '2020-06-02 23:46:07', 0),
(308, '943-5237', '404-0586', 1, '2020-06-02 23:48:02', 0),
(309, '404-0586', '943-5237', 0, '2020-06-02 23:48:02', 0),
(310, '943-5237', '404-0586', 1, '2020-06-02 23:52:41', 1),
(311, '404-0586', '943-5237', 0, '2020-06-02 23:52:41', 1),
(312, '404-0586', '943-5237', 1, '2020-06-02 23:52:53', 1),
(313, '943-5237', '404-0586', 0, '2020-06-02 23:52:53', 1),
(314, '404-0586', '943-5237', 1, '2020-06-02 23:52:53', 1),
(315, '943-5237', '404-0586', 0, '2020-06-02 23:52:53', 1),
(316, '943-5237', '404-0586', 1, '2020-06-03 00:00:35', 1),
(317, '404-0586', '943-5237', 0, '2020-06-03 00:00:35', 1),
(318, '404-0586', '943-5237', 1, '2020-06-03 00:01:03', 0),
(319, '943-5237', '404-0586', 0, '2020-06-03 00:01:03', 0),
(320, '518-6651', 'ambulance', 1, '2020-06-03 00:06:15', 0),
(321, '518-6651', '943-5237', 1, '2020-06-03 00:06:45', 0),
(322, '943-5237', '518-6651', 0, '2020-06-03 00:06:45', 0),
(323, '173-0050', 'ntm', 1, '2020-06-03 00:30:10', 0),
(324, '404-0586', 'ambulance', 1, '2020-06-03 01:25:49', 0),
(325, '404-0586', '943-5237', 1, '2020-06-03 01:40:51', 1),
(326, '943-5237', '404-0586', 0, '2020-06-03 01:40:51', 1),
(327, '173-0050', '0080048', 1, '2020-06-03 01:47:31', 0),
(328, '404-0586', '173-0050', 1, '2020-06-03 02:38:41', 1),
(329, '173-0050', '404-0586', 0, '2020-06-03 02:38:41', 1),
(330, '518-6651', '943-5237', 1, '2020-06-03 16:38:20', 0),
(331, '943-5237', '518-6651', 0, '2020-06-03 16:38:20', 0),
(332, '518-6651', 'police', 1, '2020-06-03 16:43:27', 0),
(333, '943-5237', '404-0586', 1, '2020-06-03 18:46:14', 1),
(334, '404-0586', '943-5237', 0, '2020-06-03 18:46:14', 1),
(335, '404-0586', '943-5237', 1, '2020-06-03 19:03:16', 1),
(336, '943-5237', '404-0586', 0, '2020-06-03 19:03:16', 1),
(337, '404-0586', '943-5237', 1, '2020-06-03 19:03:17', 1),
(338, '943-5237', '404-0586', 0, '2020-06-03 19:03:17', 1),
(339, '404-0586', '943-5237', 1, '2020-06-03 19:13:56', 1),
(340, '943-5237', '404-0586', 0, '2020-06-03 19:13:56', 1),
(341, '404-0586', '943-5237', 1, '2020-06-03 19:13:56', 1),
(342, '943-5237', '404-0586', 0, '2020-06-03 19:13:56', 1),
(343, '404-0586', '943-5237', 1, '2020-06-03 19:13:57', 1),
(344, '943-5237', '404-0586', 0, '2020-06-03 19:13:57', 1),
(345, '404-0586', 'ambulance', 1, '2020-06-03 20:01:43', 0),
(346, '404-0586', '943-5237', 1, '2020-06-03 20:11:36', 0),
(347, '943-5237', '404-0586', 0, '2020-06-03 20:11:36', 0),
(348, '404-0586', '943-5237', 1, '2020-06-03 20:21:06', 0),
(349, '943-5237', '404-0586', 0, '2020-06-03 20:21:06', 0),
(350, '404-0586', 'ambulance', 1, '2020-06-03 20:28:32', 0),
(351, '943-5237', '404-0586', 1, '2020-06-03 20:41:56', 1),
(352, '404-0586', '943-5237', 0, '2020-06-03 20:41:56', 1),
(353, '973-5030', 'police', 1, '2020-06-03 21:32:23', 0),
(354, '404-0586', '943-5237', 1, '2020-06-03 21:39:50', 1),
(355, '943-5237', '404-0586', 0, '2020-06-03 21:39:50', 1),
(356, '404-0586', '943-5237', 1, '2020-06-03 21:39:50', 1),
(357, '943-5237', '404-0586', 0, '2020-06-03 21:39:50', 1),
(358, '404-0586', '943-5237', 1, '2020-06-03 21:39:50', 1),
(359, '943-5237', '404-0586', 0, '2020-06-03 21:39:50', 1),
(360, '404-0586', '943-5237', 1, '2020-06-03 21:39:51', 1),
(361, '943-5237', '404-0586', 0, '2020-06-03 21:39:51', 1),
(362, '943-5237', '404-0586', 1, '2020-06-03 21:41:37', 1),
(363, '404-0586', '943-5237', 0, '2020-06-03 21:41:37', 1),
(364, '943-5237', '404-0586', 1, '2020-06-03 21:42:56', 0),
(365, '404-0586', '943-5237', 0, '2020-06-03 21:42:56', 0),
(366, '593-1150', 'Aaron Smit', 1, '2020-06-03 22:12:44', 0),
(367, '404-0586', '943-5237', 1, '2020-06-03 22:22:26', 1),
(368, '943-5237', '404-0586', 0, '2020-06-03 22:22:26', 1),
(369, '404-0586', '943-5237', 1, '2020-06-03 22:22:27', 1),
(370, '943-5237', '404-0586', 0, '2020-06-03 22:22:27', 1),
(371, '404-0586', '943-5237', 1, '2020-06-03 22:22:27', 1),
(372, '943-5237', '404-0586', 0, '2020-06-03 22:22:27', 1),
(373, '404-0586', 'ambulance', 1, '2020-06-03 22:30:06', 0),
(374, '518-6651', '943-5237', 1, '2020-06-03 22:31:34', 1),
(375, '943-5237', '518-6651', 0, '2020-06-03 22:31:34', 1),
(376, '518-6651', '943-5237', 1, '2020-06-03 22:31:34', 1),
(377, '943-5237', '518-6651', 0, '2020-06-03 22:31:34', 1),
(378, '518-6651', '943-5237', 1, '2020-06-03 22:31:34', 1),
(379, '943-5237', '518-6651', 0, '2020-06-03 22:31:34', 1),
(380, '518-6651', '943-5237', 1, '2020-06-03 22:31:34', 1),
(381, '943-5237', '518-6651', 0, '2020-06-03 22:31:34', 1),
(382, '518-6651', '943-5237', 1, '2020-06-03 22:31:34', 1),
(383, '943-5237', '518-6651', 0, '2020-06-03 22:31:34', 1),
(384, '518-6651', '943-5237', 1, '2020-06-03 22:31:34', 1),
(385, '943-5237', '518-6651', 0, '2020-06-03 22:31:34', 1),
(386, '924-8776', '719-7180', 1, '2020-06-04 19:40:45', 0),
(387, '719-7180', '924-8776', 0, '2020-06-04 19:40:45', 0),
(388, '719-7180', '924-8776', 1, '2020-06-04 19:44:14', 0),
(389, '924-8776', '719-7180', 0, '2020-06-04 19:44:14', 0),
(390, '719-7180', '924-8776', 1, '2020-06-04 19:45:08', 1),
(391, '924-8776', '719-7180', 0, '2020-06-04 19:45:08', 1),
(392, '719-7180', '924-8776', 1, '2020-06-04 19:49:34', 1),
(393, '924-8776', '719-7180', 0, '2020-06-04 19:49:34', 1),
(394, '719-7180', '924-8776', 1, '2020-06-04 19:50:05', 1),
(395, '924-8776', '719-7180', 0, '2020-06-04 19:50:05', 1),
(396, '719-7180', '924-8776', 1, '2020-06-04 19:50:37', 1),
(397, '924-8776', '719-7180', 0, '2020-06-04 19:50:37', 1),
(398, '719-7180', '924-8776', 1, '2020-06-04 19:51:13', 1),
(399, '924-8776', '719-7180', 0, '2020-06-04 19:51:13', 1),
(400, '719-7180', '924-8776', 1, '2020-06-04 19:51:14', 1),
(401, '924-8776', '719-7180', 0, '2020-06-04 19:51:14', 1),
(402, '973-5030', 'ambulance', 1, '2020-06-04 20:46:00', 0),
(403, '470-9281', '924-9776', 1, '2020-06-04 21:25:47', 0),
(404, '917-3091', 'police', 1, '2020-06-05 17:37:08', 0),
(405, '917-3091', 'police', 1, '2020-06-05 17:43:29', 0),
(406, '719-7180', '924-8776', 1, '2020-06-05 17:54:20', 1),
(407, '924-8776', '719-7180', 0, '2020-06-05 17:54:20', 1),
(408, '719-7180', '924-8776', 1, '2020-06-05 17:54:20', 1),
(409, '924-8776', '719-7180', 0, '2020-06-05 17:54:20', 1),
(410, '719-7180', '924-8776', 1, '2020-06-05 17:54:20', 1),
(411, '924-8776', '719-7180', 0, '2020-06-05 17:54:20', 1),
(412, '719-7180', '924-8776', 1, '2020-06-05 17:54:20', 1),
(413, '924-8776', '719-7180', 0, '2020-06-05 17:54:20', 1),
(414, '719-7180', '924-8776', 1, '2020-06-05 17:54:20', 1),
(415, '924-8776', '719-7180', 0, '2020-06-05 17:54:20', 1),
(416, '719-7180', '924-8776', 1, '2020-06-05 17:54:21', 1),
(417, '924-8776', '719-7180', 0, '2020-06-05 17:54:21', 1),
(418, '719-7180', '924-8776', 1, '2020-06-05 17:54:21', 1),
(419, '924-8776', '719-7180', 0, '2020-06-05 17:54:21', 1),
(420, '456-0375', 'police', 1, '2020-06-06 12:58:37', 0),
(421, '719-7180', '924-8776', 1, '2020-06-06 16:35:03', 0),
(422, '924-8776', '719-7180', 0, '2020-06-06 16:35:03', 0),
(423, '404-0586', '943-5237', 1, '2020-06-06 17:14:39', 0),
(424, '943-5237', '404-0586', 0, '2020-06-06 17:14:39', 0),
(425, '404-0586', '943-5237', 1, '2020-06-06 20:51:56', 0),
(426, '943-5237', '404-0586', 0, '2020-06-06 20:51:56', 0),
(427, '404-0586', 'ambulance', 1, '2020-06-06 21:31:42', 0),
(428, '924-8776', '470-9281', 1, '2020-06-06 23:40:03', 0),
(429, '470-9281', '924-8776', 0, '2020-06-06 23:40:03', 0),
(430, '924-8776', '470-9281', 1, '2020-06-06 23:40:15', 0),
(431, '470-9281', '924-8776', 0, '2020-06-06 23:40:15', 0),
(432, '404-0586', 'ambulance', 1, '2020-06-07 00:16:10', 0),
(433, '924-8776', '470-9281', 1, '2020-06-07 00:54:20', 0),
(434, '470-9281', '924-8776', 0, '2020-06-07 00:54:20', 0),
(435, '924-8776', '470-9281', 1, '2020-06-07 01:01:28', 0),
(436, '470-9281', '924-8776', 0, '2020-06-07 01:01:28', 0),
(437, '924-8776', '470-9281', 1, '2020-06-07 03:04:17', 0),
(438, '470-9281', '924-8776', 0, '2020-06-07 03:04:17', 0),
(439, '194-9520', 'ambulance', 1, '2020-06-07 03:04:31', 0),
(440, '924-8776', '470-9281', 1, '2020-06-07 03:04:32', 0),
(441, '470-9281', '924-8776', 0, '2020-06-07 03:04:32', 0),
(442, '404-0586', '943-5237', 1, '2020-06-07 03:13:51', 1),
(443, '943-5237', '404-0586', 0, '2020-06-07 03:13:51', 1),
(444, '404-0586', '943-5237', 1, '2020-06-07 03:13:52', 1),
(445, '943-5237', '404-0586', 0, '2020-06-07 03:13:52', 1),
(446, '404-0586', '943-5237', 1, '2020-06-07 03:41:57', 0),
(447, '943-5237', '404-0586', 0, '2020-06-07 03:41:57', 0),
(448, '404-0586', '943-5237', 1, '2020-06-07 03:47:48', 0),
(449, '943-5237', '404-0586', 0, '2020-06-07 03:47:48', 0),
(450, '194-9520', 'ambulance', 1, '2020-06-07 03:56:14', 0),
(451, '194-9520', 'ambulance', 1, '2020-06-07 04:17:24', 0),
(452, '404-0586', '943-5237', 1, '2020-06-07 14:03:25', 0),
(453, '943-5237', '404-0586', 0, '2020-06-07 14:03:25', 0),
(454, '482-0980', 'svp', 1, '2020-06-08 00:35:48', 0),
(455, '424-1870', 'ambulance', 1, '2020-06-23 09:23:33', 0),
(456, '424-1870', 'ambulance', 1, '2020-06-23 09:23:42', 0),
(457, '424-1870', 'ambulance', 1, '2020-06-23 09:24:10', 0),
(458, '424-1870', 'ambulance', 1, '2020-06-23 09:28:48', 0),
(459, '468-3246', '8', 1, '2020-06-24 19:50:55', 0),
(460, '225-2343', 'ta maman', 1, '2020-06-24 20:22:17', 0),
(461, '298-5546', '161-0697', 1, '2020-06-24 20:25:52', 1),
(462, '161-0697', '298-5546', 0, '2020-06-24 20:25:52', 1),
(463, '161-0697', '298-5546', 1, '2020-06-24 20:26:25', 1),
(464, '298-5546', '161-0697', 0, '2020-06-24 20:26:25', 1),
(465, '500-8776', '555-1234', 1, '2020-06-24 20:26:49', 0),
(466, '298-5546', '161-0697', 1, '2020-06-24 20:27:26', 0),
(467, '161-0697', '298-5546', 0, '2020-06-24 20:27:26', 0),
(468, '298-5546', '311-3222', 1, '2020-06-24 20:28:22', 0),
(469, '311-3222', '298-5546', 0, '2020-06-24 20:28:22', 0),
(470, '279-9206', 'police', 1, '2020-06-24 22:20:31', 0),
(471, '817-9455', 'police', 1, '2020-06-24 22:20:48', 0),
(472, '279-9206', '817-9455', 1, '2020-06-24 22:25:51', 0),
(473, '817-9455', '279-9206', 0, '2020-06-24 22:25:51', 0),
(474, '597-0144', 'police', 1, '2020-06-25 03:09:02', 0),
(475, '756-2040', 'police', 1, '2020-06-25 15:46:38', 0),
(476, '279-9206', '817-9455', 1, '2020-06-25 19:17:55', 1),
(477, '817-9455', '279-9206', 0, '2020-06-25 19:17:55', 1),
(478, '817-9455', '279-9206', 1, '2020-06-25 19:31:04', 0),
(479, '279-9206', '817-9455', 0, '2020-06-25 19:31:04', 0),
(480, '279-9206', 'police', 1, '2020-06-25 19:49:31', 0),
(481, '279-9206', 'police', 1, '2020-06-25 19:52:39', 0),
(482, '298-5546', '311-3222', 1, '2020-06-25 19:53:58', 0),
(483, '311-3222', '298-5546', 0, '2020-06-25 19:53:58', 0),
(484, '617-3085', 'ambulance', 1, '2020-06-25 20:18:18', 0),
(485, '491-6742', 'salam', 1, '2020-06-27 11:18:38', 0),
(486, '119-9457', 'police', 1, '2020-06-27 14:43:36', 0),
(487, '119-9457', 'ambulance', 1, '2020-06-27 14:43:48', 0),
(488, '119-9457', '311-3222', 1, '2020-06-27 14:48:21', 0),
(489, '311-3222', '119-9457', 0, '2020-06-27 14:48:21', 0),
(490, '311-3222', '119-9457', 1, '2020-06-27 14:48:43', 0),
(491, '119-9457', '311-3222', 0, '2020-06-27 14:48:43', 0),
(492, '491-6742', 'salam', 1, '2020-06-29 16:01:43', 0),
(493, '597-0144', 'police', 1, '2020-07-02 17:46:32', 0);

-- --------------------------------------------------------

--
-- Structure de la table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `phone_messages`
--

INSERT INTO `phone_messages` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
(1947, '298-5546', '553-2186', 'GPS: -1789.5224609375, -356.72100830078', '2020-06-27 23:07:48', 1, 1),
(1946, '553-2186', '298-5546', 'GPS: -1789.5224609375, -356.72100830078', '2020-06-27 23:07:48', 1, 0),
(1945, '553-2186', '298-5546', 'b c moi', '2020-06-27 23:07:46', 1, 1),
(1944, '298-5546', '553-2186', 'b c moi', '2020-06-27 23:07:46', 1, 0),
(1943, '298-5546', '553-2186', 'GPS: -1789.5224609375, -356.72100830078', '2020-06-27 23:07:46', 1, 1),
(1942, '553-2186', '298-5546', 'GPS: -1789.5224609375, -356.72100830078', '2020-06-27 23:07:46', 1, 0),
(1941, '298-5546', '553-2186', 'a', '2020-06-27 23:07:38', 1, 1),
(1940, '553-2186', '298-5546', 'a', '2020-06-27 23:07:38', 1, 0),
(1939, '298-5546', '308-9212', 'Shwappz', '2020-06-27 23:07:37', 1, 1),
(1938, '308-9212', '298-5546', 'Shwappz', '2020-06-27 23:07:37', 1, 0),
(1937, '298-5546', '308-9212', 'fdp', '2020-06-27 23:07:33', 1, 1),
(1936, '308-9212', '298-5546', 'fdp', '2020-06-27 23:07:33', 1, 0),
(1935, '311-3222', '119-9457', 'GPS: -3156.8439941406, 925.83782958984', '2020-06-27 14:48:07', 1, 1),
(1934, '119-9457', '311-3222', 'GPS: -3156.8439941406, 925.83782958984', '2020-06-27 14:48:07', 1, 0),
(1933, '311-3222', '119-9457', 'GPS: -3156.2023925781, 933.89630126953', '2020-06-27 14:48:07', 1, 1),
(1932, '119-9457', '311-3222', 'GPS: -3156.2023925781, 933.89630126953', '2020-06-27 14:48:07', 1, 0),
(1931, '311-3222', '119-9457', 'GPS: -3155.5441894531, 943.21203613281', '2020-06-27 14:48:07', 1, 1),
(1930, '119-9457', '311-3222', 'GPS: -3155.5441894531, 943.21203613281', '2020-06-27 14:48:07', 1, 0),
(1929, '311-3222', '119-9457', 'GPS: -3154.8806152344, 953.68640136719', '2020-06-27 14:48:06', 1, 1),
(1928, '119-9457', '311-3222', 'GPS: -3154.8806152344, 953.68640136719', '2020-06-27 14:48:06', 1, 0),
(1927, '311-3222', '119-9457', 'GPS: -3154.3063964844, 960.22259521484', '2020-06-27 14:48:06', 1, 1),
(1926, '119-9457', '311-3222', 'GPS: -3154.3063964844, 960.22259521484', '2020-06-27 14:48:06', 1, 0),
(1925, '119-9457', '311-3222', 'GPS: 165.98043823242, -818.18939208984', '2020-06-27 14:33:05', 1, 1),
(1924, '311-3222', '119-9457', 'GPS: 165.98043823242, -818.18939208984', '2020-06-27 14:33:05', 1, 0),
(1923, '311-3222', '119-9457', 'pose', '2020-06-27 14:32:44', 1, 1),
(1922, '119-9457', '311-3222', 'pose', '2020-06-27 14:32:44', 1, 0),
(1921, '311-3222', '119-9457', 'GPS: -825.59289550781, -2576.6494140625', '2020-06-27 14:31:37', 1, 1),
(1920, '119-9457', '311-3222', 'GPS: -825.59289550781, -2576.6494140625', '2020-06-27 14:31:37', 1, 0),
(1919, '311-3222', '119-9457', 'coucou', '2020-06-27 14:31:28', 1, 1),
(1918, '119-9457', '311-3222', 'coucou', '2020-06-27 14:31:28', 1, 0),
(1917, 'police', '855-9801', 'stp viens', '2020-06-26 14:43:07', 1, 1),
(1916, '279-9206', '817-9455', 'GPS: 510.83465576172, -1950.1629638672', '2020-06-25 20:32:15', 1, 1),
(1915, '817-9455', '279-9206', 'GPS: 510.83465576172, -1950.1629638672', '2020-06-25 20:32:15', 1, 0),
(1914, '817-9455', '279-9206', 'GPS: 159.32600402832, -1855.4344482422', '2020-06-25 20:24:30', 1, 1),
(1913, '279-9206', '817-9455', 'GPS: 159.32600402832, -1855.4344482422', '2020-06-25 20:24:30', 1, 0),
(1912, '279-9206', '817-9455', 'GPS: 115.47109222412, -1861.9689941406', '2020-06-25 20:22:13', 1, 1),
(1911, '817-9455', '279-9206', 'GPS: 115.47109222412, -1861.9689941406', '2020-06-25 20:22:13', 1, 0),
(1910, '279-9206', '817-9455', 'GPS: 115.47109222412, -1861.9689941406', '2020-06-25 20:22:13', 1, 1),
(1909, '817-9455', '279-9206', 'GPS: 115.47109222412, -1861.9689941406', '2020-06-25 20:22:12', 1, 0),
(1908, '817-9455', '279-9206', 'GPS: 174.00259399414, -317.36508178711', '2020-06-25 19:55:41', 1, 1),
(1907, '279-9206', '817-9455', 'GPS: 174.00259399414, -317.36508178711', '2020-06-25 19:55:40', 1, 0),
(1906, 'police', '279-9206', 'venez les reufs', '2020-06-25 19:50:48', 1, 1),
(1905, 'police', '279-9206', 'jvous att', '2020-06-25 19:49:41', 1, 1),
(1904, 'police', '279-9206', 'supérette 3/3', '2020-06-25 19:47:46', 1, 1),
(1902, '817-9455', '279-9206', 'pose', '2020-06-25 19:31:09', 1, 0),
(1903, '279-9206', '817-9455', 'pose', '2020-06-25 19:31:09', 1, 1),
(1901, '817-9455', '279-9206', 'GPS: 114.46980285645, -1016.9152832031', '2020-06-25 15:05:08', 1, 1),
(1900, '279-9206', '817-9455', 'GPS: 114.46980285645, -1016.9152832031', '2020-06-25 15:05:08', 1, 0),
(1899, '817-9455', '279-9206', 'GPS: 114.25720977783, -1023.010925293', '2020-06-25 15:04:54', 1, 1),
(1897, '279-9206', '817-9455', 'GPS: 400.84533691406, -1118.1301269531', '2020-06-25 15:00:25', 1, 1),
(1898, '279-9206', '817-9455', 'GPS: 114.25720977783, -1023.010925293', '2020-06-25 15:04:54', 1, 0),
(1895, '817-9455', '279-9206', 'pos', '2020-06-25 15:00:21', 1, 1),
(1896, '817-9455', '279-9206', 'GPS: 400.84533691406, -1118.1301269531', '2020-06-25 15:00:25', 1, 0),
(1894, '279-9206', '817-9455', 'pos', '2020-06-25 15:00:21', 1, 0),
(1892, '279-9206', '817-9455', 'pos', '2020-06-24 22:39:23', 1, 0),
(1893, '817-9455', '279-9206', 'pos', '2020-06-24 22:39:23', 1, 1),
(1891, '817-9455', '279-9206', 'GPS: -3231.4738769531, 969.94140625', '2020-06-24 22:31:32', 1, 1),
(1890, '279-9206', '817-9455', 'GPS: -3231.4738769531, 969.94140625', '2020-06-24 22:31:32', 1, 0),
(1889, 'police', '279-9206', 'dites si vous venez les man', '2020-06-24 22:20:53', 1, 1),
(1888, 'police', '279-9206', 'GPS: -3232.9409179688, 972.54766845703', '2020-06-24 22:20:42', 1, 1),
(1887, 'police', '279-9206', 'ballas gang venez course poursuite', '2020-06-24 22:20:41', 1, 1),
(1886, '279-9206', '817-9455', 'GPS: -1582.4937744141, 2100.83984375', '2020-06-24 22:05:27', 1, 1),
(1884, '817-9455', '279-9206', 'pos', '2020-06-24 22:05:16', 1, 1),
(1885, '817-9455', '279-9206', 'GPS: -1582.4937744141, 2100.83984375', '2020-06-24 22:05:27', 1, 0),
(1883, '279-9206', '817-9455', 'pos', '2020-06-24 22:05:16', 1, 0),
(1882, '279-9206', '817-9455', 'c est toi mon fils', '2020-06-24 21:59:30', 1, 1),
(1881, '817-9455', '279-9206', 'c est toi mon fils', '2020-06-24 21:59:30', 1, 0),
(1880, '817-9455', '279-9206', 'wsh fils', '2020-06-24 21:59:14', 1, 1),
(1879, '279-9206', '817-9455', 'wsh fils', '2020-06-24 21:59:13', 1, 0),
(1878, '298-5546', '161-0697', '.', '2020-06-24 20:04:55', 1, 1),
(1877, '161-0697', '298-5546', '.', '2020-06-24 20:04:55', 1, 0),
(1876, '468-3246', '407-3972', 'GPS: -1813.6813964844, -516.93627929688', '2020-06-24 19:40:22', 1, 1),
(1875, '407-3972', '468-3246', 'GPS: -1813.6813964844, -516.93627929688', '2020-06-24 19:40:22', 1, 0),
(1874, '468-3246', '407-3972', 'GPS: -990.41174316406, -169.59857177734', '2020-06-24 18:36:31', 1, 1),
(1873, '407-3972', '468-3246', 'GPS: -990.41174316406, -169.59857177734', '2020-06-24 18:36:30', 1, 0),
(1872, '468-3246', '407-3972', 'vsy fils', '2020-06-24 18:35:05', 1, 1),
(1871, '407-3972', '468-3246', 'vsy fils', '2020-06-24 18:35:05', 1, 0),
(1870, '407-3972', '468-3246', 'wsh', '2020-06-24 18:34:55', 1, 1),
(1869, '468-3246', '407-3972', 'wsh', '2020-06-24 18:34:55', 1, 0),
(1868, 'ambulance', '247-2697', 'svp', '2020-06-22 15:33:21', 1, 1),
(1867, '224-8776', '404-0586', 'allo', '2020-06-07 04:14:38', 1, 1),
(1866, '194-9520', '852-5102', 'GPS: 1382.6448974609, 3566.98046875', '2020-06-07 01:46:50', 1, 1),
(1865, '852-5102', '194-9520', 'GPS: 1382.6448974609, 3566.98046875', '2020-06-07 01:46:50', 1, 0),
(1864, '194-9520', '852-5102', 'GPS: 1457.3239746094, 3654.3393554688', '2020-06-07 01:43:53', 1, 1),
(1863, '852-5102', '194-9520', 'GPS: 1457.3239746094, 3654.3393554688', '2020-06-07 01:43:53', 1, 0),
(1862, '194-9520', '852-5102', 'GPS: 1917.8411865234, 3859.3159179688', '2020-06-07 01:39:02', 1, 1),
(1861, '852-5102', '194-9520', 'GPS: 1917.8411865234, 3859.3159179688', '2020-06-07 01:39:02', 1, 0),
(1860, 'ambulance', '404-0586', 'urgence', '2020-06-07 00:15:48', 1, 1),
(1859, 'police', '924-7150', 'a l\'aide', '2020-06-05 22:47:36', 1, 1),
(1858, 'ambulance', '924-7150', 'aider moi', '2020-06-05 22:46:52', 1, 1),
(1857, 'ambulance', '924-7150', 'GPS: -774.89453125, -2357.609375', '2020-06-05 22:46:35', 1, 1),
(1856, '924-8776', '470-9281', 't ou ?', '2020-06-05 20:16:54', 1, 1),
(1855, '470-9281', '924-8776', 't ou ?', '2020-06-05 20:16:54', 1, 0),
(1853, '470-9281', '924-8776', 'je farme', '2020-06-05 19:15:45', 1, 0),
(1854, '924-8776', '470-9281', 'je farme', '2020-06-05 19:15:45', 1, 1),
(1827, '924-8776', '719-7180', 'GPS: 1285.6849365234, -2612.6154785156', '2020-06-04 19:51:09', 1, 1),
(1851, '924-8776', '470-9281', 'T\'es ou ?', '2020-06-05 19:13:37', 1, 0),
(1852, '470-9281', '924-8776', 'T\'es ou ?', '2020-06-05 19:13:38', 1, 1),
(1850, '924-8776', '470-9281', 'peut pas la', '2020-06-05 19:13:27', 1, 1),
(1824, '924-8776', '719-7180', 'GPS: 1022.9075927734, -2925.7231445313', '2020-06-04 19:47:55', 1, 0),
(1823, '924-8776', '719-7180', 'pos', '2020-06-04 19:47:49', 1, 1),
(1849, '470-9281', '924-8776', 'peut pas la', '2020-06-05 19:13:27', 1, 0),
(1821, '924-8776', '719-7180', 'ok', '2020-06-04 19:47:48', 1, 1),
(1848, '470-9281', '924-8776', 'vien villa', '2020-06-05 19:09:29', 1, 1),
(1818, '924-8776', '719-7180', 'je l\'ai', '2020-06-04 19:47:42', 1, 0),
(1817, '924-8776', '719-7180', 'mais va y', '2020-06-04 19:46:48', 1, 1),
(1815, '924-8776', '719-7180', 'nop', '2020-06-04 19:46:47', 1, 1),
(1847, '924-8776', '470-9281', 'vien villa', '2020-06-05 19:09:29', 1, 0),
(1845, '470-9281', '924-8776', 'tfk ?', '2020-06-05 19:09:18', 1, 0),
(1812, '924-8776', '719-7180', 'tu m\'entend ?.', '2020-06-04 19:46:37', 1, 0),
(1846, '924-8776', '470-9281', 'tfk ?', '2020-06-05 19:09:18', 1, 1),
(1842, '924-8776', '470-9281', 'pd', '2020-06-05 19:08:41', 1, 1),
(1843, '924-8776', '470-9281', 'tgl', '2020-06-05 19:08:49', 1, 0),
(1844, '470-9281', '924-8776', 'tgl', '2020-06-05 19:08:49', 1, 1),
(1810, '924-8776', '719-7180', 'il est en cross habillé comme tout a l\'heure au mécano', '2020-06-04 19:43:57', 1, 0),
(1809, '924-8776', '719-7180', 'j\'le cherche tu bloque', '2020-06-04 19:43:46', 1, 1),
(1841, '470-9281', '924-8776', 'pd', '2020-06-05 19:08:41', 1, 0),
(1807, '924-8776', '719-7180', 'ok', '2020-06-04 19:43:42', 1, 1),
(1839, '719-7180', '924-8776', 'GPS: -91.361625671387, 363.41195678711', '2020-06-05 19:05:28', 1, 0),
(1840, '924-8776', '719-7180', 'GPS: -91.361625671387, 363.41195678711', '2020-06-05 19:05:28', 1, 1),
(1804, '924-8776', '719-7180', 'je sais pas ou il est mais il est encore dans le port je l\'ai pas vu sortir', '2020-06-04 19:43:35', 1, 0),
(1838, '924-8776', '719-7180', 'look discord', '2020-06-05 18:16:06', 1, 1),
(1803, '924-8776', '719-7180', 'GPS: -1088.1654052734, 2198.4016113281', '2020-06-04 19:43:02', 1, 1),
(1837, '719-7180', '924-8776', 'look discord', '2020-06-05 18:16:06', 1, 0),
(1800, '924-8776', '719-7180', 'GPS: 733.48321533203, -2854.8190917969', '2020-06-04 19:42:51', 1, 0),
(1836, '924-8776', '719-7180', 'GPS: 75.443756103516, -1330.4927978516', '2020-06-05 17:50:48', 1, 1),
(1798, '924-8776', '719-7180', 'je bloque la sortie du port', '2020-06-04 19:41:55', 1, 0),
(1834, '719-7180', '924-8776', 'GPS: -1142.6351318359, 4920.9384765625', '2020-06-05 16:49:05', 1, 1),
(1797, '924-8776', '719-7180', 'reste la bas', '2020-06-04 19:41:42', 1, 1),
(1795, '924-8776', '719-7180', 'vite on est 2', '2020-06-04 19:41:30', 1, 1),
(1835, '719-7180', '924-8776', 'GPS: 75.443756103516, -1330.4927978516', '2020-06-05 17:50:48', 1, 0),
(1792, '924-8776', '719-7180', 'port ou on a drift hier je suis partie j\'arrive a la villa', '2020-06-04 19:41:30', 1, 0),
(1833, '924-8776', '719-7180', 'GPS: -1142.6351318359, 4920.9384765625', '2020-06-05 16:49:05', 1, 0),
(1791, '924-8776', '719-7180', 'pos', '2020-06-04 19:41:13', 1, 1),
(1831, '470-9281', '924-8776', 'boss', '2020-06-04 21:26:12', 1, 0),
(1832, '924-8776', '470-9281', 'boss', '2020-06-04 21:26:12', 1, 1),
(1788, '924-8776', '719-7180', 'Ya le famillies au port', '2020-06-04 19:40:56', 1, 0),
(1787, '924-9776', '470-9281', 'tfk ?', '2020-06-04 19:22:34', 1, 1),
(1786, '924-9776', '470-9281', 'boss', '2020-06-04 19:21:50', 1, 1),
(1785, '924-8776', '719-7180', 'Will ma kouine', '2020-06-04 19:04:32', 1, 1),
(1830, '470-9281', '924-8776', 'Tedy', '2020-06-04 21:25:28', 1, 1),
(1829, '924-8776', '470-9281', 'Tedy', '2020-06-04 21:25:28', 1, 0),
(1782, '924-8776', '719-7180', 'Tedy', '2020-06-04 18:54:04', 1, 0),
(1781, '518-6651', '943-5237', 'Je suis de retour*', '2020-06-04 17:43:47', 1, 1),
(1780, '943-5237', '518-6651', 'Je suis de retour*', '2020-06-04 17:43:47', 0, 0),
(1779, '404-0586', '943-5237', 'GPS: 751.49719238281, -2238.5883789063', '2020-06-03 21:44:56', 1, 1),
(1778, '943-5237', '404-0586', 'GPS: 751.49719238281, -2238.5883789063', '2020-06-03 21:44:56', 1, 0),
(1777, '404-0586', '943-5237', 'GPS: 689.82312011719, -1444.34765625', '2020-06-03 21:43:33', 1, 1),
(1776, '943-5237', '404-0586', 'GPS: 689.82312011719, -1444.34765625', '2020-06-03 21:43:33', 1, 0),
(1774, '518-6651', '943-5237', 'Je suis en ville si besoin', '2020-06-03 21:25:58', 1, 0),
(1775, '943-5237', '518-6651', 'Je suis en ville si besoin', '2020-06-03 21:25:58', 1, 1),
(1773, '518-6651', '943-5237', 'Je te recontact si j\'ai des info', '2020-06-03 20:42:52', 1, 1),
(1772, '943-5237', '518-6651', 'Je te recontact si j\'ai des info', '2020-06-03 20:42:52', 1, 0),
(1771, 'ambulance', '404-0586', 'urgence', '2020-06-03 20:28:42', 1, 1),
(1770, '943-5237', '404-0586', 'c bon', '2020-06-03 20:22:41', 1, 1),
(1769, '404-0586', '943-5237', 'c bon', '2020-06-03 20:22:40', 1, 0),
(1768, '943-5237', '404-0586', 'venez', '2020-06-03 20:03:00', 1, 1),
(1767, '404-0586', '943-5237', 'venez', '2020-06-03 20:03:00', 1, 0),
(1766, '943-5237', '404-0586', 'GPS: 899.81707763672, -72.574989318848', '2020-06-03 20:02:53', 1, 1),
(1765, '404-0586', '943-5237', 'GPS: 899.81707763672, -72.574989318848', '2020-06-03 20:02:53', 1, 0),
(1764, 'ambulance', '404-0586', 'urgence!!!', '2020-06-03 20:02:36', 1, 1),
(1763, '943-5237', '518-6651', 'ça resterait entre toi et moi bien entendu', '2020-06-03 18:24:51', 1, 1),
(1762, '518-6651', '943-5237', 'ça resterait entre toi et moi bien entendu', '2020-06-03 18:24:51', 1, 0),
(1761, '943-5237', '518-6651', 'Si tu as un filon sur la drogue ça m\'intéresse, je te donne un pourcentage si tu as des infos.', '2020-06-03 18:23:59', 1, 1),
(1760, '518-6651', '943-5237', 'Si tu as un filon sur la drogue ça m\'intéresse, je te donne un pourcentage si tu as des infos.', '2020-06-03 18:23:59', 1, 0),
(1759, '518-6651', '943-5237', 'La drogue haha en vrai je sais pas', '2020-06-03 18:22:40', 1, 1),
(1758, '943-5237', '518-6651', 'La drogue haha en vrai je sais pas', '2020-06-03 18:22:40', 1, 0),
(1757, '943-5237', '518-6651', 'Aurais-tu un plan pour gagner un peu d\'argent ?', '2020-06-03 18:22:02', 1, 1),
(1756, '518-6651', '943-5237', 'Aurais-tu un plan pour gagner un peu d\'argent ?', '2020-06-03 18:22:01', 1, 0),
(1755, '518-6651', '943-5237', 'Je suis revenu au comico', '2020-06-03 18:04:29', 1, 1),
(1754, '943-5237', '518-6651', 'Je suis revenu au comico', '2020-06-03 18:04:29', 1, 0),
(1753, '943-5237', '518-6651', 'Tu fais quoi de beau ?', '2020-06-03 17:30:48', 1, 1),
(1752, '518-6651', '943-5237', 'Tu fais quoi de beau ?', '2020-06-03 17:30:47', 1, 0),
(1751, '943-5237', '518-6651', 'Tu es toujours en ville ?', '2020-06-03 15:47:06', 1, 1),
(1750, '518-6651', '943-5237', 'Tu es toujours en ville ?', '2020-06-03 15:47:05', 1, 0),
(1749, '943-5237', '404-0586', 'appel quand tes dispo', '2020-06-03 01:41:51', 1, 1),
(1748, '404-0586', '943-5237', 'appel quand tes dispo', '2020-06-03 01:41:51', 1, 0),
(1747, '943-5237', '518-6651', 'Je vais me coucher, la morphine fait effet, à demain, bonne nuit ;)', '2020-06-03 01:13:13', 1, 1),
(1746, '518-6651', '943-5237', 'Je vais me coucher, la morphine fait effet, à demain, bonne nuit ;)', '2020-06-03 01:13:12', 1, 0),
(1745, '943-5237', '518-6651', 'Je n\'ai aucune preuve pour le ticket', '2020-06-03 00:39:49', 1, 1),
(1744, '518-6651', '943-5237', 'Je n\'ai aucune preuve pour le ticket', '2020-06-03 00:39:49', 1, 0),
(1743, '518-6651', '943-5237', 'Dsl j\'etais pas la bg', '2020-06-03 00:15:19', 1, 1),
(1742, '943-5237', '518-6651', 'Dsl j\'etais pas la bg', '2020-06-03 00:15:19', 1, 0),
(1741, '173-0050', '404-0586', 'GPS: 479.34646606445, -1411.8475341797', '2020-06-03 00:10:45', 1, 1),
(1735, '518-6651', '943-5237', 'Vien dans le magasin', '2020-06-02 23:51:49', 1, 1),
(1734, '943-5237', '518-6651', 'Vien dans le magasin', '2020-06-02 23:51:49', 1, 0),
(1733, '518-6651', '943-5237', 'MDRRRRRRRRR', '2020-06-02 23:51:40', 1, 1),
(1732, '943-5237', '518-6651', 'MDRRRRRRRRR', '2020-06-02 23:51:40', 1, 0),
(1731, '943-5237', '518-6651', 'La police poursuivit par la police', '2020-06-02 23:49:18', 1, 1),
(1730, '518-6651', '943-5237', 'La police poursuivit par la police', '2020-06-02 23:49:18', 1, 0),
(1729, '518-6651', '943-5237', 'c la merde mdr', '2020-06-02 23:48:21', 1, 1),
(1728, '943-5237', '518-6651', 'c la merde mdr', '2020-06-02 23:48:21', 1, 0),
(1727, '943-5237', '518-6651', 'GPS: 15.774158477783, 6538.8041992188', '2020-06-02 23:46:19', 1, 1),
(1726, '518-6651', '943-5237', 'GPS: 15.774158477783, 6538.8041992188', '2020-06-02 23:46:19', 1, 0),
(1725, '518-6651', '943-5237', 'envoi pos', '2020-06-02 23:46:14', 1, 1),
(1724, '943-5237', '518-6651', 'envoi pos', '2020-06-02 23:46:14', 1, 0),
(1723, '518-6651', '943-5237', 'oui', '2020-06-02 23:46:11', 1, 1),
(1722, '943-5237', '518-6651', 'oui', '2020-06-02 23:46:10', 1, 0),
(1721, '943-5237', '518-6651', 'Je vous attend à mon taxi', '2020-06-02 23:44:20', 1, 1),
(1720, '518-6651', '943-5237', 'Je vous attend à mon taxi', '2020-06-02 23:44:20', 1, 0),
(1719, '943-5237', '518-6651', 'GPS: 36.345836639404, 6536.779296875', '2020-06-02 23:42:26', 1, 1),
(1718, '518-6651', '943-5237', 'GPS: 36.345836639404, 6536.779296875', '2020-06-02 23:42:26', 1, 0),
(1717, '518-6651', '943-5237', 'oui jai recup mon vehicule jarrive', '2020-06-02 23:37:36', 1, 1),
(1716, '943-5237', '518-6651', 'oui jai recup mon vehicule jarrive', '2020-06-02 23:37:36', 1, 0),
(1715, '943-5237', '518-6651', 'Tout va bien ?', '2020-06-02 23:37:18', 1, 1),
(1714, '518-6651', '943-5237', 'Tout va bien ?', '2020-06-02 23:37:18', 1, 0),
(1713, '404-0586', '943-5237', 'GPS: -22.279064178467, 6489.2280273438', '2020-06-02 23:28:16', 1, 1),
(1711, '518-6651', '943-5237', 'Mike', '2020-06-02 23:12:56', 1, 1),
(1712, '943-5237', '404-0586', 'GPS: -22.279064178467, 6489.2280273438', '2020-06-02 23:28:16', 1, 0),
(1710, '943-5237', '518-6651', 'Mike', '2020-06-02 23:12:56', 1, 0),
(1708, '404-0586', '943-5237', 'Jack', '2020-06-02 22:44:22', 1, 0),
(1709, '943-5237', '404-0586', 'Jack', '2020-06-02 22:44:22', 1, 1),
(1707, '719-7180', '518-6651', 'C\'est sympa de votre part', '2020-06-02 22:08:41', 1, 1),
(1706, '518-6651', '719-7180', 'C\'est sympa de votre part', '2020-06-02 22:08:41', 1, 0),
(1705, '518-6651', '719-7180', 'Je vais vous les redonner', '2020-06-02 22:08:21', 1, 1),
(1704, '719-7180', '518-6651', 'Je vais vous les redonner', '2020-06-02 22:08:21', 1, 0),
(1703, '518-6651', '719-7180', 'Ah ?', '2020-06-02 22:08:18', 1, 1),
(1702, '719-7180', '518-6651', 'Ah ?', '2020-06-02 22:08:18', 1, 0),
(1701, '719-7180', '518-6651', 'Excusez-moi, je ne remarque que maintenant qu\'il manque mes 5 hamburgers dans le sac que vous m\'avez donné.', '2020-06-02 22:08:05', 1, 1),
(1700, '518-6651', '719-7180', 'Excusez-moi, je ne remarque que maintenant qu\'il manque mes 5 hamburgers dans le sac que vous m\'avez donné.', '2020-06-02 22:08:05', 1, 0),
(1699, '518-6651', '719-7180', 'sans probleme', '2020-06-02 21:29:25', 1, 1),
(1698, '719-7180', '518-6651', 'sans probleme', '2020-06-02 21:29:25', 1, 0),
(1696, '518-6651', '719-7180', 'Merci bien', '2020-06-02 21:29:08', 1, 0),
(1697, '719-7180', '518-6651', 'Merci bien', '2020-06-02 21:29:08', 1, 1),
(1695, '518-6651', '719-7180', 'Recu', '2020-06-02 21:28:49', 1, 1),
(1694, '719-7180', '518-6651', 'Recu', '2020-06-02 21:28:48', 1, 0),
(1693, '719-7180', '518-6651', 'Abel Suarez chauffeur de taxi', '2020-06-02 21:28:41', 1, 1),
(1692, '518-6651', '719-7180', 'Abel Suarez chauffeur de taxi', '2020-06-02 21:28:41', 1, 0),
(1739, '943-5237', '518-6651', 'J\'ai mal', '2020-06-03 00:07:37', 1, 1),
(1740, '404-0586', '173-0050', 'GPS: 479.34646606445, -1411.8475341797', '2020-06-03 00:10:45', 1, 0),
(1736, '518-6651', '943-5237', 'Tu m\'as renversé, je ne peux plus bouger.', '2020-06-03 00:07:27', 1, 0),
(1737, '943-5237', '518-6651', 'Tu m\'as renversé, je ne peux plus bouger.', '2020-06-03 00:07:27', 1, 1),
(1738, '518-6651', '943-5237', 'J\'ai mal', '2020-06-03 00:07:37', 1, 0),
(1689, '938-4023', '511-8077', 'khtek', '2020-06-02 17:55:22', 1, 1),
(1687, '511-8077', '938-4023', 'mouk', '2020-06-02 17:55:09', 1, 1),
(1688, '511-8077', '938-4023', 'khtek', '2020-06-02 17:55:22', 0, 0),
(1686, '938-4023', '511-8077', 'mouk', '2020-06-02 17:55:09', 1, 0),
(1685, '938-4023', '511-8077', 'nuuuuuul', '2020-06-02 17:54:22', 1, 1),
(1684, '511-8077', '938-4023', 'nuuuuuul', '2020-06-02 17:54:22', 1, 0),
(1683, '938-4023', '511-8077', 'GPS: -2447.3232421875, 2283.3522949219', '2020-06-02 17:45:58', 1, 1),
(1682, '511-8077', '938-4023', 'GPS: -2447.3232421875, 2283.3522949219', '2020-06-02 17:45:57', 1, 0),
(1681, '511-8077', '938-4023', 'GPS: -1450.1556396484, -756.43170166016', '2020-06-02 17:31:03', 1, 1),
(1680, '938-4023', '511-8077', 'GPS: -1450.1556396484, -756.43170166016', '2020-06-02 17:31:03', 1, 0),
(1679, '938-4023', '511-8077', 'GPS: 223.90405273438, -926.56915283203', '2020-06-02 17:03:57', 1, 1),
(1678, '511-8077', '938-4023', 'GPS: 223.90405273438, -926.56915283203', '2020-06-02 17:03:57', 1, 0),
(1677, '511-8077', '938-4023', 'yo', '2020-06-02 15:41:00', 1, 1),
(1676, '938-4023', '511-8077', 'yo', '2020-06-02 15:41:00', 1, 0),
(1675, '938-4023', '511-8077', 'yo', '2020-06-02 15:38:34', 1, 1),
(1674, '511-8077', '938-4023', 'yo', '2020-06-02 15:38:34', 1, 0),
(1673, '855-5541', '973-5030', 'ok', '2020-06-01 19:40:22', 1, 1),
(1672, '973-5030', '855-5541', 'ok', '2020-06-01 19:40:22', 1, 0),
(1671, '973-5030', '855-5541', 'Vladimir Patron', '2020-06-01 19:40:17', 1, 1),
(1670, '855-5541', '973-5030', 'Vladimir Patron', '2020-06-01 19:40:17', 1, 0),
(1669, '924-8776', '220-4972', 'Tiago', '2020-06-01 19:38:22', 1, 1),
(1828, '924-9776', '470-9281', 't la ?', '2020-06-04 21:16:53', 1, 1),
(1110, '997-6488', '458-3849', 'GPS: -1177.3779296875, -1570.0557861328', '2020-04-02 17:31:06', 1, 0),
(1111, '458-3849', '997-6488', 'GPS: -1177.3779296875, -1570.0557861328', '2020-04-02 17:31:06', 1, 1),
(1112, '458-3849', '997-6488', 'je peux pas la', '2020-04-02 17:31:17', 1, 0),
(1113, '997-6488', '458-3849', 'je peux pas la', '2020-04-02 17:31:17', 1, 1),
(1114, '458-3849', '997-6488', 'je bosse sur un truc secret', '2020-04-02 17:31:23', 1, 0),
(1115, '997-6488', '458-3849', 'je bosse sur un truc secret', '2020-04-02 17:31:24', 1, 1),
(1116, '997-6488', '458-3849', 'ha tu peux pas venir me chercher', '2020-04-02 17:31:43', 1, 0),
(1117, '458-3849', '997-6488', 'ha tu peux pas venir me chercher', '2020-04-02 17:31:43', 1, 1),
(1118, '458-3849', '997-6488', 'nan', '2020-04-02 17:31:49', 1, 0),
(1119, '997-6488', '458-3849', 'nan', '2020-04-02 17:31:50', 1, 1),
(1120, '458-3849', '997-6488', 'jsuis au nord', '2020-04-02 17:31:53', 1, 0),
(1121, '997-6488', '458-3849', 'jsuis au nord', '2020-04-02 17:31:53', 1, 1),
(1122, '997-6488', '458-3849', 'ok', '2020-04-02 17:32:00', 1, 0),
(1123, '458-3849', '997-6488', 'ok', '2020-04-02 17:32:00', 1, 1),
(1124, '997-6488', '458-3849', 'il y a les flic', '2020-04-02 17:32:20', 1, 0),
(1125, '458-3849', '997-6488', 'il y a les flic', '2020-04-02 17:32:21', 1, 1),
(1126, '458-3849', '997-6488', 'et', '2020-04-02 17:32:27', 1, 0),
(1127, '997-6488', '458-3849', 'et', '2020-04-02 17:32:27', 1, 1),
(1128, '997-6488', '458-3849', 'tu pourras venir quand', '2020-04-02 17:33:47', 1, 0),
(1129, '458-3849', '997-6488', 'tu pourras venir quand', '2020-04-02 17:33:47', 1, 1),
(1130, '959-3874', '455-5262', 'Tu veut pas m\'aider ?', '2020-04-02 17:34:38', 1, 0),
(1131, '455-5262', '959-3874', 'Tu veut pas m\'aider ?', '2020-04-02 17:34:38', 1, 1),
(1132, '959-3874', '455-5262', 'Je vais devenir folle la vie', '2020-04-02 17:34:45', 1, 0),
(1133, '455-5262', '959-3874', 'Je vais devenir folle la vie', '2020-04-02 17:34:45', 1, 1),
(1134, '959-3874', '455-5262', 'C\'est trop galère', '2020-04-02 17:34:47', 1, 0),
(1135, '455-5262', '959-3874', 'C\'est trop galère', '2020-04-02 17:34:48', 1, 1),
(1136, '455-5262', '959-3874', 'mais moi je connais le point déjà', '2020-04-02 17:34:59', 1, 0),
(1137, '959-3874', '455-5262', 'mais moi je connais le point déjà', '2020-04-02 17:34:59', 1, 1),
(1138, '959-3874', '455-5262', 'J\'ai trouver un bunker', '2020-04-02 17:35:51', 1, 0),
(1139, '455-5262', '959-3874', 'J\'ai trouver un bunker', '2020-04-02 17:35:51', 1, 1),
(1140, '959-3874', '455-5262', 'C\'est les ressources militaires ?', '2020-04-02 17:38:56', 1, 0),
(1141, '455-5262', '959-3874', 'C\'est les ressources militaires ?', '2020-04-02 17:38:56', 1, 1),
(1142, '455-5262', '959-3874', 'mdrrrrrrrrrr bien joué bb', '2020-04-02 17:39:12', 1, 0),
(1143, '959-3874', '455-5262', 'mdrrrrrrrrrr bien joué bb', '2020-04-02 17:39:12', 1, 1),
(1144, '959-3874', '455-5262', 'MERCI', '2020-04-02 17:39:20', 1, 0),
(1145, '455-5262', '959-3874', 'MERCI', '2020-04-02 17:39:20', 1, 1),
(1146, '455-5262', '959-3874', ':coeur:', '2020-04-02 17:39:35', 1, 0),
(1147, '959-3874', '455-5262', ':coeur:', '2020-04-02 17:39:35', 1, 1),
(1148, '458-3849', '997-6488', 'pas tout de suite', '2020-04-02 17:42:24', 1, 0),
(1149, '997-6488', '458-3849', 'pas tout de suite', '2020-04-02 17:42:24', 1, 1),
(1150, '259-4698', '722-7740', 'je suis en ville je te dis si je trouve le traitement de l\'extazy', '2020-04-02 17:47:16', 1, 0),
(1151, '722-7740', '259-4698', 'je suis en ville je te dis si je trouve le traitement de l\'extazy', '2020-04-02 17:47:16', 1, 1),
(1152, '455-5262', '959-3874', 'vraiment quand vous trouver', '2020-04-02 17:57:07', 1, 0),
(1153, '959-3874', '455-5262', 'vraiment quand vous trouver', '2020-04-02 17:57:07', 1, 1),
(1154, '455-5262', '959-3874', 'donner et vendez a personne le point', '2020-04-02 17:57:17', 1, 0),
(1155, '959-3874', '455-5262', 'donner et vendez a personne le point', '2020-04-02 17:57:17', 1, 1),
(1156, '959-3874', '455-5262', 'Tkt', '2020-04-02 17:57:40', 1, 0),
(1157, '455-5262', '959-3874', 'Tkt', '2020-04-02 17:57:40', 1, 1),
(1158, '997-6488', '458-3849', 'tu vien a l\'evente', '2020-04-02 18:08:15', 1, 0),
(1159, '458-3849', '997-6488', 'tu vien a l\'evente', '2020-04-02 18:08:15', 1, 1),
(1160, '722-7740', '259-4698', 'j\'ai pas le traitement de l\'extazy j\'ai la vente weed le run d\'heroine', '2020-04-02 18:08:47', 1, 0),
(1161, '259-4698', '722-7740', 'j\'ai pas le traitement de l\'extazy j\'ai la vente weed le run d\'heroine', '2020-04-02 18:08:47', 1, 1),
(1162, '259-4698', '722-7740', 'envoie par mail tout les points et et je t\'envoie celui du traitement', '2020-04-02 18:09:16', 1, 0),
(1163, '722-7740', '259-4698', 'envoie par mail tout les points et et je t\'envoie celui du traitement', '2020-04-02 18:09:16', 1, 1),
(1164, '458-3849', '997-6488', 'va faire le fight club', '2020-04-02 18:12:24', 1, 0),
(1165, '997-6488', '458-3849', 'va faire le fight club', '2020-04-02 18:12:25', 1, 1),
(1166, '997-6488', '458-3849', 'ok', '2020-04-02 18:12:35', 1, 0),
(1167, '458-3849', '997-6488', 'ok', '2020-04-02 18:12:35', 1, 1),
(1168, '455-5262', '714-4890', 'ce fdp il faisais que ce tp MDRRRRRRRRRRRRRR', '2020-04-02 18:21:41', 1, 0),
(1169, '714-4890', '455-5262', 'ce fdp il faisais que ce tp MDRRRRRRRRRRRRRR', '2020-04-02 18:21:41', 1, 1),
(1170, '714-4890', '455-5262', 'mdrrr je c', '2020-04-02 18:21:47', 1, 0),
(1171, '455-5262', '714-4890', 'mdrrr je c', '2020-04-02 18:21:47', 1, 1),
(1172, '714-4890', '455-5262', 'réa pas', '2020-04-02 18:22:33', 1, 0),
(1173, '455-5262', '714-4890', 'réa pas', '2020-04-02 18:22:33', 1, 1),
(1174, '714-4890', '455-5262', 'ya un ems exprès la pr', '2020-04-02 18:22:36', 1, 0),
(1175, '455-5262', '714-4890', 'ya un ems exprès la pr', '2020-04-02 18:22:36', 1, 1),
(1176, '455-5262', '714-4890', 'c pas moi qui réa depuis tal', '2020-04-02 18:22:42', 1, 0),
(1177, '714-4890', '455-5262', 'c pas moi qui réa depuis tal', '2020-04-02 18:22:43', 1, 1),
(1178, '259-4698', '722-7740', 'on est d\'accord vous avez pas le blanchissement', '2020-04-02 18:26:30', 1, 0),
(1179, '722-7740', '259-4698', 'on est d\'accord vous avez pas le blanchissement', '2020-04-02 18:26:30', 1, 1),
(1180, '259-4698', '722-7740', '?|', '2020-04-02 18:26:33', 1, 0),
(1181, '722-7740', '259-4698', '?|', '2020-04-02 18:26:33', 1, 1),
(1182, '722-7740', '259-4698', 'nn', '2020-04-02 18:26:47', 1, 0),
(1183, '259-4698', '722-7740', 'nn', '2020-04-02 18:26:47', 1, 1),
(1184, '259-4698', '722-7740', 'ok ok', '2020-04-02 18:29:24', 1, 0),
(1185, '722-7740', '259-4698', 'ok ok', '2020-04-02 18:29:24', 1, 1),
(1186, '997-6488', '458-3849', '10000', '2020-04-02 18:31:05', 1, 0),
(1187, '458-3849', '997-6488', '10000', '2020-04-02 18:31:05', 1, 1),
(1188, '997-6488', '458-3849', 'dans les pauche', '2020-04-02 18:31:12', 1, 0),
(1189, '458-3849', '997-6488', 'dans les pauche', '2020-04-02 18:31:12', 1, 1),
(1190, '458-3849', '997-6488', 'ta gagner .', '2020-04-02 18:31:15', 1, 0),
(1191, '997-6488', '458-3849', 'ta gagner .', '2020-04-02 18:31:15', 1, 1),
(1192, '458-3849', '997-6488', 'gg', '2020-04-02 18:31:16', 1, 0),
(1193, '997-6488', '458-3849', 'gg', '2020-04-02 18:31:17', 1, 1),
(1194, '997-6488', '458-3849', 'oui', '2020-04-02 18:31:22', 1, 0),
(1195, '458-3849', '997-6488', 'oui', '2020-04-02 18:31:23', 1, 1),
(1196, '970-0308', '247-2377', 'GPS: 76.198928833008, -2256.3952636719', '2020-04-02 18:34:29', 1, 0),
(1197, '247-2377', '970-0308', 'GPS: 76.198928833008, -2256.3952636719', '2020-04-02 18:34:29', 1, 1),
(1198, '247-2377', '970-0308', 'Ah ouais ducoup vous vous êtes barré sans moi', '2020-04-02 18:37:40', 1, 0),
(1199, '970-0308', '247-2377', 'Ah ouais ducoup vous vous êtes barré sans moi', '2020-04-02 18:37:40', 1, 1),
(1200, '247-2377', '970-0308', ':\')', '2020-04-02 18:37:43', 1, 0),
(1201, '970-0308', '247-2377', ':\')', '2020-04-02 18:37:43', 1, 1),
(1202, '259-4698', '722-7740', 'T OU', '2020-04-02 18:40:25', 1, 0),
(1203, '722-7740', '259-4698', 'T OU', '2020-04-02 18:40:25', 1, 1),
(1204, '722-7740', '259-4698', 'je me suis pris un poto X)', '2020-04-02 18:40:48', 1, 0),
(1205, '259-4698', '722-7740', 'je me suis pris un poto X)', '2020-04-02 18:40:48', 1, 1),
(1206, '259-4698', '722-7740', 'mdr et t ou', '2020-04-02 18:40:55', 1, 0),
(1207, '722-7740', '259-4698', 'mdr et t ou', '2020-04-02 18:40:55', 1, 1),
(1208, '259-4698', '722-7740', 'pose', '2020-04-02 18:40:57', 1, 0),
(1209, '722-7740', '259-4698', 'pose', '2020-04-02 18:40:57', 1, 1),
(1210, '722-7740', '259-4698', 'mais je les ais seme', '2020-04-02 18:40:59', 1, 0),
(1211, '259-4698', '722-7740', 'mais je les ais seme', '2020-04-02 18:40:59', 1, 1),
(1212, '259-4698', '722-7740', 'pose', '2020-04-02 18:41:05', 1, 0),
(1213, '722-7740', '259-4698', 'pose', '2020-04-02 18:41:05', 1, 1),
(1214, '722-7740', '259-4698', 'hopital', '2020-04-02 18:41:11', 1, 0),
(1215, '259-4698', '722-7740', 'hopital', '2020-04-02 18:41:12', 1, 1),
(1216, '259-4698', '722-7740', 'ok j\'arrive besoin du camion ?', '2020-04-02 18:41:26', 1, 0),
(1217, '722-7740', '259-4698', 'ok j\'arrive besoin du camion ?', '2020-04-02 18:41:27', 1, 1),
(1218, '959-3874', '455-5262', 'Il fait pas partie de ton gang lacoste ?', '2020-04-02 18:49:03', 1, 0),
(1219, '455-5262', '959-3874', 'Il fait pas partie de ton gang lacoste ?', '2020-04-02 18:49:03', 1, 1),
(1220, '455-5262', '959-3874', 'oui MDR', '2020-04-02 18:49:10', 1, 0),
(1221, '959-3874', '455-5262', 'oui MDR', '2020-04-02 18:49:10', 1, 1),
(1222, '458-3849', '997-6488', 'gg', '2020-04-02 19:02:41', 1, 0),
(1223, '997-6488', '458-3849', 'gg', '2020-04-02 19:02:41', 1, 1),
(1224, '346-3283', '317-3667', 'elle a une belle tete', '2020-04-02 19:09:03', 1, 0),
(1225, '317-3667', '346-3283', 'elle a une belle tete', '2020-04-02 19:09:03', 1, 1),
(1226, '317-3667', '346-3283', 'bwahahahahahhaah', '2020-04-02 19:09:14', 1, 0),
(1227, '346-3283', '317-3667', 'bwahahahahahhaah', '2020-04-02 19:09:14', 1, 1),
(1228, '317-3667', '346-3283', 'C\'la go a sauvage wtf', '2020-04-02 19:09:27', 1, 0),
(1229, '346-3283', '317-3667', 'C\'la go a sauvage wtf', '2020-04-02 19:09:28', 1, 1),
(1230, '346-3283', '317-3667', 'oula', '2020-04-02 19:09:34', 1, 0),
(1231, '317-3667', '346-3283', 'oula', '2020-04-02 19:09:34', 1, 1),
(1232, '346-3283', '317-3667', 'f8 qui', '2020-04-02 19:09:38', 1, 0),
(1233, '317-3667', '346-3283', 'f8 qui', '2020-04-02 19:09:38', 1, 1),
(1234, '346-3283', '317-3667', 't', '2020-04-02 19:09:40', 1, 0),
(1235, '317-3667', '346-3283', 't', '2020-04-02 19:09:40', 1, 1),
(1236, '948-4278', '346-3283', 'grognasse', '2020-04-02 19:17:59', 1, 0),
(1237, '346-3283', '948-4278', 'grognasse', '2020-04-02 19:17:59', 1, 1),
(1238, '948-4278', '346-3283', 'GPS: -114.69779968262, -1138.283203125', '2020-04-02 19:20:06', 1, 0),
(1239, '346-3283', '948-4278', 'GPS: -114.69779968262, -1138.283203125', '2020-04-02 19:20:06', 1, 1),
(1240, '948-4278', '346-3283', 'GPS: -114.58584594727, -1137.9484863281', '2020-04-02 19:20:07', 1, 0),
(1241, '948-4278', '346-3283', 'GPS: -114.57507324219, -1137.9162597656', '2020-04-02 19:20:07', 1, 0),
(1242, '346-3283', '948-4278', 'GPS: -114.58584594727, -1137.9484863281', '2020-04-02 19:20:07', 1, 1),
(1243, '948-4278', '346-3283', 'GPS: -114.56936645508, -1137.8989257813', '2020-04-02 19:20:07', 1, 0),
(1244, '346-3283', '948-4278', 'GPS: -114.57507324219, -1137.9162597656', '2020-04-02 19:20:07', 1, 1),
(1245, '346-3283', '948-4278', 'GPS: -114.56936645508, -1137.8989257813', '2020-04-02 19:20:07', 1, 1),
(1246, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:07', 1, 0),
(1247, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:07', 1, 0),
(1248, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:07', 1, 1),
(1249, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:07', 1, 0),
(1250, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:07', 1, 1),
(1251, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 0),
(1252, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 1),
(1253, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 0),
(1254, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 1),
(1255, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 0),
(1256, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 1),
(1257, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 1),
(1258, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 0),
(1259, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 0),
(1260, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 1),
(1261, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 0),
(1262, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 1),
(1263, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:08', 1, 0),
(1264, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 1),
(1265, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 1),
(1266, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 0),
(1267, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 0),
(1268, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 1),
(1269, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 0),
(1270, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 1),
(1271, '948-4278', '346-3283', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 0),
(1272, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 1),
(1273, '346-3283', '948-4278', 'GPS: -114.56910705566, -1137.8981933594', '2020-04-02 19:20:09', 1, 1),
(1274, '948-4278', '346-3283', 'GPS: -43.03409576416, -928.78430175781', '2020-04-02 19:21:02', 1, 0),
(1275, '346-3283', '948-4278', 'GPS: -43.03409576416, -928.78430175781', '2020-04-02 19:21:02', 1, 1),
(1276, '948-4278', '346-3283', 'GPS: -33.800491333008, -924.5927734375', '2020-04-02 19:23:34', 1, 0),
(1277, '346-3283', '948-4278', 'GPS: -33.800491333008, -924.5927734375', '2020-04-02 19:23:34', 1, 1),
(1278, '455-5262', '959-3874', 'ta entendu ce que j\'ai dis ?', '2020-04-02 19:28:49', 1, 0),
(1279, '959-3874', '455-5262', 'ta entendu ce que j\'ai dis ?', '2020-04-02 19:28:49', 1, 1),
(1280, '959-3874', '455-5262', 'Non', '2020-04-02 19:28:58', 1, 0),
(1281, '455-5262', '959-3874', 'Non', '2020-04-02 19:28:58', 1, 1),
(1282, '455-5262', '959-3874', 'j\'ai dis jtm aussi', '2020-04-02 19:29:08', 1, 0),
(1283, '959-3874', '455-5262', 'j\'ai dis jtm aussi', '2020-04-02 19:29:08', 1, 1),
(1284, '455-5262', '959-3874', 'bon bah jdeco reco du coup', '2020-04-02 19:29:14', 1, 0),
(1285, '959-3874', '455-5262', 'bon bah jdeco reco du coup', '2020-04-02 19:29:14', 1, 1),
(1286, '948-4278', '346-3283', 'GPS: 241.90310668945, 4007.0595703125', '2020-04-02 19:40:39', 1, 0),
(1287, '346-3283', '948-4278', 'GPS: 241.90310668945, 4007.0595703125', '2020-04-02 19:40:39', 1, 1),
(1288, '455-5262', '959-3874', 't trop belle dans l\'eau , on dirait une sirène', '2020-04-02 19:47:07', 1, 0),
(1289, '959-3874', '455-5262', 't trop belle dans l\'eau , on dirait une sirène', '2020-04-02 19:47:07', 1, 1),
(1290, '959-3874', '455-5262', 'MDr merci', '2020-04-02 19:47:18', 1, 0),
(1291, '455-5262', '959-3874', 'MDr merci', '2020-04-02 19:47:19', 1, 1),
(1292, '455-5262', '959-3874', 'mdrrrr', '2020-04-02 19:48:29', 1, 0),
(1293, '959-3874', '455-5262', 'mdrrrr', '2020-04-02 19:48:29', 1, 1),
(1294, '959-3874', '455-5262', 'Je suis loing la ?', '2020-04-02 19:48:38', 1, 0),
(1295, '455-5262', '959-3874', 'Je suis loing la ?', '2020-04-02 19:48:38', 1, 1),
(1296, '959-3874', '455-5262', 'Ca me soule de ouf', '2020-04-02 19:48:46', 1, 0),
(1297, '455-5262', '959-3874', 'Ca me soule de ouf', '2020-04-02 19:48:46', 1, 1),
(1298, '317-3667', '948-4278', 'Stanley', '2020-04-02 19:54:34', 1, 0),
(1299, '948-4278', '317-3667', 'Stanley', '2020-04-02 19:54:34', 1, 1),
(1300, '317-3667', '948-4278', 'C\'est pas au lac', '2020-04-02 19:54:40', 1, 0),
(1301, '948-4278', '317-3667', 'C\'est pas au lac', '2020-04-02 19:54:40', 1, 1),
(1302, '346-3283', '317-3667', 'Si on trouve go rien dire a garaa nn?', '2020-04-02 19:54:45', 1, 0),
(1303, '317-3667', '346-3283', 'Si on trouve go rien dire a garaa nn?', '2020-04-02 19:54:46', 1, 1),
(1304, '948-4278', '317-3667', 'OU?', '2020-04-02 19:54:48', 1, 0),
(1305, '317-3667', '948-4278', 'OU?', '2020-04-02 19:54:48', 1, 1),
(1306, '317-3667', '948-4278', 'tema le stream de Lacoste', '2020-04-02 19:54:50', 1, 0),
(1307, '948-4278', '317-3667', 'tema le stream de Lacoste', '2020-04-02 19:54:50', 1, 1),
(1308, '948-4278', '317-3667', 'flemme', '2020-04-02 19:54:55', 1, 0),
(1309, '317-3667', '948-4278', 'flemme', '2020-04-02 19:54:56', 1, 1),
(1310, '948-4278', '317-3667', 'alors ou?', '2020-04-02 19:55:07', 1, 0),
(1311, '317-3667', '948-4278', 'alors ou?', '2020-04-02 19:55:08', 1, 1),
(1312, '317-3667', '346-3283', 'Oe', '2020-04-02 19:55:17', 1, 0),
(1313, '346-3283', '317-3667', 'Oe', '2020-04-02 19:55:17', 1, 1),
(1314, '317-3667', '346-3283', 'C\'pas au lac', '2020-04-02 19:55:21', 1, 0),
(1315, '346-3283', '317-3667', 'C\'pas au lac', '2020-04-02 19:55:21', 1, 1),
(1316, '346-3283', '317-3667', 'Quel lac ?', '2020-04-02 19:55:35', 1, 0),
(1317, '317-3667', '346-3283', 'Quel lac ?', '2020-04-02 19:55:35', 1, 1),
(1318, '317-3667', '346-3283', 'Pas au Lac principal', '2020-04-02 19:55:39', 1, 0),
(1319, '346-3283', '317-3667', 'Pas au Lac principal', '2020-04-02 19:55:39', 1, 1),
(1320, '317-3667', '948-4278', 'Pas au lac principal', '2020-04-02 19:55:47', 1, 0),
(1321, '948-4278', '317-3667', 'Pas au lac principal', '2020-04-02 19:55:47', 1, 1),
(1322, '948-4278', '317-3667', 't sur a 100%=?w', '2020-04-02 19:56:06', 1, 0),
(1323, '317-3667', '948-4278', 't sur a 100%=?w', '2020-04-02 19:56:06', 1, 1),
(1324, '317-3667', '948-4278', 'C\'est ce qu\'il dise sur le stream', '2020-04-02 19:56:20', 1, 0),
(1325, '948-4278', '317-3667', 'C\'est ce qu\'il dise sur le stream', '2020-04-02 19:56:20', 1, 1),
(1326, '455-5262', '959-3874', 'dis rien dans le voc', '2020-04-02 20:10:02', 1, 0),
(1327, '959-3874', '455-5262', 'dis rien dans le voc', '2020-04-02 20:10:02', 1, 1),
(1328, '455-5262', '959-3874', 'au autre', '2020-04-02 20:10:07', 1, 0),
(1329, '959-3874', '455-5262', 'au autre', '2020-04-02 20:10:08', 1, 1),
(1330, '455-5262', '959-3874', 'ou a baja', '2020-04-02 20:10:10', 1, 0),
(1331, '959-3874', '455-5262', 'ou a baja', '2020-04-02 20:10:10', 1, 1),
(1332, '959-3874', '455-5262', 'Hein ?', '2020-04-02 20:10:12', 1, 0),
(1333, '455-5262', '959-3874', 'Hein ?', '2020-04-02 20:10:13', 1, 1),
(1334, '455-5262', '959-3874', 't\'es dans la bonne zone mais dis rien au autre n\'y a baja', '2020-04-02 20:10:27', 1, 0),
(1335, '959-3874', '455-5262', 't\'es dans la bonne zone mais dis rien au autre n\'y a baja', '2020-04-02 20:10:27', 1, 1),
(1336, '959-3874', '455-5262', 'C\'est quand même pas l\'avion ?', '2020-04-02 20:13:39', 1, 0),
(1337, '455-5262', '959-3874', 'C\'est quand même pas l\'avion ?', '2020-04-02 20:13:39', 1, 1),
(1338, '346-3283', '948-4278', 'GPS: 191.52610778809, 3931.146484375', '2020-04-02 20:26:27', 1, 0),
(1339, '948-4278', '346-3283', 'GPS: 191.52610778809, 3931.146484375', '2020-04-02 20:26:27', 1, 1),
(1340, '455-5262', '959-3874', 'moi j\'ai rigoler', '2020-04-02 20:36:50', 1, 0),
(1341, '959-3874', '455-5262', 'moi j\'ai rigoler', '2020-04-02 20:36:51', 1, 1),
(1342, '959-3874', '455-5262', 'Je t\'aimez', '2020-04-02 20:37:45', 1, 0),
(1343, '455-5262', '959-3874', 'Je t\'aimez', '2020-04-02 20:37:45', 1, 1),
(1344, '959-3874', '455-5262', 'je t\'aime', '2020-04-02 20:37:48', 1, 0),
(1345, '455-5262', '959-3874', 'je t\'aime', '2020-04-02 20:37:49', 1, 1),
(1346, '455-5262', '959-3874', 'je t\'aime aussi', '2020-04-02 20:38:04', 1, 0),
(1347, '959-3874', '455-5262', 'je t\'aime aussi', '2020-04-02 20:38:04', 1, 1),
(1348, '948-4278', '346-3283', 'GPS: 460.90615844727, -2673.7443847656', '2020-04-02 20:42:20', 1, 0),
(1349, '346-3283', '948-4278', 'GPS: 460.90615844727, -2673.7443847656', '2020-04-02 20:42:20', 1, 1),
(1350, '948-4278', '346-3283', 'GPS: 457.10922241211, -2674.3698730469', '2020-04-02 20:42:21', 1, 0),
(1351, '346-3283', '948-4278', 'GPS: 457.10922241211, -2674.3698730469', '2020-04-02 20:42:21', 1, 1),
(1352, '948-4278', '346-3283', 'GPS: 453.5754699707, -2674.4001464844', '2020-04-02 20:42:22', 1, 0),
(1353, '346-3283', '948-4278', 'GPS: 453.5754699707, -2674.4001464844', '2020-04-02 20:42:22', 1, 1),
(1354, '948-4278', '346-3283', 'GPS: 448.14407348633, -2675.0864257813', '2020-04-02 20:42:23', 1, 0),
(1355, '346-3283', '948-4278', 'GPS: 448.14407348633, -2675.0864257813', '2020-04-02 20:42:23', 1, 1),
(1356, '948-4278', '346-3283', 'GPS: -725.99096679688, 6959.0615234375', '2020-04-02 21:10:01', 1, 0),
(1357, '346-3283', '948-4278', 'GPS: -725.99096679688, 6959.0615234375', '2020-04-02 21:10:01', 1, 1),
(1358, '346-3283', '948-4278', 'GPS: -672.1875, 6843.19140625', '2020-04-02 21:10:15', 1, 0),
(1359, '948-4278', '346-3283', 'GPS: -672.1875, 6843.19140625', '2020-04-02 21:10:15', 1, 1),
(1360, '346-3283', '948-4278', 'GPS: -891.00842285156, 6805.4892578125', '2020-04-02 21:12:27', 1, 0),
(1361, '948-4278', '346-3283', 'GPS: -891.00842285156, 6805.4892578125', '2020-04-02 21:12:27', 1, 1),
(1362, '317-3667', '346-3283', 'Pos fdp', '2020-04-02 21:13:34', 1, 0),
(1363, '346-3283', '317-3667', 'Pos fdp', '2020-04-02 21:13:34', 1, 1),
(1364, '948-4278', '317-3667', 'GPS: -968.90209960938, 6708.41015625', '2020-04-02 21:14:29', 1, 0),
(1365, '317-3667', '948-4278', 'GPS: -968.90209960938, 6708.41015625', '2020-04-02 21:14:29', 1, 1),
(1366, '346-3283', '317-3667', 'GPS: -135.59007263184, -1546.9260253906', '2020-04-02 21:50:29', 1, 0),
(1367, '317-3667', '346-3283', 'GPS: -135.59007263184, -1546.9260253906', '2020-04-02 21:50:29', 1, 1),
(1368, '346-3283', '948-4278', 'GPS: -135.59007263184, -1546.9260253906', '2020-04-02 21:50:31', 1, 0),
(1369, '948-4278', '346-3283', 'GPS: -135.59007263184, -1546.9260253906', '2020-04-02 21:50:31', 1, 1),
(1370, '672-6046', '749-0723', 'envoi ta pose', '2020-04-02 22:02:52', 1, 0),
(1371, '749-0723', '672-6046', 'envoi ta pose', '2020-04-02 22:02:52', 1, 1),
(1372, '672-6046', '749-0723', 'g r a faire', '2020-04-02 22:03:43', 1, 0),
(1373, '749-0723', '672-6046', 'g r a faire', '2020-04-02 22:03:43', 1, 1),
(1374, '749-0723', '672-6046', 'Je farm la voie avec eux frero', '2020-04-02 22:04:09', 1, 0),
(1375, '672-6046', '749-0723', 'Je farm la voie avec eux frero', '2020-04-02 22:04:10', 1, 1),
(1376, '672-6046', '749-0723', 'cmm sa voit avec eux', '2020-04-02 22:04:21', 1, 0),
(1377, '749-0723', '672-6046', 'cmm sa voit avec eux', '2020-04-02 22:04:21', 1, 1),
(1378, '749-0723', '672-6046', 'Bah tes dans notre groupe voie avec eux si tu peut farm aussi avec nous', '2020-04-02 22:04:45', 1, 0),
(1379, '672-6046', '749-0723', 'Bah tes dans notre groupe voie avec eux si tu peut farm aussi avec nous', '2020-04-02 22:04:45', 1, 1),
(1380, '672-6046', '749-0723', 'beh dmd toi', '2020-04-02 22:04:57', 1, 0),
(1381, '749-0723', '672-6046', 'ta les pouin sois disaant', '2020-04-02 22:04:57', 1, 0),
(1382, '749-0723', '672-6046', 'beh dmd toi', '2020-04-02 22:04:57', 1, 1),
(1383, '672-6046', '749-0723', 'ta les pouin sois disaant', '2020-04-02 22:04:57', 1, 1),
(1384, '672-6046', '749-0723', 'jsuis pas avec toi', '2020-04-02 22:05:04', 1, 0),
(1385, '749-0723', '672-6046', 'jsuis pas avec toi', '2020-04-02 22:05:05', 1, 1),
(1386, '749-0723', '672-6046', 'tes pas goto?', '2020-04-02 22:05:16', 1, 0),
(1387, '672-6046', '749-0723', 'tes pas goto?', '2020-04-02 22:05:16', 1, 1),
(1388, '672-6046', '749-0723', 'oui jsuis goto', '2020-04-02 22:05:32', 1, 0),
(1389, '749-0723', '672-6046', 'oui jsuis goto', '2020-04-02 22:05:32', 1, 1),
(1390, '749-0723', '672-6046', 'Bah voila voie avec alex et liash', '2020-04-02 22:05:44', 1, 0),
(1391, '672-6046', '749-0723', 'Bah voila voie avec alex et liash', '2020-04-02 22:05:44', 1, 1),
(1392, '948-4278', '317-3667', 'GPS: 881.84857177734, -3245.9025878906', '2020-04-02 22:28:37', 1, 0),
(1393, '317-3667', '948-4278', 'GPS: 881.84857177734, -3245.9025878906', '2020-04-02 22:28:38', 1, 1),
(1394, '672-6046', '749-0723', 'tp moi', '2020-04-02 23:14:56', 1, 0),
(1396, '317-3667', '948-4278', 'GPS: -917.16296386719, 6675.0932617188', '2020-04-03 00:33:42', 1, 0),
(1397, '948-4278', '317-3667', 'GPS: -917.16296386719, 6675.0932617188', '2020-04-03 00:33:42', 1, 1),
(1398, '317-3667', '346-3283', 'GPS: -914.77642822266, 6673.7568359375', '2020-04-03 00:33:44', 1, 0),
(1399, '346-3283', '317-3667', 'GPS: -914.77642822266, 6673.7568359375', '2020-04-03 00:33:45', 1, 1),
(1400, '317-3667', '346-3283', 'Tu fais quoi la ?', '2020-04-03 01:59:23', 1, 0),
(1401, '346-3283', '317-3667', 'Tu fais quoi la ?', '2020-04-03 01:59:24', 1, 1),
(1402, '346-3283', '317-3667', 'je récolte', '2020-04-03 01:59:32', 1, 0),
(1403, '317-3667', '346-3283', 'je récolte', '2020-04-03 01:59:32', 1, 1),
(1404, '346-3283', '317-3667', 'fin je cherche la récolte', '2020-04-03 01:59:36', 1, 0),
(1405, '317-3667', '346-3283', 'fin je cherche la récolte', '2020-04-03 01:59:36', 1, 1),
(1406, '317-3667', '346-3283', 'Sur mon point GPS mdddr', '2020-04-03 01:59:46', 1, 0),
(1407, '346-3283', '317-3667', 'Sur mon point GPS mdddr', '2020-04-03 01:59:46', 1, 1),
(1408, '317-3667', '346-3283', 'GPS: -919.06561279297, 6672.71875', '2020-04-03 01:59:47', 1, 0),
(1409, '346-3283', '317-3667', 'GPS: -919.06561279297, 6672.71875', '2020-04-03 01:59:47', 1, 1),
(1410, '346-3283', '317-3667', 'merci', '2020-04-03 01:59:55', 1, 0),
(1411, '317-3667', '346-3283', 'merci', '2020-04-03 01:59:55', 1, 1),
(1412, '317-3667', '346-3283', 'J\'t\'avais envoyé le point plus haut tdc', '2020-04-03 02:00:08', 1, 0),
(1413, '346-3283', '317-3667', 'J\'t\'avais envoyé le point plus haut tdc', '2020-04-03 02:00:08', 1, 1),
(1414, '346-3283', '317-3667', 'effectivement', '2020-04-03 02:00:26', 1, 0),
(1415, '317-3667', '346-3283', 'effectivement', '2020-04-03 02:00:26', 1, 1),
(1416, '317-3667', '346-3283', 'wesh mais t\'étais ou', '2020-04-03 02:02:25', 1, 0),
(1417, '346-3283', '317-3667', 'wesh mais t\'étais ou', '2020-04-03 02:02:25', 1, 1),
(1418, '346-3283', '317-3667', 'jsp xd', '2020-04-03 02:02:34', 1, 0),
(1419, '317-3667', '346-3283', 'jsp xd', '2020-04-03 02:02:34', 1, 1),
(1420, '317-3667', '346-3283', 'mdddddddr', '2020-04-03 02:02:41', 1, 0),
(1421, '346-3283', '317-3667', 'mdddddddr', '2020-04-03 02:02:41', 1, 1),
(1422, '317-3667', '346-3283', 'Envoie une pos', '2020-04-03 02:02:45', 1, 0),
(1423, '346-3283', '317-3667', 'Envoie une pos', '2020-04-03 02:02:45', 1, 1),
(1424, '346-3283', '317-3667', 'jui la mdr', '2020-04-03 02:03:23', 1, 0),
(1425, '317-3667', '346-3283', 'jui la mdr', '2020-04-03 02:03:24', 1, 1),
(1426, '317-3667', '346-3283', 'aah', '2020-04-03 02:03:31', 1, 0),
(1427, '346-3283', '317-3667', 'aah', '2020-04-03 02:03:31', 1, 1),
(1428, '317-3667', '346-3283', 'Viens radio fdp', '2020-04-03 02:03:43', 1, 0),
(1429, '346-3283', '317-3667', 'Viens radio fdp', '2020-04-03 02:03:43', 1, 1),
(1430, '317-3667', '346-3283', 'aide staff', '2020-04-03 02:03:47', 1, 0),
(1431, '346-3283', '317-3667', 'aide staff', '2020-04-03 02:03:47', 1, 1),
(1432, '317-3667', '543-5479', 'Tu vois la salle de céllo des merry sur arcadia .', '2020-04-03 02:53:53', 1, 0),
(1433, '543-5479', '317-3667', 'Tu vois la salle de céllo des merry sur arcadia .', '2020-04-03 02:53:53', 1, 1),
(1434, '317-3667', '543-5479', '?', '2020-04-03 02:53:54', 1, 0),
(1435, '543-5479', '317-3667', '?', '2020-04-03 02:53:55', 1, 1),
(1436, '543-5479', '317-3667', 'oue *', '2020-04-03 02:54:01', 1, 0);
INSERT INTO `phone_messages` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
(1437, '317-3667', '543-5479', 'oue *', '2020-04-03 02:54:02', 1, 1),
(1438, '317-3667', '543-5479', 'Du même coté tout en haut', '2020-04-03 02:54:08', 1, 0),
(1439, '543-5479', '317-3667', 'Du même coté tout en haut', '2020-04-03 02:54:08', 1, 1),
(1440, '543-5479', '317-3667', 'ok', '2020-04-03 02:54:16', 1, 0),
(1441, '317-3667', '543-5479', 'ok', '2020-04-03 02:54:17', 1, 1),
(1442, '543-5479', '317-3667', 'et la récolte ?', '2020-04-03 02:54:29', 1, 0),
(1443, '317-3667', '543-5479', 'et la récolte ?', '2020-04-03 02:54:29', 1, 1),
(1444, '317-3667', '543-5479', 'genre 3 étages au dessus de cette salle t\'as un point de TP dans un bunker', '2020-04-03 02:54:39', 1, 0),
(1445, '543-5479', '317-3667', 'genre 3 étages au dessus de cette salle t\'as un point de TP dans un bunker', '2020-04-03 02:54:40', 1, 1),
(1446, '317-3667', '543-5479', 'dans une carcasse d\'avion au Nord', '2020-04-03 02:54:50', 1, 0),
(1447, '543-5479', '317-3667', 'dans une carcasse d\'avion au Nord', '2020-04-03 02:54:50', 1, 1),
(1448, '317-3667', '543-5479', 'J\'t\'envoies la pos quand j\'y suis', '2020-04-03 02:55:01', 1, 0),
(1449, '543-5479', '317-3667', 'J\'t\'envoies la pos quand j\'y suis', '2020-04-03 02:55:01', 1, 1),
(1450, '543-5479', '317-3667', 'envoie la pose de la récolte sinon', '2020-04-03 02:55:04', 1, 0),
(1451, '317-3667', '543-5479', 'envoie la pose de la récolte sinon', '2020-04-03 02:55:04', 1, 1),
(1452, '317-3667', '543-5479', 'On est en chemin la', '2020-04-03 02:55:07', 1, 0),
(1453, '543-5479', '317-3667', 'On est en chemin la', '2020-04-03 02:55:08', 1, 1),
(1454, '317-3667', '543-5479', 'GPS: -999.50708007813, 6266.279296875', '2020-04-03 02:59:55', 1, 0),
(1455, '543-5479', '317-3667', 'GPS: -999.50708007813, 6266.279296875', '2020-04-03 02:59:55', 1, 1),
(1456, '317-3667', '543-5479', 'vas vers la bas déjç', '2020-04-03 03:00:16', 1, 0),
(1457, '543-5479', '317-3667', 'vas vers la bas déjç', '2020-04-03 03:00:16', 1, 1),
(1458, '317-3667', '543-5479', 'GPS: -918.95477294922, 6672.8935546875', '2020-04-03 03:02:38', 1, 0),
(1459, '543-5479', '317-3667', 'GPS: -918.95477294922, 6672.8935546875', '2020-04-03 03:02:38', 1, 1),
(1460, '543-5479', '317-3667', 'cbon j\'ai acheter un recycleure jle met coment?', '2020-04-03 03:03:25', 1, 0),
(1461, '317-3667', '543-5479', 'cbon j\'ai acheter un recycleure jle met coment?', '2020-04-03 03:03:25', 1, 1),
(1462, '317-3667', '543-5479', 'Va dans l\'eau', '2020-04-03 03:03:31', 1, 0),
(1463, '543-5479', '317-3667', 'Va dans l\'eau', '2020-04-03 03:03:31', 1, 1),
(1464, '317-3667', '543-5479', 'et tu l\'utilises', '2020-04-03 03:03:35', 1, 0),
(1465, '543-5479', '317-3667', 'et tu l\'utilises', '2020-04-03 03:03:35', 1, 1),
(1466, '346-3283', '317-3667', 'j\'suis gay', '2020-04-03 03:06:11', 1, 0),
(1467, '317-3667', '346-3283', 'j\'suis gay', '2020-04-03 03:06:11', 1, 1),
(1468, '346-3283', '317-3667', '[message supprimé]', '2020-04-03 03:06:20', 1, 0),
(1469, '317-3667', '346-3283', '[message supprimé]', '2020-04-03 03:06:20', 1, 1),
(1470, '543-5479', '317-3667', 'oue mon recycleur a bug au que je l\'es acheter et je les pas dans mon sac', '2020-04-03 03:07:00', 1, 0),
(1471, '317-3667', '543-5479', 'oue mon recycleur a bug au que je l\'es acheter et je les pas dans mon sac', '2020-04-03 03:07:01', 1, 1),
(1472, '317-3667', '543-5479', 'Beh oe c\'normal', '2020-04-03 03:07:15', 1, 0),
(1473, '543-5479', '317-3667', 'Beh oe c\'normal', '2020-04-03 03:07:15', 1, 1),
(1474, '317-3667', '543-5479', 'déco reco', '2020-04-03 03:07:17', 1, 0),
(1476, '543-5479', '317-3667', 'ah ok', '2020-04-03 03:07:24', 1, 0),
(1477, '317-3667', '543-5479', 'ah ok', '2020-04-03 03:07:25', 1, 1),
(1478, '317-3667', '543-5479', 'GPS: 592.65093994141, -3270.7248535156', '2020-04-03 03:19:34', 1, 0),
(1479, '543-5479', '317-3667', 'GPS: 592.65093994141, -3270.7248535156', '2020-04-03 03:19:34', 1, 1),
(1480, '346-3283', '317-3667', 'j afk', '2020-04-03 03:19:55', 1, 0),
(1481, '317-3667', '346-3283', 'j afk', '2020-04-03 03:19:56', 1, 1),
(1482, '317-3667', '346-3283', 'K', '2020-04-03 03:20:04', 1, 0),
(1483, '346-3283', '317-3667', 'K', '2020-04-03 03:20:05', 1, 1),
(1484, '317-3667', '346-3283', 'j\'te porterais', '2020-04-03 03:20:08', 1, 0),
(1485, '346-3283', '317-3667', 'j\'te porterais', '2020-04-03 03:20:08', 1, 1),
(1486, '543-5479', '317-3667', 'vous avez pris ma voiture bande de pd', '2020-04-03 03:20:38', 1, 0),
(1487, '317-3667', '543-5479', 'vous avez pris ma voiture bande de pd', '2020-04-03 03:20:38', 1, 1),
(1488, '317-3667', '543-5479', '/poi', '2020-04-03 03:20:52', 1, 0),
(1489, '543-5479', '317-3667', '/poi', '2020-04-03 03:20:52', 1, 1),
(1490, '543-5479', '317-3667', 'Wsh', '2020-04-03 03:21:00', 1, 0),
(1491, '317-3667', '543-5479', 'Wsh', '2020-04-03 03:21:01', 1, 1),
(1492, '317-3667', '543-5479', 'Demande d\'être tp a un garage pcq ton véhicule a despawn', '2020-04-03 03:21:06', 1, 0),
(1493, '543-5479', '317-3667', 'Demande d\'être tp a un garage pcq ton véhicule a despawn', '2020-04-03 03:21:06', 1, 1),
(1494, '543-5479', '317-3667', 'Ok', '2020-04-03 03:21:31', 1, 0),
(1495, '317-3667', '543-5479', 'Ok', '2020-04-03 03:21:31', 1, 1),
(1496, '346-3283', '948-4278', 'GPS: -3004.7314453125, 166.22523498535', '2020-04-03 03:46:54', 1, 0),
(1497, '948-4278', '346-3283', 'GPS: -3004.7314453125, 166.22523498535', '2020-04-03 03:46:54', 1, 1),
(1498, '317-3667', '948-4278', 'GPS: -3006.2612304688, 165.15817260742', '2020-04-03 03:46:56', 1, 0),
(1499, '948-4278', '317-3667', 'GPS: -3006.2612304688, 165.15817260742', '2020-04-03 03:46:56', 1, 1),
(1500, '948-4278', '317-3667', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:29', 1, 0),
(1501, '948-4278', '317-3667', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 0),
(1502, '317-3667', '948-4278', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 1),
(1503, '317-3667', '948-4278', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 1),
(1504, '948-4278', '317-3667', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 0),
(1505, '948-4278', '317-3667', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 0),
(1506, '948-4278', '317-3667', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 0),
(1507, '317-3667', '948-4278', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 1),
(1508, '317-3667', '948-4278', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 1),
(1509, '948-4278', '317-3667', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 0),
(1510, '317-3667', '948-4278', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 1),
(1511, '317-3667', '948-4278', 'GPS: -1215.7354736328, -324.51202392578', '2020-04-03 03:48:30', 1, 1),
(1512, '397-7210', '948-4278', 'prend mes 2.6 K', '2020-04-03 03:48:43', 1, 0),
(1513, '948-4278', '397-7210', 'prend mes 2.6 K', '2020-04-03 03:48:43', 1, 1),
(1514, '346-3283', '317-3667', 'T OU', '2020-04-03 04:33:10', 1, 0),
(1515, '317-3667', '346-3283', 'T OU', '2020-04-03 04:33:11', 1, 1),
(1516, '317-3667', '346-3283', 'daronned fdp', '2020-04-03 04:33:38', 1, 0),
(1517, '346-3283', '317-3667', 'daronned fdp', '2020-04-03 04:33:38', 1, 1),
(1518, '346-3283', '317-3667', 'ah', '2020-04-03 04:34:00', 1, 0),
(1519, '317-3667', '346-3283', 'ah', '2020-04-03 04:34:00', 1, 1),
(1520, '317-3667', '346-3283', 'J\'suis pas la avant longtemps j\'pense', '2020-04-03 04:34:24', 1, 0),
(1521, '346-3283', '317-3667', 'J\'suis pas la avant longtemps j\'pense', '2020-04-03 04:34:24', 1, 1),
(1522, '346-3283', '317-3667', 'ok', '2020-04-03 04:34:31', 1, 0),
(1523, '317-3667', '346-3283', 'ok', '2020-04-03 04:34:31', 1, 1),
(1524, '317-3667', '346-3283', 'Ma daronne elle débarque', '2020-04-03 04:37:04', 1, 0),
(1525, '346-3283', '317-3667', 'Ma daronne elle débarque', '2020-04-03 04:37:04', 1, 1),
(1526, '346-3283', '317-3667', 'obuhahaha', '2020-04-03 04:37:12', 1, 0),
(1527, '317-3667', '346-3283', 'obuhahaha', '2020-04-03 04:37:12', 1, 1),
(1528, '317-3667', '346-3283', 'Elle me dit \"tu dors pas aujourd\'ui\'', '2020-04-03 04:37:15', 1, 0),
(1529, '346-3283', '317-3667', 'Elle me dit \"tu dors pas aujourd\'ui\'', '2020-04-03 04:37:15', 1, 1),
(1530, '317-3667', '346-3283', 'J\'fais ok mddr elle est parti', '2020-04-03 04:37:24', 1, 0),
(1531, '346-3283', '317-3667', 'J\'fais ok mddr elle est parti', '2020-04-03 04:37:24', 1, 1),
(1532, '317-3667', '346-3283', 'J\'suis trop lucky wtf', '2020-04-03 04:37:28', 1, 0),
(1533, '346-3283', '317-3667', 'J\'suis trop lucky wtf', '2020-04-03 04:37:28', 1, 1),
(1534, '317-3667', '346-3283', 'Il va nous mettre dans la merde pour rien frr', '2020-04-03 04:55:53', 1, 0),
(1535, '346-3283', '317-3667', 'Il va nous mettre dans la merde pour rien frr', '2020-04-03 04:55:53', 1, 1),
(1536, '317-3667', '346-3283', 'il clc', '2020-04-03 04:55:56', 1, 0),
(1537, '346-3283', '317-3667', 'il clc', '2020-04-03 04:55:56', 1, 1),
(1538, '346-3283', '317-3667', 'Je c', '2020-04-03 04:56:00', 1, 0),
(1539, '317-3667', '346-3283', 'Je c', '2020-04-03 04:56:00', 1, 1),
(1540, '346-3283', '317-3667', 'mm moi il me saoule', '2020-04-03 04:57:12', 1, 0),
(1541, '317-3667', '346-3283', 'mm moi il me saoule', '2020-04-03 04:57:13', 1, 1),
(1542, '317-3667', '346-3283', 'wlh frr', '2020-04-03 04:57:27', 1, 0),
(1543, '346-3283', '317-3667', 'wlh frr', '2020-04-03 04:57:28', 1, 1),
(1544, '317-3667', '346-3283', 'Il clc la', '2020-04-03 04:57:33', 1, 0),
(1545, '346-3283', '317-3667', 'Il clc la', '2020-04-03 04:57:33', 1, 1),
(1546, '317-3667', '346-3283', 'J\'lui donne pas la récolte', '2020-04-03 04:59:55', 1, 0),
(1547, '346-3283', '317-3667', 'J\'lui donne pas la récolte', '2020-04-03 04:59:55', 1, 1),
(1548, '346-3283', '317-3667', 'Moi nn plus', '2020-04-03 05:00:16', 1, 0),
(1549, '317-3667', '346-3283', 'Moi nn plus', '2020-04-03 05:00:16', 1, 1),
(1550, '317-3667', '346-3283', 'Faut le dire a master et Cielo', '2020-04-03 05:00:30', 1, 0),
(1551, '346-3283', '317-3667', 'Faut le dire a master et Cielo', '2020-04-03 05:00:30', 1, 1),
(1552, '317-3667', '346-3283', 'GPS: 580.95812988281, -3227.5051269531', '2020-04-03 05:00:43', 1, 0),
(1553, '346-3283', '317-3667', 'GPS: 580.95812988281, -3227.5051269531', '2020-04-03 05:00:43', 1, 1),
(1554, '317-3667', '346-3283', 'Vient me chercher', '2020-04-03 05:00:46', 1, 0),
(1555, '346-3283', '317-3667', 'Vient me chercher', '2020-04-03 05:00:46', 1, 1),
(1556, '346-3283', '317-3667', 'master va lui donner frr', '2020-04-03 05:00:46', 1, 0),
(1557, '317-3667', '346-3283', 'master va lui donner frr', '2020-04-03 05:00:47', 1, 1),
(1558, '317-3667', '346-3283', 'J\'sais sa clc', '2020-04-03 05:00:54', 1, 0),
(1559, '346-3283', '317-3667', 'J\'sais sa clc', '2020-04-03 05:00:54', 1, 1),
(1560, '346-3283', '317-3667', 'gros mm moi il ma saouler la', '2020-04-03 05:01:14', 1, 0),
(1561, '317-3667', '346-3283', 'gros mm moi il ma saouler la', '2020-04-03 05:01:14', 1, 1),
(1562, '317-3667', '346-3283', 'La j\'ai même pas envie qu\'il soit avec nous frère', '2020-04-03 05:01:39', 1, 0),
(1563, '346-3283', '317-3667', 'La j\'ai même pas envie qu\'il soit avec nous frère', '2020-04-03 05:01:39', 1, 1),
(1564, '317-3667', '346-3283', 'GPS: 580.50207519531, -3227.248046875', '2020-04-03 05:01:41', 1, 0),
(1565, '346-3283', '317-3667', 'GPS: 580.50207519531, -3227.248046875', '2020-04-03 05:01:41', 1, 1),
(1566, '317-3667', '543-5479', 'GPS: 580.50207519531, -3227.248046875', '2020-04-03 05:02:16', 1, 0),
(1567, '543-5479', '317-3667', 'GPS: 580.50207519531, -3227.248046875', '2020-04-03 05:02:16', 1, 1),
(1568, '317-3667', '346-3283', 'Sah tu me fais perdre full temps sur mes runs', '2020-04-03 05:34:39', 1, 0),
(1569, '346-3283', '317-3667', 'Sah tu me fais perdre full temps sur mes runs', '2020-04-03 05:34:39', 1, 1),
(1570, '346-3283', '317-3667', 'jrv', '2020-04-03 05:34:49', 1, 0),
(1571, '317-3667', '346-3283', 'jrv', '2020-04-03 05:34:49', 1, 1),
(1572, '346-3283', '317-3667', 'jme branle enft', '2020-04-03 05:34:55', 1, 0),
(1573, '317-3667', '346-3283', 'jme branle enft', '2020-04-03 05:34:56', 1, 1),
(1574, '346-3283', '317-3667', '{]msg supprimé', '2020-04-03 05:35:02', 1, 0),
(1575, '317-3667', '346-3283', '{]msg supprimé', '2020-04-03 05:35:02', 1, 1),
(1576, '317-3667', '346-3283', 'Trop tard', '2020-04-03 05:35:08', 1, 0),
(1577, '346-3283', '317-3667', 'Trop tard', '2020-04-03 05:35:09', 1, 1),
(1578, '317-3667', '346-3283', 'C\'est screen', '2020-04-03 05:35:14', 1, 0),
(1579, '346-3283', '317-3667', 'C\'est screen', '2020-04-03 05:35:14', 1, 1),
(1580, '346-3283', '317-3667', 'mdr', '2020-04-03 05:35:15', 1, 0),
(1581, '317-3667', '346-3283', 'mdr', '2020-04-03 05:35:15', 1, 1),
(1582, '997-6488', '458-3849', 'tu est en ville', '2020-04-03 09:22:39', 1, 0),
(1583, '458-3849', '997-6488', 'tu est en ville', '2020-04-03 09:22:39', 1, 1),
(1584, '725-9980', '426-9400', 'GPS: 2439.5500488281, -490.76647949219', '2020-04-03 11:53:36', 1, 0),
(1585, '426-9400', '725-9980', 'GPS: 2439.5500488281, -490.76647949219', '2020-04-03 11:53:36', 1, 1),
(1586, '725-9980', '426-9400', 'GPS: -914.18231201172, 6673.8276367188', '2020-04-03 13:05:56', 1, 0),
(1587, '426-9400', '725-9980', 'GPS: -914.18231201172, 6673.8276367188', '2020-04-03 13:05:57', 1, 1),
(1588, '426-9400', '725-9980', 'GPS: -848.38946533203, 6480.8896484375', '2020-04-03 13:13:42', 1, 0),
(1589, '725-9980', '426-9400', 'GPS: -848.38946533203, 6480.8896484375', '2020-04-03 13:13:42', 1, 1),
(1590, '458-3849', '997-6488', 'vient', '2020-04-03 15:22:17', 1, 0),
(1591, '997-6488', '458-3849', 'vient', '2020-04-03 15:22:18', 1, 1),
(1592, '458-3849', '997-6488', 'GPS: 227.31590270996, -787.59454345703', '2020-04-03 15:22:19', 1, 0),
(1593, '997-6488', '458-3849', 'GPS: 227.31590270996, -787.59454345703', '2020-04-03 15:22:19', 1, 1),
(1594, '997-6488', '458-3849', 'GPS: -666.42242431641, -228.25695800781', '2020-04-03 15:25:52', 1, 0),
(1595, '458-3849', '997-6488', 'GPS: -666.42242431641, -228.25695800781', '2020-04-03 15:25:52', 1, 1),
(1596, '259-4698', '722-7740', 't en ville ?', '2020-04-03 18:08:01', 1, 0),
(1597, '722-7740', '259-4698', 't en ville ?', '2020-04-03 18:08:01', 1, 1),
(1598, '458-3849', '259-4698', 'JOKERT', '2020-04-03 18:39:19', 1, 0),
(1599, '259-4698', '458-3849', 'JOKERT', '2020-04-03 18:39:19', 1, 1),
(1600, '458-3849', '259-4698', 'JOKER', '2020-04-03 18:39:22', 1, 0),
(1601, '259-4698', '458-3849', 'JOKER', '2020-04-03 18:39:23', 1, 1),
(1602, '458-3849', '522-7430', 'JOKER', '2020-04-03 18:53:41', 1, 0),
(1603, '522-7430', '458-3849', 'JOKER', '2020-04-03 18:53:41', 1, 1),
(1604, '557-9798', '959-3874', 'GPS: 2947.6857910156, 1463.26171875', '2020-04-03 18:53:55', 1, 0),
(1605, '959-3874', '557-9798', 'GPS: 2947.6857910156, 1463.26171875', '2020-04-03 18:53:55', 1, 1),
(1606, '455-5262', '543-5479', 'yo négro t\'es dans ton quartier ?', '2020-04-03 19:10:22', 1, 0),
(1607, '543-5479', '455-5262', 'yo négro t\'es dans ton quartier ?', '2020-04-03 19:10:22', 1, 1),
(1608, '522-7430', '458-3849', 'Normal y\'a personne dans la ville ?', '2020-04-03 19:12:25', 1, 0),
(1609, '458-3849', '522-7430', 'Normal y\'a personne dans la ville ?', '2020-04-03 19:12:25', 1, 1),
(1610, '259-4698', '458-3849', 'tu as pas le traitement de l\'ecstazy ??', '2020-04-03 19:12:29', 1, 0),
(1611, '458-3849', '259-4698', 'tu as pas le traitement de l\'ecstazy ??', '2020-04-03 19:12:30', 1, 1),
(1612, '458-3849', '259-4698', 'non ,la vente', '2020-04-03 19:22:30', 1, 0),
(1613, '259-4698', '458-3849', 'non ,la vente', '2020-04-03 19:22:31', 1, 1),
(1614, '458-3849', '522-7430', 'si sa va arriver', '2020-04-03 19:22:37', 1, 0),
(1615, '522-7430', '458-3849', 'si sa va arriver', '2020-04-03 19:22:38', 1, 1),
(1616, '522-7430', '458-3849', 'Ok on peux se voir pour parler de quelque chose ?', '2020-04-03 19:23:08', 1, 0),
(1617, '458-3849', '522-7430', 'Ok on peux se voir pour parler de quelque chose ?', '2020-04-03 19:23:08', 1, 1),
(1618, '458-3849', '522-7430', 'mais j\'ai encore rien a proposer la', '2020-04-03 19:23:23', 1, 0),
(1619, '522-7430', '458-3849', 'mais j\'ai encore rien a proposer la', '2020-04-03 19:23:23', 1, 1),
(1620, '522-7430', '458-3849', 'Des point ?', '2020-04-03 19:23:38', 1, 0),
(1621, '458-3849', '522-7430', 'Des point ?', '2020-04-03 19:23:38', 1, 1),
(1622, '522-7430', '458-3849', '?', '2020-04-03 19:27:38', 1, 0),
(1623, '458-3849', '522-7430', '?', '2020-04-03 19:27:38', 1, 1),
(1624, '557-9798', '455-5262', 'GPS: 809.40637207031, 587.74066162109', '2020-04-03 19:55:26', 1, 0),
(1625, '455-5262', '557-9798', 'GPS: 809.40637207031, 587.74066162109', '2020-04-03 19:55:26', 1, 1),
(1626, '959-3874', '557-9798', 'GPS: 646.33892822266, 598.90460205078', '2020-04-03 19:55:29', 1, 0),
(1627, '557-9798', '959-3874', 'GPS: 646.33892822266, 598.90460205078', '2020-04-03 19:55:30', 1, 1),
(1628, '959-3874', '455-5262', 'GPS: 644.35748291016, 593.611328125', '2020-04-03 19:55:32', 1, 0),
(1629, '455-5262', '959-3874', 'GPS: 644.35748291016, 593.611328125', '2020-04-03 19:55:32', 1, 1),
(1630, '458-3849', '522-7430', 'sa s\'achête', '2020-04-03 20:20:09', 0, 0),
(1631, '522-7430', '458-3849', 'sa s\'achête', '2020-04-03 20:20:09', 1, 1),
(1632, '948-4278', '833-8508', 'GPS: 4.2168364524841, -2621.8452148438', '2020-04-04 12:12:52', 1, 0),
(1633, '833-8508', '948-4278', 'GPS: 4.2168364524841, -2621.8452148438', '2020-04-04 12:12:52', 1, 1),
(1634, '948-4278', '833-8508', 'GPS: 73.525459289551, -2609.0573730469', '2020-04-04 12:13:06', 1, 0),
(1635, '833-8508', '948-4278', 'GPS: 73.525459289551, -2609.0573730469', '2020-04-04 12:13:07', 1, 1),
(1636, '455-5262', '749-0723', 'GPS: 153.72569274902, -1034.6948242188', '2020-04-04 14:31:25', 1, 0),
(1637, '749-0723', '455-5262', 'GPS: 153.72569274902, -1034.6948242188', '2020-04-04 14:31:25', 1, 1),
(1638, '455-5262', '749-0723', 'GPS: 153.7262878418, -1034.697265625', '2020-04-04 14:31:25', 1, 0),
(1639, '749-0723', '455-5262', 'GPS: 153.7262878418, -1034.697265625', '2020-04-04 14:31:25', 1, 1),
(1640, '455-5262', '749-0723', 'GPS: 153.7262878418, -1034.697265625', '2020-04-04 14:31:25', 1, 0),
(1641, '749-0723', '455-5262', 'GPS: 153.7262878418, -1034.697265625', '2020-04-04 14:31:26', 1, 1),
(1642, '455-5262', '749-0723', 'GPS: 153.7262878418, -1034.697265625', '2020-04-04 14:31:26', 1, 0),
(1643, '749-0723', '455-5262', 'GPS: 153.7262878418, -1034.697265625', '2020-04-04 14:31:27', 1, 1),
(1644, '557-9798', '455-5262', 'BALISE GOTO DE ALEXX', '2020-04-04 14:42:50', 1, 0),
(1645, '455-5262', '557-9798', 'BALISE GOTO DE ALEXX', '2020-04-04 14:42:50', 1, 1),
(1646, '557-9798', '455-5262', 'GPS: -758.41058349609, -317.73568725586', '2020-04-04 14:42:51', 1, 0),
(1647, '455-5262', '557-9798', 'GPS: -758.41058349609, -317.73568725586', '2020-04-04 14:42:51', 1, 1),
(1648, 'police', '310-3410', 'GPS: -764.76226806641, -316.17309570313', '2020-04-04 14:45:55', 1, 1),
(1649, 'police', '310-3410', 'panic bouton', '2020-04-04 14:46:04', 1, 1),
(1650, '458-3849', '259-4698', 'j\'arrive att', '2020-04-05 18:23:55', 1, 0),
(1651, '259-4698', '458-3849', 'j\'arrive att', '2020-04-05 18:23:55', 1, 1),
(1652, '959-3874', '725-9980', 'Liash-goto', '2020-04-15 14:26:15', 1, 0),
(1653, '725-9980', '959-3874', 'Liash-goto', '2020-04-15 14:26:15', 1, 1),
(1654, '959-3874', '725-9980', 'Tu es la ?', '2020-04-15 14:44:47', 1, 0),
(1655, '725-9980', '959-3874', 'Tu es la ?', '2020-04-15 14:44:47', 1, 1),
(1656, '725-9980', '959-3874', 'OUI', '2020-04-15 14:44:56', 1, 0),
(1657, '959-3874', '725-9980', 'OUI', '2020-04-15 14:44:56', 1, 1),
(1658, '959-3874', '725-9980', 'GPS: -955.998046875, 191.23736572266', '2020-04-15 14:49:46', 1, 0),
(1659, '725-9980', '959-3874', 'GPS: -955.998046875, 191.23736572266', '2020-04-15 14:49:47', 1, 1),
(1660, '959-3874', '725-9980', 'Venez', '2020-04-15 14:49:48', 1, 0),
(1661, '725-9980', '959-3874', 'Venez', '2020-04-15 14:49:48', 1, 1),
(1662, '959-3874', '725-9980', 'Mais coupez votre radio', '2020-04-15 14:49:52', 1, 0),
(1663, '725-9980', '959-3874', 'Mais coupez votre radio', '2020-04-15 14:49:53', 1, 1),
(1664, '959-3874', '725-9980', 'Pas de radio chez nous', '2020-04-15 14:49:58', 1, 0),
(1665, '725-9980', '959-3874', 'Pas de radio chez nous', '2020-04-15 14:49:58', 1, 1),
(1666, 'police', '373-2609', 'cc il y a quelq\'un', '2020-05-19 11:52:54', 1, 1),
(1667, 'ambulance', '143-9987', 'ici', '2020-05-19 23:16:36', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `phone_users_contacts`
--

INSERT INTO `phone_users_contacts` (`id`, `identifier`, `number`, `display`) VALUES
(126, 'steam:110000131d17b17', '298-5546', 'Guzz'),
(125, 'steam:11000010a51093f', '298-5546', 'Guzz Jefe'),
(124, 'steam:110000131ff48a7', '311-3222', 'Soso'),
(123, 'steam:110000135760edf', '817-9455', 'Mino'),
(122, 'steam:11000013f1e4076', '311-3222', 'Soso Maness'),
(121, 'steam:11000013f1e4076', '161-0697', 'DRAXO'),
(120, 'steam:1100001352d313a', '298-5546', 'guzz'),
(119, 'steam:11000011565324d', '407-3972', 'Juan');

-- --------------------------------------------------------

--
-- Structure de la table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `identifier` varchar(225) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `outfit` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `player_outfits`
--

INSERT INTO `player_outfits` (`id`, `identifier`, `name`, `outfit`) VALUES
(0, 'steam:110000134eb841d', 'Bajapsg', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"drawable\":[111,73,41,78,42,7,0,0,0,0,0],\"haircolor\":29,\"texture\":[15,0,1,0,0,11,0,0,0,0,0]}'),
(0, 'steam:110000134eb841d', 'Bajagang', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11},\"drawable\":[105,73,44,31,45,8,0,15,0,0,139],\"haircolor\":29,\"texture\":[19,0,1,1,0,0,0,0,0,0,5]}'),
(0, 'steam:1100001134d7608', 'vagos', '{\"drawable\":[51,73,2,42,40,8,0,29,0,0,127],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"haircolor\":0,\"texture\":[8,0,0,5,0,0,0,1,0,0,8]}'),
(0, 'steam:11000010c5246df', 'JUGE', '{\"texture\":[0,0,0,8,0,0,0,0,0,0,11],\"drawable\":[0,9,8,28,0,10,0,21,0,0,192],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":29}'),
(0, 'steam:110000107cb74f0', 'Putee', '{\"texture\":[0,0,0,2,0,0,0,0,0,0,1],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":30,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":100},\"drawable\":[0,55,2,20,9,77,0,0,0,0,70]}'),
(0, 'steam:11000010c5246df', 'STAFF MODERARION SPE', '{\"texture\":[0,0,0,13,0,5,0,0,0,0,9],\"drawable\":[35,9,39,69,0,28,0,15,0,0,190],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":-1,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":37},\"proptexture\":{\"1\":-1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":29}'),
(0, 'steam:11000011d17d595', 'vagos gang ', '{\"prop\":{\"1\":10,\"2\":12,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"texture\":[8,0,0,5,0,3,0,0,0,0,1],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"drawable\":[51,73,0,42,0,7,89,15,0,0,82],\"haircolor\":1,\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000116d213c4', 'costard riche', '{\"drawable\":[0,4,12,24,0,20,21,28,0,0,23],\"texture\":[0,0,0,2,0,7,12,6,0,0,2],\"haircolor\":1,\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000107cb74f0', 'LIash', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":100},\"drawable\":[0,55,3,14,9,81,0,3,0,0,184],\"haircolor\":30,\"texture\":[0,0,0,8,0,14,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,1,0,0,0,0,1,0,0,1,0]}'),
(0, 'steam:11000010e0e49d2', 'psg sauvage', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[111,73,19,78,44,7,0,0,0,0,0],\"texture\":[19,0,0,2,0,8,0,0,0,0,1],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"haircolor\":12}'),
(0, 'steam:11000011d17d595', 'vagos corp', '{\"drawable\":[51,73,0,42,0,7,89,15,0,0,82],\"prop\":{\"1\":10,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"texture\":[8,0,0,5,0,1,0,0,0,0,1],\"haircolor\":1,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000010e0e49d2', 'goto', '{\"texture\":[12,0,0,0,0,14,0,1,0,0,3],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11},\"haircolor\":12,\"drawable\":[105,73,22,31,44,7,0,62,0,0,139]}'),
(0, 'steam:11000011d17d595', 'stylax', '{\"prop\":{\"1\":10,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"drawable\":[51,73,0,42,0,8,88,15,0,0,82],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[8,0,0,5,0,0,0,0,0,0,1],\"haircolor\":1}'),
(0, 'steam:110000113f639ab', 'FLOMA', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,1,0,78,0,7,0,15,0,0,146],\"haircolor\":29,\"texture\":[0,0,0,2,0,8,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:1100001110517ec', 'Goto GANG', '{\"haircolor\":0,\"texture\":[7,0,0,2,0,3,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[105,73,44,31,44,7,0,15,0,0,139],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:1100001110517ec', 'Lacoste Arsenal', '{\"haircolor\":0,\"texture\":[0,0,0,0,0,11,0,0,0,0,2],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"drawable\":[0,73,30,78,44,7,0,15,0,0,0],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104}}'),
(0, 'steam:1100001110517ec', 'Vagos GANG ', '{\"haircolor\":0,\"texture\":[8,0,0,5,0,15,0,0,0,0,19],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"drawable\":[51,73,30,42,44,7,0,15,0,0,255],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104}}'),
(0, 'steam:11000010c5246df', 'WESH', '{\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":9},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,8,16,78,0,31,0,15,0,0,78],\"haircolor\":37,\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":77},\"texture\":[3,0,0,7,0,1,0,0,0,0,11]}'),
(0, 'steam:11000010c5246df', 'wESH SAC', '{\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":9},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,9,16,78,40,31,0,15,0,0,78],\"haircolor\":28,\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":77},\"texture\":[3,0,0,7,0,1,0,0,0,0,11]}'),
(0, 'steam:11000010c5246df', 'VAGOSSS', '{\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"texture\":[8,0,0,5,0,1,0,0,0,0,14],\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":28,\"drawable\":[51,9,28,42,40,31,51,15,0,0,127]}'),
(0, 'steam:11000013ebbb1da', 'ballas gang', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"texture\":[6,0,0,0,0,12,0,0,0,0,9],\"drawable\":[51,8,2,3,40,1,0,1,0,0,7],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"haircolor\":2,\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000137d40805', 'Tenue vagos', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,73,20,42,40,8,0,15,0,0,171],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"texture\":[8,0,0,5,0,6,0,0,0,0,0],\"haircolor\":3}'),
(0, 'steam:110000112f18b67', 'oklm', '{\"prop\":{\"1\":5,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":96},\"texture\":[9,0,0,0,0,5,0,0,0,0,4],\"drawable\":[101,2,1,79,0,76,0,15,0,0,86],\"haircolor\":9,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013ebbb1da', 'ballasssss ganggggg', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"texture\":[6,0,0,0,0,12,0,0,0,0,10],\"drawable\":[51,8,2,3,20,1,0,23,0,0,167],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"haircolor\":2,\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000133cdd287', 'g', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"drawable\":[51,1,15,42,0,9,0,15,0,0,15],\"prop\":{\"1\":6,\"2\":12,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":54},\"texture\":[6,0,0,0,0,5,0,0,0,0,0]}'),
(0, 'steam:110000133cdd287', 'ballas', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"drawable\":[51,1,0,42,0,9,0,40,0,0,84],\"prop\":{\"1\":6,\"2\":12,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":54},\"texture\":[6,0,0,0,0,5,0,0,0,0,5]}'),
(0, 'steam:11000011c10dece', 'civil', '{\"haircolor\":60,\"texture\":[0,0,0,0,0,0,0,0,0,0,20],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"drawable\":[0,3,17,72,44,24,0,15,0,0,220],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":6,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":106}}'),
(0, 'steam:110000133cdd287', 'gang', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"drawable\":[51,1,4,42,0,9,0,57,0,0,84],\"prop\":{\"1\":6,\"2\":12,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":54},\"texture\":[6,0,0,0,0,5,0,0,0,0,5]}'),
(0, 'steam:11000013e598f20', 'classe', '{\"haircolor\":9,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":0,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":27},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,11,1,10,0,10,4,4,0,0,4]}'),
(0, 'steam:11000010e44eba2', 'qd', '{\"prop\":{\"1\":8,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":8,\"drawable\":[0,12,19,78,40,77,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,7,0,0,0,0,0]}'),
(0, 'steam:11000013f3f016c', 'Street', '{\"drawable\":[0,10,1,97,0,27,29,2,0,0,78],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":12,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":8}'),
(0, 'steam:110000114207009', 'Vagos 1', '{\"prop\":{\"1\":10,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"texture\":[8,0,0,7,0,6,1,0,0,0,19],\"drawable\":[51,8,15,9,45,12,76,15,0,0,216],\"haircolor\":29,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20}}'),
(0, 'steam:110000104f7cfd9', 'Rue', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":3,\"drawable\":[51,73,8,33,44,7,0,15,0,0,38],\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":83},\"texture\":[0,0,0,0,0,12,0,0,0,0,0]}'),
(0, 'steam:11000010c5246df', 'VAGOS CLAQUETTE', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,9,28,42,40,6,0,15,0,0,127],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"haircolor\":28,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"texture\":[8,0,0,5,0,0,0,0,0,0,14]}'),
(0, 'steam:11000011c10dece', 'civil bg go pecho', '{\"haircolor\":60,\"texture\":[0,0,0,4,0,3,0,0,0,0,4],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":0,\"7\":-1,\"0\":8},\"drawable\":[0,3,30,78,44,7,0,15,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":3,\"7\":-1,\"0\":110}}'),
(0, 'steam:110000116d213c4', 'loobix foot', '{\"haircolor\":1,\"texture\":[0,0,0,1,0,0,0,0,0,0,1],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,4,0,78,0,1,0,15,0,0,146]}'),
(0, 'steam:11000013d255c54', 'F4L - 1', '{\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[51,16,30,42,31,1,0,100,0,0,205],\"haircolor\":0,\"texture\":[5,0,0,6,0,0,0,20,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":24,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4}}'),
(0, 'steam:11000013d255c54', 'F4L - 3', '{\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"drawable\":[51,16,6,42,44,1,0,15,0,0,262],\"haircolor\":0,\"texture\":[5,0,0,6,0,15,0,0,0,0,2],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":24,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":28}}'),
(0, 'steam:1100001389c7d3a', 'Tenue 1', '{\"drawable\":[51,19,30,4,40,26,0,15,0,0,89],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"haircolor\":2,\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":58}}'),
(0, 'steam:11000013f6c2648', 'CHEF VAGOS', '{\"drawable\":[51,1,5,5,0,12,17,15,0,0,5],\"texture\":[8,0,0,11,0,0,1,0,0,0,2],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":1,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":0}'),
(0, 'steam:11000013c82cefc', 'F4L -1', '{\"drawable\":[51,59,0,78,0,31,17,0,0,0,271],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":9},\"texture\":[5,0,0,1,0,1,1,0,0,0,4],\"haircolor\":29,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5}}'),
(0, 'steam:110000132031563', 'tenue blande et noir', '{\"texture\":[0,0,0,6,0,0,0,0,0,0,11],\"drawable\":[0,3,24,27,44,1,0,2,0,0,11],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":8,\"prop\":{\"1\":3,\"2\":13,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":95}}'),
(0, 'steam:11000013c8b6983', 'kenqa families', '{\"drawable\":[51,73,20,4,44,8,0,23,0,0,127],\"haircolor\":0,\"texture\":[5,0,0,0,0,0,0,1,0,0,2],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":110},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":10,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2}}'),
(0, 'steam:11000010af219c5', 'LSPD', '{\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,2,2,0],\"drawable\":[0,48,11,31,45,24,0,58,0,0,50],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:11000011b1bb7e2', 'vagos gang', '{\"drawable\":[0,73,15,42,40,8,0,15,0,0,15],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":2,\"texture\":[0,0,0,5,0,3,0,0,0,0,0],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":110}}'),
(0, 'steam:11000011b1bb7e2', 'VAGOSGANGMASQUITO', '{\"drawable\":[51,73,15,42,40,8,0,15,0,0,15],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":2,\"texture\":[8,0,0,5,0,3,0,0,0,0,0],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":110}}'),
(0, 'steam:1100001174fafcb', 'Vagos', '{\"texture\":[8,0,0,0,0,6,1,0,0,0,1],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":1,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,0,2,62,0,8,17,15,0,0,238],\"prop\":{\"1\":16,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:11000010e44eba2', 'q', '{\"prop\":{\"1\":8,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":54},\"drawable\":[51,12,18,38,44,25,0,15,0,0,65],\"texture\":[5,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,2,2,0,2,0,2,0,0,2],\"haircolor\":8}'),
(0, 'steam:1100001055151a0', 'Gang', '{\"haircolor\":0,\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,7,16,24,44,7,0,124,0,0,139],\"texture\":[0,0,0,0,0,0,0,0,0,0,3],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:11000010e44eba2', 'dqdd', '{\"prop\":{\"1\":8,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":54},\"drawable\":[51,12,19,42,0,6,0,15,0,0,84],\"texture\":[5,0,0,6,0,0,0,0,0,0,3],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":8}'),
(0, 'steam:11000013328dd6b', '4', '{\"haircolor\":0,\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"drawable\":[36,0,1,10,40,10,0,22,0,0,11],\"texture\":[0,0,0,0,0,0,0,0,0,0,1],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2}}'),
(0, 'steam:11000010c2b6ae3', 'oklm', '{\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,3,0,0,0,0,1],\"drawable\":[0,12,30,33,40,7,0,15,0,0,273],\"haircolor\":55,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1}}'),
(0, 'steam:11000010962fe2b', 'PSG', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,73,30,4,31,7,0,0,0,0,0],\"texture\":[0,0,0,0,0,8,0,0,0,0,1],\"haircolor\":55,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:11000013524d765', 'F4L', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"texture\":[0,0,0,0,0,0,0,0,0,0,4],\"proptexture\":{\"1\":7,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"prop\":{\"1\":2,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"drawable\":[51,59,37,33,9,7,50,15,0,0,83]}'),
(0, 'steam:110000136586fd9', 'familis', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"drawable\":[51,24,2,5,40,6,0,15,0,0,128],\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[5,0,0,6,0,0,0,0,0,0,0]}'),
(0, 'steam:110000136839072', 'veste en cuir', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,0,0,2,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"haircolor\":29,\"drawable\":[0,14,17,24,44,21,17,13,0,0,62]}'),
(0, 'steam:11000013524d765', 'F4L MOD', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"texture\":[5,0,0,0,0,10,0,0,0,0,4],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":2,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"drawable\":[51,59,37,33,0,9,50,15,0,0,83]}'),
(0, 'steam:110000136930e48', 'Vagos 1 ', '{\"drawable\":[51,16,2,42,0,8,0,15,0,0,223],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"texture\":[8,0,0,0,0,0,0,0,0,0,5],\"haircolor\":14,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":28},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000136930e48', 'Vagos 2 ', '{\"drawable\":[51,16,1,42,0,8,0,15,0,0,14],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[8,0,0,0,0,0,0,0,0,0,1],\"haircolor\":14,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000011ae4fd1b', 'cuir', '{\"drawable\":[0,53,6,8,0,81,0,2,0,0,262],\"prop\":{\"1\":11,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,5,0,0,0,0,0],\"haircolor\":19,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:110000136930e48', 'Vagos 3 ', '{\"drawable\":[51,16,1,5,0,8,0,15,0,0,171],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[8,0,0,2,0,6,0,0,0,0,0],\"haircolor\":14,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000136930e48', 'Vagos 4 Tors nu ', '{\"drawable\":[51,16,1,26,0,8,0,15,0,0,171],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[8,0,0,0,0,6,0,0,0,0,0],\"haircolor\":14,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013cc20d9b', 'NORMAL', '{\"haircolor\":26,\"drawable\":[0,11,17,4,45,1,0,15,0,0,89],\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":2,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":44},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000010c5246df', 'CASQUE NOIR', '{\"drawable\":[0,9,33,49,44,36,0,15,0,0,139],\"haircolor\":28,\"prop\":{\"1\":0,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":50},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[0,0,0,0,0,3,0,0,0,0,3],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000139cd39f0', 'Basket', '{\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,19,8,4,40,24,0,15,0,0,282],\"texture\":[0,0,0,0,0,0,0,0,0,0,1],\"haircolor\":3,\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001053bda55', 'bien', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,21,19,10,40,25,19,13,0,0,13],\"prop\":{\"1\":8,\"2\":14,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":29,\"texture\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001362ee9bb', 'Stilé', '{\"proptexture\":{\"1\":7,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":55,\"drawable\":[0,55,33,4,0,59,0,3,0,0,142],\"texture\":[0,0,0,0,0,20,0,0,0,0,0]}'),
(0, 'steam:110000114207009', 'Vagos 2', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[51,8,0,1,45,12,51,81,0,0,157],\"texture\":[8,0,0,1,0,6,0,3,0,0,1],\"haircolor\":29,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":10,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":83}}'),
(0, 'steam:110000117d04e18', 'costume', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,0,2,0,0,0,2],\"drawable\":[0,3,4,8,0,1,12,10,0,0,20],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":1}'),
(0, 'steam:110000114207009', 'Vagos 3', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"drawable\":[51,8,2,12,45,8,51,15,0,0,219],\"texture\":[8,0,0,0,0,2,0,0,0,0,19],\"haircolor\":29,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":10,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":106}}'),
(0, 'steam:1100001148b6a2e', 'Le loup ', '{\"drawable\":[26,19,17,28,0,10,84,4,0,0,72],\"texture\":[1,0,0,0,0,0,0,0,0,0,2],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":0}'),
(0, 'steam:11000011771be11', 'Vagosgtalife', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[8,0,0,5,0,0,0,0,0,0,6],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"drawable\":[51,73,0,42,0,8,0,15,0,0,271],\"prop\":{\"1\":5,\"2\":8,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8}}'),
(0, 'steam:1100001148b6a2e', 'Tenue Op', '{\"drawable\":[104,19,37,28,0,10,0,6,0,0,11],\"texture\":[25,0,0,0,0,0,0,2,0,0,1],\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":24,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12}}'),
(0, 'steam:110000110d66670', 'Vagos 1', '{\"drawable\":[51,73,15,62,0,8,42,57,0,0,15],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":76},\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"texture\":[8,0,0,0,0,6,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013c574537', 'UUU', '{\"prop\":{\"1\":-1,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":106},\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,9,47,105,40,10,0,4,0,0,142],\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":-1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20}}'),
(0, 'steam:110000110d66670', 'Vagos 2', '{\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":3,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":76},\"drawable\":[51,73,17,4,44,8,49,23,0,0,127],\"texture\":[8,0,0,0,0,6,0,1,0,0,8]}'),
(0, 'steam:11000011498655c', 'TKT MON BEBE', '{\"drawable\":[0,3,23,8,0,12,78,15,0,0,135],\"proptexture\":{\"1\":2,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":10,\"2\":8,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,3,0,12,0,0,0,0,0],\"haircolor\":29}'),
(0, 'steam:11000011498655c', 'lutin ', '{\"drawable\":[123,3,3,95,64,67,78,15,0,0,246],\"proptexture\":{\"1\":2,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":0,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":10,\"2\":8,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":3,\"7\":-1,\"0\":23},\"texture\":[10,0,0,10,22,5,0,0,0,0,10],\"haircolor\":29}'),
(0, 'steam:11000013e598f20', 'bleau et jaune', '{\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":0,\"7\":-1,\"0\":0},\"drawable\":[0,11,1,27,0,22,0,15,0,8,96],\"haircolor\":9,\"palette\":[0,0,0,0,0,0,2,0,0,0,0],\"texture\":[0,0,0,0,0,4,0,0,0,1,0],\"prop\":{\"1\":8,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":3,\"7\":-1,\"0\":77}}'),
(0, 'steam:11000010c5246df', 'noir', '{\"haircolor\":28,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":0,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":50},\"texture\":[0,0,0,0,0,0,0,0,0,0,3],\"drawable\":[0,9,33,24,44,1,0,15,0,0,139],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:110000107c2e27d', 'Biscuitnoel', '{\"haircolor\":29,\"drawable\":[123,1,3,95,10,7,34,15,0,0,246],\"texture\":[9,0,0,9,12,0,0,0,0,0,9],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001362ee9bb', 'Chill', '{\"drawable\":[0,55,33,4,0,59,0,11,0,0,62],\"palette\":[0,0,0,0,0,0,0,0,0,2,0],\"texture\":[0,0,0,0,0,20,0,2,0,0,0],\"haircolor\":55,\"prop\":{\"1\":5,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":58},\"proptexture\":{\"1\":7,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2}}'),
(0, 'steam:11000011771be11', 'VagosBooba', '{\"drawable\":[51,73,15,62,0,8,43,15,0,0,15],\"texture\":[8,0,0,0,0,6,0,0,0,0,0],\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"prop\":{\"1\":5,\"2\":8,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14}}'),
(0, 'steam:110000116d213c4', 'goto', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[105,4,22,31,45,25,0,15,0,0,139],\"texture\":[10,0,0,0,0,0,0,0,0,0,1],\"haircolor\":1,\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:11000013d255c54', 'F4L - 4', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,16,28,1,0,1,0,15,0,0,88],\"haircolor\":0,\"texture\":[5,0,0,0,0,15,0,0,0,0,3],\"prop\":{\"1\":5,\"2\":24,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22}}'),
(0, 'steam:110000114207009', 'Vagos noir', '{\"prop\":{\"1\":10,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":83},\"haircolor\":29,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,8,17,9,45,8,0,15,0,0,86],\"texture\":[0,0,0,7,0,2,0,0,0,0,0]}'),
(0, 'steam:110000107cb74f0', 'Black market', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,1,0,1,0,0,0,0,3],\"haircolor\":29,\"proptexture\":{\"1\":3,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[0,55,3,11,45,1,0,3,0,0,136],\"prop\":{\"1\":11,\"2\":3,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":49}}'),
(0, 'steam:11000010c2b6ae3', 'civil', '{\"drawable\":[104,73,30,33,40,7,0,15,0,0,273],\"haircolor\":56,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":3,\"7\":-1,\"0\":3},\"texture\":[25,0,0,0,0,3,0,0,0,0,1],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":0,\"7\":-1,\"0\":1}}'),
(0, 'steam:11000010c2b6ae3', 'CIVILOS', '{\"drawable\":[104,73,30,33,44,7,0,15,0,0,273],\"haircolor\":56,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":3,\"7\":-1,\"0\":3},\"texture\":[25,0,0,0,0,3,0,0,0,0,1],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":0,\"7\":-1,\"0\":1}}'),
(0, 'steam:110000112a10f02', 'loco street', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[7,0,0,2,0,0,0,0,0,0,3],\"drawable\":[51,73,0,5,0,12,0,0,0,0,83],\"prop\":{\"1\":9,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":0}'),
(0, 'steam:110000112a10f02', 'loco street 1', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[7,0,0,2,0,0,0,0,0,0,3],\"drawable\":[51,73,0,5,0,12,0,15,0,0,83],\"prop\":{\"1\":9,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":0}'),
(0, 'steam:110000112a10f02', 'vol', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,2,0,0,0,0,0,0,14],\"drawable\":[53,73,16,5,0,12,0,15,0,0,126],\"prop\":{\"1\":0,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":0}'),
(0, 'steam:11000010c5246df', 'BG', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":29,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"drawable\":[111,8,20,78,44,9,0,75,0,0,7],\"texture\":[17,0,0,1,0,2,0,3,0,0,2],\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104}}'),
(0, 'steam:11000013f38954a', 'tenu gange ver', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":18},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[5,0,0,0,0,0,0,0,0,0,0],\"haircolor\":3,\"drawable\":[51,8,0,59,40,6,0,15,0,0,128],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104}}'),
(0, 'steam:11000013d255c54', 'F4L - 5', '{\"haircolor\":0,\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":24,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,16,28,87,0,7,50,15,0,0,3],\"texture\":[5,0,0,20,0,0,0,0,0,0,2]}'),
(0, 'steam:110000136df75b4', 'classe de ouf !! ', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"texture\":[0,0,0,0,0,1,0,2,0,0,0],\"drawable\":[0,73,11,24,0,30,0,7,0,0,21],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":58},\"haircolor\":15}'),
(0, 'steam:11000010c5246df', 'chassure bg', '{\"haircolor\":29,\"drawable\":[111,8,20,78,44,42,0,75,0,0,7],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[17,0,0,1,0,1,0,3,0,0,2],\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20}}'),
(0, 'steam:110000107cb74f0', 'Exta', '{\"drawable\":[0,55,3,14,44,27,0,3,0,0,184],\"texture\":[0,0,0,8,0,0,0,0,0,0,0],\"haircolor\":29,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":11,\"2\":3,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"proptexture\":{\"1\":3,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:110000112a10f02', 'lourd larlar', '{\"texture\":[1,0,0,2,0,0,0,0,0,0,7],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"prop\":{\"1\":0,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":83},\"drawable\":[51,73,1,5,0,12,0,15,0,0,14],\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000139cd39f0', 'OKLM', '{\"texture\":[0,0,0,0,0,0,0,2,0,0,6],\"haircolor\":3,\"drawable\":[0,19,8,4,0,24,0,2,0,0,6],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":50}}'),
(0, 'steam:1100001136b72ab', '1', '{\"drawable\":[51,8,20,6,0,7,5,0,0,0,14],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"texture\":[9,0,0,1,0,0,0,0,0,0,7],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":29}'),
(0, 'steam:110000139cd39f0', 'Gilet par balle', '{\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":103},\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":3,\"drawable\":[89,19,8,4,0,24,0,124,0,0,50],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:1100001136b72ab', '2', '{\"drawable\":[51,8,20,6,0,7,5,15,0,0,14],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"texture\":[9,0,0,1,0,0,0,0,0,0,7],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":29}'),
(0, 'steam:1100001136b72ab', '3', '{\"drawable\":[51,8,20,6,0,7,5,15,0,0,14],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"texture\":[1,0,0,1,0,0,0,0,0,0,7],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":29}'),
(0, 'steam:1100001134d7608', 'vagos 2', '{\"prop\":{\"1\":-1,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"texture\":[8,0,0,5,0,0,0,0,0,0,0],\"proptexture\":{\"1\":-1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[51,73,1,42,40,8,0,15,0,0,134]}'),
(0, 'steam:11000010c5246df', 'BG DE FOU', '{\"texture\":[1,0,0,1,0,7,0,0,0,0,3],\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":77},\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":19},\"haircolor\":29,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,8,30,78,44,1,0,15,0,0,146]}'),
(0, 'steam:110000107c2e27d', 'bisblanc', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"drawable\":[123,1,30,82,0,76,0,15,0,0,84],\"prop\":{\"1\":4,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"haircolor\":29,\"texture\":[7,0,0,4,0,15,0,0,0,0,0]}'),
(0, 'steam:11000010c5246df', 'WEEEE', '{\"haircolor\":29,\"texture\":[1,0,0,1,0,12,0,0,0,0,3],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":19},\"drawable\":[51,8,30,78,44,7,0,15,0,0,146],\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":77}}'),
(0, 'steam:110000132031563', 'VAGOS', '{\"drawable\":[51,15,29,102,0,25,0,3,0,0,247],\"prop\":{\"1\":11,\"2\":13,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":61,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[8,0,0,5,0,0,0,0,0,0,5]}'),
(0, 'steam:11000011c10dece', 'invest inchallah', '{\"texture\":[0,0,0,0,0,0,0,0,0,0,20],\"drawable\":[0,3,31,31,44,24,6,22,0,0,222],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":0,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":3,\"7\":-1,\"0\":8},\"haircolor\":60}'),
(0, 'steam:110000132031563', 'VAGOSSSS', '{\"drawable\":[51,15,29,14,0,27,37,3,0,0,247],\"prop\":{\"1\":11,\"2\":13,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":58},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"haircolor\":61,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[8,0,0,9,0,0,0,0,0,0,5]}'),
(0, 'steam:11000010cd07425', 'Street', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"texture\":[7,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,37,23,26,0,8,17,15,0,0,5],\"proptexture\":{\"1\":1,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":0}'),
(0, 'steam:11000010cd07425', 'Bien ', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"texture\":[7,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,37,77,24,0,18,1,13,0,0,4],\"proptexture\":{\"1\":1,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":0}'),
(0, 'steam:11000010cd07425', 'Elegant', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"texture\":[7,0,0,0,0,0,2,0,0,0,0],\"drawable\":[0,37,77,24,0,18,12,13,0,0,4],\"proptexture\":{\"1\":1,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":0}'),
(0, 'steam:11000011746ddb6', 'tenu ville1', '{\"texture\":[1,0,0,2,0,2,0,0,0,0,2],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":29,\"drawable\":[51,44,30,0,44,1,17,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000111d824c4', 'vajos', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":26,\"texture\":[8,0,0,12,0,0,0,0,0,0,15],\"prop\":{\"1\":11,\"2\":13,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":25},\"proptexture\":{\"1\":3,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[51,42,24,12,44,25,0,14,0,0,11]}'),
(0, 'steam:110000114207009', 'Vagos 4', '{\"texture\":[8,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":10,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":105},\"haircolor\":29,\"drawable\":[51,8,15,1,45,12,43,15,0,0,157],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013d06486e', 'bg', '{\"proptexture\":{\"1\":10,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[0,12,22,4,45,8,0,15,0,0,139],\"texture\":[0,0,0,2,0,12,0,0,0,0,3],\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":83}}'),
(0, 'steam:11000011d17d595', 'le style', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":1,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,73,0,1,0,8,89,15,0,0,113],\"prop\":{\"1\":10,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"texture\":[8,0,0,1,0,6,0,0,0,0,1]}'),
(0, 'steam:11000011d17d595', 'le style de ouf', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":1,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,73,4,1,0,8,89,15,0,0,113],\"prop\":{\"1\":10,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"texture\":[8,0,0,1,0,6,0,0,0,0,1]}'),
(0, 'steam:11000010312a138', 'Adepte', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[105,9,17,59,45,25,17,15,0,0,139],\"texture\":[18,0,0,9,0,0,0,0,0,0,3],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":83},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0}'),
(0, 'steam:11000010312a138', 'Civil', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"drawable\":[51,9,0,42,0,4,17,15,0,0,83],\"texture\":[7,0,0,4,0,4,0,0,0,0,0],\"prop\":{\"1\":8,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0}'),
(0, 'steam:11000013e113325', '1', '{\"texture\":[7,0,0,0,0,6,0,0,0,0,1],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":2,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"drawable\":[118,73,14,62,0,2,17,15,0,0,3]}'),
(0, 'steam:11000013761d2a8', '1', '{\"texture\":[0,0,0,0,0,1,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"drawable\":[51,21,26,24,44,30,0,13,0,0,13],\"haircolor\":0,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000010312a138', 'civil adepte', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"drawable\":[51,9,12,24,0,1,17,15,0,0,139],\"texture\":[0,0,0,5,0,14,0,0,0,0,3],\"prop\":{\"1\":8,\"2\":10,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0}'),
(0, 'steam:11000013761d2a8', 'Civil 1', '{\"texture\":[0,0,0,0,0,14,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"drawable\":[51,21,26,24,44,7,0,13,0,0,13],\"haircolor\":0,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000011746ddb6', 'tenu cartel', '{\"texture\":[1,0,0,5,0,20,0,0,0,0,3],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":29,\"drawable\":[51,44,33,24,44,77,17,15,0,0,139],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000104f7cfd9', 'RP', '{\"texture\":[19,0,0,0,0,11,0,0,0,0,3],\"haircolor\":3,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":83},\"drawable\":[105,73,22,31,44,7,0,15,0,0,139]}'),
(0, 'steam:11000010f070c28', 'LOL', '{\"drawable\":[51,1,22,24,0,7,0,15,0,0,139],\"texture\":[0,0,0,5,0,6,0,0,0,0,3],\"prop\":{\"1\":5,\"2\":3,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":0}'),
(0, 'steam:11000010c5246df', 'GOTO', '{\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"haircolor\":28,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[11,0,0,0,0,15,0,0,0,0,3],\"drawable\":[105,9,27,31,44,7,0,131,0,0,139]}'),
(0, 'steam:11000013761d2a8', 'La z', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,5,0,0,0,0,0,0,3],\"haircolor\":0,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[51,21,26,25,44,28,0,15,0,0,139],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12}}'),
(0, 'steam:11000013761d2a8', 'LGZ', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,5,0,0,0,0,0,0,3],\"haircolor\":0,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[51,21,27,25,44,28,17,15,0,0,139],\"prop\":{\"1\":5,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12}}'),
(0, 'steam:11000010c5246df', 'chapeau', '{\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"drawable\":[51,8,30,78,44,7,0,15,0,0,146],\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"texture\":[1,0,0,1,0,5,0,0,0,0,3],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":29}'),
(0, 'steam:11000013671ba3d', 'Chemise', '{\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"drawable\":[51,73,2,62,0,8,0,15,0,0,219],\"prop\":{\"1\":7,\"2\":15,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":106},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[8,0,0,0,0,0,0,0,0,0,20]}'),
(0, 'steam:11000013671ba3d', 'COMPLET', '{\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"drawable\":[51,73,11,7,0,12,123,15,0,0,13],\"prop\":{\"1\":7,\"2\":15,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":106},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[8,0,0,0,0,6,0,0,0,0,2]}'),
(0, 'steam:11000013671ba3d', 'Veste', '{\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"drawable\":[51,73,1,62,0,8,123,0,0,0,3],\"prop\":{\"1\":7,\"2\":15,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":106},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[8,0,0,0,0,0,0,2,0,0,8]}'),
(0, 'steam:11000013671ba3d', 'POLO', '{\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"drawable\":[51,73,0,62,0,8,123,15,0,0,82],\"prop\":{\"1\":7,\"2\":15,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":106},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[8,0,0,0,0,0,0,0,0,0,15]}'),
(0, 'steam:11000013d06486e', 'white', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[111,12,22,78,45,7,0,15,0,0,84],\"texture\":[15,0,0,1,0,14,0,0,0,0,0],\"haircolor\":0,\"proptexture\":{\"1\":10,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14}}'),
(0, 'steam:11000010312a138', 'bloodz', '{\"texture\":[9,0,0,0,0,11,0,0,0,0,4],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[111,9,0,42,0,7,0,15,0,0,128],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"prop\":{\"1\":0,\"2\":10,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14}}'),
(0, 'steam:11000013f6d5bf7', 'fami', '{\"haircolor\":29,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":54},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[5,0,0,6,0,2,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,33,15,7,44,31,46,15,0,0,15]}'),
(0, 'steam:11000013f6d5bf7', 'survt', '{\"haircolor\":29,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":54},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[5,0,0,6,0,0,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,33,15,3,44,25,46,15,0,0,15]}'),
(0, 'steam:11000010aa893de', 'Normal', '{\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":44},\"texture\":[6,0,0,2,0,3,0,5,0,0,0],\"haircolor\":60,\"drawable\":[126,32,1,4,0,43,51,0,0,0,62],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1}}'),
(0, 'steam:110000133ef511e', 'BG', '{\"proptexture\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,21,4,10,0,10,0,32,0,0,142],\"haircolor\":4,\"texture\":[0,0,0,0,0,0,0,2,0,0,0],\"prop\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000133ef511e', 'BG 2', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,21,17,24,44,32,0,4,0,0,10],\"haircolor\":4,\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}');
INSERT INTO `player_outfits` (`id`, `identifier`, `name`, `outfit`) VALUES
(0, 'steam:110000112a10f02', 'city', '{\"haircolor\":0,\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"drawable\":[0,73,1,4,0,31,0,15,0,0,220],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,1,0,0,0,0,20],\"prop\":{\"1\":4,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14}}'),
(0, 'steam:110000133ef511e', 'GANG BG', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,21,17,4,44,31,0,23,0,0,62],\"haircolor\":4,\"texture\":[0,0,0,0,0,4,0,1,0,0,0],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000136bf4bfd', 'PSG', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,1,0,8,0,0,0,0,1],\"haircolor\":3,\"drawable\":[0,21,30,78,0,7,0,15,0,0,0],\"prop\":{\"1\":5,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"proptexture\":{\"1\":6,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:110000136bf4bfd', 'GOTO', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[3,0,0,0,0,11,2,1,0,0,1],\"haircolor\":3,\"drawable\":[105,73,17,31,0,7,112,62,0,0,139],\"prop\":{\"1\":0,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:110000136bf4bfd', 'GOTO 2', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,6,0,1,0,0,3],\"haircolor\":3,\"drawable\":[105,73,17,31,0,7,0,62,0,0,139],\"prop\":{\"1\":0,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:110000136bf4bfd', 'OP', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[25,0,0,0,0,6,2,4,0,0,0],\"haircolor\":3,\"drawable\":[104,21,17,33,0,7,112,22,0,0,205],\"prop\":{\"1\":24,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":58},\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2}}'),
(0, 'steam:1100001118220b9', 'Fam', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,49,19,42,0,1,1,0,0,0,86],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":61,\"prop\":{\"1\":2,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"texture\":[5,0,0,6,0,0,0,0,0,0,2]}'),
(0, 'steam:11000013d255c54', 'F4L - Blnc', '{\"texture\":[5,0,0,6,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":24,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"drawable\":[51,16,15,42,44,8,0,15,0,0,238],\"haircolor\":0,\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013f6c2648', 'CHEF VAGOS 2', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,1,11,7,0,51,21,15,0,0,13],\"haircolor\":0,\"texture\":[8,0,0,4,0,0,11,0,0,0,2],\"prop\":{\"1\":9,\"2\":5,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2}}'),
(0, 'steam:110000131fef444', 'le bg ', '{\"drawable\":[0,19,4,26,44,57,0,131,0,0,182],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":58,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,9,0,3,0,0,0]}'),
(0, 'steam:11000013dc74206', 'Normal', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,21,1,4,45,31,5,1,0,0,7],\"texture\":[0,0,0,0,0,2,0,1,0,0,2],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":2}'),
(0, 'steam:110000136df75b4', 'MAGNIFIQUE', '{\"drawable\":[0,73,11,24,0,42,0,9,0,0,184],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":15,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":9},\"texture\":[0,0,0,1,0,1,0,0,0,0,2],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":77}}'),
(0, 'steam:110000112f18b67', 'classsssssssss', '{\"haircolor\":9,\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":0,\"7\":-1,\"0\":0},\"prop\":{\"1\":24,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":3,\"7\":-1,\"0\":52},\"drawable\":[54,2,35,24,45,10,0,22,0,0,11],\"texture\":[0,0,0,0,0,0,0,2,0,0,1],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000011a1a1fe7', 'Noir', '{\"texture\":[5,0,0,2,0,0,0,0,0,0,0],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[51,14,0,42,0,1,0,40,0,0,128],\"haircolor\":1,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":2,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:1100001110517ec', 'Casa de papel braqua', '{\"texture\":[3,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[50,73,30,38,44,25,0,15,0,0,65],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001110517ec', 'Tenu casa de papel', '{\"texture\":[1,0,0,0,0,0,0,1,0,0,3],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[50,73,30,38,44,25,0,74,0,0,68],\"prop\":{\"1\":0,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013c35674e', 'moi', '{\"drawable\":[0,3,6,7,40,9,0,5,0,0,7],\"haircolor\":15,\"texture\":[0,0,0,12,0,0,0,2,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013c574537', 'Casa de papel', '{\"drawable\":[50,9,47,39,45,27,0,75,0,0,68],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":106},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"texture\":[1,0,0,0,0,0,0,1,0,0,3],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20}}'),
(0, 'steam:11000013c574537', 'tchetchen', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[104,9,53,87,45,27,0,15,0,0,221],\"haircolor\":0,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":106},\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:1100001110517ec', 'Le vieux ', '{\"drawable\":[71,73,31,24,44,18,0,22,0,0,11],\"haircolor\":0,\"texture\":[1,0,0,0,0,0,0,4,0,0,1],\"prop\":{\"1\":0,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013c574537', 'JOKER BLANC', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,0,0,2,0,0,0],\"drawable\":[104,9,42,20,45,10,3,3,0,0,20],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":64}}'),
(0, 'steam:110000136586fd9', 'best 1', '{\"texture\":[25,0,0,0,0,0,0,4,0,0,0],\"drawable\":[104,24,31,33,40,8,0,22,0,0,205],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":66},\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:11000011a948bd4', 'cartel', '{\"drawable\":[104,9,16,87,45,25,0,5,0,0,210],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":15,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":105},\"texture\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013f45df3e', 'hqzd', '{\"drawable\":[51,73,17,4,44,7,0,15,0,0,139],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,2,0,0,0,0,0,0,3],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"prop\":{\"1\":3,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104}}'),
(0, 'steam:11000011ab54412', '', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,0,0,0,0,0,2],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,14,2,8,40,1,0,0,0,0,7]}'),
(0, 'steam:11000011ab54412', 'civil', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,2,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,14,16,4,40,9,0,4,0,0,4]}'),
(0, 'steam:110000112f18b67', 'tranquillle', '{\"prop\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":52},\"drawable\":[10,2,0,78,45,32,0,130,0,0,271],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[0,0,0,4,0,4,0,0,0,0,1],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":9}'),
(0, 'steam:1100001079724cf', 'costume 1', '{\"texture\":[0,0,0,0,0,3,0,0,0,0,0],\"drawable\":[0,21,1,24,0,3,0,28,0,0,23],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":26,\"prop\":{\"1\":6,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000010c86085a', 'hbfhf', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":0,\"drawable\":[0,0,2,8,40,1,0,0,0,0,7],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,0,0,0,0,0,2],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:1100001176bee82', 'vago', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":10,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[8,0,0,2,0,11,0,3,0,0,2],\"drawable\":[51,9,2,16,40,1,0,1,0,0,7]}'),
(0, 'steam:11000011422e0e6', 'Jefe', '{\"drawable\":[51,1,17,24,0,3,0,4,0,0,20],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":13,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"texture\":[0,0,0,5,0,4,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001090d937b', 'Mode Fonda', '{\"drawable\":[0,57,12,24,0,10,12,13,0,0,4],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,0,2,0,0,0,0]}'),
(0, 'steam:1100001361ac93d', 'classe', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,0,0,2,0,0,0],\"drawable\":[0,21,4,10,40,10,0,32,0,0,142],\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000011811d317', 'BG TA CAPTER', '{\"prop\":{\"1\":5,\"2\":23,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":29,\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,10,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,14,19,10,0,9,0,15,0,0,13]}'),
(0, 'steam:110000136fdf57f', 'Jeuness', '{\"drawable\":[0,0,28,1,0,12,80,15,0,0,127],\"haircolor\":0,\"texture\":[0,0,0,0,0,0,0,0,0,0,14],\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":18,\"2\":3,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7}}'),
(0, 'steam:1100001090d937b', 'Tacos ', '{\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[143,57,88,5,0,77,0,15,0,0,281],\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,5,0,11,0,0,0,0,2]}'),
(0, 'steam:110000139e78eb8', '', '{\"prop\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,3,0,0,0,0,0],\"drawable\":[0,73,4,3,0,1,0,15,0,0,5],\"proptexture\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":3,\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013330bf2a', 'Stylax au Max', '{\"drawable\":[0,1,5,42,0,31,0,5,0,0,5],\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":3,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":77},\"texture\":[0,0,0,0,0,1,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7}}'),
(0, 'steam:1100001090d937b', 'Staff', '{\"haircolor\":0,\"texture\":[0,0,0,2,0,11,0,0,0,0,1],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[94,57,17,37,0,77,0,15,0,0,107],\"prop\":{\"1\":0,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:11000013ec7c5e0', 'cotar', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[0,12,4,8,0,10,0,11,0,0,4],\"haircolor\":0,\"texture\":[0,0,0,0,0,0,0,2,0,0,0],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013ec7c5e0', 'cotarrrrrrrrrrrrrrrr', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[0,12,4,10,0,10,0,11,0,0,4],\"haircolor\":0,\"texture\":[0,0,0,0,0,0,0,2,0,0,0],\"prop\":{\"1\":2,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013330bf2a', 'Mafia', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,4,0,0,0,0,0],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"haircolor\":0,\"drawable\":[51,1,17,24,0,3,0,4,0,0,28],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:11000013330bf2a', 'Ballas', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":77},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"drawable\":[0,1,4,42,0,6,0,15,0,0,84],\"haircolor\":0,\"texture\":[0,0,0,0,0,1,0,0,0,0,5]}'),
(0, 'steam:11000011a9bc697', 'Col roulé', '{\"proptexture\":{\"1\":10,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,0,0,0,0,0,3],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":17,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":0,\"drawable\":[0,44,27,24,0,8,0,15,0,0,139]}'),
(0, 'steam:11000010a96d707', 'Cool 1', '{\"texture\":[0,0,0,3,0,1,0,0,0,0,0],\"drawable\":[0,28,0,11,0,1,0,2,0,0,79],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":5,\"2\":15,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":57,\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001194c6243', 'noire', '{\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"texture\":[0,0,0,0,0,0,0,0,0,0,1],\"drawable\":[0,15,1,24,0,10,0,22,0,0,11],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013ffe09e0', 'Serieux', '{\"texture\":[0,0,0,0,0,2,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":36,\"drawable\":[0,3,16,4,45,8,3,15,0,0,139],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:110000140c3c639', 'twin', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[0,0,0,1,0,2,0,0,0,0,0],\"drawable\":[15,3,16,0,45,8,0,15,0,0,139],\"haircolor\":36,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000104618b07', 'Basique', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,0,0,0,0,0,3],\"drawable\":[0,21,0,4,0,8,0,0,0,0,0],\"haircolor\":1,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":6,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:1100001120b6603', 'cc', '{\"drawable\":[0,9,4,9,40,1,0,15,0,0,14],\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,7,0,2,0,0,0,0,13],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":3}'),
(0, 'steam:11000013ef1eada', '', '{\"haircolor\":0,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,14,1,30,40,1,0,0,0,0,7],\"prop\":{\"1\":-1,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"proptexture\":{\"1\":-1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,0,0,0,0,0,0,0,2]}'),
(0, 'steam:1100001148b6a2e', 'Tenue Cité de france', '{\"drawable\":[51,50,20,4,9,12,0,0,0,0,167],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[7,0,0,0,0,6,0,2,0,0,3],\"prop\":{\"1\":3,\"2\":7,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":44},\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"haircolor\":61}'),
(0, 'steam:11000011811d317', 'Mafia OP', '{\"prop\":{\"1\":0,\"2\":3,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":26},\"texture\":[2,0,0,0,0,0,2,3,0,0,0],\"drawable\":[72,14,31,31,44,25,112,131,0,0,50],\"haircolor\":29,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001194c6243', 'mafia op', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[72,15,17,31,44,25,112,131,0,0,50],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"haircolor\":0,\"prop\":{\"1\":0,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":26},\"texture\":[2,0,0,0,0,0,2,3,0,0,0]}'),
(0, 'steam:11000013330bf2a', 'Mafiia', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,5,0,3,0,4,0,0,1],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"drawable\":[0,1,77,24,0,20,0,22,0,0,25],\"haircolor\":0,\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1}}'),
(0, 'steam:110000140c3c639', 'sans masque', '{\"texture\":[0,0,0,1,0,2,0,0,0,0,0],\"drawable\":[0,3,16,0,45,8,0,15,0,0,139],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":36,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:110000140c3c639', 'sans masque et sacs', '{\"texture\":[0,0,0,1,0,2,0,0,0,0,0],\"drawable\":[0,3,16,0,0,8,0,15,0,0,139],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":36,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11}}'),
(0, 'steam:11000013db45b7f', 'barbie', '{\"drawable\":[0,3,4,14,0,1,0,3,0,0,13],\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,8,0,0,0,0,0,0,11],\"prop\":{\"1\":2,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":7}'),
(0, 'steam:11000011b2630e9', '', '{\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[51,73,8,42,0,6,0,15,0,0,84],\"haircolor\":0,\"prop\":{\"1\":6,\"2\":8,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":54},\"texture\":[5,0,0,6,0,0,0,0,0,0,4],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013330bf2a', 'OP', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":26},\"haircolor\":0,\"texture\":[2,0,0,0,0,0,2,3,0,0,0],\"drawable\":[72,1,17,31,45,25,112,131,0,0,50],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:110000141cb7b9c', 'Tenue Montana patron', '{\"texture\":[0,0,0,5,0,5,2,0,0,0,3],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"drawable\":[35,21,17,24,0,3,11,4,0,0,23],\"haircolor\":2,\"prop\":{\"1\":10,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001090d937b', 'Trankillous', '{\"drawable\":[51,0,81,24,44,10,11,4,0,0,60],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[1,0,0,0,0,0,2,0,0,0,2],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"prop\":{\"1\":0,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":61}}'),
(0, 'steam:1100001090d937b', 'Barrow', '{\"haircolor\":0,\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"texture\":[15,0,0,5,0,0,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[111,0,81,24,44,10,0,6,0,0,11]}'),
(0, 'steam:11000013c35674e', 'mécano', '{\"prop\":{\"1\":5,\"2\":3,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":56},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[36,15,0,4,44,1,0,15,0,0,1],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"haircolor\":4,\"texture\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000011811d317', 'Garde du corps', '{\"haircolor\":29,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,1,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"prop\":{\"1\":7,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"drawable\":[0,14,14,10,45,30,18,10,0,0,28]}'),
(0, 'steam:11000013ec78cfc', 'zzz', '{\"haircolor\":5,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,16,2,8,40,1,0,0,0,0,7],\"texture\":[0,0,0,0,0,0,0,0,0,0,2]}'),
(0, 'steam:11000011811d317', 'Mafia Civil', '{\"drawable\":[0,14,77,24,0,20,0,22,0,0,25],\"prop\":{\"1\":5,\"2\":3,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"haircolor\":29,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"texture\":[0,0,0,5,0,3,0,4,0,0,7]}'),
(0, 'steam:1100001415a0086', 'Tenue 1', '{\"drawable\":[51,39,18,1,40,57,0,0,0,0,4],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"haircolor\":3,\"prop\":{\"1\":4,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":56},\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013c1d02bc', 'Clasic', '{\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":1,\"drawable\":[0,11,0,24,0,12,0,107,0,0,60],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":5,\"2\":31,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:1100001186de5c5', 'Cuir', '{\"haircolor\":0,\"prop\":{\"1\":8,\"2\":23,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":58},\"texture\":[0,0,0,0,0,6,0,2,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":6,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"drawable\":[0,24,20,4,0,12,0,10,0,0,62]}'),
(0, 'steam:11000013ce979bb', 'blanc', '{\"texture\":[0,0,0,8,0,1,0,0,0,0,0],\"haircolor\":55,\"drawable\":[0,52,63,14,44,10,0,60,0,0,74],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:1100001090d937b', 'Colle rouler', '{\"drawable\":[0,21,4,4,0,26,0,15,0,0,139],\"texture\":[0,0,0,0,0,1,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":8},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:1100001352d313a', 'yiddish villa sans ', '{\"texture\":[0,0,0,5,0,3,0,4,0,0,3],\"drawable\":[51,21,39,24,20,20,36,22,0,0,120],\"haircolor\":29,\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"prop\":{\"1\":5,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":64},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001352d313a', 'yiddish', '{\"texture\":[0,0,0,5,0,3,0,4,0,0,3],\"drawable\":[51,21,39,24,44,20,36,22,0,0,120],\"haircolor\":29,\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"prop\":{\"1\":5,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":64},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001352d313a', 'op ', '{\"texture\":[0,0,0,6,0,0,0,0,0,0,0],\"drawable\":[46,21,39,59,44,25,1,15,0,0,53],\"haircolor\":29,\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"prop\":{\"1\":24,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":28},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001352d313a', 'brinks', '{\"texture\":[0,0,0,1,0,5,0,1,0,0,9],\"drawable\":[51,21,39,24,44,3,36,35,0,0,108],\"haircolor\":29,\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"prop\":{\"1\":4,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001352d313a', 'yiddish noir', '{\"texture\":[0,0,0,0,0,0,0,0,0,0,1],\"drawable\":[51,21,39,24,44,10,8,22,0,0,11],\"haircolor\":29,\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"prop\":{\"1\":4,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":28},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:1100001352d313a', 'parrain', '{\"texture\":[0,0,0,2,0,11,0,0,0,0,0],\"drawable\":[51,21,39,24,44,20,8,21,0,0,106],\"haircolor\":29,\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"prop\":{\"1\":4,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":26},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000135c91d3a', 'tenue civil 1', '{\"palette\":[0,0,0,0,0,0,1,0,0,2,0],\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":51},\"haircolor\":29,\"drawable\":[51,32,17,24,44,1,0,15,0,0,139],\"texture\":[1,0,0,0,0,0,0,0,0,0,3]}'),
(0, 'steam:11000013ec49c63', 'Yiddish', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[101,15,31,24,0,10,0,21,0,0,106],\"haircolor\":2,\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":26},\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"texture\":[0,0,0,2,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013ec49c63', 'Yiddish OP', '{\"prop\":{\"1\":24,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":28},\"texture\":[0,0,0,1,1,0,0,1,0,0,1],\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"drawable\":[35,15,31,40,23,25,0,61,0,0,67],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":2}'),
(0, 'steam:110000141227fb1', 'Tenue Civil', '{\"prop\":{\"1\":5,\"2\":6,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":58},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"haircolor\":15,\"texture\":[7,0,0,0,0,2,0,0,0,0,3],\"palette\":[0,0,0,0,0,0,1,0,0,2,0],\"drawable\":[51,24,17,24,45,8,0,15,0,0,139]}'),
(0, 'steam:1100001364344d6', 'Tenu Villa Camorra', '{\"texture\":[0,0,0,1,0,4,0,4,0,0,1],\"haircolor\":29,\"prop\":{\"1\":3,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,2,0],\"drawable\":[51,73,20,28,20,3,0,22,0,0,11]}'),
(0, 'steam:11000013d3ee7d0', 'Camorra Villa ', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[1,0,0,0,0,4,0,4,0,0,1],\"prop\":{\"1\":5,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"haircolor\":2,\"drawable\":[51,21,20,28,0,3,0,22,0,0,11]}'),
(0, 'steam:11000013d3ee7d0', 'OP Camorra ', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,11,0,0,0,0,0,3],\"prop\":{\"1\":0,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":39},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"haircolor\":2,\"drawable\":[46,21,17,59,23,24,0,15,0,0,139]}'),
(0, 'steam:11000013226b3d5', 'Ballas', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":31,\"drawable\":[51,50,17,42,44,6,0,76,0,0,7],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11},\"texture\":[6,0,0,2,0,1,0,0,0,0,9],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:11000013d3ee7d0', 'Civil italien ', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[1,0,0,2,14,0,0,1,0,0,0],\"prop\":{\"1\":0,\"2\":33,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"haircolor\":2,\"drawable\":[51,21,19,24,22,10,0,16,0,0,132]}'),
(0, 'steam:11000013226b3d5', 'ballas 2', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":31,\"drawable\":[51,50,17,5,44,6,0,76,0,0,7],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11},\"texture\":[6,0,0,9,0,1,0,0,0,0,9],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:11000011bcfbf5b', 'Camorra Villa', '{\"drawable\":[51,9,31,28,23,3,0,22,0,0,11],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"texture\":[0,0,1,1,9,4,0,4,0,0,1],\"prop\":{\"1\":3,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"haircolor\":29}'),
(0, 'steam:1100001364344d6', 'Tenu Opération', '{\"texture\":[0,0,0,1,11,0,0,0,0,0,3],\"haircolor\":29,\"prop\":{\"1\":0,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":39},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,2,0],\"drawable\":[46,73,22,52,23,25,0,15,0,0,139]}'),
(0, 'steam:11000011bcfbf5b', 'Camorra OP', '{\"drawable\":[46,9,38,52,23,25,0,15,0,0,139],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"texture\":[0,0,0,1,11,0,0,0,0,0,3],\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":39},\"haircolor\":29}'),
(0, 'steam:11000011bcfbf5b', 'Civil', '{\"drawable\":[51,9,38,24,23,10,0,22,0,0,11],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[0,0,0,1,11,0,0,0,0,0,0],\"prop\":{\"1\":3,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":12},\"haircolor\":29}'),
(0, 'steam:1100001364344d6', 'Tenu Villa Camorra 2', '{\"texture\":[0,0,0,1,0,4,0,4,0,0,1],\"haircolor\":29,\"prop\":{\"1\":3,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,2,0],\"drawable\":[51,73,22,28,0,3,0,22,0,0,11]}'),
(0, 'steam:11000013c35674e', 'chill', '{\"texture\":[0,0,0,0,0,0,0,1,0,0,3],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":3,\"drawable\":[0,15,4,24,0,10,0,16,0,0,139],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:11000013edea77a', 'Ydish 1', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":8,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,21,22,24,0,10,0,21,0,0,23],\"texture\":[0,0,0,5,0,0,0,2,0,0,3],\"haircolor\":2}'),
(0, 'steam:1100001364344d6', 'Tenu Villa 3', '{\"texture\":[0,0,0,1,0,4,0,2,0,0,1],\"haircolor\":29,\"prop\":{\"1\":3,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,2,0],\"drawable\":[51,73,22,28,0,3,0,22,0,0,11]}'),
(0, 'steam:11000011923f20b', '[CAMORRA] Villa', '{\"drawable\":[51,15,20,28,44,3,0,22,0,0,11],\"haircolor\":0,\"proptexture\":{\"1\":9,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,1,0,4,0,4,0,0,1],\"prop\":{\"1\":17,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7}}'),
(0, 'steam:11000014133e199', '[CAMORRA]Brazo', '{\"texture\":[0,0,0,15,11,4,0,3,0,0,1],\"haircolor\":0,\"drawable\":[51,0,33,28,23,3,0,22,0,0,11],\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"prop\":{\"1\":4,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000011923f20b', '[CAMORRA] Opé 1', '{\"drawable\":[46,15,22,52,23,25,0,15,0,0,139],\"haircolor\":0,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,1,11,0,0,0,0,0,3],\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":39}}'),
(0, 'steam:11000014133e199', '[CAMORRA]OP', '{\"texture\":[0,0,0,1,11,0,0,0,0,0,3],\"haircolor\":0,\"drawable\":[46,0,33,52,23,25,0,15,0,0,139],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":39},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013fc419f2', 'Civil', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,3,1,13,21,1,22,0,0,0,4],\"haircolor\":2}'),
(0, 'steam:11000013f2dca15', 'tenue', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,15,17,37,0,1,1,127,0,0,53],\"haircolor\":36,\"prop\":{\"1\":24,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11},\"proptexture\":{\"1\":2,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:110000135760edf', 'Ballas maillot', '{\"prop\":{\"1\":6,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":11,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,24,3,42,0,6,0,15,0,0,128],\"texture\":[0,0,0,2,0,1,0,0,0,0,2],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1}}'),
(0, 'steam:110000114d95b71', 'BG', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[111,73,20,24,40,30,0,16,0,0,3],\"haircolor\":0,\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":22},\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"texture\":[15,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000135760edf', 'Ballas baggy', '{\"prop\":{\"1\":0,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"haircolor\":11,\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,24,0,5,0,6,0,15,0,0,208],\"texture\":[0,0,0,9,0,1,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5}}'),
(0, 'steam:110000114d95b71', 'villa', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":4,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":20},\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":104},\"texture\":[15,0,0,0,0,4,0,0,0,0,0],\"haircolor\":0,\"drawable\":[111,73,21,79,40,57,0,16,0,0,205]}'),
(0, 'steam:110000113f1c845', 'ballas', '{\"haircolor\":0,\"drawable\":[51,25,2,42,0,6,0,0,0,0,127],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"texture\":[6,0,0,0,0,0,0,0,0,0,3]}'),
(0, 'steam:11000013f42ff6a', 'camora', '{\"haircolor\":55,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":9},\"drawable\":[51,55,33,24,45,21,1,22,0,0,11],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,0,0,0,0,0,0,0,1],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":61}}'),
(0, 'steam:110000104b6b873', 'Tenu  villa camorra', '{\"drawable\":[51,0,20,28,23,3,0,22,0,0,11],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":-1,\"texture\":[0,0,0,1,11,4,0,4,0,0,1],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7}}'),
(0, 'steam:110000104b6b873', 'Tenu op camorra', '{\"drawable\":[46,0,22,52,23,25,0,15,0,0,139],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":-1,\"texture\":[0,0,0,1,11,0,0,0,0,0,3],\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":39}}'),
(0, 'steam:110000135760edf', 'Ballas short maillot', '{\"drawable\":[0,24,1,42,0,6,0,15,0,0,84],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":11,\"prop\":{\"1\":15,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[0,0,0,2,0,1,0,0,0,0,5]}'),
(0, 'steam:110000135760edf', 'Ballas Air force', '{\"drawable\":[0,24,0,5,0,7,49,15,0,0,82],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":11,\"prop\":{\"1\":0,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[0,0,0,0,0,4,0,0,0,0,14]}'),
(0, 'steam:11000013fdd4f30', 'normal', '{\"palette\":[0,0,2,2,2,2,2,2,0,0,2],\"haircolor\":0,\"texture\":[5,0,0,0,0,2,0,0,0,0,9],\"prop\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"drawable\":[99,12,6,78,20,31,4,15,0,0,257],\"proptexture\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":6}}'),
(0, 'steam:11000013f65fdbe', 'ESPACE', '{\"proptexture\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":6},\"texture\":[0,0,0,0,0,2,0,0,0,0,9],\"prop\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"drawable\":[0,9,6,78,20,31,4,15,0,0,257],\"haircolor\":0,\"palette\":[0,0,2,2,2,2,2,2,0,0,2]}'),
(0, 'steam:110000135760edf', 'Ballas casque musiqu', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,24,1,42,0,6,0,15,0,0,84],\"haircolor\":11,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"texture\":[6,0,0,0,0,1,0,0,0,0,2],\"prop\":{\"1\":0,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":15}}'),
(0, 'steam:11000011ac33eea', 'Ballas', '{\"drawable\":[111,14,15,3,44,9,0,15,0,0,15],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":29,\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"texture\":[2,0,0,9,0,11,0,0,0,0,0],\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11}}'),
(0, 'steam:110000132d72d2e', 'braco', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"texture\":[2,0,2,0,9,15,0,10,0,0,5],\"haircolor\":14,\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"drawable\":[94,73,17,59,23,7,0,131,0,0,139]}'),
(0, 'steam:11000010a87d9bb', 'Braquage', '{\"haircolor\":18,\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"drawable\":[94,30,33,59,23,7,0,131,0,0,139],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[3,0,0,0,9,3,0,10,0,0,3]}'),
(0, 'steam:110000116f5f441', 'braquo', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0,\"drawable\":[94,72,27,59,23,7,0,131,0,0,139],\"prop\":{\"1\":8,\"2\":26,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"proptexture\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"texture\":[0,0,1,0,9,12,0,10,0,0,1]}'),
(0, 'steam:110000106853e63', 'parrain camorra vill', '{\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":28,\"texture\":[0,0,0,0,0,1,0,2,0,0,1],\"drawable\":[51,31,20,28,20,3,0,22,0,0,11],\"prop\":{\"1\":3,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":7},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2}}'),
(0, 'steam:11000013f1e4076', 'Los VAGOS', '{\"proptexture\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,8,0,6,0,0,0,0,0],\"prop\":{\"1\":-1,\"2\":-1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[0,8,15,5,44,6,0,15,0,0,15],\"haircolor\":13,\"palette\":[0,0,0,0,0,0,0,0,2,0,0]}'),
(0, 'steam:110000136c0c4ec', 'ballas 1', '{\"prop\":{\"1\":0,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"haircolor\":32,\"drawable\":[51,8,15,42,0,6,0,15,0,0,5],\"texture\":[6,0,0,0,0,1,0,0,0,0,6],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5}}'),
(0, 'steam:110000136c0c4ec', 'ballas2', '{\"prop\":{\"1\":0,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"haircolor\":32,\"drawable\":[51,8,15,42,0,57,0,15,0,0,15],\"texture\":[6,0,0,0,0,2,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5}}'),
(0, 'steam:110000113f1c845', 'TENUE BALLAS', '{\"drawable\":[51,25,15,42,0,6,0,15,0,0,127],\"texture\":[6,0,0,0,0,0,0,0,0,0,3],\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":5},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"haircolor\":0}'),
(0, 'steam:11000010a51093f', 'Vagos gng', '{\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"drawable\":[111,9,15,42,44,6,0,15,0,0,15],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"haircolor\":29,\"texture\":[1,0,0,5,0,0,0,0,0,0,0],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013c690a33', 'OKLM', '{\"haircolor\":1,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,59,11,42,23,8,0,15,0,0,126],\"texture\":[0,0,0,0,1,0,0,0,0,0,11],\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":56}}'),
(0, 'steam:1100001186cdb42', 'Armas', '{\"drawable\":[111,7,22,9,23,24,1,15,0,0,50],\"texture\":[15,0,0,7,9,0,0,0,0,0,0],\"haircolor\":3,\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":28},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2}}'),
(0, 'steam:110000131d17b17', 'iNVESTIGATION', '{\"texture\":[0,0,0,1,0,0,0,0,0,0,3],\"drawable\":[35,73,17,52,44,25,0,15,0,0,139],\"palette\":[0,0,0,0,0,0,1,0,0,2,0],\"haircolor\":14,\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"prop\":{\"1\":17,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":58}}'),
(0, 'steam:11000011923f20b', 'Civil z', '{\"prop\":{\"1\":17,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":66},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[0,0,0,1,0,4,0,0,0,0,2],\"haircolor\":59,\"drawable\":[51,9,0,28,0,3,0,15,0,0,73],\"proptexture\":{\"1\":9,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0}}'),
(0, 'steam:110000135760edf', 'op ballas gaaang', '{\"haircolor\":11,\"prop\":{\"1\":25,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":14},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[51,24,1,1,0,8,0,0,0,0,7],\"proptexture\":{\"1\":3,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"texture\":[6,0,0,0,0,0,0,2,0,0,9]}'),
(0, 'steam:110000135760edf', 'polo short baggy', '{\"haircolor\":11,\"prop\":{\"1\":15,\"2\":9,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":54},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,24,0,42,0,6,0,15,0,0,82],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1},\"texture\":[6,0,0,0,0,1,0,0,0,0,14]}'),
(0, 'steam:110000141227fb1', 'Tenue DEA', '{\"prop\":{\"1\":0,\"2\":6,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":58},\"haircolor\":15,\"texture\":[0,0,0,1,0,0,0,0,0,0,2],\"palette\":[0,0,0,0,0,0,1,0,0,2,0],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"drawable\":[130,24,17,52,45,24,0,15,0,0,219]}'),
(0, 'steam:110000136c0c4ec', 'op', '{\"haircolor\":32,\"texture\":[2,0,4,0,0,0,0,0,0,0,2],\"drawable\":[111,8,17,33,40,24,0,15,0,0,49],\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"prop\":{\"1\":5,\"2\":4,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":11}}'),
(0, 'steam:110000131d17b17', 'DEA', '{\"texture\":[0,0,0,1,0,0,0,0,0,0,2],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":0,\"7\":-1,\"0\":2},\"prop\":{\"1\":0,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":3,\"7\":-1,\"0\":58},\"haircolor\":14,\"palette\":[0,0,0,0,0,0,1,0,0,2,0],\"drawable\":[130,73,17,52,44,25,0,15,0,0,49]}'),
(0, 'steam:11000013ec49c63', 'Lourd', '{\"drawable\":[0,15,131,31,40,25,8,15,7,0,50],\"texture\":[0,0,0,0,0,0,0,0,0,0,4],\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":124},\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":3},\"palette\":[0,0,0,0,0,0,0,0,2,0,0],\"haircolor\":2}'),
(0, 'steam:1100001167961a1', '1', '{\"haircolor\":9,\"drawable\":[0,9,2,5,40,1,0,0,0,0,7],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"prop\":{\"1\":6,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":-1},\"texture\":[0,0,0,2,0,0,0,0,0,0,2],\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013978037e', ' Braquage', '{\"prop\":{\"1\":6,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":117},\"haircolor\":0,\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[28,3,114,33,23,32,21,0,0,0,81],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013978037e', 'sport', '{\"prop\":{\"1\":7,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":4},\"haircolor\":0,\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,3,0,43,23,32,21,0,0,0,3],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:11000013978037e', 'flic', '{\"prop\":{\"1\":7,\"2\":2,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":43},\"haircolor\":0,\"texture\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[0,3,0,81,21,32,0,27,0,0,48],\"proptexture\":{\"1\":0,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":0},\"palette\":[0,0,0,0,0,0,0,0,0,0,0]}'),
(0, 'steam:110000131ff48a7', 'Bg', '{\"prop\":{\"1\":5,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"texture\":[7,0,0,1,0,3,0,0,0,0,3],\"drawable\":[51,73,17,78,0,7,0,16,0,0,139],\"haircolor\":29,\"proptexture\":{\"1\":1,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":1}}'),
(0, 'steam:110000131d17b17', 'vagos', '{\"haircolor\":14,\"texture\":[0,0,0,5,0,3,0,0,0,0,0],\"proptexture\":{\"1\":5,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":0,\"7\":-1,\"0\":2},\"prop\":{\"1\":17,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":3,\"7\":-1,\"0\":58},\"drawable\":[51,73,15,42,44,31,0,15,0,0,15],\"palette\":[0,0,0,0,0,0,1,0,0,2,0]}'),
(0, 'steam:11000011923f20b', 'lspd ls scorpio', '{\"haircolor\":0,\"prop\":{\"1\":17,\"2\":1,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":39},\"texture\":[5,0,0,0,0,0,0,0,0,0,2],\"proptexture\":{\"1\":9,\"2\":0,\"3\":-1,\"4\":-1,\"5\":-1,\"6\":-1,\"7\":-1,\"0\":2},\"palette\":[0,0,0,0,0,0,0,0,0,0,0],\"drawable\":[104,15,17,33,0,25,0,131,0,0,219]}');

-- --------------------------------------------------------

--
-- Structure de la table `police`
--

CREATE TABLE `police` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `police`
--

INSERT INTO `police` (`identifier`, `rank`) VALUES
('steam:110000101374144', 'Recrue'),
('steam:1100001045198f1', 'Recrue'),
('steam:1100001053bda55', 'Recrue'),
('steam:1100001079724cf', 'Recrue'),
('steam:110000107c2e27d', 'Recrue'),
('steam:110000107cb74f0', 'Recrue'),
('steam:1100001090d937b', 'Recrue'),
('steam:11000010af219c5', 'Recrue'),
('steam:11000010c2b6ae3', 'Recrue'),
('steam:11000010c5246df', 'Recrue'),
('steam:11000010e0e49d2', 'Recrue'),
('steam:11000010e7c4830', 'Recrue'),
('steam:11000011125db40', 'Recrue'),
('steam:1100001118220b9', 'Recrue'),
('steam:11000011262d25d', 'Recrue'),
('steam:110000112f18b67', 'Recrue'),
('steam:1100001134d7608', 'Recrue'),
('steam:11000011422e0e6', 'Recrue'),
('steam:11000011498655c', 'Recrue'),
('steam:11000011565324d', 'Recrue'),
('steam:110000116d213c4', 'Recrue'),
('steam:11000011771be11', 'Recrue'),
('steam:1100001177d11b3', 'Recrue'),
('steam:11000011923f20b', 'Recrue'),
('steam:11000011a9bc697', 'Recrue'),
('steam:11000011b1bb7e2', 'Recrue'),
('steam:11000011b6a33de', 'Recrue'),
('steam:11000011b88187e', 'Recrue'),
('steam:11000011c10dece', 'Recrue'),
('steam:110000131d17b17', 'Recrue'),
('steam:1100001352d313a', 'Recrue'),
('steam:110000135c91d3a', 'Recrue'),
('steam:1100001362ee9bb', 'Recrue'),
('steam:1100001364344d6', 'Recrue'),
('steam:110000136839072', 'Recrue'),
('steam:110000136bf4bfd', 'Recrue'),
('steam:110000136df75b4', 'Recrue'),
('steam:1100001384b18f6', 'Recrue'),
('steam:1100001387a274b', 'Recrue'),
('steam:110000139cd39f0', 'Recrue'),
('steam:110000139e78eb8', 'Recrue'),
('steam:11000013c35674e', 'Recrue'),
('steam:11000013d8b543c', 'Recrue'),
('steam:11000013db45b7f', 'Recrue'),
('steam:11000013e598f20', 'Recrue'),
('steam:11000013ec7c5e0', 'Recrue'),
('steam:11000013f1e4076', 'Recrue'),
('steam:11000013f3f016c', 'Recrue'),
('steam:11000013f866245', 'Recrue'),
('steam:11000013fc419f2', 'Recrue'),
('steam:110000140693fa8', 'Recrue'),
('steam:110000141227fb1', 'Recrue');

-- --------------------------------------------------------

--
-- Structure de la table `recolt`
--

CREATE TABLE `recolt` (
  `ID` int(11) UNSIGNED NOT NULL,
  `raw_id` int(11) UNSIGNED DEFAULT NULL,
  `treated_id` int(11) UNSIGNED DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `treatment_id` int(10) UNSIGNED DEFAULT NULL,
  `seller_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `recolt`
--

INSERT INTO `recolt` (`ID`, `raw_id`, `treated_id`, `job_id`, `price`, `field_id`, `treatment_id`, `seller_id`) VALUES
(1, 11, 12, NULL, 75, 1, 2, 3),
(2, 36, 4, NULL, 60, 4, 5, 6),
(3, 13, 14, NULL, 50, 7, 8, 9),
(4, 33, 37, NULL, 95, 10, 11, 12);

-- --------------------------------------------------------

--
-- Structure de la table `skin`
--

CREATE TABLE `skin` (
  `identifier` varchar(120) NOT NULL,
  `model` varchar(50) NOT NULL DEFAULT '0',
  `face` varchar(900) NOT NULL DEFAULT 'NOT',
  `head` int(11) NOT NULL DEFAULT 0,
  `body_color` int(11) NOT NULL DEFAULT 0,
  `hair` int(11) NOT NULL DEFAULT 0,
  `hair_color` int(11) NOT NULL DEFAULT 0,
  `beard` int(11) NOT NULL DEFAULT 0,
  `beard_color` int(11) NOT NULL DEFAULT 0,
  `eyebrows` int(11) NOT NULL DEFAULT 0,
  `eyebrows_color` int(11) NOT NULL DEFAULT 0,
  `percing` int(11) DEFAULT 0,
  `percing_txt` int(11) DEFAULT 0,
  `makeup` int(11) DEFAULT 0,
  `makeup_opacity` int(11) DEFAULT 0,
  `lipstick` int(11) DEFAULT 0,
  `lipstick_color` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `skin`
--

INSERT INTO `skin` (`identifier`, `model`, `face`, `head`, `body_color`, `hair`, `hair_color`, `beard`, `beard_color`, `eyebrows`, `eyebrows_color`, `percing`, `percing_txt`, `makeup`, `makeup_opacity`, `lipstick`, `lipstick_color`) VALUES
('steam:1100001045198f1', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 42, 32, 17, 30, 21, 15, 27, 19, 0, 0, 0, 0, 0, 0),
('steam:110000104618b07', 'mp_m_freemode_01', '[-0.25,-0.1,-0.25,0.6,-0.25,1.3877787807814e-17,0.05,0,1.1,0.35,0.9,-1.0,0.2,-0.7,0.7,0.9,0.95,0.15,-2.0,0.05]', 8, 21, 21, 1, 10, 1, 19, 0, 0, 0, 0, 0, 0, 0),
('steam:110000105f0e48f', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 24, 14, 0, 10, 0, 12, 0, 0, 0, 0, 0, 0, 0),
('steam:110000106853e63', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 31, 28, 11, 0, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:110000107d07375', 'mp_m_freemode_01', 'NOT', 19, 22, 39, 29, 11, 0, 0, 1, 0, 0, 0, 0, 0, 0),
('steam:110000108ae2aa1', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 43, 21, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001090d937b', 'mp_m_freemode_01', '[0.2,0.5,0.15,0.35,0,0,0,0,1.1,-0.3,0,0,0,0.65,-0.1,0.85,-0.2,0,0,-0.5]', 44, 38, 21, 0, 10, 0, 2, 0, 0, 0, 0, 0, 0, 0),
('steam:11000010a30103b', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 15, 24, 2, 3, 3, 4, 5, 2, 0, 0, 0, 0, 0, 0),
('steam:11000010a51093f', 'mp_m_freemode_01', '[0.25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 26, 9, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000010a87d9bb', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 44, 25, 30, 18, 9, 18, 29, 0, 0, 0, 48, 10, 0, 0),
('steam:11000010a96d707', 'mp_f_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 25, 25, 53, 57, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:11000010aac08fe', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 36, 9, 58, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0),
('steam:11000010b47879f', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 19, 37, 9, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000010b592ab0', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0,0]', 0, 25, 19, 0, 18, 0, 2, 0, 0, 0, 0, 0, 0, 0),
('steam:11000010b939cdf', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000010bb1f783', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 19, 25, 12, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000010ef0f965', 'mp_m_freemode_01', '[0.75,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 14, 31, 5, 4, 4, 4, 13, 10, 0, 0, 0, 0, 0, 0),
('steam:1100001118220b9', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 26, 12, 60, 7, 0, 2, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001120b6603', 'mp_m_freemode_01', '[2.35,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 18, 27, 9, 3, 7, 0, 5, 4, 0, 0, 0, 0, 0, 0),
('steam:110000112b30c86', 'mp_m_freemode_01', '[0.45,-0.35,0,0,0,0,0.05,2.0,-7.632783294298e-16,0.55,-0.85,-0.9,1.0,2.2898349882894e-15,0.35,0,0,0,0.3,-1.5]', 0, 24, 65, 3, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001132881a8', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 2, 0, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0),
('steam:110000113f1c845', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 24, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000113f639ab', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 2, 23, 1, 28, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001148b6a2e', 'mp_m_freemode_01', '[-1.0,0.2,-0.35,0.35,0.05,-0.35,1.2,-0.2,-1.05,-0.7,-1.5,0.95,-1.0,-2.0,-1.5,-1.5,-1.0,-0.2,-1.9,-1.5]', 7, 23, 50, 61, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000114d95b71', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 32, 73, 0, 14, 0, 10, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011565324d', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,3.0,1.5,1.0,3.0,1.5,2.0,2.0,1.5,2.5,-1.5]', 0, 25, 12, 0, 10, 1, 1, 3, 0, 0, 0, 0, 0, 0),
('steam:110000115bf3b15', 'mp_m_freemode_01', '[-0.75,-1.3877787807814e-17,0.15,-0.9,0,0,0,0,0,0,-1.5,-0.2,-0.25,0,0,-0.55,0,0,0,0]', 14, 24, 30, 15, 14, 0, 14, 0, 0, 0, 0, 0, 0, 0),
('steam:110000115c12f6f', 'mp_m_freemode_01', '[-1.0,0.15,1.0,-0.2,-0.2,0.05,0.1,0.35,-0.3,0.35,-1.3877787807814e-17,1.1,0.05,-1.7,-0.7,-0.65,0.2,-0.05,-0.7,-1.5]', 12, 25, 14, 0, 3, 0, 9, 3, 0, 0, 0, 0, 0, 0),
('steam:11000011610cf64', 'mp_f_freemode_01', '[3.0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 24, 24, 35, 0, 0, 0, 4, 12, 0, 0, 0, 0, 0, 0),
('steam:1100001167961a1', 'mp_m_freemode_01', '[0,0,0.6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 12, 31, 9, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000116a11626', 'mp_m_freemode_01', '[0.75,1.3877787807814e-17,0.85,0.15,0.2,0.4,0.1,0.65,0,-0.1,0.2,0,0,0,0,0,0,0,0,0]', 4, 26, 21, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000116f5f441', 'mp_m_freemode_01', '[0,0.049999999999998,1.0,0.35,0,-0.5,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.2]', 44, 37, 72, 0, 26, 0, 0, 0, 0, 0, 51, 10, 0, 0),
('steam:11000011738a10a', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 12, 21, 45, 3, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001174e0527', 'mp_m_freemode_01', '[-1.0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 50, 0, 0, 0, 12, 3, 0, 0, 0, 0, 0, 0),
('steam:1100001177d11b3', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 1, 24, 36, 56, 1, 46, 1, 55, 0, 0, 0, 0, 0, 0),
('steam:11000011811d317', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.25,-0.35,-1.0,1.5,-1.2,0.55]', 12, 24, 14, 29, 5, 29, 29, 29, 0, 0, 0, 0, 0, 0),
('steam:1100001186cdb42', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 44, 37, 7, 3, 3, 1, 0, 3, 0, 0, 0, 0, 0, 0),
('steam:1100001186de5c5', 'mp_m_freemode_01', '[-0.05,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 44, 26, 24, 0, 18, 0, 12, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011915371d', 'mp_m_freemode_01', '[0.050000000000002,-0.2,1.0,0.45,-0.45,0.2,-0.1,0,0,0,-1.5,0.2,-0.1,-0.95,0,0,0,0,0,-0.55]', 0, 25, 1, 0, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011923f20b', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 29, 73, 0, 10, 0, 0, 0, 0, 0, 41, 10, 0, 0),
('steam:110000119438485', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 2, 24, 14, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001194c6243', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 44, 25, 15, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011a1a1fe7', 'mp_m_freemode_01', '[0,0,0.6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 29, 11, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011a249bac', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011a390327', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 42, 21, 12, 11, 11, 10, 0, 12, 0, 0, 0, 0, 0, 0),
('steam:11000011a773d2c', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011a9bc697', 'mp_m_freemode_01', '[0,0,-0.55,0,0,0,0,0,0,0,0,-0.3,-0.45,0,0,0,0,0,-0.9,-0.75]', 0, 38, 31, 0, 3, 0, 30, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011ac33eea', 'mp_m_freemode_01', '[-0.3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 24, 14, 29, 10, 0, 11, 1, 0, 0, 0, 0, 0, 0),
('steam:11000011ae83d45', 'mp_m_freemode_01', '[-1.0,-1.0,0.5,-0.1,-0.2,-1.5,0.3,0.2,-0.15,0.15,-0.45,0.05,0.2,0.55,-0.05,0,0,0,0,-0.4]', 4, 29, 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011b2630e9', 'mp_m_freemode_01', '[0.7,0,0.85,0,0.1,-0.3,1.4,-1.0,0.5,-0.6,-1.5,-1.0,1.0,0,0,0,-0.25,0,0,1.35]', 10, 24, 73, 0, 12, 2, 3, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011b6a33de', 'mp_m_freemode_01', '[0.9,0.45,-0.1,8.4654505627668e-16,-0.3,-0.4,0,0,0,0,0,0,0,0,0,0,0,0,-0.2,-0.75]', 44, 31, 7, 1, 10, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:11000011bcfbf5b', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 26, 9, 29, 3, 60, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:11000011cd5a9d8', 'mp_m_freemode_01', '[0,0.1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 1, 23, 3, 2, 2, 2, 3, 3, 0, 0, 0, 0, 0, 0),
('steam:110000131d17b17', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 41, 73, 14, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000131ff48a7', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 73, 29, 16, 0, 0, 57, 0, 0, 0, 0, 0, 0),
('steam:11000013226b3d5', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 24, 50, 31, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000132d72d2e', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 31, 73, 14, 10, 0, 9, 0, 0, 0, 54, 10, 0, 0),
('steam:110000132eb36ef', 'mp_f_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 25, 21, 42, 9, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0),
('steam:11000013330bf2a', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 3, 29, 1, 0, 10, 0, 3, 0, 0, 0, 0, 0, 0, 0),
('steam:110000133d6ee9a', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 2, 5, 5, 20, 8, 7, 0, 0, 0, 0, 0, 0),
('steam:110000134602d80', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 23, 5, 6, 5, 4, 4, 3, 0, 0, 0, 0, 0, 0),
('steam:11000013464b767', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 4, 23, 14, 15, 2, 2, 15, 1, 0, 0, 0, 0, 0, 0),
('steam:1100001352d313a', 'mp_m_freemode_01', '[0.55,0.35,0.05,0.3,-0.05,-0.1,-0.25,-0.55,0.25,0.6,-1.3,-0.35,0.25,0.45,-0.05,0.15,-0.3,0.05,0.05,-0.3]', 0, 31, 21, 29, 10, 0, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:1100001354ea76a', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 8, 29, 4, 3, 3, 2, 0, 5, 0, 0, 0, 0, 0, 0),
('steam:1100001356a85ac', 'mp_m_freemode_01', '[0,0,0.1,0,0,0,0,0,1.5,0,0,0,0,0,0,0,0,0,0,0]', 12, 23, 12, 3, 9, 3, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:110000135760edf', 'mp_m_freemode_01', '[-0.95,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 24, 24, 11, 11, 3, 29, 2, 0, 0, 0, 0, 0, 0),
('steam:110000135aca621', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0.05,0,0,0,0,0,0,0,0,0]', 8, 21, 14, 19, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000135c91d3a', 'mp_m_freemode_01', '[-1.0,-0.45,0.2,-0.15,0.05,0.1,-0.1,-0.3,-0.25,-0.65,0.55,-0.35,0.5,0.5,-0.15,-0.3,-0.1,0.3,-0.2,-0.55]', 2, 32, 32, 29, 14, 0, 22, 56, 0, 0, 0, 0, 0, 0),
('steam:1100001361ac93d', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 45, 21, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013621674d', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 8, 25, 21, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001364344d6', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 73, 29, 12, 0, 29, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013666516d', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 16, 15, 10, 1, 12, 1, 0, 0, 0, 0, 0, 0),
('steam:11000013693c307', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 4, 24, 3, 3, 3, 4, 2, 3, 0, 0, 0, 0, 0, 0),
('steam:110000136c0c4ec', 'mp_m_freemode_01', '[-0.65,-0.2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.75]', 0, 25, 8, 32, 0, 3, 2, 1, 0, 0, 0, 0, 0, 0),
('steam:110000136dbcfea', 'mp_m_freemode_01', '[-0.45,0.15,-0.45,0.5,0.1,-0.1,0.8,2.0,-0.45,-0.45,-1.5,-1.0,-0.05,1.8041124150158e-16,-1.5,0,0.6,0.65,-2.0,-1.5]', 8, 37, 9, 0, 18, 0, 2, 0, 0, 0, 0, 0, 0, 0),
('steam:110000136df75b4', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 26, 73, 16, 7, 0, 10, 3, 0, 0, 0, 0, 0, 0),
('steam:110000136fdf57f', 'mp_m_freemode_01', '[-0.049999999999998,-0.15,0.8,0.35,-3.74700270811e-16,0.3,0.55,3.1918911957974e-16,0.8,-1.0,-1.5,0.05,0.35,0.55,-0.45,0.15,-0.65,-7.632783294298e-16,-0.1,0.55]', 0, 23, 0, 0, 10, 0, 29, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001379249d3', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 24, 14, 29, 3, 10, 0, 3, 0, 0, 0, 0, 0, 0),
('steam:110000137ac7075', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 22, 33, 0, 18, 0, 0, 1, 0, 0, 0, 0, 0, 0),
('steam:1100001384b18f6', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 26, 44, 1, 0, 0, 2, 6, 0, 0, 0, 0, 0, 0),
('steam:1100001387a274b', 'mp_m_freemode_01', '[0.05,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 6, 31, 12, 13, 29, 7, 5, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013978037e', 'mp_f_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 36, 38, 3, 0, 4, 0, 5, 1, 0, 0, 0, 0, 0, 0),
('steam:110000139cd39f0', 'mp_m_freemode_01', '[0,0,0.6,0.5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 29, 73, 29, 0, 2, 2, 3, 0, 0, 0, 0, 0, 0),
('steam:110000139e78eb8', 'mp_f_freemode_01', '[-1.0,-0.1,0.4,0.7,0.25,-0.1,-0.25,-0.45,-1.1,0.1,0.75,-1.0,-0.65,-0.4,0.45,-0.8,-0.05,-0.8,-0.1,-1.5]', 25, 31, 47, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013b7e9092', 'mp_m_freemode_01', '[1.0,1.3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 20, 21, 15, 12, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013b8411e2', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 13, 22, 0, 0, 29, 0, 14, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013bef6a30', 'mp_m_freemode_01', '[0.25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 13, 36, 10, 0, 23, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013c1d02bc', 'mp_m_freemode_01', '[0.7,0.55,-0.85,0.5,0.1,-0.45,1.35,0.1,0.65,-0.5,0.75,-0.15,1.0,-0.5,8.1878948066106e-16,-0.55,1.6,-0.45,0.15,-0.1]', 6, 22, 11, 1, 16, 0, 3, 1, 0, 0, 0, 0, 0, 0),
('steam:11000013c35674e', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 73, 28, 0, 0, 0, 0, 0, 0, 53, 6, 0, 0),
('steam:11000013c690a33', 'mp_m_freemode_01', '[0.55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 23, 59, 1, 10, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:11000013c6d0ffc', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 37, 73, 10, 3, 16, 3, 1, 0, 0, 0, 0, 0, 0),
('steam:11000013cbaae1f', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.4]', 0, 21, 9, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013ce979bb', 'mp_f_freemode_01', '[-0.05,0.4,0.2,0,0.15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 25, 26, 52, 55, 0, 0, 28, 61, 0, 0, 0, 0, 0, 0),
('steam:11000013d33ed0f', 'mp_m_freemode_01', '[3.1918911957974e-16,0.25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 22, 2, 0, 29, 0, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013d3ee7d0', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 41, 21, 2, 8, 0, 3, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013d8b543c', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 4, 25, 57, 9, 10, 0, 0, 3, 0, 0, 0, 0, 0, 0),
('steam:11000013d8cd5c9', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013db45b7f', 'mp_f_freemode_01', '[0.1,0.3,0.25,0.55,0,0,0,0,0,0,0.7,0,-1.0,0.25,0.65,0,0,0,0,0.5]', 21, 25, 10, 3, 0, 0, 1, 1, 0, 0, 0, 10, 2, 20),
('steam:11000013e2304cc', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 26, 4, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013e4fa596', 'mp_m_freemode_01', '[3.0,2.0,1.0,1.0,1.0,-1.5,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 42, 28, 7, 0, 2, 60, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013e9b3c10', 'mp_m_freemode_01', '[-1.0,0.4,1.0,1.0,-0.2,0.35,0,0,0,-0.25,0,0,0,0,0,0,0,0,0,0]', 2, 22, 3, 3, 3, 4, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:11000013eb43335', 'mp_m_freemode_01', '[0,0.25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 22, 11, 4, 7, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:11000013ec49c63', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 15, 2, 7, 0, 2, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013ec78cfc', 'mp_m_freemode_01', '[-0.3,0.2,1.0,1.0,0,0,0,0,0,0,0,0,0,-0.15,-1.5,-1.5,0.65,0.5,0,0]', 0, 22, 16, 5, 7, 17, 0, 25, 0, 0, 0, 0, 0, 0),
('steam:11000013ec7c5e0', 'mp_m_freemode_01', '[-0.2,0.6,0.6,0.6,-0.15,0.2,-0.1,0,-0.2,3.1918911957974e-16,0,-1.0,-0.05,0.050000000000002,0,0,0,0,0,0]', 0, 31, 12, 0, 0, 3, 3, 2, 0, 0, 0, 0, 0, 0),
('steam:11000013edea77a', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 32, 21, 2, 7, 4, 10, 1, 0, 0, 0, 0, 0, 0),
('steam:11000013eec885a', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013ef1eada', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 29, 14, 0, 2, 0, 12, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013f1e4076', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 8, 13, 3, 0, 0, 0, 0, 0, 57, 10, 0, 0),
('steam:11000013f2dca15', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 15, 36, 10, 4, 0, 0, 0, 0, 57, 10, 0, 0),
('steam:11000013f3d457b', 'mp_m_freemode_01', '[-1.0,-0.5,1.0,1.0,-0.1,0,-0.15,0,0,0,0,0,0,0,0,0,0,-1.0,-2.0,0]', 0, 25, 12, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013f42ff6a', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 55, 55, 12, 0, 29, 0, 0, 0, 57, 8, 0, 0),
('steam:11000013f4549ba', 'mp_m_freemode_01', '[3.0,2.0,1.0,-1.5,1.0,1.5,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 15, 28, 7, 5, 7, 5, 5, 3, 0, 0, 0, 0, 0, 0),
('steam:11000013f5ed0f8', 'mp_m_freemode_01', '[0,-0.25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 18, 35, 73, 62, 15, 6, 0, 5, 0, 0, 0, 0, 0, 0),
('steam:11000013f65fdbe', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 31, 9, 0, 16, 0, 0, 1, 0, 0, 0, 0, 0, 0),
('steam:11000013f8236cf', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 26, 21, 1, 10, 3, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013f866245', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 8, 26, 67, 1, 10, 0, 9, 2, 0, 0, 0, 0, 0, 0),
('steam:11000013fb70943', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 29, 50, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013fc419f2', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 3, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013fdd4f30', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 25, 12, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000013ffe09e0', 'mp_m_freemode_01', '[0.1,0,0,0,0,0,0,0,0,0,-0.9,-0.25,0,0,0,0,0,0,0,0]', 0, 26, 3, 36, 7, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:11000014071bb2b', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001407da46d', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 2, 22, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:110000140b2b705', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 29, 3, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000140c3c639', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,-1.5,0,0,0,0,0,0,0,0,0]', 0, 26, 3, 36, 7, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:110000141227fb1', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 24, 24, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:11000014133e199', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 44, 26, 0, 0, 8, 0, 2, 2, 0, 0, 0, 0, 0, 0),
('steam:1100001415a0086', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 44, 22, 39, 3, 10, 0, 4, 2, 0, 0, 0, 0, 0, 0),
('steam:1100001416bc14e', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 21, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000141868ed9', 'mp_m_freemode_01', '[0,0.3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 26, 21, 16, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:1100001419ebe56', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000141afe663', 'mp_m_freemode_01', '[1.3877787807814e-17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:110000141b85899', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 22, 7, 6, 5, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:110000141cb7b9c', 'mp_m_freemode_01', '[-0.35,0.35,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 26, 21, 2, 10, 0, 1, 1, 0, 0, 0, 0, 0, 0),
('steam:110000141d98229', 'mp_m_freemode_01', '[0.3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 31, 3, 0, 7, 0, 10, 1, 0, 0, 0, 0, 0, 0),
('steam:110000141f3cff4', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 1, 1, 2, 3, 0, 1, 0, 0, 0, 0, 0, 0),
('steam:110000141fb5870', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('steam:1100001420219b2', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 1, 22, 3, 3, 3, 2, 2, 2, 0, 0, 0, 0, 0, 0),
('steam:11000014217bfca', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 2, 23, 3, 2, 4, 1, 4, 8, 0, 0, 0, 0, 0, 0),
('steam:11000014230adc0', 'mp_m_freemode_01', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 8, 23, 1, 1, 0, 0, 3, 2, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `twitter_accounts`
--

INSERT INTO `twitter_accounts` (`id`, `username`, `password`, `avatar_url`) VALUES
(0, 'BLACKO', 'blacko', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `group` varchar(50) NOT NULL DEFAULT 'user',
  `permission_level` int(11) NOT NULL DEFAULT 0,
  `money` double NOT NULL DEFAULT 0,
  `bank` int(32) DEFAULT 0,
  `job` int(11) DEFAULT 1,
  `lastPosition` varchar(255) DEFAULT '{-1044.99914550781,-2749.8173828125,21.3634204864502}',
  `personalvehicle` varchar(60) DEFAULT NULL,
  `isFirstConnection` int(11) DEFAULT 1,
  `nom` varchar(128) NOT NULL DEFAULT '',
  `prenom` varchar(128) NOT NULL DEFAULT '',
  `dateNaissance` date DEFAULT '1980-01-01',
  `sexe` varchar(1) NOT NULL DEFAULT 'f',
  `taille` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 200,
  `food` double NOT NULL DEFAULT 100,
  `water` double NOT NULL DEFAULT 100,
  `needs` double NOT NULL DEFAULT 0,
  `dirtymoney` double NOT NULL DEFAULT 0,
  `phone_number` varchar(50) NOT NULL DEFAULT '0',
  `last_seen_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DmvTest` varchar(50) NOT NULL DEFAULT 'Required',
  `license` varchar(50) NOT NULL,
  `gang` int(11) DEFAULT 0,
  `loadout` varchar(8000) DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_appartement`
--

CREATE TABLE `user_appartement` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  `dirtymoney` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_clothes`
--

CREATE TABLE `user_clothes` (
  `identifier` varchar(255) NOT NULL,
  `skin` varchar(255) NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` varchar(255) NOT NULL DEFAULT '0',
  `face_texture` varchar(255) NOT NULL DEFAULT '0',
  `hair` varchar(255) NOT NULL DEFAULT '11',
  `hair_color` varchar(255) NOT NULL DEFAULT '4',
  `shirt` varchar(255) NOT NULL DEFAULT '0',
  `shirt_texture` varchar(255) NOT NULL DEFAULT '0',
  `pants` varchar(255) NOT NULL DEFAULT '8',
  `pants_texture` varchar(255) NOT NULL DEFAULT '0',
  `shoes` varchar(255) NOT NULL DEFAULT '1',
  `shoes_texture` varchar(255) NOT NULL DEFAULT '0',
  `vest` varchar(255) NOT NULL DEFAULT '0',
  `vest_texture` varchar(255) NOT NULL DEFAULT '0',
  `bag` varchar(255) NOT NULL DEFAULT '40',
  `bag_texture` varchar(255) NOT NULL DEFAULT '0',
  `hat` varchar(255) NOT NULL DEFAULT '1',
  `hat_texture` varchar(255) NOT NULL DEFAULT '1',
  `mask` varchar(255) NOT NULL DEFAULT '0',
  `mask_texture` varchar(255) NOT NULL DEFAULT '0',
  `glasses` varchar(255) NOT NULL DEFAULT '6',
  `glasses_texture` varchar(255) NOT NULL DEFAULT '0',
  `gloves` varchar(255) NOT NULL DEFAULT '2',
  `gloves_texture` varchar(255) NOT NULL DEFAULT '0',
  `jacket` varchar(255) NOT NULL DEFAULT '7',
  `jacket_texture` varchar(255) NOT NULL DEFAULT '2',
  `ears` varchar(255) NOT NULL DEFAULT '1',
  `ears_texture` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_clothes`
--

INSERT INTO `user_clothes` (`identifier`, `skin`, `face`, `face_texture`, `hair`, `hair_color`, `shirt`, `shirt_texture`, `pants`, `pants_texture`, `shoes`, `shoes_texture`, `vest`, `vest_texture`, `bag`, `bag_texture`, `hat`, `hat_texture`, `mask`, `mask_texture`, `glasses`, `glasses_texture`, `gloves`, `gloves_texture`, `jacket`, `jacket_texture`, `ears`, `ears_texture`) VALUES
('steam:1100001045198f1', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000104b6b873', 'mp_m_freemode_01', '0', '0', '11', '0', '15', '0', '52', '1', '25', '0', '0', '0', '23', '11', '39', '2', '46', '0', '0', '0', '22', '0', '139', '3', '1', '0'),
('steam:110000105f0e48f', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000106853e63', 'mp_m_freemode_01', '0', '0', '11', '4', '22', '2', '28', '0', '3', '1', '0', '0', '20', '0', '7', '2', '51', '0', '3', '0', '20', '0', '11', '1', '1', '0'),
('steam:11000010a51093f', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '42', '5', '6', '0', '0', '0', '44', '0', '1', '1', '111', '1', '6', '0', '15', '0', '15', '0', '1', '0'),
('steam:11000010a87d9bb', 'mp_m_freemode_01', '0', '0', '11', '10', '131', '10', '59', '0', '7', '3', '0', '0', '23', '9', '3', '0', '94', '3', '0', '0', '33', '0', '139', '3', '1', '0'),
('steam:11000010aac08fe', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000010b47879f', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:1100001118220b9', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '28', '0', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:1100001132881a8', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000113f1c845', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '42', '0', '6', '0', '0', '0', '0', '0', '14', '5', '51', '6', '0', '0', '15', '0', '127', '3', '1', '0'),
('steam:110000113f639ab', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:1100001143de824', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000114d95b71', 'mp_m_freemode_01', '0', '0', '11', '4', '16', '0', '79', '0', '57', '4', '0', '0', '40', '0', '104', '20', '111', '15', '5', '4', '21', '0', '205', '0', '1', '0'),
('steam:11000011565324d', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '79', '0', '57', '4', '0', '0', '23', '9', '104', '20', '111', '15', '5', '0', '2', '0', '205', '0', '10', '0'),
('steam:110000115c12f6f', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:1100001167961a1', 'mp_m_freemode_01', '0', '0', '11', '0', '0', '0', '5', '2', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000116a11626', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000116f5f441', 'mp_m_freemode_01', '0', '0', '11', '10', '131', '10', '59', '0', '7', '12', '0', '0', '23', '9', '3', '3', '94', '0', '8', '5', '27', '1', '139', '1', '26', '1'),
('steam:11000011738a10a', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:1100001177d11b3', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:1100001186cdb42', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '9', '7', '24', '0', '0', '0', '23', '9', '28', '2', '111', '15', '5', '0', '22', '0', '50', '0', '1', '0'),
('steam:11000011923f20b', 'mp_m_freemode_01', '0', '0', '11', '10', '131', '0', '33', '0', '25', '0', '0', '0', '0', '0', '39', '2', '104', '5', '17', '9', '17', '0', '219', '2', '1', '0'),
('steam:11000011a1a1fe7', 'mp_m_freemode_01', '0', '0', '11', '4', '131', '0', '34', '0', '25', '0', '0', '0', '40', '0', '39', '0', '52', '0', '6', '0', '17', '0', '53', '0', '1', '0'),
('steam:11000011a249bac', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000011a773d2c', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000011ac33eea', 'mp_m_freemode_01', '0', '0', '11', '4', '5', '0', '3', '9', '9', '11', '0', '0', '44', '0', '11', '0', '111', '2', '0', '0', '2', '0', '84', '2', '1', '0'),
('steam:11000011bcfbf5b', 'mp_m_freemode_01', '0', '0', '11', '4', '22', '0', '24', '1', '10', '0', '0', '0', '23', '11', '12', '0', '51', '0', '3', '1', '38', '0', '11', '0', '1', '0'),
('steam:11000011cd5a9d8', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000131cc691e', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000131d17b17', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '42', '5', '31', '3', '0', '0', '44', '0', '58', '2', '51', '0', '17', '5', '15', '0', '15', '0', '1', '0'),
('steam:110000131ff48a7', 'mp_m_freemode_01', '0', '0', '11', '4', '16', '0', '78', '1', '7', '3', '0', '0', '0', '0', '2', '1', '51', '7', '5', '1', '17', '0', '139', '3', '1', '0'),
('steam:11000013226b3d5', 'mp_m_freemode_01', '0', '0', '11', '4', '76', '0', '5', '9', '6', '1', '0', '0', '44', '0', '1', '1', '51', '6', '5', '4', '17', '0', '7', '9', '1', '0'),
('steam:110000132d72d2e', 'mp_m_freemode_01', '0', '0', '11', '10', '131', '10', '59', '0', '7', '15', '0', '0', '23', '9', '3', '1', '94', '2', '6', '0', '17', '2', '139', '5', '1', '0'),
('steam:11000013464b767', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000135760edf', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '42', '0', '6', '1', '0', '0', '0', '0', '54', '1', '0', '6', '15', '0', '0', '0', '82', '14', '9', '0'),
('steam:1100001364344d6', 'mp_m_freemode_01', '0', '0', '11', '4', '75', '3', '28', '1', '3', '4', '0', '0', '0', '0', '9', '3', '51', '0', '3', '0', '22', '0', '70', '2', '4', '0'),
('steam:110000136c0c4ec', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '33', '0', '24', '0', '0', '0', '40', '0', '11', '0', '111', '2', '5', '1', '17', '4', '49', '2', '4', '0'),
('steam:110000136dbcfea', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '78', '0', '7', '11', '0', '0', '23', '1', '9', '7', '51', '8', '5', '0', '0', '0', '257', '12', '1', '0'),
('steam:1100001379249d3', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000137ac7075', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000013978037e', 'mp_m_freemode_01', '0', '0', '11', '4', '27', '0', '80', '0', '32', '0', '0', '0', '21', '0', '43', '0', '0', '0', '7', '0', '0', '0', '48', '0', '2', '0'),
('steam:110000139cd39f0', 'mp_m_freemode_01', '0', '0', '11', '4', '16', '0', '78', '1', '57', '4', '0', '0', '40', '0', '9', '6', '20', '0', '5', '1', '0', '0', '271', '3', '2', '0'),
('steam:11000013bef6a30', 'mp_m_freemode_01', '0', '0', '11', '0', '127', '0', '49', '1', '2', '0', '0', '0', '0', '0', '11', '0', '0', '0', '24', '2', '17', '0', '61', '3', '1', '0'),
('steam:11000013c35674e', 'mp_m_freemode_01', '0', '0', '11', '4', '16', '1', '24', '0', '10', '0', '0', '0', '0', '0', '1', '1', '0', '0', '5', '0', '4', '0', '139', '3', '1', '0'),
('steam:11000013c690a33', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '42', '0', '8', '0', '0', '0', '23', '1', '56', '0', '0', '0', '5', '5', '11', '0', '126', '11', '4', '0'),
('steam:11000013c6d0ffc', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000013c9d46a7', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000013cbaae1f', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000013d3ee7d0', 'mp_m_freemode_01', '0', '0', '11', '4', '16', '1', '24', '2', '10', '0', '0', '0', '22', '14', '7', '2', '51', '1', '0', '0', '19', '0', '132', '0', '33', '0'),
('steam:11000013d8b543c', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000013e9b3c10', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000013edea77a', 'mp_m_freemode_01', '0', '0', '11', '4', '21', '2', '24', '5', '10', '0', '0', '0', '0', '0', '1', '1', '0', '0', '8', '1', '22', '0', '23', '3', '1', '0'),
('steam:11000013f2dca15', 'mp_m_freemode_01', '0', '0', '11', '10', '127', '0', '37', '0', '1', '0', '0', '0', '0', '0', '11', '0', '0', '0', '24', '2', '17', '0', '53', '0', '1', '0'),
('steam:11000013f3d457b', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '1', '0', '6', '6', '0', '0', '0', '0', '104', '20', '51', '1', '6', '0', '30', '0', '2', '14', '1', '0'),
('steam:11000013f42ff6a', 'mp_m_freemode_01', '0', '0', '11', '8', '22', '0', '24', '0', '21', '0', '0', '0', '45', '0', '61', '9', '51', '0', '5', '5', '33', '0', '11', '1', '1', '0'),
('steam:11000013f4549ba', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000013f5ed0f8', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000013f866245', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000013fc419f2', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '13', '0', '1', '0', '0', '0', '21', '0', '1', '1', '0', '0', '6', '0', '1', '0', '4', '0', '1', '0'),
('steam:110000141227fb1', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '52', '1', '24', '0', '0', '0', '45', '0', '58', '2', '130', '0', '0', '0', '17', '0', '219', '2', '6', '0'),
('steam:11000014133e199', 'mp_m_freemode_01', '0', '0', '11', '4', '15', '0', '52', '1', '25', '0', '0', '0', '23', '11', '39', '2', '46', '0', '0', '0', '33', '0', '139', '3', '1', '0'),
('steam:110000141f3cff4', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:110000141fb5870', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:1100001420219b2', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000014217bfca', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0'),
('steam:11000014230adc0', 'mp_m_freemode_01', '0', '0', '11', '4', '0', '0', '8', '0', '1', '0', '0', '0', '40', '0', '1', '1', '0', '0', '6', '0', '2', '0', '7', '2', '1', '0');

-- --------------------------------------------------------

--
-- Structure de la table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `item_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_inventory`
--

INSERT INTO `user_inventory` (`user_id`, `item_id`, `quantity`) VALUES
('steam:1100001090d937b', 66, 2),
('steam:11000013330bf2a', 11, 0),
('steam:11000013330bf2a', 36, 0),
('steam:11000013330bf2a', 13, 0),
('steam:11000013330bf2a', 12, 0),
('steam:1100001090d937b', 12, 0),
('steam:1100001361ac93d', 30, 1),
('steam:11000010a96d707', 6, 3),
('steam:110000136fdf57f', 3, 0),
('steam:11000011811d317', 3, 0),
('steam:1100001090d937b', 51, 0),
('steam:11000013330bf2a', 51, 0),
('steam:11000011b6a33de', 51, 1),
('steam:1100001090d937b', 53, 7),
('steam:11000013330bf2a', 53, 0),
('steam:11000011b6a33de', 53, 0),
('steam:1100001090d937b', 55, 0),
('steam:11000011b2630e9', 55, 0),
('steam:11000011b2630e9', 53, 0),
('steam:110000136fdf57f', 16, 54),
('steam:11000011811d317', 16, 0),
('steam:1100001090d937b', 58, 0),
('steam:110000139e78eb8', 55, 0),
('steam:11000011b2630e9', 47, 0),
('steam:11000011811d317', 6, 0),
('steam:11000011811d317', 30, 0),
('steam:11000013330bf2a', 60, 0),
('steam:11000013330bf2a', 66, 0),
('steam:11000013330bf2a', 70, 0),
('steam:11000013330bf2a', 71, 0),
('steam:1100001090d937b', 36, 1),
('steam:1100001090d937b', 70, 1),
('steam:1100001090d937b', 71, 1),
('steam:1100001090d937b', 13, 7),
('steam:1100001090d937b', 60, 1),
('steam:11000013330bf2a', 3, 0),
('steam:11000013330bf2a', 16, 0),
('steam:110000140c3c639', 30, 4),
('steam:110000140c3c639', 6, 4),
('steam:11000013ffe09e0', 30, 4),
('steam:11000011b6a33de', 30, 3),
('steam:11000011a9bc697', 6, 9),
('steam:11000011a9bc697', 30, 5),
('steam:1100001384b18f6', 30, 10),
('steam:1100001384b18f6', 6, 10),
('steam:11000013330bf2a', 30, 0),
('steam:11000013330bf2a', 6, 0),
('steam:11000010a96d707', 30, 2),
('steam:11000011811d317', 21, 0),
('steam:11000011811d317', 22, 0),
('steam:1100001194c6243', 11, 0),
('steam:1100001194c6243', 36, 0),
('steam:110000140c3c639', 21, 47),
('steam:11000013ffe09e0', 21, 22),
('steam:11000013330bf2a', 33, 0),
('steam:11000011811d317', 11, 0),
('steam:1100001090d937b', 33, 0),
('steam:1100001194c6243', 33, 0),
('steam:11000011811d317', 33, 0),
('steam:11000011b6a33de', 6, 0),
('steam:11000013330bf2a', 41, 0),
('steam:11000011b6a33de', 41, 1),
('steam:11000013330bf2a', 50, 0),
('steam:110000104618b07', 50, 2),
('steam:110000104618b07', 51, 3),
('steam:1100001120b6603', 55, 1),
('steam:1100001120b6603', 41, 1),
('steam:1100001120b6603', 51, 1),
('steam:1100001120b6603', 53, 3),
('steam:11000013f8236cf', 41, 1),
('steam:11000013f8236cf', 57, 1),
('steam:11000011b6a33de', 50, 0),
('steam:110000104618b07', 30, 1),
('steam:110000104618b07', 6, 0),
('steam:1100001407da46d', 33, 7),
('steam:110000104618b07', 3, 0),
('steam:110000104618b07', 16, 0),
('steam:110000104618b07', 21, 0),
('steam:110000104618b07', 22, 0),
('steam:1100001387a274b', 6, 9),
('steam:1100001387a274b', 30, 4),
('steam:1100001090d937b', 6, 10),
('steam:11000011ae83d45', 30, 5),
('steam:11000011ae83d45', 6, 5),
('steam:1100001090d937b', 47, 22),
('steam:11000013db45b7f', 33, 0),
('steam:1100001194c6243', 6, 0),
('steam:1100001194c6243', 30, 0),
('steam:11000011b2630e9', 11, 35),
('steam:110000139e78eb8', 11, 1),
('steam:1100001090d937b', 42, 0),
('steam:11000013ec7c5e0', 30, 4),
('steam:11000013ec7c5e0', 6, 4),
('steam:11000011811d317', 60, 1),
('steam:11000011811d317', 66, 1),
('steam:11000011b2630e9', 33, 20),
('steam:1100001090d937b', 11, 0),
('steam:11000011b6a33de', 3, 0),
('steam:11000011b6a33de', 16, 0),
('steam:11000013db45b7f', 55, 0),
('steam:11000013db45b7f', 54, 0),
('steam:11000013db45b7f', 27, 3),
('steam:11000013db45b7f', 53, 2),
('steam:11000011811d317', 27, 1),
('steam:1100001384b18f6', 53, 1),
('steam:11000011811d317', 47, 0),
('steam:1100001415a0086', 30, 1),
('steam:1100001415a0086', 6, 1),
('steam:1100001415a0086', 21, 0),
('steam:1100001415a0086', 22, 0),
('steam:110000141b85899', 6, 0),
('steam:110000141b85899', 30, 2),
('steam:110000141b85899', 3, 0),
('steam:110000141b85899', 16, 0),
('steam:110000141b85899', 47, 1),
('steam:1100001415a0086', 3, 0),
('steam:1100001415a0086', 16, 0),
('steam:1100001415a0086', 11, 43),
('steam:110000112b30c86', 3, 0),
('steam:110000112b30c86', 16, 46),
('steam:11000013330bf2a', 47, 3),
('steam:1100001186de5c5', 30, 4),
('steam:11000013c1d02bc', 30, 1),
('steam:1100001186de5c5', 6, 4),
('steam:11000013c1d02bc', 6, 1),
('steam:11000013693c307', 30, 1),
('steam:11000013693c307', 6, 1),
('steam:11000013d33ed0f', 6, 0),
('steam:11000013d33ed0f', 72, 1),
('steam:11000013e2304cc', 21, 0),
('steam:11000013e2304cc', 22, 0),
('steam:1100001352d313a', 11, 0),
('steam:1100001352d313a', 38, 46),
('steam:1100001352d313a', 9, 0),
('steam:11000013ec49c63', 21, 0),
('steam:11000013ec49c63', 22, 0),
('steam:11000011565324d', 21, 0),
('steam:11000011565324d', 22, 0),
('steam:11000011a1a1fe7', 3, 0),
('steam:11000011a1a1fe7', 16, 0),
('steam:11000013fc419f2', 30, 13),
('steam:11000013ec49c63', 38, 0),
('steam:11000013ec49c63', 9, 55),
('steam:1100001352d313a', 6, 0),
('steam:11000011565324d', 71, 1),
('steam:11000011565324d', 70, 1),
('steam:11000011565324d', 60, 3),
('steam:11000011565324d', 66, 2),
('steam:110000114d95b71', 70, 1),
('steam:110000114d95b71', 71, 1),
('steam:110000114d95b71', 66, 1),
('steam:110000114d95b71', 60, 1),
('steam:11000013fc419f2', 72, 1),
('steam:11000013226b3d5', 21, 0),
('steam:11000011565324d', 16, 0),
('steam:11000013226b3d5', 22, 0),
('steam:110000104b6b873', 16, 0),
('steam:1100001364344d6', 38, 0),
('steam:1100001364344d6', 16, 17),
('steam:11000011923f20b', 16, 0),
('steam:1100001118220b9', 30, 0),
('steam:1100001118220b9', 6, 0),
('steam:11000011923f20b', 72, 0),
('steam:11000013f1e4076', 38, 0),
('steam:11000013f1e4076', 9, 0),
('steam:110000135c91d3a', 16, 6),
('steam:1100001364344d6', 55, 5),
('steam:1100001364344d6', 53, 7),
('steam:1100001364344d6', 57, 1),
('steam:11000013ec49c63', 16, 0),
('steam:110000136dbcfea', 47, 9),
('steam:11000013ec49c63', 6, 0),
('steam:11000013ec49c63', 30, 0),
('steam:11000013f1e4076', 60, 1),
('steam:11000013f1e4076', 66, 1),
('steam:110000113f1c845', 16, 0),
('steam:11000013226b3d5', 16, 19),
('steam:11000013c35674e', 30, 3),
('steam:11000013c35674e', 6, 4),
('steam:11000011565324d', 6, 2),
('steam:11000011565324d', 30, 6),
('steam:110000141227fb1', 70, 0),
('steam:1100001186cdb42', 71, 1),
('steam:1100001186cdb42', 70, 0),
('steam:110000131d17b17', 30, 0),
('steam:110000131d17b17', 6, 0),
('steam:11000013f1e4076', 6, 0),
('steam:11000013f1e4076', 30, 2),
('steam:11000011923f20b', 47, 1),
('steam:110000141227fb1', 30, 0),
('steam:110000141227fb1', 6, 0),
('steam:11000010a51093f', 30, 0),
('steam:11000010a51093f', 6, 0),
('steam:110000141227fb1', 60, 1),
('steam:110000141227fb1', 66, 1),
('steam:110000141227fb1', 71, 1),
('steam:110000136c0c4ec', 70, 1),
('steam:11000013978037e', 30, 6),
('steam:11000013978037e', 21, 0),
('steam:11000013978037e', 22, 0),
('steam:11000013978037e', 3, 0),
('steam:11000013978037e', 16, 0),
('steam:110000135760edf', 72, 1),
('steam:11000013e9b3c10', 3, 43),
('steam:1100001167961a1', 30, 0),
('steam:1100001167961a1', 6, 0),
('steam:110000131ff48a7', 3, 55),
('steam:110000114d95b71', 3, 51),
('steam:110000131ff48a7', 16, 0),
('steam:110000114d95b71', 16, 0),
('steam:11000013f1e4076', 16, 19),
('steam:11000013cbaae1f', 30, 3),
('steam:110000136dbcfea', 6, 0),
('steam:11000011923f20b', 6, 13),
('steam:11000011923f20b', 30, 15);

-- --------------------------------------------------------

--
-- Structure de la table `user_license`
--

CREATE TABLE `user_license` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `licence_id` int(255) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `points` int(11) NOT NULL DEFAULT 6,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_phonelist`
--

CREATE TABLE `user_phonelist` (
  `owner_id` varchar(50) NOT NULL,
  `contact_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_vehicle`
--

CREATE TABLE `user_vehicle` (
  `owner` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `model` varchar(60) DEFAULT NULL,
  `price` int(60) DEFAULT NULL,
  `plate` varchar(60) NOT NULL,
  `state` int(11) DEFAULT 0,
  `type` int(11) DEFAULT NULL,
  `customs` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_vehicle`
--

INSERT INTO `user_vehicle` (`owner`, `name`, `model`, `price`, `plate`, `state`, `type`, `customs`) VALUES
('steam:11000013330bf2a', 'Hakuchou Drag', '-255678177', 15000, 'NELLY', 0, 1, '{\"mods\":[],\"windows\":0,\"color\":{\"pearlescent\":18,\"primary\":{\"blue\":8,\"type\":6,\"red\":8,\"green\":8},\"secondary\":{\"blue\":201,\"type\":6,\"red\":179,\"green\":185}},\"tyreburst\":{\"blue\":255,\"green\":255,\"enabled\":0,\"red\":255},\"wheels\":{\"color\":156,\"type\":0},\"neons\":{\"blue\":255,\"green\":255,\"enabled\":0,\"red\":255}}'),
('steam:11000013330bf2a', 'Hakuchou Drag', '-255678177', 15000, 'NELLY 3', 0, 1, '{\"mods\":[],\"windows\":0,\"color\":{\"pearlescent\":18,\"primary\":{\"blue\":8,\"type\":6,\"red\":8,\"green\":8},\"secondary\":{\"blue\":201,\"type\":6,\"red\":179,\"green\":185}},\"tyreburst\":{\"blue\":255,\"green\":255,\"enabled\":0,\"red\":255},\"wheels\":{\"color\":156,\"type\":0},\"neons\":{\"blue\":255,\"green\":255,\"enabled\":0,\"red\":255}}'),
('steam:11000013330bf2a', 'Hakuchou Drag', '-255678177', 15000, 'NELLYJTM', 0, 1, '{\"mods\":[],\"windows\":0,\"color\":{\"pearlescent\":18,\"primary\":{\"blue\":8,\"type\":6,\"red\":8,\"green\":8},\"secondary\":{\"blue\":201,\"type\":6,\"red\":179,\"green\":185}},\"tyreburst\":{\"blue\":255,\"green\":255,\"enabled\":0,\"red\":255},\"wheels\":{\"color\":156,\"type\":0},\"neons\":{\"blue\":255,\"green\":255,\"enabled\":0,\"red\":255}}'),
('steam:110000136fdf57f', 'BMX', '1131912276', 100, 'NERZO', 0, 1, '{\"tyreburst\":{\"green\":255,\"red\":255,\"enabled\":0,\"blue\":255},\"wheels\":{\"color\":156,\"type\":0},\"color\":{\"primary\":{\"green\":59,\"blue\":71,\"red\":50,\"type\":0},\"secondary\":{\"green\":8,\"blue\":8,\"red\":8,\"type\":0},\"pearlescent\":111},\"mods\":[],\"windows\":0,\"neons\":{\"green\":255,\"red\":255,\"enabled\":0,\"blue\":255}}'),
('steam:11000011811d317', 'BMX', '1131912276', 100, 'BALLAS', 0, 1, '{\"tyreburst\":{\"green\":255,\"red\":255,\"blue\":255,\"enabled\":0},\"mods\":[],\"color\":{\"pearlescent\":111,\"secondary\":{\"green\":8,\"type\":0,\"blue\":8,\"red\":8},\"primary\":{\"green\":59,\"type\":0,\"blue\":71,\"red\":50}},\"windows\":0,\"neons\":{\"green\":255,\"red\":255,\"blue\":255,\"enabled\":0},\"wheels\":{\"color\":156,\"type\":0}}'),
('steam:1100001090d937b', 'Speedo', '-810318068', 8700, 'PEINTRE', 0, 1, '{\"xenons\":1,\"windows\":1,\"mods\":[],\"wheels\":{\"type\":0,\"color\":0,\"choice\":6},\"tyreburst\":{\"blue\":240,\"enabled\":1,\"green\":130,\"red\":122},\"color\":{\"primary\":{\"type\":3,\"red\":0,\"green\":0,\"blue\":0},\"secondary\":{\"type\":3,\"blue\":0,\"green\":0,\"red\":0},\"pearlescent\":5},\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:1100001194c6243', 'Coquette BlackFin', '784565758', 28000, 'F5EZ6R1Z', 0, 1, '{\"xenons\":1,\"windows\":1,\"neons\":{\"red\":58,\"enabled\":false,\"green\":242,\"blue\":239},\"wheels\":{\"type\":0,\"color\":0,\"choice\":8},\"tyreburst\":{\"blue\":25,\"enabled\":1,\"green\":25,\"red\":25},\"color\":{\"primary\":{\"type\":1,\"red\":25,\"green\":25,\"blue\":25},\"secondary\":{\"type\":1,\"blue\":25,\"green\":25,\"red\":25},\"pearlescent\":134},\"mods\":{\"0\":0,\"4\":0,\"1\":1,\"5\":0}}'),
('steam:11000011811d317', 'Manchez', '-1523428744', 4000, 'MANCHEZ', 0, 1, '{\"neons\":{\"enabled\":0,\"blue\":255,\"green\":255,\"red\":255},\"color\":{\"primary\":{\"red\":56,\"blue\":0,\"green\":12,\"type\":6},\"pearlescent\":39,\"secondary\":{\"red\":119,\"blue\":135,\"green\":124,\"type\":6}},\"wheels\":{\"color\":156,\"type\":0},\"mods\":[],\"tyreburst\":{\"enabled\":0,\"blue\":255,\"green\":255,\"red\":255},\"windows\":0}'),
('steam:1100001090d937b', 'BESRA', '1824333165', 477500, 'Fonda', 0, 4, '{\"neons\":{\"blue\":255,\"enabled\":0,\"red\":255,\"green\":255},\"color\":{\"secondary\":{\"blue\":0,\"type\":0,\"red\":217,\"green\":166},\"windows\":0,\"pearlescent\":25,\"primary\":{\"blue\":153,\"type\":0,\"red\":153,\"green\":153}},\"mods\":[],\"tyreburst\":{\"blue\":255,\"enabled\":0,\"red\":255,\"green\":255},\"wheels\":{\"color\":121,\"type\":0}}'),
('steam:11000011811d317', 'Flash GT', '-1259134696', 72500, 'ATTRAPE', 0, 1, '{\"windows\":1,\"color\":{\"secondary\":{\"red\":240,\"blue\":240,\"type\":6,\"green\":240},\"pearlescent\":111,\"primary\":{\"red\":240,\"blue\":240,\"type\":6,\"green\":240}},\"mods\":{\"23\":8,\"4\":0,\"3\":5,\"48\":9,\"1\":5,\"0\":1},\"horn\":42,\"xenons\":1,\"wheels\":{\"type\":0,\"color\":0},\"neons\":{\"red\":255,\"blue\":255,\"enabled\":1,\"green\":255},\"tyreburst\":{\"blue\":0,\"red\":0,\"enabled\":1,\"green\":0}}'),
('steam:11000013db45b7f', 'Alpha', '767087018', 65000, '0504', 0, 1, '{\"tyreburst\":{\"red\":255,\"enabled\":0,\"blue\":255,\"green\":255},\"mods\":[],\"wheels\":{\"color\":156,\"type\":0},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"blue\":255,\"green\":255},\"color\":{\"primary\":{\"red\":18,\"type\":6,\"blue\":18,\"green\":18},\"pearlescent\":0,\"secondary\":{\"red\":8,\"type\":6,\"blue\":8,\"green\":8}}}'),
('steam:1100001090d937b', 'Sentinel Classique', '1104234922', 72000, 'BYEBYE', 0, 1, '{\"windows\":1,\"xenons\":1,\"wheels\":{\"choice\":20,\"color\":0,\"type\":0},\"tyreburst\":{\"green\":0,\"red\":0,\"enabled\":1,\"blue\":255},\"color\":{\"primary\":{\"green\":25,\"red\":25,\"blue\":25,\"type\":1},\"pearlescent\":12,\"secondary\":{\"green\":0,\"red\":0,\"blue\":0,\"type\":3}},\"neons\":{\"blue\":255,\"green\":255,\"enabled\":0,\"red\":255},\"mods\":{\"4\":1,\"3\":-1,\"6\":3,\"5\":2,\"0\":2,\"2\":1,\"1\":8,\"8\":1,\"7\":15,\"10\":12}}'),
('steam:11000011b2630e9', 'Faction Custom', '-1790546981', 13000, 'F4L', 0, 1, '{\"windows\":0,\"neons\":{\"blue\":255,\"green\":255,\"red\":255,\"enabled\":0},\"color\":{\"secondary\":{\"blue\":109,\"green\":49,\"type\":6,\"red\":14},\"pearlescent\":92,\"primary\":{\"blue\":109,\"green\":49,\"type\":6,\"red\":14}},\"mods\":[],\"wheels\":{\"type\":0,\"color\":88},\"tyreburst\":{\"blue\":255,\"green\":255,\"red\":255,\"enabled\":0}}'),
('steam:11000013e4fa596', 'BMX', '1131912276', 100, '20HXG321', 1, 1, '{\"tyreburst\":{\"red\":255,\"blue\":255,\"green\":255,\"enabled\":0},\"windows\":0,\"mods\":[],\"color\":{\"pearlescent\":111,\"primary\":{\"red\":50,\"type\":0,\"blue\":71,\"green\":59},\"secondary\":{\"red\":8,\"type\":0,\"blue\":8,\"green\":8}},\"neons\":{\"red\":255,\"blue\":255,\"green\":255,\"enabled\":0},\"wheels\":{\"color\":156,\"type\":0}}'),
('steam:11000011b2630e9', 'Rat Bike', '1873600305', 2500, 'F4L', 1, 1, '{\"tyreburst\":{\"red\":255,\"blue\":255,\"green\":255,\"enabled\":0},\"windows\":0,\"mods\":[],\"color\":{\"pearlescent\":0,\"primary\":{\"red\":217,\"type\":6,\"blue\":217,\"green\":217},\"secondary\":{\"red\":240,\"type\":6,\"blue\":240,\"green\":240}},\"neons\":{\"red\":255,\"blue\":255,\"green\":255,\"enabled\":0},\"wheels\":{\"color\":0,\"type\":0}}'),
('steam:11000013330bf2a', 'Flash GT', '-1259134696', 72500, 'FIRAXS', 0, 1, '{\"windows\":1,\"tyreburst\":{\"red\":255,\"blue\":255,\"enabled\":0,\"green\":255},\"horn\":1,\"color\":{\"secondary\":{\"red\":0,\"blue\":0,\"type\":3,\"green\":0},\"primary\":{\"blue\":0,\"red\":0,\"type\":3,\"green\":0},\"pearlescent\":111},\"mods\":[],\"neons\":{\"red\":255,\"blue\":255,\"enabled\":0,\"green\":255},\"wheels\":{\"type\":0,\"color\":0}}'),
('steam:1100001090d937b', 'Super Diamond', '1123216662', 35000, 'DEAD', 0, 1, '{\"mods\":[],\"tyreburst\":{\"red\":242,\"enabled\":1,\"green\":240,\"blue\":126},\"wheels\":{\"color\":94,\"choice\":6,\"type\":3},\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"color\":{\"pearlescent\":111,\"secondary\":{\"red\":0,\"green\":0,\"type\":3,\"blue\":0},\"primary\":{\"red\":255,\"green\":255,\"blue\":255,\"type\":3}},\"horn\":6,\"windows\":1}'),
('steam:1100001384b18f6', 'Hakuchou Drag', '-255678177', 15000, 'JACK WAL', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"neons\":{\"green\":255,\"enabled\":0,\"blue\":255,\"red\":255},\"color\":{\"pearlescent\":18,\"secondary\":{\"type\":6,\"green\":185,\"blue\":201,\"red\":179},\"primary\":{\"type\":6,\"green\":8,\"blue\":8,\"red\":8}},\"mods\":[],\"tyreburst\":{\"green\":255,\"enabled\":0,\"blue\":255,\"red\":255},\"windows\":0}'),
('steam:11000011811d317', 'Boxville', '121658888', 8800, 'HOLD UP', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"neons\":{\"green\":255,\"enabled\":0,\"blue\":255,\"red\":255},\"color\":{\"pearlescent\":1,\"secondary\":{\"type\":0,\"green\":240,\"blue\":240,\"red\":240},\"primary\":{\"type\":0,\"green\":240,\"blue\":240,\"red\":240}},\"mods\":[],\"tyreburst\":{\"green\":255,\"enabled\":0,\"blue\":255,\"red\":255},\"windows\":0}'),
('steam:1100001364344d6', 'Esskey', '2035069708', 5800, 'C', 0, 1, '{\"wheels\":{\"color\":131,\"type\":0},\"neons\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255},\"windows\":0,\"color\":{\"primary\":{\"red\":5,\"type\":6,\"blue\":5,\"green\":5},\"secondary\":{\"red\":189,\"type\":6,\"blue\":0,\"green\":72},\"pearlescent\":2},\"mods\":[],\"tyreburst\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255}}'),
('steam:11000011bcfbf5b', 'Sanchez', '-1453280962', 2500, 'PSW9890D', 1, 1, '{\"wheels\":{\"color\":0,\"type\":0},\"neons\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255},\"windows\":0,\"color\":{\"primary\":{\"red\":63,\"type\":6,\"blue\":40,\"green\":66},\"secondary\":{\"red\":63,\"type\":6,\"blue\":40,\"green\":66},\"pearlescent\":0},\"mods\":[],\"tyreburst\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255}}'),
('steam:11000011565324d', 'Gargoyle', '741090084', 7300, 'GARDUNA', 0, 1, '{\"wheels\":{\"color\":156,\"type\":0},\"neons\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255},\"windows\":0,\"color\":{\"primary\":{\"red\":38,\"type\":6,\"blue\":11,\"green\":3},\"secondary\":{\"red\":31,\"type\":6,\"blue\":38,\"green\":34},\"pearlescent\":38},\"mods\":[],\"tyreburst\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255}}'),
('steam:11000013e2304cc', 'Sanchez', '-1453280962', 2500, '247', 1, 1, '{\"wheels\":{\"color\":0,\"type\":0},\"neons\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255},\"windows\":0,\"color\":{\"primary\":{\"red\":38,\"type\":6,\"blue\":11,\"green\":3},\"secondary\":{\"red\":38,\"type\":6,\"blue\":11,\"green\":3},\"pearlescent\":34},\"mods\":[],\"tyreburst\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255}}'),
('steam:110000136dbcfea', 'Cliffhanger', '390201602', 6300, 'MED', 1, 1, '{\"wheels\":{\"color\":112,\"type\":0},\"neons\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255},\"windows\":0,\"color\":{\"primary\":{\"red\":8,\"type\":6,\"blue\":8,\"green\":8},\"secondary\":{\"red\":119,\"type\":6,\"blue\":135,\"green\":124},\"pearlescent\":5},\"mods\":[],\"tyreburst\":{\"blue\":255,\"red\":255,\"enabled\":0,\"green\":255}}'),
('steam:11000013fdd4f30', 'Sanchez Sport', '788045382', 2500, '1210', 0, 1, '{\"tyreburst\":{\"enabled\":0,\"red\":255,\"green\":255,\"blue\":255},\"color\":{\"pearlescent\":0,\"secondary\":{\"green\":8,\"red\":8,\"blue\":8,\"type\":6},\"primary\":{\"green\":8,\"red\":8,\"blue\":8,\"type\":6}},\"neons\":{\"enabled\":0,\"red\":255,\"green\":255,\"blue\":255},\"wheels\":{\"color\":156,\"type\":0},\"mods\":[],\"windows\":0}'),
('steam:11000011565324d', 'Elegy Retro', '196747873', 62500, 'GARDUNA', 0, 1, '{\"windows\":1,\"mods\":{\"0\":9,\"48\":1},\"horn\":50,\"wheels\":{\"color\":1,\"type\":7,\"choice\":15},\"color\":{\"primary\":{\"red\":255,\"blue\":255,\"type\":3,\"green\":255},\"secondary\":{\"blue\":0,\"type\":3,\"green\":0,\"red\":0},\"pearlescent\":61},\"neons\":{\"green\":255,\"enabled\":0,\"blue\":255,\"red\":255},\"tyreburst\":{\"green\":255,\"enabled\":0,\"blue\":255,\"red\":255}}'),
('steam:110000135760edf', 'BMX', '1131912276', 100, 'BALLAS', 1, 1, '{\"tyreburst\":{\"enabled\":0,\"red\":255,\"green\":255,\"blue\":255},\"color\":{\"pearlescent\":5,\"secondary\":{\"green\":240,\"red\":240,\"blue\":240,\"type\":0},\"primary\":{\"green\":30,\"red\":28,\"blue\":33,\"type\":0}},\"neons\":{\"enabled\":0,\"red\":255,\"green\":255,\"blue\":255},\"wheels\":{\"color\":156,\"type\":0},\"mods\":[],\"windows\":0}'),
('steam:11000013f42ff6a', 'BMX', '1131912276', 100, '44NDF130', 0, 1, '{\"windows\":0,\"wheels\":{\"color\":156,\"type\":0},\"mods\":[],\"tyreburst\":{\"red\":255,\"blue\":255,\"enabled\":0,\"green\":255},\"color\":{\"secondary\":{\"red\":8,\"type\":0,\"green\":8,\"blue\":8},\"pearlescent\":38,\"primary\":{\"red\":107,\"type\":0,\"green\":0,\"blue\":0}},\"neons\":{\"red\":255,\"blue\":255,\"enabled\":0,\"green\":255}}'),
('steam:11000013f42ff6a', 'BMX', '1131912276', 100, 'QG14', 1, 1, '{\"windows\":0,\"neons\":{\"green\":255,\"red\":255,\"enabled\":0,\"blue\":255},\"wheels\":{\"type\":0,\"color\":156},\"tyreburst\":{\"green\":255,\"red\":255,\"enabled\":0,\"blue\":255},\"color\":{\"pearlescent\":111,\"primary\":{\"type\":0,\"red\":50,\"green\":59,\"blue\":71},\"secondary\":{\"type\":0,\"red\":8,\"green\":8,\"blue\":8}},\"mods\":[]}'),
('steam:11000013ec49c63', 'Hakuchou', '1265391242', 12500, 'Y131414D', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":6,\"red\":18,\"green\":18,\"blue\":18},\"primary\":{\"type\":6,\"red\":18,\"green\":18,\"blue\":18},\"pearlescent\":0},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:110000135760edf', 'Sanchez Sport', '788045382', 2500, 'BALLASGA', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":6,\"red\":8,\"green\":8,\"blue\":8},\"primary\":{\"type\":6,\"red\":8,\"green\":8,\"blue\":8},\"pearlescent\":0},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:1100001364344d6', 'Pigalle', '1078682497', 6800, 'C1', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":6,\"red\":38,\"green\":33,\"blue\":23},\"primary\":{\"type\":6,\"red\":87,\"green\":81,\"blue\":75},\"pearlescent\":0},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:110000113f1c845', 'Sanchez Sport', '788045382', 2500, 'HASSA', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":6,\"red\":8,\"green\":8,\"blue\":8},\"primary\":{\"type\":6,\"red\":8,\"green\":8,\"blue\":8},\"pearlescent\":0},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:11000013226b3d5', 'BF400', '86520421', 6500, 'BALLAS', 0, 1, '{\"wheels\":{\"type\":0,\"color\":112},\"color\":{\"secondary\":{\"type\":6,\"red\":41,\"green\":44,\"blue\":46},\"primary\":{\"type\":6,\"red\":41,\"green\":44,\"blue\":46},\"pearlescent\":3},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:110000135760edf', 'BMX', '1131912276', 100, 'BGANG', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":0,\"red\":8,\"green\":8,\"blue\":8},\"primary\":{\"type\":0,\"red\":50,\"green\":59,\"blue\":71},\"pearlescent\":111},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:110000136c0c4ec', 'Manchez', '-1523428744', 4000, '15AB', 1, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":6,\"red\":28,\"green\":30,\"blue\":33},\"primary\":{\"type\":6,\"red\":119,\"green\":124,\"blue\":135},\"pearlescent\":4},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:11000011ac33eea', 'Manchez', '-1523428744', 4000, 'MANY', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":6,\"red\":119,\"green\":124,\"blue\":135},\"primary\":{\"type\":6,\"red\":56,\"green\":12,\"blue\":0},\"pearlescent\":38},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:110000135760edf', 'Manchez', '-1523428744', 4000, 'B4L', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":6,\"red\":28,\"green\":30,\"blue\":33},\"primary\":{\"type\":6,\"red\":119,\"green\":124,\"blue\":135},\"pearlescent\":4},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:11000013f1e4076', 'Primo Custom', '-2040426790', 6500, 'VAGOS', 1, 1, '{\"windows\":1,\"mods\":{\"48\":1},\"wheels\":{\"color\":42,\"type\":1,\"choice\":9},\"color\":{\"secondary\":{\"green\":124,\"blue\":135,\"type\":6,\"red\":119},\"primary\":{\"green\":198,\"blue\":17,\"type\":3,\"red\":254},\"pearlescent\":3},\"neons\":{\"green\":255,\"blue\":255,\"enabled\":0,\"red\":255},\"tyreburst\":{\"green\":255,\"blue\":255,\"enabled\":0,\"red\":255}}'),
('steam:110000135c91d3a', 'Buccaneer Custom', '-1013450936', 12000, 'VAGOS', 1, 1, '{\"windows\":1,\"mods\":[],\"wheels\":{\"color\":90,\"type\":0},\"color\":{\"secondary\":{\"red\":0,\"type\":3,\"blue\":0,\"green\":0},\"primary\":{\"green\":198,\"type\":3,\"blue\":17,\"red\":254},\"pearlescent\":35},\"neons\":{\"green\":255,\"blue\":255,\"enabled\":0,\"red\":255},\"tyreburst\":{\"green\":255,\"blue\":255,\"enabled\":0,\"red\":255}}'),
('steam:11000013978037e', 'Velo de crosse', '-186537451', 200, 'PLAQUE U', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":0,\"red\":240,\"green\":240,\"blue\":240},\"primary\":{\"type\":0,\"red\":217,\"green\":166,\"blue\":0},\"pearlescent\":3},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:11000013978037e', 'Velo de crosse', '-186537451', 200, 'PLAQUE U', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":0,\"red\":240,\"green\":240,\"blue\":240},\"primary\":{\"type\":0,\"red\":217,\"green\":166,\"blue\":0},\"pearlescent\":3},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:11000013978037e', 'BMX', '1131912276', 100, 'PLAQUE U', 0, 1, '{\"wheels\":{\"type\":0,\"color\":156},\"color\":{\"secondary\":{\"type\":0,\"red\":8,\"green\":8,\"blue\":8},\"primary\":{\"type\":0,\"red\":50,\"green\":59,\"blue\":71},\"pearlescent\":111},\"windows\":0,\"neons\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255},\"mods\":[],\"tyreburst\":{\"red\":255,\"enabled\":0,\"green\":255,\"blue\":255}}'),
('steam:11000011565324d', 'Panto', '-431692672', 3995, 'WOYYYYY', 0, 1, '{\"mods\":[],\"wheels\":{\"color\":156,\"type\":0},\"windows\":0,\"color\":{\"primary\":{\"red\":41,\"type\":6,\"blue\":46,\"green\":44},\"pearlescent\":0,\"secondary\":{\"red\":41,\"type\":6,\"blue\":46,\"green\":44}},\"neons\":{\"enabled\":0,\"blue\":255,\"green\":255,\"red\":255},\"tyreburst\":{\"enabled\":0,\"blue\":255,\"green\":255,\"red\":255}}');

-- --------------------------------------------------------

--
-- Structure de la table `user_weapons`
--

CREATE TABLE `user_weapons` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `weapon_model` varchar(255) NOT NULL,
  `withdraw_cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vagos`
--

CREATE TABLE `vagos` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vagos`
--

INSERT INTO `vagos` (`identifier`, `rank`) VALUES
('steam:11000010a51093f', 'Recrue'),
('steam:110000135c91d3a', 'Recrue'),
('steam:1100001364344d6', 'Recrue'),
('steam:11000013f1e4076', 'Recrue'),
('steam:11000013f3d457b', 'Recrue');

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  `model` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `price`, `model`) VALUES
(1, 'Blista', 4895, 'blista'),
(2, 'Brioso R/A', 9855, 'brioso'),
(3, 'Dilettante', 9895, 'Dilettante'),
(4, 'Issi', 5995, 'issi2'),
(5, 'Panto', 3995, 'panto'),
(6, 'Prairie', 7995, 'prairie'),
(7, 'Rhapsody', 5995, 'rhapsody'),
(8, 'Cognoscenti Cabrio', 50000, 'cogcabrio'),
(9, 'Exemplar', 54500, 'exemplar'),
(10, 'F620', 51200, 'f620'),
(11, 'Felon', 50500, 'felon'),
(12, 'Felon GT', 53200, 'felon2'),
(13, 'Jackal', 52500, 'jackal'),
(14, 'Oracle', 45000, 'oracle'),
(15, 'Oracle XS', 49890, 'oracle2'),
(16, 'Sentinel', 42550, 'sentinel'),
(17, 'Sentinel XS', 44980, 'sentinel2'),
(18, 'Windsor', 53200, 'windsor'),
(19, 'Windsor Drop', 55000, 'windsor2'),
(20, 'Zion', 42500, 'zion'),
(21, 'Zion Cabrio', 45000, 'zion2'),
(22, '9F', 82500, 'ninef'),
(23, '9F Cabrio', 85000, 'ninef2'),
(24, 'Alpha', 65000, 'alpha'),
(25, 'Banshee', 75000, 'banshee'),
(26, 'Bestia GTS', 72000, 'bestiagts'),
(27, 'Blista Compact', 4895, 'blista'),
(28, 'Buffalo', 60000, 'buffalo'),
(29, 'Buffalo S', 65000, 'buffalo2'),
(30, 'Carbonizzare', 80000, 'carbonizzare'),
(31, 'Comet', 82500, 'comet2'),
(32, 'Coquette', 77000, 'coquette'),
(33, 'Drift Tampa', 58500, 'tampa2'),
(34, 'Feltzer', 68000, 'feltzer2'),
(35, 'Furore GT', 68500, 'furoregt'),
(36, 'Fusilade', 69500, 'fusilade'),
(37, 'Jester', 71500, 'jester'),
(38, 'Jester(Racecar)', 72500, 'jester2'),
(39, 'Kuruma', 58500, 'kuruma'),
(40, 'Lynx', 81500, 'lynx'),
(41, 'Massacro', 82400, 'massacro'),
(42, 'Massacro(Racecar)', 82900, 'massacro2'),
(43, 'Omnis', 60500, 'omnis'),
(44, 'Penumbra', 55000, 'penumbra'),
(45, 'Rapid GT', 60000, 'rapidgt'),
(46, 'Rapid GT Convertible', 61500, 'rapidgt2'),
(47, 'Schafter V12', 55000, 'schafter3'),
(48, 'Sultan', 60000, 'sultan'),
(49, 'Surano', 68500, 'surano'),
(50, 'Tropos', 50500, 'tropos'),
(51, 'Verkierer', 75000, 'verlierer2'),
(52, 'Casco', 75000, 'casco'),
(53, 'Coquette Classic', 78500, 'coquette2'),
(54, 'JB 700', 52000, 'jb700'),
(55, 'Pigalle', 6800, 'pigalle'),
(56, 'Stinger', 51000, 'stinger'),
(57, 'Stinger GT', 52500, 'stingergt'),
(58, 'Stirling GT', 55000, 'feltzer3'),
(59, 'Z-Type', 60000, 'ztype'),
(60, 'Adder', 185000, 'adder'),
(61, 'Banshee 900R', 125000, 'banshee2'),
(62, 'Bullet', 105000, 'bullet'),
(63, 'Cheetah', 145500, 'cheetah'),
(64, 'Entity XF', 155000, 'entityxf'),
(65, 'ETR1', 156300, 'sheava'),
(66, 'FMJ', 165000, 'fmj'),
(67, 'Infernus', 135000, 'infernus'),
(68, 'Osiris', 165500, 'osiris'),
(69, 'RE-7B', 160000, 'le7b'),
(70, 'Reaper', 195000, 'reaper'),
(71, 'Sultan RS', 150000, 'sultanrs'),
(72, 'T20', 175000, 't20'),
(73, 'Turismo R', 160000, 'turismor'),
(74, 'Tyrus', 165000, 'tyrus'),
(75, 'Vacca', 155000, 'vacca'),
(76, 'Voltic', 145000, 'voltic'),
(77, 'X80 Proto', 205000, 'prototipo'),
(78, 'Zentorno', 205000, 'zentorno'),
(79, 'Blade', 11000, 'blade'),
(80, 'Buccaneer', 11500, 'buccaneer'),
(81, 'Chino', 11500, 'chino'),
(82, 'Coquette BlackFin', 28000, 'coquette3'),
(83, 'Dominator', 35500, 'dominator'),
(84, 'Dukes', 19500, 'dukes'),
(85, 'Gauntlet', 24500, 'gauntlet'),
(86, 'Hotknife', 19500, 'hotknife'),
(87, 'Faction', 12500, 'faction'),
(88, 'Nightshade', 25000, 'nightshade'),
(89, 'Picador', 11500, 'picador'),
(90, 'Sabre Turbo', 13500, 'sabregt'),
(91, 'Tampa', 13000, 'tampa'),
(92, 'Virgo', 11500, 'virgo'),
(93, 'Vigero', 15000, 'vigero'),
(94, 'Bifta', 14500, 'bifta'),
(95, 'Blazer', 2900, 'blazer'),
(96, 'Brawler', 45000, 'brawler'),
(97, 'Bubsta 6x6', 55000, 'dubsta3'),
(98, 'Dune Buggy', 15000, 'dune'),
(99, 'Rebel', 8500, 'rebel2'),
(100, 'Sandking', 8300, 'sandking'),
(102, 'Trophy Truck', 48500, 'trophytruck'),
(103, 'Baller', 30000, 'baller4'),
(104, 'Cavalcade', 23500, 'cavalcade2'),
(105, 'Grabger', 28500, 'granger'),
(106, 'Huntley S', 22000, 'huntley'),
(109, 'Rocoto', 26500, 'rocoto'),
(111, 'XLS', 29500, 'xls'),
(112, 'Bison', 12000, 'bison'),
(113, 'Bobcat XL', 9500, 'bobcatxl'),
(114, 'Gang Burrito', 9500, 'gburrito'),
(115, 'Journey', 9500, 'journey'),
(116, 'Minivan', 10000, 'minivan'),
(118, 'Rumpo', 8500, 'rumpo'),
(119, 'Surfer', 4500, 'surfer'),
(120, 'Youga', 8300, 'youga'),
(121, 'Asea', 5200, 'asea'),
(122, 'Asterope', 5500, 'asterope'),
(123, 'Fugitive', 25000, 'fugitive'),
(124, 'Glendale', 5500, 'glendale'),
(125, 'Ingot', 6100, 'ingot'),
(126, 'Intruder', 16000, 'intruder'),
(127, 'Premier', 10000, 'premier'),
(128, 'Primo', 9000, 'primo'),
(129, 'Primo Custom', 9500, 'primo2'),
(130, 'Regina', 8000, 'regina'),
(131, 'Schafter', 25000, 'schafter2'),
(132, 'Stanier', 8500, 'stanier'),
(133, 'Stratum', 7400, 'stratum'),
(134, 'Stretch', 54500, 'stretch'),
(135, 'Super Diamond', 35000, 'superd'),
(136, 'Surge', 13500, 'surge'),
(137, 'Tailgater', 22500, 'tailgater'),
(138, 'Warrener', 6400, 'warrener'),
(139, 'Washington', 8600, 'washington'),
(140, 'Akuma', 9500, 'AKUMA'),
(141, 'Bagger', 6500, 'bagger'),
(142, 'Bati 801', 9000, 'bati'),
(143, 'Bati 801RR', 9500, 'bati2'),
(144, 'BF400', 6500, 'bf400'),
(145, 'Carbon RS', 6200, 'carbonrs'),
(146, 'Cliffhanger', 6300, 'cliffhanger'),
(147, 'Daemon', 5800, 'daemon'),
(148, 'Double T', 6700, 'double'),
(149, 'Enduro', 4200, 'enduro'),
(151, 'Gargoyle', 7300, 'gargoyle'),
(152, 'Hakuchou', 12500, 'hakuchou'),
(153, 'Hexer', 6000, 'hexer'),
(154, 'Innovation', 6400, 'innovation'),
(155, 'Lectro', 6800, 'lectro'),
(156, 'Nemesis', 12000, 'nemesis'),
(157, 'PCJ-600', 5900, 'pcj'),
(158, 'Ruffian', 7200, 'ruffian'),
(159, 'Sanchez', 2500, 'sanchez'),
(160, 'Sovereign', 4500, 'sovereign'),
(161, 'Thrust', 6000, 'thrust'),
(162, 'Vader', 6100, 'vader'),
(163, 'Vindicator', 8900, 'vindicator');

-- --------------------------------------------------------

--
-- Structure de la table `vestiaire`
--

CREATE TABLE `vestiaire` (
  `identifier` int(11) NOT NULL,
  `model` varchar(50) NOT NULL DEFAULT '0',
  `face` int(11) NOT NULL DEFAULT 0,
  `face_texture` int(11) NOT NULL DEFAULT 0,
  `hair` int(11) NOT NULL DEFAULT 0,
  `hair_texture` int(11) NOT NULL DEFAULT 0,
  `shirt` int(11) NOT NULL DEFAULT 0,
  `shirt_texture` int(11) NOT NULL DEFAULT 0,
  `pants` int(11) NOT NULL DEFAULT 0,
  `pants_texture` int(11) NOT NULL DEFAULT 0,
  `shoes` int(11) NOT NULL DEFAULT 0,
  `shoes_texture` int(11) NOT NULL DEFAULT 0,
  `vest` int(11) NOT NULL DEFAULT 0,
  `vest_texture` int(11) NOT NULL DEFAULT 0,
  `bag` int(11) NOT NULL DEFAULT 0,
  `bag_texture` int(11) NOT NULL DEFAULT 0,
  `mask` int(11) NOT NULL DEFAULT 0,
  `mask_texture` int(11) NOT NULL DEFAULT 0,
  `hat` int(11) NOT NULL DEFAULT 0,
  `hat_texture` int(11) NOT NULL DEFAULT 0,
  `glasses` int(11) NOT NULL DEFAULT 0,
  `glasses_texture` int(11) NOT NULL DEFAULT 0,
  `jacket` int(11) NOT NULL DEFAULT 0,
  `jacket_texture` int(11) NOT NULL DEFAULT 0,
  `ears` int(11) NOT NULL DEFAULT 0,
  `ears_texture` int(11) NOT NULL DEFAULT 0,
  `gloves` int(11) NOT NULL DEFAULT 0,
  `gloves_texture` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `whitelist`
--

CREATE TABLE `whitelist` (
  `identifier` varchar(255) NOT NULL,
  `listed` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `yiddish`
--

CREATE TABLE `yiddish` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `yiddish`
--

INSERT INTO `yiddish` (`identifier`, `rank`) VALUES
('steam:1100001352d313a', 'Recrue'),
('steam:11000013ec49c63', 'Recrue');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ballas`
--
ALTER TABLE `ballas`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clothes_outfits`
--
ALTER TABLE `clothes_outfits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clothes_props`
--
ALTER TABLE `clothes_props`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clothes_users_outfits`
--
ALTER TABLE `clothes_users_outfits`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `coordinates`
--
ALTER TABLE `coordinates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `goto`
--
ALTER TABLE `goto`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Index pour la table `licences`
--
ALTER TABLE `licences`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `police`
--
ALTER TABLE `police`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `recolt`
--
ALTER TABLE `recolt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `raw_id` (`raw_id`),
  ADD KEY `treated_id` (`treated_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `treatment_id` (`treatment_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Index pour la table `skin`
--
ALTER TABLE `skin`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Index pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `user_appartement`
--
ALTER TABLE `user_appartement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_clothes`
--
ALTER TABLE `user_clothes`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `vagos`
--
ALTER TABLE `vagos`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `yiddish`
--
ALTER TABLE `yiddish`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT pour la table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1948;

--
-- AUTO_INCREMENT pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
