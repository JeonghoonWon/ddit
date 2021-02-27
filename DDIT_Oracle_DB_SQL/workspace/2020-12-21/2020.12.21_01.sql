2020-12-21_01) 함수 (user defined function : FUNCTION)
 - 프로시져와 비슷한 구조 (단 , 반환값이 존재해야 함)
 - 일반 내장함수처럼 사용가능
 -- 모든 사용자들이 이용 할 수 있게 해둔 것 (내장함수)
 -- 이미 함수의 쓰임새가 정해져 있어서 필요한 걸 쓸 수 있게 해둔 것
 -- 사용자 정의 함수 = 함수 라고 함
 
 (사용형식) 
 create [or replace] function 함수명 (
    매개변수 [in|out] 타입명 [:=default 값],
                :
    매개변수 [in|out] 타입명 [:=default 값])  
    -- 매개변수를 기술하고 함수를 호출할때 매개변수값을 생략한 경우, [:=default 값]) 이 자동으로 들어감
    
      return 타입명 
    is|as
        선언부
    begin
        실행부
      return 값;  -- return 타입명 과 return 값; 는 타입명이 같아야 한다. date 명 값도 date. 
    
    end;
        . 실행부에 반드시 하나 이상의 return 문이 존재해야 함
  
  
  예) 상품 테이블에서 상품코드르 입력 받아 해당 상품의 2005년 매입수량과 매입금액을 조회하는
        함수를 작성하시오.
    -- 실행영역이 담당하는 영역과 함수가 담당하는 영역을 먼저 문제를 보고 판별해야 한다.
    -- 실행영역 : 상품 테이블에서 상품코드르 입력 받아
    -- 함수 : 해당 상품의 2005년 매입수량을 조회 
    
 (함수처리영역 : 입력 받은 해당 상품의 2005년 매입수량 및 매입금액을 조회 ) 
 create or replace function fn_buyqty(
    p_code in prod.prod_id%type)     -- 입력 모드이기 때문에 in
    
    return varchar2
    
    is
        v_amt number(5) :=0;    -- 2005년도 상품별 매입수량 집계
        v_sum number :=0;   -- 2005년도 상품별 매입액집계
        v_res varchar2(50); -- 결과
    begin
        select sum(buy_qty), sum(buy_qty*buy_cost) into v_amt, v_sum  -- into = v_amt와 v_sum 에 각각 보내라
        from buyprod
        where buy_prod = p_code
          and buy_date between '20050101' and '20051231';
        v_res := '매입수량 : '||to_char(v_amt)||','||'매입금액 : ' ||to_char(v_sum);
        
    return v_res;   -- v_amt 에 들어있는 값이 함수명을 통해 반환
    
    end;
    
    (실행)
    select prod_id as 상품코드, 
           prod_name as 상품명,
           fn_buyqty(prod_id) as 매입현황
    from prod;
    where fn_buyqty(prod_id)>= 100; 
    -- where fn_buyqty(prod_id)>= 100; 에 group by 와 having 기능을 가지고 있어서 사용할 필요 없다.
    
   예) 거주지가 충남인 회원들의 2005년 상반기 매출액을 조회하시오.
  (함수영역 : 2005년 상반기 매출액 조회)
  create or replace function fn_cart01(
    p_memid in member.mem_id%type)
    
    return number
    is
        v_sum number:=0;
    begin
    select sum(cart_qty*prod_price) into v_sum   -- 가격을 가지고 오기위해 조인 
      from cart, prod
     where cart_prod=prod_id -- 조인한것
       and cart_member = p_memid 
       and substr(cart_no,1,6) between '200501' and '200506'; -- 상반기니까 월까지만 따지면 됨
      
    return v_sum;
      
      end;
   
   실행 : 거주지가 충남인 회원번호 검색)
   select mem_name as 회원명, 
          nvl(fn_cart01(mem_id),0) as 구입액합계
     from member
    where mem_add1 like '충남%';

    예) 현재 계정에 존재하는 사용자이름을 출력하는 함수를 작성하시오.
    create or replace function fn_get_user
        return varchar2
    is
        v_name varchar2(50);
    begin
        select user into v_name
          from dual;
        return v_name;
    end;
    
    (실행)
    select fn_get_user, fn_get_user() from dual;  -- 매개변수가 없을때는 괄호 생략 가능
    
    
    

        
    
