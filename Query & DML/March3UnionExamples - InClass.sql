--UNION
--Combines the results of more than query into one result
--Select all the names in the school

Select firstname,lastname from staff--10
UNION 
Select firstname,lastname from student--17
--OH NO! :( :( we are missing 2 people!
--Union uses distinct by default

--to include duplicates we use UNION ALL
Select firstname,lastname from staff--10
UNION ALL
Select firstname,lastname from student--17



--RULES
--Can combine any number of queries
--queries must have the same number of columns
Select firstname,lastname from staff--10
UNION ALL
Select firstname,lastname,city from student--17

--Columns being combined must have similar datatypes
Select firstname,lastname from staff--10
UNION ALL
Select firstname,city from student--17

Select firstname,datehired from staff--10
UNION ALL
Select firstname,lastname from student--17
--datatypes of the resultant column come from the first query
--Names of the columns come from the first query

Select firstname'FName',lastname'LName' from staff--10
UNION ALL
Select firstname'stuff',lastname'who cares?' from student--17

--Select all the names in database and list the results in reverse alphabetical order by lastname
Select firstname'FName',lastname'LName' from staff--10
UNION ALL
Select firstname,lastname from student--17
order by lastname desc
