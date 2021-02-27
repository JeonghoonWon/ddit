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
-- CASCADE �ɼ��� �� ��� �ܷ�Ű(Foreign key)�� ���� ���� ���̺�� ���� �Բ� �����ȴ�.

DROP TABLE table�� CASCADE CONSTRAINTS ;

DROP TABLE CLASS_MSG CASCADE CONSTRAINTS;
DROP TABLE FEED CASCADE CONSTRAINTS ;
DROP TABLE CLASS CASCADE CONSTRAINTS ;
DROP TABLE FEED_COMMENT CASCADE CONSTRAINTS ;
DROP TABLE USERS CASCADE CONSTRAINTS ;


commit;
-- �÷��� ���� --
alter table class_msg rename column c_msg_no to cmsg_no;



-- �ڷ� �ִ� �������� �÷�Ÿ�� ����
-- �ӽ��÷� ����
alter table users add (user_pic2 blob);

-- �ӽ��÷��� ������ ���
update users
set user_pic2 = user_pic;

alter table users modify user_pic varchar2(1000);

alter table notice modify notice_pic varchar2(1000);

alter table notice drop column notice_pic;

alter table notice add (notice_pic varchar2(1000));
-- �÷� ����


alter table users drop column user_pic;


-- ���� �÷� �ٽ� ����
alter table users add (user_pic varchar2(1000));

-- ���� �÷� ������ ����
update users
set user_pic = user_pic2;

-- �ӽ��÷� ����
alter table users drop column user_pic2;



--------------------------------------------------------
-- �÷� ������ Ÿ�� ���� --

--  user_pic �÷� ���� 
alter table users drop column user_pic;

-- user_pic �÷� ������ Ÿ�� varchar2(1000)�� �����ؼ� ����
alter table users add (user_pic varchar2(1000));

--//////////////////////////////////////////////////////
--  feed_pic �÷� ���� 
alter table feed drop column feed_pic;

-- user_pic �÷� ������ Ÿ�� varchar2(1000)�� �����ؼ� ����
alter table feed add (feed_pic varchar2(1000));

--table ������ ����
delete from feed_comment;
commit;
delete from feed;

--//////////////////////////////////////////////////////

--sequence ����
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

--alarm table �� sequence �Է�

insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk,alarm_chk_date) 
values(alarm_no_seq.nextval, 'expedition1205@gmail.com', 'summer �� ������ ����߽��ϴ�.', '1',sysdate,'1',sysdate);

insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk) 
values(alarm_no_seq.nextval, 'expedition1205@gmail.com', 'Scarlett(��)�� ������ ����߽��ϴ�.', '1',sysdate,'0');

insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk) 
values(alarm_no_seq.nextval, 'psh40963@naver.com', 'Scarlett(��)�� ���ο� �޽����� ���½��ϴ�.', '1',sysdate,'0');

insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk) 
values(alarm_no_seq.nextval, 'psh40963@naver.com', 'seq test �Դϴ�.', '1',sysdate,'0');

insert into blame(blame_no, user_id, target_id, feed_no, blame_date)
values(blame_no_seq.nextval, 'psh40963@naver.com', 'a001','4',sysdate);

insert into blame(blame_no, user_id, target_id, feed_no, blame_date)
values(blame_no_seq.nextval, 'expedition1205@gmail.com', 'a001','4',sysdate);

insert into likes(like_no, user_id, feed_no)
values(like_no_seq.nextval, 'psh40963@naver.com','3');

insert into likes(like_no, user_id, feed_no)
values(like_no_seq.nextval, 'chdnjs7610@gmail.com','1');

insert into message(msg_no, msg_target_id, msg_sender, msg_content, msg_senddate)
values(msg_no_seq.nextval, 'psh40963@naver.com','expedition1205@gmail.com', 'seq�׽�Ʈ�Դϴ�.', sysdate);

insert into feed(feed_no, user_id, feed_cont, feed_date)
values(feed_no_seq.nextval, 'chdnjs7610@gmail.com', 'seq ���� �� ������ �־��3', sysdate);


