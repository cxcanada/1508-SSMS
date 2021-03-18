--GROUP BY and Having
--Group BY
Select * from staff
select * from position
--How many staff are in the staff table?
Select count(*) 'StaffCount' from staff
--How many staff are there in each position? Show the positionID and the count.
Select positionid, count(*)'StaffCount' from staff
Group by positionid
-- This will list each positionid and the count of each positionid
-- For each column value(that is grouped by), run aggregate function.

--Group by performs subtotals for each different value you are grouping on.
--ALL COLUMNS IN A QUERY THAT HAS A GROUP BY ***MUST*** BE IN THE AGGREGATE FUNCTION OR THE GROUP BY CLAUSE
--GROUP BY IS ONLY USED WITH AGGREGATES
--DO NOT USE GROUP BY FOR ORDERING RESULTS. USE ORDER BY

--List the staff in alphabetical order by lastname
--BAD :(:(
Select firstname,lastname, datehired, datereleased from staff
group by lastname,firstname,datehired,datereleased
--GOOD :):)
Select firstname,lastname, datehired, datereleased from staff
order by lastname asc

--How many payments has each student(that has made payments) made? Show/select the studentid and the count?

select studentid, count(*) 'Count'from payment
group by studentid

select * from payment

--What is the avg payment amount for each student (that have made payments). Show the studentid and the avg

select studentid, avg(amount) ' avg ' from  payment
group by studentid

--How much money has each student paid? Show the studentid and the amount
Select Studentid, sum(amount)'Amount' from payment
group by studentid

--Mulitple
Select StudentID, avg(amount)'avg',sum(amount)'sum', count(*)'count' from Payment 
group by studentid

--do not need to select the column you are grouping on 
Select avg(amount)'avg',sum(amount)'sum', count(*)'count' from Payment 
group by studentid
-- select will show the selected column, but it does not affect group by clause operation

--how many payments each student has made
Select studentid, count(*)'Count' from payment 
group by StudentID

--which students have made more than 4 payments?
Select studentid, count(*)'Count' from payment 
group by StudentID
where count(*) >4       --This is wrong

--1. where must be before group by
Select studentid, count(*)'Count' from payment 
where count(*) >4
group by StudentID

--2. we cannot use aggregates in where clauses. Instead, we can use having.
Select PaymentTypeID, count(*)'Count' from payment 
group by PaymentTypeID
having count(*)>=5
--Having is like a where clause but it works on the results of the group by and only looks at the aggregate column(s). (Min,max,sum,count,avg)
--Having will always have min, max, sum, count,avg after it
--NEVER USE IT AS A WHERE CLAUSE WITH NON AGGREGATE COLUMNS (HAVING LASTNAME='SMITH) :(:(

--Aggregate -->Group by -->Having
--which positions have more than one staff in them? Show the firstname, lastname and the count.
select firstname, lastname, count(*) 'count' from staff
group by staffid, firstname, lastname




where DateReleased is null
group by positionid
having count(*) > 1

Select positionid, count(*)'count' from staff
group by positionid
having count(*) >1

--Same question, but only include staff that still work at the school
Select positionid, count(*)'count' from staff
where DateReleased is not null --this chooses the records that are used in the aggregate calculation
group by positionid
having count(*) >1

select * from staff








