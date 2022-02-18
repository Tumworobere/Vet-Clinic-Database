/*Queries that provide answers to the questions from all projects.*/
SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '1-1-2016' AND '1-1-2019';
SELECT name from animals WHERE neutered='true' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name='Agumon' OR name='Pickachu';
SELECT name,escape_attempts from animals WHERE weight_Kg > 10.5;
SELECT * from animals WHERE neutered=true;
SELECT * from animals WHERE NOT name='Gabumon';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made.
   Then roll back the change and verify that species columns went back to the state before tranasction. */
BEGIN;
UPDATE animals
SET species = 'unspecified';

TABLE animals;

ROLLBACK;

TABLE animals;

/* Inside a transaction:
Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
Commit the transaction.
Verify that change was made and persists after commit. */

BEGIN;

UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%_mon'

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

TABLE animals;

/* Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction. */

BEGIN;
DELETE FROM animals;
TABLE animals; /* TABLE IS EMPTY*/
ROLLBACK;

/* After the roll back verify if all records in the animals table still exist. After that you can start breath as usual ;) */
TABLE animals; /* DATA IS BACK */


/* Inside a transaction:
Delete all animals born after Jan 1st, 2022.
Create a savepoint for the transaction.
Update all animals' weight to be their weight multiplied by -1.
Rollback to the savepoint
Update all animals' weights that are negative to be their weight multiplied by -1.
Commit transaction */

BEGIN;

DELETE from animals
WHERE date_of_birth > '01-01-2022'

SAVEPOINT savepoint1;

UPDATE animals
SET weight_Kg = weight_Kg * (-1);

ROLLBACK TO savepoint1;

UPDATE animals
SET weight_Kg = weight_Kg * (-1);
WHERE weight_Kg < 0;

TABLE animals; /* All weights are positive */;

COMMIT;


-- How many animals are there?
SELECT COUNT(*) FROM animals;


-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0

-- What is the average weight of animals?
SELECT AVG(weight_Kg) FROM animals

-- Who escapes the most, neutered or not neutered animals?
SELECT 
  neutered,MAX(escape_attempts)
FROM animals
GROUP BY neutered

-- What is the minimum and maximum weight of each type of animal?
SELECT 
 species, Max(weight_Kg), Min(weight_Kg)
FROM animals
GROUP BY species

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT 
species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '01-01-1990' AND '01-01-2000'
GROUP BY species
