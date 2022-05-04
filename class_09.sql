--

create database shop_db;
use shop_db;

create table shop_db.product(
	id tinyint not null,
    p_name varchar(30) not null,
    created date,
    company varchar(30)
);


-- index : create index(unique) 색인을 지정해주면 검색 속도가 빨라짐

create index idx_product_name
on product (P_name)

-- 가상 테이블 (뷰테이블)
select * from product;

-- 데이터 생성
insert into product values(1, '세탁기', '2020-12-12','삼성');
insert into product values(2, '냉장고', now(), 'LG');
insert into product values(3, '모니터', curdate(), '삼성');
insert into product values(4, '컴퓨터', curdate(), '삼성');



desc product;

-- 컬럼 추가하기
alter table product add input_time timestamp;

-- 가상 테이블 생성하기
create view product_view
as select p_name, created, company
from product;

select * from product_view;

-- delete (계정 삭제 권한을 주면 안된다)
delete from product_view where p_name = '컴퓨터';

-- drop database shop_db;

show databases;

-- drop index
-- index 조회 하는 방법
show index from product;
-- index 수정 하는 방법
-- alter table product
alter table product
drop index idx_product_name;

-- 테이블 복사
select * from product;

create table product_2 select * from product; 
select * from product_2;

-- 집계 함수 !!!

-- group by
use showdb;

select * from buytbl;

-- group by
select userName
from buytbl
group by userName;

select *
from buytbl
group by price;

select *
from buytbl
group by amount

-- 이름으로 묶고 amount가 3보다 큰 사람들을 출력 하라!!

select *
from buytbl
where amount >= 3
group by userName;

-- 집계 함수
select count(*) as 판매횟수
from buytbl;

select userName, sum(price) as '구매 금액'
from buytbl;

-- 집계 함수와 그룹 바이
select userName, sum(price) as '구매 금액'
from buytbl
group by userName;


-- 외부에서 CEO에게 buytbl에있는 장부를 조회할수 있는 권한 부여하기
create user 'CEO'@'%' identified by 'asd123';
grant select on showdb.buytbl to 'CEO'@'%';
select sum(price) as 총매출 ,count(*) as 판매횟수, sum(price)/count(*) as 평균판매금액
from buytbl;


use showdb

use shop_db

-- product 테이블에서 이름으로 묶고 제조일이 2020년 12월 12일 이후인 것만 출력
select *
from product
where created >= '2020-12-12'
group by company;

-- buytbl에서 제품별 판매량 구하기
select prodName as 제품명, count(prodName) as 판매량 from buytbl
group by prodName;
-- 외부에서 접근 할 수 있는 korea_it 계정을 생성하고 shopdb의 producttbl 테이블을 조회할 수 있는 권한 부여하기
create user 'korea_it'@'%' identified by 'asd123'
grant select on shopdb.producttbl to 'korea_it'@'%';

-- usertbl에서 2000년생 이후 출생자 이름과 출생년도만 출력해서 usertbl_view3로 정의
create view usertbl_view3 as select userName, birthYear from usertbl where birthYear >= 2000;
select * from usertbl_view3;

use shopdb;
select * from usertbl;
select * from buytbl;

