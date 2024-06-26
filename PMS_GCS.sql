USE [master]
GO
/****** Object:  Database [PMS_GCS]    Script Date: 4/25/2024 4:23:54 PM ******/
CREATE DATABASE [PMS_GCS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PMS_GCS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PMS_GCS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PMS_GCS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PMS_GCS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PMS_GCS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PMS_GCS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PMS_GCS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PMS_GCS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PMS_GCS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PMS_GCS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PMS_GCS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PMS_GCS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PMS_GCS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PMS_GCS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PMS_GCS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PMS_GCS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PMS_GCS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PMS_GCS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PMS_GCS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PMS_GCS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PMS_GCS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PMS_GCS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PMS_GCS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PMS_GCS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PMS_GCS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PMS_GCS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PMS_GCS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PMS_GCS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PMS_GCS] SET RECOVERY FULL 
GO
ALTER DATABASE [PMS_GCS] SET  MULTI_USER 
GO
ALTER DATABASE [PMS_GCS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PMS_GCS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PMS_GCS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PMS_GCS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PMS_GCS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PMS_GCS', N'ON'
GO
ALTER DATABASE [PMS_GCS] SET QUERY_STORE = OFF
GO
USE [PMS_GCS]
GO
/****** Object:  User [usr_bi_team]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE USER [usr_bi_team] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [auth_talentmgt]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE USER [auth_talentmgt] FOR LOGIN [auth_talentmgt] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [usr_bi_team]
GO
ALTER ROLE [db_owner] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
ALTER ROLE [db_datareader] ADD MEMBER [auth_talentmgt]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [auth_talentmgt]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  View [dbo].[v_content_permission]    Script Date: 4/25/2024 4:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                 CREATE VIEW [dbo].[v_content_permission] as
                     SELECT c.id, c.content_id, c.username, m.screen_code
                    FROM   GCS_CONTENT.dbo.ct_content_consolidate_permission c
                    left join (select * from GCS_CONTENT.dbo.cate_module
                    where is_active =1) as m
                    on m.id = c.module_id
                    WHERE (c.is_active = 1)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [dbo].[airing_plan]    Script Date: 4/25/2024 4:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airing_plan](
	[Id] [uniqueidentifier] NOT NULL,
	[ContentId] [nvarchar](max) NULL,
	[IsMon] [bit] NOT NULL,
	[IsTue] [bit] NOT NULL,
	[IsWed] [bit] NOT NULL,
	[IsThu] [bit] NOT NULL,
	[IsFri] [bit] NOT NULL,
	[IsSat] [bit] NOT NULL,
	[IsSun] [bit] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NULL,
	[Duration] [int] NULL,
	[ChannelId] [int] NULL,
	[EpisodeInDay] [int] NULL,
	[TotalEpisode] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[PlatformId] [int] NULL,
	[ChannelGeneralId] [nvarchar](max) NULL,
 CONSTRAINT [PK_airing_plan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[document]    Script Date: 4/25/2024 4:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[document](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[file_path] [nvarchar](max) NULL,
	[file_extension_id] [int] NOT NULL,
	[notes] [nvarchar](max) NULL,
	[company_id] [int] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_deleted] [bit] NULL,
	[ContentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_document] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pms_history]    Script Date: 4/25/2024 4:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pms_history](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Entity] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[action] [nvarchar](max) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[ContentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_pms_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shooting_plan]    Script Date: 4/25/2024 4:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shooting_plan](
	[Id] [uniqueidentifier] NOT NULL,
	[ContentId] [nvarchar](max) NULL,
	[FirstShootingDate] [datetime2](7) NULL,
	[Producer] [nvarchar](max) NULL,
	[ShootingSession] [int] NULL,
	[EndShootingDate] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[TotalEpisode] [int] NULL,
 CONSTRAINT [PK_shooting_plan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:23:55 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:23:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
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
ALTER DATABASE [PMS_GCS] SET  READ_WRITE 
GO
