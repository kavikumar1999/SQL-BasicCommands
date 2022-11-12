/*Predicates are keywords that specify a relationship between
two expressions*/

-->BETWEEN
-->IN
-->LIKE
-->IS NULL

-->BETWEEN
/*The BETWEEN operator selects values within a given range. 
The values can be numbers, text, or dates*/
select * from EmpSalary where Salary between 2000 and 3000

-->IN
/*The IN operator allows you to specify multiple values in a WHERE clause*/
select * from EmpSalary where (Salary between 2000 and 3000) and not age in(21)

-->LIKE
/*The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.*/
select * from EmpSalary where Name like 'J%'
select * from EmpSalary where Name like '%s%'
select * from EmpSalary where Name like '_a%'

-->IS NULL
/*The IS NULL operator used to find the lost data*/
select name,Salary from EmpSalary where age is not null


