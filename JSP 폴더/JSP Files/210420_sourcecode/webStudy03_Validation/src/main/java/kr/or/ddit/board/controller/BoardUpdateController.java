package kr.or.ddit.board.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mvc.annotation.Controller;
import kr.or.ddit.mvc.annotation.RequestMapping;
import kr.or.ddit.mvc.annotation.RequestMethod;
import kr.or.ddit.mvc.annotation.resolvers.ModelAttribute;
import kr.or.ddit.mvc.annotation.resolvers.RequestParam;
import kr.or.ddit.mvc.annotation.resolvers.RequestPart;
import kr.or.ddit.mvc.filter.wrapper.MultipartFile;
import kr.or.ddit.utils.RegexUtils;
import kr.or.ddit.validator.BoardInsertGroup;
import kr.or.ddit.validator.CommonValidator;
import kr.or.ddit.validator.UpdateGroup;
import kr.or.ddit.vo.AttatchVO;
import kr.or.ddit.vo.BoardVO;

@Controller
public class BoardUpdateController {
	private String[] filteringTokens = new String[] {"말미잘", "해삼"};
	private IBoardService service = new BoardServiceImpl();
	
	@RequestMapping("/board/boardUpdate.do")
	public String form(
		@RequestParam("what") int bo_no
		, HttpServletRequest req
	) {
		// 게시글 번호로 해당 글을 조회하고,
		
		BoardVO board = service.retrieveBoard(BoardVO.builder()
													.bo_no(bo_no)
													.build());
		req.setAttribute("board", board);
		// 수정 폼으로 전달.		
		return "board/boardForm";
	}
	
	@RequestMapping(value="/board/boardUpdate.do", method=RequestMethod.POST)
	public String update(
			@ModelAttribute("board") BoardVO board
			, @RequestPart(value="bo_files", required=false) MultipartFile[] bo_files
			, HttpServletRequest req
		) {
		
		// 신규 첨부파일에 대한 처리
		if(bo_files!=null) {
			List<AttatchVO> attatchList = new ArrayList<>();
			for(MultipartFile file : bo_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttatchVO(file));
			}
			if(attatchList.size()>0)
				board.setAttatchList(attatchList);
		}
		
		
		Map<String, List<String>> errors = new LinkedHashMap<>();
		req.setAttribute("errors", errors);
		
		// update group hint 를 적용한 검증
		boolean valid = new CommonValidator<BoardVO>()
						.validate(board, errors, UpdateGroup.class);
		
		String view = null;
		String message = null;
		if(valid) {
			String replaceText = 
					RegexUtils.filteringTokens(board.getBo_content(), 'ㅁ', filteringTokens);
			board.setBo_content(replaceText);
			
			// 검증 통과시 modify 로직 사용
			ServiceResult result = service.modifyBoard(board);
			if(ServiceResult.OK.equals(result)) {
				// 로직 실행 성공
				// 성공 결과를 확인할 수 있는 view 로 redirect
				view = "redirect:/board/boardView.do?what="+board.getBo_no();
			}else {
				// 로직 실행 실패
				// 다시 명령이 발생할 수 있는 곳으로 이동
				message = "비밀번호 오류";
				view = "board/boardForm";
			}
		}else {
			view = "board/boardForm";
		}
		
		req.setAttribute("message", message);
		
		return view;
	}	
}
