-- department_seq for department_id starts with 4000      (There are 3 departments stored in the database)
-- product_seq for product_id starts with 6000

-- Invalid values
BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4004, -- invalid Department_id
                                  p_product_id => 6005,
                                  p_quantity   => 119);  
END;


BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4002, 
                                  p_product_id => 7000, -- invalid Product_id
                                  p_quantity   => 119);  
END;



BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4002, 
                                  p_product_id => 6013, 
                                  p_quantity   => 0);  -- invalid quantity
END;

BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4002, 
                                  p_product_id => 6013, 
                                  p_quantity   => 500);  -- invalid quantity
END;
