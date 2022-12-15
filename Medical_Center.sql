--Part One: Medical Center
--Mahad Osman
--Date Dec 14
--Assignment: Modelling Exercise 

DROP DATABASE schema_db;
CREATE DATABASE schema_db;
\c schema_db;


CREATE TABLE MedicalCenter(
    Med_cen_id SERIAL PRIMARY KEY,
    Center_Name TEXT UNIQUE NOT NULL
);

CREATE TABLE Doctors(
    Dr_id SERIAL PRIMARY KEY,
    First_Name TEXT NOT NULL,
    last_Name TEXT NOT NULL,
    Med_center INTEGER NOT NULL REFERENCES MedicalCenter ON DELETE CASCADE
);

CREATE TABLE Patients(
    Patient_id SERIAL PRIMARY KEY,
    First_Name TEXT NOT NULL,
    last_Name TEXT NOT NULL,
    Doctor INTEGER NOT NULL REFERENCES Doctors ON DELETE CASCADE
);

CREATE TABLE Diseases(
    Disease_id SERIAL PRIMARY KEY,
    Name VARCHAR(15)
);

CREATE TABLE Visits(
    Visit_id SERIAL PRIMARY KEY,
    Center INTEGER NOT NULL REFERENCES MedicalCenter ON DELETE CASCADE,
    Doctor INTEGER NOT NULL REFERENCES Doctors ON DELETE CASCADE,
    Patient INTEGER NOT NULL REFERENCES Patients ON DELETE CASCADE,
    Disease INTEGER REFERENCES Diseases ON DELETE CASCADE
);