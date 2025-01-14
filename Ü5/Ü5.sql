-- Exercise 5
1.	Your colleague from the marketing team needs some analysis. 
/* a)	*/
SELECT left(zip_code, 2) AS ZIP_short, count(*) AS qty
FROM zip
WHERE 	city <> ''
    AND city IS NOT NULL
    -- with this code we remove the empty zip_code
    AND zip_code <> ' '
GROUP BY ZIP_short
;

-- with this code we can make a check
SELECT count(*)
FROM zip
WHERE zip_code LIKE '01%'
;

/* b.	Create an overview with all unique ort names with the qtys, how often you will find the ort in the plz table – ordered by the quantity descending		*/
SELECT city, COUNT(*) AS qty
FROM zip
GROUP BY city
ORDER BY qty DESC
;

/* c.	Create another overview (similar to b) where you get to see all ort which are only once in your table!		*/
SELECT city, COUNT(*) AS qty
FROM zip
GROUP BY city
HAVING qty = 1
;

/* d.	Your colleague saw in the last selection you gave him (Exercise 4.6) that there haven’t been any plz from Frankfurt am Main. 		*/
SELECT city, zip_code
FROM zip
WHERE city IN ('Frankfurt am Main', 'Aachen', 'Berlin')
;

-- look at all cities which start with Frankfurt
SELECT DISTINCT city
FROM zip
WHERE city LIKE 'Frankfurt%'
;

-- OR
SELECT city, zip_code
FROM zip
WHERE city IN ('Aachen', 'Berlin')
	OR city LIKE  'Frankfurt%'
;

/* e.	Show your colleague the TOP three cities (highest). TOP means – with the most plz		*/
select city, COUNT(*) as qty
from zip
group by city
order by qty desc
LIMIT 3
;
