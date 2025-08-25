#create new data base
create database employee25;
use employee25;
#create employee table with primary key?
create table employee_table
(
employee_id int primary key,
first_name varchar(50),
age int(20),
department varchar(50),
joined_date date
);
#insert sample data into table?
insert into employee_table values(124,"gita",25,"it",'2021-6-25');
insert into employee_table values(256,"geeta",36,"it",'2025-2-7');
insert into employee_table values('234',"sita",34,"nonit",'2020-4-2');
#write a query to create a clone of an exixting table using create command?
#write a query to get all the details of employee table?
select*from employee_table;
#select only top 1 record from employee table?
select*from employee_table order by employee_id desc limit 1;
#select only bottom 1 record from employee table?
select*from employee_table order by employee_id limit 1;
select*from employee_table;
#how to select a random record for a table;
select *from employee_table
order by rand()
limit 1;
#write a query to get upper case as first_name_upper?
describe table tbl_emp_detail_data;
select*from tbl_emp_detail_data;
select upper(first_name) from tbl_emp_detail_data;
#write a query to get lower case as first_name_upper?
select lower(first_name) from tbl_emp_detail_data;
#create a new column with combning first name and last name as full name?
select concat(' ','first_name','last_name') as fullname from tbl_emp_detail_data;
#add hello to first_name and display result
select concat ('hello'," ",first_name)from tbl_emp_detail_data;
/*1.select the employee details of
whose first_name is malli*/
select *from tbl_emp_detail_data;
select * from tbl_emp_detail_data
where first_name='malli';
/*2.whose first name present in malli meena anjali*/
select *from tbl_emp_detail_data
where first_name in("malli","meena","anjali");
/*3.whose first name not present in malli meen anjali*/
select *from tbl_emp_detail_data
where first_name not in ("malli","meena","anjali");
/*4.whose first _name starts with v*/
select *from tbl_emp_detail_data
where first_name like "v%";
/*5.whose first_name ends with i*/
select*from tbl_emp_detail_data
where first_name like"%i";
/*6whose first_name contains o*/
select * from tbl_emp_detail_data
where first_name like "%o%";
/*7.whose firstname starts with any single charachter between m&v*/
select * from tbl_emp_detail_data;
select*from tbl_emp_detail_data
where first_name like "%m_v%";
/*8.whose firstname not in between m and v*/
select* from tbl_emp_detail_data
where first_name not like "%m_v%";
/*9.whose firstname starts with m and contain 5 letters*/
select * from tbl_emp_detail_data
where first_name like"m____%";
/*10.write a query to get all unique values of the department from employee table*/
select department from tbl_emp_detail_data
group by department;
/*11.query to check the totalrecords in a table*/
select count(*) from tbl_emp_detail_data;
/*12.write query to print first letter of name in upper and all other letters in lower*/
select concat(upper(left(first_name,1)),lcase(substring(first_name,2)))from tbl_emp_detail_data;
/* 13.write employee details to display all employee name in one cell seperated by ,
select group_concat(first_name separator',') as all_names from tbl_emp_detail_data;
# /*14.Query to get the below values of "salary" from employee table
#Lowest salary
#Highest salary
#Average salary
#Highest salary - Lowest salary as diff_salary
#format: 10.5%) */
select*from tbl_emp_detail_data;
select salary from tbl_emp_detail_data
order by salary desc limit 1;
select salary from tbl_emp_detail_data
order by salary asc limit 1;
select round(avg(salary),2) from tbl_emp_detail_data;
select abs(max(salary)-min(salary) )as diff_salary from tbl_emp_detail_data;
select concat(round(abs(min(salary)-max(salary))/100,2),'%') from tbl_emp_detail_data;
/*15. Select “first_name” from the employee table after removing white spaces from
Right side spaces
Left side spaces
Both right & left side spaces
*/
select rtrim(first_name) as right_sidespaces,ltrim(first_name) as left_sidespaces,trim(first_name)as both_right_left_side from tbl_emp_detail_data;
# 16. Query to check no.of records present in a table where employees having 50k salary.
select count(*) as total_numberofrecords from tbl_emp_detail_data
where salary>50000;
#17. Find the most recently hired employee in each department.
select * from tbl_emp_detail_data 
where joining_date in (select max(joining_date)from tbl_emp_detail_data group by department)limit 1;
#case when then end queiries
#1.Display first_name and gender as M/F.(if male then M, if Female then F)
select first_name, gender,
case 
when gender = 'male' then  "m"
else 'f'
end as gend from tbl_emp_detail_data;
/* 2.Display first_name, salary, and a salary category. (If salary is below 50,000, categorize as 'Low'; between 50,000 and 60,000 as 'Medium'; 
above 60,000 as 'High')*/
select first_name,salary,
case
when salary<50000 then 'low'
when salary between 50000 and 60000 then 'medium'
else ' high'
end as salarycategory from tbl_emp_detail_data;
/*3.Display first_name, department, and a department classification. (If department is
'IT', display 'Technical'; if 'HR', display 'Human Resources'; if 'Finance', display
'Accounting'; otherwise, display 'Other')
*/
select first_name,department,
case
when department='it' then 'technical'
when department='hr' then 'human resources'
when department='finance' then 'accounting'
else 'other'
end as departmentclassification from tbl_emp_detail_data;
/*4.Display first_name, salary, and eligibility for a salary raise. (If salary is less than
50,000, mark as 'Eligible for Raise'; otherwise, 'Not Eligible')*/
select first_name,salary,
case
when salary<50000 then 'eligible'
else 'not eligible'
end as eligibility from tbl_emp_detail_data;
/*5.Display first_name, joining_date, and employment status. (If joining date is before
'2022-01-01', mark as 'Experienced'; otherwise, 'New Hire')*/
select first_name,joining_date,
case when joining_date<'2022-01-01' then 'expirienced'
else 'newhire'
end as employementstatus from tbl_emp_detail_data;

