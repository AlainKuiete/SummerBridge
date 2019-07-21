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


/* ANSWERS 

QUESTION 1

year,month,day,dep_time,dep_delay,arr_time,arr_delay,carrier,tailnum,flight,origin,dest,air_time,distance,hour,minute
2013,1,1,857,-3,1516,-14,HA,N380HA,51,JFK,HNL,659,4983,9,57

QUESTION 2
QUESTION 2A
engines
2
1
4
3

QUESTION 2B
engines = 1
tailnum,year,type,manufacturer,model,engines,seats,speed,engine
N567AA,1959,"Fixed wing single engine",DEHAVILLAND,"OTTER DHC-3",1,16,95,Reciprocating

engines = 2
tailnum,year,type,manufacturer,model,engines,seats,speed,engine
N206UA,1999,"Fixed wing multi engine",BOEING,777-222,2,400,NULL,Turbo-fan

engines = 3
tailnum,year,type,manufacturer,model,engines,seats,speed,engine
N854NW,2004,"Fixed wing multi engine",AIRBUS,A330-223,3,379,NULL,Turbo-fan

engines = 4
tailnum,year,type,manufacturer,model,engines,seats,speed,engine
N670US,1990,"Fixed wing multi engine",BOEING,747-451,4,450,NULL,Turbo-jet


QUESTION 3
count(*)
336776


QUESTION 4
carrier,tot_flights
UA,58665
AA,32729
B6,54635
DL,48110
EV,54173
MQ,26397
US,20536
WN,12275
VX,5162
FL,3260
AS,714
9E,18460
F9,685
HA,342
YV,601
OO,32


QUESTION 5
carrier,num_flights
UA,58665
B6,54635
EV,54173
DL,48110
AA,32729
MQ,26397
US,20536
9E,18460
WN,12275
VX,5162
FL,3260
AS,714
F9,685
YV,601
HA,342
OO,32


QUESTION 6
carrier,num_flights
UA,58665
B6,54635
EV,54173
DL,48110
AA,32729


QUESTION 7
carrier,num_flights
UA,41135
B6,30022
DL,28096
AA,23583
EV,6248


QUESTION 8
a)
name,alt
"Imperial Co",-54
"El Centro Naf",-42

b)
carrier,tot_delay
AS,-7041
HA,-2365
OO,346



*/



