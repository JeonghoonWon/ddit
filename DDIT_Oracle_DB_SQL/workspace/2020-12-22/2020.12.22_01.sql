    2020-12-22_01)
    **의사레코드 
    1) :new
     - insert 와 update 에서 사용
     - 데이터가 삽입(갱신) 될때  새로 입력된 값을 지칭함
     - delete 시에는 모든 컬럼이 null 값이 됨
    2) :old
     - delete 와 update 에서 사용
     - 데이터가 삭제(갱신) 될 때 저장 되어 있던 값
     - insert 시에는 모든 컬럼이 null 값이 됨
     
     **트리거 함수
      - 트리거를 촉발시킨 event의 종류를 판단할 때 사용
      1) inserting : 트리거된 문장이 insert 이면 true
      2) updating : 트리거된 문장이 update 이면 true
      3) deleting : 트리거된 문장이 delete 이면 true
      
      -- 한줄이 하나의 레코드 
      -- 컬럼을 포함하고있는 레코드명을 기술해주고 포함되어진 속성들을 기술하게 되어있음.
      
      -- else if updating then ?
      -- 
      
      begin
        if inserting then
        update remain
           set remain_o=remain_o+:new.cart_qty,
               remain_j_99=remain_j_99-:new.cart_qty,
               remain_date = '20050401'
         where remain_prod =:new.cart_prod
           and remain_year = '2005';
        elsif 
        
        end;
      
    예) 오늘이 2005년 4월 20일 이라 가정하고 매입상품 'P20100001' 의 매입수량을 15개에서
      25개로 수정하시오
      수정 후 재고수불테이블의 자료도 변경될 수 있도록 트리거를 작성하시오
      
     (트리거 생성)
    create or replace trigger tg_buyprod_update
        after insert or update or delete on buyprod
        for each row
    declare
        v_qty number :=0; -- 제품매입수량
        v_prod prod.prod_id%type; -- 상품코드
     begin
        if inserting then   -- 새롭게 매입되어진것
        v_qty := nvl(:new.buy_qty,0);
        v_prod := :new.buy_prod;
    elsif updating then
        v_qty := :new.buy_qty - :old.buy_qty; -- 지금 몇개가 매입 됬는지 봐야하니까 뉴에서 old.buy_qty를 빼준다
        v_prod := :new.buy_prod;
    else
        v_qty := :old.buy_qty;
        v_prod := :old.buy_prod; 
    end if;
    
    update remain 
       set remain_i = remain_i + v_qty,
           remain_j_99 = remain_j_99 + v_qty
     where remain_year = '2005'
       and remain_prod=v_prod;
       
       dbms_output.put_line('추가 변경 수량 :' ||v_qty);
       
       exception 
            when others then
             dbms_output.put_line('예외발생 :' || sqlerrm);
       
       end;
     
     
     (매입장 갱신 또는 삽입)
     declare
        v_cnt number := 0;
        v_qty number := 10;
    
     begin
        select count(*) into v_cnt  -- v_cnt가 1이면 update, 0이면 insert
          from buyprod
         where buy_prod='P201000001'
           and buy_date = to_date('20050420');  -- 날짜와 상품코드를 이용해서 만들어뒀기때문에 있으면 1 없으면 0 이 된다.
        
      if v_cnt = 1 then --update 필요
        update buyprod
           set buy_qty=buy_qty+v_qty
         where buy_prod='P201000001'
           and buy_date = to_date('20050420');
     else
        insert into buyprod
            values('20050420','P201000001',v_qty,21000);
     end if;
   end;  
     
     
     
     