SET  NAMES utf8 ;
DROP DATABASE IF EXISTS bbms;
CREATE DATABASE bbms charset=utf8;
USE bbms ;
-- 页头
CREATE TABLE starthead(
    photo VARCHAR(128)
);
INSERT INTO starthead  VALUES (
   "http://127.0.0.1:3000/img/topbanner.jpg"
);

-- 用户表
CREATE TABLE user (
    uid int PRIMARY KEY  AUTO_INCREMENT  not null  , 
    uname varchar(48) ,
    upwd  varchar(128),
    pic  varchar(128)   default '/img/1.jpg'
    );
INSERT INTO user VALUES(
1,'1991','123456','/img/1.jpg'
);
-- INSERT INTO user VALUES(
--  NULL,'1998','123456'
-- );
-- INSERT INTO user VALUES(
--  NULL,'2016','123456'
-- );
-- INSERT INTO user VALUES(
--  NULL,'2020','123456'
-- );

-- slideshow 轮播图
CREATE TABLE slideshow (
   
    site  varchar(128)
);
INSERT INTO slideshow VALUES (
   "http://127.0.0.1:3000/img/banner/banner1.jpg"
);
INSERT INTO slideshow VALUES (
    "http://127.0.0.1:3000/img/banner/banner2.jpg"
);
INSERT INTO slideshow VALUES (
   "http://127.0.0.1:3000/img/banner/banner3.jpg"
);

CREATE TABLE bod(
   bid INT AUTO_INCREMENT PRIMARY KEY , 
   photo VARCHAR(128),
   jie VARCHAR(128),
   oldprice  VARCHAR(100),
   newprice VARCHAR(100)
);
INSERT INTO bod VALUES(
   null,"http://127.0.0.1:3000/img/1l/1.jpg","蛋糕",128,108
);
INSERT INTO bod VALUES(
   null,"http://127.0.0.1:3000/img/1l/2.jpg","布朗熊和妮妮兔",228,218
);
INSERT INTO bod VALUES(
   null,"http://127.0.0.1:3000/img/1l/3.jpg","奥利奥小可爱",188,178
);
INSERT INTO bod VALUES(
   null,"http://127.0.0.1:3000/img/1l/4.jpg","布芭比娃娃",218,218
);
INSERT INTO bod VALUES(
   null,"http://127.0.0.1:3000/img/1l/5.jpg","冰雪奇缘",178,178
);
INSERT INTO bod VALUES(
   null,"http://127.0.0.1:3000/img/1l/6.jpg","双倍幸福",238,218
);
INSERT INTO bod VALUES(
   null,"http://127.0.0.1:3000/img/1l/7.jpg","白雪公主",228,218
);
INSERT INTO bod VALUES(
   null,"http://127.0.0.1:3000/img/1l/8.jpg","玫瑰蛋糕",258,270
);


-- 2L

CREATE TABLE twobob(
   bid INT AUTO_INCREMENT PRIMARY KEY , 
   photo VARCHAR(128),
   jie VARCHAR(128),
   oldprice  VARCHAR(100),
   newprice VARCHAR(100)
);
INSERT INTO twobob VALUES(
   null,"http://127.0.0.1:3000/img/2l/1.jpg","幸福万年",128,108
);
INSERT INTO twobob VALUES(
   null,"http://127.0.0.1:3000/img/2l/2.jpg","福寿无边",228,218
);
INSERT INTO twobob VALUES(
   null,"http://127.0.0.1:3000/img/2l/3.jpg","绽放光彩",188,178
);
INSERT INTO twobob VALUES(
   null,"http://127.0.0.1:3000/img/2l/4.jpg","前程似锦",218,218
);
INSERT INTO twobob VALUES(
   null,"http://127.0.0.1:3000/img/2l/5.jpg","步步高升",178,178
);
INSERT INTO twobob VALUES(
   null,"http://127.0.0.1:3000/img/2l/6.jpg","快乐源泉",238,218
);
INSERT INTO twobob VALUES(
   null,"http://127.0.0.1:3000/img/2l/7.jpg","周年庆",228,218
);
INSERT INTO twobob VALUES(
   null,"http://127.0.0.1:3000/img/2l/8.jpg","光辉喜悦",258,270
);

-- 3L 

CREATE TABLE threebob(
   bid INT AUTO_INCREMENT PRIMARY KEY , 
   photo VARCHAR(128),
   jie VARCHAR(128),
   oldprice  VARCHAR(100),
   newprice VARCHAR(100)
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/1.jpg","幸福万年",128,108
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/2.jpg","福寿无边",228,218
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/3.jpg","绽放光彩",188,178
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/4.jpg","前程似锦",218,218
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/5.jpg","步步高升",178,178
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/6.jpg","快乐源泉",238,218
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/7.jpg","周年庆",228,218
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/8.jpg","光辉喜悦",258,270
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/9.jpg","光辉喜悦",258,270
);
INSERT INTO threebob VALUES(
   null,"http://127.0.0.1:3000/img/3l/9.jpg","光辉喜悦",258,270
);


