CREATE or ALTER PROCEDURE CreateGrade
(
    @StudentID int,
    @CourseID int,
    @TeacherID int,
    @Grade int,
    @Comment nvarchar(100),
    @CreatedDate datetime
)
AS
BEGIN
    
    INSERT INTO [dbo].[Grade](StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate)
    VALUES (@StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreatedDate);

    
    DECLARE @TotalGrades int;
    SELECT @TotalGrades = COUNT(*) FROM [dbo].[Grade] WHERE StudentID = @StudentID;

    --
    DECLARE @MaxGrade int;
    SELECT @MaxGrade = MAX(Grade) FROM [dbo].[Grade] WHERE StudentID = @StudentID AND TeacherID = @TeacherID;

    
    SELECT @TotalGrades as TotalGrades, @MaxGrade as MaxGrade;
END;
GO

DECLARE @StudentID int = 1; 
DECLARE @CourseID int = 1; 
DECLARE @TeacherID int = 1; 
DECLARE @Grade int = 85; -- 
DECLARE @Comment nvarchar(100) = 'Good';
DECLARE @CreatedDate datetime = getdate(); 

EXEC CreateGrade @StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreatedDate;

GO

CREATE or Alter PROCEDURE CreateGradeDetail
(
    @GradeID INT,
    @AchievementTypeID int,
    @AchievementPoints int,
    @AchievementMaxPoints int,
    @AchievementDate datetime
)
AS
BEGIN
    
    INSERT INTO [dbo].[GradeDetails] (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
    VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate);

 
    DECLARE @SumGradePoints decimal(18, 2);
    SELECT @SumGradePoints = SUM((CAST(AchievementPoints AS DECIMAL(10, 2)) / AchievementMaxPoints) * ParticipationRate)
    FROM [dbo].[GradeDetails] GD
    INNER JOIN [dbo].[AchievementType] AT ON GD.AchievementTypeID = AT.ID
    WHERE GD.GradeID = @GradeID;

   
    SELECT @SumGradePoints AS SumGradePoints;
END;

GO

DECLARE @GradeID int = 1; 
DECLARE @AchievementTypeID int = 1; 
DECLARE @AchievementPoints int= 3;
DECLARE @AchievementMaxPoints int = 5; 
DECLARE @AchievementDate datetime = GETDATE();

EXEC CreateGradeDetail @GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate;

GO
















