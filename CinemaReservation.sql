/********** Création de l'utilisateur ayant tous les droits et de la Base de Données **********/

-- Création de l'utilisateur de connexion pour la BDD autre que Root
CREATE USER 'studi2024'@'localhost' IDENTIFIED BY '@dm.2023.$';

-- Attribution de tous les privilèges sur la base de données
GRANT ALL PRIVILEGES ON CinemaReservation.* TO 'studi2024'@'localhost';

-- Création de la BDD avec le jeu de caractères pour la prise en charge de nombreuses langues différentes et une compatibilité des emojis
CREATE DATABASE CinemaReservation CHARACTER SET utf8mb4;
USE CinemaReservation;

-- Définition d'InnoDB comme moteur de stockage par défaut
SET default_storage_engine=INNODB;


/********** Création des tables **********/

-- Table Cinéma
CREATE TABLE Cinema (
	Id_Cinema INT AUTO_INCREMENT PRIMARY KEY,
	Nom VARCHAR(255) NOT NULL,
	Adresse TEXT NOT NULL,
	Telephone VARCHAR(15)
);

-- Table Utilisateur
CREATE TABLE Utilisateur (
	Id_Utilisateur INT AUTO_INCREMENT PRIMARY KEY,
	Prenom VARCHAR(255) NOT NULL,
	Nom VARCHAR(255) NOT NULL,
	Role VARCHAR(50) NOT NULL,
	Email VARCHAR(255) NOT NULL UNIQUE,
	Mot_De_Passe VARCHAR(100) NOT NULL,
	Id_Cinema INT,
	FOREIGN KEY (Id_Cinema) REFERENCES Cinema(Id_Cinema)
);

-- Table Salle
CREATE TABLE Salle (
	Id_Salle INT AUTO_INCREMENT PRIMARY KEY,
    Capacite INT,
    Numero_Salle VARCHAR(10),
	Type_Salle VARCHAR(50),
    Id_Cinema INT,
    FOREIGN KEY (Id_Cinema) REFERENCES Cinema(Id_Cinema)
);

-- Table Film
CREATE TABLE Film (
    Id_Film INT AUTO_INCREMENT PRIMARY KEY,
    Titre VARCHAR(255) NOT NULL,
    Duree VARCHAR(50),
    Genre VARCHAR(100),
    Synopsis TEXT,
    Realisateur VARCHAR(100),
    Scenariste VARCHAR(100),
    Acteur TEXT,
    Age_Minimum INT,
    Sortie DATE
);

-- Table Séance
CREATE TABLE Seance (
    Id_Seance INT AUTO_INCREMENT PRIMARY KEY,
    Horaire DATETIME NOT NULL,
    Id_Film INT,
    Id_Salle INT,
    FOREIGN KEY (Id_Film) REFERENCES Film(Id_Film),
    FOREIGN KEY (Id_Salle) REFERENCES Salle(Id_Salle)
);


-- Table Client
CREATE TABLE Client (
    Id_Client INT AUTO_INCREMENT PRIMARY KEY,
	Prenom VARCHAR(255) NOT NULL,
    Nom VARCHAR(255),
    Email VARCHAR(255) NOT NULL UNIQUE,
    Mot_De_Passe VARCHAR(100) NOT NULL
);

-- Table Paiement
CREATE TABLE Paiement (
    Id_Paiement INT AUTO_INCREMENT PRIMARY KEY,
    Id_Client INT,
    Montant DECIMAL(10, 2),
    Mode_Paiement VARCHAR(50),
	Date_Paiement DATETIME,
    FOREIGN KEY (Id_Client) REFERENCES Client(Id_Client)
);

-- Table Tarif
CREATE TABLE Tarif (
    Id_Tarif INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(255),
    Prix DECIMAL(5, 2)
);

