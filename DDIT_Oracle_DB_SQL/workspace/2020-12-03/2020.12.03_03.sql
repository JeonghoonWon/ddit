2020-12-03_03) �ܺ�����
 - ���������� ���������� �������� �ʴ� ��(ROW)�� �˻����� ����
 - �ܺ������� ������ ���̺� NULL ������ ä���� ���� �����Ͽ� ���� ����
 - �������� ����� ������ ���̺� ���Ե� �÷��ڿ� �ܺ����� ������ '(+)' ��
    ��� : �Ϲ� �ܺ�����
 - �ϳ� �̻��� ���� ������ �ܺ� ���εǴ� ��� ��� ���� ���ǿ� '(+)' ������ ���
 - �ϳ��� ���̺��� ���ÿ� Ȯ��Ǵ� �ܺ������� ������ ����, �� A, B, C
    ���̺��� �ܺ������ϴ� ��� A�� �������� B�� �ܺ������ϴ� ���ÿ� C��
    �������� B�� �ܺ����� ���� ����
    ex) WHERE A.Col = B.Col(+)
          AND C.Col = B.Col(+) -- ��� �ȵ�
   
  - �Ϲ������� �߰��� �ܺ������� �Ϲݿܺ������� ����ϸ� �������� �����
    ��ȯ --> ANSI �ܺ����� �̳� Subquery �� �̿��ؾ� ��
   (ANSI �ܺ����� ��� ����)
   SELECT �÷� list
     FROM ���̺��[��Ī]
    FULL|RIGHT|LEFT OUTER JOIN ���̺��[��Ī] ON(��������)
     [AND �Ϲ�����1])]
    FULL|RIGHT|LEFT OUTER JOIN ���̺��[��Ī] ON(��������)
     [AND �Ϲ�����2])]  
    [WHERE �Ϲ�����]
      . FULL : ���� ���̺� ��� Ȯ��
      . RIGHT : ���̺��2�� ���̺��1���� �� ���� ������ �ڷᰡ �ִ� ���(
      ���̺��1�� Ȯ��Ǵ� ���)
      . LEFT : ���̺��1�� ���̺��2���� �� ���� ������ �ڷᰡ �ִ� ���(
      ���̺��2�� Ȯ��Ǵ� ���)
      . WHERE ���� �Ϲ������� ��ü�� ����� ����
      
    ��) ��� ȸ���鿡 ���� �������踦 ��ȸ�Ͻÿ�.
    Alias ȸ����ȣ, ȸ����, ������հ�
    SELECT A. MEM_ID AS ȸ����ȣ, 
           A. MEM_NAME AS ȸ����, 
           NVL(SUM(B. CART_QTY * C. PROD_PRICE),0) AS ������հ�
      FROM MEMBER A, CART B, PROD C
     WHERE A.MEM_ID=B.CART_MEMBER(+)
       AND B.CART_PROD=C.PROD_ID
     GROUP BY A.MEM_ID, A.MEM_NAME
     ORDER BY 1;
     
    (ANSI JOIN) 
    SELECT A. MEM_ID AS ȸ����ȣ, 
           A. MEM_NAME AS ȸ����, 
           NVL(SUM(B. CART_QTY * C. PROD_PRICE),0) AS ������հ�
      FROM MEMBER A
      LEFT OUTER JOIN CART B ON(MEM_ID=B.CART_MEMBER)
      LEFT OUTER JOIN PROD C ON(B.CART_PROD=C.PROD_ID)
     GROUP BY A.MEM_ID, A.MEM_NAME
     ORDER BY 1;
    
  ��) 2005�� 2���� ������ ��� ��ǰ�� �������踦 ��ȸ�Ͻÿ�.
      Alias ��ǰ�ڵ�, ��ǰ��, ���Լ���, ���Աݾ�
      
 (�Ϲݿ�����)   
    SELECT A.BUY_PROD AS ��ǰ�ڵ�,
           B.PROD_NAME AS ��ǰ��,
           SUM(A.BUY_QTY) AS ���Լ���,
           SUM(A.BUY_QTY*A.BUY_COST) AS ���Աݾ�
      FROM BUYPROD A, PROD B
     WHERE A.BUY_PROD(+)=B.PROD_ID
