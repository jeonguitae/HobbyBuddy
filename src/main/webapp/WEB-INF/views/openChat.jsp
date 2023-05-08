<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table[class="memlist"]{
     	float: left;
     	border: 1px, solid, black;
	}
	
	table[class="chatting"]{
		border: 1px, solid, black;
		width: 400px;
		height: 250px;
		max-width: 450px;
     	position: absolute;
     	top : 10%;
     	left : 30%;
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

			<table class="chatting">
				<colgroup>
					<col width="30%"/>
					<col width="50%"/>
					<col width="20%"/>
				</colgroup>
				<c:forEach items="${listmsg}" var="chat">
					<tr>
						<td>${chat.id}</td>
						<td>${chat.chatting}</td>
						<td>${chat.chattime}</td>
					</tr>
				</c:forEach>
				<tr>
					<td>
						<form action="sendmsg.do" method="post">
							<input type="text" name="gidx" value="" hidden/>
							<input type="text" name="id" value="${sessionScope.loginId}" hidden/>
							<input type="text" name="msg" value=""/>
							<button class="send">전송</button>
						</form>	
					</td>
				</tr>		
			</table>
			
</body>
<script>
var $gidx = $('td[class="gidx"]').html();
console.log($gidx);

$('button[class="send"]').click(function(){
	$('input[name="gidx"]').val($gidx);
});

</script>
</html>