# Pizza Hut Sales Analysis Using SQL

## Overview

This project analyzes Pizza Hut sales data using MySQL. The process involves importing datasets using the MySQL Workbench and executing SQL queries to extract insights such as total revenue, top pizza types, and category-wise distributions.

---

## Tools Used

- **Database Software**: MySQL
- **Database Management Tool**: MySQL Workbench
- **Database Name**: `pizzahut`
- **Tables**: 
  - `Pizzas`
  - `Pizza_Types`
  - `Orders`
  - `Order_Details`

---

## Step-by-Step Guide

### 1. **Setting Up the Database**

1. **Create the Database**:
   - Open MySQL Workbench and connect to your MySQL server.
   - Execute the following SQL command to create the `pizzahut` database:
     ```sql
     CREATE DATABASE pizzahut;
     USE pizzahut;
     ```

---

### 2. **Importing Datasets Using the Table Data Import Wizard**

1. **Prepare the Dataset**:
   - Ensure all datasets are saved in CSV format.
   - Verify that the data has consistent headers and clean formatting.

2. **Open the Table Data Import Wizard**:
   - In MySQL Workbench, right-click on the `pizzahut` database in the "Schemas" panel.
   - Select **Table Data Import Wizard**.

3. **Import Each Dataset**:
   - Choose the CSV file you want to import.
   - Specify the table name (e.g., `Pizzas`, `Pizza_Types`, `Orders`, `Order_Details`).
   - Map the columns from the CSV file to the table fields.
   - Confirm and execute the import.

4. **Verify Data Import**:
   - After importing each dataset, run the following query to verify the data:
     ```sql
     SELECT * FROM table_name LIMIT 10;
     ```
     Replace `table_name` with the respective table name.

---

### 3. **Performing SQL Operations**

The following SQL operations are performed to analyze the data:

#### **Basic Queries**

1. **Retrieve the Total Number of Orders**:
   ```sql
   SELECT COUNT(*) AS Total_Orders FROM Orders;
   ```

2. **Calculate Total Revenue from Pizza Sales**:
   ```sql
   SELECT SUM(Order_Details.quantity * Pizzas.price) AS Total_Revenue
   FROM Order_Details
   JOIN Pizzas ON Order_Details.pizza_id = Pizzas.pizza_id;
   ```

3. **Identify the Highest-Priced Pizza**:
   ```sql
   SELECT name AS Highest_Priced_Pizza, price
   FROM Pizzas
   ORDER BY price DESC
   LIMIT 1;
   ```

4. **Find the Most Common Pizza Size Ordered**:
   ```sql
   SELECT size, COUNT(*) AS Order_Count
   FROM Orders
   GROUP BY size
   ORDER BY Order_Count DESC
   LIMIT 1;
   ```

---

#### **Intermediate Queries**

1. **Join Tables to Find Total Quantity of Each Pizza Category**:
   ```sql
   SELECT Pizza_Types.category, SUM(Order_Details.quantity) AS Total_Quantity
   FROM Order_Details
   JOIN Pizzas ON Order_Details.pizza_id = Pizzas.pizza_id
   JOIN Pizza_Types ON Pizzas.type_id = Pizza_Types.type_id
   GROUP BY Pizza_Types.category;
   ```

2. **Determine the Distribution of Orders by Hour**:
   ```sql
   SELECT HOUR(order_time) AS Order_Hour, COUNT(*) AS Order_Count
   FROM Orders
   GROUP BY Order_Hour
   ORDER BY Order_Hour;
   ```

3. **Find Category-Wise Distribution of Pizzas**:
   ```sql
   SELECT Pizza_Types.category, COUNT(*) AS Order_Count
   FROM Order_Details
   JOIN Pizzas ON Order_Details.pizza_id = Pizzas.pizza_id
   JOIN Pizza_Types ON Pizzas.type_id = Pizza_Types.type_id
   GROUP BY Pizza_Types.category;
   ```

4. **Calculate Average Pizzas Ordered Per Day**:
   ```sql
   SELECT order_date, AVG(quantity) AS Avg_Pizzas_Ordered
   FROM Order_Details
   JOIN Orders ON Order_Details.order_id = Orders.order_id
   GROUP BY order_date;
   ```

---

#### **Advanced Queries**

1. **Percentage Contribution of Each Pizza Type to Total Revenue**:
   ```sql
   SELECT Pizzas.name, 
          SUM(Order_Details.quantity * Pizzas.price) / 
          (SELECT SUM(Order_Details.quantity * Pizzas.price) FROM Order_Details 
           JOIN Pizzas ON Order_Details.pizza_id = Pizzas.pizza_id) * 100 AS Revenue_Percentage
   FROM Order_Details
   JOIN Pizzas ON Order_Details.pizza_id = Pizzas.pizza_id
   GROUP BY Pizzas.name;
   ```

2. **Analyze Cumulative Revenue Over Time**:
   ```sql
   SELECT Orders.order_date, 
          SUM(Order_Details.quantity * Pizzas.price) OVER (ORDER BY Orders.order_date) AS Cumulative_Revenue
   FROM Orders
   JOIN Order_Details ON Orders.order_id = Order_Details.order_id
   JOIN Pizzas ON Order_Details.pizza_id = Pizzas.pizza_id;
   ```

3. **Find Top 3 Most Ordered Pizza Types by Revenue for Each Category**:
   ```sql
   SELECT Pizza_Types.category, Pizzas.name, 
          SUM(Order_Details.quantity * Pizzas.price) AS Revenue
   FROM Order_Details
   JOIN Pizzas ON Order_Details.pizza_id = Pizzas.pizza_id
   JOIN Pizza_Types ON Pizzas.type_id = Pizza_Types.type_id
   GROUP BY Pizza_Types.category, Pizzas.name
   ORDER BY Pizza_Types.category, Revenue DESC
   LIMIT 3;
   ```

---

### 4. **Documenting Results**

- Record the outputs for each query.
- Summarize key insights such as:
  - Total revenue
  - Most popular pizzas
  - Revenue contribution by category
  - Peak order times

---

## Conclusion

Using the MySQL Workbench "Table Data Import Wizard" and executing these queries, we efficiently analyzed Pizza Hut sales data, gaining valuable insights to inform business strategies. 

--- 

Let me know if you need more details or further assistance!
