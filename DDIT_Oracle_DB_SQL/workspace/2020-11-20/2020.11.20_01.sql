 2020-11-20-01) 연산자
 SELECT 문
    - 데이터를 조회하는 명령
    - SQL 명령 중 가장 많이 사용되는 명령
    (사용형식)
 SELECT [DISTINCT]|*|컬럼명 [AS]["컬럼별칭["], --아스트릭스(*)모든 열 정보를 조회하라 / 그중 원하는것만 출력할땐 컬럼별칭을 붙인다.
        컬럼명 [AS]["]컬럼별칭["], --되도록 [AS]["]컬럼별칭["] 형태로 기입해준다.
                :
        컬럼명 [AS]["]컬럼별칭["]
    FROM 테이블명 -- 
    [WHERE 조건] --WHERE 절을 생략 하면 SELECT 된 TABLE 에 있는 모든 행이 선택
    [GROUP BY 컬럼명[,컬럼명,...]]
    [HAVING 조건]
    [ORDER BY 컬럼명|컬럼인덱스[ASC|DESC],[컬럼명|컬럼인덱스[ASC|DESC],...]; --WHERE , GROUP BY, HAVING, ORDER BY 순서로 기입해야함
    -- ORDER BY 오름차순 = ASC    
    -- ORDER BY 내림차순 = DESC 
    -- 정해진 순번으로 나타남.
     
  . '[DISTINCT]' : 중복된 자료를 배제할 때 사용
    '컬럼별칭' : 컬럼에 부여된 또 다른 이름
    - 컬럼명 AS 별칭 
    - 컬럼명 별칭
    - 컬럼명 AS "별칭" : 별칭에 특수문자(공백포함)가 포함된 경우 반드시 " "로 묶어서 사용
    -'컬럼인덱스' : SELECT 절에서 기술된 해당 컬러의 순번(1부터 COUNTING)
    -'ASC|DESC' : 정렬방법(ASC:오름차순으로 기본값, DESC는 내림차순)
    - SELECT문의 실행순서 : FROM절 -> WHERE 절 이하 -> SELECT 절
    
 1. 연산자
  - 산술연산자(+.-,*,/) --ORACLE 에는 나머지 연산자( % ) 없다
  - 관계연산자(>,<,>=,<=,=,!=(<>))--6개 대소관계를 비교할 때 / 크거나 같다, 작거나 같다 를 표시할때 >=,<= (=는 뒤에 위치)
  - 논리연산자 (AND, OR, NOT) -- 단어로 사용(기호 사용 안함)
  
  2. 함수(FUNCTION) -- JAVA 의 메소드 라고 생각하면 됨.
   - 특정 기능을 수행하여 하나의 결과를 반환하도록 설계된 모듈
   -컴파일되어 실행 가능한 상태로 제공
   -문자열, 숫자, 변환, 날짜, 집계함수의 형태로 제공
   1)문자열 함수
    - 문자열 조작한 결과를 반환
** 문자열 연산자 '||'
    자바의 문자열 연산자 '+'와 같이 두 문자열을 결합하여 하나의 문자열을 반환

예)
SELECT 'Oracle' ||','|| 'Modeling' FROM DUAL;

예)회원테이블에서 회원번호, 회원명, 주민번호를 조회하시오.
    단, 주민번호는 'XXXXXX-XXXXXXX' 형식으로 출력하시오.
 
  SELECT MEM_ID AS 회원번호, 
         MEM_NAME AS 회원명, 
         MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호
    FROM MEMBER;
    

