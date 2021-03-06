/*
   Wednesday, October 30, 20138:31:36 AM
   User: 
   Server: PERF-CTRL
   Database: Recon
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Application
	(
	ID int NOT NULL IDENTITY (1, 1),
	HostName varchar(50) NULL,
	IPAddress varchar(50) NULL,
	Application varchar(50) NULL,
	ApplicationBuildDate datetime NULL,
	ApplicationBuildDefinition varchar(100) NULL,
	ApplicationFileToInspect varchar(255) NULL,
	ApplicationVersion varchar(50) NULL,
	CHMApplicationBuildDate datetime NULL,
	CHMApplicationBuildDefinition varchar(100) NULL,
	CHMApplicationFileToInspect varchar(255) NULL,
	CHMApplicationFolder varchar(255) NULL,
	CHMApplicationVersion varchar(50) NULL,
	ContentVersions varchar(100) NULL,
	DBType varchar(50) NULL,
	InstallDir varchar(100) NULL,
	PatchesApplied varchar(100) NULL,
	URL varchar(100) NULL,
	Inserted datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Application ADD CONSTRAINT
	PK_Application PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Application SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Application', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Application', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Application', 'Object', 'CONTROL') as Contr_Per 