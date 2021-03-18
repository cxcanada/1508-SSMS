--Command for creating new database
--Create Database CreateTableExamplesE02

drop Table Activity
drop Table Grade
drop Table Student
drop Table Course
drop Table Club


Create Table Student
(
	StudentID int not null 
		constraint PK_Student Primary Key clustered,
	StudentFirstName varchar(40) not null,
	StudentLastName varchar(40) not null,
	GenderCode char(1) not null,
	Address varchar(30) null,
	Birthdate datetime null,
	PostalCode char(6) null,
	AvgMark decimal(4,1) null,
	NoOfCourses smallint null
)

Create Table Course
(
	CourseID char(6) not null 
		constraint PK_Course Primary Key clustered,
	CourseName varchar(40) not null,
	Hours smallint null,
	NoOfStudents smallint null
)

Create Table Club
(
	ClubID int not null 
		constraint PK_Club Primary Key clustered,
	ClubName varchar(50) not null
)

Create Table Grade
(
	StudentID int not null constraint 
		FK_GradeToStudent references Student(StudentID) ,
	CourseID char(6) not null constraint 
		FK_GradeToCourse references Course(CourseID),
	Mark smallint null,
	constraint PK_Grade Primary Key clustered (StudentID, CourseID)
)



Create Table Activity
(
	StudentID int not null 
		constraint FK_ActivityToStudent references Student(StudentID),
	ClubID int not null constraint 
		FK_ActivityToClub references Club(ClubID),
	constraint PK_Activity Primary Key Clustered (StudentID, ClubID)		
)


