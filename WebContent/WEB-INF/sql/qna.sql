select * from qna

drop table qna purge -- 테이블안에있는 컬럼들을 전부 날림

create table qna(
qnano		number(7)		not null,
name		varchar(20)		not null,
title		varchar(100)	not null,
content		varchar(4000)	not null,
passwd		varchar(15)		not null,
viewcnt		number(5)		default 0,
wdate		date			not null,
grpno		number(7)		default 0,
indent		number(2)		default 0,
ansnum		number(5)		default 0,
primary	key (qnano)
)

alter table qna
add (refnum number default 0)