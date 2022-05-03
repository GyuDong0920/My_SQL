
-- MY SQL Date Funmction

-- 오늘 날짜 생성
select curdate();
select current_date();
-- 둘다 똑같음

-- 현제 시간 출력 시, 분, 초
select curtime();
select current_time();
-- 둘다 똑같음

-- 일자를 반환하는 함수이다.
select day('2017-06-15');
-- 15라는 값

-- 오늘 날짜를 반환
select day(curdate());

-- 몇째주인지 반환
select week('2017-06-15');

select week(curdate());
-- 18 주차

 select weekday('2017-06-15');
 -- 요일을 알려줌 0 부터 월요일
 select weekday(curdate());
-- 1 오늘은 화요일 2022-05-03

-- 년 월 일 시 분 초 까지 나옴
select now();
select sysdate();

select timestamp('2019-06-15', '13:10:11');
-- 문자열, 시간 date 
-- 인수에 따라서 datetime 값을 반환한다.

select timediff("13:10:11","13:10:10");
select timediff("2022-05-03 13:10:11","2022-01-03 13:10:10");
select timediff(now(), "2021-01-03 13:10:10")
-- 838:59:59 까지가 한계인듯

-- 날짜 빼기! 10일 전
select subdate(now(), interval 10 day);

-- 날짜 더하기~
select date_add(sysdate(), interval 10 day);

-- user 확인
select system_user();
select session_user();
select version();

select current_user();

-- null값에 대입하기 사용자에게 비어있음을 알리기
SELECT NULLIF('empty', NULL);

-- 지금시간부터 어린이날까지 남은시간
select now() as 지금시간 , timestamp('2022-05-05') as 어린이날, timediff(now(), '2022-05-05 00:00:00') as 남은시간;

select u.userName, u.addr, b.prodName , timestamp("2022-05-03") as 주문날짜, (select date_add(주문날짜 , interval 5 day )) as 도착날짜
from usertbl as u
inner join buytbl as b
on u.userName = b.userName
where u.userName = '이승기';

-- timestamp로 주문날짜 정하고 date_add로 5일 추가해서 도착날짜 정하기
select b.userName, b.prodName, b.price, b.amount,timestamp("2022-05-01" , "13:21:16") as 주문날짜, 
        (select date_add(주문날짜 , interval 5 day)) as 도착날짜 
from buytbl as b
where b.userName = '이순신';
















