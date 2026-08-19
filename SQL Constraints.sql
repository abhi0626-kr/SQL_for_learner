
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
	unique       -- Ensure that all values are different in the column or table(not Allow null value & duplicate value) ,
	primary key  -- A combination of the (Not null and Unique value) is called primary key(not Allow null value & duplicate value),
	foreign key  -- A relation between two or more tables using primary key(Allow null value & duplicate value),
	check		 -- Check Constraints helps to check the condition is satisfies (age >=18, only allowed),
	default		 -- Sets a default value for a column if no value is specified, (date = default date(current date)) Allow null value,
	create index -- Primary key is Cluster index, non Cluster index,
	null		 -- 