
/* Drop Tables */

DROP TABLE STATION CASCADE CONSTRAINTS;
DROP TABLE STATIONINFO CASCADE CONSTRAINTS;
DROP TABLE STATIONNEARINFO CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE STATION
(
	STATION_CD varchar2(30),
	STATION_NM varchar2(30),
	LINE_NUIM varchar2(30),
	FR_CODE varchar2(30),
	CYBER_ST_CODE varchar2(30),
	XPOINT varchar2(30),
	YPOINT varchar2(30),
	XPOINT_WGS varchar2(30),
	YPOINT_WGS varchar2(30),
	STATION_NM2 varchar2(30)
);


CREATE TABLE STATIONINFO
(
	STATION_CD varchar2(30),
	STATION_NM varchar2(30),
	STATION_NM_ENG varchar2(150),
	LINE_NUM varchar2(30),
	FR_CODE varchar2(30),
	CYBER_ST_CODE varchar2(30),
	BRANCH_OFFICE_CODE varchar2(20),
	BRANCH_OFFICE_NM varchar2(40),
	REGIDATE varchar2(40),
	TEL varchar2(40),
	FAX varchar2(40),
	POST_CODE varchar2(30),
	ADDRESS varchar2(150),
	MINWON varchar2(30),
	INFOTESK varchar2(30),
	CULTURE varchar2(30),
	TICKET varchar2(30),
	OBSTACLE varchar2(30),
	MEETPLACE varchar2(30),
	PARKING varchar2(30),
	BICYCLE varchar2(30),
	MUIN varchar2(30),
	OFFICE varchar2(30),
	NURSING varchar2(30),
	ELEVATOR varchar2(30),
	ESCALATOR varchar2(30),
	WHEELCHAIR varchar2(30),
	SPEEDGATE varchar2(30),
	TOILET varchar2(30),
	STATION_NM_HAN varchar2(40),
	URE varchar2(1500),
	XPOINT varchar2(20),
	YPOINT varchar2(20),
	XPOINT_WGS varchar2(30),
	YPOINT_WGS varchar2(30)
);


CREATE TABLE STATIONNEARINFO
(
	LINE_NUM varchar2(30),
	LINE_NAME varchar2(30),
	FR_CODE varchar2(30),
	STATION_CD varchar2(30),
	STATION_NM varchar2(30),
	EXIT_NO varchar2(30),
	SEQ varchar2(30),
	AREA_NM varchar2(150),
	TEL varchar2(50),
	HOMEPAGE varchar2(50),
	POST_CD varchar2(30),
	ADDRESS varchar2(150),
	POINT_X varchar2(30),
	POINT_Y varchar2(30),
	TOOLTIP varchar2(1500),
	VR_PATH varchar2(50),
	ICON_CD varchar2(50),
	SHOW_YN varchar2(50)
);






