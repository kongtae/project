<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>FESPEDIA</title>
    <!-- responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- For IE -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- master stylesheet -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="images/f.png" type="image/x-icon">
    <link rel="icon" href="images/f.png" type="image/x-icon">
    
    <link href="https://fonts.googleapis.com/css?family=M+PLUS+1p|M+PLUS+Rounded+1c&display=swap" rel="stylesheet">
<style>
.infoboxes article {
	color: #191919;
	background-color: rgba(255, 255, 255, .65);
}
.infoboxes article:hover {
	background-color: #FFFFFF;
}
.infoboxes article .fa {
	color: #FFFFFF;
	background-color: #CF4845;
}
.s000 {
  position: absolute;
  display: flex;
  justify-content: end;
  align-items: baseline;
  padding-left: 1%;
  font-family: 'Poppins', sans-serif;
}
.s000 form {
  width: 100%;
  max-width: 380px;
}
.s000 form .inner-form {
  display: flex;
  width: 100%;
  justify-content: space-between;
  align-items: baseline;
}
.s000 form .inner-form .input-field {
  height: 68px;
}
.s000 form .inner-form .input-field input {
  border: 0;
  display: inline-block;
  padding: 10px 32px;
  font-size: 16px;
  color: #6c757d;
}
#searchItem {
    border: 0;
    font-family: 'M PLUS Rounded 1c', sans-serif;
    font-size: 17px;
    color: #fa334f;
    padding-top: 10%;
    padding-bottom: 12%;
}
#searchOne {
	border-radius: 3%;
    background: #fa334f;
    font-family: 'M PLUS Rounded 1c', sans-serif;
    color: white;
}
.inner-box {
	padding-top: 1.5%;
}
.pagination {
	display: block;
	width: 100%;
	text-align: center;
	clear: both;
}
.pagination li {
	display: inline-block;
	margin: 0 2px 0 0;
}
.pagination li:last-child {
	margin-right: 0;
}
.pagination a, .pagination strong {
	display: block;
	padding: 8px 11px;
	border: 1px solid;
	background-clip: padding-box;
	font-weight: normal;
	color: #fa334f;
	border-color: white;
}
#div_icontext {
	display: flex;
	justify-content: flex-end;
	width: 96%;
}
#icontext {
    padding-top: 0.5%;
	font-family: 'M PLUS 1p', sans-serif;
	font-size: 29px;
	color: #fa334f;
}
</style>
    
