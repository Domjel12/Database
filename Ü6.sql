-- Exercise 6
--------------------------------------------------------------------------------------------
1.	CREATE a table person with the following attributes and settings. 
--------------------------------------------------------------------------------------------
-- CREATE first the table with all his attributes and afterwords set the id as PRIMARY KEY.
CREATE TABLE person
(
	id INT NOT NULL AUTO_INCREMENT,
    gender INT NOT NULL,
    nnam VARCHAR(60) NOT NULL,
    fnam VARCHAR(60) NOT NULL,
    bdate TIMESTAMP NOT NULL DEFAULT '2014-01-01 06:30:00',
    zip_id INT,
    str VARCHAR(60) NOT NULL,
    tel VARCHAR(40) NOT NULL,
    mobil VARCHAR(40) NOT NULL,
    -- to use AUTO_INCREMENT as your KEY your nee to set the ID with an index
    index(id)
)
;

DESC person;
DESC zip;

-- Version 1
ALTER TABLE person
ADD CONSTRAINT pk_person
PRIMARY KEY (id)
;

-- Version 2
ALTER TABLE person 
MODIFY COLUMN id INT PRIMARY KEY AUTO_INCREMENT
;

-- Hiermit kann die Tabelle person auf WUNSCH gelöscht werden!
-- DROP TABLE person;
--------------------------------------------------------------------------------------------
2.	Add now a constraint with the name fk_person2plz and set the plz_id as a FOREIGN KEY from the table personwhich REFERENCES to the id from plz. Please use RESTRICT for UPDATE & DELETE!
--------------------------------------------------------------------------------------------

ALTER TABLE person
ADD CONSTRAINT fk_person_zip_id
FOREIGN KEY (zip_id)
REFERENCES zip (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT 
;


ALTER TABLE person
DROP FOREIGN KEY fk_person_zip_id
;
-- showing the table information
DESC person;

--------------------------------------------------------------------------------------------
3.	Add at least 10 datasets in your table person by using the INSERT INTO command inserting single datasets
--------------------------------------------------------------------------------------------
  
INSERT INTO person (gender, nnam, fnam, bdate, zip_id, str, tel, mobil)
-- 0 = Mrs. // 1 = Mr.
VALUES (0, 'Mueller', 'Julia', '2000-06-01 00:00:00', 10082, 'Musterstr. 12', '123456', '654321')
;

-- inserting a dataset -> the attribute order is different to the table order!!!
INSERT INTO person (nnam, fnam, zip_id, str, tel, mobil, gender)
-- 0 = Mrs. // 1 = Mr.
VALUES ('Mueller', 'Thomas', 10082, 'Musterstr. 12', '123456', '654321', 1)
;

DESC person;
-- inserting a dataset without using the attributenames
INSERT INTO person 
-- 0 = Mrs. // 1 = Mr.
VALUES (4, 0, 'Sabba', 'Salvatore', '1980-10-06 06:30:00', 10082, 'Bahnhofstr. 12', '123456', '654321')
;


-- inserting multiple datasets
INSERT INTO person (nnam, fnam, zip_id, str, tel, mobil, gender)
-- 0 = Mrs. // 1 = Mr.
VALUES 	('Rabb', 'Stefan', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Ivanov', 'Plamen', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Lösche', 'Colin', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Steinmer', 'Peter', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Angela', 'Merkel', 10082, 'Musterstr. 12', '123456', '654321', 1),        
		('Tina', 'Toni', 10082, 'Musterstr. 12', '123456', '654321', 1),        
		('Hook', 'Peter', 10082, 'Musterstr. 12', '123456', '654321', 1),        
		('Carey', 'Mariah', 10082, 'Musterstr. 12', '123456', '654321', 1),        
		('Caliskan', 'Nihat', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Jonas', 'Scheffner', 10082, 'Musterstr. 12', '123456', '654321', 1)
;

-- ADDITIONAL:
--	inserting a dataset by using SELECT for an attribute value
INSERT INTO person (nnam, fnam, zip_id, str, tel, mobil, gender)
-- 0 = Mrs. // 1 = Mr.
VALUES 	('Sabba', 'Carmine', (SELECT id FROM zip WHERE zip_code = '63128'), 'Musterstr. 12', '123456', '654321', 1)
;

-- Example Reference Integrity
SELECT max(id)
FROM zip
;

-- we try to insert a dataset with plz_id = 14957
INSERT INTO person 
-- 0 = Mrs. // 1 = Mr.
VALUES (4, 0, 'Sabba', 'Salvatore', '1980-10-06 06:30:00', 14958, 'Bahnhofstr. 12', '123456', '654321')
;