insert into feed_comment (feed_com_no, feed_no, user_id, feed_com_cont, feed_com_date)
values(feed_com_no_seq.nextval, '10', 'expedition1205@gmail.com', 'seq �׽�Ʈ �Դϴ�2.',sysdate);

insert into email_check (email_chk_no, email_chk_date, email_chk_cont, email_chk_addr)
values(email_chk_no_seq.nextval, sysdate, 'seq test �Դϴ�2.' ,'psh40963@naver.com');

insert into follow (follow_no, follower, followee)
values(follow_no_seq.nextval, 'ch@gmail.com','ex@gmail.com');

insert into notice (notice_no, user_id, notice_cont, notice_date)
values(notice_no_seq.nextval, 'psh40963@naver.com', 'ù��° seq �׽�Ʈ ���������Դϴ�.', sysdate);

insert into notice (notice_no, user_id, notice_cont, notice_date)
values(notice_no_seq.nextval, 'expedition1205@gmail.com', '�ι�° seq �׽�Ʈ ���������Դϴ�.', sysdate);

insert into notice_comment(notice_com_no, notice_no, user_id, notice_com_cont, notice_com_date)
values(notice_com_no_seq.nextval, '1','expedition1205@gmail.com', 'ù��° seq�׽�Ʈ ��������Դϴ�.', sysdate);

insert into notice_comment(notice_com_no, notice_no, user_id, notice_com_cont, notice_com_date)
values(notice_com_no_seq.nextval, '2','psh40963@naver.com', '�ι�° seq�׽�Ʈ ��������Դϴ�.', sysdate);

insert into class_msg(cmsg_no, class_id, msg_sender, msg_cont, msg_senddate)
values(cmsg_no_seq.nextval, 'C202011302', 'psh40963@naver.com', '�޽�������(Ŭ������ü�޽����׽�Ʈ)�Դϴ�.',sysdate);


COMMIT;

DROP TABLE TERMS;
DROP TABLE TERMS_HIS;

ROLLBACK;



--////////////////////////////////////////////////////////////
-- playddit sql ���� 

-- �÷��� ���� --
alter table class_msg rename column c_msg_no to cmsg_no;

--sequence ����
create sequence alarm_no_seq
start with 1
increment by 1;

-- drop sequence 
drop sequence c_msg_no_seq;

--alarm table �� sequence �Է�
insert into alarm(alarm_no,user_id,alarm_cont,alarm_type,alarm_date,alarm_chk,alarm_chk_date) 
values(alarm_no_seq.nextval, 'expedition1205@gmail.com', 'summer �� ������ ����߽��ϴ�.', '1',sysdate,'1',sysdate);



--AS MEMBERS �� �޽��� ���� ���� �������� 
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


      
    
-- ALARM ����

-- ȸ������


-- FOLLOW INSERT 
insert into follow (follow_no, follower, followee)
values(follow_no_seq.nextval, 'a001','a002');

-- FOLLOW DELETE
delete from follow
where follower = 'a001' and followee = 'a002';





----/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--�ǵ�(feed)


select * from users;

--�� �ǵ� �� ����
insert into feed (feed_no, user_id, feed_cont,feed_date,feed_pic)
        values(feed_no_seq.nextval, 
                'expedition1205@gmail.com',
                '�Է� �׽�Ʈ�� �ǵ��Դϴ�.',sysdate, null);

-- �ǵ� ���� 
update feed set 
          feed_cont = '�ǵ带 �����մϴ�.',
          feed_date = sysdate,
          feed_pic = null
          where feed_no = '32';
-- �ǵ� ����
delete from feed
where user_id = 'expedition1205@gmail.com'
and feed_no = '31';

-- �ǵ� ���ƿ�
insert into likes(like_no, user_id, feed_no)
values(like_no_seq.nextval, 'expedition1205@gmail.com', '1');

-- �ǵ� ���ƿ� ���
delete from likes
where feed_no = '1'
and user_id = 'expedition1205@gmail.com';