-- 详情 
CREATE TABLE commodity (   
  coid int PRIMARY KEY AUTO_INCREMENT ,  -- 编号  1
  photo varchar(128) ,  -- 商品图片2
  coname varchar(128) ,  -- 商品名字3
  shopp varchar(128) , -- 购物车图标4
  mater varchar(128) , -- 商品材料5
  pack varchar(128) , -- 商品包装6
  wish varchar(128) ,   -- 祝福语7
  presenter varchar(128), -- 赠送8
  distr varchar(128), -- 配送9
  price varchar(128) ,  -- 商品价格10
  sprice varchar(128) , -- 市场价格11
  size varchar(128) , --  尺寸12
  quantity varchar(128) , -- 数量13
  details varchar(128),  -- 商品详情14
  evaluate varchar(128), -- 评价详情15
  p varchar(128),    -- 16
  php varchar(128)  -- 17
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/1.jpg","布朗熊和妮妮兔","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",218,220,"8寸",1,"产品编号：V2182","http://127.0.0.1:3000/img/xiangqing/布朗熊和妮妮兔.jpg","http://127.0.0.1:3000/img/xiangqing/6.jpg","http://127.0.0.1:3000/img/xiangqing/1.jpg"
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/2.jpg","奥利奥小可爱","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",258,270,"8寸",1,"产品编号：V2162","http://127.0.0.1:3000/img/xiangqing/xq1.jpg","http://127.0.0.1:3000/img/xiangqing/2.jpg","http://127.0.0.1:3000/img/xiangqing/7.jpg"
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/3.jpg","芭比娃娃","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",258,270,"8寸",1,"产品编号：V2187","http://127.0.0.1:3000/img/xiangqing/xq2.jpg","http://127.0.0.1:3000/img/xiangqing/3.jpg","http://127.0.0.1:3000/img/xiangqing/7.jpg"
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/4.jpg","冰雪奇缘","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",258,270,"8寸",1,"产品编号：V2982","http://127.0.0.1:3000/img/xiangqing/xq3.jpg","http://127.0.0.1:3000/img/xiangqing/4.jpg","http://127.0.0.1:3000/img/xiangqing/8.jpg"
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/5.jpg","双倍幸福","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",258,270,"8寸",1,"产品编号：V3182","http://127.0.0.1:3000/img/xiangqing/xq4.jpg","http://127.0.0.1:3000/img/xiangqing/2.jpg","http://127.0.0.1:3000/img/xiangqing/5.jpg"
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/6.jpg","白雪公主","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",258,270,"8寸",1,"产品编号：V2982","http://127.0.0.1:3000/img/xiangqing/xq5.jpg","http://127.0.0.1:3000/img/xiangqing/6.jpg","http://127.0.0.1:3000/img/xiangqing/9.jpg"
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/7.jpg","蟠桃祝寿","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",258,270,"8寸",1,"产品编号：V2152","http://127.0.0.1:3000/img/xiangqing/xq6.jpg","http://127.0.0.1:3000/img/xiangqing/7.jpg","http://127.0.0.1:3000/img/xiangqing/4.jpg"
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/8.jpg","仙福永享","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",258,270,"8寸",1,"产品编号：V2012","http://127.0.0.1:3000/img/xiangqing/xq7.jpg","http://127.0.0.1:3000/img/xiangqing/8.jpg","http://127.0.0.1:3000/img/xiangqing/1.jpg"
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/9.jpg","寿与天齐","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",258,270,"8寸",1,"产品编号：V2102","http://127.0.0.1:3000/img/xiangqing/xq8.jpg","http://127.0.0.1:3000/img/xiangqing/9.jpg","http://127.0.0.1:3000/img/xiangqing/6.jpg"
);
INSERT INTO commodity VALUES(
  null,"http://127.0.0.1:3000/img/xiangqing/10.jpg","福如东海","http://127.0.0.1:3000/img/xiangqing/sh.png","布朗熊和妮妮兔插件，奶油" ,"精致蛋糕盒包装，送一次性蛋糕用品一套。","每天早上醒来,看见你和阳光都在,这就是我想要的未来.","免费附送精美贺卡，代写您的祝福。","市区免费送货上门",258,270,"8寸",1,"产品编号：V2111","http://127.0.0.1:3000/img/xiangqing/xq9.jpg","http://127.0.0.1:3000/img/xiangqing/10.jpg","http://127.0.0.1:3000/img/xiangqing/5.jpg"
);
