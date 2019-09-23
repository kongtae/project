<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Calendar</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="bower_components/Ionicons/css/ionicons.min.css">
<!-- fullCalendar -->
<link rel="stylesheet"
	href="bower_components/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet"
	href="bower_components/fullcalendar/dist/fullcalendar.print.min.css"
	media="print">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- /.col -->
			<div class="col-md-9">
				<div class="box box-primary">
					<div class="box-body no-padding">
						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /. box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->

	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 2.4.18
		</div>
		<strong>Copyright &copy; 2014-2019 <a
			href="https://adminlte.io">AdminLTE</a>.
		</strong> All rights reserved.
	</footer>


	<!-- jQuery 3 -->
	<script src="bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
	<!-- Slimscroll -->
	<script
		src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- fullCalendar -->
	<script src="bower_components/moment/moment.js"></script>
	<script src="bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
	<!-- Page specific script -->
	<script>
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()
	  $('#calendar').fullCalendar({
		      header    : {
		        left  : 'prev,next today',
		        center: 'title',
		        right : 'month,agendaWeek,agendaDay'
		      },
		      buttonText: {
		        today: 'today',
		        month: 'month',
		        week : 'week',
		        day  : 'day'
		      },	
      		      //랜덤 기본 이벤트
      		    /*   events    : [
      		    	   
      		    	  
      		        {
      		          title          : 'Birthday Party',
      		          start          : new Date(y, m, d + 1, 19, 0),
      		          end            : new Date(y, m, d + 1, 22, 30),
      		          allDay         : false,
      		          backgroundColor: '#00a65a', //Success (green)
      		          borderColor    : '#00a65a' //Success (green)
      		        },
      		        {
      		          title          : 'Click for Google',
      		          start          : new Date(y, m, 28),
      		          end            : new Date(y, m, 29),
      		          url            : 'http://google.com/',
      		          backgroundColor: '#3c8dbc', //Primary (light-blue)
      		          borderColor    : '#3c8dbc' //Primary (light-blue)
      		        }  
      		      ]
      		    }) */

     events: function (start, end, timezone, callback) {
         $.ajax({
          url: 'selectCalendar',
          type: "post",
          success: function(data){
              var events = [];
              $.each(data, function(i, obj) {
            	  var colors = ['#dd1e2f', '#06a2cb', '#218559', '#d0c6b1', 
            		  '#88001b', '#ff7f27', '#3f48cc', '#b97a56', '#00a8f3', 
            		  '#0ed145', '#563c86', '#f3008e', '#e34a39',
            		  '#241984', '#57d2b7', '#595d91', '#f4050e', '#fbc2d4'];
					var color = colors[Math.floor(Math.random() * colors.length)];
					var url = "listDetailGO?mainBoardNum="+obj.mainBoardNum;
            	 
               events.push({title: obj.title, start: obj.startEvent, end: obj.endEvent, url: url, color: color});
           });
             	console.log(events);
              callback(events);
          },
          error : function() {
      			alert("失敗");
      		}
         });
     }
    });
    
    setTimeout(function(){
    	$('.fc-time').empty(); 
    	}, 500);  
    	
    	$(document).ready(function(){
    		$('.fc-time').empty();
    		});
</script>
</body>
</html>
