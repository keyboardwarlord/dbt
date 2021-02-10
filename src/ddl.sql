CREATE TABLE customer(
    customer_id INT,
    customer_fname VARCHAR(20),
	customer_lname VARCHAR(20),
    customer_city VARCHAR(10),
    customer_address VARCHAR(20),

    PRIMARY KEY(customer_id)
	);

CREATE TABLE category(
    category_id INT,
    category_name VARCHAR(20),

    PRIMARY KEY(category_id)
	);


CREATE TABLE shoe(
    shoe_id INT,
    shoe_name VARCHAR(40),
    shoe_clr VARCHAR(10),
	shoe_size INT,
    shoe_price DECIMAL(6,2),
    shoe_stock_count INT,
    shoe_category1 INT,
    shoe_category2 INT,

    PRIMARY KEY(shoe_id),
    FOREIGN KEY(shoe_category1) REFERENCES category(category_id),
	FOREIGN KEY(shoe_category2) REFERENCES category(category_id)
	);





CREATE TABLE orders(
    orders_id INT,
    customer_id INT,
    orders_date DATE,
	orders_cost DECIMAL(7,2),

    PRIMARY KEY(orders_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
	);

CREATE TABLE orders_details(
	orders_pk INT,
    orders_id INT,
    shoe_id INT,

    PRIMARY KEY(orders_pk),
	FOREIGN KEY(orders_id) REFERENCES orders(orders_id),
	FOREIGN KEY(shoe_id) REFERENCES shoe(shoe_id)
	);


INSERT INTO customer
VALUES
	(1, 'f1', 'l1', 'stad1', 'gata1'),
	(2, 'f2', 'l2', 'stad2', 'gata2'),
	(3, 'f3', 'l3', 'stad2', 'gata3'),
	(4, 'f4', 'l4', 'stad2', 'gata4'),
	(5, 'f5', 'l5', 'stad3', 'gata5');

INSERT INTO category
VALUES
	(1, 'Running'),
	(2, 'Casual'),
	(3, 'Finskor'),
	(4, 'Slippers'),
	(5, 'Boots');

INSERT INTO shoe
VALUES
	(1, 'nike run', 'Black', 42, 500, 10, 1, null),
	(2, 'adidas run', 'White', 44, 600, 15, 1, null),
	(3, 'ecco sandals', 'Black', 38, 300, 5, 2, null),
	(4, 'finskor', 'Brown', 43, 1200, 10, 3, null),
	(5, 'slippers', 'Grey', 39, 200, 40, 4, 2),
	(6, 'adidas run', 'Red', 41, 600, 25, 1, null),
	(7, 'brown boots', 'Brown',44, 800, 10, 5, null),
	(8, 'nike green run', 'Green',47, 500, 4, 1, null);

INSERT INTO orders
VALUES
	(1, 1, '2020-01-01', 500),
	(2, 2, '2020-02-01', 600),
	(3, 3, '2020-02-02', 1100),
	(4, 4, '2020-03-01', 1200),
	(5, 5, '2020-04-01', 200),
	(6, 1, '2020-05-01', 600);

INSERT INTO orders_details
VALUES
	(1 ,1, 1),
	(2 ,2, 2),
	(3 ,3, 3),
	(4 ,3, 7),
	(5 ,4, 4),
	(6 ,5, 5),
	(7 ,6, 6);

