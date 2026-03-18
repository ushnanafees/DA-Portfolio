-- Select all from bank_churn table
select * from bank_churn;

-- rows count of table
select count(*) from bank_churn;


-- (1) All customers in Germany with balance > 50,000
-- analyse all customers with balance greater than 50k
select bc.CustomerId , bc.Surname , bc.Balance 
from bank_churn bc 
where bc.Balance > 50000 and bc.Geography = 'Germany';


-- (2) COUNT churned vs retained 
-- Counting how many customers exited and how many stayed
select Count(case when bc.Exited = 1 then 1 end) as total_churned,
Count(case when bc.Exited =0 then 1 end) as total_retained
from bank_churn bc; 


-- (3) Average salary by geography, 
-- analyse average salary by geography to find trend which geography have higher salaries
select Round(AVG(bc.EstimatedSalary),2) as average_salaries, bc.Geography 
from bank_churn bc 
group by bc.Geography 
order by average_salaries DESC;


-- (4) Customers with 3+ products,
-- quering which customers are with more than 3 products
select bc.CustomerId , bc.Surname , bc.NumOfProducts 
from bank_churn bc 
where bc.NumOfProducts >= 3;


-- (5) Top 10 highest balance customers, 
-- getting top 10 customer that balance is highest
select bc.CustomerId , bc.Surname , bc.Balance , bc.Geography , bc.Exited 
from bank_churn bc
order by bc.Balance DESC
limit 10;


-- (6) Churn rate per country using GROUP BY and division,
-- Find which country have highest churn rate/ customers exited

select Count(*) as total_customer, SUM(bc.Exited) as total_exited, bc.Geography ,
CONCAT(Round(SUM(bc.Exited) * 100 / Count(*),2), '%') as churn_rate
from bank_churn bc
group by(bc.Geography)
order by churn_rate desc;


-- (7) Active members with credit card by age group,
-- make age groups and find which customers are active and having credit cards
select 
case
	when bc.age between 0 AND 17 then '0-17'
	when bc.age between 18 AND 35 then '18-35'
	when bc.age between 36 AND 50 then '36-50'
	when bc.age between 51 AND 60 then '51-60'
	ELSE '60+'
	end as age_group,
	Count(*) as total_customer
from bank_churn bc 
where bc.IsActiveMember = 1 and bc.HasCrCard = 1
group by age_group; 


-- (8) Min/Max/Avg balance overall and by country,
-- statistical analysis to find min, mx and average values of data 
select Min(bc.Balance) as Min_Balance, 
	   Max(bc.Balance)as Max_Balance ,
	   Round(AVG(bc.Balance),2) as Average_Balance , bc.Geography 
from bank_churn bc 
group by bc.Geography ;



-- (9) NULL check on all columns.
-- check if any missing or null values in dataset
select *
from bank_churn bc
where bc.Age is null or bc.Balance is null or bc.CreditScore is null
or bc.CustomerId is null or bc.EstimatedSalary is null or bc.Exited is null or bc.Gender is null 
or bc.Geography is null or bc.HasCrCard is null or bc.IsActiveMember is null or
bc.NumOfProducts is null or bc.RowNumber is null or bc.Surname is null or bc.Tenure is null;





