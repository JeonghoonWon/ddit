-- oracle 이 가지고 있는 RDBMS
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
--		<td>아이디</td>
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

COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEM_PASS IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.MEM_REGNO1 IS '주민번호1';
COMMENT ON COLUMN MEMBER.MEM_REGNO2 IS '주민번호2';
COMMENT ON COLUMN MEMBER.MEM_BIR IS '생일';
COMMENT ON COLUMN MEMBER.MEM_ZIP IS '우편번호';
COMMENT ON COLUMN MEMBER.MEM_ADD1 IS '회원집주소1';
COMMENT ON COLUMN MEMBER.MEM_ADD2 IS '회원집주소2';
COMMENT ON COLUMN MEMBER.MEM_HOMETEL IS '회원집번호';
COMMENT ON COLUMN MEMBER.MEM_COMTEL IS '회원회사번호';
COMMENT ON COLUMN MEMBER.MEM_HP IS '회원전화번호';
COMMENT ON COLUMN MEMBER.MEM_MAIL IS '회원메일';
COMMENT ON COLUMN MEMBER.MEM_JOB IS '회원직업';
COMMENT ON COLUMN MEMBER.MEM_LIKE IS '회원취미';
COMMENT ON COLUMN MEMBER.MEM_MEMORIAL IS '회원';
COMMENT ON COLUMN MEMBER.MEM_MEMORIALDAY IS '회원기념일';
COMMENT ON COLUMN MEMBER.MEM_MILEAGE IS '회원마일리지';
COMMENT ON COLUMN MEMBER.MEM_DELETE IS '회원삭제';
COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';

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
 -- function 과 procedure 의 차이
 -- function 은 return 값이 있음
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
--			errors.put("mem_id", "아이디 누락");
--		}
 SELECT 'if('||LOWER(A.TABLE_NAME)||'.'||
 GETTER(A.COLUMN_NAME)||'== null||'||
 LOWER(A.TABLE_NAME)||'.'||GETTER(A.COLUMN_NAME)||'.isEmpty()){valid = false; errors.put("'||
 LOWER(A.COLUMN_NAME)||'","'||COMMENTS||' 누락"); }'
 FROM COLS A LEFT OUTER JOIN USER_COL_COMMENTS B
    ON (A.TABLE_NAME = B.TABLE_NAME AND A.COLUMN_NAME = B.COLUMN_NAME)
 WHERE A.TABLE_NAME = 'MEMBER' AND NULLABLE = 'N';
 
-- <tr>
--	<th>회원아이디</th>
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
 
 
-- a001 사용자의 기본 정보(member)와 그동안 구매한 상품 목록(cart)을 함께 조회 . 상품(prod) : 코드, 명, 구매가 ,판매가, 마일리지

select a.mem_id, a.mem_name, b.cart_prod ,
       c.prod_lgu, c.prod_name, c.prod_cost, c.prod_price, a.mem_mileage
from member a, cart b, prod c 
    on(a.mem_id = b.cart_member and b.cart_prod = c.prod_id)
where a.mem_id = 'a001';
 
 
-- 쿼리문이 시작 되는 곳 먼저 시작
select 
    member.*,
    prod_id, prod_name, prod_cost, prod_price, prod_mileage
from
    member left outer join cart on (mem_id = cart_member)
       left outer join prod on(cart_prod = prod_id)
where mem_id = 'a001';   

-- a001 사용자의 기본 정보(member)와 
-- 그동안 구매한 상품 목록(cart)을 함께 조회
-- 상품 분류명, 거래처명(buyer , buyer_name)
-- 상품(prod) : 코드, 명, 구매가 ,판매가, 마일리지
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


-- 한명의 정보 조회시, 
-- 구매 목록 조회(중복제거)
-- 상품정보를 조회할때 분류명, 거래처명 조회
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
   -- 상품코드  
   -- 거래처 정보 
   -- 거래처명, 담당자명, 연락처, 주소1

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
 
 
 COMMENT ON COLUMN PROD.PROD_ID IS '상품코드';
