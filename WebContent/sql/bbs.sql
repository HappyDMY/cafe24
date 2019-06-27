--
create table tb_bbs(
  bbsno    number(5)       not null -- �Ϸù�ȣ -99999~99999
 ,wname    varchar2(20)    not null -- �ۼ���
 ,subject  varchar2(100)   not null -- ������
 ,content  varchar2(2000)  not null -- �۳���
 ,passwd   varchar2(10)    not null -- �ۺ�й�ȣ
 ,readcnt  number(5)       default 0 not null -- ����ȸ��
 ,regdt    date            default  sysdate -- ���ۼ���
 ,grpno    number(5)       not null  -- �� �׷��ȣ
 ,indent   number(5)       default 0 -- �鿩����
 ,ansnum   number(5)       default 0 -- �ۼ���
 ,ip       varchar2(15)    not null -- �� IP
 ,primary key(bbsno)                --bbsno �⺻Ű 
);

--���߰� �׽�Ʈ 
insert into tb_bbs(bbsno, wname, subject, content, passwd, grpno, ip)
values(
	(select nvl(max(bbsno),0)+1 from tb_bbs)
	, '�����'
	, '�ڸ��ƾƾ�~'
	, '����ȭ ���� �Ǿ����ϴ�'
	, '1234'
	, (select nvl(max(bbsno),0)+1 from tb_bbs)
	, '127.0.0.1'
);


--���۾���
bbsno : max(bbsno)+1
wname, subject, content, passwd: ����� �Է�
default �� : readcnt, regdt, indent, ansnum
grpno : max(bbsno)+1
;

--�亯����
--1) �θ�� �������� (select)
select grpno, indent, ansnum
from tb_bbs
where bbsno=?;
--2) �ۼ��� ������ (update)
update tb_bbs
set ansnum=ansnum+1
where bbsno=? and ansnum>=3;


--select nvl(max(bbsno),0)+1 from tb_bbs
--3) �亯�� �߰� (insert)

insert into tb_bbs(bbsno, wname, subject, content, passwd, grpno, ip, indent, ansnum)
VALUES(	 )




select * from tb_bbs
order by bbsno desc;


select bbsno, wname, subject, passwd, regdt, ip, readcnt,grpno, indent, ansnum
	from tb_bbs 
	order by bbsno desc , ansnum  

update tb_bbs
set ansnum=ansnum+2 
 where bbsno=22 and ansnum>=0 

insert into tb_bbs (bbsno, wname, subject, content, passwd, readcnt, regdt, grpno, indent, ansnum, ip) 
values ((select nvl(max(bbsno),0)+1 from tb_bbs), �亯��3, �亯3,  ����, ���, 10, ��¥, 10,10, 10 , ������ )

select * from tb_bbs


--����
--1) bbsUpdate.jsp (��й�ȣ �Է� �� �ۼ�)
--2) bbs updateFrom.jsp (��й�ȣ�� �۹�ȣ�� ��ġ�ϴ� ���� db���� ��������)
 select wname, subject, content, passwd
 from tb_bbs
 where passwd=? and bbsno=?  
 --3) 2�� ������ �������� ��� 
 --4)bbsUpdateForm.jsp()
 
 --�˻� ���� ����ȭ �ܾ �ִ� ���ڵ� �˻�
select *  from tb_bbs
where subject like '%����ȭ%';

--����¡
--rownum(�ٹ�ȣ) Ȱ��

--1) 
select bbsno, subject, grpno, ansnum from tb_bbs
order by grpno desc, ansnum asc;

--2)
select bbsno, subject, grpno, ansnum, rownum
from tb_bbs
order by grpno desc, ansnum asc;

--3)
select aa.bbsno, aa.subject, aa.grpno, aa.ansnum, rownum
from(
    select bbsno, subject, grpno, ansnum from tb_bbs
    order by grpno desc, ansnum asc
    )aa;    
    
--4) alias�� ��������
select bbsno, subject, grpno, ansnum, rownum
from(
    select bbsno, subject, grpno, ansnum from tb_bbs
    order by grpno desc, ansnum asc
    );    
    
--5) �ٹ�ȣ 1~5 �˻�
select bbsno, subject, grpno, ansnum, rownum
from(
    select bbsno, subject, grpno, ansnum from tb_bbs
    order by grpno desc, ansnum asc
    )
