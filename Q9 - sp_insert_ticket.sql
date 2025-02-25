CREATE PROCEDURE sp_insert_ticket
    @inspectorId INT,
    @sum MONEY
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        IF @inspectorId NOT IN (SELECT i.id FROM dbo.inspectors i) BEGIN
            RAISERROR('Inspector ID must exist in inspectors table.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF @sum < 150 BEGIN
            RAISERROR('Minimum sum for ticket is 150.00', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        INSERT INTO dbo.tickets (inspectorId, sum)
        VALUES (@inspectorId, @sum);

        COMMIT TRANSACTION;
        PRINT 'Ticket inserted successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while inserting the ticket.';
        PRINT ERROR_MESSAGE();
        ROLLBACK TRANSACTION;
    END CATCH
END;

EXECUTE dbo.sp_insert_ticket @inspectorId = 2, @sum = 1200;