-- Table Place de Cinéma
CREATE TABLE Place_de_Cinema (
    Id_Billet INT AUTO_INCREMENT PRIMARY KEY,
    Id_Seance INT,
    Id_Tarif INT,
    Id_Client INT,
	Statut VARCHAR(50),
	Date_Achat DATETIME,
	Date_Reservation DATETIME,
    FOREIGN KEY (Id_Seance) REFERENCES Seance(Id_Seance),
    FOREIGN KEY (Id_Tarif) REFERENCES Tarif(Id_Tarif),
	FOREIGN KEY (Id_Client) REFERENCES Client(Id_Client)
);


/********** Création d'une table intermédiaire pour attribuer à un paiement un seul billet ou plusieurs billets **********/
-- Table Billet Paiement
CREATE TABLE Billet_Paiement (
    Id_Billet INT,
    Id_Paiement INT,
    PRIMARY KEY (Id_Billet, Id_Paiement),
    FOREIGN KEY (Id_Billet) REFERENCES Place_de_Cinema(Id_Billet),
    FOREIGN KEY (Id_Paiement) REFERENCES Paiement(Id_Paiement)
);



/********** Scripts d'alimentation factice de données dans la base **********/

INSERT INTO Cinema (Nom, Adresse, Telephone) VALUES
('Pathé Nantes Atlantis', '8, allée La Pérouse 44800 Saint-Herblain', '02 40 48 24 72'),
('UGC Ciné Cité Atlantis', 'Place Jean Bart 44800 Saint-Herblain', '08 26 88 07 00'),
('Gaumont Nantes Multiplexe', '12, place du commerce 44000 Nantes', '08 92 69 66 96'),
('Ciné Pôle Sud', 'Centre commercial Pôle Sud, Route de Clisson - Basse-Goulaine', '02 28 00 98 98'),
('Cinéville', 'Rue Marie Curie - Saint-Sébastien-sur-Loire', '02 51 79 78 10');

INSERT INTO Utilisateur (Prenom, Nom, Role, Email, Mot_De_Passe, Id_Cinema) VALUES
('Denis','Gauthier', 'Administrateur', 'denisg027@gmail.com', 'DeNiS2707§', 1),
('Ludovic', 'Leguebe', 'Administrateur', 'ludovic.leguebe@gmail.com', '88$LB#xj', 2),
('Eric', 'Hamon', 'Administrateur', 'eric.hamon@gmail.com', '9q]Mx%4A', 3),
('Yohann', 'Chauvet', 'Administrateur', 'yohann.chauvet@gmail.com', '{HjEj@82', 4),
('Hervé', 'Jayol', 'Administrateur', 'herve.jayol@gmail.com', '8!CrPs[8', 5);

INSERT INTO Salle (Capacite, Numero_Salle, Type_Salle, Id_Cinema) VALUES
(530 , 'Salle 1', 'Grand Ecran', 1),
(80 , 'Salle 2', 'Standard', 2),
(120 , 'Salle 3', 'Standard', 3),
(196 , 'Salle 4', '3D', 3),
(330 , 'Salle 5', 'Dolby SR', 5),
(194 , 'Salle 6', 'Dolby SR', 2),
(220 , 'Salle 7', 'Dolby SR', 3),
(180 , 'Salle 8', 'Dolby SR', 4),
(180 , 'Salle 9', 'Dolby SR', 5),
(384 , 'Salle 10', 'Laser 4K Atmos', 1),
(180 , 'Salle 1', 'Standard', 3),
(220 , 'Salle 2', 'Standard', 4),
(195 , 'Salle 3', 'Dolby SR', 5),
(130 , 'Salle 4', 'Dolby SR', 1),
(120 , 'Salle 5', '3D', 2),
(250 , 'Salle 1', 'Standard', 3),
(130 , 'Salle 2', 'Standard', 4),
(180 , 'Salle 3', 'Dolby SR', 5),
(170 , 'Salle 4', '3D', 4),
(250 , 'Salle 5', 'Standard', 3),
(250 , 'Salle 1', 'Standard', 2),
(280 , 'Salle 2', 'Dolby SR', 1),
(120 , 'Salle 3', 'Dolby SR', 4),
(180 , 'Salle 4', 'Dolby SR', 3),
(350 , 'Salle 5', 'Standard', 2),
(250 , 'Salle 1', 'Standard', 1),
(200 , 'Salle 2', 'Dolby SR', 5),
(180 , 'Salle 3', 'Dolby SR', 4),
(220 , 'Salle 4', 'Standard', 3),
(220 , 'Salle 5', '3D', 2),
(180 , 'Salle 6', '3D', 1),
(230 , 'Salle 7', '3D', 2),
(190 , 'Salle 8', '3D', 3),
(280 , 'Salle 9', 'Dolby SR', 4),
(350 , 'Salle 10', 'Laser 4K Atmos', 5);


