2020-11-24-01)
 3) UPPER, LOWER -- UPPER = 대문자로 변환 LOWER = 소문자로 변환
    - 주어진 문자열에 포함된 글자를 대문자(UPPER) 또는 소문자(LOWER)로
      변환하여 반환
      (사용형식)
      UPPER(c), LOWER(c)
      
 예) 회원테이블에서 'R001' 회원 정보를 조회하시오.
     Alias 는 회원번호, 회원명, 직업, 마일리지
     
     SELECT MEM_ID AS 회원번호, 
            MEM_NAME AS 회원명, 
            MEM_JOB AS 직업, 
            MEM_MILEAGE AS 마일리지
     FROM MEMBER
     WHERE UPPER(MEM_ID)='R001';  
     -- 제목까지 출력이 된 경우 자료가 없거나 프로그램 로직에 문제가 생긴 것(실행 오류 이다.)
     -- 지금 조회하는 정보(회원ID)가 대문자이고 자료에 대문자인지 소문자인지 확실하게 알지 못할때, 
     -- UPPER(MEM_ID), MEM_ID 를 대문자로 변경 후 조회 한다.

 예) 분류테이블에서 'P200'번 대의 분류코드를 조회하시오.
    Alias 분류코드, 분류명 
    SELECT LPROD_GU AS 분류코드, 
           LPROD_NM AS 분류명 
    FROM LPROD
    WHERE UPPER(LPROD_GU) LIKE 'P2%';
  
  4) ASCII, CHR   --ASCII(American Standard Code for Information Interchange,미국정보교환표준부호)
  - ASCII : 주어진 문자자료를 ASCII 코드값으로 변환
  - CHR : 주어진 숫자(정수,1~65535)에 대응하는 문자 반환
   (사용형식)
   ASCII(c), CHR(n)
   
 예)
    SELECT ASCII('Oracle'),
           ASCII('대한민국'),
           CHR(95)
      FROM DUAL;
   
 5) LPAD, RPAD
    -특정문자열(패턴)을 삽입할때 사용
    (사용형식)
    LPAD(c, n [,pattern]), RPAD(c, n [,pattern])
     - 주어진 문자열 'c'를 길이 'n'의 기억공간에 왼쪽부터 채우고(RPAD)| 
       오른쪽부터 채우고(LPAD)남는공간은 'pattern'으로 정의된 문자열을 채움
       --채우고 남은 공간을 기준으로 잡는다 (RPAD)
     - 'pattern'이 생략되면 공백으로 채워짐
 
 예) 회원테이블에서 회원의 암호를 10 자리 공간에 우측 정렬하고 남은 공간에 
    '#'을 삽입하시오.
    Alias 회원정보, 회원명, 암호
 
    SELECT MEM_ID AS 회원정보, 
           MEM_NAME AS 회원명, 
           MEM_PASS AS 암호1,
           LPAD(MEM_PASS,10,'#') AS 암호2
      FROM MEMBER;
 
 예) 매입테이블에서 2005년 2월 매입현황을 조회하시오.
    Alias 날짜, 매입상품코드, 수량, 단가 
    단, 매입단가는 9자리에 출력하되 남은 왼쪽 공간에 '*'를 삽입하여 출력하시오.
    
    SELECT BUY_DATE AS 날짜, 
           BUY_PROD AS 매입상품코드, -- 12자리 까지만 쓸 수 있음. 너무 길면 오류 남
           RPAD(BUY_QTY,5) AS 수량, 
           LPAD(BUY_COST,9,'*') AS 단가
      FROM BUYPROD
     WHERE BUY_DATE BETWEEN '20050201' AND '20050228';
     
 6) LTRIM, RTRIM, TRIM -- 주로 공백을 제거할때 사용한다
  - 주어진 문자열에서 왼쪽(LTRIM) 또는 오른쪽(RTRIM)에 존재하는 문자열을
    찾아 삭제할때 사용
  - 양쪽에 존재하는 공백을 제거할때는 TRIM 사용
  (사용형식)
  LTRIM(c1 [,c2]), RTRIM(c1[,c2]), TRIM(c1)
    - c2가 생략되면 공백을 삭제
    
 예) 사원테이블의 사원명컬럼의 데이터 타입을 CHAR(80)으로 변경하시오.
    ALTER TABLE EMPLOYEES
        MODIFY EMP_NAME CHAR(80);
 예) 사원테이블에서 'Steven King' 사원정보를 조회하시오.
    Alias 사원번호, 사원명, 부서코드, 입사일
    SELECT EMPLOYEE_ID AS 사원번호, 
           EMP_NAME AS 사원명, -- 사원명에 있는 공백 지우기 TRIM(EMP_NAME) AS 사원명
           DEPARTMENT_ID AS 부서코드, 
           HIRE_DATE AS 입사일
      FROM EMPLOYEES
     WHERE TRIM(EMP_NAME)='Steven King';
     
