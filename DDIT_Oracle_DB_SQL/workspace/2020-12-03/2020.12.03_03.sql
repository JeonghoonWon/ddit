2020-12-03_03) 외부조인
 - 내부조인은 조인조건을 만족하지 않는 행(ROW)은 검색에서 제외
 - 외부조인은 부족한 테이블에 NULL 값으로 채워진 행을 삽입하여 조인 수행
 - 조인조건 기술시 부족한 테이블에 포함된 컬럼뒤엥 외부조인 연산자 '(+)' 를
    사용 : 일반 외부조인
 - 하나 이상의 조인 조건이 외부 조인되는 경우 모든 조인 조건에 '(+)' 연산자 사용
 - 하나의 테이블이 동시에 확장되는 외부조인은 허용되지 않은, 즉 A, B, C
    테이블을 외부조인하는 경우 A를 기중으로 B를 외부조인하는 동시에 C를
    기준으로 B를 외부조인 하지 못함
    ex) WHERE A.Col = B.Col(+)
          AND C.Col = B.Col(+) -- 허용 안됨
   
  - 일반조건이 추가된 외부조인은 일반외부조인을 사용하면 내부조인 결과를
    반환 --> ANSI 외부조인 이나 Subquery 를 이용해야 함
   (ANSI 외부조인 사용 형식)
   SELECT 컬럼 list
     FROM 테이블명[별칭]
    FULL|RIGHT|LEFT OUTER JOIN 테이블명[별칭] ON(조인조건)
     [AND 일반조건1])]
    FULL|RIGHT|LEFT OUTER JOIN 테이블명[별칭] ON(조인조건)
     [AND 일반조건2])]  
    [WHERE 일반조건]
      . FULL : 양쪽 테이블 모두 확장
      . RIGHT : 테이블명2가 테이블명1보다 더 많은 종류의 자료가 있는 경우(
      테이블명1이 확장되는 경우)
      . LEFT : 테이블명1이 테이블명2보다 더 많은 종류의 자료가 있는 경우(
      테이블명2가 확장되는 경우)
      . WHERE 절의 일반조건은 전체에 적용될 조건
      
    예) 모든 회원들에 대한 매출집계를 조회하시오.
    Alias 회원번호, 회원명, 매출액합계
    SELECT A. MEM_ID AS 회원번호, 
           A. MEM_NAME AS 회원명, 
           NVL(SUM(B. CART_QTY * C. PROD_PRICE),0) AS 매출액합계
      FROM MEMBER A, CART B, PROD C
     WHERE A.MEM_ID=B.CART_MEMBER(+)
       AND B.CART_PROD=C.PROD_ID
     GROUP BY A.MEM_ID, A.MEM_NAME
     ORDER BY 1;
     
    (ANSI JOIN) 
    SELECT A. MEM_ID AS 회원번호, 
           A. MEM_NAME AS 회원명, 
           NVL(SUM(B. CART_QTY * C. PROD_PRICE),0) AS 매출액합계
      FROM MEMBER A
      LEFT OUTER JOIN CART B ON(MEM_ID=B.CART_MEMBER)
      LEFT OUTER JOIN PROD C ON(B.CART_PROD=C.PROD_ID)
     GROUP BY A.MEM_ID, A.MEM_NAME
     ORDER BY 1;
    
  예) 2005년 2월에 매입한 모든 상품별 매입집계를 조회하시오.
      Alias 상품코드, 사품명, 매입수량, 매입금액
      
 (일반외조인)   
    SELECT A.BUY_PROD AS 상품코드,
           B.PROD_NAME AS 상품명,
           SUM(A.BUY_QTY) AS 매입수량,
           SUM(A.BUY_QTY*A.BUY_COST) AS 매입금액
      FROM BUYPROD A, PROD B
     WHERE A.BUY_PROD(+)=B.PROD_ID
