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

END;


