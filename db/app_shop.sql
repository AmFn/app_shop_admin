/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : app_shop

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 22/12/2021 22:16:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_express
-- ----------------------------
DROP TABLE IF EXISTS `app_express`;
CREATE TABLE `app_express`  (
  `id` mediumint unsigned NOT NULL COMMENT '快递公司id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递公司简称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递公司全称',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_del` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 436 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_express
-- ----------------------------
INSERT INTO `app_express` VALUES (433, 'YTO', '圆通', 0, 0, NULL, NULL, 0);
INSERT INTO `app_express` VALUES (434, 'ZTO', '中通', 0, 0, NULL, NULL, 0);
INSERT INTO `app_express` VALUES (435, 'SF', '顺丰', 0, 0, NULL, NULL, 0);
INSERT INTO `app_express` VALUES (436, 'STO', '申通', 0, 0, NULL, NULL, 0);

-- ----------------------------
-- Table structure for app_store_cart
-- ----------------------------
DROP TABLE IF EXISTS `app_store_cart`;
CREATE TABLE `app_store_cart`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '购物车表ID',
  `uid` bigint unsigned NOT NULL COMMENT '用户ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product' COMMENT '类型',
  `product_id` bigint unsigned NOT NULL COMMENT '商品ID',
  `product_attr_unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品属性',
  `cart_num` smallint unsigned NOT NULL COMMENT '商品数量',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = 未购买 1 = 已购买',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `is_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为立即购买',
  `seckill_id` int unsigned NOT NULL COMMENT '秒杀产品ID',
  `bargain_id` int unsigned NOT NULL COMMENT '砍价id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`uid`) USING BTREE,
  INDEX `goods_id`(`product_id`) USING BTREE,
  INDEX `uid`(`uid`, `is_pay`) USING BTREE,
  INDEX `uid_2`(`uid`, `is_del`) USING BTREE,
  INDEX `uid_3`(`uid`, `is_new`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_cart
-- ----------------------------
INSERT INTO `app_store_cart` VALUES (1, 2, 'product', 1, '', 1, '2021-12-21 13:38:38', '2021-12-21 13:38:41', 1, 0, 0, 0, 0);
INSERT INTO `app_store_cart` VALUES (150, 2, 'product', 16, '', 1, '2021-12-21 13:42:18', '2021-12-21 13:42:20', 1, 0, 0, 0, 0);
INSERT INTO `app_store_cart` VALUES (151, 2, 'product', 16, '', 1, '2021-12-21 13:42:43', '2021-12-21 13:42:48', 1, 0, 0, 0, 0);
INSERT INTO `app_store_cart` VALUES (152, 2, 'product', 15, '', 1, '2021-12-21 16:13:05', '2021-12-21 16:13:13', 1, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for app_store_category
-- ----------------------------
DROP TABLE IF EXISTS `app_store_category`;
CREATE TABLE `app_store_category`  (
  `id` mediumint(0) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint(0) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` mediumint(0) NULL DEFAULT NULL COMMENT '排序',
  `pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否推荐',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_del` tinyint unsigned NULL COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `is_base`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_category
-- ----------------------------
INSERT INTO `app_store_category` VALUES (2, 0, '男装', NULL, '', 1, NULL, NULL, 0);
INSERT INTO `app_store_category` VALUES (6, 2, '休闲裤', NULL, '', 1, NULL, NULL, 0);
INSERT INTO `app_store_category` VALUES (25, 0, '女装', 1, '', 1, '2021-12-21 14:52:25', NULL, 0);
INSERT INTO `app_store_category` VALUES (26, 25, '羽绒服/棉服', 1, '', 1, '2021-12-21 14:52:41', NULL, 0);
INSERT INTO `app_store_category` VALUES (27, 25, '针织衫/毛衣', 1, '', 1, '2021-12-21 14:52:56', NULL, 0);
INSERT INTO `app_store_category` VALUES (28, 25, '连衣裙', 1, '', 1, '2021-12-21 14:53:06', NULL, 0);
INSERT INTO `app_store_category` VALUES (29, 25, '半身裙', 1, '', 1, '2021-12-21 14:53:21', NULL, 0);
INSERT INTO `app_store_category` VALUES (30, 25, '休闲裤', 1, '', 1, '2021-12-21 14:53:30', NULL, 0);
INSERT INTO `app_store_category` VALUES (31, 25, '休闲衬衫', 1, '', 1, '2021-12-21 14:53:42', NULL, 0);
INSERT INTO `app_store_category` VALUES (32, 2, '时尚外套', 1, '', 1, '2021-12-21 14:54:29', NULL, 0);
INSERT INTO `app_store_category` VALUES (33, 2, '机车夹克', 1, '', 1, '2021-12-21 14:54:56', NULL, 0);
INSERT INTO `app_store_category` VALUES (34, 0, '童装', 1, '', 1, '2021-12-21 14:55:09', NULL, 0);
INSERT INTO `app_store_category` VALUES (35, 0, '鞋履', 1, '', 1, '2021-12-21 14:55:24', NULL, 0);
INSERT INTO `app_store_category` VALUES (36, 0, '包带', 1, '', 1, '2021-12-21 14:55:31', NULL, 0);
INSERT INTO `app_store_category` VALUES (37, 0, '首饰', 1, '', 1, '2021-12-21 14:55:38', NULL, 0);
INSERT INTO `app_store_category` VALUES (38, 0, '配饰', 1, '', 1, '2021-12-21 14:55:47', NULL, 0);
INSERT INTO `app_store_category` VALUES (39, 34, '牛仔外套', 1, '', 1, '2021-12-21 14:56:02', NULL, 0);
INSERT INTO `app_store_category` VALUES (40, 35, '高跟鞋', 1, '', 1, '2021-12-21 14:56:17', NULL, 0);
INSERT INTO `app_store_category` VALUES (41, 35, '运动鞋', 1, '', 1, '2021-12-21 14:56:25', NULL, 0);
INSERT INTO `app_store_category` VALUES (42, 35, '正装鞋', 1, '', 1, '2021-12-21 14:56:45', NULL, 0);
INSERT INTO `app_store_category` VALUES (43, 2, '短裤', 1, '', 1, '2021-12-21 14:58:19', NULL, 0);

-- ----------------------------
-- Table structure for app_store_coupon
-- ----------------------------
DROP TABLE IF EXISTS `app_store_coupon`;
CREATE TABLE `app_store_coupon`  (
  `id` int unsigned NOT NULL COMMENT '优惠券表ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `integral` int unsigned NOT NULL COMMENT '兑换消耗积分值',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '兑换的优惠券面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `coupon_time` int unsigned NOT NULL COMMENT '优惠券有效期限（单位：天）',
  `sort` int unsigned NOT NULL COMMENT '排序',
  `status` tinyint unsigned NOT NULL COMMENT '状态（0：关闭，1：开启）',
  `product_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品ids',
  `type` tinyint(0) NULL DEFAULT 0 COMMENT '优惠券类型 0-通用 1-商品券',
  `create_time` datetime(0) NOT NULL COMMENT '兑换项目添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_del` tinyint unsigned NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `state`(`status`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `coupon_time`(`coupon_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_coupon
-- ----------------------------
INSERT INTO `app_store_coupon` VALUES (1, '双十一促销券', 100, 50.00, 100.00, 7, 1, 0, '', 0, '2021-10-29 16:26:12', '2021-10-29 17:25:39', 0);
INSERT INTO `app_store_coupon` VALUES (6, '全场通用', 0, 1.00, 10.00, 100, 0, 1, '', 0, '2020-09-12 17:57:02', NULL, 0);
INSERT INTO `app_store_coupon` VALUES (7, '多规格商品券', 0, 1.00, 5.00, 100, 0, 1, '8', 1, '2020-09-12 17:57:46', NULL, 0);
INSERT INTO `app_store_coupon` VALUES (8, '22', 0, 2.00, 2.00, 2, 0, 1, NULL, 0, '2021-04-04 16:03:42', NULL, 0);
INSERT INTO `app_store_coupon` VALUES (9, '满减', 10, 10.00, 20.00, 1, 1, 1, '', 0, '2021-10-29 17:11:11', NULL, 0);

-- ----------------------------
-- Table structure for app_store_coupon_issue
-- ----------------------------
DROP TABLE IF EXISTS `app_store_coupon_issue`;
CREATE TABLE `app_store_coupon_issue`  (
  `id` int unsigned NOT NULL,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cid` int(0) NULL DEFAULT NULL COMMENT '优惠券ID',
  `ctype` tinyint(1) NULL DEFAULT NULL COMMENT '优惠券类型 0-通用 1-商品券',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '优惠券领取开启时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '优惠券领取结束时间',
  `total_count` int(0) NULL DEFAULT NULL COMMENT '优惠券领取数量',
  `remain_count` int(0) NULL DEFAULT NULL COMMENT '优惠券剩余领取数量',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 正常 0 未开启 -1 已无效',
  `is_del` tinyint unsigned NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '优惠券添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `start_time`(`start_time`, `end_time`) USING BTREE,
  INDEX `remain_count`(`remain_count`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台领取表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_coupon_issue
-- ----------------------------
INSERT INTO `app_store_coupon_issue` VALUES (11, '多规格商品券', 7, 1, '2021-10-29 19:09:15', '2021-10-29 19:09:18', 100, 100, 1, 0, '2021-10-29 19:09:27', '2021-10-29 19:09:29');

-- ----------------------------
-- Table structure for app_store_coupon_issue_user
-- ----------------------------
DROP TABLE IF EXISTS `app_store_coupon_issue_user`;
CREATE TABLE `app_store_coupon_issue_user`  (
  `id` bigint unsigned NOT NULL,
  `uid` bigint(0) NULL DEFAULT NULL COMMENT '领取优惠券用户ID',
  `issue_coupon_id` int(0) NULL DEFAULT NULL COMMENT '优惠券前台领取ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '领取时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`, `issue_coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台用户领取记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_coupon_issue_user
-- ----------------------------
INSERT INTO `app_store_coupon_issue_user` VALUES (5, 2, 7, '2020-09-12 18:08:26', NULL, 0);

-- ----------------------------
-- Table structure for app_store_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `app_store_coupon_user`;
CREATE TABLE `app_store_coupon_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '优惠券发放记录id',
  `cid` int unsigned NOT NULL COMMENT '兑换的项目id',
  `uid` bigint unsigned NOT NULL COMMENT '优惠券所属用户',
  `coupon_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠券的面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `create_time` datetime(0) NOT NULL COMMENT '优惠券创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NOT NULL COMMENT '优惠券结束时间',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'send' COMMENT '获取方式',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态（0：未使用，1：已使用, 2:已过期）',
  `is_fail` tinyint unsigned NOT NULL COMMENT '是否有效',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `end_time`(`end_time`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_fail`(`is_fail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券发放记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_coupon_user
-- ----------------------------
INSERT INTO `app_store_coupon_user` VALUES (5, 7, 2, '多规格商品券', 1.00, 5.00, '2020-09-12 18:08:26', '2020-09-12 18:11:05', '2020-12-21 18:08:26', '2020-09-12 18:11:05', 'get', 1, 0, 0);

-- ----------------------------
-- Table structure for app_store_order
-- ----------------------------
DROP TABLE IF EXISTS `app_store_order`;
CREATE TABLE `app_store_order`  (
  `id` bigint unsigned NOT NULL COMMENT '订单ID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `extend_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '额外订单号',
  `uid` bigint unsigned NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `cart_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]' COMMENT '购物车id',
  `freight_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '运费金额',
  `total_num` int unsigned NOT NULL COMMENT '订单商品总数',
  `total_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单总价',
  `total_postage` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '邮费',
  `pay_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际支付金额',
  `pay_postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支付邮费',
  `deduction_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '抵扣金额',
  `coupon_id` int unsigned NULL COMMENT '优惠券id',
  `coupon_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '优惠券金额',
  `paid` tinyint unsigned NOT NULL COMMENT '支付状态',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：已完成；-1：已退款）',
  `refund_status` tinyint unsigned NOT NULL COMMENT '0 未退款 1 申请中 2 已退款',
  `refund_reason_wap_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款图片',
  `refund_reason_wap_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款用户说明',
  `refund_reason_time` datetime(0) NULL DEFAULT NULL COMMENT '退款时间',
  `refund_reason_wap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前台退款原因',
  `refund_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不退款的理由',
  `refund_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '退款金额',
  `delivery_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '快递公司编号',
  `delivery_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递名称/送货人姓名',
  `delivery_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货类型',
  `delivery_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号/手机号',
  `gain_integral` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '消费赚取积分',
  `use_integral` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '使用积分',
  `back_integral` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '给用户退了多少积分',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_del` tinyint unsigned NULL COMMENT '是否删除',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员备注',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本价',
  `seckill_id` bigint unsigned NULL COMMENT '秒杀产品ID',
  `bargain_id` int unsigned NULL COMMENT '砍价id',
  `verify_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '核销码',
  `shipping_type` tinyint(1) NULL DEFAULT 1 COMMENT '配送方式 1=快递 ，2=门店自提',
  `pid` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_2`(`order_id`, `uid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `pay_price`(`pay_price`) USING BTREE,
  INDEX `paid`(`paid`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE,
  INDEX `pay_type`(`pay_type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `coupon_id`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_order
-- ----------------------------
INSERT INTO `app_store_order` VALUES (2, '1001', '1001', 2, '陈煜峰', '16685274469', '贵州省毕节市金沙县新城区', '[]', 10.00, 1, 100.00, 10.00, 100.00, 10.00, 0.00, 0, 0.00, 0, '2021-12-04 13:01:49', '微信', '2021-12-04 13:02:25', '2021-12-04 13:02:27', 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, 'YTO', '', '国内', '100001', 10.00, 0.00, 0.00, '备注', 0, NULL, 80.00, 0, 0, '123456', 1, NULL);
INSERT INTO `app_store_order` VALUES (3, '1467418809424850945', NULL, 2, '刘健', '12890976567', '贵州毕节金沙袁家桥', 'none', 20.00, 2, 220.00, 0.00, 220.00, 0.00, 0.00, NULL, 0.00, 0, NULL, '支付宝', '2021-12-05 17:01:22', '2021-12-19 19:21:28', 2, 0, NULL, NULL, NULL, NULL, NULL, 0.00, 'ZTO', NULL, NULL, '1023012031290412', 0.00, 0.00, NULL, NULL, NULL, '新用户', NULL, NULL, 0, '', 1, 1);

-- ----------------------------
-- Table structure for app_store_order_status
-- ----------------------------
DROP TABLE IF EXISTS `app_store_order_status`;
CREATE TABLE `app_store_order_status`  (
  `id` bigint unsigned NOT NULL,
  `oid` bigint unsigned NOT NULL COMMENT '订单id',
  `change_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `change_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作备注',
  `change_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE,
  INDEX `change_type`(`change_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_store_product
-- ----------------------------
DROP TABLE IF EXISTS `app_store_product`;
CREATE TABLE `app_store_product`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `slider_image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图',
  `store_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品简介',
  `keyword` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `bar_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品条码（一维码）',
  `cate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id',
  `price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `vip_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '会员价格',
  `ot_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '市场价',
  `postage` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '邮费',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名',
  `sort` smallint(0) NULL DEFAULT 0 COMMENT '排序',
  `sales` mediumint unsigned NULL COMMENT '销量',
  `stock` mediumint unsigned NULL COMMENT '库存',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '是否热卖',
  `is_benefit` tinyint(1) NULL DEFAULT 0 COMMENT '是否优惠',
  `is_best` tinyint(1) NULL DEFAULT 0 COMMENT '是否精品',
  `is_new` tinyint(1) NULL DEFAULT 0 COMMENT '是否新品',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_postage` tinyint unsigned NULL COMMENT '是否包邮',
  `is_del` tinyint unsigned NULL COMMENT '是否删除',
  `give_integral` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '获得积分',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本价',
  `is_good` tinyint(1) NULL DEFAULT 0 COMMENT '是否优品推荐',
  `ficti` mediumint(0) NULL DEFAULT 100 COMMENT '虚拟销量',
  `browse` int(0) NULL DEFAULT 0 COMMENT '浏览量',
  `spec_type` tinyint(1) NULL DEFAULT 0 COMMENT '规格 0单 1多',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_benefit`(`is_benefit`) USING BTREE,
  INDEX `is_best`(`is_best`) USING BTREE,
  INDEX `is_new`(`is_new`) USING BTREE,
  INDEX `toggle_on_sale, is_del`(`is_del`) USING BTREE,
  INDEX `price`(`price`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `sales`(`sales`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_product
-- ----------------------------
INSERT INTO `app_store_product` VALUES (1, 'https://img2.baidu.com/it/u=512594686,4023061168&fm=26&fmt=auto', 'https://img2.baidu.com/it/u=512594686,4023061168&fm=26&fmt=auto', '时尚短裤', '时尚短裤', '短裤', '', '43', 100.00, 99.00, 100.00, 20.00, NULL, 0, 0, 10, 1, 0, 0, 0, 0, NULL, '2021-09-24 16:04:18', '2021-09-24 16:04:20', 0, 0, 10.00, 50.00, 0, 100, 0, 0);
INSERT INTO `app_store_product` VALUES (14, 'https://cyf-file.oss-cn-shenzhen.aliyuncs.com/2021/10/22/5df522d4a5694329aaf5603349a2281c2.png', '', '11', '1', '11', '', '4', 1.00, 100.00, 1.00, 1.00, '', 1, 1, 1, 1, 0, 0, 0, 0, '', '2021-10-22 14:47:29', NULL, 0, 1, 1.00, 1.00, 0, 100, 0, 0);
INSERT INTO `app_store_product` VALUES (15, 'https://cyf-file.oss-cn-shenzhen.aliyuncs.com/2021/12/21/bc0cfa51f6234d8fa4cdefc38ddcce83src=http___img.defanli.com_bao_uploaded_i1_66776525_O1CN01dZfkyB1y4Uw5qH3D6_!!66776525-0-lubanu-s.jpg_q90.jpg&refer=http___img.defanli.jpg', '', '文艺九月复古短袖连衣裙', '文艺九月短袖复古连衣裙', '文艺/连衣裙/复古', '', '28', 199.00, 189.90, 199.00, 0.00, NULL, 1, 0, 100, 1, 0, 0, 0, 0, NULL, '2021-12-21 15:05:21', '2021-12-21 15:15:06', 0, 0, 20.00, 100.00, 0, 100, 0, 0);
INSERT INTO `app_store_product` VALUES (16, 'https://cyf-file.oss-cn-shenzhen.aliyuncs.com/2021/12/21/a08578e495db446b959118fa4aa033e34607b6d7b03c33294518f228d2025a30.jpeg', '', '春秋皮鞋男鞋韩版英伦黑色', '春秋皮鞋男鞋韩版英伦黑色', '男鞋/皮鞋', '', '42', 100.00, 100.00, 100.00, 0.00, '', 1, 1, 100, 1, 0, 0, 0, 0, '', '2021-12-21 15:12:41', '2021-12-21 15:16:30', 0, 0, 20.00, 120.00, 0, 100, 0, 0);

-- ----------------------------
-- Table structure for app_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `app_store_product_attr_value`;
CREATE TABLE `app_store_product_attr_value`  (
  `id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL COMMENT '商品ID',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int unsigned NULL COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  `bar_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品条码',
  `ot_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '原价',
  `weight` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '重量',
  `volume` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '体积',
  `seckill_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '秒杀价',
  `seckill_stock` int(0) NOT NULL DEFAULT 0 COMMENT '秒杀库存',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`, `sku`) USING BTREE,
  INDEX `store_id`(`product_id`, `sku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_product_attr_value
-- ----------------------------
INSERT INTO `app_store_product_attr_value` VALUES (107, 1, '黑色', 10, 0, 100.00, NULL, '', 90.00, '', 0.00, 1.00, 1.00, 0.00, 0);

-- ----------------------------
-- Table structure for app_store_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `app_store_product_relation`;
CREATE TABLE `app_store_product_relation`  (
  `id` bigint unsigned NOT NULL,
  `uid` bigint unsigned NOT NULL COMMENT '用户ID',
  `product_id` bigint unsigned NOT NULL COMMENT '商品ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`, `product_id`, `type`, `category`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品点赞和收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_product_relation
-- ----------------------------
INSERT INTO `app_store_product_relation` VALUES (1, 2, 1, 'collect', '普通商品', '2021-09-30 16:15:24', '2021-09-30 16:15:27', 0);

-- ----------------------------
-- Table structure for app_store_product_reply
-- ----------------------------
DROP TABLE IF EXISTS `app_store_product_reply`;
CREATE TABLE `app_store_product_reply`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` bigint(0) NOT NULL COMMENT '用户ID',
  `oid` bigint(0) NOT NULL COMMENT '订单ID',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
  `product_id` bigint(0) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `pics` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论图片',
  `create_time` datetime(0) NOT NULL COMMENT '评论时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `merchant_reply_content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` datetime(0) NULL DEFAULT NULL COMMENT '管理员回复时间',
  `is_del` tinyint unsigned NOT NULL COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `parent_id`(`reply_type`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `product_score`(`product_score`) USING BTREE,
  INDEX `service_score`(`service_score`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_store_seckill
-- ----------------------------
DROP TABLE IF EXISTS `app_store_seckill`;
CREATE TABLE `app_store_seckill`  (
  `id` bigint unsigned NOT NULL COMMENT '商品秒杀产品表id',
  `product_id` bigint unsigned NOT NULL COMMENT '商品id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐图',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '价格',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '成本',
  `ot_price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '原价',
  `give_integral` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '返多少积分',
  `sort` int unsigned NOT NULL COMMENT '排序',
  `stock` int unsigned NOT NULL COMMENT '库存',
  `sales` int unsigned NOT NULL COMMENT '销量',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` date NOT NULL COMMENT '开始时间',
  `stop_time` date NOT NULL COMMENT '结束时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint unsigned NOT NULL COMMENT '产品状态',
  `is_del` tinyint unsigned NULL COMMENT '删除 0未删除1已删除',
  `num` int unsigned NULL COMMENT '最多秒杀几个',
  `is_show` tinyint unsigned NULL COMMENT '显示',
  `time_id` int unsigned NULL COMMENT '时间段id',
  `spec_type` tinyint(1) NULL DEFAULT NULL COMMENT '规格 0单 1多',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `start_time`(`start_time`, `stop_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `is_show`(`status`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品秒杀产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_store_seckill
-- ----------------------------
INSERT INTO `app_store_seckill` VALUES (1, 1, 'https://img2.baidu.com/it/u=512594686,4023061168&fm=26&fmt=auto', 'https://img2.baidu.com/it/u=512594686,4023061168&fm=26&fmt=auto', ' 裤子', '', 100.00, 90.00, 120.00, 10.00, 1, 50, 0, '', NULL, '2021-10-28', '2021-10-30', '2021-10-28 16:00:00', '2021-10-28 16:00:04', 0, 0, 1, 1, 0, 1);
INSERT INTO `app_store_seckill` VALUES (10, 1, 'https://cyf-file.oss-cn-shenzhen.aliyuncs.com/2021/10/28/c5187c8a7b464c7f9edf7a94f08299942.png', '', '1', '1', 1.00, 1.00, 1.00, 1.00, 1, 1, 0, '', '', '2021-10-28', '2021-10-30', NULL, NULL, 0, NULL, 1, NULL, 0, NULL);

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user`  (
  `uid` bigint unsigned NOT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户(跟accout一样)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码（跟pwd）',
  `real_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '真实姓名',
  `birthday` int(0) NULL DEFAULT 0 COMMENT '生日',
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '身份证号码',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户备注',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `phone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `add_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '添加ip',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `last_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后一次登录ip',
  `now_money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户余额',
  `brokerage_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金金额',
  `integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户剩余积分',
  `sign_num` int(0) NOT NULL DEFAULT 0 COMMENT '连续签到天数',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1为正常，0为禁止',
  `level` tinyint unsigned NOT NULL COMMENT '等级',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '用户类型',
  `pay_count` int unsigned NULL COMMENT '用户购买次数',
  `addres` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `adminid` int unsigned NULL COMMENT '管理员编号 ',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (2, '12890976567', '473287f8298dba7163a897908958f7c0eae733e25d2e027992ea2edc9bed2fa8', '刘健', 0, '522424200012242321', '用户', 'liujian', 'https://cyf-file.oss-cn-shenzhen.aliyuncs.com/avatar/1617029247754.jpg?versionId=CAEQHBiBgMDYs.j5wxciIDI2ZTYxODIzYTJhNjRlM2ZiYzkzN2E4ZGE0MzQxOTIy', '12890976567', '', '2021-09-22 10:17:40', NULL, '', 0.00, 0.00, 10.00, 0, 1, 0, '2', 0, '', 0, 0);
INSERT INTO `app_user` VALUES (4, '16685274469', 'c969d8c00163516b52061ab0c7d66735ff527cc3e0c6ea29ab5685ede69e14b6', '陈煜峰', 0, '522424200012240419', '超级管理员', 'chenfeng', 'https://cyf-file.oss-cn-shenzhen.aliyuncs.com/avatar/1617029247754.jpg?versionId=CAEQHBiBgMDYs.j5wxciIDI2ZTYxODIzYTJhNjRlM2ZiYzkzN2E4ZGE0MzQxOTIy', '16685274469', '192.168.1.138', '2021-09-24 11:46:35', NULL, '', 1000.00, 0.00, 0.00, 0, 1, 0, '2', 0, '', 0, 0);

-- ----------------------------
-- Table structure for app_user_address
-- ----------------------------
DROP TABLE IF EXISTS `app_user_address`;
CREATE TABLE `app_user_address`  (
  `id` bigint unsigned NOT NULL COMMENT '用户地址id',
  `uid` bigint unsigned NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在省',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在市',
  `city_id` int(0) NULL DEFAULT NULL,
  `district` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在区',
  `detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮编',
  `longitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint unsigned NOT NULL COMMENT '是否默认',
  `is_del` tinyint unsigned NOT NULL COMMENT '是否删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_address
-- ----------------------------
INSERT INTO `app_user_address` VALUES (1, 4, '陈煜峰', '16685274469', '贵州', '毕节', 1, '金沙', '袁家桥', '551800', '0', '0', 0, 0, '2021-12-05 16:33:03', '2021-12-05 16:33:05');

-- ----------------------------
-- Table structure for app_user_bill
-- ----------------------------
DROP TABLE IF EXISTS `app_user_bill`;
CREATE TABLE `app_user_bill`  (
  `id` bigint unsigned NOT NULL COMMENT '用户账单id',
  `uid` bigint unsigned NOT NULL COMMENT '用户uid',
  `link_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '关联id',
  `pm` tinyint unsigned NOT NULL COMMENT '0 = 支出 1 = 获得',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账单标题',
  `category` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细种类',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细类型',
  `number` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '明细数字',
  `balance` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '剩余',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = 带确定 1 = 有效 -1 = 无效',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `pm`(`pm`) USING BTREE,
  INDEX `type`(`category`, `type`, `link_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_user_level
-- ----------------------------
DROP TABLE IF EXISTS `app_user_level`;
CREATE TABLE `app_user_level`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uid` bigint(0) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `level_id` int(0) NOT NULL DEFAULT 0 COMMENT '等级vip',
  `grade` int(0) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `valid_time` int(0) NOT NULL DEFAULT 0 COMMENT '过期时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否永久',
  `mer_id` int(0) NOT NULL DEFAULT 0 COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:禁止,1:正常',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `remind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已通知',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0=未删除,1=删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `discount` int(0) NOT NULL DEFAULT 0 COMMENT '享受折扣',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户等级记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_level
-- ----------------------------
INSERT INTO `app_user_level` VALUES (1, 3, 1, 1, 0, 1, 0, 0, '普通会员', 0, 0, '2021-09-24 12:56:37', '2021-09-24 12:56:40', 99);
INSERT INTO `app_user_level` VALUES (2, 0, 2, 2, 0, 1, 0, 0, '青铜会员', 0, 0, '2021-09-24 13:18:05', '2021-09-24 13:18:08', 98);
INSERT INTO `app_user_level` VALUES (3, 0, 3, 3, 0, 1, 0, 0, '白银会员', 0, 0, '2021-09-24 13:19:22', '2021-09-24 13:19:24', 95);
INSERT INTO `app_user_level` VALUES (4, 0, 4, 4, 0, 1, 0, 0, '黄金会员', 0, 0, '2021-09-24 13:19:55', '2021-09-24 13:19:58', 92);
INSERT INTO `app_user_level` VALUES (5, 0, 5, 5, 0, 0, 0, 0, '钻石会员', 0, 0, '2021-09-24 13:20:40', '2021-09-24 13:20:42', 90);

-- ----------------------------
-- Table structure for app_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `app_user_sign`;
CREATE TABLE `app_user_sign`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `uid` bigint(0) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '签到说明',
  `number` int(0) NOT NULL DEFAULT 0 COMMENT '获得积分',
  `balance` int(0) NOT NULL DEFAULT 0 COMMENT '剩余积分',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签到记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_sign
-- ----------------------------
INSERT INTO `app_user_sign` VALUES (1, 2, '系统奖励', 10, 10, '2021-10-28 19:16:03', '2021-10-28 19:16:05', 0);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(0) NOT NULL,
  `SCHED_TIME` bigint(0) NOT NULL,
  `PRIORITY` int(0) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C0B07A9807874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(0) NOT NULL,
  `CHECKIN_INTERVAL` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'LAPTOP-4RFQNEC21640180522650', 1640182612124, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(0) NOT NULL,
  `REPEAT_INTERVAL` bigint(0) NOT NULL,
  `TIMES_TRIGGERED` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(0) NULL DEFAULT NULL,
  `INT_PROP_2` int(0) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(0) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(0) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PRIORITY` int(0) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(0) NOT NULL,
  `END_TIME` bigint(0) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(0) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1640183400000, 1640181600000, 5, 'WAITING', 'CRON', 1632789762000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C0B07A9807874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2021-09-22 09:03:44');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(0) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(0) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(0) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 280 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 2, '2021-09-30 16:00:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-30 16:30:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-30 17:00:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 2, '2021-09-30 17:30:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-30 18:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-30 18:30:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-30 19:00:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 10:30:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 11:00:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-11 11:30:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 12:00:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-11 12:30:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 13:00:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 13:30:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 14:00:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 14:30:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-11 15:00:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 3, '2021-10-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 18:30:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 19:00:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 19:30:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-11 20:00:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-11 20:30:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 3, '2021-10-12 17:30:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-12 18:00:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 3, '2021-10-12 18:30:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-12 19:00:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-12 19:30:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-22 13:00:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-22 13:30:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 14:00:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-22 14:30:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-22 17:30:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 18:00:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 18:30:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 19:00:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 19:30:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-22 20:00:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 20:30:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-22 21:00:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-22 21:30:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-27 15:30:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-27 16:30:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-28 16:30:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-28 17:00:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-28 18:00:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-28 18:30:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-28 19:00:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-28 19:30:00');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-28 20:00:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-28 20:30:00');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 0, '2021-10-28 21:00:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-28 21:30:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-28 22:00:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-29 16:00:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-29 16:30:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-29 17:00:00');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 2, '2021-10-29 17:30:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-29 18:00:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 9, '2021-10-29 18:30:00');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-29 19:00:00');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 9, '2021-10-29 19:30:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 1, '2021-10-29 20:00:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-08 14:30:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-08 15:00:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-08 15:30:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-08 16:00:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-08 16:30:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-08 17:00:00');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-12 10:30:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-14 15:30:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 4, '2021-11-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-19 18:30:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-19 19:30:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-19 20:00:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-19 21:00:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 10:30:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 0, '2021-11-20 11:00:00');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 11:30:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 12:00:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 15:30:00');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-20 18:00:00');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-20 18:30:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-20 19:00:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-20 19:30:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 0, '2021-11-21 17:30:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 19:00:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 19:30:00');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-21 20:00:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 20:30:00');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-21 21:30:00');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-21 22:00:00');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 22:30:00');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 23:00:00');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-21 23:30:00');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 8, '2021-11-22 00:00:00');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 00:30:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 01:00:00');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 0, '2021-11-22 01:30:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 0, '2021-11-22 02:00:00');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 17:30:00');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 18:00:00');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 18:30:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 19:00:00');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 19:30:00');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 20:00:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 20:30:00');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 3, '2021-11-22 21:00:00');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-22 21:30:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-22 22:00:00');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-22 22:30:00');
INSERT INTO `schedule_job_log` VALUES (157, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-22 23:00:00');
INSERT INTO `schedule_job_log` VALUES (158, 1, 'testTask', 'renren', 0, NULL, 3, '2021-11-22 23:30:00');
INSERT INTO `schedule_job_log` VALUES (159, 1, 'testTask', 'renren', 0, NULL, 7, '2021-11-23 00:00:00');
INSERT INTO `schedule_job_log` VALUES (160, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-23 00:30:00');
INSERT INTO `schedule_job_log` VALUES (161, 1, 'testTask', 'renren', 0, NULL, 1, '2021-11-23 01:00:00');
INSERT INTO `schedule_job_log` VALUES (162, 1, 'testTask', 'renren', 0, NULL, 0, '2021-11-23 01:30:00');
INSERT INTO `schedule_job_log` VALUES (163, 1, 'testTask', 'renren', 0, NULL, 2, '2021-11-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES (164, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-02 13:30:00');
INSERT INTO `schedule_job_log` VALUES (165, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-02 14:00:00');
INSERT INTO `schedule_job_log` VALUES (166, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-02 14:30:00');
INSERT INTO `schedule_job_log` VALUES (167, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-02 15:00:00');
INSERT INTO `schedule_job_log` VALUES (168, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-02 15:30:00');
INSERT INTO `schedule_job_log` VALUES (169, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-02 16:00:00');
INSERT INTO `schedule_job_log` VALUES (170, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-02 16:30:00');
INSERT INTO `schedule_job_log` VALUES (171, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-02 17:00:00');
INSERT INTO `schedule_job_log` VALUES (172, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES (173, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-02 18:00:00');
INSERT INTO `schedule_job_log` VALUES (174, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-02 18:30:00');
INSERT INTO `schedule_job_log` VALUES (175, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-02 19:00:00');
INSERT INTO `schedule_job_log` VALUES (176, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-02 19:30:00');
INSERT INTO `schedule_job_log` VALUES (177, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-02 20:00:00');
INSERT INTO `schedule_job_log` VALUES (178, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-02 20:30:00');
INSERT INTO `schedule_job_log` VALUES (179, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-03 11:30:00');
INSERT INTO `schedule_job_log` VALUES (180, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-03 12:00:00');
INSERT INTO `schedule_job_log` VALUES (181, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-03 12:30:00');
INSERT INTO `schedule_job_log` VALUES (182, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-03 13:00:00');
INSERT INTO `schedule_job_log` VALUES (183, 1, 'testTask', 'renren', 0, NULL, 3, '2021-12-03 13:30:00');
INSERT INTO `schedule_job_log` VALUES (184, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES (185, 1, 'testTask', 'renren', 0, NULL, 3, '2021-12-03 14:30:00');
INSERT INTO `schedule_job_log` VALUES (186, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-03 15:00:00');
INSERT INTO `schedule_job_log` VALUES (187, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-03 15:30:00');
INSERT INTO `schedule_job_log` VALUES (188, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-03 16:00:00');
INSERT INTO `schedule_job_log` VALUES (189, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-03 16:30:00');
INSERT INTO `schedule_job_log` VALUES (190, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-03 19:30:00');
INSERT INTO `schedule_job_log` VALUES (191, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-03 20:00:00');
INSERT INTO `schedule_job_log` VALUES (192, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-03 20:30:00');
INSERT INTO `schedule_job_log` VALUES (193, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-03 21:00:00');
INSERT INTO `schedule_job_log` VALUES (194, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 13:00:00');
INSERT INTO `schedule_job_log` VALUES (195, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-04 13:30:00');
INSERT INTO `schedule_job_log` VALUES (196, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES (197, 1, 'testTask', 'renren', 0, NULL, 28, '2021-12-04 14:30:00');
INSERT INTO `schedule_job_log` VALUES (198, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 15:00:00');
INSERT INTO `schedule_job_log` VALUES (199, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 15:30:00');
INSERT INTO `schedule_job_log` VALUES (200, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 16:00:00');
INSERT INTO `schedule_job_log` VALUES (201, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 16:30:00');
INSERT INTO `schedule_job_log` VALUES (202, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 17:00:00');
INSERT INTO `schedule_job_log` VALUES (203, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 17:30:00');
INSERT INTO `schedule_job_log` VALUES (204, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-04 18:00:00');
INSERT INTO `schedule_job_log` VALUES (205, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 18:30:00');
INSERT INTO `schedule_job_log` VALUES (206, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 19:00:00');
INSERT INTO `schedule_job_log` VALUES (207, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 19:30:00');
INSERT INTO `schedule_job_log` VALUES (208, 1, 'testTask', 'renren', 0, NULL, 11, '2021-12-04 20:00:00');
INSERT INTO `schedule_job_log` VALUES (209, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 20:30:00');
INSERT INTO `schedule_job_log` VALUES (210, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 21:00:00');
INSERT INTO `schedule_job_log` VALUES (211, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 21:30:00');
INSERT INTO `schedule_job_log` VALUES (212, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-04 22:00:00');
INSERT INTO `schedule_job_log` VALUES (213, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-05 12:00:00');
INSERT INTO `schedule_job_log` VALUES (214, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-05 12:30:00');
INSERT INTO `schedule_job_log` VALUES (215, 1, 'testTask', 'renren', 0, NULL, 5, '2021-12-05 13:00:00');
INSERT INTO `schedule_job_log` VALUES (216, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-05 13:30:00');
INSERT INTO `schedule_job_log` VALUES (217, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-05 14:00:00');
INSERT INTO `schedule_job_log` VALUES (218, 1, 'testTask', 'renren', 0, NULL, 4, '2021-12-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES (219, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES (220, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES (221, 1, 'testTask', 'renren', 0, NULL, 3, '2021-12-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES (222, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES (223, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES (224, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-05 17:30:00');
INSERT INTO `schedule_job_log` VALUES (225, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-05 18:00:00');
INSERT INTO `schedule_job_log` VALUES (226, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-05 18:30:00');
INSERT INTO `schedule_job_log` VALUES (227, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-05 19:00:00');
INSERT INTO `schedule_job_log` VALUES (228, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-05 19:30:00');
INSERT INTO `schedule_job_log` VALUES (229, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-05 20:00:00');
INSERT INTO `schedule_job_log` VALUES (230, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES (231, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES (232, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES (233, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES (234, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES (235, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES (236, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES (237, 1, 'testTask', 'renren', 0, NULL, 3, '2021-12-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES (238, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-19 18:30:00');
INSERT INTO `schedule_job_log` VALUES (239, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES (240, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES (241, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES (242, 1, 'testTask', 'renren', 0, NULL, 4, '2021-12-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES (243, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES (244, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES (245, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 15:30:00');
INSERT INTO `schedule_job_log` VALUES (246, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES (247, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES (248, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES (249, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES (250, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-20 18:00:00');
INSERT INTO `schedule_job_log` VALUES (251, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-20 18:30:00');
INSERT INTO `schedule_job_log` VALUES (252, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 19:00:00');
INSERT INTO `schedule_job_log` VALUES (253, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-20 19:30:00');
INSERT INTO `schedule_job_log` VALUES (254, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 20:00:00');
INSERT INTO `schedule_job_log` VALUES (255, 1, 'testTask', 'renren', 0, NULL, 10, '2021-12-20 20:30:00');
INSERT INTO `schedule_job_log` VALUES (256, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-20 21:00:00');
INSERT INTO `schedule_job_log` VALUES (257, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 21:30:00');
INSERT INTO `schedule_job_log` VALUES (258, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-20 22:00:00');
INSERT INTO `schedule_job_log` VALUES (259, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-20 22:30:00');
INSERT INTO `schedule_job_log` VALUES (260, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-20 23:00:00');
INSERT INTO `schedule_job_log` VALUES (261, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 14:00:00');
INSERT INTO `schedule_job_log` VALUES (262, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES (263, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES (264, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES (265, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES (266, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES (267, 1, 'testTask', 'renren', 0, NULL, 0, '2021-12-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES (268, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES (269, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES (270, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 19:00:00');
INSERT INTO `schedule_job_log` VALUES (271, 1, 'testTask', 'renren', 0, NULL, 4, '2021-12-21 19:30:00');
INSERT INTO `schedule_job_log` VALUES (272, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-21 20:00:00');
INSERT INTO `schedule_job_log` VALUES (273, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-21 20:30:00');
INSERT INTO `schedule_job_log` VALUES (274, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES (275, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-21 21:30:00');
INSERT INTO `schedule_job_log` VALUES (276, 1, 'testTask', 'renren', 0, NULL, 2, '2021-12-21 22:00:00');
INSERT INTO `schedule_job_log` VALUES (277, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 22:30:00');
INSERT INTO `schedule_job_log` VALUES (278, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-21 23:00:00');
INSERT INTO `schedule_job_log` VALUES (279, 1, 'testTask', 'renren', 0, NULL, 1, '2021-12-22 22:00:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('0f35e0fe-0d47-4047-809e-6986658794d8', 'pf74a', '2021-09-24 10:20:30');
INSERT INTO `sys_captcha` VALUES ('1229bf0d-2104-4411-8409-d37f60b9937f', 'ny6cx', '2021-10-28 19:16:35');
INSERT INTO `sys_captcha` VALUES ('2aa9ff95-d457-4b33-8e91-3683db9f1509', 'eabnb', '2021-09-25 17:28:17');
INSERT INTO `sys_captcha` VALUES ('353e1aa6-cf77-4f79-877d-9e2f7f752d2e', '6gd3d', '2021-09-25 17:26:38');
INSERT INTO `sys_captcha` VALUES ('572eb322-b8d2-47f0-8bc3-ab441b0751a2', 'c47e8', '2021-09-28 08:48:07');
INSERT INTO `sys_captcha` VALUES ('606286b7-1d10-4406-8124-8de3f2d841e7', 'gmx6e', '2021-09-26 09:47:56');
INSERT INTO `sys_captcha` VALUES ('67cb4963-6ecb-49b0-8355-d054006bf5e7', 'wccc3', '2021-10-22 13:01:34');
INSERT INTO `sys_captcha` VALUES ('69ab42b2-e953-4ade-8245-4ab8f3567b82', 'd3x6m', '2021-09-26 09:43:45');
INSERT INTO `sys_captcha` VALUES ('6b765248-29b4-4231-8770-3e17c4129c0e', 'y6wbx', '2021-10-28 19:16:38');
INSERT INTO `sys_captcha` VALUES ('74218120-19ff-43a1-8e0c-6b80c0fecc65', '2p885', '2021-11-08 14:14:50');
INSERT INTO `sys_captcha` VALUES ('751e4cb3-e2f1-48d2-8656-345f63bbcb4b', '2g36g', '2021-09-26 09:09:22');
INSERT INTO `sys_captcha` VALUES ('88f07cbd-f7b9-4dd3-84af-e45ee92270ea', 'dd25c', '2021-09-28 08:29:12');
INSERT INTO `sys_captcha` VALUES ('8c96514f-a341-4263-8d3a-b1c9ce9972cb', 'c6y7e', '2021-10-27 15:33:53');
INSERT INTO `sys_captcha` VALUES ('9cfa3267-057b-418d-85b6-da01cc3c8746', 'dbc6g', '2021-11-20 17:53:36');
INSERT INTO `sys_captcha` VALUES ('a53038a9-eed3-4ca2-8a18-8febeaa3b30c', 'ecg3x', '2021-10-27 15:33:16');
INSERT INTO `sys_captcha` VALUES ('a5902bac-55cc-457b-8f47-bc4d38d32662', '2eynb', '2021-12-21 14:49:17');
INSERT INTO `sys_captcha` VALUES ('bc2d930b-909d-451a-83c6-e8e7604b127c', 'ebd4a', '2021-09-26 09:24:55');
INSERT INTO `sys_captcha` VALUES ('c7d37add-f8a6-4d37-80f4-ec10211e1b6b', '77gma', '2021-12-04 17:25:01');
INSERT INTO `sys_captcha` VALUES ('efdccfa1-fe84-481a-875e-a0ac4480ed54', 'nnw6m', '2021-09-24 10:20:28');
INSERT INTO `sys_captcha` VALUES ('f47fc0a1-17e6-4182-8659-b2813da39468', '4en7n', '2021-09-26 09:45:17');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"qiniuBucketName\":\"ios-app\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', 0, '云存储配置信息');
INSERT INTO `sys_config` VALUES (5, 'proportion', '1', 1, '积分抵用比例');
INSERT INTO `sys_config` VALUES (6, 'reach', '0', 1, '满多少可以抵扣');
INSERT INTO `sys_config` VALUES (7, 'max', '100', 1, '单次最大抵扣积分');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(0) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":1,\"name\":\"会员管理\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0,\"list\":[]}]', 43, '0:0:0:0:0:0:0:1', '2021-09-23 09:36:49');
INSERT INTO `sys_log` VALUES (2, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', 0, '0:0:0:0:0:0:0:1', '2021-09-23 09:37:12');
INSERT INTO `sys_log` VALUES (3, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0,\"list\":[]}]', 14, '0:0:0:0:0:0:0:1', '2021-09-23 09:37:27');
INSERT INTO `sys_log` VALUES (4, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":5,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2021-09-23 09:37:44');
INSERT INTO `sys_log` VALUES (5, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":1,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2021-09-23 09:37:55');
INSERT INTO `sys_log` VALUES (6, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":5,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2021-09-23 09:38:14');
INSERT INTO `sys_log` VALUES (7, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":1,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2021-09-23 09:38:34');
INSERT INTO `sys_log` VALUES (8, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":2,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2021-09-23 09:38:39');
INSERT INTO `sys_log` VALUES (9, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2021-09-23 09:38:47');
INSERT INTO `sys_log` VALUES (10, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":2,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2021-09-23 09:39:51');
INSERT INTO `sys_log` VALUES (11, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', 0, '0:0:0:0:0:0:0:1', '2021-09-24 10:16:18');
INSERT INTO `sys_log` VALUES (12, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', 0, '0:0:0:0:0:0:0:1', '2021-09-24 10:16:34');
INSERT INTO `sys_log` VALUES (13, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', 0, '0:0:0:0:0:0:0:1', '2021-09-24 10:17:09');
INSERT INTO `sys_log` VALUES (14, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":0,\"name\":\"会员列表\",\"url\":\"app/user\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0,\"list\":[]}]', 16, '0:0:0:0:0:0:0:1', '2021-09-24 10:19:43');
INSERT INTO `sys_log` VALUES (15, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"会员列表\",\"url\":\"app/user\",\"perms\":\"app:user:save;app:user:update;app:user:delete\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0,\"list\":[]}]', 18, '0:0:0:0:0:0:0:1', '2021-09-24 10:21:04');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"会员列表\",\"url\":\"app/user\",\"perms\":\"app:user:save;app:user:update;app:user:delete;app:user:info\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2021-09-24 10:24:22');
INSERT INTO `sys_log` VALUES (17, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"会员列表\",\"url\":\"app/user\",\"perms\":\"app:user:list;app:user:save;app:user:update;app:user:delete;app:user:info\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0,\"list\":[]}]', 13, '0:0:0:0:0:0:0:1', '2021-09-24 10:29:36');
INSERT INTO `sys_log` VALUES (18, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"App管理\",\"remark\":\"app管理员\",\"createUserId\":1,\"menuIdList\":[32,33,-666666],\"createTime\":\"Sep 24, 2021 10:49:11 AM\"}]', 458, '0:0:0:0:0:0:0:1', '2021-09-24 10:49:12');
INSERT INTO `sys_log` VALUES (19, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"App管理\",\"remark\":\"app管理员\",\"createUserId\":1,\"menuIdList\":[32,33,-666666],\"createTime\":\"Sep 24, 2021 10:49:11 AM\"}]', 19, '0:0:0:0:0:0:0:1', '2021-09-24 10:49:12');
INSERT INTO `sys_log` VALUES (20, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[2]]', 14, '0:0:0:0:0:0:0:1', '2021-09-24 10:49:28');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"会员列表\",\"url\":\"app/user\",\"perms\":\"app:user:list\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0,\"list\":[]}]', 14, '0:0:0:0:0:0:0:1', '2021-09-24 11:12:25');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"会员列表\",\"url\":\"app/user\",\"perms\":\"app:user:list\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0,\"list\":[]}]', 5, '0:0:0:0:0:0:0:1', '2021-09-24 11:12:25');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"会员列表\",\"url\":\"app/user\",\"perms\":\"app:user:list,app:user:save,app:user:delete,app:user:update\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2021-09-24 11:16:24');
INSERT INTO `sys_log` VALUES (24, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"会员等级\",\"url\":\"app/userlevel\",\"perms\":\"app:userlevel:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0,\"list\":[]}]', 45, '0:0:0:0:0:0:0:1', '2021-09-24 12:32:14');
INSERT INTO `sys_log` VALUES (25, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0,\"list\":[]}]', 14, '0:0:0:0:0:0:0:1', '2021-09-24 12:33:14');
INSERT INTO `sys_log` VALUES (26, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":10,\"list\":[]}]', 5, '0:0:0:0:0:0:0:1', '2021-09-24 12:34:03');
INSERT INTO `sys_log` VALUES (27, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"会员等级\",\"url\":\"app/userlevel\",\"perms\":\"app:userlevel:list,app:userlevel:update,app:userlevel:delete,app:userlevel:update\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0,\"list\":[]}]', 45, '0:0:0:0:0:0:0:1', '2021-09-24 12:58:19');
INSERT INTO `sys_log` VALUES (28, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"会员等级\",\"url\":\"app/userlevel\",\"perms\":\"app:userlevel:list,app:userlevel:update,app:userlevel:delete,app:userlevel:save\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0,\"list\":[]}]', 14, '0:0:0:0:0:0:0:1', '2021-09-24 12:58:48');
INSERT INTO `sys_log` VALUES (29, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shoucangfill\",\"orderNum\":0,\"list\":[]}]', 41, '0:0:0:0:0:0:0:1', '2021-09-24 15:18:21');
INSERT INTO `sys_log` VALUES (30, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shoucangfill\",\"orderNum\":0,\"list\":[]}]', 52, '0:0:0:0:0:0:0:1', '2021-09-24 15:18:21');
INSERT INTO `sys_log` VALUES (31, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[35]', 140, '0:0:0:0:0:0:0:1', '2021-09-24 15:18:43');
INSERT INTO `sys_log` VALUES (32, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":0,\"name\":\"订单管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2021-09-24 15:19:13');
INSERT INTO `sys_log` VALUES (33, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":0,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2021-09-24 15:19:29');
INSERT INTO `sys_log` VALUES (34, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":1,\"list\":[]}]', 10, '0:0:0:0:0:0:0:1', '2021-09-24 15:19:42');
INSERT INTO `sys_log` VALUES (35, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shoucangfill\",\"orderNum\":3,\"list\":[]}]', 6, '0:0:0:0:0:0:0:1', '2021-09-24 15:19:53');
INSERT INTO `sys_log` VALUES (36, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":0,\"name\":\"营销管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2021-09-24 15:21:00');
INSERT INTO `sys_log` VALUES (37, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":0,\"name\":\"积分管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"duanxin\",\"orderNum\":0,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2021-09-24 15:22:12');
INSERT INTO `sys_log` VALUES (38, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":5,\"list\":[]}]', 6, '0:0:0:0:0:0:0:1', '2021-09-24 15:26:35');
INSERT INTO `sys_log` VALUES (39, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"会员等级\",\"url\":\"app/userlevel\",\"perms\":\"app:userlevel:list,app:userlevel:update,app:userlevel:delete,app:userlevel:save\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":5,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2021-09-24 15:44:49');
INSERT INTO `sys_log` VALUES (40, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":0,\"list\":[]}]', 5, '0:0:0:0:0:0:0:1', '2021-09-24 15:45:03');
INSERT INTO `sys_log` VALUES (41, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":36,\"name\":\"管理商品\",\"url\":\"app/storeproduct\",\"perms\":\"app:storeproduct:save,app:storeproduct:update,app:storeproduct:delete\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2021-09-24 15:49:16');
INSERT INTO `sys_log` VALUES (42, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":36,\"name\":\"分类管理\",\"url\":\"app/storecategory\",\"perms\":\"app:storecategory:save,app:storecategory:update,app:storecategory:delete\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 9, '0:0:0:0:0:0:0:1', '2021-09-24 17:03:27');
INSERT INTO `sys_log` VALUES (43, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":0,\"name\":\"用户账单\",\"url\":\"app/userbill\",\"perms\":\"app:userbill:list,app:userbill:save,app:userbill:update,app:userbill:delete\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 31, '0:0:0:0:0:0:0:1', '2021-09-25 16:07:45');
INSERT INTO `sys_log` VALUES (44, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":42,\"parentId\":32,\"name\":\"用户账单\",\"url\":\"app/userbill\",\"perms\":\"app:userbill:list,app:userbill:save,app:userbill:update,app:userbill:delete\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 16, '0:0:0:0:0:0:0:1', '2021-09-25 16:08:00');
INSERT INTO `sys_log` VALUES (45, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":36,\"name\":\"商品收藏\",\"url\":\"app/storeproductrelation\",\"perms\":\"app:storeproductrelation:list,app:storeproductrelation:save,app:storeproductrelation:update,app:storeproductrelation:delete\",\"type\":1,\"icon\":\"xiangqu\",\"orderNum\":0,\"list\":[]}]', 21, '0:0:0:0:0:0:0:1', '2021-09-25 16:25:39');
INSERT INTO `sys_log` VALUES (46, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":0,\"name\":\"优惠券管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shoucang\",\"orderNum\":0,\"list\":[]}]', 19, '0:0:0:0:0:0:0:1', '2021-09-25 16:39:04');
INSERT INTO `sys_log` VALUES (47, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":0,\"name\":\"优惠券管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shoucang\",\"orderNum\":0,\"list\":[]}]', 12, '0:0:0:0:0:0:0:1', '2021-09-25 16:39:05');
INSERT INTO `sys_log` VALUES (48, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[45]', 148, '0:0:0:0:0:0:0:1', '2021-09-25 16:43:28');
INSERT INTO `sys_log` VALUES (49, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":0,\"name\":\"物理管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"job\",\"orderNum\":0,\"list\":[]}]', 13, '0:0:0:0:0:0:0:1', '2021-09-25 16:47:53');
INSERT INTO `sys_log` VALUES (50, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":0,\"name\":\"物理管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"job\",\"orderNum\":0,\"list\":[]}]', 5, '0:0:0:0:0:0:0:1', '2021-09-25 16:47:55');
INSERT INTO `sys_log` VALUES (51, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[47]', 17, '0:0:0:0:0:0:0:1', '2021-09-25 16:48:25');
INSERT INTO `sys_log` VALUES (52, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":37,\"name\":\"订单\",\"url\":\"app/storeorder\",\"perms\":\"app:storeorder:list,app:storeorder:info,app:storeorder:save,app:storeorder:update,app:storeorder:delete\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]', 14, '0:0:0:0:0:0:0:1', '2021-09-25 17:00:11');
INSERT INTO `sys_log` VALUES (53, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":37,\"name\":\"订单\",\"url\":\"app/storeorder\",\"perms\":\"app:storeorder:list,app:storeorder:info,app:storeorder:save,app:storeorder:update,app:storeorder:delete\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2021-09-25 17:00:11');
INSERT INTO `sys_log` VALUES (54, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[49]', 32, '0:0:0:0:0:0:0:1', '2021-09-25 17:00:30');
INSERT INTO `sys_log` VALUES (55, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":37,\"name\":\"评论\",\"url\":\"app/storeproductreply\",\"perms\":\"app:storeproductreply:list,app:storeproductreply:save,app:storeproductreply:update,app:storeproductreply:delete\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]', 14, '0:0:0:0:0:0:0:1', '2021-09-25 17:55:30');
INSERT INTO `sys_log` VALUES (56, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":50,\"parentId\":37,\"name\":\"评论\",\"url\":\"app/storeproductreply\",\"perms\":\"app:storeproductreply:list,app:storeproductreply:save,app:storeproductreply:update,app:storeproductreply:delete\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]', 9, '0:0:0:0:0:0:0:1', '2021-09-26 09:52:35');
INSERT INTO `sys_log` VALUES (57, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":50,\"parentId\":37,\"name\":\"评论\",\"url\":\"app/storeproductreply\",\"perms\":\"app:storeproductreply:list\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]', 32, '0:0:0:0:0:0:0:1', '2021-09-27 14:39:51');
INSERT INTO `sys_log` VALUES (58, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":48,\"parentId\":37,\"name\":\"订单\",\"url\":\"app/storeorder\",\"perms\":\"app:storeorder:list,app:storeorder:info,app:storeorder:save,app:storeorder:update,app:storeorder:delete\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]', 26, '0:0:0:0:0:0:0:1', '2021-09-27 15:34:10');
INSERT INTO `sys_log` VALUES (59, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":0,\"name\":\"物流管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"job\",\"orderNum\":0,\"list\":[]}]', 76, '0:0:0:0:0:0:0:1', '2021-09-30 14:37:37');
INSERT INTO `sys_log` VALUES (60, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":51,\"parentId\":38,\"name\":\"秒杀商品\",\"url\":\"app/storeseckill\",\"perms\":\"app:storeseckill:list,app:storeseckill:save,app:storeseckill:update,app:storeseckill:delete\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 49, '0:0:0:0:0:0:0:1', '2021-10-28 15:43:51');
INSERT INTO `sys_log` VALUES (61, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":38,\"name\":\"秒杀商品\",\"url\":\"app/storeseckill\",\"perms\":\"app:storeseckill:list,app:storeseckill:save,app:storeseckill:update,app:storeseckill:delete,app:storeseckill:info\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 37, '0:0:0:0:0:0:0:1', '2021-10-28 16:16:35');
INSERT INTO `sys_log` VALUES (62, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":38,\"name\":\"秒杀商品\",\"url\":\"app/storeseckill\",\"perms\":\"app:storeseckill:list,app:storeseckill:save,app:storeseckill:update,app:storeseckill:info,app:storeseckill:delete,\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 21, '0:0:0:0:0:0:0:1', '2021-10-28 17:36:43');
INSERT INTO `sys_log` VALUES (63, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":38,\"name\":\"秒杀配置\",\"url\":\"app/secondkillsetting\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]', 13, '0:0:0:0:0:0:0:1', '2021-10-28 17:47:37');
INSERT INTO `sys_log` VALUES (64, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":52,\"parentId\":38,\"name\":\"秒杀配置\",\"url\":\"app/secondkillsetting\",\"perms\":\"app:storeseckill:list,app:storeseckill:save,app:storeseckill:update,app:storeseckill:info,app:storeseckill:delete\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]', 15, '0:0:0:0:0:0:0:1', '2021-10-28 17:48:02');
INSERT INTO `sys_log` VALUES (65, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":4,\"list\":[]}]', 13, '0:0:0:0:0:0:0:1', '2021-10-28 17:49:01');
INSERT INTO `sys_log` VALUES (66, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":0,\"name\":\"秒杀管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0,\"list\":[]}]', 27, '0:0:0:0:0:0:0:1', '2021-10-28 18:43:50');
INSERT INTO `sys_log` VALUES (67, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":53,\"parentId\":46,\"name\":\"快递公司\",\"url\":\"app/express\",\"perms\":\"app:express:list,app:express:info,app:express:save,app:express:update,app:express:delete\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0,\"list\":[]}]', 18, '0:0:0:0:0:0:0:1', '2021-10-28 18:46:17');
INSERT INTO `sys_log` VALUES (68, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":39,\"name\":\"发放记录\",\"url\":\"app/usersign\",\"perms\":\"app:usersign:list,app:usersign:info,app:usersign:save,app:usersign:update,app:usersign:delete\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]', 15, '0:0:0:0:0:0:0:1', '2021-10-28 19:13:26');
INSERT INTO `sys_log` VALUES (69, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":39,\"name\":\"积分配置\",\"url\":\"app/integralsetting\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]', 18, '0:0:0:0:0:0:0:1', '2021-10-28 19:30:26');
INSERT INTO `sys_log` VALUES (70, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":55,\"parentId\":39,\"name\":\"积分配置\",\"url\":\"app/integralsetting\",\"perms\":\"app:usersign:update\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]', 20, '0:0:0:0:0:0:0:1', '2021-10-28 19:55:18');
INSERT INTO `sys_log` VALUES (71, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":55,\"parentId\":39,\"name\":\"积分配置\",\"url\":\"app/integralsetting\",\"perms\":\"app:usersign:list,app:usersign:info,app:usersign:save,app:usersign:update,app:usersign:delete\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]', 19, '0:0:0:0:0:0:0:1', '2021-10-28 21:37:05');
INSERT INTO `sys_log` VALUES (72, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":56,\"parentId\":44,\"name\":\"优惠券制作\",\"url\":\"app/storecoupon\",\"perms\":\"app:storecoupon:list,app:storecoupon:info,app:storecoupon:update,app:storecoupon:save,app:storecoupon:delete\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]', 21, '0:0:0:0:0:0:0:1', '2021-10-29 16:14:24');
INSERT INTO `sys_log` VALUES (73, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":57,\"parentId\":0,\"name\":\"发放记录\",\"url\":\"app/storecouponuser\",\"perms\":\"app:storecouponuser:list,app:storecouponuser:info,app:storecouponuser:update,app:storecouponuser:save,app:storecouponuser:delete\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 51, '0:0:0:0:0:0:0:1', '2021-10-29 18:18:49');
INSERT INTO `sys_log` VALUES (74, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":58,\"parentId\":0,\"name\":\"领取记录\",\"url\":\"app/storecouponissueuser\",\"perms\":\"app:storecouponissueuser:list,app:storecouponissueuser:info,app:storecouponissueuser:update,app:storecouponissueuser:save,app:storecouponissueuser:delete\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 9, '0:0:0:0:0:0:0:1', '2021-10-29 18:20:14');
INSERT INTO `sys_log` VALUES (75, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":57,\"parentId\":44,\"name\":\"发放记录\",\"url\":\"app/storecouponuser\",\"perms\":\"app:storecouponuser:list,app:storecouponuser:info,app:storecouponuser:update,app:storecouponuser:save,app:storecouponuser:delete\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 17, '0:0:0:0:0:0:0:1', '2021-10-29 18:20:47');
INSERT INTO `sys_log` VALUES (76, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":58,\"parentId\":44,\"name\":\"领取记录\",\"url\":\"app/storecouponissueuser\",\"perms\":\"app:storecouponissueuser:list,app:storecouponissueuser:info,app:storecouponissueuser:update,app:storecouponissueuser:save,app:storecouponissueuser:delete\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2021-10-29 18:20:55');
INSERT INTO `sys_log` VALUES (77, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":58,\"parentId\":44,\"name\":\"领取记录\",\"url\":\"app/storecouponissue\",\"perms\":\"app:storecouponissue:list,app:storecouponissue:info,app:storecouponissue:update,app:storecouponissue:save,app:storecouponissue:delete\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 22, '0:0:0:0:0:0:0:1', '2021-10-29 19:04:09');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 4);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (32, 0, '会员管理', '', '', 0, 'admin', 1);
INSERT INTO `sys_menu` VALUES (33, 32, '会员列表', 'app/user', 'app:user:list,app:user:save,app:user:delete,app:user:update', 1, 'geren', 0);
INSERT INTO `sys_menu` VALUES (34, 32, '会员等级', 'app/userlevel', 'app:userlevel:list,app:userlevel:update,app:userlevel:delete,app:userlevel:save', 1, 'tubiao', 5);
INSERT INTO `sys_menu` VALUES (36, 0, '商品管理', '', '', 0, 'shoucangfill', 3);
INSERT INTO `sys_menu` VALUES (37, 0, '订单管理', '', '', 0, 'editor', 0);
INSERT INTO `sys_menu` VALUES (38, 0, '秒杀管理', '', '', 0, 'mudedi', 0);
INSERT INTO `sys_menu` VALUES (39, 0, '积分管理', '', '', 0, 'duanxin', 0);
INSERT INTO `sys_menu` VALUES (40, 36, '管理商品', 'app/storeproduct', 'app:storeproduct:save,app:storeproduct:update,app:storeproduct:delete', 1, 'menu', 0);
INSERT INTO `sys_menu` VALUES (41, 36, '分类管理', 'app/storecategory', 'app:storecategory:save,app:storecategory:update,app:storecategory:delete', 1, 'zhedie', 0);
INSERT INTO `sys_menu` VALUES (42, 32, '用户账单', 'app/userbill', 'app:userbill:list,app:userbill:save,app:userbill:update,app:userbill:delete', 1, 'log', 0);
INSERT INTO `sys_menu` VALUES (43, 36, '商品收藏', 'app/storeproductrelation', 'app:storeproductrelation:list,app:storeproductrelation:save,app:storeproductrelation:update,app:storeproductrelation:delete', 1, 'xiangqu', 0);
INSERT INTO `sys_menu` VALUES (44, 0, '优惠券管理', '', '', 0, 'shoucang', 0);
INSERT INTO `sys_menu` VALUES (46, 0, '物流管理', '', '', 0, 'job', 0);
INSERT INTO `sys_menu` VALUES (48, 37, '订单', 'app/storeorder', 'app:storeorder:list,app:storeorder:info,app:storeorder:save,app:storeorder:update,app:storeorder:delete', 1, 'config', 0);
INSERT INTO `sys_menu` VALUES (50, 37, '评论', 'app/storeproductreply', 'app:storeproductreply:list', 1, 'editor', 0);
INSERT INTO `sys_menu` VALUES (51, 38, '秒杀商品', 'app/storeseckill', 'app:storeseckill:list,app:storeseckill:save,app:storeseckill:update,app:storeseckill:info,app:storeseckill:delete,', 1, 'zhedie', 0);
INSERT INTO `sys_menu` VALUES (52, 38, '秒杀配置', 'app/secondkillsetting', 'app:storeseckill:list,app:storeseckill:save,app:storeseckill:update,app:storeseckill:info,app:storeseckill:delete', 1, 'config', 0);
INSERT INTO `sys_menu` VALUES (53, 46, '快递公司', 'app/express', 'app:express:list,app:express:info,app:express:save,app:express:update,app:express:delete', 1, 'duanxin', 0);
INSERT INTO `sys_menu` VALUES (54, 39, '发放记录', 'app/usersign', 'app:usersign:list,app:usersign:info,app:usersign:save,app:usersign:update,app:usersign:delete', 1, 'editor', 0);
INSERT INTO `sys_menu` VALUES (55, 39, '积分配置', 'app/integralsetting', 'app:usersign:list,app:usersign:info,app:usersign:save,app:usersign:update,app:usersign:delete', 1, 'config', 0);
INSERT INTO `sys_menu` VALUES (56, 44, '优惠券制作', 'app/storecoupon', 'app:storecoupon:list,app:storecoupon:info,app:storecoupon:update,app:storecoupon:save,app:storecoupon:delete', 1, 'bianji', 0);
INSERT INTO `sys_menu` VALUES (57, 44, '发放记录', 'app/storecouponuser', 'app:storecouponuser:list,app:storecouponuser:info,app:storecouponuser:update,app:storecouponuser:save,app:storecouponuser:delete', 1, 'log', 0);
INSERT INTO `sys_menu` VALUES (58, 44, '领取记录', 'app/storecouponissue', 'app:storecouponissue:list,app:storecouponissue:info,app:storecouponissue:update,app:storecouponissue:save,app:storecouponissue:delete', 1, 'zhedie', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(0) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'App管理', 'app管理员', 1, '2021-09-24 10:49:11');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 32);
INSERT INTO `sys_role_menu` VALUES (2, 1, 33);
INSERT INTO `sys_role_menu` VALUES (3, 1, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(0) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(0) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, '49340e2b4456b09d76fb3efca2e5d167', '2021-12-22 03:27:35', '2021-12-21 15:27:35');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Table structure for visits
-- ----------------------------
DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip_counts` bigint(0) NULL DEFAULT NULL,
  `pv_counts` bigint(0) NULL DEFAULT NULL,
  `week_day` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_11aksgq87euk9bcyeesfs4vtp`(`date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '访客记录' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
