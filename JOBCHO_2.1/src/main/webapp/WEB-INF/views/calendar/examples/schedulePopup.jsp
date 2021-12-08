<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- custom -->
<link href='/resources/calendar/css/main.css' rel='stylesheet'
	type="text/css" />
<script type="text/javascript" src='/resources/calendar/js/main.js'></script>
</head>
<body>
	<div class="group" id="popupGroup">
		<div class="group-head">
			<h1 class="zTree-h1">일정 추가</h1>
		</div>
		<div class="group-body">
			<form id="scheduleData">
				
				<div class="top">
					<input class="subject" id="subject" type="text" name="subject"
						placeholder="제목을 입력해주세요">
				</div>
				<div class="domain">
					<h3 class="zTree-h3">시작</h3>
				</div>
				
				<div class="domain">
					<input class="date" id="startDate" type="text" name="startDate">
				</div>
				<div class="domain">
					<h3 class="zTree-h3">종료</h3>
				</div>
				
				<div class="domain">
					<input class="date" id="endDate" type="text" name="endDate">
				</div>
				<div class="domain">
					<h3 class="zTree-h3">메모</h3>
				</div>
				<div class="domain">
					<textarea class="memo" id="memo" rows="5" cols="20" placeholder="100글자까지 입력 가능합니다."></textarea>
				</div>
			</form>
				<button class="ok-button" type="button" onclick="click_ok();">확인</button>
		</div>
	</div>
</body>
</html>






















