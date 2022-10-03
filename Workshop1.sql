CREATE DATABASE foe_eie;

CREATE TABLE DEPARTMENT(
Dept_ID varchar(10) NOT NULL,
Dept_Head varchar(20) NOT NULL,
PRIMARY KEY (Dept_ID) 
);

CREATE TABLE EMPLOYEE(
Employee_ID varchar(10) NOT NULL,
Dept_ID varchar(10) NOT NULL,
Area varchar(10) NOT NULL,
Designation varchar(20) NOT NULL,
PRIMARY KEY (Employee_ID) 
);

INSERT INTO DEPARTMENT(Dept_ID , Dept_Head)
VALUES ('EIE' , 'MENUKA');

INSERT INTO DEPARTMENT(Dept_ID , Dept_Head)
VALUES ('MME' , 'RANIL');

INSERT INTO DEPARTMENT(Dept_ID , Dept_Head)
VALUES ('CEE' , 'LASITHA');

INSERT INTO EMPLOYEE( Employee_ID, Dept_ID, Area, Designation)
VALUES ('EE001' , 'EIE', 'Software' , 'Lecturer');

INSERT INTO EMPLOYEE( Employee_ID, Dept_ID, Area, Designation)
VALUES ('EE002' , 'EIE', 'Comm' , 'Senior Lecturer');

INSERT INTO EMPLOYEE( Employee_ID, Dept_ID, Area, Designation)
VALUES ('MM001' , 'MME', 'Manufac' , 'Senior Lecturer');

INSERT INTO EMPLOYEE( Employee_ID, Dept_ID, Area, Designation)
VALUES ('MM0O7' , 'MME', 'Automobile' , 'Lecturer');

INSERT INTO EMPLOYEE( Employee_ID, Dept_ID, Area, Designation)
VALUES ('CE001' , 'CEE', 'null' , 'LAB Atendant');

ALTER TABLE EMPLOYEE
ADD Age int DEFAULT 25;

ALTER TABLE EMPLOYEE
ADD Joined_date date DEFAULT '2022-12-07';

ALTER TABLE EMPLOYEE
ADD Joined_time time DEFAULT '00:00:00';

ALTER TABLE EMPLOYEE
ADD Married Boolean DEFAULT 1;

ALTER TABLE EMPLOYEE
ADD Security_code Binary(6) DEFAULT 010101;

ALTER TABLE EMPLOYEE
DROP COLUMN Security_code;

ALTER TABLE EMPLOYEE
ADD Security_code varchar(6) DEFAULT '010101';

ALTER TABLE EMPLOYEE
ADD Experience decimal(3,1) DEFAULT 10.0,
ADD CHECK (Experience < 50 );

ALTER TABLE EMPLOYEE
ADD CHECK (20<Age<60);


ALTER TABLE EMPLOYEE
DROP COLUMN Security_code;

ALTER TABLE EMPLOYEE
ADD Security_code Binary(6) DEFAULT 010101;

ALTER TABLE EMPLOYEE
ADD CHECK(20<Age AND Age<60);

ALTER TABLE employee
CHANGE Area Specialization varchar(20);  #Change column header name

ALTER TABLE employee
MODIFY Designation varchar(25);   #change size of the data type

SELECT *FROM EMPLOYEE;        # to get the table. (*-all)

#changing primary key
ALTER TABLE employee
drop primary key,
add unique(Emp_ID);

SELECT *FROM employee;

ALTER TABLE EMPLOYEE
ADD CONSTRAINT PK_const UNIQUE(Emp_ID,DEsignation);

select *from employee;
 ALTER TABLE employee
 ADD CONSTRAINT PK_const PRIMARY KEY(Emp_ID,Designation);
 
 ALTER TABLE EMPLOYEE
 ADD UNIQUE(Emp_ID);

SHOW CREATE TABLE DEPARTMENT;

#primary keys are automatically unique, but when we create super key we have to specialized aa unique key out form one to od=f the super key

ALTER TABLE employee
DROP COLUMN Experience;

SELECT *FROM employee;

#Foreign key Constraints
#We cant delete rows when Foreign eys are exist
#set null,default value,delete all columns

