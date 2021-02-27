2020-12-04_02)
    예) 사원들의 평균급여보다 많은 급여를 받는 사원을 출력하시오.
    Alias 사원번호, 사원명, 급여
    (WHERE 절에 서브쿼리 사용)
    SELECT EMPLOYEE_ID AS 사원번호,
           EMP_NAME AS 사원명,
           SALARY AS 급여
      FROM EMPLOYEES
     WHERE SALARY > (SELECT AVG(SALARY)
                       FROM EMPLOYEES)
     ORDER BY 3 DESC;
     
     (FROM 절에 서브쿼리 사용)
     SELECT EMPLOYEE_ID AS 사원번호,
           EMP_NAME AS 사원명,
           SALARY AS 급여
      FROM EMPLOYEES A, (SELECT AVG(SALARY) AS SAL
                           FROM EMPLOYEES)B
     WHERE A.SALARY > B.SAL               
     ORDER BY 3 DESC;   