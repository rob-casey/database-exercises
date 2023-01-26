USE albums_db;

SHOW tables;
-- Can use DESCRIBE or EXPLAIN to EXPLORE THE STRUCTURE
-- Can get an example/sample with LIMIT (SELECT * FROM albums LIMIT 5)
-- Report Takeaways since asked to EXPLORE: artist, name, released date stored as an int, sales in ambiguous unit
-- Each unique listing by PK id can have multiple genres

-- (Q) How many rows are in the albums table? 
SELECT * FROM albums;
-- (a) 31 rows were returned.

-- (Q) How many unique artist names are in the albums table?
SELECT DISTINCT artist FROM albums;
-- (a) 23 unique artist names were returned.

-- (Q) What is the primary key for the albums table?
SHOW INDEX FROM albums_db.albums WHERE key_name = 'PRIMARY';
-- (a) The primary key for the albums table is id.
-- (ia) DESCRIBE albums; displayed with id

-- (Q) What is the oldest release date for any album in the albums table? 
SELECT * FROM albums;
-- (a) 1967 is the oldest release date for any album listed in album.
-- (ia) Ways to solve: (min() function, ORDER BY, GUI Sort*)

-- (Q) What is the most recent release date?
-- (a) 2011 is the most recent release date [I sorted within my results]
-- (ia) SELECT max(release_date) FROM albums;
-- (Dionne) SELECT min(release_date), max(release_date) FROM albums;

/* (Q) Write queries to find the following information:
a. The name of all albums by Pink Floyd
b. The year Sgt. Pepper's Lonely Hearts Club Band was released
c. The genre for the album Nevermind
d. Which albums were released in the 1990s
e. Which albums had less than 20 million certified sales
f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
*/
-- (a)
SELECT 'Pink Floyd', name FROM albums;
-- (ia) SELECT * FROM albums WHERE artist= 'Pink Floyd';

-- (b)
SELECT release_date FROM albums WHERE id = 15;
-- (ia) SELECT release_date FROM albums WHERE name = "Sgt.." <- break's Madeleines heart </3
-- (ia2) Escape Char -> \ with single apostrophe

-- (c)
SELECT genre FROM albums WHERE id = 28;
-- (ia) SELECT genre FROM albums WHERE name = 'Nevermind';

-- (d)
SELECT id, name, release_date FROM albums WHERE release_date > 1990;
-- (ia) SELECT * FROM albums WHERE released_date BETWEEN 1990 AND 1999

-- (e)
SELECT id, name, sales FROM albums WHERE sales < 20.0;
-- (ia) 

-- (f) 
SELECT id, name, genre FROM albums WHERE genre = 'rock';
-- (ia) "string literal";
-- (ia2) Use LIKE + %
/* (g) Query results do not include albums with a genre of "hard Rock or "Progressive Rock" 
because we specified ONLY "rock', and a query that INCLUDES rock.*/








