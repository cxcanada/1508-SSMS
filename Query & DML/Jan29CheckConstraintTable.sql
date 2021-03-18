--Default constraint - A value that is placed in a field if not value is provided
--constraint df_name default value

--Check constraint - Check the incoming data to see if it meets certain criteria
	--Basic value checks
	--Pattern Matching 

--constraint ck_name check (expression/condition)

--Wildcards - Represent anything
-- % - Any number of anything
-- _ - Any single anything
--When using wildcards you must use like instead of =

Drop table CheckConstraint

Create table CheckConstraint
(
ConstraintID int not null identity (1,1) constraint pk_CheckConstraint primary key clustered,
ConstraintType char (3) not null,
PurchaseDate datetime not null,
Cost smallmoney not null 
--constraint ck_ValidCost check (Cost>=0)
--constraint ck_ValidCost check(Cost>=0 and Cost<=100)
--constraint ck_ValidCost check(Cost between 0 and 100)
constraint df_CheckConstraintCost default 0,
--SellPrice must be at least double Cost
SellPrice smallmoney not null ,
active char(1) not null
--constraint ck_ValidActive check (active='y' or active='n'),
--constraint ck_ValidActive check (active='a' or active='b' or active='c'or....),
--constraint ck_ValidActive check (active between 'a' and 'g' or active = 'j' or active='q'),
constraint ck_ValidActive check (active IN('c','g','r','q','x')),  -- IN is like "=" but it is checking multiple characters
code varchar (30) not null 
--constraint ck_ValidCode check (Code like 's%'),
--constraint ck_ValidCode check (Code like 's%r'),
--r is the third character and z is the sixth character
constraint ck_ValidCode check (Code like '__r__z%'),
identifier varchar (30) not null,
PostalCode char(7) not null
constraint ck_ValidPostalCode check (PostalCode like'[a-z][0-9][a-z] [0-9][a-z][0-9]' ),  -- range
Phone char(13) not null
constraint ck_phone check (Phone like '([1-9][0-9][0-9])[1-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
constraint ck_ValidSellPrice check (SellPrice>=2 * Cost)
)

Insert into CheckConstraint(ConstraintType,PurchaseDate,cost,SellPrice,active,code,identifier,PostalCode,Phone)
values('abc','Jan 20 2021',100,200,'r','abrj4zsuoijs8','ahh37khelloqworldi5Fridayz','T8R 1k2','(555)555-5555')

Select * from CheckConstraint

--on identifier column

--a
--any 3 characters
--number between 5-8
--any single letter
--anything
--q
--anything
--i
--any number
--anything
--ends in Z