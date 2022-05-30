INSERT INTO HostDetails(CompanyName, Address, Phone, Country, PostalCode)
VALUES 
('Krakowiaki', 'Bajeczna 17', 654324123, 'PL', 32169),
('Pszczelarze', 'Miodowa 1', 980724123, 'PL', 32163),
('HackAndWild', 'Southern st.', 646542123, 'EN', 32159);


INSERT INTO Customers(Address, Phone, Country, PostalCode)
VALUES ('North st.', 236799000, 'CA', 07655)
INSERT INTO CompanyCustomers(CustomerID, CompanyName)
VALUES (@@IDENTITY, 'MyWorld')

INSERT INTO Customers(Address, Phone, Country, PostalCode)
VALUES ('Reja 22', 776990322, 'PL', 31444)
INSERT INTO CompanyCustomers(CustomerID, CompanyName)
VALUES (@@IDENTITY, 'LifePlants')

INSERT INTO Customers(Address, Phone, Country, PostalCode)
VALUES ('Ochota 733', 883337641, 'PL', 01986)
INSERT INTO CompanyCustomers(CustomerID, CompanyName)
VALUES (@@IDENTITY, 'MolKsiazkowy')

INSERT INTO Customers(Address, Phone, Country, PostalCode)
VALUES ('Live st.', 6363637228, 'USA', 710622)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
VALUES (@@IDENTITY, 'Karol', 'Zamek')

INSERT INTO Customers(Address, Phone, Country, PostalCode)
VALUES ('Cama 12', 115423902, 'ES', 220963)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
VALUES (@@IDENTITY, 'Jane', 'Smith')

INSERT INTO Customers(Address, Phone, Country, PostalCode)
VALUES ('North st.', 236799000, 'CA', 07655)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
VALUES (@@IDENTITY, 'Miguel', 'Gomez')

INSERT INTO Customers(Address, Phone, Country, PostalCode)
VALUES ('Morning st.', 457999000, 'PL', 07835)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
VALUES (@@IDENTITY, 'Michu', 'Keyboards')

INSERT INTO Customers(Address, Phone, Country, PostalCode)
VALUES ('Godnight st.', 976421000, 'PL', 73655)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
VALUES (@@IDENTITY, 'Lukas', 'Pepes')


INSERT INTO Conferences(HostID, ConfName, StartDate, EndDate)
VALUES
(1,'Krakow','2022-06-01 08:00:00', '2022-06-01 13:00:00'),
(3, 'Cybersecurity', '2022-06-01 09:00:00','2022-06-03 16:00:00'),
(2, 'Pszczoly','2022-06-02 08:00:00', '2022-06-02 18:00:00');


INSERT INTO ConfDetails(ConfID, Day, Limit, Price)
VALUES (1, '2022-06-01', 30, 80)
INSERT INTO Workshop(ConfDetailsID, Topic, Limit, Price, StartWorkshop, EndWorkshop)
VALUES
(@@IDENTITY, 'Co zwiedzic w Krakowie?', 20, 0, '2022-06-01 10:00:00', '2022-06-01 11:30:00'),
(@@IDENTITY, 'Historia Krakowa', 10, 35, '2022-06-01 12:00:00',  '2022-06-01 13:00:00')

INSERT INTO ConfDetails(ConfID, Day, Limit, Price)
VALUES (2, '2022-06-01', 50, 130)
INSERT INTO Workshop(ConfDetailsID, Topic, Limit, Price, StartWorkshop, EndWorkshop)
VALUES (@@IDENTITY, 'Crypthography',30, 70, '2022-06-01 10:00:00', '2022-06-01 14:30:00')

INSERT INTO ConfDetails(ConfID, Day, Limit, Price)
VALUES (2, '2022-06-02', 70, 200)
INSERT INTO Workshop(ConfDetailsID, Topic, Limit, Price, StartWorkshop, EndWorkshop)
VALUES (@@IDENTITY, 'IPS', 45, 60, '2022-06-02 08:00:00', '2022-06-02 10:00:00')

