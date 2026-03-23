-- =============================================================
--  Products Table + JOIN Queries
-- =============================================================
-- KEY CONCEPT: Our existing 'bank_churn' table has CustomerID
-- To JOIN with a 'products' table we need
-- a shared column. We add a bridge via CustomerID in a junction
-- table, but for this exercise we use ProductID directly.
-- =============================================================


-- -------------------------------------------------------------
-- STEP 1: Create the products table
-- -------------------------------------------------------------
CREATE TABLE products (
    ProductID     INT           PRIMARY KEY,
    ProductName   VARCHAR(50)   NOT NULL,
    MonthlyFee    DECIMAL(8,2)  NOT NULL,
    RiskLevel     VARCHAR(10)   NOT NULL   -- 'Low', 'Medium', 'High'
);

-- -------------------------------------------------------------
-- STEP 2: Insert 4 product rows
-- -------------------------------------------------------------
INSERT INTO products (ProductID, ProductName, MonthlyFee, RiskLevel)
VALUES
    (1, 'Savings Account',  0.00,  'Low'),
    (2, 'Current Account',  5.00,  'Low'),
    (3, 'Credit Card',     15.00,  'Medium'),
    (4, 'Investment Fund', 30.00,  'High');


select * from products p 


-- in my bank_churn table CustomerID was not PK ALter table to make it Primary Key.
ALTER TABLE bank_churn ADD PRIMARY KEY (CustomerID);


-- -------------------------------------------------------------
-- STEP 3: Bridge / junction table (links customers to products)
-- Without this table you CANNOT do a meaningful JOIN because
-- customers has NumProducts (a count) not a ProductID column.
-- -------------------------------------------------------------
CREATE TABLE customer_products (
    CustomerID  INT  NOT NULL,
    ProductID   INT  NOT NULL,
    PRIMARY KEY (CustomerID, ProductID),
    FOREIGN KEY (CustomerID) REFERENCES bank_churn(CustomerID),
    FOREIGN KEY (ProductID)  REFERENCES products(ProductID)
);


-- Sample data: assign products to a few customers
-- (In real life this would come from application data)

INSERT INTO customer_products (CustomerID, ProductID)
SELECT 
    CustomerID,
    FLOOR(1 + RAND() * (SELECT MAX(ProductID) FROM products))
FROM bank_churn bc ;


select * 
from customer_products
where ProductID = 4;

-- -------------------------------------------------------------
-- As we can't join directly bank_churn table with products table, 
-- We make bridge table customer_product to fetch data from both 
-- bank_churn table and products table and apply join two time. 

-- 1) Customer details + their product names,
-- -------------------------------------------------------------
select bc.CustomerId , bc.Surname , bc.age , bc.Balance , p.ProductName , p.RiskLevel , p.MonthlyFee 
from bank_churn bc 
inner join customer_products cp on bc.CustomerId = cp.CustomerID 
inner join products p on cp.ProductID = p.ProductID ;

-- WHY INNER JOIN?
-- Think of it as the overlapping centre of two circles (Venn diagram).
-- A customer with NO product row in customer_products is EXCLUDED.
-- A product with NO customer is also EXCLUDED.
-- Only rows that exist on BOTH sides are returned.

