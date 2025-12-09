## Table of Contents
- [A. Prediction Model (Python-Jupyter Notebook)](#a-prediction-model-python-jupyter-notebook)
- [B. Clustering Model (Python-Jupyter Notebook)](#b-clustering-model-python-jupyter-notebook)
- [C. Smartphone Sales Data Analysis Project (SQL)](#c-smartphone-sales-data-analysis-project-sql)
- [D. The Aurora Sky Hotel Analyst (Excel)](#d-the-aurora-sky-hotel-analyst-excel)



# **A. Prediction Model (Python-Jupyter Notebook)**  

**Background:**
FinanKu is an imaginary fintech startup that provides savings and lending facilities to its customers. The services they offer include Savings Accounts, Time Deposits, Unsecured Loans, Credit Cards, and Vehicle Financing for Cars & Motorcycles.

Currently, FinanKu has approximately 20,000 customers spread across three major cities in Indonesia: Jakarta, Bandung, and Surabaya. This is a relatively significant number considering FinanKu has only been operating for 1.5 years, and it is projected that within the next three years their customer base will exceed 300,000.

This rapid growth has prompted stakeholders in FinanKu’s Credit Division to be increasingly cautious in disbursing credit facilities to avoid defaults, particularly from the Credit Card line, which offers an instant approval feature within 1 minute.

**Problem Statement:**
Over the past year, more than 20% of FinanKu’s credit card customers have defaulted on their payments. As a result, business operations have been disrupted, especially considering that FinanKu is still at an early-stage startup scale.

**Business Objective:**
FinanKu aims to identify lending customers who are likely to default as early as possible.

**Analytical Objective:**
To develop a Credit Card Default Prediction Model for FinanKu’s credit card facilities.

**Conclusion:**
Across all models, the average accuracy exceeds 60%, but the recall remains below 40%. This indicates that many customers who are actually at risk of default are being incorrectly predicted as non-defaulters. Therefore, it can be concluded that the desired objective has not yet been achieved in this iteration of model development.

**Potential Improvements for Future Development:**

* Increase the sample size (number of customers), assuming the current dataset does not represent the full customer population.
* Apply oversampling techniques to the minority class (defaults) to reduce model bias.
* Extend the time horizon of the dataset.
* Experiment with additional variable combinations (adding new variables or removing those with low importance in the latest results).
* Broaden hyperparameter tuning combinations during model training.
* Try alternative supervised machine learning algorithms.


# **B. Clustering Model (Python-Jupyter Notebook)**

**Background:**
FundFusion, a banking institution in Wakanda, aims to enhance its marketing efforts toward both existing and potential customers. One of its marketing strategies is conducting phone-based campaigns, or telemarketing, where products are promoted directly through phone calls.
Currently, FundFusion does not have a clear strategy regarding which products should be offered when contacting prospective customers. Each account manager has different KPIs for customer acquisition based on the specific products offered by FundFusion, such as Savings Accounts, Time Deposits, Credit Cards, Home Loans, Vehicle Loans, or Personal Loans.
As a result, potential customers may receive multiple calls in a single day from different account managers offering different products. This leads to a high rejection rate and causes the calls to be perceived as spam, often resulting in the bank’s numbers being blocked.

**Problem Statement:**
There is no effective strategy for determining the most suitable product to offer based on the segment of the prospective customer being targeted.

**Business Objective:**
Increase the acquisition of new customers by offering the right product that aligns with the profile of the prospective customer being contacted.

**Analytical Objective:**
Develop a Clustering Model to identify product ownership patterns based on the demographic profiles of current FundFusion customers.

**Conclusion:**
Based on the clustering modeling results using the K-Means algorithm, FundFusion’s customers naturally form three primary clusters, each with distinct demographic and financial behavior characteristics.
These three clusters directly address the issue of high rejection rates caused by irrelevant product offers (spamming). Below is the profile summary of each customer cluster:

1. Young Potential Cluster
- Profile: Average age of 29 years.
- Unique Characteristics: This is the most financially aware segment in terms of basic banking products, evidenced by a 100% ownership rate of Savings Accounts.
- Insight: They are in the early stages of building assets but already maintain a healthy Total Relationship Balance. They represent an ideal long-term target segment.
- Not Recommended: Savings Account offers.
- Recommended Offers: Vehicle Loans & Credit Cards.
- Reasoning: Since 100% of them already have a savings account, offering the same product is ineffective. Instead, focus on lifestyle-related products (credit cards) or first-vehicle financing (auto loans), which align well with their life stage in their 20s.

2. Established Family Cluster
- Profile: Average age of 45 years.
- Unique Characteristics: They are in a stable life phase, with relatively even product ownership (around 98% own Savings Accounts). They typically have 1–2 children, indicating needs related to education funding or home improvement.
- Not Recommended: Basic Savings Account.
- Recommended Offers: Time Deposits & Home Loans.
- Reasoning: Prioritize medium-term investment products (Time Deposits) for children’s education funds, or top-up home financing facilities to support household needs.

3. Senior Priority Cluster
- Profile: Average age of 59 years.
- Unique Characteristics: Interestingly, despite being the oldest segment, they have the lowest rate of Savings Account ownership (~65%), even though their financial balances are comparatively high. This anomaly presents a significant opportunity.
- Not Recommended: Long-term credit products.
- Recommended Offers: Priority Savings Accounts & Time Deposits.
- Reasoning: Around 35% of seniors do not yet have a Savings Account with FundFusion—this is a low-hanging-fruit acquisition opportunity. - Avoid offering long-tenor loans due to age-related risk factors.

Projected Business Impact of Implementing This Clustering Strategy:
1. Improved Telemarketing Efficiency: Account Managers will no longer waste time offering savings accounts to young customers who already have them.
2. Reduced Churn & Block Rates: Customers will no longer feel spammed with irrelevant product offers, enhancing FundFusion’s brand reputation.
3. Increased Cross-Selling: Targeting Seniors who lack Savings Accounts can significantly boost Third-Party Funds (DPK).


# C. Smartphone Sales Data Analysis Project (SQL)

## Introduction

This project aims to simulate and analyze smartphone sales transaction data using **MySQL**.
In this project, I take the role of a Data Analyst responsible for designing a relational database from scratch, performing data seeding (dummy data input), and answering various business questions through SQL queries, ranging from basic aggregations to more advanced analyses using Subqueries and Window Functions.

## Tools Used
* **Database:** MySQL
* **IDE/GUI:** MySQL Workbench
* **Query Language:** SQL (DDL, DML, DQL)

## Database Structure (Schema)

The database is designed using a simple **Star Schema** consisting of three main interrelated tables:

1. **`products`**: Stores product specifications (ID, Product Name, Brand, Price, Stock).
2. **`customers`**: Stores customer demographic data (ID, Name, City, Gender).
3. **`sales`**: The fact table linking products and customers (Transaction ID, Date, Quantity, Total Price, Payment Method).

**Relationships:**

* `sales.product_id` → `products.product_id`
* `sales.customer_id` → `customers.customer_id`

## Analysis Overview (Key Insights)

Below are the main business questions addressed in this project:

Case 1: “What is our total revenue so far?”

<img width="286" height="71" alt="image" src="https://github.com/user-attachments/assets/9db2eae6-a49d-4d7e-8b66-653f5b7d929a" />

Case 2: “Which smartphone is the best-selling product?”

<img width="255" height="101" alt="image" src="https://github.com/user-attachments/assets/ca7c59c1-73a7-4f0c-9f41-131ae88d1111" />

Case 3: “Who is our top-spending customer?” (Top Spender)

<img width="338" height="140" alt="image" src="https://github.com/user-attachments/assets/16519bf2-0a1f-4bde-88ec-074b03f1d868" />
   
Case 4: “What does the monthly sales trend look like?”

<img width="358" height="122" alt="image" src="https://github.com/user-attachments/assets/25c3fc86-6a67-41eb-ad02-9fa7854b5f8e" />

Case 5: “Which brand contributes the most to our total revenue?”

<img width="217" height="186" alt="image" src="https://github.com/user-attachments/assets/ac453999-e2c9-4a0c-8352-ae8206a280a2" />

Case 6: Customer Segmentation (Data Labeling Technique)

<img width="405" height="242" alt="image" src="https://github.com/user-attachments/assets/75627137-3b6d-4198-9240-1056bb43a32d" />

Case 7: Finding Products Priced “Above Average” (Subquery)

<img width="387" height="186" alt="image" src="https://github.com/user-attachments/assets/1527d178-d3c4-4243-b115-df1823444198" />

Case 8: Pareto/Contribution Analysis (Identifying High-Value Transactions)

<img width="432" height="166" alt="image" src="https://github.com/user-attachments/assets/d053e4ee-1a7c-4527-af00-c1f46cf562ba" />

Case 9: Comparing Transactions by Payment Method (Percentage Breakdown)

<img width="558" height="123" alt="image" src="https://github.com/user-attachments/assets/b7717103-fb6b-4bd6-916d-50f0f14a5c3a" />

## Project Conclusions & Business Insights
Based on the SQL analysis performed on the smartphone sales dataset, several key business insights were derived:

### 1. Product Performance & Revenue Drivers
* **High-End Dominance:** Flagship models (e.g., iPhone 16 Pro Max, Samsung S24 Ultra) contribute significantly to the total revenue despite having lower sales volume compared to mid-range devices. This suggests a high profit margin strategy is effective.
* **Volume Drivers:** Mid-range phones (e.g., Samsung Galaxy A55, Poco F6) drive the transaction volume, acting as the entry point for new customers.

### 2. Customer Behavior & Segmentation
* **The High Value Segment:** Through the segmentation analysis (Case #6), we identified a specific cluster of "High-Value" customers. Although small in number, this group contributes a disproportionate amount to the total revenue (Pareto Principle), indicating that retention strategies should focus heavily on these VIP clients.
* **Spending Patterns:** Top spenders tend to make purchases in Q1 2025, likely driven by new flagship release cycles.

### 3. Payment Preferences
* **Transaction Value Correlation:** There is a clear correlation between transaction size and payment method. High-ticket purchases (> IDR 10 Million) are predominantly made via **Credit Card** and **Bank Transfer**, while **QRIS** and **Cash** are preferred for mid-range and budget accessories.


# D. The Aurora Sky Hotel Analyst (Excel)

## Project Overview
**The Aurora Sky Hotel** is a fictional 4-star hotel facing challenges with stagnant revenue and fluctuating cancellation rates. This project aims to analyze booking data to understand guest behavior, identify revenue drivers, and monitor cancellation trends across different booking platforms.

The goal is to provide the hotel management with a data-driven **Dashboard** to support decision-making regarding pricing strategies and marketing channel optimization.

---

### Business Problem & Objectives
The management team required visibility into:
1.  **Realized Revenue:** Ensuring cancelled bookings are not calculated into the financial forecast.
2.  **Platform Performance:** Which booking channels (Agoda, Expedia, etc.) provide the most reliable guests?
3.  **Room Type Analysis:** Which room category drives the most revenue vs. volume?
4.  **Lead Time Insights:** How far in advance do guests book?

---

## Dataset Description
The dataset consists of **30 records** (simulated data) representing hotel bookings.

**Data Dictionary:**

| Column Name | Description | Data Type |
| :--- | :--- | :--- |
| `Booking_ID` | Unique identifier for each booking | String |
| `Guest_Name` | Name of the guest (Anonymized/Fictional) | String |
| `Booking_Date` | Date when the reservation was made | Date |
| `Check_In_Date` | Date of guest arrival | Date |
| `Check_Out_Date` | Date of guest departure | Date |
| `Room_Type` | Category of the room (Standard, Deluxe, Suite) | String |
| `Nightly_Rate` | Price per night in USD | Currency |
| `Booking_Status` | Status of the booking (Check-Out, Canceled, No-Show) | String |
| `Platform` | Source of booking (Booking.com, Agoda, Direct, etc.) | String |

---

## Methodology & Technical Skills
This project was built entirely in **Google Sheets** (compatible with Excel) to demonstrate data manipulation and visualization skills without using programming languages like Python or SQL.

### 1. Data Cleaning & Feature Engineering
Raw data was transformed to generate meaningful metrics. Key formulas used:

* **Length of Stay (LOS):** Calculated the duration of the trip.
    ```excel
    = Check_Out_Date - Check_In_Date
    ```

* **Lead Time:** Calculated how many days in advance the booking was made.
    ```excel
    = Check_In_Date - Booking_Date
    ```

* **Realized Revenue (Logic):**
    The most critical part of the analysis. A standard multiplication (`Price * Days`) would be incorrect because it includes cancelled bookings. I used a logical `IF` function to ensure only completed stays generate revenue.
    ```excel
    =IF(OR(Booking_Status="Canceled"; Booking_Status="No-Show"); 0; Nightly_Rate * Length_of_Stay)
    ```

### 2. Exploratory Data Analysis (EDA)
Used **Pivot Tables** to summarize key metrics:
* *Revenue and Volume of Bookings by Room Type* (Sum and Count aggregation)
<img width="445" height="146" alt="image" src="https://github.com/user-attachments/assets/8d7d8ac0-cbaa-4b2e-9f64-d550bf9bcc5d" />

* *Booking Status by Platform* (Count aggregation)
<img width="701" height="198" alt="image" src="https://github.com/user-attachments/assets/c2d08d7b-3c69-454c-9dd4-cb5076af24c2" />

* *Average Lead Time by Room Type* (Count aggregation)
<img width="285" height="147" alt="image" src="https://github.com/user-attachments/assets/6f649014-bdf6-49b9-8d8f-22654d6e725e" />

### 3. Dashboard Implementation
Created a visual dashboard focusing on clear, high-level KPIs:
* *Revenue by Room Type*
<img width="755" height="505" alt="image" src="https://github.com/user-attachments/assets/196d9c4a-7124-4111-8981-fc950ea690fa" />

* *Booking Status by Platform*
<img width="770" height="513" alt="image" src="https://github.com/user-attachments/assets/5ccabcf9-dc4d-4af8-9c51-c19180c06795" />

* *Average Lead Time by Room Type*
<img width="825" height="531" alt="image" src="https://github.com/user-attachments/assets/bd21c4b2-518c-4d76-b7e1-44e1e520bc6c" />

---

## Key Insights (Sample Findings)
Based on the analysis of the sample dataset:
1.  **Revenue Drivers:** While 'Standard' rooms have the highest volume of bookings, **'Deluxe'** rooms generate the highest revenue per booking due to the premium price point.
2.  **Cancellation Risks:** **Expedia** showed a higher cancellation rate compared to Direct bookings, suggesting a need to review cancellation policies on OTA platforms.
3.  **Lead Time:** Guests booking 'Deluxe' tend to book further in advance (High Lead Time) compared to 'Standard' room guests who are more likely to be last-minute bookers.
