 2020-11-20-01) ������
 SELECT ��
    - �����͸� ��ȸ�ϴ� ���
    - SQL ��� �� ���� ���� ���Ǵ� ���
    (�������)
 SELECT [DISTINCT]|*|�÷��� [AS]["�÷���Ī["], --�ƽ�Ʈ����(*)��� �� ������ ��ȸ�϶� / ���� ���ϴ°͸� ����Ҷ� �÷���Ī�� ���δ�.
        �÷��� [AS]["]�÷���Ī["], --�ǵ��� [AS]["]�÷���Ī["] ���·� �������ش�.
                :
        �÷��� [AS]["]�÷���Ī["]
    FROM ���̺�� -- 
    [WHERE ����] --WHERE ���� ���� �ϸ� SELECT �� TABLE �� �ִ� ��� ���� ����
    [GROUP BY �÷���[,�÷���,...]]
    [HAVING ����]
    [ORDER BY �÷���|�÷��ε���[ASC|DESC],[�÷���|�÷��ε���[ASC|DESC],...]; --WHERE , GROUP BY, HAVING, ORDER BY ������ �����ؾ���
    -- ORDER BY �������� = ASC    
    -- ORDER BY �������� = DESC 
    -- ������ �������� ��Ÿ��.
     
  . '[DISTINCT]' : �ߺ��� �ڷḦ ������ �� ���
    '�÷���Ī' : �÷��� �ο��� �� �ٸ� �̸�
    - �÷��� AS ��Ī 
    - �÷��� ��Ī
    - �÷��� AS "��Ī" : ��Ī�� Ư������(��������)�� ���Ե� ��� �ݵ�� " "�� ��� ���
    -'�÷��ε���' : SELECT ������ ����� �ش� �÷��� ����(1���� COUNTING)
    -'ASC|DESC' : ���Ĺ��(ASC:������������ �⺻��, DESC�� ��������)
    - SELECT���� ������� : FROM�� -> WHERE �� ���� -> SELECT ��
    
 1. ������
  - ���������(+.-,*,/) --ORACLE ���� ������ ������( % ) ����
  - ���迬����(>,<,>=,<=,=,!=(<>))--6�� ��Ұ��踦 ���� �� / ũ�ų� ����, �۰ų� ���� �� ǥ���Ҷ� >=,<= (=�� �ڿ� ��ġ)
  - �������� (AND, OR, NOT) -- �ܾ�� ���(��ȣ ��� ����)
  
  2. �Լ�(FUNCTION) -- JAVA �� �޼ҵ� ��� �����ϸ� ��.
   - Ư�� ����� �����Ͽ� �ϳ��� ����� ��ȯ�ϵ��� ����� ���
   -�����ϵǾ� ���� ������ ���·� ����
   -���ڿ�, ����, ��ȯ, ��¥, �����Լ��� ���·� ����
   1)���ڿ� �Լ�
    - ���ڿ� ������ ����� ��ȯ
** ���ڿ� ������ '||'
    �ڹ��� ���ڿ� ������ '+'�� ���� �� ���ڿ��� �����Ͽ� �ϳ��� ���ڿ��� ��ȯ

��)
SELECT 'Oracle' ||','|| 'Modeling' FROM DUAL;

��)ȸ�����̺��� ȸ����ȣ, ȸ����, �ֹι�ȣ�� ��ȸ�Ͻÿ�.
    ��, �ֹι�ȣ�� 'XXXXXX-XXXXXXX' �������� ����Ͻÿ�.
 
  SELECT MEM_ID AS ȸ����ȣ, 
         MEM_NAME AS ȸ����, 
         MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ
    FROM MEMBER;
    

