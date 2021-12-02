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
                <button id="teamAdminModal" value="`+item.team_num+`">팀관리</button>
                <button id="enterTeamMain" value="`+item.team_num+`">팀으로 가기</button>
            </div>
        </div>`
		})
		$(".job-teamlist-wrap").html(str);
	}
	
	function showUpdateTeamInfo(){
		$.ajax({
	        url:'/team/'+user_num,
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	result.forEach(function(item){
	        		if(item.user_num==user_num){
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
	        url:'/team/'+user_num,
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	console.log(result);
	        	showTeamList(result);
	        }
	    });//$.ajax
	}
	
	//초기화면 출력
	getTeamList()
	
	$(document).on("click","#teamAdminModal", function(){
		$("#updataTeamInfoModal").modal("show");
		showUpdateTeamInfo();
	})
	
	$("#updateTeamAction").on("click", function(){
		updateTeamAction();
	})
	
});



