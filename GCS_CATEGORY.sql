USE [master]
GO
/****** Object:  Database [GCS_CATEGORY]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE DATABASE [GCS_CATEGORY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GCS_DEV_CATEGORY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_CATEGORY_PROD.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GCS_DEV_CATEGORY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_CATEGORY_PROD_log.ldf' , SIZE = 466944KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GCS_CATEGORY] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GCS_CATEGORY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GCS_CATEGORY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET ARITHABORT OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GCS_CATEGORY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GCS_CATEGORY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GCS_CATEGORY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GCS_CATEGORY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET RECOVERY FULL 
GO
ALTER DATABASE [GCS_CATEGORY] SET  MULTI_USER 
GO
ALTER DATABASE [GCS_CATEGORY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GCS_CATEGORY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GCS_CATEGORY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GCS_CATEGORY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GCS_CATEGORY] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GCS_CATEGORY', N'ON'
GO
ALTER DATABASE [GCS_CATEGORY] SET QUERY_STORE = OFF
GO
USE [GCS_CATEGORY]
GO
/****** Object:  User [VACGROUP\tham.tran]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [VACGROUP\tham.tran] FOR LOGIN [VACGROUP\tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\khoa.huynh]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [VACGROUP\khoa.huynh] FOR LOGIN [VACGROUP\khoa.huynh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tham.tran]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [tham.tran] FOR LOGIN [tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nhung.tran]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [nhung.tran] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [mdm]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [mdm] FOR LOGIN [mdm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DWH_BI]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [DWH_BI] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BITEAM]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [BITEAM] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bao.nguyen.gia]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [bao.nguyen.gia] FOR LOGIN [bao.nguyen.gia] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [auth_talentmgt]    Script Date: 4/25/2024 4:01:45 PM ******/
CREATE USER [auth_talentmgt] FOR LOGIN [auth_talentmgt] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [VACGROUP\tham.tran]
GO
ALTER ROLE [db_datareader] ADD MEMBER [VACGROUP\khoa.huynh]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tham.tran]
GO
ALTER ROLE [db_datareader] ADD MEMBER [nhung.tran]
GO
ALTER ROLE [db_datareader] ADD MEMBER [mdm]
GO
ALTER ROLE [db_owner] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DWH_BI]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
ALTER ROLE [db_owner] ADD MEMBER [BITEAM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [bao.nguyen.gia]
GO
ALTER ROLE [db_datareader] ADD MEMBER [auth_talentmgt]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [auth_talentmgt]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:01:46 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  UserDefinedFunction [dbo].[getListCompanyName]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getListCompanyName](@account_detail_id INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(MAX) = '';
    
    SELECT @result = STRING_AGG(c.name, ';')
    FROM cate_company_account_detail AS cad
    INNER JOIN cate_company AS c ON cad.company_id = c.id
    WHERE cad.account_detail_id = @account_detail_id
    AND cad.is_deleted = 0
    AND c.is_deleted = 0;

    RETURN @result;
END;
GO
/****** Object:  Table [dbo].[cate_activity]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_vendor]    Script Date: 4/25/2024 4:01:46 PM ******/
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
	[short_name] [nvarchar](500) NULL,
	[is_customer] [bit] NULL,
	[en_name] [nvarchar](500) NULL,
	[email] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[website] [nvarchar](50) NULL,
	[telephone_code] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[birthday] [datetime] NULL,
	[parent_acc_id] [int] NULL,
	[type] [uniqueidentifier] NULL,
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
	[ticket_symbol] [nvarchar](max) NULL,
	[is_electric] [bit] NULL,
 CONSTRAINT [PK_cate_vendor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_report_account_activity]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_report_account_activity]
AS
SELECT cv.id, cv.vendor_code, cv.short_name, cv.name, cv.en_name, cv.email, cv.telephone, cv.address, cv.tax_code, cv.parent_acc_id, cv.type, cv.is_active, 
             CASE WHEN da.last_activity >= ca.last_enddate THEN da.last_activity ELSE ca.last_enddate END AS last_activity, cv.telephone_code, cv.create_by, cv.create_time
FROM   dbo.cate_vendor AS cv LEFT OUTER JOIN
                 (SELECT dv.VendorId, CASE WHEN a.EndDate >= a2.EndDate THEN a.EndDate ELSE a2.EndDate END AS last_activity
                 FROM    (SELECT ds.VendorId, ds.Id AS dealId, ac.Id AS saleId
                               FROM    SPM_GCS.dbo.deal_sponsor AS ds LEFT OUTER JOIN
                                             SPM_GCS.dbo.actual_sale AS ac ON ds.Id = ac.DealSponsorId
                               WHERE  (ds.is_active = 1) AND (ac.is_active = 1)) AS dv LEFT OUTER JOIN
                              SPM_GCS.dbo.activity AS a ON dv.dealId = a.DealSponsorId LEFT OUTER JOIN
                              SPM_GCS.dbo.activity AS a2 ON dv.saleId = a2.ActualSaleId
                 WHERE (a.is_active = 1) AND (a2.is_active = 1)) AS da ON cv.id = da.VendorId LEFT OUTER JOIN
                 (SELECT vendor_id, MAX(EndDate) AS last_enddate
                 FROM    dbo.cate_activity
                 WHERE (is_active = 1)
                 GROUP BY vendor_id) AS ca ON cv.id = ca.vendor_id
