create table salespeople(
snum number Primary key,
sname varchar(10),
city varchar(10),
comm number(3, 3)
);

select * from salespeople;

insert into salespeople values (1001, 'Peel', 'London', 0.12);
insert into salespeople values (1002, 'Serres', 'San Jose', 0.13);
insert into salespeople values (1004, 'Monika', 'London', 0.11);
insert into salespeople values(1007, 'Rifkin', 'Barcelona', 0.15);
insert into salespeople values(1003, 'Axelrod', 'New York', 0.10);
insert into salespeople values(1005, 'Franc', 'London', 0.26);
--------------------------------------------------------------------------------------------

create table customers(
cnum number primary key,
cname varchar(10),
city varchar(10),
rating number,
snum number,
foreign key(snum) references salespeople(snum)
);


select * from customers;

insert into customers values (2001, 'Hoffman', 'London', 100, 1001);
insert into customers values (2002, 'Giovanni', 'Rome', 200, 1003);
insert into customers values (2003, 'Liu', 'San Jose', 200, 1002);
insert into customers values (2004, 'Grass', 'Berlin', 300, 1002);
insert into customers values (2006, 'Clemens', 'London', 100, 1001);
insert into customers values (2008, 'Cisneros', 'San Jose', 300, 1007);
insert into customers values (2007, 'Pereira', 'Rome', 100, 1004);
--------------------------------------------------------------------------------------------------

create table orders(
onum number primary key,
amt number(8, 2),
odate date,
cnum number,
foreign key(cnum) references customers(cnum),
Snum number,
foreign key(snum) references salespeople(snum)
);

select * from orders;

insert into orders values (3001, 18.69, to_date('03-Oct-96 12:30', 'dd-mm-yy hh24:mi'), 2008, 1007);
insert into orders values (3003, 767.19, to_date('03-Oct-96 13:45', 'dd-mm-yy hh24:mi'), 2001, 1001);
insert into orders values (3002, 1900.10, to_date('03-Oct-96 12:05', 'dd-mm-yy hh24:mi'), 2007, 1004);
insert into orders values (3005, 5160.45, to_date('03-Oct-96 14:00 ', 'dd-mm-yy hh24:mi'), 2003, 1002);
insert into orders values (3006, 1098.16, to_date('03-Oct-96 13:37 ', 'dd-mm-yy hh24:mi'), 2008, 1007);
insert into orders values (3009, 1713.23, to_date('04-Oct-96 15:21', 'dd-mm-yy hh24:mi'), 2002, 1003);
insert into orders values (3007, 75.75, to_date('04-Oct-96 16:02', 'dd-mm-yy hh24:mi'), 2002, 1003);
insert into orders values (3008, 4723.00, to_date('05-Oct-96 12:07', 'dd-mm-yy hh24:mi'), 2006, 1001);
insert into orders values (3010, 1309.95, to_date('06-Oct-96 13:12', 'dd-mm-yy hh24:mi'), 2004, 1002);
insert into orders values (3011, 9891.88, to_date('06-Oct-96 13:09', 'dd-mm-yy hh24:mi'), 2006, 1001);
insert into orders values (3012, 3455.78, to_date('04-Oct-96 15:21', 'dd-mm-yy hh24:mi'), 2002, 1003);
insert into orders values (3013, 1245.98, to_date('04-Oct-96 16:32', 'dd-mm-yy hh24:mi'), 2002, 1003);
insert into orders values (3014, 3721.53, to_date('05-Oct-96 12:45', 'dd-mm-yy hh24:mi'), 2006, 1001);
insert into orders values (3015, 734.50, to_date('06-Oct-96 13:16', 'dd-mm-yy hh24:mi'), 2004, 1002);
insert into orders values (3016, 1729.67, to_date('06-Oct-96 13:07', 'dd-mm-yy hh24:mi'), 2006, 1001);



--1.	List all customers with a rating of 100.
select * from customers
where rating = 100;

--2.	Find all records in the Customer table with NULL values in the city column.
select * from customers
where city is null;

--3.	Find the largest order taken by each salesperson on each date.
select snum, o_date, max(amt) as amt
from orders
group by snum, o_date;
 
