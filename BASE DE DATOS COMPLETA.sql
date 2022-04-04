USE [master]
GO
/****** Object:  Database [DBCARRITO]    Script Date: 4/4/2022 01:05:02 ******/
CREATE DATABASE [DBCARRITO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCARRITO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBCARRITO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBCARRITO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBCARRITO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBCARRITO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCARRITO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCARRITO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCARRITO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCARRITO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCARRITO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCARRITO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCARRITO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCARRITO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCARRITO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCARRITO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCARRITO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCARRITO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCARRITO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCARRITO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCARRITO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCARRITO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCARRITO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCARRITO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCARRITO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCARRITO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBCARRITO] SET  MULTI_USER 
GO
ALTER DATABASE [DBCARRITO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCARRITO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCARRITO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCARRITO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBCARRITO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBCARRITO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBCARRITO] SET QUERY_STORE = OFF
GO
USE [DBCARRITO]
GO
/****** Object:  User [test_Paginas]    Script Date: 4/4/2022 01:05:02 ******/
CREATE USER [test_Paginas] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [maxiicba]    Script Date: 4/4/2022 01:05:02 ******/
CREATE USER [maxiicba] FOR LOGIN [maxiicba] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[IdProdcuto] [int] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Restablecer] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTAMENTO]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTAMENTO](
	[IdDepartamento] [varchar](2) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISTRITO]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISTRITO](
	[IdDistricto] [varchar](6) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdProvincia] [varchar](4) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NULL,
	[Descripcion] [varchar](500) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[NombreImagen] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[IdProvincia] [varchar](4) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Restablecer] [bit] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[TotalProducto] [int] NULL,
	[MontoTotal] [decimal](10, 2) NULL,
	[Contacto] [varchar](50) NULL,
	[IdDistricto] [varchar](10) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[IdTransaccion] [varchar](50) NULL,
	[FechaVenta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'Tegnologia', 1, CAST(N'2022-02-19T19:04:21.953' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'Dormitorio', 0, CAST(N'2022-02-19T19:04:21.953' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'Deportes', 0, CAST(N'2022-02-19T19:04:21.953' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'01', N'Cordoba')
GO
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'02', N'Colon')
GO
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'02', N'Villa Maria')
GO
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'03', N'Villa Maria')
GO
INSERT [dbo].[DISTRITO] ([IdDistricto], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010101', N'Malvinas Argentinas', N'0101', N'01')
GO
INSERT [dbo].[DISTRITO] ([IdDistricto], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020202', N'Monte Cristo', N'0202', N'02')
GO
INSERT [dbo].[DISTRITO] ([IdDistricto], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030303', N'Monte Cristo', N'0303', N'03')
GO
SET IDENTITY_INSERT [dbo].[MARCA] ON 
GO
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'SONYTE', 1, CAST(N'2022-02-19T19:15:55.780' AS DateTime))
GO
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'LGTE', 1, CAST(N'2022-02-19T19:15:55.780' AS DateTime))
GO
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'CANONTE', 1, CAST(N'2022-02-19T19:15:55.780' AS DateTime))
GO
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'TOBERTA ALLENTE', 1, CAST(N'2022-02-19T19:15:55.780' AS DateTime))
GO
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'XIAOMI', 1, CAST(N'2022-03-03T09:44:07.337' AS DateTime))
GO
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (7, N'SAMSUNG', 1, CAST(N'2022-03-03T09:44:21.950' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MARCA] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (2, N'Notebook', N'La mejor del mercado', 4, 3, CAST(230.00 AS Decimal(10, 2)), 10, N'C:\Users\maxi_\OneDrive\Escritorio\Programa_Carrito\Fotos', N'2.png', 1, CAST(N'2022-03-08T13:13:48.577' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (12, N'Televisor Smart', N'Calidad HD', 1, 3, CAST(8900.00 AS Decimal(10, 2)), 13, N'C:\Users\maxi_\OneDrive\Escritorio\Programa_Carrito\Fotos', N'12.jpg', 1, CAST(N'2022-03-09T09:58:50.947' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (13, N'Teclado gamer', N'Con RGB
Teclado de membrana
super duración
Sirve para warzone', 6, 1, CAST(330.00 AS Decimal(10, 2)), 54, N'C:\Users\maxi_\OneDrive\Escritorio\Programa_Carrito\Fotos', N'13.jpg', 1, CAST(N'2022-03-09T23:57:55.783' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0101', N'Cordoba', N'01')
GO
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0102', N'Buenos Aires', N'02')
GO
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0103', N'CHACO', N'03')
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Restablecer], [Activo], [FechaRegistro]) VALUES (1, N'test nombre', N'test apellido', N'test@example.com', N'ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae', 1, 1, CAST(N'2022-02-22T11:53:49.293' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Restablecer], [Activo], [FechaRegistro]) VALUES (13, N'dads', N'dasda', N'gkuhicu_f779w@tigpe.com', N'f9f26a0c9e3c5d2f21540235f516f17b7a3d4ca64513081dab27499aa1e58fbf', 1, 0, CAST(N'2022-02-27T20:37:32.913' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Restablecer], [Activo], [FechaRegistro]) VALUES (14, N'Maxi', N'Lopez', N'koramo8648@jo6s.com', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 0, 1, CAST(N'2022-03-27T19:02:10.180' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ((0)) FOR [Restablecer]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Restablecer]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT (getdate()) FOR [FechaVenta]
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdProdcuto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[VENTA] ([IdVenta])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[MARCA] ([IdMarca])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarCategoria]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarCategoria](
    @IdCategoria int,
	@Descripcion varchar(100),
	@Activo bit,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion and IdCategoria != @IdCategoria)
		begin
			UPDATE TOP (1) CATEGORIA SET 
			Descripcion = @Descripcion,
			Activo = @Activo
			where IdCategoria = @IdCategoria
			SET @Resultado = 1
			end
			else
				set @Mensaje = 'La categoria ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarMarca]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_EditarMarca](
    @IdMarca int,
	@Descripcion varchar(100),
	@Activo bit,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion and IdMarca != @IdMarca)
		begin
			UPDATE TOP (1) MARCA SET 
			Descripcion = @Descripcion,
			Activo = @Activo
			where IdMarca = @IdMarca
			SET @Resultado = 1
			end
			else
				set @Mensaje = 'La marca ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarProducto]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarProducto](
	@IdProducto int,
	@Nombre varchar(100),
	@Descripcion varchar(100),
	@IdMarca varchar(100),
	@IdCategoria varchar(100),
	@Precio decimal(10,2),
	@Stock int,
	@Activo bit,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre and IdProducto != @IdProducto)
		begin
			UPDATE TOP (1) PRODUCTO SET 
			Nombre = @Nombre,
			Descripcion = @Descripcion,
			IdMarca = @IdMarca,
			IdCategoria = @IdCategoria,
			Precio = @Precio,
			Stock = @Stock,
			Activo =@Activo
			where IdProducto = @IdProducto
			SET @Resultado = 1
			end
			else
				set @Mensaje = 'El producto ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarUsuario]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarUsuario](
    @IdUsuario int,
	@Nombres varchar(100),
	@Apellidos varchar(100),
	@Correo varchar(100),
	@Activo bit,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo and IdUsuario != @IdUsuario)
		begin
			UPDATE TOP (1) USUARIO SET 
			Nombres = @Nombres,
			Apellidos = @Apellidos,
			Correo = @Correo,
			Activo = @Activo
			where IdUsuario = @IdUsuario
			SET @Resultado = 1
			end
			else
				set @Mensaje = 'El correo del usuario ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarCategoria]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarCategoria](
    @IdCategoria int,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS(select * from PRODUCTO p inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
		where p.IdCategoria = @IdCategoria )
		begin
			delete top (1) from CATEGORIA where IdCategoria = @IdCategoria
			SET @Resultado = 1
        end
		else
			set @Mensaje = 'La categoria se encuentra relacionada a un producto'
		end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarMarca]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarMarca](
    @IdMarca int,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS(select * from PRODUCTO p inner join MARCA m on m.IdMarca = p.IdMarca
		where p.IdMarca = @IdMarca )
		begin
			delete top (1) from MARCA where IdMarca = @IdMarca
			SET @Resultado = 1
        end
		else
			set @Mensaje = 'La marca se encuentra relacionada a un producto'
		end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarProducto]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarProducto](
    @IdProducto int,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS(select * from DETALLE_VENTA dv inner join PRODUCTO p on p.IdProducto = dv.IdProducto
		where p.IdProducto = @IdProducto )
		begin
			delete top (1) from PRODUCTO where IdProducto = @IdProducto
			SET @Resultado = 1
        end
		else
			set @Mensaje = 'El producto se encuentra relacionado a una venta'
		end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCategoria]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarCategoria](
	@Descripcion varchar(100),
	@Activo bit,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)
		begin
			insert into CATEGORIA(Descripcion,Activo) values
				(@Descripcion,@Activo)

				SET @Resultado = SCOPE_IDENTITY()
			end
			else
				set @Mensaje = 'La categoria ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMarca]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarMarca](
	@Descripcion varchar(100),
	@Activo bit,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)
		begin
			insert into MARCA(Descripcion,Activo) values
				(@Descripcion,@Activo)

				SET @Resultado = SCOPE_IDENTITY()
			end
			else
				set @Mensaje = 'La marca ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarProducto]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarProducto](
	@Nombre varchar(100),
	@Descripcion varchar(100),
	@IdMarca varchar(100),
	@IdCategoria varchar(100),
	@Precio decimal(10,2),
	@Stock int,
	@Activo bit,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre)
		begin
			insert into PRODUCTO(Nombre, Descripcion, IdMarca, IdCategoria, Precio, Stock,Activo) values
				(@Nombre,@Descripcion,@IdMarca,@IdCategoria,@Precio,@Stock,@Activo)

				SET @Resultado = SCOPE_IDENTITY()
			end
			else
				set @Mensaje = 'El producto ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarUsuario](
	@Nombres varchar(100),
	@Apellidos varchar(100),
	@Correo varchar(100),
	@Clave varchar(100),
	@Activo bit,
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
		begin
			insert into USUARIO(Nombres,Apellidos,Correo,Clave,Activo) values
				(@Nombres,@Apellidos,@Correo,@Clave,@Activo)

				SET @Resultado = SCOPE_IDENTITY()
			end
			else
				set @Mensaje = 'El correo de usuario ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteDashboard]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ReporteDashboard]
