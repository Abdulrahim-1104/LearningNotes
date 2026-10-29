-- Listing database 
Select datname from pg_database; -- pg_database build it pg metadata and datname coulmn holds the name of the database

-- creating database 
Create database learning_pg;

-- deleting databse
drop database learning_psql;


-- creating Tables
create table cars(
    brand VARCHAR(225), -- we need to delclare the datatypes for each column
    model VARCHAR(225),
    year INT
);

/*
================================================================================================================
POSTGRESQL DATA TYPES — USES AND EXAMPLES
================================================================================================================

DATA TYPE                           USES / WHEN TO USE                              SAMPLE USE
----------------------------------------------------------------------------------------------------------------

NUMERIC TYPES
----------------------------------------------------------------------------------------------------------------
smallint                            Small whole numbers                             age smallint, rating smallint
integer / int                       Standard whole numbers                          quantity integer, user_id integer
bigint                              Very large whole numbers                        order_id bigint, big_counter bigint
serial                              Auto-incrementing integer                       id serial PRIMARY KEY
bigserial                           Auto-incrementing large integer                 id bigserial PRIMARY KEY
numeric(p,s) / decimal(p,s)         Exact numbers (money, precise calculations)     price numeric(10,2), salary numeric(12,2)
real                                Approximate floating-point (low precision)      temperature real
double precision                    Approximate floating-point (higher precision)   latitude double precision
money                               Currency amounts                               amount money

CHARACTER / STRING TYPES
----------------------------------------------------------------------------------------------------------------
char(n)                             Fixed-length text (rarely needed)               code char(3)
varchar(n)                          Variable-length text with limit                 username varchar(50), email varchar(100)
text                                Variable-length text (preferred for most text)  description text, full_name text

BOOLEAN TYPE
----------------------------------------------------------------------------------------------------------------
boolean / bool                      True / False values                            is_active boolean, is_verified boolean

DATE / TIME TYPES
----------------------------------------------------------------------------------------------------------------
date                                Date only                                      birth_date date, order_date date
time                                Time of day only                               start_time time, opening_hours time
timestamp                           Date + time (no timezone)                      Avoid for timezone-sensitive events
timestamptz                         Date + time (timezone-aware)                   created_at timestamptz DEFAULT now()
interval                            Time duration / span                           duration interval, break_time interval

JSON TYPES
----------------------------------------------------------------------------------------------------------------
json                                JSON data (preserves input text representation) Rarely needed
jsonb                               JSON data (binary, indexable)                  metadata jsonb, settings jsonb

IDENTIFIER TYPES
----------------------------------------------------------------------------------------------------------------
uuid                                Universally unique identifier                  id uuid DEFAULT gen_random_uuid()

BINARY TYPES
----------------------------------------------------------------------------------------------------------------
bytea                               Binary data                                    file_content bytea

NETWORK ADDRESS TYPES
----------------------------------------------------------------------------------------------------------------
inet                                IP address (IPv4 or IPv6)                      ip_address inet
cidr                                Network address / subnet                       network cidr
macaddr                             MAC address (EUI-48 format)                    device_mac macaddr
macaddr8                            MAC address (EUI-64 format)                    device_mac macaddr8

GEOMETRIC TYPES
----------------------------------------------------------------------------------------------------------------
point                               Geometric point (x, y)                         location point
line                                Infinite line                                  Geometric calculations
lseg                                Line segment                                   Geometric calculations
box                                 Rectangular box                                Bounding boxes
path                                Geometric path                                 Routes / shapes
polygon                             Closed polygon                                 Areas / shapes
circle                              Circle (center + radius)                       Geometric calculations

BIT STRING TYPES
----------------------------------------------------------------------------------------------------------------
bit(n)                              Fixed-length bit string                        Flags / bit masks
bit varying(n) / varbit             Variable-length bit string                     Flexible bit flags

FULL-TEXT SEARCH TYPES
----------------------------------------------------------------------------------------------------------------
tsvector                            Full-text search document                      Search indexing
tsquery                             Full-text search query                         Search queries

OTHER DATA TYPES
----------------------------------------------------------------------------------------------------------------
xml                                 XML data                                       Storing XML documents

RANGE TYPES
----------------------------------------------------------------------------------------------------------------
int4range                           Range of integers                              age_range int4range
int8range                           Range of big integers                          Large number ranges
numrange                            Range of numeric values                        Price ranges
tsrange                             Range of timestamps (no timezone)             Time periods
tstzrange                           Range of timezone-aware timestamps             booking_period tstzrange
daterange                           Range of dates                                 availability daterange

ARRAY TYPES
----------------------------------------------------------------------------------------------------------------
text[] / integer[] etc.             Arrays of any supported element type            tags text[], scores integer[]

ENUM TYPES
----------------------------------------------------------------------------------------------------------------
ENUM (custom)                       Fixed list of allowed values                   status order_status
                                                                                   (after creating the custom type)

================================================================================================================
END OF POSTGRESQL DATA TYPES REFERENCE
================================================================================================================
*/