</head>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>

		var page = '';
		var countPerPage = 5;
		var pageBlock = 5;
		var pageBlockCount = '';
		var totalPageCount = '';
		var startPageGroup = '';
		var endPageGroup = '';
		var spage, epage;

		function setPage() {
			if(page == '' || page < 0){page = 1;}
			startPageGroup = ((page-1)*countPerPage);
			endPageGroup = (startPageGroup + countPerPage);
		}
		

		$(function() {
				setPage();
				boardPrintAll();

				$("searchBtn").on('click', function() {
					page = 0;
					setPage();		
			})
			$('#home1').on('click', function(){
		    	location.href = "festival";
		    });
		    $('#home2').on('click', function(){
		    	location.href = "festival";
		    });
		})
		
		function boardPrintAll() {
			
			$.ajax({
				type:'GET',
				url : 'boardPrintAll',
				dataType: 'json',
				success : output,
				error: function() {
					alert("リストの読み込みに失敗しました。");
				}
			});
		}

			 function output(result) {
				totalRecordCount = result.length;
				totalPageCount = Math.ceil(totalRecordCount / countPerPage);
				pageBlockCount = Math.ceil(page/pageBlock);
				startPageGroup = ((page-1) * countPerPage);
				endPageGroup = (startPageGroup + countPerPage);
				
				if(pageBlockCount > 1) {
					spage = (pageBlockCount-1)*pageBlock+1;
				} else {
					spage = 1;
				}
				
				if((pageBlockCount*pageBlock) >= totalPageCount){
					epage = totalPageCount;
				} else {
					epage = pageBlockCount*pageBlock;
				}
				
				navSet(totalPageCount, spage, epage);
				tagSet(result, startPageGroup, endPageGroup);
				
			   	$(".page-link").on('click',function(){
			   		if ($(this).attr("data-value") == "first"){
						page = 1;
					}else if ($(this).attr("data-value") == "end") {
						page = totalPageCount;
					}else if ($(this).attr("data-value") == "next") {
						page = parseInt(page) + 5;
						if (page>totalPageCount) {
							page=totalPageCount;
						}
					}else if ($(this).attr("data-value") =="before") {
						page = parseInt(page) - 5;
						if(page<5){
							page = 1;
						}
					}else{
						page= $(this).attr("data-value");
					}
			   		boardPrintAll();
			   	});	
			} 
			 
			 function output1(result) {
					totalRecordCount = result.length;
					totalPageCount = Math.ceil(totalRecordCount / countPerPage);
					pageBlockCount = Math.ceil(page/pageBlock)
					startPageGroup = ((page-1) * countPerPage);
					endPageGroup = (startPageGroup + countPerPage);
					
					if(pageBlockCount > 1) {
						spage = (pageBlockCount-1)*pageBlock+1;
					} else {
						spage = 1;
					}
					
					if((pageBlockCount*pageBlock) >= totalPageCount){
						epage = totalPageCount;
					} else {
						epage = pageBlockCount*pageBlock;
					}
					
					
					navSet(totalPageCount, spage, epage);
					tagSet(result, startPageGroup, endPageGroup);
					
				   	$(".page-link").on('click',function(){
				   		if ($(this).attr("data-value") == "first"){
							page = 1;
						}else if ($(this).attr("data-value") == "end") {
							page = totalPageCount;
						}else if ($(this).attr("data-value") == "next") {
							page = parseInt(page) + 5;
							if (page>totalPageCount) {
								page=totalPageCount;
							}
						}else if ($(this).attr("data-value") =="before") {
							page = parseInt(page) - 5;
							if(page<5){
								page = 1;
							}
						}else{
							page= $(this).attr("data-value");
						}
				   		selectOne();
				   	});	
				   	
				}  
			 
				
			function tagSet(result, startPageGroup, endPageGroup)	{
				var context = '';
				$.each(result,function(index,item){
					var s = new Date(item.inputdate);
			    	var inputDate = s.getFullYear() + "-" + ("00" + (s.getMonth() + 1)).slice(-2) + "-" + ("00" + s.getDate()).slice(-2);
					if(index>=startPageGroup && index<endPageGroup) {
						context += "<tr><td class='srial'>"+item.bul_boardnum+"</td>";
						context += "<td class='Session'><a href=BoardDetailGO?bul_boardnum="+item.bul_boardnum+">"+item.title+"</a></td>";
						context += "<td class='Session'>"+item.userid+"</td>";
						context += "<td class='Session'>"+inputDate+"</td>"; 
						context += "<td class='Session'>"+item.hit+"</td></tr>";
					}
				});
				$("#list").html(context);
				

			} 
			
			function navSet(totalPageCount){
				var nav = '';
				nav += '<li class="page-item">';
				nav += '<a class="page-link" href="#" data-value ="first" aria-label="Previous">';
				nav += '<span aria-hidden="true">&laquo;</span>';
				nav += '<span class="sr-only">Previous</span>';
				nav += '</a>';
				nav += '</li>';
				nav += '<li class="page-item">';
				nav += '<a class="page-link" href="#" data-value ="before" aria-label="Previous">';
				nav += '<span aria-hidden="true">previous</span>';
				nav += '<span class="sr-only">Previous</span>';
				nav += '</a>';
				nav += '</li>';
				
				for (var i = spage; i <= epage; i ++) {
					if(i == page){
						nav += '<li class="page-item"><a class="page-link" style="padding: 1px; border-color: red;" href="#'+i+'" data-value ="'+i+'"><strong>'+i+'</strong></a></li>';
					} else {
						nav += '<li class="page-item"><a class="page-link" style="padding: 1px; border-color: red;" href="#'+i+'" data-value ="'+i+'">'+i+'</a></li>';
					}
				}
				       
				nav += '<li class="page-item">';
				nav += '<a class="page-link" href="#" data-value ="next" aria-label="Next">';
				nav += '<span aria-hidden="true">next</span>';
				nav += '<span class="sr-only">Next</span>';
				nav += '</a>';
				nav += '</li>';
				nav += '<li class="page-item">';
				nav += '<a class="page-link" href="#" data-value ="end" aria-label="Next">';
				nav += '<span aria-hidden="true">&raquo;</span>';
				nav += '<span class="sr-only">Next</span>';
				nav += '</a>';
				nav += '</li>';
				    
				$(".pagination").html(nav);	
			}
			
			function searchDate(value){
				var result00="startEvent";
				
				var result11 = document.getElementById("searchKeyword");
				var result22 = document.getElementById("searchItem").value;
				if(result22=="inputdate"){
					result11.setAttribute("type", "date");
				}
				if(result22!="inputdate"){
					result11.setAttribute("type", "text");
				}
			}
				
			function selectOne() {
				var searchItem = $("#searchItem").val();
				var searchKeyword = $("#searchKeyword").val();
				
				$.ajax({
					type:'POST',
					url : 'BoardSelectOne',					
					data: {'searchItem':searchItem,'searchKeyword':searchKeyword},
					dataType: 'json',
					success : output1,
					error: function() {
						alert("リストの読み込みに失敗しました。");
					}
				})
			}
			
			function change(){
				page=1;
			}
	

