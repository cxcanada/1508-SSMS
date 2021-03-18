--Inner Joins with aggregates
--Select the student names and the average mark for each student(that has registrations)
select firstname, lastname, avg(mark) from student
inner join registration on registration.studentid = student.studentid
group by student.studentid,firstname, lastname

select * from student



select someColumn from tableName1
inner join tableName2 on tableName1.bridge = tableName2.bridge



















Select firstname,lastname,avg(mark)'average' from student
inner join registration on student.StudentID=Registration.StudentID
group by firstname,lastname





--OH NO! Missing one student. We grouped on student names and students with the same name are getting their averages combined. 
--Always group by what uniquely identifies what you need to group on
Select firstname,lastname,avg(mark)'average' from student
inner join registration on student.StudentID=Registration.StudentID
group by student.studentid,firstname,lastname

--what is the average payment amount for each paymentype. 
--Show the paymenttype description and the average amount.
select paymenttypedescription, avg(amount) from PaymentType 
inner join payment on paymenttype.paymenttypeid = payment.paymenttypeid
group by paymenttype.paymenttypeid, paymenttypedescription









Select paymenttypedescription, avg(amount)'Average' from paymenttype inner join payment on paymenttype.PaymentTypeID=Payment.PaymentTypeID
group by paymenttype.paymenttypeid, PaymentTypeDescription










--Outer Joins
--Select all the position descriptions and the names of the staff in them
Select positiondescription, firstname,lastname from position 
left outer join staff on position.PositionID=staff.PositionID

select * from position
--Remember, inner joins only return records if they have related records in the join
--To get all the parent records (even if they have no child records) we can use outer joins!
--2 ways to write outer joins (left,right)
--can have the same functionality, it just depends on how you write your query to determine which one to use
--As a left outer join
Select positiondescription, firstname,lastname from position
left outer join staff on position.PositionID=staff.PositionID
--Selects ALL the  records from the table on the left side of the join statement and the related records from the table on the right
--As a right outer join
Select positiondescription, firstname,lastname from staff
right outer join position on position.PositionID=staff.PositionID
--Selects ALL the  records from the table on the right side of the join statement and the related records from the table on the left
--GENERAL RULE - Your join(s) should point to the records you want to keep
--IN a 2 table joins you will always point to the parent table

--Select ALL the student names and the number of payments each student has made
select firstname, lastname, count(paymentid) from student 
left outer join payment on payment.studentid = student.studentid
group by student.studentid, firstname, lastname

select * from student
select * from payment

Tables: student(parent) payment
outer join 
group by 
count(*)





--17 students
--33 payments
--7 students who have made payments
--10 students have made no payments
Select firstname,lastname, count(*)'paymentcount' from student
left outer join payment on student.StudentID=payment.StudentID
group by student.studentid, firstname,lastname
--all the students who have made 0 payments are showing 1 payment
--since we are counting(*) records they are counting 1 record due to the outer join

Select firstname,lastname, paymentid,amount from student
left outer join payment on student.StudentID=payment.StudentID

Select firstname,lastname, count(PaymentID)'paymentcount' from student
left outer join payment on student.StudentID=payment.StudentID
group by student.studentid, firstname,lastname
--for outerjoins and count() always count the PK of the child table

select * from payment