--4.	Arrange the Orders table by descending customer number.
select* from orders
order by c_num desc;

--5.	Find which salespeople currently have orders in the Orders table.
select distinct(snum) from orders;

--6.	List names of all customers matched with the salespeople serving them.
select c.cname, s.sname
from customers c
inner join salespeople s
on c.snum = s.snum;

--7.	Find the names and numbers of all salespeople who had more than one customer.
select sname, snum from salespeople
where snum in
              ( select snum from customers
                group by snum
                having count(cnum) > 1
                
);

select s.sname, s.snum
from salespeople s
inner join customers c
on s.snum = c.snum
group by s.sname, s.snum
having count(c.cnum) > 1;

--8.	Count the orders of each of the salespeople and output the results in descending order.
select s.sname, s.snum , count(onum) as order_count
from salespeople s
inner join orders o
on s.snum = o.snum
group by s.sname, s.snum
order by order_count desc;

--9.	List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
select * from customers
where (select count(*)
       from customers
       where city = 'San Jose') > 0;

--10.	Match salespeople to customers according to what city they lived in.
select s.sname, s.city, c.cname, c.city
from salespeople s
inner join customers c 
on s.city = c.city;

--11.	Find the largest order taken by each salesperson.
select snum, max(amt)
from orders
group by snum;

SELECT s.sname, s.snum, o.max_amt
FROM salespeople s
JOIN (
    SELECT snum, MAX(amt) AS max_amt
    FROM orders
    GROUP BY snum
) o
ON s.snum = o.snum;

--12.	Find customers in San Jose who has a rating above 200.
select * from customers
where city = 'san jose' and rating > 200;

--13.	List the names and commissions of all salespeople in London.
select sname, comm 
from salespeople
where city = 'London';

--14.	List all the orders of salesperson Monika from the Orders table.
select o.* 
from orders o
join salespeople s
on o.snum = s.snum
where s.sname = 'Monika';

SELECT *
FROM orders
WHERE snum = (
    SELECT snum
    FROM salespeople
    WHERE sname = 'Monika'
);

--15.	Find all customers with orders on October 3
select distinct c.*
from customers c
join orders o
on c.snum = o.snum
where o.odate > to_date('03-Oct-96', 'dd-mm-yyyy'); 

--16.	Give the sums of the amounts from the orders table, grouped by date, 
select distinct odate, sum(amt)
from orders
group by odate;

--17.	Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
select odate, sum(amt)  , max(amt) 
from orders
group by odate
having  sum(amt) >= max(amt) + 2000;

--18.	Select all orders that had amounts that were greater than at least one of the orders from October 6.
select * 
from orders
where amt > any(
                 select amt
                 from orders
                 where odate = to_date('06-oct-96', 'dd-mm-yyyy')
);

--19.	Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
select * 
from salespeople s
where exists(
      select 1
      from customers c
      where c.snum = s.snum
      and c.rating = 300
);

--20.	Find all pairs of customers having the same rating.
select c1.cname, c2.cname 
from customers c1
join customers c2
on c1.rating = c2.rating
and c1.cnum < c2.cnum;
                                         
--21.	Find all customers with CNUM, 1000 above the SNUM of Serres.
select *  
from customers
where cnum > (
      select snum
      from salespeople
      where sname = 'Serres') + 1000;

--22.	Give the salespeople’s commissions as percentage instead of decimal numbers.
select sname, comm*100 as commission_percentage
from salespeople;

--23.	Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value
select snum, odate, max(amt)
from orders
group by snum, odate
having max(amt) >= 3000;

--24.List the largest orders on October 3, for each salesperson.

--25.	Find all customers located in cities where Serres (SNUM 1002) has customers.
select cname, city
from customers
where city in (
      select city
      from customers
      where snum = 1002
);

--26.	Select all customers with a rating above 200.00
select * 
from customers
where rating > 200;

--27.	Count the number of salespeople currently listing orders in the Orders table.
select count(distinct s.snum) as num_salespeople
from salespeople s
inner join orders o
on s.snum = o.snum;

--28.	Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission.
select c.cname, s.comm
from customers c
join Salespeople s
on c.snum = s.snum
where s.comm > 12;


