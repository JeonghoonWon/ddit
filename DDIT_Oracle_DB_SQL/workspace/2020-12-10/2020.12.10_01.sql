2020-12-10_01)

 SELECT *
 FROM emp,dept;
 
 
 ����
 �м��Լ�
 1. ���� : OVER, PARTITION BY, ORDER BY
    �Լ� : ���� RANK, DENSE_RANK, ROW_NUMBER,
          �����Լ� SUM, AVG, MAX, MIN, COUNT


 �м��Լ� (window�Լ�) �׷쳻 �� ����

 LAG(col)
    - ��Ƽ�Ǻ� �����쿡�� ���� ���� �÷� ��
 LEAD(col)
    - ��Ƽ�Ǻ� �����쿡�� ���� ���� �÷� ��
 
 �����ȣ, ����̸�, �Ի�����, �޿�, �ڽź��� �޿� ������ �Ѵܰ� ���� ����� �޿�
 �޿� ���� :  1. �޿��� ���� ���
            2. �޿��� ���� ��� �Ի����ڰ� ���� ���
 
 SELECT empno, ename, hiredate, sal,
        LEAD(sal) OVER (ORDER BY sal DESC, hiredate ASC) LEAD,
        LEAD(sal,3) OVER (ORDER BY sal DESC, hiredate ASC) LEAD2 
        -- LEAD(sal, ����) ���� ��ŭ �� ���� �ǳʶ۲���
        -- ���ڰ� ������ 1 �� �ǳʶٴ� ��.
   FROM emp
  ORDER BY sal DESC, hiredate ASC;
  
    ����) window function �� �̿��Ͽ� ��� ����� ���� �����ȣ, ����̸�,
    �Ի�����, �޿�, ��ü ��� �� �޿� ������ 1�ܰ� ���� ����� �޿��� ��ȸ�ϴ�
    ������ �ۼ� �Ͻÿ�. (�޿��� ���� ��� �Ի����� ���� ����� ���� ����)
  
    (window function)
    SELECT empno, ename, hiredate, sal, 
           LAG(sal) OVER (ORDER BY SAL DESC, hiredate ASC) SAL1
      FROM emp;
     
     
     (window function ��� ����)
     SELECT EMPNO, ENAME, HIREDATE, sal, 
            RANK()OVER(ORDER BY sal DESC, hiredate ASC) AS rn
     
     FROM EMP;
    
   
    
    -- ������ ��
    
    a�� 2���� b�� 1���� ����
    a�� 3���� b�� 2���� ����
    a�� 1���� b�� n-1 ���� ����
    a.rn = b.rn -1
    
    (window function ��� ����)
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
 
  ����) window fuction �� �̿��Ͽ� ��� ��������� �����ȣ, ����̸�,
        �Ի�����, ����(job), �޿� ������ ������(JOB) �� �޿� ������ 1�ܰ� ����
        ����� �޿��� ��ȸ�ϴ� ������ �ۼ��ϼ���.
        (�޿��� ���� ��� �Ի����� ���� ����� ��������)
        
        SELECT  empno, ename, hiredate, JOB, SAL,
          LAG(sal) OVER (PARTITION BY job ORDER BY SAL DESC, hiredate ASC) LAG_SAL
        FROM EMP;
     
    
 ��Ÿ ���� : ���� ������ �𸣴��� �ƴ� ��Ȳ
 
  
  SELECT empno, ename, sal, SUM(sal) OVER (ORDER BY sal ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
    FROM EMP;
    
   Windowing
    window �Լ��� ����� �Ǵ� ���� ����
    
    UNBOUNDED PRECEDING :
     - ���� �� ���� ��� ���� ��
    CURRENT ROW :
     - ������
    UNBOUNDED FOLLOWING :
     - ���� �� ���� ��� ������
 
  �����ȣ, ����̸�, �μ���ȣ, �޿� ������ �μ����� �޿�, �����ȣ, ������������ ����������,
  �ڽ��� �޿��� �����ϴ� ������� �޿� ���� ��ȸ�ϴ� ������ �ۼ��Ͻÿ� (window �Լ� ���)
  ana7]
  SELECT empno, ename, deptno, sal,
  SUM(sal) OVER (PARTITION BY deptno ORDER BY sal, empno 
                 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) C_SUM
  FROM EMP;
  
  ROWS / RANGE ����
  �м��Լ����� ORDER BY �� ���Ŀ� WINDOWING ���� ������ ��� ������ WINDOWING�� �⺻���� ����ȴ�.
  RANGE UNBOUNDED PRECEDING
  == RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ROWS : �������� ���� ����
  RANGE : ������ ���� ����
  
  SELECT empno, ename, sal,
        SUM(sal) OVER (ORDER BY sal ROWS UNBOUNDED PRECEDING) rows_sum,
        SUM(sal) OVER (ORDER BY sal RANGE UNBOUNDED PRECEDING) range_sum,
        SUM(sal) OVER (ORDER BY sal) default_sum
    FROM emp;    
    
 ROWNUM : select ������� ��ȯ�� ���� ��ȣ�� 1���� �ο����ִ� �Լ�
 Ư¡ : WHERE ������ ��� ����
        ���� �ǳʶٴ� ���·� ��� �Ұ�
        ==>ROWNUM �� 1���� ���������� ���� ��쿡�� ��� ����
        WHERE ROWNUM = 1; (O) ����
        WHERE ROWNUM = 2; (X) // 1�� �ǳʶپ��� ������ ���������� ��ȸ���� ����
        WHERE ROWNUM < 5; (O) ���� 1~4
        WHERE ROWNUM > 5; (X) 1~4�� ���� �ʰ� �ǳ� ��
        
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
  
  
  
  ������ ����� 10�϶�
  1 PAGE : 1~10
  2 PAGE : 11 ~ 20
  n PAGE : (:page-1)* : pageSize +1 ~ : page * :pageSize
  
  ������ ����� 5�϶�
  
  
 SELECT empno, ename, hiredate
   FROM emp
  ORDER BY hiredate desc;
  



  -------------------------------------------------
 SELECT ROWNUM, empno, ename, hiredate
   FROM emp
  ORDER BY hiredate desc;  -- �̷��� �Ǹ� SELECT ���� ���� ���� �� �� ORDER BY �����
                           -- empno �� rownum���� ��� �� 
 ------------------------------------------------------- 
 (SELECT empno, ename, hiredate
   FROM emp
  ORDER BY hiredate desc;) -- �ζ��� ��� ����� ���� HIREDATE ������ ���ڰ� �ٴ´�.
  
  SELECT ROWNUM, A.*
         FROM    (SELECT empno, ename, hiredate
                    FROM emp
                   ORDER BY hiredate desc) A;  -- FROM �� �ȿ��� ����Ǵ� �Ŵϱ� 
                                               -- FROM ���� �ζ��� �並 �ִ´�.
                                               -- HIREDATE ������ ���� ����.
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
     
   -- member ���̺��� �ΰ��� �÷��� ��ȸ : mem_id, mem_name
   -- �̸�(mem_name) �÷� ������������ ��ȸ�Ǵ� ����� ����¡ ó���ϴ� ������ �ۼ��ϼ���.
   
   SELECT *
     FROM 
     (SELECT ROWNUM rn, a.*
        FROM 
             (SELECT mem_id, mem_name
                FROM member    
               ORDER BY mem_name ASC) a)  -- ASC �� ���� ����
    WHERE rn BETWEEN (:page-1) * :pageSize +1 AND :page*  :pageSize
  
  
  SQL ���� ����
  
  ������ SQL �̶�� ���� ���ڿ��� �Ϻ��ϰ� �����ؾ���
  ����, ��ҹ��ڵ� �Ϻ��ϰ� ��ġ�ؾ� ������ SQL �� �ν�
   
   SELECT /*DDIT*/ mem_id, mem_name
     FROM member
    WHERE mem_id = 'a001';
    -- ��� ���̵� �˰� �ְ� �� ����� ������ �˰� ���� �� ��� �ϴ� ����
    
 �����ȹ Ȯ�� ���
  1. ������ SQL ���� EXPLAIN PLAN FOR �� �ۼ��ϰ� ����
  2. ���� ��ȹ ��ȸ
    SELECT *
    FROM TABLE(DBMS_XPLAN.DISPLAY);
    
 EXPLAIN PLAN FOR
 SELECT mem_id
   FROM member
  WHERE mem_id = 'a001'
    -- ���� �Ǿ����ϴ�. ��� ��� ��.
 
  SELECT *
    FROM TABLE(DBMS_XPLAN.DISPLAY);  
    --  �����ȹ �Ǵ� ��
    
    �����ȹ �ؼ� ���
    1. ������ �Ʒ���
    2. �� �ڽ� ���(�鿩����)�� ���� ��� �ڽĺ���
     
     1->0 �ڽĳ�� ���� �а� 0 �д´�
