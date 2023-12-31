USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 7/21/2023 11:35:35 PM ******/
CREATE DATABASE [SWP391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.GROOT\MSSQL\DATA\SWP391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.GROOT\MSSQL\DATA\SWP391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP391] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391] SET QUERY_STORE = OFF
GO
USE [SWP391]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[blog_title] [nvarchar](max) NULL,
	[blog_image] [nvarchar](max) NULL,
	[user_id] [int] NOT NULL,
	[post date] [date] NULL,
	[content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[user_id] [int] NOT NULL,
	[content] [nvarchar](200) NULL,
	[product_id] [int] NOT NULL,
	[post_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_name] [nvarchar](50) NULL,
	[orderStatus_id] [int] NOT NULL,
	[order_discount] [int] NULL,
	[order_date] [datetime] NULL,
	[notes] [nvarchar](200) NULL,
	[order_address] [nvarchar](200) NULL,
	[order_phone] [nchar](11) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[order_price] [float] NULL,
	[quantity] [int] NULL,
	[productSize_id] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatus_id] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus_name] [varchar](20) NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[product_price] [float] NULL,
	[category_id] [int] NULL,
	[img] [nvarchar](max) NULL,
	[description] [nvarchar](1000) NULL,
	[PdStatus_id] [int] NOT NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[productSize_id] [int] NOT NULL,
	[productSize_name] [nvarchar](50) NULL,
	[productSize_price] [float] NULL,
 CONSTRAINT [PK_ProductSize] PRIMARY KEY CLUSTERED 
