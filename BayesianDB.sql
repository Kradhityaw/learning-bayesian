USE [master]
GO
/****** Object:  Database [BayesianDB]    Script Date: 21/02/2025 16:30:08 ******/
CREATE DATABASE [BayesianDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BayesianDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BayesianDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BayesianDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BayesianDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BayesianDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BayesianDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BayesianDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BayesianDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BayesianDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BayesianDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BayesianDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BayesianDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BayesianDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BayesianDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BayesianDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BayesianDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BayesianDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BayesianDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BayesianDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BayesianDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BayesianDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BayesianDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BayesianDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BayesianDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BayesianDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BayesianDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BayesianDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BayesianDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BayesianDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BayesianDB] SET  MULTI_USER 
GO
ALTER DATABASE [BayesianDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BayesianDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BayesianDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BayesianDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BayesianDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BayesianDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BayesianDB] SET QUERY_STORE = OFF
GO
USE [BayesianDB]
GO
/****** Object:  Table [dbo].[Criteria]    Script Date: 21/02/2025 16:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[learningStyle] [varchar](100) NOT NULL,
	[initialUnderstanding] [varchar](100) NOT NULL,
	[learningMedia] [varchar](100) NOT NULL,
	[numberOfStudents] [varchar](100) NOT NULL,
	[learningMethod] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Criteria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Criteria] ON 
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (1, N'Visual', N'Tinggi', N'Lengkap', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (2, N'Visual', N'Tinggi', N'Lengkap', N'Kecil', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (3, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (4, N'Visual', N'Sedang', N'Lengkap', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (5, N'Auditori', N'Tinggi', N'Lengkap', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (6, N'Visual', N'Tinggi', N'Terbatas', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (7, N'Kinestetik', N'Tinggi', N'Lengkap', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (8, N'Visual', N'Rendah', N'Lengkap', N'Sedang', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (9, N'Auditori', N'Tinggi', N'Lengkap', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (10, N'Visual', N'Tinggi', N'Lengkap', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (11, N'Kinestetik', N'Sedang', N'Terbatas', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (12, N'Auditori', N'Tinggi', N'Lengkap', N'Kecil', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (13, N'Visual', N'Rendah', N'Terbatas', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (14, N'Kinestetik', N'Tinggi', N'Lengkap', N'Sedang', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (15, N'Visual', N'Sedang', N'Lengkap', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (16, N'Auditori', N'Rendah', N'Terbatas', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (17, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (18, N'Kinestetik', N'Sedang', N'Lengkap', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (19, N'Visual', N'Tinggi', N'Terbatas', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (20, N'Auditori', N'Sedang', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (21, N'Visual', N'Rendah', N'Lengkap', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (22, N'Kinestetik', N'Tinggi', N'Terbatas', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (23, N'Auditori', N'Tinggi', N'Lengkap', N'Besar', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (24, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (25, N'Kinestetik', N'Rendah', N'Lengkap', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (26, N'Visual', N'Tinggi', N'Lengkap', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (27, N'Auditori', N'Sedang', N'Terbatas', N'Kecil', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (28, N'Visual', N'Rendah', N'Lengkap', N'Sedang', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (29, N'Kinestetik', N'Tinggi', N'Lengkap', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (30, N'Visual', N'Sedang', N'Terbatas', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (31, N'Auditori', N'Tinggi', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (32, N'Visual', N'Rendah', N'Terbatas', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (33, N'Kinestetik', N'Sedang', N'Lengkap', N'Besar', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (34, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (35, N'Auditori', N'Rendah', N'Terbatas', N'Kecil', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (36, N'Visual', N'Sedang', N'Lengkap', N'Besar', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (37, N'Kinestetik', N'Tinggi', N'Terbatas', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (38, N'Auditori', N'Sedang', N'Lengkap', N'Kecil', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (39, N'Visual', N'Rendah', N'Terbatas', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (40, N'Kinestetik', N'Tinggi', N'Lengkap', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (41, N'Visual', N'Sedang', N'Lengkap', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (42, N'Auditori', N'Rendah', N'Terbatas', N'Besar', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (43, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (44, N'Kinestetik', N'Sedang', N'Terbatas', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (45, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (46, N'Auditori', N'Tinggi', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (47, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (48, N'Kinestetik', N'Rendah', N'Lengkap', N'Besar', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (49, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (50, N'Auditori', N'Sedang', N'Terbatas', N'Kecil', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (51, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (52, N'Kinestetik', N'Tinggi', N'Lengkap', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (53, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (54, N'Auditori', N'Rendah', N'Lengkap', N'Besar', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (55, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (56, N'Kinestetik', N'Sedang', N'Terbatas', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (57, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (58, N'Auditori', N'Tinggi', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (59, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (60, N'Kinestetik', N'Rendah', N'Lengkap', N'Besar', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (61, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (62, N'Auditori', N'Sedang', N'Terbatas', N'Kecil', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (63, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (64, N'Kinestetik', N'Tinggi', N'Lengkap', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (65, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (66, N'Auditori', N'Rendah', N'Lengkap', N'Besar', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (67, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (68, N'Kinestetik', N'Sedang', N'Terbatas', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (69, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (70, N'Auditori', N'Tinggi', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (71, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (72, N'Kinestetik', N'Rendah', N'Lengkap', N'Besar', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (73, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (74, N'Auditori', N'Sedang', N'Terbatas', N'Kecil', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (75, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (76, N'Kinestetik', N'Tinggi', N'Lengkap', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (77, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (78, N'Auditori', N'Rendah', N'Lengkap', N'Besar', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (79, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (80, N'Kinestetik', N'Sedang', N'Terbatas', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (81, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (82, N'Auditori', N'Tinggi', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (83, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (84, N'Kinestetik', N'Rendah', N'Lengkap', N'Besar', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (85, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (86, N'Auditori', N'Sedang', N'Terbatas', N'Kecil', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (87, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (88, N'Kinestetik', N'Tinggi', N'Lengkap', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (89, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (90, N'Auditori', N'Rendah', N'Lengkap', N'Besar', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (91, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (92, N'Kinestetik', N'Sedang', N'Terbatas', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (93, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (94, N'Auditori', N'Tinggi', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (95, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (96, N'Kinestetik', N'Rendah', N'Lengkap', N'Besar', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (97, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (98, N'Auditori', N'Sedang', N'Terbatas', N'Kecil', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (99, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (100, N'Kinestetik', N'Tinggi', N'Lengkap', N'Sedang', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (101, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (102, N'Auditori', N'Rendah', N'Lengkap', N'Besar', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (103, N'Visual', N'Tinggi', N'Lengkap', N'Sedang', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (104, N'Kinestetik', N'Sedang', N'Terbatas', N'Kecil', N'Praktikum')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (105, N'Visual', N'Rendah', N'Lengkap', N'Besar', N'Demonstrasi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (106, N'Auditori', N'Tinggi', N'Lengkap', N'Sedang', N'Diskusi')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (107, N'Visual', N'Sedang', N'Terbatas', N'Kecil', N'Ceramah')
GO
INSERT [dbo].[Criteria] ([id], [learningStyle], [initialUnderstanding], [learningMedia], [numberOfStudents], [learningMethod]) VALUES (108, N'Kinestetik', N'Rendah', N'Lengkap', N'Besar', N'Praktikum')
GO
SET IDENTITY_INSERT [dbo].[Criteria] OFF
GO
USE [master]
GO
ALTER DATABASE [BayesianDB] SET  READ_WRITE 
GO
