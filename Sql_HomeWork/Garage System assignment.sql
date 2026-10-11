create table customer(
cid number primary key,
cname varchar2(15),
cadd varchar2(15),
c_contact varchar2(15),
c_credidays number,
cj_date date, 
sex varchar2(10));

select * from customer

insert into customer values(1001, 'Cyona Blake', 'NEW YORK', '1235684', 20, TO_DATE('20-Jan-11','DD-MON-YY'), 'FEMALE');

insert into customer values(1002, 'JOHN SMITH', 'NEW JERSI', '1341684', 20, TO_DATE('21-Feb-11','DD-MON-YY'), 'MALE');

insert into customer values(1003, 'JORDAN WOOD', 'PRAG', '1805184', 20, TO_DATE('22-Mar-11','DD-MON-YY'), 'MALE');

insert into customer values(1004, 'CHRISTNA', 'MANHATTON', '1125684', 31, TO_DATE('23-Apr-13','DD-MON-YY'), 'FEMALE');

insert into customer values(1005, 'TOM HILL', 'LONDON', '1239284', 10, TO_DATE('25-Jun-15','DD-MON-YY'), 'MALE');

insert into customer values(1006, 'KAMILA JOSEF', 'PARISE', '124568', 9, TO_DATE('28-Jul-11','DD-MON-YY'), 'FEMALE');

insert into customer values(1007, 'ANDRU SYMON', 'TAXES', '125654', 15, TO_DATE('01-Apr-16','DD-MON-YY'), 'MALE');

insert into customer values(1008, 'SANJU SAMSUNG', 'NEW YORK', '12346341', 4, TO_DATE('20-Jan-16','DD-MON-YY'), 'MALE');

-----------------------------------------------------------------------VENDORS--------------------------------------------------------------------

create table vendors(
vid number primary key,
vname varchar2(15),
vadd varchar2(15),
vcontact varchar2(15),
vcreditdays number,
vj_date date);

select * from vendors

insert into vendors values(2001, 'KIRAN PATIL', 'PUNE', '20535535', 20, TO_DATE('20-Jan-10','DD-MON-YY'));

insert into vendors values(2002, 'PRAKASH JAIN', 'MUMBAI', '2063564', 10, TO_DATE('05-Nov-11','DD-MON-YY'));

insert into vendors values(2003, 'SWAPNIL THETE', 'NASHIK', '25355352', 15, TO_DATE('18-Mar-10','DD-MON-YY'));

insert into vendors values(2004, 'AMOL SHENDE', 'SATARA', '23674776', 18, TO_DATE('07-Apr-15','DD-MON-YY'));

insert into vendors values(2005, 'KARAN SINTRE', 'BULDHANA', '256756', 30, TO_DATE('22-Apr-09','DD-MON-YY'));

insert into vendors values(2006, 'RAM KULKARNI', 'OSMANABAD', '20367454', 21, TO_DATE('09-Jul-10','DD-MON-YY'));

----------------------------------------------------------------- Employe -----------------------------------------------------

create table employe(
eid number primary key,
ename varchar2(15),
ejob varchar2(15),
eadd varchar2(15),
econtact varchar2(15),
esal number,
edoj date,
edol date); 

select * from employe

insert into employe values(3001,'STEVEN KING', 'PAINTER', 'NEW YORK', '10367454', 1200, TO_DATE('09-JUL-10', 'DD-MON-YY'), NULL);

insert into employe values(3002, 'DAVID AUSTIN', 'FITTER', 'MAN HATON', '10367434', 1100, TO_DATE('19-Aug-10','DD-MON-YY'), NULL);

insert into employe values(3003, 'BRUCE ERNST', 'MECHANIC', 'NEW JERCY', '10367264', 2200, TO_DATE('08-Sep-10','DD-MON-YY'), NULL);

insert into employe values(3004, 'LUIS POPP', 'MECHANIC', 'NEW JERCY', '10367264', 1700, TO_DATE('19-Oct-09','DD-MON-YY'),TO_DATE('06-Sep-10','DD-MON-YY'));

insert into employe values(3005, 'SHERI GOMES', 'FITTER', 'PARIS', '10327264', 1000,  TO_DATE('19-Oct-09','DD-MON-YY'), TO_DATE('01-Aug-10','DD-MON-YY'));

