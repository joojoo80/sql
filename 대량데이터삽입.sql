use employees;
    
-- SELECT first_name, last_name, hire_date 
-- FROM employees.employees 
-- LIMIT 500;

-- select count(*) from employees.employees ;

CREATE TABLE indexTBL (first_name varchar(14), last_name varchar(16), hire_date date);

INSERT INTO indexTBL 
    SELECT first_name, last_name, hire_date 
    FROM employees.employees 
    LIMIT 500;
    
SELECT * FROM indexTBL;

select * from indexTBL where first_name  ='Mary';