create database insurance1;
use insurance1;
create table person 
(driver_id char(10),
name varchar(20),
address varchar(20),
primary key(driver_id));
desc person;
create table cars 
(reg_num char(10),
model varchar(20),
year year,
primary key(reg_num));
desc cars;
create table owns 
(driver_id char(10),
reg_num char(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id) on delete  cascade,
foreign key(reg_num) references cars(reg_num) on delete cascade);
show tables;
desc owns;
create table accident1
(report_num int,
accident_date date,
location char(20),
primary key(report_num));
desc accident1;
show tables;
create table participated 
(driver_id char(10),
reg_num char(10),
report_num int,
damage_amt int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id) on delete cascade,
foreign key(reg_num) references cars(reg_num) on delete cascade,
foreign key(report_num) references accident1(report_num) on delete cascade);
desc participated;
show tables;
insert into person values('A01','Richard','Srinivas Nagar');
insert into person values('A02','Pradeep','Rajaji Nagar');
insert into person values('A03','Smith','Ashok Nagar');
insert into person values('A04','Venu','N R Colony');
insert into person values('A05','Jhon','Hanumanth Nagar');
select *from person;
insert into cars values('KA052250','Indica',1990);
insert into cars values('KA031181','Lancer',1957);
insert into cars values('KA095477','Toyota',1998);
insert into cars values('KA053408','Honda',2008);
insert into cars values('KA041702','Audi',2005);
select *from cars;
insert into accident1 values(11,'2003-01-01','Mysore Road');
insert into accident1 values(12,'2004-02-02','South End Circle');
insert into accident1 values(13,'2003-01-21','Bull Temple Road');
insert into accident1 values(14,'2008-02-28','Mysore Road');
insert into accident1 values(15,'2004-03-05','Kanakpura Road');
select *from accident1;
insert into owns values('A01','KA052250');
insert into owns values('A02','KA053408');
insert into owns values('A03','KA031181');
insert into owns values('A04','KA095477');
insert into owns values('A05','KA041702');
select *from owns;
insert into participated values('A01','KA052250',11,10000);
insert into participated values('A02','KA053408',12,50000);
insert into participated values('A03','KA031181',13,25000);
insert into participated values('A04','KA095477',14,3000);
insert into participated values('A05','KA041702',15,5000);
select *from participated;
update participated set damage_amt=25000 where reg_num='KA053408'and report_num=12;
select *from participated;
select count(distinct driver_id)CNT from participated a,accident1 b where a.report_num =b.report_num and b.accident_date like '%08'; 
insert into accident1 values(16,'2008-03-08','Domlur'); 
select *from accident1;
select accident_date,location from accident1;
select driver_id from participated where damage_amt>=25000;