insert into employe values(3000, 'JAMES PHILLIP', 'FITTER', 'PARIS', '10322264', NULL, TO_DATE('01-Jan-08','DD-MON-YY'), NULL);

---------------------------------------------------------- Sparepart --------------------------------------------------------------

create table sparepart(
spid number primary key,
spname varchar2(50),
sprate number, 
spunit varchar2(15));

select * from sparepart;

insert into sparepart values(4001, 'TWO WHEELER TUBE', 250, 'NOS');

insert into sparepart values(4002, 'TWO WHEELER ENGINE OIL', 400, 'LTRS');

insert into sparepart values(4003, 'FOUR WHEELER ENGINE OIL', 5000, 'LTRS');

insert into sparepart values(4004, 'TWO WHEELER CARBORATOR', 680, 'NOS');

insert into sparepart values(4005, 'TWO WHEELER CLUTCH WIRE', 129, 'MTRS');

insert into sparepart values(4006, 'TWO WHEELER TAIL LIGHT', 100, 'NOS');

insert into sparepart values(4007, 'TWO WHEELER INDICATORS', 150, 'NOS');

insert into sparepart values(4008, 'FOUR WHEELER GASKIT', 1340, 'NOS');

insert into sparepart values(4009, 'WHITE COLOUR', 340, 'LTRS');
                       
insert into sparepart values(4010, 'BLACK COLOUR', 240, 'LTRS');

insert into sparepart values(4011, 'TWO WHEELER SIDE MIRROR', 250, 'NOS');

insert into sparepart values(4012, 'FOUR WHEELER SIDE MIRROR', 450, 'NOS');

insert into sparepart values(4013, 'TWO WHEELER SHOCKUP', 1320, 'PAIR');

insert into sparepart values(4014, 'FOUR WHEELER BUMPER', 6000, 'NOS');

insert into sparepart values(4015, 'FOUR WHEELER FRONT GLASS', 7000, 'PCS');

------------------------------------------------------------------- Purchase --------------------------------------------------------

create table purchase(
pid number primary key,
vid number,
foreign key(vid) references vendors(vid),
spid number,
foreign key(spid) references sparepart(spid),
pqty number,
sprate number,
spgst number,
pdate date,
trancost number,
total number, 
rcv_eid number,
foreign key(rcv_eid) references employe(eid));

select * from purchase;

insert into purchase values(5001, 2001, 4001, 10, 250, 350, TO_DATE('01-Jan-11','DD-MON-YY'), 1300, 4150, 3001);

insert into purchase values(5002, 2002, 4002, 4, 400, 288, TO_DATE('02-Mar-11','DD-MON-YY'), 100, 1988, 3001);

insert into purchase values(5003, 2003, 4004, 8, 680, 761.6, TO_DATE('12-Jun-11','DD-MON-YY'), 50, 6251.6, 3003);

insert into purchase values(5004, 2004, 4005, 10, 129, 154.8,  TO_DATE('22-Aug-11','DD-MON-YY'), 125, 1569.8, 3004);

insert into purchase values(5005, 2005, 4006, 20, 100, 300, TO_DATE('07-Sep-11','DD-MON-YY'), 20, 2320, 3003);

insert into purchase values(5006, 2006, 4007, 30, 150, 630, TO_DATE('12-Oct-11','DD-MON-YY'), 60, 5190, 3000);

insert into purchase values(5007, 2001, 4003, 20, 5000, 14000, TO_DATE('07-Sep-11','DD-MON-YY'), 1000, 115000, 3000);

insert into purchase values(5008, 2006, 4005, 1, 129, 15.48, TO_DATE('12-Oct-11','DD-MON-YY'), 50, 194.48, 3005);

insert into purchase values(5009, 2006, 4005, 1, 129, 15.48, TO_DATE('15-Oct-11','DD-MON-YY'), 50, 194.48, 3005);

insert into purchase values(5010, 2006, 4009, 5, 340, 238, TO_DATE('20-Oct-11','DD-MON-YY'), 0, 2938, 3005);

------------------------------------------------------------------ SER_DET ------------------------------------------------------
create table ser_det(
sid number primary key,
cid number,
foreign key(cid) references customer(cid),
eid number,
foreign key(eid) references employe(eid),
spid number,
foreign key(spid) references sparepart(spid),
typ_veh varchar(20),
veh_no varchar(20),
typ_ser varchar(20),
ser_date date,
qyt number,
sp_rate number,
sp_amt number,
sp_gst number, 
ser_amt number,
comm number,
total number);

