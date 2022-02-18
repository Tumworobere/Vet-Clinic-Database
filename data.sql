/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, 
    weight_kg
    ) VALUES (
        'Agumon', 
        '3-2-2020', 
        '0', 
        'true', 
        '10.23'
        );


INSERT INTO animals (
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, 
    weight_kg
    ) VALUES (
        'Gabumon', 
        '15-11-2018', 
        '2', 
        'true', 
        '8.0'
        );

INSERT INTO animals (
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, 
    weight_kg
    ) VALUES (
        'Pikachu', 
        '7-1-2021', 
        '1', 
        'false', 
        '15.04'
        );

INSERT INTO animals (
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, 
    weight_kg
    ) VALUES (
        'Devimon', 
        '12-5-2017', 
        '5', 
        'true', 
        '11.0'
        );