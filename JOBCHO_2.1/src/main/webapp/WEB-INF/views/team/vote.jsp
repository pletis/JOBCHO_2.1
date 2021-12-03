<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/team/team.css">
    <link rel="stylesheet" href="/resources/team/sidebar-team-left.css">
    <link rel="stylesheet" href="/resources/team/sidebar-team-right.css">
    
</head>
<body>
    <header class="team-header">
        <div class="navbar navbar-default team-shadow">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">JOBCHO</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">프로필</a></li>
                                <li><a href="#">로그아웃</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        
    </header>
    <div class="job-vote-body">
		<h1>팀리스트</h1>
		<div class="job-votelist-wrap">
	        <div class="job-container">
	            <!--프로필-->
	            
	            <div class="team-profile-image" style="background-image: url('99D279435B3D788602.jfif');"></div>
	            
	            <div>
	                <p class="vote-num"> 투표 번호 </p>
	                <p class="vote-name"> 투표 제목 </p>
	            </div>
	            <!--프로필 끝-->
	            <div class="vote-btn">
	                <button>투표 확인</button>
	             </div>
	        </div>
        </div>

        <div class="job-container-new">
            <div><a href="#" id="createNewTeam">팀생성하기</a></div>
        </div>
	</div>
<!--왼쪽 사이드바 시작-->
<!--왼쪽 사이드바 시작-->
<!--왼쪽 사이드바 시작-->
    <div class="l-navbar-left" id="navbar-left">
        <nav class="nav-left">
            
                <!--프로필-->
                <div >
                    <div class="nav-profile-image-left" style="background-image: url('/resources/team/99D279435B3D788602.jfif');"></div>
                    <div class="nav-profile-content-left" style="cursor:pointer">
                       	<h1><sec:authentication property="principal.users.user_name"/></h1>
                        <h3><sec:authentication property="principal.users.user_email"/></h3>
                    </div>
                </div>
                <!--프로필 끝-->
                
                
                
            

            <a href="#" class="nav__link-left">
                <ion-icon name="log-out-outline" class="nav__icon-left"></ion-icon>
                <span class="nav__name-left">Log Out</span>
            </a>
        </nav>
    </div>

<!--왼쪽 사이드바 끝-->
<!--왼쪽 사이드바 끝-->
<!--왼쪽 사이드바 끝-->

	<div class="modal" id="updataUsersModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						팀설정
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" class="form-control" id="user_num" name="user_num" value="<sec:authentication property="principal.users.user_num"/>">
						이름<br> <input type="text" class="form-control" id="user_name" name="user_name" value="<sec:authentication property="principal.users.user_name"/>">
						생일 <input type="text" class="form-control" id="user_birth" name="user_birth" value="<sec:authentication property="principal.users.user_birth"/>">
						이메일<input type="hidden" class="form-control" id="user_email" name="user_email" value="<sec:authentication property="principal.users.user_email"/>">
						비밀번호<input type="password" class="form-control" id="user_pw" name="user_pw" value="<sec:authentication property="principal.users.user_pw"/>">
						비밀번호 확인<input type="password" class="form-control" id="user_pw2" name="user_pw2" value="<sec:authentication property="principal.users.user_pw"/>">
						비밀번호 힌트<input type="text" class="form-control" id="user_pwHint" name="user_pwHint" value="<sec:authentication property="principal.users.user_pwHint"/>">
						전화번호<input type="text" class="form-control" id="user_phoneNum" name="user_phoneNum" value="<sec:authentication property="principal.users.user_phoneNum"/>">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<br>
						<input type="button" class="btn btn-success" onclick="checkValue();"  value="수정">
						<div class="modal-scroll">
							<ul class="list-group">

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>


	<!-- 팀정보수정 모달 -->
	<div class="modal" id="updataTeamInfoModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						팀 정보 수정
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						
						<input id="updateTeamNum" type="hidden">
						<input id="updateTeamName" type="text" class="form-control"> 
						<input id="updateTeamInfo" type="text" class="form-control">
						<input id="updateTeamAction" type="button" class="btn btn-success" onclick="insertTeam();" value="수정">
						
					</div>
				</div>
			</div>
		</div>
		
		
	<!-- 팀생성 모달 -->
	<div class="modal" id="insertTeamInfoModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						팀 정보 수정
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						
						<input id="insertTeamName" type="text" class="form-control"> 
						<input id="insertTeamInfo" type="text" class="form-control">
						<input id="insertUser_num" type="text" class="form-control" value="<sec:authentication property="principal.users.user_num"/>">
						<input id="insertTeamAction" type="button" class="btn btn-success" value="팀생성">
						
					</div>
				</div>
			</div>
		</div>
		
	<!-- 투표 진행 모달 -->
	<div class = "modal" id = "voteResultModal" tabindex = "-1">
		<div class ="modal-dialog">
			<div class = "modal-header">
				투표 내용
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<form>	
					<input id = "vote_result1" type = "radio" class="form-control">
					<input id = "vote_result2" type = "radio" class="form-control">
					<input id = "vote_result3" type = "radio" class="form-control">
					<input id = "vote_result4" type = "radio" class="form-control">
					<input id = "vote_result5" type = "radio" class="form-control">
					<button type ="submit" id = "vote-complete-button" >완료</button>
				</form>
			</div>
		</div>
	</div>
		
		<!-- 외부js에 변수 전달 -->
		<input id="authUserNum" value="<sec:authentication property="principal.users.user_Num"/>">
<script src="/resources/team/sidebar-left.js"></script>
<script type="text/javascript">


//security ajax를 사용하면 403에러가 발생하기 때문에 아래와 같은 코드를 작성해야됨 
var csrfToken = $("meta[name='_csrf']").attr("content");

$.ajaxPrefilter(function(options, originalOptions, jqXHR){
	if (options['type'].toLowerCase() === "post") {
    	jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);
	}
	});

//users 정보 수정 모달 호출 
$(document).on("click",".nav-profile-content-left" ,function(e){
	$("#updataUsersModal").modal("show");
	updataMemberNum = this.value
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
				alert("회원정보가 수정되었습니다.");
				//window.location.href = "/team/choose";
				//window.location.replace("/users/main");
		},
		error : function(error){
			alert("알맞은 정보를 입력해주세요");
			return false;
		}
	})
	
	//users 정보 추가 모달 호출 
	$(document).on("click","#createNewTeam" ,function(e){
		console.log("클릭")
		$("#insertTeamInfoModal").modal("show");
		updataMemberNum = this.value
	});
	
	
}//end checkValue

</script>
<script src="/resources/team/onteam.js"></script>
</body>
</html>