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

-- check if the table songs has the column title
-- drop the foreign key fk_compilation_album_id
ALTER TABLE songs
DROP FOREIGN KEY fk_compilation_album_id;


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

-- A hard day's night album
INSERT INTO songs (title, length, authors, album_id)
VALUES('A Hard Day''s Night', '2:34', '["Paul McCartney", "John Lennon"]', 3),
      ('I Should Have Known Better', '2:43', '["Paul McCartney", "John Lennon"]', 3),
      ('If I Fell', '2:22', '["Paul McCartney", "John Lennon"]', 3),
      ('I''m Happy Just to Dance with You', '1:57', '["Paul McCartney", "John Lennon"]', 3),
      ('And I Love Her', '2:30', '["Paul McCartney", "John Lennon"]', 3),
      ('Tell Me Why', '2:10', '["Paul McCartney", "John Lennon"]', 3),
      ('Can''t Buy Me Love', '2:14', '["Paul McCartney", "John Lennon"]', 3),
      ('Any Time at All', '2:11', '["Paul McCartney", "John Lennon"]', 3),
      ('I''ll Cry Instead', '1:46', '["Paul McCartney", "John Lennon"]', 3),
      ('Things We Said Today', '2:35', '["Paul McCartney", "John Lennon"]', 3),
      ('When I Get Home', '2:17', '["Paul McCartney", "John Lennon"]', 3),
      ('You Can''t Do That', '2:35', '["Paul McCartney", "John Lennon"]', 3),
      ('I''ll Be Back', '2:22', '["Paul McCartney", "John Lennon"]', 3);

-- Beatles for Sale album
INSERT INTO songs (title, length, authors, album_id)
VALUES('No Reply', '2:15', '["Paul McCartney", "John Lennon"]', 4),
      ('I''m a Loser', '2:31', '["Paul McCartney", "John Lennon"]', 4),
      ('Baby''s in Black', '2:02', '["Paul McCartney", "John Lennon"]', 4),
      ('Rock and Roll Music', '2:32', '["Chuck Berry"]', 4),
      ('I''ll Follow the Sun', '1:49', '["Paul McCartney", "John Lennon"]', 4),
      ('Mr. Moonlight', '2:33', '["Roy Lee Johnson"]', 4),
      ('Kansas City/Hey-Hey-Hey-Hey!', '2:33', '["Jerry Leiber", "Mike Stoller"]', 4),
      ('Eight Days a Week', '2:44', '["Paul McCartney", "John Lennon"]', 4),
      ('Words of Love', '2:10', '["Buddy Holly"]', 4),
      ('Honey Don''t', '2:56', '["Carl Perkins"]', 4),
      ('Every Little Thing', '2:01', '["Paul McCartney", "John Lennon"]', 4),
      ('I Don''t Want to Spoil the Party', '2:33', '["Paul McCartney", "John Lennon"]', 4),
      ('What You''re Doing', '2:30', '["Paul McCartney", "John Lennon"]', 4),
      ('Everybody''s Trying to Be My Baby', '2:24', '["Carl Perkins"]', 4);

-- Help! album
INSERT INTO songs (title, length, authors, album_id)
VALUES('Help!', '2:18', '["Paul McCartney", "John Lennon"]', 5),
      ('The Night Before', '2:36', '["Paul McCartney", "John Lennon"]', 5),
      ('You''ve Got to Hide Your Love Away', '2:08', '["Paul McCartney", "John Lennon"]', 5),
      ('I Need You', '2:28', '["George Harrison"]', 5),
      ('Another Girl', '2:05', '["Paul McCartney", "John Lennon"]', 5),
      ('You''re Going to Lose that Girl', '2:18', '["Paul McCartney", "John Lennon"]', 5),
      ('Ticket to Ride', '3:10', '["Paul McCartney", "John Lennon"]', 5),
      ('Act Naturally', '2:29', '["Voni Morrison", "Johnny Russell"]', 5),
      ('It''s Only Love', '1:54', '["Paul McCartney", "John Lennon"]', 5),
      ('You Like Me Too Much', '2:35', '["George Harrison"]', 5),
      ('Tell Me What You See', '2:36', '["Paul McCartney", "John Lennon"]', 5),
      ('I''ve Just Seen a Face', '2:07', '["Paul McCartney", "John Lennon"]', 5),
      ('Yesterday', '2:05', '["Paul McCartney", "John Lennon"]', 5),
      ('Dizzy Miss Lizzy', '2:53', '["Larry Williams"]', 5);

