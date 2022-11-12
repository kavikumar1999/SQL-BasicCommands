/*Re-runnable script for the Address table*/
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='kavikumar.murugesan' AND TABLE_NAME='Address')
 BEGIN
	CREATE TABLE [kavikumar.murugesan].[Address](
		[AddressID] [int] NOT NULL,
		[AddressLine1] [nvarchar](60) NOT NULL,
		[AddressLine2] [nvarchar](60) NULL,
		[City] [nvarchar](30) NOT NULL,
		[StateProvince] [nvarchar](50) NOT NULL,
		[CountryRegion] [nvarchar](50) NOT NULL,
		[PostalCode] [nvarchar](15) NOT NULL
	) 
	PRINT 'Address table created successfully'
 END
ELSE
 BEGIN
    PRINT 'Address table already exists'
 END
