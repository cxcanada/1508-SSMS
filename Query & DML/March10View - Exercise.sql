--View Exercise

--Use the IQSchool database for this exercise.  If an operation fails write a brief explanation why. Do not just quote the error message genereated by the server!

--1.Create a view of staff full names called staff_list.
go
Create view staff_list
as
Select firstname + ' ' + lastname 'StaffName' from staff 
go
select * from staff_list

--2.Create a view of staff ID's, full names, positionID's and datehired called staff_confidential.
go
create view staff_confidential
as 
select staffid, firstname + ' ' + lastname 'StaffName', positionid, datehired from staff
go
select * from staff_confidential
--3.Create a view of student ID's, full names, courseId's, course names, and grades called student_grades.
go
create view student_grades
as
select student.studentid, firstname + ' ' + lastname 'StudentName', course.courseid, coursename, mark from student
inner join Registration on student.studentid = registration.studentid
inner join offering on offering.offeringcode = registration.offeringcode
inner join course on offering.courseid = course.courseid
go
select * from student_grades

--4.Use the student_grades view to create a grade report for studentID 199899200 that shows the students ID, full name, course names and marks.
select studentid, [StudentName], coursename, mark from student_grades
where studentid = 199899200

--if we used 'student name' as a column name in 'create view', we need to use [student name] to select that column

select studentid, StudentName, coursename, mark from student_grades
where studentid = 199899200

--5.Select the same information using the student_grades view for studentID 199912010.
select studentid, StudentName, coursename, mark from student_grades
where studentid = 199912010

--6.Retrieve the code for the student_grades view from the database.
sp_helptext student_grades





--Solution
select * from staff
--view of staff names called staff_list
Create view staff_list
as
Select Firstname+ ' ' + lastname 'staffname' from staff
go
--view of staff ID's, names, positionID's and datehired called 
--staff_confidential
Create view staff_confidential
as
Select staffid,Firstname + ' ' + lastname 'staffname', PositionID,DateHired
from staff
go
--view of student ID's, names, courseId's, course names, and grades 
--called student_grades
drop view student_grades
Create view student_grades
as
Select student.studentid, firstname + ' ' + lastname 'Student Name', course.courseid, coursename, mark
from student inner join registration on student.studentid = registration.studentid
inner join offering on registration.OfferingCode = Offering.OfferingCode inner join course on course.courseid = offering.courseid
go
--use the student_grades view to create a grade report for studentID 
--199899200
Select studentid,[Student Name] , courseid, coursename, mark
from student_grades where StudentID = '199899200'

--another one for studentID 199912010
Select studentid, [Student Name], courseid, coursename, mark
from student_grades where StudentID = '199912010'
--update mark for studentID 199899200 in course dmit152 to be 90
-- and change the coursename to be 'basket weaving 101'

--6.	Retrieve the code for the student_grades view from the database.
sp_helptext student_grades