-- inserting values in the table
insert into cars values('bmw','m4',2002);
insert into cars (brand,model) values ('benz','a4') -- we able to insert a speicifc column alone 

-- inserting multiple values in the table
INSERT INTO cars VALUES
    ('toyota', 'fortuner', 2020),
    ('toyota', 'innova', 2018),
    ('toyota', 'camry', 2016),
    ('hyundai', 'creta', 2022),
    ('hyundai', 'i20', 2019),
    ('hyundai', 'venue', 2021),
    ('honda', 'civic', 2017),
    ('honda', 'amaze', 2020),
    ('honda', 'accord', 2015),
    ('maruti', 'swift', 2018),
    ('maruti', 'baleno', 2022),
    ('maruti', 'brezza', 2023),
    ('tata', 'nexon', 2021),
    ('tata', 'harrier', 2022),
    ('tata', 'punch', 2024),
    ('mahindra', 'thar', 2023),
    ('mahindra', 'scorpio', 2019),
    ('mahindra', 'xuv700', 2024),
    ('kia', 'seltos', 2022),
    ('kia', 'sonet', 2023),
    ('kia', 'carens', 2024),
    ('skoda', 'slavia', 2023),
    ('skoda', 'superb', 2018),
    ('volkswagen', 'polo', 2017),
    ('volkswagen', 'virtus', 2024),
    ('renault', 'kwid', 2019),
    ('renault', 'duster', 2016),
    ('nissan', 'magnite', 2022),
    ('ford', 'ecosport', 2018),
    ('ford', 'endeavour', 2020),
    ('bmw', 'x5', 2022),
    ('bmw', '3 series', 2021),
    ('mercedes-benz', 'c-class', 2023),
    ('mercedes-benz', 'e-class', 2020),
    ('audi', 'a4', 2021),
    ('audi', 'q5', 2023),
    ('volvo', 'xc60', 2022),
    ('jeep', 'compass', 2021),
    ('porsche', 'cayenne', 2023),
    ('tesla', 'model 3', 2024);

-- selecting tables
select * from cars;
select brand from cars; -- we can able to select a specific column alone 

select year,model from cars;

-- adding new column so which means altering the table 
 alter table cars add color varchar(225);
 alter table cars add id SERIAL PRIMARY KEY;

 -- updating a specific value in the column like adding new value in column
 update cars set color = 'red'
 where brand ='bmw';

-- updating multiple values in column
 update cars set color = 'blue', year=2000
 where brand = 'benz';

 -- altering the column of the table 
 alter table cars 
 alter column year type VARCHAR(4);

 -- Change the column type from VARCHAR to INTEGER
ALTER TABLE cars
ALTER COLUMN year TYPE INTEGER
USING year::INTEGER;
 

-- removing column of the table 
alter table cars drop column color;

-- deleting records in table 
delete from cars where id = 4;

delete from cars; -- this used to delete all records in the table;
TRUNCATE table cars; -- this is also used to delete all records in the table 

-- deleting entire table
drop table cars;



