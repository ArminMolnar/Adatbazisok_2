 -- CREATE ORDER_LIST TO STORE THE RESULT --
  CREATE OR REPLACE TYPE order_list IS TABLE OF VARCHAR2(4000);
  
 -- CREATE LOW_STOCK_LIST TO STORE THE RESULT --
  CREATE OR REPLACE TYPE low_stock_list IS TABLE OF VARCHAR2(4000);