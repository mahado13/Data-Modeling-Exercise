-- from the terminal run:
-- psql < music.sql

--Mahad Osman
--Date Dec 14
--Assignment: Modelling Exercise 

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music


  --The below shall be broken down into:
    --Songs Table
      --Reference albums
  
    --Albumn Table
      --References artist 
      --References Producer
    
    --Artist table 
      --References Producer

    --producer table
    

CREATE TABLE Artist(
  artist_id SERIAL PRIMARY KEY,
  artist_name TEXT UNIQUE NOT NULL  
);

CREATE TABLE Producer(
  producer_id SERIAL PRIMARY KEY,
  producer_name TEXT UNIQUE NOT NULL 
);

CREATE TABLE Albumn (
  album_id SERIAL PRIMARY KEY,
  albumn_name VARCHAR(25) NOT NULL,
  artist INTEGER  NOT NULL REFERENCES artist,
  producer INTEGER NOT NULL REFERENCES producer
);

CREATE TABLE SONG (
  song_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  albumn INTEGER NOT NULL REFERENCES albumn
);

-- --1) Insert Into artists
-- INSERT INTO Artist (artist_name) VALUES 
-- ('Hanson'), ('Queen'), ('Mariah Cary'), ('Boyz II Men'), ('Lady Gaga'), ('Bradley Cooper'), ('Nickelback'), ('Jay Z'),('Alicia Keys');
-- --2) Insert into producers
-- INSERT INTO Producer (producer_name) VALUES
-- ('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'), ('Walter Afanasieff'), ('Benjamin Rice'), ('Bradley Cooper'), ('Rick Parashar'), 
-- ('Al Shux'),('Max Martin'), ('Cirkut');
-- --3) Insert into albumns
-- INSERT INTO Albumn (albumn_name, artist, producer) VALUES
-- ('Middle of Nowhere', 1, (1,2));
--4) Insert into songs

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
