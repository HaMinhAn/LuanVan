USE [master]
GO
/****** Object:  Database [books]    Script Date: 11/15/2023 12:38:33 AM ******/
CREATE DATABASE [books]
GO
ALTER DATABASE [books] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [books].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [books] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [books] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [books] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [books] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [books] SET ARITHABORT OFF 
GO
ALTER DATABASE [books] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [books] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [books] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [books] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [books] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [books] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [books] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [books] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [books] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [books] SET  DISABLE_BROKER 
GO
ALTER DATABASE [books] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [books] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [books] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [books] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [books] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [books] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [books] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [books] SET RECOVERY FULL 
GO
ALTER DATABASE [books] SET  MULTI_USER 
GO
ALTER DATABASE [books] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [books] SET DB_CHAINING OFF 
GO
ALTER DATABASE [books] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [books] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [books] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [books] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'books', N'ON'
GO
ALTER DATABASE [books] SET QUERY_STORE = OFF
GO
USE [books]
GO
USE [books]
GO
/****** Object:  Sequence [dbo].[hibernate_sequence]    Script Date: 11/15/2023 12:38:33 AM ******/
CREATE SEQUENCE [dbo].[hibernate_sequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[association_value_entry]    Script Date: 11/15/2023 12:38:33 AM ******/
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
/****** Object:  Table [dbo].[author]    Script Date: 11/15/2023 12:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author](
	[id_author] [int] IDENTITY(1,1) NOT NULL,
	[dob] [datetime2](7) NULL,
	[author_name] [nvarchar](40) NULL,
	[story] [nvarchar](max) NULL,
 CONSTRAINT [PK__author__7411B2542051321A] PRIMARY KEY CLUSTERED 
(
	[id_author] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book]    Script Date: 11/15/2023 12:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[id_book] [int] IDENTITY(1,1) NOT NULL,
	[is_ready] [bit] NULL,
	[name] [nvarchar](255) NULL,
	[price] [bigint] NULL,
	[quantity] [int] NULL,
	[id_category] [int] NULL,
	[id_language] [int] NULL,
	[description] [nvarchar](max) NULL,
	[no] [varchar](255) NULL,
	[id_manufacturer] [int] NULL,
 CONSTRAINT [PK__book__DAE712E8DCCDE818] PRIMARY KEY CLUSTERED 
(
	[id_book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_authors]    Script Date: 11/15/2023 12:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_authors](
	[id_book] [int] NOT NULL,
	[id_author] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/15/2023 12:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id_category] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK__category__E548B6734F0E1C43] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[language]    Script Date: 11/15/2023 12:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[language](
	[id_language] [int] IDENTITY(1,1) NOT NULL,
	[langauge] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufacturer]    Script Date: 11/15/2023 12:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturer](
	[id_manufacturer] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK__manufact__0F53B9C3C5E911B2] PRIMARY KEY CLUSTERED 
(
	[id_manufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[picture]    Script Date: 11/15/2023 12:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[picture](
	[id_picture] [int] IDENTITY(1,1) NOT NULL,
	[caption] [nvarchar](255) NULL,
	[image_path] [nvarchar](max) NULL,
	[id_book] [int] NULL,
 CONSTRAINT [PK__picture__E967C4E58FD7D588] PRIMARY KEY CLUSTERED 
(
	[id_picture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[saga_entry]    Script Date: 11/15/2023 12:38:33 AM ******/
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
/****** Object:  Table [dbo].[token_entry]    Script Date: 11/15/2023 12:38:33 AM ******/
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
SET IDENTITY_INSERT [dbo].[author] ON 

INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (2, NULL, N'Trần Thanh Hải', N'Story')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (3, NULL, N'Jim Collin', N'Story2')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (4, NULL, N'Ron Chernow', N'story3')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1002, NULL, N'Benji Travis', N'story3')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1003, NULL, N'Markus Rach', N'story3')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1004, NULL, N'Philip Kotler', N'story4')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1005, NULL, N'Napoleon Hill', N'story5')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1006, NULL, N'Hubert Seipel', N'story5')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1007, NULL, N'Xuân Chi', N'story5')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1008, NULL, N'Lý Vĩnh Linh', N'story5')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1009, NULL, N'Emmanuel Macron', N'story6')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1010, NULL, N'Phùng Quán', N'story7')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1011, NULL, N'Tô Hoài', N'story7')
INSERT [dbo].[author] ([id_author], [dob], [author_name], [story]) VALUES (1012, CAST(N'2001-12-08T00:00:00.0000000' AS DateTime2), N'Hoàng Hoành', N'story7')
SET IDENTITY_INSERT [dbo].[author] OFF
GO
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (9, NULL, N'Từ Tốt Đến Vĩ Đại', 130000, 10, 2, 1, N'Jim Collins cùng nhóm nghiên cứu đã miệt mài nghiên cứu những công ty có bước nhảy vọt và bền vững để rút ra những kết luận sát sườn, những yếu tố cần kíp để đưa công ty từ tốt đến vĩ đại. Đó là những yếu tố khả năng lãnh đạo, con người, văn hóa, kỷ luật, công nghệ… Những yếu tố này được nhóm nghiên cứu xem xét tỉ mỉ và kiểm chứng cụ thể qua 11 công ty nhảy vọt lên vĩ đại. Mỗi kết luận của nhóm nghiên cứu đều hữu ích, vượt thời gian, ý nghĩa vô cùng to lớn đối với mọi lãnh đạo và quản lý ở mọi loại hình công ty (từ công ty có nền tảng và xuất phát tốt đến những công ty mới khởi nghiệp), và mọi lĩnh vực ngành nghề. Đây là cuốn sách nên đọc đối với bất kỳ lãnh đạo hay quản lý nào!', NULL, 3)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (10, NULL, N'Gia Tộc Morgan', 130000, 10, 3, 2, N'Hình thành, phát triển, sụp đổ rồi lại hồi sinh, có lẽ không một tổ chức nào ẩn chứa nhiều giai thoại, bí mật hay chủ đề gây tranh cãi gay gắt như đế chế ngân hàng Mỹ – Gia tộc Morgan. Đạt Giải thưởng Sách quốc gia và hiện được coi là một tác phẩm kinh điển, Gia tộc Morgan là cuốn tiểu sử tham vọng nhất từng được viết về một triều đại ngân hàng Mỹ. Cuốn sách vẽ nên bức tranh toàn diện về bốn thế hệ nhà Morgan và các công ty bí mật, mạnh mẽ mà họ sở hữu. Với thế lực của mình, đế chế Morgan đã biến nền kinh tế non trẻ của Mỹ thành một cường quốc công nghiệp mạnh nhất thế giới và khiến trung tâm tài chính thế giới dịch chuyển từ London sang New York. Vượt xa cả lịch sử đơn thuần của ngành ngân hàng Mỹ, cuốn sách chính là câu chuyện về sự tiến hóa của nền tài chính hiện đại. Dựa trên các cuộc phỏng vấn rộng rãi cùng quyền truy cập đặc biệt vào kho lưu trữ của gia tộc này, tác đã khắc họa nên bức chân dung hấp dẫn về câu chuyện riêng của nhà Morgan và thế giới hiếm hoi của giới tinh hoa Mỹ và Anh.

Trích đoạn:

Nói về gia tộc Morgan thời kỳ đầu:

“Gia tộc Morgan trước những năm 1935 được coi là sự kết hợp tài chính quyền lực nhất trong lịch sử. Được một chủ ngân hàng người Mỹ tên là George Peabody sáng lập tại London năm 1838, công ty được gia đình Morgan kế thừa và bắt nhánh sang New York. Hai nhà điều hành được biết đến nhiều nhất của Morgan là J. P. Morgan, Sr. (1837-1913) và J. P. Morgan, Jr. (1867-1943), đã kết hợp hoàn hảo

thành “quái thú” J. P. Morgan tồn tại suốt hơn một thế kỷ. Vẻ bề ngoài của họ giống nhau một cách khác thường: từ cái đầu hói, chiếc mũi to đến thân hình quả lê đều khiến người khác nhầm lẫn. Đối với những người ủng hộ, hai thành viên nhà Morgan là khuôn mẫu của những ông chủ ngân hàng cổ điển luôn giữ chữ tín trong từng lời nói và chốt giao dịch chỉ bằng một cái bắt tay. Phe chỉ trích thì cho rằng họ là những tên bạo chúa đạo đức giả chuyên đàn áp các công ty, bày mưu tính kế cùng với quyền lực ngoại bang và khiến nước Mỹ rơi vào cuộc chiến dành lợi nhuận. Không một ai giữ được quan điểm trung lập khi nói về nhà Morgan.”

Nói về con người thật sự của Peabody sau vẻ ngoài vui tính:

“Đằng sau vẻ ngoài vui tính của Peabody là một gã hà tiện cô độc. Ông sống trong những căn phòng tiện nghi ở một khách sạn trên phố Regent và làm việc không ngừng nghỉ, ngoại trừ những lúc thỉnh thoảng đi câu cá. Trong thời gian 12 năm, ông chưa bao giờ nghỉ làm hai ngày liên tiếp và dành trung bình 10 giờ mỗi ngày tại nơi làm việc. Mặc dù có những bài phát biểu gây xúc động về vận mệnh nước Mỹ, ông không trở về quê nhà trong 20 năm và trong thời gian đó, con người ông cũng “sạm màu” cùng với giao dịch ảm đạm của trái phiếu các bang nước Mỹ. Trong đợt khủng hoảng trầm trọng vào đầu những năm 1840–thập kỷ được gán cho cái tên Những năm 40 thiếu đói–nợ các bang ngập sâu tới mức cứ một đồng đô-la thì 50 xu phải dành để trả nợ. Điều tồi tệ nhất xảy ra khi năm bang của Mỹ–Pennsylvania, Mississippi, Indiana, Arkansas và Michigan và lãnh thổ Florida không trả được nợ lãi suất trái phiếu của họ. Trong một liên minh con nợ sơ khai, một số thống đốc bang của Mỹ liên kết với nhau nhằm đánh quỵt. Cho đến nay, vụ Mississippi vô lại vẫn là vụ vỡ nợ đáng hổ thẹn.”

Nói về tầm ảnh hưởng của Pierpont đối với sự kịch tính của thị trường tài chính Mỹ:

“Trong cuộc hoảng loạn năm 1907, Pierpont đã chứng minh rằng ngành tài chính Mỹ có thể cực kỳ kịch tính. Trong một trận chung kết tối thứ Bảy, ngày 2 tháng 11, ông đã nghĩ ra cách giải cứu cho Công ty tín thác Mỹ vẫn đang lung lay, cho Quỹ tín thác Lincoln và cho Moore & Schley, một công ty môi giới đầu cơ có khoảng 25 triệu đô-la. Công ty cuối cùng này nắm trong tay phần lớn cổ phần khổng lồ của Công ty than và sắt Tennessee với tư cách tài sản thế chấp cho các khoản vay. Nếu công ty này phải thanh lý chỗ cổ phần đó thì thị trường chứng khoán có thể sẽ sụp đổ. Nếu đến lượt Moore & Schley sụp đổ thì các ngân hàng khác có thể cũng bị kéo theo.

Giống như một ông bầu tạo nên kiệt tác sân khấu của mình, Pierpont tập hợp các chủ ngân hàng của thành phố tại thư viện riêng. Ông xếp các chủ ngân hàng thương mại tại Phòng Đông, bên dưới các biểu tượng cung hoàng đạo và một tấm thảm có hình thất đại tội, còn ở Phòng Tây là chủ tịch các công ty tín thác ngồi lọt thỏm trong những chiếc ghế salon màu đỏ đậm và ghế bành dưới cái nhìn của Đức mẹ Madonna và các vị thánh. Trong văn phòng của Belle Greene ở giữa, Pierpont ngồi chơi bài như thần Jupiter vô can trước vụ việc nghiêm trọng đang diễn ra.”

Đặc điểm nổi bật:

- Với văn phong vừa giàu sức gợi về ý tưởng, vừa phong phú về thông tin, đôi lúc lãng mạn và hóm hỉnh một cách tinh tế, cuốn sách này có thể sánh với một bộ trường thiên tiểu thuyết về 3 kỷ nguyên thăng trầm của J.P. Morgan, cội rễ của ngành Ngân hàng Mỹ: Thời kỳ các ông trùm, thời kỳ ngoại giao và thời kỳ canh bạc.

- Luận điểm mà cuốn sách này đưa ra là sẽ không bao giờ có một ngân hàng quyền lực, bí ẩn hay giàu có như Gia tộc Morgan nữa. Sẽ không một doanh nghiệp nào có thể mô phỏng những gì mà Rothschilds thể hiện trong thế kỷ XIX hay Morgan trong thế kỷ XX trong vòng 100 năm tới. Ngân hàng đã không còn chiếm giữ vị trí độc tôn trong ngành tài chính. Khi nền tài chính thế giới chín muồi, quyền lực chia đều cho các tổ chức và trung tâm tài chính. Do đó, câu chuyện của chúng ta đưa ra cái nhìn về một thế giới ngân hàng tan biến nhanh chóng trong quá khứ, một thế giới với những bất động sản khổng lồ, bộ sưu tập nghệ thuật cùng du thuyền vượt biển của những ông chủ dành phần lớn thời gian với người đứng đầu nhà nước và tự huyễn hoặc bản thân thuộc tầng lớp hoàng gia cao quý. Trái với nguyên tắc chiếu phối cảnh thông thường, Gia tộc Morgan càng lùi xa về thời gian quá khứ càng được phóng to hơn.

- Chernow làm một công việc mẫu mực trong việc nắm bắt tính cách của các đối tượng của mình: mang đến cuộc sống sống động của những cá nhân như Junius Spencer Morgan, George Peabody, và tất nhiên, chính John Pierpont Morgan. Bản tường thuật chứa đầy những chi tiết nhỏ làm nổi bật tính cách của từng nhân vật: lòng thù hận và sự keo kiệt của Peabody đối với những cá nhân cụ thể trong khi theo đuổi những hành động từ thiện vĩ đại, cách mà Junius Spencer Morgan đã có tất cả những bức thư của con trai ông Pierpont về điều kiện kinh tế và chính trị ở Mỹ, sự chú ý của Pierpont đến trang phục thích hợp (một quả bóng ném vào mùa đông, một chiếc mũ Panama vào mùa hè), và thuộc hạ của Jack chụp ảnh Franklin Delano Roosevelt từ tờ báo buổi sáng của Jack, vì bệnh huyết áp cao và sự căm ghét của mình đối với Roosevelt.

- Những trải nghiệm, những diễn biến, những giải pháp của một ngân hàng thâm sâu và phát triển hàng đầu nước Mỹ, của một nền tài chính đã đi trước chúng ta cả thế kỷ cũng có thể coi là những bài học bổ ích cho các chặng đường phía trước của nền tài chính Việt Nam.

- “Gia tộc Morgan hé lộ góc nhìn xuyên suốt về sự thành hình của bối cảnh tài chính lúc bấy giờ... Một góc nhìn toàn cảnh được nghiên cứu kỹ lưỡng về gia tộc quyền lực nhất trong giới ngân hàng Mỹ suốt thế kỷ qua... Phong cách của Chernow quả thực tinh tế và mềm mại”. — Nhật báo Washington Post

- “Chernow đã khắc họa bức chân dung mới mẻ về gia tộc Morgan và các cộng sự cấp cao tài giỏi, những người góp phần đưa ngân hàng trở thành tập đoàn quyền lực xuyên quốc gia... Những tai tiếng, bi kịch, âm mưu được hé lộ đủ chất liệu để làm nguyên một bộ phim truyền hình”. — USA Today

Về tác giả:

Ron Chernow là một nhà văn, nhà báo, nhà sử học và người viết tiểu sử người Mỹ. Ông là tác giả của hàng loạt tiểu sử bán chạy nhất về các nhân vật lịch sử trong thế giới kinh doanh, tài chính và chính trị Mỹ.

Ông giành giải thưởng Pulitzer Prize for Biography và giải American History Book Prizen ăm 2011 cho cuốn Washington: A Life. Ông cũng là người nhận giải National Book Award for Nonfiction cho cuốn The House of Morgan. Tiểu sử của ông về Alexander Hamilton (2004) và John D. Rockefeller (1998) đều được đề cử cho giải National Book Critics Circle Awards. Là một nhà báo tự do, ông đã viết hơn 60 bài báo trong các ấn phẩm quốc gia.

Mã hàng	8935251400236
Tên Nhà Cung Cấp	Alpha Books
Tác giả	Ron Chernow
Người Dịch	Ninh Phạm
NXB	NXB Thế Giới
Năm XB	2020
Trọng lượng (gr)	1200
Kích Thước Bao Bì	24 x 16 cm
Số trang	1092
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Chính Trị bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Hình thành, phát triển, sụp đổ rồi lại hồi sinh, có lẽ không một tổ chức nào ẩn chứa nhiều giai thoại, bí mật hay chủ đề gây tranh cãi gay gắt như đế chế ngân hàng Mỹ – Gia tộc Morgan. Đạt Giải thưởng Sách quốc gia và hiện được coi là một tác phẩm kinh điển, Gia tộc Morgan là cuốn tiểu sử tham vọng nhất từng được viết về một triều đại ngân hàng Mỹ. Cuốn sách vẽ nên bức tranh toàn diện về bốn thế hệ nhà Morgan và các công ty bí mật, mạnh mẽ mà họ sở hữu. Với thế lực của mình, đế chế Morgan đã biến nền kinh tế non trẻ của Mỹ thành một cường quốc công nghiệp mạnh nhất thế giới và khiến trung tâm tài chính thế giới dịch chuyển từ London sang New York. Vượt xa cả lịch sử đơn thuần của ngành ngân hàng Mỹ, cuốn sách chính là câu chuyện về sự tiến hóa của nền tài chính hiện đại. Dựa trên các cuộc phỏng vấn rộng rãi cùng quyền truy cập đặc biệt vào kho lưu trữ của gia tộc này, tác đã khắc họa nên bức chân dung hấp dẫn về câu chuyện riêng của nhà Morgan và thế giới hiếm hoi của giới tinh hoa Mỹ và Anh.

Trích đoạn:

Nói về gia tộc Morgan thời kỳ đầu:

“Gia tộc Morgan trước những năm 1935 được coi là sự kết hợp tài chính quyền lực nhất trong lịch sử. Được một chủ ngân hàng người Mỹ tên là George Peabody sáng lập tại London năm 1838, công ty được gia đình Morgan kế thừa và bắt nhánh sang New York. Hai nhà điều hành được biết đến nhiều nhất của Morgan là J. P. Morgan, Sr. (1837-1913) và J. P. Morgan, Jr. (1867-1943), đã kết hợp hoàn hảo

thành “quái thú” J. P. Morgan tồn tại suốt hơn một thế kỷ. Vẻ bề ngoài của họ giống nhau một cách khác thường: từ cái đầu hói, chiếc mũi to đến thân hình quả lê đều khiến người khác nhầm lẫn. Đối với những người ủng hộ, hai thành viên nhà Morgan là khuôn mẫu của những ông chủ ngân hàng cổ điển luôn giữ chữ tín trong từng lời nói và chốt giao dịch chỉ bằng một cái bắt tay. Phe chỉ trích thì cho rằng họ là những tên bạo chúa đạo đức giả chuyên đàn áp các công ty, bày mưu tính kế cùng với quyền lực ngoại bang và khiến nước Mỹ rơi vào cuộc chiến dành lợi nhuận. Không một ai giữ được quan điểm trung lập khi nói về nhà Morgan.”

Nói về con người thật sự của Peabody sau vẻ ngoài vui tính:

“Đằng sau vẻ ngoài vui tính của Peabody là một gã hà tiện cô độc. Ông sống trong những căn phòng tiện nghi ở một khách sạn trên phố Regent và làm việc không ngừng nghỉ, ngoại trừ những lúc thỉnh thoảng đi câu cá. Trong thời gian 12 năm, ông chưa bao giờ nghỉ làm hai ngày liên tiếp và dành trung bình 10 giờ mỗi ngày tại nơi làm việc. Mặc dù có những bài phát biểu gây xúc động về vận mệnh nước Mỹ, ông không trở về quê nhà trong 20 năm và trong thời gian đó, con người ông cũng “sạm màu” cùng với giao dịch ảm đạm của trái phiếu các bang nước Mỹ. Trong đợt khủng hoảng trầm trọng vào đầu những năm 1840–thập kỷ được gán cho cái tên Những năm 40 thiếu đói–nợ các bang ngập sâu tới mức cứ một đồng đô-la thì 50 xu phải dành để trả nợ. Điều tồi tệ nhất xảy ra khi năm bang của Mỹ–Pennsylvania, Mississippi, Indiana, Arkansas và Michigan và lãnh thổ Florida không trả được nợ lãi suất trái phiếu của họ. Trong một liên minh con nợ sơ khai, một số thống đốc bang của Mỹ liên kết với nhau nhằm đánh quỵt. Cho đến nay, vụ Mississippi vô lại vẫn là vụ vỡ nợ đáng hổ thẹn.”

Nói về tầm ảnh hưởng của Pierpont đối với sự kịch tính của thị trường tài chính Mỹ:

“Trong cuộc hoảng loạn năm 1907, Pierpont đã chứng minh rằng ngành tài chính Mỹ có thể cực kỳ kịch tính. Trong một trận chung kết tối thứ Bảy, ngày 2 tháng 11, ông đã nghĩ ra cách giải cứu cho Công ty tín thác Mỹ vẫn đang lung lay, cho Quỹ tín thác Lincoln và cho Moore & Schley, một công ty môi giới đầu cơ có khoảng 25 triệu đô-la. Công ty cuối cùng này nắm trong tay phần lớn cổ phần khổng lồ của Công ty than và sắt Tennessee với tư cách tài sản thế chấp cho các khoản vay. Nếu công ty này phải thanh lý chỗ cổ phần đó thì thị trường chứng khoán có thể sẽ sụp đổ. Nếu đến lượt Moore & Schley sụp đổ thì các ngân hàng khác có thể cũng bị kéo theo.

Giống như một ông bầu tạo nên kiệt tác sân khấu của mình, Pierpont tập hợp các chủ ngân hàng của thành phố tại thư viện riêng. Ông xếp các chủ ngân hàng thương mại tại Phòng Đông, bên dưới các biểu tượng cung hoàng đạo và một tấm thảm có hình thất đại tội, còn ở Phòng Tây là chủ tịch các công ty tín thác ngồi lọt thỏm trong những chiếc ghế salon màu đỏ đậm và ghế bành dưới cái nhìn của Đức mẹ Madonna và các vị thánh. Trong văn phòng của Belle Greene ở giữa, Pierpont ngồi chơi bài như thần Jupiter vô can trước vụ việc nghiêm trọng đang diễn ra.”

Đặc điểm nổi bật:

- Với văn phong vừa giàu sức gợi về ý tưởng, vừa phong phú về thông tin, đôi lúc lãng mạn và hóm hỉnh một cách tinh tế, cuốn sách này có thể sánh với một bộ trường thiên tiểu thuyết về 3 kỷ nguyên thăng trầm của J.P. Morgan, cội rễ của ngành Ngân hàng Mỹ: Thời kỳ các ông trùm, thời kỳ ngoại giao và thời kỳ canh bạc.

- Luận điểm mà cuốn sách này đưa ra là sẽ không bao giờ có một ngân hàng quyền lực, bí ẩn hay giàu có như Gia tộc Morgan nữa. Sẽ không một doanh nghiệp nào có thể mô phỏng những gì mà Rothschilds thể hiện trong thế kỷ XIX hay Morgan trong thế kỷ XX trong vòng 100 năm tới. Ngân hàng đã không còn chiếm giữ vị trí độc tôn trong ngành tài chính. Khi nền tài chính thế giới chín muồi, quyền lực chia đều cho các tổ chức và trung tâm tài chính. Do đó, câu chuyện của chúng ta đưa ra cái nhìn về một thế giới ngân hàng tan biến nhanh chóng trong quá khứ, một thế giới với những bất động sản khổng lồ, bộ sưu tập nghệ thuật cùng du thuyền vượt biển của những ông chủ dành phần lớn thời gian với người đứng đầu nhà nước và tự huyễn hoặc bản thân thuộc tầng lớp hoàng gia cao quý. Trái với nguyên tắc chiếu phối cảnh thông thường, Gia tộc Morgan càng lùi xa về thời gian quá khứ càng được phóng to hơn.

- Chernow làm một công việc mẫu mực trong việc nắm bắt tính cách của các đối tượng của mình: mang đến cuộc sống sống động của những cá nhân như Junius Spencer Morgan, George Peabody, và tất nhiên, chính John Pierpont Morgan. Bản tường thuật chứa đầy những chi tiết nhỏ làm nổi bật tính cách của từng nhân vật: lòng thù hận và sự keo kiệt của Peabody đối với những cá nhân cụ thể trong khi theo đuổi những hành động từ thiện vĩ đại, cách mà Junius Spencer Morgan đã có tất cả những bức thư của con trai ông Pierpont về điều kiện kinh tế và chính trị ở Mỹ, sự chú ý của Pierpont đến trang phục thích hợp (một quả bóng ném vào mùa đông, một chiếc mũ Panama vào mùa hè), và thuộc hạ của Jack chụp ảnh Franklin Delano Roosevelt từ tờ báo buổi sáng của Jack, vì bệnh huyết áp cao và sự căm ghét của mình đối với Roosevelt.

- Những trải nghiệm, những diễn biến, những giải pháp của một ngân hàng thâm sâu và phát triển hàng đầu nước Mỹ, của một nền tài chính đã đi trước chúng ta cả thế kỷ cũng có thể coi là những bài học bổ ích cho các chặng đường phía trước của nền tài chính Việt Nam.

- “Gia tộc Morgan hé lộ góc nhìn xuyên suốt về sự thành hình của bối cảnh tài chính lúc bấy giờ... Một góc nhìn toàn cảnh được nghiên cứu kỹ lưỡng về gia tộc quyền lực nhất trong giới ngân hàng Mỹ suốt thế kỷ qua... Phong cách của Chernow quả thực tinh tế và mềm mại”. — Nhật báo Washington Post

- “Chernow đã khắc họa bức chân dung mới mẻ về gia tộc Morgan và các cộng sự cấp cao tài giỏi, những người góp phần đưa ngân hàng trở thành tập đoàn quyền lực xuyên quốc gia... Những tai tiếng, bi kịch, âm mưu được hé lộ đủ chất liệu để làm nguyên một bộ phim truyền hình”. — USA Today

Về tác giả:

Ron Chernow là một nhà văn, nhà báo, nhà sử học và người viết tiểu sử người Mỹ. Ông là tác giả của hàng loạt tiểu sử bán chạy nhất về các nhân vật lịch sử trong thế giới kinh doanh, tài chính và chính trị Mỹ.

Ông giành giải thưởng Pulitzer Prize for Biography và giải American History Book Prizen ăm 2011 cho cuốn Washington: A Life. Ông cũng là người nhận giải National Book Award for Nonfiction cho cuốn The House of Morgan. Tiểu sử của ông về Alexander Hamilton (2004) và John D. Rockefeller (1998) đều được đề cử cho giải National Book Critics Circle Awards. Là một nhà báo tự do, ông đã viết hơn 60 bài báo trong các ấn phẩm quốc gia.', NULL, 4)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (11, NULL, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', 152150, 10, 2, 1, N'YouTube đã thay đổi hoàn toàn thế giới hiện đại – từ cách chúng ta xem video, kết nối, cho đến cách chúng ta mở rộng thị trường với những cơ hội mới dành cho những cá nhân giàu tham vọng. Ngày nay trên thế giới, hàng nghìn người đang kiếm được những thu nhập triệu đô từ video trực tuyến, nhưng họ làm điều đó bằng cách nào? Với cuốn sách “Youtube Secrets – Hướng dẫn cách căn bản về kiếm tiền từ Youtube” hai chuyên gia về video trực tuyến Sean Cannel và Benji Travis sẽ mang tới cho các bạn những bí quyết đạt được thành công trên Youtube, đúc kết từ hàng trăm cuộc phỏng vấn với những Youtuber nổi tiếng, cũng như từ chính kinh nghiệm hơn 10 năm hoạt động trên Youtube của họ. Cho dù bạn là người mới hay là những Youtuber kỳ cựu, cuốn sách này sẽ giúp bạn xây dựng được một lực lượng người theo dõi lớn mạnh kiếm được những thu nhập triệu đô và tạo nen những tác động to lớn đến cuộc sống của mọi người.', NULL, 1004)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (12, NULL, N'Tiktok Marketing', 111200, 101, 2, 2, N'YouTube đã thay đổi hoàn toàn thế giới hiện đại – từ cách chúng ta xem video, kết nối, cho đến cách chúng ta mở rộng thị trường với những cơ hội mới dành cho những cá nhân giàu tham vọng. Ngày nay trên thế giới, hàng nghìn người đang kiếm được những thu nhập triệu đô từ video trực tuyến, nhưng họ làm điều đó bằng cách nào? Với cuốn sách “Youtube Secrets – Hướng dẫn cách căn bản về kiếm tiền từ Youtube” hai chuyên gia về video trực tuyến Sean Cannel và Benji Travis sẽ mang tới cho các bạn những bí quyết đạt được thành công trên Youtube, đúc kết từ hàng trăm cuộc phỏng vấn với những Youtuber nổi tiếng, cũng như từ chính kinh nghiệm hơn 10 năm hoạt động trên Youtube của họ. Cho dù bạn là người mới hay là những Youtuber kỳ cựu, cuốn sách này sẽ giúp bạn xây dựng được một lực lượng người theo dõi lớn mạnh kiếm được những thu nhập triệu đô và tạo nen những tác động to lớn đến cuộc sống của mọi người.', NULL, 1005)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (13, NULL, N'Nguyên Lý Marketing', 599400, 2, 2, 1, N'Cuốn sách có thể được xem như là giáo trình kinh điển dành cho bất cứ ai muốn nghiên cứu lĩnh vực marketing, bởi nó chứa bên trong gần như tất cả những gì bạn cần biết về marketing – từ định nghĩa, lý luận, các nguyên tắc, cho đến ứng dụng, ví dụ thực tế. Sách cũng không ngừng được chỉnh sửa, tái biên soạn, cập nhật thêm thông tin, trường hợp nghiên cứu mới cho phù hợp với tình hình kinh tế không ngừng thay đổi.', NULL, 1006)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (14, NULL, N'Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', 88000, 20, 2, 1, N'Tác phẩm này đã giúp tác giả của nó, Napoleon Hill, được tôn vinh bằng danh hiệu “người tạo ra những nhà triệu phú”. Đây cũng là cuốn sách hiếm hoi được đứng trong top của rất nhiều bình chọn theo nhiều tiêu chí khác nhau - bình chọn của độc giả, của giới chuyên môn, của báo chí. Lý do để Think and Grow Rich - Nghĩ giàu và làm giàu có được vinh quang này thật hiển nhiên và dễ hiểu: Bằng việc đọc và áp dụng những phương pháp đơn giản, cô đọng này vào đời sống của mỗi cá nhân mà đã có hàng ngàn người trên thế giới trở thành triệu phú và thành công bền vững. Điều thú vị nhất là các bí quyết này có thể được hiểu và áp dụng bởi bất kỳ một người bình thường nào, hoạt động trong bất cứ lĩnh vực nào. Qua hơn 70 năm tồn tại, những đúc kết về thành công của Napoleon Hill đến nay vẫn không hề bị lỗi thời, ngược lại, thời gian chính là minh chứng sống động cho tính đúng đắn của những bí quyết mà ông chia sẻ. Sinh ra trong một gia đình nghèo vùng Tây Virginia, con đường thành công của Napoleon Hill cũng trải qua nhiều thăng trầm. Khởi đầu bằng chân cộng tác viên cho một tờ báo địa phương lúc 15 tuổi, đến năm 19 tuổi Hill trở thành nhà quản lý mỏ than trẻ tuổi nhất, sau đó bỏ ngang để theo đuổi ngành luật. Napoleon Hill còn kinh qua nhiều nghề như kinh doanh gỗ, xe hơi, viết báo về kinh doanh… Đó là những công việc ông từng nếm trải trước khi 25 tuổi! Song khác với những người thành đạt khác, ông cẩn thận phân tích từng sự kiện trọng đại trong đời mình, rút ra những bài học, rồi tiếp tục rút gọn chúng thành các nguyên tắc căn bản, tổ chức các nguyên tắc ấy thành triết lý sống và rèn luyện... Cơ hội đặc biệt đã đến với Hill trong một lần phỏng vấn để viết về chân dung Andrew Carnegie - ông “vua thép” huyền thoại của Mỹ đã đi lên từ hai bàn tay trắng. Từ lần phỏng vấn đó, Napoleon Hill có dịp tiếp cận với những con người thành đạt và có quyền lực nhất tại Mỹ để tìm hiểu và học hỏi những bí quyết thành công của họ, trong thế so sánh và kiểm chứng với những công thức thành công của Andrew Carnegie. Ông muốn qua đó có thể đúc kết và viết nên một cuốn sách ghi lại những bí quyết giúp các cá nhân bình thường thành những người thành công trong xã hội. Để thực hiện cuốn sách này, Napoleon Hill dành hầu như toàn bộ thời gian và công sức trong suốt gần ba mươi năm để phỏng vấn hơn 500 người nổi tiếng và thành công nhất trong nhiều lĩnh vực khác nhau, cùng hàng ngàn doanh nhân khác - cả những kẻ thất bại và những người thành công. Kết quả của những nghiên cứu không mệt mỏi đó là Think and Grow Rich - Nghĩ giàu và làm giàu - công thức, hay “cẩm nang” để trở thành vượt trội và được xã hội nể trọng.', NULL, 1007)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (15, NULL, N'Putin - Logic Của Quyền Lực - Putin: Innenansichten Der Macht', 142800, 20, 3, 2, N'Tên gốc của tác phẩm là Putin: Innenansichten der Macht. Sách gồm 21 chương, do Hubert Seipel thực hiện trong 5 năm (từ năm 2010 đến 2015). Tác giả đã có hơn 20 buổi phỏng vấn chuyên sâu với Putin, đồng thời tháp tùng ông trên hàng chục chuyến đi trong, ngoài nước. Sách mở ra góc nhìn mới về nhà lãnh đạo Nga. Putin: Logic của quyền lực phát hành ở Việt Nam cuối tháng 11, do dịch giả Phan Xuân Loan chuyển ngữ, Nhà xuất bản Tổng hợp phát hành. Hubert Seipel tái hiện những dấu mốc chính trong cuộc đời Putin. Năm 1975, Putin tốt nghiệp khoa Luật Đại học Tổng hợp Quốc gia Saint Petersburg. Năm 1985, ông trở thành nhân viên tình báo đối ngoại của Liên Xô ở Đức. Năm 1994, ông trở thành phó chủ tịch thứ nhất của thành phố quê nhà Saint Petersburg. Năm 1996, ông chuyển đến Moskva và được bổ nhiệm nhiều chức vụ quan trọng trong văn phòng Tổng thống Nga. Cuối năm 1999, ông trở thành Tổng thống Nga.', NULL, 1007)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (16, NULL, N'Bùi Kiến Thành - Người Mở Khóa Lãng Du', 127500, 20, 3, 1, N'Cánh cửa thời gian trở về lịch sử của dân tộc như được mở ra bởi câu chuyện về cuộc đời của một nhân vật gắn liền với sự đổi thay, chuyển mình của đất nước.Bùi Kiến Thành - Một con người vừa góp phần làm nên lịch sử, vừa chứng kiến nhiều giai đoạn lịch sử quan trọng. Ông từng là:- Trợ lý đặc biệt cho Tổng thống Việt Nam Cộng hòa Ngô Đình Diệm - Đại diện cho Ngân hàng Quốc gia Việt Nam tại Mỹ', NULL, 4)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (17, NULL, N'Singapore Của Tôi', 121550, 20, 3, 1, N'Singapore Của Tôi là tập hợp những bài viết của Lý Vỹ Linh con gái duy nhất của cố Thủ tướng Singapore Lý Quang Diệu kiêm bác sĩ chỉ đạo chuyên môn cấp cao về thần kinh nhi tại Viện Khoa học Thần kinh Quốc gia Singapore, đăng trên các báo Straits Time và Sunday Time, gồm những chuyên mục Think-Tank, một chuyên mục Op-ed ( Ý kiến công luận) của tờ Straits Time, cùng những bài viết giải đáp về các sự kiện lớn. Độc giả cũng có thể tìm thấy trong sách nhiều bài viết về cuộc sống của gia đình danh giá nhất Singapore và những suy tư của Lý Vỹ Linh về giáo dục, y tế và sự phát triển của Singapore', NULL, 3)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (18, NULL, N'Nước Mỹ Trong Mắt Trump - The United States Of Trump : How The President Really Sees America', 168300, 20, 3, 2, N'Nước Mỹ trong mắt Trump là cuốn sách mới nhất của B.O’Reilly, xuất bản cuối 2019, được viết dưới dạng kể chuyện từ những cuộc phỏng vấn trực tiếp của O’Reilly với Tổng thống Mỹ D.Trump và gia đình theo mạch thời gian kèm theo một số bình luận của tác giả; cũng như nghiên cứu của tác giả về các chủ đề liên quan. O’Reilly đã tìm cách lý giải những động lực thúc đẩy Donald Trump trong cuộc sống và cụ thể hơn là trong quyết định tạm gác lại những xa hoa phú quý của một ông trùm bất động sản để tuyên bố tranh cử Tổng thống; chỉ ra sức hút của ông Trump đối với cử tri Mỹ trong năm 2016. Những lập luận và khung phân tích của tác giả chắc chắn rất có ích trong phân tích cuộc tổng tuyển cử Mỹ năm 2020. Ngôn ngữ sắc sảo và ngắn gọn, cùng sự cẩn trọng chi tiết trong nghiên cứu về chủ thể của tác giả mang lại sự hấp dẫn đặc biệt khó cưỡng đối với ai muốn biết về tổng thống Mỹ D. Trump- trong đời thường và trong chính trường.
- Về tác giả: B. O’Reilly có hơn 20 năm là người dẫn chương trình và bình luận viên thời sự của Fox News, đã trở nên quen thuộc với nhiều độc giả Việt Nam thông qua loạt sách Killing, kể về những tình tiết đặc biệt xung quanh cuộc đời của những nhân vật lịch sử nổi tiếng từng bị ám sát. O’Reilly đã có 4 cuốn sách nằm trong danh sách bán chạy nhất của Thời báo New York.

', NULL, 3)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (19, NULL, N'Cách Mạng', 128300, 20, 3, 1, N'Cách Mạng được xuất bản ngày 24-11-2016, đã bán được gần 200.000 bản và là một trong những quyển sách bán chạy nhất nước Pháp trong năm 2016. Không phải ngẫu nhiên mà bản quyền dịch thuật cuốn sách này bán được cho hơn 20 quốc gia, một con số chưa từng có đối với một chính trị gia người Pháp.  Điều gì khiến cuốn sách nhỏ này hấp dẫn đến vậy?', NULL, 1007)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (20, NULL, N'Tuổi Thơ Dữ Dội - Tập 1 (Tái Bản 2019', 64000, 20, 4, 1, N'Tuổi Thơ Dữ Dội là một câu chuyện hay, cảm động viết về tuổi thơ. Sách dày 404 trang mà người đọc không bao giờ muốn ngừng lại, bị lôi cuốn vì những nhân vật ngây thơ có, khôn ranh có, anh hùng có, vì những sự việc khi thì ly kỳ, khi thì hài hước, khi thì gây xúc động đến ứa nước mắt...Tuổi Thơ Dữ Dội không phải chỉ là một câu chuyện cổ tích, mà là một câu chuyện có thật ở trần gian, ở đó, những con người tuổi nhỏ đã tham gia vào cuộc kháng chiến chống xâm lược bảo vệ Tổ quốc với một chuỗi những chiến công đầy ắp li kì và hấp dẫn. Đọc Tuổi Thơ Dữ Dội chính là đọc lại một phần lịch sử tuổi thơ Việt, thấm đẫm xúc động, cảm phục và tự hào..."Nhà thơ - nhạc sĩ Nguyễn Trọng Tạo"', NULL, 1)
INSERT [dbo].[book] ([id_book], [is_ready], [name], [price], [quantity], [id_category], [id_language], [description], [no], [id_manufacturer]) VALUES (21, NULL, N'Những Truyện Hay Viết Cho Thiếu Nhi - Tô Hoài (Tái Bản 2019)', 68000, 4, 4, 1, N'Tập truyện tuyển chọn những truyện hay viết cho thiếu nhi của nhà văn Tô Hoài: Đám cưới chuột, Võ sĩ Bọ Ngựa, Dê và Lợn, Hai con ngỗng, Bàn Quý và Ngựa Con, Mùa xuân đã về đấy…“Bạn đọc nhỏ tuổi hay người lớn đọc đồng thoại? Những tác phẩm viết cho lứa tuổi thơ nổi tiếng trong nước và thế giới đã trả lời câu hỏi ấy. Một sáng tác hay cho các em cũng làm cho cả người lớn thấy hay. Các em và người lớn đều thu nhận được ở tác phẩm ấy những thông cảm cho mỗi lứa tuổi khác nhau, mà người lớn không cần phải giả làm trẻ em mới hiểu được. Người lớn vốn đã thích thú đọc rất hào hứng những tác phẩm tưởng tượng còn “hoang đường” hơn truyện đồng thoại kia mà.” - Nhà văn Tô Hoài -', NULL, 1)
SET IDENTITY_INSERT [dbo].[book] OFF
GO
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (11, 1002)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (9, 3)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (10, 4)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (12, 1003)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (13, 1004)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (14, 1005)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (15, 1005)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (16, 1007)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (17, 1007)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (18, 1007)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (19, 1009)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (20, 1010)
INSERT [dbo].[book_authors] ([id_book], [id_author]) VALUES (21, 1011)
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id_category], [name]) VALUES (1, N'IT')
INSERT [dbo].[category] ([id_category], [name]) VALUES (2, N'Kinh tế')
INSERT [dbo].[category] ([id_category], [name]) VALUES (3, N'Chính trị')
INSERT [dbo].[category] ([id_category], [name]) VALUES (4, N'Sách cho bé')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[language] ON 

