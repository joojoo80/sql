-- SELECT * FROM stdtbl
-- UNION
-- SELECT * FROM clubtbl;

-- UNION ALL은 중복된 열까지 모두 출력
SELECT * FROM stdtbl
UNION ALL
SELECT * FROM clubtbl;

-- 서브쿼리에서 not in 
-- in : ~에 포함

-- usertbl에서 모바일1이 null인 데이터 뽑기
-- 모바일이 null인 사람 제외하고 01000000000 형식으로 뽑아보기


SELECT name FROM usertbl WHERE mobile1 is null;
-- in (성시경, 윤종신)
-- not in (성시경, 윤종신)

SELECT * FROM usertbl WHERE name not in(
    SELECT name FROM usertbl WHERE mobile1 is null
);

-- 순서
-- 서브쿼리를 먼저 작성 후 큰 틀에 넣어라


SELECT name, CONCAT(mobile1,mobile2) FROM usertbl WHERE name not in(
    SELECT name FROM usertbl WHERE mobile1 is null
);

SELECT name, CONCAT(mobile1,mobile2) FROM usertbl WHERE name in(
    SELECT name FROM usertbl WHERE mobile1 is null
);

SELECT name, CONCAT(mobile1,mobile2) FROM usertbl WHERE name not in(
    SELECT name FROM usertbl WHERE mobile1 is not null
);

-- mobile1 이 011이 아닌 사람을 뽑아라 
SELECT name from usertbl WHERE mobile1 = 011;

select * from usertbl 
WHERE name not in
(SELECT name from usertbl WHERE mobile1 = 011);

-- 출생년도가 1970년 이상인 사람을뽑아라

SELECT * from usertbl WHERE `birthYear` > 1970 ;
SELECT name from usertbl WHERE `birthYear` > 1970 ;

select * from usertbl
where name in
(SELECT name from usertbl WHERE `birthYear` > 1970 );


-- 문제풀이 5장 3번 

-- 조인

use world;
SELECT *
FROM country
inner join countrylanguage on countrylanguage.`CountryCode`=country.`Code`
WHERE countrylanguage.`Language` ='English';

--서브쿼리

SELECT * from country
WHERE code in
(SELECT countrycode FROM countrylanguage WHERE language='english');

-- 문제풀이 5장 2번
-- 조인
SELECT country.`Population`, country.`GNP`, country.`LifeExpectancy`
FROM city
inner join country on city.`CountryCode` = country.`Code`
ORDER BY 'Population' DESC LIMIT 10;

-- 서브쿼리

-- 인구 상위 10위 도시
SELECT * from city order by population desc LIMIT 10;
-- 위의 결과가 하나의 테이블 이기때문에 서브쿼리로 사용할때 From에 들어갈 수 있음
-- select * from (테이블1)
-- select * from (테이블1) inner join (테이블2) on ~
SELECT countrycode from city order by population desc LIMIT 10;

SELECT * from country;

SELECT country.`Population`, country.`GNP`, country.`LifeExpectancy`
from (SELECT * from city order by population desc LIMIT 10) as A
inner join country on A.countrycode = country.code;
-- 하나의 테이블로 넣어 추출하는 방식 이때 테이블을 간략하게 만들어줌 (as A)
-- 조인과 서브쿼리 조합


-- 문제풀이 5장 4번
use sakila;
select actor.first_name, actor.last_name, film.title, film.release_year
from category
inner join film_category on category.category_id = film_category.category_id
inner join film_actor on film_category.film_id = film_actor.film_id
inner join film on film_actor.film_id = film.film_id
inner join actor on film_actor.actor_id = actor.actor_id
where category.name = 'Action' ;














