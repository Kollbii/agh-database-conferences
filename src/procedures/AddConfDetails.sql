SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE         PROCEDURE [dbo].[AddConfDetails] 
(@ConfID int, 
@Day datetime, 
@Limit int, 
@Price decimal(15,2))
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

	Declare @StartDate datetime = (SELECT StartDate from Conferences WHERE ConfID=@ConfID);
	Declare @EndDate datetime = (SELECT EndDate from Conferences WHERE ConfID=@ConfID);
	IF NOT (@Day < @StartDate and @Day > @EndDate) BEGIN
		; THROW 50001, 'Day is not in days of conferences', 1
		RETURN
	END

    INSERT INTO ConfDetails(ConfID, Day, Limit, Price)
	VALUES (@ConfID, @Day, @Limit, @Price);
	
	COMMIT;
	END TRY
	BEGIN CATCH;
		IF @@TRANCOUNT > 0
			ROLLBACK;
		THROW;
	END CATCH
END
GO