(
	[productSize_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatus](
	[PdStatus_id] [int] IDENTITY(1,1) NOT NULL,
	[PdStatus_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductStatus] PRIMARY KEY CLUSTERED 
(
	[PdStatus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role_id] [int] NULL,
	[UserStatus_id] [int] NOT NULL,
	[user_point] [float] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 7/21/2023 11:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[UserStatus_id] [int] IDENTITY(1,1) NOT NULL,
	[UserStatus_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserStatus] PRIMARY KEY CLUSTERED 
(
	[UserStatus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([blog_id], [blog_title], [blog_image], [user_id], [post date], [content]) VALUES (1, N'THEO BẠN THẾ NÀO LÀ CAPPUCCINO, LATTE, MACCHIATO HAY MOCHA?', N'./image/blog1.jpg', 8, CAST(N'2023-05-28' AS Date), N'Nhắc đến Ý là người ta liên tưởng đến những tách cà phê đậm đà, béo ngậy. Thế nhưng làm cách nào để phân biệt được các loại cà phê Ý như Cappuccino, Latte, Macchiato hay Mocha?
Được bắt nguồn từ nước Ý, Espresso còn có nghĩa là “một cách tức khắc” – tức là loại cà phê có thể phục vụ cho khách hàng ngay lập tức và bắt đầu xuất hiện vào khoảng những năm 1930. Ngày nay, người ta đếm có khoảng ít nhất 10 loại cà phê được bắt nguồn từ Espresso được phổ biến và ưa chuộng ở nhiều nước trên thế giới. Cùng điểm mặt các loại cà phê quen thuộc nhất.

Để có được một tách Espresso “chính hiệu” thì người ta phải rang những hạt cà phê sẫm màu rồi xay rất nhuyễn, sau đó được pha chế bằng cách dùng nước nóng nén dưới áp suất cao. Nhờ vậy mà một tách Espresso sẽ có vị rất đậm và trên mặt có một lớp bọt màu nâu còn gọi là Crema rất thơm mà không đắng ngắt. Có kha khá nhiều những “tranh cãi” nảy lửa về phương thức làm ra một tách Espresso “tuyệt hảo” nhất, người thì nói rằng nguyên liệu cần phải có sự pha chế theo tỉ lệ 60% là cà phê Arabica và 40% là Robusta, người thì lại “cương quyết” cho rằng chỉ có một tách Espresso với 100% là hạt cà phê Arabica mới là tuyệt hảo nhất.
Macchiato
Trong tiếng Ý thì “Macchiato” có nghĩa là lốm đốm và cũng vì “cái tên” này mà có khá nhiều tranh cãi trong cách pha chế của loại đồ uống này. Có người thì nói Macchiato là Espresso được cho thêm vài vệt sữa trên bề mặt tạo thành các đường vân trong khá đẹp mắt mà thôi. Tuy nhiên hiện nay thì nhiều quán cà phê họ lại cho kha khá nhiều sữa vào tách Macchiato, thế nên có rất nhiều sự nhầm lẫn giữa Macchiato và Latte.
 
Latte hay cappuccino
 “Latte” được bắt nguồn từ từ Caffe llatte trong tiếng Ý có nghĩa là cà phê và sữa. Nếu người “thưởng thức” không thật sành sẽ rất hay nhầm lẫn vị của Latte với Cappuccino bởi cả hai đều có 3 thành phần cơ bản: cà phê espresso, sữa nóng và bọt sữa. Tuy nhiên, nếu như ở Cappuccino người ta cho lượng sữa nóng có thể tương đương so với bọt sữa thì ở Latte lượng bọt sữa lại được cho bằng 1 nửa với sữa nóng mà thôi. Vì thế mà một tách Latte bao giờ cũng ít “bồng bềnh” hơn so với Cappuccino. Và theo đúng “chuẩn” truyền thống thì Cappuccino được uống trong những tách dày được hâm nóng trước còn Latte lại được uống trong các chiếc ly khá to. Có một điểm thú vị nữa là Latte lúc mới được “sáng tạo” là để dành riêng cho trẻ em vì lượng caffein trong này khá ít và có độ ngậy tương đối cao. Về sau thì dần dần chính người lớn cũng bị mê mẩn bởi thức uống này nên nó trở thành đồ uống cho mọi lứa tuổi. Cũng xuất phát từ cùng một lý do đó, ở Ý người ta còn nghe danh thêm cà phê hag (có tên đầy đủ là granita di caffè con panna) cũng là một loại cà phê không chứa caffein, rất là thích hợp cho tuổi teens.
 
 Và chắc chẳng ai còn xa lạ gì với cà phê Cappuccino rồi đúng không? Một tách cà phê này cũng gồm có 3 phần là: cà phê Espresso, sữa nóng và bọt sữa và thường được chia rất đều nhau. Tuy nhiên, tùy vào nơi pha chế mà lượng Espresso cũng khác nhau. Có nơi để nguyên Espresso đậm đặc nhưng lại có nơi pha loãng Espresso cùng với lượng nước gấp đôi. Và để hoàn thiện tách Cappucino thì không thể không nhắc đến “nghệ thuật vẽ” trên mặt lớp bọt sữa rồi. Còn về tên gọi của Cappucino thì trên dự đoán là được bắt nguồn từ tên gọi của các nhà tu dòng Capuchin vì màu áo thụng của các vị ấy rất giống với màu của cà phê. Điều này đến nay vẫn chưa được kiểm chứng…
Mocha
Thứ đồ uống được các teens không chỉ ở Việt Nam mà còn ở rất nhiều nước ưa chuộng nữa chính là Mocha. Không “đơn giản” như Cappuccino hay Latte, ở Mocha, người thưởng thức sẽ được hưởng trọn vẹn cả vị thơm béo của sữa và vị ngậy của chocolate nóng. Espresso trong Mocha cũng được pha chế bằng hơi nước nên lượng caffein cũng rất ít. Với mùi hương nhẹ của cà phê trộn với vị ngọt dịu của kem và chocolate, lại còn không gây mất ngủ, lo lắng vì sợ nóng, Mocha luôn được coi là thức uống “ưa thích bậc nhất” cho mọi lứa tuổi.
 
Americano
Cuối cùng được “điểm danh” đến là loại cà phê nghe tên “rất Mỹ” nhưng lại hoàn toàn bắt nguồn từ nước Ý – cà phê Americano. Thực ra, Americano chính là Espresso nhưng được pha loãng với lượng nước gấp đôi. Nhiều người không hề thích Americano tẹo nào vì họ cho rằng nó đã “phá tan” cái “chuẩn” của Espresso nhưng lại có những người rất khoái Americano vì nó vừa giữ được hương vị của Espresso nhưng đồng thời cũng hạn chế được nhiều tác hại từ caffeine.
')
INSERT [dbo].[Blog] ([blog_id], [blog_title], [blog_image], [user_id], [post date], [content]) VALUES (4, N'NGẪM NỀN VĂN HÓA CÀ PHÊ Ở VIỆT NAM', N'./image/blog2.jpg', 8, CAST(N'2023-05-28' AS Date), N'Việt Nam có một nền văn hóa cà phê rất khác với các nền văn hóa cà phê ở phương Tây. Cà phê ở đây dành cho việc thưởng thức một cách chậm rãi, tương tự như cách uống của người Pháp. Tuy nhiên, người Pháp uống cà phê trước khi ngày làm việc bắt đầu. Còn ở Việt Nam, người ta thường bỏ ra ít nhất nửa tiếng mỗi lần uống cà phê và họ có thể uống vào bất cứ lúc nào trong ngày.       
Ở trong các quán cà phê, tôi để ý thấy khách hàng hầu hết là đàn ông. Thời gian gọi cà phê, chờ cà phê ra rồi chờ cà phê nhỏ giọt phải mất ít nhất mười lăm phút. Trong khi đó, khách ngồi hút thuốc, đọc báo, suy tư, hoặc trò chuyện với nhau và tận hưởng thời gian rảnh rỗi.
 
Ở Việt Nam, người ta thường bỏ ra ít nhất nửa tiếng mỗi lần uống cà phê và họ có thể uống vào bất cứ lúc nào trong ngày.
Khi ly cà phê đã sẵn sàng, họ nhâm nhi như người Scotland nhâm nhi rượu whiskey, rồi lại nói chuyện và hút thuốc. Khi tôi hỏi một người bạn những khách hàng trong quán cà phê là ai, cô ấy bảo đó là người đang làm việc. Có thể họ tự kinh doanh hoặc đi làm thuê, nhưng cái hay là họ có thể sắp xếp thời gian ngồi suy tư bên ly cà phê.
Thời gian nghỉ giải lao uống cà phê giữa giờ làm việc ở Việt Nam không bị quy định chặt chẽ. Những người đi làm có thể đi uống cà phê bất cứ lúc nào trong ngày, còn người thất nghiệp thì ngồi uống cà phê cả ngày.
 
Hiếm khi tôi thấy người dân ở đây gọi cà phê mang đi. Có lẽ chỉ có phụ nữ bận đến công sở ngay thì mới chọn cách uống này. Phụ nữ có vẻ cũng ít ngồi nhâm nhi cà phê trong quán. Hình như họ quá bận với công việc, hoặc với chuyện mua sắm gia đình. Thỉnh thoảng trong những quán cà phê sang trọng, tôi gặp những người phụ nữ ngồi thư thả uống nước. Nhưng có vẻ như họ không phải người đi làm, mà là những người dư dả tiền của lẫn thời gian. 
Ở Việt Nam, xã hội cà phê có vẻ như thuộc về nam giới. Ở các nước phương Tây, lúc uống cà phê không phải là thời gian dành cho việc quảng giao. Ly cà phê là một phương cách đem đến sự hăng say làm việc. Ở Ý, những người bạn tôi thường đứng uống nhanh một cốc espresso trước khi lao vào công việc. Họ không có nhiều thời gian để ngồi trò chuyện và nhâm nhi. Sau ly cà phê khởi động đầu ngày, người phương Tây sẽ tập trung làm việc đến khoảng 11 giờ. Sau đó, họ sẽ nghỉ giải lao để uống thêm chút trà hay cà phê cho tỉnh táo.
 
Ở Mỹ, nhiều loại xe ôtô bố trí chỗ đặt ly cà phê vì người Mỹ thường có thói quen ghé xe lại một cửa hàng bên đường mua ly cà phê đặt trong xe rồi đi ngay. Không có thời gian ngồi thưởng thức cà phê trong quán, họ thường để ly cà phê của mình trong ôtô cho tiện. Thậm chí nhiều khi họ còn chẳng có thời gian để ăn sáng. Một phát minh người Mỹ quen sử dụng là máy pha cà phê. Máy này được cài chương trình và hoạt động ban đêm để cà phê luôn sẵn sàng vào buổi sáng. Cách này giúp người Mỹ tiết kiệm thời gian pha cà phê. Người uống có thể vừa cầm cốc cà phê vừa uống, vừa chạy ra cửa hoặc lái xe đến công sở. 
Tóm lại, ở các nước phương Tây, cà phê là chất xúc tác cho tinh thần làm việc. Còn ở Việt Nam, cà phê đi cùng với thú vui thư giãn với bạn bè. Có lẽ người phương Tây đặt cao năng suất lao động, còn ở một số quốc gia khác, mọi người lại đề cao sự thư giãn trong cuộc sống. Mặc dù cà phê ở Việt Nam thường đậm đặc hơn cà phê ở các nước phương Tây, nhưng người thưởng thức cà phê ở đây không hề có biểu hiện gì là sẽ hăng say lao ngay vào công việc ngay sau khi giọt cà phê đầu tiên ngấm vào cơ thể. Họ vẫn thích sự từ từ và thư giãn hơn.
')
INSERT [dbo].[Blog] ([blog_id], [blog_title], [blog_image], [user_id], [post date], [content]) VALUES (6, N'Tác dụng của cà phê trong đời sống hàng ngày', N'./image/blog3.jpg', 8, CAST(N'2023-05-28' AS Date), N'Cà phê không đơn thuần chỉ là thức uống giải khát, mà cà phê còn khiến cho người ta tỉnh táo, thư giãn, mang lại sức khỏe cho con người, làm cho người với người gần nhau hơn.
Cà phê giúp nâng cao tinh thần và hiệu quả công việc. Hoạt chất caffeine trong cà phê có tác dụng kích thích hoạt động của trí não, giúp con người có được sự tỉnh táo, minh mẫn và tập trung trong công việc. Ngoài ra còn làm tăng tốc độ tư duy và sáng tạo khiến cho cho hiệu quả công việc được nâng cao. Chính vì vậy mà việc uống cà phê đã trở nên phổ biến nơi công sở.
 
Cà phê nâng cao tinh thần làm việc hiệu quả
Cà phê cải thiện sức khỏe cho mỗi người. Cuộc sống tất bật hàng ngày, công việc luôn luôn bận rộn sẽ khiến cho bạn mệt mỏi, căng thẳng, đau đầu khó chịu hay vướng vào một số bệnh như cao huyết áp, tiểu đường típ 2, gan, hen suyễn hay dị ứng… Với việc uống cà phê đủ liều lượng có thể giúp bạn giảm được nguy cơ mắc những căn bệnh trên. Ngoài ra cà phê còn có khả năng làm tăng sức mạnh của cơ bắp, giảm lượng mỡ trong cơ thể.
Theo nghiên cứu, trong cà phê có chứa chất chống ô–xy hóa và khoáng chất làm tăng khả năng phản ứng của cơ thể với isulin, làm tăng lượng isulin trong máu, và giảm nguy cơ mắc bệnh tiểu đường. Đặc biệt chất caffein trong cafe lại rất có tác dụng đối với những người mắc bệnh cao huyết áp, giảm nguy cơ mắc bệnh hen và dị ứng. Theo nghiên cứu của người Ý, họ theo dõi trên 70.000 người, kết quả là sự khẳng định caffeine là “khắc tinh” của bệnh hen. Nếu uống từ 2 đến 3 ly cafe mỗi ngày thì nguy cơ bị các cơn hen tấn công sẽ giảm 28%.
Cà phê tạo cảm giác sảng khoái, thư giãn và giúp cho người với người gần nhau hơn. Một tách cà phê mỗi buổi sáng sẽ khiến bạn cảm thấy sảng khoái trước khi bước vào một ngày làm việc mới. Những giây phút thư giãn, nhâm nhi tách cà phê cùng bạn bè, người thân sẽ là những giây phút để mọi người cùng nhau trò chuyện, hàn huyên tâm sự, chia sẻ những lo toan, muộn phiền từ công việc, từ cuộc sống… giúp mọi người gần gũi, hiểu nhau hơn.
 
Cà phê tạo sự gắng kết mọi người với nhau trong công ty
Cà phê là chất xúc tác cho sự thành công. Trong các buổi hội thảo, hội họp khách hàng, đối tác và nhân viên, một số công ty thường chuẩn bị cà phê để gắng kết các thành viên trong sự kiện với nhau. Tuy nhiên việc pha chế cà phê, hoặc mua cà phê từ những hàng quán bên ngoài mang vào công ty… điều này ảnh hưỡng rất nhiều đến tính chuyên nghiệp và bộ phận hậu cần phải tốn khá nhiều thời gian chuẩn bị, chưa kể đến việc chất lượng cà phê không đảm bảo và giá thành cao không tối ưu chi phí cho văn phòng.
Vậy tại sao bạn không trang bị “quầy bar mini” dành cho văn phòng của mình. Quầy bar với 1 chiếc máy pha cà phê tự động, chỉ với một lần nhấn nút bạn có ngay ly cà phê tuyệt hảo, thơm lừng và đầy năng lượng hứng khởi, tỉnh táo cho nhân viên, phục vụ ngay cho khách hàng và đối tác mà không mất quá nhiều thời gian chờ đợi. “Quầy bar mini” sẽ làm cho văn phòng của bạn hiện đại hơn, chuyên nghiệp và đẳng cấp hơn.  

')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Coffee')
GO
INSERT [dbo].[Feedback] ([user_id], [content], [product_id], [post_date]) VALUES (28, N'sản phẩm chất lượng
', 19, CAST(N'2023-07-13T08:13:56.167' AS DateTime))
INSERT [dbo].[Feedback] ([user_id], [content], [product_id], [post_date]) VALUES (28, N'Mọi người nên trải nghiệm
', 19, CAST(N'2023-07-18T11:20:20.093' AS DateTime))
INSERT [dbo].[Feedback] ([user_id], [content], [product_id], [post_date]) VALUES (28, N'Một sản phẩm tuyệt vời ', 19, CAST(N'2023-07-18T11:21:17.630' AS DateTime))
INSERT [dbo].[Feedback] ([user_id], [content], [product_id], [post_date]) VALUES (28, N'very good', 19, CAST(N'2023-07-12T23:22:29.013' AS DateTime))
INSERT [dbo].[Feedback] ([user_id], [content], [product_id], [post_date]) VALUES (32, N'sản phẩm tuyệt vời', 18, CAST(N'2023-07-21T22:57:27.383' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (35, NULL, N'groot', 1, 0, CAST(N'2023-06-18T22:17:59.383' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (38, 28, N'Lee Hoang Vu', 2, 0, CAST(N'2023-06-26T09:00:09.350' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (39, 28, N'danghoan', 2, 0, CAST(N'2023-06-27T17:18:02.700' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (40, 8, N'danghoan', 2, 0, CAST(N'2023-06-27T17:38:20.447' AS DateTime), N'', N'Hà Nội', N'0123456789 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (41, 8, N'quy', 2, 0, CAST(N'2023-06-27T17:46:52.740' AS DateTime), N'', N'Hà Nội', N'0123456789 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (42, 8, N'quy', 2, 0, CAST(N'2023-06-27T17:49:11.717' AS DateTime), N'', N'Hà Nội', N'0123456789 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (43, 28, N'danghoan', 2, 0, CAST(N'2023-06-29T10:13:38.867' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (44, 28, N'danghoan', 3, 0, CAST(N'2023-06-29T11:03:41.363' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (45, 28, N'danghoan', 3, 0, CAST(N'2023-06-29T11:14:31.050' AS DateTime), N'', N'ha noi', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (46, 28, N'danghoan', 3, 0, CAST(N'2023-06-29T11:17:46.567' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (47, 28, N'Vu', 3, 0, CAST(N'2023-06-29T11:19:02.967' AS DateTime), N'', N'ha noi', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (48, NULL, N'Nguyen Van A', 1, 0, CAST(N'2023-07-12T15:09:06.597' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (49, 28, N'danghoan', 2, 0, CAST(N'2023-07-12T21:00:45.777' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (50, 29, N'groot', 2, 0, CAST(N'2023-07-19T07:51:00.240' AS DateTime), N'', N'Hà Nội', N'0123456789 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (51, 28, N'danghoan', 2, 0, CAST(N'2023-07-19T23:06:06.123' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (52, 28, N'hoang vu', 2, 6, CAST(N'2023-07-19T23:17:14.120' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (53, 28, N'danghoan', 3, 0, CAST(N'2023-07-20T22:53:09.540' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (54, NULL, N'Quy', 1, 0, CAST(N'2023-07-21T15:19:35.870' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (55, NULL, N'nguyen dang hoan', 2, 0, CAST(N'2023-07-21T22:43:59.023' AS DateTime), N'', N'nha so 1, ngo 91, thach that, ha noi', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (56, 32, N'dang hoan', 3, 0, CAST(N'2023-07-21T22:53:59.243' AS DateTime), N'', N'nha so 1, ngo 91, thach that, ha noi', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (57, 32, N'dang hoan', 2, 0, CAST(N'2023-07-21T22:54:40.273' AS DateTime), N'', N'nha so 1, ngo 91, thach that, ha noi', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (58, 32, N'dang hoan', 2, 0, CAST(N'2023-07-21T22:55:39.000' AS DateTime), N'', N'nha so 1, ngo 91, thach that, ha noi', N'0336577902 ')
INSERT [dbo].[Order] ([order_id], [user_id], [order_name], [orderStatus_id], [order_discount], [order_date], [notes], [order_address], [order_phone]) VALUES (59, 32, N'dang hoan', 1, 6, CAST(N'2023-07-21T22:56:56.163' AS DateTime), N'', N'Hà Nội', N'0336577902 ')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (40, 35, 22, 60, 1, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (44, 38, 18, 65, 1, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (45, 39, 1, 75, 2, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (46, 39, 15, 40, 1, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (47, 39, 7, 50, 1, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (48, 39, 6, 85, 29, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (49, 40, 18, 75, 10, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (50, 41, 7, 70, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (51, 41, 18, 75, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (52, 42, 19, 69, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (53, 43, 18, 55, 1, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (54, 44, 6, 65, 1, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (55, 45, 19, 49, 1, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (56, 45, 18, 55, 1, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (57, 46, 19, 49, 1, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (58, 47, 2, 32, 1, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (59, 49, 18, 55, 3, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (60, 49, 19, 69, 7, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (61, 50, 18, 75, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (62, 51, 19, 69, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (63, 52, 4, 80, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (64, 53, 19, 69, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (65, 54, 2, 52, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (66, 54, 17, 65, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (67, 55, 17, 55, 1, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (68, 56, 17, 65, 1, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (69, 57, 18, 65, 1, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (70, 58, 18, 75, 9, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [order_price], [quantity], [productSize_id]) VALUES (71, 59, 18, 75, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([OrderStatus_id], [OrderStatus_name]) VALUES (1, N'Processing ')
INSERT [dbo].[OrderStatus] ([OrderStatus_id], [OrderStatus_name]) VALUES (2, N'Approve')
INSERT [dbo].[OrderStatus] ([OrderStatus_id], [OrderStatus_name]) VALUES (3, N'Reject')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (1, N'Hazelnut Macchiato', 75, 1, N'./image/HazeInutMacchiato.jpg', N'Cà phê Hazelnut là sự kết hợp giữa cà phê Robusta và hương hạt hazelnut tạo nên sự thoải mái, êm dịu và hài hòa khi thưởng thức, là một lựa chọn tuyệt hảo để khởi đầu một ngày mới.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (2, N'Ristretto Bianco', 32, 1, N'./image/RistrettoBianco.jpg', N' Ristretto Bianco là một loại đồ uống cà phê đặc biệt được pha chế từ espresso và sữa. Một ly Ristretto truyền thống với sữa, tạo ra một hỗn hợp hài hòa giữa độ đậm đặc và sự mềm mại của sữa.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (3, N'Café Latte', 50, 1, N'./image/caffeLatte.jpg', N'Latte là một loại cafe được pha trộn với sữa nóng và một lượng nhỏ bọt sữa. Hương vị của latte mềm mại, nhẹ nhàng và thường được trang trí bằng họa tiết hoặc bột cacao.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (4, N'Café Mocha', 60, 1, N'./image/caffeMocha.jpg', N'Mocha là một loại cafe hòa quyện giữa espresso, sữa nóng và sô cô la. Thường được thêm vào một chút kem whipped cream và hạt cacao để tăng thêm hương vị ngọt ngào và béo ngậy.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (5, N'Flavored Latte', 55, 1, N'./image/FlavoredLatte.jpg', N'Coffee Flavored Latte là một loại đồ uống cà phê pha chế từ espresso, sữa và thêm vào đó là hương vị pha chế như hạnh nhân, caramel, vani, sô cô la, hoặc các hương vị khác để tạo ra một sự kết hợp độc đáo.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (6, N'Skinny Flavored Latte', 65, 1, N'./image/Skinnylatte.jpg', N'Skinny Flavored Latte là một phiên bản "gầy" hoặc "ít calo" của Flavored Latte truyền thống. Điều đặc biệt về Skinny Flavored Latte là nó được pha chế bằng cách sử dụng sữa ít béo hoặc không béo và sử dụng các hương vị pha chế không đường hoặc thấp calo.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (7, N'Cappuccino', 50, 1, N'./image/Cappuccino.jpg', N'Cappuccino là sự kết hợp giữa espresso, sữa nóng và bọt sữa. Đây là một loại cafe phổ biến với lớp bọt sữa mịn và hương vị cân đối.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (8, N'Caramel Macchiato', 60, 1, N'./image/CaramelMacchiato.jpg', N'Macchiato là một loại cafe nhỏ, có một lượng nhỏ sữa nóng hoặc bọt sữa được thêm vào trên mặt cafe. Đây là một sự kết hợp của hương vị mạnh mẽ của espresso và một chút sự mềm mại của sữa.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (9, N'Espresso', 35, 1, N'./image/Espresso.jpg', N'Espresso là một loại cafe nguyên chất được chiết xuất từ cà phê bột nén và nước nóng. Nó có hương vị đậm đà, mạnh mẽ và đắng.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (11, N'Espresso Con Panna', 40, 1, N'./image/EspressoConPanna.jpg', N'Espresso Con Panna là một loại đồ uống cà phê đơn giản và ngon lành được pha chế từ một shot espresso và kem tươi.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (13, N'Espresso Macchiato', 60, 1, N'./image/EspressoMacchiato.jpg', N'Espresso Macchiato là một loại đồ uống cà phê nhỏ gọn và đậm đà, pha chế từ một shot espresso và một chút sữa hấp trên trên mặt espresso.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (14, N'Asian Dolce Latte', 55, 1, N'./image/AsianDolceLatte.jpg', N'Coffee Asian Dolce Latte là một phiên bản độc đáo của Latte với hương vị ngọt ngào và mềm mại, được lấy cảm hứng từ ẩm thực và hương vị của châu Á.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (15, N'Freshly Brewed Coffee', 40, 1, N'./image/FreshlyBrewedCoffee.jpg', N'Freshly Brewed Coffee là một loại cà phê pha từ cà phê tươi rang xay và nước nóng, tạo ra một đồ uống đậm đà và thơm ngon.', 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (17, N'Americano', 45, 1, N'./image/americano.jpg', N'Americano là loại cafe mạnh và đen, được tạo ra bằng cách pha loãng espresso với nước nóng. Đây là một lựa chọn phổ biến cho những người muốn hương vị cafe đậm đà hơn mà không quá ngọt ngào.', 1, CAST(N'2023-06-02' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (18, N'Flat White', 55, 1, N'./image/FlatWhite.jpg', N'Flat White là một loại cafe xuất xứ từ Australia hoặc New Zealand. Nó có hương vị mạnh mẽ từ espresso và một lượng nhỏ sữa nóng, tạo ra một hỗn hợp hài hòa và đậm đà.', 1, CAST(N'2023-06-02' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (19, N'Affogato', 49, 1, N'./image/Affogato.jpg', N'Affogato là một loại cafe đặc biệt, kết hợp giữa một phần espresso và một phần kem đá. Thông thường, espresso sẽ được đổ lên kem đá để tạo ra một trải nghiệm hương vị phong phú và độc đáo.', 1, CAST(N'2023-06-02' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (20, N'Irish Coffee', 50, 1, N'./image/IrishCoffee.jpg', N'Irish Coffee là một loại cafe pha chế với espresso, đường, whiskey Ireland và một lớp kem đánh lên trên cùng. Nó có hương vị hài hòa giữa hơi đắng của cafe, ngọt của đường và cay nồng của whiskey.', 1, CAST(N'2023-06-02' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [category_id], [img], [description], [PdStatus_id], [create_date]) VALUES (22, N'Vietnamese Coffee', 50, 1, N'./image/VietnameseCoffe.jpg', N'Vietnamese Coffee là một loại cafe truyền thống của Việt Nam, pha từ cafe cà phê phin và được pha với sữa đặc ngọt. Hương vị đặc trưng của nó là hậu vị ngọt ngào và đậm đà của cafe cùng với sữa đặc.', 1, CAST(N'2023-06-02' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductSize] ([productSize_id], [productSize_name], [productSize_price]) VALUES (1, N'L', 20)
INSERT [dbo].[ProductSize] ([productSize_id], [productSize_name], [productSize_price]) VALUES (2, N'M', 10)
INSERT [dbo].[ProductSize] ([productSize_id], [productSize_name], [productSize_price]) VALUES (3, N'S', 0)
GO
SET IDENTITY_INSERT [dbo].[ProductStatus] ON 

INSERT [dbo].[ProductStatus] ([PdStatus_id], [PdStatus_name]) VALUES (1, N'Active ')
INSERT [dbo].[ProductStatus] ([PdStatus_id], [PdStatus_name]) VALUES (2, N'Deactive')
SET IDENTITY_INSERT [dbo].[ProductStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'Seller')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (3, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [role_id], [UserStatus_id], [user_point]) VALUES (8, N'Coffee', N'abc@gmail.com', N'25f9e794323b453885f5181f1b624d0b', 2, 1, 0)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [role_id], [UserStatus_id], [user_point]) VALUES (21, N'Admin', N'hoanndhe161494@fpt.edu.vn', N'25f9e794323b453885f5181f1b624d0b', 1, 1, NULL)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [role_id], [UserStatus_id], [user_point]) VALUES (28, N'danghoan', N'danghoan2382002@gmail.com', N'e807f1fcf82d132f9bb018ca6738a19f', 3, 1, 0)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [role_id], [UserStatus_id], [user_point]) VALUES (29, N'groot', N'hoangthithanhhaics@gmail.com', N'25f9e794323b453885f5181f1b624d0b', 2, 1, 0)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [role_id], [UserStatus_id], [user_point]) VALUES (32, N'dang hoan', N'danghoan23082002@gmail.com', N'25f9e794323b453885f5181f1b624d0b', 3, 1, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserStatus] ON 

INSERT [dbo].[UserStatus] ([UserStatus_id], [UserStatus_name]) VALUES (1, N'enable')
INSERT [dbo].[UserStatus] ([UserStatus_id], [UserStatus_name]) VALUES (2, N'disnable')
SET IDENTITY_INSERT [dbo].[UserStatus] OFF
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Users]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Users]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([orderStatus_id])
REFERENCES [dbo].[OrderStatus] ([OrderStatus_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductSize] FOREIGN KEY([productSize_id])
REFERENCES [dbo].[ProductSize] ([productSize_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductSize]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductStatus] FOREIGN KEY([PdStatus_id])
REFERENCES [dbo].[ProductStatus] ([PdStatus_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductStatus]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserStatus] FOREIGN KEY([UserStatus_id])
REFERENCES [dbo].[UserStatus] ([UserStatus_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserStatus]
GO
USE [master]
GO
ALTER DATABASE [SWP391] SET  READ_WRITE 
GO