INSERT INTO ConfDetails(ConfID, Day, Limit, Price)
VALUES (3, '2022-06-02', 80, 100)
INSERT INTO Workshop(ConfDetailsID, Topic, Limit, Price, StartWorkshop, EndWorkshop)
VALUES (@@IDENTITY, 'Przyszlosc pszczol', 20, 0, '2022-06-02 11:00:00', '2022-06-02 12:00:00')

INSERT INTO ConfDetails(ConfID, Day, Limit, Price)
VALUES (2, '2022-06-03', 100, 160)
INSERT INTO Workshop(ConfDetailsID, Topic, Limit, Price, StartWorkshop, EndWorkshop)
VALUES 
(@@IDENTITY, 'Phishing', 60, 0, '2022-06-03 10:00:00', '2022-06-03 11:45:00'),
(@@IDENTITY, 'SQL injection', 30, 40, '2022-06-03 11:00:00', '2022-06-03 15:00:00')


INSERT INTO Payments(CustomerID, ConfDetailsID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
VALUES 
(7, 1, 1234987545312586, 80, '2022-05-15 10:00:00', 1,0,0,1,null),
(7, 2, 1234987545312586, 50, '2022-05-15 10:00:00', 1,0,0,1,null),
(8, 5, 4567984216574583, 160, '2022-05-15 10:00:00', 1,0,0,1,null),
(2, 4, 7784542671476756, 100, '2022-04-01 10:00:00', 0,1,0,1,null),
(2, 3, 9876542374567784, 130, '2022-04-01 10:00:00', 0, 1, 1, 1, 4), -- Gosc nie podal danych, canceled
(1, 2, 3287445312561234, 200, '2022-05-14 10:00:00', 1, 0, 0, 2, null), -- 2ppl MyWorld 3rd day 
(1, 5, 6798743367831234, 280, '2022-05-14 10:00:00', 1, 0, 1, 2, 7), -- 2ppl 3rd day SQL
(4, 1, 6987438211033333, 80, '2022-05-18 11:00:00', 0, 0, 0, 1, null), -- Single client to pay
(5, 2, 1234253857168765, 130, '2022-05-17 10:00:00', 0, 0, 0, 1, null), -- Ona placi bardzo czesciami 
(4, 1, 6987438211033333, 0, '2022-05-17 11:20:34', 1, 0, 1, 1, 1), -- Karol Zamek 'paid' for free workshop
(3, 3, 4548784268761463, 210, '2022-05-16 05:20:34', 1, 0, 0, 3, null), -- Company for 3 employees for conference 
(3, 3, 4548784268761463, 180, '2022-05-16 05:20:34', 1, 0, 1, 3, 4), -- Company for 3 employees for workshop
(2, 5, 4579315751352859, 500, '2022-05-15 08:53:10', 1, 0, 0, 5, null), -- Company for 5 employees for conference 
(2, 5, 4579315751352859, 200, '2022-05-16 09:00:14', 0, 0, 1, 5, 7); -- Company for 5 employees for workshop


INSERT INTO Participants(Firstname, Lastname)
VALUES ('Karol', 'Zamek')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(1, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 8)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Will', 'Book')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 11)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Alex', 'Mith')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 11)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Jane', 'Smith')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 11)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Mary', 'Love')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 13)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Miguel', 'Gomez')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 13)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Alex', 'Mith')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 13)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Ola', 'Lag')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 13)

INSERT INTO PaymentsHistory(Ammount, PaymentID, PaymentDate)
VALUES 
(80,  1, '2022-05-16 13:00:00'),
(50,  2, '2022-05-18 14:20:10'),
(320,  3, '2022-05-14 13:00:00'),
(80,  4, '2022-05-14 13:00:00'),
(50, 6, '2022-05-17 12:00:00'),
(30, 6, '2022-05-17 14:00:00'),
(50, 6, '2022-05-18 12:00:00');