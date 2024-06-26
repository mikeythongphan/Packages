USE [master]
GO
/****** Object:  Database [GCS_BROADCAST]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE DATABASE [GCS_BROADCAST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GCS_DEV_BROADCAST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_BROADCAST.mdf' , SIZE = 1187840KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GCS_DEV_BROADCAST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_BROADCAST_log.ldf' , SIZE = 2760704KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GCS_BROADCAST] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GCS_BROADCAST].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GCS_BROADCAST] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET ARITHABORT OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GCS_BROADCAST] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GCS_BROADCAST] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GCS_BROADCAST] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GCS_BROADCAST] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET RECOVERY FULL 
GO
ALTER DATABASE [GCS_BROADCAST] SET  MULTI_USER 
GO
ALTER DATABASE [GCS_BROADCAST] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GCS_BROADCAST] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GCS_BROADCAST] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GCS_BROADCAST] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GCS_BROADCAST] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GCS_BROADCAST', N'ON'
GO
ALTER DATABASE [GCS_BROADCAST] SET QUERY_STORE = OFF
GO
USE [GCS_BROADCAST]
GO
/****** Object:  User [VACGROUP\thong.phan.duy]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [VACGROUP\thong.phan.duy] FOR LOGIN [VACGROUP\thong.phan.duy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\tham.tran]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [VACGROUP\tham.tran] FOR LOGIN [VACGROUP\tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\khoa.huynh]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [VACGROUP\khoa.huynh] FOR LOGIN [VACGROUP\khoa.huynh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tham.tran]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [tham.tran] FOR LOGIN [tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nhung.tran]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [nhung.tran] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [mdm]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [mdm] FOR LOGIN [mdm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DWH_BI]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [DWH_BI] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BITEAM]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [BITEAM] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bao.nguyen.gia]    Script Date: 4/25/2024 4:00:18 PM ******/
CREATE USER [bao.nguyen.gia] FOR LOGIN [bao.nguyen.gia] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [VACGROUP\thong.phan.duy]
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
ALTER ROLE [db_datareader] ADD MEMBER [BITEAM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [bao.nguyen.gia]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertChannel]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertChannel]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_channel as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END

