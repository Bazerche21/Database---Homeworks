USE [master]
GO

USE [SEDC_ACADEMY_HOMEWORK]
GO 

SELECT * FROM Student WHERE FirstName = 'Antonio';
GO

SELECT * FROM Student Where DateOfBirth > '1999-01-01';
GO

SELECT * FROM Student 
WHERE LastName LIKE 'J%' AND EnrolledDate >= '1998-01-01' AND EnrolledDate < '1998-02-01';
GO

SELECT * FROM Student ORDER BY FirstName
GO

SELECT LastName FROM Teacher 
UNION 
SELECT LastName FROM Student
GO

SELECT Course.Name, AchievementType.Name
FROM Course
CROSS JOIN AchievementType;


SELECT *
FROM Teacher t
WHERE NOT EXISTS (
    SELECT 1
    FROM Grade g
    INNER JOIN GradeDetails gd ON g.ID = gd.GradeID
    WHERE g.TeacherID = t.ID
);
GO

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student FOREIGN KEY (StudentID) REFERENCES Student(ID);

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Course FOREIGN KEY (CourseID) REFERENCES Course(ID);

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Teacher FOREIGN KEY (TeacherID) REFERENCES Teacher(ID);
Go

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade FOREIGN KEY (GradeID) REFERENCES Grade(ID);

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementType FOREIGN KEY (AchievementTypeID) REFERENCES AchievementType(ID);
