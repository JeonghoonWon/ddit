-- oracle �� ������ �ִ� RDBMS
select property_name, property_value, description
from database_properties
where instr(property_name, 'DICT') > 0;

select mem_id, mem_pass, mem_name
from member
where mem_id = 'a001' and mem_pass = 'asdfasdf';


--private String mem_id;
select 'private'||column_name
from cols
where table_name = 'MEMBER';

select 'private'||
    DECODE(DATA_TYPE,'NUMBER','Integer','String')||
    LOWER(COLUMN_NAME)||';'
from cols
where table_name = 'MEMBER';


SELECT
    mem_id,
    mem_pass,
    mem_name,
    mem_regno1,
    mem_regno2,
    mem_bir,
    mem_zip,
    mem_add1,
    mem_add2,
    mem_hometel,
    mem_comtel,
    mem_hp,
    mem_mail,
    mem_job,
    mem_like,
    mem_memorial,
    mem_memorialday,
    mem_mileage,
    mem_delete
FROM
    member;
    
    
--member.setMem_id(rs.getString("MEM_ID"));

--  <tr>
--		<td>���̵�</td>
--		<td><%=member.getMem_id() %></td>
--	</tr>

--COMMENT ON COLUMN MEMBER.MEM_ID IS

SELECT '<tr><th>'||COMMENTS||
    '</th><td><%='||
    LOWER(TABLE_NAME)||
    '.get'||SUBSTR(COLUMN_NAME,1,1)||
    LOWER(SUBSTR(COLUMN_NAME, 2))||'()%></td></tr>'
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MEMBER';


SELECT '<tr><th>'||COMMENTS||'</th><td><input type ="text" '||
        'name ="'||LOWER(COLUMN_NAME)||'"/>'||
        '<span class = "error"><%=errors.get("'||LOWER(COLUMN_NAME)||'") %></span>'||
		'</td></tr>'
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MEMBER';


