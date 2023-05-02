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
	<input type="button" value="하비버디" onclick="location.href='./'"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="취미 모임" onclick="location.href='glist.go'"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="프로필" onclick="location.href='.profile.go'"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	<input type="button" value="랜덤 매칭" onclick="location.href='random.go'"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="자유 게시판" onclick="location.href='flist.go'"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	<input type="button" value="고객센터" onclick="location.href='qboard.go'"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div id="alarmIcon">알림</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<div id="profileIcon">프로필</div>
	<div class="panel2" onclick="location.href='login.go'">로그인</div>
	<div class="panel" onclick="location.href='logout.go'">로그아웃</div>
	<div class="panel">마이페이지</div>
	<div class="panel">작성 글/댓글</div>
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
		if(adminChk == "1"){
			$('.panel3').slideToggle('slow');
		}
		
	});

</script>
</html>