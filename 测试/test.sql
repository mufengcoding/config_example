--创建maizi数据库
CREATE DATABASE IF NOT EXISTS maizi DEFAULT CHARACTER SET 'UTF8';

USE maizi;

-- 创建学员表（user）
-- 编号 id
-- 用户名 username
-- 年龄 age
-- 性别 sex
-- 邮箱 e-mail
-- 地址 addr
-- 生日 birth
-- 薪水 salary
-- 电话 tel
-- 是否结婚 married
-- 字段注释 comment
CREATE TABLE IF NOT EXISTS `user`(
    id SMALLINT,
    username VARCHAR(20),
    age TINYINT,
    sex ENUM('男'，'女','保密')，
    email VARCHAR(50),
    add VARCHAR(200),
    birth YEAR,
    salary FLOAT(8,2),
    tel INT,
    married TINYINT(1) COMMENT '0代表未婚，1代表已婚'
)ENGINE=INNODB CHARSET=UTF8;