-- SQL���� --
 -- 201118_1 --
 
 -- INSERT-
 INSERT ��
  - ���̺� �ڷḦ ������ �� ���
  (�������)
  INSERT INTO ���̺��[(�÷���1, �÷���2,...)]
    VALUES(��1,��2,...);
    . '�÷���1, �÷���2,...' :�� ������ �� ����
        �����ϴ� ��� ���Ժ� �����ϴ� ��� �÷��� ������ ���� �� ������ Ÿ�Կ� 
        �°� �ڷḦ VALUES���� ����ؾ���
    . '�÷���1, �÷���2,...' �� ����ϴ� ���� ���õ� �÷��� �ڷḦ �����ϰ��� �ϴ� ���
        ����ϸ�, VALUES���� ����� ���� �÷����� 1 : 1 �� ���� �Ǿ�� �Ѵ�.
    . '�÷���1, �÷���2,...' ����� NOT NULL �÷��� ���� �� �� ����
    
    
    ��)���� �ڷḦ EMP���̺� �����Ͻÿ�.
    [�ڷ�]
    ���id : C1001
    ����� : ȫ�浿
    �ּ� : ������ �߱� ���ﵿ 500
    �μ��� : �ѹ���ȹ��
    
    INSERT INTO EMP(EMP_ID,EMP_NAME,EMP_DEPT,DEPT_NAME)
        VALUES('C1001','ȫ�浿','������ �߱� ���ﵿ 500','�ѹ���ȹ��');
    (����)
    SELECT * FROM EMP; 
    
    --UPDATE --
     2. UPDATE ��
    - ����Ǿ� �ִ� �ڷ�(�÷��� ��)�� ������ �� ���
    (�������)
    UPDATE ���̺��
        SET �÷���=�� [,
            �÷���=��,...]
    [WHERE ����];
    . '�÷���' : ������ �ڷ��� �÷���
    . 'WHRER'���� �����Ǹ� ��� �ڷ��� �ش� �÷� ���� ���� 
    
    ��)
    'ȫ�浿' ����� ��ȭ��ȣ�� '042-222-8202'�� �����Ͻÿ�.
    
    UPDATE EMP
        SET EMP_TEL='042-222-8202'
        WHERE EMP_ID='C1001';
        
    SELECT * FROM EMP;
    
    ROLLBACK;
    
    -- DELETE --
     3. DELETE ��
    - ���̺� ����� �ڷḦ ������ �� ���
    - ���谡 ������ ���̺��� �θ����̺��� �� �� �����ǰ� �ִ� �ڷ�� ���� ����
    -ROLLBACK�� ���
    (�������)
    DELETE ���̺��
    [WHERE ����];
     'WHERE'���� �����Ǹ� ���̺��� ��� ���� ����
    
    ��)EMP ���̺��� ��� �ڷḦ �����Ͻÿ�.
    
    DELETE WORK;
    
    DELETE EMP;
    
    SELECT * FROM WORK;
    
    SELECT * FROM EMP;
   
   ROLLBACK;
   
    
    DROP TABLE EMP;
    
    -- DROP --
      4. DROP ��
    - ����Ŭ ��ü�� ����
    -ROLLBACK �� ����� �ƴ�
    
    (�������)
    DROP ��üŸ�� ��ü��;
    
    ��) EMP���̺�� WORK���̺� ���̿� �����ϴ� ���踦 ���� �Ͻÿ�.
    
    ALTER TABLE WORK
    DROP CONSTRAINT FK_WORK_EMP;
    
    ALTER TABLE WORK
    DROP CONSTRAINT FK_WORK_SITE;
    
    DROP TABLE EMP;
    
    DROP TABLE SITE; --MATERIALS �� �ڽ����̺�
    
    DROP TABLE MATERIALS;
    
    DROP TABLE SITE;
    
    DROP TABLE WORK;
    
    --/////////////////////////////////////////////////////////////////////--
    -- 201118_2 --
    
    -- VARCHAR2
     2) VARCHAR2
    . �������� ���ڿ� ó��
    . �ִ� 4000BYTE ó�� ����
    . ���ǵ� ���������� �������� ���� ��ŭ ����ϰ� ���� ������ �ý��ۿ� �ݳ�
    . VARCHAR�� ���� ��� (����Ŭ�� VARCHAR2 ����� �ǰ�)
    (�������)
    �÷��� VARCHAR2(ũ��[BYTE|CHAR])
    '[BYTE|CHAR]' : �����Ǹ� BYTE�� ���
    
    ��)
    
    CREATE TABLE TEMP02(
        COL1 VARCHAR2(20),
        COL2 VARCHAR2(20 CHAR));
        
    INSERT INTO TEMP02
     VALUES('������', '���ѹα���');
    
    INSERT INTO TEMP02
     VALUES('ABCDEFG', 'SAGHDSAGHDSASSASS');
    
    SELECT * FROM TEMP02;
    
    SELECT LENGTHB(COL1),LENGTHB(COL2) FROM TEMP02;
    
     COMMIT;
    
    
     --/////////////////////////////////////////////////////////////////////--
     -- 201119_1 --
    
    -- SUBSTR 
      CREATE TABLE TEMP03(
    COL1 LONG,
    COL2 VARCHAR2(2000));
    
 INSERT INTO TEMP03 VALUES('SASDFASDFASDFSDF','ASDFWSDFE');
 
 SELECT * FROM TEMP03;
 SELECT SUBSTR(COL2,2,5)   -- COL2���� 2��° ���ں��� 5���� ����
 FROM TEMP03; 
 
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
     
   
 --/////////////////////////////////////////////////////////////////////--
    -- 201119_2 --  
     -- ���� ���� --
     2)BFILE 
 - �����ڷ� ����
 - ��� �����ڷḦ �����ͺ��̽� �ܺο� ����
 - ��� ����(DIRECTORY ��ü) ������ �����ÿ� ����
 - 4GB���� ���� ����
 (�������)
 �÷��� BFILE
  . ���丮 ��Ī(Alias) ����(30byte) �� ���ϸ�(256byte) ����
  . 
  
  
  �׸����� �������
  1. �׸������� ����� ���� Ȯ��
  2. ���丮��ü ���� - �׸��� ����� ���丮�� ���� �ּ� 
  
    CREATE DIRECTORY TEST_DIR AS 'D:\A_TeachingMaterial\2.Oracle\other';
  
  3. �׸��� ������ ���̺� ����
    CREATE TABLE TEMP08(
      COL1 BFILE);
  
  4. �׸� ����
    INSERT INTO TEMP08
        VALUES(BFILENAME('TEST_DIR', 'SAMPLE.JPG'));
        
        SELECT * FROM TEMP08;    -- ����� ����� �����ϴµ� ���� �׷��׷� �������� 
        
 3) BLOB
  - �����ڷ� ����
  - ��� �����ڷḦ �����ͺ��̽� ���ο� ����
  -4GB ���� ���� ����
  (�������)
  �÷��� BLOB
  
 (�׸� ���� ����)
 1. �׸����� �غ� (SAMPLE.JPG)
 2. ���丮 ��ü ���� (TEST_DIR)
 3. ���̺� ����
  CREATE TABLE TEMP09(
    COL1 BLOB
    );
 4. �͸��� ����
 DECLARE 
   L-DIR VARCHAR2(20):='TEST_DIR';
   L-FILE VARCHAR2(30):='sample.jpg';
   L_BFILE BFILE;
   L_BLOB BLOB;
 BEGIN
  INSERT INTO TEMP09(COL1) VALUES(EMPTY_BLOB())
  RETURN COL1 INTO L_BLOB
  
  L_BFILE := BFILENAME(L_DIR,L_FILE);
  DBMS_LOB.FILEOPEN(L_BFILE,DBMS_LOB.FILE_READONLY);
  DBMS_LOB.LOADFROMFILE(L_BFILE,L_BFILE,DBMS_LOB.GETLENGTH(L_BFILE));
 -- DBMS_LOB.FILECLOSE(L_BFILE);
 END;
 
  --/////////////////////////////////////////////////////////////////////--
    -- 201120_2 --  
 
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
 
 
 
   --/////////////////////////////////////////////////////////////////////--
    -- 201123_1 --  
    
    
 4. ��Ÿ������
  1) IN ������
  - ���� Ž���� ���� 2�� �̻��� ǥ����(�׸�)�� ����
  - OR �����ڷ� ��ȯ ����
  (�������)
  �÷��� IN(ǥ����1. ǥ����2,...)
  . '�÷���'�� ����� ���� ( ) �ȿ� ����� ǥ���� �� ��� �ϳ��� ��ġ�ϸ� ��ü������ ��
  ��) ������̺��� �μ��ڵ尡 20,60,80�� �μ��� ���� ����� �˻��Ͻÿ�.
  Alias�� �����ȣ, �����, �μ��ڵ�, �޿�
  
  (IN �����ڸ� ������� �ʴ� ���)
  SELECT EMPLOYEE_ID AS �����ȣ, --ù��°
         EMP_NAME AS �����, -- �ι�°
         DEPARTMENT_ID AS �μ��ڵ�, -- ����°
         SALARY AS �޿� -- �׹�°
    FROM EMPLOYEES -- FROM �� �� ���� ����ǰ� WHERE �� ������� ���� �� SELECT �� ������� 
   WHERE DEPARTMENT_ID=20 OR DEPARTMENT_ID=60 OR DEPARTMENT_ID=80 
   ORDER BY DEPARTMENT_ID ASC -- ASC(��������)
   
  (IN �����ڸ� ����ϴ� ���)  
    SELECT EMPLOYEE_ID AS �����ȣ, 
         EMP_NAME AS �����, 
         DEPARTMENT_ID AS �μ��ڵ�, 
         SALARY AS �޿� 
    FROM EMPLOYEES 
   WHERE DEPARTMENT_ID IN(20,60,80)
   ORDER BY 3; -- SELECT 3��°�� �������� 
  
  
  
     --/////////////////////////////////////////////////////////////////////--
    -- 201123_2 -- 
   
   
     4)EXISTS ������
      - �ݵ�� �ڿ� ���������� ���;� ��.
      (�������)
      WHERE EXISTS (��������)
      
 ��) ������̺��� ��ü ����� ��ձ޿����� ���� �޿��� �����ϴ� ����� �ٹ��ϴ� �μ��ڵ带 ��ȸ�Ͻÿ�.
 
 (��ü ����� ��ձ޿�)
    SELECT ROUND(AVG(SALARY))
     FROM EMPLOYEES;
     
    SELECT DISTINCT DEPARTMENT_ID
        FROM EMPLOYEES
       WHERE EXISTS (SELECT 1
                        FROM EMPLOYEES
                       WHERE SALARY > (SELECT ROUND(AVG(SALARY))
                                         FROM EMPLOYEES))
                                         
 ORDER BY 1;    
 
 5) BETWEEN ������
  - ������ �����Ͽ� ������ �����ϴ� ��� ���
  (�������)
  �÷��� BETWEEN ��1 ��2
  . �÷����� ���� '��1'���� '��2' ������ ���̸� ��(true)�� ��ȯ
  
  ��) ȸ�����̺��� ���ϸ����� 1000~3000������ ȸ�������� ��ȸ�Ͻÿ�.
    Alias �� ȸ����ȣ, ȸ����, ���ϸ���
   (AND �����ڸ� ���)  
    SELECT MEM_ID AS ȸ����ȣ, 
           MEM_NAME ȸ����, 
           MEM_MILEAGE AS ���ϸ���
      FROM MEMBER
  --  WHERE MEM_MILEAGE >=1000 AND MEM_MILEAGE <= 3000;    
      WHERE MEM_MILEAGE BETWEEN 1000 AND 3000;
      
      
       6) LIKE ������-****���ڿ��� ���****
        - ������ ���ϴ� ��� ����ϴ� ������
        - ���ϵ�ī��(���Ϲ��ڿ�)�� '%' �� '_'�� ��� 
        - '%' : '%' �� ���� ��ġ���� �� ���Ŀ� ������ ��� ���ڿ��� ����
         ex) '��%' : '��' ���� �����ϴ� ��� ���ڿ��� ����
             '%��' : '��' ���� ������ ��� ���ڿ��� ����
             '%��%' : �ܾ� ���ο� '��' �� �����ϴ� ��� ���ڿ��� ����
        '_' : '_' �� ���� ��ġ���� �ϳ��� ���ڿ� ����
         ex) '��_' : '��' ���� �����ϰ� 2���ڷ� �����Ǹ� �ι�° ���ڴ� ��� ���ڵ� �������
             '_��' : '��' ���� ������ ��� ���ڿ��� ����
             '_��_' : �ܾ� ���ο� '��' �� �����ϴ� ��� ���ڿ��� ���� 
             
 ��) ȸ�����̺��� ȸ���� �������� '�泲'�� ȸ�������� ����Ͻÿ�
      Alias �� ȸ���̸�, �ּ�, ����
      
      SELECT MEM_NAME AS ȸ���̸�, 
             MEM_ADD1|| ' '||MEM_ADD2 AS  �ּ�,
             MEM_JOB AS ����
      
      FROM MEMBER
      WHERE MEM_ADD1 LIKE '�泲%'; -- �����ڴ� �ߺ����� �����ʴ´�
      
  
     --/////////////////////////////////////////////////////////////////////--
    -- 201124_1 -- 
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
      
 --////////////////////////////////////////////////////////////////////////--
 -- 201124_1 --
 
   
      
      