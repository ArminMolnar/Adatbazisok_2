-- department_seq for department_id starts with 4000      (There are 3 departments stored in the database)
-- dept_order_seq for dept_order_id starts with 12000
-- product_seq for product_id starts with 6000
SELECT * FROM product WHERE product_id = 6000;

-- Valid values, ordering just a few of a product
BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4000,
                                  p_product_id => 6000,
                                  p_quantity   => 5);  
END;

-- Product had been ordered by Department. 
SELECT * FROM department_order WHERE status = 'Active' ORDER BY order_date DESC;
-- Since there's enough product in stock, we can deliver it to Department immediately
BEGIN
  pkg_order.deliver_to_department(p_dept_order_id => 12000);
END;
-- Order completed, department order table updated the status to Completed
SELECT * FROM department_order WHERE product_id = 6000 ORDER BY completion_date DESC;





-- Invalid Department ID
BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4004,
                                  p_product_id => 6003,
                                  p_quantity   => 30);  
END;

-- Attempting to order too many products
BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4003,
                                  p_product_id => 6003,
                                  p_quantity   => 500);  
END;


-- Entering 0 to p_quantity
BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4003,
                                  p_product_id => 6003,
                                  p_quantity   => 0);  
END;
