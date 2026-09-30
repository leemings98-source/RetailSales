# E-Commerce Retail Sales Analysis — SQL & Power BI
*Data cleaning, validation, exploratory analysis and business reporting using SQL and Power BI.*

## Dashboard preview
<img width="1485" height="832" alt="{5939E85D-2EF9-485B-9A5C-6B0AF96E99F2}" src="https://github.com/user-attachments/assets/626befe0-bc96-422e-b288-786448a52725" />
<img width="1528" height="859" alt="{A2CAA12B-91C7-4615-A5FA-8C77AE625C89}" src="https://github.com/user-attachments/assets/f063633b-a4ad-42a4-b9cb-90f1f6dfae05" />


## Background Overview
*Dataset*: Publicly available synthetic retail/e-commerce transaction dataset.

*Records*: 4,280 raw rows / 4,200 rows after duplicate removal.

*Scope*: Customer demographics, orders, products, pricing, discounts, sales, profit, shipping, satisfaction and returns.

The original dataset source could not be reliably identified, so the dataset is treated as an external sample dataset rather than as verified business data.

| Table of contents|
|---------------------------------------------------------|
|1. [Project Overview](https://github.com/leemings98-source/RetailSales/blob/main/README.md#project-overview)|                
|2. [Data Preparation](https://github.com/leemings98-source/RetailSales/blob/main/README.md#data-preparation)|        
|3. [Analytical Questions](https://github.com/leemings98-source/RetailSales/blob/main/README.md#analytical-questions)        |  
|4. [Key Findings](https://github.com/leemings98-source/RetailSales/blob/main/README.md#key-findings)
|5. [Business Interpretation](https://github.com/leemings98-source/RetailSales/blob/main/README.md#business-interpretation) |     
|6. [Data Quality Limitations](https://github.com/leemings98-source/RetailSales/blob/main/README.md#data-limitations) |     
|7. [What I Learned](https://github.com/leemings98-source/RetailSales/blob/main/README.md#what-i-learned)     |     

Project Resources 
- [Base Raw Dataset](https://drive.google.com/file/d/1Gu6dPev0gi37cOZuMHf0Qxwylf6O4Fw-/view?usp=sharing)
- [Interactive PowerBI Dashboard](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing)
- [SQL Data Cleaning and EDA](https://drive.google.com/file/d/19nchITkHaSc_gpCQ88CPJWE7F-PJrp6o/view?usp=sharing)


## Project Overview
### Objective
Analyze retail transaction data to understand the drivers of sales and profit, identify regional differences in customer satisfaction and returns, and evaluate product performance across multiple business metrics.

#### Key Business questions that will be explored 
1. Which product categories generate the most sales and profit?
2. Which products perform differently when measured by revenue, quantity and order frequency?
3. How does sales and profit performance vary by region?
4. How does customer satisfaction differ between regions?
5. Are lower satisfaction scores associated with higher return rates?
6. How has product and financial performance changed over time?
7. How reliable are the dataset's reported sales and profit values?

### Data Structure Overview
The dataset's base structure is made up of one table , 20 columns, and consists of 4,200 rows of data providing a suitable sample for exploratory analysis. The columns contained in the dataset is as follows: 

| *Column* | *Meaning* | *Type* |
|---------|--------------------|----------------------------|
|Order id|Unique order identifier|ID|              
|Order date|Date of transaction|Date|      
|Customer Id|Unique order identifier|ID|
|Customer Name| Customer Name|String|
|Age| Customer Age|Numeric|
|Gender| Customer Gender|String|
|Region|Region Product is Purchased|String|
|City| City Product is Purchased|String|
|Product Name| Item identification |String|        
|Quantity| Purchased quantity|Numeric|
|Unit Price | Price per unit |Numeric|
|Discount pct| Discount applied|Numeric| 
|Sales Amount| Reported transaction value|Numeric|
|Profit| Reported Profit|Numeric|
|Shipping Costs| Delivery costs |Numeric|
|Payment Method| Method used to purchase |String|
|Customer Satisfaction| Customer rating |Numeric|               
|Return Flag| Whether order was returned |Boolean|        
|Order Status | Completion of delivery status |String|
|Days to Ship| Days used to ship returns |Numeric|

## Data Preparation
During the initial stages of data viewing a preliminary counting of rows was done to see how many rows the base dataset had.

                          "SELECT Count(*) FROM retail_sales_dataset;"
               
The raw dataset contained 4,280 rows. After removing 80 duplicate records, 4,200 rows remained.

### Validating the Sales Formula
The initial lookover of the pricing, quantity, unit price and profit felt off. I tested the expected sales formula to identify how many records contained invalid values or sales mismatches before continuing with the data-cleaning process.


               With Price_Check as(
               SELECT
               *,
               quantity * unit_price * (1 - discount_pct) AS calculated_sales_amount,
               sales_amount - (quantity * unit_price * (1 - discount_pct)) AS                                         sales_difference,
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
                   SELECT sales_check, count(*) as count
                   FROM Price_Check
                   GROUPBY sales_check;

|*sales_check* | *count* |
|-------------|-------|
| Sales mismatch | 3932 |
| Invalid quantity | 26 |
| Missing Input | 242 |

The validation covered all 4,200 records. Approximately 90% of the records were classified as sales mismatches, while the remaining records contained either missing inputs or invalid quantities. This indicates that the reported sales amounts cannot generally be reproduced using the assumed quantity × unit price × (1 − discount) formula.

### Creating Age Groups
For easier analysis, customer ages were grouped into the following categories: 

                          SELECT
                             age,
                             Case 
                                 When age is Null then 'unknown'
                                 When age < 13 then 'Children'
                                 When age < 20 then 'Teenagers'
                                 When age < 31 then 'Young Adults'
                                 When age <= 45 then 'Adults'
                                 When age > 45 then 'Seniors'
                             End As Age_Group
                             From retail_sales_staging2;
                             
Age categorization can be seen from above where customer's ages below 13 are considered as children, 13 till 19 as teenagers, 20 till 30 as young adults, 31 till 45 as adults and people over the ages of 45 as Seniors. 

For a more in-depth look to my cleaning process click [*here*](https://drive.google.com/file/d/19nchITkHaSc_gpCQ88CPJWE7F-PJrp6o/view?usp=sharing) to obtain the SQL queries used to examine, analyze and polish the dataset. The SQL also includes some EDA done.

## Analytical Questions
- Which products generate the most sales and profit?

                          SELECT
                            product_name,
                            Round(SUM(sales_amount),2) AS Total_Sales,
                            Round(SUM(profit),2) AS Total_Profit
                          FROM retail_sales_staging2
                          GROUP BY product_name
                          ORDER BY Total_Sales DESC
                          LIMIT 5;
                          
|*product_name*|*Total_Sales* |*Total_Profit*|
|-----------------|-------------|--------------|
| Tablet | 35,826,512.05 | 4,743,012.69 |
| Laptop | 26,890,530.98 | 3,152,997.85 |
| Headphones | 25,656,395.25 | 3,029,210.10 |
| Smartwatch | 24,600,859.02 | 2,975,430.27 |
| Camera | 22,118,178.64 | 2,682,475.49 |

  
- How does performance differ between regions?

                          SELECT *
                          FROM (
                          SELECT *,
                          RANK()OVER(partition by region order by Total_Sales)as rnk
                          FROM category_sales
                          ) t
                          WHERE rnk IN (1,7)
                          ORDER BY region, rnk desc;
  
| *region* | *product_category*| *Total_Sales* | *rnk* |
|--------|----------------|-------------|------|
| Central | Electronics| 21,246,707.44 |7|
| Central | Groceries | 184,993.26 |1|
| East | Electronics| 29,820,395.65 |7|
| East | Groceries | 179,275.08 |1|
| North | Electronics| 25,271,607.20 |7|
| North | Groceries | 288,288.24 |1|
| South | Electronics| 51,186,745.52 |7|
| South | Groceries | 175,414.46 |1|
| West | Electronics| 28,117,121.76 |7|
| West | Groceries | 181,108.79 |1|

Across all regions there were little difference in terms of product sales. Electronics and groceries being found to be the undisputed top and bottom ranking categories for all regions.

- How do customer ratings vary across regions?
  
  <img width="405" height="330" alt="{D61B5847-DF7A-4A38-A4A1-240F92BB9AC4}" src="https://github.com/user-attachments/assets/84281d29-332f-44de-8c26-ef3f5de497f5" />

- How does product and financial performance change over time?

<img width="461" height="337" alt="{AC770BC8-9F4E-46EF-9817-6771F4C30809}" src="https://github.com/user-attachments/assets/d8531d52-98f2-4f2b-85cc-1f2c30cb1779" />
_________________________________________________________________________________________________________________________

<img width="400" height="275" alt="1" src="https://github.com/user-attachments/assets/4916ba0a-1f94-435c-9e9d-bd65326e4c8c" />
<img width="400" height="275" alt="2" src="https://github.com/user-attachments/assets/a92ac531-e4fb-438f-baff-7715d71c08df" />
<img width="400" height="275" alt="3" src="https://github.com/user-attachments/assets/71ec8983-d9d2-40d0-a4a9-468344c10d46" />
<img width="400" height="275" alt="4" src="https://github.com/user-attachments/assets/e33f57c4-5639-44d2-8c90-6487197a475d" />
<img width="400" height="275" alt="5" src="https://github.com/user-attachments/assets/e1697e21-2dd4-4cf8-be9b-d6d51ea8d7eb" />
  
Product performance in terms of product category ranking have little change across the years, following the sequence of Electronics, Furniture, Sports, Clothing, Books, Beauty and Groceries. In 2021, Sports managed to become the second ranked product overtaking furniture. 

- What changes when products are evaluated by sales volume, sales frequency, sales amount, or profit?

| *region* | *product_category* | *Sales_Volume* | *rnk* |
|--------|----------------|-------------|------|
| Central | Groceries | 692 |1|
| East | Electronics | 704 |1|
| North | Sports | 718 |1|
| South | Clothing | 787 |1|
| West | Clothing | 714 |1|
 
| *region* | *product_category* | *Sales_Frequency* | *rnk* |
|--------|----------------|-------------|------|
| Central | Groceries | 119 |1|
| East | Electronics | 135 |1|
| North | Sports | 143 |1|
| South | Clothing | 145 |1|
| West | Clothing | 130 |1|

| *region* | *product_category* | *Total_Sales_Amount* | *rnk* |
|--------|----------------|-------------|------|
| Central | Electronics | 21,246,707.44 |1|
| East | Electronics | 29,820,395.65 |1|
| North | Electronics | 25,271,607.20 |1|
| South | Electronics | 51,186,745.52 |1|
| West | Electronics | 28,117,121.76 |1|

| *region* | *product_category* | *Total_Profit* | *rnk* |
|--------|----------------|-------------|------|
| Central | Furniture | 3,050,967.07 |1|
| East | Electronics | 3,575,306.82 |1|
| North | Furniture | 3,290,563.55 |1|
| South | Electronics | 6,628,156.08 |1|
| West | Electronics | 3,260,295.85 |1|


## Key Findings
Annual profit fluctuates after 2020, with reported annual profit ranging from approximately RM9 million to RM11 million. Electronics remained the leading category by reported profit, contributing between 32% and 49% of total profit across the five-year period.

Below is the overview page from the PowerBI dashboard and more examples are included throughout the report. The entire interactive dashboard can be downloaded [*here*](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing) 

<img width="1485" height="832" alt="{5939E85D-2EF9-485B-9A5C-6B0AF96E99F2}" src="https://github.com/user-attachments/assets/626befe0-bc96-422e-b288-786448a52725" />

<img width="1528" height="859" alt="{A2CAA12B-91C7-4615-A5FA-8C77AE625C89}" src="https://github.com/user-attachments/assets/f063633b-a4ad-42a4-b9cb-90f1f6dfae05" />

### Regional Customer Satisfaction
- Average customer satisfaction across all regions is approximately 2.75, indicating relatively moderate reported satisfaction.
- The East region has the highest average customer satisfaction score (2.86) and the lowest number of returns among the regions.
- Central and West had the lowest average customer satisfaction scores, with only a 0.01-point difference between them. Both regions also recorded more 1-star reviews than 5-star reviews.
- Central had the lowest reported sales amount at RM40.67 million, representing 55.32% of South's RM73.52 million.

### Product Performance
- Electronics generates the highest reported sales amount, partly because its products have higher prices, while the Grocery category generates lower reported sales due to lower product prices.However, this does not necessarily indicate the sales volume or demand of each category; it only reflects the reported sales value
- In 2021, Tennis Rackets became the highest-selling individual product despite Electronics dominating the overall category rankings. This also moved Sports into second place among categories, with approximately RM4 million more in reported sales than Furniture, which had previously held second place
  
- ### Recommendations:
- Investigate the drivers of lower satisfaction in the Central and West regions, particularly the higher volume of 1-star reviews. The East region could provide a useful comparison point as it records higher average satisfaction and fewer returns
- Profit changed by approximately RM3 Million between selected years. Further analysis could investigate whether this movement was associated with changes in product mix, regional performance, discounts, returns, order volume or other measurable factors



## Business Interpretation

### Product performance
Electronics is the largest contributor to reported sales/profit, indicating that overall financial performance is heavily influenced by this category. However, revenue concentration should be considered separately from sales volume because higher-priced products can generate greater revenue without necessarily having higher unit demand.

### Regional performance
The East region records the highest average customer satisfaction and lowest number of returns, while Central and West record lower satisfaction. These differences could be investigated further using return reasons, shipping performance, product mix and order characteristics.

### Data quality
The reported financial fields contain substantial inconsistencies when compared against a calculated sales measure. Therefore, conclusions involving absolute sales, discounts or profit should be treated as exploratory rather than representative of verified business performance.

### Next analysis
A useful next step would be to investigate the relationship between satisfaction, returns, shipping time and product category to determine whether operational factors are associated with customer experience.

## Data Quality Limitations
- The dataset contains substantial inconsistencies between reported financial fields and independently calculated values. In particular, reported sales amounts frequently cannot be reproduced using quantity, unit price and discount percentage.

Because the underlying calculation methodology and original dataset provenance could not be fully verified, financial metrics should be treated as exploratory rather than as representative of actual retail performance.

The dataset should therefore be used to demonstrate analytical methodology rather than to draw conclusions about a real retailer.  

## What I learned 
- Metric definitions: I initially interpreted purchase frequency and quantity sold as equivalent measures of product popularity. This highlighted the importance of defining business metrics precisely before performing comparisons.
- Dashboard design: Interactive slicers made it easier to compare regional performance and identify differences that were less visible in aggregate views.
