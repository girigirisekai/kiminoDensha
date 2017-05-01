
/* Drop Tables */

DROP TABLE checkCode CASCADE CONSTRAINTS;
DROP TABLE favorite CASCADE CONSTRAINTS;
DROP TABLE loginCheck CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE checkCode
(
	-- userID
	id varchar2(50) NOT NULL,
	-- 임시 비밀번호 저장
	password varchar2(30) NOT NULL,
	-- 임시 비밀번호확인 질문
	question varchar2(100),
	-- 임시 비밀번호확인 답안
	answer varchar2(50) NOT NULL,
	-- 인증번호 
	checkCode varchar2(20) NOT NULL,
	-- 인증번호 받기 버튼을 눌렀을 때 시간을 보내준다
	-- 받았을 시간보다 5분이 지나면 중지시켜준다
	checkSendingTime date DEFAULT sysdate
);


CREATE TABLE favorite
(
	-- userID
	id varchar2(50) NOT NULL,
	-- 즐겨찾기 역
	favoritename varchar2(40),
	-- 역코드 명입니다
	stationCode varchar2(10),
	-- 즐겨찾기 등록시간
	favoriteOrder date
	,line varchar2(10) --호선라인
	,fcode varchar2(10) --외부코드
);


CREATE TABLE loginCheck
(
	-- userID
	id varchar2(50) NOT NULL,
	-- 접속자 아이피 주소
	ipAddress varchar2(16) NOT NULL,
	-- 접속자 로그인 시간
	recentLogin date NOT NULL
);


CREATE TABLE member
(
	-- userID
	id varchar2(50) NOT NULL,
	-- user 비밀번호
	password varchar2(30) NOT NULL,
	-- 사용자 분리
	type varchar2(10) DEFAULT 'personal' NOT NULL,
	-- 비밀번호 확인 문제
	question varchar2(100),
	-- 비밀번호 확인 답안
	answer varchar2(50) NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE checkCode
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE favorite
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE loginCheck
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;



/* Comments */

COMMENT ON COLUMN checkCode.id IS 'userID';
COMMENT ON COLUMN checkCode.password IS '임시 비밀번호 저장';
COMMENT ON COLUMN checkCode.question IS '임시 비밀번호확인 질문';
COMMENT ON COLUMN checkCode.answer IS '임시 비밀번호확인 답안';
COMMENT ON COLUMN checkCode.checkCode IS '인증번호 ';
COMMENT ON COLUMN checkCode.checkSendingTime IS '인증번호 받기 버튼을 눌렀을 때 시간을 보내준다
받았을 시간보다 5분이 지나면 중지시켜준다';
COMMENT ON COLUMN favorite.id IS 'userID';
COMMENT ON COLUMN favorite.favoritename IS '즐겨찾기 역';
COMMENT ON COLUMN favorite.stationCode IS '역코드 명입니다';
COMMENT ON COLUMN favorite.favoriteOrder IS '즐겨찾기 등록시간';
COMMENT ON COLUMN loginCheck.id IS 'userID';
COMMENT ON COLUMN loginCheck.ipAddress IS '접속자 아이피 주소';
COMMENT ON COLUMN loginCheck.recentLogin IS '접속자 로그인 시간';
COMMENT ON COLUMN member.id IS 'userID';
COMMENT ON COLUMN member.password IS 'user 비밀번호';
COMMENT ON COLUMN member.type IS '사용자 분리';
COMMENT ON COLUMN member.question IS '비밀번호 확인 문제';
COMMENT ON COLUMN member.answer IS '비밀번호 확인 답안';



