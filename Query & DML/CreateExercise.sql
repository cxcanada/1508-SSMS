drop table activity
drop table grade
drop table student
drop table course
drop table club


create table Student
(
	StudentId int not null,
	StudentFirstName varchar(40) not null,
	StudentLastName varchar(40) not null,
	GenderCode char(1) not null,
	Address varchar(30) null,
	Birthdate datetime null,
	PostalCode char(6) null,
	AvgMark decimal(4,1) null,
	NoOfCourses smallint null	
)

create table Grade
(
	StudentId int not null,		
	CourseId char(6) not null,		
	Mark smallint null
	)
create table Course
(
	CourseId char(6) not null,
	CourseName varchar(40) not null,
	Hours smallint null,
	NoOfStudents smallint null
)

create table Club
(
	ClubId int not null,
	ClubName varchar(50) not null
)


create table Activity
(
	StudentId int not null,
	ClubId int not null	
)