# E-Comm Retail Sales Performance Report 

## Background Overview
This sample dataset is obtained from kaggel. Tap [*here*](https://drive.google.com/file/d/1Gu6dPev0gi37cOZuMHf0Qxwylf6O4Fw-/view?usp=sharing) for the base file. 

*Disclaimer I do not own this dataset,it is one of the many available datasets on kaggel with a rating of 9.8+ usability....it's just that I've forgotten which kaggel dataset it's from and thus am unable to link it back to where I got this datatset.*


Insights and recommendations are provided on the following key areas:

- Product Level Performance: An analysis of the dataset's various product lines, understanding their impact on sales and returns.
- Regional Comparisons: An evaluation of sales and profit by region.
- Customer Happiness: An evaluation of customer satisfaction by region.

An interactive PowerBI dashboard can be downloaded [*here*](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing)

## Data Structure Overview
The dataset's base structure is made up of one table and 20 rows, consisting of: 'Order id', 'Order date', 'Customer Id', 'Customer Name', 'Age' ,'Gender', 'Region', 'City', 'Product Name', 'Quantity', 'Unit Price', 'Discount pct', 'Sales Amount', 'Profit', 'Shipping Costs', 'Payment Method', 'Customer Satisfaction', 'Return Flag', 'Order Status', and 'Days to Ship'. It also consists of a total of 4,200 rows of data making it an ideal dataset to clean up and analyze.

<img width="285" height="625" alt="{750A6AFC-1017-4C3E-B243-D87E63B8ACA8}" src="https://github.com/user-attachments/assets/cc0c1719-a6ff-4b9d-9d09-99ac4b74d92c" />

Before starting the analysis a rudimentary cleaning of the data was done first such as cleaning up the duplicates as well as standardizing some of the data via excel before proceeding to a variety of checks and data familiarization in SQL. 

Click [*here*](https://drive.google.com/file/d/19nchITkHaSc_gpCQ88CPJWE7F-PJrp6o/view?usp=sharing) for the SQL queries used to examine, analyze and polish the dataset.... Actually I think I should make another repository for this....?...I'll do it once I'm done with this then...   

## Overview findings
 Below is the overview page from the PowerBI dashboard and more examples are included throughout the report. The entire interactive dashboard can be downloaded [*here*](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing) 
<img width="1482" height="879" alt="{EEAEE2E5-B00E-47E8-B591-41DC6C59AF1A}" src="https://github.com/user-attachments/assets/96a88b53-c716-4fe4-b92f-faa0e7065693" />
<img width="1491" height="887" alt="{0DD6AD19-A051-44FE-9E57-6DCEE919DA90}" src="https://github.com/user-attachments/assets/d93104f2-8c27-49be-97b5-618fe7a99767" />
As an added bonus, the image on the left shows the most popular category in each region based on sales quantity/volume while the one on the right is based on the sales count/frequency.

<img width="313" height="108" alt="{82613271-CBBD-4913-A268-3021208A21A1}" src="https://github.com/user-attachments/assets/c78efe5f-8727-4e6d-8d00-4a8eb332ae3f" />
<img width="313" height="108" alt="{A7A3ECB9-0112-4C18-B735-6C0D08F2A3A7}" src="https://github.com/user-attachments/assets/a2e6f0b9-7ca9-4968-82b0-17ca9ada6704" />





## Product Performance
- Electronics strongly dominates the entire sales ranking generating the most sales due to their high pricings, while Groceries suffers due to their lower pricings. Of course this isn't indicative to the sales capability each category has, just a measure of sales garnered.
-
-
## Service Performance

## Recommendations:









## Self reflection
- I should find a dataset with more accurate profit, sales price, and discount values.....This one was such a doozy.
- I honestly still have no idea how to navigate Dax measures for ranking, perhaps I have yet to find the correct code for it... I wonder if tableau would be easier? I've been fighting with Power Bi for a bit and just gave up on making a formula for ranking.... ended up just using the readily available filter ranks ugh what a missed opportunity!...I'll have to go look at the formula's a little more to familiarize myself with them.. 
- The proper use of words is important + labeling!! I had though I was on the wrong thought process when I went with count based calculations for products that were bought the most. The entire time I had forgotten that sum of quantity would also show that off. Apparently I was just confused between the frequency of an item being bought and the quantity being sold....which would also answer the "what items were bought the most" criteria.