select * from ser_det;

insert into ser_det values(6001, 1001, 3001, 4001, 'TWO WHEELER', 'MH15CA3228','TUBE DAMAGED', TO_DATE('02-Jan-11','DD-MON-YY'), 1, 250, 250, 35, 50, 0, 335);

insert into ser_det values(6002, 1002, 3002, 4002, 'TWO WHEELER', 'MH16US5713','FULL SERVICING', TO_DATE('04-Mar-11','DD-MON-YY'), 1, 400, 400, 52, 300, 50, 752);

insert into ser_det values(6003, 1003, 3004, 4005, 'TWO WHEELER', 'MH12PQ1313', 'CLUTCH WIRE', TO_DATE('22-Aug-11','DD-MON-YY'), 1, 129, 129, 0, 10, 0, 139);

insert into ser_det values(6004, 1002, 3002, 4002, 'TWO WHEELER', 'MH16US5713', 'FULL SERVICING', TO_DATE('05-May-11','DD-MON-YY'), 1, 400, 400, 52, 300, 50, 752);

insert into ser_det values(6005, 1004, 3001, 4009, 'TWO WHEELER', 'MH14PA335', 'COLOR', TO_DATE('21-Oct-11','DD-MON-YY'), 2.5, 340, 850, 119, 500, 150, 1469);

insert into ser_det values(6006, 1006, 3001, 4009, 'TWO WHEELER', 'MH12WE334', 'COLOR', TO_DATE('01-Dec-11','DD-MON-YY'), 2.5, 340, 850, 119, 500, 150, 1469);

insert into ser_det values(6007, 1007, 3001, 4001, 'FOUR WHEELER', 'MH17BB1345', 'TUBE DAMAGED', TO_DATE('01-Jan-12','DD-MON-YY'), 1, 250, 250, 35, 150, 0, 435);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1. List all the customers serviced.
select  distinct c.cid, cname
from customer c
join ser_det s
on c.cid = s.cid;

select c.cid, c.cname
from customer c
where exists(
              select 1
              from ser_det s
              where s.cid = c.cid);

--2. Customers who are not serviced.
select c.cid, c.cname
from customer c
left join ser_det s
on c.cid = s.cid
where s.cid is null;

select cid, cname
from customer
where cid not in( 
                  select cid
                  from ser_det);
                  
--3. Employees who have not received the commission.
select e.eid, e.ename
from employe e
where not exists(
                   select 1 from ser_det s
                   where s.eid = e.eid
                   and s.comm >0);

select distinct e.eid, e.ename
from employe e
left join ser_det s
on e.eid = s.eid
and s.comm > 0 
where s.eid is null;                  

--4 Name the employee who have maximum Commission.
select distinct e.eid, e.ename, max(s.comm) as comm
from employe e
inner join ser_det s
on e.eid = s.eid
group by  e.eid, e.ename
having max(s.comm) = ( select max(comm)
                from ser_det);
                
select distinct e.eid, e.ename, s.comm as max_comm
from employe e
inner join ser_det s
on e.eid = s.eid
where s.comm = (select max(comm)
                 from ser_det);
                 
--Q.5 Show employee name and minimum commission amount received by an employee.
select e.eid, e.ename, s.comm
from employe e
inner join ser_det s
on e.eid = s.eid
where s.comm = (select min(comm)
                 from ser_det
                 where comm > 0);
                 
select e.eid, e.ename, min(s.comm) as min_comm
from employe e
join ser_det s
on e.eid = s.eid
where s.comm > 0
group by e.eid, e.ename
having min(s.comm) = (
                       select min(comm)
                       from ser_det
                       where comm > 0);

--Q.6 Display the Middle record from any table.
select * from (
                select c.*, rownum rn
                from (
                       select *
                       from customer 
                       order by cid) c ) 
                       where rn in (4,5);
                       
--Q.7 Display last 4 records of any table.
select * from (select * from customer
order by cid desc)
where rownum <= 4 ; 

--Q.8 Count the number of records without count function from any table.
select max(rownum) as total_records
from ser_det;

