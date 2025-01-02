CREATE OR REPLACE PACKAGE pkg_product IS
  PROCEDURE add_product(p_name             IN VARCHAR2
                       ,p_category         IN VARCHAR2
                       ,p_size             IN VARCHAR2
                       ,p_quantity         IN NUMBER
                       ,p_measurement_unit IN VARCHAR2
                       ,p_price            IN NUMBER
                       ,p_min_stock_level  IN NUMBER
                       ,p_max_stock_level  IN NUMBER);

  PROCEDURE delete_product(p_product_id IN NUMBER);
  PROCEDURE list_low_stock(p_warehouse_id IN NUMBER);

END pkg_product;
