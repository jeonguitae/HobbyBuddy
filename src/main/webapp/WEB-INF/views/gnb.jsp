<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	#alarmIcon{
		text-align: center;
		background-color: yellow;
		border: 1px solid green;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 100px;
		height: 20px;
		display:inline;
	}
	
	.noAlarmList{
		padding: 20px 10px;
		display: none;
		text-align: center;
		background-color: gray;
		border: 1px solid red;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 300px;
		height: 20px;	
	}
	
	
	#profileIcon{
		text-align: center;
		background-color: yellowgreen;
		border: 1px solid green;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 100px;
		height: 20px;
		display:inline;
	}
	.panel{
		padding: 20px 10px;
		display: none;
		text-align: center;
		background-color: yellowgreen;
		border: 1px solid green;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 100px;
		height: 20px;
	}
	.panel2{
		padding: 20px 10px;
		display: none;
		text-align: center;
		background-color: yellowgreen;
		border: 1px solid green;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 100px;
		height: 20px;
	}
	.panel3{
		padding: 20px 10px;
		display: none;
		text-align: center;
		background-color: yellowgreen;
		border: 1px solid green;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 100px;
		height: 20px;
	}
	
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	접속중인 ID : ${sessionScope.loginId} <br/>
	<input type="button" value="하비버디" onclick="location.href='./'"/>
	<input type="button" value="취미 모임" onclick="location.href='glist.go'"/>
	<input type="button" value="프로필" onclick="location.href='profile.go'"/>
	<input type="button" value="랜덤 매칭" onclick="location.href='randomList.go'"/>
	<input type="button" value="익명 매칭" onclick="location.href='noNameList.go'"/>
	<input type="button" value="자유 게시판" onclick="location.href='flist.go'"/>
	<input type="button" value="고객센터" onclick="location.href='qboard.go'"/>
	
	<div id="alarmIcon">알림</div>
	<c:if test="${alarmList.size() == 0}">
	<div class="noAlarmList">알림이 없습니다.</div>
	</c:if>
			
	<c:forEach items="${alarmList}" var="alarm">
		<div>
			<a href="fdetail.do?fbNo=${alarm.fbNo}">
				${alarm.sendId}님이 알림을 보냈습니다.<br/>
				${alarm.subject}
			</a>
		</div>		
	</c:forEach>
		
	
	<div id="profileIcon">프로필</div>
	<div class="panel2" onclick="location.href='login.go'">로그인</div>
	<div class="panel" onclick="location.href='logout.go'">로그아웃</div>
	<div class="panel" onclick="location.href='pwChk.go'">마이페이지</div>
	<div class="panel" onclick="location.href='myBoardList.go'">작성 글/댓글</div>
	<div class="panel">참여한 모임</div>
	<div class="panel">쪽지방</div>
	<div class="panel">즐겨찾기</div>
	<div class="panel3" onclick="location.href='admin.go'">관리자</div>
	
</body>
<script>
	var loginId = "${sessionScope.loginId}";
	var adminChk = "${sessionScope.adminChk}";
	$('#profileIcon').on('click',function(){
		if(loginId == ""){
			$('.panel2').slideToggle('slow');
		}else{
			$('.panel').slideToggle('slow');
	   }
		if(adminChk == "1" || adminChk == "true"){
			$('.panel3').slideToggle('slow');
		}
	});

</script>
</html>