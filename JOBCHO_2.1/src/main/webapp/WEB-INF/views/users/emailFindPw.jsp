<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>find_hint</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="/resources/login/css/find.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="_csrf" content="${_csrf.token}"/>
	<script type="text/javascript">
	
	//security ajax를 사용하면 403에러가 발생하기 때문에 아래와 같은 코드를 작성해야됨 
	var csrfToken = $("meta[name='_csrf']").attr("content");

	$.ajaxPrefilter(function(options, originalOptions, jqXHR){
    	if (options['type'].toLowerCase() === "post") {
        	jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);
    	}
  	});
	
	function find_PwEmail(){
		console.log("버튼누름");
		$.ajax({
			url : "/users/emailFindPw",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify({"user_email" : $("#user_email").val(),
											"user_name" : $("#user_name").val()
				}),
			
			success : function(data){ // 성공할때 
					alert("해당이메일에 임시 비밀번호를 전송하였습니다");
					console.log("해당이메일에 임시 비밀번호를 전송하였습니다");
					window.location.href = "/users/login"; //성공하면 로그인페이지로 이동한다.
			},
			error : function(error){
				console.log("이메일과 이름이 알맞지 않습니다.");
				alert("이메일과 이름이 알맞지 않습니다.");
				return false;
			}
		})	
	}
	
	</script>
</head>
<body>
	<div id="wrap" class="job-login">
		<h1>JOBCHO</h1>
		<div class="job-container">
			
		<div class="login-input">
			<h3>이메일을 통하여 비밀번호 찾기</h3>
			<p class="id-pass-inp">
				<input type="text" id="user_name" name="user_name"  placeholder="이름">
			</p>
			<p class="id-pass-inp">
				<input type="text" id="user_email" name="user_email"  placeholder="이메일">
			</p>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
	
		<div class="login-btn">
			<button type="button" onclick="find_PwEmail();">확인</button>
		</div>
	</div>
	
</body>
</html>