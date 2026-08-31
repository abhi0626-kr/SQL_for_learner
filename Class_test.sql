create database class_test_sql;
use Class_test;

alter database Class_test modify name = class_test_sql;

use class_test_sql;

backup database class_test_sql
to disk = 'A:\Git commands\class_test_sql.bak'

use Abhishek;
drop database class_test_sql;

drop table stud_info;
create table stud_info(
	std_ID varchar(15) not null,
	s_name varchar(20),
	course text not null,
	P_year smallint,
	Addres text
	)

	
insert into stud_info values('s01', 'sukuna', 'sql', 2026, 'IND KA');
insert into stud_info values('s02', 'sukuna', 'sql', 2026, 'IND KA');
insert into stud_info values('s03', 'sukuna', 'sql', 2026, 'IND KA');
insert into stud_info values('s04', 'sukuna', 'sql', 2026, 'IND KA');
insert into stud_info values('s05', 'sukuna', 'sql', 2026, 'IND KA');
insert into stud_info values('s06', 'sukuna', 'sql', 2026, 'IND KA');
insert into stud_info values('s07', 'sukuna', 'sql', 2026, 'IND KA');
insert into stud_info values('s08', 'sukuna', 'sql', 2026, 'IND KA');
insert into stud_info values('s09', 'sukuna', 'sql', 2026, 'IND KA');
insert into stud_info values('s10', 'sukuna', 'sql', 2026, 'IND KA');

select * into stud_info_achive
from stud_info;

insert into stud_info_achive
select * from stud_info;


create table course_details(
	course text,
	fees money,
	J_date date,
	reviwes text
)

insert into course_details values('sql', 30000, '2026-08-20', 'All Good till now');
insert into course_details values('sql', 10000, '2026-08-20', 'All Good till now');
insert into course_details values('sql', 20000, '2026-08-20', 'All Good till now');
insert into course_details values('sql', 40000, '2026-08-20', 'All Good till now');
insert into course_details values('sql', 50000, '2026-08-20', 'All Good till now');
insert into course_details values('sql', 60000, '2026-08-20', 'All Good till now');
insert into course_details values('sql', 70000, '2026-08-20', 'All Good till now');
insert into course_details values('sql', 80000, '2026-08-20', 'All Good till now');
insert into course_details values('sql', 90000, '2026-08-20', 'All Good till now');
insert into course_details values('sql', 990000, '2026-08-20', 'All Good till now');

select * into course_details_achive
from course_details;

insert into course_details_achive
select * from course_details;


create table placment(
	interview bit,
	placment_date date,
	course text,
	job bit
)

select * from placment;
insert into placment values(1, '2026-01-10', 'sql', 0);
insert into placment values(0, '2026-01-10', 'sql', 0);
insert into placment values(1, '2026-01-10', 'sql', 1);
insert into placment values(0, '2026-01-10', 'sql', 1);
insert into placment values(1, '2026-01-10', 'sql', 0);
insert into placment values(0, '2026-01-10', 'sql', 1);
insert into placment values(1, '2026-01-10', 'sql', 0);
insert into placment values(0, '2026-01-10', 'sql', 1);
insert into placment values(1, '2026-01-10', 'sql', 0);
insert into placment values(0, '2026-01-10', 'sql', 0);
insert into placment values(0, '2026-01-10', 'sql', 0);

select * into placment_achive
from placment;

insert into placment_achive
select * from placment;