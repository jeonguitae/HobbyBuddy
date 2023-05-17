<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table.chatting {
	  border-collapse: collapse;
	  width: 100%;
	}

	table.chatting tr {
	  border-bottom: 1px solid #eee;
	}
	
	table.chatting tr:last-child {
	  border-bottom: none;
	}
	
	table.chatting td {
	  padding: 10px;
	}
	
	table.chatting td:nth-child(1) {
	  font-size: 14px;
	  font-weight: bold;
	  width: 30%;
	}
	
	table.chatting td:nth-child(2) {
	  font-size: 14px;
	  width: 50%;
	}
	
	table.chatting td:nth-child(3) {
	  font-size: 12px;
	  color: #999;
	  text-align: right;
	  width: 20%;
	}
	
	
	div.chatting {
	  background-color: #f2f2f2;
	  border: 1px solid #ddd;
	  border-radius: 5px;
	  padding: 10px;
	  margin-bottom: 10px;
	  max-height: 400px;
	  overflow-y: scroll;
	}
	
	
	textarea[name="msg"] {
	  border: none;
	  width: calc(100% - 1250px);
	  height: 40px;
	  left: 10px;
	  resize: none;
	  padding: 10px;
	  font-size: 14px;
	  border-radius: 20px;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	  margin-right: 10px;
	  position: absolute;
	  margin-left: 430px;
	}
	
	button.send {
	  border: none;
	  background-color: #0088ff;
	  color: white;
	  width: 80px;
	  height: 40px;
	  border-radius: 20px;
	  font-size: 14px;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	  cursor: pointer;
	  position: absolute;
	  margin-left: 400px;
	}
	
	button.join {
	  border: none;
	  background-color: #0088ff;
	  color: white;
	  width: 60px;
	  height: 60px;
	  border-radius: 20px;
	  font-size: 14px;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	  cursor: pointer;
	}
	
	button.send:hover {
	  background-color: #005eff;
	}
	
	table.memlist {
	  border-collapse: collapse; /* 셀 경계선 제거 */
	  width: 20%; /* 전체 너비 */
	  margin-bottom: 20px; /* 하단 여백 */
	}
	
	table.memlist thead {
	  background-color: #f5f5f5; /* 배경색 */
	  font-weight: bold; /* 글자 굵기 */
	}
	
	table.memlist tbody {
	  background-color: #fff; /* 배경색 */
	}
	
	table.memlist th,
	table.memlist td {
	  border: 1px solid #ddd; /* 셀 경계선 스타일 */
	  padding: 8px; /* 셀 내부 여백 */
	}
	
	table.memlist th[hidden],
	table.memlist td[hidden] {
	  display: none; /* 숨김 처리 */
	}
	
	table.sglist {
	  border-collapse: collapse; /* 셀 경계선 제거 */
	  width: 15%; /* 전체 너비 */
	  margin-bottom: 20px; /* 하단 여백 */
	}
	
	table.sglist thead {
	  background-color: #f5f5f5; /* 배경색 */
	  font-weight: bold; /* 글자 굵기 */
	}
	
	table.sglist tbody {
	  background-color: #fff; /* 배경색 */
	}
	
	table.sglist th,
	table.sglist td {
	  border: 1px solid #ddd; /* 셀 경계선 스타일 */
	  padding: 8px; /* 셀 내부 여백 */
	}
	
	table.sglist th[hidden],
	table.sglist td[hidden] {
	  display: none; /* 숨김 처리 */
	}
	table.sglist td:nth-child(1) {
	  font-size: 14px;
	  font-weight: bold;
	  width: 30%;
	}
	
	table.sglist td:nth-child(2) {
	  font-size: 14px;
	  width: 20%;
	}
	
	table.sglist td:nth-child(3) {
	  font-size: 12px;
	  color: #999;
	  text-align: right;
	  width: 20%;
	}
	table.sglist td:nth-child(4) {
	  font-size: 14px;
	  font-weight: bold;
	  width: 10%;
	}
	
	table.sglist td:nth-child(5) {
	  font-size: 14px;
	  width: 20%;
	}
	
	table[class="memlist"] {
	  top: 300px;
	  right: 0px;
	  width: 15%;
	  position: absolute;
	  margin-right: 10%;
	  margin-top: 0%;
	}
	
	table[class="sglist"] {
	  top: 350px;
	  left: 0;
	  width: 50%;
	  position: absolute;
	  margin-left: 18%;
	  margin-top: 20%;
	}
	
	textraea[name="msg"]{
		left :10px;
	}
	
