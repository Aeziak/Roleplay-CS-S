-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 02 mai 2023 à 09:09
-- Version du serveur :  8.0.32-0ubuntu0.20.04.2
-- Version de PHP : 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `roleplay`
--

-- --------------------------------------------------------

--
-- Structure de la table `account`
--

CREATE TABLE `account` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `vip` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `accounting`
--

CREATE TABLE `accounting` (
  `id` int NOT NULL,
  `from_player` int NOT NULL,
  `to_player` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `item_id` int NOT NULL,
  `job_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `activities`
--

CREATE TABLE `activities` (
  `id` int NOT NULL,
  `activity_name` varchar(200) NOT NULL,
  `seller_job_id` int NOT NULL,
  `seller_rank_id` int NOT NULL DEFAULT '-1',
  `price` int NOT NULL DEFAULT '300'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `activities`
--

INSERT INTO `activities` (`id`, `activity_name`, `seller_job_id`, `seller_rank_id`, `price`) VALUES
(1, 'Chirurgie des jambes', 9, 3, 850),
(2, 'Chirurgie du coeur', 9, 3, 2000),
(3, 'Chirurgie des jambes', 9, 2, 850),
(4, 'Chirurgie du coeur', 9, 2, 2000),
(5, 'Chirurgie des jambes', 9, 1, 850),
(6, 'Chirurgie du coeur', 9, 1, 2000),
(7, 'Ordinateur et webcam', 10, -1, 700);

-- --------------------------------------------------------

--
-- Structure de la table `capital`
--

CREATE TABLE `capital` (
  `id` int NOT NULL,
  `job_id` int NOT NULL,
  `capital` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `date`
--

CREATE TABLE `date` (
  `id` int NOT NULL,
  `day` int NOT NULL DEFAULT '1',
  `month` int NOT NULL DEFAULT '1',
  `year` int NOT NULL DEFAULT '2000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `date`
--

INSERT INTO `date` (`id`, `day`, `month`, `year`) VALUES
(1, 1, 1, 2000);

-- --------------------------------------------------------

--
-- Structure de la table `doors`
--

CREATE TABLE `doors` (
  `id` int NOT NULL,
  `hammer_id` int NOT NULL DEFAULT '0',
  `job_id` int DEFAULT NULL,
  `rank_id` int DEFAULT NULL,
  `steam_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `map` varchar(50) NOT NULL,
  `keycode` int NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `doors`
--

INSERT INTO `doors` (`id`, `hammer_id`, `job_id`, `rank_id`, `steam_id`, `map`, `keycode`) VALUES
(33, 27590, 1, NULL, NULL, 'rp_mgk_b2', -1),
(34, 27585, NULL, 1, NULL, 'rp_mgk_b2', -1),
(40, 24322, 1, NULL, NULL, 'rp_mgk_b2', -1),
(43, 23794, 2, NULL, NULL, 'rp_mgk_b2', -1),
(44, 23835, 2, NULL, NULL, 'rp_mgk_b2', -1),
(45, 23846, 2, NULL, NULL, 'rp_mgk_b2', -1),
(46, 22147, 2, NULL, NULL, 'rp_mgk_b2', -1),
(47, 22152, 2, NULL, NULL, 'rp_mgk_b2', -1),
(48, 21415, 2, NULL, NULL, 'rp_mgk_b2', -1),
(49, 21420, 2, NULL, NULL, 'rp_mgk_b2', -1),
(50, 21404, 2, NULL, NULL, 'rp_mgk_b2', -1),
(51, 21399, 2, NULL, NULL, 'rp_mgk_b2', -1),
(52, 24053, 2, NULL, NULL, 'rp_mgk_b2', -1),
(53, 23541, 2, NULL, NULL, 'rp_mgk_b2', -1),
(54, 23817, 2, NULL, NULL, 'rp_mgk_b2', -1),
(56, 23820, 2, NULL, NULL, 'rp_mgk_b2', -1),
(64, 21572, 2, 2, NULL, 'rp_mgk_b2', -1),
(65, 21567, 2, 2, NULL, 'rp_mgk_b2', -1),
(81, 26615, 3, NULL, NULL, 'rp_mgk_b2', -1),
(82, 26612, 3, NULL, NULL, 'rp_mgk_b2', -1),
(84, 26609, 3, NULL, NULL, 'rp_mgk_b2', -1),
(85, 26606, 3, NULL, NULL, 'rp_mgk_b2', -1),
(86, 21582, 2, 2, NULL, 'rp_mgk_b2', -1),
(87, 26946, 2, NULL, NULL, 'rp_mgk_b2', -1),
(88, 24766, 3, NULL, NULL, 'rp_mgk_b2', -1),
(89, 26890, 3, NULL, NULL, 'rp_mgk_b2', -1),
(95, 27439, 3, NULL, NULL, 'rp_mgk_b2', -1),
(96, 27434, 3, NULL, NULL, 'rp_mgk_b2', -1),
(102, 25279, 4, NULL, NULL, 'rp_mgk_b2', -1),
(103, 25284, 4, NULL, NULL, 'rp_mgk_b2', -1),
(149, 5479, 3, NULL, NULL, 'rp_mecklenburg_v2', -1),
(150, 5574, 3, NULL, NULL, 'rp_mecklenburg_v2', -1),
(151, 5482, 3, NULL, NULL, 'rp_mecklenburg_v2', -1),
(152, 4126, 4, NULL, NULL, 'rp_mecklenburg_v2', -1),
(153, 3174, 7, NULL, NULL, 'rp_mecklenburg_v2', -1),
(154, 3167, 7, NULL, NULL, 'rp_mecklenburg_v2', -1),
(155, 3085, 7, NULL, NULL, 'rp_mecklenburg_v2', -1),
(156, 3301, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(157, 3292, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(158, 3344, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(159, 3310, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(160, 3282, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(161, 3279, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(162, 3276, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(163, 3333, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(165, 268085, 6, NULL, NULL, 'rp_mecklenburg_v2', -1),
(166, 506457, 6, NULL, NULL, 'rp_mecklenburg_v2', -1),
(167, 256200, 6, NULL, NULL, 'rp_mecklenburg_v2', -1),
(168, 3321, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(169, 5620, 5, NULL, NULL, 'rp_mecklenburg_v2', -1),
(170, 4644, 5, NULL, NULL, 'rp_mecklenburg_v2', -1),
(171, 4649, 1, NULL, NULL, 'rp_mecklenburg_v2', -1),
(172, 4658, 1, NULL, NULL, 'rp_mecklenburg_v2', -1),
(175, 535048, 1, NULL, NULL, 'rp_mecklenburg_v2', -1),
(176, 534377, 1, NULL, NULL, 'rp_mecklenburg_v2', -1),
(177, 5597, 2, NULL, NULL, 'rp_mecklenburg_v2', -1),
(178, 5012, 8, NULL, NULL, 'rp_mecklenburg_v2', -1),
(179, 3192, 8, NULL, NULL, 'rp_mecklenburg_v2', -1),
(180, 184280, 8, NULL, NULL, 'rp_mecklenburg_v2', -1),
(181, 3040, 8, NULL, NULL, 'rp_mecklenburg_v2', -1),
(182, 3033, 8, NULL, NULL, 'rp_mecklenburg_v2', -1),
(183, 2902, 9, NULL, NULL, 'rp_mecklenburg_v2', -1),
(184, 2909, 9, NULL, NULL, 'rp_mecklenburg_v2', -1),
(185, 2925, 9, NULL, NULL, 'rp_mecklenburg_v2', -1),
(186, 2975, 9, NULL, NULL, 'rp_mecklenburg_v2', -1),
(187, 2968, 9, NULL, NULL, 'rp_mecklenburg_v2', -1),
(188, 2961, 9, NULL, NULL, 'rp_mecklenburg_v2', -1),
(189, 2990, 9, NULL, NULL, 'rp_mecklenburg_v2', -1),
(190, 2899, 9, NULL, NULL, 'rp_mecklenburg_v2', -1),
(199, 533330, 1, NULL, NULL, 'rp_mecklenburg_v2', -1);

-- --------------------------------------------------------

--
-- Structure de la table `hideout`
--

CREATE TABLE `hideout` (
  `id` int NOT NULL,
  `map` varchar(50) NOT NULL DEFAULT '',
  `hideout_name` varchar(150) NOT NULL DEFAULT '',
  `job_id` int NOT NULL,
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `batch_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `hideout`
--

INSERT INTO `hideout` (`id`, `map`, `hideout_name`, `job_id`, `x`, `y`, `z`, `batch_id`) VALUES
(24, 'rp_mgk_b2', 'Les apparts que personne veut', 1, -1442.08, 1358.24, -1303.97, 1),
(25, 'rp_mgk_b2', 'Les apparts que personne veut', 1, -1113.69, 975.985, -1103.97, 1),
(26, 'rp_mgk_b2', 'Devant le loto', 1, -575.169, 443.693, -1311.97, 2),
(27, 'rp_mgk_b2', 'Devant le loto', 1, 536.116, 1148.67, -1304, 2),
(28, 'rp_mgk_b2', 'Devant les dealers', 1, 1156.77, 955.188, -1311.97, 3),
(29, 'rp_mgk_b2', 'Devant les dealers', 1, 1928.97, 2007.21, -1011.13, 3),
(30, 'rp_mgk_b2', 'Les apparts que personne veut', 1, -589.608, 1347.82, -1303.97, 4),
(31, 'rp_mgk_b2', 'Les apparts que personne veut', 1, -1446.97, 1058.32, -1061.52, 4),
(32, 'rp_mgk_b2', 'Test Yoann', 1, -1393.89, -1132.47, -1431.97, 5),
(33, 'rp_mgk_b2', 'Test Yoann', 1, -1779.3, -773.007, -1431.97, 5),
(36, 'rp_mgk_b2', 'Zone Test Discord', 1, 3609.78, 810.076, -1311.97, 6),
(37, 'rp_mgk_b2', 'Zone Test Discord', 1, 3080.47, 432.574, -1142.7, 6),
(38, 'rp_mgk_b2', 'Les Dealers', 3, 5024.97, 220.341, -1302.11, 7),
(39, 'rp_mgk_b2', 'Les Dealers', 3, 4175.68, -546.485, -998.031, 7),
(40, 'rp_mgk_b2', 'En face du bar', 3, 1752.4, -1890.9, 469.959, 8),
(41, 'rp_mgk_b2', 'En face du bar', 3, 2784.77, -2975.97, -1012.6, 8),
(42, 'rp_mgk_b2', 'Cellule de prison', 2, -79.47, -1136.02, -1240.03, 9),
(43, 'rp_mgk_b2', 'Cellule de prison', 2, -269.974, -1334.57, -1367.97, 9),
(44, 'rp_mgk_b2', 'Cellule de prison', 2, -270.518, -1727.5, -1240.03, 10),
(45, 'rp_mgk_b2', 'Cellule de prison', 2, -79.0814, -1528.74, -1367.97, 10),
(46, 'rp_mgk_b2', 'Cellule de prison', 2, 120.091, -1137.2, -1240.03, 11),
(47, 'rp_mgk_b2', 'Cellule de prison', 2, -69.459, -1334.99, -1367.97, 11),
(48, 'rp_mgk_b2', 'Cellule de prison', 2, -69.845, -1726.96, -1240.03, 12),
(49, 'rp_mgk_b2', 'Cellule de prison', 2, 119.86, -1529.19, -1367.97, 12),
(50, 'rp_mgk_b2', 'Coffre de la banque', 4, 1512.45, -3878.72, -1080.03, 13),
(51, 'rp_mgk_b2', 'Coffre de la banque', 4, 1049.13, -3403.74, -1303.97, 13),
(52, 'rp_mgk_b2', 'Les Mafieux', 6, 259.594, 1080.84, -1303.97, 14),
(53, 'rp_mgk_b2', 'Les Mafieux', 6, 792.474, 1569.63, -1129.1, 14),
(54, 'rp_mecklenburg_v2', 'Coffre de la banque', 4, 452.847, -1273.49, -672.031, 15),
(55, 'rp_mecklenburg_v2', 'Coffre de la banque', 4, 612.577, -1136.03, -823.969, 15),
(56, 'rp_mecklenburg_v2', 'La Banque', 4, 1098.83, -780.122, -672.031, 16),
(57, 'rp_mecklenburg_v2', 'La Banque', 4, 605.637, -991.916, -823.969, 16),
(58, 'rp_mecklenburg_v2', 'La Banque', 4, 648.228, -1274.56, -672.031, 17),
(59, 'rp_mecklenburg_v2', 'La Banque', 4, 1098.85, -778.798, -672.031, 17),
(60, 'rp_mecklenburg_v2', 'Les Dealers', 3, 1622.46, -1858.24, -466.031, 18),
(61, 'rp_mecklenburg_v2', 'Les Dealers', 3, 2126.48, -2091.41, -601.232, 18),
(62, 'rp_mecklenburg_v2', 'Cellule de prison', 2, -2537.89, 2030.43, -696.031, 19),
(63, 'rp_mecklenburg_v2', 'Cellule de prison', 2, -2397.83, 2145.8, -823.969, 19),
(64, 'rp_mecklenburg_v2', 'Cellule de prison', 2, -2538.5, 2158.08, -696.031, 20),
(65, 'rp_mecklenburg_v2', 'Cellule de prison', 2, -2397.18, 2276.21, -823.969, 20),
(66, 'rp_mecklenburg_v2', 'Cellule de prison', 2, -2538.89, 2285.96, -696.031, 21),
(67, 'rp_mecklenburg_v2', 'Cellule de prison', 2, -2397.22, 2401.82, -823.969, 21),
(68, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -1556.34, 2452.95, -696.51, 22),
(69, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -2381.48, 1919.82, -696.031, 22),
(70, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -2381.01, 1919.73, -696.031, 23),
(71, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -2292.52, 2468.69, -823.969, 23),
(72, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -2539.36, 2786.53, -696.031, 24),
(73, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -1804.63, 2382.73, -823.969, 24),
(74, 'rp_mecklenburg_v2', 'Les Mafieux', 6, 1765.85, 2924.97, 62.4026, 25),
(75, 'rp_mecklenburg_v2', 'Les Mafieux', 6, 1473.28, 2657.75, -885.5, 25),
(76, 'rp_mecklenburg_v2', 'Les Mafieux', 6, 1773.92, 2908.28, -2200.03, 26),
(77, 'rp_mecklenburg_v2', 'Les Mafieux', 6, 1232.75, 2352.9, -2535.97, 26),
(78, 'rp_mecklenburg_v2', 'Les Mafieux', 6, 1742.65, 2014.49, -2216.03, 27),
(79, 'rp_mecklenburg_v2', 'Les Mafieux', 6, 1489.46, 2683.77, -2535.97, 27),
(80, 'rp_mecklenburg_v2', 'Les Bricoleurs', 5, -379.647, 1094.85, -631.969, 28),
(81, 'rp_mecklenburg_v2', 'Les Bricoleurs', 5, -173.227, 1277.27, -504.031, 28),
(82, 'rp_mecklenburg_v2', 'Les Bricoleurs', 5, -98.2109, 797.709, -711.031, 29),
(83, 'rp_mecklenburg_v2', 'Les Bricoleurs', 5, 120.303, 950.283, -879.969, 29),
(84, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -1556.25, 2452.95, -697.05, 30),
(85, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -2378.88, 1917.3, -823.969, 30),
(86, 'rp_mecklenburg_v2', 'La Banque', 4, 648.743, -1273.76, -672.031, 31),
(87, 'rp_mecklenburg_v2', 'La Banque', 4, 1097.69, -779.623, -823.969, 31),
(88, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -1557.2, 2451.79, -696.031, 32),
(89, 'rp_mecklenburg_v2', 'Le Commissariat', 2, -2378.62, 1916.53, -823.969, 32),
(90, 'rp_mecklenburg_v2', 'L\'Armurerie', 7, -1893.27, 365.3, -752.031, 33),
(91, 'rp_mecklenburg_v2', 'L\'Armurerie', 7, -2321.72, -639.504, -879.969, 33),
(92, 'rp_mecklenburg_v2', 'Palais de Justice', 8, -988.679, -2042.4, -887.969, 34),
(93, 'rp_mecklenburg_v2', 'Palais de Justice', 8, -1504.9, -2631.37, 148.969, 34),
(94, 'rp_mecklenburg_v2', 'L\'Hopital', 9, 1068.6, 1657.62, -592.969, 35),
(95, 'rp_mecklenburg_v2', 'L\'Hopital', 9, 1899.74, 822.969, -876.709, 35),
(96, 'rp_mecklenburg_v2', 'Les Dealers', 3, 1623.38, -1857.22, -466.031, 36),
(97, 'rp_mecklenburg_v2', 'Les Dealers', 3, 2124.55, -2090.42, -601.969, 36);

-- --------------------------------------------------------

--
-- Structure de la table `inventory`
--

CREATE TABLE `inventory` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `cs_weapon_id` varchar(150) NOT NULL,
  `seller_job_id` int DEFAULT NULL,
  `seller_rank_id` int NOT NULL,
  `price` int NOT NULL DEFAULT '100',
  `show_in_inventory` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`id`, `item_name`, `cs_weapon_id`, `seller_job_id`, `seller_rank_id`, `price`, `show_in_inventory`) VALUES
(1, 'Champignons', '', 3, -1, 300, 1),
(2, 'Meth', '', 3, -1, 400, 1),
(3, 'Compte bancaire', '', 4, -1, 500, 0),
(4, 'Pied de biche', '', 5, -1, 350, 1),
(5, 'Ak-47', 'weapon_ak47', 7, -1, 1000, 1),
(6, 'Munitions', '', 7, -1, 250, 1),
(7, 'M4a1', 'weapon_m4a1', 7, -1, 1200, 1),
(8, 'Benelli M3', 'weapon_m3', 7, -1, 950, 1),
(9, 'Scout', 'weapon_scout', 7, -1, 850, 1),
(10, 'AWP', 'weapon_awp', 7, -1, 1700, 1),
(11, 'AUG', 'weapon_aug', 7, -1, 1350, 1),
(12, 'Glock', 'weapon_glock', 7, -1, 650, 1),
(13, 'USP', 'weapon_usp', 7, -1, 700, 1),
(14, 'Desert Eagle', 'weapon_deagle', 7, -1, 850, 1),
(15, 'Five Seven', 'weapon_fiveseven', 7, -1, 800, 1),
(16, 'Serrure electronique', '', 5, -1, 450, 1),
(17, 'Kit de crochetage', '', NULL, -1, 0, 1),
(18, 'Cannabis', '', 3, -1, 350, 1),
(19, 'Cocaine', '', 3, -1, 500, 1),
(20, 'Lunettes de vision nocturne', '', 5, -1, 300, 1),
(21, 'Controleur de webcam a distance', '', 10, -1, 800, 0),
(22, 'Console de piratage pour Webcam', '', 10, -1, 1500, 1),
(23, 'RIB', '', 4, -1, 600, 0),
(24, 'Card Skimmer', '', 10, -1, 1500, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` int NOT NULL,
  `job_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `quota` int NOT NULL DEFAULT '15',
  `capital` int NOT NULL DEFAULT '100000',
  `enable_capital` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`id`, `job_name`, `quota`, `capital`, `enable_capital`) VALUES
(1, 'Pole Emploi', 0, 0, 0),
(2, 'Police', 15, 2804, 1),
(3, 'Dealers', 15, 8600, 1),
(4, 'Banque', 15, 10656, 1),
(5, 'Bricoleurs', 15, 8837, 1),
(6, 'Mafia', 15, 1883, 1),
(7, 'Armurerie', 15, 29005, 1),
(8, 'Justice', 15, 10000, 1),
(9, 'Hopital', 15, 10000, 1),
(10, 'Informatique', 15, 23004, 1),
(11, 'Wildlings', 15, 10000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

CREATE TABLE `players` (
  `id` int NOT NULL,
  `steam_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `username` varchar(129) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `job_id` int DEFAULT '1',
  `rank_id` int DEFAULT '1',
  `money` int DEFAULT '5000',
  `dirty_money` int NOT NULL DEFAULT '0',
  `bank` int DEFAULT '0',
  `reputation` int NOT NULL DEFAULT '100',
  `last_log_time` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ranks`
--

CREATE TABLE `ranks` (
  `id` int NOT NULL,
  `rank_id` int NOT NULL DEFAULT '1',
  `job_id` int NOT NULL,
  `rank_name` varchar(50) NOT NULL DEFAULT '',
  `rank_team` int NOT NULL DEFAULT '2',
  `salary` int NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ranks`
--

INSERT INTO `ranks` (`id`, `rank_id`, `job_id`, `rank_name`, `rank_team`, `salary`) VALUES
(1, 1, 1, 'Chomeur', 2, 150),
(2, 1, 2, 'Major', 3, 800),
(3, 2, 2, 'Major excep.', 3, 150),
(4, 1, 3, 'Baron de la drogue', 2, 700),
(5, 1, 4, 'Chef Banquier', 2, 150),
(6, 1, 5, 'Chef Bricoleur', 2, 500),
(7, 2, 5, 'Co.Chef Bricoleur', 2, 400),
(8, 3, 5, 'Bricoleur', 2, 300),
(9, 4, 5, 'Apprenti Bricoleur', 2, 200),
(10, 1, 6, 'Don', 2, 1500),
(11, 2, 6, 'Consigliere', 2, 800),
(12, 3, 6, 'Segundo', 2, 600),
(13, 4, 6, 'Capodecina', 2, 500),
(14, 5, 6, 'Soldado', 2, 400),
(15, 3, 2, 'Policier', 3, 300),
(16, 4, 2, 'Gardien de la paix', 3, 200),
(17, 1, 7, 'Chef Armurier', 2, 500),
(18, 2, 7, 'Co. Chef Armurier', 2, 400),
(19, 3, 7, 'Armurier', 2, 1000),
(20, 4, 7, 'Apprenti Armurier', 2, 200),
(21, 2, 3, 'Co.B. de la drogue', 2, 400),
(22, 3, 3, 'Dealer', 2, 300),
(23, 4, 3, 'Apprenti Dealer', 2, 200),
(24, 2, 4, 'Co.C. Banque', 2, 400),
(25, 3, 4, 'Banquier', 2, 300),
(26, 4, 4, 'Apprenti Banquier', 2, 200),
(27, 1, 8, 'President Justice', 3, 500),
(28, 2, 8, 'Juge', 3, 400),
(29, 3, 8, 'Avocat', 2, 300),
(30, 1, 9, 'Directeur Hopital', 2, 500),
(31, 2, 9, 'Directeur Adj. Hopital', 2, 400),
(32, 3, 9, 'Chirurgien', 2, 300),
(33, 4, 9, 'Medecin', 2, 200),
(34, 5, 9, 'Infirmier', 2, 150),
(35, 1, 10, 'Responsable Info', 2, 500),
(36, 2, 10, 'Admin Systeme', 2, 400),
(37, 3, 10, 'Informaticien', 2, 300),
(38, 1, 11, 'Boss Wildling', 2, 500),
(39, 2, 11, 'Second Wildling', 2, 400),
(40, 3, 11, 'Wildling', 2, 300),
(41, 4, 11, 'Jeune Wildlings', 2, 200);

-- --------------------------------------------------------

--
-- Structure de la table `salary`
--

CREATE TABLE `salary` (
  `id` int NOT NULL,
  `job_id` int NOT NULL,
  `rank_id` int NOT NULL,
  `salary` int NOT NULL DEFAULT '50'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salary`
--

INSERT INTO `salary` (`id`, `job_id`, `rank_id`, `salary`) VALUES
(1, 1, 1, 50),
(2, 2, 2, 250);

-- --------------------------------------------------------

--
-- Structure de la table `spawns`
--

CREATE TABLE `spawns` (
  `id` int NOT NULL,
  `map` varchar(150) NOT NULL,
  `spawn_name` varchar(200) NOT NULL DEFAULT 'spawn',
  `pos_x` float NOT NULL DEFAULT '0',
  `pos_y` float NOT NULL DEFAULT '0',
  `pos_z` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `spawns`
--

INSERT INTO `spawns` (`id`, `map`, `spawn_name`, `pos_x`, `pos_y`, `pos_z`) VALUES
(1, 'rp_mgk_b2', 'spawns', -1541.43, -814.243, -1431.97),
(2, 'rp_mgk_b2', 'jails', -151.912, -1650.35, -1367.97),
(3, 'rp_mgk_b2', 'jails', -160.281, -1211.09, -1367.97),
(4, 'rp_mgk_b2', 'jails', 8.79485, -1221.16, -1367.97),
(5, 'rp_mgk_b2', 'jails', 1.6997, -1630.61, -1367.97),
(6, 'rp_mgk_b2', 'spawns', -1382.16, -2912.9, -1305.4),
(7, 'rp_mecklenburg_v2', 'spawns', -630.895, 1047.85, -887.969),
(8, 'rp_mecklenburg_v2', 'spawns', -1966.29, -1660.77, -887.969),
(9, 'rp_mecklenburg_v2', 'spawns', -112.206, -139.61, -887.969),
(10, 'rp_mecklenburg_v2', 'spawns', 2480.34, 1946.33, -879.969),
(11, 'rp_mecklenburg_v2', 'spawns', 658.644, 2685.91, -884.292),
(12, 'rp_mecklenburg_v2', 'spawns', -1510.71, 1706.73, -887.969),
(13, 'rp_mecklenburg_v2', 'jails', -2485.33, 2199.8, -823.969),
(14, 'rp_mecklenburg_v2', 'jails', -2465.51, 2321.91, -823.969),
(15, 'rp_mecklenburg_v2', 'jails', -2490.05, 2065.34, -823.969),
(16, 'rp_mecklenburg_v2', 'spawns', 1191.31, -2125.65, -575.969);

-- --------------------------------------------------------

--
-- Structure de la table `world_entities`
--

CREATE TABLE `world_entities` (
  `id` int NOT NULL,
  `map` varchar(200) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `pos_x` float NOT NULL DEFAULT '0',
  `pos_y` float NOT NULL DEFAULT '0',
  `pos_z` float NOT NULL DEFAULT '0',
  `ang_x` float NOT NULL DEFAULT '0',
  `ang_y` float NOT NULL DEFAULT '0',
  `ang_z` float NOT NULL DEFAULT '0',
  `model` varchar(400) NOT NULL DEFAULT 'models/deadlydesire/props/atm01.mdl'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `world_entities`
--

INSERT INTO `world_entities` (`id`, `map`, `name`, `pos_x`, `pos_y`, `pos_z`, `ang_x`, `ang_y`, `ang_z`, `model`) VALUES
(3, 'rp_mgk_b2', 'distributeur', -635.527, 1336, -1303.97, 0, -90.3793, 0, 'models/deadlydesire/props/atm01.mdl'),
(4, 'rp_mgk_b2', 'distributeur', -1430.97, 856.016, -1303.97, 0, 0.518007, 0, 'models/deadlydesire/props/atm01.mdl'),
(5, 'rp_mgk_b2', 'distributeur', 1720.97, -203.937, -1303.97, 0, 176.893, 0, 'models/deadlydesire/props/atm01.mdl'),
(6, 'rp_mgk_b2', '3', 1083.44, -1223.97, -1303.97, -0.402668, 0, 0, 'models/deadlydesire/props/atm01.mdl'),
(7, 'rp_mgk_b2', 'distributeur', 1231.36, -1223.97, -1303.97, -0.402668, 0, 0, 'models/deadlydesire/props/atm01.mdl'),
(8, 'rp_mgk_b2', 'distributeur', -1278.97, -2229.42, -1303.97, -1.49573, -90, 0, 'models/deadlydesire/props/atm01.mdl'),
(9, 'rp_mgk_b2', 'distributeur', -958.981, -2807.97, -1303.97, 1.6109, 0, 0, 'models/deadlydesire/props/atm01.mdl'),
(10, 'rp_mgk_b2', 'distributeur', 1008.97, -1786.85, -1303.97, -1.26559, 90, 0, 'models/deadlydesire/props/atm01.mdl'),
(11, 'rp_mgk_b2', 'distributeur', 1466.98, -1223.97, -1303.97, -2.18606, 0, 0, 'models/deadlydesire/props/atm01.mdl'),
(12, 'rp_mgk_b2', 'distributeur', 1720.81, -148.59, -1303.97, 2.41627, 89.0107, 0, 'models/deadlydesire/props/atm01.mdl'),
(13, 'rp_mgk_b2', 'distributeur', -479.031, -1082.76, -1412.4, 0, 86.7094, 0, 'models/deadlydesire/props/atm01.mdl'),
(14, 'rp_mgk_b2', 'distributeur', -2110.99, -654.98, -1431.97, 0, -90.9206, 0, 'models/deadlydesire/props/atm01.mdl'),
(15, 'rp_mgk_b2', 'distributeur', -1984.31, -456.031, -1431.97, 0, -177.216, 0, 'models/deadlydesire/props/atm01.mdl'),
(16, 'rp_mgk_b2', 'caisse_comico', 384.969, -1613.42, -1303.97, 0, 88.5418, 0, 'models/items/ammocrate_ar2.mdl'),
(17, 'rp_mgk_b2', 'caisse_kit', 490.124, 1289.28, -1303.97, 0, 0, 0, 'models/items/ammocrate_ar2.mdl'),
(18, 'rp_mecklenburg_v2', 'caisse_kit', 1759.97, 2330.48, -2520, 0, 180, 0, 'models/items/ammocrate_ar2.mdl'),
(19, 'rp_mecklenburg_v2', 'caisse_kit', 1634.18, 2892.97, -2335, 0, -90, 0, 'models/items/ammocrate_ar2.mdl'),
(20, 'rp_mecklenburg_v2', 'caisse_kit', 1759.97, 2550.35, -2520, 0, 180, 0, 'models/items/ammocrate_ar2.mdl'),
(21, 'rp_mecklenburg_v2', 'caisse_comico', -2140.22, 2596.99, -805, 0, 90, 0, 'models/items/ammocrate_ar2.mdl'),
(22, 'rp_mecklenburg_v2', 'distributeur', -1403.97, 1956.69, -886, 0, -90, 0, 'models/deadlydesire/props/atm01.mdl'),
(23, 'rp_mecklenburg_v2', 'distributeur', -1613.94, 1062.97, -885.969, 0, -180, 0, 'models/deadlydesire/props/atm01.mdl'),
(24, 'rp_mecklenburg_v2', 'distributeur', 636.022, -694.817, -823.964, 0, -90, 0, 'models/deadlydesire/props/atm01.mdl'),
(25, 'rp_mecklenburg_v2', 'distributeur', 1068.14, -694.817, -823.39, 0, -270, 0, 'models/deadlydesire/props/atm01.mdl'),
(26, 'rp_mecklenburg_v2', 'distributeur', 1529.65, -1321, -569.969, 0, -180, 0, 'models/deadlydesire/props/atm01.mdl'),
(27, 'rp_mecklenburg_v2', 'distributeur', 347.064, 514, -867.041, 0, 0, 0, 'models/deadlydesire/props/atm01.mdl'),
(28, 'rp_mecklenburg_v2', 'distributeur', 427.044, 514, -867.041, 0, -1.04738, 0, 'models/deadlydesire/props/atm01.mdl');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_player_id` (`player_id`);

--
-- Index pour la table `accounting`
--
ALTER TABLE `accounting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_activities_seller_job_id` (`seller_job_id`);

--
-- Index pour la table `capital`
--
ALTER TABLE `capital`
  ADD KEY `fk_job_id_capital` (`job_id`);

--
-- Index pour la table `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doors`
--
ALTER TABLE `doors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hammer_id` (`hammer_id`),
  ADD KEY `fk_job_id_door` (`job_id`),
  ADD KEY `fk_rank_id_door` (`rank_id`);

--
-- Index pour la table `hideout`
--
ALTER TABLE `hideout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_planque_job_id` (`job_id`);

--
-- Index pour la table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_player_id_bags` (`player_id`),
  ADD KEY `fk_item_id_inventory` (`item_id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seller_job_id` (`seller_job_id`),
  ADD KEY `fk_seller_rank_id` (`seller_rank_id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_job_id_player` (`job_id`);

--
-- Index pour la table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_job_id` (`job_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Index pour la table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_job_id_salary` (`job_id`),
  ADD KEY `fk_rank_id_salary` (`rank_id`);

--
-- Index pour la table `spawns`
--
ALTER TABLE `spawns`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `world_entities`
--
ALTER TABLE `world_entities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `account`
--
ALTER TABLE `account`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `accounting`
--
ALTER TABLE `accounting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `date`
--
ALTER TABLE `date`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `doors`
--
ALTER TABLE `doors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT pour la table `hideout`
--
ALTER TABLE `hideout`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT pour la table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `players`
--
ALTER TABLE `players`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ranks`
--
ALTER TABLE `ranks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `spawns`
--
ALTER TABLE `spawns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `world_entities`
--
ALTER TABLE `world_entities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `fk_player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `fk_activities_seller_job_id` FOREIGN KEY (`seller_job_id`) REFERENCES `jobs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `capital`
--
ALTER TABLE `capital`
  ADD CONSTRAINT `fk_job_id_capital` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `doors`
--
ALTER TABLE `doors`
  ADD CONSTRAINT `fk_job_id_door` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `hideout`
--
ALTER TABLE `hideout`
  ADD CONSTRAINT `fk_planque_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_item_id_inventory` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_player_id_bags` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_seller_job_id` FOREIGN KEY (`seller_job_id`) REFERENCES `jobs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `fk_job_id_player` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `ranks`
--
ALTER TABLE `ranks`
  ADD CONSTRAINT `fk_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `fk_job_id_salary` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_rank_id_salary` FOREIGN KEY (`rank_id`) REFERENCES `ranks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
