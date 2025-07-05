-- SQL Create Table
CREATE TABLE customers (
  customer_id NUMBER(10) NOT NULL,
  customer_name VARCHAR2(50) NOT NULL,
  customer_email VARCHAR2(50),
  customer_city VARCHAR2(50),
  CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

-- Describe Table
DESCRIBE customers;

-- SQL Drop Table
DROP TABLE customers;

-- ALTER TABLE
-- 1. Add a column in an existing table
ALTER TABLE customers
  ADD customer_country VARCHAR2(50);

-- 2. Modify a column in an existing table
ALTER table customers
  MODIFY customer_country VARCHAR2(100);

-- 3. Drop a column from an existing table
ALTER TABLE customers
  DROP COLUMN customer_country;

-- 4. Rename a column in an existing table
ALTER TABLE customers
  RENAME COLUMN city TO customer_city;

-- 5. Rename an existing table
ALTER TABLE customers
  RENAME TO customers2;

-- TRUNCATE TABLE (Remove all records)
TRUNCATE TABLE customers;

-- INSERT ALL
INSERT ALL
  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (1, 'Doraemon', 'doraemon@example.com', 'Tokyo');

  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (2, 'Nobita', 'nobita@example.com', 'Tokyo')

  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (3, 'Shizuka', 'shizuka@example.com', 'Kyoto')

  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (4, 'Suneo', 'suneo@example.com', 'Osaka')

  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (5, 'Gian', 'gian@example.com', 'Nagoya')

  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (6, 'Dekisugi', 'dekisugi@example.com', 'Tokyo')

  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (7, 'Tamako', 'tamako@example.com', 'Osaka')

  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (8, 'Nobi', 'nobi@example.com', 'Kyoto')

  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (9, 'Jaiko', 'jaiko@example.com', 'Nagoya')

  INTO customers (customer_id, customer_name, customer_email, customer_city)
  VALUES (10, 'Doremi', 'doremi@example.com', 'Tokyo')
SELECT * FROM dual;

-- INSERT INTO
INSERT INTO customers (customer_id, customer_name, customer_email)
VALUES (11, 'Zubu', 'zubu@example.com');

-- SELECT *
SELECT * FROM customers;

-- SELECT
SELECT customer_id, customer_name, customer_email, customer_city
FROM customers
WHERE customer_id > 1;

-- SELECT DISTINCT
SELECT DISTINCT customer_city FROM customers;

-- ORDER BY
SELECT customer_id, customer_name, customer_email, customer_city 
FROM customers
WHERE customer_id > 1
ORDER BY customer_name;  -- ASC (Default) | DESC

-- ALIASES (AS)
SELECT
  customer_id AS "ID",
  customer_name AS "NAME",
  customer_email AS "Email",
  customer_city AS "City"
FROM customers;

-- UPDATE
UPDATE customers
SET customer_city = 'Kyoto'
WHERE customer_id = 1;

-- DELETE
DELETE FROM customers
WHERE customer_id = 1;

-- NULL
SELECT customer_name, customer_email, customer_city
FROM customers
WHERE customer_city IS NULL;  -- IS NOT NULL

-- LIKE
SELECT customer_name, customer_email, customer_city
FROM customers
WHERE customer_city LIKE 'Ky%';  -- '%' (matches all chars)
                                 -- '_' (matches single char)

-- IN
SELECT customer_name, customer_email, customer_city
FROM customers
WHERE customer_name IN ('Doraemon', 'Nobita', 'Shizuka');  -- IN a list of array

-- BETWEEN
SELECT customer_id, customer_name, customer_email, customer_city
FROM customers
WHERE customer_id BETWEEN 4 AND 7;

-- UNIQUE
CREATE TABLE customers_uniq (
  customer_id NUMBER(10) NOT NULL,
  customer_name VARCHAR2(50) NOT NULL,
  customer_email VARCHAR2(50),
  customer_city VARCHAR2(50),
  CONSTRAINT customers_uniq_pk PRIMARY KEY (customer_id),
  CONSTRAINT customer_uniq_name UNIQUE (customer_email)
);

INSERT INTO customers_uniq (customer_id, customer_name, customer_email)
VALUES (1, 'Doraemon', 'doraemon@example.com');

INSERT INTO customers_uniq (customer_id, customer_name, customer_email)
VALUES (2, 'Doraemon', 'doraemon@example.com');

-- FOREIGN KEY
CREATE TABLE orders (
  order_id NUMBER(10) NOT NULL,
  customer_id NUMBER(10) NOT NULL,
  order_item VARCHAR2(50) NOT NULL,
  order_date DATE DEFAULT SYSDATE,
  order_amount NUMBER(10,2) NOT NULL,
  CONSTRAINT orders_pk PRIMARY KEY (order_id),
  CONSTRAINT orders_customers_fk FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

-- DESCRIBE
DESCRIBE orders;

-- Drop foreign key constraint from a child table
ALTER TABLE orders
  DROP CONSTRAINT orders_customers_fk;

-- Add foreign key constraint to a child table
ALTER TABLE orders
  ADD CONSTRAINT orders_customers_fk FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id);

-- Check user constraints
SELECT * FROM user_constraints;  -- P = Primary, R = Referential (Foreign),
                                 -- U = Unique, C = Check

-- Insert into orders table having foreign key
INSERT ALL
  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (101, 10, 'Time Machine', 99999.50)

  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (102, 5, 'Anywhere Door', 4999.50)

  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (103, 3, 'Bamboo Copter', 120.75)

  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (104, 1, 'Time Machine', 2500.00)

  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (105, 4, 'Anywhere Door', 15.50)

  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (106, 5, 'Air Cannon', 200.00)

  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (107, 7, 'Time Machine', 750.25)

  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (108, 3, 'Air Cannon', 3500.50)

  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (109, 4, 'Air Cannon', 5.00)

  INTO orders (order_id, customer_id, order_item, order_amount)
  VALUES (110, 5, 'Time Machine', 99.50)
SELECT * FROM dual;

-- Show all records from orders
SELECT order_id, customer_id, order_item, order_date, order_amount FROM orders;

-- CHECK
CREATE TABLE customers_check (
  customer_id NUMBER(10) NOT NULL,
  customer_name VARCHAR2(50) NOT NULL,
  customer_email VARCHAR2(50),
  customer_city VARCHAR2(50),
  CONSTRAINT customers_check_pk PRIMARY KEY (customer_id),
  CONSTRAINT customer_id_check CHECK (customer_id > 1000)
);

INSERT INTO customers_check (customer_id, customer_name)
VALUES (1, 'Doraemon');

-- DEFAULT
CREATE TABLE customers_default (
  customer_id NUMBER(10) NOT NULL,
  customer_name VARCHAR2(50) NOT NULL,
  customer_email VARCHAR2(50),
  customer_city VARCHAR2(50) DEFAULT 'Tokyo',
  CONSTRAINT customers_default_pk PRIMARY KEY (customer_id)
);

INSERT INTO customers_default (customer_id, customer_name)
VALUES (1, 'Doraemon');

SELECT * FROM customers_default;

-- COUNT
SELECT COUNT(customer_id) AS "Customer Count"
FROM customers
WHERE customer_id > 1;

-- SUM
SELECT customer_id, SUM(order_amount) AS "Total Amount"
FROM orders
GROUP BY customer_id;

-- MIN
SELECT customer_id, MIN(order_amount) AS "Min Amount"
FROM orders
GROUP BY customer_id;

-- MAX
SELECT customer_id, MAX(order_amount) AS "Max Amount"
FROM orders
GROUP BY customer_id;

-- AVG
SELECT AVG(order_amount) AS "Average Amount"
FROM orders
WHERE order_id >= 1;

-- GROUP BY
SELECT customer_city, COUNT(customer_name) AS total_customer
FROM customers
GROUP BY customer_city;

-- HAVING
SELECT customer_city, COUNT(customer_name) AS total_customer
FROM customers
GROUP BY customer_city
HAVING total_customer = 3;

-- WHERE EXISTS
SELECT customer_id, customer_name
FROM customers
WHERE EXISTS (
  SELECT order_id, customer_id
  FROM orders
  WHERE orders.customer_id = customers.customer_id
);

-- ANY
SELECT * FROM orders
WHERE order_amount > ANY (
  SELECT order_amount
  FROM orders
  WHERE order_item = 'Time Machine'
);

-- ALL
SELECT * FROM orders
WHERE order_amount <= ALL (
  SELECT order_amount
  FROM orders
  WHERE order_item = 'Time Machine'
);

-- SELECT INTO
SET SERVEROUTPUT ON;
DECLARE
  v_customer_name VARCHAR2(50);
  v_customer_city VARCHAR2(50);
BEGIN
  SELECT customer_name, customer_city
  INTO v_customer_name, v_customer_city
  FROM customers
  WHERE customer_id = 8;
  
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_customer_name || ', City: ' || v_customer_city);
END;
/

