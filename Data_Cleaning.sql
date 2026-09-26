-- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================
-- Retail sales analysis report
-- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================

-- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================
-- 1.0 Data Inspection
-- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================
select*
from retail_sales_dataset;

SELECT Count(*) FROM retail_sales_dataset;

SELECT DISTINCT age
FROM retail_sales_dataset;

SELECT DISTINCT product_category
FROM retail_sales_dataset;

-- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================
-- 2.0 Data Cleaning
-- ===================================================================================================================================================================================================================================================================================================================================================================================================================================================

create table retail_sales_staging
like retail_sales_dataset;

insert retail_sales_staging
select * 
from retail_sales_dataset; 

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.1 deleting duplicate rows --
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select*,
row_number() over(
partition by order_id,order_date_clean, customer_id, customer_name, age, gender_clean, region, city, product_name, product_category,quantity, unit_price, discount_pct , sales_amount, profit, shipping_cost, payment_method, customer_satisfaction, return_flag, order_status, days_to_ship) as row_num
from retail_sales_staging
;

with duplicate_cte As
(
select*,
row_number() over(
partition by order_id,order_date_clean, customer_id, customer_name, age, gender_clean, region, city, product_name, product_category,quantity, unit_price, discount_pct , sales_amount, profit, shipping_cost, payment_method, customer_satisfaction, return_flag, order_status, days_to_ship) as row_num
from retail_sales_staging
)

select*
From duplicate_cte
where row_num > 1;

select *
 from retail_sales_staging
 where order_id = 'ORD-00084'
;

