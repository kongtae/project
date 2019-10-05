<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Log in</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="bower_components/fullcalendar/dist/fullcalendar.min.css">
  <link rel="stylesheet" href="bower_components/fullcalendar/dist/fullcalendar.print.min.css" media="print">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style>
	.col-xs-8{
		width: 64%;
	}
	#submit{
		width: 110%;
	}
	.wrapper{
		background:  url(resources/images/userimage/turkeyBalloon.jpg);
	}
	#title{
		color: white;	
	}
</style>
<!-- jquery -->
<script src="resources/js/jquery-3.4.1.js"></script>
<script>

	function signOn() {
	
		var userid = $('#userid').val();
		var userpwd = $('#userpwd').val();
		
		if(userid.length == 0) {
			alert("IDを入力してください。");
			return false;
		}
		else if(userpwd.length == 0){
			alert("パスワードを入力してください。");
			return false;
		}	
	
		$.ajax({
		url:"loginForm1",
		enctype: 'multipart/form-data',
		data:$("#loginForm").serialize(),
		type:"post",
		success: function(data) {
			alert("ログインに成功しました。");
			location.href="festival";
		},
		error: function() {
			alert("ログインに失敗しました。");
			}
		});
	} 
	

</script>
</head>
<body class="wrapper">
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <h1><a href="/festival" id="title"><b>FES</b>PEDIA</a></h1>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>
    
    <input type="hidden" value="${result}" id="result">
    <form action="loginForm" method="post" id="loginForm">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="ID" name="userid" id="userid">
        <span class="glyphicon glyphicon-ok form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control"  name="userpwd" id="userpwd" placeholder="パスワード">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <!-- <label>
              <input type="checkbox"> Remember Me
            </label> -->
          </div>
        	<c:if test="${result == false}"><p style="color: #fa334f;">IDとパスワードが異なります。<p></c:if>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="button" class="btn btn-primary btn-block btn-flat" id="submit" onclick="signOn()">サインイン</button>
        </div>
        <!-- /.col -->
      </div>
    </form>


    <a href="FindPassword">I forgot my password</a><br>
    <a href="registermember" class="text-center">Register a new membership</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</body>
</html>