-- �ǵ� ��� ���
insert into feed_comment(feed_com_no,feed_no, user_id, feed_com_cont, feed_com_date)
values (feed_com_no_seq.nextval,'32', 'chdnjs7610@gmail.com','�ǵ���3test�Դϴ�.', sysdate); 

-- �ǵ� ��� ����
delete from feed_comment
where feed_com_no = '23'
and feed_no = '32'
and user_id = 'chdnjs7610@gmail.com';

-- �ǵ� �Ű�
insert into blame(blame_no, user_id, target_id, feed_no, target_type, blame_date)
values(blame_no_seq.nextval, 'bomik0614@gmail.com',(select user_id from feed where feed_no = '32'),'32',null,sysdate);


-- target_id
-- �ǵ� �ѹ��� �����༭ �Ű� �ϸ� �ǵ� �ѹ��� ����  �ǵ带 �ۼ��� �����target_id / 
select user_id from feed where feed_no = '32' ;

-- �� �ǵ� �� �ҷ�����
select feed_cont as content
from feed
where user_id = 'expedition1205@gmail.com'
order by feed_no desc;

-- ���� �ȷ��� �ϴ� ȸ�� �ǵ� �� �ð� ������ �ҷ�����
-- 1. �ȷ��� �ϴ� ȸ���� ���̵� �������
select user_id 
    from users 
    where user_id in (select followee
                        from follow
                        where follower = 'psh40963@naver.com');
                        
                        
-- 2. ����� �ǵ�� 
select feed_cont as feedcontent, user_id, feed_date
    from feed
    where user_id in (select user_id
                         from users
                         where user_id in (select followee
                                               from follow
                                                 where follower = 'psh40963@naver.com')) -- ���� �ȷ��� �ϴ� ȸ���� 
    or user_id = 'psh40963@naver.com'   -- �� 
    
    order by feed_date;
    
     
     
        


