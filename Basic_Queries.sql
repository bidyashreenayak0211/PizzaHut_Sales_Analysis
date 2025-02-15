-- Basic Queries :

-- 1.Retrieve the total number of orders placed.
SELECT COUNT(*) AS Total_orders_placed FROM pizzahut.orders;

-- 2.Calculate the total revenue generated from pizza sales.
SELECT ROUND(SUM(order_details.quantity * pizzas.price),2) as Total_Revenue 
FROM order_details 
INNER JOIN pizzas 
ON pizzas.pizza_id = order_details.pizza_id;

-- 3.Identify the highest-priced pizza.
SELECT pizza_types.name, pizzas.price
FROM pizza_types 
INNER JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- 4.Identify the most common pizza size ordered.
SELECT 
     pizzas.size,
	 COUNT(order_details.order_details_id) AS order_count
FROM 
     pizzas
     INNER JOIN 
     order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;

-- 5.	List the top 5 most ordered pizza types along with their quantities.
SELECT pizza_types.name, COUNT(order_details.quantity) AS quantity
FROM pizza_types
INNER JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
INNER JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.name 
ORDER BY quantity DESC
LIMIT 5;
     
