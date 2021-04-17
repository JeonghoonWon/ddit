<%@page import="kr.or.ddit.enumpkg.BrowserType"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/userAgent.jsp</title>
</head>
<body>
<h4>User Agent</h4>
<!-- 클라이언트의 브라우저를 확인하고, -->
<!-- iexplore 라면 "당신의 브라우저는 익스플로러입니다." -->
<!-- chrome 라면 "당신의 브라우저는 크롬입니다." -->
<!-- edge 라면 "당신의 브라우저는 엣지입니다." -->
<!-- 라는 메시지를 alert 창으로 띄울것. -->
<%
String agent = request.getHeader("user-agent");

String MSGPTRN = "당신의 브라우저는 %s입니다.";
String message = null;

message = String.format(MSGPTRN, BrowserType.getBrowserName(agent));
%>
<script type="text/javascript">
	alert("<%=message %>");
</script>
</body>
</html>
















