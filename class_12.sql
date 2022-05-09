/* 서브 쿼리 1
서브 쿼리 종류
서브 쿼리는 쿼리의 위치가 어디에 있는가에 따라서 총 3가지 종류로 나눌수 있다.
1. 중첩 서브 쿼리 ( Nested Subquery ) : Where 절에 사용하는 서브 쿼리 입니다.
2. 인라인 뷰 ( Inline View ) : From 절에 사용하는 서브 쿼리 입니다.
3. 스칼라 서브 쿼리( Scalar Subquery ) : select 절에 사용하는 서브 쿼리 입니다.
내부 쿼리라고도 함, 괄호로 반드시 감싸져 있어야한다.

서브 쿼리의 특징
서브 쿼리를 사용하면 다음과 같은 장점이있다.
1. 서브 쿼리는 쿼리를 구조화 시키므로, 쿼리의 각 부분을 명확히 구분할 수 있게 해준다.
2. 서브 쿼리는 복잡한 JOIN이나 UNION과 같은 동작을 수행할 수 있는 또 다른 방법을 제공한다.
3. 서브 쿼리는 복잡한 JOIN이나 UNION보다 좀 더 읽기 편하다. (가독성이 좋다)
*/
-- db 생성
create database reservationdb;
use reservationdb;

-- 테이블 생성 (예약)
create table reservation(
	id int auto_increment,
    name varchar(20) not null,
    reserveDate date not null,
    roomNum varchar(5) not null,
    primary key(id)
);

-- 고객 테이블
create table customer(
id int auto_increment,
name varchar(20) not null,
age int not null,
address varchar(10),
primary key(id)
);

-- 데이터 입력
insert into reservation values(1, '홍길동', '2020-05-01 00:00:00', 1);
insert into reservation values(2, '임꺽정', '2020-05-02 00:00:00', 2);
insert into reservation values(3, '장길산', '2020-05-03 00:00:00', 3);
insert into reservation values(4, '홍길동', '2020-05-04 00:00:00', 4);

select * from reservation;
select * from customer;
-- 데이터 수정
-- 1 == roomNum 1001
-- 2 == roomNum 1002
-- 3 == roomNum 1003
-- 4 == roomNum 1004

update reservation set roomNum = '1001' where id = '1';
update reservation set roomNum = '1002' where id = '2';
update reservation set roomNum = '1003' where id = '3';
update reservation set roomNum = '1004' where id = '4';

-- 고객 테이블 데이터 생성
insert into customer values(1, '홍길동', 20, '서울');
insert into customer values(2, '임꺽정', 30, '서울');
insert into customer values(3, '장길산', 24, '서울');
insert into customer values(4, '전우치', 33, '서울');

-- 2. -->인천, 3 --> 서울 ,4 --> 수원
update customer set address = '인천' where id = 2;
update customer set address = '서울' where id = 3;
update customer set address = '수원' where id = 4;

select * from customer where address in ('서울') ;

-- 중첩 서브 쿼리 사용
-- 주소가 서울인 고객들의 예약 정보를 확인하는 처리
select id, reserveDate, roomNum, name
from reservation
where name in(
				select name 
				from customer 
				where address = '서울');

-- JOIN 문으로 변경해서 같은 결과를 출력해주세요.
select r.id, r.reserveDate, r.roomNum, r.name , c.address
from reservation as r
left join customer as c
on r.name = c.name
where c.address = '서울';

-- From 절 서브쿼리
-- 인라인뷰 사용해보기
select name, reservedRoom
from ( select name , reserveDate, (roomNum) as reservedRoom
		from reservation
        where roomNum > 1001) as reservationInfo
-- 서브 쿼리가 먼저 실행됨 해당 필드 값이 roomNum이라는 것이 1001번 보다 이상인 로우를
-- 찾은 후에 하나씩 증가를 시켜서 from 부분을 만들어낸다 보면 됌

/*
	쿼리 실행 순서
    1. reservation 테이블 roomNum > 1001 보다 큰 레코드를 먼저 찾은 후 roomNum 필드 값을 1씩 증가시켜서 찾는다.
    해당 쿼리의 결과 집합은 reservationInfo 임시 테이블로 만들어 진다. (내부 쿼리 또는 서브 쿼리)
	외부 쿼리에서는 이렇게 만들어진 임시 테이블에서 name, reservedRoom 필드만을 선택해서 결과 집합을 보여주게 된다.

*/

-- 서브쿼리 사용해서 문제 생성 !!
-- 2020-05-02 예약정보 확인
select * 
from customer as c
inner join reservation as r
on c.name = r.name
where name in(select name
            from reservation
            where reserveDate = '2020-05-02'
);

