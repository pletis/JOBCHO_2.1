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
<title>findPw_3</title>
</head>
<body>
		
		<div>
			<h1>JOBCHO</h1>
		</div>
		
		
		<form>
			<div class="col-auto">
    			<label for="inputPassword2" class="visually-hidden">비밀번호</label>
    				비밀번호 재설정<input type="password" class="user_pw" id="user_pw" name="user_pw">
			</div>
			<div class="col-auto">
    			<label for="inputPassword2" class="visually-hidden">비밀번호</label>
    				비밀번호 확인<input type="password" class="user_pw2" id="user_pw2" name="user_pw2">
			</div>
			<br>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="col-auto">
    			<button type="button" class="btn btn-primary mb-6" onclick="find_Pw3();">확인</button>
  			</div>		
		</form>
	
		
</body>
</html>