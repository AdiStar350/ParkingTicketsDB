-- Q6
CREATE PROCEDURE sp_avg_appeal_day
AS
BEGIN
    SELECT AVG(DATEDIFF(DAY, t.ticketDate, a.appealDate)) AS [average days for an appeal]
    FROM dbo.appeals a
    JOIN dbo.tickets t
    ON a.ticketId = t.id
END;

EXECUTE dbo.sp_avg_appeal_day;