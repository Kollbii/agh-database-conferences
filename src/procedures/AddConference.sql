SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddConference] 
(@HostID int,
@ConfName char(200),
@StartDate datetime,
@EndDate datetime)
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

    INSERT INTO Conferences(HostID, ConfName, StartDate, EndDate)
	VALUES (@HostID, @ConfName, @StartDate, @EndDate);
	
	COMMIT;
	END TRY
	BEGIN CATCH;
		IF @@TRANCOUNT > 0
			ROLLBACK;
		THROW;
	END CATCH
END
GO

