


SELECT DISTINCT 
	y.year,
	(AVG(y.avg_salary) - AVG(y1.avg_salary)) / AVG(y1.avg_salary) * 100 AS salary_growth,
	(AVG(y.avg_price) - AVG(y1.avg_price)) / AVG(y1.avg_price) * 100 AS price_growth,
	(AVG(y.avg_price) - AVG(y1.avg_price)) / AVG(y1.avg_price) * 100 - (AVG(y.avg_salary) - AVG(y1.avg_salary)) / AVG(y1.avg_salary) * 100 AS difference
FROM t_Anna_Rollerova_project_SQL_1 AS y
JOIN t_Anna_Rollerova_project_SQL_1 AS y1
	ON y.year = y1.year + 1
GROUP BY y.year
ORDER BY y.year ASC;
