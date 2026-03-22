-- Financial KPI Queries bank analyst runs daily:
-- Revenue Risk
-- find the balance as revenue risk of exited customers per country  
SELECT geography, COUNT(*) as churned_customers,
Round(SUM(balance),2) as revenue_at_risk 
FROM bank_churn bc  
WHERE exited=1
GROUP BY geography 
ORDER BY revenue_at_risk desc;


-- what percentage of total balance does each country's churned revenue represent? 
-- need to find % of balance for each country where customers exited 

-- here 1st we count total balance where customers exited. and keep in CTE
-- then in 2nd Select statement finding total customers balance and divide by balance of exited customers
-- apply cross join to combine data
WITH total_balance AS (
    SELECT SUM(Balance) AS total_bal
    FROM bank_churn
    WHERE exited = 1
)
SELECT 
    bc.Geography,
    COUNT(*) AS total_customer,
    ROUND(SUM(bc.Balance), 2) AS revenue_at_risk,
    CONCAT(
        ROUND(SUM(bc.Balance) * 100.0 / tb.total_bal, 2),
        '%'
    ) AS percent_total_balance
FROM bank_churn bc
CROSS JOIN total_balance tb
WHERE bc.exited = 1
GROUP BY bc.Geography, tb.total_bal
ORDER BY revenue_at_risk DESC;

