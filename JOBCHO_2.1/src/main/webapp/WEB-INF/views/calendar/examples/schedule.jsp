<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<CalendarVO> list = (ArrayList<CalendarVO>)request.getAttribute("getListSchedule");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- custom -->
<link href='/resources/calendar/css/main.css' rel='stylesheet' type="text/css" />
<script type="text/javascript" src='/resources/calendar/js/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      locale: "ko", //한국어 설정
      events: [//이벤트 들어가는곳
<%  	  
    	  for(int i = 0; i < list.size(); i++){
    			CalendarVO vo = (CalendarVO)list.get(i);
%>				
    		  {
    	    		title : <%= vo.getSubject()%>,
    	    		start : <%= vo.getStartDate()%>,
    	    		end : <%= vo.getEndDate()%>
    	    },
<%
    	  }
%>
									{
										title : 'default',
										start : "2021-12-08",
										end : "2021-12-08"
									}
    	  
        
      ]//event
    });

    calendar.render();
  });
	
  //팝업창 오픈 스타일
  function click_add(){
	  var url = "schedulePopup";
	  var name = "schedulePopup";
	  var option = "width = 600, height = 600, left = 100, top=50,location=no";
	  window.open(url,name,option)
  };
  
  //datepicker 설정
  $(function(){
	  	$.datepicker.setDefaults({
	  				dateFormat : "yy-mm-dd",
	  				showOtherMonths : true,
	  				showMonthAfterYear : true,
	  				changeYear : true,
	  				changeMonth : true,
	  				yearSuffix : "년",
	  				monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	  				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  				dayNamesMin: ['일','월','화','수','목','금','토'],
	  				dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
	  	});
	  	$("#startDate").datepicker();
	  	$("#endDate").datepicker();
	  	
	  	$("#startDate").datepicker('setDate','today');
	  	$("#endDate").datepicker('setDate', 'today');
	  	
  });
  
  //Ajax 요청 성공시 페이지 새로고침 팝업창 닫기
  $.fn.serializeObject = function(){
	  	var o = {};
	  	var a = this.serializeArray();
	  	$.each(a, function(){
	  			var name = $.trim(this.name),
	  			value = $.trim(this.value);
	  	if(o[name]){
	  		if(!o[name].push) {
	  			o[name] = [o[name]];
	  		}
	  		o[name].push(value || '');
	  	}else{
	  		o[name] = value || '';
	  	}
	  });
	  return o;
  };
  
  function click_ok(){
	  
	  var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
	  
	  $.ajax({
		  			data : scheduleData,
		  			url : "addSchedule",
		  			type : "POST",
		  			dataType : "json",
		  			contentType : "application/json; charset=UTF-8",
		  			success : function(data){
		  					opener.parent.location.reload();
		  					window.close();
		  			}
	  });
	  
  };
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <!-- 캘린더 선언 -->
  <div id="calendar" style="position: relative;">
  	<!-- 일정 추가 버튼 -->
  	<div>
  		<button class="add-button" type="button" onclick="click_add();">일정추가</button>
  	</div>
  </div>

</body>
</html>
	