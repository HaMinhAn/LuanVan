USE [master]
GO
/****** Object:  Database [orders]    Script Date: 11/27/2023 11:56:08 PM ******/
CREATE DATABASE [orders]
GO
ALTER DATABASE [orders] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [orders].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [orders] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [orders] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [orders] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [orders] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [orders] SET ARITHABORT OFF 
GO
ALTER DATABASE [orders] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [orders] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [orders] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [orders] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [orders] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [orders] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [orders] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [orders] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [orders] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [orders] SET  DISABLE_BROKER 
GO
ALTER DATABASE [orders] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [orders] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [orders] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [orders] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [orders] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [orders] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [orders] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [orders] SET RECOVERY FULL 
GO
ALTER DATABASE [orders] SET  MULTI_USER 
GO
ALTER DATABASE [orders] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [orders] SET DB_CHAINING OFF 
GO
ALTER DATABASE [orders] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [orders] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [orders] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [orders] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'orders', N'ON'
GO
ALTER DATABASE [orders] SET QUERY_STORE = OFF
GO
USE [orders]
GO
/****** Object:  Table [dbo].[item]    Script Date: 11/27/2023 11:56:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[id_oderitem] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[price] [bigint] NOT NULL,
	[quantity] [int] NOT NULL,
	[url] [nvarchar](max) NULL,
	[id_oder] [int] NULL,
 CONSTRAINT [PK__item__605510061B87669C] PRIMARY KEY CLUSTERED 
(
	[id_oderitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufacturer]    Script Date: 11/27/2023 11:56:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturer](
	[id_manufacturer] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_manufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oder]    Script Date: 11/27/2023 11:56:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oder](
	[id_oder] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[created_date] [datetime2](7) NULL,
	[is_paid] [bit] NOT NULL,
	[no] [varchar](255) NULL,
	[phone_number] [numeric](12, 0) NULL,
	[status] [varchar](255) NULL,
	[total_price] [bigint] NOT NULL,
	[name] [nvarchar](max) NULL,
	[id_payment] [int] NULL,
	[username] [nvarchar](max) NULL,
	[email] [varchar](255) NULL,
	[receiver] [nvarchar](max) NULL,
 CONSTRAINT [PK__oder__2043164C182C2DF4] PRIMARY KEY CLUSTERED 
(
	[id_oder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_method]    Script Date: 11/27/2023 11:56:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_method](
	[id_payment] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[item] ON 

INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (12, N'Product 2B', 200000, 1, NULL, 9)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (13, N'Product 2A', 150000, 2, NULL, 9)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (14, N'Product 2B', 200000, 1, NULL, 10)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (15, N'Product 2A', 150000, 2, NULL, 10)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (16, N'Product 2B', 200000, 1, NULL, 16)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (17, N'Product 2A', 150000, 2, NULL, 16)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (18, N'Product 2B', 200000, 1, NULL, 17)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (19, N'Product 2A', 150000, 2, NULL, 17)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (20, N'Product 2B', 200000, 1, NULL, 18)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (21, N'Product 2A', 150000, 2, NULL, 18)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (22, N'Product 2B', 200000, 1, NULL, 19)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (23, N'Product 2A', 150000, 2, NULL, 19)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (24, N'T? T?t Đ?n V? Đ?i', 130000, 2, NULL, 20)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (25, N'Ngh? Giàu & Làm Giàu (Tái B?n 2020)', 88000, 3, NULL, 21)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (26, N'T? T?t Đ?n V? Đ?i', 130000, 4, NULL, 21)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (27, N'Nư?c M? Trong M?t Trump - The United States Of Trump : How The President Really Sees America', 168300, 8, NULL, 22)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (28, N'Hư?ng D?n Căn B?n V? Cách Ki?m Ti?n T? Youtube (Tái B?n 2022)', 152150, 1, NULL, 23)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (29, N'T? T?t Đ?n V? Đ?i', 130000, 1, NULL, 24)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (30, N'T? T?t Đ?n V? Đ?i', 130000, 1, NULL, 25)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (31, N'T? T?t Đ?n V? Đ?i', 130000, 1, NULL, 27)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (32, N'T? T?t Đ?n V? Đ?i', 130000, 1, NULL, 26)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (33, N'T? T?t Đ?n V? Đ?i', 130000, 1, NULL, 28)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (34, N'T? T?t Đ?n V? Đ?i', 130000, 1, NULL, 29)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (35, N'T? T?t Đ?n V? Đ?i', 130000, 1, NULL, 30)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (36, N'Singapore C?a Tôi', 121550, 3, NULL, 31)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (37, N'T? T?t Đ?n V? Đ?i', 130000, 2, NULL, 31)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (38, N'Ngh? Giàu & Làm Giàu (Tái B?n 2020)', 88000, 3, NULL, 31)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (39, N'Singapore C?a Tôi', 121550, 3, NULL, 32)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (40, N'T? T?t Đ?n V? Đ?i', 130000, 2, NULL, 32)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (41, N'Ngh? Giàu & Làm Giàu (Tái B?n 2020)', 88000, 3, NULL, 32)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (42, N'T? T?t Đ?n V? Đ?i', 130000, 3, NULL, 33)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (43, N'Hư?ng D?n Căn B?n V? Cách Ki?m Ti?n T? Youtube (Tái B?n 2022)', 152150, 3, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 34)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (45, N'Hư?ng D?n Căn B?n V? Cách Ki?m Ti?n T? Youtube (Tái B?n 2022)', 152150, 3, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 35)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (46, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 3, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 36)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (47, N'Nước Mỹ Trong Mắt Trump - The United States Of Trump : How The President Really Sees America', 168300, 1, N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/nuoc_my_trong_mat_trump___the_united_states_of_trump_how_the_president_really_sees_america/2020_09_29_09_36_40_1-390x510.jpg?_gl=1*13ecw2f*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2MTA0OS41Ny4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 36)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (48, N'Gia Tộc Morgan', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 37)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (49, N'Những Truyện Hay Viết Cho Thiếu Nhi - Tô Hoài (Tái Bản 2019)', 68000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_180888.jpg', 37)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (50, N'Putin - Logic Của Quyền Lực - Putin: Innenansichten Der Macht', 142800, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216008.jpg', 38)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (51, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 1, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 39)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (52, N'Gia Tộc Morgan', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 40)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (53, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 1, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 41)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (54, N'Putin - Logic Của Quyền Lực - Putin: Innenansichten Der Macht', 142800, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216008.jpg', 42)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (55, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 1, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 43)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (56, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 1, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 44)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (57, N'Tuổi Thơ Dữ Dội - Tập 1 (Tái Bản 2019', 64000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_187162.jpg', 45)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (58, N'Từ Tốt Đến Vĩ Đại', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_09462021_024609.jpg', 46)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (59, N'Nguyên Lý Marketing', 599400, 3, N'https://cdn0.fahasa.com/media/catalog/product/z/3/z3191421803753_d34be7758308b8ee74572ebf885cbf9a.jpg', 47)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (60, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 1, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 48)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (61, N'Từ Tốt Đến Vĩ Đại', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_09462021_024609.jpg', 49)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (62, N'Product 2B', 200000, 1, NULL, 50)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (63, N'Product 2A', 150000, 2, NULL, 50)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (64, N'Product 2B', 200000, 1, NULL, 51)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (65, N'Product 2A', 150000, 2, NULL, 51)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (66, N'Product 2B', 200000, 1, NULL, 52)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (67, N'Product 2A', 150000, 2, NULL, 52)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (68, N'Xiaomi 13', 16990000, 2, N'https://cdn.tgdd.vn/Products/Images/42/267984/xiaomi-13-thumb-den-600x600.jpg', 53)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (69, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 3, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 54)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (70, N'Từ Tốt Đến Vĩ Đại', 130000, 3, N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_09462021_024609.jpg', 54)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (71, N'Tiktok Marketing', 111200, 3, N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline-01.jpg', 54)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (72, N'Gia Tộc Morgan', 130000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 55)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (73, N'Gia Tộc Morgan', 130000, 4, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 56)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (74, N'Gia Tộc Morgan', 130000, 4, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 57)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (75, N'Gia Tộc Morgan', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 58)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (76, N'Gia Tộc Morgan', 130000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 59)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (77, N'Gia Tộc Morgan', 130000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 60)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (78, N'Từ Tốt Đến Vĩ Đại', 130000, 4, N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_09462021_024609.jpg', 61)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (79, N'Từ Tốt Đến Vĩ Đại', 130000, 4, N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_09462021_024609.jpg', 62)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (80, N'Gia Tộc Morgan', 130000, 2, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 62)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (81, N'Gia Tộc Morgan', 130000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 63)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (82, N'Gia Tộc Morgan', 130000, 4, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 64)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (83, N'Putin - Logic Của Quyền Lực - Putin: Innenansichten Der Macht', 142800, 5, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216008.jpg', 66)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (84, N'Putin - Logic Của Quyền Lực - Putin: Innenansichten Der Macht', 142800, 5, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216008.jpg', 65)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (85, N'Gia Tộc Morgan', 130000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 67)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (86, N'Cách Mạng', 128300, 3, N'https://cdn0.fahasa.com/media/catalog/product/c/a/cachmang-1.jpg?_gl=1*obwh0x*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2MjMzMC41Ny4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 68)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (87, N'Gia Tộc Morgan', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 69)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (88, N'Gia Tộc Morgan', 130000, 2, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 70)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (89, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 1, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 70)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (90, N'Gia Tộc Morgan', 130000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 71)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (91, N'Tiktok Marketing', 111200, 4, N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline-01.jpg', 73)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (92, N'Tiktok Marketing', 111200, 4, N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline-01.jpg', 72)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (93, N'Gia Tộc Morgan', 130000, 5, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 72)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (94, N'Gia Tộc Morgan', 130000, 5, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 73)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (95, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 3, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 75)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (96, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 3, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 74)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (97, N'Gia Tộc Morgan', 130000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 75)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (98, N'Gia Tộc Morgan', 130000, 3, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 74)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (99, N'Xiaomi 13', 16990000, 1, N'https://cdn.tgdd.vn/Products/Images/42/267984/xiaomi-13-thumb-den-600x600.jpg', 76)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (100, N'Iphone 12', 14490000, 1, N'https://cdn.tgdd.vn/Products/Images/42/228736/iphone-12-violet-1-600x600.jpg', 76)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (101, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 1, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 77)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (102, N'Gia Tộc Morgan', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 78)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (103, N'Sách test', 100000, 3, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935210223951.jpg', 79)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (104, N'Gia Tộc Morgan', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 80)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (105, N'Gia Tộc Morgan', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 81)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (106, N'Gia Tộc Morgan', 130000, 1, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 82)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (107, N'Tiktok Marketing', 111200, 2, N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline-01.jpg', 83)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (108, N'Nguyên Lý Marketing', 599400, 2, N'https://cdn0.fahasa.com/media/catalog/product/z/3/z3191421803753_d34be7758308b8ee74572ebf885cbf9a.jpg', 84)
INSERT [dbo].[item] ([id_oderitem], [name], [price], [quantity], [url], [id_oder]) VALUES (109, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 2, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 84)
SET IDENTITY_INSERT [dbo].[item] OFF
GO
SET IDENTITY_INSERT [dbo].[oder] ON 

INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (9, N'123 Main Street, City', CAST(N'2023-08-31T23:07:48.9785808' AS DateTime2), 0, N'ad18d5e0-d9b5-451b-8ffe-162e85b27d61', CAST(1234567890 AS Numeric(12, 0)), N'0', 500000, NULL, 1, N'John Doe', NULL, NULL)
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (10, N'123 Main Street, City', CAST(N'2023-08-31T23:12:12.3110363' AS DateTime2), 1, N'326167f5-b80d-468c-8162-2c5222f5b88e', CAST(1234567890 AS Numeric(12, 0)), N'3', 500000, NULL, 1, N'John Doe', NULL, NULL)
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (16, N'123 Main Street, City', CAST(N'2023-08-05T23:17:17.0925393' AS DateTime2), 1, N'170d7967-2a48-4cc2-87ff-e513135e3905', CAST(1234567890 AS Numeric(12, 0)), N'3', 500000, NULL, 1, N'John Doe', NULL, NULL)
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (17, N'123 Main Street, City', CAST(N'2023-09-05T23:19:19.8882800' AS DateTime2), 1, N'2461af8a-074c-4baa-bc4a-4920aef24510', CAST(1234567890 AS Numeric(12, 0)), N'3', 500000, NULL, 1, N'John Doe', N'anb1906618@student.ctu.edu.vn', NULL)
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (18, N'123 Main Street, City', CAST(N'2023-09-05T23:20:44.3851808' AS DateTime2), 1, N'b2a45034-8795-4ef7-8044-4f1c80032cd9', CAST(1234567890 AS Numeric(12, 0)), N'3', 500000, NULL, 1, N'John Doe', N'anb1906618@student.ctu.edu.vn', NULL)
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (19, N'123 Main Street, City', CAST(N'2023-09-05T23:21:26.7484311' AS DateTime2), 1, N'9489eaeb-e5f5-470e-9e1f-fb2acd7d6f69', CAST(1234567890 AS Numeric(12, 0)), N'1', 500000, NULL, 1, N'John Doe', N'anb1906618@student.ctu.edu.vn', NULL)
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (20, N'233 NVC', CAST(N'2023-09-05T23:29:27.6570807' AS DateTime2), 1, N'a4208e27-99fa-46d1-944a-a5a79150c069', CAST(123312312316 AS Numeric(12, 0)), N'3', 260000, NULL, 1, N'Hà Minh An', N'anb1906618@student.ctu.edu.vn', NULL)
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (21, N'233 NVC', CAST(N'2023-09-06T23:22:37.6560939' AS DateTime2), 0, N'7b1f3ada-0718-44e3-84d0-0730ed46f1b5', CAST(123312312316 AS Numeric(12, 0)), N'1', 784000, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (22, N'233 NVC', CAST(N'2023-10-07T21:46:47.6408143' AS DateTime2), 1, N'3d507d90-dcff-4015-879d-c00792d87ca8', CAST(123312312316 AS Numeric(12, 0)), N'1', 1346400, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (23, N'233 NVC', CAST(N'2023-10-07T21:47:17.8690008' AS DateTime2), 1, N'a4c358ee-057e-42a6-b677-1139ce3dbc90', CAST(123312312316 AS Numeric(12, 0)), N'3', 152150, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (24, N'233 NVC', CAST(N'2023-10-07T21:58:29.6745218' AS DateTime2), 1, N'1f5fa88c-0742-48ba-a82a-118b4483dd27', CAST(123312312316 AS Numeric(12, 0)), N'3', 130000, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (25, N'233 NVC', CAST(N'2023-10-07T22:05:14.3575972' AS DateTime2), 1, N'8fceb5b7-888d-4890-a1db-ec4e531bc7cc', CAST(123312312316 AS Numeric(12, 0)), N'3', 130000, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (26, N'233 NVC', CAST(N'2023-10-07T22:05:35.3642179' AS DateTime2), 1, N'2b40fc7f-8778-47a7-8f2e-4c26fe23bf19', CAST(123312312316 AS Numeric(12, 0)), N'2', 130000, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (27, N'233 NVC', CAST(N'2023-11-07T22:05:35.3652802' AS DateTime2), 0, N'e8db89f7-085e-47ba-9590-6f7a7340b573', CAST(123312312316 AS Numeric(12, 0)), N'0', 130000, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (28, N'233 NVC', CAST(N'2023-11-07T22:17:12.2208899' AS DateTime2), 0, N'8016a9a9-78b9-4710-85c3-dfd9f3c2939a', CAST(123312312316 AS Numeric(12, 0)), N'1', 130000, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (29, N'233 NVC', CAST(N'2023-11-07T22:17:49.7670036' AS DateTime2), 1, N'e6334c55-968b-481f-b834-b444b23814ea', CAST(123312312316 AS Numeric(12, 0)), N'3', 130000, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (30, N'233 NVC', CAST(N'2023-11-07T22:17:49.7680034' AS DateTime2), 1, N'8c0be7a6-843a-4ef1-a84b-0b65c6533632', CAST(123312312316 AS Numeric(12, 0)), N'2', 130000, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (31, N'233 NVC', CAST(N'2023-11-07T22:23:00.7381510' AS DateTime2), 0, N'6b8c08db-209b-4028-acbc-6c99ae715459', CAST(123312312316 AS Numeric(12, 0)), N'1', 888650, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (32, N'233 NVC', CAST(N'2023-11-07T22:26:35.0214348' AS DateTime2), 1, N'e8769cc0-0406-4bdd-a8d3-9527e7be668d', CAST(123312312316 AS Numeric(12, 0)), N'0', 888650, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (33, N'233 NVC', CAST(N'2023-11-07T22:28:04.3903848' AS DateTime2), 0, N'19feda1c-4933-45c9-975d-10c9b5b00c4d', CAST(123312312316 AS Numeric(12, 0)), N'1', 390000, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (34, N'233 NVC', CAST(N'2023-11-07T23:03:17.8994482' AS DateTime2), 0, N'a704ed5b-d505-40f4-9580-7d6560a6ca0d', CAST(123312312316 AS Numeric(12, 0)), N'1', 624750, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (35, N'233 NVC', CAST(N'2023-11-07T23:05:31.2500460' AS DateTime2), 0, N'd477ddd9-0aa8-4b0a-900d-677a6e3d90e2', CAST(123312312316 AS Numeric(12, 0)), N'3', 624750, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (36, N'233 NVC', CAST(N'2023-11-07T23:06:44.3130885' AS DateTime2), 0, N'c2b60313-17a5-4505-9b05-a3e505902485', CAST(123312312316 AS Numeric(12, 0)), N'3', 624750, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (37, N'233 NVC', CAST(N'2023-11-08T22:06:10.7424351' AS DateTime2), 0, N'54fbbcde-d654-4dc0-819c-f1f567eba52b', CAST(123312312316 AS Numeric(12, 0)), N'1', 334000, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (38, N'233 NVC', CAST(N'2023-11-08T22:09:31.8331063' AS DateTime2), 1, N'f5a75aa2-0518-45b0-8bb5-6132d3fb5d1f', CAST(123312312316 AS Numeric(12, 0)), N'3', 142800, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (39, N'233 NVC', CAST(N'2023-11-08T22:45:36.8900974' AS DateTime2), 1, N'ec608684-1911-4d4c-bb1a-d0a8a3da73f8', CAST(123312312316 AS Numeric(12, 0)), N'3', 152150, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (40, N'233 NVC', CAST(N'2023-11-08T22:49:20.0793123' AS DateTime2), 1, N'4ed420ef-256b-4f9a-ae50-5ee2d349732a', CAST(123312312316 AS Numeric(12, 0)), N'3', 130000, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (41, N'233 NVC', CAST(N'2023-11-08T22:50:10.5253434' AS DateTime2), 0, N'bd321b2f-b777-451b-9fd0-3a33bf394151', CAST(123312312316 AS Numeric(12, 0)), N'1', 152150, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (42, N'233 NVC', CAST(N'2023-11-08T22:51:45.3556126' AS DateTime2), 0, N'3ea9dd52-8d60-44e2-b5bb-1002e020c489', CAST(123312312316 AS Numeric(12, 0)), N'1', 142800, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (43, N'233 NVC', CAST(N'2023-11-08T22:53:57.4602225' AS DateTime2), 0, N'92daf2f2-0555-4882-a761-b87eefbde4c7', CAST(123312312316 AS Numeric(12, 0)), N'0', 152150, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (44, N'233 NVC', CAST(N'2023-11-08T22:55:44.1318165' AS DateTime2), 0, N'7554f820-51c5-480b-b5fb-2dc46cbab422', CAST(123312312316 AS Numeric(12, 0)), N'1', 152150, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (45, N'233 NVC', CAST(N'2023-11-08T23:01:15.5769724' AS DateTime2), 0, N'ac564fbf-4d1c-43b6-bfdd-7a644a808c76', CAST(123312312316 AS Numeric(12, 0)), N'1', 192000, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (46, N'233 NVC', CAST(N'2023-11-08T23:02:45.9215992' AS DateTime2), 0, N'73233b2c-46a7-4594-be17-28722379201c', CAST(123312312316 AS Numeric(12, 0)), N'1', 130000, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (47, N'233 NVC', CAST(N'2023-11-08T23:04:00.4405946' AS DateTime2), 0, N'8806c796-4bd9-4fc6-92e3-c5ed70d9ca59', CAST(123312312316 AS Numeric(12, 0)), N'1', 1798200, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (48, N'233 NVC', CAST(N'2023-11-09T00:49:47.7277426' AS DateTime2), 0, N'3ca28974-b63a-4ff4-9779-78ae20329fb6', CAST(123312312316 AS Numeric(12, 0)), N'1', 152150, NULL, 1, N'admin', N'vrmsnia@hldrive.com', N'Nguyên Văn A')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (49, N'233 nvc', CAST(N'2023-11-10T00:35:53.8199708' AS DateTime2), 0, N'aefba327-cb5c-4d31-befe-fa3c9c514bd6', CAST(93232353522 AS Numeric(12, 0)), N'1', 130000, NULL, 1, N'admin', N'anb1906618@gmail.com', N'Nguyen Van B')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (50, N'123 Main Street, City', CAST(N'2023-11-10T21:12:51.6613806' AS DateTime2), 0, N'b83fe770-c1cd-44db-a4a2-4fc9cef60593', CAST(123456789011 AS Numeric(12, 0)), N'1', 500000, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'John Doe')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (51, N'123 Main Street, City', CAST(N'2023-11-10T21:21:47.6630345' AS DateTime2), 0, N'f33648b9-2cea-4e1a-af42-059ca95a36e8', CAST(123456789011 AS Numeric(12, 0)), N'1', 500000, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'John Doe')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (52, N'123 Main Street, City', CAST(N'2023-11-10T14:24:11.0708910' AS DateTime2), 0, N'49437837-a145-4286-bf6f-1065472be73b', CAST(123456789011 AS Numeric(12, 0)), N'1', 500000, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'John Doe')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (53, N'233 nvc', CAST(N'2023-11-10T15:55:33.6126720' AS DateTime2), 0, N'9dd03014-9be6-4107-867d-a685aa7b08db', CAST(93232353522 AS Numeric(12, 0)), N'1', 33980000, NULL, 1, N'admin', N'anb1906618@gmail.com', N'Nguyen Van B')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (54, N'233 NVC', CAST(N'2023-11-10T23:35:48.2109058' AS DateTime2), 1, N'44a73828-30a3-4d02-a6e8-d06d0a7808c5', CAST(123455668677 AS Numeric(12, 0)), N'1', 1180050, NULL, 2, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (55, N'233 NVC', CAST(N'2023-11-11T14:39:24.8283184' AS DateTime2), 0, N'71689854-a206-4d1a-bbe2-4b9dea502109', CAST(123455668677 AS Numeric(12, 0)), N'2', 390000, NULL, 1, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (56, N'233 NVC', CAST(N'2023-11-11T14:40:02.0799238' AS DateTime2), 1, N'c53e6604-f94d-4c22-950c-e57f9a1f9ea0', CAST(123455668677 AS Numeric(12, 0)), N'3', 520000, NULL, 1, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (57, N'233 NVC', CAST(N'2023-11-11T14:41:52.1703774' AS DateTime2), 0, N'c08dbe08-07ad-4544-83f0-3c3c29a14c6d', CAST(123455668677 AS Numeric(12, 0)), N'1', 520000, NULL, 1, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (58, N'233 NVC', CAST(N'2023-11-11T15:18:58.8013836' AS DateTime2), 0, N'825359ad-24cb-4adb-a25a-70b00f87dd3d', CAST(123455663333 AS Numeric(12, 0)), N'1', 130000, NULL, 1, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (59, N'233 NVC', CAST(N'2023-11-11T15:25:06.7751913' AS DateTime2), 0, N'2e820610-6f65-4f0e-b729-dd1fc15f1712', CAST(123455668677 AS Numeric(12, 0)), N'1', 390000, NULL, 1, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (60, N'233 NVC', CAST(N'2023-11-11T15:25:36.9879500' AS DateTime2), 0, N'386181df-adfb-400b-bdfc-b9359334eb1f', CAST(123455668677 AS Numeric(12, 0)), N'1', 390000, NULL, 1, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (61, N'233 NVC', CAST(N'2023-11-11T15:32:50.6966768' AS DateTime2), 0, N'2f2eda02-5019-496e-ab93-ac02d8f20b7b', CAST(123455668677 AS Numeric(12, 0)), N'1', 520000, NULL, 1, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (62, N'233 NVC', CAST(N'2023-11-11T15:37:38.7400989' AS DateTime2), 0, N'ba76d178-172c-4c78-a59a-2140918fc8b6', CAST(123455668677 AS Numeric(12, 0)), N'1', 780000, NULL, 1, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (63, N'233 NVC', CAST(N'2023-11-11T15:42:01.0517565' AS DateTime2), 0, N'55f4cf3f-0540-4d1d-ad68-287e1a1591a9', CAST(123455668677 AS Numeric(12, 0)), N'1', 390000, NULL, 1, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (64, N'233 NVC', CAST(N'2023-11-11T15:43:53.7811589' AS DateTime2), 0, N'2c7e9914-3490-4f5d-93c9-8b62b8d45550', CAST(123455668677 AS Numeric(12, 0)), N'1', 520000, NULL, 1, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (65, N'233 NVC', CAST(N'2023-11-11T15:59:07.4593829' AS DateTime2), 1, N'45ced689-c2ea-4f75-8326-cc6475c15b64', CAST(123455668677 AS Numeric(12, 0)), N'1', 714000, NULL, 2, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (66, N'233 NVC', CAST(N'2023-11-11T15:59:07.4593829' AS DateTime2), 1, N'71046d31-5683-4446-9b36-cd5a6f9684a5', CAST(123455668677 AS Numeric(12, 0)), N'2', 714000, NULL, 2, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (67, N'233 NVC', CAST(N'2023-11-11T16:01:59.7123384' AS DateTime2), 0, N'f49f3d60-df33-4934-919b-12d0f1c24319', CAST(123455668677 AS Numeric(12, 0)), N'0', 390000, NULL, 1, N'admin', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (68, N'233 nvc', CAST(N'2023-11-12T03:44:40.1166090' AS DateTime2), 0, N'6b5a74d2-6362-46c4-a984-cafc95f36870', CAST(93232353522 AS Numeric(12, 0)), N'2', 384900, NULL, 1, N'admin', N'anb1906618@gmail.com', N'Nguyen Van B')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (69, N'244 nvc', CAST(N'2023-11-12T03:46:07.8737060' AS DateTime2), 0, N'3cd6dbc3-52cc-4e24-8aa5-a59d4b987fc8', CAST(93232353522 AS Numeric(12, 0)), N'1', 130000, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'Nguyen Van B')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (70, N'233 nvc', CAST(N'2023-11-12T04:08:24.7921600' AS DateTime2), 0, N'cf410e14-b121-43d7-be64-75a23f689249', CAST(93232353522 AS Numeric(12, 0)), N'1', 412150, NULL, 1, N'admin', N'anb1906618@student.ctu.edu.vn', N'Nguyen Van B')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (71, N'233 nvc', CAST(N'2023-11-12T04:18:26.2605460' AS DateTime2), 1, N'dff9d63d-49d7-4c7e-90c7-6559ab63c9fa', CAST(93232353522 AS Numeric(12, 0)), N'1', 390000, NULL, 2, N'admin', N'anb1906618@student.ctu.edu.vn', N'Nguyen Van B')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (72, N'233 NVC', CAST(N'2023-11-14T22:29:29.2667853' AS DateTime2), 1, N'82d20d6d-bc2a-480c-b71d-057eddc90653', CAST(123455668677 AS Numeric(12, 0)), N'1', 1094800, NULL, 2, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (73, N'233 NVC', CAST(N'2023-11-14T22:29:29.2667853' AS DateTime2), 1, N'0f9be8f3-ed4d-4834-9ea7-d2ff0db0e13e', CAST(123455668677 AS Numeric(12, 0)), N'1', 1094800, NULL, 2, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (74, N'233 NVC', CAST(N'2023-11-14T15:43:17.3424590' AS DateTime2), 1, N'93b0e0b7-fe13-4677-8695-99429236f9ca', CAST(123455668677 AS Numeric(12, 0)), N'1', 846450, NULL, 2, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (75, N'233 NVC', CAST(N'2023-11-14T15:43:17.3476540' AS DateTime2), 1, N'56db84c7-22c8-412a-b91f-4d36223d530c', CAST(123455668677 AS Numeric(12, 0)), N'1', 846450, NULL, 2, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (76, N'233 NVC', CAST(N'2023-11-24T14:53:24.8643860' AS DateTime2), 0, N'97dc1549-c59c-4130-af2c-2cb9b857b348', CAST(123455668677 AS Numeric(12, 0)), N'0', 31480000, NULL, 1, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (77, N'233 NVC', CAST(N'2023-11-27T15:10:03.6845631' AS DateTime2), 1, N'7acc9e33-e6e9-46b1-8743-e0673da70cff', CAST(123455668677 AS Numeric(12, 0)), N'1', 152150, NULL, 2, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (78, N'233 NVC', CAST(N'2023-11-27T21:29:44.3684093' AS DateTime2), 0, N'cdd0a67d-8196-4f94-b552-3f4f2dcf09fe', CAST(123455668677 AS Numeric(12, 0)), N'1', 130000, NULL, 1, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (79, N'233 NVC', CAST(N'2023-11-27T21:30:20.1839600' AS DateTime2), 1, N'b52357bc-522b-4cbc-8951-d52baaf6b11a', CAST(123455668677 AS Numeric(12, 0)), N'1', 300000, NULL, 2, N'user1', N'haminhan234@gmail.com', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (80, N'233 NVC', CAST(N'2023-11-27T21:54:34.3108191' AS DateTime2), 0, N'd5193da1-1ec8-45ed-a904-641db9da5081', CAST(123455668677 AS Numeric(12, 0)), N'1', 130000, NULL, 1, N'user1', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (81, N'233 NVC', CAST(N'2023-11-27T22:01:04.5262099' AS DateTime2), 0, N'8e444c3e-f44a-4de8-9335-86d1374ca118', CAST(123455668677 AS Numeric(12, 0)), N'1', 130000, NULL, 1, N'user1', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (82, N'233 NVC', CAST(N'2023-11-27T22:02:39.2030077' AS DateTime2), 1, N'bde46c62-37a6-4e98-9e67-80fe341e198b', CAST(123455668677 AS Numeric(12, 0)), N'3', 130000, NULL, 1, N'user1', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (83, N'233 NVC', CAST(N'2023-11-27T22:08:58.8945250' AS DateTime2), 0, N'abc6546b-a956-4344-8655-8af80dfee6cd', CAST(123455668677 AS Numeric(12, 0)), N'1', 222400, NULL, 1, N'user1', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
INSERT [dbo].[oder] ([id_oder], [address], [created_date], [is_paid], [no], [phone_number], [status], [total_price], [name], [id_payment], [username], [email], [receiver]) VALUES (84, N'233 NVC', CAST(N'2023-11-27T22:09:38.7921141' AS DateTime2), 0, N'b29a0d7f-91ca-44c1-93bc-e8e1bb166e85', CAST(123455668677 AS Numeric(12, 0)), N'0', 1503100, NULL, 1, N'user1', N'anb1906618@student.ctu.edu.vn', N'Hà Minh An')
SET IDENTITY_INSERT [dbo].[oder] OFF
GO
SET IDENTITY_INSERT [dbo].[payment_method] ON 

INSERT [dbo].[payment_method] ([id_payment], [name]) VALUES (1, N'cod')
INSERT [dbo].[payment_method] ([id_payment], [name]) VALUES (2, N'vnpay')
SET IDENTITY_INSERT [dbo].[payment_method] OFF
GO
ALTER TABLE [dbo].[item]  WITH CHECK ADD  CONSTRAINT [FK2w1j4q7q875bm26mre967h6va] FOREIGN KEY([id_oder])
REFERENCES [dbo].[oder] ([id_oder])
GO
ALTER TABLE [dbo].[item] CHECK CONSTRAINT [FK2w1j4q7q875bm26mre967h6va]
GO
ALTER TABLE [dbo].[oder]  WITH CHECK ADD  CONSTRAINT [FKlp0d2f34838xpg3scu5gvhadp] FOREIGN KEY([id_payment])
REFERENCES [dbo].[payment_method] ([id_payment])
GO
ALTER TABLE [dbo].[oder] CHECK CONSTRAINT [FKlp0d2f34838xpg3scu5gvhadp]
GO
USE [master]
GO
ALTER DATABASE [orders] SET  READ_WRITE 
GO
