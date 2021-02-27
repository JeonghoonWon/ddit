package kr.or.ddit.member.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class IDcheck
 */
@WebServlet("/ID.do")

	public class IDcheck extends HttpServlet {
		private static final long serialVersionUID = 1L;       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IDcheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 클라이언트 요청시 전송되는 값을 리턴 
			// 입력한 id 값을 받는다.
			String userId = request.getParameter("id");
		
		// 2. service객체를 얻는다.
			IMemberService service = MemberServiceImpl.getService();
						
		// 3. service 메서드 호출 - 결과값 받기
			String result = service.selectById(userId);
			
		// 4. 결과값을 request에 저장
			request.setAttribute("check", result);
		// 5. view 페이지로 froward 한다.
		RequestDispatcher disp = request.getRequestDispatcher("member/idcheck.jsp");
		disp.forward(request, response);
	}

}
