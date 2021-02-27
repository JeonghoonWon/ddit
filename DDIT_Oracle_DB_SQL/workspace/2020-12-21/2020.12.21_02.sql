2020-12-21_02) 트리거 (trigger)
    - 어떤 이벤트가 발생되면 그 이벤트로 인하여 다른 테이블의 값이 자동으로
    변경(삽입/update,삭제) 되도록 구성된 프로시져
    - 데이터 무결성 유지
    
    (사용형식)
    create trigger 트리거명
        [before|after] [insert|update|delete]
        on 테이블명
        [for each row]
        [when 조건]
    begin
        트리거 처리문;
    end;
    . 'before|after' : 트리거의 timming, 생략하면 after로 간주
                        트리거 수행(트리거 처리문)이 이벤트 발생 전이면 before,
                        이벤트 발생 후이면 after 를 기술
    . 'insert|update|delete' : 트리거 이벤트, 트리거를 발생시키는 원인으로
                                or 연산자를 이요하여 복수개 정의 가능 (ex insert or delete)
    . 'for each row' : 행단위 트리거 발생시 기술, 생략하면 문장단위 트리거
    .'when 조건' : 행단위 트리거에서만 사용하며 트리거 이벤트에서 정의된 테이블에 이벤트가
                   발생할 때 보다 구체적인 데이터 검색 조건 부여시 사용
    ** 행단위와 문장단위 트리거
        (1) 문장단위 트리거 : 이벤트 발생시 오직 한번만 트리거 발생(많이 사용하지않음)
        (2) 행단위 트리거 : 'for each row' 기술
                            이벤트 결과 각 생마다 트리거 수행,
                            의사레코드(pesudo record)인 : new, :old 사용가능
                            대부분의 트리거가 소환
 
     예) 분류테이블에 새로운자료를 입력하고 입력이 정상적으로 처리되었으면
        '신규 분류자료가 정상입력되었습니다.!!' 메시지를 출력하는 트리거를 작성하시오.
        [자료]
        분류코드 : p502
        순번 : 12
        분류명 : 농산물
        
     create trigger tg_lprod01
        after insert on lprod
    begin
        dbms_output.put_line( '신규 분류자료가 정상입력되었습니다!!');
        end;
        
    insert into lprod
        values(13,'p507','육류');
    select * from lprod;
    
    예) 입고테이블(buyprod) 에서 2005년 2월과 3월 입고된 상품별 매입수량을 조회하여 
        재고수불테이블을 수정하시오.
        
        (서브쿼리 : 2월과 3월 입고된상품별 매입수량을 조회)
        
        select buy_prod,
               sum(buy_qty)
          from buyprod
         where buy_date between '20050201' and '20050331'
         group by buy_prod
         order by 1;
         
        (메인쿼리 : remain 테이블 update)
        update remain a
           set (a.remain_i, a.remain_j_99, a.remain_date)=
                 (select a.remain_i+b.iamt, a.remain_j_99+b.iamt,to_date('20050331')
                    from (select buy_prod as bid,
                            sum (buy_qty) as iamt
                           from buyprod
                          where buy_date between '20050201' and '20050331'
                          group by buy_prod) b
                    where a.remain_prod=b.bid)
           
       where a.remain_year='2005'
         and a.remain_prod in (select distinct buy_prod
                                 from buyprod
                                where buy_date between '20050201' and '20050331');

      select * from remain;
      
      예) 오늘이 2005년 4월 1일 이라고 가정하고 다음 자료를 장바구니테이블에 입력하시오.
          장바구니테이블에 입력된 후 재고수불테이블을 수정하시오
          
          입력자료 : (29, 21, 0, 50, 2005-01-31 :remain 테이블의 자료)
            구매회원 : c001
            구매상품 : p302000014
            구매수량 : 5
    -------------------------------------------------------------
    (트리거 작성)
    create or replace trigger tg_cart_insert
      after insert on cart
      for each row
      begin
        update remain
           set remain_o=remain_o+:new.cart_qty,
               remain_j_99=remain_j_99-:new.cart_qty,
               remain_date = '20050401'
         where remain_prod =:new.cart_prod
           and remain_year = '2005';
        end;
      
 (실행 : cart 테이블에 자료가 삽입된 후)
    insert into cart
     select 'c001', max(cart_no)+1, 'P302000014', 5
       from cart
      where substr(cart_no,1,8) = '20050401';
      
      select * from remain;
      select * from cart;
      
      ROLLBACK;                      