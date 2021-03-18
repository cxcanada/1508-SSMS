--Subquery Exercise
--Use the IQSchool database for this exercise. Each question must use a subquery in its solution.
--**If the questions could also be solved without a subquery, solve it without one as well**
--1. Select the Payment dates and payment amount for all payments that were Cash
select paymentdate, amount from payment
inner join paymenttype on payment.PaymentTypeID = PaymentType.PaymentTypeID
where PaymentTypeDescription = 'cash'

select paymentdate, amount from payment
where  paymenttypeid = (select paymenttypeid from paymenttype where PaymentTypeDescription = 'cash')

--select paymentdate, amount from payment
--left outer join paymenttype on payment.PaymentTypeID = PaymentType.PaymentTypeID
--where PaymentTypeDescription = 'cash'

--2. Select The Student ID's of all the students that are in the 'Association of Computing Machinery' club
select studentid from activity
inner join club on activity.clubid = club.clubid
where clubname = 'Association of Computing Machinery'

select studentid from activity where clubid = (select clubid from club where clubname = 'Association of Computing Machinery')

--3. Select All the staff full names that have taught a course.
select firstname + ' ' + lastname 'StaffName' from staff
inner join offering on staff.staffid = offering.staffid
group by firstname, lastname 
having count(offering.staffid) > 0

select firstname + ' ' + lastname 'StaffName' from staff
where staffid in (select staffid from offering)

--4. Select All the staff full names that taught DMIT172.
select firstname + ' ' + lastname 'StaffName' from staff
inner join offering on staff.staffid = offering.staffid
where courseid = 'DMIT172'

select firstname + ' ' + lastname 'StaffName' from staff
where staffid in (select staffid from offering where courseid = 'DMIT172')


select * from course
select * from offering
select * from staff


--5. Select All the staff full names that have never taught a course
select firstname + ' ' + lastname 'StaffName' from staff
left outer join offering on staff.staffid = offering.staffid
where offering.staffid is null
--group by firstname, lastname
--having count(offering.staffid) = 0

select firstname + ' ' + lastname 'StaffName' from staff
where staffid not in (select staffid from offering)

--6. Select the Payment TypeID(s) that have the highest number of Payments made.

select paymenttypeid, count(*) 'count' from payment group by paymenttypeid
having count(*) >= All (select count(*) from payment group by paymenttypeid)

select * from payment
--7. Select the Payment Type Description(s) that have the highest number of Payments made.
select paymenttype.paymenttypeid, count(*) 'count' from payment 
inner join paymenttype on payment.paymenttypeid = paymenttype.paymenttypeid
group by paymenttype.paymenttypeid
having count(*) >= All (select count(*) from payment group by paymenttypeid)

--8. What is the total avg mark for the students from Edmonton?
select avg(mark) 'AverageMark' from student
inner join registration on student.studentid = registration.studentid
where city = 'Edmonton'

select avg(mark) 'AverageMark' from registration
where studentid in (select studentid from student where city = 'Edmonton')

--9. What is the avg mark for each of the students from Edmonton? Display their StudentID and avg(mark)
select student.studentid, avg(mark) 'AverageMark' from student
left outer join registration on student.studentid = registration.studentid
where city = 'Edmonton'
group by student.studentid

select studentid, avg(mark) 'AverageMark' from registration
where studentid IN (select studentid from student where city = 'Edmonton')
group by studentid 

select student.studentid, avg(mark) 'AverageMark' from registration
right outer join student on student.studentid = registration.studentid
where student.studentid IN (select studentid from student where city = 'Edmonton')
group by student.studentid