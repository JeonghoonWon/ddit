package kr.or.ddit.board.dao;

import kr.or.ddit.vo.AttatchVO;
import kr.or.ddit.vo.BoardVO;

/**
 * 첨부파일 관리를 위한 persistence layer
 *
 */
public interface IAttatchDAO {
	public int insertAttatches(BoardVO board);
	public AttatchVO selectAttatch(int att_no);
	public int deleteAttathes(BoardVO board);
}
