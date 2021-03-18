--Stored Procedures- a bunch of SQL code that is given a name and called by that name(like a method/function)
--Can contain variables
--Variable - A named place in memory that can hold data
--All variables --must have a name, a datatype,and must start with @

--Declare a variable
Declare @firstName varchar(30)
go
--Place a value in a varibale
--Using Set
Declare @firstName varchar(30)
Set @firstName='Homer'
print @firstName	
go
Declare @firstName varchar(30)
set @firstName=(Select firstname from staff where staffid = 1)
print @firstName	
--Select
go
Declare @firstName varchar(30)
Select @firstName=firstname from staff where staffid =1
print @firstName
--Select multiple values into multiple variables. Firstname and lastname of staff 1 into firstname and lastname variables
--Using set
go
Declare @firstName varchar(30)
Declare @lastName varchar(30)
Set @firstName=(select firstname from staff where staffid = 1)
Set @lastName=(select lastname from staff where staffid = 1)
print  @firstName + ' '+ @lastName
--Using Select
go
Declare @firstName varchar(30)
Declare @lastName varchar(30)
Select @firstName=firstname, @lastName=lastname from staff where staffid = 1
print  @firstName + ' '+ @lastName

--Common to use SET for hard coded data (data that acts like a constant) and SELECT for data from the database

--DECISIONS
--If/ELse
--Syntax
--If condition
--TRUE code(code to execute if the condition is true)
--ELSE
--FALSE code (code to execute if the condition is false)
go
Declare @firstName varchar(30)
Set @firstName='Oprah'
	
if @firstName='Thanos'
	print 'Booooo! We don''t like ' + @firstName --TRUE code
else
	print'Yay! we like ' + @firstName--False Code
	--Executing multiple lines on the if and/or else side
	go
Declare @firstName varchar(30)
Set @firstName='Oprah'
	
if @firstName='Thanos'
	BEGIN
	print 'Booooo! We don''t like ' + @firstName --TRUE code
	print 'Go away!'
	END
else
	BEGIN
	print'Yay! we like ' + @firstName--False Code
	print'Show me the money!'
	END
print'Thank you for playing'

--You can just use if
go
Declare @firstName varchar(30)
Select @firstname =firstname from staff where staffid =1
if @firstname='Donna'
	Begin
	print 'HI ' + @firstname
	ENd
Print 'Have a groovy day!'
select * from student

--Nested Decisions
go
Declare @city varchar(20)
Declare @studentID int

Set @studentID=199899200
Select @city=city from student where StudentID=@studentID

if @city ='Edmonton'
	Begin
	print'That is awesome!'
	End
else
	Begin
	if @city='Red Deer'
		Begin
		print'That is ok'
		End
	else
		Begin
		if @city='Calgary'
			Begin
			print'Sucks to be you'
			End
		End
	End
	--Removing not required BEgin/End
	go
Declare @city varchar(20)
Declare @studentID int

Set @studentID=200011730
Select @city=city from student where StudentID=@studentID

if @city ='Edmonton'	
	print'That is awesome!'	
else	
	if @city='Red Deer'
		print'That is ok'	
	else		
		if @city='Calgary'
			print'Sucks to be you'		
		
--Exists
--Syntax
--if exists (query)-- if at least one record is returned from the query exists is TRUE
--TRUE code
--else
--FALSE code

if exists (Select * from staff where firstname = 'Donnarma')
	print 'Donna is in the house (or at least the DB)!'
else
	print 'Hey! Has anyone seen a Donna?'

	--Code the following without a variable in 3 lines
Declare @firstName varchar(30)
Select @firstName=firstName from staff where staffid =1
if @firstName = 'Donna'
	print'Hi Donna!'
print'Thank you for playing!'

go
if (Select firstName from staff where staffid = 1)='Donna'
	print'Hi Donna!'
print'Thank you for playing!'
