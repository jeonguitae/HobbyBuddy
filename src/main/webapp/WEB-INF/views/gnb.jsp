<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	#profileIcon{
		text-align: center;
		background-color: yellowgreen;
		border: 1px solid green;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 150px;
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
		width: 150px;
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
		width: 150px;
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
		width: 150px;
		height: 20px;
	}
	
	#alarmIcon{
		text-align: center;
		background-color: green;
		border: 1px solid green;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 100px;
		height: 20px;
		display:inline;
	}
	
	.beforeAlarm{
		padding: 20px 10px;
		display: none;
		text-align: center;
		background-color: gray;
		border: 1px solid gray;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 300px;
		height: 20px;	
	}

	.alarmList{
		padding: 20px 10px;
		display: none;
		text-align: center;
		background-color: gray;
		border: 1px solid red;
		padding: 5px;
		margin: 2px;
		cursor: pointer;
		width: 565px;
		height: 20px;	
	}
	
	
	
	
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${sessionScope.loginId} 님 안녕하세요 ? / 새로운 알림의 갯수는 <span id="alarmCount2"> ${sessionScope.alarmCount}</span> 개 입니다.<br/>
	<input type="button" value="하비버디" onclick="location.href='./'"/>
	<input type="button" value="취미 모임" onclick="location.href='glist.go'"/>
	<input type="button" value="프로필" onclick="location.href='profile.go'"/>
	<input type="button" value="랜덤 매칭" onclick="location.href='randomList.go'"/>
	<input type="button" value="익명 매칭" onclick="location.href='noNameList.go'"/>
	<input type="button" value="자유 게시판" onclick="location.href='flist.go'"/>
	<input type="button" value="고객센터" onclick="location.href='qboard.go'"/>
	
	<div id="alarmIcon">알림</div>
	<div class="beforeAlarm"><input type="button" value="모든 알림 보기" onclick="location.href='beforeAlarm.go'"/></div>
	<input type="hidden"/>
	
	<span id="alarmList" class="alarmList"></span>
	 		
	
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
	var alarmCount = "${sessionScope.alarmCount}";
	
	$('#profileIcon').on('click',function(){
		if(loginId == ""){
			$('.panel2').slideToggle('slow');
		}else{
			$('.panel').slideToggle('slow');
	   }
		if(adminChk == "1" || adminChk == "true"){
			$('.panel3').slideToggle('slow');
		}		
	}


	
	
	$('#alarmIcon').on('click',function(){		
		$('.beforeAlarm').slideToggle('slow');
		$('.alarmList').slideToggle('slow');				
	});
	
	
	if(alarmCount != 0){
		$('#alarmIcon').css('background-color', 'red');
	}
	
	alarmList();
	function alarmList(){
		console.log("loginId : " + loginId);
		$.ajax({
			type:'get',
			url:'alarmList.ajax',
			data:{},
			dataType:'json',
			success:function(data){
				console.log("data : " + data.alarmList);
				alarmListDraw(data.alarmList);			
			},
			error:function(e){
				console.log(e);
			}
		});	
	}	
	
	function alarmListDraw(alarmList){
		console.log("alarmList : " + alarmList);
		var content = '';
		alarmList.forEach(function(item,index){
			content += '<div class="alarmList">';
			content += '<input type="checkbox" value="'+item.alarm_num+'"/>';
			content+= item.alarm_title + " / " + item.alarm_content;
			content += '</div>';
			console.log(item.alarm_content);
		});
		
		$('#alarmList').empty();
		$('#alarmList').append(content);
	}
	
	// 읽음 처리
	function alarmListRead(){
		var checkArr = [];
		$('input[type="checkbox"]:checked').each(function(idx,item){		
			//checkbox 에 value 를 지정하지 않으면 기본값을 on 으로 스스로 지정한다.
			if($(this).val()!='on'){
				console.log(idx,$(this).val());
				checkArr.push($(this).val());
			}	
		});
		console.log(checkArr);			
		$.ajax({
			type:'get',
			url:'alarmListRead.ajax',
			data:{'alarmListRead':checkArr},
			dataType:'json',
			success:function(data){
				console.log(data);
				if(data.success){
					location.reload();
				}
			},
			error:function(e){
				console.log(e);
			}		
		});		
	}

</script>
</html>