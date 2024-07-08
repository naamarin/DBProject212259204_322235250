create or replace procedure main2 is
-- Created on 08/07/2024 by NAAMA 
declare 
  -- Local variables here
  worker_cursor SYS_REFCURSOR;
  worker_rec Workers%ROWTYPE;
  total_orders_managed INT;
begin
  -- Test statements here
  -- Call the function
    worker_cursor := get_workers_most_orders;
    
    LOOP
        FETCH worker_cursor INTO worker_rec.workName, worker_rec.workerJobTitle, total_orders_managed;
        EXIT WHEN worker_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Worker Name: ' || worker_rec.workName || ', Job Title: ' || worker_rec.workerJobTitle || ', Total Orders Managed: ' || total_orders_managed);
    END LOOP;
    CLOSE worker_cursor;
    
    -- Call the procedure
    update_workers_salary;
end main2;
/
