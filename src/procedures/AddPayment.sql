SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddPayment] 
(@CustomerID int, 
@ConfDetailsID int,
@BankAccountNumber varchar(16),
@Participants int,
@WorkshopID int)
AS BEGIN
	BEGIN TRY;
	BEGIN TRANSACTION;

	-- if given user exists
    IF NOT EXISTS (SELECT * FROM Customers WHERE CustomerID = @CustomerID) BEGIN
        ;THROW 50001, 'User does not exist', 1
        RETURN 
    END

	-- if conference exists
    IF NOT EXISTS (SELECT * FROM ConfDetails WHERE ConfDetailsID = @ConfDetailsID) BEGIN
        ;THROW 50002, 'Conference does not exist', 1
        RETURN 
    END

	-- if workshop exists
	IF @WorkshopID != Null BEGIN;
		IF NOT EXISTS (SELECT * FROM Workshop WHERE WorkshopID = @WorkshopID) BEGIN
			;THROW 50003, 'Workshop does not exist', 1
			RETURN 
		END
	END

	-- Count free seats for given workshop
	DECLARE @TotalPrice int;
	DECLARE @IsWorkshop bit;
	DECLARE @available int;

	IF @WorkshopID is not Null BEGIN;
		SET @available = ((SELECT Limit FROM Workshop WHERE WorkshopID=@WorkshopID) - (SELECT Count(*) FROM WorkshopParticipants WHERE WorkshopID=@WorkshopID))

		IF (@available) < @Participants
		BEGIN
			;THROW 50004, 'Limit for workshop reached!', 1
			RETURN
		END
		SET @TotalPrice = (SELECT Price FROM Workshop WHERE WorkshopID=@WorkshopID) * @Participants;
		SET @IsWorkshop = 1;
	END

	IF @WorkshopID is Null BEGIN;
		SET @available = ((SELECT Limit FROM ConfDetails WHERE ConfDetailsID=@ConfDetailsID) - (SELECT sum(Participants) FROM Payments WHERE ConfDetailsID=@ConfDetailsID))

		IF (@available) < @Participants
		BEGIN
			;THROW 50005, 'Limit for conference is reached!', 1
			RETURN
		END

		SET @TotalPrice = (SELECT Price FROM ConfDetails WHERE ConfDetailsID=@ConfDetailsID) * @Participants;
		SET @IsWorkshop = 0;
	END

	DECLARE @DuePaymentDate datetime = (
		SELECT DATEADD(d, -14, c.StartDate) FROM ConfDetails cd
		JOIN Conferences c on c.ConfID=cd.ConfID
		WHERE cd.ConfDetailsID=@ConfDetailsID)

    INSERT INTO Payments(CustomerID,
	ConfDetailsID,
	BankAccountNumber,
	TotalPrice,
	PaymentReservationDate,
	IsPaid,
	IsCanceled,
	IsWorkshop,
	Participants,
	WorkshopID)
	VALUES (@CustomerID,
	@ConfDetailsId,
	@BankAccountNumber,
	@TotalPrice,
	@DuePaymentDate,
	0,
	0,
	@IsWorkshop,
	@Participants,
	@WorkshopID);

	COMMIT;
	END TRY
	BEGIN CATCH;
		IF @@TRANCOUNT > 0
			ROLLBACK;
		THROW;
	END CATCH

END
GO

