SQL을 분석함수를 사용하지 않고 작성하기
        
        (MAX)
        SELECT e.empno, e.ename, e.sal, e.deptno,
                     (SELECT MAX(SAL)
                        FROM emp
                       WHERE emp.deptno = e.deptno)  MAX_SAL
          FROM emp e
         ORDER BY MAX_SAL DESC;
        
        (MIN)
        SELECT e.empno, e.ename, e.sal, e.deptno,
                     (SELECT MIN(SAL)
                        FROM emp
                       WHERE emp.deptno = e.deptno)  MIN_SAL
          FROM emp e
         ORDER BY MIN_SAL ASC ;
        
        (AVG)
        SELECT e.empno, e.ename, e.sal, e.deptno,
                      (SELECT ROUND(AVG(SAL),2)
                         FROM emp
                        WHERE emp.deptno = e.deptno)  AVG_SAL
         FROM emp e
        ORDER BY AVG_SAL DESC ;