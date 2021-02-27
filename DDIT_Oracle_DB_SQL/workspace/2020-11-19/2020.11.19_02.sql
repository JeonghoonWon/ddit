2020-11-19-02) ��Ÿ �ڷ���
 - 2�� �ڷḦ �����ϱ� ���� �ڷ� Ÿ��
 - BLOP, RAW, LONG RAW, BFILE ���� ����
 1) RAW
  - ��������� ���� �뷮�� 2�� �ڷḦ ����
  - �ε��� ó���� ����
  - ORACLE���� �ؼ��̳� ��ȯ�۾��� �������� ����
  - �ִ� 2000BYTE ���� ó�� ����
  - 16������ 2���� ����
  (�������)
  �÷��� RAW(ũ��)   
  
  ��)
  
  CREATE TABLE TEMP07(
  COL1 RAW(1000),
  COL2 RAW(2000));
  
  INSERT INTO TEMP07 VALUES(HEXTORAW('3DE5FF77'), HEXTORAW('00'));
  INSERT INTO TEMP07 VALUES('0011110111101111111101110111','00000000');
  
  SELECT * FROM TEMP07;


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
 
 

    
    
    
    