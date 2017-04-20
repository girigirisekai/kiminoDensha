
/* Drop Tables */

DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE boardnum_seq;
DROP SEQUENCE replynum_seq;




/* Create Sequences */

-- board시퀀스
CREATE SEQUENCE boardnum_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE replynum_seq INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE BOARD
(
	-- 글번호
	BOARDNUM number NOT NULL,
	-- 회원아이디
	ID varchar2(50) NOT NULL,
	-- 글 종류(공지사항/건의및QnA/자유게시판)
	TYPE varchar2(50) NOT NULL,
	-- 글제목
	TITLE varchar2(100) NOT NULL,
	-- 글내용
	CONTENT varchar2(1000) NOT NULL,
	INPUTDATE date DEFAULT SYSDATE,
	-- 조회수
	HITS number DEFAULT 0,
	-- 첨부파일명(원래이름)
	ORIGINALFILE varchar2(200),
	-- 첨부파일명(실제저장된이름)
	SAVEDFILE varchar2(200),
	-- 비밀글여부확인(건의및QnA)
	-- 비밀글-TRUE
	-- 공개글-FALSE
	SECRET varchar2(20),
	-- 비밀글인경우 비밀번호
	SECRETPASSWORD varchar2(30),
	-- 글에달린 리플개수
	TOTALREPLY number DEFAULT 0,
	PRIMARY KEY (BOARDNUM)
);


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



/* Create Foreign Keys */

ALTER TABLE REPLY
	ADD FOREIGN KEY (BOARDNUM)
	REFERENCES BOARD (BOARDNUM)
;



/* Comments */

COMMENT ON COLUMN BOARD.BOARDNUM IS '글번호';
COMMENT ON COLUMN BOARD.ID IS '회원아이디';
COMMENT ON COLUMN BOARD.TYPE IS '글 종류(공지사항/건의및QnA/자유게시판)';
COMMENT ON COLUMN BOARD.TITLE IS '글제목';
COMMENT ON COLUMN BOARD.CONTENT IS '글내용';
COMMENT ON COLUMN BOARD.HITS IS '조회수';
COMMENT ON COLUMN BOARD.ORIGINALFILE IS '첨부파일명(원래이름)';
COMMENT ON COLUMN BOARD.SAVEDFILE IS '첨부파일명(실제저장된이름)';
COMMENT ON COLUMN BOARD.SECRET IS '비밀글여부확인(건의및QnA)
비밀글-TRUE
공개글-FALSE';
COMMENT ON COLUMN BOARD.SECRETPASSWORD IS '비밀글인경우 비밀번호';
COMMENT ON COLUMN BOARD.TOTALREPLY IS '글에달린 리플개수';
COMMENT ON COLUMN REPLY.replynum IS '리플번호';
COMMENT ON COLUMN REPLY.BOARDNUM IS '글번호';
COMMENT ON COLUMN REPLY.ID IS '작성자 아이디정보';
COMMENT ON COLUMN REPLY.TEXT IS '리플내용';



