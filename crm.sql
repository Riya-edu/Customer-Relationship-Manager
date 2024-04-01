create database crmlogin;
use crmlogin;

create table users(
uemail varchar(50) primary key, 
upwd varchar(50)
);

select * from users;

insert into users values('riya@gmail.com','riya');
insert into users values('admin@gmail.com','admin');

use crmlogin;

create table cust_users(
cuemail varchar(50) primary key, 
cupwd varchar(50)
);
select * from cust_users;
insert into cust_users values('customer@gmail.com','customer');

create table manager_users(
muemail varchar(50) primary key, 
mupwd varchar(50)
);
insert into manager_users values('manager@gmail.com','manager');
select * from manager_users;

create table appointment(
apptitle varchar(50),
appsubj varchar(50),
appdesc varchar(50),
appname varchar(50),
apploc varchar(50),
appurl varchar(50),
appdate date
);
drop table appointment;
select * from appointment;
delete  from appointment;

create table customer(
custname varchar(50),
custaddone varchar(50),
custaddtwo varchar(50),
custcity varchar(50),
custstate varchar(50),
custmobile varchar(20),
custemail varchar(50)
);

select * from customer;
delete  from customer;

create table feedback(
custfname varchar(50),
custfemail varchar(50),
custfeedback varchar(500),
custfdate date
);
drop table feedback;
select * from feedback;



UPDATE customer SET custaddone = 'here' WHERE custname='Bala';

select monthname(custfdate) as monthname,custfname,custfemail,custfeedback,custfdate from feedback order by custfdate asc;

select year(custfdate) as yearname,custfname,custfemail,custfeedback,custfdate from feedback order by custfdate asc;

select year(appdate) as yearnm,apptitle,appsubj,appdesc,appname,apploc,appurl,appdate from appointment order by appdate asc;

select monthname(appdate) as monthnm,apptitle,appsubj,appdesc,appname,apploc,appurl,appdate from appointment order by appdate asc;