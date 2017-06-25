USE [master]
GO
/****** Object:  Database [kidhabit]    Script Date: 6/24/2017 8:53:53 PM ******/
CREATE DATABASE [kidhabit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kidhabit', FILENAME = N'D:\RDSDBDATA\DATA\kidhabit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'kidhabit_log', FILENAME = N'D:\RDSDBDATA\DATA\kidhabit_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [kidhabit] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kidhabit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kidhabit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kidhabit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kidhabit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kidhabit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kidhabit] SET ARITHABORT OFF 
GO
ALTER DATABASE [kidhabit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kidhabit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kidhabit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kidhabit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kidhabit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kidhabit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kidhabit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kidhabit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kidhabit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kidhabit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kidhabit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kidhabit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kidhabit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kidhabit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kidhabit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kidhabit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kidhabit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kidhabit] SET RECOVERY FULL 
GO
ALTER DATABASE [kidhabit] SET  MULTI_USER 
GO
ALTER DATABASE [kidhabit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kidhabit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kidhabit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kidhabit] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [kidhabit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kidhabit] SET QUERY_STORE = OFF
GO
USE [kidhabit]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [kidhabit]
GO
/****** Object:  User [SabioSA]    Script Date: 6/24/2017 8:53:54 PM ******/
CREATE USER [SabioSA] FOR LOGIN [SabioSA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [kh_user]    Script Date: 6/24/2017 8:53:54 PM ******/
CREATE USER [kh_user] FOR LOGIN [kh_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [SabioSA]
GO
ALTER ROLE [db_owner] ADD MEMBER [kh_user]
GO
/****** Object:  UserDefinedTableType [dbo].[UT_ServiceTag]    Script Date: 6/24/2017 8:53:54 PM ******/
CREATE TYPE [dbo].[UT_ServiceTag] AS TABLE(
	[ServiceTag] [nvarchar](50) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[ServiceTag] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](200) NOT NULL,
	[AddressLine2] [nvarchar](200) NULL,
	[City] [nvarchar](200) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](128) NULL,
	[Phone] [nvarchar](30) NULL,
	[Website] [nvarchar](400) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationTime]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Monday] [nvarchar](50) NULL,
	[Tuesday] [nvarchar](50) NULL,
	[Wednesday] [nvarchar](50) NULL,
	[Thursday] [nvarchar](50) NULL,
	[Friday] [nvarchar](50) NULL,
	[Saturday] [nvarchar](50) NOT NULL,
	[Sunday] [nvarchar](50) NULL,
 CONSTRAINT [PK_OperationTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PostedBy] [nvarchar](100) NOT NULL,
	[ContactId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[HoursId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicetag]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicetag](
	[ServiceId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_ServiceTag] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/24/2017 8:53:55 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 6/24/2017 8:53:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 6/24/2017 8:53:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 6/24/2017 8:53:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 6/24/2017 8:53:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/24/2017 8:53:55 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[servicetag]  WITH CHECK ADD  CONSTRAINT [FK_servicetag_service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[servicetag] CHECK CONSTRAINT [FK_servicetag_service]
GO
ALTER TABLE [dbo].[servicetag]  WITH CHECK ADD  CONSTRAINT [FK_servicetag_tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[servicetag] CHECK CONSTRAINT [FK_servicetag_tag]
GO
/****** Object:  StoredProcedure [dbo].[Address_Insert]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Address_Insert] 
		@ID int Output
		,@AddressLine1 nvarchar(200)
		,@AddressLine2 nvarchar(200) = null
		,@City nvarchar(200)
		,@State nvarchar(50)
		,@Zip nvarchar(50)

	As
	/*
	--Test Insert
	Declare @ID int
		,@AddressLine1 nvarchar(200) = '1731 Rada road'
		,@AddressLine2 nvarchar(200)
		,@City nvarchar(200) ='hacienda heights'
		,@State nvarchar(50) ='CA'
		,@Zip nvarchar(50) = '91745'

	Exec [dbo].[Address_Insert]
		@ID Output
		,@AddressLine1
		,@AddressLine2
		,@City
		,@State
		,@Zip

	Print @ID

	Select *
	From [dbo].[Address]
	*/
	Begin
		Insert [dbo].[Address] (
			[AddressLine1]
			,[AddressLine2]
			,[City]
			,[State]
			,[Zip]
		)
		Values (
		@AddressLine1
		, @AddressLine2
		, @City
		, @State
		, @Zip
		);

		Set @ID = SCOPE_IDENTITY()
	End
GO
/****** Object:  StoredProcedure [dbo].[Contact_Insert]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Contact_Insert] 
		@ID int Output
		,@Email nvarchar(128) = null
		,@Phone nvarchar(30) = null
		,@Website nvarchar(400) = null

	As
	/*
	--Test Insert
	Declare @ID int
		,@Email nvarchar(128) = 'daniel@gmail'
		,@Phone nvarchar(30) = 626
		,@Website nvarchar(400) = 'google.com'

	Exec [dbo].[Contact_Insert]
		@ID Output
		,@Email
		,@Phone
		,@Website

	Print @ID

	Select *
	From [dbo].[Contact]
	*/
	Begin
		Insert [dbo].[Contact] (
			[Email]
			,[Phone]
			,[Website]

		)
		Values (
		@Email
		, @Phone
		, @Website
		);

		Set @ID = SCOPE_IDENTITY()
	End
GO
/****** Object:  StoredProcedure [dbo].[OperationTime_Insert]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[OperationTime_Insert] 
		@ID int Output
		,@Monday nvarchar(50) = null
		,@Tuesday nvarchar(50) = null
		,@Wednesday nvarchar(50) = null
		,@Thursday nvarchar(50) = null
		,@Friday nvarchar(50) = null
		,@Saturday nvarchar(50) = null
		,@Sunday nvarchar(50) = null

	As
	/*
	--Test Insert
	Declare @ID int
		,@Monday nvarchar(50) = '10-12 pm'
		,@Tuesday nvarchar(50) = '10-12 pm'
		,@Wednesday nvarchar(50) = '10-12 pm'
		,@Thursday nvarchar(50) = '10-12 pm'
		,@Friday nvarchar(50) = '10-12 pm'
		,@Saturday nvarchar(50) = '10-12 pm'
		,@Sunday nvarchar(50) = '10-12 pm'

	Exec [dbo].[OperationTime_Insert]
		@ID Output
		,@Monday
		,@Tuesday
		,@Wednesday
		,@Thursday
		,@Friday
		,@Saturday
		,@Sunday

	Print @ID

	Select *
	From [dbo].[OperationTime]
	*/
	Begin
		Insert [dbo].[OperationTime] (
			[Monday]
			,[Tuesday]
			,[Wednesday]
			,[Thursday]
			,[Friday]
			,[Saturday]
			,[Sunday]

		)
		Values (
		@Monday
		,@Tuesday
		,@Wednesday
		,@Thursday
		,@Friday
		,@Saturday
		,@Sunday
		);

		Set @ID = SCOPE_IDENTITY()
	End
GO
/****** Object:  StoredProcedure [dbo].[Service_Insert]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Service_Insert] 
		@ID int Output
		,@Name nvarchar(100)
		,@PostedBy nvarchar(100)
		,@ContactId int
		,@AddressId int
		,@HoursId int
		,@Description nvarchar(max)
		,@TableParams UT_ServiceTag readonly
	As

	Insert [dbo].[Service] (
			[Name]
			,[PostedBy]
			,[ContactId]
			,[AddressId]
			,[HoursId]
			,[Description]
		)
		Values (
		@Name
		,@PostedBy
		,@ContactId
		,@AddressId
		,@HoursId
		,@Description
		);
		
		Set @ID = SCOPE_IDENTITY()

	Begin
	Insert into [dbo].Tag (TagName)
	Select ServiceTag from @TableParams
	where ServiceTag not in (select TagName from Tag)

	Insert into [dbo].[ServiceTag](ServiceId, TagId)
	Select @ID, Id from tag 
	where TagName in (Select ServiceTag from @TableParams)

	End
GO
/****** Object:  StoredProcedure [dbo].[Service_SelectAll]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Service_SelectAll]
/*
Exec dbo.Service_SelectAll
*/

As
Select * from [Service]

select distinct s.id, t.tagname
from [service] s left join servicetag st on s.id=st.serviceid left join tag t on t.ID = st.TagId




GO
/****** Object:  StoredProcedure [dbo].[Service_SelectById]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Service_SelectById]
	@Id int
/*
Exec dbo.Service_SelectById
	@Id = 1
*/

As
Select 
	s.PostedBy
	,s.[description]
	,s.[name]
	,c.email
	,c.phone
	,c.website
	,o.monday
	,o.tuesday
	,o.wednesday
	,o.thursday
	,o.friday
	,o.saturday
	,o.sunday
	,a.addressline1
	,a.addressline2
	,a.city
	,a.[state]
	,a.[zip]
from [Service] s 
left join Contact c on s.contactid = c.id 
left join operationtime o on s.HoursId = o.Id 
left join [address] a on s.hoursId = a.id 
where s.id = @Id
GO
/****** Object:  StoredProcedure [dbo].[Tag_SelectAll]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Tag_SelectAll]

As

select * from tag
GO
/****** Object:  DdlTrigger [rds_deny_backups_trigger]    Script Date: 6/24/2017 8:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [rds_deny_backups_trigger] ON DATABASE WITH EXECUTE AS 'dbo' FOR
 ADD_ROLE_MEMBER, GRANT_DATABASE AS BEGIN
   SET NOCOUNT ON;
   SET ANSI_PADDING ON;
 
   DECLARE @data xml;
   DECLARE @user sysname;
   DECLARE @role sysname;
   DECLARE @type sysname;
   DECLARE @sql NVARCHAR(MAX);
   DECLARE @permissions TABLE(name sysname PRIMARY KEY);
   
   SELECT @data = EVENTDATA();
   SELECT @type = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    
   IF @type = 'ADD_ROLE_MEMBER' BEGIN
      SELECT @user = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
       @role = @data.value('(/EVENT_INSTANCE/RoleName)[1]', 'sysname');

      IF @role IN ('db_owner', 'db_backupoperator') BEGIN
         SELECT @sql = 'DENY BACKUP DATABASE, BACKUP LOG TO ' + QUOTENAME(@user);
         EXEC(@sql);
      END
   END ELSE IF @type = 'GRANT_DATABASE' BEGIN
      INSERT INTO @permissions(name)
      SELECT Permission.value('(text())[1]', 'sysname') FROM
       @data.nodes('/EVENT_INSTANCE/Permissions/Permission')
      AS DatabasePermissions(Permission);
      
      IF EXISTS (SELECT * FROM @permissions WHERE name IN ('BACKUP DATABASE',
       'BACKUP LOG'))
         RAISERROR('Cannot grant backup database or backup log', 15, 1) WITH LOG;       
   END
END

GO
ENABLE TRIGGER [rds_deny_backups_trigger] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [kidhabit] SET  READ_WRITE 
GO