INSERT INTO Film (Titre, Duree, Genre, Synopsis, Realisateur, Scenariste, Acteur, Age_Minimum, Sortie) VALUES
('Migration', '1h22min', 'Animation, Aventure, Comédie, Famille', "La famille Colvert est en proie à un dilemme d’ordre domestique. Alors que Mack est totalement satisfait de patauger avec sa famille, paisiblement et définitivement, dans leur petite mare de la Nouvelle-Angleterre, sa femme Pam serait plus du genre à bousculer un peu cette routine pour montrer le reste du monde à ses enfants - Dax qui n’est déjà plus un caneton et sa petite sœur Gwen. Lorsqu’ils accueillent, le temps de leur halte, une famille de canards migrateurs, c’est l’occasion rêvée pour Pam de persuader Mack de les imiter et de se lancer dans un périple en famille : destination la Jamaïque, en passant par New York. Alors qu’ils s’envolent vers le soleil pour l’hiver, le plan si bien tracé des Colvert va vite battre de l’aile. Mais la tournure aussi chaotique et inattendue que vont prendre les évènements va les changer à jamais et leur apprendre beaucoup plus qu’ils ne l’auraient imaginé.", 'Renner Benjamin, Guylo Homsy', 'Mike White, Benjamin Renner', ' Pio Marmaï, Kumail Nanjiani, Pia Gimenez Bonfils', '6 ans', '6 décembre 2023'),
('Le Grand magasin', '1h10min', 'Animation, Famille, Aventure', "Akino est l'apprentie concierge d'un grand magasin vraiment spécial : les clients y sont tous des animaux. Qu’ils soient petits ou grands, à poils ou à plumes, Akino travaille dur pour satisfaire toutes leurs demandes… même les plus surprenantes !", 'Yoshimi Itazu', 'Satomi Ohshima', 'Eiji Yoshitomi, Kawaida Natsumi, Takeo Otsuka', '6 ans', '6 décembre 2023'),
('Wish - Asha et la bonne étoile', '1h42min', 'Animation, Famille, Aventure', "Jeune fille de 17 ans à l’esprit vif, Asha vit à Rosas, un royaume fantastique où tous les souhaits peuvent littéralement s’exaucer. Dans un moment de désespoir, elle adresse un vœu sincère et puissant aux étoiles auquel va répondre une force cosmique : une petite boule d’énergie infinie prénommée Star. Ensemble, Star et Asha vont affronter le plus redoutable des ennemis, le Roi Magnifico et prouver que le souhait d’une personne déterminée, allié à la magie des étoiles, peut réellement produire des miracles...", 'Chris Buck, Fawn Veerasunthorn', 'Jennifer Lee, Allison Moore', 'Océane Demontis, Ariana DeBose, Lambert Wilson', '6 ans', '29 novembre 2023'),
('La Tresse', '1h59min', 'Comédie Dramatique', "D'après le best-seller aux 5 millions de lecteurs. - Inde. Smita est une Intouchable. Elle rêve de voir sa fille échapper à sa condition misérable et entrer à l'école. Italie. Giulia travaille dans l'atelier de son père. Lorsqu'il est victime d'un accident, elle découvre que l'entreprise familiale est ruinée. Canada. Sarah, avocate réputée, va être promue à la tête de son cabinet quand elle apprend qu'elle est malade. Trois vies, trois femmes, trois continents. Trois combats à mener. Si elles ne se connaissent pas, Smita, Giulia et Sarah sont liées sans le savoir par ce qu'elles ont de plus intime et de plus singulier.", 'Laetitia Colombani', 'Laetitia Colombani, Sarah Kaminsky', 'Kim Raver, Fotinì Peluso, Mia Maelzer', 'Tout Public', '29 novembre 2023'),
('Rien à Perdre', '1h52min', 'Drame', "Sylvie vit à Brest avec ses deux enfants, Sofiane et Jean-Jacques. Une nuit, Sofiane se blesse alors qu’il est seul dans l’appartement. Les services sociaux sont alertés et placent l’enfant en foyer, le temps de mener une enquête. Persuadée d’être victime d’une erreur judiciaire, Sylvie se lance dans un combat pour récupérer son fils.", 'Delphine Deloget', 'Delphine Deloget', 'Virginie Efira, Félix Lefebvre, Arieh Worthalter', 'Tout Public', '22 novembre 2023'),
('Soudain seuls', '1h50min', 'Thriller, Romance, Drame', "En couple depuis 5 ans, Ben et Laura ont décidé de faire le tour du monde en bateau. Avant d'atteindre l'Amérique du Sud, ils font un détour vers une île sauvage, près des côtes antarctiques. En pleine exploration, une tempête s'abat sur eux et leur bateau disparaît. Éloignés du monde, soudain seuls face au danger et à l'hiver qui approche, ils vont devoir lutter pour leur survie et celle de leur couple.", 'Thomas Bidegain', 'Thomas Bidegain, Valentine Monteil', 'Gilles Lellouche, Mélanie Thierryi', 'Tout Public', '6 dé2023-12-06cembre 2023'),
('Le Temps D’Aimer', '2h05min', 'Drame, Romance', "1947. Sur une plage, Madeleine, serveuse dans un hôtel-restaurant, mère d’un petit garçon, fait la connaissance de François, étudiant riche et cultivé. Entre eux, c’est comme une évidence. La providence. Si l’on sait ce qu’elle veut laisser derrière elle en suivant ce jeune homme, on découvre avec le temps ce que François tente de fuir en mêlant le destin de Madeleine au sien...", 'Katell Quillévéré', 'Katell Quillévéré, Gilles Taurand', 'Anaïs Demoustier, Vincent Lacoste, Paul Beaurepaire', 'Tout Public', '29 novembre 2023'),
('Et la fête continue !', '1h46min', 'Comédie dramatique', "A Marseille, Rosa, 60 ans a consacré sa vie à sa famille et à la politique avec le même sens du sacrifice. Tous pensent qu’elle est inébranlable d’autant que Rosa est la seule qui pourrait sceller l’union de la gauche à la veille d’une échéance électorale décisive. Elle s’accommode finalement bien de tout ça, jusqu’au jour où elle tombe amoureuse d’Henri. Pour la première fois, Rosa a peur de s’engager. Entre la pression de sa famille politique et son envie de lâcher prise, le dilemme est lourd à porter.", 'Robert Guédiguian', 'Robert Guédiguian, Serge Valletti', 'Ariane Ascaride, Jean-Pierre Darroussin, Lola Naymark', 'Tout Public', '15 novembre 2023'),
('La Passion de Dodin Bouffant', '2h14min', 'Drame, Historique, Romance', "Eugénie, cuisinière hors pair, est depuis 20 ans au service du célèbre gastronome Dodin. Au fil du temps, de la pratique de la gastronomie et de l'admiration réciproque est née une relation amoureuse. De cette union naissent des plats tous plus savoureux et délicats les uns que les autres qui vont jusqu’à émerveiller les plus grands de ce monde. Pourtant, Eugénie, avide de liberté, n’a jamais voulu se marier avec Dodin. Ce dernier décide alors de faire quelque chose qu’il n’a encore jamais fait : cuisiner pour elle.", 'Tran Anh Hung', 'Tran Anh Hung', 'Juliette Binoche, Benoît Magimel, Emmanuel Salinger', 'Tout Public', '8 novembre 2023'),
('Le Garçon et le Héron', '2h03min', 'Animation, Drame, Aventure', "Après la disparition de sa mère dans un incendie, Mahito, un jeune garçon de 11 ans, doit quitter Tokyo pour partir vivre à la campagne dans le village où elle a grandi. Il s’installe avec son père dans un vieux manoir situé sur un immense domaine où il rencontre un héron cendré qui devient petit à petit son guide et l’aide au fil de ses découvertes et questionnements à comprendre le monde qui l'entoure et percer les mystères de la vie.", 'Hayao Miyazaki', 'Hayao Miyazaki', 'Gavril Dartevelle, Soma Santoki, Padrig Vion', '10 ans', '1 novembre 2023');

