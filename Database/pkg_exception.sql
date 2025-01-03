CREATE OR REPLACE PACKAGE pkg_exception IS

  invalid_product_id_exception EXCEPTION;  
  PRAGMA EXCEPTION_INIT(invalid_product_id_exception, -20000);
  gc_invalid_id_code CONSTANT NUMBER := -20000;

  invalid_warehouse_id_exception EXCEPTION;  
  PRAGMA EXCEPTION_INIT(invalid_warehouse_id_exception, -20100);
  gc_invalid_wh_id_code CONSTANT NUMBER := -20100;

END pkg_exception;
