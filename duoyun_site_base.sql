/*
Navicat MySQL Data Transfer

Source Server         : 多云产品
Source Server Version : 50718
Source Host           : rm-bp146cd3b8qu40l7coo.mysql.rds.aliyuncs.com:3306
Source Database       : duoyun_site_base

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-07-02 11:24:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yunsite_area
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_area`;
CREATE TABLE `yunsite_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `parent_area_key` varchar(255) DEFAULT NULL,
  `area_key` varchar(255) DEFAULT NULL COMMENT '代码',
  `rank` varchar(255) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `parent_area_key` (`parent_area_key`),
  KEY `area_key` (`area_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3509 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='全国省市县数据';

-- ----------------------------
-- Table structure for yunsite_cashaccount
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_cashaccount`;
CREATE TABLE `yunsite_cashaccount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `balance` decimal(12,2) DEFAULT '0.00' COMMENT '可用余额',
  `blocked_balance` decimal(9,2) DEFAULT '0.00' COMMENT '冻结资金',
  `create_time` int(255) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '最后更新时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户财务账户';

-- ----------------------------
-- Table structure for yunsite_cashaccount_charge_log
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_cashaccount_charge_log`;
CREATE TABLE `yunsite_cashaccount_charge_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL COMMENT '来源类型，手动，支付宝，微信',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `account_id` int(10) unsigned DEFAULT NULL COMMENT '账户id',
  `amount` decimal(9,2) unsigned DEFAULT NULL COMMENT '金额',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `extra_data` text,
  `out_trade_no` varchar(255) DEFAULT NULL COMMENT '第三方支付商户订单号',
  `status` tinyint(3) DEFAULT '1' COMMENT '1未支付 2成功 3失败',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `user_id` (`user_id`),
  KEY `account_id` (`account_id`),
  KEY `out_trade_no` (`out_trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='充值记录表';

-- ----------------------------
-- Table structure for yunsite_cashaccount_log
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_cashaccount_log`;
CREATE TABLE `yunsite_cashaccount_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `amount` decimal(9,2) unsigned DEFAULT NULL COMMENT '金额',
  `account_id` int(10) unsigned DEFAULT NULL COMMENT '账户id',
  `balance` decimal(9,2) unsigned DEFAULT '0.00' COMMENT '金额',
  `to_user_id` int(11) unsigned DEFAULT NULL COMMENT '交易方用户id',
  `to_account_id` int(9) unsigned DEFAULT '0' COMMENT '交易方账户id',
  `transfer_code` varchar(64) DEFAULT NULL COMMENT '统一交易流水号',
  `create_time` int(255) unsigned DEFAULT NULL COMMENT '创建时间',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `method` varchar(255) DEFAULT NULL COMMENT 'add/pen 加减',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `note` varchar(255) DEFAULT NULL COMMENT '描述',
  `extra_data` varchar(255) DEFAULT NULL COMMENT '自定义数据',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `account_id` (`account_id`),
  KEY `to_user_id` (`to_user_id`),
  KEY `to_account_id` (`to_account_id`),
  KEY `transfer_id` (`transfer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户财务账户';

-- ----------------------------
-- Table structure for yunsite_cashaccount_pay
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_cashaccount_pay`;
CREATE TABLE `yunsite_cashaccount_pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `create_time` int(11) DEFAULT NULL COMMENT '时间',
  `amount` decimal(9,2) DEFAULT NULL COMMENT '金额',
  `out_trade_no` varchar(255) DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '状态1未完成 2成功 3失败',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `account_id` (`account_id`),
  KEY `order_id` (`order_id`),
  KEY `out_trade_no` (`out_trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付记录';

-- ----------------------------
-- Table structure for yunsite_cashaccount_refund
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_cashaccount_refund`;
CREATE TABLE `yunsite_cashaccount_refund` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `account_id` int(10) unsigned DEFAULT NULL COMMENT '账户id',
  `amount` decimal(9,2) unsigned DEFAULT NULL COMMENT '金额',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) DEFAULT NULL COMMENT '商户交易号',
  `refund_no` varchar(255) DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `account_id` (`account_id`),
  KEY `order_id` (`order_id`),
  KEY `out_trade_no` (`out_trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='退款记录';

-- ----------------------------
-- Table structure for yunsite_cashaccount_withdraw_log
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_cashaccount_withdraw_log`;
CREATE TABLE `yunsite_cashaccount_withdraw_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  `amount` decimal(9,2) unsigned DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '申请时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '处理时间',
  `data` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1未处理 2成功 3失败',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户提现表';

-- ----------------------------
-- Table structure for yunsite_common_fans
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_common_fans`;
CREATE TABLE `yunsite_common_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(55) DEFAULT NULL,
  `open_id` varchar(128) DEFAULT NULL COMMENT '订阅号用户的openId',
  `union_id` varchar(128) DEFAULT NULL COMMENT '用户的unionId',
  PRIMARY KEY (`id`),
  KEY `union_id` (`union_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_common_user
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_common_user`;
CREATE TABLE `yunsite_common_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned DEFAULT '0' COMMENT '店铺ID',
  `nickname` varchar(255) DEFAULT NULL,
  `open_id` varchar(128) DEFAULT NULL,
  `union_id` varchar(128) DEFAULT NULL,
  `head_img_url` varchar(255) DEFAULT NULL,
  `sex` tinyint(3) unsigned DEFAULT '0',
  `province` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `register_ip` varchar(55) DEFAULT NULL,
  `register_time` int(10) unsigned DEFAULT NULL,
  `last_login_time` int(10) unsigned DEFAULT NULL,
  `last_login_ip` varchar(55) DEFAULT NULL,
  `login_count` int(10) unsigned DEFAULT '0',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_distribute_record
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_distribute_record`;
CREATE TABLE `yunsite_distribute_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `distribute_code` varchar(55) DEFAULT NULL COMMENT '邀请CODE',
  `goods_id` int(10) unsigned DEFAULT NULL COMMENT '购买商品ID',
  `goods_title` varchar(255) DEFAULT NULL COMMENT '购买商品标题',
  `goods_price` decimal(9,2) DEFAULT NULL COMMENT '购买商品价格',
  `reward_price` decimal(9,2) DEFAULT NULL COMMENT '商品分销赏金',
  `pay_order_id` int(11) unsigned DEFAULT NULL COMMENT '订单ID',
  `pay_order_code` varchar(55) DEFAULT NULL COMMENT '支付订单号',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1是邀请 2是购买',
  PRIMARY KEY (`id`),
  KEY `distribute_code` (`distribute_code`),
  KEY `pay_order_id` (`pay_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_distribute_user
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_distribute_user`;
CREATE TABLE `yunsite_distribute_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `distribute_code` varchar(55) DEFAULT NULL COMMENT '分销CODE',
  `distribute_invite` int(10) unsigned DEFAULT '0' COMMENT '分销邀请人数',
  `distribute_success` int(10) unsigned DEFAULT '0' COMMENT '分销成功人数',
  `distribute_reward` decimal(9,2) DEFAULT '0.00' COMMENT '分销累计赏金',
  `distribute_extract` decimal(9,2) DEFAULT '0.00' COMMENT '累计提现金额',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `distribute_code` (`distribute_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_activity
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_activity`;
CREATE TABLE `yunsite_huzhou_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned DEFAULT NULL COMMENT '活动商家ID',
  `title` varchar(55) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `pic` varchar(512) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '活动类型 1领取型 2抽奖型',
  `coupon_count` int(11) unsigned DEFAULT '0' COMMENT '优惠券数量',
  `receive_count` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券领取数量',
  `force_follow` tinyint(4) DEFAULT '2' COMMENT '是否强制关注 1是 2否',
  `force_share` tinyint(4) DEFAULT '2' COMMENT '是否强制分享 1是 2否',
  `is_wx_card` tinyint(4) unsigned DEFAULT '2' COMMENT '是否微信卡券',
  `order_data` text COMMENT '下单表单自定义字段',
  `share_data` text COMMENT '分享信息',
  `awards_data` text COMMENT '奖项',
  `extra_data` text COMMENT '附加字段',
  `lottery_status` tinyint(3) unsigned DEFAULT '2' COMMENT '是否开奖 1是 2否',
  `lottery_time` int(10) unsigned DEFAULT NULL COMMENT '开奖时间',
  `content` text COMMENT '图文详情',
  `buy_start_time` int(10) unsigned DEFAULT NULL COMMENT '购买开始时间',
  `buy_end_time` int(10) unsigned DEFAULT NULL COMMENT '购买结束时间',
  `use_start_time` int(10) unsigned DEFAULT NULL COMMENT '使用开始时间',
  `use_end_time` int(10) unsigned DEFAULT NULL COMMENT '使用结束时间',
  `join_base` int(10) unsigned DEFAULT '0' COMMENT '报名基数',
  `join_count` int(10) unsigned DEFAULT '0' COMMENT '报名参与人数',
  `rank` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `view` int(10) unsigned DEFAULT '0',
  `view_list` varchar(255) DEFAULT NULL,
  `share` int(10) unsigned DEFAULT '0' COMMENT '分享次数',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `shop_stay` int(11) DEFAULT '1' COMMENT '商家入驻开关（-1：关闭  1：开启）',
  `join_limit` int(10) unsigned DEFAULT '1' COMMENT '活动报名次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_activity_bag
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_activity_bag`;
CREATE TABLE `yunsite_huzhou_activity_bag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) unsigned DEFAULT NULL COMMENT '关联活动ID',
  `bag_name` varchar(55) DEFAULT NULL COMMENT '福袋名称',
  `obtain_odds` int(10) unsigned DEFAULT NULL COMMENT '获取概率',
  `checked_pic` varchar(512) DEFAULT NULL,
  `unchecked_pic` varchar(512) DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_activity_bag_join
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_activity_bag_join`;
CREATE TABLE `yunsite_huzhou_activity_bag_join` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) unsigned DEFAULT NULL COMMENT '活动ID',
  `shop_id` int(11) unsigned DEFAULT NULL COMMENT '商家ID',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(55) DEFAULT NULL COMMENT '联系姓名',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `extra_data` text COMMENT '附加信息',
  `bag_count` int(11) unsigned DEFAULT NULL COMMENT '已获得福袋种类数量',
  `today_chance` int(10) unsigned DEFAULT NULL COMMENT '今日剩余抽奖次数',
  `collect_chanced` int(10) unsigned DEFAULT NULL COMMENT '累计抽奖次数',
  `share_chance` int(10) unsigned DEFAULT NULL COMMENT '分享奖励次数',
  `coupon_code` varchar(55) DEFAULT NULL COMMENT '优惠券CODE',
  `receive_time` int(11) unsigned DEFAULT NULL COMMENT '领取时间',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1进行中 2已领取 3已使用 4已过期',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_activity_bag_record
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_activity_bag_record`;
CREATE TABLE `yunsite_huzhou_activity_bag_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) unsigned DEFAULT NULL COMMENT '活动ID',
  `bag_id` int(11) unsigned DEFAULT NULL COMMENT '福袋ID',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `number` int(11) unsigned DEFAULT '1' COMMENT '福袋数量',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `bag_id` (`bag_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_activity_bag_share
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_activity_bag_share`;
CREATE TABLE `yunsite_huzhou_activity_bag_share` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned DEFAULT '1' COMMENT '1是链接，2是海报',
  `activity_id` int(11) unsigned DEFAULT NULL COMMENT '活动ID',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `owner_user_id` int(11) unsigned DEFAULT NULL COMMENT '分享用户ID',
  `create_time` int(11) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `activity_id` (`activity_id`),
  KEY `owner_user_id` (`owner_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_activity_give
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_activity_give`;
CREATE TABLE `yunsite_huzhou_activity_give` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) unsigned DEFAULT NULL,
  `activity_join_id` int(10) unsigned DEFAULT NULL,
  `from_user_id` int(10) unsigned DEFAULT NULL,
  `to_user_id` int(10) unsigned DEFAULT NULL,
  `extra_data` text,
  `create_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `activity_join_id` (`activity_join_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_activity_join
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_activity_join`;
CREATE TABLE `yunsite_huzhou_activity_join` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) unsigned DEFAULT NULL COMMENT '活动ID',
  `activity_type` tinyint(3) unsigned DEFAULT '0' COMMENT '1领取型 2抽奖型',
  `shop_id` int(10) unsigned DEFAULT NULL COMMENT '商家ID',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(55) DEFAULT NULL COMMENT '用户名',
  `user_phone` varchar(55) DEFAULT NULL COMMENT '联系电话',
  `user_extra` text COMMENT '附加信息',
  `winning_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1系统开奖，2内定奖品，-1黑名单',
  `reward` varchar(255) DEFAULT NULL COMMENT '奖品',
  `reward_dft` varchar(255) DEFAULT NULL COMMENT '内定中奖奖项',
  `give_count` int(10) unsigned DEFAULT '0' COMMENT '转增次数',
  `force_share` int(11) DEFAULT '1' COMMENT '1是需要转发 2是已转发 3是无需转发',
  `code` varchar(55) DEFAULT NULL COMMENT '优惠码',
  `notice_status` tinyint(4) DEFAULT '0' COMMENT '前台开奖通知',
  `message_status` tinyint(4) DEFAULT '0' COMMENT '消息推送通知',
  `coupon_code` char(32) DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1待核销 2已核销',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_bargain
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_bargain`;
CREATE TABLE `yunsite_huzhou_bargain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT NULL COMMENT '关联商品ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT '管理员ID',
  `title` varchar(255) DEFAULT NULL COMMENT '砍价',
  `banner` varchar(512) DEFAULT NULL,
  `target_price` decimal(9,2) DEFAULT NULL COMMENT '目标金额',
  `bargain_between` varchar(55) DEFAULT NULL COMMENT '砍价区间',
  `bargain_limit` int(10) unsigned DEFAULT NULL COMMENT '帮砍限制',
  `bargain_start_time` int(10) unsigned DEFAULT NULL COMMENT '砍价开始时间',
  `bargain_end_time` int(10) unsigned DEFAULT NULL COMMENT '砍价结束时间',
  `pay_end_time` int(10) unsigned DEFAULT NULL COMMENT '购买结束时间 秒',
  `share_data` text,
  `extra_data` text,
  `force_follow` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1开启，2关闭，3自定义',
  `force_follow_info` varchar(255) DEFAULT NULL COMMENT '强制关注配置',
  `bargain_rule` text COMMENT '砍价规则说明',
  `join_count` int(10) unsigned DEFAULT '0' COMMENT '参与人数',
  `bargain_count` int(10) unsigned DEFAULT '0' COMMENT '帮砍人数',
  `share_count` int(10) unsigned DEFAULT '0',
  `view` int(10) unsigned DEFAULT '0' COMMENT '访问量',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `shop_stay` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '商家入驻开关（-1：关闭  1：开启）',
  `join_record_type` tinyint(4) unsigned DEFAULT '1' COMMENT '报名记录展现方式，1滚动，2分页',
  `share_guide_type` tinyint(4) unsigned DEFAULT '1' COMMENT '分享引导方式，1文字提示，2图片引导',
  PRIMARY KEY (`id`),
  KEY `good_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_bargain_record
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_bargain_record`;
CREATE TABLE `yunsite_huzhou_bargain_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT NULL COMMENT '商品ID',
  `bargain_id` int(10) unsigned DEFAULT NULL COMMENT '砍价活动ID',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '帮砍用户ID',
  `owner_user_id` int(10) unsigned DEFAULT NULL COMMENT '参与记录用户ID',
  `owner_bargain_id` int(11) unsigned DEFAULT NULL COMMENT '参与记录表ID',
  `bargain_price` decimal(9,2) DEFAULT NULL COMMENT '砍价金额',
  `bargain_node` varchar(55) DEFAULT NULL COMMENT '砍价描述',
  `client_ip` varchar(55) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `bargain_id` (`bargain_id`),
  KEY `owner_bargain_id` (`owner_bargain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_bargain_user
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_bargain_user`;
CREATE TABLE `yunsite_huzhou_bargain_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `bargain_id` int(10) unsigned DEFAULT NULL COMMENT '砍价活动ID',
  `bargain_code` varchar(32) DEFAULT NULL COMMENT '砍价编码',
  `bargain_count` int(10) unsigned DEFAULT '0' COMMENT '砍价次数',
  `goods_id` int(10) unsigned DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_price` decimal(9,2) DEFAULT NULL COMMENT '商品金额',
  `discount_price` decimal(9,2) DEFAULT NULL COMMENT '优惠金额',
  `target_price` decimal(9,2) DEFAULT NULL COMMENT '目标金额',
  `pay_end_time` int(10) unsigned DEFAULT NULL COMMENT '剩余支付时间',
  `order_code` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `client_ip` varchar(55) DEFAULT NULL COMMENT '参与IP',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '支付状态 1进行中2已支付3已过期',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `bargain_code` (`bargain_code`),
  KEY `bargain_id` (`bargain_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_coupon
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_coupon`;
CREATE TABLE `yunsite_huzhou_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned DEFAULT '0' COMMENT '商家ID',
  `source_id` int(10) unsigned DEFAULT '0' COMMENT '来源ID',
  `user_id` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(3) unsigned DEFAULT '0' COMMENT '1领取型，2抽奖型，3集福型',
  `code` varchar(255) DEFAULT NULL COMMENT '优惠券CODE',
  `title` varchar(255) DEFAULT NULL COMMENT '优惠券标题',
  `subtitle` varchar(255) DEFAULT NULL COMMENT '副标题',
  `pic` varchar(255) DEFAULT NULL COMMENT '优惠券封面',
  `start_time` int(10) unsigned DEFAULT NULL COMMENT '有效期开始',
  `end_time` int(10) unsigned DEFAULT NULL COMMENT '有效期结束',
  `use_time` int(10) unsigned DEFAULT NULL COMMENT '核销时间',
  `use_business_id` int(11) unsigned DEFAULT NULL COMMENT '核销商家',
  `use_user_id` int(11) unsigned DEFAULT NULL COMMENT '商家核销用户',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1待核销，2已核销，3已过期',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `source_id` (`source_id`),
  KEY `code` (`code`),
  KEY `type` (`type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_goods
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_goods`;
CREATE TABLE `yunsite_huzhou_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL COMMENT '商家id',
  `title` varchar(55) DEFAULT NULL COMMENT '标题',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `pic` varchar(512) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT '0.00' COMMENT '价格',
  `orig_price` decimal(9,2) DEFAULT '0.00' COMMENT '原价',
  `can_refund` tinyint(3) unsigned DEFAULT '1' COMMENT '是否支持退款',
  `buy_limit` int(10) unsigned DEFAULT '0' COMMENT '购买限制数量',
  `express_type_options` varchar(255) DEFAULT NULL,
  `order_data` text,
  `share_data` text,
  `extra_data` text COMMENT '附加字段',
  `content` text COMMENT '图文详情',
  `buy_start_time` int(11) unsigned DEFAULT NULL COMMENT '购买开始时间',
  `buy_end_time` int(11) unsigned DEFAULT NULL COMMENT '购买结束时间',
  `use_start_time` int(11) unsigned DEFAULT NULL COMMENT '使用开始时间',
  `use_end_time` int(11) unsigned DEFAULT NULL COMMENT '使用结束时间',
  `force_follow` tinyint(3) unsigned DEFAULT '1' COMMENT '强制关注 1是2否',
  `force_share` tinyint(3) unsigned DEFAULT '1' COMMENT '强制转发 1是 2否',
  `stock_count` int(11) unsigned DEFAULT '0' COMMENT '库存',
  `sold_count` int(255) DEFAULT '0' COMMENT '订购数',
  `is_bargain` tinyint(3) unsigned DEFAULT '2' COMMENT '1是2否',
  `view` int(10) unsigned DEFAULT '0' COMMENT '访问量',
  `view_list` varchar(255) DEFAULT NULL,
  `rank` int(255) DEFAULT NULL COMMENT '排序',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '发布时间',
  `update_time` int(11) unsigned DEFAULT NULL,
  `status` int(255) DEFAULT '1' COMMENT '状态',
  `shop_stay` int(11) DEFAULT '-1' COMMENT '商家入驻开关（-1：关闭  1：开启）',
  `distribute_status` tinyint(4) unsigned DEFAULT '2' COMMENT '分销开关 1开启 2关闭',
  `distribute_reward` decimal(9,2) DEFAULT NULL COMMENT '分销奖励金额',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品主表';

-- ----------------------------
-- Table structure for yunsite_huzhou_multiple_shop
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_multiple_shop`;
CREATE TABLE `yunsite_huzhou_multiple_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '1活动，2商品',
  `source_id` int(10) unsigned DEFAULT NULL COMMENT '商品ID、活动ID',
  `shop_id` int(10) unsigned DEFAULT NULL COMMENT '商家ID',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_operate
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_operate`;
CREATE TABLE `yunsite_huzhou_operate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '推荐类型 1首页',
  `title` varchar(55) DEFAULT NULL COMMENT '标题',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `pic` varchar(512) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `show_time_start` int(10) unsigned DEFAULT NULL COMMENT '展示开始时间',
  `show_time_end` int(10) unsigned DEFAULT NULL COMMENT '展示结束时间',
  `rank` int(10) unsigned DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_huzhou_shop
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_shop`;
CREATE TABLE `yunsite_huzhou_shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL COMMENT '商家名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `pic` varchar(512) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL COMMENT '标签',
  `tel_phone` varchar(55) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL,
  `content` text COMMENT '图文详情',
  `use_code` int(10) DEFAULT NULL COMMENT '核销码',
  `extra_data` text COMMENT '自定义字段',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `rank` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商家表';

-- ----------------------------
-- Table structure for yunsite_huzhou_shop_stay
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_huzhou_shop_stay`;
CREATE TABLE `yunsite_huzhou_shop_stay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '提交用户',
  `shop_name` varchar(55) DEFAULT NULL COMMENT '商家名称',
  `name` varchar(55) DEFAULT NULL COMMENT '联系姓名',
  `address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `wechat` varchar(55) DEFAULT NULL COMMENT '微信号',
  `remark` text COMMENT '备注信息',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '状态（1：申请入驻  2：已入住  -1：PASS）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_message_list
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_message_list`;
CREATE TABLE `yunsite_message_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned DEFAULT NULL COMMENT '消息任务ID',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `openid` varchar(128) DEFAULT NULL,
  `message_data` text CHARACTER SET utf8mb4 COMMENT '模板内容',
  `send_remark` varchar(255) DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1等待推送，2推送完成，3推送失败',
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_message_task
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_message_task`;
CREATE TABLE `yunsite_message_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` int(10) unsigned DEFAULT '1' COMMENT '1是活动，2是商品',
  `target_id` int(11) unsigned DEFAULT NULL COMMENT '目标ID',
  `template_id` varchar(55) DEFAULT NULL,
  `template_name` varchar(55) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL COMMENT '消息内容',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注信息',
  `send_count` int(10) unsigned DEFAULT '0' COMMENT '推送数量',
  `send_success` int(10) unsigned DEFAULT '0' COMMENT '推送成功',
  `send_time` int(10) unsigned DEFAULT NULL COMMENT '推送时间',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1等待推送，2推送中，3推送完成， 8已撤回',
  PRIMARY KEY (`id`),
  KEY `target_type` (`target_type`),
  KEY `target_id` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_order
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_order`;
CREATE TABLE `yunsite_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `buyer_id` int(11) DEFAULT NULL COMMENT '购买用户id',
  `seller_id` int(11) DEFAULT NULL COMMENT '商家id',
  `order_price` decimal(9,2) unsigned DEFAULT NULL COMMENT '订单总额',
  `goods_price` decimal(9,2) unsigned DEFAULT NULL COMMENT '商品总金额',
  `pay_price` decimal(9,2) unsigned DEFAULT NULL COMMENT '应付金额',
  `payed_price` decimal(9,2) unsigned DEFAULT NULL COMMENT '已付金额',
  `discount_ids` varchar(255) DEFAULT NULL COMMENT '优惠券id',
  `discount_price` decimal(9,2) unsigned DEFAULT NULL COMMENT '优惠金额',
  `express_type` varchar(255) DEFAULT NULL COMMENT '配送方式',
  `express_price` decimal(9,2) unsigned DEFAULT NULL COMMENT '配送费用',
  `refund_price` decimal(9,2) unsigned DEFAULT NULL COMMENT '退款金额',
  `buyer_note` varchar(255) DEFAULT NULL COMMENT '买家备注',
  `seller_note` varchar(255) DEFAULT NULL COMMENT '卖家备注',
  `kind_count` varchar(255) DEFAULT NULL COMMENT '商品种类',
  `count` int(11) DEFAULT NULL COMMENT '商品总数',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '下单时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '最后编辑时间',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `service_time` int(10) unsigned DEFAULT NULL COMMENT '发货时间服务时间',
  `received_time` int(10) unsigned DEFAULT NULL COMMENT '收货时间 核销时间 确认时间',
  `received_business_id` int(11) unsigned DEFAULT NULL COMMENT '核销商家',
  `received_user_id` int(11) unsigned DEFAULT NULL COMMENT '商家核销用户',
  `order_status` int(11) DEFAULT '1' COMMENT '订单状态',
  `pay_status` int(11) DEFAULT '1' COMMENT '支付状态',
  `service_status` int(11) DEFAULT '1' COMMENT '服务，配送，核销状态',
  `extra_data` text,
  `transfer_count` int(11) unsigned DEFAULT '0' COMMENT '转让次数',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `cust_status` int(11) DEFAULT NULL COMMENT '自定义状态位',
  `cust_status_name` varchar(255) DEFAULT NULL COMMENT '自定义状态名',
  `user_name` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_extra` varchar(1024) DEFAULT NULL,
  `use_info` varchar(1024) DEFAULT NULL COMMENT '核销信息',
  `force_share` varchar(255) DEFAULT '1' COMMENT '1是需要转发 2是已转发 3是无需转发',
  `pay_type` tinyint(3) unsigned DEFAULT '1' COMMENT '支付类型 1微信支付 2后台支付',
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `buyer_id` (`buyer_id`),
  KEY `seller_id` (`seller_id`),
  KEY `order_status` (`order_status`),
  KEY `pay_status` (`pay_status`),
  KEY `servce_status` (`service_status`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单主表';

-- ----------------------------
-- Table structure for yunsite_order_express
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_order_express`;
CREATE TABLE `yunsite_order_express` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL COMMENT '订单id',
  `name` varchar(255) DEFAULT NULL COMMENT '收件人姓名',
  `area_key` varchar(255) DEFAULT NULL COMMENT '地区代码',
  `area_path` varchar(1024) DEFAULT NULL COMMENT '地区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `zipcode` varchar(255) DEFAULT NULL COMMENT '邮编',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机',
  `express_company` varchar(255) DEFAULT NULL COMMENT '物流公司',
  `express_num` varchar(255) DEFAULT NULL COMMENT '物流号',
  `express_time` int(10) unsigned DEFAULT NULL COMMENT '发货时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单配送信息表';

-- ----------------------------
-- Table structure for yunsite_order_feedback
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_order_feedback`;
CREATE TABLE `yunsite_order_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(55) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `order_number` varchar(55) DEFAULT NULL,
  `user_name` varchar(55) DEFAULT NULL,
  `user_phone` varchar(55) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `extra_data` text,
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_order_items
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_order_items`;
CREATE TABLE `yunsite_order_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `goods_id` int(11) unsigned DEFAULT NULL COMMENT '商品id',
  `shop_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '商品标题',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `price` decimal(9,2) unsigned DEFAULT NULL COMMENT '单价',
  `count` int(11) unsigned DEFAULT NULL COMMENT '数量',
  `discount` decimal(9,2) unsigned DEFAULT NULL COMMENT '优惠',
  `total_price` decimal(9,2) unsigned DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `shop_id` (`shop_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单明细表';

-- ----------------------------
-- Table structure for yunsite_order_log
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_order_log`;
CREATE TABLE `yunsite_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status_from` varchar(255) DEFAULT NULL,
  `status_to` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单日志表';

-- ----------------------------
-- Table structure for yunsite_order_transfer
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_order_transfer`;
CREATE TABLE `yunsite_order_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(10) unsigned DEFAULT NULL,
  `to_user_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单转让';

-- ----------------------------
-- Table structure for yunsite_statistics
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_statistics`;
CREATE TABLE `yunsite_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fans_count` int(255) unsigned DEFAULT NULL COMMENT '粉丝数',
  `activity_view` int(255) unsigned DEFAULT NULL COMMENT '活动访问',
  `activity_join` int(255) unsigned DEFAULT NULL COMMENT '活动报名',
  `activity_share` int(255) unsigned DEFAULT NULL COMMENT '活动转发',
  `goods_sell` int(255) unsigned DEFAULT NULL COMMENT '商品销量',
  `site_income` decimal(10,2) DEFAULT NULL COMMENT '商品收入',
  `site_refund` decimal(9,2) DEFAULT NULL COMMENT '退款金额',
  `task_time` int(10) unsigned DEFAULT NULL COMMENT '任务时间',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(255) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `task_time` (`task_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yunsite_user_address
-- ----------------------------
DROP TABLE IF EXISTS `yunsite_user_address`;
CREATE TABLE `yunsite_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `area_key` varchar(255) DEFAULT NULL COMMENT '地区代码',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机',
  `zipcode` varchar(255) DEFAULT NULL COMMENT '邮编',
  `rank` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `area_key` (`area_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户配送地址';
