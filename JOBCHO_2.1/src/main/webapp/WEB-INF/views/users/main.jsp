<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<meta charset="UTF-8">
<title>Users</title>
</head>
<body>

		메인페이지
		
		 
  		 <h3><sec:authentication property="principal.users.user_name"/>님 안녕하세요</h3>
  		<br>
  		<h2><sec:authentication property="principal.users.user_email"/></h2>
  			
  		<br>
 		 <a href="/users/update">프로필편집 </a>
 		 <a href="logoutAction.do">로그아웃</a>
			<!-- 여기에 삽입 -->
			<!-- 여기에 삽입 -->
			<!-- 여기에 삽입 -->
			
		</div>
		<!-- 다음기능 버튼 -->
		<div style="float: left" class="card shadow">
			<a href="/users/update" style="font-size:40px">팀 선택<i class="fa fa-arrow-circle-right" aria-hidden="true" ></i></a>
		</div>
	</div>
		
</body>
</html>