USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'DockerTesting')
 BEGIN
CREATE DATABASE [DockerTesting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DockerTesting', FILENAME = N'C:\DockerTesting.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DockerTesting_log', FILENAME = N'C:\DockerTesting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = N'DockerTesting')
 BEGIN
ALTER DATABASE [DockerTesting] SET COMPATIBILITY_LEVEL = 140
END
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = N'DockerTesting')
 BEGIN
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DockerTesting].[dbo].[sp_fulltext_database] @action = 'enable'
end
END
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = N'DockerTesting')
 BEGIN
ALTER DATABASE [DockerTesting] SET AUTO_SHRINK OFF 
END
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = N'DockerTesting')
 BEGIN
ALTER DATABASE [DockerTesting] SET  MULTI_USER 
END
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = N'DockerTesting')
 BEGIN
ALTER DATABASE [DockerTesting] SET  READ_WRITE 
END
GO

use [DockerTesting]
IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'FirstTable'))
BEGIN
CREATE TABLE [dbo].[FirstTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Count] [int] NULL,
 CONSTRAINT [PK_FirstTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
 
 INSERT INTO dbo.FirstTable ([Count]) VALUES (1)
END
GO

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'FirstTable'))
BEGIN
 INSERT INTO dbo.FirstTable ([Count]) VALUES ((select MAX([Count]) from dbo.FirstTable) +1)
END
