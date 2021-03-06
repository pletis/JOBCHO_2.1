<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- Mobile -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- Date picker -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<!-- fullcalendar CDN======================= -->
<meta name="_csrf" content="${_csrf.token}" />
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
<!-- fullcalendar locale CDN==================== -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
<style>
/* body ì¤íì¼ */
html, body {
	overflow: hidden;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
/* ìºë¦°ë ìì í´ë ì¤íì¼(ë ì§ê° ìë ë¶ë¶) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

.fc-sun {
	color: red !important;
}

.fc-sat {
	color: blue !important;
}
</style>
<title>공유 달력 </title>
</head>
<body style="padding: 30px">
	<form>
		<!-- calendar  -->
		<div id="calendar"></div>
		<!-- Calendar Modal -->
		<div class="modal" id="CalModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						Calendar
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" class="form-control" id="cal_num"
							name="cal_num" value="cal_num"> 일정<br> <input
							type="text" class="form-control" id="cal_title" name="일정"
							value=""> 일정 시작 시간<input type="date" class="form-control"
							id="starts" name="일정시작시간" value=""> 일정 종료 시간<input
							type="date" class="form-control" id="ends" name="일정 종료 시간"
							value=""> 하루종일<input type="text" class="form-control"
							id="allday" name="하루종일 true = 1 or false = 0" value="">
						<br> <input type="button" class="btn btn-success"
							onclick="newEvent()" value="생성" id="saveBtn">
						<div class="modal-scroll">
							<ul class="list-group">

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		var csrfToken = $("meta[name='_csrf']").attr("content");

		$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
			if (options['type'].toLowerCase() === "post") {
				jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);
			}
		});

		document.addEventListener("DOMContentLoaded", function() {
			var calendarEl = document.getElementById("calendar");

			var calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar : {
					left : "prev,next today",
					center : "title",
					right : "dayGridMonth,timeGridWeek,timeGridDay",
				},
				locale : "ko",
				timeZone : "local",
				initialDate : "2021-12-04",
				navLinks : true, // can click day/week names to navigate views
				selectable : true,
				selectMirror : true,
				select : function(start, end) {
					// Display the modal.
					// You could fill in the start and end fields based on the parameters
					$('.modal').modal('show');

				},//select end  
				eventClick : function(event, arg) {
					console.log("일정등록 이벤트 삭제");
					console.log(arg.event);
					if (confirm("일정을 삭제하시겠습니까?")) {
						arg.event.remove();
					}
				},
				editable : true,
				dayMaxEvents : true,
			});
			calendar.render();
		});

		//일정 추가
		function newEvent() {
				var cal_title = document.getElementById('cal_title').value;
				var starts = document.getElementById('starts').value;
				var ends = document.getElementById('ends').value;
				var allday = document.getElementById('allday').value;
				
				
				
				// hide modal
				//$('.modal').modal('hide');

				$.ajax({
					url : "/calendar/new",
					type : "post",
					dataType : "json",
					contentType: "application/json",
					data : JSON.stringify({
						"cal_title" : cal_title,
						"starts" : starts,
						"ends" : ends,
						"allday" : allday
					}),
					success : function(data) {
						alert("등록 완료");
						$('.modal').modal('hide');
					},
					error : function() {
						alert("실패");
						$('.modal').modal('hide');
					}
				});
			
		}; //newEvent end
	</script>
</body>
</html>
