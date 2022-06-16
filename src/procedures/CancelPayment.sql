SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[CancelPayment] (@PaymentID int)
AS BEGIN
	BEGIN TRY;
    BEGIN TRANSACTION;
        -- if payment exists
        IF NOT EXISTS (SELECT * FROM Payments WHERE PaymentID = @PaymentID) BEGIN
            ;THROW 50001, 'Payment does not exist', 1
            RETURN 
        END

        -- if payment is already paid
        IF 1 = (SELECT IsPaid FROM Payments WHERE PaymentID = @PaymentID) BEGIN
            ;THROW 50002, 'Payment is already paid', 1
            RETURN 
        END

        -- if payment was canceled
        IF 1 = (SELECT IsCanceled FROM Payments WHERE PaymentID = @PaymentID) BEGIN
            ;THROW 50003, 'Payment is already canceled', 1
            RETURN;
        END

        -- set payment as canceled
        UPDATE Payments SET IsCanceled = 1 WHERE PaymentID = @PaymentID

		COMMIT;
		END TRY
		BEGIN CATCH;
			IF @@TRANCOUNT > 0
				ROLLBACK;
			THROW;
		END CATCH
END
GO

