-- (1) Use the albums_db database.

USE albums_db;

-- (2) What is the primary key for the albums table?

SHOW CREATE TABLE albums;

/* The 'id' column is the primary key for the albums table

'CREATE TABLE `albums` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `artist` varchar(240) DEFAULT NULL,
  `name` varchar(240) NOT NULL,
  `release_date` int DEFAULT NULL,
  `sales` float DEFAULT NULL,
  `genre` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1'
*/

-- (3) What does the column named 'name' represent?

DESCRIBE albums;

-- The column named 'name; represents an Artist's stage name.

-- (4) What do you think the sales column represents?

DESCRIBE albums;

-- The sales column represents total sales of an album.

-- (5) Find the name of all albums by Pink Floyd.

SELECT name as Album, Artist
FROM albums
WHERE artist = 'Pink Floyd';

-- (6) What is the year Sgt. Pepper's Lonely Hearts Club Band was released?

SELECT release_date 
FROM albums
WHERE artist = 'The Beatles' and name LIKE 'SGT%';

-- (7) What is the genre for the album Nevermind?

SELECT genre 
FROM albums
WHERE name = 'Nevermind';

-- (8) Which albums were released in the 1990s?

SELECT name, release_date
FROM albums
WHERE release_date LIKE '199%';

-- (9) Which albums had less than 20 million certified sales?

SELECT name, sales
FROM albums
WHERE sales < 20.0;

