2020-12-08_01)

��) 2005�� 1~6�� ��� �ŷ�ó�� ������Ȳ�� ��ȸ�Ͻÿ�.
    Alias �ŷ�ó�ڵ�, �ŷ�ó��, �����   -- ����� ������ �ƿ��� ����
 (�Ϲ� OUTER JOIN)
    SELECT A.BUYER_ID AS �ŷ�ó�ڵ�, 
           A.BUYER_NAME AS �ŷ�ó��, 
           SUM(B.CART_QTY*C.PROD_PRICE) AS �����
    FROM BUYER A, CART B, PROD C
   WHERE B.CART_PROD(+)=C.PROD_ID
     AND A.BUYER_ID=C.PROD_BUYER
     AND SUBSTR(B.CART_NO,1,6) BETWEEN '200501' AND '200506'
     GROUP BY A.BUYER_ID, A.BUYER_NAME
     ORDER BY 1;
 
 (ANSI JOIN)  
    SELECT A.BUYER_ID AS �ŷ�ó�ڵ�, 
           A.BUYER_NAME AS �ŷ�ó��, 
           SUM(B.CART_QTY*C.PROD_PRICE) AS �����
    FROM BUYER A 
    LEFT OUTER JOIN PROD C ON(A.BUYER_ID = C.PROD_BUYER)
    LEFT OUTER JOIN CART B ON(C.PROD_ID = B.CART_PROD
     AND SUBSTR(B.CART_NO,1,6) BETWEEN '200501' AND '200506')
   GROUP BY A.BUYER_ID, A.BUYER_NAME
   ORDER BY 1;

(SUBQUERY)
  SELECT A.BUYER_ID AS �ŷ�ó�ڵ�, 
         A.BUYER_NAME AS �ŷ�ó��, 
         SUM(B.CART_QTY*C.PROD_PRICE) AS �����
    FROM BUYER A,(2005�� 1~6�� �ŷ�ó�� ����� - ��ΰ� �����⶧���� ���������̴�) B
   WHERE A.BUYER_ID=B.�ŷ�ó�ڵ�(+); 
   
   2005 1~6�� �ŷ�ó�� �����-��������
   SELECT BUYER_ID AS BID,
      SUM(CART_TY*PROD_PRICE) AS AMT
     FROM BUYER,CART, PROD
    WHERE BUYER_ID=PROD_BUYER
      AND PROD_ID = CART+PROD
      AND SUBSTAR(CART_NO,1,6) BETWEEN '200501' AND '200506'
   GROUP BY BUYER_ID;) B
   WHERE A.BUYER_ID=B.BID(+);
    
   (����) 
   SELECT A.BUYER_ID AS �ŷ�ó�ڵ�, 
          A.BUYER_NAME AS �ŷ�ó��, 
          B.AMT AS �����
     FROM BUYER A,(SELECT BUYER_ID AS BID,
                      SUM(CART_QTY*PROD_PRICE) AS AMT
                     FROM BUYER,CART,PROD
                    WHERE BUYER_ID=PROD_BUYER
                      AND PROD_ID = CART_PROD
                      AND SUBSTR(CART_NO,1,6) BETWEEN '200501' AND '200506'
                 GROUP BY BUYER_ID) B
    WHERE A.BUYER_ID=B.BID(+);
    
