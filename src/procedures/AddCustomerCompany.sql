SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddCustomerCompany] 
(@Address char(200),
@Phone varchar(15),
@Country varchar(2),
@PostalCode varchar(7),
@CompanyName nvarchar(200))
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

    INSERT INTO Customers(Address,Phone,Country,PostalCode)
	VALUES (@Address,@Phone,@Country,@postalCode);
	INSERT INTO CompanyCustomers(CustomerID,CompanyName)
	VALUES (@@IDENTITY,@CompanyName);

	COMMIT;
	END TRY
	BEGIN CATCH;
		IF @@TRANCOUNT > 0
			ROLLBACK;
		THROW;
	END CATCH
END
GO

