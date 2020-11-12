set time zone 'UTC';
create extension pgcrypto;

CREATE TABLE users (
    id serial PRIMARY KEY, 
    name VARCHAR (255) NOT NULL,
    creditcard VARCHAR(255) NOT NULL,
    ccv VARCHAR(255) NOT NULL
);

INSERT INTO users (name, creditcard, ccv) VALUES ('Nic Jackson', '1234-5678-9012', '123');
INSERT INTO users (name, creditcard, ccv) VALUES ('Erik Veld', '5678-9012-1234', '567');