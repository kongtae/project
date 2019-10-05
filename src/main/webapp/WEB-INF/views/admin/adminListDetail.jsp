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
     <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #googleMap {
        height: 500px;
        width: 770px;
      }
    </style>
    <script src="js/jquery.js"></script>
 <script>
 
    $(function () {
       imagePrint();
       
    });
    
    var originalFileName = "";
    var mainb = ${vo.mainBoardNum};
    var imageData = {'mainBoardNum' : mainb};
    function imagePrint() {
          $.ajax({
            url : "imagePrint",
            type : "post",
            data : imageData,
            dataType: 'json',
            success : function(result) {
               if(result != null) {
                  $.each(result,function(index,item){
                     originalFileName = "resources/images/userimage/" +item;
                   $('#image-box').append("<input type='image' src='"+originalFileName+"'><br>"); 
                  })
               }
            },
            error : function() {
               alert("リストを読み込めませんでした。");
            }
         });
      }
    
    
	function ListRecovery() {
		var mainBoardNum =${vo.mainBoardNum};
		var admin_mainBoardNum =${vo.admin_mainBoardNum};
		var datacheck ="${vo.datacheck}";
// 		alert(mainBoardNum);
		if(datacheck=="feinsert")
		{	
			alert("복구할게 없습니다.");
			return false;
		}
		else if(datacheck=="Recovery")
		{
			alert("이미 복구된 내용입니다.")
			return false;
		}
		$.ajax({
			url:"ListRecovery",
			type:"post",
			data : {mainBoardNum : mainBoardNum,
				admin_mainBoardNum : admin_mainBoardNum,
				datacheck : datacheck},
			success:function(result){
				location.href="adminListPage";
			}
// 			},
// 			error{
// 				alert("실패");
// 			}
		});
	}
	
	
	function AdminDeleteFestival() {
		var mainBoardNum = ${vo.mainBoardNum};
		var admin_mainBoardNum = ${vo.admin_mainBoardNum};
		var datacheck ="${vo.datacheck}";
// 		alert(mainBoardNum);

		$.ajax({
			url:"AdminDeleteList",
			type:"post",
			data : {mainBoardNum : mainBoardNum,
					admin_mainBoardNum : admin_mainBoardNum
					},
			success:function(result){
				location.href="adminListPage";
			}
// 			},
// 			error{
// 				alert("실패");
// 			}
		});
	}
	
