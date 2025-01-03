CREATE OR REPLACE PACKAGE pkg_order IS
  PROCEDURE warehouse_order_proc(p_wh_coordinator_id IN NUMBER
                           ,p_product_id        IN NUMBER
                           ,p_quantity          IN NUMBER);

  PROCEDURE deliver_to_warehouse(p_wh_order_id IN NUMBER);
  
  PROCEDURE department_order_proc(p_dept_id            IN NUMBER
                            ,p_wh_coordinator_id IN NUMBER
                            ,p_product_id         IN NUMBER
                            ,p_quantity           IN NUMBER);
                            
    PROCEDURE deliver_to_department(p_dept_order_id IN NUMBER);
END pkg_order;
