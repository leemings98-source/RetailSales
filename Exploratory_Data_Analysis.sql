  -- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================
-- 1.0 Exploratory Data Analysis (EDA)
-- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================

-- Total Sales and profit

SELECT
    Round(SUM(sales_amount),2) AS Total_Sales, 
	Round(SUM(profit),2) AS Total_Profit
FROM retail_sales_staging2;


-- Sales by Category

SELECT
    product_category,
    Round(SUM(sales_amount),2) AS Total_Sales
FROM retail_sales_staging2
GROUP BY product_category;

-- Monthly Sales Trend

SELECT
    YEAR(order_date_clean) AS year,
    MONTH(order_date_clean) AS month,
    Round(SUM(sales_amount),2) AS Total_Sales
FROM retail_sales_staging2
GROUP BY year, month
ORDER BY year, month;

  -- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================
-- 2.0 Exploratory Data Analysis (EDA)
-- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================

-- Q1. Which category generates the highest sales?
SELECT
    product_category,
    Round(SUM(sales_amount),2) AS Total_Sales
FROM retail_sales_staging2
GROUP BY product_category
ORDER BY Total_Sales DESC;

-- Q1.5 Which category has the highest/lowest sales at each region?

with category_sales as(
select 
region,
product_category,
Round(SUM(sales_amount),2) as Total_Sales
from retail_sales_staging2
group by region,product_category)

select*
from (
select*,
rank()over(partition by region order by Total_Sales)as rnk
from category_sales
) t
where rnk in (1,7)
order by region, rnk desc;


-- Q2. Which gender spends more?

SELECT
    gender_clean,
    Round(SUM(sales_amount),2) AS Total_Sales
FROM retail_sales_staging2
GROUP BY gender_clean
ORDER BY Total_Sales desc;

-- Q3. which age group spends the most?

SELECT
    Age_Group,
    Round(SUM(sales_amount),2) AS Total_Sales
FROM retail_sales_staging2
GROUP BY Age_Group
ORDER BY Total_Sales desc;

-- Q4. Which region has the lowest customer satisfaction?

SELECT
    region, avg(customer_satisfaction)
FROM retail_sales_staging2
GROUP BY region
order by avg(customer_satisfaction) desc;

-- Q5 What was the most popular category sold at each region?(Frequency based)

SELECT
    region,
    product_category,
    COUNT(*) AS total_sales
FROM retail_sales_staging2
GROUP BY region, product_category
order by region;

SELECT
    region,
    product_category,
    COUNT(*) AS total_sales,
    ROW_NUMBER() OVER(
        PARTITION BY region
        ORDER BY COUNT(*) DESC
    ) AS ranking
FROM retail_sales_staging2
GROUP BY region, product_category;

WITH ranked_sales AS (
    SELECT
        region,
        product_category,
        COUNT(*) AS Sales_Frequency,
        ROW_NUMBER() OVER(
            PARTITION BY region
            ORDER BY COUNT(*) DESC
        ) AS ranking
    FROM retail_sales_staging2
    GROUP BY region, product_category
)

SELECT *
FROM ranked_sales
WHERE ranking = 1
ORDER BY region, ranking;

----------------------------------------------------------------
-- Q.5 What was the most popular category sold at each region?(Quantity based)

select distinct quantity 
from retail_sales_staging2;
		-- Quantity of -1 and 999 makes no sense.
        
select region,
Sum(quantity) as Sales,
product_category
from retail_sales_staging2
where quantity between 0 and 50
group by region,product_category
order by region;

SELECT
    region,
    product_category,
   Sum(quantity) as Sales,
    ROW_NUMBER() OVER(
        PARTITION BY region
        ORDER BY Sum(quantity) DESC
    ) AS ranking
FROM retail_sales_staging2
where quantity between 0 and 50
GROUP BY region, product_category;

WITH Ranked_Sales_Quantity AS (
    SELECT
        region,
        product_category,
         Sum(quantity) as Sales_Volume,
        ROW_NUMBER() OVER(
            PARTITION BY region
            ORDER BY Sum(quantity) DESC
        ) AS ranking
    FROM retail_sales_staging2
    where quantity between 0 and 50
    GROUP BY region, product_category
)

SELECT *
FROM Ranked_Sales_Quantity
WHERE ranking = 1
ORDER BY region, ranking;
 
