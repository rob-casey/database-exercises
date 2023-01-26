USE albums_db;
-- (Q) How many rows are in the albums table? 
SHOW tables;
SELECT * FROM albums;
-- (a) 31 rows were returned.
-- (Q) How many unique artist names are in the albums table?
SELECT distinct artist FROM albums;
-- (a) 23 unique artist names were returned.
-- (Q) What is the primary key for the albums table?
SHOW INDEX FROM albums_db.albums WHERE key_name = 'PRIMARY';
-- (a) The primary key for the albums table is id.
-- (Q) What is the oldest release date for any album in the albums table? 
SELECT * FROM albums;
-- (a) 1967 is the oldest release date for any album listed in album.
-- (Q) What is the most recent release date?
-- (a) 2011 is the most recent release date
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
-- (b)
SELECT release_date FROM albums WHERE id = 15;
-- (c)
SELECT genre FROM albums WHERE id = 28;
-- (d)
SELECT id, name, release_date FROM albums WHERE release_date > 1990;
-- (e)
SELECT id, name, sales FROM albums WHERE sales < 20.0;
-- (f) 
SELECT id, name, genre FROM albums WHERE genre = 'rock';
/* (g) Query results do not include albums with a genre of "hard Rock or "Progressive Rock" 
because we specified ONLY "rock', and a query that INCLUDES rock.*/








