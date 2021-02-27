2020-11-25-01) 숫자함수
1. 수학적함수
 - ABS(n) : n의 절대값 반환
 - SIGN(n) : n의 부호에 따라 0인경우 0, 양수이면 1, 음수이면 -1을 반환
 - SQRT(n) : n의 평방근(ROOT)
 - POWER(n1,n2) : n1의 n2승 값을 반환
 
 예) 상품테이블에서 상품의 매입단가와 할인판매단가를 비교하여 
     이익정도를 나타낼수 있도록 조회하시오.
     Alias 상품코드, 상품명, 매입단가, 할인판매가, 이익여부
     *비고에 이익이 발생되면 '정상' 이익이 없으면 '원가판매'
     손해가 발생되면 '재고처분상품' 이라고 출력하시오.
     SELECT PROD_ID AS 상품코드, 
            PROD_NAME AS 상품명, 
            PROD_COST AS 매입단가, 
            PROD_SALE AS 할인판매가, 
            CASE WHEN SIGN(PROD_SALE-PROD_COST) = 1 THEN 
                    '정상제품';
                 WHEN SIGN(PROD_SALE-PROD_COST) = 0 THEN    
                    '원가판매상품'
                    ELSE '재고처분상품' END AS 비고
      FROM PROD;
     
  **표현식 (CASE WHEN THEN ~ END)
   - 조건을 판단하여 처리할 명령을 다르게 선택할 때 사용(IF문과 비슷한 기능)
   - SELECT 절에서 사용
   (사용형식)
   CASE WHEN 조건1 THEN
             명령1
        WHEN 조건2 THEN
             명령2
              :
        ELSE
             명령n
  END
  
 예) 회원테이블에서 주민번호를 이용하여 성별을 구분하시오. 단, 대전지역에 
     거주하는 회원정보를 조회하시오.
    Alias 회원번호, 회원명, 주소, 성별
    SELECT MEM_ID AS 회원번호, 
           MEM_NAME AS 회원명, 
           MEM_ADD1||' '||MEM_ADD2 AS 주소, 
           CASE WHEN SUBSTR(MEM_REGNO2,1,1)='2' OR 
                     SUBSTR(MEM_REGNO2,1,1)='4' THEN
                     '여성회원'
                WHEN SUBSTR(MEM_REGNO2,1,1)='1' OR
                     SUBSTR(MEM_REGNO2,1,1)='3' THEN
                     '남성회원'
                ELSE
                     '데이터 오류' END AS 성별
     FROM MEMBER
     WHERE MEM_ADD1 LIKE '대전%';
    
    
  2. GREATEST(n1,n2[,n3,...]), LEAST(n1,n2[,n3,....])
    - GREATEST : 주어진 수 n1,n2[,n3,....] 중 제일 큰 수를 반환
    - LEAST : 주어진 수 n1,n2[,n3,....] 중 제일 작은  수를 반환 
    
 예)
 SELECT GREATEST(20,-15,70), LEAST('탁원재','오성순','정은실')
   FROM DUAL;
   SELECT GREATEST(20,-15,70), LEAST('오성김','오성순','정은실')
   FROM DUAL; 
  
  예제) 회원테이블에서 마일리지가 1000미만인 회원들의 마일리지를 1000으로
  부여하려 한다. 이를 구현하시오.(GREATEST) 사용)
  Alias 회원번호, 회원명, 마일리지
    SELECT MEM_ID AS 회원번호, 
           MEM_NAME AS 회원명, 
           MEM_MILEAGE AS 마일리지,
           GREATEST(MEM_MILEAGE,1000) AS 마일리지
      FROM MEMBER;
      
 3. ROUND(n1[,1]), TRUNC(n[,1])
    - ROUND : 주어진 자료 n을 l+1번째 자리에서 반올리하여 1자리까지 표현
    - TRUNC : 주어진 자료 n을 l+1번째 자리에서 자리버림하여 1자리까지 표현
    - l 이 음수이면 정수부분 1자리에서 반올림(ROUND), 자리버림(TRUNC)
    - l 이 생략되면 0으로 간주 -- l = 알파벳 엘
    
 예)사원테이블에서 각 부서별 평균임금을 조회하시오.
    평균임금은 소수 2자리까지 출력하시오.
    Alias 부서코드, 부서명, 평균임금
    
    SELECT A.DEPARTMENT_ID AS 부서코드, 
           DEPARTMENTS.DEPARTMENT_NAME AS 부서명, 
          TO_CHAR(ROUND(AVG(A.SALARY),2),'99,999.99') AS 평균임금
      FROM EMPLOYEES A, DEPARTMENTS
     WHERE A.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID -- WHERE 절에 있는 DEPARTMENT_ID
                                         -- 가 EMPLOYEES와 DEPARTMENT에 있기때문에
                                         -- 어디서 정보를 가져와야하는지 정해줘야함.
                                         -- SELECT 와 FROM 에 A로 표시해서 나타냄.
                                         
                                         
  GROUP BY A.DEPARTMENT_ID, DEPARTMENTS.DEPARTMENT_NAME
  ORDER BY 1;
 
 
 예제]사원테이블을 이용하여 사원들의 급여를 지급하려한다.
     지급액은 보너스+급여-세금이고 보너스는 영업실적(COMMISSION_PCT)*급여
     이다. 또 세금은 보너스+급여의 3%이다.
     Alias 사원번호, 사원명, 부서코드, 급여, 보너스, 세금, 지급액
            소수 첫자리까지 나타내시오.
            
     SELECT EMPLOYEE_ID AS 사원번호, 
            EMP_NAME AS 사원명, 
            DEPARTMENT_ID AS 부서코드, 
            SALARY AS 급여, 
            ROUND(NVL(COMMISSION_PCT*SALARY,0),1) AS 보너스, -- NVL = 값이 NULL 이면 0으로 표시하시오.
            TRUNC((SALARY+NVL(COMMISSION_PCT*SALARY,0))*0.03,1) AS 세금,
            SALARY+ROUND(NVL(COMMISSION_PCT*SALARY,0),1)-
            TRUNC((SALARY+NVL(COMMISSION_PCT*SALARY,0))*0.03,1) AS 지급액
            
            
       FROM EMPLOYEES;
    
     
     
    ALTER TABLE EMPLOYEES
        MODIFY EMP_NAME VARCHAR2(80);
        
    UPDATE EMPLOYEES
       SET EMP_NAME=TRIM(EMP_NAME);
    
 
 
      
           
           