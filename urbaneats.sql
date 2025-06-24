START TRANSACTION;

DROP TABLE IF EXISTS customer_details, orders, menu, urban_eats;




CREATE TABLE customer_details (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
phone DOUBLE NOT NULL,
email VARCHAR(50) NOT NULL,
order_info INT NOT NULL UNIQUE,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
order_number INT NOT NULL REFERENCES customer_details(id),
order_amount DOUBLE NOT NULL,
order_items VARCHAR(200) NOT NULL,
points_awarded INT NULL DEFAULT 0
);

CREATE TABLE menu (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
restaraunt_id INT NOT NULL UNIQUE,
menu_theme VARCHAR(50) NOT NULL
);

CREATE TABLE urban_eats (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
store_num INT NOT NULL UNIQUE,
menu_id INT NOT NULL REFERENCES menu(restaraunt_id),
customer_info VARCHAR(100) NOT NULL REFERENCES customer_details(id)

);

INSERT INTO customer_details(phone, email, order_info)
VALUES(1112223333, 'fake@gmail.com', 1),
(4445556666, 'AnonYmous@protonmail.net', 2);

INSERT INTO orders(order_number, order_amount, order_items, points_awarded)
VALUES(1, 50, 'CheeseBurger, Pina Colada, Fries, Beans', 5),
(1, 10, 'Fried Cheese', 1);

INSERT INTO menu(restaraunt_id, menu_theme)
VALUES(1, 'Hawaiian'),
(2, 'Thai'); 

INSERT INTO urban_eats(store_num, menu_id, customer_info)
Values(1, 1, 1),
(2, 2, 2);



ROLLBACK