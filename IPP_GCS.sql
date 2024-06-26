USE [master]
GO
/****** Object:  Database [IPP_GCS]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE DATABASE [IPP_GCS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IPP_GCS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IPP_GCS.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IPP_GCS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IPP_GCS_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IPP_GCS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IPP_GCS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IPP_GCS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IPP_GCS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IPP_GCS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IPP_GCS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IPP_GCS] SET ARITHABORT OFF 
GO
ALTER DATABASE [IPP_GCS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IPP_GCS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IPP_GCS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IPP_GCS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IPP_GCS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IPP_GCS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IPP_GCS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IPP_GCS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IPP_GCS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IPP_GCS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IPP_GCS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IPP_GCS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IPP_GCS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IPP_GCS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IPP_GCS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IPP_GCS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IPP_GCS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IPP_GCS] SET RECOVERY FULL 
GO
ALTER DATABASE [IPP_GCS] SET  MULTI_USER 
GO
ALTER DATABASE [IPP_GCS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IPP_GCS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IPP_GCS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IPP_GCS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IPP_GCS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IPP_GCS', N'ON'
GO
ALTER DATABASE [IPP_GCS] SET QUERY_STORE = OFF
GO
USE [IPP_GCS]
GO
/****** Object:  User [VACGROUP\chi.ky]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE USER [VACGROUP\chi.ky] FOR LOGIN [VACGROUP\chi.ky] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [VACGROUP\chi.ky]
GO
ALTER ROLE [db_owner] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_datareader] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[IPP_VIOLATIONSUNIT]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_VIOLATIONSUNIT](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[BusinessLicense] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Telephone] [varchar](250) NULL,
	[Email] [varchar](max) NULL,
	[Geography] [nvarchar](250) NULL,
	[Note] [nvarchar](max) NULL,
	[SubTeamId] [uniqueidentifier] NULL,
	[IsFollow] [bit] NULL,
	[Representator] [nvarchar](250) NULL,
	[ContactPerson] [nvarchar](250) NULL,
	[Total] [int] NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[TypeId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_IPP_VIOLATIONSUNIT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_VIOLATIONSUNIT_RELATION]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_VIOLATIONSUNIT_RELATION](
	[Id] [uniqueidentifier] NOT NULL,
	[ChildID] [uniqueidentifier] NOT NULL,
	[ParentID] [uniqueidentifier] NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_VIOLATIONSUNIT_RELATION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_VIOLATION_RELATION]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_VIOLATION_RELATION]
AS
SELECT r.Id AS relation_id, o.Name, o.TypeId, o.Address, o.Telephone, r.ParentID, r.ChildID, r.create_time
FROM     dbo.IPP_VIOLATIONSUNIT AS u INNER JOIN
                  dbo.IPP_VIOLATIONSUNIT_RELATION AS r ON r.ParentID = u.Id INNER JOIN
                  dbo.IPP_VIOLATIONSUNIT AS o ON o.Id = r.ChildID
WHERE  (r.IsDelete = 0)
GO
/****** Object:  View [dbo].[V_CATE_COMPANY]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CATE_COMPANY]
AS
SELECT id, code, name
FROM   GCS_CATEGORY.dbo.cate_company
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[V_CATE_STATUS]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CATE_STATUS]
AS
SELECT Id, Name, Type, OrderNumber
FROM   GCS_CATEGORY.dbo.IPP_CATESTATUS
WHERE (IsDelete = 0)
GO
/****** Object:  View [dbo].[V_CONTENT_COMPANY]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CONTENT_COMPANY]
AS
SELECT id, company_id
FROM   GCS_CONTENT.dbo.ct_content_consolidate
GO
/****** Object:  View [dbo].[V_DELIVERY_LICENSE]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DELIVERY_LICENSE]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_delivery_license
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[V_PERMISSION_REVIEW]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PERMISSION_REVIEW]
AS
SELECT p.Id, p.CategoryBroadcastID, p.PersonReview, p.PersonCheck, p.IsDelete, d.name
FROM   GCS_CATEGORY.dbo.IPP_PERMISSIONREVIEW AS p INNER JOIN
             GCS_CATEGORY.dbo.cate_delivery_license AS d ON p.CategoryBroadcastID = d.id
WHERE (d.is_active = 1)
GO
/****** Object:  Table [dbo].[IPP_BROADCASTMETHOD]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_BROADCASTMETHOD](
	[Id] [varchar](50) NOT NULL,
	[BroadcastMethod] [nvarchar](100) NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_BROADCASTMETHOD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_DOCUMENTS]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_DOCUMENTS](
	[Id] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_IPP_DOCUMENTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_EMAIL_CONFIG]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_EMAIL_CONFIG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Display] [nvarchar](max) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_IPP_EMAIL_CONFIG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_EMAILS_REPLY]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_EMAILS_REPLY](
	[Id] [uniqueidentifier] NOT NULL,
	[EmailId] [uniqueidentifier] NOT NULL,
	[Body] [nvarchar](max) NULL,
	[DateReceived] [datetime] NULL,
	[EmailSend] [nvarchar](max) NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_IPP_EMAILS_REPLY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_INFORMATION_IP]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_INFORMATION_IP](
	[Id] [uniqueidentifier] NOT NULL,
	[ProcessRequestId] [uniqueidentifier] NULL,
	[Delivery_License_Id] [int] NULL,
	[Links] [nvarchar](max) NULL,
	[CateStatus_Id] [int] NULL,
	[Result_Id] [int] NULL,
	[Person_Check] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDelete] [bit] NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](100) NULL,
	[updated_date] [datetime] NULL,
	[updated_by] [nvarchar](100) NULL,
 CONSTRAINT [PK_IPP_INFORMATION_IP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_INFORMATIONBROADCAST]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_INFORMATIONBROADCAST](
	[Id] [uniqueidentifier] NOT NULL,
	[BroadcastId] [uniqueidentifier] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[ProcessRequestId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IPP_BROADCAST] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_INFORMATIONLICENSE]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_INFORMATIONLICENSE](
	[Id] [uniqueidentifier] NOT NULL,
	[delivery_license_id] [int] NOT NULL,
	[is_free] [bit] NOT NULL,
	[exclusive_start_date] [datetime] NULL,
	[exclusive_end_date] [datetime] NULL,
	[non_exclusive_start_date] [datetime] NULL,
	[non_exclusive_end_date] [datetime] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[ProcessRequestId] [uniqueidentifier] NOT NULL,
	[SumaryRightsDetailId] [uniqueidentifier] NULL,
	[IsDelete] [bit] NOT NULL,
	[content_id] [nvarchar](max) NULL,
	[company_id] [int] NULL,
	[run] [int] NULL,
	[is_all_channel] [bit] NULL,
	[channel_rights] [nvarchar](max) NULL,
 CONSTRAINT [PK_IPP_INFORMATIONLICENSE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_INFORMATIONMECHANDISE]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_INFORMATIONMECHANDISE](
	[Id] [uniqueidentifier] NOT NULL,
	[MechandiseId] [bigint] NULL,
	[MechandiseName] [nvarchar](max) NULL,
	[Owner] [nvarchar](max) NULL,
	[Source] [nvarchar](50) NULL,
	[CopyrightMaterial] [nvarchar](max) NULL,
	[NumCertificate] [nvarchar](max) NULL,
	[create_by] [nvarchar](50) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](50) NULL,
	[update_time] [datetime] NULL,
	[ProcessRequestId] [uniqueidentifier] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[delivery_license_id] [int] NOT NULL,
 CONSTRAINT [PK_IPP_INFORMATIONMECHANDISE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_INFORMATIONSELL]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_INFORMATIONSELL](
	[Id] [uniqueidentifier] NOT NULL,
	[Program] [nvarchar](250) NOT NULL,
	[CategoryBroadcast] [nvarchar](50) NOT NULL,
	[ChanelBuy] [nvarchar](50) NOT NULL,
	[Payment] [varchar](20) NOT NULL,
	[StartDate_DQ] [datetime] NOT NULL,
	[DateCheck_DQ] [datetime] NOT NULL,
	[StartDate_NOTDQ] [datetime] NOT NULL,
	[DateCheck_NOTDQ] [datetime] NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[ProcessRequestId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_LICENSEMECHANDISE]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_LICENSEMECHANDISE](
	[Id] [nchar](10) NOT NULL,
	[IntellectualProperty] [nvarchar](250) NOT NULL,
	[OwnerNow] [varchar](50) NOT NULL,
	[Source] [nvarchar](100) NOT NULL,
	[DocumentLIC] [nvarchar](100) NOT NULL,
	[NumOfCert] [nvarchar](100) NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[ProcessRequestId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_PROCESSREQUEST]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_PROCESSREQUEST](
	[Id] [uniqueidentifier] NOT NULL,
	[CodeRequest] [varchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RequestTypeId] [varchar](50) NULL,
	[SeverityId] [varchar](50) NULL,
	[JobCategory] [nvarchar](50) NULL,
	[Content] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[RequestApprove_by] [nvarchar](50) NULL,
	[ApproveMessage] [nvarchar](250) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[EvidenceViolation] [nvarchar](max) NULL,
	[ViolationsUnitId] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
	[StatusId] [int] NULL,
	[ContentName] [nvarchar](max) NULL,
	[ViolationsUnitName] [nvarchar](max) NULL,
	[DeliveryLicenseId] [int] NULL,
	[PriorityId] [int] NULL,
 CONSTRAINT [PK_IPP_PROCESSREQUEST] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_PROCESSREQUEST_DOCUMENT]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_PROCESSREQUEST_DOCUMENT](
	[Id] [uniqueidentifier] NOT NULL,
	[CodeRequest] [nvarchar](max) NOT NULL,
	[SeverityId] [varchar](50) NULL,
	[ViolationDesc] [nvarchar](250) NULL,
	[ViolationsUnitId] [uniqueidentifier] NULL,
	[Note] [nvarchar](max) NULL,
	[RequestApprove_by] [nvarchar](100) NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[ApproveMessage] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[StatusId] [int] NULL,
	[ViolationsUnitName] [nvarchar](max) NULL,
	[DeliveryLicenseId] [int] NULL,
	[RequestTypeId] [varchar](50) NULL,
	[PriorityId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_PROCESSREQUEST_IP]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_PROCESSREQUEST_IP](
	[Id] [uniqueidentifier] NOT NULL,
	[CodeRequest] [nvarchar](100) NULL,
	[Name] [nvarchar](max) NULL,
	[Type_Ip] [nvarchar](100) NULL,
	[Owner_Ip] [nvarchar](100) NULL,
	[Dept_Manage] [nvarchar](100) NULL,
	[Violation_Time] [datetime] NULL,
	[Priority_Id] [nvarchar](50) NULL,
	[Status_Id] [int] NULL,
	[RequestTypeId] [nvarchar](50) NULL,
	[RequestApprove_by] [nvarchar](200) NULL,
	[ApproveMessage] [nvarchar](200) NULL,
	[IsDelete] [bit] NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](200) NULL,
	[updated_date] [datetime] NULL,
	[updated_by] [nvarchar](200) NULL,
 CONSTRAINT [PK_IPP_PROCESSREQUEST_IP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_REQUESTTYPE]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_REQUESTTYPE](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsDelete] [bit] NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_REQUESTTYPE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_SEVERITY]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_SEVERITY](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[OrderNumber] [int] NULL,
 CONSTRAINT [PK_IPP_PRIORITY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_SEVERITYJOBS]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_SEVERITYJOBS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[SeverityId] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_IPP_PRIORITYJOBS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_STATUS]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_STATUS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [varchar](max) NULL,
	[RequestID] [uniqueidentifier] NULL,
	[DeliveryLicenseID] [int] NULL,
	[Performer] [nvarchar](100) NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[StatusId] [int] NULL,
	[IsDocumentRequest] [bit] NULL,
	[Comment] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[PersonCheck] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_COMPLAIN]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_COMPLAIN](
	[Id] [uniqueidentifier] NOT NULL,
	[URLViolationId] [uniqueidentifier] NULL,
	[DateComplain] [datetime] NULL,
	[FormatSent] [nvarchar](50) NULL,
	[OrganComplain] [nvarchar](100) NULL,
	[StatusId] [int] NULL,
	[ResultComplain] [nvarchar](100) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[TaskId] [uniqueidentifier] NULL,
	[FileDocument] [nvarchar](max) NULL,
 CONSTRAINT [PK_IPP_TASK_COMPLAIN] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_COMPLAIN_BK]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_COMPLAIN_BK](
	[Id] [uniqueidentifier] NOT NULL,
	[ViolationUnit] [nvarchar](100) NOT NULL,
	[BroadcastName] [nvarchar](100) NOT NULL,
	[URLViolation] [nvarchar](250) NOT NULL,
	[DateConplain] [datetime] NOT NULL,
	[FileDocument] [image] NOT NULL,
	[FormatSent] [nvarchar](50) NOT NULL,
	[OrganComplain] [nvarchar](100) NOT NULL,
	[StatusComplain] [bit] NOT NULL,
	[ResaultConplain] [nvarchar](100) NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_CONTACTVIOLATIONUNIT]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_CONTACTVIOLATIONUNIT](
	[Id] [uniqueidentifier] NOT NULL,
	[ContactForm] [nvarchar](100) NULL,
	[EmailSender] [nvarchar](100) NULL,
	[EmailReceive] [nvarchar](100) NULL,
	[SubjectMail] [nvarchar](250) NULL,
	[DiscussContent] [nvarchar](max) NULL,
	[DateContact] [datetime] NULL,
	[DateResponse] [datetime] NULL,
	[StatusId] [int] NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[TaskId] [uniqueidentifier] NULL,
	[URLViolationId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_IPP_TASK_CONTACTVIOLATIONUNIT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_CONTACTVIOLATIONUNIT_BK]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_CONTACTVIOLATIONUNIT_BK](
	[Id] [uniqueidentifier] NOT NULL,
	[ContactForm] [nvarchar](100) NOT NULL,
	[EmailSender] [varchar](100) NOT NULL,
	[EmailReceive] [nchar](10) NOT NULL,
	[SubjectMail] [nvarchar](250) NOT NULL,
	[DiscussContent] [text] NOT NULL,
	[ViolationUnit] [nvarchar](100) NOT NULL,
	[BroadcastName] [nvarchar](100) NOT NULL,
	[DateContact] [datetime] NOT NULL,
	[DateResponse] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_CREATEDOCUMENT]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_CREATEDOCUMENT](
	[Id] [uniqueidentifier] NOT NULL,
	[URLViolationStatusId] [int] NULL,
	[ContentCreateViolation] [nvarchar](250) NULL,
	[CreateDateViolation] [datetime] NULL,
	[ContractNo] [varchar](100) NULL,
	[Price] [float] NULL,
	[NumOfDocument] [nchar](10) NULL,
	[StatusId] [int] NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[TaskId] [uniqueidentifier] NULL,
	[URLViolationId] [uniqueidentifier] NULL,
	[ViolationUnitBroadcastId] [nvarchar](max) NULL,
 CONSTRAINT [PK_IPP_TASK_CREATEDOCUMENT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_CREATEDOCUMENT_BK]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_CREATEDOCUMENT_BK](
	[Id] [uniqueidentifier] NOT NULL,
	[ViolationUnit] [nvarchar](100) NOT NULL,
	[BroadcastName] [nvarchar](100) NOT NULL,
	[URLViolation] [nvarchar](250) NOT NULL,
	[URLViolationStatus] [bit] NOT NULL,
	[ContentCreateViolation] [nvarchar](250) NOT NULL,
	[CreateDateViolation] [datetime] NOT NULL,
	[ContractNumber] [varchar](100) NOT NULL,
	[Price] [float] NOT NULL,
	[NumOfDocument] [nchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_EMAILLOGS]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_EMAILLOGS](
	[Id] [uniqueidentifier] NOT NULL,
	[TaskId] [uniqueidentifier] NULL,
	[Code] [bigint] NULL,
	[NoEmail] [int] NULL,
	[Subject] [nvarchar](250) NULL,
	[Body] [nvarchar](max) NULL,
	[Receiver] [nvarchar](100) NULL,
	[TemplateId] [uniqueidentifier] NULL,
	[StatusId] [int] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[URLViolationId] [uniqueidentifier] NULL,
	[ViolationUnitBroadcastIds] [nvarchar](max) NULL,
	[CompanySendId] [int] NULL,
	[EmailSend] [nvarchar](max) NULL,
	[IsDelete] [bit] NOT NULL,
	[ViolationsUnitId] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_EPISODEVIOLATION]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_EPISODEVIOLATION](
	[Id] [uniqueidentifier] NOT NULL,
	[EpisodeNumber] [nvarchar](100) NULL,
	[LinkBroadcast] [nvarchar](max) NULL,
	[LinkServer] [nvarchar](max) NULL,
	[UserUpload] [nvarchar](max) NULL,
	[ShortLink] [nvarchar](max) NULL,
	[DateReport] [datetime] NULL,
	[StatusId] [int] NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[ParentURLViolationId] [uniqueidentifier] NULL,
	[TaskId] [uniqueidentifier] NULL,
	[UserReport] [nvarchar](50) NULL,
 CONSTRAINT [PK_IPP_TASK_EPISODEVIOLATION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_REPORTDELETESOURCEVIDEO]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_REPORTDELETESOURCEVIDEO](
	[Id] [uniqueidentifier] NOT NULL,
	[UserReport] [nvarchar](max) NULL,
	[ShortLink] [nvarchar](max) NULL,
	[ViolationLink] [nvarchar](max) NULL,
	[Template] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
	[StatusId] [int] NULL,
	[URLViolationId] [uniqueidentifier] NULL,
	[EpisodeViolationId] [uniqueidentifier] NULL,
	[TaskId] [uniqueidentifier] NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_TASK_REPORTDELETESOURCEVIDEO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_REPORTDELETESOURCEVIDEO_BK]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_REPORTDELETESOURCEVIDEO_BK](
	[Id] [uniqueidentifier] NOT NULL,
	[URLViolation] [nvarchar](max) NULL,
	[Episode] [int] NULL,
	[Source] [nvarchar](100) NULL,
	[ViolationLink] [nvarchar](max) NULL,
	[ShortLink] [nvarchar](max) NULL,
	[ViolationUnitBroadcastId] [uniqueidentifier] NULL,
	[LinkChannel] [nvarchar](max) NULL,
	[UserReport] [nvarchar](max) NULL,
	[Template] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
	[StatusId] [int] NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[ViolationUnitBroadcastName] [nvarchar](max) NULL,
	[ViolationContentId] [varchar](100) NULL,
	[TaskId] [uniqueidentifier] NULL,
	[ChannelName] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_REPORTDMCA]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_REPORTDMCA](
	[Id] [uniqueidentifier] NOT NULL,
	[DateReport] [datetime] NULL,
	[IdReport] [nvarchar](100) NULL,
	[TemplateReport] [nvarchar](max) NULL,
	[AccountReport] [nvarchar](100) NULL,
	[ReportStatusId] [int] NULL,
	[LinkViolationStatusId] [int] NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[TaskId] [uniqueidentifier] NULL,
	[URLViolationId] [uniqueidentifier] NULL,
	[EpisodeViolationId] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_SENDCV]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_SENDCV](
	[Id] [uniqueidentifier] NOT NULL,
	[EmailSender] [varchar](100) NULL,
	[EmailReceive] [varchar](100) NULL,
	[SubjectMail] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[Code] [varchar](50) NULL,
	[Object] [nvarchar](100) NULL,
	[URLViolationId] [uniqueidentifier] NULL,
	[DateSent] [datetime] NULL,
	[DateResponse] [datetime] NULL,
	[StatusId] [int] NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[TaskId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_IPP_TASK_SENDCV] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_SENDCV_BK]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_SENDCV_BK](
	[Id] [uniqueidentifier] NOT NULL,
	[EmailSender] [varchar](100) NOT NULL,
	[EmailReceive] [varchar](100) NOT NULL,
	[SubjectMail] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Object] [nvarchar](100) NOT NULL,
	[BroadcastName] [nvarchar](100) NOT NULL,
	[DateSent] [datetime] NOT NULL,
	[DateResponse] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_SUE]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_SUE](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanySue] [nvarchar](100) NULL,
	[URLViolationId] [uniqueidentifier] NULL,
	[DateSue] [datetime] NULL,
	[ToaAnThuLy] [nvarchar](100) NULL,
	[StatusId] [int] NULL,
	[ResultSue] [nvarchar](20) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[TaskId] [uniqueidentifier] NULL,
	[FileDocument] [nvarchar](max) NULL,
 CONSTRAINT [PK_IPP_TASK_SUE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_SUE_BK]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_SUE_BK](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanySue] [nvarchar](100) NOT NULL,
	[ViolationUnit] [nvarchar](100) NOT NULL,
	[BroadcastName] [nvarchar](100) NOT NULL,
	[DateSue] [datetime] NOT NULL,
	[FileDocument] [image] NOT NULL,
	[ToaAnThuLy] [nvarchar](20) NOT NULL,
	[StatusSue] [bit] NOT NULL,
	[ResaultSue] [nvarchar](20) NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TASK_URLVIOLATION]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TASK_URLVIOLATION](
	[Id] [uniqueidentifier] NOT NULL,
	[URLViolation] [nvarchar](250) NULL,
	[ViolationUnitId] [uniqueidentifier] NULL,
	[StatusId] [int] NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NOT NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[ViolationUnitBroadcastId] [uniqueidentifier] NULL,
	[ViolationUnitBroadcastName] [nvarchar](max) NULL,
	[IppLicenseContentId] [uniqueidentifier] NULL,
	[TaskId] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_VIOLATIONSUNIT_BROADCAST]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_VIOLATIONSUNIT_BROADCAST](
	[Id] [uniqueidentifier] NOT NULL,
	[BroadcastName] [nvarchar](100) NULL,
	[BroadcastDetail] [nvarchar](250) NULL,
	[Count] [int] NULL,
	[TypeOfCount] [varchar](20) NULL,
	[RatingVN] [varchar](20) NULL,
	[BroadcastMethodID] [int] NULL,
	[Total] [int] NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[ViolationsUnitID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_VIOLATIONSUNIT_TEMPETL]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_VIOLATIONSUNIT_TEMPETL](
	[Name] [nvarchar](200) NULL,
	[BusinessLicense] [varchar](250) NULL,
	[Address] [nvarchar](max) NULL,
	[Telephone] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[Geography] [nvarchar](250) NULL,
	[Note] [nvarchar](max) NULL,
	[SubTeamId] [uniqueidentifier] NULL,
	[IsFollow] [bit] NULL,
	[Representator] [nvarchar](250) NULL,
	[ContactPerson] [nvarchar](250) NULL,
	[Total] [int] NULL,
	[IsDelete] [bit] NULL,
	[create_by] [nvarchar](250) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](250) NULL,
	[update_time] [datetime] NULL,
	[TypeId] [int] NULL,
	[TypeName] [nvarchar](250) NULL,
	[Id] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session_action]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session_action](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](100) NOT NULL,
	[function_id] [varchar](100) NULL,
	[action] [varchar](50) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_session_action] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:18:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IPP_VIOLATIONSUNIT] ADD  CONSTRAINT [DF_IPP_VIOLATIONSUNIT_IsFollow]  DEFAULT ((0)) FOR [IsFollow]
GO
ALTER TABLE [dbo].[IPP_VIOLATIONSUNIT] ADD  CONSTRAINT [DF_IPP_VIOLATIONSUNIT_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[IPP_VIOLATIONSUNIT_TEMPETL] ADD  CONSTRAINT [DF_IPP_VIOLATIONSUNIT_TEMPETL_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[IPP_INFORMATION_IP]  WITH CHECK ADD  CONSTRAINT [FK_IPP_INFORMATION_IP_IPP_PROCESSREQUEST_IP] FOREIGN KEY([ProcessRequestId])
REFERENCES [dbo].[IPP_PROCESSREQUEST_IP] ([Id])
GO
ALTER TABLE [dbo].[IPP_INFORMATION_IP] CHECK CONSTRAINT [FK_IPP_INFORMATION_IP_IPP_PROCESSREQUEST_IP]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "cate_company (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CATE_COMPANY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CATE_COMPANY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "IPP_CATESTATUS (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CATE_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CATE_STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ct_content_consolidate (GCS_CONTENT.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 320
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CONTENT_COMPANY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CONTENT_COMPANY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "cate_delivery_license (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DELIVERY_LICENSE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DELIVERY_LICENSE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 329
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 9
               Left = 386
               Bottom = 206
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PERMISSION_REVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PERMISSION_REVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "u"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 7
               Left = 294
               Bottom = 170
               Right = 488
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 7
               Left = 536
               Bottom = 170
               Right = 734
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 3156
         Width = 2976
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_VIOLATION_RELATION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_VIOLATION_RELATION'
GO
USE [master]
GO
ALTER DATABASE [IPP_GCS] SET  READ_WRITE 
GO
