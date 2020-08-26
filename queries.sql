# create is used to create a table
CREATE TABLE `comp`.`employee`(
`fname` VARCHAR(15) NOT NULL,
`mname` CHAR NULL,
`lname` VARCHAR(15) NOT NULL,
 `ssn` CHAR(9) NOT NULL,
 `bdate` DATE,
 `address` VARCHAR(35) NOT NULL,
 `sex` CHAR NULL,
 `salary` DECIMAL(10,2) NULL,
 `superssn` CHAR(9) NULL,
 `dno` INT NOT NULL,
 PRIMARY KEY(`ssn`));
 
CREATE TABLE `comp`.`department`(
`dname` VARCHAR(15) NOT NULL,
`dnumber` INT NOT NULL,
`mgr_ssn` CHAR(9) NOT NULL,
`mgr_startdate` DATE NULL,
PRIMARY KEY(`dnumber`));

USE comp; 

CREATE TABLE `comp`.`dept_locations`(
`dnumber` INT NOT NULL,
`dlocation` VARCHAR(15) NOT NULL,
PRIMARY KEY(`dnumber`,`dlocation`));
 
 CREATE TABLE `project`(
`pname` VARCHAR(9) NOT NULL,
`pnumber` INT NOT NULL,
`plocation` VARCHAR(35),
`dnum` INT NOT NULL,
PRIMARY KEY(`pnumber`),
UNIQUE KEY(`pname`));
 
CREATE TABLE `works_on`(
`essn` CHAR(9) NOT NULL,
`pno` INT NOT NULL,
`hours` DECIMAL(3,1) NOT NULL,
PRIMARY KEY(`essn`,`pno`));

CREATE TABLE `dependent`(
`essn` CHAR(9) NOT NULL,
`dependent_name` VARCHAR(15) NOT NULL,
`sex` CHAR,
`bdate` DATE,
`relationship` VARCHAR(10),
PRIMARY KEY (`essn`,`dependent_name`));	

# insert into is used to insert values in the following table    
INSERT INTO `comp`.`employee`(fname,mname,lname,ssn,bdate,address,sex,salary,superssn,dno) 
VAlUES('siddharth','b','sharma',1,'1996-11-09','9/4258855 fdgh','m','38000',1,'5');

INSERT INTO `comp`.`employee`
VAlUES('rahul','b','sharma',2,'1996-11-08','9/4258855 fdgh','m','48000',2,'5');

INSERT INTO `employee`
VAlUES('satyam','b','sharma',3,'1996-11-08','9/4258855 fdgh','m','48000',3,'5');

INSERT INTO `comp`.`department`VALUES('research',5,1,'2020-01-01');

INSERT INTO `comp`.`dependent`VALUES(1,'theovsdjhbs','m','2000-01-01','son');

INSERT INTO `comp`.`dept_locations`VALUES(1,'houston');

INSERT INTO `comp`.`project`() VALUES('prox',1,'belier',5);

INSERT INTO `comp`.`works_on` VALUES(12345,1,32.5);

INSERT INTO `employee`
VAlUES('satyam1','b','sharma',4,'1996-11-08','9/4258855 fdgh','m','48000',4,'5');

INSERT INTO `employee`VAlUES('satyam5','b','shasdcsrma',5,'1996-11-08','9/4258855 fdgh','m',48000,5,5);
INSERT INTO `employee`VAlUES('sat','b','shasdcsrma',6,'1996-11-08','9/4258855 fdgh','m',8000,6,6);
INSERT INTO `employee`VAlUES('yam','b','shasdcsrma',7,'1996-11-08','9/4258855 fdgh','m',8000,7,6);
INSERT INTO `comp`.`department`VALUES('research',6,6,'2020-01-01');
INSERT INTO `comp`.`department`VALUES('development',7,7,'2020-01-01');

INSERT INTO `dependent`VALUES(6665,'thesdjhbs','m','2000-01-01','son');
INSERT INTO `dependent`VALUES(7665,'vsdjhbs','m','2000-01-01','son');