WHERE (cv.is_deleted = 0)
GO
/****** Object:  Table [dbo].[cate_contact_account]    Script Date: 4/25/2024 4:01:46 PM ******/
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
	[legal] [int] NULL,
	[poa_number] [nvarchar](50) NULL,
	[signing_date] [datetime2](7) NULL,
	[effective_from] [datetime2](7) NULL,
	[effective_to] [datetime2](7) NULL,
	[field_of_work] [nvarchar](250) NULL,
	[is_add_gcm] [bit] NULL,
 CONSTRAINT [PK_cate_contact_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_contact]    Script Date: 4/25/2024 4:01:46 PM ******/
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
	[user_team_id] [nvarchar](150) NULL,
	[assign_to] [nvarchar](50) NULL,
 CONSTRAINT [PK_cate_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_contact_account]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_contact_account]
AS
SELECT ca.id, ca.contact_id, ca.vendor_id, ca.from_date, ca.to_date, ca.buying_role_id, ca.department_id, ca.job_title_id, ca.email, ca.country_code, ca.phone_work_code, ca.phone_work, ca.is_active, ca.is_deleted, 
             ca.create_by, ca.create_time, ca.update_by, ca.update_time, ca.relationship, ca.legal, v.vendor_code, v.name, c.primary_address, c.create_by AS contact_create_by, c.company_id, 
             c.last_name + ' ' + c.first_name AS contact_name, c.code AS contact_code, c.primary_phone_number_code, c.primary_phone_number, c.note, c.primary_personal_email, v.tax_code, v.address
FROM   dbo.cate_contact AS c LEFT OUTER JOIN
             dbo.cate_contact_account AS ca ON ca.contact_id = c.id LEFT OUTER JOIN
             dbo.cate_vendor AS v ON v.id = ca.vendor_id
