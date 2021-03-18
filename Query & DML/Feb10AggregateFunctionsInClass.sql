--Aggregate Functions, null, order by
select * from staff

--Select the names of staff that have not been released
select firstname, lastname from staff where DateReleased = null;   --This is wrong
-- Nothing is ever = null. That condition is always false.
-- To check for null, use IS instead of =.
select firstname, lastname from staff where DateReleased is null;
-- Select the names of staff that don't work for the school anymore
select firstname, lastname from staff where DateReleased is not null;

--Ordering Results
--Only order if you really need to
--Alpha order
Select firstname, lastname from student
order by lastname asc

--Reverse Alpha order
Select firstname, lastname from student
order by lastname desc

--Nesting order
--Select firstname and lastnames of student order by lastname and the firstname alphabetically
Select firstname, lastname from student
order by lastname asc,firstname asc

Select firstname, lastname from student
order by lastname asc, firstname desc


-- Aggregate functions
-- Returns one results from many values
-- Sum, Min, Max, Avg, Count

-- Sum - Returns the sum of the selected values
select sum(coursecost) 'sum' from course

-- How much would it cost to take all the programming courses()
select sum(coursecost) 'sum' from course
where coursename like '%programming%'

-- Min - Returns the lowest of the selected values
select min(coursecost) 'min' from course

-- Max - Returns the highest of the selected values
select max(coursecost) 'max' from course

-- Avg - Returns the average of the selected values
select avg(coursecost) 'average' from course

-- Count(*) OR Count(columnname)  use count(*) unless specified
-- * means 'records' in a count function
-- How many courses are there?
Select count() 'coursecount' from course

select * from staff
-- How many staff have ever worked at the school
select count(*) 'staffcount' from staff
-- Try with column name
select count(staffid) 'staffcount' from staff --10
select count(firstname) 'staffcount' from staff --10
select count(lastname) 'staffcount' from staff --10
select count(datehired) 'staffcount' from staff --10
select count(datereleased) 'staffcount' from staff --1
select count(loginid) 'staffcount' from staff --0

-- you should use count(*) unless you have to use count(column)
select * from staff
select count(*) from student where lastname = 'brown'

-- How many people no longer work for the school, show 2 different ways
select count(Datereleased) 'count' from staff    --this does not count null records
select count(*) 'count' from staff where DateReleased is not null



-- More than one aggregate
select sum(coursecost) 'sum', max(coursecost) 'max', min(coursecost) 'min' from course

-- You cannot mix aggretate columns with non aggregate columns
select sum(coursecost) 'sum', max(coursecost) 'max', min(coursecost) 'min', coursecost from course

-- Select how many different student lastnames are there in the student table
select count(distinct lastname) from student

-- Select how many students are taking at least one course (registerd in at least one offering)
select count(distinct studentid) 'count' from registration




