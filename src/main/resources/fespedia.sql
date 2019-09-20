--0915 테이블

--관리자 테이블
CREATE TABLE ADMINMEMBER (
    ADMINID VARCHAR2(20) PRIMARY KEY,   --관리자 아이디
    ADMINPWD VARCHAR2(20),              --관리자 비번
    EMAIL VARCHAR2(20)                  --이메일
);
--맴버
CREATE TABLE MEMBER(
   ADMINID VARCHAR2(20) CONSTRAINT MEMBER_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
   userid      VARCHAR2(20)   NOT NULL PRIMARY KEY,      --USERID
   userpwd       VARCHAR2(20)   NOT NULL,                  --USERPWD
   email       VARCHAR2(50)    NOT NULL                         --메일
);
--블로그에서 자기소개
CREATE TABLE MEMBER_BLOG(
  ADMINID VARCHAR2(20) CONSTRAINT MEMBER_BLOG_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
	userid		VARCHAR2(20)	CONSTRAINT  MEMBER_BLOG_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,  --USERID
	self_intro 	VARCHAR2(1000),      --자기소개 내용
    originalfilename	VARCHAR2(50),                       --프로필 사진  원본 사진
	savedfilename	VARCHAR2(50)                            --프로필 업로드 할 사진
);
--가고싶은 축제장소
CREATE TABLE WISHLIST(
    ADMINID VARCHAR2(20) CONSTRAINT WISHLIST_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    WISHLIST_NUM NUMBER NOT NULL PRIMARY KEY,   --시퀀스 넘
    MAINBOARDNUM NUMBER NOT NULL  CONSTRAINT WISHLIST_MAINBOARDNUM_FK REFERENCES MAINBOARD(MAINBOARDNUM) ON DELETE CASCADE,
    USERID VARCHAR2(20)	CONSTRAINT  WISHLIST_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,
    HIT NUMBER,                                 --조회수
    inputtime DATE DEFAULT SYSDATE
);
CREATE SEQUENCE WISHLIST_SEQ;
--리스트 게시판
CREATE TABLE MAINBOARD(
    ADMINID VARCHAR2(20) CONSTRAINT MAINBOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    MAINBOARDNUM NUMBER NOT NULL PRIMARY KEY,       --리스트 보드 넘
    USERID VARCHAR2(20)   CONSTRAINT  MAINBOARD_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,    --유저아이디
    TITLE VARCHAR2(50) not null,  -- 제목
    COUNTRY VARCHAR2(20) NOT NULL,  --나라
    ADRESS VARCHAR2(100),       --주소
    FESTIVAL_INTRO VARCHAR2(1000),  --축제 정보 (내용)
    SURROUND_PLACE VARCHAR2(1000),  --주변 지역 정보
    INPUTTIME DATE DEFAULT SYSDATE,  --입력 날자
    STARTEVENT DATE (20) DEFAULT SYSDATE,   --축제시작날짜
    ENDEVENT DATE (20),          --축제끝나는날짜
    originalFileName VARCHAR(50),     -- 오리지날파일이름
    SAVEFILENAME VARCHAR(50)        -- 세이브파일 이름
);
CREATE SEQUENCE MAINBOARD_SEQ;
--댓글 게시판
CREATE TABLE REPLY(
    ADMINID VARCHAR2(20) CONSTRAINT REPLY_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    replynum	NUMBER			PRIMARY KEY,    --댓글 번호
	MAINBOARDNUM	NUMBER		NOT NULL CONSTRAINT REPLY_BOARDNUM_FK REFERENCES MAINBOARD(MAINBOARDNUM) ON DELETE CASCADE, --현재 보는 게시판 번호
	USERID		VARCHAR2(20)	NOT NULL CONSTRAINT REPLY_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,    --유저아이디  
	REPLYTEXT	VARCHAR2(1000)	NOT NULL,   --댓글 
    ORIGINALFILENAME VARCHAR(50),   
    SAVEFILENAME VARCHAR(50),       
	INPUTDATE		DATE  DEFAULT SYSDATE   
);

CREATE TABLE BUL_BOARD(
     ADMINID VARCHAR2(20) CONSTRAINT BULLETIN_BOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
      USERID VARCHAR2(20)   CONSTRAINT  BUL_BOARD_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,    --유저아이디
     BUL_BOARDNUM  NUMBER PRIMARY KEY,                      --자유게시판 
     TITLE VARCHAR2(20) NOT NULL, 
     CONTENTS VARCHAR2(1000),
      COUNTRY VARCHAR2(20),  --나라
    ADRESS VARCHAR2(100),       --주소
    INPUTDATE      DATE  DEFAULT SYSDATE,                     --제목
    HIT NUMBER,                                            --조회수--게시글 내용
    originalfilename   VARCHAR2(50),                       --사진파일 원본 이름
    savedfilename   VARCHAR2(50)                          --보여주는 이름
);

CREATE SEQUENCE BUL_BOARDNUM_SEQ;



CREATE SEQUENCE REPLY_SEQ;

ALTER TABLE
   member
ADD(
   originalfilename VARCHAR2(200)
   , savedfilename VARCHAR2(200)
);

DROP SEQUENCE REPLY_SEQ;
DROP SEQUENCE MAINBOARD_SEQ;
DROP SEQUENCE WISHLIST_SEQ;

DROP TABLE MEMBER;
DROP TABLE MEMBER_BLOG;
DROP TABLE WISHLIST;
DROP TABLE REPLY;
DROP TABLE MAINBOARD;

commit;

INSERT INTO mainboard(MAINBOARDNUM, USERID, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO) VALUES(
    MAINBOARD_SEQ.nextval, 123, '새암축제', 'RU', '블라디보스토크 500-3', '새암새암하는 축제'
);
INSERT INTO mainboard(MAINBOARDNUM, USERID, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO) VALUES(
    MAINBOARD_SEQ.nextval, 123, '지은축제', 'RU', '모스크바 24-7', '지렁쓰'
);
INSERT INTO mainboard(MAINBOARDNUM, USERID, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO) VALUES(
    MAINBOARD_SEQ.nextval, 123, '성민축제', 'CA', '벤쿠버 감자탕집', '성민성민'
);
INSERT INTO member(userid, username, userpwd, email) VALUES(
    '123', '이지은', '123', '123@123.123'
);