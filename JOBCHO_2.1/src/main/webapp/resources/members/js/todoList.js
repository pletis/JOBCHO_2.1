/**
 * 
 */
$(document).ready(function(){
	var team_num =$("#teamNum").val();
	var userName = $("#userName").val();
	console.log("사용자이름  test : " + userName);
	var user_num= $("#userNum").val();
	var member_num = 1;
	
	function showTodoList(result){
		console.log("showTodoList 함수실행");
		str="";
		result.forEach(function(item){
			console.log(item)
			str+=`<div class="nav-search-result active-right">
                    <div class="result-container">
                        <div class="result-image" style="background-image: url('99D279435B3D788602.jfif');"></div>
                        <div>
                             <p  class="team-profile-email">시작날짜 : `+item.todo_startDate+`</p>
                             <p class="team-profile-email">마감날짜 : `+item.todo_endDate+`</p>
                            <p class="team-profile-email">제목 : `+item.todo_title+`</p>
                            <p class="team-profile-email">설명 : `+item.todo_description+`</p>
                            
                        </div>
                    </div>
                </div>
                <hr>`
		})
		$(".job-todolist-wrap").html(str);
	}
	
	//여러개 불러오는 ajax
	function showUpdateTodoInfo(){
		$.ajax({
	        url:'/team/' +team_num+'/todo',
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	console.log(result);
	        	result.forEach(function(item){
	        		if(item.member_num== member_num){
	        			$("#updateTodoNum").val(item.todo_num)
	        			$("#updateTodoDescription").val(item.todo_description)
	        			$("#updateTodoEnd").val(item.todo_endDate)
	        		}
	        	})
	        }
	    });//$.ajax
	}
	
	//수정
	/*function updateTeamAction(){
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
	}*/
	
	//함수실행
	getTodoList()
	
	function getTodoList(){
		console.log("getTodoList 함수 실행");
		
		$.ajax({
	        url:'/team/'+team_num+'/todo',
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	console.log(result);
	        	showTodoList(result);
	        }
	    });//$.ajax
	}
	
	
	
	//초기화면 출력
	//getTeamList()
	
	$(document).on("click",".team-profile-email", function(){
		$("#updateTodoListInfoModal").modal("show");
		showUpdateTodoInfo();
	})
	
	/*$("#updateTeamAction").on("click", function(){
		updateTeamAction();
	})*/
	
	
});//end document.ready