--Q.9 Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).
delete from ser_det
where rowid not in ( select min(rowid)
                     from ser_det
                      group by cid);

--Q.10 Show the name of Customer who have paid maximum amount 
select c.cname, s.total
from customer c
join ser_det s
on c.cid = s.cid
where s.total = (select  max(total) from ser_det);

--Q.11 Display Employees who are not currently working.
select *
from employe
where edol is not null;

--Q.12 How many customers serviced their two wheelers.
select count(distinct cid)
from ser_det
where typ_veh = 'TWO WHEELER';

--Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.
select distinct p.spid, sp.spname, sp.spunit
from purchase p
join ser_det s
on p.spid = s.spid
join sparepart sp
on p.spid = sp.spid;

--Q.14 Customers who have Colored their vehicles.
select c.cname, c.cid
from customer c
join ser_det s
on c.cid = s.cid
where typ_ser = 'COLOR';

--Q.15 Find the annual income of each employee inclusive of Commission
select e.ename, (e.esal * nvl(s.comm,0)) as annual_income
from employe e
join ser_det s
on e.eid = s.eid
order by annual_income desc ;

--Q.16 Vendor Names who provides the engine oil.
select distinct v.vname, v.vid
from vendors v
join purchase p
on v.vid = p.vid
join sparepart sp
on sp.spid = p.spid
where sp.spname like '%ENGINE OIL%';

--Q.17 Total Cost to purchase the Color and name the color purchased.
select sp.spname as color_name, sum(p.total) as total_cost
from purchase  p
join sparepart sp
on p.spid = sp.spid
where sp.spname like '%COLOUR%'
group by sp.spname

--Q.18 Purchased Items which are not used in "Ser_det".
select sp.spname , sp.spunit
from purchase p
join sparepart sp
on p.spid = sp.spid
where p.spid not in (select spid 
                 from ser_det);
                 
--Q.19 Spare Parts Not Purchased but existing in Sparepart
select spid, spname, spunit
from sparepart
where spid not in (select spid from purchase);  

--Q.20 Calculate the Profit/Loss of the Firm. consider one month salary of each employee for Calculation.
select 
         (select sum(total) from ser_det)
         -(select sum(total) from purchase)
         -(select sum(esal) from employe)
         as profit_or_loss
         from dual;
         
--Q.21 Specify the names of customers who have serviced their vehicles more than one time.
select c.cid, c.cname, count(c.cid)
from customer c
join ser_det s
on c.cid = s.cid
group by c.cid, c.cname
having count(s.cid) > 1

--Q.22 List the Items purchased from vendors locationwise.
select distinct v.vadd as , s.spname
from vendors v
join purchase p
on v.vid = p.vid
join sparepart s
on p.spid = s.spid
order by v.vadd;

--Q.23 Display count of two wheeler and four wheeler from ser_details
select typ_veh, count(typ_veh) from ser_det
group by typ_veh;

--Q24 Display name of customers who paid highest SPGST and for which item 
select c.cname, s.spname, sd.sp_gst
from ser_det sd

join customer c
on sd.cid = c.cid

join sparepart s
on sd.spid = s.spid

where sd.sp_gst = (
                    select max(sp_gst) from ser_det);
                    
--Q25 Display vendors name who have charged highest SPGST rate  for which item
select v.vname, sp.spname, p.spgst
from purchase p
join vendors v
on p.vid = v.vid
join sparepart sp
on sp.spid = p.spid
where p.spgst = (select max(spgst) from purchase); 

--Q26 list name of item and employee name who have received item 
select  e.ename, sp.spname, p.rcv_eid
from purchase p
join sparepart sp
on p.spid = sp.spid
join employe e
on p.rcv_eid = e.eid

 --Q27 Display the Name and Vehicle Number of Customer who serviced his vehicle, And Name the Item used for Service, And specify the purchase date of that Item with his vendor and Item Unit and Location, And employee Name who serviced the vehicle. for Vehicle NUMBER "MH15CA3228".'
 select c.cname, sd.veh_no, sp.spname, p.pdate, v.vname, sp.spunit, v.vadd, e.ename
 from ser_det sd
 
 join customer c
 on sd.cid = c.cid
 
 join employe e
 on sd.eid = e.eid
 
 join sparepart sp
 on sd.spid = sp.spid
 
 join purchase p
 on sp.spid = p.spid
 
 join vendors v
 on p.vid = v.vid

