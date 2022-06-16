SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddWorkshop] 
(@ConfDetailsID int, 
@Topic char(200), 
@Limit int, 
@Price decimal(15,2),
@StartDate datetime,
@EndDate datetime)
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

	DECLARE @DateConf datetime = (SELECT Day FROM ConfDetails WHERE ConfDetailsID=@ConfDetailsID);

	DECLARE @Limit2 int = (SELECT Limit FROM ConfDetails WHERE ConfDetailsID=@ConfDetailsID);
	IF NOT (@Limit<@Limit2) BEGIN
		; THROW 50003, 'Limit on workshop is bigger than limit on conference', 1
		RETURN
	END

    INSERT INTO Workshop(ConfDetailsID, Topic, Limit, Price, StartWorkshop, EndWorkshop)
	VALUES (@ConfDetailsID, @Topic, @Limit, @Price, @StartDate, @EndDate);
	
	COMMIT;
	END TRY
	BEGIN CATCH;
		IF @@TRANCOUNT > 0
			ROLLBACK;
		THROW;
	END CATCH
END
GO

