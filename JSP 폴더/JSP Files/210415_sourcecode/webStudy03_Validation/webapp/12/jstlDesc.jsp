<%@ page import="java.util.Locale" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12/jstlDesc.jsp</title>
<style type="text/css">
	.green{
		background-color: green;
	}
	.blue{
		background-color: blue;
	}
</style>
</head>
<body>
<h4>JSTL(Jsp Standard Tag Library)</h4>
<select onchange="location.href='?lang='+this.value;">
<c:forEach items="${Locale.getAvailableLocales() }" var="tmp">
		<option value="${tmp.toLanguageTag() }">
		${tmp.displayLanguage }[${tmp.displayCountry }]
		</option>
</c:forEach>
</select>
<pre>
	: 커스텀 태그 라이브러리(server side)
	taglib 지시자로 커스텀 태그 로딩 후 사용.
	<prefix:tagname arrtibutes /> 
	1. core
		1) EL 변수(속성) 지원 : set, remove
		<c:set var="test" value="테스트" scope="request"/>
		${requestScope.test }, ${requestScope["test"] }
		<c:remove var="test" scope="request"/>
		${requestScope.test }, ${requestScope["test"] }
		2) 흐름 제어 : 
			조건문 : if, choose~when~otherwise
			<c:if test="${not empty test }">
				test 없음.
			</c:if>
			<c:choose>
				<c:when test="${empty test }">없다</c:when>
				<c:when test="${not empty test }">있다</c:when>
			</c:choose>
			${empty test ? "없다":"있다" }
			반복문 : forEach, forTokens
				for(block variable:collection) : items, var
				for(선언절;조건절;증감절) : var, begin, end, step(>0, 1 생략 가능)
				LoopTagStatus 프로퍼티 : index, count, first, last
				token : 문장의 구성요소중 의미를 부여할 수 있는 최소 단위
				<c:forTokens items="아버지 가방에 들어가신다" delims=" " var="token">
					${token }
				</c:forTokens>
				<c:forTokens items="100,200,300" delims="," var="number">
					${number * 3 }
				</c:forTokens>				
			<c:forEach var="i" begin="1" end="5" step="2" varStatus="vs">
				${i } - ${vs.count } 번째 반복, ${vs.first }, ${vs.last }
			</c:forEach>
		3) URL재처리 : url
		 <c:url var="memberList" value="/member/memberList.do">
		 	<c:param name="page" value="2" />
		 </c:url>
		 <a href="${memberList }">회원목록의 2페이지</a>
		4) 기타 : import, out	
<%-- 		<c:import url="https://www.naver.com" var="naver"/> --%>
<%-- 		<c:out value="${naver }" escapeXml="${false }" /> --%>
	2. fmt (locale 지원)
		1) 언어 처리 : setLocale, message
			- 언어 결정(한글,영문)
			- 메시지 번들 작성(properties)
			- locale 결정
			<c:if test="${empty param.lang }">
				<c:set var="locale" value="${pageContext.request.locale }" />
			</c:if>
			<c:if test="${not empty param.lang }">
				<c:set var="locale" value="${param.lang }"/>
			</c:if>
			<fmt:setLocale value="${locale }"/>
			- 메시지 출력 : 번들 로딩, 메시지 사용.
			<fmt:bundle basename="kr.or.ddit.messages.message">
				<fmt:message key="bow" />
			</fmt:bundle>
		2) 메시지 형식 처리
			parsing : parseNumber, parseDate
			formatting : formatNumber, formatDate
<%-- 			<fmt:setLocale value="en_US"/> --%>
			<fmt:formatNumber value="30000" type="currency" />
	3. fn
</pre>
<!-- 2_9 단까지 구구단 출력 -->
<table>
	<c:forEach var="dan" begin="2" end="9" step="2" varStatus="vs1">
		<tr class="${vs1.count eq 3 ? 'green':'normal' }">
		<c:forEach var="mul" begin="1" end="9" varStatus="vs2">
			<c:choose>
				<c:when test="${vs2.first or vs2.last }">
					<c:set var="clz" value="blue" />
				</c:when>
				<c:otherwise>
					<c:set var="clz" value="normal" />
				</c:otherwise>
			</c:choose>
			<td class="${clz }">${dan }*${mul }=${dan*mul }</td>
		</c:forEach>
		</tr>
	</c:forEach>
</table>
</body>
</html>









