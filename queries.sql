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
