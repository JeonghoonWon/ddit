2020-12-02_02) JOIN
3.SELF JOIN
 - �ϳ��� ���̺��� ���̺� ��Ī�� �̿��Ͽ� 2���� ���̺�ó��
   �ڽ��� ���̺��� �ڽ��� ���̺�� JOIN �ϴ� ���
   
 ��) ȸ�����̺��� ȸ����ȣ 'T001' ȸ���� ������ ���ϸ������� ����
    ���ϸ����� ������ ȸ���� ��ȸ�Ͻÿ�.
    
   Alias ȸ����ȣ, ȸ����, ���ϸ���
  
   SELECT B.MEM_ID AS ȸ����ȣ, 
          B.MEM_NAME AS ȸ����, 
          B.MEM_MILEAGE AS ���ϸ���
     FROM MEMBER A, MEMBER B -- A : 'T001' ȸ��, B : ��üȸ��
    WHERE UPPER(A. MEM_ID) = 'T001'
      AND A.MEM_MILEAGE <= B.MEM_MILEAGE
    ORDER BY 3 DESC;

 (SUB QUERY) -- �ϳ��� SQL �� �ȿ� ���ԵǾ� �ִ� �� �ٸ� SQL���� �ִ°�
   SELECT A.MEM_ID AS ȸ����ȣ, 
          A.MEM_NAME AS ȸ����, 
          A.MEM_MILEAGE AS ���ϸ���,
          B. MILE AS "T001ȸ���� ���ϸ���"
     FROM MEMBER A, (SELECT MEM_MILEAGE AS MILE
                       FROM MEMBER 
                       WHERE UPPER(MEM_ID) = 'T001') B
                       
    WHERE A.MEM_MILEAGE > B.MILE
    ORDER BY 3 DESC;
    
    
    (SUB QUERY) 
   SELECT MEM_ID AS ȸ����ȣ, 
          MEM_NAME AS ȸ����, 
          MEM_MILEAGE AS ���ϸ���
     FROM MEMBER
     WHERE MEM_MILEAGE > (SELECT MEM_MILEAGE  --��ȣ���� �����
                       FROM MEMBER 
                       WHERE UPPER(MEM_ID) = 'T001') 
                       
     ORDER BY 3 DESC;
 
  ��) '������' �ŷ�ó�� ���� ������ �ּ����� �ΰ�ݴ� �ŷ�ó�� ��ȸ�Ͻÿ�.
  Alias �ŷ�ó�ڵ�, �ŷ�ó��, �ּ�, ����� 
 
  SELECT B. BUYER_ID AS �ŷ�ó�ڵ�, 
         B. BUYER_NAME AS �ŷ�ó��, 
         B. BUYER_ADD1||' '||B.BUYER_ADD2 AS �ּ�, 
         B. BUYER_CHARGER AS �����
  FROM BUYER A, BUYER B
  WHERE A.BUYER_NAME='������'
    AND SUBSTR(A.BUYER_ADD1,1,2) = SUBSTR(B.BUYER_ADD1,1,2);
    
  
  ��) ��ٱ������̺��� 't001' ȸ������ �Ǹ��� 2005����� �Ǹ���Ȳ��
      ��ȸ�Ͻÿ�.
      Alias ȸ����, �ֹι�ȣ, ��, ���ž��հ�
      SELECT MEM_NAME AS ȸ����, 
             MEM_REGNO1�ֹι�ȣ, ��, ���ž��հ�
      FROM MEMBER 
        
  
   