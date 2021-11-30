<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<meta charset="UTF-8">
	<meta name="_csrf" content="${_csrf.token}"/>
	<script type="text/javascript">
	
	//security ajax를 사용하면 403에러가 발생하기 때문에 아래와 같은 코드를 작성해야됨 
	var csrfToken = $("meta[name='_csrf']").attr("content");
	
	$.ajaxPrefilter(function(options, originalOptions, jqXHR){
    	if (options['type'].toLowerCase() === "post") {
        	jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);
    	}
  	});
	
	function find_Pw2(){
		console.log("버튼눌림");
		
		$.ajax({
			url : "/users/findPw_2",
			type : "post",
			dataType : "json",
			data : {"user_pwHint" : $("#user_pwHint").val()},
			success : function(data){
				console.log(data);
				
				if(data==1){
					console.log("성공");					
					alert("성공")
					window.location.href = "/users/findPw_3";
				}else if(data == 0){
					console.log("실패");					
					alert("비밀번호가 틀렸습니다");
				}
			}
		})
	}
	
	</script>
<title>findPw_2</title>
</head>
<body>

		<div>
			<h1>JOBCHO</h1>
		</div>
		
		<br>
		<h5>당신의 고등학교를 입력하시오</h5>
		<br>
		<form>
			<div class="col-auto">
    			<label for="inputPassword2" class="visually-hidden"></label>
    				힌트 답<input type="text" class="form-control" id="user_pwHint" name="user_pwHint" placeholder="ex)숭실고등학교">
  			</div>
			
			<br>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="col-auto">
    		<button type="button" class="btn btn-primary mb-6" onclick="find_Pw2();">확인</button>
  			</div>
  			
		</form>
	
</body>
</html>