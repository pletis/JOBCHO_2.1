<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>register</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="/resources/login/css/register.css">
	<!-- <link rel="stylesheet" href="register.css"> -->
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
	
	
	function checkValue(){
		console.log("버튼눌림");
		var user_name = document.getElementById('user_name').value;
		var user_birth = document.getElementById('user_birth').value;
		var user_email = document.getElementById('user_email').value;
		var user_pwHint = document.getElementById('user_pwHint').value;
		var user_phoneNum = document.getElementById('user_phoneNum').value;
		var user_pw = document.getElementById('user_pw').value;
		var user_pw2 = document.getElementById('user_pw2').value;
		
		
		//이름 유효성 
		var nameCheck = /^[가-힣]{2,6}$/;
		//생년월일 유효성

		//이메일 유효성
		var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		//핸드폰번호 유효성
		var phoneNumCheck = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
		//비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
		var passWordCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		
		
		
		//비밀번호가 일치하지 않을때 
		if(user_pw != user_pw2){
			alert('비밀번호가 동일하지 않습니다.')
			return false;
		}
		
		if(!user_name){
			alert('이름을 입력해주세요');
			return false;
		}
		
	 	if(!user_birth){
			alert('생년월일을 입력해주세요');
			return false;
		}
	 	
	 	if(!user_email){
			alert('이메일을 입력해주세요');
			return false;
		}
	 	if(!user_pwHint){
			alert('비밀번호 힌트를 입력해주세요');
			return false;
		}
	 	
	 	if(!user_phoneNum){
			alert('전화번호를 입력해주세요');
			return false;
		}
	 	
	 	if(!user_pw){
			alert('비밀번호를 입력해주세요');
			return false;
		}
	 	
	 	if(!user_pw2){
			alert('비밀번호확인을 입력해주세요');
			return false;
		}
		
	 	//이름 유효성검사 
		if(!nameCheck.test(user_name)){
			alert("알맞은 이름을 입력해주세요");
			return false;
		} 
		
		//이메일 정규표현식
		  if(!emailCheck.test(user_email)){
			alert("알맞은 이메일 형식이 아닙니다");
			return false;
		}  
		//번호 유효성 
		if(!phoneNumCheck.test(user_phoneNum)){
			alert("휴대폰 번호를 알맞게 입력해주세요");
			return false;
		}
		//비밀번호 유효성
		if(!passWordCheck.test(user_pw)){
			alert("비밀번호 영문자+숫자+특수조합(8~25자리 입력)로 입력해주세요");
			return false;
		} 
		//생년월일 유효성검사 
		/* if(!birthCheck.test(user_birth)){
			alert("알맞은 생년월일을 입력해주세요");
			return false; 
		} */
		
		$.ajax({
			url : "/users/register",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify({"user_name" : $("#user_name").val(),
						"user_birth" : $("#user_birth").val(),
						"user_email" : $("#user_email").val(),
						"user_pw" : $("#user_pw").val(),
						"user_pwHint" : $("#user_pwHint").val(),
						"user_phoneNum" : $("#user_phoneNum").val()
			}),
			success : function(data){
					alert("회원가입되었습니다.");
					window.location.href = "/users/login";
			},
			error : function(error){
				alert("이메일 중복 확인해주세요");
				return false;
			}
		})
		
		
		
		
	}//end checkValue
		
		
	
	//이메일 중복 확인하기 
	function fn_idCheck(){
		var user_email = document.getElementById('user_email').value;
		//이메일 유효성
		var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		//이메일 입력 안할 경우 
		if(!user_email){
			alert('이메일을 입력해주세요');
			return false;
		}
		
		//이메일 정규표현식gunsoo523@gmail.com
		  if(!emailCheck.test(user_email)){
			alert("알맞은 이메일 형식이 아닙니다");
			return false;
		}  
		
		console.log("버튼누림");
		$.ajax({
			url : "/users/idCheck",
			type : "post",
			dataType : "json",
			data : {"user_email" : $("#user_email").val()},
			success : function(data){
				if(data==1){
					alert("중복된 이메일입니다.");
				}else if(data == 0){
					$("#idCheck").attr("value", "Y");
					alert("사용가능한 이메일입니다.")
				}
			}
		})
	}
	
	
	</script>
</head>
<meta charset="UTF-8">
<title>Users</title>
</head>
<body>
	<div id="wrap" class="job-login">
		<h1>JOBCHO</h1>
		<div class="container">
			
		<div class="login-input">
			<p class="id-pass-inp">
				<br><input type="text" id="user_name" name="user_name"  placeholder="이름  ex)홍길동">
			</p>
			<p class="id-pass-inp">
				<input type="text" id="user_birth" name="user_birth" placeholder="생년월일  ex)980523">
			</p>
			<p class="id-pass-inp">
				<input type="text" id="user_email" name="user_email" placeholder="이메일  ex)honggildong@gmail.com">
			</p>
			<button class="idCheck" type="button" id="idCheck" onclick="fn_idCheck();" value="N">중복확인</button>
			<p class="id-pass-inp">
				<input type="password" id="user_pw" name="user_pw" placeholder="비밀번호(영문자+숫자+특수조합(8~25자리 입력))">
			</p>
			<p class="id-pass-inp">
				<input type="password" id="user_pw2" name="user_pw2"  placeholder="비밀번호 확인">
			</p>
			<p class="id-pass-inp">
				<input type="text" id="user_pwHint" name="user_pwHint"  placeholder="비밀번호 힌트 ex)숭실고등학교">
			</p>
			<p class="id-pass-inp">
				<input type="text" id="user_phoneNum" name="user_phoneNum"  placeholder="전화번호  ex)010-1234-5678">
			</p>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
	
		<div class="login-btn">
			<button type="button" onclick="checkValue();">JobCho 회원가입</button>
		</div>
		
	</div>

	</div>
</body>
</html>