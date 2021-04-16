<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.or.ddit.db.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4> 성능 체크 </h4>
<pre>
	소요(반응)시간 = processing time + latency time
	<a href="oneConnOneProcess.jsp">한번 연결하고 한번 처리한 소요시간</a> : 17ms
	<a href="100Conn100Process.jsp">백번 연결하고 백번 처리한 소요시간</a> : 1444ms
	<a href="oneConn100Process.jsp">한번 연결하고 백번 처리한 소요시간</a> : 22ms
	Pooling 후
	<a href="oneConnOneProcess.jsp">한번 연결하고 한번 처리한 소요시간</a> : 0ms
	<a href="100Conn100Process.jsp">백번 연결하고 백번 처리한 소요시간</a> : 13ms
	<a href="oneConn100Process.jsp">한번 연결하고 백번 처리한 소요시간</a> : 6ms
</pre>
</body>
</html>









