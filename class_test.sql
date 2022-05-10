use employees;

select * from departments; -- dept_no(PRI) 부서넘버, dept_name(UNI) 부서명
select * from dept_emp; -- emp_no 사번, dept_no 부서넘버, frome_date 입사일, to_date 퇴사일 및 9999-01-01
select * from dept_manager; -- emp_no, dept_no , frome_date 매니저된날, to_date 바뀐날 및 9999-01-01
select * from employees; -- emp_no, birth_date, first_name, last_name, gender,hire_date 입사일
select * from salaries;  -- emp_no, salary, from_date 연봉시작일, to_date 연봉끝 9999-01-01
select * from titles; -- emp_no, title, from_date 보직일 , to_date 현재




-- 문제 1
-- 현재 근무하고있는 사람들의 부서명까지 출력
select a.emp_no, b.dept_name, a.to_date
from dept_emp as a
left join departments as b
on a.dept_no = b.dept_no
where a.to_date = '9999-01-01'
limit 20;

-- 문제 2
-- 연봉을 80000 이상 받는 사람의 이름과 최근 연봉을 출력
select e.emp_no, e.first_name, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
where s.salary >= '80000' and s.to_date = '9999-01-01'
limit 20;

-- 문제 3
-- 현재 각 부서의 매니저이름을 출력
select e.emp_no, e.first_name, d.dept_no
from employees as e
inner join dept_manager as d
on e.emp_no = d.emp_no
where d.to_date = '9999-01-01'
limit 20;

-- 문제 4
-- title 별 연봉 출력
select t.emp_no , t.title,s.salary, s.to_date
from titles as t
left join salaries as s
on t.emp_no = s.emp_no
where t.to_date = '9999-01-01' and s.to_date = '9999-01-01'
limit 20;

-- 문제 5
-- 현재 매니저들의 성별을 출력
select e.emp_no, e.first_name, e.gender, d.to_date
from employees as e
inner join dept_manager as d
on e.emp_no = d.emp_no
where d.to_date = '9999-01-01'

-- 문제 1 중첩 where
-- 최고연봉을 받는 사람의 정보를 출력해주세요
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
                     group by emp_no) as salary
from employees as e
limit 20;

-- 문제 4
-- 중첩 직급이 senior engineer 인 직원의 정보만 출력하기
select *
from employees
where emp_no in ( select emp_no
					from titles
						where title = 'Senior Engineer')
limit 20;
-- 문제 5
-- 인라인 뷰
-- 연봉이 80_000 이상인 사람의 정보만 출력하시오. (employees 테이블 사용하기)
select e.emp_no, e.last_name, e.gender, s.salary
from employees as e, ( select *
							from salaries
							where salary >= 80000
								group by emp_no) as s
where e.emp_no = s.emp_no
limit 20;