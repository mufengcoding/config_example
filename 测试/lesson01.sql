SET NAMES GBK;
select DATABASE()


--创建maizi数据库
CREATE DATABASE IF NOT EXISTS maizi DEFAULT CHARACTER SET 'UTF8';

use maizi;
select DATABASE()
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
use maizi;
CREATE TABLE IF NOT EXISTS `maizi.user`(
    id SMALLINT,
    username VARCHAR(20),
    age TINYINT,
    sex ENUM('男','女','保密'),
    email VARCHAR(50),
    addr VARCHAR(200),
    birth year,
    salary float(8,2) null,
    tel INT,
    married TINYINT(1) COMMENT '0代表未婚，1代表已婚'
)ENGINE=INNODB CHARSET=UTF8;


select * from maizi.user



---查看手册

help

? int

--查询降序排列 desc
select * from maizi.user order by id desc;

--年龄升序id降序
select * from  maizi.user order by age desc,id asc

--having是group by分组查讯的条件
select id,age,sex,group_concat(username),count(*) as total,sum(age) as sum_age
from maizi.user
where id >=2
group by sex
having count(*) >=2
order by age desc ,id asc

--实现随机提取
select * from maizi.user order by rand()

SELECT @@sql_mode;


select @@version
--误打了单引号 需要成对出现
select version()'';

--修改命令分割符号
delimiter 

select now();

select * from maizi.user;


CREATE TABLE IF NOT EXISTS maizi.ceshi (
id  SMALLINT NOT null,
name VARCHAR(50) DEFAULT 'ss',
`year` year DEFAULT '2018'
)ENGINE=INNODB CHARSET=UTF8;

select * from maizi.ceshi 
desc maizi.ceshi

insert maizi.ceshi values(1,2,3)



--测试主键
CREATE TABLE IF NOT EXISTS maizi.user1(
    id int primary key,
    username VARCHAR(50)
)
show CREATE TABLE maizi.user1

desc maizi.user1

use maizi.user1
insert maizi.user1 values(1,'king')
insert maizi.user1 values(2,'king2')
insert maizi.user1 values(2,'king2')


CREATE TABLE IF NOT EXISTS maizi.user2(
    id int primary key auto_increment,
    username VARCHAR(50)
)
insert maizi.user2 values(null,'输');
select * from maizi.user2;




insert maizi.user2(username) values('输dddd');
select * from maizi.user2;

insert maizi.user2 set username="沐风";
select * from maizi.user2;

select * from maizi.user;

insert maizi.user2(username) select username from maizi.user;



-- 给表表名取别名

select m.username from maizi.user as m;

-- 给字段取别名

select 1,username as '姓名' from maizi.user;

--alert TABLE 
SELECT articleTags,GROUP_CONCAT(articleTitle) from 
b3_solo_article 
GROUP BY articleTags

select * from maizi.ceshi 
truncate maizi.ceshi 

insert maizi.ceshi values(1,1,2017)

select length(md5('admin'))

select format(2.01333,2)

select conv(35,10,2)

select inet_aton('127.0.0.1')
select inet_ntoa('2130706433')