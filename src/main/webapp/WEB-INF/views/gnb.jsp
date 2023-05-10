<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/css.css">
<style>
	
	#profileIcon{
		display:inline;
		background-color: #22c55e;
 		color: #ffffff;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
	}
	.panel{
		display: none;
		background-color: #22c55e;
 		color: #ffffff;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
	}
	.panel2{
		display: none;
		background-color: #22c55e;
 		color: #ffffff;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
	}
	.panel3{
		display: none;
		background-color: #22c55e;
 		color: #ffffff;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
	}
	
	#alarmIcon{
		display:inline;
		background-color: #22c55e;
 		color: #ffffff;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
	}
	
	.beforeAlarm{
		display: none;	
	}
	.alarmList{
		display: none;
		background-color: #22c55e;
 		color: #ffffff;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;	
	}
	
	.menu{
		display:inline;
	}
	
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	${sessionScope.loginId} 님 안녕하세요 ? / 새 알림 : <span id="alarmCount2"> ${sessionScope.alarmCount}</span> 개 <br/><br/>
	
	<a href="./"><img width="100" src="/photo/HBL.png"/></a>
	<br/><br/><br/>
	
	<div class="menu">
		<div id="profileIcon">프로필</div>
		<div class="panel2" onclick="location.href='login.go'">로그인</div>
		<div class="panel" onclick="location.href='logout.go'">로그아웃</div>
		<div class="panel" onclick="location.href='pwChk.go'">마이페이지</div>
		<div class="panel" onclick="location.href='myBoardList.go'">작성한 글/댓글</div>
		<div class="panel">참여한 모임</div>
		<div class="panel">쪽지방</div>
		<div class="panel">즐겨찾기</div>
		<div class="panel3" onclick="location.href='admin.go'">관리자</div>
	</div>
	
	<div class="menu">
		<div id="alarmIcon">알림</div>
		<div id="beforeAlarm" class="beforeAlarm">
			<input type="button" value="알림 읽음 처리" onclick="alarmListRead()"/>
			<input type="button" value="이전 알림 보기" onclick="location.href='beforeAlarm.go'"/>	
		</div>
	</div>
	<div class="menu">
		<input type="button" value="취미 모임" onclick="location.href='glist.go'"/>
		<input type="button" value="프로필" onclick="location.href='profile.go'"/>
		<input type="button" value="랜덤 매칭" onclick="location.href='randomList.go'"/>
		<input type="button" value="랜덤 매칭" onclick="location.href='noNameList.go'"/>
		<input type="button" value="자유 게시판" onclick="location.href='flist.go'"/>
		<input type="button" value="고객센터" onclick="location.href='qboard.go'"/>
	</div>
	<br/><br/><br/>

	
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
	})
	
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
			type:'post',
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
		if(alarmList && alarmList.length){
			var content = '';
			alarmList.forEach(function(item,index){
				content += '<div class="alarmList">';
				content += '<input type="checkbox" value="'+item.alarm_no+'"/>';
				content += '<a href="alarmDetail.do?alarm_num='+item.alarm_num+'&alarm_class='+item.alarm_class+'&alarm_no='+item.alarm_no+'">';
				content += item.alarm_title + " / " + item.alarm_content;
				content += '</a></div>';
			});
		    $(content).insertBefore($('#beforeAlarm').parent().find('#beforeAlarm').next());				
		}
	
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
			type:'post',
			url:'alarmListRead.ajax',
			data:{'alarmListRead':checkArr},
			dataType:'json',
			success:function(data){
				console.log(data);
				if(data.success){
					alert(data.msg);
					alarmList();
				}
			},
			error:function(e){
				console.log(e);
			}		
		});		
	}
	
    

</script>

</html>