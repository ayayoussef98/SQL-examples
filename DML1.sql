/*question 1*/
SELECT customer_name from customer where customer_name like 'Ma%';

/*question 2*/
SELECT order_id,sum(quantity),sum(unit_price*quantity) from order_item NATURAL JOIN item group by order_id;

/*question 3*/
SELECT order_id from shipment NATURAL JOIN warehouse where warehouse_city='Avennes';

/*question 4*/
SELECT sum(unit_price*quantity) from shipment NATURAL JOIN order_item NATURAL JOIN item where warehouse_id='3';

/*question 5*/
SELECT warehouse.warehouse_id,warehouse_city,order_id from warehouse LEFT JOIN shipment ON warehouse.warehouse_id=shipment.warehouse_id;

/*question 6*/
SELECT customer_name,count(order_id) from customer LEFT JOIN `order` ON customer.customer_id=`order`.customer_id group by customer.customer_id;

/*question 7*/
SELECT item.item_id from item where item.item_id not in(SELECT order_item.item_id from order_item);
