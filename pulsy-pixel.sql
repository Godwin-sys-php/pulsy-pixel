-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 05 jan. 2024 à 19:05
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `pulsy-pixel`
--

-- --------------------------------------------------------

--
-- Structure de la table `Products`
--

CREATE TABLE `Products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Products`
--

INSERT INTO `Products` (`product_id`, `name`, `image`) VALUES
(1, 'PSN', '/images/logos/PSN.png'),
(2, 'Xbox', '/images/logos/XBOX.jpg'),
(3, 'Steam', '/images/logos/STEAM.webp'),
(4, 'iTunes', '/images/logos/ITUNES.png'),
(5, 'Amazon', '/images/logos/AMAZON.png');

-- --------------------------------------------------------

--
-- Structure de la table `ProductValues`
--

CREATE TABLE `ProductValues` (
  `value_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `value_in_dollar` float DEFAULT NULL,
  `selling_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ProductValues`
--

INSERT INTO `ProductValues` (`value_id`, `product_id`, `region_id`, `value`, `value_in_dollar`, `selling_price`) VALUES
(1, 1, 1, 5, 5.48, 9.5),
(2, 1, 1, 10, 10.95, 18),
(3, 1, 1, 20, 21.91, 26),
(4, 1, 1, 30, 32.86, 36.5),
(5, 1, 1, 50, 54.76, 57.5),
(6, 1, 1, 100, 109.53, 120),
(7, 1, 2, 5, 5.48, 9.5),
(8, 1, 2, 10, 10.95, 18),
(9, 1, 2, 20, 21.91, 26),
(10, 1, 2, 30, 32.86, 36.5),
(11, 1, 2, 50, 54.76, 57.5),
(12, 1, 2, 100, 109.53, 120),
(13, 1, 3, 5, 5, 8),
(14, 1, 3, 10, 10, 16),
(15, 1, 3, 20, 20, 24.5),
(16, 1, 3, 30, 30, 38),
(17, 1, 3, 50, 50, 57.5),
(18, 1, 3, 100, 100, 114),
(19, 1, 4, 5, 5.88, 9),
(20, 1, 4, 10, 11.76, 16.5),
(21, 1, 4, 20, 23.53, 29.5),
(22, 1, 4, 30, 35.29, 38.5),
(23, 1, 4, 50, 58.82, 66.5),
(24, 1, 4, 100, 117.65, 135),
(25, 1, 5, 5, 3.75, 8.5),
(26, 1, 5, 10, 7.5, 14),
(27, 1, 5, 20, 15.01, 22.5),
(28, 1, 5, 30, 22.51, 32),
(29, 1, 5, 50, 37.52, 45),
(30, 1, 5, 100, 75.05, 105),
(31, 1, 6, 100, 6.78, 15),
(32, 1, 6, 200, 11.56, 20),
(33, 1, 6, 500, 28.55, 40),
(34, 1, 6, 1000, 58.5, 71.5),
(35, 2, 1, 5, 5.48, 9.5),
(36, 2, 1, 10, 10.95, 18),
(37, 2, 1, 20, 21.91, 26),
(38, 2, 1, 30, 32.86, 36.5),
(39, 2, 1, 50, 54.76, 57.5),
(40, 2, 1, 100, 109.53, 120),
(41, 2, 2, 5, 5.48, 9.5),
(42, 2, 2, 10, 10.95, 18),
(43, 2, 2, 20, 21.91, 26),
(44, 2, 2, 30, 32.86, 36.5),
(45, 2, 2, 50, 54.76, 57.5),
(46, 2, 2, 100, 109.53, 120),
(47, 2, 3, 5, 5, 8),
(48, 2, 3, 10, 10, 16),
(49, 2, 3, 20, 20, 24.5),
(50, 2, 3, 30, 30, 38),
(51, 2, 3, 50, 50, 57.5),
(52, 2, 3, 100, 100, 114),
(53, 2, 4, 5, 5.88, 9),
(54, 2, 4, 10, 11.76, 16.5),
(55, 2, 4, 20, 23.53, 29.5),
(56, 2, 4, 30, 35.29, 38.5),
(57, 2, 4, 50, 58.82, 66.5),
(58, 2, 4, 100, 117.65, 135),
(59, 2, 5, 5, 3.75, 8.5),
(60, 2, 5, 10, 7.5, 14),
(61, 2, 5, 20, 15.01, 22.5),
(62, 2, 5, 30, 22.51, 32),
(63, 2, 5, 50, 37.52, 45),
(64, 2, 5, 100, 75.05, 105),
(65, 2, 6, 100, 6.78, 15),
(66, 2, 6, 200, 11.56, 20),
(67, 2, 6, 500, 28.55, 40),
(68, 2, 6, 1000, 58.5, 71.5),
(69, 3, 7, 5, 6.42, 11.5),
(70, 3, 7, 10, 11.29, 15),
(71, 3, 7, 20, 22.57, 27),
(72, 3, 7, 50, 56.15, 64.5),
(73, 3, 7, 100, 109.53, 130),
(74, 3, 3, 5, 5.45, 9.5),
(75, 3, 3, 10, 10.28, 17),
(76, 3, 3, 20, 20.75, 24.5),
(77, 3, 3, 50, 51.35, 59),
(78, 3, 3, 75, 77.5, 80),
(79, 3, 3, 100, 102.05, 114),
(80, 3, 6, 150, 10.46, 20),
(81, 3, 6, 250, 17.4, 24),
(82, 3, 6, 500, 34.8, 42),
(83, 4, 1, 5, 5.78, 11.5),
(84, 4, 1, 10, 11.56, 17),
(85, 4, 1, 15, 17.37, 23),
(86, 4, 1, 25, 28.9, 36.5),
(87, 4, 1, 50, 57.8, 70),
(88, 4, 1, 100, 114.45, 135),
(89, 4, 3, 5, 5, 9.5),
(90, 4, 3, 10, 10, 17),
(91, 4, 3, 20, 20, 24.5),
(92, 4, 3, 50, 50, 59),
(93, 4, 3, 70, 70, 77.5),
(94, 4, 3, 100, 100, 120),
(95, 4, 5, 5, 3.95, 8.5),
(96, 4, 5, 10, 7.5, 15),
(97, 4, 5, 25, 19.1, 30),
(98, 4, 5, 50, 38.2, 45),
(99, 4, 5, 100, 76.38, 85),
(100, 4, 2, 15, 17.37, 23),
(101, 4, 2, 25, 28.9, 36.5),
(102, 4, 2, 50, 57.8, 70),
(103, 4, 2, 100, 114.45, 135),
(104, 5, 1, 10, 11.45, 15.5),
(105, 5, 1, 25, 28.63, 37),
(106, 5, 1, 50, 57.25, 65),
(107, 5, 1, 100, 114.5, 120),
(108, 5, 2, 10, 12, 16),
(109, 5, 2, 25, 30.06, 37),
(110, 5, 2, 50, 60.11, 65),
(111, 5, 2, 100, 120, 127),
(112, 5, 3, 5, 5.25, 8.5),
(113, 5, 3, 10, 10.4, 15),
(114, 5, 3, 25, 26, 35),
(115, 5, 3, 50, 52, 60),
(116, 5, 3, 100, 103.9, 120);

-- --------------------------------------------------------

--
-- Structure de la table `Regions`
--

CREATE TABLE `Regions` (
  `region_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Regions`
--

INSERT INTO `Regions` (`region_id`, `name`, `currency`, `color`, `flag`) VALUES
(1, 'France', '€', 'indigo', '/images/flags/france.png'),
(2, 'Belgique', '€', 'yellow', '/images/flags/belgium.png'),
(3, 'USA', '$', 'blue', '/images/flags/united-states.png'),
(4, 'Suisse', 'CHF', 'red', '/images/flags/switzerland.png'),
(5, 'Canada', 'CAD', 'pink', '/images/flags/canada.png'),
(6, 'SA', 'ZAR', 'green', '/images/flags/south-africa.png'),
(7, 'UE', '€', 'indigo', '/images/flags/eu.png');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`product_id`);

--
-- Index pour la table `ProductValues`
--
ALTER TABLE `ProductValues`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Index pour la table `Regions`
--
ALTER TABLE `Regions`
  ADD PRIMARY KEY (`region_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Products`
--
ALTER TABLE `Products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `ProductValues`
--
ALTER TABLE `ProductValues`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT pour la table `Regions`
--
ALTER TABLE `Regions`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ProductValues`
--
ALTER TABLE `ProductValues`
  ADD CONSTRAINT `productvalues_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`),
  ADD CONSTRAINT `productvalues_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `Regions` (`region_id`);
COMMIT;
