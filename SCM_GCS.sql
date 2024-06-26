USE [master]
GO
/****** Object:  Database [SCM_GCS]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE DATABASE [SCM_GCS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SCM_GCS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SCM_GCS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SCM_GCS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SCM_GCS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SCM_GCS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SCM_GCS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SCM_GCS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SCM_GCS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SCM_GCS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SCM_GCS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SCM_GCS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SCM_GCS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SCM_GCS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SCM_GCS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SCM_GCS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SCM_GCS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SCM_GCS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SCM_GCS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SCM_GCS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SCM_GCS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SCM_GCS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SCM_GCS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SCM_GCS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SCM_GCS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SCM_GCS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SCM_GCS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SCM_GCS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SCM_GCS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SCM_GCS] SET RECOVERY FULL 
GO
ALTER DATABASE [SCM_GCS] SET  MULTI_USER 
GO
ALTER DATABASE [SCM_GCS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SCM_GCS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SCM_GCS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SCM_GCS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SCM_GCS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SCM_GCS', N'ON'
GO
ALTER DATABASE [SCM_GCS] SET QUERY_STORE = OFF
GO
USE [SCM_GCS]
GO
/****** Object:  User [usr_bi_team]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE USER [usr_bi_team] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usr_bi_team]
GO
ALTER ROLE [db_owner] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[session_history]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session_history](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_session_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video_social]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video_social](
	[Id] [uniqueidentifier] NOT NULL,
	[PlatformId] [int] NULL,
	[VideoID] [nvarchar](max) NULL,
	[VideoTitle] [nvarchar](max) NULL,
	[VideoDuration] [bigint] NULL,
	[VideoDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_video_social] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session_history_video]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session_history_video](
	[Id] [uniqueidentifier] NOT NULL,
	[SessionHistoryId] [uniqueidentifier] NULL,
	[AiringSocialId] [uniqueidentifier] NULL,
	[VideoSocialId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_session_history_video] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[airing_social]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airing_social](
	[Id] [uniqueidentifier] NOT NULL,
	[PlatformId] [int] NULL,
	[VideoID] [nvarchar](max) NULL,
	[VideoTitle] [nvarchar](max) NULL,
	[VideoDuration] [bigint] NULL,
	[Category] [nvarchar](max) NULL,
	[ChannelID] [int] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[ShortContentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_airing_social] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_session_history]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                 CREATE VIEW [dbo].[v_session_history] as
                    select s.Id, s.UserName, s.CreatedDate,a.Id as AiringId, a.VideoID as AiringVideoID, a.VideoTitle as AiringVideoTitle, a.PlatformId as AiringPlatformId, a.ChannelID as AiringChannelID,
                          vc.PlatformId as VideoPlatform, vc.VideoDescription, vc.VideoDuration
                          from session_history s
                          join session_history_video v
                          on s.Id = v.SessionHistoryId
                          left join airing_social a
                          on a.Id = v.AiringSocialId
                          left join video_social vc
                          on v.VideoSocialId = vc.Id
                        
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [dbo].[comment_social]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment_social](
	[Id] [uniqueidentifier] NOT NULL,
	[CommentId] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[TotalLikes] [int] NULL,
	[AiringSocialId] [uniqueidentifier] NULL,
	[VideoID] [nvarchar](max) NULL,
	[VideoSocialId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_comment_social] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_airing_social]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_airing_social](
	[Id] [uniqueidentifier] NOT NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[AiringSocialId] [uniqueidentifier] NOT NULL,
	[Day] [datetime2](7) NULL,
	[NationId] [int] NULL,
	[OwnedView] [bigint] NULL,
	[PartnerAuction] [bigint] NULL,
	[PartnerReserved] [bigint] NULL,
	[PartnerRevenue] [bigint] NULL,
	[PartnerRevenuePartnerSoldPartner] [bigint] NULL,
	[PartnerRevenuePartnerSoldYoutube] [bigint] NULL,
	[RevenueSplit] [bigint] NULL,
	[SplitAuction] [bigint] NULL,
	[SplitPartnerSoldPartner] [bigint] NULL,
	[SplitPartnerSoldYoutube] [bigint] NULL,
	[SplitReserved] [bigint] NULL,
 CONSTRAINT [PK_detail_airing_social] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_performance_airing_social]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_performance_airing_social](
	[Id] [uniqueidentifier] NOT NULL,
	[Day] [datetime2](7) NULL,
	[Views] [bigint] NULL,
	[WatchTime] [float] NULL,
	[AverageViewDuration] [time](7) NULL,
	[Impressions] [bigint] NULL,
	[ImpressionsClickRate] [float] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NOT NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_active] [bit] NULL,
	[AiringSocialId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_detail_performance_airing_social] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scm_history]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scm_history](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Entity] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[action] [nvarchar](max) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[ContentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_scm_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_social]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_social](
	[Id] [uniqueidentifier] NOT NULL,
	[TalentId] [int] NULL,
	[TalentName] [nvarchar](max) NULL,
	[TalentNickName] [nvarchar](max) NULL,
	[SessionHistoryId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_talent_social] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_social_analyze]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_social_analyze](
	[Id] [uniqueidentifier] NOT NULL,
	[TalentSocialId] [uniqueidentifier] NULL,
	[AnalyzeResult] [nvarchar](max) NULL,
	[Appearance] [nvarchar](max) NULL,
	[AudienceRoleRequirement] [nvarchar](max) NULL,
	[Physicality] [nvarchar](max) NULL,
	[Scandal] [nvarchar](max) NULL,
	[Character] [nvarchar](max) NULL,
	[Interactive] [nvarchar](max) NULL,
	[Outfit] [nvarchar](max) NULL,
	[Specialize] [nvarchar](max) NULL,
 CONSTRAINT [PK_talent_social_analyze] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent_social_comment]    Script Date: 4/25/2024 4:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent_social_comment](
	[Id] [uniqueidentifier] NOT NULL,
	[TalentSocialId] [uniqueidentifier] NULL,
	[CommentId] [uniqueidentifier] NULL,
	[VideoId] [nvarchar](max) NULL,
 CONSTRAINT [PK_talent_social_comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Index [IX_comment_social_AiringSocialId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_comment_social_AiringSocialId] ON [dbo].[comment_social]
(
	[AiringSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_comment_social_VideoSocialId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_comment_social_VideoSocialId] ON [dbo].[comment_social]
(
	[VideoSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_detail_airing_social_AiringSocialId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_detail_airing_social_AiringSocialId] ON [dbo].[detail_airing_social]
(
	[AiringSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_detail_performance_airing_social_AiringSocialId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_detail_performance_airing_social_AiringSocialId] ON [dbo].[detail_performance_airing_social]
(
	[AiringSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_session_history_video_AiringSocialId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_session_history_video_AiringSocialId] ON [dbo].[session_history_video]
(
	[AiringSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_session_history_video_SessionHistoryId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_session_history_video_SessionHistoryId] ON [dbo].[session_history_video]
(
	[SessionHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_session_history_video_VideoSocialId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_session_history_video_VideoSocialId] ON [dbo].[session_history_video]
(
	[VideoSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_talent_social_SessionHistoryId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_talent_social_SessionHistoryId] ON [dbo].[talent_social]
(
	[SessionHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_talent_social_analyze_TalentSocialId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_talent_social_analyze_TalentSocialId] ON [dbo].[talent_social_analyze]
(
	[TalentSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_talent_social_comment_TalentSocialId]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_talent_social_comment_TalentSocialId] ON [dbo].[talent_social_comment]
(
	[TalentSocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:26:15 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:26:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[comment_social]  WITH CHECK ADD  CONSTRAINT [FK_comment_social_airing_social_AiringSocialId] FOREIGN KEY([AiringSocialId])
REFERENCES [dbo].[airing_social] ([Id])
GO
ALTER TABLE [dbo].[comment_social] CHECK CONSTRAINT [FK_comment_social_airing_social_AiringSocialId]
GO
ALTER TABLE [dbo].[comment_social]  WITH CHECK ADD  CONSTRAINT [FK_comment_social_video_social_VideoSocialId] FOREIGN KEY([VideoSocialId])
REFERENCES [dbo].[video_social] ([Id])
GO
ALTER TABLE [dbo].[comment_social] CHECK CONSTRAINT [FK_comment_social_video_social_VideoSocialId]
GO
ALTER TABLE [dbo].[detail_airing_social]  WITH NOCHECK ADD  CONSTRAINT [FK_detail_airing_social_airing_social_AiringSocialId] FOREIGN KEY([AiringSocialId])
REFERENCES [dbo].[airing_social] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detail_airing_social] CHECK CONSTRAINT [FK_detail_airing_social_airing_social_AiringSocialId]
GO
ALTER TABLE [dbo].[detail_performance_airing_social]  WITH CHECK ADD  CONSTRAINT [FK_detail_performance_airing_social_airing_social_AiringSocialId] FOREIGN KEY([AiringSocialId])
REFERENCES [dbo].[airing_social] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detail_performance_airing_social] CHECK CONSTRAINT [FK_detail_performance_airing_social_airing_social_AiringSocialId]
GO
ALTER TABLE [dbo].[session_history_video]  WITH CHECK ADD  CONSTRAINT [FK_session_history_video_airing_social_AiringSocialId] FOREIGN KEY([AiringSocialId])
REFERENCES [dbo].[airing_social] ([Id])
GO
ALTER TABLE [dbo].[session_history_video] CHECK CONSTRAINT [FK_session_history_video_airing_social_AiringSocialId]
GO
ALTER TABLE [dbo].[session_history_video]  WITH CHECK ADD  CONSTRAINT [FK_session_history_video_session_history_SessionHistoryId] FOREIGN KEY([SessionHistoryId])
REFERENCES [dbo].[session_history] ([Id])
GO
ALTER TABLE [dbo].[session_history_video] CHECK CONSTRAINT [FK_session_history_video_session_history_SessionHistoryId]
GO
ALTER TABLE [dbo].[session_history_video]  WITH CHECK ADD  CONSTRAINT [FK_session_history_video_video_social_VideoSocialId] FOREIGN KEY([VideoSocialId])
REFERENCES [dbo].[video_social] ([Id])
GO
ALTER TABLE [dbo].[session_history_video] CHECK CONSTRAINT [FK_session_history_video_video_social_VideoSocialId]
GO
ALTER TABLE [dbo].[talent_social]  WITH CHECK ADD  CONSTRAINT [FK_talent_social_session_history_SessionHistoryId] FOREIGN KEY([SessionHistoryId])
REFERENCES [dbo].[session_history] ([Id])
GO
ALTER TABLE [dbo].[talent_social] CHECK CONSTRAINT [FK_talent_social_session_history_SessionHistoryId]
GO
ALTER TABLE [dbo].[talent_social_analyze]  WITH CHECK ADD  CONSTRAINT [FK_talent_social_analyze_talent_social_TalentSocialId] FOREIGN KEY([TalentSocialId])
REFERENCES [dbo].[talent_social] ([Id])
GO
ALTER TABLE [dbo].[talent_social_analyze] CHECK CONSTRAINT [FK_talent_social_analyze_talent_social_TalentSocialId]
GO
ALTER TABLE [dbo].[talent_social_comment]  WITH CHECK ADD  CONSTRAINT [FK_talent_social_comment_talent_social_TalentSocialId] FOREIGN KEY([TalentSocialId])
REFERENCES [dbo].[talent_social] ([Id])
GO
ALTER TABLE [dbo].[talent_social_comment] CHECK CONSTRAINT [FK_talent_social_comment_talent_social_TalentSocialId]
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
ALTER DATABASE [SCM_GCS] SET  READ_WRITE 
GO
