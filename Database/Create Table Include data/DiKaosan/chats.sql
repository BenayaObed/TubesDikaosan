/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : ecommerce

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 01/11/2023 20:53:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chats
-- ----------------------------
DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats`  (
  `chat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_sender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_reciever` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_at` date NULL DEFAULT NULL,
  `delete_at` date NULL DEFAULT NULL,
  PRIMARY KEY (`chat_id`) USING BTREE,
  INDEX `user_sender`(`user_sender`) USING BTREE,
  INDEX `FKreciever`(`user_reciever`) USING BTREE,
  CONSTRAINT `FKreciever` FOREIGN KEY (`user_reciever`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsender` FOREIGN KEY (`user_sender`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chats
-- ----------------------------
INSERT INTO `chats` VALUES ('1', '2', '1', 'Halo apakah barang ini ready?', '2023-11-01', NULL);
INSERT INTO `chats` VALUES ('2', '1', '2', 'Ready Kak ^^', '2023-11-01', NULL);
INSERT INTO `chats` VALUES ('3', '2', '1', 'Oke aku pesan!!', '2023-11-01', NULL);

SET FOREIGN_KEY_CHECKS = 1;
