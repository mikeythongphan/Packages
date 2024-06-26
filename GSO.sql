USE [master]
GO
/****** Object:  Database [GSO]    Script Date: 4/25/2024 4:16:20 PM ******/
CREATE DATABASE [GSO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GSO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GSO.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GSO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GSO_log.ldf' , SIZE = 335872KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GSO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GSO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GSO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GSO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GSO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GSO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GSO] SET ARITHABORT OFF 
GO
ALTER DATABASE [GSO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GSO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GSO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GSO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GSO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GSO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GSO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GSO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GSO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GSO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GSO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GSO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GSO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GSO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GSO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GSO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GSO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GSO] SET RECOVERY FULL 
GO
ALTER DATABASE [GSO] SET  MULTI_USER 
GO
ALTER DATABASE [GSO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GSO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GSO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GSO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GSO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GSO', N'ON'
GO
ALTER DATABASE [GSO] SET QUERY_STORE = OFF
GO
USE [GSO]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:16:20 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
/****** Object:  Schema [gso]    Script Date: 4/25/2024 4:16:20 PM ******/
CREATE SCHEMA [gso]
GO
/****** Object:  Schema [user_directory]    Script Date: 4/25/2024 4:16:20 PM ******/
CREATE SCHEMA [user_directory]
GO
/****** Object:  Table [gso].[category]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[parent_id] [bigint] NULL,
	[path] [varchar](512) NULL,
	[code] [nvarchar](128) NOT NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[display_order] [int] NULL,
	[meta_data] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[base_type] [int] NULL,
	[options] [int] NULL,
	[is_active] [bit] NOT NULL,
	[is_delete] [bit] NOT NULL,
	[url] [ntext] NULL,
 CONSTRAINT [category_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [gso].[vw_hierarchy_category]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DROP VIEW gso.vw_hierarchy_category

CREATE VIEW [gso].[vw_hierarchy_category] AS
WITH cte(id, path, parent_path, depth, display_order, parent_id) AS (
        SELECT
			category_1.id,
			CAST(concat('.', category_1.id) as nvarchar) AS path,
			CAST(concat(0, right((1000 - category_1.display_order), 4), category_1.id) as nvarchar) AS parent_path,
			0 AS depth,
			0 AS display_order,
			parent_id
		FROM gso.gso.category category_1
		WHERE category_1.parent_id IS NULL

		UNION ALL

        SELECT
			category_1.id,
			CAST(concat(cte_1.path, '.', category_1.id) as nvarchar) AS path,
			CAST(concat(cte_1.parent_path, cte_1.depth, right((1000 - category_1.display_order), 4), category_1.id) as nvarchar) AS parent_path,
			cte_1.depth + 1 AS depth,
			category_1.display_order,
			category_1.parent_id
		FROM gso.gso.category category_1
			join cte cte_1 on category_1.parent_id = cte_1.id
		)

SELECT category.id,
    category.parent_id,
    category.path,
    category.code,
    category.name,
    category.description,
    category.display_order,
    category.meta_data,
    category.uid,
    category.created_at,
    category.updated_at,
    category.created_by,
    category.updated_by,
    category.options,
    category.base_type,
    category.is_active,
    category.is_delete,
    cte.depth,
    concat(cte.path, '.') AS hierarchy_path,
	cte.parent_path
   FROM cte
     JOIN gso.gso.category ON category.id = cte.id
	--ORDER BY cte.parent_path, category.id
  
GO
/****** Object:  Table [gso].[contact_form]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[contact_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](250) NOT NULL,
	[email] [nvarchar](250) NULL,
	[phone] [nvarchar](50) NULL,
	[subject] [nvarchar](250) NULL,
	[message] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[company] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[extra] [ntext] NULL,
	[created_by] [int] NULL,
	[content_uid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_contact_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[content]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[short_description] [ntext] NULL,
	[display_order] [int] NULL,
	[type] [int] NULL,
	[meta_data] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[options] [int] NULL,
	[status] [int] NULL,
	[prioritized] [bit] NULL,
	[viewed] [int] NULL,
 CONSTRAINT [content_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [gso].[vw_contact_report]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DROP VIEW gso.vw_customer_report

CREATE VIEW [gso].[vw_contact_report] AS
	WITH cte([date],create_date, total, content_uid, title) AS (
		SELECT CAST(MONTH(f.[created_at]) AS VARCHAR(2)) + '-' + CAST(YEAR(f.[created_at]) AS VARCHAR(4)) AS [date],	
			CAST((CAST(YEAR(f.[created_at]) AS VARCHAR(4)) + '-' + CAST(MONTH(f.[created_at]) AS VARCHAR(2)) + '- 01') AS date) as create_date,
			count(f.id) as total,
			content_uid,
			COALESCE(JSON_VALUE(CAST(c.name as nvarchar(max)),'$.vi'), 'About us') AS title
		FROM [gso].[gso].[contact_form] f
		LEFT JOIN [gso].[content] c ON c.uid = f.content_uid
		GROUP BY CAST(MONTH(f.[created_at]) AS VARCHAR(2)) + '-' + CAST(YEAR(f.[created_at]) AS VARCHAR(4)), CAST((CAST(YEAR(f.[created_at]) AS VARCHAR(4)) + '-' + CAST(MONTH(f.[created_at]) AS VARCHAR(2)) + '- 01') AS date), f.content_uid,JSON_VALUE(CAST(c.name as nvarchar(max)),'$.vi')
	  )

  SELECT cte.[date],cte.create_date, cte.total, cte.content_uid, cte.title
  FROM cte  
GO
/****** Object:  Table [gso].[user_info]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[user_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[dobj_id] [int] NOT NULL,
	[external_id] [int] NULL,
	[email] [nvarchar](128) NOT NULL,
	[tokens] [ntext] NULL,
	[phone] [nvarchar](200) NULL,
	[display_name] [nvarchar](200) NOT NULL,
	[extra] [nvarchar](2040) NULL,
	[language] [nvarchar](20) NULL,
	[is_enable_2fa] [bit] NOT NULL,
	[key_2fa] [nvarchar](128) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[devices] [ntext] NULL,
	[type] [tinyint] NOT NULL,
	[status] [tinyint] NOT NULL,
	[external_code] [nvarchar](50) NULL,
	[province_id] [bigint] NULL,
	[district_id] [bigint] NULL,
	[ward_id] [bigint] NULL,
	[company_address] [nvarchar](256) NULL,
	[company_id] [bigint] NULL,
	[full_name] [nvarchar](200) NULL,
	[company_name] [nvarchar](256) NULL,
	[company_tax_number] [nvarchar](256) NULL,
	[business_sector_ids] [ntext] NULL,
 CONSTRAINT [user_info_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [gso].[vw_customer_report]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--DROP VIEW gso.vw_customer_report

CREATE VIEW [gso].[vw_customer_report] AS
	WITH cte([date],create_date, total, pending, active,locked) AS (
		SELECT CAST(MONTH([created_at]) AS VARCHAR(2)) + '-' + CAST(YEAR([created_at]) AS VARCHAR(4)) AS [date],	
			CAST((CAST(YEAR([created_at]) AS VARCHAR(4)) + '-' + CAST(MONTH([created_at]) AS VARCHAR(2)) + '- 01') AS date) as create_date,
			sum(Case when status in (0,1,3) then 1 else 0 end) as total,
			sum(Case when status = 0 then 1 else 0 end) as pending,
			sum(Case when status = 1 then 1 else 0 end) as active,
			sum(Case when status = 3 then 1 else 0 end) as locked
		FROM [gso].[gso].[user_info]
		GROUP BY CAST(MONTH([created_at]) AS VARCHAR(2)) + '-' + CAST(YEAR([created_at]) AS VARCHAR(4)), CAST((CAST(YEAR([created_at]) AS VARCHAR(4)) + '-' + CAST(MONTH([created_at]) AS VARCHAR(2)) + '- 01') AS date)
	  )

  SELECT cte.[date],cte.create_date, cte.total, cte.pending, cte.active,cte.locked
  FROM cte  
GO
/****** Object:  Table [gso].[actor]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[actor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[options] [int] NULL,
	[extra] [ntext] NULL,
 CONSTRAINT [actor_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[actor_content]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[actor_content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[actor_id] [int] NOT NULL,
	[content_id] [bigint] NOT NULL,
	[options] [int] NULL,
 CONSTRAINT [actor_content_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[actor_reference]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[actor_reference](
	[content_uid] [uniqueidentifier] NULL,
	[actor_uid] [uniqueidentifier] NULL,
	[actor_role] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[actor_roles]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[actor_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[options] [int] NULL,
	[extra] [ntext] NULL,
 CONSTRAINT [actor_roles_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[announcement]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[announcement](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[type] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[title] [nvarchar](2048) NULL,
	[content] [nvarchar](2048) NULL,
	[scheduled_at] [datetime] NULL,
	[is_sent] [bit] NULL,
	[active] [bit] NULL,
 CONSTRAINT [announcement_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[announcement_group]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[announcement_group](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[announcement_id] [int] NULL,
	[group_id] [int] NULL,
 CONSTRAINT [announcement_group_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [announcement_group_ukey] UNIQUE NONCLUSTERED 
(
	[announcement_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[announcement_user]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[announcement_user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[announcement_id] [int] NULL,
	[user_info_id] [int] NULL,
	[is_read] [bit] NULL,
	[sent_at] [datetime] NULL,
 CONSTRAINT [announcement_user_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [announcement_user_ukey] UNIQUE NONCLUSTERED 
(
	[announcement_id] ASC,
	[user_info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[banner]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[code] [nvarchar](128) NOT NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[extra] [ntext] NULL,
	[is_active] [bit] NOT NULL,
	[url] [nvarchar](1024) NOT NULL,
 CONSTRAINT [banner_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[brand]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[options] [int] NULL,
	[extra] [ntext] NULL,
 CONSTRAINT [brand_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[business_sector]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[business_sector](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [ntext] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [business_sector_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[category_content]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[category_content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[category_id] [bigint] NOT NULL,
	[content_uid] [uniqueidentifier] NOT NULL,
	[display_order] [int] NULL,
	[options] [int] NULL,
 CONSTRAINT [category_content_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[channel]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[channel](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [ntext] NULL,
	[is_active] [bit] NULL,
	[extra] [ntext] NULL,
 CONSTRAINT [channel_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[company]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[company](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[short_name] [nvarchar](50) NOT NULL,
	[name] [ntext] NULL,
	[address] [ntext] NULL,
	[tax_code] [nvarchar](50) NULL,
	[business_code] [nvarchar](50) NULL,
	[tel] [nvarchar](50) NULL,
	[representative] [nvarchar](200) NULL,
	[group_name] [nvarchar](200) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [bigint] NULL,
	[updated_by] [bigint] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[short_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[connected_service_reference]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[connected_service_reference](
	[service_uid] [uniqueidentifier] NULL,
	[connected_uid] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[container_element]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[container_element](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[name] [nvarchar](128) NOT NULL,
	[visible] [bit] NULL,
	[display_order] [int] NULL,
	[visual_data] [ntext] NULL,
	[platform] [int] NULL,
	[parent_uid] [uniqueidentifier] NULL,
	[type] [int] NULL,
 CONSTRAINT [container_element_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[content_attribute]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[content_attribute](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content_uid] [uniqueidentifier] NOT NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[display_order] [int] NULL,
 CONSTRAINT [content_attribute_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[content_reference]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[content_reference](
	[content_uid] [uniqueidentifier] NOT NULL,
	[element_uid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_show_element_ad_detail] PRIMARY KEY CLUSTERED 
(
	[content_uid] ASC,
	[element_uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[crossed_service_reference]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[crossed_service_reference](
	[content_uid] [uniqueidentifier] NULL,
	[crossed_service_uid] [uniqueidentifier] NULL,
	[out_of_stock] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[demo_content]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[demo_content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[short_description] [ntext] NULL,
	[display_order] [int] NULL,
	[type] [int] NULL,
	[meta_data] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[options] [int] NULL,
	[status] [int] NULL,
	[extra] [ntext] NULL,
	[content_uid] [uniqueidentifier] NULL,
 CONSTRAINT [demo_content_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[editor_media]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[editor_media](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[item_uid] [uniqueidentifier] NOT NULL,
	[media_type] [tinyint] NOT NULL,
	[title] [nvarchar](1024) NOT NULL,
	[image_url] [nvarchar](256) NOT NULL,
	[thumbnail_url] [nvarchar](256) NOT NULL,
	[display_order] [int] NOT NULL,
	[position] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[extra] [nvarchar](2040) NULL,
	[language] [nvarchar](5) NOT NULL,
 CONSTRAINT [editor_media_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[email_template]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[email_template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](128) NOT NULL,
	[type] [int] NOT NULL,
	[subject] [nvarchar](1024) NOT NULL,
	[body] [ntext] NOT NULL,
	[body_default] [ntext] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [int] NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_email_template] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[friendly_url]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[friendly_url](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](512) NOT NULL,
	[page_id] [int] NOT NULL,
	[extra] [nvarchar](2000) NOT NULL,
 CONSTRAINT [friendly_url_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[group_info]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[group_info](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[type] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [ntext] NULL,
	[sql_query_user] [ntext] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [group_info_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[html_content]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[html_content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[short_description] [ntext] NULL,
	[display_order] [int] NULL,
	[type] [int] NULL,
	[meta_data] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[options] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [html_content_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[location]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[location](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[name] [ntext] NOT NULL,
	[parent_id] [bigint] NULL,
	[original_id] [bigint] NULL,
	[type] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [bigint] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [bigint] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[media]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[media](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[item_uid] [uniqueidentifier] NOT NULL,
	[media_type] [tinyint] NOT NULL,
	[title] [nvarchar](1024) NOT NULL,
	[image_url] [nvarchar](256) NOT NULL,
	[thumbnail_url] [nvarchar](256) NOT NULL,
	[display_order] [int] NOT NULL,
	[position] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[extra] [nvarchar](2040) NULL,
	[language] [nvarchar](5) NOT NULL,
 CONSTRAINT [media_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[page]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[page](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[name] [nvarchar](128) NOT NULL,
	[visible] [bit] NULL,
	[display_order] [int] NULL,
	[visual_data] [ntext] NULL,
	[platform] [int] NULL,
	[parent_uid] [uniqueidentifier] NULL,
	[page_template_id] [int] NULL,
	[type] [int] NULL,
 CONSTRAINT [page_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[page_template]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[page_template](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[name] [nvarchar](128) NOT NULL,
	[visible] [bit] NULL,
	[display_order] [int] NULL,
	[visual_data] [ntext] NULL,
	[platform] [int] NULL,
	[parent_uid] [uniqueidentifier] NULL,
	[type] [int] NULL,
 CONSTRAINT [page_template_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[platform]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[platform](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [ntext] NULL,
	[channel] [ntext] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [platform_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[post]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[short_description] [ntext] NULL,
	[display_order] [int] NULL,
	[type] [int] NULL,
	[meta_data] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[options] [int] NULL,
	[status] [int] NULL,
	[category_id] [int] NULL,
	[open_new_page] [bit] NULL,
	[need_approval] [bit] NULL,
	[display_from] [datetime] NULL,
	[display_to] [datetime] NULL,
	[auth_required] [bit] NULL,
 CONSTRAINT [post_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[product_type]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[product_type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [ntext] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [product_type_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[purchase_variant_content]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[purchase_variant_content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[user_id] [int] NULL,
	[note] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[status] [int] NULL,
	[extra] [ntext] NULL,
 CONSTRAINT [purchase_variant_content_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[purchase_variant_detail]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[purchase_variant_detail](
	[purchase_variant_id] [bigint] NOT NULL,
	[variant_content_id] [bigint] NOT NULL,
	[content_uid] [uniqueidentifier] NOT NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_purchase_variant_detail] PRIMARY KEY CLUSTERED 
(
	[purchase_variant_id] ASC,
	[variant_content_id] ASC,
	[content_uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[purchase_variant_history]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[purchase_variant_history](
	[purchase_variant_id] [bigint] NOT NULL,
	[date_time] [datetime] NOT NULL,
	[description] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[raw_import]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[raw_import](
	[col1] [nvarchar](2040) NOT NULL,
	[col2] [nvarchar](2040) NOT NULL,
	[col3] [nvarchar](2040) NOT NULL,
	[col4] [nvarchar](2040) NOT NULL,
	[col5] [nvarchar](2040) NOT NULL,
	[extra] [nvarchar](2040) NOT NULL,
	[created_by] [int] NOT NULL,
	[type] [int] NOT NULL,
	[created_at] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[related_service_reference]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[related_service_reference](
	[content_uid] [uniqueidentifier] NULL,
	[related_service_uid] [uniqueidentifier] NULL,
	[out_of_stock] [bit] NULL,
	[relation_type] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[service_content]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[service_content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[short_description] [ntext] NULL,
	[display_order] [int] NULL,
	[type] [int] NULL,
	[meta_data] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[options] [int] NULL,
	[status] [int] NULL,
	[extra] [ntext] NULL,
	[prioritized] [bit] NULL,
 CONSTRAINT [service_content_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[service_reference]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[service_reference](
	[service_uid] [uniqueidentifier] NOT NULL,
	[content_uid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_service_content_ref] PRIMARY KEY CLUSTERED 
(
	[service_uid] ASC,
	[content_uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[setting]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[setting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](256) NOT NULL,
	[display_name] [nvarchar](512) NOT NULL,
	[description] [nvarchar](2040) NULL,
	[data_type] [nvarchar](5) NOT NULL,
	[value] [nvarchar](2040) NOT NULL,
	[owner_id] [nvarchar](30) NOT NULL,
 CONSTRAINT [setting_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[show_content]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[show_content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](128) NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[short_description] [ntext] NULL,
	[display_order] [int] NULL,
	[type] [int] NULL,
	[meta_data] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[options] [int] NULL,
	[status] [int] NULL,
	[extra] [ntext] NULL,
	[production_year] [int] NULL,
	[show_type] [int] NULL,
	[prioritized] [bit] NULL,
 CONSTRAINT [show_content_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[sync_log]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[sync_log](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[name] [nvarchar](256) NULL,
	[type] [int] NULL,
	[status] [int] NULL,
	[payload] [nvarchar](max) NULL,
	[message] [nvarchar](2040) NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[tracking_history]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[tracking_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[name] [ntext] NULL,
	[request] [ntext] NULL,
	[status] [int] NULL,
	[message] [nvarchar](1) NULL,
 CONSTRAINT [tracking_history_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[ui_element]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[ui_element](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[name] [nvarchar](128) NOT NULL,
	[display_order] [int] NULL,
	[visual_data] [ntext] NULL,
	[platform] [int] NULL,
	[parent_uid] [uniqueidentifier] NULL,
	[type] [int] NULL,
	[visible] [bit] NULL,
 CONSTRAINT [ui_element_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[unique_url]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[unique_url](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item_uid] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](128) NOT NULL,
	[parsed_url] [nvarchar](512) NULL,
 CONSTRAINT [unique_url_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[user_content_group]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[user_content_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[dobj_id] [int] NOT NULL,
	[value] [ntext] NULL,
 CONSTRAINT [PK_user_content_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[variant_content]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[variant_content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](128) NOT NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[short_description] [ntext] NULL,
	[display_order] [int] NULL,
	[type] [int] NULL,
	[variant_type] [int] NULL,
	[meta_data] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[options] [int] NULL,
	[status] [int] NULL,
	[extra] [ntext] NULL,
	[content_uid] [uniqueidentifier] NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [variant_content_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[variant_content_reference]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[variant_content_reference](
	[package_id] [bigint] NOT NULL,
	[element_id] [bigint] NOT NULL,
 CONSTRAINT [PK_advertisement_pack_detail] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC,
	[element_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gso].[widget]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[widget](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[code] [nvarchar](128) NOT NULL,
	[name] [nvarchar](256) NULL,
	[type] [int] NULL,
	[visual_editor] [ntext] NULL,
 CONSTRAINT [widget_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [gso].[widget_element]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gso].[widget_element](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL,
	[name] [nvarchar](128) NOT NULL,
	[visible] [bit] NULL,
	[display_order] [int] NULL,
	[visual_data] [ntext] NULL,
	[platform] [int] NULL,
	[parent_uid] [uniqueidentifier] NULL,
	[widget_uid] [uniqueidentifier] NULL,
	[layout_data] [ntext] NULL,
	[type] [int] NULL,
 CONSTRAINT [widget_element_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [user_directory].[dobj]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_directory].[dobj](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uuid] [uniqueidentifier] NOT NULL,
	[parent_id] [int] NULL,
	[classes] [varchar](256) NULL,
	[name] [nvarchar](512) NOT NULL,
	[display_name] [nvarchar](512) NOT NULL,
	[description] [ntext] NOT NULL,
	[attributes] [nvarchar](2024) NOT NULL,
	[path] [varchar](1024) NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [dobj_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [user_directory].[dobj_reference]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_directory].[dobj_reference](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[attribute] [nvarchar](256) NOT NULL,
	[dobj_id] [int] NOT NULL,
	[ref_dobj_id] [int] NOT NULL,
	[value] [ntext] NULL,
 CONSTRAINT [dobj_reference_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [user_directory].[secure_storage]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_directory].[secure_storage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dobj_id] [int] NOT NULL,
	[attribute] [nvarchar](256) NOT NULL,
	[algorithm] [nvarchar](20) NOT NULL,
	[salt] [nvarchar](10) NOT NULL,
	[value] [varbinary](2048) NOT NULL,
 CONSTRAINT [secure_storage_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [gso].[announcement_user] ADD  DEFAULT ((0)) FOR [is_read]
GO
ALTER TABLE [gso].[banner] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [gso].[business_sector] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [gso].[category] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [gso].[category] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [gso].[channel] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [gso].[company] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [gso].[group_info] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [gso].[location] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [gso].[platform] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [gso].[product_type] ADD  DEFAULT ((1)) FOR [is_active]
GO
/****** Object:  StoredProcedure [dbo].[clone_news_page]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[clone_news_page](
	-- Add the parameters for the stored procedure here
	@uid uniqueIdentifier	
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @code nvarchar(256);
	DECLARE @url nvarchar(max);
	DECLARE @page_uid uniqueIdentifier;
	DECLARE @page_id int;
	DECLARE @container_id uniqueIdentifier;
	DECLARE @widget_id uniqueIdentifier;
	DECLARE @category_id int;
	DECLARE @friendly_url nvarchar(max);
	DECLARE @old_friendly_url nvarchar(256);

	DECLARE @unique_url_id uniqueIdentifier;
	DECLARE @friendly_url_id int;
    -- Insert statements for procedure here	
	SELECT @category_id = id,@code = code, @url = url
    FROM [gso].[category]
    WHERE uid = @uid

	IF(NOT EXISTS(SELECT 1 FROM gso.page WHERE name = @code))
	BEGIN
		SET @page_uid = NEWID();
		INSERT [gso].[page] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [page_template_id], [type]) VALUES (@page_uid, N''+@code+'', 1, 0, N'{"class":"news-list"}', 1, NULL, NULL, 3);
		SET @page_id = SCOPE_IDENTITY();

		SET @container_id = NEWID();
		SET @widget_id = NEWID();
		
		
		-- created template
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@container_id, @code + N'-container', 0, N'{"class":"main news-list-container"}', 1, @page_uid, 2, 1)
				
		INSERT [gso].[widget_element] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [widget_uid], [layout_data], [type]) VALUES (@widget_id, @code, 1, 0, N'{"class":"newslist","categoryId":'+  convert(nvarchar(10), @category_id) +',"ids": "", "top": 3,"bottom":3,"showRelated":true, "page":0,"pageSize":10}', 1, @container_id, N'5CCD9033-C641-42F8-AF8C-40DDA1EE699B', N'{"templateUrl":"news-list"}', 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@widget_id,@code, 0, N'{"class":"newslist","categoryId":'+  convert(nvarchar(10), @category_id) +',"ids": "", "top": 3,"bottom":3,"showRelated":true, "page":0,"pageSize":10}', 1, @container_id, 1, 1)
		-- create unique_url
		IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
			BEGIN
				SET @unique_url_id = NEWID();
				INSERT INTO [gso].[unique_url]
				   ([item_uid]
				   ,[code]
				   ,[parsed_url])
				 VALUES
					   (@unique_url_id
					   ,@code
					   ,@code);
			END
		ELSE
			BEGIN
				SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
			END
		
		SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
		
		SELECT @friendly_url_id = id, @old_friendly_url = url
			FROM gso.friendly_url
			WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'		
		IF @old_friendly_url is NULL or @friendly_url_id is NULL
			BEGIN						
				INSERT INTO gso.friendly_url(url,page_id, extra) 
				VALUES (@friendly_url ,@page_id, 
				JSON_QUERY(CONCAT('{"class":"success-stories"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
			END
		ELSE
			BEGIN			
				UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
			END
	END
	ELSE		
		BEGIN
			SET @page_id = (SELECT id FROM gso.page WHERE name = @code);
			print @page_id;
			IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
				BEGIN
					SET @unique_url_id = NEWID();
					INSERT INTO [gso].[unique_url]
					   ([item_uid]
					   ,[code]
					   ,[parsed_url])
					 VALUES
						   (@unique_url_id
						   ,@code
						   ,@code);
				END
			ELSE
				BEGIN
					SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
				END			
			print @unique_url_id;
			SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
			--print @friendly_url;			
			SELECT @friendly_url_id = id, @old_friendly_url = [url]
				FROM gso.friendly_url
				WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'				
			IF @old_friendly_url is NULL or @friendly_url_id is NULL
				BEGIN
					INSERT INTO gso.friendly_url(url,page_id, extra) 
					VALUES (@friendly_url ,@page_id, 
					JSON_QUERY(CONCAT('{"class":"success-stories"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
				END
			ELSE
				BEGIN			
					UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
				END		
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[clone_ooh_highlight_page]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[clone_ooh_highlight_page](
	-- Add the parameters for the stored procedure here
	@uid uniqueIdentifier	
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @code nvarchar(256);
	DECLARE @url nvarchar(max);
	DECLARE @page_uid uniqueIdentifier;
	DECLARE @page_id int;
	DECLARE @container_id uniqueIdentifier;
	DECLARE @widget_id uniqueIdentifier;
	DECLARE @category_id int;
	DECLARE @friendly_url nvarchar(max);
	DECLARE @old_friendly_url nvarchar(256);

	DECLARE @unique_url_id uniqueIdentifier;
	DECLARE @friendly_url_id int;
    -- Insert statements for procedure here	
	SELECT @category_id = id,@code = code, @url = url
    FROM [gso].[category]
    WHERE uid = @uid

	IF(NOT EXISTS(SELECT 1 FROM gso.page WHERE name = @code))
	BEGIN
		SET @page_uid = NEWID();
		INSERT [gso].[page] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [page_template_id], [type]) VALUES (@page_uid, N''+@code+'', 1, 0, N'{"class":"category-media"}', 1, NULL, NULL, 3);
		SET @page_id = SCOPE_IDENTITY();

		SET @container_id = NEWID();
		SET @widget_id = NEWID();
		
		-- created template
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@container_id, @code + N'-container', 0, N'{"class":"widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f888', N'Services-container', 0, N'{"class":"service-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f777', N'news-container', 0, N'{"class":"news-container widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f666', N'footer-container', 0, N'{"class":"footer-banner-container widget-container"}', 1, @page_uid, 2, 1)
				
		INSERT [gso].[widget_element] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [widget_uid], [layout_data], [type]) VALUES (@widget_id, @code, 1, 0, N'{"class":"highligh-list","categoryId":'+  convert(nvarchar(10), @category_id) +',"ids": "", "top": 3,"bottom":3,"showRelated":false, "page":0,"pageSize":10}', 1, @container_id, N'5CCD9033-C641-42F8-AF8C-40DDA1EE699B', N'{"templateUrl":"ooh-highlight"}', 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@widget_id,@code, 0, N'{"class":"highligh-list","categoryId":'+  convert(nvarchar(10), @category_id) +',"ids": "", "top": 3,"bottom":6,"showRelated":false, "page":0,"pageSize":10}', 1, @container_id, 1, 1)
		-- create unique_url
		IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
			BEGIN
				SET @unique_url_id = NEWID();
				INSERT INTO [gso].[unique_url]
				   ([item_uid]
				   ,[code]
				   ,[parsed_url])
				 VALUES
					   (@unique_url_id
					   ,@code
					   ,@code);
			END
		ELSE
			BEGIN
				SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
			END
		
		SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
		
		SELECT @friendly_url_id = id, @old_friendly_url = url
			FROM gso.friendly_url
			WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'		
		IF @old_friendly_url is NULL or @friendly_url_id is NULL
			BEGIN						
				INSERT INTO gso.friendly_url(url,page_id, extra) 
				VALUES (@friendly_url ,@page_id, 
				JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
			END
		ELSE
			BEGIN			
				UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
			END
	END
	ELSE		
		BEGIN
			SET @page_id = (SELECT id FROM gso.page WHERE name = @code);
			print @page_id;
			IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
				BEGIN
					SET @unique_url_id = NEWID();
					INSERT INTO [gso].[unique_url]
					   ([item_uid]
					   ,[code]
					   ,[parsed_url])
					 VALUES
						   (@unique_url_id
						   ,@code
						   ,@code);
				END
			ELSE
				BEGIN
					SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
				END			
			print @unique_url_id;
			SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
			--print @friendly_url;			
			SELECT @friendly_url_id = id, @old_friendly_url = [url]
				FROM gso.friendly_url
				WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'				
			IF @old_friendly_url is NULL or @friendly_url_id is NULL
				BEGIN
					INSERT INTO gso.friendly_url(url,page_id, extra) 
					VALUES (@friendly_url ,@page_id, 
					JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
				END
			ELSE
				BEGIN			
					UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
				END		
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[clone_ooh_page]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[clone_ooh_page](
	-- Add the parameters for the stored procedure here
	@uid uniqueIdentifier	
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @code nvarchar(256);
	DECLARE @url nvarchar(max);
	DECLARE @page_uid uniqueIdentifier;
	DECLARE @page_id int;
	DECLARE @container_id uniqueIdentifier;
	DECLARE @widget_id uniqueIdentifier;
	DECLARE @category_id int;
	DECLARE @friendly_url nvarchar(max);
	DECLARE @old_friendly_url nvarchar(256);

	DECLARE @unique_url_id uniqueIdentifier;
	DECLARE @friendly_url_id int;
    -- Insert statements for procedure here	
	SELECT @category_id = id,@code = code, @url = url
    FROM [gso].[category]
    WHERE uid = @uid

	IF(NOT EXISTS(SELECT 1 FROM gso.page WHERE name = @code))
	BEGIN
		SET @page_uid = NEWID();
		INSERT [gso].[page] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [page_template_id], [type]) VALUES (@page_uid, N''+@code+'', 1, 0, N'{"class":"category-media"}', 1, NULL, NULL, 3);
		SET @page_id = SCOPE_IDENTITY();

		SET @container_id = NEWID();
		SET @widget_id = NEWID();
		
		-- created template
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@container_id, @code + N'-container', 0, N'{"class":"widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f888', N'Services-container', 0, N'{"class":"service-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f777', N'news-container', 0, N'{"class":"news-container widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f666', N'footer-container', 0, N'{"class":"footer-banner-container widget-container"}', 1, @page_uid, 2, 1)
				
		INSERT [gso].[widget_element] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [widget_uid], [layout_data], [type]) VALUES (@widget_id, @code, 1, 0, N'{"class":"main","categoryId":'+  convert(nvarchar(10), @category_id) +',"hierarchy":"true","ids":"","loadContent":"true"}', 1, @container_id, N'522b1976-280c-4258-9c08-50f5a49cd555', N'{"templateUrl":"ooh-template"}', 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@widget_id,@code, 0, N'{"class":"main","categoryId":'+  convert(nvarchar(10), @category_id) +',"hierarchy":"true","ids":"","loadContent":"true"}', 1, @container_id, 1, 1)
		-- create unique_url
		IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
			BEGIN
				SET @unique_url_id = NEWID();
				INSERT INTO [gso].[unique_url]
				   ([item_uid]
				   ,[code]
				   ,[parsed_url])
				 VALUES
					   (@unique_url_id
					   ,@code
					   ,@code);
			END
		ELSE
			BEGIN
				SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
			END
		
		SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
		
		SELECT @friendly_url_id = id, @old_friendly_url = url
			FROM gso.friendly_url
			WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'		
		IF @old_friendly_url is NULL or @friendly_url_id is NULL
			BEGIN						
				INSERT INTO gso.friendly_url(url,page_id, extra) 
				VALUES (@friendly_url ,@page_id, 
				JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
			END
		ELSE
			BEGIN			
				UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
			END
	END
	ELSE		
		BEGIN
			SET @page_id = (SELECT id FROM gso.page WHERE name = @code);
			print @page_id;
			IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
				BEGIN
					SET @unique_url_id = NEWID();
					INSERT INTO [gso].[unique_url]
					   ([item_uid]
					   ,[code]
					   ,[parsed_url])
					 VALUES
						   (@unique_url_id
						   ,@code
						   ,@code);
				END
			ELSE
				BEGIN
					SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
				END			
			print @unique_url_id;
			SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
			--print @friendly_url;			
			SELECT @friendly_url_id = id, @old_friendly_url = [url]
				FROM gso.friendly_url
				WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'				
			IF @old_friendly_url is NULL or @friendly_url_id is NULL
				BEGIN
					INSERT INTO gso.friendly_url(url,page_id, extra) 
					VALUES (@friendly_url ,@page_id, 
					JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
				END
			ELSE
				BEGIN			
					UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
				END		
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[clone_ooh_passport_page]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[clone_ooh_passport_page](
	-- Add the parameters for the stored procedure here
	@uid uniqueIdentifier	
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @code nvarchar(256);
	DECLARE @url nvarchar(max);
	DECLARE @page_uid uniqueIdentifier;
	DECLARE @page_id int;
	DECLARE @container_id uniqueIdentifier;
	DECLARE @widget_id uniqueIdentifier;
	DECLARE @category_id int;
	DECLARE @friendly_url nvarchar(max);
	DECLARE @old_friendly_url nvarchar(256);

	DECLARE @unique_url_id uniqueIdentifier;
	DECLARE @friendly_url_id int;
    -- Insert statements for procedure here	
	SELECT @category_id = id,@code = code, @url = url
    FROM [gso].[category]
    WHERE uid = @uid

	IF(NOT EXISTS(SELECT 1 FROM gso.page WHERE name = @code))
	BEGIN
		SET @page_uid = NEWID();
		INSERT [gso].[page] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [page_template_id], [type]) VALUES (@page_uid, N''+@code+'', 1, 0, N'{"class":"category-media"}', 1, NULL, NULL, 3);
		SET @page_id = SCOPE_IDENTITY();

		SET @container_id = NEWID();
		SET @widget_id = NEWID();
		
		-- created template
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@container_id, @code + N'-container', 0, N'{"class":"widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f888', N'Services-container', 0, N'{"class":"service-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f777', N'news-container', 0, N'{"class":"news-container widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f666', N'footer-container', 0, N'{"class":"footer-banner-container widget-container"}', 1, @page_uid, 2, 1)
				
		INSERT [gso].[widget_element] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [widget_uid], [layout_data], [type]) VALUES (@widget_id, @code, 1, 0, N'{"class":"highligh-list","categoryId":'+  convert(nvarchar(10), @category_id) +',"ids": "", "top": 4,"bottom":3,"showRelated":false, "page":0,"pageSize":10}', 1, @container_id, N'5CCD9033-C641-42F8-AF8C-40DDA1EE699B', N'{"templateUrl":"ooh-passport"}', 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@widget_id,@code, 0, N'{"class":"highligh-list","categoryId":'+  convert(nvarchar(10), @category_id) +',"ids": "", "top": 4,"bottom":3,"showRelated":false, "page":0,"pageSize":10}', 1, @container_id, 1, 1)
		-- create unique_url
		IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
			BEGIN
				SET @unique_url_id = NEWID();
				INSERT INTO [gso].[unique_url]
				   ([item_uid]
				   ,[code]
				   ,[parsed_url])
				 VALUES
					   (@unique_url_id
					   ,@code
					   ,@code);
			END
		ELSE
			BEGIN
				SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
			END
		
		SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
		
		SELECT @friendly_url_id = id, @old_friendly_url = url
			FROM gso.friendly_url
			WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'		
		IF @old_friendly_url is NULL or @friendly_url_id is NULL
			BEGIN						
				INSERT INTO gso.friendly_url(url,page_id, extra) 
				VALUES (@friendly_url ,@page_id, 
				JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
			END
		ELSE
			BEGIN			
				UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
			END
	END
	ELSE		
		BEGIN
			SET @page_id = (SELECT id FROM gso.page WHERE name = @code);
			print @page_id;
			IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
				BEGIN
					SET @unique_url_id = NEWID();
					INSERT INTO [gso].[unique_url]
					   ([item_uid]
					   ,[code]
					   ,[parsed_url])
					 VALUES
						   (@unique_url_id
						   ,@code
						   ,@code);
				END
			ELSE
				BEGIN
					SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
				END			
			print @unique_url_id;
			SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
			--print @friendly_url;			
			SELECT @friendly_url_id = id, @old_friendly_url = [url]
				FROM gso.friendly_url
				WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'				
			IF @old_friendly_url is NULL or @friendly_url_id is NULL
				BEGIN
					INSERT INTO gso.friendly_url(url,page_id, extra) 
					VALUES (@friendly_url ,@page_id, 
					JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
				END
			ELSE
				BEGIN			
					UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
				END		
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[clone_product_page]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[clone_product_page](
	-- Add the parameters for the stored procedure here
	@uid uniqueIdentifier	
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @code nvarchar(256);
	DECLARE @url nvarchar(max);
	DECLARE @page_uid uniqueIdentifier;
	DECLARE @page_id int;
	DECLARE @container_id uniqueIdentifier;
	DECLARE @widget_id uniqueIdentifier;
	DECLARE @category_id int;
	DECLARE @friendly_url nvarchar(max);
	DECLARE @old_friendly_url nvarchar(256);

	DECLARE @unique_url_id uniqueIdentifier;
	DECLARE @friendly_url_id int;
    -- Insert statements for procedure here	
	SELECT @category_id = id,@code = code, @url = url
    FROM [gso].[category]
    WHERE uid = @uid

	IF(NOT EXISTS(SELECT 1 FROM gso.page WHERE name = @code))
	BEGIN
		SET @page_uid = NEWID();
		INSERT [gso].[page] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [page_template_id], [type]) VALUES (@page_uid, N''+@code+'', 1, 0, N'{"class":"category-media"}', 1, NULL, NULL, 3);
		SET @page_id = SCOPE_IDENTITY();

		SET @container_id = NEWID();
		SET @widget_id = NEWID();
		
		
		-- created template
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@container_id, @code + N'-container', 0, N'{"class":"widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f888', N'Services-container', 0, N'{"class":"service-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f777', N'news-container', 0, N'{"class":"news-container widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f666', N'footer-container', 0, N'{"class":"footer-banner-container widget-container"}', 1, @page_uid, 2, 1)
				
		INSERT [gso].[widget_element] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [widget_uid], [layout_data], [type]) VALUES (@widget_id, @code, 1, 0, N'{"class":"main","categoryId":'+  convert(nvarchar(10), @category_id) +',"hierarchy":"false","ids":"","loadContent":"true","type":"4"}', 1, @container_id, N'522b1976-280c-4258-9c08-50f5a49cd555', N'{"templateUrl":"ip-commercialization"}', 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@widget_id,@code, 0, N'{"class":"main","categoryId":'+  convert(nvarchar(10), @category_id) +',"hierarchy":"false","ids":"","loadContent":"true","type":"4"}', 1, @container_id, 1, 1)
		-- create unique_url
		IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
			BEGIN
				SET @unique_url_id = NEWID();
				INSERT INTO [gso].[unique_url]
				   ([item_uid]
				   ,[code]
				   ,[parsed_url])
				 VALUES
					   (@unique_url_id
					   ,@code
					   ,@code);
			END
		ELSE
			BEGIN
				SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
			END
		
		SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
		
		SELECT @friendly_url_id = id, @old_friendly_url = url
			FROM gso.friendly_url
			WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'		
		IF @old_friendly_url is NULL or @friendly_url_id is NULL
			BEGIN						
				INSERT INTO gso.friendly_url(url,page_id, extra) 
				VALUES (@friendly_url ,@page_id, 
				JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
			END
		ELSE
			BEGIN			
				UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
			END
	END
	ELSE		
		BEGIN
			SET @page_id = (SELECT id FROM gso.page WHERE name = @code);
			print @page_id;
			IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
				BEGIN
					SET @unique_url_id = NEWID();
					INSERT INTO [gso].[unique_url]
					   ([item_uid]
					   ,[code]
					   ,[parsed_url])
					 VALUES
						   (@unique_url_id
						   ,@code
						   ,@code);
				END
			ELSE
				BEGIN
					SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
				END			
			print @unique_url_id;
			SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
			--print @friendly_url;			
			SELECT @friendly_url_id = id, @old_friendly_url = [url]
				FROM gso.friendly_url
				WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'				
			IF @old_friendly_url is NULL or @friendly_url_id is NULL
				BEGIN
					INSERT INTO gso.friendly_url(url,page_id, extra) 
					VALUES (@friendly_url ,@page_id, 
					JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
				END
			ELSE
				BEGIN			
					UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
				END		
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[clone_service_page]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[clone_service_page](
	-- Add the parameters for the stored procedure here
	@uid uniqueIdentifier	
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @code nvarchar(256);
	DECLARE @url nvarchar(max);
	DECLARE @page_uid uniqueIdentifier;
	DECLARE @page_id int;
	DECLARE @container_id uniqueIdentifier;
	DECLARE @widget_id uniqueIdentifier;
	DECLARE @category_id int;
	DECLARE @friendly_url nvarchar(max);
	DECLARE @old_friendly_url nvarchar(256);

	DECLARE @unique_url_id uniqueIdentifier;
	DECLARE @friendly_url_id int;
    -- Insert statements for procedure here	
	SELECT @category_id = id,@code = code, @url = url
    FROM [gso].[category]
    WHERE uid = @uid

	IF(NOT EXISTS(SELECT 1 FROM gso.page WHERE name = @code))
	BEGIN
		SET @page_uid = NEWID();
		INSERT [gso].[page] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [page_template_id], [type]) VALUES (@page_uid, N''+@code+'', 1, 0, N'{"class":"category-media"}', 1, NULL, NULL, 3);
		SET @page_id = SCOPE_IDENTITY();

		SET @container_id = NEWID();
		SET @widget_id = NEWID();
		
		-- created template
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@container_id, @code + N'-container', 0, N'{"class":"widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f888', N'Services-container', 0, N'{"class":"service-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f777', N'news-container', 0, N'{"class":"news-container widget-container"}', 1, @page_uid, 2, 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (N'7730b48d-b148-4057-9cd4-e8ac4380f666', N'footer-container', 0, N'{"class":"footer-banner-container widget-container"}', 1, @page_uid, 2, 1)
				
		INSERT [gso].[widget_element] ([uid], [name], [visible], [display_order], [visual_data], [platform], [parent_uid], [widget_uid], [layout_data], [type]) VALUES (@widget_id, @code, 1, 0, N'{"class":"main","categoryId":'+  convert(nvarchar(10), @category_id) +',"hierarchy":"false","ids":"","loadContent":"true"}', 1, @container_id, N'522b1976-280c-4258-9c08-50f5a49cd555', N'{"templateUrl":"category-media"}', 1)
		INSERT [gso].[ui_element] ([uid], [name], [display_order], [visual_data], [platform], [parent_uid], [type], [visible]) VALUES (@widget_id,@code, 0, N'{"class":"main","categoryId":'+  convert(nvarchar(10), @category_id) +',"hierarchy":"false","ids":"","loadContent":"true"}', 1, @container_id, 1, 1)
		-- create unique_url
		IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
			BEGIN
				SET @unique_url_id = NEWID();
				INSERT INTO [gso].[unique_url]
				   ([item_uid]
				   ,[code]
				   ,[parsed_url])
				 VALUES
					   (@unique_url_id
					   ,@code
					   ,@code);
			END
		ELSE
			BEGIN
				SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
			END
		
		SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
		
		SELECT @friendly_url_id = id, @old_friendly_url = url
			FROM gso.friendly_url
			WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'		
		IF @old_friendly_url is NULL or @friendly_url_id is NULL
			BEGIN						
				INSERT INTO gso.friendly_url(url,page_id, extra) 
				VALUES (@friendly_url ,@page_id, 
				JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
			END
		ELSE
			BEGIN			
				UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
			END
	END
	ELSE		
		BEGIN
			SET @page_id = (SELECT id FROM gso.page WHERE name = @code);
			print @page_id;
			IF(NOT EXISTS(SELECT 1 FROM gso.[unique_url] WHERE [code] = @code))
				BEGIN
					SET @unique_url_id = NEWID();
					INSERT INTO [gso].[unique_url]
					   ([item_uid]
					   ,[code]
					   ,[parsed_url])
					 VALUES
						   (@unique_url_id
						   ,@code
						   ,@code);
				END
			ELSE
				BEGIN
					SELECT @unique_url_id = item_uid FROM gso.[unique_url] WHERE [code] = @code;
				END			
			print @unique_url_id;
			SET @friendly_url = (SELECT JSON_VALUE(CAST( @url as NVARCHAR(4000)),'$."vi"'));
			--print @friendly_url;			
			SELECT @friendly_url_id = id, @old_friendly_url = [url]
				FROM gso.friendly_url
				WHERE extra like '%' + convert(varchar(100), @unique_url_id)+ '%'				
			IF @old_friendly_url is NULL or @friendly_url_id is NULL
				BEGIN
					INSERT INTO gso.friendly_url(url,page_id, extra) 
					VALUES (@friendly_url ,@page_id, 
					JSON_QUERY(CONCAT('{"class":"service-content home"', ', "uid":"', @unique_url_id,'", "id":"',@page_id,'", "lang":"vi" }')) )			
				END
			ELSE
				BEGIN			
					UPDATE gso.friendly_url SET url = @friendly_url where id = @friendly_url_id
				END		
		END	
END
GO
/****** Object:  StoredProcedure [gso].[trigger_run]    Script Date: 4/25/2024 4:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [gso].[trigger_run]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @CursorTestID INT;
 
	DECLARE CUR_TEST CURSOR FAST_FORWARD FOR
		SELECT id
		FROM [gso].category
 
	OPEN CUR_TEST
	FETCH NEXT FROM CUR_TEST INTO @CursorTestID
 
	WHILE @@FETCH_STATUS = 0
	BEGIN
  
	   UPDATE gso.category SET updated_by = updated_by WHERE id =  @CursorTestID

	   FETCH NEXT FROM CUR_TEST INTO @CursorTestID
	END
	CLOSE CUR_TEST
	DEALLOCATE CUR_TEST

END
GO
USE [master]
GO
ALTER DATABASE [GSO] SET  READ_WRITE 
GO
