-- 1.  Write create table syntax for employee table and Incentive table.

create table employee(
emp_id number,
first_name varchar(10),
last_name varchar(10),
salary number
joinnig_date varchar(10),
department varchar2(10)
);
select * from employee;

create table incentives(
employee_ref_id number,
incentive_date varchar(10),
incentive_amount number
);
select * from incentives;

-- 2.Write syntax forinsert data into table of employee table and Incentive table
insert into employee values(1, 'John', 'Abraham', 1000000, to_date('01-JAN-13', 'dd-mm-yyyy'), 'Banking');
insert into employee values(2, 'Michael', 'Clarke', 800000, to_date('01-JAN-13', 'dd-mm-yyyy'), 'Insurance');
insert into employee values(3, 'Roy', 'Thomas', 700000, to_date('01-JAN-13', 'dd-mm-yyyy'), 'Banking');
insert into employee values(4, 'Tom', 'Jose', 600000, to_date('01-FEB-13', 'dd-mm-yyyy'), 'Insurance');
insert into employee values(5, 'Jerry', 'Pinto', 650000, to_date('01-FEB-13', 'dd-mm-yyyy'), 'Insurance');
insert into employee values(6, 'Philip', 'Mathew', 750000, to_date('01-JAN-13', 'dd-mm-yyyy'), 'Services');


insert into incentives values(1, to_date('01-Feb-13', 'dd-mon-yyyy'), 5000);
insert into incentives values(2, to_date('01-Feb-13', 'dd-mm-yyyy'), 3000);
insert into incentives values(3, to_date('01-Feb-13', 'dd-mm-yyyy'), 4000);
insert into incentives values(1, to_date('01-Jan-13', 'dd-mm-yyyy'), 4500);
insert into incentives values(2, to_date('01-Jan-13', 'dd-mm-yyyy'), 3500);
select * from incentives;


--3.	Get all employee details from the employee table
select * from employee;

--4.	Get First_Name,Last_Name from employee table
select first_name, last_name from employee;

--5.	Get First_Name from employee table using alias name  Employee Name 
select first_name as employee_name from employee;

--6.	Get First_Name from employee table in upper case
select upper(first_name) from employee;

--7.	Select first 3 characters of FIRST_NAME from EMPLOYEE
select substr(first_name, 1, 3) from employee;

--8.	Get position of 'o' in name 'John' from employee table
select instr(first_name, 'o') position_of_o from empl
where first_name = 'John';

--9.	Get FIRST_NAME from employee table after removing white spaces from right side.
select rtrim(first_name) from employee;

--10.	Get First_Name from employee table after replacing 'o' with '$'
select replace(first_name, 'o', '$') from employee;

--11.	Get First_Name and Last_Name as single column from employee table separated by a '_'
select first_name ||'_'|| last_name from employee;

--12.	Get FIRST_NAME, Joining year, Joining Month and Joining Date from employee table
select first_name,
extract (year from to_date(joinnig_date, 'dd-mm-yy')) as joining_year
extract (month from to_date(joinnig_date, 'dd-mm-yy')) as joinning_month
extract (day from to_date(joinnig_date, 'dd-mm-yyyy')) as joinning_date
from employee;

--13.	Get all employee details from the employee table order by First_Name Ascending
select * from employee
order by first_name asc;

--14.	Get all employee details from the employee table order by First_Name Ascending and Salary Descending?
select * from employee
order by first_name asc, salary desc;

--15.	Get employee details from employee table whose employee name is  John 
select * from employee
where first_name = 'John';

--16.	Get employee details from employee table whose employee name are  John  and  Roy 
select * from employee
where first_name =  'John'
      or first_name ='Roy';
      
--17.	Get employee details from employee table whose employee name are not  John  and  Roy .
select * from employee
where first_name not in ('John', 'Roy');

select * from employee
where first_name <> 'John'
and first_name <> 'Roy';

--18.	Get employee details= from employee table whose first name starts with 'J'.
select * from employee
where first_name like 'J%';

--19.	Get employee details from employee table whose first name contains 'o'.
select * from employee
where first_name like '%o%';

--20.	Get employee details from employee table whose first name ends with 'n'.
select * from employee
where first_name like '%n';

--21.	Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.
select * from employee
where first_name like '___n';

--22.	Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.
select * from employee
where first_name like 'J___';