SELECT 'COMMENT ON COLUMN'||TABLE_NAME || '.'||COLUMN_NAME || ' IS '''';'
FROM COLS
WHERE TABLE_NAME = 'MEMBER';

COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEM_PASS IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.MEM_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN MEMBER.MEM_REGNO1 IS '�ֹι�ȣ1';
COMMENT ON COLUMN MEMBER.MEM_REGNO2 IS '�ֹι�ȣ2';
COMMENT ON COLUMN MEMBER.MEM_BIR IS '����';
COMMENT ON COLUMN MEMBER.MEM_ZIP IS '�����ȣ';
COMMENT ON COLUMN MEMBER.MEM_ADD1 IS 'ȸ�����ּ�1';
COMMENT ON COLUMN MEMBER.MEM_ADD2 IS 'ȸ�����ּ�2';
COMMENT ON COLUMN MEMBER.MEM_HOMETEL IS 'ȸ������ȣ';
COMMENT ON COLUMN MEMBER.MEM_COMTEL IS 'ȸ��ȸ���ȣ';
COMMENT ON COLUMN MEMBER.MEM_HP IS 'ȸ����ȭ��ȣ';
COMMENT ON COLUMN MEMBER.MEM_MAIL IS 'ȸ������';
COMMENT ON COLUMN MEMBER.MEM_JOB IS 'ȸ������';
COMMENT ON COLUMN MEMBER.MEM_LIKE IS 'ȸ�����';
COMMENT ON COLUMN MEMBER.MEM_MEMORIAL IS 'ȸ��';
COMMENT ON COLUMN MEMBER.MEM_MEMORIALDAY IS 'ȸ�������';
COMMENT ON COLUMN MEMBER.MEM_MILEAGE IS 'ȸ�����ϸ���';
COMMENT ON COLUMN MEMBER.MEM_DELETE IS 'ȸ������';
COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�����̵�';

SELECT *
FROM USER_COL_COMMENTS
WHERE MEMBER;

INSERT INTO MEMBER(MEM_ID, MEM_PASS, MEM_NAME, MEM_REGNO1, MEM_REGNO2, MEM_BIR, MEM_ZIP, 
                    MEM_ADD1, MEM_ADD2, MEM_HOMETEL, MEM_COMTEL, MEM_HP, MEM_MAIL, MEM_JOB, 
                    MEM_LIKE, MEM_MEMORIAL, MEM_MEMORIALDAY, MEM_MILEAGE, MEM_DELETE)
             values('k','k','k','k','k','1988.12.05','k','k','k','k','k','k','k','k','k','k','1988.12.05',10,'k');

INSERT INTO member (
    mem_id,    mem_pass,    mem_name,
    mem_regno1,    mem_regno2,    mem_bir,
    mem_zip,    mem_add1,    mem_add2,
    mem_hometel,    mem_comtel,    mem_hp,
    mem_mail,    mem_job,    mem_like,
    mem_memorial,    mem_memorialday,    mem_mileage,
    mem_delete) VALUES ();
    
 --pstmt.setString(1,member.getMem_id());  
 -- function �� procedure �� ����
 -- function �� return ���� ����
 CREATE OR REPLACE FUNCTION GETTER(COLNAME VARCHAR2)
 RETURN VARCHAR2
 IS
 BEGIN
   RETURN 'get'||UPPER(SUBSTR(COLNAME,1,1))||
    SUBSTR(LOWER(COLNAME),2)||'()';
 END;
 
 
 SELECT 'pstmt.set'||
    DECODE(DATA_TYPE, 'NUMBER','Int','String')||
    '(i++,'||LOWER(TABLE_NAME)||'.'||
    GETTER(COLUMN_NAME)||');'
 FROM COLS
 WHERE TABLE_NAME = 'MEMBER'
 ORDER BY COLUMN_ID;
 
 
 desc cols;
 desc user_col_comments;
 
-- if(member.getMem_id()==null || member.getMem_id().isEmpty()) {
--			valid = false;
--			errors.put("mem_id", "���̵� ����");
--		}
 SELECT 'if('||LOWER(A.TABLE_NAME)||'.'||
 GETTER(A.COLUMN_NAME)||'== null||'||
 LOWER(A.TABLE_NAME)||'.'||GETTER(A.COLUMN_NAME)||'.isEmpty()){valid = false; errors.put("'||
 LOWER(A.COLUMN_NAME)||'","'||COMMENTS||' ����"); }'
 FROM COLS A LEFT OUTER JOIN USER_COL_COMMENTS B
    ON (A.TABLE_NAME = B.TABLE_NAME AND A.COLUMN_NAME = B.COLUMN_NAME)
 WHERE A.TABLE_NAME = 'MEMBER' AND NULLABLE = 'N';
 
-- <tr>
--	<th>ȸ�����̵�</th>
--	<td>
--      <input type="text" name="mem_id" required/>
--      <span class="error"><%=errors.get("mem_id")%></span>
--  </td>
-- </tr>

SELECT '<tr><th>'||COMMENTS||'</th><td>'||
    '<input type="'||
    CASE 
    WHEN DATA_TYPE='NUMBER' OR DATA_TYPE='DATE' THEN LOWER(DATA_TYPE)
    ELSE 'text' 
    END ||
    '" name="'||LOWER(B.COLUMN_NAME)||'"'||
    DECODE(NULLABLE,'N',' required ', '')||
    'value="<%='||LOWER(B.TABLE_NAME)||'.'||
    GETTER(B.COLUMN_NAME)||'%>" /><span class="error"><%=errors.get("'||LOWER(B.COLUMN_NAME)||'")%></span></td></tr>'
FROM USER_COL_COMMENTS A RIGHT OUTER JOIN COLS B
    ON(A.TABLE_NAME = B.TABLE_NAME AND A.COLUMN_NAME = B.COLUMN_NAME)
WHERE B.TABLE_NAME = 'MEMBER';
ORDER BY
 
 
-- a001 ������� �⺻ ����(member)�� �׵��� ������ ��ǰ ���(cart)�� �Բ� ��ȸ . ��ǰ(prod) : �ڵ�, ��, ���Ű� ,�ǸŰ�, ���ϸ���

select a.mem_id, a.mem_name, b.cart_prod ,
       c.prod_lgu, c.prod_name, c.prod_cost, c.prod_price, a.mem_mileage
from member a, cart b, prod c 
    on(a.mem_id = b.cart_member and b.cart_prod = c.prod_id)
where a.mem_id = 'a001';
 
 
-- �������� ���� �Ǵ� �� ���� ����
select 
    member.*,
    prod_id, prod_name, prod_cost, prod_price, prod_mileage
from
    member left outer join cart on (mem_id = cart_member)
       left outer join prod on(cart_prod = prod_id)
where mem_id = 'a001';   

-- a001 ������� �⺻ ����(member)�� 
-- �׵��� ������ ��ǰ ���(cart)�� �Բ� ��ȸ
-- ��ǰ �з���, �ŷ�ó��(buyer , buyer_name)
-- ��ǰ(prod) : �ڵ�, ��, ���Ű� ,�ǸŰ�, ���ϸ���
select 
    member.*,
    prod_id, prod_name, prod_cost, prod_price, prod_mileage,
    buyer_name
from
    member left outer join cart on (mem_id = cart_member)
       left outer join prod on(cart_prod = prod_id)
       left outer join buyer on(prod_lgu = buyer_lgu)
where mem_id = 'a001';   


select 'private'||
    DECODE(DATA_TYPE,'NUMBER','Integer','String')||
    LOWER(COLUMN_NAME)||';'
from cols
where table_name = 'BUYER';


-- �Ѹ��� ���� ��ȸ��, 
-- ���� ��� ��ȸ(�ߺ�����)
-- ��ǰ������ ��ȸ�Ҷ� �з���, �ŷ�ó�� ��ȸ
    WITH  CARTPROD AS (
        SELECT DISTINCT CART_MEMBER, CART_PROD FROM CART
        ), PRODALL AS (
            SELECT PROD.*,LPROD_NM
            FROM PROD INNER JOIN LPROD ON(PROD_LGU = LPROD_GU)
                      INNER JOIN BUYER ON(PROD_BUYER = BUYER_ID)
        )
        
    SELECT MEMBER.*, PRODALL.*
    FROM MEMBER LEFT OUTER JOIN CARTPROD
    ON (MEM_ID = CART_MEMBER)
        LEFT OUTER JOIN PRODALL ON (CART_PROD = PROD_ID)
    WHERE MEM_ID = 'a001';



 SELECT      DISTINCT                                                   
		     MEM_ID,    MEM_PASS,    MEM_NAME,                          
		     MEM_REGNO1,    MEM_REGNO2,                                 
		     TO_CHAR(MEM_BIR, 'YYYY-MM-DD') MEM_BIR,                    
			 MEM_ZIP,    MEM_ADD1,    MEM_ADD2,                         
		     MEM_HOMETEL,    MEM_COMTEL,    MEM_HP,                     
		     MEM_MAIL,    MEM_JOB,    MEM_LIKE,                         
		     MEM_MEMORIAL,                                              
		     TO_CHAR(MEM_MEMORIALDAY, 'YYYY-MM-DD') MEM_MEMORIALDAY,    
		     MEM_MILEAGE, MEM_DELETE
		     , PROD_ID, PROD_NAME
		     , PROD_COST, PROD_PRICE, PROD_MILEAGE   
             , LPROD_NM
             , BUYER_NAME
		 FROM    MEMBER LEFT OUTER JOIN CART ON(MEM_ID = CART_MEMBER) 
		 				 LEFT OUTER JOIN PROD ON(CART_PROD = PROD_ID)                                                
                          LEFT OUTER JOIN LPROD ON (PROD_LGU = LPROD_GU)
                           LEFT OUTER JOIN BUYER ON (PROD_BUYER = BUYER_ID)
         WHERE MEM_ID ='a001';
   -- ��ǰ�ڵ�  
   -- �ŷ�ó ���� 
   -- �ŷ�ó��, ����ڸ�, ����ó, �ּ�1

   select  prod_id,
    prod_name,
    prod_lgu,
    prod_buyer,
    prod_cost,
    prod_price,
    prod_sale,
    prod_outline,
    prod_detail,
    prod_img,
    prod_totalstock,
    prod_insdate,
    prod_properstock,
    prod_size,
    prod_color,
    prod_delivery,
    prod_unit,
    prod_qtyin,
    prod_qtysale,
    prod_mileage
    
    select prod.*,lprod.*,buyer.*
    from prod inner join lprod on (prod_lgu = lprod_gu)
              inner join buyer on (prod_buyer = buyer_id)
   where prod_id = 'P302000016';
 
 
 COMMENT ON COLUMN PROD.PROD_ID IS '��ǰ�ڵ�';
COMMENT ON COLUMN PROD.PROD_NAME IS '��ǰ��';
COMMENT ON COLUMN PROD.PROD_LGU IS '��ǰ�з�';
COMMENT ON COLUMN PROD.PROD_BUYER IS '�ŷ�ó';
COMMENT ON COLUMN PROD.PROD_COST IS '���Ű�';
COMMENT ON COLUMN PROD.PROD_PRICE IS '�ǸŰ�';
COMMENT ON COLUMN PROD.PROD_SALE IS '���ΰ�';
COMMENT ON COLUMN PROD.PROD_OUTLINE IS '��ǰ������';
COMMENT ON COLUMN PROD.PROD_DETAIL IS '��ǰ�󼼼���';
COMMENT ON COLUMN PROD.PROD_IMG IS '����';
COMMENT ON COLUMN PROD.PROD_TOTALSTOCK IS '�����';
COMMENT ON COLUMN PROD.PROD_INSDATE IS '�԰�¥';
COMMENT ON COLUMN PROD.PROD_PROPERSTOCK IS '�԰������';
COMMENT ON COLUMN PROD.PROD_SIZE IS '��ǰũ��';
COMMENT ON COLUMN PROD.PROD_COLOR IS '��ǰ����';
COMMENT ON COLUMN PROD.PROD_DELIVERY IS '��۹��';
COMMENT ON COLUMN PROD.PROD_UNIT IS '����';
COMMENT ON COLUMN PROD.PROD_QTYIN IS '�԰����';
COMMENT ON COLUMN PROD.PROD_QTYSALE IS '���μ���';
COMMENT ON COLUMN PROD.PROD_MILEAGE IS '���ϸ���';


--<tr>
--    <th>��ǰ�ڵ�</th>
--    <td><%=prod.getProd_id() %></td>
--</tr>
SELECT '<tr><th>'||COMMENTS||'</th><td>'||
        '<%='|| LOWER(B.TABLE_NAME)||'.'||
        GETTER(B.COLUMN_NAME)||' %></td></tr>'
FROM USER_COL_COMMENTS A RIGHT OUTER JOIN COLS B
    ON(A.TABLE_NAME = B.TABLE_NAME AND A.COLUMN_NAME = B.COLUMN_NAME)
WHERE B.TABLE_NAME = 'PROD';


--04/06
desc database_properties;

SELECT PROPERTY_NAME as "propertyName", 
         PROPERTY_VALUE as "propertyValue", DESCRIPTION
      FROM DATABASE_PROPERTIES;
        
SELECT PROD.*, LPROD_NM, BUYER.*
FROM PROD INNER JOIN LPROD ON(PROD_LGU = LPROD_GU)
      INNER JOIN BUYER ON(PROD_BUYER = BUYER_ID);
      
select rownum as rnum, B.*  from (
         select * from prod order by prod_id) B
    where rownum <= 10;
    
select A.* 
from (
     select rownum as rnum, B.*  
     from (
         select * from prod 
         order by prod_id ) B
     where rownum <= 20) A 
where A.rnum >=16;
   
-- screenSize : 10, currentPage : 2
SELECT B.*
FROM(
    SELECT A.*, ROWNUM RNUM
    FROM(
        SELECT ROWID RID, MEM_ID, MEM_NAME
        FROM MEMBER
        ORDER BY RID DESC
    ) A
) B
WHERE RNUM >= 11 AND RNUM <= 20;




SELECT B.*
      FROM(
         SELECT A.*, ROWNUM RNUM
         FROM(
            SELECT PROD.*, LPROD_NM, BUYER_NAME
            FROM PROD INNER JOIN LPROD ON(PROD_LGU = LPROD_GU)
                    INNER JOIN BUYER ON(PROD_BUYER = BUYER_ID)
                ORDER BY PROD_ID 
           ) A
       ) B
      
          WHERE RNUM >= 1 AND RNUM <= 10;

SELECT B.*
FROM(
    SELECT A.*, ROWNUM RNUM
    FROM
    (
        SELECT MEM_ID, MEM_NAME, MEM_ADD1
        FROM MEMBER
        WHERE INSTR(MEM_ADD1, '����') > 0
        ORDER BY ROWID DESC
    ) A
) B;        
        
  --1. ���� ���� �ο��� ��ȸ
    SELECT
      case when substr(MEM_REGNO2,1,1) in ('1','3')
               then '����'
               else '����'
       end AS ����,             
       count(DISTINCT MEM_REGNO2) �ο���
    FROM MEMBER
    GROUP BY (case when substr(MEM_REGNO2,1,1) in ('1','3')
                               then '����'
                              else '����'
                      end);
                      
---------------------------------------------------
    SELECT *
FROM
    (select COUNT(*) AS MEN
       from member
      where SUBSTR(mem_regno2,0,1) = 1 OR SUBSTR(mem_regno2,0,1) =3
    ),
    (select COUNT(*) AS WOMEN
       from member
      where SUBSTR(mem_regno2,0,1) = 2 OR SUBSTR(mem_regno2,0,1) =4
    )

--2. ���ݱ��� �ѹ��� ��ǰ�� ������ ���� ���� ȸ���� �������� ��ȸ(���̵�, �̸�, �̸���)

    SELECT MEM_ID AS "���̵�", MEM_NAME AS "�̸�", MEM_MAIL AS "�̸���"
    FROM MEMBER
    WHERE MEM_ID NOT IN(SELECT DISTINCT CART_MEMBER
        FROM CART)
    ORDER BY MEM_ID;

  ------------------------------------------  
  
        select mem_id, mem_name, mem_mail
         from (
        select mem_id, mem_name, mem_mail, count(cart_member) as orders
        from member
            left outer join cart on (mem_id = cart_member)
        group by mem_id, mem_name, mem_mail)
    where orders = 0
    ORDER BY MEM_ID;
  
--3. ��ϵ� ��ǰ�� �Ѱǵ� ���� ��ǰ�з� ��ȸ(��ǰ�з��ڵ�, �з���)
    
    SELECT LPROD_GU AS "��ǰ �з� �ڵ�", LPROD_NM AS "�з���"
    FROM LPROD
    WHERE LPROD_GU NOT IN(SELECT PROD_LGU FROM PROD)
    ORDER BY LPROD_GU;
  
  ------------------------------------------  
    select lprod_gu, lprod_nm
    from(
        select lprod_gu, lprod_nm, count(prod_lgu) cnt
        from lprod
                left outer join prod on( lprod_gu = prod_lgu)
        group by lprod_gu, lprod_nm)
    where cnt = 0
    ORDER BY LPROD_GU;

--4. ���ݱ��� ���� ���� �ȸ� ��ǰ ��ȸ(��ǰ�ڵ�, ��ǰ��, ��ǰ�з���, �ŷ�ó��, ���ϸ���)
SELECT CART_PROD
FROM CART
WHERE ( MAX(CART_QTY) FROM CART); 

SELECT MAX(CART_QTY),CART_PROD FROM CART
GROUP BY CART_PROD;

SELECT MIN(AMT) AS AMT_ONE
           ,MIN(DISTINCT AMT) AS AMT_TWO
                FROM TEST_TABLE_ONE

SELECT CART_PROD, CART_QTY
FROM CART
WHERE CART_QTY = (SELECT MAX(CART_QTY)FROM CART);
------------------------------------------
select prod_id, prod_name,lprod_nm,prod_mileage, buyer_name,
        nvl(sum(cart_qty), 0) as sales
from prod
    left outer join cart on (prod_id = cart_prod)
    left outer join lprod on (prod_lgu = lprod_gu)
    left outer join buyer on (prod_buyer = buyer_id)
group by prod_id, prod_name,lprod_nm,prod_mileage, buyer_name
order by sales desc


select a.*
from(
    select prod_id, prod_name,lprod_nm,nvl(prod_mileage,0) prod_mileage, buyer_name,
            nvl(sum(cart_qty), 0) as sales
    from prod
        left outer join cart on (prod_id = cart_prod)
        left outer join lprod on (prod_lgu = lprod_gu)
        left outer join buyer on (prod_buyer = buyer_id)
    group by prod_id, prod_name,lprod_nm,prod_mileage, buyer_name
    order by sales desc) a
where rownum = 1;


--5.   ���ݱ��� ���� ���� �ȸ� ��ǰ ��ȸ(��ǰ�ڵ�, ��ǰ��, ��ǰ�з���, �ŷ�ó��, ���ϸ���)
select a.*
from(
    select prod_id, prod_name,lprod_nm,nvl(prod_mileage,0) prod_mileage, buyer_name,
            nvl(sum(cart_qty), 0) as sales
    from prod
        left outer join cart on (prod_id = cart_prod)
        left outer join lprod on (prod_lgu = lprod_gu)
        left outer join buyer on (prod_buyer = buyer_id)
    group by prod_id, prod_name,lprod_nm,prod_mileage, buyer_name
    order by sales asc) a
where rownum = 1;

--6. �ŷ�ó �� �ŷ� ǰ�� ���� ���� ���� �ŷ�ó ��ȸ(�ŷ�ó�ڵ�, �ŷ�ó��, �ŷ�ó�з���, ����ڸ�)
    SELECT BUYER_ID AS "�ŷ�ó�ڵ�" , 
           BUYER_NAME AS "�ŷ�ó��" , 
           BUYER_LGU AS "�ŷ�ó�з���", 
           BUYER_CHARGER AS "����ڸ�"
    FROM BUYER
    WHERE BUYER_ID = (
        SELECT PROD_BUYER
        FROM PROD
        WHERE PROD_ID = (
            SELECT BUY_PROD AS "ǰ��"
            FROM BUYPROD
            WHERE BUY_QTY =( 
                    SELECT MAX(BUY_QTY)
                    FROM BUYPROD)));
-------------------------------------------------

select buyer_id, buyer_name, lprod_nm, count(prod_id) cnt
from buyer
    left outer join prod on (buyer_id = prod_buyer)
    left outer join lprod on (buyer_lgu = lprod.lprod_gu)
group by buyer_id, buyer_name,lprod_nm
order by cnt desc; 

select a.*
from(
    select prod_id, prod_name,lprod_nm,nvl(prod_mileage,0) prod_mileage, buyer_name,
            nvl(sum(cart_qty), 0) as sales
    from prod
        left outer join cart on (prod_id = cart_prod)
        left outer join lprod on (prod_lgu = lprod_gu)
        left outer join buyer on (prod_buyer = buyer_id)
    group by prod_id, prod_name,lprod_nm,prod_mileage, buyer_name
    order by sales desc) a
where rownum = 1;


--7.   �ŷ�ó �� �ŷ� ǰ�� ���� ���� ���� �ŷ�ó ��ȸ(�ŷ�ó�ڵ�, �ŷ�ó��, �ŷ�ó�з���, ����ڸ�)
    SELECT BUYER_ID AS "�ŷ�ó�ڵ�" , 
           BUYER_NAME AS "�ŷ�ó��" , 
           BUYER_LGU AS "�ŷ�ó�з���", 
           BUYER_CHARGER AS "����ڸ�"
    FROM BUYER
    WHERE BUYER_ID = (
        SELECT PROD_BUYER
        FROM PROD
        WHERE PROD_ID = (
            SELECT BUY_PROD AS "ǰ��"
            FROM BUYPROD
            WHERE BUY_QTY =( 
                    SELECT MIN(BUY_QTY)
                    FROM BUYPROD)));
                    
  --------------------------------------------
 select buyer_id, buyer_name, lprod_nm, count(prod_id) cnt
from buyer
    left outer join prod on (buyer_id = prod_buyer)
    left outer join lprod on (buyer_lgu = lprod.lprod_gu)
group by buyer_id, buyer_name,lprod_nm
order by cnt desc; 
 
 
  select a.*
from(
    select buyer_id, buyer_name, lprod_nm, count(prod_id) cnt
    from buyer
        left outer join prod on (buyer_id = prod_buyer)
        left outer join lprod on (buyer_lgu = lprod.lprod_gu)
    group by buyer_id, buyer_name,lprod_nm
    order by cnt asc)a
where rownum = 1;

--8. ���� ���� ���� �������� ���� ��ǰ ��ȸ(����, ��ǰ�ڵ�, ��ǰ��, �з���)
select '����'as gender, cart_prod, prod_name, lprod_nm
from (
    select cart_prod, prod_name,lprod_nm, sum(cart_qty)
    from member
        inner join cart on (mem_id = cart_member)
        inner join prod on (cart_prod = prod_id)
        inner join lprod on (prod_lgu = lprod_gu)
    where SUBSTR(mem_regno2,0,1) = 1 OR SUBSTR(mem_regno2,0,1) =3
    group by cart_prod, prod_name, lprod_nm
    order by sum(cart_qty) desc)
where rownum=1 
union all
select '����'as gender, cart_prod, prod_name, lprod_nm
from (
    select cart_prod, prod_name,lprod_nm, sum(cart_qty)
    from member
        inner join cart on (mem_id = cart_member)
        inner join prod on (cart_prod = prod_id)
        inner join lprod on (prod_lgu = lprod_gu)
    where SUBSTR(mem_regno2,0,1) = 2 OR SUBSTR(mem_regno2,0,1) =4
    group by cart_prod, prod_name, lprod_nm
    order by sum(cart_qty) desc)
where rownum=1

--9. �� ȸ���� ���� �Ѿ� ��ȸ(ȸ�����̵�, ȸ����, �����Ѿ�)
select mem_id, mem_name, nvl(sum(prod_price * cart_qty),0) amount
from member
    left outer join cart on (mem_id = cart_member)
    left outer join prod on (cart_prod = prod_id)
group by mem_id, mem_name
order by amount desc

--10. �� ��ǰ�� ���ſ� ��ȸ(���ſվ��̵�, ȸ����, �����Ѿ�)
select prod_name, mem_id, mem_name, amount
from(
    select prod_name, mem_id, mem_name, prod_price*cart_qty as amount, rank() over(partition by prod_name order by prod_price*cart_qty desc ,mem_id)as rank
    from prod
        left outer join cart on (prod_id = cart_prod)
        left outer join member on (cart_member = mem_id)
    order by prod_name)
where rank=1;

--04/07
desc buyer;

select prod_lgu, prod_id
from prod;

--- P101 �� �ű� ��ǰ, �ڵ尪

SELECT 'P109'||LPAD(TO_NUMBER(SUBSTR(NVL(MAX(PROD_ID), LPAD('0', 10, '0')), LENGTH('p109')+1))+1, 6, '0') 
FROM PROD
WHERE PROD_LGU = 'P109';

-- if(member.getMem_id()==null || member.getMem_id().isEmpty()) {
--			valid = false;
--			errors.put("mem_id", "���̵� ����");
--		}
 SELECT 'if('||LOWER(A.TABLE_NAME)||'.'||
 GETTER(A.COLUMN_NAME)||'== null||'||
 LOWER(A.TABLE_NAME)||'.'||GETTER(A.COLUMN_NAME)||'.isEmpty()){valid = false; errors.put("'||
 LOWER(A.COLUMN_NAME)||'","'||COMMENTS||' ����"); }'
 FROM COLS A LEFT OUTER JOIN USER_COL_COMMENTS B
    ON (A.TABLE_NAME = B.TABLE_NAME AND A.COLUMN_NAME = B.COLUMN_NAME)
 WHERE A.TABLE_NAME = 'PROD' AND NULLABLE = 'N';

--Buyer

SELECT *
FROM BUYER;

select 'private '||
    DECODE(DATA_TYPE,'NUMBER ','Integer ','String ')||
    LOWER(COLUMN_NAME)||';'
from cols
where table_name = 'BUYER';


SELECT 'COMMENT ON COLUMN '||TABLE_NAME || '.'||COLUMN_NAME || ' IS '''';'
FROM COLS
WHERE TABLE_NAME = 'BUYER';

