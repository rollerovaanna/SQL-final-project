<b>Tyto datové podklady porovnání byly vypracovány na základě volně dostupných dat pocházejících z Portálu otevřených dat ČR  za účelem zodpovězení výzkumných otázek uvedených níže. Zabývají se cenami základních potravin, průměrnými mzdami v různých odvětvích a HDP v letech 2006 - 2018. Všechny obsažené SQL skripty byly vytvořeny v relační databázi MariaDB pomocí programu DBeaver. Projekt vznikl jako samostatná práce v rámci absolvování Datové akademie Engeto.
 
Výzkumné otázky</b>
- [ ] Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
- [ ] Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
- [ ] Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
- [ ] Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
- [ ] Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

<b>Vstupní data (tabulky), ze kterých bylo vycházeno</b>
- [ ] czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období.
- [ ] czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
- [ ] czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
- [ ] czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
- [ ] czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
- [ ] czechia_price – Informace o cenách vybraných potravin za několikaleté období. 
- [ ] czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.
- [ ] czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
- [ ] czechia_district – Číselník okresů České republiky dle normy LAU.
- [ ] economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

Ze vstupních dat byla nejprve vytvořena primární tabulka t_Anna_Rollerova_project_SQL_1, ze které bylo možné poté vycházet při formulování skriptů, které mi pomohly zodpovědět výzkumné otázky. Primární tabulka byla vytvořena spojením tří pomocných tabulek, ve kterých jsem extrahovala pouze potřebná data ze vstupních tabulek:

- [ ] primary_table_payroll, která obsahuje údaje o mzdách v různých odvětvích v průběhu let
- [ ] primary_table_price, kde je uveden vývoj cen základních potravin v průběhu let
- [ ] primary_table_gdp_cz, která shrnuje hodnotu HDP České republiky v průběhu let

<b>1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? </b>

Pouhým porovnáním hodnot mezd v období 2006 - 2018 můžeme zjistit, že ve všech zkoumaných odvětvích mzdy vzrostly. Mým cílem bylo ale zjistit, zda v některých odvětvích došlo v průběhu let i k poklesu hrubé mzdy. Proto jsem ve skriptu č.1 nechala vypsat v procentech meziroční změnu mzdy oproti předchozímu roku, a klauzulí WHERE jsem omezila výsledek na hodnoty menší než 0 - tedy kde došlo k poklesu mezd. Z výsledků vyplývá, že k meziročnímu poklesu došlo u nejvíce oborů v roce 2013, ale jednalo se vždy pouze o pokles v řádu jednotek procent. Největší pokles nastal v roce 2013 v odvětví Peněžnictví a pojišťovnictví, kdy došlo k poklesu o 8,9 %.


<img width="768" alt="Snímek obrazovky 2024-01-03 v 15 18 56" src="https://github.com/rollerovaanna/SQL-final-project/assets/140256120/f5476c3a-dc0b-4db8-8f88-4a37aba81ead">






<b>2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?</b>

Pro každý produkt i rok jsem vytvořila skript, ve kterém jsem vydělila průměrnou mzdu cenou mléka/chleba a tím získala množství, které lze za průměrnou mzdu zakoupit. V roce 2006 bylo možné si za průměrnou mzdu koupit 1437 l mléka nebo 1287 kg chleba. V roce 2018 to pak bylo 1641 l mléka nebo 1342 kg chleba.

<b>3.  Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?</b>

Pro odpověď na tuto otázku jsem pomocí skriptu vypočítala meziroční změnu ceny, a následně jsem tuto změnu zprůměrovala za celé sledované období a seřadila od nejnižší hodnoty. Nejpomaleji stoupá cena cena krystalového cukru, u kterého je průměrná meziroční změna - 1,9 %, tedy dokonce každý rok zhruba o dvě procenta zlevňuje.



<img width="461" alt="Snímek obrazovky 2024-01-03 v 16 48 13" src="https://github.com/rollerovaanna/SQL-final-project/assets/140256120/fd9a084e-8961-4477-be95-34ceb846d638">






<b>4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?</b>

V tomto dotazu jsem pro každý rok nejprve vypočetla průměrný růst mezd a průměrný růst cen a následně jsem vypočetla rozdíl mezi těmito hodnotami. V žádném roce ale nebyl rozdíl mezi cenami a platy větší než 10 %. V některých letech byl sice růst cen v daném roce vyšší než růst mezd, ale nikdy ne nad 10 %.


<img width="582" alt="Snímek obrazovky 2024-01-03 v 17 07 43" src="https://github.com/rollerovaanna/SQL-final-project/assets/140256120/70a8811f-8473-414e-a2de-a8e86ddeada0">





<b>5.  Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?</b>

Pro tento skript jsem v dotazu vypočetla průměrný růst mezd, cen potravin a vývoj HDP v ČR. Ze získaných dat ovšem nelze jednoznačně prokázat vliv HDP na nárůst mezd a cen v dalším roce. Například v po prudším nárůstu HDP v roce 2007 následoval i vyšší nárůst cen i mezd v následujícím roce. Při propadu HDP v roce 2009 pak další rok mzdy i ceny poměrně stagnovaly. V roce 2017 ale došlo k extrémnímu růstu jen o 9,6 %, přitom HDP ani mzdy výraznější změnu neprodělaly. Na určování cen potravin a výši mezd se ovšem kromě HDP podílí i mnoho jiných faktorů.

<img width="594" alt="Snímek obrazovky 2024-01-04 v 13 13 34" src="https://github.com/rollerovaanna/SQL-final-project/assets/140256120/0b06b4e2-d4f6-4c76-b87d-8f61740c02f2">



