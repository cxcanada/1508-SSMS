 --Inner join solution
 
 --Inner Joins With Aggregates Exercises
--1. How many staff are there in each position? Select the number and Position Description
select positiondescription, count(*) 'Count' from staff
inner join position on staff.PositionID = position.PositionId
group by position.positionid, positiondescription



--2. Select the average mark for each course. Display the CourseName and the average mark
select coursename, avg(mark) 'AverageMark' from course
inner join offering on course.courseid = offering.courseid
inner join registration on registration.offeringcode = offering.offeringcode
group by course.courseid,coursename

select coursename, avg(mark) 'AverageMark' from Registration
inner join offering on registration.offeringcode = offering.offeringcode
inner join course on offering.courseid = course.courseid
group by Course.CourseId, coursename



--3. How many payments where made for each payment type. Display the PaymentTypeDescription and the count
 select PaymentTypeDescription, count(*) 'PaymentCount'from payment
 inner join paymenttype on payment.paymenttypeid = paymenttype.paymenttypeid
 group by Payment.PaymentTypeID, paymenttypedescription



--4. Select the average Mark for each student. Display the Student Name and their average mark
 select firstname+' '+lastname 'Name', avg(mark) from student
 inner join registration on student.studentid = registration.studentid
 group by Student.StudentID, firstname, lastname 

--5. Select the same data as question 4 but only show the student names and averages that are > 80
 select firstname+' '+lastname 'Name', avg(mark) 'AverageMark' from student
 inner join registration on student.studentid = registration.studentid
 group by Student.StudentID, firstname, lastname 
 having avg(mark) > 80

--6.what is the highest, lowest and average payment amount for each payment type Description? 
 select paymenttypedescription, max(amount) 'max', min(amount) 'min', avg(amount) 'average' from payment
 inner join PaymentType on payment.paymenttypeid = paymenttype.paymenttypeid
 group by PaymentType.PaymentTypeID, PaymentTypeDescription

--7. How many students are there in each club? Show the clubName and the count
 select clubname, count(*) 'StudentCount' from activity
 inner join club on activity.clubid = club.clubid
 group by Club.ClubId,clubname

--8. Which clubs have 3 or more students in them? Display the Club Names.
select clubname, count(*) 'StudentCount'from activity
 inner join club on activity.clubid = club.clubid
group by Club.ClubId, clubname
having count(*) >= 3










--Outer Joins Exercise
--1. Select All position descriptions and the staff ID's that are in those positions
select positiondescription, staffid from position
left outer join staff on staff.positionid = position.positionid


parent position, child staff
outer join



select staffid, positiondescription from staff
right outer join position on staff.positionid = position.positionid

--2. Select the Position Description and the count of how many staff are in those positions. 
--Returnt the count for ALL positions.
--HINT: Count can use either count(*) which means records or a field name. Which gives the correct result in this question?
select positiondescription, count(staffid) from position
left outer join staff on position.PositionID = staff.positionid
group by position.positionid, positiondescription


select positiondescription, count(staffid) 'StaffCount' from position
left outer join staff on staff.positionid = position.positionid
group by position.Positionid, PositionDescription

--3. Select the average mark of ALL the students. Show the student names and averages.
select firstname, lastname, avg(mark) 'Avg' from student
left outer join registration on student.studentid = Registration.studentid
group by student.studentid, firstname, lastname


select firstname + ' ' + lastname 'StudentName', avg(mark) 'average mark' from student
left outer join registration on student.studentid = registration.studentid 
group by student.studentid, firstname, lastname

--4. Select the highest and lowest mark for each student. 
select max(mark) 'Max', min(mark) 'Min', firstname, lastname from Registration
right outer join student on student.studentid = registration.studentid
group by firstname, lastname, student.studentid

select firstname + ' ' + lastname 'StudentName', max(mark) 'HighestMark', min(mark) 'LowestMark' from student
left outer join registration on student.studentid = registration.studentid 
group by student.studentid, firstname, lastname








-- Make sure you count the not null values
-- Count the primary keys in the child table

--5. How many students are in each club? Display club name and count.

select clubname, count(club.clubid) from club
left outer join activity on activity.clubid = club.clubid
group by club.clubid, clubname 

select clubname, count(studentid) from club
left outer join activity on activity.clubid = club.clubid
group by club.clubid, clubname 

select * from activity
order by clubid
select * from club


select clubname, count(activity.clubid) 'StudentCount' from club
left outer join activity on club.clubid = activity.clubid
group by club.ClubId, clubname


--Outer solution
--1. Select All position descriptions and the staff ID's that are in those positions
Select PositionDescription, StaffID from Position
left outer join Staff
on Position.PositionID = Staff.PositionID

--2. Select the Position Description and the count of how many staff are in those positions. Returnt the count for ALL positions.
--HINT: Count can use either count(*) which means records or a field name. Which gives the correct result in this question?
select positiondescription, count(*) 'Count' from 




















Select Positiondescription, COUNT(StaffID)'Count' from Position 
left outer join Staff on Position.PositionID = Staff.PositionID 
group by position.Positionid,PositionDescription

--3. Select the average mark of ALL the students. Show the student names and averages.
Select FirstName  + ' ' + LastName 'Student Name' , AVG(mark)'Average' from student 
left outer join registration on student.studentID  = registration.studentid
group by student.StudentID ,FirstName,LastName

--4. Select the highest and lowest mark for each student. 
Select  FirstName  + ' ' + LastName 'Student Name' , max(mark)'Highest', MIN(mark) 'Lowest' from student 
left outer join registration on Student.StudentID = registration.StudentID
group by student.StudentID,FirstName,LastName

--5. How many students are in each club? Display club name and count
Select ClubName, COUNT(activity.ClubId) 'Student Count' from Club left outer join Activity
on Club.ClubId = Activity.ClubId
group by club.ClubId,clubname
