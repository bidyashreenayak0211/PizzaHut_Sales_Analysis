-- Intermediate:

-- 1.Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT pizza_types.category, SUM(order_details.quantity) AS quantity
FROM pizza_types
INNER JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
INNER JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- 2.Determine the distribution of orders by hour of the day.
SELECT HOUR(order_time) AS Hour, COUNT(order_id) As order_count
FROM orders
GROUP BY HOUR(order_time);

-- 3.Join relevant tables to find the category-wise distribution of pizzas.
SELECT category, COUNT(name) AS Name
FROM pizza_types
GROUP BY category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT ROUND(AVG(quantity), 0) AS average_number_of_pizzas_ordered_per_day
FROM
(SELECT orders.order_date, SUM(order_details.quantity) AS quantity
FROM orders INNER JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY orders.order_date) AS order_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.
SELECT pizza_types.name,
SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM pizza_types
INNER JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
INNER JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY total_revenue DESC 
LIMIT 3;