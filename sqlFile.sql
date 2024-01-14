-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 14 jan. 2024 à 21:25
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE
= "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone
= "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `isga`
--
CREATE DATABASE
IF NOT EXISTS `isga` DEFAULT CHARACTER
SET utf8mb4
COLLATE utf8mb4_general_ci;
USE `isga`;

-- --------------------------------------------------------

--
-- Structure de la table `account`
--

CREATE TABLE `account`
(
  `id` int
(20) NOT NULL,
  `accountNum` varchar
(20) NOT NULL,
  `codeClient` int
(20) NOT NULL,
  `solde` decimal
(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `account`
--

INSERT INTO `account` (`
id`,
`accountNum
`, `codeClient`, `solde`) VALUES
(1, '1001', 10, 90000),
(2, '1002', 12, 100000),
(3, '1003', 14, 900560),
(4, '1004', 15, 2000),
(5, '1005', 16, 100),
(6, '1006', 12, 8000),
(7, '10011', 12, 300),
(8, '1007', 15, 12000),
(9, '1008', 10, 5000),
(10, '1009', 18, 9500),
(11, '1010', 22, 7000);

-- --------------------------------------------------------

--
-- Structure de la table `clientinfo`
--

CREATE TABLE `clientinfo`
(
  `codeClient` int
(20) NOT NULL,
  `nomClient` varchar
(20) NOT NULL,
  `prenomClient` varchar
(20) NOT NULL,
  `telClient` int
(10) NOT NULL,
  `mailClient` varchar
(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clientinfo`
--

INSERT INTO `clientinfo` (`
codeClient`,
`nomClient
`, `prenomClient`, `telClient`, `mailClient`) VALUES
(10, 'john', 'karim', 159753468, 'john.lm@example.com'),
(12, 'Saad', 'abas', 618315969, 'saadlem@gmail.com'),
(14, 'Alice', 'Doe', 123456789, 'alice.doe@example.com'),
(15, 'Bob', 'Smith', 987654321, 'bob.smith@example.com'),
(16, 'Emma', 'Johnson', 456789123, 'emma.johnson@example.com'),
(17, 'James', 'Williams', 789123456, 'james.williams@example.com'),
(18, 'Sara', 'Jones', 321654987, 'sara.jones@example.com'),
(19, 'Michael', 'Brown', 654321789, 'michael.brown@example.com'),
(20, 'Linda', 'Davis', 987654123, 'linda.davis@example.com'),
(21, 'David', 'Taylor', 159753468, 'david.taylor@example.com');

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE `operation`
(
  `idOperation` int
(255) NOT NULL,
  `dateOperation` datetime NOT NULL,
  `typeOperation` varchar
(30) NOT NULL,
  `accountNum` varchar
(20) NOT NULL,
  `montant` decimal
(50,0) NOT NULL,
  `codeClient` varchar
(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `operation`
--

INSERT INTO `operation` (`
idOperation`,
`dateOperation
`, `typeOperation`, `accountNum`, `montant`, `codeClient`) VALUES
(11, '2024-01-14 09:00:00', 'retrait', '1001', 500, '10'),
(12, '2024-01-14 10:30:00', 'virement', '1002', 1500, '12'),
(13, '2024-01-14 12:15:00', 'dépot', '1003', 1000, '14'),
(14, '2024-01-14 14:45:00', 'retrait', '1004', 300, '15'),
(15, '2024-01-14 16:20:00', 'virement', '1005', 800, '16'),
(16, '2024-01-14 18:10:00', 'dépot', '1001', 700, '10'),
(17, '2024-01-14 20:40:00', 'retrait', '1002', 400, '12'),
(18, '2024-01-14 22:25:00', 'virement', '1003', 600, '14'),
(19, '2024-01-14 23:55:00', 'dépot', '1004', 200, '15'),
(20, '2024-01-15 01:30:00', 'retrait', '1005', 1000, '16'),
(21, '2024-01-14 21:12:25', 'virement', '1001', 5000, '12'),
(22, '2024-01-14 21:12:25', 'virement', '10011', 5000, '12'),
(23, '2024-01-14 22:30:00', 'virement', '10011', 7000, '12'),
(24, '2024-01-15 08:45:00', 'virement', '10011', 3000, '12'),
(25, '2024-01-15 12:15:00', 'virement', '10011', 4500, '12'),
(26, '2024-01-16 09:30:00', 'virement', '10011', 6000, '12'),
(27, '2024-01-16 14:45:00', 'retrait', '10011', 2000, '12'),
(28, '2024-01-17 10:00:00', 'retrait', '10011', 3000, '12'),
(29, '2024-01-17 15:20:00', 'retrait', '10011', 1500, '12'),
(30, '2024-01-18 11:30:00', 'retrait', '10011', 2500, '12'),
(31, '2024-01-18 16:45:00', 'retrait', '10011', 1800, '12');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user`
(
  `Id` int
(11) NOT NULL,
  `username` varchar
(20) NOT NULL,
  `password` varchar
(10000) NOT NULL,
  `codeClient` int
(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user`
  (`Id`, `username
  `, `password`, `codeClient`) VALUES
(1, 'saad', '347602146a923872538f3803eb5f3cef', 12),
(2, 'john', 'password2', 13),
(3, 'alice', 'password3', 14),
(4, 'bob', 'password4', 15),
(5, 'emma', 'password5', 16),
(6, 'james', 'password6', 17),
(7, 'sara', 'password7', 18),
(8, 'michael', 'password8', 19),
(9, 'linda', 'password9', 20),
(10, 'david', 'password10', 21);

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE `user_role`
(
  `id` int
(11) NOT NULL,
  `role` varchar
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_role`
--

INSERT INTO `user_role` (`
id`,
`role
`) VALUES
(1, 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `account`
--
ALTER TABLE `account`
ADD PRIMARY KEY
(`id`),
ADD UNIQUE KEY `accountNum`
(`accountNum`);

--
-- Index pour la table `clientinfo`
--
ALTER TABLE `clientinfo`
ADD UNIQUE KEY `codeClient`
(`codeClient`,`nomClient`,`prenomClient`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
ADD PRIMARY KEY
(`idOperation`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
ADD PRIMARY KEY
(`Id`);

--
-- Index pour la table `user_role`
--
ALTER TABLE `user_role`
ADD PRIMARY KEY
(`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `account`
--
ALTER TABLE `account`
  MODIFY `id` int
(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `operation`
--
ALTER TABLE `operation`
  MODIFY `idOperation` int
(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
