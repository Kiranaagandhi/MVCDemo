
/****** Object:  Table [dbo].[AuditTB]    Script Date: 10/6/2019 9:35:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditTB](
	[UsersAuditID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SessionID] [varchar](50) NULL,
	[IPAddress] [varchar](50) NULL,
	[PageAccessed] [varchar](300) NULL,
	[LoggedInAt] [datetime] NULL,
	[LoggedOutAt] [datetime] NULL,
	[LoginStatus] [nvarchar](50) NULL,
	[ControllerName] [varchar](50) NULL,
	[ActionName] [varchar](50) NULL,
 CONSTRAINT [PK_AuditTB] PRIMARY KEY CLUSTERED 
(
	[UsersAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 10/6/2019 9:35:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeDetails](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Age] [int] NULL,
	[Salary] [decimal](18, 0) NULL,
	[worktype] [varchar](50) NULL,
 CONSTRAINT [PK_EmployeeDetails] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/6/2019 9:35:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeebyID]    Script Date: 10/6/2019 9:35:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetEmployeebyID] 
     @EmpID int

AS
BEGIN
	SELECT TOP 1000 [EmpID]
      ,[Name]
      ,[Address]
      ,[Age]
      ,[Salary]
      ,[worktype]
    FROM[EmployeeDetails] 
    where [EmployeeDetails].EmpID =@EmpID 
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmployeebyIDandName]    Script Date: 10/6/2019 9:35:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeebyIDandName] 
     @EmpID int

AS
BEGIN
	
	SELECT TOP 1000 [EmpID]
      ,[Name]
      ,[Address]
      ,[Age]
      ,[Salary]
      ,[worktype]
    FROM[EmployeeDetails] 
    where [EmployeeDetails].EmpID =@EmpID
	
END

GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 10/6/2019 9:35:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmployee] @Name VARCHAR(50)
	,@Address VARCHAR(50)
	,@Age INT
	,@Salary DECIMAL(18, 0)
	,@worktype VARCHAR(50)
AS
BEGIN
	INSERT INTO [EmployeeDetails] (
		[Name]
		,[Address]
		,[Age]
		,[Salary]
		,[worktype]
		)
	VALUES (
		@Name
		,@Address
		,@Age
		,@Salary
		,@worktype
		)
END

GO
