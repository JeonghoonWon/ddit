select * from mymember;

 -- VO객체의 멤버변수를 자동으로 만들기
 select 'private' ||
    -- NUMBER일 때는 int, 그 외는 모두 String으로 한다.
    decode(lower(data_type), 'number', 'int ', 'String ') ||
    lower(column_name) || ';'
from cols
where lower(table_name) = 'JDBC_BOARD';



select max(board_cnt)+1 from JDBC_BOARD where board_no = 8;

update JDBC_BOARD set board_cnt = (select max(board_cnt)+1 from JDBC_BOARD where board_no = 8) where board_no = 8 ;
   
SELECT
    board_no,
    board_title,
    board_writer,
    TO_CHAR(board_date,'YYYY-MM-DD') board_date,
    board_cnt,
    board_content
FROM
    jdbc_board
WHERE board_no =#boardno#  
   
   
    -- 자료형 변수명이 오기 때문에 한칸 띄어주는게 좋다.
    
    
    create sequence board_seq
    start with 1   -- 시작번호
    increment by 1; -- 증가값
insert into JDBC_BOARD 
            values (board_seq.nextVal,'타이틀', '박보검', sysdate, 0, '글내용');

update JDBC_BOARD set board_title = ?, board_content = ?, board_date = sysdate where board_no = ? ;


insert 

-----------------------------------------------------------------------------------------------
--[21/01/29]--

select count(*) cnt from lprod where lprod_gu = 'P911';

select mem_id, mem_name, mem_hp, mem_mail from member;


select * from buyer where buyer_id='P10101';    -- result : QueryForObject 사용 

select * from prod;

select * from prod where prod_lgu = 'P101';

select prod_id, prod_name from prod where prod_lgu = 'P101';

select * from prod where prod_id ='P102000001';


 select 'private ' || 
    -- NUMBER일 때는 int, 그 외는 모두 String으로 한다.
    decode(lower(data_type), 'number', 'int ', 'String ') ||
    lower(column_name) || ';'
from cols
where lower(table_name) = 'prod'; 


commit;
---------------------------------------------------------------------------------------------------------------------------------
-- [21/02/28] --
select * from member;

select mem_id from member where mem_id ='korea';

insert into member 
       (mem_id, mem_pass, mem_name, mem_bir,
        mem_zip, mem_add1, mem_add2, mem_hp, mem_mail)
       values ('z001','12345678','진달래','1900.01.01','34123',
                 '대전 중구 대흥동','500 대덕인재개발원','010-1234-1234',
                 'k123@korea.com'); 
                 
                 insert into member 
       (mem_id, mem_pass, mem_name, mem_bir,
        mem_zip, mem_add1, mem_add2, mem_hp, mem_mail)
       values (#mem_id#, #mem_pass#, #mem_name#, #mem_bir#, #mem_zip#,
                  #mem_add1#, #mem_add2#, #mem_hp#, #mem_mail#); 

create table ziptb (
 zipcode varchar2(7) not null,     --우편번호  7  
 sido  varchar2(6) not null,  --  특별시,광역시,도  4
 gugun  varchar2(30),           -- 시,군,구  17  
 dong   varchar2(40),            --읍,면,동  26  
 ri     varchar2(30),       --  리명  18
 bldg  varchar2(60),        -- 건물명  40 
 bunji varchar2(30),        -- 번지,아파트동,호수  17 
 seq  number(5) not null,        -- 데이터 순서  5
constraint pk_ziptb primary key (seq) 
);

commit;

select count(*) from ziptb;

select * from ziptb where dong like '%대흥%';

select mem_id from member where mem_id = 'a001';


