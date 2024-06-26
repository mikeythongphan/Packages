USE [master]
GO
/****** Object:  Database [GCS_USERS]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE DATABASE [GCS_USERS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GCS_DEV_USERS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_USERS.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GCS_DEV_USERS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_USERS_log.ldf' , SIZE = 335872KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GCS_USERS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GCS_USERS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GCS_USERS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GCS_USERS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GCS_USERS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GCS_USERS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GCS_USERS] SET ARITHABORT OFF 
GO
ALTER DATABASE [GCS_USERS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GCS_USERS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GCS_USERS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GCS_USERS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GCS_USERS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GCS_USERS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GCS_USERS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GCS_USERS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GCS_USERS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GCS_USERS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GCS_USERS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GCS_USERS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GCS_USERS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GCS_USERS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GCS_USERS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GCS_USERS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GCS_USERS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GCS_USERS] SET RECOVERY FULL 
GO
ALTER DATABASE [GCS_USERS] SET  MULTI_USER 
GO
ALTER DATABASE [GCS_USERS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GCS_USERS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GCS_USERS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GCS_USERS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GCS_USERS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GCS_USERS', N'ON'
GO
ALTER DATABASE [GCS_USERS] SET QUERY_STORE = OFF
GO
USE [GCS_USERS]
GO
/****** Object:  User [VACGROUP\tham.tran]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE USER [VACGROUP\tham.tran] FOR LOGIN [VACGROUP\tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\khoa.huynh]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE USER [VACGROUP\khoa.huynh] FOR LOGIN [VACGROUP\khoa.huynh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tham.tran]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE USER [tham.tran] FOR LOGIN [tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nhung.tran]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE USER [nhung.tran] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [mdm]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE USER [mdm] FOR LOGIN [mdm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BITEAM]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE USER [BITEAM] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
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
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BITEAM]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[username] [nvarchar](100) NOT NULL,
	[display_name] [nvarchar](150) NULL,
	[first_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[company] [nvarchar](150) NULL,
	[department] [nvarchar](150) NULL,
	[occupation] [nvarchar](150) NULL,
	[email] [nvarchar](150) NULL,
	[mobile] [nvarchar](20) NULL,
	[description] [nvarchar](250) NULL,
	[cate_company_id] [int] NULL,
	[is_ad_active] [bit] NULL,
	[is_cms_user] [bit] NULL,
	[is_admin] [bit] NULL,
	[is_manager] [bit] NULL,
	[is_bom] [bit] NULL,
	[is_receive_alert_expried_license] [bit] NULL,
	[is_receive_alert_ipi] [bit] NULL,
	[group_id] [nvarchar](max) NULL,
	[is_viewall] [bit] NULL,
	[is_multicompany] [bit] NULL,
	[cate_team_id] [int] NULL,
 CONSTRAINT [PK_auth_user] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_list_receive_noti]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_list_receive_noti]
AS
SELECT username, is_admin, group_id, email, receive_noti, display_name
FROM   (SELECT username, is_admin, group_id, email, display_name, (CASE WHEN EXISTS
                               (SELECT 1
                               FROM    string_split('68;78;80;82;85', ';') s1 JOIN
                                            string_split(group_id, ';') s2 ON s1.value = s2.value) THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END) AS receive_noti
             FROM    dbo.auth_user
             WHERE  (is_bom = 0) AND (is_cms_user = 1)) AS t
WHERE (receive_noti = 1) OR
             (is_admin = 1)
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[code] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_auth_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_user_group_code]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_user_group_code]
AS
SELECT username, value, g_user.code  
FROM auth_user u
    CROSS APPLY STRING_SPLIT(group_id, ';')
inner join auth_group g_user on g_user.id =value 
GO
/****** Object:  View [dbo].[v_contact_role_noti]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_contact_role_noti]
AS
SELECT username, is_admin, group_id, email, receive_noti, display_name
FROM   (SELECT username, is_admin, group_id, email, display_name, (CASE WHEN EXISTS
                               (SELECT 1
                               FROM    (SELECT id
                                             FROM    auth_group
                                             WHERE  code IN ('contactManagement')) s1 JOIN
                                            string_split(group_id, ';') s2 ON s1.id = s2.value) THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END) AS receive_noti
             FROM    dbo.auth_user
             WHERE  (is_bom = 0) AND (is_cms_user = 1)) AS t
WHERE (receive_noti = 1)
GO
/****** Object:  Table [dbo].[session_action]    Script Date: 4/25/2024 4:15:28 PM ******/
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
	[create_time] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[UserActivity]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[UserActivity]
