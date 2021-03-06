USE [master]
GO
/****** Object:  Database [bd_VMVisitasMedicas]    Script Date: 10/04/2017 12:50:26 a. m. ******/
CREATE DATABASE [bd_VMVisitasMedicas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_VMVisitasMedicas', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MIGUEL\MSSQL\DATA\bd_VMVisitasMedicas.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bd_VMVisitasMedicas_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MIGUEL\MSSQL\DATA\bd_VMVisitasMedicas_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_VMVisitasMedicas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET  MULTI_USER 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [bd_VMVisitasMedicas]
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 10/04/2017 12:50:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultorio](
	[con_id] [int] IDENTITY(1,1) NOT NULL,
	[con_piso] [int] NULL,
	[con_numero] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[con_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estado_Usuario]    Script Date: 10/04/2017 12:50:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado_Usuario](
	[est_id] [int] IDENTITY(1,1) NOT NULL,
	[est_descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[est_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 10/04/2017 12:50:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hospital](
	[hos_id] [int] IDENTITY(1,1) NOT NULL,
	[hos_descripcion] [varchar](250) NULL,
	[hos_direccion] [varchar](250) NULL,
	[hos_telefono_AC] [varchar](20) NULL,
	[hos_telefono_eme] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[hos_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 10/04/2017 12:50:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medico](
	[med_id] [int] IDENTITY(1,1) NOT NULL,
	[med_nombre] [varchar](150) NULL,
	[apellidoP] [varchar](150) NULL,
	[apellidoM] [varchar](150) NULL,
	[sex_id] [int] NULL,
	[med_especialidad] [varchar](150) NULL,
	[con_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 10/04/2017 12:50:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sexo](
	[sex_id] [int] IDENTITY(1,1) NOT NULL,
	[sex_descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[sex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/04/2017 12:50:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[usu_id] [int] IDENTITY(1,1) NOT NULL,
	[usu_nombre] [varchar](150) NULL,
	[usu_apellidoPaterno] [varchar](150) NULL,
	[usu_apellidoMaterno] [varchar](150) NULL,
	[usu_edad] [int] NULL,
	[usu_telefono] [varchar](20) NULL,
	[sex_id] [int] NULL,
	[est_id] [int] NULL,
	[usu_fecha_alta] [datetime] NULL,
	[usu_fecha_baja] [datetime] NULL,
	[usu_admin] [bit] NULL,
	[password] [varchar](20) NULL,
	[usu_permisoAltas] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[usu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Visita]    Script Date: 10/04/2017 12:50:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Visita](
	[vis_id] [int] IDENTITY(1,1) NOT NULL,
	[vis_fecha_cita] [datetime] NULL,
	[usu_id] [int] NULL,
	[med_id] [int] NULL,
	[hos_id] [int] NULL,
	[con_id] [int] NULL,
	[vis_estado] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[vis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [est_id]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [usu_fecha_alta]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([est_id])
REFERENCES [dbo].[Estado_Usuario] ([est_id])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([sex_id])
REFERENCES [dbo].[Sexo] ([sex_id])
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD FOREIGN KEY([con_id])
REFERENCES [dbo].[Consultorio] ([con_id])
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD FOREIGN KEY([hos_id])
REFERENCES [dbo].[Hospital] ([hos_id])
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD FOREIGN KEY([med_id])
REFERENCES [dbo].[Medico] ([med_id])
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD FOREIGN KEY([usu_id])
REFERENCES [dbo].[Usuario] ([usu_id])
GO
USE [master]
GO
ALTER DATABASE [bd_VMVisitasMedicas] SET  READ_WRITE 
GO
