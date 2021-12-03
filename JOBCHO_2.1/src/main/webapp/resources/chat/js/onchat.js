/**
 * 
 */

function onChatting(e){
		e.preventDefault();
}
$(document).ready(function(){
	var search = location.search 
	var params = new URLSearchParams(search); 
	var member_num= params.get('member_num');
	console.log("member_num:"+member_num)
	var team_num = 1;
	var chatRoom_num=0;
	var chatMember_num = 0;
	var searchTeamMemberList = null;
	var inviteChatMemberList = [];
	var webSocket = null;
	
	//채팅방 초대를 위한 팀 멤버리스트 호출
	function getInviteChatMemberList(){
		//멤버리스트 호출
		$.ajax({
            url:'/team/'+team_num+'/member/',
            type:'Get',
            dataType:'json',
            success:function(result){
            	console.log(result);
            	searchTeamMemberList=result;
            }
        });//$.ajax
	}
	
	//채팅 보여주기
	function showChatting(result){
		var str=`<div class="job-chat-body">
			<h3>채팅방</h3>
	        <div class="job-chat"> 
	            <hr>`
		result.forEach(function(item){
			if(item.chatMember.member_num == member_num){
				str +=`<p class="send">`+item.chat_contents+`</p>`
			}else{
				str +=`<p class="receive">`+item.chat_contents+`</p>`
			}
		});
	        str +=`</div>
	        <textarea id="commentParentText" 
	        class="form-control col-lg-12"style="width: 100%" rows="5" 
	        name="comment_contents"></textarea>
	        <input id="sendMessage" type="submit" value="댓글남기기" class="btn btn-default btn-lg">
		</div>`
			
			
		$("#body-pd-left").html(str);
	    
	}
	
	//채팅방 목록 왼쪽 사이드바에 출력
	function showChatRoomList(result){
		var str = "";
		result.forEach(function(item){
			str +=`<a href="#" class="nav__link-left onChatting" onclick="onChatting(event)" data-value="`+item.chatRoom_num+`"> <ion-icon
								name="chatbubbles-outline" class="nav__icon-left"></ion-icon> <span
							class="nav__name-left">`+item.chatRoom_name+`</span>
						</a>`
			
			$("#chatRoomList").html(str);
		});		
	}
	
	//채팅방 초대 모달에서 멤버 리스트 출력
	function showInviteChatRoomMemberList(result){
		var str="";
		result.forEach(function(item){
			str +=`<ul id="invite-list-group" class="list-group">
								<li class="list-group-item">
									<div class="thumnail-profile"></div> Lorem
									<button class="badge">초대</button>
								</li>
							</ul>`
			
			$("#chatRoomList").html(str);
		});	
	}
	
	//Socket onmessage 
	function socketOnmessage(message){
		str =`<p class="receive">`+message.data+`</p>`
		$(document).find(".job-chat").append(str);
	}
	
	function getChatMemberNum(){
		//채팅방 리스트 ajax요청
		$.ajax({
			
	        url:'/team/'+team_num+'/chatroom/'+chatRoom_num+'/chatmember',
	        type:'Get',
	        dataType:'json',
	        success:function(result){
	        	findChatMemberNum(result)
	        }
	    });//$.ajax
	}
	
	function findChatMemberNum(result){
		result.forEach(function(item){
			if(item.chatRoom_num==chatRoom_num && item.member_num==member_num){
				chatMember_num = item.chatMember_num
			}
		})
	}
	
	
	//채팅방 선택하면 실행
	$(document).on("click",".onChatting" ,function(e){
		var team_num = 1;
		chatRoom_num = $(this).data("value");
		getChatMemberNum()
		$.ajax({
            url:'/team/'+team_num+'/chatroom/'+chatRoom_num+'/chat',
            type:'Get',
            dataType:'json',
            success:function(result){

            	showChatting(result);
            }
        });//$.ajax
		console.log(webSocket)
		if(webSocket){webSocket.close()}
		console.log("1"+webSocket)
		webSocket = new WebSocket("ws://localhost:8081/chatsocket/"+chatRoom_num)
		console.log("2"+webSocket)
		webSocket.onopen = function(message){
			console.log("연결"+message)
		}
		
		webSocket.onclose = function(message){
			console.log("연결해제"+message)
		}
		
		webSocket.onerror = function(message){
			console.log("socketError"+message)
		}
		
		webSocket.onmessage = socketOnmessage
	})
	
	//채팅방 생성되고 채팅방에 초대
	function inviteChatMemberAction(){
		inviteChatMemberList.forEach(function(member_num,index){
			$.ajax({
		        url:'/team/'+team_num+'/chatroom/'+chatRoom_num+'/chatmember/new',
		        type:'Post',
		        contentType:'application/json',
		        data:JSON.stringify({
		        	"chatRoom_num": chatRoom_num,
		            "member_num": member_num
		        }),
		        dataType:'json',
		        success:function(result){
		        	console.log("member invite succss");
		        }
	    	});
		})
	}
	
	//채팅방 리스트 ajax요청
	$.ajax({
		
        url:'/team/'+team_num+'/chatroom/',
        type:'Get',
        dataType:'json',
        success:function(result){
        	showChatRoomList(result);
        }
    });//$.ajax
	
	$("#createChatRoom").on("click", function(){
		$("#insertChatRoomModal").modal("show");
		getInviteChatMemberList();
		
	})

	//채팅방 생성 모달의 검색바에서 검색어와 일치하는 팀멤버 검색
    $('#inviteChatMemberSearchbar').keyup(function(){
		var keyword = $(this).val()
		var str=""
		searchTeamMemberList.forEach(function(member,index){
			if(((keyword==member.user.user_email.substr(0,keyword.length))
					||(keyword==member.user.user_name.substr(0,keyword.length)))
					&& keyword.length!=0
					&& member.isLive==1){
				str +=`<li class="list-group-item">
	                <div class="thumnail-profile"></div>
	                `+member.user.user_name+"__"+member.user.user_email+`<button id="inviteChatMember" class="badge " value="`+member.member_num+`">초대</button>
	            </li>`
	            
			};
		});
		
		$("#invite-chat-list").html(str);
	});
	
	$(document).on('click','#inviteChatMember',function(e){
		var invitemember_num = this.value;
		$(this).parent().remove();
		var str=""
		searchTeamMemberList.forEach(function(member,index){
			if(member.member_num==invitemember_num){
				str +=`<li class="list-group-item">
		            <div class="thumnail-profile"></div>
		            `+member.user.user_name+"__"+member.user.user_email+`<button id="cancelInviteChatMember" class="badge " value="`+member.member_num+`">취소</button>
		        </li>`
		        member.isLive=0;
				inviteChatMemberList.push(member.member_num);
			}
		});
		$("#invite-wait-list").append(str);
		
	})
	
	$(document).on('click','#cancelInviteChatMember',function(e){
		member_num = this.value;
		var str=""
		$(this).parent().remove();
		searchTeamMemberList.forEach(function(member,index){
			if(member.member_num==member_num){
				str +=`<li class="list-group-item">
	                <div class="thumnail-profile"></div>
	                `+member.user.user_name+"__"+member.user.user_email+`<button id="inviteChatMember" class="badge " value="`+member.member_num+`">초대</button>
	            </li>`
		        member.isLive=1;
				for(var i=0; i<inviteChatMemberList.length;i++){
					if(inviteChatMemberList[i]==member.member_num)
						inviteChatMemberList.pop(i)
						break
				}
				
			}
		});
		$("#invite-chat-list").html(str);
	})
	
	$("#createRoomAction").on('click',function(){
		$.ajax({
	        url:'/team/'+team_num+'/chatroom/new',
	        type:'Post',
	        contentType:'application/json',
	        data:JSON.stringify({
	            "chatRoom_name": $("#insertChatRoomName").val(),
	            "team_num": team_num,
	        }),
	        dataType:'json',
	        success:function(result){
	        	console.log("chatroom create succss");
	        	chatRoom_num = result.chatRoom_num;
	        	inviteChatMemberAction()
	        }
    	});//$.ajax
		
	})
	
	//채팅 전송
	$(document).on("click", "#sendMessage",function(e){
		
		var message = $(document).find("#commentParentText").val()
		$(document).find("#commentParentText").val("")
		str =`<p class="send">`+message+`</p>`
		$(document).find(".job-chat").append(str);
		$.ajax({
	        url:'/team/'+team_num+'/chatroom/'+chatRoom_num+'/chat/new',
	        type:'Post',
	        contentType:'application/json',
	        data:JSON.stringify({
	            "chatMember_num": chatMember_num,
	            "chat_contents": message,
	        }),
	        dataType:'json',
	        success:function(result){
	        	console.log("creat chat succss");
	        }
    	});//$.ajax
		webSocket.send(message)
	})
	
	$(document).on("keydown", "#commentParentText",function(e){
		if(e.keyCode !=13){
			return
		}
		
		var message = $(document).find("#commentParentText").val()
		$(document).find("#commentParentText").val("")
		str =`<p class="send">`+message+`</p>`
		$(document).find(".job-chat").append(str);
		$.ajax({
	        url:'/team/'+team_num+'/chatroom/'+chatRoom_num+'/chat/new',
	        type:'Post',
	        contentType:'application/json',
	        data:JSON.stringify({
	            "chatMember_num": chatMember_num,
	            "chat_contents": message,
	        }),
	        dataType:'json',
	        success:function(result){
	        	console.log("creat chat succss");
	        }
    	});//$.ajax
		webSocket.send(message)
	})
});