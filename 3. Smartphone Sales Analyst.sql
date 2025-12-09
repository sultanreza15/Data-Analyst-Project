CREATE DATABASE smartphone_sales;
USE smartphone_sales;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY, -- Auto-incrementing ID (1, 2, 3…)
    product_name VARCHAR(100) NOT NULL,        -- Product name (text)
    brand VARCHAR(50) NOT NULL,                -- Product brand
    price DECIMAL(15, 2) NOT NULL,             -- Price (supports large numeric values)
    stock_quantity INT DEFAULT 100             -- Initial stock is set to 100 for all items
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique customer identifie
    customer_name VARCHAR(100) NOT NULL,        -- Full name
    city VARCHAR(50),							-- City of residence
    gender ENUM('Male', 'Female') 				-- Gender
);

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id INT,    			-- Identifies who made the purchase
    product_id INT,     			-- Indicates which product was purchased
    quantity INT NOT NULL,
    total_amount DECIMAL(15, 2), 	-- (price × quantity)
    payment_method VARCHAR(50), 	-- Cash, Credit Card, QRIS, etc
    -- Creating relationships between tables
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_name, brand, price) VALUES 
('Iphone 16', 'Apple', 16499000),
('Iphone 16 Pro', 'Apple', 20999000),
('Iphone 16 Pro Max', 'Apple', 24999000),
('Samsung Galaxy S24', 'Samsung', 13999000),
('Samsung Galaxy S24+', 'Samsung', 16999000),
('Samsung Galaxy S24 Ultra', 'Samsung', 21999000),
('Vivo X100', 'Vivo', 11999000),
('Iqoo 13', 'Iqoo', 10999000), 
('Oppo Find X8', 'Oppo', 13499000), 
('Xiaomi 14', 'Xiaomi', 11999000),
('Samsung Galaxy A55', 'Samsung', 5999000),
('Xiaomi 14T', 'Xiaomi', 6499000),
('Poco F6', 'Poco', 5499000),
('Oppo Reno 13', 'Oppo', 6999000),
('Vivo V40', 'Vivo', 6499000);

INSERT INTO customers (customer_name, city, gender) VALUES 
('Budi Santoso', 'Jakarta', 'Male'),
('Siti Aminah', 'Bandung', 'Female'),
('Andi Pratama', 'Surabaya', 'Male'),
('Dewi Lestari', 'Yogyakarta', 'Female'),
('Rizky Kurniawan', 'Jakarta', 'Male'),
('Nurul Hidayah', 'Semarang', 'Female'),
('Eko Saputra', 'Medan', 'Male'),
('Dian Sastro', 'Jakarta', 'Female'),
('Fajar Nugraha', 'Bandung', 'Male'),
('Putri Indah', 'Bali', 'Female');

INSERT INTO sales (sale_date, customer_id, product_id, quantity, total_amount, payment_method) VALUES 
-- January 2025 Transactions
('2025-01-10', 1, 1, 1, 16499000, 'Credit Card'), -- Budi purchased an iPhone 16
('2025-01-12', 3, 4, 1, 13999000, 'Transfer Bank'), -- Andi purchased a Samsung S24
('2025-01-15', 2, 11, 2, 11998000, 'Cash'), -- Siti purchased 2 units of Samsung A55 (5.999M x 2)
('2025-01-20', 5, 13, 1, 5499000, 'QRIS'), -- Rizky purchased a Poco F6

-- February 2025 Transactions
('2025-02-05', 4, 2, 1, 20999000, 'Credit Card'), -- Dewi purchased an iPhone 16 Pro
('2025-02-14', 6, 15, 1, 6499000, 'QRIS'), -- Nurul purchased a Vivo V40
('2025-02-28', 1, 6, 1, 21999000, 'Transfer Bank'), -- Budi purchased again, an S24 Ultra

-- March 2025 Transactions
('2025-03-03', 7, 12, 1, 6499000, 'Cash'), -- Eko purchased a Xiaomi 14T
('2025-03-10', 8, 3, 1, 24999000, 'Credit Card'), -- Dian purchased an iPhone 16 Pro Max
('2025-03-15', 9, 7, 1, 11999000, 'Transfer Bank'), -- Fajar purchased a Vivo X100
('2025-03-20', 10, 10, 1, 11999000, 'QRIS'), -- Putri purchased a Xiaomi 14
('2025-03-25', 2, 14, 1, 6999000, 'Cash'), -- Siti purchased an Oppo Reno 13

-- April 2025 Transactions
('2025-04-05', 3, 5, 1, 16999000, 'Credit Card'), -- Andi purchased an S24+
('2025-04-10', 5, 9, 1, 13499000, 'Transfer Bank'), -- Rizky purchased an Oppo Find X8
('2025-04-12', 4, 8, 1, 10999000, 'QRIS'), -- Dewi purchased an Iqoo 13
('2025-04-15', 1, 11, 1, 5999000, 'Cash'), -- Budi purchased a Samsung A55
('2025-04-20', 6, 13, 2, 10998000, 'Credit Card'), -- Nurul purchased 2 units of Poco F6
('2025-04-25', 7, 1, 1, 16499000, 'Transfer Bank'); -- Eko purchased an iPhone 16

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM sales;

