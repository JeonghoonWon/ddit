2020-11-27-02)
3. To_number(c[,fmt])
 - ������������ ������ ���ڿ��� ���������� ��ȯ
 - ���Ǵ� fmt�� to_char���� ����ϴ� �������� ���ڿ��� ����
 - ���ڷ� �ٲ�� ���� ���ڿ��� �ִٸ� ����
 ��)������ 2005�� 7�� 28���̰� 'h001'ȸ���� ��ǰ 'P201000003'�� 3�� �������� ��
    cart ���̺� �ش� ������ �����Ͻÿ�.
    
    cart_no : ����� + ����(5�ڸ���)
            =>'20050728'
            => select '20050728'||trim(to_char(to_number(max(substr(cart_no,9))) + 1,'00000'))
                 from cart
                where cart_no like '20050728%';
                
     INSERT INTO CART
        SELECT 'h001',
               '20050728'||TRIM(TO_CHAR(TO_NUMBER(MAX(SUBSTR(CART_NO,9)))+1,'00000')),
               'P201000003',
               13
          FROM CART
         WHERE cart_no like '20050728%';
         
         
 ��) ������̺��� ��ȭ��ȣ�� ���ڷ� ��ȯ
    SELECT EMP_NAME, TO_NUMBER(REPLACE(PHONE_NUMBER,'.'))
      FROM EMPLOYEES;
      
    SELECT EMP_NAME, TO_NUMBER(REPLACE(TO_CHAR(HIRE_DATE),'/'))
      FROM EMPLOYEES;  -- ��¥�� ���ڿ��� �ٲ��ְ� �����ø� �������ֱ����� REPLACE�� ���� �� ��ü�� ���ڷ� ���� TO_NUMBER
      
     4. TO_DATE(c[,fmt])
     - ��¥������ ���ڿ��� ��¥Ÿ������ ��ȯ
     - �����������ڿ��� TO_CHAR�� �������� ���ڿ��� ����
 ��) 2005�� 6�� 13�� �Ǹ��Ϻ��� �ۼ��Ͻÿ�.
    ALIAS ��¥, ��ǰ�ڵ�, �Ǹż���, ������
    SELECT TO_DATE(SUBSTR(CART_NO,1,8)) AS ��¥,
           CART_PROD AS ��ǰ�ڵ�,
           CART_QTY AS �Ǹż���,
           CART_MEMBER AS ������
      FROM CART
     WHERE SUBSTR(CART_NO,1,8)='20050613';
      
      
    