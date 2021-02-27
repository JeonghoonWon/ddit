2020-12-21_01) �Լ� (user defined function : FUNCTION)
 - ���ν����� ����� ���� (�� , ��ȯ���� �����ؾ� ��)
 - �Ϲ� �����Լ�ó�� ��밡��
 -- ��� ����ڵ��� �̿� �� �� �ְ� �ص� �� (�����Լ�)
 -- �̹� �Լ��� ���ӻ��� ������ �־ �ʿ��� �� �� �� �ְ� �ص� ��
 -- ����� ���� �Լ� = �Լ� ��� ��
 
 (�������) 
 create [or replace] function �Լ��� (
    �Ű����� [in|out] Ÿ�Ը� [:=default ��],
                :
    �Ű����� [in|out] Ÿ�Ը� [:=default ��])  
    -- �Ű������� ����ϰ� �Լ��� ȣ���Ҷ� �Ű��������� ������ ���, [:=default ��]) �� �ڵ����� ��
    
      return Ÿ�Ը� 
    is|as
        �����
    begin
        �����
      return ��;  -- return Ÿ�Ը� �� return ��; �� Ÿ�Ը��� ���ƾ� �Ѵ�. date �� ���� date. 
    
    end;
        . ����ο� �ݵ�� �ϳ� �̻��� return ���� �����ؾ� ��
  
  
  ��) ��ǰ ���̺��� ��ǰ�ڵ帣 �Է� �޾� �ش� ��ǰ�� 2005�� ���Լ����� ���Աݾ��� ��ȸ�ϴ�
        �Լ��� �ۼ��Ͻÿ�.
    -- ���࿵���� ����ϴ� ������ �Լ��� ����ϴ� ������ ���� ������ ���� �Ǻ��ؾ� �Ѵ�.
    -- ���࿵�� : ��ǰ ���̺��� ��ǰ�ڵ帣 �Է� �޾�
    -- �Լ� : �ش� ��ǰ�� 2005�� ���Լ����� ��ȸ 
    
 (�Լ�ó������ : �Է� ���� �ش� ��ǰ�� 2005�� ���Լ��� �� ���Աݾ��� ��ȸ ) 
 create or replace function fn_buyqty(
    p_code in prod.prod_id%type)     -- �Է� ����̱� ������ in
    
    return varchar2
    
    is
        v_amt number(5) :=0;    -- 2005�⵵ ��ǰ�� ���Լ��� ����
        v_sum number :=0;   -- 2005�⵵ ��ǰ�� ���Ծ�����
        v_res varchar2(50); -- ���
    begin
        select sum(buy_qty), sum(buy_qty*buy_cost) into v_amt, v_sum  -- into = v_amt�� v_sum �� ���� ������
        from buyprod
        where buy_prod = p_code
          and buy_date between '20050101' and '20051231';
        v_res := '���Լ��� : '||to_char(v_amt)||','||'���Աݾ� : ' ||to_char(v_sum);
        
    return v_res;   -- v_amt �� ����ִ� ���� �Լ����� ���� ��ȯ
    
    end;
    
    (����)
    select prod_id as ��ǰ�ڵ�, 
           prod_name as ��ǰ��,
           fn_buyqty(prod_id) as ������Ȳ
    from prod;
    where fn_buyqty(prod_id)>= 100; 
    -- where fn_buyqty(prod_id)>= 100; �� group by �� having ����� ������ �־ ����� �ʿ� ����.
    
   ��) �������� �泲�� ȸ������ 2005�� ��ݱ� ������� ��ȸ�Ͻÿ�.
  (�Լ����� : 2005�� ��ݱ� ����� ��ȸ)
  create or replace function fn_cart01(
    p_memid in member.mem_id%type)
    
    return number
    is
        v_sum number:=0;
    begin
    select sum(cart_qty*prod_price) into v_sum   -- ������ ������ �������� ���� 
      from cart, prod
     where cart_prod=prod_id -- �����Ѱ�
       and cart_member = p_memid 
       and substr(cart_no,1,6) between '200501' and '200506'; -- ��ݱ�ϱ� �������� ������ ��
      
    return v_sum;
      
      end;
   
   ���� : �������� �泲�� ȸ����ȣ �˻�)
   select mem_name as ȸ����, 
          nvl(fn_cart01(mem_id),0) as ���Ծ��հ�
     from member
    where mem_add1 like '�泲%';

    ��) ���� ������ �����ϴ� ������̸��� ����ϴ� �Լ��� �ۼ��Ͻÿ�.
    create or replace function fn_get_user
        return varchar2
    is
        v_name varchar2(50);
    begin
        select user into v_name
          from dual;
        return v_name;
    end;
    
    (����)
    select fn_get_user, fn_get_user() from dual;  -- �Ű������� �������� ��ȣ ���� ����
    
    
    

        
    
