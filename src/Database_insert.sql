INSERT INTO HostDetails(CompanyName, Address, Phone, Country, PostalCode)
VALUES 
('Krakowiaki', 'Bajeczna 17', 654324123, 'PL', 32169),
('Pszczelarze', 'Miodowa 1', 980724123, 'PL', 32163),
('HackAndWild', 'Southern st.', 646542123, 'EN', 32159);


Insert into Customers(Address, Phone, Country, PostalCode)
Values ('North st.', 236799000, 'CA', 07655)
INSERT INTO CompanyCustomers(CustomerID, CompanyName)
Values (@@IDENTITY, 'MyWorld')

Insert into Customers(Address, Phone, Country, PostalCode)
Values ('Reja 22', 776990322, 'PL', 31444)
INSERT INTO CompanyCustomers(CustomerID, CompanyName)
Values (@@IDENTITY, 'LifePlants')

Insert into Customers(Address, Phone, Country, PostalCode)
Values ('Ochota 733', 883337641, 'PL', 01986)
INSERT INTO CompanyCustomers(CustomerID, CompanyName)
Values (@@IDENTITY, 'MolKsiazkowy')

Insert into Customers(Address, Phone, Country, PostalCode)
Values ('Live st.', 6363637228, 'USA', 710622)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
Values (@@IDENTITY, 'Karol', 'Zamek')

Insert into Customers(Address, Phone, Country, PostalCode)
Values ('Cama 12', 115423902, 'ES', 220963)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
Values (@@IDENTITY, 'Jane', 'Smith')

Insert into Customers(Address, Phone, Country, PostalCode)
Values ('North st.', 236799000, 'CA', 07655)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
Values (@@IDENTITY, 'Miguel', 'Gomez')

Insert into Customers(Address, Phone, Country, PostalCode)
Values ('Morning st.', 457999000, 'PL', 07835)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
Values (@@IDENTITY, 'Michu', 'Keyboards')

Insert into Customers(Address, Phone, Country, PostalCode)
Values ('Godnight st.', 976421000, 'PL', 73655)
INSERT INTO PrivateCustomers(CustomerID, Firstname, Lastname)
Values (@@IDENTITY, 'Lukas', 'Pepes')


Insert Into Conferences(HostID, ConfName, StartDate, EndDate)
Values
(1,'Krakow','2022-06-01 08:00:00', '2022-06-01 13:00:00'),
(3, 'Cybersecurity', '2022-06-01 09:00:00','2022-06-03 16:00:00'),
(2, 'Pszczoly','2022-06-02 08:00:00', '2022-06-02 18:00:00');


Insert into ConfDetails(ConfID, Day, Limit, Price)
values 
(1, '2022-06-01', 30, 80),
(2, '2022-06-01', 50, 130),
(2, '2022-06-02', 70, 200),
(2, '2022-06-03', 100, 160),
(3, '2022-06-02', 80, 100);


Insert into Workshop(ConfID, Topic, Limit, Price, StartWorkshop, EndWorkshop)
values 
(1, 'Co zwiedzic w Krakowie?', 20, 0, '2022-06-01 10:00:00', '2022-06-01 11:30:00'),
(1, 'Historia Krakowa', 15, 35, '2022-06-01 12:00:00',  '2022-06-01 13:00:00'), 
(2, 'Crypthography',30, 70, '2022-06-01 10:00:00', '2022-06-01 14:30:00'),
(2, 'IPS', 45, 60, '2022-06-02 08:00:00', '2022-06-02 10:00:00'),
(3, 'Przyszlosc pszczol', 20, 0, '2022-06-02 11:00:00', '2022-06-02 12:00:00'),
(2, 'Phishing', 60, 0, '2022-06-03 10:00:00', '2022-06-03 11:45:00'),
(2, 'SQL injection', 30, 40, '2022-06-03 11:00:00', '2022-06-03 15:00:00');


insert into Participants(ConfID, CompanyName, Firstname, Lastname)
values 
(1, NULL, 'Karol', 'Zamek'),
(1, 3, 'Will', 'Book'),
(1, 1, 'Alex', 'Mith'),
(2, NULL, 'Jane', 'Smith'),  --Without workshop
(2, 1, 'Mary', 'Love'),
(3, NULL, 'Miguel', 'Gomez'),
(3, 1, 'Alex', 'Mith'),
(3, 1, 'Ola', 'Lag');


insert into WorkshopParticipants(WorkshopID, ParticipantID)
values 
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

insert into Payments(CustomerID, ConfID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
values 
(7, 3, 1234987545312586, 82000, '2022-05-15 10:00:00', 1,0,0,1,null),
(8, 3, 4567984216574583, 62000, '2022-05-15 10:00:00', 1,0,0,1,null),
(2, 3, 7784, 100, '2022-04-01 10:00:00', 0,1,0,1,null),
(2, 3, 7784, 0, '2022-04-01 10:00:00', 0, 1, 1, 1, 5), -- Gosc nie podal danych, canceled
(1, 2, 1234, 160, '2022-05-14 10:00:00', 1, 0, 0, 2, null), -- 2ppl MyWorld 3rd day 
(1, 2, 1234, 40, '2022-05-14 10:00:00', 1, 0, 1, 2, 7), -- 2ppl 3rd day SQL
(4, 1, 3333, 80, '2022-05-18 11:00:00', 0, 0, 0, 1, null), -- Single client to pay
(5, 2, 8765, 200, '2022-05-17 10:00:00', 0, 0, 0, 1, null); -- Ona placi bardzo czesciami 

-- Initial payment with first invoice can be made like Customers followed by @@identity

insert into Invoices( Ammount, PaymentID, PaymentDate)
values 
(82000,  7, '2022-05-16 13:00:00'),
(62000,  8, '2022-05-18 14:20:10'),
(320,  3, '2022-05-14 13:00:00'),
(80,  4, '2022-05-14 13:00:00'),
(50, 6, '2022-05-17 12:00:00'),
(30, 6, '2022-05-17 14:00:00'),
(50, 6, '2022-05-18 12:00:00');