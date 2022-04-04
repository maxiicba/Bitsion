USE [master]
GO
/****** Object:  Database [BITSION]    Script Date: 4/4/2022 08:30:34 ******/
CREATE DATABASE [BITSION]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BITSION', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BITSION.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BITSION_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BITSION_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BITSION] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BITSION].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BITSION] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BITSION] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BITSION] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BITSION] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BITSION] SET ARITHABORT OFF 
GO
ALTER DATABASE [BITSION] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BITSION] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BITSION] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BITSION] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BITSION] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BITSION] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BITSION] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BITSION] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BITSION] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BITSION] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BITSION] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BITSION] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BITSION] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BITSION] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BITSION] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BITSION] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BITSION] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BITSION] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BITSION] SET  MULTI_USER 
GO
ALTER DATABASE [BITSION] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BITSION] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BITSION] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BITSION] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BITSION] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BITSION] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BITSION] SET QUERY_STORE = OFF
GO
USE [BITSION]
GO
/****** Object:  User [test_Paginas]    Script Date: 4/4/2022 08:30:34 ******/
CREATE USER [test_Paginas] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [maxiicba]    Script Date: 4/4/2022 08:30:34 ******/
CREATE USER [maxiicba] FOR LOGIN [maxiicba] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Atributos]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atributos](
	[IdAtributo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAtributo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Identificacion] [int] NULL,
	[Edad] [int] NULL,
	[Genero] [bit] NULL,
	[Estado] [bit] NULL,
	[Atributos] [varchar](200) NULL,
	[InfoAdicional] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CLIENTES] ADD  DEFAULT ((1)) FOR [Genero]
GO
ALTER TABLE [dbo].[CLIENTES] ADD  DEFAULT ((1)) FOR [Estado]
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarAtributo]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarAtributo](
		@IdAtributo int,
		@Nombre varchar(100),
		@Mensaje varchar(500) output,
		@Resultado int output
		)
		as
		begin
			SET @Resultado = 0
			IF EXISTS (SELECT * FROM Atributos WHERE IdAtributo = @IdAtributo and Nombre !=@Nombre)
			begin
				UPDATE TOP (1) Atributos SET 
				Nombre = @Nombre
				where IdAtributo = @IdAtributo
				SET @Resultado = 1
				end
				else
				set @Mensaje = 'El valor es el mismo'
		end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarCliente]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarCliente](
	@IdCliente int,
	@Nombre varchar(100),
	@Identificacion int,
	@Edad int,
	@Genero bit,
	@Estado bit,
	@Atributos varchar(200),
	@InfoAdicional varchar(150),
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM CLIENTES WHERE Identificacion = @Identificacion and IdCliente != @IdCliente)
		begin
			UPDATE TOP (1) CLIENTES SET 
			Nombre = @Nombre,
			Identificacion = @Identificacion,
			Edad = @Edad,
			Genero = @Genero,
			Estado = @Estado,
			Atributos = @Atributos,
			InfoAdicional =@InfoAdicional
			where IdCliente = @IdCliente
			SET @Resultado = 1
			end
			else
				set @Mensaje = 'El cliente ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarAtributo]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarAtributo](
	  @IdAtributo int,
	  @Mensaje varchar(500) output,
      @Resultado int output
	)
	as
	begin
		delete top (1) from Atributos where IdAtributo = @IdAtributo
		SET @Resultado = 1
		end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarCliente]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarCliente](
	  @IdCliente int,
	  @Mensaje varchar(500) output,
      @Resultado int output
	)
	as
	begin
		delete top (1) from CLIENTES where IdCliente = @IdCliente
		SET @Resultado = 1
		end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarAtributo]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarAtributo](
	@Nombre varchar(100),
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM Atributos WHERE Nombre = @Nombre)
		begin
			insert into Atributos(Nombre) values
				(@Nombre)

				SET @Resultado = SCOPE_IDENTITY()
			end
			else
				set @Mensaje = 'El atributo ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCliente]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarCliente](
	@Nombre varchar(100),
	@Identificacion int,
	@Edad int,
	@Genero bit,
	@Estado bit,
	@Atributos varchar(200),
	@InfoAdicional varchar(150),
	@Mensaje varchar(500) output,
	@Resultado int output
	)
	as
	begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM CLIENTES WHERE Identificacion = @Identificacion)
		begin
			insert into CLIENTES(Nombre, Identificacion, Edad, Genero, Estado, Atributos, InfoAdicional) values
				(@Nombre,@Identificacion,@Edad,@Genero,@Estado,@Atributos,@InfoAdicional)

				SET @Resultado = SCOPE_IDENTITY()
			end
			else
				set @Mensaje = 'El cliente ya existe'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteDashboard]    Script Date: 4/4/2022 08:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ReporteDashboard]
as
begin
	select
		(SELECT count(*) FROM CLIENTES)[TotalClientes],
		(select count(*) from Atributos)[TotalAtributos]
end
GO
USE [master]
GO
ALTER DATABASE [BITSION] SET  READ_WRITE 
GO
