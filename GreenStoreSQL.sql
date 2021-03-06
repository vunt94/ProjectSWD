USE [GreenStore]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[passWord] [nvarchar](50) NOT NULL,
	[phonenumber] [varchar](20) NOT NULL,
	[isAdmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[pId] [int] NULL,
	[author] [nvarchar](max) NULL,
	[publisher] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] NOT NULL,
	[name] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clothes]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clothes](
	[pId] [int] NULL,
	[brand] [nvarchar](max) NULL,
	[size] [nvarchar](max) NULL,
	[color] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laptop]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptop](
	[pId] [int] NULL,
	[name] [nvarchar](max) NULL,
	[brand] [nvarchar](max) NULL,
	[color] [nvarchar](max) NULL,
	[RAM] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cusID] [int] NOT NULL,
	[orderDate] [date] NOT NULL,
	[totalPrice] [float] NOT NULL,
	[note] [nchar](200) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[productName] [varchar](200) NOT NULL,
	[productPrice] [float] NOT NULL,
	[productImage] [varchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment] [bit] NOT NULL,
	[totalPrice] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[pId] [int] NULL,
	[brand] [nvarchar](max) NULL,
	[color] [nvarchar](max) NULL,
	[RAM] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[image] [varchar](max) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[cid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[custId] [int] NOT NULL,
	[shippingAddress] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[shippingType] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 20/3/2022 4:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cateId] [int] NULL,
	[subCateName] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([id], [userName], [passWord], [phonenumber], [isAdmin]) VALUES (1, N'admin', N'12345', N'0123456789', 1)
