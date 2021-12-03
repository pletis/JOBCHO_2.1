<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "vote-body"></div>



<script type="text/javascript">
$(document).ready(function(){
	
	//투표 목록 불러오기
	$.ajax({
		url:'/jobcho/team/1/vote',
		type:'Get',
		processData:false,
		contentType:'application/json',
		
		dataType:'json',
		success:function(result){
			showVoteList(result);
		}
	});
	
	function showVoteList(result){
		str=""
		result.forEach(function(item){
			str += '<div class = "vote-container">'
			str += '<form action = "/team/1/vote/1">'
			str += '<tr><th>번호</th><th>제목</th></tr>'
			str += '<tr><td>'+ item.vote_num +'</td></tr>'
			str += '<tr><td>'+item.vote_name+'</td></tr>'
			str += '<div class ="vote-button">'
			str += '<button type = "submit">투표 결과 보기</button>'
			str += '</div>'
			str += '</form>'
			str += '</div>'
		})
		$(".vote-body").html(str);
	};
	
	/* $(document).on("click", ".vote-button", function(e){
		$.ajax({
			url:'/jobcho/team/1/vote/1',
			type : 'Get',
			
			contentType : 'application/json',
			dataType:'json',
			success:function(result){
				showVote(result);
			}
		});
	}); */
	
	
	
});

</script>


</body>
</html>