// 	updateFestivalGO?mainBoardNum=${vo.mainBoardNum}";
    function DeleteFestival() {
           if(confirm("삭제하시겠습니까?")){
          location.href="AdmindeleteFestival?adminboardnum=${vo.mainBoardNum}";
          }
    }
     //댓글 작성시 유효성검사
     function replywrite() {
      var replytext = document.getElementById("replytext");
      var name = document.getElementById("name").value;
      if(replytext.value.length==0)
      {
         alert("コメントの内容を入力してください。");
         return false;   /*리턴이 없으면 아무것도 입력이 되지않을때 바로 서브밋이 된다*/
      }
      if(name.length=="")
      {
         alert("ログインをお先にしてください。.");
         return false;
      }
         document.getElementById("replywrite").submit();
      }
        //화면 새로고침
      function refreshMemList(){
         location.reload();
      }
      
      //댓글 삭제
        function replyDelete(replynum)
        {
           $.ajax({
              url:'replyDelete',
              type:'get',
              data:
              {
                 mainboardnum : document.getElementById("mainboardnum").value,
                 replynum : replynum
              },
              success:function(){
                 refreshMemList();
              },
              error: function(){
              }
              
           });
        }
        
        //댓글 수정
           function replymodify(replynum,text) {
           var offset = $("#updatebtn").offset();
           $("html, body").animate({scrollTop:offset.top},400)
         document.getElementById("replytext").value=text;
         document.getElementById("replysubmit").value="Send Message";
         document.getElementById("replysubmit").onclick=function(){
            var updatext = document.getElementById("replytext").value;
            location.href="replyUpdate?replynum="+replynum
                  +"&mainboardnum=${vo.mainBoardNum}&replytext="+updatext;
         }
         var message="end";
         var result00="startEvent";
         var result33 = document.getElementById("searchHidden");
         if(message=="end"){
            result33.setAttribute("type", "reset");
         }
         $("input[type='reset']").on('click',
         function() {
            result33.setAttribute("type", "hidden");
            refreshMemList();
         })
      }

        //일단은 위시리스트 추가하기
        function insertwish()
          {
           var mainBoardNum = document.getElementById("mainboardnum").value
//            var dislike = 
             $.ajax({
               url:'insertwish',
               type:'get',
             data:
               {
                mainBoardNum : document.getElementById("mainboardnum").value
                },
                success:function(data){

                },
                error: function(){
                }
                
             });
          }
        //좋아요 취소
        function deletetwish()
        {
           $.ajax({
               url:'deletetwish',
               type:'get',
             data:
               {
                mainBoardNum : document.getElementById("mainboardnum").value
                },
                success:function(data){
//                    refreshMemList();
               if(data.mainBoardNum!=null)
                  {
                     alert("削除します。")
                  }
                },
                error: function(){
                }
                
             });
          }
        loginneed
        
   function loginneed()
     {
        alert("「いいね」をするには、ログインをお先にしてください。");
        return false;
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
                    <div class="logo"><a href="/festival"><img src="images/fespedia.png" alt="" title="ホームへ"></a></div>
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
<section class="page-title" style="background: url(images/background/page-title-4.jpg);">
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


<!--Schedule Details-->
<section class="schedule-details">
    <div class="container">
        <div class="row">
            <div class="col-xl-4 col-md-12 col-sm-12">
                <div class="shedule-left-side">
                    <div class="text-title">
                        <h6>祭りの写真</h6>
                           <c:if test="${sessionScope.loginid == null }">
                       <a href="" ><img src="images/dislike.png" id="loginne" onclick="loginneed()" /></a>
                      ${wishlist}                 
                           </c:if>
                           <c:if test="${sessionScope.loginid != null}">
                               <c:if test="${like==null}">
                             <a href="" ><img src="images/dislike.png" id="dislike" onclick="insertwish()" /></a>
                                ${wishlist}
                                </c:if>
                             <c:if test="${like!=null}">
                             <a href=""><img src="images/like.png" id="like" onclick="deletetwish()"/></a>
                                ${wishlist}
                                </c:if>
                           </c:if>
                    </div> 
                   
                    <div id="preview">
                    </div>
                    <div class="image-box" id="image-box">
        <!--           <input type="" src="" id="preview0">
                    <br>
                    <input type="image" src="" id="preview1">
                    <br>
                    <input type="image" src="" id="preview2"> -->
               </div>
                </div>
            </div>

            
            
            <div class="col-xl-8 col-md-12 col-sm-12">
                <div class="shedule-right-side">
                    <div class="image-box">
           <!--              <figure>
                            <img src="images/resources/schedule-10.jpg" alt="">
                        </figure> -->
                        
                         <div class="event-details">
                            <div>
                         <h1><b>祭りの詳細情報</b></h1>
                   


                            </div>
                             
                            <c:if test="${sessionScope.adminid !=null}">
                               <div align="right">
                               <input type="button" value="復旧" onclick="ListRecovery()">
                               <input type="button" value="削除" onclick="AdminDeleteFestival()">
<!--                                <input type="button" value="削除" onclick="DeleteFestival()"> -->
                     </div>
                     </c:if>                          
                          <div class="inner-box  table-responsive">

                        <table class="table table-hover">
                           <tr>
                           <td><b>分類</b></td><td><b>詳細情報</b></td>
                           </tr>
                            <tr>
                              <td>ユーザー名</td><td>${vo.userid}</td>
                           </tr>
                           <tr>
                              <td>タイトル</td><td>${vo.title}</td>
                           </tr>
                           <tr>
                              <td>内容</td><td>${vo.festival_intro}</td>
                           </tr>
                     <tr>
                              <td>期間</td><td>${vo.startEvent}~${vo.endEvent}</td>
                           </tr>
                           <tr>
                              <td>国家</td><td>${vo.country}</td>
                           </tr>
                     <tr>
                              <td>住所</td><td>${vo.adress}</td>
                           </tr>
                        </table>
                        </div>
                        </div>
       <!--                  <h5>Business Conference - World Wealth Creation 2018.</h5>
                        <p>Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.</p>
                        <p>Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.</p>
        -->            
                  </div>
                    <div class="event-details">
                        <h5>Event Details</h5>
                        <div class="inner-box  table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="start">Start</th>
                                        <th class="end">End</th>
                                        <th class="rate">Rate</th>
                                        <th class="categories">Categories</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="start">Jan 5 , 2018  9 Am</td>
                                        <td class="end">Jan 8 , 2018  4 Pm</td>
                                        <td class="rate">$23.00</td>
                                        <td class="categories">Business Events</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                        <div>
                        <input type="hidden" id="address" value="${vo.adress}">
                       <input id="submit" type="button" value="Geocode">
                        </div>
                    <div id="googleMap"></div>
            </div>
        </div>                
    </div>
</section>
<!--End Schedule Details-->
<section>
   <div class="blog-left-title">
                    <h6>Comments ${replycount}</h6>
                </div>
      
               
        <table class="reply">
        <c:forEach items="${replylist}" var="replylist">
         <tr>
            <td rowspan="1">
             <div class="blog-comment-area">
                    <div class="image-box">
                        <figure>
<!--                             <img src="images/testimonials/4.png" alt=""> -->
                     <c:if test="${replylist.originalFileName == null}">
                        <img src="images/userimage/login_icon.png" alt="">
                     </c:if>
                     <c:if test="${replylist.originalFileName != null}">
                             <img src="images/userimage/${replylist.originalFileName}" alt="">
<!--                                              여기가 사용자가 등록한 사진 들어올 곳 -->
<%--                              ${replylist.originalFileName} --%>
                     </c:if>
                        </figure>
<%--                         <h6>${vo.userid}</h6> --%>
                    </div>
<!--                     <div class="image-content"> -->
            </td>
            <td rowspan="1">
            &nbsp   &nbsp ${replylist.replytext}
            </td>
            <td rowspan="1">
            &nbsp   &nbsp ${replylist.inputdate}
            </td>
         <c:if test="${sessionScope.loginid == replylist.userid}">
            <td>
               &nbsp&nbsp<input type="button" value="삭제" onclick="replyDelete('${replylist.replynum}')">
               <input type="button" value="수정" onclick="replymodify('${replylist.replynum}','${replylist.replytext }')">
            </td>
         </c:if>
      </tr>
      </c:forEach>
   </table>
<!--                         <div class="link-btn" id="updatebtn"> -->
<!--                             <a href="#" ><i class="fas fa-reply"></i>Replay</a> -->
<!--                         </div> -->
                    </div>
                </div>
                <div class="blog-left-title">
                    <h6>Post Comments</h6>
                </div>
                <form name="contact_form" class="default-form post-comment" action="replywrite" id="replywrite" method="post">
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <input type="text" name="name" value="${sessionScope.loginid }" id="name" readonly="readonly">
                            </div>
                  <input type="hidden" name="mainboardnum" id="mainboardnum" value="${vo.mainBoardNum}">
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <textarea name="replytext" id="replytext" class="form-control textarea required" placeholder="Your Message"></textarea>
                               
                            </div>
                            <div class="form-group bottom">
                                <button type="button" id="replysubmit" onclick="replywrite()" value="Send Message" class="theme-btn btn-style-one">Send Message</button>
                                 <input type="hidden" class="theme-btn btn-style-one" name="endEvent" id="searchHidden" value="reset" >
                            </div>
                        </div>
                    </div>
                </form>
                <div>
                
   
</div>

</section>



<!-- Main Footer-->
<footer class="main-footer">
    <div class="container">
        <div class="footer-area text-center">
            <div class="footer-logo">
                <figure>
                    <a href="festival"><img src="images/logo-2.png" alt=""></a>
                </figure>
            </div>
            <ul class="footer-menu">
                <li><a href="festival">Home</a></li>
                <li><a href="listForm">List</a></li>
                <li><a href="calendar">Calendar</a></li>
                <li><a href="map">Map</a></li>
                <li><a href="boardList">Board</a></li>
				<li><a href="searchFestival">Search Festival</a></li>
            </ul>
            <ul class="social-links">
                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                <li><a href="#"><i class="fab fa-vine"></i></a></li>
                <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                <li><a href="#"><i class="fab fa-pinterest"></i></a></li>
                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
            </ul>
        </div>            
    </div>
</footer>
<!--End Main Footer-->


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

    <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('googleMap'), {
          zoom: 18,
          center: {lat: -34.397, lng: 150.644}
        });
        var geocoder = new google.maps.Geocoder();
            geocodeAddress(geocoder, map);
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert("住所を正しく入力してください。");
          }
        });
      }
    </script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6uy9uWZtnlBIODo1H__1TNEJoPTQNXsk&callback=initMap">
    </script>
</div>
</body>
</html>