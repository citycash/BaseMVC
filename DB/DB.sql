USE [master]
GO
/****** Object:  Database [MyProfile]    Script Date: 07/06/2020 15:30:29 ******/
CREATE DATABASE [MyProfile]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyProfile', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyProfile.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyProfile_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyProfile_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyProfile] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyProfile].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyProfile] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyProfile] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyProfile] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyProfile] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyProfile] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyProfile] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyProfile] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyProfile] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyProfile] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyProfile] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyProfile] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyProfile] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyProfile] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyProfile] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyProfile] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyProfile] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyProfile] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyProfile] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyProfile] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyProfile] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyProfile] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyProfile] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyProfile] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyProfile] SET  MULTI_USER 
GO
ALTER DATABASE [MyProfile] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyProfile] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyProfile] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyProfile] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyProfile] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyProfile] SET QUERY_STORE = OFF
GO
USE [MyProfile]
GO
/****** Object:  Table [dbo].[TblM_User]    Script Date: 07/06/2020 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblM_User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_TblM_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblM_User] ON 

INSERT [dbo].[TblM_User] ([id], [Nama], [Email]) VALUES (1, N'nama', N'sw14461@gmail.com')
INSERT [dbo].[TblM_User] ([id], [Nama], [Email]) VALUES (2, N'nama 2', N'pass12@gmail.com')
INSERT [dbo].[TblM_User] ([id], [Nama], [Email]) VALUES (3, N'nama 3', N'passs@gmal.com')
INSERT [dbo].[TblM_User] ([id], [Nama], [Email]) VALUES (4, N'nama 4', N'contoh_Email@gmail.com')
INSERT [dbo].[TblM_User] ([id], [Nama], [Email]) VALUES (5, N'nama 5', N'contoh2@gmail.com')
INSERT [dbo].[TblM_User] ([id], [Nama], [Email]) VALUES (6, N'Nama 6', N'Oke_Oce_@gmail.com')
SET IDENTITY_INSERT [dbo].[TblM_User] OFF
GO
/****** Object:  StoredProcedure [dbo].[USP_Delete_User]    Script Date: 07/06/2020 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Delete_User]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblM_User
	WHERE id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_User]    Script Date: 07/06/2020 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Get_User]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM TblM_User
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Or_Update_User]    Script Date: 07/06/2020 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Insert_Or_Update_User]
	-- Add the parameters for the stored procedure here
	@Option int = 0,
	@ID int = 0,
	@Nama nvarchar(100) = '',
	@Email nvarchar(100) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Option = 1 -- Insert
		INSERT INTO TblM_User (Nama, Email)
		VALUES (@Nama, @Email)
	ELSE IF @Option = 2 -- Update
		UPDATE TblM_User
		SET Nama = @Nama, Email = @Email
		WHERE id = @ID
END
GO
USE [master]
GO
ALTER DATABASE [MyProfile] SET  READ_WRITE 
GO
