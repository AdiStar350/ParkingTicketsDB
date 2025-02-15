-- Q4
CREATE PROCEDURE sp_ticket_cnt_by_inspector_2024
AS
BEGIN
    SELECT
        i.firstName + ' ' + i.lastName AS [inspector name],
        COUNT(t.id) AS [amount of tickets in 2024]
    FROM dbo.tickets t
    JOIN dbo.inspectors i
    ON t.inspectorId = i.id
    WHERE DATEPART(YEAR, t.ticketDate) = '2024'
    GROUP BY i.firstName + ' ' + i.lastName
END;


EXECUTE dbo.sp_ticket_cnt_by_inspector_2024;
