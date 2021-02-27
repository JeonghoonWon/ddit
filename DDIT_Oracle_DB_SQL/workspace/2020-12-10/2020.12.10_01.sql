2020-12-10_01)

 SELECT *
 FROM emp,dept;
 
 
 복습
 분석함수
 1. 문법 : OVER, PARTITION BY, ORDER BY
    함수 : 순위 RANK, DENSE_RANK, ROW_NUMBER,
          집계함수 SUM, AVG, MAX, MIN, COUNT


 분석함수 (window함수) 그룹내 행 순서

 LAG(col)
    - 파티션별 윈도우에서 이전 행의 컬럼 값
 LEAD(col)
    - 파티션별 윈도우에서 이후 행의 컬럼 값
 
 사원번호, 사원이름, 입사일자, 급여, 자신보다 급여 순위가 한단계 낮은 사람의 급여
 급여 순위 :  1. 급여가 높은 사람
            2. 급여가 같을 경우 입사일자가 빠른 사람
 
 SELECT empno, ename, hiredate, sal,
        LEAD(sal) OVER (ORDER BY sal DESC, hiredate ASC) LEAD,
        LEAD(sal,3) OVER (ORDER BY sal DESC, hiredate ASC) LEAD2 
        -- LEAD(sal, 숫자) 숫자 만큼 몇 행을 건너뛸껀지
        -- 숫자가 없으면 1 행 건너뛰는 것.
   FROM emp
  ORDER BY sal DESC, hiredate ASC;
  
    문제) window function 을 이용하여 모든 사원에 대해 사원번호, 사원이름,
    입사일자, 급여, 전체 사원 중 급여 순위가 1단계 높은 사람의 급여를 조회하는
    쿼리를 작성 하시오. (급여가 같을 경우 입사일이 빠른 사람이 높은 순위)
  
    (window function)
    SELECT empno, ename, hiredate, sal, 
           LAG(sal) OVER (ORDER BY SAL DESC, hiredate ASC) SAL1
      FROM emp;
     
     
     (window function 사용 안함)
     SELECT EMPNO, ENAME, HIREDATE, sal, 
            RANK()OVER(ORDER BY sal DESC, hiredate ASC) AS rn
     
     FROM EMP;
    
   
    
    -- 선생님 꺼
    
    a가 2위면 b의 1위와 연결
    a가 3위면 b의 2위와 연결
    a가 1위면 b의 n-1 위와 연결
    a.rn = b.rn -1
    
    (window function 사용 안함)
 (ANSI JOIN)
 select a.empno, a.ename, a.hiredate, a.sal, b.sal
 from
    (select empno, ename, hiredate, sal,
            row_number()over(ORDER BY SAL DESC, hiredate) rn
        from emp) a left outer join
    (select empno, ename, hiredate, sal,
        row_number()over(ORDER BY SAL DESC, hiredate) rn
        from emp) b on(a.rn  = b.rn+1)
  order by a.rn;
 
  문제) window fuction 을 이용하여 모든 사원에대해 사원번호, 사원이름,
        입사일자, 직군(job), 급여 정보와 담당업무(JOB) 별 급여 순위가 1단계 높은
        사람의 급여를 조회하는 쿼리를 작성하세요.
        (급여가 같을 경우 입사일이 빠른 사람이 높은순위)
        
        SELECT  empno, ename, hiredate, JOB, SAL,
          LAG(sal) OVER (PARTITION BY job ORDER BY SAL DESC, hiredate ASC) LAG_SAL
        FROM EMP;
     
    
 메타 인지 : 내가 무엇을 모르는지 아는 상황
 
  
  SELECT empno, ename, sal, SUM(sal) OVER (ORDER BY sal ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
    FROM EMP;
    
   Windowing
    window 함수에 대상이 되는 행을 지정
    
    UNBOUNDED PRECEDING :
     - 현재 행 기준 모든 이전 행
    CURRENT ROW :
     - 현재행
    UNBOUNDED FOLLOWING :
     - 현재 행 기준 모든 이후행
 
  사원번호, 사원이름, 부서번호, 급여 정보를 부서별로 급여, 사원번호, 오름차순으로 정렬했을때,
  자신의 급여와 선행하는 사원들의 급여 합을 조회하는 쿼리를 작성하시오 (window 함수 사용)
  ana7]
  SELECT empno, ename, deptno, sal,
  SUM(sal) OVER (PARTITION BY deptno ORDER BY sal, empno 
                 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) C_SUM
  FROM EMP;
  
  ROWS / RANGE 차이
  분석함수에서 ORDER BY 절 이후에 WINDOWING 절을 생략할 경우 다음의 WINDOWING이 기본으로 적용된다.
  RANGE UNBOUNDED PRECEDING
  == RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ROWS : 물리적인 행의 단위
  RANGE : 논리적인 행의 단위
  
  SELECT empno, ename, sal,
        SUM(sal) OVER (ORDER BY sal ROWS UNBOUNDED PRECEDING) rows_sum,
        SUM(sal) OVER (ORDER BY sal RANGE UNBOUNDED PRECEDING) range_sum,
        SUM(sal) OVER (ORDER BY sal) default_sum
    FROM emp;    
    
 ROWNUM : select 순서대로 반환된 행의 번호를 1부터 부여해주는 함수
 특징 : WHERE 절에서 사용 가능
        행을 건너뛰는 형태로 사용 불가
        ==>ROWNUM 이 1부터 순차적으로 사용된 경우에만 사용 가능
        WHERE ROWNUM = 1; (O) 가능
        WHERE ROWNUM = 2; (X) // 1을 건너뛰었기 때문에 정상적으로 조회되지 않음
        WHERE ROWNUM < 5; (O) 가능 1~4
        WHERE ROWNUM > 5; (X) 1~4를 읽지 않고 건너 뜀
        
 SELECT ROWNUM, empno, ename
   FROM emp
  WHERE ROWNUM = 1;
  
 SELECT ROWNUM, empno, ename
   FROM emp
  WHERE ROWNUM = 2;
  
 SELECT ROWNUM, empno, ename
   FROM emp
  WHERE ROWNUM < 5; 
  
 SELECT ROWNUM, empno, ename
   FROM emp
  WHERE ROWNUM > 5; 
  
  
  
  페이지 사이즈가 10일때
  1 PAGE : 1~10
  2 PAGE : 11 ~ 20
  n PAGE : (:page-1)* : pageSize +1 ~ : page * :pageSize
  
  페이지 사이즈가 5일때
  
  
 SELECT empno, ename, hiredate
   FROM emp
  ORDER BY hiredate desc;
  



  -------------------------------------------------
 SELECT ROWNUM, empno, ename, hiredate
   FROM emp
  ORDER BY hiredate desc;  -- 이렇게 되면 SELECT 절이 먼저 실행 된 후 ORDER BY 실행됨
                           -- empno 를 rownum으로 잡게 됨 
 ------------------------------------------------------- 
 (SELECT empno, ename, hiredate
   FROM emp
  ORDER BY hiredate desc;) -- 인라인 뷰로 만들면 위에 HIREDATE 순으로 숫자가 붙는다.
  
  SELECT ROWNUM, A.*
         FROM    (SELECT empno, ename, hiredate
                    FROM emp
                   ORDER BY hiredate desc) A;  -- FROM 절 안에서 수행되는 거니까 
                                               -- FROM 절에 인라인 뷰를 넣는다.
                                               -- HIREDATE 순으로 숫자 붙음.
  ----------------------------------------------
    1PAGE : 1~10
     SELECT ROWNUM, A.*
         FROM    (SELECT empno, ename, hiredate
                    FROM emp
                   ORDER BY hiredate desc) A
      WHERE ROWNUM BETWEEN 1 AND 10;     -- 1PAGE           
 

 ----------------------------------------------
   2PAGE : 11~20   
    SELECT *
    FROM
    (SELECT ROWNUM rn, A.*
         FROM    (SELECT empno, ename, hiredate
                    FROM emp
                   ORDER BY hiredate desc) A)
     WHERE rn BETWEEN 11 AND 20;         -- 2PAGE     
     
