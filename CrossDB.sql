-- Copying all the required tables from Source DataBase to Work DataBase

--All this sould be done only In Work Database
CREATE DATABASE SCOPED CREDENTIAL DBCredentials 
WITH IDENTITY = 'UserName(AzureDB)',
      SECRET ='Password';

/*In WorkDatabase external data source created with the name of adventuresDB*/
CREATE EXTERNAL DATA SOURCE adventureworksDB
WITH 
(
	TYPE=RDBMS, -----Relational Database Management System
	LOCATION='Server Name', ---Server name,
	DATABASE_NAME='SourceDB',   ---The name of the source database
	CREDENTIAL=DBCredentials     ---The name we gave to our DATABASE SCOPED CREDENTIAL.
);

/*Let's create External table in Work Database*/

-------External Product Table-------
BEGIN TRY
	CREATE EXTERNAL TABLE [kavikumar.murugesan].[Product_Ext] ----Sample data
	(
		[ProductID] [int] NOT NULL,
		[Name] [nvarchar](50) NOT NULL,
		[ProductNumber] [nvarchar](25) NOT NULL,
		[Color] [nvarchar](15) NULL,
		[StandardCost] [money] NOT NULL,
		[ListPrice] [money] NOT NULL,
		[Size] [nvarchar](5) NULL,
		[Weight] [decimal](8, 2) NULL,
		[ProductCategoryID] [int] NULL,
		[ProductModelID] [int] NULL,
		[SellStartDate] [datetime] NOT NULL,
		[SellEndDate] [datetime] NULL,
		[DiscontinuedDate] [datetime] NULL,
		[ThumbNailPhoto] [varbinary](max) NULL,
		[ThumbnailPhotoFileName] [nvarchar](50) NULL,
		[rowguid] [uniqueidentifier] NOT NULL,
		[ModifiedDate] [datetime] NOT NULL
	) 
	WITH 
	(
	  DATA_SOURCE= adventureworksDB,
	  SCHEMA_NAME='Source Table Schema Name',
	  OBJECT_NAME='Source Table Name'
	);
END TRY
BEGIN CATCH
     SELECT 
		 ERROR_MESSAGE() AS ErronMessage,
		 ERROR_LINE() AS ErrorLine,
		 ERROR_SEVERITY() AS ErrorProcedure,
		 ERROR_STATE() AS ErrorState
END CATCH
---Copying table from External to Tables in Work DB
SELECT * INTO [kavikumar.murugesan].[Product] FROM [Work DataBase].[kavikumar.murugesan].[Product_Ext]