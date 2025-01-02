CREATE TABLE product(
       product_id NUMBER PRIMARY KEY,
       supplier_id NUMBER NOT NULL,
       warehouse_id NUMBER NOT NULL,
       product_name VARCHAR2(30) NOT NULL,
       product_category VARCHAR2(30) NOT NULL,
       product_size VARCHAR2(20),
       stock_quantity NUMBER NOT NULL, 
       measurement_unit VARCHAR2(10),      
       product_price NUMBER NOT NULL,
       min_stock_level NUMBER,
       max_stock_level NUMBER,
       created_on DATE DEFAULT SYSDATE NOT NULL,
       last_mod DATE,
       mod_user varchar2(100),
       dml_flag VARCHAR2(1),
       version NUMBER,
       constraint supplier_fk foreign key (supplier_id) references supplier(supplier_id),
       constraint warehouse_fk foreign key (warehouse_id) references warehouse(warehouse_id),
       constraint quantity_positive_check check (stock_quantity >= 0),
       constraint price_positive_check check (product_price >= 0)
       )TABLESPACE users;


CREATE TABLE warehouse(
       warehouse_id NUMBER PRIMARY KEY,
       warehouse_name VARCHAR2(30) NOT NULL,       
       warehouse_coordinator_id NUMBER NOT NULL,
       created_on DATE DEFAULT SYSDATE NOT NULL,
       last_mod DATE,
       mod_user varchar2(100),
       dml_flag VARCHAR2(1),
       version NUMBER,
       constraint wh_coordinator_fk foreign key (warehouse_coordinator_id) references wh_coordinator(wh_coordinator_id)   
)TABLESPACE users;

CREATE TABLE wh_coordinator(
       wh_coordinator_id NUMBER PRIMARY KEY,
       wh_coordinator_name VARCHAR2(50) NOT NULL,
       wh_coordinator_rank VARCHAR2(30),
       phone_number VARCHAR2(20) NOT NULL,
       email VARCHAR2(40),
       created_on DATE DEFAULT SYSDATE NOT NULL,
       last_mod DATE,
       mod_user varchar2(100),
       dml_flag VARCHAR2(1),
       version NUMBER       
)TABLESPACE users;

CREATE TABLE supplier(
       supplier_id NUMBER PRIMARY KEY,
       supplier_name VARCHAR2(50) NOT NULL,
       postal_code NUMBER NOT NULL,
       city VARCHAR2(20) NOT NULL,
       street VARCHAR2(50) NOT NULL,
       phone_number VARCHAR2(20) NOT NULL,
       email VARCHAR2(40),
       contact_person VARCHAR2(50),
       created_on DATE DEFAULT SYSDATE NOT NULL,
       last_mod DATE,
       mod_user varchar2(100),
       dml_flag VARCHAR2(1),
       version NUMBER         
)TABLESPACE users;

CREATE TABLE department(
       department_id NUMBER PRIMARY KEY,
       department_name VARCHAR2(50) NOT NULL,
       phone_number VARCHAR2(20) NOT NULL,
       email VARCHAR2(40),
       supply_coordinator VARCHAR2(50),
       created_on DATE DEFAULT SYSDATE NOT NULL,
       last_mod DATE,
       mod_user varchar2(100),
       dml_flag VARCHAR2(1),
       version NUMBER        
)TABLESPACE users;

CREATE TABLE warehouse_order(
       wh_order_id NUMBER PRIMARY KEY,
       wh_coordinator_id NUMBER NOT NULL,
       supplier_id NUMBER NOT NULL,
       product_id NUMBER NOT NULL,
       quantity NUMBER NOT NULL,
       order_date DATE NOT NULL,
       completion_date DATE,
       status VARCHAR2(30) NOT NULL,
       created_on DATE DEFAULT SYSDATE NOT NULL,
       last_mod DATE,
       mod_user varchar2(100),
       dml_flag VARCHAR2(1),
       version NUMBER         
)TABLESPACE users;


CREATE TABLE department_order(
       dept_order_id NUMBER PRIMARY KEY,
       dept_id NUMBER NOT NULL,
       wh_coordinator_id NUMBER NOT NULL,
       product_id NUMBER NOT NULL,
       quantity NUMBER NOT NULL,
       order_date DATE NOT NULL,
       completion_date DATE,
       status VARCHAR2(30) NOT NULL,
       created_on DATE DEFAULT SYSDATE NOT NULL,
       last_mod DATE,
       mod_user varchar2(100),
       dml_flag VARCHAR2(1),
       version NUMBER         
)TABLESPACE users;


CREATE TABLE product_history(       
       product_id NUMBER,
       supplier_id NUMBER,
       warehouse_id NUMBER,
       product_name VARCHAR2(30),
       product_category VARCHAR2(30),
       product_size VARCHAR2(20), 
       stock_quantity NUMBER, 
       measurement_unit VARCHAR2(10),      
       product_price NUMBER,
       min_stock_level NUMBER,
       max_stock_level NUMBER,
       created_on DATE,
       last_mod DATE,
       mod_user varchar2(100),
       dml_flag VARCHAR2(1),
       version NUMBER       
)TABLESPACE users;






