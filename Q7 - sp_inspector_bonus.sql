-- Q7
CREATE PROCEDURE sp_inspector_bonus
AS
BEGIN
    SELECT ins.firstName + ' ' + ins.lastName AS [full name]
    FROM dbo.inspectors ins
    WHERE
        ins.firstName + ' ' + ins.lastName = (
            SELECT TOP(1)
                i.firstName + ' ' + i.lastName
            FROM dbo.tickets t
            JOIN dbo.inspectors i
            ON i.id = t.inspectorId
            GROUP BY i.firstName + ' ' + i.lastName
            ORDER BY SUM(t.sum) DESC
        ) OR ins.firstName + ' ' + ins.lastName = (
            SELECT TOP(1)
                i.firstName + ' ' + i.lastName
            FROM dbo.tickets t
            JOIN dbo.inspectors i
            ON i.id = t.inspectorId
            GROUP BY i.firstName + ' ' + i.lastName
            ORDER BY COUNT(t.id) DESC
        )
END;

EXECUTE dbo.sp_inspector_bonus;