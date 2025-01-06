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

-- Testing the function
BEGIN
  dbms_output.put_line(pkg_order.list_active_dept_order());
END;


