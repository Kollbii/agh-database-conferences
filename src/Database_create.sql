-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-25 19:06:38.85

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
    Limit int CHECK (Limit >= 0) NOT NULL,
    Price decimal(15,2) CHECK (Price >= 0) NULL,
    CONSTRAINT ConfDetails_pk PRIMARY KEY  (ConfDetailsID)
);

-- Table: Conferences
CREATE TABLE Conferences (
    ConfID int  NOT NULL IDENTITY(1,1),
    HostID int  NOT NULL,
    ConfName char(200)  NOT NULL,
    StartDate datetime  NOT NULL,
    EndDate datetime CHECK ( EndDate > StartDate) NOT NULL,
    CONSTRAINT Conferences_pk PRIMARY KEY  (ConfID)
);

-- Table: Customers
CREATE TABLE Customers (
    CustomerID int  NOT NULL IDENTITY(1,1),
    Address char(200)  NOT NULL,
    Phone varchar(15) CHECK (Phone >= 0) NOT NULL,
    Country varchar(60)  NOT NULL,
    PostalCode varchar(50) CHECK (PostalCode >= 0) NOT NULL,
    CONSTRAINT Customers_pk PRIMARY KEY  (CustomerID)
);

-- Table: DayParticipants
CREATE TABLE DayParticipants (
    DayParticipantID int NOT NULL,
    ParticipantID int  NOT NULL,
    PaymentID int  NOT NULL,
    CONSTRAINT DayParticipants_pk PRIMARY KEY  (DayParticipantID)
);

-- Table: HostDetails
CREATE TABLE HostDetails (
    HostID int  NOT NULL IDENTITY(1,1),
    CompanyName char(200)  NOT NULL,
    Address varchar(200)  NOT NULL,
    Phone varchar(15) CHECK (Phone >= 0) NOT NULL,
    Country varchar(60)  NOT NULL,
    PostalCode varchar(50) CHECK (PostalCode >= 0) NOT NULL,
    CONSTRAINT HostDetails_pk PRIMARY KEY  (HostID)
);

-- Table: Participants
CREATE TABLE Participants (
    ParticipantID int  NOT NULL  IDENTITY(1,1),
    Firstname char(200)  NOT NULL,
    Lastname char(200)  NOT NULL,
    CONSTRAINT Participants_pk PRIMARY KEY  (ParticipantID)
);

-- Table: Payments
CREATE TABLE Payments (
    PaymentID int  NOT NULL  IDENTITY(1,1),
    CustomerID int  NOT NULL,
    ConfDetailsID int  NOT NULL,
    BankAccountNumber varchar(16) CHECK (BankAccountNumber >= 0) NOT NULL,
    TotalPrice money CHECK (TotalPrice >= 0) NOT NULL,
    PaymentReservationDate datetime  NOT NULL,
    IsPaid bit  NOT NULL,
    IsCanceled bit  NOT NULL,
    IsWorkshop bit  NOT NULL,
    Participants int CHECK (Participants >= 0) NOT NULL,
    WorkshopID int  NOT NULL,
    CONSTRAINT Payments_pk PRIMARY KEY  (PaymentID)
);

-- Table: PaymentsHistory
CREATE TABLE PaymentsHistory (
    HistoryID int  NOT NULL IDENTITY(1,1),
    Ammount money CHECK (Ammount >= 0) NOT NULL,
    PaymentID int  NOT NULL,
    PaymentDate datetime  NOT NULL,
    CONSTRAINT PaymentsHistory_pk PRIMARY KEY  (HistoryID)
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
    ConfDetailsID int  NOT NULL,
    Topic char(200)  NOT NULL,
    Limit int CHECK (Limit >= 0) NOT NULL,
    Price decimal(15,2) CHECK (Price >= 0) NULL,
    StartWorkshop datetime NOT NULL,
    EndWorkshop datetime CHECK (EndWorkshop > StartWorkshop NOT NULL,
    CONSTRAINT Workshop_pk PRIMARY KEY  (WorkshopID)
);

-- Table: WorkshopParticipants
CREATE TABLE WorkshopParticipants (
    WorkshopParticipantID int  NOT NULL IDENTITY(1,1),
    WorkshopID int  NOT NULL,
    ParticipantID int  NOT NULL,
    CONSTRAINT WorkshopParticipants_pk PRIMARY KEY  (WorkshopParticipantID)
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

-- Reference: Customers_CompanyCustomers (table: CompanyCustomers)
ALTER TABLE CompanyCustomers ADD CONSTRAINT Customers_CompanyCustomers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: Customers_PrivateCustomers (table: PrivateCustomers)
ALTER TABLE PrivateCustomers ADD CONSTRAINT Customers_PrivateCustomers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: DayParticipants_Participants (table: DayParticipants)
ALTER TABLE DayParticipants ADD CONSTRAINT DayParticipants_Participants
    FOREIGN KEY (ParticipantID)
    REFERENCES Participants (ParticipantID);

-- Reference: DayParticipants_Payments (table: DayParticipants)
ALTER TABLE DayParticipants ADD CONSTRAINT DayParticipants_Payments
    FOREIGN KEY (PaymentID)
    REFERENCES Payments (PaymentID);

-- Reference: Invoices_Payments (table: PaymentsHistory)
ALTER TABLE PaymentsHistory ADD CONSTRAINT Invoices_Payments
    FOREIGN KEY (PaymentID)
    REFERENCES Payments (PaymentID);

-- Reference: Payments_ConfDetails (table: Payments)
ALTER TABLE Payments ADD CONSTRAINT Payments_ConfDetails
    FOREIGN KEY (ConfDetailsID)
    REFERENCES ConfDetails (ConfDetailsID);

-- Reference: Payments_Customers (table: Payments)
ALTER TABLE Payments ADD CONSTRAINT Payments_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: WorkshopParticipatns_Participants (table: WorkshopParticipants)
ALTER TABLE WorkshopParticipants ADD CONSTRAINT WorkshopParticipatns_Participants
    FOREIGN KEY (ParticipantID)
    REFERENCES Participants (ParticipantID);

-- Reference: WorkshopParticipatns_Workshop (table: WorkshopParticipants)
ALTER TABLE WorkshopParticipants ADD CONSTRAINT WorkshopParticipatns_Workshop
    FOREIGN KEY (WorkshopID)
    REFERENCES Workshop (WorkshopID);

-- Reference: Workshop_ConfDetails (table: Workshop)
ALTER TABLE Workshop ADD CONSTRAINT Workshop_ConfDetails
    FOREIGN KEY (ConfDetailsID)
    REFERENCES ConfDetails (ConfDetailsID);

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
