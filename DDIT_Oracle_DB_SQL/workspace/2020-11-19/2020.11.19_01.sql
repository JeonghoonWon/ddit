 2020-11-19-01)
 3) LONG ������ Ÿ��
    - �������� ���ڿ��� ����
    - �ִ� 2GB ���� ���� ����
    -LONG Ÿ���� �ϳ��� ���̺��� 1���� ��� ����
    -CLOB�� ��ü(��� ���׷��̵� �ߴ�)
    -SELECT���� SECECT��, UPDATE���� SET��, INSERT���� VALUES������ ��� ����
    (�������)
    �÷��� LONG
    
    
 ��)

 CREATE TABLE TEMP03(
    COL1 LONG,
    COL2 VARCHAR2(2000));
    
 INSERT INTO TEMP03 VALUES('SASDFASDFASDFSDF','ASDFWSDFE');
 
 SELECT * FROM TEMP03;
 SELECT SUBSTR(COL2,2,5)   -- COL2���� 2��° ���ں��� 5���� ����
 FROM TEMP03; 
 
 4) CLOB (Character Large OBjects) ������ Ÿ��
  - ��뷮 ���ڿ� �ڷḦ ó���� ������ ������ Ÿ��
  - �ִ� 4GB ���� ó�� ����
  - �������� ���� �ڷ���
  - �� ���̺��� ���� �� �ִ� clob�� ������ ������ ����
  - �Ϻ� ��� ���� DBMS_LOB ART�� ������ �޾ƾ� ��
  (�������)
  �÷��� CLOB
  
  ��)
  CREATE TABLE TEMP04(
   COL1 CLOB,
   COL2 CLOB,
   COL3 CLOB);
   
 INSERT INTO TEMP04
  VALUES('���ѹα��� ���� ��ȭ���̴�','������ �߱� ����� 500 ���κ��� 3��',
  'Oracle Moteling�� SQL');
  SELECT * FROM TEMP04;
  
  SELECT LENGHTB(COL2) FROM TEMP04;
  
  SELECT DBMS_LOB.SUBSTR(COL1, 5,3),   -- LOB.SUBSTR(COL1, 5,3) �� 3��° ���ں��� 5�� ���� / �׳� SUBSTR �� �ݴ밡 �ȴ�.
         DBMS_LOB.GETLENGTH(COL2),
         LENGTH(COL3)
    FROM TEMP04;
  
  5) NCLOB, NVARCHAR2
   - �ٱ��� ���� ���·� ���� �ڷ�����
   - UTF-8, UTF-16 ������ ENCODDING 
   - ������ ����� CLOB, VARCHAR2�� ����
   
 2. �����ڷ���
    - ������ �Ǽ� ������ ����  --�����Ҽ���(����) FIXED POINT �ε��Ҽ���(�Ǽ�) FLOATING POIINT
    - NUMBER Ÿ�� ����        -- ORACLE �� JAVA �ʹ� �ٸ��� ���ڿ��� ��ȯ "3" + 2 = 5(ORACLE) / "3"+2= 32(JAVA)
    (�������)
    NUMBER[(���е�|*[,������])]
    - ǥ���� �� �ִ� ���� ���� : 1.0e-130 ~ 9.999..9e125
    - ���е� : ��ü �ڸ���(1~38)
    - ������ : �Ҽ��� ������ �ڸ��� 
    ex)NUMBER(5,2) : ��ü 5�ڸ��� Ȯ��(���� �κ� 3�ڸ�, �Ҽ������� 3�ڸ����� �ݿø��Ͽ� 2��° �ڸ����� ǥ��)
    - ���е� ��� '*'�� ����ϸ� 38 �ڸ� �̳����� �ڵ��Ҵ�(�����κ�)
    ex)number(*,2) : �Ҽ��� ���� 3�ڸ����� �ݿø��Ͽ� 2��° �ڸ����� ǥ��. ��, �����κ��� 38�ڸ� �̳����� ũ�⸸ŭ �ڵ� �Ҵ�
    - �������� �����Ǹ� 0���� ����
    - �������� �����̸� �����κп��� �ݿø�
    
    ��)
    
    ----------------------------------------------------------------------------------
    �Է°�               ����                   ����� ��
    ----------------------------------------------------------------------------------
    12345678.7896      NUMBER               12345678.7896  
    12345678.7896      NUMBER(*,2)          12345678.79
    12345678.7896      NUMBER(8)            12345679
    12345678.7896      NUMBER(7,2)          ����
    12345678.7896      NUMBER(10,-2)        12345678.700 
    
    
    ** ���е� < ������ �� ���
     - ���е��� 0�� �ƴ� ��ȿ������ ��
     - (������-���е�) : �Ҽ������Ͽ� �����ؾ��� 0�� ����
     - ������ : �Ҽ��� ������ �������� ��
     
     -----------------------------------------
     �Է°�            ����              ���� ��
     -----------------------------------------
     1.234          NUMBER(4,5)         ����
     0.23           NUMBER(3,5)         ����
     0.0123         NUMBER(3,4)         0.0123
     0.0012345      NUMBER(3,5)         0.00123
     0.00125676     NUMBER(3,5)         0.00126
     
    3. �����ڷ���
     - ��¥�ڷ�(��,��,��,��,��) �� �����ϱ� ���� ������ Ÿ�� 
     -�⺻���� DATE, �ð���(TIMEWONE)������ 10����� 1�ʴ����� �ð�������
      �����ϴ� ������ Ÿ������ TIMESTAMP�� ����
      1) DATE Ÿ��
      - �⺻ ��¥��
      - '+', '-' ������ ���
      **SYSDATE : �ý����� �����ϴ� ��¥ ������ �����ϴ� �Լ�      
      (�������)
      �÷��� DATE
      
 ��)
 CREATE TABLE TEMP05(
 COL1 DATE,
 COL2 DATE,
 COL3 DATE);
 
 INSERT INTO TEMP05 VALUES(SYSDATE, '20101029',SYSDATE+30);
     
 SELECT * FROM TEMP05;
 SELECT COL1-10 FROM TEMP05;  -- ��¥������ ����,������ �ȴ�. 
 
 SELECT MOD(TRUNC(SYSDATE)-TO_DATE('00010101')-1,7) FROM DUAL;
 SELECT MOD(TO_DATE('20100101')-TO_DATE('00010101')-1,7) FROM DUAL;  --TO_DATE = ��ȯ �Լ� ~�� ��ȯ �Ͻÿ�. /  DUAL = 
     
     
     
   SELECT 12345*234567 FROM DUAL; -- SELECT �� ����ϱ� ���ؼ� FROM TABLE �� �־���� TABLE�� �����ص��� 
                                  -- �ʾұ� ������ �ý��ۿ��� �����ϴ�  DUAL �� ���.  
                                  
   SELECT TO_CHAR(COL1,'YYYY"��" MM"��" DD"��" AM HH24:MI:SS') FROM TEMP05;
   
   2)TIMESTAMP Ÿ��
    - �ð��� ������ ������ �ð������� �ʿ��� �� ���
    (�������)
    �÷��� TIMESTAMP - �ð��� ���� ����
    �÷��� TIMESTAMP WITH TIME ZONE -�ð�������(�����/���ø�) ����
    �÷��� TIMESTAMP WITH LOCAL TIME ZONE -������ ��ġ�� �ð�������, ���� TIMESTAMP �� ����
    
    ��)
    CREATE TABLE TEMP06(
        COL1 DATE,
        COL2 TIMESTAMP,
        COL3 TIMESTAMP WITH TIME ZONE,
        COL4 TIMESTAMP WITH LOCAL TIME ZONE);
        
    INSERT INTO TEMP06
    VALUES (SYSDATE,SYSDATE,SYSDATE,SYSDATE);
    
    SELECT * FROM TEMP06;
 
 