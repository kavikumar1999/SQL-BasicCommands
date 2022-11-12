-->Transaction Control Language(COMMIT&ROLLBACK&SAVEPOINT)

/*TCL commands used to manage the changes for the queries which we have performed by
using DML commands.*/

create table persons(
ID int not null primary key,
Name varchar(50) not null
) 
insert into persons values(1,'Kavi')
insert into persons values(2,'Ram')

select * from persons
-->ROLLBACK & COMMIT
begin transaction
insert into persons values(3,'John')
/*rollback command is used to go back to the previous query table which we performed previous*/
rollback
/*Commit is used to save the changes permanently*/
commit


begin transaction
create table demo(
SNo int not null primary key,
Name varchar(50)
)
insert into demo values(1,'Raj'),(2,'Jack'),(3,'Sam'),(4,'Tom')
select * from demo
commit

begin transaction
update demo set Name='Rose' where SNo=2
delete demo where SNo=1
insert into demo values(5,'Mike')
select * from demo
rollback

-->Once commit has been applied cannot rollback
begin transaction
update demo set Name='Rose' where SNo=2
delete demo where SNo=1
insert into demo values(5,'Mike')
select * from demo
-->Lets commit before rollback
commit
-->It doesnot work
rollback


-->SAVEPOINT
/*Save point is known as bookmarks . we can rollback to the certain position 
of the previous table*/

begin transaction

insert into demo values(1,'Kavi')
save transaction Ins

update demo set Name='John' where SNo=1
save transaction upd

select * from demo

rollback transaction Ins

