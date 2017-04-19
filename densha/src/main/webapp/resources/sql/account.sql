create table account5(
id varchar2(20) not null,
password varchar2(30) not null,
name varchar2(20) not null,
email varchar2(50) ,
gubun varchar2(10) ,
jumin varchar2(30) not null,
address varchar2(100)
);


create sequence seq_board5;

create table board5(
num number(5) primary key,
id varchar2(20) not null,
title varchar2(50) not null,
name varchar2(20) not null,
text varchar2(4000) ,
hit number(4) default 0,
writedate date default sysdate
);

insert into board5(num, id, title, name, text) values
(seq_board5.nextval, 'orion', 'title', 'orion', 'text');