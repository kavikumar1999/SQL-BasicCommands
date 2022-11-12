/*Error Handling:Abnormal event which stops the query 
abrubtly when the error occurs*/
BEGIN TRY
    SELECT (1/0),(2/2)
END TRY
BEGIN CATCH 
      SELECT 
	  ERROR_MESSAGE() AS ErrorMessage,
	  ERROR_SEVERITY() AS ErrorSeverity,
	  ERROR_STATE() AS ErrorState,
	  ERROR_LINE() AS ErrorLine
END CATCH

/*Try to insert the string value in the integer column(ProductID)*/
BEGIN TRY
	INSERT INTO [kavikumar.murugesan].Product(ProductID,ProductModelID,Name)
	VALUES ('HI',19,'Motor')
END TRY
BEGIN CATCH
    SELECT 
	ERROR_MESSAGE() AS ErrorMessage,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE()AS ErrorState,
	ERROR_LINE() AS ErrorLine
END CATCH