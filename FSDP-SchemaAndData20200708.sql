/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_OwnerAssets]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_ClassInfo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OwnerAssets]') AND type in (N'U'))
ALTER TABLE [dbo].[OwnerAssets] DROP CONSTRAINT IF EXISTS [FK_OwnerAssets_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OwnerAssets]') AND type in (N'U'))
ALTER TABLE [dbo].[OwnerAssets] DROP CONSTRAINT IF EXISTS [FK_OwnerAssets_Level]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[ClassInfo] DROP CONSTRAINT IF EXISTS [FK_ClassInfo_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[ClassInfo] DROP CONSTRAINT IF EXISTS [FK_ClassInfo_Level]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 7/8/2020 8:36:15 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 7/8/2020 8:36:15 AM ******/
DROP TABLE IF EXISTS [dbo].[Reservations]
GO
/****** Object:  Table [dbo].[OwnerAssets]    Script Date: 7/8/2020 8:36:15 AM ******/
DROP TABLE IF EXISTS [dbo].[OwnerAssets]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 7/8/2020 8:36:15 AM ******/
DROP TABLE IF EXISTS [dbo].[Locations]
GO
/****** Object:  Table [dbo].[Level]    Script Date: 7/8/2020 8:36:15 AM ******/
DROP TABLE IF EXISTS [dbo].[Level]
GO
/****** Object:  Table [dbo].[ClassInfo]    Script Date: 7/8/2020 8:36:15 AM ******/
DROP TABLE IF EXISTS [dbo].[ClassInfo]
GO
/****** Object:  Database [FSDP]    Script Date: 7/8/2020 8:36:15 AM ******/
DROP DATABASE IF EXISTS [FSDP]
GO
/****** Object:  Database [FSDP]    Script Date: 7/8/2020 8:36:15 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'FSDP')
BEGIN
CREATE DATABASE [FSDP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FSDP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FSDP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FSDP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FSDP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [FSDP] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FSDP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FSDP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FSDP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FSDP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FSDP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FSDP] SET ARITHABORT OFF 
GO
ALTER DATABASE [FSDP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FSDP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FSDP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FSDP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FSDP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FSDP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FSDP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FSDP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FSDP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FSDP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FSDP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FSDP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FSDP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FSDP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FSDP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FSDP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FSDP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FSDP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FSDP] SET  MULTI_USER 
GO
ALTER DATABASE [FSDP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FSDP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FSDP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FSDP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FSDP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FSDP] SET QUERY_STORE = OFF
GO
USE [FSDP]
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
/****** Object:  Table [dbo].[ClassInfo]    Script Date: 7/8/2020 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ClassInfo](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[ClassDate] [date] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[ClassLimit] [tinyint] NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_ClassInfo] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Level]    Script Date: 7/8/2020 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Level]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Level](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 7/8/2020 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](50) NOT NULL,
	[InstructorName] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[InstructorPhoto] [nvarchar](50) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OwnerAssets]    Script Date: 7/8/2020 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OwnerAssets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OwnerAssets](
	[OwnerAssetID] [int] IDENTITY(1,1) NOT NULL,
	[AssetName] [nvarchar](50) NOT NULL,
	[OwnerID] [nvarchar](128) NOT NULL,
	[AssetPhoto] [nvarchar](50) NULL,
	[LevelID] [int] NOT NULL,
	[SpecialNotes] [varchar](300) NULL,
	[IsActive] [bit] NOT NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_OwnerAssets] PRIMARY KEY CLUSTERED 
(
	[OwnerAssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 7/8/2020 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerAssetID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 7/8/2020 8:36:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ClassInfo] ON 

INSERT [dbo].[ClassInfo] ([ClassID], [ClassName], [Description], [ClassDate], [LevelRequired], [ClassLimit], [LocationID]) VALUES (1, N'Beginner Footwork', N'This class will teach you some of the foundation of floor work. In this class you will learn simple steps like 1 Step, 6 Step, and 3 Step.', CAST(N'2020-08-17' AS Date), 1, 6, 1)
INSERT [dbo].[ClassInfo] ([ClassID], [ClassName], [Description], [ClassDate], [LevelRequired], [ClassLimit], [LocationID]) VALUES (2, N'Intermediate Footwork', N'This class will teach you more complex footwork foundations. The highlights of this class include learning 7 Step, 3 Step, and learning how to incoporate your moves into a set', CAST(N'2020-08-18' AS Date), 2, 6, 2)
INSERT [dbo].[ClassInfo] ([ClassID], [ClassName], [Description], [ClassDate], [LevelRequired], [ClassLimit], [LocationID]) VALUES (4, N'Advanced Footwork', N'This class will teach you some of the most advanced footwork techniques. You will be creating your own moves and sets and making everything flow together.', CAST(N'2020-08-19' AS Date), 3, 6, 3)
INSERT [dbo].[ClassInfo] ([ClassID], [ClassName], [Description], [ClassDate], [LevelRequired], [ClassLimit], [LocationID]) VALUES (5, N'Beginner Power', N'This class will be geared more towards the students that want to incorporate power into their style. This class will go over basics such as Windmill and Swipes as well as teach you body control and building foundational strengths to support these moves.', CAST(N'2020-08-20' AS Date), 2, 6, 1)
INSERT [dbo].[ClassInfo] ([ClassID], [ClassName], [Description], [ClassDate], [LevelRequired], [ClassLimit], [LocationID]) VALUES (6, N'Advanced Power', N'This class is for students that already have a great foundation in power and how most of their basic power moves such as Windmills, Halos, Flares and Swipes. This class will be building on those foundations and will focus on more advanced concepts such as Airflare and Elbow Airflare.', CAST(N'2020-08-21' AS Date), 3, 6, 4)
INSERT [dbo].[ClassInfo] ([ClassID], [ClassName], [Description], [ClassDate], [LevelRequired], [ClassLimit], [LocationID]) VALUES (7, N'Beginner Style', N'This classes main focus is to give each student their own identity. It allows them to explore different styles of dancing and create their own.', CAST(N'2020-08-22' AS Date), 1, 6, 5)
INSERT [dbo].[ClassInfo] ([ClassID], [ClassName], [Description], [ClassDate], [LevelRequired], [ClassLimit], [LocationID]) VALUES (8, N'Biting and Flipping', N'This class is meant to be for students that have already identified their styles and want to make it more foundational. We will teach them how to take other peoples moves and flip them to be their own.', CAST(N'2020-08-23' AS Date), 1, 6, 6)
SET IDENTITY_INSERT [dbo].[ClassInfo] OFF
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([LevelID], [LevelName], [Description]) VALUES (1, N'Beginner', N'You should be this level if you have zero to no experience with breakdancing.')
INSERT [dbo].[Level] ([LevelID], [LevelName], [Description]) VALUES (2, N'Intermediate', N'After about 2-3 years of breakdancing you should be considered an intermediate dancer.')
INSERT [dbo].[Level] ([LevelID], [LevelName], [Description]) VALUES (3, N'Advanced', N'5+ years of breakdancing would qualify you as being an advanced breaker.')
SET IDENTITY_INSERT [dbo].[Level] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [LocationName], [InstructorName], [Address], [City], [State], [ZipCode], [InstructorPhoto]) VALUES (1, N'Break KC', N'Bboy Victor', N'123 Center St', N'Kansas City', N'MO', N'64030', N'victor.jpg')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [InstructorName], [Address], [City], [State], [ZipCode], [InstructorPhoto]) VALUES (2, N'Break TX', N'Bboy Menno', N'822 Break St', N'Austin', N'TX', N'73301', N'menno.png')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [InstructorName], [Address], [City], [State], [ZipCode], [InstructorPhoto]) VALUES (3, N'Break CA', N'Bboy Hong 10', N'111 Hollywood Dr', N'Los Angeles', N'CA', N'90001', N'hong10.png')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [InstructorName], [Address], [City], [State], [ZipCode], [InstructorPhoto]) VALUES (4, N'Break NY', N'Bboy Lil Zoo', N'989 Apple Dr', N'New York City', N'NY', N'10002', N'lilzoo.png')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [InstructorName], [Address], [City], [State], [ZipCode], [InstructorPhoto]) VALUES (5, N'Break FL', N'Bboy Pocket', N'555 Sunset Dr', N'Miami', N'FL', N'33101', N'pocket.jpg')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [InstructorName], [Address], [City], [State], [ZipCode], [InstructorPhoto]) VALUES (6, N'Break CHI', N'Bboy Wing', N'334 Windy St', N'Chicago', N'IL', N'69211', N'wing.png')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[OwnerAssets] ON 

INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1002, N'Patrick Star', N'56116b70-ca27-401f-9def-f96a658bd79f', N'd4904c2b-6329-4bd3-bb3f-8b2f80e25321.png', 1, N'Just a beginner, needs to rest every 30 minutes.', 1, CAST(N'2020-07-06' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1003, N'Sandy Cheeks', N'56116b70-ca27-401f-9def-f96a658bd79f', N'd47e7985-e8df-4cf7-9f9d-924fdf331780.png', 2, NULL, 1, CAST(N'2020-07-06' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1004, N'Eugene Krabs', N'56116b70-ca27-401f-9def-f96a658bd79f', N'05352697-b6a8-42bf-aac3-8eedd21e11b9.png', 1, NULL, 1, CAST(N'2020-07-06' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1005, N'Squidward Tentacles', N'56116b70-ca27-401f-9def-f96a658bd79f', N'dc3f1b85-7828-4e41-b368-18738b77a024.png', 3, NULL, 1, CAST(N'2020-07-06' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1006, N'Timmy Turner', N'44c9d9f5-3899-4ae4-848d-eb1fe2c406e6', N'bdcf51eb-849f-4ec7-89c9-2903a32e4fbc.png', 2, NULL, 1, CAST(N'2020-07-07' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1007, N'Cosmo', N'44c9d9f5-3899-4ae4-848d-eb1fe2c406e6', N'faf48f60-ee64-451b-81b0-7f550f3d62d7.png', 2, NULL, 1, CAST(N'2020-07-07' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1008, N'Wanda', N'44c9d9f5-3899-4ae4-848d-eb1fe2c406e6', N'59328d27-0087-4894-a037-3347fa8abf62.png', 1, NULL, 1, CAST(N'2020-07-07' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1009, N'Chip Skylark', N'44c9d9f5-3899-4ae4-848d-eb1fe2c406e6', N'cf8091e9-d032-4d13-841c-56723faa5f7a.png', 3, NULL, 1, CAST(N'2020-07-07' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1012, N'Danny Fenton', N'88e29092-b409-445c-814f-a8d25fbd3110', N'ad817a21-35a4-469c-b837-ca1c99cad3e3.png', 2, NULL, 1, CAST(N'2020-07-07' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1013, N'Danny Phantom', N'88e29092-b409-445c-814f-a8d25fbd3110', N'f7e1296d-e905-402d-ada8-ee1bd276d180.png', 3, N'He''s a phantom', 1, CAST(N'2020-07-07' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1014, N'Sam Manson', N'88e29092-b409-445c-814f-a8d25fbd3110', N'dbb09efe-1b66-4da4-890d-c99654bf7044.png', 2, NULL, 1, CAST(N'2020-07-07' AS Date))
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [LevelID], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1015, N'Tucker Foley', N'88e29092-b409-445c-814f-a8d25fbd3110', N'5854bc8d-d10e-479b-b5fd-4bdf47101d25.png', 1, NULL, 1, CAST(N'2020-07-07' AS Date))
SET IDENTITY_INSERT [dbo].[OwnerAssets] OFF
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationID], [OwnerAssetID], [LocationID], [ClassID]) VALUES (1003, 1003, 1, 1)
INSERT [dbo].[Reservations] ([ReservationID], [OwnerAssetID], [LocationID], [ClassID]) VALUES (1007, 1009, 1, 1)
INSERT [dbo].[Reservations] ([ReservationID], [OwnerAssetID], [LocationID], [ClassID]) VALUES (1009, 1008, 1, 1)
INSERT [dbo].[Reservations] ([ReservationID], [OwnerAssetID], [LocationID], [ClassID]) VALUES (1011, 1006, 1, 1)
INSERT [dbo].[Reservations] ([ReservationID], [OwnerAssetID], [LocationID], [ClassID]) VALUES (1014, 1002, 1, 1)
INSERT [dbo].[Reservations] ([ReservationID], [OwnerAssetID], [LocationID], [ClassID]) VALUES (1016, 1012, 1, 1)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'44c9d9f5-3899-4ae4-848d-eb1fe2c406e6', N'Mikeo', N'Skinner')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'56116b70-ca27-401f-9def-f96a658bd79f', N'Spongebob', N'Squarepants')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'6a8439c6-0fb3-4c12-95d3-725cfedd436b', N'Test', N'Employee')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'88e29092-b409-445c-814f-a8d25fbd3110', N'Johnny', N'Test')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassInfo_Level]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassInfo]'))
ALTER TABLE [dbo].[ClassInfo]  WITH CHECK ADD  CONSTRAINT [FK_ClassInfo_Level] FOREIGN KEY([LevelRequired])
REFERENCES [dbo].[Level] ([LevelID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassInfo_Level]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassInfo]'))
ALTER TABLE [dbo].[ClassInfo] CHECK CONSTRAINT [FK_ClassInfo_Level]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassInfo_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassInfo]'))
ALTER TABLE [dbo].[ClassInfo]  WITH CHECK ADD  CONSTRAINT [FK_ClassInfo_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassInfo_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassInfo]'))
ALTER TABLE [dbo].[ClassInfo] CHECK CONSTRAINT [FK_ClassInfo_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_Level]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets]  WITH CHECK ADD  CONSTRAINT [FK_OwnerAssets_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_Level]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets] CHECK CONSTRAINT [FK_OwnerAssets_Level]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets]  WITH CHECK ADD  CONSTRAINT [FK_OwnerAssets_UserDetails] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets] CHECK CONSTRAINT [FK_OwnerAssets_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_ClassInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_ClassInfo] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassInfo] ([ClassID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_ClassInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_ClassInfo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_OwnerAssets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_OwnerAssets] FOREIGN KEY([OwnerAssetID])
REFERENCES [dbo].[OwnerAssets] ([OwnerAssetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_OwnerAssets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_OwnerAssets]
GO
ALTER DATABASE [FSDP] SET  READ_WRITE 
GO
