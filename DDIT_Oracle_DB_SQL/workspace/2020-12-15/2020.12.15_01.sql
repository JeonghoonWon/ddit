2020-12-15_01)
분기 명령 ?
자바랑 아주 비슷 함
반복 명령이 제공?
loop and loop 반복문때 사용
커서 쿼리의 영향을 받은 행들의 모임 

 - 프로그램의 진행 순서를 변경
 - IF 문이 제공
 1) IF문
 - 어플리케이션 언어의 IF문과 같은 기능
 
 (사용형식1)
 IF 조건식1 THEN
    명령1;
    [ELSE
        명령2;]
    END IF;
    
 (사용형식2)
 IF 조건식1 THEN
        명령1;
    [ELSIF 조건식2 THEN
        명령2;
     ELSE
        명령3;]
     END IF;
    
    
 (사용형식3)  어떤 조건에 참이었을때 그 안에 또 조건을 넣을 때
 IF 조건식1 THEN
        명령1;
    IF 조건식2 THEN
        명령2;
     ELSE
        명령3;
        END IF;  완성된 IF 문 형식이 되어야 함
     ELSE
        명령4;
     END IF;
     
 예) 키보드로 년도를 입력 받아 윤년인지 평년인지 판별하는 프로그램을작성
 
 SET SERVEROUTPUT ON;
 
 ACCEPT P_YEAR PROMPT '년도 입력 :' 
 P_YEAR : 변수 
 --ACCEPT 를 쓰면 알림창이 뜬다 그곳에 입력을 받게 됨.
-- 입력 받는 데이터가 뭔지 RPOMPT '년도 입력 :' 사용자가 제공하는, 입력하는 문자열
 --사용자가 입력한건 P_YEAR 에 들어가고 전부 문자열로 
 --마지막에 세미콜론(;) 사용하지 않는다.
 
 
 ACCEPT P_YEAR PROMPT '년도 입력 :' 
 DECLARE 
    V_YEAR NUMBER :=0;   -- 초기화를 반드시 시켜야한다.
    V_MESSAGE VARCHAR2(30); --결과 저장
 BEGIN
     V_YEAR := TO_NUMBER{'&P_YEAR');
   -- %가 붙기 때문에 문자열이 되고 TO_NUMBER로 숫자로 변경해준다.
    
  --  C언어의 포인터와 &  같은 것
    --윤년( 4의 배수이면서 100의 배수가 아니거나,(OR) 400의 배수가 되는 년도 )인지 평년인지 판별
    -- (4의 배수이면서 100의 배수가 아니거나)하나로 묶고, 
    --  (400의 배수가 되는 년도) 하나로 묶는다.
    IF(MOD(V_YEAR,4)=0 AND MOD(V_YEAR,100)<>0) OR(MOD(V_YEAR,400)=0) THEN
         V_MESSAGE := V_YEAR||'는 윤년입니다.';
    ELSE
         V_MESSAGE := V_YEAR||'는 평년입니다.';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(V_MESSAGE);
    
    EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('예외발생 : '||SQLERRM);
    -- SQLERRM은 발생한 예외에 대한 오류 메시지를 반환한다. 
    --이 함수는 매개변수로 예외코드 값을 받는데, 매개변수를 넘기지 않으면 
    --디폴트로 SQLCODE가 반환한 예외코드 값과 연관된 예외 메시지를 반환한다. 
  END;
  /   
     
  예) 임의의 정수를 (1~100) 입력하여 짝수인지 홀수인지판단
  DECLARE
    V_NUM NUMBER := 0;
    V_RES VARCHAR2(50);
  BEGIN
    V_NUM := ROUND(DBMS_RANDOM.VALUE(1,100));
    IF MOD(V_NUM,2) = 0 THEN
        V_RES := V_NUM|| '은 짝수';
    ELSE
        V_RES := V_NUM|| '은 홀수';
    END IF;
    DBMS_OUTPUT.PUT_LINE(V_RES);
    
    END;
    
    -- 제어문과 출력문은 하나로 묶어서 하는게 오류를 최소화 할 수 있다.
        
  예)LPROD 테이블에 다음 데이터를 입력하시오.
    분류코드 : P501
    분류명 : '축산가공식품'
    
    DECLARE
        V_CNT NUMBER := 0;  --SELECT 문의 결과(VIEW) 의 행의 수
    BEGIN
        SELECT COUNT(*) INTO V_CNT
          FROM LPROD
         WHERE LPROD_GU = 'P501';
            
        IF V_CNT = 0 THEN
            INSERT INTO LPROD
                SELECT MAX(LPROD_ID)+1, 'p501','축산가공식품'
                  FROM LPROD;
        END IF;
        COMMIT;
        EXCEPTION WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('예외발생' || SQLERRM);
    END;
    
    SELECT * FROM LPROD;

 문제] 위 예제에서 'P501' 분류코드에 분류명이 '임산물' 로 입력하시오.
        단, 자료가 존재하면 갱신하시오.
        
     DECLARE
      --SELECT 문의 결과(VIEW) 의 행의 수
         V_CNT NUMBER := 0;
        V_LPROD_NM LPROD.LPROD_NM%TYPE := '임산물';   
        -- 참조형 , 내가 변수를 선언하는데 변수의 크기와 타입을 모를때
        
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
            DBMS_OUTPUT.PUT_LINE('예외발생' || SQLERRM);
    END;
   
         
  
    SELECT * FROM LPROD;     

  
     
     
     