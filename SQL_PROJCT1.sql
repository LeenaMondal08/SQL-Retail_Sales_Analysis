DROP TABLE retail_sales;

CREATE TABLE retail_sales
(
    transactions_id NUMBER PRIMARY KEY,	
    sale_date DATE,	 
    sale_time VARCHAR2(10),	
    customer_id NUMBER,
    gender VARCHAR2(15),
    age NUMBER,
    category VARCHAR2(15),	
    quantiy NUMBER,
    price_per_unit NUMBER(6,2),	
    cogs NUMBER(6,2),
    total_sale NUMBER
);
select * from retail_sales;
select count(*) from retail_sales;

-- cheaking there is any null value present or not
SELECT * 
FROM retail_sales 
WHERE transactions_id IS NULL 
   OR sale_date IS NULL 
   OR sale_time IS NULL 
   OR customer_id IS NULL 
   OR gender IS NULL 
   OR age IS NULL 
   OR category IS NULL 
   OR quantiy IS NULL 
   OR price_per_unit IS NULL 
   OR cogs IS NULL 
   OR total_sale IS NULL;
   
-- data cleaning
-- delete the null recorod from the data

delete from retail_sales
where transactions_id IS NULL 
   OR sale_date IS NULL 
   OR sale_time IS NULL 
   OR customer_id IS NULL 
   OR gender IS NULL 
   OR age IS NULL 
   OR category IS NULL 
   OR quantiy IS NULL 
   OR price_per_unit IS NULL 
   OR cogs IS NULL 
   OR total_sale IS NULL;
   
-- how many unique customer we have
select count( distinct customer_id) from retail_sales;
-- how many  product category we have 
select distinct category from retail_sales;

--bussiness key problem analysis
-- 1. retrive all record from sales which made on 2022-11-05;
select * from retail_sales where sale_date = TO_DATE('05-11-2022', 'DD-MM-YYYY');

-- retrive all the recorde where category is 'cloth' and quatity sold more than 2 for nov-2022

SELECT * 
FROM retail_sales
WHERE category = 'Clothing' and quantiy>2
  AND sale_date between TO_DATE('01-11-2022', 'DD-MM-YYYY') and TO_DATE('30-11-2022', 'DD-MM-YYYY');   
   
-- calculale the total sale from each category

select category, sum(total_sale) from retail_sales group by category;

--find the avg age of customer who purches the item from betury category
select round(avg(age),2) from retail_sales where category='Beauty';

-- find all the transaction where total sale is more than 1000;
select transactions_id from retail_sales where total_sale>1000;


-- find the total number of transaction made by each gender in  each category

select category, gender,count(*) from retail_sales group by category,gender order by 1;

-- find the avg sale for each, month

