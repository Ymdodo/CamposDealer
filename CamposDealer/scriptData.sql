USE [master]
GO
/****** Object:  Database [CamposDealerTeste]    Script Date: 13/12/2024 16:29:34 ******/
CREATE DATABASE [CamposDealerTeste]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CamposDealerTeste', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CamposDealerTeste.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CamposDealerTeste_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CamposDealerTeste_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CamposDealerTeste] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CamposDealerTeste].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CamposDealerTeste] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET ARITHABORT OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CamposDealerTeste] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CamposDealerTeste] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CamposDealerTeste] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CamposDealerTeste] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CamposDealerTeste] SET  MULTI_USER 
GO
ALTER DATABASE [CamposDealerTeste] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CamposDealerTeste] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CamposDealerTeste] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CamposDealerTeste] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CamposDealerTeste] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CamposDealerTeste] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CamposDealerTeste] SET QUERY_STORE = OFF
GO
USE [CamposDealerTeste]
GO
/****** Object:  User [oliveido]    Script Date: 13/12/2024 16:29:34 ******/
CREATE USER [oliveido] FOR LOGIN [oliveido] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13/12/2024 16:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/12/2024 16:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] NOT NULL,
	[NomeCliente] [nvarchar](100) NOT NULL,
	[Cidade] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 13/12/2024 16:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[IdProduto] [int] NOT NULL,
	[DescricaoProduto] [nvarchar](100) NOT NULL,
	[ValorUnitario] [float] NOT NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
(
	[IdProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendas]    Script Date: 13/12/2024 16:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendas](
	[IdVenda] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdProduto] [int] NOT NULL,
	[Qtd] [int] NOT NULL,
	[DtVenda] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Vendas] PRIMARY KEY CLUSTERED 
(
	[IdVenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241213085920_InitialCreate', N'9.0.0')
GO
INSERT [dbo].[Clientes] ([IdCliente], [NomeCliente], [Cidade]) VALUES (1, N'Cli1', N'Cidade1')
INSERT [dbo].[Clientes] ([IdCliente], [NomeCliente], [Cidade]) VALUES (2, N'Cli2', N'Cidade2')
INSERT [dbo].[Clientes] ([IdCliente], [NomeCliente], [Cidade]) VALUES (3, N'Cli3', N'Cidade3')
INSERT [dbo].[Clientes] ([IdCliente], [NomeCliente], [Cidade]) VALUES (4, N'Cli4', N'Cidade4')
GO
INSERT [dbo].[Produtos] ([IdProduto], [DescricaoProduto], [ValorUnitario]) VALUES (1, N'Produto 1', 5)
INSERT [dbo].[Produtos] ([IdProduto], [DescricaoProduto], [ValorUnitario]) VALUES (2, N'Produto 2', 10)
INSERT [dbo].[Produtos] ([IdProduto], [DescricaoProduto], [ValorUnitario]) VALUES (3, N'Produto 3', 15)
INSERT [dbo].[Produtos] ([IdProduto], [DescricaoProduto], [ValorUnitario]) VALUES (4, N'Produto 4', 20)
GO
INSERT [dbo].[Vendas] ([IdVenda], [IdCliente], [IdProduto], [Qtd], [DtVenda]) VALUES (1, 1, 1, 5, CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Vendas] ([IdVenda], [IdCliente], [IdProduto], [Qtd], [DtVenda]) VALUES (2, 1, 2, 1, CAST(N'2024-12-13T13:12:59.2170000' AS DateTime2))
INSERT [dbo].[Vendas] ([IdVenda], [IdCliente], [IdProduto], [Qtd], [DtVenda]) VALUES (3, 1, 3, 1, CAST(N'2024-12-13T13:12:59.2170000' AS DateTime2))
INSERT [dbo].[Vendas] ([IdVenda], [IdCliente], [IdProduto], [Qtd], [DtVenda]) VALUES (4, 2, 1, 5, CAST(N'2024-12-13T13:12:59.2170000' AS DateTime2))
INSERT [dbo].[Vendas] ([IdVenda], [IdCliente], [IdProduto], [Qtd], [DtVenda]) VALUES (5, 2, 2, 1, CAST(N'2024-12-13T13:12:59.2170000' AS DateTime2))
INSERT [dbo].[Vendas] ([IdVenda], [IdCliente], [IdProduto], [Qtd], [DtVenda]) VALUES (6, 3, 1, 10, CAST(N'2024-12-13T13:12:59.2170000' AS DateTime2))
INSERT [dbo].[Vendas] ([IdVenda], [IdCliente], [IdProduto], [Qtd], [DtVenda]) VALUES (7, 3, 3, 2, CAST(N'2024-12-13T13:12:59.2170000' AS DateTime2))
GO
/****** Object:  Index [IX_Vendas_IdCliente]    Script Date: 13/12/2024 16:29:35 ******/
CREATE NONCLUSTERED INDEX [IX_Vendas_IdCliente] ON [dbo].[Vendas]
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vendas_IdProduto]    Script Date: 13/12/2024 16:29:35 ******/
CREATE NONCLUSTERED INDEX [IX_Vendas_IdProduto] ON [dbo].[Vendas]
(
	[IdProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vendas]  WITH CHECK ADD  CONSTRAINT [FK_Vendas_Clientes_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vendas] CHECK CONSTRAINT [FK_Vendas_Clientes_IdCliente]
GO
ALTER TABLE [dbo].[Vendas]  WITH CHECK ADD  CONSTRAINT [FK_Vendas_Produtos_IdProduto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[Produtos] ([IdProduto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vendas] CHECK CONSTRAINT [FK_Vendas_Produtos_IdProduto]
GO
USE [master]
GO
ALTER DATABASE [CamposDealerTeste] SET  READ_WRITE 
GO
