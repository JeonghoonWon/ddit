create table bankinfo(
    bank_no varchar2(40) not null,          -- 계좌번호
    bank_name varchar2(40) not null,        -- 은행명
    bank_user_name varchar2(30) not null,   -- 예금주
    bank_date date not null,                -- 개설 날짜
    constraint pk_bankinfo primary key (bank_no)
);


insert into bankinfo (bank_no, bank_name, bank_user_name, bank_date)
    values('123-456-5555','하나은행','박보검',sysdate);
    
    
    select * from bankinfo;
    -- "select * from member where mem_id = '" + name +"'"
    -- name => a001
    -- 해커 쿼리문을 어떻게 만들었을꺼다 라고 상상하고,
    -- 입력 데이터가 연산자를 어떻게 써서 구생했을지 생각.
    --  a001' or '1'='1 
    
    select * from member where mem_id = 'a001';
    select * from member where mem_id = 'a001' or '1'='1';
     -- 모든 데이터가 다 나온다.
    
      -- "select * from member where mem_id = ? "
      -- name => a001
      --  a001' or '1'='1 
      select * from member where mem_id = 'a001';
      select * from member where mem_id = 'a001'' or ''1''=''1' ;
      -- 작은따음표가 문자열로 입력됨 
      
      
--       lprod_gu와 lprod_nm은 직접 입력받아서 처리하고,
-- 		 lprod_id는 현재의 lprod_id중 제일 큰 값보다 1 증가된 값으로 한다.
-- 		 그리고, 입력받은 lprod_gu 가 이미 등록되어 있으면 다시 입력받아서 처리한다.
--      

    -- 최대값      
  select max(lprod_id)+1 maxid from lprod;
   
  select count(*) cnt from lprod where lprod_gu='P901';
  
  select * from lprod;
      
      select count(lprod_id) from lprod;
      
      insert into lprod (LPROD_ID, LPROD_GU, LPROD_NM)
        values(?, ?, ?);
      
      select lprod_gu from lprod;
      
----------------------------------------------------------------------------
 create table mymember(
    mem_id varchar2(15) not null,
    mem_name varchar2(30) not null,
    mem_tel varchar2(14) not null,
    mem_addr varchar2(90) not null,
    constraint pk_mymember primary key (mem_id)
 );
 
 insert into mymember (mem_id, mem_name, mem_tel, mem_addr)
    values(?,?,?,?);
    
    
update mymember set mem_name =?, mem_tel=?, mem_addr=? where mem_id = ? ;

delete from mymember where mem_id = '123';

select * from mymember;

				
 