AS
SELECT        id, user_name, function_id, action, create_time, company
FROM            (SELECT        s.id, s.user_name, s.function_id, s.action, s.create_time, MONTH(s.create_time) AS Thang, YEAR(s.create_time) AS Nam, c.name AS company
                          FROM            dbo.session_action AS s LEFT OUTER JOIN
                                                    dbo.auth_user AS u ON u.username = s.user_name LEFT OUTER JOIN
                                                    GCS_CATEGORY.dbo.cate_company AS c ON c.id = u.cate_company_id
                          WHERE        (s.function_id <> 'dim')) AS c_1
WHERE        (Thang = 10) AND (Nam = 2022)
GO
/****** Object:  View [dbo].[v_company]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_company]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_company
WHERE (is_active = 1) AND (is_deleted = 0)
GO
/****** Object:  Table [dbo].[auth_function]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_function](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NULL,
	[name] [nvarchar](250) NOT NULL,
	[code] [nvarchar](250) NOT NULL,
	[function_group] [int] NULL,
	[function_type] [int] NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_auth_function] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_function_group]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_function_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_auth_function_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_function_type]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_function_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_auth_function_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_log]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_log](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[action] [nvarchar](100) NOT NULL,
	[group_id] [nvarchar](100) NOT NULL,
	[function_id] [int] NOT NULL,
	[is_view] [bit] NOT NULL,
	[is_insert] [bit] NOT NULL,
	[is_update] [bit] NOT NULL,
	[is_delete] [bit] NOT NULL,
	[is_old_view] [bit] NULL,
	[is_old_insert] [bit] NULL,
	[is_old_update] [bit] NULL,
	[is_old_delete] [bit] NULL,
	[create_by] [nvarchar](100) NOT NULL,
	[create_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_matrix]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_matrix](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[function_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
	[is_view] [bit] NOT NULL,
	[is_insert] [bit] NOT NULL,
	[is_update] [bit] NOT NULL,
	[is_delete] [bit] NOT NULL,
	[create_by] [nvarchar](100) NOT NULL,
	[create_time] [datetime] NOT NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_auth_group_matrix] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_right_log]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_right_log](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[action] [nvarchar](100) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[function_id] [int] NOT NULL,
	[is_view] [bit] NOT NULL,
	[is_insert] [bit] NOT NULL,
	[is_update] [bit] NOT NULL,
	[is_delete] [bit] NOT NULL,
	[is_approve] [bit] NULL,
	[is_old_view] [bit] NULL,
	[is_old_insert] [bit] NULL,
	[is_old_update] [bit] NULL,
	[is_old_approve] [bit] NULL,
	[is_old_delete] [bit] NULL,
	[create_by] [nvarchar](100) NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_auth_right_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_right_matrix]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_right_matrix](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[function_id] [int] NOT NULL,
	[is_view] [bit] NOT NULL,
	[is_insert] [bit] NOT NULL,
	[is_update] [bit] NOT NULL,
	[is_delete] [bit] NOT NULL,
	[is_approve] [bit] NULL,
	[create_time] [datetime] NULL,
	[modify_time] [datetime] NULL,
 CONSTRAINT [PK_auth_right_matrix] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_manager]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_manager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[line_manager] [nvarchar](50) NULL,
 CONSTRAINT [PK_auth_user_manager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_temp]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_temp](
	[username] [nvarchar](max) NOT NULL,
	[display_name] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[company] [nvarchar](max) NULL,
	[department] [nvarchar](max) NULL,
	[occupation] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[mobile] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:15:28 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:15:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[auth_user] ADD  CONSTRAINT [DF_auth_user_is_receive_alert_expried_license]  DEFAULT ((0)) FOR [is_receive_alert_expried_license]
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
/****** Object:  StoredProcedure [dbo].[InsertEditAutoRightMatrix]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertEditAutoRightMatrix]
	-- Add the parameters for the stored procedure here
	@is_edit bit,
	@function_id int,
	@create_by nvarchar(100),
	@create_time datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @is_edit=1
		BEGIN
		update auth_right_matrix set is_view=0,is_insert=0,is_update=0,is_delete=0,is_approve=0
		where function_id = @function_id and username in (select distinct username from auth_user)

			update auth_group_matrix set is_view=0,is_insert=0,is_update=0,is_delete=0,update_by=@create_by,update_time=@create_time
		where function_id= @function_id
		END
	else
	insert into auth_right_matrix(username,function_id,is_view,is_insert,is_update,is_delete,is_approve)
	select distinct username,@function_id,0,0,0,0,0 from auth_user 
	--insert vao group permission
	insert into auth_group_matrix(group_id,function_id,is_view,is_insert,is_update,is_delete,create_by,create_time)
	select distinct id,@function_id,0,0,0,0,@create_by,@create_time from auth_group 
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUserAutoRightMatrix]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUserAutoRightMatrix]

	@username nvarchar(100)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from auth_right_matrix where username=@username
    -- Insert statements for procedure here
	insert into auth_right_matrix(username,function_id,is_view,is_insert,is_update,is_delete,is_approve,create_time)
	select u.username,f.id,0,0,0,0,0,GETDATE() from auth_user u
	CROSS JOIN auth_function f
	where u.username=@username
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetGroupMatrix_Screen]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetGroupMatrix_Screen] 
	-- Add the parameters for the stored procedure here
	--@p1 int = 0, 
	--@p2 int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
		m.id as Id,m.Group_name as groupName, m.screen_id as screenId,m.is_view as isView
		, m.is_insert as isInsert, m.is_update as isUpdate, m.is_delete as isDelete,
		s.groups_name + '--'+ s.name as screen_name
	from
		[dbo].[Auth_Group_Matrix] m, [dbo].[Auth_Screen] s
	where 
		m.screen_id = s.id	--join
		and s.is_active = 1 --active screen
		and (m.is_delete = 1 or m.is_insert = 1 or m.is_update=1 or m.is_view=1)
	order by m.Group_name
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMatrix_DefaultGroup]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetMatrix_DefaultGroup] 
	-- Add the parameters for the stored procedure here
	@user_id nvarchar(100) = '', 
	@group_id int = 0
	--@group_type nvarchar(100) = N'Mặc định'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		
	--select m.*, s.name as screen_name
	select m.id as Id, m.user_id as UserId, m.screen_id as ScreenId, m.is_view as IsView,
		m.is_insert as IsInsert, m.is_update as IsUpdate, m.is_delete IsDelete,
		m.modified_date as ModifiedDate, s.name as screen_name
	from [dbo].[Auth_Right_Matrix] m, [dbo].[Auth_Screen] s
	where 
		m.screen_id = s.id -- join
		and m.user_id = @user_id
		and m.screen_id in 
			(select s.id 
				from Auth_Screen s 
				where --s.group_type= @group_type 
					s.is_active =1
					and ( (s.parent_id= @group_id) or (s.id = @group_id))
			)	
	order by m.screen_id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMatrix_Defined_Group]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetMatrix_Defined_Group] 
	-- Add the parameters for the stored procedure here
	@user_id nvarchar(100) = '', 
	@Group_name nvarchar(100) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		
	select 
		--m.id,m.screen_id, m.user_id, s.name as screen_name, g.is_view,g.is_insert, g.is_update, g.is_delete, g.[modified_date]
		m.id as Id, m.user_id as UserId, m.screen_id as ScreenId, g.is_view as IsView,
		g.is_insert as IsInsert, g.is_update as IsUpdate, g.is_delete IsDelete,
		g.modified_date as ModifiedDate, s.name as screen_name
	from 
		[dbo].[Auth_Group_Matrix] g,
		[dbo].[Auth_Right_Matrix] m,
		[dbo].[Auth_Screen] s
	where 
		--join
		s.id = m.screen_id
		and m.screen_id = g.screen_id
		--condition
		and g.Group_name = @Group_name -- 'DID_Input_Content' 
		and m.user_id=@user_id -- 'tu.nguyen.anh'
	order by m.screen_id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_init_auth_right_matrix]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_init_auth_right_matrix]
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @ret1 int = 0;

  SELECT
    @ret1 = COUNT(1)
  FROM auth_right_matrix;
  DECLARE @new_function int = 0;

  -- function
  SELECT
    @new_function = COUNT(1)
  FROM auth_function s
  WHERE s.is_active = 1
  AND s.id NOT IN (SELECT DISTINCT
    m.function_id
  FROM auth_right_matrix m);

  -- new function
  IF (@new_function > 0)
    INSERT INTO [dbo].[auth_right_matrix] ([username]
    , [function_id])
      SELECT
        a.username,
        b.id
      FROM dbo.auth_user a
      CROSS JOIN (SELECT
        id
      FROM auth_function s
      WHERE s.id NOT IN (SELECT DISTINCT
        function_id
      FROM auth_right_matrix)) b

  -- new user
  DECLARE @new_user int = 0;
  SELECT
    @new_user = COUNT(1)
  FROM auth_user u
  WHERE u.username NOT IN (SELECT DISTINCT
    m.[username]
  FROM auth_right_matrix m);

  -- if have new user
  IF (@new_user > 0)
    INSERT INTO [dbo].[auth_right_matrix] ([username]
    , [function_id])
      SELECT
        b.username,
        a.id
      FROM dbo.auth_function a
      CROSS JOIN (SELECT
        username
      FROM auth_user s
      WHERE s.username NOT IN (SELECT DISTINCT
        m.[username]
      FROM auth_right_matrix m)) b

  -- count row return
  DECLARE @ret2 int = 0;
  SELECT
    @ret2 = COUNT(1)
  FROM auth_right_matrix;
  RETURN (@ret2 - @ret1);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_init_group_matrix]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_init_group_matrix]
@screen_id int = 0,
@group_id int = 0
AS
BEGIN
  SET NOCOUNT ON;
  --1. check a group is new-group?
  DECLARE @exist int = 0;
  SELECT
    @exist = COUNT(1)
  FROM [dbo].[auth_group_matrix] g
  WHERE g.group_id = @group_id;

  IF (@exist > 0)--exist group
  BEGIN
    --2. get list screen had not yet add to matrix for a group
    DECLARE @new_screen int = 0;
    SELECT
      @new_screen = COUNT(1)
    FROM auth_screen s
    WHERE s.parent_id = @screen_id  --belong to parent group
    AND s.is_active = 1 --active screen
    AND s.id NOT IN --not yet add to group_matrix for a group
    (SELECT DISTINCT
      m.screen_id
    FROM auth_group_matrix m
    WHERE m.group_id = @group_id);

    -- if have
    IF (@new_screen > 0)
      --get new matrix
      SELECT

        0 AS id -- new id for insert
        ,
        a.group_id,
        b.id AS screen_id,
        0 AS is_view,
        0 AS is_insert,
        0 AS is_update,
        0 AS is_delete,
        b.name AS screen_name
      FROM (SELECT
        @group_id AS group_id) a
      CROSS JOIN (SELECT
        id,
        [name]
      FROM auth_screen s
      WHERE s.parent_id = @screen_id  --belong to parent group
      AND s.is_active = 1 --active screen
      AND s.id NOT IN --not yet add to group_matrix for a group
      (SELECT DISTINCT
        m.screen_id
      FROM auth_group_matrix m
      WHERE m.group_id = @group_id)) b

      UNION ALL
      -- get exist matrix
      SELECT
        m.id,
        m.group_id AS group_id,
        m.screen_id AS screen_id,
        m.is_view AS is_view,
        m.is_insert AS is_insert,
        m.is_update AS is_update,
        m.is_delete AS is_delete,
        s.name AS screen_name
      FROM [dbo].[auth_group_matrix] m,
           [dbo].auth_screen s
      WHERE m.group_id = @group_id
      AND m.screen_id = s.id --join

  END
  ELSE -- new group
  BEGIN
    --get new matrix
    SELECT

      0 AS id -- new id for insert
      ,
      a.group_id,
      b.id AS screen_id,
      0 AS is_view,
      0 AS is_insert,
      0 AS is_update,
      0 AS is_delete,
      b.name AS screen_name
    FROM (SELECT
      @group_id AS group_id) a
    CROSS JOIN (SELECT
      id,
      [name]
    FROM auth_screen s
    WHERE s.parent_id = @screen_id  --belong to parent group
    AND s.is_active = 1 --active screen
    ) b
  END

END--sp
GO
/****** Object:  StoredProcedure [dbo].[sp_update_ad_sync]    Script Date: 4/25/2024 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_update_ad_sync]
AS
BEGIN
  SET NOCOUNT ON;

  -- 1.1 find exists acc & disable 
  DECLARE @old_acc int = 0;
  SELECT
    @old_acc = COUNT(1)
  FROM auth_user t
  WHERE t.username NOT IN (SELECT DISTINCT
    u.username
  FROM auth_user_temp u
  WHERE u.is_active = 1);

  IF (@old_acc > 0)
  BEGIN
    --disable account
    UPDATE auth_user
    SET is_ad_active = 0
    WHERE username NOT IN (SELECT DISTINCT
      u.username
    FROM auth_user_temp u
    WHERE u.is_active = 1);
  END

  -- 1.2 find & update exist actived account
  DECLARE @exist_acc int = 0;
  SELECT
    @exist_acc = COUNT(1)
  FROM auth_user u
  WHERE EXISTS (SELECT
    1
  FROM auth_user_temp t
  WHERE t.username = u.username
  AND t.is_active = 1)

  IF (@exist_acc > 0)
  BEGIN --update join
    UPDATE auth_user
    SET company = t.company,
        department = t.department,
        occupation = t.occupation,
        is_ad_active = t.is_active
    FROM auth_user u
    INNER JOIN auth_user_temp t
      ON u.username = t.username
      AND t.is_active = 1;
  END

  -- 1.3 insert new acc
  DECLARE @new_acc int = 0;
  SELECT
    @new_acc = COUNT(1)
  FROM auth_user_temp t
  WHERE t.is_active = 1
  AND t.username NOT IN (SELECT DISTINCT
    u.username
  FROM auth_user u)

  IF (@new_acc > 0)
  BEGIN
    -- insert new data
    INSERT INTO [dbo].[auth_user] ([username], [display_name], [first_name], [last_name]
    , [company], [department], [occupation], [email]
    , [mobile], [description], is_ad_active)
      SELECT
        [username],
        [display_name],
        [first_name],
        [last_name],
        [company],
        [department],
        [occupation],
        [email],
        [mobile],
        [description],
        [is_active]
      FROM auth_user_temp t
      WHERE t.is_active = 1
      AND t.username NOT IN (SELECT DISTINCT
        u.username
      FROM auth_user u);
  END
  ;


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
         Begin Table = "c_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserActivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserActivity'
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
         Begin Table = "t"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_contact_role_noti'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_contact_role_noti'
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
         Begin Table = "t"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_list_receive_noti'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_list_receive_noti'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_user_group_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_user_group_code'
GO
USE [master]
GO
ALTER DATABASE [GCS_USERS] SET  READ_WRITE 
GO
