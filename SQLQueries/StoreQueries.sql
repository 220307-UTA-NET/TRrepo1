CREATE SCHEMA Store;
GO;

CREATE TABLE Store.Customers (
    [Customer ID] INT IDENTITY (10000,1) NOT NULL PRIMARY KEY,
    [First Name] NVARCHAR (255) NOT NULL,
    [Last Name] NVARCHAR (255),
    [Phone] VARCHAR (15),
    [Address Line 1] VARCHAR (255),
    [Address Line 2] VARCHAR (255),
    [City] VARCHAR (255),
    [State] VARCHAR (255),
    [Country] VARCHAR (255),
    [Zip/Region Code] VARCHAR (255),
    [email] VARCHAR (255),
    [Home Store] INT NOT NULL DEFAULT 1
);

CREATE TABLE Store.Orders (
    [Order Number] INT IDENTITY (1000000,1) NOT NULL PRIMARY KEY,
    [Customer ID] INT NOT NULL FOREIGN KEY REFERENCES Store.Customers ([Customer ID]),
    [Order PLaced] DATETIME NOT NULL DEFAULT GETDATE(),
    [Order Picked Up] DATETIME,
);

CREATE TABLE Store.Items(
    [Item ID] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [Item Name] NVARCHAR (255),
    [Item Description] NVARCHAR (255),
    [Price] DECIMAL (19,2) NOT NULL 

);

CREATE TABLE Store.Location(
    [Location ID] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [Phone] VARCHAR (15),
    [Zip/Region Code] VARCHAR (255),
    [Item 1 Inv] INT NOT NULL DEFAULT 0,
    [Item 2 Inv] INT NOT NULL DEFAULT 0,
    [Item 3 Inv] INT NOT NULL DEFAULT 0,
    [Item 4 Inv] INT NOT NULL DEFAULT 0,
    [Item 5 Inv] INT NOT NULL DEFAULT 0
);

CREATE TABLE Store.OrderContents(
    [Order Iterant] INT IDENTITY (1,1) PRIMARY KEY,
    [Order Number] INT NOT NULL FOREIGN KEY REFERENCES Store.Orders ([Order Number]),
    [Item ID] INT NOT NULL FOREIGN KEY REFERENCES Store.Items ([Item ID]),
    [Quantity] INT NOT NULL

);
GO
ALTER TABLE Store.Customers
ADD FOREIGN KEY ([Home Store]) REFERENCES Store.Location ([Location ID]);

ALTER TABLE Store.Customers
DROP CONSTRAINT ([Home Store]) REFERENCES Store.Location ([Location ID])

DROP TABLE Store.OrderContents;
DROP TABLE Store.Items;
DROP TABLE Store.Orders;
DROP TABLE Store.Customers;
DROP TABLE Store.Location;

SELECT * FROM Store.OrderContents;
SELECT * FROM Store.Orders;
SELECT * FROM Store.Items;
SELECT * FROM Store.Customers;
SELECT * FROM Store.Location;

INSERT INTO Store.Location ([Phone], [Zip/Region Code])
    VALUES ('(651)555-1122', '55414'),
    ('(763)555-2022', '55418'),
    ('(212)555-1024', '13142'),
    ('(507)555-2048', '61616'),
    ('(612)555-4096', '90210');

INSERT INTO Store.Customers ([First Name],[Last Name], [Home Store])
    VALUES ('Jeff', 'Johnson', 1),
    ('Isaac', 'Isaacson', 1),
    ('Aaron', 'Aaronson', 2),
    ('Arik', 'Bjornicus', 3),
    ('Tom', 'Everyman', 5);

INSERT INTO Store.Customers ([First Name])
    VALUES ('Cher');

INSERT INTO Store.Items ([Item Name], [Item Description], [Price])
    VALUES ('Master Sword', 'Only a true hero can wield this blade (and not any of that Pendragon BS)', 2222.22),
    ('Honda Metropolitan 50cc', 'Where are you going? Hopefully not on any highways... unless you absolutely had to and thank goodness it was super late at night.', 1500.22),
    ('E-Bike', 'A repo bicycle with a power drill driving the front wheel (w/o remote toggle)', 1499.22),
    ('Wusthof Chef''s Knife', 'This thing is sharp, take good care to keep it that way.', 300.22),
    ('Dragon Slayer', 'A sword so big, you''d wonder why is it so big? Who could even weild it? Some guy named Guts?', 1);

INSERT INTO Store.Orders ([Customer ID])
    VALUES (10000),(10001),(10002),(10003),(10004),(10005),(10000);

INSERT INTO Store.OrderContents ([Order Number], [Item ID], [Quantity])

