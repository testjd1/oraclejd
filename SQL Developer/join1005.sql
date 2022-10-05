
-- ��� ���̺� ������ �μ����̺� �� ����� �μ��� ���
SELECT ename, dname
from emp, dept;


select emp.ename, dept.dname, dept.deptno
from emp, dept;


select e.ename , d.dname , d.deptno 
from emp e, dept d
where e.deptno = d.deptno;


-- ���� ����
select e.ename ename, d.dname dname, d.deptno deptno
from emp e INNER JOIN dept d
on e.deptno = d.deptno;





-- �ܺ� ����
select e.ename ename, d.dname dname, d.deptno deptno
from emp e Left outer join dept d
on e.deptno = d.deptno;

select e.ename ename, d.dname dname, d.deptno deptno
from emp e Right outer join dept d
on e.deptno = d.deptno;

select e.ename ename, d.dname dname, d.deptno deptno
from emp e, dept d
where e.deptno(+) = d.deptno(+); -- -> ���� �ٺ��� - ���� �߻�

select e.ename ename, d.dname dname, d.deptno deptno
from emp e  full outer join dept d
on e.deptno = d.deptno;


-- ��� ���̺��� ���̽� ��ȸ
select e1.empno, e1.ename,e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;



select e1.empno empno1, e1.ename ename1 ,e2.empno empno2, e2.ename ename2
from emp e1 left join emp e2
on e1.mgr = e2.empno;



-- �ܺ� ����?
select e1.empno, e1.ename,e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);



-- ����

SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'

-- SMITH / ADAMS / JAMES / MILLER

MINUS

SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
--CLARK / KING / MILLER



?

--1. EMP ���̺��� �����ȣ, �̸�, ����, �μ���ȣ�� DEPT ���̺��� �μ���, �ٹ����� ���
select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
from emp e left join dept d
on e.deptno = d.deptno;
?

?

--2. SALESMAN ����� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ���
select e.empno, e.ename, e.sal, d.dname, d.loc
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

?

?

--3. ���ʽ�(comm)�� �޴� ����� ���� �̸�, �μ���, ��ġ�� ���
select  e.ename, d.dname, d.loc
from emp e left outer join dept d
on e.deptno = d.deptno
where e.comm>0;
?

?

--4. �μ��� �μ���� �޿� �հ踦 ���
select d.dname, sum(e.sal) as sumsal
from emp e right outer join dept d
on e.deptno = d.deptno
group by d.dname;
?

?

-- 5. ������ ��MANAGER���� ����� ������ �̸�, ����, �μ���, �ٹ����� ��� 
select e.ename, e.job, d.dname, d.loc
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'MANAGER';
?

?

?

-- =====================================================
