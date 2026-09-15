# E-Comm Retail Sales Performance Report 

## Background Overview
This sample dataset is obtained from kaggel. Tap [*here*](https://drive.google.com/file/d/1Gu6dPev0gi37cOZuMHf0Qxwylf6O4Fw-/view?usp=sharing) for the base file. 

**Disclaimer I do not own this dataset,it is one of the many available datasets on kaggel with a rating of 9.8+ usability....it's just that I've forgotten which kaggel dataset it's from and thus am unable to link it back to where I got this datatset.*


Insights and recommendations are provided on the following key areas:

- Product Level Performance: An analysis of the dataset's various product lines, understanding their impact on sales and returns.
- Regional Comparisons: An evaluation of sales and profit by region.
- Customer Happiness: An evaluation of customer satisfaction by region.

An interactive PowerBI dashboard can be downloaded [*here*](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing)

## Data Structure Overview
The dataset's base structure is made up of one table and 20 rows, consisting of: 'Order id', 'Order date', 'Customer Id', 'Customer Name', 'Age' ,'Gender', 'Region', 'City', 'Product Name', 'Quantity', 'Unit Price', 'Discount pct', 'Sales Amount', 'Profit', 'Shipping Costs', 'Payment Method', 'Customer Satisfaction', 'Return Flag', 'Order Status', and 'Days to Ship'. It also consists of a total of 4,200 rows of data making it an ideal dataset to clean up and analyze.

<img width="285" height="620" alt="{750A6AFC-1017-4C3E-B243-D87E63B8ACA8}" src="https://github.com/user-attachments/assets/cc0c1719-a6ff-4b9d-9d09-99ac4b74d92c" />

Before starting the analysis a rudimentary cleaning of the data was done first such as cleaning up the duplicates as well as standardizing some of the data via excel before proceeding to a variety of checks and data familiarization in SQL. 

Click [*here*](https://drive.google.com/file/d/19nchITkHaSc_gpCQ88CPJWE7F-PJrp6o/view?usp=sharing) for the SQL queries used to examine, analyze and polish the dataset.... Actually I think I should make another repository for this....?...I'll do it once I'm done with this then...   

## Overview findings
The company's profit has been alternating between a 3m increase and decrease after the year 2020, hovering between earning around 9m and 11m. Key Point Indicators have shown year-over-year Electronics' domination over the best selling category staying at an all time high. Managing to earn a *minimum of 32%* to a *maximum of 49%* of *total profit* over the 5 year period.

 Below is the overview page from the PowerBI dashboard and more examples are included throughout the report. The entire interactive dashboard can be downloaded [*here*](https://drive.google.com/file/d/1fpYmMaGSu_NGuuluvZNY_rD-hs1FHdj8/view?usp=sharing) 

<img width="1485" height="832" alt="{5939E85D-2EF9-485B-9A5C-6B0AF96E99F2}" src="https://github.com/user-attachments/assets/626befe0-bc96-422e-b288-786448a52725" />

<img width="1528" height="859" alt="{A2CAA12B-91C7-4615-A5FA-8C77AE625C89}" src="https://github.com/user-attachments/assets/f063633b-a4ad-42a4-b9cb-90f1f6dfae05" />


As an added bonus, the image on the left shows the most popular category in each region based on sales quantity/volume while the one on the right is based on the sales count/frequency.

<img width="313" height="108" alt="{82613271-CBBD-4913-A268-3021208A21A1}" src="https://github.com/user-attachments/assets/c78efe5f-8727-4e6d-8d00-4a8eb332ae3f" />
<img width="313" height="108" alt="{A7A3ECB9-0112-4C18-B735-6C0D08F2A3A7}" src="https://github.com/user-attachments/assets/a2e6f0b9-7ca9-4968-82b0-17ca9ada6704" />


## Product Performance
- *Electronics* strongly dominates the entire sales ranking generating the *most sales amount* due to their high pricings, while Groceries suffers due to their lower pricings. Of course this isn't indicative to the sales capability each category has, just a measure of the sales amount garnered.
- During 2021 Tennis Rackets managed to garner the position of the top sales product amidst the monopoly of electronic products. Bumping up the Sports category to 2nd place with 4M more in sales amount than the Furniture category(the original 2nd place).

## Service Performance
- Customer satisfaction over all regions seems to average out to around 2.75. Making service to be fairly ordinary to the majority of customers.
- The East Region having the highest customer satisfaction score, 2.86, also had the lowest count of returns.
- Central and West Region respectively both scoring the lowest on the average customer satisfaction, had more counts of 1 star reviews over 5 star reviews compared to the other 3 regions.
- 

## Recommendations:









## Self reflection
- I should find a dataset with more accurate profit, sales price, and discount values.....This one was such a doozy.
- I honestly still have no idea how to navigate Dax measures for ranking, perhaps I have yet to find the correct code for it... I wonder if tableau would be easier? I've been fighting with Power Bi for a bit and just gave up on making a formula for ranking.... ended up just using the readily available filter ranks ugh what a missed opportunity!...I'll have to go look at the formula's a little more to familiarize myself with them.. 
- The proper use of words is important + labeling!! I had though I was on the wrong thought process when I went with count based calculations for products that were bought the most. The entire time I had forgotten that sum of quantity of product bought would also show that off. Apparently I was just confused between the frequency of an item being bought and the quantity being sold....which would also answer the "what items were bought the most" criteria.
