create table CustomerAddress(
AddressId int not null primary key,
CustomerOrder varchar(50),
City varchar(50)

)


insert into CustomerAddress values(1,'Iphone','Salem'),(2,'HeadPhone','Namakkal'),
(3,'Clothes','Chennai'),(4,'Pen','Covai'),(5,'SmartTV','Erode'),(7,'Watch','Trichy')

select * from CustomerAddress

create table CustomerDetail(
customerID int not null primary key,
CustomerName varchar(50),
AddressID int not null,
Cust_PhNo varchar(50) 
)

insert into CustomerDetail values(213,'Ram',1,'8877665544'),(216,'John',2,'9994445511'),
(317,'Raj',3,'9876543210'),(456,'Azar',4,'6879897878'),(589,'Rose',5,'7890654321'),(600,'Jack',6,'7658904234')

select * from CustomerDetail

Create table SalesDetail(
CustomerID int not null primary key,
Quantity int not null,
Price varchar(50),
)

insert into SalesDetail values(317,1,'Rs5000'),(216,2,'Rs3000'),(213,3,'Rs3500'),
(456,2,'Rs500'),(589,1,'Rs25000')
select * from SalesDetail

/*Inner join took only all the matching tuples from both the tables by comparing common attributes of both the table*/

select customerID,CustomerName,CustomerOrder, City,Cust_PhNo
from CustomerAddress
inner join CustomerDetail on CustomerAddress.AddressId=CustomerDetail.AddressID


/*Left Join:All the values from left table and only matching values from right table
padding with NULL for right table mismatching values*/

select customerID,CustomerName,CustomerOrder, City,Cust_PhNo
from CustomerAddress
left join CustomerDetail on CustomerAddress.AddressId=CustomerDetail.AddressID


/*Right Join:All the values from right table and only matching values from left table
padding with null for all mismatching values in left table*/

select customerID,CustomerName,CustomerOrder, City,Cust_PhNo
from CustomerAddress
right join CustomerDetail on CustomerAddress.AddressId=CustomerDetail.AddressID


Create table company(
CompanyID int not null primary key,
CompanyName varchar(50),
CompanyCity varchar(50)
)

insert into company values(15,'Benta','London'),(16,'InfoTech','Delhi'),(17,'TechNoa','Chennai'),
(18,'Infosys','Bangalore'),(19,'KTech','US')

create table foods(
ItemID int not null,
ItemName varchar(50),
ItemUnit varchar(50),
CompanyID int 
)

insert into foods values(1,'Cheese','Pcs',16),(2,'Pot Rice','Pcs',17),(3,'Burger','Pcs',15),
(4,'Veg Kabab','Pcs',15),(5,'Pizza','Pcs',15),(6,'Chicken Fry','Pcs',18),(7,'Lolipop','Pcs',16)

select * from foods


/*Cross Join:The SQL CROSS JOIN produces a result set which is the number of rows in
the first table multiplied by the number of rows in the second table */
-->Cartesian Product


SELECT foods.ItemName,foods.ItemUnit,
company.CompanyName,company.CompanyCity 
FROM foods 
CROSS JOIN company;