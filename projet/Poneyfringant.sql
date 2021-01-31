DROP DATABASE IF EXISTS poneyfringant;

CREATE DATABASE IF NOT EXISTS poneyfringant;  -- On crée la base si elle n'existe pas
USE poneyfringant; -- On se positionne sur la base

CREATE USER IF NOT EXISTS poneysh@localhost IDENTIFIED BY 'Poneyshfringant';--On crée un utilisateur qui aura tout les droits
GRANT ALL ON poneyshfringant.* TO poneysh@localhost; 

CREATE TABLE IF NOT EXISTS Adherents (
    adherentID VARCHAR(255) PRIMARY KEY NOT NULL,
    prenom VARCHAR(255),
    nom VARCHAR(255),
    pseudo VARCHAR(255) NOT NULL UNIQUE, 
    email VARCHAR(255) NOT NULL UNIQUE, 
    numero VARCHAR(20),
    adresse1 VARCHAR(255),
    zip INT(5),
    ville VARCHAR(255),
    password VARCHAR(255) NOT NULL, 
    date_adhesion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Interets (
    interetID INT PRIMARY KEY AUTO_INCREMENT,
    nom_interet VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS InteretAdherent (
    interetID INT,
    adherentID VARCHAR(255),
    PRIMARY KEY(interetID,adherentID),
    CONSTRAINT FK_InteretAdherent_Adherents FOREIGN KEY (adherentID) REFERENCES Adherents(adherentID),
    CONSTRAINT FK_InteretAdherent_Interets FOREIGN KEY (interetID) REFERENCES Interets(interetID)
);

CREATE TABLE IF NOT EXISTS Profils (
    profilID INT AUTO_INCREMENT,
    titre VARCHAR(255),
    photo VARCHAR(255),
    description TEXT, 
    adherentID VARCHAR(255),
    PRIMARY KEY (profilID,adherentID),
    CONSTRAINT FK_Profils_Adherents FOREIGN KEY (adherentID) REFERENCES Adherents(adherentID)
);

INSERT INTO Interets (nom_interet) VALUES ('Sport'), ('Musique'), ('Jeux Vidéos'), ('Lecture'), ('Informatique'), ('Sorties'), ('Cuisine'), ('Aviation'), ('Mécanique'), ('Licornes'), ('Joaillerie'), ('Agriculture'), ('Cinéma'), ('Politique'), ('Couture'), ('Animaux'), ('Science'), ('Histoire'), ('SVT'), ('Physique-Chimie'), ('Taxidermie'), ('Philatélie');

INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-001', 'Bellatrix', 'Lestranges', 'Bella', 'bella@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2009-04-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-002', 'Rodolphus', 'Lestranges', 'Rodo', 'Rodolphus@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2008-04-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-003', 'Rabastan', 'Lestranges', 'rabas', 'rabas@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2005-04-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-004', 'Lucius', 'Malfoy', 'lulu', 'lulu@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2011-04-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-005', 'Narcissa', 'Malfoy', 'cissy', 'cissy@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2009-08-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-006', 'Drago', 'Malfoy', 'dragon', 'dragon@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2009-10-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-007', 'Alecto', 'Carrow', 'alec', 'alec@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2009-05-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-008', 'Amycus', 'Carrow', 'mycus', 'mycus@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2009-04-13 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-009', 'Antonin', 'Dolohov', 'Dolly', 'dolly@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2020-04-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-010', 'Fenrir', 'Greyback', 'loulou', 'loulou@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2021-01-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-011', 'Igor', 'Karkaroff', 'roff', 'roff@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2014-12-23 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-012', 'Peter', 'Pettigrow', 'quedver', 'rat@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2000-04-24 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-012', 'Peter', 'Pettigrow', 'quedver', 'rat@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2011-04-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-013', 'Severus', 'Rogue', 'snivellus', 'sev@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2000-04-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-014', 'Corban', 'Yaxley', 'yax', 'yaxou@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2018-04-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-015', 'Regulus', 'Black', 'RAB', 'reg@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2016-07-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-016', 'Walden', 'Macnair', 'imac', 'imac@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2020-04-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-017', 'Evan', 'Rosier', 'rose', 'rose@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2020-04-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-018', 'Augustus', 'Rockwood', 'Rock', 'TheRock@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-019', 'Theodore Sr.', 'Nott', 'theo', 'theo@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2013-08-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-020', 'Bartemius Jr.', 'Croupton', 'croutons', 'croutons@deathheater.com', '6666666666', "Malfoy's Manor", '66666', 'LONDON', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-021', 'Harry', 'Potter', 'ryry', 'ryry@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-022', 'Ron', 'Weasley', 'labelette', 'ronron@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2017-04-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-023', 'Hermione', 'Granger', 'jesaistout', 'hermy@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-024', 'Ginny', 'Weasley', 'gin', 'gin@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-025', 'Molly', 'Weasley', 'mollyyy', 'moly@hogwarts.com', '0987654321', "le Terrier", '00000', 'Loutrystchaspoule', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-026', 'Arthur', 'Weasley', 'tuture', 'arthur@hogwarts.com', '0987654321', "le Terrier", '00000', 'Loutrystchaspoule', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2017-04-29 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-027', 'Billy', 'Weasley', 'bill', 'bill@hogwarts.com', '0987654321', "le Terrier", '00000', 'Loutrystchaspoule', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2017-06-20 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-028', 'Percy', 'Weasley', 'perce', 'perce@hogwarts.com', '0987654321', "le Terrier", '00000', 'Loutrystchaspoule', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-029', 'Fred', 'Weasley', 'fredy', 'fredyron@hogwarts.com', '0987654321', "le Terrier", '00000', 'Loutrystchaspoule', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2011-03-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-030', 'Georges', 'Weasley', 'georgy', 'georgy@hogwarts.com', '0987654321', "le Terrier", '00000', 'Loutrystchaspoule', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2013-07-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-031', 'Charlie', 'Weasley', 'charles', 'charles@hogwarts.com', '0987654321', "le Terrier", '00000', 'Loutrystchaspoule', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2011-03-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-032', 'Hannah', 'Abbot', 'ana', 'ana@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-033', 'Marcus', 'Belby', 'belby', 'belby@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2019-03-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-034', 'Katie', 'Bell', 'kate', 'kate@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2011-02-09 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-035', 'Crabbe', 'Vincent', 'langouste', 'langouste@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2012-02-22 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-036', 'Milicent', 'Bullstrode', 'bull', 'redbull@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2011-04-22 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-037', 'Olivier', 'Dubois', 'olive', 'oliveettom@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2011-01-24 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-038', 'Marietta', 'Edgecombe', 'marie', 'marie@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-039', 'Marcus', 'Flint', 'marco', 'marco@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2016-07-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-040', 'Gregory', 'Goyle', 'gorille', 'gorille@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-041', 'Rubeus', 'Hagrid', 'geantvert', 'geantvert@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2021-01-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-042', 'Terence', 'Higgs', 'higgggs', 'higgss@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-043', 'Angelina', 'Johnson', 'angel', 'angel@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2020-02-12 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-044', 'Jordan', 'Lee', 'lee-chan', 'lee@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-045', 'Neville', 'Longdubat', 'poissonrouge', 'poissonrouge@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2010-04-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-046', 'Blaise', 'Zabini', 'blini', 'blinis@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2010-04-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-047', 'Cormac', 'McLaggen', 'cormy', 'corma@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2010-01-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-048', 'Ernie', 'Macmillan', 'macmi', 'macmi@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2006-05-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-049', 'Craig', 'Montague', 'juliette', 'juliette@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-050', 'Theodore Jr.', 'Nott', 'theoJR', 'theo@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2011-06-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-051', 'Pansy', 'Parkinson', 'alzeimer', 'covid@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2019-04-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-052', 'Padma', 'Patil', 'lestwins', 'pad@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2011-11-30 13:24:12');
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-053', 'Zacharias', 'Smith', 'zac', 'zac@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NOW());
INSERT INTO Adherents (adherentID, prenom, nom, pseudo, email, numero, adresse1, zip, ville, password, date_adhesion) VALUES ('adh-2045-054', 'Alicia', 'Spinnet', 'spin', 'spin@hogwarts.com', '1234567890', "Hogwarts", '00000', 'NOIDEA', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2014-12-30 13:24:12');


INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-001', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-001', '9');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-001', '10');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-002', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-002', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-002', '10');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-003', '1');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-003', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-003', '9');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-004', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-004', '5');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-004', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-004', '19');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-004', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-004', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-005', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-005', '4');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-005', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-005', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-005', '10');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-005', '12');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-005', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-005', '19');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-006', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-006', '10');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-006', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-006', '20');


INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-007', '1');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-007', '4');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-007', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-007', '9');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-007', '11');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-008', '4');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-008', '16');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-008', '18');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-009', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-009', '17');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-009', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-009', '19');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-009', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-009', '21');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-010', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-010', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-010', '15');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-010', '17');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-011', '1');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-011', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-011', '3');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-012', '1');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-012', '3');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-012', '5');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-012', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-012', '9');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-012', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-012', '13');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-012', '15');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-013', '4');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-013', '5');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-013', '15');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-014', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-014', '12');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-014', '17');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-014', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-014', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-015', '13');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-015', '15');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-015', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-016', '1');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-016', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-016', '5');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-016', '13');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-016', '15');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-017', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-017', '13');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-017', '15');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-017', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-017', '19');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-017', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-017', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-017', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-018', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-018', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-018', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-018', '16');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-018', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-018', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-018', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-019', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-019', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-019', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-020', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-020', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-020', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-021', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-022', '3');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-023', '4');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-024', '10');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-025', '13');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-026', '15');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-027', '18');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-028', '10');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-028', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-028', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-028', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-029', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-029', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-029', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-029', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-029', '16');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-029', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-029', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-029', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-030', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-030', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-030', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-030', '16');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-030', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-030', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-030', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-031', '5');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-031', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-031', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-031', '9');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-032', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-032', '10');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-032', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-032', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-032', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-033', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-033', '17');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-033', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-033', '19');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-033', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-033', '21');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-034', '10');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-034', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-034', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-034', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-035', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-035', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-035', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-035', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-035', '16');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-035', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-035', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-035', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-036', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-036', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-036', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-036', '16');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-036', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-036', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-036', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-037', '5');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-037', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-037', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-037', '9');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-038', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-038', '10');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-038', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-038', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-038', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-039', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-039', '17');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-039', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-039', '19');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-039', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-039', '21');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-040', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-040', '13');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-040', '15');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-040', '22');


INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-041', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-041', '9');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-041', '10');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-042', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-042', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-042', '10');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-043', '1');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-043', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-043', '9');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-044', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-044', '5');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-044', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-044', '19');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-044', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-044', '22');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-045', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-045', '4');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-045', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-045', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-045', '10');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-045', '12');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-045', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-045', '19');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-046', '8');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-046', '10');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-046', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-046', '20');


INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-047', '1');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-047', '4');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-047', '6');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-047', '9');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-047', '11');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-048', '4');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-048', '16');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-048', '18');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-049', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-049', '17');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-049', '18');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-049', '19');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-049', '20');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-049', '21');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-050', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-050', '14');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-050', '15');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-050', '17');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-051', '1');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-051', '2');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-051', '3');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-052', '1');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-052', '3');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-052', '5');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-052', '7');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-052', '9');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-052', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-052', '13');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-052', '15');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-053', '4');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-053', '5');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-053', '15');

INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-054', '11');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-054', '12');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-054', '17');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-054', '21');
INSERT INTO InteretAdherent (adherentID, interetID) VALUES ('adh-2045-054', '22');

