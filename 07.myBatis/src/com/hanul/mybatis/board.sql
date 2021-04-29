create table tblBoard(
  b_num     number primary key not null,
  b_subject varchar2(50),
  b_pwd     varchar2(20),
  b_content varchar2(2000),
  b_writer  varchar2(20),
  b_date    varchar2(20),
  b_readcount number
);

select * from tblBoard order by b_num desc;

-- 자동 증가값 설정 : b_num - > b_num_seq 변수
create sequence b_num_seq start with 1;

-- 임의의 레코드 삽입
insert into tblBoard(b_num, b_subject, b_pwd, b_content, b_writer, b_date, b_readcount)
values(b_num_seq.nextval, 'subject', 'pwd', 'content', 'writer', sysdate, 0);

--커밋
commit;

delete from tblBoard;

drop table tblBoard;

drop sequence b_num_seq;