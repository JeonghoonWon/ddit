-- SQL정리 --
 -- 201118_1 --
 
 -- INSERT-
 INSERT 문
  - 테이블에 자료를 삽입할 때 사용
  (사용형식)
  INSERT INTO 테이블명[(컬럼명1, 컬럼명2,...)]
    VALUES(값1,값2,...);
    . '컬럼명1, 컬럼명2,...' :은 생략할 수 있음
        생략하는 경우 테입블에 존재하는 모든 컬럼의 갯수와 순서 및 데이터 타입에 
        맞게 자료를 VALUES절에 기술해야함
    . '컬럼명1, 컬럼명2,...' 을 사용하는 경우는 선택된 컬럼에 자료를 삽입하고자 하는 경우
        기술하며, VALUES절에 기술된 값과 컬럼명은 1 : 1 로 대응 되어야 한다.
    . '컬럼명1, 컬럼명2,...' 기술시 NOT NULL 컬럼은 생략 될 수 있음
    
    
    예)다음 자료를 EMP테이블에 저장하시오.
    [자료]
    사원id : C1001
    사원명 : 홍길동
    주소 : 대전시 중구 대흥동 500
    부서명 : 총무기획부
    
    INSERT INTO EMP(EMP_ID,EMP_NAME,EMP_DEPT,DEPT_NAME)
        VALUES('C1001','홍길동','대전시 중구 대흥동 500','총무기획부');
    (검증)
    SELECT * FROM EMP; 
    
    --UPDATE --
     2. UPDATE 문
    - 저장되어 있는 자료(컬럼의 값)를 수정할 때 사용
    (사용형식)
    UPDATE 테이블명
        SET 컬럼명=값 [,
            컬럼명=값,...]
    [WHERE 조건];
    . '컬럼명' : 변경할 자료의 컬럼명
    . 'WHRER'절이 생략되면 모든 자료의 해당 컬럼 값을 수정 
    
    예)
    '홍길동' 사원의 전화번호를 '042-222-8202'로 수정하시오.
    
    UPDATE EMP
        SET EMP_TEL='042-222-8202'
        WHERE EMP_ID='C1001';
        
    SELECT * FROM EMP;
    
    ROLLBACK;
    
    -- DELETE --
     3. DELETE 문
    - 테이블에 저장된 자료를 삭제할 때 사용
    - 관계가 설정된 테이블에서 부모테이블의 행 중 참조되고 있는 자료는 삭제 거절
    -ROLLBACK의 대상
    (사용형식)
    DELETE 테이블명
    [WHERE 조건];
     'WHERE'절이 생략되면 테이블의 모든 행이 삭제
    
    예)EMP 테이블의 모든 자료를 삭제하시오.
    
    DELETE WORK;
    
    DELETE EMP;
    
    SELECT * FROM WORK;
    
    SELECT * FROM EMP;
   
   ROLLBACK;
   
    
    DROP TABLE EMP;
    
    -- DROP --
      4. DROP 문
    - 오라클 객체를 삭제
    -ROLLBACK 의 대상이 아님
    
    (사용형식)
    DROP 객체타입 객체명;
    
    예) EMP테이블과 WORK테이블 사이에 존재하는 관계를 삭제 하시오.
    
    ALTER TABLE WORK
    DROP CONSTRAINT FK_WORK_EMP;
    
    ALTER TABLE WORK
    DROP CONSTRAINT FK_WORK_SITE;
    
    DROP TABLE EMP;
    
    DROP TABLE SITE; --MATERIALS 가 자식테이블
    
    DROP TABLE MATERIALS;
    
    DROP TABLE SITE;
    
    DROP TABLE WORK;
    
    --/////////////////////////////////////////////////////////////////////--
    -- 201118_2 --
    
    -- VARCHAR2
     2) VARCHAR2
    . 가변길이 문자열 처리
    . 최대 4000BYTE 처리 가능
    . 정의된 기억공간에서 데이터의 길이 만큼 사용하고 남은 공간은 시스템에 반납
    . VARCHAR와 같은 기능 (오라클은 VARCHAR2 사용을 권고)
    (사용형식)
    컬럼명 VARCHAR2(크기[BYTE|CHAR])
    '[BYTE|CHAR]' : 생략되면 BYTE로 취급
    
    예)
    
    CREATE TABLE TEMP02(
        COL1 VARCHAR2(20),
        COL2 VARCHAR2(20 CHAR));
        
    INSERT INTO TEMP02
     VALUES('대전시', '대한민국은');
    
    INSERT INTO TEMP02
     VALUES('ABCDEFG', 'SAGHDSAGHDSASSASS');
    
    SELECT * FROM TEMP02;
    
    SELECT LENGTHB(COL1),LENGTHB(COL2) FROM TEMP02;
    
     COMMIT;
    
    
     --/////////////////////////////////////////////////////////////////////--
     -- 201119_1 --
    
    -- SUBSTR 
      CREATE TABLE TEMP03(
    COL1 LONG,
    COL2 VARCHAR2(2000));
    
 INSERT INTO TEMP03 VALUES('SASDFASDFASDFSDF','ASDFWSDFE');
 
 SELECT * FROM TEMP03;
 SELECT SUBSTR(COL2,2,5)   -- COL2에서 2번째 글자부터 5개를 추출
 FROM TEMP03; 
 
 2. 숫자자료형
    - 정수와 실수 데이터 저장  --고정소수점(정수) FIXED POINT 부동소수점(실수) FLOATING POIINT
    - NUMBER 타입 제공        -- ORACLE 은 JAVA 와는 다르게 숫자열로 변환 "3" + 2 = 5(ORACLE) / "3"+2= 32(JAVA)
    (사용형식)
    NUMBER[(정밀도|*[,스케일])]
    - 표현할 수 있는 값의 범위 : 1.0e-130 ~ 9.999..9e125
    - 정밀도 : 전체 자리수(1~38)
    - 스케일 : 소수점 이하의 자릿수 
    ex)NUMBER(5,2) : 전체 5자리가 확보(정수 부분 3자리, 소수점이하 3자리에서 반올림하여 2번째 자리까지 표현)
    - 정밀도 대신 '*'를 사용하면 38 자리 이내에서 자동할당(정수부분)
    ex)number(*,2) : 소수점 이하 3자리에서 반올림하여 2번째 자리까지 표현. 단, 정수부분은 38자리 이내에서 크기만큼 자동 할당
    - 스케일이 생략되면 0으로 간주
    - 스케일이 음수이면 정수부분에서 반올림
    
    예)
    
    ----------------------------------------------------------------------------------
    입력값               선언                   저장된 값
    ----------------------------------------------------------------------------------
    12345678.7896      NUMBER               12345678.7896  
    12345678.7896      NUMBER(*,2)          12345678.79
    12345678.7896      NUMBER(8)            12345679
    12345678.7896      NUMBER(7,2)          오류
    12345678.7896      NUMBER(10,-2)        12345678.700 
    
    
    ** 정밀도 < 스케일 인 경우
     - 정밀도는 0이 아닌 유효숫자의 수
     - (스케일-정밀도) : 소수점이하에 존재해야할 0의 갯수
     - 스케일 : 소수점 이하의 데이터의 수
     
     -----------------------------------------
     입력값            선언              저장 값
     -----------------------------------------
     1.234          NUMBER(4,5)         오류
     0.23           NUMBER(3,5)         오류
     0.0123         NUMBER(3,4)         0.0123
     0.0012345      NUMBER(3,5)         0.00123
     0.00125676     NUMBER(3,5)         0.00126
     
   
 --/////////////////////////////////////////////////////////////////////--
    -- 201119_2 --  
     -- 사진 저장 --
     2)BFILE 
 - 이진자료 저장
 - 대상 이진자료를 데이터베이스 외부에 저장
 - 경로 정보(DIRECTORY 객체) 정보만 테이플에 저장
 - 4GB까지 저장 가능
 (사용형식)
 컬럼명 BFILE
  . 디렉토리 별칭(Alias) 설정(30byte) 과 파일명(256byte) 설정
  . 
  
  
  그림파일 저장순서
  1. 그림파일이 저장된 폴더 확인
  2. 디렉토리객체 생성 - 그림이 저장된 디렉토리의 절대 주소 
  
    CREATE DIRECTORY TEST_DIR AS 'D:\A_TeachingMaterial\2.Oracle\other';
  
  3. 그림을 저장할 테이블 생성
    CREATE TABLE TEMP08(
      COL1 BFILE);
  
  4. 그림 삽입
    INSERT INTO TEMP08
        VALUES(BFILENAME('TEST_DIR', 'SAMPLE.JPG'));
        
        SELECT * FROM TEMP08;    -- 썸네일 방식을 구현하는데 좋다 그래그래 좋다좋아 
        
 3) BLOB
  - 이진자료 저장
  - 대상 이진자료를 데이터베이스 내부에 저장
  -4GB 까지 저장 가능
  (사용형식)
  컬럼명 BLOB
  
 (그림 저장 순서)
 1. 그림파일 준비 (SAMPLE.JPG)
 2. 디렉토리 객체 생성 (TEST_DIR)
 3. 테이블 생성
  CREATE TABLE TEMP09(
    COL1 BLOB
    );
 4. 익명블록 생성
 DECLARE 
   L-DIR VARCHAR2(20):='TEST_DIR';
   L-FILE VARCHAR2(30):='sample.jpg';
   L_BFILE BFILE;
   L_BLOB BLOB;
 BEGIN
  INSERT INTO TEMP09(COL1) VALUES(EMPTY_BLOB())
  RETURN COL1 INTO L_BLOB
  
  L_BFILE := BFILENAME(L_DIR,L_FILE);
  DBMS_LOB.FILEOPEN(L_BFILE,DBMS_LOB.FILE_READONLY);
  DBMS_LOB.LOADFROMFILE(L_BFILE,L_BFILE,DBMS_LOB.GETLENGTH(L_BFILE));
 -- DBMS_LOB.FILECLOSE(L_BFILE);
 END;
 
  --/////////////////////////////////////////////////////////////////////--
    -- 201120_2 --  
 
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
 
 
 
   --/////////////////////////////////////////////////////////////////////--
    -- 201123_1 --  
    
    
 4. 기타연산자
  1) IN 연산자
  - 질의 탐색을 위해 2개 이상의 표현식(항목)을 지정
  - OR 연산자로 변환 가능
  (사용형식)
  컬럼명 IN(표현시1. 표현식2,...)
  . '컬럼명'에 저장된 값이 ( ) 안에 기술된 표현식 중 어느 하나와 일치하면 전체조건이 참
  예) 사원테이블에서 부서코드가 20,60,80번 부서에 속한 사원을 검색하시오.
  Alias는 사원번호, 사원명, 부서코드, 급여
  
  (IN 연산자를 사용하지 않는 경우)
  SELECT EMPLOYEE_ID AS 사원번호, --첫번째
         EMP_NAME AS 사원명, -- 두번째
         DEPARTMENT_ID AS 부서코드, -- 세번째
         SALARY AS 급여 -- 네번째
    FROM EMPLOYEES -- FROM 절 이 먼저 실행되고 WHERE 절 순서대로 실행 후 SELECT 절 순서대로 
   WHERE DEPARTMENT_ID=20 OR DEPARTMENT_ID=60 OR DEPARTMENT_ID=80 
   ORDER BY DEPARTMENT_ID ASC -- ASC(오름차순)
   
  (IN 연산자를 사용하는 경우)  
    SELECT EMPLOYEE_ID AS 사원번호, 
         EMP_NAME AS 사원명, 
         DEPARTMENT_ID AS 부서코드, 
         SALARY AS 급여 
    FROM EMPLOYEES 
   WHERE DEPARTMENT_ID IN(20,60,80)
   ORDER BY 3; -- SELECT 3번째를 기준으로 
  
  
  
     --/////////////////////////////////////////////////////////////////////--
    -- 201123_2 -- 
   
   
     4)EXISTS 연산자
      - 반드시 뒤에 서브쿼리가 나와야 함.
      (사용형식)
      WHERE EXISTS (서브쿼리)
      
 예) 사원테이블에서 전체 사원의 평균급여보다 많은 급여를 수령하는 사원이 근무하는 부서코드를 조회하시오.
 
 (전체 사원의 평균급여)
    SELECT ROUND(AVG(SALARY))
     FROM EMPLOYEES;
     
    SELECT DISTINCT DEPARTMENT_ID
        FROM EMPLOYEES
       WHERE EXISTS (SELECT 1
                        FROM EMPLOYEES
                       WHERE SALARY > (SELECT ROUND(AVG(SALARY))
                                         FROM EMPLOYEES))
                                         
 ORDER BY 1;    
 
 5) BETWEEN 연산자
  - 범위를 지정하여 조건을 구성하는 경우 사용
  (사용형식)
  컬럼명 BETWEEN 값1 값2
  . 컬럼명의 값이 '값1'에서 '값2' 사이의 값이면 참(true)을 변환
  
  예) 회원테이블에서 마일리지가 1000~3000사이인 회원저오를 조회하시오.
    Alias 는 회원번호, 회원명, 마일리지
   (AND 연산자를 사용)  
    SELECT MEM_ID AS 회원번호, 
           MEM_NAME 회원명, 
           MEM_MILEAGE AS 마일리지
      FROM MEMBER
  --  WHERE MEM_MILEAGE >=1000 AND MEM_MILEAGE <= 3000;    
      WHERE MEM_MILEAGE BETWEEN 1000 AND 3000;
      
      
       6) LIKE 연산자-****문자열에 사용****
        - 패턴을 비교하는 경우 사용하는 연산자
        - 와일드카드(패턴문자열)로 '%' 와 '_'가 사용 
        - '%' : '%' 가 사용된 위치에서 그 이후에 나오는 모든 문자열과 대응
         ex) '김%' : '김' 으로 시작하는 모든 문자열과 대응
             '%김' : '김' 으로 끝나는 모든 문자열과 대응
             '%김%' : 단어 내부에 '김' 이 존재하는 모든 문자열과 대응
        '_' : '_' 가 사용된 위치에서 하나의 문자와 대응
         ex) '김_' : '김' 으로 시작하고 2글자로 구성되며 두번째 글자는 어느 글자든 상관없음
             '_김' : '김' 으로 끝나는 모든 문자열과 대응
             '_김_' : 단어 내부에 '김' 이 존재하는 모든 문자열과 대응 
             
 예) 회원테이블에서 회원의 거주지가 '충남'인 회원정보를 출력하시오
      Alias 는 회원이름, 주소, 직업
      
      SELECT MEM_NAME AS 회원이름, 
             MEM_ADD1|| ' '||MEM_ADD2 AS  주소,
             MEM_JOB AS 직업
      
      FROM MEMBER
      WHERE MEM_ADD1 LIKE '충남%'; -- 연산자는 중복으로 쓰지않는다
      
  
     --/////////////////////////////////////////////////////////////////////--
    -- 201124_1 -- 
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
      
 --////////////////////////////////////////////////////////////////////////--
 -- 201124_1 --
 
   
      
      