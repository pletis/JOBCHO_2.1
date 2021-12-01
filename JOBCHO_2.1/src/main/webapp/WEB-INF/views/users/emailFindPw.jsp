<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
					alert("success");
					console.log("성공");
					//window.location.href = "/users/findPw_2"; //성공하면 왼쪽페이지로 이동한다.
			},
			error : function(error){
				console.log("실패");
				alert("실패");
				return false;
			}
		})	
	}
	
	</script>
<title>Insert title here</title>
</head>
<body>
		<div>
				<h1>JOBCHO</h1>
			</div>
			<br>
				<h3>이메일로 비밀번호 찾기 </h3>
			<br>
			
			<form>
				<div class="col-auto">
	    			<label for="inputPassword2" class="visually-hidden">이름</label>
	    				이름<input type="text" class="form-control" id="user_name" name="user_name" placeholder="홍길동">
	  			</div>
			
			
				<div class="col-auto">
	    			<label for="inputPassword2" class="visually-hidden">이메일</label>
	    				이메일<input type="text" class="form-control" id="user_email" name="user_email" placeholder="ex)honggildong@gmail.com">
	  			</div>
				
				<br>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="col-auto">
	    		<button type="button" class="btn btn-primary mb-6" onclick="find_PwEmail();">확인</button>
	  			</div>
			</form>
</body>
</html>