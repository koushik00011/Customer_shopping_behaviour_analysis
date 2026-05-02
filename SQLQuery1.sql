USE ProjectDB
SELECT * FROM cleaned_data

--What is the total revenue gathered by male vs female?
SELECT gender,sum(purchase_amount) AS Purchases_revenue
FROM cleaned_data  GROUP BY(gender)

--Which customer used a discount but still spent more than the average amount?
SELECT * FROM(
SELECT 
customer_id,gender,purchase_amount,discount_applied,
AVG(purchase_amount) OVER() AS AVERAGE
FROM cleaned_data)t
WHERE purchase_amount>AVERAGE AND discount_applied='Yes'

--TOP 5 PRODUCTS WITH HIGHEST AVERAGE REVIEW RATING?
SELECT TOP 5 item_purchased,ROUND(AVG(review_rating),2) AS AVERAGE FROM
cleaned_data GROUP BY item_purchased ORDER BY AVERAGE DESC;

--COMPARE THE AVERAGE PURCHASE AMOUNTS BETWEEN STANDARD AND EXPRESS SHIPPING
SELECT shipping_type,ROUND(avg(purchase_amount),2) as 'AVERAGE' FROM cleaned_data
GROUP BY shipping_type HAVING shipping_type IN ('Standard','Express');

--DO SUBSCRIBED CUSTOMERS SPEND MORE?COMPARE AVERAGE SPEND AND TOTAL REVENUE BETWEEN SUBSCRIBERS AND NON SUBSCRIBERS
SELECT COUNT(customer_id)AS 'Customers',subscription_status,AVG(purchase_amount) AS 'AVERAGE_SPEND',SUM(purchase_amount) AS 'TOTAL_REVENUE' FROM cleaned_data
GROUP BY subscription_status

--WHICH 5 PRODUCTS HAVE THE HIGHEST PERCENTAGE OF PURCHASES WITH DISCOUNTS APPLIED?
SELECT TOP 5 item_purchased,ROUND(100*SUM(CASE WHEN discount_applied='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS PERCENTAGE FROM cleaned_data
GROUP BY item_purchased
ORDER BY PERCENTAGE DESC

--SEGMENT CUSTOMER INTO NEW,RETURNING AND LOYAL BASED ON THEIR TOTAL NUMBER OF PREVIOUS PURCHASES AND SHOW THE COUNT OF EACH SEGMENT?
WITH CTE_BEHAVIOUR AS (
SELECT customer_id,
CASE WHEN previous_purchases=1 THEN 'NEW'
     WHEN previous_purchases BETWEEN 2 AND 10 THEN 'RETURNING'
     WHEN previous_purchases>10 THEN 'LOYAL'
    END AS SEGMENT_PURCHASES
FROM cleaned_data)
SELECT SEGMENT_PURCHASES,COUNT(customer_id)AS NO_OF_USERS FROM CTE_BEHAVIOUR
GROUP BY SEGMENT_PURCHASES ORDER BY NO_OF_USERS DESC;
 
 --WHAT ARE THE TOP 3 MOST PURCHASED PRODUCTS WITH IN EACH CATEGORY?
 SELECT * FROM(
  SELECT 
  Row_number() over(PARTITION BY CATEGORY ORDER BY COUNT(customer_id) DESC) AS item_rank,
  category,item_purchased,COUNT(customer_id) as Total_orders
  FROM cleaned_data
  GROUP BY category,item_purchased)t
  WHERE (item_rank)<=3;

 --ARE CUSTOMERS WHO ARE REPEAT BUYERS(MORE THAN 5 PREVIOUS PURCHASES) ARE LIKELY TO SUBSCRIBE?
 SELECT previous_purchases,subscription_status,
 CASE WHEN subscription_status='Yes' THEN 'TRUE'
 ELSE 'FALSE'
 END AS STATUS
 FROM cleaned_data WHERE previous_purchases>5;

 SELECT subscription_status,COUNT(CUSTOMER_ID) AS total_subscribers FROM cleaned_data
 WHERE previous_purchases>5
 group by subscription_status;

 --WHAT IS THE REVENUE CONTRIBUTION OF EACH AGE GROUP?
 SELECT age_group,SUM(purchase_amount) AS revenue_contribution FROM cleaned_data
 group by age_group
 order by revenue_contribution desc;