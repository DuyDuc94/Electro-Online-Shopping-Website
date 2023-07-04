USE [master]
GO
/****** Object:  Database [PRJ_ShoppingOnlineWebsite]    Script Date: 7/4/2023 8:39:56 AM ******/
CREATE DATABASE [PRJ_ShoppingOnlineWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ_ShoppingOnlineWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUYDUC_LAP\MSSQL\DATA\PRJ_ShoppingOnlineWebsite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ_ShoppingOnlineWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUYDUC_LAP\MSSQL\DATA\PRJ_ShoppingOnlineWebsite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ_ShoppingOnlineWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET QUERY_STORE = OFF
GO
USE [PRJ_ShoppingOnlineWebsite]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CateID] [int] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Item]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[ProDetailID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Cart_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Date] [date] NULL,
	[TotalAmount] [float] NULL,
	[Status] [int] NULL,
	[ShippingAddress] [int] NULL,
	[ShippingMethod] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartItemID] [int] NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Order_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CateID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Description] [text] NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Image] [varchar](50) NULL,
	[Color] [varchar](250) NULL,
	[BrandID] [int] NULL,
 CONSTRAINT [PK_Product_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Account]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](32) NULL,
	[Password] [varchar](32) NULL,
	[Role] [bit] NULL,
	[Status] [bit] NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_User_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Address]    Script Date: 7/4/2023 8:39:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Address](
	[UserID] [int] NULL,
	[AddressID] [int] NULL,
	[IsDefault] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User_Account] ADD  CONSTRAINT [DF_User_Account_Role]  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[User_Account] ADD  CONSTRAINT [DF_User_Account_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User_Address] ADD  CONSTRAINT [DF_User_Address_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_Category]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_Account] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User_Account]
GO
ALTER TABLE [dbo].[Cart_Item]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Item_Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([ID])
GO
ALTER TABLE [dbo].[Cart_Item] CHECK CONSTRAINT [FK_Cart_Item_Cart]
GO
ALTER TABLE [dbo].[Cart_Item]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Item_Product_Detail] FOREIGN KEY([ProDetailID])
REFERENCES [dbo].[Product_Detail] ([ID])
GO
ALTER TABLE [dbo].[Cart_Item] CHECK CONSTRAINT [FK_Cart_Item_Product_Detail]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Address] FOREIGN KEY([ShippingAddress])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Order_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Order_Status] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Order_Status]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Cart_Item] FOREIGN KEY([CartItemID])
REFERENCES [dbo].[Cart_Item] ([ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Cart_Item]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Brand]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product] FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product]
GO
ALTER TABLE [dbo].[User_Address]  WITH CHECK ADD  CONSTRAINT [FK_User_Address_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[User_Address] CHECK CONSTRAINT [FK_User_Address_Address]
GO
ALTER TABLE [dbo].[User_Address]  WITH CHECK ADD  CONSTRAINT [FK_User_Address_User_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_Account] ([ID])
GO
ALTER TABLE [dbo].[User_Address] CHECK CONSTRAINT [FK_User_Address_User_Account]
GO
USE [master]
GO
ALTER DATABASE [PRJ_ShoppingOnlineWebsite] SET  READ_WRITE 
GO