-------------------------------------------------     
  SELECT *
    FROM
    (SELECT ROWNUM rn, A.*
         FROM    (SELECT empno, ename, hiredate
                    FROM emp
                   ORDER BY hiredate desc) A)
     WHERE rn BETWEEN :st AND :ed;   
     
  SELECT *
    FROM
    (SELECT ROWNUM rn, A.*
         FROM    (SELECT empno, ename, hiredate
                    FROM emp
                   ORDER BY hiredate desc) A)
     WHERE rn BETWEEN (:page-1)* :pageSize+1  AND :page*:pageSize   
     
   -- member 테이블에서 두개의 컬럼만 조회 : mem_id, mem_name
   -- 이름(mem_name) 컬럼 오름차순으로 조회되는 결과를 페이징 처리하는 쿼리를 작성하세요.
   
   SELECT *
     FROM 
     (SELECT ROWNUM rn, a.*
        FROM 
             (SELECT mem_id, mem_name
                FROM member    
               ORDER BY mem_name ASC) a)  -- ASC 는 생략 가능
    WHERE rn BETWEEN (:page-1) * :pageSize +1 AND :page*  :pageSize
  
  
  SQL 실행 절차
  
  동일한 SQL 이라는 것은 문자열이 완벽하게 동일해야함
  공백, 대소문자도 완벽하게 일치해야 동일한 SQL 로 인식
   
   SELECT /*DDIT*/ mem_id, mem_name
     FROM member
    WHERE mem_id = 'a001';
    -- 멤버 아이디를 알고 있고 그 사람의 정보를 알고 싶을 때 사용 하는 쿼리
    
 실행계획 확인 방법
  1. 실행할 SQL 위에 EXPLAIN PLAN FOR 를 작성하고 실행
  2. 실행 계획 조회
    SELECT *
    FROM TABLE(DBMS_XPLAN.DISPLAY);
    
 EXPLAIN PLAN FOR
 SELECT mem_id
   FROM member
  WHERE mem_id = 'a001'
    -- 설명 되었습니다. 라고 출력 됨.
 
  SELECT *
    FROM TABLE(DBMS_XPLAN.DISPLAY);  
    --  실행계획 되는 것
    
    실행계획 해석 방법
    1. 위에서 아래로
    2. 단 자식 노드(들여쓰기)가 있을 경우 자식부터
     
     1->0 자식노드 먼저 읽고 0 읽는다
