CREATE OR REPLACE PROCEDURE update_workers_salary IS
BEGIN
    UPDATE Workers
    SET workerSalary = workerSalary * 1.1
    WHERE workerID IN (SELECT workerID FROM WorkerOrder GROUP BY workerID HAVING COUNT(orderID) > 10);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
