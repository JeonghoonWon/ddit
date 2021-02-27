PL/SQL (procedure ���� �ǽ� PRO _ 2)

registdept_test procedure ����
param : deptno, dname, loc
logic : �Է¹��� �μ� ������ dept ���̺� �ű� �Է�
exec registdept_test (99, 'ddit', 'deajeon');
dept_test ���̺� ���������� �̷� �Ǿ����� Ȯ�� (SQL - ������)

CREATE OR REPLACE printdept (p_deptno dept. deptno%TYPE) is

BEGIN
    SELECT 
END


--------------------------------------------------------
--�ܲ�
    CTAS : CHECK ������ ������ ������ �������ǵ��� ������� �ʴ´�.
    CREATE TABLE dept_test AS   -- CREATE TABLE �̸� AS  CTAS �������
    SELECT *
    FROM dept
    WHERE 1 = 2;
    -- dept ���̺� dept_test �� ����
    
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
    PL/SQL (procedure ���� �ǽ� PRO _ 3)

    UPDATEdept_test procedure ����
    param : deptno, dname, loc
    logic : �Է¹��� �μ� ������ dept ���̺� ���� ����
    exec UPDATEdept_test (99, 'ddit_m', 'deajeon');
    dept_test ���̺� ���������� �̷� �Ǿ����� Ȯ�� (SQL - ������)
 
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
 --������ �ϽŰ�
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
   �м��Լ� / window �Լ� ( �׷쳻 �� ���� - �����غ���, �ǽ� no_ana3)
   
   ��� ����� ���� �����ȣ, ����̸� ,�Ի�����, �޿��� �޿��� ���������� ��ȸ�غ���.
   �޿��� ������ ��� �����ȣ�� ��������� �켱������ ����.
   �켱 ������ ���� ������� ���α��� �޿� �դ��� ���ο� �÷����� ����(window �Լ�����)
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
     -- ��ü�� ��ҹ��ڸ� ������ �ʴ´�
     --  but ���
     SELECT a.empno, a.ename, a.sal SUM(a.sal) OVER (ORDER BY sal, empno)
       FROM emp
       
       
       -- �����ڵ��� ���� �ʾƾ� �� ĥ������
       
       SELECT *
         FORM EMP
        WHERE LOWER (ename) = 'smith';
         -- emp ����� ��ŭ �˻� �ϴ� ��
        
       SELECT *
         FROM EMP
        WHERE ename = UPPER('smith');
        -- 'smith' �ѹ��� �˻�
        
        
   ana0]
   1. ���� ���Ƿ� ����
 
    SINGLE ROW FUNCTION : LENGTH, LOWER
    MULTI ROW FUNCTION : SUM, MAX...
   
   SELECT LENGTH('HELLO, WORLD')
     FROM dual;
    -- DUAL
    -- 1. ����Ŭ ��ü���� �����Ǵ� ���̺�
    -- 2. �����ϰ� �Լ��� �̿��ؼ� ��� ������� Ȯ�� �� �� ����ϴ� ���̺�
    -- 3.  ��� ����ڿ��� ���� ������
    -- 4. �� ����, ���÷��� ��� �ִ� dummy ���̺�

    
   SELECT emp*, LENGTH('HELLO, WORLD')
     FROM emp;
    
   SELECT *
     FROM DUAL
  CONNECT BY LEVEL <= 10;
    
   -- ���� ���� ���ϴ� ��ŭ ����������
   -- ��� ���� ©�� �׻� ���´�
        
    SELECT DUAL.*, LEVEL
      FROM DUAL
   CONNECT BY LEVEL <= 10;   
   
   SELECT LEVEL
     FROM dual
  CONNECT BY LEVEL <= (SELECT COUNT(*) FROM emp);
  -- emp �ο����� ī��Ʈ�ؼ� �� ���� ����
  
  10 3
  20 5
  30 6 
  �� �μ��� �ο���
  
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
 
 
PL / SQL (���� ����)

 - %rowtype
 - 
 
 ��(�÷�)   -   ��(��)      -  ��(���̺�)
 %TYPE       %ROWTYPE      table type
            RECORD TYPE
            
 ROWTYPE : �� ��ü�� ������ �� �ִ� ����
            �÷��� ���� ���̺��� ���� ������ ���� �� �÷����� ������ �������� �ʰ�
            ������� �ѹ��� ������ �ϰ� ����ϹǷ� ���Ǽ��� ����ȴ�.
            
 DEPT ���̺��� 10�� �μ������� ���� �� �ִ� ROWTYPE �� �����Ͽ� Ȱ��
 SET SERVEROUTPUT ON;
 DECLARE
     -- ������ ����Ÿ��
     v_dept_row dept%ROWTYPE;
 BEGIN
    SELECT* INTO v_dept_row
    FROM dept
    WHERE deptno = 10;
    
    -- �÷��� �� ���� : rowtype. �÷���
    DBMS_OUTPUT.PUT_LINE (v_dept_row.dname || '/' || v_dept_row.loc);
        
    END;
    /
    
    RECORD TYPE : �����ڰ� �����Ϸ����ϴ� �÷��� ���� �����Ͽ� �࿡ ���� Ÿ���� ����
                    (JAVA���� Ŭ������ ����)
                    
    ������
    TYPE Ÿ�Ը� IS RECORD (
        ename emp.ename%TYPE,
        dname dept.dname%TYPE
)
 
 DECLARE
    TYPE name_row IS RECORD (
        ename emp.ename%TYPE,
        dname dept.dname%TYPE);
    -- ������ ����Ÿ��    
    names name_row;
BEGIN
        SELECT ename, dname INTO names
          FROM  emp, dept
          WHERE emp.deptno = dept.deptno
          and empno = 7839;
          DBMS_OUTPUT.PUT_LINE(names.ename || '/' || names.dname);
 END;
 /
 
 TABLE TYPE : �������� ������ �� �ִ� Ÿ��
 TYPE Ÿ���̸� IS RECORD
 TYPE Ÿ���̸� IS TABLE OF ���ڵ� Ÿ�� / %ROWTYPE INDEX BY BINARY_INTEGER
 java ������ INT[] arr = new int[50];

 
  DECLARE
    TYPE name_row IS RECORD (
        ename emp.ename%TYPE,
        dname dept.dname%TYPE);
   
    TYPE name_tab IS TABLE OF NAME_ROW INDEX BY BINARY_INTEGER;
    -- ������ ����Ÿ��    
    names name_tab;
BEGIN
        SELECT ename, dname BULK COLLECT INTO names
          FROM  emp, dept
         WHERE emp.deptno = dept.deptno;
          -- for(int i = 0; i < names.length
          FOR i IN 1..names.count LOOP  -- I �� 1���� 14 ���� ��� ��. �ε��� �ѹ��� �־��ش�
           DBMS_OUTPUT.PUT_LINE(names(i).ename || '/' || names(i).dname);
          END LOOP;  -- FOR END LOOP; �� ���� �ݴ´� JAVA �ʹ� �ٸ���
                  
  END;
 /
 
    