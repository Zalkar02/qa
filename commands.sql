create table projects_manager (id int not null primary key auto_increment, 
	name varchar(255) not null, last_name varchar(255), 
	date_birth date, gender varchar(10));

create table developers (id int not null primary key auto_increment,
	name varchar(255)not null, last_name varchar(255) not null,
	date_birth date, gender varchar(255), id_t int,
	constraint fk_projects_manager_developers foreign key (id_t) references projects_manager(id));

create table projects (id int not null primary key auto_increment, 
	name varchar(255) not null);

create table developers_projects (id int not null primary key auto_increment,
	id_s int, id_c int,
	constraint fk_developers_1 foreign key (id_s) references developers(id),
	constraint fk_projects_1 foreign key (id_c) references projects(id));

create table laptops (id int not null primary key auto_increment, 
	name varchar(255) not null, id_s int, unique key uid(id_s),
	constraint fk_loptops_developers foreign key (id_s) references developers(id));


insert into projects_manager values(null, "Ali", "Ibn Ahmad",'1990-02-24','M'), 
	(null, "Nurseit", "Omonaleev", '1988-12-04', 'M'),
	(null, "Nurizat", "Satybekova", '1992-04-28', 'F');

insert into developers values(null, "Aisana", "Mirlan kyzu", '1993-05-14', "F", 2),
	(null, "Eldar", "Rysbekov", '1995-10-09', "M", 2),
	(null, "Kanykey", "Nasakeeva", '1994-04-18', "F", 2),
	(null, "Nursultan", "Chushtukov", '1997-03-26', "M", 2),
	(null, "Erjan", "Ruslan uulu", '1990-12-27', "M", 1),
	(null, "Bermet", "Sadykova", '1996-06-03', "F", 1),
	(null, "Daneel", "Andashpekov", '1998-09-14', "M", 1),
	(null, "Saikal", "Mamanova", '1992-11-17', "F", 1),
	(null, "Nurlan", "Kubatbekov", '1987-07-06', "M", 3),
	(null, "Adina", "Nurmanova", '2000-01-18', "F", 3);

insert into projects values(null, "Project_1"), (null, "Project_2"), (null, "Project_3");

insert into developers_projects values(null, 1,1),(null, 2,1),(null, 3,1),(null, 4,1),(null, 5,1),
(null, 6,1),(null, 7,1),(null, 8,1),(null, 9,1),(null, 10,1),
(null, 1,2),(null, 2,2),(null, 3,2),(null, 4,2),(null, 5,2),
(null, 6,2),(null, 7,2),(null, 8,2),(null, 9,2),(null, 10,2),
(null, 1,3),(null, 2,3),(null, 3,3),(null, 4,3),(null, 5,3),
(null, 6,3),(null, 7,3),(null, 8,3),(null, 9,3),(null, 10,3);

insert into laptops values(null, "Asus", 1), (null, "Acer", 2),	(null, "Hp", 3),(null, "Dell", 4),
	(null, "Macbook", 5), (null, "Lenova", 6), (null, "Lenova", 7), (null, "Acer", 8),
	(null, "Hp", 9),(null, "Dell", 10);


select * from developers where year(date_birth) < 1995 and gender = "M";

select name, last_name from developers union select name, last_name from projects_manager;

select developers.name, last_name,projects.name from developers 
	join developers_projects on developers.id = id_s 
	join projects on projects.id = id_c;

select * from developers where to_days(date_birth)> 728659;

select gender , count(gender) as count from developers group by gender;

select name, count(name) as count from developers 
	where gender = "F" group by name;