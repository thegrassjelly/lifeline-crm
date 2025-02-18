USE [master]
GO
/****** Object:  Database [SCM2]    Script Date: 28/03/2016 9:38:02 AM ******/
CREATE DATABASE [SCM2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SCM2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SCM2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SCM2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SCM2_log.ldf' , SIZE = 29504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SCM2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SCM2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SCM2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SCM2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SCM2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SCM2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SCM2] SET ARITHABORT OFF 
GO
ALTER DATABASE [SCM2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SCM2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SCM2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SCM2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SCM2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SCM2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SCM2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SCM2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SCM2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SCM2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SCM2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SCM2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SCM2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SCM2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SCM2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SCM2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SCM2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SCM2] SET RECOVERY FULL 
GO
ALTER DATABASE [SCM2] SET  MULTI_USER 
GO
ALTER DATABASE [SCM2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SCM2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SCM2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SCM2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SCM2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SCM2]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 28/03/2016 9:38:02 AM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[AgentFirstName] [nvarchar](100) NULL,
	[AgentMiddleName] [nvarchar](100) NULL,
	[AgentLastName] [nvarchar](100) NULL,
	[AgentImage] [nvarchar](max) NULL,
	[AgentEmail] [nvarchar](100) NULL,
	[AgentAddress] [nvarchar](max) NULL,
	[AgentPhone] [nvarchar](50) NULL,
	[AgentMobile] [nvarchar](50) NULL,
	[AgentStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillOfMaterials]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillOfMaterials](
	[BOMID] [int] IDENTITY(1,1) NOT NULL,
	[FPID] [int] NULL,
	[BOMStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_BillOfMaterials] PRIMARY KEY CLUSTERED 
(
	[BOMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOMDetails]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOMDetails](
	[BOMDID] [int] IDENTITY(1,1) NOT NULL,
	[BOMID] [int] NULL,
	[RawID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_BOMDetails] PRIMARY KEY CLUSTERED 
(
	[BOMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brands]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NULL,
	[BrandDescription] [nvarchar](max) NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[CategoryDescription] [nvarchar](max) NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chats]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[ChatID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NULL,
	[ToUserID] [int] NULL,
	[ChatMessage] [nvarchar](max) NULL,
	[DateAdded] [datetime] NULL,
	[FromStatus] [nvarchar](50) NULL,
	[ToStatus] [nvarchar](50) NULL,
	[ReadStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[ChatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cheques]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheques](
	[ChequeID] [int] IDENTITY(1,1) NOT NULL,
	[POID] [int] NULL,
	[SOID] [int] NULL,
	[ChequeNo] [nvarchar](20) NULL,
	[ChequeOR] [nvarchar](100) NULL,
	[ChequeAmount] [decimal](18, 2) NULL,
	[ChequeBank] [nvarchar](50) NULL,
	[ChequeStatus] [nvarchar](15) NULL,
	[DateAdded] [datetime] NULL,
	[DateClearing] [datetime] NULL,
 CONSTRAINT [PK_Cheques] PRIMARY KEY CLUSTERED 
(
	[ChequeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conductions]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductions](
	[ConductionID] [int] IDENTITY(1,1) NOT NULL,
	[FPID] [int] NULL,
	[CostumerID] [int] NULL,
	[ConductionNo] [nvarchar](100) NULL,
	[ConductionPrice] [decimal](18, 2) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Conductions] PRIMARY KEY CLUSTERED 
(
	[ConductionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractDetails]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractDetails](
	[CDID] [int] IDENTITY(1,1) NOT NULL,
	[ContractID] [int] NULL,
	[CDContractor] [nvarchar](max) NULL,
	[CDWork] [nvarchar](max) NULL,
	[CDPrice] [decimal](18, 2) NULL,
	[CDBalance] [decimal](18, 2) NULL,
	[CDStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContractDetails] PRIMARY KEY CLUSTERED 
(
	[CDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractHistory]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractHistory](
	[ContractHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[CDID] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_ContractHistory] PRIMARY KEY CLUSTERED 
(
	[ContractHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[BodyNo] [int] NULL,
	[ConductionNo] [nvarchar](100) NULL,
	[ContractDescription] [nvarchar](200) NULL,
	[ContractRemarks] [nvarchar](200) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerContactPersons]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerContactPersons](
	[CCPID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[CCPName] [nvarchar](200) NULL,
	[CCPAddress] [nvarchar](max) NULL,
	[CCPEmail] [nvarchar](50) NULL,
	[CCPPhone] [nvarchar](20) NULL,
	[CCPMobile] [nvarchar](20) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[CCPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerImage] [nvarchar](max) NULL,
	[CustomerCompany] [nvarchar](200) NULL,
	[CustomerStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[CustomerAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Deliveries]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliveries](
	[DID] [int] IDENTITY(1,1) NOT NULL,
	[SOID] [int] NULL,
	[EmployeeID] [int] NULL,
	[CompanionID] [int] NULL,
	[Companion2ID] [int] NULL,
	[VehicleID] [int] NULL,
 CONSTRAINT [PK_Deliveries] PRIMARY KEY CLUSTERED 
(
	[DID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountSOID] [int] NULL,
	[DiscountPercent] [int] NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmpAdditionals]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpAdditionals](
	[EmployeeID] [int] NULL,
	[SSSNo] [nvarchar](100) NULL,
	[PhilhealthNo] [nvarchar](100) NULL,
	[PagibigNo] [nvarchar](100) NULL,
	[EmployeeGuardian] [nvarchar](100) NULL,
	[GuardianContact] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeFirstName] [nvarchar](100) NULL,
	[EmployeeMiddleName] [nvarchar](100) NULL,
	[EmployeeLastName] [nvarchar](100) NULL,
	[EmployeeImage] [nvarchar](max) NULL,
	[EmployeeEmail] [nvarchar](100) NULL,
	[EmployeeAddress] [nvarchar](max) NULL,
	[EmployeeRate] [decimal](18, 2) NULL,
	[EmployeeOTRate] [decimal](18, 2) NULL,
	[EmployeeValeBalance] [decimal](18, 2) NULL,
	[EmployeeSSS] [decimal](18, 2) NULL,
	[EmployeePagibig] [decimal](18, 2) NULL,
	[EmployeePhilhealth] [decimal](18, 2) NULL,
	[EmployeeCola] [decimal](18, 2) NULL,
	[EmployeePhone] [nvarchar](50) NULL,
	[EmployeeMobile] [nvarchar](50) NULL,
	[EmployeeStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FinishedProductInventories]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinishedProductInventories](
	[FIID] [int] IDENTITY(1,1) NOT NULL,
	[FPID] [int] NULL,
	[FIQuantity] [int] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_FinishedProductInventories] PRIMARY KEY CLUSTERED 
(
	[FIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FinishedProducts]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinishedProducts](
	[FPID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[BrandID] [int] NULL,
	[FPCode] [nvarchar](100) NULL,
	[FPName] [nvarchar](100) NULL,
	[FPImage] [nvarchar](max) NULL,
	[FPDescription] [nvarchar](max) NULL,
	[FPUOM] [nvarchar](30) NULL,
	[FPPieceUOM] [int] NULL,
	[FPSellingPrice] [decimal](18, 2) NULL,
	[FPCriticalLevel] [int] NULL,
	[FPSafeLevel] [int] NULL,
	[FPStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_FinishedProducts] PRIMARY KEY CLUSTERED 
(
	[FPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FPPrices]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FPPrices](
	[FPPID] [int] IDENTITY(1,1) NOT NULL,
	[FPID] [int] NULL,
	[FPPrice] [decimal](18, 2) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_FPPrices] PRIMARY KEY CLUSTERED 
(
	[FPPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobOrders]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOrders](
	[JOID] [int] IDENTITY(1,1) NOT NULL,
	[JOStatus] [nvarchar](30) NULL,
	[DateAdded] [datetime] NULL,
	[DateComplete] [datetime] NULL,
 CONSTRAINT [PK_JobOrders] PRIMARY KEY CLUSTERED 
(
	[JOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JODetails]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JODetails](
	[JODID] [int] IDENTITY(1,1) NOT NULL,
	[JOID] [int] NULL,
	[FPID] [int] NULL,
	[JODQuantity] [int] NULL,
	[UserID] [int] NULL,
	[JODAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_JODetails] PRIMARY KEY CLUSTERED 
(
	[JODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logs]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[LogType] [nvarchar](100) NULL,
	[LogDetails] [nvarchar](max) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Logs_1] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notes]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[NoteTitle] [nvarchar](200) NULL,
	[NoteBody] [nvarchar](max) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payments]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] NULL,
	[SOID] [int] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentAmount] [nvarchar](50) NULL,
	[PaymentChequeNo] [nvarchar](100) NULL,
	[PaymentBankName] [nvarchar](100) NULL,
	[PaymentBranch] [nvarchar](100) NULL,
	[PaymentPostDated] [datetime] NULL,
	[DateAdded] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollDetails]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollDetails](
	[PayrollDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[PayrollID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Days] [decimal](18, 2) NULL,
	[OTHours] [decimal](18, 2) NULL,
	[TotalOT] [decimal](18, 2) NULL,
	[TotalNormalRate] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[SSS] [decimal](18, 2) NULL,
	[PhilHealth] [decimal](18, 2) NULL,
	[Pagibig] [decimal](18, 2) NULL,
	[Cola] [decimal](18, 2) NULL,
	[Vale] [decimal](18, 2) NULL,
	[NetPay] [decimal](18, 2) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_PayrollDetails] PRIMARY KEY CLUSTERED 
(
	[PayrollDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payrolls]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payrolls](
	[PayrollID] [int] IDENTITY(1,1) NOT NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Payrolls] PRIMARY KEY CLUSTERED 
(
	[PayrollID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prices]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[FPID] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Prices] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductDiscounts]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDiscounts](
	[PDID] [int] IDENTITY(1,1) NOT NULL,
	[SODID] [int] NOT NULL,
	[FPID] [int] NOT NULL,
	[PDValue] [decimal](18, 2) NULL,
	[PDType] [nvarchar](20) NOT NULL,
	[PDPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_DiscountsPerProduct] PRIMARY KEY CLUSTERED 
(
	[PDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductInventories]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInventories](
	[ProductInventoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[PIQuantity] [int] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_ProductInventories] PRIMARY KEY CLUSTERED 
(
	[ProductInventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[BrandID] [int] NULL,
	[ProductCode] [nvarchar](100) NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductImage] [nvarchar](max) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductSize] [nvarchar](20) NULL,
	[ProductUOM] [nvarchar](30) NULL,
	[ProductPieceUOM] [int] NULL,
	[ProductPrice] [decimal](18, 2) NULL,
	[ProductCriticalLevel] [int] NULL,
	[ProductSafeLevel] [int] NULL,
	[ProductStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[PurchasePrice] [decimal](18, 2) NULL,
	[UOMperUOM] [nvarchar](30) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrderDetails]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetails](
	[PODID] [int] IDENTITY(1,1) NOT NULL,
	[POID] [int] NULL,
	[SupplierProductID] [int] NULL,
	[PODQuantity] [decimal](18, 2) NULL,
	[PODAmount] [decimal](18, 2) NULL,
	[PODQuantityReceived] [decimal](18, 2) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_PurchaseOrderDetails] PRIMARY KEY CLUSTERED 
(
	[PODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[POID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[SCPID] [int] NULL,
	[DateIssued] [datetime] NULL,
	[DateDelivery] [datetime] NULL,
	[POStatus] [nvarchar](20) NULL,
	[POContractImage] [nvarchar](max) NULL,
	[POPaymentStatus] [nvarchar](20) NULL,
	[POTotalPrice] [decimal](18, 2) NULL,
	[POBalancePrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PurhaseOrder] PRIMARY KEY CLUSTERED 
(
	[POID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RawHistory]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawHistory](
	[RawHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[JOID] [int] NULL,
	[RawID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_RawHistory] PRIMARY KEY CLUSTERED 
(
	[RawHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RawInventories]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawInventories](
	[RawInventoryID] [int] IDENTITY(1,1) NOT NULL,
	[RawID] [int] NULL,
	[RIQuantity] [decimal](18, 2) NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_RawInventories] PRIMARY KEY CLUSTERED 
(
	[RawInventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RawProducts]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawProducts](
	[RawID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[BrandID] [int] NULL,
	[RawCode] [nvarchar](100) NULL,
	[RawName] [nvarchar](100) NULL,
	[RawImage] [nvarchar](max) NULL,
	[RawDescription] [nvarchar](max) NULL,
	[RawUOM] [nvarchar](30) NULL,
	[RawPieceUOM] [int] NULL,
	[RawPurchasePrice] [decimal](18, 2) NULL,
	[RawCriticalLevel] [int] NULL,
	[RawSafeLevel] [int] NULL,
	[RawStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_RawProducts] PRIMARY KEY CLUSTERED 
(
	[RawID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReturnOrderDetails]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnOrderDetails](
	[RODID] [int] IDENTITY(1,1) NOT NULL,
	[ROID] [int] NULL,
	[FPID] [int] NULL,
	[RODQuantity] [int] NULL,
	[RODAmount] [decimal](18, 2) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_ReturnOrderDetails] PRIMARY KEY CLUSTERED 
(
	[RODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReturnOrders]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnOrders](
	[ROID] [int] IDENTITY(1,1) NOT NULL,
	[SOID] [int] NOT NULL,
	[ROStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateReturn] [datetime] NULL,
 CONSTRAINT [PK_ReturnOrders] PRIMARY KEY CLUSTERED 
(
	[ROID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROPDetails]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROPDetails](
	[ROPDID] [int] IDENTITY(1,1) NOT NULL,
	[ROPID] [int] NULL,
	[FPID] [int] NULL,
	[ROPQuantity] [int] NULL,
	[ROPAmount] [decimal](18, 2) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_ROPDetails] PRIMARY KEY CLUSTERED 
(
	[ROPDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROProducts]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROProducts](
	[ROPID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ROStatus] [nvarchar](50) NULL,
	[DateAdded] [datetime] NULL,
	[DateReturn] [datetime] NULL,
 CONSTRAINT [PK_ROProducts] PRIMARY KEY CLUSTERED 
(
	[ROPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesOrderDetails]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderDetails](
	[SODID] [int] IDENTITY(1,1) NOT NULL,
	[SOID] [int] NULL,
	[FPID] [int] NULL,
	[SODQuantity] [int] NULL,
	[SODAmount] [decimal](18, 2) NULL,
	[SODStatus] [nvarchar](20) NULL,
	[SODQuantityReceived] [nvarchar](20) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_SalesOrderDetails] PRIMARY KEY CLUSTERED 
(
	[SODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesOrders]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrders](
	[SOID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[AgentID] [int] NULL,
	[SOInvoiceNo] [nvarchar](50) NULL,
	[SOPaymentMethod] [nvarchar](50) NULL,
	[SOPaymentStatus] [nvarchar](50) NULL,
	[SOCleanBalance] [decimal](18, 2) NULL,
	[SOBalance] [decimal](18, 2) NULL,
	[SOUnpaidBalance] [decimal](18, 2) NULL,
	[SOStatus] [nvarchar](20) NULL,
	[SOVATApplied] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateDelivery] [datetime] NULL,
	[SOTerms] [nvarchar](50) NULL,
	[SOPurchaseOrder] [nvarchar](50) NULL,
 CONSTRAINT [PK_SalesOrders] PRIMARY KEY CLUSTERED 
(
	[SOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiteAccess]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteAccess](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[CMSBasicRead] [nvarchar](10) NULL,
	[CMSPagesRead] [nvarchar](10) NULL,
	[InventoryRawMaterialsRead] [nvarchar](10) NULL,
	[InventoryRawMaterialsWrite] [nvarchar](10) NULL,
	[InventoryFinishedProductsRead] [nvarchar](10) NULL,
	[InventoryFinishedProductsWrite] [nvarchar](10) NULL,
	[ReportUserMasterListRead] [nvarchar](10) NULL,
	[ReportCompanyMasterListRead] [nvarchar](10) NULL,
	[ReportEmployeeMasterListRead] [nvarchar](10) NULL,
	[ReportAgentMasterListRead] [nvarchar](10) NULL,
	[ReportSupplierMasterListRead] [nvarchar](10) NULL,
	[ReportFinishedProductsMasterListRead] [nvarchar](10) NULL,
	[ReportRawMaterialsMasterListRead] [nvarchar](10) NULL,
	[ReportBillOfMaterialsMasterListRead] [nvarchar](10) NULL,
	[ReportSalesOrderListRead] [nvarchar](10) NULL,
	[ReportPurchaseOrderListRead] [nvarchar](10) NULL,
	[ReportReturnOrderListRead] [nvarchar](10) NULL,
	[ReportStatementOfAccountsRead] [nvarchar](10) NULL,
	[PageUserRead] [nvarchar](10) NULL,
	[PageUserWrite] [nvarchar](10) NULL,
	[PageCategoryRead] [nvarchar](10) NULL,
	[PageCategoryWrite] [nvarchar](10) NULL,
	[PageBrandRead] [nvarchar](10) NULL,
	[PageBrandWrite] [nvarchar](10) NULL,
	[PageTruckRead] [nvarchar](10) NULL,
	[PageTruckWrite] [nvarchar](10) NULL,
	[PageUOMRead] [nvarchar](10) NULL,
	[PageUOMWrite] [nvarchar](10) NULL,
	[PageSystemLogsRead] [nvarchar](10) NULL,
	[PageUserLogsRead] [nvarchar](10) NULL,
	[PageCompanyRead] [nvarchar](10) NULL,
	[PageCompanyWrite] [nvarchar](10) NULL,
	[PageAgentsRead] [nvarchar](10) NULL,
	[PageAgentsWrite] [nvarchar](10) NULL,
	[PageSupplierRead] [nvarchar](10) NULL,
	[PageSupplierWrite] [nvarchar](10) NULL,
	[PageRawMaterialsRead] [nvarchar](10) NULL,
	[PageRawMaterialsWrite] [nvarchar](10) NULL,
	[PageFinishedProductsRead] [nvarchar](10) NULL,
	[PageFinishedProductsWrite] [nvarchar](10) NULL,
	[PageEmployeeRead] [nvarchar](10) NULL,
	[PageEmployeeWrite] [nvarchar](10) NULL,
	[PagePayrollRead] [nvarchar](10) NULL,
	[PagePayrollWrite] [nvarchar](10) NULL,
	[PageContractRead] [nvarchar](10) NULL,
	[PageContractWrite] [nvarchar](10) NULL,
	[ProcessSalesOrderRead] [nvarchar](10) NULL,
	[ProcessSalesOrderWrite] [nvarchar](10) NULL,
	[ProcessPurchaseOrderRead] [nvarchar](10) NULL,
	[ProcessPurchaseOrderWrite] [nvarchar](10) NULL,
	[ProcessReturnOrderRead] [nvarchar](10) NULL,
	[ProcessReturnOrderWrite] [nvarchar](10) NULL,
	[ProcessJobOrderRead] [nvarchar](10) NULL,
	[ProcessJobOrderWrite] [nvarchar](10) NULL,
	[ProcessBillOfMaterialsRead] [nvarchar](10) NULL,
	[ProcessBillOfMaterialsWrite] [nvarchar](10) NULL,
	[PageTypeRead] [nvarchar](10) NULL,
	[PageTypeWrite] [nvarchar](10) NULL,
 CONSTRAINT [PK_SiteAccess] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StatementOfAccounts]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatementOfAccounts](
	[SOAID] [int] IDENTITY(1,1) NOT NULL,
	[SOID] [int] NULL,
	[POID] [int] NULL,
	[ORNumber] [nvarchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_StatementOfAccounts] PRIMARY KEY CLUSTERED 
(
	[SOAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierContactPersons]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierContactPersons](
	[SCPID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[SCPName] [nvarchar](200) NULL,
	[SCPAddress] [nvarchar](max) NULL,
	[SCPEmail] [nvarchar](50) NULL,
	[SCPPhone] [nvarchar](20) NULL,
	[SCPMobile] [nvarchar](20) NULL,
 CONSTRAINT [PK_SupplierContactPersons] PRIMARY KEY CLUSTERED 
(
	[SCPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierProducts]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierProducts](
	[SupplierProductID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[RawID] [int] NULL,
	[SPPurchasePrice] [decimal](18, 2) NULL,
	[SPStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[SPMoneyType] [nvarchar](10) NULL,
	[SPForeignValue] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SupplierProducts] PRIMARY KEY CLUSTERED 
(
	[SupplierProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCompany] [nvarchar](200) NULL,
	[SupplierDescription] [nvarchar](max) NULL,
	[SupplierRemark] [nvarchar](max) NULL,
	[SupplierImage] [nvarchar](max) NULL,
	[SupplierStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[SupplierTIN] [nvarchar](100) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempSales]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempSales](
	[SOID] [int] NULL,
	[UserID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UOM]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UOM](
	[UOMID] [int] IDENTITY(1,1) NOT NULL,
	[UOMName] [nvarchar](200) NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_UOM] PRIMARY KEY CLUSTERED 
(
	[UOMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[UserFirstName] [nvarchar](100) NULL,
	[UserMiddleName] [nvarchar](100) NULL,
	[UserLastName] [nvarchar](100) NULL,
	[UserEmail] [nvarchar](100) NULL,
	[UserImage] [nvarchar](max) NULL,
	[UserName] [nvarchar](100) NULL,
	[UserPassword] [nvarchar](max) NULL,
	[UserAddress] [nvarchar](max) NULL,
	[UserPhone] [nvarchar](50) NULL,
	[UserMobile] [nvarchar](50) NULL,
	[UserStatus] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 28/03/2016 9:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleType] [nvarchar](100) NULL,
	[VehiclePlate] [nvarchar](10) NULL,
	[VehicleDescription] [nvarchar](max) NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandDescription], [Status]) VALUES (1, N'None', N'None', N'Active')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (1, N'None', N'None', N'Active')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Chats] ON 

INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (1, 1, 3, N'asdasdasd', CAST(N'2016-02-17 09:53:51.543' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (2, 1, 3, N'zZS', CAST(N'2016-02-17 09:55:10.067' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (3, 1, 3, N'ASZXDASD', CAST(N'2016-02-17 09:55:49.603' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (4, 1, 3, N'ASD', CAST(N'2016-02-17 09:55:50.917' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (5, 1, 3, N'D', CAST(N'2016-02-17 09:55:51.773' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (6, 1, 3, N'', CAST(N'2016-02-17 09:55:52.620' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (7, 1, 3, N'SD', CAST(N'2016-02-17 09:55:53.477' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (8, 1, 3, N'D', CAST(N'2016-02-17 09:55:54.330' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (9, 1, 3, N'SD', CAST(N'2016-02-17 09:55:55.223' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (10, 1, 3, N'DA', CAST(N'2016-02-17 09:55:56.020' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (11, 1, 3, N'ASD', CAST(N'2016-02-17 09:55:57.090' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (12, 1, 3, N'', CAST(N'2016-02-17 09:55:57.930' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (13, 1, 3, N'', CAST(N'2016-02-17 09:55:58.843' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (14, 1, 3, N'ASDA', CAST(N'2016-02-17 09:55:59.070' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (15, 1, 3, N'AS', CAST(N'2016-02-17 09:55:59.390' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (16, 1, 3, N'', CAST(N'2016-02-17 09:55:59.943' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (17, 1, 3, N'SD', CAST(N'2016-02-17 09:56:00.820' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (18, 1, 3, N'SDASD', CAST(N'2016-02-17 09:56:01.063' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (19, 1, 3, N'SD', CAST(N'2016-02-17 09:56:01.390' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (20, 1, 3, N'', CAST(N'2016-02-17 09:56:02.060' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (21, 1, 3, N'ASDASD', CAST(N'2016-02-17 09:56:02.493' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (22, 1, 3, N'ASDASDASD', CAST(N'2016-02-17 09:56:02.903' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (23, 1, 3, N'ASDASDASD', CAST(N'2016-02-17 09:56:03.187' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (24, 1, 3, N'ASD', CAST(N'2016-02-17 09:56:03.767' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (25, 1, 3, N'ASD', CAST(N'2016-02-17 09:56:04.333' AS DateTime), N'Active', N'Clear', N'Read')
INSERT [dbo].[Chats] ([ChatID], [FromUserID], [ToUserID], [ChatMessage], [DateAdded], [FromStatus], [ToStatus], [ReadStatus]) VALUES (26, 1, 3, N'', CAST(N'2016-02-17 09:56:04.917' AS DateTime), N'Active', N'Clear', N'Read')
SET IDENTITY_INSERT [dbo].[Chats] OFF
SET IDENTITY_INSERT [dbo].[Cheques] ON 

INSERT [dbo].[Cheques] ([ChequeID], [POID], [SOID], [ChequeNo], [ChequeOR], [ChequeAmount], [ChequeBank], [ChequeStatus], [DateAdded], [DateClearing]) VALUES (29, NULL, 1, N'1234354634523', N'123123', CAST(20.00 AS Decimal(18, 2)), N'`123`12`12', N'Cleared', CAST(N'2016-03-08 15:28:06.803' AS DateTime), CAST(N'2016-03-08 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Cheques] OFF
SET IDENTITY_INSERT [dbo].[CustomerContactPersons] ON 

INSERT [dbo].[CustomerContactPersons] ([CCPID], [CustomerID], [CCPName], [CCPAddress], [CCPEmail], [CCPPhone], [CCPMobile]) VALUES (1, 172, N'Anthony Tan', N'Lot 5, Persiaran Selangor, Seksyen 15, 40000 Shah Alam, Selangor Darul Ehsan', N'', N'', N'60355194022')
SET IDENTITY_INSERT [dbo].[CustomerContactPersons] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (1, N'nophoto.png', N'2K Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (2, N'nophoto.png', N'7D Food International Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (3, N'nophoto.png', N'A-1 Fertilizer & Chemical Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (4, N'nophoto.png', N'Abad Farmers Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (5, N'nophoto.png', N'Abatan Farmers Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (6, N'nophoto.png', N'Active Agri Ventures', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (7, N'nophoto.png', N'Agchem Manufacturing Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (8, N'nophoto.png', N'Agri Biz Co. GS Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (9, N'nophoto.png', N'Agricon Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (10, N'nophoto.png', N'Agrimax Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (11, N'nophoto.png', N'Agrinanas Development Co., Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (12, N'nophoto.png', N'Agro Industrial Marketing', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (13, N'nophoto.png', N'Agroman Marketing', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (14, N'nophoto.png', N'Agway Chemicals Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (15, N'nophoto.png', N'Aling Paz Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (16, N'nophoto.png', N'Alno Cutflower Growers Association', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (17, N'nophoto.png', N'Alvarez Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (18, N'nophoto.png', N'Apen Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (19, N'nophoto.png', N'Apo Agrivet Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (20, N'nophoto.png', N'Arnuco Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (21, N'nophoto.png', N'Aves Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (22, N'nophoto.png', N'Bacolod Ferti Chem Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (23, N'nophoto.png', N'Baliwag Marketing', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (24, N'nophoto.png', N'Best Choice Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (25, N'nophoto.png', N'BPEI (C & T A/S)', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (26, N'nophoto.png', N'Cagayan Diversified', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (27, N'nophoto.png', N'Carmela Gracia Store', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (28, N'nophoto.png', N'CASSACCAFFT Irrigators Ass., Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (29, N'nophoto.png', N'CASSAMMFVRROST Irrigators Ass. Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (30, N'nophoto.png', N'Cavite Farmers', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (31, N'nophoto.png', N'Chuliante Marketing Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (32, N'nophoto.png', N'Credo Cooperative', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (33, N'nophoto.png', N'Crista Makita Irrigators Ass. Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (34, N'nophoto.png', N'Crown Agri Trading Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (35, N'nophoto.png', N'Crown Agrikem Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (36, N'nophoto.png', N'D.C. Cruz Trading Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (37, N'nophoto.png', N'Dading''s Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (38, N'nophoto.png', N'Davao Agricultural Ventures Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (39, N'nophoto.png', N'Davao EPSJR', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (40, N'nophoto.png', N'DCS Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (41, N'nophoto.png', N'De Oro Maramag Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (42, N'nophoto.png', N'Deepwell Sumulong Irrigators Ass. Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (43, N'nophoto.png', N'Del Monte Philippines', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (44, N'nophoto.png', N'Delinanas Development Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (45, N'nophoto.png', N'Diversified Agro', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (46, N'nophoto.png', N'Dole Philippines Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (47, N'nophoto.png', N'Doreen''s Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (48, N'nophoto.png', N'Double Eagle Enterprises', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (49, N'nophoto.png', N'Dumlao Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (50, N'nophoto.png', N'Duran Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (51, N'nophoto.png', N'Edgardo Villaluna Ent.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (52, N'nophoto.png', N'Edsel Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (53, N'nophoto.png', N'EPG Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (54, N'nophoto.png', N'Esperanza Planters Store', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (55, N'nophoto.png', N'Eugene John Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (56, N'nophoto.png', N'Everland Agri Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (57, N'nophoto.png', N'Falcor Marketing Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (58, N'nophoto.png', N'Farm Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (59, N'nophoto.png', N'Farmers Atlas Marketing Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (60, N'nophoto.png', N'Fed. of Farmers Irrigators Ass. Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (61, N'nophoto.png', N'FMN Agricultural Supply, Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (62, N'nophoto.png', N'Fortune Enterprises', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (63, N'nophoto.png', N'Galchem Enterprises', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (64, N'nophoto.png', N'Gensan ABC Farm Essentials, Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (65, N'nophoto.png', N'Goodfarms Trading Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (66, N'nophoto.png', N'Goodnews Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (67, N'nophoto.png', N'Green Agri Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (68, N'nophoto.png', N'Green Future Innovations, Inc', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (69, N'nophoto.png', N'Grupo Allied Agricultural Products', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (70, N'nophoto.png', N'Highland Banana Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (71, N'nophoto.png', N'IAgri Chemicals Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (72, N'nophoto.png', N'IBS Seed Store and Merchandise', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (73, N'nophoto.png', N'IMB Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (74, N'nophoto.png', N'Isabela Sunrise Trading Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (75, N'nophoto.png', N'J.B. Guevarra & Sons, inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (76, N'nophoto.png', N'Jea''s Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (77, N'nophoto.png', N'Jeels Masagana Farm Supply, Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (78, N'nophoto.png', N'JL Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (79, N'nophoto.png', N'Joan''s Agro Sales', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (80, N'nophoto.png', N'Karrat MArketing Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (81, N'nophoto.png', N'Kasanga ng Rang-ay Irrigators Ass. Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (82, N'nophoto.png', N'Kasanggayahan Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (83, N'nophoto.png', N'KVC Villame Gen. Mdse. & Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (84, N'nophoto.png', N'L&V Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (85, N'nophoto.png', N'Lanay Irrigators Ass. Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (86, N'nophoto.png', N'Land Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (87, N'nophoto.png', N'Lapanday Agricultural & Dev''t Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (88, N'nophoto.png', N'Lapanday Diversified Products', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (89, N'nophoto.png', N'Lapanday Foods Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (90, N'nophoto.png', N'Lead Export & Agro-Development Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (91, N'nophoto.png', N'Leads Environmental Health Products Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (92, N'nophoto.png', N'Leyte Samar Farmers Center', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (93, N'nophoto.png', N'Liberty Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (94, N'nophoto.png', N'LJP Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (95, N'nophoto.png', N'LSV Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (96, N'nophoto.png', N'Luntian Agri', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (97, N'nophoto.png', N'Macodyn Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (98, N'nophoto.png', N'Maligaya Enterprises & Palay Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (99, N'nophoto.png', N'Managra Trading Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (100, N'nophoto.png', N'Mansilungan Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (101, N'nophoto.png', N'Marsman Estate Plantation Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (102, N'nophoto.png', N'Masangkay Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (103, N'nophoto.png', N'MD Davao Agri-Ventures, Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (104, N'nophoto.png', N'MD Isalon Organic Banana Agri-Ventures,', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (105, N'nophoto.png', N'MD Nabunturan Agri-Ventures, Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (106, N'nophoto.png', N'MD Panabo Agri-Ventures, Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (107, N'nophoto.png', N'MD Rio Vista Agri-Ventures Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (108, N'nophoto.png', N'Mindanao Agritraders Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (109, N'nophoto.png', N'Model Agro Sales', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (110, N'nophoto.png', N'Money Saver Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (111, N'nophoto.png', N'Myra Flor Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (112, N'nophoto.png', N'NAC Enterprises', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (113, N'nophoto.png', N'Naga NTE Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (114, N'nophoto.png', N'New Naga Alta Agri. Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (115, N'nophoto.png', N'New St. Jude Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (116, N'nophoto.png', N'New Super Farmers Store', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (117, N'nophoto.png', N'NH Juan Veterinary & Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (118, N'nophoto.png', N'Nick''s Agri Supply*', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (119, N'nophoto.png', N'Nicole Valino', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (120, N'nophoto.png', N'Nidex Agri & Feeds Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (121, N'nophoto.png', N'NL Marketing', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (122, N'nophoto.png', N'Pacifica Agrivet Supplies (NAIC)', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (123, N'nophoto.png', N'Pacifica Agrivet Supplies, Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (124, N'nophoto.png', N'Pacifica Agrivet Supplies, Inc. (GMA)', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (125, N'nophoto.png', N'Pala-Pala APS', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (126, N'nophoto.png', N'Palawan Poultry and Gen. Mdse.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (127, N'nophoto.png', N'Palmtre Corporaton', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (128, N'nophoto.png', N'Panay Agro Center Corp.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (129, N'nophoto.png', N'Pantua Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (130, N'nophoto.png', N'Philippine Coconut Authority', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (131, N'nophoto.png', N'PICMW Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (132, N'nophoto.png', N'Pine Valley Corporation*', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (133, N'nophoto.png', N'PJ Agrivet Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (134, N'nophoto.png', N'Planters'' Choice', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (135, N'nophoto.png', N'Pontiac Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (136, N'nophoto.png', N'Potenciano & Ancieta Larrazabal Ent', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (137, N'nophoto.png', N'Primestocks Company*', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (138, N'nophoto.png', N'Progressive Trade Center', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (139, N'nophoto.png', N'QF Agricultural Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (140, N'nophoto.png', N'Quezon Farmers', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (141, N'nophoto.png', N'R.E.N. Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (142, N'nophoto.png', N'Rajal Centro Irrigators Ass. Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (143, N'nophoto.png', N'Ricardo Tolentino', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (144, N'nophoto.png', N'Richfield Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (145, N'nophoto.png', N'Rine Agro Industrial Mktg. Co.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (146, N'nophoto.png', N'RLA Agrisolutions', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (147, N'nophoto.png', N'Rom-Roem Marketing', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (148, N'nophoto.png', N'Rosendo A. Bernabe', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (149, N'nophoto.png', N'Royal Jap Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (150, N'nophoto.png', N'RR Agri Marketing', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (151, N'nophoto.png', N'Ryan Agricultural Prods. Ctr., Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (152, N'nophoto.png', N'S&P Enterprises Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (153, N'nophoto.png', N'San Leonardo Agri Ventures Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (154, N'nophoto.png', N'San Lorenzo Ruiz', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (155, N'nophoto.png', N'San Pastoni Irigators Ass.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (156, N'nophoto.png', N'Sariaya Agricultural Center', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (157, N'nophoto.png', N'Serafica Enterprises Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (158, N'nophoto.png', N'Stanfilco (A Division of Dole Phils.)', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (159, N'nophoto.png', N'Sumifru Phils. Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (160, N'nophoto.png', N'Sun Fertichem and Services', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (161, N'nophoto.png', N'Sunrise Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (162, N'nophoto.png', N'Systemic Farm Chemicals', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (163, N'nophoto.png', N'Tagum Agri. Dev''t Co. Inc.', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (164, N'nophoto.png', N'Tamaraw Farm Supply Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (165, N'nophoto.png', N'Tenese Trading', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (166, N'nophoto.png', N'Topgrow Enterprise', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (167, N'nophoto.png', N'Total Care Farm Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (168, N'nophoto.png', N'Vinissajay Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (169, N'nophoto.png', N'Vizcaya Plantation Corporation', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (170, N'nophoto.png', N'VJ Agri Supply', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
INSERT [dbo].[Customers] ([CustomerID], [CustomerImage], [CustomerCompany], [CustomerStatus], [DateAdded], [DateModified], [CustomerAddress]) VALUES (171, N'nophoto.png', N'William Enterprises', N'Active', CAST(N'2016-02-15 15:28:48.143' AS DateTime), NULL, N'None')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Deliveries] ON 

INSERT [dbo].[Deliveries] ([DID], [SOID], [EmployeeID], [CompanionID], [Companion2ID], [VehicleID]) VALUES (1, 1, -1, -1, -1, -1)
INSERT [dbo].[Deliveries] ([DID], [SOID], [EmployeeID], [CompanionID], [Companion2ID], [VehicleID]) VALUES (2, 2, -1, -1, -1, -1)
SET IDENTITY_INSERT [dbo].[Deliveries] OFF
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountID], [DiscountSOID], [DiscountPercent]) VALUES (12, 1, 10)
SET IDENTITY_INSERT [dbo].[Discounts] OFF
SET IDENTITY_INSERT [dbo].[FinishedProductInventories] ON 

INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (1, 1, 249, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (2, 2, 8, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (3, 3, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (4, 4, 23, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (5, 5, 342, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (6, 6, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (7, 7, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (8, 8, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (9, 9, 906, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (10, 10, 554, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (11, 11, 22, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (12, 12, 155, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (13, 13, 36, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (14, 14, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (15, 15, 8, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (16, 16, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (17, 17, 13, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (18, 18, 220, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (19, 19, 7, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (20, 20, 45, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (21, 21, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (22, 22, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (23, 23, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (24, 24, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (25, 25, 599, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (26, 26, 159, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (27, 27, 95, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (28, 28, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (29, 29, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (30, 30, 5, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (31, 31, 68, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (32, 32, 19, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (33, 33, 20, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (34, 34, 15, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (35, 35, 15, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (36, 36, 15, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (37, 37, 320, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (38, 38, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (39, 39, 220, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (40, 40, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (41, 41, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (42, 42, 5798, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (43, 43, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (44, 44, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (45, 45, 214, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (46, 46, 139, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (47, 47, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (48, 48, 2, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (49, 49, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (50, 50, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (51, 51, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (52, 52, 22, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (53, 53, 84, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (54, 54, 7, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (55, 55, 66, CAST(N'2016-03-08 16:16:40.270' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (56, 56, 52, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (57, 57, 6, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (58, 58, 22, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (59, 59, 120, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (60, 60, 956, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (61, 61, 9, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (62, 62, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (63, 63, 411, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (64, 64, 99, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (65, 65, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (66, 66, 553, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (67, 67, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (68, 68, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (69, 69, 129, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (70, 70, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (71, 71, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (72, 72, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (73, 73, 72, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (74, 74, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (75, 75, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (76, 76, 208, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (77, 77, 2346, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (78, 78, 15, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (79, 79, 147, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (80, 80, 18, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (81, 81, 369, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (82, 82, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (83, 83, 4, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (84, 84, 160, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (85, 85, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (86, 86, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (87, 87, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (88, 88, 209, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (89, 89, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (90, 90, 2, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (91, 91, 215, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (92, 92, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (93, 93, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (94, 94, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (95, 95, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (96, 96, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (97, 97, 19, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (98, 98, 40, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (99, 99, 9, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
GO
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (100, 100, 115, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (101, 101, 17, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (102, 102, 194, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (103, 103, 10, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (104, 104, 24, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (105, 105, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (106, 106, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (107, 107, 264, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (108, 108, 2, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (109, 109, 274, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (110, 110, 1534, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (111, 111, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (112, 112, 57, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (113, 113, 2, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (114, 114, 5, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (115, 115, 17, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (116, 116, 655, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (117, 117, 245, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (118, 118, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (119, 119, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (120, 120, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (121, 121, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (122, 122, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (123, 123, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (124, 124, 14, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (125, 125, 7, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (126, 126, 40, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (127, 127, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (128, 128, 58, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (129, 129, 2, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (130, 130, 92, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (131, 131, 16, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (132, 132, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (133, 133, 46, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (134, 134, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (135, 135, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (136, 136, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (137, 137, 20, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (138, 138, 72, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (139, 139, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (140, 140, 13, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (141, 141, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (142, 142, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (143, 143, 5, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (144, 144, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (145, 145, 100, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (146, 146, 18, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (147, 147, 7, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (148, 148, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (149, 149, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (150, 150, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (151, 151, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (152, 152, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (153, 153, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (154, 154, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (155, 155, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (156, 156, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (157, 157, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (158, 158, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (159, 159, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (160, 160, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (161, 161, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (162, 162, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (163, 163, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (164, 164, 4, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (165, 165, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (166, 166, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (167, 167, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (168, 168, 141, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (169, 169, 8, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (170, 170, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (171, 171, 195, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (172, 172, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (173, 173, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (174, 174, 25, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (175, 175, 15, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (176, 176, 4, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (177, 177, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (178, 178, 874, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (179, 179, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (180, 180, 13, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (181, 181, 997, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (182, 182, 284, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (183, 183, 13, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (184, 184, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (185, 185, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (186, 186, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (187, 187, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (188, 188, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (189, 189, 659, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (190, 190, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (191, 191, 32, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (192, 192, 7, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (193, 193, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (194, 194, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (195, 195, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (196, 196, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (197, 197, 160, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (198, 198, 17, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (199, 199, 30, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
GO
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (200, 200, 1092, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (201, 201, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (202, 202, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (203, 203, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (204, 204, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (205, 205, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (206, 206, 10, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (207, 207, 756, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (208, 208, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (209, 209, 171, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (210, 210, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (211, 211, 9, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (212, 212, 18, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (213, 213, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (214, 214, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (215, 215, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (216, 216, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (217, 217, 1100, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (218, 218, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (219, 219, 12, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (220, 220, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (221, 221, 1828, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (222, 222, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (223, 223, 7, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (224, 224, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (225, 225, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (226, 226, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (227, 227, 2, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (228, 228, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (229, 229, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (230, 230, 4, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (231, 231, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (232, 232, 69, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (233, 233, 159, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (234, 234, 20, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (235, 235, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (236, 236, 86, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (237, 237, 62, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (238, 238, 45, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (239, 239, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (240, 240, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (241, 241, 158, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (242, 242, 636, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (243, 243, 17, CAST(N'2016-03-08 16:16:40.283' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (244, 244, 24, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (245, 245, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (246, 246, 27, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (247, 247, 13, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (248, 248, 4, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (249, 249, 104, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (250, 250, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (251, 251, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (252, 252, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (253, 253, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (254, 254, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (255, 255, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (256, 256, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (257, 257, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (258, 258, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (259, 259, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (260, 260, 80, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (261, 261, 295, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (262, 262, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (263, 263, 35, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (264, 264, 75, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (265, 265, 9, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (266, 266, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (267, 267, 15, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (268, 268, 60, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (269, 269, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (270, 270, 2, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (271, 271, 80, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (272, 272, 6, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (273, 273, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (274, 274, 37, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (275, 275, 6, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (276, 276, 4, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (277, 277, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (278, 278, 6, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (279, 279, 194, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (280, 280, 390, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (281, 281, 236, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (282, 282, 123, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (283, 283, 176, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (284, 284, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (285, 285, 12, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (286, 286, 215, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (287, 287, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (288, 288, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (289, 289, 979, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (290, 290, 202, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (291, 291, 72, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (292, 292, 3, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (293, 293, 129, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (294, 294, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (295, 295, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (296, 296, 40, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (297, 297, 25, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (298, 298, 1, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (299, 299, 102, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
GO
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (300, 300, 1536, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (301, 301, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (302, 302, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (303, 303, 10, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (304, 304, 51, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (305, 305, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (306, 306, 5, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (307, 307, 11, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (308, 308, 44, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (309, 309, 10, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (310, 310, 7520, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (311, 311, 62, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (312, 312, 6, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (313, 313, 6, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (314, 314, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (315, 315, 6, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (316, 316, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (317, 317, 632, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (318, 318, 33, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (319, 319, 13, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (320, 320, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (321, 321, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (322, 322, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (323, 323, 121, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (324, 324, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (325, 325, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (326, 326, 76, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (327, 327, 6, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (328, 328, 69, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (329, 329, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (330, 330, 19, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (331, 331, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (332, 332, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (333, 333, 1231, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (334, 334, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (335, 335, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (336, 336, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (337, 337, 23, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (338, 338, 243, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (339, 339, 4, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (340, 340, 735, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (341, 341, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (342, 342, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (343, 343, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (344, 344, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (345, 345, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (346, 346, 500, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (347, 347, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (348, 348, 294, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (349, 349, 130, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (350, 350, 476, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (351, 351, 11, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (352, 352, 54, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (353, 353, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (354, 354, 518, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (355, 355, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (356, 356, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (357, 357, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (358, 358, 61, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (359, 359, 6, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (360, 360, 422, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (361, 361, 239, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (362, 362, 18, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (363, 363, 170, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (364, 364, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (365, 365, 16, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (366, 366, 643, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (367, 367, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (368, 368, 456, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (369, 369, 20, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (370, 370, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (371, 371, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (372, 372, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (373, 373, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (374, 374, 8, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (375, 375, 595, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (376, 376, 1860, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (377, 377, 500, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (378, 378, 23, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (379, 379, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (380, 380, 0, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (381, 381, 183, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (382, 382, 31, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (383, 383, 67, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (384, 384, 11, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (385, 385, 34, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (386, 386, 573, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (387, 387, 3, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (388, 388, 8, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (389, 389, 14, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (390, 390, 60, CAST(N'2016-03-08 15:55:40.220' AS DateTime))
INSERT [dbo].[FinishedProductInventories] ([FIID], [FPID], [FIQuantity], [DateModified]) VALUES (391, 391, 41, CAST(N'2016-02-16 12:43:07.757' AS DateTime))
SET IDENTITY_INSERT [dbo].[FinishedProductInventories] OFF
SET IDENTITY_INSERT [dbo].[FinishedProducts] ON 

INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (1, 1, 1, N'48', N'2,4D AMINE  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (2, 1, 1, N'49', N'2,4D AMINE  DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (3, 1, 1, N'47', N'2,4D AMINE  LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (4, 1, 1, N'1293', N'2,4D AMINE 1L', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (5, 1, 1, N'1599', N'2,4D AMINE 6X4L', N'nophoto.jpg', NULL, N'6x4L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (6, 1, 1, N'1914', N'2,4D AMINE BX60ML SAMPLE', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (7, 1, 1, N'2090', N'2,4D AMINE GALLON', N'nophoto.jpg', NULL, N'4L P. GALLON', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (8, 1, 1, N'939', N'2,4D AMINE LITER (BADSTOCK)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (9, 1, 1, N'50', N'2,4D ESTER  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (10, 1, 1, N'52', N'2,4D ESTER  24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (11, 1, 1, N'55', N'2,4D ESTER  250ML BOTTLE', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (12, 1, 1, N'54', N'2,4D ESTER  36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (13, 1, 1, N'53', N'2,4D ESTER  500ML BOTTLE', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (14, 1, 1, N'999', N'2,4D ESTER 1L (BAD STOCK)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (15, 1, 1, N'51', N'2,4D ESTER 1L BOTTLE', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (16, 1, 1, N'1210', N'2,4D ESTER 250ML BADSTOCKS', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (17, 1, 1, N'1768', N'2,4D ESTER 500ML(BADSTOCKS)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (18, 1, 1, N'63', N'ADVICE  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (19, 1, 1, N'64', N'ADVICE  1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (20, 1, 1, N'65', N'ADVICE  24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (21, 1, 1, N'68', N'ADVICE  250ML', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (22, 1, 1, N'67', N'ADVICE  36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (23, 1, 1, N'66', N'ADVICE  500ML', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (24, 1, 1, N'681', N'Advice (sample) 144X60 ML', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (25, 1, 1, N'682', N'Advice (Sample) 60 ML', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (26, 1, 1, N'940', N'ADVICE 1L BOTTLE (BADSTOCK)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (27, 1, 1, N'1771', N'ADVICE 500ML (BADSTOCKS)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (28, 1, 1, N'836', N'ADVICE DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (29, 1, 1, N'794', N'Afalon ( Sample ) 35 gms.', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (30, 1, 1, N'70', N'AFALON 50 WP 100 GMS SACHET', N'nophoto.jpg', NULL, N'100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (31, 1, 1, N'69', N'AFALON 50 WP 24X5X100GMS', N'nophoto.jpg', NULL, N'24x5x100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (32, 1, 1, N'603', N'AFALON 50 WP 5X100GMS', N'nophoto.jpg', NULL, N'5x100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (33, 1, 1, N'686', N'Agil', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (34, 1, 1, N'687', N'Agil', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (35, 1, 1, N'1855', N'AGIL 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (36, 1, 1, N'2087', N'AGIL 1L bottle', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (37, 1, 1, N'82', N'AGIL 24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (38, 1, 1, N'1785', N'AGIL 250ML (BADSTOCKS)', N'nophoto.jpg', NULL, N'240ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (39, 1, 1, N'83', N'AGIL 36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (40, 1, 1, N'1716', N'AGIL 500ML (BADSTOCKS)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (41, 1, 1, N'672', N'Agil Sample', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (42, 1, 1, N'673', N'Agil Sample', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (43, 1, 1, N'170', N'AGMATHION 144x60 ML', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (44, 1, 1, N'1769', N'ALAKDAN 250ML (BADSTOCKS)', N'nophoto.jpg', NULL, N'240ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (45, 1, 1, N'172', N'ALAKDAN 300EC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (46, 1, 1, N'173', N'ALAKDAN 300EC  24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (47, 1, 1, N'175', N'ALAKDAN 300EC  36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (48, 1, 1, N'171', N'ALAKDAN 300EC 1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (49, 1, 1, N'942', N'ALAKDAN 300EC 1L BOTTLE (BADSTOCK)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (50, 1, 1, N'176', N'ALAKDAN 300EC 250ML BOTTLE', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (51, 1, 1, N'941', N'ALAKDAN 300EC 500ML (BADSTOCK)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (52, 1, 1, N'174', N'ALAKDAN 300EC 500ML BOTTLE', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (53, 1, 1, N'14', N'ARMOR  100GMS', N'nophoto.jpg', NULL, N'100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (54, 1, 1, N'12', N'ARMOR  10x100GMS', N'nophoto.jpg', NULL, N'10x100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (55, 1, 1, N'10', N'ARMOR  12x10x100GMS', N'nophoto.jpg', NULL, N'12x10x100GMS', 1, CAST(112.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (56, 1, 1, N'11', N'ARMOR  12x5x200GMS', N'nophoto.jpg', NULL, N'12x5x200GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (57, 1, 1, N'15', N'ARMOR  200GMS', N'nophoto.jpg', NULL, N'200GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (58, 1, 1, N'13', N'ARMOR  5x200GMS', N'nophoto.jpg', NULL, N'5x200GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (59, 1, 1, N'943', N'ARMOR 100GMS (BADSTOCK)', N'nophoto.jpg', NULL, N'100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (60, 1, 1, N'16', N'Armor 20 gms (Sample)', N'nophoto.jpg', NULL, N'20 GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (61, 1, 1, N'944', N'ARMOR 200GMS (BADSTOCK)', N'nophoto.jpg', NULL, N'200GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (62, 1, 1, N'791', N'Atamet Combi (Sample)', N'nophoto.jpg', NULL, N'60GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (63, 1, 1, N'726', N'ATRAKORN 60 GMS (SAMPLE)', N'nophoto.jpg', NULL, N'60GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (64, 1, 1, N'85', N'ATRAKORN 80WP  12x1KG', N'nophoto.jpg', NULL, N'12x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (65, 1, 1, N'84', N'ATRAKORN 80WP  Bx20KG', N'nophoto.jpg', NULL, N'Bx20KGS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (66, 1, 1, N'604', N'ATRAKORN 80WP 1KG', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (67, 1, 1, N'945', N'ATRAKORN 80WP 1KG (BADSTOCK)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (68, 1, 1, N'792', N'Atramet Combi ( Sample ) 60 gms.', N'nophoto.jpg', NULL, N'60GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (69, 1, 1, N'88', N'ATRAMET COMBI 80WP  12x1KG', N'nophoto.jpg', NULL, N'12x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (70, 1, 1, N'89', N'ATRAMET COMBI 80WP  24x500GMS', N'nophoto.jpg', NULL, N'24x500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (71, 1, 1, N'87', N'ATRAMET COMBI 80WP  500GMS', N'nophoto.jpg', NULL, N'500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (72, 1, 1, N'86', N'ATRAMET COMBI 80WP  KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (73, 1, 1, N'1235', N'AZTRON 100GMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (74, 1, 1, N'1108', N'AZTRON 24X5X100GMS', N'nophoto.jpg', NULL, N'24x5x100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (75, 1, 1, N'1473', N'AZTRON 5X100GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (76, 1, 1, N'1107', N'AZTRON SACHx60GMS(SAMPLE)', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (77, 1, 1, N'1198', N'BLACK HAWK 40SL 10x1L', N'nophoto.jpg', NULL, N'10x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (78, 1, 1, N'1217', N'BLACK HAWK 40SL 1L', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (79, 1, 1, N'1231', N'BLACK HAWK SAMPLE (100ML)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (80, 1, 1, N'1715', N'BLACKHAWK 1L (BADSTOCKS)', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (81, 1, 1, N'1760', N'BLACKHAWK 20X500ML', N'nophoto.jpg', NULL, N'20x500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (82, 1, 1, N'1343', N'BLACKHAWK 24X500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (83, 1, 1, N'1586', N'BLACKHAWK 500ML', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (84, 1, 1, N'1458', N'BLACKHAWK 500ML(BADSTOCKS)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (85, 1, 1, N'1209', N'BLADE 1L BADSTOCKS', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (86, 1, 1, N'1770', N'BLADE 500ML (BADSTOCKS)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (87, 1, 1, N'1713', N'BLADE 500ML BADSTOCKS', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (88, 1, 1, N'57', N'BLADE 60EC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (89, 1, 1, N'59', N'BLADE 60EC  144x60ML', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (90, 1, 1, N'58', N'BLADE 60EC  1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (91, 1, 1, N'61', N'BLADE 60EC  24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (92, 1, 1, N'62', N'BLADE 60EC  36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (93, 1, 1, N'1712', N'BLADE 60EC 500ML', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (94, 1, 1, N'60', N'BLADE 60EC 60ML BOTTLE', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (95, 1, 1, N'2061', N'BOX OUT 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (96, 1, 1, N'2062', N'BOX OUT 1L', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (97, 1, 1, N'112', N'BUGBUSTER 5EC  100ML BOTTLE', N'nophoto.jpg', NULL, N'100ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (98, 1, 1, N'102', N'BUGBUSTER 5EC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (99, 1, 1, N'103', N'BUGBUSTER 5EC  1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
GO
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (100, 1, 1, N'107', N'BUGBUSTER 5EC  24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (101, 1, 1, N'110', N'BUGBUSTER 5EC  250ML BOTTLE', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (102, 1, 1, N'109', N'BUGBUSTER 5EC  36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (103, 1, 1, N'108', N'BUGBUSTER 5EC  500ML BOTTLE', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (104, 1, 1, N'111', N'BUGBUSTER 5EC  72x100ML', N'nophoto.jpg', NULL, N'72x100ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (105, 1, 1, N'946', N'BUGBUSTER 5EC 100ML (BADSTOCK)', N'nophoto.jpg', NULL, N'100ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (106, 1, 1, N'104', N'BUGBUSTER 5EC 144x60ML SAMPLE', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (107, 1, 1, N'947', N'BUGBUSTER 5EC 1L (BADSTOCK)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (108, 1, 1, N'948', N'BUGBUSTER 5EC 250ML (BADSTOCK)', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (109, 1, 1, N'949', N'BUGBUSTER 5EC 500ML (BADSTOCK)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (110, 1, 1, N'106', N'BUGBUSTER 5EC 60ML SAMPLE', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (111, 1, 1, N'1847', N'BUGBUSTER 5EC DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (112, 1, 1, N'1843', N'CALIRUS 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (113, 1, 1, N'1555', N'CALIRUS 1L', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (114, 1, 1, N'1669', N'CALIRUS 4L', N'nophoto.jpg', NULL, N'4L P. GALLON', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (115, 1, 1, N'1668', N'CALIRUS 6X4L', N'nophoto.jpg', NULL, N'6x4L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (116, 1, 1, N'1394', N'CALIRUS SAMPLE (500ML)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (117, 1, 1, N'1114', N'CARTAP (Sample) 30GMS (FERTIAGRO)', N'nophoto.jpg', NULL, N'30GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (118, 1, 1, N'1245', N'CARTAP 100GMS (FERTIAGRO)', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (119, 1, 1, N'690', N'Cartap 50% SP', N'nophoto.jpg', NULL, N'250GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (120, 1, 1, N'137', N'CARTAP 50% SP   24x500GMS', N'nophoto.jpg', NULL, N'24x500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (121, 1, 1, N'133', N'CARTAP 50% SP  100GMS', N'nophoto.jpg', NULL, N'100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (122, 1, 1, N'130', N'CARTAP 50% SP  24x5x100GMS (K)', N'nophoto.jpg', NULL, N'24x5x100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (123, 1, 1, N'134', N'CARTAP 50% SP  500GMS', N'nophoto.jpg', NULL, N'500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (124, 1, 1, N'135', N'CARTAP 50% SP  5x100GMS', N'nophoto.jpg', NULL, N'5x100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (125, 1, 1, N'950', N'CARTAP 50% SP 100GMS (BADSTOCK)', N'nophoto.jpg', NULL, N'100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (126, 1, 1, N'1118', N'CARTAP 50% SP 24x5x100G (FERTIAGRO)', N'nophoto.jpg', NULL, N'24x5x100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (127, 1, 1, N'951', N'CARTAP 50% SP 500GMS (BADSTOCK)', N'nophoto.jpg', NULL, N'500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (128, 1, 1, N'122', N'CHAKU 2.5 EC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (129, 1, 1, N'123', N'CHAKU 2.5 EC  1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (130, 1, 1, N'126', N'CHAKU 2.5 EC  24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (131, 1, 1, N'127', N'CHAKU 2.5 EC  500ML BOTTLE', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (132, 1, 1, N'124', N'CHAKU 2.5 EC 144x60ML (Sample)', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (133, 1, 1, N'128', N'CHAKU 2.5 EC 36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (134, 1, 1, N'125', N'CHAKU 2.5 EC 60ML (Sample)', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (135, 1, 1, N'952', N'CHAKU 2.5EC 1L (BADSTOCK)', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (136, 1, 1, N'953', N'CHAKU 2.5EC 500ML (BADSTOCK)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (137, 1, 1, N'732', N'Chaku 250ml', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (138, 1, 1, N'1860', N'CHAKU 250ML (BADSTOCKS)', N'nophoto.jpg', NULL, N'240ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (139, 1, 1, N'1841', N'CHAKU DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (140, 1, 1, N'29', N'CIVIL 75 WP  4x250GMS', N'nophoto.jpg', NULL, N'4x250GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (141, 1, 1, N'27', N'CIVIL 75 WP  Bx20KG', N'nophoto.jpg', NULL, N'Bx20KGS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (142, 1, 1, N'28', N'CIVIL 75 WP 12x4x250GMS', N'nophoto.jpg', NULL, N'12x4x250GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (143, 1, 1, N'697', N'CIVIL 75 WP 250GMS', N'nophoto.jpg', NULL, N'250GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (144, 1, 1, N'954', N'CIVIL 75WP 250GMS (BAD STOCK)', N'nophoto.jpg', NULL, N'250GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (145, 1, 1, N'1838', N'CIVIL SAMPLE', N'nophoto.jpg', NULL, N'50GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (146, 1, 1, N'1802', N'CONFIDENCE 12X750GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (147, 1, 1, N'1804', N'CONFIDENCE 750GMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (148, 1, 1, N'1173', N'CRAK 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (149, 1, 1, N'1174', N'CRAK 24X500ML', N'nophoto.jpg', NULL, N'24x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (150, 1, 1, N'1175', N'CRAK 36X250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (151, 1, 1, N'140', N'CYPERMETHRIN 5% EC  24x250ML', N'nophoto.jpg', NULL, N'24x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (152, 1, 1, N'138', N'CYPERMETHRIN 5% EC  LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (153, 1, 1, N'657', N'CYPERMETRIN 5% EC', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (154, 1, 1, N'2058', N'DEATHBUG 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (155, 1, 1, N'2059', N'DEATHBUG 1L', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (156, 1, 1, N'2095', N'DEATHBUG DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (157, 1, 1, N'1809', N'DEFENDER 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (158, 1, 1, N'1784', N'DIAZOL 1L (BADSTOCKS)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (159, 1, 1, N'168', N'DIAZOL 40EC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (160, 1, 1, N'167', N'DIAZOL 40EC  LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (161, 1, 1, N'903', N'Diazol 60 EC Sample', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (162, 1, 1, N'164', N'DIAZOL 60EC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (163, 1, 1, N'169', N'DIAZOL 60EC  Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (164, 1, 1, N'163', N'DIAZOL 60EC  LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (165, 1, 1, N'166', N'DIAZOL 60EC  Px20L', N'nophoto.jpg', NULL, N'Px20L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (166, 1, 1, N'753', N'Diazol 60EC (Sample)', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (167, 1, 1, N'165', N'DIAZOL 60EC Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (168, 1, 1, N'1595', N'DIPEL 12X500GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (169, 1, 1, N'1672', N'DIPEL 500GMS', N'nophoto.jpg', NULL, N'500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (170, 1, 1, N'1509', N'DIPEL SAMPLE 100GMS', N'nophoto.jpg', NULL, N'100GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (171, 1, 1, N'1440', N'DOMARK 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (172, 1, 1, N'1387', N'DOMARK LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (173, 1, 1, N'1284', N'DOMARK PRO (500ML)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (174, 1, 1, N'1479', N'DOMARK PRO 250ML', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (175, 1, 1, N'1462', N'DOMARK PRO 36X250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (176, 1, 1, N'1803', N'DOMARK PRO 4L', N'nophoto.jpg', NULL, N'4L P. GALLON', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (177, 1, 1, N'1536', N'DOMARK PRO 6X1GAL.', N'nophoto.jpg', NULL, N'6x4L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (178, 1, 1, N'1504', N'DOMARK PRO SAMPLE (250ML)', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (179, 1, 1, N'1476', N'ENSPRAY N 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (180, 1, 1, N'1593', N'ENSPRAY N 1L', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (181, 1, 1, N'1844', N'EVOGENE 709 BX10KGS', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (182, 1, 1, N'1327', N'EXIT 24X500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (183, 1, 1, N'1333', N'EXIT 500ML', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (184, 1, 1, N'1261', N'EXIT SAMPLE', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (185, 1, 1, N'826', N'FRUIT GUARD', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (186, 1, 1, N'830', N'FRUIT GUARD ( B X 1L )', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (187, 1, 1, N'1478', N'FRUIT GUARD 1L (BADSTOCKS)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (188, 1, 1, N'2056', N'GALILEO 36X250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (189, 1, 1, N'215', N'GOLDEN MANGO SET  Bx12x1KG', N'nophoto.jpg', NULL, N'Bx12x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (190, 1, 1, N'214', N'GOLDEN MANGO SET  Bx25KG', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (191, 1, 1, N'957', N'GOLDEN MANGO SET 1KG (BADSTOCK)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (192, 1, 1, N'213', N'GOLDEN MANGO SET KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (193, 1, 1, N'1170', N'HAWK 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (194, 1, 1, N'1171', N'HAWK 24X500ML', N'nophoto.jpg', NULL, N'24x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (195, 1, 1, N'1172', N'HAWK 36X250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (196, 1, 1, N'1859', N'KARMEX 1.8KGS (BADSTOCKS)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (197, 1, 1, N'1397', N'KARMEX 80WP 12X1.8KG', N'nophoto.jpg', NULL, N'12x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (198, 1, 1, N'1398', N'KARMEX 90WP 1.8 KG', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (199, 1, 1, N'1912', N'KARMEX SAMPLE 75GMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
GO
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (200, 1, 1, N'2041', N'KAWA ORGANIC FERTILIZER', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (201, 1, 1, N'1587', N'LAMBDA 2.5EC 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (202, 1, 1, N'1836', N'LEADER 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (203, 1, 1, N'1789', N'LEADFORCE 1KG (BADSTOCKS)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (204, 1, 1, N'1783', N'LEADFORCE BX16.7KGS (RETURNED)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (205, 1, 1, N'1521', N'LEADFORCE ULTRA (BADSTOCKS)', N'nophoto.jpg', NULL, N'Bx16.7KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (206, 1, 1, N'1469', N'LEADFORCE ULTRA 1KG (SAMPLE)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (207, 1, 1, N'1567', N'LEADFORCE ULTRA 3G 24X1KG', N'nophoto.jpg', NULL, N'24x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (208, 1, 1, N'1495', N'LEADFORCE ULTRA 3G BX16.7KG', N'nophoto.jpg', NULL, N'Bx16.7KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (209, 1, 1, N'113', N'LEADMARK 3EC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (210, 1, 1, N'115', N'LEADMARK 3EC  144x60ML (Sample)', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (211, 1, 1, N'114', N'LEADMARK 3EC  1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (212, 1, 1, N'117', N'LEADMARK 3EC  24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (213, 1, 1, N'118', N'LEADMARK 3EC  36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (214, 1, 1, N'121', N'LEADMARK 3EC  72x100ML', N'nophoto.jpg', NULL, N'72x100ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (215, 1, 1, N'958', N'LEADMARK 3EC 1L (BADSTOCK)', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (216, 1, 1, N'119', N'LEADMARK 3EC 250ML BOTTLE(BADSTOCKS)', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (217, 1, 1, N'116', N'LEADMARK 3EC 60ML BOTTLE(Sample)', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (218, 1, 1, N'120', N'LEADMARK 3EC Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (219, 1, 1, N'1533', N'LEADMARK 500ML', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (220, 1, 1, N'1215', N'LEADMARK 500ML BADSTOCKS', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (221, 1, 1, N'25', N'LEADONIL 500 SC 60ML BOTTLE', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (222, 1, 1, N'22', N'LEADONIL 500SC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (223, 1, 1, N'23', N'LEADONIL 500SC  1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (224, 1, 1, N'24', N'LEADONIL 500SC 144x60ML', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (225, 1, 1, N'959', N'LEADONIL 500SC 1L (BADSTOCK)', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (226, 1, 1, N'26', N'LEADONIL 720SC Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (227, 1, 1, N'233', N'LEADTHREL 480SL  24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (228, 1, 1, N'235', N'LEADTHREL 480SL  36x500ML', N'nophoto.jpg', NULL, N'36X500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (229, 1, 1, N'232', N'LEADTHREL 480SL  LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (230, 1, 1, N'234', N'LEADTHREL 480SL 500ML', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (231, 1, 1, N'1729', N'LEADTHREL 4L GALLON', N'nophoto.jpg', NULL, N'4L P. GALLON', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (232, 1, 1, N'147', N'MALATHION 57EC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (233, 1, 1, N'150', N'MALATHION 57EC  144x60ML', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (234, 1, 1, N'148', N'MALATHION 57EC  1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (235, 1, 1, N'156', N'MALATHION 57EC  240ML (DUPLICATE)', N'nophoto.jpg', NULL, N'240ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (236, 1, 1, N'152', N'MALATHION 57EC  24x500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (237, 1, 1, N'155', N'MALATHION 57EC  36x240ML', N'nophoto.jpg', NULL, N'36x240ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (238, 1, 1, N'159', N'MALATHION 57EC  72x100ML', N'nophoto.jpg', NULL, N'72x100ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (239, 1, 1, N'157', N'MALATHION 57EC  DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (240, 1, 1, N'965', N'MALATHION 57EC 100ML (BADSTOCK)', N'nophoto.jpg', NULL, N'100ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (241, 1, 1, N'160', N'MALATHION 57EC 100ML BOTTLE', N'nophoto.jpg', NULL, N'100ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (242, 1, 1, N'963', N'MALATHION 57EC 1L (BADSTOCK)', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (243, 1, 1, N'1002', N'MALATHION 57EC 240ML (BAD STOCK)', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(112.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (244, 1, 1, N'154', N'MALATHION 57EC 240ML BOTTLE', N'nophoto.jpg', NULL, N'240ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (245, 1, 1, N'153', N'MALATHION 57EC 36x250', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (246, 1, 1, N'964', N'MALATHION 57EC 500ML (BADSTOCK)', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (247, 1, 1, N'158', N'MALATHION 57EC 500ML BOTTLE', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (248, 1, 1, N'1003', N'MALATHION 57EC 60ML (BAD STOCK)', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (249, 1, 1, N'151', N'MALATHION 57EC 60ML BOTTLE', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (250, 1, 1, N'1781', N'MALATHION 72X100ML (IAGRI CHEM)', N'nophoto.jpg', NULL, N'72x100ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (251, 1, 1, N'1300', N'MALATHION ryan agri 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (252, 1, 1, N'1334', N'MALATHION ryan agri 144X60ML', N'nophoto.jpg', NULL, N'144x60ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (253, 1, 1, N'1301', N'MALATHION ryan agri 72x100mL', N'nophoto.jpg', NULL, N'72x100ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (254, 1, 1, N'39', N'MANAGER 42SC  Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (255, 1, 1, N'38', N'MANAGER 42SC  LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (256, 1, 1, N'33', N'MANAGER 80WP  12x1KG (OLD)', N'nophoto.jpg', NULL, N'12x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (257, 1, 1, N'32', N'MANAGER 80WP  16x3LBS (OLD)', N'nophoto.jpg', NULL, N'16x3LBS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (258, 1, 1, N'31', N'MANAGER 80WP  BX25KG', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (259, 1, 1, N'30', N'MANAGER 80WP  KILOGRAM (OLD)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (260, 1, 1, N'37', N'MANAGER 80WP B/G 12x1KG', N'nophoto.jpg', NULL, N'12x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (261, 1, 1, N'36', N'MANAGER 80WP B/G 16x3LBS', N'nophoto.jpg', NULL, N'16x3LBS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (262, 1, 1, N'966', N'MANAGER 80WP B/G 1KG (BADSTOCK)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (263, 1, 1, N'35', N'MANAGER 80WP B/G 3LBS', N'nophoto.jpg', NULL, N'3 LBS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (264, 1, 1, N'43', N'MANAGER 80WP B/G 60 GMS (Sample)', N'nophoto.jpg', NULL, N'60GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (265, 1, 1, N'34', N'MANAGER 80WP B/G KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (266, 1, 1, N'44', N'MANAGER 80WP Y 100x60GMS', N'nophoto.jpg', NULL, N'100x60GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (267, 1, 1, N'40', N'MANAGER 80WP Y 12x1KG', N'nophoto.jpg', NULL, N'12x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (268, 1, 1, N'42', N'MANAGER 80WP Y 16x3LBS', N'nophoto.jpg', NULL, N'16x3LBS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (269, 1, 1, N'967', N'MANAGER 80WP Y 1KG (BADSTOCK)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (270, 1, 1, N'41', N'MANAGER 80WP Y 3LBS', N'nophoto.jpg', NULL, N'3 LBS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (271, 1, 1, N'727', N'MANAGER 80WP/Y 60 GMS (SAMPLE)', N'nophoto.jpg', NULL, N'60GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (272, 1, 1, N'717', N'MANAGER 80WP/Y KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (273, 1, 1, N'716', N'MANAGER YELLOW KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (274, 1, 1, N'216', N'MEGA BOOSTER  10x1KG', N'nophoto.jpg', NULL, N'10x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (275, 1, 1, N'218', N'MEGA BOOSTER  20x500GMS', N'nophoto.jpg', NULL, N'20x500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (276, 1, 1, N'220', N'MEGA BOOSTER  500GMS', N'nophoto.jpg', NULL, N'500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (277, 1, 1, N'219', N'MEGA BOOSTER  Bx25KG', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (278, 1, 1, N'217', N'MEGA BOOSTER  KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (279, 1, 1, N'968', N'MEGA BOOSTER 1KG (BADSTOCK)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (280, 1, 1, N'224', N'Mega Booster 60 gms Sample', N'nophoto.jpg', NULL, N'50GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (281, 1, 1, N'221', N'MEGA F21  10x1KG', N'nophoto.jpg', NULL, N'10x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (282, 1, 1, N'223', N'MEGA F21  20x500GMS', N'nophoto.jpg', NULL, N'20x500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (283, 1, 1, N'226', N'MEGA F21  500GMS', N'nophoto.jpg', NULL, N'500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (284, 1, 1, N'225', N'MEGA F21  Bx25KG', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (285, 1, 1, N'222', N'MEGA F21  KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (286, 1, 1, N'969', N'MEGA F21 1KG (BADSTOCK)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (287, 1, 1, N'1449', N'MEGA F-21 20X500G BADSTOCK', N'nophoto.jpg', NULL, N'20x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (288, 1, 1, N'970', N'MEGA F21 500GMS (BADSTOCK)', N'nophoto.jpg', NULL, N'500GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (289, 1, 1, N'671', N'Mega F21 Sample', N'nophoto.jpg', NULL, N'60GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (290, 1, 1, N'1893', N'MONO AMONIUM (SAMPLE) 1L', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (291, 1, 1, N'75', N'MOWER - 12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (292, 1, 1, N'81', N'MOWER - 3.75 PL GALLON', N'nophoto.jpg', NULL, N'3.75L PL. GALLON', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (293, 1, 1, N'80', N'MOWER - 6x3.75', N'nophoto.jpg', NULL, N'6x3.75L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (294, 1, 1, N'77', N'Mower - Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (295, 1, 1, N'972', N'MOWER 1L (BADSTOCK)', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (296, 1, 1, N'76', N'MOWER 1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (297, 1, 1, N'1306', N'MOWER 250ML', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (298, 1, 1, N'971', N'MOWER 3.75L (BADSTOCK)', N'nophoto.jpg', NULL, N'3.75L PL. GALLON', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (299, 1, 1, N'658', N'MOWER 36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
GO
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (300, 1, 1, N'79', N'MOWER 70ML BOTTLE (Sample)', N'nophoto.jpg', NULL, N'100ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (301, 1, 1, N'780', N'Mower 72 x 70ml (Sample)', N'nophoto.jpg', NULL, N'72x100ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (302, 1, 1, N'78', N'MOWER 72x100ML', N'nophoto.jpg', NULL, N'72x100ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (303, 1, 1, N'1417', N'NAFF 1L FOR CORN', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (304, 1, 1, N'1358', N'NAFF 250ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (305, 1, 1, N'1357', N'NAGE 5ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (306, 1, 1, N'1420', N'NAGE 5ML FOR CORN', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (307, 1, 1, N'211', N'NICLOS M  10x50GMS', N'nophoto.jpg', NULL, N'10x50GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (308, 1, 1, N'212', N'NICLOS M  24x10x50GMS', N'nophoto.jpg', NULL, N'24x10x50GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (309, 1, 1, N'1718', N'NICLOS M 50GMS', N'nophoto.jpg', NULL, N'50GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (310, 1, 1, N'973', N'NICLOS M 50GMS (BADSTOCK)', N'nophoto.jpg', NULL, N'50GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (311, 1, 1, N'881', N'ODEON', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (312, 1, 1, N'1338', N'ODEON 1L', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (313, 1, 1, N'1419', N'ORGANOFLEX 10CB (10KG) FOR CORN', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (314, 1, 1, N'1360', N'ORGANOFLEX 10KG', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (315, 1, 1, N'1418', N'ORGANOFLEX 5CS (5KG) FOR CORN', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (316, 1, 1, N'1359', N'ORGANOFLEX 5KG', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (317, 1, 1, N'1113', N'PLEO (SAMPLE) Bx60ML', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (318, 1, 1, N'1112', N'PLEO 36X250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (319, 1, 1, N'1162', N'PLEO Bx250ML', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (320, 1, 1, N'1717', N'PLEO/AZTRON TWINPACK', N'nophoto.jpg', NULL, N'SET/S', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (321, 1, 1, N'1428', N'POWMYL 25SC', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (322, 1, 1, N'1581', N'POWMYL DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (323, 1, 1, N'2067', N'PRIME MALATHION 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (324, 1, 1, N'2068', N'PRIME MALATHION 24X500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (325, 1, 1, N'2094', N'PRIME MALATHION DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (326, 1, 1, N'189', N'RIMON 10EC  24x100 ML', N'nophoto.jpg', NULL, N'24x100ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (327, 1, 1, N'191', N'RIMON 10EC  250ML', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (328, 1, 1, N'190', N'RIMON 10EC  36x250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (329, 1, 1, N'192', N'RIMON 10EC  4L PL. GALLON', N'nophoto.jpg', NULL, N'4L P. GALLON', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (330, 1, 1, N'607', N'RIMON 10EC 100 ML BOTTLE', N'nophoto.jpg', NULL, N'100ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (331, 1, 1, N'974', N'RIMON 10EC 100ML (BADSTOCK)', N'nophoto.jpg', NULL, N'100ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (332, 1, 1, N'1471', N'RIMON 36X250ML (OLD STOCKS)', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (333, 1, 1, N'765', N'Rimon 60ml (Sample)', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (334, 1, 1, N'245', N'SK ENSPRAY OIL  Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (335, 1, 1, N'244', N'SK ENSPRAY OIL  LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (336, 1, 1, N'246', N'SK ENSPRAY OIL  Px20L', N'nophoto.jpg', NULL, N'Px20L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (337, 1, 1, N'1596', N'STADIO M 10X50GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (338, 1, 1, N'1403', N'STADIO M 24X10X50GMS', N'nophoto.jpg', NULL, N'24x10x50GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (339, 1, 1, N'2086', N'STADIO M 50GMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (340, 1, 1, N'1399', N'STADIO M SAMPLE X 50GMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (341, 1, 1, N'1543', N'STA-FRESH 2109 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (342, 1, 1, N'1579', N'STA-FRESH 2109 1L', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (343, 1, 1, N'203', N'STARKLE 10x12GMS', N'nophoto.jpg', NULL, N'10x12GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (344, 1, 1, N'698', N'STARKLE 12GMS', N'nophoto.jpg', NULL, N'12GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (345, 1, 1, N'975', N'STARKLE 12GMS (BADSTOCK)', N'nophoto.jpg', NULL, N'12GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (346, 1, 1, N'615', N'Starkle 20 SG 12 GMS (Sample)', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (347, 1, 1, N'204', N'STARKLE 20x10x12GMS', N'nophoto.jpg', NULL, N'20x10x12GMS', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (348, 1, 1, N'1730', N'STARKLE 20X10X25GMS(NEW)', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (349, 1, 1, N'1731', N'STARKLE 25 GMS (NEW)', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (350, 1, 1, N'208', N'STOP 6%  12x1KG', N'nophoto.jpg', NULL, N'12x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (351, 1, 1, N'207', N'STOP 6%  KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (352, 1, 1, N'1437', N'STOP 6% 1KG (BADSTOCK)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (353, 1, 1, N'1453', N'STOP 6% FROM NICOLE VALINO', N'nophoto.jpg', NULL, N'Bx12x1KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (354, 1, 1, N'793', N'Stop 60 GMS ( Sample )', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (355, 1, 1, N'799', N'Sure ( sample ) 72 x 70ml', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (356, 1, 1, N'800', N'Sure ( Sample ) Bot. x 70ml', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (357, 1, 1, N'1213', N'SURE 1L BADSTOCKS', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (358, 1, 1, N'209', N'SURE 250EC  12x1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (359, 1, 1, N'210', N'SURE 250EC 1L BOTTLE', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (360, 1, 1, N'1714', N'TAKE OFF 100ML (BADSTOCKS)', N'nophoto.jpg', NULL, N'100ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (361, 1, 1, N'1192', N'TAKE OFF 72X100ML', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (362, 1, 1, N'1196', N'TAKE OFF Bx100ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (363, 1, 1, N'1195', N'TAKE OFF SAMPLE 60ML', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (364, 1, 1, N'1194', N'TAKE OFF SAMPLE Bx900ML (FORM SUMITOMO)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (365, 1, 1, N'812', N'TOP ACE (1L)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (366, 1, 1, N'811', N'TOP ACE (20 x 1L)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (367, 1, 1, N'813', N'TOP ACE (Sample) 72x80ml', N'nophoto.jpg', NULL, N'72x100ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (368, 1, 1, N'814', N'TOP ACE (Sample) 80ml', N'nophoto.jpg', NULL, N'100ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (369, 1, 1, N'1216', N'TOP ACE 1L BADSTOCK', N'nophoto.jpg', NULL, N'LITER', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (370, 1, 1, N'1782', N'TRIKOMBI (BAD STOCKS)', N'nophoto.jpg', NULL, N'SET/S', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (371, 1, 1, N'1852', N'TRIKOMBI (CORN) SET (sample)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (372, 1, 1, N'1851', N'TRIKOMBI (LLV) SET (sample)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (373, 1, 1, N'1288', N'TRIKOMBI (SAMPLE)', N'nophoto.jpg', NULL, N'SET/S', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (374, 1, 1, N'1477', N'TRIKOMBI SET 1BOX', N'nophoto.jpg', NULL, N'SET/S', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (375, 1, 1, N'1467', N'TRIKOMBI SET 6X1BOX', N'nophoto.jpg', NULL, N'SET/S', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (376, 1, 1, N'1870', N'ULTRASOL K (bags x 25KGS)', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (377, 1, 1, N'2046', N'ULTRASOL K GRAMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (378, 1, 1, N'2045', N'ULTRASOL K KILO', N'nophoto.jpg', NULL, N'KILO', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (379, 1, 1, N'2027', N'WEEDBUSTER 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (380, 1, 1, N'2040', N'WEEDBUSTER 6X3.75L', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (381, 1, 1, N'1777', N'ZETA ONE 24X500ML', N'nophoto.jpg', NULL, N'24x500ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (382, 1, 1, N'1810', N'ZETA ONE 250ML BOTTLE', N'nophoto.jpg', NULL, N'250ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (383, 1, 1, N'1778', N'ZETA ONE 36X250ML', N'nophoto.jpg', NULL, N'36x250ML', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (384, 1, 1, N'1790', N'ZETA ONE 500ML BOTTLE', N'nophoto.jpg', NULL, N'500ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (385, 1, 1, N'1740', N'zeta one 50mL (sample)', N'nophoto.jpg', NULL, N'60ML BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (386, 1, 1, N'1662', N'ZINC GOLD PLUS 12X1L', N'nophoto.jpg', NULL, N'12x1L', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (387, 1, 1, N'1702', N'ZINC GOLD PLUS 1L', N'nophoto.jpg', NULL, N'1L BOTTLE', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (388, 1, 1, N'1159', N'ZINC PHOSPIDE 100X10GMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (389, 1, 1, N'1160', N'ZINC PHOSPIDE 10GMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (390, 1, 1, N'2004', N'ZINC PHOSPIDE 10GMS(BADSTOCKS)', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
INSERT [dbo].[FinishedProducts] ([FPID], [CategoryID], [BrandID], [FPCode], [FPName], [FPImage], [FPDescription], [FPUOM], [FPPieceUOM], [FPSellingPrice], [FPCriticalLevel], [FPSafeLevel], [FPStatus], [DateAdded], [DateModified]) VALUES (391, 1, 1, N'1157', N'ZINC PHOSPIDE 12X100X10GMS', N'nophoto.jpg', NULL, N'SET/S', 1, CAST(100.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:40:25.270' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[FinishedProducts] OFF
SET IDENTITY_INSERT [dbo].[FPPrices] ON 

INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (1, 258, CAST(200.00 AS Decimal(18, 2)), CAST(N'2016-02-23 13:49:37.207' AS DateTime))
INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (2, 258, CAST(100.00 AS Decimal(18, 2)), CAST(N'2016-02-23 13:49:45.377' AS DateTime))
INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (3, 55, CAST(112.00 AS Decimal(18, 2)), CAST(N'2016-03-08 15:57:33.437' AS DateTime))
INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (4, 243, CAST(112.00 AS Decimal(18, 2)), CAST(N'2016-03-08 15:57:38.723' AS DateTime))
INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (5, 55, CAST(100.00 AS Decimal(18, 2)), CAST(N'2016-03-08 16:08:23.700' AS DateTime))
INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (6, 243, CAST(100.00 AS Decimal(18, 2)), CAST(N'2016-03-08 16:08:29.127' AS DateTime))
INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (7, 55, CAST(112.00 AS Decimal(18, 2)), CAST(N'2016-03-08 16:09:41.037' AS DateTime))
INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (8, 243, CAST(112.00 AS Decimal(18, 2)), CAST(N'2016-03-08 16:09:45.830' AS DateTime))
INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (9, 55, CAST(100.00 AS Decimal(18, 2)), CAST(N'2016-03-08 16:10:27.507' AS DateTime))
INSERT [dbo].[FPPrices] ([FPPID], [FPID], [FPPrice], [DateAdded]) VALUES (10, 55, CAST(112.00 AS Decimal(18, 2)), CAST(N'2016-03-08 16:11:44.740' AS DateTime))
SET IDENTITY_INSERT [dbo].[FPPrices] OFF
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (1, 1, N'Login', N'Logged In', CAST(N'2016-02-15 14:40:22.470' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (2, 1, N'Login', N'Logged In', CAST(N'2016-02-15 14:44:21.060' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (3, 1, N'Login', N'Logged In', CAST(N'2016-02-15 15:12:04.287' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (4, 1, N'Login', N'Logged In', CAST(N'2016-02-15 15:20:14.763' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (5, 2, N'Login', N'Logged In', CAST(N'2016-02-15 15:20:27.810' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (6, 2, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 15:24:58.120' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (7, 1, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 15:30:24.110' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (8, 2, N'Customers', N'Added a customer record', CAST(N'2016-02-15 15:42:53.297' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (9, 1, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 15:43:16.253' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (10, 1, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 15:44:53.947' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (11, 1, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 15:47:50.410' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (12, 1, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 15:48:51.527' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (13, 2, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 15:50:17.807' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (14, 1, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 15:51:13.550' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (15, 1, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 15:51:43.990' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (16, 2, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 15:52:39.043' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (17, 1, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 15:53:42.523' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (18, 2, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 15:56:21.857' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (19, 1, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 15:57:22.197' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (20, 1, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 15:57:36.737' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (21, 2, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 15:58:42.753' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (22, 2, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 15:59:30.120' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (23, 1, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 16:00:43.860' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (24, 2, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 16:01:53.593' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (25, 1, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 16:02:34.437' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (26, 1, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 16:05:35.833' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (27, 2, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 16:06:05.297' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (28, 1, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 16:06:30.310' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (29, 2, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 16:07:35.743' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (30, 1, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 16:07:59.997' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (31, 2, N'Suppliers', N'Added a supplier record', CAST(N'2016-02-15 16:10:36.760' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (32, 1, N'Suppliers', N'Updated its supplier record', CAST(N'2016-02-15 16:13:31.393' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (33, 1, N'Login', N'Logged In', CAST(N'2016-02-16 08:59:04.277' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (34, 1, N'Login', N'Logged In', CAST(N'2016-02-16 13:32:00.077' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (35, 1, N'Supplier Items', N'Added/Updated a supplier item record', CAST(N'2016-02-16 14:04:49.413' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (36, 1, N'Login', N'Logged In', CAST(N'2016-02-16 15:13:00.163' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (37, 1, N'Login', N'Logged In', CAST(N'2016-02-16 16:35:01.440' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (38, 1, N'Login', N'Logged In', CAST(N'2016-02-16 16:52:27.987' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (39, 1, N'Types', N'Updated a User type', CAST(N'2016-02-16 16:53:53.193' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (40, 1, N'Types', N'Updated a User type', CAST(N'2016-02-16 16:54:00.403' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (41, 1, N'Login', N'Logged In', CAST(N'2016-02-17 09:30:10.673' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (42, 1, N'Employees', N'Added an employee record', CAST(N'2016-02-17 09:31:02.320' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (43, 1, N'Login', N'Logged In', CAST(N'2016-02-17 09:32:53.477' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (44, 1, N'Login', N'Logged In', CAST(N'2016-02-17 09:34:35.793' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (45, 1, N'Payroll', N'Added a payroll record', CAST(N'2016-02-17 09:35:09.283' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (46, 3, N'Login', N'Logged In', CAST(N'2016-02-17 09:53:29.023' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (47, 3, N'Logout', N'Logged out', CAST(N'2016-02-17 09:55:19.923' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (48, 1, N'Logout', N'Logged out', CAST(N'2016-02-17 09:56:43.960' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (49, 3, N'Login', N'Logged In', CAST(N'2016-02-17 09:56:54.320' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (50, 3, N'Logout', N'Logged out', CAST(N'2016-02-17 09:57:11.890' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (51, 1, N'Login', N'Logged In', CAST(N'2016-02-17 10:02:20.263' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (52, 1, N'Login', N'Logged In', CAST(N'2016-02-18 10:37:54.557' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (53, 3, N'Login', N'Logged In', CAST(N'2016-02-18 10:48:35.403' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (54, 1, N'Login', N'Logged In', CAST(N'2016-02-23 13:38:54.000' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (55, 1, N'Login', N'Logged In', CAST(N'2016-02-23 14:16:25.840' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (56, 1, N'Login', N'Logged In', CAST(N'2016-02-23 14:26:13.643' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (57, 1, N'Login', N'Logged In', CAST(N'2016-02-23 14:56:19.147' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (58, 1, N'Login', N'Logged In', CAST(N'2016-02-23 15:41:23.667' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (59, 1, N'Login', N'Logged In', CAST(N'2016-02-23 16:07:51.270' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (60, 1, N'Login', N'Logged In', CAST(N'2016-02-26 09:27:54.020' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (61, 1, N'Login', N'Logged In', CAST(N'2016-02-26 10:24:38.267' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (62, 1, N'Sales Order', N'Added a pending sales order', CAST(N'2016-02-26 10:25:38.690' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (63, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:25:41.377' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (64, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:28:47.260' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (65, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:29:36.400' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (66, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:30:33.760' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (67, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:31:29.253' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (68, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:31:56.910' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (69, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:33:25.817' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (70, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:34:13.820' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (71, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:49:28.830' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (72, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:49:36.667' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (73, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:49:47.577' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (74, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:49:54.563' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (75, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:49:57.890' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (76, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:50:33.707' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (77, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:51:08.710' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (78, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:51:23.470' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (79, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:51:53.890' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (80, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:52:30.900' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (81, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:52:39.087' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (82, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:52:52.513' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (83, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:54:01.313' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (84, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:54:03.990' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (85, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:54:28.757' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (86, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:54:35.193' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (87, 1, N'Login', N'Logged In', CAST(N'2016-02-26 10:56:49.720' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (88, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:57:20.533' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (89, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:57:37.153' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (90, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 10:59:56.743' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (91, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:00:01.623' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (92, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:00:48.490' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (93, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:01:13.613' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (94, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:01:35.337' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (95, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:02:10.173' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (96, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:02:15.567' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (97, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:02:18.923' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (98, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:02:22.463' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (99, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:02:24.103' AS DateTime))
GO
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (100, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:02:37.350' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (101, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:02:39.293' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (102, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:02:40.137' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (103, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:03:02.893' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (104, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:03:18.380' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (105, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:03:58.213' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (106, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:04:23.947' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (107, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:04:55.573' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (108, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:04:58.180' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (109, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:05:43.557' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (110, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:06:01.643' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (111, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:07:21.810' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (112, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:10:43.520' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (113, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:10:57.837' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (114, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:11:00.950' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (115, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:11:05.847' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (116, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:13:56.870' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (117, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:14:00.997' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (118, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:14:03.417' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (119, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:18:01.507' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (120, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:18:52.520' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (121, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:19:53.130' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (122, 1, N'Login', N'Logged In', CAST(N'2016-02-26 11:23:01.643' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (123, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:23:10.740' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (124, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:23:43.497' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (125, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:24:06.680' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (126, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:24:12.037' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (127, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:24:19.217' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (128, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:24:27.943' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (129, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:24:48.613' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (130, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:26:00.263' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (131, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:26:16.707' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (132, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:26:20.853' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (133, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:26:24.623' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (134, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:26:54.443' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (135, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:27:17.737' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (136, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:28:02.910' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (137, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:28:07.893' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (138, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:28:22.630' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (139, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:29:14.207' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (140, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:29:19.717' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (141, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:29:53.470' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (142, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:30:10.330' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (143, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:31:10.217' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (144, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:31:14.327' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (145, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:31:17.113' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (146, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:32:08.073' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (147, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:37:27.530' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (148, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:37:32.677' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (149, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:40:58.817' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (150, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:41:13.917' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (151, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:42:25.857' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (152, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:42:34.100' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (153, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:43:17.387' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (154, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:43:19.163' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (155, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:58:16.197' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (156, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:58:36.737' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (157, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:58:58.810' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (158, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:59:50.990' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (159, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 11:59:51.143' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (160, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 12:00:38.770' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (161, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 12:00:43.960' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (162, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 12:00:44.047' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (163, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 12:01:02.953' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (164, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 12:01:03.073' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (165, 1, N'Logout', N'Logged out', CAST(N'2016-02-26 12:01:10.503' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (166, 1, N'Login', N'Logged In', CAST(N'2016-02-26 14:30:11.423' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (167, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:30:47.217' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (168, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:31:07.947' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (169, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:31:08.070' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (170, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:31:30.107' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (171, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:31:43.820' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (172, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:32:02.067' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (173, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:32:02.183' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (174, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:33:00.190' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (175, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:33:31.020' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (176, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:33:31.127' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (177, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:33:56.813' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (178, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:34:01.660' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (179, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-02-26 14:34:09.823' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (180, 1, N'Login', N'Logged In', CAST(N'2016-02-26 17:04:36.343' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (181, 1, N'Login', N'Logged In', CAST(N'2016-03-08 09:54:23.923' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (182, 1, N'Approved', N'Approved the sales order for delivery', CAST(N'2016-03-08 15:26:45.877' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (183, 1, N'Sales Order', N'Received the sales order', CAST(N'2016-03-08 15:27:00.757' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (184, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 15:27:24.493' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (185, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 15:27:32.750' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (186, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 15:27:37.793' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (187, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 15:28:09.757' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (188, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 15:28:09.883' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (189, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 15:33:05.943' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (190, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 15:33:39.403' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (191, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 15:35:47.547' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (192, 1, N'Login', N'Logged In', CAST(N'2016-03-08 15:39:06.237' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (193, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 15:41:10.810' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (194, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 15:41:15.310' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (195, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 15:41:45.627' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (196, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 15:50:33.237' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (197, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 15:56:05.360' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (198, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 15:56:30.777' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (199, 1, N'Sales Order', N'Added a pending sales order', CAST(N'2016-03-08 16:12:04.153' AS DateTime))
GO
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (200, 1, N'Login', N'Logged In', CAST(N'2016-03-08 16:13:31.703' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (201, 1, N'Approved', N'Approved the sales order for delivery', CAST(N'2016-03-08 16:16:25.247' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (202, 1, N'Sales Order', N'Received the sales order', CAST(N'2016-03-08 16:16:40.293' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (203, 1, N'Sales Order', N'Added a pending sales order', CAST(N'2016-03-08 16:17:09.527' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (204, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 16:17:25.940' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (205, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 16:30:24.577' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (206, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 16:30:34.680' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (207, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 16:30:46.173' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (208, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 16:30:56.823' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (209, 1, N'Sales Order', N'Added a pending sales order', CAST(N'2016-03-08 17:19:49.917' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (210, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 17:24:05.063' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (211, 1, N'Login', N'Logged In', CAST(N'2016-03-08 17:25:26.717' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (212, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 17:25:35.490' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (213, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 17:25:39.390' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (214, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 17:25:42.747' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (215, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 17:25:53.817' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (216, 1, N'Sales Order', N'Updated a payment status', CAST(N'2016-03-08 17:29:45.647' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (217, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 17:30:12.030' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (218, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 17:30:20.000' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (219, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 17:30:31.950' AS DateTime))
INSERT [dbo].[Logs] ([LogID], [UserID], [LogType], [LogDetails], [DateAdded]) VALUES (220, 1, N'Sales Order', N'Updated a sales order', CAST(N'2016-03-08 17:30:45.297' AS DateTime))
SET IDENTITY_INSERT [dbo].[Logs] OFF
SET IDENTITY_INSERT [dbo].[Prices] ON 

INSERT [dbo].[Prices] ([PriceID], [CustomerID], [FPID], [Price], [DateAdded]) VALUES (1, 26, 55, CAST(100.00 AS Decimal(18, 2)), CAST(N'2016-02-26 10:25:38.627' AS DateTime))
INSERT [dbo].[Prices] ([PriceID], [CustomerID], [FPID], [Price], [DateAdded]) VALUES (2, 26, 243, CAST(100.00 AS Decimal(18, 2)), CAST(N'2016-02-26 10:25:38.677' AS DateTime))
INSERT [dbo].[Prices] ([PriceID], [CustomerID], [FPID], [Price], [DateAdded]) VALUES (3, 152, 55, CAST(112.00 AS Decimal(18, 2)), CAST(N'2016-03-08 16:12:04.130' AS DateTime))
INSERT [dbo].[Prices] ([PriceID], [CustomerID], [FPID], [Price], [DateAdded]) VALUES (4, 152, 243, CAST(112.00 AS Decimal(18, 2)), CAST(N'2016-03-08 16:12:04.147' AS DateTime))
INSERT [dbo].[Prices] ([PriceID], [CustomerID], [FPID], [Price], [DateAdded]) VALUES (5, 152, 55, CAST(112.00 AS Decimal(18, 2)), CAST(N'2016-03-08 16:17:09.520' AS DateTime))
INSERT [dbo].[Prices] ([PriceID], [CustomerID], [FPID], [Price], [DateAdded]) VALUES (6, 152, 55, CAST(112.00 AS Decimal(18, 2)), CAST(N'2016-03-08 17:19:49.910' AS DateTime))
SET IDENTITY_INSERT [dbo].[Prices] OFF
SET IDENTITY_INSERT [dbo].[RawInventories] ON 

INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (1, 1, CAST(1124.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (2, 2, CAST(5081.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (3, 3, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (4, 4, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (5, 5, CAST(384.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (6, 6, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (7, 7, CAST(1100.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (8, 8, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (9, 9, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (10, 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (11, 11, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (12, 12, CAST(729.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (13, 13, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (14, 14, CAST(410.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (15, 15, CAST(6506.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (16, 16, CAST(1055.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (17, 17, CAST(45286.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (18, 18, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (19, 19, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (20, 20, CAST(8496.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (21, 21, CAST(14160.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (22, 22, CAST(11451.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (23, 23, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (24, 24, CAST(12700.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (25, 25, CAST(9878.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (26, 26, CAST(259.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (27, 27, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (28, 28, CAST(8163.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (29, 29, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (30, 30, CAST(6431.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (31, 31, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (32, 32, CAST(463.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (33, 33, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (34, 34, CAST(898.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (35, 35, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (36, 36, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (37, 37, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (38, 38, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (39, 39, CAST(79859.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (40, 40, CAST(73046.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (41, 41, CAST(4960.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (42, 42, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (43, 43, CAST(588.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (44, 44, CAST(3837.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (45, 45, CAST(345.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (46, 46, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (47, 47, CAST(1910.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (48, 48, CAST(556.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (49, 49, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (50, 50, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (51, 51, CAST(6536.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (52, 52, CAST(2654.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (53, 53, CAST(4038.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (54, 54, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (55, 55, CAST(925.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (56, 56, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (57, 57, CAST(74985.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (58, 58, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (59, 59, CAST(4820.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (60, 60, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (61, 61, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (62, 62, CAST(13393.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (63, 63, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (64, 64, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (65, 65, CAST(9260.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (66, 66, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (67, 67, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (68, 68, CAST(10213.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (69, 69, CAST(4804.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (70, 70, CAST(9332.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (71, 71, CAST(50889.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (72, 72, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (73, 73, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (74, 74, CAST(1962.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (75, 75, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (76, 76, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (77, 77, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (78, 78, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (79, 79, CAST(23488.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (80, 80, CAST(2155.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (81, 81, CAST(19759.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (82, 82, CAST(2319.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (83, 83, CAST(12068.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (84, 84, CAST(2727.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (85, 85, CAST(369.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (86, 86, CAST(1370.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (87, 87, CAST(1752.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (88, 88, CAST(3014.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (89, 89, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (90, 90, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (91, 91, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (92, 92, CAST(5387.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (93, 93, CAST(20857.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (94, 94, CAST(7297.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (95, 95, CAST(12109.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (96, 96, CAST(15022.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (97, 97, CAST(10199.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (98, 98, CAST(859.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (99, 99, CAST(8160.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
GO
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (100, 100, CAST(2580.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (101, 101, CAST(6000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (102, 102, CAST(1100.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (103, 103, CAST(14000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (104, 104, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (105, 105, CAST(7146.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (106, 106, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (107, 107, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (108, 108, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (109, 109, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (110, 110, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (111, 111, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (112, 112, CAST(1950.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (113, 113, CAST(4274.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (114, 114, CAST(11609.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (115, 115, CAST(11467.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (116, 116, CAST(6033.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (117, 117, CAST(8273.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (118, 118, CAST(391.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (119, 119, CAST(497.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (120, 120, CAST(90.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (121, 121, CAST(12.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (122, 122, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (123, 123, CAST(8160.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (124, 124, CAST(2200.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (125, 125, CAST(6000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (126, 126, CAST(204.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (127, 127, CAST(17717.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (128, 128, CAST(694.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (129, 129, CAST(419.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (130, 130, CAST(846.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (131, 131, CAST(766.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (132, 132, CAST(553.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (133, 133, CAST(1644.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (134, 134, CAST(487.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (135, 135, CAST(1804.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (136, 136, CAST(1620.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (137, 137, CAST(2150.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (138, 138, CAST(5809.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (139, 139, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (140, 140, CAST(5032.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (141, 141, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (142, 142, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (143, 143, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (144, 144, CAST(10089.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (145, 145, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (146, 146, CAST(5816.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (147, 147, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (148, 148, CAST(10503.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (149, 149, CAST(13440.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (150, 150, CAST(6130.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (151, 151, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (152, 152, CAST(41538.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (153, 153, CAST(38535.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (154, 154, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (155, 155, CAST(19591.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (156, 156, CAST(20000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (157, 157, CAST(67290.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (158, 158, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (159, 159, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (160, 160, CAST(1291.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (161, 161, CAST(1727.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (162, 162, CAST(339.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (163, 163, CAST(84.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (164, 164, CAST(2588.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (165, 165, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (166, 166, CAST(83.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (167, 167, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (168, 168, CAST(36289.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (169, 169, CAST(44620.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (170, 170, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (171, 171, CAST(3508.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (172, 172, CAST(4486.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (173, 173, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (174, 174, CAST(1066.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (175, 175, CAST(1121.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (176, 176, CAST(5869.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (177, 177, CAST(8649.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (178, 178, CAST(759.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (179, 179, CAST(215.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (180, 180, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (181, 181, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (182, 182, CAST(21636.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (183, 183, CAST(6665.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (184, 184, CAST(5784.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (185, 185, CAST(9489.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (186, 186, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (187, 187, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (188, 188, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (189, 189, CAST(10619.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (190, 190, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (191, 191, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (192, 192, CAST(1237.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (193, 193, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (194, 194, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (195, 195, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (196, 196, CAST(1261.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (197, 197, CAST(578.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (198, 198, CAST(336.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (199, 199, CAST(17546.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
GO
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (200, 200, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (201, 201, CAST(7126.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (202, 202, CAST(832.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (203, 203, CAST(4061.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (204, 204, CAST(3560.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (205, 205, CAST(3628.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (206, 206, CAST(15020.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (207, 207, CAST(1748.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (208, 208, CAST(47088.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (209, 209, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (210, 210, CAST(18476.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (211, 211, CAST(50.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (212, 212, CAST(19297.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (213, 213, CAST(14395.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (214, 214, CAST(1128.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (215, 215, CAST(60.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (216, 216, CAST(2292.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (217, 217, CAST(257.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (218, 218, CAST(16710.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (219, 219, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (220, 220, CAST(770.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (221, 221, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (222, 222, CAST(1097.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (223, 223, CAST(3397.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (224, 224, CAST(14763.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (225, 225, CAST(6822.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (226, 226, CAST(130753.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (227, 227, CAST(86053.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (228, 228, CAST(44569.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (229, 229, CAST(8399.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (230, 230, CAST(867.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (231, 231, CAST(24789.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (232, 232, CAST(80998.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (233, 233, CAST(3086.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (234, 234, CAST(979.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (235, 235, CAST(3.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (236, 236, CAST(463.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (237, 237, CAST(36670.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (238, 238, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (239, 239, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (240, 240, CAST(11499.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (241, 241, CAST(28924.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (242, 242, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (243, 243, CAST(450.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (244, 244, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (245, 245, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (246, 246, CAST(2240.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (247, 247, CAST(500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (248, 248, CAST(922.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (249, 249, CAST(3500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (250, 250, CAST(2500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (251, 251, CAST(3550.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (252, 252, CAST(2500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (253, 253, CAST(2500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (254, 254, CAST(2500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (255, 255, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (256, 256, CAST(2500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (257, 257, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (258, 258, CAST(1074.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (259, 259, CAST(3000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (260, 260, CAST(3356.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (261, 261, CAST(4500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (262, 262, CAST(2500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (263, 263, CAST(2500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (264, 264, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (265, 265, CAST(4000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (266, 266, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (267, 267, CAST(500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (268, 268, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (269, 269, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (270, 270, CAST(47.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (271, 271, CAST(6.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (272, 272, CAST(669.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (273, 273, CAST(5991.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (274, 274, CAST(19681.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (275, 275, CAST(23590.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (276, 276, CAST(374.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (277, 277, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (278, 278, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (279, 279, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (280, 280, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (281, 281, CAST(299.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (282, 282, CAST(929.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (283, 283, CAST(2541.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (284, 284, CAST(3844.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (285, 285, CAST(16869.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (286, 286, CAST(2351.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (287, 287, CAST(740.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (288, 288, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (289, 289, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (290, 290, CAST(473000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (291, 291, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (292, 292, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (293, 293, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (294, 294, CAST(743.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (295, 295, CAST(282.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (296, 296, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (297, 297, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (298, 298, CAST(44.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (299, 299, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
GO
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (300, 300, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (301, 301, CAST(22000.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (302, 302, CAST(16.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (303, 303, CAST(323400.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (304, 304, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (305, 305, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (306, 306, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (307, 307, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (308, 308, CAST(13.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (309, 309, CAST(609.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (310, 310, CAST(74.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (311, 311, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (312, 312, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (313, 313, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (314, 314, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (315, 315, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (316, 316, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (317, 317, CAST(200.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (318, 318, CAST(155.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (319, 319, CAST(700.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (320, 320, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (321, 321, CAST(-1.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (322, 322, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (323, 323, CAST(2.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (324, 324, CAST(2.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (325, 325, CAST(133.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (326, 326, CAST(199.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (327, 327, CAST(4.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (328, 328, CAST(400.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (329, 329, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (330, 330, CAST(814.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (331, 331, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (332, 332, CAST(17.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (333, 333, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (334, 334, CAST(1795.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (335, 335, CAST(7.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (336, 336, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (337, 337, CAST(24.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (338, 338, CAST(12.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (339, 339, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (340, 340, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (341, 341, CAST(5.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (342, 342, CAST(216.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (343, 343, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (344, 344, CAST(86.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (345, 345, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (346, 346, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (347, 347, CAST(437.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (348, 348, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (349, 349, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (350, 350, CAST(1.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (351, 351, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (352, 352, CAST(217.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (353, 353, CAST(24.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (354, 354, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (355, 355, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (356, 356, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (357, 357, CAST(119593.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (358, 358, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (359, 359, CAST(3.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (360, 360, CAST(10.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (361, 361, CAST(15.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (362, 362, CAST(62.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (363, 363, CAST(21.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (364, 364, CAST(211.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (365, 365, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (366, 366, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (367, 367, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (368, 368, CAST(1140.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (369, 369, CAST(34.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (370, 370, CAST(168.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (371, 371, CAST(15.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (372, 372, CAST(432.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (373, 373, CAST(3.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (374, 374, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (375, 375, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (376, 376, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (377, 377, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (378, 378, CAST(7.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (379, 379, CAST(22.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (380, 380, CAST(56.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (381, 381, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (382, 382, CAST(92.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (383, 383, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (384, 384, CAST(0.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (385, 385, CAST(135.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (386, 386, CAST(31.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
INSERT [dbo].[RawInventories] ([RawInventoryID], [RawID], [RIQuantity], [DateModified]) VALUES (387, 387, CAST(3200.00 AS Decimal(18, 2)), CAST(N'2016-02-16 12:24:09.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[RawInventories] OFF
SET IDENTITY_INSERT [dbo].[RawProducts] ON 

INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (1, 1, 1, N'400', N'2,4D Amine Label 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (2, 1, 1, N'1598', N'2,4D AMINE LABEL GALLON', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (3, 1, 1, N'1704', N'2,4D AMINE LABEL(GAL.)-AGCHEM', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (4, 1, 1, N'700', N'2,4D Ester Label 1L (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (5, 1, 1, N'401', N'2,4D Ester Label 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (6, 1, 1, N'403', N'2,4D Ester Label 250ml (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (7, 1, 1, N'846', N'2,4D ESTER LABEL 250ML (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (8, 1, 1, N'844', N'2,4D ESTER LABEL 500 ML (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (9, 1, 1, N'402', N'2,4D Ester Label 500ml (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (10, 1, 1, N'330', N'2,4D Granules Sacks', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (11, 1, 1, N'782', N'37mm Tamperproof Caps W/ Liner', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (12, 1, 1, N'404', N'Advice Label 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (13, 1, 1, N'406', N'Advice Label 250ml (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (14, 1, 1, N'405', N'Advice Label 500ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (15, 1, 1, N'486', N'Afalon inner box 5x100g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (16, 1, 1, N'342', N'Afalon KD Carton 24x5x100gms', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (17, 1, 1, N'1743', N'Afalon printed sachet 100gms.', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (18, 1, 1, N'391', N'Afalon sticker 100g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (19, 1, 1, N'392', N'Afalon Sticker 50g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (20, 1, 1, N'524', N'Agil Label 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (21, 1, 1, N'526', N'Agil Label 250ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (22, 1, 1, N'525', N'Agil Label 500ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (23, 1, 1, N'1677', N'AGIL LABEL 500ML(DAMAGE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (24, 1, 1, N'407', N'Agmathion Label 60ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (25, 1, 1, N'408', N'Alakdan Label 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (26, 1, 1, N'409', N'Alakdan Label 250ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (27, 1, 1, N'410', N'Alakdan Label 500ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (28, 1, 1, N'488', N'Armor inner box 10x100g (BIG/NEW)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (29, 1, 1, N'677', N'Armor inner box 10x100g (SMALL/OLD)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (30, 1, 1, N'489', N'Armor inner box 5x200g (BIG/NEW)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (31, 1, 1, N'676', N'Armor inner box 5x200g (SMALL/OLD)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (32, 1, 1, N'678', N'Armor KD Carton 12x10x100g(BIG/NEW)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (33, 1, 1, N'343', N'Armor KD Carton 12x10x100g(SMALL/OLD)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (34, 1, 1, N'344', N'Armor KD Carton 12x5x200g(BIG/NEW)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (35, 1, 1, N'679', N'Armor KD Carton 12x5x200g(SMALL/OLD)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (36, 1, 1, N'345', N'Armor KD Cartons 12x1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (37, 1, 1, N'831', N'Armor Plain Foil (200 gms)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (38, 1, 1, N'471', N'Armor Plastic bag (100g)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (39, 1, 1, N'767', N'Armor Printed Aluminum Foil (100g)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (40, 1, 1, N'472', N'Armor Printed Aluminum Foil (200g)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (41, 1, 1, N'490', N'Atrakorn inner box 1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (42, 1, 1, N'1678', N'ATRAKORN INNERBOX (DAMAGE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (43, 1, 1, N'346', N'Atrakorn KD Carton 12x1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (44, 1, 1, N'491', N'Atramet Combi inner box 1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (45, 1, 1, N'347', N'Atramet Combi KD Carton 12x1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (46, 1, 1, N'1102', N'AZTRON 100G STICKER F & B', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (47, 1, 1, N'1101', N'AZTRON INNER BOX', N'nophoto.jpg', NULL, N'5x100GMS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (48, 1, 1, N'1120', N'AZTRON KD CARTON 24X5X100GMS', N'nophoto.jpg', NULL, N'24x5x100GMS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (49, 1, 1, N'1558', N'AZTRON PRINTED SACH 100GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (50, 1, 1, N'1325', N'BLACKHAWK LABEL 250ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (51, 1, 1, N'1326', N'BLACKHAWK LABEL 500ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (52, 1, 1, N'1688', N'BLACKHAWK LABEL 500ML(COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (53, 1, 1, N'411', N'Blade Label 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (54, 1, 1, N'412', N'Blade Label 250ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (55, 1, 1, N'413', N'Blade Label 500ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (56, 1, 1, N'2054', N'BOX OUT LABEL 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (57, 1, 1, N'506', N'Box Top Sticker (Protector Seal)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (58, 1, 1, N'415', N'Bugbuster Label 100ml (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (59, 1, 1, N'883', N'Bugbuster Label 100ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (60, 1, 1, N'416', N'Bugbuster Label 120ml (amber)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (61, 1, 1, N'417', N'Bugbuster Label 1L (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (62, 1, 1, N'414', N'Bugbuster Label 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (63, 1, 1, N'688', N'Bugbuster Label 250ml (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (64, 1, 1, N'418', N'Bugbuster Label 250ml (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (65, 1, 1, N'689', N'Bugbuster Label 250ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (66, 1, 1, N'420', N'Bugbuster Label 500ml (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (67, 1, 1, N'704', N'Bugbuster Label 500ml (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (68, 1, 1, N'419', N'Bugbuster Label 500ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (69, 1, 1, N'1842', N'CALIRUS LABEL 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (70, 1, 1, N'1664', N'CALIRUS LABEL 4L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (71, 1, 1, N'492', N'Cartap inner box 5x100g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (72, 1, 1, N'691', N'Cartap Inner Box 5x200g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (73, 1, 1, N'348', N'Cartap KD Carton 24x500g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (74, 1, 1, N'349', N'Cartap KD Carton 24x5x100g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (75, 1, 1, N'350', N'Cartap KD Carton 24x5x100g (Kemistar)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (76, 1, 1, N'393', N'Cartap Sticker 100g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (77, 1, 1, N'493', N'Cartap w/ window inner box', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (78, 1, 1, N'703', N'Chaku Label 1L (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (79, 1, 1, N'421', N'Chaku Label 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (80, 1, 1, N'701', N'Chaku Label 250ml (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (81, 1, 1, N'422', N'Chaku Label 250ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (82, 1, 1, N'702', N'Chaku Label 500ml (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (83, 1, 1, N'423', N'Chaku Label 500ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (84, 1, 1, N'494', N'Civil Inner box 4x250g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (85, 1, 1, N'351', N'Civil KD Carton 12x1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (86, 1, 1, N'473', N'Civil Plastic Pouch 250g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (87, 1, 1, N'739', N'CleanCut Label 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (88, 1, 1, N'740', N'CleanCut Label 4L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (89, 1, 1, N'819', N'Clearcut Label 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (90, 1, 1, N'820', N'Clearcut Label 4L (Gal.) / Old', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (91, 1, 1, N'1026', N'Clearcut Label 4L (New Design)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (92, 1, 1, N'1281', N'COEX BOTTLE (24X100ML)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (93, 1, 1, N'1282', N'COEX BOTTLE (72X100ML)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (94, 1, 1, N'380', N'COEX Bottle 1Liter', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (95, 1, 1, N'383', N'COEX Bottle 250ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (96, 1, 1, N'382', N'COEX Bottle 500ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (97, 1, 1, N'1796', N'CONFIDENCE INNERBOX 750GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (98, 1, 1, N'1800', N'CONFIDENCE KD CARTON 12X750GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (99, 1, 1, N'1167', N'CRAK LABEL 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
GO
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (100, 1, 1, N'1169', N'CRAK LABEL 250ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (101, 1, 1, N'1168', N'CRAK LABEL 500ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (102, 1, 1, N'2051', N'DEATHBUG LABEL 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (103, 1, 1, N'1808', N'DEFENDER LABEL 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (104, 1, 1, N'427', N'Diazol 40 EC Label 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (105, 1, 1, N'428', N'Diazol 60 EC Label Liters', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (106, 1, 1, N'512', N'Diazol Drum Capseal', N'nophoto.jpg', NULL, N'SET/S', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (107, 1, 1, N'388', N'Diazol Empty Drum Dx200L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (108, 1, 1, N'649', N'Diazol Empty Pail (steel)  Px20L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (109, 1, 1, N'807', N'Diazol Empty Plastic Container 20L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (110, 1, 1, N'631', N'Diazol sticker 20L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (111, 1, 1, N'395', N'Diazol Sticker Label 200L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (112, 1, 1, N'1439', N'DOMARK BANNERRETS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (113, 1, 1, N'1519', N'DOMARK PRO 4L LABEL', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (114, 1, 1, N'1400', N'DOMARK PRO LABEL 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (115, 1, 1, N'1456', N'DOMARK PRO LABEL 250ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (116, 1, 1, N'1493', N'ENSPRAY LABEL 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (117, 1, 1, N'1324', N'EXIT LABEL 500ML', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (118, 1, 1, N'823', N'Fruit Guard Label 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (119, 1, 1, N'2042', N'GALILEO LABEL 250ML', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (120, 1, 1, N'334', N'Golden Mango Set Bags', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (121, 1, 1, N'624', N'Golden Mango Set KD Carton 12x1Kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (122, 1, 1, N'335', N'Golden Mango Set P/Liner', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (123, 1, 1, N'1164', N'HAWK LABEL 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (124, 1, 1, N'1166', N'HAWK LABEL 250ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (125, 1, 1, N'1165', N'HAWK LABEL 500ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (126, 1, 1, N'1405', N'KARMEX CTN 12X1.8KGS W/ PARTITION', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (127, 1, 1, N'1412', N'KARMEX PLASTIC POUCH 1.8KG', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (128, 1, 1, N'1411', N'KARMEX POUCH 1.8KGS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (129, 1, 1, N'2020', N'KD CARTON 12X1L (PLAIN)(pet)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (130, 1, 1, N'2050', N'KD carton 24x500mL PLAIN w/ Partition', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (131, 1, 1, N'2019', N'KD CARTON 36X250ML(PLAIN)(pet)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (132, 1, 1, N'2002', N'KD carton 6x4L (plain) - Agri', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (133, 1, 1, N'647', N'KD Carton Mower 6x3.75L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (134, 1, 1, N'642', N'KD Carton w/ partition 24x500ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (135, 1, 1, N'619', N'KD carton w/ partition 36 x 250ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (136, 1, 1, N'513', N'KD Carton w/partition 12x1L PET', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (137, 1, 1, N'1831', N'LEADER LABEL 1L (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (138, 1, 1, N'436', N'Leadmark Label 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (139, 1, 1, N'437', N'Leadmark Label 250ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (140, 1, 1, N'438', N'Leadmark Label 500ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (141, 1, 1, N'357', N'Leadthrel KD Carton 36x500ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (142, 1, 1, N'358', N'Leadthrel KD Carton 36x500ml (old)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (143, 1, 1, N'644', N'Leadthrel Label 500ml (Carton Used)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (144, 1, 1, N'443', N'Leadthrel Label 500ml (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (145, 1, 1, N'643', N'Leadthrel Label 500ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (146, 1, 1, N'1728', N'LEADTHREL LABEL GALLON', N'nophoto.jpg', NULL, N'4L P. GALLON', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (147, 1, 1, N'1905', N'LEADTHREL STICKER', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (148, 1, 1, N'444', N'Malathion Agworld Label 100ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (149, 1, 1, N'445', N'Malathion Agworld Label 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (150, 1, 1, N'446', N'Malathion Agworld Label 60ml', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (151, 1, 1, N'359', N'Malathion KD Carton w/ Logo', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (152, 1, 1, N'447', N'Malathion Label 100ml (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (153, 1, 1, N'448', N'Malathion Label 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (154, 1, 1, N'722', N'Malathion Label 240ml (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (155, 1, 1, N'450', N'Malathion Label 240ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (156, 1, 1, N'449', N'Malathion Label 500ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (157, 1, 1, N'451', N'Malathion Label 60ml AMBER(NEW)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (158, 1, 1, N'692', N'Malathion Label 60ml AMBER(OLD)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (159, 1, 1, N'390', N'Manager Cannister', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (160, 1, 1, N'361', N'Manager Corrugated Cartons 16x3lbs', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (161, 1, 1, N'496', N'Manager inner box 1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (162, 1, 1, N'360', N'Manager KD Carton 12x1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (163, 1, 1, N'772', N'Manager KD Partition (Cross Type)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (164, 1, 1, N'720', N'Manager KD Partition (Wrap around)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (165, 1, 1, N'452', N'Manager Label 3lbs for Cannister', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (166, 1, 1, N'474', N'Manager Plastic Bag 10x16" (3lbs)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (167, 1, 1, N'827', N'MANAGER plastic pouch (Kilo)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (168, 1, 1, N'475', N'Manager pouch 3lbs', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (169, 1, 1, N'2083', N'MANAGER POUCH KILO', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (170, 1, 1, N'705', N'Mega Booster Inner Box 1kg (BIG)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (171, 1, 1, N'508', N'Mega Booster Inner Box 1kg (SMALL)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (172, 1, 1, N'497', N'Mega Booster Inner Box 500g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (173, 1, 1, N'362', N'Mega Booster KD Carton 10x1kg (BIG)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (174, 1, 1, N'645', N'Mega Booster KD Carton 10x1Kg (SMALL)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (175, 1, 1, N'363', N'Mega Booster KD Carton 20x500g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (176, 1, 1, N'630', N'Mega F21 inner box 1Kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (177, 1, 1, N'498', N'Mega F21 Inner Box 500g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (178, 1, 1, N'364', N'Mega F21 KD Carton 10x1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (179, 1, 1, N'365', N'Mega F21 KD Carton 20x500g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (180, 1, 1, N'396', N'Mega F21 Sunburst Sticker 50 WP', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (181, 1, 1, N'457', N'Mower Label 1L (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (182, 1, 1, N'641', N'Mower Label 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (183, 1, 1, N'709', N'Mower Label 250ml (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (184, 1, 1, N'458', N'Mower Label 250ml (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (185, 1, 1, N'459', N'Mower Label 3.75L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (186, 1, 1, N'1906', N'MOWER STICKER', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (187, 1, 1, N'1347', N'NAFF LABEL 250ML (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (188, 1, 1, N'1383', N'NAGE 100ML LABET (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (189, 1, 1, N'499', N'Niclos M inner box 10x50g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (190, 1, 1, N'367', N'Niclos M KD Carton 24x10x50g (BIG)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (191, 1, 1, N'710', N'Niclos M KD Carton 24x10x50g (SMALL)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (192, 1, 1, N'785', N'Niclos M KD CTN 24x10x50gms (NEW)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (193, 1, 1, N'1757', N'ORGANOFLEX 10CB STICKER(5KG)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (194, 1, 1, N'1758', N'ORGANOFLEX 5CS STICKER (5KG)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (195, 1, 1, N'1424', N'ORGANOFLEX POUCH 12"X15"', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (196, 1, 1, N'398', N'Packaging Tape (Logo)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (197, 1, 1, N'399', N'Packaging Tape (Plain)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (198, 1, 1, N'694', N'Pet Bottle 120ml (White)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (199, 1, 1, N'652', N'Pet Bottle 1L (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
GO
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (200, 1, 1, N'1707', N'PET BOTTLE 1L (RED CAPS)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (201, 1, 1, N'511', N'Pet Bottle 1L (WHITE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (202, 1, 1, N'821', N'Pet Bottle 1L (Yellow)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (203, 1, 1, N'680', N'PET Bottle 250ml (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (204, 1, 1, N'529', N'PET Bottle 250ml (WHITE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (205, 1, 1, N'653', N'Pet Bottle 500 ml (AMBER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (206, 1, 1, N'616', N'Pet Bottle 500ml (WHITE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (207, 1, 1, N'1725', N'PLAIN FOIL (STARKLE 25GMS)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (208, 1, 1, N'1871', N'PLAIN FOIL 115X150mm (STADIO M)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (209, 1, 1, N'1520', N'PLAIN FOIL 15"X18"  (ORGANOFLEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (210, 1, 1, N'1799', N'PLASTIC 8X10 (for Confidence)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (211, 1, 1, N'725', N'Plastic Bag 10 x 16"', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (212, 1, 1, N'628', N'Plastic Bag 10x14', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (213, 1, 1, N'479', N'Plastic Bag 6x12"', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (214, 1, 1, N'483', N'Plastic Bag 8x14"', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (215, 1, 1, N'387', N'Plastic Container 3.75L (MOWER/NATURAL)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (216, 1, 1, N'1132', N'PLASTIC CONTAINER 4 Liters', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (217, 1, 1, N'1686', N'PLEO AZTRON KD CTN.', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (218, 1, 1, N'1474', N'PLEO LABEL 250ML (NEW)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (219, 1, 1, N'1104', N'PLEO LABEL 250ML (OLD)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (220, 1, 1, N'1570', N'POWMYL STICKER LABEL', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (221, 1, 1, N'2008', N'POWMYL STICKER LABEL 20L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (222, 1, 1, N'2052', N'PRIME MALATHION LABEL 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (223, 1, 1, N'2053', N'PRIME MALATHION LABEL 500ML', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (224, 1, 1, N'461', N'Rimon Label 100ml (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (225, 1, 1, N'462', N'Rimon Label 250ml (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (226, 1, 1, N'337', N'ROPP Caps 20mm', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (227, 1, 1, N'338', N'ROPP Caps 22mm', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (228, 1, 1, N'1392', N'STADIO M 50GMS STICKER LABEL', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (229, 1, 1, N'1393', N'STADIO M INNER BOX (10X50GMS)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (230, 1, 1, N'1388', N'STADIO M KD CTN. 24X10X50GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (231, 1, 1, N'1522', N'STADIO M PLAIN FOIL', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (232, 1, 1, N'1918', N'STADIO M PRINTED SACHET 50GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (233, 1, 1, N'1535', N'STA-FRESH LABEL (1L)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (234, 1, 1, N'500', N'Starkle Inner Box', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (235, 1, 1, N'369', N'Starkle KD Carton 20x10x12g', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (236, 1, 1, N'1792', N'STARKLE KD CARTON 20X10X25GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (237, 1, 1, N'1332', N'STARKLE MEASURING SPOON', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (238, 1, 1, N'1302', N'STARKLE OVERSTICKER', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (239, 1, 1, N'336', N'Starkle Pouch Carrier', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (240, 1, 1, N'1751', N'STARKLE PRINTED SACHET 25GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (241, 1, 1, N'484', N'Starkle Sachet', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (242, 1, 1, N'1719', N'STARKLE STICKER LABEL 25GMS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (243, 1, 1, N'1939', N'STICKER (ADVICE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (244, 1, 1, N'1954', N'STICKER (AFALON)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (245, 1, 1, N'1929', N'STICKER (AGIL)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (246, 1, 1, N'1946', N'STICKER (ARMOR)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (247, 1, 1, N'1955', N'STICKER (ATRAKORN)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (248, 1, 1, N'1930', N'STICKER (AZTRON)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (249, 1, 1, N'1936', N'STICKER (BLACKHAWK)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (250, 1, 1, N'1951', N'STICKER (BUGBUSTER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (251, 1, 1, N'1935', N'STICKER (CARTAP)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (252, 1, 1, N'1934', N'STICKER (CHAKU)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (253, 1, 1, N'1953', N'STICKER (DOMARK)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (254, 1, 1, N'1952', N'STICKER (LEADFORCE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (255, 1, 1, N'1941', N'STICKER (LEADMARK)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (256, 1, 1, N'1950', N'STICKER (LEADONIL)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (257, 1, 1, N'1940', N'STICKER (MANAGER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (258, 1, 1, N'1948', N'STICKER (MEGA BOOSTER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (259, 1, 1, N'1944', N'STICKER (MEGA F21)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (260, 1, 1, N'1947', N'STICKER (MOWER)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (261, 1, 1, N'1945', N'STICKER (NICLOS M)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (262, 1, 1, N'1933', N'STICKER (PLEO)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (263, 1, 1, N'1931', N'STICKER (RIMON)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (264, 1, 1, N'1942', N'STICKER (STADIO M)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (265, 1, 1, N'1937', N'STICKER (STARKLE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (266, 1, 1, N'1932', N'STICKER (STOP)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (267, 1, 1, N'1943', N'STICKER (TAKE OFF)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (268, 1, 1, N'1938', N'STICKER (TOP ACE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (269, 1, 1, N'1949', N'STICKER (ZETA ONE)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (270, 1, 1, N'531', N'Stop Inner Box 1Kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (271, 1, 1, N'370', N'Stop KD Carton 12x1kg', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (272, 1, 1, N'634', N'Sure LABEL 1L (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (273, 1, 1, N'711', N'Sure LABEL 1L (PET)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (274, 1, 1, N'1179', N'TAKE OFF (MEASURING CAP)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (275, 1, 1, N'1182', N'TAKE OFF LABEL 100ml. (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (276, 1, 1, N'1096', N'TOP ACE KD CARTON', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (277, 1, 1, N'809', N'Top Ace Label 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (278, 1, 1, N'1745', N'TRIKOMBI (CORN) KD CARTON', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (279, 1, 1, N'1460', N'TRIKOMBI KD CTN 6X1SET', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (280, 1, 1, N'1451', N'TRIKOMBIE INNER BOX', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (281, 1, 1, N'2021', N'WEEDBUSTER KD CTNS 6X1GAL', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (282, 1, 1, N'2017', N'WEEDBUSTER LABEL 1GAL.', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (283, 1, 1, N'2018', N'WEEDBUSTER LABEL 1L', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (284, 1, 1, N'1773', N'ZETA ONE LABEL 250ML (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (285, 1, 1, N'1774', N'ZETA ONE LABEL 500ML (COEX)', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (286, 1, 1, N'1126', N'ZINC PHOSPIDE BOX 100 x 10GMS', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (287, 1, 1, N'1142', N'ZINC PHOSPIDE kd cartons 12X100X10GMS', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (288, 1, 1, N'1805', N'(AGRESPAK) KARMEX  BX15KGS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (289, 1, 1, N'1915', N'(AGRESPAK) MANCOZEB B/G BX20KG', N'nophoto.jpg', NULL, N'Bx20KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (290, 1, 1, N'1806', N'(AGRESPAK) ZINC PHOSPHIDE 10GMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (291, 1, 1, N'824', N'AGROCER TP 1688', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (292, 1, 1, N'534', N'Alakdan 300 EC', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (293, 1, 1, N'533', N'Ametryne Bag x 20KG (Ametrex)', N'nophoto.jpg', NULL, N'Bx20KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (294, 1, 1, N'535', N'Ametryne/Atrazine Bx15KG (Atramet C.)', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (295, 1, 1, N'536', N'Atrazine Bag x 15KG (Atrakorn)', N'nophoto.jpg', NULL, N'Bx20KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (296, 1, 1, N'699', N'Atrazine KG (Atrakorn)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (297, 1, 1, N'1140', N'AZTRON WDG', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (298, 1, 1, N'1103', N'AZTRON WDG DX72KGS', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (299, 1, 1, N'46', N'BUTACHLOR 90% TECHNICAL  DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
GO
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (300, 1, 1, N'45', N'BUTACHLOR 90% TECHNICAL  KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (301, 1, 1, N'1660', N'CALIRUS 150SL LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (302, 1, 1, N'1909', N'CARBOSULFAN 25WP', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (303, 1, 1, N'876', N'CARTAP FERTIAGRO - TECH', N'nophoto.jpg', NULL, N'100GMS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (304, 1, 1, N'538', N'Cartap Tech 50% SP Dx25KG', N'nophoto.jpg', NULL, N'KEG (Dx25KG)', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (305, 1, 1, N'1910', N'CARTAP+BUPROFEZIN CANX250GMS', N'nophoto.jpg', NULL, N'250GMS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (306, 1, 1, N'1053', N'Chlorothalonil 75% WP (Civil)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (307, 1, 1, N'541', N'Chlorothalonil 75% WP Bx25KG (Civil)', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (308, 1, 1, N'1794', N'CONFIDENCE  TECH. KILO', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (309, 1, 1, N'1793', N'CONFIDENCE(DIURON 80WG) TECH. BX15KGS', N'nophoto.jpg', NULL, N'UNIT / PC', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (310, 1, 1, N'542', N'Cypermethrin Tech 93% Dx50KGS', N'nophoto.jpg', NULL, N'Dx50KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (311, 1, 1, N'598', N'Cypermethrin Tech 93% KGS', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (312, 1, 1, N'1095', N'Cypermethrin Tech 95% Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (313, 1, 1, N'543', N'Diazinon Technical 95% Dx220KG', N'nophoto.jpg', NULL, N'Dx220KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (314, 1, 1, N'548', N'Diurex 80 WP (Bagx25 kgs.)', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (315, 1, 1, N'730', N'Diurex 80WP (Bag x 20Kg.)', N'nophoto.jpg', NULL, N'Bx20KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (316, 1, 1, N'93', N'DIURON 80WP  Bx25KG', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (317, 1, 1, N'1438', N'DOMARK PRO DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (318, 1, 1, N'1501', N'DOMARK PRO TECH. LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (319, 1, 1, N'886', N'EMULSIFIER C', N'nophoto.jpg', NULL, N'Grams', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (320, 1, 1, N'885', N'EMULSIFIER C', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (321, 1, 1, N'550', N'Emulsifier C  Dx200KGS', N'nophoto.jpg', NULL, N'Dx200KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (322, 1, 1, N'584', N'Emulsogen IT Dx200KG', N'nophoto.jpg', NULL, N'Dx200KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (323, 1, 1, N'1323', N'EXIT DRUM X 208L', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (324, 1, 1, N'1052', N'Fantic M', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (325, 1, 1, N'919', N'Fantic M', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (326, 1, 1, N'1354', N'FENVALERAE TECH. 1 KG', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (327, 1, 1, N'551', N'Fenvalerate Dx200 KG (Leadmark)', N'nophoto.jpg', NULL, N'Dx200KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (328, 1, 1, N'1355', N'FENVALERATE TECH GMS', N'nophoto.jpg', NULL, N'Grams', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (329, 1, 1, N'1873', N'GLYPHOSATE (MONO AMONIUM)', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (330, 1, 1, N'596', N'GLYPHOSATE Dx200L  (Mower)', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (331, 1, 1, N'552', N'GLYPHOSATE Liters  (Mower)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (332, 1, 1, N'1827', N'GROWEL', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (333, 1, 1, N'553', N'Hunter', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (334, 1, 1, N'1452', N'KARMEX 80%WP BX15KG', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (335, 1, 1, N'1911', N'KARMEX 80%WP KILO', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (336, 1, 1, N'1466', N'KARMEX 80WP BX25KG', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (337, 1, 1, N'1496', N'KAWA 4-2-2 (FERTILIZER)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (338, 1, 1, N'556', N'Lambda Cyhalothrin Tech. Dx25KG', N'nophoto.jpg', NULL, N'KEG (Dx25KG)', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (339, 1, 1, N'610', N'Lambda Cyhalothrin Tech. KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (340, 1, 1, N'1585', N'Lambda cyhalotrin tech  Dx45kgs', N'nophoto.jpg', NULL, N'Dx50KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (341, 1, 1, N'236', N'LEADTHREL 480SL  Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (342, 1, 1, N'1274', N'Linuron (Afalon) Bx15Kgs', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (343, 1, 1, N'532', N'Linuron (Afalon) Bx20KGS', N'nophoto.jpg', NULL, N'Bx20KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (344, 1, 1, N'597', N'Malathion Tech Dx250KGS', N'nophoto.jpg', NULL, N'Dx250KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (345, 1, 1, N'557', N'Malathion Tech Kgs.', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (346, 1, 1, N'560', N'Mancozeb 42 SC Ltrs', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (347, 1, 1, N'734', N'MANCOZEB B/G', N'nophoto.jpg', NULL, N'Bx20KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (348, 1, 1, N'1767', N'MANCOZEB B/G (SABERO) BX25KGS', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (349, 1, 1, N'601', N'Mancozeb B/G Bx25', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (350, 1, 1, N'611', N'Mancozeb B/G KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (351, 1, 1, N'559', N'Mancozeb Yellow Bx25 KG(SABERO)', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (352, 1, 1, N'1727', N'MANCOZEB YELLOW BX25KG(UPL)', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (353, 1, 1, N'558', N'Mancozeb Yellow KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (354, 1, 1, N'563', N'Methyl Thiophanate Dx50KG', N'nophoto.jpg', NULL, N'Dx50KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (355, 1, 1, N'612', N'Methyl Thiophanate KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (356, 1, 1, N'574', N'Niclosamide 250 EC Dx200L (Sure)', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (357, 1, 1, N'565', N'Niclosamide 50WP  50 GMS (Niclos M)', N'nophoto.jpg', NULL, N'50GMS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (358, 1, 1, N'1682', N'NICLOSAMIDE LITER (RAW MAT)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (359, 1, 1, N'898', N'Novaluron (LITERS)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (360, 1, 1, N'608', N'Novaluron Dx200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (361, 1, 1, N'1310', N'NPK 10-20-30 KILO', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (362, 1, 1, N'1082', N'NPK 10-20-30 PLUS TE', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (363, 1, 1, N'1141', N'NPK 21-21-21', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (364, 1, 1, N'1083', N'NPK 21-21-21 PLUS TE', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (365, 1, 1, N'1139', N'PLEO 10EC', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (366, 1, 1, N'1111', N'PLEO 10EC DX200L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (367, 1, 1, N'1561', N'POWMYL (diethofencarb tc 99%)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (368, 1, 1, N'2117', N'PRIMESTOCKS DIURON BX25KGS', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (369, 1, 1, N'609', N'PROPAQUIZAPOP (Agil Dx200L)', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (370, 1, 1, N'599', N'PROPAQUIZAPOP (Agil Liters)', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (371, 1, 1, N'1735', N'RICE FERTILIZER 11-0-41', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (372, 1, 1, N'1896', N'STADIO M BX25KGS', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (373, 1, 1, N'2047', N'STADIO M KILO', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (374, 1, 1, N'1542', N'STA-FRESH DX208.2L', N'nophoto.jpg', NULL, N'DX200L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (375, 1, 1, N'1548', N'STA-FRESH LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (376, 1, 1, N'573', N'Starkle 20 SG Dx50 KG', N'nophoto.jpg', NULL, N'Dx80KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (377, 1, 1, N'614', N'Starkle 20 SG KILOGRAM', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (378, 1, 1, N'1832', N'STARKLE(Dinotefuran) Dx100kgs', N'nophoto.jpg', NULL, N'UNASSIGNED', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (379, 1, 1, N'1191', N'TAKE OFF 10SC TECH. DX185L', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (380, 1, 1, N'1275', N'TAKE OFF LITER', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (381, 1, 1, N'749', N'THIOPHANATE (ARMOR)', N'nophoto.jpg', NULL, N'KILO', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (382, 1, 1, N'795', N'Thiophanate Methyl ( Armor )', N'nophoto.jpg', NULL, N'BX25KG', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (383, 1, 1, N'593', N'Toximul A/H  Dx200 KG', N'nophoto.jpg', NULL, N'Dx200KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (384, 1, 1, N'594', N'Toximul D  Dx200KG', N'nophoto.jpg', NULL, N'Dx200KGS', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (385, 1, 1, N'1510', N'ZETA ONE 10SC 1L', N'nophoto.jpg', NULL, N'LITER', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (386, 1, 1, N'1775', N'ZETA ONE 10SC TECH. DX185L', N'nophoto.jpg', NULL, N'Dx180L', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
INSERT [dbo].[RawProducts] ([RawID], [CategoryID], [BrandID], [RawCode], [RawName], [RawImage], [RawDescription], [RawUOM], [RawPieceUOM], [RawPurchasePrice], [RawCriticalLevel], [RawSafeLevel], [RawStatus], [DateAdded], [DateModified]) VALUES (387, 1, 1, N'1137', N'ZINC PHOSPIDE Sach x 10gms', N'nophoto.jpg', NULL, N'Grams', 1, CAST(0.00 AS Decimal(18, 2)), 10, 100, N'Active', CAST(N'2016-02-16 12:19:54.623' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RawProducts] OFF
SET IDENTITY_INSERT [dbo].[SalesOrderDetails] ON 

INSERT [dbo].[SalesOrderDetails] ([SODID], [SOID], [FPID], [SODQuantity], [SODAmount], [SODStatus], [SODQuantityReceived], [UserID]) VALUES (58, 1, 55, 1, CAST(100.00 AS Decimal(18, 2)), N'Delivered', N'0', 1)
INSERT [dbo].[SalesOrderDetails] ([SODID], [SOID], [FPID], [SODQuantity], [SODAmount], [SODStatus], [SODQuantityReceived], [UserID]) VALUES (59, 1, 243, 1, CAST(100.00 AS Decimal(18, 2)), N'Delivered', N'0', 1)
INSERT [dbo].[SalesOrderDetails] ([SODID], [SOID], [FPID], [SODQuantity], [SODAmount], [SODStatus], [SODQuantityReceived], [UserID]) VALUES (67, 1, 390, 7, CAST(700.00 AS Decimal(18, 2)), N'Delivered', N'0', 1)
INSERT [dbo].[SalesOrderDetails] ([SODID], [SOID], [FPID], [SODQuantity], [SODAmount], [SODStatus], [SODQuantityReceived], [UserID]) VALUES (68, 2, 55, 1, CAST(112.00 AS Decimal(18, 2)), N'Delivered', N'0', 1)
INSERT [dbo].[SalesOrderDetails] ([SODID], [SOID], [FPID], [SODQuantity], [SODAmount], [SODStatus], [SODQuantityReceived], [UserID]) VALUES (69, 2, 243, 1, CAST(112.00 AS Decimal(18, 2)), N'Delivered', N'0', 1)
INSERT [dbo].[SalesOrderDetails] ([SODID], [SOID], [FPID], [SODQuantity], [SODAmount], [SODStatus], [SODQuantityReceived], [UserID]) VALUES (70, 3, 55, 1, CAST(112.00 AS Decimal(18, 2)), N'Pending', N'0', 1)
INSERT [dbo].[SalesOrderDetails] ([SODID], [SOID], [FPID], [SODQuantity], [SODAmount], [SODStatus], [SODQuantityReceived], [UserID]) VALUES (71, 4, 55, 1, CAST(112.00 AS Decimal(18, 2)), N'Pending', N'0', 1)
SET IDENTITY_INSERT [dbo].[SalesOrderDetails] OFF
SET IDENTITY_INSERT [dbo].[SalesOrders] ON 

INSERT [dbo].[SalesOrders] ([SOID], [CustomerID], [AgentID], [SOInvoiceNo], [SOPaymentMethod], [SOPaymentStatus], [SOCleanBalance], [SOBalance], [SOUnpaidBalance], [SOStatus], [SOVATApplied], [DateAdded], [DateDelivery], [SOTerms], [SOPurchaseOrder]) VALUES (1, 26, NULL, N'123456', N'Cash on Delivery', N'Partially Paid', CAST(900.00 AS Decimal(18, 2)), CAST(810.00 AS Decimal(18, 2)), CAST(780.00 AS Decimal(18, 2)), N'Delivered', N'true', CAST(N'2016-02-26 10:25:38.503' AS DateTime), CAST(N'2016-02-27 00:00:00.000' AS DateTime), N'3 months', N'123456')
INSERT [dbo].[SalesOrders] ([SOID], [CustomerID], [AgentID], [SOInvoiceNo], [SOPaymentMethod], [SOPaymentStatus], [SOCleanBalance], [SOBalance], [SOUnpaidBalance], [SOStatus], [SOVATApplied], [DateAdded], [DateDelivery], [SOTerms], [SOPurchaseOrder]) VALUES (2, 152, NULL, N'1234567890', N'Cash on Delivery', N'Not Paid', CAST(224.00 AS Decimal(18, 2)), CAST(224.00 AS Decimal(18, 2)), CAST(224.00 AS Decimal(18, 2)), N'Delivered', N'true', CAST(N'2016-03-08 16:12:04.057' AS DateTime), CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'3 months', N'')
INSERT [dbo].[SalesOrders] ([SOID], [CustomerID], [AgentID], [SOInvoiceNo], [SOPaymentMethod], [SOPaymentStatus], [SOCleanBalance], [SOBalance], [SOUnpaidBalance], [SOStatus], [SOVATApplied], [DateAdded], [DateDelivery], [SOTerms], [SOPurchaseOrder]) VALUES (3, 152, NULL, N'5464654365', N'Cash on Delivery', N'Not Paid', CAST(112.00 AS Decimal(18, 2)), CAST(112.00 AS Decimal(18, 2)), CAST(112.00 AS Decimal(18, 2)), N'Pending', N'true', CAST(N'2016-03-08 16:17:09.473' AS DateTime), CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'3 months', N'')
INSERT [dbo].[SalesOrders] ([SOID], [CustomerID], [AgentID], [SOInvoiceNo], [SOPaymentMethod], [SOPaymentStatus], [SOCleanBalance], [SOBalance], [SOUnpaidBalance], [SOStatus], [SOVATApplied], [DateAdded], [DateDelivery], [SOTerms], [SOPurchaseOrder]) VALUES (4, 152, NULL, N'', N'Cash on Delivery', N'Not Paid', CAST(112.00 AS Decimal(18, 2)), CAST(112.00 AS Decimal(18, 2)), CAST(112.00 AS Decimal(18, 2)), N'Pending', N'true', CAST(N'2016-03-08 17:19:49.857' AS DateTime), CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'3 months', N'')
SET IDENTITY_INSERT [dbo].[SalesOrders] OFF
SET IDENTITY_INSERT [dbo].[SiteAccess] ON 

INSERT [dbo].[SiteAccess] ([SiteID], [TypeID], [CMSBasicRead], [CMSPagesRead], [InventoryRawMaterialsRead], [InventoryRawMaterialsWrite], [InventoryFinishedProductsRead], [InventoryFinishedProductsWrite], [ReportUserMasterListRead], [ReportCompanyMasterListRead], [ReportEmployeeMasterListRead], [ReportAgentMasterListRead], [ReportSupplierMasterListRead], [ReportFinishedProductsMasterListRead], [ReportRawMaterialsMasterListRead], [ReportBillOfMaterialsMasterListRead], [ReportSalesOrderListRead], [ReportPurchaseOrderListRead], [ReportReturnOrderListRead], [ReportStatementOfAccountsRead], [PageUserRead], [PageUserWrite], [PageCategoryRead], [PageCategoryWrite], [PageBrandRead], [PageBrandWrite], [PageTruckRead], [PageTruckWrite], [PageUOMRead], [PageUOMWrite], [PageSystemLogsRead], [PageUserLogsRead], [PageCompanyRead], [PageCompanyWrite], [PageAgentsRead], [PageAgentsWrite], [PageSupplierRead], [PageSupplierWrite], [PageRawMaterialsRead], [PageRawMaterialsWrite], [PageFinishedProductsRead], [PageFinishedProductsWrite], [PageEmployeeRead], [PageEmployeeWrite], [PagePayrollRead], [PagePayrollWrite], [PageContractRead], [PageContractWrite], [ProcessSalesOrderRead], [ProcessSalesOrderWrite], [ProcessPurchaseOrderRead], [ProcessPurchaseOrderWrite], [ProcessReturnOrderRead], [ProcessReturnOrderWrite], [ProcessJobOrderRead], [ProcessJobOrderWrite], [ProcessBillOfMaterialsRead], [ProcessBillOfMaterialsWrite], [PageTypeRead], [PageTypeWrite]) VALUES (1, 1, N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True')
INSERT [dbo].[SiteAccess] ([SiteID], [TypeID], [CMSBasicRead], [CMSPagesRead], [InventoryRawMaterialsRead], [InventoryRawMaterialsWrite], [InventoryFinishedProductsRead], [InventoryFinishedProductsWrite], [ReportUserMasterListRead], [ReportCompanyMasterListRead], [ReportEmployeeMasterListRead], [ReportAgentMasterListRead], [ReportSupplierMasterListRead], [ReportFinishedProductsMasterListRead], [ReportRawMaterialsMasterListRead], [ReportBillOfMaterialsMasterListRead], [ReportSalesOrderListRead], [ReportPurchaseOrderListRead], [ReportReturnOrderListRead], [ReportStatementOfAccountsRead], [PageUserRead], [PageUserWrite], [PageCategoryRead], [PageCategoryWrite], [PageBrandRead], [PageBrandWrite], [PageTruckRead], [PageTruckWrite], [PageUOMRead], [PageUOMWrite], [PageSystemLogsRead], [PageUserLogsRead], [PageCompanyRead], [PageCompanyWrite], [PageAgentsRead], [PageAgentsWrite], [PageSupplierRead], [PageSupplierWrite], [PageRawMaterialsRead], [PageRawMaterialsWrite], [PageFinishedProductsRead], [PageFinishedProductsWrite], [PageEmployeeRead], [PageEmployeeWrite], [PagePayrollRead], [PagePayrollWrite], [PageContractRead], [PageContractWrite], [ProcessSalesOrderRead], [ProcessSalesOrderWrite], [ProcessPurchaseOrderRead], [ProcessPurchaseOrderWrite], [ProcessReturnOrderRead], [ProcessReturnOrderWrite], [ProcessJobOrderRead], [ProcessJobOrderWrite], [ProcessBillOfMaterialsRead], [ProcessBillOfMaterialsWrite], [PageTypeRead], [PageTypeWrite]) VALUES (2, 2, N'True', N'True', N'True', N'True', N'True', N'True', N'False', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True')
INSERT [dbo].[SiteAccess] ([SiteID], [TypeID], [CMSBasicRead], [CMSPagesRead], [InventoryRawMaterialsRead], [InventoryRawMaterialsWrite], [InventoryFinishedProductsRead], [InventoryFinishedProductsWrite], [ReportUserMasterListRead], [ReportCompanyMasterListRead], [ReportEmployeeMasterListRead], [ReportAgentMasterListRead], [ReportSupplierMasterListRead], [ReportFinishedProductsMasterListRead], [ReportRawMaterialsMasterListRead], [ReportBillOfMaterialsMasterListRead], [ReportSalesOrderListRead], [ReportPurchaseOrderListRead], [ReportReturnOrderListRead], [ReportStatementOfAccountsRead], [PageUserRead], [PageUserWrite], [PageCategoryRead], [PageCategoryWrite], [PageBrandRead], [PageBrandWrite], [PageTruckRead], [PageTruckWrite], [PageUOMRead], [PageUOMWrite], [PageSystemLogsRead], [PageUserLogsRead], [PageCompanyRead], [PageCompanyWrite], [PageAgentsRead], [PageAgentsWrite], [PageSupplierRead], [PageSupplierWrite], [PageRawMaterialsRead], [PageRawMaterialsWrite], [PageFinishedProductsRead], [PageFinishedProductsWrite], [PageEmployeeRead], [PageEmployeeWrite], [PagePayrollRead], [PagePayrollWrite], [PageContractRead], [PageContractWrite], [ProcessSalesOrderRead], [ProcessSalesOrderWrite], [ProcessPurchaseOrderRead], [ProcessPurchaseOrderWrite], [ProcessReturnOrderRead], [ProcessReturnOrderWrite], [ProcessJobOrderRead], [ProcessJobOrderWrite], [ProcessBillOfMaterialsRead], [ProcessBillOfMaterialsWrite], [PageTypeRead], [PageTypeWrite]) VALUES (3, 3, N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'true', N'true', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True')
INSERT [dbo].[SiteAccess] ([SiteID], [TypeID], [CMSBasicRead], [CMSPagesRead], [InventoryRawMaterialsRead], [InventoryRawMaterialsWrite], [InventoryFinishedProductsRead], [InventoryFinishedProductsWrite], [ReportUserMasterListRead], [ReportCompanyMasterListRead], [ReportEmployeeMasterListRead], [ReportAgentMasterListRead], [ReportSupplierMasterListRead], [ReportFinishedProductsMasterListRead], [ReportRawMaterialsMasterListRead], [ReportBillOfMaterialsMasterListRead], [ReportSalesOrderListRead], [ReportPurchaseOrderListRead], [ReportReturnOrderListRead], [ReportStatementOfAccountsRead], [PageUserRead], [PageUserWrite], [PageCategoryRead], [PageCategoryWrite], [PageBrandRead], [PageBrandWrite], [PageTruckRead], [PageTruckWrite], [PageUOMRead], [PageUOMWrite], [PageSystemLogsRead], [PageUserLogsRead], [PageCompanyRead], [PageCompanyWrite], [PageAgentsRead], [PageAgentsWrite], [PageSupplierRead], [PageSupplierWrite], [PageRawMaterialsRead], [PageRawMaterialsWrite], [PageFinishedProductsRead], [PageFinishedProductsWrite], [PageEmployeeRead], [PageEmployeeWrite], [PagePayrollRead], [PagePayrollWrite], [PageContractRead], [PageContractWrite], [ProcessSalesOrderRead], [ProcessSalesOrderWrite], [ProcessPurchaseOrderRead], [ProcessPurchaseOrderWrite], [ProcessReturnOrderRead], [ProcessReturnOrderWrite], [ProcessJobOrderRead], [ProcessJobOrderWrite], [ProcessBillOfMaterialsRead], [ProcessBillOfMaterialsWrite], [PageTypeRead], [PageTypeWrite]) VALUES (4, 4, N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True', N'True')
SET IDENTITY_INSERT [dbo].[SiteAccess] OFF
SET IDENTITY_INSERT [dbo].[StatementOfAccounts] ON 

INSERT [dbo].[StatementOfAccounts] ([SOAID], [SOID], [POID], [ORNumber], [Amount], [DateAdded]) VALUES (32, 1, NULL, N'', CAST(10.00 AS Decimal(18, 2)), CAST(N'2016-03-08 15:27:32.593' AS DateTime))
INSERT [dbo].[StatementOfAccounts] ([SOAID], [SOID], [POID], [ORNumber], [Amount], [DateAdded]) VALUES (33, 1, NULL, N'123123', CAST(20.00 AS Decimal(18, 2)), CAST(N'2016-03-08 15:28:09.713' AS DateTime))
SET IDENTITY_INSERT [dbo].[StatementOfAccounts] OFF
SET IDENTITY_INSERT [dbo].[SupplierContactPersons] ON 

INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (2, 3, N'Erica Chen', N'9F, 332 Chien-Kuo S. Road, Sec. 2 TAIPEI 106, TAIWAN', N'', N'8862-2362-2222', N'')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (4, 1, N'Kyou Hong Hwang', N'Hanyu Bldg., 1883, Nambusunhwan-Ro, Gwanak-Gu Seoul 151-849 Korea', N'', N'', N'822-2-22788951')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (5, 4, N'Abhinav Singh', N'Coromandel House, 1-2-10, S.P. Road Secunderabad - 500 003 INDIA', N'', N'+91 - 40 - 66997415', N'')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (6, 5, N'Anthony Tan', N'Lot 5, Persiaran Selangor, Seksyen 15, 40000 Shah Alam, Selangor Darul Ehsan', N'', N'', N'60355194022')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (7, 6, N'Barb Klunk', N'P.O. Box. 333, 120 Radio Road Hanover, Pennsylvania 17331 USA', N'', N'717-632-8921', N'')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (8, 7, N'', N'P.O.B. 60 Beer Sheva, 84100 ISRAEL', N'', N'', N'972-8-6296883')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (9, 8, N'Kevin Yan', N'9-12/Floor, Pufa Bldg., 21 Jiangxia St., Ningbo, 315000 P.R. China', N'', N'86-574-87263319', N'')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (10, 9, N'Chesie Mok', N'150 Beach Road No. 19-05 Gateway West SINGAPORE 189720', N'', N'', N'65-6671-4100')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (11, 10, N'N. Bhushan Mandava', N'PO Box 4321 Silver Spring, MD 20914 2265 Elements Ferry Road Suite 310 Charleston, SC, 29492', N'', N'301 562 - 7330', N'')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (13, 12, N'Jirawan Thanpramoon', N'31 soi, 138 (meesuk) Ladpraw Rd. Bangkapi Bangkok 10240 Thailand', N'', N'(662) 377-8668', N'')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (14, 11, N'Tapas Bhattacharjee', N'Uniphos House, Madhu Park, 11th Road Khar (W) Mumbai0400052 INDIA', N'', N'', N'+63 82 2824660')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (15, 2, N'Martin Searle', N'Suite 901A, Chinachem Golden Plaza, 77 Mody Road, Tsimshatsui East, Kowloon, Hongkong', N'', N'(852)27212257-8', N'')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (16, 13, N'Benson Ng', N'Blk 24 Sin Mig Lane #07-95 Midview City Singapore 573970', N'', N'', N'(65)67571530')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (17, 14, N'Arsteo Filipino', N'1-8-12, Harumi, Chuo-Ku, Tokyo, 104-6223 Japan', N'', N'', N'')
INSERT [dbo].[SupplierContactPersons] ([SCPID], [SupplierID], [SCPName], [SCPAddress], [SCPEmail], [SCPPhone], [SCPMobile]) VALUES (18, 15, N'Subendhu Gagguly', N'Centro UFFICI San Siro - Edificio D-Ala 3 Via Caldera, 21 - 20153 Milan', N'', N'', N'39-0240901-1')
SET IDENTITY_INSERT [dbo].[SupplierContactPersons] OFF
SET IDENTITY_INSERT [dbo].[SupplierProducts] ON 

INSERT [dbo].[SupplierProducts] ([SupplierProductID], [SupplierID], [RawID], [SPPurchasePrice], [SPStatus], [DateAdded], [DateModified], [SPMoneyType], [SPForeignValue]) VALUES (1, 7, 91, CAST(0.00 AS Decimal(18, 2)), N'Active', CAST(N'2016-02-16 14:04:48.830' AS DateTime), NULL, N'PHP', CAST(100.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[SupplierProducts] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (1, N'ZICOS CO., LTD.', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 15:24:58.067' AS DateTime), NULL, N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (2, N'AGRO ADVANCED INTERNATIONAL', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 15:30:24.103' AS DateTime), CAST(N'2016-02-15 16:05:35.833' AS DateTime), N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (3, N'PILARQUIM CORPORATION', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 15:43:16.237' AS DateTime), CAST(N'2016-02-15 16:06:30.310' AS DateTime), N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (4, N'COROMANDEL INTERNATIONAL LIMITED', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 15:48:51.403' AS DateTime), CAST(N'2016-02-15 16:07:59.997' AS DateTime), N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (5, N'ANCOM CROP CARE SDN BHD (148170-X)', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 15:50:17.803' AS DateTime), NULL, N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (6, N'MILLER CHEMICAL & FERTILIZER CORPORATION', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 15:51:43.533' AS DateTime), CAST(N'2016-02-15 15:53:42.520' AS DateTime), N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (7, N'ADAMA MAKHTESHIM LTD.', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 15:52:39.037' AS DateTime), CAST(N'2016-02-15 15:56:21.850' AS DateTime), N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (8, N'Ninhua Group Co., Ltd', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 15:57:22.173' AS DateTime), CAST(N'2016-02-15 15:57:36.733' AS DateTime), N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (9, N'SUMITOMO CHEMICAL (ASIA PACIFIC) PTE. LTD.', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 15:58:42.747' AS DateTime), CAST(N'2016-02-15 15:59:30.117' AS DateTime), N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (10, N'REPAR CORPORATION', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 16:00:43.857' AS DateTime), NULL, N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (11, N'UNITED PHOSPHORUS LTD.,', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 16:01:53.567' AS DateTime), NULL, N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (12, N'CHARLEE SQM (THAILAND) CO., LTD.', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 16:02:34.437' AS DateTime), CAST(N'2016-02-15 16:13:31.393' AS DateTime), N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (13, N'FERTIAGRO Pte. Ltd', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 16:06:05.297' AS DateTime), NULL, N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (14, N'SUMMIT AGRO INTERNATIONAL LTD.', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 16:07:35.743' AS DateTime), NULL, N'')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierCompany], [SupplierDescription], [SupplierRemark], [SupplierImage], [SupplierStatus], [DateAdded], [DateModified], [SupplierTIN]) VALUES (15, N'ISAGRO S.P.A. ', N'', N'', N'nophoto.png', N'Active', CAST(N'2016-02-15 16:10:36.747' AS DateTime), NULL, N'')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (1, N'Admin')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (2, N'Secretary')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (3, N'SuperAdmin')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (4, N'Operator')
SET IDENTITY_INSERT [dbo].[Types] OFF
SET IDENTITY_INSERT [dbo].[UOM] ON 

INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (1, N'100GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (2, N'100ML BOTTLE', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (3, N'100x60GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (4, N'10x100GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (5, N'10x12GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (6, N'10x1KG', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (7, N'10x1L', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (8, N'10x50GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (9, N'12GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (10, N'12x10x100GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (11, N'12x1KG', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (12, N'12x1L', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (13, N'12x4x250GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (14, N'12x5x200GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (15, N'144x60ML', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (16, N'16x3LBS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (17, N'1L BOTTLE', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (18, N'20 GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (19, N'200GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (20, N'20x10x12GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (21, N'20x500GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (22, N'20x500ML', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (23, N'240ML BOTTLE', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (24, N'24x100ML', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (25, N'24x10x50GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (26, N'24x1KG', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (27, N'24x250ML', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (28, N'24x500GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (29, N'24x500ML', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (30, N'24x5x100GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (31, N'250GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (32, N'250ML BOTTLE', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (33, N'3 LBS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (34, N'3.75L PL. GALLON', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (35, N'30GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (36, N'36x240ML', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (37, N'36x250ML', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (38, N'36X500ML', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (39, N'4L P. GALLON', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (40, N'4x250GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (41, N'500GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (42, N'500ML BOTTLE', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (43, N'50GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (44, N'5x100GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (45, N'5x200GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (46, N'60GMS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (47, N'60ML BOTTLE', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (48, N'6x3.75L', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (49, N'6x4L', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (50, N'72x100ML', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (51, N'Bx12x1KG', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (52, N'Bx16.7KG', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (53, N'Bx20KGS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (54, N'BX25KG', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (55, N'Dx180L', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (56, N'Dx200KGS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (57, N'DX200L', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (58, N'Dx220KGS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (59, N'Dx250KGS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (60, N'Dx50KGS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (61, N'Dx80KGS', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (62, N'Grams', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (63, N'KEG (Dx25KG)', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (64, N'KILO', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (65, N'LITER', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (66, N'Px20L', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (67, N'SET/S', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (68, N'UNASSIGNED', N'Active')
INSERT [dbo].[UOM] ([UOMID], [UOMName], [Status]) VALUES (69, N'UNIT / PC', N'Active')
SET IDENTITY_INSERT [dbo].[UOM] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [TypeID], [UserFirstName], [UserMiddleName], [UserLastName], [UserEmail], [UserImage], [UserName], [UserPassword], [UserAddress], [UserPhone], [UserMobile], [UserStatus], [DateAdded], [DateModified]) VALUES (1, 1, N'SCM', N'SCM', N'Admin', N'administrator@admin.com', N'3cde248c-0681-4e8a-ab5e-904b5980ced3.png', N'admin', N'NieQminDE4Ggcewn98nKl3Jhgq7Smn3dLlQ1MyLPswq7njpt8qwsIP4jQ2MR1nhWTQyNMFkwV19g4tPQSBhNeQ==', N'Multinational Village', N'7777', N'09247688876', N'Active', CAST(N'2015-08-28 00:00:00.000' AS DateTime), CAST(N'2016-02-09 14:28:44.580' AS DateTime))
INSERT [dbo].[Users] ([UserID], [TypeID], [UserFirstName], [UserMiddleName], [UserLastName], [UserEmail], [UserImage], [UserName], [UserPassword], [UserAddress], [UserPhone], [UserMobile], [UserStatus], [DateAdded], [DateModified]) VALUES (2, 3, N'Dev', N'Dev', N'Dev', N'superadmin@gmail.com', N'nophoto.png', N'super', N'NieQminDE4Ggcewn98nKl3Jhgq7Smn3dLlQ1MyLPswq7njpt8qwsIP4jQ2MR1nhWTQyNMFkwV19g4tPQSBhNeQ==', N'Multinational Village', N'7777', N'09247688876', N'Active', CAST(N'2015-08-28 00:00:00.000' AS DateTime), CAST(N'2015-09-10 09:53:42.660' AS DateTime))
INSERT [dbo].[Users] ([UserID], [TypeID], [UserFirstName], [UserMiddleName], [UserLastName], [UserEmail], [UserImage], [UserName], [UserPassword], [UserAddress], [UserPhone], [UserMobile], [UserStatus], [DateAdded], [DateModified]) VALUES (3, 2, N'Sec', N'Sec', N'Sec', N'123qhsejlq@sahjd.com', N'nophoto.png', N'Sec', N'NieQminDE4Ggcewn98nKl3Jhgq7Smn3dLlQ1MyLPswq7njpt8qwsIP4jQ2MR1nhWTQyNMFkwV19g4tPQSBhNeQ==', N'qhweqbwkn', N'h2iuehiu123', N'hqwheqoeqweq', N'Active', CAST(N'2015-10-05 15:21:39.890' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_SalesOrders] FOREIGN KEY([SOID])
REFERENCES [dbo].[SalesOrders] ([SOID])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_SalesOrders]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_Users]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_SalesOrders] FOREIGN KEY([SOID])
REFERENCES [dbo].[SalesOrders] ([SOID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_SalesOrders]
GO
ALTER TABLE [dbo].[PayrollDetails]  WITH CHECK ADD  CONSTRAINT [FK_PayrollDetails_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[PayrollDetails] CHECK CONSTRAINT [FK_PayrollDetails_Employees]
GO
ALTER TABLE [dbo].[ProductInventories]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventories_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductInventories] CHECK CONSTRAINT [FK_ProductInventories_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_PurhaseOrders] FOREIGN KEY([SupplierProductID])
REFERENCES [dbo].[SupplierProducts] ([SupplierProductID])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK_PurchaseOrderDetails_PurhaseOrders]
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_PurhaseOrder_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_PurhaseOrder_Suppliers]
GO
ALTER TABLE [dbo].[ReturnOrders]  WITH CHECK ADD  CONSTRAINT [FK_ReturnOrders_SalesOrders] FOREIGN KEY([SOID])
REFERENCES [dbo].[SalesOrders] ([SOID])
GO
ALTER TABLE [dbo].[ReturnOrders] CHECK CONSTRAINT [FK_ReturnOrders_SalesOrders]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_Customers]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_Employees] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agents] ([AgentID])
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_Employees]
GO
ALTER TABLE [dbo].[SupplierProducts]  WITH CHECK ADD  CONSTRAINT [FK_SupplierProducts_Suppliers1] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[SupplierProducts] CHECK CONSTRAINT [FK_SupplierProducts_Suppliers1]
GO
USE [master]
GO
ALTER DATABASE [SCM2] SET  READ_WRITE 
GO
