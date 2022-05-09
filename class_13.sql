-- 서브쿼리 2
use employees;
select * from employees;
select * from dept_emp; -- employees vs dept_emp ( 1 : N )
select * from departments order by dept_no; -- departmenets vs dept_emp ( 1 : N )
select * from dept_manager;
select * from titles;
select * from salaries;

select *, dept_no as '뽑아야 되는 값'
from departments as A
where a.dept_name = 'development';

select id, reserveDate, roomNum, name
from reservation
where name in(
				select name 
				from customer 
				where address = '서울');

-- 문제 1 (중첩 서브 쿼리 where)
-- dept_emp 테이블에서 development인 emp_no 와 dept_no를 출력하세요
select *
from dept_emp as A
where A.dept_no in(
				select dept_no
                from departments
                where dept_name = 'development');
 
 -- 문제 2 (중첩 서브쿼리)
-- employees 테이블에서 현재 development 매니저인 직원만 출력하시오!!!
select *
from employees as e

-- d005 --> development (값으로 변경해줘서 쿼리문을 완성해주세요)
where e.emp_no in (
					select emp_no
                    from dept_manager 
                    where to_date = '9999-01-01'
                    and dept_no = (
                    select dept_no
                    from departments
                    where dept_name = 'development')
);
-- 단일행 결과 집합 나와서 외부 쿼리인 emp_no 조건식으로 처리가 된다.
/*
	다중 행 서브쿼리
    결과값이 2건 이상 출력되는 것을 말한다. 다중 행 서브쿼리는 쿼리의 결과가 여러건 출력되기 때문에
    단일행 연산자를 사용할 수 없다.
    별도의 연산자를 사용해야 한다. in 
*/

select * from employees;
select * from titles;

-- join
select a.emp_no, a.first_name, b.title
from employees as a
inner join titles as b
on a.emp_no = b.emp_no;

-- 인라인뷰로 결과를 출력해주세요
select a.emp_no, a.first_name, b.title
from employees as a, (select * from titles) as b
where a.emp_no = b.emp_no;

-- 문제 1
-- 직원 테이블에서 부서 팀장만 출력하시오.(join 사용, 단 현재 근무중인 사람만 출력)
select a.emp_no, a.first_name, b.dept_no, b.from_date
from employees as a
inner join dept_manager as b
on a.emp_no = b.emp_no
where b.to_date = '9999-01-01';

-- 문제 2
-- 위의 문제를 인라인뷰로 출력하시오
select *
from elmployees as a,(select * 
						from dept_manager
						where to_date = '9999-01-01') as b
where a.emp_no = b.emp_no;             

-- 스칼라 서브쿼리(select 절에 사용하는 서브쿼리)
-- select 절에 서브쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적
-- Join의 대체 표현식으로 자주 사용하지만 성능면에서 좋은 편이 아니다.!!!

select *, (select dept_name 
				from departments as b 
					where a.dept_no = b.dept_no) as 부서명
from dept_manager as a
where to_date = "9999-01-01";

-- 스칼라 서브쿼리를 사용하여 결과를 출력해주세요!!!
-- 문제 employees 테이블에서 emp_no, first_name (타이틀명)

-- 단일행으로 변경해야한다.
select a.emp_no, a.first_name ,(select b.title
									from titles as b 
										where a.emp_no = b.emp_no
                                        group by emp_no) as 타이틀명
from employees as a;

-- 문제 1 중첩 where
--  최고연봉을 받는 사람의 정보를 출력해주세요
-- employees , departments
select * 
from employees as e
where e.emp_no in (
					select emp_no
					from salaries as s
					where salary = (select max(salary) from salaries)
				
);

-- 문제 2 인라인뷰 from
-- 위의 문제를 인라인뷰로 만들기
select *
from employees as e,(select *
						from salaries 
							where salary = (select max(salary) from salaries)) as s
where e.emp_no = s.emp_no;

-- 문제 3 스칼라 select	
-- 각 사원의 정보에 초봉정보까지 포함
select *,(select s.salary
				from salaries as s
					where e.emp_no = s.emp_no
                     group by emp_no) as 연봉
from employees as e;

-- 중첩 직급이 senior engineer 인 직원의 정보만 출력하기
select *
from employees
where emp_no in ( select emp_no
					from titles
						where title = 'Senior Engineer');
-- 인라인 뷰
-- 연봉이 80_000 이상인 사람의 정보만 출력하시오. (employees 테이블 사용하기)
select e.emp_no, e.last_name, e.gender, s.salary
from employees as e, ( select *
							from salaries
							where salary >= 80000
								group by emp_no) as s
where e.emp_no = s.emp_no;

-- 추가 문제
-- 위 쿼리를 join 문으로 변경해서 출력해보세요 ( query cost 값 비교해보기)

-- 스칼라 
-- 직원의 사번과 last_name, 연봉을 출력하라
   