GO
/****** Object:  UserDefinedFunction [dbo].[ConvertContentCategory]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertContentCategory]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_content_category as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END

GO
/****** Object:  UserDefinedFunction [dbo].[ConvertNation]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertNation]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_nation as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  Table [dbo].[broadcast_master]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[broadcast_master](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ChannelId] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Year] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[RefMasterId] [int] NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_broadcast_master] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[broadcast_plan]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[broadcast_plan](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[BroadcastMasterId] [uniqueidentifier] NOT NULL,
	[ContentId] [nvarchar](max) NULL,
	[PostMasterType] [int] NULL,
	[PostMasterId] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[IsMon] [bit] NOT NULL,
	[IsTue] [bit] NOT NULL,
	[IsWed] [bit] NOT NULL,
	[IsThu] [bit] NOT NULL,
	[IsFri] [bit] NOT NULL,
	[IsSat] [bit] NOT NULL,
	[IsSun] [bit] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Duration] [int] NOT NULL,
	[TotalEpisode] [int] NOT NULL,
	[EpisodeInDay] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[RunOrder] [int] NULL,
	[RunChannelOrder] [int] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[TimeSlot] [time](7) NOT NULL,
	[IsIPPFollow] [bit] NULL,
	[ReRun] [int] NULL,
	[StartEpisode] [int] NULL,
 CONSTRAINT [PK_broadcast_plan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[broadcast_episode]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[broadcast_episode](
	[Id] [uniqueidentifier] NOT NULL,
	[BroadcastPlanId] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[TimeSlot] [time](7) NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[EpisodeNumber] [int] NOT NULL,
	[Duration] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_broadcast_episode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_episode_plan]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_episode_plan]
AS
SELECT e.Id, p.Id AS PlanId, p.ContentId, e.StartTime, e.EndTime, e.EpisodeNumber, e.Duration, e.description
FROM   dbo.broadcast_episode AS e INNER JOIN
             dbo.broadcast_plan AS p ON e.BroadcastPlanId = p.Id INNER JOIN
             dbo.broadcast_master AS m ON p.BroadcastMasterId = m.Id
GO
/****** Object:  Table [dbo].[bc_windowing]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bc_windowing](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content_id] [varchar](100) NULL,
	[vieon_id] [varchar](100) NULL,
	[content_name] [nvarchar](max) NULL,
	[type] [varchar](50) NULL,
	[platform] [varchar](50) NULL,
	[video_quality] [varchar](50) NULL,
	[ep_name] [nvarchar](max) NULL,
	[package_name] [varchar](50) NULL,
	[start_time] [date] NULL,
	[end_time] [date] NULL,
	[duration] [int] NULL,
 CONSTRAINT [PK_bc_windowing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_windowing]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_windowing]
AS
SELECT        TOP (100) PERCENT content_name, ep_name, start_time, date, end_time, type, platform, video_quality, duration, CAST(MAX(CASE WHEN seq = 1 THEN 1 ELSE 0 END) AS Bit) AS VIP, 
                         CAST(MAX(CASE WHEN seq = 2 THEN 1 ELSE 0 END) AS Bit) AS VIP_HBO_GO, CAST(MAX(CASE WHEN seq = 3 THEN 1 ELSE 0 END) AS Bit) AS VIP_K_PLus
FROM            (SELECT        content_name, ep_name, start_time, DATENAME(weekday, start_time) AS date, CASE WHEN YEAR(end_time) = 1900 THEN NULL ELSE end_time END AS end_time, package_name, type, platform, video_quality, 
                                                    duration, CASE WHEN package_name = 'Vip' THEN 1 WHEN package_name = 'VIP HBO GO' THEN 2 WHEN package_name = 'VIP K+' THEN 3 ELSE '' END AS seq
                          FROM            dbo.bc_windowing) AS temp
GROUP BY content_name, ep_name, start_time, date, end_time, type, platform, video_quality, duration
GO
/****** Object:  View [dbo].[checkblocking]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----Blocking---------done good--
CREATE VIEW [dbo].[checkblocking]  
AS
SELECT session_id, command, blocking_session_id, wait_type, wait_time, wait_resource, t.TEXT
FROM sys.dm_exec_requests 
CROSS apply sys.dm_exec_sql_text(sql_handle) AS t
WHERE session_id > 50 
AND blocking_session_id > 0
UNION
SELECT session_id, '', '', '', '', '', t.TEXT
FROM sys.dm_exec_connections 
CROSS apply sys.dm_exec_sql_text(most_recent_sql_handle) AS t
WHERE session_id IN (SELECT blocking_session_id 
                    FROM sys.dm_exec_requests 
                    WHERE blocking_session_id > 0)
GO
/****** Object:  View [dbo].[v_bc_ott_list]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_bc_ott_list]
AS
SELECT        m.id, m.name, m.channel_id, ch.name AS channel_name, m.type, m.company_id, pl_c.content_count, m.year, m.create_by, m.create_time, m.update_by, m.update_time, CASE WHEN n.is_next IS NULL THEN CAST(0 AS BIT) 
                         ELSE CAST(1 AS BIT) END AS is_next
FROM            dbo.bc_ott_master AS m LEFT OUTER JOIN
                         GCS_CATEGORY.dbo.cate_channel AS ch ON ch.id = m.channel_id LEFT OUTER JOIN
                             (SELECT        bc_master_id, COUNT(bc_master_id) AS content_count
                               FROM            (SELECT        bc_master_id, COUNT(content_id) AS content_id
                                                         FROM            dbo.bc_ott_plan
                                                         GROUP BY content_id, bc_master_id) AS u
                               GROUP BY bc_master_id) AS pl_c ON pl_c.bc_master_id = m.id LEFT OUTER JOIN
                             (SELECT        id, ref_master_id, CASE WHEN ref_master_id IS NOT NULL THEN 'TRUE' END AS is_next
                               FROM            dbo.bc_ott_master
                               WHERE        (ref_master_id IS NOT NULL)) AS n ON n.ref_master_id = m.id
WHERE        (m.is_active = 1)
GO
/****** Object:  View [dbo].[v_bc_ott_master]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_bc_ott_master]
AS
SELECT        m.name, m.channel_id, c.name AS channel_name, m.is_active, m.create_by, m.create_time, m.id
FROM            dbo.bc_ott_master AS m INNER JOIN
                         GCS_CATEGORY.dbo.cate_channel_digital AS c ON c.id = m.channel_id
GO
/****** Object:  View [dbo].[v_cate_channel]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_channel]
AS
SELECT id, name, is_viechannel
FROM   GCS_CATEGORY.dbo.cate_channel
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_company_episode]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_company_episode]
AS
SELECT        c.id, c.name, c.original_name
FROM            GCS_CONTENT.dbo.ct_content AS c INNER JOIN
                         GCS_CONTENT_MASTER.dbo.ct_master AS m ON m.content_id = c.id INNER JOIN
                         GCS_CONTENT_POST.dbo.ct_post AS p ON p.master_id = m.id
WHERE        (c.is_deleted = 0) AND (p.total = 1)
GO
/****** Object:  View [dbo].[v_content_and_license]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_and_license]
AS
SELECT c.id, c.name, l.run, l.run_used, l.acquisition_date, l.license_type_id
FROM   GCS_CONTENT.dbo.ct_content AS c INNER JOIN
             GCS_CONTENT_LICENSE.dbo.content_license AS l ON l.content_id = c.id
GO
/****** Object:  View [dbo].[v_content_in_master]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_in_master]
AS
SELECT DISTINCT c.id, c.name, m.id AS master_id
FROM            dbo.bc_master AS m INNER JOIN
                         dbo.bc_plan AS p ON p.is_active = 1 AND p.bc_master_id = m.id INNER JOIN
                         GCS_CONTENT.dbo.ct_content AS c ON c.is_deleted = 0 AND c.id = p.content_id
WHERE        (m.is_active = 1)
GO
/****** Object:  View [dbo].[v_content_nation]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_nation]
AS
SELECT id, dbo.ConvertNation(nation_id) AS nation
FROM   GCS_CONTENT.dbo.ct_content_consolidate
WHERE (is_deleted = 0)
GO
/****** Object:  View [dbo].[v_master_active]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_master_active]
AS
SELECT        m.id, m.name, m.channel_id, ch.name AS channel_name, m.type, m.company_id, pl_c.content_count, m.year, m.create_by, m.create_time, m.update_by, m.update_time, CASE WHEN n.is_next IS NULL THEN CAST(0 AS BIT) 
                         ELSE CAST(1 AS BIT) END AS is_next
FROM            dbo.bc_master AS m LEFT OUTER JOIN
                         GCS_CATEGORY.dbo.cate_channel AS ch ON ch.id = m.channel_id LEFT OUTER JOIN
                             (SELECT        bc_master_id, COUNT(bc_master_id) AS content_count
                               FROM            (SELECT        bc_master_id, COUNT(content_id) AS content_id
                                                         FROM            dbo.bc_plan
                                                         GROUP BY content_id, bc_master_id) AS u
                               GROUP BY bc_master_id) AS pl_c ON pl_c.bc_master_id = m.id LEFT OUTER JOIN
                             (SELECT        id, ref_master_id, CASE WHEN ref_master_id IS NOT NULL THEN 'TRUE' END AS is_next
                               FROM            dbo.bc_master
                               WHERE        (ref_master_id IS NOT NULL)) AS n ON n.ref_master_id = m.id
WHERE        (m.is_active = 1)
GO
/****** Object:  View [dbo].[v_master_by_masterid]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_master_by_masterid]
AS
SELECT t0.id, t.id AS plan_id, t.name AS plan_name, i.type AS master_type, CASE WHEN
                      (SELECT COUNT(*)
                       FROM      [bc_master] AS [i3]
                       WHERE   ([i3].[id] <> [i].[id]) AND ([i3].[ref_master_id] = [i].[id])) > 0 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS had_next_state, CASE WHEN [t].[run_order] <> 0 THEN [t].[run_order] ELSE
                      (SELECT COUNT(*)
                       FROM      GCS_CONTENT.dbo.ct_content_bc AS [i4]
                       WHERE   (([i4].[content_id] = [t].[content_id]) OR
                                         ([i4].[content_id] IS NULL AND [t].[content_id] IS NULL)) AND ([i4].[bc_from] < [t].[start_date])) + 1 END AS run_order, CASE WHEN [t].[run_channel_order] <> 0 THEN [t].[run_channel_order] ELSE
                      (SELECT COUNT(*)
                       FROM      GCS_CONTENT.dbo.ct_content_bc AS [i5]
                       WHERE   ((([i5].[content_id] = [t].[content_id]) OR
                                         ([i5].[content_id] IS NULL AND [t].[content_id] IS NULL)) AND ([i5].[channel_id] = [i].[channel_id])) AND ([i5].[bc_from] < [t].[start_date])) + 1 END AS run_channel_order, t1.time_slot, t0.is_sun, t0.is_mon, t0.is_tue, t0.is_wed, t0.is_thu, 
                  t0.is_fri, t0.is_sat, c.name AS content_name,
                      (SELECT TOP (1) name
                       FROM      GCS_CATEGORY.dbo.cate_content_category AS i6
                       WHERE   (CHARINDEX(CONVERT(VARCHAR(11), id) + N';', c.content_category_id) > 0) OR
                                         (CONVERT(VARCHAR(11), id) + N';' = N'')) AS content_category,
                      (SELECT TOP (1) name
                       FROM      GCS_CATEGORY.dbo.cate_nation AS c3
                       WHERE   (CHARINDEX(CONVERT(VARCHAR(11), id) + N';', so.nation_id) > 0) OR
                                         (CONVERT(VARCHAR(11), id) + N';' = N'')) AS content_nation, t0.content_id, CAST(t0.total_episode AS nvarchar(MAX)) + N'/' + CAST(t0.total_episode_broadcast AS nvarchar(MAX)) AS total_episode, t0.duration, 
                  t0.episode_in_day, c.new_product AS is_new, t0.start_date, t0.end_date, c.code AS ct_code_ct, c.score AS ct_score,
                      (SELECT TOP (1) name
                       FROM      GCS_CATEGORY.dbo.cate_pl_drama AS cpd
                       WHERE   (id = c.pl_prama_id)) AS ct_pl_drama, t0.total_episode AS total_seg_episode, t.description, CASE WHEN [t0].[start_date] > GETDATE() THEN 1 ELSE CASE WHEN [t0].[end_date] < GETDATE() 
                  THEN 3 ELSE 2 END END AS play_status, i.id AS master_id, t0.post_master_id, t.type, c.ranking_id AS ranking, license.end_date AS license_end_date, t.notes, CASE WHEN LEFT(t0.post_master_id, 1) = 'M' THEN
                      (SELECT episode
                       FROM      GCS_CONTENT_MASTER.dbo.ct_master
                       WHERE   id = t0.post_master_id) WHEN LEFT(t0.post_master_id, 1) = 'P' THEN
                      (SELECT total
                       FROM      GCS_CONTENT_POST.dbo.ct_post
                       WHERE   id = t0.post_master_id) ELSE '' END AS total_episode_content
FROM     dbo.bc_master AS i INNER JOIN
                      (SELECT id, name, bc_master_id, content_id, content_name, type, start_date, end_date, total_episode, total_episode_broadcast, duration, total_day, description, notes, run_order, run_channel_order, post_master_id, create_by, 
                                         create_time, update_by, update_time, is_active
                       FROM      dbo.bc_plan AS i0
                       WHERE   (is_active = 1)) AS t ON i.id = t.bc_master_id INNER JOIN
                      (SELECT id, plan_id, content_name, post_master_id, content_id, is_mon, is_tue, is_wed, is_thu, is_fri, is_sat, is_sun, start_date, end_date, duration, total_episode, total_episode_broadcast, episode_in_day, description, create_by, 
                                         create_time, update_by, update_time, is_active
                       FROM      dbo.bc_segment AS i1
                       WHERE   (is_active <> 0) OR
                                         (is_active IS NULL)) AS t0 ON t.id = t0.plan_id INNER JOIN
                  dbo.bc_episode AS e ON t0.id = e.segment_id INNER JOIN
                      (SELECT DISTINCT bc_episode_id, time_slot
                       FROM      dbo.bc_part AS i2) AS t1 ON e.id = t1.bc_episode_id INNER JOIN
                  GCS_CONTENT.dbo.ct_content AS c ON t0.content_id = c.id INNER JOIN
                  GCS_CONTENT_SOURCE.dbo.content_source AS so ON so.content_id = c.id INNER JOIN
                  GCS_CONTENT_LICENSE.dbo.v_list_end_license_180_days AS license ON license.content_id = t0.content_id
GO
/****** Object:  View [dbo].[v_master_post_total]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_master_post_total]
AS
SELECT pm.id, pm.name, pm.number_eps, pm.duration_minute, ct.code, ct.id AS content_id, ct.nation_id
FROM   (SELECT id, name, total AS number_eps, duration_minute, consolidate_content_id AS content_id
             FROM    GCS_CONTENT_POST.dbo.ct_post
             UNION
             SELECT m.id, c.ContractContentName, m.episode AS number_eps, m.duration_minute, m.content_id
             FROM   GCS_CONTRACT.dbo.master AS m INNER JOIN
                          GCS_CONTRACT.dbo.Contract AS c ON m.ContractId = c.Id) AS pm INNER JOIN
             GCS_CONTENT.dbo.ct_content_consolidate AS ct ON pm.content_id = ct.id
GO
/****** Object:  View [dbo].[v_ott_content_in_master]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ott_content_in_master]
AS
SELECT DISTINCT c.id, c.name, m.id AS master_id
FROM            dbo.bc_ott_master AS m INNER JOIN
                         dbo.bc_ott_plan AS p ON p.is_active = 1 AND p.bc_master_id = m.id INNER JOIN
                         GCS_CONTENT.dbo.ct_content AS c ON c.is_deleted = 0 AND c.id = p.content_id
WHERE        (m.is_active = 1)
GO
/****** Object:  View [dbo].[v_ott_master_by_master_id]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ott_master_by_master_id]
AS
SELECT        t0.id, t1.time_slot, t0.start_date, t.id AS plan_id, t.name AS plan_name, i.type AS master_type, t.method_id, t.vod_id, t.format_id, t.package_id, t.censor, t.censor_date, CASE WHEN
                             (SELECT        COUNT(*)
                               FROM            [bc_ott_master] AS [i3]
                               WHERE        ([i3].[id] <> [i].[id]) AND ([i3].[ref_master_id] = [i].[id])) > 0 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS had_next_state, CASE WHEN [t].[run_order] <> 0 THEN [t].[run_order] ELSE
                             (SELECT        COUNT(*)
                               FROM            GCS_CONTENT.dbo.ct_content_bc AS [i4]
                               WHERE        ((([i4].[content_id] = [t].[content_id]) OR
                                                         ([i4].[content_id] IS NULL AND [t].[content_id] IS NULL)) AND ([i4].[bc_from] < [t].[start_date])) AND (CONVERT(VARCHAR(11), [i4].[run_channel]) <> N'''')) END AS run_order, 
                         CASE WHEN [t].[run_channel_order] <> 0 THEN [t].[run_channel_order] ELSE
                             (SELECT        COUNT(*)
                               FROM            GCS_CONTENT.dbo.ct_content_bc AS [i5]
                               WHERE        (((([i5].[content_id] = [t].[content_id]) OR
                                                         ([i5].[content_id] IS NULL AND [t].[content_id] IS NULL)) AND ([i5].[channel_id] = [i].[channel_id])) AND ([i5].[bc_from] < [t].[start_date])) AND (CONVERT(VARCHAR(11), [i5].[run_channel]) <> N'''')) 
                         END AS run_channel_order, t0.is_sun, t0.is_mon, t0.is_tue, t0.is_wed, t0.is_thu, t0.is_fri, t0.is_sat, c.name AS content_name,
                             (SELECT        TOP (1) name
                               FROM            GCS_CATEGORY.dbo.cate_content_category AS i6
                               WHERE        (CHARINDEX(CONVERT(VARCHAR(11), id) + N';', c.content_category_id) > 0) OR
                                                         (CONVERT(VARCHAR(11), id) + N';' = N'')) AS content_category,
                             (SELECT        TOP (1) name
                               FROM            GCS_CATEGORY.dbo.cate_nation AS c3
                               WHERE        (CHARINDEX(CONVERT(VARCHAR(11), id) + N';', s.nation_id) > 0) OR
                                                         (CONVERT(VARCHAR(11), id) + N';' = N'')) AS content_nation, c.id AS content_id, CAST(t0.total_episode AS nvarchar(MAX)) + N'/' + CAST(t0.total_episode_broadcast AS nvarchar(MAX)) AS total_episode, t0.duration, 
                         t0.episode_in_day, c.new_product AS is_new, t0.end_date, c.code AS ct_code_ct, c.score AS ct_score,
                             (SELECT        TOP (1) name
                               FROM            GCS_CATEGORY.dbo.cate_pl_drama AS cpd
                               WHERE        (id = c.pl_prama_id)) AS ct_pl_drama, t0.total_episode AS total_seg_episode, t.description, CASE WHEN [t0].[start_date] > GETDATE() THEN 1 ELSE CASE WHEN [t0].[end_date] < GETDATE() 
                         THEN 3 ELSE 2 END END AS play_status, i.id AS master_id, t.post_master_id, t.platform_id
FROM            dbo.bc_ott_master AS i INNER JOIN
                             (SELECT        id, name, bc_master_id, ref_plan_bc, content_id, content_name, platform_id, vod_id, method_id, format_id, package_id, censor, censor_date, start_date, end_date, total_episode, total_episode_broadcast, 
                                                         duration, total_day, description, run_order, run_channel_order, create_by, create_time, update_by, update_time, is_approved, approval_by, approval_time, approval_msg, is_active, post_master_id
                               FROM            dbo.bc_ott_plan AS i0
                               WHERE        (is_active = 1)) AS t ON i.id = t.bc_master_id INNER JOIN
                             (SELECT        id, plan_id, is_mon, is_tue, is_wed, is_thu, is_fri, is_sat, is_sun, start_date, end_date, duration, total_episode, total_episode_broadcast, episode_in_day, description, create_by, create_time, update_by, 
                                                         update_time, is_active
                               FROM            dbo.bc_ott_segment AS i1
                               WHERE        (is_active <> 0) OR
                                                         (is_active IS NULL)) AS t0 ON t.id = t0.plan_id INNER JOIN
                         dbo.bc_ott_episode AS e ON t0.id = e.segment_id INNER JOIN
                             (SELECT DISTINCT bc_episode_id, time_slot
                               FROM            dbo.bc_ott_part AS i2) AS t1 ON e.id = t1.bc_episode_id INNER JOIN
                         GCS_CONTENT.dbo.ct_content AS c ON t.content_id = c.id INNER JOIN
                         GCS_CONTENT_SOURCE.dbo.content_source AS s ON s.content_id = c.id
GO
/****** Object:  View [dbo].[v_ott_segment_by_planid]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ott_segment_by_planid]
AS
SELECT        TOP (100) PERCENT p.id, e.id AS episode_id, t.id AS plan_id, p.time_slot, p.start_date, CASE WHEN CONVERT(date, [p].[start_date]) > CONVERT(date, GETDATE()) THEN 1 ELSE CASE WHEN CONVERT(date, [p].[start_date]) 
                         = CONVERT(date, GETDATE()) THEN 2 ELSE 3 END END AS play_status, p.start_time, DATEADD(MINUTE, p.duration, p.start_time) AS end_time, DATEPART(dw, p.start_date) AS dayofweek, DATEPART(dayofyear, p.start_date) 
                         AS dayofyear, p.duration, p.description, p.create_by, p.create_time
FROM            dbo.bc_ott_segment AS s INNER JOIN
                         dbo.bc_ott_episode AS e ON s.id = e.segment_id INNER JOIN
                         dbo.bc_ott_part AS p ON e.id = p.bc_episode_id INNER JOIN
                             (SELECT        id, name, bc_master_id, content_id, content_name, start_date, end_date, total_episode, total_episode_broadcast, duration, total_day, description, run_order, run_channel_order, create_by, create_time, 
                                                         update_by, update_time, is_active
                               FROM            dbo.bc_ott_plan AS i
                               WHERE        (is_active = 1)) AS t ON s.plan_id = t.id
ORDER BY p.start_date, p.start_time
GO
/****** Object:  View [dbo].[v_ott_segment_by_segmentid]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ott_segment_by_segmentid]
AS
SELECT        TOP (100) PERCENT p.id, e.id AS episode_id, p.time_slot, p.start_date, CASE WHEN CONVERT(date, [p].[start_date]) > CONVERT(date, GETDATE()) THEN 1 ELSE CASE WHEN CONVERT(date, [p].[start_date]) = CONVERT(date, 
                         GETDATE()) THEN 2 ELSE 3 END END AS play_status, p.start_time, DATEADD(MINUTE, p.duration, p.start_time) AS end_time, DATEPART(dw, p.start_date) - 1 AS dayofweek, DATEPART(dayofyear, p.start_date) AS dayofyear, 
                         p.duration, p.description, p.create_by, p.create_time, i.id AS segment_id, p.episode_number
FROM            dbo.bc_ott_segment AS i INNER JOIN
                         dbo.bc_ott_episode AS e ON i.id = e.segment_id INNER JOIN
                         dbo.bc_ott_part AS p ON e.id = p.bc_episode_id
ORDER BY p.start_date, p.start_time
GO
/****** Object:  View [dbo].[v_segment_by_planid]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_segment_by_planid]
AS
SELECT TOP (100) PERCENT p.id, e.id AS episode_id, t.id AS plan_id, p.time_slot, p.start_date, CASE WHEN CONVERT(date, [p].[start_date]) > CONVERT(date, GETDATE()) THEN 1 ELSE CASE WHEN CONVERT(date, [p].[start_date]) = CONVERT(date, GETDATE()) 
             THEN 2 ELSE 3 END END AS play_status, p.start_time, DATEADD(MINUTE, p.duration, p.start_time) AS end_time, DATEPART(dw, p.start_date) - 1 AS dayofweek, DATEPART(dayofyear, p.start_date) AS dayofyear, p.duration, p.description, p.create_by, p.create_time
FROM   dbo.bc_segment AS s INNER JOIN
             dbo.bc_episode AS e ON s.id = e.segment_id INNER JOIN
             dbo.bc_part AS p ON e.id = p.bc_episode_id INNER JOIN
                 (SELECT id, name, bc_master_id, content_id, content_name, type, start_date, end_date, total_episode, total_episode_broadcast, duration, total_day, description, run_order, run_channel_order, create_by, create_time, update_by, update_time, is_active
                 FROM    dbo.bc_plan AS i
                 WHERE (is_active = 1)) AS t ON s.plan_id = t.id
ORDER BY p.start_date, p.start_time
GO
/****** Object:  View [dbo].[v_segment_by_segmentid]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_segment_by_segmentid]
AS
SELECT TOP (100) PERCENT p.id, e.id AS episode_id, p.time_slot, p.start_date, CASE WHEN CONVERT(date, [p].[start_date]) > CONVERT(date, GETDATE()) THEN 1 ELSE CASE WHEN CONVERT(date, [p].[start_date]) = CONVERT(date, GETDATE()) THEN 2 ELSE 3 END END AS play_status, 
             p.start_time, DATEADD(MINUTE, p.duration, p.start_time) AS end_time, DATEPART(dw, p.start_date) - 1 AS dayofweek, DATEPART(dayofyear, p.start_date) AS dayofyear, p.duration, p.description, p.create_by, p.create_time, i.id AS segment_id, p.episode_number
FROM   dbo.bc_segment AS i INNER JOIN
             dbo.bc_episode AS e ON i.id = e.segment_id INNER JOIN
             dbo.bc_part AS p ON e.id = p.bc_episode_id
ORDER BY p.start_date, p.start_time
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [dbo].[bc_history]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bc_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_by] [varchar](100) NOT NULL,
	[action] [varchar](50) NULL,
	[db] [varchar](100) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NULL,
	[create_time] [datetime] NOT NULL,
	[bc_id] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[broadcast_history]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[broadcast_history](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[action] [nvarchar](max) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[ContentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_broadcast_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Index [IX_broadcast_episode_BroadcastPlanId]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_broadcast_episode_BroadcastPlanId] ON [dbo].[broadcast_episode]
(
	[BroadcastPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_broadcast_plan_BroadcastMasterId]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_broadcast_plan_BroadcastMasterId] ON [dbo].[broadcast_plan]
(
	[BroadcastMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:00:19 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:00:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[broadcast_plan] ADD  DEFAULT ('00:00:00') FOR [TimeSlot]
GO
ALTER TABLE [dbo].[broadcast_episode]  WITH NOCHECK ADD  CONSTRAINT [FK_broadcast_episode_broadcast_plan_BroadcastPlanId] FOREIGN KEY([BroadcastPlanId])
REFERENCES [dbo].[broadcast_plan] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[broadcast_episode] CHECK CONSTRAINT [FK_broadcast_episode_broadcast_plan_BroadcastPlanId]
GO
ALTER TABLE [dbo].[broadcast_plan]  WITH NOCHECK ADD  CONSTRAINT [FK_broadcast_plan_broadcast_master_BroadcastMasterId] FOREIGN KEY([BroadcastMasterId])
REFERENCES [dbo].[broadcast_master] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[broadcast_plan] CHECK CONSTRAINT [FK_broadcast_plan_broadcast_master_BroadcastMasterId]
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
/****** Object:  StoredProcedure [dbo].[CloneBC]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CloneBC] 
	-- Add the parameters for the stored procedure here
	@ref_bc_master_id int,
	@clone_name nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @bc_plan_new uniqueidentifier,@bc_segment_new uniqueidentifier,@bc_episode_new uniqueidentifier
	DECLARE @bc_master_new int,@count_plan int, @count_segment int, @count_episode int, @count_part int;
	DECLARE @count_plan_temp int, @count_segment_temp int, @count_episode_temp int, @count_part_temp int;
	DECLARE @cursor1_status int;
	DECLARE @cursor2_status int;
	SET NOCOUNT ON;
  --insert 2 table bc_master va plan truoc
   insert into bc_master(name,channel_id,year,company_id,type,is_active,create_by,create_time)
select @clone_name,channel_id,year,company_id,'PLAN',is_active,create_by,create_time from bc_master where id=@ref_bc_master_id
set @bc_master_new=SCOPE_IDENTITY()
--------------------------------------------------------------------------
	----insert
	DECLARE @plan_id uniqueidentifier,@name nvarchar(500),@bc_master_id int,@content_id varchar(100),@content_name nvarchar(MAX),@type int,@start_date date,@end_date date,@total_episode int,@total_episode_broadcast int,@duration int,@total_day int,@description nvarchar(MAX),@run_order int,@run_channel_order int,@create_by nvarchar(100),@create_time datetime,@is_active bit, @post_master_id nvarchar(100)
	DECLARE MY_CURSOR CURSOR 
	  --LOCAL STATIC READ_ONLY FORWARD_ONLY
	FOR 
	SELECT id,name,bc_master_id,content_id,content_name,type,start_date,end_date,total_episode,total_episode_broadcast,duration,total_day,description,run_order,run_channel_order,create_by,create_time,is_active,post_master_id FROM bc_plan where bc_master_id=@ref_bc_master_id and is_active=1

	OPEN MY_CURSOR
	FETCH NEXT FROM MY_CURSOR INTO @plan_id,@name,@bc_master_id,@content_id,@content_name,@type,@start_date,@end_date,@total_episode,@total_episode_broadcast,@duration,@total_day,@description,@run_order,@run_channel_order,@create_by,@create_time,@is_active, @post_master_id
	--select @cursor1_status = @@fetch_status
	WHILE @@FETCH_STATUS = 0
	BEGIN 
	  set @bc_plan_new=NEWID();
	  insert into bc_plan (id,name,bc_master_id,content_id,content_name,type,start_date,end_date,total_episode,total_episode_broadcast,duration,total_day,description,run_order,run_channel_order,create_by,create_time,is_active, post_master_id) VALUES (@bc_plan_new,@name,@bc_master_new,@content_id,@content_name,@type,@start_date,@end_date,@total_episode,@total_episode_broadcast,@duration,@total_day,@description,@run_order,@run_channel_order,@create_by,@create_time,@is_active,@post_master_id)
	  --print @bc_plan_new;
		--khai bao tiep curson segment
			DECLARE @segment_id uniqueidentifier,@seg_plan_id uniqueidentifier,@is_mon bit,@is_tue bit,@is_wed bit,@is_thu bit,@is_fri bit,@is_sat bit,@is_sun bit,@seg_start_date date,@seg_end_date date,@seg_duration int,@seg_total_episode int,@seg_total_episode_broadcast int,@episode_in_day int,@seg_description nvarchar(MAX),@seg_create_by nvarchar(100),@seg_create_time datetime,@seg_is_active bit,@seg_content_id varchar(100),@seg_content_name nvarchar(MAX),@seg_type int,@seg_post_master_id nvarchar(100)
			DECLARE MY_SEGMENT_CURSOR CURSOR 
			 -- LOCAL STATIC READ_ONLY FORWARD_ONLY
			FOR 
			SELECT id,plan_id,is_mon,is_tue,is_wed,is_thu,is_fri,is_sat,is_sun,start_date,end_date,duration,total_episode,total_episode_broadcast,episode_in_day,description,create_by,create_time,is_active, content_id,content_name,type,post_master_id FROM bc_segment where plan_id= @plan_id and is_active=1

			OPEN MY_SEGMENT_CURSOR
			FETCH NEXT FROM MY_SEGMENT_CURSOR INTO @segment_id,@seg_plan_id,@is_mon,@is_tue,@is_wed,@is_thu,@is_fri,@is_sat,@is_sun,@seg_start_date,@seg_end_date,@seg_duration,@seg_total_episode,@seg_total_episode_broadcast,@episode_in_day,@seg_description,@seg_create_by,@seg_create_time,@seg_is_active,  @seg_content_id,@seg_content_name,@seg_type,@seg_post_master_id
			--select @cursor2_status = @@fetch_status
			WHILE @@FETCH_STATUS = 0
			BEGIN 
			  set @bc_segment_new=NEWID();
			  insert into bc_segment(id, plan_id,is_mon,is_tue,is_wed,is_thu,is_fri,is_sat,is_sun,start_date,end_date,duration,total_episode,total_episode_broadcast,episode_in_day,description,create_by,create_time,is_active, content_id,content_name,type,post_master_id) VALUES (@bc_segment_new, @bc_plan_new,@is_mon,@is_tue,@is_wed,@is_thu,@is_fri,@is_sat,@is_sun,@seg_start_date,@seg_end_date,@seg_duration,@seg_total_episode,@seg_total_episode_broadcast,@episode_in_day,@seg_description,@seg_create_by,@seg_create_time,@seg_is_active,@seg_content_id,@seg_content_name,@seg_type,@seg_post_master_id)
				--khai bao tiep curson episode
					--khai bao tiep curson episode
						DECLARE @epi_id uniqueidentifier,@epi_segment_id uniqueidentifier,@epi_plan_id uniqueidentifier,@epi_create_by nvarchar(100),@epi_create_time datetime
						DECLARE MY_EPISODE_CURSOR CURSOR 
							-- LOCAL STATIC READ_ONLY FORWARD_ONLY
						FOR 
						SELECT id,segment_id,plan_id,create_by,create_time FROM bc_episode where plan_id= @plan_id and segment_id=@segment_id

						OPEN MY_EPISODE_CURSOR
						FETCH NEXT FROM MY_EPISODE_CURSOR INTO 
							@epi_id,@epi_segment_id,@epi_plan_id,@epi_create_by,@epi_create_time
					
						WHILE @@FETCH_STATUS = 0
						BEGIN 
							set @bc_episode_new=NEWID();
							insert into bc_episode(id,segment_id, plan_id,create_by,create_time) VALUES (@bc_episode_new,@bc_segment_new,@bc_plan_new,@epi_create_by,@epi_create_time)

							--khai bao tiep curson part
								--khai bao tiep curson episode
							insert into bc_part(id, bc_episode_id,start_date,time_slot,start_time,duration,rating_bc,[view],revenue,description,create_by,create_time,episode_number) SELECT NEWID(), @bc_episode_new,start_date,time_slot,start_time,duration,rating_bc,[view],revenue,description,create_by,create_time,episode_number FROM bc_part where bc_episode_id= @epi_id
	
							FETCH NEXT FROM MY_EPISODE_CURSOR INTO @epi_id,@epi_segment_id,@epi_plan_id,@epi_create_by,@epi_create_time
							
						END
						CLOSE MY_EPISODE_CURSOR
						DEALLOCATE MY_EPISODE_CURSOR
				--end
				FETCH NEXT FROM MY_SEGMENT_CURSOR INTO  @segment_id,@seg_plan_id,@is_mon,@is_tue,@is_wed,@is_thu,@is_fri,@is_sat,@is_sun,@seg_start_date,@seg_end_date,@seg_duration,@seg_total_episode,@seg_total_episode_broadcast,@episode_in_day,@seg_description,@seg_create_by,@seg_create_time,@seg_is_active,  @seg_content_id,@seg_content_name,@seg_type,@seg_post_master_id
			
			END
			CLOSE MY_SEGMENT_CURSOR
			DEALLOCATE MY_SEGMENT_CURSOR
		--end
	    FETCH NEXT FROM MY_CURSOR INTO @plan_id,@name,@bc_master_id,@content_id,@content_name,@type,@start_date,@end_date,@total_episode,@total_episode_broadcast,@duration,@total_day,@description,@run_order,@run_channel_order,@create_by,@create_time,@is_active, @post_master_id
		
	END
	CLOSE MY_CURSOR
	DEALLOCATE MY_CURSOR

END
GO
/****** Object:  StoredProcedure [dbo].[CloneBC_OTT]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CloneBC_OTT] 
	-- Add the parameters for the stored procedure here
	@ref_bc_master_id int,
	@clone_name nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @bc_plan_new int,@bc_segment_new int,@bc_episode_new int
	DECLARE @bc_master_new int,@count_plan int, @count_segment int, @count_episode int, @count_part int;
	SET NOCOUNT ON;
  --insert 2 table bc_master va plan truoc
   insert into bc_ott_master(name,channel_id,year,company_id,type,is_active,create_by,create_time,is_approval,approval_by,approval_time)
select @clone_name,channel_id,year,company_id,'PLAN',is_active,create_by,create_time,is_approval,approval_by,approval_time from bc_ott_master where id=@ref_bc_master_id
set @bc_master_new=SCOPE_IDENTITY()
--insert into bc_ott_plan(name,bc_master_id,content_id,content_name,platform_id,vod_id,method_id,format_id,package_id,censor,censor_date,start_date,end_date,total_episode,total_episode_broadcast,duration,total_day,description,run_order,run_channel_order,create_by,create_time,is_approved,approval_by,approval_time,approval_msg,is_active)
--select name,@bc_master_new,content_id,content_name,platform_id,vod_id,method_id,format_id,package_id,censor,censor_date,start_date,end_date,total_episode,total_episode_broadcast,duration,total_day,description,run_order,run_channel_order,create_by,create_time,is_approved,approval_by,approval_time,approval_msg,is_active from bc_ott_plan where bc_master_id=@ref_bc_master_id and is_active=1
--------------------------------------------------------------------------
	----insert
	DECLARE @plan_id int,@name nvarchar(500),@bc_master_id int,@content_id varchar(100),@content_name nvarchar(MAX),@platform_id int,@vod_id int,@method_id int,@format_id int,@package_id int,@censor bit,@censor_date date,@start_date date,@end_date date,@total_episode int,@total_episode_broadcast int,@duration int,@total_day int,@description nvarchar(MAX),@run_order int,@run_channel_order int,@create_by nvarchar(100),@create_time datetime,@is_approved bit,@approval_by nvarchar(100),@approval_time datetime,@approval_msg nvarchar(MAX),@is_active bit
	DECLARE MY_CURSOR CURSOR 
	  --LOCAL STATIC READ_ONLY FORWARD_ONLY
	FOR 
	SELECT id,name,bc_master_id,content_id,content_name,platform_id,vod_id,method_id,format_id,package_id,censor,censor_date,start_date,end_date,total_episode,total_episode_broadcast,duration,total_day,description,run_order,run_channel_order,create_by,create_time,is_approved,approval_by,approval_time,approval_msg,is_active from bc_ott_plan where bc_master_id=@ref_bc_master_id and is_active=1
	

	OPEN MY_CURSOR
	FETCH NEXT FROM MY_CURSOR INTO @plan_id,@name,@bc_master_id,@content_id,@content_name,@platform_id,@vod_id,@method_id,@format_id,@package_id,@censor,@censor_date,@start_date,@end_date,@total_episode,@total_episode_broadcast,@duration,@total_day,@description,@run_order,@run_channel_order,@create_by,@create_time,@is_approved,@approval_by,@approval_time,@approval_msg,@is_active
	
	WHILE @@FETCH_STATUS = 0
	BEGIN 
	  insert into bc_ott_plan (name,bc_master_id,content_id,content_name,platform_id,vod_id,method_id,format_id,package_id,censor,censor_date,start_date,end_date,total_episode,total_episode_broadcast,duration,total_day,description,run_order,run_channel_order,create_by,create_time,is_approved,approval_by,approval_time,approval_msg,is_active) VALUES (@name,@bc_master_new,@content_id,@content_name,@platform_id,@vod_id,@method_id,@format_id,@package_id,@censor,@censor_date,@start_date,@end_date,@total_episode,@total_episode_broadcast,@duration,@total_day,@description,@run_order,@run_channel_order,@create_by,@create_time,@is_approved,@approval_by,@approval_time,@approval_msg,@is_active)
	  set @bc_plan_new=SCOPE_IDENTITY();
		--khai bao tiep curson segment
			DECLARE @segment_id int,@seg_plan_id int,@is_mon bit,@is_tue bit,@is_wed bit,@is_thu bit,@is_fri bit,@is_sat bit,@is_sun bit,@seg_start_date date,@seg_end_date date,@seg_duration int,@seg_total_episode int,@seg_total_episode_broadcast int,@episode_in_day int,@seg_description nvarchar(MAX),@seg_create_by nvarchar(100),@seg_create_time datetime,@seg_is_active bit
			DECLARE MY_SEGMENT_CURSOR CURSOR 
			 -- LOCAL STATIC READ_ONLY FORWARD_ONLY
			FOR 
			SELECT id,plan_id,is_mon,is_tue,is_wed,is_thu,is_fri,is_sat,is_sun,start_date,end_date,duration,total_episode,total_episode_broadcast,episode_in_day,description,create_by,create_time,is_active FROM bc_ott_segment where plan_id = @plan_id and is_active=1 order by plan_id

			OPEN MY_SEGMENT_CURSOR
			FETCH NEXT FROM MY_SEGMENT_CURSOR INTO @segment_id,@seg_plan_id,@is_mon,@is_tue,@is_wed,@is_thu,@is_fri,@is_sat,@is_sun,@seg_start_date,@seg_end_date,@seg_duration,@seg_total_episode,@seg_total_episode_broadcast,@episode_in_day,@seg_description,@seg_create_by,@seg_create_time,@seg_is_active
			WHILE @@FETCH_STATUS = 0
			BEGIN 
			  insert into bc_ott_segment(plan_id,is_mon,is_tue,is_wed,is_thu,is_fri,is_sat,is_sun,start_date,end_date,duration,total_episode,total_episode_broadcast,episode_in_day,description,create_by,create_time,is_active) VALUES (@bc_plan_new,@is_mon,@is_tue,@is_wed,@is_thu,@is_fri,@is_sat,@is_sun,@seg_start_date,@seg_end_date,@seg_duration,@seg_total_episode,@seg_total_episode_broadcast,@episode_in_day,@seg_description,@seg_create_by,@seg_create_time,@seg_is_active)
				--khai bao tiep curson episode
					set @bc_segment_new=SCOPE_IDENTITY();
					--khai bao tiep curson episode
						DECLARE @epi_id int,@epi_segment_id int,@epi_plan_id int,@epi_create_by nvarchar(100),@epi_create_time datetime
						DECLARE MY_EPISODE_CURSOR CURSOR 
							-- LOCAL STATIC READ_ONLY FORWARD_ONLY
						FOR 
						SELECT id,segment_id,plan_id,create_by,create_time FROM bc_ott_episode where plan_id= @plan_id and segment_id=@segment_id

						OPEN MY_EPISODE_CURSOR
						FETCH NEXT FROM MY_EPISODE_CURSOR INTO 
							@epi_id,@epi_segment_id,@epi_plan_id,@epi_create_by,@epi_create_time
					
						WHILE @@FETCH_STATUS = 0
						BEGIN 
							insert into bc_ott_episode(segment_id, plan_id,create_by,create_time) VALUES (@bc_segment_new,@bc_plan_new,@epi_create_by,@epi_create_time)

							--khai bao tiep curson part
								--khai bao tiep curson episode
							set @bc_episode_new=SCOPE_IDENTITY();
							insert into bc_ott_part(bc_episode_id,start_date,time_slot,start_time,duration,description,create_by,create_time,episode_number) SELECT @bc_episode_new,start_date,time_slot,start_time,duration,description,create_by,create_time,episode_number FROM bc_ott_part where bc_episode_id= @epi_id
						
							FETCH NEXT FROM MY_EPISODE_CURSOR INTO @epi_id,@epi_segment_id,@epi_plan_id,@epi_create_by,@epi_create_time
							
						END
						CLOSE MY_EPISODE_CURSOR
						DEALLOCATE MY_EPISODE_CURSOR
				--end
				FETCH NEXT FROM MY_SEGMENT_CURSOR INTO @segment_id,@seg_plan_id,@is_mon,@is_tue,@is_wed,@is_thu,@is_fri,@is_sat,@is_sun,@seg_start_date,@seg_end_date,@seg_duration,@seg_total_episode,@seg_total_episode_broadcast,@episode_in_day,@seg_description,@seg_create_by,@seg_create_time,@seg_is_active
			
			END
			CLOSE MY_SEGMENT_CURSOR
			DEALLOCATE MY_SEGMENT_CURSOR
		--end
	    FETCH NEXT FROM MY_CURSOR INTO @plan_id,@name,@bc_master_id,@content_id,@content_name,@platform_id,@vod_id,@method_id,@format_id,@package_id,@censor,@censor_date,@start_date,@end_date,@total_episode,@total_episode_broadcast,@duration,@total_day,@description,@run_order,@run_channel_order,@create_by,@create_time,@is_approved,@approval_by,@approval_time,@approval_msg,@is_active
	
	END
	CLOSE MY_CURSOR
	DEALLOCATE MY_CURSOR
	---------------------------------------------------------------

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEditSegment]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteEditSegment] 
	-- Add the parameters for the stored procedure here
	@segment_id uniqueidentifier,
	@date datetime
AS
BEGIN
		Select p.episode_number from bc_part p
		join bc_episode e
		on p.bc_episode_id = e.id
		where e.segment_id = @segment_id and p.start_date >= @date
		order by p.episode_number

		delete p
		from bc_part p
		join bc_episode e
		on p.bc_episode_id = e.id
		where e.segment_id = @segment_id and p.start_date >= @date

		delete e
		from bc_part p
		join bc_episode e
		on p.bc_episode_id = e.id
		where e.segment_id = @segment_id and p.start_date >= @date
END
GO
/****** Object:  StoredProcedure [dbo].[IsConflictTimeBC]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IsConflictTimeBC] 
	-- Add the parameters for the stored procedure here
	@master_type varchar(100),
	@master_name nvarchar(250),
	@channel_id int,
	@year int,
	@date datetime,
	@total_duration int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SET NOCOUNT ON;
	--Declare @er as datetime
	--set @date=Cast(Concat(Cast(@date as date),' ',Cast(@time as time(0))) as datetime)
	--set @er=DATEADD(MINUTE,@total_duration,Cast(Concat(Cast(@date as date),' ',Cast(@time as time(0))) as datetime))
    -- Insert statements for procedure here
	SELECT m.id as master_id,m.name as master_name,l.name as plan_name,l.id as plan_id,s.id as segment_id,c.name as content_name, p.start_date as conflic_date, p.start_time as conflic_time from bc_part p
	inner join bc_episode e on e.id=p.bc_episode_id
	inner join bc_segment s on s.id=e.segment_id and is_active=1
	inner join bc_plan l on l.is_active=1 and l.id=s.plan_id and l.is_active=1
	inner join bc_master m on m.channel_id=@channel_id and m.year=@year and m.is_active=1 and m.type=@master_type and m.id=l.bc_master_id and m.name=@master_name
	inner join v_content_and_license c on c.id=l.content_id
	where (Cast(Concat(Cast(p.start_date as date),' ',Cast(p.start_time as time(0))) as datetime) <=@date and DATEADD(MINUTE,@total_duration,Cast(Concat(Cast(p.start_date as date),' ',Cast(p.start_time as time(0))) as datetime)) > @date) or(
	Cast(Concat(Cast(p.start_date as date),' ',Cast(p.start_time as time(0))) as datetime) < DATEADD(MINUTE,@total_duration,@date) and DATEADD(MINUTE,@total_duration,Cast(Concat(Cast(p.start_date as date),' ',Cast(p.start_time as time(0))) as datetime)) >= DATEADD(MINUTE,@total_duration,@date))
	
END
GO
/****** Object:  StoredProcedure [dbo].[ListTimeBC]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListTimeBC] 
	-- Add the parameters for the stored procedure here
	@channel_id int,
	@start_date datetime,
	@end_date datetime
AS
BEGIN
select cast(p.start_date as datetime) + cast(p.start_time as datetime) as start_time,
	cast(p.start_date as datetime) + cast(DATEADD(MINUTE, p.duration, p.start_time) as datetime) as end_time,
	pl.content_name, pl.name from bc_part as p
  join bc_episode as e on p.bc_episode_id = e.id
  join
  (select bp.id,bp.content_name, m.name from 
	(select t1.id,t1.bc_master_id,t0.content_name from bc_segment t0 join bc_plan t1 on t0.plan_id = t1.id  where @start_date <= t0.end_date AND @end_date >= t0.start_date) as bp
	join
	(select id, name from bc_master where channel_id = @channel_id) as m
	on m.id = bp.bc_master_id) as pl
  on pl.id = e.plan_id
  order by start_time

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Broadcast_detail_export]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Broadcast_detail_export]
	-- Add the parameters for the stored procedure here
	@master_id int
	
AS
BEGIN
	SELECT TOP (100) PERCENT 
		mas.name, (SELECT TOP (1) name
						 FROM    GCS_CATEGORY.dbo.cate_channel AS i0
						 WHERE i0.id = mas.channel_id) AS channel_name,
		mas.year, 
		CASE s.type
		WHEN 0 THEN N'Phát lại'
		WHEN 1 THEN N'Phát mới' END as type,
		(SELECT TOP (1) display_name
						 FROM    GCS_USERS.dbo.auth_user AS i6
						 WHERE i6.username = t.create_by) AS create_by,
		t.create_time,s.content_name,p.episode_number, p.start_date,
		CASE DATEPART(WEEKDAY,p.start_date)  
			WHEN 1 THEN 'CN' 
			WHEN 2 THEN 'T2' 
			WHEN 3 THEN 'T3' 
			WHEN 4 THEN 'T4' 
			WHEN 5 THEN 'T5' 
			WHEN 6 THEN 'T6' 
			WHEN 7 THEN 'T7' 
		END AS day_start, p.time_slot, p.start_time,
		DATEADD(MINUTE, p.duration, p.start_time) AS end_time,
		p.duration,s.total_episode as total_episode_broadcast,
		CASE LEFT(s.post_master_id,1) 
		WHEN '' THEN ''
		WHEN 'M' THEN (SELECT i7.episode
						 FROM GCS_CONTENT_MASTER.dbo.ct_master AS i7
						 WHERE i7.id = s.post_master_id)
		WHEN 'P' THEN (SELECT i7.total
						 FROM GCS_CONTENT_POST.dbo.ct_post AS i7
						 WHERE i7.id = s.post_master_id)
		END as total_post_master, s.id as segment_id
		FROM   dbo.bc_segment AS s INNER JOIN
					 dbo.bc_episode AS e ON s.id = e.segment_id INNER JOIN
					 dbo.bc_part AS p ON e.id = p.bc_episode_id INNER JOIN
						 (SELECT id, name, bc_master_id, content_id, content_name, post_master_id, type, start_date, end_date, total_episode, total_episode_broadcast, duration, total_day, create_by, create_time,  is_active
						 FROM    dbo.bc_plan AS i
						 WHERE (is_active = 1)) AS t ON s.plan_id = t.id
					Inner join (select id, channel_id, name,year from bc_master where is_active = 1 and id =@master_id ) as mas
					on mas.id = t.bc_master_id
					inner join (select id,content_type_id,content_category_id, original_name from GCS_CONTENT.dbo.ct_content where is_liquit = 0) as ct on ct.id = s.content_id
		order by s.content_name, p.episode_number
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Broadcast_export]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Broadcast_export]
	-- Add the parameters for the stored procedure here
	@master_id int
AS
BEGIN
	SELECT TOP (100) PERCENT 
		mas.name as plan_name,
		p.time_slot,
		CASE DATEPART(WEEKDAY,p.start_date)  
			WHEN 1 THEN 'CN' 
			WHEN 2 THEN 'T2' 
			WHEN 3 THEN 'T3' 
			WHEN 4 THEN 'T4' 
			WHEN 5 THEN 'T5' 
			WHEN 6 THEN 'T6' 
			WHEN 7 THEN 'T7' 
		END AS day_start, s.start_date,
		 (SELECT TOP (1) name
						 FROM    GCS_CATEGORY.dbo.cate_channel AS i0
						 WHERE i0.id = mas.channel_id) AS channel_name,
		s.episode_in_day,
		CASE WHEN s.is_mon = 0 THEN '' ELSE N'Hai,' END
		+
		CASE WHEN s.is_tue = 0 THEN '' ELSE N'Ba,' END
		+
		CASE WHEN s.is_wed = 0 THEN '' ELSE N'Tư,' END
		+
		CASE WHEN s.is_thu = 0 THEN '' ELSE N'Năm,' END
		+
		CASE WHEN s.is_fri = 0 THEN '' ELSE N'Sáu,' END
		+
		CASE WHEN s.is_sat = 0 THEN '' ELSE N'Bảy,' END
		+
		CASE WHEN s.is_sun = 0 THEN '' ELSE N'CN,' END as day_of_week,
		s.end_date, 
		case s.total_episode_broadcast%s.episode_in_day when 0 then s.total_episode_broadcast/s.episode_in_day else s.total_episode_broadcast/s.episode_in_day + 1 end as total_day,
		t.create_time, 
		(SELECT TOP (1) display_name
						 FROM    GCS_USERS.dbo.auth_user AS i6
						 WHERE i6.username = t.create_by) AS create_by
		,s.content_name, s.duration,
		(SELECT TOP (1) name
						 FROM    GCS_CATEGORY.dbo.cate_content_type AS i6
						 WHERE id = ct.content_type_id) AS content_type, 
		 GCS_CONTENT.dbo.ConvertContentCategory(ct.content_category_id) as content_category,
		  (SELECT TOP (1) GCS_CONTENT.dbo.ConvertNation(nation_id)
						 FROM GCS_CONTENT_SOURCE.dbo.content_source AS i7
						 WHERE content_id = ct.id) AS nation,
		(SELECT TOP (1) year
						 FROM GCS_CONTENT_SOURCE.dbo.content_source AS i7
						 WHERE content_id = ct.id) AS year,
		p.episode_number, ct.original_name,
		CASE LEFT(s.post_master_id,1) 
		WHEN '' THEN ''
		WHEN 'M' THEN 'MASTER'
		WHEN 'P' THEN (SELECT i7.name
						 FROM GCS_CATEGORY.dbo.cate_post_type AS i7
						 join GCS_CONTENT_POST.dbo.ct_post as i8
						 on i8.post_type_id = i7.id
						 WHERE i8.id = s.post_master_id)
		END as post_master,
		CASE LEFT(s.post_master_id,1) 
		WHEN '' THEN ''
		WHEN 'M' THEN (SELECT i7.episode
						 FROM GCS_CONTENT_MASTER.dbo.ct_master AS i7
						 WHERE i7.id = s.post_master_id)
		WHEN 'P' THEN (SELECT i7.total
						 FROM GCS_CONTENT_POST.dbo.ct_post AS i7
						 WHERE i7.id = s.post_master_id)
		END as total_post_master,
		s.total_episode as total_episode_broadcast,
		null as total_run,null as run_order,null as run_remain, s.id as segment_id, s.notes
		FROM  (select * from dbo.bc_segment) AS s INNER JOIN
					 dbo.bc_episode AS e ON s.id = e.segment_id INNER JOIN
					 dbo.bc_part AS p ON e.id = p.bc_episode_id INNER JOIN
						 (SELECT id, name, bc_master_id, content_id, content_name, post_master_id, type, start_date, end_date, total_episode, total_episode_broadcast, duration, total_day, description, run_order, run_channel_order, create_by, create_time,  is_active
						 FROM    dbo.bc_plan AS i
						 WHERE (is_active = 1)) AS t ON s.plan_id = t.id
					Inner join (select id, channel_id, name from bc_master where is_active = 1 and id =@master_id ) as mas
					on mas.id = t.bc_master_id
					inner join (select id,content_type_id,content_category_id, original_name from GCS_CONTENT.dbo.ct_content where is_liquit = 0) as ct on ct.id = s.content_id
		order by s.content_name, p.episode_number
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Broadcast_export_plan]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Broadcast_export_plan]
	-- Add the parameters for the stored procedure here
	@master_id int
AS
BEGIN
	SELECT TOP (100) PERCENT 
		p.start_date,
		DAY(p.start_date) as day,
		MONTH(p.start_date) as month,
		YEAR(p.start_date) as year,
		CASE DATEPART(WEEKDAY,p.start_date)  
			WHEN 1 THEN 'CN' 
			WHEN 2 THEN 'T2' 
			WHEN 3 THEN 'T3' 
			WHEN 4 THEN 'T4' 
			WHEN 5 THEN 'T5' 
			WHEN 6 THEN 'T6' 
			WHEN 7 THEN 'T7' 
		END AS day_start, 
		ct.name as content_name,
		(SELECT TOP (1) name
			FROM    GCS_CATEGORY.dbo.cate_content_type AS i6
			WHERE id = ct.content_type_id) AS content_type, 
		 GCS_CONTENT.dbo.ConvertContentCategory(ct.content_category_id) as content_category,
		(SELECT TOP (1) GCS_CONTENT.dbo.ConvertNation(nation_id)
			FROM GCS_CONTENT_SOURCE.dbo.content_source AS i7
			WHERE content_id = ct.id) AS nation,
		p.time_slot,
		CASE WHEN s.is_mon = 0 THEN '' ELSE N'Hai,' END
		+
		CASE WHEN s.is_tue = 0 THEN '' ELSE N'Ba,' END
		+
		CASE WHEN s.is_wed = 0 THEN '' ELSE N'Tư,' END
		+
		CASE WHEN s.is_thu = 0 THEN '' ELSE N'Năm,' END
		+
		CASE WHEN s.is_fri = 0 THEN '' ELSE N'Sáu,' END
		+
		CASE WHEN s.is_sat = 0 THEN '' ELSE N'Bảy,' END
		+
		CASE WHEN s.is_sun = 0 THEN '' ELSE N'CN,' END as day_of_week,
		CASE LEFT(s.post_master_id,1) 
		WHEN '' THEN ''
		WHEN 'M' THEN (SELECT i7.episode
						 FROM GCS_CONTENT_MASTER.dbo.ct_master AS i7
						 WHERE i7.id = s.post_master_id)
		WHEN 'P' THEN (SELECT i7.total
						 FROM GCS_CONTENT_POST.dbo.ct_post AS i7
						 WHERE i7.id = s.post_master_id)
		END as total_post_master,
		(SELECT
		  (SELECT
			 MAX(MyMaxName) 
		   FROM ( VALUES 
					(MAX(non_exclusive_end_date)), 
					(MAX(exclusive_end_date)) 
				) MyAlias(MyMaxName)
		  ) 
		FROM GCS_CONTENT_LICENSE.dbo.license_detail  where id_content_license = cl.id) as expired_date,
		null as total_run, ct.code, s.description, 0 as number_run, ct.rating_averager,

		(SELECT TOP (1) GCS_CONTENT.dbo.ConvertManufacturer(supplier_id)
			FROM GCS_CONTENT_SOURCE.dbo.content_source AS i7
			WHERE content_id = ct.id) AS supplier,
		(SELECT TOP (1) name
			FROM  GCS_CATEGORY.dbo.cate_post_corp
			WHERE id = (select post_corp_id from GCS_CONTENT_SOURCE.dbo.content_source AS i7
			WHERE content_id = ct.id)) AS post_corp, 
		(SELECT TOP (1) GCS_CONTENT.dbo.ConvertOwner(owner_id)
			FROM GCS_CONTENT_SOURCE.dbo.content_source AS i7
			WHERE content_id = ct.id) AS owner,
		ct.ranking_id,s.notes,s.duration,(select license_notes from GCS_CONTENT_LICENSE.dbo.content_license where content_id = ct.id) as license_notes,s.id as segment_id

		FROM  (select * from dbo.bc_segment) AS s INNER JOIN
					 dbo.bc_episode AS e ON s.id = e.segment_id INNER JOIN
					 dbo.bc_part AS p ON e.id = p.bc_episode_id INNER JOIN
						 (SELECT id, name, bc_master_id, content_id, content_name, post_master_id, type, start_date, end_date, total_episode, total_episode_broadcast, duration, total_day, description, run_order, run_channel_order, create_by, create_time,  is_active
						 FROM    dbo.bc_plan AS i
						 WHERE (is_active = 1)) AS t ON s.plan_id = t.id
					Inner join (select id, channel_id, name from bc_master where is_active = 1 and id = @master_id ) as mas
					on mas.id = t.bc_master_id
					inner join (select id,name,code,ranking_id, rating_averager ,content_type_id,content_category_id, original_name from GCS_CONTENT.dbo.ct_content where is_liquit = 0) as ct on ct.id = s.content_id
					left join (select id,license_notes, content_id from GCS_CONTENT_LICENSE.dbo.content_license ) as cl on cl.content_id = ct.id
		order by s.content_name, p.episode_number
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteMasterPlan]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_DeleteMasterPlan]
	@master_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from bc_part where bc_episode_id in (select id from bc_episode where plan_id in (select id from bc_plan where bc_master_id=@master_id))
	delete from bc_episode where plan_id in (select id from bc_plan where bc_master_id=@master_id)
	delete from bc_segment where plan_id in (select id from bc_plan where bc_master_id=@master_id)
	delete from bc_plan where bc_master_id=@master_id
	delete from bc_master where id=@master_id
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteMasterPlanOTT]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_DeleteMasterPlanOTT]
	@master_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from bc_ott_part where bc_episode_id in (select id from bc_ott_episode where plan_id in (select id from bc_ott_plan where bc_master_id=@master_id))
	delete from bc_ott_episode where plan_id in (select id from bc_ott_plan where bc_master_id=@master_id)
	delete from bc_ott_segment where plan_id in (select id from bc_ott_plan where bc_master_id=@master_id)
	delete from bc_ott_plan where bc_master_id=@master_id
	delete from bc_ott_master where id=@master_id
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePlan]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_DeletePlan]
	@master_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from bc_part where bc_episode_id in (select id from bc_episode where plan_id in (select id from bc_plan where bc_master_id=@master_id))
	delete from bc_episode where plan_id in (select id from bc_plan where bc_master_id=@master_id)
	delete from bc_segment where plan_id in (select id from bc_plan where bc_master_id=@master_id)
	delete from bc_plan where bc_master_id=@master_id
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePlan_new]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeletePlan_new]
	@segment_id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from bc_part where bc_episode_id in (select id from bc_episode where segment_id = @segment_id)
	delete from bc_episode  where segment_id = @segment_id
	delete from bc_segment  where id = @segment_id
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePlanOTT]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_DeletePlanOTT]
	@master_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from bc_ott_part where bc_episode_id in (select id from bc_ott_episode where plan_id in (select id from bc_ott_plan where bc_master_id=@master_id))
	delete from bc_ott_episode where plan_id in (select id from bc_ott_plan where bc_master_id=@master_id)
	delete from bc_ott_segment where plan_id in (select id from bc_ott_plan where bc_master_id=@master_id)
	delete from bc_ott_plan where bc_master_id=@master_id
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePlanOTT_new]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeletePlanOTT_new]
	@master_id int,
	@plan_edit_id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from bc_ott_part where bc_episode_id in (select id from bc_ott_episode where plan_id = @plan_edit_id)
	delete from bc_ott_episode where plan_id = @plan_edit_id
	delete from bc_ott_segment where plan_id = @plan_edit_id
	delete from bc_ott_plan where id = @plan_edit_id
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBroadcastByChannel]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBroadcastByChannel]
	@ChannelId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
		SET NOCOUNT ON;
		declare @channel_type_id int
		Select @channel_type_id = id_cate_channel_type from [GCS_CATEGORY].[dbo].[cate_channel] where id = @ChannelId
		IF @channel_type_id = 1
		begin
			SELECT TOP (100) PERCENT p.id, e.id AS episode_id, p.time_slot, p.start_date as plan_start_date, 
				 p.start_time, DATEADD(MINUTE, p.duration, p.start_time) AS end_time, p.duration, p.create_by, p.create_time, i.id AS segment_id, p.episode_number,
				  CAST(p.start_date AS DATETIME) + cast(p.start_time as datetime) as StartTime, CAST(p.start_date AS DATETIME) + cast(DATEADD(MINUTE, p.duration, p.start_time) as datetime) as EndTime,
				 i.start_date, i.end_date, i.total_episode, ct.name as Subject, na.name as Nation, ct.content_type_id,
				 ct.name + N'-Tập ' + ISNULL(CAST(p.episode_number as nvarchar(100)),'') as content_episode, pl.type as plan_type,
				 ISNULL(CAST(i.total_episode as nvarchar(100)),'') +  N' tập (' + ISNULL(CAST(i.start_date as nvarchar(100)),'') + N'=>' +ISNULL(CAST(i.end_date as nvarchar(100)),'') + ')' as description
			FROM   dbo.bc_segment AS i INNER JOIN
				 dbo.bc_episode AS e ON i.id = e.segment_id INNER JOIN
				 dbo.bc_part AS p ON e.id = p.bc_episode_id
				 inner join dbo.bc_plan as pl on pl.id = i.plan_id
				 inner join dbo.bc_master as m on m.id = pl.bc_master_id
				 inner join GCS_CONTENT.dbo.ct_content ct on pl.content_id = ct.id
				 inner join GCS_CONTENT_SOURCE.dbo.content_source cs on cs.content_id = pl.content_id
				 outer apply STRING_SPLIT(cs.nation_id, ';') s
				left join GCS_CATEGORY.dbo.cate_nation na on na.id = s.value
				where m.channel_id = @ChannelId
				ORDER BY p.start_date, p.start_time
		end
		ELSE
		begin
			SELECT TOP (100) PERCENT p.id, e.id AS episode_id, p.time_slot, p.start_date as plan_start_date, 
             p.start_time, DATEADD(MINUTE, p.duration, p.start_time) AS end_time, p.duration, p.create_by, p.create_time, i.id AS segment_id, i.total_episode as episode_number,
			  CAST(p.start_date AS DATETIME) + cast(p.start_time as datetime) as StartTime, CAST(p.start_date AS DATETIME) + cast(DATEADD(MINUTE, p.duration, p.start_time) as datetime) as EndTime,
			 i.start_date, i.end_date, i.total_episode, ct.name as Subject, na.name as Nation, ct.content_type_id,
			 ct.name + N'-Tập ' + ISNULL(CAST(e.id as nvarchar(100)),'') as content_episode, 1 as plan_type,
			 ISNULL(CAST(i.total_episode as nvarchar(100)),'') +  N' tập (' + ISNULL(CAST(i.start_date as nvarchar(100)),'') + N'=>' +ISNULL(CAST(i.end_date as nvarchar(100)),'') + ')' as description
		FROM   dbo.bc_ott_segment AS i INNER JOIN
             dbo.bc_ott_episode AS e ON i.id = e.segment_id INNER JOIN
             dbo.bc_ott_part AS p ON e.id = p.bc_episode_id
			 inner join dbo.bc_ott_plan as pl on pl.id = i.plan_id
			 inner join dbo.bc_ott_master as m on m.id = pl.bc_master_id
			 inner join GCS_CONTENT.dbo.ct_content ct on pl.content_id = ct.id
			 inner join GCS_CONTENT_SOURCE.dbo.content_source cs on cs.content_id = pl.content_id
			 outer apply STRING_SPLIT(cs.nation_id, ';') s
			left join GCS_CATEGORY.dbo.cate_nation na on na.id = s.value
			where m.channel_id = @ChannelId
			ORDER BY p.start_date, p.start_time
		end

		
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetBroadcastDigital]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBroadcastDigital]
	@ChannelId int = null,
	@PlanType varchar(15) = null,
	@MasterId int = null,
	@ContentId varchar(100) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
		SET NOCOUNT ON;
		SELECT TOP (100) PERCENT p.id, e.id AS episode_id, p.time_slot, p.start_date as plan_start_date, 
             p.start_time, DATEADD(MINUTE, p.duration, p.start_time) AS end_time, p.duration, p.create_by, p.create_time, i.id AS segment_id, i.total_episode as episode_number,
			  CAST(p.start_date AS DATETIME) + cast(p.start_time as datetime) as StartTime, CAST(p.start_date AS DATETIME) + cast(DATEADD(MINUTE, p.duration, p.start_time) as datetime) as EndTime,
			 i.start_date, i.end_date, i.total_episode, ct.name as Subject, na.name as Nation, ct.content_type_id,
			 ct.name + '- ' + chan.name + N'-Tập ' + ISNULL(CAST(p.episode_number as nvarchar(100)),'') as content_episode, 1 as plan_type,
			 ISNULL(CAST(i.total_episode as nvarchar(100)),'') +  N' tập (' + ISNULL(CAST(i.start_date as nvarchar(100)),'') + N'=>' +ISNULL(CAST(i.end_date as nvarchar(100)),'') + ')' as description,
			 chan.name as channel_name
		FROM   dbo.bc_ott_segment AS i INNER JOIN
             dbo.bc_ott_episode AS e ON i.id = e.segment_id INNER JOIN
             dbo.bc_ott_part AS p ON e.id = p.bc_episode_id
			 inner join dbo.bc_ott_plan as pl on pl.id = i.plan_id
			 inner join dbo.bc_ott_master as m on m.id = pl.bc_master_id
			 inner join GCS_CONTENT.dbo.ct_content ct on pl.content_id = ct.id
			 inner join GCS_CATEGORY.dbo.cate_channel chan on chan.id = m.channel_id
			 inner join GCS_CONTENT_SOURCE.dbo.content_source cs on cs.content_id = pl.content_id
			 outer apply STRING_SPLIT(cs.nation_id, ';') s
			left join GCS_CATEGORY.dbo.cate_nation na on na.id = s.value
			where pl.is_active = 1 and (@ChannelId is null OR  m.channel_id = @ChannelId) and (@MasterId is null or m.id = @MasterId)
			and (@PlanType is null OR m.type = @PlanType) and (@ContentId is null OR pl.content_id = @ContentId)
			ORDER BY p.start_date, p.start_time

		
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetBroadcastTV]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBroadcastTV]
	@ChannelId int = null,
	@PlanType varchar(15) = null,
	@MasterId int = null,
	@ContentId varchar(100) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
		SET NOCOUNT ON;
		SELECT TOP (100) PERCENT p.id, e.id AS episode_id, p.time_slot, p.start_date as plan_start_date, 
				 p.start_time, DATEADD(MINUTE, p.duration, p.start_time) AS end_time, p.duration, p.create_by, p.create_time, i.id AS segment_id, p.episode_number,
				  CAST(p.start_date AS DATETIME) + cast(p.start_time as datetime) as StartTime, CAST(p.start_date AS DATETIME) + cast(DATEADD(MINUTE, p.duration, p.start_time) as datetime) as EndTime,
				 i.start_date, i.end_date, i.total_episode, ct.name as Subject, na.name as Nation, ct.content_type_id,
				 ct.name + '- ' + chan.name + N'-Tập ' + ISNULL(CAST(p.episode_number as nvarchar(100)),'') as content_episode, pl.type as plan_type,
				 ISNULL(CAST(i.total_episode as nvarchar(100)),'') +  N' tập (' + ISNULL(CAST(i.start_date as nvarchar(100)),'') + N'=>' +ISNULL(CAST(i.end_date as nvarchar(100)),'') + ')' as description,
				 chan.name as channel_name
			FROM   dbo.bc_segment AS i INNER JOIN
				 dbo.bc_episode AS e ON i.id = e.segment_id INNER JOIN
				 dbo.bc_part AS p ON e.id = p.bc_episode_id
				 inner join dbo.bc_plan as pl on pl.id = i.plan_id
				 inner join dbo.bc_master as m on m.id = pl.bc_master_id
				 inner join GCS_CONTENT.dbo.ct_content ct on pl.content_id = ct.id
				 inner join GCS_CATEGORY.dbo.cate_channel chan on chan.id = m.channel_id
				 inner join GCS_CONTENT_SOURCE.dbo.content_source cs on cs.content_id = pl.content_id
				 outer apply STRING_SPLIT(cs.nation_id, ';') s
				left join GCS_CATEGORY.dbo.cate_nation na on na.id = s.value
				where pl.is_active = 1 and (@ChannelId is null OR  m.channel_id = @ChannelId) and (@MasterId is null or m.id = @MasterId) 
						and (@PlanType is null OR m.type = @PlanType) and (@ContentId is null OR pl.content_id = @ContentId)
				ORDER BY p.start_date, p.start_time

		
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetLicenseContent]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLicenseContent]
	@contentId nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select ld.id, ld.id_content_license,ld.id_delivery_license, 
			cate_dl.name, cate_dl.Type, ld.exclusive_start_date, ld.exclusive_end_date, 
			ld.non_exclusive_start_date, ld.non_exclusive_end_date,
			ld.channel_rights, ld.is_all_channel
	from GCS_CONTENT_LICENSE.dbo.license_detail ld 
		join GCS_CATEGORY.dbo.cate_delivery_license cate_dl on ld.id_delivery_license =cate_dl.id
	where id_content_license = (select id from GCS_CONTENT_LICENSE.dbo.content_license where content_id=@contentId) and ld.is_active = 1
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetLicenseContract]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLicenseContract]
	-- Add the parameters for the stored procedure here
	@masterId nvarchar(max)
AS
BEGIN
	select ld.exclusive_end_date, ld.non_exclusive_end_date,dbo.ConvertChannel(ld.channel_rights) as channel_rights,c.LicenseNote from GCS_CONTRACT.dbo.master m
	join GCS_CONTRACT.dbo.Contract c
	on c.Id = m.ContractId
	left join GCS_CONTRACT.dbo.license_detail ld
	on ld.ContractId = c.Id
	left join GCS_CATEGORY.dbo.cate_platform_delivery_license cp
	on cp.id = ld.delivery_platform_id
	left join GCS_CATEGORY.dbo.cate_delivery_license dl
	on dl.id = cp.delivery_license_id
	where m.id = @masterId and dl.Type = 'TV' and c.IsDelete = 0 and ld.is_active = 1 and dl.is_active = 1
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetLicenseContractByContent]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLicenseContractByContent]
	-- Add the parameters for the stored procedure here
	@contentId nvarchar(max),
	@startDate datetime
AS
BEGIN
	select (select name from GCS_CATEGORY.dbo.cate_vendor where id = c.SupplierId) as Supplier, ld.exclusive_start_date, ld.exclusive_end_date,ld.non_exclusive_start_date, ld.non_exclusive_end_date,dbo.ConvertChannel(ld.channel_rights) as channel_rights,c.LicenseNote from GCS_CONTRACT.dbo.Contract c
	left join GCS_CONTRACT.dbo.license_detail ld
	on ld.ContractId = c.Id
	join GCS_CATEGORY.dbo.cate_vendor v 
	on v.id = c.OwnerId
	left join GCS_CATEGORY.dbo.cate_platform_delivery_license cp
	on cp.id = ld.delivery_platform_id
	left join GCS_CATEGORY.dbo.cate_delivery_license dl
	on dl.id = cp.delivery_license_id
	where c.ContentId = @contentId and dl.Type = 'TV' and c.IsDelete = 0 and ld.is_active = 1 and dl.is_active = 1 and v.Company_code = 20
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetPlanInfo]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPlanInfo]
	-- Add the parameters for the stored procedure here
	@planId UNIQUEIDENTIFIER
AS
BEGIN
	select 
	CASE
    WHEN PostMasterType = 2 THEN (select (select ContractContentName from GCS_CONTRACT.dbo.Contract where id = ContractId) from GCS_CONTRACT.dbo.master  where id = p.PostMasterId)
    ELSE  (select Name from GCS_CONTENT_POST.dbo.ct_post where id = PostMasterId)
	END as PostMasterName,
	CASE
    WHEN PostMasterType = 2 THEN (select duration_minute from GCS_CONTRACT.dbo.master  where id = p.PostMasterId)
    ELSE  (select duration_minute from GCS_CONTENT_POST.dbo.ct_post where id = PostMasterId)
	END as PostMasterDuration,
	CASE
    WHEN PostMasterType = 2 THEN (select episode from GCS_CONTRACT.dbo.master  where id = p.PostMasterId)
    ELSE  (select total from GCS_CONTENT_POST.dbo.ct_post where id = PostMasterId)
	END as PostMasterEpisode,
	(select name from GCS_CATEGORY.dbo.cate_content_type where id = ct.content_type_id) as ContentType,
	dbo.ConvertNation(ct.nation_id) as Nation,
	ct.code as Code,
	CASE
    WHEN PostMasterType = 2 THEN (select (select (select name from GCS_CATEGORY.dbo.cate_vendor where id = SupplierId) from GCS_CONTRACT.dbo.Contract where id = ContractId) from GCS_CONTRACT.dbo.master  where id = p.PostMasterId)
    ELSE  (select (select name from GCS_CATEGORY.dbo.cate_vendor where id = post_corp_id) from GCS_CONTENT_POST.dbo.ct_post where id = PostMasterId)
	END as Vendor, ranking_id,dbo.ConvertContentCategory(content_category_id) as ContentCategory
from broadcast_plan p
join GCS_CONTENT.dbo.ct_content_consolidate ct
on p.ContentId = ct.id
where p.Id = @planId
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetSaleContent]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSaleContent]
	@contentId nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select cs.id, cs.id_delivery_license, 
			cate_dl.name, cate_dl.Type, cs.exclusive_start_date, cs.exclusive_end_date, 
			cs.non_exclusive_start_date, cs.non_exclusive_end_date,cs.run, cs.run_remain, cs.run_used, cs.channel_id
	from GCS_CONTENT_SALE.dbo.content_sale cs 
		join GCS_CATEGORY.dbo.cate_delivery_license cate_dl on cs.id_delivery_license =cate_dl.id
	where content_id = @contentId and cs.is_active = 1

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetWindowing]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetWindowing]
	-- Add the parameters for the stored procedure here
	@start_time date,
	@end_time date,
	@vip int,
	@viphbogo int,
	@vipkplus int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @WHERE_SQL nvarchar(MAX)
	DECLARE @SEARCH_SQL	nvarchar(MAX)
	DECLARE @ParmDefinition nvarchar(MAX)
	declare @StartTime_AsOf_Dt date
	declare @EndTime_AsOf_Dt date
	SET @WHERE_SQL = ' WHERE 1 = 1 '
	SET @StartTime_AsOf_Dt=cast(@start_time as date)
	SET @EndTime_AsOf_Dt= cast(@end_time as date)
	if @vip=1
		begin
			SET @WHERE_SQL=@WHERE_SQL +' AND VIP=1 '
		end
	
	else if @vip=2
		begin
			SET @WHERE_SQL=@WHERE_SQL +' AND VIP=0 '
		end
	if @viphbogo=1
		begin
			SET @WHERE_SQL=@WHERE_SQL +' AND VIP_HBO_GO=1 '
		end
	
	else if @viphbogo=2
		begin
			SET @WHERE_SQL=@WHERE_SQL +' AND VIP_HBO_GO=0 '
		end
	if @vipkplus=1
		begin
			SET @WHERE_SQL=@WHERE_SQL +' AND VIP_K_PLus=1 '
		end
	
	else if @vipkplus=2
		begin
			SET @WHERE_SQL=@WHERE_SQL +' AND VIP_K_PLus=0 '
		end

	SET @WHERE_SQL=@WHERE_SQL + ' AND (CONVERT(DATE,CONVERT(varchar,start_time),23) >= CONVERT(DATE, '''+CONVERT(varchar, @start_time ) +''',23))'+' AND (CONVERT(DATE,CONVERT(varchar,start_time),23) <= CONVERT(DATE, '''+CONVERT(varchar, @end_time ) +''',23))'
    -- Insert statements for procedure here

	set @SEARCH_SQL=N'select * from v_windowing'+ @WHERE_SQL +' Order by start_time asc'
	SET @ParmDefinition = N'@start_time_in date, 
							@end_time_in date,
							@vip_in int,
							@viphbogo_in int,
							@vipkplus_in int';
	EXECUTE sp_executesql @SEARCH_SQL, @ParmDefinition,
		@start_time_in=@start_time,
		@end_time_in=@end_time,			
		@vip_in=@vip,
	@viphbogo_in=@viphbogo,
	@vipkplus_in=@vipkplus
END
GO
/****** Object:  StoredProcedure [dbo].[sp_test]    Script Date: 4/25/2024 4:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_test]
@bc_epi bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	SELECT * from bc_part p where bc_episode_id=@bc_epi
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
         Begin Table = "m"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ch"
            Begin Extent = 
               Top = 6
               Left = 317
               Bottom = 136
               Right = 518
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pl_c"
            Begin Extent = 
               Top = 6
               Left = 556
               Bottom = 102
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "n"
            Begin Extent = 
               Top = 6
               Left = 764
               Bottom = 119
               Right = 934
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_bc_ott_list'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_bc_ott_list'
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
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_bc_ott_master'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_bc_ott_master'
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
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 305
               Bottom = 136
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 520
               Bottom = 136
               Right = 724
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_company_episode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_company_episode'
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
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 6
               Left = 305
               Bottom = 136
               Right = 511
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_and_license'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_and_license'
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
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 500
               Bottom = 136
               Right = 729
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
         Width = 1935
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_in_master'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_in_master'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_nation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_nation'
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
         Begin Table = "e"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 9
               Left = 346
               Bottom = 206
               Right = 598
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 9
               Left = 655
               Bottom = 206
               Right = 877
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_episode_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_episode_plan'
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
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "pl_c"
            Begin Extent = 
               Top = 6
               Left = 485
               Bottom = 102
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "n"
            Begin Extent = 
               Top = 6
               Left = 693
               Bottom = 119
               Right = 863
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ch"
            Begin Extent = 
               Top = 6
               Left = 246
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
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_master_active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_master_active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_master_active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[30] 2[33] 3) )"
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
         Left = -480
      End
      Begin Tables = 
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 137
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 9
               Left = 350
               Bottom = 206
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "t0"
            Begin Extent = 
               Top = 9
               Left = 1189
               Bottom = 481
               Right = 1485
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 754
               Bottom = 425
               Right = 924
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t1"
            Begin Extent = 
               Top = 6
               Left = 962
               Bottom = 339
               Right = 1132
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 341
               Left = 996
               Bottom = 574
               Right = 1192
            End
            DisplayFlags = 280
            TopColumn = 38
         End
         Begin Table = "so"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_master_by_masterid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
         Begin Table = "license"
            Begin Extent = 
               Top = 7
               Left = 1533
               Bottom = 453
               Right = 1748
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
      Begin ColumnWidths = 33
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Column = 4788
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_master_by_masterid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_master_by_masterid'
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
         Begin Table = "pm"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 290
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct"
            Begin Extent = 
               Top = 9
               Left = 347
               Bottom = 206
               Right = 610
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_master_post_total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_master_post_total'
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
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 500
               Bottom = 136
               Right = 729
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ott_content_in_master'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ott_content_in_master'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[10] 2[31] 3) )"
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
         Top = -768
         Left = 0
      End
      Begin Tables = 
         Begin Table = "i"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 277
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 870
               Left = 406
               Bottom = 1000
               Right = 622
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "t0"
            Begin Extent = 
               Top = 358
               Left = 42
               Bottom = 555
               Right = 338
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 572
               Left = 87
               Bottom = 769
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t1"
            Begin Extent = 
               Top = 801
               Left = 57
               Bottom = 944
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 945
               Left = 57
               Bottom = 1142
               Right = 368
            End
            DisplayFlags = 280
            TopColumn = 30
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 1143
               Left = 57
               Bottom = 1340
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 4
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ott_master_by_master_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      End
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ott_master_by_master_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ott_master_by_master_id'
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
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 292
               Bottom = 136
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 500
               Bottom = 136
               Right = 670
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 708
               Bottom = 136
               Right = 924
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ott_segment_by_planid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ott_segment_by_planid'
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
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 292
               Bottom = 136
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 500
               Bottom = 136
               Right = 670
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ott_segment_by_segmentid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ott_segment_by_segmentid'
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
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 292
               Bottom = 136
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 500
               Bottom = 136
               Right = 670
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 708
               Bottom = 136
               Right = 924
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_segment_by_planid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_segment_by_planid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_segment_by_planid'
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
         Begin Table = "i"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 353
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 9
               Left = 410
               Bottom = 206
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 9
               Left = 689
               Bottom = 206
               Right = 925
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_segment_by_segmentid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_segment_by_segmentid'
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
         Begin Table = "temp"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_windowing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_windowing'
GO
USE [master]
GO
ALTER DATABASE [GCS_BROADCAST] SET  READ_WRITE 
GO
