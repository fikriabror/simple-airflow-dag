-- 1. Overall churn rate
SELECT 
    COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM telecom_customer_churn_output;

-- Churn rate by contract type
SELECT 
    contract,
    COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM telecom_customer_churn_output
GROUP BY contract;


--2. Customer Segmentation

-- Churn rate by age group
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS age_group,
    COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY age_group;

-- Churn rate by gender
SELECT 
    gender,
    COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY gender;


-- 3. Contract and Payment Analysis

-- Churn rate by contract type
SELECT 
    contract,
    COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY contract;

-- Churn rate by payment method
SELECT 
    payment_method,
    COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY payment_method;


--4. Revenue and Charge Analysis
-- Average monthly charge for churned vs non-churned customers
SELECT 
    customer_status,
    AVG(monthly_charge) AS avg_monthly_charge
FROM telecom_customer_churn
GROUP BY customer_status;

-- Total revenue by churn status
SELECT 
    customer_status,
    SUM(total_revenue) AS total_revenue
FROM telecom_customer_churn
GROUP BY customer_status;


-- 5. Service Usage Analysis
-- Churn rate by internet service type
SELECT 
    internet_service,
    COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY internet_service;

-- Churn rate by whether the customer has online security
SELECT 
    online_security,
    COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY online_security;


-- 6. Geographic Analysis
-- Churn rate by city
SELECT 
    city,
    COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY city
ORDER BY churn_rate_percentage DESC
LIMIT 10;

-- Average monthly charges by city
SELECT 
    city,
    AVG(monthly_charge) AS avg_monthly_charge
FROM telecom_customer_churn
GROUP BY city;


-- 7. Churn Reason Analysis
-- Churn reasons distribution
SELECT 
    churn_reason,
    COUNT(*) AS number_of_churns
FROM telecom_customer_churn
WHERE customer_status = 'Churned'
GROUP BY churn_reason
ORDER BY number_of_churns DESC;