-- Data Verification (Sanity Check)
SELECT 
    s.sale_date, 
    c.customer_name, 
    p.product_name, 
    p.price, 
    s.quantity, 
    s.total_amount
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;
-- Note:
-- 1. We retrieve data from the sales table (aliased as s).
-- 2. We join the customers table (aliased as c) to identify the buyer’s name.
-- 3. We join the products table (aliased as p) to determine the product name.


-- Case 1: “What is our total revenue so far?”
SELECT 
    SUM(total_amount) AS total_revenue, -- Summing all incoming revenue
    COUNT(*) AS total_transactions      -- Counting how many transactions have occurred
FROM sales;
-- Note:
-- 1. SUM(...): A mathematical function used to add numeric values.
-- 2. AS ...: This is an alias. It ensures the output column name looks clean (e.g., “total_revenue” instead of “SUM(total_amount)”).

-- Case 2: “Which smartphone is the best-selling product?”
SELECT 
    p.product_name, 
    SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name       -- Grouped by product name
ORDER BY total_sold DESC      -- Sorted from highest to lowest (DESCending)
LIMIT 3;                      -- Only retrieving the Top 3
-- Note:
-- 1. GROUP BY: Required when using aggregate functions (SUM/COUNT) while also displaying a text column (e.g., product name). It combines rows with matching product names into a single row.
-- 2. DESC: Short for Descending (largest to smallest). Use ASC if you want smallest to largest.

-- Case 3: “Who is our top-spending customer?” (Top Spender)
SELECT 
    c.customer_name, 
    c.city,
    SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name, c.city
ORDER BY total_spent DESC
LIMIT 5;

-- Case 4: “What does the monthly sales trend look like?”
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS sales_month, -- Change '2025-01-10' to '2025-01'
    COUNT(sale_id) AS number_of_sales,
    SUM(total_amount) AS income
FROM sales
GROUP BY sales_month
ORDER BY sales_month ASC;
-- Note: 
-- DATE_FORMAT: A useful MySQL function for formatting dates. %Y-%m means we extract only the Year–Month portion.

-- Case 5: “Which brand contributes the most to our total revenue?”
SELECT 
    p.brand,
    SUM(s.total_amount) AS brand_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.brand
ORDER BY brand_revenue DESC;

-- Case 6: Customer Segmentation (Data Labeling Technique)
-- Business Scenario: The marketing team wants to send different types of promotions. They request that customers be categorized into three segments:
-- 1. High Spenders: Total spending above IDR 20 million.
-- 2. Mid Spenders: Total spending between IDR 10–20 million.
-- 3. Budget Spenders: Total spending below IDR 10 million.
SELECT 
    c.customer_name,
    SUM(s.total_amount) AS total_spending,
    CASE 
        WHEN SUM(s.total_amount) > 20000000 THEN 'High Value'
        WHEN SUM(s.total_amount) BETWEEN 10000000 AND 20000000 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS customer_category
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spending DESC;

-- Case 7: Finding Products Priced “Above Average” (Subquery)
-- Business Scenario: We want to identify which smartphones are priced higher than the average price of all products sold. This helps differentiate premium items from budget options.
SELECT 
    product_name, 
    brand, 
    price
FROM products
WHERE price > (SELECT AVG(price) FROM products) -- sub-query
ORDER BY price DESC;
-- Note:
-- 1. SQL first calculates the average price of all products (e.g., average price is IDR 13 million).
-- 2. Then it filters out products priced above that 13-million threshold. Without a subquery, you would need to manually calculate the average beforehand and hard-code it.

-- Case 8: Pareto/Contribution Analysis (Identifying High-Value Transactions)
-- Business Scenario: We only want to analyze sales transactions with large total amounts (e.g., above IDR 15 million), while small-value transactions can be skipped for now.
-- Here we use HAVING. Note: WHERE cannot be used to filter aggregate results (SUM/COUNT), which is why we use HAVING instead.
SELECT 
    c.customer_name,
    p.product_name,
    s.total_amount
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
HAVING s.total_amount > 15000000 -- Filter numbers after selection
ORDER BY s.total_amount DESC;

-- Case 9: Comparing Transactions by Payment Method (Percentage Breakdown)
-- Business Scenario: The boss wants to know which payment methods customers prefer and what percentage each contributes to total revenue
SELECT 
    payment_method,
    COUNT(sale_id) AS total_transaction,
    SUM(total_amount) AS total_revenue,
    -- Calculate the contribution percentage
    ROUND((SUM(total_amount) / (SELECT SUM(total_amount) FROM sales) * 100), 2) AS contribution_percentage
FROM sales
GROUP BY payment_method
ORDER BY total_revenue DESC;
-- Note:
-- 1. ROUND(..., 2): Ensures the decimal result is limited to 2 digits.
-- 2. The expression (SELECT SUM(total_amount) FROM sales) retrieves the total overall revenue to be used as the denominator.