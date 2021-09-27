-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 24 sep. 2021 à 11:38
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ls`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `loginadmin` varchar(10) NOT NULL,
  `mdp` varchar(150) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `numtele` varchar(11) NOT NULL,
  PRIMARY KEY (`loginadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`loginadmin`, `mdp`, `nom`, `prenom`, `adresse`, `numtele`) VALUES
('ali1', 'ali123456', 'salhi', 'ali', 'fi darhoum', '0659439677');

-- --------------------------------------------------------

--
-- Structure de la table `colis`
--

DROP TABLE IF EXISTS `colis`;
CREATE TABLE IF NOT EXISTS `colis` (
  `id_colis` varchar(20) NOT NULL,
  `nom_produit` varchar(50) NOT NULL,
  `quantite` int(20) NOT NULL,
  `prix_t` int(10) NOT NULL,
  `note_colis` varchar(50) NOT NULL,
  `etat_colis` set('Confirmer','Annuler','Nerépondpas') DEFAULT NULL,
  `loginname` varchar(20) DEFAULT NULL,
  `id_fournisseur` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_colis`),
  KEY `loginname` (`loginname`),
  KEY `id_fournisseur` (`id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `colis`
--

INSERT INTO `colis` (`id_colis`, `nom_produit`, `quantite`, `prix_t`, `note_colis`, `etat_colis`, `loginname`, `id_fournisseur`) VALUES
('BBS', 'BalonBasket', 2, 4000, 'volumineux ', NULL, 'RB11', 'basketeur16'),
('BBS2', 'BalonBasket', 2, 4000, 'volumineux ', NULL, 'RB11', 'basketeur16'),
('chocoAlg', 'chocolat', 5, 1000, 'garder le dans un champ froid', 'Confirmer', 'Abdellahrb', 'said1'),
('faith', 'FaithAlbum', 1, 99, 'fragile', NULL, NULL, 'popsmoke'),
('iphone12', 'iphone12', 1, 100000, 'fragile', NULL, NULL, 'rabah3'),
('iphone13', 'iphone13', 1, 120000, 'fragile', NULL, NULL, 'mouliphone'),
('iphone16', 'iphone15', 1, 120000, 'fragile', NULL, NULL, 'mouliphone'),
('RomanH', 'Roman', 1, 500, 'papiers', 'Annuler', 'Abdellahrb', 'abdelhamid16R'),
('sapiensRB', 'sapiens1', 1, 1000, 'papiers', NULL, NULL, 'sapiensrbr');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_fournisseur` varchar(20) NOT NULL,
  `wilaya` varchar(30) DEFAULT NULL,
  `commune` varchar(30) DEFAULT NULL,
  `numtele` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fournisseur`, `wilaya`, `commune`, `numtele`) VALUES
('abdelhamid16R', 'Alger', 'Belcourt', 540121212),
('basketeur16', 'Alger', 'Kouba', 560121213),
('moul iphone', 'Alger', 'Kouba', 560121215),
('mouliphone', 'Alger', 'Kouba', 745454545),
('mouliphone14', 'Alger', 'Kouba', 745454588),
('mouliphone15', 'Alger', 'Kouba', 560121212),
('mouliphoneaaa', 'Alger', 'Kouba', 745454545),
('mouuuukrane', 'Alger', 'Kouba', 745454545),
('popsmoke', 'Alger', 'guÃ© de constantine', 540121212),
('rabah3', 'Alger', 'Kouba', 560121212),
('said1', 'Alger', 'Kouba', 560121212),
('sapiensrbr', 'alger', 'Kouba', 554603298);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `id_livraison` int(20) NOT NULL AUTO_INCREMENT,
  `date_livraison` date DEFAULT NULL,
  `adresse_livraison` varchar(100) DEFAULT NULL,
  `id_colis` varchar(20) DEFAULT NULL,
  `tarif_livraison` int(20) DEFAULT NULL,
  `benefices_livreur` int(20) DEFAULT NULL,
  `benefices_ls` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_livraison`),
  KEY `id_colis` (`id_colis`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id_livraison`, `date_livraison`, `adresse_livraison`, `id_colis`, `tarif_livraison`, `benefices_livreur`, `benefices_ls`) VALUES
(61, '2021-09-10', 'place 11 dÃ©cembre', 'RomanH', 1500, 500, 500),
(63, '2021-09-05', 'hai al badre', 'chocoAlg', 2000, 500, 500),
(65, '2021-09-05', 'hai al badre', 'BBS', 5000, 500, 500),
(66, '2021-09-05', 'hai al badre', 'BBS2', 5000, 500, 500),
(73, '2021-09-17', 'vieux kouba', 'iphone12', 101000, 500, 500),
(76, '2021-09-08', 'vieux kouba', 'iphone13', 121000, 500, 500),
(80, '2021-09-16', 'vieux kouba', 'iphone16', 121000, 500, 500),
(82, '2021-09-19', 'hai albadre', 'sapiensRB', 2000, 500, 500),
(83, '2021-09-18', 'hai al badre', 'faith', 1099, 500, 500);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `loginname` varchar(20) NOT NULL,
  `mdp` varchar(200) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `wilaya` varchar(50) NOT NULL,
  `commune` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `numtele` int(11) NOT NULL,
  `indadmin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`loginname`),
  KEY `indadmin` (`indadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`loginname`, `mdp`, `nom`, `prenom`, `wilaya`, `commune`, `adresse`, `numtele`, `indadmin`) VALUES
('Abdellahrb', '$2y$10$VWxD220MvC475DYfr4uptOQfIk6yCVOR4mUB0AUoojZzGCrBtXq8u', 'Reguieg belarbi', 'Abdellah', 'Alger', 'guÃ© de constantine', 'chez moi', 540111111, NULL),
('RB11', '$2y$10$WDfBehztgc1t2BGAx/k/0uZ267z0eAwtEW404A/ggParCl/s.320e', 'R', 'Abdou', 'Alger', 'birkhadem', 'chez lui', 540898989, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `colis`
--
ALTER TABLE `colis`
  ADD CONSTRAINT `forgeinkey1` FOREIGN KEY (`loginname`) REFERENCES `livreur` (`loginname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forgeinkey2` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `forgeinkeyadmin3` FOREIGN KEY (`id_colis`) REFERENCES `colis` (`id_colis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `forgeinkeyadmin1` FOREIGN KEY (`indadmin`) REFERENCES `admin` (`loginadmin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
