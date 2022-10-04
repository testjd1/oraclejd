DROP TABLE DEPT;

CREATE TABLE DEPT

       (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,

DNAME VARCHAR2(14) ,

LOC VARCHAR2(13) ) ;

DROP TABLE EMP;

CREATE TABLE EMP

       (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,

ENAME VARCHAR2(10),

JOB VARCHAR2(9),

MGR NUMBER(4),

HIREDATE DATE,

SAL NUMBER(7,2),

COMM NUMBER(7,2),

DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

INSERT INTO DEPT VALUES

(10,'ACCOUNTING','NEW YORK');

INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');

INSERT INTO DEPT VALUES

(30,'SALES','CHICAGO');

INSERT INTO DEPT VALUES

(40,'OPERATIONS','BOSTON');

INSERT INTO EMP VALUES

(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);

INSERT INTO EMP VALUES

(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);

INSERT INTO EMP VALUES

(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);

INSERT INTO EMP VALUES

(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);

INSERT INTO EMP VALUES

(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);

INSERT INTO EMP VALUES

(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);

INSERT INTO EMP VALUES

(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);

INSERT INTO EMP VALUES

(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy')-85,3000,NULL,20);

INSERT INTO EMP VALUES

(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);

INSERT INTO EMP VALUES

(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);

INSERT INTO EMP VALUES

(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy')-51,1100,NULL,20);

INSERT INTO EMP VALUES

(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);

INSERT INTO EMP VALUES

(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);

INSERT INTO EMP VALUES

(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

DROP TABLE BONUS;

CREATE TABLE BONUS

(

ENAME VARCHAR2(10) ,

JOB VARCHAR2(9)  ,

SAL NUMBER,

COMM NUMBER

) ;

DROP TABLE SALGRADE;

CREATE TABLE SALGRADE

      ( GRADE NUMBER,

LOSAL NUMBER,

HISAL NUMBER );

INSERT INTO SALGRADE VALUES (1,700,1200);

INSERT INTO SALGRADE VALUES (2,1201,1400);

INSERT INTO SALGRADE VALUES (3,1401,2000);

INSERT INTO SALGRADE VALUES (4,2001,3000);

INSERT INTO SALGRADE VALUES (5,3001,9999);

COMMIT;

?

SET TERMOUT ON

SET ECHO ON


-- �����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���
SELECT  ENAME, SAL, ROUND(SAL/12, -2) AS WOLGUP
FROM    EMP;
-- -2�� 10�� �ڸ� -1�� 1���ڸ�, �Ҽ����� �ƴ϶� ���� �����ڸ��� �ݿø��Ҷ� ����.

-- �����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
SELECT  ENAME, SAL, sal*0.033, TRUNC(SAL*0.033,-1) AS SEGUM
FROM    EMP;

-- smith�� ������ �����ȣ, ����, ������(�ҹ���) ���
select empno,  ename, lower(job) as sjob
from emp
where ename ='SMITH';
-- where lower(ename = ' smith')



-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ� �빮��)�� ���
select empno,  INITCAP(ename)as uname , INITCAP(job) as ujob
from emp

-- �̸��� ù���ڰ� ��K������ ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;

-- �̸��� 5���� �̻��� ������� ���
select*
from emp
where length(ename)>=5;


-- �̸��� 15�ڷ� ���߰� ���ڴ� ���ʿ� �����ʿ��� ��*���� ä���
select RPAD(ename,15,'*') as rstname
from emp;

-- �޿��� 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���
select LPAD(sal,10,'-') as lubsal
from emp;


select name,jumin , substr(jumin,8,1) gender,
                    substr(jumin,1,2) birth_year
from info_tab;

- ���� ������ ����

select '-' || trim(' �̼��� ') || '-' as col1, 

'-' || ltrim(' �̼��� ') || '-' as col2, 

'-' || rtrim(' �̼��� ') || '-' as col3 from dual;


from dual;
select sysdate
from dual;


-- �޿��� ���ڿ��� �������̻�����ĥ�ȱ��� ���ڷ� ��ü
select sal, TRANSLATE ( sal, '0123456789', '�����̻�����ĥ�ȱ�' ) as chsal
from emp;

-- �޿��� ���ڿ��� 0�� ��$���� �ٲپ� ���
select sal, TRANSLATE ( sal, '0', '$' ) as chsal2
from emp;


--*****

select replace(' �� �� ��           ',' ','') as ename
from dual;


-- ������� �ٹ��� ���� ���� ��� ������ ���
select *
from emp
order by  hiredate;

-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���
select ename, (trunc(sysdate,'day') - trunc(hiredate,'day'))/7 as howweek,
                (trunc(sysdate) - trunc(hiredate)) as howday

from emp
order by howweek desc;

SELECT ename, sysdate-hiredate,
trunc((sysdate-hiredate)/7,0) as weeks,
floor(mod(sysdate-hiredate, 7)) as days
FROM emp;
        
from emp
order by howweek desc;



-- 10�� �μ��� ����� ��������� �ٹ� ������ ��� 
select ename, ceil(months_between(sysdate,hiredate)) as nowmonth
                
from emp
where deptno = 10;


-- ���� ��¥���� 3���� ���� ��¥ ���ϱ�
select  add_months( sysdate, 3 ) as mydate 
from dual;

-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
select next_day(sysdate,2) as cmmonday
from dual; 

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
select last_day(sysdate) as lastday
from dual;



-- �Ի����ڿ��� �Ի�⵵�� ���
select ename, hiredate, to_char(hiredate,'YYYY') as hire_year
from emp;

-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
select hiredate,to_char(hiredate,'YYYY"��" MM"��" DD"��"') as full_day

from emp;

-- 1981�⵵�� �Ի��� ��� �˻�
select * 
from emp
where To_char(hiredate,'yyyy') = 1981;


-- 5���� �Ի��� ��� �˻�
select * 
from emp
where To_char(hiredate,'mm') = 05;


-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
select ename, sal, to_char(sal,'$999,999,999,999') as dollar
from emp;

--   81 �� 2�� �Ի� ���
select * 
from emp
where To_char(hiredate,'yyyy-mm') = '1981-02';

-- 81�⿡ �Ի�x ���

select * 
from emp
where To_char(hiredate,'yyyy') != 1981;


-- 81�� �Ϲݱ⿡ �Ի� 
select * 
from emp
where To_char(hiredate,'yyyy-mm') >= '1981-07' and
        To_char(hiredate,'yyyy-mm') < '1982-01' ;
-- WHERE to_char(hiredate,'YYYY-MM') between '1981-07' and '1981-12';


--- between : ����x





-- �ֹι�ȣ���� ���� ���ϱ�

SELECT jumin, decode( substr(jumin, 8, 1), '1', '����', '3', '����', '����') AS gender 
FROM info_tab;


SELECT CASE substr( jumin, 8, 1) 
            WHEN '1' THEN '����'
            WHEN '3' THEN '����'         
            ELSE '����'      
            END as gender

FROM info_tab;


-- �μ���ȣ�� 10�̸� ������, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���
SELECT  deptno,decode( DEPTNO, 10, '������', 20, '������',30, 'IT��','�����') AS �μ� 
FROM emp;

SELECT deptno, CASE DEPTNO
            WHEN 10 THEN '����'
            WHEN 20 THEN '������'
            WHEN 30 THEN 'IT��' 
            ELSE '�����'      
            END as �μ�
from emp;


-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ��� �����ȣ, �����, ����, �޿�, ������ �޿��� ���
SELECT  job,decode( JOB, 'ANALYST', sal*1.1, 'CLERK', sal*1.15,'MANAGER', sal*1.2,sal) AS �����ѱ޿� 
FROM emp;

SELECT EMPNO, ENAME,JOB,SAL, case JOB
                                WHEN 'ANALYST' THEN sal*1.1
                                WHEN 'CLERK' THEN sal*1.15
                                WHEN 'MANAGER' THEN sal*1.2 
                                else sal
                                END as ������_�޿�
from emp;



select all job from emp;
select distinct job from emp;
desc emp;
select rownum, empno,ename, job from emp;
select rownum, empno,ename, job from emp where rownum<10;


-- ������ ��SALESMAN���� ������� ������ ���, ����, �ּҰ�, �ִ밪�� ���ϱ�
select avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
from emp
where job = 'SALESMAN';

insert INTO EMP(EMPNO, ENAME, JOB)
VALUES(9001, 'ȫ�汹','SALESMAN');


-- Ŀ�̼�(COMM)�� �޴� ������� ����

SELECT COUNT(COMM)
FROM EMP
WHERE COMM>0;

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
select  count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal)
from emp
-- where
group by deptno;
-- having
-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� ( �μ��� �޿��� ���� ���� ������
select  count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal) as sum
from emp
-- where
group by deptno
-- having
order by sum desc;

-- �μ��� ������ �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�
select  deptno,job, count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal)
from emp
-- where
group by deptno, job;


-- �ִ� �޿��� 2900 �̻��� �μ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���
select  deptno, round(avg(sal),-2), sum(sal)
from emp
having max(sal)>=2900
group by deptno;

-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���
select  job, round(avg(sal),-2), sum(sal)
from emp
having avg(sal)>=3000
group by job;

-- ��ü �հ� �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ���
-- ��, SALESMAN�� �����ϰ� �޿� �հ谡 ���� ������ ����
select  job, sum(sal) as sum
from emp
where job != 'SALESMAN'
having sum(sal)>5000
group by job
order by sum desc;


-- ������ �ְ� �޿��� �ּ� �޿��� ���̸� ���϶�
select  job, (max(sal) - min(sal)) as cha
from emp
group by job;
-- ���� Ȯ���Ϸ��� job ���Ƿ� �־���.

-- �μ� �ο��� 4�� ���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���
select  deptno, count(*) ,  sum(sal) as sum
from emp
-- where
having count(deptno) >4
group by deptno;



