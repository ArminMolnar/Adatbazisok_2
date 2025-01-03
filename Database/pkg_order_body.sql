CREATE OR REPLACE PACKAGE BODY pkg_order IS
  -- Warehouse coordinator orders from Supplier
  PROCEDURE warehouse_order_proc(p_wh_coordinator_id IN NUMBER
                           ,p_product_id        IN NUMBER
                           ,p_quantity          IN NUMBER) IS
  
    v_supplier_id NUMBER;
  
  BEGIN
    SELECT s.supplier_id
      INTO v_supplier_id
      FROM supplier s
      JOIN product p
        ON p.supplier_id = s.supplier_id
     WHERE p.product_id = p_product_id;
  
    INSERT INTO warehouse_order
      (wh_order_id
      ,wh_coordinator_id
      ,supplier_id
      ,product_id
      ,quantity
      ,order_date
      ,status)
    VALUES
      (wh_order_seq.nextval
      ,p_wh_coordinator_id
      ,v_supplier_id
      ,p_product_id
      ,p_quantity
      ,sysdate
      ,'Ordered');
  
  END warehouse_order_proc;

  -- Products arrive to the warehouse
  PROCEDURE deliver_to_warehouse(p_wh_order_id IN NUMBER) IS
    v_quantity   NUMBER;
    v_product_id NUMBER;
  
  BEGIN
    SELECT quantity
          ,product_id
      INTO v_quantity
          ,v_product_id
      FROM warehouse_order
     WHERE wh_order_id = p_wh_order_id
       FOR UPDATE NOWAIT;
  
    UPDATE product
       SET stock_quantity = stock_quantity + v_quantity
     WHERE product_id = v_product_id;
  
    UPDATE warehouse_order
       SET status          = 'Completed'
          ,completion_date = SYSDATE
     WHERE wh_order_id = p_wh_order_id;
  
    FOR i IN (SELECT dept_order_id
                FROM department_order
               WHERE product_id = v_product_id
                 AND status = 'Ordered'
                 FOR UPDATE NOWAIT)
    LOOP
      deliver_to_department(i.dept_order_id);
    END LOOP;
  
  END deliver_to_warehouse;
  
  -- Department orders from Warehouse coordinator
  PROCEDURE department_order_proc(p_dept_id       IN NUMBER  
                            ,p_wh_coordinator_id  IN NUMBER       
                            ,p_product_id         IN NUMBER     
                            ,p_quantity           IN NUMBER) IS  
    v_available_quantity NUMBER;
    v_wh_coord_warehouse_id NUMBER;
    v_warehouse_id NUMBER;
  
  BEGIN
     SELECT wh.warehouse_coordinator_id
       INTO v_wh_coord_warehouse_id
       FROM warehouse wh
      WHERE wh.warehouse_coordinator_id = p_wh_coordinator_id;
     
  
    SELECT warehouse_id ,stock_quantity
      INTO v_warehouse_id, v_available_quantity
      FROM product
     WHERE product_id = p_product_id
       FOR UPDATE NOWAIT;
  
    IF v_wh_coord_warehouse_id = v_warehouse_id AND 
       v_available_quantity >= p_quantity 
      
    THEN
      INSERT INTO department_order
        (dept_order_id
        ,dept_id
        ,wh_coordinator_id
        ,product_id
        ,quantity
        ,order_date
        ,status)
      VALUES
        (dept_order_seq.nextval
        ,p_dept_id
        ,p_wh_coordinator_id
        ,p_product_id
        ,p_quantity
        ,SYSDATE
        ,'Ordered');
    ELSE
      INSERT INTO department_order
        (dept_order_id
        ,dept_id
        ,wh_coordinator_id
        ,product_id
        ,quantity
        ,order_date
        ,status)
      VALUES
        (dept_order_seq.nextval
        ,p_dept_id
        ,p_wh_coordinator_id
        ,p_product_id
        ,p_quantity
        ,SYSDATE
        ,'Ordered');
      warehouse_order_proc(p_wh_coordinator_id, p_product_id, p_quantity);
    END IF;
  END department_order_proc;
  
  -- Products handed over to department
  PROCEDURE deliver_to_department(p_dept_order_id IN NUMBER) IS
    v_quantity   NUMBER;
    v_product_id NUMBER;
  
  BEGIN
    SELECT quantity
          ,product_id
      INTO v_quantity
          ,v_product_id
      FROM department_order
     WHERE dept_order_id = p_dept_order_id
       FOR UPDATE NOWAIT;
  
    UPDATE product
       SET stock_quantity = stock_quantity - v_quantity
     WHERE product_id = v_product_id;
  
    UPDATE department_order
       SET status          = 'Completed'
          ,completion_date = SYSDATE
     WHERE dept_order_id = p_dept_order_id;
  
  END deliver_to_department;

END pkg_order;
