-- Copying all the required tables from Source DataBase to Work DataBase

--All this sould be done only In Work Database
CREATE DATABASE SCOPED CREDENTIAL DBCredentials 
WITH IDENTITY = 'detraining',
      SECRET ='iLinkIs*No01';

/*In WorkDatabase(training001) external data source created with the name of adventuresDB*/
CREATE EXTERNAL DATA SOURCE adventureworksDB
WITH 
(
	TYPE=RDBMS, -----Relational Database Management System
	LOCATION='ilinkdetrainingserver.database.windows.net', ---Server name,
	DATABASE_NAME='adventureworks',   ---source database
	CREDENTIAL=DBCredentials     ---The name we gave to our DATABASE SCOPED CREDENTIAL.
);

/*Let's create External table in training001(Work Database)*/

-------External Product Table-------
BEGIN TRY
	CREATE EXTERNAL TABLE [kavikumar.murugesan].[Product_Ext]
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
	  SCHEMA_NAME='SalesLT',
	  OBJECT_NAME='Product'
	);
END TRY
BEGIN CATCH
     SELECT 
		 ERROR_MESSAGE() AS ErronMessage,
		 ERROR_LINE() AS ErrorLine,
		 ERROR_SEVERITY() AS ErrorProcedure,
		 ERROR_STATE() AS ErrorState
END CATCH
---Copying table from External to Tables in training001
SELECT * INTO [kavikumar.murugesan].[Product] FROM [training001].[kavikumar.murugesan].[Product_Ext]

-------External customer Table---------
CREATE EXTERNAL TABLE [kavikumar.murugesan].[Customer_Ext]
(
		[CustomerID] [int] NOT NULL,
		[NameStyle] [bit] NOT NULL,
		[Title] [nvarchar](8) NULL,
		[FirstName] [nvarchar](50) NOT NULL,
		[MiddleName] [nvarchar](50) NULL,
		[LastName] [nvarchar](50) NOT NULL,
		[Suffix] [nvarchar](10) NULL,
		[CompanyName] [nvarchar](128) NULL,
		[SalesPerson] [nvarchar](256) NULL,
		[EmailAddress] [nvarchar](50) NULL,
		[Phone] [nvarchar](25) NULL,
		[PasswordHash] [varchar](128) NOT NULL,
		[PasswordSalt] [varchar](10) NOT NULL,
		[rowguid] [uniqueidentifier] NOT NULL,
		[ModifiedDate] [datetime] NOT NULL
) 
WITH 
(
  DATA_SOURCE= adventureworksDB,
  SCHEMA_NAME='SalesLT',
  OBJECT_NAME='Customer'
);

---Copying table from External to Tables in training001
SELECT * INTO [kavikumar.murugesan].[Customer] FROM [training001].[kavikumar.murugesan].[Customer_Ext]


--------External CustomerAddress Table---------
CREATE EXTERNAL TABLE [kavikumar.murugesan].[CustomerAddress_Ext]
(
		[CustomerID] [int] NOT NULL,
		[AddressID] [int] NOT NULL,
		[AddressType] [nvarchar](50) NOT NULL,
		[rowguid] [uniqueidentifier] NOT NULL,
		[ModifiedDate] [datetime] NOT NULL
)
WITH 
(
  DATA_SOURCE= adventureworksDB,
  SCHEMA_NAME='SalesLT',
  OBJECT_NAME='CustomerAddress'
);

---Copying table from External to Tables in training001
SELECT * INTO [kavikumar.murugesan].[CustomerAddress] FROM [training001].[kavikumar.murugesan].[CustomerAddress_Ext]


---------External Address Table-----------------
CREATE EXTERNAL TABLE [kavikumar.murugesan].[Address_Ext]
(
		[AddressID] [int] NOT NULL,
		[AddressLine1] [nvarchar](60) NOT NULL,
		[AddressLine2] [nvarchar](60) NULL,
		[City] [nvarchar](30) NOT NULL,
		[StateProvince] [nvarchar](50) NOT NULL,
		[CountryRegion] [nvarchar](50) NOT NULL,
		[PostalCode] [nvarchar](15) NOT NULL
) 
WITH 
(
  DATA_SOURCE= adventureworksDB,
  SCHEMA_NAME='SalesLT',
  OBJECT_NAME='Address'
);

