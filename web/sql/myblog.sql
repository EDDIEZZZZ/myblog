/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-07-07 23:10:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(45) DEFAULT NULL,
  `a_pass` varchar(45) DEFAULT NULL,
  `a_nickname` varchar(45) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_used` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('1', '1', '1', 'EDDIE', '2019-07-07 22:04:21', '1');
INSERT INTO `adminuser` VALUES ('2', '2', '2', '刘永健', '2019-07-07 22:04:21', '1');
INSERT INTO `adminuser` VALUES ('3', '3', '3', '林志浩', '2019-07-07 22:04:21', '1');
INSERT INTO `adminuser` VALUES ('4', '4', '4', '谢琦辉', '2019-07-07 22:04:21', '1');

-- ----------------------------
-- Table structure for albums
-- ----------------------------
DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
  `al_id` int(11) NOT NULL AUTO_INCREMENT,
  `al_name` varchar(255) DEFAULT NULL,
  `al_author` int(11) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_used` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`al_id`),
  KEY `al_author` (`al_author`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`al_author`) REFERENCES `adminuser` (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of albums
-- ----------------------------
INSERT INTO `albums` VALUES ('23', 'aa', '1', '2019-07-07 22:36:31', '1');
INSERT INTO `albums` VALUES ('24', 'bb', '1', '2019-07-07 22:34:19', '1');
INSERT INTO `albums` VALUES ('25', 'cc', '1', '2019-07-07 22:34:27', '1');
INSERT INTO `albums` VALUES ('26', 'dd', '1', '2019-07-07 22:34:33', '1');
INSERT INTO `albums` VALUES ('27', 'ee', '1', '2019-07-07 22:34:38', '1');
INSERT INTO `albums` VALUES ('28', 'ff', '1', '2019-07-07 22:34:44', '1');
INSERT INTO `albums` VALUES ('29', 'gg', '1', '2019-07-07 22:34:50', '1');
INSERT INTO `albums` VALUES ('30', 'hh', '1', '2019-07-07 22:34:54', '1');
INSERT INTO `albums` VALUES ('31', 'ii', '1', '2019-07-07 22:34:59', '1');
INSERT INTO `albums` VALUES ('32', 'jj', '1', '2019-07-07 22:35:04', '1');
INSERT INTO `albums` VALUES ('33', 'kk', '1', '2019-07-07 22:35:08', '1');

-- ----------------------------
-- Table structure for dianzan
-- ----------------------------
DROP TABLE IF EXISTS `dianzan`;
CREATE TABLE `dianzan` (
  `dz_id` int(11) NOT NULL AUTO_INCREMENT,
  `dz_user` int(11) DEFAULT NULL,
  `dz_albums` int(11) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_used` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dz_id`),
  KEY `dz_user` (`dz_user`),
  KEY `dianzan_ibfk_2_idx` (`dz_albums`),
  CONSTRAINT `dianzan_ibfk_1` FOREIGN KEY (`dz_user`) REFERENCES `user` (`u_id`),
  CONSTRAINT `dianzan_ibfk_2` FOREIGN KEY (`dz_albums`) REFERENCES `albums` (`al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dianzan
-- ----------------------------
INSERT INTO `dianzan` VALUES ('1', '10', '23', '2019-07-07 22:37:24', '0');

-- ----------------------------
-- Table structure for dongtai
-- ----------------------------
DROP TABLE IF EXISTS `dongtai`;
CREATE TABLE `dongtai` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_title` varchar(255) DEFAULT NULL,
  `d_content` text,
  `d_author` int(11) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_used` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`d_id`),
  KEY `d_author` (`d_author`),
  CONSTRAINT `dongtai_ibfk_1` FOREIGN KEY (`d_author`) REFERENCES `adminuser` (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dongtai
-- ----------------------------
INSERT INTO `dongtai` VALUES ('24', '5G时代到来，未来将呈现怎样的产业格局？', '<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    5G，无疑是当下最热的话题。它不仅是一场技术革命，也是关联众多领域的产业革命。今年6月随着工信部正式发放5G商用牌照，宣告我国将正式进入5G商用元年。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    作为信息基础设施的核心引领技术，5G是推动产业转型升级和经济社会发展的新引擎。5G所带动的在线医疗、远程教育、智慧城市、自动驾驶等领域，既蕴含着千亿乃至万亿的蓝海市场机遇，也蕴含了为所有人提供福祉的公共服务意义.\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '1', '2019-07-07 22:19:42', '1');
INSERT INTO `dongtai` VALUES ('25', '篮网宣布正式签约欧文 携手小乔丹等待杜兰特回归', '<p>\r\n    腾讯体育7月7日讯 据篮网官网报道，他们已经正式签下自由球员凯里-欧文，根据球队的政策，合同的细节没有被公布。\r\n\r\n据媒体之前的报道，欧文会获得一份4年1.41亿美元的顶薪合同，其中第4年为球员选项，不过为了让球队签下小乔丹，欧文会以低于顶薪的合同和篮网签约。\r\n\r\n“凯里是联盟精英级别的控卫，”篮网总经理肖恩-马克斯说，“他已经在最高级别的比赛中证明了自己，他拥有冠军血统，有着出色的组织能力和超强的得分能力，他将成为球队的杰出成员。我们非常高兴，欢迎凯里和他的家人来到布鲁克林。”\r\n\r\n“整个教练团队都很高兴有机会执教凯里这样的球员，”篮网主教练肯尼-阿特金森说，“他是一名极具天赋的控卫，我们很期待他和其他新加入的球员加入到我们的核心阵容。”\r\n\r\n欧文在骑士打了6个赛季，他在2017年夏天主动申请交易，最终被骑士送到了凯尔特人，在绿衫军度过了两个赛季。在刚刚过去的这个赛季，欧文出战67场，场均得到23.8分5篮板6.9助攻1.5抢断，投篮命中率为48.7%，三分命中率为40.1%。\r\n\r\n在季后赛，欧文场均拿到21.3分4.4篮板7助攻，带领绿衫军首轮横扫缺少奥拉迪波的步行者，不过他们在半决赛对阵雄鹿的系列赛毫无还手之力，在先赢一场的情况下连输四场，欧文未能带队杀入东决。\r\n\r\n2018-19赛季对于凯尔特人和欧文来说都不顺利，凯尔特人表现挣扎，欧文受到了不少质疑，还有他和队友的关系不佳，这也让欧文考虑离开球队。最终欧文选择加盟篮网，联手杜兰特和小乔丹冲击总冠军。\r\n</p>', '1', '2019-07-07 22:22:56', '1');
INSERT INTO `dongtai` VALUES ('26', '任正非：即使将来我们领先世界，也不能欺负别人', '<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    任正非在与法务部、董秘及无线员工座谈会上的讲话——来源：心声社区\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    划重点\r\n</p>\r\n<ul class=\"article-points\" style=\"margin: 0px 0px 2em; padding: 1em; background: rgb(250, 250, 250); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    <li style=\"margin: 0px; padding: 0px; list-style: none;\">\r\n        <em style=\"display: inline-block; width: 18px; height: 22px; background: rgb(0, 163, 255); color: rgb(255, 255, 255); text-align: center; margin-right: 10px; font-size: 14px;\">1</em>即使将来我们领先世界，也不能欺负别人，保障公司踏踏实实前进就行了。我们不是去积极进攻，而是和友商达成适当的平衡性解决问题。\r\n    </li>\r\n    <li style=\"margin: 0px; padding: 0px; list-style: none;\">\r\n        <em style=\"display: inline-block; width: 18px; height: 22px; background: rgb(0, 163, 255); color: rgb(255, 255, 255); text-align: center; margin-right: 10px; font-size: 14px;\">2</em>在专利申请上，我们不要片面去追求数量世界第一，要多申请高端专利。低端专利是防止黑客产生，有些边缘无用的专利就没有意义去申请了。\r\n    </li>\r\n    <li style=\"margin: 0px; padding: 0px; list-style: none;\">\r\n        <em style=\"display: inline-block; width: 18px; height: 22px; background: rgb(0, 163, 255); color: rgb(255, 255, 255); text-align: center; margin-right: 10px; font-size: 14px;\">3</em>公司首先要实现账实相符，业务人员和财务人员共同来解决不做假账的问题，法务人员更是当之有责。\r\n    </li>\r\n    <li style=\"margin: 0px; padding: 0px; list-style: none;\">\r\n        <em style=\"display: inline-block; width: 18px; height: 22px; background: rgb(0, 163, 255); color: rgb(255, 255, 255); text-align: center; margin-right: 10px; font-size: 14px;\">4</em>公司正在进行薪酬结构改革，法务人员的薪酬标准不再对标工程师，而是对标法律业界\r\n    </li>\r\n</ul>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    <span style=\"font-weight: bolder;\">以下为任正非讲话全文：</span>\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    首先，公司这二十多年来没有出现大问题，说明公司在管理和治理中、在法律遵从上做了相当多的工作，这就是防火。法务部在公司运作血脉中发挥了巨大作用，作出的伟大贡献值得肯定。不仅是在座各位，包括没到会场的其他相关人员都作出了贡献，这点我们要肯定和表彰。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    知识产权部一个员工最近写了一篇文章《华为：一年交3亿美元专利费划算》，我是在网上搜索到的，作为今年总裁办电邮2号签发了。徐直军说，基层员工没有接触过我们，写出的文章居然跟我们的想法一模一样，太有价值了，我们很高兴。可能由于这个起因，我们想跟法务部座谈一下，然后把董秘、无线也拽上了，让他们也光荣一把。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    <span style=\"font-weight: bolder;\">一、华为与友商共同建设未来人类社会、分享利益，法务要学会妥协、灰度</span>\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    未来二三十年，人类社会将经历重大转折，从几千年的传统社会转变到信息社会。信息社会是什么样子，我们不知道；信息社会的实现形式是什么，我们也不知道。但是过去二十多年，我们十五万员工团结一心、拼命划“桨”，终于把我们的“航母”划到了起跑线上。而且在这条信息社会基础的大数据流量起跑线上的“航母”，也就这么几艘。所以现在最根本的问题是我们要共同担负起构建未来信息社会的责任，而不是互相恶性竞争。网络技术包括两种，一种是信息的传送与存储，一种是搜索。我们今天还会停留在信息的传输和储存领域上，那么我们的思想、理论、网络架构是什么，能给世界输出什么？我们要从这个角度去看待创新和知识产权。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '1', '2019-07-07 22:26:40', '1');
INSERT INTO `dongtai` VALUES ('27', '中科院院士：中国将于2020年首探火星 探测生命信息', '<p>\r\n    <br/>\r\n</p>\r\n<div class=\"introduction\" style=\"color: rgb(85, 85, 85); line-height: 2.2; margin-bottom: 2em; word-break: break-all; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    中国科学院院士欧阳自远介绍：“此次中国探测火星，将有一个火星的卫星绕着火星飞，还有一个火星的着陆器，以及一个火星车。这三件东西实现天地联合探测火星，火星车已经做好了。”\r\n</div>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    原标题：中科院院士：中国将于2020年首探火星，探测生命信息、探讨移民前景\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    21世纪经济报道 21财经APP 夏旭田,缴翼飞 日照报道\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    7月5日-7日，2019软件定义卫星高峰论坛在山东日照召开。在论坛现场，21世纪经济报道从中国科学院院士欧阳自远处获悉，中国将于2020年探测火星，通过火星卫星、火星着陆器、火星车天地联合探测火星，目前火星车已经做好。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    火星探测的首要科学问题是在探测火星上的生命活动信息，期待在此领域有所突破；其次是火星磁层、电离层与大气层的探测与环境科学等本体科学研究；其三是探讨火星的长期改造与今后建立人类第二个栖息地的前景。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    <span style=\"font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">论坛上，欧阳自远介绍，中国明年将要探测火星，人类探测火星已有45次，但成功的只有18次，成功率只有40%。</span>\r\n</p>', '1', '2019-07-07 22:27:32', '1');
INSERT INTO `dongtai` VALUES ('28', '违规收集个人信息，网贷APP屡遭监管“点名”', '<p>\r\n    <br/>\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    网贷APP又被点名！\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    7月1日，工信部官网发布了2019年第一季度电信服务质量的通告，暴风金融、水象分期、融360、51人品贷等网贷APP因存在未公示用户个人信息收集使用规则、误导用户同意收集使用个人信息、未提供账号注销服务等问题，被工信部责令整改。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    为何网贷APP违规收集个人信息的情况屡禁不止，开鑫贷总经理鲍建富对《国际金融报》记者表示，金融借贷APP过度收集用户信息的行为，一方面是因为用户信息是不少平台客户运营的依据，更多的用户信息便于平台建立更全面的用户画像，做出更精准的营销，所以平台可能会多收集信息，容易出现过度收集的情况。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    <span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">“另一方面，也有平台会把出售用户信息作为非法获利的手段，尤其在法律对过度收集个人信息惩戒尚不健全的前提下，这些平台很难放弃这些灰色收益。”</span>鲍建富指出。\r\n</p>', '1', '2019-07-07 22:28:24', '1');
INSERT INTO `dongtai` VALUES ('29', '机器人4.0时代来临！四大核心技术助推大规模商用部署', '<p>\r\n    <br/>\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    机器人 1.0（1960-2000）， 机器人对外界环境没有感知，只能单纯复现人类的示教动作，在制造业领域替代工人进行机械性的重复体力劳动。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    机器人2.0（2000-2015）， 通过传感器和数字技术的应用构建起机器人的感觉能力，并模拟部分人类功能，不但促进了机器人在工业领域的成熟应用，也逐步开始向商业领域拓展应用。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    机器人 3.0（2015-），伴随着感知、计算、控制等技术的迭代升级和图像识别、自然语音处理、深度认知学习等新型数字技术在机器人领域的深入应用， 机器人领域的服务化趋势日益明显，逐渐渗透到社会生产生活的每一个角落。在机器人 2.0 的基础上，机器人 3.0 实现从感知到认知、推理、决策的智能化进阶。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    2、 应用领域分析\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    当前，全球机器人市场规模持续扩大，工业机器人市场增速稳定，服务机器人增速突出。2018 年，全球机器人市场规模达 298.2 亿美元， 2013-2018 年的平均增长率约为 15.1%。 在装备制造领域，机械臂凭借强大的负重能力和精准的抓取操作代替着工人的双手；在物流领域，智能仓储机器人和无人搬运车不断提高着运输效率；在生活服务领域，家用清洁机器人和服务机器人正成为许多家庭的私人保姆和小秘书。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    <span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">工业制造领域分析。</span>目前，工业机器人在汽车、金属制品、电子、橡胶及塑料等行业已经得到了广泛的应用。随着性能的不断提升，以及各种应用场景的不断清晰， 2013 年以来，工业机器人的市场规模正以年均 12.1%的速度快速增长，预计到 2020 年将达到 230 亿美元的销售额。 随着人力成本的上升， 工业制造领域的应用前景良好，将会保持快速增长的势头。同时，工业机器人需要拥有更高的灵活性、更强的自主避障和快速配置的能力，提高整体产品的易用性和稳定性。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    <span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">消费服务领域分析。</span>服务机器人虽然整体销售额低于工业机器人，但近几年一直维持着较高的年增长率，商用服务机器人在商场、银行、酒店、机场等应用场景有了更多的落地部署，主要提供导览、问询、送物等基础服务。同时，家用服务机器人悄然进入千家万户，扫地机器人销量在家用服务机器人销量中占主要份额，成为目前家务机器人中的主导品类。 由于本体能力不足， 隐私、安全方面的问题， 家庭管家机器人和陪伴型机器人的市场渗透率较低。 2013 年以来全球服务机器人市场规模年均增速达 23.5%，预计 2020 年将快速增长至 156.9 亿美元。\r\n</p>\r\n<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">\r\n    从整个技术发展和市场环境看，机器人产业拥有以下发展推力：1、<span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">成熟的生态系统；2、老龄化人口趋势和新兴市场；3、更多智能产品互联和智能家庭建设；4、人工智能、自然语言理解能力的增强 。</span>\r\n</p>', '1', '2019-07-07 22:29:16', '1');
INSERT INTO `dongtai` VALUES ('30', '驻英大使刘晓明：中国没兴趣打外交战，是英方阻碍香港司法程序', '<ul class=\"author fix list-paddingleft-2\" style=\"margin: 0px; padding: 0px; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal; list-style: none !important;\">\r\n    <li style=\"margin: 0px; padding: 0px;\">\r\n        <p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; font-size: 16px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal;\">\r\n            【编译/观察者网郭涵】<br/>\r\n        </p>\r\n    </li>\r\n</ul>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    本周日（7月7日），中国驻英国大使刘晓明在出席英国广播公司（BBC）电视台节目时表示，中国并无兴趣与英国展开“外交战争”，但英方却试图干涉中国内政，阻碍香港的司法程序。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    他强调，香港特区政府推进《逃犯条例》并未收到来自中央政府的指令，中方不接受英国政客“带有冷战思维”的涉港言论。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    被问到是否会直接介入香港问题时，刘晓明说，中国政府致力于“一国两制”的方针，充分信任特区政府应对当前局势的能力。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    刘晓明还提到华为公司“是一家优秀的公司、5G技术的领导者”，若英国政府拒绝华为，将错失“巨大的机遇”。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    刘晓明周日参加BBC电视台节目\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    <strong>英外相发表涉港不当言论，中方严正警告</strong>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    7月1日晚，一批极端激进分子暴力冲击香港立法会大楼、对立法会设施造成严重破坏，预计维修费用高达6000万港币（约合人民币5298万元）。香港警方4日以涉嫌“藏有攻击性武器”、“非法集会”与“袭警”等罪名拘捕13人，并将继续收集证据缉捕。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    2日，英国外交大臣杰里米·亨特（Jeremy Hunt）竟对香港事务妄加评论，声称英国支持香港居民“捍卫英方为其争取来的自由”，《中英联合声明》仍具有法律约束力，若得不到履行将会有“严重后果”。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    7月3日当天，中国外交部发言人、驻英大使馆及驻港公署负责人同时表态，严正警告英国“不得插手中国内政”。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">\r\n    刘晓明大使在当天的中外记者会上强调，在香港这样一个大是大非的问题上，英国政府选择“站在错误一边”。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '1', '2019-07-07 22:30:24', '1');
INSERT INTO `dongtai` VALUES ('31', '哈哈哈哈', '<p>\r\n    <br/>\r\n</p>\r\n<p>\r\n    哈哈哈哈\r\n</p>\r\n<p>\r\n    哈哈哈哈\r\n</p>\r\n<p>\r\n    哈哈哈哈哈哈哈哈\r\n</p>\r\n<p>\r\n    哈哈哈哈\r\n</p>\r\n<p>\r\n    哈哈哈哈\r\n</p>\r\n<p>\r\n    哈哈哈哈\r\n</p>\r\n<p>\r\n    哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈\r\n</p>\r\n<p>\r\n    哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈\r\n</p>', '1', '2019-07-07 22:32:18', '1');
INSERT INTO `dongtai` VALUES ('32', '两件西周时期青铜器、国家一级文物从境外追回', '<p>\r\n    <span style=\"color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 28px; white-space: normal;\">山西省警方分别于5月13日、7月1日从境外成功追回几年前被盗墓犯罪集团盗掘贩卖的西周时期青铜重器、国家一级文物“义尊”“义方彝”。据介绍，“义方彝”和“义尊”同为一个墓坑被盗。后被文物贩子转手多个省市，并最终流落境外。图为义尊。</span>\r\n</p>\r\n<p>\r\n    <span style=\"color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 28px; white-space: normal;\"><br/></span>\r\n</p>\r\n<p>\r\n    <span style=\"color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 28px; white-space: normal;\"><span style=\"color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 28px; white-space: normal;\">义尊，为国家一级文物。敞口，方唇，扉棱发达、器体厚重，圈足下接高台，内铸23字铭文。专家解读，“义尊”铭文中显示武王赏赐“义”三十朋贝。很明显，“义”是武王身边近臣，赏赐贝币高达三十朋，非常少见。图为义尊铭文。</span></span>\r\n</p>\r\n<p>\r\n    <span style=\"color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 28px; white-space: normal;\"><span style=\"color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 28px; white-space: normal;\"><br/></span></span>\r\n</p>\r\n<p>\r\n    <span style=\"color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 28px; white-space: normal;\"><span style=\"color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 28px; white-space: normal;\"><span style=\"color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 28px; white-space: normal;\">义方彝，器身为长方体，身部微鼓，颈部和圈足饰夔纹。主体纹饰为带双层卷角的兽面纹；器盖为四阿形，四面主体纹饰均为大兽面纹。器身和器盖的四隅及正中，均带有长钩状扉棱。图为义方彝。</span></span></span>\r\n</p>', '1', '2019-07-07 22:33:41', '1');

-- ----------------------------
-- Table structure for medias
-- ----------------------------
DROP TABLE IF EXISTS `medias`;
CREATE TABLE `medias` (
  `me_id` int(11) NOT NULL AUTO_INCREMENT,
  `me_name` varchar(45) DEFAULT NULL,
  `me_author` int(11) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `is_used` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`me_id`),
  KEY `media_ibfk_1_idx` (`me_author`),
  CONSTRAINT `medias_ibfk_1` FOREIGN KEY (`me_author`) REFERENCES `adminuser` (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medias
-- ----------------------------
INSERT INTO `medias` VALUES ('1', '熊', '1', null, '1');
INSERT INTO `medias` VALUES ('2', 'qqqqq', '1', null, '1');
INSERT INTO `medias` VALUES ('3', 'aaaaa', '1', null, '1');
INSERT INTO `medias` VALUES ('4', 'bbbbbb', '1', null, '1');
INSERT INTO `medias` VALUES ('5', '哇哇哇哇哇', '1', null, '1');
INSERT INTO `medias` VALUES ('6', '水水水水水水水水', '1', null, '1');
INSERT INTO `medias` VALUES ('7', '顶顶顶顶顶顶顶', '1', null, '1');
INSERT INTO `medias` VALUES ('8', '嘎嘎嘎嘎嘎嘎嘎', '1', null, '1');
INSERT INTO `medias` VALUES ('9', '呱呱呱呱呱呱呱呱呱', '1', null, '1');

-- ----------------------------
-- Table structure for photos
-- ----------------------------
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_title` varchar(255) DEFAULT NULL,
  `p_url` varchar(255) DEFAULT NULL,
  `p_album` int(11) DEFAULT NULL,
  `p_author` int(11) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_used` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`p_id`),
  KEY `p_author` (`p_author`),
  KEY `p_album` (`p_album`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`p_author`) REFERENCES `adminuser` (`a_id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`p_album`) REFERENCES `albums` (`al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photos
-- ----------------------------
INSERT INTO `photos` VALUES ('12', '1', 'upload/56ac9f91-d014-4fa9-add6-7db9ce9dc3b5.jpg', '23', '1', '2019-07-07 22:36:04', '1');
INSERT INTO `photos` VALUES ('13', '5', 'upload/53984521-fbfc-4a32-9580-f3f2af5539af.jpg', '23', '1', '2019-07-07 22:36:04', '1');
INSERT INTO `photos` VALUES ('14', '12', 'upload/d8711490-9d16-40b4-8f8a-92556fff8efb.jpg', '23', '1', '2019-07-07 22:36:04', '1');
INSERT INTO `photos` VALUES ('15', '三体智子', 'upload/a8975921-a0c0-4ae5-a0de-843d29168a2a.jpg', '23', '1', '2019-07-07 22:36:04', '1');

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_content` varchar(255) DEFAULT NULL,
  `pl_author` int(11) DEFAULT NULL,
  `pl_dongtai` int(11) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_used` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pl_id`),
  KEY `pl_author` (`pl_author`),
  KEY `pl_dongtai` (`pl_dongtai`),
  CONSTRAINT `pinglun_ibfk_1` FOREIGN KEY (`pl_author`) REFERENCES `user` (`u_id`),
  CONSTRAINT `pinglun_ibfk_2` FOREIGN KEY (`pl_dongtai`) REFERENCES `dongtai` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pinglun
-- ----------------------------

-- ----------------------------
-- Table structure for sixin
-- ----------------------------
DROP TABLE IF EXISTS `sixin`;
CREATE TABLE `sixin` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信id',
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `a_id` int(11) DEFAULT NULL COMMENT '管理员id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '聊天内容',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '聊天时间',
  `is_new_a` tinyint(4) DEFAULT '1',
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复',
  `is_new_u` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `1_idx` (`a_id`),
  KEY `2_idx` (`u_id`),
  CONSTRAINT `1` FOREIGN KEY (`a_id`) REFERENCES `adminuser` (`a_id`),
  CONSTRAINT `2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sixin
-- ----------------------------
INSERT INTO `sixin` VALUES ('1', '10', '1', '嘻嘻嘻嘻嘻嘻', null, '0', '哈哈哈哈哈哈哈', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) DEFAULT NULL,
  `u_pass` varchar(255) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_used` tinyint(1) NOT NULL DEFAULT '1',
  `u_question` varchar(45) DEFAULT NULL,
  `u_answer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10', '1111', 'a123456', '2019-07-07 22:08:41', '1', 'wenti1', '12');
INSERT INTO `user` VALUES ('11', '2222', 'a123456', '2019-07-07 22:50:51', '1', 'wenti1', '1');

-- ----------------------------
-- Table structure for userlog
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_user` int(11) DEFAULT NULL,
  `l_logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `l_ipaddr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`l_id`),
  KEY `l_user` (`l_user`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`l_user`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('62', '10', '2019-07-07 22:08:51', '0:0:0:0:0:0:0:1');
INSERT INTO `userlog` VALUES ('63', '10', '2019-07-07 22:37:12', '0:0:0:0:0:0:0:1');
INSERT INTO `userlog` VALUES ('64', '11', '2019-07-07 22:51:00', '0:0:0:0:0:0:0:1');
INSERT INTO `userlog` VALUES ('65', '11', '2019-07-07 23:05:44', '0:0:0:0:0:0:0:1');
INSERT INTO `userlog` VALUES ('66', '11', '2019-07-07 23:05:46', '0:0:0:0:0:0:0:1');
INSERT INTO `userlog` VALUES ('67', '11', '2019-07-07 23:06:19', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_title` varchar(255) DEFAULT NULL,
  `v_url` varchar(255) DEFAULT NULL,
  `v_media` int(11) DEFAULT NULL,
  `v_author` int(11) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `is_used` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`v_id`),
  KEY `videos_ibfk_1_idx` (`v_author`),
  KEY `videos_ibfk_2_idx` (`v_media`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`v_author`) REFERENCES `adminuser` (`a_id`),
  CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`v_media`) REFERENCES `medias` (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('1', 'mov_bbb', 'vediosupload/cfaf95e5-d7ff-4957-91e6-fbe4d1328ef8.mp4', '1', '1', null, '1');
INSERT INTO `videos` VALUES ('2', 'mov_bbb', 'vediosupload/ac950058-a596-41d1-b12c-d83361cf047f.mp4', '5', '1', null, '1');
