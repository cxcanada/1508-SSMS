--Stored Procedure Exercise – Simple
--**Stored Procedure has to be the first statement in a batch so place GO in between each question to execute the previous batch (question) and start another. **

--1.Create a stored procedure called “HonorCourses” to select all the course names that have averages >80%. 
Create procedure HonorCourses
as
select coursename from course 
inner join offering on course.courseid = offering.courseid
inner join Registration on offering.offeringcode = Registration.offeringcode
group by coursename
having avg(mark) > 80
return
go
honorcourses
go

--2.Create a stored procedure called “HonorCoursesOneTerm” to select all the course names that have average >80% in semester A100.
create procedure HonorCoursesOneTerm
as
select coursename from course 
inner join offering on course.courseid = offering.courseid
inner join Registration on offering.offeringcode = Registration.offeringcode
where semesterCode = 'A100'
group by coursename
having avg(mark) > 80
return 
go
HonorCoursesOneTerm
go

--3.Oops, made a mistake! For question 2, it should have been for semester A200. Write the code to change the procedure accordingly. 
sp_helptext HonorCoursesOneTerm
go
alter procedure HonorCoursesOneTerm
as
select coursename from course 
inner join offering on course.courseid = offering.courseid
inner join Registration on offering.offeringcode = Registration.offeringcode
where semesterCode = 'A200'
group by coursename
having avg(mark) > 80
return 
go
HonorCoursesOneTerm
go
--4.Create a stored procedure called “NotInDMIT221” that lists the full names of the staff that have not taught DMIT221.
create procedure NotInDMIT221
as 
select distinct firstname + ' ' + lastname 'staffname' from staff
inner join offering on staff.staffid = offering.staffid
where staff.staffid not in (select staffid from offering where courseid = 'DMIT221')
return
go
NotInDMIT221
go

--5.Create a stored procedure called “LowNumbers” to select the course name of the course(s) that have had the lowest number of students in it. Assume all courses have registrations.
create procedure LowNumbers
as
select coursename from course
inner join offering on course.courseid = offering.courseid
inner join registration on Registration.offeringcode = offering.offeringcode
group by course.courseid, coursename
having count(registration.offeringcode) <=all (select count(offeringcode) from registration group by offeringcode)
return
go
LowNumbers
go
--6.Create a stored procedure called “Provinces” to list all the students provinces.
create procedure provinces
as
select distinct province from student
return
go
provinces
go
--7.OK, question 6 was ridiculously simple and serves no purpose. Lets remove that stored procedure from the database.
drop procedure provinces

--8.Create a stored procedure called StudentPaymentTypes that lists all the student names and their payment type Description. Ensure all the student names are listed.
go
create procedure StudentPaymentTypes
as
select firstname, lastname, paymenttypedescription from student
left outer join payment on student.studentid = payment.studentid
left outer join paymenttype on payment.paymenttypeid = paymenttype.paymenttypeid
order by firstname asc
return
go
StudentPaymentTypes
--9.Modify the procedure from question 8 to return only the student names that have made payments.
go
alter procedure StudentPaymentTypes
as
select firstname, lastname, paymenttypedescription from student
inner join payment on student.studentid = payment.studentid
inner join paymenttype on payment.paymenttypeid = paymenttype.paymenttypeid
order by firstname asc
return
