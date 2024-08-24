# Windows Function
In SQL, a **window function** allows you to perform calculations across a set of table rows that are somehow related to the current row. Unlike aggregate functions, which collapse the rows into a single result, window functions do not cause rows to be grouped into a single output row; instead, they maintain the individual rows and add the result of the function as a new column.

### Key Features of Window Functions:
1. **Partitioning**: You can partition the data into subsets (like a GROUP BY), and the window function is applied within each partition. Use the `PARTITION BY` clause for this.
2. **Ordering**: You can specify the order of rows within a partition using the `ORDER BY` clause.
3. **Framing**: You can define a "window frame" within the partition to limit the number of rows the function considers. The `ROWS` or `RANGE` clause is used for this.

### Common Window Functions:
- **`ROW_NUMBER()`**: Assigns a unique number to each row within a partition, ordered by the `ORDER BY` clause.
- **`RANK()`**: Assigns a rank to each row within a partition, with the same rank for ties, and gaps in ranking numbers.
- **`DENSE_RANK()`**: Similar to `RANK()`, but without gaps in ranking numbers.
- **`NTILE(n)`**: Distributes rows into `n` approximately equal parts.
- **`LAG()`** and **`LEAD()`**: Access data from a previous or following row within the same result set.
- **`SUM()`**, **`AVG()`**, **`COUNT()`**, **`MAX()`**, **`MIN()`**: These aggregate functions can be used as window functions to calculate running totals, moving averages, etc.

### Basic Syntax:
```sql
SELECT 
    column_name,
    window_function() OVER (
        PARTITION BY column_name 
        ORDER BY column_name 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS alias_name
FROM table_name;
```

### Example:
Suppose you have a `sales` table with columns `employee_id`, `sales_amount`, and `sale_date`, and you want to calculate the cumulative sum of sales for each employee:

```sql
SELECT 
    employee_id,
    sale_date,
    sales_amount,
    SUM(sales_amount) OVER (
        PARTITION BY employee_id 
        ORDER BY sale_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM sales;
```

This query calculates the cumulative sales amount for each employee ordered by the sale date.

Window functions are powerful tools in SQL for performing complex calculations and analyses on your data without losing the row-level detail.