COMMENT ON COLUMN BUYER.BUYER_ID IS '�ŷ�ó�ڵ�';
COMMENT ON COLUMN BUYER.BUYER_NAME IS '�ŷ�ó��';
COMMENT ON COLUMN BUYER.BUYER_LGU IS '�ŷ�ó�з�';
COMMENT ON COLUMN BUYER.BUYER_BANK IS '�ŷ�ó����';
COMMENT ON COLUMN BUYER.BUYER_BANKNO IS '�ŷ�ó���¹�ȣ';
COMMENT ON COLUMN BUYER.BUYER_BANKNAME IS '�ŷ�ó������';
COMMENT ON COLUMN BUYER.BUYER_ZIP IS '�ŷ�ó�����ȣ';
COMMENT ON COLUMN BUYER.BUYER_ADD1 IS '�ŷ�ó�ּ�1';
COMMENT ON COLUMN BUYER.BUYER_ADD2 IS '�ŷ�ó�ּ�2';
COMMENT ON COLUMN BUYER.BUYER_COMTEL IS '�ŷ�ó��ȭ��ȣ';
COMMENT ON COLUMN BUYER.BUYER_FAX IS '�ŷ�ó�ѽ�';
COMMENT ON COLUMN BUYER.BUYER_MAIL IS '�ŷ�ó�̸���';
COMMENT ON COLUMN BUYER.BUYER_CHARGER IS '�ŷ�ó�����';
COMMENT ON COLUMN BUYER.BUYER_TELEXT IS '�ŷ�ó�߰���ȣ'; --??????????????



