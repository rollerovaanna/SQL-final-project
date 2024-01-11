--1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? 
--pomocí vzorce vypočteme procentuální mneziroční změnu mezd a klauzulí WHERE omezíme výsledek na hodnoty menší než 0
SELECT
	p.year, 
	p.industry_branch,
	(p.avg_salary - p1.avg_salary) / p1.avg_salary * 100 AS payroll_change
FROM t_Anna_Rollerova_project_SQL_1 AS p
JOIN t_Anna_Rollerova_project_SQL_1 AS p1
	ON p.industry_branch = p1.industry_branch 
	AND p.year = p1.year+1
	WHERE (p.avg_salary - p1.avg_salary) / p1.avg_salary * 100 < 0
	GROUP BY industry_branch, year
	ORDER BY industry_branch ASC;
