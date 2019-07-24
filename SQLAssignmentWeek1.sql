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
  dest origin distance
1  HNL    JFK     4983
The furthest destination is HNL with 4983 from JFK

QUESTION 2
QUESTION 2A
engines
2
1
4
3

QUESTION 2B Aircraft that has the must number of sits for each
engines number.
      model engines max.seats.
1  A330-223       3        379
2  A340-313       4        450
3 EMB-145XR       2        400
4       150       1         16


QUESTION 3 Total number of flights
count(*)
336776


QUESTION 4 Total number of flights by airline
   carrier tot_flights
1       UA       58665
2       AA       32729
3       B6       54635
4       DL       48110
5       EV       54173
6       MQ       26397
7       US       20536
8       WN       12275
9       VX        5162
10      FL        3260
11      AS         714
12      9E       18460
13      F9         685
14      HA         342
15      YV         601
16      OO          32

QUESTION 5 Airlines order by the number of flight in 
descending order.
  carrier num_flights
1       UA       58665
2       B6       54635
3       EV       54173
4       DL       48110
5       AA       32729
6       MQ       26397
7       US       20536
8       9E       18460
9       WN       12275
10      VX        5162
11      FL        3260
12      AS         714
13      F9         685
14      YV         601
15      HA         342
16      OO          32



QUESTION 6 
  carrier num_flights
1      UA       58665
2      B6       54635
3      EV       54173
4      DL       48110
5      AA       32729


QUESTION 7
  carrier num_flights
1      UA       41135
2      B6       30022
3      DL       28096
4      AA       23583
5      EV        6248


QUESTION 8
a)
           name alt
1   Imperial Co -54
2 El Centro Naf -42

b)
 carrier tot_delay
1      AS     -7041
2      HA     -2365
3      OO       346



*/