-- operators 
-- = Equal to
SELECT * FROM cars
WHERE brand = 'honda';

-- < Less than
SELECT * FROM cars
WHERE year < 2015;

-- > Greater than
SELECT * FROM cars
WHERE year > 2020;

-- <= Less than or equal to
SELECT * FROM cars
WHERE year <= 2015;

-- >= Greater than or equal to
SELECT * FROM cars
WHERE year >= 2020;

-- <> Not equal to
SELECT * FROM cars
WHERE brand <> 'honda';

-- != Not equal to
SELECT * FROM cars
WHERE brand != 'audi';

-- LIKE: case-sensitive pattern matching
SELECT * FROM cars
WHERE brand LIKE 'h%';

-- ILIKE: case-insensitive pattern matching
SELECT * FROM cars
WHERE brand ILIKE 'H%';

-- AND: both conditions must be true
SELECT * FROM cars
WHERE brand = 'honda'
AND year = 2011;

-- OR: at least one condition must be true
SELECT * FROM cars
WHERE brand = 'audi'
OR brand = 'honda';

-- IN: matches any value in the list
SELECT * FROM cars
WHERE brand IN ('honda', 'audi', 'toyota');

-- BETWEEN: checks an inclusive range
SELECT * FROM cars
WHERE year BETWEEN 2015 AND 2022;

-- IS NULL: finds rows with no value
SELECT * FROM cars
WHERE model IS NULL;

INSERT INTO cars VALUES ('toyota', NULL, 2024);

-- NOT LIKE: does not match the pattern
SELECT * FROM cars
WHERE brand NOT LIKE 'h%';

-- NOT IN: excludes the listed brands
SELECT * FROM cars
WHERE brand NOT IN ('honda', 'audi');

-- NOT BETWEEN: outside the inclusive range
SELECT * FROM cars
WHERE year NOT BETWEEN 2015 AND 2022;

-- NOT: negates a condition
SELECT * FROM cars
WHERE NOT (brand = 'honda');

-- Honda cars manufactured between 2010 and 2020
SELECT * FROM cars
WHERE brand = 'honda'
AND year BETWEEN 2010 AND 2020;

-- Cars from Honda or Toyota manufactured after 2018
SELECT * FROM cars
WHERE brand IN ('honda', 'toyota')
AND year > 2018;

-- Models containing the letter 'a', regardless of case
SELECT * FROM cars
WHERE model ILIKE '%a%';

-- DISTINCT keyword used to take all the non duplicat records
SELECT DISTINCT brand FROM cars;

select count(DISTINCT brand) from cars

-- order by
select year from cars order by year; -- by default ascending
select year from cars order by year ASC; -- ascending order
select year from cars order by year DESC; -- decending order


-- limit used to get the maximum record of return
select * from cars limit 10; -- only grab 10 records 
select * from cars order by year limit 5; -- we can combine things like this 

-- min and max
select max(year) from cars;
select min(year) as least_year from cars; -- as for alias to get the result in our desired name
select min(brand) from cars; -- based on alphabetics

-- count, sum, average

select count(year) from cars;
select sum(year) from cars;
select avg(year) from cars;

-- like(case sensitive) and ilike(case insensitive)
-- % symbol means any n number of character before or after
-- _ underscore means in that underscore any character can be ther 
-- exampe %a ends with a, a% starts with a, %a% any character between a
-- example _a second letter should be a

select * from cars;
select * from cars where brand Like '_i';
select * from cars where brand ILike '%a';
select * from cars where brand NOT ILike '%a';

-- IN used to check is there anything in this values 

select * from cars where brand IN ('bmw','kia');
select * from cars where brand NOT IN ('bmw','kia');
select * from cars where brand in (select brand from cars where year > 2015);

-- BETWEEN 
select * from cars where year BETWEEN 2015 AND 2023;

-- AS Alias used for temprory name 

select year as year_greaterthan_2015 from cars where year > 2015;

-- changing id to car_id in the car table
alter table cars rename column id TO car_id;



