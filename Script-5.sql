--5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, 
projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
--Pomocí vzorce vypočteme meziroční změnu mezd, cen potravin a vývoj HDP v ČR. Ze získaných dat ovšem nelze jednoznačně prokázat vliv HDP na nárůst mezd a cen v dalším roce.

SELECT
	g.year,
	(AVG(g.avg_salary) - AVG(g1.avg_salary)) / AVG(g1.avg_salary) * 100 AS salary_growth,
	(AVG(g.avg_price) - AVG(g1.avg_price)) / AVG(g1.avg_price) * 100 AS price_growth,
	(g.gdp  - g1.gdp) / g1.gdp * 100 AS gdp_growth
FROM t_Anna_Rollerova_project_SQL_1 AS g
JOIN t_Anna_Rollerova_project_SQL_1 AS g1
	ON g.year = g1.year +1
GROUP BY g.year
ORDER BY g.year ASC;
