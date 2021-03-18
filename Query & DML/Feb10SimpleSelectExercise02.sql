--Simple Select Exercise 2
--Use IQSCHOOL Database
--1.Select the average Mark from all the Marks in the registration table
select avg(mark) 'AverageMark' from registration
--2.Select how many students are there in the Student Table
select count(*) 'StudentCount' from Student
--3.Select the average payment amount for payment type 5
select avg(Amount) from Payment where PaymentTypeID = 5
--4. Select the highest payment amount
select max(Amount) 'highest' from Payment
--5. Select the lowest payment amount
select min(Amount) 'lowest' from Payment
--6. Select the total of all the payments that have been made
select sum(Amount) from Payment
--7. How many different payment types does the school accept?
select count(*) 'PaymentTypeCount' from PaymentType
--8. How many students are in club 'CSS'?
select count(*) 'StudentCound'from activity where ClubId = 'CSS'
