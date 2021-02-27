DROP TABLE BOARD_NO;
select nvl(max(board_no),0) +1 as board_no from TB_JDBC_BOARD;