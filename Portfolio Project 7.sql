--Inspecting Data
SELECT *
FROM sales_data_sample

--Checking unique values
SELECT DISTINCT status 
FROM sales_data_sample

SELECT DISTINCT year_id
FROM sales_data_sample

SELECT DISTINCT productline
FROM sales_data_sample

SELECT DISTINCT country
FROM sales_data_sample

SELECT DISTINCT dealsize
FROM sales_data_sample

SELECT DISTINCT territory 
FROM sales_data_sample

--Analysis
SELECT productline, SUM(sales) as revenue
FROM sales_data_sample
GROUP BY productline
ORDER BY revenue desc

SELECT year_id, SUM(sales) as revenue
FROM sales_data_sample
GROUP BY year_id
ORDER BY revenue desc

SELECT DISTINCT month_id
FROM sales_data_sample
WHERE year_id = 2005

SELECT dealsize, SUM(sales) as revenue
FROM sales_data_sample
GROUP BY dealsize
ORDER BY revenue desc

--What was the best month for sales in a specific year? How much was earned that month?
SELECT month_id, SUM(sales) as revenue, COUNT(ordernumber) Frequency
FROM sales_data_sample
WHERE year_id = 2004 --change year to see the rest
GROUP BY month_id
ORDER BY revenue desc

--November seems to be the best month for all years, what products do they sell?
SELECT month_id, productline, SUM(sales) as revenue, COUNT(ordernumber) Frequency
FROM sales_data_sample
WHERE year_id = 2004 --change year to see the rest
GROUP BY month_id, productline
ORDER BY revenue desc

--What city has the highest number of sales in a specific country
SELECT city, SUM(sales) Revenue
FROM sales_data_sample
WHERE country = 'UK'
GROUP BY city
ORDER BY 2 desc

---What is the best product in United States?
SELECT country, YEAR_ID, PRODUCTLINE, SUM(sales) Revenue
FROM sales_data_sample
WHERE country = 'USA'
GROUP BY  country, YEAR_ID, PRODUCTLINE
ORDER BY 4 desc