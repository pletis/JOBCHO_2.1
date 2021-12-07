<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href='https://fullcalendar.io/js/fullcalendar-3.0.1/fullcalendar.min.css'
	rel='stylesheet' />
<link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'
	rel='stylesheet' />
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.42/css/bootstrap-datetimepicker.min.css' />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment-with-locales.min.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.0.1/fullcalendar.js'></script>
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.42/js/bootstrap-datetimepicker.min.js'></script>
<script>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			defaultDate : '2021-12-02',
			navLinks : true, 
			selectable : true,
			selectHelper : true,
			locale : "ko",
			select : function(start, end) {

				$('.modal').modal('show');

			},
			eventClick : function(event, element) {

				$('.modal').modal('show');
				$('.modal').find('#title').val(event.title);
				$('.modal').find('#starts').val(event.start);
				$('.modal').find('#ends').val(event.end);

			},
			editable : true,
			eventLimit : true


		});

		$("#starts, #ends").datetimepicker();


		$('#save-event').on('click', function() {
			var title = document.getElementById('title').value;
			var starts = document.getElementById('starts').value;
			var ends = document.getElementById('ends').value;
			var allday = document.getElementById('allday').value;

			var title = $('#title').val();
			if (title) {
				var eventData = {
					title : title,
					start : $('#starts').val(),
					end : $('#ends').val(),
					allday : $('#allday')
				};
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			}
			$('#calendar').fullCalendar('unselect');

			// Clear modal inputs
			$('.modal').find('input').val('');

			// hide modal
			$('.modal').modal('hide');
			
			
			//일정 추가 
			$.ajax({
				url : "/calendar/new",
				type : "post",
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify({
					"title" : title,
					"starts" : starts,
					"ends" : ends,
					"allday" : allday
				}),
				success : function(arg) {
					alert("등록 완료");
					$('.modal').modal('hide');
				},
				error : function() {
					alert("실패");
					//$('.modal').modal('hide');
				}
			});
		});

	});
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>
<body>

	<div id='calendar'></div>
	<div id='datepicker'></div>

	<div class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">일정</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-3" for="title">일정 제목</label> <input
								type="text" name="title" id="title" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-3" for="starts">시작 시간</label> <input
								type="text" name="starts" id="starts" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-3" for="ends">종료 시간</label> <input
								type="text" name="ends" id="ends" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-3" for="allday">하루 종일</label> <input
								type="text" name="allday" id="allday" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="save-event">저장</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
</html>