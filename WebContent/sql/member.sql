--member.jsp
--ȸ�� ���̺�

CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL, -- ���̵�, �ߺ� �ȵ�, ���ڵ带 �����ϴ� �÷� 
    passwd   VARCHAR(10)  NOT NULL, -- �н�����
    mname    VARCHAR(20)  NOT NULL, -- ����
    tel      VARCHAR(14)  NULL,     -- ��ȭ��ȣ
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- ���ڿ��� �ּ�, �ߺ� �ȵ�
    zipcode  VARCHAR(7)   NULL,     -- �����ȣ, 101-101
    address1 VARCHAR(255) NULL,     -- �ּ� 1
    address2 VARCHAR(255) NULL,     -- �ּ� 2(�������ּ�)
    job      VARCHAR(20)  NOT NULL, -- ����
    mlevel   CHAR(2)      NOT NULL, -- ȸ�� ���, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- ������    
    PRIMARY KEY (id)
);
--ȸ������
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) 
values('soldesk', '12341234', '�ֵ���ũ', '123-4567', 'soldesk@naver.com', 
			'12345', '����� ���α� ��ö��', '�ھƺ���5��', 'A01', 'D1', sysdate);

--ȸ�����
select * from member order by id;

SELECT id, PASSWD, mlevel FROM member ORDER BY id;

--���̵� �ߺ�Ȯ��
select count(id)
from member
where id ='soldeck';

--����
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values( 'test5', '123456', '�Ƕ���', '01012345678', 'test5@naver.com', '63050'
, '����Ư����ġ�� ���ֽ� �ֿ��� �������� 2 (�ϱ�2��)', '����', '���������'
, 'D1', sysdate ) ;


--�α��� �������� -> ȸ������� �����´�
select mlevel
from member
where id='soldesk'and passwd='12341234'
and mlevel in ('A1','B1','C1','D1');

--����
update member
set passwd='11', mname='123456',tel= , email=, zipcode=, ADDRESS1=, ADDRESS2=,JOB= 
where id='ForTEST3';

SELECT COUNT(*) AS cnt FROM MEMBER;

--����Ʈ
SELECT  id, passwd, mname, tel, email, mdate, mlevel
FROM MEMBER
ORDER BY id ASC;

--��� ����
UPDATE MEMBER set PASSWD='12341234' where id='Webmaster';

--���̵� ����
DELETE MEMBER
WHERE id='asdfasdf';

SELECT id, mname, PASSWD FROM MEMBER WHERE id='soldesk'and mname='�ֵ���ũ';