WHERE (ca.is_active = 1) AND (ca.is_deleted = 0) AND (c.is_active = 1) AND (c.is_deleted = 0)
GO
/****** Object:  Table [dbo].[cate_account_detail]    Script Date: 4/25/2024 4:01:46 PM ******/
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
	[is_deleted] [bit] NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
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
/****** Object:  Table [dbo].[cate_nation]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_nation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](200) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[name_VN] [nvarchar](200) NULL,
	[geography_id] [varchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NOT NULL,
	[create_time] [datetime] NOT NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_nation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_province]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_province](
	[id] [int] NOT NULL,
	[name] [nvarchar](500) NULL,
	[name_VN] [nvarchar](500) NULL,
	[sub_region_id] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_group]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_district]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_district](
	[id] [int] NOT NULL,
	[name] [nvarchar](500) NULL,
	[name_VN] [nvarchar](500) NULL,
	[province_id] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_ward]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_ward](
	[id] [int] NOT NULL,
	[name] [nvarchar](500) NULL,
	[name_VN] [nvarchar](500) NULL,
	[district_id] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_vendor_social]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[IPP_CATETYPEUNIT]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_CATETYPEUNIT](
	[Id] [uniqueidentifier] NOT NULL,
	[TypeUnit] [nvarchar](max) NULL,
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
/****** Object:  View [dbo].[v_export_vendor]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_export_vendor]
AS
SELECT ven.id, ven.vendor_code, ven.name, ven.en_name, ven.short_name, ven.email, ven.website, ven.fax, ven.telephone_code + ven.telephone AS telephone, ven.birthday, ven.type, unit.TypeUnit, ven.per_identity, 
             ven.parent_acc_id, ven1.name AS parent_acc, ven.is_supplier, ven.is_customer, ven.is_post_corp, ven.is_manufature, ven.is_active, ven.create_by, ven.is_electric, ven.tax_code, ven.address, 
             nat.name AS country, pro.name_VN AS city, dis.name_VN AS district, war.name_VN AS ward, ven.source, ven.note, ven.ticket_symbol, acd_individual.CodeERP AS CodeERP_Individual, 
             acd_individual.GroupName AS GroupName_Individual, acd_individual.ListCompanyName AS ListCompanyName_Individual, acd_individual.CustomerCaring AS CustomerCaring_Individual, 
             acd_individual.CustomerRelation AS CustomerRelation_Individual, acd_individual.CustomerBlackList AS CustomerBlackList_Individual, acd_individual.CustomerNote AS CustomerNote_Individual, 
             acd_individual.CustomerPriority AS CustomerPriority_Individual, acd_individual.CustomerAdvantage AS CustomerAdvantage_Individual, acd_organizational.CodeERP AS CodeERP_Organizational, 
             acd_organizational.GroupName AS GroupName_Organizational, acd_organizational.ListCompanyName AS ListCompanyName_Organizational, 
             acd_organizational.CustomerCaring AS CustomerCaring_Organizational, acd_organizational.CustomerRelation AS CustomerRelation_Organizational, 
             acd_organizational.CustomerBlackList AS CustomerBlackList_Organizational, acd_organizational.CustomerNote AS CustomerNote_Organizational, 
             acd_organizational.CustomerPriority AS CustomerPriority_Organizational, acd_organizational.CustomerAdvantage AS CustomerAdvantage_Organizational, 
             acd_organizational.CustomerCertificate AS CustomerCertificate_Organizational, acd_organizational.CustomerVendorSocial AS CustomerVendorSocial_Organizational, acd_company.CodeERP, 
             ven.company_id, ven.is_deleted, ven.per_passport, ven.full_name
FROM   dbo.cate_vendor AS ven LEFT OUTER JOIN
             dbo.IPP_CATETYPEUNIT AS unit ON ven.type = unit.Id LEFT OUTER JOIN
             dbo.cate_vendor AS ven1 ON ven.parent_acc_id = ven1.id LEFT OUTER JOIN
             dbo.cate_nation AS nat ON ven.country_id = nat.id LEFT OUTER JOIN
             dbo.cate_province AS pro ON ven.city_id = pro.id LEFT OUTER JOIN
             dbo.cate_district AS dis ON ven.district_id = dis.id LEFT OUTER JOIN
             dbo.cate_ward AS war ON ven.ward_id = war.id LEFT OUTER JOIN
                 (SELECT ac.vendor_id, ac.code_ERP AS CodeERP, gr.name AS GroupName, dbo.getListCompanyName(ac.id) AS ListCompanyName, ac.customer_caring AS CustomerCaring, 
                              ac.customers_relation AS CustomerRelation, CASE WHEN ac.black_list_id = 0 THEN 'No' ELSE 'Yes' END AS CustomerBlackList, ac.note AS CustomerNote, ac.priority AS CustomerPriority, 
                              ac.advantage AS CustomerAdvantage
                 FROM    dbo.cate_account_detail AS ac LEFT OUTER JOIN
                              dbo.cate_group AS gr ON ac.group_id = gr.id
                 WHERE (ac.type = 2) AND (ac.is_deleted = 0) AND (ac.id =
                                  (SELECT TOP (1) id
                                  FROM    dbo.cate_account_detail AS ac_sub
                                  WHERE (vendor_id = ac.vendor_id) AND (ac.is_deleted = 0) AND (type = 2)
                                  ORDER BY id))) AS acd_individual ON ven.id = acd_individual.vendor_id LEFT OUTER JOIN
                 (SELECT ac.vendor_id, ac.code_ERP AS CodeERP, gr.name AS GroupName, dbo.getListCompanyName(ac.id) AS ListCompanyName, ac.customer_caring AS CustomerCaring, 
                              ac.customers_relation AS CustomerRelation, CASE WHEN ac.black_list_id = 0 THEN 'No' ELSE 'Yes' END AS CustomerBlackList, ac.note AS CustomerNote, ac.vendor_social_id, 
                              ac.priority AS CustomerPriority, ac.advantage AS CustomerAdvantage, ac.certificate AS CustomerCertificate, vc.name AS CustomerVendorSocial
                 FROM    dbo.cate_account_detail AS ac LEFT OUTER JOIN
                              dbo.cate_group AS gr ON ac.group_id = gr.id LEFT OUTER JOIN
                              dbo.cate_vendor_social AS vc ON ac.vendor_social_id = vc.id
                 WHERE (ac.type = 3) AND (ac.is_deleted = 0) AND (ac.id =
                                  (SELECT TOP (1) id
                                  FROM    dbo.cate_account_detail AS ac_sub
                                  WHERE (vendor_id = ac.vendor_id) AND (ac.is_deleted = 0) AND (type = 3)
                                  ORDER BY id))) AS acd_organizational ON ven.id = acd_organizational.vendor_id LEFT OUTER JOIN
                 (SELECT vendor_id, code_ERP AS CodeERP
                 FROM    dbo.cate_account_detail AS ac
                 WHERE (type = 1) AND (is_deleted = 0) AND (id =
                                  (SELECT TOP (1) id
                                  FROM    dbo.cate_account_detail AS ac_sub
                                  WHERE (vendor_id = ac.vendor_id) AND (ac.is_deleted = 0) AND (type = 1)
                                  ORDER BY id))) AS acd_company ON ven.id = acd_company.vendor_id
WHERE (ven.is_deleted = 0)
GO
/****** Object:  Table [dbo].[cate_channel]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_channel_type]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_channel_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
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
/****** Object:  View [dbo].[v_cate_channel]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_channel]
AS
SELECT c.id, c.name, c.description, c.id_cate_channel_type, c.is_active, c.create_by, c.create_time, c.update_by, c.update_time, t.name AS channel_type_name
FROM   dbo.cate_channel AS c INNER JOIN
             dbo.cate_channel_type AS t ON t.id = c.id_cate_channel_type
GO
/****** Object:  Table [dbo].[cate_platform]    Script Date: 4/25/2024 4:01:46 PM ******/
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
	[sub_group_rights_id] [int] NULL,
	[group_rights_id] [int] NULL,
 CONSTRAINT [PK_cate_platform] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_channel_general]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_platform_channel_general]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_platform_channel_general](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[platform_id] [int] NULL,
	[channel_general_id] [int] NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_cate_platform_channel_general] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_channel_platform_map]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_channel_platform_map]