INSERT INTO Seance (Horaire, Id_Film, Id_Salle) VALUES
-- Séances pour la Salle 1
('2023-12-01 09:00:00', 1, 1),
('2023-12-01 12:00:00', 2, 1),
('2023-12-01 15:00:00', 3, 1),
('2023-12-01 18:00:00', 4, 1),
('2023-12-01 21:00:00', 5, 1),

-- Séances pour la Salle 2
('2023-12-01 09:30:00', 2, 2),
('2023-12-01 12:30:00', 3, 2),
('2023-12-01 15:30:00', 4, 2),
('2023-12-01 18:30:00', 5, 2),
('2023-12-01 21:30:00', 1, 2),

-- Séances pour la Salle 3
('2023-12-01 10:00:00', 6, 3),
('2023-12-01 13:00:00', 7, 3),
('2023-12-01 16:00:00', 8, 3),
('2023-12-01 19:00:00', 9, 3),
('2023-12-01 22:00:00', 10, 3),

-- Séances pour la Salle 4
('2023-12-01 09:00:00', 10, 4),
('2023-12-01 12:00:00', 9, 4),
('2023-12-01 15:00:00', 8, 4),
('2023-12-01 18:00:00', 7, 4),
('2023-12-01 21:00:00', 6, 4),

-- Séances pour la Salle 5
('2023-12-01 09:30:00', 2, 5),
('2023-12-01 12:30:00', 3, 5),
('2023-12-01 15:30:00', 4, 5),
('2023-12-01 18:30:00', 5, 5),
('2023-12-01 21:30:00', 1, 5),

