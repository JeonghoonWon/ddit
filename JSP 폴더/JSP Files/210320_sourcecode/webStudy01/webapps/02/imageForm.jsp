<%@page import="java.io.FilenameFilter"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
//	$(document).on("ready",function(){
		
//	});
	
	$(function(){
		const SRCPTRN = "%A?%N=%V";
 			console.log($("form")[0]);
 			const action = $("form")[0].action;
		
//		console.log($("#image"));
		$("#image").on("change",function(event){
			$("#imageArea").empty();
			
			//select 와 callback 함수
/* 			console.log(this.value); // this = select teg / html 형식이기 때문에 value로 값을 가져와야한다.
			console.log($(this).val());
		this.form.submit();
		 */				
 			// img 태그 생성
		 	var name = this.name; // $(this).attr("name")
		 	var values = $(this).val(); //$(this).val()
		 	var imgs = [];
		 	$(values).each(function(idx,value){
 				var src = SRCPTRN.replace("%A", action)
 							 	 .replace("%N", name)
 							 	 .replace("%V", value);
 				var img = $("<img>").attr("src",src);
 				imgs.push(img);
		 	});
		 	console.log(values)
		 	
 			// imageArea에 img 태그를 innerHTML 로 삽입
 	
 			$("#imageArea").append(imgs); 
 			
		});	
				
	});
	</script>
</head>
<body>

<h4><%= new Date() %></h4>
<!-- JSP는 JSP 하나로만 작동하지 못한다. -->
<!-- 주소의 절대 경로를 만들어줘야한다. image.do 는 client 가 보는 주소. context를 다 써주는 것이 아니라 
	request.getContextPath 를 통해 하드코딩을 막고 경로를 지정해준다. http://localhost/는 클라이언트가 보는 시점에서의 location 을 통해 연결된다. -->

<form action = '<%=request.getContextPath() %>/01/01/image.do'>


<%

String folder = "d:/contents";
File contents = new File(folder);
String[] children = contents.list(new FilenameFilter() {
	
	@Override
	public boolean accept(File dir, String name) {
		String mime = application.getMimeType(name);
		return mime != null && mime.startsWith("image/"); //true를 반환하여 나온다.
		
	}
	
});

	StringBuffer options = new StringBuffer();
	
	for(String child : children){
		options.append(String.format("<option>%s</option>", child));
	}
%>
<select name = "image" id="image" multiple>
<%= options %>
</select>
<input type="submit" value ="전송" style="background-color: red;"/>
</form>
<div id="imageArea"></div>
<script type="text/javascript">
/* 	var select = document.querySelector("#image")
	select.onchange = function(event){
		event.target.form.submit();
	} */
</script>

</body>
</html>