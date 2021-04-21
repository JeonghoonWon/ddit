<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp" />
</head>
<body>
	<table class="table table-bordered">
		<tr>
			<th>게시판종류</th>
			<td>${board.bo_type}</td>
		</tr>
		<tr>
			<th>글번호</th>
			<td>${board.bo_no}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${board.bo_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.bo_writer}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.bo_date}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.bo_hit}</td>
		</tr>
		<tr>
			<th>추천수</th>
			<td>${board.bo_rec}</td>
		</tr>
		<tr>
			<th>신고수</th>
			<td>${board.bo_rep}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${not empty board.attatchList }">
					<c:forEach items="${board.attatchList }" var="attatch">
						<span>${attatch.att_filename }</span>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.bo_content}</td>
		</tr>
		<tr>
			<td colspan="2">
				<c:url value="/board/boardList.do" var="listURL" />
				<button class="goBtn btn btn-primary" type="button" 
					data-gopage="${listURL }">목록으로</button>
				<a class="btn btn-info mr-2" href="${cPath }/board/noticeList.do">공지글목록</a>
				<c:url value="/board/boardInsert.do" var="insertURL">
					<c:param name="parent" value="${board.bo_no }" />
				</c:url>	
				<a class="btn btn-secondary mr-2" href="${insertURL }">답글쓰기</a>
				<c:url value="/board/boardUpdate.do" var="updateURL">
					<c:param name="what" value="${board.bo_no }" />
				</c:url>
				<a class="btn btn-success mr-2" href="${updateURL }">수정하기</a>
				<a class="btn btn-warning" href="#">삭제하기</a>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		$(".goBtn").on("click", function(){
			let url = $(this).data("gopage");
			if(url)
				location.href = url;
		});
	</script>
	<jsp:include page="/includee/postScript.jsp" />
</body>
</html>