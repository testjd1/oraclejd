-- 1. 사원번호, 이름, 업무, 급여,  현재 급여에 15% 증가된 급여를(New Salary),  증가액(Increase)를 출력
select empno, ename, job, sal, sal*1.15 as NEW_Salary, sal*1.15-sal as Increase
from emp;

-- 2. 이름, 입사일, 입사일로부터 6개월 후에 돌아오는 월요일을 출력
select ename, hiredate, next_day(add_months( hiredate, 6),2) as commonday
from emp;

--3.이름, 입사일, 입사일로부터 현재까지의  년수, 급여, 입사일로부터 현재까지의 급여의 총계를 출력

select ename, hiredate, trunc(months_between(sysdate,hiredate)/12,0) as workyear,
sal, sal*trunc(months_between(sysdate,hiredate)/12,0) as sumsal
from emp;

--4.이름, 업무, 입사일, 입사한 요일을 출력
SELECT  ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE,'DAY') AS 입사한_요일
FROM    EMP; 
?
--5. 업무별, 부서별 급여 합계와 인원수를 출력하되, 
   --10번 부서를 제외하고 업무가 ‘SALESMAN’과 ‘MANAGER’만 출력한다.
SELECT JOB, DEPTNO, SUM(SAL) AS SUM, COUNT(*) AS 인원수
FROM    EMP
WHERE   DEPTNO !=10
GROUP BY JOB,DEPTNO
HAVING JOB IN('SALESMAN','MANAGER');

--6. 업무별로 평균급여와 최대급여를 출력하되, 평균급여가 2000이상인 것만 출력하고 평균급여가 높은 순으로 정렬
SELECT JOB, TRUNC(AVG(SAL)), MAX(SAL)
FROM    EMP
--WHERE
GROUP BY JOB
HAVING AVG(SAL)>=2000
ORDER BY AVG(SAL) DESC;
--7. 같은 입사년도 별로 인원수를 출력
SELECT TO_CHAR(HIREDATE,'YYYY') AS 입사년도, COUNT(*)
FROM    EMP
 
GROUP BY TO_CHAR(HIREDATE,'YYYY');


--8. 5개씩 급여합계와 인원수를 출력 (rownum이용)

select rownum , sum(sal)
from emp
where rownum <5;


--9. 다음과 같이 출력

select job, count(job)
from emp
where job not in('PRESIDENT', 'ANALYST')
group by job;


select *
from( 
    select job  from emp
)
pivot(
    count(job) for job in ('CLERK','SALESMAN','MANAGER')
);

--10. 다음과 같이 업무별, 부서별 출력

select job, deptno, sum(sal) as sumsal
from emp
group by job, deptno;

select *
from(deptno, sum(sal) from emp)

--8. 5개씩 급여합계와 인원수를 출력 (rownum이용)
    

--9. 다음과 같이 출력
-- CLERK SALESMAN MANAGER (업무명)
select count(decode(job,'CLERK', 1)) CLERK, count(decode(job,'SALESMAN',1)) SALESMAN,
count(decode(job,'MANAGER',1)) MANAGER
from emp;

--10. 다음과 같이 업무별, 부서별 출력
select job, nvl(sum(decode(deptno,'10',sal)),0) "10번부서", nvl(sum(decode(deptno,'20',sal)),0) "20번부서",
nvl(sum(decode(deptno,'30',sal)),0) "30번부서", sum(sal) as 급여합계
from emp
group by job;





