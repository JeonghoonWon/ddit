<%@page import="kr.or.ddit.enumpkg.MimeType"%>
<%@page import="kr.or.ddit.enumpkg.OperatorType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		var functionMap = {
			json:function(resp){
				resultArea.text( resp.expression );
			},
			xml:function(resp){
				resultArea.text($(resp).find("expression").text());
			},
			html:function(resp){
				resultArea.html(resp);
			},
			plain:function(resp){
				resultArea.text(resp);
			}
		}
		
		var mimeKind = $("#mimeKind");
		var resultArea = $("#resultArea");
		var calForm = $("#calForm").on("submit", function(event){
			var dataType = mimeKind.val();
			if(!dataType){
				return true;
			}
			event.preventDefault();
			var action = this.action;
			var method = this.method;
			var data = $(this).serialize();
			var options = {
				url : action,
				method : method,
				data : data,
				error : function(xhr, error, msg) {
					console.log(xhr);
					console.log(error);
					console.log(msg);
				}
			}
			console.log(data);
			options.dataType = dataType;
			options.success = functionMap[options.dataType];
			$.ajax(options);
			return false;
		});
	});
</script>
</head>
<body>
<!-- 1. left, right 의 피연산자와 operator 이름의 연산자를 포함한 필수 파라미터 입력. -->
<!-- 2. 연산의 종류, 4칙연산 지원 -->
<!-- 3. 입력 데이터는 실수형. -->
<!-- 4. 파라미터 전송 : /03/calculator 의 방향으로 전송(전송 데이터는 비노출). -->
<!-- 5. 연산의 결과 : ex) 3 * 4 = 12 와 같은 형태로 제공. -->
<select id="mimeKind">
	<option value>dataType 선택</option>
	<%
		for(MimeType tmp : MimeType.values()){
			%>
			<option value="<%=tmp.name().toLowerCase()%>"><%=tmp.name() %></option>
			<%
		}
	%>
</select>
<form id="calForm" action="<%=request.getContextPath() %>/03/calculator" method="post">
	<input type="number" name="left" />
	<%
		for(OperatorType tmp : OperatorType.values()){
			%>
			<label><input type="radio" name="operator" value="<%=tmp.name() %>"/><%=tmp.getSign() %></label>
			<%
		}
	%>
	<input type="number" name="right" />
	<button type="submit">=</button>
</form>
<div id="resultArea"></div>
</body>
</html>










