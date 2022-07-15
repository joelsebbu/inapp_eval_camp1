create database qn2;
use qn2;

create table orders(
	 orderid int primary key
	,orderdate date
	,orderprice money
	,orderquantity int
	,customername varchar(25)
);

create table manufacture(
	 manuid int primary key
	,manuname varchar(25)
);

create table product(
	 productid int primary key
	,orderid int
	,manudate date
	,productname varchar(25)
	,manuid int
	,foreign key(orderid) references orders(orderid)
	,foreign key(manuid) references manufacture(manuid)

);