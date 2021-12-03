<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>find_reg_pass</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="/resources/login/css/find.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<meta name="_csrf" content="${_csrf.token}"/>
	<script type="text/javascript">
	//security ajax를 사용하면 403에러가 발생하기 때문에 아래와 같은 코드를 작성해야됨 
	var csrfToken = $("meta[name='_csrf']").attr("content");
	
	$.ajaxPrefilter(function(options, originalOptions, jqXHR){
    	if (options['type'].toLowerCase() === "post") {
        	jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);
    	}
  	});
	
	
	function find_Pw3(){
		console.log("버튼눌림");
		
		var user_pw = document.getElementById('user_pw').value;
		var user_pw2 = document.getElementById('user_pw2').value;
		//user_pw가 공백일때
		if(!user_pw){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		//user_pw2가 공백일때
		if(!user_pw2){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		//비밀번호가 일치하지 않을때
		if(user_pw != user_pw2){
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		
		$.ajax({
			url : "/users/findPw_3",
			type : "post",
			dataType : "json",
			data : {"user_pw" : $("#user_pw").val()},
			success : function(data){
				console.log("data");
				alert("비밀번호가 변경되었습니다.");
				window.location.href = "/users/login"
			}
		})
		
	}//find_Pw3
	
	</script>
</head>
<body>
	<div id="wrap" class="job-login">
		<h1>JOBCHO</h1>
		<div class="job-container">
			
		<div class="login-input">
			<p class="id-pass-inp">
				<input type="password" id="user_pw" name="user_pw"  placeholder="비밀번호 재설정">
			</p>
			<p class="id-pass-inp">
				<input type="password" id="user_pw2"  name="user_pw2"  placeholder="비밀번호 재설정 확인">
			</p>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="login-btn">
			<button type="button" onclick="find_Pw3();">확인</button>
		</div>
	</div>
</div>
	
</body>
</html>