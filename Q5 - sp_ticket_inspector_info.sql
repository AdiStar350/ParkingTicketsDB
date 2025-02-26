-- Q5
CREATE PROCEDURE sp_ticket_inspector_info
AS
BEGIN
    SELECT
        i.id AS [inspector id],
        i.firstName AS [inspector first name],
        i.lastName AS [inspector last name],
        t.id AS [ticket id],
        t.ticketDate AS [date],
        t.sum AS [amount]
    FROM dbo.inspectors i
    JOIN dbo.tickets t
    ON t.inspectorId = i.id
    ORDER BY i.firstName, i.lastName, t.ticketDate;
END;