-- Rubber Soul album; album_id = 6
INSERT INTO songs (title, length, authors, album_id)
VALUES('Drive My Car', '2:25', '["Paul McCartney", "John Lennon"]', 6),
      ('Norwegian Wood (This Bird Has Flown)', '2:01', '["Paul McCartney", "John Lennon"]', 6),
      ('You Won''t See Me', '3:22', '["Paul McCartney", "John Lennon"]', 6),
      ('Think for Yourself', '2:19', '["George Harrison"]', 6),
      ('The Word', '2:43', '["Paul McCartney", "John Lennon"]', 6),
      ('Michelle', '2:42', '["Paul McCartney", "John Lennon"]', 6),
      ('It''s Only Love', '1:55', '["Paul McCartney", "John Lennon"]',6),
      ('Girl', '2:30', '["Paul McCartney", "John Lennon"]', 6),
      ('I''m Looking Through You', '2:23', '["Paul McCartney", "John Lennon"]', 6),
      ('In My Life', '2:24', '["Paul McCartney", "John Lennon"]', 6),
      ('Wait', '2:16', '["Paul McCartney", "John Lennon"]', 6),
      ('If I Needed Someone', '2:22', '["George Harrison"]', 6),
      ('Run for Your Life', '2:18', '["Paul McCartney", "John Lennon"]', 6);

-- Revolver album; album_id = 7
INSERT INTO songs (title, length, authors, album_id)
VALUES('Taxman', '2:39', '["George Harrison"]', 7),
      ('Eleanor Rigby', '2:06', '["Paul McCartney", "John Lennon"]', 7),
      ('I''m Only Sleeping', '3:02', '["Paul McCartney", "John Lennon"]', 7),
      ('Love You To', '3:00', '["George Harrison"]', 7),
      ('Here, There and Everywhere', '2:25', '["Paul McCartney", "John Lennon"]', 7),
      ('Yellow Submarine', '2:40', '["Paul McCartney", "John Lennon"]', 7),
      ('She Said She Said', '2:37', '["Paul McCartney", "John Lennon"]', 7),
      ('Good Day Sunshine', '2:09', '["Paul McCartney", "John Lennon"]', 7),
      ('And Your Bird Can Sing', '2:02', '["Paul McCartney", "John Lennon"]', 7),
      ('For No One', '2:01', '["Paul McCartney", "John Lennon"]', 7),
      ('Doctor Robert', '2:15', '["Paul McCartney", "John Lennon"]', 7),
      ('I Want to Tell You', '2:30', '["George Harrison"]', 7),
      ('Got to Get You into My Life', '2:31', '["Paul McCartney", "John Lennon"]', 7),
      ('Tomorrow Never Knows', '2:57', '["Paul McCartney", "John Lennon"]', 7);

-- Sgt. Pepper's Lonely Hearts Club Band album; album_id = 8
INSERT INTO songs (title, length, authors, album_id)
VALUES('Sgt. Pepper''s Lonely Hearts Club Band', '2:02', '["Paul McCartney", "John Lennon"]', 8),
      ('With a Little Help from My Friends', '2:44', '["Paul McCartney", "John Lennon"]', 8),
      ('Lucy in the Sky with Diamonds', '3:28', '["Paul McCartney", "John Lennon"]', 8),
      ('Getting Better', '2:48', '["Paul McCartney", "John Lennon"]', 8),
      ('Fixing a Hole', '2:36', '["Paul McCartney", "John Lennon"]', 8),
      ('She''s Leaving Home', '3:35', '["Paul McCartney", "John Lennon"]', 8),
      ('Being for the Benefit of Mr. Kite!', '2:37', '["Paul McCartney", "John Lennon"]', 8),
      ('Within You Without You', '5:04', '["George Harrison"]', 8),
      ('When I''m Sixty-Four', '2:37', '["Paul McCartney", "John Lennon"]', 8),
      ('Lovely Rita', '2:42', '["Paul McCartney", "John Lennon"]', 8),
      ('Good Morning Good Morning', '2:41', '["Paul McCartney", "John Lennon"]', 8),
      ('Sgt. Pepper''s Lonely Hearts Club Band (Reprise)', '1:19', '["Paul McCartney", "John Lennon"]', 8),
      ('A Day in the Life', '5:33', '["Paul McCartney", "John Lennon"]', 8);
      
