-- from the terminal run:
-- psql < outer_space.sql

--Mahad Osman
--Date Dec 14
--Assignment: Modelling Exercise 

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space



-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

--We are going to break down the above table into smaller tables and assocaite them 
 -- Planets 
  -- Fk Galaxy
  -- FK Moons 
 -- Galaxy 
 -- Moons 


CREATE TABLE Galaxy(
  Galaxy_id SERIAL PRIMARY KEY,
  Galaxy_name TEXT UNIQUE NOT NULL
); 

CREATE TABLE Moons(
  Moon_id SERIAL PRIMARY KEY,
  Moons Text[] UNIQUE NOT NULL
);

CREATE TABLE Planets(
  Planet_id SERIAL PRIMARY KEY, 
  Name TEXT UNIQUE NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  Galaxy INTEGER NOT NULL REFERENCES Galaxy,
  Moons INTEGER REFERENCES Moons  
);

INSERT INTO Galaxy(Galaxy_Name) 
VALUES
('Milky Way'),
('Proxima Centauri');

INSERT INTO Moons (Moons)
VALUES 
('{"The Moon"}'),
('{"Phobos", "Deimos"}'),
('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}')


INSERT INTO PLANETS (name, orbital_period_in_years, orbits_around, Galaxy, Moons)
VALUES
('Earth', 1.00, 'The Sun',1,1),
('Mars', 1.88, 'The Sun',1,2),
('Neptune', 164.8, 'The Sun',1,3);


INSERT INTO PLANETS (name, orbital_period_in_years, orbits_around, Galaxy)
VALUES
('Venus', 0.62, 'The Sun',1),
('Proxima Centauri b', 0.03, 'Proxima Centauri',1),
('Gliese 876 b', 0.23, 'Gliese 876',1);


-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');