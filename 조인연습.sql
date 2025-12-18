-- SELECT * FROM usertbl, buytbl ;

-- SELECT * FROM usertbl, buytbl WHERE usertbl.`userID` = buytbl.`userID` ; 

-- SELECT usertbl.name, buytbl.`prodName` FROM usertbl, buytbl WHERE usertbl.`userID` = buytbl.`userID` ; 

-- SELECT usertbl.name, buytbl.`prodName` FROM usertbl inner JOIN buytbl on usertbl.`userID` = buytbl.`userID` ;

-- SELECT * FROM usertbl left outer JOIN buytbl on usertbl.`userID` = buytbl.`userID` ;

-- SELECT * FROM usertbl right outer JOIN buytbl on usertbl.`userID` = buytbl.`userID` ;

-- SELECT * FROM usertbl outer JOIN buytbl on usertbl.`userID` = buytbl.`userID` ;

-- SELECT U.`userID`, U.name, B.`prodName`, U.addr, CONCAT(U.mobile1, U.mobile2) 
-- FROM usertbl U left outer JOIN buytbl B on U.`userID` = B.`userID`
-- WHERE U.addr ="서울" ;


--self join
-- use sqldb;
-- create Table emptbl (
--     emp CHAR(3),
--     manager CHAR(3),
--     empTel VARCHAR(8)
-- );

-- INSERT into emptbl VALUES ('나사장', null, 0000);

-- INSERT into emptbl VALUES ('김재무', '나사장', 2222);

-- INSERT into emptbl VALUES ('김부장', '김재무', 2222-1);
-- INSERT into emptbl VALUES ('이부장', '김재무', 2222-2);
-- INSERT into emptbl VALUES ('우대리', '이부장', 2222-2-1);
-- INSERT into emptbl VALUES ('지사원', '이부장', 2222-2-2);
-- INSERT into emptbl VALUES ('이영업', '나사장', 1111);
-- INSERT into emptbl VALUES ('한과장', '이영업', 1111-1);
-- INSERT into emptbl VALUES ('이영업', '나사장', 1111);
-- INSERT into emptbl VALUES ('최정보', '나사장', 3333);
-- INSERT into emptbl VALUES ('윤차장', '최정보', 3333-1);
-- INSERT into emptbl VALUES ('이주임', '윤차장', 3333-1-1)

-- SELECT * FROM emptbl

-- self join
-- 우대리의 직속 상관의 연락처
-- SELECT * FROM emptbl A INNER JOIN emptbl B on A.manager=B.emp;
-- -- DELETE FROM emptbl WHERE emp="나사장" ;

-- -- SELECT * FROM emptbl

-- -- 우 대리의 직속 상관의 연락처


-- SELECT A.emp as '부하직원', B.emp as '직속상관', B.empTel as '직속상관연락처' 
-- from emptbl A inner JOIN emptbl B on A.manager = B.emp
-- WHERE A.emp='우대리';


-- CREATE TABLE stdtbl(
--     stdname VARCHAR(10) not null PRIMARY KEY,
--     addr CHAR(4) NOT NULL
-- );

-- CREATE TABLE clubtbl(
--     clubname VARCHAR(10) not null PRIMARY KEY,
--     roomNo CHAR(4) NOT NULL
-- );

-- CREATE TABLE stdclubtbl(
--     num INT AUTO_INCREMENT not null PRIMARY KEY,
--     stdName VARCHAR(10) NOT NULL,
--     clubname VARCHAR(10) not null,
--     Foreign Key (stdName) REFERENCES stdtbl(stdName),
--     Foreign Key (clubname) REFERENCES clubtbl(clubname)
-- );

-- INSERT INTO stdtbl VALUES ('김범수','경남'),('성시경','서울'),('조용필','경기'),('은지원','경북'),('바비킴','서울');

-- SELECT * FROM stdtbl;

-- INSERT INTO clubtbl VALUES ('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');

-- SELECT * FROM clubtbl;

-- INSERT INTO stdclubtbl VALUES (null,'김범수','바둑'),(null,'조용필','축구'),(null,'은지원','봉사'),(null,'김범수','축구'),(null,'은지원','축구'),(null,'바비킴','봉사');

-- SELECT * FROM stdclubtbl;



-- SELECT A.emp as '부하직원', B.emp as '직속상관', B.empTel as '직속상관연락처' 
-- from emptbl A inner JOIN emptbl B on A.manager = B.emp
-- WHERE A.emp='우대리';


-- 미션 1
-- 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생 기준으로 학생이름/지역/가입한 동아리/동아리방 출력

-- 미션 2
-- 동아리방 기준으로 가입한 학생의 목록을 출력


-- SELECT * FROM stdtbl;
-- SELECT * FROM clubtbl;
-- SELECT * FROM stdclubtbl;


-- 미션1 (방법 1)

-- select stdtbl.stdname as '학생이름', stdtbl.addr as '지역',
--  stdclubtbl.clubname as '가입한 동아리', clubtbl.`roomNo` as '동아리방'
-- from stdtbl 
--     INNER JOIN stdclubtbl on stdtbl.stdname = stdclubtbl.stdname
--     INNER JOIN clubtbl on stdclubtbl.clubname = clubtbl.clubname
--     ;

-- 미션1 (방법 2)