--       AND A.BUY_DATE BETWEEN '20050201' AND '20050228'
     GROUP BY A.BUY_PROD, B.PROD_NAME;
     
 (ANSI FORMAT)     
      SELECT B.PROD_ID AS 상품코드, 
             B.PROD_NAME AS 상품명, 
          NVL(SUM(A.BUY_QTY),0) AS 매입수량, 
          NVL(SUM(A.BUY_QTY*A.BUY_COST),0) AS 매입금액
         FROM BUYPROD A 
        RIGHT OUTER JOIN PROD B ON (A.BUY_PROD = B.PROD_ID
          AND A.BUY_DATE BETWEEN '20050201' AND '20050228')
        GROUP BY B.PROD_ID,B.PROD_NAME;
        
   (Subquery)
    SELECT     B.PROD_ID AS 상품코드, 
               B.PROD_NAME AS 상품명, 
               NVL(A.CNT,0) AS 매입수량, 
               NVL(A.AMT,0) AS 매입금액
          FROM (SELECT BUY_PROD AS BID, 
          NVL(SUM(BUY_QTY),0) AS CNT, 
          NVL(SUM(BUY_QTY*BUY_COST),0) AS AMT 
          FROM BUYPROD WHERE BUY_DATE BETWEEN '20050201' AND '20050228' 
          GROUP BY BUY_PROD) A,PROD B
      WHERE A.BID(+)=B.PROD_ID
      ORDER BY 1; 
      
  예제) 모든 분뷰별 상품의 수를 조회하시오.
    Alias 상품분류코드,  분류명, 상품의 수
    
    SELECT B. LPROD_GU AS 상품분류코드,
           B. LPROD_NM AS 분류명,
     COUNT (A.PROD_TOTALSTOCK) AS "상품의 수"
    FROM PROD A, LPROD B
    WHERE A.PROD_LGU(+)=B.LPROD_GU
    GROUP BY B.LPROD_GU, B.LPROD_NM
    ORDER BY 1;
    
    SELECT DISTINCT PROD_LGU FROM PROD;
    
    
  (ANSI JOIN)
    SELECT A. LPROD_GU AS 상품분류코드,
           A. LPROD_NM AS 분류명,
     COUNT (PROD_ID)AS "상품의 수"
    FROM LPROD A
    LEFT OUTER JOIN PROD B ON (B.PROD_LGU=A.LPROD_GU)
    
    GROUP BY A.LPROD_GU, A.LPROD_NM
    ORDER BY 1;
    
 예제) 사원테이블에서 모든 부서별 평균급여를 계산하시오.
    평균급여는 소숫점없이 출력하고, 부서코드, 부서명, 평균급여를 출력
        
    SELECT A.DEPARTMENT_ID AS 부서코드,
           A.DEPARTMENT_NAME AS 부서명,
           NVL(ROUND(AVG(B.SALARY)),0) AS 평균급여
      FROM DEPARTMENTS A,EMPLOYEES B
     WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID(+)
     GROUP BY A.DEPARTMENT_ID,A.DEPARTMENT_NAME
     ORDER BY 1,2;
    
   (ANSI JOIN) 
      SELECT B.DEPARTMENT_ID AS 부서코드,
           NVL(B.DEPARTMENT_NAME,'사장') AS 부서명,
           NVL(ROUND(AVG(A.SALARY)),0) AS 평균급여
      FROM EMPLOYEES A
      FULL OUTER JOIN DEPARTMENTS B ON(B.DEPARTMENT_ID=A.DEPARTMENT_ID)
     GROUP BY B.DEPARTMENT_ID,B.DEPARTMENT_NAME
     ORDER BY 1;
     
  예제) 2005년 6월 제품별 입출고 현황을 조회하시오
   Alias 상품코드, 상품명, 입고수량, 매입액, 출고수량, 매출액
   
   SELECT C.PROD_ID AS 상품코드,
          C.PROD_NAME AS 상품명,
          NVL(SUM(A.BUY_QTY),0) AS 입고수량,
          NVL(SUM(A.BUY_QTY*C.PROD_COST),0) AS 매입액,
          NVL(SUM(B.CART_QTY),0) AS 출고수량,
          NVL(SUM(B.CART_QTY*C.PROD_PRICE),0) AS 매출액
     FROM BUYPROD A
    RIGHT OUTER JOIN PROD C ON(A.BUY_PROD=C.PROD_ID
      AND A.BUY_DATE BETWEEN '20050601' AND '20050630')
     LEFT OUTER JOIN CART B ON(B.CART_PROD=C.PROD_ID
      AND SUBSTR(B.CART_NO,1,6)='200506')
    GROUP BY C.PROD_ID, C.PROD_NAME
    ORDER BY 1;
    
    
      
    