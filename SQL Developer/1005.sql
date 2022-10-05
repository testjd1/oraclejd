-- 1. �����ȣ, �̸�, ����, �޿�,  ���� �޿��� 15% ������ �޿���(New Salary),  ������(Increase)�� ���
select empno, ename, job, sal, sal*1.15 as NEW_Salary, sal*1.15-sal as Increase
from emp;

-- 2. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �Ŀ� ���ƿ��� �������� ���
select ename, hiredate, next_day(add_months( hiredate, 6),2) as commonday
from emp;

--3.�̸�, �Ի���, �Ի��Ϸκ��� ���������  ���, �޿�, �Ի��Ϸκ��� ��������� �޿��� �Ѱ踦 ���

select ename, hiredate, trunc(months_between(sysdate,hiredate)/12,0) as workyear,
sal, sal*trunc(months_between(sysdate,hiredate)/12,0) as sumsal
from emp;

--4.�̸�, ����, �Ի���, �Ի��� ������ ���
SELECT  ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE,'DAY') AS �Ի���_����
FROM    EMP; 
?
--5. ������, �μ��� �޿� �հ�� �ο����� ����ϵ�, 
   --10�� �μ��� �����ϰ� ������ ��SALESMAN���� ��MANAGER���� ����Ѵ�.
SELECT JOB, DEPTNO, SUM(SAL) AS SUM, COUNT(*) AS �ο���
FROM    EMP
WHERE   DEPTNO !=10
GROUP BY JOB,DEPTNO
HAVING JOB IN('SALESMAN','MANAGER');

--6. �������� ��ձ޿��� �ִ�޿��� ����ϵ�, ��ձ޿��� 2000�̻��� �͸� ����ϰ� ��ձ޿��� ���� ������ ����
SELECT JOB, TRUNC(AVG(SAL)), MAX(SAL)
FROM    EMP
--WHERE
GROUP BY JOB
HAVING AVG(SAL)>=2000
ORDER BY AVG(SAL) DESC;
--7. ���� �Ի�⵵ ���� �ο����� ���
SELECT TO_CHAR(HIREDATE,'YYYY') AS �Ի�⵵, COUNT(*)
FROM    EMP
 
GROUP BY TO_CHAR(HIREDATE,'YYYY');


--8. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)

select rownum , sum(sal)
from emp
where rownum <5;


--9. ������ ���� ���

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

--10. ������ ���� ������, �μ��� ���

select job, deptno, sum(sal) as sumsal
from emp
group by job, deptno;

select *
from(deptno, sum(sal) from emp)

--8. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)
    

--9. ������ ���� ���
-- CLERK SALESMAN MANAGER (������)
select count(decode(job,'CLERK', 1)) CLERK, count(decode(job,'SALESMAN',1)) SALESMAN,
count(decode(job,'MANAGER',1)) MANAGER
from emp;

--10. ������ ���� ������, �μ��� ���
select job, nvl(sum(decode(deptno,'10',sal)),0) "10���μ�", nvl(sum(decode(deptno,'20',sal)),0) "20���μ�",
nvl(sum(decode(deptno,'30',sal)),0) "30���μ�", sum(sal) as �޿��հ�
from emp
group by job;





