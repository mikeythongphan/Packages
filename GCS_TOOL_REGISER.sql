USE [master]
GO
/****** Object:  Database [GCS_TOOL_REGISER]    Script Date: 4/25/2024 4:13:57 PM ******/
CREATE DATABASE [GCS_TOOL_REGISER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GCS_DEV_TOOL_REGISER', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_TOOL_REGISER.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GCS_DEV_TOOL_REGISER_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_TOOL_REGISER_log.ldf' , SIZE = 335872KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GCS_TOOL_REGISER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET ARITHABORT OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET RECOVERY FULL 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET  MULTI_USER 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GCS_TOOL_REGISER', N'ON'
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET QUERY_STORE = OFF
GO
USE [GCS_TOOL_REGISER]
GO
/****** Object:  User [VACGROUP\tham.tran]    Script Date: 4/25/2024 4:13:58 PM ******/
CREATE USER [VACGROUP\tham.tran] FOR LOGIN [VACGROUP\tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\khoa.huynh]    Script Date: 4/25/2024 4:13:58 PM ******/
CREATE USER [VACGROUP\khoa.huynh] FOR LOGIN [VACGROUP\khoa.huynh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tham.tran]    Script Date: 4/25/2024 4:13:58 PM ******/
CREATE USER [tham.tran] FOR LOGIN [tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nhung.tran]    Script Date: 4/25/2024 4:13:58 PM ******/
CREATE USER [nhung.tran] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [mdm]    Script Date: 4/25/2024 4:13:58 PM ******/
CREATE USER [mdm] FOR LOGIN [mdm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:13:58 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:13:58 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
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
/****** Object:  View [dbo].[v_content_node]    Script Date: 4/25/2024 4:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_node]
AS
SELECT        c.id, c.name, c.original_name, f.ftp_port, f.ftp_host, f.ftp_root_path, c.ftp_path, p.is_data_upload, p.is_data_download, p.is_audio_download, p.is_audio_upload, p.is_final_download, p.is_final_upload, p.is_music_download, 
                         p.is_music_upload, p.is_project_download, p.is_project_upload, c.create_by
FROM            (SELECT        id, name, original_name, ftp_id, ftp_path, create_by, is_deleted
                          FROM            GCS_CONTENT.dbo.ct_content
                          UNION
                          SELECT        id, name, original_name, ftp_id, ftp_path, create_by, is_deleted
                          FROM            GCS_SHORT_CONTENT.dbo.ct_short_content) AS c LEFT OUTER JOIN
                         GCS_CONTENT.dbo.storage_ftp AS f ON f.id = c.ftp_id LEFT OUTER JOIN
                             (SELECT        id, content_id, is_view, is_view_price, is_edit, is_delete, create_master, is_view_master, is_edit_master, create_post, is_view_post, is_view_post_price, is_edit_post, is_data_upload, is_data_download, 
                                                         is_audio_upload, is_audio_download, is_music_upload, is_music_download, is_project_upload, is_project_download, is_final_upload, is_final_download, company_id
                               FROM            GCS_CONTENT.dbo.ct_content_permission
                               UNION
                               SELECT        id, content_id, is_view, is_view_price, is_edit, is_delete, create_master, is_view_master, is_edit_master, create_post, is_view_post, is_view_post_price, is_edit_post, is_data_upload, is_data_download, 
                                                        is_audio_upload, is_audio_download, is_music_upload, is_music_download, is_project_upload, is_project_download, is_final_upload, is_final_download, company_id
                               FROM            GCS_SHORT_CONTENT.dbo.ct_short_content_permission) AS p ON p.content_id = c.id
WHERE        (c.is_deleted = 0)
GO
/****** Object:  View [dbo].[v_content_permission_node]    Script Date: 4/25/2024 4:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_permission_node]
AS
SELECT        pe.content_id AS id, c.name, c.original_name, f.ftp_port, f.ftp_host, f.ftp_root_path, c.ftp_path, pe.is_data_upload, pe.is_data_download, pe.is_audio_download, pe.is_audio_upload, pe.is_final_download, pe.is_final_upload, 
                         pe.is_music_download, pe.is_music_upload, pe.is_project_download, pe.is_project_upload, pe.user_id
FROM            GCS_CONTENT.dbo.ct_content_permission AS pe LEFT OUTER JOIN
                         GCS_CONTENT.dbo.ct_content AS c ON c.id = pe.content_id LEFT OUTER JOIN
                         GCS_CONTENT.dbo.storage_ftp AS f ON f.id = c.ftp_id
GO
/****** Object:  Table [dbo].[tool_log]    Script Date: 4/25/2024 4:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tool_log](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[action] [nvarchar](250) NOT NULL,
	[type] [nvarchar](250) NOT NULL,
	[result] [bit] NOT NULL,
	[from_path] [nvarchar](max) NULL,
	[to_path] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[create_time] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tool_register]    Script Date: 4/25/2024 4:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tool_register](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[ip] [nvarchar](50) NULL,
	[mac_address] [nvarchar](100) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[active_by] [nvarchar](100) NULL,
	[active_time] [datetime] NULL
) ON [PRIMARY]
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
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "f"
            Begin Extent = 
               Top = 6
               Left = 305
               Bottom = 136
               Right = 475
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 513
               Bottom = 136
               Right = 710
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
      Begin ColumnWidths = 21
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
   End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_node'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_node'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_node'
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
         Begin Table = "pe"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 136
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "f"
            Begin Extent = 
               Top = 6
               Left = 540
               Bottom = 136
               Right = 710
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
      Begin ColumnWidths = 19
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_permission_node'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_permission_node'
GO
USE [master]
GO
ALTER DATABASE [GCS_TOOL_REGISER] SET  READ_WRITE 
GO
