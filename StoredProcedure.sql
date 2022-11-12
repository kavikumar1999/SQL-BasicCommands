-->STORED  PROCEDURE
/*
A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.
So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it
*/
---------STORED PROCEDURE FOR INPUT PARAMTER-------------
-->Store Procedure with one parameter
create proc SelectcompanyID
@CompanyCity varchar(50)
as
select * from company where CompanyCity=@CompanyCity
go
exec SelectcompanyID @CompanyCity='US'

-->Store Procedure with multiple paramater
create proc spGetDataByCompanyNameandCompanyCity
@Name varchar(50),
@City varchar(50)
as
begin
     select companyName,CompanyCity from company where CompanyName=@Name and
	 CompanyCity=@City
end
spGetDataByCompanyNameandCompanyCity 'benta','London'


-------------STORED PROCEDURE FOR OUTPUT PARAMETER--------------
Create proc spGetDataWithOutputParameter
@CompanyCount int output
As
Begin
    select @CompanyCount=count(CompanyName) from company 
End

Declare @TotalCount int
Execute spGetDataWithOutputParameter @Totalcount out
Print @TotalCount