<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// controller 에서 저장된 값을 가져온다.
	
	String aa = (String) request.getAttribute("insert");
	if (aa != null) {
		
%>
	{
		"sw" : "가입 성공"
	
	}


<%			
	}else {
		
%>
	{
		"sw" : "가입 실패"
	}

<%		
	}
%>