--29.	Find salespeople who have multiple customers.
select snum, count(snum)
from customers
group by snum
having  count(snum) > 1;

--30.	Find salespeople with customers located in their city.

select *
from salespeople s
where city in (select city from customers c
           where s.city = c.city);

select distinct s.*
from salespeople s
join customers c
on s.city = c.city;

--31.	Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.
select * from salespeople
where trim(sname) like 'P__l%';

--32.	Write a query that uses a sub query to obtain all orders 
--for the customer named ‘Cisneros’. Assume you do not know his customer number.
select c.cnum, c.cname
from customers c
inner join orders o
on c.cnum = o.cnum
where c.cname = 'Cisneros';

select cnum from orders
where cnum = (select cnum from customers
                     where cname = 'Cisneros');
                                         
--33.	Find the largest orders for ‘Serres’ and ‘Rifkin’.
select s.sname, max(o.amt)
from salespeople s 
join orders o
on s.snum = o.snum
where s.sname in('Serres', 'Rifkin')
group by s.sname;

--34.	Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.
select snum, sname, comm, city from salespeople;

--35.	Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
select cname from customers
where cname  between 'A' and 'G';

--36. Select all the possible combinations of customers that you can assign.
select c1.cname, c2.cname 
from customers c1
cross join customers c2

--37.	Select all orders that are greater than the average for October 4.
select *
from orders
where amt > (select avg(amt)
from orders
where odate = to_date('04-oct-1996', 'dd-mm-yyyy'))

--38.	Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city.
select cname, cnum, city, rating
from customers c1
where rating = (select max(rating)
               from customers c2
               where c2.city = c1.city);

--39.	Write a query that totals the orders for each day and places the results in descending order.
select odate, sum(amt) as total_amt
from orders
group by odate
order by total_amt desc;

--40.	Write a select command that produces the rating followed by the name of each customer in San Jose.
select cname, rating
from customers
where city = 'San Jose';

--41.	Find all orders with amounts smaller than any amount for a customer in San Jose.
select * 
from orders
where amt < any(select o.amt from orders o
      join customers c
      on o.cnum = c.cnum
      where c.city = 'San Jose');

SELECT DISTINCT o1.*
FROM orders o1
JOIN orders o2
  ON o1.amt < o2.amt
JOIN customers c
  ON o2.cnum = c.cnum
WHERE c.city = 'San Jose';

--42.	Find all orders with above average amounts for their customers.
select *
from orders o1
where amt > (
      select avg(amt)
      from orders o
      where o1.cnum = o.cnum);
      
--43.	Write a query that selects the highest rating in each city.
select city, max(rating)
from customers
group by city;

--44.	Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.
select distinct s.sname, o.onum, o.amt, (o.amt * s.comm) as commission
from orders o
join customers c
on o.cnum = c.cnum
join salespeople s
on c.snum = s.snum
where c.rating > 100;

--45.	Count the customers with rating above San Jose’s average.
select count(*)
from customers
where rating > (
      select avg(rating) from customers
      where city = 'San Jose');

--46.	Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.
 select  s.sname,  s2.sname from salespeople s 
 self join salespeople s2

--47.	Find all salespeople that are located in either Barcelona or London.
select * from salespeople
--where city in ('Barcelona' ,'London');
where city = 'Barcelona' or city = 'London'

--48.	Find all salespeople with only one customer.
select s.*  
from salespeople s
join customers c
on s.snum = c.snum
group by s.snum, s.sname, s.comm, s.city
having count(c.cnum) = 1;

--49.	Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.
select c1.cname, c2.cname, c1.snum
from customers c1
join customers c2
on c1.snum = c2.snum
and c1.cnum < c2.cnum

--50.	Write a query that will give you all orders for more than $1000.00
select * from orders
where amt > 1000

--51.	Write a query that lists each order number followed by the name of the customer who made that order.
select o.onum , c.cname
from orders o
join customers c
on o.cnum = c.cnum

--52.	Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, one using a join and one a correlated subquery. Which solution is more elegant
select distinct s.snum, s.sname, c.city
from salespeople s
join customers c
on s.city = c.city
and s.snum <> c.snum;

