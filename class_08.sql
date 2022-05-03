-- And Or 연산자alter

select *
from membertbl;
insert into membertbl values('Jsa','김주한','부산시 진구');

-- 이름 홍길동, 주소가 부산시 진구
select *
from membertbl
where memberName = '홍길동'
and memberAddress = '부산시';

-- 주소가 부산시 진구 or 경기도 부천시
select *
from membertbl
where memberAddress = '부산시 진구'
or memberAddress = '경기도 부천시';

-- 주소가 부산시 진구 or 경기도 부천시 그중에 이름이 김주환
select *
from membertbl
where (memberAddress = '부산시 진구' or memberAddress = '경기도 부천시')
and memberName = '김주환';

-- 샘플 테이블
create table memberCart(
    id int not null auto_increment,
    name varchar(30) not null,
    amount int not null,
    primary key(id)
);

desc memberCart;
select * from shopCart;

-- 테이블에 컬럼 추가
alter table memberCart add productName varchar(30) not null;

-- 테이블에 컬럼명을 수정해 보자
alter table memberCart rename column name to name2;

-- 테이블에 컬럼명을 삭제해 보자
alter table memberCart drop column name2;

-- 테이블 이름 변경하기
rename table memberCart to myCart;
alter table myCart rename shopCart; -- 처음에는 얘를 외우는 것이 좋다.

-- 데이터 입력
insert into shopCart values(1, 1, '청바지');
-- 테이블 기본 전략을 auto_increment()
insert into shopCart(amount , productName) values(2, '운동화');
insert into shopCart(amount , productName) values(12, '잠바');
insert into shopCart(amount , productName) values(8, '핸드폰');
insert into shopCart(amount , productName) values(5, '지갑');

-- between
select *
from shopCart
where  amount between 5 and 30;

select * from membertbl;

select * from buytbl;
select * from producttbl;