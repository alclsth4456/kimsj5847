create table Movies (
`movie_id` int auto_increment not null primary key,
`title` varchar(30) not null,
`genre` varchar(10) not null,
`release_date` date not null
);

create table Customers (
`customer_id` int auto_increment primary key,
`name` varchar(20) not null,
`email` varchar(50) not null,
`phone` char(13) not null
);

create table Bookings (
`booking_id` int not null primary key,
`customer_id` int not null,
`movie_id` int not null,
`num_tickets` int not null,
`booking_date` datetime not null
);

select*from bookings;
drop table bookings;

insert into Movies values (1,'쇼생크의 탈출','드라마','1994-10-14');
insert into Movies values (2,'타이타닉','로맨스','1997-03-24');
insert into Movies values (3,'탑건','액션','1987-07-16');
insert into Movies values (4,'쥬라기공원','액션','1994-02-11');
insert into Movies values (5,'글래디에이터','액션','1994-05-03');
insert into Movies values (6,'시네마천국','드라마','1995-04-12');
insert into Movies values (7,'미션임파서블','액션','1995-11-11');
insert into Movies values (8,'노트북','로맨스','2003-08-23');
insert into Movies values (9,'인터스텔라','SF','2011-05-26');
insert into Movies values (10,'아바타','SF','2010-02-10');

select*from Movies;

insert into Customers values (1,'김유신','kys@example.com','010-1234-1001');
insert into Customers values (2,'김춘추','kcc@example.com','010-1234-1002');
insert into Customers values (3,'장보고','jbg@example.com','010-1234-1003');
insert into Customers values (4,'강감찬','kgc@example.com','010-1234-1004');
insert into Customers values (5,'이순신','lss@example.com','010-1234-1005');

insert into Bookings values (101 ,1 ,1 ,2 ,now());
insert into Bookings values (102 ,2 ,2 ,3 ,now());
insert into Bookings values (103 ,3 ,3 ,2 ,now());
insert into Bookings values (104 ,4 ,3 ,1 ,now());
insert into Bookings values (105 ,5 ,5,2 ,now());
insert into Bookings values (106 ,3 ,8 ,2 ,now());
insert into Bookings values (107 ,1 ,10 ,4 ,now());
insert into Bookings values (108 ,2 ,9 ,1 ,now());
insert into Bookings values (109 ,5 ,7 ,2 ,now());
insert into Bookings values (110 ,3 ,4 ,2 ,now());
insert into Bookings values (111 ,1 ,6 ,1 ,now());
insert into Bookings values (112 ,3 ,5 ,3 ,now());

select*from bookings;

#실습4-4 모든 영화의 제목을 조회
select title from movies;

#실습 4-5 로맨스 장르의 모든 영화 제목을 조회
select*from movies where genre='로맨스';

#실습 4-6 개봉일이 2010년 이후인 모든 영화의 제목과 개봉일을 조회
select title, release_date from Movies where release_date >='2010-01-01';

#실습 4-7 예매된 티켓 수가 3장 이상인 예약 id와 예약일자를 조회
select booking_id, booking_date from bookings where num_tickets >= 3;
#실습 4-8 예약일자가 2023-01-20 이전 예약 id와 고객 id를 조회
select *from Bookings where booking_date >= '2023-01-20';

#실습 4-9 90년대 영화를 조회하시오
select*from movies where release_date between '1990-01-01' and '1999-12-31';

#실습 4-10 가장 최근에 이루어진 예매 3건의 예약 id와 예약일자를 조회
select*from bookings order by booking_date desc limit 3;

#실습 4-11 개봉일이 가장 오래된 영화의 제목과 개봉일을 조회
select title, release_date from Movies order by release_date asc
limit 1;

#실습 4-12 액션 장ㄹ르의 영화 제목과 개봉일을 문자열 결합하여 조회, 제목에 공원이 포합된 영화만 선택하여 개봉일 기준 오름차순으로 정렬한후 상위 1개만 조회
select concat(title, '-', release_date) movie_info
from Movies where title like '%공원'
order by release_date asc limit 1;

#실습 4-13 고객 id가 2인 고객이 한 예매의 예약일자와 예매한 영화 제목을 함께 조회
select booking_date, title from bookings b join Movies m on b.movie_id= m.movie_id
where customer_id = 2; 

#실습 4-14 영화를 예매한 고객이름, 휴대폰, 예매일자, 예매한 영화제목을 조회 ??/
select c.ame, phone, booking_date, title
from bookings b join customers c on b.customer_id = c.customer_id
join Movies m on b.movie_id = m.movie_id;

