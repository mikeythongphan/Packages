USE [master]
GO
/****** Object:  Database [TALENT]    Script Date: 4/25/2024 4:31:20 PM ******/
CREATE DATABASE [TALENT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TALENT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TALENT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TALENT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TALENT_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TALENT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TALENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TALENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TALENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TALENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TALENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TALENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [TALENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TALENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TALENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TALENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TALENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TALENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TALENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TALENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TALENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TALENT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TALENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TALENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TALENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TALENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TALENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TALENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TALENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TALENT] SET RECOVERY FULL 
GO
ALTER DATABASE [TALENT] SET  MULTI_USER 
GO
ALTER DATABASE [TALENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TALENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TALENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TALENT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TALENT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TALENT', N'ON'
GO
ALTER DATABASE [TALENT] SET QUERY_STORE = OFF
GO
USE [TALENT]
GO
/****** Object:  User [VACGROUP\thong.phan.duy]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE USER [VACGROUP\thong.phan.duy] FOR LOGIN [VACGROUP\thong.phan.duy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [usr_bi_team]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE USER [usr_bi_team] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [auth_talentmgt]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE USER [auth_talentmgt] FOR LOGIN [auth_talentmgt] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [VACGROUP\thong.phan.duy]
GO
ALTER ROLE [db_owner] ADD MEMBER [usr_bi_team]
GO
ALTER ROLE [db_datareader] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CMSDEV]
GO
ALTER ROLE [db_owner] ADD MEMBER [auth_talentmgt]
GO
ALTER ROLE [db_datareader] ADD MEMBER [auth_talentmgt]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [auth_talentmgt]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[talent_marketplace]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_marketplace](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[marketplace_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_stagename]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_stagename](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[type] [nvarchar](500) NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_occupation]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_occupation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[occupation_id] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_language]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_language](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_link_img]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_link_img](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[url] [nvarchar](max) NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_booking_detail]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_booking_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NOT NULL,
	[booking_code] [nvarchar](max) NOT NULL,
	[booking_code_reference] [nvarchar](max) NOT NULL,
	[talent_id] [int] NOT NULL,
	[role_grogram_id] [int] NOT NULL,
	[scope_of_work] [nvarchar](max) NULL,
	[unit_id] [int] NOT NULL,
	[unit_price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[gross_amount] [money] NOT NULL,
	[net_amount] [money] NOT NULL,
	[talent_tax_id] [int] NOT NULL,
	[tax_amount] [money] NOT NULL,
	[budget_gross_amount] [money] NOT NULL,
	[budget_net_amount] [money] NOT NULL,
	[step_code] [nvarchar](100) NOT NULL,
	[is_approve_talent] [bit] NULL,
	[note_booking_talent] [nvarchar](max) NULL,
	[manager_contact_info_id] [int] NULL,
	[unit_price_deal] [money] NULL,
	[gross_amount_deal] [money] NULL,
	[net_amount_deal] [money] NULL,
	[is_approve_booking] [bit] NULL,
	[note_booking] [nvarchar](max) NULL,
	[in_charge_by] [nvarchar](100) NULL,
	[in_charge_update_time] [datetime2](7) NULL,
	[status_booking_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__talent_b__3213E83F504CF294] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[black_list]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[black_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[proposed_opcos_id] [int] NOT NULL,
	[relationship_with_group_id] [int] NULL,
	[relationship_with_proposed_opcos_id] [int] NULL,
	[transaction_type_id] [int] NULL,
	[asses_risk_id] [int] NULL,
	[sanction_transaction_type_id] [int] NULL,
	[limited_level_id] [int] NULL,
	[sanction_id] [nvarchar](max) NULL,
	[reasons] [nvarchar](max) NULL,
	[start_date] [datetime2](7) NOT NULL,
	[end_date] [datetime2](7) NULL,
	[note] [nvarchar](max) NULL,
	[is_approve] [bit] NOT NULL,
	[bom_approval_by] [nvarchar](max) NULL,
	[md_approval_by] [nvarchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__black_li__3213E83FF8703F52] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_info]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](500) NOT NULL,
	[code_reference] [varchar](500) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[avatar] [nvarchar](max) NULL,
	[ranking_id] [int] NULL,
	[sex_id] [int] NULL,
	[day_of_birth] [datetime2](7) NULL,
	[country_of_origin_id] [int] NOT NULL,
	[province_of_origin_id] [int] NOT NULL,
	[height] [float] NULL,
	[weight] [float] NULL,
	[email] [nvarchar](500) NULL,
	[phone] [nvarchar](500) NULL,
	[tax_code] [nvarchar](500) NULL,
	[marital_status_id] [int] NULL,
	[ethnie_id] [int] NULL,
	[religion_id] [int] NULL,
	[nationality_id] [int] NOT NULL,
	[address] [nvarchar](max) NULL,
	[country_id] [int] NULL,
	[province_id] [int] NULL,
	[district_id] [int] NULL,
	[ward_id] [int] NULL,
	[place_of_residence] [nvarchar](max) NULL,
	[country_of_residence_id] [int] NULL,
	[province_of_residence_id] [int] NULL,
	[district_of_residence_id] [int] NULL,
	[ward_of_residence_id] [int] NULL,
	[note] [nvarchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_booking]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[booking_code] [nvarchar](max) NOT NULL,
	[booking_code_reference] [nvarchar](max) NOT NULL,
	[start_date] [datetime2](7) NOT NULL,
	[end_date] [datetime2](7) NOT NULL,
	[company_id] [int] NOT NULL,
	[content_consolidate_id] [varchar](255) NOT NULL,
	[location_id] [int] NOT NULL,
	[total_budget] [money] NOT NULL,
	[shooting_plan_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[step_code] [nvarchar](100) NULL,
	[status_booking_id] [int] NOT NULL,
	[is_additional_booking] [bit] NOT NULL,
	[is_approve_booking] [bit] NOT NULL,
	[note_booking] [nvarchar](max) NULL,
	[in_charge_by] [nvarchar](100) NULL,
	[in_charge_update_time] [datetime2](7) NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK__talent_b__3213E83F0BC225F1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_talent_info]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_talent_info] AS WITH total_booking AS
(
SELECT
			a.talent_id,
			SUM(a.quantity) AS total_booking
FROM 
			[TALENT].[dbo].[talent_booking_detail] a WITH (NOLOCK)
LEFT JOIN
			[TALENT].[dbo].[talent_booking] b WITH (NOLOCK)
			ON a.booking_id = b.id
LEFT JOIN
			[GCS_CATEGORY].[dbo].[cate_status_booking] c WITH (NOLOCK)
			ON b.status_booking_id = c.id
WHERE 
		YEAR(b.start_date) = YEAR(GETDATE())
		AND c.name= N'Thành công'
GROUP BY
		a.talent_id
)
SELECT
			a.id,
			a.avatar,
			f.url,
			a.code,
			a.code_reference,
			a.name AS talent_info_name,
			b.name AS stage_name,
			c.name AS name_en,
			d.name AS other_name,
			e.name AS nick_name,
			a.day_of_birth,
			a.country_of_origin_id,
			ae.name AS country_of_origin_name,
			a.province_of_origin_id,
			af.name AS province_of_origin_name,
			a.sex_id,
			g.name AS sex_name,
			a.ethnie_id,
			h.name AS ethnie_name,
			a.nationality_id,
			i.name AS nation_name,
			a.religion_id,
			k.name as religion_name,
			a.address AS address_line,
			a.country_id AS country_line_id,
			j.name AS country_line_name,
			a.province_id AS province_line_id,
			l.name AS province_line_name,
			a.district_id AS district_line_id,
			m.name AS district_line_name,
			a.ward_id AS ward_line_id,
			n.name AS ward_line_name,
			a.place_of_residence AS address_residence,
			a.country_of_residence_id,
			aa.name AS country_residence_name,
			a.province_of_residence_id,
			ab.name AS province_residence_name,
			a.district_of_residence_id,
			ac.name AS district_residence_name,
			a.ward_of_residence_id,
			ad.name AS ward_residence_name,
			a.phone,
			a.email,
			a.tax_code,
			a.height,
			a.weight,
			a.marital_status_id,
			o.name AS marital_status_name,
			p.language_id,
			q.name AS lauguage_name,
			u.occupation_id,
			v.name AS occupation_name,
			a.ranking_id,
			r.name AS ranking_name,
			s.marketplace_id,
			t.name AS marketplace_name,
			w.total_booking,
			y.is_approve AS black_list_is_approve,
			y.reasons AS black_list_reasons,
			a.note
			
FROM
		[TALENT].[dbo].[talent_info] a WITH (NOLOCK)
----------------STAGE NAME------------------
LEFT JOIN
		[TALENT].[dbo].[talent_stagename] b WITH (NOLOCK)
		ON a.id = b.talent_id
		AND b.type = 'stage_name'
----------------- NAME EN-------------------
LEFT JOIN
		[TALENT].[dbo].[talent_stagename] c WITH (NOLOCK)
		ON a.id = c.talent_id
		AND c.type = 'name_en'
-----------------OTHER NAME-------------------
LEFT JOIN
		[TALENT].[dbo].[talent_stagename] d WITH (NOLOCK)
		ON a.id = d.talent_id
		AND d.type = 'other_name'
-----------------NICK NAME-------------------
LEFT JOIN
		[TALENT].[dbo].[talent_stagename] e WITH (NOLOCK)
		ON a.id = e.talent_id
		AND e.type = 'nick_name'
-----------------LINK IMGES-------------------
LEFT JOIN
		[TALENT].[dbo].[talent_link_img] f WITH (NOLOCK)
		ON a.id = f.talent_id
----------------SEX---------------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_sex] g WITH (NOLOCK)
		ON a.sex_id = g.id
----------------ETHNIE------------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_ethnie] h WITH (NOLOCK)
		ON a.ethnie_id = h.id
------------------NAIONALITY------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_nation] i WITH (NOLOCK)
		ON a.nationality_id = i.id
------------------COUNTRY--------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_nation] j WITH (NOLOCK)
		ON a.country_id = j.id
-------------------RELIGION------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_religion] k WITH (NOLOCK)
		ON a.religion_id = k.id
-------------------PROVINCE-----------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_province] l WITH (NOLOCK)
		ON a.province_id = l.id
-------------------DISTRICT----------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_district] m WITH (NOLOCK)
		ON a.district_id = m.id
-----------------WARD-------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_ward] n WITH (NOLOCK)
		ON a.ward_id = n.id
-----------------MARITAL STATUS-----------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_marital_status] o WITH (NOLOCK)
		ON a.marital_status_id = o.id
----------------LANGUAGE------------------------
LEFT JOIN
		[TALENT].[dbo].[talent_language] p WITH (NOLOCK)
		ON a.id = p.talent_id
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_gcm_language] q WITH (NOLOCK)
		ON p.language_id = q.id
-------------------RANKING-------------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_ranking] r WITH (NOLOCK)
		ON a.ranking_id = r.id
-------------------MARKETPLACE---------------------
LEFT JOIN
		[TALENT].[dbo].[talent_marketplace] s WITH (NOLOCK)
		ON a.id = s.talent_id
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_marketplace] t WITH (NOLOCK)
		ON s.marketplace_id = t.id
-----------------OCCUPATION----------------------
LEFT JOIN
		[TALENT].[dbo].[talent_occupation] u WITH (NOLOCK)
		ON a.id = u.talent_id
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_occupation] v WITH (NOLOCK)
		ON u.occupation_id = v.id
-----------------TOTAL BOOKING -----------------
LEFT JOIN
		total_booking w
		ON a.id = w.talent_id
-----------------BLACK LIST--------------------
LEFT JOIN
		[TALENT].[dbo].[black_list] y WITH (NOLOCK)
		ON a.id = y.talent_id
		AND y.is_approve = 1
		AND CAST(GETDATE() AS DATE) BETWEEN CAST(y.start_date AS DATE) AND CAST(y.end_date AS DATE)
		
-----------------ADDRESS RESIDENCE----------------------

------------------COUNTRY--------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_nation] aa WITH (NOLOCK)
		ON a.country_of_residence_id = aa.id

-------------------PROVINCE-----------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_province] ab WITH (NOLOCK)
		ON a.province_of_residence_id = ab.id
-------------------DISTRICT----------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_district] ac WITH (NOLOCK)
		ON a.district_of_residence_id = ac.id
-----------------WARD-------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_ward] ad WITH (NOLOCK)
		ON a.ward_of_residence_id = ad.id
		
		
------------- ADDRESS ORIGIN ------------------------
-----------------COUNTRY--------------------

LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_nation] ae WITH (NOLOCK)
		ON a.country_of_origin_id = ae.id

-----------------PROVINCE--------------------

LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_nation] af WITH (NOLOCK)
		ON a.province_of_origin_id = af.id
GO
/****** Object:  Table [dbo].[social_info]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[social_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[channel_id] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[social_performance]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[social_performance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id_social] [nvarchar](max) NOT NULL,
	[subscribers_followers] [bigint] NOT NULL,
	[likes] [bigint] NULL,
	[post_likes] [bigint] NULL,
	[post_comments] [bigint] NULL,
	[post_shares] [bigint] NULL,
	[video_uploads] [bigint] NULL,
	[video_views] [bigint] NULL,
	[date] [datetime2](7) NOT NULL,
	[run_date] [datetime2](7) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__social_p__3213E83FA1A1AFDE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_social_network]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_social_network] AS WITH channel_performance AS
(
SELECT
			t.channel_id_social,
			t.subscribers_followers,
			t.likes,
			row_number() OVER (PARTITION BY channel_id_social ORDER BY [date] DESC) last_day
FROM
		[TALENT].[dbo].[social_performance] t WITH (NOLOCK)
)
SELECT
		a.id, 
		a.channel_id,
		e.id AS platform_id,
		e.name AS platform_name,
		b.channel_id_social,
		c.code AS channel_code,
		b.channel_name_social,
		b.url AS channel_url,
		f.subscribers_followers,
		f.likes,
		a.talent_id,
		g.name AS talent_name,
		g.code AS talent_code
		
		
FROM
		[TALENT].[dbo].[social_info] a WITH (NOLOCK)
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_channel]  b WITH (NOLOCK)
		ON a.channel_id = b.channel_general_id
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_channel_general] c WITH (NOLOCK)
		ON b.channel_general_id = c.id
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_platform_channel_general] d WITH (NOLOCK)
		ON c.id = d.channel_general_id
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_platform] e WITH (NOLOCK)
		ON d.platform_id = e.id
LEFT JOIN
		channel_performance f
		ON b.channel_id_social = f.channel_id_social
		AND f.last_day = 1
LEFT JOIN
		[TALENT].[dbo].[talent_info] g WITH (NOLOCK)
		ON a.talent_id = g.id
GO
/****** Object:  View [dbo].[v_booking_history]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_booking_history] AS SELECT

			a.id AS booking_id,
			a.content_consolidate_id,
			b.name AS content_name,
			n.talent_id,
			o.name AS talent_name,
			o.code AS talent_code,
			a.shooting_plan_id,
			c.[ShootingSession] AS shooting_session,
			c.[TotalEpisode] AS total_episode,
			c.[FirstShootingDate] AS first_shooting_date,
			c.[EndShootingDate] AS end_shooting_date,
			e.id AS channel_id,
			e.name AS channel_name,
			h.id AS platform_id,
			h.name AS platform_name,
			c.[Producer] AS producer,
			i.id AS location_id,
			i.name AS location_name,
			i.address AS location_address,
			i.country_id,
			j.name AS country_name,
			i.province_id,
			k.name AS province_name,
			i.district_id,
			l.name AS district_name,
			i.ward_id,
			m.name AS ward_name,
			n.role_grogram_id,
			p.name AS role_program_name
			
			
			
			
FROM
		[TALENT].[dbo].[talent_booking] a WITH (NOLOCK)
		
------------------------CONTENT CONSOLIDATE------------------		

LEFT JOIN
		[GCS_CONTENT].[dbo].[ct_content_consolidate] b WITH (NOLOCK)
		ON a.content_consolidate_id = b.id
		
-------------------------SHOOTING PLAN-----------------------

LEFT JOIN
		[PMS_GCS].[dbo].[shooting_plan] c WITH (NOLOCK)
		ON a.shooting_plan_id = b.id
		
		
----------------------CHANNEL & PLATFORM-----------------------
LEFT JOIN
		[PMS_GCS].[dbo].[airing_plan] d WITH (NOLOCK)
		ON b.id = d.[ContentId]

LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_channel] e WITH (NOLOCK)
		ON d.[ChannelId] = e.id

LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_channel_general] f WITH (NOLOCK)
		ON d.[ChannelId] = f.id

LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_platform_channel_general] g
		ON  f.id  = g.channel_general_id


LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_platform] h WITH (NOLOCK)
		ON  g.platform_id  = h.id

---------------------LOCATION-------------------------------
LEFT JOIN 
		[GCS_CATEGORY].[dbo].[cate_location] i WITH (NOLOCK)
		ON  a.location_id  = i.id

------------------COUNTRY--------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_nation] j  WITH (NOLOCK)
		ON i.country_id = j.id
-------------------PROVINCE-----------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_province] k WITH (NOLOCK)
		ON i.province_id = k.id
-------------------DISTRICT----------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_district] l WITH (NOLOCK)
		ON i.district_id = l.id
-----------------WARD-------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_ward] m WITH (NOLOCK)
		ON i.ward_id = m.id
------------------TALENT INFO---------------
LEFT JOIN
		[TALENT].[dbo].[talent_booking_detail] n WITH (NOLOCK)
		ON a.id = n.booking_id
LEFT JOIN
		[TALENT].[dbo].[talent_info] o WITH (NOLOCK)
		ON n.talent_id = o.id
----------------ROLE-----------------------
LEFT JOIN
		[GCS_CATEGORY].[dbo].[cate_gcm_role_program] p
		ON n.role_grogram_id = p.id
GO
/****** Object:  Table [dbo].[booking_limit]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_limit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[year] [int] NOT NULL,
	[unit_price] [money] NULL,
	[number_of_booking] [int] NOT NULL,
	[total_amount] [money] NOT NULL,
	[note] [nvarchar](max) NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_booking_limit]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_booking_limit] AS WITH detail_booking_succeed AS
(
SELECT
			a.talent_id,
			YEAR(b.start_date) year_booked,
			SUM(a.quantity) AS total_booked,
			SUM(a.gross_amount_deal) AS total_amount_booked
FROM 
			[TALENT].[dbo].[talent_booking_detail] a WITH (NOLOCK)
LEFT JOIN
			[TALENT].[dbo].[talent_booking] b WITH (NOLOCK)
			ON a.booking_id = b.id
LEFT JOIN
			[GCS_CATEGORY].[dbo].[cate_status_booking] c WITH (NOLOCK)
			ON b.status_booking_id = c.id
WHERE c.name= N'Thành công'
GROUP BY
		a.talent_id,
		YEAR(b.start_date)
)
SELECT
		a.id, 
		a.[year],
		a.talent_id,
		c.name AS talent_name,
		c.code AS talent_code,
		a.number_of_booking,
		b.total_booked,
		COALESCE(a.number_of_booking,0) - COALESCE(b.total_booked,0) AS remaning_booking,
		a.total_amount,
		b.total_amount_booked,
		COALESCE(a.total_amount,0) - COALESCE(b.total_amount_booked,0) AS remaning_amount_booking,
		a.note
		
FROM
		[TALENT].[dbo].[booking_limit] a WITH (NOLOCK)
LEFT JOIN
		detail_booking_succeed b WITH (NOLOCK)
		ON a.talent_id = b.talent_id
		AND a.[year] = b.year_booked
LEFT JOIN
		[TALENT].[dbo].[talent_info] c WITH (NOLOCK)
		ON a.talent_id = c.id
GO
/****** Object:  Table [dbo].[booking_detail_shift]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_detail_shift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[booking_detail_id] [int] NOT NULL,
	[booking_id] [int] NOT NULL,
	[booking_code] [nvarchar](max) NOT NULL,
	[shift_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [varchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [varchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__booking___3213E83F0F5E5F28] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking_shift]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_shift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NOT NULL,
	[booking_code] [nvarchar](max) NOT NULL,
	[shift_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__booking___3213E83FB3C11731] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[citizen_identify_card]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[citizen_identify_card](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[identity_type_id] [int] NOT NULL,
	[identify_number] [nvarchar](200) NOT NULL,
	[date_of_issue] [datetime2](7) NOT NULL,
	[issuing_authority] [nvarchar](max) NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__citizen___3213E83FA6DBC0C2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manager_contact_info]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manager_contact_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[contact_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[relationship_id] [int] NOT NULL,
	[phone] [nvarchar](500) NOT NULL,
	[start_date] [datetime2](7) NOT NULL,
	[end_date] [datetime2](7) NULL,
	[note] [nvarchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__manager___3213E83F8D25BCDB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rate_card]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rate_card](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ranking_id] [int] NOT NULL,
	[unit_price] [money] NOT NULL,
	[start_date] [datetime2](7) NOT NULL,
	[end_date] [datetime2](7) NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [varchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [varchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session_history]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[entity] [varchar](200) NULL,
	[action] [varchar](100) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NOT NULL,
	[entity_id] [nvarchar](max) NULL,
	[create_by] [varchar](200) NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__session___3213E83F6A59A17A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_agency]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_agency](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[talent_agency_id] [int] NOT NULL,
	[start_date] [datetime2](7) NOT NULL,
	[end_date] [datetime2](7) NULL,
	[is_deleted] [bit] NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK__talent_a__3213E83FA29F455A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_bank]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_bank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[bank_id] [int] NOT NULL,
	[account_name] [nvarchar](max) NOT NULL,
	[account_code] [nvarchar](500) NOT NULL,
	[note] [nvarchar](max) NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_role]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[created_by] [nvarchar](100) NULL,
	[created_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_tax]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_tax](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[talent_id] [int] NOT NULL,
	[cate_tax_id] [int] NOT NULL,
	[from_date] [datetime2](7) NOT NULL,
	[to_date] [datetime2](7) NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime2](7) NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:31:21 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:31:21 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:31:21 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:31:21 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:31:21 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:31:21 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:31:21 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:31:21 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:31:21 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:31:21 PM ******/
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
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:31:21 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_CreatedAt]    Script Date: 4/25/2024 4:31:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_CreatedAt] ON [HangFire].[State]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [TALENT] SET  READ_WRITE 
GO
