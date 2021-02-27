2020-11-30-02) ROLLUP 과 CUBE
 - SUM 함수는 그룹별 집계만 반환하며 전체 합계를 반환하지 않음
 - GROUP BY 절에 기술된 컬럼을 기준으로만 집계 반환
 ex)
    SELECT PERIOD, GUBUN,
            SUM(LOAN_JAN_AMT)
      FROM KOR_LOAN_STATUS
    GROUP BY PERIOD, GUBUN
    ORDER BY 1,2;
 
 1.ROLLUP
  - GROUP BY 절에 사용
  - ROLLUP 다음에 기술된 컬럼들을 기준으로 레벨별 집계가 필요한 경우 사용
  (사용형식)
    GROUP BY ROLLUP(컬럼명1[컬럼명2,...])
    . ROLLUP 다음 기술된 컬럼의 수가 n개 일 때 n+1 종류의 집계 반환
    . 컬럼명1과 컬럼명2를 적용한 집계(GROUP BY 와 동일)
      컬럼명1을 기준으로 적용한 집계
      전체집계
      
      
   SELECT PERIOD, GUBUN,
        SUM(LOAN_JAN_AMT)
      FROM KOR_LOAN_STATUS
    GROUP BY ROLLUP(PERIOD, GUBUN)
    ORDER BY 1,2;    -- 마지막은 NULL NULL 의 전체 집계가 나온다.
    
         SELECT 
        SUM(LOAN_JAN_AMT)
      FROM KOR_LOAN_STATUS;
      
 예) 대출테이블에서 기간별, 지역별, 구분별 대출잔액의 합계를 조회하시오.
 (GROUP BY 절만 사용)
 
  SELECT PERIOD,REGION, GUBUN,
        SUM(LOAN_JAN_AMT)
      FROM KOR_LOAN_STATUS
    GROUP BY ROLLUP(PERIOD, REGION, GUBUN)
    ORDER BY 1,2; 
    
 