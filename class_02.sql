-- C R U D

-- 데이터를 생성 insert
desc memberTbl;

insert into memberTbl values("Dang", "탕탕이", "경기도 부천시");
insert into memberTbl values('Han','한주연', '부산시 해운대구');
insert into memberTbl(memberAddress, memberName, memberId) values('서울시 상암동','지은이','jee');

-- 오류 구문 (memberTbl 에 memberId, memberName 필드명이 not null로 설계했기 때문이다.)
insert into memberTbl(memberId) values('jee');
insert into memberTbl(memberId, memberName) values('kee2','홍길삼');

-- 전체 테이블에 대한 데이터 조회
select * from memberTbl;

-- 한건에 대한 데이터 조회는 어떻게 할까? -- where 절이라는 것을 사용하면 된다.
select * from memberTbl where memberId = 'jee';
		
-- 한건에 대한 조회 + 조건절
select memberName
from memberTbl
where memberId = 'jee';

-- 한건에 대한 데이터 삭제
delete from memberTbl where memberId = 'kee2';

-- 전체에 대한 데이터 삭제 구문
delete from memberTbl;
truncate memberTbl;

-- 한건에 대한 데이터 수정
update memberTbl set memberName = '홍길동' where memberId = 'jee';

-- 전체 데이터에 대한 값 수정
update memberTbl set memberAddress = '부산시';

-- ---------------------------
desc productTbl;


-- 문제 1 productTbl 데이터를 3건 입력해 주세요


insert into productTbl values('1','과자','1000','농심','100');
insert into productTbl values('2','라면','1000','삼양','100');
insert into productTbl values('3','음료','1000','칠성','100');
insert into productTbl values('4','소주','2000','처음처럼','100');
-- 문제 2 검색
select * from productTbl;
select * from productTbl where productId = '1';

select cost
from productTbl
where productId = '2';

-- 문제 3 수정
update productTbl set cost = '2000' where productId = '4';
update productTbl set cost = '1000';

-- 문제 4 삭제
delete from productTbl;
delete from productTbl where ProductId = '1';

-- 불필요한 컬럼 삭제하는 방법
alter table productTbl drop makeDate;
