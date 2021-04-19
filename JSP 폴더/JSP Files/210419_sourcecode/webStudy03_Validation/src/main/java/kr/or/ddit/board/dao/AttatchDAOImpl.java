package kr.or.ddit.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.db.mybatis.CustomSqlSessionFactoryBuilder;
import kr.or.ddit.vo.AttatchVO;
import kr.or.ddit.vo.BoardVO;

public class AttatchDAOImpl implements IAttatchDAO {

	private SqlSessionFactory sessionFactory = 
			CustomSqlSessionFactoryBuilder.getSessionFactory(); 
	
	@Override
	public int insertAttatches(BoardVO board) {
		try(
			SqlSession session = sessionFactory.openSession();	
		){
			IAttatchDAO mapper = session.getMapper(IAttatchDAO.class);
			int cnt = mapper.insertAttatches(board);
			session.commit();
			return cnt;
		}
	}

	@Override
	public AttatchVO selectAttatch(int att_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteAttathes(BoardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}

}
