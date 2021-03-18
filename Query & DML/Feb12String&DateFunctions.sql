--String and Date functions
--Functions are a bunch of code thats given a name and can be called by that name.
--You can pass values to a function(called parameters) and return a value from a function.
--You can functions anywhere you can use a column(select, where, group, order by, etc...)

--String functions
--len() - Returns the length of a string
select len(firstname) 'Length', firstname from student
--Select the firstname of students whose firstname is 3 characters long
select firstname from student where len(firstname) = 3

--Left() -- returns a certain number of characters from the left side of a string
select Left(firstname,4) 'left' from student

--Right() -- returns a certain number of characters from the right side of a string
select Right(firstname,4) 'right' from student

--Substring() - returns a certain number of characters from a starting point in a string
--Start at 3rd char and take 7 chars long
select substring (coursename, 3, 7), 'coursename' from course  

--Formatting
select upper(firstname) + ' ' + lower(lastname) 'StudentName' from student

--Trim       lTrim    rTrim
select ltrim('      Hello') 'ltrim'
select rtrim('Hello      ') 'rtrim'
select trim('      Hello      ') 'trim'
--trim only exists as of 2018
--trim the leading and trailing spaces off a string without using Trim()
select rtrim(ltrim('      Hello      '))

--Reverse
select reverse('xiao')

--Date functions
--Math
--Add 212 days to todays date
select dateadd(dd,212,getdate())
--			dateadd
--				  days
--				  	  To Where

--weeks
select dateadd(ww,212,getdate())
--			weekadd
--				 weeks
--				  	  To Where

--years
select dateadd(yy,212,getdate())
--			yearadd
--				 years
--				  	  To Where

--Difference
--How many days has everyone worked at the school
select firstname, lastname, datediff(dd, datehired, datereleased) 'DaysWorked' from staff

-- How many days has staff that have been fired been with the school
select firstname, lastname, datediff(dd, datehired, datereleased) 'DaysWorked' from staff where datereleased is not null
select * from staff

-- How many days has the staff that still work there been with the school
select firstname, lastname, datediff(dd, datehired, getdate()) 'DaysWorked' from staff where datereleased is null
select * from staff

--How many days you have been alive
select datediff(dd,'july 1 1963',getdate()) 'DaysAlive'

--Parts of a Date
--DateName() - String name of that part
select datename(dd,datehired) 'datename',datehired from staff
-- Days of a week --dw
select datename(dw,datehired) 'weekday',datehired from staff
select datename(mm,datehired) 'month',datehired from staff
select datename(yy,datehired) 'year',datehired from staff

--DatePart() - integer part of that part
select datepart(dd,datehired) 'datename',datehired from staff

-- first day of a week is Sunday
select firstname, lastname, datepart(dw,datehired) 'weekday',datehired from staff
select firstname, lastname, datepart(mm,datehired) 'month',datehired from staff
select firstname, lastname, datepart(yy,datehired) 'year',datehired from staff

--use month(), day(), year()
select month(getdate())
select day(getdate())
select year(getdate())

--select the staff full names (one column), their hiredate, and the month name they were hired
--List them in chronological order by month

select firstname + ' ' + lastname 'FullName', datehired, datename(mm,datehired) from staff
order by month(datehired) asc
