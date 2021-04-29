--tblBook Table 생성
create table tblBook(
  title varchar2(30),
  name  varchar2(20),
  isbn  varchar2(20) primary key not null,
  comp  varchar2(20),
  cost  number,
  su    number,
  price number
);




drop table tblBook;



