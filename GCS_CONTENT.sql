USE [master]
GO
/****** Object:  Database [GCS_CONTENT]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE DATABASE [GCS_CONTENT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GCS_DEV_CONTENT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_CONTENT.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GCS_DEV_CONTENT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\GCS_CONTENT_log.ldf' , SIZE = 335872KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GCS_CONTENT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GCS_CONTENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GCS_CONTENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GCS_CONTENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GCS_CONTENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GCS_CONTENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GCS_CONTENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET RECOVERY FULL 
GO
ALTER DATABASE [GCS_CONTENT] SET  MULTI_USER 
GO
ALTER DATABASE [GCS_CONTENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GCS_CONTENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GCS_CONTENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GCS_CONTENT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GCS_CONTENT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GCS_CONTENT', N'ON'
GO
ALTER DATABASE [GCS_CONTENT] SET QUERY_STORE = OFF
GO
USE [GCS_CONTENT]
GO
/****** Object:  User [VACGROUP\van.hoang.bich]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [VACGROUP\van.hoang.bich] FOR LOGIN [VACGROUP\van.hoang.bich] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\thong.phan.duy]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [VACGROUP\thong.phan.duy] FOR LOGIN [VACGROUP\thong.phan.duy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\tham.tran]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [VACGROUP\tham.tran] FOR LOGIN [VACGROUP\tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VACGROUP\khoa.huynh]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [VACGROUP\khoa.huynh] FOR LOGIN [VACGROUP\khoa.huynh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tham.tran]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [tham.tran] FOR LOGIN [tham.tran] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nhung.tran]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [nhung.tran] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [mdm]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [mdm] FOR LOGIN [mdm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GCSMI]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [GCSMI] FOR LOGIN [GCSMI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DWH_BI]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [DWH_BI] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CMSDEV]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [CMSDEV] FOR LOGIN [CMSDEV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BITEAM]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [BITEAM] FOR LOGIN [usr_bi_team] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bao.nguyen.gia]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [bao.nguyen.gia] FOR LOGIN [bao.nguyen.gia] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [auth_talentmgt]    Script Date: 4/25/2024 4:03:18 PM ******/
CREATE USER [auth_talentmgt] FOR LOGIN [auth_talentmgt] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [VACGROUP\van.hoang.bich]
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
ALTER ROLE [db_datareader] ADD MEMBER [auth_talentmgt]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [auth_talentmgt]
GO
/****** Object:  Schema [HangFire]    Script Date: 4/25/2024 4:03:19 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertActor]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertActor]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(Nick_name,';')
	FROM GCS_CATEGORY.dbo.cate_talent as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertBroadcastMethod]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertBroadcastMethod]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(cast(name as NVARCHAR(MAX)),';')
	FROM GCS_CATEGORY.dbo.cate_broadcast_method as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertChannel]    Script Date: 4/25/2024 4:03:19 PM ******/
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

   SELECT @res = STRING_AGG(cast(name as NVARCHAR(MAX)),';')
	FROM GCS_CATEGORY.dbo.cate_channel as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertContentCategory]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[ConvertContentLanguage]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ConvertContentLanguage]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_gcm_language as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertDirector]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertDirector]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_director as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertGeography]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ConvertGeography]
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
/****** Object:  UserDefinedFunction [dbo].[ConvertManufacturer]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertManufacturer]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_supplier as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertNation]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[ConvertOpco]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertOpco]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_company as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertOwner]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertOwner]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_company as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertSpectator]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertSpectator]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_age as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertTalent]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertTalent]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_talent as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertVendor]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertVendor]
(
	@listId Nvarchar(MAX)
) 
RETURNS NVARCHAR(MAX)

AS
BEGIN
   DECLARE @res NVARCHAR(MAX)

   SELECT @res = STRING_AGG(name,';')
	FROM GCS_CATEGORY.dbo.cate_vendor as c
	INNER JOIN string_split(@listId, ';') s
	on c.id = s.value

   RETURN @res
END
GO
/****** Object:  Table [dbo].[ct_content_consolidate]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ct_content_consolidate](
	[id] [varchar](100) NOT NULL,
	[code] [nvarchar](max) NULL,
	[name] [nvarchar](max) NOT NULL,
	[original_name] [nvarchar](max) NOT NULL,
	[other_name] [nvarchar](max) NULL,
	[content_type_id] [int] NULL,
	[content_category_id] [nvarchar](max) NULL,
	[season] [int] NULL,
	[spectator_id] [nvarchar](max) NULL,
	[sex_id] [int] NULL,
	[ranking_id] [nvarchar](max) NULL,
	[rating_averager] [float] NULL,
	[content_source_id] [int] NULL,
	[script_id] [int] NULL,
	[year] [int] NULL,
	[nation_id] [varchar](100) NULL,
	[manufacturer_id] [varchar](100) NULL,
	[director_id] [nvarchar](max) NULL,
	[actor_id] [nvarchar](max) NULL,
	[file_quality_id] [int] NULL,
	[is_liquit] [bit] NULL,
	[language_id] [varchar](100) NULL,
	[is_planning] [bit] NULL,
	[description] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[company_id] [int] NOT NULL,
	[is_deleted] [bit] NULL,
	[ftp_id] [int] NOT NULL,
	[ftp_path] [varchar](max) NOT NULL,
	[create_by] [nvarchar](100) NOT NULL,
	[create_time] [datetime] NOT NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
	[numericalorder_year] [int] NULL,
	[Dupplicate] [int] IDENTITY(1,1) NOT NULL,
	[code_group] [nvarchar](100) NULL,
	[import_year] [int] NULL,
	[previous_content_id] [nvarchar](max) NULL,
	[reference_code] [nvarchar](max) NULL,
	[ref_numericalorder_year] [int] NULL,
	[description_en] [nvarchar](max) NULL,
	[is_used_vo] [bit] NULL,
 CONSTRAINT [PK_ct_content_consolidate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Export_Content_Contract_License]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Export_Content_Contract_License]
AS
SELECT ct.id, ct.code, ct.reference_code, ct.name, ct.original_name, ct.other_name, ct.content_type_id, ct.content_category_id, ct.season, ct.spectator_id, ct.sex_id, ct.ranking_id, ct.rating_averager, 
             ct.content_source_id, ct.script_id, ct.year, ct.import_year, ct.nation_id, ct.manufacturer_id, ct.director_id, ct.actor_id, ct.language_id, ct.is_planning, ct.description, ct.notes, cl.Code AS ContractCode, 
             cl.ContractContentName, cl.ContractContentCode, cl.SaleContractContentCode, cl.AcquisitionDate, cl.ContractCategory, cl.ContractType, cl.ContractStatus, cl.IsNew, cl.OwnerId, cl.SupplierId, cl.Tax, 
             cl.IsPlanning, cl.OpcoOrderIds, cl.OrderStatusId, cl.AcquisitionStatusId, cl.Pic, cl.DeadlineWarehouse, cl.episode, cl.file_quality_id, cl.file_extension_id, cl.duration_minute, cl.notes AS master_notes, 
             cl.LicenseTypeId, cl.LicenseNote, cl.GeographyIds, cl.BroadcastMethodIds, cl.delivery_platform_id, cl.exclusive_start_date, cl.exclusive_end_date, cl.non_exclusive_start_date, cl.non_exclusive_end_date, 
             cl.license_note, cl.platform_channel_general_ids
FROM   dbo.ct_content_consolidate AS ct LEFT OUTER JOIN
                 (SELECT c.Id, c.ContentId, c.Code, c.ContractContentCode, c.SaleContractContentCode, c.AcquisitionDate, c.ContractCategory, c.ContractType, c.ContractStatus, c.OwnerId, c.SupplierId, c.Tax, 
                              c.LicenseTypeId, c.LicenseNote, c.GeographyIds, c.BroadcastMethodIds, c.IsPlanning, c.OpcoOrderIds, c.OrderStatusId, c.AcquisitionStatusId, c.Pic, c.DeadlineWarehouse, c.IsTemp, c.create_by, 
                              c.create_time, c.update_by, c.update_time, c.ContractContentName, c.IsDelete, c.IsNew, c.OldContentId, c.run, c.run_remain, c.run_used, m.episode, m.file_quality_id, m.file_extension_id, 
                              m.duration_minute, m.notes, ld.platform_channel_general_ids, ld.notes AS license_note, ld.exclusive_start_date, ld.exclusive_end_date, ld.non_exclusive_start_date, ld.non_exclusive_end_date, 
                              ld.delivery_platform_id
                 FROM    GCS_CONTRACT.dbo.Contract AS c LEFT OUTER JOIN
                              GCS_CONTRACT.dbo.master AS m ON c.Id = m.ContractId LEFT OUTER JOIN
                              GCS_CONTRACT.dbo.license_detail AS ld ON ld.ContractId = c.Id
                 WHERE (c.IsDelete = 0)) AS cl ON ct.id = cl.ContentId
WHERE (ct.is_deleted = 0)
GO
/****** Object:  View [dbo].[Export_Content]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Export_Content]
AS
SELECT id, code, reference_code, name, original_name, other_name, company_id, content_type_id, content_category_id, season, spectator_id, sex_id, ranking_id, rating_averager, content_source_id, script_id, year, import_year, nation_id, manufacturer_id, director_id, actor_id, language_id, 
             is_planning, description, notes
FROM   dbo.ct_content_consolidate AS ct
WHERE (is_deleted = 0)
GO
/****** Object:  View [dbo].[Export_Content_Contract]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Export_Content_Contract]
AS
SELECT ct.id, ct.code, ct.reference_code, ct.name, ct.original_name, ct.other_name, ct.company_id, ct.content_type_id, ct.content_category_id, ct.season, ct.spectator_id, ct.sex_id, ct.ranking_id, ct.rating_averager, 
             ct.content_source_id, ct.script_id, ct.year, ct.import_year, ct.nation_id, ct.manufacturer_id, ct.director_id, ct.actor_id, ct.language_id, ct.is_planning, ct.description, ct.notes, cl.Code AS ContractCode, 
             cl.ContractContentName, cl.ContractContentCode, cl.SaleContractContentCode, cl.AcquisitionDate, cl.ContractCategory, cl.ContractType, cl.ContractStatus, cl.IsNew, cl.IsTransfer, cl.OwnerId, cl.SupplierId, 
             cl.Tax, cl.IsPlanning, cl.OpcoOrderIds, cl.OrderStatusId, cl.AcquisitionStatusId, cl.Pic, cl.DeadlineWarehouse, cl.episode, cl.file_quality_id, cl.file_extension_id, cl.duration_minute, cl.notes AS master_notes, 
             cl.LicenseTypeId, cl.LicenseNote, cl.GeographyIds, cl.BroadcastMethodIds
FROM   dbo.ct_content_consolidate AS ct LEFT OUTER JOIN
                 (SELECT c.Id, c.ContentId, c.Code, c.ContractContentCode, c.SaleContractContentCode, c.AcquisitionDate, c.ContractCategory, c.ContractType, c.ContractStatus, c.OwnerId, c.SupplierId, c.Tax, 
                              c.LicenseTypeId, c.LicenseNote, c.GeographyIds, c.BroadcastMethodIds, c.IsPlanning, c.OpcoOrderIds, c.OrderStatusId, c.AcquisitionStatusId, c.Pic, c.DeadlineWarehouse, c.IsTemp, c.create_by, 
                              c.create_time, c.update_by, c.update_time, c.ContractContentName, c.IsDelete, c.IsNew, c.IsTransfer, c.OldContentId, c.run, c.run_remain, c.run_used, m.episode, m.file_quality_id, 
                              m.file_extension_id, m.duration_minute, m.notes
                 FROM    (SELECT Id, ContentId, Code, ContractContentCode, AcquisitionDate, ContractCategory, ContractType, ContractStatus, OwnerId, SupplierId, Tax, LicenseTypeId, LicenseNote, GeographyIds, 
                                             BroadcastMethodIds, IsPlanning, OpcoOrderIds, OrderStatusId, AcquisitionStatusId, Pic, DeadlineWarehouse, IsTemp, create_by, create_time, update_by, update_time, 
                                             ContractContentName, IsDelete, IsNew, OldContentId, run, run_remain, run_used, IsTransfer, SaleContractContentCode
                               FROM    GCS_CONTRACT.dbo.Contract
                               WHERE  (IsDelete = 0)) AS c LEFT OUTER JOIN
                              GCS_CONTRACT.dbo.master AS m ON c.Id = m.ContractId) AS cl ON ct.id = cl.ContentId
WHERE (ct.is_deleted = 0)
GO
/****** Object:  View [dbo].[Export_Content_Contract_Test]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Export_Content_Contract_Test]
AS
SELECT ct.id, ct.code, ct.reference_code, ct.name, ct.original_name, ct.other_name,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_company
                 WHERE (id = ct.company_id)) AS company_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_content_type
                 WHERE (id = ct.content_type_id)) AS content_type_id, ct.content_category_id, ct.season, ct.spectator_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_sex
                 WHERE (id = ct.sex_id)) AS sex_id, ct.ranking_id, ct.rating_averager,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_content_source
                 WHERE (id = ct.content_source_id)) AS content_source_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_script
                 WHERE (id = ct.script_id)) AS script_id, ct.year, ct.import_year, ct.nation_id, ct.manufacturer_id, ct.director_id, ct.actor_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_gcm_language
                 WHERE (id = ct.language_id)) AS language_id, ct.is_planning, ct.description, ct.notes, cl.Code AS ContractCode, cl.ContractContentName, cl.ContractContentCode, cl.SaleContractContentCode, 
             cl.AcquisitionDate, CASE WHEN cl.ContractCategory = 0 THEN N'Hợp đồng mua' WHEN cl.ContractCategory = 1 THEN N'Hợp đồng bán' END AS ContractCategory,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_gcm_contract_type
                 WHERE (id = cl.ContractType)) AS ContractType,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_contract_status
                 WHERE (id = cl.ContractStatus)) AS ContractStatus, CASE WHEN cl.IsNew = 0 THEN 'FALSE' WHEN cl.IsNew = 1 THEN 'TRUE' END AS IsNew, 
             CASE WHEN cl.IsTransfer = 0 THEN 'FALSE' WHEN cl.IsTransfer = 1 THEN 'TRUE' END AS IsTransfer,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_vendor
                 WHERE (id = cl.OwnerId)) AS OwnerId,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_vendor AS cate_vendor_1
                 WHERE (id = cl.SupplierId)) AS SupplierId,
                 (SELECT TOP (1) code
                 FROM    GCS_CATEGORY.dbo.cate_tax
                 WHERE (id = cl.Tax)) AS Tax, CASE WHEN cl.IsPlanning = 0 THEN 'FALSE' WHEN cl.IsPlanning = 1 THEN 'TRUE' END AS IsPlanning, cl.OpcoOrderIds,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_order_status
                 WHERE (id = cl.OrderStatusId)) AS OrderStatusId,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_acquisitions_status
                 WHERE (id = cl.AcquisitionStatusId)) AS AcquisitionStatusId, cl.Pic, cl.DeadlineWarehouse, cl.episode,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_file_quality
                 WHERE (id = cl.file_quality_id)) AS file_quality_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_file_extension
                 WHERE (id = cl.file_extension_id)) AS file_extension_id, cl.duration_minute, cl.notes AS master_notes,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_license_type
                 WHERE (id = cl.LicenseTypeId)) AS LicenseTypeId, cl.LicenseNote, cl.GeographyIds, cl.BroadcastMethodIds, cl.delivery_platform_id, cl.is_free, cl.exclusive_start_date, cl.exclusive_end_date, 
             cl.non_exclusive_start_date, cl.non_exclusive_end_date, cl.license_note, cl.platform_channel_general_ids, cl.detail_run AS run
FROM   dbo.ct_content_consolidate AS ct LEFT OUTER JOIN
                 (SELECT c.Id, c.ContentId, c.Code, c.ContractContentCode, c.SaleContractContentCode, c.AcquisitionDate, c.ContractCategory, c.ContractType, c.ContractStatus, c.OwnerId, c.SupplierId, c.Tax, 
                              c.LicenseTypeId, c.LicenseNote, c.GeographyIds, c.BroadcastMethodIds, c.IsPlanning, c.OpcoOrderIds, c.OrderStatusId, c.AcquisitionStatusId, c.Pic, c.DeadlineWarehouse, c.IsTemp, c.create_by, 
                              c.create_time, c.update_by, c.update_time, c.ContractContentName, c.IsDelete, c.IsNew, c.IsTransfer, c.OldContentId, c.run, c.run_remain, c.run_used, m.episode, m.file_quality_id, 
                              m.file_extension_id, m.duration_minute, m.notes, ld.platform_channel_general_ids, ld.notes AS license_note, ld.exclusive_start_date, ld.exclusive_end_date, ld.non_exclusive_start_date, 
                              ld.non_exclusive_end_date, ld.delivery_platform_id, ld.is_free, ld.run AS detail_run, ld.is_active AS detail_active
                 FROM    (SELECT Id, ContentId, Code, ContractContentCode, AcquisitionDate, ContractCategory, ContractType, ContractStatus, OwnerId, SupplierId, Tax, LicenseTypeId, LicenseNote, GeographyIds, 
                                             BroadcastMethodIds, IsPlanning, OpcoOrderIds, OrderStatusId, AcquisitionStatusId, Pic, DeadlineWarehouse, IsTemp, create_by, create_time, update_by, update_time, 
                                             ContractContentName, IsDelete, IsNew, OldContentId, run, run_remain, run_used, IsTransfer, SaleContractContentCode
                               FROM    GCS_CONTRACT.dbo.Contract
                               WHERE  (IsDelete = 0)) AS c LEFT OUTER JOIN
                              GCS_CONTRACT.dbo.master AS m ON c.Id = m.ContractId LEFT OUTER JOIN
                                  (SELECT Id, is_free, exclusive_start_date, exclusive_end_date, non_exclusive_start_date, non_exclusive_end_date, channel_rights, is_all_channel, run, is_active, notes, create_by, create_time, 
                                               update_by, update_time, ContractId, forbidden_channel, delivery_platform_id, platform_channel_general_ids
                                  FROM    GCS_CONTRACT.dbo.license_detail
                                  WHERE (is_active = 1)) AS ld ON ld.ContractId = c.Id) AS cl ON ct.id = cl.ContentId
WHERE (ct.is_deleted = 0)
GO
/****** Object:  Table [dbo].[ct_content_permission]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ct_content_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content_id] [varchar](100) NOT NULL,
	[is_view] [bit] NOT NULL,
	[is_view_price] [bit] NOT NULL,
	[is_edit] [bit] NOT NULL,
	[is_delete] [bit] NOT NULL,
	[create_master] [bit] NOT NULL,
	[is_view_master] [bit] NOT NULL,
	[is_edit_master] [bit] NOT NULL,
	[create_post] [bit] NOT NULL,
	[is_view_post] [bit] NOT NULL,
	[is_view_post_price] [bit] NOT NULL,
	[is_edit_post] [bit] NOT NULL,
	[is_data_upload] [bit] NOT NULL,
	[is_data_download] [bit] NOT NULL,
	[is_audio_upload] [bit] NOT NULL,
	[is_audio_download] [bit] NOT NULL,
	[is_music_upload] [bit] NOT NULL,
	[is_music_download] [bit] NOT NULL,
	[is_project_upload] [bit] NOT NULL,
	[is_project_download] [bit] NOT NULL,
	[is_final_upload] [bit] NOT NULL,
	[is_final_download] [bit] NOT NULL,
	[company_id] [int] NOT NULL,
	[is_tool_view] [bit] NOT NULL,
	[is_tool_create] [bit] NOT NULL,
	[is_tool_update] [bit] NOT NULL,
	[is_tool_delete] [bit] NOT NULL,
	[is_tool_upload] [bit] NOT NULL,
	[is_tool_download] [bit] NOT NULL,
 CONSTRAINT [PK_ct_content_permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_permission_content]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_permission_content]
AS
SELECT p.id, p.content_id, p.is_view, p.is_view_price, p.is_edit, p.is_delete, p.create_master, p.is_view_master, p.is_edit_master, p.create_post, p.is_view_post, p.is_view_post_price, p.is_edit_post, p.is_data_upload, p.is_data_download, p.is_audio_upload, p.is_audio_download, 
             p.is_music_upload, p.is_music_download, p.is_project_upload, p.is_project_download, p.is_final_upload, p.is_final_download, p.company_id, c.name AS content_name, co.name AS company_name, p.is_tool_create, p.is_tool_view, p.is_tool_update, p.is_tool_delete, p.is_tool_download, 
             p.is_tool_upload
FROM   dbo.ct_content_permission AS p LEFT OUTER JOIN
             dbo.ct_content AS c ON c.id = p.content_id LEFT OUTER JOIN
             GCS_CATEGORY.dbo.cate_company AS co ON co.id = p.company_id
GO
/****** Object:  View [dbo].[Export_Content_Contract_Price]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Export_Content_Contract_Price]
AS
SELECT ct.id, ct.code, ct.reference_code, ct.name, ct.original_name, ct.other_name,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_company
                 WHERE (id = ct.company_id)) AS company_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_content_type
                 WHERE (id = ct.content_type_id)) AS content_type_id, ct.content_category_id, ct.season,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_age
                 WHERE (id = ct.spectator_id)) AS spectator_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_sex
                 WHERE (id = ct.sex_id)) AS sex_id, ct.ranking_id, ct.rating_averager,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_content_source
                 WHERE (id = ct.content_source_id)) AS content_source_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_script
                 WHERE (id = ct.script_id)) AS script_id, ct.year, ct.import_year, ct.nation_id, ct.manufacturer_id, ct.director_id, ct.actor_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_gcm_language
                 WHERE (id = ct.language_id)) AS language_id, ct.is_planning, ct.description, ct.notes, cl.Code AS ContractCode, cl.ContractContentName, cl.ContractContentCode, cl.AcquisitionDate, 
             CASE WHEN cl.ContractCategory = 0 THEN N'Hợp đồng mua' WHEN cl.ContractCategory = 1 THEN N'Hợp đồng bán' END AS ContractCategory,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_gcm_contract_type
                 WHERE (id = cl.ContractType)) AS ContractType,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_contract_status
                 WHERE (id = cl.ContractStatus)) AS ContractStatus, CASE WHEN cl.IsNew = 0 THEN 'FALSE' WHEN cl.IsNew = 1 THEN 'TRUE' END AS IsNew, CASE WHEN cl.IsTransfer = 0 THEN 'FALSE' WHEN cl.IsTransfer = 1 THEN 'TRUE' END AS IsTransfer,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_vendor
                 WHERE (id = cl.OwnerId)) AS OwnerId,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_vendor AS cate_vendor_1
                 WHERE (id = cl.SupplierId)) AS SupplierId,
                 (SELECT TOP (1) code
                 FROM    GCS_CATEGORY.dbo.cate_tax
                 WHERE (id = cl.Tax)) AS Tax, CASE WHEN cl.IsPlanning = 0 THEN 'FALSE' WHEN cl.IsPlanning = 1 THEN 'TRUE' END AS IsPlanning, cl.OpcoOrderIds,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_order_status
                 WHERE (id = cl.OrderStatusId)) AS OrderStatusId,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_acquisitions_status
                 WHERE (id = cl.AcquisitionStatusId)) AS AcquisitionStatusId, cl.Pic, cl.DeadlineWarehouse,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_type_price
                 WHERE (id = cl.type_price_id)) AS type_price_id,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_company AS cate_company_1
                 WHERE (id = cl.price_company_id)) AS price_company_id, cl.pricing,
                 (SELECT TOP (1) name
                 FROM    GCS_CATEGORY.dbo.cate_currency
                 WHERE (id = cl.currency_id)) AS currency_id
FROM   dbo.ct_content_consolidate AS ct LEFT OUTER JOIN
                 (SELECT c.Id, c.ContentId, c.Code, c.ContractContentCode, c.AcquisitionDate, c.ContractCategory, c.ContractType, c.ContractStatus, c.OwnerId, c.SupplierId, c.Tax, c.LicenseTypeId, c.LicenseNote, c.GeographyIds, c.BroadcastMethodIds, c.IsPlanning, c.OpcoOrderIds, 
                              c.OrderStatusId, c.AcquisitionStatusId, c.Pic, c.DeadlineWarehouse, c.IsTemp, c.create_by, c.create_time, c.update_by, c.update_time, c.ContractContentName, c.IsDelete, c.IsNew, c.IsTransfer, c.OldContentId, c.run, c.run_remain, c.run_used, m.episode, m.file_quality_id, 
                              m.file_extension_id, m.duration_minute, m.notes, p.type_price_id, p.company_id AS price_company_id, p.pricing, p.currency_id
                 FROM    GCS_CONTRACT.dbo.Contract AS c LEFT OUTER JOIN
                              GCS_CONTRACT.dbo.master AS m ON c.Id = m.ContractId LEFT OUTER JOIN
                              GCS_CONTRACT.dbo.price AS p ON p.ContractId = c.Id
                 WHERE (c.IsDelete = 0)) AS cl ON ct.id = cl.ContentId
WHERE (ct.is_deleted = 0)
GO
/****** Object:  Table [dbo].[ct_content_history]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ct_content_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_by] [varchar](100) NOT NULL,
	[action] [varchar](50) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NULL,
	[create_time] [datetime] NOT NULL,
	[content_id] [varchar](100) NULL,
 CONSTRAINT [PK_ct_content_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[UserActivityContent]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserActivityContent]
AS
SELECT        id, create_by, action, data_old, data, create_time, content_id, company
FROM            (SELECT        h.id, h.create_by, h.action, h.data_old, h.data, h.create_time, h.content_id, MONTH(h.create_time) AS Thang, YEAR(h.create_time) AS Nam, c.name AS company
                          FROM            dbo.ct_content_history AS h LEFT OUTER JOIN
                                                    GCS_USERS.dbo.auth_user AS u ON u.username = h.create_by LEFT OUTER JOIN
                                                    GCS_CATEGORY.dbo.cate_company AS c ON c.id = u.cate_company_id) AS c_1
WHERE        (Nam = 2022) AND (Thang = 10)
GO
/****** Object:  View [dbo].[v_content_mdm]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_content_mdm]
AS
	SELECT C.Code as Content_Code, RTrim(LTrim(C.Name)) as Content_Name, RTrim(LTrim(C.original_name)) as Content_Original_Name, 
	RTrim(LTrim(C.other_name)) as Content_Other_Name,RTrim(LTrim(t.name)) as Content_Type,dbo.ConvertContentCategory(C.content_category_id) as Content_Category,RTrim(LTrim(S.name)) as Content_Audience,S.name as Content_Age,
	C.season as Content_Season, C.ranking_id as Content_Ranking, C.rating_averager as Content_Rating, RTrim(LTrim(R.name)) as Content_Source,
	RTrim(LTrim(R.name)) as Content_Script, C.year as Content_MFGYear,[dbo].[ConvertNation](C.nation_id) as Content_National,
	dbo.ConvertManufacturer(C.manufacturer_id) as Content_Manufacture, dbo.ConvertDirector(C.director_id) as Content_Director,
	dbo.ConvertActor(C.actor_id) as Content_Cast, C.description,[dbo].[ConvertContentLanguage](C.language_id) as Content_Language,
	isnull(C.is_liquit,0) as Content_Liquit

	FROM [GCS_CONTENT].[dbo].[ct_content_consolidate] C left join [GCS_CATEGORY].dbo.cate_content_type T ON C.content_type_id=T.id
	left join [GCS_CATEGORY].dbo.cate_sex S ON C.sex_id=S.id
	left join [GCS_CATEGORY].dbo.cate_content_source R ON C.content_source_id=R.id
	left join [GCS_CATEGORY].dbo.cate_script P ON C.script_id=P.id
	WHERE C.is_deleted=0


GO
/****** Object:  Table [dbo].[ct_content_tool_permission]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ct_content_tool_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content_id] [varchar](100) NOT NULL,
	[is_create] [bit] NOT NULL,
	[is_view] [bit] NOT NULL,
	[is_update] [bit] NOT NULL,
	[is_delete] [bit] NOT NULL,
	[is_upload] [bit] NOT NULL,
	[is_download] [bit] NOT NULL,
	[user_name] [nvarchar](100) NOT NULL,
	[company_id] [int] NULL,
 CONSTRAINT [PK_ct_content_tool_permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_permission_tool_content]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_permission_tool_content]
AS
SELECT p.id, p.content_id, us.username, us.display_name, c.name AS content_name, p.is_create, p.is_view, p.is_update, p.is_delete, p.is_upload, p.is_download, p.company_id
FROM   dbo.ct_content_tool_permission AS p LEFT OUTER JOIN
             dbo.ct_content AS c ON c.id = p.content_id LEFT OUTER JOIN
             GCS_USERS.dbo.auth_user AS us ON us.username = p.user_name
GO
/****** Object:  View [dbo].[auth_user_group_view]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  View [dbo].[v_broadcast_method]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_broadcast_method]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_broadcast_method
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_acquisitions_status]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_acquisitions_status]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_acquisitions_status
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_age]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_age]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_age
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_content_source]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_content_source]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_content_source
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_contract_status]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_contract_status]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_contract_status
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_contract_type]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_contract_type]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_gcm_contract_type
GO
/****** Object:  View [dbo].[v_cate_delivery_license]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_delivery_license]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_delivery_license
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_file_extension]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_file_extension]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_file_extension
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_file_quality]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_file_quality]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_file_quality
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_language]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_language]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_gcm_language
GO
/****** Object:  View [dbo].[v_cate_license_type]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_license_type]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_license_type
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_old_supplier]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_old_supplier]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_supplier
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_order_status]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_order_status]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_order_status
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_script]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_script]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_script
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_sex]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_sex]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_sex
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_tax]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_tax]
AS
SELECT id, code AS name
FROM   GCS_CATEGORY.dbo.cate_tax
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_cate_vendor]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_cate_vendor]
AS
SELECT id, name, is_supplier, is_post_corp, is_manufature
FROM   GCS_CATEGORY.dbo.cate_vendor
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_channel]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_channel]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_channel
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_company]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_company]
AS
SELECT id, code, name
FROM   GCS_CATEGORY.dbo.cate_company
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_content_basic]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_basic]
AS
SELECT c.id, c.code, c.name, dbo.ConvertNation(s.nation_id) AS nation
FROM     dbo.ct_content AS c INNER JOIN
                  GCS_CONTENT_SOURCE.dbo.content_source AS s ON s.content_id = c.id
WHERE  (c.is_deleted = 0)
GO
/****** Object:  View [dbo].[v_content_broadcast_by_channel]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_broadcast_by_channel]
AS
SELECT        c.id, c.content_id, c.channel_id, ch.name AS channel_name, c.replay, c.bc_from, c.bc_to, c.timelot, c.run_channel, c.create_by, c.create_time, c.update_by, c.update_time, t.id AS channel_type_id
FROM            dbo.ct_content_bc AS c INNER JOIN
                         GCS_CATEGORY.dbo.cate_channel AS ch ON c.channel_id = ch.id INNER JOIN
                         GCS_CATEGORY.dbo.cate_channel_type AS t ON ch.id_cate_channel_type = t.id
GO
/****** Object:  View [dbo].[v_content_category]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_category]
AS
SELECT id, content_type_id, name, description, name_en
FROM   GCS_CATEGORY.dbo.cate_content_category
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_content_export]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_export]
AS
SELECT c.id, c.create_time, c.create_by, c.code, c.name, c.original_name, c.is_deleted, c.other_name, t.name AS content_type_id, dbo.ConvertContentCategory(c.content_category_id) AS content_category_id, c.season, 
                  dbo.ConvertSpectator(c.spectator_id) AS spectator_id, ct_sex.name AS sex_id, c.ranking_id, c.rating_averager, ct_s.name AS content_source_id, ct_scr.name AS script_id, s.year, dbo.ConvertNation(s.nation_id) AS nation_id, 
                  dbo.ConvertManufacturer(s.manufacturer_id) AS manufacturer_id, dbo.ConvertDirector(c.director_id) AS director_id, dbo.ConvertActor(c.actor_id) AS actor_id, ct_fqlt.name AS file_quality_id, c.is_liquit, c.description, c.notes, c.is_planning, 
                  dbo.ConvertOpco(c.opco_order_id) AS opco_order_id, ct_or.name AS order_status_id, ct_acq.name AS acquisition_status_id, c.pic, dbo.ConvertManufacturer(s.supplier_id) AS supplier_id, dbo.ConvertOwner(s.owner_id) AS owner_id, 
                  ct_pop.name AS post_corp_id, c.deadline_warehouse_input, l.ip_ownership AS l_ip_ownership, l.acquisition_date, ct_lst.name AS license_type_id, l.run, dbo.ConvertGeography(l.geography_id) AS geography_id, m.episode AS m_episode, 
                  ct_fqlt2.name AS m_file_quality_id, ct_fex.name AS m_file_extension_id, m.duration_minute AS m_duration_minute, m.notes AS m_notes
FROM     dbo.ct_content AS c LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_content_type AS t ON t.id = c.content_type_id LEFT OUTER JOIN
                  GCS_CONTENT_SOURCE.dbo.content_source AS s ON s.content_id = c.id LEFT OUTER JOIN
                  GCS_CONTENT_LICENSE.dbo.content_license AS l ON l.content_id = c.id LEFT OUTER JOIN
                  GCS_CONTENT_MASTER.dbo.ct_master AS m ON m.content_id = c.id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_content_source AS ct_s ON ct_s.id = c.content_source_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_script AS ct_scr ON ct_scr.id = c.script_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_company AS ct_com ON ct_com.id = c.company_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_acquisitions_status AS ct_acq ON ct_acq.id = c.acquisition_status_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_order_status AS ct_or ON ct_or.id = c.order_status_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_file_quality AS ct_fqlt ON ct_fqlt.id = c.file_quality_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_sex AS ct_sex ON ct_sex.id = c.sex_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_post_corp AS ct_pop ON ct_pop.id = s.post_corp_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_license_type AS ct_lst ON ct_lst.id = l.license_type_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_file_extension AS ct_fex ON ct_fex.id = m.file_extension_id LEFT OUTER JOIN
                  GCS_CATEGORY.dbo.cate_file_quality AS ct_fqlt2 ON ct_fqlt2.id = m.file_quality_id
GO
/****** Object:  View [dbo].[v_content_infor_and_show]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_infor_and_show]
AS
SELECT        c.id, c.content_type_id, c.content_source_id, c.content_category_id, c.name, c.original_name, c.other_name, c.script_id, c.director_id, c.actor_id, c.ranking_id, c.spectator_id, c.pl_prama_id, c.company_id, c.score, 
                         c.rating_averager, c.code, c.new_product, c.notes, c.description, c.ip_ownership, c.production_date, c.is_planning, c.other_information, c.is_deleted, c.ftp_id, c.ftp_path, c.deal_tracking_id, c.pic, c.acquisition_status_id, 
                         c.order_status_id, c.opco_order_id, c.deadline_warehouse_input, c.vip, c.file_quality_id, c.ref_content_id_from_vieon, c.oversea, c.create_by, c.create_time, c.update_by, c.update_time, c.material_plan_date, c.sex_id, 
                         c.season, t.is_show, c.is_liquit
FROM            dbo.ct_content AS c INNER JOIN
                         GCS_CATEGORY.dbo.cate_content_type AS t ON t.id = c.content_type_id
GO
/****** Object:  View [dbo].[v_content_license]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_license]
AS
SELECT        id, content_id, run, run_used
FROM            GCS_CONTENT_LICENSE.dbo.content_license
GO
/****** Object:  View [dbo].[v_content_license_detail]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_license_detail]
AS
SELECT ld.id, de.name AS id_delivery_license, ld.is_free, ld.exclusive_end_date, ld.exclusive_start_date, ld.non_exclusive_end_date, ld.non_exclusive_start_date, dbo.ConvertChannel(ld.channel_rights) AS channel_rights, ld.run, ld.notes, l.content_id
FROM   GCS_CONTENT_LICENSE.dbo.license_detail AS ld INNER JOIN
             GCS_CONTENT_LICENSE.dbo.content_license AS l ON ld.id_content_license = l.id INNER JOIN
             GCS_CATEGORY.dbo.cate_delivery_license AS de ON de.id = ld.id_delivery_license
WHERE (ld.is_active = 1)
GO
/****** Object:  View [dbo].[v_content_master_id]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_master_id]
AS
SELECT c.id, c.code, m.id AS master_id
FROM   dbo.ct_content AS c INNER JOIN
             GCS_CONTENT_MASTER.dbo.ct_master AS m ON c.id = m.content_id
GO
/****** Object:  View [dbo].[v_content_master_slave]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_master_slave]
AS
SELECT ct.id, ct.content_id, ct.name, ex.name AS file_extension_id, form.name AS formality_id, ct.duration_minute, ct.notes
FROM   GCS_CONTENT_MASTER.dbo.ct_master_slave AS ct INNER JOIN
             GCS_CATEGORY.dbo.cate_file_extension AS ex ON ex.id = ct.file_extension_id INNER JOIN
             GCS_CATEGORY.dbo.cate_formality AS form ON form.id = ct.formality_id
GO
/****** Object:  View [dbo].[v_content_old_actor]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_old_actor]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_actor
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_content_old_director]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_old_director]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_director
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_content_post]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_post]
AS
SELECT p.id, p.content_id, pt.name AS post_type_id, pc.name AS post_corp_id, p.notes, p.total, fq.name AS file_quality_id, p.duration_minute, fe.name AS file_extension_id
FROM   GCS_CONTENT_POST.dbo.ct_post AS p INNER JOIN
             GCS_CATEGORY.dbo.cate_post_type AS pt ON pt.id = p.post_type_id INNER JOIN
             GCS_CATEGORY.dbo.cate_post_corp AS pc ON pc.id = p.post_corp_id INNER JOIN
             GCS_CATEGORY.dbo.cate_file_quality AS fq ON fq.id = p.file_quality_id INNER JOIN
             GCS_CATEGORY.dbo.cate_file_extension AS fe ON fe.id = p.file_extension_id
GO
/****** Object:  View [dbo].[v_content_post_id]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_post_id]
AS
SELECT c.id, c.code, p.id AS post_id, pt.name
FROM   dbo.ct_content AS c INNER JOIN
             GCS_CONTENT_POST.dbo.ct_post AS p ON c.id = p.content_id INNER JOIN
             GCS_CATEGORY.dbo.cate_post_type AS pt ON pt.id = p.post_type_id
GO
/****** Object:  View [dbo].[v_content_post_master]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_post_master]
AS
SELECT content_id, id, 'MASTER' AS type, episode AS number_eps,duration_minute
FROM     GCS_CONTENT_MASTER.dbo.ct_master
UNION
(SELECT p.content_id, p.id, pt.name AS type, total AS number_eps,duration_minute
 FROM      GCS_CONTENT_POST.dbo.ct_post p INNER JOIN
                   GCS_CATEGORY.dbo.cate_post_type AS pt ON pt.id = p.post_type_id
 WHERE   p.is_active = 1)

GO
/****** Object:  View [dbo].[v_content_post_slave]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_post_slave]
AS
SELECT p.content_id, p_s.id, p_s.name, pt.name AS post_type_id, fq.name AS file_quality_id, fe.name AS file_extension_id, form.name AS formality_id, p_s.duration_minute, p_s.notes
FROM   GCS_CONTENT_POST.dbo.ct_post_slave AS p_s INNER JOIN
             GCS_CONTENT_POST.dbo.ct_post AS p ON p_s.post_id = p.id INNER JOIN
             GCS_CATEGORY.dbo.cate_post_type AS pt ON pt.id = p.post_type_id INNER JOIN
             GCS_CATEGORY.dbo.cate_formality AS form ON form.id = p_s.formality_id INNER JOIN
             GCS_CATEGORY.dbo.cate_file_quality AS fq ON fq.id = p_s.file_quality_id INNER JOIN
             GCS_CATEGORY.dbo.cate_file_extension AS fe ON fe.id = p_s.file_extension_id
GO
/****** Object:  View [dbo].[v_content_sales]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_sales]
AS
SELECT s.id, s.content_id, de.name AS id_delivery_license, s.is_free, s.exclusive_start_date, s.exclusive_end_date, s.non_exclusive_start_date, s.non_exclusive_end_date, s.run, c.name AS channel_id, s.notes
FROM   GCS_CONTENT_SALE.dbo.content_sale AS s INNER JOIN
             GCS_CATEGORY.dbo.cate_delivery_license AS de ON de.id = s.id_delivery_license INNER JOIN
             GCS_CATEGORY.dbo.cate_channel AS c ON c.id = s.channel_id
GO
/****** Object:  View [dbo].[v_content_source]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_source]
AS
SELECT id, name
FROM   GCS_CATEGORY.dbo.cate_content_source
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_content_sum]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_sum]
AS
SELECT c.id, c.code, ct.name AS content_type, c.name, c.original_name, c.season, c.is_liquit, c.company_id, cp.name AS company_name, c.create_by, c.create_time, cs.year
FROM   dbo.ct_content AS c LEFT OUTER JOIN
             GCS_CATEGORY.dbo.cate_content_type AS ct ON ct.id = c.content_type_id AND ct.is_active = 1 LEFT OUTER JOIN
             GCS_CATEGORY.dbo.cate_company AS cp ON cp.id = c.company_id AND cp.is_active = 1 LEFT OUTER JOIN
             GCS_CONTENT_SOURCE.dbo.content_source AS cs ON cs.content_id = c.id
WHERE (c.is_deleted = 0)
GO
/****** Object:  View [dbo].[v_content_talent]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_talent]
AS
SELECT ID, Name, Description
FROM   GCS_CATEGORY.dbo.cate_talent
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_content_type]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_type]
AS
SELECT id, name, description, name_en
FROM   GCS_CATEGORY.dbo.cate_content_type
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_content_type_chart]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_content_type_chart]
AS
SELECT        t.id, t.name, COUNT(t.name) AS total
FROM            dbo.ct_content AS c INNER JOIN
                         GCS_CATEGORY.dbo.cate_content_type AS t ON t.id = c.content_source_id AND t.is_active = 1
WHERE        (c.is_deleted = 0)
GROUP BY t.id, t.name
GO
/****** Object:  View [dbo].[v_deal_chart]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_deal_chart]
AS
SELECT        d.id, d.name, COUNT(d.name) AS total
FROM            dbo.ct_content AS c INNER JOIN
                         GCS_CATEGORY.dbo.cate_deal_tracking AS d ON d.id = c.deal_tracking_id AND d.is_active = 1
WHERE        (c.is_deleted = 0)
GROUP BY d.id, d.name
GO
/****** Object:  View [dbo].[v_from_short_content]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_from_short_content]
AS
SELECT id, name, original_name, ftp_path, NULL AS material_plan_date, ftp_id, company_id
FROM   GCS_SHORT_CONTENT.dbo.ct_short_content AS st
WHERE (is_deleted = 0) AND (is_liquit = 0)
GO
/****** Object:  View [dbo].[v_from_short_content_ftp]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_from_short_content_ftp]
AS
SELECT        id, ftp_host, ftp_username, ftp_password, ftp_port, ftp_root_path
FROM            GCS_SHORT_CONTENT.dbo.storage_ftp AS f
WHERE        (is_active = 1)
GO
/****** Object:  View [dbo].[v_from_short_content_permission]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_from_short_content_permission]
AS
SELECT        id, content_id, is_view, is_view_price, is_edit, is_delete, create_master, is_view_master, is_edit_master, create_post, is_view_post, is_view_post_price, is_edit_post, is_data_upload, is_data_download, is_audio_upload, 
                         is_audio_download, is_music_upload, is_music_download, is_project_upload, is_project_download, is_final_upload, is_final_download, company_id
FROM            GCS_SHORT_CONTENT.dbo.ct_short_content_permission
GO
/****** Object:  View [dbo].[v_nation]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_nation]
AS
SELECT id, code, name
FROM   GCS_CATEGORY.dbo.cate_nation
WHERE (is_active = 1)
GO
/****** Object:  View [dbo].[v_platform_channel_general]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_platform_channel_general]
AS
SELECT pdl.id, pdl.channel_general_id, dl.name AS channel_name, pdl.platform_id, pl.name AS platform_name
FROM   GCS_CATEGORY.dbo.cate_platform_channel_general AS pdl INNER JOIN
             GCS_CATEGORY.dbo.cate_platform AS pl ON pdl.platform_id = pl.id INNER JOIN
             GCS_CATEGORY.dbo.cate_channel_general AS dl ON pdl.channel_general_id = dl.id
WHERE (pdl.is_deleted = 0)
GO
/****** Object:  View [dbo].[v_platform_delivery_license]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_platform_delivery_license]
AS
SELECT pdl.id, pdl.delivery_license_id, dl.name AS delivery_name, pdl.platform_id, pl.name AS platform_name
FROM   GCS_CATEGORY.dbo.cate_platform_delivery_license AS pdl INNER JOIN
             GCS_CATEGORY.dbo.cate_platform AS pl ON pdl.platform_id = pl.id INNER JOIN
             GCS_CATEGORY.dbo.cate_delivery_license AS dl ON pdl.delivery_license_id = dl.id
WHERE (pdl.is_deleted = 0)
GO
/****** Object:  View [dbo].[v_short_content_post]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_short_content_post]
AS
SELECT        c.id, p.id AS post_id, t.name
FROM            dbo.ct_content AS c LEFT OUTER JOIN
                         GCS_CONTENT_MASTER.dbo.ct_master AS m ON m.content_id = c.id LEFT OUTER JOIN
                         GCS_CONTENT_POST.dbo.ct_post AS p ON p.master_id = m.id LEFT OUTER JOIN
                         GCS_CATEGORY.dbo.cate_post_type AS t ON t.id = p.post_type_id
WHERE        (p.id IS NOT NULL)
GO
/****** Object:  View [dbo].[v_short_post]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_short_post]
AS
SELECT        p.id, t.name, i.id AS content_id
FROM            dbo.ct_content AS i INNER JOIN
                         GCS_CONTENT_MASTER.dbo.ct_master AS m ON i.id = m.content_id INNER JOIN
                         GCS_CONTENT_POST.dbo.ct_post AS p ON m.id = p.master_id INNER JOIN
                         GCS_CATEGORY.dbo.cate_post_type AS t ON p.post_type_id = t.id
WHERE        (i.is_deleted = 0)
GO
/****** Object:  View [dbo].[v_source_chart]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_source_chart]
AS
SELECT        s.id, s.name, COUNT(s.name) AS total
FROM            dbo.ct_content AS c INNER JOIN
                         GCS_CATEGORY.dbo.cate_content_source AS s ON s.id = c.content_source_id AND s.is_active = 1
WHERE        (c.is_deleted = 0)
GROUP BY s.id, s.name
GO
/****** Object:  Table [dbo].[cate_module]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_module](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[screen_module] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[screen_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_cate_module] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cate_permission]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[code] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_cate_permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_talent_role]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_talent_role](
	[id] [int] NOT NULL,
	[content_id] [int] NULL,
	[talent_id] [int] NULL,
	[is_deleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ct_content_consolidate_permission]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ct_content_consolidate_permission](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content_id] [nvarchar](max) NULL,
	[username] [nvarchar](50) NULL,
	[module_id] [int] NULL,
	[permission_ids] [nvarchar](50) NULL,
	[is_active] [bit] NULL,
	[create_by] [nvarchar](50) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](50) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_ct_content_consolidate_permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ct_content_permission_history]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ct_content_permission_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_by] [varchar](100) NOT NULL,
	[action] [varchar](50) NULL,
	[data_old] [nvarchar](max) NULL,
	[data] [nvarchar](max) NULL,
	[result] [bit] NULL,
	[create_time] [datetime] NOT NULL,
	[content_id] [varchar](100) NULL,
 CONSTRAINT [PK_ct_content_permission_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage_ftp]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage_ftp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[storage_tech] [int] NOT NULL,
	[ftp_host] [varchar](25) NOT NULL,
	[ftp_username] [varchar](250) NOT NULL,
	[ftp_password] [varchar](250) NOT NULL,
	[ftp_port] [int] NOT NULL,
	[ftp_root_path] [nvarchar](500) NOT NULL,
	[is_active] [bit] NOT NULL,
	[check_host] [nvarchar](250) NULL,
	[check_port] [int] NOT NULL,
	[check_api] [varchar](250) NOT NULL,
	[check_folder] [nvarchar](max) NULL,
	[create_time] [datetime] NOT NULL,
	[update_time] [datetime] NULL,
	[create_by] [nvarchar](100) NULL,
	[update_by] [nvarchar](100) NULL,
 CONSTRAINT [PK_storage_ftp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage_tech]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage_tech](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[create_time] [datetime] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_storage_tech] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 4/25/2024 4:03:19 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4/25/2024 4:03:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4/25/2024 4:03:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4/25/2024 4:03:19 PM ******/
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
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4/25/2024 4:03:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4/25/2024 4:03:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4/25/2024 4:03:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4/25/2024 4:03:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4/25/2024 4:03:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ct_content_consolidate] ADD  CONSTRAINT [DF_ct_content_consolidate_is_liquit]  DEFAULT ((0)) FOR [is_liquit]
GO
ALTER TABLE [dbo].[ct_content_permission] ADD  CONSTRAINT [DF_ct_content_permission_is_tool_view]  DEFAULT ((0)) FOR [is_tool_view]
GO
ALTER TABLE [dbo].[ct_content_permission] ADD  CONSTRAINT [DF_ct_content_permission_is_tool_create]  DEFAULT ((0)) FOR [is_tool_create]
GO
ALTER TABLE [dbo].[ct_content_permission] ADD  CONSTRAINT [DF_ct_content_permission_is_tool_update]  DEFAULT ((0)) FOR [is_tool_update]
GO
ALTER TABLE [dbo].[ct_content_permission] ADD  CONSTRAINT [DF_ct_content_permission_is_tool_delete]  DEFAULT ((0)) FOR [is_tool_delete]
GO
ALTER TABLE [dbo].[ct_content_permission] ADD  CONSTRAINT [DF_ct_content_permission_is_tool_upload]  DEFAULT ((0)) FOR [is_tool_upload]
GO
ALTER TABLE [dbo].[ct_content_permission] ADD  CONSTRAINT [DF_ct_content_permission_is_tool_download]  DEFAULT ((0)) FOR [is_tool_download]
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
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_account]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dwh_getdata_account] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	
	select B.id as BP_ID,B.parent_acc_id as BP_Parent_ID,B.vendor_code as BP_Code,B.name as BP_Name, B.full_name as BP_Full_Name, B.short_name as BP_Short_Name, B.en_name as BP_EN_Name,B.email as Email,B.tax_code as BP_TaxCode,
	B.address as BP_Address, isnull(B.country_id,-1) as BP_Country_ID, B.is_active, B.is_internal,B.is_customer,B.is_manufature,B.is_post_corp,B.is_supplier,
	B.city_id as BP_Province_ID, B.district_id as BP_District_ID, B.ward_id as BP_Ward_ID, B.birthday as BP_BirthDay, B.per_identity as BP_Identity, B.per_passport as BP_Passport, B.source as BP_Source, B.ticket_symbol as BP_Ticket_Symbol,
	B.company_id as BP_Company_ID, cast(N'N/A' as nvarchar(500)) as BP_Type, B.is_deleted , B.website,
	B.create_by as BP_Create_By_ID, cast(B.create_time as datetime) as BP_Create_Date, B.update_by as BP_Modified_By_ID, cast(B.update_time as datetime) as BP_Modified_Date, B.Company_code as Company_Code
	from GCS_CATEGORY.dbo.cate_vendor B 
	where  1=1 
	and (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
END




GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_brand]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_brand] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Brand_ID, B.Name as Brand_Name, B.is_active, B.description as Brand_Description
			from GCS_CATEGORY.dbo.cate_brand B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_broadcast_method]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_broadcast_method] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	

			select B.ID as Broadcast_Method_ID, B.Name as Broadcast_Method_Name, B.is_active, B.description as Broadcast_Method_Description
			from GCS_CATEGORY.dbo.cate_broadcast_method B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_channel_info]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_channel_info] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	select B.ID as Channel_ID,B.code as Channel_Code,B.Name as Channel_Name, B.is_active, B.description as Channel_Description,	B.plat_form_id as Channel_Platform, B.is_viechannel as Is_VieChannel,B.is_deleted	
	from GCS_CATEGORY.dbo.cate_channel_general B
	where 1=1
	and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_channel_type]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_channel_type] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	

			select B.ID as Channel_Type_ID, B.Name as Channel_Type_Name, B.is_active, B.description as Channel_Type_Description, B.is_deleted
			from GCS_CATEGORY.dbo.cate_channel_type B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_company]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_company] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Company_ID,B.code as Company_Code ,B.code as Company_Consolidate_Code,B.Name as Short_Name,B.fullname as Full_Name, B.taxcode as TaxCode,B.is_active,B.is_deleted, B.is_internal,
			cast(B.create_time as datetime) as Create_Date, B.create_by as Create_By_ID, cast(B.update_time as datetime) as Modified_Date, B.update_by as Modified_By_ID
			from GCS_CATEGORY.dbo.cate_company B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute [dbo].[sp_dwh_getdata_content]  'STG_GROUP_GCT_ACCOUNT',190001
