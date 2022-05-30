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
TODO -> wszystko w dół
Trzeba albo paymenty wstawiać tak jak wyżej ConfDetails z Workshopami i pod nim Payments (Na same potrzeby tych danych testowych)
lub wpisywać i policzyć które ConfDetailsID trzeba tutaj wpisać..
*/
INSERT INTO Payments(CustomerID, ConfDetailsID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
VALUES 
(7, 3, 1234987545312586, 82000, '2022-05-15 10:00:00', 1,0,0,1,null),
(8, 3, 4567984216574583, 62000, '2022-05-15 10:00:00', 1,0,0,1,null),
(2, 3, 7784, 100, '2022-04-01 10:00:00', 0,1,0,1,null),
(2, 3, 7784, 0, '2022-04-01 10:00:00', 0, 1, 1, 1, 5), -- Gosc nie podal danych, canceled
(1, 2, 1234, 160, '2022-05-14 10:00:00', 1, 0, 0, 2, null), -- 2ppl MyWorld 3rd day 
(1, 2, 1234, 40, '2022-05-14 10:00:00', 1, 0, 1, 2, 7), -- 2ppl 3rd day SQL
(4, 1, 3333, 80, '2022-05-18 11:00:00', 0, 0, 0, 1, null), -- Single client to pay
(5, 2, 8765, 200, '2022-05-17 10:00:00', 0, 0, 0, 1, null); -- Ona placi bardzo czesciami 

/*
Dodawanie participantów: najpierw payment i workshop musi istnieć -> 
wpisać participantów (imie, nazwisko)
równolegle z wpisem participanta robić wpis do DayParticipants i WorkshopParticipants:
przykład zakładając, że istnieje payment i workshop:

INSERT INTO Participants(Firstname, Lastname)
VALUES ('Karol', 'Zamek')
INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES (1, @@IDENTITY)
INSERT INTO DayParticipants(ParticipantID, PaymentID)
VALUES (@@IDENTITY, 1)

*/
INSERT INTO Participants(Firstname, Lastname)
VALUES 
('Karol', 'Zamek'),
('Will', 'Book'),
('Alex', 'Mith'),
('Jane', 'Smith'),
('Mary', 'Love'),
('Miguel', 'Gomez'),
('Alex', 'Mith'),
('Ola', 'Lag');


INSERT INTO WorkshopParticipants(WorkshopID, ParticipantID)
VALUES 
(3, 1),
(1, 1),
(2, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 6), 
(6, 7),
(6, 8),
(7, 8); 


INSERT INTO PaymentsHistory(Ammount, PaymentID, PaymentDate)
VALUES 
(82000,  7, '2022-05-16 13:00:00'),
(62000,  8, '2022-05-18 14:20:10'),
(320,  3, '2022-05-14 13:00:00'),
(80,  4, '2022-05-14 13:00:00'),
(50, 6, '2022-05-17 12:00:00'),
(30, 6, '2022-05-17 14:00:00'),
(50, 6, '2022-05-18 12:00:00');