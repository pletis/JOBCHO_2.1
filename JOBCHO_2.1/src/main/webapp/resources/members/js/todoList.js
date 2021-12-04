/**
 * 
 */
$(document).ready(function(){
	var team_num =$("#teamNum").val();
	var userName = $("#userName").val();
	console.log("사용자이름  test : " + userName);
	var user_num= $("#userNum").val();
	var member_num = $("#memberNum").val();
	
	function showTodoList(result){
		console.log("showTodoList 함수실행");
		str="";
		result.forEach(function(item){
			console.log(item)
			str+=`<div class="nav-search-result active-right todoUpdateModalShow" data-air="`+item.todo_num+`">
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
	}//showTodoList
	
	//여러개 불러오는 ajax
	function showUpdateTodoInfo(todo_num){
		console.log()
		
		$.ajax({
	        url:'/team/' +team_num+'/todo',
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	console.log(result);
	        
	        	result.forEach(function(item){
	        		if(item.todo_num== todo_num){
	        			$("#updateTodoNum").val(item.todo_num)
	        			$("#updateTodoTitle").val(item.todo_title)
	        			$("#updateTodoDescription").val(item.todo_description)
	        			$("#updateTodoEnd").val(item.todo_endDate)
	        		}
	        	})
	        }
	    });//$.ajax
	}
	
	//수정
	function updateTodoAction(){
		$.ajax({
            url:'/team/'+team_num+'/todo/'+$("#updateTodoNum").val(),
            type:'put',
            contentType:'application/json',
            data: JSON.stringify(
            		{
            			"todo_num":$("#updateTodoNum").val(),
            			"todo_title":$("#updateTodoTitle").val(),
            			"todo_description":$("#updateTodoDescription").val(),
            			"todo_endDate":$("#updateTodoEnd").val()
            		}),
            dataType: 'json',
            success:function(result){
            	console.log(result);
            }
        });
		$("#updateTodoListInfoModal").modal("hide");
		alert("수정이 완료되었습니다.");
		getTodoList();
	}
	
	//함수실행
	getTodoList();
	
	function getTodoList(){
		console.log("getTodoList 함수 실행");
		
		$.ajax({
	        url:'/team/'+team_num+'/todo/list/'+member_num,
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	console.log(result);
	        	showTodoList(result);
	        }
	    });//$.ajax
	}
	
	//초기화면 출력
	getTodoList();
	
	//오늘의 할일 삭제하기 
	function deleteTodoAction(){
		console.log("오늘의 할일 삭제버튼 눌림");
		 
		if(!confirm("정말로 삭제하시겠습니까?")){
			alert("취소되었습니다.")
			$('#updateTodoListInfoModal').modal("hide");
		}else{
			$.ajax({
				url : '/team/'+team_num+'/todo/'+$("#updateTodoNum").val(),
				type : "delete",
				contentType : "application/json",
				success : function(data){
						console.log(data);
						alert("삭제가 완료되었습니다.");
				},
				error : function(error){
					alert("실패");
					return false;
				}
			});
			$('#updateTodoListInfoModal').modal("hide");
			getTodoList();
		}
		
	}//end deleteTeamAction
	
	
	//수정모달 띄우기 
	$(document).on("click",".todoUpdateModalShow", function(){
		$("#updateTodoListInfoModal").modal("show");
		console.log("this : " + $(this).data('air'));
		showUpdateTodoInfo($(this).data('air'));
	})
	
	//오늘의 할일 수정버튼 눌렀을 때 수정시키는 함수 실행
	$("#updateTodoAction").on("click", function(){
		updateTodoAction();
	})
	
	//오늘의 할일 삭제 버튼을 눌렀을 때 삭제시키는 함수 실행 
	$("#deleteTodoAction").on("click", function(){
		deleteTodoAction();
		getTodoList();
	})
	
});//end document.ready



