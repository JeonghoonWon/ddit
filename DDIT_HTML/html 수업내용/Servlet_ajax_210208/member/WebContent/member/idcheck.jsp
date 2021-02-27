<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// controller 에서 저장된 값을 가져온다.
	
	String aa = (String) request.getAttribute("check");
	if (aa != null) {
		// id가 이미 있다. - 사용불가능 
%>
	{
		"sw" : "사용 불가능한 아이디"
	
	}


<%			
	}else {
		// 겹치는 id 가 없다. - 사용가능
%>
	{
		"sw" : "사용 가능한 아이디"
	}

<%		
	}
%>