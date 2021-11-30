<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
    <meta
      name="viewport"
      content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"
    />
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- fullcalendar CDN======================= -->
    <link
      href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
    <!-- fullcalendar 언어 CDN==================== -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
    <style>
      /* body 스타일 */
      html,
      body {
        overflow: hidden;
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px;
      }
      /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
      .fc-header-toolbar {
        padding-top: 1em;
        padding-left: 1em;
        padding-right: 1em;
      }
    </style>
    <title>공유일정</title>
  </head>
  <body style="padding: 30px">
    <!-- calendar 태그 -->
    <div id="calendar"></div>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("calendar");
        // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})

        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: "prev,next today",
            center: "title",
            right: "dayGridMonth,timeGridWeek,timeGridDay",
          },
          initialDate: "2021-11-12",
          // 초기 로딩 날짜.
          navLinks: true, // can click day/week names to navigate views
          selectable: true,
          selectMirror: true, // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
          locale: "ko",
          select: function (start, end) {
            // Display the modal.
            // You could fill in the start and end fields based on the parameters
            $(".modal").modal("show");
          },
          eventClick: function (event, element) {
            // Display the modal and set the values to the event values.
            $(".modal").modal("show");
            $(".modal").find("#title").val(event.title);
            $(".modal").find("#starts-at").val(event.start);
            $(".modal").find("#ends-at").val(event.end);
          },
          editable: true,
          eventLimit: true, // allow "more" link when too many events

          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          //events: //================ ajax데이터 불러올 부분 =====================//
        });
        $("#starts-at, #ends-at").datetimepicker();

        $("#save-event").on("click", function () {
          var title = $("#title").val();
          if (title) {
            var eventData = {
              title: title,
              start: $("#starts-at").val(),
              end: $("#ends-at").val(),
            };
            $("#calendar").fullCalendar("renderEvent", eventData, true); // stick? = true
          }
          $("#calendar").fullCalendar("unselect");

          // Clear modal inputs
          $(".modal").find("input").val("");

          // hide modal
          $(".modal").modal("hide");
        });

        calendar.render();
      });
    </script>
  </body>
</html>
