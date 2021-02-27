  PL/SQL (procedure 생성 실습 PRO_1)
    printemp procedure 생성
    param : empno
    logic : empno에 해당하는 사원의 정보를 조회하여
            사원이름, 부서이름을 화면에 출력
            
   CREATE OR REPLACE PROCEDURE printemp(p_empno emp.empno%TYPE) is
                              
    v_ename emp.ename%TYPE;
    v_dname dept.dname%TYPE;
    
   BEGIN 
     SELECT e.ename, d.dname INTO v_ename, v_dname
       FROM emp e , dept d
      WHERE e.deptno = d.deptno 
        and e.empno = p_empno;
      DBMS_OUTPUT.PUT_LINE(v_ename|| '/' || v_dname);
END;
/
         EXEC printemp(7900);   -- 2개는 못하나 