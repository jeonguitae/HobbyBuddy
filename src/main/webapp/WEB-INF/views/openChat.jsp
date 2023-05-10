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
	  width: calc(60% - 70px);
	  height: 40px;
	  resize: none;
	  padding: 10px;
	  font-size: 14px;
	  border-radius: 20px;
	  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	  margin-right: 10px;
	}
	
	button.send {
	  border: none;
	  background-color: #0088ff;
	  color: white;
	  width: 60px;
	  height: 40px;
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
	
	.chatting {
	  position: relative;
	}
	
	.memlist {
	  position: absolute;
	  top: 142px;
	  right: 200px;
	}
	
</style>
</head>
<jsp:include page="gnb.jsp"/>
<body>
	<table class="memlist">
		<thead>
			<tr>
				<th hidden>방 번호</th>
				<th>참가중인 아이디</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="bbs">
				<tr>
					<td class="gidx" hidden>${bbs.gidx}</td>
					<th class="id">${bbs.id}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			
	<div class="chatting" style="overflow:scroll; width:710px; height:400; scroll-behavior: smooth;" id="chatting">
		<table class="chatting">
			<colgroup>
				<col width="30%"/>
				<col width="50%"/>
				<col width="20%"/>
			</colgroup>
				
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
		
		<form action="sgwrite.go" method="get">
			<button>소모임 생성하기</button>
		</form>	
			
</body>
<script>

	function sendMsgOnEnter(event) {
		  if (event.keyCode === 13) { // Enter key code is 13
		    event.preventDefault(); // Prevent default enter key behavior (new line)
		    document.querySelector('button.send').click(); // Click send button
	  }
	}
	var gidx = "${sessionScope.gidx}";
	
	$(document).ready(function () {
	    setInterval(function () {
	        clist();
	    }, 500);
	});
	
	function clist(){
	    $.ajax({
	        type:'get',
	        url:'clist.ajax',
	        data:{},
	        dataType:'json',
	        success:function(data){
	            listDraw(data.clist);
	        },
	        error:function(e){
	            console.log(e);
	        }
	    }); 
	}
	
	function listDraw(clist){
	    var content = '';
	    clist.forEach(function(item,index){
	        content += '<tr>'
	        content += '<td>' + item.id + '</td>'
	        content += '<td>' + item.chatting + '</td>'
	        content += '<td>' + item.chattime + '</td>'
	        content += '</tr>'
	    });
	    $('#clist').empty();
	    $('#clist').append(content);
	}
	
</script>
</html>