/*6.Display first_name, salary, and bonus amount. (If salary is above 60,000, add10%
bonus; if between 50,000 and 60,000, add 7%; otherwise, 5%)*/
select first_name,salary,
case when salary>60000 then '10%'
when salary between 50000 and 60000 then' 7%'
else '5%'
end as bonuspercentage from tbl_emp_detail_data;
/*7.Display first_name, salary, and seniority level. (If salary is greater than 60,000, classify as 'Senior'; between 50,000 and 60,000 as
'Mid-Level'; below 50,000 as 'Junior')*/
select first_name,salary,
case when salary > 60000 then 'senior'
when salary between 50000 and 60000 then 'midlevel'
else 'junior'
end as senioritylevel from tbl_emp_detail_data;
/*8.Display first_name, department, and job level for IT employees. (If department is 'IT'
and salary is greater than 55,000, mark as 'Senior IT Employee'; otherwise, 'Other').*/
select first_name,department,
case when department='it' and salary>55000 then 'senior it employee'
else 'other'
end as joblevlforitlevel from tbl_emp_detail_data;
/*9.Display first_name, joining_date, and recent joiner status. (If an employee joined
after '2024-01-01', label as 'Recent Joiner'; otherwise, 'Long-Term Employee')*/
select first_name,joining_date,
case when joining_date>='2024-01-01' then 'recent joiner'
else 'longterm employee'
end as recentjoinerstatus from  tbl_emp_detail_data;
/*10.Display first_name, joining_date, and leave entitlement. (If joined before '2021-01-
01', assign '10 Days Leave'; between '2021-01-01' and '2023-01-01', assign '20 Days
Leave'; otherwise, '25 Days Leave')
*/
select first_name,joining_date,
case when joining_date< '202-01-01' then '10days leave'
when joining_date between '2021-01-01' and '2023-01-01' then '20 days'
else '25 days'
end as 'leave entitlement' from tbl_emp_detail_data;
/*11.. Display first_name, salary, department, and promotion eligibility. (If salary is above
60,000 and department is 'IT', mark as 'Promotion Eligible'; otherwise, 'Not Eligible')*/
select first_name,salary,department,
case when salary>60000 then 'department it' and 'promotion eligible'
else 'not eligible'
end as 'promotion eligibility' from tbl_emp_detail_data;
/*12.Display first_name, salary, and overtime pay eligibility. (If salary is below 50,000,
mark as 'Eligible for Overtime Pay'; otherwise, 'Not Eligible') */
select first_name,salary,
case when salary<50000 then 'eligible'
else 'not eligible'
end as' overtime pay eligibility' from tbl_emp_detail_data;
/*13. Display first_name, department, salary, and job title. (If department is 'HR' and salary
is above 60,000, mark as 'HR Executive'; if department is 'Finance' and salary is above
55,000, mark as 'Finance Manager'; otherwise, 'Regular Employee') */
select first_name,department,salary,
case when department ='hr' and salary>60000 then 'hr executive'
when department='finance' and salary>55000 then' finance manager'
else 'regular employee' 
end as 'job title' from tbl_emp_detail_data;
/*14.Display first_name, salary, and salary comparison to the company average. (If salary is
above the company’s average salary, mark as 'Above Average'; otherwise, 'Below
Average') */
select first_name,salary,
case when salary>(select avg(salary) from tbl_emp_detail_data )then 'above average'
else 'below average'
end as 'salary comparision'from tbl_emp_detail_data;
#group by
/*1.Write the query to get the department and department wise total(sum) salary,
display it in ascending and descending order according to salary.*/
select department,sum(salary) as total_sum_of_salary from tbl_emp_detail_data
group by department
order by sum(salary);
select department,sum(salary)as total_sum_of_salary from tbl_emp_detail_data
group by department
order by sum(salary) desc;
select department,sum(salary) as total_sum_of_salary from tbl_emp_detail_data
group by department
order by sum(salary) asc;
#2.Write down the query to fetch Project name assign to more than one Employee
select project_name from project 
group by project_name
having count(emp_id_no)>1;
/*3.Write the query to get the department, total no. of departments, total(sum) salary
with respect to department from "employee table" table.*/
select department,count(department) as total_count_of_department,sum(salary) as total_salary from tbl_emp_detail_data
group by department;
/*4.Get the department-wise salary details from the "employee table" table:
What is the average salary? (Order by salary ascending)
What is the maximum salary? (Order by salary ascending)*/
select department,salary,avg(salary) as average_salary,max(salary)as maximum_salary from tbl_emp_detail_data
group by department
order by avg(salary) asc;
/*5. Display department-wise employee count and categorize based on size. (If a department
has more than 5 employees, label it as 'Large'; between 3 and 5 as 'Medium'; otherwise, 'Small')*/
select department,count(emp_id)as employee_count,
case when count(emp_id)>5 then 'large'
when count(emp_id)between 3 and 5 then 'medium'
else 'small'
end as 'categorise based on size' from tbl_emp_detail_data
group by department;
/*6.Display department-wise average salary and classify pay levels. (If the average salary in a
department is above 60,000, label it as 'High Pay'; between 50,000 and 60,000
as 'Medium Pay'; otherwise, 'Low Pay').*/
select department,round(avg(salary),2) ,
case when avg(salary)>60000 then 'high pay'
when avg(salary)between 50000 and 60000 then'medium pay'
else 'low pay'
end as 'paylevels' from tbl_emp_detail_data
group by department;

