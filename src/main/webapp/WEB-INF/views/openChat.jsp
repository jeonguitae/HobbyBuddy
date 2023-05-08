<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table[class="memlist"]{
     	position: relative;
     	border: 1px, solid, black;
     	left: 60%;
     	top: 17%;
	}
	
	table[class="chatting"]{
		position: relative;
		border: 1px, solid, black;
		left: 0%;
     	top: 0%;
	}
	
	form[action="sendmsg.do"]{
		position: relative;
		left: 59%%;	
	}
	
	textarea[name="msg"]{
		resize: none;
		width: 640px;
		height: 70px;
	}
	
	button[class="send"]{
		position: absolute;
		top: 1%;
		left: 53%;
		width: 62px;
		height: 70px;
	}
	
	div[class="chatting"]{
		background-color: yellowgreen;
	}
	
</style>
</head>
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
			
	<div class="chatting" style="overflow:scroll; width:710px; height:400;">
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
			<textarea name="msg"></textarea>
			<button class="send">전송</button>
		</form>		
			
</body>
<script>
var gidx = "${sessionScope.gidx}";

$(document).ready(function () {
    setInterval(function () {
    	clist();
    }, 1000);
});

clist();
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

/* var $gidx = $('td[class="gidx"]').html();
console.log($gidx);

$('button[class="send"]').click(function(){
	$('input[name="gidx"]').val($gidx);
}); */

</script>
</html>