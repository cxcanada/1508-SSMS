--UPDATE
--1  
--failed as we are updating prmary key
update itemtype 
set
itemtypeid = 5
where ItemTypeDescription = 'Camera'

update itemtype
set 
ItemTypeDescription = 'Bright Lights'
where itemtypeid = 2

--2
update item 
set 
ItemDescription = 'Canon G3',
priceperday = 30
where itemid = 1

--failed as itemtypeid 5 does not exist. This is due to the FK constraint
update item 
set 
itemtypeid = 5
where itemid = 4

update item
set
PricePerDay = 30
where itemid = 4


--3
update staff
set
wage = 19
where staffid = 1

update staff
set 
StaffLastName = (select stafflastname from staff where staffid = 3),
wage = (select wage from staff where staffid = 3)
where staffid = 2


-- Our update target does not exist. It will not return an error and instead it will say 0 rows affected
update staff
set 
wage = 80
where staffid = 12


--DELETE
-- 1
-- 0 rows affected as staffid 8 does not exist
delete staff
where staffid = 8

--2
--as there is a child table referencing stafftypeid 1. we need to delete that staff before we delect this one.
delete stafftype
where stafftypeid = 1

--3
delete staff
where wage < 21.66

--4 
-- It worked. We deleted the child row which had stafftypeid 1 as FK in question 3.
delete stafftype
where stafftypeid = 1

--5
delete item
where itemid = 5

select * from itemtype
select * from Staff
select * from StaffType
select * from item