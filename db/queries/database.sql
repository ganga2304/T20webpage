-- create database t20_world_cup;

create table teams (
    id int AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(50) not null UNIQUE,
     country VARCHAR(50) NOT NULL,
     founded  YEAR);


insert into teams (name,country,founded) values ('Team A','USA',1901);

insert into teams (name,country) values ('Team B','UK');
insert into teams (name,country,founded) values ('Team C','Spain',1920);
insert into teams (name,country) values ('Team D','Germany');
insert into teams (name,country,founded) values ('Team E','Italy',1905);
insert into teams (name,country) values ('Team F','France');
insert into teams (name,country,founded) values ('Team G','Brazil',1910);
insert into teams (name,country,founded) values ('Team H','Argentina',1913);
insert into teams (name,country,founded) values ('Team I','Mexico',1922);
insert into teams (name,country) values ('Team J','Netherlands');


-- Retrieve all teams from the teams table.

select * from teams;

-- Retrieve a specific team by name.
select * from teams where name = "team J";

-- List all teams founded before a certain year.
select * from teams where founded < 1910;

-- Insert a new team into the teams table.

insert into teams (name,country,founded) values ('Team K','India',1939);

-- Update the country of a specific team.

update teams set country = 'Australia' where id = 2;

-- Delete a team by its name.

delete from teams where name = 'team F';