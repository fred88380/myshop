-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 04 fév. 2025 à 12:09
-- Version du serveur : 8.0.41-0ubuntu0.24.04.1
-- Version de PHP : 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `myshop`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Boitier'),
(2, 'Alimentation'),
(3, 'Disque dur'),
(4, 'Disque SSD'),
(5, 'Carte mère'),
(6, 'Carte graphique'),
(7, 'Mémoire'),
(8, 'Processeur'),
(9, 'Ventirad'),
(10, 'Carte réseau');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(19,2) NOT NULL,
  `quantity` int NOT NULL,
  `category` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `quantity`, `category`) VALUES
(1, 'Aerocool Bolt', 59.95, 5, 1),
(2, 'Aerocool Bolt Mini (Noir)', 53.50, 7, 1),
(3, 'Antec DF600 FLUX', 106.95, 6, 1),
(4, 'Antec DP501', 64.96, 4, 1),
(5, 'be quiet! Silent Base 802 Window (Noir)', 208.95, 3, 1),
(6, 'be quiet! Silent Base 802 Window (Blanc)', 208.95, 0, 1),
(7, 'BitFenix Saber TG', 129.95, 2, 1),
(8, 'BitFenix Nova MESH SE TG ARGB (Noir)', 99.95, 0, 1),
(9, 'Fractal Design Define R6 Black', 219.95, 1, 1),
(10, 'IN WIN 301C Blanc', 89.95, 5, 1),
(11, 'IN WIN 301C Noir', 99.95, 6, 1),
(12, 'Aerocool Aero Bronze 550W', 69.95, 3, 2),
(13, 'Aerocool Cylon 700W', 89.95, 1, 2),
(14, 'Antec EA650G PRO', 98.95, 3, 2),
(15, 'Antec EA750G PRO (Blanc)', 104.95, 1, 2),
(16, 'ASUS ROG-STRIX-650G 80PLUS Gold', 169.96, 4, 2),
(17, 'ASUS TUF-GAMING-650B 80PLUS Bronze', 99.95, 8, 2),
(18, 'be quiet! Dark Power Pro 11 550W 80PLUS Platinum', 156.95, 4, 2),
(19, 'be quiet! Pure Power 11 350W 80PLUS Bronze', 57.95, 9, 2),
(20, 'Seasonic PRIME GX-650', 149.95, 6, 2),
(21, 'Seasonic PRIME Titanium Fanless 600W', 269.95, 1, 2),
(22, 'Seagate BarraCuda 1 To (ST1000DM010)', 49.94, 12, 3),
(23, 'Seagate BarraCuda 4 To (ST4000LM024)', 189.95, 6, 3),
(24, 'Seagate IronWolf Pro 8 To', 309.95, 3, 3),
(25, 'Seagate SkyHawk 6 To (ST6000VX001)', 189.95, 9, 3),
(26, 'Toshiba N300 8 To (HDWG180EZSTAU)', 199.96, 10, 3),
(27, 'Toshiba S300 10 To', 379.96, 3, 3),
(28, 'Toshiba X300 16 To', 599.95, 6, 3),
(29, 'Western Digital Ultrastar DC HC550 18 To', 649.94, 2, 3),
(30, 'Western Digital WD Black Desktop 1 To SATA 6Gb/s', 92.95, 11, 3),
(31, 'Western Digital WD Blue 4 To', 103.96, 15, 4),
(32, 'Kingston DC1500M 1920 Go', 524.95, 1, 4),
(33, 'Kingston DC1500M 3840 Go', 914.95, 0, 4),
(34, 'Kingston SSD DC1000B 240 Go', 83.95, 7, 4),
(35, 'AORUS Gen4 7000s SSD 1 To', 239.95, 2, 4),
(36, 'AORUS NVMe Gen4 SSD 500 Go', 124.96, 3, 4),
(37, 'Corsair Force MP600 2 To', 424.96, 7, 4),
(38, 'Corsair Force MP600 Pro 1 To', 199.96, 4, 4),
(39, 'Crucial BX500 1 To', 109.96, 9, 4),
(40, 'Crucial MX500 2 To', 229.96, 6, 4),
(41, 'Samsung SSD 970 EVO Plus M.2 PCIe NVMe 2 To', 269.95, 3, 4),
(42, 'ASRock A320M Pro4-F', 77.95, 5, 5),
(43, 'ASRock B550 Pro4', 161.95, 6, 5),
(44, 'ASUS PRIME B660M-A WIFI D4', 184.95, 3, 5),
(45, 'ASUS ROG MAXIMUS Z690 HERO', 649.96, 4, 5),
(46, 'Gigabyte H510M H', 89.95, 6, 5),
(47, 'Gigabyte Z590 GAMING X', 199.96, 2, 5),
(48, 'MSI MPG Z690 FORCE WIFI DDR5', 479.95, 7, 5),
(49, 'MSI X470 GAMING PLUS MAX', 144.95, 6, 5),
(50, 'NZXT N7 Z590 - Noir', 319.96, 1, 5),
(51, 'NZXT N7 Z490 - Noir', 249.95, 0, 5),
(52, 'ASUS DUAL GeForce RTX 3050 O8G (LHR)', 479.95, 2, 6),
(53, 'ASUS GeForce RTX 2060 DUAL-RTX2060-12G-EVO', 549.95, 3, 6),
(54, 'Gigabyte GeForce RTX 3080 Ti VISION OC 12G (LHR)', 1819.94, 0, 6),
(55, 'Gigabyte GeForce RTX 3090 GAMING OC 24G (LHR)', 2599.94, 1, 6),
(56, 'INNO3D GeForce RTX 3080 12GB ICHILL X4 LHR', 1499.95, 2, 6),
(57, 'INNO3D GeForce RTX 3080 Ti X3 OC LHR', 1599.95, 0, 6),
(58, 'KFA2 GeForce RTX 3060 Ti (1-Click OC) LHR', 669.95, 6, 6),
(59, 'KFA2 GeForce RTX 3050 EX (1-Click OC) LHR', 479.95, 1, 6),
(60, 'MSI GeForce RTX 3060 Ti VENTUS 3X 8G OC LHR', 699.95, 3, 6),
(61, 'MSI GeForce RTX 3070 VENTUS 2X 8G OC LHR', 849.95, 0, 6),
(62, 'Textorm 16 Go (2x 8 Go) DDR4 2666 MHz CL19', 85.94, 10, 7),
(63, 'Textorm 8 Go DDR4 2666 MHz CL19', 42.95, 12, 7),
(64, 'Ballistix Black 16 Go (2 x 8 Go) DDR4 3200 MHz CL16', 109.94, 5, 7),
(65, 'Ballistix Max RGB 16 Go (2 x 8 Go) DDR4 4000 MHz CL18', 249.95, 1, 7),
(66, 'Corsair Dominator Platinum DDR5 32 Go (2 x 16 Go) 5600 MHz CL36', 589.96, 2, 7),
(67, 'Corsair Value Select 16 Go (2x 8 Go) DDR3 1600 MHz CL11', 110.75, 13, 7),
(68, 'Crucial DDR4 64 Go (2 x 32 Go) 3200 MHz CL22 DR X8', 439.94, 2, 7),
(69, 'Crucial DDR4 16 Go 2933 MHz CL21 ECC Registered 2Rx8', 148.94, 0, 7),
(70, 'G.Skill Aegis 16 Go (2 x 8 Go) DDR4 2400 MHz CL17', 86.95, 3, 7),
(71, 'G.Skill NS Series 4 Go (kit 2x 2 Go) DDR3-SDRAM PC3-10600', 32.24, 3, 7),
(72, 'AMD Ryzen 5 3600 (3.6 GHz / 4.2 GHz)', 259.96, 4, 8),
(73, 'AMD Ryzen 5 5600X Wraith Stealth (3.7 GHz / 4.6 GHz)', 299.95, 6, 8),
(74, 'AMD Ryzen 7 5800X (3.8 GHz / 4.7 GHz)', 439.96, 5, 8),
(75, 'AMD EPYC 7302 (3.0 GHz)', 1369.94, 0, 8),
(76, 'AMD Ryzen Threadripper 3990X (4.3 GHz Max.)', 4499.95, 0, 8),
(77, 'Intel Core i3-10100 (3.6 GHz / 4.3 GHz)', 145.96, 8, 8),
(78, 'Intel Core i5-11400 (2.6 GHz / 4.4 GHz)', 239.95, 6, 8),
(79, 'Intel Core i5-11600K (3.9 GHz / 4.9 GHz)', 299.95, 10, 8),
(80, 'Intel Core i7-12700KF (3.6 GHz / 5.0 GHz)', 499.94, 7, 8),
(81, 'Intel Core i9-10980XE Extreme Edition (3.0 GHz / 4.6 GHz)', 1249.94, 0, 8);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