COMMENT ON COLUMN PROD.PROD_NAME IS '상품명';
COMMENT ON COLUMN PROD.PROD_LGU IS '상품분류';
COMMENT ON COLUMN PROD.PROD_BUYER IS '거래처';
COMMENT ON COLUMN PROD.PROD_COST IS '구매가';
COMMENT ON COLUMN PROD.PROD_PRICE IS '판매가';
COMMENT ON COLUMN PROD.PROD_SALE IS '할인가';
COMMENT ON COLUMN PROD.PROD_OUTLINE IS '상품설명요약';
COMMENT ON COLUMN PROD.PROD_DETAIL IS '상품상세설명';
COMMENT ON COLUMN PROD.PROD_IMG IS '사진';
COMMENT ON COLUMN PROD.PROD_TOTALSTOCK IS '총재고량';
COMMENT ON COLUMN PROD.PROD_INSDATE IS '입고날짜';
COMMENT ON COLUMN PROD.PROD_PROPERSTOCK IS '입고전재고량';
COMMENT ON COLUMN PROD.PROD_SIZE IS '상품크기';
COMMENT ON COLUMN PROD.PROD_COLOR IS '상품색상';
COMMENT ON COLUMN PROD.PROD_DELIVERY IS '배송방법';
COMMENT ON COLUMN PROD.PROD_UNIT IS '수량';
COMMENT ON COLUMN PROD.PROD_QTYIN IS '입고수량';
COMMENT ON COLUMN PROD.PROD_QTYSALE IS '할인수량';
COMMENT ON COLUMN PROD.PROD_MILEAGE IS '마일리지';


