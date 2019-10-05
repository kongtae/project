<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>FESPEDIA | リスト</title>
    <!-- search -->
    <!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400" rel="stylesheet" />
    <link href="resources/css/main.css" rel="stylesheet" /> -->
    
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
.s132 {
  position: absolute;
  display: flex;
  justify-content: end;
  align-items: baseline;
  padding-left: 1%;
  font-family: 'Poppins', sans-serif;
}
.s132 form {
  width: 100%;
  max-width: 380px;
}
.s132 form .inner-form {
  display: flex;
  width: 100%;
  justify-content: space-between;
  align-items: baseline;
}
.s132 form .inner-form .input-field input {
  border: 0;
  display: inline-block;
  padding: 10px 32px;
  font-size: 16px;
  color: #6c757d;
}
#searchItem {
    border: 0;
    font-family: 'Robtoto', sans-serif;
    font-size: 17px;
    color: #fa334f;
    padding-top: 10%;
    padding-bottom: 12%;
}
#searchOne {
	border-radius: 3%;
    background: #fa334f;
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
	font-family: 'Robtoto', sans-serif;
	font-size: 29px;
	color: #fa334f;
}
#hash {
   padding-left: 1.7%;
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
         url : 'printAll',
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
    
      
   function tagSet(result, startPageGroup, endPageGroup)   {
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
            context += "<td class='Session'><a href=listDetailGO?mainBoardNum="+item.mainBoardNum+">"+item.title+"</a></td>";
            context += "<td class='Session'>"+item.country+"</td>";
            context += "<td class='Session'>"+start+"~"+end+"</td>";
            context += "<td class='Session'>"+item.adress+"</td></tr>";
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
         $('#hash').append("<span class='span'>"+searchKeyword+"<button id='xbtn' value="+searchKeyword+">X</button></span>");
         selectHashtag(searchKeyword);
         return false;
      } 
      
      $.ajax({
         type:'POST',
         url : 'selectOne',               
         data: {'searchItem':searchItem,'searchKeyword':searchKeyword,'endEvent':endEvent},
         dataType: 'json',
         success : output1,
         error: function(request,status,error) {
            alert("リストを読み込めませんでした。");
            //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
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
         success : function(result){
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
            context += "<tr><td class='srial'>"+item.mainBoardNum+"</td>";
            context += "<td class='Session'><a href=listDetailGO?mainBoardNum="+item.mainBoardNum+">"+item.title+"</a></td>";
            context += "<td class='Session'>"+item.country+"</td>";
            context += "<td class='Session'>"+start+"~"+end+"</td>";
            context += "<td class='Session'>"+item.adress+"</td></tr>";
            })
            $("#list").html(context);
         },
         error: function() {
            alert("リストを読み込めませんでした。");
         }
      })
   }
   
   function change(){
      page=1;
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
    
      
   function tagSet(result, startPageGroup, endPageGroup)   {
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
       if(item.adress==null||item.adress==""){
          item.adress=" ";
       }
         if(index>=startPageGroup && index<endPageGroup) {
            context += "<tr><td class='srial'>"+item.mainBoardNum+"</td>";
            context += "<td class='Session'><a href=listDetailGO?mainBoardNum="+item.mainBoardNum+">"+item.title+"</a></td>";
            context += "<td class='Session'>"+item.country+"</td>";
            context += "<td class='Session'>"+start+"~"+end+"</td>";
            context += "<td class='Session'>"+item.adress+"</td></tr>";
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
   var sharp = "";
   var idx = 0;
   function selectOne() {
      var searchItem = $("#searchItem").val();
      var searchKeyword = $("#searchKeyword").val();
      var endEvent = $("#searchHidden").val();
   
      if(searchItem=="hashSearch"){//해시태그 생성
         sharp =  searchKeyword;
      	$('#searchKeyword').val("");//해시태그 생성시 해시태그 입력창 지우기
		if(sharp.charAt(0) != '#') {//해시태그로 시작안하면 빠꾸
			alert("「＃」を入力してください。");
			return false;
		}
		if(sharp.charAt(1) == 1 || sharp.charAt(1) == 2 || sharp.charAt(1) == 3 || sharp.charAt(1) == 4 || sharp.charAt(1) == 5 || sharp.charAt(1) == 6 || sharp.charAt(1) == 7 || sharp.charAt(1) == 8 || sharp.charAt(1) == 9 || sharp.charAt(1) == 0 ) {
			alert("文字を先に入力してください。");
			return false;
		}
         sharp = sharp.replace("#", "");
         idx += 1;
         $('#hash').append("<span id="+sharp+">"+searchKeyword+"<button id="+idx+" value="+searchKeyword+" onclick='btnClick("+sharp+")'>X</button></span>");
         selectHashtag(searchKeyword);
         return false;
      } 
      if(searchItem!="hashSearch"){//다른 카테고리 선택시 해시태그 삭제
         $('#hash').empty();
      }
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

      
      $.ajax({
         type:'POST',
         url : 'selectOne',               
         data: {'searchItem':searchItem,'searchKeyword':searchKeyword,'endEvent':endEvent},
         dataType: 'json',
         success : output1,
         error: function() {
            alert("リストの読み込みに失敗しました。");
         }
      })
   }
   
      var hashtag1 = "";
   
   function selectHashtag(searchKeyword){
       hashtag1 += searchKeyword+",";
         hashtagPrint();
   }
   function btnClick(sharp1){
      //alert("sharp1 : "+sharp1);
      
      var key = sharp1.innerHTML;
      //alert("key : "+ key);
      var a = key.indexOf('(')+1;
      var b = key.indexOf(')');
       var key1 = key.substring(a,b); 
      var key2 = key1;
       key1 = "#"+key1+",";
       //alert("key1 : "+key1);
       //alert("key2 : "+key2);
       hashtag1 = hashtag1.replace(key1, "");
       //alert("hashtag1 : "+hashtag1);
       hashtagPrint();
       $('#'+key2).empty();
   }
   
   function hashtagPrint(){
      $.ajax({
         type:'POST',
         url : 'selectHashtag',
         data : { 'hashtag' : hashtag1 },
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
                    <div class="logo"><a href="/festival"><img src="images/fespedia.png" alt="" title=""></a></div>
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
            <h3>祭り掲示板</h3>
            <ul>
                <li><a href="festival">home</a></li>
                <li>/</li>
                <li><a href="listForm">List</a></li>
            </ul>
        </div>                
    </div>
</section>
<!-- End Page Title-->
      
      <!--End Schedule Section-->
<section class="schedule-section" id="schedule-tab">

    <div class="container">
          <div class="schedule-area">
            <div class="schedule-content clearfix">
                     <div class="inner-box  table-responsive">      
               <div id="hash"></div>
                     <div class="s132">
                        <form>
                           <div class="inner-form">
                              <div class="input-field first-wrap">
                                 <div class="input-select">
                                    <select data-trigger="" class="choices-single-defaul"
                                       name="searchItem" id="searchItem"
                                       onchange="searchDate(this)">
                                       <option value="title"
                                          <c:if test="${'title'==searchItem}">selected</c:if>>タイトル</option>
                                       <option value="country"
                                          <c:if test="${'country'==searchItem}">selected</c:if>>国家</option>
                                       <option value="startEvent"
                                          <c:if test="${'startEvent'==searchItem}">selected</c:if>>期間</option>
                                       <option value="adress"
                                          <c:if test="${'adress'==searchItem}">selected</c:if>>住所</option>
                                       <option value="hashSearch"
                                          <c:if test="${'hashSearch'==searchItem}">selected</c:if>>#HASHTAG</option>
                                    </select>
                                 </div>
                              </div>
                              <div class="input-field second-wrap">
                                 <input name="searchKeyword" id="searchKeyword"
                                    onchange="change()" type="text" class="input-field_pholder" placeholder="Enter Keywords"/>
                              </div>
                              <!-- <div id="insertmark"></div> -->
                              <div class="input-field second-wrap">
                                 <input type="hidden" name="endEvent" id="searchHidden">
                              </div>
                              <div class="input-field third-wrap">
                                 <input type="button" value="検索" id="searchOne" onclick='selectOne()'>
                              </div>
                           </div>
                        </form>
                     </div>
 
 					<div id="div_icontext">
 					<h4 id="icontext"><b>投稿する</b></h4>
 					<a href="insertFestival"><img src="listImages/write_.png" title="投稿"></a>
 					</div>
 
                     <div class="inner-box  table-responsive"> 
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="srial">#</th>
                                    <th class="session">タイトル</th>
                                    <th class="time">国家</th>
                                    <th class="speakers">期間</th>
                                    <th class="venue">住所</th>
                                </tr>
                            </thead>
                            <tbody id="list" class="table table-hover"></tbody> 
                          </table>
                         </div> 
                    </div>
                    <nav class="pagination"></nav>
                    <!-- <table>
                    <tr><td><nav class="pagination"></nav></td>
                    <td align="right" class="longterm"><a href="insertFestival"><h4 id="icontext"><b>投稿する</b></h4><img src="listImages/write_.png" title="投稿"></a>
                    </td></tr>
                    </table> -->
                    <!-- <div>
                    <nav class="pagination"></nav>
                    <div id="div_icontext">
					<a href="insertFestival"><img src="listImages/write.png" title="投稿"></a>
					</div> -->
				</div>
                </div>
           </div>
	</section>
       </div>
<!--End Schedule Section-->

<!-- Main Footer-->
<footer class="main-footer" >
    <div class="container">
        <div class="footer-area text-center">
            <div class="footer-logo">
                <figure>
                    <a href="festival"><img src="images/fespedia_w.png" alt=""></a>
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

<!-- Search script -->
<!-- <script src="js/choices.js"></script>
<script>
      const choices = new Choices('[data-trigger]',
      {
        searchEnabled: false,
        itemSelectText: '',
      });
</script> -->

</body>
</html>