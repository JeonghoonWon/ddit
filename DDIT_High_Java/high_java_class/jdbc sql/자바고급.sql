create table bankinfo(
    bank_no varchar2(40) not null,          -- ���¹�ȣ
    bank_name varchar2(40) not null,        -- �����
    bank_user_name varchar2(30) not null,   -- ������
    bank_date date not null,                -- ���� ��¥
    constraint pk_bankinfo primary key (bank_no)
);


insert into bankinfo (bank_no, bank_name, bank_user_name, bank_date)
    values('123-456-5555','�ϳ�����','�ں���',sysdate);
    
    
    select * from bankinfo;
    -- "select * from member where mem_id = '" + name +"'"
    -- name => a001
    -- ��Ŀ �������� ��� ����������� ��� ����ϰ�,
    -- �Է� �����Ͱ� �����ڸ� ��� �Ἥ ���������� ����.
    --  a001' or '1'='1 
    
    select * from member where mem_id = 'a001';
    select * from member where mem_id = 'a001' or '1'='1';
     -- ��� �����Ͱ� �� ���´�.
    
      -- "select * from member where mem_id = ? "
      -- name => a001
      --  a001' or '1'='1 
      select * from member where mem_id = 'a001';
      select * from member where mem_id = 'a001'' or ''1''=''1' ;
      -- ��������ǥ�� ���ڿ��� �Էµ� 
      
      
--       lprod_gu�� lprod_nm�� ���� �Է¹޾Ƽ� ó���ϰ�,
-- 		 lprod_id�� ������ lprod_id�� ���� ū ������ 1 ������ ������ �Ѵ�.
-- 		 �׸���, �Է¹��� lprod_gu �� �̹� ��ϵǾ� ������ �ٽ� �Է¹޾Ƽ� ó���Ѵ�.
--      

    -- �ִ밪      
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

				
 