-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (arm64)
--
-- Host: localhost    Database: P4
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `Canteen Languages`
--

DROP TABLE IF EXISTS `Canteen Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Canteen Languages` (
  `Language` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Language`,`Name`),
  KEY `Name` (`Name`),
  CONSTRAINT `canteen languages_ibfk_1` FOREIGN KEY (`Name`) REFERENCES `Canteen Owner` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canteen Languages`
--

LOCK TABLES `Canteen Languages` WRITE;
/*!40000 ALTER TABLE `Canteen Languages` DISABLE KEYS */;
INSERT INTO `Canteen Languages` VALUES ('English','BBC Owner'),('Hindi','BBC Owner'),('Telegu','BBC Owner'),('English','David Owner'),('Hindi','David Owner'),('Telegu','David Owner'),('English','Health Owner'),('Hindi','Health Owner'),('Telegu','Health Owner'),('English','JC Owner'),('Hindi','JC Owner'),('Telegu','JC Owner'),('English','Tantra Owner'),('Hindi','Tantra Owner'),('Telegu','Tantra Owner'),('English','VC Owner'),('Hindi','VC Owner'),('Telegu','VC Owner');
/*!40000 ALTER TABLE `Canteen Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Canteen Owner`
--

DROP TABLE IF EXISTS `Canteen Owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Canteen Owner` (
  `Name` varchar(100) NOT NULL,
  `Email id` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(100) DEFAULT NULL,
  `Canteen_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `Canteen_Name` (`Canteen_Name`),
  CONSTRAINT `Canteen Owner_ibfk_1` FOREIGN KEY (`Canteen_Name`) REFERENCES `Canteens` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canteen Owner`
--

LOCK TABLES `Canteen Owner` WRITE;
/*!40000 ALTER TABLE `Canteen Owner` DISABLE KEYS */;
INSERT INTO `Canteen Owner` VALUES ('BBC Owner','BBC_Owner@gmail.com','1111111111','BasketBall Canteen'),('David Owner','David_Owner@gmail.com','2222222222','David Bakery'),('Health Owner','Health_Owner@gmail.com','3333333333','Health Canteen'),('JC Owner','JC_Owner@gmail.com','4444444444','Juice Canteen'),('Tantra Owner','Tantra_Owner@gmail.com','5555555555','Tantra'),('VC Owner','VC_Owner@gmail.com','6666666666','Vindhya Canteen');
/*!40000 ALTER TABLE `Canteen Owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Canteens`
--

DROP TABLE IF EXISTS `Canteens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Canteens` (
  `Name` varchar(100) NOT NULL,
  `Serves Non-Veg` tinyint(1) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canteens`
--

LOCK TABLES `Canteens` WRITE;
/*!40000 ALTER TABLE `Canteens` DISABLE KEYS */;
INSERT INTO `Canteens` VALUES ('BasketBall Canteen',0,'Near BasketBall Court'),('David Bakery',1,'Near Guest House'),('Health Canteen',0,'Near Research Street'),('Juice Canteen',0,'Near Guest House'),('Tantra',1,'Near Guest House'),('Vindhya Canteen',1,'Near Research Street');
/*!40000 ALTER TABLE `Canteens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Canteens_Food Item`
--

DROP TABLE IF EXISTS `Canteens_Food Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Canteens_Food Item` (
  `Canteens_Name` varchar(100) NOT NULL,
  `Food Item_Name` varchar(100) NOT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`Canteens_Name`,`Food Item_Name`),
  KEY `Food Item_Name` (`Food Item_Name`),
  CONSTRAINT `canteens_food item_ibfk_1` FOREIGN KEY (`Canteens_Name`) REFERENCES `Canteens` (`Name`),
  CONSTRAINT `canteens_food item_ibfk_2` FOREIGN KEY (`Food Item_Name`) REFERENCES `Food Item` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canteens_Food Item`
--

LOCK TABLES `Canteens_Food Item` WRITE;
/*!40000 ALTER TABLE `Canteens_Food Item` DISABLE KEYS */;
INSERT INTO `Canteens_Food Item` VALUES ('BasketBall Canteen','Coffee',10),('BasketBall Canteen','Dosa',50),('BasketBall Canteen','Maggi',25),('David Bakery','Brownie',70),('David Bakery','Ice cream',10),('David Bakery','Yogurt',40),('Health Canteen','Chocolates',10),('Health Canteen','Lassi',30),('Health Canteen','Vada Pav',30),('Juice Canteen','Cold Coffee',30),('Juice Canteen','Oreo Coffee',35),('Juice Canteen','Oreo Shake',35),('Tantra','Garlic Naan',50),('Tantra','Paneer Buter Masala',120),('Tantra','Shwarma',80),('Vindhya Canteen','Burger',60),('Vindhya Canteen','Ice Tea',25);
/*!40000 ALTER TABLE `Canteens_Food Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dislikes, Served By`
--

DROP TABLE IF EXISTS `Dislikes, Served By`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dislikes, Served By` (
  `Mess_name` varchar(100) NOT NULL,
  `Student_id` varchar(100) NOT NULL,
  `Meal_id` varchar(100) NOT NULL,
  `Reasons` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Mess_name`,`Student_id`,`Meal_id`),
  KEY `Student_id` (`Student_id`),
  KEY `Meal_id` (`Meal_id`),
  CONSTRAINT `dislikes, served by_ibfk_1` FOREIGN KEY (`Mess_name`) REFERENCES `Messes` (`Name`),
  CONSTRAINT `dislikes, served by_ibfk_2` FOREIGN KEY (`Student_id`) REFERENCES `Students` (`Roll_number`),
  CONSTRAINT `dislikes, served by_ibfk_3` FOREIGN KEY (`Meal_id`) REFERENCES `Meal` (`Meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dislikes, Served By`
--

LOCK TABLES `Dislikes, Served By` WRITE;
/*!40000 ALTER TABLE `Dislikes, Served By` DISABLE KEYS */;
INSERT INTO `Dislikes, Served By` VALUES ('Kadamb','2021101005','331','Chapati is burnt'),('Kadamb','2021101074','331','Bhindi is oily'),('Kadamb','2021101098','331','Food is bad'),('North','2021101005','322','Don\'t like the biryani'),('North','2021101039','732','Food is oily');
/*!40000 ALTER TABLE `Dislikes, Served By` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dislikes, Sold By`
--

DROP TABLE IF EXISTS `Dislikes, Sold By`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dislikes, Sold By` (
  `Canteen_name` varchar(100) NOT NULL,
  `Student_id` varchar(100) NOT NULL,
  `Item_name` varchar(100) NOT NULL,
  `Reasons` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Canteen_name`,`Student_id`,`Item_name`),
  KEY `Student_id` (`Student_id`),
  KEY `Item_name` (`Item_name`),
  CONSTRAINT `dislikes, sold by_ibfk_1` FOREIGN KEY (`Canteen_name`) REFERENCES `Canteens` (`Name`),
  CONSTRAINT `dislikes, sold by_ibfk_2` FOREIGN KEY (`Student_id`) REFERENCES `Students` (`Roll_number`),
  CONSTRAINT `dislikes, sold by_ibfk_3` FOREIGN KEY (`Item_name`) REFERENCES `Food Item` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dislikes, Sold By`
--

LOCK TABLES `Dislikes, Sold By` WRITE;
/*!40000 ALTER TABLE `Dislikes, Sold By` DISABLE KEYS */;
INSERT INTO `Dislikes, Sold By` VALUES ('BasketBall Canteen','2021101005','Maggi','takes too long and is too spicy'),('BasketBall Canteen','2021101074','Dosa','dosa can be too soft'),('Juice Canteen','2021101005','Cold Coffee','too bitter'),('Juice Canteen','2021101098','Oreo Shake','too sweet'),('Tantra','2021101005','Shwarma','filling tastes weird');
/*!40000 ALTER TABLE `Dislikes, Sold By` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food Item`
--

DROP TABLE IF EXISTS `Food Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Food Item` (
  `Name` varchar(100) NOT NULL,
  `Pair` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `Pair` (`Pair`),
  CONSTRAINT `food item_ibfk_1` FOREIGN KEY (`Pair`) REFERENCES `Food Item` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food Item`
--

LOCK TABLES `Food Item` WRITE;
/*!40000 ALTER TABLE `Food Item` DISABLE KEYS */;
INSERT INTO `Food Item` VALUES ('Chocolates',NULL),('Dosa',NULL),('Oreo Coffee',NULL),('Shwarma',NULL),('Yogurt',NULL),('Ice Cream','Brownie'),('Ice Tea','Burger'),('Maggi','Coffee'),('Oreo Shake','Cold Coffee'),('Paneer Buter Masala','Garlic Naan'),('Brownie','Ice Cream'),('Burger','Ice Tea'),('Vada Pav','Lassi'),('Coffee','Maggi'),('Cold Coffee','Oreo Shake'),('Garlic Naan','Paneer Butter Masala'),('Lassi','Vada Pav');
/*!40000 ALTER TABLE `Food Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goes to,When,Serves`
--

DROP TABLE IF EXISTS `Goes to,When,Serves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Goes to,When,Serves` (
  `Canteen_name` varchar(100) NOT NULL,
  `Student_id` varchar(100) NOT NULL,
  `Meal_id` varchar(100) NOT NULL,
  `Mess_name` varchar(100) NOT NULL,
  PRIMARY KEY (`Canteen_name`,`Student_id`,`Meal_id`,`Mess_name`),
  KEY `Student_id` (`Student_id`),
  KEY `Mess_name` (`Mess_name`),
  KEY `Meal_id` (`Meal_id`),
  CONSTRAINT `goes to,when,serves_ibfk_1` FOREIGN KEY (`Canteen_name`) REFERENCES `Canteens` (`Name`),
  CONSTRAINT `goes to,when,serves_ibfk_2` FOREIGN KEY (`Student_id`) REFERENCES `Students` (`Roll_number`),
  CONSTRAINT `goes to,when,serves_ibfk_3` FOREIGN KEY (`Mess_name`) REFERENCES `Messes` (`Name`),
  CONSTRAINT `goes to,when,serves_ibfk_4` FOREIGN KEY (`Meal_id`) REFERENCES `Meal` (`Meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goes to,When,Serves`
--

LOCK TABLES `Goes to,When,Serves` WRITE;
/*!40000 ALTER TABLE `Goes to,When,Serves` DISABLE KEYS */;
INSERT INTO `Goes to,When,Serves` VALUES ('BasketBall Canteen','2021101005','322','North'),('Tantra','2021101005','331','Kadamb'),('BasketBall Canteen','2021101039','621','Kadamb'),('Tantra','2021101074','331','Kadamb'),('Tantra','2021101098','331','Kadamb');
/*!40000 ALTER TABLE `Goes to,When,Serves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Likes, Served By`
--

DROP TABLE IF EXISTS `Likes, Served By`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Likes, Served By` (
  `Mess_name` varchar(100) NOT NULL,
  `Student_id` varchar(100) NOT NULL,
  `Meal_id` varchar(100) NOT NULL,
  `Reasons` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Mess_name`,`Student_id`,`Meal_id`),
  KEY `Student_id` (`Student_id`),
  KEY `Meal_id` (`Meal_id`),
  CONSTRAINT `likes, served by_ibfk_1` FOREIGN KEY (`Mess_name`) REFERENCES `Messes` (`Name`),
  CONSTRAINT `likes, served by_ibfk_2` FOREIGN KEY (`Student_id`) REFERENCES `Students` (`Roll_number`),
  CONSTRAINT `likes, served by_ibfk_3` FOREIGN KEY (`Meal_id`) REFERENCES `Meal` (`Meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Likes, Served By`
--

LOCK TABLES `Likes, Served By` WRITE;
/*!40000 ALTER TABLE `Likes, Served By` DISABLE KEYS */;
INSERT INTO `Likes, Served By` VALUES ('Kadamb','2021101005','431','egg burji is really nice and so is the kesari'),('Kadamb','2021101074','431','egg burji is really nice'),('Kadamb','2021101098','431','egg burji is great source of protein'),('North','2021101005','732','Paneer is well cooked'),('Yuktahar','2021101039','124','Pongal is amazing');
/*!40000 ALTER TABLE `Likes, Served By` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Likes, Sold By`
--

DROP TABLE IF EXISTS `Likes, Sold By`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Likes, Sold By` (
  `Canteen_name` varchar(100) NOT NULL,
  `Student_id` varchar(100) NOT NULL,
  `Item_name` varchar(100) NOT NULL,
  `Reasons` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Canteen_name`,`Student_id`,`Item_name`),
  KEY `Student_id` (`Student_id`),
  KEY `Item_name` (`Item_name`),
  CONSTRAINT `likes, sold by_ibfk_1` FOREIGN KEY (`Canteen_name`) REFERENCES `Canteens` (`Name`),
  CONSTRAINT `likes, sold by_ibfk_2` FOREIGN KEY (`Student_id`) REFERENCES `Students` (`Roll_number`),
  CONSTRAINT `likes, sold by_ibfk_3` FOREIGN KEY (`Item_name`) REFERENCES `Food Item` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Likes, Sold By`
--

LOCK TABLES `Likes, Sold By` WRITE;
/*!40000 ALTER TABLE `Likes, Sold By` DISABLE KEYS */;
INSERT INTO `Likes, Sold By` VALUES ('BasketBall Canteen','2021101005','Dosa','Cheap,filling and tasty'),('BasketBall Canteen','2021101039','Dosa','Really filling and cheap'),('BasketBall Canteen','2021101074','Maggi','Cheap,filling'),('David Bakery','2021101005','Brownie','Awesome dessert, cheap too'),('Juice Canteen','2021101074','Cold Coffee','Helps in staying awake'),('Tantra','2021101098','Shwarma','Spicy,great source of protein');
/*!40000 ALTER TABLE `Likes, Sold By` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meal`
--

DROP TABLE IF EXISTS `Meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Meal` (
  `Meal_id` varchar(100) NOT NULL,
  `Mess_Name` varchar(100) DEFAULT NULL,
  `Time of day` varchar(100) DEFAULT NULL,
  `Day Served` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Meal_id`),
  KEY `Mess_Name` (`Mess_Name`),
  CONSTRAINT `meal_ibfk_1` FOREIGN KEY (`Mess_Name`) REFERENCES `Messes` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meal`
--

LOCK TABLES `Meal` WRITE;
/*!40000 ALTER TABLE `Meal` DISABLE KEYS */;
INSERT INTO `Meal` VALUES ('111','Kadamb','Breakfast','Monday'),('112','North','Breakfast','Monday'),('113','South','Breakfast','Monday'),('114','Yuktahar','Breakfast','Monday'),('121','Kadamb','Lunch','Monday'),('122','North','Lunch','Monday'),('123','South','Lunch','Monday'),('124','Yuktahar','Lunch','Monday'),('131','Kadamb','Dinner','Monday'),('132','North','Dinner','Monday'),('133','South','Dinner','Monday'),('134','Yuktahar','Dinner','Monday'),('211','Kadamb','Breakfast','Tuesday'),('212','North','Breakfast','Tuesday'),('213','South','Breakfast','Tuesday'),('214','Yuktahar','Breakfast','Tuesday'),('221','Kadamb','Lunch','Tuesday'),('222','North','Lunch','Tuesday'),('223','South','Lunch','Tuesday'),('224','Yuktahar','Lunch','Tuesday'),('231','Kadamb','Dinner','Tuesday'),('232','North','Dinner','Tuesday'),('233','South','Dinner','Tuesday'),('234','Yuktahar','Dinner','Tuesday'),('311','Kadamb','Breakfast','Wednesday'),('312','North','Breakfast','Wednesday'),('313','South','Breakfast','Wednesday'),('314','Yuktahar','Breakfast','Wednesday'),('321','Kadamb','Lunch','Wednesday'),('322','North','Lunch','Wednesday'),('323','South','Lunch','Wednesday'),('324','Yuktahar','Lunch','Wednesday'),('331','Kadamb','Dinner','Wednesday'),('332','North','Dinner','Wednesday'),('333','South','Dinner','Wednesday'),('334','Yuktahar','Dinner','Wednesday'),('411','Kadamb','Breakfast','Thursday'),('412','North','Breakfast','Thursday'),('413','South','Breakfast','Thursday'),('414','Yuktahar','Breakfast','Thursday'),('421','Kadamb','Lunch','Thursday'),('422','North','Lunch','Thursday'),('423','South','Lunch','Thursday'),('424','Yuktahar','Lunch','Thursday'),('431','Kadamb','Dinner','Thursday'),('432','North','Dinner','Thursday'),('433','South','Dinner','Thursday'),('434','Yuktahar','Dinner','Thursday'),('511','Kadamb','Breakfast','Friday'),('512','North','Breakfast','Friday'),('513','South','Breakfast','Friday'),('514','Yuktahar','Breakfast','Friday'),('521','Kadamb','Lunch','Friday'),('522','North','Lunch','Friday'),('523','South','Lunch','Friday'),('524','Yuktahar','Lunch','Friday'),('531','Kadamb','Dinner','Friday'),('532','North','Dinner','Friday'),('533','South','Dinner','Friday'),('534','Yuktahar','Dinner','Friday'),('611','Kadamb','Breakfast','Saturday'),('612','North','Breakfast','Saturday'),('613','South','Breakfast','Saturday'),('614','Yuktahar','Breakfast','Saturday'),('621','Kadamb','Lunch','Saturday'),('622','North','Lunch','Saturday'),('623','South','Lunch','Saturday'),('624','Yuktahar','Lunch','Saturday'),('631','Kadamb','Dinner','Saturday'),('632','North','Dinner','Saturday'),('633','South','Dinner','Saturday'),('634','Yuktahar','Dinner','Saturday'),('711','Kadamb','Breakfast','Sunday'),('712','North','Breakfast','Sunday'),('713','South','Breakfast','Sunday'),('714','Yuktahar','Breakfast','Sunday'),('721','Kadamb','Lunch','Sunday'),('722','North','Lunch','Sunday'),('723','South','Lunch','Sunday'),('724','Yuktahar','Lunch','Sunday'),('731','Kadamb','Dinner','Sunday'),('732','North','Dinner','Sunday'),('733','South','Dinner','Sunday'),('734','Yuktahar','Dinner','Sunday');
/*!40000 ALTER TABLE `Meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mess Food`
--

DROP TABLE IF EXISTS `Mess Food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mess Food` (
  `Meal_id` varchar(100) NOT NULL,
  `Food_item` varchar(100) NOT NULL,
  PRIMARY KEY (`Meal_id`,`Food_item`),
  CONSTRAINT `mess food_ibfk_1` FOREIGN KEY (`Meal_id`) REFERENCES `Meal` (`Meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mess Food`
--

LOCK TABLES `Mess Food` WRITE;
/*!40000 ALTER TABLE `Mess Food` DISABLE KEYS */;
INSERT INTO `Mess Food` VALUES ('111','Omelette'),('112','Aloo Parantha'),('113','Wada'),('114','Idli'),('121','Rajma'),('122','Rajma'),('123','Aloo Tamatar'),('124','Paneer'),('131','Moong Dal'),('132','Gobi Matar'),('133','Navrathan Korma'),('134','Masala Gobi'),('211','Omelette'),('212','Poha'),('213','Poori'),('214','Upma'),('221','Masoor'),('222','Aloo Pyaaz'),('223','Rajma'),('224','Masoor'),('231','Gobi Manchurian'),('232','Paneer'),('233','Bhindi'),('234','Bhindi'),('311','Omelette'),('312','Daliya'),('313','Idli'),('314','Poha'),('321','Biryani'),('322','Paneer Do Pyaza'),('323','Biryani'),('324','Aloo Methi'),('331','Bhindi'),('332','Aloo Parantha'),('333','Pumpkin'),('334','Coconut'),('411','Omelette'),('412','Upma'),('413','Uttapam'),('414','Upma'),('421','Sambhar'),('422','Chola'),('423','Tomato Pappu'),('424','Chola'),('431','Paneer'),('432','Aloo Methi'),('433','Dosa'),('434','Methi Roti'),('511','Boiled Egg'),('512','Sandwich'),('513','Upma'),('514','Idli'),('521','Paneer'),('522','Kofta'),('523','Rasam'),('524','Rajma'),('531','Kofta'),('532','Dum Aloo'),('533','Paneer'),('534','Lobiya'),('611','Omelette'),('612','Vermicelli'),('613','Uggani'),('614','Poha'),('621','Kadhi'),('622','Khoya Matar'),('623','Malai Kofta'),('624','Carrot'),('631','Chocolates'),('632','Chola'),('633','Veg Curry'),('634','Masala Khichdi'),('711','Boiled Egg'),('712','Macroni'),('713','Dosa'),('714','Roti'),('721','Biryani'),('722','Biryani'),('723','Biryani'),('724','Pumpkin'),('731','Soyabean'),('732','Paneer'),('733','Pulao'),('734','Paneer');
/*!40000 ALTER TABLE `Mess Food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mess Head`
--

DROP TABLE IF EXISTS `Mess Head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mess Head` (
  `Name` varchar(100) NOT NULL,
  `Email id` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(100) DEFAULT NULL,
  `Mess_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `Mess_Name` (`Mess_Name`),
  CONSTRAINT `Mess Head_ibfk_1` FOREIGN KEY (`Mess_Name`) REFERENCES `Messes` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mess Head`
--

LOCK TABLES `Mess Head` WRITE;
/*!40000 ALTER TABLE `Mess Head` DISABLE KEYS */;
INSERT INTO `Mess Head` VALUES ('Kadamb Head','Kadamb_Head@gmail.com','0101010101','Kadamb'),('North Head','North_Head@gmail.com','1212121212','North'),('South Head','South_Head@gmail.com','2323232323','South'),('Yuktahar Head','Yuktahar_Head@gmail.com','3434343434','Yuktahar');
/*!40000 ALTER TABLE `Mess Head` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mess Languages`
--

DROP TABLE IF EXISTS `Mess Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mess Languages` (
  `Language` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Language`,`Name`),
  KEY `Name` (`Name`),
  CONSTRAINT `mess languages_ibfk_1` FOREIGN KEY (`Name`) REFERENCES `Mess Head` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mess Languages`
--

LOCK TABLES `Mess Languages` WRITE;
/*!40000 ALTER TABLE `Mess Languages` DISABLE KEYS */;
INSERT INTO `Mess Languages` VALUES ('English','Kadamb Head'),('Hindi','Kadamb Head'),('Telegu','Kadamb Head'),('English','North Head'),('Hindi','North Head'),('Telegu','North Head'),('English','South Head'),('Hindi','South Head'),('Telegu','South Head'),('English','Yuktahar Head'),('Hindi','Yuktahar Head'),('Telegu','Yuktahar Head');
/*!40000 ALTER TABLE `Mess Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messes`
--

DROP TABLE IF EXISTS `Messes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messes` (
  `Name` varchar(100) NOT NULL,
  `Serves Non-Veg` tinyint(1) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messes`
--

LOCK TABLES `Messes` WRITE;
/*!40000 ALTER TABLE `Messes` DISABLE KEYS */;
INSERT INTO `Messes` VALUES ('Kadamb',1,'Near Football Ground'),('NORTH',0,'Old Boys Hostel'),('SOUTH',0,'Old Boys Hostel'),('Yuktahar',0,'Near Football ground, above Kadamb');
/*!40000 ALTER TABLE `Messes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment methods - Canteen`
--

DROP TABLE IF EXISTS `Payment methods - Canteen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment methods - Canteen` (
  `Mode_of_Payment` varchar(100) NOT NULL,
  `Canteen_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Mode_of_Payment`,`Canteen_Name`),
  KEY `Canteen_Name` (`Canteen_Name`),
  CONSTRAINT `payment methods - canteen_ibfk_1` FOREIGN KEY (`Canteen_Name`) REFERENCES `Canteens` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment methods - Canteen`
--

LOCK TABLES `Payment methods - Canteen` WRITE;
/*!40000 ALTER TABLE `Payment methods - Canteen` DISABLE KEYS */;
INSERT INTO `Payment methods - Canteen` VALUES ('UPI','BasketBall Canteen'),('UPI','David Bakery'),('Cash','Health Canteen'),('UPI','Health Canteen'),('UPI','Juice Canteen'),('Cash','Tantra'),('Credit Card','Tantra'),('UPI','Tantra'),('UPI','Vindhya Canteen');
/*!40000 ALTER TABLE `Payment methods - Canteen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment methods - Mess`
--

DROP TABLE IF EXISTS `Payment methods - Mess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment methods - Mess` (
  `Mode_of_Payment` varchar(100) NOT NULL,
  `Mess_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Mode_of_Payment`,`Mess_Name`),
  KEY `Mess_Name` (`Mess_Name`),
  CONSTRAINT `payment methods - mess_ibfk_1` FOREIGN KEY (`Mess_Name`) REFERENCES `Messes` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment methods - Mess`
--

LOCK TABLES `Payment methods - Mess` WRITE;
/*!40000 ALTER TABLE `Payment methods - Mess` DISABLE KEYS */;
INSERT INTO `Payment methods - Mess` VALUES ('Mess Fee','Kadamb'),('UPI','Kadamb'),('Mess Fee','North'),('UPI','North'),('Mess Fee','South'),('UPI','South'),('Mess Fee','Yuktahar'),('UPI','Yuktahar');
/*!40000 ALTER TABLE `Payment methods - Mess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registered at Mess, To eat (Relation)`
--

DROP TABLE IF EXISTS `Registered at Mess, To eat (Relation)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registered at Mess, To eat (Relation)` (
  `Mess_name` varchar(100) NOT NULL,
  `Student_id` varchar(100) NOT NULL,
  `Meal_id` varchar(100) NOT NULL,
  PRIMARY KEY (`Mess_name`,`Student_id`,`Meal_id`),
  KEY `Student_id` (`Student_id`),
  KEY `Meal_id` (`Meal_id`),
  CONSTRAINT `registered at mess, to eat (relation)_ibfk_1` FOREIGN KEY (`Mess_name`) REFERENCES `Messes` (`Name`),
  CONSTRAINT `registered at mess, to eat (relation)_ibfk_2` FOREIGN KEY (`Student_id`) REFERENCES `Students` (`Roll_number`),
  CONSTRAINT `registered at mess, to eat (relation)_ibfk_3` FOREIGN KEY (`Meal_id`) REFERENCES `Meal` (`Meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registered at Mess, To eat (Relation)`
--

LOCK TABLES `Registered at Mess, To eat (Relation)` WRITE;
/*!40000 ALTER TABLE `Registered at Mess, To eat (Relation)` DISABLE KEYS */;
INSERT INTO `Registered at Mess, To eat (Relation)` VALUES ('Kadamb','2021101005','431'),('North','2021101005','732'),('Kadamb','2021101039','431'),('Yuktahar','2021101039','124'),('Kadamb','2021101074','431'),('North','2021101074','732'),('Kadamb','2021101098','431'),('North','2021101098','732');
/*!40000 ALTER TABLE `Registered at Mess, To eat (Relation)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `Roll_number` varchar(100) NOT NULL,
  `Mess Preference 1` varchar(100) DEFAULT NULL,
  `Mess Preference 2` varchar(100) DEFAULT NULL,
  `Canteen Preference 1` varchar(100) DEFAULT NULL,
  `Canteen Preference 2` varchar(100) DEFAULT NULL,
  `Programme` varchar(100) DEFAULT NULL,
  `Batch` varchar(4) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Roll_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES ('2021101005','North','Kadamb','BasketBall Canteen','Juice Canteen','CSE','UG-2','Haran Raajesh'),('2021101039','Kadamb','Yuktahar','BasketBall Canteen','David Bakery','CSE','UG-2','Balakumar Velayutham'),('2021101074','Kadamb','North','Tantra','Juice Canteen','CSE','UG-2','Arnav Mago'),('2021101098','Kadamb','North','Vindhya Canteen','David Bakery','CSE','UG-2','Himanshu Sarraf');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students_Canteens`
--

DROP TABLE IF EXISTS `Students_Canteens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students_Canteens` (
  `Students_Roll_number` varchar(100) NOT NULL,
  `Canteens_Name` varchar(100) NOT NULL,
  `Time of Visit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Students_Roll_number`,`Canteens_Name`),
  KEY `Canteens_Name` (`Canteens_Name`),
  CONSTRAINT `students_canteens_ibfk_1` FOREIGN KEY (`Students_Roll_number`) REFERENCES `Students` (`Roll_number`),
  CONSTRAINT `students_canteens_ibfk_2` FOREIGN KEY (`Canteens_Name`) REFERENCES `Canteens` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students_Canteens`
--

LOCK TABLES `Students_Canteens` WRITE;
/*!40000 ALTER TABLE `Students_Canteens` DISABLE KEYS */;
INSERT INTO `Students_Canteens` VALUES ('2021101005','BasketBall Canteen','18:00'),('2021101005','Juice Canteen','23:00'),('2021101039','BasketBall Canteen','9:30'),('2021101074','David Bakery','21:00'),('2021101074','Vindhya Canteen','11:30'),('2021101098','Tantra','20:00');
/*!40000 ALTER TABLE `Students_Canteens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taste of Food`
--

DROP TABLE IF EXISTS `Taste of Food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Taste of Food` (
  `Item_Name` varchar(100) NOT NULL,
  `Taste_type` varchar(100) NOT NULL,
  PRIMARY KEY (`Item_Name`,`Taste_type`),
  CONSTRAINT `taste of food_ibfk_1` FOREIGN KEY (`Item_Name`) REFERENCES `Food Item` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taste of Food`
--

LOCK TABLES `Taste of Food` WRITE;
/*!40000 ALTER TABLE `Taste of Food` DISABLE KEYS */;
INSERT INTO `Taste of Food` VALUES ('Chocolates','Sweet'),('Cold Coffee','Bitter'),('Ice Tea','Sweet'),('Lassi','Sweet'),('Oreo Coffee','Bitter'),('Oreo Coffee','Sweet'),('Paneer Buter Masala','Spicy'),('Shwarma','Spicy');
/*!40000 ALTER TABLE `Taste of Food` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-16 15:28:20
