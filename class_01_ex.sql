
-- 문제 1번 showdp_1 데이터 베이스를 생성

-- 문제 2 memberTbl 테이블 생성

-- 문제 3 productTbl 테이블 생성

-- 문제 4 (간단한 테이블 생성 필드 2개 이상)

-- 문제 5 (간단한 테이블 생성 필드 2개 이상 프라이머리 키 지정)


create database showdp_1;

create table memberTbl(
	memberId char(5) not null,
    memberName char(8) not null,
    memberAddress char(20),
    primary key (memberId)
);

create table productTbl(
	productId int not null,
    productName char(4) not null,
    cost int not null,
    makeDate date,
    company char(5),
    amount int,
    primary key(productId)
);

create table phoneNumber(
phoneNumber int not null,
phName char(5) not null
);
