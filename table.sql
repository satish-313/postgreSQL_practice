/*creating the table in psql */
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
);

/*inserting the differetn flights*/
INSERT INTO flights (origin, destination, duration) VALUES ('newyork', 'mumbai', 415);
INSERT INTO flights (origin, destination, duration) VALUES ('newyork', 'london', 204);
INSERT INTO flights (origin, destination, duration) VALUES ('newyork', 'hong kong', 300);
INSERT INTO flights (origin, destination, duration) VALUES ('newyork', 'cope town', 200);
INSERT INTO flights (origin, destination, duration) VALUES ('newyork', 'paris', 178);
INSERT INTO flights (origin, destination, duration) VALUES ('pune', 'kanpur', 354);
INSERT INTO flights (origin, destination, duration) VALUES ('bhubeneswar', 'budh gaya', 203);
INSERT INTO flights (origin, destination, duration) VALUES ('vishakaptnam', 'srinagar', 369);
INSERT INTO flights (origin, destination, duration) VALUES ('chennai', 'kochi', 147);


/* different select commands */
SELECT * FROM flights;

SELECT id , origin FROM flights;

SELECT * FROM flights WHERE id = 2;

SELECT * FROM flights WHERE destination = 'paris';

SELECT * FROM flights WHERE duration > 300;

SELECT AVG(duration) FROM flights;

SELECT COUNT(*) FROM flights;

SELECT COUNT(*) FROM flights WHERE origin = 'newyork';

SELECT * FROM flights WHERE origin IN ('newyork' , 'lima');

SELECT * FROM flights WHERE destination LIKE '%o%';

UPDATE flights SET duration = 370 WHERE id = 2;

/* for limit the data from showing */
SELECT * FROM flights LIMIT 3;

/* for oder the list by accending order of duration */
SELECT * FROM flights ORDER BY duration ASC;

/* for oder the list by desending order of duration */
SELECT * FROM flights ORDER BY duration DESC;

/* grouping of data by some counts */
SELECT origin , COUNT (*) FROM flights GROUP BY origin;

/* grouping by the certain condition of count */
SELECT origin , COUNT (*) FROM flights GROUP BY origin HAVING COUNT(*) > 1;

/* for creating another table for reference to another or flights table */
CREATE TABLE passenger ( id SERIAL PRIMARY KEY , name VARCHAR NOT NULL, flights_id INTEGER REFERENCES flights);

/* creating the table for passenger */
INSERT INTO passenger (name , flights_id) VALUES ('alice',1);
INSERT INTO passenger (name , flights_id) VALUES ('hari',5);
INSERT INTO passenger (name , flights_id) VALUES ('peter',2);
INSERT INTO passenger (name , flights_id) VALUES ('mark',4);
INSERT INTO passenger (name , flights_id) VALUES ('tony',6);
INSERT INTO passenger (name , flights_id) VALUES ('luffy',3);
INSERT INTO passenger (name , flights_id) VALUES ('nami',7);

/* for select name of above and get it id number */
SELECT * FROM passenger WHERE name = 'tony' ;

/* for geting id in flights table */
SELECT * FROM flights WHERE id = 6;

/* JOIN USE OF TWO TABLE */
SELECT origin,destination , name FROM flights JOIN passenger ON passenger.flights_id = flights.id;

/* for particular name as above is tony */
SELECT origin,destination , name FROM flights JOIN passenger ON passenger.flights_id = flights.id WHERE name = 'tony';

/* for condition is not validate in join table in that case we can use LEFT JOIN METHOD or RIGHT JOIN METHOD */
SELECT origin,destination , name FROM flights LEFT JOIN passenger ON passenger.flights_id = flights.id;

/* INDEX */


/* nested sql*/
/* more insert in passenger table */
INSERT INTO passenger (name , flights_id) VALUES ('arvi',1);
INSERT INTO passenger (name , flights_id) VALUES ('chandra',1);
INSERT INTO passenger (name , flights_id) VALUES ('kumar',5);
INSERT INTO passenger (name , flights_id) VALUES ('satish',4);
INSERT INTO passenger (name , flights_id) VALUES ('pradhan',6);

/* nested loop in sql */
SELECT * FROM flights WHERE id IN (SELECT flights_id FROM passenger GROUP BY flights_id HAVING COUNT (*) > 1);


/* Learning again */
CREATE TABLE offices (
	officeCode varchar(10) NOT NULL,
	city varchar(50) NOT NULL,
	phone varchar(50) NOT NULL,
	addressLine1 varchar(50) NOT NULL,
	addressLine2 varchar(50) ,
	state varchar(50) ,
	country varchar(50) NOT NULL,
	postalCode varchar(50) NOT NULL,
	territory varchar(50) NOT NULL,
	PRIMARY KEY (officeCode)
);

/* inserting row into the table */
insert into offices (officeCode,city,phone,addressLine1,state,country,postalCode,territory) values (
	'bglr','bengaluru','+91-9534253465','MG road, behind post office','Karnataka','India','700235','Asia');

insert into offices (officeCode,city,phone,addressLine1,state,country,postalCode,territory) values 
	( 'pn','pune','+91-8734634592','Pune-mumbai road, infront RTO office','Maharatra','India','450235','Asia'), 
	( 'idr','indore','+91-9534453489','Halkar memorial road','Madhya pradesh','India','302905','Asia'),
	( 'del','delhi','+91-2533259459','MG road, near rajpath centre','New Delhi','India','203730','Asia'),
	( 'nda','noida','+91-0594223001','Budha road, ambedkar centre','Uttar pradesh','India','104293','Asia'),
	( 'dbi','dubai','+971-0034388360','Dubai hills park, emaar complex','Dubai','UAE','25314','Asia'),
	( 'sng','singapore','+65-9511253422','Printen street, lane 65h','Central','Singapore','73249','Asia'),
	( 'syn','sydney','+61-2846437283','Blacktown, lake street lane 45','New south well','India','700235','Asia'),
    ( 'ny','new york','+1-22997655378','Central park, the one tower','New york','USA','265411','North America'),
	( 'ldn','london','+9-8459492694','Bigben tower, ark complex','London','England','764376','Europe');

CREATE TABLE employees (
	employeeNumber INT NOT NULL,
	lastName varchar(50) NOT NULL,
	firstName varchar(50) NOT NULL,
	extension varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	officeCode varchar(10) NOT NULL,
	reportsTo INT DEFAULT NULL,
	jobTitle varchar(50) NOT NULL
	PRIMARY KEY (employeeNumber),
	FOREIGN KEY (reportsTo) REFERENCES employees (employeeNumber),
	FOREIGN KEY (officeCode) REFERENCES offices (officeCode)
);

INSERT INTO employees VALUES (
	1002,'Murphy', 'Diane', 'x5800','dmurphy@classicmodel.com','ny',null,'President'
);



