--Query del Ejercicio #1 (R/ Tabla principal customer_shopping con 99,457 filas)
SELECT *
FROM customer_shopping;

--Query del Ejercicio #2 (R/ 251,505,794.25 Liras Turcas (8,800,351.22 USD))
SELECT SUM(quantity * price)
FROM customer_shopping;

--Query del Ejercicio #3 (R/ Menor fecha (2021-01-01) y Mayor fecha (2023-03-08))
SELECT MIN(invoice_date) AS first_date, 
	   MAX(invoice_date) AS last_date
FROM customer_shopping;

--Query del Ejercicio #4 
SELECT invoice_date, invoice_no, customer_id, shopping_mall
FROM customer_shopping cs
JOIN categories c ON cs.category_id = c.category_id
JOIN genders g ON cs.gender_id = g.gender_id
JOIN payment_methods pm ON cs.payment_method_id = pm.pmt_method_id	
JOIN shopping_malls sm ON cs.shopping_mall_id = sm.shopping_mall_id
WHERE EXTRACT( YEAR FROM invoice_date) IN (2021,2022)
AND district IN ('Levent','Besiktas')
AND gender = 'Female'
AND age BETWEEN 18 AND 25
AND category IN ('Clothing', 'Shoes','Cosmetics')
AND payment_method IN ('Credit Card','Debit Card')
AND (quantity * price) >= 10000.00
ORDER BY invoice_date;

--Query del Ejercicio #5
SELECT 
	EXTRACT(YEAR FROM invoice_date) AS anho, EXTRACT(MONTH FROM invoice_date) AS mes, 
	SUM(quantity) AS total_unidades_vendidas, COUNT(invoice_no) AS conteo_transacciones, SUM(quantity * price) AS total_ventas
FROM customer_shopping cs
GROUP BY anho, mes
ORDER BY anho, mes;

--Query del Ejercicio #6
SELECT shopping_mall, SUM(quantity * price) AS total_ventas
FROM customer_shopping cs
JOIN shopping_malls sm ON cs.shopping_mall_id = sm.shopping_mall_id
GROUP BY shopping_mall
ORDER BY shopping_mall;

--Query del Ejercicio #7
SELECT age, gender, SUM(quantity * price) AS total_ventas
FROM customer_shopping cs
JOIN genders g ON cs.gender_id = g.gender_id
GROUP BY age, gender
ORDER BY age, gender;

--Query del Ejercicio #8
SELECT EXTRACT(YEAR FROM invoice_date) AS anho, 
   EXTRACT(MONTH FROM invoice_date) AS mes, 
	   AVG(price) AS precio_promedio
FROM customer_shopping cs
GROUP BY anho, mes
ORDER BY anho, mes;

--Query del Ejercicio #9
SELECT EXTRACT(YEAR FROM invoice_date) AS anho, 
   EXTRACT(MONTH FROM invoice_date) AS mes, 
   AVG(quantity * price) AS factura_promedio
FROM customer_shopping cs
GROUP BY anho, mes
ORDER BY anho, mes;

--Query del Ejercicio #10
SELECT invoice_date, category, shopping_mall, district, payment_method,
   age, gender, (quantity*price) AS total_sale 
FROM customer_shopping cs
JOIN categories c ON cs.category_id = c.category_id
JOIN shopping_malls sm ON cs.shopping_mall_id = sm.shopping_mall_id
JOIN payment_methods pm ON cs.payment_method_id = pm.pmt_method_id	
JOIN genders g ON cs.gender_id = g.gender_id
ORDER BY invoice_date;

--Query de la Parte II
SELECT invoice_no, invoice_date, shopping_mall, district, customer_id, gender, age, category, payment_method, quantity, price
FROM customer_shopping cs
JOIN shopping_malls sm ON cs.shopping_mall_id = sm.shopping_mall_id
JOIN genders g ON cs.gender_id = g.gender_id
JOIN categories c ON cs.category_id = c.category_id
JOIN payment_methods pm ON cs.payment_method_id = pm.pmt_method_id;

