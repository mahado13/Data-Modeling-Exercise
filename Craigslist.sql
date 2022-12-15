--Mahad Osman
--Date Dec 14
--Assignment: Modelling Exercise 

DROP DATABASE cragislist_db;
CREATE DATABASE cragislist_db;
\c cragislist_db;


CREATE TABLE Region (
    Region_Id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    user_name TEXT UNIQUE NOT NULL,
    Preferred INTEGER REFERENCES Region ON DELETE CASCADE 
);

CREATE TABLE Categories (
    Categorie_id SERIAL PRIMARY KEY,
    Category_title TEXT UNIQUE NOT NULL
);

CREATE Table posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(25) NOT NULL,
    location TEXT NOT NULL,
    Region INTEGER NOT NULL REFERENCES Region ON DELETE CASCADE ,
    CATEGORY INTEGER NOT NULL REFERENCES Categories ON DELETE CASCADE 
);