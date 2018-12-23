/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : jcbc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-11-29 20:14:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `ctcode` varchar(16) NOT NULL,
  `ctname` varchar(64) NOT NULL,
  `pccode` varchar(8) NOT NULL,
  PRIMARY KEY (`ctcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1101', '市辖区', '11');
INSERT INTO `city` VALUES ('1201', '市辖区', '12');
INSERT INTO `city` VALUES ('1301', '石家庄市', '13');
INSERT INTO `city` VALUES ('1302', '唐山市', '13');
INSERT INTO `city` VALUES ('1303', '秦皇岛市', '13');
INSERT INTO `city` VALUES ('1304', '邯郸市', '13');
INSERT INTO `city` VALUES ('1305', '邢台市', '13');
INSERT INTO `city` VALUES ('1306', '保定市', '13');
INSERT INTO `city` VALUES ('1307', '张家口市', '13');
INSERT INTO `city` VALUES ('1308', '承德市', '13');
INSERT INTO `city` VALUES ('1309', '沧州市', '13');
INSERT INTO `city` VALUES ('1310', '廊坊市', '13');
INSERT INTO `city` VALUES ('1311', '衡水市', '13');
INSERT INTO `city` VALUES ('1401', '太原市', '14');
INSERT INTO `city` VALUES ('1402', '大同市', '14');
INSERT INTO `city` VALUES ('1403', '阳泉市', '14');
INSERT INTO `city` VALUES ('1404', '长治市', '14');
INSERT INTO `city` VALUES ('1405', '晋城市', '14');
INSERT INTO `city` VALUES ('1406', '朔州市', '14');
INSERT INTO `city` VALUES ('1407', '晋中市', '14');
INSERT INTO `city` VALUES ('1408', '运城市', '14');
INSERT INTO `city` VALUES ('1409', '忻州市', '14');
INSERT INTO `city` VALUES ('1410', '临汾市', '14');
INSERT INTO `city` VALUES ('1411', '吕梁市', '14');
INSERT INTO `city` VALUES ('1501', '呼和浩特市', '15');
INSERT INTO `city` VALUES ('1502', '包头市', '15');
INSERT INTO `city` VALUES ('1503', '乌海市', '15');
INSERT INTO `city` VALUES ('1504', '赤峰市', '15');
INSERT INTO `city` VALUES ('1505', '通辽市', '15');
INSERT INTO `city` VALUES ('1506', '鄂尔多斯市', '15');
INSERT INTO `city` VALUES ('1507', '呼伦贝尔市', '15');
INSERT INTO `city` VALUES ('1508', '巴彦淖尔市', '15');
INSERT INTO `city` VALUES ('1509', '乌兰察布市', '15');
INSERT INTO `city` VALUES ('1522', '兴安盟', '15');
INSERT INTO `city` VALUES ('1525', '锡林郭勒盟', '15');
INSERT INTO `city` VALUES ('1529', '阿拉善盟', '15');
INSERT INTO `city` VALUES ('2101', '沈阳市', '21');
INSERT INTO `city` VALUES ('2102', '大连市', '21');
INSERT INTO `city` VALUES ('2103', '鞍山市', '21');
INSERT INTO `city` VALUES ('2104', '抚顺市', '21');
INSERT INTO `city` VALUES ('2105', '本溪市', '21');
INSERT INTO `city` VALUES ('2106', '丹东市', '21');
INSERT INTO `city` VALUES ('2107', '锦州市', '21');
INSERT INTO `city` VALUES ('2108', '营口市', '21');
INSERT INTO `city` VALUES ('2109', '阜新市', '21');
INSERT INTO `city` VALUES ('2110', '辽阳市', '21');
INSERT INTO `city` VALUES ('2111', '盘锦市', '21');
INSERT INTO `city` VALUES ('2112', '铁岭市', '21');
INSERT INTO `city` VALUES ('2113', '朝阳市', '21');
INSERT INTO `city` VALUES ('2114', '葫芦岛市', '21');
INSERT INTO `city` VALUES ('2201', '长春市', '22');
INSERT INTO `city` VALUES ('2202', '吉林市', '22');
INSERT INTO `city` VALUES ('2203', '四平市', '22');
INSERT INTO `city` VALUES ('2204', '辽源市', '22');
INSERT INTO `city` VALUES ('2205', '通化市', '22');
INSERT INTO `city` VALUES ('2206', '白山市', '22');
INSERT INTO `city` VALUES ('2207', '松原市', '22');
INSERT INTO `city` VALUES ('2208', '白城市', '22');
INSERT INTO `city` VALUES ('2224', '延边朝鲜族自治州', '22');
INSERT INTO `city` VALUES ('2301', '哈尔滨市', '23');
INSERT INTO `city` VALUES ('2302', '齐齐哈尔市', '23');
INSERT INTO `city` VALUES ('2303', '鸡西市', '23');
INSERT INTO `city` VALUES ('2304', '鹤岗市', '23');
INSERT INTO `city` VALUES ('2305', '双鸭山市', '23');
INSERT INTO `city` VALUES ('2306', '大庆市', '23');
INSERT INTO `city` VALUES ('2307', '伊春市', '23');
INSERT INTO `city` VALUES ('2308', '佳木斯市', '23');
INSERT INTO `city` VALUES ('2309', '七台河市', '23');
INSERT INTO `city` VALUES ('2310', '牡丹江市', '23');
INSERT INTO `city` VALUES ('2311', '黑河市', '23');
INSERT INTO `city` VALUES ('2312', '绥化市', '23');
INSERT INTO `city` VALUES ('2327', '大兴安岭地区', '23');
INSERT INTO `city` VALUES ('3101', '市辖区', '31');
INSERT INTO `city` VALUES ('3201', '南京市', '32');
INSERT INTO `city` VALUES ('3202', '无锡市', '32');
INSERT INTO `city` VALUES ('3203', '徐州市', '32');
INSERT INTO `city` VALUES ('3204', '常州市', '32');
INSERT INTO `city` VALUES ('3205', '苏州市', '32');
INSERT INTO `city` VALUES ('3206', '南通市', '32');
INSERT INTO `city` VALUES ('3207', '连云港市', '32');
INSERT INTO `city` VALUES ('3208', '淮安市', '32');
INSERT INTO `city` VALUES ('3209', '盐城市', '32');
INSERT INTO `city` VALUES ('3210', '扬州市', '32');
INSERT INTO `city` VALUES ('3211', '镇江市', '32');
INSERT INTO `city` VALUES ('3212', '泰州市', '32');
INSERT INTO `city` VALUES ('3213', '宿迁市', '32');
INSERT INTO `city` VALUES ('3301', '杭州市', '33');
INSERT INTO `city` VALUES ('3302', '宁波市', '33');
INSERT INTO `city` VALUES ('3303', '温州市', '33');
INSERT INTO `city` VALUES ('3304', '嘉兴市', '33');
INSERT INTO `city` VALUES ('3305', '湖州市', '33');
INSERT INTO `city` VALUES ('3306', '绍兴市', '33');
INSERT INTO `city` VALUES ('3307', '金华市', '33');
INSERT INTO `city` VALUES ('3308', '衢州市', '33');
INSERT INTO `city` VALUES ('3309', '舟山市', '33');
INSERT INTO `city` VALUES ('3310', '台州市', '33');
INSERT INTO `city` VALUES ('3311', '丽水市', '33');
INSERT INTO `city` VALUES ('3401', '合肥市', '34');
INSERT INTO `city` VALUES ('3402', '芜湖市', '34');
INSERT INTO `city` VALUES ('3403', '蚌埠市', '34');
INSERT INTO `city` VALUES ('3404', '淮南市', '34');
INSERT INTO `city` VALUES ('3405', '马鞍山市', '34');
INSERT INTO `city` VALUES ('3406', '淮北市', '34');
INSERT INTO `city` VALUES ('3407', '铜陵市', '34');
INSERT INTO `city` VALUES ('3408', '安庆市', '34');
INSERT INTO `city` VALUES ('3410', '黄山市', '34');
INSERT INTO `city` VALUES ('3411', '滁州市', '34');
INSERT INTO `city` VALUES ('3412', '阜阳市', '34');
INSERT INTO `city` VALUES ('3413', '宿州市', '34');
INSERT INTO `city` VALUES ('3415', '六安市', '34');
INSERT INTO `city` VALUES ('3416', '亳州市', '34');
INSERT INTO `city` VALUES ('3417', '池州市', '34');
INSERT INTO `city` VALUES ('3418', '宣城市', '34');
INSERT INTO `city` VALUES ('3501', '福州市', '35');
INSERT INTO `city` VALUES ('3502', '厦门市', '35');
INSERT INTO `city` VALUES ('3503', '莆田市', '35');
INSERT INTO `city` VALUES ('3504', '三明市', '35');
INSERT INTO `city` VALUES ('3505', '泉州市', '35');
INSERT INTO `city` VALUES ('3506', '漳州市', '35');
INSERT INTO `city` VALUES ('3507', '南平市', '35');
INSERT INTO `city` VALUES ('3508', '龙岩市', '35');
INSERT INTO `city` VALUES ('3509', '宁德市', '35');
INSERT INTO `city` VALUES ('3601', '南昌市', '36');
INSERT INTO `city` VALUES ('3602', '景德镇市', '36');
INSERT INTO `city` VALUES ('3603', '萍乡市', '36');
INSERT INTO `city` VALUES ('3604', '九江市', '36');
INSERT INTO `city` VALUES ('3605', '新余市', '36');
INSERT INTO `city` VALUES ('3606', '鹰潭市', '36');
INSERT INTO `city` VALUES ('3607', '赣州市', '36');
INSERT INTO `city` VALUES ('3608', '吉安市', '36');
INSERT INTO `city` VALUES ('3609', '宜春市', '36');
INSERT INTO `city` VALUES ('3610', '抚州市', '36');
INSERT INTO `city` VALUES ('3611', '上饶市', '36');
INSERT INTO `city` VALUES ('3701', '济南市', '37');
INSERT INTO `city` VALUES ('3702', '青岛市', '37');
INSERT INTO `city` VALUES ('3703', '淄博市', '37');
INSERT INTO `city` VALUES ('3704', '枣庄市', '37');
INSERT INTO `city` VALUES ('3705', '东营市', '37');
INSERT INTO `city` VALUES ('3706', '烟台市', '37');
INSERT INTO `city` VALUES ('3707', '潍坊市', '37');
INSERT INTO `city` VALUES ('3708', '济宁市', '37');
INSERT INTO `city` VALUES ('3709', '泰安市', '37');
INSERT INTO `city` VALUES ('3710', '威海市', '37');
INSERT INTO `city` VALUES ('3711', '日照市', '37');
INSERT INTO `city` VALUES ('3712', '莱芜市', '37');
INSERT INTO `city` VALUES ('3713', '临沂市', '37');
INSERT INTO `city` VALUES ('3714', '德州市', '37');
INSERT INTO `city` VALUES ('3715', '聊城市', '37');
INSERT INTO `city` VALUES ('3716', '滨州市', '37');
INSERT INTO `city` VALUES ('3717', '菏泽市', '37');
INSERT INTO `city` VALUES ('4101', '郑州市', '41');
INSERT INTO `city` VALUES ('4102', '开封市', '41');
INSERT INTO `city` VALUES ('4103', '洛阳市', '41');
INSERT INTO `city` VALUES ('4104', '平顶山市', '41');
INSERT INTO `city` VALUES ('4105', '安阳市', '41');
INSERT INTO `city` VALUES ('4106', '鹤壁市', '41');
INSERT INTO `city` VALUES ('4107', '新乡市', '41');
INSERT INTO `city` VALUES ('4108', '焦作市', '41');
INSERT INTO `city` VALUES ('4109', '濮阳市', '41');
INSERT INTO `city` VALUES ('4110', '许昌市', '41');
INSERT INTO `city` VALUES ('4111', '漯河市', '41');
INSERT INTO `city` VALUES ('4112', '三门峡市', '41');
INSERT INTO `city` VALUES ('4113', '南阳市', '41');
INSERT INTO `city` VALUES ('4114', '商丘市', '41');
INSERT INTO `city` VALUES ('4115', '信阳市', '41');
INSERT INTO `city` VALUES ('4116', '周口市', '41');
INSERT INTO `city` VALUES ('4117', '驻马店市', '41');
INSERT INTO `city` VALUES ('4190', '省直辖县级行政区划', '41');
INSERT INTO `city` VALUES ('4201', '武汉市', '42');
INSERT INTO `city` VALUES ('4202', '黄石市', '42');
INSERT INTO `city` VALUES ('4203', '十堰市', '42');
INSERT INTO `city` VALUES ('4205', '宜昌市', '42');
INSERT INTO `city` VALUES ('4206', '襄阳市', '42');
INSERT INTO `city` VALUES ('4207', '鄂州市', '42');
INSERT INTO `city` VALUES ('4208', '荆门市', '42');
INSERT INTO `city` VALUES ('4209', '孝感市', '42');
INSERT INTO `city` VALUES ('4210', '荆州市', '42');
INSERT INTO `city` VALUES ('4211', '黄冈市', '42');
INSERT INTO `city` VALUES ('4212', '咸宁市', '42');
INSERT INTO `city` VALUES ('4213', '随州市', '42');
INSERT INTO `city` VALUES ('4228', '恩施土家族苗族自治州', '42');
INSERT INTO `city` VALUES ('4290', '省直辖县级行政区划', '42');
INSERT INTO `city` VALUES ('4301', '长沙市', '43');
INSERT INTO `city` VALUES ('4302', '株洲市', '43');
INSERT INTO `city` VALUES ('4303', '湘潭市', '43');
INSERT INTO `city` VALUES ('4304', '衡阳市', '43');
INSERT INTO `city` VALUES ('4305', '邵阳市', '43');
INSERT INTO `city` VALUES ('4306', '岳阳市', '43');
INSERT INTO `city` VALUES ('4307', '常德市', '43');
INSERT INTO `city` VALUES ('4308', '张家界市', '43');
INSERT INTO `city` VALUES ('4309', '益阳市', '43');
INSERT INTO `city` VALUES ('4310', '郴州市', '43');
INSERT INTO `city` VALUES ('4311', '永州市', '43');
INSERT INTO `city` VALUES ('4312', '怀化市', '43');
INSERT INTO `city` VALUES ('4313', '娄底市', '43');
INSERT INTO `city` VALUES ('4331', '湘西土家族苗族自治州', '43');
INSERT INTO `city` VALUES ('4401', '广州市', '44');
INSERT INTO `city` VALUES ('4402', '韶关市', '44');
INSERT INTO `city` VALUES ('4403', '深圳市', '44');
INSERT INTO `city` VALUES ('4404', '珠海市', '44');
INSERT INTO `city` VALUES ('4405', '汕头市', '44');
INSERT INTO `city` VALUES ('4406', '佛山市', '44');
INSERT INTO `city` VALUES ('4407', '江门市', '44');
INSERT INTO `city` VALUES ('4408', '湛江市', '44');
INSERT INTO `city` VALUES ('4409', '茂名市', '44');
INSERT INTO `city` VALUES ('4412', '肇庆市', '44');
INSERT INTO `city` VALUES ('4413', '惠州市', '44');
INSERT INTO `city` VALUES ('4414', '梅州市', '44');
INSERT INTO `city` VALUES ('4415', '汕尾市', '44');
INSERT INTO `city` VALUES ('4416', '河源市', '44');
INSERT INTO `city` VALUES ('4417', '阳江市', '44');
INSERT INTO `city` VALUES ('4418', '清远市', '44');
INSERT INTO `city` VALUES ('4419', '东莞市', '44');
INSERT INTO `city` VALUES ('4420', '中山市', '44');
INSERT INTO `city` VALUES ('4451', '潮州市', '44');
INSERT INTO `city` VALUES ('4452', '揭阳市', '44');
INSERT INTO `city` VALUES ('4453', '云浮市', '44');
INSERT INTO `city` VALUES ('4501', '南宁市', '45');
INSERT INTO `city` VALUES ('4502', '柳州市', '45');
INSERT INTO `city` VALUES ('4503', '桂林市', '45');
INSERT INTO `city` VALUES ('4504', '梧州市', '45');
INSERT INTO `city` VALUES ('4505', '北海市', '45');
INSERT INTO `city` VALUES ('4506', '防城港市', '45');
INSERT INTO `city` VALUES ('4507', '钦州市', '45');
INSERT INTO `city` VALUES ('4508', '贵港市', '45');
INSERT INTO `city` VALUES ('4509', '玉林市', '45');
INSERT INTO `city` VALUES ('4510', '百色市', '45');
INSERT INTO `city` VALUES ('4511', '贺州市', '45');
INSERT INTO `city` VALUES ('4512', '河池市', '45');
INSERT INTO `city` VALUES ('4513', '来宾市', '45');
INSERT INTO `city` VALUES ('4514', '崇左市', '45');
INSERT INTO `city` VALUES ('4601', '海口市', '46');
INSERT INTO `city` VALUES ('4602', '三亚市', '46');
INSERT INTO `city` VALUES ('4603', '三沙市', '46');
INSERT INTO `city` VALUES ('4604', '儋州市', '46');
INSERT INTO `city` VALUES ('4690', '省直辖县级行政区划', '46');
INSERT INTO `city` VALUES ('5001', '市辖区', '50');
INSERT INTO `city` VALUES ('5002', '县', '50');
INSERT INTO `city` VALUES ('5101', '成都市', '51');
INSERT INTO `city` VALUES ('5103', '自贡市', '51');
INSERT INTO `city` VALUES ('5104', '攀枝花市', '51');
INSERT INTO `city` VALUES ('5105', '泸州市', '51');
INSERT INTO `city` VALUES ('5106', '德阳市', '51');
INSERT INTO `city` VALUES ('5107', '绵阳市', '51');
INSERT INTO `city` VALUES ('5108', '广元市', '51');
INSERT INTO `city` VALUES ('5109', '遂宁市', '51');
INSERT INTO `city` VALUES ('5110', '内江市', '51');
INSERT INTO `city` VALUES ('5111', '乐山市', '51');
INSERT INTO `city` VALUES ('5113', '南充市', '51');
INSERT INTO `city` VALUES ('5114', '眉山市', '51');
INSERT INTO `city` VALUES ('5115', '宜宾市', '51');
INSERT INTO `city` VALUES ('5116', '广安市', '51');
INSERT INTO `city` VALUES ('5117', '达州市', '51');
INSERT INTO `city` VALUES ('5118', '雅安市', '51');
INSERT INTO `city` VALUES ('5119', '巴中市', '51');
INSERT INTO `city` VALUES ('5120', '资阳市', '51');
INSERT INTO `city` VALUES ('5132', '阿坝藏族羌族自治州', '51');
INSERT INTO `city` VALUES ('5133', '甘孜藏族自治州', '51');
INSERT INTO `city` VALUES ('5134', '凉山彝族自治州', '51');
INSERT INTO `city` VALUES ('5201', '贵阳市', '52');
INSERT INTO `city` VALUES ('5202', '六盘水市', '52');
INSERT INTO `city` VALUES ('5203', '遵义市', '52');
INSERT INTO `city` VALUES ('5204', '安顺市', '52');
INSERT INTO `city` VALUES ('5205', '毕节市', '52');
INSERT INTO `city` VALUES ('5206', '铜仁市', '52');
INSERT INTO `city` VALUES ('5223', '黔西南布依族苗族自治州', '52');
INSERT INTO `city` VALUES ('5226', '黔东南苗族侗族自治州', '52');
INSERT INTO `city` VALUES ('5227', '黔南布依族苗族自治州', '52');
INSERT INTO `city` VALUES ('5301', '昆明市', '53');
INSERT INTO `city` VALUES ('5303', '曲靖市', '53');
INSERT INTO `city` VALUES ('5304', '玉溪市', '53');
INSERT INTO `city` VALUES ('5305', '保山市', '53');
INSERT INTO `city` VALUES ('5306', '昭通市', '53');
INSERT INTO `city` VALUES ('5307', '丽江市', '53');
INSERT INTO `city` VALUES ('5308', '普洱市', '53');
INSERT INTO `city` VALUES ('5309', '临沧市', '53');
INSERT INTO `city` VALUES ('5323', '楚雄彝族自治州', '53');
INSERT INTO `city` VALUES ('5325', '红河哈尼族彝族自治州', '53');
INSERT INTO `city` VALUES ('5326', '文山壮族苗族自治州', '53');
INSERT INTO `city` VALUES ('5328', '西双版纳傣族自治州', '53');
INSERT INTO `city` VALUES ('5329', '大理白族自治州', '53');
INSERT INTO `city` VALUES ('5331', '德宏傣族景颇族自治州', '53');
INSERT INTO `city` VALUES ('5333', '怒江傈僳族自治州', '53');
INSERT INTO `city` VALUES ('5334', '迪庆藏族自治州', '53');
INSERT INTO `city` VALUES ('5401', '拉萨市', '54');
INSERT INTO `city` VALUES ('5402', '日喀则市', '54');
INSERT INTO `city` VALUES ('5403', '昌都市', '54');
INSERT INTO `city` VALUES ('5404', '林芝市', '54');
INSERT INTO `city` VALUES ('5405', '山南市', '54');
INSERT INTO `city` VALUES ('5424', '那曲地区', '54');
INSERT INTO `city` VALUES ('5425', '阿里地区', '54');
INSERT INTO `city` VALUES ('6101', '西安市', '61');
INSERT INTO `city` VALUES ('6102', '铜川市', '61');
INSERT INTO `city` VALUES ('6103', '宝鸡市', '61');
INSERT INTO `city` VALUES ('6104', '咸阳市', '61');
INSERT INTO `city` VALUES ('6105', '渭南市', '61');
INSERT INTO `city` VALUES ('6106', '延安市', '61');
INSERT INTO `city` VALUES ('6107', '汉中市', '61');
INSERT INTO `city` VALUES ('6108', '榆林市', '61');
INSERT INTO `city` VALUES ('6109', '安康市', '61');
INSERT INTO `city` VALUES ('6110', '商洛市', '61');
INSERT INTO `city` VALUES ('6201', '兰州市', '62');
INSERT INTO `city` VALUES ('6202', '嘉峪关市', '62');
INSERT INTO `city` VALUES ('6203', '金昌市', '62');
INSERT INTO `city` VALUES ('6204', '白银市', '62');
INSERT INTO `city` VALUES ('6205', '天水市', '62');
INSERT INTO `city` VALUES ('6206', '武威市', '62');
INSERT INTO `city` VALUES ('6207', '张掖市', '62');
INSERT INTO `city` VALUES ('6208', '平凉市', '62');
INSERT INTO `city` VALUES ('6209', '酒泉市', '62');
INSERT INTO `city` VALUES ('6210', '庆阳市', '62');
INSERT INTO `city` VALUES ('6211', '定西市', '62');
INSERT INTO `city` VALUES ('6212', '陇南市', '62');
INSERT INTO `city` VALUES ('6229', '临夏回族自治州', '62');
INSERT INTO `city` VALUES ('6230', '甘南藏族自治州', '62');
INSERT INTO `city` VALUES ('6301', '西宁市', '63');
INSERT INTO `city` VALUES ('6302', '海东市', '63');
INSERT INTO `city` VALUES ('6322', '海北藏族自治州', '63');
INSERT INTO `city` VALUES ('6323', '黄南藏族自治州', '63');
INSERT INTO `city` VALUES ('6325', '海南藏族自治州', '63');
INSERT INTO `city` VALUES ('6326', '果洛藏族自治州', '63');
INSERT INTO `city` VALUES ('6327', '玉树藏族自治州', '63');
INSERT INTO `city` VALUES ('6328', '海西蒙古族藏族自治州', '63');
INSERT INTO `city` VALUES ('6401', '银川市', '64');
INSERT INTO `city` VALUES ('6402', '石嘴山市', '64');
INSERT INTO `city` VALUES ('6403', '吴忠市', '64');
INSERT INTO `city` VALUES ('6404', '固原市', '64');
INSERT INTO `city` VALUES ('6405', '中卫市', '64');
INSERT INTO `city` VALUES ('6501', '乌鲁木齐市', '65');
INSERT INTO `city` VALUES ('6502', '克拉玛依市', '65');
INSERT INTO `city` VALUES ('6504', '吐鲁番市', '65');
INSERT INTO `city` VALUES ('6505', '哈密市', '65');
INSERT INTO `city` VALUES ('6523', '昌吉回族自治州', '65');
INSERT INTO `city` VALUES ('6527', '博尔塔拉蒙古自治州', '65');
INSERT INTO `city` VALUES ('6528', '巴音郭楞蒙古自治州', '65');
INSERT INTO `city` VALUES ('6529', '阿克苏地区', '65');
INSERT INTO `city` VALUES ('6530', '克孜勒苏柯尔克孜自治州', '65');
INSERT INTO `city` VALUES ('6531', '喀什地区', '65');
INSERT INTO `city` VALUES ('6532', '和田地区', '65');
INSERT INTO `city` VALUES ('6540', '伊犁哈萨克自治州', '65');
INSERT INTO `city` VALUES ('6542', '塔城地区', '65');
INSERT INTO `city` VALUES ('6543', '阿勒泰地区', '65');
INSERT INTO `city` VALUES ('6590', '自治区直辖县级行政区划', '65');
