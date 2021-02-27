2020-12-21_02) Ʈ���� (trigger)
    - � �̺�Ʈ�� �߻��Ǹ� �� �̺�Ʈ�� ���Ͽ� �ٸ� ���̺��� ���� �ڵ�����
    ����(����/update,����) �ǵ��� ������ ���ν���
    - ������ ���Ἲ ����
    
    (�������)
    create trigger Ʈ���Ÿ�
        [before|after] [insert|update|delete]
        on ���̺��
        [for each row]
        [when ����]
    begin
        Ʈ���� ó����;
    end;
    . 'before|after' : Ʈ������ timming, �����ϸ� after�� ����
                        Ʈ���� ����(Ʈ���� ó����)�� �̺�Ʈ �߻� ���̸� before,
                        �̺�Ʈ �߻� ���̸� after �� ���
    . 'insert|update|delete' : Ʈ���� �̺�Ʈ, Ʈ���Ÿ� �߻���Ű�� ��������
                                or �����ڸ� �̿��Ͽ� ������ ���� ���� (ex insert or delete)
    . 'for each row' : ����� Ʈ���� �߻��� ���, �����ϸ� ������� Ʈ����
    .'when ����' : ����� Ʈ���ſ����� ����ϸ� Ʈ���� �̺�Ʈ���� ���ǵ� ���̺� �̺�Ʈ��
                   �߻��� �� ���� ��ü���� ������ �˻� ���� �ο��� ���
    ** ������� ������� Ʈ����
        (1) ������� Ʈ���� : �̺�Ʈ �߻��� ���� �ѹ��� Ʈ���� �߻�(���� �����������)
        (2) ����� Ʈ���� : 'for each row' ���
                            �̺�Ʈ ��� �� ������ Ʈ���� ����,
                            �ǻ緹�ڵ�(pesudo record)�� : new, :old ��밡��
                            ��κ��� Ʈ���Ű� ��ȯ
 
     ��) �з����̺� ���ο��ڷḦ �Է��ϰ� �Է��� ���������� ó���Ǿ�����
        '�ű� �з��ڷᰡ �����ԷµǾ����ϴ�.!!' �޽����� ����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�.
        [�ڷ�]
        �з��ڵ� : p502
        ���� : 12
        �з��� : ��깰
        
     create trigger tg_lprod01
        after insert on lprod
    begin
        dbms_output.put_line( '�ű� �з��ڷᰡ �����ԷµǾ����ϴ�!!');
        end;
        
    insert into lprod
        values(13,'p507','����');
    select * from lprod;
    
    ��) �԰����̺�(buyprod) ���� 2005�� 2���� 3�� �԰�� ��ǰ�� ���Լ����� ��ȸ�Ͽ� 
        ���������̺��� �����Ͻÿ�.
        
        (�������� : 2���� 3�� �԰�Ȼ�ǰ�� ���Լ����� ��ȸ)
        
        select buy_prod,
               sum(buy_qty)
          from buyprod
         where buy_date between '20050201' and '20050331'
         group by buy_prod
         order by 1;
         
        (�������� : remain ���̺� update)
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
      
      ��) ������ 2005�� 4�� 1�� �̶�� �����ϰ� ���� �ڷḦ ��ٱ������̺� �Է��Ͻÿ�.
          ��ٱ������̺� �Էµ� �� ���������̺��� �����Ͻÿ�
          
          �Է��ڷ� : (29, 21, 0, 50, 2005-01-31 :remain ���̺��� �ڷ�)
            ����ȸ�� : c001
            ���Ż�ǰ : p302000014
            ���ż��� : 5
    -------------------------------------------------------------
    (Ʈ���� �ۼ�)
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
      
 (���� : cart ���̺� �ڷᰡ ���Ե� ��)
    insert into cart
     select 'c001', max(cart_no)+1, 'P302000014', 5
       from cart
      where substr(cart_no,1,8) = '20050401';
      
      select * from remain;
      select * from cart;
      
      ROLLBACK;                      