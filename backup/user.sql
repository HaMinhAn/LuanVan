USE [master]
GO
/****** Object:  Database [accounts]    Script Date: 11/28/2023 12:04:55 AM ******/
CREATE DATABASE [accounts]
GO
ALTER DATABASE [accounts] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [accounts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [accounts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [accounts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [accounts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [accounts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [accounts] SET ARITHABORT OFF 
GO
ALTER DATABASE [accounts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [accounts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [accounts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [accounts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [accounts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [accounts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [accounts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [accounts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [accounts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [accounts] SET  DISABLE_BROKER 
GO
ALTER DATABASE [accounts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [accounts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [accounts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [accounts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [accounts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [accounts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [accounts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [accounts] SET RECOVERY FULL 
GO
ALTER DATABASE [accounts] SET  MULTI_USER 
GO
ALTER DATABASE [accounts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [accounts] SET DB_CHAINING OFF 
GO
ALTER DATABASE [accounts] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [accounts] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [accounts] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [accounts] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'accounts', N'ON'
GO
ALTER DATABASE [accounts] SET QUERY_STORE = OFF
GO
USE [accounts]
GO
USE [accounts]
GO
/****** Object:  Sequence [dbo].[hibernate_sequence]    Script Date: 11/28/2023 12:04:55 AM ******/
CREATE SEQUENCE [dbo].[hibernate_sequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[association_value_entry]    Script Date: 11/28/2023 12:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[association_value_entry](
	[id] [bigint] NOT NULL,
	[association_key] [varchar](255) NOT NULL,
	[association_value] [varchar](255) NULL,
	[saga_id] [varchar](255) NOT NULL,
	[saga_type] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/28/2023 12:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[saga_entry]    Script Date: 11/28/2023 12:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[saga_entry](
	[saga_id] [varchar](255) NOT NULL,
	[revision] [varchar](255) NULL,
	[saga_type] [varchar](255) NULL,
	[serialized_saga] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[saga_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[token_entry]    Script Date: 11/28/2023 12:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[token_entry](
	[processor_name] [varchar](255) NOT NULL,
	[segment] [int] NOT NULL,
	[owner] [varchar](255) NULL,
	[timestamp] [varchar](255) NOT NULL,
	[token] [varbinary](max) NULL,
	[token_type] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[processor_name] ASC,
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 11/28/2023 12:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[id_user] [int] NOT NULL,
	[id_role] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/28/2023 12:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[year_of_birth] [datetime] NOT NULL,
	[address] [varchar](255) NULL,
	[age] [int] NULL,
	[name] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[sex] [bit] NULL,
	[username] [varchar](255) NULL,
 CONSTRAINT [PK__users__D2D1463750642216] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id_role], [name]) VALUES (1, N'admin')
INSERT [dbo].[roles] ([id_role], [name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
INSERT [dbo].[user_role] ([id_user], [id_role]) VALUES (1, 2)
INSERT [dbo].[user_role] ([id_user], [id_role]) VALUES (2, 1)
INSERT [dbo].[user_role] ([id_user], [id_role]) VALUES (3, 2)
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id_user], [year_of_birth], [address], [age], [name], [password], [phone], [sex], [username]) VALUES (1, CAST(N'2023-11-07T14:48:00.000' AS DateTime), N'223/46/nvl', 20, N'user1', N'$2a$10$DB0EAX7NB7RO6Q14kCIVZu1xJsqfw49ytFKXkKHOhmZsI8h9CmXTi', N'34234123', 0, N'user1@gmail.com')
INSERT [dbo].[users] ([id_user], [year_of_birth], [address], [age], [name], [password], [phone], [sex], [username]) VALUES (2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, 10, N'admin', N'$2a$10$TQn6J7u2np1jDCNMuaiTnOXcdvaPO6S0c/.AWbSFHDEmRx44d9EZW', N'34234123', 0, N'admin')
INSERT [dbo].[users] ([id_user], [year_of_birth], [address], [age], [name], [password], [phone], [sex], [username]) VALUES (3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, 10, N'user2', N'$2a$10$.TuK.BdZ3tcZCXxk4XFhju3qTu3j7x/Ph5/G8p6KavL11WhrTiC0K', N'0345345345', 0, N'user2@gmail.com')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDXgv5k1v2mh6frxuy5c0hgbau94]    Script Date: 11/28/2023 12:04:56 AM ******/
CREATE NONCLUSTERED INDEX [IDXgv5k1v2mh6frxuy5c0hgbau94] ON [dbo].[association_value_entry]
(
	[saga_id] ASC,
	[saga_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDXk45eqnxkgd8hpdn6xixn8sgft]    Script Date: 11/28/2023 12:04:56 AM ******/
CREATE NONCLUSTERED INDEX [IDXk45eqnxkgd8hpdn6xixn8sgft] ON [dbo].[association_value_entry]
(
	[saga_type] ASC,
	[association_key] ASC,
	[association_value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK2yqlxhjhgilevh7qvt2ve6udh] FOREIGN KEY([id_role])
REFERENCES [dbo].[roles] ([id_role])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK2yqlxhjhgilevh7qvt2ve6udh]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FKr53t650tbjk5yipcm228wf1nc] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FKr53t650tbjk5yipcm228wf1nc]
GO
USE [master]
GO
ALTER DATABASE [accounts] SET  READ_WRITE 
GO