INSERT [dbo].[Accounts] ([id], [userName], [passWord], [phonenumber], [isAdmin]) VALUES (2, N'Maria', N'hahaha', N'0147896325', 0)
INSERT [dbo].[Accounts] ([id], [userName], [passWord], [phonenumber], [isAdmin]) VALUES (3, N'Tom', N'tomtomtom', N'012369874', 0)
INSERT [dbo].[Accounts] ([id], [userName], [passWord], [phonenumber], [isAdmin]) VALUES (4, N'Denish', N'hihihi', N'034795164', 0)
INSERT [dbo].[Accounts] ([id], [userName], [passWord], [phonenumber], [isAdmin]) VALUES (7, N'Anna', N'33333', N'037219823', 0)
INSERT [dbo].[Accounts] ([id], [userName], [passWord], [phonenumber], [isAdmin]) VALUES (8, N'Mod', N'12222', N'', 0)
INSERT [dbo].[Accounts] ([id], [userName], [passWord], [phonenumber], [isAdmin]) VALUES (9, N'admin', N'12345', N'1234567', 0)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
INSERT [dbo].[Book] ([pId], [author], [publisher]) VALUES (64, N'Jam', N'NXB')
INSERT [dbo].[Book] ([pId], [author], [publisher]) VALUES (65, N'Luan', N'NXB2')
INSERT [dbo].[Book] ([pId], [author], [publisher]) VALUES (66, N'Paul', N'NXB3')
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Books')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Mobile Phones')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Clothes')
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'Laptop')
GO
INSERT [dbo].[Clothes] ([pId], [brand], [size], [color]) VALUES (70, N'Dirty Coin', N'M', N'Orange')
INSERT [dbo].[Clothes] ([pId], [brand], [size], [color]) VALUES (71, N'Champion', N'L', N'Blue')
INSERT [dbo].[Clothes] ([pId], [brand], [size], [color]) VALUES (72, N'Off White', N'XL', N'White')
GO
INSERT [dbo].[Laptop] ([pId], [name], [brand], [color], [RAM]) VALUES (49, N'Dell 1234S', N'Dell', N'Black', N'8GB')
INSERT [dbo].[Laptop] ([pId], [name], [brand], [color], [RAM]) VALUES (50, N'Acer MSX343', N'Acer', N'Black', N'16GB')
INSERT [dbo].[Laptop] ([pId], [name], [brand], [color], [RAM]) VALUES (25, N'MSI 8RD 242VN', N'MSI', N'Black', N'4GB')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (1, 2, CAST(N'2021-03-31' AS Date), 85, N'hopping                                                                                                                                                                                                 ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (2, 2, CAST(N'2021-03-31' AS Date), 30, N'nothing                                                                                                                                                                                                 ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (3, 2, CAST(N'2021-03-31' AS Date), 170, N'Hihi                                                                                                                                                                                                    ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (4, 2, CAST(N'2021-03-31' AS Date), 65, N'aaaaa                                                                                                                                                                                                   ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (5, 2, CAST(N'2021-03-31' AS Date), 30, N'cccccccccccccccccccccccccccccccc                                                                                                                                                                        ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (6, 2, CAST(N'2021-03-31' AS Date), 50, N'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq                                                                                                                                                          ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (7, 2, CAST(N'2021-03-31' AS Date), 45, N'                                                                                                                                                                                                        ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (8, 2, CAST(N'2022-02-08' AS Date), 65, N'asdasd                                                                                                                                                                                                  ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (9, 2, CAST(N'2022-02-08' AS Date), 35, N'asdsada                                                                                                                                                                                                 ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (10, 2, CAST(N'2022-02-08' AS Date), 35, N'rgdfgdfg                                                                                                                                                                                                ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (11, 2, CAST(N'2022-02-08' AS Date), 35, N'asdasdasd                                                                                                                                                                                               ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (12, 2, CAST(N'2022-02-08' AS Date), 45, N'sdfgsdfsdfs                                                                                                                                                                                             ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (13, 2, CAST(N'2022-02-08' AS Date), 50, N'asdasdasdasd                                                                                                                                                                                            ')
INSERT [dbo].[Order] ([id], [cusID], [orderDate], [totalPrice], [note]) VALUES (14, 2, CAST(N'2022-02-08' AS Date), 125, N'sdfsdf                                                                                                                                                                                                  ')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_detail] ON 

INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (1, 1, 1, N'Small ZZ Plant + MEPO Pots', 15, N'1.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (2, 1, 4, N'Small ZZ Plant', 50, N'4.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (3, 1, 5, N'Baby ZZ Plant', 20, N'5.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (4, 2, 19, N'Small ZZ Plant + MEPO Pots', 15, N'1.jpg', 2)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (5, 3, 19, N'Small ZZ Plant + MEPO Pots', 15, N'1.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (6, 3, 20, N'Golden Hahnii + Terracotta POTS', 25, N'2.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (7, 3, 21, N'Aloe Humilis + CUPO Pots', 65, N'3.jpg', 2)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (8, 4, 19, N'Small ZZ Plant + MEPO Pots', 15, N'1.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (9, 4, 20, N'Golden Hahnii + Terracotta POTS', 25, N'2.jpg', 2)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (10, 5, 19, N'Small ZZ Plant + MEPO Pots', 15, N'1.jpg', 2)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (11, 6, 20, N'Golden Hahnii + Terracotta POTS', 25, N'2.jpg', 2)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (12, 7, 19, N'Small ZZ Plant + MEPO Pots', 15, N'1.jpg', 3)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (13, 8, 19, N'Code Dao Ky Su', 15, N'book1.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (14, 9, 19, N'Code Dao Ky Su', 15, N'book1.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (15, 10, 19, N'Code Dao Ky Su', 15, N'book1.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (16, 11, 19, N'Code Dao Ky Su', 15, N'book1.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (17, 12, 20, N'Conan', 25, N'book2.jpg', 1)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (18, 13, 19, N'Code Dao Ky Su', 15, N'book1.jpg', 2)
INSERT [dbo].[Order_detail] ([id], [orderID], [productID], [productName], [productPrice], [productImage], [quantity]) VALUES (19, 14, 20, N'Conan', 25, N'book2.jpg', 3)
SET IDENTITY_INSERT [dbo].[Order_detail] OFF
GO
INSERT [dbo].[Phone] ([pId], [brand], [color], [RAM]) VALUES (67, N'Samsung', N'White', N'4GB')
INSERT [dbo].[Phone] ([pId], [brand], [color], [RAM]) VALUES (68, N'Xiaomi', N'Pink', N'2GB')
INSERT [dbo].[Phone] ([pId], [brand], [color], [RAM]) VALUES (69, N'Galaxy Note 20 Ultra.jpg', N'Black', N'4GB')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (19, N'Code Dao Ky Su', 15, 15, N'book1.jpg', N'It is one of the most popular indoor plants for its good germination ability, grows rapidly even under low light conditions.', 1)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (20, N'Conan', 5, 25, N'book2.jpg', N'When it comes to the top types of air purifiers, we cannot help but mention Tigers Tongue - the "machine" that filters the air from nature. In particular, this plant also has very good vitality, even with low light conditions or direct sunlight, and is resistant to drought up to several months. In Western countries, Tiger Tongue is often placed in bedrooms, because with reverse photosynthetic properties, it will release oxygen at night, helping to sleep deeply and fresh.', 1)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (21, N'Doremon', 6, 65, N'book3.jpg', N'This is a succulent plant of the genus Aloe (Aloe Vera). In particular, this is a crossbred line, so their size will be small in a certain range, then they will lay more seedlings next to them, you can also separate and plant separately when the seedlings are big enough.', 1)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (22, N'Dac Nhan Tam', 8, 50, N'book4.jpg', N'It is one of the most popular indoor plants for its good germination ability, grows rapidly even under low light conditions. ', 1)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (24, N'Giao Duc Cong Dan', 10, 55, N'book5.jpg', N'It can be said that Fittonia is a bonsai for beginners. Most people, when starting to take care of trees, choose plants that are easy to take care of, but still have to be beautiful and eye-catching. Therefore, Fittonia is always the first choice whenever you want to care or give someone a pot without too much light.', 1)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (25, N'MSI', 20, 70, N'MSI.jpg', N'When it comes to the top types of air purifiers, we cannot help but mention Tigers Tongue - the "machine" that filters the air from nature. In particular, this plant also has very good vitality, even with low light conditions or direct sunlight, and is resistant to drought up to several months. In Western countries, Tiger Tongue is often placed in bedrooms, because with reverse photosynthetic properties, it will release oxygen at night, helping to sleep deeply and fresh.', 4)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (26, N'Galaxy Note 20 Ultra', 15, 95, N'Galaxy Note 20 Ultra.jpg', N'As you probably know, Cactus helps in eliminating radiation from electronic devices in the office such as computers, phones, printers, televisions ... However, not all types of cacti can be placed in the environment. office. Choose those with many spines, small spines, dark green and hard body, typically Nipple Cactus (Birthday Cake Cactus). This line is suitable for those who do not have time to water the plants, because the cactus drought tolerance is very good, can be up to several months.', 2)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (27, N'Xiaomi', 30, 45, N'Xiaomi.jpg', N'It is one of the most popular succulent plants when it comes to the Stone Lotus / Cactus. The advantage of this plant is that it is well adapted to the Vietnamese climate, does not need too much sunshine to grow, can live well with shady conditions and especially does not need too much water.', 2)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (28, N'Samsung', 25, 75, N'Samsung.jpg', N'It is one of the most popular succulent plants when it comes to the Stone Lotus / Cactus. The advantage of this plant is that it is well adapted to the Vietnamese climate, does not need too much sunshine to grow, can live well with shady conditions and especially does not need too much water.', 2)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (29, N'Champion', 10, 50, N'Champion.jpg', N'Terracotta - Terracotta is the best potted material for growing plants. With good water absorption makes it easier to water plants indoors, minimizing root rot for plants.', 3)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (30, N'Rookie', 20, 40, N'Rookie.jpg', N'Terracotta - Terracotta is the best potted material for growing plants. With good water absorption makes it easier to water plants indoors, minimizing root rot for plants', 3)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (31, N'Nike', 15, 145, N'Nike.png', N'Pot products are only available at NOTH Garden, with thick glass material, more difficult to break. Especially, the pot has a drainage hole at the bottom of the pot, so it can be planted straight into the pot without worrying about waterlogging.', 3)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (49, N'Dell', 1, 145, N'Dell.jpg', N'fsdfsdfasdf', 4)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (50, N'Acer', 5, 12, N'Acer.jpg', N'sdfsdfs', 4)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (62, N'Iphone 13 Pro Max', 5, 150, N'Iphone.jpg', N'Best SmartPhone', 2)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (64, N'book1', 10, 200, N'book1.jpg', N'abc', 1)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (65, N'book2', 10, 200, N'book2.jpg', N'abc2', 1)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (66, N'book3', 10, 200, N'book3.jpg', N'abc3', 1)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (67, N'phone1', 10, 300, N'Samsung.jpg', N'phone1', 2)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (68, N'phone2', 10, 450, N'Xiaomi.jpg', N'phone2', 2)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (69, N'phone3', 10, 230, N'Galaxy Note 20 Ultra.jpg', N'phone3', 2)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (70, N'clothes1', 20, 120, N'clothes1.jpg', N'clothes1', 3)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (71, N'clothes2', 30, 300, N'clothes2.jpg', N'clothes2', 3)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (72, N'clothes3', 20, 180, N'clothes3.jpg', N'clothes3', 3)
INSERT [dbo].[Products] ([pid], [name], [quantity], [price], [image], [description], [cid]) VALUES (74, N'clothes4', 20, 190, N'clothes4.jpg', N'abcdsf', 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (1, 1, N'Truyện tranh')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (2, 1, N'SGK')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (3, 1, N'Tiểu thuyết')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (4, 2, N'Iphone')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (5, 2, N'Oppo')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (6, 2, N'Samsung')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (7, 3, N'Quần')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (8, 3, N'Áo')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (9, 3, N'Váy')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (10, 4, N'Macbook')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (11, 4, N'Gamming')
INSERT [dbo].[SubCategory] ([id], [cateId], [subCateName]) VALUES (12, 4, N'VivoBook')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_orderDate]  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([cusID])
REFERENCES [dbo].[Accounts] ([id])
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([id])
GO
