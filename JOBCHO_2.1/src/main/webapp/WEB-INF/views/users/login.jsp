<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div>
			<h1>JOBCHO</h1>
		</div>

	<h2><c:out value="${error }"/></h2>
	<h2><c:out value="${logout }"></c:out></h2>
	
	<form class="row g-3" action="/login" method="post">
			
			
		<div class="col-md-6">
   			 <label for="inputPassword2" class="visually-hidden">이메일</label>
    			<input type="text" class="form-control" id="username" name="username" placeholder="이메일">
  		<br>
  			 <label for="inputPassword2" class="visually-hidden">비밀번호</label>
    			<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
  		
  		<br>
  			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  		
  			  <button type="submit"  class="btn btn-primary mb-6">로그인</button>
  			  
  		</form>	  
  		
  		<br>
  			  <a href="/users/register">회원가입</a>
  		<br>
  		<a href="/users/findPw_1">비밀번호가 기억이 안나십니까?</a>
  			
  		</div>
  			
	
</body>
</html>