2020-12-15_01)
�б� ��� ?
�ڹٶ� ���� ��� ��
�ݺ� ����� ����?
loop and loop �ݺ����� ���
Ŀ�� ������ ������ ���� ����� ���� 

 - ���α׷��� ���� ������ ����
 - IF ���� ����
 1) IF��
 - ���ø����̼� ����� IF���� ���� ���
 
 (�������1)
 IF ���ǽ�1 THEN
    ���1;
    [ELSE
        ���2;]
    END IF;
    
 (�������2)
 IF ���ǽ�1 THEN
        ���1;
    [ELSIF ���ǽ�2 THEN
        ���2;
     ELSE
        ���3;]
     END IF;
    
    
 (�������3)  � ���ǿ� ���̾����� �� �ȿ� �� ������ ���� ��
 IF ���ǽ�1 THEN
        ���1;
    IF ���ǽ�2 THEN
        ���2;
     ELSE
        ���3;
        END IF;  �ϼ��� IF �� ������ �Ǿ�� ��
     ELSE
        ���4;
     END IF;
     
 ��) Ű����� �⵵�� �Է� �޾� �������� ������� �Ǻ��ϴ� ���α׷����ۼ�
 
 SET SERVEROUTPUT ON;
 
 ACCEPT P_YEAR PROMPT '�⵵ �Է� :' 
 P_YEAR : ���� 
 --ACCEPT �� ���� �˸�â�� ��� �װ��� �Է��� �ް� ��.
-- �Է� �޴� �����Ͱ� ���� RPOMPT '�⵵ �Է� :' ����ڰ� �����ϴ�, �Է��ϴ� ���ڿ�
 --����ڰ� �Է��Ѱ� P_YEAR �� ���� ���� ���ڿ��� 
 --�������� �����ݷ�(;) ������� �ʴ´�.
 
 
 ACCEPT P_YEAR PROMPT '�⵵ �Է� :' 
 DECLARE 
    V_YEAR NUMBER :=0;   -- �ʱ�ȭ�� �ݵ�� ���Ѿ��Ѵ�.
    V_MESSAGE VARCHAR2(30); --��� ����
 BEGIN
     V_YEAR := TO_NUMBER{'&P_YEAR');
   -- %�� �ٱ� ������ ���ڿ��� �ǰ� TO_NUMBER�� ���ڷ� �������ش�.
    
  --  C����� �����Ϳ� &  ���� ��
    --����( 4�� ����̸鼭 100�� ����� �ƴϰų�,(OR) 400�� ����� �Ǵ� �⵵ )���� ������� �Ǻ�
    -- (4�� ����̸鼭 100�� ����� �ƴϰų�)�ϳ��� ����, 
    --  (400�� ����� �Ǵ� �⵵) �ϳ��� ���´�.
    IF(MOD(V_YEAR,4)=0 AND MOD(V_YEAR,100)<>0) OR(MOD(V_YEAR,400)=0) THEN
         V_MESSAGE := V_YEAR||'�� �����Դϴ�.';
    ELSE
         V_MESSAGE := V_YEAR||'�� ����Դϴ�.';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(V_MESSAGE);
    
    EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('���ܹ߻� : '||SQLERRM);
    -- SQLERRM�� �߻��� ���ܿ� ���� ���� �޽����� ��ȯ�Ѵ�. 
    --�� �Լ��� �Ű������� �����ڵ� ���� �޴µ�, �Ű������� �ѱ��� ������ 
    --����Ʈ�� SQLCODE�� ��ȯ�� �����ڵ� ���� ������ ���� �޽����� ��ȯ�Ѵ�. 
  END;
  /   
     
  ��) ������ ������ (1~100) �Է��Ͽ� ¦������ Ȧ�������Ǵ�
  DECLARE
    V_NUM NUMBER := 0;
    V_RES VARCHAR2(50);
  BEGIN
    V_NUM := ROUND(DBMS_RANDOM.VALUE(1,100));
    IF MOD(V_NUM,2) = 0 THEN
        V_RES := V_NUM|| '�� ¦��';
    ELSE
        V_RES := V_NUM|| '�� Ȧ��';
    END IF;
    DBMS_OUTPUT.PUT_LINE(V_RES);
    
    END;
    
    -- ����� ��¹��� �ϳ��� ��� �ϴ°� ������ �ּ�ȭ �� �� �ִ�.
        
  ��)LPROD ���̺� ���� �����͸� �Է��Ͻÿ�.
    �з��ڵ� : P501
    �з��� : '��갡����ǰ'
    
    DECLARE
        V_CNT NUMBER := 0;  --SELECT ���� ���(VIEW) �� ���� ��
    BEGIN
        SELECT COUNT(*) INTO V_CNT
          FROM LPROD
         WHERE LPROD_GU = 'P501';
            
        IF V_CNT = 0 THEN
            INSERT INTO LPROD
                SELECT MAX(LPROD_ID)+1, 'p501','��갡����ǰ'
                  FROM LPROD;
        END IF;
        COMMIT;
        EXCEPTION WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('���ܹ߻�' || SQLERRM);
    END;
    
    SELECT * FROM LPROD;

 ����] �� �������� 'P501' �з��ڵ忡 �з����� '�ӻ깰' �� �Է��Ͻÿ�.
        ��, �ڷᰡ �����ϸ� �����Ͻÿ�.
        
     DECLARE
      --SELECT ���� ���(VIEW) �� ���� ��
         V_CNT NUMBER := 0;
        V_LPROD_NM LPROD.LPROD_NM%TYPE := '�ӻ깰';   
        -- ������ , ���� ������ �����ϴµ� ������ ũ��� Ÿ���� �𸦶�
        
    BEGIN
        SELECT COUNT(*) INTO V_CNT
          FROM LPROD
         WHERE LPROD_GU = 'P501';
            
        IF V_CNT = 0 THEN
            INSERT INTO LPROD
                SELECT MAX(LPROD_ID)+1, 'p501',V_LPROD_NM
                  FROM LPROD;
        ELSE
            UPDATE LPROD
               SET LPROD_NM=V_LPROD_NM
             WHERE UPPER(LPROD_GU) = 'P501'; 
        END IF;
         COMMIT;  
        EXCEPTION WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('���ܹ߻�' || SQLERRM);
    END;
   
         
  
    SELECT * FROM LPROD;     

  
     
     
     