ALTER TABLE employee
ADD CONSTRAINT fk_const
FOREIGN KEY(Dept_ID) REFERENCES DEPARTMENT(Dept_ID)
ON DELETE SET null                                                  #to delete rows from the table use one of the above technique
ON UPDATE CASCADE;

#Data base Modification
#deleting tuples with Dept_ID is not EIE

DELETE FROM employee
WHERE Dept_ID !='EIE';               #!= and <> are same
									# safe update mode error occurs dute dont usage PK for delete oprations

Delete from department
where Dept_ID !='EIE';           # safe update mode error  dont occurs due  usage PK for delete oprations

ALTER TABLE employee
ALTER Joined_time set DEFAULT NULL;
SELECT * FROM employee;

SHOW CREATE TABLE employee;

INSERT INTO EMPLOYEE(Emp_ID,Dept_ID,Designation)
values('CE0011','CEE','Lecturer');

INSERT INTO EMPLOYEE(Emp_ID,Dept_ID,Designation)
values('ME0011','MIE','Senior Lecturer');

INSERT INTO EMPLOYEE(Emp_ID,Dept_ID,Designation)
values('ME0012','MIE','Lecturer');

UPDATE EMPLOYEE
SET Age= 27
where Emp_ID='EE001';

UPDATE EMPLOYEE
SET Age= 27, Joined_Date='2017-12-18',Joined_Time='00:08:30', Married=false,Security_code=011000
where Emp_ID='EE001';

INSERT INTO DEPARTMENT(Dept_ID , Dept_Head)
VALUES ('MME' , 'Randitha');

SELECT *from department;

SHOW COLUMNS FROM employee;


ALTER TABLE employee
ADD CONSTRAINT fk_const
FOREIGN KEY(Dept_ID) REFERENCES DEPARTMENT(Dept_ID)
ON DELETE SET null                                                
ON UPDATE CASCADE;
 

 DELETE FROM employee WHERE Emp_ID="ME0011";
SELECT *from employee;
DELETE FROM employee WHERE Emp_ID="ME0012";
DELETE FROM employee WHERE Emp_ID="ME001";
DELETE FROM employee WHERE Emp_ID="MM001";

UPDATE EMPLOYEE
SET Joined_date='2019-12-17' ,Security_code=010101,Specialization=null
where Emp_ID='CE008';

ALTER TABLE employee
DROP PRIMARY KEY;

SHOW COLUMNS FROM employee;

ALTER TABLE employee
ADD FOREIGN KEY (Dept_ID) REFERENCES department(Dept_ID);

UPDATE EMPLOYEE
SET Specialization=null
where Emp_ID='EE005';

SELECT *from employee;  #retieve all tuples of Employee table
SELECT Emp_ID,Dept_ID,Specialization, Age from employee;      #only selected columns

SELECT * FROM employee                                         #retieve data of all lecturers
WHERE Designation='Lecturer';


select Emp_ID,Security_code,Age from employee          #Retrieve Emp_ID and security code of employee whose age is greater than 25
WHERE age>25;


SELECT Age,Joined_Date from employee
where married=true
order by age desc;                                   #data in ascending order in Age , for descending order=desc. Term used ins "order by"
                                              
select * FROM employee
NATURAL JOIN department;                           #JOIN tables by selecting common attributes

SELECT E.Emp_ID as Employee_ID, D.Dept_Head as Department_ID  from
 employee as E NATURAL join department as D
where Joined_date>'2017-12-30';


SELECT distinct designation from employee;        #by using "distict" word we can retireve distinct tuples from a column

Select Dept_ID, count(Dept_ID) as No_Of_Employees ,avg(Age) as Average_Age
from employee group by Dept_ID;

#  key words for calculations :- avg, sum,max,min,count

Select Dept_ID as Department_ID, count(Dept_ID) as Employee_number,max(Age) as Age_Max
from employee group by Dept_ID
having Employee_number>2;                          # if attribute on the queury we have to use "having"


select Emp_ID from employee
where ((Designation like '%Lecturer%')&(Joined_date like '201_-1_-__'));                        # % used get other character before and after the lecturer word _ used get any number

Select age, age+10 as AGE10
from employee
where age in (27,39,55)  ;                    #


Select Age
from employee
where specialization is null;
