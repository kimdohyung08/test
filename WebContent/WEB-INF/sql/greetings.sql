select * from greetings

create table greetings(
	greetingsno		number(7)			not null,
	name			varchar(20)			not null,
	title			varchar(100)		not null,
	content			varchar(2000)		not null,
	viewcnt			number(5)			default 0,
	wdate			date				not null,
	grpno			number(7)			default 0,
	indent			varchar(2)			default 0,
	ansnum			varchar(5)			default 0,
	refnum			number				default 0,
	primary key (greetingsno)
);