/*7. Display department, gender, and count of employees in each category. (Group by
department and gender, showing total employees in each combination)*/
select department,gender, count(emp_id)as total_count from tbl_emp_detail_data
group by 1,2
order by department,gender;
/*8. Display the number of employees who joined each year and categorize hiring trends. (If a
year had more than 5 hires, mark as 'High Hiring'; 3 to 5 as 'Moderate Hiring'; otherwise, 'Low Hiring')*/

select joining_date,count(emp_id) as number_of_employes,
case when count(emp_id)>5 then 'high hiring'
when count(emp_id) between 3 and 5 then 'moderate hiring'
else 'low hiring' 
end as 'hiring trends' from tbl_emp_detail_data
group by joining_date;
/*9. Display department-wise highest salary and classify senior roles. (If the highest salary in a
department is above 70,000, label as 'Senior Leadership'; otherwise, 'Mid-Level')*/
select department,max(salary) as highest_salary,
case when max(salary)>70000 then 'senior leadership'
else 'midlevel'
end as 'senior roles' from tbl_emp_detail_data
group by department;
/*10. Display department-wise count of employees earning more than 60,000. (Group
employees by department and count those earning above 60,000, labeling departments
with more than 2 such employees as 'High-Paying Team') */
select department,count(emp_id)as high_salary,
case when count(emp_id)>=2 then 'high paying'
else 'low paying'
end as 'labelling' from tbl_emp_detail_data
where salary >= 60000
group by department;

#date and time
/*1.Query to extract the below things from joining_date column. (Year, Month, Day, Current Date)*/
select year(joining_date) as 'year',month(joining_date)as 'month',day(joining_date) as 'day',date(now()) as 'today' from tbl_emp_detail_data;
/*2.Create two new columns that calculate the difference between joining_date and the
current date. One column should show the difference in months, and the other should show the difference in days*/
alter table employee add column (month_diff varchar(3), day_dif varchar(3));
SET SQL_SAFE_UPDATES = 1;
alter table employee change month_diff month_diff varchar(20);
alter table employee change day_dif day_diff varchar(20);
update employee set day_diff=datediff(date(now()),joining_date);
update employee set month_diff=timestampdiff(month,joining_date,now());

#3.Get all employee details from the employee table whose joining year is 2020.
select * from employee where year(joining_date)=2020;

#4.Get all employee details from the employee table whose joining month is Feb.
select * from employee where month(joining_date)=2;

/*5.Get all employee details from employee table whose joining date between "2021-01-01" and "2021-12-01"*/
SELECT * FROM employee
WHERE joining_date BETWEEN '2020-01-01' AND '2021-12-01';

#joins and complex rank topics are not yet explained

























