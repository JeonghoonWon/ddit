  2020-11-18-01) INSERT ��
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
        
    
    
    ���id : C1002
    ����� : ������
    �ּ� : ����� ���ϱ� �������� 300-10
    ��å : ����
    �μ��� : IT ���ߺ�
    
       INSERT INTO EMP
        VALUES('C1002','������','����� ���ϱ� �������� 300-10',' ', '����', 'IT ���ߺ�');
    
    (����)
    SELECT * FROM EMP; 
     
     ALTER TABLE EMP DROP COLUMN EMP_TEL;
    
    ALTER TABLE EMP ADD(EMP_TEL VARCHAR2(20)); 

    ���id : C1005
    ����� : �̹���
    �ּ� : ������ ����� ���� 100
    ��ȭ��ȣ : 010-1234-5678
    ��å : ����
    �μ��� : ȸ���
    
    INSERT INTO EMP(EMP_ID, EMP_NAME, EMP_DEPT, EMP_TEL, EMP_GRADE, DEPT_NAME)
    VALUES ('C1005','�̹���','������ ����� ���� 100','010-1234-5678', '����', 'ȸ���');
    
    
 COMMIT;
 
 DELETE EMP;
 
 ROLLBACK;
 
    
    (����)
    SELECT * FROM EMP;
    
    
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
    
    ��)
     '������' ����� ��ȭ��ȣ�� '010-9876-1234'��, ������ '����'���� �����Ͻÿ�.
    
     UPDATE EMP
        SET EMP_TEL='010-9876-1234',
            EMP_GRADE='����'
        WHERE EMP_NAME='������';
        
    ����] ���� ���ǿ� �µ��� WORK���̺� � �ڷḦ �����Ͻÿ�.
    [ó������]
    �����ȣ 'C1001'�� ȫ�浿 ����� ���� ��¥�� 'DAE00001'����忡 �߷� �޾� �����.
    'DAE00001'������� '���� ����� �������'���� ���ú��� ���簡 ���õǰ� 
    2021�� 6�� 30�Ͽ� �ϰ��� ��ǥ�� �ϴ� ������̴�.
    
    INSERT INTO SITE(SITE_NO, SITE_NAME, P_COM_DATE, START_DATE)
        VALUES('DAE0001', '���� ����� �������', '20210630',SYSDATE);
        
    SELECT*FROM SITE;

   

    INSERT INTO WORK
     VALUES('C1001', 'DAE0001', SYSDATE);
     
     DELETE EMP
     WHERE EMP_NAME='ȫ�浿';
    
    DROP TABLE EMP;
    
    
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
    
    