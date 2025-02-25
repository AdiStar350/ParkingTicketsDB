CREATE FUNCTION fn_appeal_date_to_date(@fromDate DATE, @toDate DATE)
RETURNS TABLE
AS
RETURN (
    SELECT
        a.ticketId,
        t.ticketDate,
        i.firstName + ' ' + i.lastName AS [full name],
        t.sum,
        a.appealInfo
    FROM dbo.appeals a
    JOIN dbo.tickets t
    ON a.ticketId = t.id
    JOIN dbo.inspectors i
    ON t.inspectorId = i.id
    WHERE a.appealDate BETWEEN @fromDate AND @toDate
);