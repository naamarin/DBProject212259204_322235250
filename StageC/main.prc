create or replace procedure main is
  -- Created on 07/07/2024 by NAAMA 
declare 
  -- Local variables here
  customer_cursor SYS_REFCURSOR;
  customer_rec Customers%ROWTYPE;
  total_orders INT;
begin
  -- Test statements here
  -- Call the function
    customer_cursor := get_customer_total_orders;
    
    LOOP
        FETCH customer_cursor INTO customer_rec.custName, customer_rec.custPhoneNumber, total_orders;
        EXIT WHEN customer_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_rec.custName || ', Phone Number: ' || customer_rec.custPhoneNumber || ', Total Orders: ' || total_orders);
    END LOOP;
    CLOSE customer_cursor;
    
    -- Call the procedure
    delete_old_orders;
end main;
/