-- The White Album; album_id = 9
INSERT INTO songs (title, length, authors, album_id)
VALUES('Back in the U.S.S.R.', '2:43', '["Paul McCartney", "John Lennon"]', 10),
      ('Dear Prudence', '3:56', '["Paul McCartney", "John Lennon"]', 10),
      ('Glass Onion', '2:17', '["Paul McCartney", "John Lennon"]', 10),
      ('Ob-La-Di, Ob-La-Da', '3:08', '["Paul McCartney", "John Lennon"]', 10),
      ('Wild Honey Pie', '0:52', '["Paul McCartney", "John Lennon"]', 10),
      ('The Continuing Story of Bungalow Bill', '3:14', '["Paul McCartney", "John Lennon"]', 10),
      ('While My Guitar Gently Weeps', '4:45', '["George Harrison"]', 10),
      ('Happiness Is a Warm Gun', '2:43', '["Paul McCartney", "John Lennon"]', 10),
      ('Martha My Dear', '2:28', '["Paul McCartney", "John Lennon"]', 10),
      ('I''m So Tired', '2:03', '["Paul McCartney", "John Lennon"]', 10),
      ('Blackbird', '2:18', '["Paul McCartney", "John Lennon"]', 10),
      ('Piggies', '2:04', '["George Harrison"]', 10),
      ('Rocky Raccoon', '3:33', '["Paul McCartney", "John Lennon"]', 10),
      ('Don''t Pass Me By', '3:51', '["Richard Starkey"]', 10),
      ('Why Don''t We Do It in the Road?', '1:41', '["Paul McCartney", "John Lennon"]', 10),
      ('I Will', '1:46', '["Paul McCartney", "John Lennon"]', 10),
      ('Julia', '2:54', '["Paul McCartney", "John Lennon"]', 10),
      ('Birthday', '2:42', '["Paul McCartney", "John Lennon"]', 10),
      ('Yer Blues', '4:01', '["Paul McCartney", "John Lennon"]', 10),
      ('Mother Nature''s Son', '2:48', '["Paul McCartney", "John Lennon"]', 10),
      ('Everybody''s Got Something to Hide Except Me and My Monkey', '2:24', '["Paul McCartney", "John Lennon"]', 10),
      ('Sexy Sadie', '3:15', '["Paul McCartney", "John Lennon"]', 10),
      ('Helter Skelter', '4:29', '["Paul McCartney", "John Lennon"]', 10),
      ('Long, Long, Long', '3:04', '["George Harrison"]', 10),
      ('Revolution 1', '4:15', '["Paul McCartney", "John Lennon"]', 10),
      ('Honey Pie', '2:41', '["Paul McCartney", "John Lennon"]', 10),
      ('Savoy Truffle', '2:54', '["George Harrison"]', 10),
      ('Cry Baby Cry', '3:02', '["Paul McCartney", "John Lennon"]', 10),
      ('Revolution 9', '8:22', '["Paul McCartney", "John Lennon"]', 10),
      ('Good Night', '3:11', '["Paul McCartney", "John Lennon"]', 10);   

-- Magical Mystery Tour; album_id = 09
INSERT INTO songs (title, length, authors, album_id)
VALUES('Magical Mystery Tour', '2:51', '["Paul McCartney", "John Lennon"]', 09),
      ('The Fool on the Hill', '3:00', '["Paul McCartney", "John Lennon"]', 09),
      ('Flying', '2:16', '["Paul McCartney", "John Lennon"]', 09),
      ('Blue Jay Way', '3:50', '["George Harrison"]', 09),
      ('Your Mother Should Know', '2:33', '["Paul McCartney", "John Lennon"]', 09),
      ('I Am the Walrus', '4:35', '["Paul McCartney", "John Lennon"]', 09),
      ('Hello, Goodbye', '3:27', '["Paul McCartney", "John Lennon"]', 09),
      ('Strawberry Fields Forever', '4:10', '["Paul McCartney", "John Lennon"]', 09),
      ('Penny Lane', '3:00', '["Paul McCartney", "John Lennon"]', 09),
      ('Baby, You''re a Rich Man', '3:07', '["Paul McCartney", "John Lennon"]', 09),
      ('All You Need Is Love', '3:57', '["Paul McCartney", "John Lennon"]', 09);
      
