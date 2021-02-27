 2020-12-09_01)
 SQL / java : 프로그래밍 언어
 java : 로직을 제어
 SQL (Structured Query Language) :구조화된 질의 언어
    -RDBMS 과 통신하기위한 유일한 수단
 빅데이터, NO-SQL : Not only Sql
 구글 - 파이어 베이스, Mongo db
 
 RDBMS - 집합적 개념을 차용 /  -- 데이터간의 중복을 최소화 
 

 SELECT *
 FROM employees e, jobs j
 WHERE e.job_id = j.job_id;
 
 EXPLAIN PLAN FOR
 SELECT *
 FROM  jobs j, employees e
 WHERE j.job_id = e.job_id;  

--가장 많은 급여를 받는 사람의 EMPLOYEE_ID 구하기
 SELECT employee_id, MAX(salary)
 FROM employees
 GROUP BY employee_id;
 
  SELECT employee_id, salary
 FROM employees
 GROUP BY employee_id;
 
 -- 14 개
 SELECT *
 FROM EMP;
 
 -- 4개
 SELECT *
 FROM DEPT;
 
 제약조건
 0. UNIQUE : 값에 중복을 허용하지 않음. 단 NULL 은 가능
 1. Primary Key == UNIQUE + NOT NULL
 해당컬럼 값이 테이블에서 유일함을 보장, NULL 값이 들어갈 수 없다.
 2. FK : 참조 무결성
 3. CHECK 
 
 SELECT *
 FROM USER_CONSTRAINTS;   --사용자 제약조건
 
 SELECT *
 FROM USER_CONSTRAINTS   --사용자 제약조건
 WHERE TABLE_NAME IN ('EMP', 'DEPT');
 
 SELECT ename, TO_CHAR(hiredate, 'YYYY/MM/DD') , SYSDATE
 FROM EMP;  -- TO_CHAR 는 인자가 있는 함수  SYSDATE 는 인자가 없는 함수
  
 SELECT *
 FROM USER_CONS_COLUMNS  
 WHERE CONSTRAINT_NAME = 'PK_LPROD';
 
 사원의 부서별 급여(sal) 별 순위 구하기
 emp 테이블 사용
 
 분석함수 (Window 함수)
 SELECT Window_function(arg)
 OVER([PARTITION BY columns] [ORDER BY columns][WIDOWING])
 영역설정
  - PARTITION BY 컬럼코드
 순서설정
  - ORDER BY 컬럼 코드 [DESC | ASC ]
 범위 설정(WINDOWING)
  ROWS | RANGE BETWEEN UNBOUNDED PRECEDING[
  

  
  분석함수 : 행간 연산 지원을 해주는 함수
  SELECT 분석함수이름([인자]) OVER (영역설정 순서설정 범위설정)
  FROM .....
  영역설정 : PARTITION BY 컬럼
  순서설정 : ORDER BY 컬럼
  범위설정 : PARTITION 내에서 특정 행까지 범위를 지정....(나중에할것)
  
  하려고 하는 것 : emp 테이블을 이용하여 부서번호 별로 급여 랭킹을 계산
                (급여 랭크 기중 : sal 값이 높은 사람이 랭크가 높은 것으로 계산)
                
  영역설정 : deptno
  순서설정 : sal DESC
  
  SELECT ename, sal, deptno, 
         RANK()OVER(PARTITION BY deptno ORDER BY sal DESC) sal_rank, -- RANK() 분석함수
         DENSE_RANK()OVER(PARTITION BY deptno ORDER BY sal DESC) sal_dense_rank, 
         ROW_NUMBER()OVER(PARTITION BY deptno ORDER BY sal DESC) sal_row_number 

    FROM emp;
  
  분석함수(Window 함수 (실습 ana1)
   - 사원의 전체 급여 순위를 rank, dense_rank, row_number 를 이용하여 구하시오.
   - 단 급여가 동일할 경우 사번이 빠른사람이 높은순위가 되도록 작성하세요.
   
   SELECT empno, ename, sal, deptno, 
         RANK()OVER(ORDER BY sal DESC, empno) sal_rank, 
         DENSE_RANK()OVER(ORDER BY sal DESC, empno) sal_dense_rank, 
         ROW_NUMBER()OVER(ORDER BY sal DESC, empno) sal_row_number

    FROM emp;
    
    - 기존의 배운 내용을 활용하여,
      모든 사원에 대해 사원번호, 사원이름, 해당 사원이 속한 부서의 사원수를 조회하는 쿼리를 작성하세요.
    SELECT *
    FROM EMP;
    
    
  10 : select count(*)
        from emp
        where deptno = 10; emp 테이블의 부서번호
  
  20 : select count(*)
        from emp
        where deptno = 20;     
  30 : select count(*)
        from emp
        where deptno = 30;     
        
                       
   SELECT e.empno, e.ename, e.deptno,
         (SELECT COUNT(*)
          FROM emp
          WHERE emp.deptno = e.deptno) 
     FROM emp e;
       -- 스칼라 서브쿼리는 각 행마다 실행 되는것
       -- 행이 많으면 많은 시간 소요
       
      
    WHERE : 조회되는 행을 제한, WHERE절에 기술한 조건이 해당행을 대상으로 참(TRUE) 으로 판단될 경우 조회
    
   SELECT *
     FROM emp
    WHERE empno > 7782;
  
  집계함수 : COUNT, SUM, AVG, MAX, MIN
  
  SELECT COUNT(*)  -- empno, ename, deptno
    FROM emp
   GROUP BY deptno;
 
 -- 부서별 부서원수를 4번째 컬럼으로 조회   중요중요
   SELECT empno, ename, deptno, COUNT(*) OVER(PARTITION BY DEPTNO)
    FROM emp;

 - window function 을 이용하여 모든 사원에 대해 사원번호, 사원이름,     본인급여, 부서번호와
    해당사원이 속한 부서의 급여평균을 조회하는 쿼리를 작성하세요.
    (급여 평균은 소수점 둘째 자리까지 구한다)
    SELECT empno, ename, sal, deptno, ROUND(AVG(sal)OVER(PARTITION BY deptno),2) AVG_SAL
      FROM emp
 - window function 을 이용하여 모든 사원에 대해 사원번호, 사원이름, 본인급여, 부서번호와
    해당 사원이 속한 부서의 가장 높은 급여를 조회하는 쿼리를 작성하세요.
    
    (최대급여)
    SELECT empno, ename, sal, deptno, MAX(sal)OVER(PARTITION BY deptno) MAX_SAL
    FROM emp
    
    (최소급여)
    SELECT empno, ename, sal, deptno, MIN(sal)OVER(PARTITION BY deptno) MIN_SAL
    FROM emp

과제) 위의 SQL을 분석함수를 사용하지 않고 작성하기
        
        (MAX)
        SELECT e.empno, e.ename, e.sal, e.deptno,
                  (SELECT MAX(SAL)
                         FROM emp
                        WHERE emp.deptno = e.deptno)  MAX_SAL
         FROM emp e
        ORDER BY MAX_SAL DESC;
        
        (MIN)
        SELECT e.empno, e.ename, e.sal, e.deptno,
                  (SELECT MIN(SAL)
                         FROM emp
                        WHERE emp.deptno = e.deptno)  MIN_SAL
         FROM emp e
        ORDER BY MIN_SAL ASC ;
        
        (AVG)
        SELECT e.empno, e.ename, e.sal, e.deptno,
                  (SELECT ROUND(AVG(SAL),2)
                         FROM emp
                        WHERE emp.deptno = e.deptno)  AVG_SAL
         FROM emp e
        ORDER BY AVG_SAL DESC ;
       

-- sql 자격증 도전해보는것도 좋다. sql p / sql d 가 있는데 sql d 도전해보는것도 좋다.
-- sql D 현실적이고 실용적이다.
부서별 사원수
10, 3
20, 5
30, 6
SELECT deptno, count(*)
FROM emp
GROUP BY deptno;

전체 사원수
SELECT  count(*)
FROM emp

정렬
SELECT *
FROM emp
ORDER BY job, sal, hiredate;

