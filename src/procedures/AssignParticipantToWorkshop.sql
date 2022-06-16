SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[AssignParticipantToWorkshop] (@Participant int, @Workshop int)
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;
	IF NOT EXISTS(SELECT * FROM DayParticipants WHERE ParticipantID=@Participant)
	BEGIN
		;THROW 50002, 'Participant not included.', 1
		RETURN
	END

	IF NOT EXISTS(SELECT * FROM Workshop WHERE WorkshopID=@Workshop)
	BEGIN
		;THROW 50003, 'Workshop not included.', 1
		RETURN
	END

	DECLARE @available int = ((SELECT Limit FROM Workshop WHERE WorkshopID=@Workshop) - (SELECT Count(*) FROM WorkshopParticipants WHERE WorkshopID=@Workshop))

    IF(@available) <= 0
    BEGIN
        ;THROW 50001, 'Limit reached!', 1
        RETURN
    END


	INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
	VALUES (@Workshop, @Participant);

	COMMIT;
    END TRY
    BEGIN CATCH;
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END
GO

