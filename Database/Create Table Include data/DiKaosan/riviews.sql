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

 Date: 01/11/2023 20:54:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for riviews
-- ----------------------------
DROP TABLE IF EXISTS `riviews`;
CREATE TABLE `riviews`  (
  `riview_id` int NOT NULL,
  `product_id` int NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rate` int NULL DEFAULT NULL,
  `coment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_at` datetime(6) NULL DEFAULT NULL,
  `update_at` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`riview_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `FKuser_id`(`user_id`) USING BTREE,
  CONSTRAINT `FKproduct_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKuser_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of riviews
-- ----------------------------
INSERT INTO `riviews` VALUES (1, 1, '2', 5, 'Bahan Bagus', '2023-11-01 20:41:49.000000', NULL);

SET FOREIGN_KEY_CHECKS = 1;
