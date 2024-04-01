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
CREATE TABLE Offices (
	officeCode varchar(10) PRIMARY KEY NOT NULL,
	city varchar(50) NOT NULL,
	phone varchar(50) NOT NULL,
	addressLine1 varchar(50) NOT NULL,
	addressLine2 varchar(50) ,
	state varchar(50) ,
	country varchar(50) NOT NULL,
	postalCode varchar(50) NOT NULL,
	territory varchar(50) NOT NULL,
);

CREATE TABLE employees (
	employeeNumber INT PRIMARY KEY NOT NULL,
	lastName varchar(50) NOT NULL,
	firstName varchar(50) NOT NULL,
	extension varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	officeCode varchar(10) NOT NULL REFERENCES offices(officeCode),
	reportsTo INT DEFAULT NULL REFERENCES employees(employeeNumber),
	jobTitle varchar(50) NOT NULL
);

CREATE TABLE customers (
 customerNumber INT PRIMARY KEY NOT NULL,
  customerName VARCHAR(50) NOT NULL,
  contactLastName VARCHAR(50) NOT NULL,
  contactFirstName VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  addressLine1 VARCHAR(50) NOT NULL,
  addressLine2 VARCHAR(50) NULL DEFAULT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NULL DEFAULT NULL,
  postalCode VARCHAR(15) NULL DEFAULT NULL,
  country VARCHAR(50) NOT NULL,
  salesRepEmployeeNumber INT NULL REFERENCES employees(employeeNumber),
  creditLimit double precision NULL DEFAULT NULL
);


Querying using WHERE
select * from employees where jobTitle='Sales Rep';
update table set col=value where condition;
delete from table where condition;

CREATE TABLE productlines (
	productLine varchar(50) PRIMARY KEY NOT NULL,
	textDescription varchar(4000) DEFAULT NULL,
	htmlDescription text,
	image bytea
);

CREATE TABLE products (
  productCode VARCHAR(15) PRIMARY KEY NOT NULL,
  productName VARCHAR(70) NOT NULL,
  productScale VARCHAR(10) NOT NULL,
  productVendor VARCHAR(50) NOT NULL,
  productDescription TEXT NOT NULL,
  quantityInStock SMALLINT NOT NULL,
  buyPrice DOUBLE precision NOT NULL,
  MSRP DOUBLE precision NOT NULL,
  productLine VARCHAR(50) NULL REFERENCES productlines(productLine),
);

select customerName,country from customers order by country;
select customerName,country from customers order by country limit 10;

select productname,buyprice,msrp from products where productline='Planes' order by buyprice desc limit 5;
select productname,buyprice,msrp,quantityinstock from products where quantityinstock < 100;
select productname,buyprice,quantityinstock from products where productline='Motorcycles' and quantityinstock > 1000 order by buyprice limit 10;

CREATE TABLE Orders (
  orderNumber INT PRIMARY KEY NOT NULL,
  orderDate TIMESTAMP NOT NULL,
  requiredDate TIMESTAMP NOT NULL,
  shippedDate TIMESTAMP NULL DEFAULT NULL,
  status VARCHAR(15) NOT NULL,
  comments TEXT NULL DEFAULT NULL,
  customerNumber INT NOT NULL REFERENCES customers(customerNumber)
);

CREATE TABLE OrderDetails (
  orderNumber INT NOT NULL REFERENCES Orders(orderNumber),
  productCode VARCHAR(15) NOT NULL REFERENCES Products(productCode),
  quantityOrdered INT NOT NULL,
  priceEach DOUBLE precision NOT NULL,
  orderLineNumber SMALLINT NOT NULL,
  PRIMARY KEY (productCode, orderNumber)
);

CREATE TABLE Payments (
  checkNumber VARCHAR(50) PRIMARY KEY NOT NULL,
  paymentDate TIMESTAMP NOT NULL,
  amount DOUBLE precision NOT NULL,
  customerNumber INT NOT NULL REFERENCES Customers(customerNumber)
);

ALTER TABLE tablename ADD colname datatype; /* add col */
ALTER TABLE tablename DROP COLUMN colnam; /* drop col */
ALTER TABLE tablename MODIFY COLUMN colname datatype; /* modify col type */
ALTER TABLE tablename RENAME COLUMN oldcolname TO newcolname; /* rename col */
