--���̺� ����
CREATE TABLE tb_pds (
pdsno       NUMBER         NOT NULL
,wname      VARCHAR2(100)  NOT NULL
,subject    VARCHAR2(250)  NOT NULL
,regdate    DATE           NOT NULL
,passwd     VARCHAR2(15)   NOT NULL
,readcnt    NUMBER         DEFAULT 0
,filename   VARCHAR2(250)  NOT NULL
,filesize   NUMBER         DEFAULT 0
,PRIMARY KEY(pdsno)
);
    
select * FROM tb_pds;

-- ���߰� 
pdsno : max(�Ϸù�ȣ)+1
wname, subject, passwd : ����� �Է�
filename, filesize : ÷������ ���� ����
regdate : SYSDATE


--
INSERT INTO tb_pds(pdsno, wname, subject, passwd, filename, filesize, regdate)
VALUES((SELECT nvl(max(pdsno),0)+1 FROM tb_pds)
		, '���ʽ�', '����ȭ  ���� �Ǿ����ϴ�.', '1234', 'sky.png', 0, SYSDATE);
		
--���
SELECT pdsno, subject, wname, regdate, filename, readcnt
FROM tb_pds order by regdate;

--�󼼺���
SELECT pdsno, subject, wname, regdate, filename, filesize, readcnt, passwd
FROM tb_pds WHERE pdsno=5;

--����
DELETE FROM tb_pds
WHERE pdsno=? AND passwd=?

--����
UPDATE tb_pds
set wname=?,subject=? , passwd=?, fileName=?, filesize=?
where pdsno=?;

