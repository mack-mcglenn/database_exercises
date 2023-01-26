USE albums_db;
SHOW tables;
DESCRIBE albums;
/* Explore the structure of the albums table.
a. How many rows are in the albums table?
6: id, artist, name, release_date, sales, genre
b. How many unique artist names are in the albums table?*/
SELECT artist FROM albums; -- 31
/*c. What is the primary key for the albums table? */
DESCRIBE albums; -- id
/* What is the oldest release date for any album in the albums table? 1967
What is the most recent release date? 2011*/
SELECT release_date FROM albums;
SELECT * FROM albums WHERE release_date;
SELECT MIN(release_date) FROM albums;
SELECT MAX(release_date) FROM albums;
-- Write queries to find the following information:
-- a. The name of all albums by Pink Floyd A: "The Dark Side of the MOON" and "The Wall"
DESCRIBE albums;
SELECT * FROM albums;
SELECT name FROM albums WHERE artist = 'Pink Floyd';
-- b. The year Sgt. Peppers Lonely Hearts Club Band was released a: 1967
SELECT * FROM albums;
SELECT release_date FROM albums WHERE name LIKE '%Pepper%';
-- c. The genre for the album Nevermind A: Grunge, Alternative rock
SELECT * FROM albums;
SELECT genre FROM albums WHERE name = 'Nevermind';
-- d. Which albums were released in the 1990s A: The Immaculate Collection
SELECT name FROM albums WHERE release_date = 1990;
/* e. Which albums had less than 20 million certified sales?
A: Grease: The Original Soundtrack, Bad, Sgt. Pepper's Lonely Hearts Club Band,
Dirty Dancing, Let's Talk About Love, Dangerous, The Immaculate Collection, Abbey Road,
Born in the U.S.A., Brothers in Arms, Titanic: Music from the Motion Picture, Nevermind, The Wall */ 
SELECT name FROM albums WHERE sales < 20;
/* f. All the albums with a genre of "Rock".  A: Sgt. Pepper's.., 1, Abbey Road, Born in the U.S.A., Supernatural
Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
A: Because i DIDN'T SET MY sql PARAMETERS TO INCLUDE THOSE GENRES */
SELECT name FROM albums WHERE genre = 'Rock';