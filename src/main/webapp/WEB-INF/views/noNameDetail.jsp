<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="resources/css/css.css">

<style>
   table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
</style>

</head>
<body>
   <form action="myp.do" method="post">
      <table>
      
      	<tr>
      		<th>아이디</th>
      		<td>&nbsp;&nbsp;&nbsp;&nbsp;익명&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <th rowspan="3">
            	<input type="button" value="쪽지 보내기" onclick="location.href='msgChat.go?id_receive=${member.id}'"/>
            </th>
      	</tr>
      	<tr>
            <th>나이</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.age}&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      	<tr>
            <th>성별</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.gender}&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      	<tr>
            <th>지역</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.area}&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <th rowspan="2">
      			<input type="button" value="프로필 신고" onclick="location.href='./report.go'"/>
      		</th>
      	</tr>
      	<tr>
            <th>취미</th>
            <td id="myHobbyList"></td>
      	</tr>
      	<tr>
            <th>매너온도</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.mannertp}&nbsp;&nbsp;&nbsp;&nbsp;</td>
<!--             <th rowspan="2">
      			<input type="button" value="뒤로가기" onclick="redirect:/profile.go"/>
      		</th> -->
      	</tr>
      	<tr>
            <th>자기소개</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.intr}&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      </table>
      
      <br/>
      <div id="admin">
      <table>
      	<tr>
      		<th>정지 상태</th>
      		<td>&nbsp;&nbsp;&nbsp;&nbsp;${member.ban}&nbsp;&nbsp;&nbsp;&nbsp;</td>
      		<td rowspan="2"><input type="button" value="관리자 설정" onclick="location.href='adminupdate.do?id=${member.id}'"/></td>
      	</tr>
      	<tr>
      		<th>경고 당한 횟수</th>
      		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      	<tr>
      		<th>랜덤매칭 동의 여부</th>
      		<td>&nbsp;&nbsp;${member.random}&nbsp;&nbsp;</td>
      		<td><input type="button" value="회원 정지" onclick="location.href='banupdate.do?id=${member.id}'"/></td>         
      	</tr>
      </table>
	</div>
   </form>
</body>

<script>

	var adminChk = "${sessionScope.adminChk}";
	
	
	if (adminChk === 'true') {
	    document.getElementById('admin').style.display = 'block';
	} else {
	    document.getElementById('admin').style.display = 'none';
	}
	
	var member_id = "${member.id}";
	HobbyList();
	function HobbyList(){
		console.log("member_id : " + member_id);
		$.ajax({
			type:'get',
			url:'myHobbyList.ajax',
			data:{id:member_id},
			dataType:'json',
			success:function(data){
				console.log("data, myHobbyList : " + data.myHobbyList);
				console.log("data, login : " + data.login);
				if(!data.login){
					alert('로그인이 필요한 서비스 입니다.');
					location.href='./';
				}else{
					myHobbyListDraw(data.myHobbyList);
				}
			},
			error:function(e){
				console.log(e);
			}
		});	
	}
	
	
	function myHobbyListDraw(myHobbyList){
		console.log("myHobbyList : " + myHobbyList);
		var content = '';
		myHobbyList.forEach(function(item,index){
			content+= item.big_hb + " / " + item.small_hb + "<br/>" ;
			console.log(item.my_hobby_no);
		});
		
		$('#myHobbyList').empty();
		$('#myHobbyList').append(content);
	}
</script>
</html>