-- SELECT stdtbl.stdName, stdtbl.addr, clubtbl.clubName, clubtbl.roomNo
-- from stdtbl, clubtbl, stdclubtbl 
-- WHERE stdtbl.stdname= stdclubtbl.stdname and clubTbl.clubName= stdclubtbl.clubName ;

-- 미션2 :동아리방 기준으로 가입한 학생의 목록을 출력

-- select clubtbl.`roomNo` as '동아리방', stdclubtbl.stdname as '학생이름'
-- from clubtbl 
--     LEFT OUTER JOIN stdclubtbl on clubtbl.clubname = stdclubtbl.clubname
--     ;

-- -- 전체 회원의 구매기록을 출력하되 구매기록이 없는 회원도 출력

-- SELECT * FROM usertbl;
-- SELECT * FROM buytbl;

-- SELECT usertbl.name as '회원이름', buytbl.`prodName` as '구매상품'
-- FROM usertbl
--     LEFT OUTER JOIN buytbl on usertbl.`userID` = buytbl.`userID`
-- ;

-- SELECT usertbl.name, buytbl.`prodName`
-- FROM usertbl, buytbl
-- WHERE usertbl.`userID` = buytbl.`userID`;

-- -- 구매이력이 없는 회원만 뽑고 싶다
-- SELECT usertbl.name as '회원이름', buytbl.`prodName` as '구매상품'
-- FROM usertbl lEFT OUTER JOIN buytbl 
-- on usertbl.`userID` = buytbl.`userID`
-- WHERE buytbl.`prodName` is NULL;


-- 미션 1) 
-- 동아리에 가입하지 않은 학생 출력 - 성시경의 클럽이름 null
-- 미션 2)
-- 동아리를 기준으로 가입된 학생 출력하되, 가입학생이 하나도 없는 동아리도 출력 - 수영쪽에 학생이 null 나오게
-- 미션 3)
-- 위 2 결과를 합쳐보자 (union)
-- 즉 동아리에 가입하지 않은 학생도 출력되고 학생이 한명도 없는 동아리도 출력되게 하세요
-- 교재 5-6장
-- 제출 : 공유 폴더 > DB > 평가



-- 미션 1) 
-- 동아리에 가입하지 않은 학생 출력 - 성시경의 클럽이름 null

-- SELECT stdtbl.stdname as '학생이름', stdclubtbl.clubname as '가입동아리'
-- FROM stdtbl
-- LEFT OUTER JOIN stdclubtbl on stdtbl.`stdName` = stdclubtbl.stdname ;

-- 미션 2)
-- 동아리를 기준으로 가입된 학생 출력하되, 가입학생이 하나도 없는 동아리도 출력 - 수영쪽에 학생이 null 나오게

-- SELECT clubtbl.clubname as '가입동아리', stdclubtbl.`stdName` as '학생이름'
-- FROM clubtbl
-- LEFT OUTER JOIN stdclubtbl on clubtbl.clubname = stdclubtbl.clubname ;

SELECT stdtbl.stdname as '학생이름', clubtbl.clubname as '가입동아리', stdclubtbl.`stdName` as '학생이름'
FROM stdtbl
LEFT OUTER JOIN stdclubtbl on stdtbl.`stdName` = stdclubtbl.stdname ;
UNION

SELECT stdtbl.stdname as '학생이름', clubtbl.clubname as '가입동아리', stdclubtbl.`stdName` as '학생이름'
FROM clubtbl
LEFT OUTER JOIN stdclubtbl on clubtbl.clubname = stdclubtbl.clubname ;



SELECT * FROM stdtbl;
SELECT * FROM clubtbl;
SELECT * FROM stdclubtbl;

-- 미션 3)
-- 위 2 결과를 합쳐보자 (union)
-- 즉 동아리에 가입하지 않은 학생도 출력되고 학생이 한명도 없는 동아리도 출력되게 하세요

SELECT stdtbl.stdname as '학생이름', stdclubtbl.clubname as '가입동아리',clubtbl.`roomNo` as '동아리방'
FROM stdtbl
LEFT OUTER JOIN stdclubtbl on stdtbl.`stdName` = stdclubtbl.stdname 
LEFT OUTER JOIN clubtbl on stdclubtbl.clubname = clubtbl.clubname;
UNION

SELECT stdtbl.stdname as '학생이름', stdclubtbl.clubname as '가입동아리',clubtbl.`roomNo` as '동아리방'
FROM stdclubtbl
RIGHT OUTER JOIN clubtbl on  stdclubtbl.clubname= clubtbl.clubname;
LEFT OUTER JOIN stdclubtbl on stdtbl.name = stdclubtbl.name

SELECT stdtbl.stdname as '학생이름', stdclubtbl.clubname as '가입동아리',clubtbl.`roomNo` as '동아리방'
FROM stdtbl
LEFT OUTER JOIN clubtbl on  stdclubtbl.clubname= clubtbl.clubname;
LEFT OUTER JOIN stdclubtbl on stdtbl.name = stdclubtbl.name




-- SELECT clubtbl.clubname as '가입동아리', stdclubtbl.`stdName` as '학생이름'
-- FROM clubtbl
-- LEFT OUTER JOIN stdclubtbl on clubtbl.clubname = stdclubtbl.clubname
-- RIGHT OUTER JOIN clubtbl on  stdclubtbl.clubname= clubtbl.clubname;



-- [문제풀이]