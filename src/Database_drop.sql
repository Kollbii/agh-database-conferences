-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-14 22:28:53.499

-- foreign keys
ALTER TABLE ConfDetails DROP CONSTRAINT Conferences_ConfDetails;

ALTER TABLE Conferences DROP CONSTRAINT Conferences_HostDetails;

ALTER TABLE Workshop DROP CONSTRAINT Conferences_Workshop;

ALTER TABLE CompanyCustomers DROP CONSTRAINT Customers_CompanyCustomers;

ALTER TABLE PrivateCustomers DROP CONSTRAINT Customers_PrivateCustomers;

ALTER TABLE Invoices DROP CONSTRAINT Invoices_Payments;

ALTER TABLE Participants DROP CONSTRAINT Participants_Conferences;

ALTER TABLE Payments DROP CONSTRAINT Payments_Conferences;

ALTER TABLE Payments DROP CONSTRAINT Payments_Customers;

ALTER TABLE WorkshopParticipatns DROP CONSTRAINT WorkshopParticipants_Participants;

ALTER TABLE WorkshopParticipatns DROP CONSTRAINT WorkshopParticipants_Workshop;

ALTER TABLE Payments DROP CONSTRAINT Workshop_Payments;

-- tables
DROP TABLE CompanyCustomers;

DROP TABLE ConfDetails;

DROP TABLE Conferences;

DROP TABLE Customers;

DROP TABLE HostDetails;

DROP TABLE Invoices;

DROP TABLE Participants;

DROP TABLE Payments;

DROP TABLE PrivateCustomers;

DROP TABLE Workshop;

DROP TABLE WorkshopParticipatns;

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

