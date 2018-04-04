-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE IF NOT EXISTS seckill;

-- 使用数据库
use seckill;

-- 创建秒杀库存表
CREATE TABLE IF NOT EXISTS seckill(
  `seckill_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  `name` VARCHAR(120) NOT NULL COMMENT '商品名称',
  `number` INT NOT NULL COMMENT '库存-int最大为21',
  `start_time` TIMESTAMP NOT NULL COMMENT '秒杀开启时间',
  `end_time` TIMESTAMP NOT NULL COMMENT '秒杀结束时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  PRIMARY KEY (seckill_id),
  KEY idx_start_time(start_time),
  KEY idx_end_time(end_time),
  KEY idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET = UTF8 COMMENT = '秒杀库存表';

-- 初始化数据
INSERT INTO seckill(name, number, start_time, end_time)
    VALUES
      ('1000元秒杀iPhoneX', 100, '2018-3-20 00:00:00', '2018-3-21 00:00:00'),
      ('2000元秒杀iPadX', 200, '2018-3-20 00:00:00', '2018-3-21 00:00:00'),
      ('3000元秒杀iPhoneX', 300, '2018-3-20 00:00:00', '2018-3-21 00:00:00'),
      ('4000元秒杀小米笔记本', 400, '2018-3-20 00:00:00', '2018-3-21 00:00:00'),
      ('5000元秒杀mac', 500, '2018-3-20 00:00:00', '2018-3-21 00:00:00');

-- 秒杀成功明细表
-- 用户登录认证相关信息
CREATE TABLE IF NOT EXISTS success_killed (
  `seckill_id` BIGINT NOT NULL COMMENT '秒杀商品id',
  `user_phone` BIGINT NOT NULL COMMENT '用户手机号',
  `state` TINYINT NOT NULL DEFAULT -1 COMMENT '状态标识：-1为无效 0为成功 1为已付款 2为已收货',
  `create_time` TIMESTAMP NOT NULL COMMENT '创建时间',
  PRIMARY KEY (seckill_id, user_phone), /*联合主键*/
  KEY idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET = UTF8 COMMENT = '秒杀成功明细表';

-- 连接数据库控制台
-- mysql -uroot -proot

-- 手写DDL
-- 记录每次上线的DDL修改
-- 上线V1.1