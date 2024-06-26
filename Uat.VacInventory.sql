USE [master]
GO
/****** Object:  Database [Uat.VacInventory]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE DATABASE [Uat.VacInventory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prod.VacInventory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Prod.VacInventory_31032023.mdf' , SIZE = 4857856KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prod.VacInventory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Prod.VacInventory_31032023_log.ldf' , SIZE = 6430720KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Uat.VacInventory] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Uat.VacInventory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Uat.VacInventory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET ARITHABORT OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Uat.VacInventory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Uat.VacInventory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Uat.VacInventory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Uat.VacInventory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET RECOVERY FULL 
GO
ALTER DATABASE [Uat.VacInventory] SET  MULTI_USER 
GO
ALTER DATABASE [Uat.VacInventory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Uat.VacInventory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Uat.VacInventory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Uat.VacInventory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Uat.VacInventory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Uat.VacInventory] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Uat.VacInventory', N'ON'
GO
ALTER DATABASE [Uat.VacInventory] SET QUERY_STORE = OFF
GO
USE [Uat.VacInventory]
GO
/****** Object:  User [sqlsup01]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE USER [sqlsup01] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dimuser02]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE USER [dimuser02] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dimuser]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE USER [dimuser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dimadmin]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE USER [dimadmin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sqlsup01]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dimuser02]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dimuser]
GO
ALTER ROLE [db_owner] ADD MEMBER [dimadmin]
GO
/****** Object:  Schema [inv]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE SCHEMA [inv]
GO
/****** Object:  Table [dbo].[AppActivityLog]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppActivityLog](
	[Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](255) NULL,
	[Module] [nvarchar](255) NULL,
	[ActivityType] [nvarchar](255) NULL,
	[Details] [nvarchar](2048) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AppActivityLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[Companies]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[Companies](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyTaxCode] [nvarchar](255) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUsers]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[NormalizedUserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](64) NULL,
	[Surname] [nvarchar](64) NULL,
	[Email] [nvarchar](256) NOT NULL,
	[NormalizedEmail] [nvarchar](256) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](256) NULL,
	[SecurityStamp] [nvarchar](256) NOT NULL,
	[IsExternal] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](16) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[Status] [int] NULL,
	[FullName] [nvarchar](512) NULL,
 CONSTRAINT [PK_AbpUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[UserActivityLogs]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserActivityLogs]
AS
SELECT        Date, UserName, Module, ActivityType, Details, CreationTime, company
FROM            (SELECT        a.Date, a.UserName, a.Module, a.ActivityType, a.Details, a.CreationTime, MONTH(a.CreationTime) AS Thang, c_1.company
                          FROM            dbo.AppActivityLog AS a LEFT OUTER JOIN
                                                        (SELECT        u.UserName AS user_name, c.Name AS company
                                                          FROM            dbo.AbpUsers AS u LEFT OUTER JOIN
                                                                                    inv.Companies AS c ON c.Id = u.CompanyId) AS c_1 ON c_1.user_name = a.UserName) AS a_1
WHERE        (Thang = 10)
GO
/****** Object:  Table [dbo].[AbpRoles]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[Name] [nvarchar](256) NOT NULL,
	[NormalizedName] [nvarchar](256) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsStatic] [bit] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[Description] [nvarchar](255) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AbpRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserRoles]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AbpUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ReportPhanQuyenCIA]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ReportPhanQuyenCIA]
AS
SELECT   r.UserId, u.Name, u.Email, o.Name AS role
FROM         dbo.AbpUserRoles AS r LEFT OUTER JOIN
                         dbo.AbpUsers AS u ON u.Id = r.UserId LEFT OUTER JOIN
                         dbo.AbpRoles AS o ON o.Id = r.RoleId
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2024 5:02:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpAuditLogActions]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpAuditLogActions](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[AuditLogId] [uniqueidentifier] NOT NULL,
	[ServiceName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](128) NULL,
	[Parameters] [nvarchar](2000) NULL,
	[ExecutionTime] [datetime2](7) NOT NULL,
	[ExecutionDuration] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
 CONSTRAINT [PK_AbpAuditLogActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpAuditLogs]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpAuditLogs](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](96) NULL,
	[UserId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](256) NULL,
	[TenantId] [uniqueidentifier] NULL,
	[TenantName] [nvarchar](max) NULL,
	[ImpersonatorUserId] [uniqueidentifier] NULL,
	[ImpersonatorTenantId] [uniqueidentifier] NULL,
	[ExecutionTime] [datetime2](7) NOT NULL,
	[ExecutionDuration] [int] NOT NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[ClientName] [nvarchar](128) NULL,
	[ClientId] [nvarchar](64) NULL,
	[CorrelationId] [nvarchar](64) NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[HttpMethod] [nvarchar](16) NULL,
	[Url] [nvarchar](256) NULL,
	[Exceptions] [nvarchar](max) NULL,
	[Comments] [nvarchar](256) NULL,
	[HttpStatusCode] [int] NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpAuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpBackgroundJobs]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpBackgroundJobs](
	[Id] [uniqueidentifier] NOT NULL,
	[JobName] [nvarchar](128) NOT NULL,
	[JobArgs] [nvarchar](max) NOT NULL,
	[TryCount] [smallint] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[NextTryTime] [datetime2](7) NOT NULL,
	[LastTryTime] [datetime2](7) NULL,
	[IsAbandoned] [bit] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpBackgroundJobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpClaimTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpClaimTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Required] [bit] NOT NULL,
	[IsStatic] [bit] NOT NULL,
	[Regex] [nvarchar](512) NULL,
	[RegexDescription] [nvarchar](128) NULL,
	[Description] [nvarchar](256) NULL,
	[ValueType] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpClaimTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityChanges]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityChanges](
	[Id] [uniqueidentifier] NOT NULL,
	[AuditLogId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ChangeTime] [datetime2](7) NOT NULL,
	[ChangeType] [tinyint] NOT NULL,
	[EntityTenantId] [uniqueidentifier] NULL,
	[EntityId] [nvarchar](128) NOT NULL,
	[EntityTypeFullName] [nvarchar](128) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
 CONSTRAINT [PK_AbpEntityChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityPropertyChanges]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityPropertyChanges](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[EntityChangeId] [uniqueidentifier] NOT NULL,
	[NewValue] [nvarchar](512) NULL,
	[OriginalValue] [nvarchar](512) NULL,
	[PropertyName] [nvarchar](128) NOT NULL,
	[PropertyTypeFullName] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_AbpEntityPropertyChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpFeatureValues]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpFeatureValues](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](128) NOT NULL,
	[ProviderName] [nvarchar](64) NULL,
	[ProviderKey] [nvarchar](64) NULL,
 CONSTRAINT [PK_AbpFeatureValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpLinkUsers]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpLinkUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[SourceUserId] [uniqueidentifier] NOT NULL,
	[SourceTenantId] [uniqueidentifier] NULL,
	[TargetUserId] [uniqueidentifier] NOT NULL,
	[TargetTenantId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AbpLinkUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpOrganizationUnitRoles]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpOrganizationUnitRoles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[OrganizationUnitId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AbpOrganizationUnitRoles] PRIMARY KEY CLUSTERED 
(
	[OrganizationUnitId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpOrganizationUnits]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpOrganizationUnits](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Code] [nvarchar](95) NOT NULL,
	[DisplayName] [nvarchar](128) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpOrganizationUnits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpPermissionGrants]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpPermissionGrants](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[ProviderName] [nvarchar](64) NOT NULL,
	[ProviderKey] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_AbpPermissionGrants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpRoleClaims]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpRoleClaims](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ClaimType] [nvarchar](256) NOT NULL,
	[ClaimValue] [nvarchar](1024) NULL,
 CONSTRAINT [PK_AbpRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpSecurityLogs]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpSecurityLogs](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ApplicationName] [nvarchar](96) NULL,
	[Identity] [nvarchar](96) NULL,
	[Action] [nvarchar](96) NULL,
	[UserId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](256) NULL,
	[TenantName] [nvarchar](64) NULL,
	[ClientId] [nvarchar](64) NULL,
	[CorrelationId] [nvarchar](64) NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpSecurityLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpSettings]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpSettings](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](2048) NOT NULL,
	[ProviderName] [nvarchar](64) NULL,
	[ProviderKey] [nvarchar](64) NULL,
 CONSTRAINT [PK_AbpSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpTenantConnectionStrings]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpTenantConnectionStrings](
	[TenantId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Value] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_AbpTenantConnectionStrings] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpTenants]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpTenants](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpTenants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserClaims]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserClaims](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ClaimType] [nvarchar](256) NOT NULL,
	[ClaimValue] [nvarchar](1024) NULL,
 CONSTRAINT [PK_AbpUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserLogins]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserLogins](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](64) NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ProviderKey] [nvarchar](196) NOT NULL,
	[ProviderDisplayName] [nvarchar](128) NULL,
 CONSTRAINT [PK_AbpUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserOrganizationUnits]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserOrganizationUnits](
	[UserId] [uniqueidentifier] NOT NULL,
	[OrganizationUnitId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AbpUserOrganizationUnits] PRIMARY KEY CLUSTERED 
(
	[OrganizationUnitId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserTokens]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](64) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AbpUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppEmailDatas]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppEmailDatas](
	[Id] [uniqueidentifier] NOT NULL,
	[ToEmail] [nvarchar](255) NULL,
	[Subject] [nvarchar](512) NULL,
	[Body] [ntext] NULL,
	[Status] [int] NOT NULL,
	[Exception] [ntext] NULL,
	[SentDate] [datetime2](7) NULL,
	[Retry] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AppEmailDatas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppSystemSettings]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSystemSettings](
	[Id] [uniqueidentifier] NOT NULL,
	[Value] [nvarchar](2048) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_AppSystemSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerApiResourceClaims]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerApiResourceClaims](
	[Type] [nvarchar](200) NOT NULL,
	[ApiResourceId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IdentityServerApiResourceClaims] PRIMARY KEY CLUSTERED 
(
	[ApiResourceId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerApiResourceProperties]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerApiResourceProperties](
	[ApiResourceId] [uniqueidentifier] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_IdentityServerApiResourceProperties] PRIMARY KEY CLUSTERED 
(
	[ApiResourceId] ASC,
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerApiResources]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerApiResources](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Enabled] [bit] NOT NULL,
	[AllowedAccessTokenSigningAlgorithms] [nvarchar](100) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_IdentityServerApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerApiResourceScopes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerApiResourceScopes](
	[ApiResourceId] [uniqueidentifier] NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_IdentityServerApiResourceScopes] PRIMARY KEY CLUSTERED 
(
	[ApiResourceId] ASC,
	[Scope] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerApiResourceSecrets]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerApiResourceSecrets](
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[ApiResourceId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Expiration] [datetime2](7) NULL,
 CONSTRAINT [PK_IdentityServerApiResourceSecrets] PRIMARY KEY CLUSTERED 
(
	[ApiResourceId] ASC,
	[Type] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerApiScopeClaims]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerApiScopeClaims](
	[Type] [nvarchar](200) NOT NULL,
	[ApiScopeId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IdentityServerApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[ApiScopeId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerApiScopeProperties]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerApiScopeProperties](
	[ApiScopeId] [uniqueidentifier] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_IdentityServerApiScopeProperties] PRIMARY KEY CLUSTERED 
(
	[ApiScopeId] ASC,
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerApiScopes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerApiScopes](
	[Id] [uniqueidentifier] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_IdentityServerApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClientClaims]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClientClaims](
	[ClientId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_IdentityServerClientClaims] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[Type] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClientCorsOrigins]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClientCorsOrigins](
	[ClientId] [uniqueidentifier] NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_IdentityServerClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[Origin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClientGrantTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClientGrantTypes](
	[ClientId] [uniqueidentifier] NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_IdentityServerClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[GrantType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClientIdPRestrictions]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClientIdPRestrictions](
	[ClientId] [uniqueidentifier] NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_IdentityServerClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[Provider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClientPostLogoutRedirectUris]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClientPostLogoutRedirectUris](
	[ClientId] [uniqueidentifier] NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_IdentityServerClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[PostLogoutRedirectUri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClientProperties]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClientProperties](
	[ClientId] [uniqueidentifier] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_IdentityServerClientProperties] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClientRedirectUris]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClientRedirectUris](
	[ClientId] [uniqueidentifier] NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_IdentityServerClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[RedirectUri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClients]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClients](
	[Id] [uniqueidentifier] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[Enabled] [bit] NOT NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[RequireConsent] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[RequireRequestObject] [bit] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AllowedIdentityTokenSigningAlgorithms] [nvarchar](100) NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ConsentLifetime] [int] NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[UserSsoLifetime] [int] NULL,
	[UserCodeType] [nvarchar](100) NULL,
	[DeviceCodeLifetime] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_IdentityServerClients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClientScopes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClientScopes](
	[ClientId] [uniqueidentifier] NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_IdentityServerClientScopes] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[Scope] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerClientSecrets]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerClientSecrets](
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[ClientId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Expiration] [datetime2](7) NULL,
 CONSTRAINT [PK_IdentityServerClientSecrets] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[Type] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerDeviceFlowCodes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerDeviceFlowCodes](
	[Id] [uniqueidentifier] NOT NULL,
	[DeviceCode] [nvarchar](200) NOT NULL,
	[UserCode] [nvarchar](200) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Expiration] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_IdentityServerDeviceFlowCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerIdentityResourceClaims]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerIdentityResourceClaims](
	[Type] [nvarchar](200) NOT NULL,
	[IdentityResourceId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IdentityServerIdentityResourceClaims] PRIMARY KEY CLUSTERED 
(
	[IdentityResourceId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerIdentityResourceProperties]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerIdentityResourceProperties](
	[IdentityResourceId] [uniqueidentifier] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_IdentityServerIdentityResourceProperties] PRIMARY KEY CLUSTERED 
(
	[IdentityResourceId] ASC,
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerIdentityResources]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerIdentityResources](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Enabled] [bit] NOT NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_IdentityServerIdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityServerPersistedGrants]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityServerPersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[ConsumedTime] [datetime2](7) NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_IdentityServerPersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[AbpBackgroundJobs]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[AbpBackgroundJobs](
	[Id] [uniqueidentifier] NOT NULL,
	[JobName] [nvarchar](128) NOT NULL,
	[JobArgs] [nvarchar](max) NOT NULL,
	[TryCount] [smallint] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[NextTryTime] [datetime2](7) NOT NULL,
	[LastTryTime] [datetime2](7) NULL,
	[IsAbandoned] [bit] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpBackgroundJobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[BookingChannelTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[BookingChannelTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingId] [uniqueidentifier] NULL,
	[ChannelTypeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_BookingChannelTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[BookingDetails]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[BookingDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingId] [uniqueidentifier] NULL,
	[ChannelNameId] [uniqueidentifier] NULL,
	[Date] [datetime2](7) NULL,
	[Quantity] [int] NOT NULL,
	[Pricing] [decimal](18, 2) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[TotalInventoryDayBookingTypeDayId] [uniqueidentifier] NULL,
	[InventoryDistributionId] [uniqueidentifier] NULL,
	[IsTakeInventory] [bit] NOT NULL,
	[TotalInventoryDayInventoryId] [uniqueidentifier] NULL,
	[TotalInventoryMonthId] [uniqueidentifier] NULL,
	[BookingPercentDiscountId] [uniqueidentifier] NULL,
	[TotalOriginalAmount] [decimal](18, 2) NOT NULL,
	[BookingPercentBlockId] [uniqueidentifier] NULL,
	[RateCardId] [uniqueidentifier] NULL,
	[TotalSuggestAmount] [decimal](18, 2) NOT NULL,
	[DiscountPricing] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_BookingDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[BookingPercentBlocks]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[BookingPercentBlocks](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[PercentBlock] [float] NOT NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[PlatformId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_BookingPercentBlocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[BookingPercentDiscounts]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[BookingPercentDiscounts](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1024) NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
	[ProjectId] [uniqueidentifier] NULL,
	[PercentBlock] [float] NOT NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[PlatformId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_BookingPercentDiscounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[Bookings]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[Bookings](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](256) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](512) NULL,
	[ContractNumber] [nvarchar](256) NULL,
	[ProjectId] [uniqueidentifier] NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
	[PlatformId] [uniqueidentifier] NULL,
	[InventoryFormId] [uniqueidentifier] NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[ParentId] [uniqueidentifier] NULL,
	[DefinitionOfUnit] [nvarchar](512) NULL,
	[Injury] [bit] NOT NULL,
	[MaterialFormat] [nvarchar](512) NULL,
	[Quantity] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Unit] [nvarchar](256) NULL,
	[ApprovalDate] [datetime2](7) NULL,
	[ApproverId] [uniqueidentifier] NULL,
	[RequesterId] [uniqueidentifier] NULL,
	[RejectDeploymentComment] [nvarchar](1024) NULL,
	[ReviewDate] [datetime2](7) NULL,
	[ReviewerId] [uniqueidentifier] NULL,
	[Caption] [nvarchar](512) NULL,
	[Material] [nvarchar](512) NULL,
	[CancelReviewDate] [datetime2](7) NULL,
	[CancelReviewerId] [uniqueidentifier] NULL,
	[RejectDate] [datetime2](7) NULL,
	[RejectorId] [uniqueidentifier] NULL,
	[ApprovalDeploymentDate] [datetime2](7) NULL,
	[ApproverDeploymentId] [uniqueidentifier] NULL,
	[RejectDeploymentDate] [datetime2](7) NULL,
	[RejectorDeploymentId] [uniqueidentifier] NULL,
	[ApprovalDeliveryDate] [datetime2](7) NULL,
	[ApproverDeliveryId] [uniqueidentifier] NULL,
	[ApprovalComment] [nvarchar](1024) NULL,
	[ApprovalDeliveryComment] [nvarchar](max) NULL,
	[ApprovalDeploymentComment] [nvarchar](1024) NULL,
	[RejectComment] [nvarchar](1024) NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[BookingSupporters]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[BookingSupporters](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingId] [uniqueidentifier] NULL,
	[SupporterId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_BookingSupporters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[BookingTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[BookingTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Note] [nvarchar](512) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_BookingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[ChannelIntermediaries]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[ChannelIntermediaries](
	[Id] [uniqueidentifier] NOT NULL,
	[ChannelTypeId] [uniqueidentifier] NULL,
	[ChannelNameId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ChannelIntermediaries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[ChannelNames]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[ChannelNames](
	[Id] [uniqueidentifier] NOT NULL,
	[PlatformId] [uniqueidentifier] NULL,
	[Note] [nvarchar](512) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[Code_1] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChannelNames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[ChannelTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[ChannelTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Note] [nvarchar](512) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Code_1] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChannelTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[EmailTokens]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[EmailTokens](
	[Id] [uniqueidentifier] NOT NULL,
	[Action] [int] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[EntityId] [uniqueidentifier] NULL,
	[Status] [int] NOT NULL,
	[UserCreate] [uniqueidentifier] NULL,
	[DateCreate] [datetime2](7) NULL,
	[Token] [uniqueidentifier] NULL,
 CONSTRAINT [PK_EmailTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[InventoryDistributionBookingTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[InventoryDistributionBookingTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
	[InventoryDistributionId] [uniqueidentifier] NULL,
	[Percent] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_InventoryDistributionBookingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[InventoryDistributionRequestBookingTypeOlds]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[InventoryDistributionRequestBookingTypeOlds](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
	[InventoryDistributionRequestId] [uniqueidentifier] NULL,
	[PercentOld] [decimal](18, 2) NOT NULL,
	[QuantityOld] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_InventoryDistributionRequestBookingTypeOlds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[InventoryDistributionRequestBookingTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[InventoryDistributionRequestBookingTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
	[InventoryDistributionRequestId] [uniqueidentifier] NULL,
	[Percent] [decimal](18, 2) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_InventoryDistributionRequestBookingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[InventoryDistributionRequestChannelTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[InventoryDistributionRequestChannelTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[InventoryDistributionRequestId] [uniqueidentifier] NULL,
	[ChannelTypeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_InventoryDistributionRequestChannelTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[InventoryDistributionRequests]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[InventoryDistributionRequests](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[PlatformId] [uniqueidentifier] NULL,
	[ChannelNameId] [uniqueidentifier] NULL,
	[InventoryFormId] [uniqueidentifier] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[TotalInventoryMonthId] [uniqueidentifier] NULL,
	[SelectDate] [datetime2](7) NULL,
	[Status] [int] NULL,
	[IsDecrease] [int] NULL,
	[Note] [nvarchar](512) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[UserApproveId] [uniqueidentifier] NULL,
	[UserApproveName] [nvarchar](max) NULL,
	[ApproveDate] [datetime2](7) NULL,
 CONSTRAINT [PK_InventoryDistributionRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[InventoryDistributions]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[InventoryDistributions](
	[Id] [uniqueidentifier] NOT NULL,
	[PlatformId] [uniqueidentifier] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Note] [nvarchar](512) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Code] [nvarchar](256) NULL,
 CONSTRAINT [PK_InventoryDistributions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[InventoryFormInventoryDistributions]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[InventoryFormInventoryDistributions](
	[Id] [uniqueidentifier] NOT NULL,
	[InventoryDistributionId] [uniqueidentifier] NULL,
	[InventoryFormId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_InventoryFormInventoryDistributions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[InventoryForms]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[InventoryForms](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](50) NULL,
	[Unit] [nvarchar](256) NULL,
	[DefinitionOfUnit] [nvarchar](512) NULL,
	[MaterialFormat] [nvarchar](512) NULL,
	[PlatformId] [uniqueidentifier] NULL,
	[Injury] [bit] NOT NULL,
	[Status] [int] NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Note] [nvarchar](512) NULL,
 CONSTRAINT [PK_InventoryForms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[PercentBlockChannelNames]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[PercentBlockChannelNames](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingPercentBlockId] [uniqueidentifier] NULL,
	[ChannelNameId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PercentBlockChannelNames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[PercentBlockInventoryForms]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[PercentBlockInventoryForms](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingPercentBlockId] [uniqueidentifier] NULL,
	[InventoryFormId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PercentBlockInventoryForms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[PercentDiscountInventoryForms]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[PercentDiscountInventoryForms](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingPercentDiscountId] [uniqueidentifier] NULL,
	[InventoryFormId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PercentDiscountInventoryForms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[Platforms]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[Platforms](
	[Id] [uniqueidentifier] NOT NULL,
	[Note] [nvarchar](512) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Code_1] [nvarchar](50) NULL,
 CONSTRAINT [PK_Platforms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[Projects]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[Projects](
	[Id] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Note] [nvarchar](512) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[CompanyId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[RateCardBookingTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[RateCardBookingTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[RateCardId] [uniqueidentifier] NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_RateCardBookingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[RateCards]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[RateCards](
	[Id] [uniqueidentifier] NOT NULL,
	[InventoryFormId] [uniqueidentifier] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[ChannelNameId] [uniqueidentifier] NULL,
	[RateCardValue] [decimal](18, 2) NOT NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_RateCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[TotalInventoryDayBookingTypeAvrs]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[TotalInventoryDayBookingTypeAvrs](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalInventoryMonthId] [uniqueidentifier] NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
	[QuantityAverageBookingType] [decimal](18, 2) NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TotalInventoryDayBookingTypeAvrs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[TotalInventoryDayBookingTypeDays]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[TotalInventoryDayBookingTypeDays](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalInventoryDayInventoryId] [uniqueidentifier] NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[QuantityUsed] [decimal](18, 2) NOT NULL,
	[Percent] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TotalInventoryDayBookingTypeDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[TotalInventoryDayInventories]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[TotalInventoryDayInventories](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalInventoryMonthId] [uniqueidentifier] NULL,
	[Quantiy] [decimal](18, 2) NOT NULL,
	[Date] [datetime2](7) NULL,
	[IsExistData] [bit] NOT NULL,
	[IsUseInventoryDistribution] [bit] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[QuantiyUsed] [decimal](18, 2) NOT NULL,
	[InventoryFormId] [uniqueidentifier] NULL,
	[InventoryDistributionId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TotalInventoryDayInventories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[TotalInventoryMonthBookingTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[TotalInventoryMonthBookingTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalInventoryMonthId] [uniqueidentifier] NULL,
	[BookingTypeId] [uniqueidentifier] NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TotalInventoryMonthBookingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[TotalInventoryMonthChannelTypes]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[TotalInventoryMonthChannelTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalInventoryMonthId] [uniqueidentifier] NULL,
	[ChannelTypeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TotalInventoryMonthChannelTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[TotalInventoryMonthInventoryDistributions]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[TotalInventoryMonthInventoryDistributions](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalInventoryMonthId] [uniqueidentifier] NULL,
	[InventoryDistributionId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TotalInventoryMonthInventoryDistributions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [inv].[TotalInventoryMonths]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[TotalInventoryMonths](
	[Id] [uniqueidentifier] NOT NULL,
	[PlatformId] [uniqueidentifier] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[ChannelNameId] [uniqueidentifier] NULL,
	[InventoryFormId] [uniqueidentifier] NULL,
	[Injury] [bit] NOT NULL,
	[Unit] [nvarchar](max) NULL,
	[Note] [nvarchar](512) NULL,
	[Pricing] [decimal](18, 2) NOT NULL,
	[Month] [datetime2](7) NULL,
	[Status] [int] NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[QuantityInventoryDay] [decimal](18, 2) NOT NULL,
	[QuantityInventoryMonth] [decimal](18, 2) NOT NULL,
	[ActualInventory] [decimal](18, 2) NOT NULL,
	[PercentActualInventory] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TotalInventoryMonths] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [inv].[UserCompanys]    Script Date: 4/25/2024 5:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [inv].[UserCompanys](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[CreationTime] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletionTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
 CONSTRAINT [PK_UserCompanys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpAuditLogActions_AuditLogId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpAuditLogActions_AuditLogId] ON [dbo].[AbpAuditLogActions]
(
	[AuditLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpAuditLogActions_TenantId_ServiceName_MethodName_ExecutionTime]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpAuditLogActions_TenantId_ServiceName_MethodName_ExecutionTime] ON [dbo].[AbpAuditLogActions]
(
	[TenantId] ASC,
	[ServiceName] ASC,
	[MethodName] ASC,
	[ExecutionTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpAuditLogs_TenantId_ExecutionTime]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpAuditLogs_TenantId_ExecutionTime] ON [dbo].[AbpAuditLogs]
(
	[TenantId] ASC,
	[ExecutionTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpAuditLogs_TenantId_UserId_ExecutionTime]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpAuditLogs_TenantId_UserId_ExecutionTime] ON [dbo].[AbpAuditLogs]
(
	[TenantId] ASC,
	[UserId] ASC,
	[ExecutionTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpBackgroundJobs_IsAbandoned_NextTryTime]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpBackgroundJobs_IsAbandoned_NextTryTime] ON [dbo].[AbpBackgroundJobs]
(
	[IsAbandoned] ASC,
	[NextTryTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpEntityChanges_AuditLogId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpEntityChanges_AuditLogId] ON [dbo].[AbpEntityChanges]
(
	[AuditLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpEntityChanges_TenantId_EntityTypeFullName_EntityId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpEntityChanges_TenantId_EntityTypeFullName_EntityId] ON [dbo].[AbpEntityChanges]
(
	[TenantId] ASC,
	[EntityTypeFullName] ASC,
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpEntityPropertyChanges_EntityChangeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpEntityPropertyChanges_EntityChangeId] ON [dbo].[AbpEntityPropertyChanges]
(
	[EntityChangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpFeatureValues_Name_ProviderName_ProviderKey]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpFeatureValues_Name_ProviderName_ProviderKey] ON [dbo].[AbpFeatureValues]
(
	[Name] ASC,
	[ProviderName] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpLinkUsers_SourceUserId_SourceTenantId_TargetUserId_TargetTenantId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AbpLinkUsers_SourceUserId_SourceTenantId_TargetUserId_TargetTenantId] ON [dbo].[AbpLinkUsers]
(
	[SourceUserId] ASC,
	[SourceTenantId] ASC,
	[TargetUserId] ASC,
	[TargetTenantId] ASC
)
WHERE ([SourceTenantId] IS NOT NULL AND [TargetTenantId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpOrganizationUnitRoles_RoleId_OrganizationUnitId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpOrganizationUnitRoles_RoleId_OrganizationUnitId] ON [dbo].[AbpOrganizationUnitRoles]
(
	[RoleId] ASC,
	[OrganizationUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpOrganizationUnits_Code]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpOrganizationUnits_Code] ON [dbo].[AbpOrganizationUnits]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpOrganizationUnits_ParentId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpOrganizationUnits_ParentId] ON [dbo].[AbpOrganizationUnits]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpPermissionGrants_Name_ProviderName_ProviderKey]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpPermissionGrants_Name_ProviderName_ProviderKey] ON [dbo].[AbpPermissionGrants]
(
	[Name] ASC,
	[ProviderName] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpRoleClaims_RoleId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpRoleClaims_RoleId] ON [dbo].[AbpRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpRoles_NormalizedName]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpRoles_NormalizedName] ON [dbo].[AbpRoles]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpSecurityLogs_TenantId_Action]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpSecurityLogs_TenantId_Action] ON [dbo].[AbpSecurityLogs]
(
	[TenantId] ASC,
	[Action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpSecurityLogs_TenantId_ApplicationName]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpSecurityLogs_TenantId_ApplicationName] ON [dbo].[AbpSecurityLogs]
(
	[TenantId] ASC,
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpSecurityLogs_TenantId_Identity]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpSecurityLogs_TenantId_Identity] ON [dbo].[AbpSecurityLogs]
(
	[TenantId] ASC,
	[Identity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpSecurityLogs_TenantId_UserId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpSecurityLogs_TenantId_UserId] ON [dbo].[AbpSecurityLogs]
(
	[TenantId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpSettings_Name_ProviderName_ProviderKey]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpSettings_Name_ProviderName_ProviderKey] ON [dbo].[AbpSettings]
(
	[Name] ASC,
	[ProviderName] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpTenants_Name]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpTenants_Name] ON [dbo].[AbpTenants]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserClaims_UserId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserClaims_UserId] ON [dbo].[AbpUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUserLogins_LoginProvider_ProviderKey]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserLogins_LoginProvider_ProviderKey] ON [dbo].[AbpUserLogins]
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserOrganizationUnits_UserId_OrganizationUnitId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserOrganizationUnits_UserId_OrganizationUnitId] ON [dbo].[AbpUserOrganizationUnits]
(
	[UserId] ASC,
	[OrganizationUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserRoles_RoleId_UserId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserRoles_RoleId_UserId] ON [dbo].[AbpUserRoles]
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUsers_Email]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUsers_Email] ON [dbo].[AbpUsers]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUsers_NormalizedEmail]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUsers_NormalizedEmail] ON [dbo].[AbpUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUsers_NormalizedUserName]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUsers_NormalizedUserName] ON [dbo].[AbpUsers]
(
	[NormalizedUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUsers_UserName]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUsers_UserName] ON [dbo].[AbpUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityServerClients_ClientId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityServerClients_ClientId] ON [dbo].[IdentityServerClients]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityServerDeviceFlowCodes_DeviceCode]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdentityServerDeviceFlowCodes_DeviceCode] ON [dbo].[IdentityServerDeviceFlowCodes]
(
	[DeviceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityServerDeviceFlowCodes_Expiration]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityServerDeviceFlowCodes_Expiration] ON [dbo].[IdentityServerDeviceFlowCodes]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityServerDeviceFlowCodes_UserCode]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityServerDeviceFlowCodes_UserCode] ON [dbo].[IdentityServerDeviceFlowCodes]
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityServerPersistedGrants_Expiration]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityServerPersistedGrants_Expiration] ON [dbo].[IdentityServerPersistedGrants]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityServerPersistedGrants_SubjectId_ClientId_Type]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityServerPersistedGrants_SubjectId_ClientId_Type] ON [dbo].[IdentityServerPersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityServerPersistedGrants_SubjectId_SessionId_Type]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityServerPersistedGrants_SubjectId_SessionId_Type] ON [dbo].[IdentityServerPersistedGrants]
(
	[SubjectId] ASC,
	[SessionId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpBackgroundJobs_IsAbandoned_NextTryTime]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpBackgroundJobs_IsAbandoned_NextTryTime] ON [inv].[AbpBackgroundJobs]
(
	[IsAbandoned] ASC,
	[NextTryTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingChannelTypes_BookingId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingChannelTypes_BookingId] ON [inv].[BookingChannelTypes]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingChannelTypes_ChannelTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingChannelTypes_ChannelTypeId] ON [inv].[BookingChannelTypes]
(
	[ChannelTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_BookingId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_BookingId] ON [inv].[BookingDetails]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_BookingPercentBlockId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_BookingPercentBlockId] ON [inv].[BookingDetails]
(
	[BookingPercentBlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_BookingPercentDiscountId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_BookingPercentDiscountId] ON [inv].[BookingDetails]
(
	[BookingPercentDiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_ChannelNameId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_ChannelNameId] ON [inv].[BookingDetails]
(
	[ChannelNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_Date]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_Date] ON [inv].[BookingDetails]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_InventoryDistributionId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_InventoryDistributionId] ON [inv].[BookingDetails]
(
	[InventoryDistributionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_RateCardId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_RateCardId] ON [inv].[BookingDetails]
(
	[RateCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_TotalInventoryDayBookingTypeDayId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_TotalInventoryDayBookingTypeDayId] ON [inv].[BookingDetails]
(
	[TotalInventoryDayBookingTypeDayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_TotalInventoryDayInventoryId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_TotalInventoryDayInventoryId] ON [inv].[BookingDetails]
(
	[TotalInventoryDayInventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingDetails_TotalInventoryMonthId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingDetails_TotalInventoryMonthId] ON [inv].[BookingDetails]
(
	[TotalInventoryMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingPercentBlocks_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingPercentBlocks_BookingTypeId] ON [inv].[BookingPercentBlocks]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingPercentBlocks_CompanyId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingPercentBlocks_CompanyId] ON [inv].[BookingPercentBlocks]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingPercentBlocks_PlatformId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingPercentBlocks_PlatformId] ON [inv].[BookingPercentBlocks]
(
	[PlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingPercentDiscounts_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingPercentDiscounts_BookingTypeId] ON [inv].[BookingPercentDiscounts]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingPercentDiscounts_PlatformId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingPercentDiscounts_PlatformId] ON [inv].[BookingPercentDiscounts]
(
	[PlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingPercentDiscounts_ProjectId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingPercentDiscounts_ProjectId] ON [inv].[BookingPercentDiscounts]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_BookingTypeId] ON [inv].[Bookings]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_CreationTime]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_CreationTime] ON [inv].[Bookings]
(
	[CreationTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_InventoryFormId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_InventoryFormId] ON [inv].[Bookings]
(
	[InventoryFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_ParentId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_ParentId] ON [inv].[Bookings]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_PlatformId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_PlatformId] ON [inv].[Bookings]
(
	[PlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_ProjectId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_ProjectId] ON [inv].[Bookings]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_RequesterId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_RequesterId] ON [inv].[Bookings]
(
	[RequesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_Status]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_Status] ON [inv].[Bookings]
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingSupporters_BookingId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingSupporters_BookingId] ON [inv].[BookingSupporters]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingSupporters_SupporterId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookingSupporters_SupporterId] ON [inv].[BookingSupporters]
(
	[SupporterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChannelIntermediaries_ChannelNameId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChannelIntermediaries_ChannelNameId] ON [inv].[ChannelIntermediaries]
(
	[ChannelNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChannelIntermediaries_ChannelTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChannelIntermediaries_ChannelTypeId] ON [inv].[ChannelIntermediaries]
(
	[ChannelTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChannelNames_CompanyId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChannelNames_CompanyId] ON [inv].[ChannelNames]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChannelNames_PlatformId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChannelNames_PlatformId] ON [inv].[ChannelNames]
(
	[PlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionBookingTypes_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionBookingTypes_BookingTypeId] ON [inv].[InventoryDistributionBookingTypes]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionBookingTypes_InventoryDistributionId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionBookingTypes_InventoryDistributionId] ON [inv].[InventoryDistributionBookingTypes]
(
	[InventoryDistributionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequestBookingTypeOlds_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequestBookingTypeOlds_BookingTypeId] ON [inv].[InventoryDistributionRequestBookingTypeOlds]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequestBookingTypeOlds_InventoryDistributionRequestId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequestBookingTypeOlds_InventoryDistributionRequestId] ON [inv].[InventoryDistributionRequestBookingTypeOlds]
(
	[InventoryDistributionRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequestBookingTypes_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequestBookingTypes_BookingTypeId] ON [inv].[InventoryDistributionRequestBookingTypes]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequestBookingTypes_InventoryDistributionRequestId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequestBookingTypes_InventoryDistributionRequestId] ON [inv].[InventoryDistributionRequestBookingTypes]
(
	[InventoryDistributionRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequestChannelTypes_ChannelTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequestChannelTypes_ChannelTypeId] ON [inv].[InventoryDistributionRequestChannelTypes]
(
	[ChannelTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequestChannelTypes_InventoryDistributionRequestId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequestChannelTypes_InventoryDistributionRequestId] ON [inv].[InventoryDistributionRequestChannelTypes]
(
	[InventoryDistributionRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequests_ChannelNameId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequests_ChannelNameId] ON [inv].[InventoryDistributionRequests]
(
	[ChannelNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequests_CompanyId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequests_CompanyId] ON [inv].[InventoryDistributionRequests]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequests_InventoryFormId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequests_InventoryFormId] ON [inv].[InventoryDistributionRequests]
(
	[InventoryFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequests_PlatformId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequests_PlatformId] ON [inv].[InventoryDistributionRequests]
(
	[PlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributionRequests_TotalInventoryMonthId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributionRequests_TotalInventoryMonthId] ON [inv].[InventoryDistributionRequests]
(
	[TotalInventoryMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributions_CompanyId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributions_CompanyId] ON [inv].[InventoryDistributions]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributions_EndDate]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributions_EndDate] ON [inv].[InventoryDistributions]
(
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributions_PlatformId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributions_PlatformId] ON [inv].[InventoryDistributions]
(
	[PlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryDistributions_StartDate]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDistributions_StartDate] ON [inv].[InventoryDistributions]
(
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryFormInventoryDistributions_InventoryDistributionId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryFormInventoryDistributions_InventoryDistributionId] ON [inv].[InventoryFormInventoryDistributions]
(
	[InventoryDistributionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryFormInventoryDistributions_InventoryFormId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryFormInventoryDistributions_InventoryFormId] ON [inv].[InventoryFormInventoryDistributions]
(
	[InventoryFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryForms_PlatformId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryForms_PlatformId] ON [inv].[InventoryForms]
(
	[PlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PercentBlockChannelNames_BookingPercentBlockId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PercentBlockChannelNames_BookingPercentBlockId] ON [inv].[PercentBlockChannelNames]
(
	[BookingPercentBlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PercentBlockChannelNames_ChannelNameId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PercentBlockChannelNames_ChannelNameId] ON [inv].[PercentBlockChannelNames]
(
	[ChannelNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PercentBlockInventoryForms_BookingPercentBlockId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PercentBlockInventoryForms_BookingPercentBlockId] ON [inv].[PercentBlockInventoryForms]
(
	[BookingPercentBlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PercentBlockInventoryForms_InventoryFormId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PercentBlockInventoryForms_InventoryFormId] ON [inv].[PercentBlockInventoryForms]
(
	[InventoryFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PercentDiscountInventoryForms_BookingPercentDiscountId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PercentDiscountInventoryForms_BookingPercentDiscountId] ON [inv].[PercentDiscountInventoryForms]
(
	[BookingPercentDiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PercentDiscountInventoryForms_InventoryFormId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PercentDiscountInventoryForms_InventoryFormId] ON [inv].[PercentDiscountInventoryForms]
(
	[InventoryFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Projects_CompanyId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Projects_CompanyId] ON [inv].[Projects]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RateCardBookingTypes_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_RateCardBookingTypes_BookingTypeId] ON [inv].[RateCardBookingTypes]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RateCardBookingTypes_RateCardId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_RateCardBookingTypes_RateCardId] ON [inv].[RateCardBookingTypes]
(
	[RateCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RateCards_ChannelNameId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_RateCards_ChannelNameId] ON [inv].[RateCards]
(
	[ChannelNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RateCards_CompanyId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_RateCards_CompanyId] ON [inv].[RateCards]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RateCards_InventoryFormId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_RateCards_InventoryFormId] ON [inv].[RateCards]
(
	[InventoryFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryDayBookingTypeAvrs_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryDayBookingTypeAvrs_BookingTypeId] ON [inv].[TotalInventoryDayBookingTypeAvrs]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryDayBookingTypeAvrs_TotalInventoryMonthId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryDayBookingTypeAvrs_TotalInventoryMonthId] ON [inv].[TotalInventoryDayBookingTypeAvrs]
(
	[TotalInventoryMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryDayBookingTypeDays_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryDayBookingTypeDays_BookingTypeId] ON [inv].[TotalInventoryDayBookingTypeDays]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryDayBookingTypeDays_TotalInventoryDayInventoryId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryDayBookingTypeDays_TotalInventoryDayInventoryId] ON [inv].[TotalInventoryDayBookingTypeDays]
(
	[TotalInventoryDayInventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryDayInventories_Date]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryDayInventories_Date] ON [inv].[TotalInventoryDayInventories]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryDayInventories_InventoryDistributionId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryDayInventories_InventoryDistributionId] ON [inv].[TotalInventoryDayInventories]
(
	[InventoryDistributionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryDayInventories_InventoryFormId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryDayInventories_InventoryFormId] ON [inv].[TotalInventoryDayInventories]
(
	[InventoryFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryDayInventories_TotalInventoryMonthId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryDayInventories_TotalInventoryMonthId] ON [inv].[TotalInventoryDayInventories]
(
	[TotalInventoryMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonthBookingTypes_BookingTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonthBookingTypes_BookingTypeId] ON [inv].[TotalInventoryMonthBookingTypes]
(
	[BookingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonthBookingTypes_TotalInventoryMonthId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonthBookingTypes_TotalInventoryMonthId] ON [inv].[TotalInventoryMonthBookingTypes]
(
	[TotalInventoryMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonthChannelTypes_ChannelTypeId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonthChannelTypes_ChannelTypeId] ON [inv].[TotalInventoryMonthChannelTypes]
(
	[ChannelTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonthChannelTypes_TotalInventoryMonthId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonthChannelTypes_TotalInventoryMonthId] ON [inv].[TotalInventoryMonthChannelTypes]
(
	[TotalInventoryMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonthInventoryDistributions_InventoryDistributionId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonthInventoryDistributions_InventoryDistributionId] ON [inv].[TotalInventoryMonthInventoryDistributions]
(
	[InventoryDistributionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonthInventoryDistributions_TotalInventoryMonthId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonthInventoryDistributions_TotalInventoryMonthId] ON [inv].[TotalInventoryMonthInventoryDistributions]
(
	[TotalInventoryMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonths_ChannelNameId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonths_ChannelNameId] ON [inv].[TotalInventoryMonths]
(
	[ChannelNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonths_CompanyId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonths_CompanyId] ON [inv].[TotalInventoryMonths]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonths_InventoryFormId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonths_InventoryFormId] ON [inv].[TotalInventoryMonths]
(
	[InventoryFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TotalInventoryMonths_PlatformId]    Script Date: 4/25/2024 5:02:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_TotalInventoryMonths_PlatformId] ON [inv].[TotalInventoryMonths]
(
	[PlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AbpBackgroundJobs] ADD  DEFAULT (CONVERT([smallint],(0))) FOR [TryCount]
GO
ALTER TABLE [dbo].[AbpBackgroundJobs] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsAbandoned]
GO
ALTER TABLE [dbo].[AbpBackgroundJobs] ADD  DEFAULT (CONVERT([tinyint],(15))) FOR [Priority]
GO
ALTER TABLE [dbo].[AbpOrganizationUnits] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AbpRoles] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreationTime]
GO
ALTER TABLE [dbo].[AbpTenants] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsExternal]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [PhoneNumberConfirmed]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [TwoFactorEnabled]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [LockoutEnabled]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT ((0)) FOR [AccessFailedCount]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AppActivityLog] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AppEmailDatas] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AppSystemSettings] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[IdentityServerApiResources] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[IdentityServerApiScopes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[IdentityServerClients] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[IdentityServerIdentityResources] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[AbpBackgroundJobs] ADD  DEFAULT (CONVERT([smallint],(0))) FOR [TryCount]
GO
ALTER TABLE [inv].[AbpBackgroundJobs] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsAbandoned]
GO
ALTER TABLE [inv].[AbpBackgroundJobs] ADD  DEFAULT (CONVERT([tinyint],(15))) FOR [Priority]
GO
ALTER TABLE [inv].[BookingDetails] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[BookingDetails] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsTakeInventory]
GO
ALTER TABLE [inv].[BookingDetails] ADD  DEFAULT ((0.0)) FOR [TotalOriginalAmount]
GO
ALTER TABLE [inv].[BookingDetails] ADD  DEFAULT ((0.0)) FOR [TotalSuggestAmount]
GO
ALTER TABLE [inv].[BookingDetails] ADD  DEFAULT ((0.0)) FOR [DiscountPricing]
GO
ALTER TABLE [inv].[BookingPercentBlocks] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[BookingPercentDiscounts] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[Bookings] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[Bookings] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Injury]
GO
ALTER TABLE [inv].[Bookings] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [inv].[Bookings] ADD  DEFAULT ((0.0)) FOR [TotalAmount]
GO
ALTER TABLE [inv].[BookingTypes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[ChannelNames] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[ChannelTypes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[Companies] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypeOlds] ADD  DEFAULT ((0.0)) FOR [QuantityOld]
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypes] ADD  DEFAULT ((0.0)) FOR [Quantity]
GO
ALTER TABLE [inv].[InventoryDistributionRequests] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[InventoryDistributions] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[InventoryForms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[Platforms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[Projects] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[RateCards] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeAvrs] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeDays] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeDays] ADD  DEFAULT ((0.0)) FOR [QuantityUsed]
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeDays] ADD  DEFAULT ((0.0)) FOR [Percent]
GO
ALTER TABLE [inv].[TotalInventoryDayInventories] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[TotalInventoryDayInventories] ADD  DEFAULT ((0.0)) FOR [QuantiyUsed]
GO
ALTER TABLE [inv].[TotalInventoryMonths] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [inv].[TotalInventoryMonths] ADD  DEFAULT ((0.0)) FOR [QuantityInventoryDay]
GO
ALTER TABLE [inv].[TotalInventoryMonths] ADD  DEFAULT ((0.0)) FOR [QuantityInventoryMonth]
GO
ALTER TABLE [inv].[TotalInventoryMonths] ADD  DEFAULT ((0.0)) FOR [ActualInventory]
GO
ALTER TABLE [inv].[TotalInventoryMonths] ADD  DEFAULT ((0.0)) FOR [PercentActualInventory]
GO
ALTER TABLE [dbo].[AbpAuditLogActions]  WITH CHECK ADD  CONSTRAINT [FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId] FOREIGN KEY([AuditLogId])
REFERENCES [dbo].[AbpAuditLogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpAuditLogActions] CHECK CONSTRAINT [FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId]
GO
ALTER TABLE [dbo].[AbpEntityChanges]  WITH CHECK ADD  CONSTRAINT [FK_AbpEntityChanges_AbpAuditLogs_AuditLogId] FOREIGN KEY([AuditLogId])
REFERENCES [dbo].[AbpAuditLogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpEntityChanges] CHECK CONSTRAINT [FK_AbpEntityChanges_AbpAuditLogs_AuditLogId]
GO
ALTER TABLE [dbo].[AbpEntityPropertyChanges]  WITH CHECK ADD  CONSTRAINT [FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId] FOREIGN KEY([EntityChangeId])
REFERENCES [dbo].[AbpEntityChanges] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpEntityPropertyChanges] CHECK CONSTRAINT [FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId]
GO
ALTER TABLE [dbo].[AbpOrganizationUnitRoles]  WITH CHECK ADD  CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpOrganizationUnits_OrganizationUnitId] FOREIGN KEY([OrganizationUnitId])
REFERENCES [dbo].[AbpOrganizationUnits] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpOrganizationUnitRoles] CHECK CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpOrganizationUnits_OrganizationUnitId]
GO
ALTER TABLE [dbo].[AbpOrganizationUnitRoles]  WITH CHECK ADD  CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AbpRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpOrganizationUnitRoles] CHECK CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpRoles_RoleId]
GO
ALTER TABLE [dbo].[AbpOrganizationUnits]  WITH CHECK ADD  CONSTRAINT [FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[AbpOrganizationUnits] ([Id])
GO
ALTER TABLE [dbo].[AbpOrganizationUnits] CHECK CONSTRAINT [FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId]
GO
ALTER TABLE [dbo].[AbpRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AbpRoleClaims_AbpRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AbpRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpRoleClaims] CHECK CONSTRAINT [FK_AbpRoleClaims_AbpRoles_RoleId]
GO
ALTER TABLE [dbo].[AbpTenantConnectionStrings]  WITH CHECK ADD  CONSTRAINT [FK_AbpTenantConnectionStrings_AbpTenants_TenantId] FOREIGN KEY([TenantId])
REFERENCES [dbo].[AbpTenants] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpTenantConnectionStrings] CHECK CONSTRAINT [FK_AbpTenantConnectionStrings_AbpTenants_TenantId]
GO
ALTER TABLE [dbo].[AbpUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserClaims_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserClaims] CHECK CONSTRAINT [FK_AbpUserClaims_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserLogins_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserLogins] CHECK CONSTRAINT [FK_AbpUserLogins_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserOrganizationUnits]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationUnitId] FOREIGN KEY([OrganizationUnitId])
REFERENCES [dbo].[AbpOrganizationUnits] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserOrganizationUnits] CHECK CONSTRAINT [FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationUnitId]
GO
ALTER TABLE [dbo].[AbpUserOrganizationUnits]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserOrganizationUnits_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserOrganizationUnits] CHECK CONSTRAINT [FK_AbpUserOrganizationUnits_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserRoles_AbpRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AbpRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserRoles] CHECK CONSTRAINT [FK_AbpUserRoles_AbpRoles_RoleId]
GO
ALTER TABLE [dbo].[AbpUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserRoles_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserRoles] CHECK CONSTRAINT [FK_AbpUserRoles_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserTokens_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserTokens] CHECK CONSTRAINT [FK_AbpUserTokens_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[IdentityServerApiResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerApiResourceClaims_IdentityServerApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[IdentityServerApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerApiResourceClaims] CHECK CONSTRAINT [FK_IdentityServerApiResourceClaims_IdentityServerApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[IdentityServerApiResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerApiResourceProperties_IdentityServerApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[IdentityServerApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerApiResourceProperties] CHECK CONSTRAINT [FK_IdentityServerApiResourceProperties_IdentityServerApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[IdentityServerApiResourceScopes]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerApiResourceScopes_IdentityServerApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[IdentityServerApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerApiResourceScopes] CHECK CONSTRAINT [FK_IdentityServerApiResourceScopes_IdentityServerApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[IdentityServerApiResourceSecrets]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerApiResourceSecrets_IdentityServerApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[IdentityServerApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerApiResourceSecrets] CHECK CONSTRAINT [FK_IdentityServerApiResourceSecrets_IdentityServerApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[IdentityServerApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerApiScopeClaims_IdentityServerApiScopes_ApiScopeId] FOREIGN KEY([ApiScopeId])
REFERENCES [dbo].[IdentityServerApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerApiScopeClaims] CHECK CONSTRAINT [FK_IdentityServerApiScopeClaims_IdentityServerApiScopes_ApiScopeId]
GO
ALTER TABLE [dbo].[IdentityServerApiScopeProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerApiScopeProperties_IdentityServerApiScopes_ApiScopeId] FOREIGN KEY([ApiScopeId])
REFERENCES [dbo].[IdentityServerApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerApiScopeProperties] CHECK CONSTRAINT [FK_IdentityServerApiScopeProperties_IdentityServerApiScopes_ApiScopeId]
GO
ALTER TABLE [dbo].[IdentityServerClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerClientClaims_IdentityServerClients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[IdentityServerClients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerClientClaims] CHECK CONSTRAINT [FK_IdentityServerClientClaims_IdentityServerClients_ClientId]
GO
ALTER TABLE [dbo].[IdentityServerClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerClientCorsOrigins_IdentityServerClients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[IdentityServerClients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerClientCorsOrigins] CHECK CONSTRAINT [FK_IdentityServerClientCorsOrigins_IdentityServerClients_ClientId]
GO
ALTER TABLE [dbo].[IdentityServerClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerClientGrantTypes_IdentityServerClients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[IdentityServerClients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerClientGrantTypes] CHECK CONSTRAINT [FK_IdentityServerClientGrantTypes_IdentityServerClients_ClientId]
GO
ALTER TABLE [dbo].[IdentityServerClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerClientIdPRestrictions_IdentityServerClients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[IdentityServerClients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerClientIdPRestrictions] CHECK CONSTRAINT [FK_IdentityServerClientIdPRestrictions_IdentityServerClients_ClientId]
GO
ALTER TABLE [dbo].[IdentityServerClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerClientPostLogoutRedirectUris_IdentityServerClients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[IdentityServerClients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_IdentityServerClientPostLogoutRedirectUris_IdentityServerClients_ClientId]
GO
ALTER TABLE [dbo].[IdentityServerClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerClientProperties_IdentityServerClients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[IdentityServerClients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerClientProperties] CHECK CONSTRAINT [FK_IdentityServerClientProperties_IdentityServerClients_ClientId]
GO
ALTER TABLE [dbo].[IdentityServerClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerClientRedirectUris_IdentityServerClients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[IdentityServerClients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerClientRedirectUris] CHECK CONSTRAINT [FK_IdentityServerClientRedirectUris_IdentityServerClients_ClientId]
GO
ALTER TABLE [dbo].[IdentityServerClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerClientScopes_IdentityServerClients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[IdentityServerClients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerClientScopes] CHECK CONSTRAINT [FK_IdentityServerClientScopes_IdentityServerClients_ClientId]
GO
ALTER TABLE [dbo].[IdentityServerClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerClientSecrets_IdentityServerClients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[IdentityServerClients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerClientSecrets] CHECK CONSTRAINT [FK_IdentityServerClientSecrets_IdentityServerClients_ClientId]
GO
ALTER TABLE [dbo].[IdentityServerIdentityResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerIdentityResourceClaims_IdentityServerIdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityServerIdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerIdentityResourceClaims] CHECK CONSTRAINT [FK_IdentityServerIdentityResourceClaims_IdentityServerIdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[IdentityServerIdentityResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityServerIdentityResourceProperties_IdentityServerIdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityServerIdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityServerIdentityResourceProperties] CHECK CONSTRAINT [FK_IdentityServerIdentityResourceProperties_IdentityServerIdentityResources_IdentityResourceId]
GO
ALTER TABLE [inv].[BookingChannelTypes]  WITH CHECK ADD  CONSTRAINT [FK_BookingChannelTypes_Bookings_BookingId] FOREIGN KEY([BookingId])
REFERENCES [inv].[Bookings] ([Id])
GO
ALTER TABLE [inv].[BookingChannelTypes] CHECK CONSTRAINT [FK_BookingChannelTypes_Bookings_BookingId]
GO
ALTER TABLE [inv].[BookingChannelTypes]  WITH CHECK ADD  CONSTRAINT [FK_BookingChannelTypes_ChannelTypes_ChannelTypeId] FOREIGN KEY([ChannelTypeId])
REFERENCES [inv].[ChannelTypes] ([Id])
GO
ALTER TABLE [inv].[BookingChannelTypes] CHECK CONSTRAINT [FK_BookingChannelTypes_ChannelTypes_ChannelTypeId]
GO
ALTER TABLE [inv].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_BookingPercentBlocks_BookingPercentBlockId] FOREIGN KEY([BookingPercentBlockId])
REFERENCES [inv].[BookingPercentBlocks] ([Id])
GO
ALTER TABLE [inv].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_BookingPercentBlocks_BookingPercentBlockId]
GO
ALTER TABLE [inv].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_BookingPercentDiscounts_BookingPercentDiscountId] FOREIGN KEY([BookingPercentDiscountId])
REFERENCES [inv].[BookingPercentDiscounts] ([Id])
GO
ALTER TABLE [inv].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_BookingPercentDiscounts_BookingPercentDiscountId]
GO
ALTER TABLE [inv].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Bookings_BookingId] FOREIGN KEY([BookingId])
REFERENCES [inv].[Bookings] ([Id])
GO
ALTER TABLE [inv].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Bookings_BookingId]
GO
ALTER TABLE [inv].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_ChannelNames_ChannelNameId] FOREIGN KEY([ChannelNameId])
REFERENCES [inv].[ChannelNames] ([Id])
GO
ALTER TABLE [inv].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_ChannelNames_ChannelNameId]
GO
ALTER TABLE [inv].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_InventoryDistributions_InventoryDistributionId] FOREIGN KEY([InventoryDistributionId])
REFERENCES [inv].[InventoryDistributions] ([Id])
GO
ALTER TABLE [inv].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_InventoryDistributions_InventoryDistributionId]
GO
ALTER TABLE [inv].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_RateCards_RateCardId] FOREIGN KEY([RateCardId])
REFERENCES [inv].[RateCards] ([Id])
GO
ALTER TABLE [inv].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_RateCards_RateCardId]
GO
ALTER TABLE [inv].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_TotalInventoryDayBookingTypeDays_TotalInventoryDayBookingTypeDayId] FOREIGN KEY([TotalInventoryDayBookingTypeDayId])
REFERENCES [inv].[TotalInventoryDayBookingTypeDays] ([Id])
GO
ALTER TABLE [inv].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_TotalInventoryDayBookingTypeDays_TotalInventoryDayBookingTypeDayId]
GO
ALTER TABLE [inv].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_TotalInventoryDayInventories_TotalInventoryDayInventoryId] FOREIGN KEY([TotalInventoryDayInventoryId])
REFERENCES [inv].[TotalInventoryDayInventories] ([Id])
GO
ALTER TABLE [inv].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_TotalInventoryDayInventories_TotalInventoryDayInventoryId]
GO
ALTER TABLE [inv].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_TotalInventoryMonths_TotalInventoryMonthId] FOREIGN KEY([TotalInventoryMonthId])
REFERENCES [inv].[TotalInventoryMonths] ([Id])
GO
ALTER TABLE [inv].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_TotalInventoryMonths_TotalInventoryMonthId]
GO
ALTER TABLE [inv].[BookingPercentBlocks]  WITH CHECK ADD  CONSTRAINT [FK_BookingPercentBlocks_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[BookingPercentBlocks] CHECK CONSTRAINT [FK_BookingPercentBlocks_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[BookingPercentBlocks]  WITH CHECK ADD  CONSTRAINT [FK_BookingPercentBlocks_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [inv].[Companies] ([Id])
GO
ALTER TABLE [inv].[BookingPercentBlocks] CHECK CONSTRAINT [FK_BookingPercentBlocks_Companies_CompanyId]
GO
ALTER TABLE [inv].[BookingPercentBlocks]  WITH CHECK ADD  CONSTRAINT [FK_BookingPercentBlocks_Platforms_PlatformId] FOREIGN KEY([PlatformId])
REFERENCES [inv].[Platforms] ([Id])
GO
ALTER TABLE [inv].[BookingPercentBlocks] CHECK CONSTRAINT [FK_BookingPercentBlocks_Platforms_PlatformId]
GO
ALTER TABLE [inv].[BookingPercentDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_BookingPercentDiscounts_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[BookingPercentDiscounts] CHECK CONSTRAINT [FK_BookingPercentDiscounts_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[BookingPercentDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_BookingPercentDiscounts_Platforms_PlatformId] FOREIGN KEY([PlatformId])
REFERENCES [inv].[Platforms] ([Id])
GO
ALTER TABLE [inv].[BookingPercentDiscounts] CHECK CONSTRAINT [FK_BookingPercentDiscounts_Platforms_PlatformId]
GO
ALTER TABLE [inv].[BookingPercentDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_BookingPercentDiscounts_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [inv].[Projects] ([Id])
GO
ALTER TABLE [inv].[BookingPercentDiscounts] CHECK CONSTRAINT [FK_BookingPercentDiscounts_Projects_ProjectId]
GO
ALTER TABLE [inv].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Bookings_ParentId] FOREIGN KEY([ParentId])
REFERENCES [inv].[Bookings] ([Id])
GO
ALTER TABLE [inv].[Bookings] CHECK CONSTRAINT [FK_Bookings_Bookings_ParentId]
GO
ALTER TABLE [inv].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[Bookings] CHECK CONSTRAINT [FK_Bookings_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Companies_RequesterId] FOREIGN KEY([RequesterId])
REFERENCES [inv].[Companies] ([Id])
GO
ALTER TABLE [inv].[Bookings] CHECK CONSTRAINT [FK_Bookings_Companies_RequesterId]
GO
ALTER TABLE [inv].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_InventoryForms_InventoryFormId] FOREIGN KEY([InventoryFormId])
REFERENCES [inv].[InventoryForms] ([Id])
GO
ALTER TABLE [inv].[Bookings] CHECK CONSTRAINT [FK_Bookings_InventoryForms_InventoryFormId]
GO
ALTER TABLE [inv].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Platforms_PlatformId] FOREIGN KEY([PlatformId])
REFERENCES [inv].[Platforms] ([Id])
GO
ALTER TABLE [inv].[Bookings] CHECK CONSTRAINT [FK_Bookings_Platforms_PlatformId]
GO
ALTER TABLE [inv].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [inv].[Projects] ([Id])
GO
ALTER TABLE [inv].[Bookings] CHECK CONSTRAINT [FK_Bookings_Projects_ProjectId]
GO
ALTER TABLE [inv].[BookingSupporters]  WITH CHECK ADD  CONSTRAINT [FK_BookingSupporters_Bookings_BookingId] FOREIGN KEY([BookingId])
REFERENCES [inv].[Bookings] ([Id])
GO
ALTER TABLE [inv].[BookingSupporters] CHECK CONSTRAINT [FK_BookingSupporters_Bookings_BookingId]
GO
ALTER TABLE [inv].[BookingSupporters]  WITH CHECK ADD  CONSTRAINT [FK_BookingSupporters_Companies_SupporterId] FOREIGN KEY([SupporterId])
REFERENCES [inv].[Companies] ([Id])
GO
ALTER TABLE [inv].[BookingSupporters] CHECK CONSTRAINT [FK_BookingSupporters_Companies_SupporterId]
GO
ALTER TABLE [inv].[ChannelIntermediaries]  WITH CHECK ADD  CONSTRAINT [FK_ChannelIntermediaries_ChannelNames_ChannelNameId] FOREIGN KEY([ChannelNameId])
REFERENCES [inv].[ChannelNames] ([Id])
GO
ALTER TABLE [inv].[ChannelIntermediaries] CHECK CONSTRAINT [FK_ChannelIntermediaries_ChannelNames_ChannelNameId]
GO
ALTER TABLE [inv].[ChannelIntermediaries]  WITH CHECK ADD  CONSTRAINT [FK_ChannelIntermediaries_ChannelTypes_ChannelTypeId] FOREIGN KEY([ChannelTypeId])
REFERENCES [inv].[ChannelTypes] ([Id])
GO
ALTER TABLE [inv].[ChannelIntermediaries] CHECK CONSTRAINT [FK_ChannelIntermediaries_ChannelTypes_ChannelTypeId]
GO
ALTER TABLE [inv].[ChannelNames]  WITH CHECK ADD  CONSTRAINT [FK_ChannelNames_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [inv].[Companies] ([Id])
GO
ALTER TABLE [inv].[ChannelNames] CHECK CONSTRAINT [FK_ChannelNames_Companies_CompanyId]
GO
ALTER TABLE [inv].[ChannelNames]  WITH CHECK ADD  CONSTRAINT [FK_ChannelNames_Platforms_PlatformId] FOREIGN KEY([PlatformId])
REFERENCES [inv].[Platforms] ([Id])
GO
ALTER TABLE [inv].[ChannelNames] CHECK CONSTRAINT [FK_ChannelNames_Platforms_PlatformId]
GO
ALTER TABLE [inv].[InventoryDistributionBookingTypes]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionBookingTypes_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionBookingTypes] CHECK CONSTRAINT [FK_InventoryDistributionBookingTypes_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[InventoryDistributionBookingTypes]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionBookingTypes_InventoryDistributions_InventoryDistributionId] FOREIGN KEY([InventoryDistributionId])
REFERENCES [inv].[InventoryDistributions] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionBookingTypes] CHECK CONSTRAINT [FK_InventoryDistributionBookingTypes_InventoryDistributions_InventoryDistributionId]
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypeOlds]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequestBookingTypeOlds_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypeOlds] CHECK CONSTRAINT [FK_InventoryDistributionRequestBookingTypeOlds_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypeOlds]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequestBookingTypeOlds_InventoryDistributionRequests_InventoryDistributionRequestId] FOREIGN KEY([InventoryDistributionRequestId])
REFERENCES [inv].[InventoryDistributionRequests] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypeOlds] CHECK CONSTRAINT [FK_InventoryDistributionRequestBookingTypeOlds_InventoryDistributionRequests_InventoryDistributionRequestId]
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypes]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequestBookingTypes_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypes] CHECK CONSTRAINT [FK_InventoryDistributionRequestBookingTypes_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypes]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequestBookingTypes_InventoryDistributionRequests_InventoryDistributionRequestId] FOREIGN KEY([InventoryDistributionRequestId])
REFERENCES [inv].[InventoryDistributionRequests] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequestBookingTypes] CHECK CONSTRAINT [FK_InventoryDistributionRequestBookingTypes_InventoryDistributionRequests_InventoryDistributionRequestId]
GO
ALTER TABLE [inv].[InventoryDistributionRequestChannelTypes]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequestChannelTypes_ChannelTypes_ChannelTypeId] FOREIGN KEY([ChannelTypeId])
REFERENCES [inv].[ChannelTypes] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequestChannelTypes] CHECK CONSTRAINT [FK_InventoryDistributionRequestChannelTypes_ChannelTypes_ChannelTypeId]
GO
ALTER TABLE [inv].[InventoryDistributionRequestChannelTypes]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequestChannelTypes_InventoryDistributionRequests_InventoryDistributionRequestId] FOREIGN KEY([InventoryDistributionRequestId])
REFERENCES [inv].[InventoryDistributionRequests] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequestChannelTypes] CHECK CONSTRAINT [FK_InventoryDistributionRequestChannelTypes_InventoryDistributionRequests_InventoryDistributionRequestId]
GO
ALTER TABLE [inv].[InventoryDistributionRequests]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequests_ChannelNames_ChannelNameId] FOREIGN KEY([ChannelNameId])
REFERENCES [inv].[ChannelNames] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequests] CHECK CONSTRAINT [FK_InventoryDistributionRequests_ChannelNames_ChannelNameId]
GO
ALTER TABLE [inv].[InventoryDistributionRequests]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequests_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [inv].[Companies] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequests] CHECK CONSTRAINT [FK_InventoryDistributionRequests_Companies_CompanyId]
GO
ALTER TABLE [inv].[InventoryDistributionRequests]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequests_InventoryForms_InventoryFormId] FOREIGN KEY([InventoryFormId])
REFERENCES [inv].[InventoryForms] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequests] CHECK CONSTRAINT [FK_InventoryDistributionRequests_InventoryForms_InventoryFormId]
GO
ALTER TABLE [inv].[InventoryDistributionRequests]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequests_Platforms_PlatformId] FOREIGN KEY([PlatformId])
REFERENCES [inv].[Platforms] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequests] CHECK CONSTRAINT [FK_InventoryDistributionRequests_Platforms_PlatformId]
GO
ALTER TABLE [inv].[InventoryDistributionRequests]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributionRequests_TotalInventoryMonths_TotalInventoryMonthId] FOREIGN KEY([TotalInventoryMonthId])
REFERENCES [inv].[TotalInventoryMonths] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributionRequests] CHECK CONSTRAINT [FK_InventoryDistributionRequests_TotalInventoryMonths_TotalInventoryMonthId]
GO
ALTER TABLE [inv].[InventoryDistributions]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributions_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [inv].[Companies] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributions] CHECK CONSTRAINT [FK_InventoryDistributions_Companies_CompanyId]
GO
ALTER TABLE [inv].[InventoryDistributions]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDistributions_Platforms_PlatformId] FOREIGN KEY([PlatformId])
REFERENCES [inv].[Platforms] ([Id])
GO
ALTER TABLE [inv].[InventoryDistributions] CHECK CONSTRAINT [FK_InventoryDistributions_Platforms_PlatformId]
GO
ALTER TABLE [inv].[InventoryFormInventoryDistributions]  WITH CHECK ADD  CONSTRAINT [FK_InventoryFormInventoryDistributions_InventoryDistributions_InventoryDistributionId] FOREIGN KEY([InventoryDistributionId])
REFERENCES [inv].[InventoryDistributions] ([Id])
GO
ALTER TABLE [inv].[InventoryFormInventoryDistributions] CHECK CONSTRAINT [FK_InventoryFormInventoryDistributions_InventoryDistributions_InventoryDistributionId]
GO
ALTER TABLE [inv].[InventoryFormInventoryDistributions]  WITH CHECK ADD  CONSTRAINT [FK_InventoryFormInventoryDistributions_InventoryForms_InventoryFormId] FOREIGN KEY([InventoryFormId])
REFERENCES [inv].[InventoryForms] ([Id])
GO
ALTER TABLE [inv].[InventoryFormInventoryDistributions] CHECK CONSTRAINT [FK_InventoryFormInventoryDistributions_InventoryForms_InventoryFormId]
GO
ALTER TABLE [inv].[InventoryForms]  WITH CHECK ADD  CONSTRAINT [FK_InventoryForms_Platforms_PlatformId] FOREIGN KEY([PlatformId])
REFERENCES [inv].[Platforms] ([Id])
GO
ALTER TABLE [inv].[InventoryForms] CHECK CONSTRAINT [FK_InventoryForms_Platforms_PlatformId]
GO
ALTER TABLE [inv].[PercentBlockChannelNames]  WITH CHECK ADD  CONSTRAINT [FK_PercentBlockChannelNames_BookingPercentBlocks_BookingPercentBlockId] FOREIGN KEY([BookingPercentBlockId])
REFERENCES [inv].[BookingPercentBlocks] ([Id])
GO
ALTER TABLE [inv].[PercentBlockChannelNames] CHECK CONSTRAINT [FK_PercentBlockChannelNames_BookingPercentBlocks_BookingPercentBlockId]
GO
ALTER TABLE [inv].[PercentBlockChannelNames]  WITH CHECK ADD  CONSTRAINT [FK_PercentBlockChannelNames_ChannelNames_ChannelNameId] FOREIGN KEY([ChannelNameId])
REFERENCES [inv].[ChannelNames] ([Id])
GO
ALTER TABLE [inv].[PercentBlockChannelNames] CHECK CONSTRAINT [FK_PercentBlockChannelNames_ChannelNames_ChannelNameId]
GO
ALTER TABLE [inv].[PercentBlockInventoryForms]  WITH CHECK ADD  CONSTRAINT [FK_PercentBlockInventoryForms_BookingPercentBlocks_BookingPercentBlockId] FOREIGN KEY([BookingPercentBlockId])
REFERENCES [inv].[BookingPercentBlocks] ([Id])
GO
ALTER TABLE [inv].[PercentBlockInventoryForms] CHECK CONSTRAINT [FK_PercentBlockInventoryForms_BookingPercentBlocks_BookingPercentBlockId]
GO
ALTER TABLE [inv].[PercentBlockInventoryForms]  WITH CHECK ADD  CONSTRAINT [FK_PercentBlockInventoryForms_InventoryForms_InventoryFormId] FOREIGN KEY([InventoryFormId])
REFERENCES [inv].[InventoryForms] ([Id])
GO
ALTER TABLE [inv].[PercentBlockInventoryForms] CHECK CONSTRAINT [FK_PercentBlockInventoryForms_InventoryForms_InventoryFormId]
GO
ALTER TABLE [inv].[PercentDiscountInventoryForms]  WITH CHECK ADD  CONSTRAINT [FK_PercentDiscountInventoryForms_BookingPercentDiscounts_BookingPercentDiscountId] FOREIGN KEY([BookingPercentDiscountId])
REFERENCES [inv].[BookingPercentDiscounts] ([Id])
GO
ALTER TABLE [inv].[PercentDiscountInventoryForms] CHECK CONSTRAINT [FK_PercentDiscountInventoryForms_BookingPercentDiscounts_BookingPercentDiscountId]
GO
ALTER TABLE [inv].[PercentDiscountInventoryForms]  WITH CHECK ADD  CONSTRAINT [FK_PercentDiscountInventoryForms_InventoryForms_InventoryFormId] FOREIGN KEY([InventoryFormId])
REFERENCES [inv].[InventoryForms] ([Id])
GO
ALTER TABLE [inv].[PercentDiscountInventoryForms] CHECK CONSTRAINT [FK_PercentDiscountInventoryForms_InventoryForms_InventoryFormId]
GO
ALTER TABLE [inv].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [inv].[Companies] ([Id])
GO
ALTER TABLE [inv].[Projects] CHECK CONSTRAINT [FK_Projects_Companies_CompanyId]
GO
ALTER TABLE [inv].[RateCardBookingTypes]  WITH CHECK ADD  CONSTRAINT [FK_RateCardBookingTypes_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[RateCardBookingTypes] CHECK CONSTRAINT [FK_RateCardBookingTypes_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[RateCardBookingTypes]  WITH CHECK ADD  CONSTRAINT [FK_RateCardBookingTypes_RateCards_RateCardId] FOREIGN KEY([RateCardId])
REFERENCES [inv].[RateCards] ([Id])
GO
ALTER TABLE [inv].[RateCardBookingTypes] CHECK CONSTRAINT [FK_RateCardBookingTypes_RateCards_RateCardId]
GO
ALTER TABLE [inv].[RateCards]  WITH CHECK ADD  CONSTRAINT [FK_RateCards_ChannelNames_ChannelNameId] FOREIGN KEY([ChannelNameId])
REFERENCES [inv].[ChannelNames] ([Id])
GO
ALTER TABLE [inv].[RateCards] CHECK CONSTRAINT [FK_RateCards_ChannelNames_ChannelNameId]
GO
ALTER TABLE [inv].[RateCards]  WITH CHECK ADD  CONSTRAINT [FK_RateCards_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [inv].[Companies] ([Id])
GO
ALTER TABLE [inv].[RateCards] CHECK CONSTRAINT [FK_RateCards_Companies_CompanyId]
GO
ALTER TABLE [inv].[RateCards]  WITH CHECK ADD  CONSTRAINT [FK_RateCards_InventoryForms_InventoryFormId] FOREIGN KEY([InventoryFormId])
REFERENCES [inv].[InventoryForms] ([Id])
GO
ALTER TABLE [inv].[RateCards] CHECK CONSTRAINT [FK_RateCards_InventoryForms_InventoryFormId]
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeAvrs]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryDayBookingTypeAvrs_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeAvrs] CHECK CONSTRAINT [FK_TotalInventoryDayBookingTypeAvrs_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeAvrs]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryDayBookingTypeAvrs_TotalInventoryMonths_TotalInventoryMonthId] FOREIGN KEY([TotalInventoryMonthId])
REFERENCES [inv].[TotalInventoryMonths] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeAvrs] CHECK CONSTRAINT [FK_TotalInventoryDayBookingTypeAvrs_TotalInventoryMonths_TotalInventoryMonthId]
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeDays]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryDayBookingTypeDays_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeDays] CHECK CONSTRAINT [FK_TotalInventoryDayBookingTypeDays_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeDays]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryDayBookingTypeDays_TotalInventoryDayInventories_TotalInventoryDayInventoryId] FOREIGN KEY([TotalInventoryDayInventoryId])
REFERENCES [inv].[TotalInventoryDayInventories] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryDayBookingTypeDays] CHECK CONSTRAINT [FK_TotalInventoryDayBookingTypeDays_TotalInventoryDayInventories_TotalInventoryDayInventoryId]
GO
ALTER TABLE [inv].[TotalInventoryDayInventories]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryDayInventories_InventoryDistributions_InventoryDistributionId] FOREIGN KEY([InventoryDistributionId])
REFERENCES [inv].[InventoryDistributions] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryDayInventories] CHECK CONSTRAINT [FK_TotalInventoryDayInventories_InventoryDistributions_InventoryDistributionId]
GO
ALTER TABLE [inv].[TotalInventoryDayInventories]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryDayInventories_InventoryForms_InventoryFormId] FOREIGN KEY([InventoryFormId])
REFERENCES [inv].[InventoryForms] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryDayInventories] CHECK CONSTRAINT [FK_TotalInventoryDayInventories_InventoryForms_InventoryFormId]
GO
ALTER TABLE [inv].[TotalInventoryDayInventories]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryDayInventories_TotalInventoryMonths_TotalInventoryMonthId] FOREIGN KEY([TotalInventoryMonthId])
REFERENCES [inv].[TotalInventoryMonths] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryDayInventories] CHECK CONSTRAINT [FK_TotalInventoryDayInventories_TotalInventoryMonths_TotalInventoryMonthId]
GO
ALTER TABLE [inv].[TotalInventoryMonthBookingTypes]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonthBookingTypes_BookingTypes_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [inv].[BookingTypes] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonthBookingTypes] CHECK CONSTRAINT [FK_TotalInventoryMonthBookingTypes_BookingTypes_BookingTypeId]
GO
ALTER TABLE [inv].[TotalInventoryMonthBookingTypes]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonthBookingTypes_TotalInventoryMonths_TotalInventoryMonthId] FOREIGN KEY([TotalInventoryMonthId])
REFERENCES [inv].[TotalInventoryMonths] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonthBookingTypes] CHECK CONSTRAINT [FK_TotalInventoryMonthBookingTypes_TotalInventoryMonths_TotalInventoryMonthId]
GO
ALTER TABLE [inv].[TotalInventoryMonthChannelTypes]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonthChannelTypes_ChannelTypes_ChannelTypeId] FOREIGN KEY([ChannelTypeId])
REFERENCES [inv].[ChannelTypes] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonthChannelTypes] CHECK CONSTRAINT [FK_TotalInventoryMonthChannelTypes_ChannelTypes_ChannelTypeId]
GO
ALTER TABLE [inv].[TotalInventoryMonthChannelTypes]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonthChannelTypes_TotalInventoryMonths_TotalInventoryMonthId] FOREIGN KEY([TotalInventoryMonthId])
REFERENCES [inv].[TotalInventoryMonths] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonthChannelTypes] CHECK CONSTRAINT [FK_TotalInventoryMonthChannelTypes_TotalInventoryMonths_TotalInventoryMonthId]
GO
ALTER TABLE [inv].[TotalInventoryMonthInventoryDistributions]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonthInventoryDistributions_InventoryDistributions_InventoryDistributionId] FOREIGN KEY([InventoryDistributionId])
REFERENCES [inv].[InventoryDistributions] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonthInventoryDistributions] CHECK CONSTRAINT [FK_TotalInventoryMonthInventoryDistributions_InventoryDistributions_InventoryDistributionId]
GO
ALTER TABLE [inv].[TotalInventoryMonthInventoryDistributions]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonthInventoryDistributions_TotalInventoryMonths_TotalInventoryMonthId] FOREIGN KEY([TotalInventoryMonthId])
REFERENCES [inv].[TotalInventoryMonths] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonthInventoryDistributions] CHECK CONSTRAINT [FK_TotalInventoryMonthInventoryDistributions_TotalInventoryMonths_TotalInventoryMonthId]
GO
ALTER TABLE [inv].[TotalInventoryMonths]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonths_ChannelNames_ChannelNameId] FOREIGN KEY([ChannelNameId])
REFERENCES [inv].[ChannelNames] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonths] CHECK CONSTRAINT [FK_TotalInventoryMonths_ChannelNames_ChannelNameId]
GO
ALTER TABLE [inv].[TotalInventoryMonths]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonths_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [inv].[Companies] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonths] CHECK CONSTRAINT [FK_TotalInventoryMonths_Companies_CompanyId]
GO
ALTER TABLE [inv].[TotalInventoryMonths]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonths_InventoryForms_InventoryFormId] FOREIGN KEY([InventoryFormId])
REFERENCES [inv].[InventoryForms] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonths] CHECK CONSTRAINT [FK_TotalInventoryMonths_InventoryForms_InventoryFormId]
GO
ALTER TABLE [inv].[TotalInventoryMonths]  WITH CHECK ADD  CONSTRAINT [FK_TotalInventoryMonths_Platforms_PlatformId] FOREIGN KEY([PlatformId])
REFERENCES [inv].[Platforms] ([Id])
GO
ALTER TABLE [inv].[TotalInventoryMonths] CHECK CONSTRAINT [FK_TotalInventoryMonths_Platforms_PlatformId]
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
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 508
               Bottom = 136
               Right = 699
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ReportPhanQuyenCIA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ReportPhanQuyenCIA'
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
         Begin Table = "a_1"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserActivityLogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserActivityLogs'
GO
USE [master]
GO
ALTER DATABASE [Uat.VacInventory] SET  READ_WRITE 
GO