--- join 
select * from cars;
select * from owners;

-- creating owner table 
CREATE TABLE owners (
    owner_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    owner_name VARCHAR(100) NOT NULL DEFAULT 'Unknown',
    age INTEGER DEFAULT 18,
    car_id INTEGER REFERENCES cars(car_id) ON DELETE SET NULL
);


INSERT INTO owners (owner_name, age, car_id)
VALUES
    ('Arun', 25, 54),
    ('Priya', 30, 52),
    ('Karthik', 28, 56),
    (DEFAULT, DEFAULT, 53);

-- inner join
SELECT *
FROM cars c
INNER JOIN owners o
    ON o.car_id = c.car_id;


-- left join
SELECT *
FROM owners o
LEFT JOIN cars c
    ON o.car_id = c.car_id;

-- right join
SELECT *
FROM owners o
RIGHT JOIN cars c
    ON o.car_id = c.car_id;

-- full outer join
SELECT *
FROM owners o
FULL OUTER JOIN cars c
    ON o.car_id = c.car_id;

-- cross join
Select * from owners
cross join cars;


-- creating products and test product tables
create table product(
    product_id  serial primary key,
    product_name VARCHAR(30)
);

create table test_product(
    test_product_id  serial primary key,
    test_product_name VARCHAR(30)
);

INSERT INTO product (product_name) VALUES
    ('Laptop'),
    ('Mobile'),
    ('Keyboard'),
    ('Mouse'),
    ('Monitor');

INSERT INTO test_product (test_product_name) VALUES
    ('Red'),
    ('Blue'),
    ('Green'),
    ('Black'),
    ('White');

select * from cars;
select * from owners; 
Select * from product;
select * from test_product

-- UNION this used to comibine the coloumn from two tables 
select * from product union select * from test_product; -- without distinct
select * from product union all select * from test_product; -- with distinct


-- group by (mostly used with the aggregated fucntion)
select count(brand), brand from cars group by brand;

-- can be also used in join statement
select count(c.brand), c.brand
from cars c JOIN owners o ON c.car_id = o.car_id
group by brand;

-- having statement is used to filter the group class
select count(brand), brand
from cars group by brand having count(brand) > 1;

-- exists statement and not exists
select * from cars where EXISTS (select car_id from cars where year > 2020);
select * from cars where NOT EXISTS (select car_id from cars where year > 2010);


-- any statement
select * from cars where year = ANY(select year from cars where year BETWEEN 2010 AND 2020);

-- all statement
select * from cars where year = ALL(select year from cars where brand = 'toyota');

-- case statement like if else 
select brand,
CASE 
    when brand = 'toyota' then 'Owned by Japan'
    when brand = 'bmw' then 'Owned by German'
Else 
    'Not mentioned'
End as brand_owned_country
from cars;


-- order of SQL statement 

SELECT
    column1,
    column2
FROM table1
JOIN table2
    ON table1.id = table2.id
WHERE condition
GROUP BY column1, column2
HAVING aggregate_condition
ORDER BY column1 ASC
LIMIT 10
OFFSET 5;


-- creating schema 
-- schema is the organized group of the database tables so avoid naming conflicts etc..
create schema product;

select * from cars;

EXPLAIN ANALYSE select * from owners where owner_id=10;


Explain with with_high_age as
(
    select * from owners where age > 20
)
select * from with_high_age;


select * from cars;
EXPLAIN ANALYSE select * from owners where owner_id =15;

ANALYZE owners;


-- window function with aggregated function
select owner_name, AVG(age) OVER(order by age DESC) from owners;

-- window function with windowfnc
select owner_name, ROW_NUMBER() OVER() as sno from owners;


-- view - is used to store the query and while calling that can calculate the result and throw it 
create view  old_age_owners as
select * from owners where age > 30;

select * from old_age_owners;


-- materialized view - unlinke recalculating everytime when callings its store the data in disk
Create MATERIALIZED view honda_owners as 
select o.owner_name,c.brand from owners o inner join cars c on o.car_id = c.car_id
where c.brand = 'hyundai';

