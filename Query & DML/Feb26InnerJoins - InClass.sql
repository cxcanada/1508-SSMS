
select firstname, coursename from student
inner join registration on student.studentid = registration.studentid
inner join offering on offering.offeringcode = registration.offeringcode
inner join course on offering.courseid = course.courseid



--Inner Joins
--Allows us to work with data from more than one table
--Select the names of all the staff and the position description they hold
select * from staff--10
Select * from position--7
Select firstname,lastname,positionDescription
from staff,position
--Does not work. Every record in one table is being relate with every record in the other table.
--We need to code how the tables relate to each other(what links them together? PK and FK)
--ANSI SQL Version. Compatable with many database plateforms but not best for SQL Server
Select firstname,lastname,positionDescription
from staff,position
where staff.PositionID=Position.PositionID
--In SQL server use Inner join syntax
Select firstname,lastname,positiondescription
from staff
inner join position on staff.PositionID=Position.PositionID
--Inner join the tables that contain the data you need to work with
--ON identifies how the tables relate to each other (PK in the parent and the FK in the child)
--The order of the table in the inner join does not matter. The order of the fields in the ON does not matter



--Select all the positiondescriptions and the names of staff in them
Select positiondescription, firstname,lastname from staff
inner join position on staff.PositionID=Position.PositionID
order by PositionDescription asc

select * from position
--OH NO! We are missing one position. What happened?
--It is the one record that has no related records in staff (positionid 7, assistant dean)
--INNER JOINS ONLY RETURN RECORDS IF THERE ARE RELATED RECORDS IN THE JOIN

--Select the student full names and the offering codes they are registered in
Select firstname + ' ' + lastname'StudentName', offeringcode
from student
inner join registration on student.StudentID=Registration.StudentID

--Select the full names of students that have made payments?
Select distinct firstname,lastname from student
inner join payment on student.StudentID=payment.StudentID

--same as above but also select the studentid
Select distinct student.studentid, firstname,lastname from student
inner join payment on student.StudentID=payment.StudentID
--ambigous columns should be selected from the parent table

--More than 2 table join
--Select the student full names and the offering codes they are registered in, the courseid's and the coursenames
Select firstname + ' ' + lastname'StudentName', offering.offeringcode, course.courseid, coursename,maxstudents
from student
inner join registration on student.StudentID=Registration.StudentID
inner join offering on offering.OfferingCode=Registration.OfferingCode
inner join course on course.CourseId=offering.CourseID

--Select all the staff names, positiondescriptions, and the semestercode, startdates and enddates they taught in
select firstname,positiondescription, semester.semestercode, startdate,enddate from  staff
inner join position on staff.positionid = position.positionid
inner join offering on offering.staffid = staff.staffid
inner join Semester on offering.SemesterCode = Semester.SemesterCode

Select firstname,lastname,positiondescription, semester.semestercode,startdate,enddate
from position
inner join staff on Position.PositionID=staff.PositionID 
inner join offering on offering.staffid = staff.staffid
inner join semester on semester.semestercode =offering.SemesterCode
