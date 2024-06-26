USE [master]
GO
/****** Object:  Database [MUSIC_GCS]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE DATABASE [MUSIC_GCS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MUSIC_GCS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MUSIC_GCS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MUSIC_GCS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MUSIC_GCS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MUSIC_GCS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MUSIC_GCS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MUSIC_GCS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET ARITHABORT OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MUSIC_GCS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MUSIC_GCS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MUSIC_GCS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MUSIC_GCS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET RECOVERY FULL 
GO
ALTER DATABASE [MUSIC_GCS] SET  MULTI_USER 
GO
ALTER DATABASE [MUSIC_GCS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MUSIC_GCS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MUSIC_GCS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MUSIC_GCS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MUSIC_GCS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MUSIC_GCS', N'ON'
GO
ALTER DATABASE [MUSIC_GCS] SET QUERY_STORE = OFF
GO
USE [MUSIC_GCS]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertPlatformChannel]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

            CREATE FUNCTION [dbo].[ConvertPlatformChannel]
                (
	                @listId Nvarchar(MAX)
                ) 
                RETURNS NVARCHAR(MAX)

                AS
                BEGIN
                   DECLARE @res NVARCHAR(MAX)

                   SELECT @res = STRING_AGG(cast(channel_general_id as NVARCHAR(MAX)),';')
	                FROM GCS_CATEGORY.dbo.cate_platform_channel_general as c
	                INNER JOIN string_split(@listId, ';') s
	                on c.id = s.value

                   RETURN @res
                END
                
        
GO
/****** Object:  Table [dbo].[contract_license_detail]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_license_detail](
	[id] [uniqueidentifier] NOT NULL,
	[delivery_platform_id] [int] NOT NULL,
	[is_free] [bit] NOT NULL,
	[exclusive_start_date] [datetime2](7) NULL,
	[exclusive_end_date] [datetime2](7) NULL,
	[non_exclusive_start_date] [datetime2](7) NULL,
	[non_exclusive_end_date] [datetime2](7) NULL,
	[is_active] [bit] NOT NULL,
	[notes] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[contract_id] [uniqueidentifier] NOT NULL,
	[platform_channel_general_ids] [nvarchar](max) NULL,
	[is_all_channel] [bit] NOT NULL,
	[purpose] [nvarchar](max) NULL,
	[run] [int] NULL,
 CONSTRAINT [PK_contract_license_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_license_detail_map]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                 CREATE VIEW [dbo].[v_license_detail_map] as
                     SELECT ld.Id, ld.is_free, ld.exclusive_start_date, ld.exclusive_end_date, ld.non_exclusive_start_date, ld.non_exclusive_end_date,ld.is_all_channel, ld.run,  ld.is_active,ld.purpose, ld.notes, ld.create_by, 
                    ld.create_time, ld.update_by, ld.update_time, ld.contract_id,ld.delivery_platform_id, dl.platform_id, dl.delivery_license_id, ld.platform_channel_general_ids, dbo.ConvertPlatformChannel(ld.platform_channel_general_ids) AS channel_general_map_ids
                       FROM   dbo.contract_license_detail AS ld LEFT OUTER JOIN
                    GCS_CATEGORY.dbo.cate_platform_delivery_license AS dl ON ld.delivery_platform_id = dl.id
GO
/****** Object:  View [dbo].[auth_user_group_view]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[auth_user_group_view]
AS
SELECT au.username, STUFF
                 ((SELECT ';' + ag.code
                  FROM    GCS_USERS.dbo.auth_group ag
                  WHERE ag.id IN
                                   (SELECT value
                                   FROM    STRING_SPLIT(au.group_id, ';')) FOR XML PATH('')), 1, 1, '') AS group_names
FROM   GCS_USERS.dbo.auth_user au;
GO
/****** Object:  View [dbo].[v_user_company]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_user_company]
AS
SELECT username, cate_company_id
FROM   GCS_USERS.dbo.auth_user
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [dbo].[contract]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](max) NULL,
	[contract_music_name] [nvarchar](max) NULL,
	[contract_music_code] [nvarchar](max) NULL,
	[sale_contract_music_code] [nvarchar](max) NULL,
	[contract_category] [int] NOT NULL,
	[contract_type] [int] NULL,
	[tax] [int] NULL,
	[contract_status] [int] NULL,
	[owner_id] [int] NULL,
	[supplier_id] [int] NULL,
	[date] [datetime2](7) NULL,
	[is_temp] [bit] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[music_id] [uniqueidentifier] NOT NULL,
	[broadcast_method_ids] [nvarchar](max) NULL,
	[geography_ids] [nvarchar](max) NULL,
	[license_note] [nvarchar](max) NULL,
	[license_type_id] [int] NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_contract] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_document]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_document](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[file_path] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[file_extension_id] [int] NOT NULL,
	[notes] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_deleted] [bit] NOT NULL,
	[contract_id] [uniqueidentifier] NOT NULL,
	[document_type] [int] NULL,
 CONSTRAINT [PK_contract_document] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_file_information]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_file_information](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[file_path] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[episode] [float] NOT NULL,
	[file_quality_id] [int] NOT NULL,
	[file_extension_id] [int] NOT NULL,
	[notes] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[contract_id] [uniqueidentifier] NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_contract_file_information] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[document]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[document](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[file_path] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[file_extension_id] [int] NOT NULL,
	[relative_content_id] [nvarchar](max) NULL,
	[date_of_issue] [datetime2](7) NULL,
	[status] [int] NULL,
	[from_date] [datetime2](7) NULL,
	[to_date] [datetime2](7) NULL,
	[company_id] [int] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_deleted] [bit] NULL,
	[music_id] [uniqueidentifier] NOT NULL,
	[notes] [nvarchar](max) NULL,
	[is_limited] [bit] NULL,
	[document_type] [int] NULL,
 CONSTRAINT [PK_document] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[music]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[music](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](max) NULL,
	[numericalorder_year] [int] NULL,
	[name] [nvarchar](max) NULL,
	[original_name] [nvarchar](max) NULL,
	[other_name] [nvarchar](max) NULL,
	[import_year] [int] NULL,
	[year] [int] NULL,
	[description] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[nation_id] [nvarchar](max) NULL,
	[language_id] [nvarchar](max) NULL,
	[is_planning] [bit] NULL,
	[spectator_id] [nvarchar](max) NULL,
	[sex_id] [int] NULL,
	[author_id] [nvarchar](max) NULL,
	[singer_id] [nvarchar](max) NULL,
	[manufacturer_id] [nvarchar](max) NULL,
	[code_group] [nvarchar](max) NULL,
	[is_deleted] [bit] NULL,
	[company_id] [int] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[category_id] [int] NULL,
	[genre_id] [nvarchar](max) NULL,
	[source_id] [int] NULL,
	[created_year] [int] NULL,
 CONSTRAINT [PK_music] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[music_history]    Script Date: 4/25/2024 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[music_history](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Entity] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[action] [nvarchar](max) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[ContentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_music_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Index [IX_contract_music_id]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_contract_music_id] ON [dbo].[contract]
(
	[music_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_contract_document_contract_id]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_contract_document_contract_id] ON [dbo].[contract_document]
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_contract_file_information_contract_id]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_contract_file_information_contract_id] ON [dbo].[contract_file_information]
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_contract_license_detail_contract_id]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_contract_license_detail_contract_id] ON [dbo].[contract_license_detail]
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_document_music_id]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_document_music_id] ON [dbo].[document]
(
	[music_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:19:35 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:19:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contract] ADD  DEFAULT (CONVERT([bit],(0))) FOR [is_deleted]
GO
ALTER TABLE [dbo].[contract_file_information] ADD  DEFAULT (CONVERT([bit],(0))) FOR [is_deleted]
GO
ALTER TABLE [dbo].[contract_license_detail] ADD  DEFAULT (CONVERT([bit],(0))) FOR [is_all_channel]
GO
ALTER TABLE [dbo].[contract]  WITH CHECK ADD  CONSTRAINT [FK_contract_music_music_id] FOREIGN KEY([music_id])
REFERENCES [dbo].[music] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contract] CHECK CONSTRAINT [FK_contract_music_music_id]
GO
ALTER TABLE [dbo].[contract_document]  WITH CHECK ADD  CONSTRAINT [FK_contract_document_contract_contract_id] FOREIGN KEY([contract_id])
REFERENCES [dbo].[contract] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contract_document] CHECK CONSTRAINT [FK_contract_document_contract_contract_id]
GO
ALTER TABLE [dbo].[contract_file_information]  WITH CHECK ADD  CONSTRAINT [FK_contract_file_information_contract_contract_id] FOREIGN KEY([contract_id])
REFERENCES [dbo].[contract] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contract_file_information] CHECK CONSTRAINT [FK_contract_file_information_contract_contract_id]
GO
ALTER TABLE [dbo].[contract_license_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_license_detail_contract_contract_id] FOREIGN KEY([contract_id])
REFERENCES [dbo].[contract] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contract_license_detail] CHECK CONSTRAINT [FK_contract_license_detail_contract_contract_id]
GO
ALTER TABLE [dbo].[document]  WITH CHECK ADD  CONSTRAINT [FK_document_music_music_id] FOREIGN KEY([music_id])
REFERENCES [dbo].[music] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[document] CHECK CONSTRAINT [FK_document_music_music_id]
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'auth_user_group_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'auth_user_group_view'
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
         Begin Table = "auth_user (GCS_USERS.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 399
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_user_company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_user_company'
GO
USE [master]
GO
ALTER DATABASE [MUSIC_GCS] SET  READ_WRITE 
GO
