<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/css.css">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
   table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
   button {
      margin: 5px;
   }
   table{
      width: 500px;
   }
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
   <h3>로그인</h3>
   <table>
      <tr>
         <th>ID</th>
         <td><input type="text" id="id" placeholder="아이디를 입력해주세요 !"></td>
      </tr>
      <tr>
         <th>PW</th>
         <td><input type="password" id="pw" placeholder="비밀번호를 입력해주세요 !"></td>
      </tr>
      <tr>
         <th colspan="2">
            <button onclick="login()">login</button>
            <button onclick="location.href='join.go'">회원가입</button>
            <button onclick="location.href='idFind.go'">아이디 찾기</button>
            <button onclick="location.href='pwFind.go'">비밀번호 찾기</button>
         </th>         
      </tr>
   </table>
</body>
<script>
	function login(){
	   var id = $('#id').val();
	   var pw = $('#pw').val();
	   
	   console.log(id,pw);
	   $.ajax({
	      type:'post',
	      url : 'login.ajax',
	      data:{
	         id:$('#id').val(),
	         pw:$('#pw').val()
	      },
	      dataType:'json',
	      success : function(data){
	         console.log(data);
	         if (data.member != null) {
	        	 alarmList();
	            location.href='./';
	         }else{
	            alert('아이디 또는 비밀번호를 확인해주세요.');
	         }
	         
	      },
	      error:function(e){
	         console.log(e);
	         alert('아이디 또는 비밀번호를 확인해주세요.');
	      }
	   });
	   
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
			cache: false,
			error:function(e){
				console.log(e);
			}
		});	
	}	
	
	function alarmListDraw(alarmList) {
		console.log("alarmList : " + alarmList);
		  var content = '';
		  if (alarmList && alarmList.length) {
		    alarmList.forEach(function(item, index) {
		    	console.log("alarmList : " + alarmList);
		      content += '<div class="alarmList">';
		      content += '<input type="checkbox" value="' + item.alarm_no + '"/>&nbsp;&nbsp;&nbsp;&nbsp;';
		      content += '<a href="alarmDetail.do?alarm_num=' + item.alarm_num + '&alarm_class=' + item.alarm_class + '&alarm_no=' + item.alarm_no + '">';
		      content += '('+ item.alarm_class+')&nbsp;&nbsp;<b>ID</b> : \" ' + item.id_send + ' \" &nbsp;&nbsp;&nbsp;<b>제목</b> : \" '
		      			+ item.alarm_title + ' \" &nbsp;&nbsp;&nbsp;<b>내용</b> : \ "' + item.alarm_content;
		      content += ' /" </a></div>';
		      console.log("alarmList : " + alarmList);
		    });
		  } else {
			console.log("alarmList : " + alarmList);
		    content = '<div class="alarmList">새로운 알림이 없습니다.</div>';
		  }
		  
		  // 이전 알림 리스트 요소 삭제
		  $('.alarmList').empty();
		  
		  // 새로운 알림 리스트 요소 생성 및 삽입
		  $(content).insertBefore($('#beforeAlarm').parent().find('#beforeAlarm').next());
		  
		}
</script>
</html>