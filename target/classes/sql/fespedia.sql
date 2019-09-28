--0927 테이블

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
   email       VARCHAR2(50)    NOT NULL,
    originalfilename VARCHAR2(200),
    savedfilename VARCHAR2(200)--메일
);
--블로그에서 자기소개
CREATE TABLE MEMBER_BLOG(
  ADMINID VARCHAR2(20) CONSTRAINT MEMBER_BLOG_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
	userid		VARCHAR2(20)	CONSTRAINT  MEMBER_BLOG_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,  --USERID
	self_intro 	VARCHAR2(1000),      --자기소개 내용
    originalfilename	VARCHAR2(200),                       --프로필 사진  원본 사진
	savedfilename	VARCHAR2(200)                            --프로필 업로드 할 사진
);
--리스트 게시판
CREATE TABLE MAINBOARD(
    ADMINID VARCHAR2(20) CONSTRAINT MAINBOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    MAINBOARDNUM NUMBER NOT NULL PRIMARY KEY,       --리스트 보드 넘
    USERID VARCHAR2(20)   CONSTRAINT  MAINBOARD_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,    --유저아이디
    TITLE VARCHAR2(1000) not null,  -- 제목
    COUNTRY VARCHAR2(20) NOT NULL,  --나라
    ADRESS VARCHAR2(100),       --주소
    FESTIVAL_INTRO VARCHAR2(1000),  --축제 정보 (내용)
    SURROUND_PLACE VARCHAR2(1000),  --주변 지역 정보
    INPUTTIME DATE DEFAULT SYSDATE,  --입력 날자
    STARTEVENT DATE DEFAULT SYSDATE,   --축제시작날짜
    ENDEVENT DATE DEFAULT SYSDATE,          --축제끝나는날짜
    originalFileName VARCHAR(200),     -- 오리지날파일이름
    SAVEFILENAME VARCHAR(200),        -- 세이브파일 이름
    HASHTAG VARCHAR2(1000) DEFAULT '#축제,',
    CHECKSEARCH NUMBER DEFAULT 0
);
CREATE SEQUENCE MAINBOARD_SEQ;
--댓글 게시판
CREATE TABLE REPLY(
    ADMINID VARCHAR2(20) CONSTRAINT REPLY_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    replynum   NUMBER         PRIMARY KEY,    --댓글 번호
   MAINBOARDNUM   NUMBER      NOT NULL CONSTRAINT REPLY_BOARDNUM_FK REFERENCES MAINBOARD(MAINBOARDNUM) ON DELETE CASCADE, --현재 보는 게시판 번호
   USERID      VARCHAR2(20)   NOT NULL CONSTRAINT REPLY_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,    --유저아이디  
   REPLYTEXT   VARCHAR2(1000)   NOT NULL,   --댓글 
    ORIGINALFILENAME VARCHAR(200),   
    SAVEFILENAME VARCHAR(200),       
   INPUTDATE      DATE  DEFAULT SYSDATE   
);
CREATE SEQUENCE REPLY_SEQ;
--회원 자유게시판
CREATE TABLE BUL_BOARD(
     ADMINID VARCHAR2(20) CONSTRAINT BULLETIN_BOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
      USERID VARCHAR2(20)   CONSTRAINT  BUL_BOARD_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,    --유저아이디
     BUL_BOARDNUM  NUMBER PRIMARY KEY,                      --자유게시판 
     TITLE VARCHAR2(20) NOT NULL,                           --제목
     HIT NUMBER DEFAULT 0,                                            --조회수
     CONTENTS VARCHAR2(1000),                               --게시글 내용
     ORIGINALFILENAME   VARCHAR2(50),                       --사진파일 원본 이름
    savedfilename   VARCHAR2(50),                          --보여주는 이름
    INPUTDATE      DATE  DEFAULT SYSDATE               
);
--가고싶은 축제장소
CREATE TABLE WISHLIST(
    ADMINID VARCHAR2(20) CONSTRAINT WISHLIST_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    WISHLIST_NUM NUMBER NOT NULL PRIMARY KEY,   --시퀀스 넘
    MAINBOARDNUM NUMBER NOT NULL  CONSTRAINT WISHLIST_MAINBOARDNUM_FK REFERENCES MAINBOARD(MAINBOARDNUM) ON DELETE CASCADE,
    USERID VARCHAR2(20)	CONSTRAINT  WISHLIST_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,
    inputtime DATE DEFAULT SYSDATE             --등록날짜
);
CREATE SEQUENCE WISHLIST_SEQ;
--축제 추천 테이블
CREATE TABLE SEARCHFESTIVAL(
    FESTIVALNAME VARCHAR2(100),
    IMAGE VARCHAR2(200) 
);
--관리자 리스트 게시판
CREATE TABLE ADMIN_MAINBOARD(
    ADMINID VARCHAR2(20) CONSTRAINT ADMIN_MAINBOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    ADMIN_MAINBOARDNUM NUMBER NOT NULL PRIMARY KEY,       --어드민 보드 넘
    MAINBOARDNUM NUMBER NOT NULL,  --리스트 보드 넘
    USERID VARCHAR2(20),    --유저아이디
    TITLE VARCHAR2(1000) not null,  -- 제목
    COUNTRY VARCHAR2(20) NOT NULL,  --나라
    ADRESS VARCHAR2(100),       --주소
    FESTIVAL_INTRO VARCHAR2(1000),  --축제 정보 (내용)
    SURROUND_PLACE VARCHAR2(1000),  --주변 지역 정보
    INPUTTIME DATE DEFAULT SYSDATE,  --입력 날자
    STARTEVENT DATE DEFAULT SYSDATE,   --축제시작날짜
    ENDEVENT DATE DEFAULT SYSDATE,          --축제끝나는날짜
    originalFileName VARCHAR(200),     -- 오리지날파일이름
    SAVEFILENAME VARCHAR(200),        -- 세이브파일 이름
    HASHTAG VARCHAR2(1000) DEFAULT '#축제,',
    DATACHECK VARCHAR2(100) NOT NULL         --인설트,수정,삭제 타입 구별
);
--ADMIN 자유게시판
CREATE TABLE ADMIN_BUL_BOARD(
     ADMINID VARCHAR2(20) CONSTRAINT ADMIN_BUL_BOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
     ADMIN_MAINBOARDNUM NUMBER NOT NULL PRIMARY KEY,       --어드민 보드 넘
     USERID VARCHAR2(20) NOT NULL,    --유저아이디
      BUL_BOARDNUM NUMBER NOT NULL,  --리스트 보드 넘
     TITLE VARCHAR2(20) NOT NULL, 
     CONTENTS VARCHAR2(1000),
      COUNTRY VARCHAR2(20),  --나라
    ADRESS VARCHAR2(100),       --주소
    INPUTDATE      DATE  DEFAULT SYSDATE,                     --제목
    HIT NUMBER DEFAULT 0,                                            --조회수--게시글 내용
    ORIGINALFILENAME   VARCHAR2(200),                       --사진파일 원본 이름
    SAVEDFILENAME   VARCHAR2(200),                          --보여주는 이름
    DATACHECK VARCHAR2(100) NOT NULL                        --데이터 타입 체크
);

