-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
/*	Declare scalar variable for storing FirstName values
	Assign value ‘Antonio’ to the FirstName variable
	Find all Students having FirstName same as the variable    */
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
create or alter function FirstNameStoring (@firstName nvarchar(255), @lastName nvarchar(255))
returns nvarchar (255)
as
begin
SET @firstName = 'Antonio';
return @firstName + ' ' + @lastName
end;
go
select dbo.FirstNameStoring(FirstName, LastName) as [Student First Name] from Student;
------------------------------------------------------------------------------------------
declare @firstName nvarchar(255);
set @firstName = 'Antonio';

select
*
from Student
where FirstName = @firstName;
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*	Declare table variable that will contain StudentId, StudentName and DateOfBirth
		Fill the table variable with all Female students*/
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

create or alter function StudentIDB(@studentId int, @studentName nvarchar(255), @dateOfBirth date)
returns nvarchar (max)
as
begin
return (CAST(@studentId as nvarchar(50)) +'  '+ @studentName +'  '+ CAST(@dateOfBirth as nvarchar(50)))
end;

select dbo.StudentIDB (ID, FirstName, DateOfBirth) as [StudentPodaci] 
from Student 
where Gender = 'F';
---------------------------------------------------------------------
declare  @FemaleStudent table (StudentId int, StudentName nvarchar(255), DateOfBirth date);
insert into @FemaleStudent 

select ID, FirstName, DateOfBirth 
from Student
where Gender = 'F'

--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
/*	Declare temp table that will contain LastName and EnrolledDate columns
	 Fill the temp table with all Male students having First Name starting with ‘A’
	 Retrieve the students from the table which last name is with 7 characters   */
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

create table #TempTable (LastName nvarchar(255),EnrolledDate date);
insert into #TempTable 
select LastName, EnrolledDate from dbo.Student
where Gender = 'M' and  FirstName like 'A%'

select *
from #TempTable
where len(LastName) = 7;

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--	find all teachers whose FirstName length is less than 5 and
--	the first 3 characters of their FirstName and LastName are the same
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
select *
from Teacher
where len(FirstName) >5 
and
SUBSTRING(FirstName, 0,4) = SUBSTRING(LastName, 0, 4)

--------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
/*       		THE END                      */
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------