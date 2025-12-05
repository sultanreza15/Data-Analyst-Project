# **1. Prediction Model (Python-Jupyter Notebook)**  

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

**Conclusion**
Across all models, the average accuracy exceeds 60%, but the recall remains below 40%. This indicates that many customers who are actually at risk of default are being incorrectly predicted as non-defaulters. Therefore, it can be concluded that the desired objective has not yet been achieved in this iteration of model development.

**Potential Improvements for Future Development:**

* Increase the sample size (number of customers), assuming the current dataset does not represent the full customer population.
* Apply oversampling techniques to the minority class (defaults) to reduce model bias.
* Extend the time horizon of the dataset.
* Experiment with additional variable combinations (adding new variables or removing those with low importance in the latest results).
* Broaden hyperparameter tuning combinations during model training.
* Try alternative supervised machine learning algorithms.


# **2. Clustering Model (Python-Jupyter Notebook)**

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

**Conclusion**
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


# **3. Gadget Retail Analysis (SQL)**

**Project Description**
This project aims to simulate a retail gadget store database and perform a comprehensive sales performance analysis. I designed a relational database, conducted data entry, and executed SQL queries to answer key business questions related to sales trends, top customers, and best-selling products.
Tools Used: MySQL Workbench.

**Database Structure (ERD)**
The database consists of three main relational tables:
1. Customers: Stores customer demographic information.
2. Products: Contains product inventory and pricing details.
3. Transactions: Records purchase details (linking Customers and Products).

**Findings & Business Insights**
Based on the SQL analysis performed, here are the key insights:

