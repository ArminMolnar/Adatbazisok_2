CREATE OR REPLACE PACKAGE pkg_exception IS

  invalid_id_exception EXCEPTION; 
  gc_invalid_id_code CONSTANT NUMBER := -20000;  

  warehouse_mgr_exception EXCEPTION;
  gc_warehouse_mgr_code CONSTANT NUMBER := -20100;
  
  insufficient_stock_exception EXCEPTION;
  gc_insufficient_stock_code CONSTANT NUMBER := -20200;
  
  over_max_capacity_exception EXCEPTION;
  gc_over_max_capacity_code CONSTANT NUMBER := -20300;
  
  invalid_category_exception EXCEPTION;
  gc_invalid_category_code CONSTANT NUMBER := -20400;

END pkg_exception;