예) 상품테이블에서 상품명중 왼쪽에 존재하는 '대우'로 시작하는 상품명중 '대우'를 삭제하고 출력하시오.
    Alias 상품코드, 상품명, 분류코드, 거래처코드
    SELECT PROD_ID AS 상품코드, 
           PROD_NAME AS 상품명1,
           LTRIM(PROD_NAME,'대우 ') AS 상품명2, -- 왼쪽부터 대우글자와 공백한칸을 자르는것
           PROD_LGU AS 분류코드, 
           PROD_BUYER AS 거래처코드
    FROM PROD
    WHERE PROD_NAME LIKE '대우%';
 
 7) SUBSTR(c,n1[,n2])
  - 주어진 문자열에서 n1에서 시작하여 n2(갯수) 만큼의 부분 문자열을 추출하여
    반환
  - n2 가 생략되면 n1 이후의 모든 문자열을 추출하여 반환
  - n1 가 음수이면 뒤에서 부터 처리됨
  - n1은 1부터 counting -- Oracle 에서 0은 없다
  
  예)
    SELECT SUBSTR('IL POSTINO', 3,4), -- 3번째까지(공백포함) 제외하고 나머지 4글자(공백포함) 출력
           SUBSTR('IL POSTINO', 3), -- 3번째까지(공백포함) 제외하고 나머지 글자 출력
           SUBSTR('IL POSTINO', -3,4) -- -3번째까지(공백포함) 제외하고 나머지 4글자(공백포함) 출력
           SUBSTR('IL POSTINO', -3,2) -- -3번째까지(공백포함) 제외하고 나머지 2글자(공백포함) 출력 
      FROM DUAL;
      
 예) 상품테이블에서 분류코드'P201'에 속한 상품의 가지수를 출력하시오.
    SELECT COUNT(*) AS 상품의 수
      FROM PROD
     WHERE UPPER(SUBSTR(PROD_ID,1,4)) = 'P201'; 
     
 예) 장바구니테이블에서 2005년 3월에 판매된 상품정보를 상품별로 출력하시오.
    Alias 상품코드, 상품명, 수량합계, 판매금액
    -- CART_MEMBER 
    -- CART_NO 날짜와 로그인된 순번 
    
    SELECT A.CART_PROD AS 상품코드,
           B.PROD_NAME AS 상품명,
           NVL(SUM(A.CART_QTY,0) AS 수량합계,
           NVL(SUM(A.CART_QTY*B.PROD_PRICE),0) AS 판매금액
      FROM CART A, PROD B
     WHERE SUBSTR(CART_NO,1,6)='2005037'; -- CART_NO LIKE'200503%'
       AND A.CART_PROD=B.PROD_ID-- JOIN 주키와 외래키를 비교할때 사용 
  GROUP BY A.CART_PROD,B.PROD_NAME
  ORDER BY 1;
     
 예제] 회원테이블에서 '대전'에 살고있는 회원정보를 조회하시오.
    Alias 회원번호, 회원명, 주소, 직업 ,마일리지
    단, LIKE 연산자는 사용하지 말 것
    SELECT MEM_ID AS 회원번호, 
           MEM_NAME AS 회원명, 
           MEM_ADD1||MEM_ADD2 AS 주소, 
           MEM_JOB AS 직업 ,
           MEM_MILEAGE AS 마일리지
    FROM MEMBER
     WHERE SUBSTR(MEM_ADD1,1,2)='대전'; 
     
 예제] 오늘이 2005년 7월 28일이라고 가정하고 CART_NO를 자동으로 생성하는 코드를 작성하시오.
    1. 2005년 7월 28일 최대 순번 MAX
    SELECT TO_NUMBER(MAX(SUBSTR(CART_NO,9))+1)
      FROM CART
     WHERE SUBSTR(CART_NO,1,8)='20050728';
    2. 날짜와 1번에서 구한 순번+1을 결합
     SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||
            TRIM(TO_CHAR(TO_NUMBER(MAX(SUBSTR(CART_NO,9))+1),'00000')) 
            -- TO_NUMBER 생략가능하지만 정확하게 형을 지정하기 위해 사용함.
            -- 오류가 발생하더라도 찾아내기 쉽다.
            
      FROM CART
     WHERE SUBSTR(CART_NO,1,8)='20050728';
        
    SELECT MAX(CART_NO)+1 -- 모두 문자열이기 때문에 가능, 숫자가 있으면 불가능 하다
      FROM CART
     WHERE SUBSTR(CART_NO,1,8)='20050728';
   
    
 예제] 분류테이블에서 '여성정장' 분류코드를 신규로 등록시킬때 'P200'번대의 코드를 생성하시오
    SELECT 'P'||(MAX(SUBSTR(LPROD_GU,2))+1) 
      FROM LPROD
     WHERE LPROD_GU LIKE 'P2%';

  
  8) REPLACE(c1,C2,[,C3])
  - 주어진 문자열 C1에서 C2를 C3로 대치(치환) 시킴
  - C3가 생략되면 C2를 제거함.
  
  예) 상품테이블에서 상품명 중 '대우'를 찾아 'Apple'로 변경하시시오.
       -- 글자 사이의 공백을 제거할때 REPLACE 사용함 
       -- 전화번호 통일 할 때 사용함
       -- 010-000-0000, 010.000.0000 등 을 입력하기 때문에 '.' , '-'를 ' '공백으로 변환 후 공백 삭제
  SELECT PROD_ID,
         PROD_NAME,
         REPLACE(PROD_NAME,' ')
    FROM PROD
   WHERE PROD_NAME lIKE'%대우%';
   
    '   HHF   HF    '
        '   HHVC    HF   '
        '   H          HF    '
  
  
  9) LENGTH(c), LENGTHB(c), 
    -주어진 문자열에서 글자수(LENGTH) 또는 기억공간의 크기(BYTE수, LENGTHB)
     변환
   
   --FORM 용지에 출력 시킬때 사용 ex)고지서에 금액 표기 할때
   
   
      
     