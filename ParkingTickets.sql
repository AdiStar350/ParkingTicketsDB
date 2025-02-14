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

œ
