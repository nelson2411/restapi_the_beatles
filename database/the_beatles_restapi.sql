-- Active: 1702114741596@@127.0.0.1@3306
CREATE DATABASE the_beatles_restapi
    DEFAULT CHARACTER SET = 'utf8mb4';

USE the_beatles_restapi;

CREATE TABLE studio_albums (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  length VARCHAR(20),
  releasedDate DATE NOT NULL,
  numberOfTracks INT,
  tracks JSON,
  UNIQUE KEY unique_title (title)
);

ALTER TABLE studio_albums 
DROP COLUMN tracks;

CREATE TABLE compilation_albums (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  length VARCHAR(20),
  releasedDate DATE,
  numberOfTracks INT,
  tracks JSON,
  singles TEXT,
  UNIQUE KEY unique_title (title)
);

ALTER TABLE compilation_albums
DROP COLUMN tracks;

ALTER TABLE compilation_albums
DROP COLUMN singles;

/*
Please add a label field to the studio albums table.
*/

ALTER TABLE studio_albums
ADD COLUMN label VARCHAR(255);

CREATE TABLE live_albums (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  length VARCHAR(20),
  location VARCHAR(255),
  date DATE,
  country VARCHAR(50),
  tracks JSON
);

ALTER TABLE live_albums
DROP COLUMN tracks;

CREATE TABLE songs (
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  length VARCHAR(20),
  authors JSON,
  album_id INT,
  FOREIGN KEY (album_id) REFERENCES studio_albums(album_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (album_id) REFERENCES compilation_albums(album_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/*
The title filed must be add and place at the beginning of the table.
*/
ALTER TABLE songs
ADD COLUMN title VARCHAR(255) NOT NULL FIRST;

-- move song_id to the first position
ALTER TABLE songs
MODIFY COLUMN song_id INT AUTO_INCREMENT FIRST;

INSERT INTO songs (title, length, authors, album_id)
VALUES('I Saw Her Standing There', '2:55', '["Paul McCartney", "John Lennon"]', 1),
      ('Misery', '1:49', '["Paul McCartney", "John Lennon"]', 1),
      ('Anna', '3:00', '["Arthur Alexander"]', 1),
      ('Chains', '2:23', '["Gerry Goffin", "Carole King"]', 1),
      ('Boys', '2:27', '["Luther Dixon", "Wes Farrell"]', 1),
      ('Ask Me Why', '2:26', '["Paul McCartney", "John Lennon"]', 1),
      ('Please Please Me', '2:00', '["Paul McCartney", "John Lennon"]', 1),
      ('Love Me Do', '2:22', '["Paul McCartney", "John Lennon"]', 1),
      ('P.S. I Love You', '2:05', '["Paul McCartney", "John Lennon"]', 1),
      ('Baby It''s You', '2:40', '["Burt Bacharach", "Mack David", "Barney Williams"]', 1),
      ('Do You Want to Know a Secret', '1:59', '["Paul McCartney", "John Lennon"]', 1),
      ('A Taste of Honey', '2:05', '["Bobby Scott", "Ric Marlow"]', 1),
      ('There''s a Place', '1:52', '["Paul McCartney", "John Lennon"]', 1),
      ('Twist and Shout', '2:33', '["Phil Medley", "Bert Russell"]', 1);

-- With The Beatles tracks
INSERT INTO songs (title, length, authors, album_id)
VALUES('It Won''t Be Long', '2:13', '["Paul McCartney", "John Lennon"]', 2),
      ('All I''ve Got to Do', '2:03', '["Paul McCartney", "John Lennon"]', 2),
      ('All My Loving', '2:08', '["Paul McCartney", "John Lennon"]', 2),
      ('Don''t Bother Me', '2:29', '["George Harrison"]', 2),
      ('Little Child', '1:46', '["Paul McCartney", "John Lennon"]', 2),
      ('Till There Was You', '2:14', '["Meredith Willson"]', 2),
      ('Please Mister Postman', '2:34', '["Georgia Dobbins", "William Garrett", "Freddie Gorman", "Brian Holland", "Robert Bateman"]', 2),
      ('Roll Over Beethoven', '2:45', '["Chuck Berry"]', 2),
      ('Hold Me Tight', '2:32', '["Paul McCartney", "John Lennon"]', 2),
      ('You Really Got a Hold on Me', '3:01', '["Smokey Robinson"]', 2),
      ('I Wanna Be Your Man', '1:59', '["Paul McCartney", "John Lennon"]', 2),
      ('Devil in Her Heart', '2:27', '["Richard Drapkin"]', 2),
      ('Not a Second Time', '2:07', '["Paul McCartney", "John Lennon"]', 2),
      ('Money (That''s What I Want)', '2:47', '["Janie Bradford", "Berry Gordy"]', 2);

USE the_beatles_restapi;   

SELECT * FROM songs;

SELECT * FROM songs WHERE song_id = 1;