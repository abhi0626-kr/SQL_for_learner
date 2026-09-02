
-- SQL Constraints.
-- SQL Constraints are used to specify the Rule for the Column in table,


-- Syntax :-

create table table_name(
	column1 datatype Constraint,
	column2 datatype Constraint,
	column3 datatype Constraint
	);

-- Example key words :-
	not null     -- The field should be filled with value, (Not allow null values),
	unique       -- Ensure that all values are different in the column or table(Allow one null value & duplicate value) ,
	primary key  -- A combination of the (Not null and Unique value) is called primary key(not Allow null value & duplicate value),
	foreign key  -- A relation between two or more tables using primary key(Allow null value & duplicate value),
	check		 -- Check Constraints helps to check the condition is satisfies (age >=18, only allowed),
	default		 -- Sets a default value for a column if no value is specified, (date = default date(current date)) Allow null value,
	create index -- Primary key is Cluster index, non Cluster index.


--unique_key---------------------------------------------------------------------------

-- method one for unique_key-----------------------------
create table unique_Key_concepts(
	ID int unique,
	Roll_no smallint unique,
	Email_ID varchar(30),
	Name_ varchar(200) not null,
	Age int
	);

--Alter the normal column to unique key column.
alter table unique_Key_concepts
add unique (Age);


-- Method two
create table unique_Key_concepts1(
	ID int ,
	Roll_no smallint ,
	Email_ID varchar(30),
	Name_ varchar(200) not null,
	Age int,
	constraint UK_ID unique (ID),
	constraint UK_Roll_no unique (Roll_no)
	);

--Removing the constraint
alter table unique_Key_concepts1
drop constraint UK_ID unique (ID);

drop table unique_Key_concepts;
sp_help unique_Key_concepts;


-- Primary KEy------------------------------------------------------------------------

--Method one without constranit
create table primary_key_concepts(
	ID int primary key,
	First_name varchar(200) not null,
	last_name varchar(200),
	Age int
	);

sp_help primary_Key_concepts;


-- Method two with constranit
create table primary_key_concepts1(
	ID int,
	First_name varchar(200) not null,
	last_name varchar(200),
	Age int,
	constraint PK_User primary key(ID,last_name)
	);


--DROP constranit....
alter table primary_Key_concepts1
drop constraint PK_User unique (ID);

sp_help primary_Key_concepts1;



--Check Constranit-------------------------------------------------------

create table check_concepts(
	ID int primary key,
	First_name varchar(200) not null,
	last_name varchar(200),
	Age int check (Age>=18) --check constraint
	);

insert into check_concepts values
	(101, 'Toji', 'Fosigoro', 18);

insert into check_concepts values
	(102, 'Gojo', '', 17);

alter table check_concepts
add constraint check_age check(Age>=18);

alter table check_concepts
drop constraint check_age check(Age>=18);


-- Default constraint-----------------------------------------------------------------------------

create table Default_concepts(
	ID int primary key,
	First_name varchar(200) not null,
	last_name varchar(200),
	Age int,
	city varchar(100) default 'Bangalore'
	);

alter table Default_concepts
add constraint df_city
default 'Bangalore' for city;

alter table Default_concepts
alter column city drop default;



--Foreign_Key constraint---------------------------------------------------------------------------------

--0. Create a Database.
create database Foreign_Key;
use Foreign_Key;
--1. Parent Table -> Country

create table country (
country_ID int primary key,
country_Name varchar(50) not null
);



--2. Depends on country -> States

create table States (
State_ID int primary key,
State_Name varchar(50) not null,
country_ID int not null,
constraint FK_State_country foreign key (country_ID)
references country(country_ID)
);


--3. Depends on State -> City

create table City (
City_ID int primary key,
City_Name varchar(50) not null,
State_ID int not null,
constraint FK_City_State foreign key (State_ID)
references States(State_ID)
);


--4. Depends on City -> Customer's
drop table Customer_details;

create table Customer_details (
Customer_ID int primary key,
Customer_Name varchar(50) not null,
City_ID int not null,
constraint FK_Customer_City foreign key (City_ID)
references City(City_ID)
);

--5. Depends on Customer's -> Order Details.

create table Order_details (
Order_ID varchar(50) primary key,
product_Name varchar(50) not null,
number_of_items int not null,
Customer_ID int not null,
constraint FK_Order_details foreign key (Customer_ID)
references Customer_details(Customer_ID)
);


--Inserting a new value into country
insert into country values (01, 'India'),(02, 'Japan');
select * from country;

--Inserting a new value into States
insert into States values (001, 'TamilNadu',01),(002, 'Tokyo',02);
select * from States;

--Inserting a new value into City
insert into City values (0001, 'Chennai',001),(0002, 'Hiroshima nagasai',002);
select * from City;

--Inserting a new value into Customer_details
insert into Customer_details values (00001, 'Toji',0001),(00002, 'Sukuna',0002);
select * from Customer_details;

--Inserting a new value into Order_details
insert into Order_details values ('ODR_01', 'Whey protine', 2, 1),('ODR_02', 'Creatine', 1, 2);