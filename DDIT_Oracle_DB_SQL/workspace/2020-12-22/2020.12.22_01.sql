    2020-12-22_01)
    **�ǻ緹�ڵ� 
    1) :new
     - insert �� update ���� ���
     - �����Ͱ� ����(����) �ɶ�  ���� �Էµ� ���� ��Ī��
     - delete �ÿ��� ��� �÷��� null ���� ��
    2) :old
     - delete �� update ���� ���
     - �����Ͱ� ����(����) �� �� ���� �Ǿ� �ִ� ��
     - insert �ÿ��� ��� �÷��� null ���� ��
     
     **Ʈ���� �Լ�
      - Ʈ���Ÿ� �˹߽�Ų event�� ������ �Ǵ��� �� ���
      1) inserting : Ʈ���ŵ� ������ insert �̸� true
      2) updating : Ʈ���ŵ� ������ update �̸� true
      3) deleting : Ʈ���ŵ� ������ delete �̸� true
      
      -- ������ �ϳ��� ���ڵ� 
      -- �÷��� �����ϰ��ִ� ���ڵ���� ������ְ� ���ԵǾ��� �Ӽ����� ����ϰ� �Ǿ�����.
      
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
      
    ��) ������ 2005�� 4�� 20�� �̶� �����ϰ� ���Ի�ǰ 'P20100001' �� ���Լ����� 15������
      25���� �����Ͻÿ�
      ���� �� ���������̺��� �ڷᵵ ����� �� �ֵ��� Ʈ���Ÿ� �ۼ��Ͻÿ�
      
     (Ʈ���� ����)
    create or replace trigger tg_buyprod_update
        after insert or update or delete on buyprod
        for each row
    declare
        v_qty number :=0; -- ��ǰ���Լ���
        v_prod prod.prod_id%type; -- ��ǰ�ڵ�
     begin
        if inserting then   -- ���Ӱ� ���ԵǾ�����
        v_qty := nvl(:new.buy_qty,0);
        v_prod := :new.buy_prod;
    elsif updating then
        v_qty := :new.buy_qty - :old.buy_qty; -- ���� ��� ���� ����� �����ϴϱ� ������ old.buy_qty�� ���ش�
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
       
       dbms_output.put_line('�߰� ���� ���� :' ||v_qty);
       
       exception 
            when others then
             dbms_output.put_line('���ܹ߻� :' || sqlerrm);
       
       end;
     
     
     (������ ���� �Ǵ� ����)
     declare
        v_cnt number := 0;
        v_qty number := 10;
    
     begin
        select count(*) into v_cnt  -- v_cnt�� 1�̸� update, 0�̸� insert
          from buyprod
         where buy_prod='P201000001'
           and buy_date = to_date('20050420');  -- ��¥�� ��ǰ�ڵ带 �̿��ؼ� �����ױ⶧���� ������ 1 ������ 0 �� �ȴ�.
        
      if v_cnt = 1 then --update �ʿ�
        update buyprod
           set buy_qty=buy_qty+v_qty
         where buy_prod='P201000001'
           and buy_date = to_date('20050420');
     else
        insert into buyprod
            values('20050420','P201000001',v_qty,21000);
     end if;
   end;  
     
     
     
     