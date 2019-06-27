-- sungjuk_my.sql
-- 내컴퓨터 D:\Java1113\mysql-5.6\bin
-- 			-> mysqld.exe 서버 실행
--				-> 작업관리자에서 확인

drop table sungjuk;

-- 성적 테이블 생성
create table sungjuk (
  sno   int not null auto_increment primary key,
  uname varchar(20) not null,
  kor   tinyint     not null,
  eng   tinyint     not null,
  mat   tinyint     not null,
  tot   int         null default 0,
  aver  int         null default 0,
  regdt datetime    not null
)ENGINE=MyISAM DEFAULT CHARSET="utf8";


-- 테스트
insert into sungjuk(uname,kor,eng,mat,regdt)
values('홍길동',70,80,95,now());


-- sno칼럼은 최대값을 구한후 +1 해서 입력하시오
insert into sungjuk(sno, uname, kor, eng, mat,regdt)
values(  (select ifnull(max(sno),0)+1 from sungjuk as TB),
         '홍길동', 90, 80, 70, now()
);

--전체보기
select * from sungjuk;      

--상세보기
select * from sungjuk where sno=4;

--열지우기
delete from sungjuk where sno=8;
