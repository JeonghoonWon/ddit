# 컬럼명과 시간 데이터 출력.
SELECT s000020, in_time FROM stock_sync_0121
ORDER BY in_time

#테이블당 컬럼개수 count
SELECT count(*)
FROM information_schema.columns
WHERE table_name = 'stock_sync_0121'

#in_time 컬럼 제외 count
SELECT count(*)
FROM information_schema.columns
WHERE table_name = 'stock_sync_0121'
AND COLUMN_NAME != 'in_time'


# 컬럼명 추출.
SELECT  COLUMN_NAME
FROM    INFORMATION_SCHEMA.COLUMNS
WHERE   TABLE_NAME = 'stock_sync_0121'

#in_time 컬럼 제외 컬럼명 추출
SELECT  COLUMN_NAME
FROM    INFORMATION_SCHEMA.COLUMNS
WHERE   TABLE_NAME = 'stock_sync_0121'
AND COLUMN_NAME != 'in_time'


columns_privcolumns_privlunch