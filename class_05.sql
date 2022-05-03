-- mysql function

-- MySQL String Function
select ascii('b');
-- 공백도 글자수에 포함됨
select char_length('MY SQL TEST') as 문자길이;
select char_length('홍길동') as 이름;
select concat('boot','class','100%') as class_name;
select concat_ws('->','boot','class','100%') as class_name;
-- 문자열 목록내에서 q를 검색할 수 있다.
select find_in_set('l','s,q,l');

select format(250500.5634, 0);
-- 숫자 형식은 "#.##.##.##"(소수점 2자리 반올림)으로 지정 한다.

-- 대문자,  소문자 변경
select lcase('HELLO JAVA');
select ucase('hello java');

-- 앞뒤 공백 처리
select trim('              MY SQL             ');

-- 공백 처리
select replace('      aaa 11            ', ' ','');

-- inner join
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount, char_length(a.userName)
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- inner join 1
-- 상품명 글자 수 나타내기
select u.userName, u.addr, u.mobile, b.prodName, b.price, b.amount, char_length(b.prodName)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName

-- inner join 2
-- 항목에 -> 붙이기
select concat_ws('->',u.userName, u.addr, u.mobile, b.prodName, b.price, b.amount)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName

-- inner join 3
-- 항목 다 붙이기
select concat(u.userName, u.addr, u.mobile, b.prodName, b.price, b.amount)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName

select * from usertbl;

-- usertbl기준으로 buytbl left join한다.
-- mobile에서 -빼고 조회
select a.username, a.birthYear, a.addr, replace(a.mobile,'-',''), b.prodname, b.price, b.amount
from usertbl as a
left join buytbl as b
on a.username = b.username
where b.userName is not null;
-- replace 로 - 값 제거 


-- 주소에있는 문자열 글자수 확인하기,
-- amount ascii 값 확인하기. as(별칭)
select u.userName, u.addr as 주소, b.prodName,b.amount, char_length(u.addr) as 주소글자_길이, ascii(b.amount) as amount_ascii
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- usertbl 기준으로 buytbl과 공통되는 userName 출력하고, 글자수 반환하기
select u.userName, char_length(u.userName)
from usertbl as u
left join buytbl as b
on u.userName = b.userName;


-- '누가 구매한 상품명' 으로 리스트를 만들고, 가격과 수량 조회하기
select concat_ws('가 구매한 ', u.userName, b.prodName) as 'list', b.amount, b.price
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- 가격 * 개수
-- 가격 > 50 이상만 나오도록 설정
select a.userName, (b.price * b.amount) as total
from usertbl as a
inner join buytbl as b
on a.username = b.username
where b.price > 50;

-- replace 야스오 , 스 를 제거 + * 를 넣는다
-- userName이 야스오인 로우 찾아서 야*오로 바꾸기
select u.birthYear, u.addr, u.mobile, replace('야스오', '스', '*')
from usertbl as u
where u.userName = '야스오';

select -- 가져올 컬럼 선택 및 함수 설정
from -- 어떤 테이블을 가져올것인지
inner join -- from 과 공통 분모를 설정해줌
on -- 값이 같을때 사용해줌
where -- 예외설정?

