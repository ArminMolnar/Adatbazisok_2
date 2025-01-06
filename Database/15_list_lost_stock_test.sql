-- warehouse_seq for warehouse_id starts with 3000     ( There are 3 warehouses stored in the database.)
-- valid ID
DECLARE
  low_stock_l low_stock_list;
BEGIN
  pkg_product.list_low_stock(p_warehouse_id => 3001, p_low_stock => low_stock_l);

  FOR i IN 1 .. low_stock_l.count
  LOOP
    dbms_output.put_line(low_stock_l(i));
  END LOOP;
END;

-- -- invalid ID
DECLARE
  low_stock_l low_stock_list;
BEGIN
  pkg_product.list_low_stock(p_warehouse_id => 3005, p_low_stock => low_stock_l);

  FOR i IN 1 .. low_stock_l.count
  LOOP
    dbms_output.put_line(low_stock_l(i));
  END LOOP;
END;
