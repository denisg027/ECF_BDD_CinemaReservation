-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: CinemaReservation
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billet_paiement`
--

DROP TABLE IF EXISTS `billet_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billet_paiement` (
  `Id_Billet` int NOT NULL,
  `Id_Paiement` int NOT NULL,
  PRIMARY KEY (`Id_Billet`,`Id_Paiement`),
  KEY `Id_Paiement` (`Id_Paiement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billet_paiement`
--

LOCK TABLES `billet_paiement` WRITE;
/*!40000 ALTER TABLE `billet_paiement` DISABLE KEYS */;
INSERT INTO `billet_paiement` VALUES (1,5),(2,5),(3,5),(6,4),(7,4),(8,4),(9,3),(10,3),(11,2),(13,1),(14,1);
/*!40000 ALTER TABLE `billet_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `Id_Cinema` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Adresse` text NOT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'Path├® Nantes Atlantis','8, all├®e La P├®rouse 44800 Saint-Herblain','02 40 48 24 72'),(2,'UGC Cin├® Cit├® Atlantis','Place Jean Bart 44800 Saint-Herblain','08 26 88 07 00'),(3,'Gaumont Nantes Multiplexe','12, place du commerce 44000 Nantes','08 92 69 66 96'),(4,'Cin├® P├┤le Sud','Centre commercial P├┤le Sud, Route de Clisson - Basse-Goulaine','02 28 00 98 98'),(5,'Cin├®ville','Rue Marie Curie - Saint-S├®bastien-sur-Loire','02 51 79 78 10');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `Id_Client` int NOT NULL AUTO_INCREMENT,
  `Prenom` varchar(255) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Mot_De_Passe` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Client`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Terry','Zible','terry.zible@gmail.com','Cs.Dt122023$'),(2,'Ray','Mifasol','ray.mifasol@gmail.com','Cs.Dt122023$'),(3,'Jacques','Ouzi','jacques.ouzi@gmail.com','Cs.Dt122023$'),(4,'Ad├¿le','Lane','adele.lane@gmail.com','Cs.Dt122023$'),(5,'Sarah','Joute','sarah.joute@gmail.com','Cs.Dt122023$'),(6,'Larry','Bambelle','larry.bambelle@gmail.com','Cs.Dt122023$'),(7,'Laurent','Cunier','laurent.cunier@gmail.com','Cs.Dt122023$'),(8,'Ella','Lefronblon','ella.lefronblon@gmail.com','Cs.Dt122023$'),(9,'Otto','Mobil','otto.mobil@gmail.com','Cs.Dt122023$'),(10,'Callie','Fornie','callie.fornie@gmail.com','Cs.Dt122023$');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `Id_Film` int NOT NULL AUTO_INCREMENT,
  `Titre` varchar(255) NOT NULL,
  `Duree` varchar(50) DEFAULT NULL,
  `Genre` varchar(100) DEFAULT NULL,
  `Synopsis` text,
  `Realisateur` varchar(100) DEFAULT NULL,
  `Scenariste` varchar(100) DEFAULT NULL,
  `Acteur` text,
  `Age_Minimum` int DEFAULT NULL,
  `Sortie` date DEFAULT NULL,
  PRIMARY KEY (`Id_Film`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Migration','1h22min','Animation, Aventure, Com├®die, Famille','La famille Colvert est en proie ├á un dilemme d?ordre domestique. Alors que Mack est totalement satisfait de patauger avec sa famille, paisiblement et d├®finitivement, dans leur petite mare de la Nouvelle-Angleterre, sa femme Pam serait plus du genre ├á bousculer un peu cette routine pour montrer le reste du monde ├á ses enfants - Dax qui n?est d├®j├á plus un caneton et sa petite s?ur Gwen. Lorsqu?ils accueillent, le temps de leur halte, une famille de canards migrateurs, c?est l?occasion r├¬v├®e pour Pam de persuader Mack de les imiter et de se lancer dans un p├®riple en famille : destination la Jama├»que, en passant par New York. Alors qu?ils s?envolent vers le soleil pour l?hiver, le plan si bien trac├® des Colvert va vite battre de l?aile. Mais la tournure aussi chaotique et inattendue que vont prendre les ├®v├¿nements va les changer ├á jamais et leur apprendre beaucoup plus qu?ils ne l?auraient imagin├®.','Renner Benjamin, Guylo Homsy','Mike White, Benjamin Renner',' Pio Marma├», Kumail Nanjiani, Pia Gimenez Bonfils',6,'2023-12-06'),(2,'Le Grand magasin','1h10min','Animation, Famille, Aventure','Akino est l\'apprentie concierge d\'un grand magasin vraiment sp├®cial : les clients y sont tous des animaux. Qu?ils soient petits ou grands, ├á poils ou ├á plumes, Akino travaille dur pour satisfaire toutes leurs demandes? m├¬me les plus surprenantes !','Yoshimi Itazu','Satomi Ohshima','Eiji Yoshitomi, Kawaida Natsumi, Takeo Otsuka',6,'2023-12-06'),(3,'Wish - Asha et la bonne ├®toile','1h42min','Animation, Famille, Aventure','Jeune fille de 17 ans ├á l?esprit vif, Asha vit ├á Rosas, un royaume fantastique o├╣ tous les souhaits peuvent litt├®ralement s?exaucer. Dans un moment de d├®sespoir, elle adresse un v?u sinc├¿re et puissant aux ├®toiles auquel va r├®pondre une force cosmique : une petite boule d?├®nergie infinie pr├®nomm├®e Star. Ensemble, Star et Asha vont affronter le plus redoutable des ennemis, le Roi Magnifico et prouver que le souhait d?une personne d├®termin├®e, alli├® ├á la magie des ├®toiles, peut r├®ellement produire des miracles...','Chris Buck, Fawn Veerasunthorn','Jennifer Lee, Allison Moore','Oc├®ane Demontis, Ariana DeBose, Lambert Wilson',6,'2023-11-29'),(4,'La Tresse','1h59min','Com├®die Dramatique','D\'apr├¿s le best-seller aux 5 millions de lecteurs. - Inde. Smita est une Intouchable. Elle r├¬ve de voir sa fille ├®chapper ├á sa condition mis├®rable et entrer ├á l\'├®cole. Italie. Giulia travaille dans l\'atelier de son p├¿re. Lorsqu\'il est victime d\'un accident, elle d├®couvre que l\'entreprise familiale est ruin├®e. Canada. Sarah, avocate r├®put├®e, va ├¬tre promue ├á la t├¬te de son cabinet quand elle apprend qu\'elle est malade. Trois vies, trois femmes, trois continents. Trois combats ├á mener. Si elles ne se connaissent pas, Smita, Giulia et Sarah sont li├®es sans le savoir par ce qu\'elles ont de plus intime et de plus singulier.','Laetitia Colombani','Laetitia Colombani, Sarah Kaminsky','Kim Raver, Fotin├¼ Peluso, Mia Maelzer',0,'2023-11-29'),(5,'Rien ├á Perdre','1h52min','Drame','Sylvie vit ├á Brest avec ses deux enfants, Sofiane et Jean-Jacques. Une nuit, Sofiane se blesse alors qu?il est seul dans l?appartement. Les services sociaux sont alert├®s et placent l?enfant en foyer, le temps de mener une enqu├¬te. Persuad├®e d?├¬tre victime d?une erreur judiciaire, Sylvie se lance dans un combat pour r├®cup├®rer son fils.','Delphine Deloget','Delphine Deloget','Virginie Efira, F├®lix Lefebvre, Arieh Worthalter',0,'2023-11-22'),(6,'Soudain seuls','1h50min','Thriller, Romance, Drame','En couple depuis 5 ans, Ben et Laura ont d├®cid├® de faire le tour du monde en bateau. Avant d\'atteindre l\'Am├®rique du Sud, ils font un d├®tour vers une ├«le sauvage, pr├¿s des c├┤tes antarctiques. En pleine exploration, une temp├¬te s\'abat sur eux et leur bateau dispara├«t. ├ëloign├®s du monde, soudain seuls face au danger et ├á l\'hiver qui approche, ils vont devoir lutter pour leur survie et celle de leur couple.','Thomas Bidegain','Thomas Bidegain, Valentine Monteil','Gilles Lellouche, M├®lanie Thierryi',0,'2023-12-06'),(7,'Le Temps D?Aimer','2h05min','Drame, Romance','1947. Sur une plage, Madeleine, serveuse dans un h├┤tel-restaurant, m├¿re d?un petit gar├ºon, fait la connaissance de Fran├ºois, ├®tudiant riche et cultiv├®. Entre eux, c?est comme une ├®vidence. La providence. Si l?on sait ce qu?elle veut laisser derri├¿re elle en suivant ce jeune homme, on d├®couvre avec le temps ce que Fran├ºois tente de fuir en m├¬lant le destin de Madeleine au sien...','Katell Quill├®v├®r├®','Katell Quill├®v├®r├®, Gilles Taurand','Ana├»s Demoustier, Vincent Lacoste, Paul Beaurepaire',0,'2023-11-29'),(8,'Et la f├¬te continue !','1h46min','Com├®die dramatique','A Marseille, Rosa, 60 ans a consacr├® sa vie ├á sa famille et ├á la politique avec le m├¬me sens du sacrifice. Tous pensent qu?elle est in├®branlable d?autant que Rosa est la seule qui pourrait sceller l?union de la gauche ├á la veille d?une ├®ch├®ance ├®lectorale d├®cisive. Elle s?accommode finalement bien de tout ├ºa, jusqu?au jour o├╣ elle tombe amoureuse d?Henri. Pour la premi├¿re fois, Rosa a peur de s?engager. Entre la pression de sa famille politique et son envie de l├ócher prise, le dilemme est lourd ├á porter.','Robert Gu├®diguian','Robert Gu├®diguian, Serge Valletti','Ariane Ascaride, Jean-Pierre Darroussin, Lola Naymark',0,'2023-11-15'),(9,'La Passion de Dodin Bouffant','2h14min','Drame, Historique, Romance','Eug├®nie, cuisini├¿re hors pair, est depuis 20 ans au service du c├®l├¿bre gastronome Dodin. Au fil du temps, de la pratique de la gastronomie et de l\'admiration r├®ciproque est n├®e une relation amoureuse. De cette union naissent des plats tous plus savoureux et d├®licats les uns que les autres qui vont jusqu?├á ├®merveiller les plus grands de ce monde. Pourtant, Eug├®nie, avide de libert├®, n?a jamais voulu se marier avec Dodin. Ce dernier d├®cide alors de faire quelque chose qu?il n?a encore jamais fait : cuisiner pour elle.','Tran Anh Hung','Tran Anh Hung','Juliette Binoche, Beno├«t Magimel, Emmanuel Salinger',0,'2023-11-08'),(10,'Le Gar├ºon et le H├®ron','2h03min','Animation, Drame, Aventure','Apr├¿s la disparition de sa m├¿re dans un incendie, Mahito, un jeune gar├ºon de 11 ans, doit quitter Tokyo pour partir vivre ├á la campagne dans le village o├╣ elle a grandi. Il s?installe avec son p├¿re dans un vieux manoir situ├® sur un immense domaine o├╣ il rencontre un h├®ron cendr├® qui devient petit ├á petit son guide et l?aide au fil de ses d├®couvertes et questionnements ├á comprendre le monde qui l\'entoure et percer les myst├¿res de la vie.','Hayao Miyazaki','Hayao Miyazaki','Gavril Dartevelle, Soma Santoki, Padrig Vion',10,'2023-11-01');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paiement` (
  `Id_Paiement` int NOT NULL AUTO_INCREMENT,
  `Id_Client` int DEFAULT NULL,
  `Montant` decimal(10,2) DEFAULT NULL,
  `Mode_Paiement` varchar(50) DEFAULT NULL,
  `Date_Paiement` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Paiement`),
  KEY `Id_Client` (`Id_Client`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
INSERT INTO `paiement` VALUES (1,1,15.20,'CB','2023-12-05 19:30:00'),(2,2,9.20,'CB','2023-12-05 19:30:00'),(3,3,18.40,'CB','2023-12-01 19:30:00'),(4,4,24.30,'CB','2023-12-02 19:30:00'),(5,5,17.70,'CB','2023-12-01 19:30:00');
/*!40000 ALTER TABLE `paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_de_cinema`
--

DROP TABLE IF EXISTS `place_de_cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_de_cinema` (
  `Id_Billet` int NOT NULL AUTO_INCREMENT,
  `Id_Seance` int DEFAULT NULL,
  `Id_Tarif` int DEFAULT NULL,
  `Id_Client` int DEFAULT NULL,
  `Statut` varchar(50) DEFAULT NULL,
  `Date_Achat` datetime DEFAULT NULL,
  `Date_Reservation` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Billet`),
  KEY `Id_Seance` (`Id_Seance`),
  KEY `Id_Tarif` (`Id_Tarif`),
  KEY `Id_Client` (`Id_Client`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_de_cinema`
--

LOCK TABLES `place_de_cinema` WRITE;
/*!40000 ALTER TABLE `place_de_cinema` DISABLE KEYS */;
INSERT INTO `place_de_cinema` VALUES (1,29,3,5,'Pay├®','2023-12-05 19:30:00',NULL),(2,29,3,5,'Pay├®','2023-12-05 19:30:00',NULL),(3,29,3,5,'Pay├®','2023-12-05 19:30:00',NULL),(4,45,1,5,'R├®serv├®',NULL,'2023-12-03 19:30:00'),(5,45,1,5,'R├®serv├®',NULL,'2023-12-03 19:30:00'),(6,50,1,4,'Pay├®','2023-12-01 19:30:00',NULL),(7,50,1,4,'Pay├®','2023-12-01 19:30:00',NULL),(8,50,3,4,'Pay├®','2023-12-01 19:30:00',NULL),(9,34,1,3,'Pay├®','2023-12-05 19:30:00',NULL),(10,34,1,3,'Pay├®','2023-12-05 19:30:00',NULL),(11,20,1,2,'Pay├®','2023-12-05 19:30:00',NULL),(12,24,1,1,'R├®serv├®',NULL,'2023-12-08 15:20:00'),(13,40,2,1,'Pay├®','2023-12-05 19:30:00',NULL),(14,40,2,1,'Pay├®','2023-12-05 19:30:00',NULL);
/*!40000 ALTER TABLE `place_de_cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salle` (
  `Id_Salle` int NOT NULL AUTO_INCREMENT,
  `Capacite` int DEFAULT NULL,
  `Numero_Salle` varchar(10) DEFAULT NULL,
  `Type_Salle` varchar(50) DEFAULT NULL,
  `Id_Cinema` int DEFAULT NULL,
  PRIMARY KEY (`Id_Salle`),
  KEY `Id_Cinema` (`Id_Cinema`),
  CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`Id_Cinema`) REFERENCES `cinema` (`Id_Cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salle`
--

LOCK TABLES `salle` WRITE;
/*!40000 ALTER TABLE `salle` DISABLE KEYS */;
INSERT INTO `salle` VALUES (1,530,'Salle 1','Grand Ecran',1),(2,80,'Salle 2','Standard',2),(3,120,'Salle 3','Standard',3),(4,196,'Salle 4','3D',3),(5,330,'Salle 5','Dolby SR',5),(6,194,'Salle 6','Dolby SR',2),(7,220,'Salle 7','Dolby SR',3),(8,180,'Salle 8','Dolby SR',4),(9,180,'Salle 9','Dolby SR',5),(10,384,'Salle 10','Laser 4K Atmos',1),(11,180,'Salle 1','Standard',3),(12,220,'Salle 2','Standard',4),(13,195,'Salle 3','Dolby SR',5),(14,130,'Salle 4','Dolby SR',1),(15,120,'Salle 5','3D',2),(16,250,'Salle 1','Standard',3),(17,130,'Salle 2','Standard',4),(18,180,'Salle 3','Dolby SR',5),(19,170,'Salle 4','3D',4),(20,250,'Salle 5','Standard',3),(21,250,'Salle 1','Standard',2),(22,280,'Salle 2','Dolby SR',1),(23,120,'Salle 3','Dolby SR',4),(24,180,'Salle 4','Dolby SR',3),(25,350,'Salle 5','Standard',2),(26,250,'Salle 1','Standard',1),(27,200,'Salle 2','Dolby SR',5),(28,180,'Salle 3','Dolby SR',4),(29,220,'Salle 4','Standard',3),(30,220,'Salle 5','3D',2),(31,180,'Salle 6','3D',1),(32,230,'Salle 7','3D',2),(33,190,'Salle 8','3D',3),(34,280,'Salle 9','Dolby SR',4),(35,350,'Salle 10','Laser 4K Atmos',5);
/*!40000 ALTER TABLE `salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seance` (
  `Id_Seance` int NOT NULL AUTO_INCREMENT,
  `Horaire` datetime NOT NULL,
  `Id_Film` int DEFAULT NULL,
  `Id_Salle` int DEFAULT NULL,
  PRIMARY KEY (`Id_Seance`),
  KEY `Id_Film` (`Id_Film`),
  KEY `Id_Salle` (`Id_Salle`),
  CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`Id_Film`) REFERENCES `film` (`Id_Film`),
  CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`Id_Salle`) REFERENCES `salle` (`Id_Salle`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seance`
--

LOCK TABLES `seance` WRITE;
/*!40000 ALTER TABLE `seance` DISABLE KEYS */;
INSERT INTO `seance` VALUES (1,'2023-12-01 09:00:00',1,1),(2,'2023-12-01 12:00:00',2,1),(3,'2023-12-01 15:00:00',3,1),(4,'2023-12-01 18:00:00',4,1),(5,'2023-12-01 21:00:00',5,1),(6,'2023-12-01 09:30:00',2,2),(7,'2023-12-01 12:30:00',3,2),(8,'2023-12-01 15:30:00',4,2),(9,'2023-12-01 18:30:00',5,2),(10,'2023-12-01 21:30:00',1,2),(11,'2023-12-01 10:00:00',6,3),(12,'2023-12-01 13:00:00',7,3),(13,'2023-12-01 16:00:00',8,3),(14,'2023-12-01 19:00:00',9,3),(15,'2023-12-01 22:00:00',10,3),(16,'2023-12-01 09:00:00',10,4),(17,'2023-12-01 12:00:00',9,4),(18,'2023-12-01 15:00:00',8,4),(19,'2023-12-01 18:00:00',7,4),(20,'2023-12-01 21:00:00',6,4),(21,'2023-12-01 09:30:00',2,5),(22,'2023-12-01 12:30:00',3,5),(23,'2023-12-01 15:30:00',4,5),(24,'2023-12-01 18:30:00',5,5),(25,'2023-12-01 21:30:00',1,5),(26,'2023-12-01 10:00:00',3,6),(27,'2023-12-01 13:00:00',4,6),(28,'2023-12-01 16:00:00',5,6),(29,'2023-12-01 19:00:00',1,6),(30,'2023-12-01 22:00:00',2,6),(31,'2023-12-01 09:00:00',9,7),(32,'2023-12-01 12:00:00',10,7),(33,'2023-12-01 15:00:00',6,7),(34,'2023-12-01 18:00:00',7,7),(35,'2023-12-01 21:00:00',8,7),(36,'2023-12-01 09:30:00',10,8),(37,'2023-12-01 12:30:00',6,8),(38,'2023-12-01 15:30:00',7,8),(39,'2023-12-01 18:30:00',8,8),(40,'2023-12-01 21:30:00',9,8),(41,'2023-12-01 10:00:00',1,9),(42,'2023-12-01 13:00:00',2,9),(43,'2023-12-01 16:00:00',3,9),(44,'2023-12-01 19:00:00',4,9),(45,'2023-12-01 22:00:00',5,9),(46,'2023-12-01 10:00:00',6,10),(47,'2023-12-01 13:00:00',7,10),(48,'2023-12-01 16:00:00',8,10),(49,'2023-12-01 19:00:00',9,10),(50,'2023-12-01 22:00:00',10,10);
/*!40000 ALTER TABLE `seance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarif` (
  `Id_Tarif` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `Prix` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Id_Tarif`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
INSERT INTO `tarif` VALUES (1,'Plein tarif',9.20),(2,'Etudiant',7.60),(3,'Moins de 14 ans',5.90);
/*!40000 ALTER TABLE `tarif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `Id_Utilisateur` int NOT NULL AUTO_INCREMENT,
  `Prenom` varchar(255) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Mot_De_Passe` varchar(100) NOT NULL,
  `Id_Cinema` int DEFAULT NULL,
  PRIMARY KEY (`Id_Utilisateur`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Id_Cinema` (`Id_Cinema`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`Id_Cinema`) REFERENCES `cinema` (`Id_Cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'Denis','Gauthier','Administrateur','denisg027@gmail.com','DeNiS2707┬º',1),(2,'Ludovic','Leguebe','Administrateur','ludovic.leguebe@gmail.com','88$LB#xj',2),(3,'Eric','Hamon','Administrateur','eric.hamon@gmail.com','9q]Mx%4A',3),(4,'Yohann','Chauvet','Administrateur','yohann.chauvet@gmail.com','{HjEj@82',4),(5,'Herv├®','Jayol','Administrateur','herve.jayol@gmail.com','8!CrPs[8',5);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-14 18:05:49
