create database ratingvideo;

use ratingvideo;

drop table reviewer;
drop table video;


create table video(
id int auto_increment primary key,
title varchar(50),
length int,
url varchar(100)
);

create table reviewer(
id int auto_increment primary key,
first_name varchar(30),
last_name varcharacter(30),
email_address varchar(60)
);


create table rating(
id int auto_increment primary key,
video_id int not null,
reviewer_id int not null,
rate int  check (rate > 0 or rate <= 5),
short_ap varchar(30),
foreign key(video_id) references video(id),
foreign key(reviewer_id) references reviewer(id) 
);

select * from video;
select * from reviewer;
select * from rating;

insert into video (title, length, url)
values ('Blade Runner 2049',153,'https://bladerunnermovie.com/'),
('Dunkirk',106, 'https://www.warnerbros.com/movies/dunkirk/'),
('Geostorm',121, 'https://parentpreviews.com/movie-reviews/geostorm'),
('Thor: Ragnarok',107, 'https://www.marvel.com/movies/thor-ragnarok'),
('Murder on the Orient Express',135, 'https://www.movie-censorship.com/news.php?ID=12698')
;


insert into  reviewer(first_name, last_name, email_address)
values ('David','May','dmay@gmail.com'),('Theresa','Davis','tdavis@gmail.com'),
('Jerry','Martin','jermar@gmail.com'),('John','Smith','smithy@gmail.com'),
('Martin','Watkins','mwatto@gmail.com'),('Emma','Watson','itswingardiumleviosa@gmail.com'),
('Javier','Pastore','jp@gmail.com'),('Charlotte','Hare','chare@gmail.com'),
('Mark','Smith','markysmith@gmail.com'),('Emily','Thorne','ethorne@gmail.com'),
('David','Paul','davpaul@gmail.com'),('Cherry','Wang','cherryw@gmail.com')
;

insert into rating (video_id , reviewer_id, rate, short_ap)
values 
(1,1,2,'good'), (1,2,3,'awsome'), (1,3,4,'excellent'), (1,4,1,'maybe'),(1,5,2, 'better'), (1,6,3,'impressive'), 
(1,7,4,'fine'), (1,8,3,''),(1,9,2,'good'), (1,10,3,'awsome'), (1,11,4,'excellent'), (1,12,1,'maybe'),
(2,1,4,'stunning'), (2,2,3,'oooho'), (2,3,1,'somewhat'), (2,4,4,'awsome'), (2,5,5,'excellent'), (2,6,3,'like-it'),
(2,7,5,'exciting'), (2,8,5,'love-it'), (2,9,3,'bonus'), (2,10,2,'boring'), (2,11,4,'exciting'), (2,12,5,'solemn'),
(3,1,5,'excellent'), (3,2,5,'suberb'), (3,3,4,'like-it'), (3,4,5,'pretty'), (3,5,5,'excellent'), (3,6,4,'love-it'),
(3,7,5,'exciting'), (3,8,5,'awasome'), (3,9,4,''), (3,10,4,'boring'), (3,11,5,'exciting'), (3,12,5,'solemn'),
(4,1,5,'love'), (4,2,3,'good'), (4,3,3,'somewhat'), (4,4,5,'awsome'), (4,5,5,'excellent'), (4,6,4,'like'),
(4,7,5,'exciting'), (4,8,5,'perfect'), (4,9,4,'uhooh'), (4,10,3,'boring'), (4,11,4,'exciting'), (4,12,5,'solemn'),
(5,1,4,'stunning'), (5,2,2,'awful'), (5,3,2,'good'), (5,4,5,'incredible'), (5,5,5,'excellent'), (5,6,4,'like-it'),
(5,7,5,'exciting'), (5,8,5,'awasome'), (5,9,4,'special'), (5,10,3,'hola'), (5,11,5,'terrific'), (5,12,4,'love-it')
;

-- The average rate of each video by title
select vi.title, round(avg(rg.rate),1) as rated 
from video vi
join rating rg on rg.video_id = vi.id
group by vi.title;

-- number of 5 * obtained by a video
select vi.title, count(rg.rate) as 5_stars
from video vi
join rating rg on rg.video_id = vi.id
where rg.rate = 5
group by vi.title
order by 5_stars desc;
/*
Geostorm	8
Thor: Ragnarok	6
Murder on the Orient Express	5
Dunkirk	4
*/


-- find reviewer with a 5 rating on Geostorm
select  rv.first_name, rv.last_name, rg.rate, vi.title from rating rg
join reviewer rv  on rg.reviewer_id = rv.id
join video vi on rg.video_id = vi.id
where rg.rate = 5 and vi.title ='Geostorm';

/*

 */
