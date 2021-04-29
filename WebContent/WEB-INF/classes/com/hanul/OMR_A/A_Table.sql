create table A_Table(
  onumber number PRIMARY KEY,
  name     varchar2(30) not null,
  score    number,
  result   varchar2(20)
);

select * from a_table;

drop table a_table;

delete from a_table;

commit;

update A_table
set score = 60 
where onumber = 214422;