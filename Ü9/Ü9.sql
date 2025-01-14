--------------------------------------------------------------------------------------------
# 1. Please use the JOIN Operator for the following requests:
--------------------------------------------------------------------------------------------
	-- a. Select the attributes plz and ort of the table plz, which are used in your table person!

SELECT City, zip_code AS ZIP
FROM person p, zip z
WHERE p.zip_id = z.ID;

SELECT City, zip_code AS ZIP
FROM person p
INNER JOIN zip z ON p.zip_id = z.ID;

    -- b. Select the attributes plz and ort of the table plz, which are not used in your table person!

SELECT DISTINCT zip_code AS ZIP, City
FROM zip
LEFT JOIN person ON person.zip_id = zip.ID
WHERE person.zip_id IS NULL;

    -- c. Select all attributes of the table person with the attribute ort of the table plz!

SELECT zip.City, person.*
FROM person
INNER JOIN zip ON person.zip_id = zip.ID;
	-- a. Select the attributes plz and ort of the table plz, which are used in your table person!

SELECT City, zip_code AS ZIP
FROM person p, zip z
WHERE p.zip_id = z.ID;

SELECT City, zip_code AS ZIP
FROM person p
INNER JOIN zip z ON p.zip_id = z.ID;

    -- b. Select the attributes plz and ort of the table plz, which are not used in your table person!

SELECT DISTINCT zip_code AS ZIP, City
FROM zip
LEFT JOIN person ON person.zip_id = zip.ID
WHERE person.zip_id IS NULL;

    -- c. Select all attributes of the table person with the attribute ort of the table plz!

SELECT zip.City, person.*
FROM person
INNER JOIN zip ON person.zip_id = zip.ID;
