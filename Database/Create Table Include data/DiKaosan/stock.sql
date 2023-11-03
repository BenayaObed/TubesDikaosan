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

 Date: 01/11/2023 20:54:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `size` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`stock_id`) USING BTREE,
  INDEX `FKjghkvw2snnsr5gpct0of7xfcf`(`product_id`) USING BTREE,
  CONSTRAINT `FKjghkvw2snnsr5gpct0of7xfcf` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES (1, 1, 5, 'L', 'Biru', NULL, '2023-11-01 20:39:00.000000');
INSERT INTO `stock` VALUES (2, 1, 5, 'S', 'Biru', NULL, '2023-11-01 20:39:29.000000');
INSERT INTO `stock` VALUES (3, 1, 5, 'XL', 'Biru', NULL, '2023-11-01 20:39:49.000000');
INSERT INTO `stock` VALUES (4, 2, 5, 'S', 'Biru', NULL, '2023-11-01 20:40:03.000000');
INSERT INTO `stock` VALUES (5, 2, 5, 'L', 'Biru', NULL, '2023-11-01 20:40:15.000000');
INSERT INTO `stock` VALUES (6, 2, 5, 'XL', 'Biru', NULL, '2023-11-01 20:40:38.000000');
INSERT INTO `stock` VALUES (7, 3, 5, 'S', 'Biru', NULL, '2023-11-01 20:40:39.000000');
INSERT INTO `stock` VALUES (8, 3, 5, 'L', 'Biru', NULL, '2023-11-01 20:40:58.000000');
INSERT INTO `stock` VALUES (9, 3, 5, 'XL', 'Biru', NULL, '2023-11-01 20:41:09.000000');
INSERT INTO `stock` VALUES (10, 1, 5, 'L', 'Merah', NULL, '2023-11-01 20:44:28.000000');
INSERT INTO `stock` VALUES (11, 1, 5, 'S', 'Kuning', NULL, '2023-11-01 20:44:30.000000');
INSERT INTO `stock` VALUES (12, 2, 5, 'XL', 'Hijau', NULL, '2023-11-01 20:44:32.000000');
INSERT INTO `stock` VALUES (13, 2, 5, 'S', 'Hijau', NULL, '2023-11-01 20:44:34.000000');

SET FOREIGN_KEY_CHECKS = 1;
