 2020-11-19-01)
 3) LONG 데이터 타입
    - 가변길이 문자열을 저장
    - 최대 2GB 까지 저장 가능
    -LONG 타입은 하나의 테이블에서 1개만 사용 가능
    -CLOB로 대체(기능 업그레이드 중단)
    -SELECT문의 SECECT절, UPDATE문의 SET절, INSERT문의 VALUES절에서 사용 가능
    (사용형식)
    컬럼명 LONG
    
    
 예)

 CREATE TABLE TEMP03(
    COL1 LONG,
    COL2 VARCHAR2(2000));
    
 INSERT INTO TEMP03 VALUES('SASDFASDFASDFSDF','ASDFWSDFE');
 
 SELECT * FROM TEMP03;
 SELECT SUBSTR(COL2,2,5)   -- COL2에서 2번째 글자부터 5개를 추출
 FROM TEMP03; 
 
 4) CLOB (Character Large OBjects) 데이터 타입
  - 대용량 문자열 자료를 처리학 ㅣ위한 데이터 타입
  - 최대 4GB 까지 처리 가능
  - 가변길이 문자 자료형
  - 한 테이블에서 사용될 수 있는 clob의 갯수에 제한이 없음
  - 일부 기능 들은 DBMS_LOB ART의 지원을 받아야 함
  (사용형식)
  컬럼명 CLOB
  
  예)
  CREATE TABLE TEMP04(
   COL1 CLOB,
   COL2 CLOB,
   COL3 CLOB);
   
 INSERT INTO TEMP04
  VALUES('대한민국은 민주 공화국이다','대전시 중구 대흥공 500 영민빌딩 3층',
  'Oracle Moteling과 SQL');
  SELECT * FROM TEMP04;
  
  SELECT LENGHTB(COL2) FROM TEMP04;
  
  SELECT DBMS_LOB.SUBSTR(COL1, 5,3),   -- LOB.SUBSTR(COL1, 5,3) 는 3번째 글자부터 5개 추출 / 그냥 SUBSTR 와 반대가 된다.
         DBMS_LOB.GETLENGTH(COL2),
         LENGTH(COL3)
    FROM TEMP04;
  
  5) NCLOB, NVARCHAR2
   - 다국어 지원 형태로 문자 자료저장
   - UTF-8, UTF-16 형식의 ENCODDING 
   - 나머지 기능은 CLOB, VARCHAR2와 동일
   
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
     
    3. 문자자료형
     - 날짜자료(년,월,시,분,초) 를 저장하기 위한 데이터 타입 
     -기본형은 DATE, 시간대(TIMEWONE)정보와 10억분의 1초단위의 시각정보를
      제공하는 데이터 타입으로 TIMESTAMP가 제공
      1) DATE 타입
      - 기본 날짜형
      - '+', '-' 연산의 대상
      **SYSDATE : 시스템이 제공하는 날짜 정보를 제공하는 함수      
      (사용형식)
      컬럼명 DATE
      
 예)
 CREATE TABLE TEMP05(
 COL1 DATE,
 COL2 DATE,
 COL3 DATE);
 
 INSERT INTO TEMP05 VALUES(SYSDATE, '20101029',SYSDATE+30);
     
 SELECT * FROM TEMP05;
 SELECT COL1-10 FROM TEMP05;  -- 날짜형식은 덧셈,뺄셈이 된다. 
 
 SELECT MOD(TRUNC(SYSDATE)-TO_DATE('00010101')-1,7) FROM DUAL;
 SELECT MOD(TO_DATE('20100101')-TO_DATE('00010101')-1,7) FROM DUAL;  --TO_DATE = 변환 함수 ~로 변환 하시오. /  DUAL = 
     
     
     
   SELECT 12345*234567 FROM DUAL; -- SELECT 를 사용하기 위해선 FROM TABLE 이 있어야함 TABLE을 설정해두지 
                                  -- 않았기 때문에 시스템에서 제공하는  DUAL 을 사용.  
                                  
   SELECT TO_CHAR(COL1,'YYYY"년" MM"월" DD"일" AM HH24:MI:SS') FROM TEMP05;
   
   2)TIMESTAMP 타이
    - 시간대 정보와 정교한 시각정보가 필요할 때 사용
    (사용형식)
    컬럼명 TIMESTAMP - 시간대 정보 없음
    컬럼명 TIMESTAMP WITH TIME ZONE -시간대정보(대륙명/도시명) 포함
    컬럼명 TIMESTAMP WITH LOCAL TIME ZONE -서버가 위치한 시간대저오, 보통 TIMESTAMP 와 동일
    
    예)
    CREATE TABLE TEMP06(
        COL1 DATE,
        COL2 TIMESTAMP,
        COL3 TIMESTAMP WITH TIME ZONE,
        COL4 TIMESTAMP WITH LOCAL TIME ZONE);
        
    INSERT INTO TEMP06
    VALUES (SYSDATE,SYSDATE,SYSDATE,SYSDATE);
    
    SELECT * FROM TEMP06;
 
 