/*
select  �˻��� �׸��
from    ���̺� ��
where   ����

*/
-- ��� ����� ������ �޿�, �޿��� ���ʽ��� ���� �հ� ���

select  ename, sal, sal+nvl(comm,0) As total_sal   
from    emp; 

select ename ||'  '||job
from emp;

select distinct job from emp;  -- �ߺ� �� ���ֱ�

?

-- 1- 20�� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
select empno, ename, deptno
from emp
where deptno = 20;

-- 2- �Ի����� 81/01/01���� 81/06/09�� ����� �����ȣ, �̸�, �Ի����� ���
SELECT EMPNO,ENAME,HIREDATE
FROM    EMP
WHERE   HIREDATE  between '81/01/01' AND '81/06/09';

?
-- 3- �������� salesman, clerk�� ������� �̸��� ������ ���
select ename, job
from emp
where JOB ='SALESMAN' OR JOB='CLERK';

select ename, job
from emp
where JOB  In('SALESMAN','CLERK');

-- 4- ������ president�̰� �޿��� 1500�̻��̰ų� ������ salesman�� ����� ������ ���
select *
from emp
where JOB='PRESIDENT' AND SAL>=1500 OR JOB='SALESMAN' ;

-- 5- ������ president �Ǵ� salesman�̰� �޿��� 1500�̻��� ����� ������ ���
SELECT *
FROM EMP
WHERE (JOB='PRESIDENT' OR JOB='SALESMAN') AND SAL>=1500;

-- 6- Ŀ�̼�(comm)�� ���� ����� �̸�, �޿�, Ŀ�̼��� ���
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM is NULL or comm = 0;


--  7- �����, �޿�, Ŀ�̼�, �ѱ޿�( �޿� + Ŀ�̼�)�� ���
SELECT  ENAME, SAL, COMM, SAL+ nvl(COMM,0) as total
FROM    EMP;

-- 8- �̸� A�� �����ϴ� ����� ���
select ename
from emp
where ename like 'A%';



-- 9- �̸��� �ι�° ���ڰ� L�� ����� ���
select ename
from emp
where ename like '_L%';
--WHERE INSTR(ENAME,'L',2,1)=2;


-- 10- �̸��� L�� �� �� �̻� ���Ե� ����� ���
select ename
from emp
where ename like '%L%L%';



-- 11- Ŀ�̼�(COMM)�� NULL�� �ƴ� ����� ��� ������ ���
select  *
from emp
where comm is not null;

?

-- 12- ���ʽ��� �޿����� 10%�̻� ���� ��� ����� ���� �̸�, �޿�, ���ʽ��� ���
select ename, sal, comm
from emp
where comm >= (sal*0.1);


-- 13- ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� �ƴ� ��� ����� ������ ���
select *
from EMP
WHERE   job in ('CLERK','ANALYST') AND sal not in(1000,3000,5000);

-- 14- �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ���
select *
from emp
where deptno = 30 or mgr = 7782;

commit;


