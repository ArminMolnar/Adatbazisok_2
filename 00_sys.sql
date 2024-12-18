DECLARE
  CURSOR cur IS
    SELECT 'ALTER SYSTEM KILL SESSION ''' || sid || ',' || serial# || '''' AS command
      FROM v$session
     WHERE username = 'WAREHOUSE_MGR';
BEGIN
  FOR c IN cur
  LOOP
    EXECUTE IMMEDIATE c.command;
  END LOOP;
END;

CREATE USER warehouse_mgr
IDENTIFIED BY 12345678
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON USERS;

GRANT CREATE SESSION TO warehouse_mgr;
GRANT CREATE TABLE TO warehouse_mgr;
GRANT CREATE SEQUENCE TO warehouse_mgr;
GRANT CREATE TRIGGER TO warehouse_mgr;
GRANT CREATE VIEW TO warehouse_mgr;
GRANT CREATE PROCEDURE TO warehouse_mgr;


