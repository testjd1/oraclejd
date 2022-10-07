-- ȸ�� ���̺�

create table ex_member(

id varchar2(10), -- ���̵�

pass varchar2(10), -- �н�����

name varchar2(20), -- �̸�

tel varchar2(20), -- ��ȭ��ȣ

addr varchar2(100) -- �ּ�

);

?

-- ��ǰ ���̺�

create table ex_good(

gno varchar2(10), -- ��ǰ��ȣ

gname varchar(30), -- ��ǰ��

gdetail varchar2(300), -- �󼼼���

price number); -- ����

?

-- �ֹ� ���̺�

create table ex_order (

ono number, -- ��ȣ

orderno varchar2(20), -- �ֹ���ȣ

gno varchar2(10), -- ��ǰ��ȣ

id varchar2(10), -- ȸ�� ���̵�

count number, -- ����

status varchar2(10) -- ��ۻ���

);

drop table ex_member;
drop table ex_good;
drop table ex_order;
?-- ######################################################

-- �ֹ����̺�� ȸ�����̺�, ��ǰ���̺��� ���踦 �δ´ٸ�?
ALTER TABLE ex_member
ADD CONSTRAINT  pk_name1 PRIMARY  KEY (id);

ALTER TABLE  ex_good
ADD  CONSTRAINT  pk_name2  PRIMARY  KEY (gno);

ALTER TABLE  ex_order
ADD  CONSTRAINT  pk_name3  PRIMARY  KEY (ono);

ALTER  TABLE   ex_order
ADD  CONSTRAINT  fk_name4  FOREIGN  KEY ( id )
REFERENCES  ex_member ( id );

ALTER  TABLE   ex_order
ADD  CONSTRAINT  fk_name5  FOREIGN  KEY ( gno )
REFERENCES  ex_good ( gno ); 

commit;

-- ȸ�� ���̺� ����Ÿ �Է�

insert into ex_member(id, pass, name, tel, addr )

values('kim', '1111', '��浿', '02-222-2222','���� ������ �̻۵�');

?

insert into ex_member(id, pass, name, tel, addr )

values('park', '1111', '�ڱ浿', '03-333-3333','��õ ������ �̻۵�');

?

insert into ex_member(id, pass, name, tel, addr )

values('meng', '1111', '�ͱ浿', '04-444-4444','��� ������ �̻۵�');

?

commit;
?
-- ���� ���̺� ����Ÿ �Է�

insert into ex_good( gno, gname, gdetail, price )

values('1001', '�Ӹ���', '���� ��� �Ӹ���', 200 );

?

?

insert into ex_good( gno, gname, gdetail, price )

values('2002', '������-A', '������� ������ �޸��� ������', 10000 );

?

insert into ex_good( gno, gname, gdetail, price )

values('2010', '������-B', '���� ������� ������ �����ϰ� �޸��ٴ� ������', 20000 );

?

insert into ex_good( gno, gname, gdetail, price )

values('3333', '�ڵ������̽�', '�ΰ� �����ϴ� �ڵ��� ���̽�', 1500 );

?

commit;
?

?-- �ֹ� ���̺� ����Ÿ �˻�

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 1, '20161212', '1001', 'park', 1, '��ۿϷ�');
-- status ���� �ʰ�
?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 2, '20161212', '2010', 'park', 1, '�����');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 3, '20161111', '1001', 'kim', 2, '�ֹ�');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 4, '20161111', '3333', 'kim', 3, '�ֹ�');



insert into ex_order( ono, orderno, gno, id, count, status )

values( 5, '20163333', '1001', 'park', 3, '�ֹ�');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 6, '20163333', '2010', 'park', 1, '�����');



insert into ex_order( ono, orderno, gno, id, count, status )

values( 7, '20163333', '2002', 'park', 2, '�ֹ�');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 8, '20165050', '1001', 'meng', 1, '�����');

?

commit;


-- ###############################################################

--[ ���� ]


--1. ������� ��ǰ�� ���� ������ ���
select * from ex_good;

select g.*
from ex_order o, ex_good g
where o.gno=g.gno
    and o.status like '�����';

--2. �ֹ� ���� ��ǰ ������ �� ���� ���
select g.*, m.*
from ex_order o, ex_good g, ex_member m
where  o.gno=g.gno and
       o.id= m.id  and
       o.status like '�ֹ�';

--3. �ֹ����� �� ����(���̵�)�� �ֹ��� ��ǰ�� �ѱݾ��� ���
SELECT id, orderno, sum(g.price * o.count) total
    FROM ex_good g, ex_order o WHERE g.gno=o.gno GROUP BY id, orderno;

SELECT O.ID, O.ORDERNO, SUM(O.COUNT*G.PRICE) ��_�ݾ�
FROM   EX_GOOD G, EX_ORDER o
WHERE  G.GNO=O.GNO
GROUP BY o.id,o.ORDERNO;


-- [ �������� ]

--4. 3���� �ֹ� ������ ù���� ��ǰ�� �� �� ���� ���

-- [��] 20161212   �Ӹ��� �� 1�� 

?SELECT ORDERNO, MIN(GNO) GNO, COUNT(ORDERNO) COUNT FROM EX_ORDER GROUP BY ORDERNO;

SELECT E.ORDERNO, G.GNAME ||' ��'||(E.COUNT-1)||'��' GOOD
FROM (SELECT ORDERNO, MIN(GNO) GNO, COUNT(ORDERNO) COUNT FROM EX_ORDER GROUP BY ORDERNO) E, EX_GOOD G
WHERE E.GNO=G.GNO;


