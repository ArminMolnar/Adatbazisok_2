-- product_seq for product_id starts with 6000
-- valid ID
BEGIN
  pkg_product.delete_product(p_product_id => 6003);
END;

-- invalid ID
BEGIN
  pkg_product.delete_product(p_product_id => 5999);
END;
