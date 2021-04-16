<%@page import="kr.or.ddit.utils.CookieUtils"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12/elDesc.jsp</title>
</head>
<body>
<h4>EL(Expression Language : 표현 언어)</h4>
<pre>
	: (속성)데이터를 표현(출력)할 목적으로 정의된 스크립트 언어
	
	1. 네개의 영역의 속성들을 표현할 때 사용(*****).
	2. 연산자 지원
		산술연산자 : +-*/% ${2/3 }, ${"2"+"3" }, ${"2"+3 }
		논리연산자 : &&(and), ||(or), !(not), ^(xor)
					${true and true }, ${true and "true" }, \${false or 3 }
		비교연산자 : >(gt), <(lt), >=(ge), <=(le), ==(eq), !=(ne)
				${not (4 le 3) } ${4 gt 3 }
		삼항연산자 : 조건식? 참 : 거짓
		<%
			String test="  ";
			pageContext.setAttribute("asdf", test);
		%>
		단항연산자 : empty ${empty asdf }
			1) 속성의 존재 여부
			2) null 여부
			3) type check
				String : length > 0
				array : length > 0
				collection : size > 0
	3. (속성) 자바 객체에 대한 접근 기능 지원
	<%
		MemberVO member = new MemberVO("a001", "java");
		request.setAttribute("member", member);		
	%>
		${member.mem_id }, ${member["mem_id"] }, ${member.getTest() }, ${member.test }
	4. (속성) 집합객체에 대한 접근 기능 지원
	<%
		String[] array = new String[]{"value1", "value2"};
		session.setAttribute("array", array);
		List<?> list = Arrays.asList("value1", "value2");
		application.setAttribute("sampleList", list);
		
		List list2 = Arrays.asList("tmp1", "tmp2");
		request.setAttribute("sampleList", list2);
		
		Set<String> set = new HashSet<>();
		set.add("value1");
		set.add("value2");
		pageContext.setAttribute("sampleSet", set);
		
		Map<String, Object> map = new HashMap<>();
		map.put("key1", "mapValue1");
		map.put("key-2", new Date());
		session.setAttribute("sampleMap", map);
	%>	
	${array[1] }, <%--=array[2] --%>, ${array[2] }
	\${sampleList.get(3) }, ${applicationScope.sampleList[0] }, ${sampleList[3] }
	<c:forEach items="${pageScope.sampleSet }" var="element" 
			varStatus="vs">
		<c:if test="${not vs.last }">
			${element }	
		</c:if>
	</c:forEach>
	${sampleMap.get("key-2").getTime() }
	${sampleMap.key-2 }, ${sampleMap["key-2"]["time"] }
	5. EL 의 기본 객체 지원
		1. scope : pageScope, requestScope, sessionScope, applicationScope
		2. parameter : param (Map&gt;String,String&lt;), 
					   paramValues (Map&gt;String,String[]&lt;)
		<a href="?param1=value1&param1=value2">파라미터전달</a>
			<%=request.getParameter("param1") %>, 
			${param.param1 }, ${param["param1"] }
			<%=request.getParameterValues("param1") %>
			${paramValues.param1 }, ${paramValues["param1"] }
		3. header : header (Map&gt;String,String&lt;), 
					headerValues (Map&gt;String,String[]&lt;)
			user-agent 값
			<%=request.getHeader("user-agent") %>
			${header.user-agent }, ${headerValues["user-agent"][0] }
		4. cookie : cookie (Map&gt;String,Cookie&lt;)
		 <%=new CookieUtils(request).getCookie("JSESSIONID").getValue() %>
		 ${cookie.JSESSIONID.value }	
		 ${cookie["JSESSIONID"]["value"] }	
		 ${pageContext.session.id }	
		5. context parameter : initParam (Map&gt;String,String&lt;)	
		<%=application.getInitParameter("contentFolder") %>
		${initParam.contentFolder }
		${initParam["contentFolder"] }
		6. pageContext
		${pageContext.request.contextPath }
</pre>
</body>
</html>