select s.snum , s.sname
from salespeople s
where exists (select 1 from customers c
             where c.city = s.city
              and c.snum <> s.snum);
      
--53.	Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.
select cname, rating from customers 
where rating = any (select rating  from customers 
           where cname = 'Serres');     

--54.	Write2 queries that will produce all orders taken on October3 or October 4.            
select * from orders
where odate in (to_date('03-oct-96', 'DD-MM-YYYY'),
                to_date('04-oct-96', 'DD-MM-YYYY'));     --(not work)
                
--55.	Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates. 
select distinct c.cname, o1.onum, o2.onum
from orders o1
join orders o2
on o1.cnum = o2.cnum
and o1.onum < o2.onum
join customers c
on o1.cnum = c.cnum;

--56.	Find only those customers whose ratings are higher than every customer in Rome.
select cname, rating, city from customers
where rating > all (select rating from customers
                      where city = 'Rome');
                      
--57.	Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome. 
select cname, rating, city from customers
where rating >= 100
      and city = 'Rome'

--58.	Find all rows from the Customer table for which the salesperson number is 1001.
select * from customers c
join salespeople s
on c.snum = s.snum
where s.snum = 1001;

select * from customers
where snum = 1001;

--59.Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.
select snum, sum(amt) total_amt
from orders
group by snum
having sum(amt) > (
                  select max(amt) from orders);

--60.	Write a query that selects all orders that have Zeroes or NULL in the Amount field.
select * from orders
where amt is null;             

--61.	Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200.
select s.sname, c.cname
from salespeople s
join customers c
on s.sname < c.cname
where c.rating < 200;

--62.	List all salespeople’s names and the commission they have earned
select sname, comm from salespeople

--63.	Write a query that produces the names and cities of all customers with the same rating as Hoffman. 
--Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.
select cname, city 
from customers
where rating = ( select rating
                 from customers
                 where cnum = (
                       select cnum  
                        from customers
                         where cname = 'Hoffman'));

--64.	Find all salespeople for whom there are customers that follow them in alphabetical order.
select distinct s.sname
from salespeople s
join customers c
on c.cname > s.sname;

--65.	Write a query that produces the names and ratings of all customers of all who have above average orders.
select c.cname, c.rating
from customers c
join orders o
on c.cnum = o.cnum
where o.amt > (select avg(amt)
              from orders);   

--66.	Find the sum of all purchases from the Orders table.
select sum(amt) as total_purchases
from orders;

--67.	Write a select command that produces the order number, amount, and date for all rows in the Order table.
select onum, amt, odate from orders;

--68.	Count the number of not null rating fields in the Customer table including duplicates.
select count(rating)
from customers;

--69.	Write a query that gives the names of both the salesperson and the customer for each order after the order number.
select o.onum, s.sname, c.cname 
from orders o
inner join salespeople s
on o.snum = s.snum
join customers c
on o.cnum = c.cnum;

--70.	List the commissions of all salespeople servicing customers in London.
select  s.comm
from salespeople s
join customers c
on s.snum = c.snum
where c.city = 'London';

--71.	Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
select s.sname
from salespeople s
where s.city <> all (
                          select c.city
                          from customers c
                          where c.snum = s.snum);
                          
--72.	Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.
select sname 
from salespeople s
where exists( select 1
              from customers c
              where c.city = s.city
              and c.snum <> s.snum);

--73.	Write a query that selects all customers serviced by Peel or Motika.
select c.cname
from customers c
join salespeople s
on c.snum = s.snum
where s.sname in ('Peel', 'Motika')

select *
from customers 
where snum in (
                 select snum
                 from salespeople
                 where sname = 'Peel' 
                 or sname = 'Motika');

--74.	Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should be counted only once.).
select o.odate, count(distinct o.snum)  
from orders o 
group by o.odate; 

--75.	Find all orders attributed to salespeople in London.
select * 
from orders o
inner join salespeople s
on o.snum = s.snum
where s.city = 'London';

--76.	Find all orders by customers not located in the same cities as their salespeople.
select o.*
from orders o
inner join salespeople s
on o.snum = s.snum
join customers c
on o.cnum = c.cnum
where s.city <> c.city