AS
SELECT ccg.id, ccg.name, ccg.code, STRING_AGG(cp.name, ', ') AS platform_name, STRING_AGG(CAST(cp.id AS NVARCHAR(10)), ', ') AS platform_ids
FROM   dbo.cate_channel_general AS ccg INNER JOIN
             dbo.cate_platform_channel_general AS cpcg ON ccg.id = cpcg.channel_general_id INNER JOIN
             dbo.cate_platform AS cp ON cpcg.platform_id = cp.id
WHERE (ccg.is_deleted = 0) AND (cp.is_deleted = 0) AND (cpcg.is_deleted = 0) AND (ccg.is_active = 1)
GROUP BY ccg.id, ccg.name, ccg.code
GO
/****** Object:  Table [dbo].[cate_platform_delivery_license]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_platform_delivery_license](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[delivery_license_id] [int] NULL,
	[platform_id] [int] NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_cate_platform_delivery_license] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_delivery_license]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_delivery_license](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[Type] [nvarchar](100) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_delivery_license] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_platform_delivery]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_platform_delivery]
AS
SELECT pdl.id, pdl.delivery_license_id, pdl.platform_id, pl.name AS platform_name, dl.name AS delivery_name
FROM   dbo.cate_platform_delivery_license AS pdl INNER JOIN
             dbo.cate_delivery_license AS dl ON dl.id = pdl.delivery_license_id INNER JOIN
             dbo.cate_platform AS pl ON pdl.platform_id = pl.id
WHERE (dl.is_active = 1) AND (pl.is_deleted = 0) AND (pl.is_active = 1) AND (pdl.is_deleted = 0)
GO
/****** Object:  View [dbo].[v_platform_channelgeneral]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_platform_channelgeneral]
AS
SELECT pcg.id, pcg.channel_general_id, pcg.platform_id, pl.name AS platform_name, cg.name AS channel_general_name
FROM   dbo.cate_platform_channel_general AS pcg INNER JOIN
             dbo.cate_channel_general AS cg ON cg.id = pcg.channel_general_id INNER JOIN
             dbo.cate_platform AS pl ON pcg.platform_id = pl.id
WHERE (cg.is_deleted = 0) AND (cg.is_active = 1) AND (pl.is_deleted = 0) AND (pl.is_active = 1) AND (pcg.is_deleted = 0)
GO
/****** Object:  View [dbo].[v_user_manager]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_user_manager]
AS
SELECT m.id, m.username, m.line_manager, u.is_admin, u.is_bom, u.is_viewall
FROM   GCS_USERS.dbo.auth_user_manager AS m INNER JOIN
             GCS_USERS.dbo.auth_user AS u ON m.username = u.username
GO
/****** Object:  View [dbo].[v_violation_unit]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_violation_unit]
AS
SELECT Id, TypeId
FROM   IPP_GCS.dbo.IPP_VIOLATIONSUNIT
WHERE (IsDelete = 0)
GO
/****** Object:  Table [dbo].[cate_account_detail_file]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_acquisitions_status]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_acquisitions_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_acquisitions_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_age]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_age](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_age] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_bank]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_bank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[name_en] [nvarchar](500) NULL,
	[code] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](50) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](50) NULL,
	[update_time] [datetime] NULL,
	[gcmid] [int] NULL,
	[is_deleted] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_bank_account]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_bank_account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bank_id] [int] NOT NULL,
	[vendor_id] [int] NOT NULL,
	[bank_account] [nvarchar](50) NULL,
	[owner_account] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_bank_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_black_list_related]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_black_list_related](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[name_en] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[type] [nvarchar](max) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__cate_bla__3213E83F066567BA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_brand]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_brand_account]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_broadcast_method]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_broadcast_method](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_broadcast_method] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_bus_type]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_bus_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_buying_roles]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_channel_channel_type]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_channel_contract]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_channel_contract_copyright_strike]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_channel_tax]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_channel_token]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_company]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](250) NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
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
/****** Object:  Table [dbo].[cate_company_account_detail]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_contact_channel]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_content_category]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_content_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[is_active] [bit] NOT NULL,
	[content_type_id] [int] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[name_en] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_content_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_content_source]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_content_source](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[is_active] [bit] NOT NULL,
	[description] [nvarchar](max) NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_content_source] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_content_type]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[type] [int] NULL,
	[is_active] [bit] NOT NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[name_en] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_content_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_content_type_sharing]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_contract_optionrule_sharing]    Script Date: 4/25/2024 4:01:46 PM ******/
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
	[formula] [int] NULL,
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
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_contract_status]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_contract_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_contract_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_copyright_strike]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_country_calling_code]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_country_calling_code](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](max) NOT NULL,
	[nation_id] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_credit_limit]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_currency]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_currency](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[code] [varchar](50) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_currency] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_customer_top]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_department]    Script Date: 4/25/2024 4:01:46 PM ******/
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
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_ethnie]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_ethnie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[name_en] [varchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__cate_eth__3213E83F53D66ACB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_exchange_rate]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_exchange_rate_type]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_file]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_file_extension]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_file_extension](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_video] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_file_extension] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_file_quality]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_file_quality](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_file_quality] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_file_unit]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_file_unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_file_unit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_formality]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_formality](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_formality] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_formula]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_formula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[formula] [nvarchar](max) NULL,
	[Level_formula] [int] NULL,
	[is_delete] [bit] NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_formula] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_formula_sharing]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_formula_sharing](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[formula] [nvarchar](max) NULL,
	[level] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_formula_sharing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_gcm_contract_type]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_gcm_contract_type](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_cate_contract_type_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_gcm_language]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_gcm_language](
	[id] [int] NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_gcm_role_program]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_gcm_role_program](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_cate_gcm_role_program] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_gen_code]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_general_team]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_general_team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[username] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[cate_geography]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_geography](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[name_VN] [nvarchar](500) NULL,
	[Continent] [nvarchar](500) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_geography] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_group_rights]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_group_rights](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](50) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](50) NULL,
	[update_time] [datetime] NULL,
	[description] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_history_debt]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_identity_type]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_identity_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_identity_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_income_capital]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_industry]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_industry_account]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_job_title]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_job_title](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[name_en] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_job_title] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_legal]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_legal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](500) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_legal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_license_type]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_license_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_license_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_limit_relationship]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_limit_relationship](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[name_en] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__cate_lim__3213E83F68F0210A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_location]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[name_en] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[address] [nvarchar](max) NOT NULL,
	[country_id] [int] NOT NULL,
	[province_id] [int] NOT NULL,
	[district_id] [int] NOT NULL,
	[ward_id] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__cate_loc__3213E83FB1BFC1AB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_manager_role]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_manager_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[name_en] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__cate_man__3213E83F13BCF75C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_marital_status]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_marital_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[name_en] [varchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__cate_mar__3213E83F0AEA9B31] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_marketplace]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_marketplace](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[name_en] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__cate_mar__3213E83F257075DC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_occupation]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_occupation](
	[id] [int] NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[name_en] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NULL,
	[create_time] [datetime] NULL,
	[create_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
 CONSTRAINT [PK_cate_occupation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_ooh_networks]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_ooh_networks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_option_symbol]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_option_symbol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[optionrule_sharing_id] [int] NULL,
	[symbol] [nvarchar](50) NULL,
	[target] [float] NULL,
	[percent_sharing_partner] [decimal](18, 2) NULL,
	[formula] [int] NULL,
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
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_optionrule_option]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_optionrule_option](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[percent_sharing_vnwdv] [decimal](18, 2) NULL,
	[percent_sharing_opcop_partner] [decimal](18, 2) NULL,
	[formula] [nvarchar](max) NULL,
	[program_id] [int] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_optionrule_option] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_order_status]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_order_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_order_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_package]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_package](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_package] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_parent_account]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_personal_title]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_platform_channel]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_platform_channel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[platform_id] [int] NULL,
	[channel_id] [int] NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_cate_platform_channel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_post_type]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_post_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_post_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_product_services]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_production_material]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_production_material](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_ranking]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_ranking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_ranking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_rating]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_rating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](50) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](50) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_rating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_rating_customer]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_relationship]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_relationship](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[name_en] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__cate_rel__3213E83F481EEC08] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_religion]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_religion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[name_en] [varchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__cate_rel__3213E83F85190267] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_revenue]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_sale_status]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_sale_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_script]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_script](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_script] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_sex]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_sex](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_sex] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_sharing_internal]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_sharing_internal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_general_id] [int] NOT NULL,
	[vendor_id] [int] NULL,
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
/****** Object:  Table [dbo].[cate_social_team]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_statement]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_status_booking]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_status_booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[name_en] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__cate_sta__3213E83F3A8C6D4B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_sub_group_rights]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_sub_group_rights](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](50) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](50) NULL,
	[update_time] [datetime] NULL,
	[description] [nchar](10) NULL,
	[group_platform_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_sub_region]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_sub_region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[region] [nvarchar](500) NULL,
	[nation_id] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_talent]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_talent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Nick_name] [nvarchar](250) NOT NULL,
	[Talent_code] [nvarchar](50) NULL,
	[Gender] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[birthday] [date] NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[nation_id] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_tax]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_tax](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nchar](10) NULL,
	[is_active] [bit] NOT NULL,
	[value] [float] NULL,
 CONSTRAINT [PK_cate_tax] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_term_payment]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_type_price]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_type_price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_type_price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_type_service]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_unit]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unitname] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_cate_unit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_user_team]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_user_team](
	[id] [int] NOT NULL,
	[name] [nvarchar](250) NULL,
	[description] [nvarchar](250) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](50) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](50) NULL,
	[update_time] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_cate_user_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_vendor_social_group]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_vendor_social_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_vendor_social_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_video_type]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_video_type](
	[id] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[cate_video_type_group]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[cate_vod]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_vod](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_cate_vod] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ipp_cate_mail_template]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ipp_cate_mail_template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[title] [nvarchar](max) NULL,
	[body] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_ipp_cate_mail_template] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ipp_cate_server]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ipp_cate_server](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_ipp_cate_server] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ipp_cate_type_request]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ipp_cate_type_request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_ipp_cate_type_request] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_CATEGORIESTEMPLATEMAIL]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_CATEGORIESTEMPLATEMAIL](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_CATEGORIESTEMPLATEMAIL] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_CATESTATUS]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_CATESTATUS](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Name_en] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](50) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](50) NULL,
	[update_time] [datetime] NULL,
	[OrderNumber] [int] NULL,
	[ocm_percent] [int] NULL,
 CONSTRAINT [PK_IPP_CATESTATUS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_CATETYPEREQUEST]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_CATETYPEREQUEST](
	[Id] [uniqueidentifier] NOT NULL,
	[TypeRequest] [nvarchar](max) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_CATETYPEREQUEST] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_DOMAINSERVER]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_DOMAINSERVER](
	[Id] [uniqueidentifier] NOT NULL,
	[DomainID] [varchar](50) NULL,
	[DomainViolation] [varchar](50) NULL,
	[Server] [varchar](50) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_DOMAINSERVER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_PERMISSIONREVIEW]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_PERMISSIONREVIEW](
	[Id] [uniqueidentifier] NOT NULL,
	[CategoryBroadcastID] [int] NOT NULL,
	[PersonReview] [text] NULL,
	[PersonCheck] [nvarchar](100) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_PERMISSIONREVIEW] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_SERVERSOURCE]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_SERVERSOURCE](
	[Id] [uniqueidentifier] NOT NULL,
	[ServerViolation] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_SERVERSOURCE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_SUBTEAM]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_SUBTEAM](
	[Id] [uniqueidentifier] NOT NULL,
	[SubTeam] [nvarchar](max) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_SUBTEAM] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPP_TEMPLATEMAIL]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPP_TEMPLATEMAIL](
	[Id] [uniqueidentifier] NOT NULL,
	[TemplateMailID] [varchar](50) NULL,
	[SubjectMail] [nvarchar](250) NULL,
	[CateTemplateMailID] [uniqueidentifier] NOT NULL,
	[ContentMail] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[IsDelete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_IPP_TEMPLATEMAIL] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[render_status]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[render_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_render_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session_action]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [dbo].[ssp_market_tns]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ssp_market_tns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ssp_product_categories]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ssp_product_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_time] [datetime] NULL,
	[create_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ssp_product_sub_categories]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ssp_product_sub_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[product_categories_id] [nvarchar](50) NULL,
	[is_active] [bit] NOT NULL,
	[create_time] [datetime] NULL,
	[create_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ssp_targets_tns]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ssp_targets_tns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage_ftp]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage_ftp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[storage_tech] [int] NOT NULL,
	[ftp_host] [varchar](25) NOT NULL,
	[ftp_username] [varchar](250) NOT NULL,
	[ftp_password] [varchar](250) NOT NULL,
	[ftp_port] [int] NOT NULL,
	[ftp_root_path] [nvarchar](500) NOT NULL,
	[is_active] [bit] NOT NULL,
	[check_host] [nvarchar](250) NULL,
	[check_port] [int] NOT NULL,
	[check_api] [varchar](250) NOT NULL,
	[check_folder] [nvarchar](max) NULL,
	[create_time] [datetime] NOT NULL,
	[update_time] [datetime] NULL,
	[create_by] [nvarchar](100) NULL,
	[update_by] [nvarchar](100) NULL,
 CONSTRAINT [PK_storage_ftp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage_tech]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage_tech](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_storage_tech] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:01:46 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:01:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:01:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:01:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:01:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:01:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:01:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:01:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cate_content_category] ADD  CONSTRAINT [DF_cate_content_category_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[cate_content_type] ADD  CONSTRAINT [DF_cate_content_type_type]  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[ipp_cate_mail_template] ADD  CONSTRAINT [DF_ipp_cate_mail_template_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[ipp_cate_server] ADD  CONSTRAINT [DF_ipp_cate_server_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[ipp_cate_type_request] ADD  CONSTRAINT [DF_ipp_cate_type_request_is_active]  DEFAULT ((1)) FOR [is_active]
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
/****** Object:  StoredProcedure [dbo].[getBankAccount]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getBankAccount] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
	--DECLARE @contactGroup3 decimal 
	--set @contactGroup1 = 3

	select bankac.id as 'id', bankac.vendor_id , bankac.bank_id, bankac.bank_account, bankac.owner_account, 
	bankac.is_active, ba.code, ba.[name], ba.[name_en], ba.create_by, ba.update_by, ba.create_time, ba.update_time, ba.gcmid
	from cate_bank_account bankac inner join cate_bank ba on bankac.bank_id = ba.id
	where bankac.is_deleted = 0
	--select *from cate_activity

END
GO
/****** Object:  StoredProcedure [dbo].[getBrandAccount]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getContactReportGroup]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetFilteredContactAccountsWithPermission]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFilteredContactAccountsWithPermission]
    @currentUser NVARCHAR(256)
AS
BEGIN
IF EXISTS (
    SELECT 1
    FROM GCS_USERS.dbo.auth_user u
    CROSS APPLY STRING_SPLIT(u.group_id, ';') AS split
    INNER JOIN GCS_USERS.dbo.auth_group g ON g.id = CAST(split.value AS INT)
    WHERE u.username = @currentUser AND (g.code = 'saleManager' or g.code = 'saleDirector'
										or g.code = 'saleTeam' or g.code = 'accountant' or g.code = 'contact' 
										)
)
BEGIN
    SELECT c.id
	FROM cate_contact_account c
	WHERE c.create_by = @currentUser
		  OR c.create_by IN (SELECT username 
							 FROM v_user_manager 
							 WHERE line_manager = @currentUser)
	
END
ELSE
BEGIN
    select id from cate_contact_account where 1=0
END
end
GO
/****** Object:  StoredProcedure [dbo].[GetFilteredContactActivityWithPermission]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFilteredContactActivityWithPermission]
    @currentUser NVARCHAR(256)
AS
BEGIN
IF EXISTS (
    SELECT 1
    FROM GCS_USERS.dbo.auth_user u
    CROSS APPLY STRING_SPLIT(u.group_id, ';') AS split
    INNER JOIN GCS_USERS.dbo.auth_group g ON g.id = CAST(split.value AS INT)
    WHERE u.username = @currentUser AND (g.code = 'saleManager' or g.code = 'saleDirector'
										or g.code = 'saleTeam' or g.code = 'accountant' or g.code = 'contact' 
										or g.code = 'contactManagement' or g.code = 'managerContactManagement' or g.code = 'head')
)
BEGIN
    SELECT c.id
	FROM cate_activity c
	WHERE c.create_by = @currentUser
		  OR c.create_by IN (SELECT username 
							 FROM v_user_manager 
							 WHERE line_manager = @currentUser)
	
END
ELSE
BEGIN
    select id from cate_activity where 1=0
END
end
GO
/****** Object:  StoredProcedure [dbo].[GetFilteredContactsWithPermission]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFilteredContactsWithPermission]
    @currentUser NVARCHAR(256)
AS
BEGIN
IF EXISTS (
    SELECT 1
    FROM GCS_USERS.dbo.auth_user u
    CROSS APPLY STRING_SPLIT(u.group_id, ';') AS split
    INNER JOIN GCS_USERS.dbo.auth_group g ON g.id = CAST(split.value AS INT)
    WHERE u.username = @currentUser AND (g.code = 'saleManager' or g.code = 'saleDirector'
										or g.code = 'saleTeam' or g.code = 'accountant' or g.code = 'contact' 
										or g.code = 'contactManagement' or g.code = 'managerContactManagement' or g.code ='head')
)
BEGIN
    SELECT c.id
	FROM cate_contact c
	WHERE c.create_by = @currentUser
		  OR EXISTS (SELECT 1 
					 FROM STRING_SPLIT(c.assign_to, ';') 
					 WHERE value = @currentUser)
		  OR c.create_by IN (SELECT username 
							 FROM v_user_manager 
							 WHERE line_manager = @currentUser)
		  OR EXISTS (SELECT 1
					 FROM v_user_manager um
					 JOIN STRING_SPLIT(c.assign_to, ';') AS split_assign_to ON um.username = split_assign_to.value
					 WHERE um.line_manager = @currentUser)
END
ELSE
BEGIN
    select id from cate_contact where 1=0
END
end
GO
/****** Object:  StoredProcedure [dbo].[getIndustryAccount]    Script Date: 4/25/2024 4:01:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getVendorIndustry]    Script Date: 4/25/2024 4:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getVendorIndustry] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select brac.id, brac.vendor_id, brac.industry_id, v.name, i.name as industry_name
	from cate_industry_account brac inner join cate_vendor v on brac.vendor_id = v.id 
	join cate_industry i on i.id = brac.industry_id
	where brac.is_deleted = 0 and v.is_deleted = 0 and v.is_active = 1
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: internal, 2: Customer, 3: suplier, 4: manufature, 5: post corp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_account_detail', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Sale team - 2: PD team' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_general_team', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Income - 2: Qui mô vốn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_income_capital', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Sale team - 2: PD team' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_product_services', @level2type=N'COLUMN',@level2name=N'type_service_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Xếp loại khách hàng - 2: Xếp loại nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_rating_customer', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Điều khoản thanh toán khách hàng - 2: Điều khoản thanh toán nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cate_term_payment', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: not active; 1: active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ipp_cate_mail_template', @level2type=N'COLUMN',@level2name=N'is_active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: not active; 1: active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ipp_cate_server', @level2type=N'COLUMN',@level2name=N'is_active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: not active; 1: active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ipp_cate_type_request', @level2type=N'COLUMN',@level2name=N'is_active'
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
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 277
               Bottom = 136
               Right = 447
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Begin Table = "ccg"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cpcg"
            Begin Extent = 
               Top = 9
               Left = 352
               Bottom = 206
               Right = 619
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cp"
            Begin Extent = 
               Top = 9
               Left = 676
               Bottom = 206
               Right = 914
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_channel_platform_map'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_channel_platform_map'
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
         Begin Table = "c"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 496
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "ca"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 160
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 23
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 9
               Left = 361
               Bottom = 440
               Right = 1420
            End
            DisplayFlags = 280
            TopColumn = 5
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_contact_account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_contact_account'
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
         Begin Table = "ven"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 286
            End
            DisplayFlags = 280
            TopColumn = 38
         End
         Begin Table = "unit"
            Begin Extent = 
               Top = 9
               Left = 343
               Bottom = 206
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ven1"
            Begin Extent = 
               Top = 9
               Left = 622
               Bottom = 206
               Right = 851
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "nat"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 404
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pro"
            Begin Extent = 
               Top = 207
               Left = 336
               Bottom = 404
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dis"
            Begin Extent = 
               Top = 207
               Left = 615
               Bottom = 404
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "war"
            Begin Extent = 
               Top = 405
               Left = 57
               Bottom = 602
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_export_vendor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         End
         Begin Table = "acd_individual"
            Begin Extent = 
               Top = 405
               Left = 336
               Bottom = 602
               Right = 603
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "acd_organizational"
            Begin Extent = 
               Top = 603
               Left = 57
               Bottom = 800
               Right = 342
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "acd_company"
            Begin Extent = 
               Top = 603
               Left = 399
               Bottom = 746
               Right = 621
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_export_vendor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_export_vendor'
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
         Begin Table = "pcg"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 308
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cg"
            Begin Extent = 
               Top = 9
               Left = 365
               Bottom = 206
               Right = 587
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pl"
            Begin Extent = 
               Top = 9
               Left = 644
               Bottom = 206
               Right = 866
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_platform_channelgeneral'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_platform_channelgeneral'
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
         Begin Table = "pdl"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 303
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dl"
            Begin Extent = 
               Top = 9
               Left = 360
               Bottom = 206
               Right = 582
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pl"
            Begin Extent = 
               Top = 9
               Left = 639
               Bottom = 206
               Right = 861
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_platform_delivery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_platform_delivery'
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
         Begin Table = "cv"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 496
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "da"
            Begin Extent = 
               Top = 9
               Left = 472
               Bottom = 152
               Right = 694
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ca"
            Begin Extent = 
               Top = 9
               Left = 751
               Bottom = 152
               Right = 973
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_report_account_activity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_report_account_activity'
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
         Begin Table = "m"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 179
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 678
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_user_manager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_user_manager'
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
         Begin Table = "IPP_VIOLATIONSUNIT (IPP_GCS.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 284
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_violation_unit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_violation_unit'
GO
USE [master]
GO
ALTER DATABASE [GCS_CATEGORY] SET  READ_WRITE 
GO
