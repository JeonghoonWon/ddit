2020-12-11_01)
PL / SQL

 Procedural Language /SQL

 ����Ŭ���� �����ϴ� ���α׷��� ���

 ������ ������ ���� SQL �� �Ϲ� ���α׷��� ��� ��Ҹ� �߰�
  - SQL ���� �������� �ʴ� �ݺ���, ���ǹ��� ����
 �����͸� ���������� ó���ϴµ� �� ����
 
 JAVA
 ����Ÿ�� ������ = ������;
 
 PL/SQL
 ������ ����Ÿ�� := ������;
  
  
  �⺻����
   Declare(�����)
    -����, ��� ���� ����
    -��������
  
   begin(�����,����)
    - ���, �ݺ��� ���� ���� ����
    - �����Ͻ� ���� �ۼ�(SQL, IF, LOOP)
  
   Exception(���� ó����)
    - ���� ���� ���� �߻��� catch, �ļ� ��ġ
    - ���� ����
    - ����ó��(JAVA-TRY.CATCH)
    
    
   1. DNAME, LOC �÷� �ΰ��� ������ ��´�.
   2. �ΰ��� �������� ���(System.out.println)
   SELECT *
     FROM dept;
     
   DESC dept;  
   -- ���� ������ �� �� �ִ�.
   
   ���� ���� : ������ ����Ÿ��;
   pl/sql : ������ �۸�� V_XXX ���ξ� ���
  
  SET SERVEROUTPUT ON;
  
   DECLARE
        V_DNAME VARCHAR2(14);
        V_LOC VARCHAR2(13);
   BEGIN
        SELECT DNAME, LOC INTO V_DNAME, V_LOC
          FROM dept
         WHERE deptno = 10;
         
 --        System.out.println(v_dname + "/" + v_loc);  = java �� ���
         
         DBMS_OUTPUT.PUT_LINE (V_DNAME || ' / ' || V_LOC);

   END;
   /
   
   
    AOP(Aspect Oriented Programing)
   OOP(Object Oriented Programing)
   
   VIEW �� ���� �̴�.
   ����(query (���Ǿ�) ���� ������ ���� ��û�� ���̴� ��ǻ�� ���
   
   
   SELECT *
   FROM V_EMP01;
  
  
  �������� : Ư�� ���̺��� �÷��� ������ Ÿ���� �ڵ����� ����  ==> �÷��� ������ Ÿ���� �ٲ�
            pl/sql ����� ���� �����θ� ������ �ʿ䰡 ������ : ���������� ����
            ���̺��.�÷��� %type; 
  DECLARE
        V_DNAME dept.dname%type;
        V_LOC dept.loc%type;
   BEGIN
        SELECT DNAME, LOC INTO V_DNAME, V_LOC
          FROM dept
         WHERE deptno = 10;
         
 --        System.out.println(v_dname + "/" + v_loc);  = java �� ���
         
         DBMS_OUTPUT.PUT_LINE (V_DNAME || ' / ' || V_LOC);

   END;
   /
   
  pl/sql block ����
  1. �͸� �� : inline-view
  2. procedure : ����Ŭ ������ ������ pl/sql ��, ���ϰ��� ����
  3. function : ����Ŭ ������ ������ pl/sql ��, ���ϰ��� �ִ�
  
  ����Ŭ ��ü
  CREATE ����Ŭ��üŸ�� ��ü�̸�....
  CREATE TABLE ���̺��
  CREATE [OR REPLACE] VIEW ���̸�
  
 ���� ���ν����� 10�� �μ��� ������ ��ȸ�� �ǰԲ� �ڵ尡 ������(hard coding) 
 procedure ���ڷ� ��ȸ�ϰ� ���� �μ���ȣ�� �޵��� �����Ͽ� �ڵ带 �����ϰ� ����� ����
  
 ���ν����� �����Ҷ� ���ڸ� ���ν����� �ڿ� ������ �� ����
 ���ڴ� �޼ҵ�� ���������� �������� ���� �� ����
 
 �����ð����� ���ν������� ���� �̸��� P_xxx ���ξ ����ϱ�� �սô�.
 
  CREATE OR REPLACE PROCEDURE [( ���ڸ� ����Ÿ�� )]
  CREATE OR REPLACE PROCEDURE printdept(p_deptno dept.deptno%TYPE) IS
    -- DECLARE (�����) �� ���� �� ��
    v_dname dept.dname%TYPE;  -- ������ V_ �� ����
    v_loc dept.loc%TYPE;
BEGIN
    SELECT dname, loc INTO V_DNAME, V_LOC  --������ ������ ��ڴ�
    FROM dept
    WHERE deptno = p_deptno;
    DBMS_OUTPUT.PUT_LINE(V_DNAME|| '/' || V_LOC);
END;
/
     EXEC printdept;

  ���ν��� ����
  EXEC ���ν�����
  
  EXEC printdept(50);
    
  PL/SQL (procedure ���� �ǽ� PRO_1)
    printemp procedure ����
    param :empno
    logic : empno�� �ش��ϴ� ����� ������ ��ȸ�Ͽ�
            ����̸�, �μ��̸��� ȭ�鿡 ���
            
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
         EXEC printemp(7900);   -- 2���� ���ϳ� 
   ---------------------�ٽ�  
            
        


            