--       AND A.BUY_DATE BETWEEN '20050201' AND '20050228'
     GROUP BY A.BUY_PROD, B.PROD_NAME;
     
 (ANSI FORMAT)     
      SELECT B.PROD_ID AS ��ǰ�ڵ�, 
             B.PROD_NAME AS ��ǰ��, 
          NVL(SUM(A.BUY_QTY),0) AS ���Լ���, 
          NVL(SUM(A.BUY_QTY*A.BUY_COST),0) AS ���Աݾ�
         FROM BUYPROD A 
        RIGHT OUTER JOIN PROD B ON (A.BUY_PROD = B.PROD_ID
          AND A.BUY_DATE BETWEEN '20050201' AND '20050228')
        GROUP BY B.PROD_ID,B.PROD_NAME;
        
   (Subquery)
    SELECT     B.PROD_ID AS ��ǰ�ڵ�, 
               B.PROD_NAME AS ��ǰ��, 
               NVL(A.CNT,0) AS ���Լ���, 
               NVL(A.AMT,0) AS ���Աݾ�
          FROM (SELECT BUY_PROD AS BID, 
          NVL(SUM(BUY_QTY),0) AS CNT, 
          NVL(SUM(BUY_QTY*BUY_COST),0) AS AMT 
          FROM BUYPROD WHERE BUY_DATE BETWEEN '20050201' AND '20050228' 
          GROUP BY BUY_PROD) A,PROD B
      WHERE A.BID(+)=B.PROD_ID
      ORDER BY 1; 
      
  ����) ��� �к亰 ��ǰ�� ���� ��ȸ�Ͻÿ�.
    Alias ��ǰ�з��ڵ�,  �з���, ��ǰ�� ��
    
    SELECT B. LPROD_GU AS ��ǰ�з��ڵ�,
           B. LPROD_NM AS �з���,
     COUNT (A.PROD_TOTALSTOCK) AS "��ǰ�� ��"
    FROM PROD A, LPROD B
    WHERE A.PROD_LGU(+)=B.LPROD_GU
    GROUP BY B.LPROD_GU, B.LPROD_NM
    ORDER BY 1;
    
    SELECT DISTINCT PROD_LGU FROM PROD;
    
    
  (ANSI JOIN)
    SELECT A. LPROD_GU AS ��ǰ�з��ڵ�,
           A. LPROD_NM AS �з���,
     COUNT (PROD_ID)AS "��ǰ�� ��"
    FROM LPROD A
    LEFT OUTER JOIN PROD B ON (B.PROD_LGU=A.LPROD_GU)
    
    GROUP BY A.LPROD_GU, A.LPROD_NM
    ORDER BY 1;
    
 ����) ������̺��� ��� �μ��� ��ձ޿��� ����Ͻÿ�.
    ��ձ޿��� �Ҽ������� ����ϰ�, �μ��ڵ�, �μ���, ��ձ޿��� ���
        
    SELECT A.DEPARTMENT_ID AS �μ��ڵ�,
           A.DEPARTMENT_NAME AS �μ���,
           NVL(ROUND(AVG(B.SALARY)),0) AS ��ձ޿�
      FROM DEPARTMENTS A,EMPLOYEES B
     WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID(+)
     GROUP BY A.DEPARTMENT_ID,A.DEPARTMENT_NAME
     ORDER BY 1,2;
    
   (ANSI JOIN) 
      SELECT B.DEPARTMENT_ID AS �μ��ڵ�,
           NVL(B.DEPARTMENT_NAME,'����') AS �μ���,
           NVL(ROUND(AVG(A.SALARY)),0) AS ��ձ޿�
      FROM EMPLOYEES A
      FULL OUTER JOIN DEPARTMENTS B ON(B.DEPARTMENT_ID=A.DEPARTMENT_ID)
     GROUP BY B.DEPARTMENT_ID,B.DEPARTMENT_NAME
     ORDER BY 1;
     
  ����) 2005�� 6�� ��ǰ�� ����� ��Ȳ�� ��ȸ�Ͻÿ�
   Alias ��ǰ�ڵ�, ��ǰ��, �԰����, ���Ծ�, ������, �����
   
   SELECT C.PROD_ID AS ��ǰ�ڵ�,
          C.PROD_NAME AS ��ǰ��,
          NVL(SUM(A.BUY_QTY),0) AS �԰����,
          NVL(SUM(A.BUY_QTY*C.PROD_COST),0) AS ���Ծ�,
          NVL(SUM(B.CART_QTY),0) AS ������,
          NVL(SUM(B.CART_QTY*C.PROD_PRICE),0) AS �����
     FROM BUYPROD A
    RIGHT OUTER JOIN PROD C ON(A.BUY_PROD=C.PROD_ID
      AND A.BUY_DATE BETWEEN '20050601' AND '20050630')
     LEFT OUTER JOIN CART B ON(B.CART_PROD=C.PROD_ID
      AND SUBSTR(B.CART_NO,1,6)='200506')
    GROUP BY C.PROD_ID, C.PROD_NAME
    ORDER BY 1;
    
    
      
    