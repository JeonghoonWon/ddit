package kr.or.ddit.member.dao;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

import com.ibatis.sqlmap.client.SqlMapClient;

//	SqlMapClient 객체 얻어오기  - 생성자	
//		- mapper sql 문을 수행하기 위한 객체
//	자신의 객체를 생성해서 리턴 - getDao() getInstance()
//	service에서 사용하게 하기 위해서

public class MemberDaoImpl implements IMemberDao {
	
	private SqlMapClient client;
	private static IMemberDao dao;	
	
	// 생성자
	private MemberDaoImpl(){
		client = SqlMapClientFactory.getClient();
				
	}
	public static IMemberDao getDao() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
		
	}
	
	@Override
	public String selectById(String id) throws SQLException {
		String resid = null;
		
		// sql문 수행 결과를 리턴받음
		resid = (String) client.queryForObject("member.selectById",id);
		
		return resid;	// 서비스로 리턴
		
		// try / catch 를 안썼기 때문에 오류 시 throws 로 service 로 보낸다.
	}

	@Override
	public String insertMember(MemberVO vo) throws SQLException {
		return (String)client.insert("member.insertMember", vo);
		
		/*
		String  insertId = null;
		
		//sql문을 수행 결과를 리턴 받음 
		insertId = (String)client.insert("member.insertMember", vo);
		
		return insertId; //서비스로 리턴 
		*/
	}

	@Override
	public List<ZipVO> selectByDong(String dong) throws SQLException {
		
		return client.queryForList("member.selectByDong",dong);
		// 아래 3줄을 1줄로 표현 가능 
	
		/*	List<ZipVO> list = null;
		
		list = client.queryForList("member.selectByDong",dong);
		
		return list;*/
	}

}