CREATE PROCEDURE [dbo].[sp_dwh_getdata_content] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	DECLARE @SQL_QUERY NVARCHAR(MAX)
--I: DIMENSION
-- DB NAME: GCS_USER
	IF @TABLE_NAME='STG_GROUP_GCT_USERACCOUNT'
		BEGIN
			
			select U.username as UserAccount_Name,U.display_name as UserAccount_Display_Name,
			U.first_name as UserAccount_First_Name,U.last_name as UserAccount_Last_Name,
			U.company  as UserAccount_Company_Name,U.department as  UserAccount_Department_Name,
			U.occupation as Job_Title,U.email as UserAccount_Email,U.mobile as UserAccount_Mobile,
			U.cate_company_id as UserAccount_Company, U.is_ad_active as Is_ActiveDirectory
			from GCS_USERS.dbo.auth_user U
			
		END
-- DB NAME: GCS_CATEGORY
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_ACCOUNT'
		BEGIN

			/*select B.id as BP_ID,B.parent_acc_id as BP_Parent_ID,B.vendor_code as BP_Code,B.name as BP_Name, B.full_name as BP_Full_Name, B.short_name as BP_Short_Name, B.en_name as BP_EN_Name,B.email as Email,B.tax_code as BP_TaxCode,
			B.address as BP_Address, isnull(B.nation,-1) as BP_Country_ID, B.is_active, B.is_internal,B.is_customer,B.is_manufature,B.is_post_corp,B.is_supplier
			from GCS_CATEGORY.dbo.cate_vendor B
			where  1=1 
			and (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR*/
			SET @SQL_QUERY='EXECUTE  [GCS_CONTENT].dbo.[sp_dwh_getdata_account] ''' + @TABLE_NAME+''','+ CAST(@MONTH_YEAR  AS NVARCHAR(10))
			SELECT @SQL_QUERY as SQL_QUERY

		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CUSTOMER'
		BEGIN

			select B.id as Customer_ID,B.vendor_code as Customer_Code, B.name as Customer_Name, B.full_name as Customer_Full_Name, B.short_name as Customer_Short_Name, B.tax_code as Customer_TaxCode,
			B.address as Customer_Address, isnull(B.nation,-1) as Customer_Country_ID, B.is_active, B.is_internal
			from GCS_CATEGORY.dbo.cate_vendor B
		    where 1=1
			and is_customer=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_VENDOR'
		BEGIN

			select B.id as Vendor_ID,B.vendor_code as Vendor_Code, B.name as Vendor_Name, B.full_name as Vendor_Full_Name, B.short_name as Vendor_Short_Name, B.tax_code as Vendor_TaxCode,
			B.address as Vendor_Address, isnull(B.nation,-1) as Vendor_Country_ID, B.is_active, B.is_internal
			from GCS_CATEGORY.dbo.cate_vendor B
		    where 1=1
			and is_supplier=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_MANUFACTURER'
		BEGIN

			select B.id as Manufacturer_ID,B.vendor_code as Manufacturer_Code, B.name as Manufacturer_Name, B.full_name as Manufacturer_Full_Name, B.short_name as Manufacturer_Short_Name, B.tax_code as Manufacturer_TaxCode,
			B.address as Manufacturer_Address, isnull(B.nation,-1) as Manufacturer_Country_ID, B.is_active, B.is_internal
			from GCS_CATEGORY.dbo.cate_vendor B
		    where 1=1
			and is_manufature=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_POST_PRODUCTION'
		BEGIN

			select B.id as Post_Production_ID,B.vendor_code as Post_Production_Code, B.name as Post_Production_Name, B.full_name as Post_Production_Full_Name, B.short_name as Post_Production_Short_Name, B.tax_code as Post_Production_TaxCode,
			B.address as Post_Production_Address, isnull(B.nation,-1) as Post_Production_Country_ID, B.is_active, B.is_internal
			from GCS_CATEGORY.dbo.cate_vendor B
		    where 1=1
			and is_post_corp=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_TALENT'
		BEGIN

			select B.ID as Talent_ID, B.Talent_code, B.Name as Talent_Name, B.Gender  as Talent_Gender_ID, B.Description as Talent_Description, B.birthday as Talent_BirthDay, B.nation_id as Talent_Country_ID, B.is_active
			from GCS_CATEGORY.dbo.cate_talent B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_TARGET_AUDIENCE_AGE'
		BEGIN

			select B.ID as Target_Audience_ID, B.Name as Target_Audience_Name, B.Description as Target_Audience_Description, B.is_active
			from GCS_CATEGORY.dbo.cate_age B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CONTENT_CATEGORY'
		BEGIN

			select B.ID as Content_Category_ID, B.Name as Content_Category_Name, B.is_active
			from GCS_CATEGORY.dbo.cate_content_type B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CONTENT_GENRE'
		BEGIN

			select B.ID as Content_Genre_ID, B.Name as Content_Genre_Name,B.description as Content_Genre_Description, B.is_active, B.content_type_id as Content_Category_ID
			from GCS_CATEGORY.dbo.cate_content_category B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CONTENT_GENDER'
		BEGIN

			select B.ID as Content_Gender_ID, B.Name as Content_Gender_Name, B.is_active
			from GCS_CATEGORY.dbo.cate_sex B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_SCRIPT_SOURCE'
		BEGIN

			select B.ID as Script_Source_ID, B.Name as Script_Source_Name, B.is_active
			from GCS_CATEGORY.dbo.cate_script B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CHANNEL_TYPE'
		BEGIN

			select B.ID as Channel_Type_ID, B.Name as Channel_Type_Name, B.is_active
			from GCS_CATEGORY.dbo.cate_channel_type B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_PLATFORM'
		BEGIN

			select B.ID as Platform_ID, B.Name as Platform_Name, B.is_active--, B.link as Platform_Link, B.is_social, B.description as Platform_Description
			from GCS_CATEGORY.dbo.cate_platform B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CHANNEL'
		BEGIN

			select B.ID as Channel_ID, B.Name as Channel_Name, B.is_active, B.description as Channel_Description,B.id_cate_channel_type as Channel_Type_ID,	B.id_cate_platform as Channel_Platform
			from GCS_CATEGORY.dbo.cate_channel B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_BRAND'
		BEGIN

			select B.ID as Brand_ID, B.Name as Brand_Name, B.is_active, B.description as Brand_Description
			from GCS_CATEGORY.dbo.cate_brand B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_DELIVERY_LICENSE'
		BEGIN

			select B.ID as Delivery_License_ID, B.Name as Delivery_License_Name,B.Type as Delivery_License_Type, B.is_active
			from GCS_CATEGORY.dbo.cate_delivery_license B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
-- DB NAME: GCS_CONTENT
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CONTENT'
		BEGIN

			select B.ID as Content_ID,B.code as Content_Code,B.reference_code as Content_Ref_Code,
			B.Name as Content_Name,B.original_name as Content_English_Name, B.other_name as Content_Other_Name,
			B.content_type_id, B.content_category_id,B.season,B.sex_id as Content_Gender_ID, GCS_CONTENT.dbo.ConvertSpectator(B.spectator_id) as Target_Audience_Age_List,
			B.ranking_id as Content_Ranking,B.rating_averager as Content_Rating,B.content_source_id as Content_Source_ID, B.script_id as Script_Source_ID,
			B.year as Release_Year, B.import_year as Import_Year, GCS_CONTENT.dbo.ConvertNation(B.nation_id) as Country_List,GCS_CONTENT.dbo.ConvertVendor(B.manufacturer_id) as Manufacturer_List,
			GCS_CONTENT.dbo.ConvertTalent(B.director_id) as Director_List,GCS_CONTENT.dbo.ConvertTalent(B.actor_id) as Cast_List,GCS_CONTENT.dbo.ConvertContentLanguage(B.language_id) as Language_List,
			B.company_id as Purchase_Company_ID,B.Is_liquit,B.description as Content_Description,B.create_by,B.update_by,B.create_time as Create_Date, B.update_time as Modified_Date,B.is_deleted,
			(case when B.is_deleted=1 then B.update_time end) as Delete_Date
			from GCS_CONTENT.dbo.ct_content_consolidate B
		    where 1=1
			and is_deleted <>1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
-- DB NAME: GCS_CONTRACT
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CONTENT_CONTRACT'
		BEGIN
		
			select B.ID as Content_Contract_ID,B.code as Content_Contract_Code,B.code as Content_Contract_Consol_Code,
			C.name as Content_Contract_Name,B.ContentId as Content_ID, B.OwnerId as Customer_ID,B.SupplierId as Vendor_ID,
			T.name as Contract_Type,(Case when B.ContractCategory=0 then 'Buy' else 'Sell' end) as Contract_Category,B.AcquisitionDate as Acquisition_Date, 
			A.name as Acquisition_Status, B.IsNew as Is_New_Contract, B.IsTransfer as Is_Transfer_Contract, X.code as Tax_Name, X.value as Tax_Percent,
			S.name as Contract_Status, B.OpcoOrderIds as Order_Company_ID, S.name as Order_Status, B.Pic as Pic_ID, B.create_time as Create_Date,
			B.update_time as Update_Date, B.create_by as Create_By_ID, B.update_by as Modified_By_ID, 0 as Is_Annex, B.IsTemp as Is_Temp, 'NA'  as Price_Classify, 0 as Is_Active
			
			from GCS_CONTRACT.dbo.Contract B inner join GCS_CONTENT.dbo.ct_content_consolidate C on B.ContentId=C.id
			left join GCS_CATEGORY.dbo.cate_gcm_contract_type T on B.ContractType=T.id
			left join GCS_CATEGORY.dbo.cate_acquisitions_status A on B.AcquisitionStatusId=A.id
			left join GCS_CATEGORY.dbo.cate_tax X on B.Tax=X.id
			left join GCS_CATEGORY.dbo.cate_contract_status S on B.ContractStatus=S.id
			left join GCS_CATEGORY.dbo.cate_order_status O on B.OrderStatusId=S.id
		    where 1=1
			and is_deleted <>1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CONTENT_ANNEX'
		BEGIN
		
			select N.ID as Content_Annex_ID,N.AnnexNo as Content_Annex_Code,B.code as Content_Contract_Consol_Code,N.ContractId as Parent_Contract_ID,
			C.name as Content_Contract_Name,B.ContentId as Content_ID, B.OwnerId as Customer_ID,B.SupplierId as Vendor_ID,
			T.name as Contract_Type,(Case when B.ContractCategory=0 then 'Buy' else 'Sell' end) as Contract_Category,B.AcquisitionDate as Acquisition_Date, 
			A.name as Acquisition_Status, B.IsNew as Is_New_Contract, B.IsTransfer as Is_Transfer_Contract, X.code as Tax_Name, X.value as Tax_Percent,
			S.name as Contract_Status, B.OpcoOrderIds as Order_Company_ID, S.name as Order_Status, B.Pic as Pic_ID, N.create_time as Create_Date,
			N.update_time as Update_Date, N.create_by as Create_By_ID, N.update_by as Modified_By_ID, 1 as Is_Annex,N.IsTemp as Is_Temp, N.PriceClassify as Price_Classify, N.is_active as Is_Active
			
			from GCS_CONTRACT.dbo.annex N inner join   GCS_CONTRACT.dbo.Contract B on N.ContractId=B.Id
			inner join GCS_CONTENT.dbo.ct_content_consolidate C on B.ContentId=C.id
			left join GCS_CATEGORY.dbo.cate_gcm_contract_type T on B.ContractType=T.id
			left join GCS_CATEGORY.dbo.cate_acquisitions_status A on B.AcquisitionStatusId=A.id
			left join GCS_CATEGORY.dbo.cate_tax X on B.Tax=X.id
			left join GCS_CATEGORY.dbo.cate_contract_status S on B.ContractStatus=S.id
			left join GCS_CATEGORY.dbo.cate_order_status O on B.OrderStatusId=S.id
		    where 1=1
			and is_deleted <>1
			and  (year(isnull(N.update_time,isnull(N.create_time,getdate()))) *100+ month(isnull(N.update_time,isnull(N.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CONTENT_FILE'
		BEGIN -- File theo Contract khong theo Annex
		    -- Master File
			select B.ID as Content_File_ID,B.ID as Content_File_Code,C.Code as Contract_Code,C.Code as Parent_Contract_Code, CONCAT('M','-',CT.Name) as Content_File_Name,
			0 as Is_Annex, 0 as Content_File_Type,B.episode as Episode_Quantity, B.duration_minute as Episode_Duration, isnull(E.name,'NA') as Extension_File, ISNULL(Q.name,'NA') as Resolution_File,
			'NA' as Content_Format, B.id as Parent_File_ID, 'NA' as Post_File_Type, -1 as Post_Production_ID, -1 as Company_ID
			
			from GCS_CONTRACT.dbo.master B inner join GCS_CONTRACT.dbo.Contract C on B.ContractId=C.ID
			inner join GCS_CONTENT.dbo.ct_content_consolidate CT on B.content_id=CT.id
			left join GCS_CATEGORY.dbo.cate_file_extension E on B.file_extension_id=E.id
			left join GCS_CATEGORY.dbo.cate_file_quality Q on B.file_quality_id=Q.id
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
			union all
			-- Master Slave File
			select B.ID as Content_File_ID,B.ID as Content_File_Code,C.Code as Contract_Code,C.Code as Parent_Contract_Code, CONCAT('S','-',CT.Name) as Content_File_Name,
			0 as Is_Annex, 1 as Content_File_Type, 1 as Episode_Quantity, B.duration_minute as Episode_Duration,isnull(E.name,'NA') as Extension_File, 'NA' as Resolution_File,
			isnull(F.name,'NA') as Content_Format, B.id as Parent_File_ID ,'NA' as Post_File_Type, -1 as Post_Production_ID, -1 as Company_ID
			from GCS_CONTRACT.dbo.master_slave B inner join GCS_CONTRACT.dbo.Contract C on B.ContractId=C.ID
			inner join GCS_CONTENT.dbo.ct_content_consolidate CT on B.content_id=CT.id
			left join GCS_CATEGORY.dbo.cate_file_extension E on B.file_extension_id=E.id
			left join GCS_CATEGORY.dbo.cate_formality F on B.formality_id=F.id
	
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			union all
			-- Post Production
		
			select B.ID as Content_File_ID,B.ID as Content_File_Code,C.Code as Contract_Code,C.Code as Parent_Contract_Code, CONCAT('P','-',CT.Name) as Content_File_Name,
			0 as Is_Annex, 1 as Content_File_Type, B.total as Episode_Quantity, B.duration_minute as Episode_Duration,isnull(E.name,'NA') as Extension_File, ISNULL(Q.name,'NA') as Resolution_File,
			'NA' as Content_Format, B.id as Parent_File_ID, isnull(PT.name,'NA') as Post_File_Type, isnull(B.post_corp_id,-1) as Post_Production_ID, isnull(B.company_id,-1) as Company_ID

			from GCS_CONTENT_POST.dbo.ct_post B inner join GCS_CONTENT.dbo.ct_content_consolidate CT on B.consolidate_content_id=CT.id
			inner join GCS_CONTRACT.dbo.master M on B.master_id=M.id
			inner join GCS_CONTRACT.dbo.Contract C on M.ContractId=C.ID
			left join GCS_CATEGORY.dbo.cate_file_extension E on B.file_extension_id=E.id
			left join GCS_CATEGORY.dbo.cate_file_quality Q on B.file_quality_id=Q.id
			left join GCS_CATEGORY.dbo.cate_post_type PT on B.post_type_id=PT.id
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR

		END
-- DB NAME: GCS_SHORT_CONTENT
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_SHORT_CONTENT'
		BEGIN
			
			select B.ID as Short_Content_ID,B.code as Short_Content_Code,B.reference_code as Short_Content_Ref_Code,B.related_content_id as Content_ID,
			B.Name as Short_Content_Name,B.original_name as Short_Content_English_Name, B.other_name as Short_Content_Other_Name,B.post_master_id as Content_File_ID,
			B.owner_id as Owner_ID, B.supplier_id as Supplier_ID,B.create_by,B.update_by,B.create_time as Create_Date, B.update_time as Modified_Date,B.is_deleted,
			(case when B.is_deleted=1 then isnull(B.update_time,B.create_time) end) as Delete_Date
		    from GCS_SHORT_CONTENT.dbo.ct_short_content B left join GCS_CATEGORY.dbo.cate_video_type V on B.video_type=V.id
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
-- DB NAME: SPM_GCS
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_PRODUCT_CATEGORY'
		BEGIN
			
			select B.ID as Product_Category_ID,B.CategoryName as Product_Category_Name,B.Description as Product_Category_Description, B.is_active
			from SPM_GCS.dbo.product_category B 
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_PRODUCT_SUB_CATEGORY'
		BEGIN
			
			select B.ID as Product_Sub_Category_ID,B.SubCategoryName as Product_Sub_Category_Name,B.Description as Product_Sub_Category_Description, B.is_active,B.ProductCategoryId as Product_Category_ID
			from SPM_GCS.dbo.product_sub_category B 
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_PRODUCT'
		BEGIN
			
			select B.ID as Product_ID,B.Name as Product_Name,U.unitname as  UnitOfMeasure, B.is_active,B.ProductCategoryId as Product_Category_ID, B.ProductSubCategoryId as Product_Sub_Category_ID
			from SPM_GCS.dbo.product B left join GCS_CATEGORY.dbo.cate_unit U on B.UnitOfMeasure=U.ID
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_SPONSOR_DEAL'
		BEGIN
			
			select B.ID as Sponsor_Deal_ID,B.Code as Sponsor_Deal_Code,B.Name  as Sponsor_Deal_Name,B.Type as Sponsor_Deal_Type, B.company_id as Company_ID, B.VendorId as Customer_ID,
			B.StartDate as From_Date, B.EndDate as End_Date,B.BrandId as Customer_Brand_ID
			
			from SPM_GCS.dbo.deal_sponsor B left join SPM_GCS.dbo.sale_process P on B.SaleProcess=P.Id
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_SALE_CAMPAIGN'
		BEGIN
			
			select CS.ID as Campaign_ID,CS.CompanyId, CS.ContentId,CS.Name as Campaign_Name,
			CS.StartDate as From_Date, CS.EndDate as End_Date,CS.is_active,
			(case CS.Status when 0 then 'Plan' when 1 then 'Sold' when 2 then 'Open' when 3 then 'Cancel' end ) as Campaign_Status
			from SPM_GCS.dbo.campaign_sale CS 
			where 1=1
			and  (year(isnull(CS.update_time,isnull(CS.create_time,getdate()))) *100+ month(isnull(CS.update_time,isnull(CS.create_time,getdate()))))>=@MONTH_YEAR
			
		END

--II FACT TABLE
	-- DB NAME: GCS_CONTRACT
	ELSE IF @TABLE_NAME='STG_GROUP_GCT_CONTENT_VALUE'
		BEGIN
			
			-- lay du lieu tu hop dong
			select B.ID as ID,B.ContentId,B.Code as Document_Code,0 as Is_Annex, T.name as Price_Type, P.currency_id as Currency_ID, P.pricing as Amount, P.company_id as Purchase_Company_ID,
			B.OwnerId as Customer_ID,B.SupplierId as Vendor_ID,B.DeadlineWarehouse as Warehouse_Deadline,GCS_CONTENT.dbo.ConvertNation(B.GeographyIds) as Teritory_List,GCS_CONTENT.dbo.ConvertBroadcastMethod(B.BroadcastMethodIds) as Broadcast_Method_List,
			B.create_by,B.update_by,B.create_time as Create_Date, B.update_time as Modified_Date,B.IsDelete,
			(case when B.IsDelete=1 then isnull(B.update_time,B.create_time) end) as Delete_Date
			from GCS_CONTRACT.dbo.Contract B left join GCS_CONTRACT.dbo.price P on B.Id=P.ContractId
			left JOIN GCS_CATEGORY.dbo.cate_type_price T on P.type_price_id=T.id
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
			-- lay du lieu tu phu luc hop dong
			union all

			select B.ID as ID,B.ContentId,A.AnnexNo as Document_Code,1 as Is_Annex, 'NA' as Price_Type, P.currency_id as Currency_ID, P.pricing as Amount, P.company_id as Purchase_Company_ID,
			B.OwnerId as Customer_ID,B.SupplierId as Vendor_ID,B.DeadlineWarehouse as Warehouse_Deadline,GCS_CONTENT.dbo.ConvertNation(B.GeographyIds) as Teritory_List,GCS_CONTENT.dbo.ConvertBroadcastMethod(B.BroadcastMethodIds) as Broadcast_Method_List,
			A.create_by,A.update_by,A.create_time as Create_Date, A.update_time as Modified_Date,B.IsDelete,
			(case when B.IsDelete=1 then isnull(B.update_time,B.create_time) end) as Delete_Date
			from GCS_CONTRACT.dbo.annex A  inner join GCS_CONTRACT.dbo.Contract B on A.ContractId=B.Id
			left join GCS_CONTRACT.dbo.annex_price P on A.ID =P.AnnexId
			
			where 1=1
			and  (year(isnull(A.update_time,isnull(A.create_time,getdate()))) *100+ month(isnull(A.update_time,isnull(A.create_time,getdate()))))>=@MONTH_YEAR
		
		

		END
	ELSE IF @TABLE_NAME='STG_GCT_CONTENT_DELIVERY_LICENSE'
		BEGIN
					
			-- license thuoc hop dong
			select  L.Id as ID, L.delivery_license_id as Delivery_License_ID, L.is_free as Is_Pay,L.exclusive_start_date as Exclusive_From_Date,
			L.exclusive_end_date as Exclusive_End_Date,L.non_exclusive_start_date as Non_Exclusive_From_Date, L.non_exclusive_end_date as Non_Exclusive_End_Date,
			L.is_active,L.run,L.is_all_channel, C.Code as Document_No, 0 as Is_Annex, (case when isnull(L.channel_rights,'')='' then -1 else H.id end)  as Channel_ID,
			L.ContractId as Contract_ID,null as Annex_ID, C.ContentId as Content_ID, M.id as Content_Master_File_ID,L.notes as Note, L.delivery_license_id as Delivery_License_ID
	
			from GCS_CONTRACT.dbo.license_detail L inner join GCS_CONTRACT.dbo.Contract C on L.ContractId=C.ID
			left join GCS_CONTRACT.dbo.master M on C.Id=M.ContractId and C.ContentId=M.content_id
			left join GCS_CATEGORY.dbo.cate_channel H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',L.channel_rights,';')) <>0 
			where 1=1
			and  (year(isnull(L.update_time,isnull(L.create_time,getdate()))) *100+ month(isnull(L.update_time,isnull(L.create_time,getdate()))))>= @MONTH_YEAR

			union all
			--License thuoc phu luc hop dong
			select  L.Id as ID, L.delivery_license_id as Delivery_License_ID, L.is_free as Is_Pay,L.exclusive_start_date as Exclusive_From_Date,
			L.exclusive_end_date as Exclusive_End_Date,L.non_exclusive_start_date as Non_Exclusive_From_Date, L.non_exclusive_end_date as Non_Exclusive_End_Date,
			L.is_active,L.run,L.is_all_channel, N.AnnexNo as Document_No, 1 as Is_Annex, (case when isnull(L.channel_rights,'')='' then -1 else H.id end)  as Channel_ID,
			N.ContractId as Contract_ID,N.Id as Annex_ID,C.ContentId as Content_ID, M.id as Content_Master_File_ID,L.notes as Note, L.delivery_license_id as Delivery_License_ID

			from GCS_CONTRACt.dbo.annex_license_detail L inner join GCS_CONTRACT.dbo.annex N on L.AnnexId=N.ID
			inner join GCS_CONTRACT.dbo.Contract C on N.ContractId=C.Id
			left join GCS_CONTRACT.dbo.master M on C.Id=M.ContractId and C.ContentId=M.content_id
			left join GCS_CATEGORY.dbo.cate_channel H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',L.channel_rights,';')) <>0 
			where 1=1
			and  (year(isnull(L.update_time,isnull(L.create_time,getdate()))) *100+ month(isnull(L.update_time,isnull(L.create_time,getdate()))))>= @MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GCT_CONTENT_TERITORY_LICENSE'
		BEGIN
			-- Hien tai App chi quan ly lanh tho theo hop dong
			select B.Id,B.ID as Content_Contract_ID,B.code as Document_No,B.ContentId as Content_ID, M.id as Content_Master_File_ID, 0 as Is_Annex,
			(case when isnull(B.GeographyIds,'')='' then -1 else H.id end)  as Country_ID

			
			from GCS_CONTRACT.dbo.Contract B left join GCS_CONTRACT.dbo.master M on B.Id=M.ContractId and B.ContentId=M.content_id
			left join GCS_CATEGORY.dbo.cate_nation H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.GeographyIds,';')) <>0 
			where 1=1
			and B.IsDelete<>0
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GCT_CONTENT_CONTENT_OBJECT'
		BEGIN
			-- Origin_Country_ID
			select B.id as Content_ID,H.id as Origin_Country_ID, null as Manufacture_ID, null as Director_ID, null as Cast_ID, null as Content_Genre_ID,
			 null as  Target_Audience_Age, 1 as Object_Opt
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_nation H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.nation_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR

			union all
			-- Manufacture
			select B.id as Content_ID,null as Origin_Country_ID, H.id as Manufacture_ID, null as Director_ID, null as Cast_ID, null as Content_Genre_ID, 
			null as  Target_Audience_Age, 2 as Object_Opt
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_vendor H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.manufacturer_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR
			union all
			-- Director
			select B.id as Content_ID,null as Origin_Country_ID, null as Manufacture_ID, H.id as Director_ID, null as Cast_ID, null as Content_Genre_ID, 
			null as  Target_Audience_Age, 3 as Object_Opt
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_talent H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.director_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR
			union all
			--Cast
			select B.id as Content_ID,null as Origin_Country_ID, null as Manufacture_ID, null as Director_ID, H.id as Cast_ID, null as Content_Genre_ID, 
			null as  Target_Audience_Age, 4 as Object_Opt
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_talent H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.actor_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR
			union all
			--Content_Genre
			select B.id as Content_ID,null as Origin_Country_ID, null as Manufacture_ID, null as Director_ID, null as Cast_ID, H.id as Content_Genre_ID, 
			null as  Target_Audience_Age, 5 as Object_Opt
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_content_category H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.content_category_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR

			union all

			--Target_Audience
			select B.id as Content_ID,null as Origin_Country_ID, null as Manufacture_ID, null as Director_ID, null as Cast_ID, null as Content_Genre_ID, 
			H.id as  Target_Audience_Age, 6 as Object_Opt
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_age H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.spectator_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR
		END
    -- DB NAME: SCM_GCS
	ELSE IF @TABLE_NAME='STG_GCT_SHORT_CONTENT_PERFORMANCE'
		BEGIN

			select D.Id , B.id as Short_Content_ID,A.VideoID as Video_ID, A.VideoTitle as Video_Title_Name, A.PlatformId as Platform_ID,
			A.ChannelID as Channel_ID,D.NationId as Country_ID, D.[Day] as Broadcast_Date, D.OwnedView as Owner_View, D.PartnerAuction as Partner_Auction,
			D.PartnerReserved as Partner_Reserved, D.PartnerRevenue as Partner_Revenue, D.PartnerRevenuePartnerSoldPartner as PartnerRevenuePartnerSoldPartner,
			D.PartnerRevenuePartnerSoldYoutube as PartnerRevenuePartnerSoldYouTube, D.RevenueSplit as Revenue_Split, D.SplitAuction as Split_Aution,
			D.SplitPartnerSoldPartner as SplitPartnerSoldPartner, D.SplitPartnerSoldYoutube ,D.SplitReserved as Split_Reserved,
			P.AverageViewDuration, P.Impressions,P.ImpressionsClickRate,P.[Views],P.WatchTime, (case when P.ID is not null then 1 else 0 end) as Is_Performan_Data
			from GCS_SHORT_CONTENT.dbo.ct_short_content B inner join SCM_GCS.dbo.airing_social A on B.id=A.ShortContentId
			inner join SCM_GCS.dbo.detail_airing_social D on A.Id=D.AiringSocialId
    		left join SCM_GCS.dbo.detail_performance_airing_social P on D.AiringSocialId=P.AiringSocialId and datediff(dd, D.[Day],isnull(P.[Day],D.[Day]))=0
			where 1=1
			and  (year(isnull(D.update_time,isnull(D.create_time,getdate()))) *100+ month(isnull(D.update_time,isnull(D.create_time,getdate()))))>= @MONTH_YEAR
			
		END

	-- DB NAME: PMS_GCS
	ELSE IF @TABLE_NAME='STG_GCT_SHORT_CONTENT_AIRING_PLAN'
		BEGIN

			
			Select A.Id, A.ContentId as Content_ID, A.ChannelId as Channel_ID, A.PlatformId as Platform_ID, A.IsMon as Is_Mon, A.IsTue as Is_Tue,A.IsWed as Is_Wed,
			A.IsThu as Is_Thur, A.IsFri as Is_Fri, A.IsSat as Is_Sat, A.IsSun as Is_Sun, A.StartDate as From_Date, A.EndDate as To_Date,A.StartTime as TimeBand_From,
			A.EndTime as TimeBand_To,	A.EpisodeInDay as EPS_Quantity_By_Day, A.Duration as EPS_Duration, A.TotalEpisode as Total_EPS_Quantity, A.Status,
			A.create_time as Create_Date, A.update_time as Modified_Date, A.is_active , A.create_by as Create_By_ID, A.update_by as Modified_By_ID
			from PMS_GCS.dbo.airing_plan A 
			where 1=1
			and  (year(isnull(A.update_time,isnull(A.create_time,getdate()))) *100+ month(isnull(A.update_time,isnull(A.create_time,getdate()))))>= @MONTH_YEAR
			
		END
	ELSE IF @TABLE_NAME='STG_GCT_SHORT_CONTENT_SHOOTING_PLAN'
		BEGIN

			
			Select A.Id, A.ContentId as Content_ID,A.ShootingSession as Shooting_Session ,A.FirstShootingDate as From_Date,A.EndShootingDate as To_Date,
			A.TotalEpisode as EPS_Quantity,A.Producer,
			A.create_time as Create_Date, A.update_time as Modified_Date, A.is_active , A.create_by as Create_By_ID, A.update_by as Modified_By_ID
			from PMS_GCS.dbo.shooting_plan A 
			where 1=1
			and  (year(isnull(A.update_time,isnull(A.create_time,getdate()))) *100+ month(isnull(A.update_time,isnull(A.create_time,getdate()))))>= @MONTH_YEAR
		END
	-- DB NAME: SCM_GCS
	ELSE IF @TABLE_NAME='STG_GCT_DEAL_TEAM'
		BEGIN

		
			select A.Id,A.DealSponsorId as Sponsor_Deal_ID, A.Username as UserAccount,A.Fullname, 
			A.create_time as Create_Date, A.update_time as Modified_Date, A.is_active , A.create_by as Create_By_ID, A.update_by as Modified_By_ID
			from SPM_GCS.dbo.deal_team A
			where 1=1
			and  (year(isnull(A.update_time,isnull(A.create_time,getdate()))) *100+ month(isnull(A.update_time,isnull(A.create_time,getdate()))))>= @MONTH_YEAR
		END
	ELSE IF @TABLE_NAME='STG_GCT_DEAL_ACTIVITY'
		BEGIN

		
			select A.Id,A.DealSponsorId as Sponsor_Deal_ID,A.Name as Activity_Name,A.StartDate as From_Date, A.EndDate as To_Date, datediff(dd,A.EndDate,A.StartDate) as Day_Interval,
			A.Contact as Contact_Name,C.name as Contacnt_Channel,
			A.create_time as Create_Date, A.update_time as Modified_Date, A.is_active , A.create_by as Create_By_ID, A.update_by as Modified_By_ID
			from SPM_GCS.dbo.activity A left join GCS_CATEGORY.dbo.cate_contact_channel C on A.ChannelContact=C.id
			where 1=1
			and  (year(isnull(A.update_time,isnull(A.create_time,getdate()))) *100+ month(isnull(A.update_time,isnull(A.create_time,getdate()))))>= @MONTH_YEAR
		END
	ELSE IF @TABLE_NAME='STG_GCT_SPONSOR_DEAL_STATUS'
		BEGIN

		
			select A.Id,A.DealSponsorId as Sponsor_Deal_ID, S.Name as Sale_Process_Name, S.StepNumber as Sale_Process_Step, A.Description, A.IsCurrent as Is_Current,
			A.create_time as Create_Date, A.update_time as Modified_Date,  A.create_by as Create_By_ID, A.update_by as Modified_By_ID
			from SPM_GCS.dbo.sale_process_history A inner join SPM_GCS.dbo.sale_process S on A.SaleProcessId=S.Id
			where 1=1
			and  (year(isnull(A.update_time,isnull(A.create_time,getdate()))) *100+ month(isnull(A.update_time,isnull(A.create_time,getdate()))))>= @MONTH_YEAR
		END

	ELSE IF @TABLE_NAME='STG_GCT_SALE_CAMPAIGN_DETAIL_VALUE'
		BEGIN
		
			select DCP.Id, CS.Id as Campaign_ID, CS.CompanyId, CS.ContentId,CP.Name as Package_Name,
			DCP.ProductId as Camp_Product_ID, DCP.Price as Camp_Product_Price,DCP.Quantity as Camp_Product_Quantity, (DCP.Price * DCP.Quantity) as Camp_Product_Amount,
			DCP.create_time as Create_Date, DCP.update_time as Modified_Date,  DCP.create_by as Create_By_ID, DCP.update_by as Modified_By_ID,
			(case when CS.is_active=1 then (case when CP.is_active=1 then DCP.is_active else CP.is_active end) else CS.is_active end) as Is_Active 
			from SPM_GCS.dbo.campaign_sale CS inner join GCS_CONTENT.dbo.ct_content_consolidate CT on CS.ContentId=CT.id 
			inner join SPM_GCS.dbo.campaign_package CP on CS.Id=CP.CampaignSaleId 
			inner join SPM_GCS.dbo.detail_campaign_package DCP on CP.Id=DCP.CampaignPackageId 
			where 1=1
			and  (year(isnull(DCP.update_time,isnull(DCP.create_time,getdate()))) *100+ month(isnull(DCP.update_time,isnull(DCP.create_time,getdate()))))>= @MONTH_YEAR
		END
	ELSE IF @TABLE_NAME='STG_GCT_DEAL_DETAIL_VALUE'
		BEGIN
		
			select DCP.Id,SC.CampaignSaleId as Campaign_ID, CS.CompanyId, CS.ContentId,CP.Name as Package_Name,
			DCP.ProductId as Camp_Product_ID, DCP.Price as Deal_Product_Price,DCP.Quantity as Deal_Product_Quantity, DCP.Discount as Deal_Product_Discount,DCP.TotalPrice as Deal_Product_Amount,
			GCS_CONTENT.dbo.ConvertChannel(DCP.ChannelIds) as Deal_Channel_List,DCP.PlatformIds as Deal_Platform_List, DCP.TotalEpisode as Deal_EPS_Quantity,DCP.[Commit] as Deal_Commit,
			ADP.Price as Actual_Product_Price, ADP.Quantity as Actual_Product_Quantity, ADP.Discount as Actual_Product_Discount, ADP.TotalPrice as Actual_Product_Amount,
			GCS_CONTENT.dbo.ConvertChannel(ADP.ChannelIds) as Actual_Channel_List,ADP.PlatformIds as Actual_Platform_List, 	ADP.TotalEpisode as Actual_EPS_Quantity,
			ADP.ChannelType as Actual_Channel_Type, ADP.VideoType as Actual_Video_Type,
			DCP.create_time as Create_Date, DCP.update_time as Modified_Date,  DCP.create_by as Create_By_ID, DCP.update_by as Modified_By_ID,
			(case when DS.is_active=1 then (case when SC.is_active=1 then DCP.is_active else SC.is_active end) else DS.is_active end) as Is_Active 
			from SPM_GCS.dbo.deal_sponsor DS inner join SPM_GCS.dbo.sponsor_campaign SC on DS.Id=SC.DealSponsorId
			inner join SPM_GCS.dbo.campaign_sale CS ON SC.CampaignSaleId=CS.Id
			inner join SPM_GCS.dbo.sponsor_package  SP on SC.Id=SP.SponsorCampaignId 
			inner join SPM_GCS.dbo.campaign_package CP on SP.CampaignPackageId=cp.Id
			inner join SPM_GCS.dbo.sponsor_detail_package DCP on SP.Id=DCP.SponsorPackageId
			inner join SPM_GCS.dbo.actual_detail_package ADP on DCP.Id=ADP.SponsorDetailPackageId
			where 1=1
			and  (year(isnull(DCP.update_time,isnull(DCP.create_time,getdate()))) *100+ month(isnull(DCP.update_time,isnull(DCP.create_time,getdate()))))>= @MONTH_YEAR
		END
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_annex_info]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_annex_info] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select N.ID as Content_Annex_ID,N.AnnexNo as Content_Annex_Code,B.code as Content_Contract_Consol_Code,N.ContractId as Parent_Contract_ID,
			C.name as Content_Contract_Name,B.ContentId as Content_ID, B.OwnerId as Customer_ID,B.SupplierId as Vendor_ID,
			T.name as Contract_Type,(Case when B.ContractCategory=0 then N'Buy' else N'Sell' end) as Contract_Category,B.AcquisitionDate as Acquisition_Date, 
			A.name as Acquisition_Status, B.IsNew as Is_New_Contract, isnull(B.IsTransfer,0) as Is_Transfer_Contract, X.code as Tax_Name, X.value as Tax_Percent,
			S.name as Contract_Status,GCS_CONTENT.dbo.ConvertOpco(B.OpcoOrderIds) as Order_Company_List, S.name as Order_Status, B.Pic as Pic_ID, cast(N.create_time  as datetime) as Create_Date,
			cast(N.update_time as datetime) as Update_Date, N.create_by as Create_By_ID, N.update_by as Modified_By_ID, 1 as Is_Annex,N.IsTemp as Is_Temp, N.PriceClassify as Price_Classify, N.is_active as Is_Active,
			cast(B.DeadlineWarehouse as datetime) as Warehouse_Deadline, cast(B.AcquisitionDate as datetime) as SignedDate, cast( N.SubmittedDate  as datetime) as Submitted_Date, cast(N.EffectiveDate  as datetime) as Effective_Date,
			GCS_CONTENT.dbo.ConvertNation(B.GeographyIds) as Teritory_List,GCS_CONTENT.dbo.ConvertBroadcastMethod(B.BroadcastMethodIds) as Broadcast_Method_List,
			B.LicenseTypeId as License_Type_ID, B.LicenseNote as License_Note
			
			
			from GCS_CONTRACT.dbo.annex N inner join   GCS_CONTRACT.dbo.Contract B on N.ContractId=B.Id
			inner join GCS_CONTENT.dbo.ct_content_consolidate C on B.ContentId=C.id
			left join GCS_CATEGORY.dbo.cate_gcm_contract_type T on B.ContractType=T.id
			left join GCS_CATEGORY.dbo.cate_acquisitions_status A on B.AcquisitionStatusId=A.id
			left join GCS_CATEGORY.dbo.cate_tax X on N.Tax=X.id
			left join GCS_CATEGORY.dbo.cate_contract_status S on B.ContractStatus=S.id
			left join GCS_CATEGORY.dbo.cate_order_status O on B.OrderStatusId=O.id
		    where 1=1
			and  (year(isnull(N.update_time,isnull(N.create_time,getdate()))) *100+ month(isnull(N.update_time,isnull(N.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_category]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute [dbo].[sp_dwh_getdata_content]  'STG_GROUP_GCT_ACCOUNT',190001
CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_category] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	


			select B.ID as Content_Category_ID, B.Name as Content_Category_Name, B.is_active
			from GCS_CATEGORY.dbo.cate_content_type B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_contract_info]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_contract_info] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Content_Contract_ID,B.code as Content_Contract_Code,B.code as Content_Contract_Consol_Code,
			C.name as Content_Contract_Name,B.ContentId as Content_ID, B.OwnerId as Customer_ID,B.SupplierId as Vendor_ID,
			T.name as Contract_Type,(Case when B.ContractCategory=0 then N'Buy' else N'Sell' end) as Contract_Category,B.AcquisitionDate as Acquisition_Date, 
			A.name as Acquisition_Status, B.IsNew as Is_New_Contract, isnull(B.IsTransfer,0) as Is_Transfer_Contract, X.code as Tax_Name, X.value as Tax_Percent,
			S.name as Contract_Status,GCS_CONTENT.DBO.ConvertOpco(B.OpcoOrderIds) as Order_Company_List, S.name as Order_Status, B.Pic as Pic_ID, cast(B.create_time as datetime) as Create_Date,
			cast(B.update_time as datetime) as Update_Date, B.create_by as Create_By_ID, B.update_by as Modified_By_ID, 0 as Is_Annex, B.IsTemp as Is_Temp, N'NA'  as Price_Classify, 0 as Is_Active,
			cast(B.DeadlineWarehouse  as date) as Warehouse_Deadline, B.AcquisitionDate as SignedDate, 
			GCS_CONTENT.dbo.ConvertNation(B.GeographyIds) as Teritory_List,GCS_CONTENT.dbo.ConvertBroadcastMethod(B.BroadcastMethodIds) as Broadcast_Method_List,
			B.LicenseTypeId as License_Type_ID, B.LicenseNote as License_Note
			
			from GCS_CONTRACT.dbo.Contract B inner join GCS_CONTENT.dbo.ct_content_consolidate C on B.ContentId=C.id
			left join GCS_CATEGORY.dbo.cate_gcm_contract_type T on B.ContractType=T.id
			left join GCS_CATEGORY.dbo.cate_acquisitions_status A on B.AcquisitionStatusId=A.id
			left join GCS_CATEGORY.dbo.cate_tax X on B.Tax=X.id
			left join GCS_CATEGORY.dbo.cate_contract_status S on B.ContractStatus=S.id
			left join GCS_CATEGORY.dbo.cate_order_status O on B.OrderStatusId=O.id
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_exploitation_right]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[sp_dwh_getdata_content_value]  'STG_GROUP_GCT_CONTENT_VALUE',190001

CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_exploitation_right] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
				-- license thuoc hop dong
			select  L.Id as ID, L.is_free as Is_Pay,L.exclusive_start_date as Exclusive_From_Date,
			L.exclusive_end_date as Exclusive_End_Date,L.non_exclusive_start_date as Non_Exclusive_From_Date, L.non_exclusive_end_date as Non_Exclusive_End_Date,
			L.run,L.is_all_channel, C.Code as Contract_Code,null as Annex_Code, 0 as Is_Annex, (case when isnull(L.channel_rights,'')='' then -1 else H.channel_general_id end) as Channel_ID,
			L.ContractId as Contract_ID,null as Annex_ID, C.ContentId as Content_ID, M.id as Content_Master_File_ID,L.notes as Note, 
			0  as Exploitation_Right_ID, isnull(L.is_active,0) as Is_delete, -- L.delivery_license_id as Exploitation_Right_ID, isnull(L.is_active,0) as Is_delete, // He thong dang thay doi cau truc (20/11/2023) xu ly tam thoi tranh gay loi etl
			cast(L.create_time as datetime) as Create_Date, L.create_by as Create_By_ID, L.update_by as Modified_By_ID, cast(L.update_time as datetime) as Modified_Date
	
			from GCS_CONTRACT.dbo.license_detail L inner join GCS_CONTRACT.dbo.Contract C on L.ContractId=C.ID
			left join GCS_CONTRACT.dbo.master M on C.Id=M.ContractId and C.ContentId=M.content_id
			left join GCS_CATEGORY.dbo.cate_channel H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',L.channel_rights,';')) <>0 
			
			where 1=1
			and  (year(isnull(L.update_time,isnull(L.create_time,getdate()))) *100+ month(isnull(L.update_time,isnull(L.create_time,getdate()))))>= @MONTH_YEAR

			union all
			--License thuoc phu luc hop dong
			select  L.Id as ID, L.is_free as Is_Pay,L.exclusive_start_date as Exclusive_From_Date,
			L.exclusive_end_date as Exclusive_End_Date,L.non_exclusive_start_date as Non_Exclusive_From_Date, L.non_exclusive_end_date as Non_Exclusive_End_Date,
			L.run,L.is_all_channel,C.Code as Contract_Code,N.AnnexNo as Annex_Code, 1 as Is_Annex,  (case when isnull(L.channel_rights,'')='' then -1 else H.channel_general_id end) as Channel_ID,
			N.ContractId as Contract_ID,N.Id as Annex_ID,C.ContentId as Content_ID, M.id as Content_Master_File_ID,L.notes as Note, 
			0 as Exploitation_Right_ID, isnull(L.is_active,0) as Is_delete,
			-- L.delivery_license_id as Exploitation_Right_ID, isnull(L.is_active,0) as Is_delete, // He thong dang thay doi cau truc (20/11/2023) xu ly tam thoi tranh gay loi etl
			cast(L.create_time as datetime) as Create_Date, L.create_by as Create_By_ID, L.update_by as Modified_By_ID, cast(L.update_time as datetime) as Modified_Date
	

			from GCS_CONTRACt.dbo.annex_license_detail L inner join GCS_CONTRACT.dbo.annex N on L.AnnexId=N.ID
			inner join GCS_CONTRACT.dbo.Contract C on N.ContractId=C.Id
			left join GCS_CONTRACT.dbo.master M on C.Id=M.ContractId and C.ContentId=M.content_id
			left join GCS_CATEGORY.dbo.cate_channel H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',L.channel_rights,';')) <>0 
			where 1=1
			and  (year(isnull(L.update_time,isnull(L.create_time,getdate()))) *100+ month(isnull(L.update_time,isnull(L.create_time,getdate()))))>= @MONTH_YEAR

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_file]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec [dbo].[sp_dwh_getdata_content_file] 'STG_GROUP_GCT_CONTENT_FILE'

CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_file] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	
			-- Post Production
		
			select B.ID as Content_File_ID,cast(B.ID as nvarchar(250)) as Content_File_Code,C.Code as Contract_Code,C.Id as Contract_ID,C.Code as Parent_Contract_Code, CONCAT('M','-',CT.Name) as Content_File_Name,
			0 as Is_Annex, 0 as Content_File_Type,B.episode as Episode_Quantity, B.duration_minute as Episode_Duration, isnull(E.name,N'NA') as Extension_File, ISNULL(Q.name,N'NA') as Resolution_File,
			cast(N'NA' as nvarchar(250)) as Content_Format, cast( NULL as nvarchar(100)) as Parent_File_ID , cast(N'NA' as nvarchar(500)) as Post_File_Type, -1 as Post_Production_ID, -1 as Company_ID,CT.id as Content_ID
			
			from GCS_CONTRACT.dbo.master B inner join GCS_CONTRACT.dbo.Contract C on B.ContractId=C.ID
			inner join GCS_CONTENT.dbo.ct_content_consolidate CT on B.content_id=CT.id
			left join GCS_CATEGORY.dbo.cate_file_extension E on B.file_extension_id=E.id
			left join GCS_CATEGORY.dbo.cate_file_quality Q on B.file_quality_id=Q.id
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
			union all
			-- Master Slave File
			select B.ID as Content_File_ID,B.ID as Content_File_Code,C.Code as Contract_Code,C.Id as Contract_ID,C.Code as Parent_Contract_Code, CONCAT('S','-',CT.Name) as Content_File_Name,
			0 as Is_Annex, 1 as Content_File_Type, 1 as Episode_Quantity, B.duration_minute as Episode_Duration,isnull(E.name,N'NA') as Extension_File, N'NA' as Resolution_File,
			cast(isnull(F.name,N'NA') as nvarchar(250)) as Content_Format, cast(NULL as nvarchar(100)) as Parent_File_ID ,cast(N'NA' as nvarchar(500)) as Post_File_Type, -1 as Post_Production_ID, -1 as Company_ID, CT.id as Content_ID
			from GCS_CONTRACT.dbo.master_slave B inner join GCS_CONTRACT.dbo.Contract C on B.ContractId=C.ID
			inner join GCS_CONTENT.dbo.ct_content_consolidate CT on B.content_id=CT.id
			left join GCS_CATEGORY.dbo.cate_file_extension E on B.file_extension_id=E.id
			left join GCS_CATEGORY.dbo.cate_formality F on B.formality_id=F.id
	
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
		
			union all

			
			select cast(B.ID as nvarchar(100)) as Content_File_ID, cast(B.ID as nvarchar(250)) as Content_File_Code,C.Code as Contract_Code,C.Id as Contract_ID,C.Code as Parent_Contract_Code, CONCAT('P','-',CT.Name) as Content_File_Name,
			0 as Is_Annex, 1 as Content_File_Type, B.total as Episode_Quantity, B.duration_minute as Episode_Duration,isnull(E.name,N'NA') as Extension_File, ISNULL(Q.name,N'NA') as Resolution_File,
			cast(N'NA' as nvarchar(250)) as Content_Format, cast(B.master_id as nvarchar(100)) as Parent_File_ID, isnull(PT.name,N'NA') as Post_File_Type, isnull(B.post_corp_id,-1) as Post_Production_ID, isnull(B.company_id,-1) as Company_ID,	CT.id as Content_ID

			from GCS_CONTENT_POST.dbo.ct_post B inner join GCS_CONTENT.dbo.ct_content_consolidate CT on B.consolidate_content_id=CT.id
			inner join GCS_CONTRACT.dbo.master M on B.master_id=M.id
			inner join GCS_CONTRACT.dbo.Contract C on M.ContractId=C.ID
			left join GCS_CATEGORY.dbo.cate_file_extension E on B.file_extension_id=E.id
			left join GCS_CATEGORY.dbo.cate_file_quality Q on B.file_quality_id=Q.id
			left join GCS_CATEGORY.dbo.cate_post_type PT on B.post_type_id=PT.id
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
	

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_gender]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute [dbo].[sp_dwh_getdata_content]  'STG_GROUP_GCT_ACCOUNT',190001
CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_gender] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	


	select B.ID as Content_Gender_ID, B.Name as Content_Gender_Name, B.is_active
	from GCS_CATEGORY.dbo.cate_sex B
	where 1=1
	and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_genre]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute [dbo].[sp_dwh_getdata_content]  'STG_GROUP_GCT_ACCOUNT',190001
CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_genre] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	


			select B.ID as Content_Genre_ID, B.Name as Content_Genre_Name,B.description as Content_Genre_Description, B.is_active, B.content_type_id as Content_Category_ID
			from GCS_CATEGORY.dbo.cate_content_category B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_info]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_info] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	
	select B.ID as Content_ID,B.previous_content_id as Previous_Content_ID,B.code as Content_Code,B.reference_code as Content_Ref_Code,
	B.Name as Content_Name,B.original_name as Content_English_Name, B.other_name as Content_Other_Name,
	B.content_type_id as Content_Category_ID, GCS_CONTENT.dbo.ConvertContentCategory(B.content_category_id) as Content_Genre_List ,B.season,B.sex_id as Content_Gender_ID, GCS_CONTENT.dbo.ConvertSpectator(B.spectator_id) as Target_Audience_Age_List,
	B.ranking_id as Content_Ranking,B.rating_averager as Content_Rating,B.content_source_id as Content_Origin_ID, B.script_id as Script_Origin_ID,
	B.year as Release_Year, B.import_year as Entry_Year, GCS_CONTENT.dbo.ConvertNation(B.nation_id) as Country_List,GCS_CONTENT.dbo.ConvertVendor(B.manufacturer_id) as Manufacturer_List,
	GCS_CONTENT.dbo.ConvertTalent(B.director_id) as Director_List,GCS_CONTENT.dbo.ConvertTalent(B.actor_id) as Cast_List,GCS_CONTENT.dbo.ConvertContentLanguage(B.language_id) as Language_List,
	B.company_id as Purchase_Company_ID,B.Is_liquit,B.description as Content_Description,B.create_by,B.update_by,B.create_time as Create_Date, B.update_time as Modified_Date,B.is_deleted, 0 as Is_Plan,
	(case when B.is_deleted=1 then B.update_time end) as Delete_Date
	from GCS_CONTENT.dbo.ct_content_consolidate B
	where 1=1
	and is_deleted <>1
	and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_object]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_object] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
				-- Origin_Country_ID
			select B.id as Content_ID,H.id as Origin_Country_ID, null as Manufacture_ID, null as Director_ID, null as Cast_ID, null as Content_Genre_ID,
			 null as  Target_Audience_Age, 1 as Object_Opt, B.is_deleted 
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_nation H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.nation_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR

			union all
			-- Manufacture
			select B.id as Content_ID,null as Origin_Country_ID, H.id as Manufacture_ID, null as Director_ID, null as Cast_ID, null as Content_Genre_ID, 
			null as  Target_Audience_Age, 2 as Object_Opt , B.is_deleted 
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_vendor H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.manufacturer_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR
			union all
			-- Director
			select B.id as Content_ID,null as Origin_Country_ID, null as Manufacture_ID, H.id as Director_ID, null as Cast_ID, null as Content_Genre_ID, 
			null as  Target_Audience_Age, 3 as Object_Opt , B.is_deleted 
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_talent H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.director_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR
			union all
			--Cast
			select B.id as Content_ID,null as Origin_Country_ID, null as Manufacture_ID, null as Director_ID, H.id as Cast_ID, null as Content_Genre_ID, 
			null as  Target_Audience_Age, 4 as Object_Opt , B.is_deleted 
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_talent H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.actor_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR
			union all
			--Content_Genre
			select B.id as Content_ID,null as Origin_Country_ID, null as Manufacture_ID, null as Director_ID, null as Cast_ID, H.id as Content_Genre_ID, 
			null as  Target_Audience_Age, 5 as Object_Opt , B.is_deleted 
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_content_category H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.content_category_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR

			union all

			--Target_Audience
			select B.id as Content_ID,null as Origin_Country_ID, null as Manufacture_ID, null as Director_ID, null as Cast_ID, null as Content_Genre_ID, 
			H.id as  Target_Audience_Age, 6 as Object_Opt , B.is_deleted 
			
			from GCS_CONTENT.dbo.ct_content_consolidate B
			left join  GCS_CATEGORY.dbo.cate_age H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.spectator_id,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR
		

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_origin]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_origin] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	


			select B.ID as Content_Origin_ID, B.Name as Content_Origin_Name, B.is_active,B.description as Content_Origin_Description
			from GCS_CATEGORY.dbo.cate_content_source  B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_teritory_right]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_teritory_right] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.Id,B.ID as Content_Contract_ID,B.code as Contract_Code,B.ContentId as Content_ID, M.id as Content_Master_File_ID, 0 as Is_Annex,
			(case when isnull(B.GeographyIds,'')='' then -1 else H.id end)  as Country_ID, B.IsDelete

			
			from GCS_CONTRACT.dbo.Contract B left join GCS_CONTRACT.dbo.master M on B.Id=M.ContractId and B.ContentId=M.content_id
			left join GCS_CATEGORY.dbo.cate_nation H on CHARINDEX(CONCAT(';',CAST(H.ID AS NVARCHAR(20)),';'),CONCAT(';',B.GeographyIds,';')) <>0 
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>= @MONTH_YEAR

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_content_value]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[sp_dwh_getdata_content_value]  'STG_GROUP_GCT_CONTENT_VALUE',190001

CREATE PROCEDURE [dbo].[sp_dwh_getdata_content_value] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			-- lay du lieu tu hop dong
			select B.ID as ID,B.ContentId,B.Code as Contract_Code,B.ContractContentName as Document_Name,B.Id as Contract_ID,NULL as Annex_Code, null as Annex_ID,0 as Is_Annex, T.name as Price_Type, c.name as Currency, P.pricing as Amount, P.company_id as Purchase_Company_ID,
			B.OwnerId as Customer_ID,B.SupplierId as Vendor_ID, B.DeadlineWarehouse  as Warehouse_Deadline,GCS_CONTENT.dbo.ConvertNation(B.GeographyIds) as Teritory_List,GCS_CONTENT.dbo.ConvertBroadcastMethod(B.BroadcastMethodIds) as Broadcast_Method_List,
			B.create_by,B.update_by,cast(B.create_time as datetime) as Create_Date, cast(B.update_time as datetime) as Modified_Date,B.IsDelete,
			cast((case when B.IsDelete=1 then isnull(B.update_time,B.create_time) end) as datetime) as Delete_Date, B.SaleContractContentCode as Customer_Content_Code, B.ContractContentCode as Vendor_Content_Code,
			B.LicenseTypeId as License_Type_ID, B.LicenseNote as License_Note
			from GCS_CONTRACT.dbo.Contract B left join GCS_CONTRACT.dbo.price P on B.Id=P.ContractId
			left JOIN GCS_CATEGORY.dbo.cate_type_price T on P.type_price_id=T.id 
			left join GCS_CATEGORY.dbo.cate_currency C on P.currency_id=C.id
			where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
			-- lay du lieu tu phu luc hop dong
			union all

			select B.ID as ID,B.ContentId,B.Code as Contract_Code,A.Name as Document_Name,B.Id as Contract_ID,A.AnnexNo as Annex_Code, A.Id as Annex_ID,1 as Is_Annex, N'NA' as Price_Type, C.name as Currency, P.pricing as Amount, P.company_id as Purchase_Company_ID,
			B.OwnerId as Customer_ID,B.SupplierId as Vendor_ID,B.DeadlineWarehouse as Warehouse_Deadline,GCS_CONTENT.dbo.ConvertNation(B.GeographyIds) as Teritory_List,GCS_CONTENT.dbo.ConvertBroadcastMethod(B.BroadcastMethodIds) as Broadcast_Method_List,
			A.create_by,A.update_by,cast(A.create_time as datetime) as Create_Date, cast(A.update_time  as datetime) as Modified_Date,B.IsDelete,
			cast((case when B.IsDelete=1 then isnull(B.update_time,B.create_time) end) as datetime) as Delete_Date, B.SaleContractContentCode as Customer_Content_Code, B.ContractContentCode as Vendor_Content_Code,
			B.LicenseTypeId as License_Type_ID, B.LicenseNote as License_Note
			from GCS_CONTRACT.dbo.annex A  inner join GCS_CONTRACT.dbo.Contract B on A.ContractId=B.Id
			left join GCS_CONTRACT.dbo.annex_price P on A.ID =P.AnnexId
			left join GCS_CATEGORY.dbo.cate_currency C on P.currency_id=C.id
			where 1=1
			and  (year(isnull(A.update_time,isnull(A.create_time,getdate()))) *100+ month(isnull(A.update_time,isnull(A.create_time,getdate()))))>=@MONTH_YEAR

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_country]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_country] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Country_ID,B.code as Country_Code ,B.name_VN as Country_Name, B.Name as Country_English_Name,B.is_active, B.geography_id as Geography_ID
			from GCS_CATEGORY.dbo.cate_nation B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_district]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_district] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as District_ID,REPLICATE('0',3-len(B.id))+ cast(B.id as nvarchar(250)) as District_Code ,
			B.Name as District_English_Name, B.name_VN as District_Name,B.is_active, B.province_id as Province_ID
			from GCS_CATEGORY.dbo.cate_district B 
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END


GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_exploitation_right]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_exploitation_right] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Exploitation_Right_ID, B.Name as Exploitation_Right_Name, B.is_active, B.type as Exploitation_Right_Type
			from GCS_CATEGORY.dbo.cate_delivery_license B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_geography]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_geography] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Geography_ID, B.Name as Geography_Name, B.name_VN as Geography_English_Name,B.Continent,B.is_active
			from GCS_CATEGORY.dbo.cate_geography B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_license_type]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_license_type] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	

			select B.ID as License_Type_ID, B.Name as License_Type_Name, B.is_active
			from GCS_CATEGORY.dbo.cate_license_type B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_music_contract]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_dwh_getdata_music_contract] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Music_Contract_ID,B.code as Music_Contract_Code,B.code as Music_Contract_Consol_Code,
			C.name as Music_Contract_Name,B.music_id as Music_ID, B.owner_id as Customer_ID,B.supplier_id as Vendor_ID,B.owner_id as Owner_ID,
			T.name as Contract_Type,(Case when B.contract_category=0 then N'Buy' else N'Sell' end) as Contract_Category,
			X.code as Tax_Name, X.value as Tax_Percent,	S.name as Contract_Status,
			cast(B.create_time as datetime) as Create_Date, cast(B.update_time as datetime) as Update_Date, B.create_by as Create_By_ID, B.update_by as Modified_By_ID, 0 as Is_Annex,
			B.is_temp as Is_Temp, 0 as Is_Active, GCS_CONTENT.dbo.ConvertGeography(B.geography_ids) as Geography_List, b.license_type_id as License_Type_ID,
			GCS_CONTENT.dbo.ConvertBroadcastMethod(B.broadcast_method_ids) as Broadcast_Method_List, B.license_note as License_Note,
			B.sale_contract_music_code as Customer_Music_Code, B.code as Vendor_Music_Code,	B.is_deleted, cast(b.date as datetime) as Signed_Date
			from MUSIC_GCS.dbo.Contract B inner join MUSIC_GCS.dbo.music C on B.music_id=C.id
			left join GCS_CATEGORY.dbo.cate_gcm_contract_type T on B.contract_category=T.id
			left join GCS_CATEGORY.dbo.cate_tax X on B.Tax=X.id
			left join GCS_CATEGORY.dbo.cate_contract_status S on B.contract_status=S.id
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_music_info]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dwh_getdata_music_info] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	
	select B.ID as Music_ID,B.code as Music_Code,B.Name as Music_Name,B.original_name as Music_English_Name, B.other_name as Music_Other_Name,
	B.category_id as Music_Category_ID, GCS_CONTENT.dbo.ConvertContentCategory(B.genre_id) as Music_Genre_List ,B.sex_id as Music_Gender_ID, 
	GCS_CONTENT.dbo.ConvertSpectator(B.spectator_id) as Target_Audience_Age_List,B.source_id as Music_Origin_ID,
	B.year as Release_Year, B.import_year as Entry_Year, GCS_CONTENT.dbo.ConvertNation(B.nation_id) as Country_List,GCS_CONTENT.dbo.ConvertVendor(B.manufacturer_id) as Manufacturer_List,
	GCS_CONTENT.dbo.ConvertTalent(B.author_id) as Author_List,GCS_CONTENT.dbo.ConvertTalent(B.singer_id) as Singer_List,
	GCS_CONTENT.dbo.ConvertContentLanguage(B.language_id) as Language_List,
	B.company_id as Purchase_Company_ID,B.description as Music_Description,B.create_by,B.update_by,B.create_time as Create_Date, B.update_time as Modified_Date,B.is_deleted, 0 as Is_Plan,
	(case when B.is_deleted=1 then B.update_time end) as Delete_Date
	from MUSIC_GCS.dbo.music B
	where 1=1
	and is_deleted <>1
	and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_parent_account]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dwh_getdata_parent_account] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	
	select B.id as PA_ID,B.name as PA_Name, B.description as PA_Description, B.is_active, B.is_deleted,
	B.create_by as Create_By_ID,cast(B.create_time as datetime) as Create_Data,B.update_by as Modified_By_ID, cast(B.update_time as datetime) as Modified_Date
	from GCS_CATEGORY.dbo.cate_parent_account B
	where  1=1 
	and (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
END



GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_platform]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_platform] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	

			select B.ID as Platform_ID, B.Name as Platform_Name,  B.link as Platform_Link, B.is_active,B.is_deleted, B.description as Platform_Description
			from GCS_CATEGORY.dbo.cate_platform B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_province]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_province] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Province_ID,REPLICATE('0',2-len(B.id))+ cast(B.id as nvarchar(250)) as Province_Code ,
			B.name_VN as Province_Name, B.name as Province_English_Name,B.is_active,S.name as Sub_Region, S.region,S.nation_id as Country_ID
		
			from GCS_CATEGORY.dbo.cate_province B left join GCS_CATEGORY.dbo.cate_sub_region S on B.sub_region_id=S.id
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_script_origin]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_script_origin] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	


			select B.ID as Script_Origin_ID, B.Name as Script_Origin_Name, B.is_active
			from GCS_CATEGORY.dbo.cate_script B
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_shortcontent_info]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_shortcontent_info] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Short_Content_ID,B.code as Short_Content_Code,B.reference_code as Short_Content_Ref_Code,B.related_content_id as Content_ID,
			B.Name as Short_Content_Name,B.original_name as Short_Content_English_Name, B.other_name as Short_Content_Other_Name,B.post_master_id as Content_File_ID,
			B.owner_id as Owner_ID, B.supplier_id as Supplier_ID,B.create_by,B.update_by,cast(B.create_time as datetime) as Create_Date, cast( B.update_time as datetime) as Modified_Date,B.is_deleted,
			cast((case when B.is_deleted=1 then isnull(B.update_time,B.create_time) end) as datetime) as Delete_Date,V.name as Video_Type, B.episode_number  as Episode_Number
		    from GCS_SHORT_CONTENT.dbo.ct_short_content B left join GCS_CATEGORY.dbo.cate_video_type V on B.video_type=V.id
			left join GCS_CONTENT_POST.dbo.ct_post P on B.post_master_id=P.id
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_street]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_street] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	-- Hiện tại chưa tạo bảng Street -- Đang dùng tạm Ward để viết etl
			select B.ID as Street_ID,REPLICATE('0',6-len(B.id))+ cast(B.id as nvarchar(250)) as Street_Code ,
			B.Name as Street_English_Name, B.name_VN as Street_Name,B.is_active
			from GCS_CATEGORY.dbo.cate_ward B 
		    where 1<>1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
END


GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_talent_info]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dwh_getdata_talent_info] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 


	select B.ID as Talent_ID, B.Talent_code, B.Name as Talent_Name,B.Nick_name as Talent_NickName, B.Gender  as Talent_Gender_ID, B.Description as Talent_Description, B.birthday as Talent_BirthDay, B.nation_id as Talent_Nation_ID, B.is_active
	from GCS_CATEGORY.dbo.cate_talent B
	where 1=1
	and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_target_audience_age]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute [dbo].[sp_dwh_getdata_content]  'STG_GROUP_GCT_ACCOUNT',190001
CREATE PROCEDURE [dbo].[sp_dwh_getdata_target_audience_age] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
	


	select B.ID as Target_Audience_ID, B.Name as Target_Audience_Name, B.Description as Target_Audience_Description, B.is_active
	from GCS_CATEGORY.dbo.cate_age B
	where 1=1
	and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
			
			
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_useraccount]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute [dbo].[sp_dwh_getdata_content]  'STG_GROUP_GCT_ACCOUNT',190001
CREATE PROCEDURE [dbo].[sp_dwh_getdata_useraccount] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 

			
		select U.username as UserAccount_Name,U.display_name as UserAccount_Display_Name,
		U.first_name as UserAccount_First_Name,U.last_name as UserAccount_Last_Name,
		U.company  as UserAccount_Company_Name,U.department as  UserAccount_Department_Name,
		U.occupation as Job_Title,U.email as UserAccount_Email,U.mobile as UserAccount_Mobile,
		U.cate_company_id as UserAccount_Company, U.is_ad_active as Is_ActiveDirectory
		from GCS_USERS.dbo.auth_user U
			

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dwh_getdata_ward]    Script Date: 4/25/2024 4:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dwh_getdata_ward] 
	
	@TABLE_NAME nvarchar(250),
	@MONTH_YEAR int=0
	
AS
BEGIN 
			select B.ID as Ward_ID,REPLICATE('0',5-len(B.id))+ cast(B.id as nvarchar(250)) as Ward_Code ,
			B.Name as Ward_English_Name, B.name_VN as Ward_Name,B.district_id as District_ID,B.is_active
			from GCS_CATEGORY.dbo.cate_ward B 
		    where 1=1
			and  (year(isnull(B.update_time,isnull(B.create_time,getdate()))) *100+ month(isnull(B.update_time,isnull(B.create_time,getdate()))))>=@MONTH_YEAR
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
         Begin Table = "ct"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content'
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
         Begin Table = "ct"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 320
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cl"
            Begin Extent = 
               Top = 9
               Left = 377
               Bottom = 206
               Right = 685
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content_Contract'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content_Contract'
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
         Begin Table = "ct"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 320
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cl"
            Begin Extent = 
               Top = 9
               Left = 377
               Bottom = 206
               Right = 712
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
         Column = 5620
         Alias = 4420
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content_Contract_License'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content_Contract_License'
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
         Begin Table = "ct"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 320
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cl"
            Begin Extent = 
               Top = 9
               Left = 377
               Bottom = 206
               Right = 658
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content_Contract_Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content_Contract_Price'
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
         Begin Table = "ct"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 320
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cl"
            Begin Extent = 
               Top = 9
               Left = 377
               Bottom = 206
               Right = 712
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
         Column = 7640
         Alias = 3020
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content_Contract_Test'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Export_Content_Contract_Test'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserActivityContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserActivityContent'
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
         Begin Table = "cate_broadcast_method (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_broadcast_method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_broadcast_method'
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
         Begin Table = "cate_acquisitions_status (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_acquisitions_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_acquisitions_status'
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
         Begin Table = "cate_age (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_age'
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
         Begin Table = "cate_content_source (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_content_source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_content_source'
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
         Begin Table = "cate_contract_status (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_contract_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_contract_status'
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
         Begin Table = "cate_gcm_contract_type (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 152
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_contract_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_contract_type'
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
         Begin Table = "cate_delivery_license (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_delivery_license'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_delivery_license'
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
         Begin Table = "cate_file_extension (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_file_extension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_file_extension'
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
         Begin Table = "cate_file_quality (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_file_quality'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_file_quality'
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
         Begin Table = "cate_gcm_language (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 152
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_language'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_language'
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
         Begin Table = "cate_license_type (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_license_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_license_type'
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
         Begin Table = "cate_supplier (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_old_supplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_old_supplier'
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
         Begin Table = "cate_order_status (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_order_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_order_status'
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
         Begin Table = "cate_script (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_script'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_script'
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
         Begin Table = "cate_sex (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_sex'
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
         Begin Table = "cate_tax (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_tax'
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
         Begin Table = "cate_vendor (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 284
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_vendor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_cate_vendor'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_channel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_channel'
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
         Begin Table = "c"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 318
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 7
               Left = 366
               Bottom = 170
               Right = 568
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
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_basic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_basic'
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
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 485
               Bottom = 136
               Right = 655
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_broadcast_by_channel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_broadcast_by_channel'
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
         Begin Table = "cate_content_category (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 6
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[11] 2[20] 3) )"
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
         Top = -144
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 368
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 9
               Left = 425
               Bottom = 206
               Right = 647
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 9
               Left = 704
               Bottom = 206
               Right = 935
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 9
               Left = 992
               Bottom = 206
               Right = 1223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 404
               Right = 290
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_s"
            Begin Extent = 
               Top = 9
               Left = 1280
               Bottom = 206
               Right = 1502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_scr"
            Begin Extent = 
               Top = 9
               Left = 1559
               Bottom = 206
               Right = 1781
            End
            DisplayFlags = 280
            TopColumn = 0
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_export'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    End
         Begin Table = "ct_com"
            Begin Extent = 
               Top = 9
               Left = 1838
               Bottom = 206
               Right = 2060
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_acq"
            Begin Extent = 
               Top = 207
               Left = 347
               Bottom = 404
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_or"
            Begin Extent = 
               Top = 207
               Left = 626
               Bottom = 404
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_fqlt"
            Begin Extent = 
               Top = 207
               Left = 905
               Bottom = 404
               Right = 1127
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_sex"
            Begin Extent = 
               Top = 207
               Left = 1184
               Bottom = 404
               Right = 1406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_pop"
            Begin Extent = 
               Top = 207
               Left = 1742
               Bottom = 404
               Right = 1964
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_lst"
            Begin Extent = 
               Top = 405
               Left = 615
               Bottom = 602
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_fex"
            Begin Extent = 
               Top = 405
               Left = 894
               Bottom = 602
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct_fqlt2"
            Begin Extent = 
               Top = 405
               Left = 1173
               Bottom = 602
               Right = 1395
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
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_export'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_export'
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
            TopColumn = 41
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_infor_and_show'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_infor_and_show'
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
         Begin Table = "content_license (GCS_CONTENT_LICENSE.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 213
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_license'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_license'
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
         Begin Table = "ld"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 352
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 9
               Left = 409
               Bottom = 206
               Right = 640
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "de"
            Begin Extent = 
               Top = 9
               Left = 697
               Bottom = 206
               Right = 919
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_license_detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_license_detail'
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
               Top = 9
               Left = 57
               Bottom = 206
               Right = 368
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 9
               Left = 425
               Bottom = 206
               Right = 658
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_master_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_master_id'
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
         Begin Table = "ct"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 290
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ex"
            Begin Extent = 
               Top = 9
               Left = 347
               Bottom = 206
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "form"
            Begin Extent = 
               Top = 9
               Left = 626
               Bottom = 206
               Right = 848
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_master_slave'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_master_slave'
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
         Begin Table = "cate_actor (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_old_actor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_old_actor'
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
         Begin Table = "cate_director (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_old_director'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_old_director'
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
         Begin Table = "p"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 334
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pt"
            Begin Extent = 
               Top = 9
               Left = 391
               Bottom = 206
               Right = 613
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pc"
            Begin Extent = 
               Top = 9
               Left = 670
               Bottom = 206
               Right = 892
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fq"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 404
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fe"
            Begin Extent = 
               Top = 207
               Left = 336
               Bottom = 404
               Right = 558
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_post'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_post'
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
               Top = 9
               Left = 57
               Bottom = 206
               Right = 368
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 9
               Left = 425
               Bottom = 206
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pt"
            Begin Extent = 
               Top = 9
               Left = 759
               Bottom = 206
               Right = 981
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_post_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_post_id'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_post_master'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_post_master'
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
         Begin Table = "p_s"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 290
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 9
               Left = 347
               Bottom = 206
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pt"
            Begin Extent = 
               Top = 9
               Left = 681
               Bottom = 206
               Right = 903
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "form"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 404
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fq"
            Begin Extent = 
               Top = 207
               Left = 336
               Bottom = 404
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fe"
            Begin Extent = 
               Top = 207
               Left = 615
               Bottom = 404
               Right = 837
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
         Column = 1930
         Alias = 900
         Table = 1170' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_post_slave'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_post_slave'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_post_slave'
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
               Top = 9
               Left = 57
               Bottom = 206
               Right = 352
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "de"
            Begin Extent = 
               Top = 9
               Left = 409
               Bottom = 206
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 9
               Left = 688
               Bottom = 206
               Right = 955
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_sales'
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
         Begin Table = "cate_content_source (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_source'
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
         Begin Table = "ct"
            Begin Extent = 
               Top = 6
               Left = 305
               Bottom = 136
               Right = 475
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cp"
            Begin Extent = 
               Top = 6
               Left = 721
               Bottom = 136
               Right = 891
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cs"
            Begin Extent = 
               Top = 9
               Left = 948
               Bottom = 206
               Right = 1179
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
      Begin ColumnWidths = 12
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
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_sum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_sum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_sum'
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
         Begin Table = "cate_talent (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 7
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_talent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_talent'
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
         Begin Table = "cate_content_type (GCS_CATEGORY.dbo)"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 8
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_content_type'
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
         Begin Table = "st"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 24
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
         Column = 3220
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_from_short_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_from_short_content'
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
         Begin Table = "f"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_from_short_content_ftp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_from_short_content_ftp'
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
         Begin Table = "ct_short_content_permission (GCS_SHORT_CONTENT.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 235
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_from_short_content_permission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_from_short_content_permission'
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
         Begin Table = "cate_nation (GCS_CATEGORY.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_nation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_nation'
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
         Begin Table = "p"
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
               Top = 138
               Left = 38
               Bottom = 268
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "co"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 136
               Right = 443
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_permission_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_permission_content'
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
         Begin Table = "p"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 322
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 9
               Left = 379
               Bottom = 206
               Right = 690
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "us"
            Begin Extent = 
               Top = 9
               Left = 747
               Bottom = 206
               Right = 1089
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
         Alias = 1920
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_permission_tool_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_permission_tool_content'
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
         Begin Table = "pdl"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 308
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pl"
            Begin Extent = 
               Top = 9
               Left = 365
               Bottom = 206
               Right = 587
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dl"
            Begin Extent = 
               Top = 9
               Left = 644
               Bottom = 206
               Right = 866
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_platform_channel_general'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_platform_channel_general'
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
         Begin Table = "pdl"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 303
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pl"
            Begin Extent = 
               Top = 9
               Left = 360
               Bottom = 206
               Right = 582
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dl"
            Begin Extent = 
               Top = 9
               Left = 639
               Bottom = 206
               Right = 861
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_platform_delivery_license'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_platform_delivery_license'
GO
USE [master]
GO
ALTER DATABASE [GCS_CONTENT] SET  READ_WRITE 
GO