----------------------------------------------------------------------------
| Id  | Operation         | Name   | Rows  | Bytes | Cost (%CPU)| Time     |
----------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |        |    24 |  4728 |     2   (0)| 00:00:01 |
|   1 |  TABLE ACCESS FULL| MEMBER |    24 |  4728 |     2   (0)| 00:00:01 |
----------------------------------------------------------------------------
--   |   1 |  TABLE ACCESS FULL| MEMBER |  �鿩���� �� �Ǿ��ֱ� ������ �̰� �ڽ� ���
   
   
   
   OracleServiceXE �� ��ǻ�Ͱ� ������ �ڵ����� ���� �Ǳ⶧���� sqldeveloper�� �����ص� �����
   
   1. �����м� / �����ȹ
    - ���� Ǯ���� ������ ���� ��ȹ�� �ִ����˻�(Ŀ�� ����)
    - SQL Sytax �˻�
    - Semantic �˻�
    - Data Dictionary 
    - ���� ��ü �˻�
    - ��Ű��, ��, ����
    - ���� ��ȹ �ۼ�
    
   2. ���ε�
    - ���ε� ���� ���� �ִ� ��� �Ҵ�
    
   3. ����
    - ���� ��ȹ ����
    - ���࿡ �ʤ��� �۾� ����
    - DB
   
   4. ����
  
  SELECT ROWID, mem_id
    FROM MEMBER
   ORDER BY mem_id; 
    
      -- ROWID  = ������. �ش� �����Ϳ� ������ �� �ִ� �ּ�.
    
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
    
    -- ���� ���� �ٸ��� SELECT ���� mem_id �ϳ����� ��ȸ ������ Ŀ���� ����ڰ� ��ȸ��û�� �����ʾ���. 
    -- �ٸ� ���̺��� �ʿ� ����.
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
   -- ���� ���� : 2 - 3 - 1 - 0 
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
   
  