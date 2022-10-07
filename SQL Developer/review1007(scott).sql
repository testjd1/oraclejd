--11. scott 또는 ward와 월급이 같은 사원의 정보를 이름, 업무, 급여를 출력
select *
from emp
where sal in (select sal from emp e2 where e2.ename= 'SCOTT' or e2.ename='WARD');

--12. chicago에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력

-- 시카고 근무 사원
select e1.ename, e1.job
from emp e1 full join dept d
on e1.deptno = d.deptno
where d.loc = 'CHICAGO';

select e2.ename, e2.job
from emp e2
where e2.job in (select  e1.job
from emp e1 full join dept d
on e1.deptno = d.deptno
where d.loc = 'CHICAGO');


-- 13. 부서별로 월급이 평균 월급보다 높은 사원을 부서번호, 이름, 급여를 출력

SELECT E1.DEPTNO, E1.ENAME, E1.SAL
FROM   EMP E1,(SELECT DEPTNO,avg(sal) AVG FROM EMP GROUP BY DEPTNO) E
WHERE  E1.DEPTNO=E.DEPTNO
AND    E1.SAL> E.AVG;

select deptno,ename, sal
from  emp
group by deptno,ename, sal
having sal > (select round(avg(sal)) from emp);

SELECT deptno, ename, sal
FROM emp e1
WHERE sal > (SELECT AVG(sal)
FROM emp e2
WHERE e1.deptno = e2.deptno)
ORDER BY deptno;



--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp;

select *
from v_emp;
desc v_emp;


-- 가상테이블에 입력해도 원본에도 들어감
insert into v_emp values(1000,'홍길동',20);
select * from v_emp;
select * from emp;


-- 원래 조건의 pk조건 걸림 -> 오류
insert * into v_emp values(1000,'홍홍이',20); 

-- 원래 조건의 fk조건 걸림 -> 오류
insert * into v_emp values(2000,'홍홍이',90); 


CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp
           with read only;
           
           
-- 읽기전용으로 되어 있어서 새로 못넣음          
insert * into v_emp values(2000,'홍홍이',30);     

/*
[ 연습 ] EMP 테이블에서 30번 부서만 
EMPNO를 EMP_NO로 ENAME을 NAME로 SAL를 SALARY로 바꿔서 
EMP_30 뷰를 생성하시오
*/

-- 1. updatable 뷰
CREATE OR REPLACE VIEW EMP_30  AS
           select empno emp_no, ename name, sal salary  from emp emp_no
           where deptno = 30;
           
select*from emp_30;

-- 2. read-only 뷰

CREATE OR REPLACE VIEW v_emp_30  AS
           select empno emp_no, ename name, sal salary  from emp
           where deptno = 30
           with read only;
           
select*from v_emp_30;



-- 3. 복합 뷰
Create or replace view v_emp_info as

select e.empno empno, e.ename ename, d.dname dname 

from emp e, dept d

where e.deptno=d.deptno;

select*from v_emp_info;

insert into v_emp_info(empno,ename,dname) values(3333,'맹꽁이',30); -- 30은 다른 테이블이므로 안들어감

insert into v_emp_info(empno,ename) values(3333,'맹꽁이'); -- 이건 들어감

delete from v_emp_info where empno = 7788;


/*
 [ 연습 ] 부서별로 부서명, 최소급여, 최대 급여, 부서의 평균 급여를 포함하는 V_DEPT_SUM 뷰를 생성하여라.
 */
create or replace view v_dept_sum as
select  d.dname dnam, min(e.sal) minsal, max(e.sal) maxsal, round(avg(e.sal)) avgsal
from emp e left outer join dept d
on e.deptno = d.deptno
group by d.dname
with read only;

select * from v_dept_sum ;


insert into emp(empno, ename, sal, deptno)
values(4444,'호이',9900,20);              -- 추가하면 자동으로 뷰도 바뀜


create sequence seq_temp;
select seq_temp.nextval from dual;
select seq_temp.currval from dual;

-- 5000번 부터 10개씩 증가하는 자동 증가 수
create sequence seq_temp10
    increment by 10
    start with 5000;
 
insert into emp(empno, ename) values ( seq_temp10.nextval , '박씨');    
select*from emp;



desc emp;
select empno, ename, job, rowid from emp;
