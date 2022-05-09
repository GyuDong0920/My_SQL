use showdb;

select * from usertbl;
select * from buytbl;	

-- inner join
select *
from usertbl
inner join buytbl
on usertbl.userName = buytbl.userName;

-- inner join 2
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- inner join 3
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- inner join 4
select *
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- LEFT JOIN 1
select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName;

-- usertbl 고객 등록
select * from usertbl;
insert into usertbl values('야스오',2000,'여수','010-1234-5678');

-- LEFT JOIN 2
select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName
where b.userName is not null;

-- LEFT JOIN 3 한번더 복습
select *
from buytbl as b
left join usertbl as u
on u.userName = b.userName

-- LEFT JOIN 4 
select *
from buytbl as b
left join usertbl as u
on u.userName = b.userName
where u.userName is not null;

-- 구매 테이블 생성할 때 외래키에 대한 제약을 생성 했기 때문이다.
insert into buytbl values('티모','컴퓨터',100,1);
-- 하지만 구매 테이블을 생성할 때 외래키(FK) 제약 하지 않았다면  insert 는 가능하다.
select * from buytbl;
delete from buytbl where userName = '티모';

-- RIGHT JOIN 1
select u.userName, b.prodName, b.price, b.amount
from usertbl as u
right join buytbl as b
on u.userName = b.userName;

-- 곱 집합 CROSS JOIN 1
select *
from usertbl as u
cross join buytbl as b
on u.userName = b.userName;

-- CROSS JOIN 2
select *
from usertbl
cross join buytbl
on usertbl.userName = buytbl.userName
where usertbl.userName is null
or buytbl.userName is null








