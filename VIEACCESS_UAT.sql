USE [master]
GO
/****** Object:  Database [VIEACCESS_UAT]    Script Date: 4/25/2024 4:30:26 PM ******/
CREATE DATABASE [VIEACCESS_UAT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'N2K', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VIEACCESS_UAT.mdf' , SIZE = 598016KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'N2K_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VIEACCESS_UAT_log.ldf' , SIZE = 401408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VIEACCESS_UAT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VIEACCESS_UAT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VIEACCESS_UAT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET ARITHABORT OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VIEACCESS_UAT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VIEACCESS_UAT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VIEACCESS_UAT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VIEACCESS_UAT] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VIEACCESS_UAT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET RECOVERY FULL 
GO
ALTER DATABASE [VIEACCESS_UAT] SET  MULTI_USER 
GO
ALTER DATABASE [VIEACCESS_UAT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VIEACCESS_UAT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VIEACCESS_UAT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VIEACCESS_UAT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VIEACCESS_UAT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VIEACCESS_UAT', N'ON'
GO
ALTER DATABASE [VIEACCESS_UAT] SET QUERY_STORE = OFF
GO
USE [VIEACCESS_UAT]
GO
/****** Object:  User [VACGROUP\chi.ky]    Script Date: 4/25/2024 4:30:26 PM ******/
CREATE USER [VACGROUP\chi.ky] FOR LOGIN [VACGROUP\chi.ky] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [usr_it_freelance]    Script Date: 4/25/2024 4:30:26 PM ******/
CREATE USER [usr_it_freelance] FOR LOGIN [usr_it_freelance] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:30:26 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:30:26 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usr_it_freelance]
GO
ALTER ROLE [db_owner] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_datareader] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:30:26 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  FullTextCatalog [document_body_title]    Script Date: 4/25/2024 4:30:26 PM ******/
CREATE FULLTEXT CATALOG [document_body_title] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [document_file_description_filename]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE FULLTEXT CATALOG [document_file_description_filename] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [FAQ_question_answer]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE FULLTEXT CATALOG [FAQ_question_answer] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  UserDefinedFunction [dbo].[countDocument]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[countDocument](
    @parent_id INT
)
RETURNS INT
AS 
BEGIN
	DECLARE @returnvalue INT;
	BEGIN
     WITH tree AS
    (
      SELECT c1.id, c1.parent_id, c1.name
      FROM DBO.Category_Document c1
      WHERE c1.id = @parent_id and c1.is_deleted = 0 and c1.is_show = 1
      UNION ALL
      SELECT c2.id, c2.parent_id, c2.name
      FROM dbo.Category_Document c2 INNER JOIN tree ON tree.id = c2.parent_id
	  where c2.is_deleted = 0 and c2.is_show = 1
    )
	select @returnvalue= count(*) from Documents as t1
	where t1.is_deleted = 0 and t1.is_show = 1 and t1.cate_document_id in (SELECT tree.id
    FROM tree)
	END
	RETURN(@returnvalue);
