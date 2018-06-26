

select * from mysql.user;
--- dev 用户权限划分---
drop user "dev"@"%";
drop user "dev"@'localhost';
flush privileges;

CREATE USER 'dev'@'%' IDENTIFIED BY 'dev';
grant select,insert,update,delete,execute  on *.* to 'dev'@'%' ;
flush privileges;

CREATE USER 'dev'@'localhost' IDENTIFIED BY 'dev';
grant select,insert,update,delete,execute  on *.* to 'dev'@'localhost' ;
flush privileges;

show grants for dev;
 


--- auditor 用户权限划分---
drop user 'auditor'@'%';
drop user 'auditor'@'localhost';
flush privileges;

CREATE USER 'auditor'@'%' IDENTIFIED BY 'auditor';
grant select,insert,update,delete,
      create,alter,drop,create temporary tables,lock tables,
      index,references,
      create view,show view,
      create routine,alter routine,execute,
      event,trigger
on *.* to 'auditor'@'%' ;
flush privileges;

CREATE USER 'auditor'@'localhost' IDENTIFIED BY 'auditor';
grant select,insert,update,delete,
      create,alter,drop,create temporary tables,lock tables,
      index,references,
      create view,show view,
      create routine,alter routine,execute,
      event,trigger     
on *.* to 'auditor'@'localhost' ;
flush privileges;






--- real 用户权限划分---
drop user 'real'@'%' if EXISTS;
drop user 'real'@'localhost' if EXISTS;
flush privileges;

CREATE USER 'real'@'%' IDENTIFIED BY 'real';
grant select,insert,update,delete
on *.* to 'real'@'%' ;
flush privileges;

CREATE USER 'auditor'@'localhost' IDENTIFIED BY 'real';
grant select,insert,update,delete
on *.* to 'auditor'@'localhost' ;
flush privileges;

show grants for real;