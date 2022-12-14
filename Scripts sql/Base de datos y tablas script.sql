USE [master]
GO
/****** Object:  Database [Universidad]    Script Date: 23/09/2022 08:05:17 ******/
CREATE DATABASE [Universidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Universidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Universidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Universidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Universidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Universidad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Universidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Universidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Universidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Universidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Universidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Universidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Universidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Universidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Universidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Universidad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Universidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Universidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Universidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Universidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Universidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Universidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Universidad] SET RECOVERY FULL 
GO
ALTER DATABASE [Universidad] SET  MULTI_USER 
GO
ALTER DATABASE [Universidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Universidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Universidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Universidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Universidad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Universidad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Universidad', N'ON'
GO
ALTER DATABASE [Universidad] SET QUERY_STORE = OFF
GO
USE [Universidad]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 23/09/2022 08:05:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 23/09/2022 08:05:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[IdCurso] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[NroCreditos] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleSolicitud]    Script Date: 23/09/2022 08:05:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleSolicitud](
	[IdDetalleSol] [int] IDENTITY(1,1) NOT NULL,
	[IdSolicitud] [int] NOT NULL,
	[IdCurso] [int] NOT NULL,
	[Profesor] [varchar](50) NOT NULL,
	[Aula] [varchar](50) NOT NULL,
	[Sede] [varchar](50) NOT NULL,
	[Observacion] [varchar](50) NULL,
 CONSTRAINT [PK_DetalleSolicitud] PRIMARY KEY CLUSTERED 
(
	[IdDetalleSol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 23/09/2022 08:05:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[FechaSolicitud] [datetime] NOT NULL,
	[CodRegistrante] [int] NOT NULL,
	[Carrera] [varchar](50) NOT NULL,
	[Periodo] [varchar](7) NOT NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (1, N'Hill', N'Mollitt')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (2, N'Elane', N'Davidof')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (3, N'Fara', N'Akam')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (4, N'Randy', N'Slowan')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (5, N'Godart', N'Lamp')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (6, N'Carly', N'Bunner')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (7, N'Stinky', N'Greenland')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (8, N'Tab', N'Hyam')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (9, N'Jessalyn', N'Stote')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (10, N'Ludovika', N'Prater')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (11, N'Fenelia', N'Jaspar')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (12, N'Luci', N'Houston')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (13, N'Fey', N'Kestle')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (14, N'Archibald', N'Radki')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (15, N'Kayle', N'Chaunce')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (16, N'Isa', N'Gothrup')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (17, N'Ara', N'Rabson')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (18, N'Frederica', N'Rany')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (19, N'Byrle', N'Tear')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (20, N'Drucy', N'Stygall')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (21, N'Zita', N'Roizn')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (22, N'Katya', N'Ragate')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (23, N'Rey', N'Wye')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (24, N'Harley', N'Danskine')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (25, N'Gabie', N'Sterrick')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (26, N'Emanuel', N'Dabner')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (27, N'Orlando', N'Deare')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (28, N'Pollyanna', N'Strowger')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (29, N'Ava', N'Ritelli')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (30, N'Charity', N'Stoad')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (31, N'Dosi', N'Drewett')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (32, N'Giff', N'Robardey')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (33, N'Yehudit', N'Dwyer')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (34, N'Tally', N'Eastway')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (35, N'Darsie', N'Leidl')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (36, N'Sandi', N'Ughelli')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (37, N'Gallard', N'McCreery')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (38, N'Ozzie', N'Thurske')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (39, N'Rozina', N'Tures')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (40, N'Janifer', N'Macura')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (41, N'Simonne', N'Liddon')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (42, N'Joline', N'Fayerman')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (43, N'Rriocard', N'Rostron')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (44, N'Penelope', N'Tedridge')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (45, N'Fernandina', N'Dunkinson')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (46, N'Lyndy', N'Faulks')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (47, N'Cullen', N'Paxforde')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (48, N'Jada', N'Dahl')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (49, N'Madelyn', N'Keable')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (50, N'Berk', N'Osman')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (51, N'Enrica', N'Molloy')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (52, N'Bette', N'Works')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (53, N'Nicolas', N'Timperley')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (54, N'Grace', N'Tennison')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (55, N'Jone', N'Hegden')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (56, N'Hatty', N'Mc Gorley')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (57, N'Floris', N'Nappin')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (58, N'Inez', N'Coulson')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (59, N'Olga', N'Shaughnessy')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (60, N'Jilly', N'Grendon')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (61, N'Nickola', N'Shipsey')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (62, N'Dwain', N'Sexcey')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (63, N'Constantia', N'Main')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (64, N'Ruperta', N'Vousden')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (65, N'Padriac', N'Cantillion')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (66, N'Gerardo', N'Newell')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (67, N'Florella', N'De Courtney')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (68, N'Rebeca', N'Yanshonok')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (69, N'Esme', N'Sueter')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (70, N'Jan', N'Shoute')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (71, N'Starlene', N'Dailly')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (72, N'Elaine', N'Pash')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (73, N'Ceil', N'Ashburne')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (74, N'Alec', N'Durtnell')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (75, N'Taber', N'Choppin')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (76, N'Berk', N'Galia')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (77, N'Chen', N'Gilfoy')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (78, N'Antonetta', N'Alvarado')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (79, N'Carol-jean', N'Hatherley')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (80, N'Johnette', N'Earsman')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (81, N'Vanny', N'Kerner')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (82, N'Nappie', N'Beynon')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (83, N'Bili', N'Tims')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (84, N'Nisse', N'Meadway')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (85, N'Adair', N'Trustram')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (86, N'Lorilee', N'Pfeffel')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (87, N'Christy', N'Souza')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (88, N'Gavan', N'Sawtell')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (89, N'Tadeas', N'Shirer')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (90, N'Gilbertina', N'Siaspinski')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (91, N'Hobart', N'Iacomini')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (92, N'Sharline', N'Heed')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (93, N'Egan', N'Spada')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (94, N'Jyoti', N'Eckels')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (95, N'Toni', N'Grizard')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (96, N'Marget', N'Ivanchikov')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (97, N'Noell', N'McCord')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (98, N'Priscilla', N'Arrowsmith')
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (99, N'Samson', N'Winsper')
GO
INSERT [dbo].[Alumno] ([IdAlumno], [Nombres], [Apellidos]) VALUES (100, N'Garrett', N'Dalligan')
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 

INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (1, N'Zontrax', N'morbi quis tortor', 3, 1)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (2, N'Keylex', N'odio donec vitae nisi nam', 1, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (3, N'Flexidy', N'cras in purus eu', 3, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (4, N'Job', N'arcu adipiscing molestie hendrerit', 3, 1)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (5, N'Span', N'lacus morbi quis tortor id', 4, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (6, N'Sonsing', N'eleifend donec ut dolor', 3, 1)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (7, N'Tin', N'lacinia nisi venenatis', 5, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (8, N'Fintone', N'maecenas pulvinar lobortis est', 4, 1)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (9, N'Namfix', N'volutpat erat quisque erat', 2, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (10, N'Cookley', N'maecenas tristique est et', 4, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (11, N'Temp', N'justo nec condimentum neque', 1, 1)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (12, N'Latlux', N'vestibulum ante ipsum', 2, 1)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (13, N'Bamity', N'praesent lectus vestibulum quam sapien', 2, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (14, N'Fixflex', N'justo lacinia eget tincidunt', 4, 1)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (15, N'Tres-Zap', N'vivamus vel nulla eget', 1, 1)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (16, N'Zontrax', N'mi in porttitor', 3, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (17, N'Cookley', N'donec odio justo sollicitudin', 4, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (18, N'Tresom', N'luctus rutrum nulla tellus in', 4, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (19, N'Alphazap', N'gravida nisi at nibh in', 3, 0)
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Descripcion], [NroCreditos], [Activo]) VALUES (20, N'Otcom', N'odio curabitur convallis duis consequat', 1, 1)
SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleSolicitud] ON 

INSERT [dbo].[DetalleSolicitud] ([IdDetalleSol], [IdSolicitud], [IdCurso], [Profesor], [Aula], [Sede], [Observacion]) VALUES (1, 2, 1, N'Non vitae non deleni', N'Minus reiciendis ali', N'Aut fugit esse pers', N'Sapiente cupiditate ')
INSERT [dbo].[DetalleSolicitud] ([IdDetalleSol], [IdSolicitud], [IdCurso], [Profesor], [Aula], [Sede], [Observacion]) VALUES (2, 3, 16, N'Sapiente nihil unde ', N'Laborum Ratione rer', N'Aliquid dolorum et m', N'Impedit labore nece')
INSERT [dbo].[DetalleSolicitud] ([IdDetalleSol], [IdSolicitud], [IdCurso], [Profesor], [Aula], [Sede], [Observacion]) VALUES (3, 4, 10, N'Molestiae facilis se', N'Saepe aperiam volupt', N'Proident modi lauda', N'Dignissimos dolor to')
SET IDENTITY_INSERT [dbo].[DetalleSolicitud] OFF
GO
SET IDENTITY_INSERT [dbo].[Solicitud] ON 

INSERT [dbo].[Solicitud] ([IdSolicitud], [IdAlumno], [FechaSolicitud], [CodRegistrante], [Carrera], [Periodo]) VALUES (1, 1, CAST(N'2022-09-27T00:00:00.000' AS DateTime), 232, N'asdfsdf', N'2022-10')
INSERT [dbo].[Solicitud] ([IdSolicitud], [IdAlumno], [FechaSolicitud], [CodRegistrante], [Carrera], [Periodo]) VALUES (2, 49, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 39, N'Ad quia animi maxim', N'1986-12')
INSERT [dbo].[Solicitud] ([IdSolicitud], [IdAlumno], [FechaSolicitud], [CodRegistrante], [Carrera], [Periodo]) VALUES (3, 95, CAST(N'2022-09-29T00:00:00.000' AS DateTime), 32, N'Fugit non reiciendi', N'1983-12')
INSERT [dbo].[Solicitud] ([IdSolicitud], [IdAlumno], [FechaSolicitud], [CodRegistrante], [Carrera], [Periodo]) VALUES (4, 40, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 62, N'Occaecat nostrud vel', N'2006-12')
SET IDENTITY_INSERT [dbo].[Solicitud] OFF
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumno] ([IdAlumno])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Alumno]
GO
ALTER TABLE [dbo].[DetalleSolicitud]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSolicitud_Cursos] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Cursos] ([IdCurso])
GO
ALTER TABLE [dbo].[DetalleSolicitud] CHECK CONSTRAINT [FK_DetalleSolicitud_Cursos]
GO
ALTER TABLE [dbo].[DetalleSolicitud]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSolicitud_Solicitud] FOREIGN KEY([IdSolicitud])
REFERENCES [dbo].[Solicitud] ([IdSolicitud])
GO
ALTER TABLE [dbo].[DetalleSolicitud] CHECK CONSTRAINT [FK_DetalleSolicitud_Solicitud]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumno] ([IdAlumno])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Alumno]
GO
USE [master]
GO
ALTER DATABASE [Universidad] SET  READ_WRITE 
GO
