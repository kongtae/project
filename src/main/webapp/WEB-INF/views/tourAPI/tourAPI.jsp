<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#tt {
	color: blue;
}
</style>
<script src="js/jquery.js"></script>
<script>
	$(function(){
		tourAPIselect();
	})

		var tour = [];
		var flag = 0;
		
	function tourAPIselect(){
		 $.ajax({
			url : 'tourAPIselect',
			type : 'get',
			dataType : 'json',
			success : function(data) {
				console.log(data);
				if(flag != 0){
					$('#btn').append("<tr><th id='tt' colspan='2'><input type='button' value='축제 값 등록' onclick='tourAPIinsert()'></th></tr>"); 
					return false;
				}
				var myItem = data.response.body.items.item;
				console.log(myItem.length);
				for (var i = 0; myItem.length; i++) {
					
					var title = myItem[i].title;
					var adress = myItem[i].addr1;
					var originalFileName = myItem[i].firstimage;
					var startEvent = myItem[i].eventstartdate;
					var endEvent = myItem[i].eventenddate;
					
					tour.push({title: title, adress: adress, originalFileName: originalFileName, surround_place: startEvent, saveFileName: endEvent});
					var output = '';
					output += "<tr><th id='tt' colspan='2'><h2>"+(i+1)+"번째 축제</h2></th></tr>";
					output += "<tr><th>제목</th><td>"+myItem[i].title+"</td></tr>";
					//output += "<tr><th>콘텐츠아이디</th><td>"+myItem[i].contentid+"</td></tr>";
					output += "<tr><th>주소</th><td>"+myItem[i].addr1+"</td></tr>";
					output += "<tr><th>사진</th><td><img src="+myItem[i].firstimage+"></td></tr>";
					//output += "<tr><th>연락처</th><td>"+myItem[i].tel+"</td></tr>";
					output += "<tr><th>날짜</th><td>"+myItem[i].eventstartdate+"-"+myItem[i].eventenddate+"</td></tr>";
					$('#textarea').append(output); 
					
					if(i == myItem.length-1){
						flag = 1;
						return tourAPIselect();
					}
				}
				
					//tourAPIinsert(tour);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			
			}
		});  
		}
	 
	 function tourAPIinsert(){
		 alert(tour.length);
		 $.ajax({
			url: "tourAPIinsert",
			type: "post",
			contentType : "application/json; charset=utf-8",
			data: JSON.stringify(tour),
			success: function(){
				alert("登録を完了しました。");
				
			},
			error: function(){
				alert("登録が失敗しました。");				
			}
		 });
	 }
	 
</script>
</head>
<body>
	<!-- <form action="PublicData.do" method="get">
		<input type="submit" value="데이터보기" />
		<button id="myButton1">축제 보기</button>
	</form> -->
	<div>
		<div>
			<input type="date">
			
			<span id="btn"></span>
		</div>
		<table id="textarea" border='1'></table>
	</div>
</body>
</html>