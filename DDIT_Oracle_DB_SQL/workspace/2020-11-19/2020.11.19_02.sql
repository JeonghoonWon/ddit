2020-11-19-02) 기타 자료형
 - 2진 자료를 저장하기 위한 자료 타입
 - BLOP, RAW, LONG RAW, BFILE 등이 제공
 1) RAW
  - 상대적으로 작은 용량의 2진 자료를 저장
  - 인덱스 처리가 가능
  - ORACLE에서 해석이나 변환작업을 수행하지 않음
  - 최대 2000BYTE 까지 처리 가능
  - 16진수와 2진수 저장
  (사용형식)
  컬럼명 RAW(크기)   
  
  예)
  
  CREATE TABLE TEMP07(
  COL1 RAW(1000),
  COL2 RAW(2000));
  
  INSERT INTO TEMP07 VALUES(HEXTORAW('3DE5FF77'), HEXTORAW('00'));
  INSERT INTO TEMP07 VALUES('0011110111101111111101110111','00000000');
  
  SELECT * FROM TEMP07;


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
 
 

    
    
    
    