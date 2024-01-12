--2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
--pro každý výrobek i rok vytvoříme vlastní script, kde vydělením průměrné mzdy průměrnou cenou dané potraviny v daném roce získáme množství, které lze zakoupit

SELECT
	price_category,
	AVG(avg_salary) / AVG(avg_price) AS amount_of_food,
	price_unit,
	year
FROM t_Anna_Rollerova_project_SQL_1 
WHERE year = 2006
	AND price_category LIKE '%mléko%'
GROUP BY price_category, avg_price, price_unit, year
ORDER BY price_category,year;

SELECT
	price_category,
	AVG(avg_salary)/AVG(avg_price) AS amount_of_food,
	price_unit,
	year
FROM t_Anna_Rollerova_project_SQL_1 
WHERE year = 2006
	AND price_category LIKE '%chléb%'
GROUP BY price_category, avg_price, price_unit, year
ORDER BY price_category,year;

SELECT
	price_category,
	AVG(avg_salary)/AVG(avg_price) AS amount_of_food,
	price_unit,
	year
FROM t_Anna_Rollerova_project_SQL_1 
WHERE year = 2018
	AND price_category LIKE '%mléko%'
GROUP BY price_category, avg_price, price_unit, year
ORDER BY price_category,year;

SELECT
	price_category,
	AVG(avg_salary)/AVG(avg_price) AS amount_of_food,
	price_unit,
	year
FROM t_Anna_Rollerova_project_SQL_1 
WHERE year = 2018
	AND price_category LIKE '%chléb%'
GROUP BY price_category, avg_price, price_unit, year
ORDER BY price_category,year;
