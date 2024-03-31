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
	employeeNumber INT PRIMARY KEY NOT NULL,
	lastName varchar(50) NOT NULL,
	firstName varchar(50) NOT NULL,
	extension varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	officeCode varchar(10) NOT NULL REFERENCES offices(officeCode),
	reportsTo INT DEFAULT NULL REFERENCES employees(employeeNumber),
	jobTitle varchar(50) NOT NULL
);

INSERT INTO employees VALUES (
	1002,'Murphy', 'Diane', 'x5800','dmurphy@classicmodel.com','ny',null,'President'
);

INSERT INTO employees VALUES (
	1126,'david', 'dane', 'x5648','dd@classicmodel.com','ny',1002,'Hr head'
);
INSERT INTO employees VALUES 
	( 1004,'Magi', 'Jones', 'x5600','Magi@classicmodel.com','ny',1002,'VP sales'),
	( 1111,'Rohit', 'Sharma', 'x3424','rohits@classicmodel.com','del',1002,'VP India'),
	( 1112,'Kanha', 'Murmu', 'x5634','km@classicmodel.com','pn',1114,'sr. eng'),
	( 1113,'satish', 'Kumar', 'x5635','kumar@classicmodel.com','idr',1111,'intern eng'),
	( 1114,'subham', 'kapoor', 'x5636','sk@classicmodel.com','nda',1111,'vp eng'),
	( 1115,'ripu', 'zar', 'x5637','ripu@classicmodel.com','dbi',1002,'middle ease head'),
	( 1116,'dev', 'kim', 'x5638','dkim@classicmodel.com','sng',1002,'east esia'),
	( 1117,'park', 'min', 'x5639','park@classicmodel.com','sng',1004,'east sale head'),
	( 1118,'michel', 'stark', 'x5640','ms@classicmodel.com','syn',1002,'aus president'),
	( 1119,'david', 'warkne', 'x5641','dw@classicmodel.com','syn',1118,'sr director'),
	( 1120,'charlot', 'set', 'x5642','css@classicmodel.com','ldn',1002,'VP euro'),
	( 1121,'joe', 'root', 'x5643','rjoe@classicmodel.com','ldn',1120,'sr eng euro'),
	( 1122,'dhiraj', 'roa', 'x5644','dr@classicmodel.com','pn',1111,'sr eng'),
	( 1123,'sonu', 'fugare', 'x5645','sonu@classicmodel.com','pn',1122,'jr eng'),
	( 1124,'rani', 'hol', 'x5646','rani@classicmodel.com','nda',1114,'jr sale'),
	( 1125,'sourav', 'maha', 'x5647','sm@classicmodel.com','idr',1111,'jr eng');


INSERT INTO Offices (officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory) VALUES 
('1','San Francisco','+1 650 219 4782','100 Market Street','Suite 300','CA','USA','94080','NA'),
('2','Boston','+1 215 837 0825','1550 Court Place','Suite 102','MA','USA','02107','NA'),
('3','NYC','+1 212 555 3000','523 East 53rd Street','apt. 5A','NY','USA','10022','NA'),
('4','Paris','+33 14 723 4404','43 Rue Jouffroy D',NULL,NULL,'France','75017','EMEA'),
('5','Tokyo','+81 33 224 5000','4-1 Kioicho',NULL,'Chiyoda-Ku','Japan','102-8578','Japan'),
('6','Sydney','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2','NSW','Australia','2010','APAC'),
('7','London','+44 20 7877 2041','25 Old Broad Street','Level 7',NULL,'UK','EC2N 1HN','EMEA');

