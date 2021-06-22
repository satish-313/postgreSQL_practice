-- show all db in database
\l -- list all database inside database

-- in postgres we can use upper or lower case it did't matter, upper case kind of most excepted.
-- create the database
create database name;

-- move inside a database
\c database_name -- \c mean connect
\connect database_name

-- list all table
\dt
-- list with more info
\dt+

-- drop table or delete table
drop table table_name;

-- create table in sql
create table users(
  id serial primary key,
  first_name varchar(255) not null,
  last_name text,
  age int,
  salary float,
  email text not null unique,
  user_status boolean default false
);
-- note normally in sql all table should be plural eg.. create table users;
-- varchar is for store string but needed specify length.
-- text is allround for text didn't specify the length
-- int for storing integer, for storing float use float
-- other constrain like not null and unique as name represent

-- insert data in tables
insert into users (first_name,last_name,age,salary,email) values ('satish','kumar',23,30345.56,'satish@gmail.com');

-- to see what inside the table use select
select first_name from users;

-- to see all column in table
select * from users;

-- alterning table 
-- drop a column 
alter table users drop column age;

-- add column in table 
alter table users add column age int default 18;
-- adding a column kind of tricky, first if we didn't specify the default it don't 
-- thorw error but the type is int and have null property it thorw error after query if a function need a data.
-- second if specify not null, it thorw error because previous data don't have age column it thorw a contrain error.
-- default kind of ok didn't break entire server and work fine.

-- condition in database
/* where */
select * from users where id = 1;
select * from users where id = 1 or first_name = 'satish';
select * from users where first_name = 'satish' and age = 23;
select * from users where id in (0,1); -- find a data in array or list.
select * from users where age > 10;

-- for selecting null column data we can use coalensce(age,15(find of default)) > 10;
select * from users where coalesce(age, 15) > 10;

-- update 
update users set age = 20 where email='satish@gmail.com';
-- to increment or increase
update users set age = age + 1 , last_name = 'kumari' where first_name='satishi';
-- to append string
update users set age = 22 , last_name = last_name || ' pradhan' where id = 4;

-- delete row in table
delete from users where age is null;

-- foreign key contrain
create table posts(
  id serial primary key,
  title text not null,
  body text default('...'),
  creator_id int references users(id) not null
  -- "creatorId" int reference users(id) not null
);

insert into posts (title,creator_id) values ( 'hello world!',1);
insert into posts (title,"creatorId") values ( 'hello world!',1);

-- if foreign key doesn't exist it thorw error.
-- if user has a foreign key in another table it thorw error doesn't delete

/* inner join */
select u.first_name creator_name,p.title title, p.body from users u inner join posts p on u.id = p.creator_id;