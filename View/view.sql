use classicmodels;

CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone FROM customers;

SELECT * FROM customer_views;

CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

SELECT * FROM customer_views;

DROP VIEW customer_views;