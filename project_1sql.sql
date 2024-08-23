create database sqlPrj1;
use sqlPrj1;

show tables;

create table olympics(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(350),
NOC varchar(100),
Games varchar(500),
Year int,
Season varchar(400),
City varchar(300),
Sport varchar(500),
Event varchar(400),
Medal varchar(200));

select * from olympics;

show variables like "secure_file_priv";


load data infile "C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/Athletes_Transformed.csv"
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympics;



-- SQL PROJECT

-- 1. Show how many medal counts present for entire data

select medal,count(*) as medalcount 
from olympics
where medal <> 'NoMedal'
group by medal
limit 5;

-- 2. Show count of unique sports present in Olympics
select count(distinct sport)as unique_sports_count
from olympics;

-- 3. Show how many different medals won by team India
select medal, count(*) as medal
from olympics
where team='India'
group by medal;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select event, count(*) as medalcount
from olympics
where team='India'
group by event
order by medalcount desc;


-- 5. Show event wise medals won by India in order of year
select year, event, count(*) as medalcount
from olympics
where team='India'
group by year, event
order by year desc;

-- 6. show country who won maximum medals.
select team ,count(*) as medalcount
from olympics
group by team
order by medalcount desc
limit 1;



-- 7.show top 10 countries who won gold
select team, count(*) as gold
from olympics
where medal='gold'
group by team
order by gold desc
limit 10;


--  8. show in which year did United states won most gold medal
select year, count(*) as gold
from olympics
where team='united states'
group by  year
order by gold desc
limit 1;


-- 9. In which sports United States has most medals.
select sport, count(*) as medal
from olympics
where team='united states'
group by sport
order by medal desc
limit 5;


-- 10. Find top three players who won most medals along with their sports and country

select name, sport, team , count(*) as medal
from olympics
group by name, sport,team
order by medal desc
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.

select  name,team, count(*) as gold_medal
from olympics
where sport='cycling' and medal='gold'
group by name,team
order by gold_medal desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.

select name,team, medal, count(*) as total_medals
from olympics
where sport='basketball'
group by medal,name,team
order by total_medals desc
limit 10;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards

select medal, count(*) as medal_count
from olympics
where name='Teresa Edwards' and sport='basketball'
group by medal;


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select year,sex, count(*) as medals
from olympics
group by year, sex
order by year,sex;









