2020-12-11_01)
PL / SQL

 Procedural Language /SQL

 오라클에서 제공하는 프로그래밍 언어

 집합적 성향이 강한 SQL 에 일반 프로그래밍 언어 요소를 추가
  - SQL 에서 지원하지 않는 반복문, 조건문을 지원
 데이터를 절차적으로 처리하는데 그 목적
 
 JAVA
 변수타입 변수명 = 변수값;
 
 PL/SQL
 변수명 변수타입 := 변수값;
  
  
  기본구조
   Declare(선언부)
    -변수, 상수 등을 선언
    -생략가능
  
   begin(실행부,로직)
    - 제어문, 반복문 등의 로직 실행
    - 비지니스 로직 작성(SQL, IF, LOOP)
  
   Exception(예외 처리부)
    - 실행 도중 에러 발생을 catch, 후속 조치
    - 생략 가능
    - 예외처리(JAVA-TRY.CATCH)
    
    
   1. DNAME, LOC 컬럼 두개를 변수에 담는다.
   2. 두개의 변수값을 출력(System.out.println)
   SELECT *
     FROM dept;
     
   DESC dept;  
   -- 열의 구성을 볼 수 있다.
   
   변수 선언 : 변수명 변수타입;
   pl/sql : 변수명 작명시 V_XXX 접두어 사용
  
  SET SERVEROUTPUT ON;
  
   DECLARE
        V_DNAME VARCHAR2(14);
        V_LOC VARCHAR2(13);
   BEGIN
        SELECT DNAME, LOC INTO V_DNAME, V_LOC
          FROM dept
         WHERE deptno = 10;
         
 --        System.out.println(v_dname + "/" + v_loc);  = java 식 출력
         
         DBMS_OUTPUT.PUT_LINE (V_DNAME || ' / ' || V_LOC);

   END;
   /
   
   
    AOP(Aspect Oriented Programing)
   OOP(Object Oriented Programing)
   
   VIEW 는 쿼리 이다.
   쿼리(query (질의어) 정보 수집에 대한 요청에 쓰이는 컴퓨터 언어
   
   
   SELECT *
   FROM V_EMP01;
  
  
  참조변수 : 특정 테이블의 컬럼의 데이터 타입을 자동으로 참조  ==> 컬럼의 데이터 타입이 바뀌어도
            pl/sql 블록의 변수 선엄부를 수정할 필요가 없어짐 : 유지보수에 유리
            테이블명.컬럼명 %type; 
  DECLARE
        V_DNAME dept.dname%type;
        V_LOC dept.loc%type;
   BEGIN
        SELECT DNAME, LOC INTO V_DNAME, V_LOC
          FROM dept
         WHERE deptno = 10;
         
 --        System.out.println(v_dname + "/" + v_loc);  = java 식 출력
         
         DBMS_OUTPUT.PUT_LINE (V_DNAME || ' / ' || V_LOC);

   END;
   /
   
  pl/sql block 구분
  1. 익명 블럭 : inline-view
  2. procedure : 오라클 서버에 저장한 pl/sql 블럭, 리턴값은 없다
  3. function : 오라클 서버에 저장한 pl/sql 블럭, 리턴값이 있다
  
  오라클 객체
  CREATE 오라클객체타입 객체이름....
  CREATE TABLE 테이블명
  CREATE [OR REPLACE] VIEW 뷰이름
  
 현재 프로시져는 10번 부서의 정봄나 조회가 되게끔 코드가 구성됨(hard coding) 
 procedure 인자로 조회하고 싶은 부서번호를 받도록 수정하여 코드를 유연하게 만들어 보자
  
 프로시져를 생성할때 인자를 프로시져명 뒤에 선언할 수 있음
 인자는 메소드와 마찬가지로 여러개를 받을 수 있음
 
 수업시간에는 프로시져에서 인자 이름을 P_xxx 접두어를 사용하기로 합시다.
 
  CREATE OR REPLACE PROCEDURE [( 인자명 인자타입 )]
  CREATE OR REPLACE PROCEDURE printdept(p_deptno dept.deptno%TYPE) IS
    -- DECLARE (선언부) 가 생략 된 것
    v_dname dept.dname%TYPE;  -- 변수는 V_ 로 선언
    v_loc dept.loc%TYPE;
BEGIN
    SELECT dname, loc INTO V_DNAME, V_LOC  --선언한 변수에 담겠다
    FROM dept
    WHERE deptno = p_deptno;
    DBMS_OUTPUT.PUT_LINE(V_DNAME|| '/' || V_LOC);
END;
/
     EXEC printdept;

  프로시져 실행
  EXEC 프로시져명
  
  EXEC printdept(50);
    
  PL/SQL (procedure 생성 실습 PRO_1)
    printemp procedure 생성
    param :empno
    logic : empno에 해당하는 사원의 정보를 조회하여
            사원이름, 부서이름을 화면에 출력
            
 CREATE OR REPLACE PROCEDURE printemp(p_empno emp.empno%TYPE) is
                              
    v_ename emp.ename%TYPE;
    v_dname dept.dname%TYPE;
    
   BEGIN 
     SELECT e.ename, d.dname INTO v_ename, v_dname
       FROM emp e , dept d
      WHERE e.deptno = d.deptno 
        and e.empno = p_empno;
      DBMS_OUTPUT.PUT_LINE(v_ename|| '/' || v_dname);
END;
/
         EXEC printemp(7900);   -- 2개는 못하나 
   ---------------------다시  
            
        


            