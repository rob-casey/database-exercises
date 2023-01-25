USE albums_db;
SHOW tables;
-- How many rows are in the albums table? 
-- 31 rows were returned.
SELECT * FROM albums;
-- How many unique artist names are in the albums table?
-- 23 unique artist names were returned.
SELECT distinct artist FROM albums;

