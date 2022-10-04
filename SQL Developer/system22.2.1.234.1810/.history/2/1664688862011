/*
select  검색할 항목들
from    테이블 명
where   조건

*/
-- 모든 사원의 사원명과 급여, 급여와 보너스를 더한 합계 출력

select  ename, sal, sal+nvl(comm,0) As total_sal   
from    emp; 

select ename ||'  '||job
from emp;

select distinct job from emp;  -- 중복 값 없애기

?

-- 1- 20번 부서에서 근무하는 사원의 사원번호, 이름, 부서번호 출력
select empno, ename, deptno
from emp
where deptno = 20;

-- 2- 입사일이 81/01/01에서 81/06/09인 사원의 사원번호, 이름, 입사일을 출력
SELECT EMPNO,ENAME,HIREDATE
FROM    EMP
WHERE   HIREDATE  between '81/01/01' AND '81/06/09';

?
-- 3- 담당업무가 salesman, clerk인 사원들의 이름과 업무를 출력
select ename, job
from emp
where JOB ='SALESMAN' OR JOB='CLERK';

select ename, job
from emp
where JOB  In('SALESMAN','CLERK');

-- 4- 업무가 president이고 급여가 1500이상이거나 업무가 salesman인 사원의 정보를 출력
select *
from emp
where JOB='PRESIDENT' AND SAL>=1500 OR JOB='SALESMAN' ;

-- 5- 업무가 president 또는 salesman이고 급여가 1500이상인 사원의 정보를 출력
SELECT *
FROM EMP
WHERE (JOB='PRESIDENT' OR JOB='SALESMAN') AND SAL>=1500;

-- 6- 커미션(comm)이 없는 사원의 이름, 급여, 커미션을 출력
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM is NULL or comm = 0;


--  7- 사원명, 급여, 커미션, 총급여( 급여 + 커미션)을 출력
SELECT  ENAME, SAL, COMM, SAL+ nvl(COMM,0) as total
FROM    EMP;

-- 8- 이름 A로 시작하는 사원명 출력
select ename
from emp
where ename like 'A%';



-- 9- 이름이 두번째 문자가 L인 사원명 출력
select ename
from emp
where ename like '_L%';
--WHERE INSTR(ENAME,'L',2,1)=2;


-- 10- 이름에 L이 두 번 이상 포함된 사원명 출력
select ename
from emp
where ename like '%L%L%';



-- 11- 커미션(COMM)이 NULL이 아닌 사원의 모든 정보를 출력
select  *
from emp
where comm is not null;

?

-- 12- 보너스가 급여보다 10%이상 많은 모든 사원에 대해 이름, 급여, 보너스를 출력
select ename, sal, comm
from emp
where comm >= (sal*0.1);


-- 13- 업무가 clerk이거나 analyst이고 급여가 1000, 3000, 5000이 아닌 모든 사원의 정보를 출력
select *
from EMP
WHERE   job in ('CLERK','ANALYST') AND sal not in(1000,3000,5000);

-- 14- 부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력
select *
from emp
where deptno = 30 or mgr = 7782;

commit;


