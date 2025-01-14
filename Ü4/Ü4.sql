Exercise 4
--------------------------------------------------------------------------------------------
1.
--------------------------------------------------------------------------------------------
/* a) */
SELECT * FROM zip;

DESC zip;
-- With DESC you can see all relevant information of a table

SELECT count(*) AS 'total cloumns'
FROM information_schema.columns
WHERE table_name = 'zip' AND table_schema = 'db_ws_21';
-- looking at the metadata

/* b)	How many datasets do you have? */

SELECT COUNT(*)
FROM zip;

SELECT MAX(id)
FROM zip;
-- works not always ... because some datasets can be deleted

--------------------------------------------------------------------------------------------
2.	Select for your colleague from the states all zip and city from zip. The new table should in this format:
--------------------------------------------------------------------------------------------
-- /* In ZIP he wants the zip and in city the city values! */
SELECT zip_code AS ZIP, CITY
FROM zip;

--------------------------------------------------------------------------------------------
3.	Please do the following selection:
--------------------------------------------------------------------------------------------
/* a.	Select all unique city from zip */
SELECT DISTINCT city
FROM zip
ORDER BY city;

/* b.	Select all unique city from zip scitying by zip ascending */
SELECT DISTINCT city
FROM zip
ORDER BY zip_code;

/* c.	Select all unique city from zip scitying by city descending */
SELECT DISTINCT city
FROM zip
ORDER BY city DESC;
--------------------------------------------------------------------------------------------
4.	How many unique cities do we have, which start with “BE…”
--------------------------------------------------------------------------------------------
SELECT count(DISTINCT city) AS qty
FROM zip
WHERE city LIKE 'BE%'
;

SELECT count(city) AS qty_total, count(DISTINCT city) AS qty
FROM zip
WHERE city LIKE 'BE%'
;
-- this is an additional solution, where you can see how many datasets we have in total and how many unique!

--------------------------------------------------------------------------------------------
5.	Select all cities where the zip is between 60000 AND 91234.
--------------------------------------------------------------------------------------------
/* a.	Use once the operator BETWEEN */
SELECT DISTINCT city
FROM zip
WHERE zip_code BETWEEN '60000' AND '91234'
ORDER BY zip_code
;

/* b.	and create a new query by using another operator */
SELECT DISTINCT city
FROM zip
WHERE zip_code >= '60000' AND zip_code <= '91234'
ORDER BY zip_code
;

--------------------------------------------------------------------------------------------
6.	Select all zip (by using the IN operator) from the following cities: Berlin - Frankfurt - Aachen
--------------------------------------------------------------------------------------------

SELECT zip_code, city
FROM zip
WHERE city IN ('Berlin', 'Frankfurt', 'Aachen')
;

--------------------------------------------------------------------------------------------
7.	Select all 4 digits unique cities from zip where are in this format:  B**N 
--------------------------------------------------------------------------------------------

SELECT DISTINCT city
FROM zip
WHERE city LIKE 'B__N'
;

SELECT DISTINCT city
FROM zip
WHERE city LIKE 'B%N'
	AND length(city) = 4
;
-- Additional solution by counting the length of the city
--------------------------------------------------------------------------------------------
8.	Execute the following queries:
--------------------------------------------------------------------------------------------
/* a.	SELECT * FROM zip WHERE city LIKE 'B__N' AND zip < '30000' OR city = 'Dietzenbach'; */
SELECT * FROM zip WHERE city LIKE 'B__N' AND zip_code < '30000' OR city = 'Dietzenbach'; 
/* b.	SELECT * FROM zip WHERE city LIKE 'B__N' AND (zip < '30000' OR city = 'Dietzenbach'); */
SELECT * FROM zip WHERE city LIKE 'B__N' AND (zip_code < '30000' OR city = 'Dietzenbach');

-- working with brackets = different solutions - due to the PRIO of operations (OR/AND/NOT)!

-- #############################################################
