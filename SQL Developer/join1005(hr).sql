
--1. �̸��� ���� 'King' ����� ����� �μ����� ��� ( employees, departments )
select e.employee_id eid, d.department_name dname
from employees e left outer join departments d
on e.department_id = d.department_id
where e.last_name = 'King';
?

--2. �̸��� ���� 'King' ����� ����� �μ��� �׸��� �������� ��� ( employees, departments, jobs )
select e.employee_id eid, d.department_name dname , j.job_title 
from  departments d right outer join employees e
on  d.department_id = e.department_id
left join jobs j 
on e.job_id = j.job_id 
where e.last_name = 'King';
?

-- 3. 2007�� ��ݱ⿡ �Ի��� ������� ����� �̸�, �Ի��� �׸��� �μ����� ���
-- (*) Grant�� ���� �μ��� �������� ���� ���������� Grant�� ��µǷ���
select e.employee_id as ��� , concat(e.first_name,e.last_name) as �̸�, e.hire_date as �Ի���,
       d.department_name as �μ���
from employees e full outer join departments d
on e.department_id = d.department_id
where to_char(e.HIRE_DATE,'YYYY/MM') BETWEEN '2007/01' and '2007/06';

-- 4.'Executive' �μ����� ����� �ش� ����� �Ŵ���(���) �̸��� ���
-- (*) �Ŵ���(���)�� ���� ����� 'King'�� ��µǷ���
select e1.first_name||' '||e1.last_name as �̸�, e2.first_name||' '||e2.last_name as ����̸�
from employees e1 left outer join departments d
                on e1.department_id = d.department_id 
                FULL OUTER join employees e2
                on e1.manager_id = e2.employee_id
where d.department_name like 'Executive';









-- sql���� 1)
select s.�̸�
from student s left join enroll e
on s.�й� = e.�й�
left join class c
on e.���¹�ȣ = c.���¹�ȣ
where s.����>=3.0;


-- sql���� 2)
select d.dept, d.dname
from dept d full outer join emp e
on d.deptno = e.deptno;
