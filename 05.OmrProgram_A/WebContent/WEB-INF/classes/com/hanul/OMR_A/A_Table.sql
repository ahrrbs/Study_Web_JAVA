create table A_Table(
  onumber number PRIMARY KEY,
  name     varchar2(30) not null,
  score    number,
  result   varchar2(20)
);

select * from a_table;

drop table a_table;

commit;

create table A_Score(
  Quiz number not null,
  Pass varchar2(2) not null 
);

insert into A_Score values(1, '1');
insert into A_Score values(2, '2');
insert into A_Score values(3, '4');
insert into A_Score values(4, '3');
insert into A_Score values(5, '3');
insert into A_Score values(6, '4');
insert into A_Score values(7, '4');
insert into A_Score values(8, '2');
insert into A_Score values(9, '1');
insert into A_Score values(10, '2');

select * from a_score;

drop table A_Score;

commit;