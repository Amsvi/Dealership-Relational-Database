Use master;
GO

CREATE DATABASE [NormanDealership]
GO

USE NormanDealership;
GO

DROP TABLE IF EXISTS dbo.Location;
GO
--Location table 
CREATE TABLE dbo.Location
	(
	LocationID int NOT NULL IDENTITY (1, 1),
	StreetAddress varchar(100) NOT NULL,
	City varchar(50) NOT NULL,
	Province varchar(50) NOT NULL,
	PostalCode varchar(10) NOT NULL
	) ON [PRIMARY]
GO
ALTER TABLE dbo.Location ADD CONSTRAINT
	PK_Location PRIMARY KEY CLUSTERED 
	(
	LocationID
	) ON [PRIMARY]
GO

DROP TABLE IF EXISTS dbo.Person;
GO
--Person table 
CREATE TABLE dbo.Person
	(
	PersonID int NOT NULL IDENTITY (1000, 1),
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Telephone varchar(20) NULL,
	Email varchar(100) NULL,
	PerLocID int NOT NULL,
	DateofBirth date NULL,
	Title char(3) NULL
	) ON [PRIMARY]
GO
ALTER TABLE dbo.Person ADD CONSTRAINT
	PK_Person PRIMARY KEY CLUSTERED 
	(
	PersonID
	) ON [PRIMARY]
GO

ALTER TABLE dbo.Person ADD CONSTRAINT [CK_Person_Title] CHECK (Title IS NULL OR Title IN('Mr', 'Ms', 'Mrs'))
GO

ALTER TABLE dbo.Person CHECK CONSTRAINT [CK_Person_Title]
GO



--We can search by first name for Example Amir to access the information of that row.   
CREATE NONCLUSTERED INDEX [NCI_Person_FirstName] ON dbo.Person
(
	FirstName ASC
)
GO
--We can search by Last name for Example Mousavi to access the information of that row.  
CREATE NONCLUSTERED INDEX [NCI_Person_LastName] ON dbo.Person
(
	LastName ASC
)
GO

DROP TABLE IF EXISTS dbo.Dealership;
GO
--Dealership table 
CREATE TABLE dbo.Dealership
	(
	DealershipID int NOT NULL IDENTITY (1, 1),
	LocationID int NOT NULL,
	[Name] varchar(50) NOT NULL,
	Phone varchar(20) NOT NULL
	) ON [PRIMARY]
GO
ALTER TABLE dbo.Dealership ADD CONSTRAINT
	PK_Dealership PRIMARY KEY CLUSTERED 
	(
	DealershipID
	) ON [PRIMARY]
GO

DROP TABLE IF EXISTS dbo.Customer;
GO

CREATE TABLE dbo.Customer
	(
	CustomerID int NOT NULL,
	RegistrationDate datetime NOT NULL
	) ON [PRIMARY]
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	PK_Customer PRIMARY KEY CLUSTERED 
	(
	CustomerID
	) ON [PRIMARY]
GO

DROP TABLE IF EXISTS dbo.Employee;
GO
