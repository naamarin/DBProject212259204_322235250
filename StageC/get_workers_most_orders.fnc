CREATE OR REPLACE FUNCTION get_workers_most_orders
RETURN SYS_REFCURSOR IS
    worker_cursor SYS_REFCURSOR;
    max_orders INT;
BEGIN
    SELECT MAX(orderCount)
    INTO max_orders
    FROM (
        SELECT COUNT(orderID) AS orderCount
        FROM WorkerOrder
        GROUP BY workerID
    );

    OPEN worker_cursor FOR
    SELECT w.workName, w.workerJobTitle, COUNT(wo.orderID) AS totalOrdersManaged
    FROM Workers w
    JOIN WorkerOrder wo ON w.workerID = wo.workerID
    GROUP BY w.workName, w.workerJobTitle
    HAVING COUNT(wo.orderID) = max_orders;

    RETURN worker_cursor;
END;
/
