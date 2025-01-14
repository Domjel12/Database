--Exercise 7
--------------------------------------------------------------------------------------------
# 1. Try to DELETE a dataset of your zip table on ...
--------------------------------------------------------------------------------------------
	-- a. ... which you have a reference out of your table person.
    
DELETE FROM zip
WHERE ID = 2036;

	-- b. ... which you haven’t got a reference out of your table person.

DELETE FROM zip
WHERE ID = 97;

	-- What is happening and why?
		-- The first one is giving an error because we set on delete/update restrict, and since we are trying to delete
			-- a reference to the table person
		-- The second one is not giving an error since there is no reference to the person table
--------------------------------------------------------------------------------------------
# 2. Table gender
--------------------------------------------------------------------------------------------
	-- a. CREATE a new table with the following setting:
    
CREATE TABLE gender (
	id INT NOT NULL AUTO_INCREMENT,
    gender VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

	-- b. Add in your table the following two attrbutes

INSERT INTO gender (gender)
VALUES ('Mr.'), ('Mrs.');

UPDATE gender
SET id = 0
WHERE gender = 'Mr.';

UPDATE gender
SET id = 1
WHERE gender = 'Mrs.';

	-- Add now a constraint with the name fk_person2gender and
	-- set the gender as a FOREIGN KEY from the table person which REFERENCES to the id from gender.
    -- Please use RESTRICT for UPDATE & DELETE!

ALTER TABLE person
ADD CONSTRAINT fk_person2gender
FOREIGN KEY (gender)
REFERENCES gender(id)
	ON DELETE RESTRICT
    ON UPDATE CASCADE;
