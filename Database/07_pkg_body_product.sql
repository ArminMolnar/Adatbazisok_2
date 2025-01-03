CREATE OR REPLACE PACKAGE BODY pkg_product IS
  PROCEDURE add_product(p_name             IN VARCHAR2
                       ,p_category         IN VARCHAR2
                       ,p_size             IN VARCHAR2
                       ,p_quantity         IN NUMBER
                       ,p_measurement_unit IN VARCHAR2
                       ,p_price            IN NUMBER
                       ,p_min_stock_level  IN NUMBER
                       ,p_max_stock_level  IN NUMBER) IS
  
    v_product_count NUMBER;
    v_supplier_id   NUMBER;
    v_warehouse_id  NUMBER;
  
  BEGIN
    IF p_category = 'clothing'
    THEN
      SELECT warehouse_id
        INTO v_warehouse_id
        FROM warehouse
       WHERE warehouse_name = 'Uniform and Gear Warehouse';
    
      SELECT supplier_id
        INTO v_supplier_id
        FROM supplier
       WHERE supplier_name = 'ArmyWear Co.';
    
    ELSIF p_category = 'footwear'
    THEN
      SELECT warehouse_id
        INTO v_warehouse_id
        FROM warehouse
       WHERE warehouse_name = 'Footwear Warehouse';
    
      SELECT supplier_id
        INTO v_supplier_id
        FROM supplier
       WHERE supplier_name = 'SuperMarch Essentials';
    ELSE
      SELECT warehouse_id
        INTO v_warehouse_id
        FROM warehouse
       WHERE warehouse_name = 'Tactical Equipment Warehouse';
    
      SELECT supplier_id
        INTO v_supplier_id
        FROM supplier
       WHERE supplier_name = 'Tacticraft Supply Co.';
    END IF;
  
    SELECT COUNT(*)
      INTO v_product_count
      FROM product
     WHERE product_name = p_name
       AND product_category = p_category
       AND product_size = p_size;
  
    IF v_product_count > 0
    THEN
      dbms_output.put_line('Product already in database');
    
    ELSE
    
      INSERT INTO product
        (supplier_id
        ,warehouse_id
        ,product_name
        ,product_category
        ,product_size
        ,stock_quantity
        ,measurement_unit
        ,product_price
        ,min_stock_level
        ,max_stock_level)
      VALUES
        (v_supplier_id
        ,v_warehouse_id
        ,p_name
        ,p_category
        ,p_size
        ,p_quantity
        ,p_measurement_unit
        ,p_price
        ,p_min_stock_level
        ,p_max_stock_level);
      dbms_output.put_line('Product added');
    END IF;
  END add_product;

  -- DELETE PRODUCT PROCEDURE
  PROCEDURE delete_product(p_product_id IN NUMBER) IS
    v_product_id number;
BEGIN
    BEGIN
        SELECT p.product_id INTO v_product_id
        FROM product p  
        WHERE p.product_id = p_product_id;    
    EXCEPTION
        WHEN no_data_found THEN         
            pkg_error_log.error_log(
                p_error_message => dbms_utility.format_error_backtrace,             
                p_error_value => 'Invalid ID has been entered: ' || p_product_id,
                p_api => 'pkg_product.delete_product'
            );
            RAISE pkg_exception.invalid_product_id_exception;
            
    END;

    DELETE FROM product WHERE product_id = p_product_id;

EXCEPTION
    WHEN pkg_exception.invalid_product_id_exception THEN
       
        RAISE_APPLICATION_ERROR(-20000, 'Invalid ID');
    WHEN OTHERS THEN
        pkg_error_log.error_log(
            p_error_message => dbms_utility.format_error_backtrace,
            p_error_value => 'Error deleting product with ID: ' || p_product_id,
            p_api => 'pkg_product.delete_product'
        );
        RAISE_APPLICATION_ERROR(pkg_exception.gc_invalid_id_code, 'Error deleting product');
END delete_product;
  

  -- LIST LOW STOCK PROCEDURE
  PROCEDURE list_low_stock(p_warehouse_id IN NUMBER) IS
    res_warehouse_name VARCHAR2(30);
  BEGIN
    SELECT wh.warehouse_name
      INTO res_warehouse_name
      FROM warehouse wh
     WHERE p_warehouse_id = wh.warehouse_id;
    dbms_output.put_line('Products on low stock level in warehouse: ' ||
                         res_warehouse_name || ' (Warehouse ID: ' ||
                         p_warehouse_id || ')');
    dbms_output.new_line;
    FOR i IN (SELECT p.product_id
                    ,p.product_name
                    ,p.product_size
                    ,p.stock_quantity
                    ,p.min_stock_level
              
                FROM product p
                JOIN warehouse wh
                  ON p.warehouse_id = wh.warehouse_id
               WHERE p_warehouse_id = p.warehouse_id
                 AND p.stock_quantity - p.min_stock_level < 15)
    LOOP
      dbms_output.put_line('Product ID: ' || i.product_id || ' - Name: ' ||
                           i.product_name || ' - Size: ' || i.product_size ||
                           ' - Current stock: ' || i.stock_quantity ||
                           ' - Minimum stock:' || i.min_stock_level);
    END LOOP;
  END list_low_stock;
END pkg_product;
