-- SQL SELECT Statement:
SELECT column1, column2, column3, column4 FROM table_name;

-- SQL DISTINCT Clause:
SELECT DISTINCT column1, column2, column3, column4 FROM table_name;

-- SQL WHERE Clause:
SELECT column1, column2, column3, column4 FROM table_name WHERE condition;

-- SQL AND/OR Clause:
SELECT column1, column2, column3, column4 FROM table_name WHERE condition1 (AND | OR) condition2;

-- SQL IN Clause:
SELECT column1, column2, column3, column4 FROM table_name WHERE column_name IN (val1, val2, val3, val4);

-- SQL BETWEEN Clause:
SELECT column1, column2, column3, column4 FROM table_name WHERE column_name BETWEEN val1 AND val2;

-- SQL LIKE Clause:
SELECT column1, column2, column3, column4 FROM table_name WHERE column_name LIKE { PATTERN };

-- SQL ORDER BY Clause:
SELECT column1, column2, column3, column4 FROM table_name WHERE CONDITION ORDER BY (ASC | DESC);

-- SQL GROUP BY Clause:
SELECT SUM(column_name) FROM table_name WHERE CONDITION GROUP BY column_name;

-- SQL COUNT Clause:
SELECT COUNT(column_name) FROM table_name WHERE CONDITION;

-- SQL HAVING Clause:
SELECT SUM(column_name) FROM table_name WHERE CONDITION GROUP BY column_name HAVING (arithematic function condition);

-- SQL DROP TABLE Statement:
DROP TABLE table_name;

-- SQL CREATE INDEX Statement:
CREATE UNIQUE INDEX index_name ON table_name (column1,column2,column3);

-- SQL DROP INDEX Statement:
ALTER TABLE table_name DROP INDEX index_name;

-- SQL DESCRIBE Statement:
DESC table_name;

-- SQL TRUNCATE TABLE Statement:
TRUNCATE TABLE table_name;

-- SQL ALTER TABLE Statement (Rename):
ALTER TABLE table_name RENAME TO table_name_new

-- SQL INSERT INTO Statement:
INSERT INTO table_name (column1,column2,column3,column4) VALUES (val1,val2,val3,val4);

-- SQL UPDATE Statement:
UPDATE table_name SET column1 = val1, column2=val2, column3=val3 WHERE condition;

-- SQL DELETE Statement:
DELETE FROM table_name WHERE condition;

-- SQL CREATE DATABASE Statement:
CREATE DATABASE database_name;

-- SQL USE Statement:
USE DATABASE database_name;

-- SQL COMMIT Statement:
COMMIT;

-- SQL ROLLBACK Statement:
ROLLBACK;
