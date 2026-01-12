INSERT INTO table_name (column1,column2,column3) VALUES (val1,val2,val3);

INSERT INTO table_name VALUES (val1,val2,val3);

-- Populate one table using another table:
INSERT INTO table_name [column1,column2,column3,column4] 
SELECT [column1,column2,column3,column4] FROM table_name2 WHERE CONDITION