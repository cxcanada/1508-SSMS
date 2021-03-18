Drop Table JobService
Drop Table Service
Drop Table JobSupply
Drop Table Supply
Drop Table SupplyCategory
Drop Table Job
drop table Payment
Drop Table Client
Drop Table StaffTraining
Drop Table Training
Drop Table Staff
Drop Table StaffType

Create Table StaffType
(
StaffTypeCode int identity (1,1) not null
constraint pk_StaffType primary key clustered,
Description varchar (100) not null,
Wage smallmoney not null
constraint ck_Wage check (Wage >=0)
constraint df_Wage default 20,
)

Create Table Staff
(
StaffID int not null
constraint pk_Staff primary key clustered,
FirstName varchar (50) not null,
LastName varchar (50) not null,
TrainingCredits smallint not null,
StaffTypeCode int not null
constraint fk_StaffToStaffType references StaffType(StaffTypeCode),
Phone varchar(14) not null
constraint ck_StaffPhone check (Phone like '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')

)

Create Table Training
(
TrainingID varchar(20) not null
constraint pk_Training primary key clustered,
Description varchar(100) not null,
Credits tinyint not null
constraint ck_Credits check (Credits <=6)
constraint df_Credits default 3
)

Create Table StaffTraining
(
StaffID int not null
constraint fk_StaffTrainingToStaff references Staff(StaffID),
TrainingID varchar(20) not null
constraint fk_StaffTrainingToTraining references Training(TrainingID),
CompletionDate datetime not null,
constraint pk_StaffTraining primary key clustered (StaffID, TrainingID)
)
Create Table Client
(
ClientID int identity (1,1) not null
constraint pk_Client primary key clustered,
FirstName varchar(50) not null,
LastName varchar(50) not null,
Phone char (14) not null
constraint ck_Phone check (Phone like '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
Balance money not null constraint df_Balance default  0
)

Create Table Job
(
JobNumber int identity (1,1) not null
constraint pk_Job primary key clustered,
Date datetime not null,
Address varchar(100) not null,
City varchar (50) not null,
Province char(2) not null
constraint ck_Province check (Province like '[a-z][a-z]'),
PostalCode char(7) not null
constraint ck_PostalCode check (PostalCode like '[a-z][0-9][a-z] [0-9][a-z][0-9]'),
SubTotal money not null,
GST money not null,
Total money not null,
StaffID int not null
constraint fk_JobToStaff references Staff(StaffID),
ClientID int not null
constraint fk_JobToClient references Client(ClientID),
constraint ck_SubTotalandTotal check (Total > Subtotal)
)

Create Table SupplyCategory
(
SupplyCategoryCode varchar (5) not null
constraint pk_SupplyCategory primary key clustered,
Description varchar(100) not null,
StorageRoom varchar (5) not null
)

Create Table Supply
(
SupplyCode varchar(8) not null
constraint pk_Supply primary key clustered,
Description varchar(100) not null,
SupplyCategoryCode varchar(5) not null
constraint fk_SupplyToSupplyCategory references SupplyCategory(SupplyCategoryCode)
)

Create Table JobSupply
(
JobNumber int not null
constraint fk_JobSupplyToJob references Job(JobNumber),
SupplyCode varchar(8) not null
constraint fk_JobSupplyToSupply references Supply(SupplyCode),
Quantity smallint not null,
constraint pk_JobSupply primary key clustered (JobNumber, SupplyCode)
)

Create Table Service
(
ServiceCode varchar(15) not null
constraint pk_Service primary key clustered,
Description varchar(100) not null,
CostPerHour smallmoney not null
)

Create Table JobService 
(
JobNumber int not null
constraint fk_JobServiceToJob references Job(JobNumber),
ServiceCode varchar(15) not null
constraint fk_JobServiceToService references Service(ServiceCode),
Notes varchar(200) not null,
hours int not null,
ActualCostPerHour smallmoney not null,
ExtCost smallmoney not null,
constraint pk_JobService primary key clustered (JobNumber, ServiceCode)
)

Create Table Payment
(
PaymentID int not null identity (1,1) constraint pk_Payment primary key clustered,
Date datetime not null,
Amount smallmoney not null,
ClientID int not null
constraint fk_PaymentToClient references Client(ClientID)
)

Alter Table Client
add
Email varchar(100) null
constraint ck_Email check (Email like '%@%.%')

Alter Table Staff
add
Available char(1) not null
constraint ck_Available check (Available like '[YN]')
constraint df_Available default 'Y'

Alter Table Job
add
constraint df_Province default 'AB' for Province

--Non clustered indexes here

Create nonclustered index IX_StaffTraining_TrainingID
on StaffTraining (TrainingID)
Create nonclustered index IX_StaffTraining_StaffID
on StaffTraining (StaffID)
Create nonclustered index IX_Staff_StaffTypeCode
on Staff (StaffTypeCode)
Create nonclustered index IX_Job_ClientID
on Job (ClientID)
Create nonclustered index IX_Job_StaffID
on Job (StaffID)
Create nonclustered index IX_JobService_JobNumber
on JobService (JobNumber)
Create nonclustered index IX_JobService_ServiceCode
on JobService (ServiceCode)
Create nonclustered index IX_JobSupply_JobNumber
on Jobsupply (JobNumber)
Create nonclustered index IX_JobSupply_SupplyCode
on JobSupply (SupplyCode)

--Lab 2 insert script
--IMPORTANT! If you need to run this script more than once you must drop and recreate your tables first to reset the identity properties.
Delete JobService
Delete Service
Delete JobSupply
Delete Supply
Delete SupplyCategory
Delete Job
Delete Payment
Delete Client
Delete StaffTraining
Delete Training
Delete Staff
Delete StaffType




Insert into StaffType (Description,Wage)
values ('Painter',25)
Insert into StaffType (Description,Wage)
values ('Sander',20)
Insert into StaffType (Description,Wage)
values ('Builder',30)
Insert into StaffType (Description,Wage)
values ('Demolition',35)
Insert into StaffType (Description,Wage)
values ('Cleaning',15)


Insert into Staff (StaffID,FirstName,LastName,TrainingCredits,StaffTypeCode,phone)
values (11111,'Jason','Painter',12,1,'(780) 111-2222')
Insert into Staff (StaffID,FirstName,LastName,TrainingCredits,StaffTypeCode,phone)
values (22222,'Suzy','Cleaner',12,5,'(780) 111-3333')
Insert into Staff (StaffID,FirstName,LastName,TrainingCredits,StaffTypeCode,phone)
values (33333,'Alex','Boom',13,4,'(780) 111-4444')
Insert into Staff (StaffID,FirstName,LastName,TrainingCredits,StaffTypeCode,phone)
values (44444,'Adam','Scraper',15,2,'(780) 111-5551')
Insert into Staff (StaffID,FirstName,LastName,TrainingCredits,StaffTypeCode,phone)
values (55555,'Bob','LaBuilder',21,3,'(780) 111-6666')

Insert into Training (TrainingID, Description, Credits)
values ('Paint101','Introduction to Painting',3)
Insert into Training (TrainingID, Description, Credits)
values ('Finishing123','Sanding and Finishing',6)
Insert into Training (TrainingID, Description, Credits)
values ('Cleaning224','Cleaning and Clearing',3)
Insert into Training (TrainingID, Description, Credits)
values ('Demolition101','Making Things go Boom!',4)
Insert into Training (TrainingID, Description, Credits)
values ('Safety104','Basic Safety Protocols',3)
Insert into Training (TrainingID, Description, Credits)
values ('Repairs105','Basic Repairs',3)
Insert into Training (TrainingID, Description, Credits)
values ('ClientConflict202','Dealing with Grumpy Clients',6)
Insert into Training (TrainingID, Description, Credits)
values ('Building321','Basic Building Concepts',6)


Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (11111,'Paint101','Jan 1 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (11111,'Safety104','Jan 4 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (11111,'ClientConflict202','Jan 7 2016')

Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (22222,'Cleaning224','Jan 1 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (22222,'Safety104','Jan 4 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (22222,'ClientConflict202','Jan 7 2016')

Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (33333,'Demolition101','Jan 1 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (33333,'Safety104','Jan 4 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (33333,'ClientConflict202','Jan 7 2016')

Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (44444,'Finishing123','Jan 1 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (44444,'Safety104','Jan 4 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (44444,'ClientConflict202','Jan 7 2016')

Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (55555,'Building321','Jan 1 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (55555,'Safety104','Jan 4 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (55555,'ClientConflict202','Jan 7 2016')
Insert into StaffTraining(StaffID, TrainingID, CompletionDate)
values (55555,'Finishing123','Jan 7 2016')

Insert into Client (FirstName, LastName, Phone)
values ('Peggy', 'Sue','(780) 111-1111')
Insert into Client (FirstName, LastName, Phone)
values ('Maggie', 'May','(780) 222-2222')
Insert into Client (FirstName, LastName, Phone)
values ('Billy', 'Jean','(780) 111-1111')
Insert into Client (FirstName, LastName, Phone)
values ('Bobby', 'McGee','(780) 111-1111')
Insert into Client (FirstName, LastName, Phone)
values ('Tom', 'Dooly','(780) 111-1111')
Insert into Client (FirstName, LastName, Phone)
values ('Mary', 'Jane','(780) 111-1111')
Insert into Client (FirstName, LastName, Phone)
values ('Jimmy', 'Mack','(780) 111-1111')
Insert into Client (FirstName, LastName, Phone)
values ('Eleanor', 'Rigby','(780) 111-1111')

Insert Into Service (ServiceCode,Description,CostPerHour)
values ('Prime1','Priming',20)
Insert Into Service (ServiceCode,Description,CostPerHour)
values ('Painting1','Painting',20)
Insert Into Service (ServiceCode,Description,CostPerHour)
values ('Construction10','Basic Construction',40)
Insert Into Service (ServiceCode,Description,CostPerHour)
values ('Construction20','Advanced Construction',60)
Insert Into Service (ServiceCode,Description,CostPerHour)
values ('Demolition','Demolition of Property',30)
Insert Into Service (ServiceCode,Description,CostPerHour)
values ('Sanding1','Surface Sanding',20)
Insert Into Service (ServiceCode,Description,CostPerHour)
values ('Cleaning1','Basic Cleaning',20)
Insert Into Service (ServiceCode,Description,CostPerHour)
values ('Garbage1','Removal of Graffit Refuse',25)




Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('Jan 1 2019','12345 Anywhere Street','Edmonton', 'AB','T3D 1S5',120,6,126,11111,1)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (1,'Prime1','Prime fence beside the house',3,20,60)
Insert Into JobService (JobNumber, ServiceCode, Notes,hours, ActualCostPerHour, extcost)
values (1,'Painting1','Prime fence beside the house',3,20,60)

Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('Jan 2 2019','12345 First Street','Edmonton', 'AB','T3A 1A5',160,8,168,11111,1)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (2,'Sanding1','Sand the wall',5,20,100)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (2,'Painting1','Paint the wall',3,20,60)

Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('Jan 3 2019','12345 Second Street','Edmonton', 'AB','T3B 1B5',20,1,21,11111,1)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (3,'Painting1','Paint the door',1,20,20)

Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('Jan 3 2019','12345 Third Street','Edmonton', 'AB','T3C 1C5',40,2,42,22222,2)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (4,'Cleaning1','Clean the wall',2,20,40)


Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('Jan 4 2019','12345 Fourth Street','Edmonton', 'AB','T3D 1D5',80,4,84,22222,2)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (5,'Cleaning1','Clean the fence',4,20,80)


Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('February 5 2019','12345 Fifth Street','Edmonton', 'AB','T3E 1E5',40,2,42,11111,3)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (6,'Painting1','Paint the sign',2,20,40)


Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('Jan 6 2019','12345 Sixth Street','Edmonton', 'AB','T3F 1F5',60,3,63,33333,5)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (7,'Demolition','Take down the sign',2,30,60)


Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('Jan 7 2019','12345 Seventh Street','Edmonton', 'AB','T3G 1G5',110,5.5,115.5,33333,1)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (8,'Demolition','Clean the wall',2,30,60)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (8,'Garbage1','Clean the wall',2,25,50)

Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('February 8 2019','12345 Eighth Street','Edmonton', 'AB','T3H 1H5',40,2,42,44444,6)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (9,'Sanding1','Sand the blue fence',2,20,40)


Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('March 12 2019','12345 Ninth Street','Edmonton', 'AB','T3I 1I5',20,1,21,44444,7)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (10,'Sanding1','Sand the table',1,20,20)


Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('February 28 2019','12345 Tenth Street','Edmonton', 'AB','T3J 1J5',200,10,210,55555,8)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (11,'Construction10','Rebiuld Table',5,40,200)


Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('March 1 2019','12345 Eleventh Street','Edmonton', 'AB','T3K 1K5',600,30,630,55555,3)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (12,'Construction20','Build new shed',10,60,600)


Insert into Job (Date, Address, City,Province,PostalCode,SubTotal,GST,Total,StaffID,ClientID)
values ('March 3 2019','12345 Twelth Street','Edmonton', 'AB','T3L 1L5',240,12,256,11111,8)
Insert Into JobService (JobNumber, ServiceCode, Notes, Hours,ActualCostPerHour, extcost)
values (13,'Cleaning1','Clean the whole house!',12,20,240)


Insert Into SupplyCategory (SupplyCategoryCode, Description, StorageRoom)
values ('P5','5 Gallon Paint Products','A101')
Insert Into SupplyCategory (SupplyCategoryCode, Description, StorageRoom)
values ('P10','10 Gallon Paint Products','A101')
Insert Into SupplyCategory (SupplyCategoryCode, Description, StorageRoom)
values ('P20','20 Gallon Paint Products','A105')
Insert Into SupplyCategory (SupplyCategoryCode, Description, StorageRoom)
values ('S101','Sanding Supplies','S101')
Insert Into SupplyCategory (SupplyCategoryCode, Description, StorageRoom)
values ('B123','Demolition Equipment','DM212')
Insert Into SupplyCategory (SupplyCategoryCode, Description, StorageRoom)
values ('CL10','All Cleaning Supplies','B232')
Insert Into SupplyCategory (SupplyCategoryCode, Description, StorageRoom)
values ('B100','Building and Construction Materials','B202')
Insert Into SupplyCategory (SupplyCategoryCode, Description, StorageRoom)
values ('PR100','Primers','A211')
Insert Into SupplyCategory (SupplyCategoryCode, Description, StorageRoom)
values ('W100','Water','W211')


Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('PR104','Grey Primer','PR100')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('RP5','5 Gallon RedPaint','P5')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('BP10','10 Gallon Blue Paint','P10')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('GP20','20 Gallon Green Paint','P20')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('SP10','Sanding Paper','S101')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('PR105','White Primer','PR100')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('PR106','Black Primer','PR100')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('D100','Large Hammer','B123')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('DS100','Drywall Saw','B123')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('L100','Ladder','B100')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('N100','Nails','B100')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('C100','Soap','CL10')
Insert Into Supply (SupplyCode,Description, SupplyCategoryCode)
values ('S100','Sponge','CL10')

Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(1,'BP10',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(1,'PR104',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(2,'PR104',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(2,'SP10',4)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(3,'RP5',1)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(4,'C100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(4,'S100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(5,'C100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(5,'S100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(6,'RP5',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(7,'DS100',1)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(8,'D100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(9,'SP10',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(10,'SP10',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(11,'D100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(11,'N100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(12,'L100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(12,'D100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(12,'N100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(13,'C100',2)
Insert into JobSupply (JobNumber,SupplyCode,Quantity)
values(13,'S100',2)








Select * from JobService
Select * from  Service
Select * from  JobSupply
Select * from  Supply
Select * from  SupplyCategory
Select * from  Job
Select * from  Client
Select * from  StaffTraining
Select * from  Training
Select * from  Staff
Select * from  StaffType






 
