CREATE OR REPLACE VIEW current_stock AS
SELECT w.warehouse_name, 
       p.product_id, 
       p.product_name, 
       p.product_size, 
       p.stock_quantity
 FROM product p
 JOIN warehouse w 
  ON w.warehouse_id = p.warehouse_id;
       
SELECT * FROM current_stock ORDER BY product_id ASC;
       
CREATE OR REPLACE VIEW clothing_wh_current_stock AS
SELECT p.product_id, 
       p.product_name, 
       p.product_size, 
       p.stock_quantity
 FROM product p
 JOIN warehouse w 
  ON w.warehouse_id = p.warehouse_id
 WHERE w.warehouse_name = 'Uniform and Gear Warehouse';
       
SELECT * FROM clothing_wh_current_stock ORDER BY product_id ASC;

CREATE OR REPLACE VIEW near_min_stock_level AS
SELECT p.product_id, 
       p.product_name, 
       p.product_size, 
       p.stock_quantity AS Current_quantity, 
       p.min_stock_level
 FROM product p
 WHERE p.stock_quantity - p.min_stock_level < 15;
       
SELECT * FROM near_min_stock_level;
       
       
CREATE OR REPLACE VIEW supplier_statistics AS
SELECT s.supplier_name, 
       SUM(p.stock_quantity) AS Quantity_supplied, 
       SUM(p.product_price) AS Total_price
 FROM supplier s
 JOIN product p 
 ON p.supplier_id = s.supplier_id
 GROUP BY s.supplier_name;
       
SELECT * FROM supplier_statistics ORDER BY total_price ASC;
