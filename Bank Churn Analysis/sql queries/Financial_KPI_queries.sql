-- Financial KPI Queries bank analyst runs daily:
-- Revenue Risk
-- find the balance as revenue risk of exited customers per country  
SELECT geography, COUNT(*) as churned_customers,
Round(SUM(balance),2) as revenue_at_risk 
FROM bank_churn bc  
WHERE exited=1
GROUP BY geography 
ORDER BY revenue_at_risk desc;


