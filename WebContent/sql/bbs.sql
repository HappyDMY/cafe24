--
create table tb_bbs(
  bbsno    number(5)       not null -- 일련번호 -99999~99999
 ,wname    varchar2(20)    not null -- 작성자
 ,subject  varchar2(100)   not null -- 글제목
 ,content  varchar2(2000)  not null -- 글내용
 ,passwd   varchar2(10)    not null -- 글비밀번호
 ,readcnt  number(5)       default 0 not null -- 글조회수
 ,regdt    date            default  sysdate -- 글작성일
 ,grpno    number(5)       not null  -- 글 그룹번호
 ,indent   number(5)       default 0 -- 들여쓰기
 ,ansnum   number(5)       default 0 -- 글순서
 ,ip       varchar2(15)    not null -- 글 IP
 ,primary key(bbsno)                --bbsno 기본키 
);

--행추가 테스트 
insert into tb_bbs(bbsno, wname, subject, content, passwd, grpno, ip)
values(
	(select nvl(max(bbsno),0)+1 from tb_bbs)
	, '손흥민'
	, '코리아아아~'
	, '무궁화 꽃이 피었습니다'
	, '1234'
	, (select nvl(max(bbsno),0)+1 from tb_bbs)
	, '127.0.0.1'
);


--새글쓰기
bbsno : max(bbsno)+1
wname, subject, content, passwd: 사용자 입력
default 값 : readcnt, regdt, indent, ansnum
grpno : max(bbsno)+1
;

--답변쓰기
--1) 부모글 가져오기 (select)
select grpno, indent, ansnum
from tb_bbs
where bbsno=?;
--2) 글순서 재조정 (update)
update tb_bbs
set ansnum=ansnum+1
where bbsno=? and ansnum>=3;


--select nvl(max(bbsno),0)+1 from tb_bbs
--3) 답변글 추가 (insert)

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
values ((select nvl(max(bbsno),0)+1 from tb_bbs), 답변자3, 답변3,  내용, 비번, 10, 날짜, 10,10, 10 , 아이피 )

select * from tb_bbs


--수정
--1) bbsUpdate.jsp (비밀번호 입력 폼 작성)
--2) bbs updateFrom.jsp (비밀번호와 글번호가 일치하는 글을 db에서 가져오기)
 select wname, subject, content, passwd
 from tb_bbs
 where passwd=? and bbsno=?  
 --3) 2의 정보를 수정폼에 출력 
 --4)bbsUpdateForm.jsp()
 
 --검색 제목에 무궁화 단어가 있는 레코드 검색
select *  from tb_bbs
where subject like '%무궁화%';

--페이징
--rownum(줄번호) 활용

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
    
--4) alias값 생략가능
select bbsno, subject, grpno, ansnum, rownum
from(
    select bbsno, subject, grpno, ansnum from tb_bbs
    order by grpno desc, ansnum asc
    );    
    
--5) 줄번호 1~5 검색
select bbsno, subject, grpno, ansnum, rownum
from(
    select bbsno, subject, grpno, ansnum from tb_bbs
    order by grpno desc, ansnum asc
    )
where rownum >=1 and rownum<=5;
--6) 줄번호 6~10 검색 (2페이지)-> 겁색 안됨
select bbsno, subject, grpno, ansnum, rownum
from(
    select bbsno, subject, grpno, ansnum from tb_bbs
    order by grpno desc, ansnum asc
    )
where rownum >=6 and rownum<=10;

--7) 줄번호 6~10 검색 (2페이지)
select bbsno, subject, grpno, ansnum, rnum
from(--BB
    select bbsno, subject, grpno, ansnum, rownum as rnum
    from(--AA
        select bbsno, subject, grpno, ansnum from tb_bbs
        order by grpno desc, ansnum asc
        )AA
    )BB
where rnum >=6 and rnum<=10;

--8) 7번에서 alias 생략가능
select bbsno, subject, grpno, ansnum, rnum
from(
    select bbsno, subject, grpno, ansnum, rownum as rnum
    from(
        select bbsno, subject, grpno, ansnum from tb_bbs
        order by grpno desc, ansnum asc
        )
    )
where rnum >=6 and rnum<=10;

--9) 페이징 + 검색 
--  제목에 '솔데스크' 까지 검색 2페이지 출력
select bbsno, subject, grpno, ansnum, rnum
from(
    select bbsno, subject, grpno, ansnum, rownum as rnum
    from(
        select bbsno, subject, grpno, ansnum from tb_bbs
        where subject like '%soldesk%' --8에서 요기만 추가됨
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
--indent=0 인글만
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
--조인후
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
         
--조인전 aa
(SELECT bbsno,subject,wname,readcnt,indent,regdt, grpno
FROM tb_bbs
where indent=0
ORDER BY grpno DESC, ansnum ASC)aa;
--조인전 bb
(select grpno, count(*) as cnt from tb_bbs
group by grpno
order by grpno desc)bb;

--검색까지,페이징까지
select bbsno,subject, wname, readcnt, INDENT, regdt, grpno, r, cnt 
from    (SELECT aa.*, rownum as r, bb.cnt 
        FROM (SELECT bbsno,subject,wname,readcnt,INDENT,regdt,grpno
            FROM tb_bbs WHERE INDENT=0
            ORDER BY grpno DESC, ansnum ASC)aa JOIN --조인
            (SELECT grpno, COUNT(*) AS cnt FROM tb_bbs
            GROUP BY grpno ORDER BY grpno DESC)bb
            ON aa.grpno=bb.grpno --조인 끝
        where (subject like '%1%' or content like '%1%')--작성자나 제목검색
) where r>=3 and r<=6; --페이징


