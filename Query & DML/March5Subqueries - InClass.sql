--SUBQUERIES
--Query that is used in another statement(query, insert, update, delete)
--Are full queries that can execute on their own
--Can usually be used anywhere a value is used
--can often be used instead of joins , BUT, joins are faster
--the subquery executes first and the results are used by the outer statement

Select * from staff
Select * from position
--join- Select all the staff names that are a 'dean'
Select firstname,lastname from staff inner join position
on staff.PositionID=position.PositionID
where PositionDescription='dean'
--subquery
Select firstname,lastname from staff 
where positionid = (Select positionid from position where PositionDescription='dean')

--join - Select the studentid, and names of students that have made payments
Select distinct Student.studentid, firstname,lastname from student 
inner join payment on student.StudentID=payment.StudentID

--subquery
Select studentid,firstname,lastname from student 
where studentid IN (Select studentid from payment)

select * from payment

--join - Select the studentid, and names of students that have made no payments
--Where/join
Select student.studentid,firstname,lastname from student
left outer join payment on student.StudentID=Payment.StudentID
where paymentid is null

--join, groupby, having, aggregate
Select student.studentid,firstname,lastname from student
left outer join payment on student.StudentID=Payment.StudentID
group by student.StudentID,firstname,lastname
having count(paymentid)=0

--subquery
Select studentid,firstname,lastname from student
where studentid NOT IN (Select studentid from payment)



--ALL
--Which city has the most number of students in it?

max(count(*))

Select city, count(*) from student
group by city
having count(*) >=All(Select count(*) from student group by city)


select paymenttypeid, count(*) from payment
group by paymenttypeid
having count(*) >=ALL (Select count(*) from payment group by paymenttypeid)