CREATE SEQUENCE ADMIN_MAINBOARD_SEQ;

insert into ADMINMEMBER 
    values('aa','aa','aaa@naver.com');


INSERT INTO member(userid, userpwd, email) VALUES(
    '123', '123', '123@123.123'
);

INSERT INTO mainboard(MAINBOARDNUM, USERID, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, STARTEVENT, ENDEVENT) VALUES(
    MAINBOARD_SEQ.nextval, 123, '새암축제', 'RU', '블라디보스토크 500-3', '새암새암하는 축제', '2019-09-11', '2019-09-13'
);
INSERT INTO mainboard(MAINBOARDNUM, USERID, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, STARTEVENT, ENDEVENT) VALUES(
    MAINBOARD_SEQ.nextval, 123, '지은축제', 'RU', '모스크바 24-7', '지렁쓰', '2019-09-12', '2019-09-14'
);
INSERT INTO mainboard(MAINBOARDNUM, USERID, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, STARTEVENT, ENDEVENT) VALUES(
    MAINBOARD_SEQ.nextval, 123, '성민축제', 'CA', '벤쿠버 감자탕집', '성민성민', '2019-09-13', '2019-09-15'
);
INSERT INTO mainboard(MAINBOARDNUM, USERID, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, STARTEVENT, ENDEVENT) VALUES(
    MAINBOARD_SEQ.nextval, 123, '축제', 'KR', '코엑스', 'scit축제', '2019-09-05', '2019-09-11'
);
INSERT INTO mainboard(MAINBOARDNUM, USERID, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, STARTEVENT, ENDEVENT) VALUES(
    MAINBOARD_SEQ.nextval, 123, '새암새암', 'KR', '제주특별자치도 서귀포시 남원읍 태위로 632', '새암이형밖에없조', '2019-09-01', '2019-09-03'
);
INSERT INTO mainboard(MAINBOARDNUM, USERID, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, STARTEVENT, ENDEVENT) VALUES(
    MAINBOARD_SEQ.nextval, 123, '한성이축제', 'US', '미국 10036 뉴욕 맨해튼', '맨해튼한성', '2019-09-24', '2019-09-27'
);