where rownum >=1 and rownum<=5;
--6) �ٹ�ȣ 6~10 �˻� (2������)-> �̻� �ȵ�
select bbsno, subject, grpno, ansnum, rownum
from(
    select bbsno, subject, grpno, ansnum from tb_bbs
    order by grpno desc, ansnum asc
    )
where rownum >=6 and rownum<=10;

--7) �ٹ�ȣ 6~10 �˻� (2������)
select bbsno, subject, grpno, ansnum, rnum
from(--BB
    select bbsno, subject, grpno, ansnum, rownum as rnum
    from(--AA
        select bbsno, subject, grpno, ansnum from tb_bbs
        order by grpno desc, ansnum asc
        )AA
    )BB
where rnum >=6 and rnum<=10;

--8) 7������ alias ��������
select bbsno, subject, grpno, ansnum, rnum
from(
    select bbsno, subject, grpno, ansnum, rownum as rnum
    from(
        select bbsno, subject, grpno, ansnum from tb_bbs
        order by grpno desc, ansnum asc
        )
    )
where rnum >=6 and rnum<=10;

--9) ����¡ + �˻� 
--  ���� '�ֵ���ũ' ���� �˻� 2������ ���
select bbsno, subject, grpno, ansnum, rnum
from(
    select bbsno, subject, grpno, ansnum, rownum as rnum
    from(
        select bbsno, subject, grpno, ansnum from tb_bbs
        where subject like '%soldesk%' --8���� ��⸸ �߰���
        order by grpno desc, ansnum asc
        )
    )
where rnum >=6 and rnum<=10;
---------------------------------
select * from tb_bbs;

select grpno,  from tb_bbs;

select bbsno, subject, wname, readcnt, indent, regdt, grpno from tb_bbs
where indent=0
order by grpno desc;
select count(*)
from tb_bbs;

select count(*)
from
(select bbsno
from tb_bbs
where indent=0);

select grpno, count(*) as cnt from tb_bbs
group by grpno
order by grpno desc;

select bbsno, subject, wname, readcnt, indent, regdt, grpno from tb_bbs
where (subject like '%1%' or content like '%1%') and indent=0
order by grpno desc;

---------------------
--indent=0 �α۸�
select bbsno, subject, wname, readcnt, indent, regdt, grpno from tb_bbs
where indent=0
order by grpno desc;
select count(*)
from tb_bbs;
--------------
SELECT bbsno,subject,wname,readcnt,indent,regdt, r
 FROM( SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum as r
  FROM ( SELECT bbsno,subject,wname,readcnt,indent,regdt
   FROM tb_bbs
   where indent=0
         ORDER BY grpno DESC, ansnum ASC
         )
     );
 WHERE r>=1 AND r<=3;
--------------------
--������
select aa.*, bb.cnt from
(SELECT bbsno,subject,wname,readcnt,indent,regdt,grpno
FROM tb_bbs
where indent=0
ORDER BY grpno DESC, ansnum ASC)aa join 
    (select grpno, count(*) as cnt from tb_bbs
    group by grpno
    order by grpno desc)bb
on aa.grpno=bb.grpno

;
         
--������ aa
(SELECT bbsno,subject,wname,readcnt,indent,regdt, grpno
FROM tb_bbs
where indent=0
ORDER BY grpno DESC, ansnum ASC)aa;
--������ bb
(select grpno, count(*) as cnt from tb_bbs
group by grpno
order by grpno desc)bb;

--�˻�����,����¡����
select bbsno,subject, wname, readcnt, INDENT, regdt, grpno, r, cnt 
from    (SELECT aa.*, rownum as r, bb.cnt 
        FROM (SELECT bbsno,subject,wname,readcnt,INDENT,regdt,grpno
            FROM tb_bbs WHERE INDENT=0
            ORDER BY grpno DESC, ansnum ASC)aa JOIN --����
            (SELECT grpno, COUNT(*) AS cnt FROM tb_bbs
            GROUP BY grpno ORDER BY grpno DESC)bb
            ON aa.grpno=bb.grpno --���� ��
        where (subject like '%1%' or content like '%1%')--�ۼ��ڳ� ����˻�
) where r>=3 and r<=6; --����¡