--23.	Get employee details from employee table who s Salary greater than 600000.
select * from employee
where salary > 600000;

--24.	Get employee details from employee table whose joining year is  2013 .
select joinnig_date from employee
where extract(year from to_date(joinnig_date, 'dd-mm-yy')) = 2013;

--25.	Get employee details from employee table whose joining month is  January .
select * from employee
where extract(month from to_date( joinnig_date, 'dd-mm-yyyy')) = 1;

--26.	Get employee details from employee table who joined before January 1st 2013.
select * from employee
where joinnig_date < to_date('01-jan-2013', 'dd-mm-yyyy');

--27.	Get employee details from employee table who joined after January 31st
select * from employee
where joinnig_date > to_date('31-jan-13', 'dd-mon-yyyy');

--28.	Get Joining Date and Time from employee table
select to_timestamp(joinnig_date, 'dd-mm-yyyy hh24:mi:ss') from employee;

--29.	Get Joining Date, Time including milliseconds from employee table
select to_timestamp(joinnig_date, 'dd-mm-yyyy hh24:mi:ss.ff') from employee;

--30.	Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.

--31.	Get department, total salary with respect to a department from employee table.
select department, sum(salary) 
from employee
group by department;

--32.	Get department, total salary with respect to a department from employee table order by total salary descending.
select department, sum(salary) as total
from employee
group by department
order by total desc;

--33.	Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.
select department, count(department), sum(salary) total
from employee
group by department
order by total desc;

--34.	Get department wise average salary from employee table order by salary ascending?
select department, round(avg(salary), 2) avg_salary
from employee
group by department
order by avg_salary asc;

--35.	Get department wise maximum salary from employee table order by salary ascending?
select department, max(salary)
from employee
group by department
order by max(salary);

--36.	Get department wise minimum salary from employee table order by salary ascending?
select department, min(salary) as salary
from employee
group by department
order by salary asc;

--37.	Select no of employees joined with respect to year and month from employee table.
select extract(year from to_date(joinnig_date, 'dd-mm-yyyy'))as year,
       extract(month from to_date( joinnig_date, 'dd-mm-yyyy')) as month,
       count(*) as no_employee
from employee
group by 
      extract(year from to_date(joinnig_date, 'dd-mm-yyyy')),
      extract(month from to_date( joinnig_date, 'dd-mm-yyyy'))

--38.	Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
select department, sum(salary) as total_salary
from employee
group by department
having sum(salary) > 800000
order by total_salary desc;

--39.	Select employee details from employee table if data in incentive table?
select e.*
from employee e
inner join incentives i
on e.emp_id = i.employee_ref_id;

--40.	Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table
select emp_id, first_name, salary,
case
  when first_name = 'John' then salary * 0.2
  when first_name = 'Roy' then salary * 0.1
  else salary * 0.15
end as calculated_salary
from employee;

--41.	Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table.

--42.	Delete employee data from employee table who got incentives in incentive table
delete from employee
where emp_id in (
      select employee_ref_id
      from incentives
);

--43.	Select first_name, incentive amount from employee and incentives table for those employees who have incentives.
select e.first_name, i.Incentive_amount
from employee e
inner join incentives i
on e.emp_id = i.employee_ref_id;
+6+
--44.	Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
select e.first_name, i.incentive_amount 
from employee e
inner join incentives i 
on e.emp_id = i.employee_ref_id
where i.incentive_amount > 3000;

--45.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
select e.first_name, i.employee_ref_id, i.incentive_amount
from employee e
left join incentives i
on e.emp_id = i.Employee_ref_id;

/* 46.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount 
as 0 for those employees who didn't get incentives. */

select e.first_name, nvl(i.incentive_amount,0)
from employee e
left join incentives i
on e.emp_id = i. employee_ref_id

-- 47.	Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
select e.first_name, i.incentive_amount
from employee e
left join incentives i 
on e.emp_id = i.employee_ref_id
where i.incentive_amount is not null;

--48.	Select max incentive with respect to employee from employee and incentives table using sub query.
select e.first_name,(
       select max(i.incentive_amount)
       from incentives i
       where i.employee_ref_id = e.emp_id) as max_incentive
from employee e;


create view s71 as(select * from employee )

select * from s1












select e.first_name,(
       select max(i.incentive_amount)
       from incentives i
       where i.employee_ref_id = e.emp_id) as max_incentive
       
from employee e;
