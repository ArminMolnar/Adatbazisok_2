-- department_seq for department_id starts with 4000      (There are 3 departments stored in the database)
-- product_seq for product_id starts with 6000
SELECT * FROM product WHERE product_id = 6000;

-- Valid values,  but stock_quantity drops below min_stock_level
BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4000,
                                  p_product_id => 6000,
                                  p_quantity   => 50);  
END;

-- Order sent to supplier, but Department order can still be fulfilled. Order ID: 'id'  (from Output)
SELECT * FROM department_order WHERE status = 'Active' ORDER BY order_date DESC;

BEGIN
  pkg_order.deliver_to_department(p_dept_order_id => 12001);
END;

-- Product had been delivered to department
-- But since stock_quantity dropped below min_stock_level
-- the program automatically orders from the Supplier

SELECT * FROM warehouse_order WHERE status = 'Active' ORDER BY order_date DESC;

-- We just need to accept the delivery 
BEGIN
  pkg_order.deliver_to_warehouse(p_wh_order_id => 10000);
END;
-- Product had been delivered to warehouse.
SELECT * FROM product WHERE product_id = 6000;



