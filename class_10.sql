
-- MySQL 계정 생성 및 권한 관리

-- 사용자 계정 확인
show databases;

use mysql;

select host, user from user;

-- 1. 사용자 추가 및 권한 셋팅 (첫번째 방법)
create user tester1@localhost identified by 'asd123';
grant select, insert, update, delete on shop_db.* TO 'tester1'@'localhost';

-- MYSQL 8 에서 계정 생성 방법은 (계정 생성 후 모든 권한을 할당)

-- 2. 모든 DB에 권한 할당, localhost만 접근 허용 (두번쨰 방법)
create user tester2@localhost identified by 'asd123';
grant all privileges on *.* to 'tester2'@'localhost'with grant option;
flush privileges;

-- 3. 외부 접속을 허용 하는 기능
create user tester3@'%' identified by 'asd 123';
grant all privileges on *.* to tester3@'%' with grant option;

-- 4. 계정 삭제 방법
drop user 'tester3'@'%';
drop user 'tester2'@'localhost'

-- DB에 만들어진 모든 테이블 확인
use showdb;

show full tables;

-- 뷰 생성

create view usertbl_view as select userName,birthYesr, add from usertbl;
select * from usertbl_view; 

-- 
use mysql;
select * from user;

create user tencoding@'%'identified by 'asd123';
grant select on shopdb.usertbl_view to tencoding;