-- Séances pour la Salle 6
('2023-12-01 10:00:00', 3, 6),
('2023-12-01 13:00:00', 4, 6),
('2023-12-01 16:00:00', 5, 6),
('2023-12-01 19:00:00', 1, 6),
('2023-12-01 22:00:00', 2, 6),

-- Séances pour la Salle 7
('2023-12-01 09:00:00', 9, 7),
('2023-12-01 12:00:00', 10, 7),
('2023-12-01 15:00:00', 6, 7),
('2023-12-01 18:00:00', 7, 7),
('2023-12-01 21:00:00', 8, 7),

-- Séances pour la Salle 8
('2023-12-01 09:30:00', 10, 8),
('2023-12-01 12:30:00', 6, 8),
('2023-12-01 15:30:00', 7, 8),
('2023-12-01 18:30:00', 8, 8),
('2023-12-01 21:30:00', 9, 8),

-- Séances pour la Salle 9
('2023-12-01 10:00:00', 1, 9),
('2023-12-01 13:00:00', 2, 9),
('2023-12-01 16:00:00', 3, 9),
('2023-12-01 19:00:00', 4, 9),
('2023-12-01 22:00:00', 5, 9),

-- Séances pour la Salle 10
('2023-12-01 10:00:00', 6, 10),
('2023-12-01 13:00:00', 7, 10),
('2023-12-01 16:00:00', 8, 10),
('2023-12-01 19:00:00', 9, 10),
('2023-12-01 22:00:00', 10, 10);


