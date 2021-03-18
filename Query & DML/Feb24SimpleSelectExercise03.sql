--Simple Select Exercise 3

--1. Select the average mark for each offeringCode. Display the OfferingCode and the average mark.
select offeringCode, avg(mark) 'avg' from registration
group by offeringCode

--1. Select the average mark for each course. Display the CourseID and the average mark
Select CourseID, AVG(mark)'Average mark' from Registration 
inner join offering on Registration.OfferingCode = Registration.OfferingCode 
group by CourseID

--2. How many payments where made for each payment type. Display the Payment typeID and the count
select paymenttypeid, count(*) 'record' from payment
group by paymenttypeid


order by paymenttypeid desc   -- asc

select * from payment

--3. Select the average Mark for each studentID. Display the StudentId and their average mark
select studentid, avg(mark) 'avg' from registration
group by studentid

--4. Select the same data as question 3 but only show the studentID's and    (averages that are > 80)
select studentid, avg(mark) 'avg' from registration
group by studentid
having avg(mark) > 80

--5. How many students are from each city? Display the City and the count.
select city, count(*) 'count' from student
group by city

--6. Which cities have 2 or more students from them? (HINT, remember that fields that we use in the where or having do not need to be selected.....)
select city from student
group by city
having count(*) >= 2

--7.what is the highest, lowest and average payment amount for each payment type? 
select paymenttypeid, max(amount) 'max', min(amount) 'min', avg(amount) 'avg' from payment
group by paymenttypeid

--8. How many students are there in each club? Show the clubID and the count
select clubId, count(*) 'count' from activity
group by clubId

--9. Which clubs have 3 or more students in them?
select clubId from activity
group by clubId
having count(*) >= 3

