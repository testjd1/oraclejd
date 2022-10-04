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


-- 사원명, 급여, 월급(급여/12)를 출력하되 월급은 십단위에서 반올림하여 출력
SELECT  ENAME, SAL, ROUND(SAL/12, -2) AS WOLGUP
FROM    EMP;
-- -2는 10의 자리 -1은 1의자리, 소수점이 아니라 양의 정수자리를 반올림할때 쓴다.

-- 사원명, 급여, 세금(급여의 3.3%)를 원단위 절삭하고 출력
SELECT  ENAME, SAL, sal*0.033, TRUNC(SAL*0.033,-1) AS SEGUM
FROM    EMP;

-- smith의 정보를 사원번호, 성명, 담당업무(소문자) 출력
select empno,  ename, lower(job) as sjob
from emp
where ename ='SMITH';
-- where lower(ename = ' smith')



-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만 대문자)로 출력
select empno,  INITCAP(ename)as uname , INITCAP(job) as ujob
from emp

-- 이름의 첫글자가 ‘K’보다 크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬
select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;

-- 이름이 5글자 이상인 사원들을 출력
select*
from emp
where length(ename)>=5;


-- 이름을 15자로 맞추고 글자는 왼쪽에 오른쪽에는 ‘*’로 채운다
select RPAD(ename,15,'*') as rstname
from emp;

-- 급여는 10자로 맞추고 숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다
select LPAD(sal,10,'-') as lubsal
from emp;


select name,jumin , substr(jumin,8,1) gender,
                    substr(jumin,1,2) birth_year
from info_tab;

- 양쪽 공백을 제거

select '-' || trim(' 이순신 ') || '-' as col1, 

'-' || ltrim(' 이순신 ') || '-' as col2, 

'-' || rtrim(' 이순신 ') || '-' as col3 from dual;


from dual;
select sysdate
from dual;


-- 급여를 숫자에서 ‘영일이삼사오육칠팔구’ 글자로 대체
select sal, TRANSLATE ( sal, '0123456789', '영일이삼사오육칠팔구' ) as chsal
from emp;

-- 급여의 숫자에서 0을 ‘$’로 바꾸어 출력
select sal, TRANSLATE ( sal, '0', '$' ) as chsal2
from emp;


--*****

select replace(' 이 순 신           ',' ','') as ename
from dual;


-- 현재까지 근무일 수가 많은 사람 순으로 출력
select *
from emp
order by  hiredate;

-- 현재까지 근무일 수가 몇 주 몇 일인가를 출력
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



-- 10번 부서의 사원의 현재까지의 근무 월수를 계산 
select ename, ceil(months_between(sysdate,hiredate)) as nowmonth
                
from emp
where deptno = 10;


-- 현재 날짜에서 3개월 후의 날짜 구하기
select  add_months( sysdate, 3 ) as mydate 
from dual;

-- 현재 날짜에서 돌아오는 ‘월’요일의 날짜 구하기
select next_day(sysdate,2) as cmmonday
from dual; 

-- 현재 날짜에서 해당 월의 마지막 날짜 구하기
select last_day(sysdate) as lastday
from dual;



-- 입사일자에서 입사년도를 출력
select ename, hiredate, to_char(hiredate,'YYYY') as hire_year
from emp;

-- 입사일자를 ‘1999년 1월 1일’ 형식으로 출력
select hiredate,to_char(hiredate,'YYYY"년" MM"월" DD"일"') as full_day

from emp;

-- 1981년도에 입사한 사원 검색
select * 
from emp
where To_char(hiredate,'yyyy') = 1981;


-- 5월에 입사한 사원 검색
select * 
from emp
where To_char(hiredate,'mm') = 05;


-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력
select ename, sal, to_char(sal,'$999,999,999,999') as dollar
from emp;

--   81 년 2월 입사 사원
select * 
from emp
where To_char(hiredate,'yyyy-mm') = '1981-02';

