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
insert into manufacture values
 (1 , 'Samsung' )
,(2 , 'Sony' )
,(3 , 'Mi' )
,(4 , 'Boat' );

insert into orders values
 (1 , '2020-12-22' , 270 , 2 , 'Jayesh' )
,(2 , '2019-08-10' , 280 , 4 , 'Abhilash' )
,(3 , '2019-07-13' , 600 , 5 , 'Lily' )
,(4 , '2020-07-15' , 520 , 1 , 'Jayesh' )
,( 5 , '2020-12-22' , 1200 , 4 , 'Aswathy')
,(6 , '2019-10-02' , 720 , 3 , 'Jayesh')
,(7 , '2020-11-03' , 3000 , 2 , 'Lily' )
,(8 , '2020-12-22' , 1100 , 4 , 'Aswathy')
,(9 , '2019-12-29' , 5500 , 2 , 'Jayesh' );

insert into product values
 ( 145 , 2 , '2019-12-23' , 'MobilePhone' , 1)
,(147 , 6 , '2019-08-15' , 'MobilePhone' , 3)
,(435 , 5 , '2018-11-04' , 'MobilePhone' , 1 )
,(783 , 1 , '2017-11-03' , 'LEDTV' , 2 )
,(784 , 4 , '2019-11-28' , 'LEDTV' , 2)
,(123 , 2 , '2019-10-03' , 'Laptop' , 2)
,(267 , 5 , '2019-03-22' , 'Headphone' , 4 )
,( 333 , 9 , '2017-12-12' , 'Laptop' , 1)
,(344 , 3 , '2018-11-03' , 'Laptop' , 1)
,(233 , 3 , '2019-11-30' , 'PowerBank' , 2)
,( 567 , 6 , '2019-09-03' , 'PowerBank' , 2);


-- 1) Total number of orders placed in each year.
SELECT count (distinct orderid)as total_orders,DATEPART(year, orderdate) AS year 
from orders
group by DATEPART(year, orderdate)

-- 2) Total number of orders placed in each year by Jayesh.
SELECT count (distinct orderid)as total_orders,DATEPART(year, orderdate) AS year 
from orders
group by DATEPART(year, orderdate),customername

-- 3) Products which are ordered in the same year of its manufacturing year.

select p.productname, DATEPART(year, o.orderdate) AS ordyear,  DATEPART(year, p.manudate) as manuyear
from orders o
inner join product p 
on o.orderid=p.orderid
where DATEPART(year, o.orderdate) = DATEPART(year, p.manudate)

-- 4) Products which is ordered in the same year of its manufacturing year where the
--    Manufacturer is ‘Samsung’.

select p.productname,p.productid, DATEPART(year, o.orderdate) AS ordyear,  DATEPART(year, p.manudate) as manuyear
from orders o
inner join product p 
on o.orderid=p.orderid
inner join manufacture m 
on p.manuid =m.manuid
where DATEPART(year, o.orderdate) = DATEPART(year, p.manudate)  and m.manuname ='samsung'

-- 5) Total number of products ordered every year.
SELECT DATEPART(year, orderdate) as Year, SUM(orderquantity) as No_of_products_ordered
FROM orders
GROUP BY YEAR(orderdate)
