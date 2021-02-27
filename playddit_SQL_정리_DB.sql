DROP TABLE ALARM;
DROP TABLE CLASS;
DROP TABLE EMAIL_CHECK;
DROP TABLE FOLLOW;
DROP TABLE USERS;
DROP TABLE stipulation;
DROP TABLE stipulRation_his;
DROP TABLE TERMS_HIS;

alter table users modify user_pic varchar2(1000);

ALTER TABLE USERS2 ADD COLUMN_COPY CLOB;
-- CASCADE 옵션을 줄 경우 외래키(Foreign key)로 물린 하위 테이블들 까지 함께 삭제된다.

DROP TABLE table명 CASCADE CONSTRAINTS ;

DROP TABLE CLASS_MSG CASCADE CONSTRAINTS;
DROP TABLE FEED CASCADE CONSTRAINTS ;
DROP TABLE CLASS CASCADE CONSTRAINTS ;
DROP TABLE FEED_COMMENT CASCADE CONSTRAINTS ;
DROP TABLE USERS CASCADE CONSTRAINTS ;


commit;
-- 컬럼명 변경 --
alter table class_msg rename column c_msg_no to cmsg_no;



-- 자료 있는 데이터의 컬럼타입 변경
-- 임시컬럼 생성
alter table users add (user_pic2 blob);

-- 임시컬럼에 데이터 백업
update users
set user_pic2 = user_pic;

alter table users modify user_pic varchar2(1000);

alter table notice modify notice_pic varchar2(1000);

alter table notice drop column notice_pic;

alter table notice add (notice_pic varchar2(1000));
-- 컬럼 삭제


alter table users drop column user_pic;


-- 원본 컬럼 다시 생성
alter table users add (user_pic varchar2(1000));

-- 원본 컬럼 데이터 복원
update users
set user_pic = user_pic2;

-- 임시컬럼 삭제
alter table users drop column user_pic2;



--------------------------------------------------------
-- 컬럼 데이터 타입 변경 --

--  user_pic 컬럼 삭제 
alter table users drop column user_pic;

-- user_pic 컬럼 데이터 타입 varchar2(1000)로 변경해서 생성
alter table users add (user_pic varchar2(1000));

--//////////////////////////////////////////////////////
--  feed_pic 컬럼 삭제 
alter table feed drop column feed_pic;

-- user_pic 컬럼 데이터 타입 varchar2(1000)로 변경해서 생성
alter table feed add (feed_pic varchar2(1000));

--table 데이터 삭제
delete from feed_comment;
commit;
delete from feed;

--//////////////////////////////////////////////////////

--sequence 생성
create sequence alarm_no_seq
start with 1
increment by 1;

create sequence blame_no_seq
start with 1
increment by 1;

create sequence like_no_seq
start with 1
increment by 1;

create sequence msg_no_seq
start with 10
increment by 1;

create sequence feed_no_seq
start with 10
increment by 1;

create sequence feed_com_no_seq
start with 1
increment by 1;

create sequence email_chk_no_seq
start with 1
increment by 1;

create sequence follow_no_seq
start with 10
increment by 1;


create sequence notice_no_seq
start with 1
increment by 1;

create sequence notice_com_no_seq
start with 1
increment by 1;

create sequence cmsg_no_seq
start with 1
increment by 1;


rollback;


--///////////////////////////////////////////////////

drop sequence c_msg_no_seq;

--alarm table 에 sequence 입력

insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk,alarm_chk_date) 
values(alarm_no_seq.nextval, 'expedition1205@gmail.com', 'summer 가 새글을 등록했습니다.', '1',sysdate,'1',sysdate);

insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk) 
values(alarm_no_seq.nextval, 'expedition1205@gmail.com', 'Scarlett(이)가 새글을 등록했습니다.', '1',sysdate,'0');

insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk) 
values(alarm_no_seq.nextval, 'psh40963@naver.com', 'Scarlett(이)가 새로운 메시지를 보냈습니다.', '1',sysdate,'0');

insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk) 
values(alarm_no_seq.nextval, 'psh40963@naver.com', 'seq test 입니다.', '1',sysdate,'0');

insert into blame(blame_no, user_id, target_id, feed_no, blame_date)
values(blame_no_seq.nextval, 'psh40963@naver.com', 'a001','4',sysdate);

insert into blame(blame_no, user_id, target_id, feed_no, blame_date)
values(blame_no_seq.nextval, 'expedition1205@gmail.com', 'a001','4',sysdate);

insert into likes(like_no, user_id, feed_no)
values(like_no_seq.nextval, 'psh40963@naver.com','3');

insert into likes(like_no, user_id, feed_no)
values(like_no_seq.nextval, 'chdnjs7610@gmail.com','1');

insert into message(msg_no, msg_target_id, msg_sender, msg_content, msg_senddate)
values(msg_no_seq.nextval, 'psh40963@naver.com','expedition1205@gmail.com', 'seq테스트입니다.', sysdate);

