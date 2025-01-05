-- CURRENT STOCK VIEW -- 
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
       
-- CURRENT STOCK IN 'UNIFORM AND GEAR WAREHOUSE' VIEW -- 
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

-- PRODUCTS NEAR THEIR MINIMUM STOCK LEVEL VIEW -- 
CREATE OR REPLACE VIEW near_min_stock_level AS
SELECT p.product_id, 
       p.product_name, 
       p.product_size, 
       p.stock_quantity AS Current_quantity, 
       p.min_stock_level
 FROM product p
 WHERE p.stock_quantity - p.min_stock_level < 15;
       
SELECT * FROM near_min_stock_level;
       
-- SUPPLIER STATISTICS VIEW --       
CREATE OR REPLACE VIEW supplier_statistics AS
SELECT s.supplier_id as ID,
       s.supplier_name, 
       SUM(p.stock_quantity) AS Quantity_supplied, 
       SUM(p.product_price * p.stock_quantity) AS Total_value
 FROM supplier s
 JOIN product p 
 ON p.supplier_id = s.supplier_id
 GROUP BY s.supplier_id, s.supplier_name;
       
SELECT * FROM supplier_statistics ORDER BY Total_value ASC;


-- WAREHOUSE COORDINATOR ACTIVITY VIEW -- 
CREATE OR REPLACE VIEW warehouse_coordinator_activity AS
SELECT wh_c.wh_coordinator_id AS ID, 
       wh_c.wh_coordinator_name AS Warehouse_coordinator_name, 
       COUNT(dept_o.wh_coordinator_id) AS Orders_fulfilled
 FROM wh_coordinator wh_c
 where dept_o.status = 'Completed';
 JOIN department_order dept_o ON dept_o.wh_coordinator_id = wh_c.wh_coordinator_id
 GROUP BY wh_c.wh_coordinator_id, wh_c.wh_coordinator_name
 ORDER BY Orders_fulfilled DESC;

SELECT * FROM warehouse_coordinator_activity;

-- DEPARTMENT STATISTICS VIEW --
CREATE OR REPLACE VIEW department_statistics AS
SELECT dept.department_id AS ID, 
       dept.department_name AS Department_name, 
       SUM(dept_o.quantity) AS Products_requested,
       SUM(p.product_price * dept_o.quantity) AS Total_value
 FROM department dept
 join department_order dept_o on dept_o.dept_id = dept.department_id
 JOIN product p on p.product_id = dept_o.product_id
 GROUP BY dept.department_id, dept.department_name
 ORDER BY Total_value DESC;
 
 SELECT * FROM department_statistics;
