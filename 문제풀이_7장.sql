-- 1 (percentage 열 5보다 크면 5+, 5보다 작으면 5-로 표시해라)
SELECT * FROM countrylanguage;

SELECT `CountryCode`, `Language`, `percentage`, IF (percentage >= 5 , '5+','5-')
FROM countrylanguage ;


-- 2 (LifeExpectancy 기대수명이 100/80/70/60/이하 보다 클때 WoW/best/good/normal/sad )

SELECT * FROM country;

SELECT `Name`,`LifeExpectancy`, 
    CASE 
        WHEN LifeExpectancy >= 100 THEN  'WoW'
        WHEN LifeExpectancy >= 80 THEN  'best'
        WHEN LifeExpectancy >= 70 THEN  'good'
        WHEN LifeExpectancy >= 60 THEN  'normal'
        ELSE  'sad'
    END  as life_level

FROM country;

-- 3 (두개의 입력값(시작, 마지막값)을 받아 두 입력값 범위 사이의 숫자를 순차적으로 더하기)

DELIMITER $$
CREATE PROCEDURE doit_sum(start_num int, last_num int)
BEGIN
-- 변수 선언
    DECLARE while_sum int;      
    SET while_sum = start_num;

-- 초기값 설정
    mywhile:
    WHILE (start_num <= last_num) DO
        SET while_sum = while_sum + start_num;
        SET start_num =start_num + 1;

        if(start_num > last_num) THEN
            LEAVE mywhile;
        END if;

    END WHILE;       

    SELECT while_sum;  

END $$    
DELIMITER ;

call doit_sum(0,10);

-- 5 조인 
-- select * from 테이블 inner join 테이블 on
-- 뷰 create view 뷰이름

CREATE View v_country_language
AS
SELECT a.NAME, a.region, b.`Language`,b.`IsOfficial`,b.`Percentage`
FROM country as a
INNER join countrylanguage as b on a.code = b.`CountryCode`;

DROP View v_country_language