insert into feed(feed_no, user_id, feed_cont, feed_date)
values(feed_no_seq.nextval, 'chdnjs7610@gmail.com', 'seq 생성 후 데이터 넣어보기3', sysdate);


insert into feed_comment (feed_com_no, feed_no, user_id, feed_com_cont, feed_com_date)
values(feed_com_no_seq.nextval, '10', 'expedition1205@gmail.com', 'seq 테스트 입니다2.',sysdate);

insert into email_check (email_chk_no, email_chk_date, email_chk_cont, email_chk_addr)
values(email_chk_no_seq.nextval, sysdate, 'seq test 입니다2.' ,'psh40963@naver.com');

insert into follow (follow_no, follower, followee)
values(follow_no_seq.nextval, 'ch@gmail.com','ex@gmail.com');

insert into notice (notice_no, user_id, notice_cont, notice_date)
values(notice_no_seq.nextval, 'psh40963@naver.com', '첫번째 seq 테스트 공지사항입니다.', sysdate);

insert into notice (notice_no, user_id, notice_cont, notice_date)
values(notice_no_seq.nextval, 'expedition1205@gmail.com', '두번째 seq 테스트 공지사항입니다.', sysdate);

insert into notice_comment(notice_com_no, notice_no, user_id, notice_com_cont, notice_com_date)
values(notice_com_no_seq.nextval, '1','expedition1205@gmail.com', '첫번째 seq테스트 공지댓글입니다.', sysdate);

insert into notice_comment(notice_com_no, notice_no, user_id, notice_com_cont, notice_com_date)
values(notice_com_no_seq.nextval, '2','psh40963@naver.com', '두번째 seq테스트 공지댓글입니다.', sysdate);

insert into class_msg(cmsg_no, class_id, msg_sender, msg_cont, msg_senddate)
values(cmsg_no_seq.nextval, 'C202011302', 'psh40963@naver.com', '메시지내용(클래스단체메시지테스트)입니다.',sysdate);


COMMIT;

DROP TABLE TERMS;
DROP TABLE TERMS_HIS;

ROLLBACK;



--////////////////////////////////////////////////////////////
-- playddit sql 정리 

-- 컬럼명 변경 --
alter table class_msg rename column c_msg_no to cmsg_no;

--sequence 생성
create sequence alarm_no_seq
start with 1
increment by 1;

-- drop sequence 
drop sequence c_msg_no_seq;

--alarm table 에 sequence 입력
insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk,alarm_chk_date) 
values(alarm_no_seq.nextval, 'expedition1205@gmail.com', 'summer 가 새글을 등록했습니다.', '1',sysdate,'1',sysdate);



--AS MEMBERS 로 메시지 나눈 상대방 가져오기 
select members
from
(select case when (select user_nickname
                    from users
                    where user_id= 'psh40963@naver.com' ) = b.user_nickname then c.user_nickname 
                     else b.user_nickname end as members, a.msg_content, a.msg_senddate
                from message a, users b, users c
                where (msg_sender = 'psh40963@naver.com' or msg_target_id = 'psh40963@naver.com')
                and a.msg_target_id = b.user_id
                and a.msg_sender = c.user_id
                order by msg_no desc)
                group by members;
                    
 SELECT DISTINCT (CASE WHEN A.MSG_SENDER = 'psh40963@naver.com' THEN A.MSG_TARGET_ID
                      ELSE A.MSG_SENDER END) as send_receive_members,
       A.MSG_CONTENT, 
       A.MSG_TARGET_ID,
       A.MSG_SENDER,
       A.MSG_SENDDATE
     
FROM MESSAGE A, USERS B  
WHERE A.MSG_TARGET_ID = B.USER_ID
AND MSG_SENDER = 'psh40963@naver.com' OR MSG_TARGET_ID = 'psh40963@naver.com'
ORDER BY MSG_SENDDATE desc;


      
    
-- ALARM 쿼리

-- 회원가입


-- FOLLOW INSERT 
insert into follow (follow_no, follower, followee)
values(follow_no_seq.nextval, 'a001','a002');

-- FOLLOW DELETE
delete from follow
where follower = 'a001' and followee = 'a002';





----/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--피드(feed)


select * from users;

--내 피드 글 생성
insert into feed (feed_no, user_id, feed_cont,feed_date,feed_pic)
        values(feed_no_seq.nextval, 
                'expedition1205@gmail.com',
                '입력 테스트용 피드입니다.',sysdate, null);

-- 피드 수정 
update feed set 
          feed_cont = '피드를 수정합니다.',
          feed_date = sysdate,
          feed_pic = null
          where feed_no = '32';
-- 피드 삭제
delete from feed
where user_id = 'expedition1205@gmail.com'
and feed_no = '31';

-- 피드 좋아요
insert into likes(like_no, user_id, feed_no)
values(like_no_seq.nextval, 'expedition1205@gmail.com', '1');