--77.	Find all salespeople who have customers with more than one current order.
select s.snum ,s.sname, count(o.onum)
from salespeople s
join orders o
on s.snum = o.snum
group by s.snum, s.sname
having count(o.onum) > 1;

--78.	Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has at least one other customer (besides the customer being selected) with orders in the Orders table.
select * from customers c1
where exists (
              select 1 from customers c2
              join orders o
              on c2.cnum = o.cnum
              where c2.snum = c1.snum
              and c2.cnum <> c1.cnum);
            
--79.	Write a query that selects all customers whose name begins with ‘C’.
select * from customers
where cname like 'C%';

---80.	Write a query on the Customers table that will find the highest rating in each city. Put the output in this form:  for the city (city) the highest rating is : (rating).
select 'for the city' ||city||  ', the highest rating is:', max(rating) as rating
from customers
group by city

--81.	Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats
select snum
from orders
group by snum;

select distinct snum
from orders;

--82.	Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customers’ names and numbers.
select rating, cname, cnum
from customers
order by rating desc;

--83.	Find the average commission for salespeople in London.
select round(avg(comm), 2) from salespeople
where city = 'London';

select avg(comm) from salespeople
where city = 'London';

--84.	Find all orders credited to the same salesperson that services Hoffma
select * from orders
where snum = (
              select snum
              from customers
              where cname = 'Hoffman');

--85.	Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.
select * from salespeople
where comm between 0.10 and 0.12;

--86.	Write a query that will give you the names and cities of all salespeople in London with commission above 0.10
select sname, city from salespeople
where city = 'London'
and  comm > 0.10;

--87.	What will be the output from the following query? 
SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = 10/03/1996 AND CNUM > 2003));

--88.	Write a query that selects each customer’s smallest order.
select c.cnum, c.cname, min(o.amt)
from customers c
join orders o
on c.cnum = o.cnum
group by c.cnum, c.cname;

--89.	Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.
select * from customers
where cname like 'G%'
order by cname

--90.	Write a query that counts the number of different not NULL city values in the Customers table.
select count(distinct city) from customers;

--91.	Find the average amount from the Orders table.
select round(avg(amt),3) from orders;

--92.	What would be the output from the following query?
SELECT*FROM ORDERS 
WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);

--93.	Find all customers who are not located in San Jose & whose rating is above 200.
select * from customers
where rating > 200
and cname <> 'San Jose';

--94.	Give a simpler way to write this query:
SELECT Snum, Sname, city, Comm FROM salespeople 
WHERE (Comm>0.12 and Comm <0.14);

--95.	Evaluate the following query:
SELECT * FROM orders 
WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);

--96.	Which salespeople attend to customers not in the city they have been assigned to?
select s.sname 
from salespeople s
join Customers c
on s.snum = c.snum
where s.city <> c.city;

--97.	Which salespeople get commission greater than 0.11 and serving customers rated less than 250?
select distinct sname 
from salespeople s
join customers c
on s.snum = c.snum
where comm > 0.11
and rating < 250;

--98.	Which salespeople have been assigned to the same city but get different commission percentages?
select s.sname 
from salespeople s
join salespeople s1
on s.city = s1.city
and s.comm <> s1.comm
and s.snum <> s1.snum;

--99.	Which salesperson has earned the most by way of commission?
select s.sname
from salespeople s
join orders o
on s.snum = o.snum
group by s.sname
order by sum(o.amt* s.comm) desc

--100.	Does the customer who has placed the maximum number of orders have the maximum rating?

--101.	Has the customer who has spent the largest amount of money been given the highest rating?

--102. List all customers in descending order of customer rating.
select * from customers
order by rating desc;

--103.	On which days has Hoffman placed orders?
select distinct o.odate
from orders o 
join customers c
on o.cnum = c.cnum
where c.cname = 'Hoffman';

--104.	Do all salespeople have different commissions?
select 
case
  when count(distinct comm) = count(*)
  then 'yes'
  else 'no'
end as answer
from salespeople;

--105.	Which salespeople have no orders between 10/03/1996 and 10/05/1996?
select s.sname
from salespeople s
left join orders o
on s.snum = o.snum
and o.odate between to_date ('1996-10-03','YYYY-MM-DD') 
            and to_date ('1996-10-05', 'YYYY-MM-DD')