INSERT INTO `dept_locations`VALUES(2,'england');
INSERT INTO `dept_locations`VALUES(3,'india');

INSERT INTO `project`() VALUES('prox1',2,'belier2',5);
INSERT INTO `project`() VALUES('prox2',3,'belier3',5);

INSERT INTO `works_on` VALUES(22345,2,32.5);
INSERT INTO `works_on` VALUES(32345,3,32.5);

#alter part
ALTER TABLE `comp`.`department` ADD FOREIGN KEY(`mgr_ssn`) REFERENCES `comp`.`employee`(`ssn`);

ALTER TABLE `comp`.`project` ADD FOREIGN KEY(`dnum`) REFERENCES `comp`.`department`(`Dnumber`);
ALTER TABLE `comp`.`works_on` ADD FOREIGN KEY(`essn`) REFERENCES `comp`.`employee`(`ssn`);
ALTER TABLE `works_on` ADD FOREIGN KEY(`pno`) REFERENCES `project`(`pnumber`);
ALTER TABLE `dependent` ADD FOREIGN KEY(`essn`) REFERENCES `employee`(`ssn`);

#how to use update
UPDATE employee 
SET salary='48000'
WHERE ssn='siddharth';

drop table `works_on`;
drop table `department`;
drop table `dependent`;
drop table `dept_locations`;
drop table `employee`;
drop table `project`;
delete from works_on
where essn=32345 and pno=3;
use comp;

select fname,lname
from employee
where salary>3000;
select * from employee;

select pnumber,dnum,lname,address,bdate
from project , department , employee
where  dnum=dnumber and mgr_ssn=ssn  and mname='blll';

select E.fname ,E.lname , S.fname ,S.lname
from employee as E , employee as S
where E.superssn=S.ssn;

select distinct salary
from employee; 

select ssn, dname
from employee,department;

select ssn, bdate, dname
from employee,department;

select * from employee;

UPDATE employee 
SET salary='46000'
WHERE ssn=3;

UPDATE employee 
SET salary='12000'
WHERE ssn=4;

UPDATE employee 
SET salary='18000'
WHERE ssn=5;
UPDATE employee 
SET salary='10000'
WHERE ssn=6;

UPDATE employee 
SET lname='goyal'
WHERE ssn=2;

UPDATE employee 
SET lname='aggarwal'
WHERE ssn=3;

UPDATE employee 
SET lname='aggarwal'
WHERE ssn=6;

UPDATE employee 
SET lname='goyal'
WHERE ssn=4;
 (select distinct pnumber
 from project,department,employee
 where mgr_ssn=ssn and lname='aggarwal')
 union
 (select distinct pnumber
 from project, works_on, employee
 where lname='aggarwal' and essn=ssn);
 
 select distinct essn
 from works_on
 where (pno,hours) in (select pno,hours 
 from works_on
 where essn=1);
 UPDATE works_on 
SET essn=2
WHERE pno=2;
select * from works_on;
INSERT INTO `comp`.`works_on` VALUES(1,1,32.5);
INSERT INTO `comp`.`works_on` VALUES(1,3,22.5);

select fname , lname
from  employee
where  exists(select *
from dependent
where ssn=essn)
and 
not exists (select *
from department
where ssn=mgr_ssn);
select * from employee;
select fname,salary
from employee
where bdate like '%1996-11-08%';

select* from employee
where(salary between 30000 and 50000) and dno=5;

select E.fname, E.lname,1.3*E.salary as increased_salary
from employee as E , works_on as W , project as p 
where E.ssn = W.essn and W.pno=p.pnumber;

select fname, lname 
from employee
where superssn is not null;

select sum(salary), max(salary),min(salary),avg(salary)
from employee;

select count(distinct salary)
from employee;

