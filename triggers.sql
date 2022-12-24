
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
