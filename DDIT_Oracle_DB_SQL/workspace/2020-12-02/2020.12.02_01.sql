 2020-12-02_01)
 ��) ��ǰ���̺��� ��ǰ �з��ڵ尡 'P200' ���� ��ǰ�� ��ȸ�Ͻÿ�.
  Alias ��ǰ�ڵ�, ��ǰ��, �з��ڵ�, �з���, �ǸŰ����̴�.
 
 (�Ϲ�����) 
   -- (������) Alias �� ���� SELECT �� �� ���̺��� �����ϰ� 
   -- � ���� ���̺��ִ��� FROM�� ���� ����
   
 SELECT  A. PROD_ID AS ��ǰ�ڵ�, 
         A. PROD_NAME AS ��ǰ��, 
         A. PROD_LGU AS �з��ڵ�, 
         B. LPROD_NM AS �з���, 
         A. PROD_PRICE AS �ǸŰ���    
    FROM PROD A, LPROD B
    WHERE A. PROD_LGU LIKE 'P2%' -- �Ϲ�����
      AND A. PROD_LGU = B.LPROD_GU
      ORDER BY 3;

(ANSI ����)
  SELECT A. PROD_ID AS ��ǰ�ڵ�, 
         A. PROD_NAME AS ��ǰ��, 
         A. PROD_LGU AS �з��ڵ�, 
         B. LPROD_NM AS �з���, 
         A. PROD_PRICE AS �ǸŰ���    
    FROM PROD A   -- ANSI ������ �Ҷ� FROM ���� ���̺��� �ϳ��� ���´�.
  INNER JOIN LPROD B ON(A.PROD_LGU=B.LPROD_GU) -- ��������
    WHERE A. PROD_LGU LIKE 'P2%' -- �Ϲ�����
    ORDER BY 3;
    
 ����) 2005�� 1�� 1�� ~ 15�� ���� �߻��� ���������� ��ȸ�Ͻÿ�.
    Alias ����, ��ǰ�ڵ�, ��ǰ��, ����, �ݾ�
   
   (�Ϲ�����)
    SELECT B. BUY_DATE AS ����, 
           A. PROD_ID AS ��ǰ�ڵ�, 
           A. PROD_NAME AS ��ǰ��, 
           B. BUY_QTY AS ����, 
           B. BUY_COST*BUY_QTY AS �ݾ�
      FROM PROD A, BUYPROD B
     WHERE B. BUY_DATE BETWEEN '20050101' AND '20050115'
       AND A.PROD_ID = B. BUY_PROD
    ORDER BY 1;
    
    (ANSI ����) 
    SELECT B. BUY_DATE AS ����, 
           A. PROD_ID AS ��ǰ�ڵ�, 
           A. PROD_NAME AS ��ǰ��, 
           B. BUY_QTY AS ����, 
           B. BUY_COST*BUY_QTY AS �ݾ�
    FROM PROD A
    INNER JOIN BUYPROD B ON(A.PROD_ID = B. BUY_PROD
    AND B. BUY_DATE BETWEEN TO_DATE('20050101') AND '20050115')
    ORDER BY 1;
   
   
 ����) 2005�� 5�� ��ǰ�� ����/������Ȳ�� ��ȸ�Ͻÿ�.
  Alias ��ǰ�ڵ�, ��ǰ��, ������հ�, ���Ծ��հ�
 
 (�ܺ�����-ANSI)
     SELECT C. PROD_ID AS ��ǰ�ڵ�, 
            C. PROD_NAME AS ��ǰ��, 
            SUM (A.CART_QTY * C. PROD_PRICE)������հ�, 
            SUM (B.BUY_QTY * B.BUY_COST) AS ���Ծ��հ�
       FROM CART A, BUYPROD B, PROD C
      WHERE A.CART_PROD=C.PROD_ID
        AND B.BUY_PROD=C.PROD_ID
        AND A.CART_NO LIKE '200505%'
        AND B.BUY_DATE BETWEEN '20050501' AND '20050531'
   GROUP BY C.PROD_ID, C.PROD_NAME
   ORDER BY 1;
   
   
     SELECT C. PROD_ID AS ��ǰ�ڵ�, 
            C. PROD_NAME AS ��ǰ��, 
       SUM (A.CART_QTY * C. PROD_PRICE)AS ������հ�, 
       FROM CART A, PROD C
      WHERE A.CART_PROD=C.PROD_ID
        AND A.CART_NO LIKE '200505%'
   GROUP BY C.PROD_ID, C.PROD_NAME
   ORDER BY 1;
    
    
 (�ܺ�����-ANSI)
  SELECT    C. PROD_ID AS ��ǰ�ڵ�, 
            C. PROD_NAME AS ��ǰ��, 
            SUM (A.CART_QTY * C. PROD_PRICE)������հ�, 
            SUM (B.BUY_QTY * B.BUY_COST) AS ���Ծ��հ�
       FROM CART A
       RIGHT OUTER JOIN PROD C ON (A.CART_PROD = C.PROD_ID
         AND A.CART_NO LIKE '200505%')  
       LEFT OUTER JOIN BUYPROD B ON (B.BUY_PROD=C.PROD_ID)
         AND B.BUY_DATE BETWEEN '20050501' AND '20050531'
   GROUP BY C.PROD_ID, C.PROD_NAME
   ORDER BY 1;
    -- LEFT OUTER JOIN �� RIGHT OUTER JOIN �� ���� ���̺��� ����Ű�� ����
    -- WHERE �� ��� ON ���� ���������� �־��ش�.
  ����) 2005�� 1~6�� ���� �ŷ�ó�� ������Ȳ�� ��ȸ�Ͻÿ�.
    Alias �ŷ�ó�ڵ� ,�ŷ�ó��, ���Ծ��հ�
   
  (�Ϲ�����)  
    SELECT A. BUYER_ID AS �ŷ�ó�ڵ�,
           A. BUYER_NAME AS �ŷ�ó��, 
           SUM(C.BUY_QTY * B.PROD_COST) AS ���Ծ��հ�
      FROM BUYER A, PROD B, BUYPROD C
     WHERE C.BUY_PROD = B.PROD_ID
       AND A.BUYER_ID = B.PROD_BUYER
       AND C.BUY_DATE BETWEEN '20050101' AND '20050630'
  GROUP BY A.BUYER_ID ,A. BUYER_NAME
  ORDER BY 1;
  
  (ANSI JOIN)
   SELECT A. BUYER_ID AS �ŷ�ó�ڵ�,
           A. BUYER_NAME AS �ŷ�ó��, 
           SUM(C.BUY_QTY * B.PROD_COST) AS ���Ծ��հ�
      FROM BUYER A
      INNER JOIN PROD B ON (A.BUYER_ID=B.PROD_BUYER)
      INNER JOIN BUYPROD C ON (C. BUY_PROD=B.PROD_ID)
        AND C.BUY_DATE BETWEEN '20050101' AND '20050630'
  GROUP BY A.BUYER_ID ,A. BUYER_NAME
  ORDER BY 1;
  
  
  ����) ��ٱ������̺��� 2005�� 5�� ȸ���� ���űݾ��� ��ȸ�Ͻÿ�.
  Alias ȸ����ȣ, ȸ����, ���ž�
  
  (�Ϲ�����) 
     SELECT A. MEM_ID AS ȸ����ȣ, 
            A. MEM_NAME AS ȸ����, 
       NVL(SUM (C.PROD_PRICE*B.CART_QTY),0) AS ���ž�
      FROM MEMBER A, CART B, PROD C
     WHERE A.MEM_ID = B.CART_MEMBER  -- ��������(ȸ���̸�)
       AND B.CART_PROD = C.PROD_ID   -- ��������(PROD_PRICE)
       AND TO_DATE(SUBSTR(B.CART_NO,1,8))BETWEEN '20050501' AND '20050531'
         --   AND B.CART_NO LIKE'200505%' �� ����
  GROUP BY A.MEM_ID, A.MEM_NAME
  ORDER BY 1;
  
  (ANSI INNER JOIN)
    SELECT A. MEM_ID AS ȸ����ȣ, 
           A. MEM_NAME AS ȸ����, 
      NVL(SUM (C.PROD_PRICE*B.CART_QTY),0) AS ���ž�
      FROM MEMBER A 
     INNER JOIN CART B ON (A.MEM_ID=B.CART_MEMBER)
     INNER JOIN PROD C ON (B.CART_PROD=C.PROD_ID)
       AND TO_DATE(SUBSTR(B.CART_NO,1,8))BETWEEN '20050501' AND '20050531'
  GROUP BY A.MEM_ID, A.MEM_NAME
  ORDER BY 1;
  
 ����) ������̺��� ������(MANAGER_ID)�� ��������� ��ȸ�Ͻÿ�.
  -- ?????????????????????????????????????????????????????
  Alias �����ڹ�ȣ, �����ڸ�, �Ҽӻ����, �μ���
  SELECT A. MANAGER_ID AS �����ڹ�ȣ, 
         A. EMP_NAME AS �����ڸ�, 
         COUNT (A.DEPARTMENT_ID) AS �Ҽӻ����, 
         B. DEPARTMENT_NAME AS �μ���
  FROM EMPLOYEES A,  DEPARTMENT B
  WHERE A. DEPARTMENT_ID = B. DEPARTMENT_ID
  GROUP BY A. MANAGER_ID, A. EMP_NAME, B. DEPARTMENT_NAME
  ORDER BY 1;
  -- ?????????????????????????????????????????????????????
  
  
  
  
  