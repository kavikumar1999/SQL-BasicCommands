-->AGGREGATE FUNCTIONS

/*
COUNT
SUM
AVERAGE
MINIMUM
MAXIMUM
*/

create table StudentsMarks(
ID int not null primary key,
Name varchar(50),
Marks int 
)
insert into StudentsMarks values
(1,'A',70),
(2,'B',70),
(3,'C',80),
(4,'D',85),
(5,'E',90),
(6,'F',Null)

Select * from StudentsMarks

-->COUNT
select count(Marks) as TotalCount from StudentsMarks 
select count(Distinct Marks) as DistinctCount from StudentsMarks

-->SUM
select sum(Marks) as SumMarks from StudentsMarks

-->AVERAGE
/*avg=sum(Marks)/count(Marks)*/
select avg(Marks) as AvgMarks from StudentsMarks

-->MINIMUM
select min(Marks) as lowestMarks from StudentsMarks

-->MAXIMUM
select max(Marks) as highsetMarks from StudentsMarks


create table EmpSalary(
Name varchar(50),
Salary int ,
age int
)
insert into EmpSalary values
('Marsh',3000,20),
('Raj',2000,21),
('Jack',1500,19),
('Marsh',2000,20),
('Jack',1000,19)

select * from EmpSalary

select Name,sum(Salary) as TotalSalary from EmpSalary
group by Name
having sum(Salary)>3000