-- 피드 좋아요 취소
delete from likes
where feed_no = '1'
and user_id = 'expedition1205@gmail.com';


-- 피드 댓글 등록
insert into feed_comment(feed_com_no,feed_no, user_id, feed_com_cont, feed_com_date)
values (feed_com_no_seq.nextval,'32', 'chdnjs7610@gmail.com','피드댓글3test입니다.', sysdate); 

-- 피드 댓글 삭제
delete from feed_comment
where feed_com_no = '23'
and feed_no = '32'
and user_id = 'chdnjs7610@gmail.com';

-- 피드 신고
insert into blame(blame_no, user_id, target_id, feed_no, target_type, blame_date)
values(blame_no_seq.nextval, 'bomik0614@gmail.com',(select user_id from feed where feed_no = '32'),'32',null,sysdate);


-- target_id
-- 피드 넘버를 보내줘서 신고를 하면 피드 넘버를 보고  피드를 작성한 사람이target_id / 
select user_id from feed where feed_no = '32' ;

-- 내 피드 글 불러오기
select feed_cont as content
from feed
where user_id = 'expedition1205@gmail.com'
order by feed_no desc;

-- 내가 팔로잉 하는 회원 피드 글 시간 순으로 불러오기
-- 1. 팔로잉 하는 회원들 아이디 순서대로
select user_id 
    from users 
    where user_id in (select followee
                        from follow
                        where follower = 'psh40963@naver.com');
                        
                        
-- 2. 출력할 피드들 
select feed_cont as feedcontent, user_id, feed_date
    from feed
    where user_id in (select user_id
                         from users
                         where user_id in (select followee
                                               from follow
                                                 where follower = 'psh40963@naver.com')) -- 내가 팔로잉 하는 회원들 
    or user_id = 'psh40963@naver.com'   -- 나 
    
    order by feed_date;
    
     
     
        


select a.feed_cont as content
from feed a
where a.user_id =(select b.user_id 
                from users b
                where user_id in (select followee
                                 from follow
                                 where follower ='bomik0614@gmail.com')
   
   order by feed_date desc;                         
                                 




               













/* 회원약관 */
CREATE TABLE TERMS (
	TERMS_NO NUMBER NOT NULL, /* 약관번호 */
	TERMS_TITLE VARCHAR2(100) DEFAULT 'DEFAULT', /* 약관이름 */
	TERMS_CONT CLOB DEFAULT 'DEFAULT', /* 약관내용 */
	TERMS_ESSEN NUMBER DEFAULT 0, /* 필수여부 */
	TERMS_SEQ NUMBER DEFAULT 0, /* 약관순서 */
	TERMS_USE NUMBER  DEFAULT 0
    
   
);

COMMENT ON TABLE TERMS IS '회원약관';

COMMENT ON COLUMN TERMS.TERMS_NO IS '약관번호';

COMMENT ON COLUMN TERMS.TERMS_TITLE IS '약관이름';

COMMENT ON COLUMN TERMS.TERMS_CONT IS '약관내용';

COMMENT ON COLUMN TERMS.TERMS_ESSEN IS '필수여부';

COMMENT ON COLUMN TERMS.TERMS_SEQ IS '약관순서';

COMMENT ON COLUMN TERMS.TERMS_USE IS '약관사용여부';

/* 약관동의이력 */
CREATE TABLE TERMS_HIS (
	TERMS_NO NUMBER NOT NULL, /* 약관번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	TERMS_AGREE NUMBER NOT NULL 
    
    /* 동의여부 */
);

COMMENT ON TABLE TERMS_HIS IS '약관동의이력';

COMMENT ON COLUMN TERMS_HIS.TERMS_NO IS '약관번호';

COMMENT ON COLUMN TERMS_HIS.USER_ID IS '이메일아이디';

COMMENT ON COLUMN TERMS_HIS.TERMS_AGREE IS '동의여부';

CREATE UNIQUE INDEX PK_TERMS_HIS
	ON TERMS_HIS (
		TERMS_NO ASC
	);

ALTER TABLE TERMS_HIS
	ADD
		CONSTRAINT PK_TERMS_HIS
		PRIMARY KEY (
			TERMS_NO
		);

ALTER TABLE TERMS
	ADD
		CONSTRAINT FK_TERMS_HIS_TO_TERMS
		FOREIGN KEY (
			TERMS_NO
		)
		REFERENCES TERMS_HIS (
			TERMS_NO
		);

ALTER TABLE TERMS_HIS
	ADD
		CONSTRAINT FK_USERS_TO_TERMS_HIS
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);
        
        SELECT * FROM TERMS;



