<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Wiscon || Responsive HTML 5 Template</title>
    
    <!-- responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- For IE -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- master stylesheet -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <link rel="icon" href="images/favicon.png" type="image/x-icon">
    
    <!-- <link href="css/paging.css" rel="stylesheet" type="text/css" media="all"> -->

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
}
#div_icontext {
	display: flex;
	justify-content: flex-end;
	width: 83%;
}
#icontext {
	padding: 1.5%;
	padding-rigth: 2px;
	padding-left: 2px;
	font-family: 'Robtoto', sans-serif;
	font-size: 30px;
	color: #fa334f;
}
</style>

</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/jquery.js"></script>
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
		printAll();

		$("searchBtn").on('click', function() {
			page = 0;
			setPage();		
	})
})
		
	 function printAll() {
		
		$.ajax({
			type:'GET',
			url : 'printAlladminListVO',
			dataType: 'json',
			success : output,
			error: function() {
				alert("リストを読み込めませんでした。");
			}
		})
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
			printAll();
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
			var s = new Date(item.startEvent);
	    	var start = s.getFullYear() + "-" + ("00" + (s.getMonth() + 1)).slice(-2) + "-" + ("00" + s.getDate()).slice(-2);
			var end="";
	    if(item.endEvent!=null||item.endEvent!=""){	
	    	var e = new Date(item.endEvent);
	    	end = e.getFullYear() + "-" + ("00" + (e.getMonth() + 1)).slice(-2) + "-" + ("00" + e.getDate()).slice(-2);
	    }
	    if(item.endEvent==null||item.endEvent==""){
			item.endEvent=" ";
			end = item.endEvent;
		}
			if(index>=startPageGroup && index<endPageGroup) {
				context += "<tr><td class='srial'>"+item.mainBoardNum+"</td>";
				context += "<td class='Session'><a href=AdminlistDetailGO?admin_mainBoardNum="+item.admin_mainBoardNum+">"+item.title+"</a></td>";
				context += "<td class='Session'>"+item.userid+"</td>";
				context += "<td class='Session'>"+start+"~"+end+"</td>";
				context += "<td class='Session'>"+item.datacheck+"</td></tr>";
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
				nav += '<li class="page-item"><a class="page-link" href="#'+i+'" data-value ="'+i+'"><strong>'+i+'</strong></a></li>';
			} else {
				nav += '<li class="page-item"><a class="page-link" href="#'+i+'" data-value ="'+i+'">'+i+'</a></li>';
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
		var result33 = document.getElementById("searchHidden");
		if(result22=="startEvent"){
			result11.setAttribute("type", "date");
			result33.setAttribute("type", "date");
			$("#insertmark").append("~");
		}
		if(result22!="startEvent"){
			result11.setAttribute("type", "text");
			result33.setAttribute("type", "hidden");
			$("#insertmark").empty();
		}
	}
		
	function selectOne() {
		var searchItem = $("#searchItem").val();
		var searchKeyword = $("#searchKeyword").val();
		var endEvent = $("#searchHidden").val();
		if(searchItem=="startEvent"){
		var a = $("#searchKeyword").val().split("-");
		var b = $("#searchHidden").val().split("-");
			if(a>b){
				alert("検索する期間を間違えて入力しました。");
				$("#searchKeyword").val("");
				$("#searchHidden").val("");
				return false;
			}
		}

		if(searchItem=="hashSearch"){
			$('#hash').append("<span>"+searchKeyword+"<button id='xbtn' value="+searchKeyword+">X</button></span>");
			selectHashtag(searchKeyword);
			return false;
		} 
		
		$.ajax({
			type:'POST',
			url : 'AdminListSelectOne',					
			data: {'searchItem':searchItem,'searchKeyword':searchKeyword,'endEvent':endEvent},
			dataType: 'json',
			success : output1,
			error: function(request,status,error) {
				alert("リストを読み込めませんでした。");
			}
		})
	}
	
	   var hashtag1 = "";
	
	function selectHashtag(searchKeyword){
	    hashtag1 += searchKeyword+",";
	    $('#xbtn').click(function (){
	    	hashtag1.replace(/searchKeyword/gi, '');
		});
		$.ajax({
			type:'POST',
			url : 'selectHashtag',
			data : { 'hashtag' : hashtag1 },
			success : output1,
			error: function() {
				alert("リストを読み込めませんでした。");
			}
		})
	}

	function change(){
		page=1;
	}
</script>
</head>
<body>

    
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
							
						<c:if test="${sessionScope.adminid == null}" >
							<li><a href="registermember">Sign Up</a></li>
							<li><a href="loginForm">Sign in</a></li>
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
                    <div class="logo"><a href="/festival"><img src="images/logo.png" alt="" title=""></a></div>
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
								<li class="dropdown"><a href="/festival">Home</a></li>
								<li class="dropdown"><a href="#">List</a>
									<ul>
										<li><a href="listForm">List</a></li>									
									</ul></li>
								<li class="dropdown"><a href="#">Calendar</a>
									<ul>
										<li><a href="calendar">Calendar</a></li>
									</ul></li>
								<li class="dropdown"><a href="#">Map</a>
									<ul>
										<li><a href="#">Map</a></li>
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
                <a href="festival" class="img-responsive"><img src="images/logo.png" alt="" title=""></a>
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
								<li class="dropdown"><a href="/festival">Home</a></li>
								<li class="dropdown"><a href="#">List</a>
									<ul>
										<li><a href="listForm">List</a></li>
									</ul></li>
								<li class="dropdown"><a href="#">Calendar</a>
									<ul>
										<li><a href="calendar">Calendar</a></li>
									</ul></li>
								<li class="dropdown"><a href="#">Map</a>
									<ul>
										<li><a href="#">Map</a></li>
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
<section class="page-title" style="background: url(resources/images/userimage/등축제.jpg);">
    <div class="container">
        <div class="title-text text-center">
           	<h3>「管理者用」祭り掲示板</h3>
            <ul>
                <li><a href="festival">home</a></li>
                <li>/</li>
                <li><a href="adminListPage">AdminListPage</a></li>
            </ul>
        </div>                
    </div>
</section>
<!-- End Page Title-->
		
		
		<!--End Schedule Section-->
<section class="schedule-section" id="schedule-tab">
	<div id="div_icontext">
<!-- 	<h4><a href="adminListPage">AdminListPage</a></h4> -->
		<a href="adminBulPage"><h4 id="icontext"><b>To&nbspAdminBulPage</b></h4></a>
<!-- 		<h4 id="icontext"><b>投稿する</b></h4> -->
<!-- 		<a href="insertFestival"><img src="listImages/write.png" title="投稿"></a> -->

	</div>
	<br>
    <div class="container">
          <div class="schedule-area">
      		<div class="schedule-content clearfix">
			            <div class="inner-box  table-responsive">      
					<div id="hash"></div>
					<table>
					
					<tr><td>
					<select name="searchItem" id="searchItem" onchange="searchDate(this)">
					<option value="title" <c:if test="${'title'==searchItem}">selected</c:if>>
					タイトル
					</option>
					<option value="startEvent"<c:if test="${'startEvent'==searchItem}">selected</c:if>>
					期間
					</option>
					<option value="datacheck" <c:if test="${'datacheck'==searchItem}">selected</c:if>>
					DATACHECK
					</option>
					</select>
					</td>
					<td><input type="text" name="searchKeyword" id="searchKeyword" onchange="change()"></td>
					<td id="insertmark"></td>
					<td><input type="hidden" name="endEvent" id="searchHidden">
					<input type="button" value="検索" id="searchOne" onclick='selectOne()'>
					</td></tr>
 					 </table>
			            <div class="inner-box  table-responsive"> 
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="srial">#</th>
                                    <th class="session">タイトル</th>
                                    <th class="time">USERID</th>
                                    <th class="speakers">期間</th>
                                    <th class="venue">DATACHECK</th>
                                </tr>
                            </thead>
                            <tbody id="list" class="table table-hover"></tbody> 
                           
                          </table>
                         </div> 
                       
                    </div>
                </div>
            </div>
            <nav class="pagination"></nav>
           </div>
       </div>
</section>
<!--End Schedule Section-->

<!--Contact Info-->
<section class="contact-info">
    <div class="container">
        <div class="info-area">
            <div class="row">
                <div class="col-xl-4 col-md-6 col-sm-12">
                    <div class="contact-info-item-one">
                        <div class="icon-box">
                            <i class="flaticon-placeholder"></i>
                        </div>
                        <div class="text">
                            <p>184 Collins Street West <br>Victoria, United States, 8007</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-sm-12">
                    <div class="contact-info-item-one">
                        <div class="icon-box">
                            <i class="flaticon-phone-call"></i>
                        </div>
                        <div class="text">
                            <p>(1800) 123 4567 <br>(1800) 123 4568</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-sm-12">
                    <div class="contact-info-item-one">
                        <div class="icon-box">
                            <i class="flaticon-e-mail-envelope"></i>
                        </div>
                        <div class="text">
                            <p>
                                <a href="#">info@wiscon.com</a>
                                <a href="#">support@wiscon.com</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--Footer Bottom Section-->
<section class="footer-bottom">
    <div class="container">
        <div class="copyright-text text-center">
            Copyright &copy; <a href="#">Wiscon</a> 2019. All Rights Reserved
        </div>
    </div>
</section>
<!--End Footer Bottom Section-->


<!--Scroll to top-->
<div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-angle-up"></span></div>



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

<!-- </div> -->
</body>
</html>