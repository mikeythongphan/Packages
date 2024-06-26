USE [master]
GO
/****** Object:  Database [OCM]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE DATABASE [OCM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OCM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OCM.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OCM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OCM_log.ldf' , SIZE = 1122304KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OCM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OCM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OCM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OCM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OCM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OCM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OCM] SET ARITHABORT OFF 
GO
ALTER DATABASE [OCM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OCM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OCM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OCM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OCM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OCM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OCM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OCM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OCM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OCM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OCM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OCM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OCM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OCM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OCM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OCM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OCM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OCM] SET RECOVERY FULL 
GO
ALTER DATABASE [OCM] SET  MULTI_USER 
GO
ALTER DATABASE [OCM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OCM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OCM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OCM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OCM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OCM', N'ON'
GO
ALTER DATABASE [OCM] SET QUERY_STORE = OFF
GO
USE [OCM]
GO
/****** Object:  User [VACGROUP\thong.phan.duy]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE USER [VACGROUP\thong.phan.duy] FOR LOGIN [VACGROUP\thong.phan.duy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [usr_bi_team]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE USER [usr_bi_team] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [VACGROUP\thong.phan.duy]
GO
ALTER ROLE [db_datareader] ADD MEMBER [usr_bi_team]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [usr_bi_team]
GO
ALTER ROLE [db_owner] ADD MEMBER [GCSMI]
GO
ALTER ROLE [db_owner] ADD MEMBER [CMSDEV]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  View [dbo].[v_cate_province]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE VIEW [dbo].[v_cate_province] as
                SELECT [id]
                      ,[name]
                  FROM [GCS_CATEGORY].[dbo].[cate_province]
                  where is_active = 1
                            
GO
/****** Object:  View [dbo].[v_cate_status]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE VIEW [dbo].[v_cate_status] as
                SELECT Id, Name, Type, IsDelete, create_by, create_time, update_by, update_time, OrderNumber, ocm_percent
                    FROM   GCS_CATEGORY.dbo.IPP_CATESTATUS
                    WHERE (IsDelete = 0)
                            
GO
/****** Object:  View [dbo].[v_cate_tax]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

               CREATE VIEW [dbo].[v_cate_tax] as
                select id,code,value from GCS_CATEGORY.dbo.cate_tax
                    where is_active = 1
                            
GO
/****** Object:  View [dbo].[v_product_category]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                CREATE VIEW [dbo].[v_product_category] as
                        SELECT [Id]
                              ,[CategoryName]
                          FROM [SPM_GCS].[dbo].[product_category]
                          where is_active = 1

                    
GO
/****** Object:  View [dbo].[v_user_manager]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                 CREATE VIEW [dbo].[v_user_manager] as
                     SELECT m.id, m.username, m.line_manager, u.is_admin, u.is_bom, u.is_viewall
                        FROM   GCS_USERS.dbo.auth_user_manager AS m INNER JOIN
                                     GCS_USERS.dbo.auth_user AS u ON m.username = u.username
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [dbo].[contract_approve_history]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_approve_history](
	[id] [uniqueidentifier] NOT NULL,
	[old_status_id] [int] NULL,
	[new_status_id] [int] NULL,
	[notes] [nvarchar](max) NULL,
	[approval_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[role_approve] [int] NOT NULL,
	[contract_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_contract_approve_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_product_map]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_product_map](
	[id] [uniqueidentifier] NOT NULL,
	[task_id] [int] NULL,
	[net_amount] [float] NULL,
	[increase] [float] NULL,
	[total_amount] [float] NULL,
	[start_date] [datetime2](7) NULL,
	[end_date] [datetime2](7) NULL,
	[warranty_start_date] [datetime2](7) NULL,
	[warranty_end_date] [datetime2](7) NULL,
	[product_id] [uniqueidentifier] NULL,
	[contract_id] [uniqueidentifier] NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[is_deleted] [bit] NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
 CONSTRAINT [PK_contract_product_map] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_product_map_02]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_product_map_02](
	[id] [uniqueidentifier] NOT NULL,
	[task_id] [nvarchar](max) NULL,
	[net_amount] [float] NULL,
	[increase] [float] NULL,
	[total_amount] [float] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[warranty_start_date] [date] NULL,
	[warranty_end_date] [date] NULL,
	[product_id] [nvarchar](max) NULL,
	[contract_id] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[create_time] [date] NULL,
	[is_deleted] [bit] NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [date] NULL,
 CONSTRAINT [PK_contract_product_map_02] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[id] [uniqueidentifier] NOT NULL,
	[cate_district_id] [int] NULL,
	[cate_province_id] [int] NULL,
	[population] [int] NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[create_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_deleted] [bit] NOT NULL,
	[code] [nvarchar](max) NULL,
 CONSTRAINT [PK_district] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ocm_history]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ocm_history](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Entity] [nvarchar](max) NULL,
	[create_by] [nvarchar](max) NULL,
	[action] [nvarchar](max) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NOT NULL,
	[create_time] [datetime2](7) NOT NULL,
	[ContentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_ocm_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[street_id] [uniqueidentifier] NULL,
	[ad_form_id] [uniqueidentifier] NULL,
	[bus_license_plate] [nvarchar](max) NULL,
	[bus_type] [int] NULL,
	[bus_route_name] [nvarchar](max) NULL,
	[bus_route] [nvarchar](max) NULL,
	[bus_forward] [nvarchar](max) NULL,
	[bus_backward] [nvarchar](max) NULL,
	[bus_station] [nvarchar](max) NULL,
	[path_bus_map] [nvarchar](max) NULL,
	[path_bus_image] [nvarchar](max) NULL,
	[path_bus_schedule] [nvarchar](max) NULL,
	[is_full_window] [bit] NULL,
	[taxi_company] [int] NULL,
	[taxi_ad] [int] NULL,
	[taxi_type] [int] NULL,
	[taxi_license_plate] [nvarchar](max) NULL,
	[path_taxi_image] [nvarchar](max) NULL,
	[longtitute] [nvarchar](max) NULL,
	[lattitute] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[investment_status] [int] NULL,
	[production_material_id] [int] NULL,
	[has_lighting] [bit] NULL,
	[number_illumination] [int] NULL,
	[owner_id] [int] NULL,
	[price] [float] NULL,
	[network_id] [nvarchar](max) NULL,
	[has_license] [bit] NULL,
	[path_file_license] [nvarchar](max) NULL,
	[not_sale] [bit] NULL,
	[score] [float] NULL,
	[cpm] [float] NULL,
	[sale_status_id] [int] NULL,
	[from_date] [datetime2](7) NULL,
	[to_date] [datetime2](7) NULL,
	[client_id] [int] NULL,
	[grade_id] [int] NULL,
	[ranking_id] [int] NULL,
	[structure_id] [int] NULL,
	[viewing_height_id] [int] NULL,
	[visible_distance_id] [int] NULL,
	[visible_issue_id] [int] NULL,
	[obstruct_id] [int] NULL,
	[visual_clutter_id] [int] NULL,
	[sorroundings_area_id] [int] NULL,
	[number_of_roads_id] [int] NULL,
	[road_type_id] [int] NULL,
	[zone_id] [int] NULL,
	[roundabout_id] [int] NULL,
	[angle_vision_id] [int] NULL,
	[traffic_speed_id] [int] NULL,
	[illumination] [bit] NULL,
	[traffic_light] [bit] NULL,
	[electric_contract_no] [nvarchar](max) NULL,
	[electric_signed_date] [datetime2](7) NULL,
	[electric_session] [nvarchar](max) NULL,
	[electric_customer_no] [nvarchar](max) NULL,
	[electric_route] [nvarchar](max) NULL,
	[electric_agency_id] [int] NULL,
	[traffic_roundabout] [bit] NULL,
	[bend_of_road] [bit] NULL,
	[crossroads_with_traffic_light] [bit] NULL,
	[crossroads_without_traffic_light] [bit] NULL,
	[path_photo] [nvarchar](max) NULL,
	[path_video] [nvarchar](max) NULL,
	[path_site_chart] [nvarchar](max) NULL,
	[path_street_view] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[create_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_deleted] [bit] NOT NULL,
	[lcdled_quantity] [int] NULL,
	[lcdled_remain_spot_day] [int] NULL,
	[lcdled_total_spot] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_lcdled]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_lcdled](
	[id] [uniqueidentifier] NOT NULL,
	[type] [int] NULL,
	[name] [nvarchar](max) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[duration] [int] NULL,
	[create_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_deleted] [bit] NOT NULL,
	[product_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_product_lcdled] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_side]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_side](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[mW] [decimal](18, 2) NULL,
	[mH] [decimal](18, 2) NULL,
	[square] [decimal](18, 2) NULL,
	[numericalorder] [int] NULL,
	[create_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_deleted] [bit] NOT NULL,
	[product_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_product_side] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[production_contract]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[production_contract](
	[id] [uniqueidentifier] NOT NULL,
	[contract_no] [nvarchar](max) NULL,
	[type] [int] NULL,
	[vendor_id] [int] NULL,
	[signed_date] [datetime2](7) NULL,
	[category] [int] NOT NULL,
	[pic] [nvarchar](max) NULL,
	[path_file_upload] [nvarchar](max) NULL,
	[tax_id] [int] NULL,
	[net_total] [float] NULL,
	[increase_total] [float] NULL,
	[gross_total] [float] NULL,
	[is_temp] [bit] NOT NULL,
	[status_id] [int] NULL,
	[notes] [nvarchar](max) NULL,
	[create_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_deleted] [bit] NOT NULL,
	[import_year] [int] NULL,
	[numericalorder_year] [int] NULL,
	[sub_type] [int] NULL,
	[accountant] [nvarchar](max) NULL,
	[head_production] [nvarchar](max) NULL,
	[accountant_status_id] [int] NULL,
	[head_production_status_id] [int] NULL,
	[accountant_notes] [nvarchar](max) NULL,
	[head_production_notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_production_contract] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[street]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[street](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NULL,
	[cate_street_id] [int] NULL,
	[cate_province_id] [int] NULL,
	[district_id] [uniqueidentifier] NULL,
	[street_direction] [nvarchar](max) NULL,
	[traffic_flow] [int] NULL,
	[camera_position] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[create_time] [datetime2](7) NULL,
	[create_by] [nvarchar](max) NULL,
	[update_by] [nvarchar](max) NULL,
	[update_time] [datetime2](7) NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_street] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp202312]    Script Date: 4/25/2024 4:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp202312](
	[id] [nvarchar](max) NULL,
	[short_name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Index [IX_contract_approve_history_contract_id]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_contract_approve_history_contract_id] ON [dbo].[contract_approve_history]
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_product_street_id]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_product_street_id] ON [dbo].[product]
(
	[street_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_product_lcdled_product_id]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_product_lcdled_product_id] ON [dbo].[product_lcdled]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_product_side_product_id]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_product_side_product_id] ON [dbo].[product_side]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_street_district_id]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_street_district_id] ON [dbo].[street]
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:20:40 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:20:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contract_product_map] ADD  CONSTRAINT [DF__contract___is_de__70DDC3D8]  DEFAULT (CONVERT([bit],(0))) FOR [is_deleted]
GO
ALTER TABLE [dbo].[contract_product_map_02] ADD  CONSTRAINT [DF_contract_product_map_02_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[contract_approve_history]  WITH CHECK ADD  CONSTRAINT [FK_contract_approve_history_production_contract_contract_id] FOREIGN KEY([contract_id])
REFERENCES [dbo].[production_contract] ([id])
GO
ALTER TABLE [dbo].[contract_approve_history] CHECK CONSTRAINT [FK_contract_approve_history_production_contract_contract_id]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_street_street_id] FOREIGN KEY([street_id])
REFERENCES [dbo].[street] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_street_street_id]
GO
ALTER TABLE [dbo].[product_lcdled]  WITH CHECK ADD  CONSTRAINT [FK_product_lcdled_product_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product_lcdled] CHECK CONSTRAINT [FK_product_lcdled_product_product_id]
GO
ALTER TABLE [dbo].[product_side]  WITH CHECK ADD  CONSTRAINT [FK_product_side_product_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product_side] CHECK CONSTRAINT [FK_product_side_product_product_id]
GO
ALTER TABLE [dbo].[street]  WITH CHECK ADD  CONSTRAINT [FK_street_district_district_id] FOREIGN KEY([district_id])
REFERENCES [dbo].[district] ([id])
GO
ALTER TABLE [dbo].[street] CHECK CONSTRAINT [FK_street_district_district_id]
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
ALTER DATABASE [OCM] SET  READ_WRITE 
GO
