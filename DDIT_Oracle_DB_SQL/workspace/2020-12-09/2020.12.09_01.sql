 2020-12-09_01)
 SQL / java : ���α׷��� ���
 java : ������ ����
 SQL (Structured Query Language) :����ȭ�� ���� ���
    -RDBMS �� ����ϱ����� ������ ����
 ������, NO-SQL : Not only Sql
 ���� - ���̾� ���̽�, Mongo db
 
 RDBMS - ������ ������ ���� /  -- �����Ͱ��� �ߺ��� �ּ�ȭ 
 

 SELECT *
 FROM employees e, jobs j
 WHERE e.job_id = j.job_id;
 
 EXPLAIN PLAN FOR
 SELECT *
 FROM  jobs j, employees e
 WHERE j.job_id = e.job_id;  

--���� ���� �޿��� �޴� ����� EMPLOYEE_ID ���ϱ�
 SELECT employee_id, MAX(salary)
 FROM employees
 GROUP BY employee_id;
 
  SELECT employee_id, salary
 FROM employees
 GROUP BY employee_id;
 
 -- 14 ��
 SELECT *
 FROM EMP;
 
 -- 4��
 SELECT *
 FROM DEPT;
 
 ��������
 0. UNIQUE : ���� �ߺ��� ������� ����. �� NULL �� ����
 1. Primary Key == UNIQUE + NOT NULL
 �ش��÷� ���� ���̺��� �������� ����, NULL ���� �� �� ����.
 2. FK : ���� ���Ἲ
 3. CHECK 
 
 SELECT *
 FROM USER_CONSTRAINTS;   --����� ��������
 
 SELECT *
 FROM USER_CONSTRAINTS   --����� ��������
 WHERE TABLE_NAME IN ('EMP', 'DEPT');
 
 SELECT ename, TO_CHAR(hiredate, 'YYYY/MM/DD') , SYSDATE
 FROM EMP;  -- TO_CHAR �� ���ڰ� �ִ� �Լ�  SYSDATE �� ���ڰ� ���� �Լ�
  
 SELECT *
 FROM USER_CONS_COLUMNS  
 WHERE CONSTRAINT_NAME = 'PK_LPROD';
 
 ����� �μ��� �޿�(sal) �� ���� ���ϱ�
 emp ���̺� ���
 
 �м��Լ� (Window �Լ�)
 SELECT Window_function(arg)
 OVER([PARTITION BY columns] [ORDER BY columns][WIDOWING])
 ��������
  - PARTITION BY �÷��ڵ�
 ��������
  - ORDER BY �÷� �ڵ� [DESC | ASC ]
 ���� ����(WINDOWING)
  ROWS | RANGE BETWEEN UNBOUNDED PRECEDING[
  

  
  �м��Լ� : �ణ ���� ������ ���ִ� �Լ�
  SELECT �м��Լ��̸�([����]) OVER (�������� �������� ��������)
  FROM .....
  �������� : PARTITION BY �÷�
  �������� : ORDER BY �÷�
  �������� : PARTITION ������ Ư�� ����� ������ ����....(���߿��Ұ�)
  
  �Ϸ��� �ϴ� �� : emp ���̺��� �̿��Ͽ� �μ���ȣ ���� �޿� ��ŷ�� ���
                (�޿� ��ũ ���� : sal ���� ���� ����� ��ũ�� ���� ������ ���)
                
  �������� : deptno
  �������� : sal DESC
  
  SELECT ename, sal, deptno, 
         RANK()OVER(PARTITION BY deptno ORDER BY sal DESC) sal_rank, -- RANK() �м��Լ�
         DENSE_RANK()OVER(PARTITION BY deptno ORDER BY sal DESC) sal_dense_rank, 
         ROW_NUMBER()OVER(PARTITION BY deptno ORDER BY sal DESC) sal_row_number 

    FROM emp;
  
  �м��Լ�(Window �Լ� (�ǽ� ana1)
   - ����� ��ü �޿� ������ rank, dense_rank, row_number �� �̿��Ͽ� ���Ͻÿ�.
   - �� �޿��� ������ ��� ����� ��������� ���������� �ǵ��� �ۼ��ϼ���.
   
   SELECT empno, ename, sal, deptno, 
         RANK()OVER(ORDER BY sal DESC, empno) sal_rank, 
         DENSE_RANK()OVER(ORDER BY sal DESC, empno) sal_dense_rank, 
         ROW_NUMBER()OVER(ORDER BY sal DESC, empno) sal_row_number

    FROM emp;
    
    - ������ ��� ������ Ȱ���Ͽ�,
      ��� ����� ���� �����ȣ, ����̸�, �ش� ����� ���� �μ��� ������� ��ȸ�ϴ� ������ �ۼ��ϼ���.
    SELECT *
    FROM EMP;
    
    
  10 : select count(*)
        from emp
        where deptno = 10; emp ���̺��� �μ���ȣ
  
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
       -- ��Į�� ���������� �� �ึ�� ���� �Ǵ°�
       -- ���� ������ ���� �ð� �ҿ�
       
      
    WHERE : ��ȸ�Ǵ� ���� ����, WHERE���� ����� ������ �ش����� ������� ��(TRUE) ���� �Ǵܵ� ��� ��ȸ
    
   SELECT *
     FROM emp
    WHERE empno > 7782;
  
  �����Լ� : COUNT, SUM, AVG, MAX, MIN
  
  SELECT COUNT(*)  -- empno, ename, deptno
    FROM emp
   GROUP BY deptno;
 
 -- �μ��� �μ������� 4��° �÷����� ��ȸ   �߿��߿�
   SELECT empno, ename, deptno, COUNT(*) OVER(PARTITION BY DEPTNO)
    FROM emp;

 - window function �� �̿��Ͽ� ��� ����� ���� �����ȣ, ����̸�,     ���α޿�, �μ���ȣ��
    �ش����� ���� �μ��� �޿������ ��ȸ�ϴ� ������ �ۼ��ϼ���.
    (�޿� ����� �Ҽ��� ��° �ڸ����� ���Ѵ�)
    SELECT empno, ename, sal, deptno, ROUND(AVG(sal)OVER(PARTITION BY deptno),2) AVG_SAL
      FROM emp
 - window function �� �̿��Ͽ� ��� ����� ���� �����ȣ, ����̸�, ���α޿�, �μ���ȣ��
    �ش� ����� ���� �μ��� ���� ���� �޿��� ��ȸ�ϴ� ������ �ۼ��ϼ���.
    
    (�ִ�޿�)
    SELECT empno, ename, sal, deptno, MAX(sal)OVER(PARTITION BY deptno) MAX_SAL
    FROM emp
    
    (�ּұ޿�)
    SELECT empno, ename, sal, deptno, MIN(sal)OVER(PARTITION BY deptno) MIN_SAL
    FROM emp

����) ���� SQL�� �м��Լ��� ������� �ʰ� �ۼ��ϱ�
        
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
       

-- sql �ڰ��� �����غ��°͵� ����. sql p / sql d �� �ִµ� sql d �����غ��°͵� ����.
-- sql D �������̰� �ǿ����̴�.
�μ��� �����
10, 3
20, 5
30, 6
SELECT deptno, count(*)
FROM emp
GROUP BY deptno;

��ü �����
SELECT  count(*)
FROM emp

����
SELECT *
FROM emp
ORDER BY job, sal, hiredate;

