--Joins Exercise 1

--1.Select Student full names and the course ID's they are registered in.
select firstname + ' ' + lastname 'StudentName', courseid from student
inner join registration on student.studentid = registration.studentid
inner join offering on registration.offeringcode = offering.offeringcode

--2.Select the Staff full names and the Course ID’s they teach
select firstname + ' ' + lastname 'StaffName', courseid from staff
inner join offering on staff.staffid = offering.staffid

--3.Select all the Club ID's and the Student full names that are in them
select clubid, firstname + ' ' + lastname 'StudentName' from activity
inner join student on activity.studentid = student.studentid

--4.Select the Student full name, courseID's and marks for studentID 199899200.
select firstname + ' ' + lastname 'StudentName', courseid, mark from student
inner join registration on student.studentid = registration.studentid
inner join offering on registration.offeringcode = offering.offeringcode
where student.studentid = '199899200';

--5.Select the Student full name, course names and marks for studentID 199899200.
select firstname + ' ' + lastname 'StudentName', coursename, mark from student
inner join registration on student.studentid = registration.studentid
inner join offering on registration.offeringcode = offering.offeringcode
inner join course on offering.courseid = course.courseid
where student.studentid = 199899200;



--6.Select the CourseID, CourseNames, and the Semesters they have been taught in
select course.courseid, coursename, semestercode from course
inner join offering on course.courseid = offering.courseid

--7.What Staff Full Names have taught Networking 1?
select firstname, lastname from staff
inner join offering on staff.staffid= offering.staffid
inner join course on offering.courseid= course.courseid
where coursename = 'Networking 1'

--8.What is the course list for student ID 199912010 in semestercode A100. 
--Select the Students Full Name and the CourseNames.

select firstname + ' ' + lastname, coursename from student 
inner join registration on student.studentid = registration.studentid
inner join offering on registration.offeringcode = offering.offeringcode
inner join course on offering.courseid = course.courseid

where student.studentid = 199912010 and semestercode = 'A100'

--9. What are the Student Names, courseID's that have Marks > 80?
select firstname + ' ' + lastname, courseid from student 
inner join registration on student.studentid = registration.studentid
inner join offering on registration.offeringcode = offering.offeringcode
where mark > 90

