--vytvoření pomocné tabulky pro mzdy
CREATE OR REPLACE TABLE primary_table_payroll AS
SELECT 
	cp.payroll_year AS year,	
	cpib.name AS industry_branch,
	AVG(cp.value) AS avg_salary
FROM czechia_payroll AS cp 
JOIN czechia_payroll_industry_branch AS cpib 
	ON cp.industry_branch_code = cpib.code 
	AND cp.value_type_code = 5958 
GROUP BY cpib.name, cp.payroll_year;

--vytvoření pomocné tabulky pro ceny potravin
CREATE OR REPLACE TABLE primary_table_price AS
SELECT 
	YEAR(cpr.date_from) AS price_year,
	cprc.name AS price_category,
	cprc.price_unit AS price_unit,
	AVG(cpr.value) AS avg_price
FROM czechia_price AS cpr 
JOIN czechia_price_category AS cprc 	
	ON cpr.category_code = cprc.code 
GROUP BY cprc.name, YEAR(cpr.date_from);

--vytvoření pomocné tabulky pro HDP ČR
CREATE OR REPLACE TABLE primary_table_gdp_cz AS 
SELECT 
		economies.gdp,
		economies.year AS gdp_year
FROM economies
WHERE country = 'Czech Republic';

--spojení tří pomocných tabulek do jedné a vytvoření primární tabulky
CREATE OR REPLACE TABLE t_Anna_Rollerova_project_SQL_1 AS
SELECT *
FROM primary_table_payroll AS payroll
	JOIN primary_table_price AS price
	ON payroll.year = price.price_year
	JOIN primary_table_gdp_cz AS gdp
	ON gdp.gdp_year = price.price_year;
