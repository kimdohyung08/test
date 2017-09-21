select * from join1

create table join1 ( 
	id			varchar(15)		not null, --id중복안됨, 레코드구분
	passwd 		varchar(20)		not null,
	name		varchar(20)		not	null,
	phone		varchar(14)		not null,
	email   	VARCHAR(50) 	NOT NULL UNIQUE, -- 전자우편 주소, 중복 안됨 
    zipcode 	VARCHAR(7)      NULL, -- 우편번호, 101-101 
    address1	VARCHAR(150)     NULL, -- 주소 1 
    address2 	VARCHAR(50)     NULL, -- 주소 2 
    job      	VARCHAR(20) 	NOT NULL, -- 직업 
    mdate    	DATE        	NOT NULL, -- 가입일     
    fname   	VARCHAR(50) 	DEFAULT 'member.jpg', -- 회원 사진
    grade    	CHAR(1)     	DEFAULT 'H', -- 일반회원: H, 정지: Y, 손님:Z 
    PRIMARY KEY (id)               -- 한번 등록된 id는 중복 안됨
)

INSERT INTO join1(id, passwd, name, phone, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('admin', '1', '관리자', '123-1234', 'admin@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate, 'member.jpg', 'A'); 