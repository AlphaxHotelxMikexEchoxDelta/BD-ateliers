
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varbinary(255) NOT NULL,
  `prenom` varbinary(255) DEFAULT NULL,
  `mdp` varbinary(255) NOT NULL,
  `email` varbinary(255) NOT NULL,
  `date_naissance`varbinary(255)DEFAULT NULL,
  `adresse` varbinary(255) DEFAULT NULL,
  `cp`varbinary(255)DEFAULT NULL,
  `ville` varbinary(255) DEFAULT NULL,
  `mobile`varbinary(255)DEFAULT NULL,
  `civilite` varbinary(255) NOT NULL,
  PRIMARY KEY (`numero`)
);

DROP TABLE IF EXISTS `responsable`;
CREATE TABLE `responsable` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varbinary(255) NOT NULL,
  `prenom` varbinary(255) NOT NULL,
  `mdp` varbinary(255) NOT NULL,
  `login` varbinary(255) NOT NULL,
  PRIMARY KEY (`numero`)
);

DROP TABLE IF EXISTS `atelier`;
CREATE TABLE `atelier` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) NOT NULL,
  `nb_places` int(11) NOT NULL DEFAULT 10,
  `responsable` int(11) NOT NULL,
  `date_enregistrement` date NOT NULL,
  `date_heure` datetime NOT NULL,
  `duree` int(11) NOT NULL DEFAULT 1,
  `nb_participants` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`numero`),
  KEY `responsable` (`responsable`),
  CONSTRAINT `atelier_ibfk_1` FOREIGN KEY (`responsable`) REFERENCES `responsable` (`numero`)
);

DROP TABLE IF EXISTS `participer`;
CREATE TABLE `participer` (
  `client` int(11) NOT NULL,
  `atelier` int(11) NOT NULL,
  `date_inscription` date NOT NULL,
  PRIMARY KEY (`client`,`atelier`),
  KEY `atelier` (`atelier`),
  CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`numero`),
  CONSTRAINT `participer_ibfk_2` FOREIGN KEY (`atelier`) REFERENCES `atelier` (`numero`)
);
