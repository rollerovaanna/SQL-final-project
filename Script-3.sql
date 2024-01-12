--3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
-- pomocí vzorce vypočteme meziroční změnu ceny, a následně tuto změnu zprůměrujeme za celé sledované období a seřadíme od nejnižší hodnoty

SELECT
	f.price_category,
	AVG((f.avg_price - f1.avg_price ) / f1.avg_price) * 100 AS avg_price_growth
FROM t_Anna_Rollerova_project_SQL_1 AS f
JOIN t_Anna_Rollerova_project_SQL_1 AS f1
	ON f.price_category = f1.price_category  
	AND f.year = f1.year+1
GROUP BY price_category
ORDER BY avg_price_growth;
