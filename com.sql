use db;
select * from fifa limit 5;

#How many players are there in the dataset?
select count(*) as cnt from fifa;

#How many nationalities do these players belong to
select distinct nationality as unq from fifa;

#What is the total wage given to all players? What's the average and standard deviation?
select sum(wage) as totalwage, 
avg(wage) as avgwage,
stddev(wage) as stdwage
from fifa;

#Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
select nationality,count(*) as d from fifa group by 1 order by d desc limit 3 ;

#Which player has the highest wage? Who has the lowest?
select name,wage from fifa where wage=(select max(wage) from fifa);
select name,max(wage) from fifa group by 1;

select name , wage from fifa where wage=(select min(wage) from fifa) limit 2;

#The player having the – best overall rating? Worst overall rating?
select name,overall from fifa where overall=(select max(overall) from fifa);
select name,overall from fifa where overall= (select min(overall) from fifa) ;

#Club having the highest total of overall rating? Highest Average of overall rating?
select club,max(overall) as m ,avg(overall) as a from fifa group by 1 order by a desc;

#What is the distribution of players whose preferred foot is left vs right?
select count(preferred_foot) as lefties from fifa where preferred_foot="left";
SELECT preferred_foot, COUNT(*) AS player_count
FROM fifa
GROUP BY preferred_foot;

#What is the frequency distribution of nationalities among players whose club name starts with M?

SELECT nationality,name, COUNT(*) AS player_count
FROM fifa
WHERE club LIKE 'M%'
GROUP BY nationality,name
ORDER BY player_count DESC;

#How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019 (both inclusive)?
select club,joined,count(*) from fifa where joined between "20-05-2018" and "10-04-2019"
group by 1,2;

#How many players have joined their respective clubs date wise?

select club, joined , count(*) from fifa group by joined, club
order by 1,2 desc;

select club,joined,count(*) from fifa where joined=substring("joined",7,4)
group by 1;

#How many players have joined their respective clubs yearly?

SELECT club,SUBSTRING(joined, 7, 4) , COUNT(*) AS players_joined
FROM fifa
GROUP BY 1,2
ORDER BY players_joined DESC;

SELECT 
  club, 
  SUBSTRING(joined, 7, 4) AS join_year,
  COUNT(*) AS players_joined
FROM fifa
GROUP BY club, SUBSTRING(joined, 7, 4)
ORDER BY players_joined DESC;