--------------------------------------------------------------------------------------------
-- 04/10
select buyer.*
from buyer;

SELECT COUNT(*)
FROM PROD INNER JOIN LPROD ON (PROD_LGU = LPROD_GU)
		INNER JOIN BUYER ON (PROD_BUYER = BUYER_ID);
        
SELECT COUNT(*)
    FROM BUYER INNER JOIN PROD ON (BUYER_ID = PROD_BUYER)
                INNER JOIN LPROD ON ( PROD_LGU = LPROD_GU);
                
SELECT COUNT(*)
    FROM BUYER LEFT OUTER JOIN PROD ON (BUYER_ID = PROD_BUYER)
                LEFT OUTER JOIN LPROD ON ( PROD_LGU = LPROD_GU);
                
SELECT BUYER.*
FROM BUYER;
    
        
SELECT BUYER.*
FROM BUYER;

-----------------------------------------------------------------------------------  
	SELECT B.*
		FROM (
			SELECT A.*, ROWNUM RNUM
			FROM (
				SELECT
					PROD_ID, PROD_NAME, PROD_COST
					, PROD_PRICE, PROD_MILEAGE
					, PROD_LGU 
					, LPROD_NM
					, BUYER_NAME as "buyer.buyer_name"
				FROM PROD INNER JOIN LPROD ON (PROD_LGU = LPROD_GU)
				INNER JOIN BUYER ON (PROD_BUYER = BUYER_ID)
				ORDER BY PROD_LGU ASC
			)A	 
		)B	
		WHERE RNUM BETWEEN 1 AND 11; 
        
        
-----------------------------------------------------------------------------------          
       	SELECT B.*
		FROM (
			SELECT A.*, ROWNUM RNUM
			FROM (
				SELECT
					  BUYER_ID, BUYER_NAME, BUYER_LGU,
                      BUYER_BANK, BUYER_BANKNO, BUYER_BANKNAME,
                      BUYER_ZIP, BUYER_ADD1, BUYER_ADD2, 
                      BUYER_COMTEL, BUYER_FAX, BUYER_MAIL,
                      BUYER_CHARGER, BUYER_TELEXT, 
                      LPROD_NM
					, PROD_NAME as "prod.prod_name"
				FROM BUYER INNER JOIN PROD ON (PROD_BUYER = BUYER_ID)
                           INNER JOIN LPROD ON (PROD_LGU = LPROD_GU)
				ORDER BY BUYER_ID ASC
			)A	 
		)B	
		WHERE RNUM BETWEEN 1 AND 11; 
        
  commit;
  
