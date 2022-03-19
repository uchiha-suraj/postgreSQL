-- https://www.postgresqltutorial.com/

-- 1. for all command ==> \?

-- 2. list of database ==> \l

-- 3. create database ==> CREATE DATABASE practise;

-- 4. change database ==> \c practise

-- 5. create table ==>
CREATE TABLE products (
  id INT,
  name VARCHAR(50),
  price INT,
  on_sale boolean
);

-- 6. list all the tables ==> \d

-- 7. list all the col from table ==> \d products

-- 8. modify table ==>
ALTER TABLE products ADD COLUMN featured boolean;

-- 9. delete table ==>
ALTER TABLE products DROP COLUMN featured;

-- 10. drop table ==>
DROP TABLE products;

-- 11. delete database ==>
DROP DATABASE practise;


-- FOR PROJECT

-- create table
CREATE TABLE restaurants (
  id INT,
  name VARCHAR(50),
  location VARCHAR(50),
  price_range INT
);

-- insert entry into our table
INSERT INTO restaurants (id, name, location, price_range) values (123, 'mcdonalds', 'new york', 3);

-- to view all the entries in our table ==>
select * from restaurants;

-- to view some selected columns in our table ==>
select name, price_range from restaurants;

----------------------------------------------------------------
INSERT INTO restaurants (price_range) values (12);
--- it will create an useless entry where only the price range column will get the value and other columns will be empty.

-- to avoid such situation we will have to create table like this ==>

CREATE TABLE restaurants (
  id BIGSERIAL NOT NULL,
  name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL,
  price_range INT NOT NULL
);

-- BIGSERIAL will count automatically the id
-- NOT NULL is a constraint. we need to put something there

-- insert entry into our new table
INSERT INTO restaurants (name, location, price_range) values ('mcdonalds', 'new york', 3);

-- but we want price range to be less than 5, as per our application demand.
CREATE TABLE restaurants (
  id BIGSERIAL NOT NULL,
  name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL,
  price_range INT NOT NULL check(price_range >= 1 and price_range <= 5)
);
-- check(price_range >= 1 and price_range <= 5), it will make the price range between 1 and 5.


-- table with primary key
CREATE TABLE restaurants (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL,
  price_range INT NOT NULL check(price_range >= 1 and price_range <= 5)
);

-- create review table ==>
CREATE TABLE reviews (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  restaurant_id BIGINT NOT NULL REFERENCES restaurants(id),
  name VARCHAR(50) NOT NULL,
  review TEXT NOT NULL,
  rating INT NOT NULL check(rating >= 1 and rating <=5)
);