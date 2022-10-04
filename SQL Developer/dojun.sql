

/*
< �������� >>

- �λ���� ( hr ���� )���� EMPLOYEES ���̺�����
*/
?

--1. EMPLOYEES ���̺����� ��� �̸��� first_name�� last_name�� ���� full_name���� ���
select   concat(first_name,last_name) AS full_name
from employees;

--2. �μ���ȣ�� 30(���źμ�)�̰� �޿� 10000�̸��� ����� full_name�� ����,�μ���ȣ�� ���

select concat(first_name,last_name), salary, department_id
from employees
where department_id = 30 And salary<10000;


--3. �μ���ȣ�� 30�̰� �޿��� 10000�޷� ���ϸ� �޴� 2006�⵵ ���� �Ի��� ����� full_name�� ���
SELECT  concat(first_name,last_name) AS FULL_NAME
FROM   employees  
WHERE  DEPARTMENT_ID=30 AND SALARY<=10000 AND HIRE_DATE<'2006/01/01';
?

--4. �μ���ȣ�� 30(���źμ�)�̰� �޿��� 10000������ ����� �μ���ȣ�� 60(IT�μ�)���� �޿��� 5000�̻��� ����� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 30 AND SALARY <= 10000) OR (DEPARTMENT_ID = 60 AND SALARY>=5000);


--5. �����ȣ�� 110������ 120���� ��� �� �޿��� 5000���� 10000������ ��������� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE (EMPLOYEE_ID>=110 AND EMPLOYEE_ID <= 120) AND (SALARY >=5000 AND SALARY<=10000);

--6. �����ȣ�� 110������ 120���� �ƴ� ����� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE (EMPLOYEE_ID<110 OR EMPLOYEE_ID > 120);

--7. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�)�� ���� ����� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(30,60,90);

?

--8. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�) ���� �μ��� ���� ����� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID  NOT IN(30,60,90);

--9. ��ȭ��ȣ���� 590���� �����ϴ� ������� ��ȭ��ȣ�� ��ȸ
SELECT  CONCAT(FIRST_NAME, lAST_NAME) AS FULL_NAME , PHONE_NUMBER
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '590%';