</style>
</head>
<jsp:include page="gnb.jsp"/>
<body>	
	<div class="chatting" style="overflow:scroll; width:80%; height:400px; scroll-behavior: smooth;" id="chatting">
		<table class="chatting">
			<%-- <c:forEach items="${listmsg}" var="chat"> --%>
				<tbody id="clist">
					
				</tbody>
			<%-- </c:forEach> --%>
		</table>
	</div>
	
	<form action="sendmsg.do" method="post">
		<input type="text" name="id" value="${sessionScope.loginId}" hidden/>
		<textarea name="msg" onkeydown="sendMsgOnEnter(event)"></textarea>
		<button class="send">전송</button>
	</form>	
		
	<table class="memlist">
		<thead>
			<tr>
				<th hidden>방 번호</th>
				<th>참가중인 아이디</th>
			</tr>
		</thead>
		
		<tbody id="memlist">
			<c:forEach items="${list}" var="bbs">
				<tr>
					<td class="gidx" hidden>${bbs.gidx}</td>
					<th class="id">${bbs.id}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<table class="sglist">
		<thead>
			<tr>
				<th hidden>방 번호</th>
				<th colspan="6">소모임 리스트
					
				</th>
			</tr>
			
			<tr>
				<th>제목</th>
				<th>지역</th>
				<th>인원 수</th>
				<th>참가</th>
				<th>참가인원</th>
			</tr>
		</thead>
		
		<tbody id="sglist">
	
		</tbody>
	</table>	
</body>
<script>
	
	var msg = "${msg}";
	if(msg != ""){
	   alert(msg);
	}
	
	function sendMsgOnEnter(event) {
		  if (event.keyCode === 13) { // Enter key code is 13
		    event.preventDefault(); // Prevent default enter key behavior (new line)
		    document.querySelector('button.send').click(); // Click send button
	  }
	}
	var gidx = "${sessionScope.gidx}";
	
	clist();
	sglist();
	
	$(document).ready(function () {
	    setInterval(function () {
	        clist();
	        sglist();
	    }, 500);
	});
	
	function clist(){
	    $.ajax({
	        type:'get',
	        url:'clist.ajax',
	        data:{},
	        dataType:'json',
	        success:function(data){
	            clistDraw(data.clist);
	        },
	        error:function(e){
	            console.log(e);
	        }
	    }); 
	}
	
	function clistDraw(clist){
	    var content = '';
	    clist.forEach(function(item,index){
	        content += '<tr>'
	        content += '<td>' + item.id + '</td>'
	        content += '<td>' + item.chatting + '</td>'
	        content += '<td>' + item.chattime + '</td>'
	        content += '</tr>'
	    });

	    var clist = document.getElementById("clist");
	    clist.scrollTop = clist.scrollHeight;
	    
	    $('#clist').empty();
	    $('#clist').append(content);
	}
	
	function sglist(){
	    $.ajax({
	        type:'get',
	        url:'sglist.ajax',
	        data:{},
	        dataType:'json',
	        success:function(data){
	            sglistDraw(data.sglist);
	        },
	        error:function(e){
	            console.log(e);
	        }
	    }); 
	}
	
	function sglistDraw(sglist){
	    var content = '';
	    sglist.forEach(function(item,index){
	        content += '<tr>'
	        content += '<td>' + item.sgsubject + '</td>'
	        content += '<td>' + item.area + '</td>'
	        content += '<td>' + item.maxmem + '</td>'
	        content += '<td><button onclick="location.href=\'sgjoin.do?sidx=' + item.sidx + '\'">참가</button></td>';
	        content += '<td><button onclick="location.href=\'sgjoinlist.go?sidx=' + item.sidx + '\'">참가인원</button></td>';
	        content += '</tr>'
	    });
	    $('#sglist').empty();
	    $('#sglist').append(content);
	}
</script>
</html>