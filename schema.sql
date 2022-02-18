/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;
CREATE TABLE animals (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL NOT NULL 
);

ALTER TABLE animals
ADD species varchar(100);

--------------------------------------------------------------------------------------------------------------------------------
-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer  

CREATE TABLE owners (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
full_name varchar(100),
age INT,
PRIMARY KEY (id)
);

-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string

CREATE TABLE species (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
name varchar(100),
PRIMARY KEY (id)
);

-- Modify animals table:
-- Make sure that id is set as autoincremented PRIMARY KEY
-- Remove column species
-- Add column species_id which is a foreign key referencing species table
-- Add column owner_id which is a foreign key referencing the owners table

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners (id);