UPDATE mainboard SET HASHTAG='#음식,#축제'
    WHERE MAINBOARDNUM = 14;    
UPDATE mainboard SET HASHTAG='#축제,#공원'
    WHERE MAINBOARDNUM = 15;
UPDATE mainboard SET HASHTAG='#음식,#축제'
    WHERE MAINBOARDNUM = 16;    
UPDATE mainboard SET HASHTAG='#축제,#공원'
    WHERE MAINBOARDNUM = 17;

ALTER TABLE mainboard
ADD (CHECKSEARCH NUMBER DEFAULT 0);

UPDATE mainboard SET CHECKSEARCH = 0;

commit;

--------------------------------------------------------------------------------------------------------------------------------
DROP SEQUENCE REPLY_SEQ;
DROP SEQUENCE MAINBOARD_SEQ;
DROP SEQUENCE WISHLIST_SEQ;

DROP TABLE MEMBER;
DROP TABLE MEMBER_BLOG;
DROP TABLE WISHLIST;
DROP TABLE REPLY;
DROP TABLE MAINBOARD;
DROP TABLE BUL_BOARD;
--------------------------------------------------------------------------------------------------------------------------------
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/fall.jpg', '#가을');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/winter.jpg', '#겨울');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/rock.jpg', '#락페스티벌');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/matsuri.jpg', '#마쯔리');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/beer.jpg', '#맥주');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/culturalFestival.jpg', '#문화제');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/sea.jpg', '#바다');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/spring.jpg', '#봄');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/mountain.jpg', '#산');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/sports.jpg', '#스포츠');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/america.jpg', '#아메리카 축제');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/asia.jpg', '#아시아 축제');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/africa.jpg', '#아프리카 축제');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/expo.jpg', '#엑스포');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/summer.jpg', '#여름');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/movie.jpg', '#영화제');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/oceania.jpg', '#오세아니아 축제');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/wine.jpg', '#와인');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/europe.jpg', '#유럽');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/food.jpg', '#음식');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/music.jpg', '#음악');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/jazz.jpg', '#재즈');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/religion.jpg', '#종교');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/carnival.jpg', '#축제');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/costume.jpg', '#코스튬');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/christmas.jpg', '#크리스마스');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/specialproduct.jpg', '#특산물');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/halloween.jpg', '#할로윈');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/hiphop.jpg', '#힙합');

SELECT * FROM MAINBOARD WHERE hashtag LIKE '%' ||  '' || '%';

UPDATE mainboard SET checksearch = checksearch+1 WHERE hashtag LIKE '%' ||  '음식' || '%';

UPDATE mainboard SET checksearch = 0;

INSERT ALL
    INTO MAINBOARD (mainBoardNum, title, country, adress, festival_intro) VALUES (1, '1', 'KR', '1', '1')
    INTO MAINBOARD (mainBoardNum, title, country, adress, festival_intro) VALUES (2, '2', 'KR', '2', '2')   
SELECT * FROM DUAL;

insert INTO MAINBOARD (mainBoardNum, title, country, adress, festival_intro) VALUES (mainboard_seq.nextval, '1', 'KR', '1', '1');

SELECT * FROM MAINBOARD WHERE 
startEvent BETWEEN SYSDATE-7 AND  SYSDATE or 
endEvent BETWEEN SYSDATE AND SYSDATE+7;