
-- 사원 테이블에 사원명과 부서테이블에 그 사원의 부서명 출력
SELECT ename, dname
from emp, dept;


select emp.ename, dept.dname, dept.deptno
from emp, dept;


select e.ename , d.dname , d.deptno 
from emp e, dept d
where e.deptno = d.deptno;


-- 내부 조인
select e.ename ename, d.dname dname, d.deptno deptno
from emp e INNER JOIN dept d
on e.deptno = d.deptno;





-- 외부 조인
select e.ename ename, d.dname dname, d.deptno deptno
from emp e Left outer join dept d
on e.deptno = d.deptno;

select e.ename ename, d.dname dname, d.deptno deptno
from emp e Right outer join dept d
on e.deptno = d.deptno;

select e.ename ename, d.dname dname, d.deptno deptno
from emp e, dept d
where e.deptno(+) = d.deptno(+); -- -> 양쪽 다붙임 - 에러 발생

select e.ename ename, d.dname dname, d.deptno deptno
from emp e  full outer join dept d
on e.deptno = d.deptno;


-- 사원 테이블의 스미스 조회
select e1.empno, e1.ename,e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;



select e1.empno empno1, e1.ename ename1 ,e2.empno empno2, e2.ename ename2
from emp e1 left join emp e2
on e1.mgr = e2.empno;



-- 외부 조인?
select e1.empno, e1.ename,e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);



-- 집합

SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'

-- SMITH / ADAMS / JAMES / MILLER

MINUS

SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
--CLARK / KING / MILLER



?

--1. EMP 테이블에서 사원번호, 이름, 업무, 부서번호와 DEPT 테이블에서 부서명, 근무지를 출력
select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
from emp e left join dept d
on e.deptno = d.deptno;
?

?

--2. SALESMAN 사원만 사원번호, 이름, 급여, 부서명, 근무지를 출력
select e.empno, e.ename, e.sal, d.dname, d.loc
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

?

?

--3. 보너스(comm)를 받는 사원에 대해 이름, 부서명, 위치를 출력
select  e.ename, d.dname, d.loc
from emp e left outer join dept d
on e.deptno = d.deptno
where e.comm>0;
?

?

--4. 부서별 부서명과 급여 합계를 출력
select d.dname, sum(e.sal) as sumsal
from emp e right outer join dept d
on e.deptno = d.deptno
group by d.dname;
?

?

-- 5. 업무가 ‘MANAGER’인 사원의 정보를 이름, 업무, 부서명, 근무지를 출력 
select e.ename, e.job, d.dname, d.loc
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'MANAGER';
?

?

?

-- =====================================================
