CREATE DATABASE pizzahut ;
USE pizzahut;
CREATE TABLE orders(
order_id int NOT NULL,
order_date date NOT NULL,
order_time time NOT NULL,
PRIMARY KEY(order_id));

CREATE TABLE order_details(
order_details_id int NOT NULL,
order_id int NOT NULL,
pizza_id text NOT NULL,
quantity int  NOT NULL,
PRIMARY KEY(order_details_id));