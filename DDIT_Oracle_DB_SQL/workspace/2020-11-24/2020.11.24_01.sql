2020-11-24-01)
 3) UPPER, LOWER -- UPPER = �빮�ڷ� ��ȯ LOWER = �ҹ��ڷ� ��ȯ
    - �־��� ���ڿ��� ���Ե� ���ڸ� �빮��(UPPER) �Ǵ� �ҹ���(LOWER)��
      ��ȯ�Ͽ� ��ȯ
      (�������)
      UPPER(c), LOWER(c)
      
 ��) ȸ�����̺��� 'R001' ȸ�� ������ ��ȸ�Ͻÿ�.
     Alias �� ȸ����ȣ, ȸ����, ����, ���ϸ���
     
     SELECT MEM_ID AS ȸ����ȣ, 
            MEM_NAME AS ȸ����, 
            MEM_JOB AS ����, 
            MEM_MILEAGE AS ���ϸ���
     FROM MEMBER
     WHERE UPPER(MEM_ID)='R001';  
     -- ������� ����� �� ��� �ڷᰡ ���ų� ���α׷� ������ ������ ���� ��(���� ���� �̴�.)
     -- ���� ��ȸ�ϴ� ����(ȸ��ID)�� �빮���̰� �ڷῡ �빮������ �ҹ������� Ȯ���ϰ� ���� ���Ҷ�, 
     -- UPPER(MEM_ID), MEM_ID �� �빮�ڷ� ���� �� ��ȸ �Ѵ�.

 ��) �з����̺��� 'P200'�� ���� �з��ڵ带 ��ȸ�Ͻÿ�.
    Alias �з��ڵ�, �з��� 
    SELECT LPROD_GU AS �з��ڵ�, 
           LPROD_NM AS �з��� 
    FROM LPROD
    WHERE UPPER(LPROD_GU) LIKE 'P2%';
  
  4) ASCII, CHR   --ASCII(American Standard Code for Information Interchange,�̱�������ȯǥ�غ�ȣ)
  - ASCII : �־��� �����ڷḦ ASCII �ڵ尪���� ��ȯ
  - CHR : �־��� ����(����,1~65535)�� �����ϴ� ���� ��ȯ
   (�������)
   ASCII(c), CHR(n)
   
 ��)
    SELECT ASCII('Oracle'),
           ASCII('���ѹα�'),
           CHR(95)
      FROM DUAL;
   
 5) LPAD, RPAD
    -Ư�����ڿ�(����)�� �����Ҷ� ���
    (�������)
    LPAD(c, n [,pattern]), RPAD(c, n [,pattern])
     - �־��� ���ڿ� 'c'�� ���� 'n'�� �������� ���ʺ��� ä���(RPAD)| 
       �����ʺ��� ä���(LPAD)���°����� 'pattern'���� ���ǵ� ���ڿ��� ä��
       --ä��� ���� ������ �������� ��´� (RPAD)
     - 'pattern'�� �����Ǹ� �������� ä����
 
 ��) ȸ�����̺��� ȸ���� ��ȣ�� 10 �ڸ� ������ ���� �����ϰ� ���� ������ 
    '#'�� �����Ͻÿ�.
    Alias ȸ������, ȸ����, ��ȣ
 
    SELECT MEM_ID AS ȸ������, 
           MEM_NAME AS ȸ����, 
           MEM_PASS AS ��ȣ1,
           LPAD(MEM_PASS,10,'#') AS ��ȣ2
      FROM MEMBER;
 
 ��) �������̺��� 2005�� 2�� ������Ȳ�� ��ȸ�Ͻÿ�.
    Alias ��¥, ���Ի�ǰ�ڵ�, ����, �ܰ� 
    ��, ���Դܰ��� 9�ڸ��� ����ϵ� ���� ���� ������ '*'�� �����Ͽ� ����Ͻÿ�.
    
    SELECT BUY_DATE AS ��¥, 
           BUY_PROD AS ���Ի�ǰ�ڵ�, -- 12�ڸ� ������ �� �� ����. �ʹ� ��� ���� ��
           RPAD(BUY_QTY,5) AS ����, 
           LPAD(BUY_COST,9,'*') AS �ܰ�
      FROM BUYPROD
     WHERE BUY_DATE BETWEEN '20050201' AND '20050228';
     
 6) LTRIM, RTRIM, TRIM -- �ַ� ������ �����Ҷ� ����Ѵ�
  - �־��� ���ڿ����� ����(LTRIM) �Ǵ� ������(RTRIM)�� �����ϴ� ���ڿ���
    ã�� �����Ҷ� ���
  - ���ʿ� �����ϴ� ������ �����Ҷ��� TRIM ���
  (�������)
  LTRIM(c1 [,c2]), RTRIM(c1[,c2]), TRIM(c1)
    - c2�� �����Ǹ� ������ ����
    
 ��) ������̺��� ������÷��� ������ Ÿ���� CHAR(80)���� �����Ͻÿ�.
    ALTER TABLE EMPLOYEES
        MODIFY EMP_NAME CHAR(80);
 ��) ������̺��� 'Steven King' ��������� ��ȸ�Ͻÿ�.
    Alias �����ȣ, �����, �μ��ڵ�, �Ի���
    SELECT EMPLOYEE_ID AS �����ȣ, 
           EMP_NAME AS �����, -- ����� �ִ� ���� ����� TRIM(EMP_NAME) AS �����
           DEPARTMENT_ID AS �μ��ڵ�, 
           HIRE_DATE AS �Ի���
      FROM EMPLOYEES
     WHERE TRIM(EMP_NAME)='Steven King';
     
