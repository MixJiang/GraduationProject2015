/*
Navicat MySQL Data Transfer

Source Server         : pinewsDB
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : pinews

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-01-14 14:35:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `newsid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `newstitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `newsid` int(11) NOT NULL,
  `newstitle` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL COMMENT '新闻标题',
  `content` text NOT NULL COMMENT '新闻内容',
  `createtime` varchar(14) NOT NULL COMMENT '发布时间,时间戳x1000',
  `author` varchar(32) DEFAULT NULL COMMENT '发布作者',
  `imgUrl` varchar(256) NOT NULL COMMENT '图片url',
  `type` int(3) NOT NULL COMMENT '新闻类别',
  `state` tinyint(3) NOT NULL COMMENT '0待审核,1已发布，2已删除',
  `click` int(11) DEFAULT NULL COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('4', '范冰冰李晨隔空晒美照 一波未平一波又起', '近日，范冰冰与李晨相恋一事被炒得沸沸扬扬。1月12日，李晨通过微博晒帅照并发表感慨，称：“输赢荣辱都是是人生一粟，而我要的结果是勇敢前行，因为这个世界只此一个你。”随后，范冰冰也在微博中晒戴墨镜的美照，墨镜中的人影被猜测是李晨，网友纷纷起哄两人在一起。', '1421198637595', 'admin', 'http://7u2j45.com1.z0.glb.clouddn.com/o_19bj0hgodnsr18cf17tv2k41i5a7.jpg-news', '1', '0', '0');
INSERT INTO `news` VALUES ('5', '武大混血女神靓瞎眼！晒儿时照证其是天然美女', '毕业于武汉大学城市设计学院的台湾姑娘王维琳，最近在网络爆红。拥有四分之一荷兰血统的她，不仅长相清丽脱俗，还能歌善舞，被誉为新一代的武大女神.', '1421198680518', 'admin', 'http://7u2j45.com1.z0.glb.clouddn.com/o_19bj0llfs13do1g3hvp1vvf16hmc.jpg-news', '1', '0', '0');
INSERT INTO `news` VALUES ('6', '金秀贤星途回顾 2014SBS演技大赏或最终花落《来自星星的你》', '金秀贤24岁成为大韩民国代表之星。大众为之疯狂，纷纷预测他的未来。他不仅单纯地获得人气，演技和存在感也受到了肯定，在同辈演员中获得了压倒性的评价。虽然比预期快，但是意料之中的结果。', '1421200789450', 'admin', 'http://7u2j45.com1.z0.glb.clouddn.com/o_19bj2l2q017igen7196f1gcj1kne7.jpg-news', '1', '0', '0');
INSERT INTO `news` VALUES ('7', '微软指责Google提前披露Windows 8.1漏洞不顾用户安全', '微软昨天对 Google 提前公布某 Windows 8.1 安全漏洞细节一事提出公开指责，称 Google 拒绝微软修复漏洞后再披露的请求是将用户置于危险的境地。\n\nGoogle 的漏洞披露是其“Project Zero”安全行动计划的一部分，该计划会给漏洞责任公司 90 天的窗口时间来修复漏洞，但 90 天后就会自动披露漏洞，上面所给出的关键细节足以为黑客所利用。Google 此番公布的漏洞与 Windows 8.1 的登录机制有关，某个登录相关函数不能判断用户是否是管理员，因此黑客把自己在用户计算机的权限升级之后就可以控制该机器。微软在 Google 公布漏洞 2 天后才修复了漏洞。这已经是 Google 第二次提前微软公布漏洞了。当然，这也不算什么提前，因为 Google 给出的窗口时间是固定的。\n\n对此微软安全响应中心在博客上的一篇文章称，对于 Google 来说正确的事情对于用户来说未必总是如此，并敦促 Google 把保护客户作为其共同目标。不过 Google 坚信自己的策略对于用户安全来说是最好的—既给了供应商合理的修复漏洞时间，又给了用户知情权。但微软批评说，研究竞争对手漏洞并限时修复否则就公布漏洞细节让黑客有可乘之机的做法不妥。\n\n微软还在博客中解释了漏洞修复为什么超过了 90 天的时间，其主要原因是需要考虑各种客户环境下修复的影响，不同的漏洞情况是不一样，不存在明确的界定指标。其言下之意是 90 天的一刀切做法不妥。\n\n微软和 Google 之间的争端放大了安全界有关报告和修复安全漏洞最佳实践的分歧，即如何在保护用户和敦促软件供应商加快推出补丁之间做出平衡。', '1421200883612', 'admin', 'http://7u2j45.com1.z0.glb.clouddn.com/o_19bj2oar61hj9qj4hce1l28g407.jpg-news', '2', '0', '0');
INSERT INTO `news` VALUES ('8', '中日同意尽早启动联络机制 专家称意义重大', '【环球时报综合报道】日本防卫相中谷元13日在记者会上透露称，日中两国政府在12日的磋商中就力争启动发生紧急情况时相互联络的“海上联络机制”达成共识。日本新闻网援引消息人士的话说，顺利的话，这一紧急联络机制将在4月启用。上海国际问题研究院亚太研究中心副主任廉德瑰13日对《环球时报》记者说，中日在此次磋商中达成共识意义重大。\n\n　　据日本共同社报道，该联络机制旨在避免日中钓鱼岛局势等发生不测事态。此前把“海上”设想为海空域的事态，但为明确具体磋商的对象，今后将使用“海空联络机制”这一名称。日本防务省的消息说，双方就用事先设定的无线电频率取得联络的方式，在防务省和中国军方高层之间设置热线进行了有关技术方面的协商，并达成一定共识。BBC报道称，双方国防部门原则上同意建立热线，并让在有争议岛屿附近的舰船和飞机使用共同的无线电频率。\n\n　　共同社报道说，双方原本计划从已达成共识的事项开始先行启动，但此次在敲定细节后再展开全面运用一事上也达成一致。磋商中，围绕钓鱼岛问题和去年接连发生的中国军机“异常接近”自卫队飞机等情况并未成为讨论对象。\n\n　　“迈出很大的一步”，中谷元这样评论磋商成果。日本NHK电视台援引他的话说，日中在东海等周边海域和领空发生紧急情况的危险性非常高，期待紧急联络机制能摘掉两国“不互信之芽”。中国国防部13日称，中日两国防务部门一致同意，在此轮磋商基础上进行必要调整后，争取早日启动该机制。\n\n　　日本首相安倍晋三13日在官邸会见中谷元，要求防务省继续和中国协商，争取尽早启动紧急联络机制。据《日本经济新闻》报道，日本方面打算先通过“课长级”协商形成一个大框架，在此之上再将协商会议升级到局长级，并签署共同文件，以正式启用。NHK电视台称，日方希望今后进一步协商日中设立专用热线，如果顺利的话，最快在今年夏季，最晚争取在今年内正式使用。', '1421200950686', 'admin', 'http://7u2j45.com1.z0.glb.clouddn.com/o_19bj2quf9or1v6hacicc115mtc.jpg-news', '3', '0', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT 'http://tp2.sinaimg.cn/2625394005/50/40062973916/1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', 'm', '13026310448', '0', 'http://tp2.sinaimg.cn/2625394005/50/40062973916/1');
INSERT INTO `user` VALUES ('2', 'test2', '2222', 'm', '8888888', '10', 'http://7u2j45.com1.z0.glb.clouddn.com/o_19bhl8rdm3qk1km61vto1cbq1p65c.jpg-head100');
INSERT INTO `user` VALUES ('3', '1833559609@qq.com', '123456', null, null, '10', 'http://tp2.sinaimg.cn/2625394005/50/40062973916/1');
INSERT INTO `user` VALUES ('4', 'test3', '111111', null, null, '10', 'http://tp2.sinaimg.cn/2625394005/50/40062973916/1');
INSERT INTO `user` VALUES ('5', 'test4', '2222', null, null, '10', 'http://tp2.sinaimg.cn/2625394005/50/40062973916/1');
INSERT INTO `user` VALUES ('6', 'test5', '123456', null, null, '10', 'http://tp2.sinaimg.cn/2625394005/50/40062973916/1');
