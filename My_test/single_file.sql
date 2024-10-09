/*
**Question 1:**  
Write a SQL query to find the total sales for each product from a `sales` table. The table has the following columns: `product_id`, `sale_amount`, and `sale_date`.
*/

SELECT product_id,SUM(sale_amount) AS total_sale FROM sales
GROUP BY product_id;

