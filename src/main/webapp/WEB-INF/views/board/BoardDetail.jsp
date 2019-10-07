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
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #googleMap {
        height: 500px;
        width: 770px;
      }
      .info_ {
         position: absolute;
         padding-left: 5%;
      }
      .buttonS{
      background-color: #3c8dbc;
       border-color: #367fa9;
       margin-right: 5px;
       display: white;
       margin-bottom: 0;
       font-weight: 400;
       text-align: center;
       white-space: nowrap;
       -ms-touch-action: manipulation;
       touch-action: manipulation;
       cursor: pointer;
       background-image: none;
       border: 1px solid transparent;
       padding: 6px 12px;
       font-family: 'M PLUS Rounded 1c', sans-serif;
       font-size: 17px;
       line-height: 1.42857143;
       border-radius: 4px;
       user-select: none;
       color: white;
      }
        .buttonD{
        background-color: red;
       border-color: red;
       margin-right: 5px;
       display: white;
       margin-bottom: 0;
       font-weight: 400;
       text-align: center;
       white-space: nowrap;
       -ms-touch-action: manipulation;
       touch-action: manipulation;
       cursor: pointer;
       background-image: none;
       border: 1px solid transparent;
       padding: 6px 12px;
       font-family: 'M PLUS Rounded 1c', sans-serif;
       font-size: 17px;
       line-height: 1.42857143;
       border-radius: 4px;
       user-select: none;
       color: white;
      }
      .tableSecond{
     padding: 45px 40px;
     margin-top: 55px;
     margin-bottom: 30px;
     text-align: center;
     background: #ffffff;
     border: 3px solid #eaeaea;
     font-size: 15px;
     text-align: center;
      
      
      }
  
      .comments {
         padding-left: 4%;
        padding-right: 4%;
       padding-bottom: 3%;
      }
    .pre1{
      width: 370px;
      height: auto;
   }
   </style>
    <script src="js/jquery.js"></script>
 <script>
 
 $(function () {
       imagePrint();
       $('#home1').on('click', function(){
          location.href = "festival";
       });
       $('#home2').on('click', function(){
          location.href = "festival";
       });
    });
 
    var originalFileName = "";
    var bulb = ${vo.bul_boardnum};
    var imageData = {'bul_boardnum' : bulb};
    function imagePrint() {
            $.ajax({
               url : "BoardimagePrint",
               type : "post",
               data : imageData,
               dataType: 'json',
               success : function(result) {
                  if(result != null) {
                       $.each(result,function(index,item){
                          if(item.charAt(0)=='h'){
                             originalFileName = item;
                             $('#preview').append("<input type='image' class='pre1' src='"+originalFileName+"'><br>");
                          }else if(item == null){                        
                       return false;
                          }else{
                          originalFileName = "resources/images/userimage/" +item;
                        $('#preview').append("<input type='image' class='pre1' src='"+originalFileName+"'><br>"); 
                         }
                       })  
                    }
               },
               error : function() {
               }
            });
         }
 
 
    function BoardUpdateGO() {
       location.href="boardUpdateGO?bul_boardnum=${vo.bul_boardnum}";
   }
     function BoardDelete() {
           if(confirm("削除しますか?")){
           location.href="BoardDelete?bul_boardnum=${vo.bul_boardnum}";
           }
     }
      //댓글 작성시 유효성검사
     function replywriteBoard() {
      var replytext = document.getElementById("replytext");
      var userid = document.getElementById("userid").value;
      
      if(userid.length=="")
      {
         alert("ログインをお先にしてください。");
         return false;
      }
      if(replytext.value.length==0)
      {
         alert("コメントの内容を入力してください。");
         return false;   
      }
         document.getElementById("replywriteBoard").submit();
      }
        //화면 새로고침
      function refreshMemList(){
         location.reload();
      }
      
      //댓글 삭제
        function replyDelete(replynum)
        {
           $.ajax({
              url:'replyDeleteBoard',
              type:'get',
              data:
              {
                 mainboardnum : document.getElementById("bul_boardnum").value,
                 replynum : replynum
              },
              success:function(){
                 refreshMemList();
              },
              error: function(){
                  alert("削除に失敗しました");
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
            location.href="replyUpdateBoard?replynum="+replynum
                  +"&bul_boardnum=${vo.bul_boardnum}&replytext="+updatext;
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
                    <div class="logo"><a href="#"><img src="images/fespedia.png" alt="" title="ホームへ"></a></div>
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
                        <li class="dropdown" id="home1"><a href="Home">Home</a></li>
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
                        <li class="dropdown" id="home2"><a href="#">Home</a></li>
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


<!--Schedule Details-->
<section class="schedule-details">
    <div class="container">
        <div class="row">
            <div class="col-xl-4 col-md-12 col-sm-12">
                <div class="shedule-left-side">
                    <div class="text-title" style="margin-bottom: 5%; margin-top: 26%;">
                        <h6>写真</h6>
                    </div> 
<!--                     <div class="shedule-image-box text-center" id="removeImg"> 미리보기 공간
                        <figure>
                            <img src="resources/images/schedule-9.jpg" alt="" >
                        </figure>
                    </div> -->
                    <div id="preview">
                    </div>
                     <div class="image-box" id="image-box"></div>
                </div>
            </div>
            <div class="col-xl-8 col-md-12 col-sm-12">
                <div class="shedule-right-side">
                    <div class="image-box">

                         <div class="event-details">
                            <div class="info_">
                            <h1><b>祭りの詳細情報</b></h1>
                            </div>
                            
                            <c:if test="${sessionScope.loginid == vo.userid}">
                            <div align="right">
                               <input type="button" class="buttonS" value="修正" onclick="BoardUpdateGO()">
                               <input type="button" class="buttonD" value="削除" onclick="BoardDelete()">
                     </div>
                     </c:if>   
                      <c:if test="${sessionScope.adminid !=null}">
                            <div align="right">
                               <input type="button" class="buttonS" value="修正" onclick="BoardUpdateGO()">
                               <input type="button" class="buttonD" value="削除" onclick="BoardDelete()">
                     </div>
                     </c:if>                            
                          <div class="tableSecond">
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
                              <td>内容</td><td>${vo.contents}</td>
                           </tr>
                     <tr>
                              <td>投稿日</td><td>${vo.inputdate}</td>
                           </tr>
                           <tr>
                              <td>国家</td><td>${vo.country}</td>
                           </tr>
                           <tr>
                              <td>都市</td><td>${vo.surround_place}</td>
                           </tr>
                     <tr>
                              <td>住所</td><td>${vo.adress}</td>
                           </tr>
                        </table>
                        </div>
                        </div>
                  </div>
                  
                    
                        <div>
                        <input type="hidden" id="address" value="${vo.adress}">
                       <!-- <input id="submit" type="button" value="Geocode"> -->
                        </div>
                    <div id="googleMap"></div>
            </div>
        </div>                
    </div>
    </div>
</section>
<br>

<!--End Schedule Details-->
<section class="comments">
   <div class="blog-left-title">
                    <h6>Comments ${replycount}</h6>
                </div>
      
               
        <table class="reply">
        <c:forEach items="${replylist}" var="replylist">
         <tr>
            <td rowspan="1">
             <div class="blog-comment-area">
                    <div class="image-box">
                     <c:if test="${replylist.originalFileName == null}">
                        <img src="images/userimage/ico_login.png" alt="">
                     </c:if>
                     <c:if test="${replylist.originalFileName != null}">
                             <img src="images/userimage/${replylist.originalFileName}" alt="">
                     </c:if>
                    </div>
                    </div>
            </td>
            <td rowspan="1">
                 &nbsp   &nbsp ${replylist.userid}
                 </td>
            <td rowspan="1">
            &nbsp   &nbsp ${replylist.replytext}
            </td>
            <td rowspan="1">
            &nbsp   &nbsp ${replylist.inputdate}
            </td>
         <c:if test="${sessionScope.loginid == replylist.userid}">
            <td>
               &nbsp&nbsp<input type="button" id="updatebtn" value="修正" class="buttonS" onclick="replymodify('${replylist.replynum}','${replylist.replytext }')">
               <input type="button" value="削除" class="buttonD" onclick="replyDelete('${replylist.replynum}')">
            </td>
         </c:if>
      </tr>
      </c:forEach>
   </table>
   </section>
                       
                <form name="contact_form" class="default-form post-comment" action="replywriteBoard" id="replywriteBoard" method="post">
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <input type="text" name="userid" value="${sessionScope.loginid}" id="userid" readonly="readonly">
                            </div>
                  <input type="hidden" name="bul_boardnum" id="bul_boardnum" value="${vo.bul_boardnum}">
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <textarea name="replytext" id="replytext" class="form-control textarea required" placeholder="Your Message"></textarea>
                               
                            </div>
                            <div class="form-group bottom">
                                <button type="button" id="replysubmit" onclick="replywriteBoard()" value="Send Message" class="theme-btn btn-style-one">Send Message</button>
                                 <input type="hidden" class="theme-btn btn-style-one" name="endEvent" id="searchHidden" value="reset" >
                            </div>
                        </div>
                    </div>
                </form>
</div>

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