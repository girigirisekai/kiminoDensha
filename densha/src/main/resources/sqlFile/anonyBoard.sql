
/* Drop Tables */

DROP TABLE anonybaord CASCADE CONSTRAINTS;


/* Drop Sequences */

DROP SEQUENCE anonybaord_seq;
DROP SEQUENCE anonybaord_reply_seq;

/* Create Sequences */

-- board시퀀스
create sequence anonybaord_seq;
create sequence anonybaord_reply_seq;

/* Create Tables */

create table board3_reply(
num number, -- board3 num 연동
replynum number primary key, -- replynum
text varchar2(200) not null, -- text
name varchar2(50)not null, -- name
writedate date default sysdate, -- date
CONSTRAINT FK_board3_reply FOREIGN KEY(num) references board3 (num) on delete cascade
)


CREATE TABLE REPLY
(
	-- 리플번호
	replynum number NOT NULL,
	-- 글번호
	BOARDNUM number NOT NULL,
	-- 작성자 아이디정보
	ID varchar2(50) NOT NULL,
	-- 리플내용
	TEXT varchar2(500) NOT NULL,
	INPUTDATE date DEFAULT SYSDATE,
	PRIMARY KEY (replynum)
);

// seq use 
board3_seq.nextval

// 글 불러오기 
select * from board2 where name = 
// 글 전체갯수
select count(num) from board2 

insert into board3(num, title, text, name) values(board3_seq.nextval,'TestDrive', '그리고 아무도 없었다.' ,'123');

