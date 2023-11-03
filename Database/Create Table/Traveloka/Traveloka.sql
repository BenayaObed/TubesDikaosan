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

 Date: 02/11/2023 01:58:36
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

SET FOREIGN_KEY_CHECKS = 1;
