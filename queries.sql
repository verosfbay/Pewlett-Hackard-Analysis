-- Determine Retirement Eligibility
select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1955-12-31';

-- Search for only 1952 birthdates 
select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1952-12-31';