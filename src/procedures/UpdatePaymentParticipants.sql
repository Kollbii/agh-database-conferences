SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[UpdatePaymentParticipants] 
(@PaymentID int, 
@Participants int)
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

	DECLARE @IsWorkshop int = (SELECT IsWorkshop FROM Payments WHERE PaymentID=@PaymentID);
	DECLARE @available int;
	DECLARE @ConfDetailsID int = (SELECT ConfDetailsID FROM Payments WHERE PaymentID=@PaymentID);
	DECLARE @TotalPrice int;

	IF (@IsWorkshop != 0) BEGIN;
		SET @available = ((SELECT Limit FROM Workshop WHERE WorkshopID=@IsWorkshop) - (SELECT Count(*) FROM WorkshopParticipants WHERE WorkshopID=@IsWorkshop))

		IF (@available) < @Participants
		BEGIN
			;THROW 50004, 'Limit for workshop reached!', 1
			RETURN
		END
		SET @TotalPrice = (SELECT Price FROM Workshop WHERE WorkshopID=@IsWorkshop) * @Participants;
	END

	IF (@IsWorkshop = 0) BEGIN;
		SELECT @TotalPrice
		SET @available = ((SELECT Limit FROM ConfDetails WHERE ConfDetailsID=@ConfDetailsID) - (SELECT sum(Participants) FROM Payments WHERE ConfDetailsID=@ConfDetailsID))

		IF (@available) < @Participants
		BEGIN
			;THROW 50005, 'Limit for conference is reached!', 1
			RETURN
		END

		SET @TotalPrice = (SELECT Price FROM ConfDetails WHERE ConfDetailsID=@ConfDetailsID) * @Participants;
	END

	UPDATE Payments 
	SET Participants=@Participants,
	TotalPrice=@TotalPrice
	WHERE PaymentID=@PaymentID;

	COMMIT;
    END TRY
    BEGIN CATCH;
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END
GO