-----------------------------------------------------------------------------------  
      	SELECT B.*
		FROM (
			SELECT A.*, ROWNUM RNUM
			FROM (
				SELECT
					  BUYER_ID, BUYER_NAME, BUYER_LGU,
                      BUYER_BANK, BUYER_BANKNO, BUYER_BANKNAME,
                      BUYER_ZIP, BUYER_ADD1, BUYER_ADD2, 
                      BUYER_COMTEL, BUYER_FAX, BUYER_MAIL,
                      BUYER_CHARGER, BUYER_TELEXT, 
                      LPROD_NM
					
				FROM BUYER INNER JOIN PROD ON (PROD_BUYER = BUYER_ID)
                           INNER JOIN LPROD ON (PROD_LGU = LPROD_GU)
				ORDER BY BUYER_ID ASC
			)A	 
		)B	
		WHERE RNUM BETWEEN 1 AND 11; 
        
-----------------------------------------------------------------------------------        
        
        SELECT B.*
		FROM (
			SELECT A.*, ROWNUM RNUM
			FROM (
				SELECT
					  BUYER_ID, BUYER_NAME, BUYER_LGU,
                      BUYER_BANK, BUYER_BANKNO, BUYER_BANKNAME,
                      BUYER_ZIP, BUYER_ADD1, BUYER_ADD2, 
                      BUYER_COMTEL, BUYER_FAX, BUYER_MAIL,
                      BUYER_CHARGER, BUYER_TELEXT, 
                      LPROD_NM
					
				FROM BUYER INNER JOIN LPROD ON (BUYER_LGU = LPROD_GU)
                          
				ORDER BY BUYER_ID ASC
			)A	 
		)B	
		WHERE RNUM BETWEEN 1 AND 11; 

    
SELECT
						  BUYER_ID, BUYER_NAME, BUYER_LGU,
	                      BUYER_BANK, BUYER_BANKNO, BUYER_BANKNAME,
	                      BUYER_ZIP, BUYER_ADD1, BUYER_ADD2, 
	                      BUYER_COMTEL, BUYER_FAX, BUYER_MAIL,
	                      BUYER_CHARGER, BUYER_TELEXT, 
	                      LPROD_NM
						
						  FROM BUYER INNER JOIN LPROD ON (BUYER_LGU = LPROD_GU)
                          
				ORDER BY BUYER_ID ASC;      
                
                
                


---------------------------------------------------------------
--04/12
desc member;

ALTER TABLE MEMBER
ADD(
    MEM_ROLE VARCHAR2(20 CHAR)
);
UPDATE MEMBER
SET
MEM_ROLE = 'ROLE_USER';

UPDATE MEMBER
SET
MEM_ROLE = 'ROLE_ADMIN'
WHERE MEM_ID = 'c001';

COMMIT;

SELECT MEM_ID, MEM_ROLE
FROM MEMBER;

-------------------------------------------------------------------------------
--04/13
desc prod;

desc member;

ALTER TABLE MEMBER
ADD(MEM_IMG BLOB);

DESC MEMBER;



desc member;

select mem_pass
from member;


ALTER TABLE MEMBER
MODIFY MEM_PASS VARCHAR2(150);
DESC MEMBER;

UPDATE MEMBER
SET MEM_PASS = 'SknbGf+Gu+UwwxddYCnEA/VQEEQFwQfzyqJon3AzmlXS6txg7Wd6I5SkAsZqtIsRNAQ81NH2+l9XITTvSi3k/A==';

COMMIT;



/* �ڰ��� */
CREATE TABLE LICENSE (
   LIC_CODE CHAR(4) NOT NULL, /* �ڰ����ڵ� */
   LIC_NAME VARCHAR2(50 CHAR) NOT NULL /* �ڰ����� */
);

COMMENT ON TABLE LICENSE IS '�ڰ���';

COMMENT ON COLUMN LICENSE.LIC_CODE IS '�ڰ����ڵ�';

COMMENT ON COLUMN LICENSE.LIC_NAME IS '�ڰ�����';

CREATE UNIQUE INDEX PK_LICENSE
   ON LICENSE (
      LIC_CODE ASC
   );

ALTER TABLE LICENSE
   ADD
      CONSTRAINT PK_LICENSE
      PRIMARY KEY (
         LIC_CODE
      );

/* �����ڰ��� */
CREATE TABLE LIC_ALBA (
   AL_ID CHAR(8) NOT NULL, /* �˹ٻ��ڵ� */
   LIC_CODE CHAR(4) NOT NULL, /* �ڰ����ڵ� */
   LIC_DATE VARCHAR2(30) NOT NULL, /* ����� */
   LIC_IMG BLOB /* �ڰ����纻 */
);

COMMENT ON TABLE LIC_ALBA IS '�����ڰ���';

COMMENT ON COLUMN LIC_ALBA.AL_ID IS '�˹ٻ��ڵ�';

COMMENT ON COLUMN LIC_ALBA.LIC_CODE IS '�ڰ����ڵ�';

COMMENT ON COLUMN LIC_ALBA.LIC_DATE IS '�����';

COMMENT ON COLUMN LIC_ALBA.LIC_IMG IS '�ڰ����纻';

CREATE UNIQUE INDEX PK_LIC_ALBA
   ON LIC_ALBA (
      AL_ID ASC,
      LIC_CODE ASC
   );

ALTER TABLE LIC_ALBA
   ADD
      CONSTRAINT PK_LIC_ALBA
      PRIMARY KEY (
         AL_ID,
         LIC_CODE
      );

/* �˹ٻ� */
CREATE TABLE ALBA (
   AL_ID CHAR(8) NOT NULL, /* �˹ٻ��ڵ� */
   AL_NAME VARCHAR2(20) NOT NULL, /* �̸� */
   AL_AGE NUMBER(3) NOT NULL, /* ���� */
   AL_ZIP VARCHAR2(7) NOT NULL, /* �����ȣ */
   AL_ADDR1 VARCHAR2(200) NOT NULL, /* �ּ�1 */
   AL_ADDR2 VARCHAR2(200) NOT NULL, /* �ּ�2 */
   AL_HP VARCHAR2(15) NOT NULL, /* �޴��� */
   GR_CODE CHAR(4) NOT NULL, /* �з��ڵ� */
   AL_GEN CHAR(1) NOT NULL, /* ���� */
   AL_MAIL VARCHAR2(100) NOT NULL, /* �̸��� */
   AL_CAREER VARCHAR2(200), /* ��»��� */
   AL_SPEC VARCHAR2(500), /* Ư����� */
   AL_DESC VARCHAR2(500), /* ��� */
   AL_IMG VARCHAR2(300) /* �����ʻ������ */
);

COMMENT ON TABLE ALBA IS '�˹ٻ�';

COMMENT ON COLUMN ALBA.AL_ID IS '�˹ٻ��ڵ�';

COMMENT ON COLUMN ALBA.AL_NAME IS '�̸�';

COMMENT ON COLUMN ALBA.AL_AGE IS '����';

COMMENT ON COLUMN ALBA.AL_ZIP IS '�����ȣ';

COMMENT ON COLUMN ALBA.AL_ADDR1 IS '�ּ�1';

COMMENT ON COLUMN ALBA.AL_ADDR2 IS '�ּ�2';

COMMENT ON COLUMN ALBA.AL_HP IS '�޴���';

COMMENT ON COLUMN ALBA.GR_CODE IS '�з��ڵ�';

COMMENT ON COLUMN ALBA.AL_GEN IS '����';

COMMENT ON COLUMN ALBA.AL_MAIL IS '�̸���';

COMMENT ON COLUMN ALBA.AL_CAREER IS '��»���';

COMMENT ON COLUMN ALBA.AL_SPEC IS 'Ư�����';

COMMENT ON COLUMN ALBA.AL_DESC IS '���';

COMMENT ON COLUMN ALBA.AL_IMG IS '�����ʻ������';

CREATE UNIQUE INDEX PK_ALBA
   ON ALBA (
      AL_ID ASC
   );

ALTER TABLE ALBA
   ADD
      CONSTRAINT PK_ALBA
      PRIMARY KEY (
         AL_ID
      );

