USE [master]
GO
/****** Object:  Database [CRM_FREELANCE]    Script Date: 4/25/2024 3:57:33 PM ******/
CREATE DATABASE [CRM_FREELANCE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRM_FREELANCE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CRM_FREELANCE.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRM_FREELANCE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CRM_FREELANCE_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CRM_FREELANCE] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRM_FREELANCE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRM_FREELANCE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRM_FREELANCE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRM_FREELANCE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRM_FREELANCE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRM_FREELANCE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET RECOVERY FULL 
GO
ALTER DATABASE [CRM_FREELANCE] SET  MULTI_USER 
GO
ALTER DATABASE [CRM_FREELANCE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRM_FREELANCE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRM_FREELANCE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRM_FREELANCE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRM_FREELANCE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRM_FREELANCE', N'ON'
GO
ALTER DATABASE [CRM_FREELANCE] SET QUERY_STORE = OFF
GO
USE [CRM_FREELANCE]
GO
/****** Object:  User [usr_it_freelance]    Script Date: 4/25/2024 3:57:34 PM ******/
CREATE USER [usr_it_freelance] FOR LOGIN [usr_it_freelance] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 3:57:34 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usr_it_freelance]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
/****** Object:  Table [dbo].[cate_account_detail]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_account_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[code_ERP] [nvarchar](50) NULL,
	[customer_caring] [nvarchar](max) NULL,
	[customers_relation] [nvarchar](max) NULL,
	[group_id] [int] NULL,
	[supplier_top1] [nvarchar](max) NULL,
	[supplier_top2] [nvarchar](max) NULL,
	[supplier_top3] [nvarchar](max) NULL,
	[supplier_top4] [nvarchar](max) NULL,
	[supplier_top5] [nvarchar](max) NULL,
	[certificate] [nvarchar](max) NULL,
	[black_list_id] [int] NULL,
	[note] [nvarchar](max) NULL,
	[priority] [nvarchar](max) NULL,
	[advantage] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[vendor_social_id] [int] NULL,
 CONSTRAINT [PK_cate_vendor_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_account_detail_file]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_account_detail_file](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_detail_id] [int] NULL,
	[file_id] [int] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_account_detail_file] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_activity]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_activity](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[contact_id] [int] NULL,
	[Outcome] [nvarchar](max) NULL,
	[ChannelContact] [int] NULL,
	[DealSponsorId] [uniqueidentifier] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[ActualSaleId] [uniqueidentifier] NULL,
	[Notes] [nvarchar](max) NULL,
	[when] [nvarchar](max) NULL,
	[insight] [nvarchar](max) NULL,
	[vendor_id] [int] NULL,
 CONSTRAINT [PK_activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_bank]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_bank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](max) NULL,
	[name_vn] [nvarchar](max) NULL,
	[name_en] [nvarchar](max) NULL,
	[gcmid] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_bank] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_brand]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[short_name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_cate_brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_brand_account]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_brand_account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand_id] [int] NOT NULL,
	[vendor_id] [int] NOT NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_brand_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_buying_roles]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_buying_roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_channel]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_channel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_general_id] [int] NULL,
	[name] [nvarchar](500) NULL,
	[description] [nvarchar](500) NULL,
	[id_cate_channel_type] [int] NULL,
	[is_deleted] [bit] NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[id_cate_platform] [int] NULL,
	[External_channel_ID] [nvarchar](500) NULL,
	[channel_id_social] [nvarchar](max) NULL,
	[channel_name_social] [nvarchar](max) NULL,
	[url] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_channel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_channel_channel_type]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_channel_channel_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_general_id] [int] NULL,
	[channel_type_id] [int] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_channel_channel_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_channel_contract]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_channel_contract](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_general_id] [int] NOT NULL,
	[currency_id] [int] NULL,
	[vendor_id] [int] NULL,
	[vendor_social_id] [int] NULL,
	[video_type_group_id] [int] NULL,
	[content_type_sharing_id] [int] NULL,
	[code] [nvarchar](50) NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[note] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_channel_contract] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_channel_contract_copyright_strike]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_channel_contract_copyright_strike](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_contract_id] [int] NOT NULL,
	[percent_sharing] [decimal](18, 2) NULL,
	[no_copyright] [int] NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_channel_contract_copyright_strike] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_channel_general]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_channel_general](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[plat_form_id] [int] NULL,
	[description] [nvarchar](max) NULL,
	[is_viechannel] [bit] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_channel_general] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_channel_tax]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_channel_tax](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_general_id] [int] NULL,
	[tax_id] [int] NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_channel_tax] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_channel_token]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_channel_token](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_general_id] [int] NOT NULL,
	[token] [nvarchar](max) NULL,
	[channel_id] [int] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_channel_token] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_channel_type]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_channel_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_channel_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_company]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_broadcast] [bit] NULL,
	[is_internal] [bit] NULL,
	[day_alert] [int] NULL,
	[taxcode] [nvarchar](250) NULL,
	[fullname] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_companys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_company_account_detail]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_company_account_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[account_detail_id] [int] NOT NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_company_account_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_contact]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[personal_title_id] [int] NULL,
	[first_name] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[date_of_birth] [datetime2](7) NULL,
	[primary_address] [nvarchar](max) NULL,
	[alt_address] [nvarchar](max) NULL,
	[primary_country_code] [nvarchar](max) NULL,
	[primary_phone_number_code] [nvarchar](50) NULL,
	[primary_phone_number] [nvarchar](max) NULL,
	[alt_country_code] [nvarchar](max) NULL,
	[alt_phone_number_code] [nvarchar](50) NULL,
	[alt_phone_number] [nvarchar](max) NULL,
	[primary_personal_email] [nvarchar](max) NULL,
	[alt_personal_email] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[note] [nvarchar](max) NULL,
	[company_id] [int] NULL,
	[code] [nvarchar](50) NULL,
	[gender] [int] NULL,
	[person_title] [int] NULL,
	[tax_code] [nvarchar](50) NULL,
	[primary_city] [int] NULL,
	[primary_distric] [int] NULL,
	[primary_ward] [int] NULL,
	[alt_city] [int] NULL,
	[alt_distric] [int] NULL,
	[alt_ward] [int] NULL,
	[numericalorder] [int] NULL,
 CONSTRAINT [PK_cate_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_contact_account]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_contact_account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contact_id] [int] NOT NULL,
	[vendor_id] [int] NOT NULL,
	[from_date] [datetime2](7) NULL,
	[to_date] [datetime2](7) NULL,
	[buying_role_id] [int] NULL,
	[department_id] [int] NULL,
	[job_title_id] [int] NULL,
	[email] [nvarchar](max) NULL,
	[country_code] [nvarchar](max) NULL,
	[phone_work_code] [nvarchar](50) NULL,
	[phone_work] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[relationship] [nvarchar](max) NULL,
	[legal] [bit] NULL,
 CONSTRAINT [PK_cate_contact_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_contact_channel]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_contact_channel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_contact_channel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_content_type]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_content_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_content_type_sharing]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_content_type_sharing](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_station_break] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_contract_optionrule_sharing]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_contract_optionrule_sharing](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_contract_id] [int] NOT NULL,
	[option_id] [int] NULL,
	[to_date] [datetime] NULL,
	[from_date] [datetime] NULL,
	[percent_sharing_vnwdv] [decimal](18, 2) NULL,
	[percent_sharing_opcop_partner] [decimal](18, 2) NULL,
	[formula] [nvarchar](max) NULL,
	[program_id] [uniqueidentifier] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_contract_optionrule_sharing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_copyright_strike]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_copyright_strike](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_general_id] [int] NOT NULL,
	[month_sharing] [datetime] NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[number_day] [int] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_copyright_strike] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_credit_limit]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_credit_limit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[information] [nvarchar](max) NULL,
	[limit] [numeric](18, 0) NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_credit_limit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_customer_top]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_customer_top](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[account_detail_id] [int] NOT NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_customer_top] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_department]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_exchange_rate]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_exchange_rate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exchange_rate_type_id] [int] NULL,
	[note] [nvarchar](max) NULL,
	[bank_id] [int] NULL,
	[month] [datetime] NULL,
	[amount_exchange] [numeric](18, 2) NULL,
	[currency_id] [int] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_exchange_rate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_exchange_rate_type]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_exchange_rate_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_exchange_rate_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_file]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_file](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](350) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[physical_path] [nvarchar](450) NULL,
	[mine_type] [nvarchar](450) NULL,
	[file_size] [bigint] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_file] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_gen_code]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_gen_code](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[group_code] [varchar](10) NULL,
 CONSTRAINT [PK_cate_gen_code] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_general_team]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_general_team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[full_name] [nvarchar](max) NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_general_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_group]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_history_debt]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_history_debt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[amount_debt] [numeric](18, 0) NULL,
	[ranking] [nvarchar](max) NULL,
	[date_arise_finish] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_history_debt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_income_capital]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_income_capital](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[year] [int] NULL,
	[amount_capital] [numeric](18, 0) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_income_capital] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_industry]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_industry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NULL,
	[create_time] [datetime] NULL,
	[create_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_industry_account]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_industry_account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[industry_id] [int] NOT NULL,
	[vendor_id] [int] NOT NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_industry_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_job_title]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_job_title](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_option_symbol]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_option_symbol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[optionrule_sharing_id] [int] NULL,
	[symbol] [nvarchar](50) NULL,
	[target] [nvarchar](max) NULL,
	[percent_sharing_partner] [decimal](18, 2) NULL,
	[formula] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_option_symbol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_parent_account]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_parent_account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_parent_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_personal_title]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_personal_title](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_personal_title] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_platform]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_platform](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[link] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_platform] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_product_services]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_product_services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[type_service_id] [int] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_product_services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_rating_customer]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_rating_customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[classification] [nvarchar](max) NULL,
	[rating] [nvarchar](max) NULL,
	[expertise_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_rating_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_revenue]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_revenue](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[amount_revenue] [numeric](18, 0) NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_revenue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_sharing_internal]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_sharing_internal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_general_id] [int] NOT NULL,
	[percent_sharing] [decimal](18, 2) NULL,
	[video_type_group_id] [int] NULL,
	[content_type_sharing_id] [int] NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_sharing_internal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_social_team]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_social_team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_general_id] [int] NOT NULL,
	[username] [nvarchar](max) NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_social_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_statement]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_statement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_statement] [datetime] NULL,
	[channel_id] [int] NULL,
	[channel_general_id] [int] NULL,
	[plat_form_id] [int] NULL,
	[net_revenue_wth] [decimal](18, 2) NULL,
	[net_revenue_vat_final] [decimal](18, 2) NULL,
	[net_revenue_vat_est] [decimal](18, 2) NULL,
	[net_revenue_novat_final] [decimal](18, 2) NULL,
	[net_revenue_novat_est] [decimal](18, 2) NULL,
	[datviet_net_revenue_wth] [decimal](18, 2) NULL,
	[talent_net_revenue_wth] [decimal](18, 2) NULL,
	[share_net_revenue_wth] [decimal](18, 2) NULL,
	[copyright_strike] [int] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_statement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_term_payment]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_term_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[term_payment] [nvarchar](max) NULL,
	[method_payment] [nvarchar](max) NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_term_payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_type_service]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_type_service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_type_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_vendor]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_vendor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[full_name] [nvarchar](500) NULL,
	[day_alert] [int] NULL,
	[tax_code] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[nation] [int] NULL,
	[vendor_code] [nvarchar](500) NULL,
	[Company_code] [nvarchar](50) NULL,
	[is_internal] [bit] NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](500) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](500) NULL,
	[update_time] [datetime] NULL,
	[is_supplier] [bit] NULL,
	[is_post_corp] [bit] NULL,
	[is_manufature] [bit] NULL,
	[short_name] [nvarchar](50) NULL,
	[is_customer] [bit] NULL,
	[en_name] [nvarchar](500) NULL,
	[email] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[website] [nvarchar](50) NULL,
	[telephone_code] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[birthday] [datetime] NULL,
	[parent_acc_id] [int] NULL,
	[type] [uniqueidentifier] NOT NULL,
	[source] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[city_id] [int] NULL,
	[district_id] [int] NULL,
	[ward_id] [int] NULL,
	[country_id] [int] NULL,
	[per_identity] [nvarchar](50) NULL,
	[per_passport] [nvarchar](50) NULL,
	[is_deleted] [bit] NULL,
	[company_id] [int] NULL,
	[numericalorder] [int] NULL,
	[ticket_symbol] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_vendor_social]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_vendor_social](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_vendor_social] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_video_type]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_video_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[video_type_group_id] [int] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_video_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_video_type_group]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_video_type_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_video_type_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_CATETYPEUNIT]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_CATETYPEUNIT](
	[Id] [uniqueidentifier] NOT NULL,
	[TypeUnit] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_IPP_CATETYPEUNIT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session_action]    Script Date: 4/25/2024 3:57:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getBrandAccount]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getBrandAccount] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
	--DECLARE @contactGroup3 decimal 
	--set @contactGroup1 = 3

	select brac.id as 'id', brac.vendor_id , brac.brand_id, brac.is_active , br.name, br.short_name, br.description, br.create_by, br.update_by, br.create_time, br.update_time 
	
	from cate_brand_account brac inner join cate_brand br on brac.brand_id = br.id
	where brac.is_deleted = 0
	--select *from cate_activity

END
GO
/****** Object:  StoredProcedure [dbo].[getContactReportGroup]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getContactReportGroup] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
	--DECLARE @contactGroup3 decimal 
	--set @contactGroup1 = 3

	select top 3 count(id) as 'number_activity', contact_id from cate_activity where is_deleted = 0 group by contact_id order by number_activity desc

	--select *from cate_activity

END
GO
/****** Object:  StoredProcedure [dbo].[getIndustryAccount]    Script Date: 4/25/2024 3:57:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getIndustryAccount] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
	--DECLARE @contactGroup3 decimal 
	--set @contactGroup1 = 3

	select brac.id as 'id', brac.vendor_id , brac.industry_id, brac.is_active , br.name, br.description, br.create_by, br.update_by, br.create_time, br.update_time 
	
	from cate_industry_account brac inner join cate_industry br on brac.industry_id = br.id
	where brac.is_deleted = 0
	
	--select *from cate_activity

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: internal, 2: Customer, 3: suplier, 4: manufature, 5: post corp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_account_detail', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lấy từ API MDM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_channel_tax', @level2type=N'COLUMN',@level2name=N'tax_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại content: show, music, trailer, popup' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_content_type_sharing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Sale team - 2: PD team' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_general_team', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Income - 2: Qui mô vốn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_income_capital', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Sale team - 2: PD team' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_product_services', @level2type=N'COLUMN',@level2name=N'type_service_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Xếp loại khách hàng - 2: Xếp loại nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_rating_customer', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Username AD là kiểu chuỗi nên nó sài string' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_social_team', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Điều khoản thanh toán khách hàng - 2: Điều khoản thanh toán nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_term_payment', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_vendor', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acc Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_vendor', @level2type=N'COLUMN',@level2name=N'vendor_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code company local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_vendor', @level2type=N'COLUMN',@level2name=N'Company_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Công ty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_vendor', @level2type=N'COLUMN',@level2name=N'is_internal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_vendor', @level2type=N'COLUMN',@level2name=N'is_supplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hậu kỳ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_vendor', @level2type=N'COLUMN',@level2name=N'is_post_corp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhà sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_vendor', @level2type=N'COLUMN',@level2name=N'is_manufature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_vendor', @level2type=N'COLUMN',@level2name=N'is_customer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày thành lập/Sinh nhật (person/company)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_vendor', @level2type=N'COLUMN',@level2name=N'birthday'
GO
USE [master]
GO
ALTER DATABASE [CRM_FREELANCE] SET  READ_WRITE 
GO
