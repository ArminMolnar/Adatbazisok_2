# **Databases 2**
Warehouse management system as part of course assignment.  
The system tracks the movement of products between warehouse coordinators, departments and suppliers.

## **Instruction**
Execute the files in order to test the database. 

# **Database objects**
## Tables
- product
- warehouse
- wh_coordinator
- department
- supplier
- department_order
- warehouse_order
- product_history
- error_log

## Views
- current_stock
- clothing_wh_current_stock
- near_min_stock_level
- supplier_statistics
- warehouse_coordinator_activity
- department_statistics

## Packages
### pkg_order
- add_product procedure
- delete_product procedure
- list_low_stock procedure

### pkg_product
- warehouse_order_proc procedure
- deliver_to_warehouse procedure
- department_order_proc procedure
- deliver_to_department procedure
- list_active_dept_order function
