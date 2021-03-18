--Create a database for our create table examples
--Create Database CreateTableExamplesE02
--Every Attribute needs a name, datatype, and a null/not null

--Ctrl-Shift-R is intelligence refresh and that will often make red squiggles go away when they should not be there


--PK and FK are a type of constraint. Most constraints enforce rules
--PK enforces a rule that all values must be unique
--FK enforces a rule that the value in the FK field must exist in the PK field of the parent

--2 levels of contraints
--Column level
	--constraint involves only one column
	--Coded on the same line as the column definition
--Table Level
	--constraint involves more than one column
	--Code on a new line (should be at the end of the table for readability)
--ALL constraints must have a name

--Column Level PK constraint syntax
--Constraint pk_name Primary Key clustered

--Table Level PK constraint Syntax
--Constraint pk_name Primary Key clustered (column1, column2, etc)

--Column Level FK constraint syntax
--Constraint fk_name references ParentTableName(PK Name)

--Table Level FK constraint syntax


--To Remove a table from the database(and all the data in it)
Drop Table MovieReview
Drop Table Reviewer
Drop Table Movie

--You must create parent tables before their related child tables

--Movie
Create Table Movie
(
MovieID int not null constraint pk_Movie Primary Key Clustered,
Title varchar(90) not null,
ReleaseDate smalldatetime null,
ReviewScore char(1) null,
Budget money null,
Length decimal(5,2) not null,
InStock bit not null
)

--Insert into Movie (MovieID,title, ReleaseDate,ReviewScore,Budget,Length,InStock)
--values (3,'star wars II', 'feb 1 1977', 5,100000,90,1)

--select * from movie
Create Table Reviewer
(
ReviewerNumber int not null constraint pk_Reviewer Primary Key Clustered,
FirstName varchar(30) not null,
LastName varchar(30) not null
)

Create Table MovieReview
(
MovieID int not null constraint fk_MovieReviewToMovie references Movie(MovieID),
ReviewerNumber int not null constraint fk_MovieReviewToReviewer references Reviewer(ReviewerNumber),
Rating char(1) null,
ReviewDate smalldatetime null,
constraint pk_MovieReview Primary Key Clustered(MovieID,ReviewerNumber)
)



