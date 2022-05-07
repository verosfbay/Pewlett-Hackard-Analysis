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

-- employee count by department number
select count(ce.emp_no), de.dept_no
from current_emp as ce
left join dept_employees as de 
on ce.emp_no = de.emp_no
group by de.dept_no 
order by de.dept_no;

select * from employees_by_dept; 

-- Employee Information: A list of employees containing 
-- their unique employee number, their last name, first name, gender, and salary

select e.emp_no, 
	e.first_name,
 	e.last_name,
	e.gender,
	s.salary,
	de.to_date
into emp_info 
from employees as e
inner join salaries as s
on (e.emp_no = s.emp_no)
inner join dept_employees as de
on (e.emp_no = de.emp_no)
 	where (e.birth_date between '1952-01-01' and '1955-12-31') -- update with aliases
 	and (e.hire_date between '1985-01-01' and '1988-12-31')
 	and (de.to_date = '9999-01-01'); 

-- list of managers per department 
select dm.dept_no,
		d.dept_name,
		dm.emp_no,
		ce.last_name,
		ce.first_name,
		dm.from_date,
		dm.to_date
into manager_info
from dept_manager as dm
	inner join departments as d
		on (dm.dept_no = d.dept_no)
	inner join current_emp as ce
		on (dm.emp_no = ce.emp_no); 

-- The final list needs only to have the departments added to the current_emp table

select ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
into dept_info
from current_emp as ce
inner join dept_employees as de
on (ce.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no); 

select * from dept_info ; 
