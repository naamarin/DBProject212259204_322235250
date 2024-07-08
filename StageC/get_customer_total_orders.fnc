CREATE OR REPLACE FUNCTION get_customer_total_orders 
RETURN SYS_REFCURSOR IS
    customer_cursor SYS_REFCURSOR;
BEGIN
    OPEN customer_cursor FOR
    SELECT c.custName, c.custPhoneNumber, COUNT(o.orderID) AS totalOrders
    FROM Customers c
    JOIN Orders o ON c.custID = o.custID
    GROUP BY c.custName, c.custPhoneNumber
    ORDER BY totalOrders DESC;

    RETURN customer_cursor;
END;
/
