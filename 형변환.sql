-- 형변환-- 

select * from buytbl;
select amount from buytbl;
select avg(amount) from buytbl;
-- 실수 >> 정수로 변환하는건 큰 범위에서 작은 범위로 가는거라 [강제 형변환] 필요
-- cast 함수 사용
select cast(avg(amount) as unsigned) as '평균 구매 개수' from buytbl;
select cast(avg(amount) as signed integer)  '평균 구매 개수' from buytbl;

-- 자동형변환
select "100" + "100" ;
select concat('100' + '100');
select concat(100 + '100');
select cast('hi' as unsigned);
select 1 > 'hi' ; -- 문자는 0

