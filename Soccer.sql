--Mahad Osman
--Date Dec 14
--Assignment: Modelling Exercise 

DROP DATABASE soccer_db;
CREATE DATABASE soccer_db;
\c soccer_db;

CREATE TABLE League (
    League_Id SERIAL PRIMARY KEY,
    League_name TEXT NOT NULL,
    Start_date date NOT NULL,
    End_date date
);

CREATE TABLE Teams (
    Team_id SERIAL PRIMARY KEY,
    Team_name TEXT UNIQUE NOT NULL,
    League INTEGER REFERENCES League ON DELETE SET NULl
);

CREATE TABLE Players (
    Player_id SERIAL PRIMARY KEY,
    First_name TEXT NOT NULL,
    Last_Name TEXT NOT NULL,
    Team_id INTEGER NOT NULL REFERENCES Teams 
);

CREATE TABLE Refs (
    Ref_id SERIAL PRIMARY KEY,
    First_name TEXT NOT NULL,
    Last_Name TEXT NOT NULL
);

-- A goal can be null? 
-- Yet we don't want to delete an entire game or player when deleting 
CREATE TABLE Goals(
    Goal_id SERIAL PRIMARY KEY,
    Player INTEGER REFERENCES Players ON DELETE SET NULL
);

CREATE TABLE Games(
    Game_id SERIAL PRIMARY KEY,
    League INTEGER NOT NULL REFERENCES League,
    Team1 INTEGER NOT NULL REFERENCES Teams,
    SCORE1 INTEGER REFERENCES Goals,
    Team2 INTEGER NOT NULL REFERENCES Teams,
    SCORE2 INTEGER REFERENCES Goals,
    Ref INTEGER NOT NULL REFERENCES Refs,
    Winner INTEGER NOT NULL REFERENCES Teams
);

