-- warehouse_seq for warehouse_id starts with 3000     ( There are 3 warehouses stored in the database.)
-- valid ID
BEGIN
  pkg_product.list_low_stock(p_warehouse_id => 3002);
END;

-- invalid ID
BEGIN
  pkg_product.list_low_stock(p_warehouse_id => 3005);
END;
