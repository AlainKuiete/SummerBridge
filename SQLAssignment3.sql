-- Creating the database

create database key_card_system;
use key_card_system;

drop table if exists rooms;
drop table if exists groupe;
drop table if exists users;
drop table if exists deserves;

-- Creating the tables for the database
create table rooms(
id int auto_increment primary key,
r_name varchar(20)
);

create table groupe(
id int auto_increment primary key,
g_name varchar(20)
);

create table users(
id int auto_increment primary key,
u_name varchar(20),
g_id int,
foreign key(g_id) references groupe(id)
);

create table deserves(
id int auto_increment primary key,
r_id int,
g_id int,
foreign key(r_id) references rooms(id),
foreign key(g_id) references groupe(id)
);

-- Inserting data in my database
insert into rooms (r_name)
values("101"), ("102"), ("Auditorium A"), ("Auditorium B");

insert into groupe (g_name)
values ("I.T."), ("Sales"), ("Administration"), ("Operation");

insert into users(u_name, g_id)
values ("Modesto", 1), ("Ayine", 1), ("Christopher", 2), ("Cheon woo", 2), ("Saulat", 3);

insert into users(u_name) value ("Heidy");
insert into deserves (r_id, g_id)
values (1, 1), (2, 1), (2, 2), (3, 2);


select * from users;
select * from groupe;

-- Select all groups
select gp.g_name as group_names, us.u_name as usernames from groupe gp
left join users us on us.g_id = gp.id;

/*
group_names 	usernames
I.T.			Modesto
I.T.			Ayine
Sales			Christopher
Sales			Cheon woo
Administration	Saulat
Operation	
*/

select *from rooms;

-- Select all rooms
select rm.r_name as rooms, gp.g_name as group_names 
from deserves ds
right join rooms rm on rm.id = ds.r_id
left join groupe gp on gp.id = ds.g_id;

/*
rooms			group_names
101				I.T.
102				I.T.
102				Sales
Auditorium A	Sales
Auditorium B	
*/

-- Select a list of users
 select us.u_name as usernames, gp.g_name as group_names, rm.r_name as rooms 
 from deserves ds
join rooms rm on rm.id = ds.r_id
join groupe gp on gp.id = ds.g_id
join users us on us.g_id = gp.id
order by usernames, group_names, rooms;

/*
usernames	group_names	rooms
Ayine		I.T.		101
Ayine		I.T.		102
Cheon woo	Sales		102
Cheon woo	Sales		Auditorium A
Christopher	Sales		102
Christopher	Sales		Auditorium A
Modesto		I.T.		101
Modesto		I.T.		102
*/


