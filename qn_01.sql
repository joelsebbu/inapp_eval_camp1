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

-- 1) The total number of employees.select count(distinct empid) as no_of_emp from employee-- 2) Total amount required to pay all employees.select sum(pay) as total_amount from employee -- 3) Average, minimum and maximum pay in the organization.select avg(pay) as avg_pay, min(pay) as min_pay, max(pay) as max_pay from employee-- 4) Each Department wise total payselect sum(pay), deptname from employeegroup by deptname-- 5) Average, minimum and maximum pay department-wise.select avg(pay) as avg_pay, min(pay) as min_pay, max(pay) as max_pay, deptname from employeegroup by deptname-- 6) Employee details who earns the maximum pay.select * from employee where pay =(select max(pay) from employee)-- 7) Employee details who is having a maximum pay in the department.select * from employee where pay in(select max(pay) from employee 			group by deptname		   )-- 9) Employee who has more pay than the average pay of his department.select * from employee where pay in(select avg(pay) from employee 			group by deptname		   )-- 10)Unique departments in the companyselect distinct deptname from employee-- 11)Employees In increasing order of payselect * from employeeorder by pay-- 12)Department In increasing order of payselect sum(pay)as total_pay, deptname from employeegroup by deptnameorder by total_pay