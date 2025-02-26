USE [TicketMaster]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [fk_direccionUs]
GO
ALTER TABLE [dbo].[SedeFilas] DROP CONSTRAINT [fk_sedeFilas]
GO
ALTER TABLE [dbo].[SedeDireccion] DROP CONSTRAINT [fk_sedeDireccion]
GO
ALTER TABLE [dbo].[ReservacionAsiento] DROP CONSTRAINT [fk_sedeRA]
GO
ALTER TABLE [dbo].[ReservacionAsiento] DROP CONSTRAINT [fk_orden]
GO
ALTER TABLE [dbo].[ReservacionAsiento] DROP CONSTRAINT [fk_numeroFila]
GO
ALTER TABLE [dbo].[OrdenUsuarios] DROP CONSTRAINT [fk_usuario]
GO
ALTER TABLE [dbo].[OrdenUsuarios] DROP CONSTRAINT [fk_evento]
GO
ALTER TABLE [dbo].[Eventos] DROP CONSTRAINT [fk_sede]
GO
ALTER TABLE [dbo].[Eventos] DROP CONSTRAINT [fk_artista]
GO
ALTER TABLE [dbo].[Artistas] DROP CONSTRAINT [fk_categoriaArtista]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[SedeFilas]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[SedeFilas]
GO
/****** Object:  Table [dbo].[SedeEvento]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[SedeEvento]
GO
/****** Object:  Table [dbo].[SedeDireccion]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[SedeDireccion]
GO
/****** Object:  Table [dbo].[ReservacionAsiento]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[ReservacionAsiento]
GO
/****** Object:  Table [dbo].[OrdenUsuarios]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[OrdenUsuarios]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[Eventos]
GO
/****** Object:  Table [dbo].[DireccionUsuarios]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[DireccionUsuarios]
GO
/****** Object:  Table [dbo].[CategoriaArtista]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[CategoriaArtista]
GO
/****** Object:  Table [dbo].[Artistas]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP TABLE [dbo].[Artistas]
GO
USE [master]
GO
/****** Object:  Database [TicketMaster]    Script Date: 16/04/2019 03:10:45 p. m. ******/
DROP DATABASE [TicketMaster]
GO
/****** Object:  Database [TicketMaster]    Script Date: 16/04/2019 03:10:45 p. m. ******/
CREATE DATABASE [TicketMaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketMaster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TicketMaster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TicketMaster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TicketMaster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TicketMaster] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketMaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketMaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketMaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketMaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketMaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketMaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketMaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketMaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketMaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketMaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketMaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketMaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketMaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketMaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketMaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketMaster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketMaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketMaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketMaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketMaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketMaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketMaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketMaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketMaster] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TicketMaster] SET  MULTI_USER 
GO
ALTER DATABASE [TicketMaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketMaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketMaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketMaster] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TicketMaster] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TicketMaster', N'ON'
GO
ALTER DATABASE [TicketMaster] SET QUERY_STORE = OFF
GO
USE [TicketMaster]
GO
/****** Object:  Table [dbo].[Artistas]    Script Date: 16/04/2019 03:10:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artistas](
	[artista_id] [uniqueidentifier] NOT NULL,
	[codigoCategoriaAr] [uniqueidentifier] NOT NULL,
	[metodoPago] [varchar](50) NOT NULL,
	[nombreArtista] [varchar](50) NOT NULL,
	[genero] [varchar](50) NOT NULL,
	[noticias] [varchar](100) NOT NULL,
	[detalles] [varchar](150) NULL,
 CONSTRAINT [PK_Artistas] PRIMARY KEY CLUSTERED 
(
	[artista_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaArtista]    Script Date: 16/04/2019 03:10:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaArtista](
	[categoriaArtista_id] [uniqueidentifier] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CategoriaArtista] PRIMARY KEY CLUSTERED 
(
	[categoriaArtista_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DireccionUsuarios]    Script Date: 16/04/2019 03:10:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionUsuarios](
	[direccion_id] [uniqueidentifier] NOT NULL,
	[direccion1] [varchar](200) NOT NULL,
	[direccion2] [varchar](200) NULL,
	[ciudad] [varchar](100) NOT NULL,
	[pais] [varchar](100) NOT NULL,
	[telefono] [varchar](10) NOT NULL,
 CONSTRAINT [PK_DireccionUsuarios] PRIMARY KEY CLUSTERED 
(
	[direccion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 16/04/2019 03:10:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[evento_id] [uniqueidentifier] NOT NULL,
	[artista_id] [uniqueidentifier] NOT NULL,
	[sede_id] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[fechaVenta] [date] NOT NULL,
	[detalles] [varchar](150) NULL,
	[duracion]  AS (datediff(day,[fechaInicio],[fechaFin])),
 CONSTRAINT [PK_Eventos] PRIMARY KEY CLUSTERED 
(
	[evento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenUsuarios]    Script Date: 16/04/2019 03:10:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenUsuarios](
	[orden_id] [uniqueidentifier] NOT NULL,
	[evento_id] [uniqueidentifier] NOT NULL,
	[usuario_id] [uniqueidentifier] NOT NULL,
	[estado_orden] [varchar](50) NOT NULL,
	[fecha_orden] [date] NOT NULL,
	[telefono_orden] [bigint] NOT NULL,
	[tarjeta_orden] [bigint] NOT NULL,
 CONSTRAINT [PK_OrdenUsuarios] PRIMARY KEY CLUSTERED 
(
	[orden_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservacionAsiento]    Script Date: 16/04/2019 03:10:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservacionAsiento](
	[reservacion_id] [uniqueidentifier] NOT NULL,
	[orden_id] [uniqueidentifier] NOT NULL,
	[sede_id] [uniqueidentifier] NOT NULL,
	[numeroFila] [int] NOT NULL,
	[numeroAsiento] [int] NOT NULL,
	[asientoLugar]  AS ((CONVERT([varchar](10),[numeroFila])+', ')+CONVERT([varchar](10),[numeroAsiento])),
 CONSTRAINT [PK_ReservacionAsiento] PRIMARY KEY CLUSTERED 
(
	[reservacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SedeDireccion]    Script Date: 16/04/2019 03:10:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SedeDireccion](
	[direccion_id] [uniqueidentifier] NOT NULL,
	[sede_id] [uniqueidentifier] NOT NULL,
	[indicaciones] [varchar](200) NOT NULL,
	[referenciaUbicacion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_SedeDireccion] PRIMARY KEY CLUSTERED 
(
	[direccion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SedeEvento]    Script Date: 16/04/2019 03:10:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SedeEvento](
	[sede_id] [uniqueidentifier] NOT NULL,
	[direccion_id] [uniqueidentifier] NOT NULL,
	[nombreSede] [varchar](100) NOT NULL,
	[capacidadAsientos] [int] NOT NULL,
 CONSTRAINT [PK_SedeEvento] PRIMARY KEY CLUSTERED 
(
	[sede_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SedeFilas]    Script Date: 16/04/2019 03:10:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SedeFilas](
	[sede_id] [uniqueidentifier] NOT NULL,
	[numeroFila] [int] NOT NULL,
	[cuenta_asientos] [int] NULL,
 CONSTRAINT [PK_SedeFilas_1] PRIMARY KEY CLUSTERED 
(
	[numeroFila] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/04/2019 03:10:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[usuario_id] [uniqueidentifier] NOT NULL,
	[direccion_id] [uniqueidentifier] NOT NULL,
	[primerNombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[genero] [varchar](10) NOT NULL,
	[correo] [varchar](30) NOT NULL,
	[contrasenia] [varchar](30) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[apodo]  AS (([primerNombre]+' ')+[apellido]),
	[edad]  AS (datediff(year,[fechaNacimiento],getdate())),
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'e3d2c616-5f08-4e05-a287-1658cf505ef0', N'73c40186-1695-41be-98e3-dfb22e1261bd', N'Tarjeta de credito', N'Ludwig von Bethoven', N'Musica clasica', N'Nueva cancion', N'Artista')
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'47ef6894-e09b-45c9-b349-70bb49666a83', N'c7ff16d5-24c0-4f13-9122-04f192d408fc', N'Tarjeta de credito', N'Maluma', N'Reggaeton', N'Nuevo perreo', N'Joven')
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'db1702d5-7241-46b2-b247-76cd9311f640', N'57a3567b-6786-4752-9359-14cafea82c15', N'Tarjeta de credito', N'Jose jose', N'Balado', N'Nueva cancion', N'Tercera edad')
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'691a040f-1f47-424b-a23f-799c617af92c', N'8dbb4855-bbab-43d4-8050-a59664ffd9b7', N'Tarjeta de credito', N'Juanes', N'Grupo', N'Nueva cancion', N'Grupo')
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'74a4834a-393d-4fac-9e54-82b5df3bb3ee', N'1a42df81-78a6-4314-b638-b2f1678aa77a', N'Tarjeta de credito', N'Los angeles azules', N'Banda', N'Nuevo Sencillo', N'Grupo musical')
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'f74b0086-c777-4a60-af29-9d48983fbf78', N'755c6d55-5ac5-487c-bfc2-45a683275bf2', N'Tarjeta de credito', N'La arrolladora', N'Banda', N'Banda Limon', N'Grupo musical')
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'53d020f3-a9b7-4a9b-866d-baacd4e34ac2', N'9f9cd2cb-ce7f-4e60-b61b-043ffd1c32f8', N'Tarjeta de credito', N'Chavana', N'Trival', N'Nuevo Sencillo', N'Señor viejo')
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'9c200667-cb64-4ffd-8ae8-bc76d2173830', N'7f30ef42-0a40-4931-af27-447907e84d05', N'Tarjeta de credito', N'Drake Bell', N'Pop', N'Nueva cancion', N'Joven')
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'ff67a79e-f759-4c79-90eb-c1c207a88838', N'c255d87b-d05f-42a6-847b-c91d7634d809', N'Tarjeta de credito', N'Artick Monkeys', N'Rock', N'Nueva cancion', N'Grupo')
INSERT [dbo].[Artistas] ([artista_id], [codigoCategoriaAr], [metodoPago], [nombreArtista], [genero], [noticias], [detalles]) VALUES (N'58809512-4960-486f-a620-d6246c0fbb20', N'2c636a36-4d70-411f-98c8-947b29f73fe7', N'Tarjeta de credito', N'La sonora dinamita', N'Banda', N'Nueva cancion', N'Grupo musical')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'9f9cd2cb-ce7f-4e60-b61b-043ffd1c32f8', N'Grupo')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'c7ff16d5-24c0-4f13-9122-04f192d408fc', N'Grupo')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'57a3567b-6786-4752-9359-14cafea82c15', N'Orquesta')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'7f30ef42-0a40-4931-af27-447907e84d05', N'Banda')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'755c6d55-5ac5-487c-bfc2-45a683275bf2', N'Comediante')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'2c636a36-4d70-411f-98c8-947b29f73fe7', N'Banda')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'8dbb4855-bbab-43d4-8050-a59664ffd9b7', N'Orquesta')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'1a42df81-78a6-4314-b638-b2f1678aa77a', N'cantante')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'c255d87b-d05f-42a6-847b-c91d7634d809', N'Cantante')
INSERT [dbo].[CategoriaArtista] ([categoriaArtista_id], [descripcion]) VALUES (N'73c40186-1695-41be-98e3-dfb22e1261bd', N'Grupo')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'5bf65a35-3970-4cdd-a972-004444505674', N'Domicilio conocido', N'Domicilio conocido 2', N'Culiacan', N'Mexico', N'79461352')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'a9ab5a6a-a3d2-4d2c-84cc-4c843e221710', N'Domicilio conocido', N'Domicilio conocido 2', N'Merida', N'Mexico', N'65987412')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'92553bca-ea4b-48dd-9d49-616e73002b69', N'Domicilio conocido', N'Domicilio conocido 2', N'Mexicali', N'Mexico', N'93827165')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'c014dcdb-87b4-4372-b617-6606cb4f12c8', N'Domicilio conocido', N'Domicilio conocido 2', N'Guadalajara', N'Mexico', N'46859532')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'945c3018-1b12-4cd3-a516-8eb579482042', N'Domicilio conocido', N'Domicilio conocido 2', N'Fort Worth', N'Estados Unidos', N'31649785')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'7864a0a8-2b00-49ee-bcc2-dad40f5124f5', N'Domicilio conocido', N'Domicilio conocido 2', N'Cuernavaca', N'Mexico', N'23640055')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'e11fee70-9627-47ac-9664-dbd3272ad8e7', N'Domicilio conocido', N'Domicilio conocido 2', N'Cancun', N'Mexico', N'45968412')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'f79d1f26-582e-4103-b65e-dd4dbe7665ad', N'Domicilio conocido', N'Domicilio conocido 2', N'Cuernavaca', N'Mexico', N'69584723')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'9b71be71-e618-473f-9ff1-ed55187dfbec', N'Domicilio conocido', N'Domicilio conocido 2', N'Monterrey', N'Mexico', N'83228412')
INSERT [dbo].[DireccionUsuarios] ([direccion_id], [direccion1], [direccion2], [ciudad], [pais], [telefono]) VALUES (N'266d1bbc-e764-4f8a-a66b-ff3302efa4f6', N'Domicilio conocido', N'Domicilio conocido 2', N'Rosario', N'Argentina', N'96748532')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'e7c57d42-e895-4e0f-8ea4-1ccfdb42cd77', N'47ef6894-e09b-45c9-b349-70bb49666a83', N'0cd58001-3708-49b4-92db-378c110758b6', N'Evento chido', CAST(N'2019-07-01' AS Date), CAST(N'2019-09-01' AS Date), CAST(N'2019-08-01' AS Date), N'Desconocido')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'fc98f8b3-9f82-4a63-84de-1d7d5a329bd8', N'53d020f3-a9b7-4a9b-866d-baacd4e34ac2', N'268a2b95-5a2f-485c-ab7b-9a4b9372b7a8', N'Evento chido', CAST(N'2019-10-01' AS Date), CAST(N'2019-12-01' AS Date), CAST(N'2019-11-01' AS Date), N'Desconocido')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'11277c86-e6dc-483d-936e-2dbcad65c682', N'db1702d5-7241-46b2-b247-76cd9311f640', N'a447a902-7b1a-4dc3-8ac5-5412d77df03f', N'Evento chido', CAST(N'2019-10-01' AS Date), CAST(N'2019-12-01' AS Date), CAST(N'2019-11-01' AS Date), N'Desconocido')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'ef422ff8-c893-47f5-a689-88cefb596546', N'691a040f-1f47-424b-a23f-799c617af92c', N'7864b2ab-d311-4ae4-92ff-61a6cbaeb958', N'Evento chido', CAST(N'2019-01-01' AS Date), CAST(N'2019-03-01' AS Date), CAST(N'2019-02-01' AS Date), N'Desconocido')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'4656a6ba-7d17-4bee-86a1-a83e07793b53', N'ff67a79e-f759-4c79-90eb-c1c207a88838', N'c81ba583-7bd6-432b-a473-dc6057d00e4e', N'Evento chido', CAST(N'2019-04-01' AS Date), CAST(N'2019-06-01' AS Date), CAST(N'2019-05-01' AS Date), N'Desconocido')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'311c54b2-0a73-4e48-9a96-aef229c188b1', N'9c200667-cb64-4ffd-8ae8-bc76d2173830', N'879c33dc-a495-40c0-ac50-bbcb62bf17e2', N'Evento chido', CAST(N'2019-01-01' AS Date), CAST(N'2019-03-01' AS Date), CAST(N'2019-02-01' AS Date), N'Desconocido')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'a9997646-62d7-42a9-ae40-b57dc5780a6c', N'e3d2c616-5f08-4e05-a287-1658cf505ef0', N'2b15dc54-951a-4440-9d6d-f2a3b21bf459', N'Evento chido', CAST(N'2019-01-01' AS Date), CAST(N'2019-03-01' AS Date), CAST(N'2019-02-01' AS Date), N'Desconocido')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'cf8bc28d-8ae9-4c24-bff4-b716969efca7', N'58809512-4960-486f-a620-d6246c0fbb20', N'2b15dc54-951a-4440-9d6d-f2a3b21bf459', N'Evento chido', CAST(N'2019-06-01' AS Date), CAST(N'2019-08-01' AS Date), CAST(N'2019-07-01' AS Date), N'Desconocido')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'8922a023-1a91-4b5c-bf15-bfdf2b07d46e', N'74a4834a-393d-4fac-9e54-82b5df3bb3ee', N'6dc4f948-0c21-47bb-b3e0-6993166ad43b', N'Evento chido', CAST(N'2019-04-01' AS Date), CAST(N'2019-06-01' AS Date), CAST(N'2019-02-01' AS Date), N'Desconocido')
INSERT [dbo].[Eventos] ([evento_id], [artista_id], [sede_id], [nombre], [fechaInicio], [fechaFin], [fechaVenta], [detalles]) VALUES (N'a9d691ad-9d01-45a9-9b4e-d743d087fb13', N'f74b0086-c777-4a60-af29-9d48983fbf78', N'417099f9-54a0-417c-8e56-330d033e90d9', N'Evento chido', CAST(N'2019-06-01' AS Date), CAST(N'2019-08-01' AS Date), CAST(N'2019-07-01' AS Date), N'Desconocido')
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'39cab5cd-1d1f-409c-8587-437a287ef9b4', N'e7c57d42-e895-4e0f-8ea4-1ccfdb42cd77', N'1020dab3-d024-458b-b623-14d35dc82f5b', N'Enviado', CAST(N'2019-01-01' AS Date), 8120029876, 5598765432165498)
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'df78feb5-942b-4af3-8e90-8668f209beb5', N'cf8bc28d-8ae9-4c24-bff4-b716969efca7', N'94362f1f-7d41-42c1-9ccc-cd5035eb0110', N'Enviado', CAST(N'2019-09-09' AS Date), 8113498526, 5598762198159185)
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'33b3f30a-a303-44f5-ac69-96f95d438ddc', N'fc98f8b3-9f82-4a63-84de-1d7d5a329bd8', N'23d1cdc7-4b6a-466c-8db8-49a42f8bb5fc', N'Enviado', CAST(N'2019-02-02' AS Date), 8119283746, 4469853265987458)
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'7fe9cdce-cc57-4b73-8abb-a3581359cb9c', N'11277c86-e6dc-483d-936e-2dbcad65c682', N'7f301f18-daa5-4be1-bafa-555df6520c7a', N'Enviado', CAST(N'2019-03-03' AS Date), 8110348754, 5526789453621598)
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'caa36b4d-93dd-40ab-a1c7-a53f3077e673', N'4656a6ba-7d17-4bee-86a1-a83e07793b53', N'456f9128-afe5-4380-aaa6-9d3694c533e1', N'Enviado', CAST(N'2019-06-06' AS Date), 8118724562, 4426598745632155)
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'5574cc39-7654-4f7e-91fa-b7961f657a4d', N'8922a023-1a91-4b5c-bf15-bfdf2b07d46e', N'f09b8142-e8e8-4733-ab69-d1e0058adfb2', N'Enviado', CAST(N'2019-10-10' AS Date), 8127956482, 4458955625225222)
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'9cf8b956-8228-4ea3-bec6-bbe4bf187eaf', N'ef422ff8-c893-47f5-a689-88cefb596546', N'30fbd465-c0f1-4675-9616-861096fb174f', N'Enviado', CAST(N'2019-05-05' AS Date), 8128749574, 5569746589632156)
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'96b0c690-27bf-4d1e-8f20-d9d4ba2ce8a8', N'a9d691ad-9d01-45a9-9b4e-d743d087fb13', N'fdff9952-e104-488f-b242-e27f66140fa7', N'Enviado', CAST(N'2019-11-11' AS Date), 8111597536, 5513478965425896)
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'a048189a-5269-46d8-a3f4-e1965499192b', N'311c54b2-0a73-4e48-9a96-aef229c188b1', N'8524923c-ac1b-4771-a6d4-aff968badc7a', N'Enviado', CAST(N'2019-07-07' AS Date), 8116549782, 5598621654985115)
INSERT [dbo].[OrdenUsuarios] ([orden_id], [evento_id], [usuario_id], [estado_orden], [fecha_orden], [telefono_orden], [tarjeta_orden]) VALUES (N'223b8979-1e36-4a7f-b4ed-f27359857cd9', N'a9997646-62d7-42a9-ae40-b57dc5780a6c', N'ac255346-fef7-4728-8c12-c182e69dd275', N'Enviado', CAST(N'2019-08-08' AS Date), 8110058975, 4464983216549552)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'958b8990-5321-4c34-934e-0e4eccbe01c9', N'39cab5cd-1d1f-409c-8587-437a287ef9b4', N'417099f9-54a0-417c-8e56-330d033e90d9', 2, 9)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'f11625f8-e5b6-4b09-a6e1-13fc30d93f2e', N'9cf8b956-8228-4ea3-bec6-bbe4bf187eaf', N'268a2b95-5a2f-485c-ab7b-9a4b9372b7a8', 8, 2)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'b6fcaf37-567e-4afc-9cdf-19450ddb1dd8', N'df78feb5-942b-4af3-8e90-8668f209beb5', N'0cd58001-3708-49b4-92db-378c110758b6', 3, 8)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'4022ba6d-1cf4-400e-8306-30f9eab83c36', N'7fe9cdce-cc57-4b73-8abb-a3581359cb9c', N'7864b2ab-d311-4ae4-92ff-61a6cbaeb958', 5, 6)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'95a502e6-4ac2-4741-9e40-4790f58d9c0b', N'a048189a-5269-46d8-a3f4-e1965499192b', N'c81ba583-7bd6-432b-a473-dc6057d00e4e', 10, 2)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'3489abda-763c-42fd-b437-4a47b8e2d479', N'caa36b4d-93dd-40ab-a1c7-a53f3077e673', N'6dc4f948-0c21-47bb-b3e0-6993166ad43b', 6, 5)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'407f9596-cd41-4479-a8d8-50a135273b04', N'96b0c690-27bf-4d1e-8f20-d9d4ba2ce8a8', N'879c33dc-a495-40c0-ac50-bbcb62bf17e2', 9, 2)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'9b0a8ea5-2601-4c31-98a2-b79b463f2b42', N'33b3f30a-a303-44f5-ac69-96f95d438ddc', N'a447a902-7b1a-4dc3-8ac5-5412d77df03f', 4, 7)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'a0736d13-edc7-406c-a876-b9b8844dad98', N'223b8979-1e36-4a7f-b4ed-f27359857cd9', N'2b15dc54-951a-4440-9d6d-f2a3b21bf459', 11, 6)
INSERT [dbo].[ReservacionAsiento] ([reservacion_id], [orden_id], [sede_id], [numeroFila], [numeroAsiento]) VALUES (N'850b87c0-0b1a-4ee1-bdd6-e5279382ffc2', N'5574cc39-7654-4f7e-91fa-b7961f657a4d', N'6cd2b448-ab2b-4682-89ac-9615648d9d4c', 7, 4)
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'91e47071-ed83-471d-a5fe-1d1f32398aea', N'0cd58001-3708-49b4-92db-378c110758b6', N'No hay piso', N'No tiene piso')
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'1c20c1b5-27e8-491c-b594-261012f4fc70', N'879c33dc-a495-40c0-ac50-bbcb62bf17e2', N'Estetica Mary', N'Estetica Mary')
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'1bfd4923-beeb-4b36-98ea-2aa4b698a1f4', N'6dc4f948-0c21-47bb-b3e0-6993166ad43b', N'No hay paredes', N'No tiene paredes')
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'0bf359ce-6548-4dc6-94ab-4bf48fdecfa3', N'7864b2ab-d311-4ae4-92ff-61a6cbaeb958', N'Hay un oxxo', N'Al lado de un oxxo')
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'f0d8d09a-f0c4-414a-bc9e-66d205fd1200', N'268a2b95-5a2f-485c-ab7b-9a4b9372b7a8', N'Lugar blanco', N'Lugar blanco')
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'ec87ec54-cbe2-4315-90f0-6c280ee97045', N'c81ba583-7bd6-432b-a473-dc6057d00e4e', N'Mecanicidad', N'Mecanicidad')
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'9f451058-7e42-42ce-aa72-7573730023b4', N'a447a902-7b1a-4dc3-8ac5-5412d77df03f', N'Hay tierra', N'Tiene tierra')
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'1328f63e-cdc2-493a-b303-b8615abc9c7a', N'6cd2b448-ab2b-4682-89ac-9615648d9d4c', N'Casa verde', N'Casa verde')
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'c78a4b77-ef26-4e4c-8358-c11e9885c1e3', N'417099f9-54a0-417c-8e56-330d033e90d9', N'Hay arboles', N'Tiene arboles')
INSERT [dbo].[SedeDireccion] ([direccion_id], [sede_id], [indicaciones], [referenciaUbicacion]) VALUES (N'7251c890-bd56-438a-972f-f59497ed0a83', N'2b15dc54-951a-4440-9d6d-f2a3b21bf459', N'Tienda azul', N'Tienda azul')
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'417099f9-54a0-417c-8e56-330d033e90d9', N'cffd02b8-7e4f-4ec7-94f4-2d3b90e38c60', N'Arena monterrey', 5000)
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'0cd58001-3708-49b4-92db-378c110758b6', N'53d1bdce-db88-4e26-be1b-90242b01d42e', N'Arena Monterrey', 2000)
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'a447a902-7b1a-4dc3-8ac5-5412d77df03f', N'6d919623-8cf0-49b2-836a-ac89a7d348e4', N'Arena Monterrey', 2000)
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'7864b2ab-d311-4ae4-92ff-61a6cbaeb958', N'5ca6d2c4-2166-48db-88f1-cb011a916371', N'Arena Monterrey', 2000)
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'6dc4f948-0c21-47bb-b3e0-6993166ad43b', N'1a52c704-2ea4-4778-898d-7dcade510e53', N'Arena Monterrey', 2000)
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'6cd2b448-ab2b-4682-89ac-9615648d9d4c', N'5408cdc9-6b7e-462a-bbe2-4af27ea21134', N'Arena Monterrey', 2000)
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'268a2b95-5a2f-485c-ab7b-9a4b9372b7a8', N'7c9cf8aa-07fd-49b1-adec-7fc85e341a4f', N'Arena Monterrey', 2000)
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'879c33dc-a495-40c0-ac50-bbcb62bf17e2', N'1937a5ef-178a-45c8-b653-ad556172cdb9', N'Nombre desconocido', 1000)
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'c81ba583-7bd6-432b-a473-dc6057d00e4e', N'fc92d141-1fe1-4967-aa84-30425a09bd57', N'Arena Monterrey', 2000)
INSERT [dbo].[SedeEvento] ([sede_id], [direccion_id], [nombreSede], [capacidadAsientos]) VALUES (N'2b15dc54-951a-4440-9d6d-f2a3b21bf459', N'67351369-34ba-493c-bf76-21ef670eb9f9', N'Arena Monterrey', 5000)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'417099f9-54a0-417c-8e56-330d033e90d9', 2, 2)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'0cd58001-3708-49b4-92db-378c110758b6', 3, 3)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'a447a902-7b1a-4dc3-8ac5-5412d77df03f', 4, 4)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'7864b2ab-d311-4ae4-92ff-61a6cbaeb958', 5, 5)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'6dc4f948-0c21-47bb-b3e0-6993166ad43b', 6, 6)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'6cd2b448-ab2b-4682-89ac-9615648d9d4c', 7, 7)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'268a2b95-5a2f-485c-ab7b-9a4b9372b7a8', 8, 8)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'879c33dc-a495-40c0-ac50-bbcb62bf17e2', 9, 9)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'c81ba583-7bd6-432b-a473-dc6057d00e4e', 10, 10)
INSERT [dbo].[SedeFilas] ([sede_id], [numeroFila], [cuenta_asientos]) VALUES (N'2b15dc54-951a-4440-9d6d-f2a3b21bf459', 11, 11)
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'1020dab3-d024-458b-b623-14d35dc82f5b', N'a9ab5a6a-a3d2-4d2c-84cc-4c843e221710', N'Vicente', N'Guerrero', N'Masculino', N'guerrero@hotmail.com', N'987654321', CAST(N'1782-08-09' AS Date))
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'23d1cdc7-4b6a-466c-8db8-49a42f8bb5fc', N'5bf65a35-3970-4cdd-a972-004444505674', N'Juan', N'Escutia', N'Masculino', N'escutia@gmail.com', N'123456789', CAST(N'1827-08-22' AS Date))
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'7f301f18-daa5-4be1-bafa-555df6520c7a', N'a9ab5a6a-a3d2-4d2c-84cc-4c843e221710', N'Vicente', N'Guerrero', N'Masculino', N'guerrero@hotmail.com', N'987654321', CAST(N'1782-08-09' AS Date))
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'30fbd465-c0f1-4675-9616-861096fb174f', N'c014dcdb-87b4-4372-b617-6606cb4f12c8', N'Franco', N'Montes de Oca', N'Masculino', N'montes@gmail.com', N'jajaja1234321', CAST(N'1829-05-29' AS Date))
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'456f9128-afe5-4380-aaa6-9d3694c533e1', N'f79d1f26-582e-4103-b65e-dd4dbe7665ad', N'Paola', N'Montemayor', N'Femenino', N'pao.narufan@gmail.com', N'kzYuxI32uZ', CAST(N'2000-03-09' AS Date))
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'8524923c-ac1b-4771-a6d4-aff968badc7a', N'7864a0a8-2b00-49ee-bcc2-dad40f5124f5', N'Alan', N'Contreras', N'Masculino', N'contreralan@outlook.live.com', N'alalalalanXD', CAST(N'1997-08-13' AS Date))
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'ac255346-fef7-4728-8c12-c182e69dd275', N'9b71be71-e618-473f-9ff1-ed55187dfbec', N'Maria', N'Oviedo', N'Femenino', N'marilu@gmail.com', N'qwerty12345', CAST(N'1972-12-03' AS Date))
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'94362f1f-7d41-42c1-9ccc-cd5035eb0110', N'266d1bbc-e764-4f8a-a66b-ff3302efa4f6', N'Jorge', N'Cerda', N'Masculino', N'jocer@hotmail.com', N'contrasenia123', CAST(N'1952-09-17' AS Date))
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'f09b8142-e8e8-4733-ab69-d1e0058adfb2', N'92553bca-ea4b-48dd-9d49-616e73002b69', N'Agustin', N'Melgar', N'Masculino', N'melgar@outlook.live.com', N'agusmelgar321', CAST(N'1829-08-28' AS Date))
INSERT [dbo].[Usuarios] ([usuario_id], [direccion_id], [primerNombre], [apellido], [genero], [correo], [contrasenia], [fechaNacimiento]) VALUES (N'fdff9952-e104-488f-b242-e27f66140fa7', N'e11fee70-9627-47ac-9664-dbd3272ad8e7', N'Carmen', N'Martinez', N'Femenino', N'carmeGlupe@gmail.com', N'azulgrisrojo123', CAST(N'1999-01-12' AS Date))
ALTER TABLE [dbo].[Artistas]  WITH CHECK ADD  CONSTRAINT [fk_categoriaArtista] FOREIGN KEY([codigoCategoriaAr])
REFERENCES [dbo].[CategoriaArtista] ([categoriaArtista_id])
GO
ALTER TABLE [dbo].[Artistas] CHECK CONSTRAINT [fk_categoriaArtista]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [fk_artista] FOREIGN KEY([artista_id])
REFERENCES [dbo].[Artistas] ([artista_id])
GO
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [fk_artista]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [fk_sede] FOREIGN KEY([sede_id])
REFERENCES [dbo].[SedeEvento] ([sede_id])
GO
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [fk_sede]
GO
ALTER TABLE [dbo].[OrdenUsuarios]  WITH CHECK ADD  CONSTRAINT [fk_evento] FOREIGN KEY([evento_id])
REFERENCES [dbo].[Eventos] ([evento_id])
GO
ALTER TABLE [dbo].[OrdenUsuarios] CHECK CONSTRAINT [fk_evento]
GO
ALTER TABLE [dbo].[OrdenUsuarios]  WITH CHECK ADD  CONSTRAINT [fk_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuarios] ([usuario_id])
GO
ALTER TABLE [dbo].[OrdenUsuarios] CHECK CONSTRAINT [fk_usuario]
GO
ALTER TABLE [dbo].[ReservacionAsiento]  WITH CHECK ADD  CONSTRAINT [fk_numeroFila] FOREIGN KEY([numeroFila])
REFERENCES [dbo].[SedeFilas] ([numeroFila])
GO
ALTER TABLE [dbo].[ReservacionAsiento] CHECK CONSTRAINT [fk_numeroFila]
GO
ALTER TABLE [dbo].[ReservacionAsiento]  WITH CHECK ADD  CONSTRAINT [fk_orden] FOREIGN KEY([orden_id])
REFERENCES [dbo].[OrdenUsuarios] ([orden_id])
GO
ALTER TABLE [dbo].[ReservacionAsiento] CHECK CONSTRAINT [fk_orden]
GO
ALTER TABLE [dbo].[ReservacionAsiento]  WITH CHECK ADD  CONSTRAINT [fk_sedeRA] FOREIGN KEY([sede_id])
REFERENCES [dbo].[SedeEvento] ([sede_id])
GO
ALTER TABLE [dbo].[ReservacionAsiento] CHECK CONSTRAINT [fk_sedeRA]
GO
ALTER TABLE [dbo].[SedeDireccion]  WITH CHECK ADD  CONSTRAINT [fk_sedeDireccion] FOREIGN KEY([sede_id])
REFERENCES [dbo].[SedeEvento] ([sede_id])
GO
ALTER TABLE [dbo].[SedeDireccion] CHECK CONSTRAINT [fk_sedeDireccion]
GO
ALTER TABLE [dbo].[SedeFilas]  WITH CHECK ADD  CONSTRAINT [fk_sedeFilas] FOREIGN KEY([sede_id])
REFERENCES [dbo].[SedeEvento] ([sede_id])
GO
ALTER TABLE [dbo].[SedeFilas] CHECK CONSTRAINT [fk_sedeFilas]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [fk_direccionUs] FOREIGN KEY([direccion_id])
REFERENCES [dbo].[DireccionUsuarios] ([direccion_id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [fk_direccionUs]
GO
USE [master]
GO
ALTER DATABASE [TicketMaster] SET  READ_WRITE 
GO
