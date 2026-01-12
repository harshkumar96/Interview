SELECT COUNT(*) FROM employee_tbl;

SELECT MAX(daily_typing_pages) FROM employee_tbl;
SELECT id, name, MAX(daily_typing_pages) FROM employee_tbl GROUP BY name;

SELECT MIN(daily_typing_pages) least, MAX(daily_typing_pages) max FROM employee_tbl;
SELECT id, name, work_date, MIN(daily_typing_pages) FROM employee_tbl GROUP BY name;

SELECT AVG(daily_typing_pages) FROM employee_tbl;
SELECT name, AVG(daily_typing_pages) FROM employee_tbl GROUP BY name;

SELECT SUM(daily_typing_pages) FROM employee_tbl;
SELECT name, SUM(daily_typing_pages) FROM employee_tbl GROUP BY name;

SELECT name, SQRT(daily_typing_pages) FROM employee_tbl;

SELECT CONCAT(id, name, work_date) FROM employee_tbl;

SELECT * FROM employee_tbl ORDER BY RAND();

SELECT ASCII('2');

SELECT CHAR(77,121,83,81,'76');

SELECT CHAR_LENGTH("text");

SELECT CONCAT('My', 'S', 'QL');

SELECT CONCAT_WS(',','First name','Last Name' );

SELECT CONV('a',16,2);

SELECT LEFT('foobarbar', 5);

SELECT LOCATE('bar', 'foobarbar');

SELECT LOWER('QUADRATICALLY');

SELECT 'ABCDE' REGEXP '.*';

SELECT REPLACE('www.mysql.com', 'w', 'Ww');

SELECT REVERSE('abcd');

SELECT RIGHT('foobarbar', 4);

SELECT SUBSTRING('Quadratically',5);
SELECT SUBSTRING('foobarbar' FROM 4);
SELECT SUBSTRING('Quadratically',5,6);

SELECT SUBSTRING_INDEX('www.mysql.com', '.', 2);

SELECT TRIM(' bar  ');
SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx');
SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx');
SELECT TRIM(TRAILING 'xyz' FROM 'barxxyz');

SELECT UPPER('Allah-hus-samad');