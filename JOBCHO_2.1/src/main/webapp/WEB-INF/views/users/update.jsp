<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
		/* if(!passWordCheck.test(user_pw)){
			alert("비밀번호 영문자+숫자+특수조합(8~25자리 입력)로 입력해주세요");
			return false;
		}  */
		//생년월일 유효성검사 
		/* if(!birthCheck.test(user_birth)){
			alert("알맞은 생년월일을 입력해주세요");
			return false; 
		} */
		
		$.ajax({
			url : "/users/update",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify({"user_num" : $("#user_num").val(),
						"user_name" : $("#user_name").val(),			
						"user_birth" : $("#user_birth").val(),
						"user_email" : $("#user_email").val(),
						"user_pw" : $("#user_pw").val(),
						"user_pwHint" : $("#user_pwHint").val(),
						"user_phoneNum" : $("#user_phoneNum").val()
			}),
			success : function(data){
					console.log(data);
					alert("회원가입이 수정되었습니다.");
					window.location.href = "/users/main";
					//window.location.replace("/users/main");
			},
			error : function(error){
				alert("실패");
				return false;
			}
		})
		
		
		
		
	}//end checkValue
	
	
	
	</script>
</head>
<meta charset="UTF-8">
<title>Users</title>
</head>
<body>

			<div>
			<h2>프로필편집</h2>	
		</div>
		
		<form class="row g-3">
			<div class="col-md-6">
  				<div class="col-auto">
    				<label for="inputPassword2" class="visually-hidden"></label>
    					회원번호<input type="hidden" class="form-control" id="user_num" name="user_num" value="<sec:authentication property="principal.users.user_num"/>">
  				</div>
  				
  				<div class="col-auto">
    				<label for="inputPassword2" class="visually-hidden">이름</label>
    					이름<input type="text" class="form-control" id="user_name" name="user_name" value="<sec:authentication property="principal.users.user_name"/>">
  				</div>
  				
  				<div class="col-auto">
    				<label for="inputPassword2" class="visually-hidden">생년월일</label>
    					생년월일<input type="text" class="form-control" id="user_birth" name="user_birth" value="<sec:authentication property="principal.users.user_birth"/>">
  				</div>

  				<div class="col-auto">
    				<label for="inputPassword2" class="visually-hidden">이메일</label>
    					<input type="hidden" class="form-control" id="user_email" name="user_email" value="<sec:authentication property="principal.users.user_email"/>">
  				</div>
  
  				<div class="col-auto">
    				<label for="inputPassword2" class="visually-hidden">비밀번호</label>
   						비밀번호<input type="password" class="form-control" id="user_pw" name="user_pw" value="<sec:authentication property="principal.users.user_pw"/>">
 				</div>

				 <div class="col-auto">
				 	<label for="inputPassword2" class="visually-hidden">비밀번호확인</label>
    					비밀번호 확인<input type="password" class="form-control" id="user_pw2" name="user_pw2" value="<sec:authentication property="principal.users.user_pw"/>">
 				</div>

 				<div class="col-auto">
    				<label for="inputPassword2" class="visually-hidden">비밀번호 힌트</label>
    					비밀번호 힌트<input type="text" class="form-control" id="user_pwHint" name="user_pwHint" value="<sec:authentication property="principal.users.user_pwHint"/>">
  				</div>
  
  				<div class="col-auto">
    				<label for="inputPassword2" class="visually-hidden">전화번호</label>
    					전화번호<input type="text" class="form-control" id="user_phoneNum" name="user_phoneNum" value="<sec:authentication property="principal.users.user_phoneNum"/>">
 				</div>
  				
  				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  
 				<div class="col-auto">
 					<button type="button" class="btn btn-primary mb-6" onclick="checkValue();">수정완료</button>
  				</div>
  				
 				<a href= "deleteUsersAction.do" >탈퇴하기</a>
</div>
</form>

</body>
</html>