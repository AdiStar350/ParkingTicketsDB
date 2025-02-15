-- Q3
CREATE PROCEDURE sp_ticket_cnt_and_sum_2024
AS
BEGIN
    SELECT
        COUNT(t.id) AS [amount of tickets in 2024],
        SUM(t.sum) AS [sum of money from the tickets]
    FROM dbo.tickets t
    WHERE DATEPART(YEAR, t.ticketDate) = '2024'
END;


EXECUTE dbo.sp_ticket_cnt_and_sum_2024;