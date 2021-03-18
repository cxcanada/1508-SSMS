--datehiredString and Date Functions Exercise
--1. Select the staff names and the name of the month they were hired
select firstname + ' ' + lastname 'StaffName', datename(mm, datehired) 'MonthHired' from staff

--2. How many days did Tess Agonor work for the school?
select datediff(dd, datehired, datereleased) 'TotalDays' from staff where firstname = 'Tess' and lastname = 'Agonor'
select * from staff
--3. Select the Names of all the students born in December.
select firstname + ' ' + lastname 'StudentName' from student where datename(mm, birthdate) = 'december'
select * from student
--4. select last three characters of all the courses
select right(Courseid,3) 'CourseNumbers', coursename from course

--5. Select the characters in the position description from characters 8 to 13 for PositionID 5
select substring(positiondescription,8,6) 'PartialName' from position where positionid = 5

select * from position
--6. Select all the Student First Names as upper case.
select upper(firstname) 'UpperCaseFirstName' from student

--7. Select the First Names of students whose first names are 3 characters long.
select firstname from student where len(firstname) = 3