as
	begin
	select
		(SELECT count(*) FROM CLIENTE)[TotalCliente],
		(SELECT isNull(sum(Cantidad),0) FROM DETALLE_VENTA)[TotalVenta],
		(select count(*) from PRODUCTO)[TotalProducto]
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteVentas]    Script Date: 4/4/2022 01:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ReporteVentas](
@fechainicio varchar(10),
@fechafin varchar(10),
@idtransaccion varchar(50)
)
AS
begin	
	SET DATEFORMAT dmy;
select CONVERT(char(10),v.FechaVenta,103)[FechaVenta],CONCAT(c.Nombres,' ',c.Apellidos)[Cliente],
p.Nombre[Producto], p.Precio, dv.Cantidad, dv.Total, v.IdTransaccion from DETALLE_VENTA dv
inner join PRODUCTO p on p.IdProducto = dv.IdProducto
inner join VENTA v on v.IdVenta = dv.IdVenta
inner join CLIENTE c on c.IdCliente = v.IdCliente
where CONVERT(date, v.FechaVenta) between @fechainicio and @fechafin
and v.IdTransaccion = Iif(@idtransaccion = '', v.IdTransaccion, @idtransaccion)

END
GO
USE [master]
GO
ALTER DATABASE [DBCARRITO] SET  READ_WRITE 
GO
