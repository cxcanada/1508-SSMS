drop table tracks
drop table album

Create Table Album
(
AlbumID int identity (1,1) not null constraint pk_album primary key  clustered,
Title varchar (100) not null,
Rating char(1) not null 
constraint ck_ratingrange check(Rating between 0 and 5)
constraint df_0rating default 0,
Artist varchar (100) null,
SuggestedPrice smallmoney null
)

Create Table Tracks
(
TrackID tinyint not null,
AlbumID int not null 
constraint fk_TracksToAlbum references Album(AlbumID),
Title varchar (50) not null,
Length tinyint null,
constraint pk_Tracks primary key clustered (TrackID, AlbumID)
)
Select * from album

--cannot insert a value into identity columns



insert into table(column1, column2, column3 ....)
values
(' ', 2, '3'),
(' ', 3, '4')


Insert into album()
values
(1,'greatest hits','5','ABBA',5)
--remove the identity field value
Insert into album values('greatest hits','5','ABBA',5)
--works!! BUT NEVER DO IT THIS WAY :(:(
--ALWAYS specify the columns
Insert into album(title, rating,artist,SuggestedPrice)
values('good tunes',2,'who cares?',1)
--must have the same number of values and columns
Insert into album(title, rating,artist,SuggestedPrice)
values('good tunes',2,'who cares?')
Insert into album(title, rating,artist)
values('good tunes',2,'who cares?',1)

--NULLS
Insert into album(title, rating,artist,SuggestedPrice)
values('good tunes',2,'who cares?',null)
--OR
Insert into album(title, rating,artist)
values('good tunes',2,'who cares?')

--DEFAULTS
Insert into album(title, rating,artist,SuggestedPrice)
values('good tunes',default,'who cares?',1)
--OR
Insert into album(title, artist,SuggestedPrice)
values('good tunes','who cares?',1)

--Subqueries
--you can use a subquery anywhere you need a value
--Add an album with the same price as the average price of all the other albumns
Insert into album(title, rating,artist,SuggestedPrice)
values('good tunes',2,'who cares?',(Select avg(suggestedprice) from album))
--why does this fail
Insert into album(title, rating,artist,SuggestedPrice)
values('good tunes',2,'who cares?',(Select suggestedprice from album))
--a subquery in an insert value list must return only a single value

select * from album
select * from tracks
--TRACKS
Insert into tracks(albumid, TrackID,Title,Length)
values(1,2,'Let''s boogey to SQL',12)
--whats wrong here?
Insert into tracks(albumid, TrackID,Title,Length)
values(20,2,'Let''s boogey to SQL',12)
--fails on the FK because there is no album 20

--Insert more than one record at a time
--Copy all the records from the Album table into a backup album table
Create Table AlbumBackup
(
AlbumID int not null constraint pk_albumBackup primary key  clustered,
Title varchar (100) not null,
Rating char(1) not null,
Artist varchar (100) null,
SuggestedPrice smallmoney null
)

Insert into AlbumBackup(AlbumID,title,Rating,Artist,SuggestedPrice)
Select albumid, title,rating,artist, suggestedprice from album

Select * from AlbumBackup

--Update
--Can Update one or many records
--Can update one or many columns

--Update TableName
--Set
--ColumnName=Value,
--ColumnName=Value,
--ColumnName=Value
--where ...... (optional)

Insert into album(title, rating,artist,SuggestedPrice)
values
('good tunes',5,'ABBA',5),
('good tunes',5,'ABBA',3),
('good tunes',5,'ABBA',2),
('good tunes',5,'ABBA',4.5)

select * from album
--update one record
--Never update the PK
Update Album
Set
SuggestedPrice=1.5,
rating=3
where albumID = 2

--update all the albums that have a suggested price > the avg price of all the albums. Set the rating to 2 for those albums
Update album
set
Rating=2
where SuggestedPrice>(Select avg(suggestedprice) from album)
--update the suggestedprice for album 1 to be the same price of album 4
Update album
set
SuggestedPrice=(Select SuggestedPrice from album where AlbumID=4)
where AlbumID=1
--Subtract 1.00 from all the suggestedprices that have a rating less than 3
Update album
set
SuggestedPrice= SuggestedPrice-1
where rating <3
--OR
Update album
set
SuggestedPrice -= 1
where rating <3

select * from album

--DELETE
--Can delete one or many records

--Delete tablename
--where ...... (optional)
Delete Album 
where rating = 3

--Delete albums that have a price > avg price
Delete album
where SuggestedPrice >(Select avg(suggestedprice) from album)