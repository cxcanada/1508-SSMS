--SampleQueries
--Select all the staff data from the staff table

Select * from staff
-- * means all columns
-- Never use Select *
-- Always Select the column that you want
Select staffid, firstname, lastname, datehired, datereleased, positionid, loginid from staff

--Can choose which columns you want
Select staffid, firstname, lastname from staff

--Custom column names(aliases)
Select 'StaffFirstName' = firstname, 'StaffLastName' = lastname from staff
Select firstname as 'StaffFirstName', lastname as 'StaffLastName' from staff
Select firstname 'StaffFirstName', lastname 'StaffLastName' from staff

--Custom Columns
Select firstname + ' ' + lastname 'StaffName' from staff
-- All columns must have a name
-- Create a StaffName column in staff table whose value is firstname + ' ' + lastname

--Math
Select courseid, coursename, coursecost 'NormalCost', coursecost*.8 'SaleCost' from Course
-- Changed coursecost to 'NormalCost' for display only. Make a new column 'SaleCost' and set value to coursecost*.8

--How much money is made from each course if the maximum number of students enrolled. Show the courseid, coursename, and the money made for each course.
Select courseid, coursename,coursecost * maxstudents 'MaxMoneyMade' from Course

--Select the studentID's that are registered in at least one offering
Select distinct studentid from Registration
--Use distinct to remove duplicate records

Select distinct studentid, offeringcode from Registration
-- this returns more records with duplicate studentid's because they are registered in different offerings

--where - is used to select which records to return
-- where uses the same expressions as check constraints
Select firstname, lastname from student
where studentid = 199899200

--Select the paymentid and amount for all payments over 600
Select paymentid, amount from payment where amount > 600

--Full names (one column) of students whose lastname starts with 's'
Select firstname + ' ' + lastname 'StudentName' from student
where lastname like 's%'

-- 2 different ways to select the firstname of students whose studentID's are 198912010 or 200688700, 199912010
Select firstname from student
where studentID=198912010 or studentID=200688700
--  or
Select firstname from student
where StudentID in(198912010, 200688700, 199912010)

--Select firstnames of students whose firstnames start with a,b,c,d,e,f,g,m
Select firstname from student where
firstname like 'a%' or
firstname like 'b%' or
firstname like 'c%' or
firstname like 'd%' or
firstname like 'e%' or
firstname like 'f%' or
firstname like 'g%' or
firstname like 'm%'

Select firstname from student where firstname like '[a-g]%' or firstname like 'm%'

Select firstname from student where firstname like '[a-g,m]%'

Select firstname from student where firstname like '[abcdefgm]%'
