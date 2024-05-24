CREATE DATABASE SEDCACADEMYDB;
GO

USE SEDCACADEMYDB;
GO

CREATE TABLE Students(
	StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    BirthDate DATE,
    Gender NVARCHAR(10),
    Email NVARCHAR(100) UNIQUE,
    PhoneNumber NVARCHAR(15),
)

CREATE TABLE Teachers(
	TeacherID INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    PhoneNumber NVARCHAR(15)
)

CREATE TABLE Grades(
	GradeID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    CourseID INT,
    AchievementTypeID INT,
    GradeValue DECIMAL(4, 2) CHECK (GradeValue >= 0.00 AND GradeValue <= 10.00),
)

CREATE TABLE Courses(
	CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    Credits INT,
    TeacherID INT,
)

CREATE TABLE AchievementTypes (
    AchievementTypeID INT PRIMARY KEY IDENTITY(1,1),
    TypeName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(MAX)
)

CREATE TABLE GradeDetails (
    GradeDetailID INT PRIMARY KEY IDENTITY(1,1),
    GradeID INT,
    Details NVARCHAR(MAX),
    DateRecorded DATE,
)
GO