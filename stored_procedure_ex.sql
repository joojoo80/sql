-- DROP Procedure if EXISTS ifproc;


-- -- stored PROCEDURE 틀

-- SELECT count(*) FROM customer;

-- DELIMITER $$
-- CREATE Procedure doit_proc()
-- BEGIN
-- -- 변수 선언
--     DECLARE customer_cnt int;
--     DECLARE add_number int;

-- -- 초기값 설정
--     SET customer_cnt =0;
--     SET add_number =100;

--     SET customer_cnt= (SELECT count(*) FROM customer);

--     SELECT customer_cnt+ add_number;

-- END $$

-- DELIMITER;

-- CALL doit_proc();

-- SHOW create PROCEDURE doit_proc;


-- DROP Procedure doit_proc;




-- stored_id가 1이면 변수 s_id_one에 1씩 더하고,stored_id가 1이 아니면 s_id_two에 1씩 더하고 마지막에 select로 결과를 반환 

use sakila;

select * FROM customer where customer_id =1;

DELIMITER $$
CREATE Procedure doit_if(customer_id_input INT)

BEGIN
-- 변수선언
    DECLARE store_id_i int;
    DECLARE s_id_one int;
    DECLARE s_id_two int;

-- 초기값 선언

    SET store_id_i =(SELECT store_id FROM customer WHERE customer_id = customer_id_input);

    if store_id_i = 1 THEN SET s_id_one = 1;

    ELSE SET s_id_two = 2;

    END if;

    SELECT store_id_i, s_id_one, s_id_two;

end $$
DELIMITER;

CALL doit_if(1);

DROP Procedure doit_if;
