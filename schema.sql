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


-----------------------------------------------------------------------------------------------------------
-- Create a table named vets with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
-- age: integer
-- date_of_graduation: date

CREATE TABLE vets (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
name varchar(100),
age INT,
date_of_graduation date,
PRIMARY KEY (id)
)

-- There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, 
-- and a species can have multiple vets specialized in it. Create a "join table" called specializations to handle this relationship.

CREATE TABLE specializations (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
vets_id INT,
species_id INT,
FOREIGN KEY (vets_id) REFERENCES vets(id),
FOREIGN KEY (species_id) REFERENCES species(id),	
PRIMARY KEY (id)
)

-- There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals. 
-- Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.

CREATE TABLE visits (
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT,
  vet_id INT ,
  visite_date DATE,
  FOREIGN KEY(animal_id) REFERENCES animals (id),
  FOREIGN KEY(vet_id) REFERENCES vets(id),
  PRIMARY KEY (id)
)