-- insert into SUPPLIER
insert into supplier (supplier_name, postal_code, city, street, phone_number, email, contact_person)
values ('ArmyWear Co.', '1117', 'Budapest', 'Karinthy Frigyes st. 17.', '+36201478997', 'armywear@gmail.com', 'Szabolcs Nagy');

insert into supplier (supplier_name, postal_code, city, street, phone_number, email, contact_person)
values ('SuperMarch Essentials', '5256', 'Sopron', 'Diadal st. 5.', '+36203656542', 'supermarch@gmail.com', 'Emese Varga');

insert into supplier (supplier_name, postal_code, city, street, phone_number, email, contact_person)
values ('Tacticraft Supply Co.', '6100', 'Zalazomos',  'Szabadsag st. 14.', '+36205938571', 'tacticraft@gmail.com', 'Ferenc Belovics');

-- insert into DEPARTMENT
insert into department (department_name, phone_number, email, supply_coordinator)
values ('Office', '+36208348512', 'office@mh.outlook.com', 'Peter Toth');

insert into department (department_name, phone_number, email, supply_coordinator)
values ('Training detachment', '+36209384727', 'training.det@mh.outlook.com', 'Janos Medvegy');

insert into department (department_name, phone_number, email, supply_coordinator)
values ('Special Forces', '+36209238591', 'special.forces@mh.outlook.com', 'Gyorgy Karnis');

-- insert into WH_COORDINATOR
insert into wh_coordinator (wh_coordinator_name, wh_coordinator_rank, phone_number, email)
values ('Attila Balogh', 'Sergeant', '+36305258274', 'attila.balogh@mh.outlook.com');

insert into wh_coordinator (wh_coordinator_name, wh_coordinator_rank, phone_number, email)
values ('David Nagy', 'Warrant Officer', '+36308573819', 'david.nagy@mh.outlook.com');

insert into wh_coordinator (wh_coordinator_name, wh_coordinator_rank, phone_number, email)
values ('Arnold Jerosics', 'Staff Sergeant', '+36309284710', 'arnold.jerosics@mh.outlook.com');

-- insert into WAREHOUSE
insert into warehouse (warehouse_name, warehouse_coordinator_id)
values ('Uniform and Gear Warehouse', (select whc.wh_coordinator_id from wh_coordinator whc where whc.wh_coordinator_name = 'Attila Balogh'));

insert into warehouse (warehouse_name, warehouse_coordinator_id)
values ('Footwear Warehouse', (select whc.wh_coordinator_id from wh_coordinator whc where whc.wh_coordinator_name = 'David Nagy'));

insert into warehouse (warehouse_name, warehouse_coordinator_id)
values ('Tactical Equipment Warehouse', (select whc.wh_coordinator_id from wh_coordinator whc where whc.wh_coordinator_name = 'Arnold Jerosics'));

-- insert into PRODUCT
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'winter combat pants', 'clothing', 'S 44-46', 40, 'ea', 15245, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'winter combat pants', 'clothing', 'M 48-50', 45, 'ea', 15245, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'winter combat pants', 'clothing', 'L 52-54', 42, 'ea', 15245, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'winter combat pants', 'clothing', 'XL 56-58', 38, 'ea', 15245, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'winter combat shirt', 'clothing', 'S 44-46', 40, 'ea', 16525, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'winter combat shirt', 'clothing', 'M 48-50', 41, 'ea', 16525, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'winter combat shirt', 'clothing', 'L 52-54', 38, 'ea', 16525, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'winter combat shirt', 'clothing', 'XL 56-58', 34, 'ea', 16525, 15, 120);

insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'field cap', 'clothing', 'one-size', 66, 'ea', 5400, 30, 240);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'tactical scarf', 'clothing', 'one-size', 132, 'ea', 3200 , 30, 240);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'tactical gloves', 'clothing', 'S 7', 70, 'pairs', 1500, 20, 160);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'tactical gloves', 'clothing', 'M 8', 75, 'pairs', 1500, 20, 160);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'ArmyWear Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Uniform and Gear Warehouse'), 'tactical gloves', 'clothing', 'L 9', 82, 'pairs', 1500, 20, 160);

insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '37', 32, 'pairs', 50000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '38', 35, 'pairs', 50000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '39', 28, 'pairs', 50000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '40', 39, 'pairs', 50000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '41', 29, 'pairs', 50000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '42', 35, 'pairs', 50000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '43', 40, 'pairs', 50000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '44', 38, 'pairs', 50000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '45', 27, 'pairs', 50000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'field boots', 'footwear', '46', 23, 'pairs', 50000, 15, 120);

insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'slippers', 'footwear', '37-38', 21, 'pairs', 3000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'slippers', 'footwear', '39-41', 25, 'pairs', 3000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'slippers', 'footwear', '41-42', 29, 'pairs', 3000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'slippers', 'footwear', '43-44', 34, 'pairs', 3000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'SuperMarch Essentials'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Footwear Warehouse'), 'slippers', 'footwear', '45-46', 30, 'pairs', 3000, 15, 120);

insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'Tacticraft Supply Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Tactical Equipment Warehouse'), 'tactical backpack', 'tactical equipment', '36L', 36, 'ea' ,8400, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'Tacticraft Supply Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Tactical Equipment Warehouse'), 'tactical backpack', 'tactical equipment', '36L+', 42, 'ea', 15000, 15, 120);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'Tacticraft Supply Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Tactical Equipment Warehouse'), 'field tent', 'tactical equipment', '2-4', 20, 'person', 145000, 5, 40);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'Tacticraft Supply Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Tactical Equipment Warehouse'), 'field tent', 'tactical equipment', '4-6', 20, 'person', 254000, 5, 40);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'Tacticraft Supply Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Tactical Equipment Warehouse'), 'field tent', 'tactical equipment', '6-8', 12, 'person', 300000, 5, 40);
insert into product (supplier_id, warehouse_id, product_name, product_category, product_size, stock_quantity, measurement_unit, product_price, min_stock_level, max_stock_level)
values ((select s.supplier_id from supplier s where s.supplier_name = 'Tacticraft Supply Co.'), 
(select wh.warehouse_id from warehouse wh where wh.warehouse_name = 'Tactical Equipment Warehouse'), 'flashlight', 'tactical equipment', '',60, 'ea', 6000, 25, 200);




