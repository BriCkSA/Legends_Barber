USE [master]
GO
/****** Object:  Database [Legends_Barbershop_DB]    Script Date: 5/3/2023 1:06:32 AM ******/
CREATE DATABASE [Legends_Barbershop_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Legends_Barbershop_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Legends_Barbershop_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Legends_Barbershop_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Legends_Barbershop_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Legends_Barbershop_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Legends_Barbershop_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Legends_Barbershop_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Legends_Barbershop_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Legends_Barbershop_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Legends_Barbershop_DB] SET QUERY_STORE = OFF
GO
USE [Legends_Barbershop_DB]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 5/3/2023 1:06:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_date] [datetime] NULL,
	[shop_id] [int] NULL,
	[person_id] [int] NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lists]    Script Date: 5/3/2023 1:06:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_Lists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 5/3/2023 1:06:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[phone_number] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](max) NULL,
	[user_type] [int] NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 5/3/2023 1:06:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[prov_id] [int] IDENTITY(1,1) NOT NULL,
	[prov_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[prov_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 5/3/2023 1:06:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[shop_id] [int] IDENTITY(1,1) NOT NULL,
	[shop_name] [varchar](50) NULL,
	[shop_prov] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_types]    Script Date: 5/3/2023 1:06:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](50) NULL,
 CONSTRAINT [PK_user_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Provinces] ON 

INSERT [dbo].[Provinces] ([prov_id], [prov_name]) VALUES (1, N'Gauteng')
INSERT [dbo].[Provinces] ([prov_id], [prov_name]) VALUES (2, N'Limpopo')
INSERT [dbo].[Provinces] ([prov_id], [prov_name]) VALUES (3, N'KwaZulu Natal')
INSERT [dbo].[Provinces] ([prov_id], [prov_name]) VALUES (4, N'Mpumalanga')
INSERT [dbo].[Provinces] ([prov_id], [prov_name]) VALUES (5, N'Free State')
INSERT [dbo].[Provinces] ([prov_id], [prov_name]) VALUES (6, N'Eastern Cape')
INSERT [dbo].[Provinces] ([prov_id], [prov_name]) VALUES (7, N'Western Cape')
INSERT [dbo].[Provinces] ([prov_id], [prov_name]) VALUES (8, N'North West')
INSERT [dbo].[Provinces] ([prov_id], [prov_name]) VALUES (9, N'Nothren Cape')
SET IDENTITY_INSERT [dbo].[Provinces] OFF
GO
SET IDENTITY_INSERT [dbo].[Shops] ON 

INSERT [dbo].[Shops] ([shop_id], [shop_name], [shop_prov]) VALUES (1, N'Test Shop', 1)
SET IDENTITY_INSERT [dbo].[Shops] OFF
GO
SET IDENTITY_INSERT [dbo].[User_types] ON 

INSERT [dbo].[User_types] ([ID], [type_name]) VALUES (1, N'System Admin')
INSERT [dbo].[User_types] ([ID], [type_name]) VALUES (2, N'Owners')
INSERT [dbo].[User_types] ([ID], [type_name]) VALUES (3, N'Workers')
INSERT [dbo].[User_types] ([ID], [type_name]) VALUES (4, N'Clients')
SET IDENTITY_INSERT [dbo].[User_types] OFF
GO
/****** Object:  Index [IX_People]    Script Date: 5/3/2023 1:06:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_People] ON [dbo].[People]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_Shop]    Script Date: 5/3/2023 1:06:32 AM ******/
ALTER TABLE [dbo].[Shops] ADD  CONSTRAINT [PK_Shop] PRIMARY KEY NONCLUSTERED 
(
	[shop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_booking_person] FOREIGN KEY([person_id])
REFERENCES [dbo].[People] ([ID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_booking_person]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Shops] FOREIGN KEY([shop_id])
REFERENCES [dbo].[Shops] ([shop_id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Shops]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_UType] FOREIGN KEY([user_type])
REFERENCES [dbo].[User_types] ([ID])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_UType]
GO
ALTER TABLE [dbo].[Shops]  WITH CHECK ADD  CONSTRAINT [FK_Shop_province] FOREIGN KEY([shop_prov])
REFERENCES [dbo].[Provinces] ([prov_id])
GO
ALTER TABLE [dbo].[Shops] CHECK CONSTRAINT [FK_Shop_province]
GO
USE [master]
GO
ALTER DATABASE [Legends_Barbershop_DB] SET  READ_WRITE 
GO
