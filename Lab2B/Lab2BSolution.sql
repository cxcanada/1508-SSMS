--DMIT1508 OE02
--Lab2B  
--Xiao Chen

--2.Queries
--a.Select the first name, last name (as one column) and phone number from client with client id 4. (1 mark)
select firstname + ' ' + lastname 'ClientName', phone from client where clientid = 4

--b.For all clients, select the client first name, last name and the number of jobs they have. (3 marks)
select firstname, lastname, count(jobnumber) 'JobCount' from client left outer join 
job on client.clientid = job.clientid
group by client.clientid, firstname, lastname

--c.Select the average CostPerHour of the services.(1 mark)
select avg(CostPerHour) 'AverageCost' from service

--d.Create a single list of all the client and staff first names and last names in descending order by last name.(2 marks)
select firstname, lastname from client
UNION all
select firstname, lastname from staff
order by lastname desc

--e.Select the supply code and description for all the supplies that have been used on more than 2 jobs.(4 marks)
select supplycode, description from supply
where supplycode in (select supplycode from jobsupply group by supplycode having count(*) > 2 )

--f.Select jobnumber, date, full address(one column), sub, GST, total, staff name (one column), client name (one column) and phone number for job number 2. (3 marks)
select JobNumber, date, Address + ', ' + City + ', ' + Province + ' ' + PostalCode 'Address', SubTotal, GST, Total, staff.firstname + ' ' + staff.lastname 'StaffName', client.firstname + ' ' + client.lastname 'ClientName', client.phone from job
inner join client on client.clientid = job.clientid
inner join staff on staff.staffid = job.staffid
where jobnumber = 2

--g.Select all the supply descriptions whose category code starts with “P”.     (2 marks)
select description from supply where supplycategorycode like 'P%'

--h.Select the supply code and description of the supplies that have never been used on a job.(2 marks)
select supplycode, description from supply where supplycode not in (select supplycode from jobsupply)

--i.Select the first name, last name of the staff member who has taken the most number of training courses. You must use a subquery.(4 marks)
select firstname, lastname from staff inner join 
StaffTraining on staff.staffid = stafftraining.staffid
group by staff.staffid, firstname, lastname
having count(*) >= all (select count(*) from stafftraining group by staffid)

--j.Hard work has its rewards! On the last day of each month the staff member who worked on the job with the highest individual total in that month wins a $25 Tim Hortons gift card! Select the first name and the last name (one column) of that staff member.(4 marks)
select firstname + ' ' + lastname 'StaffName' from staff
inner join job on staff.staffid = job.staffid
where month(date) = month(getDate())
group by staff.staffid, firstname, lastname
having max(SubTotal) >= ALL(select max(subtotal) from job where month(date) = month(getDate()))

--k.How many supplies are there in each supply category? Select the supplycategorycode, description and the count.(3 marks)
select supplycategory.SupplyCategorycode, supplycategory.description, count(supply.SupplyCode) 'SupplyCount' from Supply right outer join 
supplycategory on supplycategory.SupplyCategorycode = Supply.SupplyCategorycode
group by supplycategory.SupplyCategorycode, supplycategory.description

--Views
--1
go
Create view ClientJobServices
as
select client.clientid, firstname, lastname, phone, job.jobnumber, date, subtotal, gst, total, description, hours from job
inner join client on client.clientid = job.clientid
inner join jobservice on jobservice.JobNumber = job.JobNumber
inner join service on service.ServiceCode = JobService.ServiceCode
go

--2
select clientid, firstname, lastname, sum(gst) 'ToalGST' from ClientJobServices
group by clientid, firstname, lastname

--DML
--1
go
insert into service(serviceCode, Description, CostPerHour)
values 
('Siding10', 'Basic Siding', 45),
('Scraping15', 'Scraping', 15)


--2
go
update service
set 
CostPerHour = CostPerHour * 0.9
where Description like '%construction%'

--3
go
update service
set
Description = 'Basic Priming',
CostPerHour = 15
where ServiceCode = 'Prime1'

--4
--Result in error. Cannot delete designated service because the service contains a foreign key field(ServiceCode) for child records.
go
delete service
where CostPerHour >= 25 and CostPerHour <= 45
