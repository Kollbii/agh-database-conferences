SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddParticipant] 
(@FirstName char(200), 
@LastName char(200),
@Phone char(15),
@PaymentID int)
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

    INSERT INTO Participants(Firstname, Lastname, Phone)
	VALUES (@FirstName, @LastName, @Phone);
	INSERT INTO DayParticipants(ParticipantID, PaymentID)
	VALUES (@@IDENTITY, @PaymentID)

	COMMIT;
    END TRY
    BEGIN CATCH;
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END
GO

