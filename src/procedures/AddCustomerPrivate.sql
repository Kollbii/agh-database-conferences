SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[AddCustomerPrivate] 
(@Address char(200),
@Phone varchar(15),
@Country varchar(2), 
@PostalCode varchar(7),
@Firstname nvarchar(20), 
@Lastname nvarchar(40))

AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

    INSERT INTO Customers(Address,Phone,Country,PostalCode)
	VALUES (@Address,@Phone,@Country,@postalCode);
	INSERT INTO PrivateCustomers(CustomerID,Firstname,Lastname)
	VALUES (@@IDENTITY,@Firstname,@Lastname);

	COMMIT;
    END TRY
    BEGIN CATCH;
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END
GO

