/**
 * 
 */

readServer = function(){
	
	
	$.ajax({
		url : '/board/List.do',
		type : 'get',
		success : function(res){
			code = '<div class="panel-group" id="accordion">';
			$.each(res, function(i, v){
				code += '<div class="panel panel-default">';
				code += '  <div class="panel-heading">';
				code += '   <h4 class="panel-title">';
				code += '      <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Collapsible Group 1</a>';
				code += '    </h4>';
				code += '  </div>';
				code += ' <div id="collapse1" class="panel-collapse collapse">';
				code += '    <div class="panel-body">';
				code += '      <p class="p1">';
				code += '                   작성자  :  홍길동   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '                이메일 : 123@sddd.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '                 작성일 : 2021.01.23 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '                 조회수 : 0';
				code += '     </p>';
			          
				code += '      <p class="p2">';
				code += '          <button type="button" name="modify" class="action">수정 </button>';
				code += '          <button type="button" name="delete" class="action">삭제 </button>';
				code += '      </p>';
			          
				code += '      <p class="p3">';
				code += '                내용  내용  내용  내용  내용  내용  내용  내용 <br>';
				code += '                내용  내용  내용  내용  내용  내용  내용  내용  내용  <br> ';      
				code += '      </p>';
			          
				code += '      <p class="p4">';
				code += '          <textarea cols="60"></textarea>';
				code += '          <button type="button" name="reply" class="action">등록</button>';
				code += '      </p>';
				     
				code += '   </div>';
				code += ' </div>';
				code += '</div>';
			})
			
			code += "</div>";
			
			$('.box').html(code);
			
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
		
	})
}