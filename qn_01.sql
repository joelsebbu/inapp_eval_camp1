create database qn1;
use qn1;

create table employee(
	 empid int primary key
	,empname varchar(25)
	,pay money
	,deptname varchar(25)
);

insert into employee values
 (001 , 'Dilip' , 3000 , 'IT' )
,(002 , 'Fahad' , 4000 , 'Sales')
,(003 , 'Lal' , 6000 , 'Marketing' )
,(004 , 'Nivin' , 2000 , 'IT' )
,(005 , 'Vijay' , 9000 , 'Sales')
,(006 , 'Anu' , 5000 , 'HR' )
,(007 , 'Nimisha' , 5000 , 'Sales')
,(008 , 'Praveena' , 8000 , 'Marketing' );

-- 1) The total number of employees.