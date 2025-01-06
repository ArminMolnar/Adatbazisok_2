-- department_seq for department_id starts with 4000      (There are 3 departments stored in the database)
-- product_seq for product_id starts with 6000
SELECT * FROM product WHERE product_id = 6000;

-- Valid values,  but Department orders more than the available quantity
BEGIN
  pkg_order.department_order_proc(p_dept_id    => 4000,
                                  p_product_id => 6000,
                                  p_quantity   => 119);  
END;

-- Therefore, the Warehouse coordinator must order from the Supplier
-- The program automatically orders from the Supplier
-- we just need to accept it
SELECT * FROM warehouse_order WHERE status = 'Active' ORDER BY order_date DESC;

BEGIN
  pkg_order.deliver_to_warehouse(p_wh_order_id => 10001);
END;

-- Product arrived in the warehouse
-- We just need them to be delivered to Department
SELECT * FROM department_order WHERE status = 'Active' ORDER BY order_date DESC;

BEGIN
  pkg_order.deliver_to_department(p_dept_order_id => 12002);
END;

SELECT * FROM product WHERE product_id = 6000;

