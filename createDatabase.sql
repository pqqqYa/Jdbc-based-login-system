/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : rhodes

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 14/06/2024 17:14:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oprerator
-- ----------------------------
DROP TABLE IF EXISTS `oprerator`;
CREATE TABLE `oprerator`  (
  `oprerator_id` int NOT NULL AUTO_INCREMENT COMMENT '自动递增',
  `oprerator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `oprerator_int` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `oprerator_starnum` int NOT NULL,
  `oprerator_prof` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `oprerator_factions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`oprerator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oprerator
-- ----------------------------
INSERT INTO `oprerator` VALUES (1, 'chen', 'Dragon', 6, 'guard', 'LUNGMEN GUARD DEPARTMENT');
INSERT INTO `oprerator` VALUES (2, 'Skadi', 'Unknown', 6, 'guard', 'Abyssal Hunters');
INSERT INTO `oprerator` VALUES (3, 'Amiya', 'Chimera', 5, 'caster', 'Rhodes Island');
INSERT INTO `oprerator` VALUES (4, 'Kal tsit', 'Feline', 6, 'medic', 'Rhodes Island');
INSERT INTO `oprerator` VALUES (5, 'Ling', 'Unknown', 6, 'supporter', 'Sui');
INSERT INTO `oprerator` VALUES (6, 'Phantom', 'Feline', 6, 'supporter', 'Victoria');
INSERT INTO `oprerator` VALUES (7, 'Exusiai', 'Sankta', 6, 'sniper', 'Penguin Logistics');
INSERT INTO `oprerator` VALUES (8, 'Saga', 'Perro', 6, 'vanguard', 'Higashi');
INSERT INTO `oprerator` VALUES (9, 'Eunectes', 'Pythia', 6, 'defender', 'Sargon');
INSERT INTO `oprerator` VALUES (10, 'Blitz', 'Unknown', 5, 'defender', 'Team Rainbow');
INSERT INTO `oprerator` VALUES (11, 'Gummy', 'Ursus', 4, 'defender', 'Ursus Student Self-Governing Group');
INSERT INTO `oprerator` VALUES (12, 'Siege', 'Aslan', 6, 'vanguard', 'Glasgow');
INSERT INTO `oprerator` VALUES (13, 'Eyjafjalla', 'Caprinae', 6, 'caster', 'Leithanien');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Hoshiguma', 1);
INSERT INTO `role` VALUES (2, 'Saria', 1);
INSERT INTO `role` VALUES (3, 'Amiya', 1);
INSERT INTO `role` VALUES (4, 'Eyjafjalla', 1);
INSERT INTO `role` VALUES (5, 'Skadi', 1);
INSERT INTO `role` VALUES (6, 'Siege', 1);
INSERT INTO `role` VALUES (7, 'Shining', 1);
INSERT INTO `role` VALUES (8, 'Texas', 1);
INSERT INTO `role` VALUES (9, 'Chen', 1);
INSERT INTO `role` VALUES (10, 'Specter', 1);
INSERT INTO `role` VALUES (11, 'Eunectes', 1);
INSERT INTO `role` VALUES (12, 'Exusiai', 1);
INSERT INTO `role` VALUES (13, 'Silence', 1);
INSERT INTO `role` VALUES (14, 'Irene', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 1, '123456');
INSERT INTO `user` VALUES ('he', 2, '123123');
INSERT INTO `user` VALUES ('admin', 3, '123456');
INSERT INTO `user` VALUES ('he', 4, '123123');
INSERT INTO `user` VALUES ('jin', 5, '123123');
INSERT INTO `user` VALUES ('Joe', 6, '123123');
INSERT INTO `user` VALUES ('Wong', 7, '123123');
INSERT INTO `user` VALUES ('King', 8, '111222');
INSERT INTO `user` VALUES ('Ye', 9, '123123');

SET FOREIGN_KEY_CHECKS = 1;
