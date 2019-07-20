/* SUMMER BRIDGE ASSIGNMENT WEEK 1 SQL */
/* ASSIGNMENT SQL SELECT AND AGGREGATIONS */
describe airlines;
describe airports;
describe flights;
describe planes;
describe weather;

select * from airlines
limit 5;
select * from airports
limit 5;
select * from flights
limit 5;
select * from planes
limit 5;
select * from weather
limit 5;

-- Question 1 --
select * from flights
order by distance desc
limit 1;

-- Question 2 --
-- 1st part
select distinct engines from planes;
-- or 
select * from planes 
group by engines;

-- 2nd part
select * from planes
where engines = 1
order by seats desc;

select * from planes
where engines = 2
order by seats desc;

select * from planes
where engines = 3
order by seats desc;

select * from planes
where engines = 4
order by seats desc;

-- Question 3
select count(*) from flights;

-- Question 4 
select carrier, count(*) as tot_flights
from flights
group by carrier;

-- Question 5
select carrier, count(*) as num_flights 
from flights
group by carrier
order by num_flights desc;

-- Question 6
select carrier, count(*) as num_flights 
from flights
group by carrier
order by num_flights desc
limit 5;

-- Question 7
select carrier, count(*) as num_flights 
from flights
where distance > 1000
group by carrier
order by num_flights desc
limit 5;

-- Question 8
-- Question a) Find the 2 lowest altitudes(alt) and the airport name in the airports table. 
select name, alt from airports
order by alt
limit 2;

-- Question b) Find the three most carriers in the fligths table that have  
-- the minimun total of arrival delay
select carrier, sum(arr_delay)  as tot_delay
from flights
group by carrier
order by tot_delay
limit 3;





