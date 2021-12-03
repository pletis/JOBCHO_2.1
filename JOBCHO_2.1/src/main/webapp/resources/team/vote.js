/**
 * 
 */
$(document).ready(function(){
	var team_num = param.team_num;
	
	function getLIstVote(){
		$.ajax({
			url:'/team/'+team_num+'/vote/list',
			type:'Get',
			dataType:'json',
			success
		})
	}
})