INSERT INTO Employees (employeeNumber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle) VALUES 
 ('1002','Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
 ('1056','Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1','1002','VP Sales'),
 ('1076','Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1','1002','VP Marketing'),
 ('1088','Patterson','William','x4871','wpatterson@classicmodelcars.com','6','1056','Sales Manager (APAC)'),
 ('1102','Bondur','Gerard','x5408','gbondur@classicmodelcars.com','4','1056','Sale Manager (EMEA)'),
 ('1143','Bow','Anthony','x5428','abow@classicmodelcars.com','1','1056','Sales Manager (NA)'),
 ('1165','Jennings','Leslie','x3291','ljennings@classicmodelcars.com','1','1143','Sales Rep'),
 ('1166','Thompson','Leslie','x4065','lthompson@classicmodelcars.com','1','1143','Sales Rep'),
 ('1188','Firrelli','Julie','x2173','jfirrelli@classicmodelcars.com','2','1143','Sales Rep'),
 ('1216','Patterson','Steve','x4334','spatterson@classicmodelcars.com','2','1143','Sales Rep'),
 ('1286','Tseng','Foon Yue','x2248','ftseng@classicmodelcars.com','3','1143','Sales Rep'),
 ('1323','Vanauf','George','x4102','gvanauf@classicmodelcars.com','3','1143','Sales Rep'),
 ('1337','Bondur','Loui','x6493','lbondur@classicmodelcars.com','4','1102','Sales Rep'),
 ('1370','Hernandez','Gerard','x2028','ghernande@classicmodelcars.com','4','1102','Sales Rep'),
 ('1401','Castillo','Pamela','x2759','pcastillo@classicmodelcars.com','4','1102','Sales Rep'),
 ('1501','Bott','Larry','x2311','lbott@classicmodelcars.com','7','1102','Sales Rep'),
 ('1504','Jones','Barry','x102','bjones@classicmodelcars.com','7','1102','Sales Rep'),
 ('1611','Fixter','Andy','x101','afixter@classicmodelcars.com','6','1088','Sales Rep'),
 ('1612','Marsh','Peter','x102','pmarsh@classicmodelcars.com','6','1088','Sales Rep'),
 ('1619','King','Tom','x103','tking@classicmodelcars.com','6','1088','Sales Rep'),
 ('1621','Nishi','Mami','x101','mnishi@classicmodelcars.com','5','1056','Sales Rep'),
 ('1625','Kato','Yoshimi','x102','ykato@classicmodelcars.com','5','1621','Sales Rep'),
 ('1702','Gerard','Martin','x2312','mgerard@classicmodelcars.com','4','1102','Sales Rep');

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

INSERT INTO Customers (customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit) VALUES 
 ('103','Atelier graphique','Schmitt','Carine ','40.32.2555','54, rue Royale',NULL,'Nantes',NULL,'44000','France','1370','21000'),
 ('112','Signal Gift Stores','King','Jean','7025551838','8489 Strong St.',NULL,'Las Vegas','NV','83030','USA','1166','71800'),
 ('114','Australian Collectors, Co.','Ferguson','Peter','03 9520 4555','636 St Kilda Road','Level 3','Melbourne','Victoria','3004','Australia','1611','117300'),
 ('119','La Rochelle Gifts','Labrune','Janine ','40.67.8555','67, rue des Cinquante Otages',NULL,'Nantes',NULL,'44000','France','1370','118200'),
 ('121','Baane Mini Imports','Bergulfsen','Jonas ','07-98 9555','Erling Skakkes gate 78',NULL,'Stavern',NULL,'4110','Norway','1504','81700'),
 ('124','Mini Gifts Distributors Ltd.','Nelson','Susan','4155551450','5677 Strong St.',NULL,'San Rafael','CA','97562','USA','1165','210500'),
 ('125','Havel & Zbyszek Co','Piestrzeniewicz','Zbyszek ','(26) 642-7555','ul. Filtrowa 68',NULL,'Warszawa',NULL,'01-012','Poland',NULL,'0'),
 ('128','Blauer See Auto, Co.','Keitel','Roland','+49 69 66 90 2555','Lyonerstr. 34',NULL,'Frankfurt',NULL,'60528','Germany','1504','59700'),
 ('129','Mini Wheels Co.','Murphy','Julie','6505555787','5557 North Pendale Street',NULL,'San Francisco','CA','94217','USA','1165','64600'),
 ('131','Land of Toys Inc.','Lee','Kwai','2125557818','897 Long Airport Avenue',NULL,'NYC','NY','10022','USA','1323','114900'),
 ('141','Euro+ Shopping Channel','Freyre','Diego ','(91) 555 94 44','C/ Moralzarzal, 86',NULL,'Madrid',NULL,'28034','Spain','1370','227600'),
 ('144','Volvo Model Replicas, Co','Berglund','Christina ','0921-12 3555','Berguvsv',NULL,'Lule',NULL,'S-958 22','Sweden','1504','53100'),
 ('145','Danish Wholesale Imports','Petersen','Jytte ','31 12 3555','Vinb',NULL,'Kobenhavn',NULL,'1734','Denmark','1401','83400'),
 ('146','Saveley & Henriot, Co.','Saveley','Mary ','78.32.5555','2, rue du Commerce',NULL,'Lyon',NULL,'69004','France','1337','123900'),
 ('148','Dragon Souveniers, Ltd.','Natividad','Eric','+65 221 7555','Bronz Sok.','Bronz Apt. 3/6 Tesvikiye','Singapore',NULL,'079903','Singapore','1621','103800'),
 ('151','Muscle Machine Inc','Young','Jeff','2125557413','4092 Furth Circle','Suite 400','NYC','NY','10022','USA','1286','138500'),
 ('157','Diecast Classics Inc.','Leong','Kelvin','2155551555','7586 Pompton St.',NULL,'Allentown','PA','70267','USA','1216','100600'),
 ('161','Technics Stores Inc.','Hashimoto','Juri','6505556809','9408 Furth Circle',NULL,'Burlingame','CA','94217','USA','1165','84600'),
 ('166','Handji Gifts& Co','Victorino','Wendy','+65 224 1555','106 Linden Road Sandown','2nd Floor','Singapore',NULL,'069045','Singapore','1612','97900'),
 ('167','Herkku Gifts','Oeztan','Veysel','+47 2267 3215','Brehmen St. 121','PR 334 Sentrum','Bergen',NULL,'N 5804','Norway  ','1504','96800'),
 ('168','American Souvenirs Inc','Franco','Keith','2035557845','149 Spinnaker Dr.','Suite 101','New Haven','CT','97823','USA','1286','0'),
 ('169','Porto Imports Co.','de Castro','Isabel ','(1) 356-5555','Estrada da sa',NULL,'Lisboa',NULL,'1756','Portugal',NULL,'0'),
 ('171','Daedalus Designs Imports','Ranc','Martine ','20.16.1555','184, chauss',NULL,'Lille',NULL,'59000','France','1370','82900'),
 ('172','La Corne D\ abondance, Co.','Bertrand','Marie','(1) 42.34.2555','265, boulevard Charonne',NULL,'Paris',NULL,'75012','France','1337','84300');
 
 
 ('173','Cambridge Collectables Co.','Tseng','Jerry','6175555555','4658 Baden Av.',NULL,'Cambridge','MA','51247','USA','1188','43400'),
 ('175','Gift Depot Inc.','King','Julie','2035552570','25593 South Bay Ln.',NULL,'Bridgewater','CT','97562','USA','1323','84300'),
 ('177','Osaka Souveniers Co.','Kentary','Mory','+81 06 6342 5555','1-6-20 Dojima',NULL,'Kita-ku','Osaka',' 530-0003','Japan','1621','81200'),
 ('181','Vitachrome Inc.','Frick','Michael','2125551500','2678 Kingston Rd.','Suite 101','NYC','NY','10022','USA','1286','76400'),
 ('186','Toys of Finland, Co.','Karttunen','Matti','90-224 8555','Keskuskatu 45',NULL,'Helsinki',NULL,'21240','Finland','1501','96500'),
 ('187','AV Stores, Co.','Ashworth','Rachel','(171) 555-1555','Fauntleroy Circus',NULL,'Manchester',NULL,'EC2 5NT','UK','1501','136800'),
 ('189','Clover Collections, Co.','Cassidy','Dean','+353 1862 1555','25 Maiden Lane','Floor No. 4','Dublin',NULL,'2','Ireland','1504','69400'),
 ('198','Auto-Moto Classics Inc.','Taylor','Leslie','6175558428','16780 Pompton St.',NULL,'Brickhaven','MA','58339','USA','1216','23000'),
 ('201','UK Collectables, Ltd.','Devon','Elizabeth','(171) 555-2282','12, Berkeley Gardens Blvd',NULL,'Liverpool',NULL,'WX1 6LT','UK','1501','92700'),
 ('202','Canadian Gift Exchange Network','Tamuri','Yoshi ','(604) 555-3392','1900 Oak St.',NULL,'Vancouver','BC','V3F 2K1','Canada','1323','90300'),
 ('204','Online Mini Collectables','Barajas','Miguel','6175557555','7635 Spinnaker Dr.',NULL,'Brickhaven','MA','58339','USA','1188','68700'),
 ('205','Toys4GrownUps.com','Young','Julie','6265557265','78934 Hillside Dr.',NULL,'Pasadena','CA','90003','USA','1166','90700'),
 ('206','Asian Shopping Network, Co','Walker','Brydey','+612 9411 1555','Suntec Tower Three','8 Temasek','Singapore',NULL,'038988','Singapore',NULL,'0'),
 ('209','Mini Caravy','Citeaux','Fr','88.60.1555','24, place Kl',NULL,'Strasbourg',NULL,'67000','France','1370','53800'),
 ('211','King Kong Collectables, Co.','Gao','Mike','+852 2251 1555','Bank of China Tower','1 Garden Road','Central Hong Kong',NULL,NULL,'Hong Kong','1621','58600'),
 ('216','Enaco Distributors','Saavedra','Eduardo ','(93) 203 4555','Rambla de Catalu',NULL,'Barcelona',NULL,'08022','Spain','1702','60300'),
 ('219','Boards & Toys Co.','Young','Mary','3105552373','4097 Douglas Av.',NULL,'Glendale','CA','92561','USA','1166','11000'),
 ('223','Nat','Kloss','Horst ','0372-555188','Taucherstra',NULL,'Cunewalde',NULL,'01307','Germany',NULL,'0'),
 ('227','Heintze Collectables','Ibsen','Palle','86 21 3555','Smagsloget 45',NULL,'Aalborg',NULL,'8200','Denmark','1401','120800'),
 ('233','Qu','Fresni','Jean ','(514) 555-8054','43 rue St. Laurent',NULL,'Montreal','Qu','H1J 1C3','Canada','1286','48700'),
 ('237','ANG Resellers','Camino','Alejandra ','(91) 745 6555','Gran V',NULL,'Madrid',NULL,'28001','Spain',NULL,'0'),
 ('239','Collectable Mini Designs Co.','Thompson','Valarie','7605558146','361 Furth Circle',NULL,'San Diego','CA','91217','USA','1166','105000'),
 ('240','giftsbymail.co.uk','Bennett','Helen ','(198) 555-8888','Garden House','Crowther Way 23','Cowes','Isle of Wight','PO31 7PJ','UK','1501','93900'),
 ('242','Alpha Cognac','Roulet','Annette ','61.77.6555','1 rue Alsace-Lorraine',NULL,'Toulouse',NULL,'31000','France','1370','61100'),
 ('247','Messner Shopping Network','Messner','Renate ','069-0555984','Magazinweg 7',NULL,'Frankfurt',NULL,'60528','Germany',NULL,'0'),
 ('249','Amica Models & Co.','Accorti','Paolo ','011-4988555','Via Monte Bianco 34',NULL,'Torino',NULL,'10100','Italy','1401','113000'),
 ('250','Lyon Souveniers','Da Silva','Daniel','+33 1 46 62 7555','27 rue du Colonel Pierre Avia',NULL,'Paris',NULL,'75508','France','1337','68100'),
 ('256','Auto Associ','Tonini','Daniel ','30.59.8555','67, avenue de l\ Europe',NULL,'Versailles',NULL,'78000','France','1370','77900'),
 ('259','Toms Spezialit','Pfalzheim','Henriette ','0221-5554327','Mehrheimerstr. 369',NULL,'Karlsruhe',NULL,'50739','Germany','1504','120400'),
 ('260','Royal Canadian Collectables, Ltd.','Lincoln','Elizabeth ','(604) 555-4555','23 Tsawwassen Blvd.',NULL,'Tsawwassen','BC','T2F 8M4','Canada','1323','89600'),
 ('273','Franken Gifts, Co','Franken','Peter ','089-0877555','Berliner Platz 43',NULL,'Manheim',NULL,'80805','Germany',NULL,'0'),
 ('276','Anna\s Decorations, Ltd','O\Hara','Anna','02 9936 8555','201 Miller Street','Level 15','North Sydney','NSW','2060','Australia','1611','107800'),
 ('278','Rovelli Gifts','Rovelli','Giovanni ','035-640555','Via Ludovico il Moro 22',NULL,'Bergamo',NULL,'24100','Italy','1401','119600'),
 ('282','Souveniers And Things Co.','Huxley','Adrian','+61 2 9495 8555','Monitor Money Building','815 Pacific Hwy','Chatswood','NSW','2067','Australia','1611','93300'),
 ('286','Marta\s Replicas Co.','Hernandez','Marta','6175558555','39323 Spinnaker Dr.',NULL,'Cambridge','MA','51247','USA','1216','123700'),
 ('293','BG&E Collectables','Harrison','Ed','+41 26 425 50 01','Rte des Arsenaux 41 ',NULL,'Fribourg',NULL,'1700','Switzerland',NULL,'0'),
 ('298','Vida Sport, Ltd','Holz','Mihael','0897-034555','Grenzacherweg 237',NULL,'Geneva',NULL,'1203','Switzerland','1702','141300'),
 ('299','Norway Gifts By Mail, Co.','Klaeboe','Jan','+47 2212 1555','Drammensveien 126A','PB 211 Sentrum','Oslo',NULL,'N 0106','Norway  ','1504','95100'),
 ('303','Schuyler Imports','Schuyler','Bradley','+31 20 491 9555','Kingsfordweg 151',NULL,'Amsterdam',NULL,'1043 GR','Netherlands',NULL,'0'),
 ('307','Der Hund Imports','Andersen','Mel','030-0074555','Obere Str. 57',NULL,'Berlin',NULL,'12209','Germany',NULL,'0'),
 ('311','Oulu Toy Supplies, Inc.','Koskitalo','Pirkko','981-443655','Torikatu 38',NULL,'Oulu',NULL,'90110','Finland','1501','90500'),
 ('314','Petit Auto','Dewey','Catherine ','(02) 5554 67','Rue Joseph-Bens 532',NULL,'Bruxelles',NULL,'B-1180','Belgium','1401','79900'),
 ('319','Mini Classics','Frick','Steve','9145554562','3758 North Pendale Street',NULL,'White Plains','NY','24067','USA','1323','102700'),
 ('320','Mini Creations Ltd.','Huang','Wing','5085559555','4575 Hillside Dr.',NULL,'New Bedford','MA','50553','USA','1188','94500'),
 ('321','Corporate Gift Ideas Co.','Brown','Julie','6505551386','7734 Strong St.',NULL,'San Francisco','CA','94217','USA','1165','105000'),
 ('323','Down Under Souveniers, Inc','Graham','Mike','+64 9 312 5555','162-164 Grafton Road','Level 2','Auckland  ',NULL,NULL,'New Zealand','1612','88000'),
 ('324','Stylish Desk Decors, Co.','Brown','Ann ','(171) 555-0297','35 King George',NULL,'London',NULL,'WX3 6FW','UK','1501','77000'),
 ('328','Tekni Collectables Inc.','Brown','William','2015559350','7476 Moss Rd.',NULL,'Newark','NJ','94019','USA','1323','43000'),
 ('333','Australian Gift Network, Co','Calaghan','Ben','61-7-3844-6555','31 Duncan St. West End',NULL,'South Brisbane','Queensland','4101','Australia','1611','51600'),
 ('334','Suominen Souveniers','Suominen','Kalle','+358 9 8045 555','Software Engineering Center','SEC Oy','Espoo',NULL,'FIN-02271','Finland','1501','98800'),
 ('335','Cramer Spezialit','Cramer','Philip ','0555-09555','Maubelstr. 90',NULL,'Brandenburg',NULL,'14776','Germany',NULL,'0'),
 ('339','Classic Gift Ideas, Inc','Cervantes','Francisca','2155554695','782 First Street',NULL,'Philadelphia','PA','71270','USA','1188','81100'),
 ('344','CAF Imports','Fernandez','Jesus','+34 913 728 555','Merchants House','27-30 Merchant\s Quay','Madrid',NULL,'28023','Spain','1702','59600'),
 ('347','Men \R\ US Retailers, Ltd.','Chandler','Brian','2155554369','6047 Douglas Av.',NULL,'Los Angeles','CA','91003','USA','1166','57700'),
 ('348','Asian Treasures, Inc.','McKenna','Patricia ','2967 555','8 Johnstown Road',NULL,'Cork','Co. Cork',NULL,'Ireland',NULL,'0'),
 ('350','Marseille Mini Autos','Lebihan','Laurence ','91.24.4555','12, rue des Bouchers',NULL,'Marseille',NULL,'13008','France','1337','65000'),
 ('353','Reims Collectables','Henriot','Paul ','26.47.1555','59 rue de l\Abbaye',NULL,'Reims',NULL,'51100','France','1337','81100'),
 ('356','SAR Distributors, Co','Kuger','Armand','+27 21 550 3555','1250 Pretorius Street',NULL,'Hatfield','Pretoria','0028','South Africa',NULL,'0'),
 ('357','GiftsForHim.com','MacKinlay','Wales','64-9-3763555','199 Great North Road',NULL,'Auckland',NULL,NULL,'New Zealand','1612','77700'),
 ('361','Kommission Auto','Josephs','Karin','0251-555259','Luisenstr. 48',NULL,'Passau',NULL,'44087','Germany',NULL,'0'),
 ('362','Gifts4AllAges.com','Yoshido','Juri','6175559555','8616 Spinnaker Dr.',NULL,'Boston','MA','51003','USA','1216','41900'),
 ('363','Online Diecast Creations Co.','Young','Dorothy','6035558647','2304 Long Airport Avenue',NULL,'Nashua','NH','62005','USA','1216','114200'),
 ('369','Lisboa Souveniers, Inc','Rodriguez','Lino ','(1) 354-2555','Jardim das rosas n. 32',NULL,'Lisboa',NULL,'1675','Portugal',NULL,'0'),
 ('376','Precious Collectables','Urs','Braun','0452-076555','Hauptstr. 29',NULL,'Bern',NULL,'3012','Switzerland','1702','0'),
 ('379','Collectables For Less Inc.','Nelson','Allen','6175558555','7825 Douglas Av.',NULL,'Brickhaven','MA','58339','USA','1188','70700'),
 ('381','Royale Belge','Cartrain','Pascale ','(071) 23 67 2555','Boulevard Tirou, 255',NULL,'Charleroi',NULL,'B-6000','Belgium','1401','23500'),
 ('382','Salzburg Collectables','Pipps','Georg ','6562-9555','Geislweg 14',NULL,'Salzburg',NULL,'5020','Austria','1401','71700'),
 ('385','Cruz & Sons Co.','Cruz','Arnold','+63 2 555 3587','15 McCallum Street','NatWest Center #13-03','Makati City',NULL,'1227 MM','Philippines','1621','81500'),
 ('386','L\ordine Souveniers','Moroni','Maurizio ','0522-556555','Strada Provinciale 124',NULL,'Reggio Emilia',NULL,'42100','Italy','1401','121400'),
 ('398','Tokyo Collectables, Ltd','Shimamura','Akiko','+81 3 3584 0555','2-2-8 Roppongi',NULL,'Minato-ku','Tokyo','106-0032','Japan','1621','94400'),
 ('406','Auto Canal+ Petit','Perrier','Dominique','(1) 47.55.6555','25, rue Lauriston',NULL,'Paris',NULL,'75016','France','1337','95000'),
 ('409','Stuttgart Collectable Exchange','M','Rita ','0711-555361','Adenauerallee 900',NULL,'Stuttgart',NULL,'70563','Germany',NULL,'0'),
 ('412','Extreme Desk Decorations, Ltd','McRoy','Sarah','04 499 9555','101 Lambton Quay','Level 11','Wellington',NULL,NULL,'New Zealand','1612','86800'),
 ('415','Bavarian Collectables Imports, Co.','Donnermeyer','Michael',' +49 89 61 08 9555','Hansastr. 15',NULL,'Munich',NULL,'80686','Germany','1504','77000'),
 ('424','Classic Legends Inc.','Hernandez','Maria','2125558493','5905 Pompton St.','Suite 750','NYC','NY','10022','USA','1286','67500'),
 ('443','Feuer Online Stores, Inc','Feuer','Alexander ','0342-555176','Heerstr. 22',NULL,'Leipzig',NULL,'04179','Germany',NULL,'0'),
 ('447','Gift Ideas Corp.','Lewis','Dan','2035554407','2440 Pompton St.',NULL,'Glendale','CT','97561','USA','1323','49700'),
 ('448','Scandinavian Gift Ideas','Larsson','Martha','0695-34 6555','',NULL,'GÃƒÂ¶teborg',NULL,'S-844 67','Sweden','1504','116400'),
 ('450','The Sharp Gifts Warehouse','Frick','Sue','4085553659','3086 Ingle Ln.',NULL,'San Jose','CA','94217','USA','1165','77600'),
 ('452','Mini Auto Werke','Mendel','Roland ','7675-3555','Kirchgasse 6',NULL,'Graz',NULL,'8010','Austria','1401','45300'),
 ('455','Super Scale Inc.','Murphy','Leslie','2035559545','567 North Pendale Street',NULL,'New Haven','CT','97823','USA','1286','95400'),
 ('456','Microscale Inc.','Choi','Yu','2125551957','5290 North Pendale Street','Suite 200','NYC','NY','10022','USA','1286','39800'),
 ('458','Corrida Auto Replicas, Ltd','Sommer','Mart','(91) 555 22 82','C/ Araquil, 67',NULL,'Madrid',NULL,'28023','Spain','1702','104600'),
 ('459','Warburg Exchange','Ottlieb','Sven ','0241-039123','Walserweg 21',NULL,'Aachen',NULL,'52066','Germany',NULL,'0'),
 ('462','FunGiftIdeas.com','Benitez','Violeta','5085552555','1785 First Street',NULL,'New Bedford','MA','50553','USA','1216','85800'),
 ('465','Anton Designs, Ltd.','Anton','Carmen','+34 913 728555','c/ Gobelas, 19-1 Urb. La Florida',NULL,'Madrid',NULL,'28023','Spain',NULL,'0'),
 ('471','Australian Collectables, Ltd','Clenahan','Sean','61-9-3844-6555','7 Allen Street',NULL,'Glen Waverly','Victoria','3150','Australia','1611','60300'),
 ('473','Frau da Collezione','Ricotti','Franco','+39 022515555','20093 Cologno Monzese','Alessandro Volta 16','Milan',NULL,NULL,'Italy','1401','34800'),
 ('475','West Coast Collectables Co.','Thompson','Steve','3105553722','3675 Furth Circle',NULL,'Burbank','CA','94019','USA','1166','55400'),
 ('477','Mit Vergn','Moos','Hanna ','0621-08555','Forsterstr. 57',NULL,'Mannheim',NULL,'68306','Germany',NULL,'0'),
 ('480','Kremlin Collectables, Co.','Semenov','Alexander ','+7 812 293 0521','2 Pobedy Square',NULL,'Saint Petersburg',NULL,'196143','Russia',NULL,'0'),
 ('481','Raanan Stores, Inc','Altagar,G M','Raanan','+ 972 9 959 8555','3 Hagalim Blv.',NULL,'Herzlia',NULL,'47625','Israel',NULL,'0'),
 ('484','Iberia Gift Imports, Corp.','Roel','Jos','(95) 555 82 82','C/ Romero, 33',NULL,'Sevilla',NULL,'41101','Spain','1702','65700'),
 ('486','Motor Mint Distributors Inc.','Salazar','Rosa','2155559857','11328 Douglas Av.',NULL,'Philadelphia','PA','71270','USA','1323','72600'),
 ('487','Signal Collectibles Ltd.','Taylor','Sue','4155554312','2793 Furth Circle',NULL,'Brisbane','CA','94217','USA','1165','60300'),
 ('489','Double Decker Gift Stores, Ltd','Smith','Thomas ','(171) 555-7555','120 Hanover Sq.',NULL,'London',NULL,'WA1 1DP','UK','1501','43300'),
 ('495','Diecast Collectables','Franco','Valarie','6175552555','6251 Ingle Ln.',NULL,'Boston','MA','51003','USA','1188','85100'),
 ('496','Kelly\ s Gift Shop','Snowden','Tony','+64 9 5555500','Arenales 1938 3\',NULL,'Auckland  ',NULL,NULL,'New Zealand','1612','110000');

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

INSERT INTO ProductLines (productLine,textDescription,htmlDescription,image) VALUES 
('Classic Cars','Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.',NULL,NULL),
('Motorcycles','Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.',NULL,NULL),
('Planes','Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.',NULL,NULL),
('Ships','The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.',NULL,NULL),
('Trains','Model trains are a rewarding hobby for enthusiasts of all ages. Whether you are looking for collectible wooden trains, electric streetcars or locomotives, you will find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.',NULL,NULL),
('Trucks and Buses','The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.',NULL,NULL),
('Vintage Cars','Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.',NULL,NULL);

INSERT INTO Products (productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyPrice,MSRP) VALUES 
 ('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','Min Lin Diecast','This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.','7933','48.81','95.7'),
 ('S10_1949','1952 Alpine Renault 1300','Classic Cars','1:10','Classic Metal Creations','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','7305','98.58','214.3'),
 ('S10_2016','1996 Moto Guzzi 1100i','Motorcycles','1:10','Highway 66 Mini Classics','Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.','6625','68.99','118.94'),
 ('S10_4698','2003 Harley-Davidson Eagle Drag Bike','Motorcycles','1:10','Red Start Diecast','Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine','5582','91.02','193.66'),
 ('S10_4757','1972 Alfa Romeo GTA','Classic Cars','1:10','Motor City Art Classics','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','3252','85.68','136'),
 ('S10_4962','1962 LanciaA Delta 16V','Classic Cars','1:10','Second Gear Diecast','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','6791','103.42','147.74'),
 ('S12_1099','1968 Ford Mustang','Classic Cars','1:12','Autoart Studio Design','Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.','68','95.34','194.57'),
 ('S12_1108','2001 Ferrari Enzo','Classic Cars','1:12','Second Gear Diecast','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','3619','95.59','207.8'),
 ('S12_1666','1958 Setra Bus','Trucks and Buses','1:12','Welly Diecast Productions','Model features 30 windows, skylights & glare resistant glass, working steering system, original logos','1579','77.9','136.67'),
 ('S12_2823','2002 Suzuki XREO','Motorcycles','1:12','Unimax Art Galleries','Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.','9997','66.27','150.62'),
 ('S12_3148','1969 Corvair Monza','Classic Cars','1:18','Welly Diecast Productions','1:18 scale die-cast about 10 inches long doors open, hood opens, trunk opens and wheels roll','6906','89.14','151.08'),
 ('S12_3380','1968 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions','1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black','9123','75.16','117.44'),
 ('S12_3891','1969 Ford Falcon','Classic Cars','1:12','Second Gear Diecast','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','1049','83.05','173.02'),
 ('S12_3990','1970 Plymouth Hemi Cuda','Classic Cars','1:12','Studio M Art Models','Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.','5663','31.92','79.8'),
 ('S12_4473','1957 Chevy Pickup','Trucks and Buses','1:12','Exoto Designs','1:12 scale die-cast about 20 inches long Hood opens, Rubber wheels','6125','55.7','118.5'),
 ('S12_4675','1969 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions','Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.','7323','58.73','115.16'),
 ('S18_1097','1940 Ford Pickup Truck','Trucks and Buses','1:18','Studio M Art Models','This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box','2613','58.33','116.67'),
 ('S18_1129','1993 Mazda RX-7','Classic Cars','1:18','Highway 66 Mini Classics','This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.','3975','83.51','141.54'),
 ('S18_1342','1937 Lincoln Berline','Vintage Cars','1:18','Motor City Art Classics','Features opening engine cover, doors, trunk, and fuel filler cap. Color black','8693','60.62','102.74'),
 ('S18_1367','1936 Mercedes-Benz 500K Special Roadster','Vintage Cars','1:18','Studio M Art Models','This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.','8635','24.26','53.91'),
 ('S18_1589','1965 Aston Martin DB5','Classic Cars','1:18','Classic Metal Creations','Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.','9042','65.96','124.44'),
 ('S18_1662','1980s Black Hawk Helicopter','Planes','1:18','Red Start Diecast','1:18 scale replica of actual Army s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.','5330','77.27','157.69'),
 ('S18_1749','1917 Grand Touring Sedan','Vintage Cars','1:18','Welly Diecast Productions','This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.','2724','86.7','170'),
 ('S18_1889','1948 Porsche 356-A Roadster','Classic Cars','1:18','Gearbox Collectibles','This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','8826','53.9','77'),
 ('S18_1984','1995 Honda Civic','Classic Cars','1:18','Min Lin Diecast','This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.','9772','93.89','142.25'),
 ('S18_2238','1998 Chrysler Plymouth Prowler','Classic Cars','1:18','Gearbox Collectibles','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','4724','101.51','163.73'),
 ('S18_2248','1911 Ford Town Car','Vintage Cars','1:18','Motor City Art Classics','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.','540','33.3','60.54'),
 ('S18_2319','1964 Mercedes Tour Bus','Trucks and Buses','1:18','Unimax Art Galleries','Exact replica. 100+ parts. working steering system, original logos','8258','74.86','122.73'),
 ('S18_2325','1932 Model A Ford J-Coupe','Vintage Cars','1:18','Autoart Studio Design','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine','9354','58.48','127.13'),
 ('S18_2432','1926 Ford Fire Engine','Trucks and Buses','1:18','Carousel DieCast Legends','Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.','2018','24.92','60.77'),
 ('S18_2581','P-51-D Mustang','Planes','1:72','Gearbox Collectibles','Has retractable wheels and comes with a stand','992','49','84.48'),
 ('S18_2625','1936 Harley Davidson El Knucklehead','Motorcycles','1:18','Welly Diecast Productions','Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.','4357','24.23','60.57'),
 ('S18_2795','1928 Mercedes-Benz SSK','Vintage Cars','1:18','Gearbox Collectibles','This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.','548','72.56','168.75'),
 ('S18_2870','1999 Indy 500 Monte Carlo SS','Classic Cars','1:18','Red Start Diecast','Features include opening and closing doors. Color: Red','8164','56.76','132'),
 ('S18_2949','1913 Ford Model T Speedster','Vintage Cars','1:18','Carousel DieCast Legends','This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.','4189','60.78','101.31'),
 ('S18_2957','1934 Ford V8 Coupe','Vintage Cars','1:18','Min Lin Diecast','Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System','5649','34.35','62.46'),
 ('S18_3029','1999 Yamaha Speed Boat','Ships','1:18','Min Lin Diecast','Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.','4259','51.61','86.02'),
 ('S18_3136','18th Century Vintage Horse Carriage','Vintage Cars','1:18','Red Start Diecast','Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts. This collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.','5992','60.74','104.72'),
 ('S18_3140','1903 Ford Model A','Vintage Cars','1:18','Unimax Art Galleries','Features opening trunk,  working steering system','3913','68.3','136.59'),
 ('S18_3232','1992 Ferrari 360 Spider red','Classic Cars','1:18','Unimax Art Galleries','his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','8347','77.9','169.34'),
 ('S18_3233','1985 Toyota Supra','Classic Cars','1:18','Highway 66 Mini Classics','This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box','7733','57.01','107.57'),
 ('S18_3259','Collectable Wooden Train','Trains','1:18','Carousel DieCast Legends','Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.','6450','67.56','100.84'),
 ('S18_3278','1969 Dodge Super Bee','Classic Cars','1:18','Min Lin Diecast','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','1917','49.05','80.41'),
 ('S18_3320','1917 Maxwell Touring Car','Vintage Cars','1:18','Exoto Designs','Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System','7913','57.54','99.21'),
 ('S18_3482','1976 Ford Gran Torino','Classic Cars','1:18','Gearbox Collectibles','Highly detailed 1976 Ford Gran Torino Starsky and Hutch diecast model. Very well constructed and painted in red and white patterns.','9127','73.49','146.99'),
 ('S18_3685','1948 Porsche Type 356 Roadster','Classic Cars','1:18','Gearbox Collectibles','This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap, and 4 opening doors.','8990','62.16','141.28'),
 ('S18_3782','1957 Vespa GS150','Motorcycles','1:18','Studio M Art Models','Features rotating wheels, working kick stand. Comes with stand.','7689','32.95','62.17'),
 ('S18_3856','1941 Chevrolet Special Deluxe Cabriolet','Vintage Cars','1:18','Exoto Designs','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.','2378','64.58','105.87'),
 ('S18_4027','1970 Triumph Spitfire','Classic Cars','1:18','Min Lin Diecast','Features include opening and closing doors. Color: White.','5545','91.92','143.62'),
 ('S18_4409','1932 Alfa Romeo 8C2300 Spider Sport','Vintage Cars','1:18','Exoto Designs','This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.','6553','43.26','92.03'),
 ('S18_4522','1904 Buick Runabout','Vintage Cars','1:18','Exoto Designs','Features opening trunk,  working steering system','8290','52.66','87.77'),
 ('S18_4600','1940s Ford truck','Trucks and Buses','1:18','Motor City Art Classics','This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940 s Pick-Up truck is painted in classic dark green color, and features rotating wheels.','3128','84.76','121.08'),
 ('S18_4668','1939 Cadillac Limousine','Vintage Cars','1:18','Studio M Art Models','Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles','6645','23.14','50.31'),
 ('S18_4721','1957 Corvette Convertible','Classic Cars','1:18','Classic Metal Creations','1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.','1249','69.93','148.8'),
 ('S18_4933','1957 Ford Thunderbird','Classic Cars','1:18','Studio M Art Models','This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.','3209','34.21','71.27'),
 ('S24_1046','1970 Chevy Chevelle SS 454','Classic Cars','1:24','Unimax Art Galleries','This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.','1005','49.24','73.49'),
 ('S24_1444','1970 Dodge Coronet','Classic Cars','1:24','Highway 66 Mini Classics','1:24 scale die-cast about 18 inches long doors open, hood opens and rubber wheels','4074','32.37','57.8'),
 ('S24_1578','1997 BMW R 1100 S','Motorcycles','1:24','Autoart Studio Design','Detailed scale replica with working suspension and constructed from over 70 parts','7003','60.86','112.7'),
 ('S24_1628','1966 Shelby Cobra 427 S/C','Classic Cars','1:24','Carousel DieCast Legends','This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it own display case.','8197','29.18','50.31'),
 ('S24_1785','1928 British Royal Navy Airplane','Planes','1:24','Classic Metal Creations','Official logos and insignias','3627','66.74','109.42'),
 ('S24_1937','1939 Chevrolet Deluxe Coupe','Vintage Cars','1:24','Motor City Art Classics','This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.','7332','22.57','33.19'),
 ('S24_2000','1960 BSA Gold Star DBD34','Motorcycles','1:24','Highway 66 Mini Classics','Detailed scale replica with working suspension and constructed from over 70 parts','15','37.32','76.17'),
 ('S24_2011','18th century schooner','Ships','1:24','Carousel DieCast Legends','All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.','1898','82.34','122.89'),
 ('S24_2022','1938 Cadillac V-16 Presidential Limousine','Vintage Cars','1:24','Classic Metal Creations','This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.','2847','20.61','44.8'),
 ('S24_2300','1962 Volkswagen Microbus','Trucks and Buses','1:24','Autoart Studio Design','This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.','2327','61.34','127.79'),
 ('S24_2360','1982 Ducati 900 Monster','Motorcycles','1:24','Highway 66 Mini Classics','Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand','6840','47.1','69.26'),
 ('S24_2766','1949 Jaguar XK 120','Classic Cars','1:24','Classic Metal Creations','Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','2350','47.25','90.87'),
 ('S24_2840','1958 Chevy Corvette Limited Edition','Classic Cars','1:24','Carousel DieCast Legends','The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.','2542','15.91','35.36'),
 ('S24_2841','1900s Vintage Bi-Plane','Planes','1:24','Autoart Studio Design','Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.','5942','34.25','68.51'),
 ('S24_2887','1952 Citroen-15CV','Classic Cars','1:24','Exoto Designs','Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.','1452','72.82','117.44'),
 ('S24_2972','1982 Lamborghini Diablo','Classic Cars','1:24','Second Gear Diecast','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','7723','16.24','37.76'),
 ('S24_3151','1912 Ford Model T Delivery Wagon','Vintage Cars','1:24','Min Lin Diecast','This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.','9173','46.91','88.51'),
 ('S24_3191','1969 Chevrolet Camaro Z28','Classic Cars','1:24','Exoto Designs','1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.','4695','50.51','85.61'),
 ('S24_3371','1971 Alpine Renault 1600s','Classic Cars','1:24','Welly Diecast Productions','This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','7995','38.58','61.23'),
 ('S24_3420','1937 Horch 930V Limousine','Vintage Cars','1:24','Autoart Studio Design','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system','2902','26.3','65.75'),
 ('S24_3432','2002 Chevy Corvette','Classic Cars','1:24','Gearbox Collectibles','The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.','9446','62.11','107.08'),
 ('S24_3816','1940 Ford Delivery Sedan','Vintage Cars','1:24','Carousel DieCast Legends','Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.','6621','48.64','83.86'),
 ('S24_3856','1956 Porsche 356A Coupe','Classic Cars','1:18','Classic Metal Creations','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.','6600','98.3','140.43'),
 ('S24_3949','Corsair F4U ( Bird Cage)','Planes','1:24','Second Gear Diecast','Has retractable wheels and comes with a stand. Official logos and insignias.','6812','29.34','68.24'),
 ('S24_3969','1936 Mercedes Benz 500k Roadster','Vintage Cars','1:24','Red Start Diecast','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.','2081','21.75','41.03'),
 ('S24_4048','1992 Porsche Cayenne Turbo Silver','Classic Cars','1:24','Exoto Designs','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.','6582','69.78','118.28'),
 ('S24_4258','1936 Chrysler Airflow','Vintage Cars','1:24','Second Gear Diecast','Features opening trunk,  working steering system. Color dark green.','4710','57.46','97.39'),
 ('S24_4278','1900s Vintage Tri-Plane','Planes','1:24','Unimax Art Galleries','Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.','2756','36.23','72.45'),
 ('S24_4620','1961 Chevrolet Impala','Classic Cars','1:18','Classic Metal Creations','This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.','7869','32.33','80.84'),
 ('S32_1268','1980s GM Manhattan Express','Trucks and Buses','1:32','Motor City Art Classics','This 1980s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.','5099','53.93','96.31'),
 ('S32_1374','1997 BMW F650 ST','Motorcycles','1:32','Exoto Designs','Features official die-struck logos and baked enamel finish. Comes with stand.','178','66.92','99.89'),
 ('S32_2206','1982 Ducati 996 R','Motorcycles','1:32','Gearbox Collectibles','Features rotating wheels , working kick stand. Comes with stand.','9241','24.14','40.23'),
 ('S32_2509','1954 Greyhound Scenicruiser','Trucks and Buses','1:32','Classic Metal Creations','Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos','2874','25.98','54.11'),
 ('S32_3207','1950 ''s Chicago Surface Lines Streetcar','Trains','1:32','Gearbox Collectibles','This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).','8601','26.72','62.14'),
 ('S32_3522','1996 Peterbilt 379 Stake Bed with Outrigger','Trucks and Buses','1:32','Red Start Diecast','This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab','814','33.61','64.64'),
 ('S32_4289','1928 Ford Phaeton Deluxe','Vintage Cars','1:32','Highway 66 Mini Classics','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system','136','33.02','68.79'),
 ('S32_4485','1974 Ducati 350 Mk3 Desmo','Motorcycles','1:32','Second Gear Diecast','This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand','3341','56.13','102.05'),
 ('S50_1341','1930 Buick Marquette Phaeton','Vintage Cars','1:50','Studio M Art Models','Features opening trunk,  working steering system','7062','27.06','43.64'),
 ('S50_1392','Diamond T620 Semi-Skirted Tanker','Trucks and Buses','1:50','Highway 66 Mini Classics','This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.','1016','68.29','115.75'),
 ('S50_1514','1962 City of Detroit Streetcar','Trains','1:50','Classic Metal Creations','This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).','1645','37.49','58.58'),
 ('S50_4713','2002 Yamaha YZR M1','Motorcycles','1:50','Autoart Studio Design','Features rotating wheels , working kick stand. Comes with stand.','600','34.17','81.36'),
 ('S700_1138','The Schooner Bluenose','Ships','1:700','Autoart Studio Design','All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.\r\nThe schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.','1897','34','66.67'),
 ('S700_1691','American Airlines: B767-300','Planes','1:700','Min Lin Diecast','Exact replia with official logos and insignias and retractable wheels','5841','51.15','91.34'),
 ('S700_1938','The Mayflower','Ships','1:700','Studio M Art Models','Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches Wide\r\nAll wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.','737','43.3','86.61'),
 ('S700_2047','HMS Bounty','Ships','1:700','Unimax Art Galleries','Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches Wide. \r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.','3501','39.83','90.52'),
 ('S700_2466','America West Airlines B757-200','Planes','1:700','Motor City Art Classics','Official logos and insignias. Working steering system. Rotating jet engines','9653','68.8','99.72'),
 ('S700_2610','The USS Constitution Ship','Ships','1:700','Red Start Diecast','All wood with canvas sails. Measures 31 1/2 inches Length x 22 3/8 inches High x 8 1/4 inches Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.','7083','33.97','72.28'),
 ('S700_2824','1982 Camaro Z28','Classic Cars','1:18','Carousel DieCast Legends','Features include opening and closing doors. Color: White. \r\nMeasures approximately 9 1/2 inches Long.','6934','46.53','101.15'),
 ('S700_2834','ATA: B757-300','Planes','1:700','Highway 66 Mini Classics','Exact replia with official logos and insignias and retractable wheels','7106','59.33','118.65'),
 ('S700_3167','F/A 18 Hornet 1/72','Planes','1:72','Motor City Art Classics','10 inches Wingspan with retractable landing gears.Comes with pilot','551','54.4','80'),
 ('S700_3505','The Titanic','Ships','1:700','Carousel DieCast Legends','Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.','1956','51.09','100.17'),
 ('S700_3962','The Queen Mary','Ships','1:700','Welly Diecast Productions','Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.','5088','53.63','99.31'),
 ('S700_4002','American Airlines: MD-11S','Planes','1:700','Second Gear Diecast','Polished finish. Exact replia with official logos and insignias and retractable wheels','8820','36.27','74.03'),
 ('S72_1253','Boeing X-32A JSF','Planes','1:72','Motor City Art Classics','10 inches Wingspan with retractable landing gears.Comes with pilot','4857','32.77','49.66'),
 ('S72_3212','Pont Yacht','Ships','1:72','Unimax Art Galleries','Measures 38 inches Long x 33 3/4 inches High. Includes a stand. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged','414','33.3','54.6');

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