예) 회원테이블에서 여성회원들의 정보를 조회하시오.
    Alias는 회원번호, 회원명, 주소, 마일리지
    SELECT MEM_ID AS 회원번호, 
           MEM_NAME AS 회원명, 
           MEM_ADD1||' '||MEM_ADD2 AS 주소, 
           MEM_MILEAGE AS 마일리지
    FROM MEMBER
    WHERE SUBSTR(MEM_REGNO2,1,1)='2' OR SUBSTR(MEM_REGNO2,1,1)='4'
    ORDER BY 4 DESC;  -- 4번째를 기준으로 내림차순으로 정리
    
    
 1)CONCAT
    -주어진 두 개의 문자열을 결합하여 하나의 문자열을 반환
    - '||' 연산자와 같은 기능
    (사용형식)
    CONCAT(C1,C2)
        .C1과 C2를 결합하여 결과를 반환    

 예)회원테이블에서 회원번호, 회원명, 주민번호를 조회하시오.
    단, 주민번호는 'XXXXXX-XXXXXXX' 형식으로 출력하되 CONCAT 함수 사용 
    
     SELECT MEM_ID AS 회원번호, 
            MEM_NAME AS 회원명, 
            CONCAT(CONCAT(MEM_REGNO1,'-'),MEM_REGNO2) AS 주민번호  -- 함수는 다른 함수를 포함 할 수 있다. 안에 있는 함수 먼저 실행
    FROM MEMBER;
    
drop table temp09;
 
 데이터 카피할 때 dmp 파일로 만들어서 import 하는 방법   
 imp wjh12/java file=expall.dmp ignore=y grants=y rows=y indexes=y full=y    
    
 예) 회원테이블에서 회원번호와 회원명을 조회하시오.
 SELECT MEM_ID,MEM_NAME  -- 내가 기술한 컬럼명을 원하는대로 설정(컬럼별칭) 해서 뽑아낼 수 있다.
    FROM MEMBER;
    
 SELECT MEM_ID AS "회원번호",
        MEM_NAME AS "회원이름"
    FROM MEMBER;
    
  2)INITCAP
  - 단어의 선두문자만 대문자로 출력
  - 보통 이름 출력시 사용
  (사용형식)
  INITCAP(c1)
   . c1에 포함된 단어의 첫 글자를 대문자로 변환
   
   예)
   UPDATE EMPLOYEES
   SET EMP_NAME=LOWER(EMP_NAME);
    
    SELECT EMP_NAME FROM EMPLOYEES;
    
    SELECT INITCAP(EMP_NAME) FROM EMPLOYEES;
    
    ROLLBACK;
    
    COMMIT;
    
    
    
    
 BUYER
 BUYER_ID
 _NAME
 _LGU 거래처 상품 분류코드
 _BANK 은행
 _BANKNO 계좌번호
 _ZIP 우편번호
 _ADD1 기본주소
 _ADD2 상세주소
 _COMTEL
 _FAX
 MAIL
 
 BUYPROD 매입테이블
 BUY_DATE 구매일
 _PROD 상품
 _QTY 수량
 _COST 매입가
 _PRICE 판매가
 
 LPROD
 _ID
 _GU 
 _NM 분류명
 CART 매출 정보
 _MEMBER 고객번호
 _NO CHAR(13BYTE) 상품이 1개 들어갈수도 있고 여러개 들어갈 수도 있다.
 _PROD 판매되어진 상품코드 / 모델링할때 NO 와 PROD 와 묶어서 사용
 _QTY 판매 수량
 
 PROD 상품 테이블
 _COST 매입단가
 _PRICE 매출단가
 _TOTALSTOCK 총 재고
 _PROPERSTOCK 적정 재고
 
 KOR_LOAN_STATUS 대출잔액테이블
 PERIOD 날짜(년월만 있으니까 문자타입임)
 REGION 지역
 GUBUN 어떤 대출인지
 LOAN_JAN_AMT 대출 잔액
 MEMBER
 MEM_ID
 _PASS
 _NAME
 _REGNO1 주민번호 앞자리
 _REGNO2 주민번호 뒷자리
 _BIR 생일
 _ZIP 우편번호
 _ADD1
 _ADD2
 _LIKE 취미
 _MEMORIAL 기념일
 _MILEAGE 
 _DELETE
 
 _DEPARTMENTS
 _PARENT_ID
 
 