-- Start by adding necessary columns to the existing tables
ALTER TABLE Customers
ADD (
    discountPercents INT,
    expirationDate DATE
);

ALTER TABLE Orders
ADD (
    isSold CHAR(1) DEFAULT 'N' CHECK (isSold IN ('Y', 'N')) NOT NULL
);

ALTER TABLE Meal
RENAME TO mealOrTicket;

ALTER TABLE mealOrTicket
ADD (
    Genre VARCHAR2(100),
    Rating INT,
    Duration INT,
    ReleaseDate DATE
);

-- Create new tables from the second database
CREATE TABLE Dates1 (
    DateID NUMERIC(3) PRIMARY KEY,
    HourH VARCHAR2(100) NOT NULL,
    DayD VARCHAR2(100) NOT NULL,
    DateD DATE NOT NULL
);

CREATE TABLE Theaters1 (
    TheaterID NUMERIC(3) PRIMARY KEY,
    TheaterName VARCHAR2(100) NOT NULL,
    Capacity INT NOT NULL
);

CREATE TABLE Schedules1 (
    ScheduleID NUMERIC(3) PRIMARY KEY,
    TheaterID NUMERIC(3) NOT NULL,
    AvailableSeats INT NOT NULL,
    mealOrTicketID INT NOT NULL,
    DateID NUMERIC(3) NOT NULL,
    FOREIGN KEY (mealOrTicketID) REFERENCES mealOrTicket(mealID),
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID),
    FOREIGN KEY (DateID) REFERENCES Dates(DateID)
);

-- Update existing data with default or null values
UPDATE Customers
SET discountPercents = 0, expirationDate = NULL;

-- Create new relationships
ALTER TABLE Orders
ADD (
    ScheduleID NUMERIC(3),
    FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID)
);

-- Insert data from the second database 
INSERT INTO Dates1 (DateID, HourH, DayD, DateD) VALUES (1, '12:00', 'Monday', TO_DATE('2023-07-10', 'YYYY-MM-DD'));

INSERT INTO Theaters1 (TheaterID, TheaterName, Capacity) VALUES (1, 'Main Theater', 150);

INSERT INTO Schedules1 (ScheduleID, TheaterID, AvailableSeats, mealOrTicketID, DateID) VALUES (1, 1, 100, 1, 1);





















-- For reference purposes, original table creation scripts

-- CREATE TABLE Workers
-- (
--     workerID INT NOT NULL,
--     workName VARCHAR2(20) NOT NULL,
--     workerJobTitle VARCHAR2(20) NOT NULL,
--     workerSalary INT NOT NULL,
--     workerBirthDate DATE NOT NULL,
--     PRIMARY KEY (workerID)
-- );

-- CREATE TABLE Providers
-- (
--     provName VARCHAR2(20) NOT NULL,
--     provPhoneNumber VARCHAR2(20) NOT NULL,
--     provID INT NOT NULL,
--     PRIMARY KEY (provID),
--     UNIQUE (provPhoneNumber)
-- );

-- CREATE TABLE Customers
-- (
--     custPhoneNumber VARCHAR2(20) NOT NULL,
--     custName VARCHAR2(20) NOT NULL,
--     custAddress VARCHAR2(20) NOT NULL,
--     custID INT NOT NULL,
--     PRIMARY KEY (custID),
--     UNIQUE (custPhoneNumber)
-- );

-- CREATE TABLE Product
-- (
--     prodID INT NOT NULL,
--     prodName VARCHAR2(20) NOT NULL,
--     prodPrice INT NOT NULL,
--     prodAmount INT NOT NULL,
--     provID INT NOT NULL,
--     PRIMARY KEY (prodID),
--     FOREIGN KEY (provID) REFERENCES Providers(provID),
--     UNIQUE (prodName)
-- );

-- CREATE TABLE mealOrTicket
-- (
--     mealID INT NOT NULL,
--     mealName VARCHAR2(20) NOT NULL,
--     mealPrice INT NOT NULL,
--     Genre VARCHAR2(100),
--     Rating INT,
--     Duration INT,
--     ReleaseDate DATE,
--     PRIMARY KEY (mealID),
--     UNIQUE (mealName)
-- );

-- CREATE TABLE Orders
-- (
--     orderID INT NOT NULL,
--     orderPrice INT NOT NULL,
--     orderStatus VARCHAR2(20) NOT NULL,
--     orderDate DATE NOT NULL,
--     custID INT NOT NULL,
--     isSold CHAR(1) DEFAULT 'N' CHECK (isSold IN ('Y', 'N')) NOT NULL,
--     ScheduleID NUMERIC(3),
--     PRIMARY KEY (orderID),
--     FOREIGN KEY (custID) REFERENCES Customers(custID),
--     FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID)
-- );

-- CREATE TABLE WorkerOrder
-- (
--     workerID INT NOT NULL,
--     orderID INT NOT NULL,
--     PRIMARY KEY (workerID, orderID),
--     FOREIGN KEY (workerID) REFERENCES Workers(workerID),
--     FOREIGN KEY (orderID) REFERENCES Orders(orderID)
-- );

-- CREATE TABLE mealOrder
-- (
--     mealAmount INT NOT NULL,
--     mealID INT NOT NULL,
--     orderID INT NOT NULL,
--     PRIMARY KEY (mealID, orderID),
--     FOREIGN KEY (mealID) REFERENCES mealOrTicket(mealID),
--     FOREIGN KEY (orderID) REFERENCES Orders(orderID)
-- );

-- CREATE TABLE Ingredients
-- (
--     ingredAmount INT NOT NULL,
--     prodID INT NOT NULL,
--     mealID INT NOT NULL,
--     PRIMARY KEY (prodID, mealID),
--     FOREIGN KEY (prodID) REFERENCES Product(prodID),
--     FOREIGN KEY (mealID) REFERENCES mealOrTicket(mealID)
-- );
