SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE       PROCEDURE [dbo].[PartialPayment] 
(@PaymentID int, 
@Ammount money)
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

	-- if payment exists
    IF NOT EXISTS (SELECT * FROM Payments WHERE PaymentID = @PaymentID) BEGIN
        ;THROW 50001, 'Payment does not exist', 1
        RETURN 
    END

	-- if payment is canceled exists
    IF 1= (SELECT IsCanceled FROM Payments WHERE PaymentID = @PaymentID) BEGIN
        ;THROW 50002, 'Payment is canceled. Can not update payment.', 1
        RETURN 
    END

	-- if ammount of money is less than 0 exists
    IF @Ammount <= 0 BEGIN
        ;THROW 50003, 'You can not make blank payment', 1
        RETURN 
    END

	-- insert payment
	INSERT INTO PaymentsHistory(Ammount, PaymentID, PaymentDate)
	VALUES (@Ammount, @PaymentID, GETDATE())

	-- check if whole payment is paid
	DECLARE @ToPay int = (
	SELECT MAX(TotalPrice)-SUM(Ammount) FROM payments as p
	JOIN PaymentsHistory ph on p.paymentID = ph.paymentID
	WHERE p.PaymentID=@PaymentID)

	-- excess amount of money is considered as donation :)
	IF @ToPay <= 0 BEGIN;
		UPDATE Payments SET IsPaid=1 WHERE PaymentID=@PaymentID
	END

	COMMIT;
	END TRY
	BEGIN CATCH;
		IF @@TRANCOUNT > 0
			ROLLBACK;
		THROW;
	END CATCH

END
GO

