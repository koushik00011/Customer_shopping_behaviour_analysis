# Customer Shopping Behavior Analysis

## Project Overview

This project analyzes customer purchasing patterns to uncover actionable insights that drive business decisions. The analysis is based on transactional data containing **3,900 purchase records** with customer demographics, purchasing behavior, and engagement metrics.

The objective is to identify high-value customers, evaluate purchasing trends, and recommend strategies to improve revenue, retention, and customer segmentation.

---

## Dataset Summary

* **Total Records:** 3,900 transactions
* **Features:** 18 columns
* **Missing Values:** 37 (handled during preprocessing)
* **Key Attributes:**

  * Customer demographics (age, gender)
  * Purchase amount
  * Product category
  * Discount usage
  * Shipping type
  * Subscription status
  * Review ratings

---

## Data Processing

The dataset was cleaned and prepared using Python.

### Steps Performed:

* Loaded dataset using pandas
* Performed exploratory data analysis (EDA)
* Handled missing values using median imputation
* Created new features:

  * Age groups
  * Purchase frequency categories
* Prepared structured data for SQL-based analysis

---

## Tools & Technologies

* **Python** (Pandas, NumPy, Matplotlib/Seaborn)
* **SQL** (PostgreSQL for querying and aggregation)
* **Power BI** (Dashboard visualization)
* **Jupyter Notebook** (Analysis workflow)

---

## Key Insights

### 1. Revenue by Gender

* Female customers generate slightly higher total revenue than male customers
* Indicates opportunity for targeted marketing campaigns

---

### 2. High-Value Discount Users

* Identified customers who spend above average while using discounts
* These users maximize value and should be targeted with premium offers

---

### 3. Product Performance

* Top-rated categories:

  * Blouse (highest rating)
  * Dress (consistent performance)
  * Shirt (strong customer approval)

---

### 4. Shipping Impact

* Express shipping customers spend ~12% more than standard shipping users
* Faster delivery correlates with higher purchase value

---

### 5. Subscription Effect

* Subscribers spend **68% more** than non-subscribers
* Contribute ~45% of total revenue
* Show higher repeat purchase rates

---

### 6. Customer Segmentation

Customers were categorized into:

* **New Customers (50%)** – First-time buyers
* **Returning Customers (35%)** – Moderate engagement
* **Loyal Customers (15%)** – High-value segment

---

## Dashboard

An interactive Power BI dashboard was created to visualize:

* Revenue trends
* Customer segmentation
* Purchase behavior
* Subscription impact

---

## Files in Repository

* `project.ipynb` → Data analysis and preprocessing
* `SQLQuery1.sql` → SQL queries used for insights
* `customer_behaviour_dashboard.pbix` → Power BI dashboard
* `Customer-Shopping-Behavior-Analysis.pptx` → Business presentation

---

## Business Recommendations

* Promote subscription programs to increase revenue
* Implement loyalty programs for repeat customers
* Target high-value customers with personalized offers
* Highlight top-rated products in marketing campaigns
* Encourage express shipping to increase order value

---

## Conclusion

This project demonstrates how data analysis can transform raw transactional data into meaningful business insights. By leveraging Python, SQL, and Power BI, the analysis provides a complete pipeline from data cleaning to visualization and strategic recommendations.

---