-- Yellow Submarine; album_id = 11
INSERT INTO songs (title, length, authors, album_id)
VALUES('Yellow Submarine', '2:40', '["Paul McCartney", "John Lennon"]', 11),
      ('Only a Northern Song', '3:24', '["George Harrison"]', 11),
      ('All Together Now', '2:11', '["Paul McCartney", "John Lennon"]', 11),
      ('Hey Bulldog', '3:11', '["Paul McCartney", "John Lennon"]', 11),
      ('It''s All Too Much', '6:25', '["George Harrison"]', 11),
      ('All You Need Is Love', '3:57', '["Paul McCartney", "John Lennon"]', 11),
      ('Pepperland', '2:24', '["George Martin"]', 11),
      ('Sea of Time', '3:00', '["George Martin"]', 11),
      ('Sea of Holes', '2:17', '["George Martin"]', 11),
      ('Sea of Monsters', '3:37', '["George Martin"]', 11),
      ('March of the Meanies', '2:21', '["George Martin"]', 11),
      ('Pepperland Laid Waste', '2:15', '["George Martin"]', 11),
      ('Yellow Submarine in Pepperland', '2:13', '["George Martin"]', 11);

-- Abbey Road; album_id = 12
INSERT INTO songs (title, length, authors, album_id)
VALUES('Come Together', '4:20', '["Paul McCartney", "John Lennon"]', 12),
      ('Something', '3:03', '["George Harrison"]', 12),
      ('Maxwell''s Silver Hammer', '3:27', '["Paul McCartney", "John Lennon"]', 12),
      ('Oh! Darling', '3:27', '["Paul McCartney", "John Lennon"]', 12),
      ('Octopus''s Garden', '2:51', '["Richard Starkey"]', 12),
      ('I Want You (She''s So Heavy)', '7:47', '["Paul McCartney", "John Lennon"]', 12),
      ('Here Comes the Sun', '3:05', '["George Harrison"]', 12),
      ('Because', '2:45', '["Paul McCartney", "John Lennon"]', 12),
      ('You Never Give Me Your Money', '4:02', '["Paul McCartney", "John Lennon"]', 12),
      ('Sun King', '2:26', '["Paul McCartney", "John Lennon"]', 12),
      ('Mean Mr. Mustard', '1:06', '["Paul McCartney", "John Lennon"]', 12),
      ('Polythene Pam', '1:12', '["Paul McCartney", "John Lennon"]', 12),
      ('She Came in Through the Bathroom Window', '1:57', '["Paul McCartney", "John Lennon"]', 12),
      ('Golden Slumbers', '1:31', '["Paul McCartney", "John Lennon"]', 12),
      ('Carry That Weight', '1:36', '["Paul McCartney", "John Lennon"]', 12),
      ('The End', '2:20', '["Paul McCartney", "John Lennon"]', 12),
      ('Her Majesty', '0:23', '["Paul McCartney", "John Lennon"]', 12);


-- Let It Be; album_id = 13

INSERT INTO songs (title, length, authors, album_id)
VALUES('Two of Us', '3:33', '["Paul McCartney", "John Lennon"]', 13),
      ('Dig a Pony', '3:55', '["Paul McCartney", "John Lennon"]', 13),
      ('Across the Universe', '3:48', '["Paul McCartney", "John Lennon"]', 13),
      ('I Me Mine', '2:25', '["George Harrison"]', 13),
      ('Dig It', '0:51', '["Paul McCartney", "John Lennon"]', 13),
      ('Let It Be', '4:03', '["Paul McCartney", "John Lennon"]', 13),
      ('Maggie Mae', '0:40', '["Traditional"]', 13),
      ('I''ve Got a Feeling', '3:37', '["Paul McCartney", "John Lennon"]', 13),
      ('One After 909', '2:52', '["Paul McCartney", "John Lennon"]', 13),
      ('The Long and Winding Road', '3:38', '["Paul McCartney", "John Lennon"]', 13),
      ('For You Blue', '2:32', '["George Harrison"]', 13),
      ('Get Back', '3:12', '["Paul McCartney", "John Lennon"]', 13);

DROP TABLE IF EXISTS compilation_albums;

-- change the column name album_id to id from compilation_albums
ALTER TABLE compilation_albums
RENAME COLUMN album_id TO compilation_album_id;
/*
Insert into the album_id 1 the cover_art 
*/
UPDATE studio_albums
SET cover_art = 'https://upload.wikimedia.org/wikipedia/en/2/25/LetItBe.jpg'
WHERE album_id = 13;

USE the_beatles_restapi;   

SELECT * FROM songs;

SELECT * FROM songs WHERE song_id = 1;