��) 2005�� ��� ��ǰ�� ����/������ ��ȸ�Ͻÿ�
    Alias ��ǰ�ڵ�, ��ǰ��, ���Լ���, �������, ���Աݾ�, ����ݾ�
    SUBQUERY �� ����� ��
    SELECT A.PROD_ID AS ��ǰ�ڵ�, 
           A.PROD_NAME AS ��ǰ��, 
           AS ���Լ���, 
           AS �������, 
           AS ���Աݾ�, 
           AS ����ݾ�
      FROM PROD A, (2005�� ��ǰ�� ��������) B, (2005�� ��ǰ�� ��������) C
     WHERE A.PROD_ID=B.() (+)
       AND A.PROD_ID=C.() (+);
       
   (2005�� ��ǰ�� ��������)
  SELECT BUY_PROD AS BPROD,
         SUM(BUY_QTY) AS BQTY,
         SUM(BUY_QTY*BUY_COST) AS BAMT
    FROM BUYPROD
   WHERE BUY_DATE BETWEEN '20050101' AND '20051231'
   GROUP BY BUY_PROD;
   
   (2005�� ��ǰ�� ��������)  
   SELECT CART_PROD AS CPROD,
          SUM(CART_QTY) AS CQTY,
          SUM(CART_QTY*PROD_PRICE) AS CAMT
     FROM CART, PROD
    WHERE CART_PROD = PROD_ID
      AND CART_NO LIKE '2005%'
    GROUP BY CART_PROD;  
  
   (����)
    SELECT A.PROD_ID AS ��ǰ�ڵ�, 
           A.PROD_NAME AS ��ǰ��, 
           B.BQTY AS ���Լ���, 
           C.CQTY AS �������, 
           B.BAMT AS ���Աݾ�, 
           C.CAMT AS ����ݾ�
      FROM PROD A, (SELECT BUY_PROD AS BPROD,
                           SUM(BUY_QTY) AS BQTY,
                           SUM(BUY_QTY*BUY_COST) AS BAMT
                           FROM BUYPROD
                           WHERE BUY_DATE BETWEEN '20050101' AND '20051231'
                           GROUP BY BUY_PROD) B, 
                   (SELECT CART_PROD AS CPROD,
                           SUM(CART_QTY) AS CQTY,
                           SUM(CART_QTY*PROD_PRICE) AS CAMT
                           FROM CART, PROD
                           WHERE CART_PROD = PROD_ID
                           AND CART_NO LIKE '2005%'
                           GROUP BY CART_PROD) C
     WHERE A.PROD_ID=B.BPROD(+)
       AND A.PROD_ID=C.CPROD(+);
                       
 ��) ������̺��� �μ��� ���� ���� �޿��� ��ȸ�ϰ� ���� �� �޿��� �޴��� ��ȸ�Ͻÿ�.
     Alias �����ȣ, �����, �μ���ȣ, �μ���, �޿�
     
     (�������� : ������̺��� �����ȣ, �����, �μ���ȣ, �μ���, �޿� ��ȸ)
     SELECT A.EMPLOYEE_ID AS �����ȣ, 
            A.EMP_NAME AS �����, 
            B.DEPARTMENT_ID AS �μ���ȣ, 
            B.DEPARTMENT_NAME AS �μ���, 
            A.SALARY AS �޿�
       FROM EMPLOYEES A, DEPARTMENTS B
      WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID
        AND A.SALARY = (�ּ��ӱ�)
        
 (�������� : �μ��� �ּ��ӱ�)
    SELECT C.MSAL
    FROM EMPLOYEES B (SELECT A.DEPARTMENT_ID AS DID,
                             MIN(A.SALARY) AS MSAL
                        FROM EMPLOYEES A
                       GROUP BY A.DEPARTMENT_ID) C
    WHERE B.DEPARTMENT_ID = C.DID;
    
    
 (����)
   SELECT A.EMPLOYEE_ID AS �����ȣ, 
            A.EMP_NAME AS �����, 
            D.DID AS �μ���ȣ,           
            D.DNAME AS �μ���,           
            A.SALARY AS �޿�                       
       FROM EMPLOYEES A, (SELECT B.DEPARTMENT_ID AS DID,
                                 C.DEPARTMENT_NAME AS DNAME,
                                 MIN(B.SALARY) AS MSAL
                            FROM EMPLOYEES B, DEPARTMENTS C
                           WHERE B.DEPARTMENT_ID=C.DEPARTMENT_ID
                           GROUP BY B.DEPARTMENT_ID, C.DEPARTMENT_NAME 
                           ORDER BY 1) D
      WHERE A.DEPARTMENT_ID = D.DID   
        AND A.SALARY = D.MSAL 
      ORDER BY 3;  
    
                     
                                                   
                                                       
    (�������� : �μ��� �ּ��ӱ�)
   SELECT C.MSAL 
     FROM EMPLOYEES B, (SELECT A.DEPARTMENT_ID AS DID,
                               MIN(A.SALARY) AS MSAL 
                          FROM EMPLOYEES A
                         GROUP BY DEPARTMENT_ID) C
    WHERE B.DEPARTMENT_ID=C.DID;     
    
��) ������̺�� �������̺�(JOBS) �� ����Ͽ� �� ������ �ּұ޿��� ��ȸ�ϰ�
    �ش� ������ ������ �ִ� ��� �� �ּұ޿��� �޴� ��������� ��ȸ�Ͻÿ�.
    Alias �����ȣ, �����, �����ڵ�, ������, �޿�
    (�������� : �����ȣ, �����, �����ڵ�, ������, �޿�)
    
    SELECT A.EMPLOYEE_ID AS �����ȣ, 
           A.EMP_NAME AS �����, 
           A.JOB_ID AS �����ڵ�, 
           B.JOB_TITLE AS ������, 
           A.SALARY AS �޿�
      FROM EMPLOYEES A, JOBS B
     WHERE A.JOB_ID=B.JOB_ID
       AND (A.JOB_ID,A.SALARY) IN ( SELECT JOB_ID,
                                       MIN(SALARY)
                                      FROM EMPLOYEES
                                  GROUP BY JOB_ID)
     ORDER BY 3;
    
    (������ �����޿�)
    SELECT JOB_ID,
           MIN(SALARY)
      FROM EMPLOYEES
     GROUP BY JOB_ID; 
    
    
   ��) ������̺��� �μ����� '��ۺ�' �� ���������� ���������� ����Ͽ� ��ȸ
    Alias  �����ȣ, �����, �μ���, �޿�
    
    SELECT A.EMPLOYEE_ID AS �����ȣ, 
           A.EMP_NAME AS �����, 
           B.DEPARTMENT_NAME AS �μ���, 
           A. SALARY AS �޿�
      FROM EMPLOYEES A, DEPARTMENTS B
     WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID 
       AND B.DEPARTMENT_NAME IN (SELECT DEPARTMENT_NAME
                                 FROM DEPARTMENTS
                                WHERE DEPARTMENT_NAME = '��ۺ�')
    ORDER BY 1;
       
       (�μ��� ��ۺ�)
      SELECT DEPARTMENT_NAME
        FROM DEPARTMENTS
       WHERE DEPARTMENT_NAME = '��ۺ�'
       
       (FROM ��������)
        SELECT A.EMPLOYEE_ID AS �����ȣ,
               A.EMP_NAME AS �����,
               B.DNM AS �μ���,
               A.SALARY AS �޿�
          FROM EMPLOYEES A, (SELECT DEPARTMENT_ID AS DID,
                                    DEPARTMENT_NAME AS DNM
                               FROM DEPARTMENTS
                              WHERE DEPARTMENT_NAME = '��ۺ�') B
       WHERE A.DEPARTMENT_ID = B.DID
       ORDER BY 1;