where sd.veh_no = 'MH15CA3228';

--Q28 who belong this vehicle  MH-MH15CA3228" Display the customer name 
select c.cname 
from customer c 
join ser_det sd
on c.cid = sd.cid
where sd.veh_no = 'MH15CA3228';

--Q29 Display the name of customer who belongs to New York and when he /she service their  vehicle on which date    
select c.cname, sd.ser_date
from ser_det sd
join customer c
on sd.cid = c.cid
where c.cadd = 'New York';

--Q 30 from whom we have purchased items having maximum cost?
select v.vname
from purchase p
join vendors v
on p.vid = v.vid
where p.total = (select max(total) from purchase);

--Q31 Display the names of employees who are not working as Mechanic and that employee done services   .
select distinct e.ename
from employe e
join ser_det sd
on e.eid = sd.eid
where ejob <> 'MECHANIC'

--Q32 Display the various jobs along with total number of employees in each job. The output should
--contain only those jobs with more than two employees.
select ejob, count(*)  
from employe
group by ejob
having count(*) > 2

--Q33 Display the details of employees who done service  and give them rank according to their no. of services .
select e.eid, e.ename, e.ejob , count(sd.sid),
       rank() over(order by count(sd.sid)) as rnk
from employe e
join ser_det sd
on e.eid = sd.eid
group by e.eid, e.ename, e.ejob

--Q 34 Display those employees who are working as Painter and fitter and who provide service and total count of service done by fitter and painter  
select e.ename, e.ejob, count(sd.sid) as services
from employe e
join ser_det sd
on e.eid = sd.eid
where e.ejob in  ('PAINTER', 'FITTER')
group by e.ename, e.ejob

--Q35 Display employee salary and as per highest  salary provide Grade to employee 
select ename, nvl(esal,0),
case
  when esal <= 1200 then 'C'
  when esal <=  1700 then 'B'
  when esal <= 2500 then 'A'
  else 'N/A'
end as salary_anum
from employe;    


select ename, nvl(esal,0),
case
  when esal between 1000 and 1200 then 'C'
  when esal between 1300 and 1700 then 'B'
  when esal between 1800 and 2500 then 'A'
  else 'N/A'
end as salary_anum
from employe; 
  
--Q36  display the 4th record of emp table without using group by and rowid
select * from (
               select e.*,
               dense_rank() over(order by eid) as rnk
               from employe e)
where rnk = 4  
           

select * from (
               select e.*,
               row_number() over(order by eid) as rnk
               from employe e)
where rnk = 4 

--Q37 Provide a commission 100 to employees who are not earning any commission.
update ser_det
set comm = 100
where comm is null 
or comm = 0;

--Q38 write a query that totals no. of services  for each day and place the results
--in descending order
select p.pdate, count(sd.sid) services
from ser_det sd
join purchase p
on sd.spid = p.spid
group by p.pdate

--Q39 Display the service details of those customer who belong from same city 
select sd.* , c1.cadd
from ser_det sd
join customer c1
on sd.cid = c1.cid
join customer c2
on c1.cadd = c2.cadd

--Q40 write a query join customers table to itself to find all pairs of
--customers service by a single employee
select c1.cname, c2.cname, sd1.eid
from ser_det sd1
join ser_det sd2
on sd1.eid = sd2.eid
and sd1.cid < sd2.cid
join customer c1
on sd1.cid = c1.cid
join customer c2
on sd2.cid = c2.cid;

--Q41 List each service number follow by name of the customer who made  that service
select sd.sid, c.cname,s.spname, count(sd.sid) service
from ser_det sd
join customer c
on sd.cid = c.cid
join sparepart s
on sd.spid = s.spid
group by sd.sid, c.cname, s.spname;

select sd.sid,
       c.cname
from ser_det sd
join customer c
on sd.cid = c.cid;


--Q42 Write a query to get details of employee and provide rating on basis of  maximum services provide by employee  .Note (rating should be like A,B,C,D)
select e.eid,e.ename, e.ejob, sd.sp_rate,count(sd.sid) max_services,
case
  when count(sd.sid) >= 5 then 'A'
  when count(sd.sid) >= 3 then 'B'
  when count(sd.sid) >= 1 then 'C'
  else 'D'
