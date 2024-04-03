DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees(emp_id, name, department, salary) VALUES
(1, 'John Doe', 'Finance', 60000.00),
(2, 'Jane Smith', 'Finance', 65000.00), 
(2, 'Jane Smith', 'Finance', 65000.00),   -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(10, 'Kevin Martinez', 'Sales', 61000.00);

select * from employees


--IDENTIFY DUPLICATE ENTRIES IN A TABLE--

-- Below query just identifies the duplicates--

SELECT emp_id,name,COUNT(2) as Total_frequency
from employees
GROUP BY emp_id,name
having count(2)>1

--The Below query will give the correct output--

SELECT 
emp_id,
name,	
COUNT(1) as total_frequency
FROM employees
GROUP BY emp_id, name
HAVING COUNT(1) > 1


-- Approach 2 Row Number --

WITH CTE AS
(SELECT *,
ROW_NUMBER()OVER(PARTITION BY NAME ORDER BY NAME)AS RN
FROM employees)
SELECT * FROM CTE WHERE RN>1


-- TASK:SQL query to get the count of employees greater than 2--

SELECT emp_id,name,count(emp_id) as count_of_employees
from employees
group by emp_id,name
having count(emp_id)>2








