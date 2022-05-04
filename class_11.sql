
-- 그룹함수, 그룹바이, having 절

-- group by 절
-- group by 절은 데이터들을 원하는 그룹으로 나눌 수 있다.
-- 나누고자 하는 그룹의 컬럼명을 select 절과 group by 절 뒤에 추가하면 된다.
-- 집계함수와 함께 사용되는 상수는 그룹바이절에 추가하지 않아도 된다(많이 실수하는 부분)

-- DISTINCT 와 GROUP BY 절
-- DISTINCT 주로 중복을 제거 하기 위해서 사용한다.
-- Group by는 데이터를 그룹핑해서 그 결과를 가져온다.
-- 하지만 두 작업은 조금만 생각해 보면 동일한 형태의 작업이라는 것을 쉽게 알 수 있고, 일부 작업의 경우
-- distinct로 에 처리할 수 도 있다.

-- having 절alter
-- where 절에서는 집계함수를 사용 할 수 없다.
-- having 절은 집계함수를 가지고 조건을 비교할 떄 사용한다.
-- having 절은 group by 절과 함께 사용한다.

use  employees;

show tables;

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- 합계 함수
-- 문제 1. 전체 직원수 as 전체 직원수, 제일먼저입사 일자 as 최초고용일자, 제일 마지막입사 일자가 언제인지 뽑기 as 가장최근고용일자
select count(*) as 전체직원수, min(hire_date)as최초고용일자, max(hire_date)as 가장마지막입사
from employees;

-- 문제 2. gender 로 그룹핑
select *
from employees
group by gender;


-- 문제 3. 남성, 여성 수와, gender로 표시 하세요
select gender, count(gender)
from employees
group by gender;


-- 문제 4. 고용일자로 그룹화
select *
from employees
group by hire_date;

-- 문제 5. hire_date 가 같은 직원의 명수를 표시하시오
-- 전체, as 동기
select *, count(hire_date) as 동기
from employees
group by hire_date;

-- 문제 6. 위 쿼리에서 남성과, 여성을 구분해서 결과값을 구하시오!
select *, count(hire_date) as 동기,count(gender)
from employees
group by hire_date, gender
order by hire_date asc;

-- order by 정렬
-- asc 내림차순 , desc 오름차순

--
select * from salaries;
desc salaries;

-- 급여 테이블에서
-- 총건수, 총급여, 평균급여 소수점 둘째자리까지, 최고연봉,최소연봉
select count(*) as 지급건수,
 sum(salary) as 총급여 , 
format(avg(salary),2) as 평균급여 , 
max(salary) as 최고연봉, 
min(salary) as 최소연봉
from salaries;

-- 데이터 검증
select max(salary) from salaries;

-- having 절 연습
-- 연봉을 10번이상 받은 직원들을 출력하시오.
select *, count(emp_no) as '횟수'
from salaries
group by emp_no
having count(emp_no) >= 10
order by emp_no asc
limit 30;

-- 문제
select * from titles;

select count(*) from titles;

-- 10만명 이상 사용하고 있는 직함의 이름과 직원의 수를 출력하시오

select title, count(*) as 직원수
from titles
group by title
having count(*) >= 100000;


-- 5만명 이상 근무하고 있는 부서의 부서 번호와 부서 소속 사원의 수를 출력하시오!!!
select *, count(*) 
from dept_emp
group by dept_no
having count(*) >= 50000;

select * from dept_emp;
-- 현재 근무중인 사람들만 출력하시오
select *
from dept_emp
where to_date = '9999-01-01';

select *, count(*)
from dept_emp
where to_date = '9999-01-01';

-- 각 부서별 과거에 매니저의 수를 구하시오(퇴사자)
select * from dept_manager;

select *
from dept_manager
where to_date <> '9999-01-01';

-- 2000년도 이전에 입사한사람들의 성별, 최저연봉과 최대 연봉을 구하시오
select e.emp_no , e.gender as 성별 , min(salary) as 최저연봉 , max(salary) as 최대연봉 , s.to_date as 입사일
from employees as e 
inner join salaries as s
on e.emp_no = s.emp_no
group by emp_no 
having to_date <= '2000-01-01'