/* 이메일인증 */
CREATE TABLE EMAIL_CHECK (
	EMAIL_CHK_NO NUMBER NOT NULL, /* 이메일인증번호 */
	EMAIL_CHK_DATE DATE NOT NULL, /* 인증번호발송시간 */
	EMAIL_CHK_CONT VARCHAR2(200) NOT NULL, /* 인증번호내용 */
	EMAIL_CHK_ADDR VARCHAR2(200) NOT NULL /* 이메일주소 */
);

COMMENT ON TABLE EMAIL_CHECK IS '이메일인증';

COMMENT ON COLUMN EMAIL_CHECK.EMAIL_CHK_NO IS '이메일인증번호';

COMMENT ON COLUMN EMAIL_CHECK.EMAIL_CHK_DATE IS '인증번호발송시간';

COMMENT ON COLUMN EMAIL_CHECK.EMAIL_CHK_CONT IS '인증번호내용';

COMMENT ON COLUMN EMAIL_CHECK.EMAIL_CHK_ADDR IS '이메일주소';

CREATE UNIQUE INDEX PK_EMAIL_CHECK
	ON EMAIL_CHECK (
		EMAIL_CHK_NO ASC
	);

ALTER TABLE EMAIL_CHECK
	ADD
		CONSTRAINT PK_EMAIL_CHECK
		PRIMARY KEY (
			EMAIL_CHK_NO
		);

/* 팔로우 */
CREATE TABLE FOLLOW (
	FOLLOW_NO NUMBER NOT NULL, /* 팔로우번호 */
	FOLLOWER VARCHAR2(200) NOT NULL, /* 팔로워 */
	FOLLOWEE VARCHAR2(200) NOT NULL /* 팔로위 */
);

COMMENT ON TABLE FOLLOW IS '팔로우';

COMMENT ON COLUMN FOLLOW.FOLLOW_NO IS '팔로우번호';

COMMENT ON COLUMN FOLLOW.FOLLOWER IS '팔로워';

COMMENT ON COLUMN FOLLOW.FOLLOWEE IS '팔로위';

CREATE UNIQUE INDEX PK_FOLLOW
	ON FOLLOW (
		FOLLOW_NO ASC
	);

ALTER TABLE FOLLOW
	ADD
		CONSTRAINT PK_FOLLOW
		PRIMARY KEY (
			FOLLOW_NO
		);

/* 학급 */
CREATE TABLE CLASS (
	CLASS_ID VARCHAR2(200) NOT NULL, /* 학급번호 */
	CLASS_START DATE NOT NULL, /* 학급시작일 */
	CLASS_END DATE NOT NULL, /* 학급종료일 */
	CLASS_TITLE VARCHAR2(200) NOT NULL, /* 학급강좌명 */
	CLASS_NUM VARCHAR2(100) NOT NULL, /* 학급기수 */
	CLASS_ROOM VARCHAR2(100) NOT NULL /* 학급강의실 */
);

COMMENT ON TABLE CLASS IS '학급';

COMMENT ON COLUMN CLASS.CLASS_ID IS '학급번호';

COMMENT ON COLUMN CLASS.CLASS_START IS '학급시작일';

COMMENT ON COLUMN CLASS.CLASS_END IS '학급종료일';

COMMENT ON COLUMN CLASS.CLASS_TITLE IS '학급강좌명';

COMMENT ON COLUMN CLASS.CLASS_NUM IS '학급기수';

COMMENT ON COLUMN CLASS.CLASS_ROOM IS '학급강의실';

CREATE UNIQUE INDEX PK_CLASS
	ON CLASS (
		CLASS_ID ASC
	);

ALTER TABLE CLASS
	ADD
		CONSTRAINT PK_CLASS
		PRIMARY KEY (
			CLASS_ID
		);

/* 회원 */
CREATE TABLE USERS (
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	CLASS_ID VARCHAR2(200) DEFAULT 'DEFAULT' NOT NULL, /* 학급번호 */
	USER_NICKNAME VARCHAR2(100) NOT NULL, /* 닉네임 */
	USER_PASSWORD VARCHAR2(100) NOT NULL, /* 비밀번호 */
	USER_NAME VARCHAR2(100), /* 이름 */
	USER_TEL VARCHAR2(100), /* 전화번호 */
	USER_BIRTH DATE, /* 생일 */
	USER_RATING NUMBER  DEFAULT 0, /* 등급 */
	USER_THEME NUMBER  DEFAULT 0, /* 테마 */
	USER_SIGN_DATE DATE NOT NULL, /* 가입일자 */
	USER_PIC BLOB /* 회원사진 */
);

COMMENT ON TABLE USERS IS '회원';

COMMENT ON COLUMN USERS.USER_ID IS '이메일아이디';

COMMENT ON COLUMN USERS.CLASS_ID IS '학급번호';

COMMENT ON COLUMN USERS.USER_NICKNAME IS '닉네임';

COMMENT ON COLUMN USERS.USER_PASSWORD IS '비밀번호';

COMMENT ON COLUMN USERS.USER_NAME IS '이름';