-- INSERT INTO SELECT
CREATE TABLE customers_iis (
  customer_id NUMBER(10) NOT NULL,
  customer_name VARCHAR2(50) NOT NULL,
  CONSTRAINT customers_iis_pk PRIMARY KEY (customer_id)
);

INSERT INTO customers_iis (customer_id, customer_name)
SELECT customer_id, customer_name
FROM customers
WHERE customer_id > 5;

-- The INNER JOIN keyword selects records that have matching values in both tables.

-- The LEFT JOIN keyword returns all records from the left table (customers), and the matching records from the right table (orders). The result is 0 records from the right side, if there is no match.

-- The RIGHT JOIN keyword returns all records from the right table (orders), and the matching records from the left table (customers). The result is 0 records from the left side, if there is no match.

-- The FULL OUTER JOIN keyword returns all records when there is a match in left (customers) or right (orders) table records.

-- A SELF JOIN is a regular join, but the table is joined with itself.

-- INNER JOIN
SELECT c.customer_id, o.order_id, c.customer_name, o.order_item
FROM customers c
INNER JOIN orders o
  ON c.customer_id = o.customer_id;

-- LEFT JOIN
SELECT c.customer_id, o.order_id, c.customer_name, o.order_item
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT c.customer_id, o.order_id, c.customer_name, o.order_item
FROM customers c
RIGHT JOIN orders o
  ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN
