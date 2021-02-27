2020-11-18-02)오라클 데이터 타입
    - 오라클에서 제공하는 데이터 타입은 문자열, 숫자, 날짜, 2진자료형이 있음

    1. 문자열 데이터 타입
    - ' '로 묶인 자료를 문자열 자료라 함
    - CHAR, VARCHAR, VARCHAR2, NVARCHAR, NCHAR, LONG, RAW, CLOB 등이 존재 
    
    1)CHAR
    . 고정길이 문자열을 취급  -- 사용자가 사용하든 안하든 10으로 고정 되어있음 /ex) 3BYTE 사용했을 경우 7 공백
    . 최대 2000BYTE 저장 기능
    . 기억장소가 남으면 오른쪽에 공백이 삽입
    . 기억공간보다 큰 데이터는 저장 오류
    . 한글 한 글자는 3BYTE로 저장됨
    . 기본키 등에 사용
    
    (사용형식)
    컬럼명 CHAR(크기[BYTE|CHAR])  -- 앞에 CHAR는 고정길이 문자열 뒤에 CHAR는 케릭터 문자 수
    . '크기[BYTE|CHAR]' : 기억공간의 크기(BYTE)나 글자수(CHAR) 정의
                            2000BYTE 초과 불가
    
    예)
    
    CREATE TABLE TEMP01(
     COL1 CHAR(20),
     COL2 CHAR(20 BYTE), 
     COL3 CHAR(20 CHAR));
    
    INSERT INTO TEMP01(COL1,COL2, COL3)
        VALUES('대한민국', 'IL POSTINO', '대전광역시 중구 대흥동 500-1번지');
        
    SELECT LENGTHB(COL1), LENGTHB(COL2), LENGTHB(COL3)
     FROM TEMP01;
     
    SELECT * FROM TEMP01; 
                                -- 패딩 문자열 = 공백
                                
                                
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