</script>
</head>
<body>
<c:choose>
	<c:when test="${deleteResult == true}">
		<script>alert("削除に成功しました。");</script>
	</c:when>
	<c:when test="${deleteResult == false}">
		<script>alert("削除に失敗しました。");</script>
	</c:when>
</c:choose>
    
<div class="boxed_wrapper">


<!--Start Preloader -->
<div class="preloader"></div>
<!--End Preloader -->

<!-- Main Header-->
<header class="main-header">
    
    <!--Header Top-->
    <div class="header-top">
        <div class="container">
            <div class="clearfix">
                <!--Top Left-->
                <div class="top-left">
                    <ul class="header-info-list">
                       			<li><span class="icon fa fa-envelope"></span><strong>Email</strong>
									SC.IT@MASTER.COM</li>
								<li><span class="icon fa fa-map-marker"></span><strong>Location</strong>
									Trade Center COEX, SEOUL 135-731 KOREA</li>
                    </ul>
                </div>
                <!--Top Right-->
					<div class="top-right">
					<!--Social Box-->
					<ul class="social-box">
						<c:if test="${sessionScope.loginid == null}" >
									<c:if test="${sessionScope.adminid == null}" >
									<li><a href="registermember">Sign Up</a></li>
									<li><a href="loginForm">Sign in</a></li>
									</c:if>
								</c:if>
								
								<c:if test="${sessionScope.loginid != null}">
									<li><a href="memberPage">UserPage</a></li>
									<li><a href="logout">Logout</a></li>
								</c:if>
								
								<c:if test="${sessionScope.adminid !=null}">
									<li><a href="adminListPage">AdminListPage</a></li>
									<li><a href="adminBulPage">AdminBulPage</a></li>
									<li><a href="logout">Logout</a></li>
								</c:if>
					</ul>
                </div>
            </div>
        </div>
    </div>
    
    <!--Header-Upper-->
    <div class="header-upper">
        <div class="container">
            <div class="clearfix">
                
                <div class="float-left logo-box">
                    <div class="logo"><a href="festival"><img src="images/fespedia.png" alt="" title=""></a></div>
                </div>
                
                <div class="nav-outer clearfix">
                
                    <!-- Main Menu -->
                    <nav class="main-menu navbar-expand-md">
                        <div class="navbar-header">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div class="navbar-collapse collapse clearfix" id="navbarSupportedContent">
							<ul class="navigation clearfix">
								<li class="dropdown" id="home1"><a href="">Home</a></li>
								<li class="dropdown"><a href="listForm">List</a>
									<ul>
										<li><a href="listForm">List</a></li>									
									</ul></li>
								<li class="dropdown"><a href="calendar">Calendar</a>
									<ul>
										<li><a href="calendar">Calendar</a></li>
									</ul></li>
								<li class="dropdown"><a href="map">Map</a>
									<ul>
										<li><a href="map">Map</a></li>
									</ul></li>
								<li class="dropdown"><a href="boardList">Board</a>
									<ul>
										<li><a href="boardList">Board</a></li>
									</ul></li>
							</ul>
                        </div>
                        
                    </nav>
                    
					<!--Button Box-->
					<div class="button-box">
						<a href="searchFestival" class="theme-btn btn-style-one">Search Festival</a>
					</div>
                    
                    
                </div>
               
            </div>
        </div>
    </div>
    <!--End Header Upper-->
    
    <!--Sticky Header-->
    <div class="sticky-header stricky">
        <div class="container clearfix">
            <!--Logo-->
            <div class="logo float-left">
                <a href="festival" class="img-responsive"><img src="images/fespedia.png" alt="" title=""></a>
            </div>
            
            <!--Right Col-->
            <div class="right-col float-right">
                <!-- Main Menu -->
                <nav class="main-menu navbar-expand-md">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    <div class="navbar-collapse collapse clearfix" id="navbarSupportedContent1">
							<ul class="navigation clearfix">
								<li class="dropdown" id="home2"><a href="">Home</a></li>
								<li class="dropdown"><a href="listForm">List</a>
									<ul>
										<li><a href="listForm">List</a></li>										
									</ul></li>
								<li class="dropdown"><a href="calendar">Calendar</a>
									<ul>
										<li><a href="calendar">Calendar</a></li>
									</ul></li>
								<li class="dropdown"><a href="map">Map</a>
									<ul>
										<li><a href="map">Map</a></li>
									</ul></li>
								<li class="dropdown"><a href="boardList">Board</a>
									<ul>
										<li><a href="boardList">Board</a></li>
									</ul></li>
							</ul>
                    </div>
                </nav><!-- Main Menu End-->
            </div>
            
        </div>
    </div>
    <!--End Sticky Header-->

