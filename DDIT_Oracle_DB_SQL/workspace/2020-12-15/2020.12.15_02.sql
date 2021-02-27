2020-12-15_02) Ŀ��(CURSOR)
    - ������ ���࿡ ���� �޴� ����� ����
    - ������ Ŀ���� ����� Ŀ���� ����
  1) ������ Ŀ�� (IMPLICIT CURSOR)
    - SQL ����� ����Ǹ� �ڵ����� �����Ǵ� Ŀ��
    - �͸�Ŀ��
    - �������� ����� ����ʰ� ���ÿ� CLOSE �Ǿ� ����ڰ� ������ �� ����
    - Ŀ�� �Ӽ�
   -- ����ο����� ���� �� �� �ִ� �� 
   -- ���� ��� Ŀ�� 
    
 -------------------------------------------------------------------
        �Ӽ���             ����
 -------------------------------------------------------------------
      SQL%FOUND         Ŀ���� �ϳ��� ���̶� �����ϸ� ��(TRUE) ��ȯ
      SQL%NOTFOUND      Ŀ���� �ϳ��� ���̶� �����ϸ� ����(FALSE) ��ȯ
      SQL%ISOPEN        Ŀ���� OPEN�Ǿ����� ��(�͸�Ŀ���� �׻� FALSE)
      SQL%ROWCOUNT      Ŀ���� ���Ե� ���� ��
 -------------------------------------------------------------------     
    SELECT * FROM LPROD;
    
 ��) ȸ�����̺��� �������� '����' �� ȸ���� �̸��� �ڽ��� �̸����� �����ϰ�
     ����� ó���Ǿ����� Ȯ���ϴ� �͸����� �ۼ��Ͻÿ�.
    
    DECLARE
    
    BEGIN
        UPDATE MEMBER
           SET MEM_NAME = MEM_NAME
         WHERE MEM_ADD1 LIKE '����%';
         
         DBMS_OUTPUT.PUT_LINE('ó���Ǽ� = '||SQL%ROWCOUNT);
         
    END;
    
   
    SELECT COUNT(*)
      FROM MEMBER
     WHERE MEM_ADD1 LIKE '����%'; 
     
     
     ����� Ŀ�� ��� ����
      - 
    2) ����� Ŀ�� (EXPLICIT CURSOR)
      - ����ڰ� ����ο��� ������ Ŀ��
      - Ŀ���� ��� �ܰ�� ���� -> OPEN -> FETCH -> CLOSE �̴�.
      - Ŀ�� ��������� ������� �����Ͽ� ������ �����͸� �̿��� ����ó���� ����(SELECT ���� ����
        Ŀ�� ����)
    (��������)
    CURSOR Ŀ����[(�Ű����� [,�Ű�����,...])]
       IS SELECT ��;
       
  ��) �μ���ȣ�� �Է¹޾� �ش�μ��� �Ҽӵ� �����ȣ�� ����̸��� ����ϴ� Ŀ���� �����Ͻÿ�
  DECLARE
    CURSOR  CUR_EMP01 (P_DEPT_ID DEPARTMENTS.DEPARNEMT_ID%TYPE)
    --  CUR_EMP01 : Ŀ���̸� / P_DEPT_ID : �μ��ڵ� 
    --  (P_DEPT_ID : ������ DEPARTMENTS.DEPARNEMT_ID%TYPE :Ÿ�Ը�
    IS
    SELECT EMPLOYEE_ID, EMP_NAME
      FORM EMPLOYEES
     WHERE DEPARTMENT_ID = P_DEPT_ID;
  
   BEGIN
   
   END;
   
     
     
     (2) OPEN
      - Ŀ���� ����ϱ� ���� �ݵ��(FOR�� ����) OPEN �ؾ���
      - OPEN ����� �����(BEGIN ~ END) ���� �ۼ�
      
      (�������)
      OPEN Ŀ����[(�Ű����� [,�Ű�����,...])];
      
  ��) 2005�� 1�� �з��ڵ庰 ���Լ����� ���Աݾ��հ踦 ���ϴ� Ŀ��
   DECLARE
    V_GU LPROD.LPROD_GU%TYPE; -- �з��ڵ�
    V_NAME LPROD.LPROD_NM%TYPE; --�з���
    V_AMT NUMBER := 0;
    V_SUM NUMBER := 0;
    CURSOR CUR_BUY01   -- ��ó�� �з��ڵ���� �� ������ �з��ڵ� ���
    IS
      SELECT LPROD_GU, LPROD_NM
        FROM LPROD;
   BEGIN
      OPEN CUR_BUY01;    -- Ŀ���� �����ؼ� ��� ������ ���·� �����.
      LOOP   -- �ڹ��� DO ������ �����ϸ� ��
     
     FETCH CUR_BUY01 INTO V_GU, V_NAME;
     EXIT WHEN CUR_BUY01%NOTFOUND;
     
     SELECT NVL(SUM(BUY_QTY*BUY_COST),0) , NVL(SUM(BUY_QTY),0) INTO V_SUM, V_AMT
       FROM BUYPROD, PROD
      WHERE BUY PROD = PROD_ID
        AND PROD_LGU = V_GU
        AND BUY_DATE BETWEEN '20050101' AND '20050131';
       DBMS_OUTPUT.PUT_LINE(V_NAME|| '->'||V_AMT||','||V_SUM);
       DBMS_OUTPUT.PUI.LINE('----------------------------------');
       
       END LOOP;
       DBMS_OUTPUT.PUT_LINE('ó���Ǽ� :' ||CUR_BUY01%ROWCOUNT);
       CLOSE CUR_BUY01;
       
       END;
       
  