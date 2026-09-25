# E-Comm Retail Sales Performance Report WIP

## Background Overview
This sample dataset is obtained from kaggel. Click [*here*](https://drive.google.com/file/d/1Gu6dPev0gi37cOZuMHf0Qxwylf6O4Fw-/view?usp=sharing) for the base file. 

**Disclaimer I do not own this dataset,it is one of the many available datasets on kaggel with a rating of 9.8+ usability....it's just that I've forgotten which kaggel dataset it's from and thus am unable to link it back to where I got it.*


| Table of contents|
|---------------------------------------------------------|
|1. [Project Overview](https://github.com/leemings98-source/RetailSales/blob/main/README.md#project-overview)|                
|2. [Data Preparation](https://github.com/leemings98-source/RetailSales/blob/main/README.md#data-preparation)|        
|3. [Analytical Questions](https://github.com/leemings98-source/RetailSales/blob/main/README.md#analytical-questions)        |  
|4. [Key Findings](https://github.com/leemings98-source/RetailSales/blob/main/README.md#key-findings)
|5. [Business Interpretation](https://github.com/leemings98-source/RetailSales/blob/main/README.md#business-interpretation) |     
|5. [Data Limitations](https://github.com/leemings98-source/RetailSales/blob/main/README.md#data-limitations) |     
|6. [What I Learned](https://github.com/leemings98-source/RetailSales/blob/main/README.md#what-i-learned)     |     

Links for easy access 
- [Base Raw Dataset](https://drive.google.com/file/d/1Gu6dPev0gi37cOZuMHf0Qxwylf6O4Fw-/view?usp=sharing)
- [Interactive PowerBI Dashboard](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing)
- [SQL Data Cleaning and EDA](https://drive.google.com/file/d/19nchITkHaSc_gpCQ88CPJWE7F-PJrp6o/view?usp=sharing)

Insights and recommendations are provided on the following key areas:

- Product Level Performance: An analysis of the dataset's various product lines, understanding their impact on sales and returns.
- Regional Comparisons: An evaluation of sales and profit by region.
- Customer Happiness: An evaluation of customer satisfaction by region.

An interactive PowerBI dashboard can be downloaded [*here*](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing)

## Data Structure Overview
The dataset's base structure is made up of one table and 20 columns, consisting of: 'Order id', 'Order date', 'Customer Id', 'Customer Name', 'Age' ,'Gender', 'Region', 'City', 'Product Name', 'Quantity', 'Unit Price', 'Discount pct', 'Sales Amount', 'Profit', 'Shipping Costs', 'Payment Method', 'Customer Satisfaction', 'Return Flag', 'Order Status', and 'Days to Ship'. It also consists of a total of 4,200 rows of data making it an ideal dataset to clean up and analyze.

<img width="285" height="620" alt="{750A6AFC-1017-4C3E-B243-D87E63B8ACA8}" src="https://github.com/user-attachments/assets/cc0c1719-a6ff-4b9d-9d09-99ac4b74d92c" />

Before starting the analysis a rudimentary cleaning of the data was done first such as cleaning up the duplicates as well as standardizing some of the data via excel before proceeding to a variety of checks and data familiarization in SQL. 

Click [*here*](https://drive.google.com/file/d/19nchITkHaSc_gpCQ88CPJWE7F-PJrp6o/view?usp=sharing) for the SQL queries used to examine, analyze and polish the dataset.

## Overview findings
Within the dataset, annual profit fluctuates after 2020, with approximately RM3M changes between certain years, hovering between earning around 9m and 11m. Key Point Indicators have shown year-over-year Electronics' domination over the best selling category staying at an all time high. Managing to earn a *minimum of 32%* to a *maximum of 49%* of *total profit* over the 5 year period.

 Below is the overview page from the PowerBI dashboard and more examples are included throughout the report. The entire interactive dashboard can be downloaded [*here*](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing) 

<img width="1485" height="832" alt="{5939E85D-2EF9-485B-9A5C-6B0AF96E99F2}" src="https://github.com/user-attachments/assets/626befe0-bc96-422e-b288-786448a52725" />

<img width="1528" height="859" alt="{A2CAA12B-91C7-4615-A5FA-8C77AE625C89}" src="https://github.com/user-attachments/assets/f063633b-a4ad-42a4-b9cb-90f1f6dfae05" />


As an added bonus, the image on the left shows the most popular category in each region based on sales quantity/volume while the one on the right is based on the sales count/frequency.

<img width="313" height="108" alt="{82613271-CBBD-4913-A268-3021208A21A1}" src="https://github.com/user-attachments/assets/c78efe5f-8727-4e6d-8d00-4a8eb332ae3f" />
<img width="313" height="108" alt="{A7A3ECB9-0112-4C18-B735-6C0D08F2A3A7}" src="https://github.com/user-attachments/assets/a2e6f0b9-7ca9-4968-82b0-17ca9ada6704" />


## Product Performance
- *Electronics* strongly dominates the entire sales ranking generating the *most sales amount* due to their high pricings, while Groceries suffers due to their lower pricings. Of course this isn't indicative to the sales capability each category has, just a measure of the sales amount garnered.
- During *2021 Tennis Rackets* managed to garner the position of the *top sales product* amidst the monopoly of electronic products. Bumping up the Sports category to 2nd place with *4M more* in *sales amount* than the *Furniture* category(the original 2nd place).

## Service Performance
- *Customer satisfaction* over all regions seems to *average* out to around *2.75*. Making service to be fairly ordinary to the majority of customers.
- The *East Region* has the *highest customer satisfaction score* - 2.86, as well as the lowest counts of returns amongst all regions.
- *Central* and *West* Region respectively both scored the *lowest* on the *average customer satisfaction* (with 0.01 difference between the two), had more counts of 1 star reviews over 5 star reviews compared to the other 3 regions.
-  Central Region also earned the lowest sales amount compared to the other regions only reaching 55.32%(RM40.67M) of the highest sales amount, South's RM73.52M.


## Recommendations:
- Investigate the drivers of lower satisfaction in Central and West, particularly the higher volume of 1-star reviews. The East region could provide a useful comparison point because it records higher average satisfaction and fewer returns
- Look into the the years 2022 and 2024 to see why profit sales dropped by 3M and increased by 3M in the next years. Specifically why 3M? Was there something similarly done that attributed to the 3M loss?



## Project Overview

## Data Preparation
During the initial stages of data viewing a preliminary counting of rows was done to see how many rows the base dataset had.

                          "SELECT Count(*) FROM retail_sales_dataset;"
               
resulted in a total of 4280 rows of data while removing the duplicates cleared up 80 rows in total.

### Checking Sales Formula
The initial lookover of the pricing, quantity, unit price and profit felt off. A quick formula testing was done to see how many invalid/sales mismatch results came back before continuing to fixing the values in the dataset.  


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
                   select sales_check, count(*) as count
                   from Price_Check
                   group by sales_check;
 
<img width="240" height="125" alt="{25719FCE-9E8E-4422-A7B6-C9C83E98A4EC}" src="https://github.com/user-attachments/assets/8a1f1c30-784c-459e-b4c6-11d1ea6dea2f" />

The total of which resulted in all 4200 counts, around 90% of calculations for the sales amount in the dataset came back as sales mismatch while the rest were either missing input or invalid quantity. Strongly suggesting that the dataset is made up of fabricated information.

### Creating Age Groups
For ease of categorization of the ages found in the data 

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
                             
Age categorization can be seen from above where customers ages below 13 are considered as children, 13 till 19 as teenagers, 20 till 30 as young adults, 31 till 45 as adults and people over the ages of 45 as Seniors. 

For a more in-depth look to my cleaning process click [*here*](https://drive.google.com/file/d/19nchITkHaSc_gpCQ88CPJWE7F-PJrp6o/view?usp=sharing) for the SQL queries used to examine, analyze and polish the dataset. The SQL also includes some EDA done.

## Analytical Questions
- Which products generate the most sales and profit?

                          SELECT
                          product_category,
                          Round(SUM(sales_amount),2) AS Total_Sales
                          FROM retail_sales_staging2
                          GROUP BY product_category
                          ORDER BY Total_Sales DESC;
  
  <img width="237" height="139" alt="{74FFAF30-F11A-4132-86E5-ADA94DBE4D52}" src="https://github.com/user-attachments/assets/d6697f02-271d-4363-ab93-c759a31bc9ab" />

- How does performance differ between regions?

                          SELECT*
                          FROM (
                          SELECT*,
                          RANK()over(partition by region order by Total_Sales)as rnk
                          FROM category_sales
                          ) t
                          WHERE rnk in (1,7)
                          ORDER BY region, rnk desc;

   <img width="305" height="189" alt="{00E0820D-4F56-471A-A698-AB1C26773235}" src="https://github.com/user-attachments/assets/ab333295-1b88-4ee1-9422-35b75a4bec36" />

- How do customer ratings vary across regions?
  
  <img width="405" height="330" alt="{D61B5847-DF7A-4A38-A4A1-240F92BB9AC4}" src="https://github.com/user-attachments/assets/84281d29-332f-44de-8c26-ef3f5de497f5" />

- How does product/financial performance change over time?

  <img width="400" height="275" alt="1" src="https://github.com/user-attachments/assets/4916ba0a-1f94-435c-9e9d-bd65326e4c8c" />
  <img width="400" height="275" alt="2" src="https://github.com/user-attachments/assets/a92ac531-e4fb-438f-baff-7715d71c08df" />
  <img width="400" height="275" alt="3" src="https://github.com/user-attachments/assets/71ec8983-d9d2-40d0-a4a9-468344c10d46" />
  <img width="400" height="275" alt="4" src="https://github.com/user-attachments/assets/e33f57c4-5639-44d2-8c90-6487197a475d" />
  <img width="400" height="275" alt="5" src="https://github.com/user-attachments/assets/e1697e21-2dd4-4cf8-be9b-d6d51ea8d7eb" />


- What changes when products are evaluated by quantity, transaction frequency, sales, or profit?
<img width="313" height="108" alt="{82613271-CBBD-4913-A268-3021208A21A1}" src="https://github.com/user-attachments/assets/c78efe5f-8727-4e6d-8d00-4a8eb332ae3f" />
<img width="313" height="108" alt="{A7A3ECB9-0112-4C18-B735-6C0D08F2A3A7}" src="https://github.com/user-attachments/assets/a2e6f0b9-7ca9-4968-82b0-17ca9ada6704" />

## Key Findings
Below is the overview page from the PowerBI dashboard and more examples are included throughout the report. The entire interactive dashboard can be downloaded [*here*](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing) 

<img width="1485" height="832" alt="{5939E85D-2EF9-485B-9A5C-6B0AF96E99F2}" src="https://github.com/user-attachments/assets/626befe0-bc96-422e-b288-786448a52725" />

<img width="1528" height="859" alt="{A2CAA12B-91C7-4615-A5FA-8C77AE625C89}" src="https://github.com/user-attachments/assets/f063633b-a4ad-42a4-b9cb-90f1f6dfae05" />


As an added bonus, the image on the left shows the most popular category in each region based on sales quantity/volume while the one on the right is based on the sales count/frequency.

<img width="313" height="108" alt="{82613271-CBBD-4913-A268-3021208A21A1}" src="https://github.com/user-attachments/assets/c78efe5f-8727-4e6d-8d00-4a8eb332ae3f" />
<img width="313" height="108" alt="{A7A3ECB9-0112-4C18-B735-6C0D08F2A3A7}" src="https://github.com/user-attachments/assets/a2e6f0b9-7ca9-4968-82b0-17ca9ada6704" />


### Regional Customer Satisfaction

### Product Performance

## Business Interpretation

## Data Limitations
- Data obtainable in this dataset has many made up values specifically the profit, sales price and discount values. If values were accurate, further data cleaning could be done to rectify many of the inaccuracies.  

## What I learned 
- Metric definitions: I initially confused purchase frequency with quantity sold when identifying the most-purchased products. This highlighted the importance of defining business terms such as "most popular" before selecting a metric.
- Slicers in Power Bi are life savers, streamlines everything. Highlights and allows for easier data comparisons between regions. Clicking on pie charts with different regions does not work the same way.
