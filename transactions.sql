/* This file handles transactions on the database */
/*1st Transaction UPDATE & ROLLBACK*/
BEGIN;
UPDATE animals SET species='unspecified';
ROLLBACK;

/* 2nd Transaction UPDATE & COMMIT */
BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species is NULL;
COMMIT

/*3rd Transaction DELETE & ROLLBACK*/
BEGIN;
DELETE FROM animals;
ROLLBACK;

/*4th Transaction DELETE, SAVEPOINT,UPDATE,ROLLBACK,COMMIT*/
BEGIN;
DELETE FROM animals WHERE date_of_birth >'2022-1-1';
SAVEPOINT delete_data;
UPDATE animals SET weight_kg= -1*weight_kg;
ROLLBACK TO delete_data;
UPDATE animals SET weight_kg= -1*weight_kg WHERE weight_kg < 0;
COMMIT;