/* �з� */
CREATE TABLE GRADE (
   GR_CODE CHAR(4) NOT NULL, /* �з��ڵ� */
   GR_NAME VARCHAR2(10 CHAR) NOT NULL /* �з¸� */
);

COMMENT ON TABLE GRADE IS '�з�';

COMMENT ON COLUMN GRADE.GR_CODE IS '�з��ڵ�';

COMMENT ON COLUMN GRADE.GR_NAME IS '�з¸�';

CREATE UNIQUE INDEX PK_GRADE
   ON GRADE (
      GR_CODE ASC
   );

ALTER TABLE GRADE
   ADD
      CONSTRAINT PK_GRADE
      PRIMARY KEY (
         GR_CODE
      );

ALTER TABLE LIC_ALBA
   ADD
      CONSTRAINT FK_ALBA_TO_LIC_ALBA
      FOREIGN KEY (
         AL_ID
      )
      REFERENCES ALBA (
         AL_ID
      );

ALTER TABLE LIC_ALBA
   ADD
      CONSTRAINT FK_LICENSE_TO_LIC_ALBA
      FOREIGN KEY (
         LIC_CODE
      )
      REFERENCES LICENSE (
         LIC_CODE
      );

ALTER TABLE ALBA
   ADD
      CONSTRAINT FK_GRADE_TO_ALBA
      FOREIGN KEY (
         GR_CODE
      )
      REFERENCES GRADE (
         GR_CODE
      );
      
      
-----------------------------------------------------------------------------------------------------------------------
--04/14
	WITH CARTMEMBER AS 
    (
        SELECT DISTINCT 
            CART_PROD,
            MEM_ID, MEM_NAME, MEM_HP, MEM_MAIL
        FROM CART INNER JOIN MEMBER ON (CART_MEMBER = MEM_ID)
    )
    
    SELECT 
		    PROD_ID, PROD_NAME, PROD_LGU
		    , PROD_BUYER, PROD_COST, PROD_PRICE
		    , PROD_SALE, PROD_OUTLINE, PROD_DETAIL
		    , PROD_IMG, PROD_TOTALSTOCK, PROD_INSDATE
		    , PROD_PROPERSTOCK, PROD_SIZE, PROD_COLOR
		    , PROD_DELIVERY, PROD_UNIT, PROD_QTYIN
		    , PROD_QTYSALE, PROD_MILEAGE
		    , LPROD_NM
		    , BUYER_ID, BUYER_NAME, BUYER_ADD1
		    , BUYER_COMTEL, BUYER_CHARGER
            , CARTMEMBER.*
		FROM PROD INNER JOIN LPROD ON (PROD_LGU = LPROD_GU)
		          INNER JOIN BUYER ON (PROD_BUYER = BUYER_ID)
                  LEFT OUTER JOIN CARTMEMBER ON(PROD_ID = CART_PROD)
                 
	    WHERE PROD_ID = 'P101000001';
        
        
 --------------------------------------------------------------
 --04/15
 CREATE TABLE NOTICE (
BO_NO	NUMBER(6),
BO_TITLE	VARCHAR2(100 CHAR) NOT NULL,
BO_CONTENT CLOB,
BO_DATE	DATE DEFAULT SYSDATE,
BO_HIT	NUMBER(4) DEFAULT 0,
BO_REC	NUMBER(4) DEFAULT 0,
CONSTRAINT PK_NOTICE PRIMARY KEY(BO_NO)
);

CREATE TABLE BOARD(
BO_NO	NUMBER(6),
BO_TITLE	VARCHAR2(100 CHAR) NOT NULL,
BO_WRITER VARCHAR2(20 CHAR) NOT NULL,
BO_PASS VARCHAR2(200 CHAR) NOT NULL,
BO_CONTENT CLOB,
BO_DATE	DATE DEFAULT SYSDATE,
BO_HIT	NUMBER(4) DEFAULT 0,
BO_REC	NUMBER(4) DEFAULT 0,
BO_REP	NUMBER(4) DEFAULT 0,
BO_SEC	CHAR(1) DEFAULT 'N', --'Y' / 'N'
BO_PARENT NUMBER(6) ,
CONSTRAINT PK_BOARD PRIMARY KEY(BO_NO),
CONSTRAINT FK_BOARD_BOARD FOREIGN KEY (BO_PARENT)
    REFERENCES BOARD(BO_NO)
);

CREATE TABLE ATTATCH (
BO_NO NUMBER(6),
ATT_NO NUMBER(4),
ATT_FILENAME VARCHAR2(150 CHAR) NOT NULL,
ATT_SAVENAME VARCHAR2(150 CHAR) NOT NULL,
ATT_SIZE NUMBER(10) NOT NULL,
ATT_CONTENTTYPE VARCHAR2(100 CHAR),
ATT_DOWNCOUNT NUMBER(4) DEFAULT 0,
CONSTRAINT PK_ATTATCH PRIMARY KEY(ATT_NO),
CONSTRAINT FK_BOARD_ATTATCH FOREIGN KEY(BO_NO)
    REFERENCES BOARD(BO_NO)
);
CREATE TABLE REPLY2 (
BO_NO NUMBER(6),
REP_NO NUMBER(6),
REP_WRITER VARCHAR2(20 CHAR) NOT NULL,
REP_PASS VARCHAR2(200 CHAR) NOT NULL,
REP_CONTENT VARCHAR2(400 CHAR),
REP_DATE DATE DEFAULT SYSDATE,
CONSTRAINT PK_REPLY2 PRIMARY KEY (REP_NO),
CONSTRAINT FK_BOARD_REPLY2 FOREIGN KEY(BO_NO)
    REFERENCES BOARD(BO_NO)
);



--4. ���ݱ��� ���� ���� �ȸ� ��ǰ ��ȸ(��ǰ�ڵ�, ��ǰ��, ��ǰ�з���, �ŷ�ó��, ���ϸ���)
SELECT a.*
FROM (
SELECT PROD_ID, PROD_NAME, LPROD_NM, PROD_MILEAGE, BUYER_NAME, NVL(SUM(CART_QTY),0) AS SALES
FROM PROD
    LEFT OUTER JOIN CART ON (PROD_ID = CART_PROD)
    LEFT OUTER JOIN LPROD ON (PROD_LGU = LPROD_GU) 
    LEFT OUTER JOIN BUYER ON (PROD_LGU = BUYER_LGU)
GROUP BY PROD_ID, PROD_NAME, LPROD_NM, PROD_MILEAGE, BUYER_NAME
ORDER BY SALES DESC )a
where rownum = 1;
-- ���� ���Դ� SALES �� ASC �� ���� �� ROWNUM �������� �ȴ�.


-- prod �� buyer outer join �� �� ���� ���� �׳� �������� �ȵǴ°ǰ�?
-- where ������ max �� �������¹�


select prod_id, prod_name,lprod_nm, prod_mileage, buyer_name,
        nvl(sum(cart_qty), 0) as sales
from prod
    left outer join cart on (prod_id = cart_prod)
    left outer join lprod on (prod_lgu = lprod_gu)
    left outer join buyer on (prod_buyer = buyer_id)
group by prod_id, prod_name,lprod_nm,prod_mileage, buyer_name
order by sales desc;


--6. �ŷ�ó �� �ŷ� ǰ�� ���� ���� ���� �ŷ�ó ��ȸ(�ŷ�ó�ڵ�, �ŷ�ó��, �ŷ�ó�з���, ����ڸ�)
select a.*
    from (
    SELECT BUYER_ID, BUYER_NAME, LPROD_NM, COUNT(PROD_ID) CNT
    FROM BUYER
        LEFT OUTER JOIN PROD ON (BUYER_ID = PROD_BUYER)
        LEFT OUTER JOIN LPROD ON (BUYER_LGU = LPROD_GU)
        GROUP BY BUYER_ID, BUYER_NAME, LPROD_NM
        ORDER BY CNT desc)a
    where CNT = (SELECT MAX(CNT) FROM buyer );
    
  -- ǰ�� �� ���� ���� �ŷ�ó 
