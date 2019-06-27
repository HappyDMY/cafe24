--sungjuk_orcle.ql
--���� -> Oracle -> Run SQL Command Line
--			-> connect ����Ŭ ����Ȯ�� id=java1113 pw=1234



-- ���� ���̺� ����
drop table sungjuk;

-- ���� ������ ����
drop sequence sungjuk_seq;

-- ���� ������ ����
create sequence sungjuk_seq;

-- ���� ���̺� ����

create table sungjuk(
    sno      int primary key,   -- �Ϸù�ȣ
    uname    varchar(20),    -- �̸�
    kor      int not null,   -- ����
    eng      int not null,   -- ����
    mat      int not null,   -- ����
    aver     int,            -- ���
    addr     varchar(50),    -- �ּ�
    wdate    date            -- �ۼ���
);



 --���߰�
 --1) ������
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul',sysdate);
--2) �ִ밪 max()+1
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values((select nvl(max(sno),0)+1 from sungjuk),'������',90,50,90,'����',sysdate);

--���
select * from SUNGJUK order by sno desc;

























