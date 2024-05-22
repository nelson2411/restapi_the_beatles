USE the_beatles_restapi;

INSERT INTO studio_albums (title, length, releasedDate, numberOfTracks, label)
VALUES ('Please Please Me', '31:59', '1963-03-22', 14, 'Parlophone'),
       ('With The Beatles', '33:06', '1963-11-22', 14, 'Parlophone'),
       ('A Hard Day''s Night', '30:10', '1964-07-10', 13, 'Parlophone'),
       ('Beatles For Sale', '33:42', '1964-12-04', 14, 'Parlophone'),
       ('Help!', '33:44', '1965-08-06', 14, 'Parlophone'),
       ('Rubber Soul', '35:11', '1965-12-03', 14, 'Parlophone'),
       ('Revolver', '34:43', '1966-08-05', 14, 'Parlophone'),
       ('Sgt. Pepper''s Lonely Hearts Club Band', '39:52', '1967-26-05', 13, 'Parlophone'),
       ('Magical Mystery Tour', '36:35', '1967-11-27', 11, 'Parlophone'),
       ('The Beatles', '93:35', '1968-11-22', 30, 'Apple'),
       ('Yellow Submarine', '40:12', '1969-01-17', 13, 'Apple'),
       ('Abbey Road', '47:23', '1969-09-26', 17, 'Apple'),
       ('Let It Be', '35:48', '1970-05-08', 12, 'Apple');

INSERT INTO live_albums (title, length, location, date, country)
VALUES ('Live at the BBC', '2:12:00', 'London', '1963-03-22', 'UK'),
       ('On Air - Live at the BBC Volume 2', '2:07:00', 'London', '1963-11-22', 'UK'),
       ('The Beatles at the Hollywood Bowl', '34:00', 'Los Angeles', '1964-07-10', 'USA'),
       ('Live at the Star-Club in Hamburg, Germany; 1962', '1:05:00', 'Hamburg', '1964-12-04', 'Germany'),
       ('Get Back, The Rooftop Concert', '42:00', 'London', '1969-01-30', 'UK');

ALTER TABLE compilation_albums
ADD COLUMN label VARCHAR(255);

INSERT INTO compilation_albums (title, length, releasedDate, numberOfTracks, label)
VALUES ('A Collection of Beatles Oldies', '39:46', '1966-12-09', 16, 'Parlophone'),
       ('1962-1966', '63:00', '1973-04-19', 26, 'Apple'),
       ('1967-1970', '62:37', '1973-04-19', 28, 'Apple'),
       ('Rock ''n'' Roll Music', '63:00', '1976-06-10', 28, 'Parlophone'),
       ('Love Songs', '62:00', '1977-10-21', 25, 'Parlophone'),
       ('The Beatles Ballads', '60:00', '1980-10-20', 20, 'Parlophone'),
       ('Reel Music', '63:00', '1982-03-22', 14, 'Parlophone'),
       ('20 Greatest Hits', '59:00', '1982-10-11', 20, 'Parlophone'),
       ('Past Masters', '92:00', '1988-03-07', 33, 'Parlophone'),
       ('1', '79:00', '2000-11-13', 27, 'Apple'),
       ('The Beatles Stereo Box Set', '10:00:00', '2009-09-09', 217, 'Apple'),
       ('The Beatles in Mono', '9:00:00', '2009-09-09', 185, 'Apple');
       
-- Beatles for Sale album
INSERT INTO songs (title, length, authors, album_id)
