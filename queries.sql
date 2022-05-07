-- Determine Retirement Eligibility
select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1955-12-31';

-- Search for only 1952 birthdates 
select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1952-12-31';

-- Create three more queries to search for employees who were born in 1953, 1954, and 1955.
select first_name, last_name
from employees
where birth_date between '1953-01-01' and '1953-12-31'; 

-- Retirement eligibility
select first_name, last_name
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');


-- Retirement eligibility updated
select first_name, last_name 
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

select * from retirement_info ; 

-- JOINS
select first_name, last_name
from employees as e 
left join titles as t on e.emp_no = t.emp_no ; 

drop table retirement_info;

-- create  anew table for retiring employees
select emp_no, first_name, last_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');
-- check the table
select * from retirement_info ; 

-- joining departments and dept_manager tables
select d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
from departments as d 
inner join dept_manager as dm 
on d.dept_no = dm.dept_no ; 

-- joining retirement_info and dept_emp tables
select retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
		dept_employees.to_date 
from retirement_info
left join dept_employees
	on retirement_info.emp_no = dept_employees.emp_no ; 
	
-- aliases
select ri.emp_no,
	ri.first_name,
ri.last_name,
de.to_date
from retirement_info as ri
left join dept_employees as de 
on ri.emp_no = de.emp_no; 
	
-- join the retirement_info and dept_employees tables
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	   de.to_date
into current_emp
from retirement_info as ri
left join dept_employees as de 
on ri.emp_no = de.emp_no 
where de.to_date = ('9999-01-01'); 

select * from current_emp; 
