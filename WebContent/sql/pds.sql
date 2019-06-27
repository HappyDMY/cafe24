--테이블 생성
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

-- 행추가 
pdsno : max(일련번호)+1
wname, subject, passwd : 사용자 입력
filename, filesize : 첨부파일 관련 정보
regdate : SYSDATE


--
INSERT INTO tb_pds(pdsno, wname, subject, passwd, filename, filesize, regdate)
VALUES((SELECT nvl(max(pdsno),0)+1 FROM tb_pds)
		, '오필승', '무궁화  꽃이 피었습니다.', '1234', 'sky.png', 0, SYSDATE);
		
--목록
SELECT pdsno, subject, wname, regdate, filename, readcnt
FROM tb_pds order by regdate;

--상세보기
SELECT pdsno, subject, wname, regdate, filename, filesize, readcnt, passwd
FROM tb_pds WHERE pdsno=5;

--제거
DELETE FROM tb_pds
WHERE pdsno=? AND passwd=?

--수정
UPDATE tb_pds
set wname=?,subject=? , passwd=?, fileName=?, filesize=?
where pdsno=?;

