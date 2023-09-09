--Calculate the count of all grades per Teacher in the system
--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

--SELECT
--    Teacher.ID AS TeacherID,
--    Teacher.FirstName AS TeacherFirstName,
--    Teacher.LastName AS TeacherLastName,
--    COUNT(Grade.ID) AS GradeCount
--FROM
--    Teacher
--LEFT JOIN
--    Grade ON Teacher.ID = Grade.TeacherID
--WHERE
--    Grade.StudentID < 100
--GROUP BY
--    Teacher.ID, Teacher.FirstName, Teacher.LastName 
--ORDER BY
--    TeacherID;

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system

--SELECT
--	Student.ID as StudentId,
--	Student.FirstName as StudentName,
--	Student.LastName as StudentLastName,
--	MAX(Grade.Grade) As MaxGrade,
--	AVG(Grade.Grade) AS AvgGrade
--FROM 
--	Student
--LEFT JOIN
--    Grade ON Student.ID = Grade.StudentID
--group by 
--	Student.ID, Student.FirstName, Student.LastName
--ORDER BY
--	Student.ID

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

--SELECT
--    Teacher.ID AS TeacherID,
--    Teacher.FirstName AS TeacherFirstName,
--    Teacher.LastName AS TeacherLastName,
--    COUNT(Grade.Grade) AS CountGrade,
--FROM
--    Teacher
--LEFT JOIN
--    Grade ON Teacher.ID = Grade.TeacherId
--GROUP BY
--    Teacher.ID, Teacher.FirstName, Teacher.LastName
--HAVING
--    COUNT(Grade.Grade) > 200
--ORDER BY
--    TeacherID;

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in thesystem. 
--Filter only records where Maximal Grade is equal to Average Grade. (Calculate statistics forall students, but display only those with above-average results.)

--SELECT
--	Student.ID as StudentId,
--	Student.FirstName as StudentName,
--	Student.LastName as StudentLastName,
--	COUNT(Grade.ID) as CountGrade,
--	Max(Grade.Grade) as MaxGrade,
--	AVG(Grade.Grade) as AvgGrade
--FROM
--	Student
--LEFT JOIN Grade on Student.ID = Grade.StudentID
--GROUP BY 
--	Student.ID, Student.FirstName, Student.LastName
--HAVING 
--	MAX(Grade.Grade) = AVG (Grade.Grade)
--ORDER BY
--	StudentID

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

--CREATE VIEW vv_StudentGrades AS
--SELECT
--	Student.ID AS StudentId,
--	COUNT(Grade.ID) AS GradeCount
--FROM
--Student
--LEFT JOIN Grade ON  Student.ID = Grade.StudentID
--Group BY
--	Student.ID;

--ALTER VIEW vv_StudentGrades AS
--SELECT
--	Student.FirstName AS StudentName,
--	Student.LastName AS StudentLastName,
--	COUNT(Grade.ID) AS GradeCount
--FROM
--Student
--LEFT JOIN Grade ON  Student.ID = Grade.StudentID
--Group BY
--	Student.FirstName, Student.LastName

SELECT *
FROM vv_StudentGrades
ORDER BY GradeCount DESC;