end    
from employe e
left join ser_det sd
on e.eid = sd.eid
group by e.eid,e.ename, e.ejob, sd.sp_rate


--Q43 Write a query to get maximum service amount of each customer with their customer details ?
select  c.cid, c.cname, c.cadd, c.c_contact, max(sd.ser_amt) max_ser_amt
from customer c
left join ser_det sd
on c.cid = sd.cid
group by  c.cid, c.cname, c.cadd, c.c_contact

--Q44 Get the details of customers with his total no of services ?
select c.cname, count(sd.sid) total_services
from customer c
join ser_det sd
on c.cid = sd.cid
group by c.cname

--Q45 From which location sparpart purchased  with highest cost ?
select v.vadd as location
from purchase p
join vendors v
on p.vid = v.vid
where p.total = (select max(total) from purchase);

--Q46 Get the details of employee with their service details who has salary is null
select e.*, sd.*
from employe e
left join ser_det sd
on e.eid = sd.eid
where e.esal is null;

--Q47 find the sum of purchase location wise 
select v.vadd location, sum(p.total) sum
from vendors v
join purchase p
on v.vid = p.vid
group by v.vadd

--Q48 write a query sum of purchase amount in word location wise ?
select v.vadd location, sum(p.total) max, number_to_words(sum(p.total))
from vendors v
join purchase p
on v.vid = p.vid
group by v.vadd;                (-- Not Working --)

--Q49 Has the customer who has spent the largest amount money has been give highest rating
select c.cname, sum(sd.ser_amt) total_spent, sd.sp_rate
from customer c
join ser_det sd
on c.cid = sd.cid
group by c.cname, sd.sp_rate
order by total_spent desc;

--Q50 select the total amount in service for each customer for which the total is greater than the amount of the largest service amount in the table
select c.cname, sum(sd.total) total
from customer c
join ser_det sd
on c.cid = sd.cid
group by c.cname
having sum(sd.total) > (select max(ser_amt) from ser_det);

--Q51  List the customer name and sparepart name used for their vehicle and  vehicle type
select c.cname, sp.spname, sd.typ_veh
from customer c
join ser_det sd
on c.cid = sd.cid
join sparepart sp
on sd.spid = sp.spid

--Q52 Write a query to get spname ,ename,cname quantity ,rate ,service amount for record exist in service table 
select sp.spname, e.ename, c.cname, sd.qyt, sd.sp_rate, sd.ser_amt
from ser_det sd
join sparepart sp
on sd.spid = sp.spid
join employe e
on sd.eid = e.eid
join customer c
on sd.cid = c.cid;

--Q53 specify the vehicles owners who’s tube damaged.
select c.cname vehicale_owner
from customer c
join ser_det sd
on c.cid = sd.cid
where typ_ser = 'TUBE DAMAGED';

--Q.54 Specify the details who have taken full service.
select DISTINCT c.cname, e.ename
from customer c
join ser_det sd
on c.cid = sd.cid
join employe e
on sd.eid = e.eid
where typ_ser = 'FULL SERVICING';

--Q.55 Select the employees who have not worked yet and left the job.
select * from employe e
where edol is not null
and not exists ( select 1 from ser_det sd
                 where sd.eid = e.eid);
                 
--using (Not In)
select * from employe e
where edol is not null
and eid not in (select eid from ser_det);

--Q.56  Select employee who have worked first ever.
select e.eid, e.ename, sd.ser_date
from employe e
join ser_det sd
on e.eid = sd.eid
where sd.ser_date = ( 
                       select min(ser_date) from ser_det);

--Q.57 Display all records falling in odd date
select * from ser_det
where mod(to_number(to_char(ser_date, 'dd')), 2) = 1

--Q.58 Display all records falling in even date
select * from ser_det
where mod(to_number(to_char(ser_date, 'dd')), 2) = 0;

--Q.59 Display the vendors whose material is not yet used.
select distinct v.vname
from vendors v
join purchase p
on v.vid = p.vid
where p.spid not in ( select distinct spid from ser_det);

--Q.60 Difference between purchase date and used date of spare part.
select p.spid, sp.spname, p.pdate, sd.ser_date,
(sd.ser_date - p.pdate) days_difference
from purchase p
join ser_det sd
on p.spid = sd.spid
join sparepart sp
on p.spid = sp.spid;



                   

 


             














              
                       
                       
















