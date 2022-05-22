-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-14 22:28:53.499

-- tables
-- Table: CompanyCustomers
CREATE TABLE CompanyCustomers (
    CustomerID int  NOT NULL,
    CompanyName nvarchar(64)  NOT NULL,
    CONSTRAINT CompanyCustomers_pk PRIMARY KEY  (CustomerID)
);

-- Table: ConfDetails
CREATE TABLE ConfDetails (
    ConfDetailsID int  NOT NULL IDENTITY(1,1),
    ConfID int  NOT NULL,
    Day date  NOT NULL,
    Limit int  NOT NULL,
    Price decimal(15,2)  NULL,
    CONSTRAINT ConfDetails_pk PRIMARY KEY  (ConfDetailsID)
);

-- Table: Conferences
CREATE TABLE Conferences (
    ConfID int  NOT NULL IDENTITY(1,1),
    HostID int  NOT NULL,
    ConfName char(200)  NOT NULL,
    StartDate datetime  NOT NULL,
    EndDate datetime  NOT NULL,
    CONSTRAINT Conferences_pk PRIMARY KEY  (ConfID)
);

-- Table: Customers
CREATE TABLE Customers (
    CustomerID int  NOT NULL IDENTITY(1,1),
    Address char(200)  NOT NULL,
    Phone varchar(15)  NOT NULL,
    Country varchar(60)  NOT NULL,
    PostalCode varchar(50)  NOT NULL,
    CONSTRAINT Customers_pk PRIMARY KEY  (CustomerID)
);

-- Table: HostDetails
CREATE TABLE HostDetails (
    HostID int  NOT NULL IDENTITY(1,1),
    CompanyName char(200)  NOT NULL,
    Address varchar(200)  NOT NULL,
    Phone varchar(15)  NOT NULL,
    Country varchar(60)  NOT NULL,
    PostalCode varchar(50)  NOT NULL,
    CONSTRAINT HostDetails_pk PRIMARY KEY  (HostID)
);

-- Table: Invoices
CREATE TABLE Invoices (
    InvoiceID int  NOT NULL IDENTITY(1,1),
    Ammount money  NOT NULL,
    PaymentID int  NOT NULL,
    PaymentDate datetime  NOT NULL,
    CONSTRAINT Invoices_pk PRIMARY KEY  (InvoiceID)
);

-- Table: Participants
CREATE TABLE Participants (
    ParticipantID int  NOT NULL IDENTITY(1,1),
    ConfID int  NOT NULL,
    CompanyName char(200)  NULL,
    Firstname char(200)  NOT NULL,
    Lastname char(200)  NOT NULL,
    CONSTRAINT Participants_pk PRIMARY KEY  (ParticipantID)
);

-- Table: Payments
CREATE TABLE Payments (
    PaymentID int  NOT NULL IDENTITY(1,1),
    CustomerID int  NOT NULL,
    ConfID int  NOT NULL,
    BankAccountNumber varchar(16)  NOT NULL,
    TotalPrice money  NOT NULL,
    PaymentReservationDate datetime  NOT NULL,
    IsPaid bit  NOT NULL,
    IsCanceled bit  NOT NULL,
    IsWorkshop bit  NOT NULL,
    Participants int  NOT NULL,
    WorkshopID int	NULL,
    CONSTRAINT Payments_pk PRIMARY KEY  (PaymentID)
);

-- Table: PrivateCustomers
CREATE TABLE PrivateCustomers (
    CustomerID int  NOT NULL,
    Firstname nvarchar(64)  NOT NULL,
    Lastname nvarchar(64)  NOT NULL,
    CONSTRAINT PrivateCustomers_pk PRIMARY KEY  (CustomerID)
);

-- Table: Workshop
CREATE TABLE Workshop (
    WorkshopID int  NOT NULL IDENTITY(1,1),
    ConfID int  NOT NULL,
    Topic char(200)  NOT NULL,
    Limit int  NOT NULL,
    Price decimal(15,2)  NULL,
    StartWorkshop datetime  NOT NULL,
    EndWorkshop datetime  NOT NULL,
    CONSTRAINT Workshop_pk PRIMARY KEY  (WorkshopID)
);

-- Table: WorkshopParticipatns
CREATE TABLE WorkshopParticipants (
    WorkshopID int  NOT NULL,
    ParticipantID int  NOT NULL
);

-- foreign keys
-- Reference: Conferences_ConfDetails (table: ConfDetails)
ALTER TABLE ConfDetails ADD CONSTRAINT Conferences_ConfDetails
    FOREIGN KEY (ConfID)
    REFERENCES Conferences (ConfID);

-- Reference: Conferences_HostDetails (table: Conferences)
ALTER TABLE Conferences ADD CONSTRAINT Conferences_HostDetails
    FOREIGN KEY (HostID)
    REFERENCES HostDetails (HostID);

-- Reference: Conferences_Workshop (table: Workshop)
ALTER TABLE Workshop ADD CONSTRAINT Conferences_Workshop
    FOREIGN KEY (ConfID)
    REFERENCES Conferences (ConfID);

-- Reference: Customers_CompanyCustomers (table: CompanyCustomers)
ALTER TABLE CompanyCustomers ADD CONSTRAINT Customers_CompanyCustomers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: Customers_PrivateCustomers (table: PrivateCustomers)
ALTER TABLE PrivateCustomers ADD CONSTRAINT Customers_PrivateCustomers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: Invoices_Payments (table: Invoices)
ALTER TABLE Invoices ADD CONSTRAINT Invoices_Payments
    FOREIGN KEY (PaymentID)
    REFERENCES Payments (PaymentID);

-- Reference: Participants_Conferences (table: Participants)
ALTER TABLE Participants ADD CONSTRAINT Participants_Conferences
    FOREIGN KEY (ConfID)
    REFERENCES Conferences (ConfID);

-- Reference: Payments_Conferences (table: Payments)
ALTER TABLE Payments ADD CONSTRAINT Payments_Conferences
    FOREIGN KEY (ConfID)
    REFERENCES Conferences (ConfID);

-- Reference: Payments_Customers (table: Payments)
ALTER TABLE Payments ADD CONSTRAINT Payments_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: WorkshopParticipants_Participants (table: WorkshopParticipants)
ALTER TABLE WorkshopParticipants ADD CONSTRAINT WorkshopParticipants_Participants
    FOREIGN KEY (ParticipantID)
    REFERENCES Participants (ParticipantID);

-- Reference: WorkshopParticipants_Workshop (table: WorkshopParticipants)
ALTER TABLE WorkshopParticipants ADD CONSTRAINT WorkshopParticipants_Workshop
    FOREIGN KEY (WorkshopID)
    REFERENCES Workshop (WorkshopID);

-- Reference: Workshop_Payments (table: Payments)
ALTER TABLE Payments ADD CONSTRAINT Workshop_Payments
    FOREIGN KEY (WorkshopID)
    REFERENCES Workshop (WorkshopID);

-- sequences
-- Sequence: CompanyCustomers_seq
CREATE SEQUENCE CompanyCustomers_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: ConfDetails_seq
CREATE SEQUENCE ConfDetails_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Conferences_seq
CREATE SEQUENCE Conferences_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Customers_seq
CREATE SEQUENCE Customers_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: HostDetails_seq
CREATE SEQUENCE HostDetails_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Participants_seq
CREATE SEQUENCE Participants_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Payments_seq
CREATE SEQUENCE Payments_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: PrivateCustomers_seq
CREATE SEQUENCE PrivateCustomers_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Reservations_seq
CREATE SEQUENCE Reservations_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Workshop_seq
CREATE SEQUENCE Workshop_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