select a.feed_cont as content
from feed a
where a.user_id =(select b.user_id 
                from users b
                where user_id in (select followee
                                 from follow
                                 where follower ='bomik0614@gmail.com')
   
   order by feed_date desc;                         
                                 




               













/* ȸ����� */
CREATE TABLE TERMS (
	TERMS_NO NUMBER NOT NULL, /* �����ȣ */
	TERMS_TITLE VARCHAR2(100) DEFAULT 'DEFAULT', /* ����̸� */
	TERMS_CONT CLOB DEFAULT 'DEFAULT', /* ������� */
	TERMS_ESSEN NUMBER DEFAULT 0, /* �ʼ����� */
	TERMS_SEQ NUMBER DEFAULT 0, /* ������� */
	TERMS_USE NUMBER  DEFAULT 0
    
   
);

COMMENT ON TABLE TERMS IS 'ȸ�����';

COMMENT ON COLUMN TERMS.TERMS_NO IS '�����ȣ';

COMMENT ON COLUMN TERMS.TERMS_TITLE IS '����̸�';

COMMENT ON COLUMN TERMS.TERMS_CONT IS '�������';

COMMENT ON COLUMN TERMS.TERMS_ESSEN IS '�ʼ�����';

COMMENT ON COLUMN TERMS.TERMS_SEQ IS '�������';

COMMENT ON COLUMN TERMS.TERMS_USE IS '�����뿩��';

/* ��������̷� */
CREATE TABLE TERMS_HIS (
	TERMS_NO NUMBER NOT NULL, /* �����ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	TERMS_AGREE NUMBER NOT NULL 
    
    /* ���ǿ��� */
);

COMMENT ON TABLE TERMS_HIS IS '��������̷�';

COMMENT ON COLUMN TERMS_HIS.TERMS_NO IS '�����ȣ';

COMMENT ON COLUMN TERMS_HIS.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN TERMS_HIS.TERMS_AGREE IS '���ǿ���';

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



/* �̸������� */
CREATE TABLE EMAIL_CHECK (
	EMAIL_CHK_NO NUMBER NOT NULL, /* �̸���������ȣ */
	EMAIL_CHK_DATE DATE NOT NULL, /* ������ȣ�߼۽ð� */
	EMAIL_CHK_CONT VARCHAR2(200) NOT NULL, /* ������ȣ���� */
	EMAIL_CHK_ADDR VARCHAR2(200) NOT NULL /* �̸����ּ� */
);

COMMENT ON TABLE EMAIL_CHECK IS '�̸�������';

COMMENT ON COLUMN EMAIL_CHECK.EMAIL_CHK_NO IS '�̸���������ȣ';

COMMENT ON COLUMN EMAIL_CHECK.EMAIL_CHK_DATE IS '������ȣ�߼۽ð�';

COMMENT ON COLUMN EMAIL_CHECK.EMAIL_CHK_CONT IS '������ȣ����';

COMMENT ON COLUMN EMAIL_CHECK.EMAIL_CHK_ADDR IS '�̸����ּ�';

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

/* �ȷο� */
CREATE TABLE FOLLOW (
	FOLLOW_NO NUMBER NOT NULL, /* �ȷο��ȣ */
	FOLLOWER VARCHAR2(200) NOT NULL, /* �ȷο� */
	FOLLOWEE VARCHAR2(200) NOT NULL /* �ȷ��� */
);

COMMENT ON TABLE FOLLOW IS '�ȷο�';

COMMENT ON COLUMN FOLLOW.FOLLOW_NO IS '�ȷο��ȣ';

COMMENT ON COLUMN FOLLOW.FOLLOWER IS '�ȷο�';

COMMENT ON COLUMN FOLLOW.FOLLOWEE IS '�ȷ���';

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

/* �б� */
CREATE TABLE CLASS (
	CLASS_ID VARCHAR2(200) NOT NULL, /* �б޹�ȣ */
	CLASS_START DATE NOT NULL, /* �б޽����� */
	CLASS_END DATE NOT NULL, /* �б������� */
	CLASS_TITLE VARCHAR2(200) NOT NULL, /* �бް��¸� */
	CLASS_NUM VARCHAR2(100) NOT NULL, /* �бޱ�� */
	CLASS_ROOM VARCHAR2(100) NOT NULL /* �бް��ǽ� */
);

COMMENT ON TABLE CLASS IS '�б�';

COMMENT ON COLUMN CLASS.CLASS_ID IS '�б޹�ȣ';

COMMENT ON COLUMN CLASS.CLASS_START IS '�б޽�����';

COMMENT ON COLUMN CLASS.CLASS_END IS '�б�������';

COMMENT ON COLUMN CLASS.CLASS_TITLE IS '�бް��¸�';

COMMENT ON COLUMN CLASS.CLASS_NUM IS '�бޱ��';

COMMENT ON COLUMN CLASS.CLASS_ROOM IS '�бް��ǽ�';

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

/* ȸ�� */
CREATE TABLE USERS (
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	CLASS_ID VARCHAR2(200) DEFAULT 'DEFAULT' NOT NULL, /* �б޹�ȣ */
	USER_NICKNAME VARCHAR2(100) NOT NULL, /* �г��� */
	USER_PASSWORD VARCHAR2(100) NOT NULL, /* ��й�ȣ */
	USER_NAME VARCHAR2(100), /* �̸� */
	USER_TEL VARCHAR2(100), /* ��ȭ��ȣ */
	USER_BIRTH DATE, /* ���� */
	USER_RATING NUMBER  DEFAULT 0, /* ��� */
	USER_THEME NUMBER  DEFAULT 0, /* �׸� */
	USER_SIGN_DATE DATE NOT NULL, /* �������� */
	USER_PIC BLOB /* ȸ������ */
);

COMMENT ON TABLE USERS IS 'ȸ��';

COMMENT ON COLUMN USERS.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN USERS.CLASS_ID IS '�б޹�ȣ';

COMMENT ON COLUMN USERS.USER_NICKNAME IS '�г���';

COMMENT ON COLUMN USERS.USER_PASSWORD IS '��й�ȣ';

COMMENT ON COLUMN USERS.USER_NAME IS '�̸�';

COMMENT ON COLUMN USERS.USER_TEL IS '��ȭ��ȣ';

COMMENT ON COLUMN USERS.USER_BIRTH IS '����';

COMMENT ON COLUMN USERS.USER_RATING IS '���';

COMMENT ON COLUMN USERS.USER_THEME IS '�׸�';

COMMENT ON COLUMN USERS.USER_SIGN_DATE IS '��������';

COMMENT ON COLUMN USERS.USER_PIC IS 'ȸ������';

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

/* �˸� */
CREATE TABLE ALARM (
	ALARM_NO NUMBER NOT NULL, /* �˸���ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	ALARM_CONT VARCHAR2(200) NOT NULL, /* �˸����� */
	ALARM_TYPE NUMBER NOT NULL, /* �˸����� */
	ALARM_DATE DATE NOT NULL, /* �˸��ð� */
	ALARM_CHK NUMBER, /* �˸�Ȯ�ο��� */
	ALARM_CHK_DATE DATE /* �˸�Ȯ�νð� */
);

COMMENT ON TABLE ALARM IS '�˸�';

COMMENT ON COLUMN ALARM.ALARM_NO IS '�˸���ȣ';

COMMENT ON COLUMN ALARM.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN ALARM.ALARM_CONT IS '�˸�����';

COMMENT ON COLUMN ALARM.ALARM_TYPE IS '�˸�����';

COMMENT ON COLUMN ALARM.ALARM_DATE IS '�˸��ð�';

COMMENT ON COLUMN ALARM.ALARM_CHK IS '�˸�Ȯ�ο���';

COMMENT ON COLUMN ALARM.ALARM_CHK_DATE IS '�˸�Ȯ�νð�';

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
 /* �ǵ� */
CREATE TABLE FEED (
	FEED_NO NUMBER NOT NULL, /* �ǵ��ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	FEED_CONT VARCHAR2(2000) NOT NULL, /* �ǵ峻�� */
	FEED_PIC BLOB, /* �ǵ���� */
	FEED_DATE DATE NOT NULL /* �ǵ��ۼ��� */
);

COMMENT ON TABLE FEED IS '�ǵ�';

COMMENT ON COLUMN FEED.FEED_NO IS '�ǵ��ȣ';

COMMENT ON COLUMN FEED.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN FEED.FEED_CONT IS '�ǵ峻��';

COMMENT ON COLUMN FEED.FEED_PIC IS '�ǵ����';

COMMENT ON COLUMN FEED.FEED_DATE IS '�ǵ��ۼ���';

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

/* �Ű��ǵ� */
CREATE TABLE BLAME (
	BLAME_NO NUMBER NOT NULL, /* �Ű��ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �Ű��� ȸ�� */
	TARGET_ID VARCHAR2(200) NOT NULL, /* �Ű����ȸ�� */
	FEED_NO NUMBER NOT NULL, /* �ǵ��ȣ */
	TARGET_TYPE NUMBER, /* �Ű����� */
	BLAME_DATE DATE NOT NULL /* �Ű��Ͻ� */
);

COMMENT ON TABLE BLAME IS '�Ű��ǵ�';

COMMENT ON COLUMN BLAME.BLAME_NO IS '�Ű��ȣ';

COMMENT ON COLUMN BLAME.USER_ID IS '�Ű��� ȸ��';

COMMENT ON COLUMN BLAME.TARGET_ID IS '�Ű����ȸ��';

COMMENT ON COLUMN BLAME.FEED_NO IS '�ǵ��ȣ';

COMMENT ON COLUMN BLAME.TARGET_TYPE IS '�Ű�����';

COMMENT ON COLUMN BLAME.BLAME_DATE IS '�Ű��Ͻ�';

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

/* �ǵ� ��� */
CREATE TABLE FEED_COMMENT (
	FEED_COM_NO NUMBER NOT NULL, /* �ǵ��۹�ȣ */
	FEED_NO NUMBER NOT NULL, /* �ǵ��ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	FEED_COM_CONT VARCHAR2(1000) NOT NULL, /* �ǵ��۳��� */
	FEED_COM_DATE DATE NOT NULL /* �ǵ��۽ð� */
);

COMMENT ON TABLE FEED_COMMENT IS '�ǵ� ���';

COMMENT ON COLUMN FEED_COMMENT.FEED_COM_NO IS '�ǵ��۹�ȣ';

COMMENT ON COLUMN FEED_COMMENT.FEED_NO IS '�ǵ��ȣ';

COMMENT ON COLUMN FEED_COMMENT.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN FEED_COMMENT.FEED_COM_CONT IS '�ǵ��۳���';

COMMENT ON COLUMN FEED_COMMENT.FEED_COM_DATE IS '�ǵ��۽ð�';

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
       
       
/* ȸ����� */
CREATE TABLE TERMS (
	TERMS_NO NUMBER NOT NULL, /* �����ȣ */
	TERMS_TITLE VARCHAR2(100) DEFAULT 'DEFAULT', /* ����̸� */
	TERMS_CONT VARCHAR2(2000) DEFAULT 'DEFAULT', /* ������� */
	TERMS_ESSEN NUMBER DEFAULT 0, /* �ʼ����� */
	TERMS_SEQ NUMBER DEFAULT 0, /* ������� */
	TERMS_USE NUMBER DEFAULT 0 /* �����뿩�� */
);



COMMENT ON TABLE TERMS IS 'ȸ�����';

COMMENT ON COLUMN TERMS.TERMS_NO IS '�����ȣ';

COMMENT ON COLUMN TERMS.TERMS_TITLE IS '����̸�';

COMMENT ON COLUMN TERMS.TERMS_CONT IS '�������';

COMMENT ON COLUMN TERMS.TERMS_ESSEN IS '�ʼ�����';

COMMENT ON COLUMN TERMS.TERMS_SEQ IS '�������';

COMMENT ON COLUMN TERMS.TERMS_USE IS '�����뿩��';

/* ��������̷� */
CREATE TABLE TERMS_HIS (
	TERMS_NO NUMBER NOT NULL, /* �����ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	TERMS_AGREE NUMBER NOT NULL /* ���ǿ��� */
);

COMMENT ON TABLE TERMS_HIS IS '��������̷�';

COMMENT ON COLUMN TERMS_HIS.TERMS_NO IS '�����ȣ';

COMMENT ON COLUMN TERMS_HIS.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN TERMS_HIS.TERMS_AGREE IS '���ǿ���';

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
--(select count(*) from follow where follower='psh40963@naver.com��) as following,
--(select count(*) from follow where followee='psh40963@naver.com��) as follower,
--(select class_title ||' ��|| class_num || ' - ' || class_room
--from class
--where class_id = (select class_id from users where user_id= 'psh40963@naver.com��)) as className,
--(select count(*)
--from feed
--where feed.user_id = users.user_id) as allFeed,
--user_bio
--from users
--where user_id = 'psh40963@naver.com��;


--  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- 2021.02.25 --

/* ���ƿ� */
CREATE TABLE LIKES (
	LIKE_NO NUMBER NOT NULL, /* ���ƿ��ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	FEED_NO NUMBER NOT NULL /* �ǵ��ȣ */
);

COMMENT ON TABLE LIKES IS '���ƿ�';

COMMENT ON COLUMN LIKES.LIKE_NO IS '���ƿ��ȣ';

COMMENT ON COLUMN LIKES.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN LIKES.FEED_NO IS '�ǵ��ȣ';

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
        
        
        
        
        /* �޽��� */
CREATE TABLE MESSAGE (
	MSG_NO NUMBER NOT NULL, /* �޽�����ȣ */
	MSG_TARGET_ID VARCHAR2(200) NOT NULL, /* ������ */
	MSG_SENDER VARCHAR2(200) NOT NULL, /* �߽��� */
	MSG_CONTENT VARCHAR2(2000) NOT NULL, /* �޽������� */
	MSG_SENDDATE DATE NOT NULL, /* �߼����� */
	MSG_OPENDATE DATE /* �������� */
);

COMMENT ON TABLE MESSAGE IS '�޽���';

COMMENT ON COLUMN MESSAGE.MSG_NO IS '�޽�����ȣ';

COMMENT ON COLUMN MESSAGE.MSG_TARGET_ID IS '������';

COMMENT ON COLUMN MESSAGE.MSG_SENDER IS '�߽���';

COMMENT ON COLUMN MESSAGE.MSG_CONTENT IS '�޽�������';

COMMENT ON COLUMN MESSAGE.MSG_SENDDATE IS '�߼�����';

COMMENT ON COLUMN MESSAGE.MSG_OPENDATE IS '��������';

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
/* �������� */
CREATE TABLE NOTICE (
	NOTICE_NO NUMBER NOT NULL, /* �������׹�ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	NOTICE_CONT VARCHAR2(2000) NOT NULL, /* �������׳��� */
	NOTICE_PIC BLOB, /* �������׻��� */
	NOTICE_DATE DATE NOT NULL /* ���������ۼ��� */
);

COMMENT ON TABLE NOTICE IS '��������';

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '�������׹�ȣ';

COMMENT ON COLUMN NOTICE.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN NOTICE.NOTICE_CONT IS '�������׳���';

COMMENT ON COLUMN NOTICE.NOTICE_PIC IS '�������׻���';

COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '���������ۼ���';

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

/* �������״�� */
CREATE TABLE NOTICE_COMMENT (
	NOTICE_COM_NO NUMBER NOT NULL, /* �������״�۹�ȣ */
	NOTICE_NO NUMBER NOT NULL, /* �������׹�ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	NOTICE_COM_CONT VARCHAR2(1000) NOT NULL, /* �������״�۳��� */
	NOTICE_COM_DATE DATE NOT NULL /* �������״�۽ð� */
);

COMMENT ON TABLE NOTICE_COMMENT IS '�������״��';

COMMENT ON COLUMN NOTICE_COMMENT.NOTICE_COM_NO IS '�������״�۹�ȣ';

COMMENT ON COLUMN NOTICE_COMMENT.NOTICE_NO IS '�������׹�ȣ';

COMMENT ON COLUMN NOTICE_COMMENT.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN NOTICE_COMMENT.NOTICE_COM_CONT IS '�������״�۳���';

COMMENT ON COLUMN NOTICE_COMMENT.NOTICE_COM_DATE IS '�������״�۽ð�';

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




/* ��������̷� */
CREATE TABLE TERMS_HIS (
	TERMS_NO NUMBER NOT NULL, /* �����ȣ */
	USER_ID VARCHAR2(200) NOT NULL, /* �̸��Ͼ��̵� */
	TERMS_AGREE NUMBER NOT NULL /* ���ǿ��� */
);

COMMENT ON TABLE TERMS_HIS IS '��������̷�';

COMMENT ON COLUMN TERMS_HIS.TERMS_NO IS '�����ȣ';

COMMENT ON COLUMN TERMS_HIS.USER_ID IS '�̸��Ͼ��̵�';

COMMENT ON COLUMN TERMS_HIS.TERMS_AGREE IS '���ǿ���';

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
        
        
   
   
   /* Ŭ�����޽��� */
CREATE TABLE CLASS_MSG (
	C_MSG_NO NUMBER NOT NULL, /* �޽�����ȣ */
	CLASS_ID VARCHAR2(200) NOT NULL, /* �б޹�ȣ */
	MSG_SENDER VARCHAR2(200) NOT NULL, /* �߽��� */
	MSG_CONT VARCHAR2(2000) NOT NULL, /* �޽������� */
	MSG_SENDDATE DATE NOT NULL /* �߼����� */
);

COMMENT ON TABLE CLASS_MSG IS 'Ŭ�����޽���';

COMMENT ON COLUMN CLASS_MSG.C_MSG_NO IS '�޽�����ȣ';

COMMENT ON COLUMN CLASS_MSG.CLASS_ID IS '�б޹�ȣ';

COMMENT ON COLUMN CLASS_MSG.MSG_SENDER IS '�߽���';

COMMENT ON COLUMN CLASS_MSG.MSG_CONT IS '�޽�������';

COMMENT ON COLUMN CLASS_MSG.MSG_SENDDATE IS '�߼�����';

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
        
        
        
        
        
 