COMMENT ON COLUMN USERS.USER_TEL IS '전화번호';

COMMENT ON COLUMN USERS.USER_BIRTH IS '생일';

COMMENT ON COLUMN USERS.USER_RATING IS '등급';

COMMENT ON COLUMN USERS.USER_THEME IS '테마';

COMMENT ON COLUMN USERS.USER_SIGN_DATE IS '가입일자';

COMMENT ON COLUMN USERS.USER_PIC IS '회원사진';

CREATE UNIQUE INDEX PK_USERS
	ON USERS (
		USER_ID ASC
	);

ALTER TABLE USERS
	ADD
		CONSTRAINT PK_USERS
		PRIMARY KEY (
			USER_ID
		);

/* 알림 */
CREATE TABLE ALARM (
	ALARM_NO NUMBER NOT NULL, /* 알림번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	ALARM_CONT VARCHAR2(200) NOT NULL, /* 알림내용 */
	ALARM_TYPE NUMBER NOT NULL, /* 알림유형 */
	ALARM_DATE DATE NOT NULL, /* 알림시간 */
	ALARM_CHK NUMBER, /* 알림확인여부 */
	ALARM_CHK_DATE DATE /* 알림확인시간 */
);

COMMENT ON TABLE ALARM IS '알림';

COMMENT ON COLUMN ALARM.ALARM_NO IS '알림번호';

COMMENT ON COLUMN ALARM.USER_ID IS '이메일아이디';

COMMENT ON COLUMN ALARM.ALARM_CONT IS '알림내용';

COMMENT ON COLUMN ALARM.ALARM_TYPE IS '알림유형';

COMMENT ON COLUMN ALARM.ALARM_DATE IS '알림시간';

COMMENT ON COLUMN ALARM.ALARM_CHK IS '알림확인여부';

COMMENT ON COLUMN ALARM.ALARM_CHK_DATE IS '알림확인시간';

CREATE UNIQUE INDEX PK_ALARM
	ON ALARM (
		ALARM_NO ASC
	);

ALTER TABLE ALARM
	ADD
		CONSTRAINT PK_ALARM
		PRIMARY KEY (
			ALARM_NO
		);