----------------------------------------------------------------------------
| Id  | Operation         | Name   | Rows  | Bytes | Cost (%CPU)| Time     |
----------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |        |    24 |  4728 |     2   (0)| 00:00:01 |
|   1 |  TABLE ACCESS FULL| MEMBER |    24 |  4728 |     2   (0)| 00:00:01 |
----------------------------------------------------------------------------
--   |   1 |  TABLE ACCESS FULL| MEMBER |  들여쓰기 가 되어있기 때문에 이건 자식 노드
   
   
   
   OracleServiceXE 가 컴퓨터가 켜지면 자동으로 실행 되기때문에 sqldeveloper만 실행해도 연결됨
   
   1. 구문분석 / 실행계획
    - 공유 풀에서 동일한 실행 계획이 있는지검색(커서 공유)
    - SQL Sytax 검사
    - Semantic 검사
    - Data Dictionary 
    - 참조 객체 검사
    - 스키마, 롤, 권한
    - 실행 계획 작성
    
   2. 바인드
    - 바인드 변수 값이 있는 경우 할당
    
   3. 실행
    - 실행 계획 적용
    - 실행에 필ㅇ한 작업 실행
    - DB
   
   4. 인출
  
  SELECT ROWID, mem_id
    FROM MEMBER
   ORDER BY mem_id; 
    
      -- ROWID  = 포인터. 해당 데이터에 접근할 수 있는 주소.
    
  EXPLAIN PLAN FOR
    SELECT *
      FROM member
     WHERE mem_id = 'a001'
    
    
     SELECT *
       FROM TABLE(DBMS_XPLAN.DISPLAY);  
  
  -----------------------------------------------------------------------------------------
| Id  | Operation                   | Name      | Rows  | Bytes | Cost (%CPU)| Time     |
-----------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |           |     1 |   197 |     1   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| MEMBER    |     1 |   197 |     1   (0)| 00:00:01 |
|*  2 |   INDEX UNIQUE SCAN         | PK_MEM_ID |     1 |       |     0   (0)| 00:00:01 |
-----------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("MEM_ID"='a001')
  

  
  EXPLAIN PLAN FOR
 SELECT mem_id
   FROM member
  WHERE mem_id = 'a001'
   
   SELECT *
    FROM TABLE(DBMS_XPLAN.DISPLAY);  
    
    -- 위에 꺼랑 다르게 SELECT 에서 mem_id 하나만을 조회 나머지 커럼을 사용자가 조회요청을 하지않았음. 
    -- 다른 테이블이 필요 없다.
  -------------------------------------------------------------------------------
| Id  | Operation         | Name      | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |           |     1 |     5 |     0   (0)| 00:00:01 |
|*  1 |  INDEX UNIQUE SCAN| PK_MEM_ID |     1 |     5 |     0   (0)| 00:00:01 |
-------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("MEM_ID"='a001')  
  
  
  
  EXPLAIN PLAN FOR
 SELECT *
   FROM prod, lprod
  WHERE prod.prod_lgu = lprod_gu;
   
   SELECT *
    FROM TABLE(DBMS_XPLAN.DISPLAY);   
   -- 실행 순서 : 2 - 3 - 1 - 0 
  ----------------------------------------------------------------------------
| Id  | Operation          | Name  | Rows  | Bytes | Cost (%CPU)| Time     |
----------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |       |    74 | 18426 |     6  (17)| 00:00:01 |
|*  1 |  HASH JOIN         |       |    74 | 18426 |     6  (17)| 00:00:01 |
|   2 |   TABLE ACCESS FULL| LPROD |     9 |   180 |     2   (0)| 00:00:01 |
|   3 |   TABLE ACCESS FULL| PROD  |    74 | 16946 |     3   (0)| 00:00:01 |
----------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("PROD"."PROD_LGU"="LPROD_GU")
   
  