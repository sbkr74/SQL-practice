/*
**Question 1:**  
Write a SQL query to find the total sales for each product from a `sales` table. 
The table has the following columns: `product_id`, `sale_amount`, and `sale_date`.
*/

SELECT product_id,SUM(sale_amount) AS total_sale FROM sales
GROUP BY product_id;

/*
Question 2:
Write a SQL query to find the second highest sale_amount from the sales table.
*/

SELECT MAX(sale_amount) AS second_highest
FROM sales
where sale_amount< (SELECT MAX(sale_amount) FROM sales);

-- USING LIMIT

SELECT sale_amount 
FROM sales
ORDER BY sale_amount DESC
LIMIT 1 OFFSET 1;

/*
Question 3:
Write a SQL query to find all products that have never been sold (i.e., products that do not appear in the sales table). 
and sales` table having columns: `product_id`, `sale_amount`, and `sale_date`
Assume there is a products table with columns product_id and product_name.
*/

SELECT p.product_id,p.product_name
FROM products p
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM sales);

/*
(Question 4):
Write a SQL query to find the total number of sales made for each product. Return the product_id, product_name, and the total count of sales.
*/

SELECT p.product_id,p.product_name, COUNT(s.sale_amount) 
FROM products p 
LEFT JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id,p.product_name;   

/*
Question 5:
Write a SQL query to retrieve the product names that have sales greater than $200. Return only the distinct product names.
*/

SELECT DISTINCT p.product_name,s.sale_amount 
FROM products p
INNER JOIN sales s ON p.product_id=s.product_id
WHERE s.sale_amount > 200;

/*
Question 6:
Write a SQL query to find the total sales amount for each product category. 
Assume there is a categories table with the following columns: category_id, category_name, and product_id (which links to the products table).
*/