--  ORDER BY CNT ASC �� ���� �� 
--    WHERE ROWNUM =1; 


 ---------------------------------------------------
 CREATE TABLE NOTICE (
BO_NO	NUMBER(6),
BO_TITLE	VARCHAR2(100 CHAR) NOT NULL,
BO_CONTENT CLOB,
BO_DATE	DATE DEFAULT SYSDATE,
BO_HIT	NUMBER(4) DEFAULT 0,
BO_REC	NUMBER(4) DEFAULT 0,
CONSTRAINT PK_NOTICE PRIMARY KEY(BO_NO)
);

CREATE TABLE BOARD(
BO_NO	NUMBER(6),
BO_TITLE	VARCHAR2(100 CHAR) NOT NULL,
BO_WRITER VARCHAR2(20 CHAR) NOT NULL,
BO_PASS VARCHAR2(200 CHAR) NOT NULL,
BO_CONTENT CLOB,
BO_DATE	DATE DEFAULT SYSDATE,
BO_HIT	NUMBER(4) DEFAULT 0,
BO_REC	NUMBER(4) DEFAULT 0,
BO_REP	NUMBER(4) DEFAULT 0,
BO_SEC	CHAR(1) DEFAULT 'N', --'Y' / 'N'
BO_PARENT NUMBER(6) ,
CONSTRAINT PK_BOARD PRIMARY KEY(BO_NO),
CONSTRAINT FK_BOARD_BOARD FOREIGN KEY (BO_PARENT)
    REFERENCES BOARD(BO_NO)
);

CREATE TABLE ATTATCH (
BO_NO NUMBER(6),
ATT_NO NUMBER(4),
ATT_FILENAME VARCHAR2(150 CHAR) NOT NULL,
ATT_SAVENAME VARCHAR2(150 CHAR) NOT NULL,
ATT_SIZE NUMBER(10) NOT NULL,
ATT_CONTENTTYPE VARCHAR2(100 CHAR),
ATT_DOWNCOUNT NUMBER(4) DEFAULT 0,
CONSTRAINT PK_ATTATCH PRIMARY KEY(ATT_NO),
CONSTRAINT FK_BOARD_ATTATCH FOREIGN KEY(BO_NO)
    REFERENCES BOARD(BO_NO)
);
CREATE TABLE REPLY2 (
BO_NO NUMBER(6),
REP_NO NUMBER(6),
REP_WRITER VARCHAR2(20 CHAR) NOT NULL,
REP_PASS VARCHAR2(200 CHAR) NOT NULL,
REP_CONTENT VARCHAR2(400 CHAR),
REP_DATE DATE DEFAULT SYSDATE,
CONSTRAINT PK_REPLY2 PRIMARY KEY (REP_NO),
CONSTRAINT FK_BOARD_REPLY2 FOREIGN KEY(BO_NO)
    REFERENCES BOARD(BO_NO)
);

------------------------------------------
DROP TABLE NOTICE_COMMENT CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
---------------------------------------------------------
CREATE SEQUENCE BO_SEQ START WITH 1 INCREMENT BY 1;
INSERT INTO notice (
    bo_no, bo_title, bo_content,
    bo_date, bo_hit, bo_rec
) 
SELECT BO_SEQ.NEXTVAL, '���� ���� �Խñ� ����' || ROWNUM,  
      '���� ���� �Խñ� �� ���� <br /> ���Ƿ� �ۼ��� ����',
    SYSDATE - (500-ROWNUM), 
    TRUNC(DBMS_RANDOM.VALUE()*1000)
    , TRUNC(DBMS_RANDOM.VALUE()*1000)
  FROM DUAL
CONNECT BY LEVEL < 500;


SELECT BO_NO, BO_DATE
FROM NOTICE
ORDER BY BO_NO DESC;

SELECT ROWNUM, SYSDATE -(500 - ROWNUM)  -- ���Ű� ROWNUM 1�� ����
FROM DUAL


SELECT TRUNC( DBMS_RANDOM.VALUE() * 1000);

---------------------------------------------------------
INSERT INTO board (
    bo_no,    bo_title,    bo_writer,
    bo_pass,    bo_content,    bo_date,
    bo_hit,    bo_rec,    bo_rep,
    bo_sec,    bo_parent
) 
SELECT BO_SEQ.NEXTVAL, MEM_NAME||'���� �ۼ��� ��', MEM_NAME,
MEM_PASS, MEM_NAME||'�ۼ��� ���� ����<br/> ���Ƿ� �ۼ��� ����',
SYSDATE -(370 - ROWNUM),
TRUNC(DBMS_RANDOM.VALUE()*1000), -- HIT
TRUNC(DBMS_RANDOM.VALUE()*1000), -- ��õ
0, 'N', NULL
FROM MEMBER,
(
SELECT ROWNUM RNUM
FROM DUAL
CONNECT BY LEVEL < 11);

ROLLBACK;

SELECT BO_NO, BO_DATE
FROM BOARD;

---------------------------------------------------------
CREATE OR REPLACE VIEW BOARDVIEW AS
SELECT *
FROM(
    SELECT DECODE(TRUNC(ROWNUM/4),0,1,999) BO_SORT, NOTICE.*
    FROM(
        SELECT   'NOTICE' BO_TYPE, 
        bo_no,    bo_title,    '������' BO_WRITER,
        NULL BO_PASS,    bo_content,    bo_date,
        bo_hit,    bo_rec,    NULL BO_REP,
        NULL BO_SEQ,    NULL BO_PARENT
        FROM NOTICE
        ORDER BY BO_NO DESC
    ) NOTICE
UNION ALL
SELECT 
    2 BO_SORT,  'BOARD' BO_TYPE,
    bo_no,    bo_title,    bo_writer,
    bo_pass,    bo_content,    bo_date,
    bo_hit,    bo_rec,    bo_rep,
    bo_sec,    bo_parent
FROM BOARD
);



SELECT DECODE(TRUNC(ROWNUM/4),0,1,999) BO_SORT, NOTICE.*
FROM(
        SELECT BO_NO, BO_DATE, BO_TITLE, 'NOTICE' BO_TYPE
        FROM NOTICE
        ORDER BY BO_NO DESC
) NOTICE
ORDER BY BO_SORT ASC, BO_NO DESC;

--------------------------------------------
SELECT *
FROM BOARDVIEW
ORDER BY BO_SORT ASC,BO_DATE DESC;

select 'private '||
    DECODE(DATA_TYPE,'NUMBER','Integer ','String ')||
    LOWER(COLUMN_NAME)||';'
from cols
where table_name = 'BOARDVIEW';



-------------------------------------------------------
SELECT *
FROM BOARD;

	SELECT B.*
		FROM (
			SELECT A.*, ROWNUM RNUM
			FROM (
				SELECT
     BO_TYPE, BO_NO, BO_TITLE, BO_WRITER, BO_CONTENT, BO_DATE, BO_HIT, BO_REC, BO_REP
    
				FROM BOARDVIEW
				ORDER BY BO_DATE
			)A	 
		)B	
		WHERE RNUM BETWEEN 1 AND 11;
        
        
        
        SELECT COUNT(*)
        FROM BOARDVIEW;
        
        
        DESC BOARDVIEW;
        
        
        
        
        
------------------------------------------------------------------------------------------------        
        
        SELECT B.*
		FROM (
			SELECT ROWNUM -3 RNUM, A.*
			FROM (
				SELECT
    			BO_SORT, BO_TYPE, BO_NO, 
    			BO_TITLE, BO_WRITER, 
    			BO_HIT, BO_REC, 
    			BO_REP,
    			TO_CHAR(BO_DATE, 'YYYY-MM-DD') BO_DATE
				FROM BOARDVIEW
				
				ORDER BY BO_SORT ASC, BO_DATE DESC
			)A	 
		)B	

		WHERE BO_SORT = 1 OR RNUM BETWEEN 1 AND 11;
        
------------------------------------------------------------------------------------------------ 

alter table member
add (MEM_IMG BLOB);


------------------------------------------------------------------------------------------------

select mem_pass
from member;


ALTER TABLE MEMBER
MODIFY MEM_PASS VARCHAR2(150);
DESC MEMBER;

UPDATE MEMBER
SET MEM_PASS = 'SknbGf+Gu+UwwxddYCnEA/VQEEQFwQfzyqJon3AzmlXS6txg7Wd6I5SkAsZqtIsRNAQ81NH2+l9XITTvSi3k/A==';

