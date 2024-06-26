USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 07.04.2024 21:48:39 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07.04.2024 21:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[IDClient] [int] NOT NULL,
	[OrderReceiveCode] [nchar](100) NOT NULL,
	[OrderStatus] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 07.04.2024 21:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderProductID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 07.04.2024 21:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointID] [int] IDENTITY(1,1) NOT NULL,
	[PickupPointIndex] [nvarchar](6) NULL,
	[PickupPointCity] [nvarchar](9) NULL,
	[PickupPointStreet] [nvarchar](20) NULL,
	[PickupPointNumber] [nvarchar](2) NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07.04.2024 21:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductDescription] [nvarchar](100) NOT NULL,
	[ProductCategory] [nvarchar](100) NOT NULL,
	[ProductPhoto] [nvarchar](100) NULL,
	[ProductManufacturer] [nvarchar](100) NOT NULL,
	[ProductCost] [decimal](18, 2) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](100) NULL,
 CONSTRAINT [PK__Product__2EA7DCD52DC3A9CF] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 07.04.2024 21:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07.04.2024 21:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), 10, 12, N'911                                                                                                 ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (2, CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-23T00:00:00.000' AS DateTime), 5, 15, N'912                                                                                                 ', N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (3, CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-24T00:00:00.000' AS DateTime), 11, 20, N'913                                                                                                 ', N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (4, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), 10, 21, N'914                                                                                                 ', N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (5, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 1, 15, N'915                                                                                                 ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (6, CAST(N'2022-05-21T00:00:00.000' AS DateTime), CAST(N'2022-05-27T00:00:00.000' AS DateTime), 32, 43, N'916                                                                                                 ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (7, CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2022-05-28T00:00:00.000' AS DateTime), 20, 32, N'917                                                                                                 ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (8, CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-29T00:00:00.000' AS DateTime), 34, 4, N'918                                                                                                 ', N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (9, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-30T00:00:00.000' AS DateTime), 25, 1, N'919                                                                                                 ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (10, CAST(N'2022-05-25T00:00:00.000' AS DateTime), CAST(N'2022-05-31T00:00:00.000' AS DateTime), 36, 17, N'920                                                                                                 ', N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (21, CAST(N'2024-03-10T21:35:58.547' AS DateTime), CAST(N'2024-03-13T21:35:58.547' AS DateTime), 1, 1, N'921                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (22, CAST(N'2024-03-10T22:38:21.797' AS DateTime), CAST(N'2024-03-13T22:38:21.797' AS DateTime), 33, 1, N'922                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (23, CAST(N'2024-03-10T22:41:09.597' AS DateTime), CAST(N'2024-03-13T22:41:09.597' AS DateTime), 1, 1, N'923                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (24, CAST(N'2024-04-07T20:25:35.973' AS DateTime), CAST(N'2024-04-13T20:25:35.973' AS DateTime), 1, 1, N'924                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (25, CAST(N'2024-04-07T20:27:51.660' AS DateTime), CAST(N'2024-04-13T20:27:51.660' AS DateTime), 8, 1, N'925                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (26, CAST(N'2024-04-07T21:12:51.157' AS DateTime), CAST(N'2024-04-10T21:12:51.157' AS DateTime), 8, 1, N'926                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (27, CAST(N'2024-04-07T21:13:46.653' AS DateTime), CAST(N'2024-04-10T21:13:46.653' AS DateTime), 9, 1, N'927                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (28, CAST(N'2024-04-07T21:13:58.067' AS DateTime), CAST(N'2024-04-10T21:13:58.067' AS DateTime), 5, 1, N'928                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (29, CAST(N'2024-04-07T21:19:07.700' AS DateTime), CAST(N'2024-04-10T21:19:07.700' AS DateTime), 7, 1, N'929                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (30, CAST(N'2024-04-07T21:41:24.650' AS DateTime), CAST(N'2024-04-10T21:41:24.650' AS DateTime), 1, 1, N'930                                                                                                 ', N'Новый')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [IDClient], [OrderReceiveCode], [OrderStatus]) VALUES (31, CAST(N'2024-04-07T21:43:19.643' AS DateTime), CAST(N'2024-04-10T21:43:19.643' AS DateTime), 2, 1, N'931                                                                                                 ', N'Новый')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (1, 1, N'A112T4', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (2, 2, N'F635R4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (3, 3, N'J384T6', 5)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (4, 4, N'D329H3', 6)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (5, 5, N'G432E4', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (6, 6, N'S634B5', 3)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (7, 7, N'G531F4', 5)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (8, 8, N'P764G4', 3)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (9, 9, N'D364R4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (10, 10, N'M542T5', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (11, 1, N'H782T5', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (12, 2, N'G783F5', 3)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (13, 3, N'D572U8', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (14, 4, N'B320R5', 4)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (15, 5, N'S213E3', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (16, 6, N'K345R4', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (17, 7, N'J542F5', 4)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (18, 8, N'C436G5', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (19, 9, N'S326R5', 3)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (20, 10, N'D268G5', 5)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (25, 21, N'A112T4', 20)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (26, 22, N'A112T4', 15)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (27, 23, N'A112T4', 25)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (28, 24, N'K358H6', 7)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (29, 25, N'K358H6', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (30, 26, N'A112T4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (31, 27, N'A112T4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (32, 27, N'B320R5', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (33, 29, N'A112T4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (34, 30, N'A112T4', 19)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [Amount]) VALUES (35, 31, N'A112T4', 18)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (1, N'344288', N'г. Москва', N'ул. Чехова', N'1 ')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (2, N'614164', N'г. Москва', N' ул. Степная', N'30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (3, N'394242', N'г. Москва', N'ул. Коммунистическая', N'43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (4, N'660540', N'г. Москва', N'ул. Солнечная', N'25')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (5, N'125837', N'г. Москва', N'ул. Шоссейная', N'40')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (6, N'125703', N'г. Москва', N'ул. Партизанская', N'49')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (7, N'625283', N'г. Москва', N'ул. Победы', N'46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (8, N'614611', N'г. Москва', N'ул. Молодежная', N'50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (9, N'454311', N'г. Москва', N'ул. Новая', N'19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (10, N'660007', N'г. Москва', N'ул. Октябрьская', N'19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (11, N'603036', N'г. Москва', N'ул. Садовая', N'4 ')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (12, N'450983', N'г. Москва', N'ул. Комсомольская', N'26')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (13, N'394782', N'г. Москва', N'ул. Чехова', N'3 ')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (14, N'603002', N'г. Москва', N'ул. Дзержинского', N'28')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (15, N'450558', N'г. Москва', N'ул. Набережная', N'30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (16, N'394060', N'г. Москва', N'ул. Фрунзе', N'43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (17, N'410661', N'г. Москва', N'ул. Школьная', N'50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (18, N'625590', N'г. Москва', N'ул. Коммунистическая', N'20')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (19, N'625683', N'г. Москва', N'ул. 8 Марта', N'6 ')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (20, N'400562', N'г. Москва', N'ул. Зеленая', N'32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (21, N'614510', N'г. Москва', N'ул. Маяковского', N'47')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (22, N'410542', N'г. Москва', N'ул. Светлая', N'46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (23, N'620839', N'г. Москва', N'ул. Цветочная', N'8 ')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (24, N'443890', N'г. Москва', N'ул. Коммунистическая', N'1 ')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (25, N'603379', N'г. Москва', N'ул. Спортивная', N'46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (26, N'603721', N'г. Москва', N'ул. Гоголя', N'41')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (27, N'410172', N'г. Москва', N'ул. Северная', N'13')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (28, N'420151', N'г. Москва', N'ул. Вишневая', N'32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (29, N'125061', N'г. Москва', N'ул. Подгорная', N'8 ')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (30, N'630370', N'г. Москва', N'ул. Шоссейная', N'24')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (31, N'614753', N'г. Москва', N'ул. Полевая', N'35')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (32, N'426030', N'г. Москва', N'ул. Маяковского', N'44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (33, N'450375', N'г. Москва', N'ул. Клубная', N'44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (34, N'625560', N'г. Москва', N'ул. Некрасова', N'12')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (35, N'630201', N'г. Москва', N'ул. Комсомольская', N'17')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointIndex], [PickupPointCity], [PickupPointStreet], [PickupPointNumber]) VALUES (36, N'190949', N'г. Москва', N'ул. Мичурина', N'26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A112T4', N'Ботинки', N'Женские Ботинки демисезонные kari', N'Женская обувь', N'\products\A112T4.png', N'Kari', CAST(4990.00 AS Decimal(18, 2)), 3, 25, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B320R5', N'Туфли', N'Туфли Rieker женские демисезонные, размер 41, цвет коричневый', N'Женская обувь', N'\products\B320R5.png', N'Rieker', CAST(4300.00 AS Decimal(18, 2)), 2, 12, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B431R5', N'Ботинки', N'Мужские кожаные ботинки/мужские ботинки', N'Мужская обувь', NULL, N'Rieker', CAST(2700.00 AS Decimal(18, 2)), 2, 12, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C436G5', N'Ботинки', N'Ботинки женские, ARGO, размер 40', N'Женская обувь', NULL, N'Alessio Nesca', CAST(10200.00 AS Decimal(18, 2)), 2, 9, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D268G5', N'Туфли', N'Туфли Rieker женские демисезонные, размер 36, цвет коричневый', N'Женская обувь', NULL, N'Rieker', CAST(4399.00 AS Decimal(18, 2)), 3, 12, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D329H3', N'Полуботинки', N'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', N'Женская обувь', N'\products\D329H3.png', N'Alessio Nesca', CAST(1890.00 AS Decimal(18, 2)), 4, 4, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D364R4', N'Туфли', N'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши', N'Женская обувь', NULL, N'Kari', CAST(12400.00 AS Decimal(18, 2)), 2, 5, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D572U8', N'Кроссовки', N'129615-4 Кроссовки мужские', N'Мужская обувь', N'\products\D572U8.png', N'Рос', CAST(4100.00 AS Decimal(18, 2)), 3, 6, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E482R4', N'Полуботинки', N'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный', N'Женская обувь', NULL, N'Kari', CAST(1800.00 AS Decimal(18, 2)), 2, 14, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F427R5', N'Ботинки', N'Ботинки на молнии с декоративной пряжкой FRAU', N'Женская обувь', NULL, N'Rieker', CAST(11800.00 AS Decimal(18, 2)), 4, 11, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F572H7', N'Туфли', N'Туфли Marco Tozzi женские летние, размер 39, цвет черный', N'Женская обувь', N'\products\F572H7.png', N'Marco Tozzi', CAST(2700.00 AS Decimal(18, 2)), 2, 14, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F635R4', N'Ботинки', N'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', N'Женская обувь', N'\products\F635R4.png', N'Marco Tozzi', CAST(3244.00 AS Decimal(18, 2)), 2, 13, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G432E4', N'Туфли', N'Туфли kari женские TR-YR-413017, размер 37, цвет: черный', N'Женская обувь', N'\products\G432E4.png', N'Kari', CAST(2800.00 AS Decimal(18, 2)), 3, 15, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G531F4', N'Ботинки', N'Ботинки женские зимние ROMER арт. 893167-01 Черный', N'Женская обувь', NULL, N'Kari', CAST(6600.00 AS Decimal(18, 2)), 2, 9, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G783F5', N'Ботинки', N'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', N'Мужская обувь', N'\products\G783F5.png', N'Рос', CAST(5900.00 AS Decimal(18, 2)), 2, 8, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H535R5', N'Ботинки', N'Женские Ботинки демисезонные', N'Женская обувь', NULL, N'Rieker', CAST(2300.00 AS Decimal(18, 2)), 2, 7, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H782T5', N'Туфли', N'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', N'Мужская обувь', N'\products\H782T5.png', N'Kari', CAST(4499.00 AS Decimal(18, 2)), 4, 5, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J384T6', N'Ботинки', N'B3430/14 Полуботинки мужские Rieker', N'Мужская обувь', N'\products\J384T6.png', N'Rieker', CAST(3800.00 AS Decimal(18, 2)), 2, 16, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J542F5', N'Тапочки', N'Тапочки мужские Арт.70701-55-67син р.41', N'Мужская обувь', NULL, N'Kari', CAST(500.00 AS Decimal(18, 2)), 3, 12, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K345R4', N'Полуботинки', N'407700/01-02 Полуботинки мужские CROSBY', N'Мужская обувь', NULL, N'CROSBY', CAST(2100.00 AS Decimal(18, 2)), 2, 3, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K358H6', N'Тапочки', N'Тапочки мужские син р.41', N'Мужская обувь', NULL, N'Rieker', CAST(599.00 AS Decimal(18, 2)), 3, 2, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'L754R4', N'Полуботинки', N'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный', N'Женская обувь', NULL, N'Kari', CAST(1700.00 AS Decimal(18, 2)), 2, 7, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'M542T5', N'Кроссовки', N'Кроссовки мужские TOFA', N'Мужская обувь', NULL, N'Rieker', CAST(2800.00 AS Decimal(18, 2)), 5, 3, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N457T5', N'Полуботинки', N'Полуботинки Ботинки черные зимние, мех', N'Женская обувь', NULL, N'CROSBY', CAST(4600.00 AS Decimal(18, 2)), 3, 13, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'O754F4', N'Туфли', N'Туфли женские демисезонные Rieker артикул 55073-68/37', N'Женская обувь', NULL, N'Rieker', CAST(5400.00 AS Decimal(18, 2)), 4, 18, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'P764G4', N'Туфли', N'Туфли женские, ARGO, размер 38', N'Женская обувь', NULL, N'CROSBY', CAST(6800.00 AS Decimal(18, 2)), 3, 15, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S213E3', N'Полуботинки', N'407700/01-01 Полуботинки мужские CROSBY', N'Мужская обувь', NULL, N'CROSBY', CAST(2156.00 AS Decimal(18, 2)), 3, 6, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S326R5', N'Тапочки', N'Мужские кожаные тапочки "Профиль С.Дали" ', N'Мужская обувь', NULL, N'CROSBY', CAST(9900.00 AS Decimal(18, 2)), 3, 15, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S634B5', N'Кеды', N'Кеды Caprice мужские демисезонные, размер 42, цвет черный', N'Мужская обувь', NULL, N'CROSBY', CAST(5500.00 AS Decimal(18, 2)), 3, 6, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'T324F5', N'Сапоги', N'Сапоги замша Цвет: синий', N'Женская обувь', NULL, N'CROSBY', CAST(4699.00 AS Decimal(18, 2)), 2, 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Герасимов ', N'Вячеслав', N'Ростиславович', N'1', N'1', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Суворов ', N'Всеволод', N'Богданович', N'loginDEhuv2018', N'EJFYzS', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Ширяев ', N'Иван', N'Игоревич', N'loginDEfhd2018', N'{4wU7n', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Колобова ', N'Иванна', N'Геннадьевна', N'loginDEaon2018', N'&OmaNE', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Шестаков ', N'Антон', N'Константинович', N'loginDEyat2018', N'ELSTyH', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Игнатьев ', N'Федосей', N'Богданович', N'loginDEmin2018', N'pQ6jze', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Горбунов ', N'Валентин', N'Григорьевич', N'loginDEzal2018', N'zbU8R5', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Терентьева ', N'Анжела', N'Михаиловна', N'loginDEemw2018', N'NxhF5I', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Мясникова ', N'Ия', N'Евсеевна', N'loginDEmqt2018', N'SIasu5', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Горбунов ', N'Григорий', N'Денисович', N'loginDEpxx2018', N'Xv{vjN', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Герасимов ', N'Олег', N'Авксентьевич', N'loginDEetv2018', N'lNi&rF', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Меркушева ', N'Нинель', N'Матвеевна', N'loginDEonq2018', N'mKIIRQ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Степанов ', N'Григорий', N'Матвеевич', N'loginDErhl2018', N'U}rb9j', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Агафонов ', N'Владлен', N'Станиславович', N'loginDEfou2018', N'O+S9hm', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Кузнецов ', N'Фрол', N'Георгьевич', N'loginDElno2018', N'le1vt2', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Игнатьев ', N'Борис', N'Владиславович', N'loginDEtbx2018', N'CQplH|', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Симонов ', N'Юрий', N'Созонович', N'loginDEltw2018', N'zvjkwE', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Степанов ', N'Евсей', N'Федотович', N'loginDEfuz2018', N'ILry03', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Зыков ', N'Вячеслав', N'Антонович', N'loginDEygj2018', N'7b6PUb', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Анисимова ', N'Алина', N'Протасьевна', N'loginDEwpn2018', N'9BBkXP', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Артемьева ', N'Лариса', N'Макаровна', N'loginDEyix2018', N'6zbXg*', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Мамонтова ', N'Ия', N'Христофоровна', N'loginDEtms2018', N'70Z&Zy', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Котова ', N'Светлана', N'Леонидовна', N'loginDEmgl2018', N'QJNgD&', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Фёдорова ', N'Алла', N'Брониславовна', N'loginDEhix2018', N'ZKnd*0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Гущина ', N'Анжела', N'Аркадьевна', N'loginDEwbk2018', N'iJMh5B', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Дмитриев ', N'Григорий', N'Мэлорович', N'loginDEpwa2018', N'yn5MLQ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Дроздова ', N'Фёкла', N'Митрофановна', N'loginDElrx2018', N'lbX+dF', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Гаврилов ', N'Василий', N'Германович', N'loginDEidx2018', N'R2j0mn', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Суханова ', N'Фаина', N'Юрьевна', N'loginDEzmk2018', N'ZrgBk6', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Савельев ', N'Егор', N'Сергеевич', N'loginDEvje2018', N'gCU1fd', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Иванов', N'Иван ', N'Васильевна', N'loginDEwun2018', N'yy+Qhe', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Сазонова ', N'Клавдия', N'Евгеньевна', N'loginDEfzq2018', N'36H8f}', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Шаров ', N'Григорий', N'Созонович', N'loginDEwel2018', N'UU5FTi', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Щербаков ', N'Кондрат', N'Фёдорович', N'loginDEljg2018', N'CT44Gc', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Дроздов ', N'Дмитрий', N'Юлианович', N'loginDEgsp2018', N'9ACW}r', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Молчанов ', N'Юрий', N'Лукьянович', N'loginDEjvp2018', N'etLGcB', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Тихонов ', N'Валентин', N'Авдеевич', N'loginDEapt2018', N'cwx{RH', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Виноградов ', N'Юрий', N'Лукьевич', N'loginDEilb2018', N'IN2Ahc', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Горбунова ', N'Нинель', N'Сергеевна', N'loginDErch2018', N'|&DFy+', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Маслов ', N'Леонид', N'Николаевич', N'loginDEfwx2018', N't|*wCk', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Родионова ', N'Венера', N'Арсеньевна', N'loginDEggp2018', N'bBNxJb', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Агафонов ', N'Пантелеймон', N'Гордеевич', N'loginDEbgb2018', N'VtmP58', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Кудрявцев ', N'Гордей', N'Авксентьевич', N'loginDEnif2018', N'Nhj*t+', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Лыткина ', N'Алевтина', N'Романовна', N'loginDEsvs2018', N'tLgPnC', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Князев ', N'Геласий', N'Евсеевич', N'loginDEghx2018', N'gue+iw', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Бирюкова ', N'Пелагея', N'Дмитрьевна', N'loginDElmy2018', N'X2LtuP', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Быков ', N'Лаврентий', N'Ярославович', N'loginDEevd2018', N'GMbcZN', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Воронов ', N'Олег', N'Яковович', N'loginDEodd2018', N's2|Eb1', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Богданова ', N'Марфа', N'Владимировна', N'loginDEmrj2018', N'blrD&8', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Беляев ', N'Донат', N'Агафонович', N'loginDEyct2018', N'uD+|Ud', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([PickupPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([IDClient])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
