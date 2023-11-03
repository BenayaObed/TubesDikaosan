/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : rpl

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 02/11/2023 01:57:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings`  (
  `BookingID` int NOT NULL,
  `UserID` int NULL DEFAULT NULL,
  `TransportationID` int NULL DEFAULT NULL,
  `HotelID` int NULL DEFAULT NULL,
  `SpotID` int NULL DEFAULT NULL,
  `TotalPrice` decimal(10, 2) NULL DEFAULT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BookingDate` datetime NULL DEFAULT NULL,
  `CheckInDate` datetime NULL DEFAULT NULL,
  `CheckOutDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`BookingID`) USING BTREE,
  INDEX `FK_user`(`UserID`) USING BTREE,
  INDEX `FK_transport`(`TransportationID`) USING BTREE,
  INDEX `FK_Hotel`(`HotelID`) USING BTREE,
  INDEX `FK_Spot`(`SpotID`) USING BTREE,
  CONSTRAINT `FK_user` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_transport` FOREIGN KEY (`TransportationID`) REFERENCES `transportation` (`TransportationID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Hotel` FOREIGN KEY (`HotelID`) REFERENCES `hotels` (`HotelID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Spot` FOREIGN KEY (`SpotID`) REFERENCES `touristspots` (`SpotID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO `bookings` VALUES (1, 1, 1, 1, 1, 950.00, 'Pending', '2023-09-15 00:00:00', '2023-10-01 00:00:00', '2023-11-05 00:00:00');
INSERT INTO `bookings` VALUES (2, 2, 2, 2, 2, 650.00, 'Confirmed', '2023-08-20 00:00:00', '2023-10-05 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `bookings` VALUES (3, 3, 3, 3, 3, 850.00, 'Confirmed', '2023-08-01 00:00:00', '2023-08-10 00:00:00', '2023-08-11 00:00:00');

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `CityID` int NOT NULL,
  `NameCities` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Population` int NULL DEFAULT NULL,
  `Area` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`CityID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES (1, 'Jakarta', 'Indonesia', 8500000, 468.90);
INSERT INTO `cities` VALUES (2, 'Bandung', 'Indonesia', 4000000, 469.10);
INSERT INTO `cities` VALUES (3, 'Surabaya', 'Indonesia', 2700000, 227.60);

-- ----------------------------
-- Table structure for hotels
-- ----------------------------
DROP TABLE IF EXISTS `hotels`;
CREATE TABLE `hotels`  (
  `HotelID` int NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PricePerNight` decimal(10, 2) NULL DEFAULT NULL,
  `RoomType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `StarRating` int NULL DEFAULT NULL,
  PRIMARY KEY (`HotelID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotels
-- ----------------------------
INSERT INTO `hotels` VALUES (1, 'Grand Resort Cuk', 'Pentor', 150.00, 'Suite', 'Balking comfortable room.', 4);
INSERT INTO `hotels` VALUES (2, 'Save Palet', 'Sifalate', 120.00, 'Standard', 'Cutting resort.', 5);
INSERT INTO `hotels` VALUES (3, 'Vio de Natu', 'Beriok', 200.00, 'Deluxe', 'Cluriet resort.', 3);

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `PaymentID` int NOT NULL,
  `BookingID` int NULL DEFAULT NULL,
  `PaymentMethod` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentID`) USING BTREE,
  INDEX `FK_Boking`(`BookingID`) USING BTREE,
  CONSTRAINT `FK_Boking` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 1, 'QRIS');
INSERT INTO `payment` VALUES (2, 2, 'Debit Card');
INSERT INTO `payment` VALUES (3, 3, 'Credit Card');

-- ----------------------------
-- Table structure for touristpackagebookings
-- ----------------------------
DROP TABLE IF EXISTS `touristpackagebookings`;
CREATE TABLE `touristpackagebookings`  (
  `AgentBookingID` int NOT NULL,
  `AgentID` int NULL DEFAULT NULL,
  `BookingID` int NULL DEFAULT NULL,
  `SpotID` int NULL DEFAULT NULL,
  `RoyaltyAgen` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`AgentBookingID`) USING BTREE,
  INDEX `FK_Agent`(`AgentID`) USING BTREE,
  INDEX `FK_Booking`(`BookingID`) USING BTREE,
  INDEX `FK_SpotID`(`SpotID`) USING BTREE,
  CONSTRAINT `FK_Agent` FOREIGN KEY (`AgentID`) REFERENCES `travelagents` (`AgentID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Booking` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SpotID` FOREIGN KEY (`SpotID`) REFERENCES `touristspots` (`SpotID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of touristpackagebookings
-- ----------------------------
INSERT INTO `touristpackagebookings` VALUES (1, 1, 1, 1, 150.00);
INSERT INTO `touristpackagebookings` VALUES (2, 2, 2, 2, 375.00);
INSERT INTO `touristpackagebookings` VALUES (3, 3, 3, 3, 660.00);

-- ----------------------------
-- Table structure for touristspots
-- ----------------------------
DROP TABLE IF EXISTS `touristspots`;
CREATE TABLE `touristspots`  (
  `SpotID` int NOT NULL,
  `NameSpot` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EntranceTicketPrice` decimal(10, 2) NULL DEFAULT NULL,
  `CityID` int NULL DEFAULT NULL,
  PRIMARY KEY (`SpotID`) USING BTREE,
  INDEX `FK_City`(`CityID`) USING BTREE,
  CONSTRAINT `FK_City` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of touristspots
-- ----------------------------
INSERT INTO `touristspots` VALUES (1, 'Hell Park', 'Beside Heaven', 'Explore hell and get a nice day.', 10.00, 1);
INSERT INTO `touristspots` VALUES (2, 'Waroeng Abang', 'Beside kopo', 'Get drunk in peace.', 30.00, 2);
INSERT INTO `touristspots` VALUES (3, 'Natu Park', 'City Center', 'Slap your mom and enjoy your karma.', 15.00, 3);

-- ----------------------------
-- Table structure for transportation
-- ----------------------------
DROP TABLE IF EXISTS `transportation`;
CREATE TABLE `transportation`  (
  `TransportationID` int NOT NULL,
  `Type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Price` decimal(10, 2) NULL DEFAULT NULL,
  `DepartureDate` date NULL DEFAULT NULL,
  `ArrivalDate` date NULL DEFAULT NULL,
  `DepartureCity` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ArrivalCity` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Carrier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TransportationID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transportation
-- ----------------------------
INSERT INTO `transportation` VALUES (1, 'Flight', 211.00, '2023-10-01', '2023-10-03', 'Jakarta', 'Miami', 'DKT Airlines');
INSERT INTO `transportation` VALUES (2, 'Train', 20.00, '2022-06-16', '2022-06-16', 'Bandungs', 'Semarang', 'UFO Train');
INSERT INTO `transportation` VALUES (3, 'Bus', 10.00, '2023-10-22', '2023-10-24', 'Surabaya', 'Cimahi', 'City Buss');

-- ----------------------------
-- Table structure for travelagents
-- ----------------------------
DROP TABLE IF EXISTS `travelagents`;
CREATE TABLE `travelagents`  (
  `AgentID` int NOT NULL,
  `NameAgent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TouristPackage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ContactInfo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Website` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`AgentID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travelagents
-- ----------------------------
INSERT INTO `travelagents` VALUES (1, 'Explore World With Werky', 'Kill Package', 'Your journey begins with Werky.', 'info@explorwerkyl.co', 'www.explorwerkeydtravel.com');
INSERT INTO `travelagents` VALUES (2, 'Warzone Tour', 'Dead Experience', 'Fell war like world war 2 or 1 just pict and chose.', 'contact@War.com', 'www.Warr.com');
INSERT INTO `travelagents` VALUES (3, 'Explore With Fake Girlfirend', 'City Adventure', 'Discover cities with girlfriend like never before.', 'info@explorersgirlfr', 'www.cityexplorers.com');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `UserID` int NOT NULL,
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FirstName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LastName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Gender` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DateOfBirth` date NULL DEFAULT NULL,
  `PhoneNumber` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `City` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Country` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PostalCode` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Udin.Petok', 'udinxv.pe@example.com ', 'passwoeed', 'Udin', 'Petok', 'M', '0000-00-00', '000-112-1212', '221 Edie SS', 'Jakarta', 'Indonesia', '912102');
INSERT INTO `users` VALUES (2, 'Samshudin.Watimega', 'smhadin.w@example.com', 'pased', 'Samshudin', 'Watimega', 'F', '0000-00-00', '020-212-5262', '255 Warba TS', 'Bandung', 'Indonesia', '915502');
INSERT INTO `users` VALUES (3, 'Or.Lagos', 'lororg@example.com', 'poeed', 'Or', 'Lagos', 'M', '0000-00-00', '020-446-8712', '001 Rauwhi 082S', 'Surabaya', 'Indonesia', '975202');

SET FOREIGN_KEY_CHECKS = 1;
