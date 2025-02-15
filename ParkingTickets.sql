-- Q1
CREATE DATABASE ParkingTickets;

CREATE TABLE inspectors (
    id INT PRIMARY KEY IDENTITY(1, 1),
    firstName VARCHAR(20) NOT NULL DEFAULT 'John',
    lastName VARCHAR(20) NOT NULL DEFAULT 'Doe',
    hireDate DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE)
);

CREATE TABLE tickets (
    id INT PRIMARY KEY IDENTITY(1, 1),
    ticketDate DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    ticketTime TIME NOT NULL DEFAULT CAST(GETDATE() AS TIME),
    inspectorId INT FOREIGN KEY REFERENCES inspectors(id),
    sum MONEY NOT NULL DEFAULT 350,
    CHECK(sum >= 150)
);

CREATE TABLE appeals (
    id INT PRIMARY KEY IDENTITY(1, 1),
    appealDate DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    ticketId INT FOREIGN KEY REFERENCES tickets(id),
    appealInfo VARCHAR(250) NOT NULL
);

INSERT INTO inspectors (firstName, lastName, hireDate)
VALUES 
    ('Adam', 'Adlin', '20240101'),
    ('Jacob', 'Kasa', '20240215'),
    ('Elhanan', 'Badihi', '20240401'),
    ('Guy', 'Hiyaev', '20240501');

-- Q2
INSERT INTO tickets (ticketDate, ticketTime, inspectorId, sum)
VALUES
    ('20250213', '14:00:00', 1, 240.00),
    ('20240316', '13:28:30', 1, 370.50),
    ('20250103', '17:45:01', 1, 1000.00),
    ('20240503', '20:52:03', 1, 500.00),
    ('20240708', '11:23:45', 1, 150.00),
    ('20250110', '14:10:30', 2, 210.00),
    ('20240413', '12:22:24', 2, 170.50),
    ('20241012', '18:35:05', 2, 1250.65),
    ('20240517', '21:58:59', 2, 234.60),
    ('20240812', '09:15:36', 2, 152.23),
    ('20250123', '14:00:00', 3, 240.01),
    ('20240412', '12:18:11', 3, 270.50),
    ('20240605', '14:24:04', 3, 1343.34),
    ('20240801', '22:00:06', 3, 400.00),
    ('20241111', '07:25:00', 3, 325.00),
    ('20250205', '09:12:56', 4, 194.88),
    ('20240602', '10:41:32', 4, 363.50),
    ('20240809', '12:21:32', 4, 1293.00),
    ('20241225', '00:23:03', 4, 523.00),
    ('20240711', '02:10:22', 4, 173.20);



INSERT INTO appeals (appealDate, ticketId, appealInfo)
VALUES
('20241001', 1, 'Appeal regarding ticket ID 1, challenging the fine amount.'),
('20241002', 2, 'Appeal for ticket ID 2, requesting a reduction in penalty.'),
('20241003', 3, 'Appeal related to ticket ID 3, questioning the details of the report.'),
('20241004', 4, 'Appeal concerning ticket ID 4, disputing the charges.'),
('20241005', 5, 'Appeal for ticket ID 5, arguing the validity of the ticket.'),
('20241006', 16, 'Appeal for ticket ID 16, requesting the cancellation of the fine.'),
('20241007', 14, 'Appeal regarding ticket ID 14, asking for a review of the decision.'),
('20241008', 8, 'Appeal related to ticket ID 8, disputing the amount of the fine.'),
('20241009', 10, 'Appeal concerning ticket ID 10, questioning the validity of the citation.'),
('20241010', 11, 'Appeal for ticket ID 11, requesting a reconsideration of the fine.'),
('20241011', 7, 'Appeal regarding ticket ID 7, challenging the legality of the ticket issued.'),
('20241012', 12, 'Appeal related to ticket ID 12, requesting a decrease in the fine amount.');




-- SELECT * FROM appeals
SELECT * from appeals

INSERT INTO tickets (ticketDate, ticketTime, inspectorId, sum)
VALUES
('20230212', '17:30:00', 1, 190.00)


-- q3
SELECT COUNT(t.id) as totalTickets ,SUM(t.sum) as tickets2024
from tickets t
WHERE ticketDate like '2024%'


-- q4
SELECT i.firstName , i.lastName ,COUNT(t.id)
FROM inspectors i
INNER JOIN  tickets t on t.inspectorId = i.id
WHERE ticketDate like '2024%'
GROUP BY i.firstName,i.lastName


-- q5
-- CREATE view inspectorInfo  AS
-- SELECT i.firstName.i.lastName,COUNT(t.sum) 
-- from inspectors i
-- INNER JOIN  tickets t on t.inspectorId = i.id
-- OR ticketDate like '2024%'
-- GROUP BY i.firstName,i.lastName


-- CREATE PROCEDURE inspectorInfo AS 
-- SELECT i.firstName, i.lastName, COUNT(t.id) AS totalTickets, SUM(t.sum) AS totalSum
-- FROM inspectors i
-- INNER JOIN tickets t ON t.inspectorId = i.id
-- WHERE t.ticketDate LIKE '2024%'
-- GROUP BY i.firstName, i.lastName
-- GO;



CREATE PROCEDURE inspectorInfo AS
SELECT 
    i.firstName, 
    i.lastName, 
    COUNT(t.id) AS totalTickets, 
    SUM(t.sum) AS totalSum
FROM inspectors i
INNER JOIN tickets t ON t.inspectorId = i.id
WHERE CAST(t.ticketDate AS VARCHAR) LIKE '2024%'  -- or use `t.ticketDate BETWEEN '2024-01-01' AND '2024-12-31'`
GROUP BY i.firstName, i.lastName;

