<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message }");
	</script>
</c:if>
</head>
<body>
<form method="post" class="form-inline">
	<input type="text" name="mem_pass" required class="form-control"/>
	<input type="submit" value="인증" class="btn btn-primary"/>
</form>
</body>
</html>