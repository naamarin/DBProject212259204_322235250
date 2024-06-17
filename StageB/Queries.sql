--4 Select Queries
--Select the total number of orders placed by each customer along with their details.
SELECT c.custName, c.custPhoneNumber, COUNT(o.orderID) AS totalOrders
FROM Customers c
JOIN Orders o ON c.custID = o.custID
GROUP BY c.custName, c.custPhoneNumber
ORDER BY totalOrders DESC;

--Select the workers who have managed the highest number of orders and their details.
SELECT w.workName, w.workerJobTitle, COUNT(wo.orderID) AS totalOrdersManaged
FROM Workers w
JOIN WorkerOrder wo ON w.workerID = wo.workerID
GROUP BY w.workName, w.workerJobTitle
HAVING COUNT(wo.orderID) = (
    SELECT MAX(orderCount)
    FROM (
        SELECT COUNT(orderID) AS orderCount
        FROM WorkerOrder
        GROUP BY workerID
    )
);

--Select the employees over the age of 50 who made less than 4 orders along with their details.
SELECT workname, workerid, workerbirthdate
From workers w
WHERE 4>= (SELECT COUNT(*)
FROM workerorder wo
WHERE w.workerid = wo.workerid) AND (EXTRACT (year from w.workerbirthdate)) < 1975;

--Select the average order price per month for the current year.
SELECT EXTRACT(MONTH FROM o.orderDate) AS month, AVG(o.orderPrice) AS avgOrderPrice
FROM Orders o
WHERE EXTRACT(YEAR FROM o.orderDate) = EXTRACT(YEAR FROM SYSDATE)
GROUP BY EXTRACT(MONTH FROM o.orderDate)
ORDER BY month;


--2 Delete Queries
--Delete all orders that are older than one year from today.
DELETE FROM Orders
WHERE orderDate < ADD_MONTHS(SYSDATE, -12);

--Delete all customers who have not placed any orders.
DELETE FROM Customers
WHERE custID NOT IN (SELECT DISTINCT custID FROM Orders);


--2 Update Queries
--Update the salary of workers who have managed more than 10 orders by increasing it by 10%.
UPDATE Workers
SET workerSalary = workerSalary * 1.1
WHERE workerID IN (SELECT workerID FROM WorkerOrder GROUP BY workerID HAVING COUNT(orderID) > 10);

--Update the status of all orders placed more than a month ago to 'completed':
UPDATE Orders
SET orderStatus = 'Delivered'
WHERE orderDate < ADD_MONTHS(SYSDATE, -1);
