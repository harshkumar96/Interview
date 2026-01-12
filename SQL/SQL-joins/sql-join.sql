-- INNER JOIN
-- The most frequently used and important of the joins is the INNER JOIN. They are also referred to as an EQUIJOIN.
SELECT table1.cloumn1, table1.cloumn2, table2.cloumn1 FROM table1 
INNER JOIN table2 ON table1.common_filed1 = table2.common_filed2;

-- LEFT JOIN
SELECT table1.cloumn1, table1.cloumn2, table2.cloumn1 FROM table1 
LEFT JOIN table2 ON table1.common_filed1 = table2.common_filed2;

-- RIGHT JOIN
SELECT table1.cloumn1, table1.cloumn2, table2.cloumn1 FROM table1
RIGHT JOIN ON table1.common_filed1 = table2.common_filed2;

-- FULL JOIN
SELECT table1.cloumn1, table2.cloumn2, table2.cloumn1 FROM table1 
FULL OUTER JOIN ON table1.common_filed1 = table2.common_filed2;

SELECT table1.cloumn1, table2.cloumn2, table2.cloumn1 FROM table1 
FULL JOIN ON table1.common_filed1 = table2.common_filed2;

-- SELF JOIN
SELECT table1.cloumn1, table1.cloumn2, table2.cloumn1 FROM table1, table2 
WHERE table1.common_filed1 = table2.common_filed2;

-- CARTESIAN JOIN OR CROSS JOIN
SELECT table1.cloumn1, table1.cloumn2, table2.cloumn1 FROM table1, table2 