��) ȸ�����̺��� ����ȸ������ ������ ��ȸ�Ͻÿ�.
    Alias�� ȸ����ȣ, ȸ����, �ּ�, ���ϸ���
    SELECT MEM_ID AS ȸ����ȣ, 
           MEM_NAME AS ȸ����, 
           MEM_ADD1||' '||MEM_ADD2 AS �ּ�, 
           MEM_MILEAGE AS ���ϸ���
    FROM MEMBER
    WHERE SUBSTR(MEM_REGNO2,1,1)='2' OR SUBSTR(MEM_REGNO2,1,1)='4'
    ORDER BY 4 DESC;  -- 4��°�� �������� ������������ ����
    
    
 1)CONCAT
    -�־��� �� ���� ���ڿ��� �����Ͽ� �ϳ��� ���ڿ��� ��ȯ
    - '||' �����ڿ� ���� ���
    (�������)
    CONCAT(C1,C2)
        .C1�� C2�� �����Ͽ� ����� ��ȯ    

 ��)ȸ�����̺��� ȸ����ȣ, ȸ����, �ֹι�ȣ�� ��ȸ�Ͻÿ�.
    ��, �ֹι�ȣ�� 'XXXXXX-XXXXXXX' �������� ����ϵ� CONCAT �Լ� ��� 
    
     SELECT MEM_ID AS ȸ����ȣ, 
            MEM_NAME AS ȸ����, 
            CONCAT(CONCAT(MEM_REGNO1,'-'),MEM_REGNO2) AS �ֹι�ȣ  -- �Լ��� �ٸ� �Լ��� ���� �� �� �ִ�. �ȿ� �ִ� �Լ� ���� ����
    FROM MEMBER;
    
drop table temp09;
 
 ������ ī���� �� dmp ���Ϸ� ���� import �ϴ� ���   
 imp wjh12/java file=expall.dmp ignore=y grants=y rows=y indexes=y full=y    
    
 ��) ȸ�����̺��� ȸ����ȣ�� ȸ������ ��ȸ�Ͻÿ�.
 SELECT MEM_ID,MEM_NAME  -- ���� ����� �÷����� ���ϴ´�� ����(�÷���Ī) �ؼ� �̾Ƴ� �� �ִ�.
    FROM MEMBER;
    
 SELECT MEM_ID AS "ȸ����ȣ",
        MEM_NAME AS "ȸ���̸�"
    FROM MEMBER;
    
  2)INITCAP
  - �ܾ��� ���ι��ڸ� �빮�ڷ� ���
  - ���� �̸� ��½� ���
  (�������)
  INITCAP(c1)
   . c1�� ���Ե� �ܾ��� ù ���ڸ� �빮�ڷ� ��ȯ
   
   ��)
   UPDATE EMPLOYEES
   SET EMP_NAME=LOWER(EMP_NAME);
    
    SELECT EMP_NAME FROM EMPLOYEES;
    
    SELECT INITCAP(EMP_NAME) FROM EMPLOYEES;
    
    ROLLBACK;
    
    COMMIT;
    
    
    
    
 BUYER
 BUYER_ID
 _NAME
 _LGU �ŷ�ó ��ǰ �з��ڵ�
 _BANK ����
 _BANKNO ���¹�ȣ
 _ZIP �����ȣ
 _ADD1 �⺻�ּ�
 _ADD2 ���ּ�
 _COMTEL
 _FAX
 MAIL
 
 BUYPROD �������̺�
 BUY_DATE ������
 _PROD ��ǰ
 _QTY ����
 _COST ���԰�
 _PRICE �ǸŰ�
 
 LPROD
 _ID
 _GU 
 _NM �з���
 CART ���� ����
 _MEMBER ����ȣ
 _NO CHAR(13BYTE) ��ǰ�� 1�� ������ �ְ� ������ �� ���� �ִ�.
 _PROD �ǸŵǾ��� ��ǰ�ڵ� / �𵨸��Ҷ� NO �� PROD �� ��� ���
 _QTY �Ǹ� ����
 
 PROD ��ǰ ���̺�
 _COST ���Դܰ�
 _PRICE ����ܰ�
 _TOTALSTOCK �� ���
 _PROPERSTOCK ���� ���
 
 KOR_LOAN_STATUS �����ܾ����̺�
 PERIOD ��¥(����� �����ϱ� ����Ÿ����)
 REGION ����
 GUBUN � ��������
 LOAN_JAN_AMT ���� �ܾ�
 MEMBER
 MEM_ID
 _PASS
 _NAME
 _REGNO1 �ֹι�ȣ ���ڸ�
 _REGNO2 �ֹι�ȣ ���ڸ�
 _BIR ����
 _ZIP �����ȣ
 _ADD1
 _ADD2
 _LIKE ���
 _MEMORIAL �����
 _MILEAGE 
 _DELETE
 
 _DEPARTMENTS
 _PARENT_ID
 
 