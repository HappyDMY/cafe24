--member.jsp
--회원 테이블

CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼 
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 101-101
    address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- 가입일    
    PRIMARY KEY (id)
);
--회원가입
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) 
values('soldesk', '12341234', '솔데스크', '123-4567', 'soldesk@naver.com', 
			'12345', '서울시 종로구 관철동', '코아빌딩5층', 'A01', 'D1', sysdate);

--회원목록
select * from member order by id;

SELECT id, PASSWD, mlevel FROM member ORDER BY id;

--아이디 중복확인
select count(id)
from member
where id ='soldeck';

--가입
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values( 'test5', '123456', '되라좀', '01012345678', 'test5@naver.com', '63050'
, '제주특별자치도 제주시 애월읍 가문동길 2 (하귀2리)', '라라라', '전산관련직'
, 'D1', sysdate ) ;


--로그인 성공여부 -> 회원등급을 가져온다
select mlevel
from member
where id='soldesk'and passwd='12341234'
and mlevel in ('A1','B1','C1','D1');

--수정
update member
set passwd='11', mname='123456',tel= , email=, zipcode=, ADDRESS1=, ADDRESS2=,JOB= 
where id='ForTEST3';

SELECT COUNT(*) AS cnt FROM MEMBER;

--리스트
SELECT  id, passwd, mname, tel, email, mdate, mlevel
FROM MEMBER
ORDER BY id ASC;

--비번 변경
UPDATE MEMBER set PASSWD='12341234' where id='Webmaster';

--아이디 삭제
DELETE MEMBER
WHERE id='asdfasdf';

SELECT id, mname, PASSWD FROM MEMBER WHERE id='soldesk'and mname='솔데스크';