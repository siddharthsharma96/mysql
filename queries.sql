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

ALTER TABLE `comp`.`department` ADD FOREIGN KEY(`mgr_ssn`) REFERENCES `comp`.`employee`(`ssn`);

ALTER TABLE `comp`.`project` ADD FOREIGN KEY(`dnum`) REFERENCES `comp`.`department`(`Dnumber`);
ALTER TABLE `comp`.`works_on` ADD FOREIGN KEY(`essn`) REFERENCES `comp`.`employee`(`ssn`);
ALTER TABLE `works_on` ADD FOREIGN KEY(`pno`) REFERENCES `project`(`pnumber`);
ALTER TABLE `dependent` ADD FOREIGN KEY(`essn`) REFERENCES `employee`(`ssn`);
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