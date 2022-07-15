create database qn4;
use qn4;

create table employee(
	 empno int primary key
	,ename varchar(25)
	,job varchar(25)
	,mgr int
	,hiredate date
	,sal money
	,commission int
	,deptno int
);
insert into employee values
(7839, 'KING', 'PRESIDENT', null, '11/17/1981', 5000,0, 10);
select * from employee
insert into employee values
 (7698, 'BLAKE', 'MANAGER', 7839 ,'05-01-1981', 2850,0, 30)
,(7782, 'CLARK', 'MANAGER', 7839, '06-09-1981', 2450,0, 10)
,(7566, 'JONES', 'MANAGER', 7839, '04-02-1981', 2975, 0,20)
,(7788, 'SCOTT', 'ANALYST', 7566, '12-09-1982', 3000,0, 20)
,(7902, 'FORD', 'ANALYST', 7566, '12-03-1981', 3000,0, 20)
,(7369, 'SMITH', 'CLERK', 7902, '12/17/1980', 800, 0,20)
,(7499, 'ALLEN', 'SALESMAN', 7698, '02/20/1981', 1600, 300 ,30)
,(7521, 'WARD', 'SALESMAN', 7698, '02/22/1981', 1250, 500 ,30)
,(7654, 'MARTIN', 'SALESMAN', 7698, '09/28/1981', 1250, 1400,30)
,(7844, 'TURNER', 'SALESMAN', 7698, '09-08-1981', 1500 ,0,30)
,(7876, 'ADAMS', 'CLERK' ,7788, '01-12-1983', 1100, 0,20)
,(7900, 'JAMES', 'CLERK', 7698, '12-03-1981', 950, 0,30)
,(7934, 'MILLER', 'CLERK', 7782, '01/23/1982', 1300, 0,10);

create table department(
	 deptno int primary key
	,dname varchar(25)
	,loc varchar(25)
);

insert into department values
 (10,'accounting','new york')
,(20,'research','dallas')
,(30,'sales','chicago')
,(40,'operations','boston');



-- 1.Report needed: Names of employees who are manager.
select ename,job from employee
where job='manager';

--  2.List the name of all employees along with their department name and Annual Income.
--    in ascending order. Within the same department, employee name should be in the
--    descending order
--    or Shoe department.
--    No department named Toy and Shoe.

--    and name column Employee and department.
--    all employees who work in DALLAS.

select employee.ename,employee.job,department.deptno, department.dname
FROM employee e
INNER JOIN employee m ON m.empno = e.mgr
ORDER BY manager;
--    including King who have no manager.
FROM employee e
left JOIN employee m ON m.empno = e.mgr
ORDER BY manager;
--    department as a given employee (�Mathew�). Give each column an appropriate label.

select ename,deptno from employee;
-- no employee by the name mathew

-- 10. Create a unique listing of all jobs that are in department 30. Include location
--     of department 30 in the output.
select distinct employee.job,department.deptno, department.loc