END;
GO
/****** Object:  UserDefinedFunction [dbo].[countFAQs]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[countFAQs](
    @parent_id INT
)
RETURNS INT
AS 
BEGIN
	DECLARE @returnvalue INT;
	BEGIN
     WITH tree AS
    (
      SELECT c1.id, c1.parent_id, c1.name
      FROM DBO.Category_FAQs c1
      WHERE c1.id = @parent_id and c1.is_deleted = 0 and c1.is_show = 1
      UNION ALL
      SELECT c2.id, c2.parent_id, c2.name
      FROM dbo.Category_FAQs c2 INNER JOIN tree ON tree.id = c2.parent_id
	   where c2.is_deleted = 0 and c2.is_show = 1
    )
	select @returnvalue= count(*) from FAQs as t1
	where t1.is_deleted = 0 and t1.is_show = 1 and t1.category_faq_id in (SELECT tree.id
    FROM tree)
	END
	RETURN(@returnvalue);
END;
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[position] [int] NULL,
	[parent_id] [int] NULL,
	[is_show] [bit] NULL,
	[type] [int] NULL,
	[image] [nvarchar](max) NULL,
	[is_private] [bit] NULL,
	[user_access] [nvarchar](max) NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [uniqueidentifier] NOT NULL,
	[content] [nvarchar](max) NULL,
	[is_show] [bit] NOT NULL,
	[sharingId] [uniqueidentifier] NULL,
	[newsId] [int] NULL,
	[is_read] [bit] NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
	[CommentsTypesid] [int] NULL,
	[parent_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[published_at] [datetime2](7) NULL,
	[image] [nvarchar](max) NULL,
	[is_show] [bit] NULL,
	[is_read] [bit] NULL,
	[view_count] [int] NULL,
	[like_count] [int] NULL,
	[dislike_count] [int] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[is_special] [bit] NOT NULL,
	[is_highlight] [bit] NOT NULL,
	[intro] [nvarchar](max) NULL,
	[thumbnail_home] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsCate]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsCate](
	[id] [uniqueidentifier] NOT NULL,
	[NewsId] [int] NULL,
	[CateId] [int] NULL,
	[created_date] [datetime2](7) NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_NewsCate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsSocial]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsSocial](
	[id] [uniqueidentifier] NOT NULL,
	[NewsId] [int] NOT NULL,
	[SocialId] [int] NOT NULL,
	[user_name] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_NewsSocial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsUserRead]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsUserRead](
	[id] [uniqueidentifier] NOT NULL,
	[NewsId] [int] NOT NULL,
	[user_name] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_NewsUserRead] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_news_report]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_news_report]
AS
SELECT        TOP (100) PERCENT id, title, cate_name, image, created_date, views, comment, reaction, SUM(views + comment + reaction) AS total, NULL AS rank
FROM            (SELECT        n.id, n.title, news_cate.cate_name, n.image, n.created_date, SUM(ISNULL(n.view_count, 0) + ISNULL(news_view.views, 0)) AS views, COUNT(c.id) AS comment, SUM(ISNULL(n.like_count, 0) 
                                                    + ISNULL(news_reaction.reaction, 0)) AS reaction
                          FROM            dbo.News AS n LEFT OUTER JOIN
                                                    dbo.Comments AS c ON c.newsId = n.id AND c.created_by <> 'undefined' INNER JOIN
                                                        (SELECT        nc.NewsId, ca.name AS cate_name, COUNT(nc.NewsId) AS co
                                                          FROM            dbo.NewsCate AS nc LEFT OUTER JOIN
                                                                                    dbo.Category AS ca ON ca.id = nc.CateId AND ca.is_show = 1
                                                          GROUP BY nc.NewsId, ca.name
                                                          HAVING         (ca.name IS NOT NULL)) AS news_cate ON news_cate.NewsId = n.id LEFT OUTER JOIN
                                                        (SELECT        NewsId, COUNT(NewsId) AS views
                                                          FROM            dbo.NewsUserRead
                                                          GROUP BY NewsId) AS news_view ON news_view.NewsId = n.id LEFT OUTER JOIN
                                                        (SELECT        NewsId, COUNT(NewsId) AS reaction
                                                          FROM            dbo.NewsSocial
                                                          GROUP BY NewsId) AS news_reaction ON news_reaction.NewsId = n.id
                          GROUP BY n.id, n.title, news_cate.cate_name, n.image, n.created_date, news_view.views, news_reaction.reaction) AS a
GROUP BY id, title, cate_name, image, created_date, views, comment, reaction
GO
/****** Object:  Table [dbo].[UserProfile365]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile365](
	[id] [uniqueidentifier] NOT NULL,
	[username] [nvarchar](max) NULL,
	[display_name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[avatar] [nvarchar](max) NULL,
	[company] [nvarchar](max) NULL,
	[company_id] [uniqueidentifier] NULL,
	[job_title] [nvarchar](max) NULL,
	[department] [nvarchar](max) NULL,
	[department_id] [uniqueidentifier] NULL,
	[working_location] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
	[dateofbirth] [datetime] NULL,
	[gender] [nvarchar](50) NULL,
	[jobgrade] [nvarchar](10) NULL,
	[jobgrade_id] [uniqueidentifier] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
	[employee_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserProfile365] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SharingTypes]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharingTypes](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_SharingTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SharingSocial]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharingSocial](
	[id] [uniqueidentifier] NOT NULL,
	[SharingId] [uniqueidentifier] NOT NULL,
	[SocialId] [int] NOT NULL,
	[user_name] [nvarchar](max) NULL,
	[is_read] [bit] NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_SharingSocial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sharing]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sharing](
	[id] [uniqueidentifier] NOT NULL,
	[content] [nvarchar](max) NULL,
	[SharingTypesid] [uniqueidentifier] NULL,
	[published_at] [datetime2](7) NOT NULL,
	[is_show] [bit] NULL,
	[is_schedule] [bit] NULL,
	[schedule_date] [datetime2](7) NULL,
	[is_pin] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_Sharing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SharingAttachment]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharingAttachment](
	[id] [uniqueidentifier] NOT NULL,
	[SharingAttachmentTypesId] [uniqueidentifier] NOT NULL,
	[SharingId] [uniqueidentifier] NOT NULL,
	[file_url] [nvarchar](max) NULL,
	[X] [nvarchar](20) NULL,
	[Y] [nvarchar](20) NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_SharingAttachment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_sharing_report]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_sharing_report]
AS
SELECT        TOP (100) PERCENT id, [content], topic, file_url, display_name, email, created_date, comment, reaction, SUM(comment + reaction) AS total, null as rank
FROM            (SELECT        s.id, s.[content], st.name AS topic, sa.file_url, profile.display_name, profile.email, s.created_date, COUNT(c.id) AS comment, ISNULL(cs.reaction, 0) AS reaction
                          FROM            dbo.Sharing AS s LEFT OUTER JOIN
                                                    UserProfile365 profile ON profile.username = s.created_by LEFT OUTER JOIN
                                                    dbo.Comments AS c ON c.sharingId = s.id AND c.created_by <> 'undefined' LEFT OUTER JOIN
                                                    dbo.SharingTypes AS st ON st.id = s.SharingTypesid LEFT OUTER JOIN
                                                        (SELECT        SharingId, COUNT(SharingId) AS reaction
                                                          FROM            SharingSocial
                                                          GROUP BY SharingId) AS cs ON cs.sharingId = s.id LEFT OUTER JOIN
                                                        (SELECT        SharingId, file_url
                                                          FROM            (SELECT        SharingId, file_url, ROW_NUMBER() OVER (PARTITION BY SharingId
                                                                                    ORDER BY CASE WHEN file_url = '' THEN 1 ELSE 0 END, file_url) AS Rn
                                                          FROM            SharingAttachment) t
                          WHERE        Rn = 1) AS sa ON sa.SharingId = s.id
GROUP BY s.id, s.[content], st.name, sa.file_url, profile.display_name, profile.email, s.created_date, cs.reaction) AS a
GROUP BY id, [content], topic, file_url, display_name, email, created_date, comment, reaction
GO
/****** Object:  Table [dbo].[UserLogs]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](max) NULL,
	[action] [nvarchar](max) NULL,
	[result] [bit] NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserLogs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_user_logs]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_user_logs]
AS
SELECT        profile.id, profile.display_name, profile.company, profile.dateofbirth, profile.gender, profile.email, logs.created_date AS login
FROM            dbo.UserLogs AS logs LEFT OUTER JOIN
                         dbo.UserProfile365 AS profile ON logs.user_name = profile.username
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cate_document_id] [int] NULL,
	[code] [nvarchar](50) NULL,
	[title] [nvarchar](max) NULL,
	[intro] [nvarchar](max) NULL,
	[body] [nvarchar](max) NULL,
	[view_count] [int] NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
	[numericalorder] [int] NULL,
	[code_group] [nvarchar](100) NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_Document]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Document](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[position] [int] NULL,
	[parent_id] [int] NULL,
	[description] [nvarchar](max) NULL,
	[icon] [nvarchar](250) NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
	[code_group] [nvarchar](100) NULL,
	[numericalorder] [int] NULL,
 CONSTRAINT [PK_Category_Document] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getNestedCategoryDocument]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getNestedCategoryDocument](@ID int)
RETURNS table AS
RETURN
(
     WITH tree AS
    (
      SELECT c1.id, c1.parent_id, c1.name
      FROM DBO.Category_Document c1
      WHERE c1.id = @ID
      UNION ALL
      SELECT c2.id, c2.parent_id, c2.name
      FROM dbo.Category_Document c2 INNER JOIN tree ON tree.id = c2.parent_id
    )
	select * from Documents as t1
	where t1.cate_document_id in (SELECT tree.id
    FROM tree)
	
	
	
);
GO
/****** Object:  View [dbo].[v_count_category_document]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_count_category_document]
AS
SELECT id, code, name, position, parent_id, description, icon, is_show, is_deleted, created_by, created_date, updated_by, updated_date, dbo.countDocument(id) AS numberDocument
FROM   dbo.Category_Document
WHERE (is_deleted = 0) AND (parent_id IS NULL)
GO
/****** Object:  Table [dbo].[Category_FAQs]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_FAQs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[icon] [nvarchar](250) NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
	[code_group] [nvarchar](100) NULL,
	[numericalorder] [int] NULL,
 CONSTRAINT [PK_Category_FAQs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_count_category_faq]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_count_category_faq]
AS
SELECT id, parent_id, code, name, description, icon, is_show, is_deleted, created_by, created_date, updated_by, updated_date, dbo.countFAQs(id) AS numberFAQs
FROM   dbo.Category_FAQs
WHERE (is_deleted = 0) AND (parent_id IS NULL)
GO
/****** Object:  View [dbo].[v_gen_code]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_gen_code]
AS
SELECT id, name, group_code
FROM   GCS_CATEGORY.dbo.cate_gen_code
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2024 4:30:27 PM ******/
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
/****** Object:  Table [dbo].[ApplicationCategory]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationCategory](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_ApplicationCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthUser]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthUser](
	[username] [nvarchar](450) NOT NULL,
	[display_name] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[company] [nvarchar](max) NULL,
	[department] [nvarchar](max) NULL,
	[occupation] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[mobile] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_ad_active] [bit] NULL,
	[is_super_user_n2k] [bit] NULL,
	[is_super_user_helpdesk] [bit] NULL,
	[is_admin] [bit] NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_AuthUser] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentsAttachment]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentsAttachment](
	[id] [uniqueidentifier] NOT NULL,
	[CommentsId] [uniqueidentifier] NOT NULL,
	[file_url] [nvarchar](max) NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_CommentsAttachment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentsSocial]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentsSocial](
	[id] [uniqueidentifier] NOT NULL,
	[CommentsId] [uniqueidentifier] NOT NULL,
	[SocialId] [int] NOT NULL,
	[user_name] [nvarchar](max) NULL,
	[is_read] [bit] NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_CommentsSocial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentsTypes]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentsTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_CommentsTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document_Departments]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Departments](
	[id] [uniqueidentifier] NOT NULL,
	[document_id] [int] NOT NULL,
	[department_id] [uniqueidentifier] NULL,
	[is_deleted] [bit] NULL,
	[created_date] [datetime2](7) NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_Document_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document_File]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_File](
	[id] [uniqueidentifier] NOT NULL,
	[document_id] [int] NULL,
	[faq_id] [uniqueidentifier] NULL,
	[file_name] [nvarchar](max) NULL,
	[description] [ntext] NULL,
	[path] [nvarchar](max) NULL,
	[size] [bigint] NULL,
	[extension] [varchar](max) NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_Document_File] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document_Jobgrades]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Jobgrades](
	[id] [uniqueidentifier] NOT NULL,
	[document_id] [int] NOT NULL,
	[jobgrade_id] [uniqueidentifier] NULL,
	[is_deleted] [bit] NULL,
	[created_date] [datetime2](7) NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_Document_Jobgrades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document_Opcos]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Opcos](
	[id] [uniqueidentifier] NOT NULL,
	[document_id] [int] NOT NULL,
	[opco_id] [uniqueidentifier] NULL,
	[is_deleted] [bit] NULL,
	[created_date] [datetime2](7) NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_Document_Opcos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentsUserRead]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentsUserRead](
	[id] [uniqueidentifier] NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](50) NULL,
 CONSTRAINT [PK_DocumentsUserRead] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentTags]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentTags](
	[id] [uniqueidentifier] NOT NULL,
	[document_id] [int] NOT NULL,
	[tag_id] [uniqueidentifier] NULL,
	[is_deleted] [bit] NULL,
	[created_date] [datetime2](7) NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_DocumentTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[id] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](max) NULL,
	[body] [nvarchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[event_date_from] [datetime2](7) NOT NULL,
	[event_date_to] [datetime2](7) NOT NULL,
	[event_year] [int] NOT NULL,
	[is_run] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventsHistory]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventsHistory](
	[id] [uniqueidentifier] NOT NULL,
	[EventsId] [uniqueidentifier] NOT NULL,
	[user_recieve] [nvarchar](max) NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_EventsHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[id] [uniqueidentifier] NOT NULL,
	[category_faq_id] [int] NULL,
	[type_id] [int] NULL,
	[question] [nvarchar](max) NULL,
	[anwser] [nvarchar](max) NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_FAQs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs_Comments]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs_Comments](
	[id] [uniqueidentifier] NOT NULL,
	[parent_id] [uniqueidentifier] NULL,
	[faq_id] [uniqueidentifier] NULL,
	[body] [nvarchar](max) NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_FAQs_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs_Comments_Social]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs_Comments_Social](
	[id] [uniqueidentifier] NOT NULL,
	[faq_comments_id] [uniqueidentifier] NULL,
	[social_type_id] [int] NULL,
	[user_name] [nvarchar](max) NULL,
	[is_read] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_date] [datetime2](7) NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_FAQs_CommentsSocial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[link] [nvarchar](max) NULL,
	[user_name] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InternalApplication]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalApplication](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NOT NULL,
	[icon] [nvarchar](max) NULL,
	[link] [nvarchar](max) NULL,
	[user_guide] [nvarchar](max) NULL,
	[intro] [nvarchar](max) NULL,
	[ApplicationCategoryId] [uniqueidentifier] NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_InternalApplication] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobgrades]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobgrades](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_Jobgrades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[id] [bigint] NOT NULL,
	[parent_id] [bigint] NULL,
	[name] [nvarchar](255) NULL,
	[content_path] [nvarchar](255) NULL,
	[content] [nvarchar](255) NULL,
	[size] [int] NULL,
	[extension] [nvarchar](100) NULL,
	[mime] [nvarchar](255) NULL,
	[hash] [nvarchar](255) NULL,
	[metadata] [nvarchar](255) NULL,
	[creator_id] [varchar](100) NULL,
	[created_date] [datetime] NULL,
	[last_modifier_id] [varchar](100) NULL,
	[last_modified_date] [datetime] NULL,
	[is_visible] [bit] NULL,
	[is_locked] [bit] NULL,
	[position] [bigint] NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opcos]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opcos](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_Opcos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SharingAttachmentTypes]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharingAttachmentTypes](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_SharingAttachmentTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SharingTags]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharingTags](
	[id] [uniqueidentifier] NOT NULL,
	[SharingId] [uniqueidentifier] NOT NULL,
	[TagsId] [uniqueidentifier] NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_SharingTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SharingVote]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharingVote](
	[id] [uniqueidentifier] NOT NULL,
	[SharingId] [uniqueidentifier] NOT NULL,
	[choice1] [nvarchar](max) NULL,
	[choice2] [nvarchar](max) NULL,
	[choice3] [nvarchar](max) NULL,
	[choice4] [nvarchar](max) NULL,
	[time_line] [datetime2](7) NOT NULL,
	[number_vote] [int] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_SharingVote] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SharingVoteResult]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharingVoteResult](
	[id] [uniqueidentifier] NOT NULL,
	[SharingVoteId] [uniqueidentifier] NOT NULL,
	[username] [nvarchar](max) NULL,
	[user_choice] [nvarchar](max) NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime2](7) NULL,
 CONSTRAINT [PK_SharingVoteResult] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialTypes]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NOT NULL,
	[is_deleted] [bit] NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_SocialTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[is_show] [bit] NULL,
	[is_deleted] [bit] NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tags_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cms_categories]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cms_categories](
	[id] [int] NOT NULL,
	[code] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[description] [varchar](1024) NULL,
	[created_date] [datetime] NULL,
	[creator_id] [int] NULL,
	[last_modified_date] [datetime] NULL,
	[last_modifier_id] [int] NULL,
	[image] [varchar](256) NULL,
	[image_alt] [varchar](256) NULL,
	[position] [int] NULL,
	[is_sticky] [tinyint] NULL,
	[parent_id] [int] NULL,
	[status] [tinyint] NULL,
	[settings] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cms_categories_heldesk]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cms_categories_heldesk](
	[id] [int] NULL,
	[code] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](1024) NULL,
	[created_date] [datetime] NULL,
	[creator_id] [int] NULL,
	[last_modified_date] [datetime] NULL,
	[last_modifier_id] [int] NULL,
	[image] [nvarchar](256) NULL,
	[image_alt] [nvarchar](256) NULL,
	[position] [int] NULL,
	[is_sticky] [smallint] NULL,
	[parent_id] [int] NULL,
	[status] [smallint] NULL,
	[settings] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cms_fields]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cms_fields](
	[id] [int] NULL,
	[type_id] [int] NULL,
	[code] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](1024) NULL,
	[group] [nvarchar](50) NULL,
	[position] [int] NULL,
	[settings] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cms_media]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cms_media](
	[id] [bigint] NULL,
	[created_date] [datetime] NULL,
	[name] [nvarchar](255) NULL,
	[path] [nvarchar](255) NULL,
	[size] [float] NULL,
	[extension] [nvarchar](10) NULL,
	[mime] [nvarchar](255) NULL,
	[hash] [nvarchar](128) NULL,
	[metadata] [nvarchar](max) NULL,
	[creator_id] [int] NULL,
	[last_modified_date] [datetime] NULL,
	[last_modifier_id] [int] NULL,
	[parent_id] [bigint] NULL,
	[is_visible] [smallint] NULL,
	[is_locked] [smallint] NULL,
	[position] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cms_post_field]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cms_post_field](
	[post_id] [int] NULL,
	[field_id] [int] NULL,
	[value] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cms_posts]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cms_posts](
	[id] [int] NULL,
	[type_id] [int] NULL,
	[code] [nvarchar](255) NULL,
	[title] [nvarchar](1024) NULL,
	[intro] [nvarchar](max) NULL,
	[body] [nvarchar](max) NULL,
	[filtered_body] [nvarchar](max) NULL,
	[image] [nvarchar](256) NULL,
	[image_alt] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[creator_id] [int] NULL,
	[last_modified_date] [datetime] NULL,
	[last_modifier_id] [int] NULL,
	[published_date] [datetime] NULL,
	[expiry_date] [datetime] NULL,
	[average_rating] [numeric](10, 0) NULL,
	[view_count] [int] NULL,
	[like_count] [int] NULL,
	[dislike_count] [int] NULL,
	[comment_count] [int] NULL,
	[allow_comment] [smallint] NULL,
	[allow_search] [smallint] NULL,
	[privacy] [int] NULL,
	[is_sticky] [smallint] NULL,
	[parent_id] [int] NULL,
	[position] [int] NULL,
	[status] [smallint] NULL,
	[settings] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Doc]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Doc](
	[id] [uniqueidentifier] NOT NULL,
	[type_id] [int] NULL,
	[user_id] [uniqueidentifier] NULL,
	[document_id] [int] NULL,
	[is_deleted] [bit] NULL,
	[created_by] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [nvarchar](max) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_Group_Cate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_CommentsTypesid]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_CommentsTypesid] ON [dbo].[Comments]
(
	[CommentsTypesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_newsId]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_newsId] ON [dbo].[Comments]
(
	[newsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsCate_CateId]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_NewsCate_CateId] ON [dbo].[NewsCate]
(
	[CateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsCate_NewsId]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_NewsCate_NewsId] ON [dbo].[NewsCate]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsSocial_NewsId]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_NewsSocial_NewsId] ON [dbo].[NewsSocial]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsSocial_SocialId]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_NewsSocial_SocialId] ON [dbo].[NewsSocial]
(
	[SocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsUserRead_NewsId]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_NewsUserRead_NewsId] ON [dbo].[NewsUserRead]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SharingTags_SharingId]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_SharingTags_SharingId] ON [dbo].[SharingTags]
(
	[SharingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SharingTags_TagsId]    Script Date: 4/25/2024 4:30:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_SharingTags_TagsId] ON [dbo].[SharingTags]
(
	[TagsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF__News__is_special__6F7F8B4B]  DEFAULT (CONVERT([bit],(0))) FOR [is_special]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF__News__is_highlig__7908F585]  DEFAULT (CONVERT([bit],(0))) FOR [is_highlight]
GO
ALTER TABLE [dbo].[NewsCate] ADD  CONSTRAINT [DF_NewsCate_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_CommentsTypes_CommentsTypesid] FOREIGN KEY([CommentsTypesid])
REFERENCES [dbo].[CommentsTypes] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_CommentsTypes_CommentsTypesid]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_News] FOREIGN KEY([newsId])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_News]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Sharing_sharingId] FOREIGN KEY([sharingId])
REFERENCES [dbo].[Sharing] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Sharing_sharingId]
GO
ALTER TABLE [dbo].[CommentsAttachment]  WITH CHECK ADD  CONSTRAINT [FK_CommentsAttachment_Comments_CommentsId] FOREIGN KEY([CommentsId])
REFERENCES [dbo].[Comments] ([id])
GO
ALTER TABLE [dbo].[CommentsAttachment] CHECK CONSTRAINT [FK_CommentsAttachment_Comments_CommentsId]
GO
ALTER TABLE [dbo].[CommentsSocial]  WITH CHECK ADD  CONSTRAINT [FK_CommentsSocial_Comments_CommentsId] FOREIGN KEY([CommentsId])
REFERENCES [dbo].[Comments] ([id])
GO
ALTER TABLE [dbo].[CommentsSocial] CHECK CONSTRAINT [FK_CommentsSocial_Comments_CommentsId]
GO
ALTER TABLE [dbo].[CommentsSocial]  WITH CHECK ADD  CONSTRAINT [FK_CommentsSocial_SocialTypes_SocialId] FOREIGN KEY([SocialId])
REFERENCES [dbo].[SocialTypes] ([id])
GO
ALTER TABLE [dbo].[CommentsSocial] CHECK CONSTRAINT [FK_CommentsSocial_SocialTypes_SocialId]
GO
ALTER TABLE [dbo].[Document_Departments]  WITH CHECK ADD  CONSTRAINT [FK_Document_Departments_Departments] FOREIGN KEY([department_id])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Document_Departments] CHECK CONSTRAINT [FK_Document_Departments_Departments]
GO
ALTER TABLE [dbo].[Document_Departments]  WITH CHECK ADD  CONSTRAINT [FK_Document_Departments_Document] FOREIGN KEY([document_id])
REFERENCES [dbo].[Documents] ([id])
GO
ALTER TABLE [dbo].[Document_Departments] CHECK CONSTRAINT [FK_Document_Departments_Document]
GO
ALTER TABLE [dbo].[Document_File]  WITH CHECK ADD  CONSTRAINT [FK_Document_File_Document] FOREIGN KEY([document_id])
REFERENCES [dbo].[Documents] ([id])
GO
ALTER TABLE [dbo].[Document_File] CHECK CONSTRAINT [FK_Document_File_Document]
GO
ALTER TABLE [dbo].[Document_File]  WITH CHECK ADD  CONSTRAINT [FK_Document_File_FAQs] FOREIGN KEY([faq_id])
REFERENCES [dbo].[FAQs] ([id])
GO
ALTER TABLE [dbo].[Document_File] CHECK CONSTRAINT [FK_Document_File_FAQs]
GO
ALTER TABLE [dbo].[Document_Jobgrades]  WITH CHECK ADD  CONSTRAINT [FK_Document_Jobgrades_Document] FOREIGN KEY([document_id])
REFERENCES [dbo].[Documents] ([id])
GO
ALTER TABLE [dbo].[Document_Jobgrades] CHECK CONSTRAINT [FK_Document_Jobgrades_Document]
GO
ALTER TABLE [dbo].[Document_Jobgrades]  WITH CHECK ADD  CONSTRAINT [FK_Document_Jobgrades_Jobgrades] FOREIGN KEY([jobgrade_id])
REFERENCES [dbo].[Jobgrades] ([id])
GO
ALTER TABLE [dbo].[Document_Jobgrades] CHECK CONSTRAINT [FK_Document_Jobgrades_Jobgrades]
GO
ALTER TABLE [dbo].[Document_Opcos]  WITH CHECK ADD  CONSTRAINT [FK_Document_Opcos_Document] FOREIGN KEY([document_id])
REFERENCES [dbo].[Documents] ([id])
GO
ALTER TABLE [dbo].[Document_Opcos] CHECK CONSTRAINT [FK_Document_Opcos_Document]
GO
ALTER TABLE [dbo].[Document_Opcos]  WITH CHECK ADD  CONSTRAINT [FK_Document_Opcos_Opcos] FOREIGN KEY([opco_id])
REFERENCES [dbo].[Opcos] ([id])
GO
ALTER TABLE [dbo].[Document_Opcos] CHECK CONSTRAINT [FK_Document_Opcos_Opcos]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Document_Category_Document] FOREIGN KEY([cate_document_id])
REFERENCES [dbo].[Category_Document] ([id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Document_Category_Document]
GO
ALTER TABLE [dbo].[DocumentTags]  WITH CHECK ADD  CONSTRAINT [FK_DocumentTags_Document] FOREIGN KEY([document_id])
REFERENCES [dbo].[Documents] ([id])
GO
ALTER TABLE [dbo].[DocumentTags] CHECK CONSTRAINT [FK_DocumentTags_Document]
GO
ALTER TABLE [dbo].[DocumentTags]  WITH CHECK ADD  CONSTRAINT [FK_DocumentTags_Tags] FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[DocumentTags] CHECK CONSTRAINT [FK_DocumentTags_Tags]
GO
ALTER TABLE [dbo].[EventsHistory]  WITH CHECK ADD  CONSTRAINT [FK_EventsHistory_Events_EventsId] FOREIGN KEY([EventsId])
REFERENCES [dbo].[Events] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventsHistory] CHECK CONSTRAINT [FK_EventsHistory_Events_EventsId]
GO
ALTER TABLE [dbo].[FAQs]  WITH NOCHECK ADD  CONSTRAINT [FK_FAQs_Category_FAQs] FOREIGN KEY([category_faq_id])
REFERENCES [dbo].[Category_FAQs] ([id])
GO
ALTER TABLE [dbo].[FAQs] NOCHECK CONSTRAINT [FK_FAQs_Category_FAQs]
GO
ALTER TABLE [dbo].[FAQs_Comments]  WITH CHECK ADD  CONSTRAINT [FK_FAQs_Comments_FAQs] FOREIGN KEY([faq_id])
REFERENCES [dbo].[FAQs] ([id])
GO
ALTER TABLE [dbo].[FAQs_Comments] CHECK CONSTRAINT [FK_FAQs_Comments_FAQs]
GO
ALTER TABLE [dbo].[FAQs_Comments_Social]  WITH CHECK ADD  CONSTRAINT [FK_FAQs_Comments_Social_FAQs_Comments] FOREIGN KEY([faq_comments_id])
REFERENCES [dbo].[FAQs_Comments] ([id])
GO
ALTER TABLE [dbo].[FAQs_Comments_Social] CHECK CONSTRAINT [FK_FAQs_Comments_Social_FAQs_Comments]
GO
ALTER TABLE [dbo].[FAQs_Comments_Social]  WITH CHECK ADD  CONSTRAINT [FK_FAQs_Comments_Social_SocialTypes] FOREIGN KEY([social_type_id])
REFERENCES [dbo].[SocialTypes] ([id])
GO
ALTER TABLE [dbo].[FAQs_Comments_Social] CHECK CONSTRAINT [FK_FAQs_Comments_Social_SocialTypes]
GO
ALTER TABLE [dbo].[InternalApplication]  WITH CHECK ADD  CONSTRAINT [FK_InternalApplication_ApplicationCategory_ApplicationCategoryId] FOREIGN KEY([ApplicationCategoryId])
REFERENCES [dbo].[ApplicationCategory] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InternalApplication] CHECK CONSTRAINT [FK_InternalApplication_ApplicationCategory_ApplicationCategoryId]
GO
ALTER TABLE [dbo].[NewsCate]  WITH CHECK ADD  CONSTRAINT [FK_NewsCate_Category] FOREIGN KEY([CateId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[NewsCate] CHECK CONSTRAINT [FK_NewsCate_Category]
GO
ALTER TABLE [dbo].[NewsCate]  WITH CHECK ADD  CONSTRAINT [FK_NewsCate_News] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsCate] CHECK CONSTRAINT [FK_NewsCate_News]
GO
ALTER TABLE [dbo].[NewsSocial]  WITH CHECK ADD  CONSTRAINT [FK_NewsSocial_News_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsSocial] CHECK CONSTRAINT [FK_NewsSocial_News_NewsId]
GO
ALTER TABLE [dbo].[NewsSocial]  WITH CHECK ADD  CONSTRAINT [FK_NewsSocial_SocialTypes_SocialId] FOREIGN KEY([SocialId])
REFERENCES [dbo].[SocialTypes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsSocial] CHECK CONSTRAINT [FK_NewsSocial_SocialTypes_SocialId]
GO
ALTER TABLE [dbo].[NewsUserRead]  WITH CHECK ADD  CONSTRAINT [FK_NewsUserRead_News_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsUserRead] CHECK CONSTRAINT [FK_NewsUserRead_News_NewsId]
GO
ALTER TABLE [dbo].[Sharing]  WITH CHECK ADD  CONSTRAINT [FK_Sharing_SharingTypes_SharingTypesid] FOREIGN KEY([SharingTypesid])
REFERENCES [dbo].[SharingTypes] ([id])
GO
ALTER TABLE [dbo].[Sharing] CHECK CONSTRAINT [FK_Sharing_SharingTypes_SharingTypesid]
GO
ALTER TABLE [dbo].[SharingAttachment]  WITH CHECK ADD  CONSTRAINT [FK_SharingAttachment_SharingAttachmentTypes_SharingAttachmentTypesId] FOREIGN KEY([SharingAttachmentTypesId])
REFERENCES [dbo].[SharingAttachmentTypes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SharingAttachment] CHECK CONSTRAINT [FK_SharingAttachment_SharingAttachmentTypes_SharingAttachmentTypesId]
GO
ALTER TABLE [dbo].[SharingSocial]  WITH CHECK ADD  CONSTRAINT [FK_SharingSocial_Sharing_SharingId] FOREIGN KEY([SharingId])
REFERENCES [dbo].[Sharing] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SharingSocial] CHECK CONSTRAINT [FK_SharingSocial_Sharing_SharingId]
GO
ALTER TABLE [dbo].[SharingSocial]  WITH CHECK ADD  CONSTRAINT [FK_SharingSocial_SocialTypes_SocialId] FOREIGN KEY([SocialId])
REFERENCES [dbo].[SocialTypes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SharingSocial] CHECK CONSTRAINT [FK_SharingSocial_SocialTypes_SocialId]
GO
ALTER TABLE [dbo].[SharingTags]  WITH CHECK ADD  CONSTRAINT [FK_SharingTags_Sharing_SharingId] FOREIGN KEY([SharingId])
REFERENCES [dbo].[Sharing] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SharingTags] CHECK CONSTRAINT [FK_SharingTags_Sharing_SharingId]
GO
ALTER TABLE [dbo].[SharingTags]  WITH CHECK ADD  CONSTRAINT [FK_SharingTags_Tags_TagsId] FOREIGN KEY([TagsId])
REFERENCES [dbo].[Tags] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SharingTags] CHECK CONSTRAINT [FK_SharingTags_Tags_TagsId]
GO
ALTER TABLE [dbo].[SharingVote]  WITH CHECK ADD  CONSTRAINT [FK_SharingVote_Sharing_SharingId] FOREIGN KEY([SharingId])
REFERENCES [dbo].[Sharing] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SharingVote] CHECK CONSTRAINT [FK_SharingVote_Sharing_SharingId]
GO
ALTER TABLE [dbo].[SharingVoteResult]  WITH CHECK ADD  CONSTRAINT [FK_SharingVoteResult_SharingVote_SharingVoteId] FOREIGN KEY([SharingVoteId])
REFERENCES [dbo].[SharingVote] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SharingVoteResult] CHECK CONSTRAINT [FK_SharingVoteResult_SharingVote_SharingVoteId]
GO
ALTER TABLE [dbo].[tbl_cms_categories]  WITH CHECK ADD  CONSTRAINT [tbl_cms_categories_ibfk_1] FOREIGN KEY([parent_id])
REFERENCES [dbo].[tbl_cms_categories] ([id])
GO
ALTER TABLE [dbo].[tbl_cms_categories] CHECK CONSTRAINT [tbl_cms_categories_ibfk_1]
GO
ALTER TABLE [dbo].[User_Doc]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Doc_Document] FOREIGN KEY([document_id])
REFERENCES [dbo].[Documents] ([id])
GO
ALTER TABLE [dbo].[User_Doc] CHECK CONSTRAINT [FK_User_Doc_Document]
GO
ALTER TABLE [dbo].[User_Doc]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Doc_UserProfile365] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserProfile365] ([id])
GO
ALTER TABLE [dbo].[User_Doc] CHECK CONSTRAINT [FK_User_Doc_UserProfile365]
GO
/****** Object:  StoredProcedure [dbo].[SearchFullTextDocumentWithPagination]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchFullTextDocumentWithPagination]
    @SearchTerm NVARCHAR(100),
    @PageNumber INT,
    @PageSize INT,
	@SortAscending BIT = 0,
	@FromDate DATETIME = NULL,
	@ToDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Tạo bảng tạm để lưu các hàng được phân trang
    CREATE TABLE #Results
    (
        id INT,
        cate_document_id INT,
        title NVARCHAR(max),
        file_id uniqueidentifier,
        file_name nvarchar(max),
		root_folder_id INT,
		root_folder_name nvarchar(max),
		second_folder_id INT,
		second_folder_name NVARCHAR(MAX),
		created_date datetime,
        RowNum INT
    );

    -- Tìm kiếm và lưu kết quả vào bảng tạm với số thứ tự hàng
    INSERT INTO #Results (id, cate_document_id, title,file_id,  file_name,root_folder_id, second_folder_id,root_folder_name,second_folder_name,created_date, RowNum)
    SELECT P.id, p.cate_document_id, P.title,  C.id as file_id, c.file_name, f1.id, f2.id, f1.name, f2.name, P.created_date,
           ROW_NUMBER() OVER (ORDER BY
                CASE WHEN @SortAscending = 1 THEN p.created_date END ASC,
                CASE WHEN @SortAscending = 0 THEN p.created_date END DESC) AS RowNum
    FROM Documents P
    INNER JOIN Document_File C ON P.id = C.document_id
	left JOIN Category_Document f3 on p.cate_document_id = f3.id
	left  JOIN Category_Document f2 ON f3.parent_id = f2.Id
    left JOIN Category_Document f1 ON f2.parent_id = f1.Id
    WHERE
			((@FromDate IS NULL OR CONVERT(date, P.created_date) >= CONVERT(date, @FromDate))
			AND (@ToDate IS NULL OR CONVERT(date, P.created_date) <= CONVERT(date, @ToDate)))
			and (CONTAINS(P.title, @SearchTerm)
        OR CONTAINS(P.body, @SearchTerm)
        OR CONTAINS(C.file_name, @SearchTerm)
        OR CONTAINS(C.description, @SearchTerm))
	

    -- Lấy số lượng tổng cộng của các hàng
    DECLARE @TotalRows INT;
    SET @TotalRows = (SELECT COUNT(*) FROM #Results);

    -- Lấy kết quả phân trang dựa trên PageNumber và PageSize
    SELECT id,cate_document_id, title, file_id,file_name,root_folder_id, second_folder_id,root_folder_name,second_folder_name,created_date, @TotalRows as TotalRows
    FROM #Results
    ORDER BY RowNum
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY;

    -- Xóa bảng tạm
    DROP TABLE #Results;

END
GO
/****** Object:  StoredProcedure [dbo].[SearchFullTextFAQWithPagination]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchFullTextFAQWithPagination]
    @SearchTerm NVARCHAR(100),
    @PageNumber INT,
    @PageSize INT,
	@SortAscending BIT = 0,
	@FromDate DATETIME = NULL,
	@ToDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Tạo bảng tạm để lưu các hàng được phân trang
    CREATE TABLE #Results
    (
        id uniqueidentifier,
        cate_faq_id INT,
        question NVARCHAR(max),
        answer nvarchar(max),
		root_folder_id INT,
		root_folder_name nvarchar(max),
		created_date datetime,
        RowNum INT
    );

    -- Tìm kiếm và lưu kết quả vào bảng tạm với số thứ tự hàng
    INSERT INTO #Results (id, cate_faq_id, question,answer,root_folder_id,root_folder_name,created_date, RowNum)
    SELECT P.id, p.category_faq_id, P.question, p.anwser, f1.id,f1.name, p.created_date,
           ROW_NUMBER() OVER (ORDER BY
                CASE WHEN @SortAscending = 1 THEN p.created_date END ASC,
                CASE WHEN @SortAscending = 0 THEN p.created_date END DESC) AS RowNum
    FROM FAQs P
	left  JOIN Category_FAQs f2 ON p.category_faq_id = f2.Id
    left JOIN Category_FAQs f1 ON f2.parent_id = f1.Id
    WHERE
		((@FromDate IS NULL OR CONVERT(date, P.created_date) >= CONVERT(date, @FromDate))
			AND (@ToDate IS NULL OR CONVERT(date, P.created_date) <= CONVERT(date, @ToDate)))
			AND
		P.type_id = 1 and ((CONTAINS(P.question, @SearchTerm)
        OR CONTAINS(P.anwser, @SearchTerm)))
		
    -- Lấy số lượng tổng cộng của các hàng
    DECLARE @TotalRows INT;
    SET @TotalRows = (SELECT COUNT(*) FROM #Results);

    -- Lấy kết quả phân trang dựa trên PageNumber và PageSize
    SELECT id, cate_faq_id, question,answer,root_folder_id,root_folder_name,created_date, @TotalRows as TotalRows
    FROM #Results
    ORDER BY RowNum
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY;

    -- Xóa bảng tạm
    DROP TABLE #Results;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_company_reaction]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_company_reaction]
	-- Add the parameters for the stored procedure here
	@from datetime,
	@to datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
select ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS id,temp.company,Sum(temp.total_views) as total_views,Sum(temp.total_comments) as total_comments,Sum(temp.total_create_content) as total_create_content,Sum(temp.total_reaction) as total_reaction,SUM(total_comments+total_create_content+total_reaction+total_views) as total,0 as rank from (
  SELECT        c.id,c.username, c.display_name, c.email, c.company, c.total_views, c.total_comments, c.total_create_content, ISNULL(d.total_reaction, 0) AS total_reaction, SUM(c.total_views + c.total_comments + c.total_create_content + ISNULL(d.total_reaction, 0)) AS total, 0 AS rank
FROM            (SELECT        b.id,b.username, b.display_name, b.email, b.company, b.total_views, b.total_comments, COUNT(sharing.created_by) AS total_create_content
                          FROM            (SELECT        a.id,a.username, a.display_name, a.email, a.company, a.total_views, COUNT(users_comments.created_by) AS total_comments
                                                    FROM            (SELECT        users.id,users.username, users.display_name, users.email, users.company, COUNT(user_read.user_name) AS total_views
                                                                              FROM            dbo.UserProfile365 AS users LEFT OUTER JOIN
                                                                                                        dbo.NewsUserRead AS user_read ON user_read.user_name = users.username
																										 where user_read.created_date>=@from and user_read.created_date<=@to
                                                                              GROUP BY users.id,users.username, users.display_name, users.email, users.company) AS a LEFT OUTER JOIN
                                                                              dbo.Comments AS users_comments ON users_comments.created_by = a.username
																			   where users_comments.created_date>=@from and users_comments.created_date<=@to
                                                    GROUP BY a.id,a.username, a.display_name, a.email, a.company, a.total_views) AS b LEFT OUTER JOIN
                                                    dbo.Sharing AS sharing ON sharing.created_by = b.username
													where sharing.created_date>=@from and sharing.created_date<=@to
                          GROUP BY b.id,b.username, b.display_name, b.email, b.company, b.total_views, b.total_comments) AS c LEFT OUTER JOIN
                             (SELECT        created_by, SUM(cs) AS total_reaction
                               FROM            (SELECT        created_by, COUNT(created_by) AS cs
                                                         FROM            dbo.CommentsSocial
														 where CommentsSocial.created_date>=@from and CommentsSocial.created_date<=@to
                                                         GROUP BY created_by
                                                         UNION
                                                         SELECT        created_by, COUNT(created_by) AS sc
                                                         FROM            dbo.SharingSocial
														 where SharingSocial.created_date>=@from and SharingSocial.created_date<=@to
                                                         GROUP BY created_by
                                                         UNION
                                                         SELECT        created_by, COUNT(created_by) AS ns
                                                         FROM            dbo.NewsSocial
														  where NewsSocial.created_date>=@from and NewsSocial.created_date<=@to
                                                         GROUP BY created_by) AS total_reaction_temp
                               GROUP BY created_by) AS d ON d.created_by = c.username
GROUP BY c.id,c.username, c.display_name, c.email, c.company, c.total_views, c.total_comments, c.total_create_content, d.total_reaction
HAVING        (SUM(c.total_views + c.total_comments + c.total_create_content + ISNULL(d.total_reaction, 0)) > 0)
) as temp
group by temp.company

END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_reaction]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_users_reaction] 
	@display_name nvarchar(100),
	@company nvarchar(100),
	@from datetime,
	@to datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @to=@to+' 23:59:59';
  SELECT        c.id,c.username, c.display_name, c.email, c.company, c.total_views, c.total_comments, c.total_create_content, ISNULL(d.total_reaction, 0) AS total_reaction, SUM(c.total_views + c.total_comments + c.total_create_content + ISNULL(d.total_reaction, 0)) AS total, 0 AS rank
FROM            (SELECT        b.id,b.username, b.display_name, b.email, b.company, b.total_views, b.total_comments, COUNT(sharing.created_by)*2 AS total_create_content
                          FROM            (SELECT        a.id,a.username, a.display_name, a.email, a.company, a.total_views, COUNT(users_comments.created_by)*2 AS total_comments
                                                    FROM            (SELECT        users.id,users.username, users.display_name, users.email, users.company, COUNT(user_read.user_name) AS total_views
                                                                              FROM            dbo.UserProfile365 AS users LEFT OUTER JOIN
                                                                                                        dbo.NewsUserRead AS user_read ON user_read.user_name = users.username and user_read.created_date>=@from and user_read.created_date<=@to
																										 where (@display_name='' or display_name like '%'+@display_name+'%') and (@company='All' or company like '%'+@company+'%')
                                                                              GROUP BY users.id,users.username, users.display_name, users.email, users.company) AS a LEFT OUTER JOIN
                                                                              dbo.Comments AS users_comments ON users_comments.created_by = a.username and users_comments.created_date>=@from and users_comments.created_date<=@to
                                                    GROUP BY a.id,a.username, a.display_name, a.email, a.company, a.total_views) AS b LEFT OUTER JOIN
                                                    dbo.Sharing AS sharing ON sharing.created_by = b.username and sharing.created_date>=@from and sharing.created_date<=@to
													
                          GROUP BY b.id,b.username, b.display_name, b.email, b.company, b.total_views, b.total_comments) AS c 
						  LEFT OUTER JOIN
                             (SELECT        created_by, SUM(cs) AS total_reaction
                               FROM            (SELECT        created_by, COUNT(created_by) AS cs
                                                         FROM            dbo.CommentsSocial
														 where CommentsSocial.created_date>=@from and CommentsSocial.created_date<=@to
                                                         GROUP BY created_by
                                                         UNION
                                                         SELECT        created_by, COUNT(created_by) AS sc
                                                         FROM            dbo.SharingSocial
														 where SharingSocial.created_date>=@from and SharingSocial.created_date<=@to
                                                         GROUP BY created_by
                                                         UNION
                                                         SELECT        created_by, COUNT(created_by) AS ns
                                                         FROM            dbo.NewsSocial
														  where NewsSocial.created_date>=@from and NewsSocial.created_date<=@to
                                                         GROUP BY created_by) AS total_reaction_temp
                               GROUP BY created_by) AS d ON d.created_by = c.username
GROUP BY c.id,c.username, c.display_name, c.email, c.company, c.total_views, c.total_comments, c.total_create_content, d.total_reaction
HAVING        (SUM(c.total_views + c.total_comments + c.total_create_content + ISNULL(d.total_reaction, 0)) > 0)

END
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 4/25/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test]  @parent_id INT
AS 
BEGIN
     WITH tree AS
    (
      SELECT c1.id, c1.parent_id, c1.name
      FROM DBO.Category_Document c1
      WHERE c1.id = @parent_id and c1.is_deleted = 0 and c1.is_show = 1
      UNION ALL
      SELECT c2.id, c2.parent_id, c2.name
      FROM dbo.Category_Document c2 INNER JOIN tree ON tree.id = c2.parent_id
	  where c2.is_deleted = 0 and c2.is_show = 1
    )
	select count(*) from Documents as t1
	where t1.is_deleted = 0 and t1.is_show = 1 and t1.cate_document_id in (SELECT tree.id
    FROM tree)
	END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Folder - hay còn gọi là cây thư mục' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category_Document'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'File đính kèm của document' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Document_File'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'thông tin Tài liệu ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Documents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại permission của user: 1- được xem; 2 không được xem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Doc', @level2type=N'COLUMN',@level2name=N'type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'table trung gian của Group - document - user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Doc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Là Opco' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserProfile365', @level2type=N'COLUMN',@level2name=N'company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Là Dept' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserProfile365', @level2type=N'COLUMN',@level2name=N'department'
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
         Begin Table = "Category_Document"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_count_category_document'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_count_category_document'
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
         Begin Table = "Category_FAQs"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_count_category_faq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_count_category_faq'
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
         Begin Table = "cate_gen_code (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 179
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_gen_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_gen_code'
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
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
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
      Begin ColumnWidths = 10
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_news_report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_news_report'
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
         Configuration = "(H (4[30] 2[40] 3) )"
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
      Begin ColumnWidths = 10
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_sharing_report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_sharing_report'
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
         Begin Table = "logs"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "profile"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 1
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_user_logs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_user_logs'
GO
USE [master]
GO
ALTER DATABASE [VIEACCESS_UAT] SET  READ_WRITE 
GO