--<tr>
--    <th>상품코드</th>
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
        WHERE INSTR(MEM_ADD1, '대전') > 0
        ORDER BY ROWID DESC
    ) A
) B;        
        
  --1. 남녀 성별 인원수 조회
    SELECT
      case when substr(MEM_REGNO2,1,1) in ('1','3')
               then '남성'
               else '여성'
       end AS 성별,             
       count(DISTINCT MEM_REGNO2) 인원수
    FROM MEMBER
    GROUP BY (case when substr(MEM_REGNO2,1,1) in ('1','3')
                               then '남성'
                              else '여성'
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

--2. 지금까지 한번도 상품을 구매한 적이 없는 회원의 인적사항 조회(아이디, 이름, 이메일)

    SELECT MEM_ID AS "아이디", MEM_NAME AS "이름", MEM_MAIL AS "이메일"
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
  
--3. 등록된 상품이 한건도 없는 상품분류 조회(상품분류코드, 분류명)
    
    SELECT LPROD_GU AS "상품 분류 코드", LPROD_NM AS "분류명"
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

--4. 지금까지 가장 많이 팔린 상품 조회(상품코드, 상품명, 상품분류명, 거래처명, 마일리지)
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


--5.   지금까지 가장 적게 팔린 상품 조회(상품코드, 상품명, 상품분류명, 거래처명, 마일리지)
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

--6. 거래처 중 거래 품목 수가 가장 많은 거래처 조회(거래처코드, 거래처명, 거래처분류명, 담당자명)
    SELECT BUYER_ID AS "거래처코드" , 
           BUYER_NAME AS "거래처명" , 
           BUYER_LGU AS "거래처분류명", 
           BUYER_CHARGER AS "담당자명"
    FROM BUYER
    WHERE BUYER_ID = (
        SELECT PROD_BUYER
        FROM PROD
        WHERE PROD_ID = (
            SELECT BUY_PROD AS "품목"
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


--7.   거래처 중 거래 품목 수가 가장 적은 거래처 조회(거래처코드, 거래처명, 거래처분류명, 담당자명)
    SELECT BUYER_ID AS "거래처코드" , 
           BUYER_NAME AS "거래처명" , 
           BUYER_LGU AS "거래처분류명", 
           BUYER_CHARGER AS "담당자명"
    FROM BUYER
    WHERE BUYER_ID = (
        SELECT PROD_BUYER
        FROM PROD
        WHERE PROD_ID = (
            SELECT BUY_PROD AS "품목"
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

--8. 남녀 성별 각각 구매율이 높은 상품 조회(성별, 상품코드, 상품명, 분류명)
select '남성'as gender, cart_prod, prod_name, lprod_nm
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
select '여성'as gender, cart_prod, prod_name, lprod_nm
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

--9. 각 회원별 구매 총액 조회(회원아이디, 회원명, 구매총액)
select mem_id, mem_name, nvl(sum(prod_price * cart_qty),0) amount
from member
    left outer join cart on (mem_id = cart_member)
    left outer join prod on (cart_prod = prod_id)
group by mem_id, mem_name
order by amount desc

--10. 각 상품별 구매왕 조회(구매왕아이디, 회원명, 구매총액)
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

--- P101 의 신규 상품, 코드값

SELECT 'P109'||LPAD(TO_NUMBER(SUBSTR(NVL(MAX(PROD_ID), LPAD('0', 10, '0')), LENGTH('p109')+1))+1, 6, '0') 
FROM PROD
WHERE PROD_LGU = 'P109';

-- if(member.getMem_id()==null || member.getMem_id().isEmpty()) {
--			valid = false;
--			errors.put("mem_id", "아이디 누락");
--		}
 SELECT 'if('||LOWER(A.TABLE_NAME)||'.'||
 GETTER(A.COLUMN_NAME)||'== null||'||
 LOWER(A.TABLE_NAME)||'.'||GETTER(A.COLUMN_NAME)||'.isEmpty()){valid = false; errors.put("'||
 LOWER(A.COLUMN_NAME)||'","'||COMMENTS||' 누락"); }'
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

COMMENT ON COLUMN BUYER.BUYER_ID IS '거래처코드';
COMMENT ON COLUMN BUYER.BUYER_NAME IS '거래처명';
COMMENT ON COLUMN BUYER.BUYER_LGU IS '거래처분류';
COMMENT ON COLUMN BUYER.BUYER_BANK IS '거래처은행';
COMMENT ON COLUMN BUYER.BUYER_BANKNO IS '거래처계좌번호';
COMMENT ON COLUMN BUYER.BUYER_BANKNAME IS '거래처예금주';
COMMENT ON COLUMN BUYER.BUYER_ZIP IS '거래처우편번호';
COMMENT ON COLUMN BUYER.BUYER_ADD1 IS '거래처주소1';
COMMENT ON COLUMN BUYER.BUYER_ADD2 IS '거래처주소2';
COMMENT ON COLUMN BUYER.BUYER_COMTEL IS '거래처전화번호';
COMMENT ON COLUMN BUYER.BUYER_FAX IS '거래처팩스';
COMMENT ON COLUMN BUYER.BUYER_MAIL IS '거래처이메일';
COMMENT ON COLUMN BUYER.BUYER_CHARGER IS '거래처담당자';
COMMENT ON COLUMN BUYER.BUYER_TELEXT IS '거래처추가번호'; --??????????????



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



/* 자격증 */
CREATE TABLE LICENSE (
   LIC_CODE CHAR(4) NOT NULL, /* 자격증코드 */
   LIC_NAME VARCHAR2(50 CHAR) NOT NULL /* 자격증명 */
);

COMMENT ON TABLE LICENSE IS '자격증';

COMMENT ON COLUMN LICENSE.LIC_CODE IS '자격증코드';

COMMENT ON COLUMN LICENSE.LIC_NAME IS '자격증명';

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

/* 보유자격증 */
CREATE TABLE LIC_ALBA (
   AL_ID CHAR(8) NOT NULL, /* 알바생코드 */
   LIC_CODE CHAR(4) NOT NULL, /* 자격증코드 */
   LIC_DATE VARCHAR2(30) NOT NULL, /* 취득일 */
   LIC_IMG BLOB /* 자격증사본 */
);

COMMENT ON TABLE LIC_ALBA IS '보유자격증';

COMMENT ON COLUMN LIC_ALBA.AL_ID IS '알바생코드';

COMMENT ON COLUMN LIC_ALBA.LIC_CODE IS '자격증코드';

COMMENT ON COLUMN LIC_ALBA.LIC_DATE IS '취득일';

COMMENT ON COLUMN LIC_ALBA.LIC_IMG IS '자격증사본';

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

/* 알바생 */
CREATE TABLE ALBA (
   AL_ID CHAR(8) NOT NULL, /* 알바생코드 */
   AL_NAME VARCHAR2(20) NOT NULL, /* 이름 */
   AL_AGE NUMBER(3) NOT NULL, /* 나이 */
   AL_ZIP VARCHAR2(7) NOT NULL, /* 우편번호 */
   AL_ADDR1 VARCHAR2(200) NOT NULL, /* 주소1 */
   AL_ADDR2 VARCHAR2(200) NOT NULL, /* 주소2 */
   AL_HP VARCHAR2(15) NOT NULL, /* 휴대폰 */
   GR_CODE CHAR(4) NOT NULL, /* 학력코드 */
   AL_GEN CHAR(1) NOT NULL, /* 성별 */
   AL_MAIL VARCHAR2(100) NOT NULL, /* 이메일 */
   AL_CAREER VARCHAR2(200), /* 경력사항 */
   AL_SPEC VARCHAR2(500), /* 특기사항 */
   AL_DESC VARCHAR2(500), /* 비고 */
   AL_IMG VARCHAR2(300) /* 프로필사진경로 */
);

COMMENT ON TABLE ALBA IS '알바생';

COMMENT ON COLUMN ALBA.AL_ID IS '알바생코드';

COMMENT ON COLUMN ALBA.AL_NAME IS '이름';

COMMENT ON COLUMN ALBA.AL_AGE IS '나이';

COMMENT ON COLUMN ALBA.AL_ZIP IS '우편번호';

COMMENT ON COLUMN ALBA.AL_ADDR1 IS '주소1';

COMMENT ON COLUMN ALBA.AL_ADDR2 IS '주소2';

COMMENT ON COLUMN ALBA.AL_HP IS '휴대폰';

COMMENT ON COLUMN ALBA.GR_CODE IS '학력코드';

COMMENT ON COLUMN ALBA.AL_GEN IS '성별';

COMMENT ON COLUMN ALBA.AL_MAIL IS '이메일';

COMMENT ON COLUMN ALBA.AL_CAREER IS '경력사항';

COMMENT ON COLUMN ALBA.AL_SPEC IS '특기사항';

COMMENT ON COLUMN ALBA.AL_DESC IS '비고';

COMMENT ON COLUMN ALBA.AL_IMG IS '프로필사진경로';

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

/* 학력 */
CREATE TABLE GRADE (
   GR_CODE CHAR(4) NOT NULL, /* 학력코드 */
   GR_NAME VARCHAR2(10 CHAR) NOT NULL /* 학력명 */
);

COMMENT ON TABLE GRADE IS '학력';

COMMENT ON COLUMN GRADE.GR_CODE IS '학력코드';

COMMENT ON COLUMN GRADE.GR_NAME IS '학력명';

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



--4. 지금까지 가장 많이 팔린 상품 조회(상품코드, 상품명, 상품분류명, 거래처명, 마일리지)
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
-- 가장 적게는 SALES 를 ASC 로 변경 후 ROWNUM 가져오면 된다.


-- prod 랑 buyer outer join 할 때 같은 값을 그냥 가져오면 안되는건가?
-- where 절에서 max 를 가져오는법


select prod_id, prod_name,lprod_nm, prod_mileage, buyer_name,
        nvl(sum(cart_qty), 0) as sales
from prod
    left outer join cart on (prod_id = cart_prod)
    left outer join lprod on (prod_lgu = lprod_gu)
    left outer join buyer on (prod_buyer = buyer_id)
group by prod_id, prod_name,lprod_nm,prod_mileage, buyer_name
order by sales desc;


--6. 거래처 중 거래 품목 수가 가장 많은 거래처 조회(거래처코드, 거래처명, 거래처분류명, 담당자명)
select a.*
    from (
    SELECT BUYER_ID, BUYER_NAME, LPROD_NM, COUNT(PROD_ID) CNT
    FROM BUYER
        LEFT OUTER JOIN PROD ON (BUYER_ID = PROD_BUYER)
        LEFT OUTER JOIN LPROD ON (BUYER_LGU = LPROD_GU)
        GROUP BY BUYER_ID, BUYER_NAME, LPROD_NM
        ORDER BY CNT desc)a
    where CNT = (SELECT MAX(CNT) FROM buyer );
    
  -- 품목 수 가장 적은 거래처 
--  ORDER BY CNT ASC 로 변경 후 
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
SELECT BO_SEQ.NEXTVAL, '더미 공지 게시글 제목' || ROWNUM,  
      '더미 공지 게시글 의 내용 <br /> 임의로 작성한 내용',
    SYSDATE - (500-ROWNUM), 
    TRUNC(DBMS_RANDOM.VALUE()*1000)
    , TRUNC(DBMS_RANDOM.VALUE()*1000)
  FROM DUAL
CONNECT BY LEVEL < 500;


SELECT BO_NO, BO_DATE
FROM NOTICE
ORDER BY BO_NO DESC;

SELECT ROWNUM, SYSDATE -(500 - ROWNUM)  -- 과거가 ROWNUM 1로 적용
FROM DUAL


SELECT TRUNC( DBMS_RANDOM.VALUE() * 1000);

---------------------------------------------------------
INSERT INTO board (
    bo_no,    bo_title,    bo_writer,
    bo_pass,    bo_content,    bo_date,
    bo_hit,    bo_rec,    bo_rep,
    bo_sec,    bo_parent
) 
SELECT BO_SEQ.NEXTVAL, MEM_NAME||'님이 작성한 글', MEM_NAME,
MEM_PASS, MEM_NAME||'작성한 글의 내용<br/> 임의로 작성한 내용',
SYSDATE -(370 - ROWNUM),
TRUNC(DBMS_RANDOM.VALUE()*1000), -- HIT
TRUNC(DBMS_RANDOM.VALUE()*1000), -- 추천
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
        bo_no,    bo_title,    '관리자' BO_WRITER,
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
-- 더미 데이터 생성
INSERT INTO ALBA (
    AL_ID,    AL_NAME,    AL_AGE, AL_ZIP, AL_ADD1, 
    AL_ADD2,    AL_HP,    AL_SPEC,   AL_DESC,   
    GR_CODE,    AL_CAREER,   AL_GEN,    AL_MAIL
)
SELECT 'A'||LPAD(ROWNUM, 7, '0') , MEM_NAME, 
    23,
    MEM_ZIP, MEM_ADD1, MEM_ADD2, 
    NVL(MEM_HP, '000-000-0000'), '스펙', '자기소개', 'G003', MEM_JOB, 
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

-- 직속상관 찾기 

SELECT EMPNO, LEVEL, LPAD(' ', 2*level-1)|| ENAME, MGR, SAL
FROM EMP
START WITH MGR IS NULL -- 처음 시작 MGR 이 NULL 
CONNECT BY PRIOR EMPNO = MGR -- EMPNO 와 MGR 을 연결 하는데 EMPNO 에 PRIOR 를 붙여서 앞으로 
ORDER SIBLINGS BY SAL ASC;



 SELECT 
    BO_SORT, BO_TYPE, BO_NO
      , LEVEL
      , LPAD('   RE:', 12*(level-1), '*nbsp;')||DECODE(BO_SEC, 'Y', '비밀글임', BO_TITLE) BO_TITLE 
      -- level 에 붙는 숫자만 적용하면 
      , BO_WRITER
      , BO_HIT, BO_REC
      , TO_CHAR(BO_DATE, 'YYYY-MM-DD HH:MI') BO_DATE
      , BO_SEC
FROM BOARDVIEW
-- 조건절을 넣더라도 위치가 중요.
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
bo_title = '삭제된 게시글 입니다.' , bo_content = ' 삭제된 게시글 입니다.'
where bo_no = 1343 and bo_pass= 'SknbGf+Gu+UwwxddYCnEA/VQEEQFwQfzyqJon3AzmlXS6txg7Wd6I5SkAsZqtIsRNAQ81NH2+l9XITTvSi3k/A==';



SELECT EMPNO, ENAME, MGR
FROM EMP;

SELECT -- SELECT 안에 SELECT 이 들어가면 스칼라 쿼리
FROM  -- FROM 안에 SELECT 이 들어가면 인라인뷰
WHERE -- WHERE 안에 SELECT 이 들어가면 서브쿼리

--백터 데이터 : 방향과 사이즈를 가지고있다. SELECT 절에선 조회 될 수 없다.
-- 스칼라 쿼리  : 쿼리의 결과가  레코드가 하나, 조회되는 값도 하나 

SELECT EMPNO, ENAME, MGR,(
    SELECT COUNT(*)
    FROM EMP B
    WHERE B.MGR = A.EMPNO
) CNT
FROM EMP A;

MERGE INTO A
USING B
ON()
WHEN MATCHED THEN -- 조건에 맞는지 확인 MATCHED -- 그 조건이 맞으면 , THEN -- 조건이 맞은경우 실행하고 싶은 쿼리문

WHEN UNMATCHED THEN -- 조건이 맞지않은 경우 

MERGE INTO EMP C -- 대상 테이블
USING (
    SELECT EMPNO,(
        SELECT COUNT(*)
        FROM EMP B
        WHERE B.MGR = A.EMPNO
    ) CNT
    FROM EMP A -- 자식의 갯수에 따라 달라짐.
) D
ON(C.EMPNO = '7369' AND C.EMPNO = D.EMPNO) -- C와D를 JOIN 할 수 있는 조건 완성
WHEN MATCHED THEN
UPDATE SET ENAME = '수정'
DELETE WHERE D.CNT = 0;

ROLLBACK;



SELECT EMPNO, MGR
FROM EMP;
WHERE


-- 개시글 글번호와 자식 갯수를 샐 수 있는 쿼리문
SELECT BO_NO, (
    SELECT COUNT(*) -1 -- COUNT(*) 
    FROM BOARD B
    START WITH BO_NO = A.BO_NO
    CONNECT BY PRIOR BO_NO = BO_PARENT
) CNT
FROM BOARD A
ORDER BY BO_NO DESC;



MERGE INTO BOARD C
USING ( -- 여기 들어가는 쿼리문은 뷰 / 테이블이 아니다.
        SELECT BO_NO, (
            SELECT COUNT(*) -1 -- COUNT(*) 
            FROM BOARD B
            START WITH BO_NO = A.BO_NO
            CONNECT BY PRIOR BO_NO = BO_PARENT
        ) CNT
        FROM BOARD A
) D
ON (C.BO_NO = 1327 AND C.BO_NO = D.BO_NO)  -- 글 번호를 주어서 하나의 글만 병합 시켜본다.
WHEN MATCHED THEN
    UPDATE SET BO_TITLE = '삭제된 글의 제목'
                , BO_CONTENT = '삭제된 글의 내용'
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
        bo_no,    bo_title,    '관리자' BO_WRITER,
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