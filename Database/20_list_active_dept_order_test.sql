-- Creating Active orders
BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4000,
                                  p_product_id => 6004,
                                  p_quantity   => 12);  
END;

BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4001,
                                  p_product_id => 6003,
                                  p_quantity   => 25);  
END;

BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4002,
                                  p_product_id => 6007,
                                  p_quantity   => 14);  
END;

BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4002,
                                  p_product_id => 6018,
                                  p_quantity   => 13);  
END;

-- Testing the function
DECLARE
  active_orders order_list;
BEGIN
  active_orders := pkg_order.list_active_dept_order('Active');

  FOR i IN 1 .. active_orders.count
  LOOP
    dbms_output.put_line(active_orders(i));
  END LOOP;
END;


