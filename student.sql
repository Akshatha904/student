#create database
create database student;     

use student;

#create tables
create table students(
	    id int not null primary key,
		name varchar(20) not null,
		gender enum('M','F'),
		phone_no varchar(10),
		CHECK (regexp_like(phone_no, '[6|7|8|9]{1}[0-9]{9}')),
		birth_date date,
		city varchar(30),
		year_enroll int
		);

create table department(
		dept_Id varchar(10) not null primary key,
		dept_name enum('CSE','HR','EC','MECH')
		);

create table instructor(
		instru_id int not null primary key,
		instru_name varchar(20) not null,
		dept_Id varchar(10),
		foreign key  (dept_id) references department(dept_id) on update cascade on delete cascade
		);

create table course(
		course_id varchar(10) not null primary key,
		id int,
		instru_id int,
		foreign key  (id) references students(id) on update cascade on delete cascade,
		foreign key  (instru_id) references instructor(instru_id) on update cascade on delete cascade
		);

#Insert values
insert into students values(101,'Anu','F','7098764387','2000-08-23','Bangalore',2020);
insert into students values(105,'Sagar','M','8998764387','2001-05-20','Chennai',2021);
insert into students values(103,'Manya','F','9675364311','2000-01-31','Bangalore',2020);
insert into students values(102,'Vivek','M','8948764382','2001-02-04','Bangalore',2021);
insert into students values(106,'Shilpa','F','7098764348','2000-04-29','Chennai',2020);

insert into department values('CSE10','CSE');
insert into department values('HR11','HR');
insert into department values('EC12','EC');
insert into department values('MECH13','MECH');

insert into instructor values(11,'Abi','CSE10');
insert into instructor values(12,'Manoj','EC12');
insert into instructor values(13,'Sandya','HR11');
insert into instructor values(14,'Prema','MECH13');

insert into course values(20201,101,11);
insert into course values(20211,105,12);
insert into course values(20212,102,13);
insert into course values(20202,106,14);

#Update statement
update students set year_enroll=2022 where year_enroll=2021;

#delete statement
delete from students where id=102;

#Set foreing key value to 0
set FOREIGN_KEY_CHECKS = 0;

#delete all records
truncate table course;
truncate table instructor;
truncate table department;
truncate table students;

#remove table 
drop table course;
drop table instructor;
drop table department;
drop table students;

#remove database
drop database student;