#실습 4-15 장르별 평균 예매 티켓 수를 조회??
select m.genre, avg(b.num_tickets) avg_tickets
from bookings b join Movies m on b.movie_id = m.movie_id
group by genre;

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
#실습 4-16 고객별 평균 예메 티켓 수를 조회??
select c.name, avg(b.num_tickets) as avg_tickets 
from bookings b
join customers c on b.customer_id = c.customer_id
group by c.name;

#실습 4-17  고객별 전체 예매 티켓 수가 가장 많은 고객순으로 이름, 전체 티켓수를 조회 ??
select c.name, sum(b.num_tickets) as `전체 예매 티켓 수`
from bookings b 
join customers c on b.customer_id = c.customer_id
group by c.name
order by `전체 예매 티켓 수` desc;

#실습 4-18 에매일자가 가장 오래된 예매번호, 영화번호, 고객이름, 예매일을 조회
select booking_id, movie-id, name, booking_date 
from bookings b join customers c on b.customer-id = c.customer-id
order by booking_date asc limit 1;

#실습 4-19 각 영화의 장르별로 개봉일이 가장 최근인 영화의 제목을 조회
select genre, title, release_date from Movies where (genre, release_date)
in(select genre, max(release_date) from movies group by genre);

#실습 4-20 김유신 고객이 예매한 모든 영화정보를 조회
select*from movies where movie_id in ( 
select movie_id from bookings where customer_id = 
(select customer_id from customers where name = '김유신'));

#실습 4-21  예매한 영화 중 가장 많은 티켓을 예매한 고객의 이름과 이메일 조회
select name, email from customers where customer_id = (
select customer_id from bookings 
group by customer_id
order by sum(num_tickets) desc
limit 1);

#실습 4-22 예약된 티켓 수가 평균 예매 티켓 수보다 많은 예매정보를 조회
select*from bookings where num_tickets > (select num_tickets from bookings);

#실습 4-23 각 영화별로 에매된 총 티켓 수를 조회
select m.title, sum(b.num_tickets) total_tickets from bookings b
join movies m on b.movie_id = m.movie_id
group by title;

#실습 4-24 각 고객별로 예매한 총 티켓 수와 평균 티켓 수를 조회
select c.name, sum(b.num_tickets) total_tickets, avg(b.num_tickets) avg_tickets
from bookings b join customers c on b.customer_id = c.customer_id
group by name;

#실습 4-25 예매 티켓 수가 가장 많은 고객의 아이디와 이름, 이메일을 조회
select c.customer_id, c.name, c.email, sum(b.num_tickets) `예매 티켓수`
from bookings b join customers c on b.customer_id = c.customer_id
group by customer_id;

#실습 4-26 예매된 티켓 수가 가장 큰 순서로 고객명, 영화제목, 예매 티켓수, 에매일을 조회
select name, title, num_tickets, booking_date
from bookings b join customers c on b.customer_id = c.customer_id
join movies m on b.movie_id = m.movie_id
order by num_tickets desc;

#실습 4-27 장르가 액션이고 평균 예매 티켓 수가 가장 높은 순으로 영화의 제목을 조회
select m.title, m.genre, sum(b.num_tickets) `예매 티켓 수`,
avg(b.num_tickets) `평균 티켓 수` from bookings b
join movies m on b.movie_id = m.movie_id
where m.genre = '액션'
group by title
order by `평균 티켓 수` desc;

#실습 4-28 회원별 예매 티켓 수가 큰 순서로 고객아이디, 고객명, 티켓 총합 조회
select b.customer_id, c.name, sum(num_tickets) ticket_total
from bookings b join customers c on b.customer_id = c.customer_id
group by customer_id
order by ticket_total desc;

#실습 4-29 각 영화별로 예약된 티켓 수가 가장 많은 예매 id, 고객 id, 최대 티켓 수를 조회
select b.booking_id, b.customer_id, b.movie_id, maxTickets.max_tickets
from bookings b join (select movie_id, max(num_tickets) max_tickets 
from bookings group by movie_id) as maxtickets 
on b.movie_id = maxtickets.movie_id and b.num_tickets =  maxTickets.max_tickets;

#실습 4-30 각 장르별로 예매 티켓 수가 가장 많은 영화정보의 예매번호, 고객아이디, 고객명, 영화제목, 장르, 
#에매 티켓 수 조회 단, 예매 티켓 수로 내림차순 정렬
select b.booking_id, b.customer_id, c.name, m.title, m.genre,summ(b.num_tickets)`예매 티켓 수`
from bookings b join movies m on b.movie_id = m.movie_id
join customers c on b.customer_id = c.customer_id
group by m.title 