</header>
<!--End Main Header -->


<!-- Page Title-->
<section class="page-title" style="background: url(resources/images/userimage/환호.jpg);">
    <div class="container">
        <div class="title-text text-center">
            <h3>会員掲示板</h3>
            <ul>
                <li><a href="festival">home</a></li>
                <li>/</li>
                <li><a href="boardList">Board</a></li>
            </ul>
        </div>                
    </div>
</section>
<!-- End Page Title-->


<!--Schedule Section-->
<section class="schedule-section" id="schedule-tab">
    <div class="container">
          <div class="schedule-area">
      		<div class="schedule-content clearfix">
			    <div class="inner-box  table-responsive">      					
					<div class="s000">
					<form>
					<div class="inner-form">
					<div class="input-field first-wrap">
					<div class="input-select">
					<select name="searchItem" class="choices-single-defaul" id="searchItem" onchange="searchDate(this)">
					<option value="title" <c:if test="${'title'==searchItem}">selected</c:if>>
						タイトル
					</option>
					<option value="userid"<c:if test="${'userid'==searchItem}">selected</c:if>>
						ユーザー名
					</option>
					<option value="inputdate"<c:if test="${'inputdate'==searchItem}">selected</c:if>>
						投稿日
					</option>
					</select>
					</div>
					</div>
					<div class="input-field second-wrap">
					<input type="text" name="searchKeyword" id="searchKeyword" placeholder="Enter Keywords" onchange="change()">
					<!-- <div id="insertmark"></div> -->
					<input type="hidden" name="endEvent" id="searchHidden">
					</div>
					<div class="input-field third-wrap">
					<input type="button" value="検索" id="searchOne" onclick='selectOne()'>
					</div>
					</div>
					</form>
					</div>
					
 					<div id="div_icontext">
		<c:if test="${sessionScope.loginid != null}">
		<h4 id="icontext"><b>投稿する</b></h4>
		<a href="Boardinsert"><img src="listImages/write_.png" title="投稿"></a>
		</c:if>
		<c:if test="${sessionScope.adminid != null}">
		<h4 id="icontext"><b>投稿する</b></h4>
		<a href="Boardinsert"><img src="listImages/write_.png" title="投稿"></a>
		</c:if>
	</div>
			        
			        <div class="inner-box  table-responsive"> 
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="srial">#</th>
                                    <th class="session">タイトル</th>
                                    <th class="time">ユーザー名</th>
                                    <th class="speakers">投稿日</th>
                                    <th class="venue">HIT</th>
                                </tr>
                            </thead>
                            <tbody id="list" class="table table-hover"></tbody> 
                           
                          </table>
                         </div> 
                       <nav class="pagination"></nav>
                    </div>
                </div>
            </div>
           </div>
       </div>
</section>
<!--End Schedule Section-->

		<!-- Main Footer-->
		<footer class="main-footer"
			>
			<div class="container">
				<div class="footer-area text-center">
					<div class="footer-logo">
						<figure>
						<c:if test="${sessionScope.adminid != null}">
							<a href="tourAPI"><img src="images/fespedia_w.png" alt=""></a>
						</c:if>
						<c:if test="${sessionScope.adminid == null}">
							<a href=""><img src="images/fespedia_w.png" alt=""></a>
						</c:if>
						</figure>
					</div>
            <ul class="footer-menu">
                <li><a href="">Home</a></li>
                <li><a href="listForm">List</a></li>
                <li><a href="calendar">Calendar</a></li>
                <li><a href="map">Map</a></li>
                <li><a href="boardList">Board</a></li>
				<li><a href="searchFestival">Search Festival</a></li>
            </ul>
					<ul class="social-links">
						<li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
						<li><a href="https://twitter.com/"><i class="fab fa-twitter"></i></a></li>
						<li><a href="https://vine.co/"><i class="fab fa-vine"></i></a></li>
						<li><a href="https://kr.linkedin.com/"><i class="fab fa-linkedin-in"></i></a></li>
						<li><a href="https://www.pinterest.co.kr/"><i class="fab fa-pinterest"></i></a></li>
						<li><a href="https://www.instagram.com"><i class="fab fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</footer>
		<!--End Main Footer-->

		<!--Footer Bottom Section-->
		<section class="footer-bottom">
			<div class="container">
				<div class="copyright-text text-center">
					Copyright &copy; <a href="#">FESPEDIA</a> 2019. All Rights
					Reserved
				</div>
			</div>
		</section>
		<!--End Footer Bottom Section-->

		<!--Scroll to top-->
		<div class="scroll-to-top scroll-to-target" data-target="html">
			<span class="fa fa-angle-up"></span>
		</div>

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


</div>
</body>
</html>