---Copying table from External to Tables in training001
SELECT * INTO [kavikumar.murugesan].[Address] FROM [training001].[kavikumar.murugesan].[Address_Ext]


----------External ProductCategory Table-----------
CREATE EXTERNAL TABLE [kavikumar.murugesan].[ProductCategory_Ext]
(
		[ProductCategoryID] [int] NOT NULL,
		[ParentProductCategoryID] [int] NULL,
		[Name] [nvarchar](50) NOT NULL,
		[rowguid] [uniqueidentifier] NOT NULL,
		[ModifiedDate] [datetime] NOT NULL
)
WITH 
(
  DATA_SOURCE= adventureworksDB,
  SCHEMA_NAME='SalesLT',
  OBJECT_NAME='ProductCategory'
);

---Copying table from External to Tables in training001
SELECT * INTO [kavikumar.murugesan].[ProductCategory] FROM [training001].[kavikumar.murugesan].[ProductCategory_Ext]

-----------External ProductAndDescription Table-------------
CREATE EXTERNAL TABLE [kavikumar.murugesan].[ProductAndDescription_Ext]
(
		[ProductID] [int] NOT NULL,
		[Name] [nvarchar](50) NOT NULL,
		[ProductModel] [nvarchar](50) NOT NULL,
		[Culture] [nchar](6) NOT NULL,
		[Description] [nvarchar](400) NOT NULL
) 
WITH 
(
  DATA_SOURCE= adventureworksDB,
  SCHEMA_NAME='SalesLT',
  OBJECT_NAME='vProductAndDescription'
)

---Copying table from External to Tables in training001
SELECT * INTO [kavikumar.murugesan].[ProductAndDescription] FROM [training001].[kavikumar.murugesan].[ProductAndDescription_Ext]
------------External SalesOrderHeader Table-------------------

CREATE EXTERNAL TABLE [kavikumar.murugesan].[SalesOrderHeader_Ext]
(
		[SalesOrderID] [int] NOT NULL,
		[RevisionNumber] [tinyint] NOT NULL,
		[OrderDate] [datetime] NOT NULL,
		[DueDate] [datetime] NOT NULL,
		[ShipDate] [datetime] NULL,
		[Status] [tinyint] NOT NULL,
		[OnlineOrderFlag] [bit] NOT NULL,
		[SalesOrderNumber] [nvarchar](25) NOT NULL,
		[PurchaseOrderNumber] [nvarchar](25) NULL,
		[AccountNumber] [nvarchar](15) NULL,
		[CustomerID] [int] NOT NULL,
		[ShipToAddressID] [int] NULL,
		[BillToAddressID] [int] NULL,
		[ShipMethod] [nvarchar](50) NOT NULL,
		[CreditCardApprovalCode] [varchar](15) NULL,
		[SubTotal] [money] NOT NULL,
		[TaxAmt] [money] NOT NULL,
		[Freight] [money] NOT NULL,
		[TotalDue] [money] NOT NULL,
		[Comment] [nvarchar](max) NULL,
		[rowguid] [uniqueidentifier] NOT NULL,
		[ModifiedDate] [datetime] NOT NULL
)
WITH
(

  DATA_SOURCE= adventureworksDB,
  SCHEMA_NAME='SalesLT',
  OBJECT_NAME='SalesOrderHeader'
)

---Copying table from External to Tables in training001
SELECT * INTO [kavikumar.murugesan].[SalesOrderHeader] FROM [training001].[kavikumar.murugesan].[SalesOrderHeader_Ext]

----------External SalesOrderDetail Table-----------
CREATE EXTERNAL TABLE [kavikumar.murugesan].[SalesOrderDetail_Ext]
(
	[SalesOrderID] [int] NOT NULL,
	[SalesOrderDetailID] [int] NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitPriceDiscount] [money] NOT NULL,
	[LineTotal] [numeric](38, 6) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
)
WITH
(

  DATA_SOURCE= adventureworksDB,
  SCHEMA_NAME='SalesLT',
  OBJECT_NAME='SalesOrderDetail'
)

---Copying table from External to Tables in training001
SELECT * INTO [kavikumar.murugesan].[SalesOrderDetail] FROM [training001].[kavikumar.murugesan].[SalesOrderDetail_Ext]




	

