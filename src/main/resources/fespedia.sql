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
   username    VARCHAR2(20)   NOT NULL UNIQUE,          --USERNAME
   userpwd       VARCHAR2(20)   NOT NULL,                  --USERPWD
   useremail       VARCHAR2(50)    NOT NULL                         --메일
);