select * from honda_owners;

UPDATE owners
SET car_id = 52
WHERE owner_name = 'Karthik';

-- In the Materialzed result the old value persist after the insertion so need to refresh to get current data
REFRESH MATERIALIZED view honda_owners;

-- current data
select * from honda_owners;


-- json/jsonb -- json stores direct text but jsonb stores decompoesed binary text 
CREATE TABLE json_practice (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    details_json JSON,
    details_jsonb JSONB
);
INSERT INTO json_practice (name, details_json, details_jsonb)
VALUES
(
    'Arun',
    '{"age": 25, "city": "Chennai", "skills": ["SQL", "Python"], "active": true}',
    '{"age": 25, "city": "Chennai", "skills": ["SQL", "Python"], "active": true}'
),
(
    'Priya',
    '{"age": 32, "city": "Mumbai", "skills": ["Java", "PostgreSQL"], "active": true}',
    '{"age": 32, "city": "Mumbai", "skills": ["Java", "PostgreSQL"], "active": true}'
),
(
    'Ravi',
    '{"age": 28, "city": "Bangalore", "skills": ["Python", "JavaScript"], "active": false}',
    '{"age": 28, "city": "Bangalore", "skills": ["Python", "JavaScript"], "active": false}'
),
(
    'Meena',
    '{"age": 35, "city": "Chennai", "skills": ["PostgreSQL", "Docker"], "active": true}',
    '{"age": 35, "city": "Chennai", "skills": ["PostgreSQL", "Docker"], "active": true}'
),
(
    'Kumar',
    '{"age": 22, "city": "Hyderabad", "skills": ["C++", "Python"], "active": false}',
    '{"age": 22, "city": "Hyderabad", "skills": ["C++", "Python"], "active": false}'
),
(
    'Divya',
    '{"age": 29, "city": "Mumbai", "skills": ["SQL", "Excel"], "active": true}',
    '{"age": 29, "city": "Mumbai", "skills": ["SQL", "Excel"], "active": true}'
),
(
    'John',
    '{"age": 40, "city": "Delhi", "skills": ["AWS", "Docker"], "active": true}',
    '{"age": 40, "city": "Delhi", "skills": ["AWS", "Docker"], "active": true}'
),
(
    'Sara',
    '{"age": 27, "city": "Chennai", "skills": ["Java", "Python"], "active": false}',
    '{"age": 27, "city": "Chennai", "skills": ["Java", "Python"], "active": false}'
);

SELECT * FROM json_practice;

-- -> returns JSON/JSONB
SELECT name, details_jsonb -> 'city' AS city
FROM json_practice;

-- ->> returns text
SELECT name, details_jsonb ->> 'city' AS city
FROM json_practice;

-- Extract a number as an integer
SELECT name, (details_jsonb ->> 'age')::INTEGER AS age
FROM json_practice;

-- Extract a boolean
SELECT name, details_jsonb -> 'active' AS active
FROM json_practice;

-- Extract an array
SELECT name, details_jsonb -> 'skills' AS skills
FROM json_practice;

-- Extract the first array element (indexes start at 0)
SELECT name, details_jsonb -> 'skills' -> 0 AS first_skill
FROM json_practice;


-- full txt search
-- to_tsvector(first arg- language, second arg- text (usually refers table column)) - this function used to convert the text to searchable text
-- to_tsvector(first arg- language, second arg- text (usaully refers the serach text here)) - this used to perform query action
SELECT to_tsvector('english', 'Learning databases is useful'); -- this show 'databas':2 'learn':1 'use':4 -- just convereted to serachable words

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    title TEXT
);

INSERT INTO articles (title)
VALUES
    ('Learning PostgreSQL Basics'),
    ('Advanced Database Design'),
    ('Learning SQL and Databases'),
    ('PostgreSQL Full Text Search'),
    ('Learning Database Management');

SELECT *
FROM articles
WHERE to_tsvector('english', title)
      @@ to_tsquery('english', 'learning & database');


