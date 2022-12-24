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
INSERT INTO `client` VALUES (1,'ONESTAS','Valentine','azerty','valentine.onestas@gmail.com','1995-11-08','15, rue de la gare','94130','Nogent s/Marne','0693530293','Mlle'),(3,'HAFIDI','Nadiya','azerty','n.hafidi@gmail.com','2000-04-01','11, bd de Strasbourg','94120','Fontenay s/bois','0711930388','Mme'),(4,'OSARO','Clémence','azerty','c.osaro@orange.fr','2001-09-15','25, place de la mairie','77350','Le Mée s/Seine','0683340299','Mme'),(5,'JADOUX','Lucie','azerty','lucie.jadoux@gmail.com','1997-11-03','2, bd de La République','94130','Nogent s/Marne','0703740203','Mlle'),(6,'KANNY','Pauline','azerty','p.kanny@gmail.com','1999-01-11','1 ter, rue Paul Doumer','95000','Cergy','0730832731','Mme'),(8,'KARA','Juliette','azerty','juliette.kara@gmail.com','2007-05-10','21, rue de la gare','94200','Ivry s/Seine','0799720154','Mlle'),(9,'LAURY','Sophie','azerty','sophie.laury@gmail.com','2002-08-02','15, rue du parc','94400','Vitry s/Seine','0638304393','Mlle');

DROP TABLE IF EXISTS `responsable`;
CREATE TABLE `responsable` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varbinary(255) NOT NULL,
  `prenom` varbinary(255) NOT NULL,
  `mdp` varbinary(255) NOT NULL,
  `login` varbinary(255) NOT NULL,
  PRIMARY KEY (`numero`)
);
INSERT INTO `responsable` VALUES (1,'DA SILVA','Maria','azerty','mdasilva'),(2,'JONES','Katarina','azerty','kjones');

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
INSERT INTO `atelier` VALUES (1,'Liquide vaisselle',8,2,'2022-10-13','2022-10-29 10:30:00',2,0),(2,'Détachant Linge',10,1,'2022-10-13','2022-10-29 14:00:00',2,0),(3,'Crème hydratante pour homme',10,2,'2022-10-20','2022-11-03 10:00:00',3,0),(4,'Mousse à raser',8,1,'2022-10-20','2022-11-03 15:00:00',2,1);

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
INSERT INTO `participer` VALUES (1,3,'2022-10-25'),(3,1,'2022-10-25'),(3,3,'2022-10-25'),(5,1,'2022-10-25'),(5,4,'2022-10-25'),(9,1,'2022-10-25');


UPDATE client
SET
   nom = AES_ENCRYPT(nom,'SIO-SLAM-2023'),
   prenom = AES_ENCRYPT(prenom,'SIO-SLAM-2023'),
   email = AES_ENCRYPT(email,'SIO-SLAM-2023'),
   date_naissance = AES_ENCRYPT(date_naissance,'SIO-SLAM-2023'),
   adresse = AES_ENCRYPT(adresse,'SIO-SLAM-2023'),
   cp = AES_ENCRYPT(cp,'SIO-SLAM-2023'),
   ville = AES_ENCRYPT(ville,'SIO-SLAM-2023'),
   mobile = AES_ENCRYPT(mobile,'SIO-SLAM-2023'),
   civilite = AES_ENCRYPT(civilite,'SIO-SLAM-2023')
WHERE numero != '0';

UPDATE client
SET
   mdp = SHA2(mdp,256)
WHERE mdp != '';

UPDATE responsable
SET
   nom = AES_ENCRYPT(nom,'SIO-SLAM-2023'),
   prenom = AES_ENCRYPT(prenom,'SIO-SLAM-2023'),
   login = AES_ENCRYPT(login,'SIO-SLAM-2023')
WHERE numero != '0';

UPDATE responsable
SET
   mdp = SHA2(mdp,256)
WHERE mdp != '';


CREATE TRIGGER B3_SLAM_sb_Client
BEFORE INSERT ON client
FOR EACH ROW
SET
  NEW.nom = AES_ENCRYPT(NEW.nom, 'SIO-SLAM-2023'),
  NEW.prenom = AES_ENCRYPT(NEW.prenom, 'SIO-SLAM-2023'),
  NEW.mdp = SHA2(NEW.mdp, 256),
  NEW.email = AES_ENCRYPT(email, 'SIO-SLAM-2023'),
  NEW.date_naissance = AES_ENCRYPT(NEW.date_naissance, 'SIO-SLAM-2023'),
  NEW.adresse = AES_ENCRYPT(NEW.adresse, 'SIO-SLAM-2023'),
  NEW.cp = AES_ENCRYPT(NEW.cp, 'SIO-SLAM-2023'),
  NEW.ville = AES_ENCRYPT(NEW.ville, 'SIO-SLAM-2023'),
  NEW.mobile = AES_ENCRYPT(NEW.mobile, 'SIO-SLAM-2023'),
  NEW.civilite = AES_ENCRYPT(NEW.civilite, 'SIO-SLAM-2023');

CREATE TRIGGER B3_SLAM_sb_Responsable
BEFORE INSERT ON responsable
FOR EACH ROW
SET
  NEW.nom = AES_ENCRYPT(NEW.nom, 'SIO-SLAM-2023'),
  NEW.prenom = AES_ENCRYPT(NEW.prenom, 'SIO-SLAM-2023'),
  NEW.mdp = SHA2(NEW.mdp, 256),
  NEW.login = AES_ENCRYPT(NEW.login, 'SIO-SLAM-2023') ;
