USE [master]
GO
/****** Object:  Database [Парк]    Script Date: 13.05.2023 10:43:43 ******/
CREATE DATABASE [Парк]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Парк', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Парк.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Парк_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Парк_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Парк] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Парк].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Парк] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Парк] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Парк] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Парк] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Парк] SET ARITHABORT OFF 
GO
ALTER DATABASE [Парк] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Парк] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Парк] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Парк] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Парк] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Парк] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Парк] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Парк] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Парк] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Парк] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Парк] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Парк] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Парк] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Парк] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Парк] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Парк] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Парк] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Парк] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Парк] SET  MULTI_USER 
GO
ALTER DATABASE [Парк] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Парк] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Парк] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Парк] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Парк] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Парк] SET QUERY_STORE = OFF
GO
USE [Парк]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 13.05.2023 10:43:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[Номер] [nvarchar](50) NULL,
	[ID] [nvarchar](50) NULL,
	[Услуги] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 13.05.2023 10:43:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[ФИО] [nvarchar](255) NULL,
	[Код клиента] [float] NULL,
	[Паспортные данные] [nvarchar](255) NULL,
	[Дата рождения] [datetime] NULL,
	[Адрес] [nvarchar](255) NULL,
	[e-mail] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 13.05.2023 10:43:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[Код_роли] [nvarchar](50) NOT NULL,
	[Код_сотрудника] [nvarchar](50) NULL,
	[Должность] [nvarchar](50) NULL,
	[Код_заказа] [nvarchar](50) NULL,
 CONSTRAINT [PK_Роли] PRIMARY KEY CLUSTERED 
(
	[Код_роли] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 13.05.2023 10:43:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Код сотрудника] [nvarchar](50) NOT NULL,
	[Должность] [nvarchar](255) NULL,
	[ФИО ] [nvarchar](255) NULL,
	[Логин ] [nvarchar](255) NULL,
	[Пароль] [nvarchar](255) NULL,
	[Последний вход] [nvarchar](255) NULL,
	[Тип входа] [nvarchar](255) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[Код сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 13.05.2023 10:43:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[ID] [float] NULL,
	[Наименование услуги] [nvarchar](255) NULL,
	[Код услуги] [nvarchar](255) NULL,
	[Стоимость, руб#  за час ] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Чек]    Script Date: 13.05.2023 10:43:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Чек](
	[Код чека] [float] NULL,
	[Код услуги] [float] NULL,
	[Код клиента] [float] NULL,
	[Код заказа] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Роли]  WITH CHECK ADD  CONSTRAINT [FK_Роли_Сотрудники] FOREIGN KEY([Код_сотрудника])
REFERENCES [dbo].[Сотрудники] ([Код сотрудника])
GO
ALTER TABLE [dbo].[Роли] CHECK CONSTRAINT [FK_Роли_Сотрудники]
GO
USE [master]
GO
ALTER DATABASE [Парк] SET  READ_WRITE 
GO
