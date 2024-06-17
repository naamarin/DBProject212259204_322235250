ALTER TABLE Workers
ADD CONSTRAINT CHK_WorkerSalary CHECK (workerSalary > 0);

ALTER TABLE Product
ADD CONSTRAINT CHK_ProdPrice CHECK (prodPrice > 0);

ALTER TABLE Orders
ADD CONSTRAINT CHK_OrderPrice CHECK (orderPrice >= 0);