------------------------------------------------------------------------------------------------
 -- selectBoard --
        SELECT
            BO_SORT, BO_TYPE, BO_NO, 
    		BO_TITLE, BO_WRITER,
    		BO_HIT, BO_REC, 
    		BO_REP,
    		TO_CHAR(BO_DATE, 'YYYY-MM-DD') BO_DATE
         FROM BOARDVIEW
        WHERE BO_NO = 1000;

        
DESC BOARDVIEW;


-------------------------------------------------------------------------------------------------
--04/17
-- ���� ������ ����
INSERT INTO ALBA (
    AL_ID,    AL_NAME,    AL_AGE, AL_ZIP, AL_ADD1, 
    AL_ADD2,    AL_HP,    AL_SPEC,   AL_DESC,   
    GR_CODE,    AL_CAREER,   AL_GEN,    AL_MAIL
)
SELECT 'A'||LPAD(ROWNUM, 7, '0') , MEM_NAME, 
    23,
    MEM_ZIP, MEM_ADD1, MEM_ADD2, 
    NVL(MEM_HP, '000-000-0000'), '����', '�ڱ�Ұ�', 'G003', MEM_JOB, 
    DECODE(SUBSTR(MEM_REGNO2, 1, 1), '1', 'M', 'F'),
    MEM_MAIL
FROM MEMBER;

INSERT INTO LIC_ALBA (AL_ID, LIC_CODE, LIC_DATE)
SELECT AL_ID, 'L001', SYSDATE
FROM ALBA;
           
INSERT INTO LIC_ALBA(AL_ID, LIC_CODE)
SELECT AL_ID, 'L004'
FROM (SELECT ROWNUM RNUM, AL_ID FROM ALBA)
WHERE MOD(RNUM,2) = 0;

commit;


----------------------------------------------------------------------------

-- ���ӻ�� ã�� 

SELECT EMPNO, LEVEL, LPAD(' ', 2*level-1)|| ENAME, MGR, SAL
FROM EMP
START WITH MGR IS NULL -- ó�� ���� MGR �� NULL 
CONNECT BY PRIOR EMPNO = MGR -- EMPNO �� MGR �� ���� �ϴµ� EMPNO �� PRIOR �� �ٿ��� ������ 
ORDER SIBLINGS BY SAL ASC;



 SELECT 
    BO_SORT, BO_TYPE, BO_NO
      , LEVEL
      , LPAD('   RE:', 12*(level-1), '*nbsp;')||DECODE(BO_SEC, 'Y', '��б���', BO_TITLE) BO_TITLE 
      -- level �� �ٴ� ���ڸ� �����ϸ� 
      , BO_WRITER
      , BO_HIT, BO_REC
      , TO_CHAR(BO_DATE, 'YYYY-MM-DD HH:MI') BO_DATE
      , BO_SEC
FROM BOARDVIEW
-- �������� �ִ��� ��ġ�� �߿�.
WHERE bo_type = 'BOARD'
START WITH BO_PARENT IS NULL
CONNECT BY PRIOR BO_NO = BO_PARENT

ORDER SIBLINGS BY BO_SORT ASC, BO_NO DESC;




-----------------------------------------------------------------------------------
--04/21

UPDATE BOARD
SET
BO_TITLE = 'TEST'
WHERE BO_NO = 1344;

ROLLBACK;

    
    delete from board
    where
    bo_no = 1344  and bo_pass= 'SknbGf+Gu+UwwxddYCnEA/VQEEQFwQfzyqJon3AzmlXS6txg7Wd6I5SkAsZqtIsRNAQ81NH2+l9XITTvSi3k/A==';
    

update board
set
bo_title = '������ �Խñ� �Դϴ�.' , bo_content = ' ������ �Խñ� �Դϴ�.'
where bo_no = 1343 and bo_pass= 'SknbGf+Gu+UwwxddYCnEA/VQEEQFwQfzyqJon3AzmlXS6txg7Wd6I5SkAsZqtIsRNAQ81NH2+l9XITTvSi3k/A==';



SELECT EMPNO, ENAME, MGR
FROM EMP;

SELECT -- SELECT �ȿ� SELECT �� ���� ��Į�� ����
FROM  -- FROM �ȿ� SELECT �� ���� �ζ��κ�
WHERE -- WHERE �ȿ� SELECT �� ���� ��������

--���� ������ : ����� ����� �������ִ�. SELECT ������ ��ȸ �� �� ����.
-- ��Į�� ����  : ������ �����  ���ڵ尡 �ϳ�, ��ȸ�Ǵ� ���� �ϳ� 

SELECT EMPNO, ENAME, MGR,(
    SELECT COUNT(*)
    FROM EMP B
    WHERE B.MGR = A.EMPNO
) CNT
FROM EMP A;

MERGE INTO A
USING B
ON()
WHEN MATCHED THEN -- ���ǿ� �´��� Ȯ�� MATCHED -- �� ������ ������ , THEN -- ������ ������� �����ϰ� ���� ������

WHEN UNMATCHED THEN -- ������ �������� ��� 

MERGE INTO EMP C -- ��� ���̺�
USING (
    SELECT EMPNO,(
        SELECT COUNT(*)
        FROM EMP B
        WHERE B.MGR = A.EMPNO
    ) CNT
    FROM EMP A -- �ڽ��� ������ ���� �޶���.
) D
ON(C.EMPNO = '7369' AND C.EMPNO = D.EMPNO) -- C��D�� JOIN �� �� �ִ� ���� �ϼ�
WHEN MATCHED THEN
UPDATE SET ENAME = '����'
DELETE WHERE D.CNT = 0;

ROLLBACK;



SELECT EMPNO, MGR
FROM EMP;
WHERE


-- ���ñ� �۹�ȣ�� �ڽ� ������ �� �� �ִ� ������
SELECT BO_NO, (
    SELECT COUNT(*) -1 -- COUNT(*) 
    FROM BOARD B
    START WITH BO_NO = A.BO_NO
    CONNECT BY PRIOR BO_NO = BO_PARENT
) CNT
FROM BOARD A
ORDER BY BO_NO DESC;



MERGE INTO BOARD C
USING ( -- ���� ���� �������� �� / ���̺��� �ƴϴ�.
        SELECT BO_NO, (
            SELECT COUNT(*) -1 -- COUNT(*) 
            FROM BOARD B
            START WITH BO_NO = A.BO_NO
            CONNECT BY PRIOR BO_NO = BO_PARENT
        ) CNT
        FROM BOARD A
) D
ON (C.BO_NO = 1327 AND C.BO_NO = D.BO_NO)  -- �� ��ȣ�� �־ �ϳ��� �۸� ���� ���Ѻ���.
WHEN MATCHED THEN
    UPDATE SET BO_TITLE = '������ ���� ����'
                , BO_CONTENT = '������ ���� ����'
    DELETE WHERE D.CNT = 0;
    
    SELECT BO_TITLE
    FORM BOARD
    
    
    ROLLBACK;


ALTER TABLE BOARD
ADD(
    BO_DELETE CHAR(1) DEFAULT 'N'
);


SELECT BO_DELETE
FROM BOARD;


rollback;

CREATE OR REPLACE VIEW BOARDVIEW AS
SELECT *
FROM(
    SELECT DECODE(TRUNC(ROWNUM/4),0,1,999) BO_SORT, NOTICE.*
    FROM(
        SELECT   'NOTICE' BO_TYPE, 
        bo_no,    bo_title,    '������' BO_WRITER,
        NULL BO_PASS,    bo_content,    bo_date,
        bo_hit,    bo_rec,    NULL BO_REP,
        NULL BO_SEQ,    NULL BO_PARENT,
        null bo_delete
        FROM NOTICE
        ORDER BY BO_NO DESC
    ) NOTICE
UNION ALL
SELECT 
    2 BO_SORT,  'BOARD' BO_TYPE,
    bo_no,    bo_title,    bo_writer,
    bo_pass,    bo_content,    bo_date,
    bo_hit,    bo_rec,    bo_rep,
    bo_sec,    bo_parent, bo_delete
FROM BOARD
);

select *
from boardview;