SELECT A.BOARD_NO, A.BOARD_TITLE, A.BOARD_CONT, B.MEM_NAME,
	             A.BOARD_DATE FROM BOARD A 
	             LEFT OUTER JOIN MEMBER B
	             ON A.MEM_ID = B.MEM_ID 
	             ORDER BY A.BOARD_NO DESC;


  String sql =  "SELECT A.MEM_ID, B.COMMENT_CONT, B.COMMENT_DATE "
		    		  		+ "FROM MEMBER A "
		    		  		+ "LEFT OUTER JOIN COMMENT_BOARD B"
		    		  		+ " ON A.MEM_ID = B.MEM_ID "
		    		  		+ " WHERE B.BOARD_NO = ? "
		    		  		+ " ORDER BY B.COMMENT_DATE DESC";	      
                            
    delete  from board where board_no =1,
    and delete from comment_board where board_no =1;
    
    commit;
    
    SELECT * FROM COMMENT_BOARD WHERE BOARD_NO = 1
    