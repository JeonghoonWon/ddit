  2020-11-18-01) INSERT 문
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
        
    
    
    사원id : C1002
    사원명 : 강감찬
    주소 : 서울시 성북구 신장위동 300-10
    직책 : 부장
    부서명 : IT 개발부
    
       INSERT INTO EMP
        VALUES('C1002','강감찬','서울시 성북구 신장위동 300-10',' ', '부장', 'IT 개발부');
    
    (검증)
    SELECT * FROM EMP; 
     
     ALTER TABLE EMP DROP COLUMN EMP_TEL;
    
    ALTER TABLE EMP ADD(EMP_TEL VARCHAR2(20)); 

    사원id : C1005
    사원명 : 이민정
    주소 : 대전시 대덕구 법동 100
    전화번호 : 010-1234-5678
    직책 : 과장
    부서명 : 회계부
    
    INSERT INTO EMP(EMP_ID, EMP_NAME, EMP_DEPT, EMP_TEL, EMP_GRADE, DEPT_NAME)
    VALUES ('C1005','이민정','대전시 대덕구 법동 100','010-1234-5678', '과장', '회계부');
    
    
 COMMIT;
 
 DELETE EMP;
 
 ROLLBACK;
 
    
    (검증)
    SELECT * FROM EMP;
    
    
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
    
    예)
     '강감찬' 사원의 전화번호를 '010-9876-1234'로, 직위를 '차장'으로 수정하시오.
    
     UPDATE EMP
        SET EMP_TEL='010-9876-1234',
            EMP_GRADE='차장'
        WHERE EMP_NAME='강감찬';
        
    문제] 다음 조건에 맞도록 WORK테이블 등에 자료를 삽입하시오.
    [처리조건]
    사원번호 'C1001'인 홍길동 사원이 오늘 날짜로 'DAE00001'사업장에 발령 받아 출근함.
    'DAE00001'사업장은 '대전 상수도 관리사업'으로 오늘부터 공사가 개시되고 
    2021년 6월 30일에 완공을 목표로 하는 사업장이다.
    
    INSERT INTO SITE(SITE_NO, SITE_NAME, P_COM_DATE, START_DATE)
        VALUES('DAE0001', '대전 상수도 관리사업', '20210630',SYSDATE);
        
    SELECT*FROM SITE;

   

    INSERT INTO WORK
     VALUES('C1001', 'DAE0001', SYSDATE);
     
     DELETE EMP
     WHERE EMP_NAME='홍길동';
    
    DROP TABLE EMP;
    
    
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
    
    