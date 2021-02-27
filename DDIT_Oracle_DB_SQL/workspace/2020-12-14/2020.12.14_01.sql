PL/SQL (procedure 생성 실습 PRO _ 2)

registdept_test procedure 생성
param : deptno, dname, loc
logic : 입력받은 부서 정보를 dept 테이블에 신규 입력
exec registdept_test (99, 'ddit', 'deajeon');
dept_test 테이블에 정상적으로 이력 되었는지 확인 (SQL - 눈으로)

CREATE OR REPLACE printdept (p_deptno dept. deptno%TYPE) is

BEGIN
    SELECT 
END


--------------------------------------------------------
--쌤꺼
    CTAS : CHECK 제약을 제외한 나머지 제약조건들은 적용되지 않는다.
    CREATE TABLE dept_test AS   -- CREATE TABLE 이름 AS  CTAS 라고읽음
    SELECT *
    FROM dept
    WHERE 1 = 2;
    -- dept 테이블에 dept_test 를 생성
    
    SELECT *
    FROM dept_test;
    
    CREATE OR REPLACE PROCEDURE registdept_test(deptno dept_test.deptno%TYPE,
                                                dname dept_test.dname%TYPE,
                                                loc dept_test.loc%TYPE) IS
                 
    BEGIN
        INSERT INTO DEPT_TEST VALUES (deptno, dname, loc); 
        COMMIT;
    
    END;
    /
                                       
    EXEC registdept_test (99, 'ddit', ' daejeon');
---------------------------------------------------------------------
    SELECT *
    FROM dept_test;
  ----------------------------------------------------------------  
    PL/SQL (procedure 생성 실습 PRO _ 3)

    UPDATEdept_test procedure 생성
    param : deptno, dname, loc
    logic : 입력받은 부서 정보를 dept 테이블에 정보 수정
    exec UPDATEdept_test (99, 'ddit_m', 'deajeon');
    dept_test 테이블에 정상적으로 이력 되었는지 확인 (SQL - 눈으로)
 
    CREATE OR REPLACE PROCEDURE UPDATEdept_test(deptno dept_test.deptno%TYPE,
                                                dname dept_test.dname%TYPE,
                                                loc dept_test.loc%TYPE) IS
    
    BEGIN
        UPDATE dept_test SET dname, loc
        FROM deptno
       
        
    END;
    /
    EXEC UPDATEdept_test (99, 'ddit_m', 'deajeon');
 ----------------------------------------------------------------------- 
 --선생님 하신거
    CREATE OR REPLACE PROCEDURE updatedept_test(p_deptno dept_test.deptno%TYPE,
                                                p_dname dept_test.dname%TYPE,
                                                p_loc dept_test.loc%TYPE) IS
                 
    BEGIN
        UPDATE dept_test SET dname= p_dname, loc = p_loc
         WHERE deptno = p_deptno;
      
         
  
    END;
    /
                                       
    EXEC updatedept_test (99, 'ddit_m', ' daejeon');
    
-----------------------------------------------------------------------------
    SELECT ROWID, dept_test.*
      FROM dept_test;
    
    DELETE dept_test
     WHERE ROWID IN ('AAAFE4AABAAALJqAAB','AAAFE4AABAAALJqAAC');
    commit;
-----------------------------------------------------------------------------
    
    SELECT *
      FROM salgrade;
      
    SELECT e.empno, e.ename, e.sal, s.grade
      FROM emp e, salgrade s
     WHERE e.sal between s.losal and s.hisal;
     
 ----------------------------------------------------------------------------------------
        
    SELECT *
      FROM salgrade;
      
    SELECT e.empno, e.ename, e.sal, s.grade
      FROM emp e, salgrade s
     WHERE e.sal >= s.losal 
       and e.sal <= s.hisal;
-----------------------------------------------------------------------------       
   분석함수 / window 함수 ( 그룹내 행 순서 - 생각해보기, 실습 no_ana3)
   
   모든 사원에 대해 사원번호, 사원이름 ,입사일자, 급여르 급여가 낮은순으로 조회해보자.
   급여가 동일할 경우 사원번호가 빠른사람이 우선순위가 높다.
   우선 순위가 낮은 사람부터 본인까지 급여 합ㅇ르 ㅐ로운 컬럽으로 생성(window 함수없이)
     SELECT a.*, b.sal
       FROM 
    (SELECT empno, ename, sal
      FROM emp
     ORDER BY sal, empno) a,
      
   (SELECT empno, ename, sal
      FROM emp
     ORDER BY sal, empno) b
     WHERE a.ename = 'SMITH'
       AND a.sal >= b.sal;
  ------------------------------------------------------------  
     SELECT a.empno, a.ename, a.sal, SUM(b.sal)
       FROM    (SELECT empno, ename, sal
                  FROM emp
                 ORDER BY sal, empno) a,
      
               (SELECT empno, ename, sal
                  FROM emp
                 ORDER BY sal, empno) b
     WHERE a.sal >= b.sal
     GROUP BY a.empno, a.ename, a.sal 
     ORDER BY a.sal;
