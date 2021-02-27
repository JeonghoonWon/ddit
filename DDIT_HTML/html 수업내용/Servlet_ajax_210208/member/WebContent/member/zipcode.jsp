<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서블릿 컨트롤러 에서 저장된 값 가져오기
	List<ZipVO> list = (List<ZipVO>)request.getAttribute("zip"); // controller 에서 준 이름과 동일하게. 
	
%>
[

<%

	for(int i=0; i<list.size(); i++){
		ZipVO vo = list.get(i);
		
		String bunji = vo.getBunji();
		if(bunji == null) bunji = "";
		
		if(i > 0) out.print(",");
		
%>

{
	"code" : "<%= vo.getZipcode() %>",
	"addr" : "<%= vo.getSido() %> <%= vo.getGugun() %> <%= vo.getDong() %>",
	"bunji" : "<%= bunji %>"

}



<%

	}
%>



]