-- 81년에 입사x 사원

select * 
from emp
where To_char(hiredate,'yyyy') != 1981;


-- 81년 하반기에 입사 
select * 
from emp
where To_char(hiredate,'yyyy-mm') >= '1981-07' and
        To_char(hiredate,'yyyy-mm') < '1982-01' ;
-- WHERE to_char(hiredate,'YYYY-MM') between '1981-07' and '1981-12';


--- between : 포함x





-- 주민번호에서 성별 구하기

SELECT jumin, decode( substr(jumin, 8, 1), '1', '남자', '3', '남자', '여자') AS gender 
FROM info_tab;


SELECT CASE substr( jumin, 8, 1) 
            WHEN '1' THEN '남자'
            WHEN '3' THEN '남자'         
            ELSE '여자'      
            END as gender

FROM info_tab;


-- 부서번호가 10이면 영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력
SELECT  deptno,decode( DEPTNO, 10, '영업부', 20, '관리부',30, 'IT부','기술부') AS 부서 
FROM emp;

SELECT deptno, CASE DEPTNO
            WHEN 10 THEN '영업'
            WHEN 20 THEN '관리부'
            WHEN 30 THEN 'IT부' 
            ELSE '기술부'      
            END as 부서
from emp;


-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력
SELECT  job,decode( JOB, 'ANALYST', sal*1.1, 'CLERK', sal*1.15,'MANAGER', sal*1.2,sal) AS 증가한급여 
FROM emp;

SELECT EMPNO, ENAME,JOB,SAL, case JOB
                                WHEN 'ANALYST' THEN sal*1.1
                                WHEN 'CLERK' THEN sal*1.15
                                WHEN 'MANAGER' THEN sal*1.2 
                                else sal
                                END as 증가한_급여
from emp;



select all job from emp;
select distinct job from emp;
desc emp;
select rownum, empno,ename, job from emp;
select rownum, empno,ename, job from emp where rownum<10;


-- 업무가 ‘SALESMAN’인 사람들의 월급의 평균, 총합, 최소값, 최대값을 구하기
select avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
from emp
where job = 'SALESMAN';

insert INTO EMP(EMPNO, ENAME, JOB)
VALUES(9001, '홍길국','SALESMAN');


-- 커미션(COMM)을 받는 사람들의 수는

SELECT COUNT(COMM)
FROM EMP
WHERE COMM>0;

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
select  count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal)
from emp
-- where
group by deptno;
-- having
-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 ( 부서별 급여의 합이 높은 순으로
select  count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal) as sum
from emp
-- where
group by deptno
-- having
order by sum desc;

-- 부서별 업무별 그룹하여 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하기
select  deptno,job, count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal)
from emp
-- where
group by deptno, job;


-- 최대 급여가 2900 이상인 부서에 대해 부서번호, 평균 급여, 급여의 합을 출력
select  deptno, round(avg(sal),-2), sum(sal)
from emp
having max(sal)>=2900
group by deptno;

-- 업무별 급여의 평균이 3000이상인 업무에 대해 업무명, 평균 급여, 급여의 합을 출력
select  job, round(avg(sal),-2), sum(sal)
from emp
having avg(sal)>=3000
group by job;

-- 전체 합계 급여가 5000를 초과하는 각 업무에 대해서 업무와 급여 합계를 출력
-- 단, SALESMAN은 제외하고 급여 합계가 높은 순으로 정렬
select  job, sum(sal) as sum
from emp
where job != 'SALESMAN'
having sum(sal)>5000
group by job
order by sum desc;


-- 업무별 최고 급여와 최소 급여의 차이를 구하라
select  job, (max(sal) - min(sal)) as cha
from emp
group by job;
-- 업무 확인하려고 job 임의로 넣었음.

-- 부서 인원이 4명 보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력
select  deptno, count(*) ,  sum(sal) as sum
from emp
-- where
having count(deptno) >4
group by deptno;



