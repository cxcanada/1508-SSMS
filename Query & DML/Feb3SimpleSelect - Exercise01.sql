--SIMPLE SELECT EXERCISE 1
--USE THE IQSCHOOL DATABASE

--1. Select all the information from the club table
Select ClubID, ClubName from Club

--2. Select the FirstNames and LastNames of all the students
Select firstName, lastname from Student

--3. Select all the CourseId and CourseName of all the coureses. Use the column aliases of Course ID and Course Name
Select CourseID 'Course ID', Coursename 'Course Name' from Course

--4. Select all the course information for courseID 'DMIT101'
Select coursename, coursehours, maxstudents, coursecost, courseid from Course
where courseID = 'DMIT101'

--5. Select the Staff names who have positionID of 3
Select firstname + ' ' + lastname 'Staff Names' from Staff
where positionID = 3

--6. select the CourseNames whos CourseHours are less than 96
Select coursename from Course
where coursehours < 96

--7. Select the studentID's, OfferingCode and mark where the Mark is between 70 and 80
Select studentID, OfferingCode, mark from Registration
where mark between 70 and 80

--8. Select the studentID's, Offering Code and mark where the Mark is between 70 and 80 and the OfferingCode is 1001 or 1009
Select studentID, offeringCode, mark from Registration
where (mark between 70 and 80) and OfferingCode in (1001, 1009)

--9. Select the students first and last names who have last names starting with S
Select firstname, lastname from student
where lastname like 's%'

--10. Select Coursenames whose CourseID  have a 1 as the fifth character
Select coursename from course 
where courseid like '____1%'

--11. Select the CourseID's and Coursenames where the CourseName contains the word 'programming'
Select courseId, coursename from Course
where coursename like '%programming%'

--12. Select all the ClubNames who start with N or C.
Select clubname from club
where clubname like '[N,C]%'

--13. Select Student Names, Street Address and City where the lastName has only 3 letters long.
Select firstname + ' ' + lastname 'Student Name', streetaddress, city from student
where lastname like '___'

--14. Select all the StudentID's where the PaymentAmount < 500 OR the PaymentTypeID is 5
Select studentID from Payment
where Amount < 500 or PaymentTypeID = 5


