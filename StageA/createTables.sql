CREATE TABLE Workers
(
  workerID INT NOT NULL,
  workName VARCHAR2(20) NOT NULL,
  workerJobTitle VARCHAR2(20) NOT NULL,
  workerSalary INT NOT NULL,
  workerBirthDate DATE NOT NULL,
  PRIMARY KEY (workerID)
);

CREATE TABLE Providers
(
  provName VARCHAR2(20) NOT NULL,
  provPhoneNumber VARCHAR2(20) NOT NULL,
  provID INT NOT NULL,
  PRIMARY KEY (provID),
  UNIQUE (provPhoneNumber)
);

CREATE TABLE Customers
(
  custPhoneNumber VARCHAR2(20) NOT NULL,
  custName VARCHAR2(20) NOT NULL,
  custAddress VARCHAR2(20) NOT NULL,
  custID INT NOT NULL,
  PRIMARY KEY (custID),
  UNIQUE (custPhoneNumber)
);

CREATE TABLE Product
(
  prodID INT NOT NULL,
  prodName VARCHAR2(20) NOT NULL,
  prodPrice INT NOT NULL,
  prodAmount INT NOT NULL,
  provID INT NOT NULL,
  PRIMARY KEY (prodID),
  FOREIGN KEY (provID) REFERENCES Providers(provID),
  UNIQUE (prodName)
);

CREATE TABLE Meal
(
  mealID INT NOT NULL,
  mealName VARCHAR2(20) NOT NULL,
  mealPrice INT NOT NULL,
  PRIMARY KEY (mealID),
  UNIQUE (mealName)
);

CREATE TABLE Orders
(
  orderID INT NOT NULL,
  orderPrice INT NOT NULL,
  orderStatus VARCHAR2(20) NOT NULL,
  orderDate DATE NOT NULL,
  custID INT NOT NULL,
  PRIMARY KEY (orderID),
  FOREIGN KEY (custID) REFERENCES Customers(custID)
);

CREATE TABLE WorkerOrder
(
  workerID INT NOT NULL,
  orderID INT NOT NULL,
  PRIMARY KEY (workerID, orderID),
  FOREIGN KEY (workerID) REFERENCES Workers(workerID),
  FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);

CREATE TABLE mealOrder
(
  mealAmount INT NOT NULL,
  mealID INT NOT NULL,
  orderID INT NOT NULL,
  PRIMARY KEY (mealID, orderID),
  FOREIGN KEY (mealID) REFERENCES Meal(mealID),
  FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);

CREATE TABLE Ingredients
(
  ingredAmount INT NOT NULL,
  prodID INT NOT NULL,
  mealID INT NOT NULL,
  PRIMARY KEY (prodID, mealID),
  FOREIGN KEY (prodID) REFERENCES Product(prodID),
  FOREIGN KEY (mealID) REFERENCES Meal(mealID)
);
