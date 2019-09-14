<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FESPEDIA | Registration Page</title>

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
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="plugins/iCheck/square/blue.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet"
	href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
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
	#userid{
		width: 65%;
		display: inline-block;
	}
	#ok{
		left: 55%;
	}
	#idcheck{
		width: 34%;
		display: inline-block;
	}
</style>
<!-- jquery -->
<script src="resources/js/jquery-3.4.1.js"></script>
<script>
$(function() {
	$("#idcheck").on('click', register);
	$('#submit').on('click', formcheck);
});

function register(){
	var userid = $('#userid').val();
		
	if(userid.length == 0) {
		alert("IDを入力してください。");
		return false;
	}
	if(userid.length < 3 || userid.length > 10) {
		alert("IDは3～10字以内で入力してください。");
		return false;
	}

	$.ajax({
		data : {userid : userid},
		url : "idcheck",
		success : function(data) {
			if(data == '0') {
				alert("このIDは利用できます。");
				document.getElementById("submit").removeAttribute("disabled");
			} else if(data == '1') {
				alert("このIDは利用できません。他のIDを指定してください。");
			}
		},
		error : function(data) {
			alert("error : "+error);
		}
	});
};

function formcheck(){
	var username = $('#username').val();
	var useremail = $('#useremail').val();
	var userpwd = $('#userpwd').val();
	var check_userpwd = $('#check_userpwd').val();
	var icheck = $('#icheck');
	
	if(username.length == 0){
		alert("お名前を入力してください。");
		return false;
	}
	if(useremail.length == 0){
		alert("メールアドレスを入力してください。");
		return false;
	}
	if(userpwd.length == 0){
		alert("パスワードを入力してください。");
		return false;
	}
	if(check_userpwd.length == 0){
		alert("パスワードを再び入力してください。");
		return false;
	}
	if(userpwd != check_userpwd){
		alert("パスワードが間違っています。 もう一度入力してください。");
		$("#check_userpwd").focus();
		return false;
	}
	if($('input:checkbox[id="checkbox"]:checked').length < 1){
		alert("利用約款をチェックしてください。");
		return false;
	}
	return true; 
};
</script>
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<h1><a href="/festival"><b>FES</b>PEDIA</a></h1>
		</div>

		<div class="register-box-body">
			<p class="login-box-msg">Register a new membership</p>

			<form action="registermember" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="ユーザID 3~10字"> <span
						class="glyphicon glyphicon-ok form-control-feedback" id="ok"></span>
					<button type="button" id="idcheck" class="btn btn-primary btn-block btn-flat">重複チェック</button>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="username" id="username" placeholder="お名前">
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="email" class="form-control" name="useremail" id="useremail" placeholder="メールアドレス">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="userpwd" id="userpwd" placeholder="パスワード">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="check_userpwd" placeholder="パスワード確認"> 
					<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck" id="icheck">
							<label> <input type="checkbox" id="checkbox"> I agree to the <a href="#">terms</a>
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" id="submit" disabled="disabled" class="btn btn-primary btn-block btn-flat">登録</button>
					</div>
					<!-- /.col -->
				</div>
			</form>


			<a href="loginForm" class="text-center">I already have a membership</a>
		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery 3 -->
	<script src="bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="plugins/iCheck/icheck.min.js"></script>
	<!-- bootstrap datepicker -->
	<script
		src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' /* optional */
			});
			//Date picker
			$('#datepicker').datepicker({
				autoclose : true
			})
		});
	</script>
</body>
</html>
