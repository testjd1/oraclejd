--11. scott �Ǵ� ward�� ������ ���� ����� ������ �̸�, ����, �޿��� ���
select *
from emp
where sal in (select sal from emp e2 where e2.ename= 'SCOTT' or e2.ename='WARD');

--12. chicago���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�, ������ ���

-- ��ī�� �ٹ� ���
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


-- 13. �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿��� ���

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


-- �������̺� �Է��ص� �������� ��
insert into v_emp values(1000,'ȫ�浿',20);
select * from v_emp;
select * from emp;


-- ���� ������ pk���� �ɸ� -> ����
insert * into v_emp values(1000,'ȫȫ��',20); 

-- ���� ������ fk���� �ɸ� -> ����
insert * into v_emp values(2000,'ȫȫ��',90); 


CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp
           with read only;
           
           
-- �б��������� �Ǿ� �־ ���� ������          
insert * into v_emp values(2000,'ȫȫ��',30);     

/*
[ ���� ] EMP ���̺��� 30�� �μ��� 
EMPNO�� EMP_NO�� ENAME�� NAME�� SAL�� SALARY�� �ٲ㼭 
EMP_30 �並 �����Ͻÿ�
*/

-- 1. updatable ��
CREATE OR REPLACE VIEW EMP_30  AS
           select empno emp_no, ename name, sal salary  from emp emp_no
           where deptno = 30;
           
select*from emp_30;

-- 2. read-only ��

CREATE OR REPLACE VIEW v_emp_30  AS
           select empno emp_no, ename name, sal salary  from emp
           where deptno = 30
           with read only;
           
select*from v_emp_30;



-- 3. ���� ��
Create or replace view v_emp_info as

select e.empno empno, e.ename ename, d.dname dname 

from emp e, dept d

where e.deptno=d.deptno;

select*from v_emp_info;

insert into v_emp_info(empno,ename,dname) values(3333,'�Ͳ���',30); -- 30�� �ٸ� ���̺��̹Ƿ� �ȵ�

insert into v_emp_info(empno,ename) values(3333,'�Ͳ���'); -- �̰� ��

delete from v_emp_info where empno = 7788;


/*
 [ ���� ] �μ����� �μ���, �ּұ޿�, �ִ� �޿�, �μ��� ��� �޿��� �����ϴ� V_DEPT_SUM �並 �����Ͽ���.
 */
create or replace view v_dept_sum as
select  d.dname dnam, min(e.sal) minsal, max(e.sal) maxsal, round(avg(e.sal)) avgsal
from emp e left outer join dept d
on e.deptno = d.deptno
group by d.dname
with read only;

select * from v_dept_sum ;


insert into emp(empno, ename, sal, deptno)
values(4444,'ȣ��',9900,20);              -- �߰��ϸ� �ڵ����� �䵵 �ٲ�


create sequence seq_temp;
select seq_temp.nextval from dual;
select seq_temp.currval from dual;

-- 5000�� ���� 10���� �����ϴ� �ڵ� ���� ��
create sequence seq_temp10
    increment by 10
    start with 5000;
 
insert into emp(empno, ename) values ( seq_temp10.nextval , '�ھ�');    
select*from emp;



desc emp;
select empno, ename, job, rowid from emp;
