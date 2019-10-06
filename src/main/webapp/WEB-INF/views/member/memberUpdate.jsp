<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FESPEDIA | Update Page</title>


<!-- responsive meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- master stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<!-- Favicon -->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

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
<!-- AdminLTE Skins. Choose a skin from the css/skins
      folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">


<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style>
#main-footer {
    background: #fff;
    padding: 15px;
    color: #444;
    border-top: 1px solid #d2d6de;
}
.wrapper{
		background:  url(resources/images/userimage/E3.jpg);
}
</style>
<!-- jquery -->
<script src="resources/js/jquery-3.4.1.js"></script>
<script>

	var originalFileName = "";
	var password = "";
	
	$(function() {
		select();
		$("#imagePreview").on('change',function(){
			//미리보기함수
			previewImage(this);
			//Data 전송하기
		});
	});
	
	
	function previewImage(input){
		//이미지를 선택하면
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#image').attr('src',e.target.result) //속성 변경
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function select() {
		$.ajax({
			url : "select",
			type : "post",
			success : function(result) {
				$('#userid').val(result.userid);
				$('#username').val(result.username);
				$('#email').val(result.email);
				password = result.userpwd;
				if(result.originalFileName != null) {
					originalFileName = "resources/images/userimage/" +result.originalFileName;
				$('#image').attr("src", originalFileName);
				}
			},
			error : function() {
				alert("該当作業に失敗しました。やり直してください。");
			}
		});
	}

	
	function updateMember() {
		formcheck();
		var form = $("#updateForm")[0];
		var formData = new FormData(form);

		$.ajax({
			url:"updateMember",
			data:formData,
			type:"post",
			contentType:false,
			processData:false,
			success: function() {
				location.href ="memberPage";
			},
			error: function() {
				alert("アップデートに失敗しました。");
			}
		});
	}
	

	function formcheck() {
		var username = $('#username').val();
		var useremail = $('#email').val();
		var userpwd = $('#userpwd').val();
		var new_userpwd = $('#new_userpwd').val();
		var check_new_userpwd = $('#check_new_userpwd').val();
		var icheck = $('#icheck');
		
		//패스워드 길이 유효성
		if(userpwd.length == 0) {
			if(new_userpwd.length != 0){
				alert("現在パスワードを入力してください。");
				return false;
			}
			if(check_new_userpwd.length != 0){
				alert("現在パスワードを入力してください。");
				return false;
			}
		}
		
		if (userpwd.length != 0) {
			if (userpwd != password) {
				alert("現在パスワードと新しいパスワードが異なります。");
				return false;
			}
			if (new_userpwd.length == 0) {
				alert("新しいパスワードを再び入力してください。");
				return false;
			}
			if (check_new_userpwd.length == 0) {
				alert("新しいパスワードを再び入力してください。");
				return false;
			}
			if (new_userpwd != check_new_userpwd) {
				alert("パスワードが間違っています。 もう一度入力してください。");
				$('#check_new_userpwd').focus();
				return false;
			}
			if(userpwd.length<3||userpwd.length>10){
				alert("パスワードが間違っています。 もう一度入力してください。");
				return false;
			}
			if(new_userpwd.length<3||new_userpwd.length>10){
				alert("パスワードが間違っています。 もう一度入力してください。");
				return false;
			}
			if(check_new_userpwd.length<3||check_new_userpwd.length>10){
				alert("パスワードが間違っています。 もう一度入力してください。");
				return false;
			}
		}
		return true;
	};
</script>
</head>
<body class="wrapper">
<body class="hold-transition register-page">

	<!--Start Preloader -->
	<div class="preloader"></div>
	<!--End Preloader -->

		

		<!--Sticky Header-->
		
	<!--End Main Header -->

	<div class="register-box">
		<div class="register-logo">
			<h1>
				<a href="/festival"><b>FES</b>PEDIA</a>
			</h1>
		</div>

		<div class="register-box-body">
			<p class="login-box-msg">Update a Member Information</p>

			<form action="updateMember" id="updateForm" method="post" enctype="multipart/form-data">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="userid" name="userid"
						readonly="readonly"> <span
						class="glyphicon glyphicon-ok form-control-feedback" id="ok"></span>
				</div>
				
				<div class="form-group has-feedback">
					<input type="email" class="form-control" name="email" id="email">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="userpwd"
						id="userpwd" placeholder="現在のパスワード"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="new_userpwd"
						id="new_userpwd" placeholder="新しいパスワード"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="check_new_userpwd"
						placeholder="新しいパスワード確認"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div>
					<input type="file" id="imagePreview" name="uploadFileName" value="사진첨부"
						accept="image/png,image/jpg,image/gif,image/jpeg"> 
						<img id="image" src="images/userimage/ico_login.png">
				</div>

				<div class="row">
					<div class="col-xs-8"></div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button id="update"
							class="btn btn-primary btn-block btn-flat" onclick="updateMember()">修正</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->


	


	<script src="js/jquery.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.fancybox.js"></script>
	<script src="js/owl.js"></script>
	<script src="js/wow.js"></script>
	<script src="js/jquery.countTo.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/appear.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/isotope.js"></script>
	<script src="js/bxslider.js"></script>
	<script src="js/validate.js"></script>

	<!-- Custom script -->
	<script src="js/custom.js"></script>
	<!-- jQuery 3 -->
<!-- 	<script src="bower_components/jquery/dist/jquery.min.js"></script> -->
	<!-- Bootstrap 3.3.7 -->
<!-- 	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script> -->
	<!-- iCheck -->
<!-- 	<script src="plugins/iCheck/icheck.min.js"></script> -->
	<!-- bootstrap datepicker -->
	

</body>
</body>
</html>
