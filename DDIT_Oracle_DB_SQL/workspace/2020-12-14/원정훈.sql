  PL/SQL (procedure ���� �ǽ� PRO_1)
    printemp procedure ����
    param : empno
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