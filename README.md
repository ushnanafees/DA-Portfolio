# DA-Portfolio

Bank Churn Analysis | SQL Portfolio | Data Analyst



\# 🏦 Bank Churn Analysis — SQL Portfolio Project



!\[SQL](https://img.shields.io/badge/Language-SQL-blue)

!\[Status](https://img.shields.io/badge/Status-In%20Progress-yellow)

!\[Level](https://img.shields.io/badge/Level-Junior%20DA-green)



\## 📌 Project Overview

Analysis of a bank customer churn dataset using SQL.

Identifying customers at risk of leaving, revenue exposure by geography,

and key financial KPIs a bank analyst runs daily.



\---



\## 🎯 Business Questions Answered

\- Which customers in Germany hold balances above €50,000?

\- What is the churn rate per country?

\- How much revenue is at risk from churned customers?

\- What percentage of total balance does each country's churn represent?

\- Which age groups are most active with credit cards?



\---



\## 🗃️ Dataset

| Column | Description |

|--------|-------------|

| CustomerId | Unique customer ID |

| Surname | Customer last name |

| CreditScore | Customer credit score |

| Geography | Country (France, Germany, Spain) |

| Gender | Male / Female |

| Age | Customer age |

| Tenure | Years with the bank |

| Balance | Account balance |

| NumOfProducts | Number of bank products held |

| HasCrCard | Has credit card (1=Yes, 0=No) |

| IsActiveMember | Active in last period (1=Yes, 0=No) |

| EstimatedSalary | Estimated annual salary |

| Exited | Churned (1=Yes, 0=No) |



\*\*Source:\*\* Kaggle — Bank Customer Churn Dataset

\*\*Rows:\*\* 10,000 customers



\---



\## 📁 Project Structure

```

germany-da-portfolio/

├── sql/week1\_queries.sql     # 10 core queries + KPI queries

├── datasets/bank\_churn.csv   # Raw dataset

├── screenshots/              # Query output proofs

└── docs/schema.md            # Column reference

```



\---



\## 🔍 Key Queries \& Insights



\### 1. Revenue at Risk by Country

Churned customers in Germany hold the highest average balance,

making them the top revenue risk despite lower churn volume than France.



\### 2. Churn Rate by Geography

| Country | Churn Rate |

|---------|-----------|

| Germany | \~32% |

| France | \~16% |

| Spain | \~17% |



\### 3. CTE — % of Total Balance Lost

Uses a CTE to calculate what share of total balance

each country's churned customers represent.



\---



\## 💡 Skills Demonstrated

\- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`

\- Aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`

\- `CASE WHEN` for segmentation

\- CTEs (`WITH` clause)

\- `CROSS JOIN` for ratio calculations

\- NULL checking across all columns

\- Business context for every query



\---



\## 📅 Progress Log

| Day | Work Done |

|-----|-----------|

| Day 3 | Week 1 queries written and reviewed |

| Day 4 | Bugs fixed, screenshots added |

| Day 5 | README completed, schema documented |



\---



\## 👤 About Me

Ushna Nafees — Aspiring Data Analyst

📍 Germany 

🔗 https://www.linkedin.com/in/ushna-nafees-414918165/

📧 ushnanafees.25@gmail.com



\*Open to Junior Data Analyst / Business Analyst roles\*