INSERT [dbo].[language] ([id_language], [langauge]) VALUES (1, N'Tiếng Việt')
INSERT [dbo].[language] ([id_language], [langauge]) VALUES (2, N'Tiếng Anh')
INSERT [dbo].[language] ([id_language], [langauge]) VALUES (3, N'Tiếng Trung')
INSERT [dbo].[language] ([id_language], [langauge]) VALUES (4, N'Tiếng Nga')
INSERT [dbo].[language] ([id_language], [langauge]) VALUES (5, N'Tiếng Hàn')
INSERT [dbo].[language] ([id_language], [langauge]) VALUES (6, N'Tiếng Nhật')
INSERT [dbo].[language] ([id_language], [langauge]) VALUES (7, N'Tiếng Pháp')
SET IDENTITY_INSERT [dbo].[language] OFF
GO
SET IDENTITY_INSERT [dbo].[manufacturer] ON 

INSERT [dbo].[manufacturer] ([id_manufacturer], [name]) VALUES (1, N'Kim đồng')
INSERT [dbo].[manufacturer] ([id_manufacturer], [name]) VALUES (2, N'Công thương')
INSERT [dbo].[manufacturer] ([id_manufacturer], [name]) VALUES (3, N'Trẻ')
INSERT [dbo].[manufacturer] ([id_manufacturer], [name]) VALUES (4, N'Thế Giới')
INSERT [dbo].[manufacturer] ([id_manufacturer], [name]) VALUES (1004, N'Lao Động')
INSERT [dbo].[manufacturer] ([id_manufacturer], [name]) VALUES (1005, N'Thanh Niên')
INSERT [dbo].[manufacturer] ([id_manufacturer], [name]) VALUES (1006, N'Đại Học Kinh Tế Quốc Dân')
INSERT [dbo].[manufacturer] ([id_manufacturer], [name]) VALUES (1007, N'Tổng Hợp TPHCM')
SET IDENTITY_INSERT [dbo].[manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[picture] ON 

INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (4, N'Trang bia Từ Tốt Đến Vĩ Đại', N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_09462021_024609.jpg', 9)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (5, N'Trang doc 1 Từ Tốt Đến Vĩ Đại', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/tu_tot_den_vi_dai___jim_collins_tai_ban_2021/2021_05_14_14_13_53_2-390x510.jpg?_gl=1*hdat1x*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDEzNS4yNC4wLjA.', 9)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (6, N'Trang doc 2 Từ Tốt Đến Vĩ Đại', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/tu_tot_den_vi_dai___jim_collins_tai_ban_2021/2021_05_14_14_13_53_3-390x510.jpg', 9)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (7, N'Trang bia Gia Tộc Morgan', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216020.jpg?_gl=1*kivfx*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 10)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (8, N'Trang doc 1 Gia Tộc Morgan', N'https://cdn0.fahasa.com/media/catalog/product/m/o/morgan_2.jpg?_gl=1*hrcss9*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NjA1MzAzNC4xLjEuMTY5NjA1NDU5OS4yNi4wLjA.', 10)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (9, N'Trang doc 2 Gia Tộc Morgan', N'https://cdn0.fahasa.com/media/catalog/product/m/o/morgan_bia_final-01_1.jpg', 10)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1004, N'Trang bia Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936066694513.jpg', 11)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1005, N'Trang doc 1 Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/huong_dan_can_ban_ve_cach_kiem_tien_tu_youtube_tai_ban_2022/2023_02_07_10_53_39_2-390x510.jpg?_gl=1*5w5c95*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1MzA5Ny4zLjEuMTY5NzI1MzI1NC41OC4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 11)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1006, N'Trang doc 2 Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube (Tái Bản 2022)', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/huong_dan_can_ban_ve_cach_kiem_tien_tu_youtube_tai_ban_2022/2023_02_07_10_53_39_3-390x510.jpg', 11)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1007, N'Trang bia Tiktok Marketing', N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline-01.jpg', 12)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1008, N'Trang doc 1 Tiktok Marketing', N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline-02_1.png?_gl=1*yx6z6h*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1MzA5Ny4zLjEuMTY5NzI1NTAwNi41OC4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA...', 12)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1009, N'Trang doc 2 Tiktok Marketing', N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline00_1.png', 12)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1010, N'Trang bia Nguyên Lý Marketing', N'https://cdn0.fahasa.com/media/catalog/product/z/3/z3191421803753_d34be7758308b8ee74572ebf885cbf9a.jpg', 13)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1011, N'Trang doc 1 Nguyên Lý Marketing', N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline-02_1.png?_gl=1*yx6z6h*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1MzA5Ny4zLjEuMTY5NzI1NTAwNi41OC4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA...', 13)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1012, N'Trang doc 2 Nguyên Lý Marketing', N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline00_1.png', 13)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1013, N'Trang bia Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', N'https://cdn0.fahasa.com/media/catalog/product/n/g/nghigiaulamgiau_110k-01_bia-1.jpg', 14)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1014, N'Trang doc 1 Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline-02_1.png?_gl=1*yx6z6h*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1MzA5Ny4zLjEuMTY5NzI1NTAwNi41OC4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA...', 14)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1015, N'Trang doc 2 Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', N'https://cdn0.fahasa.com/media/catalog/product/t/i/tiktok_outline00_1.png', 14)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1016, N'Trang bia Putin - Logic Của Quyền Lực - Putin: Innenansichten Der Macht', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_216008.jpg', 15)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1017, N'Trang doc 1 Putin - Logic Của Quyền Lực - Putin: Innenansichten Der Macht', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/putin___logic_cua_quyen_luc___putin_innenansichten_der_macht/2021_03_31_10_11_38_2-390x510.jpg?_gl=1*15hl3kg*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI1OTcwNy4yNi4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 15)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1018, N'Trang doc 2 Putin - Logic Của Quyền Lực - Putin: Innenansichten Der Macht', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/putin___logic_cua_quyen_luc___putin_innenansichten_der_macht/2021_03_31_10_11_38_3-390x510.jpg?_gl=1*77irwq*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI1OTczMS4yLjAuMA..*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 15)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1019, N'Trang bia Bùi Kiến Thành - Người Mở Khóa Lãng Du', N'https://cdn0.fahasa.com/media/catalog/product/h/o/hoi-ky-bui-kien-thanh-b_a-1.jpg', 16)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1020, N'Trang doc 1 Bùi Kiến Thành - Người Mở Khóa Lãng Du', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/putin___logic_cua_quyen_luc___putin_innenansichten_der_macht/2021_03_31_10_11_38_2-390x510.jpg?_gl=1*15hl3kg*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI1OTcwNy4yNi4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 16)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1021, N'Trang doc 2 Bùi Kiến Thành - Người Mở Khóa Lãng Du', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/putin___logic_cua_quyen_luc___putin_innenansichten_der_macht/2021_03_31_10_11_38_3-390x510.jpg?_gl=1*77irwq*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI1OTczMS4yLjAuMA..*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 16)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1022, N'Trang bia Singapore Của Tôi', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/singapore_cua_toi/2020_06_11_11_07_45_1-390x510.JPG?_gl=1*ccilzh*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2MDI1NS4zMS4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 17)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1023, N'Trang doc 1 Singapore Của Tôi', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/singapore_cua_toi/2020_06_11_11_07_45_2-390x510.JPG?_gl=1*7urvkv*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2MDI1NS4zMS4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 17)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1024, N'Trang doc 2 Singapore Của Tôi', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/singapore_cua_toi/2020_06_11_11_07_45_5-390x510.JPG', 17)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1025, N'Trang bia Nước Mỹ Trong Mắt Trump - The United States Of Trump : How The President Really Sees America', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/nuoc_my_trong_mat_trump___the_united_states_of_trump_how_the_president_really_sees_america/2020_09_29_09_36_40_1-390x510.jpg?_gl=1*13ecw2f*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2MTA0OS41Ny4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 18)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1026, N'Trang doc 1 Nước Mỹ Trong Mắt Trump - The United States Of Trump : How The President Really Sees America', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/singapore_cua_toi/2020_06_11_11_07_45_2-390x510.JPG?_gl=1*7urvkv*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2MDI1NS4zMS4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 18)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1027, N'Trang doc 2 Nước Mỹ Trong Mắt Trump - The United States Of Trump : How The President Really Sees America', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/nuoc_my_trong_mat_trump___the_united_states_of_trump_how_the_president_really_sees_america/2020_09_29_09_36_40_4-390x510.png', 18)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1028, N'Trang bia Cách Mạng', N'https://cdn0.fahasa.com/media/catalog/product/c/a/cachmang-1.jpg?_gl=1*obwh0x*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2MjMzMC41Ny4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 19)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1029, N'Trang doc 1 Cách Mạng', N'https://cdn0.fahasa.com/media/catalog/product/c/a/cachmang-3.jpg', 19)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1030, N'Trang doc 2 Cách Mạng', N'https://cdn0.fahasa.com/media/catalog/product/c/a/cachmang-6.jpg', 19)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1031, N'Trang bia Tuổi Thơ Dữ Dội - Tập 1 (Tái Bản 2019', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_187162.jpg', 20)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1032, N'Trang doc 1 Tuổi Thơ Dữ Dội - Tập 1 (Tái Bản 2019', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/tuoi_tho_du_doi___tap_1_tai_ban_2019/2021_07_29_16_46_46_2-390x510.jpg?_gl=1*1idgybs*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2MzU4Ny43LjAuMA..*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 20)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1033, N'Trang doc 2 Tuổi Thơ Dữ Dội - Tập 1 (Tái Bản 2019', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/tuoi_tho_du_doi___tap_1_tai_ban_2019/2021_07_29_16_46_46_3-390x510.jpg?_gl=1*1idgybs*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2MzU4Ny43LjAuMA..*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 20)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1034, N'Trang bia Những Truyện Hay Viết Cho Thiếu Nhi - Tô Hoài (Tái Bản 2019)', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_180888.jpg', 21)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1035, N'Trang doc 1 Những Truyện Hay Viết Cho Thiếu Nhi - Tô Hoài (Tái Bản 2019)', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/nhung_truyen_hay_viet_cho_thieu_nhi___to_hoai_tai_ban_2019/2023_03_13_11_45_29_2-390x510.jpg?_gl=1*3qz4qr*_ga*MTk1MjY4NzE2LjE2OTYwNTMwMzU.*_ga_460L9JMC2G*MTY5NzI1OTY3My40LjEuMTY5NzI2NTM3Ni4yOS4wLjA.*_gcl_aw*R0NMLjE2OTYwNTMwMzUuQ2p3S0NBanc2OW1vQmhCZ0Vpd0FVRkN4Mk02X3NCUTJwdjVQQXlwV3hXay00UlBRQzU0dXVoZW5LWGZNTmlXTExGZjNnX1BUZTJTUlFCb0N5dzRRQXZEX0J3RQ..*_gcl_au*NTAyNTk2MTYuMTY5NjA1MzAzNA..', 21)
INSERT [dbo].[picture] ([id_picture], [caption], [image_path], [id_book]) VALUES (1036, N'Trang doc 2 Những Truyện Hay Viết Cho Thiếu Nhi - Tô Hoài (Tái Bản 2019)', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/nhung_truyen_hay_viet_cho_thieu_nhi___to_hoai_tai_ban_2019/2023_03_13_11_45_29_3-390x510.jpg', 21)
SET IDENTITY_INSERT [dbo].[picture] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDXgv5k1v2mh6frxuy5c0hgbau94]    Script Date: 11/15/2023 12:38:33 AM ******/
CREATE NONCLUSTERED INDEX [IDXgv5k1v2mh6frxuy5c0hgbau94] ON [dbo].[association_value_entry]
(
	[saga_id] ASC,
	[saga_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDXk45eqnxkgd8hpdn6xixn8sgft]    Script Date: 11/15/2023 12:38:33 AM ******/
CREATE NONCLUSTERED INDEX [IDXk45eqnxkgd8hpdn6xixn8sgft] ON [dbo].[association_value_entry]
(
	[saga_type] ASC,
	[association_key] ASC,
	[association_value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK2xwe5skap5oo7npd9xnjffhg0] FOREIGN KEY([id_language])
REFERENCES [dbo].[language] ([id_language])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK2xwe5skap5oo7npd9xnjffhg0]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK4g84ahwfll6e6x2y7ibdo1gub] FOREIGN KEY([id_category])
REFERENCES [dbo].[category] ([id_category])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK4g84ahwfll6e6x2y7ibdo1gub]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FKobw059pa8fkjmsxyfdca407vx] FOREIGN KEY([id_manufacturer])
REFERENCES [dbo].[manufacturer] ([id_manufacturer])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FKobw059pa8fkjmsxyfdca407vx]
GO
ALTER TABLE [dbo].[book_authors]  WITH CHECK ADD  CONSTRAINT [FK6ckcmo509lmjo1wtnr6f5fjv2] FOREIGN KEY([id_book])
REFERENCES [dbo].[book] ([id_book])
GO
ALTER TABLE [dbo].[book_authors] CHECK CONSTRAINT [FK6ckcmo509lmjo1wtnr6f5fjv2]
GO
ALTER TABLE [dbo].[book_authors]  WITH CHECK ADD  CONSTRAINT [FKkwuauutlqmbg98n9y1jtbsopy] FOREIGN KEY([id_author])
REFERENCES [dbo].[author] ([id_author])
GO
ALTER TABLE [dbo].[book_authors] CHECK CONSTRAINT [FKkwuauutlqmbg98n9y1jtbsopy]
GO
ALTER TABLE [dbo].[picture]  WITH CHECK ADD  CONSTRAINT [FK5lifwk23hujpjvi6bvghrispr] FOREIGN KEY([id_book])
REFERENCES [dbo].[book] ([id_book])
GO
ALTER TABLE [dbo].[picture] CHECK CONSTRAINT [FK5lifwk23hujpjvi6bvghrispr]
GO
USE [master]
GO
ALTER DATABASE [books] SET  READ_WRITE 
GO