-- Stored Procedure or Procedure Language (PL) or PLPGSQL (Procedure Language Postgres SQL)
-- Its is used to create function and doing calculation like programming language 

-- Syntax	Purpose
-- CREATE FUNCTION	Creates a new function
-- CREATE OR REPLACE FUNCTION	Creates or replaces a function definition
-- $$ ... $$	Encloses the function body as a string without requiring quote escaping
-- BEGIN ... END	Defines a PL/pgSQL block
-- ;	Terminates statements
-- LANGUAGE plpgsql	Tells PostgreSQL how to interpret the function body

-- basic print function
CREATE OR REPLACE FUNCTION print_hello_world()
RETURNS text
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN 'Hello World!';
END;
$$;

-- function calling
Select print_hello_world()

-- with funciton with arguments 

CREATE OR REPLACE FUNCTION greet(name text, age integer DEFAULT 18)
RETURNS text
LANGUAGE sql
AS $$
    SELECT 'Hello ' || name || '! You are ' || age || ' years old.';
$$;

select greet('Rahim',23)


-- with maths calculation 
CREATE OR REPLACE FUNCTION calculate_total(
    price numeric,
    quantity integer,
    discount_percent numeric DEFAULT 0
)
RETURNS numeric
LANGUAGE sql
AS $$
    SELECT ROUND(price * quantity * (1 - discount_percent / 100), 2);
$$;

SELECT calculate_total(100, 3);

-- using table data 
CREATE OR REPLACE FUNCTION count_cars(p_brand VARCHAR)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) 
    INTO v_count
    FROM cars
    WHERE brand = p_brand;

    RETURN v_count;
END;
$$;

SELECT count_cars('hyundai')


-- Dropping function or Deleting Function
Drop functionName;


-- Triggers that used to automaticaly execute the code based on the event
-- Row level triggers - that used to run the trigger that every row affected
-- Statement level triggers - that used to run the trigger for only once for the statement even many row affect
-- First create trigger function, Second create triggger and finally do the event

select * from cars;
select * from owners;

-- create cars model history tracktion when ever model changes then this table should automatically have values 
Create table cars_model_history(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    old_model VARCHAR(225),
    new_model VARCHAR(225)
)

-- create trigger function
CREATE OR REPLACE FUNCTION track_model()
RETURNS TRIGGER -- mentioning going to return triggers
LANGUAGE plpgsql
AS $$
    BEGIN
        -- OLD the previous value of the row that its contains 
        -- NEW the updated value of the row that its contains
        INSERT INTO cars_model_history(old_model, new_model) VALUES(OLD.model, NEW.model);
        RETURN NEW;
    END;
    $$;

-- create TRIGGER
CREATE TRIGGER car_model_track
AFTER UPDATE OF model -- AFTER -> used to trigger function the UPATE happpen can be also used BEFORE
on cars 
-- ROW LEVEL - Affect each row and triggers function for every row its update 
-- STATEMENT LEVEL - Affects all row at once only one time trigger funciton exceute
FOR EACH ROW 
WHEN (OLD.model IS DISTINCT FROM NEW.model)
EXECUTE FUNCTION track_model();

-- now lets update a model in cars and check wheter entry present in the cars_model_history

SELECT * FROM cars_model_history;
SELECT * from cars;

-- updating cars model value
UPDATE cars 
SET model = 'fortunuer 1.0'
where car_id = 53;

-- dropping triggers function 
DROP TRIGGER car_model_track ON cars;
DROP FUNCTION track_model();

-- postgres.config this file contains how the postgres works and how its configured 
SHOW config_file;
SHOW data_directory;
SHOW max_connections;
SHOW shared_buffers;
SHOW work_mem;
SHOW statement_timeout;

SELECT
    name,
    setting,
    unit,
    source,
    context,
    pending_restart
FROM pg_settings
WHERE name IN (
    'max_connections',
    'shared_buffers',
    'work_mem',
    'maintenance_work_mem',
    'statement_timeout'
)
ORDER BY name;

SELECT current_user, current_database();