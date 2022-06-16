SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE       PROCEDURE [dbo].[CheckPaymentsDate]
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

	DECLARE @PaymentIdList TABLE(id INT NOT NULL);
	BEGIN 
		INSERT INTO @PaymentIdList select PaymentID from Payments WHERE IsPaid=0 AND IsCanceled=0
	END

	declare @id int = (select TOP 1 PaymentID from Payments WHERE IsPaid=0 AND IsCanceled=0)
    declare @totalrows int = (select count(*) from Payments WHERE IsPaid=0)
    declare @currentrow int = 0
    declare @reservationday date

    while @currentrow <  @totalrows  
    begin 
        
        set @reservationday = (SELECT PaymentReservationDate FROM Payments WHERE PaymentID=@id)
        IF (@reservationday <= GETDATE()) BEGIN;
			SELECT @id
			SELECT 'Reservation with PaymentID=' + (SELECT CAST(@id as varchar)) + ' is outdated and is automatically canceled.'
			EXEC dbo.CancelPayment @id
		END

		DELETE FROM @PaymentIdList WHERE id=@id;
		set @id = (select TOP 1 id from @PaymentIdList)

        set @currentrow = @currentrow +1
    end  

	COMMIT;
	END TRY
	BEGIN CATCH;
		IF @@TRANCOUNT > 0
			ROLLBACK;
		THROW;
	END CATCH

END
GO

