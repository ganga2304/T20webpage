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



-- Players table

INSERT INTO players (name, age, position, team_id,created_at,updated_at) VALUES
                                                       ('Player 1', 25, 'Forward', 1,now(),now()),
                                                       ('Player 2', 30, 'Midfielder', 1,now(),now()),
                                                       ('Player 3', 22, 'Defender', 2,now(),now()),
                                                       ('Player 4', 27, 'Goalkeeper', 2,now(),now()),
                                                       ('Player 5', 24, 'Forward', 3,now(),now()),
                                                       ('Player 6', 29, 'Midfielder', 3,now(),now()),
                                                       ('Player 7', 21, 'Defender', 4,now(),now()),
                                                       ('Player 8', 26, 'Goalkeeper', 4,now(),now()),
                                                       ('Player 9', 23, 'Forward', 5,now(),now()),
                                                       ('Player 10', 28, 'Midfielder', 5,now(),now()),
                                                       ('Player 11', 31, 'Defender', 6,now(),now()),
                                                       ('Player 12', 20, 'Goalkeeper', 6,now(),now()),
                                                       ('Player 13', 22, 'Forward', 7,now(),now()),
                                                       ('Player 14', 24, 'Midfielder', 7,now(),now()),
                                                       ('Player 15', 26, 'Defender', 8,now(),now()),
                                                       ('Player 16', 25, 'Goalkeeper', 8,now(),now()),
                                                       ('Player 17', 29, 'Forward', 9,now(),now()),
                                                       ('Player 18', 27, 'Midfielder', 9,now(),now()),
                                                       ('Player 19', 21, 'Defender', 10,now(),now()),
                                                       ('Player 20', 30, 'Goalkeeper', 10,now(),now()),
                                                       ('Player 21', 23, 'Forward', 1,now(),now()),
                                                       ('Player 22', 25, 'Midfielder', 2,now(),now()),
                                                       ('Player 23', 28, 'Defender', 3,now(),now()),
                                                       ('Player 24', 31, 'Goalkeeper', 4,now(),now()),
                                                       ('Player 25', 20, 'Forward', 5,now(),now()),
                                                       ('Player 26', 22, 'Midfielder', 6,now(),now()),
                                                       ('Player 27', 27, 'Defender', 7,now(),now()),
                                                       ('Player 28', 29, 'Goalkeeper', 8,now(),now()),
                                                       ('Player 29', 24, 'Forward', 9,now(),now()),
                                                       ('Player 30', 26, 'Midfielder', 10,now(),now());