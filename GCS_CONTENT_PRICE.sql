USE [master]
GO
/****** Object:  Database [GCS_CONTENT_PRICE]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE DATABASE [GCS_CONTENT_PRICE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GCS_DEV_CONTENT_PRICE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_CONTENT_PRICE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GCS_DEV_CONTENT_PRICE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_CONTENT_PRICE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GCS_CONTENT_PRICE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET ARITHABORT OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET RECOVERY FULL 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET  MULTI_USER 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GCS_CONTENT_PRICE', N'ON'
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET QUERY_STORE = OFF
GO
USE [GCS_CONTENT_PRICE]
GO
/****** Object:  User [VACGROUP\thong.phan.duy]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [VACGROUP\thong.phan.duy] FOR LOGIN [VACGROUP\thong.phan.duy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\tham.tran]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [VACGROUP\tham.tran] FOR LOGIN [VACGROUP\tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\khoa.huynh]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [VACGROUP\khoa.huynh] FOR LOGIN [VACGROUP\khoa.huynh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tham.tran]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [tham.tran] FOR LOGIN [tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nhung.tran]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [nhung.tran] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [mdm]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [mdm] FOR LOGIN [mdm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DWH_BI]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [DWH_BI] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BITEAM]    Script Date: 4/25/2024 4:04:55 PM ******/
CREATE USER [BITEAM] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bao.nguyen.gia]    Script Date: 4/25/2024 4:04:55 PM ******/
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
/****** Object:  Table [dbo].[content_price]    Script Date: 4/25/2024 4:04:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content_id] [varchar](100) NULL,
	[type_price_id] [int] NULL,
	[pricing] [float] NULL,
	[currency_id] [int] NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[company_id] [int] NULL,
 CONSTRAINT [PK_content_price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_price]    Script Date: 4/25/2024 4:04:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_price]
AS
SELECT p.id, p.content_id, p.type_price_id, p.pricing, p.currency_id, p.is_active, p.create_by, p.create_time, p.update_by, p.update_time, ct.name AS type_price_name, cu.name AS currency_name, p.company_id
FROM   dbo.content_price AS p LEFT OUTER JOIN
             GCS_CATEGORY.dbo.cate_type_price AS ct ON ct.id = p.type_price_id LEFT OUTER JOIN
             GCS_CATEGORY.dbo.cate_currency AS cu ON cu.id = p.currency_id
GO
/****** Object:  Table [dbo].[content_price_history]    Script Date: 4/25/2024 4:04:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_price_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_by] [varchar](100) NOT NULL,
	[action] [varchar](50) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NULL,
	[create_time] [datetime] NOT NULL,
	[content_id] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_price_old]    Script Date: 4/25/2024 4:04:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_price_old](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content_id] [varchar](100) NULL,
	[pricing_total] [bigint] NULL,
	[currency_total_id] [int] NULL,
	[pricing_tv] [bigint] NULL,
	[currency_tv_id] [int] NULL,
	[pricing_ott_exclusive] [bigint] NULL,
	[pricing_ott_not_exclusive] [bigint] NULL,
	[pricing_ott_simulicast] [bigint] NULL,
	[currency_ott_id] [int] NULL,
	[pricing_iptv] [bigint] NULL,
	[currency_iptv_id] [int] NULL,
	[pricing_youtube] [bigint] NULL,
	[currency_youtube_id] [int] NULL,
	[pricing_facebook] [bigint] NULL,
	[currency_facebook_id] [int] NULL,
	[pricing_other] [bigint] NULL,
	[currency_other_id] [int] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[content_price] ADD  CONSTRAINT [DF_content_price_is_active]  DEFAULT ((0)) FOR [is_active]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[21] 3) )"
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
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 280
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "ct"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cu"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_price'
GO
USE [master]
GO
ALTER DATABASE [GCS_CONTENT_PRICE] SET  READ_WRITE 
GO
