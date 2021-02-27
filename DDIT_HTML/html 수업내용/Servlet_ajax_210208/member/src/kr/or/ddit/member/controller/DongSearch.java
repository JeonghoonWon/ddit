package kr.or.ddit.member.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.ZipVO;

/**
 * Servlet implementation class DongSearch
 */
@WebServlet("/DongSearch.do")
public class DongSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DongSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. client 요청시 전송되는 값 리턴.
		request.setCharacterEncoding("utf-8");
		String dong = request.getParameter("dong"); 	// "dong" : zipsearch.html 에서 가져온 값. 
		// 2. service 객체 얻는다.
		IMemberService service = MemberServiceImpl.getService();
				
		// 3. service 메서드 호출 - 결과값 받기
		List<ZipVO> list = service.selectByDong(dong);
		
		// 4. 결과값을 requerst에 저장 - 꼭 request 에 저장하는것은 아니며, session, application 에 저장 할 수 있다.
										// session : session 이 종료 되기 전까지 사용가능. 로그인의 경우 로그인부터 로그아웃때 까지  어느 위치에서도 사용 할 수 있도록
										// request : 넘어가는 응답 페이지에서만 사용 가능.
										// application : server가 꺼지기 전까지 결과값 사용 가능.
										// page context : 현재 페이지에서만 사용 가능.
		
		request.setAttribute("zip",list);
				
		// 5. view 페이지 (jsp) forward    // redirect / 
		RequestDispatcher disp = request.getRequestDispatcher("member/zipcode.jsp");
		disp.forward(request, response);
		
	
	}

}
