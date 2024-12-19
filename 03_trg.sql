CREATE OR REPLACE TRIGGER beszallito_trg
  BEFORE INSERT OR UPDATE ON beszallito
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.beszallito_id IS NULL
    THEN
      :new.beszallito_id := beszallito_seq.nextval;
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

CREATE OR REPLACE TRIGGER raktaros_trg
  BEFORE INSERT OR UPDATE ON raktaros
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.raktaros_id IS NULL
    THEN
      :new.raktaros_id := raktaros_seq.nextval;
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

CREATE OR REPLACE TRIGGER raktar_trg
  BEFORE INSERT OR UPDATE ON raktar
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.raktar_id IS NULL
    THEN
      :new.raktar_id := raktar_seq.nextval;
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

CREATE OR REPLACE TRIGGER reszleg_trg
  BEFORE INSERT OR UPDATE ON reszleg
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.reszleg_id IS NULL
    THEN
      :new.reszleg_id := reszleg_seq.nextval;
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

CREATE OR REPLACE TRIGGER rendeles_trg
  BEFORE INSERT OR UPDATE ON rendeles
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.rendeles_id IS NULL
    THEN
      :new.rendeles_id := rendeles_seq.nextval;
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

CREATE OR REPLACE TRIGGER termek_trg
  BEFORE INSERT OR UPDATE ON termek
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.termek_id IS NULL
    THEN
      :new.termek_id := termek_seq.nextval;
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
