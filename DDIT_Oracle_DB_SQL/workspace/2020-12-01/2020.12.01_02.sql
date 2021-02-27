2020-12-01_02) NULL ó���Լ�
 - ���꿡 ���Ǵ� �׸� �� NULL�� ���� �ϴ� ��� ����� NULL�� ��ȯ
 - IS[NOT] NULL, NVL, NVL2, NULLIF ���� �Լ�(������)�� ���� ��
  1. IS[NOT] NULL
   - NULL �� ���θ� ���ϱ� ���Ͽ� '=' ����� ������ ����.
   - �ݵ�� IS[NOT] NULL �����ڸ� ����ؾ� ��
  ��) ������̺��� ���������ڵ�(COMMISSION_PCT)�� NULL�� �ƴ� ����� ��ȸ�Ͻÿ�. 
    Alias �����ȣ, �����, �μ�����, ��������
    SELECT EMPLOYEE_ID AS �����ȣ, 
           EMP_NAME AS �����, 
           DEPARTMENT_ID AS �μ�����, 
           COMMISSION_PCT AS ��������
      FROM EMPLOYEES
     WHERE COMMISSION_PCT IS NOT NULL; 
     -- IS NOT NULL �� ��� �ؾ� ��.
     -- != NULL; �� ����ϸ� NULL �� ���θ� �Ǵ� �� �� ����.
     
  2. NVL(c,val) 
    - 'c'�� ���� NULL �̸� 'val' �� ��ȯ�ϰ� NULL �� �ƴϸ� 'C' �� ���� ��ȯ
    - ���꿡 ���Ǵ� ���� �׸��� ����  NULL�� ������ ������ �ִ� �ܿ� ���

    --�ڷ��� ���� ���̺��� �����Ҷ� ���� �ڷᰡ ���� ���� NOT NULL �� ������� ���� ���, NULL
    
 ��) CREATE TABLE TEMP(
        COL1 NUMBER(6),
        COL2 VARCHAR2(20) NOT NULL,
        COL3 DATE);
        
    INSERT INTO TEMP(COL2) VALUES('������');
    INSERT INTO TEMP VALUES(10,'�߱�', SYSDATE);
    
 TEMP�� COL1�� 5�� ���� ���� ����Ͻÿ�.
 SELECT COL1+5, COL2, COL3 FROM TEMP;
 
  ��) ������̺��� ���������� ���� ���ʽ��� ��ȸ�Ͻÿ�.
    Alias ������̺�, �����, ��������, ���ʽ�
    (NVL�� �̻��)
    SELECT EMPLOYEE_ID AS �����ȣ,
           EMP_NAME AS �����,
           COMMISSION_PCT AS ��������,
           COMMISSION_PCT*SALARY AS ���ʽ�
      FROM EMPLOYEES;
      
    (NVL�� ���)
    SELECT EMPLOYEE_ID AS �����ȣ,
           EMP_NAME AS �����,
           COMMISSION_PCT AS ��������,
           NVL(COMMISSION_PCT*SALARY,0) AS ���ʽ�
      FROM EMPLOYEES;
      
   **ȸ�����̺��� ȸ����ȣ 'r001','d001', 'k001' ȸ���� ���ϸ����� 
     null�� �ٲٽÿ�.
     UPDATE MEMBER
        SET MEM_MILEAGE = NULL
      WHERE LOWER(MEM_ID) IN('r001','d001', 'k001');

 ����) ȸ���鿡�� 500���ϸ����� �߰��� �����Ϸ��Ѵ�.
      ȸ����ȣ, ȸ����, �������ϸ���, ���渶�ϸ����� ���
      SELECT MEM_ID AS ȸ����ȣ,
             MEM_NAME AS ȸ����,
             MEM_MILEAGE AS �������ϸ���, 
             NVL(MEM_MILEAGE,0) + 500 AS ���渶�ϸ���
        FROM MEMBER;     
 ��) �������̺��� 2005�� 3�� ��� ��ǰ�� ������Ȳ�� ��ȸ�Ͻÿ�. 
    Alias ��ǰ�ڵ�, ��ǰ��, ���Լ���, ���Աݾ�
    
    SELECT B.PROD_ID AS ��ǰ�ڵ�,
           B.PROD_NAME AS ��ǰ��,
           NVL(SUM(A.BUY_QTY),0) AS ���Լ���,
           NVL(SUM(A.BUY_QTY*A.BUY_COST),0) AS ���Աݾ�    
        FROM BUYPROD A
       RIGHT OUTER JOIN PROD B ON(A.BUY_PROD=B.PROD_ID
        AND A.BUY_DATE BETWEEN '20050301' AND '20050331') 
    GROUP BY B.PROD_ID, B.PROD_NAME
    ORDER BY 1;
    --� ���� NULL �� ��� �� NULL �� ��� ġȯ �� ���� ��� �������ִ°ͤ�
  
  3.NVL2(c, vall, val2)
   - 'c' �� ���� NULL�̸� val2�� ��ȯ�ϰ�, NULL�� �ƴϸ� vall �� ��ȯ��
   - ���꿡 ���Ǵ� ���� �׸��� ���� NULL�� ������ ������ �ִ� ��� ���
   - 'c' �� ������ Ÿ�԰� val�� ������ Ÿ���� ��ġ�ؾ���
   - 'val' �� ������ Ÿ�԰� 'val2'�� ������ Ÿ���� ��ġ�ؾ� ��.
   
    ��)ȸ�����̺��� ���ϸ����� NULL�� ȸ���� ��ȸ�Ͽ� ������ 'Ż��ȸ��'
    �� NULL�� �ƴ� ȸ���� '����ȸ��' �� ����Ͻÿ�.
    Alias ȸ����ȣ, ȸ����, ���ϸ���, ���
    SELECT MEM_ID AS ȸ����ȣ,
           MEM_NAME AS ȸ����,
           NVL(MEM_MILEAGE,0) AS ���ϸ���,
           NVL2(TO_CHAR(MEM_MILEAGE),'����ȸ��','Ż��ȸ��') AS ���
      FROM MEMBER;     
    
   4.NULLIF(c1,c2)
    - 'c1'�� 'c2' �� ������ NULL, �ٸ� ���̸� c1�� ��ȯ
    
  **��ǰ���̺��� �з��ڵ� 'P201'�� ��ǰ�� ���԰��ݰ� �����ǸŰ����� ���԰�������
    �����Ͻÿ�.
    Alias ��ǰ �з� �ڵ�, ���԰���, �����ǸŰ���
    
   UPDATE PROD
      SET PROD_SALE = PROD_COST
    WHERE PROD_LGU ='P201';
   
   
 ��) ��ǰ���̺��� ���԰��ݰ� �����Ǹ� ������ ���� ��ǰ�� '����ó����ǰ',
     ���� �ٸ��� '�����ǰ'�� ����� ���Ͻÿ�.(NVL2, NULLIF ���)
     
     
     SELECT PROD_ID AS ��ǰ�ڵ�,
            PROD_NAME AS ��ǰ��,
            PROD_COST AS ���԰���,
            PROD_SALE AS �����ǸŰ���,
            NVL2(TO_CHAR(NULLIF(PROD_SALE,PROD_COST)),'�����ǰ','����ó����ǰ') AS ���
       FROM PROD;
       
            
    
    
 
      