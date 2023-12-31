USE [master]
GO
/****** Object:  Database [МУХИТАОАОВ автосервис]    Script Date: 02.10.2023 20:08:43 ******/
CREATE DATABASE [МУХИТАОАОВ автосервис]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'МУХИТАОАОВ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\МУХИТАОАОВ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'МУХИТАОАОВ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\МУХИТАОАОВ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [МУХИТАОАОВ автосервис].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET ARITHABORT OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET  DISABLE_BROKER 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET  MULTI_USER 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET DB_CHAINING OFF 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET DELAYED_DURABILITY = DISABLED 
GO
USE [МУХИТАОАОВ автосервис]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLEINTS]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLEINTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK_client_a_import] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERVESYS]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVESYS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[MainImagePath] [nvarchar](100) NULL,
	[DurationInSeconds] [nvarchar](50) NOT NULL,
	[Cost] [smallint] NOT NULL,
	[Discount] [tinyint] NULL,
 CONSTRAINT [PK_service_a_import] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 02.10.2023 20:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLEINTS] ON 

INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (1, N'Мишина', N'Иветта', N'Андреевна', CAST(N'2002-10-05' AS Date), N'ж', N'7(3926)244-81-96 ', N'aukjan@yahoo.com', CAST(N'2016-01-24' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (2, N'Суворова', N'Божена', N'Анатольевна', CAST(N'1981-03-09' AS Date), N'ж', N'7(347)895-86-57 ', N'attwood@aol.com', CAST(N'2016-01-28' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (3, N'Белозёрова', N'Диана', N'Антоновна', CAST(N'1989-02-27' AS Date), N'ж', N'7(9900)174-59-87 ', N'dialworld@aol.com', CAST(N'2017-01-30' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (4, N'Дементьева', N'Эдита', N'Онисимовна', CAST(N'1975-09-17' AS Date), N'ж', N'7(198)922-28-76 ', N'frosal@hotmail.com', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (5, N'Блинов', N'Евгений', N'Мэлсович', CAST(N'1994-01-05' AS Date), N'м', N'7(0852)321-82-64 ', N'moxfulder@outlook.com', CAST(N'2017-05-07' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (6, N'Морозов', N'Наум', N'Валерьянович', CAST(N'1985-07-04' AS Date), N'м', N'7(636)050-96-13 ', N'salesgeek@mac.com', CAST(N'2016-05-02' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (7, N'Попова', N'Харита', N'Якуновна', CAST(N'1997-12-16' AS Date), N'ж', N'7(335)386-81-06 ', N'firstpr@verizon.net', CAST(N'2016-07-05' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (8, N'Крюков', N'Наум', N'Ильяович', CAST(N'1993-11-17' AS Date), N'м', N'7(81)657-88-92 ', N'floxy@hotmail.com', CAST(N'2017-02-01' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (9, N'Крюкова', N'Авигея', N'Святославовна', CAST(N'2000-08-10' AS Date), N'ж', N'7(499)318-88-53 ', N'simone@gmail.com', CAST(N'2018-01-03' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (10, N'Беляева', N'Сабрина', N'Федосеевна', CAST(N'1972-07-26' AS Date), N'ж', N'7(6580)534-32-58 ', N'agapow@gmail.com', CAST(N'2017-06-14' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (11, N'Медведев', N'Святослав', N'Юлианович', CAST(N'1972-10-04' AS Date), N'м', N'7(3520)435-21-20 ', N'hllam@comcast.net', CAST(N'2018-10-13' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (12, N'Блохин', N'Пантелеймон', N'Феликсович', CAST(N'1978-03-06' AS Date), N'м', N'7(9524)556-48-98 ', N'balchen@comcast.net', CAST(N'2018-02-14' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (13, N'Горбачёва', N'Никки', N'Еремеевна', CAST(N'1987-04-21' AS Date), N'ж', N'7(94)789-69-20 ', N'chinthaka@att.net', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (14, N'Архипова', N'Прасковья', N'Валерьевна', CAST(N'1979-01-09' AS Date), N'ж', N'7(86)540-10-21 ', N'cgcra@live.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (15, N'Андреева', N'Патрисия', N'Валерьевна', CAST(N'1993-11-18' AS Date), N'ж', N'7(9648)953-81-26 ', N'jigsaw@aol.com', CAST(N'2016-07-17' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (16, N'Горшкова', N'Марта', N'Иосифовна', CAST(N'2001-02-13' AS Date), N'ж', N'7(544)650-59-03', N'gbacon@mac.com', CAST(N'2016-08-04' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (17, N'Орлова', N'Влада', N'Мартыновна', CAST(N'1990-06-26' AS Date), N'ж', N'7(2506)433-38-35 ', N'rnelson@yahoo.ca', CAST(N'2016-03-21' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (18, N'Ершов', N'Глеб', N'Федорович', CAST(N'1970-06-14' AS Date), N'м', N'7(2608)298-40-82 ', N'sjava@aol.com', CAST(N'2016-09-14' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (19, N'Быкова', N'Тала', N'Георгьевна', CAST(N'2000-02-22' AS Date), N'ж', N'7(13)915-53-53 ', N'ganter@optonline.net', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (20, N'Новиков', N'Адриан', N'Аркадьевич', CAST(N'1974-01-15' AS Date), N'м', N'7(70)572-33-62 ', N'multiplx@verizon.net', CAST(N'2018-11-23' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (21, N'Филатов', N'Аристарх', N'Дмитриевич', CAST(N'1989-05-29' AS Date), N'м', N'7(696)235-29-24 ', N'hampton@att.net', CAST(N'2017-01-11' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (22, N'Анисимова', N'Тамара', N'Витальевна', CAST(N'1988-06-16' AS Date), N'ж', N'7(66)128-04-10 ', N'schwaang@mac.com', CAST(N'2016-02-25' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (23, N'Кудряшов', N'Аверкий', N'Константинович', CAST(N'1991-07-26' AS Date), N'м', N'7(88)732-96-30 ', N'nanop@msn.com', CAST(N'2018-03-08' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (24, N'Колобов', N'Орест', N'Юлианович', CAST(N'2001-07-14' AS Date), N'м', N'7(1680)508-58-26 ', N'parkes@verizon.net', CAST(N'2017-01-01' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (25, N'Кузьмина', N'Дэнна', N'Витальевна', CAST(N'1993-08-24' AS Date), N'ж', N'7(9940)977-45-73 ', N'nichoj@mac.com', CAST(N'2016-03-27' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (26, N'Александров', N'Станислав', N'Эдуардович', CAST(N'1981-07-04' AS Date), N'м', N'7(18)164-05-12 ', N'bigmauler@aol.com', CAST(N'2018-11-08' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (27, N'Андреев', N'Станислав', N'Максович', CAST(N'1975-10-10' AS Date), N'м', N'7(02)993-91-28 ', N'budinger@mac.com', CAST(N'2017-12-26' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (28, N'Дроздов', N'Вольдемар', N'Артемович', CAST(N'1976-02-07' AS Date), N'м', N'7(307)456-99-05 ', N'smpeters@me.com', CAST(N'2017-07-18' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (29, N'Абрамов', N'Станислав', N'Филатович', CAST(N'1989-05-18' AS Date), N'м', N'7(6545)478-87-79 ', N'solomon@att.net', CAST(N'2016-12-08' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (30, N'Гусева', N'Роза', N'Дмитриевна', CAST(N'1999-02-13' AS Date), N'ж', N'7(23)064-51-84 ', N'martyloo@live.com', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (31, N'Лазарев', N'Алексей', N'Богданович', CAST(N'1977-03-10' AS Date), N'м', N'7(0055)737-37-48 ', N'claesjac@me.com', CAST(N'2017-01-02' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (32, N'Большаков', N'Вадим', N'Данилович', CAST(N'1970-05-15' AS Date), N'м', N'7(386)641-13-37 ', N'uncle@gmail.com', CAST(N'2018-08-04' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (33, N'Ефремов', N'Витольд', N'Авксентьевич', CAST(N'1975-12-02' AS Date), N'м', N'7(93)922-14-03 ', N'kwilliams@yahoo.ca', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (34, N'Игнатов', N'Захар', N'Павлович', CAST(N'1998-10-07' AS Date), N'м', N'7(578)574-73-36 ', N'dieman@icloud.com', CAST(N'2017-11-10' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (35, N'Калашников', N'Артур', N'Юрьевич', CAST(N'1972-12-13' AS Date), N'м', N'7(147)947-47-21 ', N'oevans@aol.com', CAST(N'2017-08-20' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (36, N'Овчинникова', N'Лаура', N'Еремеевна', CAST(N'1992-04-03' AS Date), N'ж', N'7(85)829-33-79 ', N'carcus@yahoo.ca', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (37, N'Голубев', N'Иосиф', N'Тимофеевич', CAST(N'1982-05-06' AS Date), N'м', N'7(78)972-73-11 ', N'smcnabb@att.net', CAST(N'2018-08-18' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (38, N'Галкин', N'Эрик', N'Онисимович', CAST(N'1975-01-18' AS Date), N'м', N'7(759)873-77-39 ', N'snunez@verizon.net', CAST(N'2016-07-19' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (39, N'Некрасов', N'Варлам', N'Михайлович', CAST(N'2000-11-12' AS Date), N'м', N'7(019)258-06-35 ', N'dogdude@verizon.net', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (40, N'Федотов', N'Осип', N'Анатольевич', CAST(N'1971-04-13' AS Date), N'м', N'7(590)702-33-06 ', N'breegster@hotmail.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (41, N'Смирнов', N'Мартын', N'Арсеньевич', CAST(N'1996-06-25' AS Date), N'м', N'7(6251)589-02-43 ', N'haddawy@live.com', CAST(N'2017-02-07' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (42, N'Копылов', N'Касьян', N'Робертович', CAST(N'1983-08-04' AS Date), N'м', N'7(5774)679-82-06 ', N'crobles@sbcglobal.net', CAST(N'2018-03-18' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (43, N'Дмитриева', N'Элина', N'Даниловна', CAST(N'1988-12-10' AS Date), N'ж', N'7(787)140-48-84 ', N'vmalik@live.com', CAST(N'2017-02-11' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (44, N'Бирюкова', N'Инара', N'Улебовна', CAST(N'1978-07-21' AS Date), N'ж', N'7(098)346-50-58 ', N'smpeters@hotmail.com', CAST(N'2017-10-01' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (45, N'Васильев', N'Оскар', N'Богданович', CAST(N'1971-01-30' AS Date), N'м', N'7(585)801-94-29 ', N'miturria@verizon.net', CAST(N'2017-05-28' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (46, N'Киселёв', N'Устин', N'Яковлевич', CAST(N'1985-01-08' AS Date), N'м', N'7(83)334-52-76 ', N'dalamb@verizon.net', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (47, N'Кузьмин', N'Леонтий', N'Валерьянович', CAST(N'2000-05-05' AS Date), N'м', N'7(1340)148-90-68 ', N'msloan@hotmail.com', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (48, N'Ефимова', N'Магда', N'Платоновна', CAST(N'1995-08-16' AS Date), N'ж', N'7(9261)386-15-92 ', N'rbarreira@me.com', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (49, N'Воронова', N'Изабелла', N'Вячеславовна', CAST(N'1999-09-24' AS Date), N'ж', N'7(17)433-44-98 ', N'kildjean@sbcglobal.net', CAST(N'2017-12-21' AS Date))
INSERT [dbo].[CLEINTS] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [GenderCode], [Phone], [Email], [RegistrationDate]) VALUES (50, N'Волков', N'Людвиг', N'Витальевич', CAST(N'1977-12-27' AS Date), N'м', N'7(8459)592-05-58 ', N'jrkorson@msn.com', CAST(N'2016-04-27' AS Date))
SET IDENTITY_INSERT [dbo].[CLEINTS] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 1, 1, CAST(N'2019-04-15T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 2, 2, CAST(N'2019-11-27T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 3, 3, CAST(N'2019-07-29T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 4, 4, CAST(N'2019-09-05T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 5, 5, CAST(N'2019-02-04T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 6, 1, CAST(N'2019-06-24T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 7, 6, CAST(N'2019-12-05T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 8, 7, CAST(N'2019-03-19T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 9, 8, CAST(N'2019-10-09T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 10, 9, CAST(N'2019-05-19T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 11, 10, CAST(N'2019-08-02T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 12, 11, CAST(N'2019-12-06T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 12, 12, CAST(N'2019-08-08T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 13, 13, CAST(N'2019-04-14T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 8, 14, CAST(N'2019-09-09T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 14, 15, CAST(N'2019-10-16T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 15, 8, CAST(N'2019-12-07T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 13, 16, CAST(N'2019-09-05T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 16, 5, CAST(N'2019-11-26T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 17, 17, CAST(N'2019-07-30T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 11, 18, CAST(N'2019-07-07T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 2, 14, CAST(N'2019-12-15T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 18, 19, CAST(N'2019-12-16T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 6, 20, CAST(N'2019-06-28T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 19, 2, CAST(N'2019-12-30T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 11, 13, CAST(N'2019-02-26T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 20, 15, CAST(N'2019-11-15T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 19, 21, CAST(N'2019-09-13T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 21, 21, CAST(N'2019-03-06T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 18, 22, CAST(N'2019-04-11T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 22, 19, CAST(N'2019-07-12T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 19, 23, CAST(N'2019-07-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 23, 4, CAST(N'2019-11-23T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 22, 17, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 20, 24, CAST(N'2019-11-27T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 4, 10, CAST(N'2019-12-23T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 24, 6, CAST(N'2019-09-17T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 25, 25, CAST(N'2019-07-02T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 26, 22, CAST(N'2019-08-12T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 27, 26, CAST(N'2019-04-15T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 28, 27, CAST(N'2019-06-10T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 27, 28, CAST(N'2019-02-21T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 29, 23, CAST(N'2019-10-14T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 29, 29, CAST(N'2019-12-15T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 30, 30, CAST(N'2019-08-24T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 31, 16, CAST(N'2019-06-15T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 32, 20, CAST(N'2019-04-22T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 27, 28, CAST(N'2019-02-24T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 22, 31, CAST(N'2019-02-15T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 19, 17, CAST(N'2019-07-09T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 33, 18, CAST(N'2019-08-24T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 27, 32, CAST(N'2019-08-25T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 16, 21, CAST(N'2019-06-21T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 16, 16, CAST(N'2019-12-28T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 3, 1, CAST(N'2019-01-29T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 16, 11, CAST(N'2019-11-30T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 14, 33, CAST(N'2019-10-17T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 20, 34, CAST(N'2019-03-16T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 32, 33, CAST(N'2019-11-14T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 34, 35, CAST(N'2019-12-18T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 17, 2, CAST(N'2019-06-14T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 18, 22, CAST(N'2019-07-05T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 14, 14, CAST(N'2019-10-14T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 9, 17, CAST(N'2019-08-21T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 24, 14, CAST(N'2019-05-28T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 22, 36, CAST(N'2019-09-19T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 12, 37, CAST(N'2019-06-22T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 13, 38, CAST(N'2019-08-08T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 10, 20, CAST(N'2019-08-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 10, 1, CAST(N'2019-03-04T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 11, 16, CAST(N'2019-03-22T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 31, 39, CAST(N'2019-06-05T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 34, 14, CAST(N'2019-04-21T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 33, 34, CAST(N'2019-07-28T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 33, 3, CAST(N'2019-10-10T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 2, 27, CAST(N'2019-04-05T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 35, 29, CAST(N'2019-07-30T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 36, 20, CAST(N'2019-12-30T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 7, 14, CAST(N'2019-06-29T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 3, 13, CAST(N'2019-08-19T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 37, 38, CAST(N'2019-11-05T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 14, 32, CAST(N'2019-01-19T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 37, 40, CAST(N'2019-04-14T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 23, 41, CAST(N'2019-05-27T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 17, 14, CAST(N'2019-06-16T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 38, 41, CAST(N'2019-08-12T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 36, 36, CAST(N'2019-04-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 20, 25, CAST(N'2019-05-23T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 26, 42, CAST(N'2019-09-20T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 15, 25, CAST(N'2019-02-24T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 1, 41, CAST(N'2019-05-01T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 18, 39, CAST(N'2019-05-27T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 27, 34, CAST(N'2019-02-16T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 38, 26, CAST(N'2019-03-23T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 29, 3, CAST(N'2019-12-24T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 32, 43, CAST(N'2019-05-09T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 39, 26, CAST(N'2019-10-05T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 30, 4, CAST(N'2019-04-26T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 34, 4, CAST(N'2019-08-05T10:10:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 13, 31, CAST(N'2019-12-19T15:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'мужской')
GO
SET IDENTITY_INSERT [dbo].[SERVESYS] ON 

INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (1, N'Замена жидкости в кондиционере', N'Услуги автосервиса\Кондиционер.jpg', N'8 час', 3040, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (2, N'Ремонт и замена коллектора', N'Услуги автосервиса\Выхлопная система.jpg', N'150 мин', 2770, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (3, N'Замена актуатора сцепления', N'Услуги автосервиса\Сцепление.jpg', N'330 мин', 4100, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (4, N'Замена жидкости ГУР', N'Услуги автосервиса\ГУР.png', N'9 час', 2380, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (5, N'Заправка кондиционеров', N'Услуги автосервиса\Кондиционер.jpg', N'2 час', 4860, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (6, N'Замена масла в вариаторе', N'Услуги автосервиса\Вариатор.jpg', N'2 час', 4720, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (7, N'Ремонт двигателя', N'Услуги автосервиса\Двигатель.png', N'4 час', 2470, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (8, N'Замена заднего сальника АКПП', N'Услуги автосервиса\АКПП.jpg', N'390 мин', 1510, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (9, N'Покраска', N'Услуги автосервиса\Дополнительные услуги.png', N'2 час', 2370, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (10, N'Мойка колес', N'Услуги автосервиса\Шиномонтаж.jpg', N'570 мин', 3490, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (11, N'Замена прокладки впускного-выпуского коллектора', N'Услуги автосервиса\Выхлопная система.jpg', N'3 час', 2980, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (12, N'Диагностика работы двигателя', N'Услуги автосервиса\Двигатель.png', N'150 мин', 2760, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (13, N'Установка сигнализации', N'Услуги автосервиса\Электрика.png', N'4 час', 1760, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (14, N'Замена компрессора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'270 мин', 2720, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (15, N'Замена ремня привода ГУР', N'Услуги автосервиса\ГУР.png', N'10 час', 3350, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (16, N'Замена тормозных колодок', N'Услуги автосервиса\Техническое обслуживание.png', N'8 час', 4260, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (17, N'Замена масла', N'Услуги автосервиса\Техническое обслуживание.png', N'510 мин', 1430, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (18, N'Замена цепи ГРМ', N'Услуги автосервиса\Двигатель.png', N'6 час', 4570, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (19, N'Замена бензонасоса', N'Услуги автосервиса\Топливная система.png', N'4 час', 1780, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (20, N'Ремонт приводного вала', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'210 мин', 4520, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (21, N'Замена подшипника компрессора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'330 мин', 1110, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (22, N'Снятие и установка колес', N'Услуги автосервиса\Шиномонтаж.jpg', N'390 мин', 3130, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (23, N'Замена лямбда зонда', N'Услуги автосервиса\Выхлопная система.jpg', N'270 мин', 770, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (24, N'Замена привода в сборе', N'Услуги автосервиса\transmission.jpg', N'8 час', 3890, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (25, N'Замена тки кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'3 час', 2810, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (26, N'Замена ремня кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'8 час', 4650, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (27, N'Замена охлаждающей жидкости', N'Услуги автосервиса\Техническое обслуживание.png', N'210 мин', 1590, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (28, N'Замена троса сцепления', N'Услуги автосервиса\Сцепление.jpg', N'8 час', 4460, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (29, N'Замена масла в МКПП', N'Услуги автосервиса\КПП.png', N'9 час', 4490, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (30, N'Замена рулевой рейки', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'570 мин', 4840, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (31, N'Ремонт дисков', N'Услуги автосервиса\Шиномонтаж.jpg', N'270 мин', 3860, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (32, N'Замена масла заднего редуктора (моста)', N'Услуги автосервиса\transmission.jpg', N'7 час', 840, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (33, N'Замена подшипника задней ступицы', N'Услуги автосервиса\transmission.jpg', N'270 мин', 1860, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (34, N'Восстановление рулевых реек', N'Услуги автосервиса\Подвеска.png', N'2 час', 1020, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (35, N'Замена рулевой тяги', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'3 час', 570, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (36, N'Ремонт и замена гидроблока АКПП', N'Услуги автосервиса\АКПП.jpg', N'270 мин', 2040, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (37, N'Замена масла раздаточной коробки', N'Услуги автосервиса\transmission.jpg', N'510 мин', 2070, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (38, N'Диагностика кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'10 час', 2590, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (39, N'Ремонт и замена катализатора', N'Услуги автосервиса\Выхлопная система.jpg', N'270 мин', 500, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (40, N'Замена гофры глушителя', N'Услуги автосервиса\Выхлопная система.jpg', N'270 мин', 760, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (41, N'Замена ремня ГРМ', N'Услуги автосервиса\Двигатель.png', N'150 мин', 4630, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (42, N'Ремонт редуктора', N'Услуги автосервиса\КПП.png', N'8 час', 870, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (43, N'Замена электромагнитного клапана без снятия ТНВД', N'Услуги автосервиса\diz.jpg', N'450 мин', 4610, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (44, N'Вулканизация шин', N'Услуги автосервиса\Шиномонтаж.jpg', N'330 мин', 540, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (45, N'Ремонт стартера', N'Услуги автосервиса\Электрика.png', N'8 час', 2680, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (46, N'Ремонт коробки передач', N'Услуги автосервиса\КПП.png', N'450 мин', 1850, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (47, N'Жидкостная промывка топливной системы', N'Услуги автосервиса\Топливная система.png', N'6 час', 3620, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (48, N'Ремонт генератора', N'Услуги автосервиса\Электрика.png', N'210 мин', 1700, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (49, N'Замена масла АКПП', N'Услуги автосервиса\АКПП.jpg', N'450 мин', 2430, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (50, N'Диагностика трансмиссии', N'Услуги автосервиса\transmission.jpg', N'2 час', 2790, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (51, N'Монтаж и снятие шин с диска', N'Услуги автосервиса\Шиномонтаж.jpg', N'10 час', 3990, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (52, N'Замена подшипника передней ступицы', N'Услуги автосервиса\transmission.jpg', N'330 мин', 4020, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (53, N'Замена главного цилиндра сцепления', N'Услуги автосервиса\Сцепление.jpg', N'150 мин', 4910, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (54, N'Установка автомагнитолы', N'Услуги автосервиса\Электрика.png', N'270 мин', 3210, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (55, N'Диагностика рулевых тяг', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'3 час', 1680, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (56, N'Замена радиатора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'9 час', 1770, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (57, N'Замена тормозной жидкости', N'Услуги автосервиса\Техническое обслуживание.png', N'6 час', 2200, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (58, N'Ремонт рулевого управления', N'Услуги автосервиса\Подвеска.png', N'2 час', 3440, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (59, N'Замена заднего редуктора', N'Услуги автосервиса\transmission.jpg', N'330 мин', 2240, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (60, N'Дефектация CVT', N'Услуги автосервиса\Вариатор.jpg', N'3 час', 1830, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (61, N'Замена карданного вала', N'Услуги автосервиса\transmission.jpg', N'2 час', 4450, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (62, N'Замена сцепления', N'Услуги автосервиса\КПП.png', N'330 мин', 4320, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (63, N'Установка системы автозапуска', N'Услуги автосервиса\Электрика.png', N'9 час', 3620, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (64, N'Замена опоры АКПП', N'Услуги автосервиса\АКПП.jpg', N'5 час', 2540, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (65, N'Ремонт бензонасоса', N'Услуги автосервиса\Топливная система.png', N'210 мин', 500, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (66, N'Замена масла переднего редуктора (моста)', N'Услуги автосервиса\transmission.jpg', N'9 час', 3950, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (67, N'Ремонт подвесного подшипника', N'Услуги автосервиса\transmission.jpg', N'7 час', 4440, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (68, N'Тестирование форсунок (стенд)', N'Услуги автосервиса\Топливная система.png', N'6 час', 1600, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (69, N'Диагностика сцепления', N'Услуги автосервиса\Сцепление.jpg', N'6 час', 4210, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (70, N'Замена ступицы в сборе', N'Услуги автосервиса\transmission.jpg', N'150 мин', 4250, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (71, N'Антибактериальная обработка кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'450 мин', 4580, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (72, N'Ремонт глушителя', N'Услуги автосервиса\Выхлопная система.jpg', N'150 мин', 2100, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (73, N'Диагностика рулевого редуктора', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'3 час', 2930, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (74, N'Диагностика подвески', N'Услуги автосервиса\Подвеска.png', N'330 мин', 1460, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (75, N'Замена свечей', N'Услуги автосервиса\Техническое обслуживание.png', N'2 час', 2240, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (76, N'Диагностика инжектора', N'Услуги автосервиса\Топливная система.png', N'330 мин', 3390, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (77, N'Комплексная диагностика автомобиля', N'Услуги автосервиса\Техническое обслуживание.png', N'10 час', 1120, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (78, N'Ремонт раздаточной коробки', N'Услуги автосервиса\КПП.png', N'10 час', 3610, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (79, N'Удаление катализатора', N'Услуги автосервиса\Дополнительные услуги.png', N'510 мин', 1930, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (80, N'Снятие/установка форсунок', N'Услуги автосервиса\diz.jpg', N'5 час', 1470, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (81, N'Развал-схождение', N'Услуги автосервиса\Подвеска.png', N'3 час', 3890, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (82, N'Замена выжимного подшипника', N'Услуги автосервиса\Сцепление.jpg', N'10 час', 2250, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (83, N'Чистка форсунок ультразвуком', N'Услуги автосервиса\Топливная система.png', N'4 час', 3920, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (84, N'Ремонт компрессора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'150 мин', 4760, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (85, N'Замена цилиндра сцепления', N'Услуги автосервиса\Сцепление.jpg', N'8 час', 810, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (86, N'Ремонт подвески (ходовой)', N'Услуги автосервиса\Подвеска.png', N'3 час', 680, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (87, N'Замена фильтров', N'Услуги автосервиса\Техническое обслуживание.png', N'210 мин', 530, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (88, N'Кузовной ремонт', N'Услуги автосервиса\Дополнительные услуги.png', N'150 мин', 2750, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (89, N'Замена прокладки приемной тки', N'Услуги автосервиса\Выхлопная система.jpg', N'570 мин', 4680, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (90, N'Диагностика выхлопной системы автомобиля', N'Услуги автосервиса\Выхлопная система.jpg', N'3 час', 2550, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (91, N'Балансировка колес', N'Услуги автосервиса\Шиномонтаж.jpg', N'390 мин', 4690, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (92, N'Ремонт автоэлектрики', N'Услуги автосервиса\Электрика.png', N'450 мин', 4230, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (93, N'ТО с сохранением гарантии', N'Услуги автосервиса\Техническое обслуживание.png', N'270 мин', 4300, 20)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (94, N'Ремонт карданного вала', N'Услуги автосервиса\transmission.jpg', N'210 мин', 780, 5)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (95, N'Ремонт сцепления', N'Услуги автосервиса\КПП.png', N'10 час', 3290, 25)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (96, N'Замена кулисы АКПП', N'Услуги автосервиса\АКПП.jpg', N'6 час', 3250, 10)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (97, N'Ремонт кронштейна глушителя', N'Услуги автосервиса\Выхлопная система.jpg', N'570 мин', 1410, 0)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (98, N'Замена сальника привода', N'Услуги автосервиса\transmission.jpg', N'570 мин', 3820, 15)
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (99, N'Замена пыльника шруса', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'5 час', 4730, 0)
GO
INSERT [dbo].[SERVESYS] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount]) VALUES (100, N'Замена маховика', N'Услуги автосервиса\Сцепление.jpg', N'10 час', 2400, 25)
SET IDENTITY_INSERT [dbo].[SERVESYS] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[CLEINTS]  WITH CHECK ADD  CONSTRAINT [FK_client_a_import_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[CLEINTS] CHECK CONSTRAINT [FK_client_a_import_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_client_a_import] FOREIGN KEY([ClientID])
REFERENCES [dbo].[CLEINTS] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_client_a_import]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_service_a_import] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[SERVESYS] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_service_a_import]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_service_a_import] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[SERVESYS] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_service_a_import]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_client_a_import] FOREIGN KEY([ClientID])
REFERENCES [dbo].[CLEINTS] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_client_a_import]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [МУХИТАОАОВ автосервис] SET  READ_WRITE 
GO
