-- Q7
CREATE PROCEDURE sp_inspector_bonus
AS
BEGIN
    DECLARE @maxSumInspectorId INT = (
        SELECT TOP(1) t.inspectorId
        FROM dbo.tickets t
        GROUP BY t.inspectorId
        ORDER BY SUM(t.sum) DESC
    )

    DECLARE @maxCountInspectorId INT = (
        SELECT TOP(1) t.inspectorId
        FROM dbo.tickets t
        GROUP BY t.inspectorId
        ORDER BY COUNT(t.id) DESC
    )

    SELECT ins.firstName + ' ' + ins.lastName AS [full name]
    FROM dbo.inspectors i
    WHERE i.id IN (@maxCountInspectorId, @maxSumInspectorId);
END;
