# Pewlett Hackard Analysis

## Overview
The purpose of this analysis is to show the managers at Pewlett Hackard the amount and types of employees that will be retiring soon. This is important information because the company will be tasked with filling those roles and spending a significant amount on training new employees. It is well known that for any company, it is cheaper to keep and train an existing employee than hire a new one. Unfortunately, in this case that is not an option as these employees are retiring and thus cannot be re-trained. The company must be prepared for a huge shift in the workforce as Baby Boomers retire in droves and Millennials and Gen Zers are entering or getting established. 

## Results
As shown by the table below,
* Senior Engineer is the title with the most retirees (25916)
* Senior Staff is the title with the second most retirees (24926)
* Manager is the title with the least amount of retirees (2)
<img width="213" alt="Screen Shot 2022-05-07 at 4 38 53 PM" src="https://user-images.githubusercontent.com/95447175/167275495-8a3e18b4-fd89-44dd-ac73-bdfb42974e0b.png">

As shown by the table below,
* 1549 employees are eligible to be mentors for new employees 
<img width="725" alt="Screen Shot 2022-05-07 at 4 41 01 PM" src="https://user-images.githubusercontent.com/95447175/167275642-8477bb16-9856-43f2-ac1f-aedc412cb545.png">

## Summary 
72,458 roles will need to be filled as the "silver tsunami" takes effect. I got this number by adding up all the title counts from the retiring_titles table. This is quite a signnificant number of roles, so the company should start planning now how they're going to attract new employees, and allocate a budget on training these new employees. Another thing I think the company should consider is the attitudes toward work of younger generations. Younger people want more flexibility including work from anywhere options, so this big corporation might have to rethink the way they've been doing things in order to attract a younger crowd. 

Currently there are not enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees. There are only 1549 mentors for 72,458 future employees, which means that each mentor would be in charge of 46 employees. This is a an unrealistic expectation as the mentors would be unable to provide one-on-one training to so many employees. Ideally, mentors should not have more than a handful of trainees. Another possible but not ideal solution is to create a class environment where the mentors teach a big group of people, and those people can ask questions for half the session. 

### Two additional queries to glean more insights 
* The most common title of the employees who are eligible to become mentors is 'Staff' (447)
<img width="204" alt="Screen Shot 2022-05-07 at 4 45 45 PM" src="https://user-images.githubusercontent.com/95447175/167275727-0f136b85-71c6-4166-aabb-4b3c3856c4e9.png">
select count(title), title from mentorship_eligibility
group by title
order by count(title) desc; 


* 72,458 employees will retire soon 
<img width="92" alt="Screen Shot 2022-05-07 at 5 01 22 PM" src="https://user-images.githubusercontent.com/95447175/167276029-88488397-0fb7-4fa2-b2e6-0fc961fdfc50.png">
select sum(count) from retiring_titles; 

