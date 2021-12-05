/**
 * 
 */
$(document).ready(function(){
	var user_num=$("#authUserNum").val();
	
	function showTeamList(result){
		str="";
		result.forEach(function(item){
			console.log(item)
			str+=`<div class="job-container">
            <!--프로필-->
            
            <div class="team-profile-image" style="background-image: url('/resources/team/99D279435B3D788602.jfif');"></div>
            
            <div>
                <p class="team-profile-name">`+item.team_name+`</p>
                <p class="team-profile-email">`+item.team_info+`</p>
            </div>
            <!--프로필 끝-->
            <div class="team-btn">
                <button class="teamAdminModal" value="`+item.team_num+`">팀관리</button>
                <button class="enterTeamMain"  value='`+item.team_num+`'>팀으로 가기</button>
            </div>
        </div>`
		})
		$(".job-teamlist-wrap").html(str);
	}
	
	$(document).on("click",".enterTeamMain",function(){
		team_num = $(this).val();
		getMemberNum(team_num);
	})
	
	function getMemberNum(team_num){
		console.log(team_num);
		console.log("aaaa");
	
		$.ajax({
			url:"/team/"+team_num+"/member/"+user_num,
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	console.log(result);
	        	location.href="/team/main?team_num="+team_num+"&member_num="+result.member_num;
	        }
		})
	}
	
	function showUpdateTeamInfo(team_num){
		$.ajax({
	        url:'/team/'+user_num,
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	console.log(result)
	        	result.forEach(function(item){
	        		if(item.team_num==team_num){
	        			$("#updateTeamNum").val(item.team_num)
	        			$("#updateTeamName").val(item.team_name)
	        			$("#updateTeamInfo").val(item.team_info)
	        		}
	        	})
	        }
	    });//$.ajax
	}
	
	function updateTeamAction(){
		$.ajax({
            url:'/team/'+$("#updateTeamNum").val(),
            type:'put',
            contentType:'application/json',
            data: JSON.stringify(
            		{
            			"team_num":$("#updateTeamNum").val(),
            			"team_name":$("#updateTeamName").val(),
            			"team_info":$("#updateTeamInfo").val()
            		}),
            dataType: 'json',
            success:function(result){
            	console.log(result);
            }
        });
		$("#updataTeamInfoModal").modal("hide");
		alert("수정완료");
		getTeamList();
	}
	
	function getTeamList(){
		$.ajax({
	        url:'/team/getlist/'+user_num,
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	console.log(result);
	        	showTeamList(result);
	        }
	    });//$.ajax
	}
	
	//초기화면 출력
	getTeamList();
	
	//팀 삭제하기 
	function deleteTeamAction(){
		console.log("deleteTeamAction 버튼 눌림");
		 
		if(!confirm("정말로 삭제하시겠습니까?")){
			alert("취소되었습니다.")
			$('#updataTeamInfoModal').modal("hide");
		}else{
			$.ajax({
				url : '/team/'+$('#updateTeamNum').val(),
				type : "delete",
				contentType : "application/json",
				success : function(data){
						console.log(data);
						$('#updataTeamInfoModal').modal("hide");
						alert("팀 삭제가 완료되었습니다.");
						getTeamList();
				},
				error : function(error){
					alert("실패");
					return false;
				}
			});
			
		}
		
	}//end deleteTeamAction
	
	 //팀생성
	function insertTeamAction(){
		console.log("insertTeamAction 버튼 눌림");
		 var insertTeamName = document.getElementById('insertTeamName').value;
		 var insertTeamInfo = document.getElementById('insertTeamName').value;
		 var insertUser_num = document.getElementById('insertTeamName').value;
		
		 if(!insertTeamName){
				alert('팀명을 입력해주세요');
				return false;
			}
		 
		 if(!insertTeamInfo){
				alert('팀 정보를 입력해주세요');
				return false;
			}
		 
		 $.ajax({
				url : '/team/'+user_num,
				type : "post",
				contentType : "application/json",
				data : JSON.stringify({
							"team_name" : $("#insertTeamName").val(),			
							"team_info" : $("#insertTeamInfo").val(),
							"user_num" : $("#insertUser_num").val()
				}),
				success : function(data){
						console.log(data);
						alert("팀생성이 완료되었습니다");
						$('#insertTeamInfoModal').modal("hide");
						//window.location.href = "/team/choose";
						getTeamList();

				},
				error : function(error){
					alert("실패");
					return false;
				}
			})
		
		
	}//end insertTeamAction 
	
	
	
	
	//팀수정 모달창 띠우기
	$(document).on("click",".teamAdminModal", function(){
		$("#updataTeamInfoModal").modal("show");
		console.log("this : " + $(this).val());
		showUpdateTeamInfo($(this).val());
	})
	//팀수정 실행
	$("#updateTeamAction").on("click", function(){
		updateTeamAction();
	})
	//팀삭제 실행
	$("#deleteTeamAction").on("click", function(){
		deleteTeamAction();
		getTeamList();
	})
	//팀추가 실행 
	$("#insertTeamAction").on("click", function(){
		insertTeamAction();
		getTeamList();
	})
	
});