INSERT INTO Client (Prenom, Nom, Email, Mot_De_Passe) VALUES
('Terry', 'Zible', 'terry.zible@gmail.com', 'Cs.Dt122023$'),
('Jacques', 'Ouzi', 'jacques.ouzi@gmail.com', 'Cs.Dt122023$'),
('Sarah', 'Joute', 'sarah.joute@gmail.com', 'Cs.Dt122023$'),
('Otto', 'Mobil', 'otto.mobil@gmail.com', 'Cs.Dt122023$'),
('Callie', 'Fornie', 'callie.fornie@gmail.com', 'Cs.Dt122023$');


INSERT INTO Paiement (Montant, Mode_Paiement, Date_Paiement, Id_Client) VALUES
('15.20', 'CB', '2023-12-5 19:30:00', '1'),
('9.20', 'CB', '2023-12-5 19:30:00', '2'),
('18.40', 'CB', '2023-12-1 19:30:00', '3'),
('24.30', 'CB', '2023-12-2 19:30:00', '4'),
('17.70', 'CB', '2023-12-1 19:30:00', '5');


INSERT INTO Tarif (Description, Prix) VALUES 
('Plein tarif', 9.20),
('Etudiant', 7.60),
('Moins de 14 ans', 5.90);

INSERT INTO Place_de_Cinema (Id_Seance, Id_Tarif, Id_Client, Statut, Date_Achat, Date_Reservation) VALUES
(29, 3, 5, 'Payé', '2023-12-5 19:30:00', NULL),
(29, 3, 5, 'Payé', '2023-12-5 19:30:00', NULL),
(29, 3, 5, 'Payé', '2023-12-5 19:30:00', NULL),
(45, 1, 5, 'Réservé', NULL, '2023-12-3 19:30:00'),
(45, 1, 5, 'Réservé', NULL, '2023-12-3 19:30:00'),
(50, 1, 4, 'Payé', '2023-12-1 19:30:00', NULL),
(50, 1, 4, 'Payé', '2023-12-1 19:30:00', NULL),
(50, 3, 4, 'Payé', '2023-12-1 19:30:00', NULL),
(34, 1, 3, 'Payé', '2023-12-5 19:30:00', NULL),
(34, 1, 3, 'Payé', '2023-12-5 19:30:00', NULL),
(20, 1, 2, 'Payé', '2023-12-5 19:30:00', NULL),
(24, 1, 1, 'Réservé', NULL, '2023-12-8 15:20:00'),
(40, 2, 1, 'Payé', '2023-12-5 19:30:00', NULL),
(40, 2, 1, 'Payé', '2023-12-5 19:30:00', NULL);


/**********  
Requête pour chercher des billets dans la table "Place_de_cinema" et les paiements correspondant via leur id et une liaison entre les 2 tables (id_client) par jointure :
	SELECT pc.Id_Billet, p.Id_Paiement
	FROM Place_de_Cinema pc
	JOIN Paiement p ON pc.Id_Client = p.Id_Client
	WHERE pc.Statut = 'Payé' **********/
	
	

INSERT INTO Billet_Paiement (Id_Billet, Id_Paiement) VALUES
(1, 5),
(2, 5),
(3, 5),
(6, 4),
(7, 4),
(8, 4),
(9, 3),
(10, 3),
(11, 2),
(13, 1),
(14, 1);