select d.dname,e.fname, e.lname,p.pname
from department as d, employee as e , project as p , works_on as w
where d.dnumber=e.dno and e.ssn=w.essn and w.pno=p.pnumber
order by dname, e.lname ,p.pname,e.fname;

select  * 
from employee
order by salary asc;

select dno, count(*) , avg(salary)
from employee 
group by dno;
 
 select pnumber, pname, count(*)
 from project , works_on
 where pnumber=pno
 group by pnumber,pname
 having count(*)>1;
 
 CREATE TABLE `comp`.`customer`(
 `cid` int not null unique,
`fname` VARCHAR(15) NOT NULL,
`lname` VARCHAR(15) NOT NULL,
 
 PRIMARY KEY(`cid`));
 
 CREATE TABLE `comp`.`corder`(
 `cid` int not null unique,
`orderid` int NOT NULL,
`pname` VARCHAR(15) NOT NULL,
 
 PRIMARY KEY(`cid`));

INSERT INTO `comp`.`customer` VAlUES(1,'sid','sharma');
INSERT INTO `comp`.`customer` VAlUES(2,'rahul','sharma');
INSERT INTO `comp`.`customer` VAlUES(3,'satyam','goyal');
INSERT INTO `comp`.`customer` VAlUES(4,'ads','verma'); 
INSERT INTO `comp`.`customer` VAlUES(5,'fgs','verma'); 

INSERT INTO `comp`.`corder` VAlUES(1,123,'pro1');
INSERT INTO `comp`.`corder` VAlUES(2,23,'pro2');
INSERT INTO `comp`.`corder` VAlUES(3,1237,'pro4');
INSERT INTO `comp`.`corder` VAlUES(4,12553,'pro1');

select corder.orderid , customer.fname
from corder
inner join customer on corder.cid=customer.cid;

alter table corder add shipperid int not null;
update corder
set shipperid=78
where cid=4;

create table `comp`.`ship`(
`shipperid` int not null,
`shipname` char(34) not null,
primary key(`shipperid`));

select * from corder;

INSERT INTO `comp`.`ship` VAlUES(23,'ship1');
INSERT INTO `comp`.`ship` VAlUES(3,'ship2');
INSERT INTO `comp`.`ship` VAlUES(38,'ship3');
INSERT INTO `comp`.`ship` VAlUES(8,'ship3');
 
 select corder.cid, customer.fname,ship.shipname
 from (( corder
 inner join customer on corder.cid=customer.cid)
 inner join ship on corder.shipperid=ship.shipperid);
 
 select customer.fname,corder.cid
 from customer
 left join corder on customer.cid=corder.cid;
 
 select customer.fname,corder.cid, customer.lname
 from corder
 right join customer on customer.cid=corder.cid;
 
select customer.fname,corder.cid
 from customer
 left join corder on customer.cid=corder.cid
 union all
 select customer.fname,corder.cid from customer
 right join corder on customer.cid=corder.cid;
 
 select cid from customer
 union all
 select cid from corder;
 
 select count(shipperid),shipname 
 from ship
 group by shipname
 having count(shipperid)=2;
# how to use cases like if else conditional statement 
select cid, fname ,
 case 
	when cid <=2 then 'less than 2'
	when cid = 3 then 'its 3'
	else 'the cid is greater than 3'
end as qua
from customer;

#creating a stored procedures
DELIMITER //
Create PROCEDURE cinsert(IN p_id int, IN f_name varchar(15),IN l_name varchar(15))
    BEGIN
    insert into customer(cid,fname,lname) values (p_id,f_name,l_name);
	end	
    //
DELIMITER ;

#calling a stored procedures
call cinsert(6,'fg','df');

#drop a stored procedure
DROP PROCEDURE IF EXISTS cinsert;

DELIMITER //
Create PROCEDURE cshow()
    BEGIN
    select * from customer;
	end	
//
DELIMITER ;
call cshow();


#creating database
create database asdf;

#deleting database
drop database asdf;

#backup db
