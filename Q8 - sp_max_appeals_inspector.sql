-- Q8
CREATE PROCEDURE sp_max_appeals_inspector
AS
BEGIN
    SELECT TOP(1)
        i.firstName,
        i.lastName
    FROM dbo.appeals a
    JOIN dbo.tickets t
    ON a.ticketId = t.id
    JOIN dbo.inspectors i
    ON t.inspectorId = i.id
    GROUP BY i.firstName, i.lastName
    ORDER BY COUNT(a.id) DESC;
END;
