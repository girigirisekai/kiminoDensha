create table commentTable(
num number primary key,
name varchar2(100) not null,
text varchar2(100) not null
);

create sequence seq_commentTable;

delete commentTable;
