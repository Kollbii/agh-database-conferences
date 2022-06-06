USE u_kollbek

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

/*
INSERT INTO Payments(CustomerID, ConfDetailsID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
VALUES 
(4, 1, 6987438211033333, 0, '2022-05-17 11:20:34', 1, 0, 1, 1, 1), -- Karol Zamek 'paid' for free workshop
(3, 3, 4548784268761463, 210, '2022-05-16 05:20:34', 1, 0, 0, 3, null), -- Company for 3 employees for conference 
(3, 3, 4548784268761463, 180, '2022-05-16 05:20:34', 1, 0, 1, 3, 4), -- Company for 3 employees for workshop
(2, 5, 4579315751352859, 500, '2022-05-15 08:53:10', 1, 0, 0, 5, null), -- Company for 5 employees for conference 
(2, 5, 4579315751352859, 200, '2022-05-16 09:00:14', 0, 0, 1, 5, 7); -- Company for 5 employees for workshop
*/

INSERT INTO Payments(CustomerID, ConfDetailsID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
VALUES (4, 1, 6987438211033333, 0, '2022-05-17 11:20:34', 1, 0, 1, 1, 1)
INSERT INTO PaymentsHistory(Ammount, PaymentID, PaymentDate)
VALUES (0,@@IDENTITY,'2022-05-17 11:22:34')

INSERT INTO Payments(CustomerID, ConfDetailsID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
VALUES (3, 3, 4548784268761463, 210, '2022-05-16 05:20:34', 1, 0, 0, 3, null)
INSERT INTO PaymentsHistory(Ammount, PaymentID, PaymentDate)
VALUES (210,@@IDENTITY,'2022-05-16 05:22:34')

INSERT INTO Payments(CustomerID, ConfDetailsID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
VALUES (3, 3, 4548784268761463, 180, '2022-05-16 05:20:34', 1, 0, 1, 3, 4)
INSERT INTO PaymentsHistory(Ammount, PaymentID, PaymentDate)
VALUES	(100,@@IDENTITY,'2022-05-16 05:22:34'),
		(80,@@IDENTITY,'2022-05-16 08:22:34')

INSERT INTO Payments(CustomerID, ConfDetailsID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
VALUES (2, 5, 4579315751352859, 500, '2022-05-15 08:53:10', 1, 0, 0, 5, null)
INSERT INTO PaymentsHistory(Ammount, PaymentID, PaymentDate)
VALUES (500,@@IDENTITY,'2022-05-15 09:53:10')

INSERT INTO Payments(CustomerID, ConfDetailsID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
VALUES (2, 5, 4579315751352859, 200, '2022-05-16 09:00:14', 0, 0, 1, 5, 7)
INSERT INTO PaymentsHistory(Ammount, PaymentID, PaymentDate)
VALUES (200,@@IDENTITY,'2022-05-16 09:20:14')

select * from DayParticipants

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Karol', 'Zamek')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(1, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID) 
VALUES 
(@@IDENTITY, 1)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Will', 'Book')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 3)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Alex', 'Mith')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 3)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Jane', 'Smith')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 3)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Mary', 'Love')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 5)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Miguel', 'Gomez')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 5)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Alex', 'Mith')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 5)

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Ola', 'Lag')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(4, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES 
(@@IDENTITY, 5)