ALTER TABLE FOLLOW
	ADD
		CONSTRAINT FK_USERS_TO_FOLLOW
		FOREIGN KEY (
			FOLLOWER
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE FOLLOW
	ADD
		CONSTRAINT FK_USERS_TO_FOLLOW2
		FOREIGN KEY (
			FOLLOWEE
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE USERS
	ADD
		CONSTRAINT FK_CLASS_TO_USERS
		FOREIGN KEY (
			CLASS_ID
		)
		REFERENCES CLASS (
			CLASS_ID
		);

ALTER TABLE ALARM
	ADD
		CONSTRAINT FK_USERS_TO_ALARM
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);
        
        
--///////////////////////////////////////////////////////        
 /* 피드 */
CREATE TABLE FEED (
	FEED_NO NUMBER NOT NULL, /* 피드번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	FEED_CONT VARCHAR2(2000) NOT NULL, /* 피드내용 */
	FEED_PIC BLOB, /* 피드사진 */
	FEED_DATE DATE NOT NULL /* 피드작성일 */
);

COMMENT ON TABLE FEED IS '피드';

COMMENT ON COLUMN FEED.FEED_NO IS '피드번호';

COMMENT ON COLUMN FEED.USER_ID IS '이메일아이디';

COMMENT ON COLUMN FEED.FEED_CONT IS '피드내용';

COMMENT ON COLUMN FEED.FEED_PIC IS '피드사진';

COMMENT ON COLUMN FEED.FEED_DATE IS '피드작성일';

CREATE UNIQUE INDEX PK_FEED
	ON FEED (
		FEED_NO ASC
	);

ALTER TABLE FEED
	ADD
		CONSTRAINT PK_FEED
		PRIMARY KEY (
			FEED_NO
		);

/* 신고피드 */
CREATE TABLE BLAME (
	BLAME_NO NUMBER NOT NULL, /* 신고번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 신고한 회원 */
	TARGET_ID VARCHAR2(200) NOT NULL, /* 신고당한회원 */
	FEED_NO NUMBER NOT NULL, /* 피드번호 */
	TARGET_TYPE NUMBER, /* 신고종류 */
	BLAME_DATE DATE NOT NULL /* 신고일시 */
);

COMMENT ON TABLE BLAME IS '신고피드';

COMMENT ON COLUMN BLAME.BLAME_NO IS '신고번호';

COMMENT ON COLUMN BLAME.USER_ID IS '신고한 회원';

COMMENT ON COLUMN BLAME.TARGET_ID IS '신고당한회원';

COMMENT ON COLUMN BLAME.FEED_NO IS '피드번호';

COMMENT ON COLUMN BLAME.TARGET_TYPE IS '신고종류';

COMMENT ON COLUMN BLAME.BLAME_DATE IS '신고일시';

CREATE UNIQUE INDEX PK_BLAME
	ON BLAME (
		BLAME_NO ASC
	);

ALTER TABLE BLAME
	ADD
		CONSTRAINT PK_BLAME
		PRIMARY KEY (
			BLAME_NO
		);

/* 피드 댓글 */
CREATE TABLE FEED_COMMENT (
	FEED_COM_NO NUMBER NOT NULL, /* 피드댓글번호 */
	FEED_NO NUMBER NOT NULL, /* 피드번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	FEED_COM_CONT VARCHAR2(1000) NOT NULL, /* 피드댓글내용 */
	FEED_COM_DATE DATE NOT NULL /* 피드댓글시간 */
);

COMMENT ON TABLE FEED_COMMENT IS '피드 댓글';

COMMENT ON COLUMN FEED_COMMENT.FEED_COM_NO IS '피드댓글번호';

COMMENT ON COLUMN FEED_COMMENT.FEED_NO IS '피드번호';

COMMENT ON COLUMN FEED_COMMENT.USER_ID IS '이메일아이디';

COMMENT ON COLUMN FEED_COMMENT.FEED_COM_CONT IS '피드댓글내용';

COMMENT ON COLUMN FEED_COMMENT.FEED_COM_DATE IS '피드댓글시간';

CREATE UNIQUE INDEX PK_FEED_COMMENT
	ON FEED_COMMENT (
		FEED_COM_NO ASC
	);

ALTER TABLE FEED_COMMENT
	ADD
		CONSTRAINT PK_FEED_COMMENT
		PRIMARY KEY (
			FEED_COM_NO
		);

ALTER TABLE FEED
	ADD
		CONSTRAINT FK_USERS_TO_FEED
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE BLAME
	ADD
		CONSTRAINT FK_USERS_TO_BLAME
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE BLAME
	ADD
		CONSTRAINT FK_USERS_TO_BLAME2
		FOREIGN KEY (
			TARGET_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE BLAME
	ADD
		CONSTRAINT FK_FEED_TO_BLAME
		FOREIGN KEY (
			FEED_NO
		)
		REFERENCES FEED (
			FEED_NO
		);

ALTER TABLE FEED_COMMENT
	ADD
		CONSTRAINT FK_FEED_TO_FEED_COMMENT
		FOREIGN KEY (
			FEED_NO
		)
		REFERENCES FEED (
			FEED_NO
		);

ALTER TABLE FEED_COMMENT
	ADD
		CONSTRAINT FK_USERS_TO_FEED_COMMENT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);
        
        
--////////////////////////////////////////////////////////////////////////////////////        
       
       
/* 회원약관 */
CREATE TABLE TERMS (
	TERMS_NO NUMBER NOT NULL, /* 약관번호 */
	TERMS_TITLE VARCHAR2(100) DEFAULT 'DEFAULT', /* 약관이름 */
	TERMS_CONT VARCHAR2(2000) DEFAULT 'DEFAULT', /* 약관내용 */
	TERMS_ESSEN NUMBER DEFAULT 0, /* 필수여부 */
	TERMS_SEQ NUMBER DEFAULT 0, /* 약관순서 */
	TERMS_USE NUMBER DEFAULT 0 /* 약관사용여부 */
);



COMMENT ON TABLE TERMS IS '회원약관';

COMMENT ON COLUMN TERMS.TERMS_NO IS '약관번호';

COMMENT ON COLUMN TERMS.TERMS_TITLE IS '약관이름';

COMMENT ON COLUMN TERMS.TERMS_CONT IS '약관내용';

COMMENT ON COLUMN TERMS.TERMS_ESSEN IS '필수여부';

COMMENT ON COLUMN TERMS.TERMS_SEQ IS '약관순서';

COMMENT ON COLUMN TERMS.TERMS_USE IS '약관사용여부';

/* 약관동의이력 */
CREATE TABLE TERMS_HIS (
	TERMS_NO NUMBER NOT NULL, /* 약관번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	TERMS_AGREE NUMBER NOT NULL /* 동의여부 */
);

COMMENT ON TABLE TERMS_HIS IS '약관동의이력';

COMMENT ON COLUMN TERMS_HIS.TERMS_NO IS '약관번호';

COMMENT ON COLUMN TERMS_HIS.USER_ID IS '이메일아이디';

COMMENT ON COLUMN TERMS_HIS.TERMS_AGREE IS '동의여부';

CREATE UNIQUE INDEX PK_TERMS_HIS
	ON TERMS_HIS (
		TERMS_NO ASC
	);

ALTER TABLE TERMS_HIS
	ADD
		CONSTRAINT PK_TERMS_HIS
		PRIMARY KEY (
			TERMS_NO
		);

ALTER TABLE TERMS
	ADD
		CONSTRAINT FK_TERMS_HIS_TO_TERMS
		FOREIGN KEY (
			TERMS_NO
		)
		REFERENCES TERMS_HIS (
			TERMS_NO
		);

ALTER TABLE TERMS_HIS
	ADD
		CONSTRAINT FK_USERS_TO_TERMS_HIS
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);
 
      
-- select user_id, user_nickname,
--(select count(*) from follow where follower='psh40963@naver.com’) as following,
--(select count(*) from follow where followee='psh40963@naver.com’) as follower,
--(select class_title ||' ‘|| class_num || ' - ' || class_room
--from class
--where class_id = (select class_id from users where user_id= 'psh40963@naver.com’)) as className,
--(select count(*)
--from feed
--where feed.user_id = users.user_id) as allFeed,
--user_bio
--from users
--where user_id = 'psh40963@naver.com’;


--  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- 2021.02.25 --

/* 좋아요 */
CREATE TABLE LIKES (
	LIKE_NO NUMBER NOT NULL, /* 좋아요번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	FEED_NO NUMBER NOT NULL /* 피드번호 */
);

COMMENT ON TABLE LIKES IS '좋아요';

COMMENT ON COLUMN LIKES.LIKE_NO IS '좋아요번호';

COMMENT ON COLUMN LIKES.USER_ID IS '이메일아이디';

COMMENT ON COLUMN LIKES.FEED_NO IS '피드번호';

CREATE UNIQUE INDEX PK_LIKES
	ON LIKES (
		LIKE_NO ASC
	);

ALTER TABLE LIKES
	ADD
		CONSTRAINT PK_LIKES
		PRIMARY KEY (
			LIKE_NO
		);

ALTER TABLE LIKES
	ADD
		CONSTRAINT FK_FEED_TO_LIKES
		FOREIGN KEY (
			FEED_NO
		)
		REFERENCES FEED (
			FEED_NO
		);

ALTER TABLE LIKES
	ADD
		CONSTRAINT FK_USERS_TO_LIKES
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);
        
        
        
        
        /* 메시지 */
CREATE TABLE MESSAGE (
	MSG_NO NUMBER NOT NULL, /* 메시지번호 */
	MSG_TARGET_ID VARCHAR2(200) NOT NULL, /* 수신자 */
	MSG_SENDER VARCHAR2(200) NOT NULL, /* 발신자 */
	MSG_CONTENT VARCHAR2(2000) NOT NULL, /* 메시지내용 */
	MSG_SENDDATE DATE NOT NULL, /* 발송일자 */
	MSG_OPENDATE DATE /* 열람일자 */
);

COMMENT ON TABLE MESSAGE IS '메시지';

COMMENT ON COLUMN MESSAGE.MSG_NO IS '메시지번호';

COMMENT ON COLUMN MESSAGE.MSG_TARGET_ID IS '수신자';

COMMENT ON COLUMN MESSAGE.MSG_SENDER IS '발신자';

COMMENT ON COLUMN MESSAGE.MSG_CONTENT IS '메시지내용';

COMMENT ON COLUMN MESSAGE.MSG_SENDDATE IS '발송일자';

COMMENT ON COLUMN MESSAGE.MSG_OPENDATE IS '열람일자';

CREATE UNIQUE INDEX PK_MESSAGE
	ON MESSAGE (
		MSG_NO ASC
	);

ALTER TABLE MESSAGE
	ADD
		CONSTRAINT PK_MESSAGE
		PRIMARY KEY (
			MSG_NO
		);

ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_USERS_TO_MESSAGE
		FOREIGN KEY (
			MSG_TARGET_ID
		)
		REFERENCES USERS (
			USER_ID
		);
        
        

ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_USERS_TO_MESSAGE2
		FOREIGN KEY (
			MSG_SENDER
		)
		REFERENCES USERS (
			USER_ID
		);
        
        
        
        
--///////////////////////////////////////////////////////////////////////////////////////
--2021.02.26--
/* 공지사항 */
CREATE TABLE NOTICE (
	NOTICE_NO NUMBER NOT NULL, /* 공지사항번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	NOTICE_CONT VARCHAR2(2000) NOT NULL, /* 공지사항내용 */
	NOTICE_PIC BLOB, /* 공지사항사진 */
	NOTICE_DATE DATE NOT NULL /* 공지사항작성일 */
);

COMMENT ON TABLE NOTICE IS '공지사항';

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항번호';

COMMENT ON COLUMN NOTICE.USER_ID IS '이메일아이디';

COMMENT ON COLUMN NOTICE.NOTICE_CONT IS '공지사항내용';

COMMENT ON COLUMN NOTICE.NOTICE_PIC IS '공지사항사진';

COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '공지사항작성일';

CREATE UNIQUE INDEX PK_NOTICE
	ON NOTICE (
		NOTICE_NO ASC
	);

ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE
		PRIMARY KEY (
			NOTICE_NO
		);

/* 공지사항댓글 */
CREATE TABLE NOTICE_COMMENT (
	NOTICE_COM_NO NUMBER NOT NULL, /* 공지사항댓글번호 */
	NOTICE_NO NUMBER NOT NULL, /* 공지사항번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	NOTICE_COM_CONT VARCHAR2(1000) NOT NULL, /* 공지사항댓글내용 */
	NOTICE_COM_DATE DATE NOT NULL /* 공지사항댓글시간 */
);

COMMENT ON TABLE NOTICE_COMMENT IS '공지사항댓글';

COMMENT ON COLUMN NOTICE_COMMENT.NOTICE_COM_NO IS '공지사항댓글번호';

COMMENT ON COLUMN NOTICE_COMMENT.NOTICE_NO IS '공지사항번호';

COMMENT ON COLUMN NOTICE_COMMENT.USER_ID IS '이메일아이디';

COMMENT ON COLUMN NOTICE_COMMENT.NOTICE_COM_CONT IS '공지사항댓글내용';

COMMENT ON COLUMN NOTICE_COMMENT.NOTICE_COM_DATE IS '공지사항댓글시간';

CREATE UNIQUE INDEX PK_NOTICE_COMMENT
	ON NOTICE_COMMENT (
		NOTICE_COM_NO ASC
	);

ALTER TABLE NOTICE_COMMENT
	ADD
		CONSTRAINT PK_NOTICE_COMMENT
		PRIMARY KEY (
			NOTICE_COM_NO
		);

ALTER TABLE NOTICE
	ADD
		CONSTRAINT FK_USERS_TO_NOTICE
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE NOTICE_COMMENT
	ADD
		CONSTRAINT FK_USERS_TO_NOTICE_COMMENT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE NOTICE_COMMENT
	ADD
		CONSTRAINT FK_NOTICE_TO_NOTICE_COMMENT
		FOREIGN KEY (
			NOTICE_NO
		)
		REFERENCES NOTICE (
			NOTICE_NO
		);




/* 약관동의이력 */
CREATE TABLE TERMS_HIS (
	TERMS_NO NUMBER NOT NULL, /* 약관번호 */
	USER_ID VARCHAR2(200) NOT NULL, /* 이메일아이디 */
	TERMS_AGREE NUMBER NOT NULL /* 동의여부 */
);

COMMENT ON TABLE TERMS_HIS IS '약관동의이력';

COMMENT ON COLUMN TERMS_HIS.TERMS_NO IS '약관번호';

COMMENT ON COLUMN TERMS_HIS.USER_ID IS '이메일아이디';

COMMENT ON COLUMN TERMS_HIS.TERMS_AGREE IS '동의여부';

ALTER TABLE TERMS_HIS
	ADD
		CONSTRAINT FK_TERMS_TO_TERMS_HIS
		FOREIGN KEY (
			TERMS_NO
		)
		REFERENCES TERMS (
			TERMS_NO
		);

ALTER TABLE TERMS_HIS
	ADD
		CONSTRAINT FK_USERS_TO_TERMS_HIS
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);
        
        
   
   
   /* 클래스메시지 */
CREATE TABLE CLASS_MSG (
	C_MSG_NO NUMBER NOT NULL, /* 메시지번호 */
	CLASS_ID VARCHAR2(200) NOT NULL, /* 학급번호 */
	MSG_SENDER VARCHAR2(200) NOT NULL, /* 발신자 */
	MSG_CONT VARCHAR2(2000) NOT NULL, /* 메시지내용 */
	MSG_SENDDATE DATE NOT NULL /* 발송일자 */
);

COMMENT ON TABLE CLASS_MSG IS '클래스메시지';

COMMENT ON COLUMN CLASS_MSG.C_MSG_NO IS '메시지번호';

COMMENT ON COLUMN CLASS_MSG.CLASS_ID IS '학급번호';

COMMENT ON COLUMN CLASS_MSG.MSG_SENDER IS '발신자';

COMMENT ON COLUMN CLASS_MSG.MSG_CONT IS '메시지내용';

COMMENT ON COLUMN CLASS_MSG.MSG_SENDDATE IS '발송일자';

CREATE UNIQUE INDEX PK_CLASS_MSG
	ON CLASS_MSG (
		C_MSG_NO ASC
	);

ALTER TABLE CLASS_MSG
	ADD
		CONSTRAINT PK_CLASS_MSG
		PRIMARY KEY (
			C_MSG_NO
		);

ALTER TABLE CLASS_MSG
	ADD
		CONSTRAINT FK_CLASS_TO_CLASS_MSG
		FOREIGN KEY (
			CLASS_ID
		)
		REFERENCES CLASS (
			CLASS_ID
		);

ALTER TABLE CLASS_MSG
	ADD
		CONSTRAINT FK_USERS_TO_CLASS_MSG
		FOREIGN KEY (
			MSG_SENDER
		)
		REFERENCES USERS (
			USER_ID
		);     
        
        
        
        
        
 