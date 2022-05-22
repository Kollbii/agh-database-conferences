INSERT INTO HostDetails(CompanyName, Address, Phone, Country, PostalCode)
VALUES 
('Krakowiaki', 'Bajeczna 17', 654324123, 'PL', 32169),
('Pszczelarze', 'Miodowa 1', 980724123, 'PL', 32163),
('HackAndWild', 'Southern st.', 646542123, 'EN', 32159);

Insert into Customers(CustomerID, Address, Phone, Country, PostalCode)
Values 
(1, 'North st.', 236799000, 'CA', 07655),
(3, 'Plant st.', 636727278, 'EN', 13882),
(5, 'Reja 22', 776990322, 'PL', 31444),
(2, 'Ochota 733', 883337641, 'PL', 01986),
(4, 'Live st.', 6363637228, 'USA', 710622),
(6, 'Cama 12', 115423902, 'ES', 220963);

INSERT INTO CompanyCustomers(CompanyName)
Values
('MyWorld'),
('LifePlants'),
('MolKsiazkowy');

Insert Into PrivateCustomers(Firstname, Lastname)
Values
('Karol', 'Zamek'),
('Jane', 'Smith'),
('Miguel', 'Gomez');

Insert Into Conferences(HostID, ConfName, StartDate, EndDate)
Values
(1,'Krakow','2022-06-01 08:00:00', '2022-06-01 13:00:00'),
(3, 'Cybersecurity', '2022-06-01 09:00:00','2022-06-03 16:00:00'), --confid = 2
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
(1, 'Historia Krakowa', 2, 35, '2022-06-01 12:00:00',  '2022-06-01 13:00:00'), 
(2, 'Crypthography',30, 70, '2022-06-01 10:00:00', '2022-06-01 14:30:00'),
(2, 'IPS', 45, 60, '2022-06-02 08:00:00', '2022-06-02 10:00:00'),
(3, 'Przyszlosc pszczol', 20, 0, '2022-06-02 11:00:00', '2022-06-02 12:00:00'),
(2, 'Phishing', 60, 0, '2022-06-03 10:00:00', '2022-06-03 11:45:00'),
(2, 'SQL injection', 30, 40, '2022-06-03 11:00:00', '2022-06-03 15:00:00');

--od tego miejsca nowe rzeczy

insert into Participants(ConfID, CompanyName, Firstname, Lastname)
values 
--czy tuatj nie powinno byc odniesienia do customers?
(1, NULL, 'Karol', 'Zamek'),
(1, 3, 'Will', 'Book'),
(1, 1, 'Alex', 'Mith'),
(2, NULL, 'Jane', 'Smith'),  --ona nie ma zadnego workshopu
(2, 1, 'Mary', 'Love'),
(2, 2, null, null), --nie uzupe³niony na czas
(3, NULL, 'Miguel', 'Gomez'),
(3, 1, 'Alex', 'Mith'),
(3, 1, 'Ola', 'Lag');

insert into WorkshopParticipatns(WorkshopID, ParticipantID)
values 
(1, 1),
(2, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 6), 
(6, 7),
(6, 8),
(7, 8), --tutaj pytanie jak robimy z nak³adajacymi sie workshopami
(7, 9); -- aby by³y dwie osoby z tej samej firmy na jeden workshop 


--o nie czy ja tez musze kazda ta osobe wprowadzic do payments bo niby zrobi³a rezerwacje?
-- bo jak tak to bedzie trzeba to troche odchudzic -> your help
insert into Payments(CustomerID, ConfID, BankAccountNumber, TotalPrice, PaymentReservationDate, IsPaid, IsCanceled, IsWorkshop, Participants, WorkshopID)
values 
(2, 3, 7784, 100, '2022-04-01 10:00:00', 0,1,0,1,null),
(2, 3, 7784, 0, '2022-04-01 10:00:00', 0, 1, 1, 1, 5), -- gosc nie podal danych, canceled
(1, 2, 1234, 160, '2022-05-14 10:00:00', 1, 0, 0, 2, null), -- za dwie osoby z myword na 3 dzien 
(1, 2, 1234, 40, '2022-05-14 10:00:00', 1, 0, 1, 2, 7), --zap³ata za 2 osoby na 3 dzien na sql
(4, 1, 3333, 80, '2022-05-18 11:00:00', 0, 0, 0, 1, null), --pojedynczy klient, ma jeszcze czas do zaplaty,
(5, 2, 8765, 200, '2022-05-17 10:00:00', 0, 0, 0, 1, null); --ona placi bardzo czesciami 

insert into Invoices( Ammount, PaymentID, PaymentDate)
values 
(320,  3, '2022-05-14 13:00:00'),
(80,  4, '2022-05-14 13:00:00'),
(50, 6, '2022-05-17 12:00:00'), --kilka jej platnosci i nie do konca 
(30, 6, '2022-05-17 14:00:00'),
(50, 6, '2022-05-18 12:00:00');
