 2020-12-02_01)
 예) 상품테이블에서 상품 분류코드가 'P200' 대의 상품을 조회하시오.
  Alias 상품코드, 상품명, 분류코드, 분류명, 판매가격이다.
 
 (일반조인) 
   -- (내생각) Alias 를 보고 SELECT 에 들어갈 테이블을 생각하고 
   -- 어떤 상위 테이블에있는지 FROM에 먼저 적용
   
 SELECT  A. PROD_ID AS 상품코드, 
         A. PROD_NAME AS 상품명, 
         A. PROD_LGU AS 분류코드, 
         B. LPROD_NM AS 분류명, 
         A. PROD_PRICE AS 판매가격    
    FROM PROD A, LPROD B
    WHERE A. PROD_LGU LIKE 'P2%' -- 일반조건
      AND A. PROD_LGU = B.LPROD_GU
      ORDER BY 3;

(ANSI 조인)
  SELECT A. PROD_ID AS 상품코드, 
         A. PROD_NAME AS 상품명, 
         A. PROD_LGU AS 분류코드, 
         B. LPROD_NM AS 분류명, 
         A. PROD_PRICE AS 판매가격    
    FROM PROD A   -- ANSI 조인을 할땐 FROM 절에 테이블이 하나만 나온다.
  INNER JOIN LPROD B ON(A.PROD_LGU=B.LPROD_GU) -- 조인조건
    WHERE A. PROD_LGU LIKE 'P2%' -- 일반조건
    ORDER BY 3;
    
 예제) 2005년 1월 1일 ~ 15일 동안 발생된 매입정보를 조회하시오.
    Alias 일자, 상품코드, 상품명, 수량, 금액
   
   (일반조인)
    SELECT B. BUY_DATE AS 일자, 
           A. PROD_ID AS 상품코드, 
           A. PROD_NAME AS 상품명, 
           B. BUY_QTY AS 수량, 
           B. BUY_COST*BUY_QTY AS 금액
      FROM PROD A, BUYPROD B
     WHERE B. BUY_DATE BETWEEN '20050101' AND '20050115'
       AND A.PROD_ID = B. BUY_PROD
    ORDER BY 1;
    
    (ANSI 조인) 
    SELECT B. BUY_DATE AS 일자, 
           A. PROD_ID AS 상품코드, 
           A. PROD_NAME AS 상품명, 
           B. BUY_QTY AS 수량, 
           B. BUY_COST*BUY_QTY AS 금액
    FROM PROD A
    INNER JOIN BUYPROD B ON(A.PROD_ID = B. BUY_PROD
    AND B. BUY_DATE BETWEEN TO_DATE('20050101') AND '20050115')
    ORDER BY 1;
   
   
 예제) 2005년 5월 제품별 매입/매출현황을 조회하시오.
  Alias 상품코드, 제품명, 매출액합계, 매입액합계
 
 (외부조인-ANSI)
     SELECT C. PROD_ID AS 상품코드, 
            C. PROD_NAME AS 제품명, 
            SUM (A.CART_QTY * C. PROD_PRICE)매출액합계, 
            SUM (B.BUY_QTY * B.BUY_COST) AS 매입액합계
       FROM CART A, BUYPROD B, PROD C
      WHERE A.CART_PROD=C.PROD_ID
        AND B.BUY_PROD=C.PROD_ID
        AND A.CART_NO LIKE '200505%'
        AND B.BUY_DATE BETWEEN '20050501' AND '20050531'
   GROUP BY C.PROD_ID, C.PROD_NAME
   ORDER BY 1;
   
   
     SELECT C. PROD_ID AS 상품코드, 
            C. PROD_NAME AS 제품명, 
       SUM (A.CART_QTY * C. PROD_PRICE)AS 매출액합계, 
       FROM CART A, PROD C
      WHERE A.CART_PROD=C.PROD_ID
        AND A.CART_NO LIKE '200505%'
   GROUP BY C.PROD_ID, C.PROD_NAME
   ORDER BY 1;
    
    
 (외부조인-ANSI)
  SELECT    C. PROD_ID AS 상품코드, 
            C. PROD_NAME AS 제품명, 
            SUM (A.CART_QTY * C. PROD_PRICE)매출액합계, 
            SUM (B.BUY_QTY * B.BUY_COST) AS 매입액합계
       FROM CART A
       RIGHT OUTER JOIN PROD C ON (A.CART_PROD = C.PROD_ID
         AND A.CART_NO LIKE '200505%')  
       LEFT OUTER JOIN BUYPROD B ON (B.BUY_PROD=C.PROD_ID)
         AND B.BUY_DATE BETWEEN '20050501' AND '20050531'
   GROUP BY C.PROD_ID, C.PROD_NAME
   ORDER BY 1;
    -- LEFT OUTER JOIN 와 RIGHT OUTER JOIN 는 기준 테이블을 가리키는 구문
    -- WHERE 절 대신 ON 절에 조인조건을 넣어준다.
  예제) 2005년 1~6월 사이 거래처별 매입현황을 조회하시오.
    Alias 거래처코드 ,거래처명, 매입액합계
   
  (일반조인)  
    SELECT A. BUYER_ID AS 거래처코드,
           A. BUYER_NAME AS 거래처명, 
           SUM(C.BUY_QTY * B.PROD_COST) AS 매입액합계
      FROM BUYER A, PROD B, BUYPROD C
     WHERE C.BUY_PROD = B.PROD_ID
       AND A.BUYER_ID = B.PROD_BUYER
       AND C.BUY_DATE BETWEEN '20050101' AND '20050630'
  GROUP BY A.BUYER_ID ,A. BUYER_NAME
  ORDER BY 1;
  
  (ANSI JOIN)
   SELECT A. BUYER_ID AS 거래처코드,
           A. BUYER_NAME AS 거래처명, 
           SUM(C.BUY_QTY * B.PROD_COST) AS 매입액합계
      FROM BUYER A
      INNER JOIN PROD B ON (A.BUYER_ID=B.PROD_BUYER)
      INNER JOIN BUYPROD C ON (C. BUY_PROD=B.PROD_ID)
        AND C.BUY_DATE BETWEEN '20050101' AND '20050630'
  GROUP BY A.BUYER_ID ,A. BUYER_NAME
  ORDER BY 1;
  
  
  예제) 장바구니테이블에서 2005년 5월 회원별 구매금액을 조회하시오.
  Alias 회원번호, 회원명, 구매액
  
  (일반조인) 
     SELECT A. MEM_ID AS 회원번호, 
            A. MEM_NAME AS 회원명, 
       NVL(SUM (C.PROD_PRICE*B.CART_QTY),0) AS 구매액
      FROM MEMBER A, CART B, PROD C
     WHERE A.MEM_ID = B.CART_MEMBER  -- 조인조건(회원이름)
       AND B.CART_PROD = C.PROD_ID   -- 조인조건(PROD_PRICE)
       AND TO_DATE(SUBSTR(B.CART_NO,1,8))BETWEEN '20050501' AND '20050531'
         --   AND B.CART_NO LIKE'200505%' 와 동일
  GROUP BY A.MEM_ID, A.MEM_NAME
  ORDER BY 1;
  
  (ANSI INNER JOIN)
    SELECT A. MEM_ID AS 회원번호, 
           A. MEM_NAME AS 회원명, 
      NVL(SUM (C.PROD_PRICE*B.CART_QTY),0) AS 구매액
      FROM MEMBER A 
     INNER JOIN CART B ON (A.MEM_ID=B.CART_MEMBER)
     INNER JOIN PROD C ON (B.CART_PROD=C.PROD_ID)
       AND TO_DATE(SUBSTR(B.CART_NO,1,8))BETWEEN '20050501' AND '20050531'
  GROUP BY A.MEM_ID, A.MEM_NAME
  ORDER BY 1;
  
 예제) 사원테이블에서 관리자(MANAGER_ID)별 사원정보를 조회하시오.
  -- ?????????????????????????????????????????????????????
  Alias 관리자번호, 관리자명, 소속사원수, 부서명
  SELECT A. MANAGER_ID AS 관리자번호, 
         A. EMP_NAME AS 관리자명, 
         COUNT (A.DEPARTMENT_ID) AS 소속사원수, 
         B. DEPARTMENT_NAME AS 부서명
  FROM EMPLOYEES A,  DEPARTMENT B
  WHERE A. DEPARTMENT_ID = B. DEPARTMENT_ID
  GROUP BY A. MANAGER_ID, A. EMP_NAME, B. DEPARTMENT_NAME
  ORDER BY 1;
  -- ?????????????????????????????????????????????????????
  
  
  
  
  