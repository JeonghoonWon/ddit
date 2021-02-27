package kr.or.ddit.member.service;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberService {

	//메서드 선언
	
	public String selectById(String id);	// id중복체크
	
	public String insertMember(MemberVO vo);	// 저장 - 회원가입제출
	
	public List<ZipVO> selectByDong(String dong);	// 우편번호찾기
	
	
}