----------------------------------------------------------------
      SELECT a.empno, a.ename, a.sal, SUM(b.sal) c_sum
        FROM
     (SELECT A.* , ROWNUM RN
       FROM
  
    (SELECT empno, ename, sal
      FROM emp
     ORDER BY sal, empno) a ) a,
     (SELECT a.*, ROWNUM rn
       FROM
     (SELECT empno, ename, sal
      FROM emp
     ORDER BY sal, empno) a ) b
     WHERE a.rn >= b.rn
     GROUP BY a.empno, a.ename, a.sal
     ORDER BY a.sal, a.empno;
     -- 객체는 대소문자를 가리지 않는다
     --  but 상수
     SELECT a.empno, a.ename, a.sal SUM(a.sal) OVER (ORDER BY sal, empno)
       FROM emp
       
       
       -- 개발자들이 하지 않아야 할 칠거지악
       
       SELECT *
         FORM EMP
        WHERE LOWER (ename) = 'smith';
         -- emp 사원수 만큼 검색 하는 것
        
       SELECT *
         FROM EMP
        WHERE ename = UPPER('smith');
        -- 'smith' 한번만 검색
        
        
   ana0]
   1. 행을 임의로 생성
 
    SINGLE ROW FUNCTION : LENGTH, LOWER
    MULTI ROW FUNCTION : SUM, MAX...
   
   SELECT LENGTH('HELLO, WORLD')
     FROM dual;
    -- DUAL
    -- 1. 오라클 자체에서 제공되는 테이블
    -- 2. 간단하게 함수를 이용해서 계산 결과값을 확인 할 때 사용하는 테이블
    -- 3.  어느 사용자에서 접근 가능함
    -- 4. 직 한행, 한컬럼을 담고 있는 dummy 테이블

    
   SELECT emp*, LENGTH('HELLO, WORLD')
     FROM emp;
    
   SELECT *
     FROM DUAL
  CONNECT BY LEVEL <= 10;
    
   -- 내가 행을 워하는 만큼 만들어낼수있음
   -- 고급 쿼리 짤때 항상 나온다
        
    SELECT DUAL.*, LEVEL
      FROM DUAL
   CONNECT BY LEVEL <= 10;   
   
   SELECT LEVEL
     FROM dual
  CONNECT BY LEVEL <= (SELECT COUNT(*) FROM emp);
  -- emp 인원수를 카운트해서 행 갯수 생성
  
  10 3
  20 5
  30 6 
  각 부서별 인원수
  
SELECT  A.empno, a.sal, a.deptno, B.rn
FROM
(SELECT ROWNUM r, a.*
FROM 
(SELECT empno, sal, deptno
 FROM emp
 ORDER BY deptno, sal, empno) a ) a, 
 
 (SELECT ROWNUM r, b.*
FROM 
(SELECT a.deptno, b.rn
FROM
(SELECT deptno, COUNT(*) cnt
 FROM emp
 GROUP BY deptno) a,

(SELECT LEVEL rn
 FROM dual
 CONNECT BY LEVEL <= (SELECT COUNT(*) FROM emp)) b
WHERE a.cnt >= b.rn
ORDER BY a.deptno, b.rn) b ) b
WHERE a.r = b.r;
 
 
PL / SQL (복합 변수)

 - %rowtype
 - 
 
 점(컬럼)   -   선(행)      -  면(테이블)
 %TYPE       %ROWTYPE      table type
            RECORD TYPE
            
 ROWTYPE : 행 전체를 저장할 수 있는 변수
            컬럼이 많은 테이블의 값을 변수로 담을 때 컬럼별로 변수를 선언하지 않고
            행단위로 한번만 선언을 하고 사용하므로 편의성이 증대된다.
            
 DEPT 데이블의 10번 부서정보를 담을 수 있는 ROWTYPE 을 선언하여 활용
 SET SERVEROUTPUT ON;
 DECLARE
     -- 변수명 변수타입
     v_dept_row dept%ROWTYPE;
 BEGIN
    SELECT* INTO v_dept_row
    FROM dept
    WHERE deptno = 10;
    
    -- 컬럼의 값 접근 : rowtype. 컬럼명
    DBMS_OUTPUT.PUT_LINE (v_dept_row.dname || '/' || v_dept_row.loc);
        
    END;
    /
    
    RECORD TYPE : 개발자가 저장하려고하는 컬럼을 직접 지정하여 행에 대한 타입을 선언
                    (JAVA에서 클래스를 선언)
                    
    선언방법
    TYPE 타입명 IS RECORD (
        ename emp.ename%TYPE,
        dname dept.dname%TYPE
)
 
 DECLARE
    TYPE name_row IS RECORD (
        ename emp.ename%TYPE,
        dname dept.dname%TYPE);
    -- 변수명 변수타입    
    names name_row;
BEGIN
        SELECT ename, dname INTO names
          FROM  emp, dept
          WHERE emp.deptno = dept.deptno
          and empno = 7839;
          DBMS_OUTPUT.PUT_LINE(names.ename || '/' || names.dname);
 END;
 /
 
 TABLE TYPE : 여러생을 저장할 수 있는 타입
 TYPE 타입이름 IS RECORD
 TYPE 타입이름 IS TABLE OF 레코드 타입 / %ROWTYPE INDEX BY BINARY_INTEGER
 java 에서는 INT[] arr = new int[50];

 
  DECLARE
    TYPE name_row IS RECORD (
        ename emp.ename%TYPE,
        dname dept.dname%TYPE);
   
    TYPE name_tab IS TABLE OF NAME_ROW INDEX BY BINARY_INTEGER;
    -- 변수명 변수타입    
    names name_tab;
BEGIN
        SELECT ename, dname BULK COLLECT INTO names
          FROM  emp, dept
         WHERE emp.deptno = dept.deptno;
          -- for(int i = 0; i < names.length
          FOR i IN 1..names.count LOOP  -- I 는 1부터 14 까지 라는 뜻. 인덱스 넘버를 넣어준다
           DBMS_OUTPUT.PUT_LINE(names(i).ename || '/' || names(i).dname);
          END LOOP;  -- FOR END LOOP; 로 열고 닫는다 JAVA 와는 다르게
                  
  END;
 /
 
    