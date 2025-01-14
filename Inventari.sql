USE [master]
GO
/****** Object:  Database [Inventari]    Script Date: 4/8/2020 10:44:56 AM ******/
CREATE DATABASE [Inventari]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inventari', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Inventari.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Inventari_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Inventari_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Inventari] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inventari].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inventari] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inventari] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inventari] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inventari] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inventari] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inventari] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inventari] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inventari] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inventari] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inventari] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inventari] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inventari] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inventari] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inventari] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inventari] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inventari] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inventari] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inventari] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inventari] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inventari] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inventari] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inventari] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inventari] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Inventari] SET  MULTI_USER 
GO
ALTER DATABASE [Inventari] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inventari] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inventari] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inventari] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Inventari] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Inventari]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 4/8/2020 10:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset](
	[AssetID] [int] IDENTITY(1,1) NOT NULL,
	[AssetCode] [nvarchar](20) NULL,
	[AssetCategoryID] [int] NULL,
	[PurchasedOn] [datetime] NULL,
	[CurrentConditionID] [int] NULL,
	[PurchasePrice] [money] NULL,
	[CurrentValue] [money] NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Asset] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/8/2020 10:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[AssetCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[AssetCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Condition]    Script Date: 4/8/2020 10:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condition](
	[CurrentConditionID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Condition] PRIMARY KEY CLUSTERED 
(
	[CurrentConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Asset] ON 

INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (29, N'0101', 1, CAST(N'2010-11-11 00:00:00.000' AS DateTime), 2, 50.0000, 10.0000, N'Must be changed')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (31, N'0101', 1, CAST(N'2011-11-11 00:00:00.000' AS DateTime), 2, 50.0000, 10.0000, N'Must be changed')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (32, N'0102', 3, CAST(N'2019-10-10 00:00:00.000' AS DateTime), 1, 150.0000, 100.0000, N'Refill Color Catredge')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (33, N'0101', 2, CAST(N'2015-05-10 00:00:00.000' AS DateTime), 3, 100.0000, 40.0000, N'Sell it')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (34, N'0202', 3, CAST(N'2013-10-10 00:00:00.000' AS DateTime), 2, 100.0000, 20.0000, N'Doesnt work')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (35, N'0102', 2, CAST(N'2018-11-11 00:00:00.000' AS DateTime), 1, 150.0000, 140.0000, N'Meeting Table')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (36, N'0101', 1, CAST(N'2011-11-11 00:00:00.000' AS DateTime), 2, 50.0000, 10.0000, N'Must be changed')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (37, N'0204', 4, CAST(N'2010-10-10 00:00:00.000' AS DateTime), 4, 85.0000, 55.0000, N'Empty Shelfs')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (38, N'0302', 2, CAST(N'2014-08-10 00:00:00.000' AS DateTime), 2, 200.0000, 100.0000, N'Round Table')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (41, N'0203', 1, CAST(N'2002-11-02 00:00:00.000' AS DateTime), 3, 55.0000, 5.0000, N'Replace')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (42, N'0101', 3, CAST(N'2019-10-10 00:00:00.000' AS DateTime), 1, 250.0000, 240.0000, N'Office Printer')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (43, N'0203', 2, CAST(N'2019-05-10 00:00:00.000' AS DateTime), 4, 170.0000, 150.0000, N'Move it out')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (44, N'0302', 1, CAST(N'2020-10-07 00:00:00.000' AS DateTime), 4, 65.0000, 60.0000, N'Must be changed')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (46, N'0303', 4, CAST(N'2008-08-05 00:00:00.000' AS DateTime), 3, 277.0000, 235.0000, N'Needs repairing')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (47, N'0203', 1, CAST(N'2011-11-11 00:00:00.000' AS DateTime), 3, 23.0000, 15.0000, N'Broken')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (50, N'0303', 1, CAST(N'2001-07-09 00:00:00.000' AS DateTime), 2, 125.0000, 100.0000, N'For sell')
INSERT [dbo].[Asset] ([AssetID], [AssetCode], [AssetCategoryID], [PurchasedOn], [CurrentConditionID], [PurchasePrice], [CurrentValue], [Description]) VALUES (52, N'0103', 2, CAST(N'2015-05-10 00:00:00.000' AS DateTime), 1, 14.0000, 10.0000, N'update')
SET IDENTITY_INSERT [dbo].[Asset] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([AssetCategoryID], [CategoryName]) VALUES (1, N'Chair')
INSERT [dbo].[Category] ([AssetCategoryID], [CategoryName]) VALUES (2, N'Desk')
INSERT [dbo].[Category] ([AssetCategoryID], [CategoryName]) VALUES (3, N'Printer')
INSERT [dbo].[Category] ([AssetCategoryID], [CategoryName]) VALUES (4, N'Bookcases')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Condition] ON 

INSERT [dbo].[Condition] ([CurrentConditionID], [Status]) VALUES (1, N'New')
INSERT [dbo].[Condition] ([CurrentConditionID], [Status]) VALUES (2, N'Old')
INSERT [dbo].[Condition] ([CurrentConditionID], [Status]) VALUES (3, N'Refurbished')
INSERT [dbo].[Condition] ([CurrentConditionID], [Status]) VALUES (4, N'Unusable')
SET IDENTITY_INSERT [dbo].[Condition] OFF
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Category] FOREIGN KEY([AssetCategoryID])
REFERENCES [dbo].[Category] ([AssetCategoryID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_Category]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Condition] FOREIGN KEY([CurrentConditionID])
REFERENCES [dbo].[Condition] ([CurrentConditionID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_Condition]
GO
/****** Object:  StoredProcedure [dbo].[GenerateAll]    Script Date: 4/8/2020 10:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerateAll]
	@AssetCode NVARCHAR(20),
	@AssetCategoryID INT,
	@PurchasedOn DATETIME,
	@CurrentConditionID INT,
	@PurchasePrice MONEY,
	@CurrentValue MONEY,
	@Description NVARCHAR(100)
	
AS
	SELECT * FROM Asset WHERE 
		[AssetCode] = @AssetCode and
		[AssetCategoryID] = @AssetCategoryID and
		[PurchasedOn] = @PurchasedOn and
		[CurrentConditionID] = @CurrentConditionID and
		[PurchasePrice] = @PurchasePrice and
		[CurrentValue] = @CurrentValue and
		[Description] = @Description

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[Register]    Script Date: 4/8/2020 10:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Register]
	@AssetCode NVARCHAR(20),
	@AssetCategoryID INT,
	@PurchasedOn DATETIME,
	@CurrentConditionID INT,
	@PurchasePrice MONEY,
	@CurrentValue MONEY,
	@Description NVARCHAR(100)
	
AS
	INSERT INTO Asset
	(
	   [AssetCode]
      ,[AssetCategoryID]
      ,[PurchasedOn]
      ,[CurrentConditionID]
      ,[PurchasePrice]
      ,[CurrentValue]
	  ,[Description]
	)
	VALUES (

     -- [AssetCode]	 
	 @AssetCode
     -- [AssetCategoryID]
	 ,@AssetCategoryID
     -- [PurchasedOn]
	 ,@PurchasedOn
     -- [CurrentConditionID]
	 ,@CurrentConditionID
     -- [PurchasePrice]
	 ,@PurchasePrice
     -- [CurrentValue]
	 ,@CurrentValue
	 --[Description]
	 ,@Description
	)

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[ShowAll]    Script Date: 4/8/2020 10:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowAll]

AS
	SELECT * FROM Asset
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[Update]    Script Date: 4/8/2020 10:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update]
	@AssetID INT,
	@AssetCode NVARCHAR(20),
	@AssetCategoryID INT,
	@PurchasedOn DATETIME,
	@CurrentConditionID INT,
	@PurchasePrice MONEY,
	@CurrentValue MONEY,
	@Description NVARCHAR(100)
AS
	UPDATE Asset
	SET
	  AssetCode=@AssetCode,
	  AssetCategoryID=@AssetCategoryID,
	  PurchasedOn=@PurchasedOn,
	  CurrentConditionID=@CurrentConditionID,
	  PurchasePrice=@PurchasePrice,
	  CurrentValue=@CurrentValue,
	  [Description]=@Description
	WHERE AssetID=@AssetID
RETURN

GO
USE [master]
GO
ALTER DATABASE [Inventari] SET  READ_WRITE 
GO
