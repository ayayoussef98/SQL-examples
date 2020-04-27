CREATE DATABASE OrderProccessingSystem;

CREATE TABLE OrderProccessingSystem.customer(
customer_id int NOT NULL,
customer_name varchar(225) NOT NULL,
city varchar(225) NOT NULL,

PRIMARY KEY(customer_id)
);

CREATE TABLE OrderProccessingSystem.`order`(
  order_id int NOT NULL,
  order_date timestamp NOT NULL,
  customer_id int NOT NULL,

  PRIMARY KEY(order_id)
);

CREATE TABLE OrderProccessingSystem.order_item(
  order_id int NOT NULL,
  item_id int NOT NULL,
  quantity int NOT NULL,

  PRIMARY KEY(order_id,item_id)
);

CREATE TABLE OrderProccessingSystem.item(
  item_id int NOT NULL,
  unit_price double NOT NULL,

  PRIMARY KEY(item_id)
);

CREATE TABLE OrderProccessingSystem.shipment(
  order_id int NOT NULL,
  warehouse_id int NOT NULL,
  ship_date timestamp NOT NULL,

  PRIMARY KEY(order_id,warehouse_id)
);

CREATE TABLE OrderProccessingSystem.warehouse(
  warehouse_id int NOT NULL,
  warehouse_city varchar(225) NOT NULL,

 PRIMARY KEY(warehouse_id)
);


ALTER TABLE `order` ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE order_item ADD FOREIGN KEY (order_id) REFERENCES `order`(order_id);
ALTER TABLE order_item ADD FOREIGN KEY (item_id) REFERENCES item(item_id);
ALTER TABLE shipment ADD FOREIGN KEY (order_id) REFERENCES `order`(order_id);
ALTER TABLE shipment ADD FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id);
