-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-25 19:06:38.85

-- foreign keys
USE u_kollbek

ALTER TABLE ConfDetails DROP CONSTRAINT Conferences_ConfDetails;

ALTER TABLE Conferences DROP CONSTRAINT Conferences_HostDetails;

ALTER TABLE CompanyCustomers DROP CONSTRAINT Customers_CompanyCustomers;

ALTER TABLE PrivateCustomers DROP CONSTRAINT Customers_PrivateCustomers;

ALTER TABLE DayParticipants DROP CONSTRAINT DayParticipants_Participants;

ALTER TABLE DayParticipants DROP CONSTRAINT DayParticipants_Payments;

ALTER TABLE PaymentsHistory DROP CONSTRAINT Invoices_Payments;

ALTER TABLE Payments DROP CONSTRAINT Payments_ConfDetails;

ALTER TABLE Payments DROP CONSTRAINT Payments_Customers;

ALTER TABLE WorkshopParticipants DROP CONSTRAINT WorkshopParticipatns_Participants;

ALTER TABLE WorkshopParticipants DROP CONSTRAINT WorkshopParticipatns_Workshop;

ALTER TABLE Workshop DROP CONSTRAINT Workshop_ConfDetails;

ALTER TABLE Payments DROP CONSTRAINT Workshop_Payments;

-- tables
DROP TABLE CompanyCustomers;

DROP TABLE ConfDetails;

DROP TABLE Conferences;

DROP TABLE Customers;

DROP TABLE DayParticipants;

DROP TABLE HostDetails;

DROP TABLE Participants;

DROP TABLE Payments;

DROP TABLE PaymentsHistory;

DROP TABLE PrivateCustomers;

DROP TABLE Workshop;

DROP TABLE WorkshopParticipants;

-- sequences
DROP SEQUENCE CompanyCustomers_seq;

DROP SEQUENCE ConfDetails_seq;

DROP SEQUENCE Conferences_seq;

DROP SEQUENCE Customers_seq;

DROP SEQUENCE HostDetails_seq;

DROP SEQUENCE Participants_seq;

DROP SEQUENCE Payments_seq;

DROP SEQUENCE PrivateCustomers_seq;

DROP SEQUENCE Reservations_seq;

DROP SEQUENCE Workshop_seq;

-- End of file.

