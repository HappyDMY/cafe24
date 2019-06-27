--sungjuk_orcle.ql
--시작 -> Oracle -> Run SQL Command Line
--			-> connect 오라클 서버확인 id=java1113 pw=1234



-- 성적 테이블 삭제
drop table sungjuk;

-- 성적 시퀀스 삭제
drop sequence sungjuk_seq;

-- 성적 시퀀스 생성
create sequence sungjuk_seq;

-- 성적 테이블 생성

create table sungjuk(
    sno      int primary key,   -- 일련번호
    uname    varchar(20),    -- 이름
    kor      int not null,   -- 국어
    eng      int not null,   -- 영어
    mat      int not null,   -- 수학
    aver     int,            -- 평균
    addr     varchar(50),    -- 주소
    wdate    date            -- 작성일
);



 --행추가
 --1) 시퀀스
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul',sysdate);
--2) 최대값 max()+1
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values((select nvl(max(sno),0)+1 from sungjuk),'박지성',90,50,90,'수원',sysdate);

--목록
select * from SUNGJUK order by sno desc;

























