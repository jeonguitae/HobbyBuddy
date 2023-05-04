<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
		<div class="memlist">
			<table>
				<thead>
					<tr>
						<th>아이디</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${list}" var="bbs">
						<tr>
							<td>${bbs.gidx}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		
		<div class="chatting">
				<table>
				<tr id="list">
				
				</tr>
				<tr>
					<td>
						<input type="text" id="msg" value=""/>
						<button class="sendmsg">전송</button>
					</td>
				</tr>
				</table>
				
		</div>
</body>
<script>
$('button[class="sendmsg"]').click(function(){
	var loginId = "${sessionScope.loginId}";
	var gidx = "";
	var $msg = $('input[id="msg"]').val();
	
	console.log(loginId, $msg, gidx);
	
	$.ajax({
		type:'post',
		url:'sendmsg.ajax',
		data:{
			id: loginId,
			msg: $msg
		},
		dataType:'json',
		success:function(data){},
		error:function(e){}
	});
});

/* function realTime(){
	setInterval(function(){
		list();
	},1000);
}

list();
function list(){
	$.ajax({
		type:'post',
		url:'opclist.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			}else{
				listDraw(data.list);
			}
		},
		error:function(e){
			console.log(e);
		}
	});	
} */

</script>
</html>