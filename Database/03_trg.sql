CREATE OR REPLACE TRIGGER supplier_trg
  BEFORE INSERT OR UPDATE ON supplier
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.supplier_id IS NULL
    THEN
      :new.supplier_id := supplier_seq.nextval;
    END IF;
    :new.created_on := SYSDATE;
    :new.dml_flag  := 'I';
    :new.version   := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D' 
    THEN
      :new.dml_flag := 'U';
    END IF;
    
    :new.version := :old.version + 1;
  
  END IF;
  :new.last_mod := SYSDATE; 
  :new.mod_user := sys_context('USERENV', 'OS_USER');
END;

CREATE OR REPLACE TRIGGER wh_coordinator_trg
  BEFORE INSERT OR UPDATE ON wh_coordinator
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.wh_coordinator_id IS NULL
    THEN
      :new.wh_coordinator_id := wh_coordinator_seq.nextval;
    END IF;
    :new.created_on := SYSDATE;
    :new.dml_flag  := 'I';
    :new.version   := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D' 
    THEN
      :new.dml_flag := 'U';
    END IF;
    
    :new.version := :old.version + 1;
  
  END IF;
  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');

END;


CREATE OR REPLACE TRIGGER warehouse_trg
  BEFORE INSERT OR UPDATE ON warehouse
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.warehouse_id IS NULL
    THEN
      :new.warehouse_id := warehouse_seq.nextval;
    END IF;
    :new.created_on := SYSDATE;
    :new.dml_flag  := 'I';
    :new.version   := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D' 
    THEN
      :new.dml_flag := 'U';
    END IF;
    
    :new.version := :old.version + 1;
  
  END IF;
  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');

END;


CREATE OR REPLACE TRIGGER department_trg
  BEFORE INSERT OR UPDATE ON department
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.department_id IS NULL
    THEN
      :new.department_id := department_seq.nextval;
    END IF;
    :new.created_on := SYSDATE;
    :new.dml_flag  := 'I';
    :new.version   := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D' 
    THEN
      :new.dml_flag := 'U';
    END IF;
    
    :new.version := :old.version + 1;
  
  END IF;
  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');

END;


CREATE OR REPLACE TRIGGER warehouse_order_trg
  BEFORE INSERT OR UPDATE ON warehouse_order
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.wh_order_id IS NULL
    THEN
      :new.wh_order_id := wh_order_seq.nextval;
    END IF;
    :new.created_on := SYSDATE;
    :new.dml_flag  := 'I';
    :new.version   := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D' 
    THEN
      :new.dml_flag := 'U';
    END IF;
    
    :new.version := :old.version + 1;
  
  END IF;
  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');

END;

CREATE OR REPLACE TRIGGER department_order_trg
  BEFORE INSERT OR UPDATE ON department_order
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.dept_order_id IS NULL
    THEN
      :new.dept_order_id := dept_order_seq.nextval;
    END IF;
    :new.created_on := SYSDATE;
    :new.dml_flag  := 'I';
    :new.version   := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D' 
    THEN
      :new.dml_flag := 'U';
    END IF;
    
    :new.version := :old.version + 1;
  
  END IF;
  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');

END;


CREATE OR REPLACE TRIGGER product_trg
  BEFORE INSERT OR UPDATE ON product
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.product_id IS NULL
    THEN
      :new.product_id := product_seq.nextval;
    END IF;
    :new.created_on := SYSDATE;
    :new.dml_flag  := 'I';
    :new.version   := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D' 
    THEN
      :new.dml_flag := 'U';
    END IF;
    
    :new.version := :old.version + 1;
  
  END IF;
  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');

END;

CREATE OR REPLACE TRIGGER product_history_trg
  AFTER DELETE OR UPDATE OR INSERT ON product
  FOR EACH ROW
BEGIN

  IF deleting
  THEN
    INSERT INTO product_history
      (product_id
      ,supplier_id
      ,warehouse_id
      ,product_name
      ,product_category
      ,product_size
      ,stock_quantity
      ,measurement_unit
      ,product_price
      ,min_stock_level
      ,max_stock_level
      ,created_on
      ,last_mod
      ,mod_user
      ,dml_flag
      ,version)
    VALUES
      (:old.product_id
      ,:old.supplier_id
      ,:old.warehouse_id
      ,:old.product_name
      ,:old.product_category
      ,:old.product_size
      ,:old.stock_quantity
      ,:old.measurement_unit
      ,:old.product_price
      ,:old.min_stock_level
      ,:old.max_stock_level
      ,:old.created_on
      ,SYSDATE
      ,sys_context('USERENV', 'OS_USER')
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO product_history
      (product_id
      ,supplier_id
      ,warehouse_id
      ,product_name
      ,product_category
      ,product_size
      ,stock_quantity
      ,measurement_unit
      ,product_price
      ,min_stock_level
      ,max_stock_level
      ,created_on
      ,last_mod
      ,mod_user
      ,dml_flag
      ,version)
    VALUES
      (:new.product_id
      ,:new.supplier_id
      ,:new.warehouse_id
      ,:new.product_name
      ,:new.product_category
      ,:new.product_size
      ,:new.stock_quantity
      ,:new.measurement_unit
      ,:new.product_price
      ,:new.min_stock_level
      ,:new.max_stock_level
      ,:new.created_on
      ,:new.last_mod
      ,:new.mod_user
      ,:new.dml_flag
      ,:new.version);
  END IF;
END;



