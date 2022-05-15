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

