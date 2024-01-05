-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 05 jan. 2024 à 13:00
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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
(1, 'PSN', 'http://localhost:3000/src/Logos/PSN.png');

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
(34, 1, 6, 1000, 58.5, 71.5);

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
(1, 'France', '€', 'indigo', '/assets/france.png'),
(2, 'Belgique', '€', 'yellow', '/assets/belgium.png'),
(3, 'USA', '$', 'blue', '/assets/united-states.png'),
(4, 'Suisse', 'CHF', 'red', '/assets/switzerland.png'),
(5, 'Canada', 'CAD', 'pink', '/assets/canada.png'),
(6, 'SA', 'ZAR', 'green', '/assets/south-africa.png');

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
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ProductValues`
--
ALTER TABLE `ProductValues`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `Regions`
--
ALTER TABLE `Regions`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
