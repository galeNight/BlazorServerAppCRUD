USE [master]
GO
/****** Object:  Database [BlazorCRUD]    Script Date: 18-04-2023 17:33:21 ******/
CREATE DATABASE [BlazorCRUD]
GO

USE [BlazorCRUD]
GO

CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](150) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Students]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[vw_Students]
as
SELECT TOP (1000) [StudentID]
      ,[FirstName]
      ,[LastName]
      ,[EmailAddress]
      ,[Gender]
      ,[CreatedOn]
  FROM [BlazorCRUD].[dbo].[Students]
GO
/****** Object:  View [dbo].[vw_FemaleStudents]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_FemaleStudents]
as
SELECT TOP (1000) [StudentID]
      ,[FirstName]
      ,[LastName]
      ,[EmailAddress]
      ,[Gender]
      ,[CreatedOn]
  FROM [BlazorCRUD].[dbo].[Students]
  where gender = '0'
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Password2] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddNewStudent]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_AddNewStudent]
(
@FirstName nvarchar(150),
@LastName nvarchar(150),
@EmailAddress nvarchar(150),
@Gender nvarchar(10)
)
AS

BEGIN

INSERT INTO Students (FirstName, LastName, EmailAddress, Gender, CreatedOn) values (@FirstName, @LastName, @EmailAddress, @Gender, GetDate())

END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddNewUser]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_AddNewUser]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Email nvarchar(50),
	@Login nvarchar(50),
	@Password nvarchar(50),
	@Password2 nvarchar(50),
	@CreateDate DateTime
as
begin
Insert into Users
	(
	[FirstName],
	[LastName],
	[Email],
	[Login],
	[Password],
	[Password2],
	[CreateDate]
	)
	values
	(
	@FirstName,
	@LastName,
	@Email,
	@Login,
	@Password,
	@Password2,
	@CreateDate)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteStudentRecord]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE PROC usp_AddNewStudent
--(
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--INSERT INTO Students (FirstName, LastName, EmailAddress, Gender, CreatedOn) values (@FirstName, @LastName, @EmailAddress, @Gender, GetDate())

--END

--CREATE PROC usp_UpdateStudentRecord
--(
--@StudentID int,
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--Update
--Students
--SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, Gender = @Gender
--WHERE StudentID = @StudentID

--END

CREATE PROC [dbo].[usp_DeleteStudentRecord]
(
@StudentID int
)
AS

BEGIN

Delete FROM Students
WHERE StudentID = @StudentID

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteUserRecord]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DeleteUserRecord] @Id int
as
begin
Delete 
FROM Users
where Id = @Id
end

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllUsers]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetAllUsers]
as
begin
SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Login]
      ,[Password]
      ,[Password2]
      ,[CreateDate]
      ,[DeleteDate]
  FROM [BlazorCRUD].[dbo].[Users]
end

GO
/****** Object:  StoredProcedure [dbo].[usp_GetStudentsRecord]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE PROC usp_AddNewStudent
--(
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--INSERT INTO Students (FirstName, LastName, EmailAddress, Gender, CreatedOn) values (@FirstName, @LastName, @EmailAddress, @Gender, GetDate())

--END

--CREATE PROC usp_UpdateStudentRecord
--(
--@StudentID int,
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--Update
--Students
--SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, Gender = @Gender
--WHERE StudentID = @StudentID

--END

--CREATE PROC usp_DeleteStudentRecord
--(
--@StudentID int
--)
--AS

--BEGIN

--Delete FROM Students
--WHERE StudentID = @StudentID

--END

CREATE PROC [dbo].[usp_GetStudentsRecord]
AS
BEGIN

SELECT StudentID, FirstName, LastName, EmailAddress, Gender, CreatedOn
FROM Students

END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateStudentRecord]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE PROC usp_AddNewStudent
--(
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--INSERT INTO Students (FirstName, LastName, EmailAddress, Gender, CreatedOn) values (@FirstName, @LastName, @EmailAddress, @Gender, GetDate())

--END

CREATE PROC [dbo].[usp_UpdateStudentRecord]
(
@StudentID int,
@FirstName nvarchar(150),
@LastName nvarchar(150),
@EmailAddress nvarchar(150),
@Gender nvarchar(10)
)
AS

BEGIN

Update
Students
SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, Gender = @Gender
WHERE StudentId = @StudentID

END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUserRecord]    Script Date: 18-04-2023 17:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateUserRecord]
@Id int
      ,@FirstName nvarchar(50)
      ,@LastName nvarchar(50)
      ,@Email nvarchar(50)
      ,@Login nvarchar(50)
      ,@Password nvarchar(50)
      ,@Password2 nvarchar(50)
      ,@CreateDate DateTime
      ,@DeleteDate DateTime
as
begin
UPDATE [dbo].[Users]
SET 
      [FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[Email] = @Email
      ,[Login] = @Login
      ,[Password] = @Password
      ,[Password2] = @Password2
      ,[CreateDate] = @CreateDate
      ,[DeleteDate] = @DeleteDate
	  WHERE [Id] = @Id
end

GO
USE [master]
GO
ALTER DATABASE [BlazorCRUD] SET  READ_WRITE 
GO
