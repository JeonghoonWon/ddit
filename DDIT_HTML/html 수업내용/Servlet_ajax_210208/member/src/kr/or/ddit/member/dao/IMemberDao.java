package kr.or.ddit.member.dao;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberDao {

		//메서드 선언
	
		public String selectById(String id) throws SQLException;// id중복체크		
		
		public String insertMember(MemberVO vo) throws SQLException;	// 저장 - 회원가입제출
		
		public List<ZipVO> selectByDong(String dong) throws SQLException;	// 우편번호찾기
	
		
		
}
