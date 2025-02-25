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
    ('Adam', 'Adlin', '2024-01-01'),
    ('Jacob', 'Kasa', '2024-02-15'),
    ('Elhanan', 'Badihi', '2024-04-01'),
    ('Guy', 'Hiyaev', '2024-05-01');

-- Q2
INSERT INTO tickets (ticketDate, ticketTime, inspectorId, sum)
VALUES
    ('2025-02-13', '14:00:00', 1, 240.00),
    ('2024-03-16', '13:28:30', 1, 370.50),
    ('2025-01-03', '17:45:01', 1, 1000.00),
    ('2024-05-03', '20:52:03', 1, 500.00),
    ('2024-07-08', '11:23:45', 1, 150.00),
    ('2025-01-10', '14:10:30', 2, 210.00),
    ('2024-04-13', '12:22:24', 2, 170.50),
    ('2024-10-12', '18:35:05', 2, 1250.65),
    ('2024-05-17', '21:58:59', 2, 234.60),
    ('2024-08-12', '09:15:36', 2, 152.23),
    ('2025-01-23', '14:00:00', 3, 240.01),
    ('2024-04-12', '12:18:11', 3, 270.50),
    ('2024-06-05', '14:24:04', 3, 1343.34),
    ('2024-08-01', '22:00:06', 3, 400.00),
    ('2024-11-11', '07:25:00', 3, 325.00),
    ('2025-02-05', '09:12:56', 4, 194.88),
    ('2024-06-02', '10:41:32', 4, 363.50),
    ('2024-08-09', '12:21:32', 4, 1293.00),
    ('2024-12-25', '00:23:03', 4, 523.00),
    ('2024-07-11', '02:10:22', 4, 173.20);

INSERT INTO appeals (appealDate, ticketId, appealInfo)
VALUES
    ('2025-02-24', 1, 'Appeal regarding ticket ID 1, challenging the fine amount.'),
    ('2024-10-02', 2, 'Appeal for ticket ID 2, requesting a reduction in penalty.'),
    ('2025-02-02', 3, 'Appeal related to ticket ID 3, questioning the details of the report.'),
    ('2024-08-21', 4, 'Appeal concerning ticket ID 4, disputing the charges.'),
    ('2024-07-10', 5, 'Appeal for ticket ID 5, arguing the validity of the ticket.'),
    ('2025-02-11', 16, 'Appeal for ticket ID 16, requesting the cancellation of the fine.'),
    ('2024-11-07', 14, 'Appeal regarding ticket ID 14, asking for a review of the decision.'),
    ('2024-12-05', 8, 'Appeal related to ticket ID 8, disputing the amount of the fine.'),
    ('2024-10-09', 10, 'Appeal concerning ticket ID 10, questioning the validity of the citation.'),
    ('2025-01-27', 11, 'Appeal for ticket ID 11, requesting a reconsideration of the fine.'),
    ('2024-05-03', 7, 'Appeal regarding ticket ID 7, challenging the legality of the ticket issued.'),
    ('2024-06-12', 12, 'Appeal related to ticket ID 12, requesting a decrease in the fine amount.');
