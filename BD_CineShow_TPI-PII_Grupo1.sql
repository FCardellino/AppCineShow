USE [master]
GO
/****** Object:  Database [CineSHOW]    Script Date: 4/11/2020 06:53:00 ******/
CREATE DATABASE [CineSHOW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CineSHOW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CineSHOW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CineSHOW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CineSHOW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CineSHOW] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CineSHOW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CineSHOW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CineSHOW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CineSHOW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CineSHOW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CineSHOW] SET ARITHABORT OFF 
GO
ALTER DATABASE [CineSHOW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CineSHOW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CineSHOW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CineSHOW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CineSHOW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CineSHOW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CineSHOW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CineSHOW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CineSHOW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CineSHOW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CineSHOW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CineSHOW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CineSHOW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CineSHOW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CineSHOW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CineSHOW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CineSHOW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CineSHOW] SET RECOVERY FULL 
GO
ALTER DATABASE [CineSHOW] SET  MULTI_USER 
GO
ALTER DATABASE [CineSHOW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CineSHOW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CineSHOW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CineSHOW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CineSHOW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CineSHOW', N'ON'
GO
ALTER DATABASE [CineSHOW] SET QUERY_STORE = OFF
GO
USE [CineSHOW]
GO
/****** Object:  Table [dbo].[Actores]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actores](
	[id_actor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[fec_nac] [date] NOT NULL,
	[id_nac] [int] NULL,
 CONSTRAINT [PK_Actores] PRIMARY KEY CLUSTERED 
(
	[id_actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Butacas]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Butacas](
	[id_butaca] [int] IDENTITY(1,1) NOT NULL,
	[id_sala] [int] NOT NULL,
	[nro_butaca] [int] NOT NULL,
 CONSTRAINT [PK_Butacas] PRIMARY KEY CLUSTERED 
(
	[id_butaca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion](
	[id_calificacion] [int] IDENTITY(1,1) NOT NULL,
	[puntaje] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Calificacion] PRIMARY KEY CLUSTERED 
(
	[id_calificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clasificaciones]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificaciones](
	[id_clasificacion] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clasificaciones] PRIMARY KEY CLUSTERED 
(
	[id_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fecha_nac] [date] NOT NULL,
	[nro_doc] [varchar](50) NOT NULL,
	[tipo_doc] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comprobantes_Compras]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobantes_Compras](
	[id_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[id_empleado] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha_compra] [date] NULL,
	[id_form_pag] [int] NOT NULL,
	[es_online] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Comprobantes_Compras] PRIMARY KEY CLUSTERED 
(
	[id_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactos_Clientes]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactos_Clientes](
	[id_contacto_cliente] [int] IDENTITY(1,1) NOT NULL,
	[contacto] [varchar](100) NOT NULL,
	[tipo_contacto] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
 CONSTRAINT [PK_Contactos_Clientes] PRIMARY KEY CLUSTERED 
(
	[id_contacto_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactos_Empleados]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactos_Empleados](
	[id_contacto_empleado] [int] IDENTITY(1,1) NOT NULL,
	[contacto] [varchar](100) NOT NULL,
	[tipo_contacto_empleado] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
 CONSTRAINT [PK_Contactos_Empleados] PRIMARY KEY CLUSTERED 
(
	[id_contacto_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuentos]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuentos](
	[id_descuento] [int] IDENTITY(1,1) NOT NULL,
	[porc_descuento] [int] NOT NULL,
 CONSTRAINT [PK_Descuentos] PRIMARY KEY CLUSTERED 
(
	[id_descuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Comprobantes]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_Comprobantes](
	[id_det_comp] [int] IDENTITY(1,1) NOT NULL,
	[id_sala_funcion] [int] NOT NULL,
	[monto] [decimal](18, 0) NOT NULL,
	[porc_descuento] [int] NULL,
	[id_comprobante] [int] NOT NULL,
	[id_descuento] [int] NULL,
 CONSTRAINT [PK_Detalles_Comprobantes] PRIMARY KEY CLUSTERED 
(
	[id_det_comp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directores]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directores](
	[id_director] [int] IDENTITY(1,1) NOT NULL,
	[nom_dir] [varchar](50) NOT NULL,
	[ape_dir] [varchar](50) NOT NULL,
	[fec_nac] [date] NOT NULL,
	[id_nac] [int] NOT NULL,
 CONSTRAINT [PK_Directores] PRIMARY KEY CLUSTERED 
(
	[id_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fecha_ingreso] [date] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forma_Pagos]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forma_Pagos](
	[id_form_pag] [int] IDENTITY(1,1) NOT NULL,
	[tipo_pago] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Forma_Pagos] PRIMARY KEY CLUSTERED 
(
	[id_form_pag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funciones]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funciones](
	[id_funcion] [int] IDENTITY(1,1) NOT NULL,
	[dia_funcion] [date] NOT NULL,
	[hora_funcion] [time](7) NOT NULL,
	[id_pelicula] [int] NOT NULL,
 CONSTRAINT [PK_Funciones] PRIMARY KEY CLUSTERED 
(
	[id_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[id_genero] [int] IDENTITY(1,1) NOT NULL,
	[genero] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idiomas]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idiomas](
	[id_idioma] [int] IDENTITY(1,1) NOT NULL,
	[idioma] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Idiomas] PRIMARY KEY CLUSTERED 
(
	[id_idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nacionalidades]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nacionalidades](
	[id_nac] [int] IDENTITY(1,1) NOT NULL,
	[nacionalidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nacionalidades] PRIMARY KEY CLUSTERED 
(
	[id_nac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[id_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](70) NOT NULL,
	[descripcion] [varchar](280) NOT NULL,
	[id_genero] [int] NOT NULL,
	[duracion] [int] NOT NULL,
	[fecha_estreno] [date] NOT NULL,
	[id_idioma] [int] NOT NULL,
	[id_clasificacion] [int] NOT NULL,
	[id_calificacion] [int] NOT NULL,
	[id_nac] [int] NOT NULL,
 CONSTRAINT [PK_Peliculas] PRIMARY KEY CLUSTERED 
(
	[id_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas_Actores]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas_Actores](
	[id_pelic_actor] [int] IDENTITY(1,1) NOT NULL,
	[id_pelicula] [int] NOT NULL,
	[id_actor] [int] NOT NULL,
 CONSTRAINT [PK_Peliculas_Actores] PRIMARY KEY CLUSTERED 
(
	[id_pelic_actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas_Directores]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas_Directores](
	[id_pelic_direc] [int] IDENTITY(1,1) NOT NULL,
	[id_pelicula] [int] NOT NULL,
	[id_director] [int] NOT NULL,
 CONSTRAINT [PK_Peliculas_Directores] PRIMARY KEY CLUSTERED 
(
	[id_pelic_direc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_sala_funcion] [int] NOT NULL,
	[id_butaca] [int] NOT NULL,
	[fecha_reserva] [date] NOT NULL,
	[se_abono] [varchar](2) NOT NULL,
	[hora_reserva] [time](7) NULL,
 CONSTRAINT [PK_Reservas] PRIMARY KEY CLUSTERED 
(
	[id_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salas]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salas](
	[id_sala] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_sala] [int] NOT NULL,
	[precio] [decimal](5, 2) NOT NULL,
	[cant_butaca] [int] NOT NULL,
 CONSTRAINT [PK_Salas] PRIMARY KEY CLUSTERED 
(
	[id_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salas_Funciones]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salas_Funciones](
	[id_sala_funcion] [int] IDENTITY(1,1) NOT NULL,
	[id_sala] [int] NOT NULL,
	[id_funcion] [int] NOT NULL,
 CONSTRAINT [PK_Salas_Funciones] PRIMARY KEY CLUSTERED 
(
	[id_sala_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[nro_ticket] [int] IDENTITY(1,1) NOT NULL,
	[id_det_comp] [int] NOT NULL,
	[id_butaca] [int] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[nro_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Doc]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Doc](
	[id_tipo_doc] [int] IDENTITY(1,1) NOT NULL,
	[tipo_doc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Doc] PRIMARY KEY CLUSTERED 
(
	[id_tipo_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Contactos_Clientes]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Contactos_Clientes](
	[id_tipo_cont_cliente] [int] IDENTITY(1,1) NOT NULL,
	[tipo_contacto_cliente] [nchar](10) NULL,
 CONSTRAINT [PK_Tipos_Contactos_Clientes] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cont_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Contactos_Empl]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Contactos_Empl](
	[id_tipo_cont_empl] [int] IDENTITY(1,1) NOT NULL,
	[tipo_contacto_empl] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipos_Contactos_Empl] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cont_empl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Salas]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Salas](
	[id_tipo_sala] [int] IDENTITY(1,1) NOT NULL,
	[tipo_sala] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipos_Salas] PRIMARY KEY CLUSTERED 
(
	[id_tipo_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actores]  WITH CHECK ADD  CONSTRAINT [FK_Actores_Nacionalidades] FOREIGN KEY([id_nac])
REFERENCES [dbo].[Nacionalidades] ([id_nac])
GO
ALTER TABLE [dbo].[Actores] CHECK CONSTRAINT [FK_Actores_Nacionalidades]
GO
ALTER TABLE [dbo].[Butacas]  WITH CHECK ADD  CONSTRAINT [FK_Butacas_Salas] FOREIGN KEY([id_sala])
REFERENCES [dbo].[Salas] ([id_sala])
GO
ALTER TABLE [dbo].[Butacas] CHECK CONSTRAINT [FK_Butacas_Salas]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Tipo_Doc] FOREIGN KEY([tipo_doc])
REFERENCES [dbo].[Tipo_Doc] ([id_tipo_doc])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Tipo_Doc]
GO
ALTER TABLE [dbo].[Comprobantes_Compras]  WITH CHECK ADD  CONSTRAINT [FK_Comprobantes_Compras_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Comprobantes_Compras] CHECK CONSTRAINT [FK_Comprobantes_Compras_Clientes]
GO
ALTER TABLE [dbo].[Comprobantes_Compras]  WITH CHECK ADD  CONSTRAINT [FK_Comprobantes_Compras_Empleados] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleados] ([id_empleado])
GO
ALTER TABLE [dbo].[Comprobantes_Compras] CHECK CONSTRAINT [FK_Comprobantes_Compras_Empleados]
GO
ALTER TABLE [dbo].[Comprobantes_Compras]  WITH CHECK ADD  CONSTRAINT [FK_Comprobantes_Compras_Forma_Pagos] FOREIGN KEY([id_form_pag])
REFERENCES [dbo].[Forma_Pagos] ([id_form_pag])
GO
ALTER TABLE [dbo].[Comprobantes_Compras] CHECK CONSTRAINT [FK_Comprobantes_Compras_Forma_Pagos]
GO
ALTER TABLE [dbo].[Contactos_Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_Clientes_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Contactos_Clientes] CHECK CONSTRAINT [FK_Contactos_Clientes_Clientes]
GO
ALTER TABLE [dbo].[Contactos_Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_Clientes_Tipos_Contactos_Clientes] FOREIGN KEY([tipo_contacto])
REFERENCES [dbo].[Tipos_Contactos_Clientes] ([id_tipo_cont_cliente])
GO
ALTER TABLE [dbo].[Contactos_Clientes] CHECK CONSTRAINT [FK_Contactos_Clientes_Tipos_Contactos_Clientes]
GO
ALTER TABLE [dbo].[Contactos_Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_Empleados_Empleados] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleados] ([id_empleado])
GO
ALTER TABLE [dbo].[Contactos_Empleados] CHECK CONSTRAINT [FK_Contactos_Empleados_Empleados]
GO
ALTER TABLE [dbo].[Contactos_Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_Empleados_Tipos_Contactos_Empl] FOREIGN KEY([tipo_contacto_empleado])
REFERENCES [dbo].[Tipos_Contactos_Empl] ([id_tipo_cont_empl])
GO
ALTER TABLE [dbo].[Contactos_Empleados] CHECK CONSTRAINT [FK_Contactos_Empleados_Tipos_Contactos_Empl]
GO
ALTER TABLE [dbo].[Detalles_Comprobantes]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Comprobantes_Comprobantes_Compras] FOREIGN KEY([id_comprobante])
REFERENCES [dbo].[Comprobantes_Compras] ([id_comprobante])
GO
ALTER TABLE [dbo].[Detalles_Comprobantes] CHECK CONSTRAINT [FK_Detalles_Comprobantes_Comprobantes_Compras]
GO
ALTER TABLE [dbo].[Detalles_Comprobantes]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Comprobantes_Descuentos] FOREIGN KEY([id_descuento])
REFERENCES [dbo].[Descuentos] ([id_descuento])
GO
ALTER TABLE [dbo].[Detalles_Comprobantes] CHECK CONSTRAINT [FK_Detalles_Comprobantes_Descuentos]
GO
ALTER TABLE [dbo].[Detalles_Comprobantes]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Comprobantes_Salas_Funciones] FOREIGN KEY([id_sala_funcion])
REFERENCES [dbo].[Salas_Funciones] ([id_sala_funcion])
GO
ALTER TABLE [dbo].[Detalles_Comprobantes] CHECK CONSTRAINT [FK_Detalles_Comprobantes_Salas_Funciones]
GO
ALTER TABLE [dbo].[Directores]  WITH CHECK ADD  CONSTRAINT [FK_Directores_Nacionalidades] FOREIGN KEY([id_nac])
REFERENCES [dbo].[Nacionalidades] ([id_nac])
GO
ALTER TABLE [dbo].[Directores] CHECK CONSTRAINT [FK_Directores_Nacionalidades]
GO
ALTER TABLE [dbo].[Funciones]  WITH CHECK ADD  CONSTRAINT [FK_Funciones_Peliculas] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[Funciones] CHECK CONSTRAINT [FK_Funciones_Peliculas]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Calificacion] FOREIGN KEY([id_calificacion])
REFERENCES [dbo].[Calificacion] ([id_calificacion])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Calificacion]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Clasificaciones] FOREIGN KEY([id_clasificacion])
REFERENCES [dbo].[Clasificaciones] ([id_clasificacion])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Clasificaciones]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Generos] FOREIGN KEY([id_genero])
REFERENCES [dbo].[Generos] ([id_genero])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Generos]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Idiomas] FOREIGN KEY([id_idioma])
REFERENCES [dbo].[Idiomas] ([id_idioma])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Idiomas]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Nacionalidades] FOREIGN KEY([id_nac])
REFERENCES [dbo].[Nacionalidades] ([id_nac])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Nacionalidades]
GO
ALTER TABLE [dbo].[Peliculas_Actores]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Actores_Actores] FOREIGN KEY([id_actor])
REFERENCES [dbo].[Actores] ([id_actor])
GO
ALTER TABLE [dbo].[Peliculas_Actores] CHECK CONSTRAINT [FK_Peliculas_Actores_Actores]
GO
ALTER TABLE [dbo].[Peliculas_Actores]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Actores_Peliculas] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[Peliculas_Actores] CHECK CONSTRAINT [FK_Peliculas_Actores_Peliculas]
GO
ALTER TABLE [dbo].[Peliculas_Directores]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Directores_Directores] FOREIGN KEY([id_director])
REFERENCES [dbo].[Directores] ([id_director])
GO
ALTER TABLE [dbo].[Peliculas_Directores] CHECK CONSTRAINT [FK_Peliculas_Directores_Directores]
GO
ALTER TABLE [dbo].[Peliculas_Directores]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Directores_Peliculas] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[Peliculas_Directores] CHECK CONSTRAINT [FK_Peliculas_Directores_Peliculas]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Butacas] FOREIGN KEY([id_butaca])
REFERENCES [dbo].[Butacas] ([id_butaca])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Butacas]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Clientes]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Salas_Funciones] FOREIGN KEY([id_sala_funcion])
REFERENCES [dbo].[Salas_Funciones] ([id_sala_funcion])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Salas_Funciones]
GO
ALTER TABLE [dbo].[Salas]  WITH CHECK ADD  CONSTRAINT [FK_Salas_Tipos_Salas] FOREIGN KEY([id_tipo_sala])
REFERENCES [dbo].[Tipos_Salas] ([id_tipo_sala])
GO
ALTER TABLE [dbo].[Salas] CHECK CONSTRAINT [FK_Salas_Tipos_Salas]
GO
ALTER TABLE [dbo].[Salas_Funciones]  WITH CHECK ADD  CONSTRAINT [FK_Salas_Funciones_Funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[Funciones] ([id_funcion])
GO
ALTER TABLE [dbo].[Salas_Funciones] CHECK CONSTRAINT [FK_Salas_Funciones_Funciones]
GO
ALTER TABLE [dbo].[Salas_Funciones]  WITH CHECK ADD  CONSTRAINT [FK_Salas_Funciones_Salas] FOREIGN KEY([id_sala])
REFERENCES [dbo].[Salas] ([id_sala])
GO
ALTER TABLE [dbo].[Salas_Funciones] CHECK CONSTRAINT [FK_Salas_Funciones_Salas]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Butacas] FOREIGN KEY([id_butaca])
REFERENCES [dbo].[Butacas] ([id_butaca])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Butacas]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Detalles_Comprobantes] FOREIGN KEY([id_det_comp])
REFERENCES [dbo].[Detalles_Comprobantes] ([id_det_comp])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Detalles_Comprobantes]
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_filtroGenero]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_consulta_filtroGenero]
@genero varchar(50)
as
SELECT	year(cc.fecha_compra) as 'Año de Función',
		month(cc.fecha_compra) as 'Mes de Función',
		p.id_pelicula as 'Código',
		p.titulo as 'Título de Película', 
		sum(dc.monto) 'Importe Recaudado'
  FROM Comprobantes_Compras cc 
		join Detalles_Comprobantes dc on cc.id_comprobante = dc.id_comprobante
		join Salas_Funciones sf on dc.id_sala_funcion = sf.id_sala_funcion
		join Funciones f on sf.id_funcion = f.id_funcion
		join Peliculas p on f.id_pelicula = p.id_pelicula
		join Generos g on p.id_genero = g.id_genero
 WHERE g.genero like @genero
 GROUP by year(cc.fecha_compra),month(cc.fecha_compra), p.id_pelicula, p.titulo
 ORDER by 1,2
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta1_Original]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Consulta1_Original]
as
SELECT	year(cc.fecha_compra) as 'Año de Función',
		month(cc.fecha_compra) as 'Mes de Función',
		p.id_pelicula as 'Código',
		p.titulo as 'Título de Película', 
		sum(dc.monto) 'Importe Recaudado'
  FROM Comprobantes_Compras cc 
		join Detalles_Comprobantes dc on cc.id_comprobante = dc.id_comprobante
		join Salas_Funciones sf on dc.id_sala_funcion = sf.id_sala_funcion
		join Funciones f on sf.id_funcion = f.id_funcion
		join Peliculas p on f.id_pelicula = p.id_pelicula
		join Generos g on p.id_genero = g.id_genero
 WHERE g.genero like '%anim%' 
 GROUP by year(cc.fecha_compra),month(cc.fecha_compra), p.id_pelicula, p.titulo
HAVING sum(dc.monto) >= (SELECT sum(dc1.monto)/count(distinct month(cc1.fecha_compra))
						  FROM Detalles_Comprobantes dc1 
						       join Comprobantes_Compras cc1 
							   on dc1.id_comprobante = cc1.id_comprobante
						 WHERE YEAR(cc1.fecha_compra)=year(cc.fecha_compra))  
ORDER by 1
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta1_SinFiltros]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Consulta1_SinFiltros]
as
SELECT	year(cc.fecha_compra) as 'Año de Función',
		month(cc.fecha_compra) as 'Mes de Función',
		p.id_pelicula as 'Código',
		p.titulo as 'Título de Película', 
		sum(dc.monto) 'Importe Recaudado'
  FROM Comprobantes_Compras cc 
		join Detalles_Comprobantes dc on cc.id_comprobante = dc.id_comprobante
		join Salas_Funciones sf on dc.id_sala_funcion = sf.id_sala_funcion
		join Funciones f on sf.id_funcion = f.id_funcion
		join Peliculas p on f.id_pelicula = p.id_pelicula
		join Generos g on p.id_genero = g.id_genero
 
 GROUP by year(cc.fecha_compra),month(cc.fecha_compra), p.id_pelicula, p.titulo
ORDER by 1
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta2_anioPasado]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Consulta2_anioPasado]
as
SELECT	p.id_pelicula as '  ', 
		'01-Nombre Pelicula: ' as ' ', 
		p.titulo 'Nombre', 
		' ' as 'Cantidad de entradas compradas'
  FROM Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula
 
	where	 year(p.fecha_estreno)=year(GETDATE())-1
UNION
SELECT	p.id_pelicula ,
		'02-Fecha de Estreno: ', 
		cast(p.fecha_estreno as varchar(20)),  
		' '
  FROM Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula
 
		 where year(p.fecha_estreno)=year(GETDATE())-1
UNION
SELECT	p.id_pelicula ,
		'03-Cliente', 
		c.apellido+', '+c.nombre, 
		cast( (SELECT count(*) 
				 FROM Detalles_Comprobantes dc2 
					  join Comprobantes_Compras cc2 
					  on cc2.id_comprobante=dc2.id_comprobante 
				WHERE cc2.id_cliente=cc.id_cliente) as varchar(10))
  FROM Clientes c join Comprobantes_Compras cc on c.id_cliente = cc.id_cliente
                  join Detalles_Comprobantes dc on dc.id_comprobante = cc.id_comprobante
				  join Salas_Funciones sf on sf.id_sala_funcion = dc.id_sala_funcion
				  join Funciones f on f.id_funcion = sf.id_funcion
				  join Peliculas p on p.id_pelicula = f.id_pelicula
 
		 where year(p.fecha_estreno)=year(GETDATE())-1
		
ORDER by 1, 2
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta2_Original]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Consulta2_Original]
as
SELECT	p.id_pelicula as '  ', 
		'01-Nombre Pelicula: ' as ' ', 
		p.titulo 'Nombre', 
		' ' as 'Cantidad de entradas compradas'
  FROM Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula
 WHERE p.fecha_estreno = (SELECT min(ff.dia_funcion) 
						    FROM Funciones ff 
						   WHERE ff.id_pelicula = f.id_pelicula )
	
UNION
SELECT	p.id_pelicula ,
		'02-Fecha de Estreno: ', 
		cast(p.fecha_estreno as varchar(20)),  
		' '
  FROM Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula
 WHERE p.fecha_estreno = (SELECT min(ff.dia_funcion) 
							FROM Funciones ff 
						   WHERE ff.id_pelicula = f.id_pelicula )
		 
UNION
SELECT	p.id_pelicula ,
		'03-Cliente', 
		c.apellido+', '+c.nombre, 
		cast( (SELECT count(*) 
				 FROM Detalles_Comprobantes dc2 
					  join Comprobantes_Compras cc2 
					  on cc2.id_comprobante=dc2.id_comprobante 
				WHERE cc2.id_cliente=cc.id_cliente) as varchar(10))
  FROM Clientes c join Comprobantes_Compras cc on c.id_cliente = cc.id_cliente
                  join Detalles_Comprobantes dc on dc.id_comprobante = cc.id_comprobante
				  join Salas_Funciones sf on sf.id_sala_funcion = dc.id_sala_funcion
				  join Funciones f on f.id_funcion = sf.id_funcion
				  join Peliculas p on p.id_pelicula = f.id_pelicula
 WHERE c.id_cliente in (SELECT cc1.id_cliente
                          FROM Funciones f1 
						         join Salas_Funciones sf1 
								 on f1.id_funcion = sf1.id_funcion
						         join Detalles_Comprobantes dc1 
								 on sf1.id_sala_funcion = dc1.id_sala_funcion
								 join Comprobantes_Compras cc1 
								 on cc1.id_comprobante = dc1.id_comprobante
								 join Peliculas p1 
								 on p1.id_pelicula = f1.id_pelicula  
						  WHERE f1.dia_funcion = p1.fecha_estreno
						   )
		 
		
ORDER by 1, 2
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta2_SinFiltro]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Consulta2_SinFiltro]
as
SELECT	p.id_pelicula as ' ', 
		'01-Nombre Pelicula: ' as ' ', 
		p.titulo 'Nombre', 
		' ' as 'Cantidad de entradas compradas'
  FROM Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula
 
UNION
SELECT	p.id_pelicula ,
		'02-Fecha de Estreno: ', 
		cast(p.fecha_estreno as varchar(20)),  
		' '
  FROM Peliculas p join Funciones f on f.id_pelicula = p.id_pelicula
 
UNION
SELECT	p.id_pelicula ,
		'03-Cliente', 
		c.apellido+', '+c.nombre, 
		cast( (SELECT count(*) 
				 FROM Detalles_Comprobantes dc2 
					  join Comprobantes_Compras cc2 
					  on cc2.id_comprobante=dc2.id_comprobante 
				WHERE cc2.id_cliente=cc.id_cliente) as varchar(10))
  FROM Clientes c join Comprobantes_Compras cc on c.id_cliente = cc.id_cliente
                  join Detalles_Comprobantes dc on dc.id_comprobante = cc.id_comprobante
				  join Salas_Funciones sf on sf.id_sala_funcion = dc.id_sala_funcion
				  join Funciones f on f.id_funcion = sf.id_funcion
				  join Peliculas p on p.id_pelicula = f.id_pelicula
		
ORDER by 1, 2
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta3_Original]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Consulta3_Original]
as
SELECT	
	cp.id_empleado as ' ' ,
	e.apellido+', '+e.nombre 'Vendedor',
	p.titulo 'Pelicula',
	str(count(*)) 'Cantidad de entradas',
	sum(dt.monto) 'Importe'
  FROM Comprobantes_Compras cp 
		join Detalles_Comprobantes dt on dt.id_comprobante=cp.id_comprobante 
		join Empleados e on cp.id_empleado = e.id_empleado
		join Salas_Funciones sf on dt.id_sala_funcion=sf.id_sala_funcion
		join Funciones f on  sf.id_funcion=f.id_funcion
		join Peliculas p on f.id_pelicula=p.id_pelicula
GROUP by cp.id_empleado, e.apellido, e.nombre , p.id_pelicula, p.titulo
UNION
SELECT
	cp.id_empleado,
	' - ', 
	' - ' , 
	'Importe total' ,
	SUM(monto)
  FROM Comprobantes_Compras cp 
		join Detalles_Comprobantes dt on dt.id_comprobante=cp.id_comprobante
		join Empleados e on cp.id_empleado = e.id_empleado
GROUP by cp.id_empleado, e.apellido, e.nombre
ORDER by 1,4
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta4_EsteAnio]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Consulta4_EsteAnio]
as
SELECT
 MONTH(cp.fecha_compra) 'Mes',
 YEAR(cp.fecha_compra) 'Año',
 SUM(monto) 'Total Recaudado',
  sum(monto)/count( distinct dt.id_comprobante) 'Promedio de Venta'
 FROM Detalles_Comprobantes dt
 join Comprobantes_Compras cp on dt.id_comprobante=cp.id_comprobante
GROUP by MONTH(cp.fecha_compra), YEAR(cp.fecha_compra)
HAVING sum(monto) >= (SELECT sum(monto)/count(cp2.fecha_compra)
					FROM Detalles_Comprobantes dt2 join Comprobantes_Compras cp2 
					on dt2.id_comprobante=cp2.id_comprobante
					where year(cp2.fecha_compra) = year(getdate())--YEAR(cp.fecha_compra)
					)
order by 2 desc
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta4_Original]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Consulta4_Original]
as
SELECT
 MONTH(cp.fecha_compra) 'Mes',
 YEAR(cp.fecha_compra) 'Año',
 SUM(monto) 'Total Recaudado',
  sum(monto)/count( distinct dt.id_comprobante) 'Promedio de Venta'
 FROM Detalles_Comprobantes dt
 join Comprobantes_Compras cp on dt.id_comprobante=cp.id_comprobante
GROUP by MONTH(cp.fecha_compra), YEAR(cp.fecha_compra)
HAVING sum(monto) >= (SELECT sum(monto)/count( distinct month( cp2.fecha_compra))
					FROM Detalles_Comprobantes dt2 join Comprobantes_Compras cp2 
					on dt2.id_comprobante=cp2.id_comprobante
					where year(cp2.fecha_compra) = YEAR(cp.fecha_compra)
					)
order by 2 desc
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta5_Original]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Consulta5_Original]
as
SELECT 
	p.id_pelicula as ' ' ,
	'01-Nombre Película: ' as  '  ', 
	p.titulo 'Nombre',
	g.genero 'Género' ,
	cast( (SELECT count(*) 
	         FROM Detalles_Comprobantes dc 
			        join Salas_Funciones sf on sf.id_sala_funcion = dc.id_sala_funcion 
			        join Funciones f on f.id_funcion=sf.id_funcion 
			WHERE f.id_pelicula = p.id_pelicula) as varchar(10)) 'Cantidad de espectadores'
  FROM Peliculas p 
		join Calificacion c on p.id_calificacion = c.id_calificacion
        join Generos g on g.id_genero = p.id_genero
 WHERE c.puntaje like '[4,5]%'
UNION
SELECT 
	p.id_pelicula, 
	'02-Nombre Director/es: ', 
	d.ape_dir+', '+d.nom_dir, 
	' - ', 
	' - '
  FROM Peliculas p 
		join Peliculas_Directores pd on pd.id_pelicula = p.id_pelicula
        join Directores d on d.id_director = pd.id_director
		join Calificacion c on p.id_calificacion = c.id_calificacion
 WHERE c.puntaje like '[4,5]%'--usamos un test de correspondencia con el patron ya que el campo es de tipo varchar
UNION
SELECT 
	p.id_pelicula,
	'03-Nombre Actor/es: ', 
	a.apellido+', '+a.nombre, 
	' - ', 
	' - '
  FROM Peliculas p 
		join Peliculas_Actores pa on pa.id_pelicula = p.id_pelicula
		join Actores a on a.id_actor = pa.id_actor
		join Calificacion c on p.id_calificacion = c.id_calificacion
 WHERE c.puntaje like '[4,5]%'
 ORDER by 1

GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta5_PuntajesTodos]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Consulta5_PuntajesTodos]
as
SELECT 
	p.id_pelicula as ' ' ,
	'01-Nombre Película: ' as  '  ', 
	p.titulo 'Nombre',
	g.genero 'Género' ,
	cast( (SELECT count(*) 
	         FROM Detalles_Comprobantes dc 
			        join Salas_Funciones sf on sf.id_sala_funcion = dc.id_sala_funcion 
			        join Funciones f on f.id_funcion=sf.id_funcion 
			WHERE f.id_pelicula = p.id_pelicula) as varchar(10)) 'Cantidad de espectadores'
  FROM Peliculas p 
		join Calificacion c on p.id_calificacion = c.id_calificacion
        join Generos g on g.id_genero = p.id_genero
 --WHERE c.puntaje like '[4,5]%'
UNION
SELECT 
	p.id_pelicula, 
	'02-Nombre Director/es: ', 
	d.ape_dir+', '+d.nom_dir, 
	' - ', 
	' - '
  FROM Peliculas p 
		join Peliculas_Directores pd on pd.id_pelicula = p.id_pelicula
        join Directores d on d.id_director = pd.id_director
		join Calificacion c on p.id_calificacion = c.id_calificacion
 --WHERE c.puntaje like '[4,5]%'--usamos un test de correspondencia con el patron ya que el campo es de tipo varchar
UNION
SELECT 
	p.id_pelicula,
	'03-Nombre Actor/es: ', 
	a.apellido+', '+a.nombre, 
	' - ', 
	' - '
  FROM Peliculas p 
		join Peliculas_Actores pa on pa.id_pelicula = p.id_pelicula
		join Actores a on a.id_actor = pa.id_actor
		join Calificacion c on p.id_calificacion = c.id_calificacion
 --WHERE c.puntaje like '[4,5]%'
 ORDER by 1

GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta6_MinutosTotales]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Consulta6_MinutosTotales]
as
SELECT  
	str(s.id_sala) as ' ',
	'N° Sala: ' as ' ',
	str(s.id_sala) 'Sala',
	str(sum(p.duracion)/count(f.id_funcion)) 'Minutos promedio de uso del Proyector',
    SUM(p.duracion) 'Minutos Totales'
  FROM Peliculas p 
		join Funciones f on p.id_pelicula=f.id_pelicula
        join Salas_Funciones sf on sf.id_funcion=f.id_funcion
        join Salas s on s.id_sala=sf.id_sala
 GROUP by s.id_sala
 order by 1

GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta6_Original]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Consulta6_Original]
as
SELECT  
	str(s.id_sala) as ' ',
	'N° Sala: ' as ' ',
	str(s.id_sala) 'Sala',
	str(sum(p.duracion)/count(f.id_funcion)) 'Minutos promedio de uso del Proyector',
    SUM(p.duracion) 'Minutos Totales'
  FROM Peliculas p 
		join Funciones f on p.id_pelicula=f.id_pelicula
        join Salas_Funciones sf on sf.id_funcion=f.id_funcion
        join Salas s on s.id_sala=sf.id_sala
 GROUP by s.id_sala
-- order by 1
UNION
SELECT 
	str(s.id_sala),
	' - ',
	' - ', 
	'Total de minutos de proyección del año pasado', 
	SUM(p.duracion) 
  FROM Peliculas p 
		join Funciones f on p.id_pelicula=f.id_pelicula
        join Salas_Funciones sf on sf.id_funcion=f.id_funcion
        join Salas s on s.id_sala=sf.id_sala
        join Tipos_Salas ts on ts.id_tipo_sala=s.id_tipo_sala
 WHERE YEAR(dia_funcion) = YEAR(GETDATE()-1)
 GROUP by s.id_sala
 ORDER by 1,4

GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta7_Original]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Consulta7_Original]
as
SELECT
    pelicula.titulo as 'Título de Película',
    pelicula.duracion as 'Duración de película',
    count(*) as 'Historico Tickets'
FROM Detalles_Comprobantes detalle
       join Tickets ticket on detalle.id_det_comp = ticket.id_det_comp
       join Salas_Funciones salafuncion on detalle.id_sala_funcion = salafuncion.id_sala_funcion
       join Funciones funcion on salafuncion.id_funcion = funcion.id_funcion
       join Peliculas pelicula on funcion.id_pelicula = pelicula.id_pelicula
GROUP by pelicula.titulo, pelicula.duracion
HAVING pelicula.duracion >= (
    SELECT cast(avg(pelicula1.duracion) as decimal)
    FROM Peliculas pelicula1
)
ORDER by 3 desc
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta7_TicketsSupProm]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Consulta7_TicketsSupProm]
as
SELECT
    pelicula.titulo as 'Título de Película',
    pelicula.duracion as 'Duración de película',
    count(*) as 'Historico Tickets'
FROM Detalles_Comprobantes detalle
       join Tickets ticket on detalle.id_det_comp = ticket.id_det_comp
       join Salas_Funciones salafuncion on detalle.id_sala_funcion = salafuncion.id_sala_funcion
       join Funciones funcion on salafuncion.id_funcion = funcion.id_funcion
       join Peliculas pelicula on funcion.id_pelicula = pelicula.id_pelicula
GROUP by pelicula.titulo, pelicula.duracion
--HAVING pelicula.duracion >= (
--    SELECT cast(avg(pelicula1.duracion) as decimal)
--    FROM Peliculas pelicula1
--)
ORDER by 3 desc
GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta8_original]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Consulta8_original]
as
SELECT
	cliente.nombre + ' ' + cliente.apellido as 'Cliente',
	cliente.fecha_nac as 'Fecha de Nacimiento',
	sum(detalle.monto) as 'Gasto total cliente'
FROM Comprobantes_Compras comprobante
		join Clientes cliente on comprobante.id_cliente = cliente.id_cliente
		join Detalles_Comprobantes detalle on comprobante.id_comprobante = detalle.id_comprobante
GROUP by cliente.nombre + ' ' + cliente.apellido, cliente.fecha_nac
HAVING sum(detalle.monto) >= (
	SELECT cast(sum(detalle1.monto) as decimal)/cast(count(distinct cliente1.id_cliente) as decimal)
	FROM Comprobantes_Compras comprobante1
	join Clientes cliente1 on comprobante1.id_cliente = cliente1.id_cliente
	join Detalles_Comprobantes detalle1 on comprobante1.id_comprobante = detalle1.id_comprobante
)
ORDER by 3 desc

GO
/****** Object:  StoredProcedure [dbo].[sp_Consulta8_TodosClientes]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Consulta8_TodosClientes]
as
SELECT
	cliente.nombre + ' ' + cliente.apellido as 'Cliente',
	cliente.fecha_nac as 'Fecha de Nacimiento',
	sum(detalle.monto) as 'Gasto total cliente'
FROM Comprobantes_Compras comprobante
		join Clientes cliente on comprobante.id_cliente = cliente.id_cliente
		join Detalles_Comprobantes detalle on comprobante.id_comprobante = detalle.id_comprobante
GROUP by cliente.nombre + ' ' + cliente.apellido, cliente.fecha_nac
--HAVING sum(detalle.monto) >= (
--	SELECT cast(sum(detalle1.monto) as decimal)/cast(count(distinct cliente1.id_cliente) as decimal)
--	FROM Comprobantes_Compras comprobante1
--	join Clientes cliente1 on comprobante1.id_cliente = cliente1.id_cliente
--	join Detalles_Comprobantes detalle1 on comprobante1.id_comprobante = detalle1.id_comprobante
--)
ORDER by 3 desc
GO
/****** Object:  StoredProcedure [dbo].[sp_ImporteTot_Sup_o_Igual_PromMensual]    Script Date: 4/11/2020 06:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ImporteTot_Sup_o_Igual_PromMensual]
 as
 SELECT	year(cc.fecha_compra) as 'Año de Función',
		month(cc.fecha_compra) as 'Mes de Función',
		p.id_pelicula as 'Código',
		p.titulo as 'Título de Película', 
		sum(dc.monto) 'Importe Recaudado'
  FROM Comprobantes_Compras cc 
		join Detalles_Comprobantes dc on cc.id_comprobante = dc.id_comprobante
		join Salas_Funciones sf on dc.id_sala_funcion = sf.id_sala_funcion
		join Funciones f on sf.id_funcion = f.id_funcion
		join Peliculas p on f.id_pelicula = p.id_pelicula
		join Generos g on p.id_genero = g.id_genero
 
 GROUP by year(cc.fecha_compra),month(cc.fecha_compra), p.id_pelicula, p.titulo
HAVING sum(dc.monto) >= (SELECT sum(dc1.monto)/count(distinct month(cc1.fecha_compra))
						  FROM Detalles_Comprobantes dc1 
						       join Comprobantes_Compras cc1 
							   on dc1.id_comprobante = cc1.id_comprobante
						 WHERE YEAR(cc1.fecha_compra)=year(cc.fecha_compra))
ORDER by 1
GO
USE [master]
GO
ALTER DATABASE [CineSHOW] SET  READ_WRITE 
GO

------------------------------------------------------------------------------------------------------------
--INSERTS
------------------------------------------------------------------------------------------------------------
use CineSHOW
go

set dateformat dmy

--TIPO DE DOCUMENTO--
insert into Tipo_Doc (tipo_doc) values ('Libreta de Enrolamiento')
insert into Tipo_Doc (tipo_doc) values ('Libreta Cívica')
insert into Tipo_Doc (tipo_doc) values ('Documento Nacional de Identidad')
insert into Tipo_Doc (tipo_doc) values ('Pasaporte')


--CLIENTES--
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Cardellino', 'Fernando', '19/04/1992', 36883025, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Andreatta', 'Liliana', '15/05/1959', 13660724, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Cornaglia', 'Leandro', '01/12/1988', 33060899, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Marini', 'Melisa', '15/09/1994', 38945023, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Garnica Rodriguez', 'Vanesa', '28/09/1994', 37883022, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Jiustina', 'Narella', '24/09/1992', 35325677, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Roca', 'Lucio', '31/03/1994', 38123458, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Esmaldon', 'Javier', '17/06/2005', 43868745, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Canavesio', 'Jose', '30/06/2010', 47921378, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Suarez', 'Guillermo', '15/11/1945', 10915321, 1)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Ingaramo', 'Nelida', '18/10/1950', 13080256, 2)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Serena', 'Norberto', '20/08/1954', 17940554, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Klor', 'Adriana', '04/03/2000', 44050230, 4)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Sobrero', 'Agostina', '14/09/1991', 34256789, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Antun', 'Germán', '14/11/1984', 30221300, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Herrera', 'Brenda', '28/01/1955', 18090553, 2)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Tosco', 'Camilo', '11/03/2002', 44884025, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Alioni', 'Magdalena', '20/05/1991', 35025671, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Molinari', 'Cristian', '12/06/1998', 42300150, 3)
insert into Clientes (apellido, nombre, fecha_nac, nro_doc, tipo_doc) values ('Carranza', 'Silvana', '25/07/1960', 13550245, 4)


--TIPOS DE CONTACTO CLIENTES--
insert into Tipos_Contactos_Clientes (tipo_contacto_cliente) values ('Teléfono')
insert into Tipos_Contactos_Clientes (tipo_contacto_cliente) values ('Email')
insert into Tipos_Contactos_Clientes (tipo_contacto_cliente) values ('Instagram')
insert into Tipos_Contactos_Clientes (tipo_contacto_cliente) values ('Facebook')


--CONTACTOS DE CLIENTES--
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('3512040207', 1, 1 )
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('cardellinofno@gmail.com', 2, 1)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('3563422012', 1, 2)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('cornaglial@hotmail.com', 2, 3)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('marini.melisa', 3, 4)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('3514022345', 1, 5)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('vrodiguez@yahoo.com',2,5)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('3513947821', 1, 6)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('smalj@gmail.com', 2, 8)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('3518437921', 1, 10)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('3562792432', 1, 11)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('3546687034', 1, 14)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('antungerman@hotmail.com', 2, 15)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('3515878921', 1, 18)
insert into Contactos_Clientes (contacto, tipo_contacto, id_cliente) values ('silcarranza@gmail.com',2,20)

--EMPLEADOS--
insert into Empleados (apellido, nombre, fecha_ingreso) values ('Mendoza', 'Alejandra', '01/06/2014')
insert into Empleados (apellido, nombre, fecha_ingreso) values ('Lorenzatti', 'José', '06/01/2015')
insert into Empleados (apellido, nombre, fecha_ingreso) values ('Vacheta', 'Bárbara', '10/10/2016')
insert into Empleados (apellido, nombre, fecha_ingreso) values ('Flores', 'Carlos', '05/09/2013')
insert into Empleados (apellido, nombre, fecha_ingreso) values ('Pesci', 'Marcelo', '20/11/2011')


--TIPOS DE CONTACTOS EMPLEADOS--
insert into Tipos_Contactos_Empl(tipo_contacto_empl) values ('Teléfono')
insert into Tipos_Contactos_Empl(tipo_contacto_empl) values ('Email')


--CONTACTOS DE EMPLEADOS--
insert into Contactos_Empleados (contacto, tipo_contacto_empleado, id_empleado) values ('3513432789', 1, 1)
insert into Contactos_Empleados (contacto, tipo_contacto_empleado, id_empleado) values ('3512030447', 1, 2)
insert into Contactos_Empleados (contacto, tipo_contacto_empleado, id_empleado) values ('lorenjose@yahoo.com',2,2)
insert into Contactos_Empleados (contacto, tipo_contacto_empleado, id_empleado) values ('3516090832', 1, 3)
insert into Contactos_Empleados (contacto, tipo_contacto_empleado, id_empleado) values ('3513345772', 1, 4)
insert into Contactos_Empleados (contacto, tipo_contacto_empleado, id_empleado) values ('carlosflores@hotmail.com',2,4)
insert into Contactos_Empleados (contacto, tipo_contacto_empleado, id_empleado) values ('3515903403', 1, 5)


--FOAS DE PAGO--
insert into Forma_Pagos (tipo_pago) values ('Efectivo')
insert into Forma_Pagos (tipo_pago) values ('Débito')
insert into Forma_Pagos (tipo_pago) values ('Crédito')


--TIPOS DE SALAS--
insert into Tipos_Salas (tipo_sala) values ('2D')
insert into Tipos_Salas (tipo_sala) values ('3D')
insert into Tipos_Salas (tipo_sala) values ('3D Xtremo')
insert into Tipos_Salas (tipo_sala) values ('4D')
insert into Tipos_Salas (tipo_sala) values ('Platinum')


--SALAS--
insert into Salas (id_tipo_sala, precio, cant_butaca) values (1,200,30)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (1,200,30)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (1,200,30)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (1,200,30)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (2,230,30)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (2,230,30)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (3,260,30)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (3,260,30)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (4,320,30)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (5,350,20)
insert into Salas (id_tipo_sala, precio, cant_butaca) values (5,350,20)




--GÉNEROS PELPICULAS--
insert into Generos (genero) values ('Animación')
insert into Generos (genero) values ('Suspenso')
insert into Generos (genero) values ('Comedia')
insert into Generos (genero) values ('Drama')
insert into Generos (genero) values ('Crimen')
insert into Generos (genero) values ('Acción')
insert into Generos (genero) values ('Ciencia Ficción')


--IDIOMAS PELÍCULAS--
insert into Idiomas (idioma) values ('Inglés')
insert into Idiomas (idioma) values ('Castellano')


--CALIFICACIONES--
insert into Calificacion (puntaje) values ('1 Estrella')
insert into Calificacion (puntaje) values ('2 Estrellas')
insert into Calificacion (puntaje) values ('3 Estrellas')
insert into Calificacion (puntaje) values ('4 Estrellas')
insert into Calificacion (puntaje) values ('5 Estrellas')


--CLASIFICACIONES--
insert into Clasificaciones (categoria) values ('Todas las edades')
insert into Clasificaciones (categoria) values ('+13 años')
insert into Clasificaciones (categoria) values ('+16 años')
insert into Clasificaciones (categoria) values ('+18 años')
insert into Clasificaciones (categoria) values ('Exhibición condicionada')


--NACIONALIDADES--
insert into Nacionalidades (nacionalidad) values ('Argentina')
insert into Nacionalidades (nacionalidad) values ('España')
insert into Nacionalidades (nacionalidad) values ('Estados Unidos')
insert into Nacionalidades (nacionalidad) values ('Corea del Sur')
insert into Nacionalidades (nacionalidad) values ('Reino Unido')
insert into Nacionalidades (nacionalidad) values ('Francia')
insert into Nacionalidades (nacionalidad) values ('Canadá')
insert into Nacionalidades (nacionalidad) values ('Australia')
insert into Nacionalidades (nacionalidad) values ('Puerto Rico')
insert into Nacionalidades (nacionalidad) values ('Alemania')
insert into Nacionalidades (nacionalidad) values ('México')



--PELICULAS--
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('The God Father', 'El envejecido patriarca de una dinastía del crimen organizado transfiere el control de su imperio clandestino a su reacio hijo',5,175,'20/09/1972',1,4,5,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Sueño de Libertad', 'El banquero Andy Dufresne es arrestado por matar a su esposa y amante. Tras una dura adaptación, intenta mejorar las condiciones de la prisión y dar esperanza a sus compañeros',4,142,'23/04/1995',2,3,5,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Matrix', 'Un pirata informático aprende de misteriosos rebeldes cuál es la verdadera naturaleza de la realidad y cuál es su papel en la guerra contra los que le controlan',6,136,'10/06/1999',1,2,4,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Fight Club', 'Un oficinista insomne y un desentendido fabricante de jabones forman un club de lucha clandestino que se convierte en mucho más',4,139,'04/11/1999',1,4,5,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Wall-e', 'En un futuro lejano, un pequeño robot limpiador se embarca en una odisea espacial que decidirá el futuro de la humanidad',1,98,'09/07/2008',2,1,4,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('The Dark Night', 'La amenaza conocida como el Joker emerge de su misterioso pasado y desata el caos en Gotham. The Caballero Oscuro debe aceptar los retos físicos y psicológicos para luchar por la justicia',6,152,'17/07/2008',1,2,5,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Up - Una aventura de altura', 'Carl Fredricksen, de 78 años, viaja a las cataratas Paraíso en su casa equipada con globos, sin darse cuenta de que lleva a un polizón',1,96,'11/06/2009',2,1,4,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Inception', 'Un ladrón que roba secretos corporativos mediante el uso de tecnología para compartir sueños tiene la tarea inversa de plantar una idea en la mente de un director corporativo',2,148,'29/07/2010',1,2,5,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Interstellar', 'Un equipo de exploradores viaja a través de un agujero de gusano en el espacio en un intento de garantizar la supervivencia de la humanidad',7,169,'06/11/2014',1,2,4,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Contratiempo', 'Mientras el tiempo vuela, con la ayuda de un experto en preparación de testigos, un empresario de éxito acusado de asesinato tiene menos de tres horas para presentar una defensa inexpugnable',2,106,'23/02/2017',2,2,3,2)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Coco', 'El aspirante a músico Miguel le planta cara a la prohibición generacional de su familia a la música, y se adentra en la Tierra de los Muertos para encontrar a su tátara-tátara-abuelo, un legendario cantante',1,105,'11/01/2018',2,1,4,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Avengers: Infinity War', 'Los Vengadores y sus aliados estarán dispuestos a sacrificarlo todo para derrotar al poderoso Thanos antes de que su devastación y ruina ponga fin al universo',6,149,'26/04/2018',1,2,4,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('El cuento de las comadrejas', 'Un grupo de viejas glorias del cine se dispone a proteger su hogar y su legado ante la llegada de dos jóvenes',3,129,'16/05/2019',2,2,3,1)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Toy Story 4', 'Un nuevo juguete llamado Forky se une a Woody y el resto en una emocionante aventura por carretera en la que descubrirán lo grande que puede ser el mundo para un juguete',1,100,'20/06/2019',2,1,4,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values ('Joker', 'En Gotham, Arthur Fleck, un comediante con problemas de salud mental, es marginado y maltratado por la sociedad. Se adentra en una espiral de crimen que resulta revolucionaria. Pronto conoce a su alter-ego, el Joker',4,122,'03/10/2019',1,3,4,3)
insert into Peliculas (titulo, descripcion, id_genero, duracion, fecha_estreno, id_idioma, id_clasificacion, id_calificacion, id_nac) 
				values('Parasite', 'La familia Ki-taek, todos desempleados, se ve envuelta en un incidente con la rica y glamurosa familia Parks', 4, 132, '23/01/2020', 1, 2, 4, 4)


--DIRECTORES--
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values  ( 'Boon', 'Joon Ho', '14/09/69', 4)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values     ('Christopher', 'Nolan', '30/07/70',5)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values     ('David', 'Fincher', '28/08/62', 3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values  ('Lana', 'Wachowski','21/06/65', 3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values     ('Lilly', 'Wachowski', '29/12/69',3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values  ('Frank', 'Darabont', '28/06/59',6)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values  ('Francis','Ford Coppola', '07/04/39',3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values     ('Todd', 'Phillips', '20/12/70', 3)        
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values     ('Anthony', 'Russo', '03/02/70',3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values     ('Joe', 'russo', '08/07/71', 3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values     ('Andrew', 'Stanton', '03/12/65', 3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values  ('Pete', 'Docter', '09/10/68', 3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values  ('Bob', 'Peterson', '09/01/61',3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values  ( 'Lee', 'Unkrich', '08/08/67', 3 )
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values   ('Adrian', 'Molina', '23/08/85', 3)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values   ('Oriol', 'Paulo', '01/01/75', 2)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values   ('Juan Jose', 'Campanella', '19/07/59',1)
insert into Directores(nom_dir, ape_dir, fec_nac, id_nac)values  ('Josh', 'Cooley', '23/05/80', 3)


--PELICULAS_DIRECTORES--
insert into Peliculas_Directores(id_pelicula, id_director) values (16,1)
insert into Peliculas_Directores(id_pelicula, id_director) values (15,8)
insert into Peliculas_Directores(id_pelicula, id_director) values (14,18)
insert into Peliculas_Directores(id_pelicula, id_director) values (13,17)
insert into Peliculas_Directores(id_pelicula, id_director) values (12,9)
insert into Peliculas_Directores(id_pelicula, id_director) values (12,10)
insert into Peliculas_Directores(id_pelicula, id_director) values (11,14)
insert into Peliculas_Directores(id_pelicula, id_director) values (11,15)
insert into Peliculas_Directores(id_pelicula, id_director) values (10,16)
insert into Peliculas_Directores(id_pelicula, id_director) values (9,2)
insert into Peliculas_Directores(id_pelicula, id_director) values (8,2)
insert into Peliculas_Directores(id_pelicula, id_director) values (7,12)
insert into Peliculas_Directores(id_pelicula, id_director) values (7,13)
insert into Peliculas_Directores(id_pelicula, id_director) values (6,2)
insert into Peliculas_Directores(id_pelicula, id_director) values (5,11)
insert into Peliculas_Directores(id_pelicula, id_director) values (4,3)
insert into Peliculas_Directores(id_pelicula, id_director) values (3,4)
insert into Peliculas_Directores(id_pelicula, id_director) values (3,5)
insert into Peliculas_Directores(id_pelicula, id_director) values (2,6)
insert into Peliculas_Directores(id_pelicula, id_director) values (1,7)


--ACTORES--
--Parasitos
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Kang-ho', 'Song', '17/01/1967', 4)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Sun-kyun', 'Lee', '02/03/1975',4)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Yeo-jeong', 'Cho', '10/02/1981', 4)
--Interestelar
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Matthew David', 'McConaughey', '04/11/1969', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Anne Jacqueline', 'Hathaway', '12/11/1982', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Jessica Michelle', 'Chastain', '24/03/1977', 3)
--El Origen
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Leonardo', 'DiCaprio', '11/11/1974', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Joseph Leonard', 'Gordon-Levitt', '17/02/1981', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Ellen Grace', 'Philpotts-Page', '21/02/1987', 7)
--El club de la pelea
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Brad', 'Pitt', '18/12/1963', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Edward', 'Norton', '18/08/1969', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Meat', 'Loaf', '27/09/1947', 3)
--Matrix
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Keanu', 'Reeves', '02/09/1964', 7)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Laurence', 'Fishburne', '30/07/1961', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Carrie-Anne', 'Moss', '21/08/1967', 7)
--Sueño de Libertad
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Tim', 'Robbins', '16/10/1958', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Morgan', 'Freeman', '01/06/1937', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Bob', 'Gunton', '15/11/1945', 3)
--El padrino
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Marlon', 'Brando', '03/04/1924', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Alfredo James "Al"', 'Pacino', '25/04/1940', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('James', 'Caan', '26/03/1940', 3)
--Batman, el caballero de la noche
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Christian', 'Bale', '30/01/1974', 5) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Heath', 'Ledger', '04/04/1979', 8) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Aaron', 'Eckhart', '12/03/1968', 3)
--Guason
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Joaquin', 'Phoenix', '28/10/1974', 9) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Robert', 'De Niro', '17/08/1943', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Zazie', 'Beets', '25/05/1991', 10)
--Avengers: Infinity War
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Robert', 'Downey Jr.', '04/04/1965', 3) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Chris', 'Hemsworth', '11/08/1983', 8) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Mark', 'Ruffalo', '22/11/1967', 3)
--Wall.e
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Ben', 'Burtt', '12/07/1948', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Elisa', 'Knight', '15/04/1975', 3) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Jeff', 'Garlin', '05/06/1962', 3)
--Up - Una aventura de altura
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Edward', 'Asner', '15/11/1929', 3) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Jordan', 'Nagai', '05/02/2000', 3) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('John', 'Ratzenberger', '06/04/1947', 3)
--Coco
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Anthony', 'Gonzalez', '23/09/2004', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Gael', 'Garcia Bernal', '30/11/1978', 11) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Benjamin', 'Bratt', '16/12/1963', 3)
-- Contratiempo
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Mario', 'Casas', '12/06/1986', 2) 
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Ana', 'Wagener', '01/01/1962', 2)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Jose', 'Coronado', '14/08/1957', 2)
--El cuento de las comadrejas
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Graciela', 'Borges', '10/06/1941', 1)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Oscar', 'Martínez', '23/10/1949', 1)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Luis', 'Brandoni', '18/04/1940', 1)
--Toy Story 4
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Tom', 'Hanks', '09/07/1956', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Tim', 'Allen', '13/06/1953', 3)
Insert into Actores (nombre, apellido, fec_nac, id_nac) values ('Annie', 'Pots', '28/10/1952', 3)


--PELÍCULAS_ACTORES--
--1 El Padrino
Insert into Peliculas_Actores (id_pelicula, id_actor) values (1, 19)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (1, 20)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (1, 21)
--2 Sueño de libertad
Insert into Peliculas_Actores (id_pelicula, id_actor) values (2, 16)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (2, 17)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (2, 18)
--3 Matrix
Insert into Peliculas_Actores (id_pelicula, id_actor) values (3, 13)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (3, 14)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (3, 15)
--4 El club de la pelea
Insert into Peliculas_Actores (id_pelicula, id_actor) values (4,10)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (4, 11)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (4, 12)
--5 Wall-e
Insert into Peliculas_Actores (id_pelicula, id_actor) values (5, 31)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (5, 32)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (5, 33)
--6    The Dark Night (batmaan)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (6, 22)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (6, 23)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (6, 24)
--7    Up - Una aventura de altura
Insert into Peliculas_Actores (id_pelicula, id_actor) values (7, 34)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (7, 35)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (7, 36)
--8    Inception
Insert into Peliculas_Actores (id_pelicula, id_actor) values (8, 7)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (8, 8)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (8, 9)
--9    Interstellar
Insert into Peliculas_Actores (id_pelicula, id_actor) values (9, 4) 
Insert into Peliculas_Actores (id_pelicula, id_actor) values (9, 5)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (9, 6)
--10    Contratiempo
Insert into Peliculas_Actores (id_pelicula, id_actor) values (10, 40)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (10, 41)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (10, 42)
--11    Coco
Insert into Peliculas_Actores (id_pelicula, id_actor) values (11, 37)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (11, 38)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (11, 39)
--12    Avengers: Infinity War
Insert into Peliculas_Actores (id_pelicula, id_actor) values (12, 28)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (12, 29)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (12, 30)
--13    El cuento de las comadrejas
Insert into Peliculas_Actores (id_pelicula, id_actor) values (13, 43)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (13, 44)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (13, 45)
--14    Toy Story 4
Insert into Peliculas_Actores (id_pelicula, id_actor) values (14, 46)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (14, 47)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (14, 48)
--15    Joker
Insert into Peliculas_Actores (id_pelicula, id_actor) values (15, 25)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (15, 26)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (15, 27)
--16    Parasite
Insert into Peliculas_Actores (id_pelicula, id_actor) values (16, 1)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (16, 2)
Insert into Peliculas_Actores (id_pelicula, id_actor) values (16, 3)


--FUNCIONES--





--BUTACAS--
--BUTACAS
Insert into Butacas (id_sala, nro_butaca) values (1, 1)
Insert into Butacas (id_sala, nro_butaca) values (1, 2)
Insert into Butacas (id_sala, nro_butaca) values (1, 3)
Insert into Butacas (id_sala, nro_butaca) values (1, 4)
Insert into Butacas (id_sala, nro_butaca) values (1, 5)
Insert into Butacas (id_sala, nro_butaca) values (1, 6)
Insert into Butacas (id_sala, nro_butaca) values (1, 7)
Insert into Butacas (id_sala, nro_butaca) values (1, 8)
Insert into Butacas (id_sala, nro_butaca) values (1, 9)
Insert into Butacas (id_sala, nro_butaca) values (1, 10)
Insert into Butacas (id_sala, nro_butaca) values (1, 11)
Insert into Butacas (id_sala, nro_butaca) values (1, 12)
Insert into Butacas (id_sala, nro_butaca) values (1, 13)
Insert into Butacas (id_sala, nro_butaca) values (1, 14)
Insert into Butacas (id_sala, nro_butaca) values (1, 15)
Insert into Butacas (id_sala, nro_butaca) values (1, 16)
Insert into Butacas (id_sala, nro_butaca) values (1, 17)
Insert into Butacas (id_sala, nro_butaca) values (1, 18)
Insert into Butacas (id_sala, nro_butaca) values (1, 19)
Insert into Butacas (id_sala, nro_butaca) values (1, 20)
Insert into Butacas (id_sala, nro_butaca) values (1, 21)
Insert into Butacas (id_sala, nro_butaca) values (1, 22)
Insert into Butacas (id_sala, nro_butaca) values (1, 23)
Insert into Butacas (id_sala, nro_butaca) values (1, 24)
Insert into Butacas (id_sala, nro_butaca) values (1, 25)
Insert into Butacas (id_sala, nro_butaca) values (1, 26)
Insert into Butacas (id_sala, nro_butaca) values (1, 27)
Insert into Butacas (id_sala, nro_butaca) values (1, 28)
Insert into Butacas (id_sala, nro_butaca) values (1, 29)
Insert into Butacas (id_sala, nro_butaca) values (1, 30)
--Sala 2 
Insert into Butacas (id_sala, nro_butaca) values (2, 1)
Insert into Butacas (id_sala, nro_butaca) values (2, 2)
Insert into Butacas (id_sala, nro_butaca) values (2, 3)
Insert into Butacas (id_sala, nro_butaca) values (2, 4)
Insert into Butacas (id_sala, nro_butaca) values (2, 5)
Insert into Butacas (id_sala, nro_butaca) values (2, 6)
Insert into Butacas (id_sala, nro_butaca) values (2, 7)
Insert into Butacas (id_sala, nro_butaca) values (2, 8)
Insert into Butacas (id_sala, nro_butaca) values (2, 9)
Insert into Butacas (id_sala, nro_butaca) values (2, 10)
Insert into Butacas (id_sala, nro_butaca) values (2, 11)
Insert into Butacas (id_sala, nro_butaca) values (2, 12)
Insert into Butacas (id_sala, nro_butaca) values (2, 13)
Insert into Butacas (id_sala, nro_butaca) values (2, 14)
Insert into Butacas (id_sala, nro_butaca) values (2, 15)
Insert into Butacas (id_sala, nro_butaca) values (2, 16)
Insert into Butacas (id_sala, nro_butaca) values (2, 17)
Insert into Butacas (id_sala, nro_butaca) values (2, 18)
Insert into Butacas (id_sala, nro_butaca) values (2, 19)
Insert into Butacas (id_sala, nro_butaca) values (2, 20)
Insert into Butacas (id_sala, nro_butaca) values (2, 21)
Insert into Butacas (id_sala, nro_butaca) values (2, 22)
Insert into Butacas (id_sala, nro_butaca) values (2, 23)
Insert into Butacas (id_sala, nro_butaca) values (2, 24)
Insert into Butacas (id_sala, nro_butaca) values (2, 25)
Insert into Butacas (id_sala, nro_butaca) values (2, 26)
Insert into Butacas (id_sala, nro_butaca) values (2, 27)
Insert into Butacas (id_sala, nro_butaca) values (2, 28)
Insert into Butacas (id_sala, nro_butaca) values (2, 29)
Insert into Butacas (id_sala, nro_butaca) values (2, 30)
--Sala 3
Insert into Butacas (id_sala, nro_butaca) values (3, 1)
Insert into Butacas (id_sala, nro_butaca) values (3, 2)
Insert into Butacas (id_sala, nro_butaca) values (3, 3)
Insert into Butacas (id_sala, nro_butaca) values (3, 4)
Insert into Butacas (id_sala, nro_butaca) values (3, 5)
Insert into Butacas (id_sala, nro_butaca) values (3, 6)
Insert into Butacas (id_sala, nro_butaca) values (3, 7)
Insert into Butacas (id_sala, nro_butaca) values (3, 8)
Insert into Butacas (id_sala, nro_butaca) values (3, 9)
Insert into Butacas (id_sala, nro_butaca) values (3, 10)
Insert into Butacas (id_sala, nro_butaca) values (3, 11)
Insert into Butacas (id_sala, nro_butaca) values (3, 12)
Insert into Butacas (id_sala, nro_butaca) values (3, 13)
Insert into Butacas (id_sala, nro_butaca) values (3, 14)
Insert into Butacas (id_sala, nro_butaca) values (3, 15)
Insert into Butacas (id_sala, nro_butaca) values (3, 16)
Insert into Butacas (id_sala, nro_butaca) values (3, 17)
Insert into Butacas (id_sala, nro_butaca) values (3, 18)
Insert into Butacas (id_sala, nro_butaca) values (3, 19)
Insert into Butacas (id_sala, nro_butaca) values (3, 20)
Insert into Butacas (id_sala, nro_butaca) values (3, 21)
Insert into Butacas (id_sala, nro_butaca) values (3, 22)
Insert into Butacas (id_sala, nro_butaca) values (3, 23)
Insert into Butacas (id_sala, nro_butaca) values (3, 24)
Insert into Butacas (id_sala, nro_butaca) values (3, 25)
Insert into Butacas (id_sala, nro_butaca) values (3, 26)
Insert into Butacas (id_sala, nro_butaca) values (3, 27)
Insert into Butacas (id_sala, nro_butaca) values (3, 28)
Insert into Butacas (id_sala, nro_butaca) values (3, 29)
Insert into Butacas (id_sala, nro_butaca) values (3, 30)
--Sala 4
Insert into Butacas (id_sala, nro_butaca) values (4, 1)
Insert into Butacas (id_sala, nro_butaca) values (4, 2)
Insert into Butacas (id_sala, nro_butaca) values (4, 3)
Insert into Butacas (id_sala, nro_butaca) values (4, 4)
Insert into Butacas (id_sala, nro_butaca) values (4, 5)
Insert into Butacas (id_sala, nro_butaca) values (4, 6)
Insert into Butacas (id_sala, nro_butaca) values (4, 7)
Insert into Butacas (id_sala, nro_butaca) values (4, 8)
Insert into Butacas (id_sala, nro_butaca) values (4, 9)
Insert into Butacas (id_sala, nro_butaca) values (4, 10)
Insert into Butacas (id_sala, nro_butaca) values (4, 11)
Insert into Butacas (id_sala, nro_butaca) values (4, 12)
Insert into Butacas (id_sala, nro_butaca) values (4, 13)
Insert into Butacas (id_sala, nro_butaca) values (4, 14)
Insert into Butacas (id_sala, nro_butaca) values (4, 15)
Insert into Butacas (id_sala, nro_butaca) values (4, 16)
Insert into Butacas (id_sala, nro_butaca) values (4, 17)
Insert into Butacas (id_sala, nro_butaca) values (4, 18)
Insert into Butacas (id_sala, nro_butaca) values (4, 19)
Insert into Butacas (id_sala, nro_butaca) values (4, 20)
Insert into Butacas (id_sala, nro_butaca) values (4, 21)
Insert into Butacas (id_sala, nro_butaca) values (4, 22)
Insert into Butacas (id_sala, nro_butaca) values (4, 23)
Insert into Butacas (id_sala, nro_butaca) values (4, 24)
Insert into Butacas (id_sala, nro_butaca) values (4, 25)
Insert into Butacas (id_sala, nro_butaca) values (4, 26)
Insert into Butacas (id_sala, nro_butaca) values (4, 27)
Insert into Butacas (id_sala, nro_butaca) values (4, 28)
Insert into Butacas (id_sala, nro_butaca) values (4, 29)
Insert into Butacas (id_sala, nro_butaca) values (4, 30)
--Sala 5
Insert into Butacas (id_sala, nro_butaca) values (5, 1)
Insert into Butacas (id_sala, nro_butaca) values (5, 2)
Insert into Butacas (id_sala, nro_butaca) values (5, 3)
Insert into Butacas (id_sala, nro_butaca) values (5, 4)
Insert into Butacas (id_sala, nro_butaca) values (5, 5)
Insert into Butacas (id_sala, nro_butaca) values (5, 6)
Insert into Butacas (id_sala, nro_butaca) values (5, 7)
Insert into Butacas (id_sala, nro_butaca) values (5, 8)
Insert into Butacas (id_sala, nro_butaca) values (5, 9)
Insert into Butacas (id_sala, nro_butaca) values (5, 10)
Insert into Butacas (id_sala, nro_butaca) values (5, 11)
Insert into Butacas (id_sala, nro_butaca) values (5, 12)
Insert into Butacas (id_sala, nro_butaca) values (5, 13)
Insert into Butacas (id_sala, nro_butaca) values (5, 14)
Insert into Butacas (id_sala, nro_butaca) values (5, 15)
Insert into Butacas (id_sala, nro_butaca) values (5, 16)
Insert into Butacas (id_sala, nro_butaca) values (5, 17)
Insert into Butacas (id_sala, nro_butaca) values (5, 18)
Insert into Butacas (id_sala, nro_butaca) values (5, 19)
Insert into Butacas (id_sala, nro_butaca) values (5, 20)
Insert into Butacas (id_sala, nro_butaca) values (5, 21)
Insert into Butacas (id_sala, nro_butaca) values (5, 22)
Insert into Butacas (id_sala, nro_butaca) values (5, 23)
Insert into Butacas (id_sala, nro_butaca) values (5, 24)
Insert into Butacas (id_sala, nro_butaca) values (5, 25)
Insert into Butacas (id_sala, nro_butaca) values (5, 26)
Insert into Butacas (id_sala, nro_butaca) values (5, 27)
Insert into Butacas (id_sala, nro_butaca) values (5, 28)
Insert into Butacas (id_sala, nro_butaca) values (5, 29)
Insert into Butacas (id_sala, nro_butaca) values (5, 30)
--Sala 6
Insert into Butacas (id_sala, nro_butaca) values (6, 1)
Insert into Butacas (id_sala, nro_butaca) values (6, 2)
Insert into Butacas (id_sala, nro_butaca) values (6, 3)
Insert into Butacas (id_sala, nro_butaca) values (6, 4)
Insert into Butacas (id_sala, nro_butaca) values (6, 5)
Insert into Butacas (id_sala, nro_butaca) values (6, 6)
Insert into Butacas (id_sala, nro_butaca) values (6, 7)
Insert into Butacas (id_sala, nro_butaca) values (6, 8)
Insert into Butacas (id_sala, nro_butaca) values (6, 9)
Insert into Butacas (id_sala, nro_butaca) values (6, 10)
Insert into Butacas (id_sala, nro_butaca) values (6, 11)
Insert into Butacas (id_sala, nro_butaca) values (6, 12)
Insert into Butacas (id_sala, nro_butaca) values (6, 13)
Insert into Butacas (id_sala, nro_butaca) values (6, 14)
Insert into Butacas (id_sala, nro_butaca) values (6, 15)
Insert into Butacas (id_sala, nro_butaca) values (6, 16)
Insert into Butacas (id_sala, nro_butaca) values (6, 17)
Insert into Butacas (id_sala, nro_butaca) values (6, 18)
Insert into Butacas (id_sala, nro_butaca) values (6, 19)
Insert into Butacas (id_sala, nro_butaca) values (6, 20)
Insert into Butacas (id_sala, nro_butaca) values (6, 21)
Insert into Butacas (id_sala, nro_butaca) values (6, 22)
Insert into Butacas (id_sala, nro_butaca) values (6, 23)
Insert into Butacas (id_sala, nro_butaca) values (6, 24)
Insert into Butacas (id_sala, nro_butaca) values (6, 25)
Insert into Butacas (id_sala, nro_butaca) values (6, 26)
Insert into Butacas (id_sala, nro_butaca) values (6, 27)
Insert into Butacas (id_sala, nro_butaca) values (6, 28)
Insert into Butacas (id_sala, nro_butaca) values (6, 29)
Insert into Butacas (id_sala, nro_butaca) values (6, 30)
--Sala 7
Insert into Butacas (id_sala, nro_butaca) values (7, 1)
Insert into Butacas (id_sala, nro_butaca) values (7, 2)
Insert into Butacas (id_sala, nro_butaca) values (7, 3)
Insert into Butacas (id_sala, nro_butaca) values (7, 4)
Insert into Butacas (id_sala, nro_butaca) values (7, 5)
Insert into Butacas (id_sala, nro_butaca) values (7, 6)
Insert into Butacas (id_sala, nro_butaca) values (7, 7)
Insert into Butacas (id_sala, nro_butaca) values (7, 8)
Insert into Butacas (id_sala, nro_butaca) values (7, 9)
Insert into Butacas (id_sala, nro_butaca) values (7, 10)
Insert into Butacas (id_sala, nro_butaca) values (7, 11)
Insert into Butacas (id_sala, nro_butaca) values (7, 12)
Insert into Butacas (id_sala, nro_butaca) values (7, 13)
Insert into Butacas (id_sala, nro_butaca) values (7, 14)
Insert into Butacas (id_sala, nro_butaca) values (7, 15)
Insert into Butacas (id_sala, nro_butaca) values (7, 16)
Insert into Butacas (id_sala, nro_butaca) values (7, 17)
Insert into Butacas (id_sala, nro_butaca) values (7, 18)
Insert into Butacas (id_sala, nro_butaca) values (7, 19)
Insert into Butacas (id_sala, nro_butaca) values (7, 20)
Insert into Butacas (id_sala, nro_butaca) values (7, 21)
Insert into Butacas (id_sala, nro_butaca) values (7, 22)
Insert into Butacas (id_sala, nro_butaca) values (7, 23)
Insert into Butacas (id_sala, nro_butaca) values (7, 24)
Insert into Butacas (id_sala, nro_butaca) values (7, 25)
Insert into Butacas (id_sala, nro_butaca) values (7, 26)
Insert into Butacas (id_sala, nro_butaca) values (7, 27)
Insert into Butacas (id_sala, nro_butaca) values (7, 28)
Insert into Butacas (id_sala, nro_butaca) values (7, 29)
Insert into Butacas (id_sala, nro_butaca) values (7, 30)
--Sala 8
Insert into Butacas (id_sala, nro_butaca) values (8, 1)
Insert into Butacas (id_sala, nro_butaca) values (8, 2)
Insert into Butacas (id_sala, nro_butaca) values (8, 3)
Insert into Butacas (id_sala, nro_butaca) values (8, 4)
Insert into Butacas (id_sala, nro_butaca) values (8, 5)
Insert into Butacas (id_sala, nro_butaca) values (8, 6)
Insert into Butacas (id_sala, nro_butaca) values (8, 7)
Insert into Butacas (id_sala, nro_butaca) values (8, 8)
Insert into Butacas (id_sala, nro_butaca) values (8, 9)
Insert into Butacas (id_sala, nro_butaca) values (8, 10)
Insert into Butacas (id_sala, nro_butaca) values (8, 11)
Insert into Butacas (id_sala, nro_butaca) values (8, 12)
Insert into Butacas (id_sala, nro_butaca) values (8, 13)
Insert into Butacas (id_sala, nro_butaca) values (8, 14)
Insert into Butacas (id_sala, nro_butaca) values (8, 15)
Insert into Butacas (id_sala, nro_butaca) values (8, 16)
Insert into Butacas (id_sala, nro_butaca) values (8, 17)
Insert into Butacas (id_sala, nro_butaca) values (8, 18)
Insert into Butacas (id_sala, nro_butaca) values (8, 19)
Insert into Butacas (id_sala, nro_butaca) values (8, 20)
Insert into Butacas (id_sala, nro_butaca) values (8, 21)
Insert into Butacas (id_sala, nro_butaca) values (8, 22)
Insert into Butacas (id_sala, nro_butaca) values (8, 23)
Insert into Butacas (id_sala, nro_butaca) values (8, 24)
Insert into Butacas (id_sala, nro_butaca) values (8, 25)
Insert into Butacas (id_sala, nro_butaca) values (8, 26)
Insert into Butacas (id_sala, nro_butaca) values (8, 27)
Insert into Butacas (id_sala, nro_butaca) values (8, 28)
Insert into Butacas (id_sala, nro_butaca) values (8, 29)
Insert into Butacas (id_sala, nro_butaca) values (8, 30)
--Sala 9
Insert into Butacas (id_sala, nro_butaca) values (9, 1)
Insert into Butacas (id_sala, nro_butaca) values (9, 2)
Insert into Butacas (id_sala, nro_butaca) values (9, 3)
Insert into Butacas (id_sala, nro_butaca) values (9, 4)
Insert into Butacas (id_sala, nro_butaca) values (9, 5)
Insert into Butacas (id_sala, nro_butaca) values (9, 6)
Insert into Butacas (id_sala, nro_butaca) values (9, 7)
Insert into Butacas (id_sala, nro_butaca) values (9, 8)
Insert into Butacas (id_sala, nro_butaca) values (9, 9)
Insert into Butacas (id_sala, nro_butaca) values (9, 10)
Insert into Butacas (id_sala, nro_butaca) values (9, 11)
Insert into Butacas (id_sala, nro_butaca) values (9, 12)
Insert into Butacas (id_sala, nro_butaca) values (9, 13)
Insert into Butacas (id_sala, nro_butaca) values (9, 14)
Insert into Butacas (id_sala, nro_butaca) values (9, 15)
Insert into Butacas (id_sala, nro_butaca) values (9, 16)
Insert into Butacas (id_sala, nro_butaca) values (9, 17)
Insert into Butacas (id_sala, nro_butaca) values (9, 18)
Insert into Butacas (id_sala, nro_butaca) values (9, 19)
Insert into Butacas (id_sala, nro_butaca) values (9, 20)
Insert into Butacas (id_sala, nro_butaca) values (9, 21)
Insert into Butacas (id_sala, nro_butaca) values (9, 22)
Insert into Butacas (id_sala, nro_butaca) values (9, 23)
Insert into Butacas (id_sala, nro_butaca) values (9, 24)
Insert into Butacas (id_sala, nro_butaca) values (9, 25)
Insert into Butacas (id_sala, nro_butaca) values (9, 26)
Insert into Butacas (id_sala, nro_butaca) values (9, 27)
Insert into Butacas (id_sala, nro_butaca) values (9, 28)
Insert into Butacas (id_sala, nro_butaca) values (9, 29)
Insert into Butacas (id_sala, nro_butaca) values (9, 30)
--Sala 10
Insert into Butacas (id_sala, nro_butaca) values (10, 1)
Insert into Butacas (id_sala, nro_butaca) values (10, 2)
Insert into Butacas (id_sala, nro_butaca) values (10, 3)
Insert into Butacas (id_sala, nro_butaca) values (10, 4)
Insert into Butacas (id_sala, nro_butaca) values (10, 5)
Insert into Butacas (id_sala, nro_butaca) values (10, 6)
Insert into Butacas (id_sala, nro_butaca) values (10, 7)
Insert into Butacas (id_sala, nro_butaca) values (10, 8)
Insert into Butacas (id_sala, nro_butaca) values (10, 9)
Insert into Butacas (id_sala, nro_butaca) values (10, 10)
Insert into Butacas (id_sala, nro_butaca) values (10, 11)
Insert into Butacas (id_sala, nro_butaca) values (10, 12)
Insert into Butacas (id_sala, nro_butaca) values (10, 13)
Insert into Butacas (id_sala, nro_butaca) values (10, 14)
Insert into Butacas (id_sala, nro_butaca) values (10, 15)
Insert into Butacas (id_sala, nro_butaca) values (10, 16)
Insert into Butacas (id_sala, nro_butaca) values (10, 17)
Insert into Butacas (id_sala, nro_butaca) values (10, 18)
Insert into Butacas (id_sala, nro_butaca) values (10, 19)
Insert into Butacas (id_sala, nro_butaca) values (10, 20)
--Sala 11
Insert into Butacas (id_sala, nro_butaca) values (11, 1)
Insert into Butacas (id_sala, nro_butaca) values (11, 2)
Insert into Butacas (id_sala, nro_butaca) values (11, 3)
Insert into Butacas (id_sala, nro_butaca) values (11, 4)
Insert into Butacas (id_sala, nro_butaca) values (11, 5)
Insert into Butacas (id_sala, nro_butaca) values (11, 6)
Insert into Butacas (id_sala, nro_butaca) values (11, 7)
Insert into Butacas (id_sala, nro_butaca) values (11, 8)
Insert into Butacas (id_sala, nro_butaca) values (11, 9)
Insert into Butacas (id_sala, nro_butaca) values (11, 10)
Insert into Butacas (id_sala, nro_butaca) values (11, 11)
Insert into Butacas (id_sala, nro_butaca) values (11, 12)
Insert into Butacas (id_sala, nro_butaca) values (11, 13)
Insert into Butacas (id_sala, nro_butaca) values (11, 14)
Insert into Butacas (id_sala, nro_butaca) values (11, 15)
Insert into Butacas (id_sala, nro_butaca) values (11, 16)
Insert into Butacas (id_sala, nro_butaca) values (11, 17)
Insert into Butacas (id_sala, nro_butaca) values (11, 18)
Insert into Butacas (id_sala, nro_butaca) values (11, 19)
Insert into Butacas (id_sala, nro_butaca) values (11, 20)


--FUNCIONES

insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/02/1980', '10:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/02/1980', '12:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/02/1980', '14:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/02/1980', '16:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/02/1980', '18:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/02/1980', '20:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/02/1980', '22:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/02/1980', '10:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/02/1980', '12:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/02/1980', '14:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/02/1980', '16:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/02/1980', '18:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/02/1980', '20:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/02/1980', '22:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/02/1980', '10:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/02/1980', '12:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/02/1980', '14:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/02/1980', '16:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/02/1980', '18:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/02/1980', '20:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/02/1980', '22:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/02/1980', '10:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/02/1980', '12:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/02/1980', '14:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/02/1980', '16:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/02/1980', '18:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/02/1980', '20:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/02/1980', '22:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/02/1980', '10:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/02/1980', '12:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/02/1980', '14:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/02/1980', '16:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/02/1980', '18:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/02/1980', '20:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/02/1980', '22:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/02/1980', '10:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/02/1980', '12:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/02/1980', '14:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/02/1980', '16:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/02/1980', '18:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/02/1980', '20:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/02/1980', '22:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/02/1980', '10:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/02/1980', '12:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/02/1980', '14:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/02/1980', '16:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/02/1980', '18:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/02/1980', '20:00:00',1)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/02/1980', '22:00:00',1)

insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/04/1995', '10:00:00',2 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/04/1995', '12:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/04/1995', '14:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/04/1995', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/04/1995', '18:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/04/1995', '20:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/04/1995', '22:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/04/1995', '10:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/04/1995', '12:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/04/1995', '14:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/04/1995', '16:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/04/1995', '18:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/04/1995', '20:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/04/1995', '22:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/04/1995', '10:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/04/1995', '12:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/04/1995', '14:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/04/1995', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/04/1995', '18:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/04/1995', '20:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/04/1995', '22:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/1995', '10:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/1995', '12:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/1995', '14:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/1995', '16:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/1995', '18:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/1995', '20:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/1995', '22:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/1995', '10:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/1995', '12:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/1995', '14:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/1995', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/1995', '18:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/1995', '20:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/1995', '22:00:00',2  )

insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/06/1999', '10:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/06/1999', '12:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/06/1999', '14:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/06/1999', '16:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/06/1999', '18:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/06/1999', '20:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/06/1999', '22:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/1999', '10:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/1999', '12:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/1999', '14:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/1999', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/1999', '18:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/1999', '20:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/1999', '22:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/1999', '10:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/1999', '12:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/1999', '14:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/1999', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/1999', '18:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/1999', '20:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/1999', '22:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/1999', '10:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/1999', '12:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/1999', '14:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/1999', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/1999', '18:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/1999', '20:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/1999', '22:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/1999', '10:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/1999', '12:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/1999', '14:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/1999', '16:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/1999', '18:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/1999', '20:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/1999', '22:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/1999', '10:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/1999', '12:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/1999', '14:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/1999', '16:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/1999', '18:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/1999', '20:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/1999', '22:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/1999', '10:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/1999', '12:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/1999', '14:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/1999', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/1999', '18:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/1999', '20:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/1999', '22:00:00',3  )

insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/11/1999', '10:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/11/1999', '12:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/11/1999', '14:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/11/1999', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/11/1999', '18:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/11/1999', '20:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/11/1999', '22:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/11/1999', '10:00:00',1 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/11/1999', '12:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/11/1999', '14:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/11/1999', '16:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/11/1999', '18:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/11/1999', '20:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/11/1999', '22:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/1999', '10:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/1999', '12:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/1999', '14:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/1999', '16:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/1999', '18:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/1999', '20:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/1999', '22:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/1999', '10:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/1999', '12:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/1999', '14:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/1999', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/1999', '18:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/1999', '20:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/1999', '22:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/1999', '10:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/1999', '12:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/1999', '14:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/1999', '16:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/1999', '18:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/1999', '20:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/1999', '22:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/11/1999', '10:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/11/1999', '12:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/11/1999', '14:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/1999', '10:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/1999', '12:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/1999', '14:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/1999', '16:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/1999', '18:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/1999', '20:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/1999', '22:00:00',4  )


insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/07/2008', '10:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/07/2008', '12:00:00',2  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/07/2008', '14:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/07/2008', '16:00:00',1  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/07/2008', '18:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/07/2008', '20:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/07/2008', '22:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/07/2008', '10:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/07/2008', '12:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/07/2008', '14:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/07/2008', '16:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/07/2008', '18:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/07/2008', '20:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/07/2008', '22:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/07/2008', '10:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/07/2008', '12:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/07/2008', '14:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/07/2008', '10:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/07/2008', '12:00:00',4 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/07/2008', '14:00:00',5)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/07/2008', '16:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/07/2008', '18:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/07/2008', '20:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/07/2008', '22:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/07/2008', '10:00:00',3  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/07/2008', '12:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/07/2008', '14:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/07/2008', '16:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/07/2008', '18:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/07/2008', '20:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/07/2008', '22:00:00',5  )

insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/07/2008', '10:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/07/2008', '12:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/07/2008', '14:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/07/2008', '16:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('18/07/2008', '18:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('18/07/2008', '20:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('18/07/2008', '22:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('19/07/2008', '10:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('19/07/2008', '12:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('19/07/2008', '14:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/07/2008', '10:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/07/2008', '12:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/07/2008', '14:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/07/2008', '16:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/07/2008', '18:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/07/2008', '20:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/07/2008', '22:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/07/2008', '10:00:00',4  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/07/2008', '12:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/07/2008', '14:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/07/2008', '16:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/07/2008', '18:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/07/2008', '20:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/07/2008', '22:00:00',6  )

insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/2009', '10:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/2009', '12:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/2009', '14:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/06/2009', '16:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/2009', '18:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/2009', '20:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/06/2009', '22:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/2009', '10:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/2009', '12:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/06/2009', '14:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/2009', '10:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/2009', '12:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/2009', '14:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/06/2009', '16:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/2009', '18:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/2009', '20:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/06/2009', '22:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/2009', '10:00:00',5  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/2009', '12:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/2009', '14:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/06/2009', '16:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/06/2009', '18:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/06/2009', '20:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/06/2009', '22:00:00',7  )

insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/07/2010', '10:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/07/2010', '12:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/07/2010', '14:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/07/2010', '16:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('30/07/2010', '18:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('30/07/2010', '20:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('30/07/2010', '22:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('31/07/2010', '10:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('31/07/2010', '12:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('31/07/2010', '14:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/08/2010', '10:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/08/2010', '12:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/08/2010', '14:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/08/2010', '16:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('02/08/2010', '18:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('02/08/2010', '20:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('02/08/2010', '22:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('03/08/2010', '10:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('03/08/2010', '12:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('03/08/2010', '14:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('03/08/2010', '16:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/08/2010', '18:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/08/2010', '20:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/08/2010', '22:00:00',8  )

insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/2014', '10:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/2014', '12:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/2014', '14:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/11/2014', '16:00:00',6  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/2014', '18:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/2014', '20:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/11/2014', '22:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/2014', '10:00:00',9  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/2014', '12:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/11/2014', '14:00:00',9  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/11/2014', '10:00:00',9  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/11/2014', '12:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/11/2014', '14:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/11/2014', '16:00:00',9  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/2014', '18:00:00',9  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/2014', '20:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('10/11/2014', '22:00:00',9  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/11/2014', '10:00:00',9  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/11/2014', '12:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/11/2014', '14:00:00',8  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/11/2014', '16:00:00',9  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/1/2014', '18:00:00',9  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/11/2014', '20:00:00',7  )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/11/2014', '22:00:00',9  )


--Estreno Contratiempo
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/02/2017', '12:00:00', 8 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/02/2017', '14:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/02/2017', '16:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/02/2017', '18:00:00', 8 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/02/2017', '20:00:00', 9 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/02/2017', '22:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/02/2017', '10:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/02/2017', '12:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/02/2017', '14:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/02/2017', '16:00:00', 6 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/02/2017', '18:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/02/2017', '20:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/02/2017', '22:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/02/2017', '10:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/02/2017', '12:00:00', 9 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/02/2017', '14:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/02/2017', '16:00:00', 5 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/02/2017', '18:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/02/2017', '20:00:00', 6 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/02/2017', '22:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/03/2017', '10:00:00', 5 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/03/2017', '12:00:00', 6 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/03/2017', '14:00:00', 10 )
--Estreno Coco
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/01/2018', '10:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/01/2018', '12:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('11/01/2018', '14:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/01/2018', '16:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/01/2018', '18:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/01/2018', '20:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('12/01/2018', '22:00:00', 1 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/01/2018', '10:00:00', 5 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/01/2018', '12:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('13/01/2018', '14:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/01/2018', '16:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/01/2018', '18:00:00', 5 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/01/2018', '20:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('14/01/2018', '22:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/01/2018', '10:00:00', 5 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/01/2018', '12:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('15/01/2018', '14:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/01/2018', '16:00:00', 5 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/01/2018', '18:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/01/2018', '20:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/01/2018', '22:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/01/2018', '10:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/01/2018', '12:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/01/2018', '14:00:00', 1 )
--Avengers: Infinity War    2018-04-26
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/2018', '10:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/2018', '12:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/04/2018', '14:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/2018', '16:00:00', 9 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/2018', '18:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/2018', '20:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/04/2018', '22:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/04/2018', '10:00:00', 9 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/04/2018', '12:00:00', 6 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/04/2018', '14:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/04/2018', '16:00:00', 3 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/04/2018', '18:00:00', 6 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/04/2018', '20:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/04/2018', '22:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('30/04/2018', '10:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('30/04/2018', '12:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('30/04/2018', '14:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/05/2018', '16:00:00', 6 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/05/2018', '18:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/05/2018', '20:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('01/05/2018', '22:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('02/05/2018', '10:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('02/05/2018', '12:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('02/05/2018', '14:00:00', 11 )
--El cuento de las comadrejas    2019-05-16  
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/05/2019', '10:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/05/2019', '12:00:00', 8 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('16/05/2019', '14:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/05/2019', '16:00:00', 4 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/05/2019', '18:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/05/2019', '20:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('17/05/2019', '22:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('18/05/2019', '10:00:00', 1 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('18/05/2019', '12:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('18/05/2019', '14:00:00', 2 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('19/05/2019', '16:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('19/05/2019', '18:00:00', 2 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('19/05/2019', '20:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('19/05/2019', '22:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/05/2019', '10:00:00', 8 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/05/2019', '12:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/05/2019', '14:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/05/2019', '16:00:00', 1 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/05/2019', '18:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/05/2019', '20:00:00', 2 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/05/2019', '22:00:00', 13)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/05/2019', '10:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/05/2019', '12:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/05/2019', '14:00:00', 13 )




--2019

insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/06/2019', '10:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/06/2019', '12:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('20/06/2019', '14:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/06/2019', '16:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/06/2019', '18:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/06/2019', '20:00:00', 6 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('21/06/2019', '22:00:00', 8 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/06/2019', '10:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/06/2019', '12:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('22/06/2019', '14:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/06/2019', '16:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/06/2019', '18:00:00', 1 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/06/2019', '20:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/06/2019', '22:00:00', 2 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/06/2019', '10:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/06/2019', '12:00:00', 5 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/06/2019', '14:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/06/2019', '16:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/06/2019', '18:00:00', 4 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/06/2019', '20:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/06/2019', '22:00:00', 9 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/06/2019', '10:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/06/2019', '12:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/06/2019', '14:00:00', 14 )




insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('03/10/2019', '10:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('03/10/2019', '12:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('03/10/2019', '14:00:00', 15 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/10/2019', '16:00:00',  9)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/10/2019', '18:00:00', 15 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/10/2019', '20:00:00', 15 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('04/10/2019', '22:00:00', 6 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/10/2019', '10:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/10/2019', '12:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('05/10/2019', '14:00:00', 15 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/10/2019', '16:00:00', 15 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/10/2019', '18:00:00', 1 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/10/2019', '20:00:00', 15 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('06/10/2019', '22:00:00', 2 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/10/2019', '10:00:00', 5 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/10/2019', '12:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('07/10/2019', '14:00:00', 15 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/10/2019', '16:00:00', 4 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/10/2019', '18:00:00', 3 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/10/2019', '20:00:00', 15 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('08/10/2019', '22:00:00',  15)
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/10/2019', '10:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/10/2019', '12:00:00', 12 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('09/10/2019', '14:00:00', 15 )







insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/01/2020', '10:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/01/2020', '12:00:00', 15 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('23/01/2020', '14:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/01/2020', '16:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/01/2020', '18:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/01/2020', '20:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('24/01/2020', '22:00:00', 6 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/01/2020', '10:00:00', 7 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/01/2020', '12:00:00', 14 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('25/01/2020', '14:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/01/2020', '16:00:00', 3 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/01/2020', '18:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/01/2020', '20:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('26/01/2020', '22:00:00', 9 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/01/2020', '10:00:00', 11 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/01/2020', '12:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('27/01/2020', '14:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/01/2020', '10:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/01/2020', '12:00:00', 10 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('28/01/2020', '14:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/01/2020', '16:00:00', 13 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/01/2020', '18:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/01/2020', '20:00:00', 16 )
insert into Funciones (dia_funcion, hora_funcion, id_pelicula) values ('29/01/2020', '22:00:00', 16 )



--SALAS_FUNCIONES
insert into Salas_Funciones (id_sala, id_funcion)
values (1, 7),
		(2, 11),
		(3, 14),
		(4, 23),
		(5, 29),
		(6,40),
		(7, 45),
		(8, 50),
		(9, 58),
		(10, 69),
		(11,89),
		(1, 100),
		(2, 112),
		(3, 128),
		(4, 133),
		(5, 140),
		(6,156),
		(7, 161),
		(8, 166),
		(9, 172),
		(10, 177),
		(11, 190),
		( 1, 270),
		( 2, 272),
		(3, 274),
		(4, 277),
		(5, 279),
		(6, 304),
		(7, 310),
		(8, 314),
		(9, 318),
		(10, 322),
		(11, 341),
		(1, 355),
		(2, 367),
		(3, 387),
		(4, 400),
		(5, 401),
		(6, 417),
		(7, 421),
		(8, 426),
		(9,427),
		(10, 429),
		(11, 431),
		(1, 435),
		(2, 440),
		(3, 402),
		(4, 405),
		(5, 406),
		(6, 418),
		(7,419),
		(8,423),
		(9,435),
		(10,439),
		(11, 455),
		(1,461),
		(2,464),
		(3,467),
		(4,468),
		(5,469),
		(6,470),
		(7, 471),
		(8,472);
		
		
--RESERVAS		
	--insert into Reservas ( id_cliente, id_sala_funcion, id_butaca, fecha_reserva, se_abono)
	--	values ( 20, 1, 1, '1980-10-01', 'si'),
	--	       (16, 2, 35, '1980-10-02', 'si'),
	--		   (10, 4, 96, '1980-09-28', 'si'),
	--		   (11, 3, 82, '1980-11-02', 'si'),
	--		   (12, 6, 158, '1980-02-14', 'si'),
	--		   (2, 9, 246, '1995-04-24', 'si'),
	--		   (3, 10, 281, '1995-04-24','si'),
	--		   (15, 19,236, '1999-11-07', 'si'),
	--		   (1, 42, 248, '2019-10-03' ,'no'),
	--		   (4, 54, 287, '2019-10-07', 'si'),
	--		   (5, 50, 166, '2019-06-24', 'si'),
	--		   (6, 53, 267, '2019-10-04','si'),
	--		   (7, 55, 307, '2020-01-22', 'si'),
	--		   (8, 59, 102, '2020-01-27', 'si'),
	--		   (9, 38, 124, '2019-06-20', 'si'),
	--		   (13, 38, 123, '2019-06-20', 'si'),
	--		   (14, 63, 239, '2020-01-27', 'no'),
	--		   (17, 55, 299, '2020-01-24', 'si'),
	--		   (18, 58, 70, '2020-01-28', 'no'),
	--		   (19, 46, 45, '2019-10-06', 'si');



insert into Reservas ( id_cliente, id_sala_funcion, id_butaca, fecha_reserva, se_abono, hora_reserva)
        values ( 20, 1, 1, '09/02/1980', 'si', '16:00:00'),
               (16, 2, 35, '10/02/1980', 'si', '12:00:00'),
               (10, 4, 96, '11/02/1980', 'si', '20:30:00'),
               (11, 3, 82, '11/02/1980', 'si', '15:00:00'),
               (12, 6, 158, '14/02/1980', 'si', '16:00:00'),
               (2, 9, 246, '24/04/1995', 'si', '09:30:00'),
               (3, 10, 281, '24/04/1995','si', '17:30:00'),
               (15, 19,236, '07/11/1999', 'si', '10:00:00'),
               (1, 42, 248, '03/10/2019','no', '12:00:00'),
               (4, 54, 287, '06/10/2019', 'si', '22:00:00'),
               (5, 50, 166, '24/06/2019', 'si', '22:30:00'),
               (6, 53, 267, '04/10/2019','si', '10:30:00'),
               (7, 55, 307, '22/01/2020', 'si', '18:30:00'),
               (8, 59, 102, '27/01/2020', 'si', '20:30:00'),
               (9, 38, 124, '20/06/2019', 'si', '07:30:00'),
               (13, 38, 123, '20/06/2019', 'si', '06:40:00'),
               (14, 63, 239, '27/01/2020', 'no', '20:00:00'),
               (17, 55, 299, '24/01/2020', 'si', '17:45:00'),
               (18, 58, 70, '28/01/2020', 'no', '10:00:00'),
               (19, 46, 45, '06/10/2019', 'si', '22:45:00');


--COMPROBANTES_COMPRAS
--insert into Comprobantes_Compras (id_empleado, id_cliente, fecha_compra, id_form_pag , es_online)
-- values ( 4 , 20, '1980-10-01', 1 , 'no'),
--		(2, 16, '1980-10-02',1, 'no'),
--		(2, 10, '1980-09-28',1, 'no'),
--		(3, 11, '1980-11-02', 1, 'no'),
--		(5, 12, '1980-02-14',1, 'no'),
--		(5, 2, '1995-04-24', 2, 'no'),
--		(1, 3, '1995-04-24', 2, 'no'),
--		(4, 15, '1999-11-07', 2, 'no'),
--		(1, 1, '2019-10-03', 3, 'si'),
--		(1, 4, '2019-10-07', 3, 'si'),
--		(3, 5, '2019-06-24', 2, 'si'),
--		(5, 6, '2019-10-04', 2, 'si'),
--		(1, 7, '2020-01-22', 1, 'no'),
--		(2, 8, '2020-01-27', 2, 'si'),
--		(3, 9, '2019-06-20', 2, 'si'),
--		(2, 13, '2019-06-20', 3, 'si'),
--		(5, 14, '2020-01-27', 3, 'si'),
--		(4, 17, '2020-01-24', 3, 'si'),
--		(1, 18, '2020-01-28', 2, 'si'),
--		(2, 19, '2019-10-06', 3, 'no');


insert into Comprobantes_Compras (id_empleado, id_cliente, fecha_compra, id_form_pag , es_online)
 values ( 4 , 20, '09/02/1980', 1 , 'no'), 
        (2, 16, '10/02/1980',1, 'no'), 
        (2, 10, '11/02/1980',1, 'no'),
        (3, 11, '11/02/1980', 1, 'no'),
        (5, 12, '14/02/1980',1, 'no'),
        (5, 2, '24/04/1995', 2, 'si'),
        (1, 3, '24/04/1995', 2, 'no'),
        (4, 15, '07/11/1999', 2, 'no'),
        (1, 1, '03/10/2019', 3, 'si'),
        (1, 4, '06/10/2019', 3, 'si'),
        (3, 5, '24/06/2019', 2, 'si'),
        (5, 6, '04/10/2019', 2, 'si'),
        (1, 7, '22/01/2020', 1, 'no'),
        (2, 8, '27/01/2020', 2, 'si'),
        (3, 9, '20/06/2019', 2, 'si'),
        (2, 13, '20/06/2019', 3, 'si'),
        (5, 14, '27/01/2020', 3, 'si'),
        (4, 17, '24/01/2020', 3, 'si'),
        (1, 18, '28/01/2020', 2, 'si'),
        (2, 19, '06/10/2019', 3, 'si');




--DESCUENTOS
insert into Descuentos (porc_descuento) values(5)
insert into Descuentos (porc_descuento) values(10)
insert into Descuentos (porc_descuento) values(15)
insert into Descuentos (porc_descuento) values(20)
insert into Descuentos (porc_descuento) values(25)
insert into Descuentos (porc_descuento) values(50)


--DETALLES_COMPROBANTES
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(1,1,10,0,null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(1,1,10,0,null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(2, 2, 10, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(2, 2, 10, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(2, 2, 10, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(3, 4, 10, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(3, 4, 10, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(4, 3, 10, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(4, 3, 10, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(4, 3, 10, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(5, 6, 15, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(5, 6, 15, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(5, 6, 15, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(6, 9, 20, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(6, 9, 20, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(7, 10, 50, 50, 6)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(7, 10, 50, 0,null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(8,19, 45, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(8,19, 45, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(8,19, 45, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(8,19, 45, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(9, 42, 320, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(9, 42, 320, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(9, 42, 320, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(9, 42, 320, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(9, 42, 320, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(9, 42, 320, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(10, 54, 350, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(10, 54, 350, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(11, 50, 230, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(11, 50, 230, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(11, 50, 230, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(11, 50, 230, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(11, 50, 230, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(11, 50, 230, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(11, 50, 230, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(11, 50, 230, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(12, 45, 200, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(13, 55, 350, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(13, 55, 350, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(13, 55, 350, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(14, 59, 200, 50, 6)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(14,59, 350, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(14, 59, 350, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(14, 59, 350, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(15, 38, 230, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(15, 38, 230, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(15, 38, 230, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(15, 38, 230, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(15, 38, 230, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(15, 38, 230, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(16, 38, 230, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(16, 38, 230, 50, 6 )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(16, 38, 230, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(16, 38, 230, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(17, 63, 260, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(17, 63, 260, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(18, 55, 350, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(18, 55, 350, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(19, 58, 200, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(19, 58, 200, 0, null )
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(20, 26, 200, 0, null)
insert into Detalles_Comprobantes (id_comprobante, id_sala_funcion, monto, porc_descuento, id_descuento) values(20, 26, 200, 0, null)




--TICKETS

insert into Tickets (id_det_comp , id_butaca)
		values ( 1, 1),
				(2, 5),
				(3, 35),
				(4, 36),
				(5, 37),
				(6, 96),
				(7, 97),
				(8, 82),
				(9, 83),
				(10,84),
				(11, 158),
				(12, 149),
				(13, 150),
				(14, 246),
				(15, 247),
				(16, 281),
				(17, 282),
				(18, 236),
				(19, 237),
				(20, 238),
				(21, 239),
				(22, 248),
				(23, 249),
				(24, 250),
				(25, 251),
				(26, 252),
				(27, 253),
				(28, 287),
				(29, 288),
				(30, 166),
				(31, 167),
				(32, 168),
				(33, 169),
				(34, 170),
				(35, 171),
				(36, 172),
				(37, 173),
				(38, 7),
				(39, 307),
				(40, 308),
				(41, 309),
				(42, 102),
				(43, 103),
				(44, 105),
				(45, 106),
				(46, 124),
				(47, 123),
				(48, 126),
				(49, 127),
				(50, 130),
				(51, 131),
				(52, 132),
				(53, 133),
				(54, 134),
				(55, 135),
				(56, 239),
				(57, 240),
				(58, 298),
				(59, 299),
				(60, 70),
				(61, 71),
				(62, 95),
				(63, 96);