SELECT c.customer_id, o.order_id, c.customer_name, o.order_item
FROM customers c
FULL OUTER JOIN orders o
  ON c.customer_id = o.customer_id;

-- SELF JOIN
SELECT
  c1.customer_name AS customer_1,
  c2.customer_name AS customer_2,
  c1.customer_city
FROM customers c1
JOIN customers c2
  ON c1.customer_city = c2.customer_city
  WHERE c1.customer_id < c2.customer_id;

-- UNION  -- Combine rows & remove duplicates
SELECT customer_id
FROM customers
UNION
SELECT customer_id
FROM orders;

-- UNION ALL  -- Combine rows & keep duplicates
SELECT customer_id
FROM customers
UNION
SELECT customer_id
FROM orders;

-- CREATE VIEW
CREATE VIEW customer_view AS
  SELECT
    customer_name AS "Customer Name",
    customer_city AS "CUSTOMER CITY"
  FROM customers
  WHERE customer_id BETWEEN 7 AND 10;

SELECT * FROM customer_view;

-- CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW customer_view AS
  SELECT
    customer_name AS "Customer Name",
    customer_city AS "CUSTOMER CITY"
  FROM customers
  WHERE customer_city = 'Tokyo';

-- DROP VIEW
DROP VIEW customer_view;
