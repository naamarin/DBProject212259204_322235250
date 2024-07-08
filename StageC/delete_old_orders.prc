CREATE OR REPLACE PROCEDURE delete_old_orders IS
BEGIN
    DELETE FROM Orders
    WHERE orderDate < ADD_MONTHS(SYSDATE, -12);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
