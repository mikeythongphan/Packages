USE [master]
GO
/****** Object:  Database [SPM_GCS]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE DATABASE [SPM_GCS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SPM_GCS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SPM_GCS.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SPM_GCS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SPM_GCS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SPM_GCS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SPM_GCS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SPM_GCS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SPM_GCS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SPM_GCS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SPM_GCS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SPM_GCS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SPM_GCS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SPM_GCS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SPM_GCS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SPM_GCS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SPM_GCS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SPM_GCS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SPM_GCS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SPM_GCS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SPM_GCS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SPM_GCS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SPM_GCS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SPM_GCS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SPM_GCS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SPM_GCS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SPM_GCS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SPM_GCS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SPM_GCS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SPM_GCS] SET RECOVERY FULL 
GO
ALTER DATABASE [SPM_GCS] SET  MULTI_USER 
GO
ALTER DATABASE [SPM_GCS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SPM_GCS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SPM_GCS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SPM_GCS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SPM_GCS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SPM_GCS', N'ON'
GO
ALTER DATABASE [SPM_GCS] SET QUERY_STORE = OFF
GO
USE [SPM_GCS]
GO
/****** Object:  User [usr_bi_team]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE USER [usr_bi_team] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usr_bi_team]
GO
ALTER ROLE [db_owner] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  View [dbo].[v_cate_channel]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_channel]
AS
SELECT id, id_cate_platform, External_channel_ID
FROM   GCS_CATEGORY.dbo.cate_channel
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_company]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_company]
AS
SELECT id, code, name
FROM   GCS_CATEGORY.dbo.cate_company
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_user_manager]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE VIEW [dbo].[v_user_manager] as
                SELECT m.id, m.username, m.line_manager, u.is_admin, u.is_bom, u.is_viewall
                FROM   GCS_USERS.dbo.auth_user_manager AS m INNER JOIN
                GCS_USERS.dbo.auth_user AS u ON m.username = u.username
                            
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[activity]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Contact] [int] NULL,
	[Outcome] [nvarchar](max) NULL,
	[ChannelContact] [int] NULL,
	[DealSponsorId] [uniqueidentifier] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[ActualSaleId] [uniqueidentifier] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actual_detail_package]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actual_detail_package](
	[Id] [uniqueidentifier] NOT NULL,
	[ActualSalePackageId] [uniqueidentifier] NOT NULL,
	[SponsorDetailPackageId] [uniqueidentifier] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [float] NULL,
	[Priority] [int] NULL,
	[ChannelType] [nvarchar](max) NULL,
	[Platform] [nvarchar](max) NULL,
	[VideoType] [nvarchar](max) NULL,
	[PIC] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[ChannelIds] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[TotalEpisode] [int] NULL,
	[PlatformIds] [nvarchar](max) NULL,
 CONSTRAINT [PK_actual_detail_package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actual_sale]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actual_sale](
	[Id] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[TotalPrice] [float] NULL,
	[Priority] [int] NULL,
	[Remark] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[DealSponsorId] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_actual_sale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actual_sale_campaign]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actual_sale_campaign](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalPrice] [float] NULL,
	[Notes] [nvarchar](max) NULL,
	[ActualSaleId] [uniqueidentifier] NOT NULL,
	[SponsorCampaignId] [uniqueidentifier] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_actual_sale_campaign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actual_sale_package]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actual_sale_package](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalPrice] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[ActualSaleCampaignId] [uniqueidentifier] NOT NULL,
	[SponsorPackageId] [uniqueidentifier] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_actual_sale_package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actual_sale_status]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actual_sale_status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_actual_sale_status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campaign_package]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campaign_package](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[TotalPrice] [float] NULL,
	[CampaignSaleId] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_campaign_package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campaign_sale]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campaign_sale](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ContentId] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Status] [int] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[Notes] [nvarchar](max) NULL,
	[TotalPrice] [float] NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_campaign_sale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deal_product_detail]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deal_product_detail](
	[Id] [uniqueidentifier] NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[DealSponsorId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[Commit] [nvarchar](max) NULL,
	[ChannelIds] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[TotalEpisode] [int] NULL,
	[PlatformIds] [nvarchar](max) NULL,
 CONSTRAINT [PK_deal_product_detail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deal_sponsor]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deal_sponsor](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[VendorId] [int] NULL,
	[BrandId] [int] NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[TotalPrice] [float] NULL,
	[SaleProcess] [int] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[Type] [int] NOT NULL,
	[company_id] [int] NULL,
	[numericalorder_year] [int] NULL,
	[Code] [nvarchar](max) NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_deal_sponsor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deal_team]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deal_team](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Fullname] [nvarchar](max) NULL,
	[DealSponsorId] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_deal_team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_campaign_package]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_campaign_package](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[CampaignPackageId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_detail_campaign_package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[UnitOfMeasure] [int] NULL,
	[Price] [float] NULL,
	[AvailableMarketing] [bit] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[ProductCategoryId] [uniqueidentifier] NULL,
	[ProductSubCategoryId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_category](
	[Id] [uniqueidentifier] NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_product_category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_sub_category]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_sub_category](
	[Id] [uniqueidentifier] NOT NULL,
	[SubCategoryName] [nvarchar](max) NULL,
	[ProductCategoryId] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_product_sub_category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale_process]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale_process](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[StepNumber] [int] NOT NULL,
	[Color] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_sale_process] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale_process_history]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale_process_history](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SaleProcessId] [int] NOT NULL,
	[DealSponsorId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsCurrent] [bit] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_sale_process_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPM_history]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPM_history](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Entity] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[action] [nvarchar](max) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[ContentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_SPM_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sponsor_campaign]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sponsor_campaign](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalPrice] [float] NULL,
	[CampaignSaleId] [uniqueidentifier] NOT NULL,
	[DealSponsorId] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_sponsor_campaign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sponsor_detail_package]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sponsor_detail_package](
	[Id] [uniqueidentifier] NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [float] NULL,
	[SponsorPackageId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[DetailCampaignPackageId] [uniqueidentifier] NULL,
	[Description] [nvarchar](max) NULL,
	[Commit] [nvarchar](max) NULL,
	[ChannelIds] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[TotalEpisode] [int] NULL,
	[PlatformIds] [nvarchar](max) NULL,
 CONSTRAINT [PK_sponsor_detail_package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sponsor_package]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sponsor_package](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalPrice] [float] NULL,
	[SponsorCampaignId] [uniqueidentifier] NULL,
	[CampaignPackageId] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_sponsor_package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Index [IX_activity_ActualSaleId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_activity_ActualSaleId] ON [dbo].[activity]
(
	[ActualSaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_activity_DealSponsorId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_activity_DealSponsorId] ON [dbo].[activity]
(
	[DealSponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_actual_detail_package_ActualSalePackageId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_actual_detail_package_ActualSalePackageId] ON [dbo].[actual_detail_package]
(
	[ActualSalePackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_actual_detail_package_SponsorDetailPackageId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_actual_detail_package_SponsorDetailPackageId] ON [dbo].[actual_detail_package]
(
	[SponsorDetailPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_actual_sale_DealSponsorId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_actual_sale_DealSponsorId] ON [dbo].[actual_sale]
(
	[DealSponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_actual_sale_campaign_ActualSaleId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_actual_sale_campaign_ActualSaleId] ON [dbo].[actual_sale_campaign]
(
	[ActualSaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_actual_sale_campaign_SponsorCampaignId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_actual_sale_campaign_SponsorCampaignId] ON [dbo].[actual_sale_campaign]
(
	[SponsorCampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_actual_sale_package_ActualSaleCampaignId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_actual_sale_package_ActualSaleCampaignId] ON [dbo].[actual_sale_package]
(
	[ActualSaleCampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_actual_sale_package_SponsorPackageId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_actual_sale_package_SponsorPackageId] ON [dbo].[actual_sale_package]
(
	[SponsorPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_campaign_package_CampaignSaleId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_campaign_package_CampaignSaleId] ON [dbo].[campaign_package]
(
	[CampaignSaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_deal_product_detail_DealSponsorId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_deal_product_detail_DealSponsorId] ON [dbo].[deal_product_detail]
(
	[DealSponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_deal_product_detail_ProductId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_deal_product_detail_ProductId] ON [dbo].[deal_product_detail]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_deal_team_DealSponsorId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_deal_team_DealSponsorId] ON [dbo].[deal_team]
(
	[DealSponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_detail_campaign_package_CampaignPackageId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_detail_campaign_package_CampaignPackageId] ON [dbo].[detail_campaign_package]
(
	[CampaignPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_detail_campaign_package_ProductId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_detail_campaign_package_ProductId] ON [dbo].[detail_campaign_package]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_product_ProductCategoryId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_product_ProductCategoryId] ON [dbo].[product]
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_product_ProductSubCategoryId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_product_ProductSubCategoryId] ON [dbo].[product]
(
	[ProductSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_product_sub_category_ProductCategoryId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_product_sub_category_ProductCategoryId] ON [dbo].[product_sub_category]
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sale_process_history_DealSponsorId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_sale_process_history_DealSponsorId] ON [dbo].[sale_process_history]
(
	[DealSponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sale_process_history_SaleProcessId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_sale_process_history_SaleProcessId] ON [dbo].[sale_process_history]
(
	[SaleProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sponsor_campaign_CampaignSaleId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_sponsor_campaign_CampaignSaleId] ON [dbo].[sponsor_campaign]
(
	[CampaignSaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sponsor_campaign_DealSponsorId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_sponsor_campaign_DealSponsorId] ON [dbo].[sponsor_campaign]
(
	[DealSponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sponsor_detail_package_DetailCampaignPackageId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_sponsor_detail_package_DetailCampaignPackageId] ON [dbo].[sponsor_detail_package]
(
	[DetailCampaignPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sponsor_detail_package_ProductId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_sponsor_detail_package_ProductId] ON [dbo].[sponsor_detail_package]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sponsor_detail_package_SponsorPackageId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_sponsor_detail_package_SponsorPackageId] ON [dbo].[sponsor_detail_package]
(
	[SponsorPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sponsor_package_CampaignPackageId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_sponsor_package_CampaignPackageId] ON [dbo].[sponsor_package]
(
	[CampaignPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sponsor_package_SponsorCampaignId]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_sponsor_package_SponsorCampaignId] ON [dbo].[sponsor_package]
(
	[SponsorCampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:27:16 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:27:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[deal_sponsor] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[activity]  WITH CHECK ADD  CONSTRAINT [FK_activity_actual_sale_ActualSaleId] FOREIGN KEY([ActualSaleId])
REFERENCES [dbo].[actual_sale] ([Id])
GO
ALTER TABLE [dbo].[activity] CHECK CONSTRAINT [FK_activity_actual_sale_ActualSaleId]
GO
ALTER TABLE [dbo].[activity]  WITH CHECK ADD  CONSTRAINT [FK_activity_deal_sponsor_DealSponsorId] FOREIGN KEY([DealSponsorId])
REFERENCES [dbo].[deal_sponsor] ([Id])
GO
ALTER TABLE [dbo].[activity] CHECK CONSTRAINT [FK_activity_deal_sponsor_DealSponsorId]
GO
ALTER TABLE [dbo].[actual_detail_package]  WITH CHECK ADD  CONSTRAINT [FK_actual_detail_package_actual_sale_package_ActualSalePackageId] FOREIGN KEY([ActualSalePackageId])
REFERENCES [dbo].[actual_sale_package] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[actual_detail_package] CHECK CONSTRAINT [FK_actual_detail_package_actual_sale_package_ActualSalePackageId]
GO
ALTER TABLE [dbo].[actual_detail_package]  WITH CHECK ADD  CONSTRAINT [FK_actual_detail_package_sponsor_detail_package_SponsorDetailPackageId] FOREIGN KEY([SponsorDetailPackageId])
REFERENCES [dbo].[sponsor_detail_package] ([Id])
GO
ALTER TABLE [dbo].[actual_detail_package] CHECK CONSTRAINT [FK_actual_detail_package_sponsor_detail_package_SponsorDetailPackageId]
GO
ALTER TABLE [dbo].[actual_sale]  WITH CHECK ADD  CONSTRAINT [FK_actual_sale_deal_sponsor_DealSponsorId] FOREIGN KEY([DealSponsorId])
REFERENCES [dbo].[deal_sponsor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[actual_sale] CHECK CONSTRAINT [FK_actual_sale_deal_sponsor_DealSponsorId]
GO
ALTER TABLE [dbo].[actual_sale_campaign]  WITH CHECK ADD  CONSTRAINT [FK_actual_sale_campaign_actual_sale_ActualSaleId] FOREIGN KEY([ActualSaleId])
REFERENCES [dbo].[actual_sale] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[actual_sale_campaign] CHECK CONSTRAINT [FK_actual_sale_campaign_actual_sale_ActualSaleId]
GO
ALTER TABLE [dbo].[actual_sale_campaign]  WITH CHECK ADD  CONSTRAINT [FK_actual_sale_campaign_sponsor_campaign_SponsorCampaignId] FOREIGN KEY([SponsorCampaignId])
REFERENCES [dbo].[sponsor_campaign] ([Id])
GO
ALTER TABLE [dbo].[actual_sale_campaign] CHECK CONSTRAINT [FK_actual_sale_campaign_sponsor_campaign_SponsorCampaignId]
GO
ALTER TABLE [dbo].[actual_sale_package]  WITH CHECK ADD  CONSTRAINT [FK_actual_sale_package_actual_sale_campaign_ActualSaleCampaignId] FOREIGN KEY([ActualSaleCampaignId])
REFERENCES [dbo].[actual_sale_campaign] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[actual_sale_package] CHECK CONSTRAINT [FK_actual_sale_package_actual_sale_campaign_ActualSaleCampaignId]
GO
ALTER TABLE [dbo].[actual_sale_package]  WITH CHECK ADD  CONSTRAINT [FK_actual_sale_package_sponsor_package_SponsorPackageId] FOREIGN KEY([SponsorPackageId])
REFERENCES [dbo].[sponsor_package] ([Id])
GO
ALTER TABLE [dbo].[actual_sale_package] CHECK CONSTRAINT [FK_actual_sale_package_sponsor_package_SponsorPackageId]
GO
ALTER TABLE [dbo].[campaign_package]  WITH CHECK ADD  CONSTRAINT [FK_campaign_package_campaign_sale_CampaignSaleId] FOREIGN KEY([CampaignSaleId])
REFERENCES [dbo].[campaign_sale] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[campaign_package] CHECK CONSTRAINT [FK_campaign_package_campaign_sale_CampaignSaleId]
GO
ALTER TABLE [dbo].[deal_product_detail]  WITH CHECK ADD  CONSTRAINT [FK_deal_product_detail_deal_sponsor_DealSponsorId] FOREIGN KEY([DealSponsorId])
REFERENCES [dbo].[deal_sponsor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[deal_product_detail] CHECK CONSTRAINT [FK_deal_product_detail_deal_sponsor_DealSponsorId]
GO
ALTER TABLE [dbo].[deal_product_detail]  WITH CHECK ADD  CONSTRAINT [FK_deal_product_detail_product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[deal_product_detail] CHECK CONSTRAINT [FK_deal_product_detail_product_ProductId]
GO
ALTER TABLE [dbo].[deal_team]  WITH CHECK ADD  CONSTRAINT [FK_deal_team_deal_sponsor_DealSponsorId] FOREIGN KEY([DealSponsorId])
REFERENCES [dbo].[deal_sponsor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[deal_team] CHECK CONSTRAINT [FK_deal_team_deal_sponsor_DealSponsorId]
GO
ALTER TABLE [dbo].[detail_campaign_package]  WITH NOCHECK ADD  CONSTRAINT [FK_detail_campaign_package_campaign_package_CampaignPackageId] FOREIGN KEY([CampaignPackageId])
REFERENCES [dbo].[campaign_package] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detail_campaign_package] CHECK CONSTRAINT [FK_detail_campaign_package_campaign_package_CampaignPackageId]
GO
ALTER TABLE [dbo].[detail_campaign_package]  WITH NOCHECK ADD  CONSTRAINT [FK_detail_campaign_package_product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detail_campaign_package] CHECK CONSTRAINT [FK_detail_campaign_package_product_ProductId]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_product_category_ProductCategoryId] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[product_category] ([Id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_product_category_ProductCategoryId]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_product_sub_category_ProductSubCategoryId] FOREIGN KEY([ProductSubCategoryId])
REFERENCES [dbo].[product_sub_category] ([Id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_product_sub_category_ProductSubCategoryId]
GO
ALTER TABLE [dbo].[product_sub_category]  WITH CHECK ADD  CONSTRAINT [FK_product_sub_category_product_category_ProductCategoryId] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[product_category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product_sub_category] CHECK CONSTRAINT [FK_product_sub_category_product_category_ProductCategoryId]
GO
ALTER TABLE [dbo].[sale_process_history]  WITH CHECK ADD  CONSTRAINT [FK_sale_process_history_deal_sponsor_DealSponsorId] FOREIGN KEY([DealSponsorId])
REFERENCES [dbo].[deal_sponsor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sale_process_history] CHECK CONSTRAINT [FK_sale_process_history_deal_sponsor_DealSponsorId]
GO
ALTER TABLE [dbo].[sale_process_history]  WITH CHECK ADD  CONSTRAINT [FK_sale_process_history_sale_process_SaleProcessId] FOREIGN KEY([SaleProcessId])
REFERENCES [dbo].[sale_process] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sale_process_history] CHECK CONSTRAINT [FK_sale_process_history_sale_process_SaleProcessId]
GO
ALTER TABLE [dbo].[sponsor_campaign]  WITH CHECK ADD  CONSTRAINT [FK_sponsor_campaign_campaign_sale_CampaignSaleId] FOREIGN KEY([CampaignSaleId])
REFERENCES [dbo].[campaign_sale] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sponsor_campaign] CHECK CONSTRAINT [FK_sponsor_campaign_campaign_sale_CampaignSaleId]
GO
ALTER TABLE [dbo].[sponsor_campaign]  WITH CHECK ADD  CONSTRAINT [FK_sponsor_campaign_deal_sponsor_DealSponsorId] FOREIGN KEY([DealSponsorId])
REFERENCES [dbo].[deal_sponsor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sponsor_campaign] CHECK CONSTRAINT [FK_sponsor_campaign_deal_sponsor_DealSponsorId]
GO
ALTER TABLE [dbo].[sponsor_detail_package]  WITH CHECK ADD  CONSTRAINT [FK_sponsor_detail_package_detail_campaign_package_DetailCampaignPackageId] FOREIGN KEY([DetailCampaignPackageId])
REFERENCES [dbo].[detail_campaign_package] ([Id])
GO
ALTER TABLE [dbo].[sponsor_detail_package] CHECK CONSTRAINT [FK_sponsor_detail_package_detail_campaign_package_DetailCampaignPackageId]
GO
ALTER TABLE [dbo].[sponsor_detail_package]  WITH CHECK ADD  CONSTRAINT [FK_sponsor_detail_package_product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sponsor_detail_package] CHECK CONSTRAINT [FK_sponsor_detail_package_product_ProductId]
GO
ALTER TABLE [dbo].[sponsor_detail_package]  WITH CHECK ADD  CONSTRAINT [FK_sponsor_detail_package_sponsor_package_SponsorPackageId] FOREIGN KEY([SponsorPackageId])
REFERENCES [dbo].[sponsor_package] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sponsor_detail_package] CHECK CONSTRAINT [FK_sponsor_detail_package_sponsor_package_SponsorPackageId]
GO
ALTER TABLE [dbo].[sponsor_package]  WITH CHECK ADD  CONSTRAINT [FK_sponsor_package_campaign_package_CampaignPackageId] FOREIGN KEY([CampaignPackageId])
REFERENCES [dbo].[campaign_package] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sponsor_package] CHECK CONSTRAINT [FK_sponsor_package_campaign_package_CampaignPackageId]
GO
ALTER TABLE [dbo].[sponsor_package]  WITH CHECK ADD  CONSTRAINT [FK_sponsor_package_sponsor_campaign_SponsorCampaignId] FOREIGN KEY([SponsorCampaignId])
REFERENCES [dbo].[sponsor_campaign] ([Id])
GO
ALTER TABLE [dbo].[sponsor_package] CHECK CONSTRAINT [FK_sponsor_package_sponsor_campaign_SponsorCampaignId]
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
/****** Object:  StoredProcedure [dbo].[GetActualSaleByStatus]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE PROCEDURE [dbo].[GetActualSaleByStatus]
	                @VendorId INT = NULL,
	                @FromDate DATE,
                    @ToDate DATE
                AS
                BEGIN
                    SELECT st.Id, st.[Name] AS SaleStatus, COUNT(ac.[Id]) AS DealCount
                    FROM [dbo].actual_sale_status st
                    LEFT JOIN 
					(SELECT ac.Id, ac.Status
						FROM dbo.actual_sale ac
						LEFT JOIN dbo.deal_sponsor ds ON ac.DealSponsorId = ds.Id
						WHERE ac.is_active = 1 and (ac.EndDate BETWEEN @FromDate AND @ToDate) AND (@VendorId IS NULL OR ds.[VendorId] = @VendorId)
					) AS ac ON st.Id = ac.Status
                    GROUP BY st.Id, st.[Name]
                    ORDER BY st.Id
                END
GO
/****** Object:  StoredProcedure [dbo].[GetActualSaleSummary]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                CREATE PROCEDURE [dbo].[GetActualSaleSummary]
					@VendorId INT = NULL,
                    @FromDate DATE,
                    @ToDate DATE
                AS
                BEGIN
                    DECLARE @PreviousFromDate DATE, @PreviousToDate DATE

                    -- Tính khoảng thời gian cùng kỳ trước đó
                    SET @PreviousFromDate = DATEADD(DAY, -DATEDIFF(DAY, @FromDate, @ToDate) -1, @FromDate)
                    SET @PreviousToDate = DATEADD(DAY, -1, @FromDate)

                    -- Lấy tổng số deal_sponsor trong khoảng thời gian hiện tại
                    SELECT COUNT(*) AS TotalCount
                    INTO #CurrentSummary
                    FROM dbo.actual_sale ac
					LEFT JOIN dbo.deal_sponsor ds ON ac.DealSponsorId = ds.Id
                    WHERE ac.is_active = 1 and (ac.EndDate BETWEEN @FromDate AND @ToDate) AND (@VendorId IS NULL OR ds.[VendorId] = @VendorId)

                    -- Lấy tổng số deal_sponsor trong khoảng thời gian cùng kỳ trước đó
                    SELECT COUNT(*) AS TotalCount
                    INTO #PreviousSummary
                    FROM dbo.actual_sale ac
					LEFT JOIN dbo.deal_sponsor ds ON ac.DealSponsorId = ds.Id
                    WHERE ac.is_active = 1 and (ac.EndDate BETWEEN @PreviousFromDate AND @PreviousToDate) AND (@VendorId IS NULL OR ds.[VendorId] = @VendorId)

                    -- Tính số tăng/giảm so với kỳ trước
                    DECLARE @CurrentCount INT, @PreviousCount INT, @Change INT
                    SELECT @CurrentCount = TotalCount FROM #CurrentSummary
                    SELECT @PreviousCount = TotalCount FROM #PreviousSummary
                    SET @Change = @CurrentCount - @PreviousCount


	                DECLARE @TotalSaleDone FLOAT
	                SELECT @TotalSaleDone = SUM(ac.TotalPrice)
	                FROM actual_sale ac
					LEFT JOIN dbo.deal_sponsor ds ON ac.DealSponsorId = ds.Id
	                join actual_sale_status s
	                on ac.Status = s.Id
	                where ac.is_active = 1 and s.Name = 'DONE' AND (@VendorId IS NULL OR ds.[VendorId] = @VendorId) and (ac.EndDate BETWEEN @FromDate AND @ToDate)

                    -- Trả về kết quả
                    SELECT
		                @TotalSaleDone AS TotalSaleDone,
                        @CurrentCount AS CurrentCount,
                        @PreviousCount AS PreviousCount,
                        @Change AS Change

                END

            
GO
/****** Object:  StoredProcedure [dbo].[GetDealCountBySaleProcess]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                     CREATE PROCEDURE [dbo].[GetDealCountBySaleProcess]
					     @VendorId INT = NULL,
					     @FromDate DATE,
					     @ToDate DATE
				     AS
				     BEGIN
					     SELECT sp.Id, sp.[Name] AS SaleProcess, sp.Color, COUNT(ds.[Id]) AS DealCount, SUM(ds.TotalPrice) AS TotalPrice
					     FROM [dbo].[sale_process] sp
					      LEFT JOIN 
					      (SELECT ds.Id, ds.SaleProcess, ds.TotalPrice
						    FROM dbo.deal_sponsor ds
						    WHERE ds.is_active = 1 and (ds.EndDate BETWEEN @FromDate AND @ToDate) AND (@VendorId IS NULL OR ds.[VendorId] = @VendorId)
					    ) AS ds ON sp.Id = ds.SaleProcess
					     GROUP BY sp.Id, sp.Name, sp.Color
					     ORDER BY sp.Id
				     END
            
GO
/****** Object:  StoredProcedure [dbo].[GetDealInMonth]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE PROCEDURE [dbo].[GetDealInMonth]
	                @FromDate DATE,
                    @ToDate DATE
                AS
                BEGIN
                    SELECT v.id,v.[name] AS VendorName, ds.Id as DealId, ds.Name as DealName, ds.TotalPrice, ds.EndDate
                    FROM [dbo].[deal_sponsor] ds
                    INNER JOIN [GCS_CATEGORY].dbo.[cate_vendor] v ON ds.[VendorId] = v.[Id]
	                WHERE ds.is_active = 1 and (ds.EndDate BETWEEN @FromDate AND @ToDate)
                END
GO
/****** Object:  StoredProcedure [dbo].[GetDealSponsorSummary]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                CREATE PROCEDURE [dbo].[GetDealSponsorSummary]
			        @VendorId INT = NULL,
                    @FromDate DATE,
                    @ToDate DATE
                AS
                BEGIN
                    DECLARE @PreviousFromDate DATE, @PreviousToDate DATE

                    -- Tính khoảng thời gian cùng kỳ trước đó
                    SET @PreviousFromDate = DATEADD(DAY, -DATEDIFF(DAY, @FromDate, @ToDate) -1, @FromDate)
                    SET @PreviousToDate = DATEADD(DAY, -1, @FromDate)

                    -- Lấy tổng số deal_sponsor trong khoảng thời gian hiện tại
                    SELECT COUNT(*) AS TotalCount
                    INTO #CurrentSummary
                    FROM dbo.deal_sponsor
                    WHERE is_active = 1 and (EndDate BETWEEN @FromDate AND @ToDate) AND (@VendorId IS NULL OR [VendorId] = @VendorId)

                    -- Lấy tổng số deal_sponsor trong khoảng thời gian cùng kỳ trước đó
                    SELECT COUNT(*) AS TotalCount
                    INTO #PreviousSummary
                    FROM dbo.deal_sponsor
                    WHERE is_active = 1 and (EndDate BETWEEN @PreviousFromDate AND @PreviousToDate) AND (@VendorId IS NULL OR [VendorId] = @VendorId)

                    -- Tính số tăng/giảm so với kỳ trước
                    DECLARE @CurrentCount INT, @PreviousCount INT, @Change INT
                    SELECT @CurrentCount = TotalCount FROM #CurrentSummary
                    SELECT @PreviousCount = TotalCount FROM #PreviousSummary
                    SET @Change = @CurrentCount - @PreviousCount


	                DECLARE @TotalDealWon FLOAT
	                SELECT @TotalDealWon = SUM(TotalPrice)
	                FROM deal_sponsor ds
	                join sale_process s
	                on ds.SaleProcess = s.Id
	                where ds.is_active = 1 and s.Name = 'Close Won' AND (@VendorId IS NULL OR ds.[VendorId] = @VendorId)  and (EndDate BETWEEN @FromDate AND @ToDate)

                    -- Trả về kết quả
                    SELECT
		                @TotalDealWon AS TotalDealWon,
                        @CurrentCount AS CurrentCount,
                        @PreviousCount AS PreviousCount,
                        @Change AS Change

                END
            
GO
/****** Object:  StoredProcedure [dbo].[GetFilteredDealsWithPermission]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE PROCEDURE [dbo].[GetFilteredDealsWithPermission]
                        @currentUser NVARCHAR(256)
                    AS
                    BEGIN
                        DECLARE @IsSaleManager bit = 0,
                                @IsSaleTeam bit = 0,
                                @IsSaleDirector bit = 0,
                                @IsAccountant bit = 0,
                                @IsHead bit = 0,
                                @CompanyId int = NULL;
	


                        -- Lấy thông tin quyền và công ty của người dùng hiện tại
                        SELECT
                            @IsSaleManager = MAX(CASE WHEN g.code = 'saleManager' THEN 1 ELSE @IsSaleManager END),
                            @IsSaleTeam = MAX(CASE WHEN g.code = 'saleTeam' THEN 1 ELSE @IsSaleTeam END),
                            @IsSaleDirector = MAX(CASE WHEN g.code = 'saleDirector' THEN 1 ELSE @IsSaleDirector END),
                            @IsAccountant = MAX(CASE WHEN g.code = 'accountant' THEN 1 ELSE @IsAccountant END),
                            @IsHead = MAX(CASE WHEN g.code = 'head' THEN 1 ELSE @IsHead END),
		                    @CompanyId = MAX(U.cate_company_id)
                        FROM GCS_USERS.dbo.auth_user u
                        CROSS APPLY STRING_SPLIT(u.group_id, ';') AS split
                        JOIN GCS_USERS.dbo.auth_group g ON g.id = CAST(split.value AS INT)
                        WHERE u.username = @currentUser
                        AND g.code IN ('saleManager', 'saleDirector', 'saleTeam', 'accountant', 'head');

                        IF @IsAccountant = 1 OR @IsHead = 1
                        BEGIN
                            -- Quyền Accountant hoặc Head
                            SELECT Id FROM deal_sponsor WHERE is_active = 1 AND company_id = @CompanyId;
                        END
                        ELSE IF @IsSaleDirector = 1 OR @IsSaleManager = 1 OR @IsSaleTeam = 1
                        BEGIN
		                    DECLARE @UserManager TABLE (username NVARCHAR(256));

		                    INSERT INTO @UserManager (username)
		                    SELECT username
		                    FROM v_user_manager
		                    WHERE line_manager = @CurrentUser;



                            -- Quyền SaleDirector, SaleManager hoặc SaleTeam
                            SELECT d.Id
                            FROM deal_sponsor d
                            WHERE d.create_by = @currentUser
                                OR d.create_by IN (SELECT username FROM @UserManager)
                                OR d.Id IN (
                                    SELECT DealSponsorId
                                    FROM deal_team 
                                    WHERE is_active = 1 
                                    AND (username = @currentUser OR username IN (SELECT username FROM @UserManager)))
                        END
                        ELSE
                        BEGIN
                            -- Không có quyền nào, không trả về dữ liệu
                            SELECT Id FROM deal_sponsor WHERE 1=0;
                        END
                    END


                            
GO
/****** Object:  StoredProcedure [dbo].[GetTop5ExpiredDealSponsors]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                CREATE PROCEDURE [dbo].[GetTop5ExpiredDealSponsors]
                AS
                BEGIN
                    SELECT TOP 5 v.id as VendorId, v.name as VendorName,ds.Id as DealId,
			                ds.Name as DealName, ds.TotalPrice, ds.EndDate, DATEDIFF(DAY, EndDate, GETDATE()) AS DelayedDays
                    FROM dbo.deal_sponsor ds
	                left join GCS_CATEGORY.dbo.cate_vendor v
	                on ds.VendorId = v.id
					left join sale_process sp
					on ds.SaleProcess = sp.Id
                    WHERE ds.is_active = 1 and EndDate < CAST(GETDATE() AS DATE) and sp.StepNumber <> 5
                    ORDER BY DelayedDays DESC
                END
            
GO
/****** Object:  StoredProcedure [dbo].[GetTop5VendorsWithMostDeals]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE PROCEDURE [dbo].[GetTop5VendorsWithMostDeals]
                 @FromDate DATE,
                    @ToDate DATE
                AS
                BEGIN
                    SELECT TOP 5 v.id,v.[name] AS VendorName, COUNT(*) AS DealCount
                    FROM [dbo].[deal_sponsor] ds
                    INNER JOIN [GCS_CATEGORY].dbo.[cate_vendor] v ON ds.[VendorId] = v.[Id]
	                WHERE ds.is_active = 1 and (ds.EndDate BETWEEN @FromDate AND @ToDate)
                    GROUP BY v.id, v.name
                    ORDER BY COUNT(*) DESC;
                END
GO
/****** Object:  StoredProcedure [dbo].[GetTopDealBySaleProcess]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                CREATE PROCEDURE [dbo].[GetTopDealBySaleProcess]
                    @SaleProcess int = NULL
                AS
                BEGIN
                    SELECT TOP 5 v.id as VendorId, v.name as VendorName,ds.Id as DealId,
			                ds.Name as DealName, ds.TotalPrice, ds.EndDate,
			                s.Name as SaleProcess, s.Color as SaleProcessColor
                    FROM dbo.deal_sponsor ds
	                left join GCS_CATEGORY.dbo.cate_vendor v
	                on ds.VendorId = v.id
	                left join dbo.sale_process s
	                on ds.SaleProcess = s.Id
                    WHERE ds.is_active = 1 and (@SaleProcess is NULL OR ds.SaleProcess = @SaleProcess)
                    ORDER BY TotalPrice DESC
                END

            
GO
/****** Object:  StoredProcedure [dbo].[GetTotalActivities]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE PROCEDURE [dbo].[GetTotalActivities]
	                @VendorId INT = NULL,
	                @FromDate DATE,
                    @ToDate DATE
                AS
                BEGIN
                   (select id,Name, StartDate, EndDate from GCS_CATEGORY.dbo.cate_activity where is_deleted = 0 and (@VendorId IS NULL OR vendor_id = @VendorId) and (EndDate BETWEEN @FromDate AND @ToDate)) 
					union 
						(Select a.id,a.Name, a.StartDate, a.EndDate from (select id,Name,StartDate,EndDate,DealSponsorId from activity where is_active = 1 and DealSponsorId is not null and (EndDate BETWEEN @FromDate AND @ToDate)) a
						join (select id,VendorId from deal_sponsor where is_active = 1 and (@VendorId IS NULL OR [VendorId] = @VendorId)) ds
						on a.DealSponsorId = ds.Id)
					union 
						(Select a.id,a.Name, a.StartDate, a.EndDate from (select id,Name,StartDate,EndDate,ActualSaleId from activity where is_active = 1 and ActualSaleId is not null and (EndDate BETWEEN @FromDate AND @ToDate)) a
						join (select id,DealSponsorId from actual_sale where is_active = 1) ac
						on a.ActualSaleId = ac.Id
						LEFT JOIN (select id,VendorId from deal_sponsor where is_active = 1 and (@VendorId IS NULL OR [VendorId] = @VendorId)) ds
						ON ac.DealSponsorId = ds.Id)
                END

            
GO
/****** Object:  StoredProcedure [dbo].[GetTotalContacts]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                 CREATE PROCEDURE [dbo].[GetTotalContacts]
	                @VendorId INT = NULL,
	                @FromDate DATE,
                    @ToDate DATE
                AS
                BEGIN
                   select ct.id,ct.code,ct.first_name,ct.last_name, ct.create_time from GCS_CATEGORY.dbo.cate_contact ct
				   join GCS_CATEGORY.dbo.cate_contact_account ca 
				   on ct.id = ca.contact_id
				   where ct.is_deleted = 0  AND (@VendorId IS NULL OR ca.vendor_id = @VendorId)  and (ct.create_time BETWEEN @FromDate AND @ToDate)
                END

            
GO
/****** Object:  StoredProcedure [dbo].[GetTotalDeals]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                CREATE PROCEDURE [dbo].[GetTotalDeals]
	                @VendorId INT = NULL,
	                @FromDate DATE,
                    @ToDate DATE
                AS
                BEGIN
                   select id,Name, StartDate, EndDate,TotalPrice, Type from deal_sponsor ds
				   where ds.is_active = 1  AND (@VendorId IS NULL OR ds.[VendorId] = @VendorId)  and (EndDate BETWEEN @FromDate AND @ToDate)
                END
            
GO
/****** Object:  StoredProcedure [dbo].[GetTotalDealSponsorAndProductReport]    Script Date: 4/25/2024 4:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE PROCEDURE [dbo].[GetTotalDealSponsorAndProductReport]
                    @StartDate datetime2,
                    @EndDate datetime2
                AS
                BEGIN
                    SELECT
                        CONVERT(date, ds.EndDate) AS DealDate,
                        SUM(CASE WHEN ds.Type = 0 THEN 1 ELSE 0 END) AS SponsorDealCount,
                        SUM(CASE WHEN ds.Type = 1 THEN 1 ELSE 0 END) AS ProductDealCount
                    FROM
                        deal_sponsor ds
                    WHERE
		                ds.is_active = 1 and (
                        ds.EndDate >= @StartDate
                        AND ds.EndDate <= @EndDate)
                    GROUP BY
                        CONVERT(date, ds.EndDate)
                    ORDER BY
                        CONVERT(date, ds.EndDate)
                END
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
         Begin Table = "cate_channel (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 324
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_channel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_channel'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_company'
GO
USE [master]
GO
ALTER DATABASE [SPM_GCS] SET  READ_WRITE 
GO
