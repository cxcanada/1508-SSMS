--SQL Flow Control and Variables(including exists)Exercise
--Use IQSChool tables
--1.Create a batch of statements that will use a clubID. If the count of students in that club is 
--greater than 2 print ‘A successful club!’. If the count is not greater than 2 print ‘Needs more members!’.


--2.Create a batch of statements will use a studentID. Each course has a cost. If the total of the 
--costs for the courses the student is registered in is more than the total of the payments that student 
--has made then print ‘balance owing !’ otherwise print ‘Paid in full! Welcome to IQSchool!’. 
--Do Not use the BalanceOwing field in your solution. 


--3.Create a batch of statements that will use a students first name and last name. If the student name 
--already is in the table then print ‘We already have a student with the name firstname lastname!’ Otherwise 
--print ‘Welcome firstname lastname!’


--4.Create a batch of statements that will use a staff ID. If the number of classes the staff member has 
--ever taught is between 0 and 5 print ‘Well done!’, if it is between 6 and 10 print ‘Exceptional effort!’, 
--if the number is greater than 10 print ‘Totally Awesome!’




--1.	Create a batch of statements that will use a clubID. If the count of students in that club is greater than 2 print �A successful club!�. If the count is not greater than 2 print �Needs more members!�.
--Create a club variable and put in a clubid
--create a membercount variable and select into it the count of students in that club
--if membercount variable >2 print......
--else print.......
declare @clubid varchar(10),@count int
set @clubid = 'CSS'
select @count = count(*) from activity where clubid = @clubid
if(@count > 2)
print 'A Successful Club'
else
print 'Need more members'


--2.	Create a batch of statements will use a studentID. Each course has a cost. If the total of the costs for the courses the student is registered in is more than the total of the payments that student has made then print �balance owing !� otherwise print �Paid in full! Welcome to IQSchool!�. Do Not use the BalanceOwing field in your solution. 
--declare a studentid variable and studentid in it
--declare a variable to hold total course costs and total payments for that student
--sum up the coursecosts and payments for the student and put in the variables
--if coursecosts>payments then print ..........
--else print........
declare @studentid int
set @studentid = 199899200
declare @totalcost decimal (6,2), @totalpayment money
select @totalcost = sum(coursecost) from course 
inner join offering on offering.courseid = course.courseid
inner join registration on registration.offeringcode = offering.offeringcode
where studentid = @studentid
select @totalpayment = sum(amount) from payment where studentid = @studentid
if(@totalcost > @totalpayment)
print 'balance owing !'
else
print 'Paid in full! Welcome to IQSchool!'



--3.	Create a batch of statements that will use a students first name and last name. If the student name already is in the table then print �We already have a student with the name firstname lastname!� Otherwise print �Welcome firstname lastname!�
--use exists
declare @firstname varchar(30)
declare @lastname varchar(30)
set @firstname = 'Dave'
set @lastname = 'Brown'
if exists (select * from student where firstname + lastname = @firstname + @lastname)
print 'We already have a student with the name ' + @firstname + ' ' + @lastname
else 
print 'Welcome ' + @firstname + ' ' + @lastname

--4.	Create a batch of statements that will use a staff ID . If the number of classes the staff member has ever taught is between 0 and 5 print �Well done!�, if it is between 6 and 10 print �Exceptional effort!�, if the number is greater than 10 print �Totally Awesome!�
--create a variable for staffid and put a staff id in it
-- create a variable to hold the number of courses the staff member has taught
--count up the number of courses the staff has taught and put in variable
--use if/else structures to print correct statement
declare @staffid smallint
set @staffid = 5

declare @staffcount smallint
select @staffcount = count(*) from offering where staffid = @staffid

if @staffcount between 0 and 5
print 'well done'
else
begin
if @staffcount between 6 and 10
print 'Exceptional effort'
else 
print 'Totally Awesome'
end