where o.onum is null;

--106.	How many salespersons have succeeded in getting orders?
select count(distinct snum) as total_salespersons
from orders;

select count(distinct s.snum) as total_salespersons
from salespeople s
join orders o
on s.snum = o.snum;

--107.	How many customers have placed orders?
select count(distinct cnum) as total_customers
from orders;

--108.	On which date has each salesperson booked an order of maximum value?
select sname, odate, amt
from (
       select s.sname, o.odate, o.amt,
       rank() over(partition by s.snum order by o.amt desc) as rnk
       from salespeople s
       join orders o 
       on s.snum = o.snum)
where rnk = 1;

--109.	Who is the most successful salesperson?
select s.sname, sum(o.amt) as total_sum
from salespeople s
join orders o
on s.snum = o.snum
group by s.sname
order by total_sum desc

--110.	Who is the worst customer with respect to the company?
select cname
from (
     select c.cname, sum(o.amt),
     dense_rank() over(order by sum(o.amt)) as rnk
     from customers c
     join orders o
     on c.cnum = o.cnum
     group by c.cname)
where rnk = 1;

--111.	Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?

--112.	Which customers have the same rating?
select cname, rating
from customers
where rating in (
                        select rating
                        from customers
                        group by rating
                        having count(*) > 1)
order by rating, cname;

--113.	Find all orders greater than the average for October 4th.
select *
from orders
where amt > (
             select avg(amt)
             from orders
             where odate = to_date('1996-10-04', 'YYYY-MM-DD'));
             
--114.	Which customers have above average orders?
select distinct c.cname, o.amt
from customers c
join orders o
on c.cnum = o.cnum
where o.amt > (  select avg(amt) as avg_amt
from orders)
order by c.cname, o.amt desc;

--115.	List all customers with ratings above San Jose’s average.
select cname, rating, city
from customers
where rating > (
                 select avg(rating) 
                 from customers
                 where city = 'San Jose');

--116.	Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.

select s.sname, sum(o.amt)
from salespeople s
join orders o
on s.snum = o.snum
group by s.sname
having sum(o.amt) > (
                       select max(amt) from orders);
                       
--117.	Give names and numbers of all salesperson that have more than one customer.
select s.snum, s.sname
from salespeople s
join (select snum
      from orders
      group by snum
      having count(distinct cnum) > 1 ) o
      on s.snum = o.snum  
      
--118.	Select all salesperson by name and numbers who have customers in their city whom they don’s the service.
select distinct s.snum, s.sname
from salespeople s
join customers c
on s.city = c.city
where not exists(
                 select 1
                 from orders o
                 where o.snum = s.snum
                 and o.cnum = c.cnum)
                 
--119.	Which customers’ rating should be lowered?
select c.cname, c.rating
from customers c
join orders o
on  c.cnum = o.cnum
group by c.cname, c.rating
having sum(o.amt) < (
                      select avg(amt)
                      from orders);

--120.	Is there a case for assigning a salesperson to Berlin?
select count(*)
from customers c
where c.city = 'Berlin'
and not exists (
    select 1
    from orders o
    where o.cnum = c.cnum);   

--121.	Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?
select s.sname, s.comm, sum(o.amt) total_amt
from salespeople s
join orders o
on s.snum = o.snum
group by s.sname, s.comm
order by total_amt desc

--122.	Dose the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?

--123.	Which is the date, order number, amt and city for each salesperson (byname) for   the maximum order he has obtained?
select s.sname, o.onum, o.odate, o.amt, c.city
from salespeople s
join orders o
on s.snum = o.snum
join customers c
on o.cnum = c.cnum
where o.amt = (
              select max(o1.amt)
              from orders o1
              where o1.snum = s.snum)
              order by s.sname;

--124.	Which salesperson(s) should be fired?
select s.snum, s.sname
from salespeople s
left join orders o
on s.snum = o.snum
group by s.snum, s.sname
having sum(o.amt) is null or sum(o.amt) = 0;

--125.	What is the total income for the company? 
select sum(amt) from orders;
        


                





















                
               
                
