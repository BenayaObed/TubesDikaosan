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

 Date: 01/11/2023 20:54:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `status_order` int NULL DEFAULT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `order_detail` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `UK_s1sr8a1rkx80gwq9pl0952dar`(`order_detail`) USING BTREE,
  INDEX `FK787ibr3guwp6xobrpbofnv7le`(`product_id`) USING BTREE,
  CONSTRAINT `FK787ibr3guwp6xobrpbofnv7le` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKorder` FOREIGN KEY (`order_detail`) REFERENCES `order_details` (`details_order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2023-11-01 20:34:58.000000', 1, NULL, 1, 1);
INSERT INTO `orders` VALUES (2, '2023-11-01 20:35:01.000000', 1, NULL, 1, 2);
INSERT INTO `orders` VALUES (4, '2023-11-01 20:35:03.000000', 1, NULL, 1, 3);

SET FOREIGN_KEY_CHECKS = 1;
