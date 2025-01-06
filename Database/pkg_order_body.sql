CREATE OR REPLACE PACKAGE BODY pkg_order IS
  -- WAREHOUSE COORDINATOR ORDERS FROM SUPPLIER --
  PROCEDURE warehouse_order_proc(p_product_id IN NUMBER
                                ,p_quantity   IN NUMBER) IS
  
    v_supplier_id        NUMBER;
    v_wh_coordinator_id  NUMBER;
    v_max_stock_level    NUMBER;
    v_available_quantity NUMBER;
  
  BEGIN
    BEGIN    
      SELECT p.stock_quantity
            ,p.supplier_id
            ,p.max_stock_level
            ,wh.warehouse_coordinator_id
        INTO v_available_quantity
            ,v_supplier_id
            ,v_max_stock_level
            ,v_wh_coordinator_id
        FROM product p
        JOIN warehouse wh
          ON wh.warehouse_id = p.warehouse_id
       WHERE p.product_id = p_product_id;
    
    EXCEPTION
      WHEN no_data_found THEN
        RAISE pkg_exception.invalid_id_exception;
    END;    
  
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
      ,v_wh_coordinator_id
      ,v_supplier_id
      ,p_product_id
      ,p_quantity
      ,SYSDATE
      ,'Active');
  
    COMMIT;
    dbms_output.put_line('Order sent to supplier. Order ID: ' ||
                         wh_order_seq.currval);
  
  EXCEPTION
    WHEN pkg_exception.invalid_id_exception THEN
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Invalid ID has been entered: ' ||
                                                 p_product_id,
                              p_api           => 'pkg_order.warehouse_order_proc');
      raise_application_error(pkg_exception.gc_invalid_id_code,
                              'Invalid ID');
    
    WHEN pkg_exception.over_max_capacity_exception THEN
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Not enough room to store the product. Max stock level: ' ||
                                                 v_max_stock_level,
                              p_api           => 'pkg_order.warehouse_order_proc');
      raise_application_error(pkg_exception.gc_over_max_capacity_code,
                              'Attempted to order too many products.');
    
    WHEN OTHERS THEN
       ROLLBACK;
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Error occured',
                              p_api           => 'pkg_order.warehouse_order_proc');
      raise_application_error(pkg_exception.gc_warehouse_mgr_code,
                              'Error occured');
      RAISE;
    
  END warehouse_order_proc;

  -- PRODUCTS DELIVERED TO WAREHOUSE --
  PROCEDURE deliver_to_warehouse(p_wh_order_id IN NUMBER) IS
    v_quantity   NUMBER;
    v_product_id NUMBER;
    v_status     VARCHAR2(30);
  
  BEGIN
    BEGIN
      SELECT wh_o.quantity
            ,wh_o.product_id
            ,wh_o.status
        INTO v_quantity
            ,v_product_id
            ,v_status
        FROM warehouse_order wh_o
       WHERE wh_o.wh_order_id = p_wh_order_id;
    EXCEPTION
      WHEN no_data_found THEN
        RAISE pkg_exception.invalid_id_exception;
    END;
    IF v_status = 'Active'
    THEN
      UPDATE product
         SET stock_quantity = stock_quantity + v_quantity
       WHERE product_id = v_product_id;
    
      UPDATE warehouse_order
         SET status          = 'Completed'
            ,completion_date = SYSDATE
       WHERE wh_order_id = p_wh_order_id;
    
      COMMIT;
      dbms_output.put_line('Order completed. Product arrived to the warehouse');
    ELSE
      dbms_output.put_line('Order already processed');
    END IF;
  
  EXCEPTION
  
    WHEN pkg_exception.invalid_id_exception THEN
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Invalid ID has been entered: ' ||
                                                 p_wh_order_id,
                              p_api           => 'pkg_order.deliver_to_warehouse');
      raise_application_error(pkg_exception.gc_invalid_id_code,
                              'Invalid ID');
    
    WHEN OTHERS THEN
      ROLLBACK;
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Error occured',
                              p_api           => 'pkg_order.deliver_to_warehouse');
      raise_application_error(pkg_exception.gc_warehouse_mgr_code,
                              'Error occured');
      RAISE;
    
  END deliver_to_warehouse;

  -- DEPARTMENT ORDERS FROM WAREHOUSE COORDINATOR --
  PROCEDURE department_order_proc(p_dept_id    IN NUMBER
                                 ,p_product_id IN NUMBER
                                 ,p_quantity   IN NUMBER) IS
    v_available_quantity NUMBER;
    v_min_stock_level    NUMBER;
    v_wh_coordinator_id  NUMBER;
    v_remaining_quantity NUMBER;
    v_max_stock_level    NUMBER;
    v_dept_order_id      NUMBER;
    v_dept_exists        NUMBER;
  
  BEGIN
    BEGIN
      SELECT p.stock_quantity
            ,p.min_stock_level
            ,p.max_stock_level
            ,wh.warehouse_coordinator_id            
        INTO v_available_quantity
            ,v_min_stock_level
            ,v_max_stock_level
            ,v_wh_coordinator_id            
        FROM product p
        JOIN warehouse wh
          ON p.warehouse_id = wh.warehouse_id
       WHERE p.product_id = p_product_id;
       
       SELECT p_dept_id
         INTO v_dept_exists
         FROM department
        WHERE department.department_id = p_dept_id;
       
    EXCEPTION
      WHEN no_data_found THEN
        RAISE pkg_exception.invalid_id_exception;
    END;
  
    IF p_quantity > v_max_stock_level
    THEN
      RAISE pkg_exception.over_max_capacity_exception;
    END IF;
    -- ENOUGH PRODUCT IN STOCK -- 
    IF v_available_quantity >= p_quantity
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
        ,v_wh_coordinator_id
        ,p_product_id
        ,p_quantity
        ,SYSDATE
        ,'Active')
        returning dept_order_id into v_dept_order_id;
        
      v_remaining_quantity := v_available_quantity - p_quantity;
    
      -- CHECK IF STOCK LEVEL DROPPED BELOW THE MINIMUM --
      IF v_remaining_quantity < v_min_stock_level
      THEN
        warehouse_order_proc(p_product_id,
                             (v_min_stock_level * 4) - v_remaining_quantity);
        dbms_output.put_line('Stock level dropped below the minimum. Order sent to supplier, but department order can be fulfilled. Order ID: ' || v_dept_order_id);
      END IF;
    
      -- NOT ENOUGH PRODUCT IN STOCK --
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
        ,v_wh_coordinator_id
        ,p_product_id
        ,p_quantity
        ,SYSDATE
        ,'Active');
    
  
      warehouse_order_proc(p_product_id,
                           ((v_min_stock_level * 4) +
                           (p_quantity - v_available_quantity)));
      dbms_output.put_line('Not enough products to fulfill the order. Order sent to supplier, please complete that order first');
    END IF;
  
    COMMIT;
    dbms_output.put_line('Product had been ordered');
  
  EXCEPTION
    WHEN pkg_exception.invalid_id_exception THEN
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Department ID: ' ||
                                                 p_dept_id ||
                                                 ' or product ID: ' ||
                                                 p_product_id ||
                                                 ' is invalid ',
                              p_api           => 'pkg_order.department_order_proc');
      raise_application_error(pkg_exception.gc_invalid_id_code,
                              'Invalid ID');
    
    WHEN pkg_exception.over_max_capacity_exception THEN
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Not enough room to store the product. Max stock level: ' ||
                                                 v_max_stock_level,
                              p_api           => 'pkg_order.department_order_proc');
      raise_application_error(pkg_exception.gc_over_max_capacity_code,
                              'Attempted to order too many products.');
    
    WHEN OTHERS THEN
      ROLLBACK;
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Error occured',
                              p_api           => 'pkg_order.department_order_proc');
      raise_application_error(pkg_exception.gc_warehouse_mgr_code,
                              'Error occured');
      RAISE;
  END department_order_proc;

  -- DELIVERING PRODUCT TO DEPARTMENT --
  PROCEDURE deliver_to_department(p_dept_order_id IN NUMBER) IS
    v_ordered_quantity NUMBER;
    v_product_id       NUMBER;
    v_status           VARCHAR2(30);
    v_stock_quantity   NUMBER;
    v_max_stock_level  NUMBER;
  
  BEGIN
    BEGIN
      SELECT dept_o.quantity
            ,dept_o.product_id
            ,dept_o.status
            ,p.stock_quantity
      
        INTO v_ordered_quantity
            ,v_product_id
            ,v_status
            ,v_stock_quantity
      
        FROM department_order dept_o
        JOIN product p
          ON p.product_id = dept_o.product_id
       WHERE dept_o.dept_order_id = p_dept_order_id;
    EXCEPTION
      WHEN no_data_found THEN
        RAISE pkg_exception.invalid_id_exception;
    END;
  
    -- CHECK IF DELIVERING IF POSSIBLE --
    IF v_stock_quantity < v_ordered_quantity
    THEN
      RAISE pkg_exception.insufficient_stock_exception;
    ELSIF v_status = 'Active'
    THEN
      UPDATE product
         SET stock_quantity = stock_quantity - v_ordered_quantity
       WHERE product_id = v_product_id;
    
      UPDATE department_order
         SET status          = 'Completed'
            ,completion_date = SYSDATE
       WHERE dept_order_id = p_dept_order_id;
    
      COMMIT;
      dbms_output.put_line('Order completed. Product delivered to department');
    ELSE
      dbms_output.put_line('Order already processed.');
    END IF;
  
  EXCEPTION
    WHEN pkg_exception.invalid_id_exception THEN
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Invalid ID has been entered: ' || p_dept_order_id,
                              p_api           => 'pkg_order.deliver_to_department');
      raise_application_error(pkg_exception.gc_invalid_id_code,
                              'Invalid ID');
    
    WHEN pkg_exception.insufficient_stock_exception THEN
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Insufficient stock. Confirm supplier delivery first',
                              p_api           => 'pkg_order.deliver_to_department');
      raise_application_error(pkg_exception.gc_insufficient_stock_code,
                              'Insufficient stock. Confirm supplier delivery first.');
    
    WHEN OTHERS THEN
      ROLLBACK;
      pkg_error_log.error_log(p_error_message => dbms_utility.format_error_backtrace,
                              p_error_value   => 'Error occured',
                              p_api           => 'pkg_order.deliver_to_department');
      raise_application_error(pkg_exception.gc_warehouse_mgr_code,
                              'Error occured');
      RAISE;
  END deliver_to_department;

  -- LISTING ACTIVE DEPARTMENT ORDERS --
  FUNCTION list_active_dept_order(p_status IN VARCHAR2 DEFAULT 'Active')
    RETURN VARCHAR2 IS
  
    v_result VARCHAR2(4000);
  
  BEGIN
    FOR i IN (SELECT dept_o.dept_order_id
                    ,dept_o.product_id
                    ,to_char(dept_o.order_date, 'YYYY. MM. DD. HH24:MI:SS') AS order_date            
                FROM department_order dept_o
               WHERE dept_o.status = p_status
               ORDER BY dept_o.order_date ASC)
    LOOP
      v_result := v_result || 'Order ID: ' || i.dept_order_id ||
                  ' Product ID: ' || i.product_id || ' Order date: ' ||
                  i.order_date || chr(10);
    END LOOP;
    RETURN v_result;
  
  END list_active_dept_order;

END pkg_order;
