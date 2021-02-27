package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;

/*
 * dao 객체 얻어오기 - 생성자 
 * 
 * 자신의 객체를 생성하는 리턴하는 메소드 - getService(), getInstance()
 */
public class BoardServiceImpl implements IBoardService {

	private IBoardDao  dao;
	private static IBoardService service;
	
	//생성자 
	private BoardServiceImpl(){
		dao = BoardDaoImpl.getDao();
	}
	
	//get메소드 
	public static  IBoardService getService(){
		if(service == null)  service = new BoardServiceImpl();
		
		return  service;
	}
	
	@Override
	public List<BoardVO> selectAll() {
		List<BoardVO> list = null;
		
		try {
			list = dao.selectAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}




