2020-11-25-01) �����Լ�
1. �������Լ�
 - ABS(n) : n�� ���밪 ��ȯ
 - SIGN(n) : n�� ��ȣ�� ���� 0�ΰ�� 0, ����̸� 1, �����̸� -1�� ��ȯ
 - SQRT(n) : n�� ����(ROOT)
 - POWER(n1,n2) : n1�� n2�� ���� ��ȯ
 
 ��) ��ǰ���̺��� ��ǰ�� ���Դܰ��� �����ǸŴܰ��� ���Ͽ� 
     ���������� ��Ÿ���� �ֵ��� ��ȸ�Ͻÿ�.
     Alias ��ǰ�ڵ�, ��ǰ��, ���Դܰ�, �����ǸŰ�, ���Ϳ���
     *��� ������ �߻��Ǹ� '����' ������ ������ '�����Ǹ�'
     ���ذ� �߻��Ǹ� '���ó�л�ǰ' �̶�� ����Ͻÿ�.
     SELECT PROD_ID AS ��ǰ�ڵ�, 
            PROD_NAME AS ��ǰ��, 
            PROD_COST AS ���Դܰ�, 
            PROD_SALE AS �����ǸŰ�, 
            CASE WHEN SIGN(PROD_SALE-PROD_COST) = 1 THEN 
                    '������ǰ';
                 WHEN SIGN(PROD_SALE-PROD_COST) = 0 THEN    
                    '�����ǸŻ�ǰ'
                    ELSE '���ó�л�ǰ' END AS ���
      FROM PROD;
     
  **ǥ���� (CASE WHEN THEN ~ END)
   - ������ �Ǵ��Ͽ� ó���� ����� �ٸ��� ������ �� ���(IF���� ����� ���)
   - SELECT ������ ���
   (�������)
   CASE WHEN ����1 THEN
             ���1
        WHEN ����2 THEN
             ���2
              :
        ELSE
             ���n
  END
  
 ��) ȸ�����̺��� �ֹι�ȣ�� �̿��Ͽ� ������ �����Ͻÿ�. ��, ���������� 
     �����ϴ� ȸ�������� ��ȸ�Ͻÿ�.
    Alias ȸ����ȣ, ȸ����, �ּ�, ����
    SELECT MEM_ID AS ȸ����ȣ, 
           MEM_NAME AS ȸ����, 
           MEM_ADD1||' '||MEM_ADD2 AS �ּ�, 
           CASE WHEN SUBSTR(MEM_REGNO2,1,1)='2' OR 
                     SUBSTR(MEM_REGNO2,1,1)='4' THEN
                     '����ȸ��'
                WHEN SUBSTR(MEM_REGNO2,1,1)='1' OR
                     SUBSTR(MEM_REGNO2,1,1)='3' THEN
                     '����ȸ��'
                ELSE
                     '������ ����' END AS ����
     FROM MEMBER
     WHERE MEM_ADD1 LIKE '����%';
    
    
  2. GREATEST(n1,n2[,n3,...]), LEAST(n1,n2[,n3,....])
    - GREATEST : �־��� �� n1,n2[,n3,....] �� ���� ū ���� ��ȯ
    - LEAST : �־��� �� n1,n2[,n3,....] �� ���� ����  ���� ��ȯ 
    
 ��)
 SELECT GREATEST(20,-15,70), LEAST('Ź����','������','������')
   FROM DUAL;
   SELECT GREATEST(20,-15,70), LEAST('������','������','������')
   FROM DUAL; 
  
  ����) ȸ�����̺��� ���ϸ����� 1000�̸��� ȸ������ ���ϸ����� 1000����
  �ο��Ϸ� �Ѵ�. �̸� �����Ͻÿ�.(GREATEST) ���)
  Alias ȸ����ȣ, ȸ����, ���ϸ���
    SELECT MEM_ID AS ȸ����ȣ, 
           MEM_NAME AS ȸ����, 
           MEM_MILEAGE AS ���ϸ���,
           GREATEST(MEM_MILEAGE,1000) AS ���ϸ���
      FROM MEMBER;
      
 3. ROUND(n1[,1]), TRUNC(n[,1])
    - ROUND : �־��� �ڷ� n�� l+1��° �ڸ����� �ݿø��Ͽ� 1�ڸ����� ǥ��
    - TRUNC : �־��� �ڷ� n�� l+1��° �ڸ����� �ڸ������Ͽ� 1�ڸ����� ǥ��
    - l �� �����̸� �����κ� 1�ڸ����� �ݿø�(ROUND), �ڸ�����(TRUNC)
    - l �� �����Ǹ� 0���� ���� -- l = ���ĺ� ��
    
 ��)������̺��� �� �μ��� ����ӱ��� ��ȸ�Ͻÿ�.
    ����ӱ��� �Ҽ� 2�ڸ����� ����Ͻÿ�.
    Alias �μ��ڵ�, �μ���, ����ӱ�
    
    SELECT A.DEPARTMENT_ID AS �μ��ڵ�, 
           DEPARTMENTS.DEPARTMENT_NAME AS �μ���, 
          TO_CHAR(ROUND(AVG(A.SALARY),2),'99,999.99') AS ����ӱ�
      FROM EMPLOYEES A, DEPARTMENTS
     WHERE A.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID -- WHERE ���� �ִ� DEPARTMENT_ID
                                         -- �� EMPLOYEES�� DEPARTMENT�� �ֱ⶧����
                                         -- ��� ������ �����;��ϴ��� ���������.
                                         -- SELECT �� FROM �� A�� ǥ���ؼ� ��Ÿ��.
                                         
                                         
  GROUP BY A.DEPARTMENT_ID, DEPARTMENTS.DEPARTMENT_NAME
  ORDER BY 1;
 
 
 ����]������̺��� �̿��Ͽ� ������� �޿��� �����Ϸ��Ѵ�.
     ���޾��� ���ʽ�+�޿�-�����̰� ���ʽ��� ��������(COMMISSION_PCT)*�޿�
     �̴�. �� ������ ���ʽ�+�޿��� 3%�̴�.
     Alias �����ȣ, �����, �μ��ڵ�, �޿�, ���ʽ�, ����, ���޾�
            �Ҽ� ù�ڸ����� ��Ÿ���ÿ�.
            
     SELECT EMPLOYEE_ID AS �����ȣ, 
            EMP_NAME AS �����, 
            DEPARTMENT_ID AS �μ��ڵ�, 
            SALARY AS �޿�, 
            ROUND(NVL(COMMISSION_PCT*SALARY,0),1) AS ���ʽ�, -- NVL = ���� NULL �̸� 0���� ǥ���Ͻÿ�.
            TRUNC((SALARY+NVL(COMMISSION_PCT*SALARY,0))*0.03,1) AS ����,
            SALARY+ROUND(NVL(COMMISSION_PCT*SALARY,0),1)-
            TRUNC((SALARY+NVL(COMMISSION_PCT*SALARY,0))*0.03,1) AS ���޾�
            
            
       FROM EMPLOYEES;
    
     
     
    ALTER TABLE EMPLOYEES
        MODIFY EMP_NAME VARCHAR2(80);
        
    UPDATE EMPLOYEES
       SET EMP_NAME=TRIM(EMP_NAME);
    
 
 
      
           
           