CREATE TABLE `retail_sales_staging2` (
  `order_id` text,
  `order_date_clean` text,
  `customer_id` text,
  `customer_name` text,
  `age` text,
  `gender_clean` text,
  `region` text,
  `city` text,
  `product_category` text,
  `product_name` text,
  `quantity` text,
  `unit_price` double DEFAULT NULL,
  `discount_pct` text,
  `sales_amount` text,
  `profit` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `payment_method` text,
  `customer_satisfaction` text,
  `return_flag` text,
  `order_status` text,
  `days_to_ship` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from retail_sales_staging2
;

insert into retail_sales_staging2
select*,
row_number() over(
partition by order_id,order_date_clean, customer_id, customer_name, age, gender_clean, region, city, product_name, product_category,quantity, unit_price, discount_pct , sales_amount, profit, shipping_cost, payment_method, customer_satisfaction, return_flag, order_status, days_to_ship) as row_num
from retail_sales_staging
;

delete
from retail_sales_staging2
where row_num > 1;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2 Updating/Cleaning Rows
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select customer_name, trim(customer_name)
from retail_sales_staging2;

update retail_sales_staging2
set customer_name = trim(customer_name);

select distinct age
from retail_sales_staging2
order by age;

select age, customer_name
from retail_sales_staging2
where age = '';

update retail_sales_staging2
set age = null
where trim(age)= '';

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select quantity, unit_price, discount_pct, sales_amount, profit
from retail_sales_staging2
where discount_pct = ''
 or quantity = ''
 or unit_price = ''
 or sales_amount = '';

update retail_sales_staging2
set quantity = null
where trim(quantity) = '';

update retail_sales_staging2
set discount_pct = Null
where trim(discount_pct ) = '';

update retail_sales_staging2
set customer_satisfaction = Null
where trim(customer_satisfaction) = '';

update retail_sales_staging2
set days_to_ship = Null
where trim(days_to_ship) = '';

 Select
    SUM(quantity is null) as missing_quantity,
    SUM(unit_price is null) as missing_unit_price,
    SUM(discount_pct is null) as missing_discount
From retail_sales_staging2;  
 
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

     SELECT 
    *,
    CASE
        WHEN age IS NULL THEN 'Missing age'
        WHEN age < 12 OR age > 90 THEN 'Invalid age'
        ELSE 'Valid age'
    END AS age_check,
    CASE
        WHEN age BETWEEN 12 AND 90 THEN age
        ELSE NULL
    END AS cleaned_age
FROM
    retail_sales_staging;
    
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select order_date_clean,
str_to_date(order_date_clean, '%Y-%m-%d')
FROM retail_sales_staging2;  

update retail_sales_staging2
set order_date_clean = str_to_date(order_date_clean, '%Y-%m-%d');

Alter table retail_sales_staging2
modify column order_date_clean date; 

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.3 Checking Sales Amount Formula
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
    *,
    quantity * unit_price * (1 - discount_pct) AS calculated_sales_amount,
    sales_amount - (quantity * unit_price * (1 - discount_pct)) AS sales_difference,
    CASE
        WHEN quantity IS NULL
          OR unit_price IS NULL
          OR discount_pct IS NULL
            THEN 'Missing input'
        WHEN quantity <= 0
          OR quantity >= 999
            THEN 'Invalid quantity'
        WHEN ABS(
            sales_amount - (quantity * unit_price * (1 - discount_pct))
        ) > 0.01
            THEN 'Sales mismatch'
        ELSE 'Valid'
    END AS sales_check
        FROM retail_sales_staging2;

with Price_Check as(
SELECT
    *,
    quantity * unit_price * (1 - discount_pct) AS calculated_sales_amount,
    sales_amount - (quantity * unit_price * (1 - discount_pct)) AS sales_difference,
    CASE
        WHEN quantity IS NULL
          OR unit_price IS NULL
          OR discount_pct IS NULL
            THEN 'Missing input'
        WHEN quantity <= 0
          OR quantity >= 999
            THEN 'Invalid quantity'
        WHEN ABS(
            sales_amount - (quantity * unit_price * (1 - discount_pct))
        ) > 0.01
            THEN 'Sales mismatch'
        ELSE 'Valid'
    END AS sales_check
        FROM retail_sales_staging2)
select sales_check, count(*) as count
from Price_Check
group by sales_check;

SELECT Count(*) FROM retail_sales_staging2;

select quantity, unit_price, discount_pct, sales_amount, profit,
profit/(sales_amount - unit_price) as quantity_values
from retail_sales_staging2
where quantity is null; 

-- Question. Is the discount accurate?

select *,
	case
		when round((1 - (sales_amount / (quantity * unit_price))) * 100,2)= round(discount_pct,2) then 'Accurate Discount'
        else 'False Discount'
	end as discount_check
    From retail_sales_staging2;

-- Answer. No, not at all.

SELECT
    SUM(CASE
        WHEN quantity IS NULL
          OR unit_price IS NULL
          OR discount_pct IS NULL
        THEN 1 ELSE 0
    END) AS missing_input,

    SUM(CASE
        WHEN quantity <= 0
          OR quantity >= 999
        THEN 1 ELSE 0
    END) AS invalid_quantity,

    SUM(CASE
        WHEN ABS(
            sales_amount -
            (quantity * unit_price * (1 - discount_pct))
        ) > 0.01
        THEN 1 ELSE 0
    END) AS sales_mismatch,

    COUNT(*) AS total_rows
FROM retail_sales_staging2;


-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.4 Dropping, Adding Updating Columns/Column type
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

alter table retail_sales_staging2
  drop column row_num;
  
alter table retail_sales_staging2
  drop column days_to_ship;
  
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT quantity
FROM retail_sales_staging2
WHERE quantity NOT REGEXP '^-?[0-9]+$'
  AND quantity IS NOT NULL;
  
SELECT unit_price
FROM retail_sales_staging2
WHERE unit_price NOT REGEXP '^-?[0-9]+(\\.[0-9]+)?$'
  AND unit_price IS NOT NULL;
  
SELECT age
FROM retail_sales_staging2
WHERE age NOT REGEXP '^-?[0-9]+$'
  AND age IS NOT NULL;

alter table retail_sales_staging2
	modify Column age INT,
	modify Column quantity INT,
	modify Column sales_amount double,
	modify Column discount_pct double,
	modify Column customer_satisfaction INT;
    
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 SELECT
	age,
    Case 
		When age is Null then 'unknown'
		when age < 13 then 'Children'
        when age < 20 then 'Teenagers'
        when age < 31 then 'Young Adults'
		when age <= 45 then 'Adults'
		when age > 45 then 'Seniors'
	End As Age_Group
    From retail_sales_staging2;
    
alter table retail_sales_staging2
	add Column Age_Group varchar(20);
    
 Select * 
 From retail_sales_staging2;
 
 Update retail_sales_staging2
	Set Age_Group = 
		Case
			When age is Null then 'unknown'
            when age < 13 then 'Children'
			when age < 20 then 'Teenagers'
			when age < 31 then 'Young Adults'
			when age <= 45 then 'Adults'
            Else 'Seniors'
		End;
        