��) ��ǰ���̺��� ��ǰ���� ���ʿ� �����ϴ� '���'�� �����ϴ� ��ǰ���� '���'�� �����ϰ� ����Ͻÿ�.
    Alias ��ǰ�ڵ�, ��ǰ��, �з��ڵ�, �ŷ�ó�ڵ�
    SELECT PROD_ID AS ��ǰ�ڵ�, 
           PROD_NAME AS ��ǰ��1,
           LTRIM(PROD_NAME,'��� ') AS ��ǰ��2, -- ���ʺ��� �����ڿ� ������ĭ�� �ڸ��°�
           PROD_LGU AS �з��ڵ�, 
           PROD_BUYER AS �ŷ�ó�ڵ�
    FROM PROD
    WHERE PROD_NAME LIKE '���%';
 
 7) SUBSTR(c,n1[,n2])
  - �־��� ���ڿ����� n1���� �����Ͽ� n2(����) ��ŭ�� �κ� ���ڿ��� �����Ͽ�
    ��ȯ
  - n2 �� �����Ǹ� n1 ������ ��� ���ڿ��� �����Ͽ� ��ȯ
  - n1 �� �����̸� �ڿ��� ���� ó����
  - n1�� 1���� counting -- Oracle ���� 0�� ����
  
  ��)
    SELECT SUBSTR('IL POSTINO', 3,4), -- 3��°����(��������) �����ϰ� ������ 4����(��������) ���
           SUBSTR('IL POSTINO', 3), -- 3��°����(��������) �����ϰ� ������ ���� ���
           SUBSTR('IL POSTINO', -3,4) -- -3��°����(��������) �����ϰ� ������ 4����(��������) ���
           SUBSTR('IL POSTINO', -3,2) -- -3��°����(��������) �����ϰ� ������ 2����(��������) ��� 
      FROM DUAL;
      
 ��) ��ǰ���̺��� �з��ڵ�'P201'�� ���� ��ǰ�� �������� ����Ͻÿ�.
    SELECT COUNT(*) AS ��ǰ�� ��
      FROM PROD
     WHERE UPPER(SUBSTR(PROD_ID,1,4)) = 'P201'; 
     
 ��) ��ٱ������̺��� 2005�� 3���� �Ǹŵ� ��ǰ������ ��ǰ���� ����Ͻÿ�.
    Alias ��ǰ�ڵ�, ��ǰ��, �����հ�, �Ǹűݾ�
    -- CART_MEMBER 
    -- CART_NO ��¥�� �α��ε� ���� 
    
    SELECT A.CART_PROD AS ��ǰ�ڵ�,
           B.PROD_NAME AS ��ǰ��,
           NVL(SUM(A.CART_QTY,0) AS �����հ�,
           NVL(SUM(A.CART_QTY*B.PROD_PRICE),0) AS �Ǹűݾ�
      FROM CART A, PROD B
     WHERE SUBSTR(CART_NO,1,6)='2005037'; -- CART_NO LIKE'200503%'
       AND A.CART_PROD=B.PROD_ID-- JOIN ��Ű�� �ܷ�Ű�� ���Ҷ� ��� 
  GROUP BY A.CART_PROD,B.PROD_NAME
  ORDER BY 1;
     
 ����] ȸ�����̺��� '����'�� ����ִ� ȸ�������� ��ȸ�Ͻÿ�.
    Alias ȸ����ȣ, ȸ����, �ּ�, ���� ,���ϸ���
    ��, LIKE �����ڴ� ������� �� ��
    SELECT MEM_ID AS ȸ����ȣ, 
           MEM_NAME AS ȸ����, 
           MEM_ADD1||MEM_ADD2 AS �ּ�, 
           MEM_JOB AS ���� ,
           MEM_MILEAGE AS ���ϸ���
    FROM MEMBER
     WHERE SUBSTR(MEM_ADD1,1,2)='����'; 
     
 ����] ������ 2005�� 7�� 28���̶�� �����ϰ� CART_NO�� �ڵ����� �����ϴ� �ڵ带 �ۼ��Ͻÿ�.
    1. 2005�� 7�� 28�� �ִ� ���� MAX
    SELECT TO_NUMBER(MAX(SUBSTR(CART_NO,9))+1)
      FROM CART
     WHERE SUBSTR(CART_NO,1,8)='20050728';
    2. ��¥�� 1������ ���� ����+1�� ����
     SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||
            TRIM(TO_CHAR(TO_NUMBER(MAX(SUBSTR(CART_NO,9))+1),'00000')) 
            -- TO_NUMBER �������������� ��Ȯ�ϰ� ���� �����ϱ� ���� �����.
            -- ������ �߻��ϴ��� ã�Ƴ��� ����.
            
      FROM CART
     WHERE SUBSTR(CART_NO,1,8)='20050728';
        
    SELECT MAX(CART_NO)+1 -- ��� ���ڿ��̱� ������ ����, ���ڰ� ������ �Ұ��� �ϴ�
      FROM CART
     WHERE SUBSTR(CART_NO,1,8)='20050728';
   
    
 ����] �з����̺��� '��������' �з��ڵ带 �űԷ� ��Ͻ�ų�� 'P200'������ �ڵ带 �����Ͻÿ�
    SELECT 'P'||(MAX(SUBSTR(LPROD_GU,2))+1) 
      FROM LPROD
     WHERE LPROD_GU LIKE 'P2%';

  
  8) REPLACE(c1,C2,[,C3])
  - �־��� ���ڿ� C1���� C2�� C3�� ��ġ(ġȯ) ��Ŵ
  - C3�� �����Ǹ� C2�� ������.
  
  ��) ��ǰ���̺��� ��ǰ�� �� '���'�� ã�� 'Apple'�� �����Ͻýÿ�.
       -- ���� ������ ������ �����Ҷ� REPLACE ����� 
       -- ��ȭ��ȣ ���� �� �� �����
       -- 010-000-0000, 010.000.0000 �� �� �Է��ϱ� ������ '.' , '-'�� ' '�������� ��ȯ �� ���� ����
  SELECT PROD_ID,
         PROD_NAME,
         REPLACE(PROD_NAME,' ')
    FROM PROD
   WHERE PROD_NAME lIKE'%���%';
   
    '   HHF   HF    '
        '   HHVC    HF   '
        '   H          HF    '
  
  
  9) LENGTH(c), LENGTHB(c), 
    -�־��� ���ڿ����� ���ڼ�(LENGTH) �Ǵ� �������� ũ��(BYTE��, LENGTHB)
     ��ȯ
   
   --FORM ������ ��� ��ų�� ��� ex)�������� �ݾ� ǥ�� �Ҷ�
   
   
      
     