-- Data Analysis Using SQL

#Show all customer records
SELECT * FROM sales.customers;

#Show total number of customers

SELECT count(*) FROM sales.customers;

#Show transactions for Chennai market (market code for chennai is Mark001)

SELECT * FROM sales.transactions
where market_code='Mark001';

#Show distrinct product codes that were sold in chennai

SELECT distinct product_code FROM sales.transactions 
where market_code='Mark001';

#Show transactions where currency is US dollars

SELECT * from sales.transactions 
where currency="USD";

#Show transactions in 2020 join by date table

SELECT * FROM sales.transactions
INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date
WHERE year = 2020;

#Show total revenue in year 2020,

SELECT SUM(transactions.sales_amount) FROM sales.transactions 
INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date 
where date.year=2020 and transactions.currency="INR\r" or transactions.currency="USD\r";

#Show total revenue in year 2020, January Month,

SELECT SUM(transactions.sales_amount) FROM sales.transactions
INNER JOIN sales.date 
ON sales.transactions.order_date = sales.date.date
where date.year=2020 and date.month_name="January" and (transactions.currency="INR\r" or transactions.currency="USD\r");

#Show total revenue in year 2020 in Chennai

SELECT SUM(transactions.sales_amount) FROM sales.transactions
INNER JOIN sales.date 
ON sales.transactions.order_date = sales.date.date 
where date.year=2020 and transactions.market_code="Mark001";
